/* 
   
uterm.c - A tiny terminal emulator used to log TTY data.

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
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <time.h> 
#include <stdarg.h>
#include <sys/types.h>
#include <assert.h>

#include "cftemu.h"
#include "io.h"
#include "video.h"
#include "debug.h"
#include "util.h"
#include "uterm.h"


uterm_t * uterm_new(int lines)
{
	uterm_t * ut;

	if ((ut = malloc(sizeof(uterm_t))) == NULL) {
		fail("Unable to allocate %lu bytes for terminal buffer: %s\n",
		     sizeof(uterm_t), strerror(errno));
	}

	assert (ut != NULL);
	if ((ut->screen = calloc(lines, sizeof(uterm_line_t))) == NULL) {
		fail("Unable to allocate %lu bytes for terminal scrollback: %s\n",
		     lines * sizeof(uterm_line_t), strerror(errno));
	}
	assert (ut->screen != NULL);

	ut->magic = UT_MAGIC;
	ut->numlines = lines;

	ut->topline = ut->numlines - UTERM_HEIGHT;

	ut->bsofs = 0;

	ut->dirty = 1;

	ut->attr = ATTR_DEFAULT;
	ut->blink = 0;
	ut->inv = 0;
	ut->bold = 0;

	// Clear the screen.
	uterm_home(ut);
	uterm_clrscr(ut);

	return ut;
}


word
uterm_setattr(uterm_t *ut, word attr)
{
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);

	int oldattr = ut->attr;
	ut->attr = attr;
	return oldattr;
}


void
uterm_home(uterm_t *ut)
{
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);

	ut->cursofs = 0;
	ut->cursline = ut->numlines - UTERM_HEIGHT;
}

	
static void
_clr(uterm_t *ut, int y0, int y1)
{
	int i;
	int j;

	for (i = y0; i < y1; i++) {
		for (j = 0; j < UTERM_WIDTH; j++) {
			ut->screen[i].b[j] = 32;
			ut->screen[i].c[j] = ut->attr;
		}
	}
}


void
uterm_clrscr(uterm_t *ut)
{
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);
	_clr(ut, 0, ut->numlines);
}


void
uterm_clrbelow(uterm_t *ut)
{
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);
	_clr(ut, ut->cursline, ut->numlines);
}


void
uterm_clrabove(uterm_t *ut)
{
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);
	_clr(ut, 0, ut->cursline);
}


void
uterm_clreol(uterm_t * ut)
{
	int i;
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);
	for (i = ut->cursofs; i < UTERM_WIDTH; i++) {
		ut->screen[ut->cursline].b[i] = 32;
		ut->screen[ut->cursline].c[i] = ut->attr;
	}
}


void
uterm_destroy(uterm_t * ut)
{
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);
	free (ut->screen);
	free (ut);
}


#define NEXTLINE(ut, n) ((n) = ((n) + 1) % ((ut)->numlines))


void
uterm_scroll(uterm_t *ut)
{
	int i;

	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);

	/* Scroll lines */
	for (i = 1; i < ut->numlines; i++) {
		memcpy(&ut->screen[i - 1], &ut->screen[i], sizeof(uterm_line_t));
	}

	/* Clear the bottom line */
	for (i = 0; i < UTERM_WIDTH; i++) {
		ut->screen[ut->numlines - 1].b[i] = 32;
		ut->screen[ut->numlines - 1].c[i] = ut->attr;
	}
}


void 
uterm_nl(uterm_t * ut)
{
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);
	
	ut->cursofs = 0;
	ut->cursline++;
	if (ut->cursline >= ut->numlines) {
		ut->cursline = ut->numlines - 1;
		uterm_scroll(ut);
	}
}


#define ADIM 2
#define AINT 3
static void
_setattr(uterm_t * ut)
{
	word fg, bg;

	/* Set normal/intense colours */
	fg = rgb(ut->fg & 1 ? (ut->bold ? AINT : ADIM) : 0,
		 ut->fg & 2 ? (ut->bold ? AINT : ADIM) : 0,
		 ut->fg & 4 ? (ut->bold ? AINT : ADIM) : 0);

	bg = rgb(ut->bg & 1 ? (ut->bold ? AINT : ADIM) : 0,
		 ut->bg & 2 ? (ut->bold ? AINT : ADIM) : 0,
		 ut->bg & 4 ? (ut->bold ? AINT : ADIM) : 0);

	ut->attr = color(fg, bg);

	/* Handle inverse */
	if (ut->inv) ut->attr |= CPL_INV;
	if (ut->blink) ut->attr |= CPL_BLN;

	//info("**** ATTR=%04x\n", ut->attr);
}


static void
_csim(uterm_t * ut)
{
	char *cp, *tok;
	int ps;

	ut->buf[ut->bp] = '\0';
	//info("buf=(%s)\n", ut->buf);
	tok = strtok_r(ut->buf, ";", &cp);
	while (tok != NULL) {
		// Valid?
		if (strspn(tok, "0123456789") != strlen(tok)) {
			ut->state = 0;
			return;
		}
		ps = atoi(tok);
		tok = strtok_r(NULL, ";", &cp);
		//info("Got: (%d)\n", ps);
		switch(ps) {
		case 0:		/* Reset attributes */
			ut->fg = 7;
			ut->bg = 0;
			ut->blink = 0;
			ut->inv = 0;
			ut->bold = 0;
			break;
		case 1:		/* Bold */
			ut->bold = 1;
			break;
		case 4:		/* No underlining support */
			break;
		case 5:		/* Blink */
			ut->blink = 1;
			break;
		case 7:		/* Inverse */
			ut->inv = 1;
			break;
		case 8:		/* Invisible not implemented */
			break;
		case 22:	/* Cancel bold */
			ut->bold = 0;
			break;
		case 24:	/* No underlining support */
			break;
		case 25:	/* Cancel blink */
			ut->blink = 0;
			break;
		case 27:	/* Cancel inverse */
			ut->inv = 0;
			break;
		case 28:	/* Invisible not implemented */
			break;
		case 30:	/* Set foreground */
		case 31:
		case 32:
		case 33:
		case 34:
		case 35:
		case 36:
		case 37:
			ut->fg = ps - 30;
			break;
		case 39:	/* Set default foreground */
			ut->fg = 7;
			break;
		case 40:	/* Set background */
		case 41:
		case 42:
		case 43:
		case 44:
		case 45:
		case 46:
		case 47:
			ut->bg = ps - 40;
			break;
		case 49:	/* Set default background */
			ut->bg = 0;
			break;

		default:	/* Unsupported Ps codes */
			warning("uterm: unsupported Ps code: Esc [ %d m\n", ps);
			break;
		}
		_setattr(ut);
	}
}


void
uterm_putc(uterm_t *ut, word c)
{
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);

	/* Yes, I use gotos once every 500,000 lines of code. Get over it. It's
	 * faster than a flag and loop, and can be easier to understand. */
uterm_putc_again:

	if (ut->state == 0) {
		switch(c) {
		case '\n':
		case '\r':
			uterm_nl(ut);
			break;
			
		case '\b':
			if (ut->cursofs) ut->cursofs--;
			break;
			
		case '\a':		/* Bell */
			break;
			
		case '\e':
			ut->state = 1;
			ut->dirty--;
			break;
			
		default:
			ut->screen[ut->cursline].b[ut->cursofs] = c;
			ut->screen[ut->cursline].c[ut->cursofs] = ut->attr;
			if (++ut->cursofs >= UTERM_WIDTH) {
				uterm_nl(ut);
				/* ut->cursofs = 0; */
				/* ut->cursline++; */
			}
		}

	} else if (ut->state == 1) {

		switch(c) {
		case '[':
			ut->state = 2;
			ut->bp = 0;
			ut->dirty--;
			break;

		default:
			/* Fall through and let the state 0 handler deal with this. */
			warning("ESC %c not yet implemented.\n", c);
			ut->state = 0;
			break;
		}
		
	} else if (ut->state == 2) {

		switch(c) {
		case 'H':
			ut->cursline = ut->topline;
			ut->cursofs = 0;
			ut->state = 0;
			break;

		case 'J':
			if (!ut->buf[0]) strcpy(ut->buf, "0");
			switch(atoi(ut->buf)) {
			case 1:
				uterm_clrabove(ut);
				ut->state = 0;
				break;
			case 2:
				uterm_clrscr(ut);
				ut->state = 0;
				break;
			default:
				uterm_clrbelow(ut);
				ut->state = 0;
				break;
			}

		case 'm':
			_csim(ut);
			break;

		case '0':
		case '1':
		case '2':
		case '3':
		case '4':
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
		case ';':
			/* Some other character. Buffer it. */
			if ((ut->bp + 2) < sizeof(ut->buf)) {
				ut->buf[ut->bp++] = c;
				//ut->buf[ut->bp] = 0;
				//info("*** buf=(%s), bp=%d, c=%c\n", ut->buf, ut->bp, c);
			} else {
				/* Buffer full. Bail out. */
				ut->state = 0;
			}
			break;

		default:
			warning("ESC [ ... %c not yet implemented.\n", c);
			ut->state = 0;
			goto uterm_putc_again;
		}
	}

	ut->dirty++;
}


void
uterm_write(uterm_t *ut, char * buf)
{
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);
	
	while (*buf) {
		uterm_putc(ut, *buf++);
	}
}


void
uterm_draw(uterm_t *ut, uint8_t *b, uint16_t *c,
	   int x0, int y0, int w, int h,
	   int *xc, int *yc)
{
	int y, line;
	
	assert (ut != NULL);
	assert (ut->magic == UT_MAGIC);
	assert (b != NULL);
	assert (c != NULL);
	assert (xc != NULL);
	assert (yc != NULL);

	/* Optimise */
	if (!ut->dirty) return;
	ut->dirty = 0;

	/* Keep things within limits */
	h = h > UTERM_HEIGHT ? UTERM_HEIGHT : h;
	w = w > UTERM_WIDTH ? UTERM_WIDTH : w;

	line = ut->topline;
	for (y = 0; y < h; y++, line++) {
		memcpy(&b[vector(x0, y + y0)], &ut->screen[line].b, w * sizeof(uint8_t));
		memcpy(&c[vector(x0, y + y0)], &ut->screen[line].c, w * sizeof(uint16_t));
		if (line == ut->cursline) *yc = y0 + y;
	}

	*xc = x0 + ut->cursofs;

	// printf("*** top=%d cursline=%d, c=(%d,%d)\n", ut->topline, ut->cursline, *xc, *yc);
}

/* End of file. */
