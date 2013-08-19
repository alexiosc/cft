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
#include "panel.h"
#include "emulator.h"
#include "util.h"
#include "uterm.h"
#include "ui.h"


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


typedef enum { mfd_or, mfd_dr, mfd_uaddr } mfd_t;

typedef struct {
	int ticks;

	mfd_t mfdsrc;

	int uvec[MICROCODE_TOTALSIGS];
	int aext[8];
	int mben;

	int fn, fz, fv, fi, fl;

	int pc[16];
	int ac[16];
	int mfd[16];
	int ir[16];
} panel_t;


static panel_t _pd;

#define PANEL_X0 2
#define PANEL_Y0 1


static void
_ui_tab_panel_acquire()
{
	static int initialised = 0;
	if (!initialised) {
		memset(&_pd, 0, sizeof(_pd));
		initialised = 1;

		_pd.mfdsrc = mfd_or;
	}

	int i, j;

	_pd.ticks++;

	// Process the source of MFD data (OR/DR/uAddr)
	word mfd;
	switch (_pd.mfdsrc) {
	case mfd_or:
		mfd = output_register;
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
		if (cpu.a & j) _pd.ac[i]++;
		if (cpu.pc & j) _pd.pc[i]++;
		if (cpu.ir & j) _pd.ir[i]++;
		if (mfd & j) _pd.mfd[i]++;
	}

	// Process the control vector
	uint32_t uvec = cpu.control ^ UVEC_XORMASK;
	for (i = 0, j = 1; i < MICROCODE_TOTALSIGS; i++, j<<=1) {
		if (uvec & j) _pd.uvec[i]++;
	}

	// Process the MBU address lines
	if (mbu) {
		uint8_t bank = mbu_bank(cpu.ar) >> 13;
		for (i = 0, j = 1; i < 8; i++, j<<=1) {
			if (bank & j) _pd.aext[i]++;
		}
	}

	// Acquire flags and single-bit registers
	if (cpu.n) _pd.fn++;
	if (cpu.z) _pd.fz++;
	if (cpu.v) _pd.fv++;
	if (cpu.i) _pd.fi++;
	if (cpu.l) _pd.fl++;
	if (cpu.l) _pd.fl++;
	if (cpu.mbuen) _pd.mben++;
}


static void
_ui_tab_panel_draw()
{
	static int delay = 0;

	delay++;

	if (delay > 20 && _pd.ticks) {
		//i++;
		//menu_xycprintf(10, 10, color(COL_ORANGE, COL_BLACK), "Foo: %d %d", _pd.ticks, i);

		int i, col;
		for (i = 0; i < MICROCODE_TOTALSIGS; i++) {
			// The micro-instruction control vector
			col = min(3, 3 * _pd.uvec[i] / _pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 1, color(leds_uv[i][col], 0), LED_CHAR);
			_pd.uvec[i] = 0;
		}

		for (i = 0; i < 16; i++) {
			// The micro-instruction control vector
			col = min(3, 3 * _pd.uvec[i] / _pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 1, color(leds_uv[i][col], 0), LED_CHAR);
			_pd.uvec[i] = 0;

			// The PC
			col = min(3, 3 * _pd.pc[i] / _pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 5, color(led_r[col], 0), LED_CHAR);
			_pd.pc[i] = 0;

			// The AC
			col = min(3, 3 * _pd.ac[i] / _pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 9, color(led_r[col], 0), LED_CHAR);
			_pd.ac[i] = 0;

			// The MFD
			col = min(3, 3 * _pd.mfd[i] / _pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 13, color(led_r[col], 0), LED_CHAR);
			_pd.mfd[i] = 0;

			// The IR
			col = min(3, 3 * _pd.ir[i] / _pd.ticks);
			ui_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 17, color(leds_ir[i][col], 0), LED_CHAR);
			_pd.ir[i] = 0;
		}


		for (i = 0; i < 8; i++) {
			// The AEXT bus
			col = min(3, 3 * _pd.aext[i] / _pd.ticks);
			ui_xycputs(PANEL_X0 + 14 - (i * 2), PANEL_Y0 + 5, color(led_y[col], 0), LED_CHAR);
			_pd.aext[i] = 0;
		}

		// Various single-bit registers
		
		// MBEN
		col = min(3, 3 * _pd.mben / _pd.ticks);
		ui_xycputs(PANEL_X0, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.mben = 0;

		// Flags: N
		col = min(3, 3 * _pd.fn / _pd.ticks);
		ui_xycputs(PANEL_X0 + 4, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fn = 0;

		// Flags: Z
		col = min(3, 3 * _pd.fz / _pd.ticks);
		ui_xycputs(PANEL_X0 + 6, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fz = 0;

		// Flags: V
		col = min(3, 3 * _pd.fv / _pd.ticks);
		ui_xycputs(PANEL_X0 + 8, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fv = 0;

		// Flags: I
		col = min(3, 3 * _pd.fi / _pd.ticks);
		ui_xycputs(PANEL_X0 + 10, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fi = 0;

		// Flags: L
		col = min(3, 3 * _pd.fl / _pd.ticks);
		ui_xycputs(PANEL_X0 + 12, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fl = 0;





		_pd.ticks = 0;
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
	
	int i, j;
	char digits[16] = "0123456789abcdef";
	for (j = 0; j < 4; j++) {
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
	return 0;
}


// End of file
