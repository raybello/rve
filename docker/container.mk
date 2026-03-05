SRC=/opt/riscv32_linux_from_scratch
WORKDIR=/workspace/project
OUTPUT=workspace/output

JOBS=$(shell nproc)

.PHONY: build toolchain buildroot linux
build: toolchain buildroot linux
	cd $(WORKDIR)
	echo "Building Linux for RISC-V with $(JOBS) parallel jobs..."

toolchain:
	cd $(WORKDIR)
	echo "Setting up toolchain..."

buildroot:
	cd $(WORKDIR)
	echo "Setting up Buildroot..."

linux:
	cd $(WORKDIR)
	echo "Building Linux kernel..."

