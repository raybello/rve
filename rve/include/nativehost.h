// Real-network HostIO for native builds: POSIX sockets. The guest's TCP connections are proxied
// byte-for-byte (any port, so HTTPS and ssh work), DNS uses the system resolver, ping uses
// unprivileged ICMP sockets. The gateway address 10.0.2.2 maps to the host's loopback (like QEMU's
// user networking), so a guest can reach services listening on the host at 10.0.2.2:<port>.
#pragma once
#include "usernet.h"
#include <deque>
#include <memory>
#include <mutex>
#include <map>

class NativeHost : public HostIO
{
public:
    NativeHost();
    ~NativeHost() override;
    bool hostNetwork() const override { return true; }
    uint32_t pollIntervalMs() const override { return 1; }
    int resolve(const std::string &name) override;
    int http(const std::string &, const std::string &, const std::string &, const std::vector<uint8_t> &) override { return 0; }
    bool poll(Event &ev) override;
    int tcpOpen(uint32_t ip, uint16_t port) override;
    int tcpStatus(int id) override;
    long tcpRecv(int id, uint8_t *buf, size_t max) override;
    long tcpSend(int id, const uint8_t *data, size_t n) override;
    void tcpShutdownWrite(int id) override;
    void tcpClose(int id) override;
    int ping(uint32_t ip) override;
    int pingResult(int id) override;

private:
    struct Sock { int fd; bool up; uint64_t t0; };
    struct PingSock { int fd; uint64_t t0; };
    struct Shared
    {
        std::mutex m;
        std::deque<Event> done;
    };
    std::shared_ptr<Shared> shared_;
    std::map<int, Sock> socks_;
    std::map<int, PingSock> pings_;
    int next_ = 1;
    uint16_t ping_seq_ = 1;
};
