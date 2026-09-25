#!/bin/sh
# Pack the rv64 boot image that rve64 loads at RAM base (0x80000000):
#   [ OpenSBI fw_jump.bin, zero padded to 2 MiB ][ Linux Image (with embedded initramfs) ]
# OpenSBI (FW_JUMP_ADDR=0x80200000) then jumps to the kernel in S-mode.
# Usage: pack_rv64_image.sh <fw_jump.bin> <Image> <output>
set -e
FW=$1; KERNEL=$2; OUT=$3
[ -f "$FW" ] && [ -f "$KERNEL" ] && [ -n "$OUT" ] || { echo "usage: $0 <fw_jump.bin> <Image> <output>" >&2; exit 1; }
FW_SIZE=$(wc -c < "$FW")
[ "$FW_SIZE" -le 2097152 ] || { echo "fw_jump.bin ($FW_SIZE bytes) does not fit below the 0x80200000 kernel address" >&2; exit 1; }
cp "$FW" "$OUT"
dd if=/dev/zero of="$OUT" bs=1 count=0 seek=2097152 2>/dev/null   # zero-extend to 2 MiB
cat "$KERNEL" >> "$OUT"
echo "packed $OUT: firmware $FW_SIZE bytes + kernel $(wc -c < "$KERNEL") bytes"
