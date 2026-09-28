// Shared plumbing for this project's virtio-mmio devices (VirtioNet, VirtioBlk, ...).
#pragma once
#include <cstdint>
#include <functional>

// Guest memory access, injected so a device can be unit-tested without the CPU.
struct GuestMem
{
    std::function<void(uint64_t pa, void *dst, size_t n)> read;
    std::function<void(uint64_t pa, const void *src, size_t n)> write;
};
