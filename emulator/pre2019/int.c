/* 
   
int.c - Emulates the Interrupt Controller

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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h> 
#include <sys/types.h>

#include "cftemu.h"
#include "io.h"
#include "int.h"
#include "util.h"


#define REG_MASK ((1 << IRQ_LINES) - 1)

int have_int = 0;
static int ier, isr;

int debug_int = 0;


void
int_init()
{
	intinfo("Interrupt Controller initialised.\n");
	int_reset();
}


void
int_reset() {
	ier = isr = 0;
}


void
int_done() 
{
}


void
int_tick(int tick) 
{
	// Continuously set the interrupt flag until interrupts are acknowledged
	//printf("%02x %02x %02x\n", isr, ier, isr & ier);
	if (isr & ier) cpu.irq = 0;
}


int 
int_write(uint16_t addr, uint16_t dbus)
{
	if ((addr & 0xfff0) == IO_INTC_IER) {
		int level = addr & 7;

		if (dbus & 1) ier |= 1 << level;
		else ier &= ~(1 << level);
		/* Any clear bits in the IER also clear the corresponding ISR
		 * bits. */
		isr &= ier;
		intdebug("REG(%d) = %d, IER = %02x, ISR=%02x\n", level, dbus & 1, ier, isr);
		return 1;
	}
	return 0;
}


int
int_read(uint16_t addr, uint16_t *dbus)
{
	if ((addr & 0xfff0) == IO_INTC_ISR) {
		*dbus = isr;
		return 1;
	}
	return 0;
}


void
interrupt (int level)
{
	// Set the ISR bit
	isr = (isr | (1 << level)) & REG_MASK;

	if (((1 << level) & ier) == 0) {
		intdebug("Interrupt level %d is masked\n", level);
	}
}


/* End of file. */
