/* 

int.h - Emulates the Interrupt Controller.

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

#ifndef IRC_H
#define IRC_H 1


#include <stdint.h>
#include <sys/types.h>


extern int have_irc;
extern int debug_irc;


#define IRQ_LINES 8


#define IRQ_TIMER 0
#define IRQ_VDU 2
#define IRQ_KBD IRQ_VDU
#define IRQ_TTY01 3
#define IRQ_TTY23 3
#define IRQ_ETH 4
#define IRQ_IDE 5
//#define IRQ_SPJ 6
//#define IRQ_FDC 7

#define ISR_DETECT 0x0f00


void irc_init();

void irc_reset();

int irc_write(uint16_t addr, uint16_t data);

int irc_read(uint16_t addr, uint16_t * data);

void irc_tick(int tick);

void interrupt(int level);

void irc_done();


#endif /* IRC_H */

/* End of file. */
