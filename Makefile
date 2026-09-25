ROOT_DIR = $(shell pwd)
CCACHE=$(ROOT_DIR)/.ccache
OUTPUT_DIR = $(ROOT_DIR)/rve/assets/linux
IMAGE=rve-linux
CONTAINER_NAME=rve-linux-build

# ARCH=rv32 (default): nommu RV32 kernel.  ARCH=rv64: Sv39 RV64 kernel + OpenSBI
# (built into rve/assets/linux64/ and run with rve64).  Example: make build ARCH=rv64
ARCH ?= rv32

all:
	make -C rve

rerun:
	make -C rve rerun

run:
	make -C rve run

isa:
	make -C rve isa ISA_TEST=rv32ua-p-lrsc

isas:
	make -C rve isas

isas32:
	make -C rve isas32

isas64:
	make -C rve isas64

isas64-v:
	make -C rve isas64-v

isas-all:
	make -C rve isas-all

isa-tests64:
	scripts/build_isa64.sh
	scripts/build_isa64.sh rve/assets/isa-test-rv64-v --virtual
	scripts/build_isa64.sh rve/assets/isa-test-rv64-rve --custom

linux:
	make -C rve linux

linuxn:
	make -C rve linuxn

lnx:
ifeq ($(ARCH),rv64)
	make -C rve lnx64
else
	make -C rve lnx
endif

lnx64:
	make -C rve lnx64

linuxn64:
	make -C rve linuxn64

web:
	make -C rve web

clean:
	make -C rve clean

# Build the Docker image
image:
	docker build -t $(IMAGE) -f docker/Dockerfile docker

# Start a persistent build container (keeps buildroot output between builds)
container:
	mkdir -p $(CCACHE)
	mkdir -p $(OUTPUT_DIR)
	docker run -d \
		--name $(CONTAINER_NAME) \
		-v $(ROOT_DIR):/workspace/project \
		-v $(OUTPUT_DIR):/workspace/output \
		-v $(CCACHE):/ccache \
		-w /workspace/project \
		$(IMAGE) \
		sleep infinity

# Copy configs and build inside the running container (incremental)
build:
	docker exec $(CONTAINER_NAME) make -f docker/container.mk build RVE_ARCH=$(ARCH)
ifeq ($(ARCH),rv64)
	make -C rve lnx64
else
	make -C rve lnx
endif

# Save the rv64 kernel .config from the container back into configs/rv64/kernel_config
config-save64:
	docker exec $(CONTAINER_NAME) make -f docker/container.mk config-save64

# Stop and remove the container (next 'make container' starts fresh)
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) bash

qemu:
	@which qemu-system-riscv32 > /dev/null || (echo "qemu-system-riscv32 not found. Please install QEMU with RISC-V support." && exit 1)
	qemu-system-riscv32 -cpu rv32,mmu=false -m 128M -machine virt -nographic -kernel rve/build/Image -bios none


