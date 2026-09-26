#ifndef PROFILER_H
#define PROFILER_H

// Emulator profiling.
//
// Compile-time switch: RVE_PROFILE (on by default for native builds, `make PROFILE=0` to
// drop it). With the flag off every PROF_* hook below expands to nothing and RV32 carries no
// profiling state, so the hot path is byte-for-byte what it was before profiling existed.
//
// Two layers:
//   * ProfCounters  - plain integers bumped from the emulator hot path (single-threaded, no atomics)
//   * Profiler      - GUI-side: snapshots the counters, turns deltas into rates and history
//                     (profiler.cpp) and draws them with ImPlot (profiler_ui.cpp)

#include <cstdint>

#ifdef RVE_PROFILE

// What the CPU is doing on behalf of a memory access. Accesses are bucketed by this so the
// debugger/UI reading guest memory (ctx == NONE) never pollutes the emulated-traffic numbers.
enum ProfCtx : uint8_t
{
    PCTX_NONE = 0, // debugger / UI / device DMA: counted into a scratch bucket
    PCTX_FETCH,    // instruction fetch
    PCTX_DATA,     // load/store/AMO executed by the guest
    PCTX_PTW,      // page-table walker reading PTEs
    PCTX_COUNT
};

struct ProfCounters
{
    uint8_t ctx = PCTX_NONE;
};

#define PROF_INC(field)      (++(field))
#define PROF_ADD(field, n)   ((field) += (n))

#else

#define PROF_INC(field)      ((void)0)
#define PROF_ADD(field, n)   ((void)0)

#endif // RVE_PROFILE

#endif // PROFILER_H
