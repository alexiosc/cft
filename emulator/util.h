// -*- c -*-
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

#include "types.h"


#define get_page(x) ((x) & 0xfc00)


// Format long address addr. If buf is non-NULL, it will be written to. buf
// must point to at least 8 writerable bytes. Otherwise, return a pointer to an
// internal buffer (which will be overwritten every time the function is
// called).
char * format_longaddr(longaddr_t addr, char *buf);


// Disassemble an instruction into the string buffer buf. If buf is
// NULL, an internal static char buffer is used. Return a pointer to
// the buffer used.
char * disasm(word instr, char *buf);



// char * to_bin(uint32_t n, char *s, int slen);

// void dump_state();

// void dump_ustate();

// void dump_mini(word oldpc);

// void dump();

// void dumpmem(word addr, int count);

// void dumpstack(word addr, word sp, int usemap);

// uint32_t parity(uint32_t value);


#endif // UTIL_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
