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
#include <chrono>
#include <vector>

#ifdef RVE_PROFILE
#include "virtio_net.h"

// Instruction classes (what the guest executed, one bucket per instruction)
enum ProfInsClass : uint8_t
{
    PIC_ALU = 0,     // integer OP / OP-IMM (incl. the W variants)
    PIC_MUL,         // M-extension mul*
    PIC_DIV,         // M-extension div*/rem*
    PIC_LOAD,        // integer and FP loads
    PIC_STORE,       // integer and FP stores
    PIC_BRANCH,      // conditional branches (branch_taken counts the taken subset)
    PIC_JAL,
    PIC_JALR,
    PIC_UPPER,       // lui / auipc
    PIC_CSR,         // csrr*
    PIC_ATOMIC,      // lr / sc / amo*
    PIC_FP,          // F/D arithmetic, converts, moves
    PIC_SYSTEM,      // ecall / ebreak / xret / wfi / sfence.vma
    PIC_FENCE,       // fence / fence.i
    PIC_OTHER,
    PIC_COUNT
};

// MMIO windows (device breakdown of non-RAM accesses)
enum ProfRegion : uint8_t
{
    PREG_UART = 0,
    PREG_CLINT,
    PREG_PLIC,
    PREG_VIRTIO,
    PREG_NETBUF,     // legacy network DMA buffers
    PREG_KBD,
    PREG_RTC,
    PREG_SYSCON,
    PREG_DTB_MTD,    // device tree / flash reads
    PREG_UNMAPPED,
    PREG_COUNT
};

// opcode(7) | funct3(3) << 7 | bit25 << 10 -> class, so classifying is one shift/mask and a load
struct ProfOpTable
{
    uint8_t v[2048];
    constexpr ProfOpTable() : v{}
    {
        for (int i = 0; i < 2048; i++)
        {
            int op = i & 0x7f, f3 = (i >> 7) & 7, b25 = (i >> 10) & 1;
            uint8_t c = PIC_OTHER;
            switch (op)
            {
            case 0x13: case 0x1b: c = PIC_ALU; break;
            case 0x33: case 0x3b: c = b25 ? (f3 < 4 ? PIC_MUL : PIC_DIV) : PIC_ALU; break; // funct7 == 1 is M
            case 0x03: case 0x07: c = PIC_LOAD; break;
            case 0x23: case 0x27: c = PIC_STORE; break;
            case 0x63: c = PIC_BRANCH; break;
            case 0x6f: c = PIC_JAL; break;
            case 0x67: c = PIC_JALR; break;
            case 0x37: case 0x17: c = PIC_UPPER; break;
            case 0x73: c = f3 ? PIC_CSR : PIC_SYSTEM; break;
            case 0x2f: c = PIC_ATOMIC; break;
            case 0x53: case 0x43: case 0x47: case 0x4b: case 0x4f: c = PIC_FP; break;
            case 0x0f: c = PIC_FENCE; break;
            }
            v[i] = c;
        }
    }
};
inline constexpr ProfOpTable prof_op_table{};

inline unsigned prof_classify(uint32_t ins)
{
    return prof_op_table.v[(ins & 0x7f) | ((ins >> 5) & 0x380) | ((ins >> 15) & 0x400)];
}

struct ProfCounters
{
    // Instruction stream. Invariant: sum(insns) + fetch_faults == cpu.clock
    // (instructions fetched == sum(insns): every fetched word is classified exactly once)
    uint64_t insns[PIC_COUNT] = {};
    uint64_t branch_taken = 0;
    uint64_t fetch_faults = 0;      // emulate() calls that never got an instruction (misaligned pc / fetch page fault)

    // Guest data traffic (instruction fetch and PTE reads are counted separately),
    // one count per access: [width: 1,2,4,8 bytes][0=read 1=write]
    uint64_t mem[4][2] = {};
    // Non-RAM subset of the above, by device: [0=read 1=write][region]
    uint64_t mmio[2][PREG_COUNT] = {};

    // MMU (only active when translation is on and the hart is not in M-mode)
    uint64_t mmu_walks[3] = {};     // page-table walks by access type (fetch / read / write)
    uint64_t mmu_faults[3] = {};    // page faults by access type
    uint64_t ptw_reads = 0;         // PTE loads issued by the walker

    // Traps taken, indexed by cause code (0..15)
    uint64_t traps[16] = {};
    uint64_t irqs[16] = {};

    // Atomics
    uint64_t sc_ok = 0, sc_fail = 0;

    // Devices
    uint64_t uart_tx_bytes = 0, uart_rx_bytes = 0;
    uint64_t stdin_polls = 0;       // FIONREAD polls of the host terminal
    uint64_t vnet_ticks = 0;        // virtio RX servicing passes
};

// Every counter is a uint64_t, so snapshots can be diffed element-wise
static_assert(sizeof(ProfCounters) % sizeof(uint64_t) == 0, "ProfCounters must be plain uint64_t fields");

inline uint64_t prof_now_ns()
{
    return (uint64_t)std::chrono::duration_cast<std::chrono::nanoseconds>(
               std::chrono::steady_clock::now().time_since_epoch()).count();
}

const char *prof_class_name(int cls);
const char *prof_region_name(int region);
const char *prof_exception_name(int cause);
const char *prof_interrupt_name(int cause);

// Fixed-size ring of (x, y) samples laid out the way ImPlot's `offset` parameter wants them
struct ProfSeries
{
    std::vector<float> x, y;
    int cap = 0, count = 0, next = 0;
    void init(int capacity);
    void clear() { count = 0; next = 0; }
    void push(float xv, float yv);
    int offset() const { return count < cap ? 0 : next; }
    float last() const { return count ? y[(next + cap - 1) % cap] : 0.0f; }
    float maxValue() const;
};

// GUI-side view of the counters: snapshots them a few times a second, turns deltas into rates and
// keeps the history the charts draw. Lives entirely on the UI thread (the emulator is single-threaded).
class Profiler
{
public:
    Profiler();

    // Call once per rendered frame; samples at most every `interval_ms`.
    void update(const ProfCounters &c, const VirtioNet::Stats &vs, bool running);
    // Wall time of one UI frame and how much of it was spent emulating
    void frameDone(double frame_ms, double emu_ms);
    // Zero the displayed totals and history (the emulator's own counters keep running)
    void reset();

    // Draw the tabbed window body (profiler_ui.cpp)
    void draw();

    // ---- state read by the UI ----
    bool paused = false;
    int interval_ms = 100;       // sampling period
    int history_s = 30;          // visible x-range

    ProfCounters cur{}, base{};  // latest snapshot / snapshot at the last reset
    VirtioNet::Stats vcur{}, vbase{};
    ProfCounters tot() const;    // cur - base
    uint64_t totalInsns() const; // executed instructions since reset
    double mips_now = 0, mips_avg = 0;
    bool running = false;
    double t_now = 0;            // seconds since the profiler started (x axis)

    ProfSeries mips, frame_ms, emu_ms, ui_ms;
    ProfSeries cls_rate[PIC_COUNT];                 // instructions/s by class
    ProfSeries rd_rate, wr_rate, mmio_rate;         // guest data accesses/s
    ProfSeries walk_rate, ptw_rate, fault_rate;     // MMU
    ProfSeries trap_rate, irq_rate;
    ProfSeries uart_tx_rate, uart_rx_rate;
    ProfSeries vnet_tx_rate, vnet_rx_rate;

private:
    void pushSample(double dt, const ProfCounters &d, const VirtioNet::Stats &dv, uint64_t dinsns);
    void clearHistory();
    uint64_t t_start_ns = 0, t_last_ns = 0;
    ProfCounters prev{};
    VirtioNet::Stats vprev{};
    double frame_sum = 0, emu_sum = 0;
    int frame_n = 0;
    double run_secs = 0;         // wall time in which the guest actually retired instructions
};

// Scope guard for UI/debugger code that calls into the CPU (memGetWord, mmuTranslate, ...): whatever
// those calls count is rolled back on scope exit, so looking at the machine never changes the numbers.
struct ProfQuiet
{
    ProfCounters &p;
    ProfCounters saved;
    explicit ProfQuiet(ProfCounters &pc) : p(pc), saved(pc) {}
    ~ProfQuiet() { p = saved; }
};
#define PROF_QUIET(obj)      ProfQuiet prof_quiet_scope_((obj).prof)

#define PROF_INC(field)      (++(field))
#define PROF_ADD(field, n)   ((field) += (n))

#else

#define PROF_INC(field)      ((void)0)
#define PROF_ADD(field, n)   ((void)0)
#define PROF_QUIET(obj)      ((void)0)

#endif // RVE_PROFILE

#endif // PROFILER_H
