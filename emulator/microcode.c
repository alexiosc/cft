/* 

microcode.c - The CFT Microcode

Copyright (C) 2011 Alexios Chouchoulas

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


/*
 * All we do here is load the microcode.h file which contains the microcode
 * ROM, but this time, we conditionally compile in the ROM array.
 */

#include <stdint.h>

#define WANT_MICROCODE_ROM
#include "../microcode/microcode.h"

/* End of file */
