#!/bin/sh
# Build a flat ext4 disk image containing a real Alpine Linux riscv64 rootfs, for use as the
# virtio-blk root device (`rve64 -D <image>` / `-D` in the GUI build). Includes labwc (a minimal
# wlroots-based Wayland compositor) and enough of its stack to run software-rendered (Pixman) over
# the emulator's virtio-gpu 2D device -- no 3D/virgl needed. See M4 in the GUI-userspace plan.
#
# Usage: scripts/build_alpine_rootfs.sh [output.img] [size] [alpine-version] [packages...]
#   output.img       default: rve/assets/alpine-rve.img
#   size              default: 768M  (truncate -s syntax, e.g. 1G)
#   alpine-version    default: 3.20  (a tag under docker.io/library/alpine)
#   packages...       default: labwc foot eudev seatd (space-separated apk package names appended
#                     after these; pass an empty string "" to keep just the base rootfs, as M1 did)
#
# Requires Docker with riscv64 emulation registered (one-time, if not already done):
#   docker run --privileged --rm tonistiigi/binfmt --install riscv64
#
# How it works: creates a real riscv64 Alpine container (via QEMU emulation), apk-installs the
# requested packages into it, and exports its filesystem, then formats and populates an ext4 image
# with it inside a privileged Linux container (needed for loop-mount access, which the Docker
# Desktop VM provides but the macOS/Windows host does not). No content is fabricated -- these are
# the actual upstream Alpine riscv64 packages, installed by the real apk tool.
set -e
ROOT=$(cd "$(dirname "$0")/.." && pwd)
OUT=${1:-$ROOT/rve/assets/alpine-rve.img}
SIZE=${2:-768M}
ALPINE_VERSION=${3:-3.20}
PACKAGES=${4:-labwc foot eudev seatd}

WORK=$ROOT/.buildscratch
mkdir -p "$WORK"
trap 'rm -rf "$WORK"' EXIT

echo "==> Building a real Alpine riscv64 ($ALPINE_VERSION) container${PACKAGES:+ with: $PACKAGES}"
INSTALL_CMD="true"
[ -n "$PACKAGES" ] && INSTALL_CMD="apk update -q && apk add -q $PACKAGES"
CID=$(docker create --platform=linux/riscv64 "alpine:$ALPINE_VERSION" sh -c "$INSTALL_CMD")
docker start -a "$CID"
docker export "$CID" -o "$WORK/rootfs.tar"
docker rm "$CID" >/dev/null
chmod 644 "$WORK/rootfs.tar"

echo "==> Formatting a $SIZE ext4 image and populating it (needs a privileged Linux container for loop mounts)"
docker run --rm --privileged \
  -v "$WORK:/work" \
  ubuntu:24.04 bash -c "
    set -e
    apt-get update -qq >/dev/null
    apt-get install -y -qq e2fsprogs >/dev/null
    truncate -s $SIZE /work/rootfs.img
    mkfs.ext4 -q -F -L rveroot /work/rootfs.img
    mkdir -p /mnt/img
    mount -o loop /work/rootfs.img /mnt/img
    tar -xf /work/rootfs.tar -C /mnt/img
    sync
    umount /mnt/img
  "

mkdir -p "$(dirname "$OUT")"
cp -f "$WORK/rootfs.img" "$OUT"
echo "==> Wrote $OUT"
echo "    Boot with: rve/build64/rve64 -n -F -D $OUT -b rve/assets/linux64/Image"
echo "    Then from the busybox shell: mount -t ext4 /dev/vda /mnt && chroot /mnt /bin/sh"
