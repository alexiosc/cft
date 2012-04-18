/* 

ide.h - Emulates the IDE host adapter card

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

#ifndef IDE_H
#define IDE_H 1


#include <stdint.h>
#include <sys/types.h>


extern int ide;

extern int ide_speed;

extern int debug_ide;


void idehd_set(uint32_t a, char *fname);

void ide_early_init();

void ide_init();

void ide_tick(int tick);

void ide_done();

int ide_write(uint16_t addr, uint16_t data);

int ide_read(uint16_t addr, uint16_t * data);

#endif /* IDE_H */

/* End of file. */
