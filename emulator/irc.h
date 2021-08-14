// -*- c -*-
// 
// irc.h — Interrupt Controller (IRC) definitions
// 
// Copyright © 2012–2021 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef IRC_H
#define IRC_H 1

#include "cftemu.h"

void irc_init();

void irc_reset();

int irc_read(longaddr_t addr, word * data);

int irc_write(longaddr_t addr, word data);

void irc_tick();

void irc_irq(int level);

#endif // IRC_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
