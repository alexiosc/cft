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
static void menu_handler_memory(SDL_Event * event, int);
static void menu_handler_csdemo(SDL_Event * event, int);
static void menu_handler_paldemo(SDL_Event * event, int);

static char * menu_getval_hw(int);

static void (*interactive_handler)(SDL_Event *, int) = NULL;


#define GETVAL_MBU 1
#define GETVAL_VDU 2
#define GETVAL_RTC 3
#define GETVAL_NVR 4

static menu_t menu_main[] = {
	{
		.name = "Memory Banking Unit (MBU)",
		//.shortcut = 'M',
		.key = GETVAL_MBU,
		.getval = menu_getval_hw
	},
	{
		.name = "Video Display Unit (VDU)",
		//.shortcut = 'V',
		.key = GETVAL_VDU,
		.getval = menu_getval_hw
	},
	{
		.name = "Real Time Clock (RTC)",
		//.shortcut = 'R',
		.key = GETVAL_RTC,
		.getval = menu_getval_hw
	},
	{
		.name = "Non-Volatile RAM (NVR)",
		//.shortcut = 'N',
		.key = GETVAL_NVR,
		.getval = menu_getval_hw
	},
	MENU_ENTRY_SEPARATOR,
	{
		.name = "View Memory...",
		.shortcut = 'M',
		.key = 0,
		.handler = menu_handler_memory,
	},
	{
		.name = "View Character Set...",
		.shortcut = 'C',
		.key = 0,
		.handler = menu_handler_csdemo,
	},
	{
		.name = "View Colour Palette...",
		.shortcut = 'P',
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


static uint16_t _dump_topaddr = 0;    // Top of page
static uint16_t _dump_cursor = 0;     // Current address cursor
static uint16_t _dump_mark = 0;	      // Mark cursor (to go back)
static uint16_t _dump_type = 0;
static uint16_t _dump_addrcursor = 4; // The address input line cursor
static char _dump_addrent[5] = "0000";

#define NUM_DUMP_TYPES 3

static void
menu_handler_memory(SDL_Event * event, int key)
{
	int pagesize[NUM_DUMP_TYPES] = { 24, 24 * 8, 24 * 8 };
	int linesize[NUM_DUMP_TYPES] = { 1,  8,      8};
	int moved = 0;

	ui_cls(ATTR_BG);

	interactive_handler = menu_handler_memory;
	
	int i, j, a;

	// Display MBU status

	ui_xycprintf(1, 1, color(COL_ORANGE, COL_DKGREY), "MBU: ");
	if (cpu.mbuen) {
		ui_xycprintf(6, 1, color(COL_ORANGE, COL_DKGREY), "On");
	} else {
		ui_xycprintf(6, 1, color(COL_ORANGE, COL_DKGREY), "Off");
	}
	for (i = 0; i < 8; i++) {
		ui_xycprintf(11 + i * 7, 1, color(COL_LTGREY, COL_DKGREY), "%d", i);
		ui_xycprintf(13 + i * 7, 1, color(COL_ORANGE, COL_DKGREY), "%03x",
			     (cpu.mbuen ? cpu.mbusm[i] : cpu.mbuhm[i]) >> 12);
	}

	// Dump
	
	switch (_dump_type) {
	case 0:
		a = _dump_topaddr;
		for (i = 0; i < 24; i++, a++) {
			uint8_t bg = a == _dump_cursor ? COL_BLACK : COL_DKGREY;
			char *s;
			ui_xycprintf(0, 3 + i, color(COL_LTGREY, bg), " %04x", a);
			ui_xycprintf(5, 3 + i, color(COL_ORANGE, bg), " %04x", memory_read(a));
			s = (char *)map_get(a);
			ui_xycprintf(10, 3 + i, color(COL_WHITE, bg), " %-29.29s", s ? s : "");
			
			s = (char *)pasm_get(a);
			ui_xycprintf(39, 3 + i, color(COL_ORANGE, bg), " %-39.39s ", s ? s : "");
		}
		break;
	case 1:
	case 2:
		a = _dump_topaddr;
		for (i = 0; i < 24; i++, a+=8) {
			ui_xycprintf(1, 3 + i, color(COL_LTGREY, COL_DKGREY), "%04x", a);
			for (j = 0; j < 8; j++) {
				int col = color(COL_ORANGE, COL_DKGREY);
				if (a + j == _dump_cursor) col = color(COL_ORANGE, COL_BLACK);
				ui_xycprintf(6 + j * 5, 3 + i, col, "%04x", memory_read(a + j));
			}
			for (j = 0; j < 8; j++) {
				uint16_t c = memory_read(a + j) & 0xff;
				uint16_t col = color(COL_WHITE, COL_DKGREY);
				if (a + j == _dump_cursor) col = color(COL_ORANGE, COL_BLACK);

				if (_dump_type == 1 && !isprint(c)) c = '.';
				else if (c & 0x80) {
					col |= ATTR_INVERT;
					c &= 0x7f;
				}
				ui_xycprintf(46 + j * 2, 3 + i, col, "%c", c);

				c = (memory_read(a + j) >> 8) & 0xff;

				col = color(COL_WHITE, COL_DKGREY);
				if (a + j == _dump_cursor) col = color(COL_ORANGE, COL_BLACK);

				if (_dump_type == 1 && !isprint(c)) c = '.';
				else if (c & 0x80) {
					col |= ATTR_INVERT;
					c &= 0x7f;
				}
				ui_xycprintf(46 + j * 2 + 1, 3 + i, col, "%c", c);
			}
			for (j = 0; j < 8; j++) {
				uint16_t c = memory_read(a + j);
				uint16_t col = color(COL_LTGREY, COL_DKGREY);
				if (a + j == _dump_cursor) col = color(COL_ORANGE, COL_BLACK);

				if (_dump_type == 1 && (c > 255 || !isprint(c))) c = '.';
				else if (c & 0x8000) {
					col |= ATTR_INVERT;
					c &= 0x7fff;
				}
				ui_xycprintf(63 + j, 3 + i, col, "%c", c);
			}
		}
		break;
	}

	switch (event->type) {
	case SDL_KEYDOWN:
		switch (event->key.keysym.sym) {
		case '0': case '1': case '2': case '3': case '4':
		case '5': case '6': case '7': case '8': case '9':
		case 'a': case 'b': case 'c': case 'd': case 'e':
		case 'f': case 'A': case 'B': case 'C': case 'D':
		case 'E': case 'F':
		{
			ui_cursor(1);
			if (_dump_addrcursor >= 4) _dump_addrcursor = 0;
			_dump_addrent[_dump_addrcursor] = event->key.keysym.sym;
			_dump_addrcursor++;
			break;
		}

		case SDLK_BACKSPACE:
			if (_dump_addrcursor > 0) _dump_addrcursor--;
			break;

		case '\n':
		case '\r':
		case SDLK_KP_ENTER:
			_dump_mark = _dump_cursor;
			sscanf(_dump_addrent, "%hx", &_dump_cursor);
			moved = 1;
			break;
			
		case SDLK_ESCAPE:
			interactive_handler = NULL;
			ui_cursor(1);
			menu_return_main(event, key);
			return;

		case 'i':
		case 'I':
			_dump_type = (_dump_type + 1) % NUM_DUMP_TYPES;
			if ((_dump_topaddr + pagesize[_dump_type]) > 0xffff) {
				_dump_topaddr = 0xffff - pagesize[_dump_type];
			}
			moved = 1;
			break;

		case 'g':
		case 'G':
			_dump_mark = _dump_cursor;
			_dump_cursor = memory_read(_dump_cursor);
			moved = 1;
			break;

		case 'm':
		case 'M':
		{
			uint16_t t = _dump_cursor;
			_dump_cursor = _dump_mark;
			_dump_mark = t;
			moved = 1;
			break;
		}

		case 'p':
		case 'P':
		{
			_dump_mark = _dump_cursor;
			_dump_cursor = cpu.pc;
			moved = 1;
			break;
		}

		case SDLK_LEFT:
		case SDLK_KP4:
			_dump_cursor = (_dump_cursor - 1) & 0xffff;
			moved = 1;
			break;

		case SDLK_RIGHT:
		case SDLK_KP6:
			_dump_cursor = (_dump_cursor + 1) & 0xffff;
			moved = 1;
			break;

		case SDLK_UP:
		case SDLK_KP8:
			_dump_cursor = (_dump_cursor - linesize[_dump_type]) & 0xffff;
			moved = 1;
			break;

		case SDLK_KP2:
		case SDLK_DOWN:
			_dump_cursor = (_dump_cursor + linesize[_dump_type]) & 0xffff;
			moved = 1;
			break;
			
		case SDLK_KP9:
		case SDLK_PAGEUP:
			_dump_cursor = (_dump_cursor - pagesize[_dump_type] / 2) & 0xffff;
			moved = 1;
			break;

		case SDLK_KP3:
		case SDLK_PAGEDOWN:
			_dump_cursor = (_dump_cursor + pagesize[_dump_type] / 2) & 0xffff;
			moved = 1;
			break;

		case SDLK_HOME:
			_dump_cursor = 0;
			moved = 1;
			break;

		case SDLK_END:
			_dump_cursor = (0xffff - pagesize[_dump_type]) & 0xffff;
			moved = 1;
			break;
		}
	}

	if (moved) {
		//_dump_topaddr = (_dump_cursor / pagesize[_dump_type]) * pagesize[_dump_type];
		
		if (_dump_cursor < (pagesize[_dump_type] / 2)) _dump_topaddr = 0;
		else if (_dump_cursor + (pagesize[_dump_type] / 2) > 0xffff) {
			_dump_topaddr = (0xffff - pagesize[_dump_type] + 1) & 0xffff;
		} else {
			_dump_topaddr = (_dump_cursor - (_dump_cursor % linesize[_dump_type])) -
				pagesize[_dump_type] / 2;
		}
		_dump_addrcursor = 99;
		ui_cursor(0);
		sprintf(_dump_addrent, "%04x", _dump_cursor);
		
	}

	ui_xycputs(1, 28, color(COL_ORANGE, COL_DKGREY), "D");
	ui_xycputs(2, 28, color(COL_WHITE, COL_DKGREY), "i");
	ui_xycputs(3, 28, color(COL_ORANGE, COL_DKGREY), "splay");
	ui_xycputs(9, 28, color(COL_WHITE, COL_DKGREY), "G");
	ui_xycputs(10, 28, color(COL_ORANGE, COL_DKGREY), "o");
	ui_xycputs(12, 28, color(COL_WHITE, COL_DKGREY), "M");
	ui_xycputs(13, 28, color(COL_ORANGE, COL_DKGREY), "ark");
	ui_xycputs(17, 28, color(COL_WHITE, COL_DKGREY), "P");
	ui_xycputs(18, 28, color(COL_ORANGE, COL_DKGREY), "C");
	

	ui_xycprintf(23, 28, color(COL_LTGREY, COL_DKGREY), "Address");
	if (_dump_addrcursor <= 4) {
		ui_xycprintf(31, 28, color(COL_WHITE, COL_BLACK), " %04s ", _dump_addrent);
	} else {
		ui_xycprintf(31, 28, color(COL_WHITE, COL_DKGREY), " %04s ", _dump_addrent);
	}
	ui_xycprintf(39, 28, color(COL_LTGREY, COL_DKGREY), "Data");
	uint16_t x = memory_read(_dump_cursor);
	char buf[17];
	to_bin(x, buf, 16);
	ui_xycprintf(45, 28, color(COL_ORANGE, COL_DKGREY), "%04x %5u %+6d %16.16s", x, x, (int16_t)x, buf);

	char * s = (char *)map_get(_dump_cursor);
	if (s) ui_xycprintf(1, 29, color(COL_WHITE, COL_DKGREY), "%-80.80s", s);

	//ui_cursor(_dump_cursor <= 4);
	ui_gotoxy(32 + _dump_addrcursor, 28);
		
	v.dirty++;
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
	//printf("Menu Focus\n");
	v.fb = &v.fb_menu;
	menu_return_main(NULL, 0);
}


void
ui_tab_menu_unfocus()
{
	//printf("Menu Unfocus\n");
	cpu.pause--;
}


int
ui_tab_menu_input(SDL_Event * event)
{
	if (interactive_handler != NULL) {
		CB_RUN(interactive_handler)(event, 0);
		return 1;
	}
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
