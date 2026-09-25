// Feeds hand-built Ethernet frames into the userspace network stack (with FakeHost) and checks
// the replies, including IP/TCP/UDP checksums, like the guest kernel would.
#include "usernet.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>

#define CHECK(c) do { if (!(c)) { printf("FAIL %s:%d: %s\n", __FILE__, __LINE__, #c); exit(1); } } while (0)
typedef std::vector<uint8_t> Bytes;

static const uint8_t GMAC[6] = {0x52, 0x54, 0x00, 0x12, 0x34, 0x56};
static const uint32_t GIP = 0x0a00020f, GW = 0x0a000202, DNS = 0x0a000203;
static uint16_t r16(const uint8_t *p) { return p[0] << 8 | p[1]; }
static uint32_t r32(const uint8_t *p) { return (uint32_t)p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3]; }
static void w16(Bytes &b, size_t o, uint16_t v) { b[o] = v >> 8; b[o + 1] = (uint8_t)v; }
static void w32(Bytes &b, size_t o, uint32_t v) { for (int i = 0; i < 4; i++) b[o + i] = v >> (24 - 8 * i); }

static uint16_t sum16(const uint8_t *p, size_t n, uint32_t s = 0)
{
    for (; n > 1; p += 2, n -= 2) s += r16(p);
    if (n) s += p[0] << 8;
    while (s >> 16) s = (s & 0xffff) + (s >> 16);
    return (uint16_t)s;
}

static Bytes eth(uint16_t type, const Bytes &payload)
{
    Bytes f(14 + payload.size());
    memset(f.data(), 0xff, 6);
    memcpy(&f[6], GMAC, 6);
    w16(f, 12, type);
    memcpy(&f[14], payload.data(), payload.size());
    return f;
}
static Bytes ip4(uint8_t proto, uint32_t src, uint32_t dst, const Bytes &l4)
{
    Bytes p(20 + l4.size());
    p[0] = 0x45; w16(p, 2, (uint16_t)p.size()); p[8] = 64; p[9] = proto;
    w32(p, 12, src); w32(p, 16, dst);
    memcpy(&p[20], l4.data(), l4.size());
    return eth(0x0800, p);
}
static Bytes udp(uint32_t src, uint16_t sp, uint32_t dst, uint16_t dp, const Bytes &d)
{
    Bytes u(8 + d.size());
    w16(u, 0, sp); w16(u, 2, dp); w16(u, 4, (uint16_t)u.size());
    memcpy(&u[8], d.data(), d.size());
    return ip4(17, src, dst, u);
}
static Bytes tcp(uint16_t sp, uint32_t dst, uint16_t dp, uint32_t seq, uint32_t ack, uint8_t flags, const std::string &data = "")
{
    Bytes t(20 + data.size());
    w16(t, 0, sp); w16(t, 2, dp); w32(t, 4, seq); w32(t, 8, ack);
    t[12] = 5 << 4; t[13] = flags; w16(t, 14, 0xffff);
    memcpy(&t[20], data.data(), data.size());
    return ip4(6, GIP, dst, t);
}

// Verify the IPv4 header checksum and (for TCP/UDP) the pseudo-header checksum of a frame we sent.
static void checkChecksums(const Bytes &f)
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

static std::vector<Bytes> drain(UserNetBackend &be)
{
    std::vector<Bytes> v;
    Bytes f;
    while (be.poll(f)) { checkChecksums(f); v.push_back(f); }
    return v;
}

int main()
{
    FakeHost host;
    UserNetBackend be(&host);

    // ARP for the gateway
    {
        Bytes a(28, 0);
        w16(a, 0, 1); w16(a, 2, 0x0800); a[4] = 6; a[5] = 4; w16(a, 6, 1);
        memcpy(&a[8], GMAC, 6); w32(a, 14, GIP); w32(a, 24, GW);
        Bytes f = eth(0x0806, a);
        be.send(f.data(), f.size());
        auto r = drain(be);
        CHECK(r.size() == 1 && r[0][14 + 7] == 2 && r32(&r[0][14 + 14]) == GW);
    }

    // DHCP DISCOVER -> OFFER, REQUEST -> ACK
    for (int t = 1; t <= 3; t += 2)
    {
        Bytes d(240 + 4, 0);
        d[0] = 1; d[1] = 1; d[2] = 6; w32(d, 4, 0xabcd0001);
        memcpy(&d[28], GMAC, 6); w32(d, 236, 0x63825363u);
        d[240] = 53; d[241] = 1; d[242] = (uint8_t)t; d[243] = 255;
        Bytes f = udp(0, 68, 0xffffffffu, 67, d);
        be.send(f.data(), f.size());
        auto r = drain(be);
        CHECK(r.size() == 1);
        const uint8_t *b = &r[0][14 + 20 + 8];
        CHECK(b[0] == 2 && r32(b + 4) == 0xabcd0001 && r32(b + 16) == GIP);
        CHECK(b[242] == (t == 1 ? 2 : 5)); // option 53 is first: OFFER / ACK
    }

    // DNS: A query for foo.test resolves via the host; AAAA is empty; nx.example fails
    auto dnsQuery = [&](const char *name, uint16_t qtype) {
        Bytes q(12, 0);
        w16(q, 0, 0x1234); q[2] = 1; w16(q, 4, 1);
        std::string n = name;
        size_t p = 0;
        while (p < n.size())
        {
            size_t e = n.find('.', p);
            if (e == std::string::npos) e = n.size();
            q.push_back((uint8_t)(e - p));
            q.insert(q.end(), n.begin() + p, n.begin() + e);
            p = e + 1;
        }
        q.push_back(0);
        q.push_back(qtype >> 8); q.push_back((uint8_t)qtype); q.push_back(0); q.push_back(1);
        Bytes f = udp(GIP, 40000, DNS, 53, q);
        be.send(f.data(), f.size());
        return drain(be);
    };
    {
        auto r = dnsQuery("foo.test", 1);
        CHECK(r.size() == 1);
        const uint8_t *d = &r[0][14 + 20 + 8];
        CHECK(r16(d) == 0x1234 && (d[3] & 0xf) == 0 && r16(d + 6) == 1);
        size_t len = r[0].size();
        CHECK(r32(&r[0][len - 4]) == 0x5db8d822);
        CHECK(r16(&r[0][14 + 20]) == 53 && r16(&r[0][14 + 22]) == 40000);
        auto a = dnsQuery("foo.test", 28);
        CHECK(a.size() == 1 && r16(&a[0][14 + 20 + 8 + 6]) == 0);
        auto n = dnsQuery("nx.example", 1);
        CHECK(n.size() == 1 && (n[0][14 + 20 + 8 + 3] & 0xf) == 3);
    }

    // ICMP echo: answered for a resolved host and the gateway, unreachable otherwise
    {
        Bytes e(12, 0);
        e[0] = 8; w16(e, 4, 0x77); w16(e, 6, 1);
        Bytes f = ip4(1, GIP, 0x5db8d822, e);
        be.send(f.data(), f.size());
        auto r = drain(be);
        CHECK(r.size() == 1 && r[0][14 + 20] == 0 && r32(&r[0][14 + 12]) == 0x5db8d822 && r16(&r[0][14 + 20 + 4]) == 0x77);
        Bytes g = ip4(1, GIP, 0x08080808, e);
        be.send(g.data(), g.size());
        auto u = drain(be);
        CHECK(u.size() == 1 && u[0][14 + 20] == 3 && u[0][14 + 21] == 1);
    }

    // TCP: refused on a port we don't serve
    {
        Bytes f = tcp(50000, 0x5db8d822, 22, 100, 0, 0x02);
        be.send(f.data(), f.size());
        auto r = drain(be);
        CHECK(r.size() == 1 && (r[0][14 + 20 + 13] & 0x04));
    }

    // TCP: handshake, HTTP GET bridged to the host, response delivered, connection closed
    {
        uint32_t seq = 1000;
        be.send(tcp(50001, 0x5db8d822, 80, seq, 0, 0x02).data(), 0); // zero-length: ignored
        Bytes syn = tcp(50001, 0x5db8d822, 80, seq, 0, 0x02);
        be.send(syn.data(), syn.size());
        auto r = drain(be);
        CHECK(r.size() == 1 && (r[0][14 + 20 + 13] & 0x12) == 0x12);
        uint32_t isn = r32(&r[0][14 + 20 + 4]);
        CHECK(r32(&r[0][14 + 20 + 8]) == seq + 1);
        seq++;
        Bytes ack = tcp(50001, 0x5db8d822, 80, seq, isn + 1, 0x10);
        be.send(ack.data(), ack.size());
        CHECK(drain(be).empty());
        std::string req = "GET /x?y=1 HTTP/1.1\r\nHost: foo.test\r\nConnection: close\r\n\r\n";
        Bytes get = tcp(50001, 0x5db8d822, 80, seq, isn + 1, 0x18, req);
        be.send(get.data(), get.size());
        seq += (uint32_t)req.size();
        auto resp = drain(be);
        CHECK(host.requests.size() == 1 && host.requests[0] == "GET https://foo.test/x?y=1");
        // first frame is the ACK of the request; then the data segment(s) and FIN
        std::string body;
        bool fin = false;
        for (auto &f : resp)
        {
            const uint8_t *t = &f[14 + 20];
            size_t hl = (t[12] >> 4) * 4, dl = r16(&f[14 + 2]) - 20 - hl;
            body.append((const char *)t + hl, dl);
            if (t[13] & 1) fin = true;
        }
        CHECK(body.find("HTTP/1.1 200 OK") == 0);
        CHECK(body.find("fake host: GET https://foo.test/x?y=1") != std::string::npos);
        CHECK(fin);
        // ACK everything including FIN; the stack forgets the connection (new SYN works again)
        uint32_t end = isn + 1 + (uint32_t)body.size() + 1;
        Bytes fa = tcp(50001, 0x5db8d822, 80, seq, end, 0x11);
        be.send(fa.data(), fa.size());
        drain(be);
        Bytes syn2 = tcp(50001, 0x5db8d822, 80, 5000, 0, 0x02);
        be.send(syn2.data(), syn2.size());
        auto r2 = drain(be);
        CHECK(r2.size() == 1 && (r2[0][14 + 20 + 13] & 0x12) == 0x12);
    }

    printf("usernet_test: OK\n");
    return 0;
}
