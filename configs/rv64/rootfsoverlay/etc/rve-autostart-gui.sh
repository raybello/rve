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
  # Neither /tmp nor /run is a tmpfs on this rootfs (check /etc/fstab -- only /media/cdrom and
  # /media/usb are listed), so both are plain directories on the persistent disk image and
  # anything written there survives a reboot of the SAME image. A leftover wayland-0 socket/lock
  # or seatd.sock from an earlier boot can make a fresh labwc/seatd instance fail to cleanly
  # (re)bind, leaving a socket file that exists (satisfying wait_for below) but refuses every
  # connection -- wipe them first so each boot starts from a genuinely clean slate.
  rm -rf /tmp/xdg /run/seatd.sock
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

  # The wayland-0 socket path can exist slightly before labwc has fully worked through the rest
  # of its startup (DRM connector/mode scan, buffer allocation) and is ready to accept a client --
  # NOTE: no apostrophes in this block -- it is embedded in a single-quoted chroot sh -c string,
  # and a literal quote here ends that string early and breaks everything below it with a syntax
  # error (learned the hard way -- keep comments in here contraction-free). Retry the launch
  # itself a bounded number of times rather than trusting a single well-timed attempt: if foot
  # exits within 0.5s it almost certainly failed to connect, not that the user closed a
  # genuinely-opened terminal that fast.
  i=0
  while [ "$i" -lt 20 ]; do
    WAYLAND_DISPLAY=wayland-0 XDG_RUNTIME_DIR=/tmp/xdg foot >/tmp/foot.log 2>&1 &
    FOOTPID=$!
    sleep 0.5
    kill -0 "$FOOTPID" 2>/dev/null && break
    i=$((i + 1))
  done
'
