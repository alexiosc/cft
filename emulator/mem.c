// -*- c -*-
// 
// mem.c — MEM board emulation
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

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
#include "mem.h"
#include "log.h"


#define MAX_MEMORY 16777216

#define MEM_TYPE_NONE 255
#define MEM_TYPE_RAM  254

uint8_t mem_type[MAX_MEMORY];
word    mem_space[MAX_MEMORY];

typedef struct {
	char * label;
	char * pasm;
} mem_info_t;

mem_info_t mem_info[MAX_MEMORY];


void
mem_init()
{
	notice("Mem init");
	memset(mem_type, MEM_TYPE_NONE, sizeof(mem_type));
	memset(mem_info, 0, sizeof(mem_info_t));
	memset(mem_space, emu.sentinel ? SENTINEL : 0, sizeof(mem_space));

	// Mark RAM.
	memset(mem_type, MEM_TYPE_RAM, emu.ram_size << 10);

	// Initialise each of the ROMs.
	for (int i = 0; i < emu.num_roms; i++) {
		romspec_t *rom = &emu.roms[i];
		memset(&mem_type[rom->addr << 10], (uint8_t)(i & 0xff), rom->size << 10);
	}
}

// inline uint16_t *
// l2ptr(uint16_t logical)
// {
// 	/* Given a logical address, return a pointer to the word in
// 	   the *EMULATOR'S* memory space. Returns a pointer inside the
// 	   cpu.rom or cpu.rom array. */

// 	register int ofs = mbu_l2p(logical);
// 	if (IS_ROM(ofs)) return cpu.rom + GET_ROMOFS(ofs);
// 	return cpu.ram + GET_RAMOFS(ofs);
// }


// inline void
// memory_write(uint16_t addr, uint16_t data)
// {
// 	register int phys = mbu_l2p(addr);
// 	uint32_t ofs = GET_AOFS(phys);

// 	/* debug_mem = addr == 0x415; */
// 	/* if (debug_mem && data == 0x53ef) dump(); */

// 	if (IS_ROM(phys)) {

// 		/* Writing to mapped ROM. Won't work. */

// 		if (sanity) {
// 			fail("Attempt to write %04x to ROM at address %04x (physical %02x:%04x).\n",
// 			     data, addr, GET_AEXT(phys), GET_AOFS(phys));
// 		} /* else if (addr == 0x6000) {
// 			// TODO: remove this.
// 			info("Attempt to write %04x to ROM at address %04x (physical %02x:%04x).\n",
// 			     data, addr, GET_AEXT(phys), GET_AOFS(phys));
// 			     }*/

// 	} else if (IS_RAM(phys)) {

// 		/* Writing to mapped RAM. */
		
// 		uint32_t ramofs = GET_RAMOFS(phys);
// 		memdebug("Wrote RAM[%04x -> %02x:%04x] <- %04x\n", addr, GET_AEXT(phys), ofs, data);
// 		cpu.ram[ramofs] = data;

// #ifdef MEMORY_MAPPED_VDU
// 	} else if (video_isvram(phys)) {
// 		/* Writing to video RAM */
		
// 		uint32_t ramofs = GET_RAMOFS(phys);

// 		memdebug("Wrote VRAM[%04x -> %02x:%04x] <- %04x\n", addr, GET_AEXT(phys), ofs, data);
// 		video_memwrite(ramofs, data);

// #endif // MEMORY_MAPPED_VDU

// 	} else {

// 		/* Neither ROM nor RAM: unmapped address */

// 		if (sanity) {
// 			fail("Attempt to write %04x to unmapped address %04x (physical %02x:%04x).\n",
// 			     data, addr, GET_AEXT(phys), GET_AOFS(phys));
// 		} /*else if (addr == 0x6000) {
// 			info("Attempt to write %04x to unmapped address %04x (physical %02x:%04x).\n",
// 			data, addr, GET_AEXT(phys), GET_AOFS(phys));
// 			}*/
// 	}
// }


// inline uint16_t
// memory_read(uint16_t addr)
// {
// 	register int phys = mbu_l2p(addr);

// 	if (IS_ROM(phys)) {

// 		/* Reading from mapped ROM. */

// 		uint32_t romofs = GET_ROMOFS(phys);
// 		word retval = cpu.rom[romofs];
// 		memdebug("Read ROM[%04x -> %02x:%04x] == %04x\n",
// 			 addr, GET_AEXT(phys), GET_AOFS(phys), retval);
// 		return retval;

// 	} else if (IS_RAM(phys)) {

// 		/* Reading from mapped ROM. */

// 		uint32_t ramofs = GET_RAMOFS(phys);
// 		word retval = cpu.ram[ramofs];
// 		memdebug("Read RAM[%04x -> %02x:%04x] == %04x\n",
// 			 addr, GET_AEXT(phys), GET_AOFS(phys), retval);
// 		return retval;

// #ifdef MEMORY_MAPPED_VDU
// 	} else if (video_isvram(phys)) {
		
// 		/* Reading from video RAM */
		
// 		uint32_t ramofs = GET_RAMOFS(phys);
// 		word retval = video_readmem(ramofs);
// 		memdebug("Read VRAM[%04x -> %02x:%04x] == %04x\n",
// 			 addr, GET_AEXT(phys), GET_AOFS(phys), retval);
// 		return retval;
// #endif // MEMORY_MAPPED_VDU

// 	} else {

// 		/* Neither ROM nor RAM: unmapped address */

// 		if (sanity) {
// 			fail("Attempt to read from unmapped address %04x (physical %02x:%04x).\n",
// 			     addr, GET_AEXT(phys), GET_AOFS(phys));
// 		} /*else if (addr == 0x6000) {
// 			info("Attempt to read from unmapped address %04x (physical %02x:%04x).\n",
// 			     addr, GET_AEXT(phys), GET_AOFS(phys));
// 			     }*/

// 		/* Fall through to function's final return */
// 	}

// 	return BUS_UNDRIVEN;
// }


// /* Fill the memory with sentinel values. */
// static void
// memory_fill_sentinel()
// {
// 	uint32_t i;

// 	for (i = 0; i < mach.ramsize; i++) {
// 		cpu.ram[i] = 0x53ef; /* OUT R &3EF */
// 	}
// 	meminfo2("RAM filled with sentinel value.\n");
// }


// /* Read the memory image. */
// static inline void
// memory_load_rom()
// {
// 	// if (mach.romsize == 0) {
// 	// 	meminfo2("This machine type has no ROM.\n");
// 	// 	return;
// 	// }

// 	// Check the size of the image.
// 	struct stat st;
// 	if(fstat(fileno(memimg_file), &st) < 0) {
// 		fail("Unable to stat ROM image '%s': %m\n", memimg_name);
// 	}
	
// 	// if (st.st_size != mach.romsize * sizeof(word)) {
// 	// 	fail("Memory image should be %u kWords (%lu bytes), was %lu bytes\n",
// 	// 	     mach.romsize >> 10,
// 	// 	     mach.romsize * sizeof(word),
// 	// 	     st.st_size);
// 	// }
	
// 	/* We'll be loading the ROM one bank at a time, so we can
// 	 * resolve memory references. */

// 	uint32_t i, ofs;
// 	for (i = 0, ofs = mach.image_start; i < mach.image_size / BANKSIZE; i++, ofs += BANKSIZE) {
// 		uint16_t * buf;

// 		/* Attempt to autodetect ROM image starts. If it's
// 		 * less than 0x100000, it's probably a logical
// 		 * address. */
		
// 		// if (ofs < 0x100000) {
// 		// 	buf = l2ptr(ofs);
// 		// 	ofs = mbu_l2p(ofs);
// 		// } else {
// 		// 	buf = &cpu.rom[ofs & 0xfffff];
// 		// 	ofs = 0x100000 + (buf - cpu.rom);
// 		// }
// 		buf = l2ptr(ofs);
// 		//ofs = mbu_l2p(ofs);
		
// 		// Sanity checks
// 		if (fread(buf, BANKSIZE * sizeof(word), 1, memimg_file) != 1) {
// 			fail("Short read from ROM image file %s: %m\n", memimg_name);
// 		}

// 		if(0)
// 		{
// 			int i,j;
// 			for (i = 0; i < BANKSIZE; i+=32) {
// 				for (j = 0; j < 31; j++) {
// 					printf("%04x ", buf[i+j]);
// 				}
// 				printf("\n");
// 			}
// 			printf("\n\n");
// 		}

// 		meminfo2("ROM: loaded %d words at ofs=%05x -> %02x:%04x (%p)\n",
// 			 BANKSIZE, ofs, GET_AEXT(ofs), GET_AOFS(ofs), buf);
// 	}
// }


// /* Initialise memory */

// void
// memory_init()
// {
// 	/* Sanity checks */
// 	assert (BANKSIZE * NBANKS == ADDRSPACE); /* Ensure memory geometry is kosher */
// 	assert ((mach.image_start % BANKSIZE) == 0); /* Image must be bank-aligned */
// 	assert ((mach.image_size % BANKSIZE) == 0); /* Image size must be whole banks */

// 	/* Allocate physical memory */
// 	cpu.ram = malloc(mach.ramsize * sizeof(word));

// 	meminfo2("Allocated %d kW of physical RAM at 0x00:0000 - %02x:%04x\n",
// 		 mach.ramsize >> 10,
// 		 GET_AEXT(mach.ramsize - 1),
// 		 GET_AOFS(mach.ramsize - 1));
// 	if (sentinel) memory_fill_sentinel();

// 	if (mach.romsize) {
// 		cpu.rom = malloc(mach.romsize * sizeof(word));
// 		meminfo2("Allocated %d kW of physical ROM at 0x10:0000 - %02x:%04x\n",
// 			 mach.romsize >> 10,
// 			 GET_AEXT(0x100000 + mach.romsize - 1),
// 			 GET_AOFS(0x100000 + mach.romsize - 1));
// 	} else {
// 		cpu.rom = NULL;
// 	}

// 	if (verbose == 1) {
// 		meminfo("Allocated %d kW RAM, %d kW ROM\n",
// 			mach.ramsize >> 10, mach.romsize >> 10);
// 	}

// 	memory_load_rom();

// #if 0

// 	uint16_t * p0 = NULL;
// 	sanity = 0;
// 	for (i = 0; i < 255; i++) {
// 		cpu.banks[3] = (i & 0xff) << 13;
// 		uint16_t * p = l2ptr(0x6000);
// 		uint32_t phys = mbu_l2p(0x6000);
// 		memory_write(0x6000, 0x1234 + i);
// 		int ram = memory_read(0x6000) == (0x1234 + i);

// 		info("Bank %02x -> %06x IS_RAM=%d, IS_ROM=%d, ram=%d (%x)\n",
// 		     i, phys, IS_RAM(phys), IS_ROM(phys), ram, memory_read(0x6000));
// 		p0 = p;
// 	}
// 	exit(0);
// #endif
// }


// void
// memory_done()
// {
// 	free(cpu.ram);
// 	free(cpu.rom);
// }


// End of file.
