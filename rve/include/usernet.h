// In-emulator userspace network stack for the virtio-net device. It plays the role of the
// "outside world" for a guest on 10.0.2.0/24: ARP, a DHCP server, a DNS forwarder, ICMP echo,
// and a minimal TCP endpoint whose HTTP requests are bridged to the host (browser fetch).
//
//   guest 10.0.2.15   gateway 10.0.2.2   DNS 10.0.2.3
//
// Limits (by design, browsers only offer fetch): DNS via DoH, ping is answered locally for hosts
// that resolved, TCP is accepted on port 80 only and treated as HTTP (upgraded to https:// by the
// host). Anything else is refused (TCP RST / ICMP unreachable).
#pragma once
#include "netbackend.h"
#include <cstdint>
#include <map>
#include <set>
#include <string>
#include <vector>

// Asynchronous host services. Requests return an id; completions are reported through poll().
class HostIO
{
public:
    struct Event
    {
        enum Kind { DNS, HTTP } kind;
        int id = 0;
        int status = 0;                 // DNS: 0 ok / nonzero failure. HTTP: status code (0 = network/CORS error)
        std::vector<uint32_t> ips;      // DNS: IPv4 addresses (host byte order)
        std::string content_type;       // HTTP
        std::vector<uint8_t> body;      // HTTP
    };
    virtual ~HostIO() {}
    virtual int resolve(const std::string &name) = 0;
    virtual int http(const std::string &method, const std::string &url,
                     const std::string &content_type, const std::vector<uint8_t> &body) = 0;
    virtual bool poll(Event &ev) = 0;

    // ---- Optional real-network services (native hosts). Browsers can't offer these. ----
    // When hostNetwork() is true the stack proxies every guest TCP connection byte-for-byte
    // through tcpOpen/tcpSend/tcpRecv (any port; HTTPS and ssh just work) and forwards ping.
    // Everything is non-blocking and polled by the stack.
    virtual bool hostNetwork() const { return false; }
    virtual uint32_t pollIntervalMs() const { return 0; } // min. spacing of tcp/ping polling (syscall-heavy hosts)
    virtual int tcpOpen(uint32_t /*ip*/, uint16_t /*port*/) { return 0; }   // >0 id, 0 = refused now
    virtual int tcpStatus(int /*id*/) { return -1; }                         // 0 connecting, 1 up, -1 failed
    virtual long tcpRecv(int /*id*/, uint8_t * /*buf*/, size_t /*max*/) { return -2; } // n>0 data, 0 none yet, -1 EOF, -2 error
    virtual long tcpSend(int /*id*/, const uint8_t * /*data*/, size_t /*n*/) { return -1; } // bytes accepted, <0 error
    virtual void tcpShutdownWrite(int /*id*/) {}
    virtual void tcpClose(int /*id*/) {}
    virtual int ping(uint32_t /*ip*/) { return 0; }                          // >0 id, 0 = unsupported
    virtual int pingResult(int /*id*/) { return -1; }                        // 0 pending, 1 reply, -1 failed
};

// Deterministic host for tests: any "*.test" name resolves to 93.184.216.34, HTTP returns 200
// with the body "fake host: <METHOD> <url>\n" (POST bodies are echoed after that).
class FakeHost : public HostIO
{
public:
    // raw=true also enables the real-network API with an in-memory world: TCP port 7 echoes,
    // other ports are refused, and 8.8.8.8 answers ping.
    explicit FakeHost(bool raw = false) : raw_(raw) {}
    bool hostNetwork() const override { return raw_; }
    int tcpOpen(uint32_t ip, uint16_t port) override;
    int tcpStatus(int id) override;
    long tcpRecv(int id, uint8_t *buf, size_t max) override;
    long tcpSend(int id, const uint8_t *data, size_t n) override;
    void tcpShutdownWrite(int id) override;
    void tcpClose(int id) override;
    int ping(uint32_t ip) override;
    int pingResult(int id) override;
    int resolve(const std::string &name) override;
    int http(const std::string &method, const std::string &url,
             const std::string &content_type, const std::vector<uint8_t> &body) override;
    bool poll(Event &ev) override;
    std::vector<std::string> requests; // "METHOD url" log for assertions
private:
    struct Sock { std::vector<uint8_t> echo; bool wr_shut = false; bool closed = false; };
    bool raw_;
    int next_ = 1;
    std::vector<Event> done_;
    std::map<int, Sock> socks_;
    std::map<int, uint32_t> pings_;
};

class UserNetBackend : public NetBackend
{
public:
    explicit UserNetBackend(HostIO *host);
    void send(const uint8_t *frame, size_t len) override;
    bool poll(std::vector<uint8_t> &frame) override;

    // Addresses (host byte order)
    static const uint32_t GUEST_IP = 0x0a00020f, GW_IP = 0x0a000202, DNS_IP = 0x0a000203;

private:
    struct Conn
    {
        enum State { SYN_RCVD, ESTABLISHED, FIN_SENT, CLOSED } state = SYN_RCVD;
        uint32_t ip = 0;                // remote (server) address
        uint16_t port = 0, gport = 0;   // remote and guest ports
        uint32_t snd_nxt = 0, snd_una = 0, rcv_nxt = 0;
        std::vector<uint8_t> req;       // HTTP request bytes received so far
        bool req_sent = false;
        int host_id = 0;
        std::vector<uint8_t> resp;      // response bytes still to send
        size_t resp_sent = 0;           // bytes of resp already sent (in flight or acked)
        uint32_t resp_base = 0;         // sequence number of resp[0]
        bool fin_queued = false;
        uint64_t last_tx_ms = 0;
        // raw (host network) mode
        bool raw = false;
        int tcp_id = 0;
        bool connecting = false;        // waiting for the host connect before sending SYN-ACK
        std::vector<uint8_t> to_host;   // guest -> host bytes the host hasn't accepted yet
        bool guest_fin = false, shut_sent = false;
        bool fin_wanted = false;        // send FIN once resp is drained (HTTP done / host EOF)
    };
    struct PendingPing { int id; std::vector<uint8_t> icmp; uint32_t src, dst; uint64_t t0; };
    struct PendingDns { uint32_t client_ip; uint16_t client_port; std::vector<uint8_t> query; std::string name; };

    void handleArp(const uint8_t *f, size_t n);
    void handleIp(const uint8_t *f, size_t n);
    void handleIcmp(const uint8_t *ip, size_t iplen, uint32_t src, uint32_t dst);
    void handleUdp(const uint8_t *ip, size_t iplen, uint32_t src, uint32_t dst);
    void handleDhcp(const uint8_t *p, size_t n);
    void handleDns(const uint8_t *p, size_t n, uint16_t sport);
    void handleTcp(const uint8_t *ip, size_t iplen, uint32_t src, uint32_t dst);

    void sendEth(uint16_t type, const uint8_t *payload, size_t n, const uint8_t *dst_mac);
    void sendIp(uint8_t proto, uint32_t src, uint32_t dst, const uint8_t *payload, size_t n);
    void sendUdp(uint32_t src, uint16_t sport, uint32_t dst, uint16_t dport, const uint8_t *p, size_t n);
    void sendTcp(Conn &c, uint8_t flags, const uint8_t *data, size_t n, uint32_t seq);
    void sendRst(uint32_t src, uint16_t sport, uint32_t dst, uint16_t dport, uint32_t seq, uint32_t ack, bool ack_valid);
    void sendDnsReply(const PendingDns &q, const std::vector<uint32_t> &ips, int rcode);
    void pump(Conn &c, uint64_t now);
    void pumpRaw(Conn &c);
    void release(Conn &c);   // free host-side resources before a Conn is dropped
    void sendEchoReply(const PendingPing &p);
    void tryHttp(Conn &c);
    void finishHttp(Conn &c, const HostIO::Event &ev);
    static uint64_t nowMs();

    HostIO *host_;
    uint8_t guest_mac_[6];
    bool have_guest_mac_ = false;
    std::vector<std::vector<uint8_t>> out_; // frames queued for the guest
    size_t out_head_ = 0;
    std::map<uint64_t, Conn> conns_;        // key: guest port << 32 | remote ip << 16 | port (hashed)
    std::map<int, PendingDns> dns_pending_;
    std::vector<PendingDns> dns_deferred_;      // empty answers held back until pending A lookups finish
    std::map<uint32_t, std::string> ip_name_;   // resolved IP -> host name (HTTP Host / ping allow-list)
    std::map<std::string, std::vector<uint32_t>> dns_cache_;
    std::vector<PendingPing> pings_;
    uint16_t ip_id_ = 1;
    uint64_t last_pump_ms_ = 0;
    uint32_t isn_ = 0x1000;
};
