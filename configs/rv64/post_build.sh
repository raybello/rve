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

# Networking: bring eth0 up with DHCP at boot (rv64 only; the shared inittab is used by rv32 too).
install -d "$TARGET_DIR/usr/share/udhcpc" "$TARGET_DIR/etc"
install -m 0755 "$(dirname "$0")/udhcpc.script" "$TARGET_DIR/usr/share/udhcpc/default.script"
if ! grep -q "udhcpc -i eth0" "$TARGET_DIR/etc/inittab"; then
    sed -i '/^::sysinit:\/bin\/hostname/a ::sysinit:/bin/sh -c "ip link set lo up; udhcpc -i eth0 -q -n -t 5 >/dev/null 2>\&1 \&"' "$TARGET_DIR/etc/inittab"
fi
echo "nameserver 10.0.2.3" > "$TARGET_DIR/etc/resolv.conf"
