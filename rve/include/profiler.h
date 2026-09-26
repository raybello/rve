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
