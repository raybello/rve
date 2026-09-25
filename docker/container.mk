# BUILDROOT=/opt/riscv32_linux_from_scratch
BUILDROOT=/opt/buildroot
HELLO_LINUX=hello_linux
BAREMETAL=baremetal
DTS=dts

WORKDIR=/workspace/project
OUTPUT=/workspace/output
JOBS=$(shell nproc)

# ARCH=rv32 (default): nommu RV32 kernel, output/ in the buildroot tree (existing flow)
# ARCH=rv64          : Sv39 RV64 kernel + OpenSBI, out-of-tree output-rv64/ so both can coexist
ARCH ?= rv32

BR64_OUT=$(BUILDROOT)/output-rv64
IMAGE64_DIR=$(WORKDIR)/rve/assets/linux64

.PHONY: build toolchain linux config64 toolchain64 linux64 config-save64

ifeq ($(ARCH),rv64)
build: toolchain64 linux64
else
build: toolchain linux
endif

config:
	cd $(WORKDIR) && \
	echo "================================" && \
	echo "Copying configuration files..." && \
	echo "================================" && \
	cp -f configs/custom_kernel_config $(BUILDROOT)/kernel_config && \
	cp -f configs/buildroot_config $(BUILDROOT)/.config && \
	cp -f configs/busybox_config $(BUILDROOT)/busybox_config && \
	cp -f configs/uclibc_config $(BUILDROOT)/uclibc_config && \
	cp -f configs/uclibc_config $(BUILDROOT)/uclibc_config_extra

config-save:
	cd $(WORKDIR) && \
	echo "================================" && \
	echo "Saving configuration files..." && \
	echo "================================" && \
	cp -f $(BUILDROOT)/kernel_config configs/custom_kernel_config && \
	cp -f $(BUILDROOT)/.config configs/buildroot_config && \
	cp -f $(BUILDROOT)/busybox_config configs/busybox_config && \
	cp -f $(BUILDROOT)/uclibc_config configs/uclibc_config && \
	cp -f $(BUILDROOT)/uclibc_config_extra configs/uclibc_config

toolchain: config
	cd $(WORKDIR) && \
	echo "================================" && \
	echo "Building toolchain and linux..." && \
	echo "================================" && \
	make -C $(BUILDROOT) -j$(JOBS) && \
	cp -rf configs/rootfsoverlay/* $(BUILDROOT)/output/target/ && \
	echo "================================" && \
	echo "Building programs..." && \
	echo "================================" && \
	make -C $(BAREMETAL) -j$(JOBS) clean && \
	make -C $(BAREMETAL) -j$(JOBS) && \
	make -C $(HELLO_LINUX) -j$(JOBS) clean && \
	make -C $(HELLO_LINUX) -j$(JOBS) deploy && \
	make -C $(DTS) -j$(JOBS) clean && \
	make -C $(DTS) -j$(JOBS) dts

linux:
	cd $(WORKDIR) && \
	echo "================================" && \
	echo "Building Linux image..." && \
	echo "================================" && \
	make -C $(BUILDROOT) -j$(JOBS) && \
	cp -f $(BUILDROOT)/output/images/Image $(OUTPUT)/

# ---------------------------------------------------------------------------
# RV64 (Sv39 + OpenSBI) image
# ---------------------------------------------------------------------------
config64:
	cd $(WORKDIR) && \
	echo "================================" && \
	echo "Configuring rv64 build (defconfig)..." && \
	echo "================================" && \
	make -C $(BUILDROOT) O=$(BR64_OUT) BR2_DEFCONFIG=$(WORKDIR)/configs/rv64/buildroot_defconfig defconfig

toolchain64: config64
	cd $(WORKDIR) && \
	echo "================================" && \
	echo "Building rv64 toolchain..." && \
	echo "================================" && \
	make -C $(BUILDROOT) O=$(BR64_OUT) -j$(JOBS) toolchain

# Builds OpenSBI, the kernel (initramfs embedded) and packs them into rve/assets/linux64/:
#   Image         combined boot image (OpenSBI + kernel) that `rve64 -b` loads at 0x80000000
#   fw_jump.bin   OpenSBI alone,   kernel-Image   Linux alone (for debugging)
linux64: config64
	cd $(WORKDIR) && \
	echo "================================" && \
	echo "Building rv64 Linux image..." && \
	echo "================================" && \
	make -C $(BUILDROOT) O=$(BR64_OUT) -j$(JOBS) && \
	mkdir -p $(IMAGE64_DIR) && \
	scripts/pack_rv64_image.sh $(BR64_OUT)/images/fw_jump.bin $(BR64_OUT)/images/Image $(IMAGE64_DIR)/Image && \
	cp -f $(BR64_OUT)/images/fw_jump.bin $(IMAGE64_DIR)/fw_jump.bin && \
	cp -f $(BR64_OUT)/images/Image $(IMAGE64_DIR)/kernel-Image

config-save64:
	cd $(WORKDIR) && \
	cp -f $(BR64_OUT)/build/linux-*/.config configs/rv64/kernel_config
