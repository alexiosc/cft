/* 

memory.c - Memory management

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
#include <stdint.h>
#include <assert.h>
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <argp.h>

#include "cftemu.h"
#include "memory.h"
#include "util.h"

char *memimg_name = NULL;
FILE *memimg_file = NULL;


int banking = 0;


inline uint32_t
l2p(uint16_t logical)
{
	/* Given a logical address, return the physical mapping as it
	   is on the CFT memory board, i.e. 0x000000-0x0FFFFF = RAM,
	   0x100000-0x1FFFFF = ROM. */
	
	register int bank = (logical >> 13) & 0xf;
	return cpu.banks[bank] | (logical & 0x1fff);
}


inline uint16_t *
l2ptr(uint16_t logical)
{
	/* Given a logical address, return a pointer to the word in
	   the *EMULATOR'S* memory. Returns a pointer inside the
	   cpu.rom or cpu.rom array. */

	register int ofs = l2p(logical);
	if (IS_ROM(ofs)) return cpu.rom + GET_ROMOFS(ofs);
	return cpu.ram + GET_RAMOFS(ofs);
}


inline void
memory_write(uint16_t addr, uint16_t data)
{
	register int phys = l2p(addr);
	uint32_t ofs = GET_AOFS(phys);

	if (IS_ROM(phys)) {

		/* Writing to mapped ROM. Won't work. */

		if (sanity) {
			fail("Attempt to write %04x to ROM at address %04x (physical %02x:%04x).\n",
			     data, addr, GET_AEXT(phys), GET_AOFS(phys));
		} /* else if (addr == 0x6000) {
			// TODO: remove this.
			info("Attempt to write %04x to ROM at address %04x (physical %02x:%04x).\n",
			     data, addr, GET_AEXT(phys), GET_AOFS(phys));
			     }*/

	} else if (IS_RAM(phys)) {

		/* Writing to mapped RAM. */
		
		uint32_t ramofs = GET_RAMOFS(phys);
		memdebug("Wrote RAM[%04x -> %02x:%04x] <- %04x\n", addr, GET_AEXT(phys), ofs, data);
		cpu.ram[ramofs] = data;

	} else {

		/* Neither ROM nor RAM: unmapped address */

		if (sanity) {
			fail("Attempt to write %04x to unmapped address %04x (physical %02x:%04x).\n",
			     data, addr, GET_AEXT(phys), GET_AOFS(phys));
		} /*else if (addr == 0x6000) {
			info("Attempt to write %04x to unmapped address %04x (physical %02x:%04x).\n",
			data, addr, GET_AEXT(phys), GET_AOFS(phys));
			}*/
	}
}


inline uint16_t
memory_read(uint16_t addr)
{
	register int phys = l2p(addr);
	uint32_t ofs = GET_AOFS(phys);

	if (IS_ROM(phys)) {

		/* Reading from mapped ROM. */

		uint32_t romofs = GET_ROMOFS(phys);
		word retval = cpu.rom[romofs];
		memdebug("Read ROM[%04x -> %02x:%04x] == %04x\n",
			 addr, GET_AEXT(phys), GET_AOFS(phys), retval);
		return retval;

	} else if (IS_RAM(phys)) {

		/* Reading from mapped ROM. */

		uint32_t ramofs = GET_RAMOFS(phys);
		word retval = cpu.ram[ramofs];
		memdebug("Read RAM[%04x -> %02x:%04x] == %04x\n",
			 addr, GET_AEXT(phys), GET_AOFS(phys), retval);
		return retval;

	} else {

		/* Neither ROM nor RAM: unmapped address */

		if (sanity) {
			fail("Attempt to read from unmapped address %04x (physical %02x:%04x).\n",
			     addr, GET_AEXT(phys), GET_AOFS(phys));
		} /*else if (addr == 0x6000) {
			info("Attempt to read from unmapped address %04x (physical %02x:%04x).\n",
			     addr, GET_AEXT(phys), GET_AOFS(phys));
			     }*/

		/* Fall through to function's final return */
	}

	return BUS_UNDRIVEN;
}


/* Fill the memory with sentinel values. */
static void
memory_fill_sentinel()
{
	uint32_t i;

	for (i = 0; i < mach.ramsize; i++) {
		cpu.ram[i] = 0x53ef; /* OUT R &3EF */
	}
	meminfo2("RAM filled with sentinel value.\n");
}


/* Read the memory image. */
static inline void
memory_load_rom()
{
	if (mach.romsize == 0) {
		meminfo2("This machine type has no ROM.\n");
		return;
	}

	// Check the size of the image.
	struct stat st;
	if(fstat(fileno(memimg_file), &st) < 0) {
		fail("Unable to stat ROM image '%s': %m\n", memimg_name);
	}
	
	if (st.st_size != mach.romsize * sizeof(word)) {
		fail("Memory image should be %u kWords (%lu bytes), was %lu bytes\n",
		     mach.romsize >> 10,
		     mach.romsize * sizeof(word),
		     st.st_size);
	}
	
	/* We'll be loading the ROM one bank at a time, so we can
	 * resolve memory references. */

	uint32_t i, ofs;
	for (i = 0, ofs = mach.image_start; i < mach.image_size / BANKSIZE; i++, ofs += BANKSIZE) {
		uint16_t * buf;

		/* Attempt to autodetect ROM image starts. If it's
		 * less than 0x100000, it's probably a logical
		 * address. */
		
		if (ofs < 0x100000) {
			buf = l2ptr(ofs);
			ofs = l2p(ofs);
		} else {
			buf = &cpu.rom[ofs & 0xfffff];
			ofs = 0x100000 + (buf - cpu.rom);
		}
		
		// Sanity checks
		if (fread(buf, BANKSIZE * sizeof(word), 1, memimg_file) != 1) {
			fail("Short read from ROM image file %s: %m\n", memimg_name);
		}

		meminfo2("ROM: loaded %d words at ofs=%x -> %02x:%04x\n",
			 BANKSIZE, ofs, GET_AEXT(ofs), GET_AOFS(ofs));
	}
}


/* Initialise memory */

void
memory_init()
{
	/* Sanity checks */
	assert (BANKSIZE * NBANKS == ADDRSPACE); /* Ensure memory geometry is kosher */
	assert ((mach.image_start % BANKSIZE) == 0); /* Image must be bank-aligned */
	assert ((mach.image_size % BANKSIZE) == 0); /* Image size must be whole banks */

	/* Allocate physical memory */
	cpu.ram = malloc(mach.ramsize * sizeof(word));

	meminfo2("Allocated %d kW of physical RAM at 0x00:0000 - %02x:%04x\n",
		 mach.ramsize >> 10,
		 GET_AEXT(mach.ramsize - 1),
		 GET_AOFS(mach.ramsize - 1));
	if (sentinel) memory_fill_sentinel();

	if (mach.romsize) {
		cpu.rom = malloc(mach.romsize * sizeof(word));
		meminfo2("Allocated %d kW of physical ROM at 0x10:0000 - %02x:%04x\n",
			 mach.romsize >> 10,
			 GET_AEXT(0x100000 + mach.romsize - 1),
			 GET_AOFS(0x100000 + mach.romsize - 1));
	} else {
		cpu.rom = NULL;
	}

	if (verbose == 1) {
		meminfo("Allocated %d kW RAM, %d kW ROM\n",
			mach.ramsize >> 10, mach.romsize >> 10);
	}

	int i;
	for (i = 0; i < NBANKS; i++) {
		cpu.banks[i] = mach.banks[i];
		mbuinfo("Bank: %04x-%04x: %s %02x:%04x\n",
			i * BANKSIZE,
			(i + 1) * BANKSIZE - 1,
			cpu.banks[i] > 1048576 ? "ROM" : "RAM",
			(cpu.banks[i] >> 16) & 0xff,
			cpu.banks[i] & 0xffff);
	}

	memory_load_rom();

#if 0

	uint16_t * p0 = NULL;
	sanity = 0;
	for (i = 0; i < 255; i++) {
		cpu.banks[3] = (i & 0xff) << 13;
		uint16_t * p = l2ptr(0x6000);
		uint32_t phys = l2p(0x6000);
		memory_write(0x6000, 0x1234 + i);
		int ram = memory_read(0x6000) == (0x1234 + i);

		info("Bank %02x -> %06x IS_RAM=%d, IS_ROM=%d, ram=%d (%x)\n",
		     i, phys, IS_RAM(phys), IS_ROM(phys), ram, memory_read(0x6000));
		p0 = p;
	}
	exit(0);
#endif
}


void
memory_done()
{
	free(cpu.ram);
	free(cpu.rom);
}


// End of file.
