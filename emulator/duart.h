/* 

duart.h - Emulates the dual DUART card (two Philips/NXP 26C92 DUARTs)

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

#ifndef DUART_H
#define DUART_H 1


#include <stdint.h>
#include <sys/types.h>


extern int duart;

extern int debug_duart;

void duart_init();

void duart_tick(int tick);

void duart_done();

int duart_write(uint16_t addr, uint16_t data);

int duart_read(uint16_t addr, uint16_t * data);

#endif /* DUART_H */

/* End of file. */
