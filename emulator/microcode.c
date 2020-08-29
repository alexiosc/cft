// -*- c -*-
// 
// microcode.h — The Microcode
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef MICROCODE_H
#define MICROCODE_H 1

// All we do here is load the microcode.h file which contains the
// microcode ROM, but this time, we conditionally compile in the ROM
// array. This will give us a ‘microcode’ variable.

#include <stdint.h>

#define WANT_MICROCODE_ROM
#include "microcode/build/microcode.h"

#endif // MICROCODE_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
