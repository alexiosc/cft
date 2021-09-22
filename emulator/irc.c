// -*- c -*-
// 
// irc.c — Interrupt Request Controller Board
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

#include "irc.h"
#include "util.h"


#define IRC_MSB 0x3f0


static log_unit_t   irc_log_unit;
static word         ier;	// Interrupt Enable Register
static word         isr;	// Interrupt Status Register


void irc_init()
{
        irc_log_unit = log_add_unit("IRC", -1, -1);
        debug("Initialised Interrupt Controller");
	irc_reset();
}


void
irc_reset() {
	ier = isr = 0;
}


void
irc_tick()
{
	// Signal a CPU interrupt if any of the enabled interrupts lines are
	// asserted.
	if (isr & ier) cpu.irq = 1;
}


int
irc_read(longaddr_t addr, word * data)
{
	// 8 copies of the IER, addresses 0 to 7.
	if ((addr & 0x3f8) == 0) {
		*data = IRC_MSB | ier;
		return 1;
	}

	// 8 copies of the ISR, addresses 8 to 15.
	if ((addr & 0x3f8) == 8) {
		*data = IRC_MSB | isr;
		return 1;
	}
        return 0;
}


int
irc_write(longaddr_t addr, word data)
{
	if ((addr & 0x3f8) == 0) {
		// Disable an interrupt
		word mask = 1 << (addr & 7);
		ier &= ~mask;
		isr &= ~mask;
		debug("Enabled IRQ%d", addr & 7);
		return 1;
	} else if ((addr & 0x3f8) == 8) {
		// Enable an interrupt
		word mask = 1 << (addr & 7);
		ier |= mask;
		debug("Disabled IRQ%d", addr & 7);
		return 1;
	}
        return 0;
}


void
irc_irq(int level)
{
	word value = (1 << (level & 7)) & 0xff;

	if (ier & value) {
		debug("IRQ %d received\n", level);
		isr |= value;
	} else {
		debug("IRQ %d received (masked; ignored)\n", level);
	}
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
