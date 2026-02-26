#include "rv32.h"
#include "net.h"


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
    }
    xreg[0xb] = 0x1020; // For Linux / device tree pointer
    pc = 0x80000000;
    mem = memory;
    reservation_en = false;
    reservation_addr = 0;

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
    uart.lcr_mcr_lsr_scr = 0x00200000; // LSR_THR_EMPTY is set
    uart.thre_ip = false;
    uart.interrupting = false;

    mmu.mode = MMU_MODE_OFF;
    mmu.ppn  = 0;

    net.rx_ready = 0;
    net.nettx = (u8 *)malloc(4096);
    net.netrx = (u8 *)malloc(4096);

    rtc0 = 0;
    rtc1 = 0;

    // Record wall-clock start time for CLINT mtime
    struct timeval tv;
    gettimeofday(&tv, NULL);
    start_time_ref = (float)tv.tv_sec;

    return true;
}

void RV32::initCSRs()
{
    csr.privilege = PRIV_MACHINE;
    for (u32 i = 0; i < 4096; i++)
    {
        csr.data[i] = 0;
    }
    // RV32AIMSU
    csr.data[CSR_MISA] = 0b01000000000101000001000100000001;
}

void RV32::dump()
{
    printf("======================================\n");
    printf("DUMP: CPU state @%d:\n", clock);
    for (int i = 0; i < 32; i += 4)
    {
        printf("DUMP: .x%02d = %08x  .x%02d = %08x  .%02d = %08x  .%02d = %08x\n",
               i, xreg[i],
               i + 1, xreg[i + 1],
               i + 2, xreg[i + 2],
               i + 3, xreg[i + 3]);
    }
    printf("DUMP: .pc  = %08x\n", pc);
    printf("DUMP: next ins: %08x\n", *(u32 *)(mem + (pc & 0x7FFFFFFF)));
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
u32 RV32::readCsrRaw(u32 address)
{
    switch (address)
    {
    case CSR_SSTATUS:
        return csr.data[CSR_MSTATUS] & 0x000de162u;
    case CSR_SIE:
        return csr.data[CSR_MIE] & 0x222u;
    case CSR_SIP:
        return csr.data[CSR_MIP] & 0x222u;
    case CSR_MCYCLE:
    case CSR_CYCLE:
        return clock;
    case CSR_TIME:
        return clint.mtime_lo;
    case CSR_MHARTID:
        return 0;
    case CSR_SATP:
        return (mmu.mode << 31) | mmu.ppn;
    case CSR_NET_TX_BUF_ADDR:
        return 0x11000000u;
    case CSR_NET_RX_BUF_ADDR:
        return 0x11001000u;
    default:
        return csr.data[address & 0xffff];
    }
}

void RV32::writeCsrRaw(u32 address, u32 value)
{
    switch (address)
    {
    case CSR_SSTATUS:
        csr.data[CSR_MSTATUS] &= ~0x000de162u;  // was !0x000de162 (bug: logical NOT → 0)
        csr.data[CSR_MSTATUS] |= value & 0x000de162u;
        break;
    case CSR_SIE:
        csr.data[CSR_MIE] &= ~0x222u;
        csr.data[CSR_MIE] |= value & 0x222u;
        break;
    case CSR_SIP:
        csr.data[CSR_MIP] &= ~0x222u;
        csr.data[CSR_MIP] |= value & 0x222u;
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
    default:
        csr.data[address] = value;
        break;
    };
}

u32 RV32::getCsr(u32 address, ins_ret *ret)
{
    if (hasCsrAccessPrivilege(address))
    {
        u32 r = readCsrRaw(address);
#ifdef VERBOSE
        printf("CSR read @%03x = %08x\n", address, r);
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

void RV32::setCsr(u32 address, u32 value, ins_ret *ret)
{
#ifdef VERBOSE
    printf("CSR write @%03x = %08x\n", address, value);
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

    u32 mstatus = readCsrRaw(CSR_MSTATUS);
    u32 sstatus = readCsrRaw(CSR_SSTATUS);
    u32 current_status = current_privilege == PRIV_MACHINE ? mstatus : (current_privilege == PRIV_SUPERVISOR ? sstatus : readCsrRaw(CSR_USTATUS));

    // check if IRQ should be ignored
    if (isInterrupt)
    {
        u32 ie = new_privilege == PRIV_MACHINE ? readCsrRaw(CSR_MIE) : (new_privilege == PRIV_SUPERVISOR ? readCsrRaw(CSR_SIE) : readCsrRaw(CSR_UIE));

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
    writeCsrRaw(csr_cause_addr, t.type);
    writeCsrRaw(csr_tval_addr, t.value);
    ret->pc_val = readCsrRaw(csr_tvec_addr);

    if ((ret->pc_val & 0x3) != 0)
    {
        // vectored handler
        ret->pc_val = (ret->pc_val & ~0x3) + 4 * pos;
    }

    // NOTE: No user mode interrupt/exception handling!
    if (new_privilege == PRIV_MACHINE)
    {
        u32 mie = (mstatus >> 3) & 1;
        u32 new_status = (mstatus & ~0x1888u) | (mie << 7) | (current_privilege << 11);
        writeCsrRaw(CSR_MSTATUS, new_status);
    }
    else
    { // PRIV_SUPERVISOR
        u32 sie = (sstatus >> 1) & 1;  // bit 1 = SIE (was incorrectly bit 3)
        u32 new_status = (sstatus & ~0x122u) | (sie << 5) | ((current_privilege & 1) << 8);
        writeCsrRaw(CSR_SSTATUS, new_status);
    }

#ifdef RV32_VERBOSE
    printf("trap: type=%08x value=%08x (IRQ: %d) moved PC from @%08x to @%08x\n", t.type, t.value, is_interrupt, pc, ret->pc_val);
#endif
    /* debug_single_step = true; */

    return true;
}

void RV32::handleIrqAndTrap(ins_ret *ret)
{
    Trap t = ret->trap;
    u32 mip_reset = MIP_ALL;
    u32 cur_mip = readCsrRaw(CSR_MIP);
    bool irq = false;

    if (!t.en)
    {
        irq = true;
        u32 mirq = cur_mip & readCsrRaw(CSR_MIE);

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
        bool handled = handleTrap(ret, irq);
        if (handled && irq)
        {
            // Timer IRQ (MTIP/STIP) is cleared by guest writing mtimecmp, not here
            if ((mip_reset & (MIP_MTIP | MIP_STIP)) == 0)
                writeCsrRaw(CSR_MIP, cur_mip & ~mip_reset);
        }
    }
}

///////////////////////////////////////
// Memory Functions
///////////////////////////////////////
// little endian, zero extended
u32 RV32::memGetByte(u32 addr)
{
    if ((addr & 0x80000000u) == 0)
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

        // RTC at 0x03000000–0x030007ff
        if (addr >= RTC_MMIO_BASE && addr < (RTC_MMIO_BASE + RTC_MMIO_SIZE))
            return rtcRead(addr - RTC_MMIO_BASE);

        switch (addr)
        {
        // CLINT
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
        }

        return 0; // unmapped MMIO
    }

    // ---- RAM (bit 31 set) ----
    u32 phys = addr & 0x7FFFFFFFu;
    if (phys >= (u32)RV32_MEM_SIZE)
        return 0;
    return mem[phys];
}

u32 RV32::memGetHalfWord(u32 addr)
{
    return memGetByte(addr) | ((uint16_t)memGetByte(addr + 1) << 8);
}

u32 RV32::memGetWord(u32 addr)
{
    return memGetByte(addr) |
           ((uint16_t)memGetByte(addr + 1) << 8) |
           ((uint16_t)memGetByte(addr + 2) << 16) |
           ((uint16_t)memGetByte(addr + 3) << 24);
}

void RV32::memSetByte(u32 addr, u32 val)
{
    if ((addr & 0x80000000u) == 0)
    {
        // ---- Low-address MMIO ----

        // Network TX DMA buffer at 0x11000000–0x11000fff
        if (addr >= 0x11000000u && addr < 0x11001000u)
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

        // Writing to mtimecmp clears MTIP/STIP (spec requirement)
        if (addr >= 0x02004000u && addr < 0x02004008u)
        {
            u32 cur_mip = readCsrRaw(CSR_MIP);
            writeCsrRaw(CSR_MIP, cur_mip & ~(MIP_MTIP | MIP_STIP));
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

        // UART
        case 0x10000000u:
            if ((UART_GET2(LCR) >> 7) == 0)
            {
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

    // ---- RAM (bit 31 set) ----
    u32 phys = addr & 0x7FFFFFFFu;
    if (phys >= (u32)RV32_MEM_SIZE)
        return;
    mem[phys] = (u8)val;
}

void RV32::memSetHalfWord(u32 addr, u32 val)
{
    memSetByte(addr, val & 0xFF);
    memSetByte(addr + 1, (val >> 8) & 0xFF);
}

void RV32::memSetWord(u32 addr, u32 val)
{
    memSetByte(addr, val & 0xFF);
    memSetByte(addr + 1, (val >> 8) & 0xFF);
    memSetByte(addr + 2, (val >> 16) & 0xFF);
    memSetByte(addr + 3, val >> 24);
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

void RV32::uartTick()
{
    bool rx_ip = false;

    if ((clock % 0x38400) == 0 && UART_GET1(RBR) == 0)
    {
        u32 value = 0; // TODO: Add actual input logic
        if (value != 0)
        {
            UART_SET1(RBR, value);
            UART_SET2(LSR, (UART_GET2(LSR) | LSR_DATA_AVAILABLE));
            uartUpdateIir();
            if ((UART_GET1(IER) & IER_RXINT_BIT) != 0)
            {
                rx_ip = true;
            }
        }
    }

    u32 thr = UART_GET1(THR);
    if ((clock & 0x16) == 0 && thr != 0)
    {
        printf("%c", (char)thr);
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

///////////////////////////////////////
// MMU Functions (Sv32)
///////////////////////////////////////

void RV32::mmuUpdate(u32 satp)
{
    mmu.mode = (satp >> 31) & 1;
    mmu.ppn  = satp & 0x3fffffu; // bits 21:0 = PPN in Sv32
}

#define MMU_FAULT(ret_ptr, addr_val, mode_val) \
    (ret_ptr)->trap.en    = true; \
    (ret_ptr)->trap.type  = ((mode_val) == MMU_ACCESS_FETCH ? trap_InstructionPageFault : \
                             ((mode_val) == MMU_ACCESS_READ  ? trap_LoadPageFault        : \
                              trap_StorePageFault)); \
    (ret_ptr)->trap.value = (addr_val); \
    return 0;

u32 RV32::mmuTranslate(ins_ret *ret, u32 addr, u32 mode)
{
    if (mmu.mode == MMU_MODE_OFF)
        return addr;

    // Determine effective privilege and mstatus flags
    u32 mstatus = readCsrRaw(CSR_MSTATUS);
    u32 sum  = (mstatus >> 18) & 1;
    u32 mxr  = (mstatus >> 19) & 1;
    u32 priv = ((mstatus >> 17) & 1) ? ((mstatus >> 11) & 3) : csr.privilege;

    // Machine mode always uses physical addresses;
    // M-mode instruction fetch also bypasses paging
    if (priv == PRIV_MACHINE ||
        (csr.privilege == PRIV_MACHINE && mode == MMU_ACCESS_FETCH))
        return addr;

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

        u32 pte  = memGetWord(page_addr);
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
