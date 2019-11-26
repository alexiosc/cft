// -*- indent-c -*-

///////////////////////////////////////////////////////////////////////////////
//
// DFP HARDWARE DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __DFP_H__
#define __DFP_H__


#ifdef HOST
#endif


///////////////////////////////////////////////////////////////////////////////
//
// EXTERNAL MEMORY MAP
//
///////////////////////////////////////////////////////////////////////////////

#define _XMEMBASE 0x8000
#define _XMEM(addr) ((_XMEMBASE) + (addr))

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

#define READ_UCV_H   _XMEM(0x00)        //  0 A1 C16: µCV bits 16–23
#define READ_UCV_M   _XMEM(0x01)        //  1 B1 C22: µCV bits 8–15
#define READ_UCV_L   _XMEM(0x02)        //  2 C1 C30: µCV bits 0–7
#define READ_IRQ_ACT _XMEM(0x03)        //  3 D1 C39: IRQs active

#define READ_AEXT    _XMEM(0x04)        //  4 A2  C4: AEXT
#define READ_PC_HI   _XMEM(0x05)        //  5 B2 C21: PC bits 8–15
#define READ_PC_LO   _XMEM(0x06)        //  6 C2 C27: PC bits 0–7
#define READ_IRQ_EN  _XMEM(0x07)        //  7 D2 C40: IRQs enabled

#define READ_FLAGS   _XMEM(0x08)        //  8 A3 C13: flags
#define READ_AC_HI   _XMEM(0x09)        //  9 B3 C20: AC bits 8–15
#define READ_AC_LO   _XMEM(0x0a)        // 10 C3 C28: AC bits 0–7
#define READ_FP_D3   _XMEM(0x0b)        // 11 D3 C37: TBD, for expansion

#define READ_FP_A4   _XMEM(0x0c)        // 12 A4 C12: (TBD)
#define READ_MFD_HI  _XMEM(0x0d)        // 13 B4 C32/C34: DR/SP hi → MFD bits 8–15 (*)
#define READ_MFD_LO  _XMEM(0x0e)        // 14 C4 C29/C31: DR/SP lo → MFD bits 0–7  (*)
#define READ_FP_D4   _XMEM(0x0f)        // 15 D4 C38: TBD, for expansion

#define READ_STATE   _XMEM(0x10)        // 16 A5 Cxx: state (run/stop etc)
#define READ_IR_HI   _XMEM(0x11)        // 17 B5 C19: IR bits 8–15
#define READ_IR_LO   _XMEM(0x12)        // 18 C5 C25: IR bits 0–7
#define READ_UAV_LO  _XMEM(0x13)        // 19 D5 C35: micro-address low bits

#define READ_SCANCLR _XMEM(0x14)        // 20 -- ---: SCANCLR#. Autonomic counter reset.
#define READ_FPOE21  _XMEM(0x15)        // 21 -- C17: FPOE21#, future expansion
#define READ_FPOE22  _XMEM(0x16)        // 22 -- C26: FPOE22#, future expansion
#define READ_FPOE23  _XMEM(0x17)        // 23 -- C36: FPOE23#, future expansion

#define READ_FPOE24  _XMEM(0x18)        // 24 -- C11: FPOE24#, future expansion
#define READ_FPOE25  _XMEM(0x19)        // 25 -- C18: FPOE25#, future expansion
#define READ_FPOE26  _XMEM(0x1a)        // 26 -- C24: FPOE26#, future expansion
#define READ_FPOE27  _XMEM(0x1b)        // 27 -- C33: FPOE27#, future expansion

#define READ_FPOE28  _XMEM(0x1c)        // 28 -- C10: FPOE28#, future expansion
#define READ_FPOE29  _XMEM(0x1d)        // 29 -- C15: FPOE29#, future expansion
#define READ_FPOE30  _XMEM(0x1e)        // 30 -- C23: FPOE30#, future expansion
#define READ_FPOE31  _XMEM(0x1f)        // 31 -- ---: FPOE31#, unrouted

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
#define WRITE_AB_L    _XMEM(0x40)	// Write to AB bits 0-7
#define WRITE_AB_M    _XMEM(0x41)	// Write to AB bits 8-15
#define WRITE_AB_H    _XMEM(0x42)	// Write to AB bits 16-23
#define WRITE_DB_L    _XMEM(0x43)	// Write to DB bits 0-7
#define WRITE_DB_H    _XMEM(0x44)	// Write to DB bits 8-15
#define WRITE_IBUS_L  _XMEM(0x45)	// Write to IBUS bits 0-7
#define WRITE_IBUS_H  _XMEM(0x46)	// Write to IBUS bits 8-15
#define WRITE_OR_L    _XMEM(0x47)	// Write to OR, bits 0-7

// U112 output decoder.
#define WRITE_OR_H    _XMEM(0x80)	// Write to OR, bits 8-15
#define WRITE_RADDR   _XMEM(0x81)	// Output to µCV RADDR field
#define WRITE_WADDR   _XMEM(0x82)	// Output to µCV WADDR field
#define WRITE_MCV_H   _XMEM(0x83)	// Output to µCV ACTION field
#define WRITE_TP104   _XMEM(0x84)	// TP104 output (reserved)
#define WRITE_TP105   _XMEM(0x85)	// TP105 output (reserved)
#define WRITE_TP106   _XMEM(0x86)	// TP106 output (reserved)
#define WRITE_TP107   _XMEM(0x87)	// TP107 output (reserved)

// U113 input decoder
#define READ_AB_L     _XMEM(0x40)	// Read AB bits 0-7
#define READ_AB_M     _XMEM(0x41)	// Read AB bits 8-15
#define READ_AB_H     _XMEM(0x42)	// Read AB bits 16-23
#define READ_DB_L     _XMEM(0x43)	// Read DB bits 0-7
#define READ_DB_H     _XMEM(0x44)	// Read DB bits 8-15
#define READ_IBUS_L   _XMEM(0x45)	// Read IBUS bits 0-7
#define READ_IBUS_H   _XMEM(0x46)	// Read IBUS bits 8-15
#define READ_DSR      _XMEM(0x47)	// Read DIP switches


///////////////////////////////////////////////////////////////////////////////
//
// PORT MAP
//
///////////////////////////////////////////////////////////////////////////////

// Key:
//
// O.     Output
// I.     Input
// AL.    Active Low
// RE.    Rising Edge
// OD.    Open Drain output.
// I/OD.  Open drain, also used as input when in Z state.
// FP     Front Panel

// Port A: XMEM Address and Data Bus

// Port B: Programming/Control

#ifdef AVR

#define B_nCLR       PB0	// O. AL: resets the run/stop/step state machine
#define __SCK        PB1	// SCK (programming, not used)
#define __MOSI       PB2	// MOSI (programming, not used)
#define __MISO       PB3	// MISO (programming, not used)
#define B_FPROM      PB4	// O. to MBR. 0=RAM-only, 1=ROM & RAM.
#define B_FPCLKEN    PB5	// O. to clock generator. 1=Clock enable.
#define B_BUSCP      PB7	// O. RE: input FFs sample data.
		     
// Port C: Bus Enables & Control

#define C_CLRWS      PC0      	// O. RE: done with transaction, clear WS
#define C_nIBOE      PC1 	// O. AL: drive IBUS
#define C_nABOE      PC2 	// O. AL: drive AB (Address Bus)
#define C_nDBOE      PC3 	// O. AL: drive DB (Data Bus)
#define C_nMEM       PC4 	// I/OD. AL: drive MEM# bus signal.
#define C_nIO        PC5 	// I/OD. AL: drive IO# bus signal.
#define C_nR         PC6 	// I/OD. AL: drive R# bus signal.
#define C_nW         PC7 	// I/OD. AL: drive W# bus signal.

// Port D: Panel & Run Control

#define D_nIOINT     PD0	// Used for incoming interrupts only.
#define D_nWAIT      PD1	// I. AL: Run/Stop/Step FSM is (µ)stepping, or reset in progress
#define D_nLTSON     PD2	// O. to FP. AL: all FP lights enabled.
#define D_nSCANEN    PD3	// O. AL: lets FP scanner control the bus, FP updating (*)
#define D_nPANELEN   PD4	// O. AL: connect FP scanner to computer. (*)
#define D_LED_STOP   PD5	// O. to FP. Controls the STOP LED. (FP scanner must be running)
#define D_nSTEP_RUN  PD6	// O. to FP and Run/Stop/Step FSM. 0 = running (RUN LED on)
#define D_nuSTEP     PD7	// O. to Run/Stop/Step FSM. AL: request microstep.

// (*) SCANEN# and PANELEN# work like this:
//
// SCANEN#   PANELEN#    What
// ----------------------------------------------------------------------------------
//    0          0       FP scanner samples the computer and updates the FP itself.
//    0          1       FP scanner on, but no panel updates. Pointless.
//    1          0       MCU can read from computer, panel updates as read.
//    1          1       MCU can write to front panel.

// Port E: Serial I/O, Panel, Control Vector enable

#define E_RXD        PE0 	// USART, not used directly.
#define E_TXD        PE1 	// USART, not used directly.
#define E_nFPIRQ     PE2 	// O. AL: signal (jumper configurable) IRQ to processor
#define E_MFD0       PE3 	// O. Set MFD value. (low bit)
#define E_MFD1       PE4 	// O. Set MFD value. (high bit)
#define E_nCVOE      PE5        // O. Drive Control Vector outputs (RADDR, WADDR & ACTION)
#define E_nFPRESET   PE6        // O. AL: signals reset to processor.
#define E_nFPRSTHOLD PE7        // O. AL: asserts RSTHOLD#. (use when CTL board is absent)

// Port F: Front panel switches

#define F_SWA0       PF0        // O. FP switch address, bit 0.
#define F_SWA1       PF1        // O. FP switch address, bit 1.
#define F_SWA2       PF2        // O. FP switch address, bit 2.
#define F_SWA3       PF3        // O. FP switch address, bit 3.
#define F_SWD0       PF4        // I. FP switch data, bit 0.
#define F_SWD1       PF5        // I. FP switch data, bit 1.
#define F_SWD2       PF6        // I. FP switch data, bit 2.
#define F_SWD3       PF7        // I. FP switch data, bit 3.

// Port G: XMEM bus control

#define G_nFPHALT    PG3        // O. AL: asserts FPHALT#. Connected to TP101. (**)
#define G_TP102      PG4        // Connected to TP102, unused.

// (**) There is an erratum in the fabricated R1939 DFP board where FPHALT# is
//      connected to the PEN pin, which can't be controlled by the MCU. This
//      trace has been cut on the board and patched to TP101 (pin 18, PG3).

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

#endif // AVR

#endif // __DFP_H__

// End of file.
