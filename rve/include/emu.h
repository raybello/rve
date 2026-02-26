#ifndef EMU_H
#define EMU_H

#include <cstdint>
#include <cstdlib>
#include <sys/mman.h>
#include "rv32.h"
#include "loader.h"
#include "disasm.h"

using u32 = uint32_t;
using uint16 = uint16_t;
using u8 = uint8_t;

// Instruction Decoding
u32 signExtend(u32 x, u32 b);

typedef struct
{
    u32 rs1;
    u32 rs2;
    u32 imm;
} FormatB;

FormatB parse_FormatB(u32 word);

typedef struct
{
    u32 csr;
    u32 rs;
    u32 rd;
    u32 value;
} FormatCSR;

FormatCSR parse_FormatCSR(u32 word);

typedef struct
{
    u32 rd;
    u32 rs1;
    u32 imm;
} FormatI;

FormatI parse_FormatI(u32 word);

typedef struct
{
    u32 rd;
    u32 imm;
} FormatJ;

FormatJ parse_FormatJ(u32 word);

typedef struct
{
    u32 rd;
    u32 rs1;
    u32 rs2;
    u32 rs3;
} FormatR;

FormatR parse_FormatR(u32 word);

typedef struct
{
    u32 rs1;
    u32 rs2;
    u32 imm;
} FormatS;

FormatS parse_FormatS(u32 word);

typedef struct
{
    u32 rd;
    u32 imm;
} FormatU;

FormatU parse_FormatU(u32 word);

typedef struct
{
} FormatEmpty;

FormatEmpty parse_FormatEmpty(u32 word);



// Emulator
#define def(name, fmt_t) \
    void emu_##name(u32 ins_word, ins_ret *ret, fmt_t ins)


class Emulator
{
public:
    int MEM_SIZE = 1024 * 1024 * 128; // 128MiB

    uint8_t *memory;
    RV32 cpu;

    // Filenames
    std::string elf_file_path = "no elf selected";
    std::string dts_file_path = "no dts selected";
    std::string bin_file_path = "no image selected";

    // debugging
    bool debugMode = false;
    bool running = false;

    // Control
    bool ready_to_run = false;

    // Clock frequency
    int clk_freq_sel = -1; // Hertz
    // int clk_freq_sel = 10; // Hertz

    float time_sum = 0;
    float sec_per_cycle = 1.0 / clk_freq_sel;

    Emulator(/* args */);
    ~Emulator();

    void initialize();
    void initializeBin(const char *path);
    void initializeElf(const char *path);
    void initializeElfDts(const char *elf_file, const char *dts_file);
    void emulate(); // formerly cpu_tick
    ins_ret insSelect(u32 ins_word);

    // File utilities
    u8 getMmapPtr(const char *path);
    u8 getFileSize(const char *path);

    // Instruction defintion
    def(add, FormatR); // rv32i
    def(addi, FormatI);      // rv32i
    def(amoswap_w, FormatR); // rv32a
    def(amoadd_w, FormatR); // rv32a
    def(amoxor_w, FormatR); // rv32a
    def(amoand_w, FormatR);  // rv32a
    def(amoor_w, FormatR);  // rv32a
    def(amomin_w, FormatR);  // rv32a
    def(amomax_w, FormatR);  // rv32a
    def(amominu_w, FormatR);  // rv32a
    def(amomaxu_w, FormatR);  // rv32a
    def(and, FormatR); // rv32i
    def(andi, FormatI); // rv32i
    def(auipc, FormatU); // rv32i
    def(beq, FormatB);  // rv32i
    def(bge, FormatB);  // rv32i
    def(bgeu, FormatB);  // rv32i
    def(blt, FormatB);  // rv32i
    def(bltu, FormatB);  // rv32i
    def(bne, FormatB);  // rv32i
    def(csrrc, FormatCSR);  // system
    def(csrrci, FormatCSR);  // system
    def(csrrs, FormatCSR);  // system
    def(csrrsi, FormatCSR);  // system
    def(csrrw, FormatCSR);  // system
    def(csrrwi, FormatCSR);  // system
    def(div, FormatR);  // rv32m
    def(divu, FormatR);  // rv32m
    def(ebreak, FormatEmpty);  // rv32i
    def(ecall, FormatEmpty);  // system
    def(fence, FormatEmpty); // rv32i
    def(fence_i, FormatEmpty);  // rv32i
    def(jal, FormatJ);  // rv32i
    def(jalr, FormatI);  // rv32i
    def(lb, FormatI);  // rv32i
    def(lbu, FormatI);  // rv32i
    def(lh, FormatI);  // rv32i
    def(lhu, FormatI);  // rv32i
    def(lr_w, FormatR);  // rv32a
    def(lui, FormatU); // rv32i
    def(lw, FormatI);  // rv32i
    def(mret, FormatEmpty);  // system
    def(mul, FormatR);  // rv32m
    def(mulh, FormatR);  // rv32m
    def(mulhsu, FormatR);  // rv32m
    def(mulhu, FormatR);  // rv32m
    def(or, FormatR); // rv32i
    def(ori, FormatI); // rv32i
    def(rem, FormatR);  // rv32m
    def(remu, FormatR);  // rv32m
    def(sb, FormatS);  // rv32i
    def(sc_w, FormatR);  // rv32a
    def(sfence_vma, FormatEmpty); // system
    def(sh, FormatS);  // rv32i
    def(sll, FormatR); // rv32i
    def(slli, FormatR);  // rv32i
    def(slt, FormatR);  // rv32i
    def(slti, FormatI);  // rv32i
    def(sltiu, FormatI);  // rv32i
    def(sltu, FormatR);  // rv32i
    def(sra, FormatR);  // rv32i
    def(srai, FormatR);  // rv32i
    def(sret, FormatEmpty);  // system
    def(srl, FormatR); // rv32i
    def(srli, FormatR);  // rv32i
    def(sub, FormatR);  // rv32i
    def(sw, FormatS);  // rv32i
    def(uret, FormatEmpty); // system
    def(wfi, FormatEmpty); // system
    def(xor, FormatR); // rv32i
    def(xori, FormatI); // rv32i
};

#endif