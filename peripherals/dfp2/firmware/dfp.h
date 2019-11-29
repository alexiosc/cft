// -*- indent-c -*-

///////////////////////////////////////////////////////////////////////////////
//
// DFP HARDWARE DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __DFP_H__
#define __DFP_H__

#include <stdint.h>

///////////////////////////////////////////////////////////////////////////////
//
// BASIC DATA TYPES
//
///////////////////////////////////////////////////////////////////////////////

typedef uint16_t word_t;	// A 16-bit CFT word
typedef uint16_t addr_t;	// A 16-bit address (excludes AEXT)
typedef uint16_t aext_t;	// 8-bit address extension

typedef uint8_t  bool_t;	// Alias for a Boolean value


///////////////////////////////////////////////////////////////////////////////
//
// ERROR CODES
//
///////////////////////////////////////////////////////////////////////////////

// Somewhat unusually, declare an enum for error codes. This helps me
// avoid bugs by making the typing a little stronger. This is
// efficient in this case because we compile with -fshort-enums (8 bit
// storage rather than the default 16).

typedef enum {
	err_success = 0,		// No error, all's well
	err_nmaster = 1		// We are not the bus master
} errno_t;


///////////////////////////////////////////////////////////////////////////////
//
// BUS TRANSACTION DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////

typedef enum {
	spc_mem,		// A Memory space transaction
	spc_io			// An I/O space transaction
} space_t;	// For convenience and type checking


///////////////////////////////////////////////////////////////////////////////
//
// MULTI-FUNCTION DISPLAY
//
///////////////////////////////////////////////////////////////////////////////

// These enums match the hardware and should not be changed.
typedef enum {
	mfd_or = 0,		// The MFD displays the OR
	mfd_dr = 1,		// The MFD displays the DR
	mfd_sp = 1,		// The MFD displays the SP
} mfd_t;


///////////////////////////////////////////////////////////////////////////////
//
// EXTERNAL MEMORY MAP
//
///////////////////////////////////////////////////////////////////////////////

#define _XMEMBASE 0x8000
#define _XMEM(addr) (_XMEMBASE + (addr))

// WARNING: THE EXTERNAL BUS IS NOT AVAILABLE WHEN SCANEN# IS ASSERTED (LOW).

// Because of the way XMEM works, our 8-bit address external memory is mapped
// at every 256-byte boundaries where the 16-bit address is > 4351. I.e. 0x1100
// (4352), 0x1200 (4608), etc. The datasheet suggests 0x8000, so we'll go with
// that.

// ADDRESSES 0x00–0x20

// If PANELEN# is low, addresses 0x00–0x20 are decoded to output enables
// FPOE0#–FPOE31# which will drive the MCU data bus. Addresses 0x00–0x13 enable
// one of the front panel's buffers to latch data bus data. This has two
// implications:
//
// 1. Reading any value from 0x00–0x14 will also update the corresopnding front
//    panel lights with no other action needed.
//
// 2. These addresses can't normally be written to if PANELEN# is low because
//    the bus is already driven. Set PANELEN# high and the MCU can do this, and
//    as a side effect it's possible to write arbitrary values to the front
//    panel lights. This is used for diagnostics, and for the light test
//    function. (saving 200 diodes).
//
// NOTES:
//
// A. When SCANEN# is low (normally the case), the autonomic FP scanner is in
//    operation and has control of the bus.
//
// B. The FP Scanner counts from 0–20. The count of 20 is fed back to it as a
//    reset signal, so it's basically a modulo 20 counter, sweeping adresses 0x00
//    to 0x13.
//
// C. As a result, FPOE20# is not routed externally and can only be used as a
//    means of resetting this counter. (which is pointless, just let the poor
//    bastard run)
//
// D. FPOE21# to FPOE31# are never scanned by the scanner, and have no
//    corresponding lights to the front panel. The MCU can read them though:
//    some are routed to the edge connector and may be connected to front panel
//    output-like latches on computer boards for custom diagnostics.

// GROUP B addresses modules in the computer if PANELEN# is asserted
// (low). These are read-only addresses and should never be written to! Each
// corresponds to both an 8-bit device on the computer and an 8-LED panel
// module.

// the comments show FPOE x number, FP light coordinates where available
// (module/column A–D, rows 1–5), and edge connector pin (Cxx).

#define XMEM_UCV_H   _XMEM(0x00)        //  0 A1 C16: µCV bits 16–23
#define XMEM_UCV_M   _XMEM(0x01)        //  1 B1 C22: µCV bits 8–15
#define XMEM_UCV_L   _XMEM(0x02)        //  2 C1 C30: µCV bits 0–7
#define XMEM_IRQ_ACT _XMEM(0x03)        //  3 D1 C39: IRQs active

#define XMEM_AEXT    _XMEM(0x04)        //  4 A2  C4: AEXT
#define XMEM_PC_HI   _XMEM(0x05)        //  5 B2 C21: PC bits 8–15
#define XMEM_PC_LO   _XMEM(0x06)        //  6 C2 C27: PC bits 0–7
#define XMEM_IRQ_EN  _XMEM(0x07)        //  7 D2 C40: IRQs enabled

#define XMEM_FLAGS   _XMEM(0x08)        //  8 A3 C13: flags
#define XMEM_AC_HI   _XMEM(0x09)        //  9 B3 C20: AC bits 8–15
#define XMEM_AC_LO   _XMEM(0x0a)        // 10 C3 C28: AC bits 0–7
#define XMEM_FP_D3   _XMEM(0x0b)        // 11 D3 C37: TBD, for expansion

#define XMEM_FP_A4   _XMEM(0x0c)        // 12 A4 C12: (TBD)
#define XMEM_MFD_HI  _XMEM(0x0d)        // 13 B4 C32/C34: DR/SP hi → MFD bits 8–15 (*)
#define XMEM_MFD_LO  _XMEM(0x0e)        // 14 C4 C29/C31: DR/SP lo → MFD bits 0–7  (*)
#define XMEM_FP_D4   _XMEM(0x0f)        // 15 D4 C38: TBD, for expansion

#define XMEM_STATE   _XMEM(0x10)        // 16 A5 Cxx: state (run/stop etc)
#define XMEM_IR_HI   _XMEM(0x11)        // 17 B5 C19: IR bits 8–15
#define XMEM_IR_LO   _XMEM(0x12)        // 18 C5 C25: IR bits 0–7
#define XMEM_UAV_LO  _XMEM(0x13)        // 19 D5 C35: micro-address low bits

#define XMEM_SCANCLR _XMEM(0x14)        // 20 -- ---: SCANCLR#. Autonomic counter reset.
#define XMEM_FPOE21  _XMEM(0x15)        // 21 -- C17: FPOE21#, future expansion
#define XMEM_FPOE22  _XMEM(0x16)        // 22 -- C26: FPOE22#, future expansion
#define XMEM_FPOE23  _XMEM(0x17)        // 23 -- C36: FPOE23#, future expansion

#define XMEM_FPOE24  _XMEM(0x18)        // 24 -- C11: FPOE24#, future expansion
#define XMEM_FPOE25  _XMEM(0x19)        // 25 -- C18: FPOE25#, future expansion
#define XMEM_FPOE26  _XMEM(0x1a)        // 26 -- C24: FPOE26#, future expansion
#define XMEM_FPOE27  _XMEM(0x1b)        // 27 -- C33: FPOE27#, future expansion

#define XMEM_FPOE28  _XMEM(0x1c)        // 28 -- C10: FPOE28#, future expansion
#define XMEM_FPOE29  _XMEM(0x1d)        // 29 -- C15: FPOE29#, future expansion
#define XMEM_FPOE30  _XMEM(0x1e)        // 30 -- C23: FPOE30#, future expansion
#define XMEM_FPOE31  _XMEM(0x1f)        // 31 -- ---: FPOE31#, unrouted

// (*) Addresses 0x13 and 0x14 are for the MFD. They always address FP lights
// B4 (high order bits) and C4 (low order bits), but read from a different unit
// depending on the values of MCU pins MFD0 and MFD1:
//
// MFD1 MFD0  Read Register
//   0    0   OR (DFP Output Register)
//   0    1   DR (Data Register)
//   1    0   SP (Stack Pointer)
//   1    1   Nothing (can't be selected by 3-position switch)


// ADDRESSES ≥ 0x40

// These are decoded and handled locally on the DFP board. Some are read ports,
// some are write ports.

// U111 output decoder.
#define XMEM_AB_L    _XMEM(0x40)	// Write to AB bits 0-7
#define XMEM_AB_M    _XMEM(0x41)	// Write to AB bits 8-15
#define XMEM_AB_H    _XMEM(0x42)	// Write to AB bits 16-23
#define XMEM_DB_L    _XMEM(0x43)	// Write to DB bits 0-7
#define XMEM_DB_H    _XMEM(0x44)	// Write to DB bits 8-15
#define XMEM_IBUS_L  _XMEM(0x45)	// Write to IBUS bits 0-7
#define XMEM_IBUS_H  _XMEM(0x46)	// Write to IBUS bits 8-15
#define XMEM_OR_L    _XMEM(0x47)	// Write to OR, bits 0-7
#define XMEM_DSR     _XMEM(0x47)	// Read DIP switches

// U112 output decoder.
#define XMEM_OR_H    _XMEM(0x80)	// Write to OR, bits 8-15
#define XMEM_RADDR   _XMEM(0x81)	// Output to µCV RADDR field
#define XMEM_WADDR   _XMEM(0x82)	// Output to µCV WADDR field
#define XMEM_ACTION  _XMEM(0x83)	// Output to µCV ACTION field
#define XMEM_TP104   _XMEM(0x84)	// TP104 output (reserved)
#define XMEM_TP105   _XMEM(0x85)	// TP105 output (reserved)
#define XMEM_TP106   _XMEM(0x86)	// TP106 output (reserved)
#define XMEM_TP107   _XMEM(0x87)	// TP107 output (reserved)

// U113 input decoder: same addresses as U111, but for reading.
// #define XMEM_AB_L     _XMEM(0x40)	// Read AB bits 0-7
// #define XMEM_AB_M     _XMEM(0x41)	// Read AB bits 8-15
// #define XMEM_AB_H     _XMEM(0x42)	// Read AB bits 16-23
// #define XMEM_DB_L     _XMEM(0x43)	// Read DB bits 0-7
// #define XMEM_DB_H     _XMEM(0x44)	// Read DB bits 8-15
// #define XMEM_IBUS_L   _XMEM(0x45)	// Read IBUS bits 0-7
// #define XMEM_IBUS_H   _XMEM(0x46)	// Read IBUS bits 8-15
// #define XMEM_DSR      _XMEM(0x47)	// Read DIP switches


///////////////////////////////////////////////////////////////////////////////
//
// SWITCHES
//
///////////////////////////////////////////////////////////////////////////////

// The CFT has 30 switches. Some are double throw. Each front panel module
// allows for 8 double-throw switches and the DFP scans 64 switch bits. The
// switches are scanned using Port F of the MCU. Four bits are decoded to
// address switch pairs in modules A and C and B and D.
//
// SWA    SWD0-SWD1   SWD2-SWD3
//  0       SW A0        SW B0
//  1       SW A1	 SW B1
//  2       SW A2	 SW B2
//  3       SW A3	 SW B3
//  4       SW A4	 SW B4
//  5       SW A5	 SW B5
//  6       SW A6	 SW B6
//  7       SW A7	 SW B7
//  8       SW C0        SW D0
//  9       SW C1        SW D1
// 10       SW C2        SW D2
// 11       SW C3        SW D3
// 12       SW C4        SW D4
// 13       SW C5        SW D5
// 14       SW C6        SW D6
// 15       SW C7        SW D7
//
// Switches:
//   Module A:
//     * Panel lock
//     * START/RESET
//     * STOP/RUN
//     * STEP/µSTEP
//     * SPEED: Creep
//     * SPEED: Fast
//     * LTS
//     * MFD: SP
//     * MFD: OR
//
//   Module B:
//     * SR (8 switches)
//
//   Module C
//     * SR (8 switches)
//
//   Module D
//     * SR->PC/SR->IR
//     * SR->AC/TEST
//     * NEXT
//     * MEM W
//     * MEM R
//     * IO W
//     * IO R
//     * ROM
//     * A/B

///////////////////////////////////////////////////////////////////////////////
//
// MCU init & notes
//
///////////////////////////////////////////////////////////////////////////////

/*

Fuse high = 11011001 (default flags, disable JTAG)
Fuse low  = 11100000 (default flags, external clock)

MCUCSR = 10000000 (disable JTAG)
MCUCR  = 10000000 (enable XMEM, no wait states for now)
XMCRB  = 10000111 (bus keepers enabled, 8-bit address bus)

DDCRB  = 11110001 (port B direction)
PORTB  = 00000000 (init #1)
PORTB  = 10001000 (init #2, CLR# asserted and cleared)

DDCRC  = 11111111 (port C direction)
PORTC  = 11111110
PORTC  = 11111111 (init #2, CLRWS raising edge)

DDCRD  = 11111100 (port D direction)
PORTD  = 11011100 (init)

DDCRE  = 11111100 (port E direction)
PORTE  = 10100100 (init, assert FPRESET#)

DDCRF  = 00001111 (port F direction)

DDCRG  = 00000011 (port F direction)
PORTG  = 00000000 (init, assert FPHALT#)



Functionality:

* Diagnostics
* Read all inputs
* Read specific inputs
* Perform bus transaction
* Scan switches
* Write to custom lights
* Reset
* Halt
* Run
* Step
* Microstep
* Interrupt computer

*/

///////////////////////////////////////////////////////////////////////////////
//
// LOW-ISH LEVEL I/O
//
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
//
// HIGH LEVEL I/O
//
///////////////////////////////////////////////////////////////////////////////

void set_mfd(mfd_t mfd);

void set_or(word_t data);


///////////////////////////////////////////////////////////////////////////////
//
// HIGH LEVEL DFP-ORIGATING BUS TRANSACTIONS
//
///////////////////////////////////////////////////////////////////////////////

// Sanity checks

errno_t  bus_check_for_chatter();
errno_t  bus_assert_halted();


// Single transactions

errno_t  bus_read(space_t space, addr_t addr, word_t * buf);
errno_t  bus_write(space_t space, addr_t addr, word_t word);


// Block I/O (faster, no need for excessive sanity checks)

errno_t  bus_start_block_write(space_t space);
errno_t  bus_block_write(addr_t addr, word_t word);
errno_t  bus_block_read(addr_t base, int16_t n, word_t * buf);
errno_t  bus_end_block_write(space_t space);


// IBUS Transactions.

// Note: as the units on the IBus aren't read-write symmetric, these
// aren't either!

errno_t  ibus_read(addr_t raddr, word_t * buf);
errno_t  ibus_write(addr_t waddr, word_t * buf);


///////////////////////////////////////////////////////////////////////////////
//
// CFT-ORIGINATED BUS TRANSCACTIONS
//
///////////////////////////////////////////////////////////////////////////////

// We only compare 8-bit addresses because our hardware address decoder has
// already compared the most significant 8 bits. Receiving an bus command
// interrupt means they match our base address already.

//#define IOBASE 0x100
//#define _IO(x) (IOBASE|(x))
#define _IO(x) (x)

#define IO_SOR      _IO(0x00)
#define IO_LSR      IO_SOR
#define IO_LDSR     _IO(0x01)
#define IO_ENEF     _IO(0x08)
#define IO_DISEF    _IO(0x09)
#define IO_QEF1     IO_ENEF
#define IO_QEF2     IO_DISEF
#define IO_ICR      _IO(0x0A)
#define IO_ISR      IO_ICR

#define IO_SENTINEL _IO(0x0f)
#define IO_PRINTA   _IO(0x10)
#define IO_PRINTC   _IO(0x11)
#define IO_READC    IO_PRINTC
#define IO_PRINTD   _IO(0x12)
#define IO_PRINTU   _IO(0x13)
#define IO_PRINTH   _IO(0x14)
#define IO_PRINTB   _IO(0x15)
#define IO_PRINTSP  _IO(0x16)
#define IO_PRINTNL  _IO(0x17)
#define IO_DEBUGON  _IO(0x18)
#define IO_DEBUGOFF _IO(0x19)
#define IO_DUMP     _IO(0x1a)
#define IO_PRINTHI  _IO(0x1b)
#define IO_PRINTLO  _IO(0x1c)
#define IO_HALT     _IO(0x1d)
#define IO_SUCCESS  _IO(0x1e)
#define IO_FAIL     _IO(0x1f)

// Source: dfp.asm
#define FTR_HOB  0x0001		// Halt on bus errors (emulator only)
#define FTR_TRC  0x0010		// Assembly trace
#define FTR_UTR  0x0020		// Microcode trace
#define FTR_HOS  0x0200		// Halt on SENTINEL

#define QEF_PFP  0x0001		// PFP: full front panel installed
#define QEF_DEB  0x0002		// DEB functionality present
#define QEF_TTY  0x0004		// Debug TTY present
#define QEF_TST  0x0008		// Testing interface (PRINTx) present
#define QEF_TRC  0x0010		// Tracing (DEBUGON/OFF) available
#define QEF_UTR  0x0020		// Microcode tracing available
#define QEF_DMP  0x0040		// DUMP available
#define QEF_SNT  0x0080		// SENTINEL available
#define QEF_HOF  0x0100		// Will halt on FAIL
#define QEF_HOS  0x0200		// Will halt on SENTINEL
#define QEF_LCK  0x0400		// Panel is locked

#define QEF_VLE  0x0000         // Detection/version: verilog
#define QEF_VHW  0x4000		// Detection/version: hardware
#define QEF_VCE  0xc000		// Detection/version: emulated panel
#define QEF_VJE  0xe000		// Detection/version: JS-emulated panel
#define QEF_DET  0xe000		// detection mask

#ifdef CFTEMU
#define QEF_BASE (QEF_VCE|QEF_PFP|QEF_DEB|QEF_TTY|QEF_TST|QEF_TRC|QEF_UTR|QEF_DMP)
#else
#define QEF_BASE (QEF_VHW|QEF_PFP|QEF_DEB|QEF_TTY|QEF_TST|QEF_TRC|QEF_UTR|QEF_DMP)
#endif // CFTEMU

// Feature bits
#define FTR_HOB  0x0001		// Halt on bus errors: emulator only
#define FTR_TRC  0x0010		// Assembly trace
#define FTR_UTR  0x0020		// Microcode trace
#define FTR_HOS  0x0200		// Halt on SENTINEL

// CFT Extended Instructions and I/O registers:
// 
//   I/O address space usage:
// 
//   REG OUT        IN
//   ------------------------------
//   100 SOR        LSR
//   101 -          LDSR
//   102 -          -
//   103 -          -
//   104 -          -
//   105 -          -
//   106 -          -
//   107 -          -
//   108 ENEF       QEF (*)
//   109 DISEF      QEF
//   10A ICR        ISR
//   10B -          -
//   10C -          -
//   10D -          -
//   10E -          -
//   10F SENTINEL   SENTINEL
//   110 PRINTA     -    
//   111 PRINTC     READC
//   112 PRINTD     -
//   113 PRINTU     -
//   114 PRINTH     -
//   115 PRINTB     -
//   116 PRINTSP    -
//   117 PRINTNL    -
//   118 DEBUGON    DEBUGON
//   119 DEBUGOFF   DEBUGOFF
//   11A DUMP       DUMP
//   11B PRINTHI    -
//   11C PRINTLO    -
//   11D HALT       HALT
//   11E SUCCESS    SUCCESS
//   11F FAIL       FAIL
// 
// 
// ENEF/DISEF
// 
//  Enable/disable features. Flags to enable.
// 
//  Bit 0:     Sanity checking (emulator only).
//  Bit 1:     Enable/disable SENTINEL
//  Bit 2:     Show assembly tracing when DEBUGON is active.
//  Bit 3:     Show microcode tracing when DEBUGON is active.
//  Bit 4:     Reserved (emulator only).
//  Bit 5:     Enable DEB TTY interrupt on char receive.
//  Bits 5-15: Reserved.
// 
// 
// QEF
// 
//   Query Features. Bitmap.
// 
//   Bit  0:     PFP present.
//   Bit  1:     DEB present.
//   Bit  2:     Debug TTY present.
//   Bit  3:     PRINTx (other than PRINTC) present.
//   Bit  4:     Trace (DEBUGON/OFF) available.
//   Bit  5:     DUMP available.
//   Bit  6:     SENTINEL available.
//   Bit  7:     Halt on fail.
//   Bit  8:     Halt on sentinel.
//   Bit  9:     Panel is locked.
//   Bits 10-15: Always 010000.
// 
//   Starting value (before ORring with hof/hos/lock): 0100 0000 0111 1111
// 
// SENTINEL
// 
//  Execution halts with an appropriate message logged in the debugging
//  console.
// 
// PRINTA
// 
//  Prints value of AC in hex (address format).
// 
// PRINTC
// 
//   Print out a single character to the debugging TTY.
// 
// READC
// 
//   Read a character from the debugging TTY. If no character is
//   available, bit 15 is set (AC < 0). IRQ6 is signalled if the IRQ
//   feature is enabled.
// 
// PRINTD
// 
//   Print a signed base 10 integer.
// 
// PRINTU
// 
//   Print an unsigned base 10 integer.
// 
// PRINTH
// 
//   Print AC as an unsigned hex integer.
// 
// PRINTB
// 
//   Print AC as 16-digit bitmap.
// 
// PRINTSP
// 
//   Print a single space.
// 
// PRINTNL
// 
//   Print a newline.
// 
// DEBUGON
// 
//   Start tracing (slows down processor).
// 
// DEBUGOFF
// 
//   Stop tracing.
// 
// DUMP
// 
//   Dump current CPU state.
// 
// PRINTHI
// 
//   Store AC into the HI registed.
// 
// PRINTLO
// 
//   Print HI:AC as a 32-bit hex value.
// 
// HALT
// 
//   Halt the computer.
// 
// SUCCESS
// 
//   Print out [ok].
// 
// FAIL
// 
//   Print out [fail]. Halt if halt-on-fail enabled.
// 

void buscmd_enef(uint16_t val);
void buscmd_disef(uint16_t val);
void buscmd_qef();
void buscmd_print(char op, uint16_t val);
void buscmd_printhi(uint16_t val);
void buscmd_debugon();
void buscmd_debugoff();
void buscmd_dump();
void buscmd_sentinel();
void buscmd_halt();
void buscmd_success();
void buscmd_fail();

// High-level bus transaction multiplexers

void buscmd_write();
void buscmd_read();

#endif // __DFP_H__

// End of file.
