#include "stdio.h"
#include "headless.h"
#include "emu.h"
#include "net.h"
#include "netsetup.h"
#include <cstring>
#include <cstdlib>
#include <chrono>

// Headless emulation loop.
// Flags:
//   -b <image>   raw binary image to boot          -e <elf>   load an ELF (ISA tests)
//   -s <path>    Unix socket, act as server (player 0)
//   -S <path>    Unix socket, connect as client (player 1)
//   -F           virtio-net backed by the userspace stack with the deterministic fake host (tests)
//   --no-net     disconnect the virtio-net NIC (by default native builds use the host's network)
//   -t           ISA-test mode: exit 0 = pass, 1 = fail, 2 = timeout;  -c <n> sets the watchdog
//   -T           trace every instruction;  -x <addr> dump CPU state + memory on exit (test mode)
//   --profile              print a JSON profiling summary (counters, host-time split, hotspots) to stderr at exit
//   --profile-out <file>   write that JSON to a file instead
//   --profile-check        verify the profiler's counter invariants at exit; exit status 3 if one is violated
// The emulator's captureKeyboardInput() (called from Emulator::initialize()) puts the
// terminal into raw mode so every keystroke is immediately visible to the guest OS.
int runHeadless(int argc, char *argv[])
{
    Emulator emu;

    const char *bin_file = nullptr;
    const char *elf_file = nullptr;
    uint64_t max_instr = 20000000ull; // ISA-test watchdog
    const char *net_server = nullptr;
    bool net_fake = false, net_off = false;
    const char *net_client = nullptr;
    uint64_t dump_addr = 0;           // -x <addr>: print 64 bytes at this guest address on exit
    bool prof_print = false, prof_check_flag = false;
    const char *prof_out = nullptr;
    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "-b") == 0 && i + 1 < argc)
            bin_file = argv[++i];
        else if (strcmp(argv[i], "-e") == 0 && i + 1 < argc)
            elf_file = argv[++i];
        else if (strcmp(argv[i], "-t") == 0)
            emu.test_mode = true;
        else if (strcmp(argv[i], "-F") == 0)
            net_fake = true;
        else if (strcmp(argv[i], "--no-net") == 0)
            net_off = true;
        else if (strcmp(argv[i], "--profile") == 0)
            prof_print = true;
        else if (strcmp(argv[i], "--profile-out") == 0 && i + 1 < argc)
            prof_out = argv[++i];
        else if (strcmp(argv[i], "--profile-check") == 0)
            prof_check_flag = true;
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

    net_attach_usernet(emu.cpu, net_fake, !net_off);

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

    // Emits the requested profiling output and folds a failed invariant check into the exit status
    auto t_start = std::chrono::steady_clock::now();
    auto finish = [&](int rc) {
        (void)t_start;
        if (!prof_print && !prof_out && !prof_check_flag)
            return rc;
#ifdef RVE_PROFILE
        double wall = std::chrono::duration<double>(std::chrono::steady_clock::now() - t_start).count();
        if (prof_check_flag)
        {
            std::string report;
            if (!prof_check(emu.cpu.prof, emu.cpu.clock, emu.cpu.prof_sampling, report))
            {
                fprintf(stderr, "PROFILE CHECK FAILED:\n%s", report.c_str());
                return 3;
            }
            fprintf(stderr, "profile check ok (%llu instructions)\n", (unsigned long long)emu.cpu.clock);
        }
        if (prof_print || prof_out)
        {
            Profiler p;
            p.attach(&emu.cpu.prof_hot, &emu.symbols);
            std::string json = p.summaryJson(emu.cpu.prof, emu.cpu.vnet.stats, emu.cpu.clock, wall);
            if (prof_out)
            {
                FILE *f = fopen(prof_out, "w");
                if (f) { fputs(json.c_str(), f); fclose(f); }
                else fprintf(stderr, "ERRO: cannot write %s\n", prof_out);
            }
            else
                fputs(json.c_str(), stderr);
        }
#else
        fprintf(stderr, "WARN: built without profiling (PROFILE=0); --profile flags ignored\n");
#endif
        return rc;
    };

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
            return finish(2);
        }
        if (emu.test_result != 0)
        {
            // riscv-tests encode a failure as (test case number << 1) | 1
            printf("FAILED test case %llu\n", (unsigned long long)(emu.test_result >> 1));
            return finish(1);
        }
        return finish(0);
    }

    // Run as fast as possible
    // UART output goes to stdout, UART input comes from stdin (raw mode).
    while (emu.running)
        emu.emulate();

    return finish(0);
}
