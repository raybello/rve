// virtio-mmio (v2 / "modern") entropy device: the standard fix for a RISC-V guest kernel's CRNG
// taking a very long time (in a deterministic emulator with no hardware RNG, sometimes minutes,
// or effectively forever until a keyboard/mouse interrupt happens to add enough jitter entropy)
// to initialize. Any process that calls the blocking form of getrandom() -- which wlroots, labwc,
// foot and seatd all do at startup, e.g. for socket lock-file names -- hangs silently until
// "random: crng init done" appears in dmesg. That is exactly the "black screen until you mash
// keys" symptom this device exists to fix: it gives the guest kernel a real entropy source so the
// CRNG seeds almost immediately at boot, no user input required.
//
// Protocol per the virtio spec (5.4 Entropy Device): a single virtqueue. The driver posts
// device-writable buffers of any length; the device fills as many bytes as it can (up to each
// buffer's length) with random data from the host and completes it with the byte count actually
// written. No request/response header, no command codes, no config space -- the simplest device
// in the spec. Guest memory is reached through GuestMem so the device can be unit-tested without
// the CPU.
#pragma once
#include "virtio_common.h"
#include <cstdint>
#include <vector>

#define VIRTIO_RNG_BASE 0x10006000u
#define VIRTIO_RNG_SIZE 0x1000u
#define VIRTIO_RNG_IRQ 5 // PLIC source (1=virtio-net, 2=virtio-gpu, 3=virtio-blk, 4=virtio-input)

class VirtioRng
{
public:
    VirtioRng();
    void init(GuestMem mem);
    void reset();
    uint32_t read(uint32_t off);
    void write(uint32_t off, uint32_t val);
    // Fills every currently-posted buffer with host-sourced random bytes. Cheap when idle (the
    // avail ring is empty between notifies -- there's no host-async event source to poll for).
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

    bool popChain(uint16_t &head, std::vector<Chain> &chain);
    void pushUsed(uint16_t head, uint32_t len);

    GuestMem mem_;
    Queue q_; // the entropy device has exactly one virtqueue
    uint32_t qsel_, status_, devFeatSel_, drvFeatSel_, intStatus_;
    uint32_t drvFeat_[2];
};
