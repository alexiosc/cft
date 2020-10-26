// -*- c -*-
// 
// ringbuf.h — Ring Buffers
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.


#ifndef RINGBUF_H
#define RINGBUF_H 1


#include <stdint.h>
#include <sys/types.h>

#include "types.h"


#define MAGIC_RINGBUF_T  0x52494E47 // "RING"
#define RINGBUF_DATA_MAX 0x80000000

typedef struct {
	uint32_t  magic;	// Magic number
	uint32_t  mask;		// sizeof(buf) - 1

	uint32_t  ip;		// Input index
	uint32_t  op;		// Output index
	uint32_t  *buf;		// Array of actual data
} ringbuf_t;


// Create a ring buffer with size 1 << bits.
ringbuf_t * ringbuf_init(uint8_t bits);

// Destroy a ring buffer.
void ringbuf_done(ringbuf_t * rb);

// Returns -1 if empty, or a datum if not.
int32_t ringbuf_get(ringbuf_t * rb);

// Returns -1 if full, or queues a datum in the buffer.
int32_t ringbuf_put(ringbuf_t * rb, uint32_t data);

// Returns 1 if ringbuffer is empty, 0 otherwise.
int ringbuf_empty(ringbuf_t * rb);

// Returns 1 if ringbuffer is full, 0 otherwise.
int ringbuf_full(ringbuf_t * rb);


#endif // RINGBUF_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
