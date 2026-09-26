#include "plic.h"

void Plic::reset()
{
    for (int i = 0; i < PLIC_NUM_SRC; i++) priority_[i] = 0;
    level_ = claimed_ = 0;
    for (int c = 0; c < PLIC_NUM_CTX; c++) enable_[c] = threshold_[c] = 0;
}

void Plic::setLevel(int src, bool level)
{
    if (src < 1 || src >= PLIC_NUM_SRC) return;
    if (level) level_ |= 1u << src;
    else       level_ &= ~(1u << src);
}

// Highest-priority source that is pending, enabled and above the threshold (0 if none).
int Plic::best(int ctx) const
{
    uint32_t pend = level_ & ~claimed_ & enable_[ctx];
    int bestSrc = 0;
    uint32_t bestPrio = threshold_[ctx];
    for (int s = 1; s < PLIC_NUM_SRC; s++)
        if ((pend >> s & 1) && priority_[s] > bestPrio) { bestPrio = priority_[s]; bestSrc = s; }
    return bestSrc;
}

bool Plic::ctxActive(int ctx) const { return best(ctx) != 0; }

uint32_t Plic::read(uint32_t off)
{
    if (off < 0x1000) { uint32_t s = off / 4; return s < PLIC_NUM_SRC ? priority_[s] : 0; }
    if (off == 0x1000) return level_ & ~claimed_; // pending
    if (off >= 0x2000 && off < 0x2000 + 0x80 * PLIC_NUM_CTX)
    {
        uint32_t c = (off - 0x2000) / 0x80;
        return (off - 0x2000) % 0x80 == 0 ? enable_[c] : 0;
    }
    if (off >= 0x200000)
    {
        uint32_t c = (off - 0x200000) / 0x1000, r = (off - 0x200000) % 0x1000;
        if (c >= PLIC_NUM_CTX) return 0;
        if (r == 0) return threshold_[c];
        if (r == 4) { int s = best(c); if (s) claimed_ |= 1u << s; return s; } // claim
    }
    return 0;
}

void Plic::write(uint32_t off, uint32_t val)
{
    if (off < 0x1000) { uint32_t s = off / 4; if (s >= 1 && s < PLIC_NUM_SRC) priority_[s] = val & 7; return; }
    if (off >= 0x2000 && off < 0x2000 + 0x80 * PLIC_NUM_CTX)
    {
        uint32_t c = (off - 0x2000) / 0x80;
        if ((off - 0x2000) % 0x80 == 0) enable_[c] = val & ~1u; // source 0 doesn't exist
        return;
    }
    if (off >= 0x200000)
    {
        uint32_t c = (off - 0x200000) / 0x1000, r = (off - 0x200000) % 0x1000;
        if (c >= PLIC_NUM_CTX) return;
        if (r == 0) threshold_[c] = val & 7;
        else if (r == 4 && val > 0 && val < PLIC_NUM_SRC) claimed_ &= ~(1u << val); // complete
    }
}
