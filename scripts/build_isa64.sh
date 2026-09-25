#!/bin/sh
# Build the rv64 {ui,um,ua,uf,ud} physical (-p-) ISA tests out-of-tree.
# Usage: scripts/build_isa64.sh [output_dir]
set -e
ROOT=$(cd "$(dirname "$0")/.." && pwd)
OUT=${1:-$ROOT/rve/assets/isa-test-rv64}
PREFIX=${RISCV_PREFIX:-riscv64-elf-}
T=$ROOT/riscv-tests
mkdir -p "$OUT"
for s in ui um ua uf ud; do
  for f in "$T"/isa/rv64$s/*.S; do
    n=$(basename "$f" .S)
    ${PREFIX}gcc -march=rv64g -mabi=lp64 -static -mcmodel=medany -fvisibility=hidden \
      -nostdlib -nostartfiles -I"$T/env/p" -I"$T/isa/macros/scalar" \
      -T"$T/env/p/link.ld" "$f" -o "$OUT/rv64$s-p-$n"
  done
done
echo "built $(ls "$OUT" | wc -l) tests in $OUT"
