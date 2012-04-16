/* 

emulator.c - Main emulator code

Copyright (C) 2011 Alexios Chouchoulas

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
#include <stdint.h>
#include <unistd.h>
#include <assert.h>
#include <termios.h>
#include <errno.h>
#include <time.h>
#include <sys/types.h>
#include <sys/time.h>

#include "cftemu.h"
#include "io.h"
#include "mbu.h"
#include "nvram.h"
#include "duart.h"
#include "ide.h"
#include "panel.h"
#include "debug.h"



///////////////////////////////////////////////////////////////////////////////
//
// IRQS
//
/////////////////////////////////////////////////////////////////////////////// *

inline void
irq()
{
	if (cpu.i) {
		//info("***IRQ (masked, PC=%04x, INT RET ADDR=%04x)***\n", cpu.pc, cpu.mem[2]);
		//dump();
	} else {
		//info("***IRQ***\n");
		cpu.irq = 0;
	}
}


/* 
 * This is called to initialise the I/O subsystem.
 */

void
io_init()
{
	if (mbu) mbu_init();
	if (nvram) nvram_init();
	if (duart) duart_init();
	if (ide) ide_init();
	if (debugger) debug_init();
	if (panel) panel_init();
}


void
io_done()
{
	/* Write the NVRAM to disk */
	if (nvram) nvram_done();
}

/* This is called once per clock tick to handle I/O and other
 * background tasks. */
void
io_tick()
{
	static int delay = 0;

	delay = (delay + 1) & 0x3ff; /* Check I/O every 1024 clock ticks */
	if (delay) return;

	duart_tick(delay);
	nvram_tick(delay);
	ide_tick(delay);
	panel_tick(delay);
	debug_tick(delay);

#if 0
	static time_t t0 = 0;
	time_t t = time(NULL);
	if ((t - t0) > 2) {
		if (t0) {
			cpu.irq = 0;
			info("TICK %d!\n", t % 3600);
		}
		t0 = t;
	}
#endif

}



word
unit_io(int r, int w)
{
	char c;
	word addr = cpu.ar & 0x3ff;
	word dbus = cpu.dbus;
	word retval;

	if(r) {
		
		if (mbu && mbu_read(addr, &retval)) return retval;
		if (nvram && nvram_read(addr, &retval)) return retval;
		if (duart && duart_read(addr, &retval)) return retval;
		if (ide && ide_read(addr, &retval)) return retval;
		if (debugger && debug_read(addr, &retval)) return retval;
		if (panel && panel_read(addr, &retval)) return retval;
		
		// Unknown IO device.
		if (sanity) {
			fail("Input from location %04x: NOT IMPLEMENTED\n", addr);
		} else return;

	} else if(w) {
		
		if (mbu && mbu_write(addr, dbus)) return dbus;
		if (nvram && nvram_write(addr, dbus)) return dbus;
		if (duart && duart_write(addr, dbus)) return dbus;
		if (ide && ide_write(addr, dbus)) return dbus;
		if (debugger && debug_write(addr, dbus)) return dbus;
		if (panel && panel_write(addr, dbus)) return dbus;

		// Unknown IO device.
		if (sanity) {
			fail("Output %04x to location %04x: NOT IMPLEMENTED\n", dbus, addr);
		} else return;
	}

	fail("Sanity check failed, unit_io() called with r==w==0.\n");
}

/* End of file */
