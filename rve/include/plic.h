// Minimal SiFive-compatible PLIC: 31 level-triggered sources, 2 contexts (0 = M-mode, 1 = S-mode).
// Only what the Linux riscv,plic0 driver needs: priority, pending, enable, threshold, claim/complete.
#pragma once
#include <cstdint>

#define PLIC_BASE 0x0c000000u
#define PLIC_SIZE 0x00400000u
#define PLIC_NUM_SRC 32
#define PLIC_NUM_CTX 2

class Plic
{
public:
    Plic() { reset(); }
    void reset();
    // Drive the (level) interrupt line of source `src` (1..31).
    void setLevel(int src, bool level);
    // True if `ctx` has a deliverable interrupt (pending & enabled & priority > threshold).
    bool ctxActive(int ctx) const;
    uint32_t read(uint32_t off);
    void write(uint32_t off, uint32_t val);

private:
    int best(int ctx) const;
    uint32_t priority_[PLIC_NUM_SRC];
    uint32_t level_, claimed_;
    uint32_t enable_[PLIC_NUM_CTX];
    uint32_t threshold_[PLIC_NUM_CTX];
};
