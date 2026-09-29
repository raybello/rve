#!/bin/sh
# Auto-launch the Alpine graphical session (labwc + foot over virtio-gpu/virtio-input) if a real
# root disk is attached via `-D`. Invoked from inittab as a non-blocking `once` action -- every
# failure path below just exits 0, so a missing disk or any failure in this chain never affects
# the normal busybox console/tty1 login prompt (which stays reachable on ttyS0 the whole time,
# since the kernel command line keeps both tty0 and ttyS0 as consoles).
#
# Each step polls for the specific thing the next step actually depends on (a socket file
# appearing) instead of a blind `sleep N` -- on a fast boot this gets a terminal on screen in a
# couple of seconds instead of the ~11s a worst-case-sized set of fixed sleeps always cost
# regardless of how fast the guest actually was. The poll is still capped, so a slow/stuck boot
# falls through in bounded time, same as the old fixed sleeps did.
MNT=/mnt/alpine
mkdir -p "$MNT"
# /dev/vda always exists once the virtio-blk driver probes (which happens during kernel boot,
# well before this script runs), even with no -D image attached (it just reports 0 blocks then);
# retrying the mount itself is the simplest self-verifying gate for "is a real disk attached".
i=0
while ! mount -t ext4 /dev/vda "$MNT" 2>/dev/null; do
  i=$((i + 1))
  [ "$i" -ge 20 ] && exit 0   # ~2s: no disk attached, or it's not formatted -- give up quietly
  sleep 0.1
done
[ -x "$MNT/sbin/init" ] || [ -d "$MNT/bin" ] || { umount "$MNT"; exit 0; }

# -o rbind, not a plain bind: /dev/pts is its own devpts mount nested inside /dev, and a
# non-recursive bind only mirrors the top-level mount point (see README's GUI section).
mount -o rbind /dev "$MNT/dev"
mount -t proc proc "$MNT/proc"
mount -t sysfs sysfs "$MNT/sys"

chroot "$MNT" /bin/sh -c '
  wait_for() { # wait_for <path> <max_tries (x0.1s)>
    i=0
    while [ ! -e "$1" ] && [ "$i" -lt "$2" ]; do
      i=$((i + 1))
      sleep 0.1
    done
  }
  mkdir -p /tmp/xdg
  chmod 700 /tmp/xdg
  export XDG_RUNTIME_DIR=/tmp/xdg

  /sbin/udevd --daemon
  wait_for /run/udev/control 20          # ~2s cap
  udevadm trigger
  udevadm settle

  seatd >/tmp/seatd.log 2>&1 &
  wait_for /run/seatd.sock 20            # ~2s cap

  WLR_RENDERER=pixman labwc >/tmp/labwc.log 2>&1 &
  wait_for /tmp/xdg/wayland-0 50         # ~5s cap: labwc is the slowest step to come up

  WAYLAND_DISPLAY=wayland-0 XDG_RUNTIME_DIR=/tmp/xdg foot >/tmp/foot.log 2>&1 &
'
