// -*- c -*-
// 
// deb.h — DEB Board I/O definitions
// 
// Copyright © 2012–2021 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef DEB_H
#define DEB_H 1

#include "cftemu.h"
#include "tty.h"

void deb_init();

int deb_read(longaddr_t addr, word * data);

int deb_write(longaddr_t addr, word data);

void deb_tick();

void deb_connect_tty_t(int unit, tty_t* host_tty);

#endif // DEB_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
