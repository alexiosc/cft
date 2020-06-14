/* 
   
video.c - Emulates the video terminal card (PS/2 keyboard input plus
video output). Also initialises the SDL-based emulator user interface.

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

#include "io.h"
#include "fifo.h"
#include "video.h"
#include "cftemu.h"
#include "util.h"


static				/* This makes the romfont array static */
#include "romfont.h"


void irq();

int video = 0, video_fs, video_2x;

int debug_video = 0;

#define FRAMERATE 50
#define BLINKRATE 3


///////////////////////////////////////////////////////////////////////////////
//
// VIDEO DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////

#define WIDTH 640
#define HEIGHT 400
#define STATUS_HEIGHT 32
#define PITCH (WIDTH >> 3)
#define COLS 8

#define FONTPITCH 16


#define rgb(r,g,b) ((r) & 3) | (((g) & 3) << 2) | (((b) & 3) << 4)
#define color(fg, bg) ((fg) | ((bg) << 6))
#define getfg(c) ((c) & 0x3f)
#define getbg(c) (((c) >> 6) & 0x3f)
#define getwin(vwr) (((uint32_t)(vwr) & 0xf000) << 1)

#define red(c) ((c) & 3)
#define green(c) (((c) >> 2) & 3)
#define blue(c) (((c) >> 4) & 3)

uint8_t dac[4] = { 0x00, 0x55, 0xaa, 0xff };

//#define color2sdl(c) (dac[(((c) >> 4) & 3)]) | (dac[(((c) >> 2) & 3)] << 8) | (dac[((c) & 3)] << 16)

video_t v;



int
video_isvram(uint32_t physaddr)
{
	return (physaddr & 0xffe000) == 0x180000;
}


word
video_readmem(uint32_t physaddr)
{
	int ofs = physaddr & 0xfff; /* offset into an 8kW bank */
	int plane = physaddr & 0x1000; /* offset */
	uint32_t i = getwin(v.fb_cft.vwr) | ofs;

	if (plane) {		/* Colour plane */
		//vdebug("VRAM C[%04x]: %04x\n", i, v.c[i]);
		return v.fb_cft.c[i];
	}
	/* Character plane */
	//vdebug("VRAM C[%04x]: %04x\n", i, v.c[i]);
	return v.fb_cft.b[getwin(v.fb_cft.vwr) | ofs];
}


void
video_memwrite(uint32_t physaddr, word data)
{
	int ofs = physaddr & 0xfff; /* offset into an 8kW bank */
	int plane = physaddr & 0x1000; /* offset */
	uint32_t i = getwin(v.fb_cft.vwr) | ofs;

	if (plane) {		/* Colour plane */
		//vdebug("VRAM C[%04x] <- %04x\n", i, data & 0xffff);
		v.fb_cft.c[i] = data & 0xffff;
	} else {
		/* Character plane */
		//vdebug("VRAM B[%04x] <- %04x\n", i, data & 0xffff);
		if (v.fb_cft.mcr & MCR_MASK) {
			uint16_t val = v.fb_cft.b[getwin(v.fb_cft.vwr) | ofs] & 0xff00;
			v.fb_cft.b[getwin(v.fb_cft.vwr) | ofs] = val | (data & 0xff);
		} else {
			v.fb_cft.b[getwin(v.fb_cft.vwr) | ofs] = data & 0xffff;
		}
		
	}

	v.dirty++;
}


///////////////////////////////////////////////////////////////////////////////
//
// Board-level emulation
//
///////////////////////////////////////////////////////////////////////////////


void
sdl_listmodes()
{
	const SDL_VideoInfo *info;
	int i;
	SDL_Rect **modes;
	
	if ( SDL_Init(SDL_INIT_VIDEO|SDL_INIT_TIMER) < 0 ) {
		fail("Couldn't initialize SDL: %s\n", SDL_GetError());
	}
	info = SDL_GetVideoInfo();
	vdebug("Current display: %d bits-per-pixel\n", info->vfmt->BitsPerPixel);
	if ( info->vfmt->palette == NULL ) {
		vdebug("Red Mask = 0x%.8x\n", info->vfmt->Rmask);
		vdebug("Green Mask = 0x%.8x\n", info->vfmt->Gmask);
		vdebug("Blue Mask = 0x%.8x\n", info->vfmt->Bmask);
	}
	
	modes = SDL_ListModes(NULL, SDL_FULLSCREEN);
	if ( modes == (SDL_Rect **)0 ) {
		vdebug("No available fullscreen video modes\n");
	} else
		if ( modes == (SDL_Rect **)-1 ) {
			vdebug("No special fullscreen video modes\n");
		} else {
			vdebug("Fullscreen video modes:\n");
			for ( i=0; modes[i]; ++i ) {
				vdebug("\t%dx%dx%d\n", modes[i]->w, modes[i]->h, info->vfmt->BitsPerPixel);
			}
		}
	if ( info->wm_available ) {
		vdebug("A window manager is available\n");
	}
	if ( info->hw_available ) {
		vdebug("Hardware surfaces are available (%dK video memory)\n",
		       info->video_mem);
	}
	if ( info->blit_hw ) {
		vdebug(
			"Copy blits between hardware surfaces are accelerated\n");
	}
	if ( info->blit_hw_CC ) {
		vdebug(
			"Colorkey blits between hardware surfaces are accelerated\n");
	}
	if ( info->blit_hw_A ) {
		vdebug(
			"Alpha blits between hardware surfaces are accelerated\n");
	}
	if ( info->blit_sw ) {
		vdebug(
			"Copy blits from software surfaces to hardware surfaces are accelerated\n");
	}
	if ( info->blit_sw_CC ) {
		vdebug(
			"Colorkey blits from software surfaces to hardware surfaces are accelerated\n");
	}
	if ( info->blit_sw_A ) {
		vdebug(
			"Alpha blits from software surfaces to hardware surfaces are accelerated\n");
	}
	if ( info->blit_fill ) {
		vdebug(
			"Color fills on hardware surfaces are accelerated\n");
	}
	SDL_Quit();
}


static uint32_t video_fbrefresh(uint32_t, void *);

static uint32_t video_blink(uint32_t, void *);

static void _video_setengine();


static void
chargen_init()
{
	int i;
	/* Emulate a character ROM/EPROM/EEPROM/Flash (unprogrammed values are 0xff) */
	for (i = 0; i < CHAR_RAM_SIZE; i++) {
		//v.cp[i] = (rand() >> 16) & 0xff;
		v.cp[i] = 0xff;
	}

	/* The emulator menus need the VDU card's ROM font, so we
	 * install that whether the VDU card is present or not. */
	memcpy(v.cp, romfont, sizeof(romfont));
}


void
sdl_init()
{
	int w = WIDTH;
	int h = HEIGHT + STATUS_HEIGHT;
	int desired_bpp=8, video_flags=0;
	
	//video_listmodes();
	
	if ( SDL_Init(SDL_INIT_VIDEO|SDL_INIT_TIMER) < 0 ) {
		fail("Couldn't initialize SDL: %s\n", SDL_GetError());
	}
	
	vdebug("dbl=%x, hw=%x, fs=%x\n", SDL_DOUBLEBUF, SDL_HWSURFACE, SDL_FULLSCREEN);
	video_flags = SDL_DOUBLEBUF;
	//video_flags |= arg_hw? SDL_HWSURFACE: SDL_SWSURFACE;
	video_flags |= SDL_SWSURFACE;
	if (video_fs) video_flags |= SDL_FULLSCREEN;

	if (video_2x) {
		w *= 2;
		h *= 2;
	}

	//if (arg_bpp < 0) {
		for (desired_bpp = 32; desired_bpp <= 32; desired_bpp <<= 1) {
			vdebug("Trying %dx%dx%d flags=%08x", w, h, desired_bpp, video_flags);
			if (SDL_VideoModeOK (w, h, desired_bpp, video_flags)) break;
		}
        //}

	//if (arg_warp && (desired_bpp == 8)) video_flags |= SDL_HWPALETTE;

	v.screen = SDL_SetVideoMode (w, h, desired_bpp, video_flags);
	if (v.screen->format->BytesPerPixel != 4 || SDL_BYTEORDER == SDL_BIG_ENDIAN) {
		fail("Video: only 32bpp and little endian architectures supported currently. Sorry."); 
	}

	if ( v.screen == NULL ) {
		fail("Couldn't set %dx%dx%d video mode: %s\n",
			w, h, desired_bpp, SDL_GetError());
	}
	
	vdebug("Set%s %dx%dx%d mode\n",
	       v.screen->flags & SDL_FULLSCREEN ? " fullscreen" : "",
	       v.screen->w, v.screen->h, v.screen->format->BitsPerPixel);
	vdebug("(video surface located in %s memory)\n",
	       (v.screen->flags&SDL_HWSURFACE) ? "video" : "system");
	if (v.screen->flags & SDL_DOUBLEBUF ) {
		vdebug("Double-buffering enabled\n");
	}
	
	/* Set the window manager title bar */
	SDL_WM_SetCaption("CFT emulator", "cftemu");
	
	/* Set the keyboard state */
	SDL_EnableKeyRepeat(SDL_DEFAULT_REPEAT_DELAY, SDL_DEFAULT_REPEAT_INTERVAL);
	SDL_EnableUNICODE(1);
	SDL_EventState(SDL_MOUSEMOTION, SDL_IGNORE);

	chargen_init();

	/* Display emulator video output */
	v.fb = &v.fb_menu;

	v.dirty = 1;
	v.stdirty = 1;

	/* Set timers */

	v.blink = 0;
	v.refresh_timer = SDL_AddTimer(1000 / FRAMERATE, video_fbrefresh, NULL);
	v.blink_timer = SDL_AddTimer(1000 / BLINKRATE, video_blink, NULL);
	
	/* Set the pixel drawing engine */
	_video_setengine();
}


void
sdl_done()
{
}


void
video_init()
{
	v.fb = &v.fb_cft;

	/* Randomise the RAM */
	int i;
	srand(time(0));
	for (i = 0; i < PLANE_SIZE; i++) {
		//v.fb_cft.b[i] = (32 + (i % 4096)); //(rand() >> 16) & 0xff;
		v.fb_cft.b[i] = (rand() >> 16) & 0xffff;
		//v.c[i] = color(0, (i & 63));// | ATTR_BLINK | ATTR_INVERT;//(rand() >> 16) & 0xffff;
		v.fb_cft.c[i] = (rand() >> 16) & 0xffff;
		//v.c[i] = color(63, 21 & (((i / 80) & 1) == 1) );
	}

	video_reset();
}


void
video_reset()
{
	/* Set registers */

	v.fb_cft.mcr = MCR_VERSION;
	v.fb_cft.vwr = 0;
	v.fb_cft.ssr = 0;
	v.fb_cft.scr = 0;
	v.fb_cft.ser = 0;
	v.fb_cft.car = 0;
	v.fb_cft.ccr = 0; // color(0, rgb(3, 2, 0)) | /*CCR_CURSOR_BLINK_FAST*/ CCR_CURSOR_ON;
}


void
video_done() 
{
}


int 
video_write(uint16_t addr, uint16_t dbus)
{

	switch (addr) {
	case IO_VIDEO_MCR:
		v.fb_cft.mcr = (dbus & 0xfff0) | MCR_VERSION;
		_video_setengine();
		vdebug("MCR set. VEN=%d, 40COL=%d, CLH=%d%d HGR=%d\n",
		       (v.fb_cft.mcr & MCR_VEN) != 0,
		       (v.fb_cft.mcr & MCR_40COL) != 0,
		       (v.fb_cft.mcr & 0x80) != 0,
		       (v.fb_cft.mcr & 0x40) != 0,
		       (v.fb_cft.mcr & MCR_HGR) != 0);
		       
		v.dirty++;
		return 1;

	case IO_VIDEO_VWR:
		//vdebug("VWR set to %04x\n", dbus);
		v.fb_cft.vwr = dbus;
		v.dirty++;
		return 1;

	case IO_VIDEO_SSR:
		//vdebug("SSR set to %04x\n", dbus);
		v.fb_cft.ssr = dbus;
		v.dirty++;
		return 1;

	case IO_VIDEO_SCR:
		//vdebug("SCR set to %04x\n", dbus);
		v.fb_cft.scr = dbus;
		v.dirty++;
		return 1;

	case IO_VIDEO_SER:
		//vdebug("SER set to %04x\n", dbus);
		v.fb_cft.ser = dbus;
		v.dirty++;
		return 1;

	case IO_VIDEO_RSVD5:
		v.dirty++;
		return 1;
		
	case IO_VIDEO_CAR:
		//vdebug("CAR set to %04x\n", dbus);
		v.fb_cft.car = dbus;
		v.dirty++;
		return 1;

	case IO_VIDEO_CCR:
		//vdebug("CCR set to %04x\n", dbus);
		v.fb_cft.ccr = dbus;
		v.dirty++;
		return 1;
	}

	return 0;
}



int
video_read(uint16_t addr, uint16_t *dbus)
{
	switch (addr) {
	case IO_VIDEO_VSR:
		*dbus = 0x5;
		return 1;
	}

	return 0;
}


void
video_tick(int tick)
{
	/* Moved to menus.c */


	/* SDL_Event event; */
	/* if (!SDL_PollEvent (&event)) return; */

	/* switch (event.type) { */
	/* case SDL_KEYDOWN: */
	/* 	printf("The %s key was pressed!\n", */
        /*            SDL_GetKeyName(event.key.keysym.sym)); */
	/* 	break; */

	/* case SDL_QUIT: */
	/* 	quit(0); */
	/* 	break; */
	/* } */

	/* vdebug("Got event (type=%d) key event %d %d %d\n", event.type, event.key.type, */
	/*        event.key.state, event.key.keysym); */
}


static inline void
_video_cursor(uint8_t *fg, uint8_t *bg)
{
	int b;
	switch(v.fb->ccr & CCR_CURSOR_MASK){
	case CCR_CURSOR_BLINK_FAST:
		b = v.blink & 1;
		break;
	case CCR_CURSOR_BLINK_SLOW:
		b = v.blink & 2;
		break;
	case CCR_CURSOR_ON:
		b = 1;
		break;
	case CCR_CURSOR_OFF:
	default:
		b = 0;
		break;
	}
	if (b) {
		*fg = getfg(v.fb->ccr);
		*bg = getbg(v.fb->ccr);
	}
}


static inline void
_video_attr(uint16_t co, uint8_t *fg, uint8_t *bg)
{
	// Inverse attribute
	if (co & ATTR_INVERT) {
		*fg =getbg(co);
		*bg =getfg(co);
	}

	// Blink attribute
	if (co & ATTR_BLINK) {
		if (v.blink & 2) *fg = *bg;
	}
}


static int
_video_drawpixel_1x_80(uint8_t * buf, int ofs, uint8_t r, uint8_t g, uint8_t b)
{
	buf[ofs++] = b;
	buf[ofs++] = g;
	buf[ofs++] = r;
	return ofs + 1;
}


static int
_video_drawpixel_1x_40(uint8_t * buf, int ofs, uint8_t r, uint8_t g, uint8_t b)
{
	buf[ofs++] = b;
	buf[ofs++] = g;
	buf[ofs++] = r;
	ofs++;
	buf[ofs++] = b;
	buf[ofs++] = g;
	buf[ofs++] = r;
	return ofs + 1;
}


static int
_video_drawpixel_2x_80(uint8_t * buf, int ofs, uint8_t r, uint8_t g, uint8_t b)
{
	int ofs1 = ofs + v.screen->pitch;

	buf[ofs++] = b;		/* Pixel (0,0) */
	buf[ofs++] = g;
	buf[ofs++] = r;
	ofs += 1;
	buf[ofs++] = b;		/* Pixel (0,1) */
	buf[ofs++] = g;
	buf[ofs++] = r;
							
	buf[ofs1++] = b;	/* Pixel (1,0) */
	buf[ofs1++] = g;
	buf[ofs1++] = r;
	ofs1 += 1;
	buf[ofs1++] = b;	/* Pixel (1,1) */
	buf[ofs1++] = g;
	buf[ofs1++] = r;

	return ofs + 1;
}


static int
_video_drawpixel_2x_40(uint8_t * buf, int ofs, uint8_t r, uint8_t g, uint8_t b)
{
	int ofs1 = ofs + v.screen->pitch;

	buf[ofs++] = b;		/* Pixel (0,0) */
	buf[ofs++] = g;
	buf[ofs++] = r;
	ofs += 1;
	buf[ofs++] = b;		/* Pixel (0,1) */
	buf[ofs++] = g;
	buf[ofs++] = r;
	ofs += 1;
	buf[ofs++] = b;		/* Pixel (0,2) */
	buf[ofs++] = g;
	buf[ofs++] = r;
	ofs += 1;
	buf[ofs++] = b;		/* Pixel (0,3) */
	buf[ofs++] = g;
	buf[ofs++] = r;
							
	buf[ofs1++] = b;	/* Pixel (1,0) */
	buf[ofs1++] = g;
	buf[ofs1++] = r;
	ofs1 += 1;
	buf[ofs1++] = b;	/* Pixel (1,1) */
	buf[ofs1++] = g;
	buf[ofs1++] = r;
	ofs1 += 1;
	buf[ofs1++] = b;	/* Pixel (1,2) */
	buf[ofs1++] = g;
	buf[ofs1++] = r;
	ofs1 += 1;
	buf[ofs1++] = b;	/* Pixel (1,3) */
	buf[ofs1++] = g;
	buf[ofs1++] = r;

	return ofs + 1;
}


static void
_video_setengine()
{
	if (video_2x) {
		if (v.fb->mcr & MCR_40COL) v.drawpixel = _video_drawpixel_2x_40;
		else v.drawpixel = _video_drawpixel_2x_80;
	} else {
		if (v.fb->mcr & MCR_40COL) v.drawpixel = _video_drawpixel_1x_40;
		else v.drawpixel = _video_drawpixel_1x_80;
	}
}


static inline void
_video_update()
{
	int bpp = v.screen->format->BytesPerPixel;
	int x, y, xc, xcm, yc, ofs, cellofs, yh, yho, colour, cellpix;
	int colpitch;
	uint8_t * pixel = v.screen->pixels;

	_video_setengine();

	/* Calculate rows per char */
	if (v.fb->mcr & MCR_HGR) {
		/* Graphics mode */
		yh = 0;
		yho = 0;
	} else {
		/* Text/semigraphics modes */
		yh = 4 - ((v.fb->mcr & MCR_CLH_MASK) >> MCR_CLH_SHIFT);
		yho = (1 << yh) - 1;
	}
	xcm = v.fb->mcr & MCR_40COL ? 40 : 80;	/* 40/80 columns */
	colpitch = COLS << video_2x;
	colpitch <<= ((v.fb->mcr & MCR_40COL) != 0);

	cellofs = v.fb->scr;
	for (yc = 0; yc < (HEIGHT >> yh); yc++) {
		ofs = (yc << yh) * v.screen->pitch * (1 + video_2x);
		for (xc = 0; xc < xcm; xc++) {
			uint16_t ch = v.fb->b[cellofs & PLANE_SIZE_MASK];
			uint16_t co = v.fb->c[cellofs & PLANE_SIZE_MASK];
			uint8_t fg = getfg(co);
			uint8_t bg = getbg(co);

			uint32_t fontofs = ch * FONTPITCH;

			if (v.fb->car == cellofs) _video_cursor(&fg, &bg);
			_video_attr(co, &fg, &bg);

			int ofs0 = ((yc << (yh + video_2x)) * (WIDTH << video_2x) * bpp) +
				(xc * colpitch * bpp);
			for (y = 0; y <= yho; y++) {
				cellpix = 0x80;
				ofs = ofs0;

				for (x = 0; x < COLS; x++) {

					if (v.cp[fontofs & CHAR_RAM_MASK] & cellpix) colour = fg;
					else colour = bg;

					/* Draw a pixel using the current engine */
					ofs = (*v.drawpixel)(pixel, ofs,
							      dac[red(colour)],
							      dac[green(colour)],
							      dac[blue(colour)]);

					cellpix >>= 1;
				}

				ofs0 += v.screen->pitch << video_2x;
				fontofs++;
			}
				       
			ofs += COLS * bpp * (1 + video_2x);

			/* Step the cellofs, implement modulo function exactly
			 * as the hardware might */
			if (++cellofs == v.fb->ser) cellofs = v.fb->ssr;
		}
	}
}


static inline void
_video_status_update()
{
	int bpp = v.screen->format->BytesPerPixel;
	int x, y, xc, xcm, yc, ofs, cellofs, yh, yho, colour, cellpix;
	int colpitch;
	uint8_t * pixel = v.screen->pixels;

	if (video_2x) {
		v.drawpixel = _video_drawpixel_2x_80;
	} else {
		v.drawpixel = _video_drawpixel_1x_80;
	}

	/* Calculate rows per char */
	yh = 4;
	yho = 15;
	xcm = 80;
	colpitch = 8 << video_2x;
	cellofs = 2000;

	/* Two rows */
	int ofs_status = ((WIDTH << video_2x) * bpp) * (HEIGHT << video_2x);

	for (yc = 0; yc < 2; yc++) {
		ofs = (yc << yh) * v.screen->pitch * (1 + video_2x);
		for (xc = 0; xc < xcm; xc++) {
			uint16_t ch = v.fb_menu.b[cellofs & PLANE_SIZE_MASK];
			uint16_t co = v.fb_menu.c[cellofs & PLANE_SIZE_MASK];
			uint8_t fg = getfg(co);
			uint8_t bg = getbg(co);

			uint32_t fontofs = ch * FONTPITCH;

			_video_attr(co, &fg, &bg);

			int ofs0 = ofs_status + 
				((yc << (yh + video_2x)) * (WIDTH << video_2x) * bpp) +
				(xc * colpitch * bpp);
			for (y = 0; y <= yho; y++) {
				cellpix = 0x80;
				ofs = ofs0;

				for (x = 0; x < COLS; x++) {

					if (v.cp[fontofs & CHAR_RAM_MASK] & cellpix) colour = fg;
					else colour = bg;

					/* Draw a pixel using the current engine */
					ofs = (*v.drawpixel)(pixel, ofs,
							      dac[red(colour)],
							      dac[green(colour)],
							      dac[blue(colour)]);

					cellpix >>= 1;
				}

				ofs0 += v.screen->pitch << video_2x;
				fontofs++;
			}
				       
			ofs += COLS * bpp * (1 + video_2x);

			/* Step the cellofs, implement modulo function exactly
			 * as the hardware might */
			if (++cellofs == v.fb->ser) cellofs = v.fb->ssr;
		}
	}

	for (x = 0; x < WIDTH; x+=2) {
		v.drawpixel(pixel, ofs_status + ((x << video_2x) * bpp), 0, 0, 0);
	}

}


static uint32_t
video_fbrefresh(uint32_t interval, void *param)
{
	//register uint32_t t = SDL_GetTicks();
	if (v.dirty || v.stdirty) {
		SDL_Rect r;

		assert (SDL_LockSurface (v.screen) == 0);

		if (v.dirty && v.fb->mcr & MCR_VEN) {
			r.x = 0;
			r.y = 0;
			r.w = WIDTH << video_2x;
			r.h = HEIGHT << video_2x;
			//SDL_FillRect (v.screen, &r, 0);
			_video_update();
		}
		if (v.stdirty) {
			r.x = 0;
			r.y = HEIGHT << video_2x;
			r.w = WIDTH << video_2x;
			r.h = STATUS_HEIGHT << video_2x;
			//SDL_FillRect (v.screen, &r, 0);
			_video_status_update();
		}

		SDL_UnlockSurface(v.screen);
		SDL_Flip(v.screen);

		v.dirty = 0;
		v.stdirty = 0;
		//vdebug("update\n");
	}
	
	return 1000 / FRAMERATE;
}


static uint32_t
video_blink(uint32_t interval, void *param)
{
	v.blink = (v.blink + 1) % 4;
	v.dirty = 1;
	v.stdirty = 1;
	//v.car = (v.car + 1) % 4000;
	return 1000 / BLINKRATE;
}
	
	
/* End of file. */
