#pragma once
// Unix-socket network device for rve.
// Implements a simple framing protocol: 4-byte little-endian length header
// followed by payload bytes. Compatible with the rve-networking guest driver.
//
// net_fd_conn == -1 means no active connection; all operations are no-ops.

#include <stdbool.h>
#include <stdint.h>

extern int net_fd;
extern int net_fd_conn;

void net_init(const char *path, bool server);
void net_send(uint8_t *data, uint32_t len);
bool net_recv(uint8_t **data_out, uint32_t *len_out);
bool net_is_server();
