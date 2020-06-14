/* 
   
mbu.c - Emulates the Memory Banking Unit

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
#include "mbu.h"
#include "util.h"


int mbu;

int debug_mbu = 0;


void
mbu_init()
{
	int i;
	for (i = 0; i < NBANKS; i++) {
		// Randomise the soft map on initialisation
		cpu.mbusm[i] = (uint32_t)(random() & 0xff) << 13;
		// Copy the hard map from the architecture definition
		cpu.mbuhm[i] = mach.banks[i];
		mbuinfo("Hard map bank: %04x-%04x: %s %02x:%04x\n",
			i * BANKSIZE,
			(i + 1) * BANKSIZE - 1,
			cpu.mbuhm[i] > 1048576 ? "ROM" : "RAM",
			(cpu.mbuhm[i] >> 16) & 0xff,
			cpu.mbuhm[i] & 0xffff);
	}

	mbu_reset();
	mbuinfo("Memory Banking Unit initialised.\n");
}


void
mbu_reset() {
	// Revert to hard map on reset.
	cpu.mbuen = 0;
	mbuinfo("Reverting to hard map on reset.\n");
}


void
mbu_done() 
{
}


void
mbu_tick(int tick) 
{
}


int 
mbu_write(uint16_t addr, uint16_t dbus)
{
	uint32_t ofs;

	switch(addr) {
	case IO_MEMBANK0:
		
		// Interpret the enable/disable bit, only available on bank 0.
		if (dbus & 0x100) {
			if (cpu.mbuen) {
				mbudebug("Disabling MBU soft mapping, reverting to hard map.\n");
			}
			cpu.mbuen = 0;
		} else {
			if (!cpu.mbuen) {
				mbudebug("Enabling MBU soft mapping.\n");
				cpu.mbuen = 1;
			}
			cpu.mbuen = 1;
		}

		// Case fall-through is intentional.

	case IO_MEMBANK1:
	case IO_MEMBANK2:
	case IO_MEMBANK3:
	case IO_MEMBANK4:
	case IO_MEMBANK5:
	case IO_MEMBANK6:
	case IO_MEMBANK7:

		ofs = (dbus & 0xff) << 13;
		mbudebug("Set bank %d (%04x-%04x) to physical "
			 "address %02x:%04x - %02x:%04x\n",
			 addr - IO_MEMBANK0,
			 (addr - IO_MEMBANK0) * 0x2000,
			 (addr - IO_MEMBANK0) * 0x2000 + 0x1fff,
			 GET_AEXT(ofs), GET_AOFS(ofs),
			 GET_AEXT(ofs), GET_AOFS(ofs + 0x1fff)
			);
		
		cpu.mbusm[addr - IO_MEMBANK0] = ofs;

		return 1;
	}


	return 0;
}


int
mbu_read(uint16_t addr, uint16_t *dbus)
{
	return 0;
}


/* End of file. */
