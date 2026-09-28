// virtio-mmio (v2 / "modern") block device, single request virtqueue, no advanced features
// (no discard/write-zeroes/multi-queue). Backed by a flat host disk image file. Guest memory is
// reached through GuestMem so the device can be unit-tested without the CPU.
#pragma once
#include "virtio_common.h"
#include <cstdint>
#include <cstdio>
#include <string>
#include <vector>

#define VIRTIO_BLK_BASE 0x10004000u
#define VIRTIO_BLK_SIZE 0x1000u
#define VIRTIO_BLK_IRQ 3 // PLIC source (1 = virtio-net, 2 reserved for a future virtio-gpu)

class VirtioBlk
{
public:
    VirtioBlk();
    ~VirtioBlk();
    void init(GuestMem mem);
    // Opens (read/write) the backing image file; capacity is derived from its size. Returns false
    // (device stays present but reports zero capacity) if the file can't be opened.
    bool attachImage(const std::string &path);
    void reset();
    uint32_t read(uint32_t off);
    void write(uint32_t off, uint32_t val);
    // Services queue 0 when notified (called from write() on a QueueNotify write).
    void tick();
    bool irqLevel() const { return intStatus_ != 0; }
    bool active() const { return (status_ & 4) != 0; } // DRIVER_OK

private:
    struct Queue
    {
        uint32_t num = 0, ready = 0;
        uint64_t desc = 0, avail = 0, used = 0;
        uint16_t lastAvail = 0;
    };
    struct Chain { uint64_t addr; uint32_t len; bool write; };
    bool popChain(Queue &q, uint16_t &head, std::vector<Chain> &chain);
    void pushUsed(Queue &q, uint16_t head, uint32_t len);
    void processQueue();

    GuestMem mem_;
    FILE *img_ = nullptr;
    uint64_t capacitySectors_ = 0; // 512-byte sectors
    Queue q_;
    uint32_t qsel_, status_, devFeatSel_, drvFeatSel_, intStatus_;
    uint32_t drvFeat_[2];
};
