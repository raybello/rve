// Runs the network stack on the real network stack of the machine: a local TCP echo server plays
// "the internet" (reached as the gateway 10.0.2.2, which maps to loopback), and the system resolver
// answers DNS. No external network access is needed.
#include "netframes.h"
#include "nativehost.h"
#include <arpa/inet.h>
#include <chrono>
#include <netinet/in.h>
#include <sys/socket.h>
#include <thread>
#include <unistd.h>


// Poll the backend for up to `ms` milliseconds, collecting frames (until `until` returns true).
template <class F>
static std::vector<Bytes> pollUntil(UserNetBackend &be, int ms, F until)
{
    std::vector<Bytes> v;
    auto end = std::chrono::steady_clock::now() + std::chrono::milliseconds(ms);
    Bytes f;
    while (std::chrono::steady_clock::now() < end)
    {
        while (be.poll(f)) { checkChecksums(f); v.push_back(f); }
        if (until(v)) break;
        std::this_thread::sleep_for(std::chrono::milliseconds(2));
    }
    return v;
}

static std::string tcpPayload(const std::vector<Bytes> &frames)
{
    std::string s;
    for (auto &f : frames)
    {
        if (f[14 + 9] != 6) continue;
        const uint8_t *t = &f[14 + 20];
        size_t hl = (t[12] >> 4) * 4, dl = r16(&f[14 + 2]) - 20 - hl;
        s.append((const char *)t + hl, dl);
    }
    return s;
}

int main()
{
    // Local echo server on an ephemeral loopback port (one connection, echoes until EOF).
    int ls = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in a = {};
    a.sin_family = AF_INET;
    a.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    CHECK(bind(ls, (struct sockaddr *)&a, sizeof a) == 0 && listen(ls, 1) == 0);
    socklen_t al = sizeof a;
    getsockname(ls, (struct sockaddr *)&a, &al);
    uint16_t port = ntohs(a.sin_port);
    std::thread server([ls]() {
        int c = accept(ls, nullptr, nullptr);
        char buf[4096];
        ssize_t n;
        while ((n = read(c, buf, sizeof buf)) > 0) write(c, buf, (size_t)n);
        close(c);
    });

    NativeHost host;
    UserNetBackend be(&host);

    // DNS through the system resolver: localhost -> the gateway address
    {
        Bytes q(12, 0);
        q[0] = 0x12; q[1] = 0x34; q[2] = 1; q[5] = 1;
        for (const char *l : {"localhost"}) { q.push_back((uint8_t)strlen(l)); q.insert(q.end(), l, l + strlen(l)); }
        q.push_back(0); q.push_back(0); q.push_back(1); q.push_back(0); q.push_back(1);
        Bytes u(8 + q.size());
        w16(u, 0, 40000); w16(u, 2, 53); w16(u, 4, (uint16_t)u.size());
        memcpy(&u[8], q.data(), q.size());
        Bytes f = ip4(17, GIP, DNS, u);
        be.send(f.data(), f.size());
        auto r = pollUntil(be, 3000, [](const std::vector<Bytes> &v) { return !v.empty(); });
        CHECK(r.size() == 1);
        CHECK(r16(&r[0][14 + 20 + 8 + 6]) >= 1);          // at least one answer
        CHECK(r32(&r[0][r[0].size() - 4]) == GW);          // 127.0.0.1 is presented as 10.0.2.2
    }

    // TCP proxy to the echo server, addressed as the gateway
    uint32_t seq = 7000;
    Bytes syn = ip4(6, GIP, GW, [&] { Bytes t(20, 0); w16(t, 0, 52000); w16(t, 2, port); w32(t, 4, seq); t[12] = 5 << 4; t[13] = 0x02; w16(t, 14, 0xffff); return t; }());
    be.send(syn.data(), syn.size());
    auto r = pollUntil(be, 3000, [](const std::vector<Bytes> &v) { return !v.empty(); });
    CHECK(r.size() == 1 && (r[0][14 + 20 + 13] & 0x12) == 0x12);
    uint32_t isn = r32(&r[0][14 + 20 + 4]);
    seq++;
    Bytes ack = ip4(6, GIP, GW, [&] { Bytes t(20, 0); w16(t, 0, 52000); w16(t, 2, port); w32(t, 4, seq); w32(t, 8, isn + 1); t[12] = 5 << 4; t[13] = 0x10; w16(t, 14, 0xffff); return t; }());
    be.send(ack.data(), ack.size());
    std::string msg(3000, 'x'); // more than one segment
    for (size_t i = 0; i < msg.size(); i++) msg[i] = (char)('a' + i % 26);
    Bytes data = ip4(6, GIP, GW, [&] { Bytes t(20 + msg.size(), 0); w16(t, 0, 52000); w16(t, 2, port); w32(t, 4, seq); w32(t, 8, isn + 1); t[12] = 5 << 4; t[13] = 0x18; w16(t, 14, 0xffff); memcpy(&t[20], msg.data(), msg.size()); return t; }());
    be.send(data.data(), data.size());
    seq += (uint32_t)msg.size();
    auto got = pollUntil(be, 5000, [&](const std::vector<Bytes> &v) { return tcpPayload(v).size() >= msg.size(); });
    CHECK(tcpPayload(got) == msg);

    // Guest closes: the server sees EOF, closes, and we get a FIN
    uint32_t end = isn + 1 + (uint32_t)msg.size();
    Bytes fin = ip4(6, GIP, GW, [&] { Bytes t(20, 0); w16(t, 0, 52000); w16(t, 2, port); w32(t, 4, seq); w32(t, 8, end); t[12] = 5 << 4; t[13] = 0x11; w16(t, 14, 0xffff); return t; }());
    be.send(fin.data(), fin.size());
    auto fr = pollUntil(be, 5000, [](const std::vector<Bytes> &v) { for (auto &f : v) if (f[14 + 9] == 6 && (f[14 + 20 + 13] & 1)) return true; return false; });
    bool sawFin = false;
    for (auto &f : fr) if (f[14 + 9] == 6 && (f[14 + 20 + 13] & 1)) sawFin = true;
    CHECK(sawFin);

    // Connection to a closed port is reset
    Bytes bad = ip4(6, GIP, GW, [&] { Bytes t(20, 0); w16(t, 0, 52001); w16(t, 2, 1); w32(t, 4, 5); t[12] = 5 << 4; t[13] = 0x02; w16(t, 14, 0xffff); return t; }());
    be.send(bad.data(), bad.size());
    auto rr = pollUntil(be, 3000, [](const std::vector<Bytes> &v) { return !v.empty(); });
    CHECK(!rr.empty() && (rr[0][14 + 20 + 13] & 0x04));

    server.join();
    close(ls);
    printf("nativehost_test: OK\n");
    return 0;
}
