// Selects the virtio-net backend for a CPU: the in-emulator userspace stack, with either the
// browser host (fetch/DoH, emscripten builds) or the deterministic FakeHost (tests, -F flag).
#pragma once
#include "rv32.h"

// Attach UserNetBackend to `cpu`.
//   fake=true : deterministic FakeHost (tests, -F)
//   fake=false: emscripten builds use the browser host (fetch/DoH); native builds use NativeHost
//               (real sockets: full TCP, DNS, ping) unless `enable` is false (--no-net), in which
//               case the NIC stays connected to nothing.
void net_attach_usernet(RV32 &cpu, bool fake, bool enable = true);
