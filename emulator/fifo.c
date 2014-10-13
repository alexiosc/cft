/* 

ringbuf.c - Implement a simple FIFO

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
#include <stdint.h>
#include <sys/types.h>
#include <assert.h>

#include "cftemu.h"
#include "fifo.h"
#include "util.h"


fifo_t *
fifo_init(int size)
{
	fifo_t * retval = malloc(sizeof(fifo_t) + sizeof(uint32_t) * size);
	if (retval == NULL) {
		fail("Failed to allocate memory for a FIFO.");
	}
	assert(size > 0);
	retval->size = size;
	retval->rp = retval->wp = 0;
	return retval;
}


void
fifo_done(fifo_t *fifo)
{
	assert(fifo != NULL);
	free(fifo);
}


void
fifo_put(fifo_t * fifo, uint32_t val)
{
	assert(fifo != NULL);
	assert(fifo->size > 0);

	fifo->buf[fifo->wp] = val;
	fifo->wp = (fifo->wp + 1) % fifo->size;
}


int
fifo_get(fifo_t * fifo, uint32_t * val) 
{
	assert(fifo != NULL);
	assert(fifo->size > 0);

	if (fifo->wp == fifo->rp) return -1;
	*val = fifo->buf[fifo->rp];
	fifo->rp = (fifo->rp + 1) % fifo->size;

	return 0;
}


int
fifo_poll(fifo_t * fifo)
{
	assert(fifo != NULL);
	return fifo->wp != fifo->rp;
}


int
fifo_empty(fifo_t * fifo)
{
	assert(fifo != NULL);

	return fifo->rp == fifo->wp;
}


int
fifo_full(fifo_t * fifo)
{
	// Full condition: will the next write (wp increment) make it
	// equal to rp?
	return ((fifo->wp + 1) % fifo->size) == fifo->rp;
}


/* End of file */
