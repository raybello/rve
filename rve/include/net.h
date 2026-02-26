#ifndef NET_H
#define NET_H

// Unix-socket network device, adapted from src_new/net.h.
// When net_fd_conn == -1 (the default), all functions are no-ops so the
// emulator works correctly without a network connection (e.g. ISA tests).

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

static int net_fd = -1;
static int net_fd_conn = -1;

static struct {
    union {
        int32_t i32;
        uint8_t buf[4];
    } len;
    uint32_t i;
    uint8_t *buf;
    uint32_t buf_pos;
    bool valid;
    int reads;
} net_recv_info;

static inline void net_init(const char *path, bool server)
{
    struct sockaddr_un addr;
    int flags;

    net_recv_info.len.i32 = -1;
    net_recv_info.valid = false;
    net_recv_info.i = 0;
    net_recv_info.buf = nullptr;
    net_recv_info.buf_pos = 0;
    net_recv_info.reads = 0;

    if (strlen(path) > sizeof(addr.sun_path) - 1) {
        perror("net_init: path too long");
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
            perror("net_init: bind"); return;
        }
        if (listen(net_fd, 1) < 0) {
            perror("net_init: listen"); return;
        }
        printf("net: waiting for client on %s\n", path);
        net_fd_conn = accept(net_fd, NULL, NULL);
        printf("net: client connected\n");
    } else {
        net_fd = socket(AF_UNIX, SOCK_STREAM, 0);
        if (net_fd < 0) { perror("net_init: socket"); return; }
        printf("net: connecting to server on %s\n", path);
        if (connect(net_fd, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
            perror("net_init: connect"); return;
        }
        printf("net: connected\n");
        net_fd_conn = net_fd;
    }

    flags = fcntl(net_fd_conn, F_GETFL, 0);
    fcntl(net_fd_conn, F_SETFL, flags | O_NONBLOCK);
}

static inline void net_send(uint8_t *data, uint32_t len)
{
    if (net_fd_conn == -1) return;

    // Write 4-byte little-endian length header
    for (uint32_t i = 0; i < 4; i++) {
        uint8_t b = (len >> (i * 8)) & 0xFF;
        if (write(net_fd_conn, &b, 1) < 0) {
            fprintf(stderr, "net_send: write error: %s\n", strerror(errno));
            return;
        }
    }
    if (write(net_fd_conn, data, len) != (ssize_t)len) {
        fprintf(stderr, "net_send: write error (data): %s\n", strerror(errno));
    }
}

static inline bool net_recv(uint8_t **data_out, uint32_t *len_out)
{
    if (net_fd_conn == -1) return false;

    if (!net_recv_info.valid) {
        for (; net_recv_info.i < 4; net_recv_info.i++) {
            uint8_t b;
            int n = read(net_fd_conn, &b, 1);
            if (n <= 0) {
                if (n == 0 && net_recv_info.i == 0) return false;
                if (n != 0 && errno != EAGAIN) {
                    fprintf(stderr, "net_recv: read error: %s\n", strerror(errno));
                }
                return false;
            }
            net_recv_info.len.buf[net_recv_info.i] = b;
        }
        net_recv_info.i = 0;
        net_recv_info.buf = (uint8_t *)malloc(net_recv_info.len.i32);
        if (!net_recv_info.buf) { fprintf(stderr, "net_recv: malloc\n"); return false; }
        net_recv_info.valid = true;
    }

    int n = read(net_fd_conn, net_recv_info.buf + net_recv_info.buf_pos,
                 net_recv_info.len.i32 - net_recv_info.buf_pos);
    if (n < 0) {
        if (errno != EAGAIN) fprintf(stderr, "net_recv: read data: %s\n", strerror(errno));
        return false;
    }
    net_recv_info.reads++;
    net_recv_info.buf_pos += n;

    if (net_recv_info.buf_pos == (uint32_t)net_recv_info.len.i32) {
        *data_out = net_recv_info.buf;
        *len_out  = (uint32_t)net_recv_info.len.i32;
        net_recv_info.reads = 0;
        net_recv_info.buf_pos = 0;
        net_recv_info.len.i32 = 0;
        net_recv_info.valid = false;
        net_recv_info.buf = nullptr;
        return true;
    }
    return false;
}

#endif // NET_H
