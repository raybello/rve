# rve-specific RV64 CSR checks (built with the riscv-tests p environment)
#  - misa reports MXL=2 and the I/M/A/F/D/S/U extensions
#  - mstatus/sstatus UXL/SXL read as 2 and cannot be cleared
#  - satp.MODE is WARL: Sv48/Sv57 writes are ignored (this is how Linux probes
#    for the largest supported paging mode), Bare and Sv39 are accepted
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  TEST_CASE( 2, a0, 2,        csrr a0, misa; srli a0, a0, 62)
  TEST_CASE( 3, a0, 0x141129, csrr a0, misa; li a1, 0x141129; and a0, a0, a1)
  TEST_CASE( 4, a0, 0xa,      csrr a0, mstatus; srli a0, a0, 32; andi a0, a0, 0xf)
  TEST_CASE( 5, a0, 0xa,      csrw mstatus, zero; csrr a0, mstatus; srli a0, a0, 32; andi a0, a0, 0xf)
  TEST_CASE( 6, a0, 2,        csrr a0, sstatus; srli a0, a0, 32; andi a0, a0, 0x3)

  # Unsupported modes leave satp unchanged (still Bare = 0)
  TEST_CASE( 7, a0, 0,        li a0, 9 << 60; csrw satp, a0; csrr a0, satp)
  TEST_CASE( 8, a0, 0,        li a0, 10 << 60; csrw satp, a0; csrr a0, satp)
  TEST_CASE( 9, a0, 0,        li a0, 1 << 60; csrw satp, a0; csrr a0, satp)

  # Sv39 is accepted and read back (M-mode itself is never translated)
  TEST_CASE(10, a0, 1,        li a0, (8 << 60) | 0x80000; csrw satp, a0; csrr a1, satp; xor a0, a0, a1; seqz a0, a0)
  # ...and an unsupported mode does not disturb an active Sv39 setting
  TEST_CASE(11, a0, 1,        li a0, (8 << 60) | 0x80000; csrw satp, a0; li a1, 9 << 60; csrw satp, a1; csrr a1, satp; xor a0, a0, a1; seqz a0, a0)
  TEST_CASE(12, a0, 0,        csrw satp, zero; csrr a0, satp)

  # 64-bit counters/time are readable
  TEST_CASE(13, a0, 1,        csrr a0, mcycle; snez a0, a0)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
