/* 

dfp.h - Emulate the Debugging Front Panel subsystem

Copyright (C) 2014 Alexios Chouchoulas

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

#ifndef DFP_H
#define DFP_H 1


#include <stdint.h>
#include <sys/types.h>


extern int      dfp_enabled;
extern int      dfp_pts;
extern uint16_t reg_features;
extern uint16_t reg_sr;
extern uint16_t reg_or;
extern uint16_t reg_dsr;

#define FTR_HOB 0x0001
#define FTR_TRC 0x0010
#define FTR_UTR 0x0020
#define FTR_HOS 0x0200

#define QEF_BASE 0xd0ff

#define QEF_HOF  0x0100
#define QEF_HOS  0x0200
#define QEF_LOCK 0x0400


void dfp_init();

int dfp_write(uint16_t addr, uint16_t data);

int dfp_read(uint16_t addr, uint16_t * data);

void dfp_tick(int tick);

void dfp_done();


#endif /* DFP_H */

/* End of file. */
