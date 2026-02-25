#include "emu.h"


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
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1]);
    cpu.memSetWord(cpu.xreg[ins.rs1], cpu.xreg[ins.rs2]);
    WR_RD(tmp)
}) imp(amoadd_w, FormatR, { // rv32a
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1]);
    cpu.memSetWord(cpu.xreg[ins.rs1], cpu.xreg[ins.rs2] + tmp);
    WR_RD(tmp)
}) imp(amoxor_w, FormatR, { // rv32a
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1]);
    cpu.memSetWord(cpu.xreg[ins.rs1], cpu.xreg[ins.rs2] ^ tmp);
    WR_RD(tmp)
}) imp(amoand_w, FormatR, { // rv32a
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1]);
    cpu.memSetWord(cpu.xreg[ins.rs1], cpu.xreg[ins.rs2] & tmp);
    WR_RD(tmp)
}) imp(amoor_w, FormatR, { // rv32a
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1]);
    cpu.memSetWord(cpu.xreg[ins.rs1], cpu.xreg[ins.rs2] | tmp);
    WR_RD(tmp)
}) imp(amomin_w, FormatR, { // rv32a
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1]);
    u32 sec = cpu.xreg[ins.rs2];
    cpu.memSetWord(cpu.xreg[ins.rs1], AS_SIGNED(sec) < AS_SIGNED(tmp) ? sec : tmp);
    WR_RD(tmp)
}) imp(amomax_w, FormatR, { // rv32a
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1]);
    u32 sec = cpu.xreg[ins.rs2];
    cpu.memSetWord(cpu.xreg[ins.rs1], AS_SIGNED(sec) > AS_SIGNED(tmp) ? sec : tmp);
    WR_RD(tmp)
}) imp(amominu_w, FormatR, { // rv32a
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1]);
    u32 sec = cpu.xreg[ins.rs2];
    cpu.memSetWord(cpu.xreg[ins.rs1], sec < tmp ? sec : tmp);
    WR_RD(tmp)
}) imp(amomaxu_w, FormatR, { // rv32a
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1]);
    u32 sec = cpu.xreg[ins.rs2];
    cpu.memSetWord(cpu.xreg[ins.rs1], sec > tmp ? sec : tmp);
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
        printf("ecall EXIT = %d (0x%x)\n", status, status);

        #ifndef __EMSCRIPTEN__
        exit(status);
        #else
        printf("Exit called in WebAssembly environment. Ignoring exit and halting execution.\n");
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
    u32 tmp = signExtend(cpu.memGetByte(cpu.xreg[ins.rs1] + ins.imm), 8);
    WR_RD(tmp)
}) imp(lbu, FormatI, { // rv32i
    u32 tmp = cpu.memGetByte(cpu.xreg[ins.rs1] + ins.imm);
    WR_RD(tmp)
}) imp(lh, FormatI, { // rv32i
    u32 tmp = signExtend(cpu.memGetHalfWord(cpu.xreg[ins.rs1] + ins.imm), 16);
    WR_RD(tmp)
}) imp(lhu, FormatI, { // rv32i
    u32 tmp = cpu.memGetHalfWord(cpu.xreg[ins.rs1] + ins.imm);
    WR_RD(tmp)
}) imp(lr_w, FormatR, { // rv32a
    u32 addr = cpu.xreg[ins.rs1];
    u32 tmp = cpu.memGetWord(addr);
    cpu.reservation_en = true;
    cpu.reservation_addr = addr;
    WR_RD(tmp)
}) imp(lui, FormatU, {                                    // rv32i
                      WR_RD(ins.imm)}) imp(lw, FormatI, { // rv32i
    // would need sign extend for xlen > 32
    u32 tmp = cpu.memGetWord(cpu.xreg[ins.rs1] + ins.imm);
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
    cpu.memSetByte(cpu.xreg[ins.rs1] + ins.imm, cpu.xreg[ins.rs2]);
}) imp(sc_w, FormatR, { // rv32a
    // I'm pretty sure this is not it chief, but it does the trick for now
    u32 addr = cpu.xreg[ins.rs1];
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
    cpu.memSetHalfWord(cpu.xreg[ins.rs1] + ins.imm, cpu.xreg[ins.rs2]);
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
    cpu.memSetWord(cpu.xreg[ins.rs1] + ins.imm, cpu.xreg[ins.rs2]);
}) imp(uret, FormatEmpty, {
                              // system
                              // unnecessary?
                          }) imp(wfi, FormatEmpty, {
                                                       // system
                                                       // no-op is valid here, so skip
                                                   }) imp(xor, FormatR, {                                                                   // rv32i
                                                                         WR_RD(cpu.xreg[ins.rs1] ^ cpu.xreg[ins.rs2])}) imp(xori, FormatI, {// rv32i
                                                                                                                                            WR_RD(cpu.xreg[ins.rs1] ^ ins.imm)})

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
        run(ori, 0x00006013, ins_FormatI)
        run(sb, 0x00000023, ins_FormatS)
        run(sh, 0x00001023, ins_FormatS)
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

    printf("Invalid instruction: %08x\n", ins_word);
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
    // Load binary image
    // loadBin()
}

void print_inst(uint64_t pc, uint32_t inst)
{
    char buf[80] = {0};
    disasm_inst(buf, sizeof(buf), rv64, pc, inst);
    printf("%016" PRIx64 ":  %s\n", pc, buf);
}

void Emulator::emulate()
{
    cpu.tick();

    uint32_t ins_word = 0;
    ins_ret ret;

    if ((cpu.pc & 0x3) == 0)
    {
        ins_word = cpu.memGetWord(cpu.pc);

        ret = insSelect(ins_word);

        if (ret.csr_write && !ret.trap.en)
        {
            cpu.setCsr(ret.csr_write, ret.csr_val, &ret);
        }

        if (!ret.trap.en && ret.write_reg < 32 && ret.write_reg > 0)
        {
            cpu.xreg[ret.write_reg] = ret.write_val;
        }
    }
    else
    {
        ret = cpu.insReturnNoop();
        ret.trap.en = true;
        ret.trap.type = trap_InstructionAddressMisaligned;
        ret.trap.value = cpu.pc;
    }

    if (debugMode)
        print_inst(cpu.pc, ins_word);

    // if (ret.trap.en)
    // {
    //     cpu.handleTrap(&ret, false);
    // }

    // handle CLINT IRQs
    if (cpu.clint.msip)
    {
        cpu.csr.data[CSR_MIP] |= MIP_MSIP;
    }

    cpu.clint.mtime_lo++;
    cpu.clint.mtime_hi += cpu.clint.mtime_lo == 0 ? 1 : 0;

    if (cpu.clint.mtimecmp_lo != 0 && cpu.clint.mtimecmp_hi != 0 && (cpu.clint.mtime_hi > cpu.clint.mtimecmp_hi || (cpu.clint.mtime_hi == cpu.clint.mtimecmp_hi && cpu.clint.mtime_lo >= cpu.clint.mtimecmp_lo)))
    {
        cpu.csr.data[CSR_MIP] |= MIP_MTIP;
    }

    cpu.uartTick();
    if (cpu.uart.interrupting)
    {
        u32 cur_mip = cpu.readCsrRaw(CSR_MIP);
        cpu.writeCsrRaw(CSR_MIP, cur_mip | MIP_SEIP);
    }

    cpu.handleIrqAndTrap(&ret);

    // ret.pc_val should be set to pc+4 by default
    cpu.pc = ret.pc_val;

    // cpu.dump();

}