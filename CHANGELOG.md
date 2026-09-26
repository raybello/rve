# Changelog

## [v2026.09.26.2] - 2026-09-26

- Merge pull request #15 from raybello/framebuff-all
- framebuff: add 'all' flag to run patterns 1-10 in order, one second apart


## [v2026.09.26.1] - 2026-09-26

- Merge pull request #14 from raybello/profiling
- Performance: LTO, TLB, event-driven devices and an inline fast path (1.9-3.1x)
- Profiler: CSV export, headless --profile/--profile-check, tests, docs, CI
- Profiler hotspots: sampled PC histogram, top functions/PCs/pages, heat map, ELF symbols
- Profiler: sampled host-time breakdown per emulate() stage and privilege residency
- Profiler window: rate history and ImPlot charts (Overview, Instructions, Memory, MMU & Traps, Devices)
- Profiler counters: instruction mix, memory traffic, MMIO devices, MMU, traps, atomics
- Profiler scaffolding: RVE_PROFILE build flag, header, Views > Profiler window shell


## [v2026.09.26] - 2026-09-26

- Merge pull request #13 from raybello/web-networking
- Native networking: real host network backend (TCP proxy, system DNS, ICMP)
- Rebuild demo with networking; DNS ordering fix, header dependency tracking, wasm ISA skip list
- Wire the userspace network stack: netsetup, -F flag, browser host (fetch/DoH), tests and CI
- Add userspace network stack (ARP/DHCP/DNS/ICMP/TCP->HTTP), rv64 DT + kernel/rootfs networking config
- Add virtio-mmio net device, minimal PLIC and NetBackend interface
- gitignore: ignore web64 build output and .DS_Store


## [v2026.09.25.1] - 2026-09-25

- Merge pull request #12 from raybello/web-demo-rv64
- Fix disassembler showing 'illegal' for rv64: translate the virtual pc before fetching
- Web demo: switch the emscripten build to RV64 (OpenSBI + Sv39 Linux)


## [v2026.09.25] - 2026-09-25

- Merge pull request #11 from raybello/fix/ci-gha-cache-reserve
- CI: don't fail Build Linux Image when the GHA layer-cache export can't reserve a slot
- Merge pull request #10 from raybello/rv64-port
- README: add RV64 ISA test detail table
- Make fcvt.w/wu conversions independent of host cast lowering (fixes x86 rv64 fcvt_w ISA failures)
- Canonicalize NaN results of FP arithmetic (fixes x86 fadd/fdiv ISA failures)
- Merge origin/master into rv64-port
- rv64 Linux image: OpenSBI without C, busybox/tc fix, custom apps, web/git excludes
- Fix emulator bugs found booting OpenSBI + RV64 Linux
- RV64 Linux option: Buildroot defconfig, Sv39 kernel config, OpenSBI, ARCH=rv64 docker build
- Emscripten: RV64 web build, wasm ISA runner, larger wasm stack
- Phase 7: RV64 test suites, Sv39 -v- variants, directed CSR tests, CI
- Phases 1-6: xlen_t refactor and RV64IMAFD core (Sv39 included)
- Phase 0: headless ISA test runner, ELF64 loader, rv64 test corpus


## [v2026.06.09.2] - 2026-06-09

- Merge pull request #9 from raybello/feature/add-todo-fp-linux
- Add CI status badge to README
- Update web build


## [v2026.06.09.1] - 2026-06-09

- Merge pull request #8 from raybello/feature/add-todo-fp-linux
- Add TODO: enable floating point in Linux kernel
- Fix rve binaries missing from release uploads


## [v2026.06.09] - 2026-06-09

- Merge pull request #7 from raybello/feature/initial-release
- Clean up documentation
- Remove Windows from rve release builds
- Merge pull request #6 from raybello/enhancement/regen-linux
- UI refactor and regenerate Linux
- removed artifacts from repo
- Added latest Image, updated .gitignore
- Run tests on push to master and on PRs
- Replace macos-x86_64 with windows-x86_64 in release matrix
- Merge pull request #5 from raybello/feature/ci-pr-merge-release
- Update CI to release on PR merge with multi-platform rve builds
- Merge pull request #4 from raybello/feature/ci-release
- Add CI/release pipeline with parallel tests, Docker build, and auto-release
- - Pin docker container to ubuntu:22.04 + Docker ccache permission fixes
- Merge pull request #3 from raybello/feature/networking
- Add net pair test and GitHub Actions CI
- Merge pull request #2 from raybello/feature/networking
- Add Unix-socket networking and ISA test exit support
- updating kernel
- increased framebuff
- update emulate to boot linux by default
- added web linux
- added rve-kbd driver
- added linux consolebuffer
- Readme update
- added spinning 3d cube
- updated dts


All notable changes to this project will be documented here.
