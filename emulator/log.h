// -*- c -*-
// 
// log.h — Logging and debugging interface
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <argp.h>


int log_init(char * filename);

int log_addunit(char *name, uint8_t colour);

void log_setcolour(int on);

void log_setlevel(int level);

void log_setprefix(char *prefix);

void log_msg(int level, char * unit, char * fmt, ...);

void log_done();


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
