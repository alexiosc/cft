// -*- mode: c; tab-width: 4; -*-
// 
// util.h — Various utility functions
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.


#ifndef UTIL_H
#define UTIL_H 1


#include <stdint.h>
#include <sys/types.h>


#define get_page(x) ((x) & 0xfc00)


// char * to_bin(uint32_t n, char *s, int slen);

// void dump_state();

// void dump_ustate();

// void dump_mini(word oldpc);

// void dump();

// void dumpmem(word addr, int count);

// void dumpstack(word addr, word sp, int usemap);

// uint32_t parity(uint32_t value);


#endif // UTIL_H

/* End of file. */
