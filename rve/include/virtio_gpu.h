// virtio-mmio (v2 / "modern") GPU device, 2D-only (no VIRTIO_GPU_F_VIRGL / 3D command support).
// Two virtqueues: controlq (queue 0, 2D resource/scanout commands) and cursorq (queue 1, drained
// but otherwise ignored -- this project's pointer support is virtio-input, not the GPU cursor
// plane). Guest memory is reached through GuestMem so the device can be unit-tested without the
// CPU. Host code (rve/src/app.cpp) reads the current scanout via framebufferRGBA()/displayWidth()/
// displayHeight()/frameGeneration() to blit it into its OpenGL texture -- no direct RAM peeking
// like the old simple-framebuffer window.
#pragma once
#include "virtio_common.h"
#include <cstdint>
#include <unordered_map>
#include <vector>

#define VIRTIO_GPU_BASE 0x10003000u
#define VIRTIO_GPU_SIZE 0x1000u
#define VIRTIO_GPU_IRQ 2 // PLIC source (1 = virtio-net, 3 = virtio-blk)

class VirtioGpu
{
public:
    VirtioGpu();
    void init(GuestMem mem);
    void reset();
    uint32_t read(uint32_t off);
    void write(uint32_t off, uint32_t val);
    // Services whichever queue was notified (called from write() on a QueueNotify write).
    void tick();
    bool irqLevel() const { return intStatus_ != 0; }
    bool active() const { return (status_ & 4) != 0; } // DRIVER_OK

    // Host-side display accessors (rve/src/app.cpp). framebufferRGBA() is always
    // displayWidth()*displayHeight()*4 bytes, tightly packed, GL_RGBA/GL_UNSIGNED_BYTE order.
    uint32_t displayWidth() const { return dispWidth_; }
    uint32_t displayHeight() const { return dispHeight_; }
    const uint8_t *framebufferRGBA() const { return framebuffer_.data(); }
    // Bumped on every RESOURCE_FLUSH that touches the bound scanout; host polls this to know
    // when to re-upload (and possibly resize) its texture instead of doing it unconditionally.
    uint64_t frameGeneration() const { return frameGen_; }

private:
    struct Queue
    {
        uint32_t num = 0, ready = 0;
        uint64_t desc = 0, avail = 0, used = 0;
        uint16_t lastAvail = 0;
    };
    struct Chain { uint64_t addr; uint32_t len; bool write; };
    struct MemEntry { uint64_t addr; uint32_t length; };
    struct Resource
    {
        uint32_t width = 0, height = 0, format = 0;
        std::vector<uint8_t> data; // native format bytes, width*height*4
        std::vector<MemEntry> backing;
    };

    bool popChain(Queue &q, uint16_t &head, std::vector<Chain> &chain);
    void pushUsed(Queue &q, uint16_t head, uint32_t len);
    void processControl();
    void processCursor();
    void handleCommand(const std::vector<uint8_t> &req, std::vector<uint8_t> &resp);
    void blitResourceToScanout(uint32_t resourceId, uint32_t x, uint32_t y, uint32_t w, uint32_t h);
    // Copies `len` bytes starting at virtual offset `offset` within a resource's scatter-gather
    // backing list into `dst`. Any range not covered by the list is left untouched in `dst`.
    void readFromBacking(const std::vector<MemEntry> &backing, uint64_t offset, uint8_t *dst, uint32_t len);

    GuestMem mem_;
    Queue q_[2]; // 0 = controlq, 1 = cursorq
    uint32_t qsel_, status_, devFeatSel_, drvFeatSel_, intStatus_;
    uint32_t drvFeat_[2];
    uint32_t shmSel_ = 0; // virtio-mmio v2 SharedMemorySel; no shared memory regions are supported

    std::unordered_map<uint32_t, Resource> resources_;
    uint32_t scanoutResourceId_ = 0; // resource currently bound to scanout 0 (0 = none)
    std::vector<uint8_t> framebuffer_;
    uint32_t dispWidth_ = 850, dispHeight_ = 478; // matches the old simple-framebuffer default
    uint64_t frameGen_ = 0;
};
