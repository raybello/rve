// Selects the virtio-net backend for a CPU: the in-emulator userspace stack, with either the
// browser host (fetch/DoH, emscripten builds) or the deterministic FakeHost (tests, -F flag).
#pragma once
#include "rv32.h"

// Attach UserNetBackend to `cpu`. `fake` forces FakeHost; without it emscripten builds use the
// browser host and native builds do nothing (the device stays connected to the null backend).
void net_attach_usernet(RV32 &cpu, bool fake);
