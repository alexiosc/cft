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
#include "irc.h"


static				/* This makes the romfont array static */
#include "romfont.h"


void irq();

int video = 0, video_fs, video_2x;

int debug_video = 0;
int vdu_dirty = 1;

#define FRAMERATE 50
#define BLINKRATE 6


///////////////////////////////////////////////////////////////////////////////
//
// VIDEO DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////

#define WIDTH 640
#define HEIGHT 480
#define STATUS_HEIGHT 64
#define PITCH (WIDTH >> 3)
#define COLS 8

#define FONTPITCH 16


uint8_t dac[4] = { 0x00, 0x55, 0xaa, 0xff };

video_t v;


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
		v.fb_cft.cg[i] = (rand() >> 16) & 0xff;
		v.fb_menu.cg[i] = 0xff;
	}

	/* The emulator menus need the VDU card's ROM font, so we
	 * install that whether the VDU card is present or not. */
	//memcpy(v.fb_cft.cg, romfont, sizeof(romfont));
	memcpy(v.fb_menu.cg, romfont, sizeof(romfont));
	memcpy(v.fb_status.cg, romfont, sizeof(romfont));
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
	extern int dfp_testmode;
	if (dfp_testmode) {
		SDL_WM_SetCaption("CFT emulator (test mode)", "cftemuTest");
		SDL_WM_IconifyWindow();
	} else {
		SDL_WM_SetCaption("CFT emulator", "cftemu");
	}
	
	/* Set the keyboard state */
	SDL_EnableKeyRepeat(SDL_DEFAULT_REPEAT_DELAY, SDL_DEFAULT_REPEAT_INTERVAL);
	SDL_EnableUNICODE(1);
	SDL_EventState(SDL_MOUSEMOTION, SDL_IGNORE);

	chargen_init();

	/* Display emulator video output */
	v.fb = &v.fb_menu;

	v.dirty = 1;
	vdu_dirty = 0;
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
		v.fb_cft.b[i] = (rand() >> 16) & 0xffff;
		v.fb_cft.c[i] = (rand() >> 16) & 0xffff;
		v.fb_cft.cg[i] = (rand() >> 16) & 0xffff;
		/*v.fb_cft.b[i] = (32 + ((1 + (i & 0x7f) + (i >> 7)) % 94)) & 0xff;
		  v.fb_cft.c[i] = (1 + ((1 + (i & 0x7f) + (i >> 7)) % 63)) & 0xff;*/
		/* v.fb_cft.c[i] = 0x3f; */
	}

	chargen_init();

	video_reset();
}


void
video_reset()
{
	/* Set registers */
	printf("*** Video Reset\n");

	v.fb_cft.mcr0 = v.fb_cft.mcr1 = 0;
	v.fb_cft.scr0 = v.fb_cft.scr1 = 0;
	v.fb_cft.sar0 = v.fb_cft.sar1 = 0;
	v.fb_cft.mar0 = v.fb_cft.mar1 = 0;

	v.fb_cft.ccr = 0;
	v.fb_cft.car = 0;
	v.fb_cft.har = 0;
	v.fb_cft.cport = 0;
	v.fb_cft.cmd = 0;
	
	v.irq_vs = 0;
	v.irq_sc = 0;
	v.irq_vr = 0;

	v.fb_cft.split = 0;
	v.fb_menu.split = 0;

	/* // Temporary: enable the display */
	/* v.fb_cft.mcr0 = 0x8000; */
	/* v.fb_cft.mar0 = 0xffff; */
	/* v.fb_cft.mar1 = 0xffff; */
	/* v.fb_cft.ccr = CCR_CURSOR_BLINK_FAST | color(63, 0); */
}


void
video_done() 
{
}



static void
_runcmd()
{
	/*
	fprintf(stderr, "***CMD=%04x (%d) x+=%d, y+=%d, reps=%d\n",
		v.fb_cft.cmd, cmd_get_cmd(v.fb_cft.cmd),
		cmd_is_xinc(v.fb_cft.cmd),
		cmd_is_yinc(v.fb_cft.cmd),
		v.fb_cft.crr);
	*/
	// If the high bit is set, there's no command to run.
	if (cmd_is_go(v.fb_cft.cmd)) return;

	// Repeat as required.
	do {
	
		switch(cmd_get_cmd(v.fb_cft.cmd)){
		case 0:
			/* Write B & C */
			v.fb_cft.b[v.fb_cft.har] = cmd_get_data(v.fb_cft.cmd);
			v.fb_cft.c[v.fb_cft.har] = v.fb_cft.cport;
			break;

		case 1: 
			/* Write B */
			v.fb_cft.b[v.fb_cft.har] = cmd_get_data(v.fb_cft.cmd);
			break;

		case 2:
			/* Set (OR) B, Write C */
			v.fb_cft.b[v.fb_cft.har] |= cmd_get_data(v.fb_cft.cmd);
			v.fb_cft.c[v.fb_cft.har] = v.fb_cft.cport;
			break;

		case 3:
			/* Set (OR) B */
			v.fb_cft.b[v.fb_cft.har] |= cmd_get_data(v.fb_cft.cmd);
			break;

		case 4:
			/* Mask (AND) B, Write C */
			v.fb_cft.b[v.fb_cft.har] &= cmd_get_data(v.fb_cft.cmd);
			v.fb_cft.c[v.fb_cft.har] = v.fb_cft.cport;
			break;

		case 5:
			/* Mask (AND) B */
			v.fb_cft.b[v.fb_cft.har] &= cmd_get_data(v.fb_cft.cmd);
			break;

		case 6:
			/* Toggle (XOR) B, Write C */
			v.fb_cft.b[v.fb_cft.har] ^= cmd_get_data(v.fb_cft.cmd);
			v.fb_cft.c[v.fb_cft.har] = v.fb_cft.cport;
			break;

		case 7:
			/* Toggle (XOR) B */
			v.fb_cft.b[v.fb_cft.har] ^= cmd_get_data(v.fb_cft.cmd);
			break;

		case 8:
			/* Write C only */
			v.fb_cft.c[v.fb_cft.har] = v.fb_cft.cport;
			break;

		case 9:
		case 10:
			/* Reserved */
			break;
			
		case 11:
			/* Write CG */
			//printf("WCG %p [%04x] = %02x\n", &v.fb_cft.cg, v.fb_cft.har, cmd_get_data(v.fb_cft.cmd));
			v.fb_cft.cg[v.fb_cft.har & 0xffff] = cmd_get_data(v.fb_cft.cmd);
			break;

		case 12:
			/* Reserved */
			break;

		case 13:
			/* Read B & C */
			v.fb_cft.cmd = v.fb_cft.cmd & CMD_NDATA_MASK;
			v.fb_cft.cmd |= v.fb_cft.b[v.fb_cft.har];
			v.fb_cft.cport = v.fb_cft.c[v.fb_cft.har];
			break;

		case 14:
		case 15:
			/* Reserved */
			break;
		}

		/* Increment addresses */
		if (cmd_is_xinc(v.fb_cft.cmd)) v.fb_cft.har = (v.fb_cft.har + 1) & 0xffff;
		if (cmd_is_yinc(v.fb_cft.cmd)) v.fb_cft.har = (v.fb_cft.har + 128) & 0xffff;

		//fprintf(stderr, "HAR = %0x (%d,%d)\n", v.fb_cft.har, get_col(v.fb_cft.har), get_row(v.fb_cft.har));

	} while (v.fb_cft.crr--);
	v.fb_cft.crr = 0;	/* Simulate the hardware at this point */

	/* Set the MSB */
	v.fb_cft.cmd |= CMD_GO;

	/* Issue a VDU Ready Interrupt, if needed */
	if (mcr0_is_vri(v.fb_cft.mcr0)) {
		v.irq_vr++;
		interrupt(IRQ_VDU);
	}

	/* Redraw the framebuffer */
	vdu_dirty = ++v.dirty;
}



int 
video_write(uint16_t addr, uint16_t dbus)
{
	switch (addr) {
	case IO_VIDEO_MCR0:
		v.fb_cft.mcr0 = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("MCR0 set. EN=%d, KBI=%d, VRI=%d, SCI=%d, VSI=%d, CS2=%d, C40=%d, CRH=%d\n",
		       mcr0_is_en(v.fb_cft.mcr0),
		       mcr0_is_kbi(v.fb_cft.mcr0),
		       mcr0_is_vri(v.fb_cft.mcr0),
		       mcr0_is_sci(v.fb_cft.mcr0),
		       mcr0_is_vsi(v.fb_cft.mcr0),
		       mcr_get_cs2(v.fb_cft.mcr0),
		       mcr_is_c40(v.fb_cft.mcr0),
		       mcr_get_crh(v.fb_cft.mcr0));
		return 1;

	case IO_VIDEO_MCR1:
		v.fb_cft.mcr1 = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("MCR1 set. SCL=%d, SEN=%d, CS2=%d, C40=%d, CRH=%d\n",
		       mcr1_get_scl(v.fb_cft.mcr1),
		       mcr1_is_sen(v.fb_cft.mcr1),
		       mcr_get_cs2(v.fb_cft.mcr1),
		       mcr_is_c40(v.fb_cft.mcr1),
		       mcr_get_crh(v.fb_cft.mcr1));
		return 1;


	case IO_VIDEO_SCR0:
		v.fb_cft.scr0 = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("SCR0 set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_SCR1:
		v.fb_cft.scr1 = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("SCR1 set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_SAR0:
		v.fb_cft.sar0 = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("SAR0 set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_SAR1:
		v.fb_cft.sar1 = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("SAR1 set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_MAR0:
		v.fb_cft.mar0 = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("MAR0 set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_MAR1:
		v.fb_cft.mar1 = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("MAR1 set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_CCR:
		v.fb_cft.ccr = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("CCR set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_CAR:
		v.fb_cft.car = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("CAR set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_HAR:
		v.fb_cft.har = dbus;
		vdu_dirty = ++v.dirty;
		vdebug("HAR set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_KBD:
		fail("Not implemented yet.");
		//v.fb_cft.har = dbus;
		//vdu_dirty = ++v.dirty;
		//vdebug("HAR set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_CRR:
		v.fb_cft.crr = dbus & 0x3ff;
		//vdu_dirty = ++v.dirty;
		//vdebug("HAR set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_CPORT:
		v.fb_cft.cport = dbus;
		//vdu_dirty = ++v.dirty;
		//vdebug("CPORT set to %04x\n", dbus);
		return 1;

	case IO_VIDEO_CMD:
		v.fb_cft.cmd = dbus;
		_runcmd();
		//vdebug("CMD set to %04x\n", dbus);
		return 1;
	}
	
	return 0;
}



void
video_kbd_interrupt()
{
	v.irq_kb++;
	if (mcr0_is_kbi(v.fb->mcr0)) {
		vdebug("*** MCR0=%04x\n", v.fb->mcr0);
		vdebug("*** VDU IRQ (KBD) #%d ***\n", v.irq_kb);
		interrupt(IRQ_VDU);
	}
}

int
video_read(uint16_t addr, uint16_t *dbus)
{
	switch (addr) {
	case IO_VIDEO_SR:
		*dbus = SR_VERSION;
		if (mcr0_is_en(v.fb_cft.mcr0)) *dbus |= MCR0_EN;
		if (v.irq_vs) *dbus |= MCR0_VSI;
		if (v.irq_sc) *dbus |= MCR0_SCI;
		if (v.irq_kb) *dbus |= MCR0_KBI;
		*dbus |= (v.fb_cft.mcr0 & (MCR_CS2_MASK | MCR_C40 | MCR_CRH_MASK));

		// Clear interrupt source flags whenever the SR is read
		v.irq_vs = 0;
		v.irq_sc = 0;
		v.irq_vr = 0;
		return 1;

	case IO_VIDEO_KBD:
	{
		*dbus = v.kbdata;
		v.kbdata &= ~0x8000;
		vdebug("VDU: KBD GET 0x%04x\n", *dbus);
		//fprintf(stderr, "*** KBD GET 0x%02x\n", i & 0xff);
		// Clear the keyboard irq flag
		v.irq_kb = 0;
		return 1;
	}

	case IO_VIDEO_CRR:
		*dbus = v.fb_cft.crr;
		return 1;

	case IO_VIDEO_HAR:
		*dbus = v.fb_cft.har;
		return 1;

	case IO_VIDEO_CPORT:
		*dbus = v.fb_cft.cport;
		return 1;

	case IO_VIDEO_CMD:
		*dbus = v.fb_cft.cmd;
		return 1;
	}

	return 0;
}


void
video_tick(int tick)
{
	static int kbdtick = 0;
	int kbdbuf_get();

	// If the keyboard is uninhibited, send a new character.
	if (((++kbdtick) & 31) == 31) {

		int c = kbdbuf_get();
		if (c >= 0) {
			//printf("*** C=%d\n",c );
			vdebug("KBD: got %d\n", c);
			v.kbdata = (c & 0xff) | 0x8000;
			// Add the parity bit (bit 8)
			v.kbdata |= (1 ^ parity(c & 0xff)) << 8;
			video_kbd_interrupt();
		}
	}
	
}


static inline void
_video_cursor(uint8_t *fg, uint8_t *bg)
{
	int b;
	switch (ccr_get_cbc(v.fb->ccr)) {
	case ccr_get_cbc(CCR_CURSOR_BLINK_FAST):
		b = v.blink & 1;
		break;
	case ccr_get_cbc(CCR_CURSOR_BLINK_SLOW):
		b = v.blink & 2;
		break;
	case ccr_get_cbc(CCR_CURSOR_ON):
		b = 1;
		break;
	case ccr_get_cbc(CCR_CURSOR_OFF):
	default:
		b = 0;
		break;
	}
	if (b) {
		*fg = ccr_get_fg(v.fb->ccr);
		*bg = ccr_get_bg(v.fb->ccr);
	}
	/* fprintf(stderr, "b=%d, c=%d, CCR=%04x (%d/%d/%d) fg=%d, bg=%d\n", b, v.blink, v.fb->ccr, ccr_get_bg(v.fb->ccr), ccr_get_cbc(v.fb->ccr), ccr_get_fg(v.fb->ccr), *fg, *bg); */
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
	register int c40 = mcr_is_c40(splitreg(mcr));

	if (video_2x) {
		if (c40) v.drawpixel = _video_drawpixel_2x_40;
		else v.drawpixel = _video_drawpixel_2x_80;
	} else {
		if (c40) v.drawpixel = _video_drawpixel_1x_40;
		else v.drawpixel = _video_drawpixel_1x_80;
	}
}


static void
_video_setengine_status()
{
	if (video_2x) v.drawpixel = _video_drawpixel_2x_80;
	else v.drawpixel = _video_drawpixel_1x_80;
}


static uint8_t _clhmask[8] = { 0xf, 0x7, 0x3, 0x1, 0, 0, 0, 0 };



static inline void
plane_read(framebuffer_t * fb,
	   uint8_t clh, uint16_t paddr,
	   uint8_t * cg, uint8_t * fg, uint8_t * bg)
{
	uint16_t b, c;

	b = fb->b[paddr];
	c = fb->c[paddr];
	*cg = fb->cg[cgaddr(clh, b, c)];

	// Inverse attribute?
	if (cpl_is_inv(c)) {
		*fg = cpl_get_bg(c);
		*bg = cpl_get_fg(c);
	} else {
		*fg = cpl_get_fg(c);
		*bg = cpl_get_bg(c);
	}

	// Blink attribute?
	if (cpl_is_bln(c)) {
		if (v.blink & 4) *fg = *bg;
	}

	// Cursor?
	if (fb->car == paddr) {
		_video_cursor(fg, bg);
	}
}



static inline void
_video_update()
{
	int x, y, ofs, colour;
	uint8_t * pixel = v.screen->pixels;
	
	int clhmask;
	int clh;
	int parow, pacol;	/* plane address row/col */
	int paddr;		/* composite plane address vector */
	int xp;			/* xpos (phase-shifted x ordinate) */
	int xmax;		/* 640 (80 columns) or 320 (40 columns) */
	uint8_t cg;		/* Pixel data from the character generator */
	uint8_t fg, bg;		/* Colours for foreground and background */

	v.fb->split = 0;
	clhmask = _clhmask[mcr_get_crh(splitreg(mcr))]; /* Cell height */
	xmax = mcr_is_c40(splitreg(mcr)) ? WIDTH >> 1 : WIDTH; /* 80/40 column mode */
	clh = scr_get_vscr(splitreg(scr)); /* Vertical smooth scrolling */
	parow = get_row(splitreg(sar));	   /* Plane address, row */
	pacol = get_col(splitreg(sar));	   /* Plane address, col */
	_video_setengine();

	// This is coded to resemble the hardware design of the VDU.
	for (y = 0; y < HEIGHT; y++) {
		ofs = (32 + y) * v.screen->pitch * (1 + video_2x);
		x = 0;

		/* Split mode comparison. This is the way it is because of the
		 * way the hardware works. */
		if (((y >> 1) + 5) == mcr1_get_scl(v.fb->mcr1)) {
			v.irq_sc++;
			if (mcr1_is_sen(v.fb->mcr1)) {
				v.fb->split = 1;
				
				/* Update registers for the bottom half of the screen */
				clhmask = _clhmask[mcr_get_crh(splitreg(mcr))]; /* Cell height */
				xmax = mcr_is_c40(splitreg(mcr)) ? WIDTH >> 1 : WIDTH; /* 80/40 column mode */
				clh = scr_get_vscr(splitreg(scr)); /* Vertical smooth scrolling */
				parow = get_row(splitreg(sar));	   /* Plane address, row */
				pacol = get_col(splitreg(sar));	   /* Plane address, col */
				_video_setengine();
			}
		}


		pacol = get_col(splitreg(sar));	   /* Start of a line */
		paddr = vector(pacol, parow);
		//fprintf(stderr, "(%d,%d): paddr=(%d,%d)=%04x line=%d\n", x, y, pacol, parow, paddr, clh);
		
		xp = scr_get_hscr(splitreg(scr)); /* Horizontal smooth scrolling */
		
		cg = 0;		/* Silence spurious warning */


		/* Read plane, set colours and pixel pattern for first
		 * character. */
		plane_read(v.fb, clh, paddr, &cg, &fg, &bg);
		
		/* Shift the first character according to the horizontal phase */
		cg <<= xp;

		for (x = 0; x < xmax; x++) {

			// Get the colour of the pixel to draw.
			colour = cg & 0x80 ? fg : bg;
			cg <<= 1;

			// Draw a pixel
			ofs = (*v.drawpixel)(pixel, ofs,
					     dac[col_get_r(colour)],
					     dac[col_get_g(colour)],
					     dac[col_get_b(colour)]);

			// Step the x ordinate, calculate cell value
			xp++;
			// Read plane data every 8 pixels
			if ((xp & 7) == 0) {
				pacol++;
				if (pacol > get_col(splitreg(mar))) pacol = 0;
				paddr = vector(pacol, parow);

				plane_read(v.fb, clh, paddr, &cg, &fg, &bg);
			}

		}
		
		// Mod-N cell line counter
		clh = (clh + 1) & clhmask;
		
		// Row counter
		if (clh == 0) {
			// Start of next row
			parow++;
			if (parow > get_row(splitreg(mar))) parow = 0;
		}
	}
}


static inline void
_video_status_update()
{
	/* The status area is a hardwired 80x2 section of the display
	 * with no scrolling, cursor and other goodies. */

	//int bpp = v.screen->format->BytesPerPixel;
	int x, y, ofs, colour;
	uint8_t * pixel = v.screen->pixels;
	
	v.fb_status.split = 0;
	_video_setengine_status();

	int clhmask;
	int clh;
	int parow, pacol;	/* plane address row/col */
	int paddr;	/* composite plane address vector */
	int xp;			/* xpos (phase-shifted x ordinate) */
	int xmax;		/* 640 (80 columns) or 320 (40 columns) */
	uint8_t cg;		/* Pixel data from the character generator */
	uint8_t fg, bg;		/* Colours for foreground and background */

	int ofs_status = 0; //((WIDTH << video_2x) * bpp) * ((32 + HEIGHT) << video_2x);
	int paddr0 = 0;	/* Status area is past the end of the plane. */

	clhmask = 0xf; /* Cell height */
	xmax = WIDTH;
	clh = 0;
	parow = 0;
	pacol = 0;		/* Plane address, col */

	// This is coded to resemble the hardware design of the VDU.

	for (y = 0; y < 64; y++) {
		ofs = ofs_status + y * v.screen->pitch * (1 + video_2x);
		if (y >= 32) ofs += (HEIGHT * v.screen->pitch * (1 + video_2x));
		x = 0;
		pacol = 0;	/* Start of a line */
		paddr = paddr0 + vector(pacol, parow);
		//printf("%d + %d = %d\n", paddr0, vector(pacol, parow), paddr);
		
		xp = 0;
		cg = 0;		/* Silence spurious warning */

		/* Read plane data early, set colours and pixel pattern for
		 * first character. */
		plane_read(&v.fb_status, clh, paddr, &cg, &fg, &bg);

		for (x = 0; x < xmax; x++) {

			// Get the colour of the pixel to draw.
			colour = cg & 0x80 ? fg : bg;
			cg <<= 1;

			// Draw a pixel
			ofs = (*v.drawpixel)(pixel, ofs,
					     dac[col_get_r(colour)],
					     dac[col_get_g(colour)],
					     dac[col_get_b(colour)]);

			// Step the x ordinate, calculate cell value
			xp++;
			// Read plane data every 8 pixels
			if ((xp & 7) == 0) {
				pacol++;
				paddr = paddr0 + vector(pacol, parow);

				plane_read(&v.fb_status, clh, paddr, &cg, &fg, &bg);
			}

		}
		
		// Mod-N cell line counter
		clh = (clh + 1) & clhmask;
		
		// Row counter
		if (clh == 0) parow++;
	}
}


static uint32_t
video_fbrefresh(uint32_t interval, void *param)
{
	//register uint32_t t = SDL_GetTicks();
	//fprintf(stderr, "dirty %d/%d\n", v.dirty, v.stdirty);

	// If VSYNC interrupts are enabled, generate an interrupt now.
	v.irq_vs++;
	if (v.fb->mcr0 & MCR0_VSI) {
		interrupt(IRQ_VDU);
	}

	if (v.dirty || v.stdirty) {
		//SDL_Rect r;

		assert (SDL_LockSurface (v.screen) == 0);

		if (v.dirty) {
			if (mcr0_is_en(v.fb->mcr0)) {
				// r.x = 0;
				// r.y = 0;
				// r.w = WIDTH << video_2x;
				// r.h = HEIGHT << video_2x;
				//SDL_FillRect (v.screen, &r, 0);
				_video_update();
				//fprintf(stderr, "update, dirty=%d\n", v.dirty);
			} else {
				// Clear the screen if it's disabled.
				SDL_FillRect (v.screen, NULL, 0);
			}
		}
		if (v.stdirty) {
			// r.x = 0;
			// r.y = HEIGHT << video_2x;
			// r.w = WIDTH << video_2x;
			// r.h = STATUS_HEIGHT << video_2x;
			// SDL_FillRect (v.screen, &r, 0);
			_video_status_update();
			//fprintf(stderr, "status update, stdirty=%d\n", v.stdirty);
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
