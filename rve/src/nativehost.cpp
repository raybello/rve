#ifndef __EMSCRIPTEN__
#include "nativehost.h"
#include <arpa/inet.h>
#include <cerrno>
#include <chrono>
#include <csignal>
#include <cstring>
#include <fcntl.h>
#include <netdb.h>
#include <netinet/in.h>
#include <poll.h>
#include <sys/socket.h>
#include <thread>
#include <unistd.h>

namespace {
uint64_t nowMs()
{
    return (uint64_t)std::chrono::duration_cast<std::chrono::milliseconds>(
               std::chrono::steady_clock::now().time_since_epoch()).count();
}
const uint32_t GW_IP = 0x0a000202;
const uint64_t CONNECT_TIMEOUT_MS = 15000;

void setNonBlocking(int fd) { fcntl(fd, F_SETFL, fcntl(fd, F_GETFL, 0) | O_NONBLOCK); }

// Guest-visible address -> host address: the gateway is the host itself.
uint32_t toHost(uint32_t ip) { return ip == GW_IP ? 0x7f000001u : ip; }
// Host address -> guest-visible: loopback answers (e.g. "localhost") point at the gateway.
uint32_t toGuest(uint32_t ip) { return (ip >> 24) == 127 ? GW_IP : ip; }
} // namespace

NativeHost::NativeHost() : shared_(std::make_shared<Shared>())
{
    signal(SIGPIPE, SIG_IGN);
}

NativeHost::~NativeHost()
{
    for (auto &kv : socks_) close(kv.second.fd);
    for (auto &kv : pings_) close(kv.second.fd);
}

int NativeHost::resolve(const std::string &name)
{
    int id = next_++;
    auto sh = shared_;
    std::thread([sh, id, name]() {
        Event ev;
        ev.kind = Event::DNS;
        ev.id = id;
        struct addrinfo hints, *res = nullptr;
        memset(&hints, 0, sizeof hints);
        hints.ai_family = AF_INET;
        hints.ai_socktype = SOCK_STREAM;
        int rc = getaddrinfo(name.c_str(), nullptr, &hints, &res);
        if (rc == 0)
        {
            for (struct addrinfo *p = res; p; p = p->ai_next)
                ev.ips.push_back(toGuest(ntohl(((struct sockaddr_in *)p->ai_addr)->sin_addr.s_addr)));
            freeaddrinfo(res);
            if (ev.ips.empty()) ev.status = 3;
        }
        else ev.status = 3; // NXDOMAIN-ish
        std::lock_guard<std::mutex> lk(sh->m);
        sh->done.push_back(std::move(ev));
    }).detach();
    return id;
}

bool NativeHost::poll(Event &ev)
{
    std::lock_guard<std::mutex> lk(shared_->m);
    if (shared_->done.empty()) return false;
    ev = std::move(shared_->done.front());
    shared_->done.pop_front();
    return true;
}

int NativeHost::tcpOpen(uint32_t ip, uint16_t port)
{
    int fd = socket(AF_INET, SOCK_STREAM, 0);
    if (fd < 0) return 0;
    setNonBlocking(fd);
#ifdef SO_NOSIGPIPE
    int one = 1;
    setsockopt(fd, SOL_SOCKET, SO_NOSIGPIPE, &one, sizeof one);
#endif
    struct sockaddr_in a;
    memset(&a, 0, sizeof a);
    a.sin_family = AF_INET;
    a.sin_port = htons(port);
    a.sin_addr.s_addr = htonl(toHost(ip));
    if (connect(fd, (struct sockaddr *)&a, sizeof a) < 0 && errno != EINPROGRESS)
    {
        close(fd);
        return 0;
    }
    int id = next_++;
    socks_[id] = Sock{fd, false, nowMs()};
    return id;
}

int NativeHost::tcpStatus(int id)
{
    auto it = socks_.find(id);
    if (it == socks_.end()) return -1;
    Sock &s = it->second;
    if (s.up) return 1;
    struct pollfd p = {s.fd, POLLOUT, 0};
    if (::poll(&p, 1, 0) > 0)
    {
        int err = 0;
        socklen_t len = sizeof err;
        getsockopt(s.fd, SOL_SOCKET, SO_ERROR, &err, &len);
        if (err) return -1;
        s.up = true;
        return 1;
    }
    return nowMs() - s.t0 > CONNECT_TIMEOUT_MS ? -1 : 0;
}

long NativeHost::tcpRecv(int id, uint8_t *buf, size_t max)
{
    auto it = socks_.find(id);
    if (it == socks_.end()) return -2;
    ssize_t n = recv(it->second.fd, buf, max, 0);
    if (n > 0) return (long)n;
    if (n == 0) return -1; // EOF
    return (errno == EAGAIN || errno == EWOULDBLOCK || errno == EINTR) ? 0 : -2;
}

long NativeHost::tcpSend(int id, const uint8_t *data, size_t n)
{
    auto it = socks_.find(id);
    if (it == socks_.end()) return -1;
#ifdef MSG_NOSIGNAL
    ssize_t w = send(it->second.fd, data, n, MSG_NOSIGNAL);
#else
    ssize_t w = send(it->second.fd, data, n, 0);
#endif
    if (w >= 0) return (long)w;
    return (errno == EAGAIN || errno == EWOULDBLOCK || errno == EINTR) ? 0 : -1;
}

void NativeHost::tcpShutdownWrite(int id)
{
    auto it = socks_.find(id);
    if (it != socks_.end()) shutdown(it->second.fd, SHUT_WR);
}

void NativeHost::tcpClose(int id)
{
    auto it = socks_.find(id);
    if (it == socks_.end()) return;
    close(it->second.fd);
    socks_.erase(it);
}

// ---- ICMP echo through an unprivileged datagram ICMP socket (macOS, Linux with ping_group_range) ----
int NativeHost::ping(uint32_t ip)
{
    int fd = socket(AF_INET, SOCK_DGRAM, IPPROTO_ICMP);
    if (fd < 0) return 0; // unsupported: the stack falls back to its local answer
    setNonBlocking(fd);
    uint8_t pkt[16] = {8, 0, 0, 0, 0x52, 0x56, (uint8_t)(ping_seq_ >> 8), (uint8_t)ping_seq_, 'r', 'v', 'e', 'p', 'i', 'n', 'g', '!'};
    ping_seq_++;
    uint32_t sum = 0;
    for (int i = 0; i < 16; i += 2) sum += pkt[i] << 8 | pkt[i + 1];
    while (sum >> 16) sum = (sum & 0xffff) + (sum >> 16);
    sum = ~sum;
    pkt[2] = (uint8_t)(sum >> 8); pkt[3] = (uint8_t)sum;
    struct sockaddr_in a;
    memset(&a, 0, sizeof a);
    a.sin_family = AF_INET;
    a.sin_addr.s_addr = htonl(toHost(ip));
    if (sendto(fd, pkt, sizeof pkt, 0, (struct sockaddr *)&a, sizeof a) < 0) { close(fd); return 0; }
    int id = next_++;
    pings_[id] = PingSock{fd, nowMs()};
    return id;
}

int NativeHost::pingResult(int id)
{
    auto it = pings_.find(id);
    if (it == pings_.end()) return -1;
    uint8_t buf[256];
    ssize_t n = recv(it->second.fd, buf, sizeof buf, 0);
    int r = 0;
    if (n > 0)
    {
        size_t off = (buf[0] >> 4) == 4 ? (size_t)(buf[0] & 0xf) * 4 : 0; // macOS includes the IP header
        r = ((size_t)n > off && buf[off] == 0) ? 1 : -1;                   // type 0 = echo reply
    }
    else if (nowMs() - it->second.t0 > 3500) r = -1;
    if (r != 0) { close(it->second.fd); pings_.erase(it); }
    return r;
}
#endif
