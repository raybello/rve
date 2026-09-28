# rve directed test: drives the virtio-gpu device (0x10003000) and the PLIC like a guest driver
# would. Exercises the control-queue command/response protocol (GET_DISPLAY_INFO,
# RESOURCE_CREATE_2D, RESOURCE_UNREF) and the PLIC claim/complete path on source 2. This only
# checks what a guest driver can observe (response codes and GET_DISPLAY_INFO's reported fields);
# the device's actual host-visible pixel output is checked separately by booting a real kernel
# with a DRM driver and screenshotting the result (see the PR description).
#include "riscv_test.h"
#include "test_macros.h"

#define VIRTIO   0x10003000
#define PLIC     0x0c000000

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li s0, VIRTIO
  li s1, PLIC

  TEST_CASE( 2, a0, 0x74726976, lw a0, 0(s0))          # magic "virt"
  TEST_CASE( 3, a0, 16,         lw a0, 8(s0))          # device id: GPU
  TEST_CASE( 4, a0, 1,          lw a0, 0x108(s0))      # config: num_scanouts

  li t0, 3
  sw t0, 0x070(s0)                                     # ACKNOWLEDGE | DRIVER
  li t0, 0
  sw t0, 0x030(s0)                                     # QueueSel = 0 (controlq)
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

  # ---- command 0 (ring slot 0): GET_DISPLAY_INFO ----
  la t0, req0
  li t1, 0x0100                                        # CMD_GET_DISPLAY_INFO
  sw t1, 0(t0)
  sw zero, 4(t0)
  sd zero, 8(t0)
  sw zero, 16(t0)
  sw zero, 20(t0)

  la t0, desc
  la t1, req0
  sd t1, 0(t0)
  li t2, 24
  sw t2, 8(t0)
  li t2, 1
  sh t2, 12(t0)
  li t2, 1
  sh t2, 14(t0)
  addi t0, t0, 16
  la t1, resp0
  sd t1, 0(t0)
  li t2, 408
  sw t2, 8(t0)
  li t2, 2
  sh t2, 12(t0)
  sh zero, 14(t0)

  la t0, avail
  sh zero, 4(t0)                                       # ring[0] = 0
  li t1, 1
  sh t1, 2(t0)                                         # avail.idx = 1
  li t0, 0
  sw t0, 0x050(s0)                                     # QueueNotify = 0 (controlq)

  li t3, 200000
1: la t0, used
  lhu t1, 2(t0)
  bnez t1, 2f
  addi t3, t3, -1
  bnez t3, 1b
2:
  TEST_CASE( 5, a0, 1,      la t0, used; lhu a0, 2(t0))                   # one completion
  TEST_CASE( 6, a0, 0x1101, la t0, resp0; lw a0, 0(t0))                   # RESP_OK_DISPLAY_INFO
  TEST_CASE( 7, a0, 850,    la t0, resp0; lw a0, 24+8(t0))                # scanout0.r.width
  TEST_CASE( 8, a0, 478,    la t0, resp0; lw a0, 24+12(t0))               # scanout0.r.height
  TEST_CASE( 9, a0, 1,      la t0, resp0; lw a0, 24+16(t0))               # scanout0.enabled

  # ---- command 1 (ring slot 1): RESOURCE_CREATE_2D (resource 1, 4x4, B8G8R8A8) ----
  la t0, req1
  li t1, 0x0101                                        # CMD_RESOURCE_CREATE_2D
  sw t1, 0(t0)
  sw zero, 4(t0)
  sd zero, 8(t0)
  sw zero, 16(t0)
  sw zero, 20(t0)
  li t1, 1
  sw t1, 24(t0)                                        # resource_id = 1
  li t1, 1
  sw t1, 28(t0)                                        # format = B8G8R8A8_UNORM
  li t1, 4
  sw t1, 32(t0)                                        # width = 4
  sw t1, 36(t0)                                        # height = 4

  la t0, desc
  la t1, req1
  sd t1, 0(t0)
  li t2, 40
  sw t2, 8(t0)
  li t2, 1
  sh t2, 12(t0)
  li t2, 1
  sh t2, 14(t0)
  addi t0, t0, 16
  la t1, resp1
  sd t1, 0(t0)
  li t2, 24
  sw t2, 8(t0)
  li t2, 2
  sh t2, 12(t0)
  sh zero, 14(t0)

  la t0, avail
  li t1, 0
  sh t1, 6(t0)                                         # ring[1] = 0
  li t1, 2
  sh t1, 2(t0)                                         # avail.idx = 2
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
  TEST_CASE(10, a0, 0x1100, la t0, resp1; lw a0, 0(t0))                   # RESP_OK_NODATA

  # ---- command 2 (ring slot 2): RESOURCE_UNREF (resource 1) ----
  la t0, req2
  li t1, 0x0102                                        # CMD_RESOURCE_UNREF
  sw t1, 0(t0)
  sw zero, 4(t0)
  sd zero, 8(t0)
  sw zero, 16(t0)
  sw zero, 20(t0)
  li t1, 1
  sw t1, 24(t0)                                        # resource_id = 1
  sw zero, 28(t0)

  la t0, desc
  la t1, req2
  sd t1, 0(t0)
  li t2, 32
  sw t2, 8(t0)
  li t2, 1
  sh t2, 12(t0)
  li t2, 1
  sh t2, 14(t0)
  addi t0, t0, 16
  la t1, resp2
  sd t1, 0(t0)
  li t2, 24
  sw t2, 8(t0)
  li t2, 2
  sh t2, 12(t0)
  sh zero, 14(t0)

  la t0, avail
  li t1, 0
  sh t1, 8(t0)                                         # ring[2] = 0
  li t1, 3
  sh t1, 2(t0)                                         # avail.idx = 3
  li t0, 0
  sw t0, 0x050(s0)

  li t3, 200000
5: la t0, used
  lhu t1, 2(t0)
  li t2, 3
  beq t1, t2, 6f
  addi t3, t3, -1
  bnez t3, 5b
6:
  TEST_CASE(11, a0, 0x1100, la t0, resp2; lw a0, 0(t0))                   # RESP_OK_NODATA

  # device interrupt is asserted (every completion sets it); PLIC claim/complete on source 2
  TEST_CASE(12, a0, 1,  lw a0, 0x060(s0))                          # InterruptStatus
  li t0, 1
  sw t0, 8(s1)                                                     # priority[2] = 1
  li t0, 4
  li t1, PLIC + 0x2000
  sw t0, 0(t1)                                                     # enable[ctx0] bit2 = source 2
  li t1, PLIC + 0x200000
  sw zero, 0(t1)                                                   # threshold[ctx0] = 0
  TEST_CASE(13, a0, 2,  li t1, PLIC + 0x200004; lw a0, 0(t1))       # claim -> source 2
  li t0, 1
  sw t0, 0x064(s0)                                                 # InterruptACK
  li t0, 2
  li t1, PLIC + 0x200004
  sw t0, 0(t1)                                                     # complete
  TEST_CASE(14, a0, 0,  lw a0, 0x060(s0))                          # interrupt cleared
  TEST_CASE(15, a0, 0,  li t1, PLIC + 0x200004; lw a0, 0(t1))      # nothing left to claim

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
req0:  .space 24
resp0: .space 408
  .align 4
req1:  .space 40
resp1: .space 24
  .align 4
req2:  .space 32
resp2: .space 24

RVTEST_DATA_END
