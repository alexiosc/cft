// -*- indent-c++ -*-
//

#ifdef AVR

#define USE_ATOMIC_BLOCKS

#include <avr/interrupt.h>
#include <avr/wdt.h>

#ifdef USE_ATOMIC_BLOCKS
#include <util/atomic.h>
#else
#define ATOMIC_BLOCK(x)
#endif

// This 'driver' is only available on the AVR target.

#include "hwcompat.h"
#include "panel.h"
#include "proto.h"
#include "abstract.h"
#include "bus.h"
#include "buscmd.h"
#include "utils.h"
#include "serial.h"
#include "output.h"
#include "switches.h"
#include "panel.h"

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
#define D_OUTPUTS   (_BV(D_NDBOE) | _BV(D_NABOE) | _BV(D_NIBUSOE) | \
		     _BV(D_NCTLOE) | _BV(D_COUT))

#define B_CLRWS     PB0
#define B_FPCLKEN   PB1
#define B_FPUSTEP   PB2
#define B_IOADDR0   PB3
#define B_IOADDR1   PB4
#define B_IOADDR2   PB5

#define B_IDLE      (_BV(B_CLRWS))
#define B_IOADDR    (_BV(B_IOADDR0) | _BV(B_IOADDR1) | _BV(B_IOADDR2))
#define B_OUTPUTS   (_BV(B_CLRWS) | _BV(B_FPCLKEN) | _BV(B_FPUSTEP) | B_IOADDR)


// Note: values in octal (the 259s have eight values each)
#define CMD_SAMPLE  000
#define CMD_VPEN    001
#define CMD_DEBEN   002
//#define CMD_CTLOE   003
#define CMD_CLR     004
#define CMD_STEPRUN 005		// 0 = Running
#define CMD_USTEP   006
#define CMD_ORCLK   007

#define CMD_DBCLK   010
#define CMD_ABCLK   011
#define CMD_IBUSCLK 012
#define CMD_CTLCLK  013
#define CMD_STCP    015
#define CMD_BUSPU   017

// Prescaler values for CS10-12 bits.
#define PSV_1       1
#define PSV_8       2
#define PSV_64      3
#define PSV_256     4
#define PSV_1024    5

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

static union {
	uint8_t  uvec8[4];	// Microcode vector: 24 bits ([3] unused)
	uint32_t uvec32;	// Microcode vector as a 32-bit integer
} _uv;

uint8_t cb[3] = {
	CB0_OUTPUTS,
	CB1_OUTPUTS,
	CB2_OUTPUTS
};

uint16_t icr = 0;
uint8_t ifr6_operated = 0;
static uint8_t idle_addr = 0; // Used for diagnostics

ringbuf_t ringbuf;

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

static void out_shift_registers(uint8_t val, uint8_t clk);

static void
outcmd(uint8_t addr, uint8_t val)
{
	// Interlock: never allow VPEN and DEBEN to be asserted
	// simultaneously. If one is asserted, deassert the
	// other. Note: these are inverted, so 1 = asserted, 0 =
	// deasserted.
	if (val) {
		if (addr == CMD_VPEN) outcmd(CMD_DEBEN, 0);
		else if (addr == CMD_DEBEN) outcmd(CMD_VPEN, 0);
	}

	// Clear the CMDx outputs.
	PORTC = PORTC |= _BV(C_CMD0) | _BV(C_CMD1);
	
	// Set the value first. The '259s are latches.
	bit(PORTD, D_COUT, val);
	
	// Then, set the address.
	// Note: the shift makes assumptions about the IOADDRx pins.
	PORTB = (PORTB & ~B_IOADDR) | ((addr & 7) << 3);

	// Now, strobe the CMDx bit
	clearbit(PORTC, addr & 8 ? C_CMD1 : C_CMD0);
	PORTC |= _BV(C_CMD0) | _BV(C_CMD1);

	// Clean up.
	PORTB = PORTB & ~B_IOADDR;
	PORTB = (PORTB & ~B_IOADDR) | ((idle_addr & 7) << 3);
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



static inline void
_multistrobe_start(uint8_t addr)
{
	// Clear the CMDx outputs (they're active low).
	PORTC = PORTC |= _BV(C_CMD0) | _BV(C_CMD1);
	
	// Clear the value first. The '259s are latches.
	bit(PORTD, D_COUT, 0);
	
	// Then, set the address.
	// Note: the shift makes assumptions about the IOADDRx pins.
	PORTB = (PORTB & ~B_IOADDR) | ((addr & 7) << 3);

	// Enable the appropriate latch signal
	clearbit(PORTC, addr & 8 ? C_CMD1 : C_CMD0);
}

static inline void
_multistrobe_pulse()
{
	// Emit a positive pulse
	setbit(PORTD, D_COUT);
	asm("nop");		// Lengthen the pulse by ~140ns.
	clearbit(PORTD, D_COUT);
}


static inline void
_multistrobe_end()
{
	// Clear both enables for good measure.
	PORTC |= _BV(C_CMD0) | _BV(C_CMD1);
	PORTB = (PORTB & ~B_IOADDR) | ((idle_addr & 7) << 3);
}


static void
strobecmd(uint8_t addr)
{
	// Prepare the command latches for strobing
	_multistrobe_start(addr);

	// The latch has now picked up the 0 value. Strobe it. We have two
	// edges in total, so both types of edge sensitivity (rising/falling)
	// are catered for.
	_multistrobe_pulse();

	// Clear both enables for good measure.
	_multistrobe_end();
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


inline static void
clr_ws()
{
	// Clear the WS# output.
	PORTB &= ~ _BV(B_CLRWS);
	PORTB |= _BV(B_CLRWS);
}


#define CALC_FREQ(prescaler, hz) ((F_CPU) / (2 * (prescaler)) / (hz))


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

void write_cb();		// Forward definition
static void outcmd(uint8_t, bool_t); // Same


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
	return;
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
	wdt_enable(WDTO_8S);
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
       	       	    


void
hw_init()
{
	// Time = 1

	// Set output pins and idle values. This will initialise with
	// all output banks idle and the processor clock stopped.
	PORTB = B_IDLE;
	DDRB = B_OUTPUTS;

	PORTC = C_IDLE;
	DDRC = C_OUTPUTS;

	PORTD = D_IDLE;
	DDRD = D_OUTPUTS;
	PORTD = 0xff;

	// Time = 2

	// Explicitly tristate everything.
	tristate_ibus();
	tristate_db();
	tristate_ab();

	// write_ibus(0x1234);
	// write_ab(0x5678);
	// write_db(0xabcd);
	// int i;
	// for(i=0;;i++) {
	// 	_delay_ms(1000);
	// 	if ((i & 3) == 0) drive_ibus(); else tristate_ibus();
	// 	if ((i & 3) == 1) drive_ab(); else tristate_ab();
	// 	if ((i & 3) == 2) drive_db(); else tristate_db();
	// }

	// for(;;) {
	// 	PORTB = 0;
	// 	_delay_ms(500);
	// 	PORTB = _BV(PB1) | _BV(PB2);
	// 	_delay_ms(500);
	// }

	// Time = 3

	// Reset all the drivers with MR# pins, and initialise the wait state
	// state machine.
	strobe_clr();
	clr_ws();

	// Time = 4

	// Write the control bus, initialising all the control
	// outputs. This will de-assert all the reset signals, among
	// other things.
	clearflag(cb[1], CB1_NFPRESET | CB1_NRESET);
	setflag(cb[2], CB2_HALT | CB0_NIRQ6); // Assert HALT, clear NIRQ6.
	write_cb();		      // Shift out all the values
	clearbit(PORTD, D_NCTLOE);    // Enable the control bus drivers

	// Enable INT0 (with negative edge sensitivity)
	EICRA = (EICRA & 0xf0) | _BV(ISC01);
	setbit(EIMSK, INT0);

	// Set up the switch sampling/debouncing timer. Atmega168 datasheet,
	// p. 104.
	//
	// Sampling rate: 14.7456 MHz / (2 * 1024 * 256) = 28.125 Hz
	//
	// That's 35.56 ms between samples, plenty of time for
	// switches to stop bouncing.
	
	TCCR0A = _BV(WGM01);		// CTC Mode
	TCCR0B = _BV(CS00) | _BV(CS02); // CLK/1024 prescaler
	TIMSK0 = 2;			// Interrupt on compare match
	OCR0A = 0xff;			// Lowest possible rate (256)

	// Initialise the debugging serial port
	serial_init();

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

	// Enable the watchdog.
	wdt_enable(WDTO_4S);

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
	
	// If the RAM mapping was selected, start halted. The machins is
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

	// Write all the control bus signals just in case.
	write_cb();

	// Set up the console ring buffer
	ringbuf.ip = ringbuf.op = 0;
	
	// Enable the global interrupt flag
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

inline uint16_t
get_or()
{
	return _or;
}


inline void
set_or(const uint16_t or)
{
	_or = or;

	out_shift_registers16(_or, CMD_ORCLK);

	// Move data from ALL the shift registers to their respective output
	// registers. This will have no effect on tristated shift registers,
	// and will be a NOP unless an output register has been clocked with
	// new data.
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
// ADDRESS BUS CODE
//
///////////////////////////////////////////////////////////////////////////////

// Strategy: in standalone (no processor) mode, just drive the Address
// Bus ourselves. Downside: we have no control over AEXT.
//
// When a processor is present, use its Address Register instead. This
// has the advantage of operating the MBU and driving the AEXT lines,
// so we have access to the whole 21 bit address space.
//
// To set the AR: drive IBUS, put value on IBUS, strobe WAR#.
//
// To drive/tristate the address bus with a processor present, all we
// need to do is assert MEM# or IO# (which is done during bus access
// cycles anyway).

void
drive_ab()
{
	// The processor (if present) drives the AB.
	if (flags & FL_PROC) {
		// Just in case, tristate our AB drivers.
		setbit(PORTD, D_NABOE);
	} else {
		// Enable the AB drivers.
		clearbit(PORTD, D_NABOE);
	}
}


void
write_ab(const uint16_t abus)
{
	if (flags & FL_PROC) {

		//                 (1)(2)(3)(4)
		// IBUS ZZZZZZZZZZZZ<  DATA  >ZZZZZZZZZZ
		//      ________________   _____________
		// WAR#                 \_/
		//                       :
		// AR   XXXXXXXXXXXXXXXXX< IBUS VALUE

		write_ibus(abus); // Set IBUS value (drivers at Z)
		drive_ibus();  	  // Drive the IBUS
		setup();	  // Bus setup time
		strobe_war();	  // Strobe WAR# 
		hold();		  // Bus hold time
		tristate_ibus();  // Release the IBUS

	} else {
		// Drive the Address Bus ourselves.
		out_shift_registers16(abus, CMD_ABCLK);

		// Move data from ALL the shift registers to their respective
		// output registers. Tristated output registers will of course
		// not have any effects.
		strobecmd(CMD_STCP);
	}
}


inline void
tristate_ab()
{
	// Just in case something's gone wrong, we tristate the drivers whether
	// a processor is present or not.
	setbit(PORTD, D_NABOE);
}


///////////////////////////////////////////////////////////////////////////////
//
// DATA BUS
//
///////////////////////////////////////////////////////////////////////////////

inline void
drive_db()
{
	// The processor (if present) drives the DB.
	if (flags & FL_PROC) {
		// Just in case, tristate our DB drivers. And drive the IBUS
		// instead.
		setbit(PORTD, D_NDBOE);
		drive_ibus();
	} else {
		setbit(PORTD, D_NIBUSOE); // Tristate the IBUS
		clearbit(PORTD, D_NDBOE); // Drive the DBUS
	}
}


void
write_db(const uint16_t dbus)
{
	if (flags & FL_PROC) {
		// The processor drives the DB using the IBUS. All we need to
		// do is drive the IBUS.
		write_ibus(dbus);
	} else {
		out_shift_registers16(dbus, CMD_DBCLK);
	
		// Move data from ALL the shift registers to their respective
		// output registers. Tristated output registers will of course
		// not have any effects.
		strobecmd(CMD_STCP);
	}
}


void
tristate_db()
{
	if (flags & FL_PROC) tristate_ibus();
	// Tristate the DB too, even if the processor is connected. Can't hurt.
	setbit(PORTD, D_NDBOE);
}


void
addr_inc()
{
	extern uint16_t addr;
	addr++;
	_pc++;
	strobe_incpc();
}


// Output Controls (three bytes)

void
write_cb()
{
	// Sometimes we need to defer control bus writes so some
	// signals can be bundled together.
	if (defercb) {
		defercb--;
		return;
	}

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		out_shift_registers(cb[2], CMD_CTLCLK);
		out_shift_registers(cb[1], CMD_CTLCLK);
		out_shift_registers(cb[0], CMD_CTLCLK);
		
		// Move data from ALL the shift registers to their respective
		// output registers. Tristated output registers will of course
		// not have any effects.
		strobecmd(CMD_STCP);
	}
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


void
set_clkfreq(uint8_t prescaler, uint16_t div)
{
	_clk_prescale = prescaler;
	_clk_div = div;

	bit(PORTB, B_FPCLKEN, 0);

	// COM1A = 00
	// COM1B = 01 (toggle OC1B on compare match)
	// WGM   = 0100 (CTC mode)

	// TCCR1A = 0x10;			       // Toggle OC1B on compare match
	// TCCR1B = 8 | (prescaler & 7);	       // CTC, prescaler
	// TIMSK1 = 2;
	// OCR1B = div;

	TCCR1B = _BV(WGM12) | (prescaler & 7); // CTC, prescaler
	OCR1A = div;
}


void
clk_start()
{
	if (_clk_prescale == 0) clk_fast();
	else {
		set_clkfreq(_clk_prescale, _clk_div);
		TCCR1A = _BV(COM1B0);
	}
	_stopped = 0;
}


void
clk_stop()
{
	// Disable the processor's clock.
	clearbit(PORTB, B_FPCLKEN);

	// Also disconnect the FPUSTEP-IN pin from the timer. The pin
	// will stay in its last state.
	TCCR1A = 0x00;	// Disconnect FPUSTEP-IN pin, no pulses.
	_stopped = 1;
}


inline void
clk_fast()
{
	_clk_prescale = 0;
	TCCR1A = 0x00;
	bit(PORTB, B_FPCLKEN, 1);
	// The rate of the slow clock is a Don't Care value.
}


inline void
clk_slow()
{
	// 80 Hz = 14745600 / (2 * 1024 * (1 + 89))
	set_clkfreq(PSV_1024, 89);
	//if (_stopped) report_pstr(PSTR("stopped: true\n"));
	//else report_pstr(PSTR("stopped: false\n"));
	if (!_stopped) TCCR1A = _BV(COM1B0);
}


inline void
clk_creep()
{
	// 8 Hz = 14745600 / (2 * 1024 * (1 + 890))
	set_clkfreq(PSV_1024, 899);
	//if (_stopped) report_pstr(PSTR("stopped: true\n"));
	//else report_pstr(PSTR("stopped: false\n"));
	if (!_stopped) TCCR1A = _BV(COM1B0);
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


inline void
set_buspu(const uint8_t x)
{
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		outcmd(CMD_BUSPU, x);
	}
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
set_fpram(bool_t val)
{
	// ROM/RAM# signal. High = ROM, Low = RAM. Equivalent to the FPRAM#
	// signal.
	do_cb(1, NFPRAM, val);
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
release_bus()
{
	defercb = 0;		// Always immediate!
	tristate_ab();
	tristate_db();
	tristate_ibus();
	clearflag(cb[2], CB2_MEM | CB2_IO | CB2_W | CB2_R);
	
	do_cb(2, HALT, 0);
	write_cb();
	do_cb(2, HALT, 1);
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


#endif	// AVR


// End of file.
