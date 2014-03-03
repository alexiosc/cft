/* 
   
ui_dfp.c - Debugging Front Panel, UI implementation.

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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h> 
#include <unistd.h>
#include <assert.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>
#include <time.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <stdarg.h>

#include <SDL.h>

#include "io.h"
#include "fifo.h"
#include "video.h"
#include "cftemu.h"
#include "mbu.h"
#include "panel.h"
#include "emulator.h"
#include "util.h"
#include "uterm.h"
#include "ui.h"
#include "ui_dfp.h"


extern uterm_t * dfp_term;


///////////////////////////////////////////////////////////////////////////////
//
// CALLBACKS
//
///////////////////////////////////////////////////////////////////////////////

static void
_ui_tab_dfp_draw()
{
	int xc, yc;
	
	if (dfp_term->dirty) {
		uterm_draw(dfp_term,
			   v.fb_menu.b,
			   v.fb_menu.c,
			   0, 0, UTERM_WIDTH, UTERM_HEIGHT,
			   &xc, &yc);
		ui_gotoxy(xc, yc);
		v.dirty++;
	}
}


void
ui_tab_dfp_focus()
{
	v.fb = &v.fb_menu;
	ui_cls(color(0, 0));
	ui_gotoxy(0, 0);
	dfp_term->dirty++;
	_ui_tab_dfp_draw();
	v.dirty++;
}


void
ui_tab_dfp_unfocus()
{
}


void
ui_tab_dfp_tick()
{
	_ui_tab_dfp_draw();
}


int
ui_tab_dfp_input(SDL_Event * event)
{
	if (event->type == SDL_KEYDOWN && (event->key.keysym.sym <= 0x7f)) {
		char buf[2];
		buf[1] = 0;
		buf[0] = event->key.keysym.unicode & 0x7f;
		uterm_write(dfp_term, buf);
		_ui_tab_dfp_draw();
	}
	return 0;
}


/* End of file. */
