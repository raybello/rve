// virtio-mmio (v2 / "modern") input device: a single absolute pointer ("tablet"-style, matching
// how QEMU/VNC/SPICE integrate a host mouse without pointer grabbing/warping) plus left/right/
// middle buttons. Two virtqueues, per spec: eventq (queue 0, device->driver: the driver posts
// empty device-writable buffers ahead of time and the device fills them with virtio_input_event
// {u16 type, code; u32 value} structs as host input arrives) and statusq (queue 1, driver->device:
// LED/haptic feedback). This device has no LEDs/haptics to drive, so statusq requests are drained
// and acknowledged but otherwise ignored -- but the queue itself must still be a real, allocatable
// virtqueue: Linux's virtio_input driver allocates both queues via one virtio_find_vqs() call and
// fails the whole probe (-ENOENT) if either one reports QueueNumMax=0. Guest memory is reached
// through GuestMem so the device can be unit-tested without the CPU.
#pragma once
#include "virtio_common.h"
#include <cstdint>
#include <deque>
#include <vector>

#define VIRTIO_INPUT_BASE 0x10005000u
#define VIRTIO_INPUT_SIZE 0x1000u
#define VIRTIO_INPUT_IRQ 4 // PLIC source (1=virtio-net, 2=virtio-gpu, 3=virtio-blk)

// Linux input-event-codes.h values this device needs (kept local so it doesn't need a guest
// kernel header dependency).
#define RVE_EV_SYN 0x00
#define RVE_EV_KEY 0x01
#define RVE_EV_ABS 0x03
#define RVE_SYN_REPORT 0
#define RVE_BTN_LEFT 0x110
#define RVE_BTN_RIGHT 0x111
#define RVE_BTN_MIDDLE 0x112
#define RVE_ABS_X 0x00
#define RVE_ABS_Y 0x01
#define RVE_ABS_MAX 32767 // absolute-axis range; host coordinates are normalized into [0, MAX]

class VirtioInput
{
public:
    VirtioInput();
    void init(GuestMem mem);
    void reset();
    uint32_t read(uint32_t off);
    void write(uint32_t off, uint32_t val);
    // Delivers any queued events into posted guest buffers. Cheap when idle.
    void tick();
    bool irqLevel() const { return intStatus_ != 0; }
    bool active() const { return (status_ & 4) != 0; } // DRIVER_OK

    // Host-side (rve/src/app.cpp SDL mouse handlers). x/y are pre-normalized to [0, RVE_ABS_MAX].
    void pushAbsMotion(uint16_t x, uint16_t y);
    void pushButton(uint16_t linuxBtnCode, bool down);

private:
    struct Queue
    {
        uint32_t num = 0, ready = 0;
        uint64_t desc = 0, avail = 0, used = 0;
        uint16_t lastAvail = 0;
    };
    struct Chain { uint64_t addr; uint32_t len; bool write; };
    struct Event { uint16_t type, code; uint32_t value; };

    bool popChain(Queue &q, uint16_t &head, std::vector<Chain> &chain);
    void pushUsed(Queue &q, uint16_t head, uint32_t len);
    void pushEvent(uint16_t type, uint16_t code, uint32_t value);
    void processStatus(); // drains statusq: nothing to act on, no LEDs/haptics exist
    void updateConfigResponse(); // recomputes cfgData_/cfgSize_ from cfgSelect_/cfgSubsel_

    GuestMem mem_;
    Queue q_[2]; // 0 = eventq, 1 = statusq
    uint32_t qsel_, status_, devFeatSel_, drvFeatSel_, intStatus_;
    uint32_t drvFeat_[2];

    uint8_t cfgSelect_ = 0, cfgSubsel_ = 0, cfgSize_ = 0;
    std::vector<uint8_t> cfgData_; // 128 bytes, per virtio_input_config's union

    std::deque<Event> pending_; // events not yet delivered because no buffer was posted
};
