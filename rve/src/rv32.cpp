#include "rv32.h"
#include "net.h"
#include <sys/ioctl.h>
#include <unistd.h>
#include <stdlib.h>

// Selected backend (not owned). Global so it survives Emulator::initialize()'s `cpu = RV32()`.
static NetBackend *g_net_backend = nullptr;



RV32::RV32(/* args */)
{
}

RV32::~RV32()
{
}

bool RV32::init(u8 *memory, u8 *dtb, bool debug_mode, u8 *mtd, u32 mtd_size)
{
    // reset clock
    clock = 0;
    for (u32 i = 0; i < 32; i++)
    {
        xreg[i] = 0;
        freg[i] = 0xFFFFFFFF00000000ULL | 0x7FC00000ULL; // NaN-boxed canonical qNaN
    }
    xreg[0xb] = 0x1020; // For Linux / device tree pointer
    pc = 0x80000000;
    mem = memory;
    reservation_en = false;
    reservation_addr = 0;
    kbd_head = kbd_tail = 0;

    initCSRs();

    debug_single_step = debug_mode;

    this->dtb = dtb;
    this->mtd = mtd;
    this->mtd_size = mtd_size;

    clint.msip = false;
    clint.mtimecmp_lo = 0;
    clint.mtimecmp_hi = 0;
    clint.mtime_lo = 0;
    clint.mtime_hi = 0;

    uart.rbr_thr_ier_iir = 0;
    uart.lcr_mcr_lsr_scr = 0x00600000; // LSR THRE|TEMT both set (0x60 at shift 16)
    uart.thre_ip = false;
    uart.thr_pending = false;
    uart.interrupting = false;

    mmu.mode = MMU_MODE_OFF;
    mmu.ppn  = 0;
    tlbFlush();

    net.rx_ready = 0;
    net.nettx = (u8 *)malloc(4096);
    net.netrx = (u8 *)malloc(4096);

    plic.reset();
    vnet.reset();
    plic_seip = false;
    setNetBackend(g_net_backend);

    rtc0 = 0;
    rtc1 = 0;
    syscon_cmd = 0;

    // Record wall-clock start time for CLINT mtime
    struct timeval tv;
    gettimeofday(&tv, NULL);
    start_time_sec  = (int64_t)tv.tv_sec;
    start_time_usec = (int32_t)tv.tv_usec;

    return true;
}

void RV32::initCSRs()
{
    csr.privilege = PRIV_MACHINE;
    for (u32 i = 0; i < 4096; i++)
    {
        csr.data[i] = 0;
    }
    // A(0) D(3) F(5) I(8) M(12) S(18) U(20); MXL in the top two bits
    csr.data[CSR_MISA] = ((xlen_t)MISA_MXL << (XLEN - 2)) | 0x00141129u;
}

void RV32::dump()
{
    printf("======================================\n");
    printf("DUMP: CPU state @%llu:\n", (unsigned long long)clock);
    for (int i = 0; i < 32; i += 4)
    {
        printf("DUMP: .x%02d = " XREG_FMT "  .x%02d = " XREG_FMT "  .%02d = " XREG_FMT "  .%02d = " XREG_FMT "\n",
               i, (XREG_CAST)xreg[i],
               i + 1, (XREG_CAST)xreg[i + 1],
               i + 2, (XREG_CAST)xreg[i + 2],
               i + 3, (XREG_CAST)xreg[i + 3]);
    }
    printf("DUMP: .pc  = " XREG_FMT "\n", (XREG_CAST)pc);
    printf("DUMP: next ins: %08x\n", memGetWord(pc));
}

void RV32::tick()
{
    clock++;
    // emulate(cpu);
}

ins_ret RV32::insReturnNoop()
{
    ins_ret ret;
    memset(&ret, 0, sizeof(ins_ret));
    ret.pc_val = pc + 4;
    return ret;
}

///////////////////////////////////////
// CSR Functions
///////////////////////////////////////
bool RV32::hasCsrAccessPrivilege(u32 addr)
{
    u32 privilege = (addr >> 8) & 0x3;
    return privilege <= csr.privilege;
}

// SSTATUS, SIE, and SIP are subsets of MSTATUS, MIE, and MIP
xlen_t RV32::readCsrRaw(u32 address)
{
    switch (address)
    {
    case CSR_FFLAGS:
        return csr.data[CSR_FCSR] & 0x1Fu;
    case CSR_FRM:
        return (csr.data[CSR_FCSR] >> 5) & 0x7u;
    case CSR_FCSR:
        return csr.data[CSR_FCSR] & 0xFFu;
    case CSR_MSTATUS:
        return csr.data[CSR_MSTATUS] | MSTATUS_XL_FIXED |
               (((csr.data[CSR_MSTATUS] >> 13) & 3) == 3 ? MSTATUS_SD_BIT : 0);
    case CSR_SSTATUS:
        return (csr.data[CSR_MSTATUS] & 0x000de162u) | SSTATUS_XL_FIXED |
               (((csr.data[CSR_MSTATUS] >> 13) & 3) == 3 ? MSTATUS_SD_BIT : 0);
    case CSR_SIE:
        return csr.data[CSR_MIE] & 0x222u;
    case CSR_SIP:
        return csr.data[CSR_MIP] & 0x222u;
    case CSR_MCYCLE:
    case CSR_CYCLE:
    case 0xb02: // minstret
    case 0xc02: // instret
        return (xlen_t)clock;
    case CSR_TIME:
#if XLEN == 64
        return (u64)clint.mtime_lo | ((u64)clint.mtime_hi << 32);
#else
        return clint.mtime_lo;
#endif
    case CSR_MHARTID:
        return 0;
    case CSR_SATP:
#if XLEN == 64
        return mmu.mode ? (((u64)8 << 60) | mmu.ppn) : 0;
#else
        return ((xlen_t)mmu.mode << 31) | (xlen_t)mmu.ppn;
#endif
    case CSR_NET_TX_BUF_ADDR:
        return 0x11000000u;
    case CSR_NET_RX_BUF_ADDR:
        return 0x11001000u;
    case CSR_PLAYER_ID:
        return net_is_server() ? 0u : 1u;
    case CSR_RNG:
        return (u32)rand();
    default:
        return csr.data[address & 0xffff];
    }
}

void RV32::writeCsrRaw(u32 address, xlen_t value)
{
    switch (address)
    {
    case CSR_FFLAGS:
        csr.data[CSR_FCSR] = (csr.data[CSR_FCSR] & ~0x1Fu) | (value & 0x1Fu);
        fpStateDirty();
        break;
    case CSR_FRM:
        csr.data[CSR_FCSR] = (csr.data[CSR_FCSR] & ~0xE0u) | ((value & 0x7u) << 5);
        fpStateDirty();
        break;
    case CSR_FCSR:
        csr.data[CSR_FCSR] = value & 0xFFu;
        fpStateDirty();
        break;
    case CSR_MSTATUS:
        csr.data[CSR_MSTATUS] = value & ~(xlen_t)(MSTATUS_XL_FIXED | MSTATUS_SD_BIT);
        break;
    case CSR_SSTATUS:
        csr.data[CSR_MSTATUS] &= ~(xlen_t)0x000de162u;  // was !0x000de162 (bug: logical NOT → 0)
        csr.data[CSR_MSTATUS] |= value & 0x000de162u;
        break;
    case CSR_SIE:
        csr.data[CSR_MIE] &= ~0x222u;
        csr.data[CSR_MIE] |= value & 0x222u;
        break;
    case CSR_SIP:
        csr.data[CSR_MIP] &= ~0x222u;
        csr.data[CSR_MIP] |= value & 0x222u;
        net_dirty = true; // the guest may have cleared SEIP, which netTick() re-asserts
        break;
    case CSR_MIDELEG:
        csr.data[address] = value & 0x666u; // from qemu
        break;
    case CSR_TIME:
        // ignore writes to time counter
        break;
    case CSR_NET_TX_BUF_SIZE_AND_SEND:
        net_send(net.nettx, value);
        break;
    case CSR_NET_RX_BUF_READY:
        net.rx_ready = value;
        break;
    case CSR_MIP:
        csr.data[address] = value;
        net_dirty = true;
        break;
    default:
        csr.data[address] = value;
        break;
    };
}

// mstatus.FS -> Dirty (3) if the FPU is enabled. Supervisors context-switch FP state based on
// this, so it must be set whenever FP registers or fcsr are modified.
void RV32::fpStateDirty()
{
#if XLEN == 64
    if ((csr.data[CSR_MSTATUS] >> 13) & 3)
        csr.data[CSR_MSTATUS] |= (xlen_t)3 << 13;
#endif
}

// The set of CSRs rve implements on RV64. Anything else raises illegal-instruction, which is
// how OpenSBI/Linux detect optional extensions (Sstc menvcfg/stimecmp, hpm counters, ...).
bool RV32::csrImplemented(u32 a)
{
    switch (a)
    {
    case CSR_FFLAGS: case CSR_FRM: case CSR_FCSR:
    case CSR_CYCLE: case CSR_TIME: case 0xc02:
    case CSR_SSTATUS: case CSR_SIE: case CSR_STVEC: case 0x106 /*scounteren*/:
    case 0x140 /*sscratch*/: case CSR_SEPC: case CSR_SCAUSE: case CSR_STVAL: case CSR_SIP: case CSR_SATP:
    case CSR_MSTATUS: case CSR_MISA: case CSR_MEDELEG: case CSR_MIDELEG: case CSR_MIE: case CSR_MTVEC:
    case 0x306 /*mcounteren*/: case 0x340 /*mscratch*/: case CSR_MEPC: case CSR_MCAUSE: case CSR_MTVAL: case CSR_MIP:
    case CSR_MCYCLE: case 0xb02 /*minstret*/:
    case 0xf11: case 0xf12: case 0xf13: case CSR_MHARTID:
    // rve custom CSRs
    case CSR_MEMOP_OP: case CSR_MEMOP_SRC: case CSR_MEMOP_DST: case CSR_MEMOP_N:
    case CSR_PLAYER_ID: case CSR_RNG:
    case CSR_NET_TX_BUF_ADDR: case CSR_NET_TX_BUF_SIZE_AND_SEND: case CSR_NET_RX_BUF_ADDR: case CSR_NET_RX_BUF_READY:
        return true;
    }
    // PMP: pmpcfg0/2/.../14 (RV64 uses even registers only) and pmpaddr0..15. rve does not
    // enforce PMP, the registers just hold what firmware writes.
    if (a >= 0x3a0 && a <= 0x3ae && !(a & 1)) return true;
    if (a >= 0x3b0 && a <= 0x3bf) return true;
    return false;
}

xlen_t RV32::getCsr(u32 address, ins_ret *ret)
{
    if (hasCsrAccessPrivilege(address))
    {
        xlen_t r = readCsrRaw(address);
#ifdef VERBOSE
        printf("CSR read @%03x = %llx\n", address, (unsigned long long)r);
#endif
        return r;
    }
    else
    {
        ret->trap.en = true;
        ret->trap.type = trap_IllegalInstruction;
        ret->trap.value = pc;
        return 0;
    }
}

void RV32::setCsr(u32 address, xlen_t value, ins_ret *ret)
{
#ifdef VERBOSE
    printf("CSR write @%03x = %llx\n", address, (unsigned long long)value);
#endif
    if (hasCsrAccessPrivilege(address))
    {
        bool read_only = ((address >> 10) & 0x3) == 0x3;
        if (read_only)
        {
            ret->trap.en = true;
            ret->trap.type = trap_IllegalInstruction;
            ret->trap.value = pc;
        }
        else
        {
            if (address == CSR_SATP)
            {
                mmuUpdate(value);
                return;
            }
            writeCsrRaw(address, value);
        }
    }
    else
    {
        ret->trap.en = true;
        ret->trap.type = trap_IllegalInstruction;
        ret->trap.value = pc;
    }
}

///////////////////////////////////////
// TRAPS
///////////////////////////////////////
// returns true if IRQ was handled or !isInterrupt
bool RV32::handleTrap(ins_ret *ret, bool isInterrupt)
{
    Trap t = ret->trap;
    u32 current_privilege = csr.privilege;

    u32 mdeleg = readCsrRaw(isInterrupt ? CSR_MIDELEG : CSR_MEDELEG);
    u32 sdeleg = readCsrRaw(isInterrupt ? CSR_SIDELEG : CSR_SEDELEG);
    u32 pos = t.type & 0xFFFF;

    u32 new_privilege = ((mdeleg >> pos) & 1) == 0 ? PRIV_MACHINE : (((sdeleg >> pos) & 1) == 0 ? PRIV_SUPERVISOR : PRIV_USER);
    // Exceptions are never delegated to a less-privileged mode than the one they occur in
    // (e.g. an ebreak in M-mode stays in M-mode even if medeleg delegates breakpoints).
    if (!isInterrupt && new_privilege < current_privilege)
        new_privilege = current_privilege;

    xlen_t mstatus = readCsrRaw(CSR_MSTATUS);
    xlen_t sstatus = readCsrRaw(CSR_SSTATUS);
    xlen_t current_status = current_privilege == PRIV_MACHINE ? mstatus : (current_privilege == PRIV_SUPERVISOR ? sstatus : readCsrRaw(CSR_USTATUS));

    // check if IRQ should be ignored
    if (isInterrupt)
    {
        xlen_t ie = new_privilege == PRIV_MACHINE ? readCsrRaw(CSR_MIE) : (new_privilege == PRIV_SUPERVISOR ? readCsrRaw(CSR_SIE) : readCsrRaw(CSR_UIE));

        u32 current_mie = (current_status >> 3) & 1;
        u32 current_sie = (current_status >> 1) & 1;
        u32 current_uie = current_status & 1;

        u32 msie = (ie >> 3) & 1;
        u32 ssie = (ie >> 1) & 1;
        u32 usie = ie & 1;

        u32 mtie = (ie >> 7) & 1;
        u32 stie = (ie >> 5) & 1;
        u32 utie = (ie >> 4) & 1;

        u32 meie = (ie >> 11) & 1;
        u32 seie = (ie >> 9) & 1;
        u32 ueie = (ie >> 8) & 1;

        if (new_privilege < current_privilege)
        {
            return false;
        }
        else if (new_privilege == current_privilege)
        {
            if (current_privilege == PRIV_MACHINE && current_mie == 0)
            {
                return false;
            }
            else if (current_privilege == PRIV_SUPERVISOR && current_sie == 0)
            {
                return false;
            }
            else if (current_privilege == PRIV_USER && current_uie == 0)
            {
                return false;
            }
        }

    #define MASK(trap, val)   \
        case trap:            \
        if (val == 0)     \
        {                 \
            return false; \
        }                 \
        else              \
        {                 \
            break;        \
        }

        switch (t.type)
        {
            MASK(trap_UserSoftwareInterrupt, usie)
            MASK(trap_SupervisorSoftwareInterrupt, ssie)
            MASK(trap_MachineSoftwareInterrupt, msie)
            MASK(trap_UserTimerInterrupt, utie)
            MASK(trap_SupervisorTimerInterrupt, stie)
            MASK(trap_MachineTimerInterrupt, mtie)
            MASK(trap_UserExternalInterrupt, ueie)
            MASK(trap_SupervisorExternalInterrupt, seie)
            MASK(trap_MachineExternalInterrupt, meie)
        }
#undef MASK
    }

    // should be handled
    csr.privilege = new_privilege;

    u32 csr_epc_addr = new_privilege == PRIV_MACHINE ? CSR_MEPC : (new_privilege == PRIV_SUPERVISOR ? CSR_SEPC : CSR_UEPC);
    u32 csr_cause_addr = new_privilege == PRIV_MACHINE ? CSR_MCAUSE : (new_privilege == PRIV_SUPERVISOR ? CSR_SCAUSE : CSR_UCAUSE);
    u32 csr_tval_addr = new_privilege == PRIV_MACHINE ? CSR_MTVAL : (new_privilege == PRIV_SUPERVISOR ? CSR_STVAL : CSR_UTVAL);
    u32 csr_tvec_addr = new_privilege == PRIV_MACHINE ? CSR_MTVEC : (new_privilege == PRIV_SUPERVISOR ? CSR_STVEC : CSR_UTVEC);

    // For interrupts, EPC is the PC of the *next* instruction (already in pc_val)
    writeCsrRaw(csr_epc_addr, isInterrupt ? ret->pc_val : pc);
    // Interrupt bit lives in the MSB of xcause (bit 31 on RV32, bit 63 on RV64)
    writeCsrRaw(csr_cause_addr, (t.type & interrupt_offset) ? (((xlen_t)1 << (XLEN - 1)) | pos) : (xlen_t)t.type);
    writeCsrRaw(csr_tval_addr, t.value);
    ret->pc_val = readCsrRaw(csr_tvec_addr);

    if ((ret->pc_val & 0x3) != 0)
    {
        // vectored handler (interrupts only; synchronous traps use the base address)
        ret->pc_val = (ret->pc_val & ~(xlen_t)0x3) + (isInterrupt ? 4 * pos : 0);
    }

    // NOTE: No user mode interrupt/exception handling!
    if (new_privilege == PRIV_MACHINE)
    {
        xlen_t mie = (mstatus >> 3) & 1;
        xlen_t new_status = (mstatus & ~(xlen_t)0x1888u) | (mie << 7) | ((xlen_t)current_privilege << 11);
        writeCsrRaw(CSR_MSTATUS, new_status);
    }
    else
    { // PRIV_SUPERVISOR
        xlen_t sie = (sstatus >> 1) & 1;  // bit 1 = SIE (was incorrectly bit 3)
        xlen_t new_status = (sstatus & ~(xlen_t)0x122u) | (sie << 5) | ((xlen_t)(current_privilege & 1) << 8);
        writeCsrRaw(CSR_SSTATUS, new_status);
    }

#ifdef RV32_VERBOSE
    printf("trap: type=%08x value=%llx (IRQ: %d) moved PC from @%llx to @%llx\n", t.type, (unsigned long long)t.value, isInterrupt, (unsigned long long)pc, (unsigned long long)ret->pc_val);
#endif
    /* debug_single_step = true; */

    return true;
}

__attribute__((noinline)) void RV32::handleIrqAndTrap(ins_ret *ret)
{
    // Fast exit: no exception raised and no pending interrupt is enabled, so none of the
    // HANDLE() cases below can match (csr.data[] is what readCsrRaw() returns for MIP/MIE).
    if (!ret->trap.en && !(csr.data[CSR_MIP] & csr.data[CSR_MIE]))
        return;

    Trap t = ret->trap;
    u32 mip_reset = MIP_ALL;
    xlen_t cur_mip = readCsrRaw(CSR_MIP);
    bool irq = false;

    if (!t.en)
    {
        irq = true;
        xlen_t mirq = cur_mip & readCsrRaw(CSR_MIE);

        // if/else chain: handle highest-priority IRQ first
#define HANDLE(mip, ttype) \
        else if (mirq & (mip)) { mip_reset = (mip); t.en = true; t.type = (ttype); }

        if (false) {}
        HANDLE(MIP_MEIP, trap_MachineExternalInterrupt)
        HANDLE(MIP_MSIP, trap_MachineSoftwareInterrupt)
        HANDLE(MIP_MTIP, trap_MachineTimerInterrupt)
        HANDLE(MIP_SEIP, trap_SupervisorExternalInterrupt)
        HANDLE(MIP_SSIP, trap_SupervisorSoftwareInterrupt)
        HANDLE(MIP_STIP, trap_SupervisorTimerInterrupt)
        else { irq = false; }
#undef HANDLE
    }

    if (t.en)
    {
        ret->trap = t;
        PROF_INC(irq ? prof.irqs[t.type & 0xf] : prof.traps[t.type & 0xf]);
        bool handled = handleTrap(ret, irq);
        if (handled && irq)
        {
            // Timer IRQ (MTIP/STIP) is cleared by guest writing mtimecmp, not here
            if ((mip_reset & (MIP_MTIP | MIP_STIP)) == 0)
                writeCsrRaw(CSR_MIP, cur_mip & ~(xlen_t)mip_reset);
        }
    }
}

///////////////////////////////////////
// virtio-net + PLIC
///////////////////////////////////////
void RV32::setNetBackend(NetBackend *be)
{
    g_net_backend = be;
    GuestMem gm;
    gm.read = [this](uint64_t pa, void *dst, size_t n) {
        if (pa >= 0x80000000u && pa - 0x80000000u + n <= (uint64_t)RV32_MEM_SIZE)
            memcpy(dst, mem + (pa - 0x80000000u), n);
        else
            memset(dst, 0, n);
    };
    gm.write = [this](uint64_t pa, const void *src, size_t n) {
        if (pa >= 0x80000000u && pa - 0x80000000u + n <= (uint64_t)RV32_MEM_SIZE)
            memcpy(mem + (pa - 0x80000000u), src, n);
    };
    vnet.init(gm, be ? be : &null_backend);
}

__attribute__((noinline)) void RV32::netTick()
{
    if (!vnet.active()) return;
    net_dirty = false;
    if ((clock & 0x3FF) == 0) { PROF_INC(prof.vnet_ticks); vnet.tick(); } // poll the backend for received frames
    plic.setLevel(VIRTIO_NET_IRQ, vnet.irqLevel());
    bool active = plic.ctxActive(1);
    xlen_t mip = readCsrRaw(CSR_MIP);
    if (active && !(mip & MIP_SEIP))
    {
        writeCsrRaw(CSR_MIP, mip | MIP_SEIP);
        plic_seip = true;
    }
    else if (!active && plic_seip)
    {
        writeCsrRaw(CSR_MIP, mip & ~(xlen_t)MIP_SEIP);
        plic_seip = false;
    }
}

// Word-granular MMIO for the PLIC and the virtio-net window (claim reads have side effects,
// so these must not be composed from byte accesses).
static inline bool inVirtio(xlen_t a) { return a >= VIRTIO_NET_BASE && a < VIRTIO_NET_BASE + VIRTIO_NET_SIZE; }
static inline bool inPlic(xlen_t a) { return a >= PLIC_BASE && a < PLIC_BASE + PLIC_SIZE; }

// Guest RAM is little-endian. On a little-endian host a memcpy compiles to a single (unaligned) load/store;
// the byte-wise fallback keeps big-endian hosts correct.
#if defined(__BYTE_ORDER__) && defined(__ORDER_LITTLE_ENDIAN__) && __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
static inline u32 loadLE32(const u8 *p) { u32 v; memcpy(&v, p, 4); return v; }
static inline u32 loadLE16(const u8 *p) { u16 v; memcpy(&v, p, 2); return v; }
static inline void storeLE32(u8 *p, u32 v) { memcpy(p, &v, 4); }
static inline void storeLE16(u8 *p, u16 v) { memcpy(p, &v, 2); }
#else
static inline u32 loadLE32(const u8 *p) { return (u32)p[0] | ((u32)p[1] << 8) | ((u32)p[2] << 16) | ((u32)p[3] << 24); }
static inline u32 loadLE16(const u8 *p) { return (u32)p[0] | ((u32)p[1] << 8); }
static inline void storeLE32(u8 *p, u32 v) { p[0] = (u8)v; p[1] = (u8)(v >> 8); p[2] = (u8)(v >> 16); p[3] = (u8)(v >> 24); }
static inline void storeLE16(u8 *p, u16 v) { p[0] = (u8)v; p[1] = (u8)(v >> 8); }
#endif

#ifdef RVE_PROFILE
// Which MMIO window an address belongs to (profiling only; mirrors the dispatch below)
static inline u8 profRegion(xlen_t a)
{
    if (a >= 0x1020u && a <= 0x1fffu) return PREG_DTB_MTD;
    if (a >= 0x40000000u && a < 0x80000000u) return PREG_DTB_MTD;
    if (a >= 0x10000000u && a < 0x10001000u) return PREG_UART;
    if (a >= 0x10001000u && a < 0x10002000u) return PREG_KBD;
    if (inVirtio(a)) return PREG_VIRTIO;
    if (inPlic(a)) return PREG_PLIC;
    if (a >= RTC_MMIO_BASE && a < RTC_MMIO_BASE + RTC_MMIO_SIZE) return PREG_RTC;
    if ((a >= 0x02000000u && a < 0x02010000u) || (a >= 0x11000000u && a < 0x11000004u) ||
        (a >= 0x11004000u && a < 0x1100c000u)) return PREG_CLINT;
    if (a >= 0x11000004u && a < 0x11002000u) return PREG_NETBUF;
    if (a >= 0x11100000u && a < 0x11100004u) return PREG_SYSCON;
    return PREG_UNMAPPED;
}
// One count per guest access (UI/debugger reads are rolled back by PROF_QUIET)
#define PROF_MEM(width_idx, rw)  (++prof.mem[width_idx][rw])
#define PROF_MMIO(rw, addr)      (++prof.mmio[rw][profRegion(addr)])
#else
#define PROF_MEM(width_idx, rw)  ((void)0)
#define PROF_MMIO(rw, addr)      ((void)0)
#endif

///////////////////////////////////////
// Memory Functions
///////////////////////////////////////
// Public accessors count the access once and then use the *Raw/*Slow helpers, so composed
// accesses (a word read done as 4 byte reads on the MMIO path) are never double counted.

// little endian, zero extended
u32 RV32::memGetByte(xlen_t addr)
{
    PROF_MEM(0, 0);
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        return phys >= (xlen_t)RV32_MEM_SIZE ? 0 : mem[phys];
    }
    PROF_MMIO(0, addr);
    return memGetByteRaw(addr);
}

u32 RV32::memGetByteRaw(xlen_t addr)
{
    if (addr < 0x80000000u)
    {
        // ---- Low-address MMIO ----

        // Device Tree Blob at 0x1020–0x1fff
        if (dtb != nullptr && addr >= 0x1020u && addr <= 0x1fffu)
            return dtb[addr - 0x1020u];

        // MTD (initrd / flash) at 0x40000000
        if (mtd != nullptr && addr >= 0x40000000u && addr < (0x40000000u + mtd_size))
            return mtd[addr - 0x40000000u];

        // Network RX DMA buffer at 0x11001000–0x11001fff
        if (addr >= 0x11001000u && addr < 0x11002000u)
            return net.netrx[addr - 0x11001000u];

        // virtio-net config/regs: sub-word reads are extracted from the aligned word (no side effects)
        if (inVirtio(addr))
            return (vnet.read((addr - VIRTIO_NET_BASE) & ~3u) >> (8 * (addr & 3))) & 0xFF;

        // RTC at 0x03000000–0x030007ff
        if (addr >= RTC_MMIO_BASE && addr < (RTC_MMIO_BASE + RTC_MMIO_SIZE))
            return rtcRead(addr - RTC_MMIO_BASE);

        switch (addr)
        {
        // CLINT (SiFive 0x02000000 base — used by ELF tests)
        case 0x02000000u: return clint.msip ? 1 : 0;
        case 0x02000001u: return 0;
        case 0x02000002u: return 0;
        case 0x02000003u: return 0;

        case 0x02004000u: return (clint.mtimecmp_lo >>  0) & 0xFF;
        case 0x02004001u: return (clint.mtimecmp_lo >>  8) & 0xFF;
        case 0x02004002u: return (clint.mtimecmp_lo >> 16) & 0xFF;
        case 0x02004003u: return (clint.mtimecmp_lo >> 24) & 0xFF;
        case 0x02004004u: return (clint.mtimecmp_hi >>  0) & 0xFF;
        case 0x02004005u: return (clint.mtimecmp_hi >>  8) & 0xFF;
        case 0x02004006u: return (clint.mtimecmp_hi >> 16) & 0xFF;
        case 0x02004007u: return (clint.mtimecmp_hi >> 24) & 0xFF;

        case 0x0200bff8u: return (clint.mtime_lo >>  0) & 0xFF;
        case 0x0200bff9u: return (clint.mtime_lo >>  8) & 0xFF;
        case 0x0200bffau: return (clint.mtime_lo >> 16) & 0xFF;
        case 0x0200bffbu: return (clint.mtime_lo >> 24) & 0xFF;
        case 0x0200bffcu: return (clint.mtime_hi >>  0) & 0xFF;
        case 0x0200bffdu: return (clint.mtime_hi >>  8) & 0xFF;
        case 0x0200bffeu: return (clint.mtime_hi >> 16) & 0xFF;
        case 0x0200bfffu: return (clint.mtime_hi >> 24) & 0xFF;

        // CLINT ( 0x11000000 base — matches default DTB)
        case 0x11000000u: return clint.msip ? 1 : 0;
        case 0x11000001u: return 0;
        case 0x11000002u: return 0;
        case 0x11000003u: return 0;

        case 0x11004000u: return (clint.mtimecmp_lo >>  0) & 0xFF;
        case 0x11004001u: return (clint.mtimecmp_lo >>  8) & 0xFF;
        case 0x11004002u: return (clint.mtimecmp_lo >> 16) & 0xFF;
        case 0x11004003u: return (clint.mtimecmp_lo >> 24) & 0xFF;
        case 0x11004004u: return (clint.mtimecmp_hi >>  0) & 0xFF;
        case 0x11004005u: return (clint.mtimecmp_hi >>  8) & 0xFF;
        case 0x11004006u: return (clint.mtimecmp_hi >> 16) & 0xFF;
        case 0x11004007u: return (clint.mtimecmp_hi >> 24) & 0xFF;

        case 0x1100bff8u: return (clint.mtime_lo >>  0) & 0xFF;
        case 0x1100bff9u: return (clint.mtime_lo >>  8) & 0xFF;
        case 0x1100bffau: return (clint.mtime_lo >> 16) & 0xFF;
        case 0x1100bffbu: return (clint.mtime_lo >> 24) & 0xFF;
        case 0x1100bffcu: return (clint.mtime_hi >>  0) & 0xFF;
        case 0x1100bffdu: return (clint.mtime_hi >>  8) & 0xFF;
        case 0x1100bffeu: return (clint.mtime_hi >> 16) & 0xFF;
        case 0x1100bfffu: return (clint.mtime_hi >> 24) & 0xFF;

        // UART
        case 0x10000000u:
            if ((UART_GET2(LCR) >> 7) == 0)
            {
                u32 rbr = UART_GET1(RBR);
                UART_SET1(RBR, 0);
                UART_SET2(LSR, (UART_GET2(LSR) & ~LSR_DATA_AVAILABLE));
                uartUpdateIir();
                return rbr;
            }
            return 0;
        case 0x10000001u: return UART_GET2(LCR) >> 7 == 0 ? UART_GET1(IER) : 0;
        case 0x10000002u: return UART_GET1(IIR);
        case 0x10000003u: return UART_GET2(LCR);
        case 0x10000004u: return UART_GET2(MCR);
        case 0x10000005u: return UART_GET2(LSR);
        case 0x10000007u: return UART_GET2(SCR);

        // MMIO keyboard: KBDSTAT
        case 0x10001000u:
            if (kbd_head == kbd_tail) return 0;
            return 1u | (kbd_buf[kbd_head].release ? 2u : 0u);
        // MMIO keyboard: KBDDATA (reading clears KBDSTAT.bit0 by consuming entry)
        case 0x10001001u: {
            if (kbd_head == kbd_tail) return 0;
            u8 k = kbd_buf[kbd_head].keycode;
            kbd_head = (kbd_head + 1) % 64;
            return k;
        }
        }

        return 0; // unmapped MMIO
    }

    // ---- RAM (addresses >= 0x80000000) ----
    xlen_t phys = addr - 0x80000000u;
    if (phys >= (xlen_t)RV32_MEM_SIZE)
        return 0;
    return mem[phys];
}

u32 RV32::memGetHalfWord(xlen_t addr)
{
    PROF_MEM(1, 0);
    // Fast path: RAM addresses (>= 0x80000000) — skip MMIO dispatch
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        if (phys <= (xlen_t)(RV32_MEM_SIZE - 2))
            return loadLE16(mem + phys);
        return 0;
    }
    PROF_MMIO(0, addr);
    return memGetByteRaw(addr) | ((u32)memGetByteRaw(addr + 1) << 8);
}

// Uncounted word read, used for instruction fetch, PTE reads and debugger peeks.
// Same result as memGetWord(); it just isn't a guest data access.
u32 RV32::peekWord(xlen_t addr)
{
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        if (phys <= (xlen_t)(RV32_MEM_SIZE - 4))
            return loadLE32(mem + phys);
        return 0;
    }
    return memGetWordSlow(addr);
}

u64 RV32::peekDword(xlen_t addr)
{
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        if (phys <= (xlen_t)(RV32_MEM_SIZE - 8))
        {
            u64 v;
            memcpy(&v, mem + phys, 8); // little-endian host
            return v;
        }
        return 0;
    }
    return (u64)memGetWordSlow(addr) | ((u64)memGetWordSlow(addr + 4) << 32);
}

u32 RV32::memGetWord(xlen_t addr)
{
    PROF_MEM(2, 0);
    // Fast path: RAM addresses (>= 0x80000000) — skip MMIO dispatch (4x cheaper)
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        if (phys <= (xlen_t)(RV32_MEM_SIZE - 4))
            return loadLE32(mem + phys);
        return 0;
    }
    PROF_MMIO(0, addr);
    return memGetWordSlow(addr);
}

// MMIO word read: PLIC/virtio are word-granular (claim reads have side effects), the rest is bytes
u32 RV32::memGetWordSlow(xlen_t addr)
{
    if ((addr & 3) == 0)
    {
        if (inPlic(addr))   { net_dirty = true; return plic.read(addr - PLIC_BASE); }
        if (inVirtio(addr)) { net_dirty = true; return vnet.read(addr - VIRTIO_NET_BASE); }
    }
    return memGetByteRaw(addr) |
           ((u32)memGetByteRaw(addr + 1) << 8) |
           ((u32)memGetByteRaw(addr + 2) << 16) |
           ((u32)memGetByteRaw(addr + 3) << 24);
}

u64 RV32::memGetDword(xlen_t addr)
{
    PROF_MEM(3, 0);
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        if (phys <= (xlen_t)(RV32_MEM_SIZE - 8))
        {
            u64 v;
            memcpy(&v, mem + phys, 8); // little-endian host
            return v;
        }
        return 0;
    }
    PROF_MMIO(0, addr);
    return (u64)memGetWordSlow(addr) | ((u64)memGetWordSlow(addr + 4) << 32);
}

void RV32::memSetByte(xlen_t addr, u32 val)
{
    PROF_MEM(0, 1);
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        if (phys < (xlen_t)RV32_MEM_SIZE)
            mem[phys] = (u8)val;
        return;
    }
    PROF_MMIO(1, addr);
    memSetByteRaw(addr, val);
}

void RV32::memSetByteRaw(xlen_t addr, u32 val)
{
    if (addr < 0x80000000u)
    {
        // ---- Low-address MMIO ----

        // CLINT ( 0x11000000 base) msip — must precede network TX buffer
        if (addr >= 0x11000000u && addr < 0x11000004u)
        {
            if (addr == 0x11000000u) clint.msip = (val & 1) != 0;
            return;
        }

        // Network TX DMA buffer at 0x11000004–0x11000fff
        if (addr >= 0x11000004u && addr < 0x11001000u)
        {
            net.nettx[addr - 0x11000000u] = (u8)val;
            return;
        }

        // RTC at 0x03000000–0x030007ff
        if (addr >= RTC_MMIO_BASE && addr < (RTC_MMIO_BASE + RTC_MMIO_SIZE))
        {
            rtcWrite(addr - RTC_MMIO_BASE, (u8)val);
            return;
        }

        // Writing to mtimecmp clears MTIP (spec requirement). On RV64 STIP is left alone: it is
        // a software bit that the SBI firmware sets/clears on behalf of the supervisor.
        if ((addr >= 0x02004000u && addr < 0x02004008u) ||
            (addr >= 0x11004000u && addr < 0x11004008u))
        {
            xlen_t cur_mip = readCsrRaw(CSR_MIP);
#if XLEN == 64
            writeCsrRaw(CSR_MIP, cur_mip & ~(xlen_t)MIP_MTIP);
#else
            writeCsrRaw(CSR_MIP, cur_mip & ~(xlen_t)(MIP_MTIP | MIP_STIP));
#endif
        }

        switch (addr)
        {
        // CLINT
        case 0x02000000u: clint.msip = (val & 1) != 0; return;
        case 0x02000001u: return;
        case 0x02000002u: return;
        case 0x02000003u: return;

        case 0x02004000u: clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xffu << 0))  | ((val & 0xff) << 0);  return;
        case 0x02004001u: clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xffu << 8))  | ((val & 0xff) << 8);  return;
        case 0x02004002u: clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xffu << 16)) | ((val & 0xff) << 16); return;
        case 0x02004003u: clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xffu << 24)) | ((val & 0xff) << 24); return;
        case 0x02004004u: clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xffu << 0))  | ((val & 0xff) << 0);  return;
        case 0x02004005u: clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xffu << 8))  | ((val & 0xff) << 8);  return;
        case 0x02004006u: clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xffu << 16)) | ((val & 0xff) << 16); return;
        case 0x02004007u: clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xffu << 24)) | ((val & 0xff) << 24); return;

        case 0x0200bff8u: clint.mtime_lo = (clint.mtime_lo & ~(0xffu << 0))  | ((val & 0xff) << 0);  return;
        case 0x0200bff9u: clint.mtime_lo = (clint.mtime_lo & ~(0xffu << 8))  | ((val & 0xff) << 8);  return;
        case 0x0200bffau: clint.mtime_lo = (clint.mtime_lo & ~(0xffu << 16)) | ((val & 0xff) << 16); return;
        case 0x0200bffbu: clint.mtime_lo = (clint.mtime_lo & ~(0xffu << 24)) | ((val & 0xff) << 24); return;
        case 0x0200bffcu: clint.mtime_hi = (clint.mtime_hi & ~(0xffu << 0))  | ((val & 0xff) << 0);  return;
        case 0x0200bffdu: clint.mtime_hi = (clint.mtime_hi & ~(0xffu << 8))  | ((val & 0xff) << 8);  return;
        case 0x0200bffeu: clint.mtime_hi = (clint.mtime_hi & ~(0xffu << 16)) | ((val & 0xff) << 16); return;
        case 0x0200bfffu: clint.mtime_hi = (clint.mtime_hi & ~(0xffu << 24)) | ((val & 0xff) << 24); return;

        // CLINT ( 0x11000000 base — matches default DTB)
        case 0x11004000u: clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xffu << 0))  | ((val & 0xff) << 0);  return;
        case 0x11004001u: clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xffu << 8))  | ((val & 0xff) << 8);  return;
        case 0x11004002u: clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xffu << 16)) | ((val & 0xff) << 16); return;
        case 0x11004003u: clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xffu << 24)) | ((val & 0xff) << 24); return;
        case 0x11004004u: clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xffu << 0))  | ((val & 0xff) << 0);  return;
        case 0x11004005u: clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xffu << 8))  | ((val & 0xff) << 8);  return;
        case 0x11004006u: clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xffu << 16)) | ((val & 0xff) << 16); return;
        case 0x11004007u: clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xffu << 24)) | ((val & 0xff) << 24); return;

        case 0x1100bff8u: clint.mtime_lo = (clint.mtime_lo & ~(0xffu << 0))  | ((val & 0xff) << 0);  return;
        case 0x1100bff9u: clint.mtime_lo = (clint.mtime_lo & ~(0xffu << 8))  | ((val & 0xff) << 8);  return;
        case 0x1100bffau: clint.mtime_lo = (clint.mtime_lo & ~(0xffu << 16)) | ((val & 0xff) << 16); return;
        case 0x1100bffbu: clint.mtime_lo = (clint.mtime_lo & ~(0xffu << 24)) | ((val & 0xff) << 24); return;
        case 0x1100bffcu: clint.mtime_hi = (clint.mtime_hi & ~(0xffu << 0))  | ((val & 0xff) << 0);  return;
        case 0x1100bffdu: clint.mtime_hi = (clint.mtime_hi & ~(0xffu << 8))  | ((val & 0xff) << 8);  return;
        case 0x1100bffeu: clint.mtime_hi = (clint.mtime_hi & ~(0xffu << 16)) | ((val & 0xff) << 16); return;
        case 0x1100bfffu: clint.mtime_hi = (clint.mtime_hi & ~(0xffu << 24)) | ((val & 0xff) << 24); return;

        // SYSCON at 0x11100000 (poweroff=0x5555, reboot=0x7777)
        case 0x11100000u:
            if (val == 0x55) syscon_cmd = 0x5555;
            else if (val == 0x77) syscon_cmd = 0x7777;
            return;
        case 0x11100001u: return;
        case 0x11100002u: return;
        case 0x11100003u: return;

        // UART
        case 0x10000000u:
            if ((UART_GET2(LCR) >> 7) == 0)
            {
                uart.thr_pending = true;
                UART_SET1(THR, val);
                UART_SET2(LSR, (UART_GET2(LSR) & ~LSR_THR_EMPTY));
                uartUpdateIir();
            }
            return;
        case 0x10000001u:
            if (UART_GET2(LCR) >> 7 == 0)
            {
                if ((UART_GET1(IER) & IER_THREINT_BIT) == 0 &&
                    (val & IER_THREINT_BIT) != 0 &&
                    UART_GET1(THR) == 0)
                {
                    uart.thre_ip = true;
                }
                UART_SET1(IER, val);
                uartUpdateIir();
            }
            return;
        case 0x10000003u: UART_SET2(LCR, val); return;
        case 0x10000004u: UART_SET2(MCR, val); return;
        case 0x10000007u: UART_SET2(SCR, val); return;
        }

        return; // unmapped MMIO write — ignore
    }

    // ---- RAM (addresses >= 0x80000000) ----
    xlen_t phys = addr - 0x80000000u;
    if (phys >= (xlen_t)RV32_MEM_SIZE)
        return;
    mem[phys] = (u8)val;
}

void RV32::memSetHalfWord(xlen_t addr, u32 val)
{
    PROF_MEM(1, 1);
    // Fast path: RAM addresses (>= 0x80000000) — skip MMIO dispatch
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        if (phys <= (xlen_t)(RV32_MEM_SIZE - 2))
        {
            storeLE16(mem + phys, (u16)val);
        }
        return;
    }
    PROF_MMIO(1, addr);
    memSetByteRaw(addr, val & 0xFF);
    memSetByteRaw(addr + 1, (val >> 8) & 0xFF);
}

void RV32::memSetWord(xlen_t addr, u32 val)
{
    PROF_MEM(2, 1);
    // Fast path: RAM addresses (>= 0x80000000) — skip MMIO dispatch (4x cheaper)
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        if (phys <= (xlen_t)(RV32_MEM_SIZE - 4))
        {
            storeLE32(mem + phys, val);
        }
        return;
    }
    PROF_MMIO(1, addr);
    memSetWordSlow(addr, val);
}

void RV32::memSetWordSlow(xlen_t addr, u32 val)
{
    if ((addr & 3) == 0)
    {
        if (inPlic(addr))   { net_dirty = true; plic.write(addr - PLIC_BASE, val); return; }
        if (inVirtio(addr)) { net_dirty = true; vnet.write(addr - VIRTIO_NET_BASE, val); return; }
    }
    memSetByteRaw(addr, val & 0xFF);
    memSetByteRaw(addr + 1, (val >> 8) & 0xFF);
    memSetByteRaw(addr + 2, (val >> 16) & 0xFF);
    memSetByteRaw(addr + 3, val >> 24);
}

void RV32::memSetDword(xlen_t addr, u64 val)
{
    PROF_MEM(3, 1);
    if (addr >= 0x80000000u)
    {
        xlen_t phys = addr - 0x80000000u;
        if (phys <= (xlen_t)(RV32_MEM_SIZE - 8))
            memcpy(mem + phys, &val, 8); // little-endian host
        return;
    }
    PROF_MMIO(1, addr);
    memSetWordSlow(addr, (u32)val);
    memSetWordSlow(addr + 4, (u32)(val >> 32));
}

///////////////////////////////////////
// UART Functions
///////////////////////////////////////
void RV32::uartUpdateIir()
{
    bool rx_ip = (UART_GET1(IER) & IER_RXINT_BIT) != 0 && UART_GET1(RBR) != 0;
    bool thre_ip = (UART_GET1(IER) & IER_THREINT_BIT) != 0 && UART_GET1(THR) == 0;
    UART_SET1(IIR, (rx_ip ? IIR_RD_AVAILABLE : (thre_ip ? IIR_THR_EMPTY : IIR_NO_INTERRUPT)));
}

__attribute__((noinline)) void RV32::uartTick()
{
    bool rx_ip = false;

    if (stdin_poll_due) // raised at most once per millisecond by Emulator::emulate()
    {
        stdin_poll_due = false;
        if (uart_out_dirty)
        {
            fflush(stdout); // batched output: flushed once per poll tick instead of once per character
            uart_out_dirty = false;
        }
        if (UART_GET1(RBR) == 0)
        {
#ifndef __EMSCRIPTEN__
            int byteswaiting = 0;
            PROF_INC(prof.stdin_polls);
            ioctl(STDIN_FILENO, FIONREAD, &byteswaiting);
            if (byteswaiting > 0)
            {
                char c;
                if (read(STDIN_FILENO, &c, 1) == 1)
                {
                    u32 value = (u8)c;
                    PROF_INC(prof.uart_rx_bytes);
                    UART_SET1(RBR, value);
                    UART_SET2(LSR, (UART_GET2(LSR) | LSR_DATA_AVAILABLE));
                    uartUpdateIir();
                    if ((UART_GET1(IER) & IER_RXINT_BIT) != 0)
                    {
                        rx_ip = true;
                    }
                }
            }
#endif
        }
    }

    u32 thr = UART_GET1(THR);
    if (uart.thr_pending)
    {
        uart.thr_pending = false;
        if (thr != 0) // a NUL byte is "transmitted" too (firmware does write them) but prints nothing
        {
            PROF_INC(prof.uart_tx_bytes);
            putchar((char)thr);
            uart_out_dirty = true;
        }
        UART_SET1(THR, 0);
        UART_SET2(LSR, (UART_GET2(LSR) | LSR_THR_EMPTY));
        uartUpdateIir();
        if ((UART_GET1(IER) & IER_THREINT_BIT) != 0)
        {
            uart.thre_ip = true;
        }
    }

    if (uart.thre_ip || rx_ip)
    {
        uart.interrupting = true;
        uart.thre_ip = false;
    }
    else
    {
        uart.interrupting = false;
    }
}

void RV32::kbdPush(u8 keycode, bool release)
{
    int next = (kbd_tail + 1) % 64;
    if (next == kbd_head) return; // drop if buffer full
    kbd_buf[kbd_tail] = {keycode, release};
    kbd_tail = next;
}

///////////////////////////////////////
// MMU Functions (Sv32 on RV32, Sv39 on RV64)
///////////////////////////////////////

void RV32::mmuUpdate(xlen_t satp)
{
    tlbFlush(); // any satp write (even one that changes nothing) may retarget the page tables

#if XLEN == 64
    // satp.MODE (bits 63:60) is WARL: only Bare (0) and Sv39 (8) are supported.
    // A write with an unsupported mode leaves satp unchanged, which is how
    // software probes for Sv48/Sv57 support.
    u32 mode = (u32)(satp >> 60);
    if (mode != 0 && mode != 8)
        return;
    mmu.mode = mode ? MMU_MODE_SV39 : MMU_MODE_OFF;
    mmu.ppn  = satp & 0xfffffffffffull; // bits 43:0 = PPN in Sv39
#else
    mmu.mode = (satp >> 31) & 1;
    mmu.ppn  = satp & 0x3fffffu; // bits 21:0 = PPN in Sv32
#endif
}

#define MMU_FAULT(ret_ptr, addr_val, mode_val) \
    (ret_ptr)->trap.en    = true; \
    (ret_ptr)->trap.type  = ((mode_val) == MMU_ACCESS_FETCH ? trap_InstructionPageFault : \
                             ((mode_val) == MMU_ACCESS_READ  ? trap_LoadPageFault        : \
                              trap_StorePageFault)); \
    (ret_ptr)->trap.value = (addr_val); \
    PROF_INC(prof.mmu_faults[(mode_val)]); \
    return 0;

void RV32::tlbFlush()
{
    for (auto &arr : tlb)
        for (auto &e : arr)
            e.ctx = TLB_INVALID;
}

// TLB miss (the hit path is inline in mmuTranslate): walk the page tables and cache a successful translation
__attribute__((noinline)) xlen_t RV32::mmuTranslateMiss(ins_ret *ret, xlen_t addr, u32 mode, u32 priv, u32 sum, u32 mxr, u32 ctx)
{
    xlen_t vpn = addr >> 12;
    TlbEntry &e = tlb[mode][vpn & ((1u << TLB_BITS) - 1)];
    xlen_t pa = mmuWalk(ret, addr, mode, priv, sum, mxr);
    if (!ret->trap.en)
    {
        e.vpn = vpn;
        e.ctx = ctx;
        e.pbase = (u64)pa & ~(u64)0xfff;
    }
    return pa;
}

__attribute__((noinline)) xlen_t RV32::mmuWalk(ins_ret *ret, xlen_t addr, u32 mode, u32 priv, u32 sum, u32 mxr)
{
    PROF_INC(prof.mmu_walks[mode]);

#if XLEN == 64
    // Sv39: bits 63:39 of the virtual address must equal bit 38
    {
        s64 top = (s64)addr >> 38;
        if (top != 0 && top != -1) { MMU_FAULT(ret, addr, mode) }
    }

    // Three-level Sv39 page-table walk (8-byte PTEs, 9-bit VPN fields)
    u64 a = mmu.ppn * 4096ull;
    u64 pte = 0;
    int level;
    for (level = 2; level >= 0; level--)
    {
        u64 vpn = (addr >> (12 + 9 * level)) & 0x1ff;
        PROF_INC(prof.ptw_reads);
        pte = peekDword(a + vpn * 8); // walker reads are not guest data accesses

        bool v = pte & 1, r = (pte >> 1) & 1, w = (pte >> 2) & 1, x = (pte >> 3) & 1;
        // Invalid, reserved R/W combination, or reserved bits 63:54 set
        if (!v || (!r && w) || (pte >> 54) != 0) { MMU_FAULT(ret, addr, mode) }

        if (r || x)
            break; // leaf PTE
        if (level == 0) { MMU_FAULT(ret, addr, mode) } // non-leaf at bottom level
        a = ((pte >> 10) & 0xfffffffffffull) * 4096ull;
    }

    bool page_r = (pte >> 1) & 1, page_w = (pte >> 2) & 1, page_x = (pte >> 3) & 1;
    bool page_u = (pte >> 4) & 1, page_a = (pte >> 6) & 1, page_d = (pte >> 7) & 1;
    u64 ppn = (pte >> 10) & 0xfffffffffffull;

    // Permission check
    bool perm = (priv == PRIV_USER && page_u) ||
                (priv == PRIV_SUPERVISOR && (!page_u || (sum && mode != MMU_ACCESS_FETCH)));
    bool access = (mode == MMU_ACCESS_FETCH && page_x) ||
                  (mode == MMU_ACCESS_READ  && (page_r || (page_x && mxr))) ||
                  (mode == MMU_ACCESS_WRITE && page_w);
    if (!(perm && access)) { MMU_FAULT(ret, addr, mode) }

    // Misaligned superpage: low PPN fields below the leaf level must be zero
    if (level > 0 && (ppn & ((1ull << (9 * level)) - 1)) != 0) { MMU_FAULT(ret, addr, mode) }

    // Accessed / dirty bits must be set (Svade behaviour)
    if (!page_a || (mode == MMU_ACCESS_WRITE && !page_d)) { MMU_FAULT(ret, addr, mode) }

    // Physical address: superpages take the low bits from the virtual address
    u64 offset_mask = (1ull << (12 + 9 * level)) - 1;
    return ((ppn << 12) & ~offset_mask) | (addr & offset_mask);
#else
    // Two-level Sv32 page-table walk
    bool super = false;
    u32 page_ppn0 = 0, page_ppn1 = 0;
    bool page_v = false, page_r = false, page_w = false, page_x = false;
    bool page_u = false, page_a = false, page_d = false;

    for (int level = 0; level < 2; level++)
    {
        u32 page_addr;
        if (level == 0)
            page_addr = mmu.ppn * 4096u + ((addr >> 22) & 0x3ffu) * 4u;
        else
            page_addr = (page_ppn0 | (page_ppn1 << 10)) * 4096u
                        + ((addr >> 12) & 0x3ffu) * 4u;

        PROF_INC(prof.ptw_reads);
        u32 pte  = peekWord(page_addr); // walker reads are not guest data accesses
        page_v   = (pte >> 0) & 1;
        page_r   = (pte >> 1) & 1;
        page_w   = (pte >> 2) & 1;
        page_x   = (pte >> 3) & 1;
        page_u   = (pte >> 4) & 1;
        page_a   = (pte >> 6) & 1;
        page_d   = (pte >> 7) & 1;
        page_ppn0= (pte >> 10) & 0x3ffu;
        page_ppn1= (pte >> 20) & 0xfffu;
        super    = (level == 0);

        if (!page_v || (!page_r && page_w)) { MMU_FAULT(ret, addr, mode) }

        if (page_r || page_x)
            break; // leaf PTE found
        else if (level == 1)
        { MMU_FAULT(ret, addr, mode) } // non-leaf at bottom level
    }

    // Permission check
    bool perm = (priv == PRIV_MACHINE) ||
                (priv == PRIV_USER && page_u) ||
                (priv == PRIV_SUPERVISOR && (!page_u || sum));
    bool access = (mode == MMU_ACCESS_FETCH && page_x) ||
                  (mode == MMU_ACCESS_READ  && (page_r || (page_x && mxr))) ||
                  (mode == MMU_ACCESS_WRITE && page_w);

    if (!(perm && access)) { MMU_FAULT(ret, addr, mode) }

    // Misaligned superpage check
    if (super && page_ppn0 != 0) { MMU_FAULT(ret, addr, mode) }

    // Accessed / dirty bits must be set
    if (!page_a || (mode == MMU_ACCESS_WRITE && !page_d)) { MMU_FAULT(ret, addr, mode) }

    // Build physical address
    u32 pa = addr & 0xfffu; // page offset
    pa |= super ? (((addr >> 12) & 0x3ffu) << 12) : (page_ppn0 << 12);
    pa |= page_ppn1 << 22;
    return pa;
#endif
}
#undef MMU_FAULT

///////////////////////////////////////
// RTC Functions (ds1742 compatible)
///////////////////////////////////////

// BCD helpers
static inline u8 bin2bcd(u8 x) { return (u8)(((x / 10) << 4) + (x % 10)); }

u8 RV32::rtcRead(u32 offset)
{
    if (offset < RTC_REG_BASE || offset >= RTC_REG_BASE + 8u)
        return 0;
    u32 reg = offset - RTC_REG_BASE;
    if (reg >= 4)
        return (u8)((rtc1 >> ((reg - 4) * 8)) & 0xff);
    return (u8)((rtc0 >> (reg * 8)) & 0xff);
}

void RV32::rtcWrite(u32 offset, u8 data)
{
    if (offset != RTC_REG_BASE)
        return; // only RTC_CONTROL at base triggers an update
    if (data == 0x40) // RTC_READ command
    {
        struct timespec ts;
        clock_gettime(CLOCK_REALTIME, &ts);
        struct tm *t = localtime(&ts.tv_sec);
        rtc0 = (u32)(bin2bcd((u8)((t->tm_year + 1900) / 100))) |
               ((u32)bin2bcd((u8)t->tm_sec)  << 8)  |
               ((u32)bin2bcd((u8)t->tm_min)  << 16) |
               ((u32)bin2bcd((u8)t->tm_hour) << 24);
        rtc1 = (u32)bin2bcd((u8)t->tm_wday) |
               ((u32)bin2bcd((u8)t->tm_mday)       << 8)  |
               ((u32)bin2bcd((u8)(t->tm_mon + 1))  << 16) |
               ((u32)bin2bcd((u8)(t->tm_year % 100)) << 24);
    }
}
