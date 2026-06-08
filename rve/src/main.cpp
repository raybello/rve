
#include "stdio.h"
#include "app.h"
#include "net.h"
#include <cstring>
#include <sys/time.h>


// Headless emulation loop.
// Flags:
//   -b <image>   raw binary image to boot
//   -s <path>    Unix socket, act as server (player 0)
//   -S <path>    Unix socket, connect as client (player 1)
static int runHeadless(int argc, char *argv[])
{
    Emulator emu;

    const char *bin_file   = nullptr;
    const char *net_server = nullptr;
    const char *net_client = nullptr;

    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "-b") == 0 && i + 1 < argc)
            bin_file = argv[++i];
        else if (strcmp(argv[i], "-s") == 0 && i + 1 < argc)
            net_server = argv[++i];
        else if (strcmp(argv[i], "-S") == 0 && i + 1 < argc)
            net_client = argv[++i];
    }

    if (!bin_file)
    {
        fprintf(stderr, "ERRO: headless mode requires -b <image>\n");
        return 1;
    }

    if (net_server)
        net_init(net_server, /*server=*/true);
    else if (net_client)
        net_init(net_client, /*server=*/false);

    emu.initializeBin(bin_file);
    if (!emu.ready_to_run)
    {
        fprintf(stderr, "ERRO: failed to load binary image\n");
        return 1;
    }

    emu.running = true;

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
