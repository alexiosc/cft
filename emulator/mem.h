// -*- c -*-
// 
// mem.h — MEM board emulation interface
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef MEM_H
#define MEM_H 1


#include <stdint.h>
#include <sys/types.h>

#include "cft.h"

// The SENTINEL instruction, OUT R &100 &f = 0x6000 | 0x400 | 0x100 | 0xf
#define SENTINEL 0x650f


void mem_init();

void mem_done();

// Change all loaded ROMs into RAM. This is used to simulate manually entered
// programs during testing.
void mem_writeable_rom();

int mem_read(longaddr_t addr, word * data);

int mem_write(longaddr_t addr, word data);

char * mem_get_map(longaddr_t addr);

#endif // MEM_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
