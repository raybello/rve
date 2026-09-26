// Unit test for the virtio-mmio net device and the PLIC, driven like a guest driver would:
// negotiate, set up split virtqueues in fake guest memory, transmit a frame through a loopback
// backend, and check it comes back on the receive queue with the right interrupt state.
#include "plic.h"
#include "virtio_net.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>

static std::vector<uint8_t> ram(1 << 20);
#define CHECK(c) do { if (!(c)) { printf("FAIL %s:%d: %s\n", __FILE__, __LINE__, #c); exit(1); } } while (0)

// Guest layout (physical addresses are offsets into `ram`)
enum { RXD = 0x1000, RXA = 0x2000, RXU = 0x3000, TXD = 0x4000, TXA = 0x5000, TXU = 0x6000,
       RXBUF = 0x8000, TXBUF = 0xA000, QN = 8 };

static void setQueue(VirtioNet &d, int q, uint64_t desc, uint64_t avail, uint64_t used)
{
    d.write(0x030, q);
    CHECK(d.read(0x034) >= QN);
    d.write(0x038, QN);
    d.write(0x080, (uint32_t)desc); d.write(0x084, 0);
    d.write(0x090, (uint32_t)avail); d.write(0x094, 0);
    d.write(0x0a0, (uint32_t)used); d.write(0x0a4, 0);
    d.write(0x044, 1);
}

static void put16(uint64_t a, uint16_t v) { memcpy(&ram[a], &v, 2); }
static uint16_t get16(uint64_t a) { uint16_t v; memcpy(&v, &ram[a], 2); return v; }
static uint32_t get32(uint64_t a) { uint32_t v; memcpy(&v, &ram[a], 4); return v; }
static void desc(uint64_t table, int i, uint64_t addr, uint32_t len, uint16_t flags, uint16_t next)
{
    memcpy(&ram[table + 16 * i], &addr, 8);
    memcpy(&ram[table + 16 * i + 8], &len, 4);
    put16(table + 16 * i + 12, flags);
    put16(table + 16 * i + 14, next);
}

int main()
{
    LoopbackBackend be;
    VirtioNet dev;
    GuestMem gm;
    gm.read = [](uint64_t pa, void *dst, size_t n) { memcpy(dst, &ram[pa], n); };
    gm.write = [](uint64_t pa, const void *src, size_t n) { memcpy(&ram[pa], src, n); };
    dev.init(gm, &be);

    // Identification and feature negotiation
    CHECK(dev.read(0x000) == 0x74726976u);
    CHECK(dev.read(0x004) == 2);
    CHECK(dev.read(0x008) == 1);
    dev.write(0x014, 0); CHECK(dev.read(0x010) & (1u << 5));  // VIRTIO_NET_F_MAC
    dev.write(0x014, 1); CHECK(dev.read(0x010) & 1u);         // VIRTIO_F_VERSION_1
    CHECK((dev.read(0x100) & 0xff) == 0x52);                  // MAC byte 0 via config space
    dev.write(0x070, 1); dev.write(0x070, 3);
    setQueue(dev, 0, RXD, RXA, RXU);
    setQueue(dev, 1, TXD, TXA, TXU);
    dev.write(0x070, 3 | 8 | 4);
    CHECK(dev.active());

    // Post two RX buffers (device-writable)
    for (int i = 0; i < 2; i++)
    {
        desc(RXD, i, RXBUF + 0x800 * i, 0x800, 2 /*WRITE*/, 0);
        put16(RXA + 4 + 2 * i, i);
    }
    put16(RXA + 2, 2);

    // Transmit a frame: 12-byte virtio-net header + 60-byte payload in a 2-descriptor chain
    uint8_t frame[60];
    for (int i = 0; i < 60; i++) frame[i] = (uint8_t)(i * 7 + 1);
    memset(&ram[TXBUF], 0, 12);
    memcpy(&ram[TXBUF + 0x100], frame, 60);
    desc(TXD, 0, TXBUF, 12, 1 /*NEXT*/, 1);
    desc(TXD, 1, TXBUF + 0x100, 60, 0, 0);
    put16(TXA + 4, 0);
    put16(TXA + 2, 1);
    dev.write(0x050, 1); // notify TX

    CHECK(get16(TXU + 2) == 1);       // used idx advanced
    CHECK(get32(TXU + 4) == 0);       // head 0
    CHECK(be.q.size() == 1 && be.q.front().size() == 60 && memcmp(be.q.front().data(), frame, 60) == 0);
    CHECK(dev.irqLevel());
    dev.write(0x064, 1);              // ack
    CHECK(!dev.irqLevel());

    // Loopback returned the frame; tick delivers it into the first RX buffer
    dev.tick();
    CHECK(get16(RXU + 2) == 1);
    CHECK(get32(RXU + 4) == 0);
    CHECK(get32(RXU + 8) == 12 + 60); // used length = header + frame
    CHECK(ram[RXBUF + 10] == 1);      // num_buffers
    CHECK(memcmp(&ram[RXBUF + 12], frame, 60) == 0);
    CHECK(dev.irqLevel());

    // With no buffer left, a frame is held (not lost) until one is posted
    be.send(frame, 60); be.send(frame, 60);
    dev.tick();
    CHECK(get16(RXU + 2) == 2);       // second buffer consumed, third frame still held
    put16(RXA + 4 + 2 * 2, 0);        // re-post descriptor 0
    put16(RXA + 2, 3);
    dev.tick();
    CHECK(get16(RXU + 2) == 3);

    // PLIC: source 1 -> context 1 (S-mode) claim/complete
    Plic p;
    p.write(4 * 1, 1);                 // priority[1] = 1
    p.write(0x2000 + 0x80 * 1, 1u << 1); // enable src 1 on ctx 1
    p.setLevel(1, true);
    CHECK(p.ctxActive(1) && !p.ctxActive(0));
    CHECK(p.read(0x200000 + 0x1000 + 4) == 1); // claim
    CHECK(!p.ctxActive(1));                    // claimed: no longer deliverable while line is high
    p.write(0x200000 + 0x1000 + 4, 1);         // complete
    CHECK(p.ctxActive(1));                     // level still high -> asserted again
    p.setLevel(1, false);
    CHECK(!p.ctxActive(1));
    p.write(0x200000 + 0x1000, 2);             // threshold 2 masks priority 1
    p.setLevel(1, true);
    CHECK(!p.ctxActive(1));

    printf("virtio_net_test: OK\n");
    return 0;
}
