// Frame transport behind the virtio-net device. The device hands guest Ethernet frames to
// send() and pulls frames destined for the guest from poll(). Implementations: NullBackend
// (drops everything), LoopbackBackend (tests), UserNetBackend (usernet.h, in-browser stack).
#pragma once
#include <cstddef>
#include <cstdint>
#include <deque>
#include <vector>

class NetBackend
{
public:
    virtual ~NetBackend() {}
    virtual void send(const uint8_t *frame, size_t len) = 0;
    // Returns true and fills `frame` when a frame for the guest is available.
    virtual bool poll(std::vector<uint8_t> &frame) = 0;
};

class NullBackend : public NetBackend
{
public:
    void send(const uint8_t *, size_t) override {}
    bool poll(std::vector<uint8_t> &) override { return false; }
};

// Echoes every transmitted frame back to the guest (device tests).
class LoopbackBackend : public NetBackend
{
public:
    std::deque<std::vector<uint8_t>> q;
    void send(const uint8_t *frame, size_t len) override { q.emplace_back(frame, frame + len); }
    bool poll(std::vector<uint8_t> &frame) override
    {
        if (q.empty()) return false;
        frame = std::move(q.front());
        q.pop_front();
        return true;
    }
};
