/* 
   
   ui_panel.c - The emulated front panel.

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
#include "dfp.h"
#include "emulator.h"
#include "util.h"
#include "uterm.h"
#include "ui.h"
#include "ui_panel.h"
#include "dfp.h"


///////////////////////////////////////////////////////////////////////////////
//
// THE FRONT PANEL TAB
//
///////////////////////////////////////////////////////////////////////////////


int led_r[4] = {rgb(1,0,0), rgb(2,0,0), rgb(3,0,0), rgb(3,1,1)};
int led_y[4] = {rgb(1,1,0), rgb(2,2,0), rgb(3,3,0), rgb(3,3,1)};
int led_g[4] = {rgb(0,1,0), rgb(0,2,0), rgb(0,3,0), rgb(1,3,1)};

#define R led_r
#define Y led_y
#define G led_g
int * leds_ir[16] = {R, R, R, R, R, R, R, R, R, R, Y, R, Y, Y, Y, Y};
int * leds_uv[24] = {Y, Y, Y, Y, R, R, R, Y, Y, Y, Y, R, Y, Y, Y, Y, R, R, R, Y, Y, G, R, Y};

#define LED_CHAR "\5\6"

panel_t pd;

#define PANEL_X0 2
#define PANEL_Y0 1

static void
_ui_tab_panel_acquire()
{
	static int initialised = 0;
	if (!initialised) {
		memset(&pd, 0, sizeof(pd));
		initialised = 1;

		pd.mfdsrc = mfd_or;
		pd.sr = 0;
		pd.sr_curs = 0;
		pd.sr_acurs = 0;
		strcpy(pd.sr_a, "0000");
		dfp_sr_changed(pd.sr);
	}

	int i, j;

	pd.ticks++;

	// Process the source of MFD data (OR/DR/uAddr)
	word mfd;
	switch (pd.mfdsrc) {
	case mfd_or:
		mfd = reg_or;
		break;
	case mfd_dr:
		mfd = cpu.dr;
		break;
	case mfd_uaddr:
		mfd = cpu.upc & 0xffff;
		break;
	default:
		fail("Unknown MFD source!");
	}
	
	// Process the AC, PC and IR
	for (i = 0, j = 1; i < 16; i++, j<<=1) {
		if (cpu.a & j) pd.ac[i]++;
		if (cpu.pc & j) pd.pc[i]++;
		if (cpu.ir & j) pd.ir[i]++;
		if (mfd & j) pd.mfd[i]++;
	}

	// Process the control vector
	uint32_t uvec = cpu.control ^ 0xfff800; // Some lights are inverted
	for (i = 0, j = 1; i < MICROCODE_TOTALSIGS; i++, j<<=1) {
		if (uvec & j) pd.uvec[i]++;
	}

	// Process the MBU address lines
	if (mbu) {
		uint8_t bank = mbu_bank(cpu.ar) >> 13;
		for (i = 0, j = 1; i < 8; i++, j<<=1) {
			if (bank & j) pd.aext[i]++;
		}
	}

	// Acquire flags and single-bit registers
	if (cpu.n) pd.fn++;
	if (cpu.z) pd.fz++;
	if (cpu.v) pd.fv++;
	if (cpu.i) pd.fi++;
	if (cpu.l) pd.fl++;
	if (cpu.l) pd.fl++;
	if (cpu.mbuen) pd.mben++;
}


static void
_ui_tab_panel_draw()
{
	static int delay = 0;

	delay++;

	if (delay > 20 && pd.ticks) {
		//i++;
		//menu_xycprintf(10, 10, color(COL_ORANGE, COL_BLACK), "Foo: %d %d", pd.ticks, i);

		int i, j, k, col;
		for (i = 0; i < MICROCODE_TOTALSIGS; i++) {
			// The micro-instruction control vector
			col = min(3, 3 * pd.uvec[i] / pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 1, color(leds_uv[i][col], 0), LED_CHAR);
			pd.uvec[i] = 0;
		}

		for (i = 0; i < 16; i++) {
			// The micro-instruction control vector
			col = min(3, 3 * pd.uvec[i] / pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 1, color(leds_uv[i][col], 0), LED_CHAR);
			pd.uvec[i] = 0;

			// The PC
			col = min(3, 3 * pd.pc[i] / pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 5, color(led_r[col], 0), LED_CHAR);
			pd.pc[i] = 0;
			ui_xycprintf(PANEL_X0 + 44, PANEL_Y0 + 4, color(COL_LTGREY, COL_BLACK), "%04x", cpu.pc);

			// The AC
			col = min(3, 3 * pd.ac[i] / pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 9, color(led_r[col], 0), LED_CHAR);
			pd.ac[i] = 0;
			ui_xycprintf(PANEL_X0 + 44, PANEL_Y0 + 8, color(COL_LTGREY, COL_BLACK), "%04x", cpu.a);

			// The MFD
			col = min(3, 3 * pd.mfd[i] / pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 13, color(led_r[col], 0), LED_CHAR);
			pd.mfd[i] = 0;

			// The IR
			col = min(3, 3 * pd.ir[i] / pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 17, color(leds_ir[i][col], 0), LED_CHAR);
			pd.ir[i] = 0;

			// The SR
			for (j = 46, i = 0, k = 1; i < 16; i++, j-=2, k<<=1) {
				int fg, bg;
				fg = (i & 4) ? rgb(3,1,0) : rgb(3,2,0);
				bg = i == pd.sr_curs ? rgb(1,1,1) : rgb(0,0,0);
				ui_xycputs(PANEL_X0 + j,
					   PANEL_Y0 + 21,
					   pd.sr & k ? color(fg, bg) : color(fg, bg),
					   pd.sr & k ? "\xd3\xd4" : "\xd6\xd5");
			}
			ui_xycprintf(PANEL_X0 + 44, PANEL_Y0 + 20, color(COL_LTGREY, COL_BLACK), "%04x", pd.sr);
			if (pd.sr_acurs < 4) {
				//ui_cursor(1);
				ui_gotoxy(PANEL_X0 + 44 + pd.sr_acurs, PANEL_Y0 + 20);
			}
		}


		for (i = 0; i < 8; i++) {
			// The AEXT bus
			col = min(3, 3 * pd.aext[i] / pd.ticks);
			ui_xycputs(PANEL_X0 + 14 - (i * 2), PANEL_Y0 + 5, color(led_y[col], 0), LED_CHAR);
			pd.aext[i] = 0;
		}

		// Various single-bit registers
		
		// MBEN
		col = min(3, 3 * pd.mben / pd.ticks);
		ui_xycputs(PANEL_X0, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		pd.mben = 0;

		// Flags: N
		col = min(3, 3 * pd.fn / pd.ticks);
		ui_xycputs(PANEL_X0 + 4, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		pd.fn = 0;

		// Flags: Z
		col = min(3, 3 * pd.fz / pd.ticks);
		ui_xycputs(PANEL_X0 + 6, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		pd.fz = 0;

		// Flags: V
		col = min(3, 3 * pd.fv / pd.ticks);
		ui_xycputs(PANEL_X0 + 8, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		pd.fv = 0;

		// Flags: I
		col = min(3, 3 * pd.fi / pd.ticks);
		ui_xycputs(PANEL_X0 + 10, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		pd.fi = 0;

		// Flags: L
		col = min(3, 3 * pd.fl / pd.ticks);
		ui_xycputs(PANEL_X0 + 12, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		pd.fl = 0;

		pd.ticks = 0;
		v.dirty++;
	}

	
}


void
ui_tab_panel_focus()
{
	v.fb = &v.fb_menu;
	ui_cls(color(63, 0));

	ui_xycputs(PANEL_X0, PANEL_Y0, color(COL_WHITE, COL_BLACK), "Micro-Instruction Control Vector");
	ui_xycputs(PANEL_X0, PANEL_Y0 + 4, color(COL_WHITE, COL_BLACK), "MBU");
	ui_xycputs(PANEL_X0 + 4, PANEL_Y0 + 8, color(COL_WHITE, COL_BLACK), "Flags");
	
	ui_xycputs(PANEL_X0 + 16, PANEL_Y0 + 4, color(COL_WHITE, COL_BLACK), "Program Counter");

	ui_xycputs(PANEL_X0 + 16, PANEL_Y0 + 8, color(COL_WHITE, COL_BLACK), "Accumulator");
	ui_xycputs(PANEL_X0 + 16, PANEL_Y0 + 12, color(COL_WHITE, COL_BLACK), "OR/DR/uAddr");
	ui_xycputs(PANEL_X0 + 16, PANEL_Y0 + 16, color(COL_WHITE, COL_BLACK), "Instruction Register");
	ui_xycputs(PANEL_X0 + 16, PANEL_Y0 + 20, color(COL_WHITE, COL_BLACK), "Switch Register");
	
	int i, j;
	char digits[16] = "0123456789abcdef";
	for (j = 0; j < 5; j++) {
		for (i = 0; i < 16; i+=1) {
			ui_xycput(PANEL_X0 + 47 - i * 2,
				  PANEL_Y0 + 6 + 4 * j,
				  color(COL_DKGREY, COL_BLACK), digits[i]);
		}
	}

	ui_xycputs(PANEL_X0 + 16, PANEL_Y0 + 18, color(COL_DKGREY, COL_BLACK),
		   "OP3-OP0  I R");
	
	ui_xycputs(PANEL_X0, PANEL_Y0 + 2, color(COL_DKGREY, COL_BLACK),
		   " e w r m i   d ai0i1l0lt c if3-0   wu2-0 ru3-0");
	
	pd.sr_curs = 0;
	ui_cursor(0);

	_ui_tab_panel_draw();
	ui_gotoxy(UI_COLS - 1, UI_ROWS + 50); /* Hide the cursor */
	v.dirty++;
}


void
ui_tab_panel_unfocus()
{
}


void
ui_tab_panel_tick()
{
	_ui_tab_panel_acquire();
	_ui_tab_panel_draw();
}


int
ui_tab_panel_input(SDL_Event * event)
{
	int dirty = 0;

	switch (event->type) {
	case SDL_KEYDOWN:
		switch (event->key.keysym.sym) {
		case SDLK_LEFT:
		case SDLK_KP4:
			pd.sr_curs = (pd.sr_curs + 1) & 0xf;
			dirty = 1;
			break;
 
		case SDLK_RIGHT:
		case SDLK_KP6:
			pd.sr_curs = (pd.sr_curs - 1) & 0xf;
			dirty = 1;
			break;

		case SDLK_UP:
		case SDLK_KP8:
			pd.sr |= 1 << (pd.sr_curs & 0xf);
			snprintf(pd.sr_a, sizeof(pd.sr_a), "%04x", pd.sr & 0xffff);
			dfp_sr_changed(pd.sr);
			dirty = 1;
			break;

		case SDLK_DOWN:
		case SDLK_KP2:
			pd.sr &= ~(1 << (pd.sr_curs & 0xf));
			snprintf(pd.sr_a, sizeof(pd.sr_a), "%04x", pd.sr & 0xffff);
			dfp_sr_changed(pd.sr);
			dirty = 1;
			break;
			
		case SDLK_BACKSPACE:
			if (pd.sr_acurs > 0) pd.sr_acurs--;
			else {
				ui_cursor(1);
				pd.sr_acurs = 3;
			}
			dirty = 1;
			break;

		case SDLK_RETURN:
		case SDLK_KP_ENTER:
		case SDLK_SPACE:
			dirty = 1;
			break;

		case '0': case '1': case '2': case '3': case '4':
		case '5': case '6': case '7': case '8': case '9':
		case 'a': case 'b': case 'c': case 'd': case 'e':
		case 'f': case 'A': case 'B': case 'C': case 'D':
		case 'E': case 'F':
			ui_cursor(1);
			pd.sr_a[pd.sr_acurs] = event->key.keysym.sym;
			pd.sr_acurs = (pd.sr_acurs + 1) & 3;
			if (pd.sr_acurs == 0) ui_cursor(0);
			sscanf(pd.sr_a, "%hx", &pd.sr);
			dfp_sr_changed(pd.sr);
			dirty = 1;
			break;

		}
		break;
	}

	if (dirty) {
		_ui_tab_panel_draw();
		return 1;
	}
	return 0;
}


// End of file
