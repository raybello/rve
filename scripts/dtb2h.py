#!/usr/bin/env python3
"""Convert a .dtb into a C header holding it as `static const unsigned char <name>[]`.
Same output format as dts/bintoh, but portable (bintoh is a checked-in Linux binary).
Usage: dtb2h.py <name> < in.dtb > out.h"""
import sys
name = sys.argv[1]
data = sys.stdin.buffer.read()
out = ['static const unsigned char %s[] = {' % name]
for i, b in enumerate(data):
    out.append('0x%02x,%s' % (b, '\n' if (i & 15) == 15 else ' '))
out.append('};')
sys.stdout.write(''.join(out))
