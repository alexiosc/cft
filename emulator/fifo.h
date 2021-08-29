/* 

fifo.h - A simple FIFO.

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

#ifndef FIFO_H
#define FIFO_H 1


#include <stdint.h>


typedef struct {
	uint32_t magic;
	uint32_t rp;
	uint32_t wp;
	uint32_t size;
	uint32_t buf[];
} fifo_t;


fifo_t * fifo_init(int size);

void fifo_done(fifo_t *);

void fifo_put(fifo_t * fifo, uint32_t val);

int fifo_get(fifo_t * fifo, uint32_t * val);

int fifo_poll(fifo_t * fifo);

int fifo_full(fifo_t * fifo);



#endif /* FIFO_H */

/* End of file. */
