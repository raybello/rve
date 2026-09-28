#include "virtio_gpu.h"
#include <cstring>

#define VIRTIO_MAGIC 0x74726976u
#define VIRTIO_F_VERSION_1_WORD1 1u // feature bit 32
#define VIRTQ_DESC_F_NEXT 1
#define VIRTQ_DESC_F_WRITE 2
#define QUEUE_MAX 256u

// 2D command/response types (virtio-gpu spec). No VIRTIO_GPU_CMD_*_3D / capset support: this
// device never advertises VIRTIO_GPU_F_VIRGL, so the guest driver should never send those.
#define CMD_GET_DISPLAY_INFO       0x0100u
#define CMD_RESOURCE_CREATE_2D     0x0101u
#define CMD_RESOURCE_UNREF         0x0102u
#define CMD_SET_SCANOUT            0x0103u
#define CMD_RESOURCE_FLUSH         0x0104u
#define CMD_TRANSFER_TO_HOST_2D    0x0105u
#define CMD_RESOURCE_ATTACH_BACKING 0x0106u
#define CMD_RESOURCE_DETACH_BACKING 0x0107u

#define RESP_OK_NODATA             0x1100u
#define RESP_OK_DISPLAY_INFO       0x1101u
#define RESP_ERR_UNSPEC            0x1200u
#define RESP_ERR_INVALID_SCANOUT_ID 0x1202u
#define RESP_ERR_INVALID_RESOURCE_ID 0x1203u
#define RESP_ERR_INVALID_PARAMETER 0x1205u

namespace {

inline uint32_t rd32(const std::vector<uint8_t> &b, size_t off)
{
    if (off + 4 > b.size()) return 0;
    uint32_t v; memcpy(&v, b.data() + off, 4); return v;
}
inline uint64_t rd64(const std::vector<uint8_t> &b, size_t off)
{
    if (off + 8 > b.size()) return 0;
    uint64_t v; memcpy(&v, b.data() + off, 8); return v;
}

// Converts one 4-byte pixel from a virtio-gpu 2D format into RGBA (GL_RGBA/GL_UNSIGNED_BYTE
// order). Covers every format value the Linux DRM virtio driver can negotiate for a plain 2D
// (non-blob) resource; unrecognized formats fall through to the RGBA/RGBX case.
inline void convertPixel(uint32_t format, const uint8_t *src, uint8_t *dst)
{
    switch (format)
    {
    case 1: // B8G8R8A8_UNORM: memory order B,G,R,A
        dst[0] = src[2]; dst[1] = src[1]; dst[2] = src[0]; dst[3] = src[3];
        return;
    case 2: // B8G8R8X8_UNORM
        dst[0] = src[2]; dst[1] = src[1]; dst[2] = src[0]; dst[3] = 0xff;
        return;
    case 3: // A8R8G8B8_UNORM: memory order A,R,G,B
        dst[0] = src[1]; dst[1] = src[2]; dst[2] = src[3]; dst[3] = src[0];
        return;
    case 4: // X8R8G8B8_UNORM
        dst[0] = src[1]; dst[1] = src[2]; dst[2] = src[3]; dst[3] = 0xff;
        return;
    case 68: // X8B8G8R8_UNORM: memory order X,B,G,R
        dst[0] = src[3]; dst[1] = src[2]; dst[2] = src[1]; dst[3] = 0xff;
        return;
    case 121: // A8B8G8R8_UNORM: memory order A,B,G,R
        dst[0] = src[3]; dst[1] = src[2]; dst[2] = src[1]; dst[3] = src[0];
        return;
    case 67:  // R8G8B8A8_UNORM: already RGBA
    case 134: // R8G8B8X8_UNORM
    default:
        dst[0] = src[0]; dst[1] = src[1]; dst[2] = src[2];
        dst[3] = (format == 134) ? 0xff : src[3];
        return;
    }
}

} // namespace

VirtioGpu::VirtioGpu() { reset(); }

void VirtioGpu::init(GuestMem mem) { mem_ = mem; }

void VirtioGpu::reset()
{
    q_[0] = Queue(); q_[1] = Queue();
    qsel_ = status_ = devFeatSel_ = drvFeatSel_ = intStatus_ = 0;
    drvFeat_[0] = drvFeat_[1] = 0;
    resources_.clear();
    scanoutResourceId_ = 0;
    dispWidth_ = 850; dispHeight_ = 478;
    framebuffer_.assign((size_t)dispWidth_ * dispHeight_ * 4, 0);
    frameGen_++;
}

uint32_t VirtioGpu::read(uint32_t off)
{
    Queue &q = q_[qsel_ & 1];
    switch (off)
    {
    case 0x000: return VIRTIO_MAGIC;
    case 0x004: return 2;
    case 0x008: return 16; // GPU device
    case 0x00c: return 0x52564531; // vendor "RVE1"
    case 0x010: return devFeatSel_ == 1 ? VIRTIO_F_VERSION_1_WORD1 : 0;
    case 0x034: return qsel_ < 2 ? QUEUE_MAX : 0;
    case 0x044: return qsel_ < 2 ? q.ready : 0;
    case 0x060: return intStatus_;
    case 0x070: return status_;
    case 0x0fc: return 0; // config generation
    // Shared memory regions (used for VIRTIO_GPU_F_RESOURCE_BLOB host-visible mappings, which
    // this device doesn't advertise or implement): per the virtio-mmio v2 spec, an absent region
    // MUST report length -1 (0xffffffff in both halves), not 0 -- a real Linux virtio_gpu driver
    // (drivers/gpu/drm/virtio) treats a 0-length region as present-but-empty and fails the whole
    // probe with "Could not reserve host visible region" / -EBUSY instead of skipping it.
    case 0x0b0: return 0xffffffffu; // SharedMemoryLengthLow
    case 0x0b4: return 0xffffffffu; // SharedMemoryLengthHigh
    case 0x0b8: return 0;           // SharedMemoryBaseLow
    case 0x0bc: return 0;           // SharedMemoryBaseHigh
    }
    if (off >= 0x100 && off < 0x110) // config space: virtio_gpu_config
    {
        switch ((off - 0x100) / 4)
        {
        case 0: return 0; // events_read: no hotplug events
        case 1: return 0; // events_clear
        case 2: return 1; // num_scanouts
        case 3: return 0; // num_capsets: no 3D
        }
    }
    return 0;
}

void VirtioGpu::write(uint32_t off, uint32_t val)
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
    case 0x050:
        if (val == 0) processControl();
        else if (val == 1) processCursor();
        break;
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
    case 0x0ac: shmSel_ = val; break; // SharedMemorySel: recorded but irrelevant, no regions exist
    case 0x100: break; // events_clear: nothing latched, nothing to clear
    }
}

bool VirtioGpu::popChain(Queue &q, uint16_t &head, std::vector<Chain> &chain)
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

void VirtioGpu::pushUsed(Queue &q, uint16_t head, uint32_t len)
{
    uint16_t usedIdx;
    mem_.read(q.used + 2, &usedIdx, 2);
    uint32_t elem[2] = {head, len};
    mem_.write(q.used + 4 + 8ull * (usedIdx % q.num), elem, 8);
    usedIdx++;
    mem_.write(q.used + 2, &usedIdx, 2);
    intStatus_ |= 1;
}

void VirtioGpu::readFromBacking(const std::vector<MemEntry> &backing, uint64_t offset, uint8_t *dst, uint32_t len)
{
    uint64_t virtPos = 0;
    for (const auto &e : backing)
    {
        if (len == 0) break;
        uint64_t entryEnd = virtPos + e.length;
        if (offset < entryEnd && offset + len > virtPos)
        {
            uint64_t copyStart = offset > virtPos ? offset - virtPos : 0;
            uint64_t availInEntry = e.length - copyStart;
            uint64_t wantFromHere = (offset + len) - (virtPos + copyStart);
            uint32_t n = (uint32_t)(availInEntry < wantFromHere ? availInEntry : wantFromHere);
            mem_.read(e.addr + copyStart, dst + (virtPos + copyStart - offset), n);
        }
        virtPos = entryEnd;
    }
}

void VirtioGpu::blitResourceToScanout(uint32_t resourceId, uint32_t x, uint32_t y, uint32_t w, uint32_t h)
{
    auto it = resources_.find(resourceId);
    if (it == resources_.end()) return;
    Resource &r = it->second;
    if (r.width != dispWidth_ || r.height != dispHeight_) return; // SET_SCANOUT resizes to match
    uint32_t x2 = x + w > r.width ? r.width : x + w;
    uint32_t y2 = y + h > r.height ? r.height : y + h;
    for (uint32_t row = y; row < y2; row++)
    {
        const uint8_t *src = r.data.data() + (size_t)row * r.width * 4 + (size_t)x * 4;
        uint8_t *dst = framebuffer_.data() + (size_t)row * dispWidth_ * 4 + (size_t)x * 4;
        for (uint32_t col = x; col < x2; col++, src += 4, dst += 4)
            convertPixel(r.format, src, dst);
    }
    frameGen_++;
}

// Dispatches one 2D control command. `req` is every non-device-writable descriptor in the chain
// concatenated (the request body); `resp` is filled with the reply, truncated to whatever the
// guest's response descriptor can hold by the caller.
void VirtioGpu::handleCommand(const std::vector<uint8_t> &req, std::vector<uint8_t> &resp)
{
    uint32_t type = rd32(req, 0);
    uint32_t flags = rd32(req, 4);
    uint64_t fenceId = rd64(req, 8);

    auto beginResp = [&](uint32_t respType, size_t size) {
        resp.assign(size, 0);
        memcpy(resp.data() + 0, &respType, 4);
        memcpy(resp.data() + 4, &flags, 4); // echo flags (incl. the fence bit) back
        memcpy(resp.data() + 8, &fenceId, 8);
    };

    switch (type)
    {
    case CMD_GET_DISPLAY_INFO:
    {
        beginResp(RESP_OK_DISPLAY_INFO, 24 + 16 * 24);
        uint32_t x = 0, y = 0, w = dispWidth_, h = dispHeight_, enabled = 1, pflags = 0;
        size_t o = 24;
        memcpy(resp.data() + o + 0, &x, 4);
        memcpy(resp.data() + o + 4, &y, 4);
        memcpy(resp.data() + o + 8, &w, 4);
        memcpy(resp.data() + o + 12, &h, 4);
        memcpy(resp.data() + o + 16, &enabled, 4);
        memcpy(resp.data() + o + 20, &pflags, 4);
        // scanouts 1..15 stay zeroed (disabled) from beginResp()'s assign()
        break;
    }
    case CMD_RESOURCE_CREATE_2D:
    {
        uint32_t resId = rd32(req, 24), format = rd32(req, 28), width = rd32(req, 32), height = rd32(req, 36);
        if (resId == 0 || width == 0 || height == 0 || (uint64_t)width * height > (64ull << 20))
        {
            beginResp(RESP_ERR_INVALID_PARAMETER, 24);
            break;
        }
        Resource r;
        r.width = width; r.height = height; r.format = format;
        r.data.assign((size_t)width * height * 4, 0);
        resources_[resId] = std::move(r);
        beginResp(RESP_OK_NODATA, 24);
        break;
    }
    case CMD_RESOURCE_UNREF:
    {
        uint32_t resId = rd32(req, 24);
        resources_.erase(resId);
        if (scanoutResourceId_ == resId) scanoutResourceId_ = 0;
        beginResp(RESP_OK_NODATA, 24);
        break;
    }
    case CMD_SET_SCANOUT:
    {
        uint32_t scanoutId = rd32(req, 40), resId = rd32(req, 44);
        if (scanoutId != 0) { beginResp(RESP_ERR_INVALID_SCANOUT_ID, 24); break; }
        if (resId != 0)
        {
            auto it = resources_.find(resId);
            if (it == resources_.end()) { beginResp(RESP_ERR_INVALID_RESOURCE_ID, 24); break; }
            // A real display resolution change: resize the host-visible framebuffer to match.
            if (it->second.width != dispWidth_ || it->second.height != dispHeight_)
            {
                dispWidth_ = it->second.width;
                dispHeight_ = it->second.height;
                framebuffer_.assign((size_t)dispWidth_ * dispHeight_ * 4, 0);
                frameGen_++;
            }
        }
        scanoutResourceId_ = resId;
        beginResp(RESP_OK_NODATA, 24);
        break;
    }
    case CMD_RESOURCE_FLUSH:
    {
        uint32_t x = rd32(req, 24), y = rd32(req, 28), w = rd32(req, 32), h = rd32(req, 36), resId = rd32(req, 40);
        if (resources_.find(resId) == resources_.end()) { beginResp(RESP_ERR_INVALID_RESOURCE_ID, 24); break; }
        if (resId == scanoutResourceId_)
            blitResourceToScanout(resId, x, y, w, h);
        beginResp(RESP_OK_NODATA, 24);
        break;
    }
    case CMD_TRANSFER_TO_HOST_2D:
    {
        uint32_t x = rd32(req, 24), y = rd32(req, 28), w = rd32(req, 32), h = rd32(req, 36);
        uint64_t offset = rd64(req, 40);
        uint32_t resId = rd32(req, 48);
        auto it = resources_.find(resId);
        if (it == resources_.end()) { beginResp(RESP_ERR_INVALID_RESOURCE_ID, 24); break; }
        Resource &r = it->second;
        uint32_t x2 = x + w > r.width ? r.width : x + w;
        uint32_t y2 = y + h > r.height ? r.height : y + h;
        for (uint32_t row = y; row < y2; row++)
        {
            uint64_t srcOff = offset + (uint64_t)row * r.width * 4 + (uint64_t)x * 4;
            uint32_t rowBytes = (x2 - x) * 4;
            uint8_t *dst = r.data.data() + (size_t)row * r.width * 4 + (size_t)x * 4;
            readFromBacking(r.backing, srcOff, dst, rowBytes);
        }
        beginResp(RESP_OK_NODATA, 24);
        break;
    }
    case CMD_RESOURCE_ATTACH_BACKING:
    {
        uint32_t resId = rd32(req, 24), nrEntries = rd32(req, 28);
        auto it = resources_.find(resId);
        if (it == resources_.end()) { beginResp(RESP_ERR_INVALID_RESOURCE_ID, 24); break; }
        std::vector<MemEntry> entries;
        size_t o = 32;
        for (uint32_t i = 0; i < nrEntries && o + 16 <= req.size(); i++, o += 16)
            entries.push_back({rd64(req, o), rd32(req, o + 8)});
        it->second.backing = std::move(entries);
        beginResp(RESP_OK_NODATA, 24);
        break;
    }
    case CMD_RESOURCE_DETACH_BACKING:
    {
        uint32_t resId = rd32(req, 24);
        auto it = resources_.find(resId);
        if (it != resources_.end()) it->second.backing.clear();
        beginResp(RESP_OK_NODATA, 24);
        break;
    }
    default:
        // GET_CAPSET_INFO/GET_CAPSET (3D) and GET_EDID: not advertised (no VIRTIO_GPU_F_VIRGL/
        // F_EDID feature bit), so a compliant driver shouldn't send these; answer defensively.
        beginResp(RESP_ERR_UNSPEC, 24);
        break;
    }
}

void VirtioGpu::processControl()
{
    uint16_t head;
    std::vector<Chain> chain;
    while (popChain(q_[0], head, chain))
    {
        if (chain.empty()) { pushUsed(q_[0], head, 0); continue; }
        std::vector<uint8_t> req;
        for (size_t i = 0; i + 1 < chain.size(); i++) // every descriptor but the last is the request
        {
            if (chain[i].write) continue;
            size_t at = req.size();
            req.resize(at + chain[i].len);
            mem_.read(chain[i].addr, req.data() + at, chain[i].len);
        }
        Chain &respDesc = chain.back();
        std::vector<uint8_t> resp;
        handleCommand(req, resp);
        uint32_t n = (uint32_t)(resp.size() < respDesc.len ? resp.size() : respDesc.len);
        if (n) mem_.write(respDesc.addr, resp.data(), n);
        pushUsed(q_[0], head, n);
    }
}

// Cursor plane (hardware mouse sprite) is not implemented -- this project's pointer story is
// virtio-input, not a GPU-composited cursor. Requests are drained and acknowledged so the ring
// never fills, but UPDATE_CURSOR/MOVE_CURSOR have no visible effect: the guest's own compositor
// is expected to fall back to (or exclusively use) a software cursor.
void VirtioGpu::processCursor()
{
    uint16_t head;
    std::vector<Chain> chain;
    while (popChain(q_[1], head, chain))
        pushUsed(q_[1], head, 0);
}

void VirtioGpu::tick()
{
    // No async work: 2D commands complete synchronously in processControl()/processCursor(),
    // called directly from write() on a QueueNotify. Kept for interface symmetry with the other
    // virtio devices.
}
