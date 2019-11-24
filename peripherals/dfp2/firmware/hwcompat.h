#warning "TODO: Review this file for DFP2"

#ifndef __HWCOMPAT_H__
#define __HWCOMPAT_H__


#define bool_t uint8_t


///////////////////////////////////////////////////////////////////////////////
//
// I/O ADDRESS MAP
//
///////////////////////////////////////////////////////////////////////////////

// Because of the way XMEM works, our 8-bit address external memory is mapped
// at every 256-byte boundaries where the 16-bit address is > 4351. I.e. 0x1100
// (4352), 0x1200 (4608), etc. The datasheet suggests 0x8000, so we'll go with
// that.
//
// There are two groups of addreses by their destination. One, group A, with
// addresses ≥ 0x40, is decoded and handled locally on the DFP board. The
// other, group B, with addresses < 0x40 is decoded, output to the computer as
// one of 32 front panel data request lines. When these are asserted, depending
// on the value of SCANEN# and PANELEN#, the corresponding LED group on the
// front panel will also be updated.

#define _XMEMBASE 0x8000
#define _XMEM(addr) ((_XMEMBASE) + (addr))

// GROUP A.

// The weirdness of these addresses comes from them being partially
// decoded with 74138s.

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


// GROUP B addresses modules in the computer if PANELEN# is asserted
// (low). These are read-only addresses and should never be written to! Each
// corresponds to both an 8-bit device on the computer and an 8-LED panel
// module.

#define READ_UCV_H   _XMEM(0x00)        // FPOE0#, A1: µCV bits 16-23
#define READ_UCV_M   _XMEM(0x01)        // FPOE1#, B1: µCV bits 8-15
#define READ_UCV_L   _XMEM(0x02)        // FPOE2#, C1: µCV bits 0-7
#define READ_IRQ_ACT _XMEM(0x03)        // FPOE3#, D1: IRQs active




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


#ifdef AVR

#include <avr/pgmspace.h>
#include <util/delay.h>


///////////////////////////////////////////////////////////////////////////////
//
// OLD CODE
//
///////////////////////////////////////////////////////////////////////////////

// TODO: Update everything below this point and move it above this
// section block, or delete it.

// TODO: check why this was the case with the DFP 1.0 code.
// #if (F_CPU != 14745600)
// #  error "The only supported clock speed is 14.7456 MHz"
// #endif

#define CLKBASE 14400 // << 10

// At ~16 MHz and 2 cycles per NOP, this is a 125ns delay.
#define short_delay() asm("nop");

// If we're on a platform with only one USART, redefine some macros.
#ifndef UCSR0A
#define UCSR0A UCSRA
#define UCSR0B UCSRB
#define UCSR0C UCSRC
#define TXEN0 TXEN
#define RXEN0 RXEN
#define UBRR0L UBRRL
#define UBRR0H UBRRH
#define RXCIE0 RXCIE
#define USART_RX_vect USART_RXC_vect
#define FE0 FE
#define UDR0 UDR
#define UDRE0 UDRE
#endif // UCSR0

#define setup() short_delay()
#define hold() short_delay()

#else



#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

#define PGM_P char *
#define PROGMEM
#define PSTR(x) x
#define pgm_read_byte(p) (*(p))
#define pgm_read_word(p) (*(p))
#define strncmp_P strncmp
#define _delay_us(us) usleep(us)
#define _delay_ms(us) usleep((us) * 1000)
#define short_delay() usleep(100);

#define setup() 
#define hold() 

#endif // ! AVR

#endif // __HWCOMPAT_H__

// End of file.
