// Shared helpers for the network tests: build Ethernet/IPv4/UDP/TCP frames and verify the
// checksums of frames the stack produced.
#pragma once
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>

#define CHECK(c) do { if (!(c)) { printf("FAIL %s:%d: %s\n", __FILE__, __LINE__, #c); exit(1); } } while (0)
typedef std::vector<uint8_t> Bytes;

static const uint8_t GMAC[6] = {0x52, 0x54, 0x00, 0x12, 0x34, 0x56};
static const uint32_t GIP = 0x0a00020f, GW = 0x0a000202, DNS = 0x0a000203;
static inline uint16_t r16(const uint8_t *p) { return p[0] << 8 | p[1]; }
static inline uint32_t r32(const uint8_t *p) { return (uint32_t)p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3]; }
static inline void w16(Bytes &b, size_t o, uint16_t v) { b[o] = v >> 8; b[o + 1] = (uint8_t)v; }
static inline void w32(Bytes &b, size_t o, uint32_t v) { for (int i = 0; i < 4; i++) b[o + i] = v >> (24 - 8 * i); }

static inline uint16_t sum16(const uint8_t *p, size_t n, uint32_t s = 0)
{
    for (; n > 1; p += 2, n -= 2) s += r16(p);
    if (n) s += p[0] << 8;
    while (s >> 16) s = (s & 0xffff) + (s >> 16);
    return (uint16_t)s;
}

static inline Bytes eth(uint16_t type, const Bytes &payload)
{
    Bytes f(14 + payload.size());
    memset(f.data(), 0xff, 6);
    memcpy(&f[6], GMAC, 6);
    w16(f, 12, type);
    memcpy(&f[14], payload.data(), payload.size());
    return f;
}
static inline Bytes ip4(uint8_t proto, uint32_t src, uint32_t dst, const Bytes &l4)
{
    Bytes p(20 + l4.size());
    p[0] = 0x45; w16(p, 2, (uint16_t)p.size()); p[8] = 64; p[9] = proto;
    w32(p, 12, src); w32(p, 16, dst);
    memcpy(&p[20], l4.data(), l4.size());
    return eth(0x0800, p);
}
static inline Bytes udp(uint32_t src, uint16_t sp, uint32_t dst, uint16_t dp, const Bytes &d)
{
    Bytes u(8 + d.size());
    w16(u, 0, sp); w16(u, 2, dp); w16(u, 4, (uint16_t)u.size());
    memcpy(&u[8], d.data(), d.size());
    return ip4(17, src, dst, u);
}
static inline Bytes tcp(uint16_t sp, uint32_t dst, uint16_t dp, uint32_t seq, uint32_t ack, uint8_t flags, const std::string &data = "")
{
    Bytes t(20 + data.size());
    w16(t, 0, sp); w16(t, 2, dp); w32(t, 4, seq); w32(t, 8, ack);
    t[12] = 5 << 4; t[13] = flags; w16(t, 14, 0xffff);
    memcpy(&t[20], data.data(), data.size());
    return ip4(6, GIP, dst, t);
}

// Verify the IPv4 header checksum and (for TCP/UDP) the pseudo-header checksum of a frame we sent.
static inline void checkChecksums(const Bytes &f)
{
    if (r16(&f[12]) != 0x0800) return;
    const uint8_t *ip = &f[14];
    CHECK(sum16(ip, 20) == 0xffff);
    uint8_t proto = ip[9];
    size_t n = r16(ip + 2) - 20;
    if (proto == 6 || proto == 17)
    {
        uint8_t ph[12];
        memcpy(ph, ip + 12, 8); ph[8] = 0; ph[9] = proto; ph[10] = n >> 8; ph[11] = (uint8_t)n;
        CHECK(sum16(ip + 20, n, sum16(ph, 12)) == 0xffff);
    }
    if (proto == 1) CHECK(sum16(ip + 20, n) == 0xffff);
}

