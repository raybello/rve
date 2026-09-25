#!/bin/sh
# Build the rv64 {ui,um,ua,uf,ud} ISA tests out-of-tree.
# Usage: scripts/build_isa64.sh [output_dir] [--virtual]
#   default    builds the physical (-p-) tests  -> rve/assets/isa-test-rv64
#   --virtual  builds the Sv39 virtual-memory (-v-) variants instead
#   --custom   builds rve's own directed tests (rve/tests/rv64/*.S) instead
set -e
ROOT=$(cd "$(dirname "$0")/.." && pwd)
OUT=${1:-$ROOT/rve/assets/isa-test-rv64}
# Toolchain prefix: brew ships riscv64-elf-, Debian/Ubuntu ship riscv64-unknown-elf-
if [ -z "$RISCV_PREFIX" ]; then
  if command -v riscv64-unknown-elf-gcc >/dev/null 2>&1; then RISCV_PREFIX=riscv64-unknown-elf-
  else RISCV_PREFIX=riscv64-elf-; fi
fi
T=$ROOT/riscv-tests
COMMON="-march=rv64g -mabi=lp64 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles"
mkdir -p "$OUT"
if [ "$2" = "--custom" ]; then
  for f in "$ROOT"/rve/tests/rv64/*.S; do
    n=$(basename "$f" .S)
    ${RISCV_PREFIX}gcc $COMMON -I"$T/env/p" -I"$T/isa/macros/scalar" \
      -T"$T/env/p/link.ld" "$f" -o "$OUT/${n%%-*}-p-${n#*-}"
  done
  echo "built $(ls "$OUT" | wc -l) tests in $OUT"
  exit 0
fi
for s in ui um ua uf ud; do
  for f in "$T"/isa/rv64$s/*.S; do
    n=$(basename "$f" .S)
    if [ "$2" = "--virtual" ]; then
      # The bare-metal toolchain has no libc headers; scripts/shim provides the few the vm env needs.
      ${RISCV_PREFIX}gcc $COMMON -DENTROPY=0x$(echo "rv64$s-v-$n" | cksum | cut -d' ' -f1 | cut -c 1-7) \
        -std=gnu99 -O2 -I"$ROOT/scripts/shim" -I"$T/env/v" -I"$T/isa/macros/scalar" \
        -T"$T/env/v/link.ld" "$T"/env/v/entry.S "$T"/env/v/*.c "$f" -o "$OUT/rv64$s-v-$n" 2>/dev/null
    else
      ${RISCV_PREFIX}gcc $COMMON -I"$T/env/p" -I"$T/isa/macros/scalar" \
        -T"$T/env/p/link.ld" "$f" -o "$OUT/rv64$s-p-$n"
    fi
  done
done
echo "built $(ls "$OUT" | wc -l) tests in $OUT"
