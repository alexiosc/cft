/* 
   
dfp.c - Emulate the Debugging Front Panel subsystem

Copyright (C) 2014 Alexios Chouchoulas

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software Foundation,
Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  

*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <time.h> 
#include <stdarg.h>
#include <sys/types.h>
#include <pthread.h>

#include "cftemu.h"
#include "io.h"
#include "mbu.h"
#include "debug.h"
#include "util.h"
#include "uterm.h"
#include "dfp.h"
#include "ui_panel.h"

#include "../front-panel/lib/iface.h"
#include "../front-panel/lib/switches.h"

int dfp_enabled = 1;
int dfp_pts = 0;

uterm_t * dfp_term = NULL;

uint16_t reg_features;
uint16_t reg_sr = 0xc600;
uint16_t reg_or;
uint16_t reg_dsr;
uint16_t reg_icr;

uint16_t reg_swleft;
uint16_t reg_swright = SWR_ROM;

static int debugfd = -1;
static char * pts;

// These come from the DFP firmware for a more exact simulation.
#define RBSIZE_BITS 4
#define RBMASK ((1 << RBSIZE_BITS) - 1)
static struct {
	uint8_t ip, op;
	uint8_t b[(1 << RBSIZE_BITS)];
} ringbuf;


void
dfp_queue_char(uint8_t c)
{
	//printf("DFP RB %d %d\n", ringbuf.ip, ringbuf.op);
	dfp_fw_rx(c);

	// This is probably not needed with the firmware library in
	// place. We let the DFP firmware handle input.
#if 0
	// Bail out if the buffer is full
	uint8_t new_ip = (ringbuf.ip + 1) & RBMASK;
	if (new_ip == ringbuf.op) return;
	ringbuf.b[ringbuf.ip] = c;
	ringbuf.ip = new_ip;

	//printf("DFP RB %d %d\n", ringbuf.ip, ringbuf.op);
	if (reg_icr & ICR_TTY) interrupt(6);
#endif
}


void
dfp_sr_changed(uint16_t sr)
{
	// The DFP gets the SR via a pointer, so no need to do anything with
	// the sr argument here.
	dfp_cb.changed_sr++;
}


static uint16_t
dfp_maybe_dequeue_char()
{
	// Is it empty?
	if (ringbuf.ip == ringbuf.op) return 0x8000;
	uint8_t retval = ringbuf.b[ringbuf.op];
	ringbuf.op = (ringbuf.op + 1) & RBMASK;
	return retval;
}


static void
dfp_out(const char * fmt, ...)
{
	va_list ap;
	char * buf;

	va_start(ap, fmt);
	int result = vasprintf(&buf, fmt, ap);
	va_end(ap);

	if (result == 0) return;

	int len = strlen(buf);
	if (fwrite(buf, len, 1, log_file) != 1) {
		warning("Unable to write to DEB card log file %s: %s\n",
			log_name, strerror(errno));
	}
	if (debugfd >= 0 && write(debugfd, buf, len) != len) {
		warning("Unable to write to DEB card pseudo-TTY %s: %s\n",
			pts, strerror(errno));
	}
	if (dfp_term) {
		//int oldattr = uterm_setattr(dfp_term, 63);
		uterm_write(dfp_term, buf);
		//uterm_setattr(dfp_term, oldattr);
	}

	free(buf);
}


void dfp_firmware_init(); // Forward definition

void
dfp_init()
{
	if (dfp_pts) {
		debugfd = open("/dev/ptmx", O_RDWR | O_NOCTTY);
		if (debugfd < 0) {
			fail("Failed to allocate pseudo-tty: %s", strerror(errno));
		}
		char * name = ptsname(debugfd);
		if (name == NULL) {
			fail("Failed to get pseudo-tty name: %s", strerror(errno));
		}
		pts = strdup(name);
		info("DFP card is also available as %s\n", pts);
		if (grantpt(debugfd)) {
			fail("Failed to set pseudo-tty owner/mode for %s: %s", pts, strerror(errno));
		}
		if (grantpt(debugfd)) {
			fail("Failed to set pseudo-tty owner/mode for %s: %s", pts, strerror(errno));
		}
		if (unlockpt(debugfd)) {
			fail("Failed to unlock pseudo-tty %s: %s", pts, strerror(errno));
		}

		int fd = open("dfp_pts", O_WRONLY | O_CREAT, 0644);
		if (fd < 0) {
			fail("Failed to create dfp_pts: %s", strerror(errno));
		}
		if (write(fd, name, strlen(name)) < 0) {
			fail("Writing to dfp_pts: %s", strerror(errno));
		}
		close(fd);
	}

	/* Initialise the DEB terminal emulator */
	dfp_term = uterm_new(200);
	//uterm_write(dfp_term, "This is a test.\n");

	// Set up the console ring buffer
	ringbuf.ip = ringbuf.op = 0;

	dfp_firmware_init();
}


void
dfp_done() 
{
	if (debugfd >= 0) {
		if (close(debugfd)) {
			fail("Failed to close pseudo-tty %s: %s", pts, strerror(errno));
		}
	}

	if (dfp_term) uterm_destroy(dfp_term);
}


void
dfp_tick(int tick) 
{
	if (!dfp_enabled) return;

	// Process commands from the DFP.

	// Reset requests?
	if (dfp_cb.request_reset) {
		void reset_system();
		dfp_cb.request_reset = 0;
		pthread_mutex_unlock(&dfp_cb.lock);
		reset_system();
	}

	// if (dfp_cb.request_halt) {
	// 	dfp_cb.request_halt = 0;
	// 	cpu.halt = 1;
	// 	printf("\n\n\n");
	// 	dump_state();
	// 	dump_ustate();
	// 	info("*** HALTING ***\n");
	// }

	// if (dfp_cb.request_run) {
	// 	dfp_cb.request_run = 0;
	// 	cpu.halt = 0;
	// 	info("*** RUNNING ***\n");
	// }

	// Process coommands etc. to the DFP.

	// The SR has changed.
	if (dfp_cb.sr != NULL && dfp_cb.changed_sr) {
		dfp_cb.changed_sr = 0;
		pthread_mutex_lock(&dfp_cb.lock);
		dfp_fw_sr(*(dfp_cb.sr));
		pthread_mutex_unlock(&dfp_cb.lock);
	}
}


int 
dfp_write(uint16_t addr, uint16_t dbus)
{
	if ((addr & IO_DFP_MASK) == IO_DFP_BASE) {
		//pthread_mutex_lock(&dfp_cb.lock);
		dfp_fw_iocmd(1);
		//pthread_mutex_unlock(&dfp_cb.lock);

		// We also snoop some of these instructions because they modify
		// *emulator* (not DFP) state.
		switch(addr){
		case IO_ENEF:
			reg_features |= dbus;
			sanity = (reg_features & FTR_HOB) != 0;
			return 1;
			
		case IO_DISEF:
			reg_features &= ~dbus;
			sanity = (reg_features & FTR_HOB) != 0;
			return 1;

		// case IO_SENTINEL:
		// 	if (reg_features & FTR_HOS) {
		// 		const char *s = map_get(cpu.pc);
		// 		testdebug("SENTINEL EXECUTED AT %04hx (%s) -> %02x:%04x\n",
		// 			  cpu.pc, s, GET_AEXT(mbu_l2p(cpu.pc)), GET_AOFS(mbu_l2p(cpu.pc)));
		// 		cpu.halt = 1;
		// 		return 1;
		// 	} 
		// 	//fail("Output %04x to location %04x: NOT IMPLEMENTED\n", dbus, addr);
		// 	return 1;
		}
			
		return 1;
	}
	return 0;

	// static word _hword;

	// switch(addr){
	// case IO_SOR:
	// 	reg_or = dbus;
	// 	return 1;

	// case IO_ENEF:
	// 	reg_features |= dbus;
	// 	sanity = (reg_features & FTR_HOB) != 0;
	// 	return 1;

	// case IO_DISEF:
	// 	reg_features &= ~dbus;
	// 	sanity = (reg_features & FTR_HOB) != 0;
	// 	return 1;

	// case IO_DFP_ICR:
	// 	reg_icr = dbus & 0xffff;
	// 	return 1;

	// case IO_SENTINEL:
	// 	if (reg_features & FTR_HOS) {
	// 		const char *s = map_get(cpu.pc);
	// 		testdebug("SENTINEL EXECUTED AT %04hx (%s) -> %02x:%04x\n",
	// 			  cpu.pc, s, GET_AEXT(mbu_l2p(cpu.pc)), GET_AOFS(mbu_l2p(cpu.pc)));
	// 		cpu.halt = 1;
	// 		return 1;
	// 	} 
	// 	//fail("Output %04x to location %04x: NOT IMPLEMENTED\n", dbus, addr);
	// 	return 1;
		
	// case IO_PRINTA:
	// {
	// 	const char *s = map_get(dbus);
	// 	if (s == NULL) {
	// 		dfp_out("%04hx (?)", dbus);
	// 		testdebug("PRINTA: %hx (?) -> %02x:%04x\n", dbus,
	// 			  GET_AEXT(mbu_l2p(dbus)), GET_AOFS(mbu_l2p(dbus)));
	// 	} else {
	// 		dfp_out("%04hx (%s)", dbus, s);
	// 		testdebug("PRINTA: %hx (%s) -> %02x:%04x\n", dbus, s,
	// 			  GET_AEXT(mbu_l2p(dbus)), GET_AOFS(mbu_l2p(dbus)));
	// 	}
	// 	return 1;
	// }

	// case IO_PRINTC:
	// 	dfp_out("%c", dbus & 0xff);
	// 	if (((dbus & 0xff) > 32) && ((dbus & 0xff) < 127)) {
	// 		testdebug("PRINTC: %c\n", dbus & 0xff);
	// 	} else {
	// 		testdebug("PRINTc: %d\n", dbus & 0xff);
	// 	}
	// 	return 1;

	// case IO_PRINTD:
	// 	dfp_out("%hd", dbus);
	// 	testdebug("PRINTD: %hd\n", dbus);
	// 	return 1;

	// case IO_PRINTU:
	// 	dfp_out("%04hu", dbus);
	// 	testdebug("PRINTU: %u\n", (uint16_t)dbus);
	// 	return 1;

	// case IO_PRINTH:
	// 	dfp_out("%04hx", dbus);
	// 	/* fflush(log_file); */
	// 	testdebug("PRINTH: %04hx\n", dbus);
	// 	return 1;

	// case IO_PRINTB:
	// {
	// 	char s[17];
	// 	to_bin(cpu.a, s, 16);
	// 	dfp_out("%s", s);
	// 	testdebug("PRINTB: %s\n", s);
	// 	return 1;
	// }

	// case IO_PRINTSP:
	// 	dfp_out(" ");
	// 	testdebug("PRINTc: 32\n");
	// 	return 1;

	// case IO_PRINTNL:
	// 	dfp_out("\n");
	// 	testdebug("PRINTc: 10\n");
	// 	return 1;

	// case IO_DEBUGON:
	// 	dfp_out("[debugging trace on]");
	// 	debug_asm = 1;
	// 	debugdebug("Enabling debugging trace\n");
	// 	return 1;

	// case IO_DEBUGOFF:
	// 	dfp_out("[debugging trace off]");
	// 	debug_asm = 0;
	// 	debugdebug("Disabling debugging trace\n");
	// 	return 1;

	// case IO_DUMP:
	// 	/* fflush(stdout); */
	// 	//dump();
	// 	//dumpmem(0x500, 8);
	// 	//dumpmem(0x204, 20);
	// 	//dumpmem(0x860, 16);
	// 	dumpstack(0x500, 0x91, 0);
	// 	dumpstack(0x600, 0x92, 1);
	// 	printf(COL_NOR);
	// 	return 1;

	// case IO_PRINTHI:
	// 	// Store the high word of a 32-bit quanity for later printing.
	// 	_hword = dbus;
	// 	return 1;

	// case IO_PRINTLO:
	// 	dfp_out("%d", (_hword << 16) | dbus);
	// 	testdebug("PRINTL: %hu\n", (_hword << 16) | dbus);
	// 	return 1;

	// case IO_HALT:
	// 	cpu.halt = 1;
	// 	printf("\n\n\n");
	// 	dump_state();
	// 	dump_ustate();
	// 	info("*** HALTING ***\n");
	// 	return 1;

	// case IO_SUCCESS:
	// 	dfp_out("[ok]");
	// 	testdebug("ASSERT: TRUE\n");
	// 	return 1;

	// case IO_FAIL:
	// 	if (1) {
	// 		const char *s = map_get(cpu.pc);
	// 		testdebug("ASSERT: FALSE at %04hx (%s) -> %02x:%04x\n",
	// 			  cpu.pc, s, GET_AEXT(mbu_l2p(cpu.pc)), GET_AOFS(mbu_l2p(cpu.pc)));
	// 		cpu.halt = 1;
	// 		return 1;
	// 	}
	// }
	
	// return 0;
}


int
dfp_read(uint16_t addr, uint16_t *dbus)
{
	if ((addr & IO_DFP_MASK) == IO_DFP_BASE) {
		//pthread_mutex_lock(&dfp_cb.lock);
		printf("*** IN\n");
		dfp_fw_iocmd(0);
		//pthread_mutex_unlock(&dfp_cb.lock);

		return 1;
	}
	return 0;


// 	switch(addr){
// 	case IO_LSR:
// 		*dbus = reg_sr;
// 		return 1;

// 	case IO_LDSR:
// 		*dbus = reg_dsr;
// 		return 1;

// 	case IO_DFP_ISR:
// 		*dbus = 0;
// 		if (ringbuf.op != ringbuf.ip) *dbus |= ISR_TTY;

// 		// This is from the DFP source
// #if 0
// 		// Interrupts asserted
// 		if ((_cb[0] & CB0_NIRQ1) == 0) _db |= ISR_IRQ6;
// 		if ((_cb[0] & CB0_NIRQ6) == 0) _db |= ISR_IRQ1;
// 		// Interrupt sources
// 		if (ifr6_operated) _db |= ISR_IFR6;
// 		////if (ringbuf.op != ringbuf.ip) _db |= ISR_TTY;
		
// 		defer_cb_write(); // Clear both IRQ1 and IRQ6 together.
// 		set_irq1(0);
// 		set_irq6(0, 0);
// 		ifr6_operated = 0;
// #endif
// 		return 1;
// 	case IO_QEF:
// 		*dbus = QEF_BASE;	// The base set of permanent features
// 		if (reg_features & FTR_HOS) *dbus |= QEF_HOS;
// 		// TODO: add remaining features here
// 		return 1;

// 	case IO_READC:
// 		*dbus = dfp_maybe_dequeue_char();
// 		return 1;
// 	}

	return 0;
}


///////////////////////////////////////////////////////////////////////////////
//
// INTERFACE TO THE FIRMWARE SHARED OBJECT
//
///////////////////////////////////////////////////////////////////////////////

pthread_t thread_fw;

// Forward definitions for callbacks
void dfp_cb_putc(unsigned char);

void dfp_firmware_init()
{
	word unit_mem(int r, int w);
	word unit_io(int r, int w);
	void perform_reset();

	// Initialise the DFP firmware
	dfp_cb.putc = dfp_cb_putc;
	dfp_cb.unit_mem = unit_mem;
	dfp_cb.unit_io = unit_io;

	dfp_cb.request_reset = 0;

	dfp_cb.ir = &cpu.ir;
	dfp_cb.pc = &cpu.pc;
	dfp_cb.ac = &cpu.a;

	dfp_cb.l = &cpu.l;	// The flags
	dfp_cb.i = &cpu.i;
	dfp_cb.v = &cpu.v;
	dfp_cb.n = &cpu.n;
	dfp_cb.z = &cpu.z;

	dfp_cb.ab = &cpu.ar;	// The ABUS is the same as the AR
	dfp_cb.db = &cpu.dbus;
	dfp_cb.swright = &reg_swright;
	dfp_cb.swleft = &reg_swleft;
	dfp_cb.sr = &pd.sr;

	dfp_cb.uvec = &cpu.control;

	pthread_mutex_init(&dfp_cb.lock, NULL);
	pthread_mutex_init(&dfp_cb.rx_lock, NULL);
	pthread_mutex_init(&dfp_cb.tx_lock, NULL);

	// Initialise the firmare thread.
	void * dfp_firmware_run(void*);
	int res = pthread_create(&thread_fw, NULL, dfp_firmware_run, NULL);
	
	if (res) {
		fail("Failed to create firmware thread: %s", strerror(errno));
	}

}

void *
dfp_firmware_run(void * arg)
{
	info("DFP Firmware thread started.\n");
	dfp_fw_init();		// Call the shared object init

	dfp_fw_run();
	
	info("DFP Firmware thread ended.\n");
	return NULL;
}

void
dfp_cb_putc(unsigned char c)
{
	// There are occasional concurrency issues when printing out. Symptom:
	// the newline character is sent *after* the firmware responds to a
	// command, splitting the response in two.
	pthread_mutex_lock(&dfp_cb.tx_lock);
	dfp_out("%c", c);
	pthread_mutex_unlock(&dfp_cb.tx_lock);
}





/* End of file. */
