# rve directed test: compressed FP load/store (C.FLD, C.FSD, C.FLDSP, C.FSDSP).
#
# The upstream riscv-tests rv64uc/rvc.S corpus (built via `scripts/build_isa64.sh --compressed`)
# only exercises the integer compressed forms -- no C.FLD/C.FSD/C.FLDSP/C.FSDSP coverage exists
# anywhere in that suite. Those four were implemented in decodeCompressed() (rve/src/emu.cpp) by
# direct structural analogy with the already-verified C.LD/C.SD/C.LDSP/C.SDSP (same immediate bit
# layout, different opcode/funct3 and register file), but were unverified by any test until this
# file. Register values are read back via fmv.x.d since TEST_CASE only compares integer registers.
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  # ---- C.FLD (quadrant 0, rs1' = x8-x15 base, rd' = f8-f15) ----
  la s0, tdat
  TEST_CASE( 2, a0, 0x0123456789abcdef, c.fld fs0, 0(s0); fmv.x.d a0, fs0)
  TEST_CASE( 3, a0, 0xfedcba9876543210, c.fld fs1, 8(s0); fmv.x.d a0, fs1)

  # ---- C.FSD (quadrant 0, rs1' = x8-x15 base, rs2' = f8-f15 source) ----
  la s0, tdat
  TEST_CASE( 4, a0, 0x0123456789abcdef, fld fs0, 0(s0); c.fsd fs0, 16(s0); ld a0, 16(s0))
  TEST_CASE( 5, a0, 0xfedcba9876543210, fld fs1, 8(s0); c.fsd fs1, 24(s0); ld a0, 24(s0))

  # ---- C.FLDSP (quadrant 2, sp-relative, full 5-bit fp register) ----
  la sp, tdat2
  TEST_CASE( 6, a0, 0x1122334455667788, c.fldsp fa0, 0(sp); fmv.x.d a0, fa0)
  TEST_CASE( 7, a0, 0x8899aabbccddeeff, c.fldsp fa1, 8(sp); fmv.x.d a0, fa1)

  # ---- C.FSDSP (quadrant 2, sp-relative, full 5-bit fp register) ----
  la sp, tdat2
  TEST_CASE( 8, a0, 0x1122334455667788, fld fa2, 0(sp); c.fsdsp fa2, 16(sp); ld a0, 16(sp))
  TEST_CASE( 9, a0, 0x8899aabbccddeeff, fld fa3, 8(sp); c.fsdsp fa3, 24(sp); ld a0, 24(sp))

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

  .align 4
tdat:
.dword 0x0123456789abcdef
.dword 0xfedcba9876543210
.dword 0x0000000000000000   # c.fsd scratch (offset 16)
.dword 0x0000000000000000   # c.fsd scratch (offset 24)

  .align 4
tdat2:
.dword 0x1122334455667788
.dword 0x8899aabbccddeeff
.dword 0x0000000000000000   # c.fsdsp scratch (offset 16)
.dword 0x0000000000000000   # c.fsdsp scratch (offset 24)

RVTEST_DATA_END
