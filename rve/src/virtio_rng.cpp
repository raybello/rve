#include "virtio_rng.h"
#include <cstring>
#include <random>

#define VIRTIO_MAGIC 0x74726976u
#define VIRTIO_F_VERSION_1_WORD1 1u // feature bit 32
#define VIRTQ_DESC_F_NEXT 1
#define VIRTQ_DESC_F_WRITE 2
#define QUEUE_MAX 256u

VirtioRng::VirtioRng() { reset(); }

void VirtioRng::init(GuestMem mem) { mem_ = mem; }

void VirtioRng::reset()
{
    q_ = Queue();
    qsel_ = status_ = devFeatSel_ = drvFeatSel_ = intStatus_ = 0;
    drvFeat_[0] = drvFeat_[1] = 0;
}

uint32_t VirtioRng::read(uint32_t off)
{
    switch (off)
    {
    case 0x000: return VIRTIO_MAGIC;
    case 0x004: return 2;
    case 0x008: return 4; // VIRTIO_ID_RNG (entropy device)
    case 0x00c: return 0x52564531; // vendor "RVE1"
    case 0x010: return devFeatSel_ == 1 ? VIRTIO_F_VERSION_1_WORD1 : 0;
    case 0x034: return qsel_ == 0 ? QUEUE_MAX : 0;
    case 0x044: return qsel_ == 0 ? q_.ready : 0;
    case 0x060: return intStatus_;
    case 0x070: return status_;
    case 0x0fc: return 0; // config generation
    case 0x0b0: case 0x0b4: return 0xffffffffu; // no shared memory regions (see virtio_gpu.cpp)
    case 0x0b8: case 0x0bc: return 0;
    }
    return 0;
}

void VirtioRng::write(uint32_t off, uint32_t val)
{
    switch (off)
    {
    case 0x014: devFeatSel_ = val; break;
    case 0x020: drvFeat_[drvFeatSel_ & 1] = val; break;
    case 0x024: drvFeatSel_ = val; break;
    case 0x030: qsel_ = val; break;
    case 0x038: if (qsel_ == 0) q_.num = val > QUEUE_MAX ? QUEUE_MAX : val; break;
    case 0x044: if (qsel_ == 0) { q_.ready = val & 1; if (q_.ready) q_.lastAvail = 0; } break;
    case 0x050: if (val == 0) tick(); break;
    case 0x064: intStatus_ &= ~val; break;
    case 0x070:
        if (val == 0) reset(); else status_ = val;
        break;
    case 0x080: q_.desc  = (q_.desc  & ~0xffffffffull) | val; break;
    case 0x084: q_.desc  = (q_.desc  & 0xffffffffull) | ((uint64_t)val << 32); break;
    case 0x090: q_.avail = (q_.avail & ~0xffffffffull) | val; break;
    case 0x094: q_.avail = (q_.avail & 0xffffffffull) | ((uint64_t)val << 32); break;
    case 0x0a0: q_.used  = (q_.used  & ~0xffffffffull) | val; break;
    case 0x0a4: q_.used  = (q_.used  & 0xffffffffull) | ((uint64_t)val << 32); break;
    }
}

bool VirtioRng::popChain(uint16_t &head, std::vector<Chain> &chain)
{
    if (!q_.ready || q_.num == 0) return false;
    uint16_t availIdx;
    mem_.read(q_.avail + 2, &availIdx, 2);
    if (q_.lastAvail == availIdx) return false;
    uint16_t slot;
    mem_.read(q_.avail + 4 + 2 * (q_.lastAvail % q_.num), &slot, 2);
    q_.lastAvail++;
    head = slot;
    chain.clear();
    uint16_t idx = slot;
    for (uint32_t hops = 0; hops < q_.num; hops++)
    {
        uint8_t d[16];
        mem_.read(q_.desc + 16ull * (idx % q_.num), d, 16);
        uint64_t addr; uint32_t len; uint16_t flags, next;
        memcpy(&addr, d, 8); memcpy(&len, d + 8, 4); memcpy(&flags, d + 12, 2); memcpy(&next, d + 14, 2);
        chain.push_back({addr, len, (flags & VIRTQ_DESC_F_WRITE) != 0});
        if (!(flags & VIRTQ_DESC_F_NEXT)) break;
        idx = next;
    }
    return true;
}

void VirtioRng::pushUsed(uint16_t head, uint32_t len)
{
    uint16_t usedIdx;
    mem_.read(q_.used + 2, &usedIdx, 2);
    uint32_t elem[2] = {head, len};
    mem_.write(q_.used + 4 + 8ull * (usedIdx % q_.num), elem, 8);
    usedIdx++;
    mem_.write(q_.used + 2, &usedIdx, 2);
    intStatus_ |= 1;
}

void VirtioRng::tick()
{
    // Host entropy source (a real OS-backed RNG, not guest-visible determinism); function-local
    // static so it's constructed once and reused, matching how one would use it in normal C++.
    static std::random_device rd;
    uint16_t head;
    std::vector<Chain> chain;
    // Nothing async to wait for -- every posted buffer can be filled immediately, so one notify
    // drains the entire avail ring in a single pass (unlike virtio-input, which waits for host
    // events that may not exist yet).
    while (popChain(head, chain))
    {
        uint32_t written = 0;
        for (auto &c : chain)
        {
            if (!c.write) continue;
            std::vector<uint8_t> buf(c.len);
            for (size_t i = 0; i < buf.size(); i += 4)
            {
                uint32_t r = rd();
                size_t n = buf.size() - i < 4 ? buf.size() - i : 4;
                memcpy(buf.data() + i, &r, n);
            }
            if (!buf.empty())
                mem_.write(c.addr, buf.data(), buf.size());
            written += (uint32_t)buf.size();
        }
        pushUsed(head, written);
    }
}
