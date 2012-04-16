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
	mbuinfo("Memory Banking Unit initialised.\n");
	for (i = 0; i < NBANKS; i++) {
		cpu.mbu[i] = (uint32_t)(random() & 0xff) << 13;
		mbudebug("*** %d->%06x\n", i, cpu.mbu[i]);
	}
}


void
mbu_done() 
{
}


void
mbu_tick(int tick) 
{
}


static int _banking = 0;


int 
mbu_write(uint16_t addr, uint16_t dbus)
{
	uint32_t ofs;

	switch(addr) {
	case IO_MEMBANK0:
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
		
		if (_banking) cpu.banks[addr - IO_MEMBANK0] = ofs;
		else cpu.mbu[addr - IO_MEMBANK0] = ofs;

		return 1;

	case IO_BANKEN:

		/* The MBU initialises to a semi-hardwired bank setup: the
		 * first 4 banks are mapped to the first 32kW of RAM, and the
		 * remaining 4 banks are mapped to the first 32kW of ROM. When
		 * this port is written to, this scheme is disabled and the
		 * underlying bank registers take effect. It is important for
		 * the banking scheme to be set to sane values before enabled,
		 * otherwise the machine will crash. Once enabled, banking may
		 * only be disabled by restting the computer.
		 */

		if (!_banking) {
			mbudebug("Enabling MBU registers. Current values:\n");
			memcpy(&cpu.banks, &cpu.mbu, sizeof(cpu.banks));
			_banking = 1;
			int i;
			for (i = 0; i < NBANKS; i++){
				mbudebug("*** Bank %d -> %06x\n", i, cpu.banks[i]);
			}
		}
		
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
