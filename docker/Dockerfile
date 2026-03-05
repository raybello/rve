FROM ubuntu:latest AS base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    bc \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    cpio \
    rsync \
    unzip \
    python3 \
    ca-certificates \
    wget \
    curl \
    xz-utils \
    file \
    ccache \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

ENV CCACHE_DIR=/ccache
ENV PATH="/usr/lib/ccache:${PATH}"

WORKDIR /opt
RUN git clone https://github.com/ultraembedded/riscv32_linux_from_scratch.git

FROM base AS builder

WORKDIR /workspace



