#ifndef HEADLESS_H
#define HEADLESS_H

// Headless (no GUI) emulation: -b <image> boots a Linux image, -e <elf> loads an ELF,
// -t runs in ISA-test mode (exit 0 = pass, 1 = fail, 2 = timeout), -c <n> sets the
// test watchdog, -T traces instructions, -s/-S <path> enable Unix-socket networking.
int runHeadless(int argc, char *argv[]);

#endif
