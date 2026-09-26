#include "netsetup.h"
#include "usernet.h"
#ifndef __EMSCRIPTEN__
#include "nativehost.h"
#endif

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#include <deque>
#include <cstdlib>

// Browser host: DNS-over-HTTPS and fetch(). Completions arrive from JS via the exported
// rve_net_*_done functions (single-threaded, called between main-loop iterations).
class WebHost : public HostIO
{
public:
    static WebHost &get() { static WebHost h; return h; }
    int resolve(const std::string &name) override;
    int http(const std::string &method, const std::string &url,
             const std::string &content_type, const std::vector<uint8_t> &body) override;
    bool poll(Event &ev) override
    {
        if (done.empty()) return false;
        ev = std::move(done.front());
        done.pop_front();
        return true;
    }
    std::deque<Event> done;
    int next = 1;
};

EM_JS_DEPS(rve_net, "$UTF8ToString,$stringToUTF8,$lengthBytesUTF8");

EM_JS(void, js_resolve, (int id, const char *name), {
    const n = UTF8ToString(name);
    const done = (status, ips) => {
        const s = ips.join(',');
        const p = Module._rve_net_alloc(lengthBytesUTF8(s) + 1);
        stringToUTF8(s, p, lengthBytesUTF8(s) + 1);
        Module._rve_net_dns_done(id, status, p);
    };
    const doh = (url) => fetch(url, {headers: {accept: 'application/dns-json'}}).then(r => r.json())
        .then(j => (j.Answer || []).filter(a => a.type === 1).map(a => a.data));
    doh('https://cloudflare-dns.com/dns-query?type=A&name=' + encodeURIComponent(n))
        .catch(() => doh('https://dns.google/resolve?type=A&name=' + encodeURIComponent(n)))
        .then(ips => done(ips.length ? 0 : 3, ips), () => done(2, []));
});

EM_JS(void, js_http, (int id, const char *method, const char *url, const char *ctype, const uint8_t *body, int blen), {
    const m = UTF8ToString(method);
    const opts = {method: m};
    const ct = UTF8ToString(ctype);
    if (ct) opts.headers = {'Content-Type': ct};
    if (blen > 0 && m !== 'GET' && m !== 'HEAD') opts.body = HEAPU8.slice(body, body + blen);
    const finish = (status, type, buf) => {
        const tp = Module._rve_net_alloc(lengthBytesUTF8(type) + 1);
        stringToUTF8(type, tp, lengthBytesUTF8(type) + 1);
        const bp = Module._rve_net_alloc(buf.length + 1);
        HEAPU8.set(buf, bp);
        Module._rve_net_http_done(id, status, tp, bp, buf.length);
    };
    fetch(UTF8ToString(url), opts).then(r =>
        r.arrayBuffer().then(b => finish(r.status, r.headers.get('content-type') || '', new Uint8Array(b))))
        .catch(() => finish(0, '', new Uint8Array(0)));
});

int WebHost::resolve(const std::string &name)
{
    int id = next++;
    js_resolve(id, name.c_str());
    return id;
}

int WebHost::http(const std::string &method, const std::string &url,
                  const std::string &content_type, const std::vector<uint8_t> &body)
{
    int id = next++;
    js_http(id, method.c_str(), url.c_str(), content_type.c_str(), body.data(), (int)body.size());
    return id;
}

extern "C" {
EMSCRIPTEN_KEEPALIVE void *rve_net_alloc(int n) { return malloc(n > 0 ? n : 1); }

EMSCRIPTEN_KEEPALIVE void rve_net_dns_done(int id, int status, char *csv)
{
    HostIO::Event ev;
    ev.kind = HostIO::Event::DNS;
    ev.id = id;
    ev.status = status;
    for (char *p = csv; *p;)
    {
        unsigned a, b, c, d;
        int n = 0;
        if (sscanf(p, "%u.%u.%u.%u%n", &a, &b, &c, &d, &n) == 4) ev.ips.push_back(a << 24 | b << 16 | c << 8 | d);
        p += n ? n : 1;
        if (*p == ',') p++;
    }
    free(csv);
    WebHost::get().done.push_back(std::move(ev));
}

EMSCRIPTEN_KEEPALIVE void rve_net_http_done(int id, int status, char *ctype, uint8_t *body, int n)
{
    HostIO::Event ev;
    ev.kind = HostIO::Event::HTTP;
    ev.id = id;
    ev.status = status;
    ev.content_type = ctype;
    ev.body.assign(body, body + n);
    free(ctype);
    free(body);
    WebHost::get().done.push_back(std::move(ev));
}
}
#endif

void net_attach_usernet(RV32 &cpu, bool fake, bool enable)
{
    static FakeHost fake_host;
    HostIO *host = nullptr;
    if (fake) host = &fake_host;
    else if (enable)
    {
#ifdef __EMSCRIPTEN__
        host = &WebHost::get();
#else
        static NativeHost native_host;
        host = &native_host;
#endif
    }
    if (!host) return;
    static UserNetBackend backend(host);
    cpu.setNetBackend(&backend);
}
