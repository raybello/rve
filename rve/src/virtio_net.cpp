#include "virtio_net.h"
#include <cstring>

#define VIRTIO_MAGIC 0x74726976u
#define VIRTIO_F_VERSION_1_WORD1 1u  // feature bit 32
#define VIRTIO_NET_F_MAC (1u << 5)
#define VIRTQ_DESC_F_NEXT 1
#define VIRTQ_DESC_F_WRITE 2
#define VIRTIO_NET_HDR_LEN 12u // virtio_net_hdr_v1
#define QUEUE_MAX 256u

VirtioNet::VirtioNet() { reset(); static const uint8_t mac[6] = {0x52, 0x54, 0x00, 0x12, 0x34, 0x56}; memcpy(mac_, mac, 6); }

void VirtioNet::init(GuestMem mem, NetBackend *backend) { mem_ = mem; be_ = backend; }

void VirtioNet::reset()
{
    q_[0] = Queue(); q_[1] = Queue();
    qsel_ = status_ = devFeatSel_ = drvFeatSel_ = intStatus_ = 0;
    drvFeat_[0] = drvFeat_[1] = 0;
    haveHeld_ = false;
}

uint32_t VirtioNet::read(uint32_t off)
{
    Queue &q = q_[qsel_ & 1];
    switch (off)
    {
    case 0x000: return VIRTIO_MAGIC;
    case 0x004: return 2;
    case 0x008: return 1; // network device
    case 0x00c: return 0x52564531; // vendor "RVE1"
    case 0x010: return devFeatSel_ == 0 ? VIRTIO_NET_F_MAC : devFeatSel_ == 1 ? VIRTIO_F_VERSION_1_WORD1 : 0;
    case 0x034: return qsel_ < 2 ? QUEUE_MAX : 0;
    case 0x044: return qsel_ < 2 ? q.ready : 0;
    case 0x060: return intStatus_;
    case 0x070: return status_;
    case 0x0fc: return 0; // config generation
    }
    if (off >= 0x100 && off < 0x106) // config space: mac
    {
        // Byte/half/word reads of the config space all arrive as an aligned word read.
        uint32_t base = off & ~3u, v = 0;
        for (int i = 0; i < 4; i++)
        {
            uint32_t o = base - 0x100 + i;
            if (o < 6) v |= (uint32_t)mac_[o] << (8 * i);
        }
        return v;
    }
    return 0;
}

void VirtioNet::write(uint32_t off, uint32_t val)
{
    Queue &q = q_[qsel_ & 1];
    switch (off)
    {
    case 0x014: devFeatSel_ = val; break;
    case 0x020: drvFeat_[drvFeatSel_ & 1] = val; break;
    case 0x024: drvFeatSel_ = val; break;
    case 0x030: qsel_ = val; break;
    case 0x038: if (qsel_ < 2) q.num = val > QUEUE_MAX ? QUEUE_MAX : val; break;
    case 0x044: if (qsel_ < 2) { q.ready = val & 1; if (q.ready) q.lastAvail = 0; } break;
    case 0x050: if (val == 1) processTx(); else if (val == 0) tick(); break;
    case 0x064: intStatus_ &= ~val; break;
    case 0x070:
        if (val == 0) reset(); else status_ = val;
        break;
    case 0x080: q.desc  = (q.desc  & ~0xffffffffull) | val; break;
    case 0x084: q.desc  = (q.desc  & 0xffffffffull) | ((uint64_t)val << 32); break;
    case 0x090: q.avail = (q.avail & ~0xffffffffull) | val; break;
    case 0x094: q.avail = (q.avail & 0xffffffffull) | ((uint64_t)val << 32); break;
    case 0x0a0: q.used  = (q.used  & ~0xffffffffull) | val; break;
    case 0x0a4: q.used  = (q.used  & 0xffffffffull) | ((uint64_t)val << 32); break;
    }
}

bool VirtioNet::popChain(Queue &q, uint16_t &head, std::vector<Chain> &chain)
{
    if (!q.ready || q.num == 0) return false;
    uint16_t availIdx;
    mem_.read(q.avail + 2, &availIdx, 2);
    if (q.lastAvail == availIdx) return false;
    uint16_t slot;
    mem_.read(q.avail + 4 + 2 * (q.lastAvail % q.num), &slot, 2);
    q.lastAvail++;
    head = slot;
    chain.clear();
    uint16_t idx = slot;
    for (uint32_t hops = 0; hops < q.num; hops++)
    {
        uint8_t d[16];
        mem_.read(q.desc + 16ull * (idx % q.num), d, 16);
        uint64_t addr; uint32_t len; uint16_t flags, next;
        memcpy(&addr, d, 8); memcpy(&len, d + 8, 4); memcpy(&flags, d + 12, 2); memcpy(&next, d + 14, 2);
        chain.push_back({addr, len, (flags & VIRTQ_DESC_F_WRITE) != 0});
        if (!(flags & VIRTQ_DESC_F_NEXT)) break;
        idx = next;
    }
    return true;
}

void VirtioNet::pushUsed(Queue &q, uint16_t head, uint32_t len)
{
    uint16_t usedIdx;
    mem_.read(q.used + 2, &usedIdx, 2);
    uint32_t elem[2] = {head, len};
    mem_.write(q.used + 4 + 8ull * (usedIdx % q.num), elem, 8);
    usedIdx++;
    mem_.write(q.used + 2, &usedIdx, 2);
    intStatus_ |= 1;
}

void VirtioNet::processTx()
{
    if (!be_) return;
    Queue &q = q_[1];
    uint16_t head;
    std::vector<Chain> chain;
    std::vector<uint8_t> buf;
    while (popChain(q, head, chain))
    {
        buf.clear();
        for (auto &c : chain)
        {
            if (c.write) continue;
            size_t at = buf.size();
            buf.resize(at + c.len);
            mem_.read(c.addr, buf.data() + at, c.len);
        }
        if (buf.size() > VIRTIO_NET_HDR_LEN)
            be_->send(buf.data() + VIRTIO_NET_HDR_LEN, buf.size() - VIRTIO_NET_HDR_LEN);
        pushUsed(q, head, 0);
    }
}

bool VirtioNet::deliver(const std::vector<uint8_t> &frame)
{
    Queue &q = q_[0];
    uint16_t head;
    std::vector<Chain> chain;
    if (!popChain(q, head, chain)) return false;
    uint8_t hdr[VIRTIO_NET_HDR_LEN] = {0};
    hdr[10] = 1; // num_buffers = 1
    std::vector<uint8_t> pkt(hdr, hdr + VIRTIO_NET_HDR_LEN);
    pkt.insert(pkt.end(), frame.begin(), frame.end());
    size_t off = 0;
    for (auto &c : chain)
    {
        if (!c.write || off >= pkt.size()) continue;
        size_t n = pkt.size() - off < c.len ? pkt.size() - off : c.len;
        mem_.write(c.addr, pkt.data() + off, n);
        off += n;
    }
    pushUsed(q, head, (uint32_t)off);
    return true;
}

void VirtioNet::tick()
{
    if (!be_ || !(status_ & 4) || !q_[0].ready) return; // DRIVER_OK and RX queue ready
    for (;;)
    {
        if (!haveHeld_)
        {
            if (!be_->poll(held_)) return;
            haveHeld_ = true;
        }
        if (!deliver(held_)) return; // no RX buffer posted yet, retry next tick
        haveHeld_ = false;
    }
}
