#include "virtio_input.h"
#include <cstring>

#define VIRTIO_MAGIC 0x74726976u
#define VIRTIO_F_VERSION_1_WORD1 1u // feature bit 32
#define VIRTQ_DESC_F_NEXT 1
#define VIRTQ_DESC_F_WRITE 2
#define QUEUE_MAX 256u

// virtio_input_config select values (VIRTIO_INPUT_CFG_*)
#define CFG_ID_NAME 0x01u
#define CFG_ID_DEVIDS 0x03u
#define CFG_EV_BITS 0x11u
#define CFG_ABS_INFO 0x12u

VirtioInput::VirtioInput() { reset(); }

void VirtioInput::init(GuestMem mem) { mem_ = mem; }

void VirtioInput::reset()
{
    q_[0] = Queue(); q_[1] = Queue();
    qsel_ = status_ = devFeatSel_ = drvFeatSel_ = intStatus_ = 0;
    drvFeat_[0] = drvFeat_[1] = 0;
    cfgSelect_ = cfgSubsel_ = cfgSize_ = 0;
    cfgData_.assign(128, 0);
    pending_.clear();
}

// Fills cfgData_/cfgSize_ for the current (select, subsel) pair. This device advertises exactly
// one absolute pointer (ABS_X/ABS_Y, range [0, RVE_ABS_MAX]) and three buttons (BTN_LEFT/RIGHT/
// MIDDLE) -- enough for a generic "tablet"-style pointer, nothing else (no touch, no multitouch,
// no keyboard -- rve-kbd already covers the keyboard).
void VirtioInput::updateConfigResponse()
{
    cfgData_.assign(128, 0);
    cfgSize_ = 0;
    auto setBit = [&](unsigned bit) { cfgData_[bit / 8] |= (uint8_t)(1u << (bit % 8)); };

    switch (cfgSelect_)
    {
    case CFG_ID_NAME:
    {
        static const char name[] = "rve-tablet";
        memcpy(cfgData_.data(), name, sizeof(name) - 1);
        cfgSize_ = sizeof(name) - 1;
        break;
    }
    case CFG_ID_DEVIDS:
        // bustype, vendor, product, version (u16 each); zero is a valid "unspecified" value.
        cfgSize_ = 8;
        break;
    case CFG_EV_BITS:
        if (cfgSubsel_ == RVE_EV_SYN) { setBit(RVE_SYN_REPORT); cfgSize_ = 1; }
        else if (cfgSubsel_ == RVE_EV_KEY) { setBit(RVE_BTN_LEFT); setBit(RVE_BTN_RIGHT); setBit(RVE_BTN_MIDDLE); cfgSize_ = (RVE_BTN_MIDDLE / 8) + 1; }
        else if (cfgSubsel_ == RVE_EV_ABS) { setBit(RVE_ABS_X); setBit(RVE_ABS_Y); cfgSize_ = 1; }
        break;
    case CFG_ABS_INFO:
        if (cfgSubsel_ == RVE_ABS_X || cfgSubsel_ == RVE_ABS_Y)
        {
            uint32_t absinfo[5] = {0, RVE_ABS_MAX, 0, 0, 0}; // min, max, fuzz, flat, res
            memcpy(cfgData_.data(), absinfo, sizeof(absinfo));
            cfgSize_ = sizeof(absinfo);
        }
        break;
    default:
        break; // size stays 0: "this (select, subsel) is not supported"
    }
}

uint32_t VirtioInput::read(uint32_t off)
{
    Queue &q = q_[qsel_ & 1];
    switch (off)
    {
    case 0x000: return VIRTIO_MAGIC;
    case 0x004: return 2;
    case 0x008: return 18; // input device
    case 0x00c: return 0x52564531; // vendor "RVE1"
    case 0x010: return devFeatSel_ == 1 ? VIRTIO_F_VERSION_1_WORD1 : 0;
    case 0x034: return qsel_ < 2 ? QUEUE_MAX : 0;
    case 0x044: return qsel_ < 2 ? q.ready : 0;
    case 0x060: return intStatus_;
    case 0x070: return status_;
    case 0x0fc: return 0; // config generation
    case 0x0b0: case 0x0b4: return 0xffffffffu; // no shared memory regions (see virtio_gpu.cpp)
    case 0x0b8: case 0x0bc: return 0;
    }
    if (off >= 0x100 && off < 0x188) // config space: select, subsel, size, reserved, then union
    {
        uint32_t base = off & ~3u, v = 0;
        for (int i = 0; i < 4; i++)
        {
            uint32_t byteOff = base - 0x100 + i;
            uint8_t b = 0;
            if (byteOff == 0) b = cfgSelect_;
            else if (byteOff == 1) b = cfgSubsel_;
            else if (byteOff == 2) b = cfgSize_;
            else if (byteOff >= 8 && byteOff < 8 + cfgData_.size()) b = cfgData_[byteOff - 8];
            v |= (uint32_t)b << (8 * i);
        }
        return v;
    }
    return 0;
}

void VirtioInput::write(uint32_t off, uint32_t val)
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
    case 0x050: if (val == 0) tick(); else if (val == 1) processStatus(); break;
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
    case 0x100: // select (byte 0) + subsel (byte 1) of virtio_input_config
        // Linux's generic virtio config accessor writes these two u8 fields at their declared
        // byte width (iowrite8), which rv32.cpp's byte-level MMIO dispatch turns into a
        // read-modify-write of this whole word through read()/write() -- so a lone "select" byte
        // write arrives here with the previous subsel_ already preserved in bits [15:8], and a
        // lone "subsel" byte write arrives with the just-set select_ preserved in bits [7:0].
        cfgSelect_ = val & 0xff;
        cfgSubsel_ = (val >> 8) & 0xff;
        updateConfigResponse();
        break;
    }
}

void VirtioInput::pushEvent(uint16_t type, uint16_t code, uint32_t value)
{
    pending_.push_back({type, code, value});
    tick();
}

void VirtioInput::pushAbsMotion(uint16_t x, uint16_t y)
{
    pushEvent(RVE_EV_ABS, RVE_ABS_X, x);
    pushEvent(RVE_EV_ABS, RVE_ABS_Y, y);
    pushEvent(RVE_EV_SYN, RVE_SYN_REPORT, 0);
}

void VirtioInput::pushButton(uint16_t linuxBtnCode, bool down)
{
    pushEvent(RVE_EV_KEY, linuxBtnCode, down ? 1u : 0u);
    pushEvent(RVE_EV_SYN, RVE_SYN_REPORT, 0);
}

bool VirtioInput::popChain(Queue &q, uint16_t &head, std::vector<Chain> &chain)
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

void VirtioInput::pushUsed(Queue &q, uint16_t head, uint32_t len)
{
    uint16_t usedIdx;
    mem_.read(q.used + 2, &usedIdx, 2);
    uint32_t elem[2] = {head, len};
    mem_.write(q.used + 4 + 8ull * (usedIdx % q.num), elem, 8);
    usedIdx++;
    mem_.write(q.used + 2, &usedIdx, 2);
    intStatus_ |= 1;
}

void VirtioInput::tick()
{
    while (!pending_.empty())
    {
        uint16_t head;
        std::vector<Chain> chain;
        if (!popChain(q_[0], head, chain)) return; // no buffer posted yet; retry once the driver posts one
        Event e = pending_.front();
        pending_.pop_front();
        uint8_t buf[8];
        memcpy(buf + 0, &e.type, 2);
        memcpy(buf + 2, &e.code, 2);
        memcpy(buf + 4, &e.value, 4);
        uint32_t written = 0;
        for (auto &c : chain)
        {
            if (!c.write || written >= sizeof(buf)) continue;
            uint32_t n = c.len < sizeof(buf) - written ? c.len : (uint32_t)(sizeof(buf) - written);
            mem_.write(c.addr, buf + written, n);
            written += n;
        }
        pushUsed(q_[0], head, written);
    }
}

// statusq: driver->device LED/haptic feedback. This device has none, so requests are just
// drained and acknowledged -- see the header comment for why the queue must still exist at all.
void VirtioInput::processStatus()
{
    uint16_t head;
    std::vector<Chain> chain;
    while (popChain(q_[1], head, chain))
        pushUsed(q_[1], head, 0);
}
