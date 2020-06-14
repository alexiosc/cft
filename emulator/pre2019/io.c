/* 

io.c - I/O devices, central hub

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
#include "irc.h"
#include "nvram.h"
#include "duart.h"
#include "ide.h"
#include "dfp.h"
//#include "panel.h"			// Obsoleted by dfp.h
#include "video.h"
#include "psg.h"
//#include "debug.h"			// Obsoleted by dfp.h
#include "util.h"
#include "ui.h"



iodev_t iodevs[] = {
	{
		.name = "Memory Banking Unit",
		.code = "MBU",
		.flag = &mbu,
		.init = mbu_init,
		.reset = mbu_reset,
		.done = mbu_done,
		.read = mbu_read,
		.write = mbu_write
	},
	
	{
		.name = "Interrupt Controller",
		.code = "IRC",
		.flag = &have_irc,
		.init = irc_init,
		.reset = irc_reset,
		.done = irc_done,
		.read = irc_read,
		.write = irc_write,
		.tick = irc_tick
	},
	
        // PFP obsoleted in favour of DFP
	// {
	// 	.name = "Front Panel",
	// 	.code = "PFP",
	// 	.flag = &panel,
	// 	.init = panel_init,
	// 	//.reset = panel_reset,
	// 	.done = panel_done,
	// 	.tick = panel_tick,
	// 	.read = panel_read,
	// 	.write = panel_write
	// },


	{
		.name = "Debugging Front Panel",
		.code = "DFP",
		.flag = &dfp_enabled,
		.init = dfp_init,
		//.reset = dfp_reset,
		.done = dfp_done,
		// The DFP ticks independently
		//.tick = dfp_tick,
		.read = dfp_read,
		.write = dfp_write
	},
	
	{
		.name = "Dual/Quad Serial Card",
		.code = "TTY",
		.flag = &duart,
		.init = duart_init,
		//.reset = duart_reset,
		.done = duart_done,
		.tick = duart_tick,
		.read = duart_read,
		.write = duart_write
	},
	
	{
		.name = "Non-Volatile RAM",
		.code = "NVR",
		.flag = &nvram,
		.init = nvram_init,
		//.reset = nvram_reset,
		.done = nvram_done,
		.tick = nvram_tick,
		.read = nvram_read,
		.write = nvram_write
	},
	
	{
		.name = "IDE Hard Disk Interface",
		.code = "IDE",
		.flag = &ide,
		.init = ide_init,
		//.reset = ide_reset,
		.done = ide_done,
		.tick = ide_tick,
		.read = ide_read,
		.write = ide_write
	},

	{
		.name = "Video Display Unit and Keyboard",
		.code = "VDU",
		.flag = &video,
		.init = video_init,
		.reset = video_reset,
		.done = video_done,
		.tick = video_tick,
		.read = video_read,
		.write = video_write
	},
	
	{
		.name = "Audio Card",
		.code = "PSG",
		.flag = &have_psg,
		.init = psg_init,
		.reset = psg_reset,
		.done = psg_done,
		.tick = psg_tick,
		.read = psg_read,
		.write = psg_write

	},

        // The DEB board has been obsoleted by the DFP
	// {
	// 	.name = "Debug",
	// 	.code = "DEB",
	// 	.flag = &debugger,
	// 	.init = debug_init,
	// 	//.reset = debug_reset,
	// 	.done = debug_done,
	// 	.tick = debug_tick,
	// 	.read = debug_read,
	// 	.write = debug_write
	// },
	
	{
		.name = NULL,
	}
};


///////////////////////////////////////////////////////////////////////////////
//
// IRQS
//
///////////////////////////////////////////////////////////////////////////////

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

	iodev_t * io;
	for (io = iodevs; io->name != NULL; io++){
		//printf("*** %s: init() (%p, %d)\n", io->name, io->flag, *io->flag);
		/* Is the device enabled? */
		if (io->flag != NULL && *(io->flag) == 0) continue;
		/* Is there an initialiser? */
		if (io->init) {
			(*io->init)();
		}
	}
	/* if (mbu) mbu_init(); */
	/* if (nvram) nvram_init(); */
	/* if (duart) duart_init(); */
	/* if (ide) ide_init(); */
	/* if (debugger) debug_init(); */
	/* if (panel) panel_init(); */
	/* if (video) video_init(); */
}


void
io_reset()
{
	iodev_t * io;
	for (io = iodevs; io->name != NULL; io++){
		/* Is the device enabled? */
		if (io->flag != NULL && *(io->flag) == 0) continue;
		/* Is there a reset handler? */
		if (io->reset) (*io->reset)();
	}
}


void
io_done()
{
	iodev_t * io;
	for (io = iodevs; io->name != NULL; io++){
		/* Is the device enabled? */
		if (io->flag != NULL && *(io->flag) == 0) continue;
		/* Is there an destructor? */
		if (io->done) (*io->done)();
	}

	/* Write the NVRAM to disk */
	/* if (nvram) nvram_done(); */
	/* if (video) video_done(); */
}


/* This is called once per clock tick to handle I/O and other
 * background tasks. */
void
io_tick()
{
	static int delay = 0;

	delay = (delay + 1) & 0x3ff; /* Check I/O every 1024 clock ticks */
	if (delay) return;

	iodev_t * io;
	for (io = iodevs; io->name != NULL; io++){
		/* Is the device enabled? */
		if (io->flag != NULL && *(io->flag) == 0) continue;
		/* Is there an tick handler? */
		if (io->tick) (*io->tick)(delay);
	}

	/* duart_tick(delay); */
	/* nvram_tick(delay); */
	/* ide_tick(delay); */
	/* panel_tick(delay); */
	/* debug_tick(delay); */
	/* video_tick(delay); */
	
	ui_tick();

	/* static time_t t0 = 0; */
	/* time_t t = time(NULL); */
	/* if ((t - t0) > 2) { */
	/* 	if (t0) { */
	/* 		cpu.irq = 0; */
	/* 		info("TICK %d!\n", t % 3600); */
	/* 	} */
	/* 	t0 = t; */
	/* } */
}



word
unit_io(int r, int w)
{
	word addr = cpu.ar; /*  & 0x3ff; */
	word dbus = cpu.dbus;
	word retval;
	iodev_t * io;

	if(r) {
		for (io = iodevs; io->name != NULL; io++){
			/* Is the device enabled? */
			if (io->flag != NULL && *(io->flag) == 0) continue;
			/* Is there an read handler? If so, attempt to read. */
			if (io->read && (*io->read)(addr, &retval)) {
				io->hits = 2000;
				iodebug("IN (%s) io[%04x] = %04x\n", io->code, addr, dbus);
				return retval;
			}
		}

		/* if (mbu && mbu_read(addr, &retval)) return retval; */
		/* if (nvram && nvram_read(addr, &retval)) return retval; */
		/* if (duart && duart_read(addr, &retval)) return retval; */
		/* if (ide && ide_read(addr, &retval)) return retval; */
		/* if (debugger && debug_read(addr, &retval)) return retval; */
		/* if (panel && panel_read(addr, &retval)) return retval; */
		/* if (video && video_read(addr, &retval)) return retval; */

		// Unknown IO device.
		sanity_check(1, "Input from location %04x: NOT IMPLEMENTED\n", addr);
		return 0;

	} else if(w) {
		
		for (io = iodevs; io->name != NULL; io++){
			/* Is the device enabled? */
			if (io->flag != NULL && *(io->flag) == 0) continue;
			/* Is there an write handler? If so, attempt to read. */
			if (io->write && (*io->write)(addr, dbus)) {
				io->hits = 2000;
				iodebug("OUT (%s) io[%04x] <- %04x\n", io->code, addr, dbus);
				return dbus;
			}
		}

		/* if (mbu && mbu_write(addr, dbus)) return dbus; */
		/* if (nvram && nvram_write(addr, dbus)) return dbus; */
		/* if (duart && duart_write(addr, dbus)) return dbus; */
		/* if (ide && ide_write(addr, dbus)) return dbus; */
		/* if (debugger && debug_write(addr, dbus)) return dbus; */
		/* if (panel && panel_write(addr, dbus)) return dbus; */
		/* if (video && video_write(addr, dbus)) return dbus; */

		// Unknown IO device.
		sanity_check(1, "Output %04x to location %04x: NOT IMPLEMENTED\n", dbus, addr);
		return 0;
	}

	fail("Sanity check failed, unit_io() called with r==w==0.\n");
}

/* End of file */
