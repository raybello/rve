# SRC=/opt/riscv32_linux_from_scratch
SRC=/opt/buildroot
WORKDIR=/workspace/project
OUTPUT=/workspace/output
JOBS=$(shell nproc)

.PHONY: build toolchain linux

build: toolchain linux

toolchain: 
	cd $(WORKDIR) && \
	echo "Setting up toolchain..." && \
	cp -a configs/custom_kernel_config $(SRC)/kernel_config && \
	cp -a configs/buildroot_config $(SRC)/.config && \
	cp -a configs/busybox_config $(SRC)/busybox_config && \
	cp -a configs/uclibc_config $(SRC)/uclibc_config && \
	cp -a configs/uclibc_config $(SRC)/uclibc_config_extra && \
	make -C $(SRC) -j$(JOBS)

linux:
	cd $(WORKDIR) && \
	echo "Building Linux kernel..." && \
	cp -a configs/rootfsoverlay/* $(SRC)/output/target/ && \
	make -C $(SRC) -j$(JOBS) && \
	cp -f $(SRC)/output/images/Image $(OUTPUT)/