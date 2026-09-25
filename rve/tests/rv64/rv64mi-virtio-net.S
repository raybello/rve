# rve directed test: drives the virtio-mmio net device (0x10002000) and the PLIC like a guest
# driver would. Needs the userspace network stack (run_isa.sh passes -F): an ARP request for the
# gateway 10.0.2.2 must come back as an ARP reply in the RX queue, raise the device interrupt and
# be claimable from the PLIC (M-mode context 0, source 1).
#include "riscv_test.h"
#include "test_macros.h"

#define VIRTIO   0x10002000
#define PLIC     0x0c000000

.macro SETADDR off, sym
  la t0, \sym
  sw t0, \off(s0)
  srli t0, t0, 32
  sw t0, \off+4(s0)
.endm

.macro SETQUEUE idx, desc, avail, used
  li t0, \idx
  sw t0, 0x030(s0)          # QueueSel
  li t0, 8
  sw t0, 0x038(s0)          # QueueNum
  SETADDR 0x080, \desc
  SETADDR 0x090, \avail
  SETADDR 0x0a0, \used
  li t0, 1
  sw t0, 0x044(s0)          # QueueReady
.endm

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li s0, VIRTIO
  li s1, PLIC

  TEST_CASE( 2, a0, 0x74726976, lw a0, 0(s0))          # magic "virt"
  TEST_CASE( 3, a0, 1,          lw a0, 8(s0))          # device id: net

  li t0, 3
  sw t0, 0x070(s0)                                     # ACKNOWLEDGE | DRIVER
  SETQUEUE 0, rx_desc, rx_avail, rx_used
  SETQUEUE 1, tx_desc, tx_avail, tx_used
  li t0, 0xf
  sw t0, 0x070(s0)                                     # + FEATURES_OK | DRIVER_OK

  # RX buffer: descriptor 0 (device-writable), avail ring [0] = 0, avail idx = 1
  la t0, rx_desc
  la t1, rx_buf
  sd t1, 0(t0)
  li t2, 2048
  sw t2, 8(t0)
  li t2, 2
  sh t2, 12(t0)
  la t0, rx_avail
  li t1, 1
  sh t1, 2(t0)

  # TX: descriptor 0 = 12-byte header + ARP request, avail idx = 1, notify queue 1
  la t0, tx_desc
  la t1, tx_frame
  sd t1, 0(t0)
  li t2, 54
  sw t2, 8(t0)
  la t0, tx_avail
  li t1, 1
  sh t1, 2(t0)
  li t0, 1
  sw t0, 0x050(s0)

  # wait for the reply to land in the RX used ring (bounded)
  li t3, 200000
1: la t0, rx_used
  lhu t1, 2(t0)
  bnez t1, 2f
  addi t3, t3, -1
  bnez t3, 1b
2:
  TEST_CASE( 4, a0, 1,  la t0, rx_used; lhu a0, 2(t0))               # one buffer returned
  TEST_CASE( 5, a0, 54, la t0, rx_used; lw a0, 8(t0))                # 12-byte header + 42-byte ARP frame
  TEST_CASE( 6, a0, 0x0806, la t0, rx_buf; lbu a0, 24(t0); lbu a1, 25(t0); slli a0, a0, 8; or a0, a0, a1)  # ethertype ARP
  TEST_CASE( 7, a0, 2,  la t0, rx_buf; lbu a0, 33(t0))               # ARP opcode = reply
  TEST_CASE( 8, a0, 0x0a000202, la t0, rx_buf; lbu a0, 40(t0); lbu a1, 41(t0); lbu a2, 42(t0); lbu a3, 43(t0); slli a0, a0, 24; slli a1, a1, 16; or a0, a0, a1; slli a2, a2, 8; or a0, a0, a2; or a0, a0, a3)  # ARP sender IP

  # device interrupt is asserted; ack clears it
  TEST_CASE( 9, a0, 1,  lw a0, 0x060(s0))                            # InterruptStatus
  # PLIC: enable source 1 for context 0 and claim it
  li t0, 1
  sw t0, 4(s1)                                                       # priority[1] = 1
  li t0, 2
  li t1, PLIC + 0x2000
  sw t0, 0(t1)                                                       # enable[ctx0] = source 1
  li t1, PLIC + 0x200000
  sw zero, 0(t1)                                                     # threshold[ctx0] = 0
  TEST_CASE(10, a0, 1,  li t1, PLIC + 0x200004; lw a0, 0(t1))        # claim -> source 1
  li t0, 1
  sw t0, 0x064(s0)                                                   # InterruptACK
  li t1, PLIC + 0x200004
  sw t0, 0(t1)                                                       # complete
  TEST_CASE(11, a0, 0,  lw a0, 0x060(s0))                            # interrupt cleared
  TEST_CASE(12, a0, 0,  li t1, PLIC + 0x200004; lw a0, 0(t1))        # nothing left to claim

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

  .align 4
rx_desc:  .space 128
rx_avail: .space 64
  .align 4
rx_used:  .space 128
  .align 4
tx_desc:  .space 128
tx_avail: .space 64
  .align 4
tx_used:  .space 128
  .align 4
rx_buf:   .space 2048
  .align 4
# virtio_net_hdr_v1 (12 bytes) + Ethernet/ARP request: who has 10.0.2.2? tell 10.0.2.15
tx_frame:
  .space 12
  .byte 0xff,0xff,0xff,0xff,0xff,0xff, 0x52,0x54,0x00,0x12,0x34,0x56, 0x08,0x06
  .byte 0x00,0x01, 0x08,0x00, 0x06, 0x04, 0x00,0x01
  .byte 0x52,0x54,0x00,0x12,0x34,0x56, 10,0,2,15
  .byte 0,0,0,0,0,0, 10,0,2,2

RVTEST_DATA_END
