/* 

nvram.h - Emulates much of an ST-M48T02 timekeeper/NVRAM chip.

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

#ifndef NVRAM_H
#define NVRAM_H 1


#include <stdint.h>
#include <sys/types.h>


#define NVRAM_FNAME "nvram.bin"
#define NVRAM_SIZE 2048


extern int nvram;		/* NVRAM emulation enabled? */


void nvram_init();

void nvram_done();

void nvram_tick(int tick);

int nvram_write(uint16_t addr, uint16_t data);

int nvram_read(uint16_t addr, uint16_t * data);


#endif /* NVRAM_H */

/* End of file. */
