// -*- c -*-
// 
// ringbuf.c — Ring Buffer data structure
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#include <string.h>
#include <assert.h>
#include <malloc.h>

#include "util.h"
#include "ringbuf.h"


ringbuf_t *
ringbuf_init(uint8_t bits)
{
	ringbuf_t * res;

	res = safe_malloc(sizeof(ringbuf_t));
	res->magic = MAGIC_RINGBUF_T;
	res->mask = (1 << bits) - 1; // This makes calculations much faster
	res->ip = 0;
	res->op = 0;
	size_t size = sizeof(uint32_t) * (1 << bits);
	res->buf = safe_malloc(size);
	memset(res->buf, 0, size);

	return res;
}


void
ringbuf_done(ringbuf_t * rb)
{
	assert(rb != NULL);
	assert(rb->magic == MAGIC_RINGBUF_T);
	free(rb->buf);
	free(rb);
}


int32_t
ringbuf_get(ringbuf_t * rb)
{
	assert(rb != NULL);
	assert(rb->magic == MAGIC_RINGBUF_T);

	if (rb->ip != rb->op) {
		int retval = rb->buf[rb->op];
		rb->op = (rb->op + 1) & rb->mask;
		return retval;
	}

	return -1;
}


int32_t
ringbuf_put(ringbuf_t * rb, uint32_t data)
{
	assert(rb != NULL);
	assert(rb->magic == MAGIC_RINGBUF_T);
	assert(data < RINGBUF_DATA_MAX);

	uint32_t new_ip = (rb->ip + 1) & rb->mask;
	if (new_ip != rb->op) {
		rb->buf[rb->ip] = data;
		rb->ip = new_ip;
		return 0;
	}

	return -1;
}


int
ringbuf_empty(ringbuf_t * rb)
{
	assert(rb != NULL);
	assert(rb->magic == MAGIC_RINGBUF_T);
	return rb->ip == rb->op;
}


int
ringbuf_full(ringbuf_t * rb)
{
	assert(rb != NULL);
	assert(rb->magic == MAGIC_RINGBUF_T);
	return ((rb->ip + 1) & rb->mask) == rb->op;
}

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
