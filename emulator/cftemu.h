// -*- c -*-
// 
// cftemu.h — Definitions for the CFT emulator
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef CFTEMU_H
#define CFTEMU_H 1

#include <stdio.h>
#include <stdint.h>

#include "types.h"


typedef struct {
        char * fname;
        int    addr;                // Base address in KiW
        int    size;                // Size in KiW
} romspec_t;


typedef struct cftemu_t {
        int         loglevel;       // Logging level
        int         sanity;         // Sanity checking level

        int         ram_size;       // RAM Size
        romspec_t * roms;           // ROMs to load
        int         num_roms;       // Number of ROMs specified.

        word        ram_sentinel;   // Value RAM is initialised with.
        int         force_colour;   // -1 = disable colour, 1 = enable colour

        int         strict_sanity:1;
        int         writeable_rom:1;
        int         sentinel:1;
        int         debug_microcode:1;
        int         debug_mem:1;
        int         debug_io:1;
        int         debug_asm:1;
        int         debug_duart:1;
} cftemu_t;

extern cftemu_t emu;


///////////////////////////////////////////////////////////////////////////////
//
// BOILERPLATE
//
///////////////////////////////////////////////////////////////////////////////

#ifndef PACKAGE
#define PACKAGE "cftemu"
#endif

#ifndef VERSION
#define VERSION "0.9"
#endif

#ifndef AUTHOR
#define AUTHOR "Alexios Chouchoulas"
#endif


#endif	// CFTEMU_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
