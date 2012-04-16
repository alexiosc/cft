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


extern int mbu;
extern int debug_mbu;


void mbu_init();

int mbu_write(uint16_t addr, uint16_t data);

int mbu_read(uint16_t addr, uint16_t * data);

void mbu_tick(int tick);

void mbu_done();


#endif /* MBU_H */

/* End of file. */
