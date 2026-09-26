// Unit tests for the profiler's pure logic: instruction classification, the sampled-PC table,
// the history ring, counter invariants and ELF symbol lookup. No GUI or emulator needed.
//   usage: profiler_test <path to an ISA-test ELF>
#include "profiler.h"
#include "loader.h"
#include <cstdio>
#include <cstdlib>
#include <string>

#ifndef RVE_PROFILE
int main() { printf("profiler_test: built without profiling, skipped\n"); return 0; }
#else

static int failures = 0;
#define CHECK(cond)                                                              \
    do {                                                                         \
        if (!(cond)) { printf("FAIL %s:%d  %s\n", __FILE__, __LINE__, #cond); failures++; } \
    } while (0)

static void testClassify()
{
    struct { uint32_t ins; unsigned cls; const char *what; } cases[] = {
        {0x00B50533, PIC_ALU, "add"},       {0x00150513, PIC_ALU, "addi"},   {0x0015051B, PIC_ALU, "addiw"},
        {0x02051513, PIC_ALU, "slli a0,a0,32 (bit 25 set, not M)"},
        {0x02B50533, PIC_MUL, "mul"},       {0x02B5053B, PIC_MUL, "mulw"},   {0x02B54533, PIC_DIV, "div"},
        {0x02B5453B, PIC_DIV, "divw"},      {0x00052503, PIC_LOAD, "lw"},    {0x00052507, PIC_LOAD, "flw"},
        {0x00A5A023, PIC_STORE, "sw"},      {0x00B50463, PIC_BRANCH, "beq"}, {0x0000006F, PIC_JAL, "jal"},
        {0x00008067, PIC_JALR, "jalr"},     {0x000012B7, PIC_UPPER, "lui"},  {0x00001297, PIC_UPPER, "auipc"},
        {0x30529073, PIC_CSR, "csrrw"},     {0x00000073, PIC_SYSTEM, "ecall"}, {0x30200073, PIC_SYSTEM, "mret"},
        {0x00B5252F, PIC_ATOMIC, "amoadd.w"}, {0x00B57553, PIC_FP, "fadd.s"}, {0x0FF0000F, PIC_FENCE, "fence"},
    };
    for (auto &c : cases)
        if (prof_classify(c.ins) != c.cls)
        {
            printf("FAIL classify %s: got %s want %s\n", c.what, prof_class_name(prof_classify(c.ins)), prof_class_name(c.cls));
            failures++;
        }
}

static void testHotspots()
{
    ProfHotspots h;
    for (int i = 0; i < 100; i++) h.add(0x80001000);
    for (int i = 0; i < 7; i++) h.add(0x80002000);
    CHECK(h.total == 107 && h.distinct == 2 && h.dropped == 0);
    uint64_t n1 = 0, n2 = 0;
    for (auto &e : h.tab)
    {
        if (e.n && e.pc == 0x80001000) n1 = e.n;
        if (e.n && e.pc == 0x80002000) n2 = e.n;
    }
    CHECK(n1 == 100 && n2 == 7);
    // overflow: far more distinct PCs than slots must drop, never overwrite or crash
    for (uint64_t i = 0; i < 100000; i++) h.add(0x90000000ull + i * 4);
    CHECK(h.distinct <= ((uint64_t)3 << (ProfHotspots::BITS - 2)));
    CHECK(h.dropped > 0);
    uint64_t sum = 0;
    for (auto &e : h.tab) sum += e.n;
    CHECK(sum + h.dropped == h.total);
    h.clear();
    CHECK(h.total == 0 && h.distinct == 0 && h.tab.empty());
}

static void testSeries()
{
    ProfSeries s;
    s.init(8);
    CHECK(s.count == 0 && s.last() == 0);
    for (int i = 0; i < 20; i++) s.push((float)i, (float)i * 2);
    CHECK(s.count == 8);
    CHECK(s.last() == 38.0f);
    // oldest sample first when read from offset(): x = 12..19
    CHECK(s.x[s.offset()] == 12.0f);
    CHECK(s.maxValue() == 38.0f);
}

static void testCheck()
{
    ProfCounters c;
    c.insns[PIC_ALU] = 990;
    c.insns[PIC_LOAD] = 10;
    c.mem[2][0] = 10;
    c.samples = 1000 / PROF_SAMPLE_PERIOD;
    c.priv_samples[3] = c.samples;
    std::string why;
    CHECK(prof_check(c, 1000, true, why));
    CHECK(!prof_check(c, 1001, true, why)); // one instruction unaccounted for
    why.clear();
    c.mem[2][1] = 1; // a store with no store instruction
    CHECK(!prof_check(c, 1000, true, why));
    CHECK(why.find("writes") != std::string::npos);
}

static void testSymbols(const char *elf)
{
    std::vector<ElfSymbol> syms;
    CHECK(loadElfSymbols(elf, syms) == 0);
    CHECK(!syms.empty());
    for (size_t i = 1; i < syms.size(); i++)
        CHECK(syms[i - 1].addr <= syms[i].addr); // sorted
    const ElfSymbol *start = nullptr;
    for (auto &s : syms)
        if (s.name == "_start") start = &s;
    CHECK(start != nullptr);
    if (start)
    {
        const ElfSymbol *f = findElfSymbol(syms, start->addr);
        CHECK(f && f->name == "_start");
        f = findElfSymbol(syms, start->addr + 4);
        CHECK(f != nullptr);
    }
    CHECK(findElfSymbol(syms, 0x10) == nullptr); // below every symbol
    CHECK(findElfSymbol(syms, 0xffffffffffe02140ull) == nullptr); // far above every label: not attributed to _end
    std::vector<ElfSymbol> none;
    CHECK(loadElfSymbols("/nonexistent/file.elf", none) != 0);
}

int main(int argc, char **argv)
{
    testClassify();
    testHotspots();
    testSeries();
    testCheck();
    if (argc > 1)
        testSymbols(argv[1]);
    if (failures)
    {
        printf("profiler_test: %d failure(s)\n", failures);
        return 1;
    }
    printf("profiler_test: OK\n");
    return 0;
}
#endif
