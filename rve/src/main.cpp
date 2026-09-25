
#include "stdio.h"
#include "app.h"
#include <cstring>
#include <sys/time.h>


// Headless emulation loop 
// The emulator's captureKeyboardInput() (called from Emulator::initialize()) puts the
// terminal into raw mode so every keystroke is immediately visible to the guest OS.
static int runHeadless(int argc, char *argv[])
{
    Emulator emu;

    const char *bin_file = nullptr;
    const char *elf_file = nullptr;
    uint64_t max_instr = 20000000ull; // ISA-test watchdog
    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "-b") == 0 && i + 1 < argc)
            bin_file = argv[++i];
        else if (strcmp(argv[i], "-e") == 0 && i + 1 < argc)
            elf_file = argv[++i];
        else if (strcmp(argv[i], "-t") == 0)
            emu.test_mode = true;
        else if (strcmp(argv[i], "-s") == 0)
            emu.debugMode = true; // trace every instruction
        else if (strcmp(argv[i], "-c") == 0 && i + 1 < argc)
            max_instr = strtoull(argv[++i], nullptr, 0);
    }

    if (!bin_file && !elf_file)
    {
        fprintf(stderr, "ERRO: headless mode requires -b <image> or -e <elf>\n");
        return 1;
    }

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
        if (!emu.test_done)
        {
            printf("TIMEOUT after %llu instructions\n", (unsigned long long)max_instr);
            return 2;
        }
        return emu.test_result == 0 ? 0 : 1;
    }

    // Run as fast as possible
    // UART output goes to stdout, UART input comes from stdin (raw mode).
    while (emu.running)
        emu.emulate();

    return 0;
}


int main(int argc, char *argv[])
{
    // -n  : headless / no-GUI mode 
    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "-n") == 0)
            return runHeadless(argc, argv);
    }

    // GUI mode
    App app;
    app.initializeEmu(argc, argv);
    app.initializeWindow();
    app.initializeUI();
    app.renderLoop();
    app.destroyUI();

    return 0;
}
