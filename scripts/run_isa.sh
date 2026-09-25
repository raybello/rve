#!/bin/sh
# Run every ISA test in a directory headless and report PASS/FAIL/TIMEOUT.
# Usage: scripts/run_isa.sh <rve-binary> <test-dir> [name-filter-regex]
# Exit status: 0 if all tests passed, 1 otherwise.
BIN=$1
DIR=$2
FILTER=${3:-.}
pass=0; fail=0; total=0; failed=""
for t in "$DIR"/*; do
  case "$t" in *.dump) continue;; esac
  n=$(basename "$t")
  echo "$n" | grep -Eq "$FILTER" || continue
  total=$((total+1))
  "$BIN" -n -t -e "$t" >/tmp/rve_isa_out.$$ 2>&1
  rc=$?
  if [ $rc -eq 0 ]; then
    pass=$((pass+1)); echo "PASS  $n"
  else
    fail=$((fail+1)); failed="$failed $n"
    [ $rc -eq 2 ] && echo "TIMEOUT $n" || echo "FAIL  $n (rc=$rc)"
  fi
done
rm -f /tmp/rve_isa_out.$$
echo "----------------------------------------"
echo "$pass/$total passed, $fail failed"
[ $fail -eq 0 ] || { echo "failed:$failed"; exit 1; }
