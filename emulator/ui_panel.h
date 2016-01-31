/* 

ui_panel.h - The emulated front panel

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

#ifndef UI_PANEL_H
#define UI_PANEL_H 1


#include <SDL.h>


void ui_tab_panel_focus();

void ui_tab_panel_unfocus();

void ui_tab_panel_tick();

int ui_tab_panel_input(SDL_Event * event);

typedef enum { mfd_or, mfd_dr, mfd_uaddr } mfd_t;

typedef struct {
	int ticks;

	mfd_t mfdsrc;

	int uvec[MICROCODE_TOTALSIGS];
	int aext[8];
	int mben;

	int fn, fz, fv, fi, fl;

	int pc[16];
	int ac[16];
	int mfd[16];
	int ir[16];

	uint16_t sr;		// The SR is just a bitmap.
	int      sr_curs;	// SR cursor
	int      sr_acurs;	// SR text cursor
	char     sr_a[5];	// SR text parse field
} panel_t;

extern panel_t pd;

#endif /* UI_PANEL_H */

/* End of file. */
