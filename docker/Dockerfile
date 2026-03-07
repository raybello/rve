FROM ubuntu:latest AS base
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential git bc bison flex \
    libssl-dev libelf-dev cpio rsync unzip \
    python3 ca-certificates wget curl xz-utils \
    file ccache ninja-build libncurses-dev device-tree-compiler \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root build user to avoid permission conflicts
RUN groupadd -g 1001 builder && \
    useradd -u 1001 -g builder -m -s /bin/bash builder

ENV CCACHE_DIR=/ccache
ENV PATH="/usr/lib/ccache:${PATH}"

# Set up ccache directory with correct permissions
RUN mkdir -p /ccache && chown builder:builder /ccache

WORKDIR /opt
RUN git clone https://github.com/ultraembedded/riscv32_linux_from_scratch.git && \
    chown -R builder:builder /opt/riscv32_linux_from_scratch

RUN git clone https://github.com/raybello/buildroot.git --recurse-submodules --depth 1 && \
    chown -R builder:builder /opt/buildroot

FROM base AS builder

# Create workspace with correct ownership before switching user
RUN mkdir -p /workspace/project /workspace/output && \
    chown -R builder:builder /workspace

USER builder
WORKDIR /workspace