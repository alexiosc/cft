// -*- c -*-
// 
// driver_cftemu.c — Functionality for emulating the DFP
// 
// Copyright © 2012–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

///////////////////////////////////////////////////////////////////////////////
//
// HARDWARE DRIVER FOR DFP ON CFT EMULATOR
//
///////////////////////////////////////////////////////////////////////////////

// This 'driver' is only available on the CFTEMU target.
#ifndef CFTEMU
#  error "This driver is meant for the CFT Emulator only."
#endif // AVR

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <assert.h>

#include "dfp.h"
#include "utils.h"
#include "driver.h"
#include "iface.h"


hwstate_t  hwstate;             // Hardware state on the DFP side

dfp_cb_t   dfp_cb;              // Interface to the CFT emulator

// Values written to buses by the DFP are held here. These simulate the latches
// present on the DFP2 board.

static uint16_t   ibus;         // The DFP-driven value of the IBUS
static uint32_t   ab;           // The DFP-driven value of the Address Bus
static uint16_t   db;           // The DB
static uint16_t   or;           // The Output Register
static uint16_t   dsr;          // The Local DIP switches

static uint8_t    raddr;        // The Processor read address field
static uint8_t    waddr;        // The Processor write address field
static uint8_t    action;       // The Processor action field
static uint8_t    fpd;          // The FPD bus
static mfd_t      mfd_setting;  // The current MFD switch setting
static uint8_t    state_leds;   // The CFT/DFP state LEDs


///////////////////////////////////////////////////////////////////////////////
//
// LOGGING TO THE EMULATOR
//
///////////////////////////////////////////////////////////////////////////////

#define fatal(s, ...)    logger(LOG_FATAL,   s, ## __VA_ARGS__)
#define error(s, ...)    logger(LOG_ERROR,   s, ## __VA_ARGS__)
#define warning(s, ...)  logger(LOG_WARNING, s, ## __VA_ARGS__)
#define notice(s, ...)   logger(LOG_NOTICE,  s, ## __VA_ARGS__)
#define info(s, ...)     logger(LOG_INFO,    s, ## __VA_ARGS__)
#define debug(s, ...)    logger(LOG_DEBUG,   s, ## __VA_ARGS__)

#define not_implemented() fatal("Not implemented.")

void
logger(int level, char *fmt, ...)
{
        va_list ap;
        char * buf;

        assert (level >= 0 && level < 5);
        assert (fmt != NULL);

        va_start(ap, fmt);
        int result = vasprintf(&buf, fmt, ap);
        assert (result >= 0);
        va_end(ap);

        (*dfp_cb.log)(level, buf);
        free(buf);
}


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

#define XMEM_BASE 0x8000
inline static void
xmem_write(const xmem_addr_t addr, const uint8_t val)
{
        not_implemented();

        fpd = val;              // Pretend we have bus hold circuitry

        // Only a few of the 256 XMEM addresses have write registers on the DFP2.

        switch (addr) {
	case XMEM_AB_L:         // Write to AB bits 0-7
                ab = (ab & 0xffff00) | val;
                break;
                
	case XMEM_AB_M:         // Write to AB bits 8-15
                ab = (ab & 0xff00ff) | (val << 8);
                break;
                
	case XMEM_AB_H:         // Write to AB bits 16-23
                ab = (ab & 0x00ffff) | (val << 16);
                break;

	case XMEM_DB_L:         // Write to DB bits 0-7
                db = (db & 0xff00) | val;
                break;
                
	case XMEM_DB_H:         // Write to DB bits 8-15
                db = (db & 0x00ff) | (val << 8);
                break;
                
	case XMEM_IBUS_L:	// Write to IBUS bits 0-7
                ibus = (ibus & 0xff00) | val;
                break;
                
	case XMEM_IBUS_H:	// Write to IBUS bits 8-15
                ibus = (ibus & 0x00ff) | (val << 8);
                break;
                
	case XMEM_OR_L:         // (write-only) Write to OR, bits 0-7
                or = (or & 0xff00) | val;
                break;
                
	case XMEM_OR_H:         // Write to OR, bits 8-15
                or = (or & 0x00ff) | (val << 8);
                break;
                
	case XMEM_RADDR:	// output to µCV RADDR field
                raddr = val & 0x1f;
                (*dfp_cb.ibus_r)(raddr, &ibus);
                break;
                
	case XMEM_WADDR:	// output to µCV WADDR field
                waddr = val & 0x1f;
                (*dfp_cb.ibus_w)(waddr, ibus);
                break;
                
	case XMEM_ACTION:	// output to µCV ACTION field
                action = val & 0x0f;
                (*dfp_cb.action)(action, &ibus);
                break;
                
        default:
                error("XMEM write(%02x, %02x): address not implemented.", addr, val);
        }
}


inline static uint8_t
xmem_read(const xmem_addr_t addr)
{
        switch (addr) {
	case XMEM_UCV_H:	//  0 A1 C16: µCV bits 16–23
                if (dfp_cb.ucv == NULL) return 0;
                return (uint8_t)((*dfp_cb.ucv >> 24) & 0xff);

	case XMEM_UCV_M:	//  1 B1 C22: µCV bits 8–15
                if (dfp_cb.ucv == NULL) return 0;
                return (uint8_t)((*dfp_cb.ucv >> 16) & 0xff);

	case XMEM_UCV_L:	//  2 C1 C30: µCV bits 0–7
                if (dfp_cb.ucv == NULL) return 0;
                return (uint8_t)(*dfp_cb.ucv & 0xff);

	case XMEM_IRQ_ACT:	//  3 D1 C39: IRQs active
                if (dfp_cb.irq_act == NULL) return 0;
                return *dfp_cb.irq_act;

	case XMEM_AEXT:         //  4 A2  C4: AEXT
                if (dfp_cb.ab == NULL) return 0;
                return (uint8_t)((*dfp_cb.ab >> 16) & 0xff);

	case XMEM_PC_HI:	//  5 B2 C21: PC bits 8–15
                if (dfp_cb.pc == NULL) return 0;
                return (uint8_t)((*dfp_cb.pc >> 8) & 0xff);

	case XMEM_PC_LO:	//  6 C2 C27: PC bits 0–7
                if (dfp_cb.pc == NULL) return 0;
                return (uint8_t)(*dfp_cb.pc && 0xff);

	case XMEM_IRQ_EN:	//  7 D2 C40: IRQs enabled
                if (dfp_cb.irq_act == NULL) return 0;
                return *dfp_cb.irq_act;

	case XMEM_FLAGS:	//  8 A3 C13: flags
                if (dfp_cb.flags == NULL) return 0;
                return (uint8_t)(*dfp_cb.flags);

	case XMEM_AC_HI:	//  9 B3 C20: AC bits 8–15
                if (dfp_cb.ac == NULL) return 0;
                return (uint8_t)((*dfp_cb.ac >> 8) & 0xff);

	case XMEM_AC_LO:	// 10 C3 C28: AC bits 0–7
                if (dfp_cb.ac == NULL) return 0;
                return (uint8_t)(*dfp_cb.ac && 0xff);

	case XMEM_FP_D3:	// 11 D3 C37: TBD, for expansion
                return 0;

	case XMEM_FP_A4:	// 12 A4 C12: (TBD)
                return 0;

	case XMEM_MFD_HI:       // 13 B4 C32/C34: DR/SP hi → MFD bits 8–15 (*)
                switch (mfd_setting) {
                case MFD_OR:
                        return (uint8_t)((or >> 8) & 0xff);

                case MFD_DR:
                        if (dfp_cb.dr == NULL) return 0;
                        return (uint8_t)((*dfp_cb.dr >> 8) & 0xff);

                case MFD_SP:
                        if (dfp_cb.sp == NULL) return 0;
                        return (uint8_t)((*dfp_cb.sp >> 8) & 0xff);
                }
                break;

	case XMEM_MFD_LO:       // 14 C4 C29/C31: DR/SP lo → MFD bits 0–7  (*)
                switch (mfd_setting) {
                case MFD_OR:
                        return (uint8_t)(or & 0xff);

                case MFD_DR:
                        if (dfp_cb.dr == NULL) return 0;
                        return (uint8_t)(*dfp_cb.dr & 0xff);

                case MFD_SP:
                        if (dfp_cb.sp == NULL) return 0;
                        return (uint8_t)(*dfp_cb.sp & 0xff);
                }
                break;

	case XMEM_FP_D4:        // 15 D4 C38: TBD, for expansion
                return 0;

	case XMEM_STATE:	// 16 A5 Cxx: state (run/stop etc)
                return state_leds;

	case XMEM_IR_HI:	// 17 B5 C19: IR bits 8–15
                if (dfp_cb.ir == NULL) return 0;
                return (uint8_t)((*dfp_cb.ir >> 8) & 0xff);
                break;

	case XMEM_IR_LO:	// 18 C5 C25: IR bits 0–7
                if (dfp_cb.ir == NULL) return 0;
                return (uint8_t)(*dfp_cb.ir & 0xff);

	case XMEM_UAV_LO:	// 19 D5 C35: micro-address low bits
                if (dfp_cb.uav == NULL) return 0;
                return (uint8_t)(*dfp_cb.uav & 0xff);

	case XMEM_DSR:          // (read-only) Read DIP switches
                return dfp_cb.dip_switches;

        default:
                error("XMEM read(%02x): address not implemented, returning %02x (bus hold).", addr, fpd);
        }
}


inline static void
sample()
{
        // This samples the CFT buses into our simulated latches.
	pthread_mutex_lock(&dfp_cb.lock);

        ab = *dfp_cb.ab;
        db = *dfp_cb.db;
        ibus = *dfp_cb.ibus;
        
	pthread_mutex_unlock(&dfp_cb.lock);
}


uint8_t
read_dfp_address(xmem_addr_t a)
{
        // This is simple on the emulator
        return xmem_read(a);
}


#warning "Move this function to a lever above the drivers."
void
read_full_state()
{
        // Read the buses directly.
        hwstate.ab_h = xmem_read(XMEM_AB_H);
        hwstate.ab_m = xmem_read(XMEM_AB_M);
        hwstate.ab_l = xmem_read(XMEM_AB_L);

        hwstate.db_h = xmem_read(XMEM_DB_H);
        hwstate.db_l = xmem_read(XMEM_DB_L);

        hwstate.ibus_h = xmem_read(XMEM_DB_H);
        hwstate.ibus_l = xmem_read(XMEM_DB_L);

        hwstate.dsr = DSR_HIGH | xmem_read(XMEM_DSR);

        // Read via buffers in the computer.
        hwstate.ucv_h = xmem_read(XMEM_UCV_H);
        hwstate.ucv_m = xmem_read(XMEM_UCV_M);
        hwstate.ucv_l = xmem_read(XMEM_UCV_L);

        fp_scanner_start();
}


inline static void
release_buses()
{
        // Nothing to do here.
}


inline static void
release_ibus()
{
        // Nothing to do here.
}


inline static void
release_ucv()
{
        // Nothing to do here.
}


MUST_CHECK errno_t
write_to_ibus_unit(uint8_t waddr, uint16_t val)
{
        if (!hwstate.is_halted) {
                return ERR_NHALTED;
        }

        xmem_write(XMEM_RADDR, 0);
        xmem_write(XMEM_WADDR, 0);
        xmem_write(XMEM_ACTION, 0);

        #error "Complete this"

        clearbit(PORTE, E_NMCVOE); // Drive the IBUS
        xmem_write(XMEM_IBUS_H, (val >> 8) & 0xff);
        xmem_write(XMEM_IBUS_L, (val & 0xff));
        clearbit(PORTC, C_NIBOE);
        
        xmem_write(XMEM_WADDR, waddr);
        xmem_write(XMEM_WADDR, 0);
        
        setbit(PORTE, E_NMCVOE);
        setbit(PORTC, C_NIBOE);
}


MUST_CHECK errno_t
read_from_ibus_unit(uint8_t raddr, uint16_t * val)
{
        if (!hwstate.is_halted) {
                return ERR_NHALTED;
        }

        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
                xmem_write(XMEM_RADDR, 0);
                xmem_write(XMEM_WADDR, 0);
                xmem_write(XMEM_ACTION, 0);

                clearbit(PORTE, E_NMCVOE);
                xmem_write(XMEM_RADDR, raddr);

                *val = xmem_read(XMEM_IBUS_H) << 8 | xmem_read(XMEM_IBUS_L);

                xmem_write(XMEM_RADDR, 0);
                setbit(PORTE, E_NMCVOE);
        }
}








///////////////////////////////////////////////////////////////////////////////
//
// TO PORT
//
///////////////////////////////////////////////////////////////////////////////





void
hw_init()
{
        assert(dfp_cb.fatal != NULL);
        assert(dfp_cb.error != NULL);
        assert(dfp_cb.warning != NULL);
        assert(dfp_cb.notice != NULL);
        assert(dfp_cb.info != NULL);
        assert(dfp_cb.debug != NULL);

        (*dfp_cb.fatal)("Not implemented.");

        ab = 0;
        ibus = 0;
        or = 0;
        fpd = 0;
        mfd_setting = MFD_OR;
}


void
hw_tick()
{
        (*dfp_cb.fatal)("Not implemented.");
}


void
hw_done()
{
}


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//
// UNPORTED CODE BELOW
//
///////////////////////////////////////////////////////////////////////////////

#if 0

static uint16_t _ibus;
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
static uint16_t _oldsr = 0xffff;
static uint16_t _buscmd_write = 0;

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
ringbuf_t ringbuf;

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
	//if (c == '\r') return;
	(*dfp_cb.putc)(c);
}


void dfp_fw_rx(unsigned char c)
{
	proto_input(c);
	pthread_mutex_unlock(&dfp_cb.rx_lock);
}


void dfp_fw_sr(uint16_t sr)
{
	// Not needed, the timer picks up changes to the SR without an explicit
	// 'interrupt'.
}


void dfp_fw_iocmd(uint8_t is_write)
{
	// Handle an I/O command from the CPU.
	//
	// Note: R# is an active low signal, so it's *1* when writing.
	_buscmd_write = is_write;
	//printf("*** INTERRUPT\n");
	run_buscmd_interrupt();
}


void dfp_fw_init()
{
	hw_init();
	proto_init();
	pthread_mutex_lock(&dfp_cb.lock);
	dfp_cb.request_unpause++;
	if (dfp_cb.request_testmode) {
		flags &= ~(FL_TERM | FL_ECHO);
		flags |= FL_HOF | FL_HOS;
		dfp_cb.request_testmode = 0;
	}
}


void dfp_fw_run()
{
	proto_loop();
}


///////////////////////////////////////////////////////////////////////////////
//
// FAKED AVR STUFF
//
///////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////
//
// PANEL INTERFACE
//
///////////////////////////////////////////////////////////////////////////////

bool_t
panel_lock(bool_t lock)
{
	// We don't have a panel key lock.
	return 0;
}

void 
panel_sr(uint16_t sr)
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	if (sr == _oldsr) return;

	_oldsr = sr;

	say_break();
	set_sr(sr);
	say_sr();
	proto_prompt();
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
	// Ensure it's stopped.
	if ((flags & FL_HALT) == 0) {
		style_error();
		report_pstr(PSTR(STR_RUNNING));
		flags |= FL_ERROR;
		return 0;
	}

	return 1;
}


uint16_t
perform_read(uint8_t space, uint16_t addr)
{
	if (dfp_cb.ab == NULL) return 0;
	if (dfp_cb.db == NULL) return 0;
	if (dfp_cb.unit_mem == NULL) return 0;
	if (dfp_cb.unit_io == NULL) return 0;

	pthread_mutex_lock(&dfp_cb.lock);
	*(dfp_cb.ab) = addr;
	uint16_t val;

	if (space == SPACE_MEM) {
		val = *(dfp_cb.db) = (*dfp_cb.unit_mem)(1, 0);
	} else {
		val = *(dfp_cb.db) = (*dfp_cb.unit_io)(1, 0);
	}
	pthread_mutex_unlock(&dfp_cb.lock);

	return val;
}

uint16_t
perform_block_read(uint16_t base, int16_t n, uint16_t * buf)
{
	if (dfp_cb.ab == NULL) return 0;
	if (dfp_cb.db == NULL) return 0;
	if (dfp_cb.unit_mem == NULL) return 0;

	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	pthread_mutex_lock(&dfp_cb.lock);
	while (n--) {
		// Perform a cycle
		*(dfp_cb.ab) = base;
		*buf++ = *(dfp_cb.db) = (*dfp_cb.unit_mem)(1, 0);
		base++;
	}
	pthread_mutex_unlock(&dfp_cb.lock);
	
	return 1;
}


uint8_t
perform_write(uint8_t space, uint16_t addr, uint16_t word)
{
	if (dfp_cb.ab == NULL) return 0;
	if (dfp_cb.db == NULL) return 0;
	if (dfp_cb.unit_mem == NULL) return 0;
	if (dfp_cb.unit_io == NULL) return 0;

	pthread_mutex_lock(&dfp_cb.lock);
	*(dfp_cb.ab) = addr;
	*(dfp_cb.db) = word;

	if (space == SPACE_MEM) {
		(*dfp_cb.unit_mem)(0, 1);
	} else {
		(*dfp_cb.unit_io)(0, 1);
	}
	pthread_mutex_unlock(&dfp_cb.lock);

	return 1;
}

uint8_t
set_reg(uint8_t reg, uint16_t value)
{
	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	// Stop the clock.
	clk_stop();

	// Even with the processor halted, some control signals are
	// bus-held. Explicitly drive MEM#, IO#, R#, and WEN# high.

	switch (reg) {
	case REG_IR:
		*(dfp_cb).ir = value;
		break;
	case REG_AC:
		*(dfp_cb).ac = value;
		*(dfp_cb).z = value == 0;
		*(dfp_cb).n = value & 0x8000 ? 1 : 0;
		break;
	case REG_PCAR:
		// Purposefully falling through
	case REG_PC:
		*(dfp_cb).ab = value; // AR == AB
		*(dfp_cb).pc = value;
		break;
	}

	// Sample the bus after setting the reg. This can be used to
	// verify a correct write.
	virtual_panel_sample(0);

	return 1;
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
}


inline static void
clr_ws()
{
	// Wait states aren't implemented internally. Do nothing.
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
	// The emulator always has a CPU installed.
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



	///////////////////////////////////////////////////////////////////////////////

	
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
	// standalone RESET#/RSTHOLD# cycle if the processor is missing. This
	// is only required on actual hardware. The way the emulator works (a)
	// ensures a full reset of the machine at this point anyway, and (b)
	// causes an endless reset loop.
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


#define dereference(x) ((x) != NULL ? *(x) : 0)
#define testbit(x, b) ((x) != NULL ? (*(x) ? b : 0) : 0)

void
deb_sample(bool_t quick)
{
	_ab = dereference(dfp_cb.ab);
	_db = dereference(dfp_cb.db);
	_swright = dereference(dfp_cb.swright);
	_swleft = dereference(dfp_cb.swleft);
	_sr = dereference(dfp_cb.sr);
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
	printf("%s: NOT IMPLEMENTED\n", __FUNCTION__);
	return 0;
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

void
virtual_panel_sample(bool_t quick)
{
	_flags = 
		testbit(dfp_cb.n, CFL_FN) |
		testbit(dfp_cb.z, CFL_FZ) |
		testbit(dfp_cb.v, CFL_FV) |
		testbit(dfp_cb.i, CFL_FI) |
		testbit(dfp_cb.l, CFL_FL);

	if (_buscmd_write) _flags |= CFL_NR;
	
	if (!quick) {
		_uv.uvec32 = dereference(dfp_cb.uvec) ^ UVEC_INVERT;
		_ir = dereference(dfp_cb.ir);
		_pc = dereference(dfp_cb.pc);
		_ac = dereference(dfp_cb.ac);
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
}


inline void
drive_ibus()
{
}


void
write_ibus(const uint16_t ibus)
{
	_ibus = ibus;
}


inline void
tristate_ibus()
{
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
}


void
write_ab(const uint16_t abus)
{
	if (dfp_cb.ab != NULL) *(dfp_cb.ab) = abus;
}


inline void
tristate_ab()
{
}


///////////////////////////////////////////////////////////////////////////////
//
// DATA BUS
//
///////////////////////////////////////////////////////////////////////////////

inline void
drive_db()
{
}


void
write_db(const uint16_t dbus)
{
	if (dfp_cb.db != NULL) *(dfp_cb.db) = dbus;
}


void
tristate_db()
{
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
	// This will obviously lock up the MCU if the HALT condition isn't
	// seen. We want this.
	flags |= FL_BUSY | FL_STOPPING;

	// Pretend.
	usleep(250000);

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
	pthread_mutex_lock(&dfp_cb.lock);
	dfp_cb.request_reset++;
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
	// No need.
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
	static int val0 = 42;
	//printf("*** SET_HALT(%d) CALLED (val0=%d) ***\n", val, val0);

	if (val0 != val) {
		if (val) {
			//printf("*** HALTING %d ***\n", val);
			//pthread_mutex_lock(&dfp_cb.lock);
			dfp_cb.request_halt++;
		} else {
			//printf("*** RUNNING %d ***\n", val);
			//pthread_mutex_lock(&dfp_cb.lock);
			dfp_cb.request_run++;
		}
	}
	val0 = val;
}


void
set_fprunstop(bool_t run)
{
	// We don't have LEDs, do nothing.
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

void
run_buscmd_interrupt()
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

void
run_timer_interrupt()
{
	// static uint8_t pause = 0;
	// static uint8_t autorepeat = 45;
	// static uint8_t accelerate = 0;

	// // Blink the STOP light at ~10Hz while busy, and ignore the front panel
	// // switches. Any routine working overtime here had better call
	// // wdt_reset() on its own, otherwise the Watchdog will reset the DFP.
	// if (flags & FL_BUSY) {
	// 	pause = (pause + 1) & 3;
	// 	if (pause == 0) _cb[2] ^= CB2_FPSTOP;
	// 	write_cb();
	// 	return;
	// }

	// // We're still alive!
	// wdt_reset();

	// // If software-locked, ignore switches.
	// if (flags & FL_SWLOCK) return;
	
	// Toggle switch handling
	deb_sample(0);		// Read the switches
	
	// Print out the Switch Register to the debugging console, if it's
	// changed (the decision is made in panel_sr()). The SR can't be
	// locked, so we act on it before the panel lock check.
	if (_sr0 != _sr) panel_sr(_sr);

	// // If the front panel is locked, bail out.
	// if (panel_lock(actuated(_swleft, SWL_NLOCK))) {
	// 	return;
	// }

	// // Ignore 'action' panel switches if we're busy
	// if (flags & FL_BUSY) return;

	// // Have the switches changed?
	// if (_swleft0 == _swleft && _swright0 == _swright && _sr0 == _sr) {
	// 	if (autorepeat > 1) autorepeat--;
	// 	if (autorepeat != 1) return;

	// 	if (((_swleft & SWL_AUTOREPEAT) != SWL_AUTOREPEAT) ||
	// 	    ((_swright & SWR_AUTOREPEAT) != SWR_AUTOREPEAT)) {
	// 		// Three levels of autorepeat acceleration: 2 Hz, 6 Hz
	// 		// and 30 Hz.
	// 		if (accelerate < 255) accelerate++;
	// 		if (accelerate > 30) autorepeat = 1;
	// 		else if (accelerate > 6) autorepeat = 5;
	// 		else autorepeat = 15;
	// 	}
	// } else {
	// 	// A new button that supports autorepeat has been pressed (reminder:
	// 	// switches are active low, hence the logic below), prepare for
	// 	// autorepeat. 45 = ~1.5 sec.
	// 	if (((_swleft & SWL_AUTOREPEAT) != SWL_AUTOREPEAT) ||
	// 	    ((_swright & SWR_AUTOREPEAT) != SWR_AUTOREPEAT)) {
	// 		// A switch with autorepeat enabled has been
	// 		// pressed. Arm for the first repeat event.
	// 		autorepeat = 45;
	// 	} else {
	// 		// All the auto-repeat switches have been
	// 		// released. Reset auto-repeat.
	// 		autorepeat = 0;
	// 		accelerate = 0;
	// 	}
	// }

	// // Set the clock speed.
	// panel_spd((_swleft & (SWL_SLOW|SWL_FAST)) >> SWL_SPD_SHIFT);

	// // The RAM switch is only acted on on reset (an edge action), and when
	// // the clock is halted (a level action or latch). Again, the decision
	// // is made in panel_rom().
	// panel_rom(_swright & SWR_ROM ? 1 : 0);

	// // Is the increment signal being asserted?
	// bool_t inc = actuated(_swright, SWR_INC) ? 1 : 0;

	// // Become insensitive to this switch configuration.
	// _swleft0 = _swleft;
	// _swright0 = _swright;
	// _sr0 = _sr;

	// // Check switches. Act on just one per timer interrupt.
	// if (actuated(_swleft, SWL_RESET|SWL_RUN)) {
	// 	// Start (reset + run)
	// 	panel_start();
	// }

	// else if (actuated(_swleft, SWL_RESET)) {
	// 	// Reset
	// 	panel_reset();
	// }

	// else if (actuated(_swleft, SWL_STOP)) {
	// 	// Stop
	// 	panel_stop();
	// }

	// else if (actuated(_swleft, SWL_RUN)) {
	// 	// Run
	// 	panel_run();
	// }

	// else if (actuated(_swleft, SWL_STEP)) {
	// 	// Step
	// 	panel_step();
	// }

	// else if (actuated(_swleft, SWL_USTEP)) {
	// 	// MicroStep
	// 	panel_ustep();
	// }

	// else if (actuated(_swright, SWR_LDADDR)) {
	// 	// Load address (PC)
	// 	panel_ldaddr();
	// }

	// else if (actuated(_swright, SWR_LDIR)) {
	// 	// Load instruction register
	// 	panel_ldir();
	// }

	// else if (actuated(_swright, SWR_LDAC)) {
	// 	// Load AC
	// 	panel_ldac();
	// }

	// else if (actuated(_swright, SWR_MEMW)) {
	// 	// Memory, write, inc?
	// 	panel_wmem(inc, _pc, _sr);
	// }

	// else if (actuated(_swright, SWR_MEMR)) {
	// 	// Memory, read, inc?
	// 	panel_rmem(inc, _pc);
	// }

	// else if (actuated(_swright, SWR_IOW)) {
	// 	// I/O, write, inc?
	// 	panel_wio(inc, _pc, _sr);
	// }

	// else if (actuated(_swright, SWR_IOR)) {
	// 	// Memory, read, inc?
	// 	panel_rio(inc, _pc);
	// }

	// else if (actuated(_swright, SWR_IFR1)) {
	// 	// Front panel interupt request, level 1
	// 	panel_ifr1();
	// }

	// else if (actuated(_swright, SWR_IFR6)) {
	// 	// Front panel interupt request, level 1
	// 	panel_ifr6();
	// }

}

#endif // 0 (unported code)

#endif	// CFTEMU

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
