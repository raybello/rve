#!/bin/sh
# Buildroot post-build hook for the rv64 image: builds rve's custom demo apps (the same three the
# rv32 image ships, see hello_linux/) with the rv64 musl toolchain and installs them into /root.
# Buildroot passes the target rootfs as $1 and exports HOST_DIR.
set -e
TARGET_DIR=$1
SRC=$(cd "$(dirname "$0")/../../hello_linux" && pwd)
CC="$HOST_DIR/bin/riscv64-buildroot-linux-musl-gcc"

install -d "$TARGET_DIR/root"
for app in hello_linux pi; do
    "$CC" -O2 -static -o "$TARGET_DIR/root/$app" "$SRC/$app.c"
done
"$CC" -O2 -static -o "$TARGET_DIR/root/framebuff" "$SRC/framebuff.c" -lm
echo "rve apps installed in /root: hello_linux pi framebuff"
