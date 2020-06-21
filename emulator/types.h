// -*- c -*-
// 
// types.h — Types common to the emulator
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.


#ifndef TYPES_H
#define TYPES_H 1


#include <stdint.h>
#include <sys/types.h>


typedef uint16_t word;          // We'll be using this a lot.

typedef unsigned char bit;      // Faster than using bit fields.


#endif // TYPES_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
