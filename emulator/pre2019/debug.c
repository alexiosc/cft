/* 
   
debug.c - Emulate a theoretical in-circuit debugging/testing board.

Copyright (C) 2012 Alexios Chouchoulas

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


int debugger = 1;
int deb_pts = 0;

uterm_t * deb_term = NULL;


static int debugfd = -1;
static char * pts;


static void
debug_out(const char * fmt, ...)
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
	if (deb_term) {
		int oldattr = uterm_setattr(deb_term, 63);
		uterm_write(deb_term, buf);
		uterm_setattr(deb_term, oldattr);
	}

	free(buf);
}


void
debug_init()
{
	if (deb_pts) {
		debugfd = open("/dev/ptmx", O_RDWR | O_NOCTTY);
		if (debugfd < 0) {
			fail("Failed to allocate pseudo-tty: %s", strerror(errno));
		}
		char * name = ptsname(debugfd);
		if (name == NULL) {
			fail("Failed to get pseudo-tty name: %s", strerror(errno));
		}
		pts = strdup(name);
		info("DEB card is also available as %s\n", pts);
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
	deb_term = uterm_new(200);
}


void
debug_done() 
{
	if (debugfd >= 0) {
		if (close(debugfd)) {
			fail("Failed to close pseudo-tty %s: %s", pts, strerror(errno));
		}
	}

	if (deb_term) uterm_destroy(deb_term);
}


void
debug_tick(int tick) 
{
}


int * feature_vars[] = {
	&sanity,		/* 0x0001 */
	&sentinel,		/* 0x0002 */
	&debug_asm,		/* 0x0004 */
	&debug_microcode,	/* 0x0008 */
	&testing,		/* 0x0010 */
	NULL
};


int 
debug_write(uint16_t addr, uint16_t dbus)
{
	static word _hword;
	int i;

	switch(addr){
	case IO_ENEF:
	case IO_DISEF:
		for (i = 0; feature_vars[i] != NULL; i++) {
			if (dbus & (1 << i)) {
				*feature_vars[i] = (addr == IO_ENEF);
			}
		}
		return 1;

	case IO_SENTINEL:
		if (sentinel) {
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
			debug_out("%hx (?)", dbus);
			testdebug("PRINTA: %hx (?) -> %02x:%04x\n", dbus,
				  GET_AEXT(mbu_l2p(dbus)), GET_AOFS(mbu_l2p(dbus)));
		} else {
			debug_out("%hx (%s)", dbus, s);
			testdebug("PRINTA: %hx (%s) -> %02x:%04x\n", dbus, s,
				  GET_AEXT(mbu_l2p(dbus)), GET_AOFS(mbu_l2p(dbus)));
		}
		return 1;
	}

	case IO_PRINTC:
		debug_out("%c", dbus & 0xff);
		if (((dbus & 0xff) > 32) && ((dbus & 0xff) < 127)) {
			testdebug("PRINTC: %c\n", dbus & 0xff);
		} else {
			testdebug("PRINTc: %d\n", dbus & 0xff);
		}
		return 1;

	case IO_PRINTD:
		debug_out("%hd", dbus);
		testdebug("PRINTD: %hd\n", dbus);
		return 1;

	case IO_PRINTU:
		debug_out("%04hu", dbus);
		testdebug("PRINTU: %u\n", (uint16_t)dbus);
		return 1;

	case IO_PRINTH:
		debug_out("%04hx", dbus);
		/* fflush(log_file); */
		testdebug("PRINTH: %04hx\n", dbus);
		return 1;

	case IO_PRINTB:
	{
		char s[17];
		to_bin(cpu.a, s, 16);
		debug_out("%s", s);
		testdebug("PRINTB: %s\n", s);
		return 1;
	}

	case IO_PRINTSP:
		debug_out(" ");
		testdebug("PRINTc: 32\n");
		return 1;

	case IO_PRINTNL:
		debug_out("\n");
		testdebug("PRINTc: 10\n");
		return 1;

	case IO_DEBUGON:
		debug_out("[debugging trace on]");
		debug_asm = 1;
		debugdebug("Enabling debugging trace\n");
		return 1;

	case IO_DEBUGOFF:
		debug_out("[debugging trace off]");
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
		debug_out("%hu", (_hword << 16) | dbus);
		testdebug("PRINTL: %08x\n", (_hword << 16) | dbus);
		return 1;

		// TODO: Make this work if it doesn't already.
	case IO_DEB_HALT:
		cpu.halt = 1;
		printf("\n\n\n");
		dump_state();
		dump_ustate();
		info("*** HALTING ***\n");
		return 1;

	case IO_SUCCESS:
		debug_out("[ok]");
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
debug_read(uint16_t addr, uint16_t *dbus)
{
	int i;

	switch(addr){
	case IO_QEF:
		*dbus = 0x8000;	/* This signifies we're running on the emulator */
		for (i = 0; feature_vars[i] != NULL; i++) {
			if (*feature_vars[i]) *dbus |= (1 << i);
		}
		return 1;
	}

	return 0;
}


/* End of file. */
