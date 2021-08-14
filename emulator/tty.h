// -*- c -*-
// 
// tty.h — Quad Serial Board (TTY) definitions
// 
// Copyright © 2012–2021 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef TTY_H
#define TTY_H 1

#include "cftemu.h"

void tty_init();

void tty_reset();

int tty_read(longaddr_t addr, word * data);

int tty_write(longaddr_t addr, word data);

void tty_tick();

void tty_done();

#endif // TTY_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
