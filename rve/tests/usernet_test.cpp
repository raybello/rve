// Feeds hand-built Ethernet frames into the userspace network stack (with FakeHost) and checks
// the replies, including IP/TCP/UDP checksums, like the guest kernel would.
#include "netframes.h"
#include "usernet.h"
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

    // ---- host-network mode (FakeHost raw): transparent TCP proxy + forwarded ping ----
    {
        FakeHost rawHost(true);
        UserNetBackend rb(&rawHost);
        const uint32_t SRV = 0x5db8d822;
        // refused port -> RST, no SYN-ACK
        Bytes bad = tcp(51000, SRV, 8080, 10, 0, 0x02);
        rb.send(bad.data(), bad.size());
        auto r0 = drain(rb);
        CHECK(r0.size() == 1 && (r0[0][14 + 20 + 13] & 0x04));

        // echo service on port 7: handshake completes once the host connect is up (on poll)
        uint32_t seq = 2000;
        Bytes syn = tcp(51001, SRV, 7, seq, 0, 0x02);
        rb.send(syn.data(), syn.size());
        auto r1 = drain(rb);
        CHECK(r1.size() == 1 && (r1[0][14 + 20 + 13] & 0x12) == 0x12);
        uint32_t isn = r32(&r1[0][14 + 20 + 4]);
        seq++;
        Bytes ack = tcp(51001, SRV, 7, seq, isn + 1, 0x10);
        rb.send(ack.data(), ack.size());
        CHECK(drain(rb).empty());
        std::string msg = "hello over a real-ish socket";
        Bytes d = tcp(51001, SRV, 7, seq, isn + 1, 0x18, msg);
        rb.send(d.data(), d.size());
        seq += (uint32_t)msg.size();
        std::string got;
        for (auto &f : drain(rb))
        {
            const uint8_t *t = &f[14 + 20];
            size_t hl = (t[12] >> 4) * 4, dl = r16(&f[14 + 2]) - 20 - hl;
            got.append((const char *)t + hl, dl);
        }
        CHECK(got == msg); // echoed by the fake host through the proxy
        // guest half-closes: host sees EOF and the stack sends FIN
        Bytes fin = tcp(51001, SRV, 7, seq, isn + 1 + (uint32_t)msg.size(), 0x11);
        rb.send(fin.data(), fin.size());
        bool sawFin = false;
        for (auto &f : drain(rb)) if (f[14 + 20 + 13] & 1) sawFin = true;
        CHECK(sawFin);

        // ping is forwarded to the host: 8.8.8.8 answers, 9.9.9.9 is unreachable
        Bytes e(12, 0);
        e[0] = 8; w16(e, 4, 0x55); w16(e, 6, 1);
        Bytes p1 = ip4(1, GIP, 0x08080808, e);
        rb.send(p1.data(), p1.size());
        auto pr = drain(rb);
        CHECK(pr.size() == 1 && pr[0][14 + 20] == 0 && r16(&pr[0][14 + 20 + 4]) == 0x55);
        Bytes p2 = ip4(1, GIP, 0x09090909, e);
        rb.send(p2.data(), p2.size());
        auto pu = drain(rb);
        CHECK(pu.size() == 1 && pu[0][14 + 20] == 3);
    }

    printf("usernet_test: OK\n");
    return 0;
}
