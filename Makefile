ROOT_DIR = $(shell pwd)
CCACHE=$(ROOT_DIR)/.ccache
OUTPUT_DIR = $(ROOT_DIR)/rve/assets/linux
IMAGE=rve-linux

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

linux:
	make -C rve linux

linuxn:
	make -C rve linuxn

web:
	make -C rve web

clean:
	make -C rve clean

container:
	docker build -t $(IMAGE) -f docker/Dockerfile docker

build:
	mkdir -p $(CCACHE)
	mkdir -p $(OUTPUT_DIR)

	docker run --rm \
		-v $(ROOT_DIR):/workspace/project \
		-v $(OUTPUT_DIR):/workspace/output \
		-v $(CCACHE):/ccache \
		-w /workspace/project \
		$(IMAGE) \
		make -f docker/container.mk build

shell:
	docker run --rm -it \
		-v $(ROOT_DIR):/workspace/project \
		-v $(CCACHE):/ccache \
		-w /workspace/project \
		$(IMAGE) \
		bash


