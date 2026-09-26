# rve performance optimization plan

## Context
rve is an interpreter-style RV32/RV64 emulator (`rve/src/emu.cpp`, `rv32.cpp`). The earlier
2026-02 pass fixed the obvious bottlenecks (RAM fast-paths in `memGet*`/`memSet*`, UART poll
interval, throttled `gettimeofday`, `-O2`). A read-through of the hot path shows that the
remaining cost is structural: every emulated instruction pays for a full decode of all
formats, a chain of masked `switch`es, an out-of-line fetch/MMU/memory call across
translation units, and a full device/interrupt service sequence built on `readCsrRaw()`
switch lookups. The goal is a large, measurable MIPS gain (target 3-5x on rv32 nommu Linux,
more on rv64 with MMU on) with zero behavioural change (ISA tests + Linux boot + net tests
stay green).

## Findings (where time goes, in rough order of cost)

1. **Decode does all the work up front** — `Emulator::insSelect` (emu.cpp:1409) calls all 8
   `parse_Format*` on every instruction, memsets an `ins_ret` (`insReturnNoop`), then walks
   up to 4 sequential `switch (ins_word & mask)` blocks; the `run()` macro tests `debugMode`
   per case. Result is returned by value (Trap + write_reg/val + csr fields).
2. **No cross-TU inlining** — `emu.cpp` handlers call `cpu.memGetWord`, `mmuTranslate`,
   `readCsrRaw` defined in `rv32.cpp`; the Makefile has no `-flto`, so none of the tiny
   fast-paths can inline. `Makefile.emscripten` builds with `-Os` (size, not speed).
3. **Per-instruction "slow path" tail in `Emulator::emulate()`** (emu.cpp:1806-1938) runs
   unconditionally every instruction: CLINT msip check, mtimecmp compare, `netTick()`,
   `uartTick()` (UART_GET/SET bit macros), two `readCsrRaw(CSR_MIP)` calls, and
   `handleIrqAndTrap()` which does `readCsrRaw(MIP)` + `readCsrRaw(MIE)` (each a large
   `switch`) even when nothing is pending; plus syscon and test-mode checks.
4. **`emulate()` is a per-instruction call** from `runHeadless` (headless.cpp) and
   `App::stepEmu` (app.cpp:~940); no hoisting of `pc`/`xreg` into locals, no batched loop.
5. **No TLB** — with the MMU on (rv64 OpenSBI+Linux, Sv39) every fetch and every load/store
   runs `mmuTranslate` (rv32.cpp:1001): `readCsrRaw(MSTATUS)` + up to 3 `memGetDword` page
   walks. Fetch also goes through `memGetWord` byte-composing instead of a single load.
6. **Byte-composed word access** — `memGetWord`/`SetWord` build words from 4 byte loads
   (host is little-endian; a `memcpy` is one load).
7. **FP path (rv64)** — `fp_set_rm`/`fp_accum_flags` call `fesetround`/`fetestexcept`/
   `feclearexcept` per FP instruction; `fpStateDirty()` runs on every FP op.
8. **Devices** — `uartTick` does an `ioctl(FIONREAD)` syscall every 1024 instr and
   `printf`+`fflush` per output char; `netTick` calls `readCsrRaw`/PLIC state every
   instruction when virtio-net is active, `vnet.tick()` every 64.
9. **GUI loop** — `SDL_GL_SetSwapInterval(0)` (uncapped) with emulation and ImGui sharing one
   thread in a ~10 ms budget per frame, so the emulator gets only a fraction of wall time.

## Plan (phased; each phase is independently shippable and gated by the same tests)

### Phase 0 — Baseline & guardrails (do first)
- Add a `--bench` (or always-on stderr summary at exit) to `headless.cpp`: instructions
  executed, wall time, MIPS. Reuse `emu.cpp` `cpu.clock` as the instruction counter.
- Record baselines: rv32 `make linux` boot-to-shell time/MIPS, rv64 boot (`XLEN=64`), and
  `hello_linux/pi` (compute-bound). Profile with `perf` (Linux) / Instruments or `sample`
  (macOS) to confirm the ranking above before changing code.
- Correctness gates (run after every phase): `make isas` (rv32 + rv64), `make linux`,
  rv64 Linux boot, the net e2e tests from `.github/workflows/net-e2e.yml`, and compare
  instruction count at a fixed boot marker before/after (determinism check).

### Phase 1 — Build flags (small, low risk, immediate win)
- `rve/Makefile`: `-O3`, `-flto` (compile + link), `-fno-plt`; keep `-g` optional. This
  alone lets `memGetWord`/`mmuTranslate`/`readCsrRaw` inline into the handlers.
- Optional: PGO target (`make pgo`: instrumented Linux boot -> `-fprofile-use`).
- `Makefile.emscripten`: `-Os` -> `-O3` (+ `-flto`) for the wasm demo build.
- Note ISA build does `make clean` + `-DRVE_ISA_TEST`; ensure LTO flags carry through.

### Phase 2 — Interrupt/device servicing off the fast path
Files: `emu.cpp` (`emulate`), `rv32.cpp` (`handleIrqAndTrap`, `netTick`, `uartTick`), `rv32.h`.
- In `handleIrqAndTrap`, early-out with direct `csr.data[CSR_MIP] & csr.data[CSR_MIE]`
  (same values `readCsrRaw` returns via its `default:` case) before any switch lookups;
  only take the slow path when a trap is already raised or an enabled IRQ is pending.
- Replace the two extra `readCsrRaw(CSR_MIP)` calls in `emulate()` with direct
  `csr.data[]` reads / a local.
- Gate `uartTick()` on `uart.thr_pending || (clock & 0x3FF)==0`; gate `netTick()` on a
  dirty flag (PLIC/virtio state changed) or the existing 64-instr cadence.
- MTIP: recompute only when mtime is refreshed (every 1024) or mtimecmp is written, instead
  of a 64-bit compare per instruction. Keep semantics (guard for mtimecmp==0).
- Use `clock_gettime(CLOCK_MONOTONIC)` (cheaper than `gettimeofday`); keep the 1024 cadence.
- Move syscon / test-mode `tohost` checks behind one `slow_flags` check (set by the MMIO
  write to syscon; `tohost` only polled in `test_mode`).

### Phase 3 — Batched run loop + leaner decode
Files: `emu.h`, `emu.cpp`, `headless.cpp`, `app.cpp`.
- Add `Emulator::run(uint64_t max_instr)` — a tight loop that keeps `pc`/`xreg` hot, executes
  the fast path inline, and drops to the existing full `emulate()` tail only when
  `slow_flags` is set or every N (=1024) instructions. `runHeadless` and `App::stepEmu`
  call it in place of per-instruction `emulate()`; step/debug/`-T` trace keep using
  `emulate()` so behaviour there is unchanged.
- Rework `insSelect`: switch once on `ins_word & 0x7f` (opcode), then funct3/funct7 inside;
  parse only the format that opcode needs (drop the eight up-front `parse_Format*`). Keep
  the `imp()` handler bodies unchanged (they take `FormatX`), so the diff is mechanical.
- Stop `memset`-ing `ins_ret` per instruction: initialise only `trap.en`, `write_reg`,
  `csr_write`, `pc_val` (or pass by reference into `emulate`).
- Hoist `debugMode` out of the `run()` macro (compile the trace path only in the non-batched
  `emulate()`).
- Stretch (only if Phase 3 measurements show decode still dominates): a per-page
  predecode cache (pc -> handler ptr + decoded fields) invalidated by `fence.i` and stores
  to executed pages.

### Phase 4 — Memory & MMU
Files: `rv32.h/.cpp`, `emu.cpp`.
- Inline the fast-path: make `mmuTranslate`'s `mmu.mode == OFF` early return an inline
  header function; keep the walker out-of-line.
- Word/half/dword RAM accesses via `memcpy` to/from `mem + phys` (little-endian host; guard
  with a static endianness check for wasm/BE safety), replacing byte-composition.
- **Software TLB** (biggest win for MMU-on rv64/Linux): direct-mapped, e.g. 256 entries x 3
  access kinds (fetch/read/write) storing `{vpn, ppn, perm-checked-for-priv/sum/mxr}`.
  Flush on `satp` write (`mmuUpdate`), `sfence.vma`, and any change to privilege,
  `mstatus.SUM/MXR/MPRV/MPP`. Must not cache when A/D bits would need faulting (Svade:
  only insert after a successful walk; write entries only after D confirmed). Cache
  `mstatus` bits in locals updated on `writeCsrRaw(MSTATUS)` instead of `readCsrRaw` per
  access.
- Instruction-fetch fast path: cache the current code page's host pointer + vpn; refetch
  only on page change / TLB flush.
- Allocate guest RAM with `mmap` (anonymous, zeroed) instead of `malloc` + `memset(128 MiB)`
  in `initializeBin/Elf` (faster startup, lazy commit).

### Phase 5 — FP (rv64) and I/O polish
- `fp_set_rm`: track current host rounding mode and skip `fesetround` when unchanged;
  clear/test flags only for ops that can raise them; skip `fpStateDirty()` when FS is already
  Dirty (check before the write).
- UART: batch stdout output (`write()` on newline / every N ms / on exit) instead of
  `printf`+`fflush` per char; raise FIONREAD poll interval to 4096-8192 instr, or use
  `poll(0)` — verify keyboard latency stays acceptable interactively.
- `nativehost.cpp`/`usernet.cpp`: confirm (via profile) that host socket polling only runs on
  the 64-instr `vnet.tick()` cadence and not per instruction; back off when idle.

### Phase 6 — GUI responsiveness (optional, larger)
- Run the emulator on a worker thread and render ImGui at vsync (`SDL_GL_SetSwapInterval(1)`),
  with a snapshot/lock for the register, disassembly and memory-editor views (`app.cpp`
  `stepEmu`, instruction window ~line 880). Cheaper interim step: enable vsync and raise the
  per-frame emulation budget so the emulator gets most of each frame.

## Critical files
- `rve/src/emu.cpp` — `insSelect`, `emulate`, FP helpers, `imp()` handlers
- `rve/src/rv32.cpp` — `memGet*/memSet*`, `mmuTranslate`, `handleIrqAndTrap`, `uartTick`, `netTick`, `readCsrRaw`
- `rve/include/rv32.h`, `rve/include/emu.h` — inline fast-paths, TLB state, `run()`
- `rve/src/headless.cpp`, `rve/src/app.cpp` — run-loop call sites, bench output
- `rve/Makefile`, `rve/Makefile.emscripten` — optimisation flags / LTO / PGO

## Verification
1. Baseline numbers from Phase 0 recorded in the PR description; re-measure after each phase
   (expect Phase 1 ~+20-40%, Phases 2-3 the bulk of rv32 gains, Phase 4 large on rv64/MMU).
2. `cd rve && make isas` — all rv32u{i,m,a} (and rv64 via `XLEN=64`) ISA tests exit 0.
3. `make linux` — Linux 6.1.14 rv32nommu boots to shell and shuts down cleanly; rv64 image
   boots with MMU on (exercises TLB); interactive keyboard input still responsive.
4. Net e2e workflow scripts (`-F` fake host and native backend) still pass.
5. Determinism: instruction count at a fixed boot marker matches pre-change within timer
   jitter; `-T` trace output unchanged for a short ISA test (guards decode rewrite).
6. Wasm build (`make -f Makefile.emscripten`) still compiles and the demo boots.

## Suggested order / risk
Phase 0 -> 1 -> 2 -> 3 -> 4 -> 5 (Phase 6 only if wanted). Phases 1-2 are low risk; Phase 3
decode rewrite is mechanical but wide; Phase 4 TLB is the subtlest (invalidation
correctness) and must be validated with the rv64 `-v-` virtual-memory ISA tests and Linux.

## Results (implemented 2026-09, commit "Performance: ...")

Baseline = the build before profiling existed; "after" includes the profiler (counters compiled in).

| Workload | Before | After | Speed-up |
|---|---|---|---|
| rv32 nommu Linux boot (30M instr) | 0.86 s | 0.45 s | 1.9x |
| rv64 Sv39 Linux boot (60M instr) | 2.24 s | 0.99 s | 2.3x |
| rv64 Linux, 250M instr (boot + idle) | 19 MIPS | 59 MIPS | 3.1x |

Status by phase:

- **Phase 0** done differently: the profiler's headless `--profile` (JSON with instructions, wall time, MIPS, stage
  costs, hotspots) replaces a separate `--bench`; Instruments' Time Profiler (`xctrace`) confirmed the ranking.
  Correctness gates run after each step: `make isas-all`, `make net-test`, `make prof-test`, `scripts/net_e2e.mjs`
  (fake and native host), console diff of rv32/rv64 Linux boots, CPU/RAM state equality after 1M/3M instructions.
- **Phase 1** done: `-flto` (biggest single win: -21 % rv32, -13 % rv64). `-O3` measured: no gain over `-O2`+LTO, so
  `-O2` stays. PGO not done. `Makefile.emscripten`: `-Os` -> `-O2` (wasm ISA tests pass; wasm speed not measured).
- **Phase 2** done and then some: idle-path early-outs for UART/SEIP/trap entry, cold work out of line
  (`refreshTimers`, `serviceExternalIrq`, `handleSyscon`, `pollTohost`, `netTick`, `uartTick`, `handleIrqAndTrap`),
  interrupt deliverability pre-check, time-based stdin poll and batched UART flush (the `ioctl` poll alone was ~25 % of an
  rv32 boot), event-driven virtio-net/PLIC servicing (rv64 idle 33 -> 59 MIPS). Not done: MTIP recompute only on
  mtime/mtimecmp change (measured at <1 ns/instr), `clock_gettime`.
- **Phase 3** partly: opcode-first decode (`insSelect` regrouped from 14 mask blocks into a `switch` on the major
  opcode, generated mechanically from the old blocks, same order) and an inline `fastDecode()` for the hottest
  instructions (-14 %). Lazy per-format operand parsing. Not done: batched `run(N)` loop, `ins_ret` restructure,
  predecode cache. Marking rare handlers `noinline` measured within noise and was not kept.
- **Phase 4** done for the main items: software TLB, inline TLB-hit/MMU-off path, `memcpy` word/half access, lazily
  committed RAM (`calloc`). Not done: cached code-page host pointer for fetch.
- **Phase 5** partly: UART poll/flush (see above). Not done: FP rounding-mode caching (FP is ~0 % of a Linux boot),
  usernet/nativehost idle back-off.
- **Phase 6** not done.

Method notes: the profiler's sampled per-stage times are biased by the cold-code effect described in the README, so
stages were bisected by compiling variants with parts of the loop removed. Benchmark = best of N wall times of
`-n -F -t -c N -b Image`.
