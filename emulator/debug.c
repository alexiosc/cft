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
#include <string.h>
#include <time.h> 
#include <sys/types.h>

#include "cftemu.h"
#include "io.h"
#include "debug.h"
#include "util.h"


void
debug_init()
{
}


void
debug_done() 
{
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
				  cpu.pc, s, GET_AEXT(l2p(cpu.pc)), GET_AOFS(l2p(cpu.pc)));
			cpu.halt = 1;
			return 1;
		} 
		//fail("Output %04x to location %04x: NOT IMPLEMENTED\n", dbus, addr);
		return 1;
		
	case IO_PRINTA:
	{
		const char *s = map_get(dbus);
		if (s == NULL) {
			fprintf(log_file, "%hx (?)", dbus);
			testdebug("PRINTA: %hx (?) -> %02x:%04x\n", dbus,
				  GET_AEXT(l2p(dbus)), GET_AOFS(l2p(dbus)));
		} else {
			fprintf(log_file, "%hx (%s)", dbus, s);
			testdebug("PRINTA: %hx (%s) -> %02x:%04x\n", dbus, s,
				  GET_AEXT(l2p(dbus)), GET_AOFS(l2p(dbus)));
		}
		return 1;
	}

	case IO_PRINTC:
		fprintf(log_file, "%c", dbus & 0xff);
		if (((dbus & 0xff) > 32) && ((dbus & 0xff) < 127)) {
			testdebug("PRINTC: %c\n", dbus & 0xff);
		} else {
			testdebug("PRINTc: %d\n", dbus & 0xff);
		}
		return 1;

	case IO_PRINTD:
		fprintf(log_file, "%hd", dbus);
		testdebug("PRINTD: %hd\n", dbus);
		return 1;

	case IO_PRINTU:
		fprintf(log_file, "%04hu", dbus);
		testdebug("PRINTU: %u\n", (uint16_t)dbus);
		return 1;

	case IO_PRINTH:
		fprintf(log_file, "%04hx", dbus);
		/* fflush(log_file); */
		testdebug("PRINTH: %04hx\n", dbus);
		return 1;

	case IO_PRINTB:
	{
		char s[17];
		to_bin(cpu.a, s, 16);
		fprintf(log_file, "%s", s);
		testdebug("PRINTB: %s\n", s);
		return 1;
	}

	case IO_PRINTSP:
		fprintf(log_file, " ");
		testdebug("PRINTc: 32\n");
		return 1;

	case IO_PRINTNL:
		fprintf(log_file, "\n");
		testdebug("PRINTc: 10\n");
		return 1;

	case IO_DEBUGON:
		debug_asm = 1;
		debugdebug("Enabling debugging trace\n");
		return 1;

	case IO_DEBUGOFF:
		debug_asm = 0;
		debugdebug("Disabling debugging trace\n");
		return 1;

	case IO_DUMP:
		/* fflush(stdout); */
		//dump();
		//dumpmem(0x500, 8);
		//dumpmem(0x204, 20);
		//dumpmem(0x860, 16);
		dumpstack(0x400, 0);
		dumpstack(0x500, 1);
		printf(COL_NOR);
		return 1;

	case IO_PRINTHI:
		// Store the high word of a 32-bit quanity for later printing.
		_hword = dbus;
		return 1;

	case IO_PRINTLO:
		fprintf(log_file, "%hu", (_hword << 16) | dbus);
		testdebug("PRINTL: %08x\n", (_hword << 16) | dbus);
		return 1;

	case IO_SUCCESS:
		testdebug("ASSERT: TRUE\n");
		return 1;

	case IO_FAIL:
		testdebug("ASSERT: FALSE\n");
		cpu.halt = 1;
		return 1;
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
