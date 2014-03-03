/* 
   
ui.c - The emulator user interface.

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
#include "ui_menu.h"
#include "ui_panel.h"
#include "ui_vdu.h"
//#include "ui_deb.h" // Obsoleted by DFP
#include "ui_dfp.h"
#include "ui_tty.h"


console_t cons;


static tab_t tabs[] = 
{
	{
		.name = "F1 VDU",
		.hotkey = SDLK_F1,
		.init = ui_tab_vdu_init,
		.focus = ui_tab_vdu_focus,
		.input = ui_tab_vdu_input
	},
	{
		.name = "F2 TTY",
		.hotkey = SDLK_F2,
		.focus = ui_tab_tty_focus,
		.unfocus = ui_tab_tty_unfocus,
		.tick = ui_tab_tty_tick,
		.input = ui_tab_tty_input
	},
	// {
	// 	.name = "F10 DEB",
	// 	.hotkey = SDLK_F10,
	// 	.focus = ui_tab_deb_focus,
	// 	.unfocus = ui_tab_deb_unfocus,
	// 	.tick = ui_tab_deb_tick,
	// 	.input = ui_tab_deb_input
	// },
	{
		.name = "F3 DFP",
		.hotkey = SDLK_F3,
		.focus = ui_tab_dfp_focus,
		.unfocus = ui_tab_dfp_unfocus,
		.tick = ui_tab_dfp_tick,
		.input = ui_tab_dfp_input
	},
	{
		.name = "F4 Panel",
		.hotkey = SDLK_F4,
		.focus = ui_tab_panel_focus,
		.unfocus = ui_tab_panel_unfocus,
		.tick = ui_tab_panel_tick,
		.input = ui_tab_panel_input,
	},

	{
		.name = "F10 Menu",
		.hotkey = SDLK_F10,
		.focus = ui_tab_menu_focus,
		.input = ui_tab_menu_input,
		.unfocus = ui_tab_menu_unfocus
	},

	{
		.name = NULL
	}
};


///////////////////////////////////////////////////////////////////////////////
//
// LOW-LEVEL FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////

static framebuffer_t * _fb;

void
ui_use_status()
{
	_fb = &v.fb_status;
}


void
ui_use_menu()
{
	_fb = &v.fb_menu;
}


void
ui_fill(int x, int y, int w, int h, int attr, int c)
{
	int xi, yi, ofs;
	
	for (yi = 0; yi < h; yi++) {
		ofs = vector(x, y + yi);
		for (xi = 0; xi < w; xi++, ofs++) {
			if (attr >= 0) _fb->c[ofs] = attr;
			if (c >= 0) _fb->b[ofs] = c;
		}
	}
}


void
ui_xycput(int x, int y, int attr, int c)
{
	int ofs = vector(x, y);
	if (attr >= 0) _fb->c[ofs] = attr;
	if (c >= 0) _fb->b[ofs] = c;
}


void
ui_cls(int attr)
{
	ui_fill(0, 0, UI_COLS, UI_ROWS, attr, 32);
}


void
ui_status_cls()
{
	ui_use_status();
	ui_fill(0, UI_ROWS, UI_COLS, UI_STATUS_ROWS, ATTR_STATUS, 32);
}


void
ui_xycputs(int x, int y, word attr, const char *s)
{
	int ofs = vector(x, y);
	while (*s) {
		_fb->c[ofs] = attr;
		_fb->b[ofs] = *s;
		ofs++;
		s++;
	}
}


void
ui_gotoxy(int x, int y)
{
	_fb->car = vector(x, y);
}


void
ui_xycprintf(int x, int y, word attr, const char *fmt, ...)
{
	va_list ap;
	char * buf;

	va_start(ap, fmt);
	vasprintf(&buf, fmt, ap);
	va_end(ap);

	assert(buf != NULL);
	ui_xycputs(x, y, attr, buf);
	free(buf);
}


void
ui_xycprintfr(int r, int y, word attr, const char *fmt, ...)
{
	va_list ap;
	char * buf;

	va_start(ap, fmt);
	vasprintf(&buf, fmt, ap);
	va_end(ap);

	ui_xycputs(r - strlen(buf), y, attr, buf);
	free(buf);
}


///////////////////////////////////////////////////////////////////////////////
//
// MID-LEVEL FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////


void
ui_show_tabs()
{
	int row = 0;
	int pitch = 12;

	ui_use_status();
	ui_fill (0, row, UI_COLS, 1, ATTR_STATUS, 32);
	int i;
	for (i = 0; tabs[i].name != NULL; i++){
		ui_xycprintf(i * pitch, row,
			       i == cons.tab? ATTR_TAB_ACTIVE : ATTR_TAB,
			       "\014 %-9.9s\012", tabs[i].name);
		ui_xycput(i * pitch, row,
			    i == cons.tab? color(COL_ORANGE, COL_DKGREY) : color(COL_LTGREY, COL_DKGREY),
			    -1);
		ui_xycput(i * pitch + pitch - 1, row,
			    i == cons.tab? color(COL_ORANGE, COL_DKGREY) : color(COL_LTGREY, COL_DKGREY),
			    -1);
	}
	ui_use_menu();
}


void ui_init()
{
	cons.tab = 0;
	cons.oldtab = 0;
	cons.menu_sel = 0;
	cons.menu_entries = 0;
	cons.menu = NULL;
	cons.menu_x = 20;
	cons.menu_y = 3;

	/* Per the CFT Book */
	v.fb_menu.mcr0 = MCR0_80x30;
	v.fb_menu.mcr1 = 0;
	v.fb_menu.scr0 = 0;
	v.fb_menu.sar0 = 0;
	v.fb_menu.mar0 = 0xffff;
	v.fb_menu.mar1 = 0xffff;
	v.fb_menu.ccr = CCR_CURSOR_BLINK_FAST | color(COL_BLACK, COL_ORANGE);
	v.fb_menu.car = 0;

	ui_use_status();
	v.fb_status.mcr0 = MCR0_80x30;
	v.fb_status.mcr1 = 0;
	v.fb_status.ccr = 0;
	v.fb_status.car = 65535;
	ui_cls(ATTR_BG);
	ui_xycprintfr(80, 1, color(0, COL_ORANGE), " CFT Emulator " VERSION " ");

	ui_use_menu();
	ui_cls(ATTR_BG);
	ui_status_cls();
	ui_show_tabs();

	v.dirty++;
	v.stdirty++;

	/* Initialise all the tabs */

	int i;
	for (i = 0; tabs[i].name != NULL; i++) {
		CB_RUN(tabs[i].init)();
	}
}


void
ui_show_menu()
{
	menu_t * menu = cons.menu;
	int x = cons.menu_x;
	int y = cons.menu_y;
	int i;
	char buf[256];

	for (i = 0; menu->name != NULL; i++, y++, menu++) {
		// Separator
		if (!menu->name[0]) continue;
		
		strcpy(buf, menu->name);
		if (menu->getval) {
			strcat(buf, ": ");
			strcat(buf, (*menu->getval)(menu->key));
		}

		if (i == cons.menu_sel) {
			ui_gotoxy(x-1, y);
		}

		if (menu->disabled) {
			ui_xycputs(x, y,
				   i == cons.menu_sel ? ATTR_SEL_DISABLED : ATTR_DISABLED,
				   buf);
			continue;
		}
		ui_xycputs(x, y, i == cons.menu_sel ? ATTR_SEL : ATTR_MENU, buf);

		if (menu->shortcut) {
			char *cp;
			for (cp = buf; *cp; cp++) *cp = tolower(*cp);
			int j = strchr(buf, tolower(menu->shortcut)) - buf;
			if (j >= 0) 
				ui_xycput(x + j, y,
					  i == cons.menu_sel ? ATTR_SEL_SHORTCUT : ATTR_SHORTCUT, -1);
		}
	}
	cons.menu_entries = i;

	v.dirty++;
}


void
ui_menu_do(menu_t * menu)
{
	if (cons.menu != menu) {
		cons.menu = menu;
		cons.menu_sel = 0;
	}
	ui_show_menu();
}


void
ui_menu_move(int d)
{
	int i;
	for (i = 0; i < cons.menu_entries; i++) {
		cons.menu_sel += d;
		if (cons.menu_sel < 0) cons.menu_sel = cons.menu_entries - 1;
		else if (cons.menu_sel >= cons.menu_entries) cons.menu_sel = 0;
		if (cons.menu[cons.menu_sel].disabled) continue;
		if (cons.menu[cons.menu_sel].name[0] == '\0') continue;
		break;
	}
	ui_show_menu();
}


void
ui_tab(int i)
{
	CB_RUN(tabs[cons.tab].unfocus)();
	v.dirty++;
	if (cons.tab != i) cons.oldtab = cons.tab;
	cons.tab = i;
	CB_RUN(tabs[cons.tab].focus)();
	v.dirty++;
	ui_show_tabs();
	v.stdirty++;
}



static void
ui_key(SDL_Event event)
{
	SDL_keysym * k = &event.key.keysym;
	
	// Quit?
	if ((k->sym == 'c' || k->sym == '\\') &&
	    (k->mod & (KMOD_CTRL|KMOD_LCTRL|KMOD_RCTRL))) {
		quit(0);
	} else

	// Handle global keys
	if ((k->mod == KMOD_LALT || k->mod == KMOD_RALT)) {
		switch (k->sym) {
		case SDLK_F1:
			start_cpu();
			return;
		case SDLK_F2:
			halt_cpu();
			return;
		case SDLK_F12:
			reset_cpu();
			return;
		}
	} else {
		// Handle tab hotkeys
		int i;
		for (i = 0; tabs[i].name != NULL; i++){
			if (k->mod == 0 && k->sym == tabs[i].hotkey) {
				ui_tab(i);
				return;
			}
		}
	}

	/* printf("The %s key was pressed (state=%x (%x))!\n", */
	/*        SDL_GetKeyName(k->sym), k->mod, KMOD_CTRL); */
}



int colorscale[10] = {
	rgb(0,0,0),
	rgb(1,0,0),
	rgb(2,0,0),
	rgb(3,0,0),
	rgb(3,1,0),
	rgb(3,2,0),
	rgb(3,3,0),
	rgb(3,3,1),
	rgb(3,3,2),
	rgb(3,3,3),
};


void
ui_tick()
{
	static int delay = 0;
	static int first = 1;

	delay++;

	if (delay > 20) {
		delay = 0;
		// Draw the status line
		int i, x;
		ui_use_status();
		for (i = 0; iodevs[i].name; i++) {
			if (first || iodevs[i].hits) {
				x = min(iodevs[i].hits / 100, 9);
				ui_xycprintf(i * 5, 1,
					     color(colorscale[x], COL_DKGREY), iodevs[i].code);
				iodevs[i].hits = max(0, iodevs[i].hits - 60);
				v.stdirty++;
			}
		}
		first = 0;
		ui_use_menu();
	}

	// Tick the current tab.
	CB_RUN(tabs[cons.tab].tick)();

	SDL_Event event;
	if (!SDL_PollEvent (&event)) return;

	//fprintf(stderr, "keysym=%d, type=%d\n", event.key.keysym.sym, event.type);

	switch (event.type) {
	case SDL_KEYDOWN:
		ui_key(event);
		break;

	case SDL_QUIT:
		quit(0);
		break;
	}

	// Let the current tab process the event first.
	if (tabs[cons.tab].input) {
		if ((*tabs[cons.tab].input)(&event)) return;
	}
}


void ui_done()
{
}


/* End of file. */
