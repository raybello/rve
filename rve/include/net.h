#pragma once
// Unix-socket network device for rve.
// Implements a simple framing protocol: 4-byte little-endian length header
// followed by payload bytes. Compatible with the rvc-networking guest driver.
//
// net_fd_conn == -1 means no active connection; all operations are no-ops.

#include <stdbool.h>
#include <stdint.h>

// Connection file descriptors (defined in net.cpp)
extern int net_fd;
extern int net_fd_conn;

// Initialise the Unix-domain socket.
// path   : filesystem path for the socket file
// server : true → bind/listen/accept, false → connect
void net_init(const char *path, bool server);

// Send a packet. Writes a 4-byte LE length header then the payload.
void net_send(uint8_t *data, uint32_t len);

// Non-blocking receive. Returns true and sets *data_out/*len_out when a
// complete packet is available. Caller must free(*data_out).
bool net_recv(uint8_t **data_out, uint32_t *len_out);

// Returns true when the local side is the server (player 0).
bool net_is_server();
