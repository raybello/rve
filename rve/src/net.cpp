#include "net.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

// ── Connection state ────────────────────────────────────────────────────────

int net_fd      = -1;
int net_fd_conn = -1;

static bool s_server = false;

// Reassembly state for the current inbound packet.
static struct {
    union {
        int32_t  i32;
        uint8_t  buf[4];
    } len;
    uint32_t  hdr_pos;
    uint8_t  *data;
    uint32_t  data_pos;
    bool      hdr_done;
    int       reads;
} s_recv;

// ── Helpers ─────────────────────────────────────────────────────────────────

static void recv_reset()
{
    s_recv.len.i32  = 0;
    s_recv.hdr_pos  = 0;
    if (s_recv.data) { free(s_recv.data); s_recv.data = nullptr; }
    s_recv.data_pos = 0;
    s_recv.hdr_done = false;
    s_recv.reads    = 0;
}

// ── Public API ───────────────────────────────────────────────────────────────

void net_init(const char *path, bool server)
{
    recv_reset();
    s_server = server;

    struct sockaddr_un addr;
    if (strlen(path) >= sizeof(addr.sun_path)) {
        fprintf(stderr, "net_init: socket path too long\n");
        return;
    }

    memset(&addr, 0, sizeof(addr));
    addr.sun_family = AF_UNIX;
    strncpy(addr.sun_path, path, sizeof(addr.sun_path) - 1);

    if (server) {
        net_fd = socket(AF_UNIX, SOCK_STREAM, 0);
        if (net_fd < 0) { perror("net_init: socket"); return; }

        unlink(path);

        if (bind(net_fd, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
            perror("net_init: bind"); close(net_fd); net_fd = -1; return;
        }
        if (listen(net_fd, 1) < 0) {
            perror("net_init: listen"); close(net_fd); net_fd = -1; return;
        }
        printf("net: waiting for client on %s\n", path);
        net_fd_conn = accept(net_fd, nullptr, nullptr);
        if (net_fd_conn < 0) {
            perror("net_init: accept"); net_fd_conn = -1; return;
        }
        printf("net: client connected\n");
    } else {
        net_fd = socket(AF_UNIX, SOCK_STREAM, 0);
        if (net_fd < 0) { perror("net_init: socket"); return; }
        printf("net: connecting to server on %s\n", path);
        if (connect(net_fd, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
            perror("net_init: connect"); close(net_fd); net_fd = -1; return;
        }
        printf("net: connected\n");
        net_fd_conn = net_fd;
    }

    int flags = fcntl(net_fd_conn, F_GETFL, 0);
    fcntl(net_fd_conn, F_SETFL, flags | O_NONBLOCK);
}

void net_send(uint8_t *data, uint32_t len)
{
    if (net_fd_conn == -1) return;

    for (uint32_t i = 0; i < 4; i++) {
        uint8_t b = (len >> (i * 8)) & 0xFF;
        if (write(net_fd_conn, &b, 1) < 0) {
            fprintf(stderr, "net_send: write (header byte %u): %s\n", i, strerror(errno));
            close(net_fd_conn);
            net_fd_conn = -1;
            return;
        }
    }

    ssize_t written = write(net_fd_conn, data, len);
    if (written != (ssize_t)len) {
        fprintf(stderr, "net_send: write (payload): %s\n", strerror(errno));
        close(net_fd_conn);
        net_fd_conn = -1;
    }
}

bool net_recv(uint8_t **data_out, uint32_t *len_out)
{
    if (net_fd_conn == -1) return false;

    // Phase 1: read the 4-byte length header
    while (!s_recv.hdr_done && s_recv.hdr_pos < 4) {
        uint8_t b;
        int n = (int)read(net_fd_conn, &b, 1);
        if (n == 1) {
            s_recv.len.buf[s_recv.hdr_pos++] = b;
        } else if (n == 0) {
            if (s_recv.hdr_pos == 0) return false;
            fprintf(stderr, "net_recv: peer closed mid-header\n");
            recv_reset();
            close(net_fd_conn); net_fd_conn = -1;
            return false;
        } else {
            if (errno != EAGAIN && errno != EWOULDBLOCK) {
                fprintf(stderr, "net_recv: read (header): %s\n", strerror(errno));
                recv_reset();
                close(net_fd_conn); net_fd_conn = -1;
            }
            return false;
        }
    }

    if (!s_recv.hdr_done) {
        if (s_recv.hdr_pos < 4) return false;
        if (s_recv.len.i32 <= 0) {
            fprintf(stderr, "net_recv: invalid packet length %d\n", s_recv.len.i32);
            recv_reset();
            return false;
        }
        s_recv.data = (uint8_t *)malloc((size_t)s_recv.len.i32);
        if (!s_recv.data) {
            fprintf(stderr, "net_recv: malloc failed\n");
            recv_reset();
            return false;
        }
        s_recv.hdr_done = true;
    }

    // Phase 2: read the payload
    while (s_recv.data_pos < (uint32_t)s_recv.len.i32) {
        int remaining = s_recv.len.i32 - (int)s_recv.data_pos;
        int n = (int)read(net_fd_conn,
                          s_recv.data + s_recv.data_pos,
                          (size_t)remaining);
        if (n > 0) {
            s_recv.data_pos += (uint32_t)n;
            s_recv.reads++;
        } else if (n == 0) {
            fprintf(stderr, "net_recv: peer closed mid-payload\n");
            recv_reset();
            close(net_fd_conn); net_fd_conn = -1;
            return false;
        } else {
            if (errno != EAGAIN && errno != EWOULDBLOCK) {
                fprintf(stderr, "net_recv: read (payload): %s\n", strerror(errno));
                recv_reset();
                close(net_fd_conn); net_fd_conn = -1;
            }
            return false;
        }
    }

    *data_out = s_recv.data;
    *len_out  = (uint32_t)s_recv.len.i32;

    s_recv.data     = nullptr;
    s_recv.hdr_pos  = 0;
    s_recv.hdr_done = false;
    s_recv.data_pos = 0;
    s_recv.reads    = 0;
    s_recv.len.i32  = 0;
    return true;
}

bool net_is_server()
{
    return s_server;
}
