/* 

uterm.h - A tiny terminal emulator used to log TTY data.

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

#ifndef UTERM_H
#define UTERM_H 1


#include <stdint.h>
#include <sys/types.h>

#include <SDL.h>

#include "cftemu.h"


#define UTERM_WIDTH 80
#define UTERM_HEIGHT 30
#define UTERM_SBRATE (UTERM_HEIGHT >> 1)


typedef struct {
	uint16_t c[UTERM_WIDTH];
	uint8_t  b[UTERM_WIDTH];
} uterm_line_t;


#define UT_MAGIC 0x11223344

#define ATTR_DEFAULT 42

typedef struct {
	uint32_t       magic;
	uterm_line_t * screen;
	uint32_t       numlines;  // Size of screen.

	int            bs;	  // Backscroll flag
	uint32_t       topline0;  // Pre-scrollback top line
	uint32_t       topline;   // Top line last drawn

	uint32_t       cursline;  // Cursor line in the ring buffer
	uint8_t        cursofs;	  // Cursor X position (0..79)
	
	int            dirty;	  // Terminal written to since last draw.
	
	int            wrapped;   // Has the terminal just wrapped around?

	int            state;	  // Directive parser state
	char           buf[256];  // Directive argument buffer
	int            bp;	  // Buffer pointer

	int            fg;	  // Current foreground
        int            bg;	  // Current background
	int            bold;	  // Bold state
	int            blink;	  // Blink state
	int            inv;	  // Inverse state

	word           attr;	  // Current attribute
	
} uterm_t;


uterm_t * uterm_new(int lines);

void uterm_destroy(uterm_t *);

word uterm_setattr(uterm_t *, word attr);

int uterm_handle_event(uterm_t *ut, SDL_Event *event);

void uterm_putc(uterm_t *ut, word c);

void uterm_write(uterm_t *, char * buf);

void uterm_draw(uterm_t *ut, uint8_t *b, uint16_t *c,
		int x0, int y0, int w, int h,
		int *xc, int *yc);

void uterm_home(uterm_t *ut);

void uterm_clrscr(uterm_t *ut);

void uterm_clreol(uterm_t *ut);

#endif // UTERM_H

// End of file.
