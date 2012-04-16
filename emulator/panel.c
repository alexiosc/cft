/* 
   
panel.c - Emulates the front panel controller board.

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
#include "panel.h"
#include "util.h"


void
panel_init()
{
}


void
panel_done() 
{
}


void
panel_tick(int tick) 
{
}


static uint32_t tickref = 0;


int 
panel_write(uint16_t addr, uint16_t dbus)
{
	switch(addr){
	case IO_CLOCK_HALT:
		cpu.halt = 1;
		printf("\n\n\n");
		dump_state();
		dump_ustate();
		info("*** HALTING ***\n");
		return 1;
		
	case IO_PANEL_LIGHTS:
		// We don't have panel lights yet.
		return 1;
		
	case IO_TICKS_HI:
	case IO_TICKS_LO:
		tickref = cpu.tick;
		return 1;
	}

	return 0;
}


int
panel_read(uint16_t addr, uint16_t *dbus)
{
	switch(addr){
	case IO_PANEL_SWITCHES:
		/* Read front panel switches */
		*dbus = 0xf0f0; /* Temporary */
		iodebug("IN %x: FRONT PANEL SWITCHES = %04x\n", addr, *dbus);
		return 1;
		
	case IO_DIP_SWITCHES:
		/* Read dip panel switches */
		*dbus = 0x1234; /* Temporary */
		iodebug("IN %x: DIP SWITCHES = %04x\n", addr, *dbus);
		return 1;
		
	case IO_TICKS_LO:
		/* Read hardware flags */
		*dbus = (cpu.tick - tickref) & 0xffff;
		testdebug("IN %x: READ TICKS_LO = %04x\n", addr, *dbus);
		return 1;
		
	case IO_TICKS_HI:
		/* Read hardware flags */
		*dbus = ((cpu.tick - tickref) >> 16) & 0xffff;
		testdebug("IN %x: READ TICKS_HI = %04x\n", addr, *dbus);
		return 1;
	}
	
	return 0;
}


/* End of file. */
