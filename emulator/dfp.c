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

#include "cftemu.h"
#include "io.h"
#include "mbu.h"
#include "debug.h"
#include "util.h"
#include "uterm.h"
#include "dfp.h"


int dfp_enabled = 1;
int dfp_pts = 0;

uterm_t * dfp_term = NULL;

uint16_t reg_features;
uint16_t reg_sr = 0xc600;
uint16_t reg_or;
uint16_t reg_dsr;

static int debugfd = -1;
static char * pts;


static void
dfp_out(const char * fmt, ...)
{
	va_list ap;
	char * buf;

	va_start(ap, fmt);
	vasprintf(&buf, fmt, ap);
	va_end(ap);

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
		int oldattr = uterm_setattr(dfp_term, 63);
		uterm_write(dfp_term, buf);
		uterm_setattr(dfp_term, oldattr);
	}

	free(buf);
}


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
	}

	/* Initialise the DEB terminal emulator */
	dfp_term = uterm_new(200);
	uterm_write(dfp_term, "This is a test.\n");
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
}


int 
dfp_write(uint16_t addr, uint16_t dbus)
{
	static word _hword;

	switch(addr){
	case IO_SOR:
		reg_or = dbus;
		return 1;

	case IO_ENEF:
		reg_features |= dbus;
		sanity = (reg_features & FTR_HOB) != 0;
		return 1;

	case IO_DISEF:
		reg_features &= ~dbus;
		sanity = (reg_features & FTR_HOB) != 0;
		return 1;

	case IO_SENTINEL:
		if (reg_features & FTR_HOS) {
			const char *s = map_get(cpu.pc);
			testdebug("SENTINEL EXECUTED AT %04hx (%s) -> %02x:%04x\n",
				  cpu.pc, s, GET_AEXT(mbu_l2p(cpu.pc)), GET_AOFS(mbu_l2p(cpu.pc)));
			cpu.halt = 1;
			return 1;
		} 
		//fail("Output %04x to location %04x: NOT IMPLEMENTED\n", dbus, addr);
		return 1;
		
	case IO_PRINTA:
	{
		const char *s = map_get(dbus);
		if (s == NULL) {
			dfp_out("%hx (?)", dbus);
			testdebug("PRINTA: %hx (?) -> %02x:%04x\n", dbus,
				  GET_AEXT(mbu_l2p(dbus)), GET_AOFS(mbu_l2p(dbus)));
		} else {
			dfp_out("%hx (%s)", dbus, s);
			testdebug("PRINTA: %hx (%s) -> %02x:%04x\n", dbus, s,
				  GET_AEXT(mbu_l2p(dbus)), GET_AOFS(mbu_l2p(dbus)));
		}
		return 1;
	}

	case IO_PRINTC:
		dfp_out("%c", dbus & 0xff);
		if (((dbus & 0xff) > 32) && ((dbus & 0xff) < 127)) {
			testdebug("PRINTC: %c\n", dbus & 0xff);
		} else {
			testdebug("PRINTc: %d\n", dbus & 0xff);
		}
		return 1;

	case IO_PRINTD:
		dfp_out("%hd", dbus);
		testdebug("PRINTD: %hd\n", dbus);
		return 1;

	case IO_PRINTU:
		dfp_out("%04hu", dbus);
		testdebug("PRINTU: %u\n", (uint16_t)dbus);
		return 1;

	case IO_PRINTH:
		dfp_out("%04hx", dbus);
		/* fflush(log_file); */
		testdebug("PRINTH: %04hx\n", dbus);
		return 1;

	case IO_PRINTB:
	{
		char s[17];
		to_bin(cpu.a, s, 16);
		dfp_out("%s", s);
		testdebug("PRINTB: %s\n", s);
		return 1;
	}

	case IO_PRINTSP:
		dfp_out(" ");
		testdebug("PRINTc: 32\n");
		return 1;

	case IO_PRINTNL:
		dfp_out("\n");
		testdebug("PRINTc: 10\n");
		return 1;

	case IO_DEBUGON:
		dfp_out("[debugging trace on]");
		debug_asm = 1;
		debugdebug("Enabling debugging trace\n");
		return 1;

	case IO_DEBUGOFF:
		dfp_out("[debugging trace off]");
		debug_asm = 0;
		debugdebug("Disabling debugging trace\n");
		return 1;

	case IO_DUMP:
		/* fflush(stdout); */
		//dump();
		//dumpmem(0x500, 8);
		//dumpmem(0x204, 20);
		//dumpmem(0x860, 16);
		dumpstack(0x500, 0x91, 0);
		dumpstack(0x600, 0x92, 1);
		printf(COL_NOR);
		return 1;

	case IO_PRINTHI:
		// Store the high word of a 32-bit quanity for later printing.
		_hword = dbus;
		return 1;

	case IO_PRINTLO:
		dfp_out("%hu", (_hword << 16) | dbus);
		testdebug("PRINTL: %08x\n", (_hword << 16) | dbus);
		return 1;

	case IO_HALT:
		cpu.halt = 1;
		printf("\n\n\n");
		dump_state();
		dump_ustate();
		info("*** HALTING ***\n");
		return 1;

	case IO_SUCCESS:
		dfp_out("[ok]");
		testdebug("ASSERT: TRUE\n");
		return 1;

	case IO_FAIL:
		if (1) {
			const char *s = map_get(cpu.pc);
			testdebug("ASSERT: FALSE at %04hx (%s) -> %02x:%04x\n",
				  cpu.pc, s, GET_AEXT(mbu_l2p(cpu.pc)), GET_AOFS(mbu_l2p(cpu.pc)));
			cpu.halt = 1;
			return 1;
		}
	}
	
	return 0;
}


int
dfp_read(uint16_t addr, uint16_t *dbus)
{
	switch(addr){
	case IO_LSR:
		*dbus = reg_sr;
		return 1;

	case IO_LDSR:
		*dbus = reg_dsr;
		return 1;

	case IO_QEF:
		*dbus = QEF_BASE;	// The base set of permanent features
		if (reg_features & FTR_HOS) *dbus |= QEF_HOS;
		// TODO: add remaining features here
		return 1;
	}

	return 0;
}


/* End of file. */
