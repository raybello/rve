#include "virtio_blk.h"
#include <cstring>

#define VIRTIO_MAGIC 0x74726976u
#define VIRTIO_F_VERSION_1_WORD1 1u // feature bit 32
#define VIRTQ_DESC_F_NEXT 1
#define VIRTQ_DESC_F_WRITE 2
#define QUEUE_MAX 256u
#define SECTOR_SIZE 512u

#define VIRTIO_BLK_T_IN 0u
#define VIRTIO_BLK_T_OUT 1u
#define VIRTIO_BLK_T_FLUSH 4u
#define VIRTIO_BLK_S_OK 0u
#define VIRTIO_BLK_S_IOERR 1u
#define VIRTIO_BLK_S_UNSUPP 2u

VirtioBlk::VirtioBlk() { reset(); }
VirtioBlk::~VirtioBlk() { if (img_) fclose(img_); }

void VirtioBlk::init(GuestMem mem) { mem_ = mem; }

bool VirtioBlk::attachImage(const std::string &path)
{
    if (img_) { fclose(img_); img_ = nullptr; }
    img_ = fopen(path.c_str(), "r+b");
    if (!img_) { capacitySectors_ = 0; return false; }
    fseek(img_, 0, SEEK_END);
    long size = ftell(img_);
    capacitySectors_ = size > 0 ? (uint64_t)size / SECTOR_SIZE : 0;
    return true;
}

void VirtioBlk::reset()
{
    q_ = Queue();
    qsel_ = status_ = devFeatSel_ = drvFeatSel_ = intStatus_ = 0;
    drvFeat_[0] = drvFeat_[1] = 0;
}

uint32_t VirtioBlk::read(uint32_t off)
{
    switch (off)
    {
    case 0x000: return VIRTIO_MAGIC;
    case 0x004: return 2;
    case 0x008: return 2; // block device
    case 0x00c: return 0x52564531; // vendor "RVE1"
    case 0x010: return devFeatSel_ == 1 ? VIRTIO_F_VERSION_1_WORD1 : 0;
    case 0x034: return qsel_ == 0 ? QUEUE_MAX : 0;
    case 0x044: return qsel_ == 0 ? q_.ready : 0;
    case 0x060: return intStatus_;
    case 0x070: return status_;
    case 0x0fc: return 0; // config generation
    }
    if (off >= 0x100 && off < 0x108) // config space: capacity (u64, 512-byte sectors)
    {
        // Byte/half/word reads of the config space all arrive as an aligned word read.
        uint32_t base = off & ~3u, v = 0;
        for (int i = 0; i < 4; i++)
        {
            uint32_t byte_off = base - 0x100 + i;
            if (byte_off < 8) v |= (uint32_t)((capacitySectors_ >> (8 * byte_off)) & 0xff) << (8 * i);
        }
        return v;
    }
    return 0;
}

void VirtioBlk::write(uint32_t off, uint32_t val)
{
    switch (off)
    {
    case 0x014: devFeatSel_ = val; break;
    case 0x020: drvFeat_[drvFeatSel_ & 1] = val; break;
    case 0x024: drvFeatSel_ = val; break;
    case 0x030: qsel_ = val; break;
    case 0x038: if (qsel_ == 0) q_.num = val > QUEUE_MAX ? QUEUE_MAX : val; break;
    case 0x044: if (qsel_ == 0) { q_.ready = val & 1; if (q_.ready) q_.lastAvail = 0; } break;
    case 0x050: if (val == 0) processQueue(); break;
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

bool VirtioBlk::popChain(Queue &q, uint16_t &head, std::vector<Chain> &chain)
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

void VirtioBlk::pushUsed(Queue &q, uint16_t head, uint32_t len)
{
    uint16_t usedIdx;
    mem_.read(q.used + 2, &usedIdx, 2);
    uint32_t elem[2] = {head, len};
    mem_.write(q.used + 4 + 8ull * (usedIdx % q.num), elem, 8);
    usedIdx++;
    mem_.write(q.used + 2, &usedIdx, 2);
    intStatus_ |= 1;
}

// A request chain is: [virtio_blk_req header, 16B, RO] [data..., RO for OUT / WO for IN] [status, 1B, WO].
// Requests complete synchronously against the backing file -- there is no async I/O path to poll.
void VirtioBlk::processQueue()
{
    uint16_t head;
    std::vector<Chain> chain;
    while (popChain(q_, head, chain))
    {
        if (chain.size() < 2) { pushUsed(q_, head, 0); continue; } // malformed: need at least header+status

        uint8_t hdr[16] = {0};
        mem_.read(chain[0].addr, hdr, chain[0].len < 16 ? chain[0].len : 16);
        uint32_t type; uint64_t sector;
        memcpy(&type, hdr, 4);
        memcpy(&sector, hdr + 8, 8);

        Chain &statusChain = chain.back();
        uint8_t status = VIRTIO_BLK_S_OK;
        uint32_t xferLen = 0;

        if (!img_)
        {
            status = VIRTIO_BLK_S_IOERR;
        }
        else if (type == VIRTIO_BLK_T_FLUSH)
        {
            fflush(img_);
        }
        else if (type == VIRTIO_BLK_T_IN || type == VIRTIO_BLK_T_OUT)
        {
            uint64_t offset = sector * SECTOR_SIZE;
            for (size_t i = 1; i + 1 < chain.size(); i++)
            {
                Chain &c = chain[i];
                std::vector<uint8_t> buf(c.len);
                if (type == VIRTIO_BLK_T_IN)
                {
                    fseek(img_, (long)offset, SEEK_SET);
                    size_t got = fread(buf.data(), 1, c.len, img_);
                    if (got < buf.size()) memset(buf.data() + got, 0, buf.size() - got);
                    mem_.write(c.addr, buf.data(), c.len);
                }
                else
                {
                    mem_.read(c.addr, buf.data(), c.len);
                    fseek(img_, (long)offset, SEEK_SET);
                    fwrite(buf.data(), 1, c.len, img_);
                }
                offset += c.len;
                xferLen += c.len;
            }
            if (type == VIRTIO_BLK_T_OUT) fflush(img_);
        }
        else
        {
            status = VIRTIO_BLK_S_UNSUPP;
        }

        mem_.write(statusChain.addr, &status, 1);
        pushUsed(q_, head, xferLen);
    }
}

void VirtioBlk::tick()
{
    // Requests are handled synchronously in processQueue() (called on QueueNotify). Kept for
    // interface symmetry with VirtioNet's per-instruction poll and future async I/O.
}
