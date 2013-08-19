/* 

util.h - Emulates much of an ST-M48T02 timekeeper/UTIL chip.

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

#ifndef UTIL_H
#define UTIL_H 1


#include <stdint.h>
#include <sys/types.h>



char * to_bin(uint32_t n, char *s, int slen);

void dump_state();

void dump_ustate();

void dump_mini(word oldpc);

void dump();

void dumpmem(word addr, int count);

void dumpstack(word addr, word sp, int usemap);

uint32_t parity(uint32_t value);


#endif /* UTIL_H */

/* End of file. */
