// -*- indent-c++ -*-
//

// This 'driver' is only available on the CFTEMU target.

#ifdef CFTEMU

#include "hwcompat.h"
#include "panel.h"
#include "proto.h"
#include "abstract.h"
#include "bus.h"
#include "utils.h"
#include "serial.h"
#include "output.h"
#include "iface.h"

dfp_cb_t dfp_cb;

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
uint8_t _defercb = 0;
//static uint8_t _clk_prescale = PSV_1024;
static uint16_t _clk_div = 89;
static uint8_t v_stopped = 1;

static union {
	uint8_t  uvec8[4];	// Microcode vector: 24 bits ([3] unused)
	uint32_t uvec32;	// Microcode vector as a 32-bit integer
} _uv;

#define defer_cb_write() _defercb++

// flags for _swleft

#define SWL_NLOCK  0x0001
#define SWL_RESET  0x0002
#define SWL_STOP   0x0004
#define SWL_RUN    0x0008
#define SWL_STEP   0x0010
#define SWL_USTEP  0x0020
#define SWL_SLOW   0x0040
#define SWL_FAST   0x0080
#define SWL_SPD_SHIFT      6

#define SWL_DS0    0x0100
#define SWL_DS1    0x0200
#define SWL_DS2    0x0400
#define SWL_DS3    0x0800
#define SWL_DS4    0x1000
#define SWL_DS5    0x2000
#define SWL_DS6    0x4000
#define SWL_DS7    0x8000

#define SWL_AUTOREPEAT (SWL_STEP|SWL_USTEP)

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
#define SWR_ROM    0x0200
#define SWR_IFR6   0x0400
#define SWR_IFR1   0x0800

#define SWR_DS8    0x1000
#define SWR_DS9    0x2000
#define SWR_DS10   0x4000
#define SWR_DS11   0x8000

#define SWR_AUTOREPEAT (SWR_MEMW|SWR_MEMR|SWR_IOW|SWR_IOR|SWR_IFR6|SWR_IFR1)

uint16_t icr = 0;
static uint8_t ifr6_operated = 0;
static uint8_t idle_addr = 0; // Used for diagnostics

#define QEF_BASE 0x40ff
#define QEF_HOF  0x0100
#define QEF_HOS  0x0200
#define QEF_LOCK 0x0400

// Feature bits
#define FTR_HOB  0x0001		// Halt on bus errors: emulator only
#define FTR_TRC  0x0010		// Assembly trace
#define FTR_UTR  0x0020		// Microcode trace
#define FTR_HOS  0x0200		// Halt on SENTINEL

static uint16_t features = 0;


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
// SERIAL CODE
//
///////////////////////////////////////////////////////////////////////////////

void serial_init()
{
	// Does nothing.
}

void serial_send(unsigned char c)
{
	(*dfp_cb.putc)(c);
}


///////////////////////////////////////////////////////////////////////////////
//
// FAKED AVR STUFF
//
///////////////////////////////////////////////////////////////////////////////

void
wdt_reset()
{
}


///////////////////////////////////////////////////////////////////////////////
//
// PANEL INTERFACE
//
///////////////////////////////////////////////////////////////////////////////

bool_t
panel_lock(bool_t lock)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}

void 
panel_sr(uint16_t sr)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_reset()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_start()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_run()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_stop()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_step()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_ustep()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_spd(uint8_t spd)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_ldir()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_ldaddr()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_ldac()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_wmem(bool_t inc, uint16_t a, uint16_t d)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_rmem(bool_t inc, uint16_t a)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_wio(bool_t inc, uint16_t a, uint16_t d)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_rio(bool_t inc, uint16_t a)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_rom(uint8_t rom)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_ifr1()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
panel_ifr6()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}



///////////////////////////////////////////////////////////////////////////////
//
// BUS CODE
//
///////////////////////////////////////////////////////////////////////////////

uint8_t
assert_halted()
{
	return 1;		// Fake it.
}


uint16_t
perform_read(uint8_t space, uint16_t addr)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}

uint16_t
perform_block_read(uint16_t base, int16_t n, uint16_t * buf)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


uint8_t
perform_write(uint8_t space, uint16_t addr, uint16_t word)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}

void
start_block_write(uint8_t space)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
perform_block_write(uint16_t addr, uint16_t word)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


uint8_t
set_reg(uint8_t reg, uint16_t value)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


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
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
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
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline static void
strobe_clr()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline static void
clr_ws()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
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
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 1;
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
	report_pstr(PSTR(STR_DETPROC STR_DETPROC1));
	return 1;
}


#define NUM_REPS 20


static void
dfp_diags()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
hw_init()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);

	// Run diagnostics
	dfp_diags();

	// Read the initial state of the front panel switches.
	deb_sample(0);

	// Set the initial clock values on the speed switch. Don't start the
	// clock yet.
	// uint8_t spd = (_swleft & (SWL_SLOW|SWL_FAST)) >> SWL_SPD_SHIFT;
	// if (spd == 2) {
	// 	_clk_prescale = PSV_1024;
	// 	_clk_div = 89;
	// } else if (spd == 3) {
	// 	_clk_prescale = PSV_1024;
	// 	_clk_div = 899;
	// } else {
	// 	_clk_prescale = 0;
	// 	_clk_div = 0;
	// }

	// Don't write anything to the control bus just yet.
	_defercb = 255;

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
	_defercb = 0;
	write_cb();

	// Perform a full machine RESET cycle, which will either strobe
	// FPRESET# (only the de-assertion of which is needed), or perform a
	// standalone RESET#/RSTHOLD# cycle if the processor is missing.
	perform_reset();

	// Now de-assert the various reset signals explicitly. Can't hurt.
	// _cb[0] |= CB0_NIRQ1 | CB0_NIRQ6;
	// _cb[1] |= CB1_NFPRESET | CB1_NRESET;

	// Write all the control bus signals just in case.
	write_cb();

	// Set up the console ring buffer
	ringbuf.ip = ringbuf.op = 0;
	
	// Enable the global interrupt flag
	//sei();
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
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline uint16_t
get_ab()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return _ab;
}


inline uint16_t
get_db()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


inline uint16_t
get_dsr()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


inline void
set_sr(const uint16_t sr)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline uint16_t
get_sr()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


inline uint16_t
get_lsw()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


inline uint16_t
get_rsw()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}

void
virtual_panel_sample(bool_t quick)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline uint8_t
get_misc()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


inline uint32_t
get_uvec()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


inline uint16_t
get_ir()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


inline uint16_t
get_pc()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


inline uint16_t
get_ac()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


///////////////////////////////////////////////////////////////////////////////
//
// OUTPUT
//
///////////////////////////////////////////////////////////////////////////////

inline uint16_t
get_or()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
}


inline void
set_or(const uint16_t or)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return;
}


inline void
drive_ibus()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
write_ibus(const uint16_t ibus)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline void
tristate_ibus()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
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
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
write_ab(const uint16_t abus)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline void
tristate_ab()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


///////////////////////////////////////////////////////////////////////////////
//
// DATA BUS
//
///////////////////////////////////////////////////////////////////////////////

inline void
drive_db()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
write_db(const uint16_t dbus)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
tristate_db()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
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
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


///////////////////////////////////////////////////////////////////////////////
//
// STROBES AND MISCELLANEOUS SIGNALS
//
///////////////////////////////////////////////////////////////////////////////


void
wait_for_halt(bool_t reckless)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);

	// This will obviously lock up the MCU if the HALT condition isn't
	// seen. We want this.
	flags |= FL_BUSY | FL_STOPPING;

	// When we have no CPU, go through the motions but don't fail because
	// the state machine will never get tot he STOP state.
	if ((flags & FL_PROC) == 0) return;

	// Set the FL_HALT flag first because assert_halted() checks
	// that before proceeding to proper tests.
	flags |= FL_HALT;
	flags &= ~(FL_BUSY | FL_STOPPING);
}


void
set_clkfreq(uint8_t prescaler, uint16_t div)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
clk_start()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
clk_stop()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline void
clk_fast()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline void
clk_slow()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline void
clk_creep()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline void
perform_step()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_stopping()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_steprun(bool_t val)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
perform_ustep()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


inline void
set_buspu(const uint8_t x)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}



// Helper and sanity check
#define do_cb(n, s, v) flag(_cb[n], CB##n##_##s, v)


inline void
set_safe(bool_t val)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_irq1(bool_t val)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_irq6(bool_t val, bool_t fromPanel)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_fpram(bool_t val)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
perform_reset()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}

void
strobe_wpc()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
strobe_wac()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
strobe_wir()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
strobe_w()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_r(bool_t val)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_mem(bool_t val)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_io(bool_t val)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
release_bus()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
strobe_war()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
strobe_rpc()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
strobe_incpc()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_halt(bool_t val)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
set_fprunstop(bool_t run)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


void
queue_char(uint8_t c)
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
}


uint16_t
maybe_dequeue_char()
{
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0x8000;		// nothing to return
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

#if 0
__attribute__ ((used))
ISR(INT0_vect)
{
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
			features |= _db;
			if (features & FTR_TRC) buscmd_debugon();
			if (features & FTR_HOS) flags |= FL_HOS;
			break;

		case IO_DISEF:
			features &= ~_db;
			if (features & FTR_TRC) buscmd_debugoff();
			if (features & FTR_HOS) flags &= ~FL_HOS;
			break;

		case IO_ICR:
			icr = _db;
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
		// an ‘involuntary’ function that makes the data bus register
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
 			_db = 0;
			// Interrupts asserted
			if ((_cb[0] & CB0_NIRQ1) == 0) _db |= ISR_IRQ6;
			if ((_cb[0] & CB0_NIRQ6) == 0) _db |= ISR_IRQ1;
			// Interrupt sources
			if (ifr6_operated) _db |= ISR_IFR6;
			if (ringbuf.op != ringbuf.ip) _db |= ISR_TTY;

			defer_cb_write(); // Clear both IRQ1 and IRQ6 together.
			set_irq1(0);
			set_irq6(0, 0);
			ifr6_operated = 0;
			break;

		case IO_QEF1:
		case IO_QEF2:
			_db = QEF_BASE;
			if (flags & FL_HOF) _db |= QEF_HOF;
			if (flags & FL_HOS) _db |= QEF_HOS;
			if (actuated(_swleft, SWL_NLOCK)) _db |= QEF_LOCK;
			break;

		case IO_READC:
			_db = maybe_dequeue_char();
			break;
		}
		write_db(_db);
	}
	
	// Strobe the CLR-WS signal to clear wait states.
	clr_ws();
}
#endif

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

#if 0
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
		  if (pause == 0) _cb[2] ^= CB2_FPSTOP;
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
#endif

#endif	// CFTEMU

// End of file.
