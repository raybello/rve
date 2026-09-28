# rve directed test: drives the virtio-input device (0x10005000) config-space negotiation and
# queue setup like a guest driver would, specifically exercising BYTE-granular writes to
# select/subsel (0x100/0x101) -- these are documented as separate u8 fields, and Linux's generic
# virtio config accessor (virtio_cread/virtio_cwrite) writes each at its declared width, i.e.
# single-byte stores. This is exactly the path that needed a new read-modify-write byte dispatch
# in rv32.cpp (previously, only whole-word MMIO writes reached any virtio device at all).
# Actual host->guest event delivery (mouse motion/buttons) can't be driven from guest assembly --
# that's checked separately by booting a real kernel and confirming /dev/input/eventN + a real
# received event (see the PR description).
#include "riscv_test.h"
#include "test_macros.h"

#define VIRTIO 0x10005000

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li s0, VIRTIO

  TEST_CASE( 2, a0, 0x74726976, lw a0, 0(s0))          # magic "virt"
  TEST_CASE( 3, a0, 18,         lw a0, 8(s0))          # device id: input

  # ---- select=CFG_ID_NAME(1) via a single BYTE store ----
  li t0, 1
  sb t0, 0x100(s0)
  TEST_CASE( 4, a0, 10, lbu a0, 0x102(s0))              # size = strlen("rve-tablet")
  TEST_CASE( 5, a0, 'r', lbu a0, 0x108(s0))              # name[0]
  TEST_CASE( 6, a0, 't', lbu a0, 0x108+9(s0))            # name[9], last char of "rve-tablet"

  # ---- select=CFG_EV_BITS(0x11) via a BYTE store, subsel=EV_ABS(3) via a separate BYTE store ----
  # (select and subsel land in the same aligned word; this specifically exercises that the second
  # byte store's read-modify-write doesn't clobber the select byte written just before it.)
  li t0, 0x11
  sb t0, 0x100(s0)
  li t0, 3
  sb t0, 0x101(s0)
  TEST_CASE( 7, a0, 0x11, lbu a0, 0x100(s0))             # select unchanged by the subsel write
  TEST_CASE( 8, a0, 3,    lbu a0, 0x101(s0))             # subsel took effect
  TEST_CASE( 9, a0, 3,    lbu a0, 0x108(s0))             # EV_ABS bitmap: bit0 (ABS_X) | bit1 (ABS_Y) = 0x3

  # ---- select=CFG_ABS_INFO(0x12), subsel=ABS_X(0): a whole-WORD write (both bytes at once) ----
  li t0, 0x0012                                          # subsel=0 in byte1, select=0x12 in byte0
  sw t0, 0x100(s0)
  TEST_CASE(11, a0, 0,     lw a0, 0x108(s0))             # abs.min = 0
  TEST_CASE(12, a0, 32767, lw a0, 0x10c(s0))             # abs.max = RVE_ABS_MAX

  # ---- queue setup (proves the word-granular functional registers are untouched by the byte fix) ----
  li t0, 3
  sw t0, 0x070(s0)                                       # ACKNOWLEDGE | DRIVER
  li t0, 0
  sw t0, 0x030(s0)                                       # QueueSel = 0
  li t0, 8
  sw t0, 0x038(s0)                                       # QueueNum
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
  sw t0, 0x044(s0)                                       # QueueReady
  TEST_CASE(13, a0, 1, lw a0, 0x044(s0))                 # queue accepted as ready
  li t0, 0xf
  sw t0, 0x070(s0)                                       # + FEATURES_OK | DRIVER_OK
  TEST_CASE(14, a0, 0xf, lw a0, 0x070(s0))

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

RVTEST_DATA_END
