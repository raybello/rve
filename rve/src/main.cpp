
#include "stdio.h"
#include "app.h"
#include "headless.h"
#include <cstring>
#include <sys/time.h>


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
