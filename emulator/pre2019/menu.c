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


#define MENU_COLS 80
#define MENU_PITCH 128
#define MENU_ROWS 25
#define MENU_STATUS_ROWS 2

#define COL_BLACK 0
#define COL_DKGREY 21
#define COL_LTGREY 42
#define COL_WHITE  63
#define COL_ORANGE 11

#define ATTR_STATUS color(COL_BLACK, COL_DKGREY)
#define ATTR_TAB color(COL_BLACK, COL_LTGREY)
#define ATTR_TAB_ACTIVE color(COL_BLACK, COL_ORANGE)
#define ATTR_BG color(COL_ORANGE, COL_DKGREY)

#define ATTR_MENU color(COL_ORANGE, COL_DKGREY)
#define ATTR_DISABLED color(COL_LTGREY, COL_DKGREY)
#define ATTR_SEL color(COL_ORANGE, COL_BLACK)
#define ATTR_SEL_SHORTCUT color(COL_ORANGE, COL_BLACK)
#define ATTR_SEL_DISABLED color(COL_DKGREY, COL_BLACK)
#define ATTR_SHORTCUT color(COL_WHITE, COL_DKGREY)


#define CB_RUN(x) if(x) (*x)
#define CB(x) menu_tab_##x

typedef struct {
	char   * name;
	SDLKey   hotkey;
	int    * disabled;
	
	void     (*tick)();
	void     (*focus)();
	void     (*unfocus)();
	int      (*input)(SDL_Event *);
} tab_t;


static void menu_tab_vdu_focus();
static void menu_tab_menu_focus();
static int menu_tab_menu_input(SDL_Event *);
static void menu_tab_menu_unfocus();

static int menu_tab_panel_input(SDL_Event *);
static void menu_tab_panel_tick();
static void menu_tab_panel_focus();
static void menu_tab_panel_unfocus();


static tab_t tabs[] = 
{
	{
		.name = "F8 VDU",
		.hotkey = SDLK_F8,
		.focus = menu_tab_vdu_focus,
	},
/*
	{
		.name = "F9 TTY",
		.hotkey = SDLK_F9,
		.focus = menu_tab_menu_focus,
		.unfocus = menu_tab_menu_unfocus
	},
*/
/*
	{
		.name = "F10 DEB",
		.hotkey = SDLK_F10,
		.focus = menu_tab_menu_focus,
		.unfocus = menu_tab_menu_unfocus
	},
*/
	{
		.name = "F11 Panel",
		.hotkey = SDLK_F11,
		.focus = menu_tab_panel_focus,
		.unfocus = menu_tab_panel_unfocus,
		.tick = menu_tab_panel_tick,
		.input = menu_tab_panel_input,
	},

	{
		.name = "F1 Menu",
		.hotkey = SDLK_F1,
		.focus = menu_tab_menu_focus,
		.input = menu_tab_menu_input,
		.unfocus = menu_tab_menu_unfocus
	},

	{
		.name = NULL
	}
};



typedef struct menu {
	char *   name;
	char     shortcut;
	int      key;

	int      disabled:1;

	char *   value;
	void (*handler)(SDL_Event *, int key);
	char *(*getval)(int key);
} menu_t;


#define MENU_ENTRY_SEPARATOR { .name = "", .disabled = 1 }
#define MENU_ENTRY_END { .name = NULL }


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


typedef struct {
	int tab;		/* Active tab */
	int oldtab;		/* Previous non-menu tab */

	int menu_x, menu_y;	/* Menu location */
	menu_t * menu;		/* Menu to display (when needed) */
	int menu_sel;		/* Active menu option */
	int menu_entries;	/* Number of menu entries */
} console_t;


static console_t c;


static void
menu_fill(int x, int y, int w, int h, int attr, int c)
{
	int xi, yi, ofs;
	
	for (yi = 0; yi < h; yi++) {
		ofs = vector(x, y + yi);
		for (xi = 0; xi < w; xi++, ofs++) {
			if (attr >= 0) v.fb_menu.c[ofs] = attr;
			if (c >= 0) v.fb_menu.b[ofs] = c;
		}
	}
}


static void
menu_xycput(int x, int y, int attr, int c)
{
	int ofs = vector(x, y);
	if (attr >= 0) v.fb_menu.c[ofs] = attr;
	if (c >= 0) v.fb_menu.b[ofs] = c;
}


static void
menu_cls(int attr)
{
	menu_fill(0, 0, MENU_COLS, MENU_ROWS, attr, 32);
}


static void
menu_status_cls()
{
	menu_fill(0, MENU_ROWS, MENU_COLS, MENU_STATUS_ROWS, ATTR_STATUS, 32);
}


static void
menu_xycputs(int x, int y, word attr, const char *s)
{
	int ofs = vector(x, y);
	while (*s) {
		v.fb_menu.c[ofs] = attr;
		v.fb_menu.b[ofs] = *s;
		ofs++;
		s++;
	}
}


static void
menu_gotoxy(int x, int y)
{
	v.fb_menu.car = vector(x, y);
}


static void
menu_xycprintf(int x, int y, word attr, const char *fmt, ...)
{
	va_list ap;
	char * buf;

	va_start(ap, fmt);
	vasprintf(&buf, fmt, ap);
	va_end(ap);

	assert(buf != NULL);
	menu_xycputs(x, y, attr, buf);
	free(buf);
}


static void
menu_xycprintfr(int r, int y, word attr, const char *fmt, ...)
{
	va_list ap;
	char * buf;

	va_start(ap, fmt);
	vasprintf(&buf, fmt, ap);
	va_end(ap);

	menu_xycputs(r - strlen(buf), y, attr, buf);
	free(buf);
}


void menu_show_tabs()
{
	int row = MENU_ROWS;
	int pitch = 12;

	menu_fill (0, row, MENU_COLS, 1, ATTR_STATUS, 32);
	int i;
	for (i = 0; tabs[i].name != NULL; i++){
		menu_xycprintf(i * pitch, row,
			       i == c.tab? ATTR_TAB_ACTIVE : ATTR_TAB,
			       "\014 %-9.9s\012", tabs[i].name);
		menu_xycput(i * pitch, row,
			    i == c.tab? color(COL_ORANGE, COL_DKGREY) : color(COL_LTGREY, COL_DKGREY),
			    -1);
		menu_xycput(i * pitch + pitch - 1, row,
			    i == c.tab? color(COL_ORANGE, COL_DKGREY) : color(COL_LTGREY, COL_DKGREY),
			    -1);
	}
}


void menu_init()
{
	c.tab = 0;
	c.oldtab = 0;
	c.menu_sel = 0;
	c.menu_entries = 0;
	c.menu = NULL;
	c.menu_x = 20;
	c.menu_y = 3;

	v.fb_menu.mcr = MODE_TEXT_80x25;
	v.fb_menu.ser = 2000;
	v.fb_menu.ccr = CCR_CURSOR_BLINK_FAST | 0x2c0;
	v.fb_menu.vwr = 0;
	v.fb_menu.ssr = 0;
	v.fb_menu.scr = 0;
	v.fb_menu.car = 0;

	menu_cls(ATTR_BG);
	menu_status_cls();
	menu_show_tabs();

	menu_xycprintfr(80, MENU_ROWS + 1, color(0, COL_ORANGE), " CFT Emulator " VERSION " ");
	v.dirty++;
	v.stdirty++;
}


static void
menu_show_menu()
{
	menu_t * menu = c.menu;
	int x = c.menu_x;
	int y = c.menu_y;
	int i;
	char buf[256];

	for (i = 0; menu->name != NULL; i++, y++, menu++) {
		// Separator
		if (!menu->name[0]) continue;
		
		strcpy(buf, menu->name);
		if (menu->getval) {
			strcat(buf, ": ");
			strcat(buf, (*menu->getval)(menu->key));
		}

		if (i == c.menu_sel) {
			menu_gotoxy(x-1, y);
		}

		if (menu->disabled) {
			menu_xycputs(x, y,
				     i == c.menu_sel ? ATTR_SEL_DISABLED : ATTR_DISABLED,
				     buf);
			continue;
		}
		menu_xycputs(x, y, i == c.menu_sel ? ATTR_SEL : ATTR_MENU, buf);

		if (menu->shortcut) {
			char *cp;
			for (cp = buf; *cp; cp++) *cp = tolower(*cp);
			int j = strchr(buf, tolower(menu->shortcut)) - buf;
			if (j >= 0) 
				menu_xycput(x + j, y,
					    i == c.menu_sel ? ATTR_SEL_SHORTCUT : ATTR_SHORTCUT, -1);
		}
	}
	c.menu_entries = i;

	v.dirty++;
}


static void
menu_tab_vdu_focus()
{
	printf("VDU Focus\n");
	v.fb = &v.fb_cft;
}


static void
menu_do(menu_t * menu)
{
	if (c.menu != menu) {
		c.menu = menu;
		c.menu_sel = 0;
	}
	menu_show_menu();
}


static void
menu_tab_menu_focus()
{
	cpu.pause++;
	printf("Menu Focus\n");
	v.fb = &v.fb_menu;
	menu_return_main(NULL, 0);
}


static void
menu_tab_menu_unfocus()
{
	printf("Menu Unfocus\n");
	cpu.pause--;
}


static void
menu_move(int d)
{
	int i;
	for (i = 0; i < c.menu_entries; i++) {
		c.menu_sel += d;
		if (c.menu_sel < 0) c.menu_sel = c.menu_entries - 1;
		else if (c.menu_sel >= c.menu_entries) c.menu_sel = 0;
		if (c.menu[c.menu_sel].disabled) continue;
		if (c.menu[c.menu_sel].name[0] == '\0') continue;
		break;
	}
	menu_show_menu();
}


static int
menu_tab_menu_input(SDL_Event * event)
{
	switch (event->type) {
	case SDL_KEYDOWN:
		switch (event->key.keysym.sym) {
		case SDLK_UP:
		case SDLK_KP8:
			menu_move(-1);
			return 1;
		case SDLK_DOWN:
		case SDLK_KP2:
			menu_move(1);
			return 1;
		case SDLK_HOME:
			c.menu_sel = c.menu_entries - 1;
			menu_move(1);
			return 1;
		case SDLK_END:
			c.menu_sel = 0;
			menu_move(-1);
			return 1;
		case SDLK_RETURN:
		case SDLK_KP_ENTER:
		case SDLK_SPACE:
			CB_RUN(c.menu[c.menu_sel].handler)(event, c.menu[c.menu_sel].key);
			return 1;
		default:
		{
			int i;
			for (i = 0; i < c.menu_entries; i++) {
				if (event->key.keysym.sym == tolower(c.menu[i].shortcut)) {
					c.menu_sel = i;
					menu_show_menu();
					CB_RUN(c.menu[c.menu_sel].handler)(event, c.menu[c.menu_sel].key);
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


static void
menu_tab(int i)
{
	CB_RUN(tabs[c.tab].unfocus)();
	v.dirty++;
	if (c.tab != i) c.oldtab = c.tab;
	c.tab = i;
	CB_RUN(tabs[c.tab].focus)();
	v.dirty++;
	menu_show_tabs();
	v.stdirty++;
}



static void
menu_key(SDL_Event event)
{
	SDL_keysym * k = &event.key.keysym;
	
	// Quit?
	if ((k->sym == 'c' || k->sym == '\\') &&
	    (k->mod & (KMOD_CTRL|KMOD_LCTRL|KMOD_RCTRL))) {
		quit(0);
	}

	// Handle tab hotkeys
	int i;
	for (i = 0; tabs[i].name != NULL; i++){
		if (k->mod == 0 && k->sym == tabs[i].hotkey) {
			menu_tab(i);
			return;
		}
	}

	printf("The %s key was pressed (state=%x (%x))!\n",
	       SDL_GetKeyName(k->sym), k->mod, KMOD_CTRL);
}



int colorscale[10] = {
	rgb(0,0,0),
	rgb(1,0,0),
	rgb(2,0,0),
	rgb(3,0,0),
	rgb(3,1,0),
	rgb(3,2,0),
	rgb(3,3,0),
	rgb(3,3,1),
	rgb(3,3,2),
	rgb(3,3,3),
};


void
menu_tick()
{
	static int delay = 0;

	delay++;

	if (delay > 20) {
		delay = 0;
		// Draw the status line
		int i, x;
		for (i = 0; iodevs[i].name; i++) {
			x = min(iodevs[i].hits / 100, 9);
			menu_xycprintf(i * 5, MENU_ROWS + 1,
				       color(colorscale[x], COL_DKGREY), iodevs[i].code);
			iodevs[i].hits = max(0, iodevs[i].hits - 60);
		}
		v.stdirty++;
	}

	// Tick the current tab.
	CB_RUN(tabs[c.tab].tick)();

	SDL_Event event;
	if (!SDL_PollEvent (&event)) return;

	// Let the current tab process the event first.
	if (tabs[c.tab].input) {
		if ((*tabs[c.tab].input)(&event)) return;
	}

	switch (event.type) {
	case SDL_KEYDOWN:
		menu_key(event);
		break;

	case SDL_QUIT:
		quit(0);
		break;
	}
}


void menu_done()
{
}


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
	menu_tab(c.oldtab);
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


///////////////////////////////////////////////////////////////////////////////
//
// THE FRONT PANEL TAB
//
///////////////////////////////////////////////////////////////////////////////


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
_menu_tab_panel_acquire()
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
		uint8_t bank = cpu.mbu[(cpu.ar >> 13) & 7] >> 13;
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
	if (mben) _pd.mben++;
}


int led_r[4] = {rgb(1,0,0), rgb(2,0,0), rgb(3,0,0), rgb(3,1,1)};
int led_y[4] = {rgb(1,1,0), rgb(2,2,0), rgb(3,3,0), rgb(3,3,1)};
int led_g[4] = {rgb(0,1,0), rgb(0,2,0), rgb(0,3,0), rgb(1,3,1)};

#define R led_r
#define Y led_y
#define G led_g
int * leds_ir[16] = {R, R, R, R, R, R, R, R, R, R, Y, R, Y, Y, Y, Y};
int * leds_uv[24] = {Y, Y, Y, Y, R, R, R, Y, Y, Y, Y, R, Y, Y, Y, Y, R, R, R, Y, Y, G, R, Y};

#define LED_CHAR "\5\6"

static void
_menu_tab_panel_draw()
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
			menu_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 1, color(leds_uv[i][col], 0), LED_CHAR);
			_pd.uvec[i] = 0;
		}

		for (i = 0; i < 16; i++) {
			// The micro-instruction control vector
			col = min(3, 3 * _pd.uvec[i] / _pd.ticks);
			menu_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 1, color(leds_uv[i][col], 0), LED_CHAR);
			_pd.uvec[i] = 0;

			// The PC
			col = min(3, 3 * _pd.pc[i] / _pd.ticks);
			menu_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 5, color(led_r[col], 0), LED_CHAR);
			_pd.pc[i] = 0;

			// The AC
			col = min(3, 3 * _pd.ac[i] / _pd.ticks);
			menu_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 9, color(led_r[col], 0), LED_CHAR);
			_pd.ac[i] = 0;

			// The MFD
			col = min(3, 3 * _pd.mfd[i] / _pd.ticks);
			menu_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 13, color(led_r[col], 0), LED_CHAR);
			_pd.mfd[i] = 0;

			// The IR
			col = min(3, 3 * _pd.ir[i] / _pd.ticks);
			menu_xycputs(PANEL_X0 + 46 - (i * 2), PANEL_Y0 + 17, color(leds_ir[i][col], 0), LED_CHAR);
			_pd.ir[i] = 0;
		}


		for (i = 0; i < 8; i++) {
			// The AEXT bus
			col = min(3, 3 * _pd.aext[i] / _pd.ticks);
			menu_xycputs(PANEL_X0 + 14 - (i * 2), PANEL_Y0 + 5, color(led_y[col], 0), LED_CHAR);
			_pd.aext[i] = 0;
		}

		// Various single-bit registers
		
		// MBEN
		col = min(3, 3 * _pd.mben / _pd.ticks);
		menu_xycputs(PANEL_X0, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.mben = 0;

		// Flags: N
		col = min(3, 3 * _pd.fn / _pd.ticks);
		menu_xycputs(PANEL_X0 + 4, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fn = 0;

		// Flags: Z
		col = min(3, 3 * _pd.fz / _pd.ticks);
		menu_xycputs(PANEL_X0 + 6, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fz = 0;

		// Flags: V
		col = min(3, 3 * _pd.fv / _pd.ticks);
		menu_xycputs(PANEL_X0 + 8, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fv = 0;

		// Flags: I
		col = min(3, 3 * _pd.fi / _pd.ticks);
		menu_xycputs(PANEL_X0 + 10, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fi = 0;

		// Flags: L
		col = min(3, 3 * _pd.fl / _pd.ticks);
		menu_xycputs(PANEL_X0 + 12, PANEL_Y0 + 9, color(led_g[col], 0), LED_CHAR);
		_pd.fl = 0;





		_pd.ticks = 0;
		v.dirty++;
	}

	
}


static void
menu_tab_panel_focus()
{
	v.fb = &v.fb_menu;
	menu_cls(color(63, 0));

	menu_xycputs(PANEL_X0, PANEL_Y0, color(COL_WHITE, COL_BLACK), "Micro-Instruction Control Vector");
	menu_xycputs(PANEL_X0, PANEL_Y0 + 4, color(COL_WHITE, COL_BLACK), "MBU");
	menu_xycputs(PANEL_X0 + 4, PANEL_Y0 + 8, color(COL_WHITE, COL_BLACK), "Flags");
	
	menu_xycputs(PANEL_X0 + 16, PANEL_Y0 + 4, color(COL_WHITE, COL_BLACK), "Program Counter");
	menu_xycputs(PANEL_X0 + 16, PANEL_Y0 + 8, color(COL_WHITE, COL_BLACK), "Accumulator");
	menu_xycputs(PANEL_X0 + 16, PANEL_Y0 + 12, color(COL_WHITE, COL_BLACK), "OR/DR/uAddr");
	menu_xycputs(PANEL_X0 + 16, PANEL_Y0 + 16, color(COL_WHITE, COL_BLACK), "Instruction Register");
	
	int i, j;
	char digits[16] = "0123456789abcdef";
	for (j = 0; j < 4; j++) {
		for (i = 0; i < 16; i+=1) {
			menu_xycput(PANEL_X0 + 47 - i * 2,
				    PANEL_Y0 + 6 + 4 * j,
				    color(COL_DKGREY, COL_BLACK), digits[i]);
		}
	}

	menu_xycputs(PANEL_X0 + 16, PANEL_Y0 + 18, color(COL_DKGREY, COL_BLACK),
		     "OP3-OP0  I R");
	
	menu_xycputs(PANEL_X0, PANEL_Y0 + 2, color(COL_DKGREY, COL_BLACK),
		     " e w r m i   d ai0i1l0lt c if3-0   wu2-0 ru3-0");
	

	_menu_tab_panel_draw();
	menu_gotoxy(MENU_COLS - 1, MENU_ROWS + 50); /* Hide the cursor */
	v.dirty++;
}


static void
menu_tab_panel_unfocus()
{
}


static void
menu_tab_panel_tick()
{
	_menu_tab_panel_acquire();
	_menu_tab_panel_draw();
}


static int
menu_tab_panel_input(SDL_Event * event)
{
	return 0;
}


static void menu_handler_csdemo(SDL_Event * event, int key)
{
	menu_cls(ATTR_BG);
	static int base = 0;

	if (key) base += key * 512;
	//else base = 0;
	base = base & 0x7fff;
	
	int i, j;

	for (i = 0; i < 32; i++) {
		menu_xycprintf(7 + i * 2, 2, color(COL_LTGREY, COL_DKGREY), "%x", i & 0xf);
		if (i > 15) menu_xycprintf(7 + i * 2, 1, color(COL_LTGREY, COL_DKGREY), "%x", i >> 4);
	}
	
	menu_fill(7, 3, 64, 16, color(COL_WHITE, COL_BLACK), -1);
		

	for (j = 0; j < 16; j++) {
		menu_xycprintf(2, 3 + j, color(COL_LTGREY, COL_DKGREY), "%4x", base + j * 32);
		for (i = 0; i < 32; i++) {
			menu_xycput(7 + i * 2, 3 + j, color(COL_WHITE, COL_BLACK), base + j * 32 + i);
		}
	}

	v.dirty++;

	c.menu_y = 20;
	menu_do(menu_csdemo);
}


static void menu_handler_paldemo(SDL_Event * event, int key)
{
	int r, g, b;

	menu_cls(ATTR_BG);
	b = 0;
	for (r = 0; r < 4; r++) {
		for (g = 0; g < 4; g++) {
			for (b = 0; b < 4; b++) {
				int col = rgb(r, g, b);
				menu_xycprintf(7 + r*4 + (g)*16, 2+2*b + (0)*8,
					       color((r+(g+1)+(b-1))<3 ? COL_WHITE : COL_BLACK, col), "%2d  ", col);
				menu_xycputs(7 + r*4 + (g)*16, 3+2*b + (0)*8, color(0, col), "    ");
			}
		}
	}
	v.dirty++;

	c.menu_y = 13;
	menu_do(menu_back);
}


static void menu_return_main(SDL_Event * event, int key)
{
	c.menu_x = 20;
	c.menu_y = 3;
	menu_cls(ATTR_BG);
	menu_do(menu_main);
}

/* End of file. */
