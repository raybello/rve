# RVE - RISC-V Emulator

[![CI](https://github.com/raybello/rve/actions/workflows/ci.yml/badge.svg)](https://github.com/raybello/rve/actions/workflows/ci.yml)

Cross platform RISC-V simulator

- Web demo: https://raybello.github.io/rve/demo/
## Setup

```sh
git clone --recurse-submodules -j8 https://github.com/RayBello/rve.git
cd rve
```

Or:

```sh
git clone https://github.com/RayBello/rve.git
cd rve
git submodule update --init --recursive
```

---

## Building Locally

**Dependencies:** `g++`, `SDL2`, `OpenGL`

On macOS:
```sh
brew install sdl2
```

On Linux:
```sh
apt install libsdl2-dev libgl1-mesa-dev libglu1-mesa-dev build-essential \
    git bc bison flex libssl-dev libelf-dev cpio rsync unzip \
    python3 ca-certificates wget curl xz-utils \
    file ccache ninja-build libncurses-dev device-tree-compiler
```

**Build and run:**
```sh
make run          # build and launch GUI
make all          # build only
make rerun        # clean, build, and run
```

**Run ISA tests:**
```sh
make isas         # rv32 u{i,m,a,f,d} tests, headless; prints PASS/FAIL/TIMEOUT per test
make isas64       # rv64 u{i,m,a,f,d} physical (-p-) tests + rve directed tests (rve/tests/rv64)
make isas64-v     # rv64 tests under Sv39 virtual memory (-v-)
make isas-all     # all of the above; exits non-zero on any failure
make isa ISA_TEST=rv32ui-p-add   # run a single test in the GUI
```

**RV64 build:** `make XLEN=64` (in `rve/`) builds `build64/rve64`, a 64-bit RV64IMAFD core with Sv39
(same source tree as the RV32 `build/rve`). The headless test runner is also usable directly:
```sh
rve/build64/rve64 -n -t -e rve/assets/isa-test-rv64/rv64ui-p-add   # exit 0=pass, 1=fail, 2=timeout
rve/build64/rve64 -n -t -T -e <test>                                # -T traces every instruction
```

**Compile rv64 ISA tests from source** (optional — pre-built binaries included): `make isa-tests64`
(needs `riscv64-elf-gcc` from brew or `gcc-riscv64-unknown-elf` from apt).

**Compile rv32imafd ISA tests from source** (optional — pre-built binaries included):

On macOS, install the RISC-V toolchain:
```sh
brew install riscv64-elf-gcc
```

Then build and install the tests:
```sh
cd riscv-tests
./configure --with-xlen=32
make isa
cp isa/rv32u{i,m,a,f,d}-p-* ../rve/assets/isa-test/
```

**Build toolchain and compile linux**
- Note: Ensure you're using wget1 instead of wget2['passive-ftp' is not supported]
```sh
sudo git clone https://github.com/raybello/buildroot.git --recurse-submodules --depth 1 /opt/buildroot
make -f docker/container.mk WORKDIR=. OUTPUT=rve/assets/linux build
```

---

## Building for Web (Emscripten)

**Dependencies:** [Emscripten SDK](https://emscripten.org/docs/getting_started/downloads.html)

Activate the Emscripten environment first:
```sh
source /path/to/emsdk/emsdk_env.sh
```

Then build and serve:
```sh
make web
```

This compiles to `rve/web/` (`index.html`, `index.js`, `index.wasm`) and starts a local HTTP server on port 8000.

To build without serving:
```sh
cd rve && make -f Makefile.emscripten
```

The hosted demo (`docs/demo/`) is the RV64 build: it boots the OpenSBI + Sv39 Linux image (`rve/assets/linux64/Image`, build it first with `make build ARCH=rv64`). To rebuild it:
```sh
cd rve && make -f Makefile.emscripten XLEN=64   # writes rve/web64/
cp web64/index.{html,js,wasm,data} ../docs/demo/
```

### Networking in the web build

The RV64 guest has a virtio-net NIC (`virtio-mmio` at `0x10002000`, PLIC source 1) wired to a userspace
network stack that lives inside the emulator (`rve/src/usernet.cpp`). Because a browser page can only use
`fetch`, the stack is deliberately limited (guest `10.0.2.15`, gateway `10.0.2.2`, DNS `10.0.2.3`):

| Works | How |
|-------|-----|
| DHCP (`udhcpc`, runs at boot), ARP | emulated locally |
| DNS (`nslookup`, `ping name`) | forwarded as DNS-over-HTTPS (Cloudflare, falling back to Google) |
| `ping` | answered locally for the gateway and for hosts DNS has resolved. It is **not** a real ICMP round trip; other addresses get "host unreachable" |
| `wget http://host/path` | TCP on port 80 is terminated in the stack; the HTTP request is replayed with `fetch("https://host/path")`. Only hosts that send CORS headers work, anything else returns a 502 explaining why |

Not supported in the browser: HTTPS from the guest, ssh and any other TCP/UDP.

### Networking in native builds

Native builds (GUI and headless) plug the same virtio-net NIC into the machine's real network
(`rve/src/nativehost.cpp`), so there are no browser limits:

| Guest does | Host does |
|------------|-----------|
| any TCP connection (ssh, HTTP on any port, ...) | proxied byte-for-byte through a real socket |
| DNS (`nslookup`, name lookups) | system resolver (`getaddrinfo`); `localhost` is shown as `10.0.2.2` |
| `ping` | real ICMP echo via an unprivileged ICMP socket |
| talking to `10.0.2.2` | reaches services on the host's loopback (e.g. `wget http://10.0.2.2:8000/`) |

It is on by default. `--no-net` disconnects the NIC, `-F` selects the deterministic fake host the tests use.
Guest UDP other than DNS is not forwarded, and the stock image has no TLS client, so use plain HTTP/ssh from the guest.

**Tests** (also run in CI):
```sh
make -C rve net-test        # virtio-net device, PLIC, network stack and native-host (real loopback sockets) tests (+ the Unix-socket pair test)
make -C rve isas64          # includes rve's guest-driven virtio-net test (rv64mi-p-virtio-net)
node scripts/net_e2e.mjs          # boots the rv64 Linux image and checks DHCP, DNS, ping and wget (needs rve/assets/linux64/Image)
node scripts/net_e2e.mjs --host   # same, on the machine's real network against local echo/HTTP servers (E2E_INTERNET=1 adds example.com and 8.8.8.8)
```
The `net_e2e` job in `.github/workflows/net-e2e.yml` builds the rv64 image from source first, so it only runs when
networking-related files change (or on demand).

---

## Profiling

Native builds include a real-time profiler (on by default, `make PROFILE=0` compiles it out completely;
the web build leaves it off unless you pass `PROFILE=1` to `Makefile.emscripten`). Open it from the GUI
with **Views > Profiler**. It is built on ImPlot and updates a few times a second (sampling period and
history length are adjustable, **Pause** freezes the charts for inspection, **Reset totals** re-baselines
the numbers, **Export CSV** dumps the rate history).

| Tab | What it shows |
|---|---|
| Overview | MIPS (now / average), instructions retired, loads+stores per 1k instructions, branch-taken %, frame time split into emulation vs UI |
| Instructions | Instruction mix by class (ALU, MUL, DIV, load, store, branch, JAL/JALR, CSR, atomic, FP, system, fence), counts, shares, rates over time |
| Memory | Guest reads/writes per second, accesses by width, RAM vs MMIO, MMIO traffic per device, bytes moved, page-table reads |
| MMU & Traps | Page-table walks and faults by access type, PTE reads per walk, exceptions and interrupts by cause, LR/SC success |
| Devices | UART bytes, host stdin polls, virtio-net frames and servicing passes |
| Host time | Sampled cost of each `emulate()` stage (fetch, decode+execute, timers, devices, trap entry) in ns/instruction, and U/S/M privilege residency |
| Hotspots | Sampled top program counters, top functions (symbolized when an ELF is loaded), hot 4 KiB pages, address-space heat map |

**How it works.** Event counters (`ProfCounters` in `rve/include/profiler.h`) are plain integers bumped
from the emulator hot path; there are no atomics because the emulator and the UI share one thread.
Instruction fetch, page-table-walker reads and debugger/UI reads never count as guest data accesses.
The host-time and hotspot views are *statistical*: one instruction in 4093 (a prime, so it cannot
lock step with the emulator's own 1024-instruction periodic work) runs a timed copy of `emulate()`
and records the stage times and the program counter. All other instructions run an untimed copy
that contains no timing code. The host-time numbers are estimates and should be read as *shares*, not absolute
nanoseconds: the timed copy runs once per 4093 instructions, so its code is cold in the instruction cache and
each stage looks slower than it is on the untimed path, and the stages cost less than the host timer tick.

**Overhead.** With everything on, roughly 4 % on an rv32 Linux boot and 5-8 % on rv64 (where every guest memory
access is translated and counted). `make PROFILE=0` compiles all of it out.

**Headless.** The same counters are available without the GUI:

```sh
./build/rve -n -F -t -c 50000000 -b build/Image --profile            # JSON summary on stderr at exit
./build/rve -n -F -t -e prog.elf --profile-out prof.json             # ... or to a file (ELF symbols are used)
./build/rve -n -F -t -e prog.elf --profile-check                     # verify counter invariants, exit 3 on violation
make prof-test                                                       # unit tests + invariant checks on ISA tests and Linux boots
```

## Performance

The interpreter was profiled with the profiler above plus Instruments, and optimised without changing behaviour
(all ISA suites, the network tests, byte-identical console output for Linux boots and identical CPU/RAM state after
3M instructions on both cores). What changed, roughly in order of payoff:

- **Link-time optimisation** (`make LTO=0` to disable): lets the tiny memory/CSR fast paths inline across files.
- **Device/interrupt servicing off the per-instruction path**: idle UART, virtio-net and interrupt checks are a few
  flag tests, and their bodies (syscalls, stdio, network) are out of line so they no longer bloat the interpreter loop.
  The host-terminal poll (`ioctl`) is rate limited to once per millisecond of wall time and UART output is flushed on
  that tick instead of once per character. virtio-net/PLIC state is re-evaluated only when the guest touches it.
  Interrupt delivery is only attempted when an interrupt could actually be taken (`RV32::irqPossible()`).
- **Software TLB** for the MMU (rv64 Sv39 / rv32 Sv32): direct-mapped per access type, flushed on `satp` writes and
  `sfence.vma`, tagged with privilege/SUM/MXR, filled only after a fully checked walk. 99.9 % hit rate on a Linux boot.
- **Inline fast path** in `emulate()` for the hottest integer instructions (same handlers and encodings as `insSelect`),
  opcode-first decode for the rest, `memcpy` word accesses, lazily committed guest RAM.

Measured on Apple silicon (`-O2`, best of several runs, Linux boots with the fake network host, profiling compiled in):

| Workload | Before | After | Speed-up |
|---|---|---|---|
| rv32 nommu Linux boot (30M instructions) | 0.86 s | 0.45 s | 1.9x |
| rv64 OpenSBI + Sv39 Linux boot (60M instructions) | 2.24 s | 0.99 s | 2.3x |
| rv64 Linux, 250M instructions (boot + idle userland) | 19 MIPS | 59 MIPS | 3.1x |
| Start-up (`-c 1`), rv32 / rv64 | 19 / 27 ms | 10 / 18 ms | |

With `make PROFILE=0` the same builds reach 0.43 s, 0.94 s and 64 MIPS. `make prof-test`,
`./build/rve -n -t -c N -b Image --profile` (JSON with wall time and MIPS) and the profiler window are the tools to
re-measure with. See `rve/Perf.md` for the plan and what is left.

## Building Linux with Docker

The Linux kernel image (rv32nommu) is built inside a Docker container using Buildroot.

**1. Build the Docker image:**
```sh
make image
```

**2. Start a persistent build container:**
```sh
make container
```

**3. Build the Linux kernel image:**
```sh
make build
```

This compiles the kernel inside the container and copies the resulting `Image` to `rve/assets/linux/Image`, then launches the emulator with it.

**Other container commands:**
```sh
make shell    # open a bash shell inside the running container
make stop     # stop and remove the container
```

### RV64 Linux (Sv39 MMU + OpenSBI)

`ARCH=rv64` builds a full-MMU 64-bit image instead of the nommu RV32 one. It boots the way QEMU `virt` does:
OpenSBI (M-mode firmware) at `0x80000000` jumps to a Linux kernel running in S-mode at `0x80200000`, with the
root filesystem embedded as an initramfs. Userland is musl + busybox + **vim** (vim needs an MMU, so it is
only in the rv64 image) plus the demo apps from `hello_linux/` (`/root/{hello_linux,pi,framebuff}`). It runs on the RV64 emulator core (`make XLEN=64`, binary `rve64`).

```sh
make image && make container        # as above
make build ARCH=rv64                # toolchain + OpenSBI + kernel + rootfs, then launches rve64
make lnx ARCH=rv64                  # run rve/assets/linux64/Image with the GUI (or: make lnx64)
make linuxn64                       # run it headless on the terminal
make config-save64                  # copy the container's kernel .config back to configs/rv64/kernel_config
```

Outputs land in `rve/assets/linux64/`: `Image` (OpenSBI padded to 2 MiB + kernel; what `rve64 -b` loads),
`fw_jump.bin` and `kernel-Image`. The rv32 and rv64 builds use separate Buildroot output directories
(`output/` and `output-rv64/`), so both can live in the same container.

| | rv32 (default) | rv64 (`ARCH=rv64`) |
|---|---|---|
| ISA / ABI | rv32im, ilp32, soft-float | rv64imafd, lp64d (no C: rve has no compressed instructions) |
| MMU | none (M-mode nommu) | Sv39, S-mode kernel |
| Firmware | none | OpenSBI 1.3 `generic` (fw_jump) |
| libc | uClibc, static, flat binaries | musl, ELF |
| Device tree | `dts/sixtyfourmb.dts` | `dts/rve64.dts` (`make -C dts rv64` regenerates `rve/include/default_rv64_dtc.h`) |
| Configs | `configs/{buildroot,kernel,busybox,uclibc}_config` | `configs/rv64/{buildroot_defconfig,kernel_config,busybox.fragment}` |
| Custom apps in `/root` | `hello_linux`, `pi`, `framebuff` (flat binaries) | the same three, built by `configs/rv64/post_build.sh` (static musl ELF) |

The Docker base image is pinned to Ubuntu 24.04: newer releases ship GCC 15, which breaks the host tools this
Buildroot version compiles.

**Run Linux directly (downloads a pre-built image):**
```sh
make linux    # download image and run with GUI
make linuxn   # download image and run headless
make lnx      # use local assets/linux/Image and run with GUI
```

---

## Demo

<img src="docs/demo.gif" width="1200">

---

## TODO

- [ ] Enable floating point in the Linux kernel (`CONFIG_FPU`) so userspace programs can use FP instructions without trapping to a software emulation handler

## ISA Test Status

| Suite | Result |
|-------|--------|
| rv32 u{i,m,a,f,d} + mi/si CSR (`make isas32`) | 81/81 |
| rv64 u{i,m,a,f,d}-p (`make isas64`) | 109/109 |
| rv64 u{i,m,a,f,d}-v, Sv39 (`make isas64-v`) | 109/109 |

RV32 detail (`make isas`):

| Test | Description | Status |
|------|-------------|--------|
| rv32mi-p-csr | Machine-mode CSR instructions (csrrw/s/c, FP trap on mstatus.FS=Off) | PASS |
| rv32mi-p-mcsr | Machine-mode CSR registers (mtvec, mscratch, mepc, mstatus) | PASS |
| rv32si-p-csr | Supervisor-mode CSR instructions (sstatus, sscratch, sepc) | PASS |
| rv32ua-p-amoadd\_w | Atomic AMO: ADD word | PASS |
| rv32ua-p-amoand\_w | Atomic AMO: AND word | PASS |
| rv32ua-p-amomax\_w | Atomic AMO: signed MAX word | PASS |
| rv32ua-p-amomaxu\_w | Atomic AMO: unsigned MAXU word | PASS |
| rv32ua-p-amomin\_w | Atomic AMO: signed MIN word | PASS |
| rv32ua-p-amominu\_w | Atomic AMO: unsigned MINU word | PASS |
| rv32ua-p-amoor\_w | Atomic AMO: OR word | PASS |
| rv32ua-p-amoswap\_w | Atomic AMO: SWAP word | PASS |
| rv32ua-p-amoxor\_w | Atomic AMO: XOR word | PASS |
| rv32ua-p-lrsc | Atomic LR/SC (load-reserved / store-conditional) | PASS |
| rv32ud-p-fadd | Double-precision FP add/sub | PASS |
| rv32ud-p-fclass | Double-precision fclass (classify NaN/Inf/zero/normal) | PASS |
| rv32ud-p-fcmp | Double-precision FP compare (feq/flt/fle) | PASS |
| rv32ud-p-fcvt | Double-precision FP ↔ double conversions (fcvt.s.d, fcvt.d.s, NaN canonicalization) | PASS |
| rv32ud-p-fcvt\_w | Double-precision FP ↔ integer conversions (fcvt.w.d, fcvt.wu.d) | PASS |
| rv32ud-p-fdiv | Double-precision FP divide and sqrt | PASS |
| rv32ud-p-fmadd | Double-precision fused multiply-add (fmadd/fmsub/fnmadd/fnmsub) | PASS |
| rv32ud-p-fmin | Double-precision fmin/fmax | PASS |
| rv32ud-p-ldst | Double-precision FP load/store (fld/fsd) | PASS |
| rv32ud-p-recoding | Double-precision NaN/subnormal recoding and NaN-boxing | PASS |
| rv32uf-p-fadd | Single-precision FP add/sub | PASS |
| rv32uf-p-fclass | Single-precision fclass | PASS |
| rv32uf-p-fcmp | Single-precision FP compare (feq/flt/fle) | PASS |
| rv32uf-p-fcvt | Single-precision FP ↔ float conversions | PASS |
| rv32uf-p-fcvt\_w | Single-precision FP ↔ integer conversions (fcvt.w.s, fcvt.wu.s) | PASS |
| rv32uf-p-fdiv | Single-precision FP divide and sqrt | PASS |
| rv32uf-p-fmadd | Single-precision fused multiply-add | PASS |
| rv32uf-p-fmin | Single-precision fmin/fmax | PASS |
| rv32uf-p-ldst | Single-precision FP load/store (flw/fsw) | PASS |
| rv32uf-p-move | FP ↔ integer register moves (fmv.x.w, fmv.w.x) | PASS |
| rv32uf-p-recoding | Single-precision NaN/subnormal recoding and NaN-boxing | PASS |
| rv32ui-p-add | Integer ADD | PASS |
| rv32ui-p-addi | Integer ADDI (add immediate) | PASS |
| rv32ui-p-and | Integer AND | PASS |
| rv32ui-p-andi | Integer ANDI (and immediate) | PASS |
| rv32ui-p-auipc | Add upper immediate to PC (AUIPC) | PASS |
| rv32ui-p-beq | Branch if equal (BEQ) | PASS |
| rv32ui-p-bge | Branch if ≥ signed (BGE) | PASS |
| rv32ui-p-bgeu | Branch if ≥ unsigned (BGEU) | PASS |
| rv32ui-p-blt | Branch if < signed (BLT) | PASS |
| rv32ui-p-bltu | Branch if < unsigned (BLTU) | PASS |
| rv32ui-p-bne | Branch if not equal (BNE) | PASS |
| rv32ui-p-fence\_i | Instruction fence (FENCE.I) | PASS |
| rv32ui-p-jal | Jump and link (JAL) | PASS |
| rv32ui-p-jalr | Jump and link register (JALR) | PASS |
| rv32ui-p-lb | Load byte signed (LB) | PASS |
| rv32ui-p-lbu | Load byte unsigned (LBU) | PASS |
| rv32ui-p-lh | Load halfword signed (LH) | PASS |
| rv32ui-p-lhu | Load halfword unsigned (LHU) | PASS |
| rv32ui-p-lui | Load upper immediate (LUI) | PASS |
| rv32ui-p-lw | Load word (LW) | PASS |
| rv32ui-p-or | Integer OR | PASS |
| rv32ui-p-ori | Integer ORI (or immediate) | PASS |
| rv32ui-p-sb | Store byte (SB) | PASS |
| rv32ui-p-sh | Store halfword (SH) | PASS |
| rv32ui-p-simple | Minimal smoke test (add, branch, ecall) | PASS |
| rv32ui-p-sll | Shift left logical (SLL) | PASS |
| rv32ui-p-slli | Shift left logical immediate (SLLI) | PASS |
| rv32ui-p-slt | Set less than signed (SLT) | PASS |
| rv32ui-p-slti | Set less than immediate signed (SLTI) | PASS |
| rv32ui-p-sltiu | Set less than immediate unsigned (SLTIU) | PASS |
| rv32ui-p-sltu | Set less than unsigned (SLTU) | PASS |
| rv32ui-p-sra | Shift right arithmetic (SRA) | PASS |
| rv32ui-p-srai | Shift right arithmetic immediate (SRAI) | PASS |
| rv32ui-p-srl | Shift right logical (SRL) | PASS |
| rv32ui-p-srli | Shift right logical immediate (SRLI) | PASS |
| rv32ui-p-sub | Integer SUB | PASS |
| rv32ui-p-sw | Store word (SW) | PASS |
| rv32ui-p-xor | Integer XOR | PASS |
| rv32ui-p-xori | Integer XORI (xor immediate) | PASS |
| rv32um-p-div | Integer divide signed (DIV) | PASS |
| rv32um-p-divu | Integer divide unsigned (DIVU) | PASS |
| rv32um-p-mul | Integer multiply low (MUL) | PASS |
| rv32um-p-mulh | Integer multiply high signed (MULH) | PASS |
| rv32um-p-mulhsu | Integer multiply high signed×unsigned (MULHSU) | PASS |
| rv32um-p-mulhu | Integer multiply high unsigned (MULHU) | PASS |
| rv32um-p-rem | Integer remainder signed (REM) | PASS |
| rv32um-p-remu | Integer remainder unsigned (REMU) | PASS |

RV64 detail (`make isas64`; the same tests also run under Sv39 as `rv64*-v-*` via `make isas64-v`, and CI rebuilds them from source in `isa-tests.yml`):

| Test | Description | Status |
|------|-------------|--------|
| rv64ua-p-amoadd\_d | Atomic AMO: ADD doubleword | PASS |
| rv64ua-p-amoadd\_w | Atomic AMO: ADD word | PASS |
| rv64ua-p-amoand\_d | Atomic AMO: AND doubleword | PASS |
| rv64ua-p-amoand\_w | Atomic AMO: AND word | PASS |
| rv64ua-p-amomax\_d | Atomic AMO: signed MAX doubleword | PASS |
| rv64ua-p-amomax\_w | Atomic AMO: signed MAX word | PASS |
| rv64ua-p-amomaxu\_d | Atomic AMO: unsigned MAXU doubleword | PASS |
| rv64ua-p-amomaxu\_w | Atomic AMO: unsigned MAXU word | PASS |
| rv64ua-p-amomin\_d | Atomic AMO: signed MIN doubleword | PASS |
| rv64ua-p-amomin\_w | Atomic AMO: signed MIN word | PASS |
| rv64ua-p-amominu\_d | Atomic AMO: unsigned MINU doubleword | PASS |
| rv64ua-p-amominu\_w | Atomic AMO: unsigned MINU word | PASS |
| rv64ua-p-amoor\_d | Atomic AMO: OR doubleword | PASS |
| rv64ua-p-amoor\_w | Atomic AMO: OR word | PASS |
| rv64ua-p-amoswap\_d | Atomic AMO: SWAP doubleword | PASS |
| rv64ua-p-amoswap\_w | Atomic AMO: SWAP word | PASS |
| rv64ua-p-amoxor\_d | Atomic AMO: XOR doubleword | PASS |
| rv64ua-p-amoxor\_w | Atomic AMO: XOR word | PASS |
| rv64ua-p-lrsc | Atomic LR/SC (load-reserved / store-conditional) | PASS |
| rv64ud-p-fadd | Double-precision FP add/sub | PASS |
| rv64ud-p-fclass | Double-precision fclass (classify NaN/Inf/zero/normal) | PASS |
| rv64ud-p-fcmp | Double-precision FP compare (feq/flt/fle) | PASS |
| rv64ud-p-fcvt | Double-precision FP ↔ double conversions (fcvt.s.d, fcvt.d.s, NaN canonicalization) | PASS |
| rv64ud-p-fcvt\_w | Double-precision FP ↔ integer conversions (fcvt.w/wu/l/lu.d) | PASS |
| rv64ud-p-fdiv | Double-precision FP divide and sqrt | PASS |
| rv64ud-p-fmadd | Double-precision fused multiply-add (fmadd/fmsub/fnmadd/fnmsub) | PASS |
| rv64ud-p-fmin | Double-precision fmin/fmax | PASS |
| rv64ud-p-ldst | Double-precision FP load/store (fld/fsd) | PASS |
| rv64ud-p-move | FP ↔ integer register moves (fmv.x.d, fmv.d.x) | PASS |
| rv64ud-p-recoding | Double-precision NaN/subnormal recoding and NaN-boxing | PASS |
| rv64ud-p-structural | Double-precision FP structural hazards | PASS |
| rv64uf-p-fadd | Single-precision FP add/sub | PASS |
| rv64uf-p-fclass | Single-precision fclass | PASS |
| rv64uf-p-fcmp | Single-precision FP compare (feq/flt/fle) | PASS |
| rv64uf-p-fcvt | Single-precision FP ↔ float conversions | PASS |
| rv64uf-p-fcvt\_w | Single-precision FP ↔ integer conversions (fcvt.w/wu/l/lu.s) | PASS |
| rv64uf-p-fdiv | Single-precision FP divide and sqrt | PASS |
| rv64uf-p-fmadd | Single-precision fused multiply-add | PASS |
| rv64uf-p-fmin | Single-precision fmin/fmax | PASS |
| rv64uf-p-ldst | Single-precision FP load/store (flw/fsw) | PASS |
| rv64uf-p-move | FP ↔ integer register moves (fmv.x.w, fmv.w.x) | PASS |
| rv64uf-p-recoding | Single-precision NaN/subnormal recoding and NaN-boxing | PASS |
| rv64ui-p-add | Integer ADD | PASS |
| rv64ui-p-addi | Integer ADDI (add immediate) | PASS |
| rv64ui-p-addiw | Add immediate word, sign-extended (ADDIW) | PASS |
| rv64ui-p-addw | Integer ADD word, sign-extended (ADDW) | PASS |
| rv64ui-p-and | Integer AND | PASS |
| rv64ui-p-andi | Integer ANDI (and immediate) | PASS |
| rv64ui-p-auipc | Add upper immediate to PC (AUIPC) | PASS |
| rv64ui-p-beq | Branch if equal (BEQ) | PASS |
| rv64ui-p-bge | Branch if ≥ signed (BGE) | PASS |
| rv64ui-p-bgeu | Branch if ≥ unsigned (BGEU) | PASS |
| rv64ui-p-blt | Branch if < signed (BLT) | PASS |
| rv64ui-p-bltu | Branch if < unsigned (BLTU) | PASS |
| rv64ui-p-bne | Branch if not equal (BNE) | PASS |
| rv64ui-p-fence\_i | Instruction fence (FENCE.I) | PASS |
| rv64ui-p-jal | Jump and link (JAL) | PASS |
| rv64ui-p-jalr | Jump and link register (JALR) | PASS |
| rv64ui-p-lb | Load byte signed (LB) | PASS |
| rv64ui-p-lbu | Load byte unsigned (LBU) | PASS |
| rv64ui-p-ld | Load doubleword (LD) | PASS |
| rv64ui-p-ld\_st | Back-to-back load/store doubleword hazards | PASS |
| rv64ui-p-lh | Load halfword signed (LH) | PASS |
| rv64ui-p-lhu | Load halfword unsigned (LHU) | PASS |
| rv64ui-p-lui | Load upper immediate (LUI) | PASS |
| rv64ui-p-lw | Load word (LW) | PASS |
| rv64ui-p-lwu | Load word unsigned (LWU) | PASS |
| rv64ui-p-ma\_data | Misaligned data loads/stores (handled or trapped) | PASS |
| rv64ui-p-or | Integer OR | PASS |
| rv64ui-p-ori | Integer ORI (or immediate) | PASS |
| rv64ui-p-sb | Store byte (SB) | PASS |
| rv64ui-p-sd | Store doubleword (SD) | PASS |
| rv64ui-p-sh | Store halfword (SH) | PASS |
| rv64ui-p-simple | Minimal smoke test (add, branch, ecall) | PASS |
| rv64ui-p-sll | Shift left logical (SLL) | PASS |
| rv64ui-p-slli | Shift left logical immediate (SLLI) | PASS |
| rv64ui-p-slliw | Shift left logical immediate word (SLLIW) | PASS |
| rv64ui-p-sllw | Shift left logical word (SLLW) | PASS |
| rv64ui-p-slt | Set less than signed (SLT) | PASS |
| rv64ui-p-slti | Set less than immediate signed (SLTI) | PASS |
| rv64ui-p-sltiu | Set less than immediate unsigned (SLTIU) | PASS |
| rv64ui-p-sltu | Set less than unsigned (SLTU) | PASS |
| rv64ui-p-sra | Shift right arithmetic (SRA) | PASS |
| rv64ui-p-srai | Shift right arithmetic immediate (SRAI) | PASS |
| rv64ui-p-sraiw | Shift right arithmetic immediate word (SRAIW) | PASS |
| rv64ui-p-sraw | Shift right arithmetic word (SRAW) | PASS |
| rv64ui-p-srl | Shift right logical (SRL) | PASS |
| rv64ui-p-srli | Shift right logical immediate (SRLI) | PASS |
| rv64ui-p-srliw | Shift right logical immediate word (SRLIW) | PASS |
| rv64ui-p-srlw | Shift right logical word (SRLW) | PASS |
| rv64ui-p-st\_ld | Back-to-back store/load doubleword hazards | PASS |
| rv64ui-p-sub | Integer SUB | PASS |
| rv64ui-p-subw | Integer SUB word, sign-extended (SUBW) | PASS |
| rv64ui-p-sw | Store word (SW) | PASS |
| rv64ui-p-xor | Integer XOR | PASS |
| rv64ui-p-xori | Integer XORI (xor immediate) | PASS |
| rv64um-p-div | Integer divide signed (DIV) | PASS |
| rv64um-p-divu | Integer divide unsigned (DIVU) | PASS |
| rv64um-p-divuw | Integer divide unsigned word (DIVUW) | PASS |
| rv64um-p-divw | Integer divide signed word (DIVW) | PASS |
| rv64um-p-mul | Integer multiply low (MUL) | PASS |
| rv64um-p-mulh | Integer multiply high signed (MULH) | PASS |
| rv64um-p-mulhsu | Integer multiply high signed×unsigned (MULHSU) | PASS |
| rv64um-p-mulhu | Integer multiply high unsigned (MULHU) | PASS |
| rv64um-p-mulw | Integer multiply word (MULW) | PASS |
| rv64um-p-rem | Integer remainder signed (REM) | PASS |
| rv64um-p-remu | Integer remainder unsigned (REMU) | PASS |
| rv64um-p-remuw | Integer remainder unsigned word (REMUW) | PASS |
| rv64um-p-remw | Integer remainder signed word (REMW) | PASS |
| rv64mi-p-csr-warl | rve custom: satp/mstatus WARL behaviour (`rve/tests/rv64`) | PASS |
