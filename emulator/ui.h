/* 

ui.h - The emulator user interface

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

#ifndef UI_H
#define UI_H 1


#define UI_COLS 80
#define UI_ROWS 30
#define UI_STATUS_ROWS 2
#define UI_STATUS_OFS 65536

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
	
	void     (*init)();
	void     (*done)();
	void     (*tick)();
	void     (*focus)();
	void     (*unfocus)();
	int      (*input)(SDL_Event *);
} tab_t;


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


typedef struct {
	int tab;		/* Active tab */
	int oldtab;		/* Previous non-menu tab */

	int menu_x, menu_y;	/* Menu location */
	menu_t * menu;		/* Menu to display (when needed) */
	int menu_sel;		/* Active menu option */
	int menu_entries;	/* Number of menu entries */
} console_t;


extern console_t cons;


void ui_use_menu();

void ui_use_status();

void ui_fill(int x, int y, int w, int h, int attr, int c);

void ui_xycput(int x, int y, int attr, int c);

void ui_cls(int attr);

void ui_status_cls();

void ui_xycputs(int x, int y, word attr, const char *s);

void ui_gotoxy(int x, int y);

void ui_xycprintf(int x, int y, word attr, const char *fmt, ...);

void ui_xycprintfr(int r, int y, word attr, const char *fmt, ...);


void ui_init();

void ui_tick();

void ui_done();


void ui_tab(int i);

void ui_menu_do(menu_t * menu);

void ui_show_menu();

void ui_menu_move(int d);



#endif /* UI_H */

/* End of file. */
