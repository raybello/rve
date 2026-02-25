#include "rv32.h"


RV32::RV32(/* args */)
{
}

RV32::~RV32()
{
}

bool RV32::init(u8 *memory, u8 *dtb, bool debug_mode = false)
{
    // reset clock
    clock = 0;
    for (u32 i = 0; i < 32; i++)
    {
        xreg[i] = 0;
    }
    xreg[0xb] = 0x1020; // For Linux?
    pc = 0x80000000;
    mem = memory;
    reservation_en = false;

    initCSRs();

    debug_single_step = debug_mode;

    this->dtb = dtb;

    clint.msip = false;
    clint.mtimecmp_lo = 0;
    clint.mtimecmp_hi = 0;
    clint.mtime_lo = 0;
    clint.mtime_hi = 0;

    uart.rbr_thr_ier_iir = 0;
    uart.lcr_mcr_lsr_scr = 0x00200000; // LSR_THR_EMPTY is set
    uart.thre_ip = false;
    uart.interrupting = false;

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
        return csr.data[CSR_MSTATUS] & 0x000de162;
    case CSR_SIE:
        return csr.data[CSR_MIE] & 0x222;
    case CSR_SIP:
        return csr.data[CSR_MIP] & 0x222;
    case CSR_CYCLE:
        return clock;
    case CSR_TIME:
        return clint.mtime_lo;
    case CSR_MHARTID:
        return 0;
    default:
        return csr.data[address & 0xffff];
    }
}

void RV32::writeCsrRaw(u32 address, u32 value)
{
    switch (address)
    {
    case CSR_SSTATUS:
        csr.data[CSR_MSTATUS] &= !0x000de162;
        csr.data[CSR_MSTATUS] |= value & 0x000de162;
        /* self.mmu.update_mstatus(self.read_csr_raw(CSR_MSTATUS)); */
        break;
    case CSR_SIE:
        csr.data[CSR_MIE] &= !0x222;
        csr.data[CSR_MIE] |= value & 0x222;
        break;
    case CSR_SIP:
        csr.data[CSR_MIP] &= !0x222;
        csr.data[CSR_MIP] |= value & 0x222;
        break;
    case CSR_MIDELEG:
        csr.data[address] = value & 0x666; // from qemu
        break;
    /* case CSR_MSTATUS: */
    /*     csr.data[address] = value; */
    /*     self.mmu.update_mstatus(self.read_csr_raw(CSR_MSTATUS)); */
    /*     break; */
    case CSR_TIME:
        // ignore writes
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
                // TODO: update MMU addressing mode
                printf("WARN: Ignoring write to CSR_SATP\n");
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

    writeCsrRaw(csr_epc_addr, pc);
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
        u32 new_status = (mstatus & !0x1888) | (mie << 7) | (current_privilege << 11);
        writeCsrRaw(CSR_MSTATUS, new_status);
    }
    else
    { // PRIV_SUPERVISOR
        u32 sie = (sstatus >> 3) & 1;
        u32 new_status = (sstatus & !0x122) | (sie << 5) | ((current_privilege & 1) << 8);
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
    bool trap = ret->trap.en;
    u32 mip_reset = MIP_ALL;
    u32 cur_mip = readCsrRaw(CSR_MIP);

    if (!trap)
    {
        u32 mirq = cur_mip & readCsrRaw(CSR_MIE);
#define HANDLE(mip, ttype)      \
    case mip:                   \
        mip_reset = mip;        \
        ret->trap.en = true;    \
        ret->trap.type = ttype; \
        break;

        switch (mirq & MIP_ALL)
        {
            HANDLE(MIP_MEIP, trap_MachineExternalInterrupt)
            HANDLE(MIP_MSIP, trap_MachineSoftwareInterrupt)
            HANDLE(MIP_MTIP, trap_MachineTimerInterrupt)
            HANDLE(MIP_SEIP, trap_SupervisorExternalInterrupt)
            HANDLE(MIP_SSIP, trap_SupervisorSoftwareInterrupt)
            HANDLE(MIP_STIP, trap_SupervisorTimerInterrupt)
        }
#undef HANDLE
    }

    bool irq = mip_reset != MIP_ALL;
    if (trap || irq)
    {
        bool handled = handleTrap(ret, irq);
        if (handled && irq)
        {
            // reset MIP value since IRQ was handled
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
    /* printf("TRACE: memGetByte(%d)\n", addr); */
    assert(addr & 0x80000000);
    if (dtb != NULL && addr >= 0x1020 && addr <= 0x1fff)
    {
        printf("DTB read @%04x/%04x\n", addr, addr - 0x1020);
        return dtb[addr - 0x1020];
    }

    switch (addr)
    {
    // CLINT
    case 0x02000000:
        return clint.msip ? 1 : 0;
    case 0x02000001:
        return 0;
    case 0x02000002:
        return 0;
    case 0x02000003:
        return 0;
    case 0x02004000:
        return (clint.mtimecmp_lo >> 0) & 0xFF;
    case 0x02004001:
        return (clint.mtimecmp_lo >> 8) & 0xFF;
    case 0x02004002:
        return (clint.mtimecmp_lo >> 16) & 0xFF;
    case 0x02004003:
        return (clint.mtimecmp_lo >> 24) & 0xFF;
    case 0x02004004:
        return (clint.mtimecmp_hi >> 0) & 0xFF;
    case 0x02004005:
        return (clint.mtimecmp_hi >> 8) & 0xFF;
    case 0x02004006:
        return (clint.mtimecmp_hi >> 16) & 0xFF;
    case 0x02004007:
        return (clint.mtimecmp_hi >> 24) & 0xFF;
    case 0x0200bff8:
        return (clint.mtime_lo >> 0) & 0xFF;
    case 0x0200bff9:
        return (clint.mtime_lo >> 8) & 0xFF;
    case 0x0200bffa:
        return (clint.mtime_lo >> 16) & 0xFF;
    case 0x0200bffb:
        return (clint.mtime_lo >> 24) & 0xFF;
    case 0x0200bffc:
        return (clint.mtime_hi >> 0) & 0xFF;
    case 0x0200bffd:
        return (clint.mtime_hi >> 8) & 0xFF;
    case 0x0200bffe:
        return (clint.mtime_hi >> 16) & 0xFF;
    case 0x0200bfff:
        return (clint.mtime_hi >> 24) & 0xFF;

    // UART (first has rbr_thr_ier_iir, second has lcr_mcr_lsr_scr)
    case 0x10000000:
        if ((UART_GET2(LCR) >> 7) == 0)
        {
            u32 rbr = UART_GET1(RBR);
            UART_SET1(RBR, 0);
            UART_SET2(LSR, (UART_GET2(LSR) & ~LSR_DATA_AVAILABLE));
            uartUpdateIir();
            return rbr;
        }
        else
        {
            return 0;
        }
    case 0x10000001:
        return UART_GET2(LCR) >> 7 == 0 ? UART_GET1(IER) : 0;
    case 0x10000002:
        return UART_GET1(IIR);
    case 0x10000003:
        return UART_GET2(LCR);
    case 0x10000004:
        return UART_GET2(MCR);
    case 0x10000005:
        return UART_GET2(LSR);
    case 0x10000007:
        return UART_GET2(SCR);
    }

    if ((addr & 0x80000000) == 0)
    {
        return 0;
    }
    return mem[addr & 0x7FFFFFFF];
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
    assert(addr & 0x80000000);
    switch (addr)
    {
    // CLINT
    case 0x02000000:
        clint.msip = (val & 1) != 0;
        return;
    case 0x02000001:
        return;
    case 0x02000002:
        return;
    case 0x02000003:
        return;

    case 0x02004000:
        clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xff << 0)) | (val << 0);
        return;
    case 0x02004001:
        clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xff << 8)) | (val << 8);
        return;
    case 0x02004002:
        clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xff << 16)) | (val << 16);
        return;
    case 0x02004003:
        clint.mtimecmp_lo = (clint.mtimecmp_lo & ~(0xff << 24)) | (val << 24);
        return;
    case 0x02004004:
        clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xff << 0)) | (val << 0);
        return;
    case 0x02004005:
        clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xff << 8)) | (val << 8);
        return;
    case 0x02004006:
        clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xff << 16)) | (val << 16);
        return;
    case 0x02004007:
        clint.mtimecmp_hi = (clint.mtimecmp_hi & ~(0xff << 24)) | (val << 24);
        return;

    case 0x0200bff8:
        clint.mtime_lo = (clint.mtime_lo & ~(0xff << 0)) | (val << 0);
        return;
    case 0x0200bff9:
        clint.mtime_lo = (clint.mtime_lo & ~(0xff << 8)) | (val << 8);
        return;
    case 0x0200bffa:
        clint.mtime_lo = (clint.mtime_lo & ~(0xff << 16)) | (val << 16);
        return;
    case 0x0200bffb:
        clint.mtime_lo = (clint.mtime_lo & ~(0xff << 24)) | (val << 24);
        return;
    case 0x0200bffc:
        clint.mtime_hi = (clint.mtime_hi & ~(0xff << 0)) | (val << 0);
        return;
    case 0x0200bffd:
        clint.mtime_hi = (clint.mtime_hi & ~(0xff << 8)) | (val << 8);
        return;
    case 0x0200bffe:
        clint.mtime_hi = (clint.mtime_hi & ~(0xff << 16)) | (val << 16);
        return;
    case 0x0200bfff:
        clint.mtime_hi = (clint.mtime_hi & ~(0xff << 24)) | (val << 24);
        return;

    // UART (first has rbr_thr_ier_iir, second has lcr_mcr_lsr_scr)
    case 0x10000000:
        if ((UART_GET2(LCR) >> 7) == 0)
        {
            UART_SET1(THR, val);
            UART_SET2(LSR, (UART_GET2(LSR) & ~LSR_THR_EMPTY));
            uartUpdateIir();
        }
        return;
    case 0x10000001:
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
    case 0x10000003:
        UART_SET2(LCR, val);
        return;
    case 0x10000004:
        UART_SET2(MCR, val);
        return;
    case 0x10000007:
        UART_SET2(SCR, val);
        return;
    }

    if ((addr & 0x80000000) == 0)
    {
        return;
    }

    mem[addr & 0x7FFFFFFF] = val;
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
