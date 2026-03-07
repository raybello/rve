ROOT_DIR = $(shell pwd)
CCACHE=$(ROOT_DIR)/.ccache
OUTPUT_DIR = $(ROOT_DIR)/rve/assets/linux
IMAGE=rve-linux
CONTAINER_NAME=rve-linux-build

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

lnx:
	make -C rve lnx

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
	docker exec $(CONTAINER_NAME) make -f docker/container.mk build
	make -C rve lnx

# Stop and remove the container (next 'make container' starts fresh)
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) bash


