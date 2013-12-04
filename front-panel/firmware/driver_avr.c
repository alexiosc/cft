// -*- indent-c++ -*-
//

#ifdef AVR

#include <avr/interrupt.h>
#include <util/atomic.h>

// This 'driver' is only available on the AVR target.

#include "hwcompat.h"
#include "panel.h"
#include "proto.h"
#include "bus.h"
#include "abstract.h"
#include "utils.h"
#include "serial.h"

/*

  Pin assignments:

  PC0: in  DEBIN
  PC1: in  VPIN
  PC2: out ICLK
  PC3: out DOUT
  PC4: out CMD0
  PC5: out CMD1

  PD0: USART
  PD1: USART
  PD2: in  IOCMD + int
  PD3: out DB-OE#
  PD4: out AB-OE#
  PD5: out IBUS-OE#
  PD6: out CTL-OE#
  PD7: out COUT

  PB0: out CLR-WS
  PB1: out FPCLKEN-IN
  PB2: out FPUSTEP-IN
  PB3: out IOADDR0
  PB4: out IOADDR1
  PB5: out IOADDR2

 */

#define C_DEBIN     PC0
#define C_VPIN      PC1
#define C_ICLK      PC2
#define C_DOUT      PC3
#define C_CMD0      PC4
#define C_CMD1      PC5

#define C_IDLE      0
#define C_OUTPUTS   (_BV(C_ICLK) | _BV(C_DOUT) | _BV(C_CMD0) | _BV(C_CMD1))

#define D_IOCMD     PD2
#define D_NDBOE     PD3
#define D_NABOE     PD4
#define D_NIBUSOE   PD5
#define D_NCTLOE    PD6
#define D_COUT      PD7

#define D_IDLE      (_BV(D_NDBOE) | _BV(D_NABOE) | _BV(D_NIBUSOE) | _BV(D_NCTLOE))
#define D_OUTPUTS   (_BV(D_IOCMD) | _BV(D_NDBOE) | _BV(D_NABOE) | _BV(D_NIBUSOE) | \
		     _BV(D_NCTLOE) | _BV(D_COUT))

#define B_CLRWS     PB0
#define B_FPCLKEN   PB1
#define B_FPUSTEP   PB2
#define B_IOADDR0   PB3
#define B_IOADDR1   PB4
#define B_IOADDR2   PB5

#define B_IDLE      0
#define B_IOADDR    (_BV(B_IOADDR0) | _BV(B_IOADDR1) | _BV(B_IOADDR2))
#define B_OUTPUTS   (_BV(B_CLRWS) | _BV(B_FPCLKEN) | _BV(B_FPUSTEP) | B_IOADDR)


// Note: values in octal (the 259s have eight values each)
#define CMD_SAMPLE  000
#define CMD_VPEN    001
#define CMD_DEBEN   002
#define CMD_CTLOE   003
#define CMD_CLR     004
#define CMD_STEPRUN 005		// 0 = Running, strobe = 
#define CMD_USTEP   006
#define CMD_ORCLK   007

#define CMD_DBCLK   010
#define CMD_ABCLK   011
#define CMD_IBUSCLK 012
#define CMD_CTLCLK  013
#define CMD_STCP    015
#define CMD_BUSPU   016


static uint16_t _ab;
static uint16_t _db;
volatile static uint16_t _swright;
volatile static uint16_t _sr;
volatile static uint16_t _swleft;
static uint16_t _or;
static uint8_t _cb[3] = { 0xff, 0xff, 0xff };

// flags for _swleft

#define SWL_NLOCK  0x0001
#define SWL_RESET  0x0002
#define SWL_STOP   0x0004
#define SWL_RUN    0x0008
#define SWL_STEP   0x0010
#define SWL_USTEP  0x0020
#define SWL_SLOW   0x0040
#define SWL_FAST   0x0080

#define SWL_DS0    0x0100
#define SWL_DS1    0x0200
#define SWL_DS2    0x0400
#define SWL_DS3    0x0800
#define SWL_DS4    0x1000
#define SWL_DS5    0x2000
#define SWL_DS6    0x4000
#define SWL_DS7    0x8000

// flags for _swright

#define SWR_LDADDR 0x0001
#define SWR_LDIR   0x0002
#define SWR_LDAC   0x0004
#define SWR_SPARE  0x0008
#define SWR_MEMW   0x0010
#define SWR_INC    0x0020
#define SWR_MEMR   0x0040
#define SWR_IOW    0x0080

#define SWR_IOR    0x0100
#define SWR_RAM    0x0200
#define SWR_IFR6   0x0400
#define SWR_IFR1   0x0800

#define SWR_DS8    0x1000
#define SWR_DS9    0x2000
#define SWR_DS10   0x4000
#define SWR_DS11   0x8000

// Flags for _cb[x]
#define CB0_NIRQ6     0x01
#define CB0_NIRQ1     0x02
#define CB0_NINCPC    0x04
#define CB0_NWAC      0x08
#define CB0_NRPC      0x10
#define CB0_NWAR      0x20
#define CB0_NWIR      0x40
#define CB0_NWPC      0x80

#define CB1_NSAFE     0x01
#define CB1_NFPRAM    0x40
#define CB1_NFPRESET  0x80

#define CB2_NW        0x01
#define CB2_NR        0x02
#define CB2_NMEM      0x04
#define CB2_NIO       0x08
#define CB2_NHALT     0x10
#define CB2_FPRUN     0x20
#define CB2_FPSTOP    0x40


#define ICRBASE (0xffff & ~(CB0_NIRQ1|CB0_NIRQ6))
static uint16_t _icr = ICRBASE;


// Ring buffer size in bits (we do not use modulo)
#define RBSIZE_BITS 4
#define RBMASK ((1 << RBSIZE_BITS) - 1)
struct {
	uint8_t ip, op;
	uint8_t b[(1 << RBSIZE_BITS)];
} ringbuf;

#define actuated(bm, sw) (((bm) & (sw)) == 0)


///////////////////////////////////////////////////////////////////////////////
//
// WRITING COMMANDS TO THE 74x259 ADDRESSABLE LATCHES
//
///////////////////////////////////////////////////////////////////////////////


/*

  Waveform:
                         _________________
  IOADDRx    XXXXXXXXXX><_________________>XXXX
                                _______________
  COUT       __________________/ val 
                                   _______
  CMDx       XXXXXXXXXXXXXXXXXXXXX<_______>XXXX

 */

static void
outcmd(uint8_t addr, uint8_t val)
{
	// Clear the CMDx outputs.
	PORTC = PORTC & ~(_BV(C_CMD0) | _BV(C_CMD1));
	
	// Set the value first. The '259s are latches.
	bit(PORTD, D_COUT, val);
	
	// Then, set the address.
	// Note: the shift makes assumptions about the IOADDRx pins.
	PORTB = (PORTB & ~B_IOADDR) | ((addr & 7) << 3);

	// Now, strobe the CMDx bit
	setbit(PORTC, addr & 8 ? C_CMD1 : C_CMD0);
	PORTC = PORTC & ~(_BV(C_CMD0) | _BV(C_CMD1));

	// Clean up.
	PORTB = PORTB & ~B_IOADDR;
}


/*

  Waveform:
                         _________________
  IOADDRx    XXXXXXXXXX><_________________>XXXX
                              ____________
  CMDx       XXXXXX__________<____________>XXXX
                                    __
  COUT       XXXXXXXXXX____________/  \________

 */

static void
strobecmd(uint8_t addr)
{
	// Clear the CMDx outputs.
	PORTC = PORTC & ~(_BV(C_CMD0) | _BV(C_CMD1));
	
	// Clear te value first. The '259s are latches.
	bit(PORTD, D_COUT, 0);
	
	// Then, set the address.
	// Note: the shift makes assumptions about the IOADDRx pins.
	PORTB = (PORTB & ~B_IOADDR) | ((addr & 7) << 3);

	// Enable the appropriate 
	setbit(PORTC, addr & 8 ? C_CMD1 : C_CMD0);

	// The latch has now picked up the 0 value. Strobe it. We have two
	// edges in total, so both types of edge sensitivity (rising/falling)
	// are catered for.
	bit(PORTD, D_COUT, 1);
	bit(PORTD, D_COUT, 0);

	// Clear both enables for good measure.
	PORTC = PORTC & ~(_BV(C_CMD0) | _BV(C_CMD1));
}


inline static void
strobe_clr()
{
	// The CLR output is inverted and fed back to its own reset pin, so
	// when it's set to 1 (high) the reset pin will go low, resetting the
	// CLR (and most other drivers on the PFP/DEB) to zero. However, we
	// also clear it manually just to be sure.
	strobecmd(CMD_CLR);
}


#define CALC_FREQ(prescaler, hz) ((F_CPU) / (2 * (prescaler)) / (hz))

void
hw_init()
{
	serial_init();

	// Set output pins and idle values. This will initialise with
	// all outputs banks idle and the processor clock stopped.

	PORTC = C_IDLE;
	DDRC = C_OUTPUTS;

	PORTD = D_IDLE;
	DDRD = D_OUTPUTS;

	PORTB = B_IDLE;
	DDRB = B_OUTPUTS;

	// Explicitly tristate everything.
	tristate_ibus();
	tristate_db();
	tristate_ab();

	// Reset all the drivers with MR# pins.
	strobe_clr();

	// Enable INT0 (with negative edge sensitivity)
	EICRA = (EICRA & 0xf0) | _BV(ISC01);
	setbit(EIMSK, INT0);

	// Set up the switch sampling/debouncing timer. Atmega168 datasheet,
	// p. 104.
	TCCR0B = 0x8 | 0x5; // Clear on compare, CLK/1024 prescaler
	TIMSK0 = 0x2;       // Interrupt on compare match
	OCR0A = 0xff; 	    // Slowest rate: 14.7456 MHz / (2 * 1024 * 256) = 28.125 Hz

	// Timer 1 (the slow clock input to the CFT processor) is set further
	// down, on demand.

	// Set up the console ring buffer
	ringbuf.ip = ringbuf.op = 0;

	// All done. Enable interrupts
	sei();
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


void
serial_write(unsigned char c)
{
	serial_send(c);
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
		setbit(PORTC, C_ICLK);
		clearbit(PORTC, C_ICLK);
		if (PORTC & _BV(in)) val |= i;
		i >>= 1;
	}
	return val;
}


static void
out_shift_registers(uint8_t val, uint8_t clk)
{
	uint8_t i = 0x80;
	while (i) {
		bit(PORTC, C_DOUT, val & i);
		strobecmd(clk);
		i >>= 1;
	}
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
		tristate_ab();
		tristate_db();
		
		// Sample data (all buses to shift registers)
		strobecmd(CMD_SAMPLE);
		
		// Enable the debug bus shift registers
		clearbit(PORTC, C_ICLK);
		outcmd(CMD_DEBEN, 1);
		
		// Now read in data in groups of 8 bits (makes it easier for the 8-bit
		// AVR).
		_ab = sample_shift_registers(C_DEBIN) << 8 |
			sample_shift_registers(C_DEBIN);
		
		_db = sample_shift_registers(C_DEBIN) << 8 |
			sample_shift_registers(C_DEBIN);
		
		if (!quick) {
			_swright = sample_shift_registers(C_DEBIN) << 8 |
				sample_shift_registers(C_DEBIN);
			_sr = sample_shift_registers(C_DEBIN) << 8 |
				sample_shift_registers(C_DEBIN);
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


inline uint16_t
get_dsr()
{
	return ((_swleft & 0xff00) >> 8) | ((_swright & 0xf000) >> 4);
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


inline uint32_t
get_sw()
{
	uint32_t res = ((uint32_t)_swleft << 16) | (uint32_t)_swright;
	return res;
}


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


uint8_t  _flags;		// 8-bits: flags (also WEN# and R#)
union {
	uint8_t  uvec8[4];	// Microcode vector: 24 bits ([3] unused)
	uint32_t uvec32;	// Microcode vector as a 32-bit integer
} _uv;
uint16_t _ir, _pc, _ac;		// Registers


#define CFL_FN       0x01
#define CFL_FZ       0x02
#define CFL_FV       0x04
#define CFL_FL       0x10
#define CFL_NWAIT    0x20
#define CFL_NWEN     0x40
#define CFL_NR       0x80



void
virtual_panel_sample(bool_t quick)
{
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		// Sample data (all buses to shift registers)
		strobecmd(CMD_SAMPLE);

		// Enable the debug bus shift registers
		clearbit(PORTC, C_ICLK);
		outcmd(CMD_VPEN, 1);

		// Now read in data in groups of 8 bits (makes it easier for the 8-bit
		// AVR.
		_flags = sample_shift_registers(C_VPIN);
	
		if (!quick) {
			_uv.uvec8[0] = sample_shift_registers(C_VPIN);
			_uv.uvec8[1] = sample_shift_registers(C_VPIN);
			_uv.uvec8[2] = sample_shift_registers(C_VPIN);

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

void
write_leds(const uint8_t x)
{
//#warning "TODO"
}


inline uint16_t
get_or()
{
	return _or;
}


inline void
set_or(const uint16_t or)
{
	_or = or;

	out_shift_registers(_or & 0xff, CMD_ORCLK);
	out_shift_registers((_or >> 8) & 0xff, CMD_ORCLK);

	// Move data from ALL the shift registers to their respective output
	// registers. Tristated output registers will of course not have any
	// effects.
	strobecmd(CMD_STCP);
}


inline void
drive_ibus()
{
	clearbit(PORTD, D_NIBUSOE);
}


void
write_ibus(const uint16_t ibus)
{
	out_shift_registers(ibus & 0xff, CMD_IBUSCLK);
	out_shift_registers((ibus >> 8) & 0xff, CMD_IBUSCLK);

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



void
drive_ab()
{
	clearbit(PORTD, D_NABOE);
}


void
write_ab(const uint16_t abus)
{
	out_shift_registers(abus & 0xff, CMD_ABCLK);
	out_shift_registers((abus >> 8) & 0xff, CMD_ABCLK);

	// Move data from ALL the shift registers to their respective output
	// registers. Tristated output registers will of course not have any
	// effects.
	strobecmd(CMD_STCP);
}


inline void
tristate_ab()
{
	setbit(PORTD, D_NABOE);
}



inline void
drive_db()
{
	clearbit(PORTD, D_NDBOE);
}


void
write_db(const uint16_t dbus)
{
	out_shift_registers(dbus & 0xff, CMD_DBCLK);
	out_shift_registers((dbus >> 8) & 0xff, CMD_DBCLK);

	// Move data from ALL the shift registers to their respective output
	// registers. Tristated output registers will of course not have any
	// effects.
	strobecmd(CMD_STCP);
}


void
tristate_db()
{
	setbit(PORTD, D_NDBOE);
}


// Output Controls (three bytes)

void
write_cb()
{
	// The ICR acts as a signal mask, disabling the IRQ1/6 signals. The
	// mask is updated whenever the ICR register is written to and will
	// have all bits but those for IFR1/IFR6 set (the latter are controlled
	// by the value coming from the CFT).
	out_shift_registers(_cb[0] & _icr, CMD_CTLCLK);
	out_shift_registers(_cb[1], CMD_CTLCLK);
	out_shift_registers(_cb[2], CMD_CTLCLK);

	// Move data from ALL the shift registers to their respective output
	// registers. Tristated output registers will of course not have any
	// effects.
	strobecmd(CMD_STCP);

	// Finally, enable the control signals (unless already enabled)
	if ((_cb[2] & (CB2_FPRUN | CB2_FPSTOP)) == (CB2_FPRUN | CB2_FPSTOP)) {
		clearbit(PORTD, D_NCTLOE);
	}
}


///////////////////////////////////////////////////////////////////////////////
//
// STROBES AND MISCELLANEOUS SIGNALS
//
///////////////////////////////////////////////////////////////////////////////


void
wait_for_halt(uint8_t howlong)
{
	do {
		// Read the current value of FPCLKEN
		virtual_panel_sample(1);

		// Wain until the clock-synchronous state machine is done.
		if ((get_flags() & CFL_NWAIT) == 0) break;

	} while (--howlong);

//#warning "TODO: Set error condition and lock up MCU if we time out."

	assert_halted();
}


void
set_clk(uint8_t clktype)
{
	// Bit 7 (inverted) of the CLK_x constants is the clock on/off bit
	bit(PORTB, B_FPCLKEN, clktype == CLK_STOPPED ? 0 : 1);

	// Set the slow clock type. Note: clock rates are processor raw clocks:
	// the processor's clock generator divides them by 4.
	switch(clktype) {
	case CLK_STOPPED:
		bit(PORTB, B_FPCLKEN, 0);
		TCCR1A = 0x00;	// Disconnect FPUSTEP-IN pin, no pulses.
		return;

	case CLK_FAST:
		bit(PORTB, B_FPCLKEN, 1);
		// The rate of the slow clock is a Don't Care value.
		return;

	case CLK_SLOW:
		TCCR1A = 0x40;	    // 0100--00: toggle OC1A on Compare Match
		TCCR1B = 0x8 | 0x5; // Clear on compare, CLK/1024 prescaler
		TIMSK1 = 0x2;       // Interrupt on compare match
		OCR1A = 45; 	    // 80 Hz = 147456 / (4 * 1024 * 45)
		return;

	case CLK_CREEP:
		TCCR1A = 0x40;	    // 0100--00: toggle OC1A on Compare Match
		TCCR1B = 0x8 | 0x5; // Clear on compare, CLK/1024 prescaler
		TIMSK1 = 0x2;       // Interrupt on compare match
		OCR1A = 450; 	    // 8 Hz = 147456 / (4 * 1024 * 450)
		return;
	}
}


void
set_clkfreq(uint8_t x)
{
}




inline void
strobe_step()
{
	strobecmd(CMD_STEPRUN);
	wait_for_halt(3);
}


void
set_steprun(bool_t x)
{
	#warning "TODO"
	strobecmd(CMD_STEPRUN);
	wait_for_halt(3);
}


void
strobe_ustep()
{
	strobecmd(CMD_USTEP);
}


inline void
set_buspu(const uint8_t x)
{
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		outcmd(CMD_BUSPU, x);
	}
}



// Helper and sanity check
#define do_cb(n, s, v) flag(_cb[n], CB##n##_##s, v)


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
set_irq6(bool_t val)
{
	do_cb(0, NIRQ6, !val);
	write_cb();
}


void
set_fpram(bool_t val)
{
	do_cb(1, NFPRAM, !val);
	write_cb();
}


void
strobe_fpreset()
{
	clearflag(_cb[1], CB1_NFPRESET);
	write_cb();
	setflag(_cb[1], CB1_NFPRESET);
	write_cb();
}

void
strobe_wpc()
{
	clearflag(_cb[0], CB0_NWPC);
	write_cb();
	setflag(_cb[0], CB0_NWPC);
	write_cb();
}


void
strobe_wac()
{
	clearflag(_cb[0], CB0_NWAC);
	write_cb();
	setflag(_cb[0], CB0_NWAC);
	write_cb();
}


void
strobe_wir()
{
	clearflag(_cb[0], CB0_NWIR);
	write_cb();
	setflag(_cb[0], CB0_NWIR);
	write_cb();
}


void
strobe_w()
{
	// R/W safety interlock.
	setflag(_cb[2], CB2_NR);
	clearflag(_cb[2], CB2_NW);
	write_cb();
	setflag(_cb[2], CB2_NW);
	write_cb();
//#warning "TODO: what about WEN# and the W# tri-stating bug?"
}


void
set_r(bool_t val)
{
	// R/W safety interlock.
	setflag(_cb[2], CB2_NW);
	do_cb(2, NR, !val);
	write_cb();
}


void
set_mem(bool_t val)
{
	// MEM/IO safety interlock.
	setflag(_cb[2], CB2_NIO);
	do_cb(2, NMEM, !val);
	write_cb();
}


void
set_io(bool_t val)
{
	// MEM/IO safety interlock.
	setflag(_cb[2], CB2_NMEM);
	do_cb(2, NIO, !val);
	write_cb();
}


void
strobe_war()
{
	clearflag(_cb[0], CB0_NWAR);
	write_cb();
	setflag(_cb[0], CB0_NWAR);
	write_cb();
}


void
strobe_rpc()
{
	clearflag(_cb[0], CB0_NRPC);
	write_cb();
	setflag(_cb[0], CB0_NRPC);
	write_cb();
}


void
strobe_incpc()
{
	clearflag(_cb[0], CB0_NINCPC);
	write_cb();
	setflag(_cb[0], CB0_NINCPC);
	write_cb();
}


void
set_halt(bool_t val)
{
	do_cb(0, NIRQ6, !val);
	write_cb();
}


void
set_fprunstop(bool_t run)
{
	// Update the front panel LEDs
	_cb[2] &= ~(CB2_FPRUN | CB2_FPSTOP);
	_cb[2] |= run ? CB2_FPRUN : CB2_FPSTOP;
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
// At the same time, if a read cycle is in operation (R# low), the DBUS drivers
// come out of tri-state and start driving the data bus with whatever value was
// last written to them. Because of the wait state, this value isn't read by
// the processor.
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
	serial_write('1');
	deb_sample(1);		 // Get AB and DB
	virtual_panel_sample(1); // Get control signals
	
	// Is it a write cycle? (NR = 1, i.e. unasserted)
	if (_flags & CFL_NR) {
		// Write cycle
		switch (_ab) {
		case IO_SOR:
			set_or(_db);
			break;

		case IO_ENEF:
		case IO_DISEF:
			break;

		case IO_ICR:
			_icr = ICRBASE | _db;
			break;

		case IO_SENTINEL:
			buscmd_sentinel();
			break;

		case IO_PRINTA:
			buscmd_print('A', _db);
			break;

		case IO_PRINTC:
			buscmd_print('C', _db);
			break;

		case IO_PRINTD:
			buscmd_print('D', _db);
			break;

		case IO_PRINTU:
			buscmd_print('U', _db);
			break;

		case IO_PRINTH:
			buscmd_print('H', _db);
			break;

		case IO_PRINTB:
			buscmd_print('B', _db);
			break;

		case IO_PRINTSP:
			buscmd_print('C', 32);
			break;

		case IO_PRINTNL:
			buscmd_print('C', 10);
			break;

		case IO_DEBUGON:
			buscmd_debugon();
			break;

		case IO_DEBUGOFF:
			buscmd_debugoff();
			break;

		case IO_DUMP:
			buscmd_dump();
			break;

		case IO_PRINTHI:
			buscmd_printhi(_db);
			break;

		case IO_PRINTLO:
			buscmd_print('L', _db);
			break;

		case IO_HALT:
			buscmd_halt();
			break;

		case IO_SUCCESS:
			buscmd_success();
			break;

		case IO_FAIL:
			buscmd_fail();
			break;
		}
	} else {
		// Read cycle. We do NOT enable the data bus ourselves. There's
		// an ‘autonomic’ function that makes the data bus register
		// drive whenever the CFT selects the PFP/DEB. All we need to
		// do is update its value and register it for output.
		switch ((uint8_t)_ab & 0xff) {
		case IO_LSR:
			_db = _sr;
			break;

		case IO_LDSR:
			_db = (_swleft & 0xff00) >> 8;
			_db |= (_swright & 0xf000) >> 4;
			break;

		case IO_ISR:
 			_db = _cb[0] & (CB0_NIRQ1 | CB0_NIRQ6);
			if (ringbuf.op != ringbuf.ip) _db |= 0x8000;
			set_irq1(0);
			set_irq6(0);
			break;

		case IO_QEF1:
		case IO_QEF2:
			_db = QEF_BASE_RESULT;
			if (flags & FL_HOF) _db |= QEF_HOF;
			if (flags & FL_HOS) _db |= QEF_HOS;
			if (actuated(_swleft, SWL_NLOCK)) _db |= QEF_LOCKED;
			break;

		case IO_READC:
			_db = maybe_dequeue_char();
			break;
		}
		write_db(_db);
	}
	
	// Strobe the CLR-WS signal to clear wait states.
	setbit(PORTB, B_CLRWS);
	clearbit(PORTB, B_CLRWS);
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

  Debouncing: the 1970s way. We sample the switches slowly enough (at 20 Hz)
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


ISR(TIMER0_COMPA_vect)
{
	deb_sample(0);		// Read the switches
	//serial_write('.');

	// If locked, bail out.
	if (actuated(_swleft, SWL_NLOCK)) return;

	// Check switches. Act on just one per timer interrupt.
	if (actuated(_swleft, SWL_RESET)) {
		// Reset
		async_reset();
	}

	else if (actuated(_swleft, SWL_STOP)) {
		// Stop
		async_stop();
	}

	else if (actuated(_swleft, SWL_RUN)) {
		// Run
		async_run();
	}

	else if (actuated(_swleft, SWL_STEP)) {
		// Step
		async_step();
	}

	else if (actuated(_swleft, SWL_USTEP)) {
		// MicroStep
		async_ustep();
	}

	else if (actuated(_swright, SWR_LDADDR)) {
		// Load address (PC)
		async_ldaddr();
	}

	else if (actuated(_swright, SWR_LDIR)) {
		// Load instruction register
		async_ldir();
	}

	else if (actuated(_swright, SWR_LDAC)) {
		// Load AC
		async_ldac();
	}

	else if (actuated(_swright, SWR_MEMW)) {
		// Memory, write, inc?
		_writecycle(0);
	}

	else if (actuated(_swright, SWR_MEMR)) {
		// Memory, read, inc?
		_readcycle(0);
	}

	else if (actuated(_swright, SWR_IOW)) {
		// I/O, write, inc?
		_writecycle(1);
	}

	else if (actuated(_swright, SWR_IOR)) {
		// Memory, read, inc?
		_readcycle(1);
	}

	// To be used:
	async_rom(0);
	async_rom(1);
	async_ifr1();
	async_ifr6();
}


#endif	// AVR


// End of file.
