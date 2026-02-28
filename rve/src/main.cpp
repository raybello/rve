
#include "stdio.h"
#include "app.h"
#include <cstring>
#include <sys/time.h>


// Headless emulation loop — mirrors mini-rv32ima's main loop but without SDL/OpenGL.
// The emulator's captureKeyboardInput() (called from Emulator::initialize()) puts the
// terminal into raw mode so every keystroke is immediately visible to the guest OS.
static int runHeadless(int argc, char *argv[])
{
    Emulator emu;

    const char *bin_file = nullptr;
    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "-b") == 0 && i + 1 < argc)
            bin_file = argv[++i];
    }

    if (!bin_file)
    {
        fprintf(stderr, "ERRO: headless mode requires -b <image>\n");
        return 1;
    }

    emu.initializeBin(bin_file);
    if (!emu.ready_to_run)
    {
        fprintf(stderr, "ERRO: failed to load binary image\n");
        return 1;
    }

    emu.running = true;

    // Run as fast as possible — identical to mini-rv32ima's tight loop.
    // UART output goes to stdout, UART input comes from stdin (raw mode).
    while (emu.running)
        emu.emulate();

    return 0;
}


int main(int argc, char *argv[])
{
    // -n  : headless / no-GUI mode (like mini-rv32ima)
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
