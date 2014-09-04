/* 
   
   menus.c - The emulator menus.

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


static void menu_handler_quit(SDL_Event * event, int);
static void menu_handler_reset(SDL_Event * event, int);
static void menu_handler_csdemo(SDL_Event * event, int);
static void menu_handler_paldemo(SDL_Event * event, int);

static char * menu_getval_hw(int);

#define GETVAL_MBU 1
#define GETVAL_VDU 2
#define GETVAL_RTC 3
#define GETVAL_NVR 4

static menu_t menu_main[] = {
	{
		.name = "Memory Banking Unit (MBU)",
		.shortcut = 'M',
		.key = GETVAL_MBU,
		.getval = menu_getval_hw
	},
	{
		.name = "Video Display Unit (VDU)",
		.shortcut = 'V',
		.key = GETVAL_VDU,
		.getval = menu_getval_hw
	},
	{
		.name = "Real Time Clock (RTC)",
		.shortcut = 'R',
		.key = GETVAL_RTC,
		.getval = menu_getval_hw
	},
	{
		.name = "Non-Volatile RAM (NVR)",
		.shortcut = 'N',
		.key = GETVAL_NVR,
		.getval = menu_getval_hw
	},
	MENU_ENTRY_SEPARATOR,
	{
		.name = "View Character Set...",
		.shortcut = 'V',
		.key = 0,
		.handler = menu_handler_csdemo,
	},
	{
		.name = "View Colour Palette...",
		.shortcut = 'i',
		.handler = menu_handler_paldemo,
	},
	MENU_ENTRY_SEPARATOR,
	{
		.name = "Reset the computer",
		.shortcut = 'r',
		.handler = menu_handler_reset,
	},
	{
		.name = "Quit the Emulator (Shift + Enter)",
		.handler = menu_handler_quit,
	},
	MENU_ENTRY_END
};


static void menu_return_main(SDL_Event * event, int);

static menu_t menu_back[] = {
	{
		.name = "Back to the Main Menu...",
		.shortcut = 'M',
		.handler = menu_return_main,
	},
};


static menu_t menu_csdemo[] = {
	{
		.name = "Next page",
		.shortcut = 'N',
		.key = 1,
		.handler = menu_handler_csdemo,
	},
	{
		.name = "Previous page",
		.shortcut = 'P',
		.key = -1,
		.handler = menu_handler_csdemo,
	},
	{
		.name = "Back to the Main Menu...",
		.shortcut = 'M',
		.handler = menu_return_main,
	},
};


static void
menu_handler_quit(SDL_Event * event, int key)
{
	if (event->type != SDL_KEYDOWN) return;
	if ((event->key.keysym.mod & (KMOD_LSHIFT|KMOD_RSHIFT|KMOD_SHIFT)) == 0) return;

	printf("Quitting. Thank you for using cftemu.\n\n");
	quit(0);
}


static void
menu_handler_reset(SDL_Event * event, int key)
{
	void menu_tab(int);
	reset_cpu();
	io_reset();
	start_cpu();
	ui_tab(cons.oldtab);
}


static char *
menu_getval_hw(int key)
{
	extern int mbu;
	switch (key) {
	case GETVAL_MBU:
		return mbu ? "installed" : "not installed";
	case GETVAL_VDU:
		return video ? "installed" : "not installed";
	case GETVAL_RTC:
		/* nvram/rtc are the same board for now. */
		return nvram ? "installed" : "not installed";
	case GETVAL_NVR:
		return nvram ? "installed" : "not installed";
	default:
		fail("%s(%d): unknown key", __FUNCTION__, key);
	}
	assert(0);
}


static void
menu_handler_csdemo(SDL_Event * event, int key)
{
	ui_cls(ATTR_BG);
	static int base = 0;

	if (key) base += key * 512;
	//else base = 0;
	base = base & 0x7fff;
	
	int i, j;

	for (i = 0; i < 32; i++) {
		ui_xycprintf(7 + i * 2, 2, color(COL_LTGREY, COL_DKGREY), "%x", i & 0xf);
		if (i > 15) ui_xycprintf(7 + i * 2, 1, color(COL_LTGREY, COL_DKGREY), "%x", i >> 4);
	}
	
	ui_fill(7, 3, 64, 16, color(COL_WHITE, COL_BLACK), -1);
		

	for (j = 0; j < 16; j++) {
		ui_xycprintf(2, 3 + j, color(COL_LTGREY, COL_DKGREY), "%4x", base + j * 32);
		for (i = 0; i < 32; i++) {
			ui_xycput(7 + i * 2, 3 + j, color(COL_WHITE, COL_BLACK), base + j * 32 + i);
		}
	}

	v.dirty++;

	cons.menu_y = 20;
	ui_menu_do(menu_csdemo);
}


static void
menu_handler_paldemo(SDL_Event * event, int key)
{
	int r, g, b;

	ui_cls(ATTR_BG);
	b = 0;
	for (r = 0; r < 4; r++) {
		for (g = 0; g < 4; g++) {
			for (b = 0; b < 4; b++) {
				int col = rgb(r, g, b);
				ui_xycprintf(7 + r*4 + (g)*16, 2+2*b + (0)*8,
					     color((r+(g+1)+(b-1))<3 ? COL_WHITE : COL_BLACK, col), "%2d  ", col);
				ui_xycputs(7 + r*4 + (g)*16, 3+2*b + (0)*8, color(0, col), "    ");
			}
		}
	}
	v.dirty++;

	cons.menu_y = 13;
	ui_menu_do(menu_back);
}


static void
menu_return_main(SDL_Event * event, int key)
{
	cons.menu_x = 20;
	cons.menu_y = 3;
	ui_cls(ATTR_BG);
	ui_menu_do(menu_main);
}



///////////////////////////////////////////////////////////////////////////////
//
// CALLBACKS
//
///////////////////////////////////////////////////////////////////////////////

void
ui_tab_menu_focus()
{
	cpu.pause++;
	printf("Menu Focus\n");
	v.fb = &v.fb_menu;
	menu_return_main(NULL, 0);
}


void
ui_tab_menu_unfocus()
{
	printf("Menu Unfocus\n");
	cpu.pause--;
}


int
ui_tab_menu_input(SDL_Event * event)
{
	switch (event->type) {
	case SDL_KEYDOWN:
		switch (event->key.keysym.sym) {
		case SDLK_UP:
		case SDLK_KP8:
			ui_menu_move(-1);
			return 1;
		case SDLK_DOWN:
		case SDLK_KP2:
			ui_menu_move(1);
			return 1;
		case SDLK_HOME:
			cons.menu_sel = cons.menu_entries - 1;
			ui_menu_move(1);
			return 1;
		case SDLK_END:
			cons.menu_sel = 0;
			ui_menu_move(-1);
			return 1;
		case SDLK_RETURN:
		case SDLK_KP_ENTER:
		case SDLK_SPACE:
			CB_RUN(cons.menu[cons.menu_sel].handler)(event, cons.menu[cons.menu_sel].key);
			return 1;
		default:
		{
			int i;
			for (i = 0; i < cons.menu_entries; i++) {
				if (event->key.keysym.sym == tolower(cons.menu[i].shortcut)) {
					cons.menu_sel = i;
					ui_show_menu();
					CB_RUN(cons.menu[cons.menu_sel].handler)(event, cons.menu[cons.menu_sel].key);
					return 1;
				}
			}
		}
		}
		break;
	}
	/* vdebug("Got event (type=%d) key event %d %d %d\n", event->type, event->key.type, */
	/*        event->key.state, event->key.keysym); */
	return 0;
}



/* End of file. */
