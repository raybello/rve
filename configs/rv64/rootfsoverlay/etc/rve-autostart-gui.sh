#!/bin/sh
# Auto-launch the Alpine graphical session (labwc + foot over virtio-gpu/virtio-input) if a real
# root disk is attached via `-D`. Invoked from inittab as a non-blocking `once` action -- every
# failure path below just exits 0, so a missing disk or any failure in this chain never affects
# the normal busybox console/tty1 login prompt (which stays reachable on ttyS0 the whole time,
# since the kernel command line keeps both tty0 and ttyS0 as consoles).
sleep 2   # let virtio-blk / virtio-gpu finish probing before touching /dev/vda

MNT=/mnt/alpine
mkdir -p "$MNT"
# /dev/vda always exists once the virtio-blk driver probes, even with no -D image attached (it
# just reports 0 blocks then); mounting it is the simplest self-verifying gate for "is a real
# disk attached".
mount -t ext4 /dev/vda "$MNT" 2>/dev/null || exit 0
[ -x "$MNT/sbin/init" ] || [ -d "$MNT/bin" ] || { umount "$MNT"; exit 0; }

# -o rbind, not a plain bind: /dev/pts is its own devpts mount nested inside /dev, and a
# non-recursive bind only mirrors the top-level mount point (see README's GUI section).
mount -o rbind /dev "$MNT/dev"
mount -t proc proc "$MNT/proc"
mount -t sysfs sysfs "$MNT/sys"

chroot "$MNT" /bin/sh -c '
  mkdir -p /tmp/xdg
  chmod 700 /tmp/xdg
  export XDG_RUNTIME_DIR=/tmp/xdg
  /sbin/udevd --daemon
  sleep 2
  udevadm trigger
  udevadm settle
  seatd >/tmp/seatd.log 2>&1 &
  sleep 2
  WLR_RENDERER=pixman labwc >/tmp/labwc.log 2>&1 &
  sleep 5
  WAYLAND_DISPLAY=wayland-0 XDG_RUNTIME_DIR=/tmp/xdg foot >/tmp/foot.log 2>&1 &
'
