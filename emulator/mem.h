/* 

memory.h - Memory management.

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

#ifndef MEMORY_H
#define MEMORY_H 1


#include <stdint.h>
#include <sys/types.h>


extern int banking;		/* MEMORY emulation enabled? */

#define ADDRSPACE 65536
#define NBANKS 8
#define BANKSIZE ((ADDRSPACE) / (NBANKS))
#define ROM_START 0x100000

#define GET_AEXT(x) (((x) >> 16) & 0x1f)
#define GET_AOFS(x) ((x) & 0xffff)

#define GET_ROMOFS(phys) ((phys) - ROM_START)
#define GET_RAMOFS(phys) (phys)

#define IS_ROM(phys) (((phys) >= ROM_START) && (GET_ROMOFS(phys) < mach.romsize))
#define IS_RAM(phys) ((phys) < mach.ramsize) // ((phys) < ROM_START) && (GET_RAMOFS(phys) < mach.ramsize))

#ifndef BUS_UNDRIVEN
#define BUS_UNDRIVEN 0xffff	/* Bus pulled up. */
//#define BUS_UNDRIVEN 0x0000   /* Bus pulled down. */
#endif


void memory_init();

void memory_done();

inline void memory_write(uint16_t addr, uint16_t data);

inline uint16_t memory_read(uint16_t addr);

inline uint32_t l2p(uint16_t logical);

inline uint16_t * l2ptr(uint16_t logical);



#endif /* MEMORY_H */

/* End of file. */
