SRC=/opt/riscv32_linux_from_scratch
WORKDIR=/workspace/project
OUTPUT=workspace/output

JOBS=$(shell nproc)
BR2_TAR_OPTIONS ?= --no-same-owner

.PHONY: build toolchain linux
build: toolchain linux
	cd $(WORKDIR)
	echo "Building Linux for RISC-V with $(JOBS) parallel jobs..."

toolchain:
	cd $(WORKDIR)
	echo "Setting up toolchain..."
	git clone https://github.com/raybello/buildroot.git --recurse-submodules --depth 1
	cp -a configs/custom_kernel_config buildroot/kernel_config
	cp -a configs/buildroot_config buildroot/.config
	cp -a configs/busybox_config buildroot/busybox_config
	cp -a configs/uclibc_config buildroot/uclibc_config
	cp -a configs/uclibc_config buildroot/uclibc_config_extra
	make -C buildroot BR2_TAR_OPTIONS="$(BR2_TAR_OPTIONS)" -j$(JOBS)
	cp -a configs/rootfsoverlay/* buildroot/output/target/

linux:
	cd $(WORKDIR)
	echo "Building Linux kernel..."
	cp -a configs/rootfsoverlay/* buildroot/output/target/
	make -C buildroot BR2_TAR_OPTIONS="$(BR2_TAR_OPTIONS)" -j$(JOBS)
	cp -a buildroot/output/images/Image $(OUTPUT)/

