#ifndef TYPES_H
#define TYPES_H

#include <stdint.h>
#include <stdbool.h>
#include <string.h>

// Integer Data types
using u32 = uint32_t;
using u16 = uint16_t;
using u8  = uint8_t;
using s32 = int32_t;
using s16 = int16_t;
using s8  = int8_t;

// Clocking options
enum CLK_SPEED
{
    CLK_MAX = -1,
    CLK_1HZ = 1,
    CLK_5HZ = 5,
    CLK_10HZ = 10,
    CLK_100HZ = 100,
    CLK_1000HZ = 1000
};

// Structure representing a hardware trap event.
// A trap can be an exception or an interrupt with the following fields:
typedef struct {
    bool en;        // Indicates if the trap is enabled.
    bool irq;       // Indicates if the trap is an interrupt (true) or exception (false).
    u32 type;      // Specifies the trap type identifier.
    u32 value;     // Holds additional information related to the trap.
} Trap;

// Structure representing the result of an instruction execution.
typedef struct {
    u32 write_reg; // Register identifier where the result is written.
    u32 write_val; // Value to write into the specified register.
    u32 pc_val;    // Program counter value after instruction execution.
    u32 csr_write; // CSR (Control and Status Register) index to write into.
    u32 csr_val;   // Value to write into the specified CSR.
    Trap trap;      // Contains any trap that occurred during execution.
} ins_ret;

// Structure representing the state of Control and Status Registers (CSRs).
typedef struct {
    u32 data[4096]; // Array holding all CSR values indexed by their IDs.
    u32 privilege;  // Current privilege level of the processor.
} csr_state;

// Structure defining the current state of a UART device's registers and flags.
typedef struct {
    u32 rbr_thr_ier_iir;   // Combined register for receive buffer, THR, IER, and IIR.
    u32 lcr_mcr_lsr_scr;   // Combined register for LCR, MCR, LSR, and SCR.
    bool thre_ip;           // Flag indicating whether the Transmit Holding Register is empty.
    bool interrupting;      // Indicates if an interrupt is currently being triggered.
} uart_state;

// Structure representing the CLINT (Core Local Interrupter) state.
typedef struct {
    bool msip;          // Machine software interrupt pending flag.
    u32 mtimecmp_lo;   // Lower 32 bits of machine timer compare value.
    u32 mtimecmp_hi;   // Upper 32 bits of machine timer compare value.
    u32 mtime_lo;      // Lower 32 bits of machine timer current count.
    u32 mtime_hi;      // Upper 32 bits of machine timer current count.
} clint_state;

// Structure representing the MMU state (Sv32 page table mode).
typedef struct {
    u32 mode;  // 0 = off, 1 = Sv32
    u32 ppn;   // Root page-table physical page number
} mmu_state;

// Structure representing the network device state.
typedef struct {
    u32 rx_ready;   // Set by guest to signal it is ready to receive
    u8 *nettx;      // TX DMA buffer (4 KiB)
    u8 *netrx;      // RX DMA buffer (4 KiB)
} net_state;

const char rv_regs[32][5] = {
    "zero",
    "ra",
    "sp",
    "gp",
    "tp",
    "t0",
    "t1",
    "t2",
    "s0",
    "s1",
    "a0",
    "a1",
    "a2",
    "a3",
    "a4",
    "a5",
    "a6",
    "a7",
    "s2",
    "s3",
    "s4",
    "s5",
    "s6",
    "s7",
    "s8",
    "s9",
    "s10",
    "s11",
    "t3",
    "t4",
    "t5",
    "t6",
};

#endif
