# BUILDROOT=/opt/riscv32_linux_from_scratch
BUILDROOT=/opt/buildroot
HELLO_LINUX=hello_linux
BAREMETAL=baremetal
DTS=dts

WORKDIR=/workspace/project
OUTPUT=/workspace/output
JOBS=$(shell nproc)

.PHONY: build toolchain linux

build: toolchain linux

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

save-config:
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