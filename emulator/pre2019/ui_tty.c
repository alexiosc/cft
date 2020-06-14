/* 
   
ui_tty.c - The Debugging card.

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
#include "ui_tty.h"
#include "duart.h"


///////////////////////////////////////////////////////////////////////////////
//
// CALLBACKS
//
///////////////////////////////////////////////////////////////////////////////

static void
_ui_tab_tty_draw()
{
	int xc, yc;
	
	if (uart[0].term->dirty) {
		uterm_draw(uart[0].term,
			   v.fb_menu.b,
			   v.fb_menu.c,
			   0, 0, UTERM_WIDTH, UTERM_HEIGHT,
			   &xc, &yc);
		if (yc >= 0) {
			ui_cursor(1);
			ui_gotoxy(xc, yc);
		} else {
			ui_cursor(0);
		}
		v.dirty++;
	}
}


void
ui_tab_tty_focus()
{
	v.fb = &v.fb_menu;
	ui_cls(color(0, 0));
	ui_gotoxy(0, 0);
	uart[0].term->dirty++;
	_ui_tab_tty_draw();
	v.dirty++;
}


void
ui_tab_tty_unfocus()
{
}


int
ui_tab_tty_autofocus()
{
	return uart[0].term->dirty > 1;
}


void
ui_tab_tty_tick()
{
	_ui_tab_tty_draw();
}


int
ui_tab_tty_input(SDL_Event * event)
{
	if (event->type == SDL_KEYDOWN && (event->key.keysym.sym <= 0x7f)) {
		/* int i; */
		/* for (i = 0; i < NUM_UARTS; i++) { */
		/* 	if (uart[i].is_stdin) { */
		/* 		uart_rx(&uart[i], */
		/* 			event->key.keysym.unicode & 0x7f); */
		/* 	} */
		/* } */

		// TODO: make this more generic.
		duartdebug("Unit %d Rx %02x\n", 0, event->key.keysym.unicode & 0x7f);
		uart_rx(0, &uart[0],
			event->key.keysym.unicode & 0x7f);
	}
	return 0;
}


/* End of file. */
