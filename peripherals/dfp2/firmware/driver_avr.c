// -*- indent-c++ -*-

///////////////////////////////////////////////////////////////////////////////
//
// HARDWARE DRIVER FOR DFP ON ATMEGA64
//
///////////////////////////////////////////////////////////////////////////////

#ifndef AVR
#  error "This driver is meant for an AVR only."
#endif // AVR

#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/wdt.h>

#include "dfp.h"
#include "utils.h"
#include "driver.h"

#define USE_ATOMIC_BLOCKS

#ifdef USE_ATOMIC_BLOCKS
#include <util/atomic.h>
#else
#define ATOMIC_BLOCK(x)
#endif

// This 'driver' is only available on the AVR target.

// #include "hwcompat.h"
// #include "panel.h"
// #include "proto.h"
// #include "abstract.h"
// #include "bus.h"
// #include "buscmd.h"
// #include "utils.h"
//#include "serial.h"
// #include "output.h"
// #include "switches.h"
// #include "panel.h"


hwstate_t state;


///////////////////////////////////////////////////////////////////////////////
//
// FORWARD DEFINITIONS (AS NEEDED)
//
///////////////////////////////////////////////////////////////////////////////

// These are added as needed.
inline static void fp_scanner_stop();
inline static void fp_scanner_start();

static inline void sw_init();



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

#define B_NCLR       PB0	// O. AL: resets the run/stop/step state machine
#define __SCK        PB1	// SCK (programming, not used)
#define __MOSI       PB2	// MOSI (programming, not used)
#define __MISO       PB3	// MISO (programming, not used)
#define B_FPROM      PB4	// O. to MBR. 0=RAM-only, 1=ROM & RAM.
#define B_FPCLKEN    PB5	// O. to clock generator. 1=Clock enable.
#define B_BUSCP      PB7	// O. RE: input FFs sample data.
		     
// Port C: Bus Enables & Control

#define C_CLRWS      PC0      	// O. RE: done with transaction, clear WS
#define C_NIBOE      PC1 	// O. AL: drive IBUS
#define C_NABOE      PC2 	// O. AL: drive AB (Address Bus)
#define C_NDBOE      PC3 	// O. AL: drive DB (Data Bus)
#define C_NMEM       PC4 	// I/OD. AL: drive MEM# bus signal.
#define C_NIO        PC5 	// I/OD. AL: drive IO# bus signal.
#define C_NR         PC6 	// I/OD. AL: drive R# bus signal.
#define C_NW         PC7 	// I/OD. AL: drive W# bus signal.

// Port D: Panel & Run Control

#define D_NIOINT     PD0	// Used for incoming interrupts only.
#define D_NWAIT      PD1	// I. AL: Run/Stop/Step FSM is (µ)stepping, or reset in progress
#define D_NLTSON     PD2	// O. to FP. AL: all FP lights enabled.
#define D_NSCANEN    PD3	// O. AL: lets FP scanner control the bus, FP updating (*)
#define D_NPANELEN   PD4	// O. AL: connect FP scanner to computer. (*)
#define D_LED_STOP   PD5	// O. to FP. Controls the STOP LED. (FP scanner must be running)
#define D_NSTEP_RUN  PD6	// O. to FP and Run/Stop/Step FSM. 0 = running (RUN LED on)
#define D_NMSTEP     PD7	// O. to Run/Stop/Step FSM. AL: request microstep.

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
#define E_NFPIRQ     PE2 	// O. AL: signal (jumper configurable) IRQ to processor
#define E_MFD0       PE3 	// O. Set MFD value. (low bit)
#define E_MFD1       PE4 	// O. Set MFD value. (high bit)
#define E_NMCVOE     PE5        // O. Drive Control Vector outputs (RADDR, WADDR & ACTION)
#define E_NFPRESET   PE6        // O. AL: signals reset to processor.
#define E_NFPRSTHOLD PE7        // O. AL: asserts RSTHOLD#. (use when CTL board is absent)

#define E_MFDMASK    (BV(E_MFD0) | BV(E_MFD1)) // The MFD mask
#define E_MFDSHIFT   (E_MFD0)		       // The MFD shift value

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

#define G_NFPHALT    PG3        // O. AL: asserts FPHALT#. Connected to TP101. (**)
#define G_TP102      PG4        // Connected to TP102, unused.

// (**) There is an erratum in the fabricated R1939 DFP board where FPHALT# is
//      connected to the PEN pin, which can't be controlled by the MCU. This
//      trace has been cut on the board and patched to TP101 (pin 18, PG3).


///////////////////////////////////////////////////////////////////////////////
//
// UTILITIES
//
///////////////////////////////////////////////////////////////////////////////

// Convenience/clarity macros for the Atmega.

#define DDR_INP(bit)   (0)
#define DDR_OUT(bit)   (BV(bit))
#define DDR_HIZ(bit)   (BV(bit))

#define PORT_PYES(bit) (0)
#define PORT_PNNO(bit) (BV(bit))

#define PORT_NYES(bit) (BV(bit))
#define PORT_NNO(bit)  (0)

#define PORT_PUP(bit)  (BV(BIT))


///////////////////////////////////////////////////////////////////////////////
//
// AVR XMEM BUS I/O
//
///////////////////////////////////////////////////////////////////////////////

// !!! IMPORTANT !!! BUS CONTENTION !!!
//
// PRECONDITIONS:
//
//   * Call fp_scanner_stop() before using one of these functions!
//
//   * Wrap fp_scanner_stop() and any xmem_read() or xmem_write() calls in an
//     ATOMIC_BLOCK or disable interrupts.
//
// The autonomic FP Scanner controls the FPD bus otherwise and bus contention
// will occur.

inline static void
xmem_write(const xmem_addr_t addr, const uint8_t val)
{
	*((uint8_t *)(0x8000 + addr)) = val;
}


inline static uint8_t
xmem_read(const xmem_addr_t addr)
{
	return *((uint8_t *)(0x8000 + addr));
}


///////////////////////////////////////////////////////////////////////////////
//
// BUSES
//
///////////////////////////////////////////////////////////////////////////////


inline static void
sample()
{
	// Strobe the BUSCP signal, which causes all the input flip-flops to
	// simultaneously sample their respective buses.
	clearbit(PORTB, B_BUSCP);
	setbit(PORTB, B_BUSCP);
}


const uint8_t state_addrs[] PROGMEM = {
	XMEM_AB_H, XMEM_AB_M, XMEM_AB_L,    // The Address Bus
	XMEM_DB_H, XMEM_DB_L,		    // The Data Bus
	XMEM_IBUS_H, XMEM_IBUS_L,	    // The IBUS

	XMEM_UCV_H, XMEM_UCV_M, XMEM_UCV_L, // The UCV
};


void
read_full_dfp_state()
{
	// Note: we stop the scanner but don't deselect the front panel. Any
	// reads we perform that also map to FP lights will update the FP. For
	// example, as we read the AC, the front panel's Accumulator lights
	// will also update to the current value on the FPD bus.
	fp_scanner_stop();
	sample();		// Clock data into our own flip flops.

	// Read the buses directly.
	state.ab_h = xmem_read(XMEM_AB_H);
	state.ab_m = xmem_read(XMEM_AB_M);
	state.ab_l = xmem_read(XMEM_AB_L);

	state.db_h = xmem_read(XMEM_DB_H);
	state.db_l = xmem_read(XMEM_DB_L);

	state.ibus_h = xmem_read(XMEM_DB_H);
	state.ibus_l = xmem_read(XMEM_DB_L);

	state.dsr = xmem_read(XMEM_DSR);

	// Read via buffers in the computer.
	state.ucv_h = xmem_read(XMEM_UCV_H);
	state.ucv_m = xmem_read(XMEM_UCV_M);
	state.ucv_l = xmem_read(XMEM_UCV_L);

	fp_scanner_start();
}


inline static void
release_buses()
{
	// Release IBus, AB and DB and deassert bus control signals by setting
	// all of their bits. They're active low.
	PORTC |= BV(C_NIBOE) | BV(C_NABOE) | BV(C_NDBOE) |
		BV(C_NMEM) | BV(C_NIO) | BV(C_NR) | BV(C_NW);

	// Tristate bus control signals and the rest of control bus by clearing
	// their NMEM, NIO, NR, NW and NMCVOE bits in the DDRC and 
	DDRC &= ~(BV(C_NMEM) | BV(C_NIO) | BV(C_NR) | BV(C_NW));

	// Tristate the µCV (control vector) outputs too.
	PORTE |= BV(E_NMCVOE);
}


inline static void
release_ibus()
{
	setbit(PORTC, C_NIBOE);
}


inline static void
release_ucv()
{
	// Tristate bus control signals and the rest of control bus by clearing
	// their NMEM, NIO, NR, NW and NMCVOE bits in the DDRC and 
	DDRC &= ~(BV(C_NMEM) | BV(C_NIO) | BV(C_NR) | BV(C_NW));

	// Tristate the µCV (control vector) outputs too.
	PORTE |= BV(E_NMCVOE);
}


inline static MUST_CHECK errno_t
drive_ibus()
{
	if (!state.is_halted) {
		return ERR_NHALTED;
	}

	clearbit(PORTC, C_NIBOE);
	return ERR_SUCCESS;
}


inline static MUST_CHECK errno_t
drive_control()
{
	if (!state.is_halted) {
		return ERR_NHALTED;
	}

	clearbit(PORTE, E_NMCVOE);
	return ERR_SUCCESS;
}



// The Address Bus is a 24-bit bus driven by three '574 registers. They are
// tristated directly by controlling the MCU's pin C_NABOE. To put a 24-bit
// value on the AB, we just write the addresses to the registers one byte at a
// time and clear the C_NABOE pin. (it's active low)

inline void
tristate_ab()
{
	setbit(PORTC, C_NABOE);
}


inline static MUST_CHECK errno_t
drive_ab()
{
	// If the BUS board is present and the processor isn't halted, we can't
	// drive the AB.
	if (state.have_bus && !state.is_halted) {
		// Tristate the AB driver. Should already be tristated since
		// drive_ab() is being called, but let's be safe.
		tristate_ab();
		return ERR_NMASTER;
	}

	// Enable the AB drivers. This will enable all three AB drivers.
	clearbit(PORTC, C_NABOE);
	return ERR_SUCCESS;
}


inline static MUST_CHECK errno_t
write_ab(const uint16_t addr, const uint8_t aext)
{
	// If the BUS board is present and the processor isn't halted, we can't
	// write to the AB.
	if (state.have_bus && !state.is_halted) {
		tristate_ab();
		return ERR_NMASTER;
	}

	// Drive the Address Bus ourselves.
	xmem_write(XMEM_AB_L, addr & 0xff);
	xmem_write(XMEM_AB_M, (addr >> 8) & 0xff);
	xmem_write(XMEM_AB_H, aext);
}


///////////////////////////////////////////////////////////////////////////////
//
// DATA BUS
//
///////////////////////////////////////////////////////////////////////////////

inline static void
tristate_db()
{
	setbit(PORTC, C_NDBOE);
}


inline static errno_t
drive_db()
{
	// If the BUS board is present and the processor isn't halted, we can't
	// drive the DB.
	if (state.have_bus && !state.is_halted) {
		// Tristate the DB driver. Should already be tristated since
		// drive_db() is being called, but let's be safe.
		tristate_db();
		return ERR_NMASTER;
	}

	// Enable the DB drivers. This will enable both DB buffers.
	clearbit(PORTC, C_NDBOE);
	return ERR_SUCCESS;
}


static errno_t
write_db(const word_t data)
{
	// If the BUS board is present and the processor isn't halted, we can't
	// write to the DB.
	if (state.have_bus && !state.is_halted) {
		tristate_db();
		return ERR_NMASTER;
	}

	// Drive the Data Bus ourselves.
	xmem_write(XMEM_DB_L, data & 0xff);
	xmem_write(XMEM_DB_H, (data >> 8) & 0xff);
}


///////////////////////////////////////////////////////////////////////////////
//
// CFT CLOCK CONTROL
//
///////////////////////////////////////////////////////////////////////////////

// Prescaler values for CSn2:0 bits. Three-bit vectors ready to be written to a
// register. (don't use BV).

#define PSV_STOP    0b000	// No clock
#define PSV_1       0b001	// No prescaling
#define PSV_8       0b010	// CLKI/O / 8
#define PSV_64      0b100	// CLKI/O / 64
#define PSV_256     0b110       // CLKI/O / 256
#define PSV_1024    0b111	// CLKI/O / 1024


// This both starts the clock AND goes to full speed.
void
clk_fast()
{
	// Note: we can't set the clock to fast mode without starting it. So if
	// the clock is currently stopped, do nothing here.

	if (state.clk_stopped) return;

	state.clk_fast = 1;
	TCCR1A = 0;		  // Disable the MCU slow clock timer
	setbit(PORTB, B_FPCLKEN); // Enable the CFT's clock generator.
}


void
clk_setfreq(uint8_t prescaler, uint16_t div)
{
	state.clk_prescaler = prescaler;
	state.clk_div = div;

	clearbit(PORTB, B_FPCLKEN); // Disable the CFT's own clock;

	// COM1A = 00
	// COM1B = 01 (toggle OC1B on compare match)
	// WGM   = 0100 (CTC mode)

	// TCCR1A = 0x10;			       // Toggle OC1B on compare match
	// TCCR1B = 8 | (prescaler & 7);	       // CTC, prescaler
	// TIMSK1 = 2;
	// OCR1B = div;

	// Program the timer to generate the requested rate.
	TCCR1B = BV(WGM12) | (prescaler & 7); // Select CTC, set prescaler
	OCR1A = div;			      // Note: automagic 16-bit register write!
}


void
clk_slow()
{
	// 16000000 / (2 * 1024 * (1 + 97)) ≅ 79.72 Hz.
	clk_setfreq(PSV_1024, 97);

	// Enable the clock output unless the clock is stopped.
	if (!state.clk_stopped) TCCR1A = _BV(COM1B0);
}


void
clk_creep()
{
	// 16000000 / (2 * 1024 * (1 + 976)) ≅ 8 Hz.
	clk_setfreq(PSV_1024, 976);

	// Enable the clock output unless the clock is stopped.
	if (!state.clk_stopped) TCCR1A = _BV(COM1B0);
}


void
clk_start()
{
	if (state.clk_fast) {
		clk_start_fast();
	} else {
		// Restart with a slow clock.
		clk_setfreq(state.clk_prescaler, state.clk_div);
		TCCR1A = _BV(COM1B0); // Start toggling OC1B (FPµSTEP).
		state.clk_stopped = 0;
	}
}


void
clk_stop()
{
	// Disconnect the FPUSTEP-IN pin from the timer. The pin will stay
	// in its last state.
	TCCR1A = 0;		// Disconnect FPUSTEP-IN pin, no pulses.

	// And now disable the processor's full-speed clock too.
	clearbit(PORTB, B_FPCLKEN);

	state.clk_stopped = 1;
}


///////////////////////////////////////////////////////////////////////////////
//
// RUN CONTROL (RUN/STEP/STOP FSM)
//
///////////////////////////////////////////////////////////////////////////////

inline static void
rc_freeze()
{
	clearbit(PORTB, B_NCLR);
}


inline static void
rc_thaw()
{
	setbit(PORTB, B_NCLR);
}


inline static void
rc_reset()
{
	clearbit(PORTB, B_NCLR);
	setbit(PORTB, B_NCLR);
}


static errno_t
rc_wait()
{
	for(;;) {
		if (PIND & BV(D_NWAIT)) {
			return ERR_SUCCESS;
		}
	}

	// TODO: implement actual timeout
	return ERR_TIMEOUT;
}


errno_t
rc_halt()
{
	if (state.is_halted) return ERR_HALTED;
	setbit(PORTD, D_NSTEP_RUN); // Stop running

	// The FSM will stop at the next fetch→execute transition. We
	// should wait for that.
	return rc_wait();
}


errno_t
rc_run()
{
	if (!state.is_halted) return ERR_NHALTED;
	clearbit(PORTD, D_NSTEP_RUN); // Start running.
	return ERR_SUCCESS;
}


errno_t
rc_step()
{
	if (!state.is_halted) return ERR_NHALTED;

	// The only way to perform a single step using the FSM is to very
	// briefly strobe the STEP/RUN# signal. The strobe must be shorter than
	// a single CFT instruction. We cheat by stopping the clock while
	// strobing. The CFT is a fully static design and doesn't mind clock
	// variations.
	
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		clk_stop();
		clearbit(PORTD, D_NSTEP_RUN); // Start of strobe
		setbit(PORTD, D_NSTEP_RUN);   // End of strobe
		clk_start();
	}

	return rc_wait();
}


errno_t
rc_ustep()
{
	if (!state.is_halted) return ERR_NHALTED;

	// Again, stop the clock while strobing the µSTEP# signal.

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		clk_stop();
		clearbit(PORTD, D_NMSTEP); // Start of strobe
		setbit(PORTD, D_NMSTEP);   // End of strobe
		clk_start();
	}

	return rc_wait();
}


///////////////////////////////////////////////////////////////////////////////
//
// THE FRONT PANEL
//
///////////////////////////////////////////////////////////////////////////////

void
set_fpramrom(bool_t rom)
{
	// Controls the FPRAM/ROM signal to the memory manager. High
	// maps RAM+ROM on reset, Low maps RAM only.

	if (rom) setbit(PORTB, B_FPROM);
	else clearbit(PORTB, B_FPROM);
}


inline static void
fp_scanner_stop()
{
	setbit(PORTD, D_NSCANEN);
}


inline static void
fp_scanner_start()
{
	clearbit(PORTD, D_NSCANEN);
}


inline static void
fp_grab()
{
	PORTD |= BV(D_NSCANEN) | BV(D_NPANELEN);
}


inline static void
fp_release()
{
	PORTD &= ~(BV(D_NSCANEN) | BV(D_NPANELEN));
}


// FP addresses are in the range 0 to 19, first across then
// down. Module A1 is top left (address 0), module D1 is top right
// (address 3), module D5 is bottom right (address 19).

#define fp_coords(row, col) ((((row) & 3) << 2) | (col))

// PRECONDITION: call fp_grab() first.
inline static void
fp_write(uint8_t module, uint8_t row, uint8_t value)
{
	xmem_write((row << 2) | (module & 3), value);
}


inline static void
fp_write_addr(xmem_addr_t addr, uint8_t value)
{
	xmem_write(addr & 0x1f, value);
}


void
set_mfd(mfd_t mfd)
{
	// The two MFD bits (MFD0 & MFD1) are mapped to PE3 and PE4
	// respectively, so this task is relatively simple.
	PORTE = (PORTE & (~E_MFDMASK)) | ((mfd & 3) << E_MFD0);
}


inline word_t
get_or()
{
	return (state.or_h << 8) | state.or_l;
}


void
set_or(word_t value)
{
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		state.or_l = value & 0xff;
		state.or_h = (value >> 8) & 0xff;
		fp_scanner_stop();
		xmem_write(XMEM_OR_H, state.or_h);
		xmem_write(XMEM_OR_L, state.or_l);
		fp_scanner_start();
	}
}


// Implement the TEST functionality by grabbing the front panel and overriding
// all the lights to ON. This will even light up LEDs hidden by the front
// panel's fascia.
void
fp_start_light_test()
{
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		fp_grab();
		for (xmem_addr_t a = 0; a < 20; a++) fp_write_addr(a, 0xff);
	}
}


void
fp_stop_light_test()
{
	fp_release();
}



///////////////////////////////////////////////////////////////////////////////
//
// TRANSACTIONS ORIGINATED BY THE CFT
//
///////////////////////////////////////////////////////////////////////////////

inline static void
clear_ws()
{
	clearbit(PORTC, C_CLRWS);
	setbit(PORTC, C_CLRWS);
}


///////////////////////////////////////////////////////////////////////////////
//
// INITIALISATION
//
///////////////////////////////////////////////////////////////////////////////

// Initialise essential AVR registers to sane (and idle) defaults.
inline static void
avr_init()
{
	MCUCSR = BV(JTD);	//  Disable JTAG

	XMCRA = 0;		// No wait states
	XMCRB = BV(XMBK) | 	// Enable Bus Keeper (hold) on Port A (FPA/FPD)
		BV(XMM0) |	// 8-bit Address bus, recover all of Port C
		BV(XMM1) |
		BV(XMM2);

	MCUCR =  BV(SRE);	// *NOW* we can enable XMEM.

	// XMEM overrides our settings for Port A.

	// Configure other ports. Use binary for brevity.

	//         76543210
	DDRB =   0b11110001; // PB1–3 left as inputs.
	PORTB =  0b10000000; // Init, step 1.
	PORTB =  0b10001000; // Init, step 2, CLR# rising edge

	DDRC =   0b00001111; // Port C direction, bus control tristated
	PORTC =  0b00001110; // Init, step 1. Disable pull-ups on bus control
	PORTC =  0b00001111; // Init, step 2, CLRWS raising edge

	DDRD =   0b11111100; // Port D direction
	PORTD =  0b11011000; // Port D init. (Lights on, FP scan disabled, FPOE disabled)

	DDRE =   0b11111100; // Port E direction
	PORTE =  0b10100100; // Port E init, assert FPRESET#, deassert others.

	DDRF =   0b00001111; // Port F direction (SWA/SWD)
	PORTF =  0b11110000; // Enable pull-ups on inputs.

	//         ---43210
	DDRG =   0b00000000; // Port G direction, XMEM control pins
	PORTG =  0b00000000; // Disable pull-ups.
}


static inline void
enable_cft_interrupts()
{
	// Disable INT0
	clearbit(EIMSK, INT0);
	// Set falling edge sensitivity (ISC01=1, ISC00=0)
	EICRA = (EICRA & 0b11111100) | BV(ISC01);
	// Enable INT0
	setbit(EIMSK, INT0);
}


void
hw_init()
{
	avr_init();
	release_buses();
	rc_freeze();
	clear_ws();

	// Initialise serial port and interrupts
	serial_init();

	// Enable interrupts for CFT-originated transactions
	enable_cft_interrupts();

	// Initialise switch deboucing and enable switch timer ISR
	sw_init();
	
	// Enable the watchdog.
	wdt_enable(WATCHDOG_TIMEOUT);


	


	




#warning "PORTED TO THIS POINT"
#if 0
	// Time = 4

	// Set up the switch sampling/debouncing timer. Atmega168 datasheet,
	// p. 104.
	//
	// Sampling rate: 14.7456 MHz / (2 * 1024 * 256) = 28.125 Hz
	//
	// That's 35.56 ms between samples, plenty of time for
	// switches to stop bouncing.
	
	// Timer 1 (the slow clock input to the CFT processor) is set further
	// down, on demand.

	// Time = 5

	// Wait for signals to stabilise.
	_delay_ms(1500);

	// Is a processor attached to the system?
	if (detect_cpu()) {
		// Mark the processor as present
		flags |= FL_PROC;
		// Disable the bus pull-ups. Note: active low!
		set_buspu(1);
	} else {
		// Enable the bus pull-ups. They start enabled after reset, but
		// this couldn't hurt.
		set_buspu(0);
	}

	// Run diagnostics
	dfp_diags();

	// Read the initial state of the front panel switches.
	deb_sample(0);

	// Set the initial clock values on the speed switch. Don't start the
	// clock yet.
	uint8_t spd = (_swleft & (SWL_SLOW|SWL_FAST)) >> SWL_SPD_SHIFT;
	if (spd == 2) {
		_clk_prescale = PSV_1024;
		_clk_div = 89;
	} else if (spd == 3) {
		_clk_prescale = PSV_1024;
		_clk_div = 899;
	} else {
		_clk_prescale = 0;
		_clk_div = 0;
	}

	// Don't write anything to the control bus just yet.
	defercb = 255;

	// Set the initial RAM/ROM values
	panel_rom(_swright & SWR_ROM);
	
	// If the RAM mapping was selected, start halted. The machine is
	// unprogrammed and the operator will take it from there. Otherwise,
	// with ROM mapped, start running. (note: 0 = RAM, non-zero = ROM);
	if (_swright & SWR_ROM) {
		// Switch is in the ROM position. Start the processor.
		clk_start();		    // Start the clock.
		set_halt(0);		    // De-assert HALT#, set FPRAM signal
		set_steprun(0);		    // Lock the run control FSM
		set_fprunstop(1);	    // Set the LEDs.
	} else {
		// Switch is in the RAM position. Start halted.
		clk_stop();		    // Already stopped, but do so anyway
		set_halt(1);		    // Assert HALT#, set FPRAM signal
		set_fprunstop(0);
		flags |= FL_HALT;           // The debugging interface needs to know.
	}

	// Update the control bus
	defercb = 0;
	write_cb();

	// Perform a full machine RESET cycle, which will either strobe
	// FPRESET# (only the de-assertion of which is needed), or perform a
	// standalone RESET#/RSTHOLD# cycle if the processor is missing.
	perform_reset();

	// Now de-assert the various reset signals explicitly. Can't hurt.
	cb[0] |= CB0_NIRQ1 | CB0_NIRQ6;
	cb[1] |= CB1_NFPRESET | CB1_NRESET;

	// Set up the console ring buffer
	ringbuf.ip = ringbuf.op = 0;
	
	// Enable the global interrupt flag
	sei();

#endif // 0
}


void
hw_tick()
{
	// This is not needed.
}


void
hw_done()
{
	// The AVR hardware is never uninitialised.
}


///////////////////////////////////////////////////////////////////////////////
//
// SWITCH SCANNING
//
///////////////////////////////////////////////////////////////////////////////

static uint8_t _switches[64];

static inline void
sw_init()
{
	// Initialise the switch state.
	for (uint8_t i = 0; i < 64; i++) {
		_switches[i] = 0;
	}

        // Program Timer 3 to scan switches and perform other housekeeping
        // tasks.
	TCCR3A = 0b00000000;	// Normal port operation, no pins driven.
	TCCR3B = 0b00001101;    // CTC mode, CLK÷1024 prescaler

	// Set the A count comparator and trigger an interrupt when it matches.
	OCR3A = 259;		// CLKIO÷1024÷(259+1) MHz ≅ 60.09 Hz.
	ETIMSK = BV(OCIE3A);	// Interrupt on timer compare match
}


// There are 64 switch data lines in total arranged in an unusual (but
// convenient) 16×4 matrix. We use 64 bytes (optimising for speed rather than
// space) and this way we offer 8-sample debouncing. To software debounce, we
// shift the previous value to the right by one place and OR with the value
// read from the switch.
//
// PORT F:
//
//     7      6       5     4      3      2      1     0
// +------+------+------+------+------+------+------+------+
// | SWD3 | SWD2 | SWD1 | SWD0 | SWA3 | SWA2 | SWA1 | SWA0 |
// +------+------+------+------+------+------+------+------+
// | INPUTS                    | OUTPUTS                   |
// +---------------------------+---------------------------+

static inline void
sw_scan()
{
	for (uint8_t swa = 0, i = 0; swa < 16; swa++) {
		PORTF = (PORTF & 0xf0) | (swa & 0x0f);
		_switches[i] = (_switches[i] << 1) | (PORTF & 0x10 ? 1 : 0); i++;
		_switches[i] = (_switches[i] << 1) | (PORTF & 0x20 ? 1 : 0); i++;
		_switches[i] = (_switches[i] << 1) | (PORTF & 0x40 ? 1 : 0); i++;
		_switches[i] = (_switches[i] << 1) | (PORTF & 0x80 ? 1 : 0); i++;
	}
}


ISR(TIMER0_COMP_vect)
{
	// TODO
}


// To test if a switch has been pressed, the last four samples (one bit per
// sample, so 0b1111, 0xf) must agree. So each switch may be in three states:
// SWITCH_PRESSED, SWITCH_RELEASED, and bouncing (any other value).
#define SWITCH_DEBOUNCE_MASK  0xf
#define SWITCH_PRESSED        SWITCH_DEBOUNCE_MASK
#define SWITCH_RELEASED       0

inline static uint8_t
get_switch(uint8_t swidx)
{
	return _switches[swidx & 63] & SWITCH_DEBOUNCE_MASK;
}


///////////////////////////////////////////////////////////////////////////////
//
// THE SERIAL PORT
//
///////////////////////////////////////////////////////////////////////////////

// If running on a 1MHz clock, doubling the serial clock rate will give us much
// better accuracy. For example, according to the Atmega168 datasheet, you get
// -7% timing error with U2X0=0, and +0.2% with U2X1=1. The bps rate
// calculation is different, of course.
//
// This is historical though. The current implementation of the DFP2 runs at
// 16MHz.

#if F_CPU == 1000000
#  define INIT_UCSR0A _BV(U2X0)
#  define INIT_RATE_DIV 8UL
#else
#  define INIT_UCSR0A 0
#  define INIT_RATE_DIV 16UL
#endif // F_CPU == 1000000

#define INIT_RATE ((F_CPU / (INIT_RATE_DIV * SERIAL_BPS)) - 1)
#define INIT_RATE_L (INIT_RATE & 0xff)
#define INIT_RATE_H ((INIT_RATE & 0xf00) >> 8)

#define BPSRATE(x) ((F_CPU / (INIT_RATE_DIV * (x))) - 1)
#define BPS BPSRATE(SERIAL_BPS)


inline void
serial_init()
{
	UCSR0A = INIT_UCSR0A;

	// Configure the serial port.
	UCSR0B =
		BV(TXEN0) |	// Enable data transmission
		BV(RXEN0);	// Enable data reception

	// Set asynchronous mode, no parity, 8 bits, 1 stop bit. This is the
        // default, so we don't actually have to set UCSR0C for this
	// configuration. This saves another 4 bytes of program memory.

	//         -APPSCC-
	UCSR0C = 0b00000110;	// Async, no parity, 1 stop bit, 8 data bits.

	// Set the bps rate.
	UBRR0L = BPS & 0xff;
	UBRR0H = (BPS >> 8) & 0xff;

	// TODO: check that this can be safely removed.
	// report_pstr(PSTR("\033[0m\n\r\n\r"));

        // We can enable interrupt handling now.
	UCSR0B |= BV(RXCIE0);		// Enable RX complete interrupt
}


volatile uint8_t serial_errors = 0;

// Wait until the serial port is ready, then send a character to it.
inline void
serial_write(unsigned char c)
{
	loop_until_bit_is_set(UCSR0A, UDRE0);
	UDR0 = c;
        //_delay_ms(11);
}


// Serial receive interrupt handler.
ISR(USART0_RX_vect)
{
	uint8_t c;

	// Ensure we don't have any framing errors. If we do, ignore the received
	// character.
	if (!bit_is_clear(UCSR0A, FE0)) {
		serial_errors++;
		c = UDR0;
		return;
	}
	
	// Process the character directly from its register.
	c = UDR0;

	// Dip into the protocol layer and add the character to the current
	// line buffer. This also implements basic line editing.
	proto_input(c);
}







///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////





#if 0






void
addr_inc()
{
	extern uint16_t addr;
	addr++;
	_pc++;
	strobe_incpc();
}








// #define C_DEBIN     PC0
// #define C_VPIN      PC1
// #define C_ICLK      PC2
// #define C_DOUT      PC3
// #define C_CMD0      PC4
// #define C_CMD1      PC5

// #define C_IDLE      0
// #define C_OUTPUTS   (_BV(C_ICLK) | _BV(C_DOUT) | _BV(C_CMD0) | _BV(C_CMD1))

// #define D_IOCMD     PD2
// #define D_NDBOE     PD3
// #define D_NABOE     PD4
// #define D_NIBUSOE   PD5
// #define D_NCTLOE    PD6
// #define D_COUT      PD7


// #define D_IDLE      (_BV(D_NDBOE) | _BV(D_NABOE) | _BV(D_NIBUSOE) | _BV(D_NCTLOE))
// #define D_OUTPUTS   (_BV(D_NDBOE) | _BV(D_NABOE) | _BV(D_NIBUSOE) | \
// 		     _BV(D_NCTLOE) | _BV(D_COUT))

// #define B_CLRWS     PB0
// #define B_FPCLKEN   PB1
// #define B_FPUSTEP   PB2
// #define B_IOADDR0   PB3
// #define B_IOADDR1   PB4
// #define B_IOADDR2   PB5

// #define B_IDLE      (_BV(B_CLRWS))
// #define B_IOADDR    (_BV(B_IOADDR0) | _BV(B_IOADDR1) | _BV(B_IOADDR2))
// #define B_OUTPUTS   (_BV(B_CLRWS) | _BV(B_FPCLKEN) | _BV(B_FPUSTEP) | B_IOADDR)


/*

static uint16_t _ab;
static uint16_t _db;
static uint16_t _ir;
static uint16_t _pc;
static uint16_t _ac;
static uint8_t _flags;
volatile static uint16_t _swright, _swright0;
volatile static uint16_t _sr, _sr0;
volatile static uint16_t _swleft, _swleft0;
static uint16_t _or;
uint8_t defercb = 0;
static uint8_t _clk_prescale = PSV_1024;
static uint16_t _clk_div = 89;
static uint8_t _stopped = 1;
*/

// static union {
// 	uint8_t  uvec8[4];	// Microcode vector: 24 bits ([3] unused)
// 	uint32_t uvec32;	// Microcode vector as a 32-bit integer
// } _uv;

// uint8_t cb[3] = {
// 	CB0_OUTPUTS,
// 	CB1_OUTPUTS,
// 	CB2_OUTPUTS
// };

// uint16_t icr = 0;
// uint8_t ifr6_operated = 0;
// static uint8_t idle_addr = 0; // Used for diagnostics

ringbuf_t ringbuf;

// #define actuated(bm, sw) (((bm) & (sw)) == 0)

// inline static void
// clr_ws()
// {
// 	// Clear the WS# output.
// 	PORTB &= ~ _BV(B_CLRWS);
// 	PORTB |= _BV(B_CLRWS);
// }


// #define CALC_FREQ(prescaler, hz) ((F_CPU) / (2 * (prescaler)) / (hz))


/*

  Processor detection algorithm.

  The processor houses bus hold chips to terminate the CFT buses. Bus hold will
  maintain any values written to a bus. Without bus hold, the value is
  transient. We write various values to the bus and read them back. If they
  persist over time, a processor has been detected.

  We need to sample the bus repeatedly to avoid parasitic capacitance problems
  (values will decay over time, rather than disappear immediately). The CFT
  backplane has quite a lot of capacitance and our CMOS input stages have very
  high impedance, so we have to wait a long time.

 */


static int
test_bushold(uint16_t val)
{
	write_ab(val);
	drive_ab();
	tristate_ab();

	// Now wait a LONG time. Haven't checked the assembly output and
	// instruction tables, but between 0.05 and 0.1s.
	uint16_t x = 65535;
	while (x--) {
		wdt_reset();
		short_delay();
		short_delay();
	}

	// Sample the bus
	deb_sample(1);		 // Get AB and DB
	if (_ab != val) report_mismatch(PSTR("Bus hold mismatch:"), val, _ab);
	return _ab == val;
	
}



// There are many ways to detect the presence of a processor:
//
// * Test if asserting HALT# also asserts RSTHOLD# (we don't currently read
//   RSTHOLD#).
// * Test if asserting MEM# or IO# drives AB#.
// * Test if bus hold is present (values written to AB/DB are sticky over a
//   long-ish period of time).

#define NUM_PATTERNS 46
static const uint16_t _diag_patterns[NUM_PATTERNS] = {
	0x8000, 0x4000, 0x2000, 0x1000,
	0x0800, 0x0400, 0x0200, 0x0100,
	0x0080, 0x0040, 0x0020, 0x0010,
	0x0008, 0x0004, 0x0002, 0x0001,

	0x7fff, 0xbfff, 0xdfff, 0xefff,
	0xf7ff, 0xfbff, 0xfdff, 0xfeff,
	0xff7f, 0xffbf, 0xffdf, 0xffef,
	0xfff7, 0xfffb, 0xfffd, 0xfffe,

	0x1111, 0x3333, 0x7777,
	0xeeee, 0xcccc, 0x8888,

	0xff00, 0x00ff, 0xf0f0, 0x0f0f, 0xaaaa,
	0x5555, 0xffff, 0x0000,
};

inline static bool_t
detect_cpu()
{

	// TODO: Decide if we need cpu-less mode at all now.
	report_pstr(PSTR(STR_DETPROC STR_DETPROC1));

	return 1;


        // Strategy: hold RESET# and HALT asserted. They should
        // already be asserted, but let's make sure.
	clearflag(cb[1], CB1_NFPRESET);
	setflag(cb[2], CB2_HALT);
	write_cb();
	
	// Write various values to the address bus.
	uint8_t i, found = 1;
	for (i = 0; i < NUM_PATTERNS; i++) {
		if (!test_bushold(_diag_patterns[i])) {
			found = 0;
			return 0;
		}
	}

	// All the patterns worked out.
	report_pstr(found ? PSTR(STR_DETPROC1) : PSTR(STR_DETPROC0));
	return found;
}


#define NUM_REPS 20


static void
dfp_diags()
{
	uint8_t i, j, errors;
	uint16_t code;

	defercb = 0;

	// Test low level stuff first, pretending the processor isn't
	// there. We'll be asserting RESET and HALT while these tests run, to
	// remove the processor from all the buses.

	// Read only tests: first, test the two shift register chains. The
	// IOADDR0 pin is connected to the cascade-in pin of the last shift
	// register, so after sampling, the value of the VPIN (for the virtual
	// panel) and DEBIN (for the debugging shift regs) should be the same
	// as IOADDR0. This allows diagnostics.

	cb[1] |= CB1_NFPRESET | CB1_NRESET | CB1_NRSTHOLD; // De-assert reset signals.
	cb[2] |= CB2_HALT;	// Halted
	write_cb();
	_delay_ms(500);

#if 0
	for(code=0;;code++){
		set_or(code);
		_delay_ms(100);
	}

	///////////////////////////////////////////////////////////////////////////////

	// We'll need to let go of NFPRESET and NRESET now, otherwise we can't
	// set the OR. We keep the processor in the HALT state, though.
	setflag(cb[1], CB1_NFPRESET);
	cb[1] &= ~(CB1_NFPRESET | CB1_NRESET | CB1_NRSTHOLD);
	write_cb();
	
	clr_ws();
	outcmd(CMD_STEPRUN, 1);
	PORTB &= ~_BV(B_FPCLKEN);
	uint16_t x;
	// for (x = 0; x < 65535; x++) {
	// 	clr_ws();
	// }
	for(;;) {
		PORTB ^= _BV(B_FPUSTEP);
		_delay_ms(300);
		cb[2] ^= CB2_FPSTOP;
		write_cb();

		report_pstr(PSTR("PORTB: "));
		x = PORTB;
		report_bin_pad(x, 8);

		report_pstr(PSTR(" PORTC: "));
		x = PORTC;
		report_bin_pad(x, 8);

		report_pstr(PSTR(" PORTD: "));
		x = PORTD;
		report_bin_pad(x, 8);

		report_pstr(PSTR(" CB0: "));
		x = cb[0];
		report_bin_pad(x, 8);

		report_pstr(PSTR(" CB1: "));
		x = cb[1];
		report_bin_pad(x, 8);

		report_pstr(PSTR(" CB2: "));
		x = cb[2];
		report_bin_pad(x, 8);

		report_pstr(PSTR("\n"));
	}
	///////////////////////////////////////////////////////////////////////////////

#endif

	// Report the version
	report_pstr(PSTR(BANNER1));


	set_or(code = 0x102);
	report_pstr(PSTR(STR_D_VPIN));
	for (i = 0; i < NUM_REPS; i++) {
		wdt_reset();
		idle_addr = 0;
		PORTB = (PORTB & ~B_IOADDR) | ((idle_addr & 7) << 3);
		clearbit(PORTB, B_IOADDR0);
		virtual_panel_sample(0);
		if (PINC & _BV(C_VPIN)) goto faulty;
		
		idle_addr = 7;
		PORTB = (PORTB & ~B_IOADDR) | ((idle_addr & 7) << 3);
		setbit(PORTB, B_IOADDR0);
		virtual_panel_sample(0);
		if ((PINC & _BV(C_VPIN)) == 0) goto faulty;
	}
	report_pstr(PSTR(STR_D_OK));
	
	set_or(code = 0x103);
	report_pstr(PSTR(STR_D_DEBIN));
	for (i = 0; i < NUM_REPS; i++) {
		wdt_reset();
		idle_addr = 0;
		PORTB = (PORTB & ~B_IOADDR) | ((idle_addr & 7) << 3);
		clearbit(PORTB, B_IOADDR0);
		deb_sample(0);
		if (PINC & _BV(C_DEBIN)) goto faulty;

		idle_addr = 7;
		PORTB = (PORTB & ~B_IOADDR) | ((idle_addr & 7) << 3);
		setbit(PORTB, B_IOADDR0);
		deb_sample(0);
		if ((PINC & _BV(C_DEBIN)) == 0) goto faulty;
	}
	report_pstr(PSTR(STR_D_OK));

	// The shift regs are working, so we can use them to test other
	// things. Assert RESET# and HALT#. Hardware failsafes should have
	// asserted them automatically on MCU reset, but do it explicitly just
	// in case.
	uint32_t oldflags = flags;
	flags &= ~ FL_PROC;	// (Why) is this necessary?
	//clearflag(cb[1], CB1_NFPRESET);
	setflag(cb[2], CB2_HALT);
	write_cb();

	// uint16_t x =0;
	// for(;;) {
	// 	write_ab(x);
	// 	x = (x + 1) & 0xffff;
	// 	drive_ab();
	// 	//tristate_ab();
	// 	for (j = 0; j < 1; j++) {
	// 		deb_sample(0);
	// 		report_pstr(PSTR("ABUS: "));
	// 		uint32_t x = _ab & 0xffff;
	// 		report_hex(x, 4);
	// 		report_pstr(PSTR("\n"));
	// 		_delay_ms(250);
	// 	}
	// }

	// Does driving the ABUS work?
	set_or(code = 0x104);
	report_pstr(PSTR(STR_D_ABDRV));
	drive_ab();
	errors = 0;
	for (j = 0; j < NUM_REPS; j++) {
		wdt_reset();
		for (i = 0; i < NUM_PATTERNS; i++) {
			write_ab(_diag_patterns[i]);
			deb_sample(0);
			if (_ab != _diag_patterns[i]) {
				if (errors == 0) report_pstr(PSTR(STR_D_FAIL));
				report_mismatch(PSTR(STR_ABERR), _diag_patterns[i], _ab);
				errors++;
			}
		}
		if (errors) break;
	}
	tristate_ab();
	if (errors) goto faulty;
	report_pstr(PSTR(STR_D_OK));

	// Does tristating the ABUS work? Account for bus hold. The
	// value read from the bus should never change from the
	// current one.
	set_or(code = 0x105);
	report_pstr(PSTR(STR_D_ABTRI));
	{
		_delay_ms(2);
		deb_sample(0);
		uint16_t old = _ab;
		for (j = 0; j < NUM_REPS; j++) {
			wdt_reset();
			for (i = 0; i < NUM_PATTERNS; i++) {
				write_ab(_diag_patterns[i]);
				deb_sample(0);
				if (_ab != old) {
					goto faulty;
				}
			}
		}
	}
	report_pstr(PSTR(STR_D_OK));

	// Does driving the DBUS work?
	set_or(code = 0x106);
	report_pstr(PSTR(STR_D_DBDRV));
	drive_db();
	errors = 0;
	for (j = 0; j < NUM_REPS; j++) {
		wdt_reset();
		for (i = 0; i < NUM_PATTERNS; i++) {
			write_db(_diag_patterns[i]);
			deb_sample(0);
			if (_db != _diag_patterns[i]) {
				if (errors == 0) report_pstr(PSTR(STR_D_FAIL));
				report_mismatch(PSTR(STR_DBERR), _diag_patterns[i], _ab);
				errors++;
			}
		}
		if (errors) break;
	}
	tristate_db();
	if (errors) goto faulty;
	report_pstr(PSTR(STR_D_OK));
	
	// Does tristating the ABUS work? Account for bus hold. The
	// value read from the bus should never change from the
	// current one.
	set_or(code = 0x107);
	report_pstr(PSTR(STR_D_DBTRI));
	{
		_delay_ms(2);
		deb_sample(0);
		uint16_t old = _db;
		for (j = 0; j < NUM_REPS; j++) {
			wdt_reset();
			for (i = 0; i < NUM_PATTERNS; i++) {
				write_db(_diag_patterns[i]);
				deb_sample(0);

				if (_db != old) {
					goto faulty;
				}
			}
		}
	}
	report_pstr(PSTR(STR_D_OK));

	flags = oldflags;

	// With the RESET# signal asserted, check there's no bus chatter.
	// clearflag(cb[1], CB1_NFPRESET);
	setflag(cb[2], CB2_HALT);
	write_cb();
	set_or(code = 0x108);
	report_pstr(PSTR(STR_D_RSTBQ));
	for (i = 0; i < (1 + (NUM_REPS << 2)); i++) {
		wdt_reset();
		if (buschatter()) goto faulty;
	}
	report_pstr(PSTR(STR_D_OK));

	perform_reset();	// Let the RESET signals go.

	// Check the AC register.
	set_or(code = 0x109);
	report_pstr(PSTR(STR_D_ACCHK));
	tristate_ab();
	tristate_db();
	for (j = 0; j < NUM_REPS; j++) {
		wdt_reset();
		for (i = 0; i < NUM_PATTERNS; i++) {
			write_ibus(_diag_patterns[i]);
			drive_ibus();
			setup();
			strobe_wac();
			hold();
			tristate_ibus();
			virtual_panel_sample(0);

			if (_ac != _diag_patterns[i]) {
				if (errors == 0) report_pstr(PSTR(STR_D_FAIL));
				report_mismatch(PSTR(STR_ACERR), _diag_patterns[i], _ac);
				errors = 1;
			}
		}
		if (errors) break;
	}
	tristate_ibus();
	if (errors) goto faulty;
	report_pstr(PSTR(STR_D_OK));

	// Check the PC register.
	set_or(code = 0x110);
	report_pstr(PSTR(STR_D_PCCHK));
	tristate_ab();
	tristate_db();
	for (j = 0; j < NUM_REPS; j++) {
		wdt_reset();
		for (i = 0; i < NUM_PATTERNS; i++) {
			write_ibus(_diag_patterns[i]);
			drive_ibus();
			setup();
			strobe_wpc();
			hold();
			tristate_ibus();
			virtual_panel_sample(0);

			if (_pc != _diag_patterns[i]) {
				if (errors == 0) report_pstr(PSTR(STR_D_FAIL));
				report_mismatch(PSTR(STR_PCERR), _diag_patterns[i], _pc);
				errors = 1;
			}
		}
		if (errors) break;
	}
	tristate_ibus();
	if (errors) goto faulty;
	report_pstr(PSTR(STR_D_OK));

	// Check the IR register.
	set_or(code = 0x111);
	report_pstr(PSTR(STR_D_IRCHK));
	tristate_ab();
	tristate_db();
	for (j = 0; j < NUM_REPS; j++) {
		wdt_reset();
		for (i = 0; i < NUM_PATTERNS; i++) {
			write_ibus(_diag_patterns[i]);
			drive_ibus();
			setup();
			strobe_wir();
			hold();
			tristate_ibus();
			virtual_panel_sample(0);

			if (_ir != _diag_patterns[i]) {
				if (errors == 0) report_pstr(PSTR(STR_D_FAIL));
				report_mismatch(PSTR(STR_IRERR), _diag_patterns[i], _ir);
				errors = 1;
			}
		}
		if (errors) break;
	}
	tristate_ibus();
	if (errors) goto faulty;
	report_pstr(PSTR(STR_D_OK));
	return;

faulty:
	// Endlessly print out the ‘faulty’ string.
	cli();

	// Crash here. The watchdog will cold reset us in a bit.
	wdt_enable(WATCHDOG_TIMEOUT);
	for (;;) {
		// Blink the STOP light slowly. Hopefully this will work.
		cb[2] ^= CB2_FPSTOP;
		write_cb();
		if (cb[2] & CB2_FPSTOP) {
			set_or(code);
			style_error();
			report_pstr(PSTR(STR_DIAGF));
			_delay_ms(1000);
		} else {
			set_or(0);
			_delay_ms(100);
		}
	}
}


// Initialisation timeline:
//		    
// Time     012  3456
// IBUSOE#  zHH	    
// DBOE#    zH H    
// ABOE#    zH  H   
//          	    
// FPCLKEN  z 	    
// FPUSTEP  z 	    
//		    
// BUSPU         H 2
// CTLOE# 1 zH	    
//          	    
// RESET#   z 	    
// RSTHOLD# z 	    
// FPRAM#   z 	    
// FPRESET# z 	    
// W#       z 	    
// WEN#     z 	    
// R#       z 	    
// MEM#     z 	    
// IO#      z 	    
// HALT#    z     z 3
// FPRUN    z 	    
// FPSTOP   z 	    
// IRQ1     z 	    
// IRQ6     z 	    
// CB-INCPC z 	    
// CB-WAC   z 	    
// CB-RPC   z 	    
// CB-WAR   z 	    
// CB-WIR   z 	    
// CB-WPC   z 	    
		    
//		    
// 1 All Control Bus signals floating while CTLOE# high.
// 2 High if processor missing, low if present
// 3 HALT 	    
///////////////////////////////////////////////////////////////////////////////
//
// SERIAL I/O
//
///////////////////////////////////////////////////////////////////////////////


unsigned char
query_char(int timeout_usec)
{
	// The AVR version reads characters in the USART0 receive ISR
	// (in serial.c). Nothing to do here.
	return 0;
}


unsigned char
read_next_char()
{
	// The AVR version reads characters in the USART0 receive ISR
	// (in serial.c). Nothing to do here.
	return 0;
}


///////////////////////////////////////////////////////////////////////////////
//
// INPUT
//
///////////////////////////////////////////////////////////////////////////////


// Samples and reads:
//
// * The Address Bus (AB)
// * The Data Bus (DB)
// * The front panel switches
// * The PFP DIP switches
//
// If busonly is non-zero, only the AB and DB will be read in (but all signals
// will be sampled).

// Waveform:
//         __   ___________________________________
// SAMPLE#   \_/
//         _______                              ___
// DEBEN#         \____________________.....___/
//                     ___     ___        
// ICLK    ___________/   \___/   \___/.....\______
//
// DEBIN   XXXXXXXXXXXXXXX<   0   ><  1   >...


static uint8_t
sample_shift_registers(uint8_t in)
{
	uint8_t val = 0;
	uint8_t i = 0x80;
	while (i) {
		//if (_debug) serial_write(PINC & _BV(in) ? '1' : '0');
		if (PINC & _BV(in)) val |= i;

		clearbit(PORTC, C_ICLK);
		setbit(PORTC, C_ICLK);

		i >>= 1;
	}
	return val;
}


static uint8_t
sample_shift_registers_reverse(uint8_t in)
{
	uint8_t val = 0;
	uint8_t i = 1;
	while (1) {
		//if (_debug) serial_write(PINC & _BV(in) ? '1' : '0');
		if (PINC & _BV(in)) val |= i;

		clearbit(PORTC, C_ICLK);
		setbit(PORTC, C_ICLK);

		if (i == 0x80) break;

		i <<= 1;
	}
	return val;
}


static void
out_shift_registers(uint8_t val, uint8_t clk)
{
	// The loop is unrolled and we use a multistrobe context for
	// faster shifting. We get ~205 kbps with loops and individual
	// strobes, ~820 kbps with this technique.
	_multistrobe_start(clk);
		
	bit(PORTC, C_DOUT, val & 0x80); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x40); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x20); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x10); _multistrobe_pulse();
		
	bit(PORTC, C_DOUT, val & 0x08); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x04); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x02); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x01); _multistrobe_pulse();
		
	_multistrobe_end(clk);
}

static void
out_shift_registers16(uint16_t val, uint8_t clk)
{
	// The loop is unrolled and we use a multistrobe context for
	// faster shifting. We get ~205 kbps with loops and individual
	// strobes, ~820 kbps with this technique.
	_multistrobe_start(clk);
		
	bit(PORTC, C_DOUT, val & 0x8000); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x4000); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x2000); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x1000); _multistrobe_pulse();
		
	bit(PORTC, C_DOUT, val & 0x0800); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x0400); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x0200); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x0100); _multistrobe_pulse();
		
	bit(PORTC, C_DOUT, val & 0x0080); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x0040); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x0020); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x0010); _multistrobe_pulse();
		
	bit(PORTC, C_DOUT, val & 0x0008); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x0004); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x0002); _multistrobe_pulse();
	bit(PORTC, C_DOUT, val & 0x0001); _multistrobe_pulse();
		
	_multistrobe_end(clk);
}



// Sample the DEB bus
//
// Obtains:
//
// * Address bus
// * Data bus
// * If quick is 0:
//   * Switch register
//   * DIP switches
//   * Front panel switches

void
deb_sample(bool_t quick)
{
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		//tristate_ab();
		//tristate_db();
		
		// Sample data (all buses to shift registers)
		strobecmd(CMD_SAMPLE);
		
		// Enable the debug bus shift registers
		clearbit(PORTC, C_ICLK);
		outcmd(CMD_DEBEN, 1); // Inverted in hardware
		
		// Now read in data in groups of 8 bits (makes it easier for the 8-bit
		// AVR).
		_ab = sample_shift_registers(C_DEBIN) << 8 |
			sample_shift_registers(C_DEBIN);
		
		_db = sample_shift_registers(C_DEBIN) << 8 |
			sample_shift_registers(C_DEBIN);
		
		if (!quick) {
			_swright = sample_shift_registers(C_DEBIN) << 8 |
				sample_shift_registers(C_DEBIN);
			_sr = sample_shift_registers_reverse(C_DEBIN) |
				sample_shift_registers_reverse(C_DEBIN) << 8;
			_swleft = sample_shift_registers(C_DEBIN) << 8 |
				sample_shift_registers(C_DEBIN);
		}
		
		// Lock down the bus shift registers
		outcmd(CMD_DEBEN, 0);
	}
}


inline uint16_t
get_ab()
{
	return _ab;
}


inline uint16_t
get_db()
{
	return _db;
}


inline void
set_db(uint16_t db)
{
	_db = db;
}


inline void
set_sr(const uint16_t sr)
{
	_sr = sr;
}


inline uint16_t
get_sr()
{
	return _sr;
}


inline uint16_t
get_lsw()
{
	return _swleft;
}


inline uint16_t
get_rsw()
{
	return _swright;
}

// inline uint32_t
// get_sw()
// {
// 	uint32_t res = ((uint32_t)_swleft << 16) | (uint32_t)_swright;
// 	return res;
// }


// Samples and reads:
//
// * Flags
// * Signals used for bus-side command decoding
// * Microcode vector
// * IR
// * PC
// * AC

// Waveform:
//         __   ___________________________________
// SAMPLE#   \_/
//         _______                              ___
// VPEN#          \____________________.....___/
//                     ___     ___        
// ICLK    ___________/   \___/   \___/.....\______
//
// VPIN    XXXXXXXXXXXXXXX<   0   ><  1   >...


void
virtual_panel_sample(bool_t quick)
{
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		// Sample data (all buses to shift registers)
		strobecmd(CMD_SAMPLE);

		// Enable the debug bus shift registers
		clearbit(PORTC, C_ICLK);
		outcmd(CMD_VPEN, 1); // Inverted in hardware

		// Now read in data in groups of 8 bits (makes it easier for the 8-bit
		// AVR.
		_flags = sample_shift_registers(C_VPIN);
	
		if (!quick) {
			_uv.uvec8[2] = sample_shift_registers(C_VPIN) & 0x9f;
			_uv.uvec8[1] = sample_shift_registers(C_VPIN);
			_uv.uvec8[0] = sample_shift_registers(C_VPIN);

			// WEN# and R# are provided separately. Invert them and
			// patch them into the microcode vector. This leaves us
			// with two free input bits in the uCode vector shift
			// register for future expansion or debugging.
			if ((_flags & 0x40) == 0) _uv.uvec8[2] |= 0x40; // W = !WEN#
			if ((_flags & 0x80) == 0) _uv.uvec8[2] |= 0x20; // R = !R#

			_ir = sample_shift_registers(C_VPIN) << 8 |
				sample_shift_registers(C_VPIN);
			_pc = sample_shift_registers(C_VPIN) << 8 |
				sample_shift_registers(C_VPIN);
			_ac = sample_shift_registers(C_VPIN) << 8 |
				sample_shift_registers(C_VPIN);
		}

		// Lock down the bus shift registers
		outcmd(CMD_VPEN, 0);
	}
}


inline uint8_t
get_misc()
{
	return _flags;
}


inline uint32_t
get_uvec()
{
	return _uv.uvec32;
}


inline uint16_t
get_ir()
{
	return _ir;
}


inline uint16_t
get_pc()
{
	return _pc;
}


inline uint16_t
get_ac()
{
	return _ac;
}


///////////////////////////////////////////////////////////////////////////////
//
// OUTPUT
//
///////////////////////////////////////////////////////////////////////////////

inline void
drive_ibus()
{
	clearbit(PORTD, D_NIBUSOE);
}


void
write_ibus(const uint16_t ibus)
{
	out_shift_registers16(ibus, CMD_IBUSCLK);

	// Move data from ALL the shift registers to their respective output
	// registers. Tristated output registers will of course not have any
	// effects.
	strobecmd(CMD_STCP);
}


inline void
tristate_ibus()
{
	setbit(PORTD, D_NIBUSOE);
}



///////////////////////////////////////////////////////////////////////////////
//
// STROBES AND MISCELLANEOUS SIGNALS
//
///////////////////////////////////////////////////////////////////////////////


void
wait_for_halt(bool_t reckless)
{
	// This will obviously lock up the MCU if the HALT condition isn't
	// seen. We want this.
	flags |= FL_BUSY | FL_STOPPING;
	uint16_t timeout = 6000;
	while (timeout--) {
		wdt_reset();

		// Read the WAIT# signal from the first (highest order) shift
		// register of the virtual panel.
		virtual_panel_sample(1);

		// report_pstr(PSTR("-- FLAGS: ")); // 93 -> b3
		// uint32_t x = _flags;
		// report_hex(x, 4);
		// report_nl();

		// We need to scale our timeouts, otherwise the
		// processor will never stop when the clock is really
		// slow. This should take care of the worst case
		// scenario.
		if (_clk_prescale == PSV_1024) _delay_ms(100);
		else if (_clk_prescale == PSV_256) _delay_ms(30);
		else if (_clk_prescale == PSV_64) _delay_ms(3);

		// Wait until the clock-synchronous state machine is done.
		if ((get_flags() & CFL_NWAIT) != 0) break;
	}

	// When we have no CPU, go through the motions but don't fail because
	// the state machine will never get tot he STOP state.
	if ((flags & FL_PROC) == 0) return;

	// Set the FL_HALT flag first because assert_halted() checks
	// that before proceeding to proper tests.
	flags |= FL_HALT;

	if (!reckless && !assert_halted()) {
		// Failed to halt. Crash here.
		flags &= ~FL_HALT; // We're not really halted
		set_or(0x911);
		cli();
		for (;;) {
			style_error();
			report_pstr(PSTR(STR_HLTTO));
			// Blink the STOP light slowly. Hopefully this will work.
			_delay_ms(1000);
			cb[2] ^= CB2_FPSTOP;
			write_cb();
		}
	}

	flags &= ~(FL_BUSY | FL_STOPPING);
}


inline void
perform_step()
{
	// Stop the clock, just in case
	clk_stop();
	
	// De-assert the HALT# signal, letting the processor control the bus.
	set_halt(0);

	// Start the step state machine. This will start the clock, wait until
	// the next fetch cycle completes, then stop it again. The clock isn't
	// running yet, so the STEP/RUN# pulse width is immaterial.
	outcmd(CMD_STEPRUN, 0);	// Note: inverted!
	outcmd(CMD_STEPRUN, 1);
	outcmd(CMD_STEPRUN, 0);

	// *NOW* start the clock. Use whatever speed has been set up.
	clk_start();
	//bit(PORTB, B_FPCLKEN, 1);

	// When the state machine has completed, WAIT# will be deasserted. Wait
	// for this event. (often, we don't even have to)
	wait_for_halt(0);
	clk_stop();
	//bit(PORTB, B_FPCLKEN, 0);

	// Assert HALT#, securing the processor.
	set_halt(1);

	// The clock will have been stopped automatically by the FSM, but stop
	// it anyway for added safety.
	clk_stop();
}


void
set_stopping()
{
	outcmd(CMD_STEPRUN, 0);	// Note: inverted!
}


void
set_steprun(bool_t val)
{
	// Algorithm:
	// To RUN:
	//   Assert STEP/RUN#.
	//   Start clock.
	//
	// To STOP:
	//   Assume clock is running.
	//   Deassert (H) STEP/RUN#. STEP is performed automatically.
	//   Wait for WAIT# signal to be deasserted.
	//   Stop clock.
	//
	// To STEP (assuming clock is stopped and STEP/RUN# is HIGH):
	//   Stop clock (assume stopped)
	//   Strobe (H-L-H) STEP/RUN#
	//   Start clock
	//   Wait for WAIT# signal to be deasserted.
	//   Stop clock.

	outcmd(CMD_STEPRUN, !val); // Note: inverted!
	clk_start();
	if (val == 1) wait_for_halt(0);
}


void
perform_ustep()
{
	// Stop the clock, just in case
	clk_stop();
	
	// De-assert the HALT# signal, letting the processor control the bus.
	set_halt(0);

	// Start the step state machine. This will start the clock, wait until
	// the next fetch cycle completes, then stop it again. The clock isn't
	// running yet, so the STEP/RUN# pulse width is immaterial.
	outcmd(CMD_USTEP, 0);
	outcmd(CMD_USTEP, 1);
	outcmd(CMD_USTEP, 0);

	// *NOW* start the clock.
	bit(PORTB, B_FPCLKEN, 1);

	// Sample the bus, because we'll need the info
	virtual_panel_sample(0);

	// When the state machine has completed, WAIT# will be deasserted. Wait
	// for this event. (often, we don't even have to). Use ‘reckless’ mode
	// (do not assert HALT#, preserving vector lights)
	wait_for_halt(1);
	bit(PORTB, B_FPCLKEN, 0);

	// Assert HALT#, securing the processor.
	//set_halt(1);

	// The clock will have been stopped automatically by the FSM, but stop
	// it anyway for added safety.
	clk_stop();
}


// Helper and sanity check
#define do_cb(n, s, v) flag(cb[n], CB##n##_##s, v)


inline void
set_safe(bool_t val)
{
	do_cb(1, NSAFE, !val);
	write_cb();
}


void
set_irq1(bool_t val)
{
	do_cb(0, NIRQ1, !val);
	write_cb();
}


void
set_irq6(bool_t val, bool_t fromPanel)
{
	if (val && fromPanel) {
		ifr6_operated = 1;
	}
	do_cb(0, NIRQ6, !val);
	write_cb();
}


void
perform_reset()
{
	if (flags & FL_PROC) {
		// We have a processor. Signal it to reset.

		setflag(cb[1], CB1_NRESET | CB1_NRSTHOLD);
		clearflag(cb[1], CB1_NFPRESET);
		write_cb();
		_delay_ms(500);	// Delay a little, mostly for to convince humans

		setflag(cb[1], CB1_NFPRESET);
		write_cb();
	} else {

		ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
			
			// We're standalone. We'll do it ourselves.
			
			clearflag(cb[1], CB1_NRESET | CB1_NRSTHOLD);
			write_cb();
			
			// Hold these down for a while. It's about 6ms.
			uint16_t x = 32768;
			while (x--) {
				wdt_reset();
			}
			
			setflag(cb[1], CB1_NRESET);
			write_cb();

			// RSTHOLD# must be deasserted later than RESET#. Only
			// the processor uses this for now, but other devices
			// may depend on the timing later on. Also, our
			// run/stop/step state machine requires it, otherwise
			// we get stuck in the RESETTING state forever.

			// Delay another 6ms.
			x = 32768;
			while (x--) {
				wdt_reset();
			}
			
			setflag(cb[1], CB1_NRSTHOLD);
			write_cb();
		}
	}
}

void
strobe_wpc()
{
	clearflag(cb[0], CB0_NWPC);
	write_cb();
	setflag(cb[0], CB0_NWPC);
	write_cb();
}


void
strobe_wac()
{
	clearflag(cb[0], CB0_NWAC);
	write_cb();
	setflag(cb[0], CB0_NWAC);
	write_cb();
}


void
strobe_wir()
{
	clearflag(cb[0], CB0_NWIR);
	write_cb();
	setflag(cb[0], CB0_NWIR);
	write_cb();
}


void
strobe_w()
{
	// R/W safety interlock.
	clearflag(cb[2], CB2_R);
	
	// The processor is halted, so we can drive W# directly. The
	// signal is low for so long (tens of bus cycles), wait states
	// don't really apply.

	setflag(cb[2], CB2_W);
	write_cb();

	clearflag(cb[2], CB2_W);
	write_cb();

/*		
	if (flags & FL_PROC) {

		// A processor is present. Enable writing and let it handle the
		// write cycle, observing wait states etc.

		clearflag(cb[1], CB1_NWEN);
		write_cb();
		
		perform_ustep();

		setflag(cb[1], CB1_NWEN);
		write_cb();

	} else {

		// No processor. Strobe the W# signal directly. The signal is
		// low for so long, wait states hardly even apply.

		clearflag(cb[2], CB2_NW);
		write_cb();

		setflag(cb[2], CB2_NW);
		write_cb();
	}

*/
}


void
set_r(bool_t val)
{
	// R/W safety interlock.
	clearflag(cb[2], CB2_W);
	do_cb(2, R, val);
	write_cb();
}


void
set_mem(bool_t val)
{
	// MEM/IO safety interlock.
	clearflag(cb[2], CB2_IO);
	do_cb(2, MEM, val);
	write_cb();
}


void
set_io(bool_t val)
{
	// MEM/IO safety interlock.
	clearflag(cb[2], CB2_MEM);
	do_cb(2, IO, val);
	write_cb();
}


void
strobe_war()
{
	clearflag(cb[0], CB0_NWAR);
	write_cb();
	setflag(cb[0], CB0_NWAR);
	write_cb();
}


void
strobe_rpc()
{
	clearflag(cb[0], CB0_NRPC);
	write_cb();
	setflag(cb[0], CB0_NRPC);
	write_cb();
}


void
strobe_incpc()
{
	clearflag(cb[0], CB0_NINCPC);
	write_cb();
	setflag(cb[0], CB0_NINCPC);
	write_cb();
}


void
set_halt(bool_t val)
{
	// Also update the FPRAM signal
	if (val) panel_rom(_swright & SWR_ROM ? 1 : 0);

	//report_bool_value(PSTR("*** set_halt:"), val);
	do_cb(2, HALT, val);
	write_cb();
}


void
set_fprunstop(bool_t run)
{
	// Update the front panel LEDs
	cb[2] &= ~(CB2_FPRUN | CB2_FPSTOP);
	cb[2] |= run ? CB2_FPRUN : CB2_FPSTOP;
	write_cb();
}


void
queue_char(uint8_t c)
{
	// Bail out if the buffer is full
	uint8_t new_ip = (ringbuf.ip + 1) & RBMASK;
	if (new_ip == ringbuf.op) return;
	ringbuf.b[ringbuf.ip] = c;
	ringbuf.ip = new_ip;
	if (icr & ICR_TTY) set_irq6(1, 0);
}


uint16_t
maybe_dequeue_char()
{
	// Is it empty?
	if (ringbuf.ip == ringbuf.op) return 0x8000;
	uint8_t retval = ringbuf.b[ringbuf.op];
	ringbuf.op = (ringbuf.op + 1) & RBMASK;
	return retval;
}


///////////////////////////////////////////////////////////////////////////////
//
// BUS COMMAND INTERRUPT
//
///////////////////////////////////////////////////////////////////////////////

// INT0 handler

// When an I/O address in the range 0x0100 to 0x011F is accessed for reading or
// writing, an FF sets a wait state pausing the processor.
//
// At the same time, if a read cycle is in operation (R# low), the DFP's DBUS
// drivers come out of high impedance and start driving the data bus with
// whatever value was last written to them. Because of the wait state, this
// value isn't read by the processor.
//
// The ISR reads (at least) the following bus signals:
//
// * Lower 8 bits of AB
// * DB
// * R#
//
// If R# is high (unasserted), a write cycle is in progress. Process it. Note
// that we don't use the W# strobe (or even the WEN# enable, since an I/O cycle
// always asserts either R# or W#). The MCU is so slow in comparison to the bus
// that setup times aren't even a factor. The bus will be sampled MANY cycles
// later.
//
// If W# is high, a read cycle is in progress. Process it, shift out the
// results to the DBUS driver, and store it to its output registers. The result
// is now driving the data bus, ready to be read.
//
// Clear the wait state by strobing CLR-WS (the positive edge will clear the
// wait state). The cycle will now continue.


__attribute__ ((used))
ISR(INT0_vect)
{
	deb_sample(1);		 // Get AB and DB
	virtual_panel_sample(1); // Get control signals
	
	// Is it a write cycle? (NR = 1, i.e. unasserted)
	if (_flags & CFL_NR) {
		buscmd_write();
	} else {
		buscmd_read();
	}
	
	// Strobe the CLR-WS signal to clear wait states.
	clr_ws();
}


/*

  Switch     Lockable     Only if halted
  --------------------------------------
  Lock          -               -       
  Reset         Y               -       
  Stop          Y               -       
  Run           Y               -       
  Step          Y               -       
  µStep         Y               -       
  Speed change  Y               -       
  --------------------------------------
  Switch reg    -               -
  --------------------------------------
  Load addr     Y               Y
  Load IR       Y               Y
  Load AC       Y               Y
  MEM Write     Y               Y
  MEM Read      Y               Y
  I/O Write     Y               Y
  I/O Read      Y               Y
  IFR1          Y               Y
  IFR6          Y               Y
  RAM           Y               Y

  Debouncing: the 1970s way. We sample the switches slowly enough (at 20-30 Hz)
  for bouncing to not be an issue. Since we sample and don't clock off the
  switches, glitches and bounces won't affect anything.

 */

// Write cycle.
// ____
// HALT   _________________________________ (already driven low)
//
// AB     ZZZ<--------- VALID --------->ZZZ
//
// DB     ZZZZZZ<------ VALID --------->ZZZ
// ___ __ ______                     ______
// MEM/IO       \___________________/
// _      __________________      _________
// W                        \____/
//
// We do not obey Wait State requests. The pulses are so wide it shouldn't be a
// problem (we're likely the slowest device on the bus, after all).

/*
static void
_writecycle(bool_t is_io)
{
	// Sanity check.
	if (!assert_halted()) return;

	// Set bus values
	write_ab(_pc);		// Set the address
	write_db(_sr);		// Read from the SR, put it on the data bus
	
	drive_ab();		// Drive the address bus
	if (is_io) set_io(1);
	else set_mem(1);
	
	strobe_w();

	if (is_io) set_io(0);
	else set_mem(0);

	tristate_db();		// Just in case
	tristate_ab();

	// Increment address after write?
	if (actuated(_swright, SWR_INC)) strobe_incpc();
}
*/

// Read cycle.
// ____
// HALT   _________________________________ (already driven low)
//
// AB     ZZZ<--------- VALID --------->ZZZ
// ___ __ ______                     ______
// MEM/IO       \___________________/
// _      _________               _________
// R               \_____________/
//
// DB     XXXXXXXXXXXX<---- VALID ---->XXXX
// ___    _________________   _____________
// RAC                     \_/
//
// Sample data here           ^^^
// Read data from shift registers here  ^^^
//
// We do not obey Wait State requests. We read the bus using shift registers at
// 14 MHz, so even if one read took two MCU clocks (it takes a bit longer than
// that), reading the DBUS registers would take around 10 µs (the minimum hold
// time).
//
// Reading into the AC works because asserting either MEM# or IO# and R# causes
// the bus driver on the processor to connect the IBUS and DBUS for
// reading. This combinatorial circuit does not get defeated when the processor
// is halted, which is technically a bug. If we were to do this properly, we'd
// have to drive the IBUS with the appropriate value ourselves after the end of
// the DBUS cycle. For now, we rely on this bug.

 /*
static void
_readcycle(bool_t is_io)
{
	// Sanity check.
	if (!assert_halted()) return;

	// Set bus values
	write_ab(_pc);		// Set the address
	tristate_db();		// Just in case
	
	if (is_io) set_io(1);
	else set_mem(1);
	
	set_r(1);
	asm("nop");		// Additional 678ns set up time
	strobe_wac();		// Read data into the AC.
	deb_sample(1);
	set_r(0);

	if (is_io) set_io(0);
	else set_mem(0);

	tristate_ab();

	// Increment address after read?
	if (actuated(_swright, SWR_INC)) strobe_incpc();
}
 */

  //static uint8_t _idle = 0;

ISR(TIMER0_COMPA_vect)
{
	static uint8_t pause = 0;
	static uint8_t autorepeat = 45;
	static uint8_t accelerate = 0;

	// Blink the STOP light at ~10Hz while busy, and ignore the front panel
	// switches. Any routine working overtime here had better call
	// wdt_reset() on its own, otherwise the Watchdog will reset the DFP.
	if (flags & FL_BUSY) {
		pause = (pause + 1) & 3;
		  if (pause == 0) cb[2] ^= CB2_FPSTOP;
		write_cb();
		return;
	}

	// We're still alive!
	wdt_reset();
	
	// If software-locked, ignore switches.
	if (flags & FL_SWLOCK) return;
	
	// Toggle switch handling
	deb_sample(0);		// Read the switches
	
	// Print out the Switch Register to the debugging console, if it's
	// changed (the decision is made in panel_sr()). The SR can't be
	// locked, so we act on it before the panel lock check.
	if (_sr0 != _sr) panel_sr(_sr);

	// If the front panel is locked, bail out.
	if (panel_lock(actuated(_swleft, SWL_NLOCK))) {
		return;
	}

	// Ignore 'action' panel switches if we're busy
	if (flags & FL_BUSY) return;

	// Have the switches changed?
	if (_swleft0 == _swleft && _swright0 == _swright && _sr0 == _sr) {
		if (autorepeat > 1) autorepeat--;
		if (autorepeat != 1) return;

		if (((_swleft & SWL_AUTOREPEAT) != SWL_AUTOREPEAT) ||
		    ((_swright & SWR_AUTOREPEAT) != SWR_AUTOREPEAT)) {
			// Three levels of autorepeat acceleration: 2 Hz, 6 Hz
			// and 30 Hz.
			if (accelerate < 255) accelerate++;
			if (accelerate > 30) autorepeat = 1;
			else if (accelerate > 6) autorepeat = 5;
			else autorepeat = 15;
		}
	} else {
		// A new button that supports autorepeat has been pressed (reminder:
		// switches are active low, hence the logic below), prepare for
		// autorepeat. 45 = ~1.5 sec.
		if (((_swleft & SWL_AUTOREPEAT) != SWL_AUTOREPEAT) ||
		    ((_swright & SWR_AUTOREPEAT) != SWR_AUTOREPEAT)) {
			// A switch with autorepeat enabled has been
			// pressed. Arm for the first repeat event.
			autorepeat = 45;
		} else {
			// All the auto-repeat switches have been
			// released. Reset auto-repeat.
			autorepeat = 0;
			accelerate = 0;
		}
	}

	// Set the clock speed.
	panel_spd((_swleft & (SWL_SLOW|SWL_FAST)) >> SWL_SPD_SHIFT);

	// The RAM switch is only acted on on reset (an edge action), and when
	// the clock is halted (a level action or latch). Again, the decision
	// is made in panel_rom().
	panel_rom(_swright & SWR_ROM ? 1 : 0);

	// Is the increment signal being asserted?
	bool_t inc = actuated(_swright, SWR_INC) ? 1 : 0;

	// Become insensitive to this switch configuration.
	_swleft0 = _swleft;
	_swright0 = _swright;
	_sr0 = _sr;

	// Check switches. Act on just one per timer interrupt.
	if (actuated(_swleft, SWL_RESET|SWL_RUN)) {
		// Start (reset + run)
		panel_start();
	}

	else if (actuated(_swleft, SWL_RESET)) {
		// Reset
		panel_reset();
	}

	else if (actuated(_swleft, SWL_STOP)) {
		// Stop
		panel_stop();
	}

	else if (actuated(_swleft, SWL_RUN)) {
		// Run
		panel_run();
	}

	else if (actuated(_swleft, SWL_STEP)) {
		// Step
		panel_step();
	}

	else if (actuated(_swleft, SWL_USTEP)) {
		// MicroStep
		panel_ustep();
	}

	else if (actuated(_swright, SWR_LDADDR)) {
		// Load address (PC)
		panel_ldaddr();
	}

	else if (actuated(_swright, SWR_LDIR)) {
		// Load instruction register
		panel_ldir();
	}

	else if (actuated(_swright, SWR_LDAC)) {
		// Load AC
		panel_ldac();
	}

	else if (actuated(_swright, SWR_MEMW)) {
		// Memory, write, inc?
		panel_wmem(inc, _pc, _sr);
	}

	else if (actuated(_swright, SWR_MEMR)) {
		// Memory, read, inc?
		panel_rmem(inc, _pc);
	}

	else if (actuated(_swright, SWR_IOW)) {
		// I/O, write, inc?
		panel_wio(inc, _pc, _sr);
	}

	else if (actuated(_swright, SWR_IOR)) {
		// Memory, read, inc?
		panel_rio(inc, _pc);
	}

	else if (actuated(_swright, SWR_IFR1)) {
		// Front panel interupt request, level 1
		panel_ifr1();
	}

	else if (actuated(_swright, SWR_IFR6)) {
		// Front panel interupt request, level 1
		panel_ifr6();
	}
}



#endif // 0


// End of file.
