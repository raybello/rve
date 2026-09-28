# rve directed test: drives the virtio-blk device (0x10004000) and the PLIC like a guest driver
# would. Writes a 16-byte pattern to sector 0, reads it back, and checks the PLIC claim/complete
# path on source 3. Needs a backing disk image (run_isa.sh passes -D a zeroed 64 KiB scratch file).
#include "riscv_test.h"
#include "test_macros.h"

#define VIRTIO   0x10004000
#define PLIC     0x0c000000

.macro SETADDR off, sym
  la t0, \sym
  sw t0, \off(s0)
  srli t0, t0, 32
  sw t0, \off+4(s0)
.endm

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li s0, VIRTIO
  li s1, PLIC

  TEST_CASE( 2, a0, 0x74726976, lw a0, 0(s0))          # magic "virt"
  TEST_CASE( 3, a0, 2,          lw a0, 8(s0))          # device id: block
  TEST_CASE( 4, a0, 128,        lw a0, 0x100(s0))      # capacity: 128 sectors (64 KiB scratch image)

  li t0, 3
  sw t0, 0x070(s0)                                     # ACKNOWLEDGE | DRIVER
  li t0, 0
  sw t0, 0x030(s0)                                     # QueueSel = 0
  li t0, 8
  sw t0, 0x038(s0)                                     # QueueNum
  SETADDR 0x080, desc
  SETADDR 0x090, avail
  SETADDR 0x0a0, used
  li t0, 1
  sw t0, 0x044(s0)                                     # QueueReady
  li t0, 0xf
  sw t0, 0x070(s0)                                     # + FEATURES_OK | DRIVER_OK

  # ---- WRITE: sector 0 <- wr_data (16 bytes) ----
  la t0, hdr
  li t1, 1                     # VIRTIO_BLK_T_OUT
  sw t1, 0(t0)
  sw zero, 4(t0)
  sd zero, 8(t0)                # sector 0

  la t0, desc
  la t1, hdr
  sd t1, 0(t0)                  # desc[0].addr = &hdr
  li t2, 16
  sw t2, 8(t0)                  # desc[0].len = 16
  li t2, 1                      # NEXT
  sh t2, 12(t0)
  li t2, 1
  sh t2, 14(t0)                 # desc[0].next = 1

  addi t0, t0, 16
  la t1, wr_data
  sd t1, 0(t0)                  # desc[1].addr = &wr_data
  li t2, 16
  sw t2, 8(t0)                  # desc[1].len = 16
  li t2, 1                      # NEXT (guest->device data: no WRITE flag)
  sh t2, 12(t0)
  li t2, 2
  sh t2, 14(t0)                 # desc[1].next = 2

  addi t0, t0, 16
  la t1, status0
  sd t1, 0(t0)                  # desc[2].addr = &status0
  li t2, 1
  sw t2, 8(t0)                  # desc[2].len = 1
  li t2, 2                      # WRITE (device writes the status byte)
  sh t2, 12(t0)
  sh zero, 14(t0)

  la t0, avail
  sh zero, 4(t0)                # avail.ring[0] = 0 (head = descriptor 0)
  li t1, 1
  sh t1, 2(t0)                  # avail.idx = 1
  li t0, 0
  sw t0, 0x050(s0)               # QueueNotify = 0

  li t3, 200000
1: la t0, used
  lhu t1, 2(t0)
  bnez t1, 2f
  addi t3, t3, -1
  bnez t3, 1b
2:
  TEST_CASE( 5, a0, 1,  la t0, used; lhu a0, 2(t0))                # one buffer returned
  TEST_CASE( 6, a0, 0,  lb a0, status0)                            # VIRTIO_BLK_S_OK

  # ---- READ: rd_data <- sector 0 ----
  # Reuses the same queue/rings as the write above (the device's queue-address registers were
  # only set once): a second chain at descriptor slots 3-5, posted as avail ring entry 1.
  la t0, hdr2
  sw zero, 0(t0)                 # VIRTIO_BLK_T_IN
  sw zero, 4(t0)
  sd zero, 8(t0)

  la t0, desc
  addi t0, t0, 48                 # desc[3]
  la t1, hdr2
  sd t1, 0(t0)
  li t2, 16
  sw t2, 8(t0)
  li t2, 1
  sh t2, 12(t0)
  li t2, 4
  sh t2, 14(t0)                   # desc[3].next = 4

  addi t0, t0, 16                 # desc[4]
  la t1, rd_data
  sd t1, 0(t0)
  li t2, 16
  sw t2, 8(t0)
  li t2, 3                        # NEXT | WRITE (device writes data into rd_data)
  sh t2, 12(t0)
  li t2, 5
  sh t2, 14(t0)                   # desc[4].next = 5

  addi t0, t0, 16                 # desc[5]
  la t1, status1
  sd t1, 0(t0)
  li t2, 1
  sw t2, 8(t0)
  li t2, 2                        # WRITE
  sh t2, 12(t0)
  sh zero, 14(t0)

  la t0, avail
  li t1, 3
  sh t1, 6(t0)                    # avail.ring[1] = 3 (head = descriptor 3)
  li t1, 2
  sh t1, 2(t0)                    # avail.idx = 2
  li t0, 0
  sw t0, 0x050(s0)

  li t3, 200000
3: la t0, used
  lhu t1, 2(t0)
  li t2, 2
  beq t1, t2, 4f
  addi t3, t3, -1
  bnez t3, 3b
4:
  TEST_CASE( 7, a0, 0,  lb a0, status1)                            # VIRTIO_BLK_S_OK
  TEST_CASE( 8, a0, 1,  la t0, rd_data; ld a0, 0(t0))              # matches wr_data low qword
  TEST_CASE( 9, a0, 2,  la t0, rd_data; ld a0, 8(t0))              # matches wr_data high qword

  # device interrupt is asserted; PLIC claim/complete on source 3, context 0 (M-mode)
  TEST_CASE(10, a0, 1,  lw a0, 0x060(s0))                          # InterruptStatus
  li t0, 1
  sw t0, 12(s1)                                                    # priority[3] = 1
  li t0, 8
  li t1, PLIC + 0x2000
  sw t0, 0(t1)                                                     # enable[ctx0] bit3 = source 3
  li t1, PLIC + 0x200000
  sw zero, 0(t1)                                                   # threshold[ctx0] = 0
  TEST_CASE(11, a0, 3,  li t1, PLIC + 0x200004; lw a0, 0(t1))       # claim -> source 3
  li t0, 1
  sw t0, 0x064(s0)                                                 # InterruptACK
  li t0, 3
  li t1, PLIC + 0x200004
  sw t0, 0(t1)                                                     # complete
  TEST_CASE(12, a0, 0,  lw a0, 0x060(s0))                          # interrupt cleared
  TEST_CASE(13, a0, 0,  li t1, PLIC + 0x200004; lw a0, 0(t1))       # nothing left to claim

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

  .align 4
desc:    .space 128
avail:   .space 64
  .align 4
used:    .space 128
  .align 4
hdr:     .space 16
hdr2:    .space 16
wr_data: .dword 0x0000000000000001, 0x0000000000000002
rd_data: .space 16
status0: .space 8
status1: .space 8

RVTEST_DATA_END
