/* 

mbu.h - Emulates the Memory Banking Unit.

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

#ifndef MBU_H
#define MBU_H 1


#include <stdint.h>
#include <sys/types.h>


extern int mbu, mben;
extern int debug_mbu;


void mbu_init();

void mbu_reset();

int mbu_write(uint16_t addr, uint16_t data);

int mbu_read(uint16_t addr, uint16_t * data);

void mbu_tick(int tick);

void mbu_done();


// Convert an address in the CFT's logical address range (0-65535) to
// the number of a bank register by using the most significant 3 bits
// of the address (bits 13-15).

#define mbu_a2b(addr) (((addr) >> 13) & 7)

// Obtain the contents of the appropriate bank register for the
// provided address. The address is resolved with the soft or hard
// map, depending on the state of the MBU.

#define mbu_bank(addr) ((cpu.mbuen ? cpu.mbusm : cpu.mbuhm)[mbu_a2b(addr)])

// Obtain a physical 21-bit address from a logical 16-bit address,
// using the MBU registers.

#define mbu_l2p(addr) (mbu_bank(addr) | ((addr) & 0x1fff))


#endif /* MBU_H */

/* End of file. */
