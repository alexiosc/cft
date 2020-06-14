/* 
   
ui_vdu.c - The VDU tab of the user interface.

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


typedef struct {
	int keysym;
	int extended;		/* 0xE0 starts the sequence for extended keys */
	uint8_t scancode;
} ps2_scancode_t;


typedef struct {
	int make;		/* 1 = make, 0 = break */
	int ofs;		/* How many bytes of sequence sent so far */
	ps2_scancode_t * key;
} key_event_t;

#define BUFSIZE 16		/* Same as most keyboards */
uint8_t kbdbuf[BUFSIZE];
int bp;				/* Buffer pointer */


static int
kbdbuf_full()
{
	return (bp + 3) >= BUFSIZE;
}

void
kbdbuf_push(uint8_t x)
{
	//fprintf(stderr, "KBD PUT (bp=%d): 0x%02x\n", bp, x);
	kbdbuf[bp++] = x;
}

#define PUT kbdbuf_push


int
kbdbuf_put(int make, ps2_scancode_t * key)
{
	if (kbdbuf_full()) return 0;

	if (key->extended) PUT(0xe0);
	if (!make) PUT(0xf0);
	PUT(key->scancode);

	return 1;
}


int
kbdbuf_get()
{
	uint8_t x;

	if (bp == 0) return -1;

	x = kbdbuf[0];
	bp--;

	//fprintf(stderr, "KBD GET (bp=%d): 0x%02x\n", bp, x);
	if (bp) memcpy(kbdbuf, &kbdbuf[1], sizeof(uint8_t) * bp);

#if 0
	printf("*** buflen=%d: buf: ", bp);
	int i;
	for (i = 0; i < bp; i++) printf("%02x ", kbdbuf[i]);
	printf("\n");
#endif

	return x;
}


void
ui_tab_vdu_init()
{
	printf("VDU Init\n");
	bp = 0;
	PUT(0xaa);		/* Simulate BAT success */
}


void
ui_tab_vdu_focus()
{
	//printf("VDU Focus\n");
	v.fb = &v.fb_cft;
}


int
ui_tab_vdu_autofocus()
{
	return vdu_dirty;
}


int
ui_tab_vdu_query()
{
	return video;
}


// Translation table for AT-style (set 2) keyboards.
ps2_scancode_t set2[] = {
	{'a', 0, 0x1c},
	{'b', 0, 0x32},
	{'c', 0, 0x21},
	{'d', 0, 0x23},
	{'e', 0, 0x24},
	{'f', 0, 0x2b},
	{'g', 0, 0x34},
	{'h', 0, 0x33},
	{'i', 0, 0x43},
	{'j', 0, 0x3b},
	{'k', 0, 0x42},
	{'l', 0, 0x4b},
	{'m', 0, 0x34},
	{'n', 0, 0x31},
	{'o', 0, 0x44},
	{'p', 0, 0x4d},
	{'q', 0, 0x15},
	{'r', 0, 0x2d},
	{'s', 0, 0x1b},
	{'t', 0, 0x2c},
	{'u', 0, 0x3c},
	{'v', 0, 0x2a},
	{'w', 0, 0x1d},
	{'x', 0, 0x22},
	{'y', 0, 0x35},
	{'z', 0, 0x1a},

	{'0', 0, 0x45},
	{'1', 0, 0x16},
	{'2', 0, 0x1e},
	{'3', 0, 0x26},
	{'4', 0, 0x25},
	{'5', 0, 0x2e},
	{'6', 0, 0x36},
	{'7', 0, 0x37},
	{'8', 0, 0xe3},
	{'9', 0, 0x46},

	{SDLK_BACKQUOTE, 0, 0x0e},
	{SDLK_MINUS, 0, 0x4e},
	{SDLK_EQUALS, 0, 0x55},
	{SDLK_BACKSLASH, 0, 0x5d},
	{SDLK_BACKSPACE, 0, 0x66},
	{SDLK_SPACE, 0, 0x29},
	{SDLK_TAB, 0, 0x0d},
	{SDLK_CAPSLOCK, 0, 0x58},
	{SDLK_RETURN, 0, 0x5a},
	{SDLK_ESCAPE, 0, 0x76},

	{SDLK_LSHIFT, 0, 0x12},
	{SDLK_RSHIFT, 0, 0x59},
	{SDLK_LCTRL, 0, 0x14},
	{SDLK_RCTRL, 1, 0x14},
	{SDLK_LALT, 0, 0x11},
	{SDLK_RALT, 1, 0x11},
	{SDLK_LSUPER, 1, 0x1f},	/* Left Win key */
	{SDLK_RSUPER, 1, 0x27},


	{SDLK_F1, 0, 0x05},
	{SDLK_F2, 0, 0x06},
	{SDLK_F3, 0, 0x04},
	{SDLK_F4, 0, 0x0c},
	{SDLK_F5, 0, 0x03},
	{SDLK_F6, 0, 0x0b},
	{SDLK_F7, 0, 0x83},
	{SDLK_F8, 0, 0x0a},
	{SDLK_F9, 0, 0x01},
	{SDLK_F10, 0, 0x09},
	{SDLK_F11, 0, 0x78},
	{SDLK_F12, 0, 0x07},

	/* Special treatment for these. */
	//{SDLK_PRINT, 0, 0x0e},
	//{SDLK_PAUSE, 0, 0x7e},

	{SDLK_SCROLLOCK, 0, 0x7e},

	{SDLK_LEFTBRACKET, 0, 0x54}, /* [ */
	{SDLK_RIGHTBRACKET, 0, 0x5b}, /* [ */
	{SDLK_SEMICOLON, 0, 0x4c},
	{SDLK_QUOTE, 0, 0x52},
	{SDLK_COMMA, 0, 0x41},
	{SDLK_PERIOD, 0, 0x49},
	{SDLK_SLASH, 0, 0x4a},

	{SDLK_INSERT, 1, 0x70},
	{SDLK_HOME, 1, 0x6c},
	{SDLK_PAGEUP, 1, 0x7d},
	{SDLK_DELETE, 1, 0x71},
	{SDLK_END, 1, 0x69},
	{SDLK_PAGEDOWN, 1, 0x7a},
	{SDLK_UP, 1, 0x75},
	{SDLK_DOWN, 1, 0x6b},
	{SDLK_LEFT, 1, 0x72},
	{SDLK_RIGHT, 1, 0x74},

	{SDLK_NUMLOCK, 0, 0x77},
	{SDLK_KP_DIVIDE, 1, 0x4a},
	{SDLK_KP_MULTIPLY, 0, 0x7c},
	{SDLK_KP_MINUS, 0, 0x7b},
	{SDLK_KP_PLUS, 0, 0x79},
	{SDLK_KP_ENTER, 1, 0x5a},
	{SDLK_KP_PERIOD, 0, 0x71},
	{SDLK_KP0, 0, 0x70},
	{SDLK_KP1, 0, 0x69},
	{SDLK_KP2, 0, 0x72},
	{SDLK_KP3, 0, 0x7a},
	{SDLK_KP4, 0, 0x6b},
	{SDLK_KP5, 0, 0x73},
	{SDLK_KP6, 0, 0x74},
	{SDLK_KP7, 0, 0x6c},
	{SDLK_KP8, 0, 0x75},
	{SDLK_KP9, 0, 0x7d},

	{0, 0, 0}
};



int
ui_tab_vdu_input(SDL_Event * event)
{
	if (event->type == SDL_KEYDOWN || event->type == SDL_KEYUP) {
		int i;
		//fprintf(stderr, "keysym=%d\n", event->key.keysym.sym);

		for (i = 0; set2[i].keysym != 0; i++) {
			if (set2[i].keysym == event->key.keysym.sym) {
				kbdbuf_put(event->type == SDL_KEYDOWN, &set2[i]);
				return 1;
			}
		}
	}

	return 0;
}


// End of file.
