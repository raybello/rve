// Entry point for the Node.js/WebAssembly ISA test runner (see Makefile.emscripten isas-wasm).
#include "headless.h"

int main(int argc, char *argv[])
{
    return runHeadless(argc, argv);
}
