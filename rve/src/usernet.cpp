#include "usernet.h"
#include <algorithm>
#include <chrono>
#include <cstdio>
#include <cstring>

namespace {
const uint8_t GW_MAC[6] = {0x52, 0x55, 0x0a, 0x00, 0x02, 0x02};
const uint8_t BCAST[6] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
const size_t MSS = 1400;

inline uint16_t rd16(const uint8_t *p) { return (uint16_t)(p[0] << 8 | p[1]); }
inline uint32_t rd32(const uint8_t *p) { return (uint32_t)p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3]; }
inline void wr16(uint8_t *p, uint16_t v) { p[0] = v >> 8; p[1] = (uint8_t)v; }
inline void wr32(uint8_t *p, uint32_t v) { p[0] = v >> 24; p[1] = v >> 16; p[2] = v >> 8; p[3] = (uint8_t)v; }

// One's-complement sum over `n` bytes, folded into `sum` (caller inverts).
uint32_t csumAdd(uint32_t sum, const uint8_t *p, size_t n)
{
    for (; n > 1; p += 2, n -= 2) sum += rd16(p);
    if (n) sum += (uint32_t)p[0] << 8;
    return sum;
}
uint16_t csumFold(uint32_t sum)
{
    while (sum >> 16) sum = (sum & 0xffff) + (sum >> 16);
    return (uint16_t)~sum;
}
uint16_t ipChecksum(const uint8_t *p, size_t n) { return csumFold(csumAdd(0, p, n)); }

// TCP/UDP checksum with the IPv4 pseudo-header.
uint16_t l4Checksum(uint32_t src, uint32_t dst, uint8_t proto, const uint8_t *seg, size_t n)
{
    uint8_t ph[12];
    wr32(ph, src); wr32(ph + 4, dst); ph[8] = 0; ph[9] = proto; wr16(ph + 10, (uint16_t)n);
    return csumFold(csumAdd(csumAdd(0, ph, 12), seg, n));
}

uint64_t connKey(uint16_t gport, uint32_t ip, uint16_t port)
{
    return (uint64_t)gport << 48 | (uint64_t)ip << 16 | port;
}

std::string lower(std::string s)
{
    for (auto &c : s) c = (char)tolower((unsigned char)c);
    return s;
}

const char *reason(int status)
{
    switch (status)
    {
    case 200: return "OK"; case 201: return "Created"; case 204: return "No Content";
    case 301: return "Moved Permanently"; case 302: return "Found"; case 304: return "Not Modified";
    case 400: return "Bad Request"; case 403: return "Forbidden"; case 404: return "Not Found";
    case 500: return "Internal Server Error"; case 502: return "Bad Gateway";
    default: return "Status";
    }
}
} // namespace

// ---------------------------------------------------------------------------------------------
// FakeHost
// ---------------------------------------------------------------------------------------------
int FakeHost::resolve(const std::string &name)
{
    Event ev;
    ev.kind = Event::DNS;
    ev.id = next_++;
    size_t n = name.size();
    if (n > 5 && name.compare(n - 5, 5, ".test") == 0) ev.ips.push_back(0x5db8d822); // 93.184.216.34
    else ev.status = 3; // NXDOMAIN
    done_.push_back(ev);
    return ev.id;
}

int FakeHost::http(const std::string &method, const std::string &url, const std::string &, const std::vector<uint8_t> &body)
{
    requests.push_back(method + " " + url);
    Event ev;
    ev.kind = Event::HTTP;
    ev.id = next_++;
    ev.status = 200;
    ev.content_type = "text/plain";
    std::string s = "fake host: " + method + " " + url + "\n";
    ev.body.assign(s.begin(), s.end());
    ev.body.insert(ev.body.end(), body.begin(), body.end());
    done_.push_back(ev);
    return ev.id;
}

int FakeHost::tcpOpen(uint32_t, uint16_t port)
{
    if (port != 7) return 0; // refused
    int id = next_++;
    socks_[id] = Sock();
    return id;
}
int FakeHost::tcpStatus(int id) { return socks_.count(id) ? 1 : -1; }
long FakeHost::tcpRecv(int id, uint8_t *buf, size_t max)
{
    auto it = socks_.find(id);
    if (it == socks_.end()) return -2;
    Sock &s = it->second;
    if (s.echo.empty()) return s.wr_shut ? -1 : 0;
    size_t n = std::min(max, s.echo.size());
    memcpy(buf, s.echo.data(), n);
    s.echo.erase(s.echo.begin(), s.echo.begin() + n);
    return (long)n;
}
long FakeHost::tcpSend(int id, const uint8_t *data, size_t n)
{
    auto it = socks_.find(id);
    if (it == socks_.end()) return -1;
    it->second.echo.insert(it->second.echo.end(), data, data + n);
    return (long)n;
}
void FakeHost::tcpShutdownWrite(int id) { if (socks_.count(id)) socks_[id].wr_shut = true; }
void FakeHost::tcpClose(int id) { socks_.erase(id); }
int FakeHost::ping(uint32_t ip)
{
    int id = next_++;
    pings_[id] = ip;
    return id;
}
int FakeHost::pingResult(int id)
{
    auto it = pings_.find(id);
    return it == pings_.end() ? -1 : (it->second == 0x08080808 ? 1 : -1);
}

bool FakeHost::poll(Event &ev)
{
    if (done_.empty()) return false;
    ev = done_.front();
    done_.erase(done_.begin());
    return true;
}

// ---------------------------------------------------------------------------------------------
// UserNetBackend
// ---------------------------------------------------------------------------------------------
UserNetBackend::UserNetBackend(HostIO *host) : host_(host) { memset(guest_mac_, 0, 6); }

uint64_t UserNetBackend::nowMs()
{
    return (uint64_t)std::chrono::duration_cast<std::chrono::milliseconds>(
               std::chrono::steady_clock::now().time_since_epoch()).count();
}

bool UserNetBackend::poll(std::vector<uint8_t> &frame)
{
    HostIO::Event ev;
    while (host_ && host_->poll(ev))
    {
        if (ev.kind == HostIO::Event::DNS)
        {
            auto it = dns_pending_.find(ev.id);
            if (it == dns_pending_.end()) continue;
            PendingDns q = it->second;
            dns_pending_.erase(it);
            if (ev.status == 0 && !ev.ips.empty())
            {
                dns_cache_[q.name] = ev.ips;
                for (uint32_t ip : ev.ips) ip_name_[ip] = q.name;
            }
            sendDnsReply(q, ev.ips, ev.status == 0 && !ev.ips.empty() ? 0 : 3);
        }
        else
        {
            for (auto &kv : conns_)
                if (kv.second.host_id == ev.id) { finishHttp(kv.second, ev); break; }
        }
    }
    uint64_t tnow = nowMs();
    bool due = !host_ || tnow - last_pump_ms_ >= host_->pollIntervalMs(); // syscall-heavy hosts are polled at their own pace
    if (due) last_pump_ms_ = tnow;
    for (auto it = pings_.begin(); it != pings_.end() && due;)
    {
        int r = host_->pingResult(it->id);
        if (r == 1) { sendEchoReply(*it); it = pings_.erase(it); }
        else if (r < 0 || nowMs() - it->t0 > 4000)
        {
            // Destination unreachable: original IP header + first 8 bytes are not kept; quote the ICMP header
            std::vector<uint8_t> q(8 + 28, 0);
            q[0] = 3; q[1] = 1;
            q[8] = 0x45; wr16(&q[10], 28); q[16] = 64; q[17] = 1;
            wr32(&q[20], it->src); wr32(&q[24], it->dst);
            memcpy(&q[28], it->icmp.data(), std::min<size_t>(8, it->icmp.size()));
            wr16(&q[2], ipChecksum(q.data(), q.size()));
            sendIp(1, GW_IP, it->src, q.data(), q.size());
            it = pings_.erase(it);
        }
        else ++it;
    }
    if (dns_pending_.empty() && !dns_deferred_.empty())
    {
        for (auto &q : dns_deferred_) sendDnsReply(q, {}, 0);
        dns_deferred_.clear();
    }
    if (!conns_.empty() && due)
    {
        uint64_t now = tnow;
        for (auto it = conns_.begin(); it != conns_.end();)
        {
            pump(it->second, now);
            if (it->second.state == Conn::CLOSED) { release(it->second); it = conns_.erase(it); }
            else ++it;
        }
    }
    if (out_head_ >= out_.size())
    {
        out_.clear();
        out_head_ = 0;
        return false;
    }
    frame = std::move(out_[out_head_++]);
    return true;
}

void UserNetBackend::send(const uint8_t *f, size_t n)
{
    if (n < 14) return;
    memcpy(guest_mac_, f + 6, 6);
    have_guest_mac_ = true;
    uint16_t type = rd16(f + 12);
    if (type == 0x0806) handleArp(f, n);
    else if (type == 0x0800) handleIp(f, n);
}

void UserNetBackend::sendEth(uint16_t type, const uint8_t *payload, size_t n, const uint8_t *dst_mac)
{
    std::vector<uint8_t> f(14 + n);
    memcpy(f.data(), dst_mac, 6);
    memcpy(f.data() + 6, GW_MAC, 6);
    wr16(f.data() + 12, type);
    memcpy(f.data() + 14, payload, n);
    out_.push_back(std::move(f));
}

void UserNetBackend::sendIp(uint8_t proto, uint32_t src, uint32_t dst, const uint8_t *payload, size_t n)
{
    std::vector<uint8_t> p(20 + n);
    p[0] = 0x45; p[1] = 0;
    wr16(&p[2], (uint16_t)(20 + n));
    wr16(&p[4], ip_id_++);
    wr16(&p[6], 0x4000); // DF
    p[8] = 64; p[9] = proto;
    wr32(&p[12], src); wr32(&p[16], dst);
    wr16(&p[10], ipChecksum(p.data(), 20));
    memcpy(&p[20], payload, n);
    sendEth(0x0800, p.data(), p.size(), dst == 0xffffffffu || !have_guest_mac_ ? BCAST : guest_mac_);
}

void UserNetBackend::sendUdp(uint32_t src, uint16_t sport, uint32_t dst, uint16_t dport, const uint8_t *data, size_t n)
{
    std::vector<uint8_t> u(8 + n);
    wr16(&u[0], sport); wr16(&u[2], dport); wr16(&u[4], (uint16_t)(8 + n));
    memcpy(&u[8], data, n);
    uint16_t c = l4Checksum(src, dst, 17, u.data(), u.size());
    wr16(&u[6], c ? c : 0xffff);
    sendIp(17, src, dst, u.data(), u.size());
}

// ---- ARP -------------------------------------------------------------------------------------
void UserNetBackend::handleArp(const uint8_t *f, size_t n)
{
    if (n < 14 + 28) return;
    const uint8_t *a = f + 14;
    if (rd16(a + 6) != 1) return; // request
    uint32_t tpa = rd32(a + 24);
    if (tpa != GW_IP && tpa != DNS_IP) return;
    uint8_t r[28];
    memcpy(r, a, 8);
    wr16(r + 6, 2); // reply
    memcpy(r + 8, GW_MAC, 6);
    wr32(r + 14, tpa);
    memcpy(r + 18, a + 8, 6);
    memcpy(r + 24, a + 14, 4);
    sendEth(0x0806, r, 28, a + 8);
}

// ---- IPv4 ------------------------------------------------------------------------------------
void UserNetBackend::handleIp(const uint8_t *f, size_t n)
{
    if (n < 14 + 20) return;
    const uint8_t *ip = f + 14;
    size_t ihl = (ip[0] & 0xf) * 4, total = rd16(ip + 2);
    if ((ip[0] >> 4) != 4 || ihl < 20 || total < ihl || total > n - 14) return;
    if (rd16(ip + 6) & 0x3fff) return; // fragments unsupported
    uint32_t src = rd32(ip + 12), dst = rd32(ip + 16);
    switch (ip[9])
    {
    case 1:  handleIcmp(ip, total, src, dst); break;
    case 6:  handleTcp(ip, total, src, dst); break;
    case 17: handleUdp(ip, total, src, dst); break;
    }
}

void UserNetBackend::handleIcmp(const uint8_t *ip, size_t iplen, uint32_t src, uint32_t dst)
{
    size_t ihl = (ip[0] & 0xf) * 4;
    if (iplen < ihl + 8) return;
    const uint8_t *ic = ip + ihl;
    size_t n = iplen - ihl;
    if (ic[0] != 8) return; // echo request only
    bool local = dst == GW_IP || dst == DNS_IP;
    if (!local && host_ && host_->hostNetwork())
    {
        int id = host_->ping(dst);
        if (id) { pings_.push_back({id, std::vector<uint8_t>(ic, ic + n), src, dst, nowMs()}); return; }
    }
    bool known = local || ip_name_.count(dst);
    if (known)
    {
        std::vector<uint8_t> r(ic, ic + n);
        r[0] = 0; r[2] = r[3] = 0;
        wr16(&r[2], ipChecksum(r.data(), r.size()));
        sendIp(1, dst, src, r.data(), r.size());
    }
    else
    {
        // Destination host unreachable: original IP header + first 8 payload bytes
        size_t quote = std::min<size_t>(iplen, ihl + 8);
        std::vector<uint8_t> r(8 + quote, 0);
        r[0] = 3; r[1] = 1;
        memcpy(&r[8], ip, quote);
        wr16(&r[2], ipChecksum(r.data(), r.size()));
        sendIp(1, GW_IP, src, r.data(), r.size());
    }
}

void UserNetBackend::sendEchoReply(const PendingPing &p)
{
    std::vector<uint8_t> r(p.icmp);
    r[0] = 0; r[2] = r[3] = 0;
    wr16(&r[2], ipChecksum(r.data(), r.size()));
    sendIp(1, p.dst, p.src, r.data(), r.size());
}

// ---- UDP: DHCP and DNS -----------------------------------------------------------------------
void UserNetBackend::handleUdp(const uint8_t *ip, size_t iplen, uint32_t, uint32_t dst)
{
    size_t ihl = (ip[0] & 0xf) * 4;
    if (iplen < ihl + 8) return;
    const uint8_t *u = ip + ihl;
    uint16_t sport = rd16(u), dport = rd16(u + 2), ulen = rd16(u + 4);
    if (ulen < 8 || ulen > iplen - ihl) return;
    const uint8_t *p = u + 8;
    size_t n = ulen - 8;
    if (dport == 67) handleDhcp(p, n);
    else if (dport == 53 && (dst == DNS_IP || dst == GW_IP)) handleDns(p, n, sport);
}

void UserNetBackend::handleDhcp(const uint8_t *p, size_t n)
{
    if (n < 240 || p[0] != 1 || rd32(p + 236) != 0x63825363u) return;
    int type = 0;
    for (size_t i = 240; i + 1 < n && p[i] != 255;)
    {
        if (p[i] == 0) { i++; continue; }
        if (p[i] == 53 && i + 2 < n) type = p[i + 2];
        i += 2 + p[i + 1];
    }
    int reply = type == 1 ? 2 : type == 3 ? 5 : 0; // DISCOVER->OFFER, REQUEST->ACK
    if (!reply) return;
    std::vector<uint8_t> r(240, 0);
    r[0] = 2; r[1] = 1; r[2] = 6;
    memcpy(&r[4], p + 4, 4);   // xid
    memcpy(&r[10], p + 10, 2); // flags
    wr32(&r[16], GUEST_IP);    // yiaddr
    wr32(&r[20], GW_IP);       // siaddr
    memcpy(&r[28], p + 28, 16); // chaddr
    wr32(&r[236], 0x63825363u);
    auto opt = [&](uint8_t code, std::initializer_list<uint8_t> v) {
        r.push_back(code); r.push_back((uint8_t)v.size()); r.insert(r.end(), v.begin(), v.end());
    };
    opt(53, {(uint8_t)reply});
    opt(54, {10, 0, 2, 2});
    opt(51, {0, 1, 0x51, 0x80}); // lease 86400 s
    opt(1, {255, 255, 255, 0});
    opt(3, {10, 0, 2, 2});
    opt(6, {10, 0, 2, 3});
    r.push_back(255);
    while (r.size() < 300) r.push_back(0);
    sendUdp(GW_IP, 67, 0xffffffffu, 68, r.data(), r.size());
}

void UserNetBackend::handleDns(const uint8_t *p, size_t n, uint16_t sport)
{
    if (n < 12 || (p[2] & 0x80) || rd16(p + 4) != 1) return; // query with one question
    size_t i = 12;
    std::string name;
    while (i < n && p[i])
    {
        size_t l = p[i++];
        if (l & 0xc0 || i + l > n) return;
        if (!name.empty()) name += '.';
        name.append((const char *)p + i, l);
        i += l;
    }
    if (i + 5 > n) return;
    uint16_t qtype = rd16(p + i + 1);
    PendingDns q{GUEST_IP, sport, std::vector<uint8_t>(p, p + i + 5), lower(name)};
    if (qtype != 1)
    {
        // AAAA & co: empty NOERROR answer, sent after any A lookup still in flight so resolvers
        // that take the first reply (busybox nslookup) see the real answer, not the empty one.
        if (dns_pending_.empty()) sendDnsReply(q, {}, 0);
        else dns_deferred_.push_back(q);
        return;
    }
    auto c = dns_cache_.find(q.name);
    if (c != dns_cache_.end()) { sendDnsReply(q, c->second, 0); return; }
    int id = host_ ? host_->resolve(q.name) : 0;
    if (!id) { sendDnsReply(q, {}, 2); return; }
    dns_pending_[id] = q;
}

void UserNetBackend::sendDnsReply(const PendingDns &q, const std::vector<uint32_t> &ips, int rcode)
{
    std::vector<uint8_t> r(q.query);
    r[2] = 0x81; r[3] = (uint8_t)(0x80 | rcode); // QR, RD, RA
    wr16(&r[6], (uint16_t)ips.size());
    wr16(&r[8], 0); wr16(&r[10], 0);
    for (uint32_t ip : ips)
    {
        uint8_t a[16] = {0xc0, 0x0c, 0, 1, 0, 1, 0, 0, 0, 60, 0, 4};
        wr32(a + 12, ip);
        r.insert(r.end(), a, a + 16);
    }
    sendUdp(DNS_IP, 53, q.client_ip, q.client_port, r.data(), r.size());
}

// ---- TCP -------------------------------------------------------------------------------------
void UserNetBackend::sendTcp(Conn &c, uint8_t flags, const uint8_t *data, size_t n, uint32_t seq)
{
    bool syn = flags & 2;
    size_t hl = syn ? 24 : 20;
    std::vector<uint8_t> s(hl + n);
    wr16(&s[0], c.port); wr16(&s[2], c.gport);
    wr32(&s[4], seq); wr32(&s[8], c.rcv_nxt);
    s[12] = (uint8_t)(hl / 4 << 4);
    s[13] = flags;
    wr16(&s[14], 0xffff);
    if (syn) { s[20] = 2; s[21] = 4; wr16(&s[22], (uint16_t)MSS); }
    if (n) memcpy(&s[hl], data, n);
    wr16(&s[16], l4Checksum(c.ip, GUEST_IP, 6, s.data(), s.size()));
    sendIp(6, c.ip, GUEST_IP, s.data(), s.size());
    c.last_tx_ms = nowMs();
}

void UserNetBackend::sendRst(uint32_t src, uint16_t sport, uint32_t dst, uint16_t dport, uint32_t seq, uint32_t ack, bool ack_valid)
{
    Conn c;
    c.ip = dst; c.port = dport; c.gport = sport; c.rcv_nxt = ack;
    (void)src;
    sendTcp(c, ack_valid ? 0x14 : 0x04, nullptr, 0, seq); // RST|ACK or RST
}

void UserNetBackend::handleTcp(const uint8_t *ip, size_t iplen, uint32_t src, uint32_t dst)
{
    size_t ihl = (ip[0] & 0xf) * 4;
    if (iplen < ihl + 20) return;
    const uint8_t *t = ip + ihl;
    size_t doff = (t[12] >> 4) * 4;
    if (doff < 20 || iplen < ihl + doff) return;
    uint16_t sport = rd16(t), dport = rd16(t + 2);
    uint32_t seq = rd32(t + 4), ack = rd32(t + 8);
    uint8_t flags = t[13];
    const uint8_t *data = t + doff;
    size_t dlen = iplen - ihl - doff;
    uint64_t key = connKey(sport, dst, dport);
    auto it = conns_.find(key);

    if (flags & 0x04) { if (it != conns_.end()) { release(it->second); conns_.erase(it); } return; } // RST
    bool hostnet = host_ && host_->hostNetwork();
    if (it == conns_.end())
    {
        if ((flags & 0x12) == 0x02 && (hostnet || dport == 80))
        {
            Conn c;
            c.ip = dst; c.port = dport; c.gport = sport;
            c.rcv_nxt = seq + 1;
            c.snd_una = c.snd_nxt = isn_;
            isn_ += 0x10000;
            if (hostnet)
            {
                c.raw = true;
                c.tcp_id = host_->tcpOpen(dst, dport);
                if (!c.tcp_id) { sendRst(src, sport, dst, dport, 0, seq + 1, true); return; } // refused
                c.connecting = true; // SYN-ACK is sent from pump() once the host connect finishes
                conns_[key] = c;
                return;
            }
            Conn &cc = conns_[key] = c;
            sendTcp(cc, 0x12, nullptr, 0, cc.snd_nxt);
            cc.snd_nxt++;
        }
        else if (flags & 0x10) sendRst(src, sport, dst, dport, ack, 0, false);
        else sendRst(src, sport, dst, dport, 0, seq + dlen + ((flags & 3) ? 1 : 0), true);
        return;
    }
    Conn &c = it->second;
    if (flags & 0x02) return; // retransmitted SYN: our SYN-ACK is already queued/sent (or pending)
    if (c.connecting) return;

    if ((flags & 0x10) && (int32_t)(ack - c.snd_una) > 0 && (int32_t)(c.snd_nxt - ack) >= 0)
    {
        c.snd_una = ack;
        if (c.state == Conn::SYN_RCVD) c.state = Conn::ESTABLISHED;
        // drop acknowledged response bytes so a long-lived stream doesn't grow without bound
        uint32_t acked = c.snd_una - c.resp_base;
        if (acked > 0 && acked <= c.resp_sent)
        {
            c.resp.erase(c.resp.begin(), c.resp.begin() + acked);
            c.resp_base += acked;
            c.resp_sent -= acked;
        }
    }
    bool need_ack = false;
    if (dlen)
    {
        if (seq == c.rcv_nxt)
        {
            if (c.raw)
            {
                // back-pressure: stop consuming (the guest retransmits) while the host is behind
                if (c.to_host.size() < 256 * 1024)
                {
                    c.to_host.insert(c.to_host.end(), data, data + dlen);
                    c.rcv_nxt += (uint32_t)dlen;
                }
            }
            else
            {
                c.req.insert(c.req.end(), data, data + dlen);
                c.rcv_nxt += (uint32_t)dlen;
            }
        }
        need_ack = true; // ack in-order data, or re-ack (dup ack) for out-of-order/retransmits
    }
    if ((flags & 0x01) && seq + dlen == c.rcv_nxt) { c.rcv_nxt++; need_ack = true; c.guest_fin = true; }
    if (need_ack) sendTcp(c, 0x10, nullptr, 0, c.snd_nxt);
    if (c.state == Conn::ESTABLISHED && !c.raw) tryHttp(c);
    if (c.fin_queued && c.snd_una == c.snd_nxt && (!c.raw || c.guest_fin)) c.state = Conn::CLOSED;
}

void UserNetBackend::tryHttp(Conn &c)
{
    if (c.req_sent) return;
    std::string s((const char *)c.req.data(), c.req.size());
    size_t he = s.find("\r\n\r\n");
    if (he == std::string::npos) return;
    size_t le = s.find("\r\n");
    std::string line = s.substr(0, le);
    size_t sp1 = line.find(' '), sp2 = line.find(' ', sp1 + 1);
    if (sp1 == std::string::npos || sp2 == std::string::npos) return;
    std::string method = line.substr(0, sp1), path = line.substr(sp1 + 1, sp2 - sp1 - 1);
    std::string host, ctype;
    size_t clen = 0;
    for (size_t p = le + 2; p < he + 2;)
    {
        size_t e = s.find("\r\n", p);
        std::string h = s.substr(p, e - p);
        size_t colon = h.find(':');
        if (colon != std::string::npos)
        {
            std::string k = lower(h.substr(0, colon)), v = h.substr(colon + 1);
            v.erase(0, v.find_first_not_of(" \t"));
            if (k == "host") host = v;
            else if (k == "content-length") clen = (size_t)atol(v.c_str());
            else if (k == "content-type") ctype = v;
        }
        p = e + 2;
    }
    if (c.req.size() < he + 4 + clen) return; // body still arriving
    if (host.empty())
    {
        auto n = ip_name_.find(c.ip);
        if (n != ip_name_.end()) host = n->second;
        else
        {
            char b[20];
            snprintf(b, sizeof b, "%u.%u.%u.%u", c.ip >> 24, c.ip >> 16 & 255, c.ip >> 8 & 255, c.ip & 255);
            host = b;
        }
    }
    std::vector<uint8_t> body(c.req.begin() + he + 4, c.req.begin() + he + 4 + clen);
    c.req_sent = true;
    c.host_id = host_ ? host_->http(method, "https://" + host + path, ctype, body) : 0;
    if (!c.host_id)
    {
        HostIO::Event ev;
        ev.kind = HostIO::Event::HTTP;
        finishHttp(c, ev);
    }
}

void UserNetBackend::finishHttp(Conn &c, const HostIO::Event &ev)
{
    int status = ev.status;
    std::vector<uint8_t> body = ev.body;
    std::string ctype = ev.content_type.empty() ? "application/octet-stream" : ev.content_type;
    if (status == 0)
    {
        status = 502;
        ctype = "text/plain";
        static const char msg[] = "rve: request failed (blocked by CORS, mixed content or network error)\n";
        body.assign(msg, msg + sizeof(msg) - 1);
    }
    char hdr[256];
    int hn = snprintf(hdr, sizeof hdr,
                      "HTTP/1.1 %d %s\r\nContent-Type: %s\r\nContent-Length: %zu\r\nConnection: close\r\n\r\n",
                      status, reason(status), ctype.c_str(), body.size());
    c.resp.assign(hdr, hdr + hn);
    c.resp.insert(c.resp.end(), body.begin(), body.end());
    c.resp_base = c.snd_nxt;
    c.resp_sent = 0;
    c.host_id = 0;
    c.fin_wanted = true;
    pump(c, nowMs());
}

void UserNetBackend::release(Conn &c)
{
    if (c.raw && c.tcp_id && host_) host_->tcpClose(c.tcp_id);
    c.tcp_id = 0;
}

// Raw (host network) mode: move bytes between the guest-facing buffers and the host socket.
void UserNetBackend::pumpRaw(Conn &c)
{
    if (c.connecting)
    {
        int st = host_->tcpStatus(c.tcp_id);
        if (st == 0) return;
        if (st < 0)
        {
            sendRst(GUEST_IP, c.gport, c.ip, c.port, 0, c.rcv_nxt, true);
            c.state = Conn::CLOSED;
            return;
        }
        c.connecting = false;
        sendTcp(c, 0x12, nullptr, 0, c.snd_nxt); // SYN-ACK
        c.snd_nxt++;
        c.resp_base = c.snd_nxt;
        return;
    }
    if (c.state != Conn::ESTABLISHED) return;
    // guest -> host
    while (!c.to_host.empty())
    {
        long n = host_->tcpSend(c.tcp_id, c.to_host.data(), c.to_host.size());
        if (n < 0) { sendRst(GUEST_IP, c.gport, c.ip, c.port, c.snd_nxt, c.rcv_nxt, true); c.state = Conn::CLOSED; return; }
        if (n == 0) break;
        c.to_host.erase(c.to_host.begin(), c.to_host.begin() + n);
    }
    if (c.guest_fin && c.to_host.empty() && !c.shut_sent) { host_->tcpShutdownWrite(c.tcp_id); c.shut_sent = true; }
    // host -> guest (bounded read-ahead)
    uint8_t buf[16384];
    while (!c.fin_wanted && c.resp.size() < 64 * 1024)
    {
        long n = host_->tcpRecv(c.tcp_id, buf, sizeof buf);
        if (n > 0) c.resp.insert(c.resp.end(), buf, buf + n);
        else if (n == -1) c.fin_wanted = true;
        else if (n < -1) { sendRst(GUEST_IP, c.gport, c.ip, c.port, c.snd_nxt, c.rcv_nxt, true); c.state = Conn::CLOSED; return; }
        else break;
    }
}

// Send new response data within the window; retransmit (go-back-N) after 500 ms of silence.
void UserNetBackend::pump(Conn &c, uint64_t now)
{
    if (c.raw) pumpRaw(c);
    if (c.state != Conn::ESTABLISHED) return;
    if (!c.fin_wanted && c.resp.empty()) return;
    uint32_t inflight = c.resp_base + (uint32_t)c.resp_sent + (c.fin_queued ? 1 : 0) - c.snd_una;
    if (inflight > 0 && now - c.last_tx_ms > 500)
    {
        uint32_t acked = c.snd_una - c.resp_base;
        c.resp_sent = std::min<size_t>(acked, c.resp.size());
        c.fin_queued = false;
        c.snd_nxt = c.resp_base + (uint32_t)c.resp_sent;
        inflight = 0;
    }
    while (c.resp_sent < c.resp.size() && inflight < 4 * MSS)
    {
        size_t n = std::min(MSS, c.resp.size() - c.resp_sent);
        sendTcp(c, 0x18, c.resp.data() + c.resp_sent, n, c.resp_base + (uint32_t)c.resp_sent);
        c.resp_sent += n;
        inflight += (uint32_t)n;
        c.snd_nxt = c.resp_base + (uint32_t)c.resp_sent;
    }
    if (c.fin_wanted && c.resp_sent == c.resp.size() && !c.fin_queued)
    {
        sendTcp(c, 0x11, nullptr, 0, c.snd_nxt);
        c.snd_nxt++;
        c.fin_queued = true;
    }
    if (c.fin_queued && c.snd_una == c.snd_nxt && (!c.raw || c.guest_fin)) c.state = Conn::CLOSED;
}
