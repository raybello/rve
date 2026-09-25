// virtio-mmio (v2 / "modern") network device, split virtqueues, no offloads.
// Queue 0 = receiveq, queue 1 = transmitq. Guest memory is reached through GuestMem so the
// device can be unit-tested without the CPU.
#pragma once
#include "netbackend.h"
#include <cstdint>
#include <functional>
#include <vector>

#define VIRTIO_NET_BASE 0x10002000u
#define VIRTIO_NET_SIZE 0x1000u
#define VIRTIO_NET_IRQ 1 // PLIC source

struct GuestMem
{
    std::function<void(uint64_t pa, void *dst, size_t n)> read;
    std::function<void(uint64_t pa, const void *src, size_t n)> write;
};

class VirtioNet
{
public:
    VirtioNet();
    void init(GuestMem mem, NetBackend *backend); // backend is not owned
    void reset();
    uint32_t read(uint32_t off);
    void write(uint32_t off, uint32_t val);
    // Deliver pending backend frames to the guest RX queue. Cheap when idle.
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
    void processTx();
    bool deliver(const std::vector<uint8_t> &frame);

    GuestMem mem_;
    NetBackend *be_ = nullptr;
    Queue q_[2];
    uint32_t qsel_, status_, devFeatSel_, drvFeatSel_, intStatus_;
    uint32_t drvFeat_[2];
    uint8_t mac_[6];
    std::vector<uint8_t> held_; // frame that arrived while the RX queue had no buffer
    bool haveHeld_ = false;
};
