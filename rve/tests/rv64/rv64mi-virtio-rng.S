# rve directed test: drives the virtio-rng device (0x10006000) and the PLIC like a guest driver
# would. Posts one device-writable 16-byte buffer, notifies, and checks that it comes back
# completed with the full length filled (the actual random bytes obviously can't be checked
# deterministically -- see the PR description for how the fix was verified: a real kernel boot
# showing "random: crng init done" within a couple of seconds instead of after a long stall).
#include "riscv_test.h"
#include "test_macros.h"

#define VIRTIO   0x10006000
#define PLIC     0x0c000000

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li s0, VIRTIO
  li s1, PLIC

  TEST_CASE( 2, a0, 0x74726976, lw a0, 0(s0))          # magic "virt"
  TEST_CASE( 3, a0, 4,          lw a0, 8(s0))          # device id: entropy (VIRTIO_ID_RNG)

  li t0, 3
  sw t0, 0x070(s0)                                     # ACKNOWLEDGE | DRIVER
  li t0, 0
  sw t0, 0x030(s0)                                     # QueueSel = 0 (the only queue)
  li t0, 8
  sw t0, 0x038(s0)                                     # QueueNum
  la t0, desc
  sw t0, 0x080(s0)
  srli t0, t0, 32
  sw t0, 0x084(s0)
  la t0, avail
  sw t0, 0x090(s0)
  srli t0, t0, 32
  sw t0, 0x094(s0)
  la t0, used
  sw t0, 0x0a0(s0)
  srli t0, t0, 32
  sw t0, 0x0a4(s0)
  li t0, 1
  sw t0, 0x044(s0)                                     # QueueReady
  li t0, 0xf
  sw t0, 0x070(s0)                                     # + FEATURES_OK | DRIVER_OK

  # ---- post one device-writable 16-byte buffer (descriptor 0) ----
  la t0, desc
  la t1, buf
  sd t1, 0(t0)
  li t2, 16
  sw t2, 8(t0)
  li t2, 2                                             # WRITE (device fills this buffer)
  sh t2, 12(t0)
  sh zero, 14(t0)

  la t0, avail
  sh zero, 4(t0)                                       # ring[0] = 0
  li t1, 1
  sh t1, 2(t0)                                         # avail.idx = 1
  li t0, 0
  sw t0, 0x050(s0)                                      # QueueNotify = 0

  li t3, 200000
1: la t0, used
  lhu t1, 2(t0)
  bnez t1, 2f
  addi t3, t3, -1
  bnez t3, 1b
2:
  TEST_CASE( 4, a0, 1,  la t0, used; lhu a0, 2(t0))                # one completion
  TEST_CASE( 5, a0, 16, la t0, used; lw a0, 8(t0))                 # filled the whole 16-byte buffer

  # device interrupt is asserted; PLIC claim/complete on source 5, context 0 (M-mode)
  TEST_CASE( 6, a0, 1,  lw a0, 0x060(s0))                          # InterruptStatus
  li t0, 1
  sw t0, 20(s1)                                                    # priority[5] = 1
  li t0, 0x20
  li t1, PLIC + 0x2000
  sw t0, 0(t1)                                                     # enable[ctx0] bit5 = source 5
  li t1, PLIC + 0x200000
  sw zero, 0(t1)                                                   # threshold[ctx0] = 0
  TEST_CASE( 7, a0, 5,  li t1, PLIC + 0x200004; lw a0, 0(t1))       # claim -> source 5
  li t0, 1
  sw t0, 0x064(s0)                                                 # InterruptACK
  li t0, 5
  li t1, PLIC + 0x200004
  sw t0, 0(t1)                                                     # complete
  TEST_CASE( 8, a0, 0,  lw a0, 0x060(s0))                          # interrupt cleared
  TEST_CASE( 9, a0, 0,  li t1, PLIC + 0x200004; lw a0, 0(t1))      # nothing left to claim

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

  .align 4
desc:  .space 128
avail: .space 64
  .align 4
used:  .space 128
  .align 4
buf:   .space 16

RVTEST_DATA_END
