# RVE - RISC-V Emulator
Cross platform RISC-V simulator

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
apt install libsdl2-dev libgl-dev
```

**Build and run:**
```sh
make run          # build and launch GUI
make all          # build only
make rerun        # clean, build, and run
```

**Run ISA tests:**
```sh
make isas         # run all rv32u{i,m,a} ISA tests
make isa ISA_TEST=rv32ui-p-add   # run a single test
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

**Run Linux directly (downloads a pre-built image):**
```sh
make linux    # download image and run with GUI
make linuxn   # download image and run headless
make lnx      # use local assets/linux/Image and run with GUI
```

---

## Demo

<img src="docs/demo.gif" width="1200">
