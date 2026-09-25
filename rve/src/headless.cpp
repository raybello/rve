#include "stdio.h"
#include "headless.h"
#include "emu.h"
#include "net.h"
#include <cstring>
#include <cstdlib>

// Headless emulation loop.
// Flags:
//   -b <image>   raw binary image to boot          -e <elf>   load an ELF (ISA tests)
//   -s <path>    Unix socket, act as server (player 0)
//   -S <path>    Unix socket, connect as client (player 1)
//   -t           ISA-test mode: exit 0 = pass, 1 = fail, 2 = timeout;  -c <n> sets the watchdog
//   -T           trace every instruction;  -x <addr> dump CPU state + memory on exit (test mode)
// The emulator's captureKeyboardInput() (called from Emulator::initialize()) puts the
// terminal into raw mode so every keystroke is immediately visible to the guest OS.
int runHeadless(int argc, char *argv[])
{
    Emulator emu;

    const char *bin_file = nullptr;
    const char *elf_file = nullptr;
    uint64_t max_instr = 20000000ull; // ISA-test watchdog
    const char *net_server = nullptr;
    const char *net_client = nullptr;
    uint64_t dump_addr = 0;           // -x <addr>: print 64 bytes at this guest address on exit
    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "-b") == 0 && i + 1 < argc)
            bin_file = argv[++i];
        else if (strcmp(argv[i], "-e") == 0 && i + 1 < argc)
            elf_file = argv[++i];
        else if (strcmp(argv[i], "-t") == 0)
            emu.test_mode = true;
        else if (strcmp(argv[i], "-T") == 0)
            emu.debugMode = true; // trace every instruction
        else if (strcmp(argv[i], "-s") == 0 && i + 1 < argc)
            net_server = argv[++i];
        else if (strcmp(argv[i], "-S") == 0 && i + 1 < argc)
            net_client = argv[++i];
        else if (strcmp(argv[i], "-x") == 0 && i + 1 < argc)
            dump_addr = strtoull(argv[++i], nullptr, 0);
        else if (strcmp(argv[i], "-c") == 0 && i + 1 < argc)
            max_instr = strtoull(argv[++i], nullptr, 0);
    }

    if (!bin_file && !elf_file)
    {
        fprintf(stderr, "ERRO: headless mode requires -b <image> or -e <elf>\n");
        return 1;
    }

    if (net_server)
        net_init(net_server, /*server=*/true);
    else if (net_client)
        net_init(net_client, /*server=*/false);

    if (elf_file)
        emu.initializeElf(elf_file);
    else
        emu.initializeBin(bin_file);
    if (!emu.ready_to_run)
    {
        fprintf(stderr, "ERRO: failed to load image\n");
        return 1;
    }

    emu.running = true;

    if (emu.test_mode)
    {
        // ISA-test run: exit 0 = pass, 1 = fail, 2 = timeout
        uint64_t n = 0;
        while (emu.running && n++ < max_instr)
            emu.emulate();
        if (dump_addr)
        {
            printf("pc=%llx x10=%llx x11=%llx  mem@%llx:", (unsigned long long)emu.cpu.pc,
                   (unsigned long long)emu.cpu.xreg[10], (unsigned long long)emu.cpu.xreg[11],
                   (unsigned long long)dump_addr);
            for (int k = 0; k < 64; k++)
                printf("%s%02x", (k % 8 == 0) ? "\n  " : " ", emu.cpu.memGetByte(dump_addr + k));
            printf("\n  priv=%u mstatus=%llx mtvec=%llx mepc=%llx mcause=%llx mtval=%llx mie=%llx mip=%llx medeleg=%llx mideleg=%llx\n",
                   emu.cpu.csr.privilege, (unsigned long long)emu.cpu.readCsrRaw(CSR_MSTATUS),
                   (unsigned long long)emu.cpu.readCsrRaw(CSR_MTVEC), (unsigned long long)emu.cpu.readCsrRaw(CSR_MEPC),
                   (unsigned long long)emu.cpu.readCsrRaw(CSR_MCAUSE), (unsigned long long)emu.cpu.readCsrRaw(CSR_MTVAL),
                   (unsigned long long)emu.cpu.readCsrRaw(CSR_MIE), (unsigned long long)emu.cpu.readCsrRaw(CSR_MIP),
                   (unsigned long long)emu.cpu.readCsrRaw(CSR_MEDELEG), (unsigned long long)emu.cpu.readCsrRaw(CSR_MIDELEG));
        }
        if (!emu.test_done)
        {
            printf("TIMEOUT after %llu instructions\n", (unsigned long long)max_instr);
            return 2;
        }
        if (emu.test_result != 0)
        {
            // riscv-tests encode a failure as (test case number << 1) | 1
            printf("FAILED test case %llu\n", (unsigned long long)(emu.test_result >> 1));
            return 1;
        }
        return 0;
    }

    // Run as fast as possible
    // UART output goes to stdout, UART input comes from stdin (raw mode).
    while (emu.running)
        emu.emulate();

    return 0;
}
