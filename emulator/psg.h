/* 

psg.h - Emulates the AY-3-8910 Programmable Sound Generator (PSG)

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

#ifndef PSG_H
#define PSG_H 1


#include <stdint.h>
#include <sys/types.h>


extern int have_psg;

extern int debug_psg;


#define AUDIO_FREQ 44100
#ifndef AUDIO_BUFLEN
#define AUDIO_BUFLEN 4096
#endif

#define PSG_CLOCK 2000000	/* 2 MHz clock */

#define PSG_AY8910_0 0		/* We only have one 8910 chip, unit 0 */


void psg_init();

void psg_reset();

void psg_tick(int tick);

void psg_done();

int psg_write(uint16_t addr, uint16_t data);

int psg_read(uint16_t addr, uint16_t * data);

#endif /* PSG_H */

/* End of file. */
