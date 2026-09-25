#!/bin/sh
# Run every ISA test in a directory headless and report PASS/FAIL/TIMEOUT.
# Usage: scripts/run_isa.sh <rve-binary or command> <test-dir> [name-filter-regex]
#   e.g. scripts/run_isa.sh "node web/isa.js" rve/assets/isa-test
# Exit status: 0 if all tests passed, 1 otherwise.
BIN=$1
DIR=$2
FILTER=${3:-.}
SKIPFILE=${SKIPFILE:-$(dirname "$0")/isa_skip.txt}
pass=0; fail=0; total=0; skipped=0; failed=""
for t in "$DIR"/*; do
  case "$t" in *.dump) continue;; esac
  n=$(basename "$t")
  echo "$n" | grep -Eq "$FILTER" || continue
  if [ -f "$SKIPFILE" ] && grep -Eq "^$n([[:space:]]|\$)" "$SKIPFILE"; then
    skipped=$((skipped+1)); echo "SKIP  $n"; continue
  fi
  total=$((total+1))
  $BIN -n -F -t -e "$t" >/tmp/rve_isa_out.$$ 2>&1
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
echo "$pass/$total passed, $fail failed, $skipped skipped"
[ $fail -eq 0 ] || { echo "failed:$failed"; exit 1; }
