// -*- c -*-
// 
// tty.c — Quad Serial board
// 
// Copyright © 2012–2021 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <assert.h>
#include <termios.h>
#include <errno.h>
#include <time.h>
#include <sys/types.h>
#include <sys/time.h>

#include "cftemu.h"
#include "cft.h"

#define DEB_MACROS_UNIT irc_log_unit
#include "log.h"

#include "tty.h"
#include "irc.h"
#include "util.h"


static log_unit_t   tty_log_unit;


void tty_init()
{
        tty_log_unit = log_add_unit("TTY", -1, -1);
        debug("Initialised Quad Serial Board");
	tty_reset();
}


void
tty_reset() {
}


void
tty_tick()
{
	// // Signal a CPU interrupt if any of the enabled interrupts lines are
	// // asserted.
	// if (isr & ier) cpu.irq = 1;
}


int
tty_read(longaddr_t addr, word * data)
{
        return 0;
}


int
tty_write(longaddr_t addr, word data)
{
        return 0;
}


void
tty_done() {
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
