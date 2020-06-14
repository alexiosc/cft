/* 

video.h - Emulates the video card

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

#ifndef VIDEO_H
#define VIDEO_H 1


#include <stdint.h>
#include <sys/types.h>

#include <SDL.h>


#define CHAR_RAM_SIZE 524288	/* 512kB */
#define PLANE_SIZE    65536	/* 64kW */

#define CHAR_RAM_MASK ((CHAR_RAM_SIZE) - 1)
#define PLANE_SIZE_MASK ((PLANE_SIZE) - 1)

#define CURSOR_ON 1
#define BLINK_ON 1

#define MCR_VERSION            0x0005 /* Always read from MCR */
#define MCR_VEN                0x0010 /* Video enable */
#define MCR_40COL	       0x0020 /* 40 column enable */
#define MCR_CLH_MASK	       0x00C0 /* Cell height mask */
#define MCR_CLH_SHIFT	            6 /* least significant bit of CLH field */
#define MCR_CLH16	       0x0000 /*   00 = 16 */
#define MCR_CLH8	       0x0040 /*   01 = 8 */
#define MCR_CLH4	       0x0080 /*   10 = 4 */
#define MCR_CLH2	       0x00C0 /*   11 = 2 */
#define MCR_HGR 	       0x0100 /* Graphics mode. */
#define MCR_8x8                0x0200 /* Select 8x8 font bank */
#define MCR_MASK               0x0400 /* Disable writes to bits 8-15 in B plane */

/* Obvious display modes: */

#define MODE_TEXT_80x25	       MCR_VEN | MCR_CLH16
#define MORE_TEXT_40x25	       MCR_VEN | MCR_40COL | MCR_CLH16
#define MODE_TEXT_80x50	       MCR_VEN | MCR_CLH8
#define MODE_TEXT_40x50	       MCR_VEN | MCR_40COL | MCR_CLH8

#define MCR_HRG_640x400        MCR_VEN | MCR_HGR
#define MCR_LRG_320x200        MCR_VEN | MCR_CLH2
#define MCR_LRG_160x100        MCR_VEN | MCR_40COL | MCR_CLH4


#define CCR_CURSOR_OFF         (0 << 12)
#define CCR_CURSOR_BLINK_SLOW  (1 << 12)
#define CCR_CURSOR_BLINK_FAST  (2 << 12)
#define CCR_CURSOR_ON          (3 << 12)
#define CCR_CURSOR_MASK        CCR_CURSOR_ON
#define CCR_CURSOR_FG          (v.ccr & 0x3f)
#define CCR_CURSOR_BG          ((v.ccr >> 6) & 0x3f)

#define ATTR_BLINK             0x8000
#define ATTR_INVERT            0x4000
#define ATTR_RESERVED2000      0x2000
#define ATTR_RESERVED1000      0x1000
#define ATTR_COL_BG_MASK       0x0fc0
#define ATTR_COL_FG_MASK       0x003f

#define rgb(r,g,b) ((r) & 3) | (((g) & 3) << 2) | (((b) & 3) << 4)
#define color(fg, bg) ((fg) | ((bg) << 6))
/* #define getfg(a) ((a) & 0x3f) */
/* #define getbg(a) (((a) >> 6) & 0x3f) */

/* 

   Registers:

   MCR: 16 bits: Mode Control Register (R/W)

        0-3:   detection pattern (always 1010). Does nothing when written to.
        4:     enables video out when 1.
        5:     40 column mode when 1
        6-7:   cell height (16, 8, 4, or 2)
        8:     High resolution graphics mode. Force cell height to 1.
        9:     0 = 8x16 font, 1 = 16x16 font
        10:    0 = 16-bit access to char data, 1 = mask most significant 8-bits.

      F   E   D   C   B   A   9   8   7   6   5   4   3   2   1   0
    +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
    |                           |   |       |   |   | 1 | 0 | 1 | 0 |
    +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
                                  \     \     \    \
                                   \     \     \    1 = video enable
                                    \     \     1 = 40 column mode
				     \	   00 = 16 rows per cell
                                      \    01 = 8 rows per cell
                                       \   10 = 4 rows per cell
                                        \  11 = 2 rows per cell
                                         \ 1 = 1 row per cell (graphics)

   CAR: 16 bits: Cursor address.
   CCR: 16 bits: Cursor Control Register.
          0-5:   foreground color (ggbbrr, R least significant)
	  6-11:  background color (ggbbrr)
	  12-13: CBM: blink mode
                 00 = steady
                 01 = slow
                 10 = fast
                 11 = off
          14-15: reserved.

      F   E   D   C   B   A   9   8   7   6   5   4   3   2   1   0
    +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
    |       |  CBM  |       BACKGROUND      |       FOREGROUND      |
    +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+



  VWR: upper 4 bits set main memory window into VRAM. Main memory sees
       an 8kW window into 4k of bitmap plane (12 bits) and 4k of
       colour plane.
       
     10   F   E   D   C   B   A   9   8   7   6   5   4   3   2   1   0
    +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
    |     VWR       | 0 |          BITMAP SCREEN PLANE OFFSET           |
    +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
    |     VWR       | 1 |          BITMAP COLOUR PLANE OFFSET           |
    +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
       

*/

typedef struct {
	uint16_t      b[PLANE_SIZE]; /* Bitmap plane */
	uint16_t      c[PLANE_SIZE]; /* Colour plane */

	uint16_t      mcr;
	uint16_t      vwr;
	uint16_t      ssr;	/* Screen start register */
	uint16_t      scr;	/* Scrolling control register (top line addr) */
	uint16_t      ser;	/* Screen end register (resets to screen start) */
	uint16_t      car;
	uint16_t      ccr;
} framebuffer_t;

typedef struct {
	framebuffer_t   fb_cft, fb_menu;
	framebuffer_t * fb;

	uint8_t         cp[CHAR_RAM_SIZE]; /* Character patterns */

	int             dirty;
	int             stdirty;
	int             cursor_blink;
	int             blink;

	SDL_Surface * screen;
	
	SDL_TimerID   refresh_timer;
	SDL_TimerID   blink_timer;
	SDL_TimerID   cursor_timer;

	/* Pixel drawing engine (buf, ofs, r, g, b) -> new ofs */
	int (*drawpixel)(uint8_t *, int, uint8_t, uint8_t, uint8_t);
} video_t;

extern video_t v;

extern int video, video_fs, video_2x, debug_video;

void sdl_init();

void sdl_done();

void video_init();

void video_reset();

int video_isvram(uint32_t physaddr);

word video_readmem(uint32_t physaddr);

void video_memwrite(uint32_t physaddr, word data);

void video_tick(int tick);

void video_done();

int video_write(uint16_t addr, uint16_t data);

int video_read(uint16_t addr, uint16_t * data);

#endif /* VIDEO_H */

/* End of file. */
