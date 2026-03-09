#include "emu.h"
#include "net.h"
#include "default64mbdtc.h"
#include <sys/time.h>
#include <cfenv>
#include <cmath>
#ifndef __EMSCRIPTEN__
#include <termios.h>
#include <signal.h>
#include <unistd.h>

static struct termios orig_term;
static bool term_captured = false;

static void resetKeyboardInput()
{
    if (term_captured)
    {
        tcsetattr(STDIN_FILENO, TCSANOW, &orig_term);
        term_captured = false;
    }
}

static void captureKeyboardInput()
{
    if (term_captured) return;
    atexit(resetKeyboardInput);
    struct termios term;
    tcgetattr(STDIN_FILENO, &term);
    orig_term = term;
    term.c_lflag &= ~(ICANON | ECHO);
    tcsetattr(STDIN_FILENO, TCSANOW, &term);
    term_captured = true;
}
#endif

////////////////////////////////////////////////////////////////
// FP Helper Functions
////////////////////////////////////////////////////////////////

// Apply RISC-V rounding mode to C FP environment.
// Returns false if rm is reserved (5 or 6) → illegal instruction.
static bool fp_set_rm(u32 ins_word, u32 fcsr)
{
    u32 rm = (ins_word >> 12) & 0x7u;
    if (rm == FRM_DYN)
        rm = (fcsr >> 5) & 0x7u;
    switch (rm)
    {
    case FRM_RNE: fesetround(FE_TONEAREST);  return true;
    case FRM_RTZ: fesetround(FE_TOWARDZERO); return true;
    case FRM_RDN: fesetround(FE_DOWNWARD);   return true;
    case FRM_RUP: fesetround(FE_UPWARD);     return true;
    case FRM_RMM: fesetround(FE_TONEAREST);  return true; // approx; no FE_TOMAXMAGNITUDE
    default:      return false; // rm 5 or 6 = illegal
    }
}

// Accumulate hardware FP exception flags into FCSR, then restore default rounding mode.
static void fp_accum_flags(RV32 &cpu)
{
    u32 flags = 0;
    if (fetestexcept(FE_INEXACT))   flags |= FFLAG_NX;
    if (fetestexcept(FE_UNDERFLOW)) flags |= FFLAG_UF;
    if (fetestexcept(FE_OVERFLOW))  flags |= FFLAG_OF;
    if (fetestexcept(FE_DIVBYZERO)) flags |= FFLAG_DZ;
    if (fetestexcept(FE_INVALID))   flags |= FFLAG_NV;
    cpu.csr.data[CSR_FCSR] |= flags;
    feclearexcept(FE_ALL_EXCEPT);
    fesetround(FE_TONEAREST);
}

// Write single-precision float to freg with NaN-boxing (upper 32 bits = 0xFFFFFFFF).
static inline void freg_write_s(RV32 &cpu, u32 rd, float f)
{
    u32 bits;
    memcpy(&bits, &f, 4);
    cpu.freg[rd] = 0xFFFFFFFF00000000ULL | (u64)bits;
}

// Write double-precision float to freg.
static inline void freg_write_d(RV32 &cpu, u32 rd, double d)
{
    u64 bits;
    memcpy(&bits, &d, 8);
    cpu.freg[rd] = bits;
}

// Read single-precision float from freg. If not NaN-boxed, return canonical qNaN.
static inline float freg_read_s(RV32 &cpu, u32 rs)
{
    u64 v = cpu.freg[rs];
    if ((v >> 32) != 0xFFFFFFFFu)
    {
        u32 qnan_bits = 0x7FC00000u;
        float qnan;
        memcpy(&qnan, &qnan_bits, 4);
        return qnan;
    }
    float f;
    u32 lo = (u32)v;
    memcpy(&f, &lo, 4);
    return f;
}

// Read double-precision float from freg.
static inline double freg_read_d(RV32 &cpu, u32 rs)
{
    double d;
    memcpy(&d, &cpu.freg[rs], 8);
    return d;
}

// Load 64-bit double from memory (two consecutive 32-bit words, little-endian).
// addr must already be a translated physical address.
static u64 mem_get_double(RV32 &cpu, u32 addr)
{
    return (u64)cpu.memGetWord(addr) | ((u64)cpu.memGetWord(addr + 4) << 32);
}

// Store 64-bit double to memory as two 32-bit words (little-endian).
static void mem_set_double(RV32 &cpu, u32 addr, u64 val)
{
    cpu.memSetWord(addr,     (u32)(val & 0xFFFFFFFFu));
    cpu.memSetWord(addr + 4, (u32)(val >> 32));
}

// fclass result: one-hot bit per floating-point class (Table 11.2 of RISC-V spec).
static u32 fp_fclass_s(float f)
{
    bool neg = std::signbit(f);
    int  cls = std::fpclassify(f);
    if (cls == FP_INFINITE)  return neg ? (1u << 0) : (1u << 7);
    if (cls == FP_NORMAL)    return neg ? (1u << 1) : (1u << 6);
    if (cls == FP_SUBNORMAL) return neg ? (1u << 2) : (1u << 5);
    if (cls == FP_ZERO)      return neg ? (1u << 3) : (1u << 4);
    // NaN — bit 22 set = quiet, clear = signaling
    u32 bits;
    memcpy(&bits, &f, 4);
    return (bits & (1u << 22)) ? (1u << 9) : (1u << 8);
}

static u32 fp_fclass_d(double d)
{
    bool neg = std::signbit(d);
    int  cls = std::fpclassify(d);
    if (cls == FP_INFINITE)  return neg ? (1u << 0) : (1u << 7);
    if (cls == FP_NORMAL)    return neg ? (1u << 1) : (1u << 6);
    if (cls == FP_SUBNORMAL) return neg ? (1u << 2) : (1u << 5);
    if (cls == FP_ZERO)      return neg ? (1u << 3) : (1u << 4);
    u64 bits;
    memcpy(&bits, &d, 8);
    return (bits & (1ULL << 51)) ? (1u << 9) : (1u << 8);
}

#define FP_ILLEGAL_RM()                                    \
    {                                                      \
        ret->trap.en    = true;                            \
        ret->trap.type  = trap_IllegalInstruction;         \
        ret->trap.value = ins_word;                        \
        return;                                            \
    }

void print_inst(uint64_t pc, uint32_t inst)
{
    char buf[80] = {0};
    disasm_inst(buf, sizeof(buf), rv64, pc, inst);
    printf("%016" PRIx64 ":  %s\n", pc, buf);
}

////////////////////////////////////////////////////////////////
// Instruction Decoding
////////////////////////////////////////////////////////////////
// Function to sign-extend an unsigned integer `x` based on the bit width `b`.
u32 signExtend(u32 x, u32 b)
{
    // Calculate the mask `m`. This sets a single bit at position (b - 1),
    // which corresponds to the most significant bit of a signed value with `b` bits.
    // In essence, this is `2^(b-1)`.
    u32 m = ((u32)1) << (b - 1);

    // Return the result of the sign extension:
    // 1. The expression `(x ^ m)` toggles the bit at position (b - 1).
    //    This effectively flips the sign bit of the number.
    // 2. Subtracting `m` then adjusts the value so that it represents the correct
    //    negative or positive number in a signed representation within `b` bits.
    return (x ^ m) - m;
}

FormatB parse_FormatB(u32 word)
{
    FormatB ret;
    ret.rs1 = (word >> 15) & 0x1f;
    ret.rs2 = (word >> 20) & 0x1f;
    ret.imm = (word & 0x80000000 ? 0xfffff000 : 0) |
              ((word << 4) & 0x00000800) |
              ((word >> 20) & 0x000007e0) |
              ((word >> 7) & 0x0000001e);
    return ret;
}

FormatCSR parse_FormatCSR(u32 word)
{
    FormatCSR ret;
    ret.csr = (word >> 20) & 0xfff;
    ret.rs = (word >> 15) & 0x1f;
    ret.rd = (word >> 7) & 0x1f;
    return ret;
}

FormatI parse_FormatI(u32 word)
{
    FormatI ret;
    ret.rd = (word >> 7) & 0x1f;
    ret.rs1 = (word >> 15) & 0x1f;
    ret.imm = (word & 0x80000000 ? 0xfffff800 : 0) |
              ((word >> 20) & 0x000007ff);
    return ret;
}

FormatJ parse_FormatJ(u32 word)
{
    FormatJ ret;
    ret.rd = (word >> 7) & 0x1f;
    ret.imm = (word & 0x80000000 ? 0xfff00000 : 0) |
              (word & 0x000ff000) |
              ((word & 0x00100000) >> 9) |
              ((word & 0x7fe00000) >> 20);
    return ret;
}

FormatR parse_FormatR(u32 word)
{
    FormatR ret;
    ret.rd = (word >> 7) & 0x1f;
    ret.rs1 = (word >> 15) & 0x1f;
    ret.rs2 = (word >> 20) & 0x1f;
    ret.rs3 = (word >> 27) & 0x1f;
    return ret;
}

FormatS parse_FormatS(u32 word)
{
    FormatS ret;
    ret.rs1 = (word >> 15) & 0x1f;
    ret.rs2 = (word >> 20) & 0x1f;
    ret.imm = (word & 0x80000000 ? 0xfffff000 : 0) |
              ((word >> 20) & 0xfe0) |
              ((word >> 7) & 0x1f);
    return ret;
}

FormatU parse_FormatU(u32 word)
{
    FormatU ret;
    ret.rd = (word >> 7) & 0x1f;
    ret.imm = word & 0xfffff000;
    return ret;
}

FormatEmpty parse_FormatEmpty(u32 word)
{
    FormatEmpty ret;
    return ret;
}

////////////////////////////////////////////////////////////////
// Instruction Implement
////////////////////////////////////////////////////////////////
#define AS_SIGNED(val) (*(int32_t *)&val)
#define AS_UNSIGNED(val) (*(u32 *)&val)
#define ins_p(name) printf("DBUG: INS %s (%08x)\n", #name, ins_word);

const u32 ZERO = 0;
const u32 ONE = 1;

#define imp(name, fmt_t, code) \
    void Emulator::emu_##name(u32 ins_word, ins_ret *ret, fmt_t ins) { code }

#define run(name, data, insf)                     \
    case data:                                    \
    {                                             \
        if (debugMode)                            \
            ins_p(name)                           \
                emu_##name(ins_word, &ret, insf); \
        return ret;                               \
    }

#define WR_RD(code)                         \
    {                                       \
        ret->write_reg = ins.rd;            \
        ret->write_val = AS_UNSIGNED(code); \
    }
#define WR_PC(code)         \
    {                       \
        ret->pc_val = code; \
    }
#define WR_CSR(code)              \
    {                             \
        ret->csr_write = ins.csr; \
        ret->csr_val = code;      \
    }

imp(add, FormatR, { // rv32i
    WR_RD(AS_SIGNED(cpu.xreg[ins.rs1]) + AS_SIGNED(cpu.xreg[ins.rs2]));
}) imp(addi, FormatI, { // rv32i
    WR_RD(AS_SIGNED(cpu.xreg[ins.rs1]) + AS_SIGNED(ins.imm));
}) imp(amoswap_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    cpu.memSetWord(addr, cpu.xreg[ins.rs2]);
    WR_RD(tmp)
}) imp(amoadd_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    cpu.memSetWord(addr, cpu.xreg[ins.rs2] + tmp);
    WR_RD(tmp)
}) imp(amoxor_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    cpu.memSetWord(addr, cpu.xreg[ins.rs2] ^ tmp);
    WR_RD(tmp)
}) imp(amoand_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    cpu.memSetWord(addr, cpu.xreg[ins.rs2] & tmp);
    WR_RD(tmp)
}) imp(amoor_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    cpu.memSetWord(addr, cpu.xreg[ins.rs2] | tmp);
    WR_RD(tmp)
}) imp(amomin_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    u32 sec = cpu.xreg[ins.rs2];
    cpu.memSetWord(addr, AS_SIGNED(sec) < AS_SIGNED(tmp) ? sec : tmp);
    WR_RD(tmp)
}) imp(amomax_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    u32 sec = cpu.xreg[ins.rs2];
    cpu.memSetWord(addr, AS_SIGNED(sec) > AS_SIGNED(tmp) ? sec : tmp);
    WR_RD(tmp)
}) imp(amominu_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    u32 sec = cpu.xreg[ins.rs2];
    cpu.memSetWord(addr, sec < tmp ? sec : tmp);
    WR_RD(tmp)
}) imp(amomaxu_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    u32 sec = cpu.xreg[ins.rs2];
    cpu.memSetWord(addr, sec > tmp ? sec : tmp);
    WR_RD(tmp)
}) imp(and, FormatR, {                                                                                                                                                                           // rv32i
                      WR_RD(cpu.xreg[ins.rs1] & cpu.xreg[ins.rs2])}) imp(andi, FormatI, {                                                                                                        // rv32i
                                                                                         WR_RD(cpu.xreg[ins.rs1] & ins.imm)}) imp(auipc, FormatU, {                                              // rv32i
                                                                                                                                                   WR_RD(cpu.pc + ins.imm)}) imp(beq, FormatB, { // rv32i
    if (cpu.xreg[ins.rs1] == cpu.xreg[ins.rs2])
    {
        WR_PC(cpu.pc + ins.imm);
    }
}) imp(bge, FormatB, { // rv32i
    if (AS_SIGNED(cpu.xreg[ins.rs1]) >= AS_SIGNED(cpu.xreg[ins.rs2]))
    {
        WR_PC(cpu.pc + ins.imm);
    }
}) imp(bgeu, FormatB, { // rv32i
    if (AS_UNSIGNED(cpu.xreg[ins.rs1]) >= AS_UNSIGNED(cpu.xreg[ins.rs2]))
    {
        WR_PC(cpu.pc + ins.imm);
    }
}) imp(blt, FormatB, { // rv32i
    if (AS_SIGNED(cpu.xreg[ins.rs1]) < AS_SIGNED(cpu.xreg[ins.rs2]))
    {
        WR_PC(cpu.pc + ins.imm);
    }
}) imp(bltu, FormatB, { // rv32i
    if (AS_UNSIGNED(cpu.xreg[ins.rs1]) < AS_UNSIGNED(cpu.xreg[ins.rs2]))
    {
        WR_PC(cpu.pc + ins.imm);
    }
}) imp(bne, FormatB, { // rv32i
    if (cpu.xreg[ins.rs1] != cpu.xreg[ins.rs2])
    {
        WR_PC(cpu.pc + ins.imm);
    }
}) imp(csrrc, FormatCSR, { // system
    u32 rs = cpu.xreg[ins.rs];
    if (rs != 0)
    {
        WR_CSR(ins.value & ~rs);
    }
    WR_RD(ins.value)
}) imp(csrrci, FormatCSR, { // system
    if (ins.rs != 0)
    {
        WR_CSR(ins.value & (~ins.rs));
    }
    WR_RD(ins.value)
}) imp(csrrs, FormatCSR, { // system
    u32 rs = cpu.xreg[ins.rs];
    if (rs != 0)
    {
        WR_CSR(ins.value | rs);
    }
    WR_RD(ins.value)
}) imp(csrrsi, FormatCSR, { // system
    if (ins.rs != 0)
    {
        WR_CSR(ins.value | ins.rs);
    }
    WR_RD(ins.value)
}) imp(csrrw, FormatCSR, { // system
    WR_CSR(cpu.xreg[ins.rs]);
    WR_RD(ins.value)
}) imp(csrrwi, FormatCSR, { // system
    WR_CSR(ins.rs);
    WR_RD(ins.value)
}) imp(div, FormatR, { // rv32m
    u32 dividend = cpu.xreg[ins.rs1];
    u32 divisor = cpu.xreg[ins.rs2];
    u32 result;
    if (divisor == 0)
    {
        result = 0xFFFFFFFF;
    }
    else if (dividend == 0x80000000 && divisor == 0xFFFFFFFF)
    {
        result = dividend;
    }
    else
    {
        int32_t tmp = AS_SIGNED(dividend) / AS_SIGNED(divisor);
        result = AS_UNSIGNED(tmp);
    }
    WR_RD(result)
}) imp(divu, FormatR, { // rv32m
    u32 dividend = cpu.xreg[ins.rs1];
    u32 divisor = cpu.xreg[ins.rs2];
    u32 result;
    if (divisor == 0)
    {
        result = 0xFFFFFFFF;
    }
    else
    {
        result = dividend / divisor;
    }
    WR_RD(result)
}) imp(ebreak, FormatEmpty, {
                                // system
                                // unnecessary?
                            }) imp(ecall, FormatEmpty, { // system
    if (cpu.xreg[17] == 93)
    {
        // EXIT CALL
        u32 status = cpu.xreg[10] >> 1;
        u32 x10 = cpu.xreg[10];

        #ifndef __EMSCRIPTEN__
        printf("\nECALL EXIT = x10[%x] %d (0x%x)\n", x10, status, status);
        exit(status);
        // running = false;
        // debugMode = true;
        // printf("MMU mode: %d, ppn: %x\n", cpu.mmu.mode, cpu.mmu.ppn);
        #else
        printf("Exit called in WebAssembly environment. Ignoring exit.\n");
        #endif
    }

    ret->trap.en = true;
    ret->trap.value = cpu.pc;
    if (cpu.csr.privilege == PRIV_USER)
    {
        ret->trap.type = trap_EnvironmentCallFromUMode;
    }
    else if (cpu.csr.privilege == PRIV_SUPERVISOR)
    {
        ret->trap.type = trap_EnvironmentCallFromSMode;
    }
    else
    { // PRIV_MACHINE
        ret->trap.type = trap_EnvironmentCallFromMMode;
    }
}) imp(fence, FormatEmpty, {
                               // rv32i
                               // skip
                           }) imp(fence_i, FormatEmpty, {
                                                            // rv32i
                                                            // skip
                                                        }) imp(jal, FormatJ, { // rv32i
    WR_RD(cpu.pc + 4);
    WR_PC(cpu.pc + ins.imm);
}) imp(jalr, FormatI, { // rv32i
    WR_RD(cpu.pc + 4);
    WR_PC(cpu.xreg[ins.rs1] + ins.imm);
}) imp(lb, FormatI, { // rv32i
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_READ);
    if (ret->trap.en) return;
    u32 tmp = signExtend(cpu.memGetByte(addr), 8);
    WR_RD(tmp)
}) imp(lbu, FormatI, { // rv32i
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_READ);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetByte(addr);
    WR_RD(tmp)
}) imp(lh, FormatI, { // rv32i
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_READ);
    if (ret->trap.en) return;
    u32 tmp = signExtend(cpu.memGetHalfWord(addr), 16);
    WR_RD(tmp)
}) imp(lhu, FormatI, { // rv32i
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_READ);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetHalfWord(addr);
    WR_RD(tmp)
}) imp(lr_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_READ);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    cpu.reservation_en = true;
    cpu.reservation_addr = addr;
    WR_RD(tmp)
}) imp(lui, FormatU, {                                    // rv32i
                      WR_RD(ins.imm)}) imp(lw, FormatI, { // rv32i
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_READ);
    if (ret->trap.en) return;
    u32 tmp = cpu.memGetWord(addr);
    WR_RD(tmp)
}) imp(mret, FormatEmpty, { // system
    u32 newpc = cpu.getCsr(CSR_MEPC, ret);
    if (!ret->trap.en)
    {
        u32 status = cpu.readCsrRaw(CSR_MSTATUS);
        u32 mpie = (status >> 7) & 1;
        u32 mpp = (status >> 11) & 0x3;
        u32 mprv = mpp == PRIV_MACHINE ? ((status >> 17) & 1) : 0;
        u32 new_status = (status & ~0x21888) | (mprv << 17) | (mpie << 3) | (1 << 7);
        cpu.writeCsrRaw(CSR_MSTATUS, new_status);
        cpu.csr.privilege = mpp;
        WR_PC(newpc)
    }
}) imp(mul, FormatR, { // rv32m
    u32 tmp = AS_SIGNED(cpu.xreg[ins.rs1]) * AS_SIGNED(cpu.xreg[ins.rs2]);
    WR_RD(tmp)
}) imp(mulh, FormatR, { // rv32m
    u32 tmp = ((int64_t)AS_SIGNED(cpu.xreg[ins.rs1]) * (int64_t)AS_SIGNED(cpu.xreg[ins.rs2])) >> 32;
    WR_RD(tmp)
}) imp(mulhsu, FormatR, { // rv32m
    u32 tmp = ((int64_t)AS_SIGNED(cpu.xreg[ins.rs1]) * (uint64_t)AS_UNSIGNED(cpu.xreg[ins.rs2])) >> 32;
    WR_RD(tmp)
}) imp(mulhu, FormatR, { // rv32m
    u32 tmp = ((uint64_t)AS_UNSIGNED(cpu.xreg[ins.rs1]) * (uint64_t)AS_UNSIGNED(cpu.xreg[ins.rs2])) >> 32;
    WR_RD(tmp)
}) imp(or, FormatR, {                                                                                                                           // rv32i
                     WR_RD(cpu.xreg[ins.rs1] | cpu.xreg[ins.rs2])}) imp(ori, FormatI, {                                                         // rv32i
                                                                                       WR_RD(cpu.xreg[ins.rs1] | ins.imm)}) imp(rem, FormatR, { // rv32m
    u32 dividend = cpu.xreg[ins.rs1];
    u32 divisor = cpu.xreg[ins.rs2];
    u32 result;
    if (divisor == 0)
    {
        result = dividend;
    }
    else if (dividend == 0x80000000 && divisor == 0xFFFFFFFF)
    {
        result = 0;
    }
    else
    {
        int32_t tmp = AS_SIGNED(dividend) % AS_SIGNED(divisor);
        result = AS_UNSIGNED(tmp);
    }
    WR_RD(result)
}) imp(remu, FormatR, { // rv32m
    u32 dividend = cpu.xreg[ins.rs1];
    u32 divisor = cpu.xreg[ins.rs2];
    u32 result;
    if (divisor == 0)
    {
        result = dividend;
    }
    else
    {
        result = dividend % divisor;
    }
    WR_RD(result)
}) imp(sb, FormatS, { // rv32i
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    cpu.memSetByte(addr, cpu.xreg[ins.rs2]);
}) imp(sc_w, FormatR, { // rv32a
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1], MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    if (cpu.reservation_en && cpu.reservation_addr == addr)
    {
        cpu.memSetWord(addr, cpu.xreg[ins.rs2]);
        cpu.reservation_en = false;
        WR_RD(ZERO)
    }
    else
    {
        WR_RD(ONE)
    }
}) imp(sfence_vma, FormatEmpty, {
                                    // system
                                    // skip
                                }) imp(sh, FormatS, { // rv32i
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    cpu.memSetHalfWord(addr, cpu.xreg[ins.rs2]);
}) imp(sll, FormatR, {                                                                     // rv32i
                      WR_RD(cpu.xreg[ins.rs1] << cpu.xreg[ins.rs2])}) imp(slli, FormatR, { // rv32i
    u32 shamt = (ins_word >> 20) & 0x1F;
    WR_RD(cpu.xreg[ins.rs1] << shamt)
}) imp(slt, FormatR, { // rv32i
    if (AS_SIGNED(cpu.xreg[ins.rs1]) < AS_SIGNED(cpu.xreg[ins.rs2]))
    {
        WR_RD(ONE)
    }
    else
    {
        WR_RD(ZERO)
    }
}) imp(slti, FormatI, { // rv32i
    if (AS_SIGNED(cpu.xreg[ins.rs1]) < AS_SIGNED(ins.imm))
    {
        WR_RD(ONE)
    }
    else
    {
        WR_RD(ZERO)
    }
}) imp(sltiu, FormatI, { // rv32i
    if (AS_UNSIGNED(cpu.xreg[ins.rs1]) < AS_UNSIGNED(ins.imm))
    {
        WR_RD(ONE)
    }
    else
    {
        WR_RD(ZERO)
    }
}) imp(sltu, FormatR, { // rv32i
    if (AS_UNSIGNED(cpu.xreg[ins.rs1]) < AS_UNSIGNED(cpu.xreg[ins.rs2]))
    {
        WR_RD(ONE)
    }
    else
    {
        WR_RD(ZERO)
    }
}) imp(sra, FormatR, { // rv32i
    u32 msr = cpu.xreg[ins.rs1] & 0x80000000;
    WR_RD(msr ? ~(~cpu.xreg[ins.rs1] >> cpu.xreg[ins.rs2]) : cpu.xreg[ins.rs1] >> cpu.xreg[ins.rs2])
}) imp(srai, FormatR, { // rv32i
    u32 msr = cpu.xreg[ins.rs1] & 0x80000000;
    u32 shamt = (ins_word >> 20) & 0x1F;
    WR_RD(msr ? ~(~cpu.xreg[ins.rs1] >> shamt) : cpu.xreg[ins.rs1] >> shamt)
}) imp(sret, FormatEmpty, { // system
    u32 newpc = cpu.getCsr(CSR_SEPC, ret);
    if (!ret->trap.en)
    {
        u32 status = cpu.readCsrRaw(CSR_SSTATUS);
        u32 spie = (status >> 5) & 1;
        u32 spp = (status >> 8) & 1;
        u32 mprv = spp == PRIV_MACHINE ? ((status >> 17) & 1) : 0;
        u32 new_status = (status & ~0x20122) | (mprv << 17) | (spie << 1) | (1 << 5);
        cpu.writeCsrRaw(CSR_SSTATUS, new_status);
        cpu.csr.privilege = spp;
        WR_PC(newpc)
    }
}) imp(srl, FormatR, {                                                                     // rv32i
                      WR_RD(cpu.xreg[ins.rs1] >> cpu.xreg[ins.rs2])}) imp(srli, FormatR, { // rv32i
    u32 shamt = (ins_word >> 20) & 0x1F;
    WR_RD(cpu.xreg[ins.rs1] >> shamt)
}) imp(sub, FormatR, { // rv32i
    WR_RD(AS_SIGNED(cpu.xreg[ins.rs1]) - AS_SIGNED(cpu.xreg[ins.rs2]));
}) imp(sw, FormatS, { // rv32i
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    cpu.memSetWord(addr, cpu.xreg[ins.rs2]);
}) imp(uret, FormatEmpty, {
                              // system
                              // unnecessary?
                          }) imp(wfi, FormatEmpty, {
                                                       // system
                                                       // no-op is valid here, so skip
                                                   }) imp(xor, FormatR, {                                                                   // rv32i
                                                                         WR_RD(cpu.xreg[ins.rs1] ^ cpu.xreg[ins.rs2])}) imp(xori, FormatI, {// rv32i
                                                                                                                                            WR_RD(cpu.xreg[ins.rs1] ^ ins.imm)})

////////////////////////////////////////////////////////////////
// RV32F / RV32D Instruction Implementations
////////////////////////////////////////////////////////////////

// ---- FP Loads / Stores ----
imp(flw, FormatI, { // rv32f
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_READ);
    if (ret->trap.en) return;
    cpu.freg[ins.rd] = 0xFFFFFFFF00000000ULL | (u64)cpu.memGetWord(addr);
})
imp(fld, FormatI, { // rv32d
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_READ);
    if (ret->trap.en) return;
    cpu.freg[ins.rd] = mem_get_double(cpu, addr);
})
imp(fsw, FormatS, { // rv32f
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    cpu.memSetWord(addr, (u32)(cpu.freg[ins.rs2] & 0xFFFFFFFFu));
})
imp(fsd, FormatS, { // rv32d
    u32 addr = cpu.mmuTranslate(ret, cpu.xreg[ins.rs1] + ins.imm, MMU_ACCESS_WRITE);
    if (ret->trap.en) return;
    mem_set_double(cpu, addr, cpu.freg[ins.rs2]);
})

// ---- FP Arithmetic — Single ----
imp(fadd_s, FormatR, { // rv32f
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, freg_read_s(cpu, ins.rs1) + freg_read_s(cpu, ins.rs2));
    fp_accum_flags(cpu);
})
imp(fsub_s, FormatR, { // rv32f
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, freg_read_s(cpu, ins.rs1) - freg_read_s(cpu, ins.rs2));
    fp_accum_flags(cpu);
})
imp(fmul_s, FormatR, { // rv32f
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, freg_read_s(cpu, ins.rs1) * freg_read_s(cpu, ins.rs2));
    fp_accum_flags(cpu);
})
imp(fdiv_s, FormatR, { // rv32f
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, freg_read_s(cpu, ins.rs1) / freg_read_s(cpu, ins.rs2));
    fp_accum_flags(cpu);
})
imp(fsqrt_s, FormatR, { // rv32f
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, std::sqrt(freg_read_s(cpu, ins.rs1)));
    fp_accum_flags(cpu);
})

// ---- FP Arithmetic — Double ----
imp(fadd_d, FormatR, { // rv32d
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_d(cpu, ins.rd, freg_read_d(cpu, ins.rs1) + freg_read_d(cpu, ins.rs2));
    fp_accum_flags(cpu);
})
imp(fsub_d, FormatR, { // rv32d
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_d(cpu, ins.rd, freg_read_d(cpu, ins.rs1) - freg_read_d(cpu, ins.rs2));
    fp_accum_flags(cpu);
})
imp(fmul_d, FormatR, { // rv32d
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_d(cpu, ins.rd, freg_read_d(cpu, ins.rs1) * freg_read_d(cpu, ins.rs2));
    fp_accum_flags(cpu);
})
imp(fdiv_d, FormatR, { // rv32d
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_d(cpu, ins.rd, freg_read_d(cpu, ins.rs1) / freg_read_d(cpu, ins.rs2));
    fp_accum_flags(cpu);
})
imp(fsqrt_d, FormatR, { // rv32d
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_d(cpu, ins.rd, std::sqrt(freg_read_d(cpu, ins.rs1)));
    fp_accum_flags(cpu);
})

// ---- R4-type Fused Multiply-Add — Single ----
imp(fmadd_s, FormatR, { // rv32f: rd = rs1*rs2 + rs3
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, std::fma(freg_read_s(cpu, ins.rs1), freg_read_s(cpu, ins.rs2), freg_read_s(cpu, ins.rs3)));
    fp_accum_flags(cpu);
})
imp(fmsub_s, FormatR, { // rv32f: rd = rs1*rs2 - rs3
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, std::fma(freg_read_s(cpu, ins.rs1), freg_read_s(cpu, ins.rs2), -freg_read_s(cpu, ins.rs3)));
    fp_accum_flags(cpu);
})
imp(fnmsub_s, FormatR, { // rv32f: rd = -(rs1*rs2) + rs3
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, std::fma(-freg_read_s(cpu, ins.rs1), freg_read_s(cpu, ins.rs2), freg_read_s(cpu, ins.rs3)));
    fp_accum_flags(cpu);
})
imp(fnmadd_s, FormatR, { // rv32f: rd = -(rs1*rs2) - rs3
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, std::fma(-freg_read_s(cpu, ins.rs1), freg_read_s(cpu, ins.rs2), -freg_read_s(cpu, ins.rs3)));
    fp_accum_flags(cpu);
})

// ---- R4-type Fused Multiply-Add — Double ----
imp(fmadd_d, FormatR, { // rv32d: rd = rs1*rs2 + rs3
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_d(cpu, ins.rd, std::fma(freg_read_d(cpu, ins.rs1), freg_read_d(cpu, ins.rs2), freg_read_d(cpu, ins.rs3)));
    fp_accum_flags(cpu);
})
imp(fmsub_d, FormatR, { // rv32d: rd = rs1*rs2 - rs3
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_d(cpu, ins.rd, std::fma(freg_read_d(cpu, ins.rs1), freg_read_d(cpu, ins.rs2), -freg_read_d(cpu, ins.rs3)));
    fp_accum_flags(cpu);
})
imp(fnmsub_d, FormatR, { // rv32d: rd = -(rs1*rs2) + rs3
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_d(cpu, ins.rd, std::fma(-freg_read_d(cpu, ins.rs1), freg_read_d(cpu, ins.rs2), freg_read_d(cpu, ins.rs3)));
    fp_accum_flags(cpu);
})
imp(fnmadd_d, FormatR, { // rv32d: rd = -(rs1*rs2) - rs3
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_d(cpu, ins.rd, std::fma(-freg_read_d(cpu, ins.rs1), freg_read_d(cpu, ins.rs2), -freg_read_d(cpu, ins.rs3)));
    fp_accum_flags(cpu);
})

// ---- Sign Injection — Single ----
imp(fsgnj_s, FormatR, { // rv32f
    u32 a; float fa = freg_read_s(cpu, ins.rs1); memcpy(&a, &fa, 4);
    u32 b; float fb = freg_read_s(cpu, ins.rs2); memcpy(&b, &fb, 4);
    u32 r = (a & 0x7FFFFFFFu) | (b & 0x80000000u);
    float rf; memcpy(&rf, &r, 4);
    freg_write_s(cpu, ins.rd, rf);
})
imp(fsgnjn_s, FormatR, { // rv32f
    u32 a; float fa = freg_read_s(cpu, ins.rs1); memcpy(&a, &fa, 4);
    u32 b; float fb = freg_read_s(cpu, ins.rs2); memcpy(&b, &fb, 4);
    u32 r = (a & 0x7FFFFFFFu) | (~b & 0x80000000u);
    float rf; memcpy(&rf, &r, 4);
    freg_write_s(cpu, ins.rd, rf);
})
imp(fsgnjx_s, FormatR, { // rv32f
    u32 a; float fa = freg_read_s(cpu, ins.rs1); memcpy(&a, &fa, 4);
    u32 b; float fb = freg_read_s(cpu, ins.rs2); memcpy(&b, &fb, 4);
    u32 r = a ^ (b & 0x80000000u);
    float rf; memcpy(&rf, &r, 4);
    freg_write_s(cpu, ins.rd, rf);
})

// ---- Sign Injection — Double ----
imp(fsgnj_d, FormatR, { // rv32d
    u64 a = cpu.freg[ins.rs1];
    u64 b = cpu.freg[ins.rs2];
    cpu.freg[ins.rd] = (a & 0x7FFFFFFFFFFFFFFFull) | (b & 0x8000000000000000ull);
})
imp(fsgnjn_d, FormatR, { // rv32d
    u64 a = cpu.freg[ins.rs1];
    u64 b = cpu.freg[ins.rs2];
    cpu.freg[ins.rd] = (a & 0x7FFFFFFFFFFFFFFFull) | (~b & 0x8000000000000000ull);
})
imp(fsgnjx_d, FormatR, { // rv32d
    u64 a = cpu.freg[ins.rs1];
    u64 b = cpu.freg[ins.rs2];
    cpu.freg[ins.rd] = a ^ (b & 0x8000000000000000ull);
})

// ---- fmin / fmax — Single ----
imp(fmin_s, FormatR, { // rv32f
    float a = freg_read_s(cpu, ins.rs1);
    float b = freg_read_s(cpu, ins.rs2);
    u32 ab; memcpy(&ab, &a, 4);
    u32 bb; memcpy(&bb, &b, 4);
    if ((std::isnan(a) && !(ab & (1u << 22))) || (std::isnan(b) && !(bb & (1u << 22))))
        cpu.csr.data[CSR_FCSR] |= FFLAG_NV;
    float r;
    if (std::isnan(a) && std::isnan(b)) { u32 qn = 0x7FC00000u; memcpy(&r, &qn, 4); }
    else if (std::isnan(a)) r = b;
    else if (std::isnan(b)) r = a;
    else if (a == 0.0f && b == 0.0f) r = std::signbit(a) ? a : b; // -0 < +0
    else r = a < b ? a : b;
    freg_write_s(cpu, ins.rd, r);
})
imp(fmax_s, FormatR, { // rv32f
    float a = freg_read_s(cpu, ins.rs1);
    float b = freg_read_s(cpu, ins.rs2);
    u32 ab; memcpy(&ab, &a, 4);
    u32 bb; memcpy(&bb, &b, 4);
    if ((std::isnan(a) && !(ab & (1u << 22))) || (std::isnan(b) && !(bb & (1u << 22))))
        cpu.csr.data[CSR_FCSR] |= FFLAG_NV;
    float r;
    if (std::isnan(a) && std::isnan(b)) { u32 qn = 0x7FC00000u; memcpy(&r, &qn, 4); }
    else if (std::isnan(a)) r = b;
    else if (std::isnan(b)) r = a;
    else if (a == 0.0f && b == 0.0f) r = std::signbit(b) ? a : b; // +0 > -0
    else r = a > b ? a : b;
    freg_write_s(cpu, ins.rd, r);
})

// ---- fmin / fmax — Double ----
imp(fmin_d, FormatR, { // rv32d
    double a = freg_read_d(cpu, ins.rs1);
    double b = freg_read_d(cpu, ins.rs2);
    u64 ab; memcpy(&ab, &a, 8);
    u64 bb; memcpy(&bb, &b, 8);
    if ((std::isnan(a) && !(ab & (1ULL << 51))) || (std::isnan(b) && !(bb & (1ULL << 51))))
        cpu.csr.data[CSR_FCSR] |= FFLAG_NV;
    double r;
    if (std::isnan(a) && std::isnan(b)) { u64 qn = 0x7FF8000000000000ULL; memcpy(&r, &qn, 8); }
    else if (std::isnan(a)) r = b;
    else if (std::isnan(b)) r = a;
    else if (a == 0.0 && b == 0.0) r = std::signbit(a) ? a : b;
    else r = a < b ? a : b;
    freg_write_d(cpu, ins.rd, r);
})
imp(fmax_d, FormatR, { // rv32d
    double a = freg_read_d(cpu, ins.rs1);
    double b = freg_read_d(cpu, ins.rs2);
    u64 ab; memcpy(&ab, &a, 8);
    u64 bb; memcpy(&bb, &b, 8);
    if ((std::isnan(a) && !(ab & (1ULL << 51))) || (std::isnan(b) && !(bb & (1ULL << 51))))
        cpu.csr.data[CSR_FCSR] |= FFLAG_NV;
    double r;
    if (std::isnan(a) && std::isnan(b)) { u64 qn = 0x7FF8000000000000ULL; memcpy(&r, &qn, 8); }
    else if (std::isnan(a)) r = b;
    else if (std::isnan(b)) r = a;
    else if (a == 0.0 && b == 0.0) r = std::signbit(b) ? a : b;
    else r = a > b ? a : b;
    freg_write_d(cpu, ins.rd, r);
})

// ---- Comparisons — Single (result → integer reg) ----
imp(feq_s, FormatR, { // rv32f
    float a = freg_read_s(cpu, ins.rs1);
    float b = freg_read_s(cpu, ins.rs2);
    if (std::isnan(a) || std::isnan(b))
    {
        u32 ab; memcpy(&ab, &a, 4);
        u32 bb; memcpy(&bb, &b, 4);
        if ((std::isnan(a) && !(ab & (1u << 22))) || (std::isnan(b) && !(bb & (1u << 22))))
            cpu.csr.data[CSR_FCSR] |= FFLAG_NV;
        u32 r = 0; WR_RD(r)
    }
    else { u32 r = (a == b) ? 1u : 0u; WR_RD(r) }
})
imp(flt_s, FormatR, { // rv32f
    float a = freg_read_s(cpu, ins.rs1);
    float b = freg_read_s(cpu, ins.rs2);
    if (std::isnan(a) || std::isnan(b)) { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; u32 r = 0; WR_RD(r) }
    else { u32 r = (a < b) ? 1u : 0u; WR_RD(r) }
})
imp(fle_s, FormatR, { // rv32f
    float a = freg_read_s(cpu, ins.rs1);
    float b = freg_read_s(cpu, ins.rs2);
    if (std::isnan(a) || std::isnan(b)) { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; u32 r = 0; WR_RD(r) }
    else { u32 r = (a <= b) ? 1u : 0u; WR_RD(r) }
})

// ---- Comparisons — Double ----
imp(feq_d, FormatR, { // rv32d
    double a = freg_read_d(cpu, ins.rs1);
    double b = freg_read_d(cpu, ins.rs2);
    if (std::isnan(a) || std::isnan(b))
    {
        u64 ab; memcpy(&ab, &a, 8);
        u64 bb; memcpy(&bb, &b, 8);
        if ((std::isnan(a) && !(ab & (1ULL << 51))) || (std::isnan(b) && !(bb & (1ULL << 51))))
            cpu.csr.data[CSR_FCSR] |= FFLAG_NV;
        u32 r = 0; WR_RD(r)
    }
    else { u32 r = (a == b) ? 1u : 0u; WR_RD(r) }
})
imp(flt_d, FormatR, { // rv32d
    double a = freg_read_d(cpu, ins.rs1);
    double b = freg_read_d(cpu, ins.rs2);
    if (std::isnan(a) || std::isnan(b)) { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; u32 r = 0; WR_RD(r) }
    else { u32 r = (a < b) ? 1u : 0u; WR_RD(r) }
})
imp(fle_d, FormatR, { // rv32d
    double a = freg_read_d(cpu, ins.rs1);
    double b = freg_read_d(cpu, ins.rs2);
    if (std::isnan(a) || std::isnan(b)) { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; u32 r = 0; WR_RD(r) }
    else { u32 r = (a <= b) ? 1u : 0u; WR_RD(r) }
})

// ---- fclass ----
imp(fclass_s, FormatR, { // rv32f
    u32 _cls = fp_fclass_s(freg_read_s(cpu, ins.rs1));
    WR_RD(_cls)
})
imp(fclass_d, FormatR, { // rv32d
    u32 _cls = fp_fclass_d(freg_read_d(cpu, ins.rs1));
    WR_RD(_cls)
})

// ---- Integer ↔ FP Move (raw bits) ----
imp(fmv_x_w, FormatR, { // rv32f: rd(int) = lower 32 bits of freg[rs1]
    u32 _bits = (u32)(cpu.freg[ins.rs1] & 0xFFFFFFFFu);
    WR_RD(_bits)
})
imp(fmv_w_x, FormatR, { // rv32f: freg[rd] = NaN-box(xreg[rs1])
    cpu.freg[ins.rd] = 0xFFFFFFFF00000000ULL | (u64)cpu.xreg[ins.rs1];
})

// ---- FP → Integer Conversions (single) ----
imp(fcvt_w_s, FormatR, { // rv32f: float → signed int32 (saturating)
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    float a = freg_read_s(cpu, ins.rs1);
    u32 result;
    if (std::isnan(a) || a >= 2147483648.0f)
        { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; result = 0x7FFFFFFFu; }
    else if (a < -2147483648.0f)
        { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; result = 0x80000000u; }
    else
        { feclearexcept(FE_ALL_EXCEPT); result = (u32)(int32_t)a; fp_accum_flags(cpu); }
    WR_RD(result)
})
imp(fcvt_wu_s, FormatR, { // rv32f: float → unsigned int32 (saturating)
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    float a = freg_read_s(cpu, ins.rs1);
    u32 result;
    if (std::isnan(a) || a >= 4294967296.0f)
        { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; result = 0xFFFFFFFFu; }
    else if (a < 0.0f) {
        // Negative: round with selected mode; if it rounds up to 0 it's inexact (NX), else invalid (NV)
        float rounded = std::rint(a);
        if (rounded >= 0.0f) { cpu.csr.data[CSR_FCSR] |= FFLAG_NX; result = (u32)rounded; }
        else                 { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; result = 0; }
    } else
        { feclearexcept(FE_ALL_EXCEPT); result = (u32)a; fp_accum_flags(cpu); }
    WR_RD(result)
})

// ---- Integer → FP Conversions (single) ----
imp(fcvt_s_w, FormatR, { // rv32f: signed int32 → float
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, (float)(int32_t)cpu.xreg[ins.rs1]);
    fp_accum_flags(cpu);
})
imp(fcvt_s_wu, FormatR, { // rv32f: unsigned int32 → float
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    feclearexcept(FE_ALL_EXCEPT);
    freg_write_s(cpu, ins.rd, (float)(u32)cpu.xreg[ins.rs1]);
    fp_accum_flags(cpu);
})

// ---- FP → Integer Conversions (double) ----
imp(fcvt_w_d, FormatR, { // rv32d: double → signed int32 (saturating)
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    double a = freg_read_d(cpu, ins.rs1);
    u32 result;
    if (std::isnan(a) || a >= 2147483648.0)
        { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; result = 0x7FFFFFFFu; }
    else if (a < -2147483648.0)
        { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; result = 0x80000000u; }
    else
        { feclearexcept(FE_ALL_EXCEPT); result = (u32)(int32_t)a; fp_accum_flags(cpu); }
    WR_RD(result)
})
imp(fcvt_wu_d, FormatR, { // rv32d: double → unsigned int32 (saturating)
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    double a = freg_read_d(cpu, ins.rs1);
    u32 result;
    if (std::isnan(a) || a >= 4294967296.0)
        { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; result = 0xFFFFFFFFu; }
    else if (a < 0.0) {
        // Negative: round with selected mode; if it rounds up to 0 it's inexact (NX), else invalid (NV)
        double rounded = std::rint(a);
        if (rounded >= 0.0) { cpu.csr.data[CSR_FCSR] |= FFLAG_NX; result = (u32)rounded; }
        else                { cpu.csr.data[CSR_FCSR] |= FFLAG_NV; result = 0; }
    } else
        { feclearexcept(FE_ALL_EXCEPT); result = (u32)a; fp_accum_flags(cpu); }
    WR_RD(result)
})

// ---- Integer → FP Conversions (double) ----
imp(fcvt_d_w, FormatR, { // rv32d: signed int32 → double (always exact)
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    freg_write_d(cpu, ins.rd, (double)(int32_t)cpu.xreg[ins.rs1]);
})
imp(fcvt_d_wu, FormatR, { // rv32d: unsigned int32 → double (always exact)
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    freg_write_d(cpu, ins.rd, (double)(u32)cpu.xreg[ins.rs1]);
})

// ---- Cross-precision Conversions ----
imp(fcvt_s_d, FormatR, { // rv32d: double → single (may lose precision)
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    double d = freg_read_d(cpu, ins.rs1);
    if (std::isnan(d)) {
        // RISC-V: any NaN input → canonical NaN output; sNaN (quiet bit clear) also sets NV
        u64 dbits; memcpy(&dbits, &d, 8);
        if (!(dbits & (1ULL << 51))) cpu.csr.data[CSR_FCSR] |= FFLAG_NV;
        u32 qnan = 0x7FC00000u; float qnan_f; memcpy(&qnan_f, &qnan, 4);
        freg_write_s(cpu, ins.rd, qnan_f);
    } else {
        feclearexcept(FE_ALL_EXCEPT);
        freg_write_s(cpu, ins.rd, (float)d);
        fp_accum_flags(cpu);
    }
})
imp(fcvt_d_s, FormatR, { // rv32d: single → double (always exact)
    if (!fp_set_rm(ins_word, cpu.csr.data[CSR_FCSR])) FP_ILLEGAL_RM()
    float f = freg_read_s(cpu, ins.rs1);
    if (std::isnan(f)) {
        // RISC-V: any NaN input → canonical NaN output; sNaN (quiet bit clear) also sets NV
        u32 fbits; memcpy(&fbits, &f, 4);
        if (!(fbits & (1u << 22))) cpu.csr.data[CSR_FCSR] |= FFLAG_NV;
        u64 qnan = 0x7FF8000000000000ULL; double qnan_d; memcpy(&qnan_d, &qnan, 8);
        freg_write_d(cpu, ins.rd, qnan_d);
    } else {
        freg_write_d(cpu, ins.rd, (double)f);
    }
})

    ins_ret Emulator::insSelect(u32 ins_word)
{
    u32 ins_masked;
    ins_ret ret = cpu.insReturnNoop();

    FormatR ins_FormatR = parse_FormatR(ins_word);
    FormatI ins_FormatI = parse_FormatI(ins_word);
    FormatS ins_FormatS = parse_FormatS(ins_word);
    FormatU ins_FormatU = parse_FormatU(ins_word);
    FormatJ ins_FormatJ = parse_FormatJ(ins_word);
    FormatB ins_FormatB = parse_FormatB(ins_word);
    FormatCSR ins_FormatCSR = parse_FormatCSR(ins_word);
    FormatEmpty ins_FormatEmpty = parse_FormatEmpty(ins_word);

    if ((ins_word & 0x00000073) == 0x00000073)
    {
        // could be CSR instruction
        ins_FormatCSR.value = cpu.getCsr(ins_FormatCSR.csr, &ret);
    }

    ins_masked = ins_word & 0x0000007f;
    switch (ins_masked)
    {
        run(auipc, 0x00000017, ins_FormatU)
        run(jal, 0x0000006f, ins_FormatJ)
        run(lui, 0x00000037, ins_FormatU)
    }
    ins_masked = ins_word & 0x0000707f;
    switch (ins_masked)
    {
        run(addi, 0x00000013, ins_FormatI)
        run(andi, 0x00007013, ins_FormatI)
        run(beq, 0x00000063, ins_FormatB)
        run(bge, 0x00005063, ins_FormatB)
        run(bgeu, 0x00007063, ins_FormatB)
        run(blt, 0x00004063, ins_FormatB)
        run(bltu, 0x00006063, ins_FormatB)
        run(bne, 0x00001063, ins_FormatB)
        run(csrrc, 0x00003073, ins_FormatCSR)
        run(csrrci, 0x00007073, ins_FormatCSR)
        run(csrrs, 0x00002073, ins_FormatCSR)
        run(csrrsi, 0x00006073, ins_FormatCSR)
        run(csrrw, 0x00001073, ins_FormatCSR)
        run(csrrwi, 0x00005073, ins_FormatCSR)
        run(fence, 0x0000000f, ins_FormatEmpty)
        run(fence_i, 0x0000100f, ins_FormatEmpty)
        run(jalr, 0x00000067, ins_FormatI)
        run(lb, 0x00000003, ins_FormatI)
        run(lbu, 0x00004003, ins_FormatI)
        run(lh, 0x00001003, ins_FormatI)
        run(lhu, 0x00005003, ins_FormatI)
        run(lw, 0x00002003, ins_FormatI)
        run(flw, 0x00002007, ins_FormatI) // rv32f
        run(fld, 0x00003007, ins_FormatI) // rv32d
        run(ori, 0x00006013, ins_FormatI)
        run(sb, 0x00000023, ins_FormatS)
        run(sh, 0x00001023, ins_FormatS)
        run(fsw, 0x00002027, ins_FormatS) // rv32f
        run(fsd, 0x00003027, ins_FormatS) // rv32d
        run(slti, 0x00002013, ins_FormatI)
        run(sltiu, 0x00003013, ins_FormatI)
        run(sw, 0x00002023, ins_FormatS)
        run(xori, 0x00004013, ins_FormatI)
    }
    ins_masked = ins_word & 0xf800707f;
    switch (ins_masked)
    {
        run(amoswap_w, 0x0800202f, ins_FormatR)
        run(amoadd_w, 0x0000202f, ins_FormatR)
        run(amoxor_w, 0x2000202f, ins_FormatR)
        run(amoand_w, 0x6000202f, ins_FormatR)
        run(amoor_w, 0x4000202f, ins_FormatR)
        run(amomin_w, 0x8000202f, ins_FormatR)
        run(amomax_w, 0xa000202f, ins_FormatR)
        run(amominu_w, 0xc000202f, ins_FormatR)
        run(amomaxu_w, 0xe000202f, ins_FormatR)
        run(sc_w, 0x1800202f, ins_FormatR)
    }
    ins_masked = ins_word & 0xf9f0707f;
    switch (ins_masked)
    {
        run(lr_w, 0x1000202f, ins_FormatR)
    }
    ins_masked = ins_word & 0xfc00707f;
    switch (ins_masked)
    {
        run(slli, 0x00001013, ins_FormatR)
        run(srai, 0x40005013, ins_FormatR)
        run(srli, 0x00005013, ins_FormatR)
    }
    ins_masked = ins_word & 0xfe00707f;
    switch (ins_masked)
    {
        run(add, 0x00000033, ins_FormatR)
        run(and, 0x00007033, ins_FormatR)
        run(div, 0x02004033, ins_FormatR)
        run(divu, 0x02005033, ins_FormatR)
        run(mul, 0x02000033, ins_FormatR)
        run(mulh, 0x02001033, ins_FormatR)
        run(mulhsu, 0x02002033, ins_FormatR)
        run(mulhu, 0x02003033, ins_FormatR)
        run(or, 0x00006033, ins_FormatR)
        run(rem, 0x02006033, ins_FormatR)
        run(remu, 0x02007033, ins_FormatR)
        run(sll, 0x00001033, ins_FormatR)
        run(slt, 0x00002033, ins_FormatR)
        run(sltu, 0x00003033, ins_FormatR)
        run(sra, 0x40005033, ins_FormatR)
        run(srl, 0x00005033, ins_FormatR)
        run(sub, 0x40000033, ins_FormatR)
        run(xor, 0x00004033, ins_FormatR)
    }
    ins_masked = ins_word & 0xfe007fff;
    switch (ins_masked)
    {
        run(sfence_vma, 0x12000073, ins_FormatEmpty)
    }
    // ---- RV32F / RV32D new switch blocks ----

    // R4-type fused: match opcode + fmt bits[26:25] (00=S, 01=D)
    ins_masked = ins_word & 0x0600007f;
    switch (ins_masked)
    {
        run(fmadd_s,  0x00000043, ins_FormatR)
        run(fmsub_s,  0x00000047, ins_FormatR)
        run(fnmsub_s, 0x0000004b, ins_FormatR)
        run(fnmadd_s, 0x0000004f, ins_FormatR)
        run(fmadd_d,  0x02000043, ins_FormatR)
        run(fmsub_d,  0x02000047, ins_FormatR)
        run(fnmsub_d, 0x0200004b, ins_FormatR)
        run(fnmadd_d, 0x0200004f, ins_FormatR)
    }
    // fmv.x.w, fclass — match funct7 + rs2 + funct3
    ins_masked = ins_word & 0xfff0707f;
    switch (ins_masked)
    {
        run(fmv_x_w,  0xe0000053, ins_FormatR)
        run(fclass_s, 0xe0001053, ins_FormatR)
        run(fclass_d, 0xe2001053, ins_FormatR)
    }
    // fsqrt, fcvt, fmv.w.x — match funct7 + rs2 (no funct3)
    ins_masked = ins_word & 0xfff0007f;
    switch (ins_masked)
    {
        run(fsqrt_s,   0x58000053, ins_FormatR)
        run(fsqrt_d,   0x5a000053, ins_FormatR)
        run(fcvt_w_s,  0xc0000053, ins_FormatR)
        run(fcvt_wu_s, 0xc0100053, ins_FormatR)
        run(fcvt_s_w,  0xd0000053, ins_FormatR)
        run(fcvt_s_wu, 0xd0100053, ins_FormatR)
        run(fmv_w_x,   0xf0000053, ins_FormatR)
        run(fcvt_s_d,  0x40100053, ins_FormatR)
        run(fcvt_d_s,  0x42000053, ins_FormatR)
        run(fcvt_w_d,  0xc2000053, ins_FormatR)
        run(fcvt_wu_d, 0xc2100053, ins_FormatR)
        run(fcvt_d_w,  0xd2000053, ins_FormatR)
        run(fcvt_d_wu, 0xd2100053, ins_FormatR)
    }
    // fsgnj, fmin/max, feq/flt/fle — match funct7 + funct3
    ins_masked = ins_word & 0xfe00707f;
    switch (ins_masked)
    {
        run(fsgnj_s,  0x20000053, ins_FormatR)
        run(fsgnjn_s, 0x20001053, ins_FormatR)
        run(fsgnjx_s, 0x20002053, ins_FormatR)
        run(fmin_s,   0x28000053, ins_FormatR)
        run(fmax_s,   0x28001053, ins_FormatR)
        run(feq_s,    0xa0002053, ins_FormatR)
        run(flt_s,    0xa0001053, ins_FormatR)
        run(fle_s,    0xa0000053, ins_FormatR)
        run(fsgnj_d,  0x22000053, ins_FormatR)
        run(fsgnjn_d, 0x22001053, ins_FormatR)
        run(fsgnjx_d, 0x22002053, ins_FormatR)
        run(fmin_d,   0x2a000053, ins_FormatR)
        run(fmax_d,   0x2a001053, ins_FormatR)
        run(feq_d,    0xa2002053, ins_FormatR)
        run(flt_d,    0xa2001053, ins_FormatR)
        run(fle_d,    0xa2000053, ins_FormatR)
    }
    // fadd/fsub/fmul/fdiv — match funct7 only
    ins_masked = ins_word & 0xfe00007f;
    switch (ins_masked)
    {
        run(fadd_s, 0x00000053, ins_FormatR)
        run(fsub_s, 0x08000053, ins_FormatR)
        run(fmul_s, 0x10000053, ins_FormatR)
        run(fdiv_s, 0x18000053, ins_FormatR)
        run(fadd_d, 0x02000053, ins_FormatR)
        run(fsub_d, 0x0a000053, ins_FormatR)
        run(fmul_d, 0x12000053, ins_FormatR)
        run(fdiv_d, 0x1a000053, ins_FormatR)
    }

    ins_masked = ins_word & 0xffffffff;
    switch (ins_masked)
    {
        run(ebreak, 0x00100073, ins_FormatEmpty)
        run(ecall, 0x00000073, ins_FormatEmpty)
        run(mret, 0x30200073, ins_FormatEmpty)
        run(sret, 0x10200073, ins_FormatEmpty)
        run(uret, 0x00200073, ins_FormatEmpty)
        run(wfi, 0x10500073, ins_FormatEmpty)
    }

    print_inst(cpu.pc, ins_word);
    printf("Invalid instruction: %08x\n", ins_word);
    exit(EXIT_FAILURE);
    ret.trap.en = true;
    ret.trap.type = trap_IllegalInstruction;
    ret.trap.value = ins_word;
    return ret;
}

////////////////////////////////////////////////////////////////
// Emulator Functions
////////////////////////////////////////////////////////////////
Emulator::Emulator(/* args */)
{
}

Emulator::~Emulator()
{
}

u8 Emulator::getFileSize(const char *path)
{
    struct stat st;
    stat(path, &st);
    return st.st_size;
}

u8 Emulator::getMmapPtr(const char *path)
{
    // TODO: implement mmap-based file loading
    (void)path;
    return 0;
}

void Emulator::initialize()
{
    printf("INFO: Emulator started\n");
#ifndef __EMSCRIPTEN__
    captureKeyboardInput();
#endif
    cpu = RV32();
    memory = (uint8_t *)malloc(MEM_SIZE);
    cpu.init(memory, NULL, debugMode);
}

void Emulator::initializeElf(const char *path)
{
    initialize();
    // Load ELF image
    if (loadElf(path, strlen(path) + 1, memory, MEM_SIZE) != 0)
        return;

    cpu.init(memory, NULL, debugMode);
    elf_file_path = path;
    ready_to_run = true;
}

void Emulator::initializeElfDts(const char *elf_file, const char *dts_file)
{
    initialize();
    // Load ELF image
    if (loadElf(elf_file, strlen(elf_file) + 1, memory, MEM_SIZE) != 0)
        return;

    // cpu.init(memory, dts, debugMode);
    elf_file_path = elf_file;
    ready_to_run = true;
}

void Emulator::initializeBin(const char *path)
{
    initialize();
    // Zero memory for a clean boot
    memset(memory, 0, MEM_SIZE);

    // Load Linux kernel binary at memory[0] (maps to CPU VA 0x80000000)
    if (loadLinuxImage(path, strlen(path) + 1, memory, MEM_SIZE) != 0)
        return;

    // Place default DTB at end of RAM
    uint32_t dtb_size   = (uint32_t)sizeof(default64mbdtb);
    uint32_t dtb_offset = (uint32_t)MEM_SIZE - dtb_size;
    memcpy(memory + dtb_offset, default64mbdtb, dtb_size);

    // Patch DTB memory-size field (offset 0x13c contains magic 0x00c0ff03)
    // uint32_t *dtb_u32 = (uint32_t *)(memory + dtb_offset);
    // if (dtb_u32[0x13c / 4] == 0x00c0ff03u)
    // {
    //     uint32_t v = dtb_offset; // usable RAM = offset of DTB from base
    //     dtb_u32[0x13c / 4] = (v >> 24) |
    //                           (((v >> 16) & 0xff) << 8) |
    //                           (((v >>  8) & 0xff) << 16) |
    //                           ((v & 0xff) << 24);
    // }

    // Re-init CPU for Linux boot
    cpu.init(memory, NULL, debugMode);
    cpu.xreg[10] = 0;                        // hart ID
    cpu.xreg[11] = 0x80000000u + dtb_offset; // DTB virtual address

    bin_file_path = path;
    ready_to_run = true;
}



void Emulator::emulate()
{
    cpu.tick();

    u32 ins_word = 0;
    ins_ret ret = cpu.insReturnNoop();

    if ((cpu.pc & 0x3) == 0)
    {
        // Fetch through MMU
        u32 phys_pc = cpu.mmuTranslate(&ret, cpu.pc, MMU_ACCESS_FETCH);
        if (!ret.trap.en)
        {
            ins_word = cpu.memGetWord(phys_pc);
            ret = insSelect(ins_word);

            if (ret.csr_write && !ret.trap.en)
                cpu.setCsr(ret.csr_write, ret.csr_val, &ret);

            if (!ret.trap.en && ret.write_reg < 32 && ret.write_reg > 0)
                cpu.xreg[ret.write_reg] = ret.write_val;
        }
    }
    else
    {
        ret.trap.en    = true;
        ret.trap.type  = trap_InstructionAddressMisaligned;
        ret.trap.value = cpu.pc;
    }

    if (debugMode)
        print_inst(cpu.pc, ins_word);

    // Handle CLINT MSIP
    if (cpu.clint.msip)
        cpu.csr.data[CSR_MIP] |= MIP_MSIP;

    // Update CLINT mtime from wall-clock — throttled to every 1024 instructions
    // to avoid a gettimeofday() syscall on every emulated instruction.
    if ((cpu.clock & 0x3FF) == 0)
    {
        struct timeval now;
        gettimeofday(&now, NULL);
        int64_t elapsed_usec = ((int64_t)now.tv_sec  - cpu.start_time_sec)  * 1000000LL
                             + ((int64_t)now.tv_usec - cpu.start_time_usec);
        uint64_t mtime = (uint64_t)elapsed_usec;
        cpu.clint.mtime_lo = (u32)(mtime & 0xFFFFFFFFu);
        cpu.clint.mtime_hi = (u32)(mtime >> 32);
    }

    // Set MTIP when mtime >= mtimecmp (guard: don't fire when mtimecmp == 0)
    if ((cpu.clint.mtimecmp_lo != 0 || cpu.clint.mtimecmp_hi != 0) &&
        (cpu.clint.mtime_hi > cpu.clint.mtimecmp_hi ||
         (cpu.clint.mtime_hi == cpu.clint.mtimecmp_hi &&
          cpu.clint.mtime_lo >= cpu.clint.mtimecmp_lo)))
    {
        cpu.csr.data[CSR_MIP] |= MIP_MTIP;
    }

    // UART tick + external interrupt
    cpu.uartTick();
    u32 cur_mip = cpu.readCsrRaw(CSR_MIP);
    if (!(cur_mip & MIP_SEIP))
    {
        if (cpu.uart.interrupting)
        {
            cpu.writeCsrRaw(CSR_MIP, cur_mip | MIP_SEIP);
        }
        else if (cpu.net.rx_ready)
        {
            // Network RX interrupt (no-op when net not connected)
            uint8_t *net_data = nullptr;
            uint32_t net_data_len = 0;
            if (net_recv(&net_data, &net_data_len))
            {
                cpu.writeCsrRaw(CSR_MIP, cur_mip | MIP_SEIP);
                if (net_data_len > 4096u - sizeof(u32))
                    net_data_len = 4096u - sizeof(u32);
                *((u32 *)cpu.net.netrx) = net_data_len;
                memcpy(cpu.net.netrx + sizeof(u32), net_data, net_data_len);
                cpu.net.rx_ready = 0;
                free(net_data);
            }
        }
    }

    cpu.handleIrqAndTrap(&ret);

    // Handle SYSCON poweroff/reboot
    if (cpu.syscon_cmd != 0)
    {
        u32 cmd = cpu.syscon_cmd;
        cpu.syscon_cmd = 0;
        if (cmd == 0x5555)
        {
            printf("INFO: SYSCON POWEROFF\n");
            running = false;
            ready_to_run = false;
        }
        else if (cmd == 0x7777)
        {
            printf("INFO: SYSCON REBOOT\n");
            initializeBin(bin_file_path.c_str());
            return; // initializeBin reset CPU state; don't overwrite pc
        }
    }

    // Advance PC (ret.pc_val defaults to pc+4)
    cpu.pc = ret.pc_val;
}