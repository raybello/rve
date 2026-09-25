# RVE - RISC-V Emulator
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
rve/build64/rve64 -n -t -s -e <test>                                # -s traces every instruction
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

---

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
only in the rv64 image). It runs on the RV64 emulator core (`make XLEN=64`, binary `rve64`).

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
| Configs | `configs/{buildroot,kernel,busybox,uclibc}_config` | `configs/rv64/{buildroot_defconfig,kernel_config}` |

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
