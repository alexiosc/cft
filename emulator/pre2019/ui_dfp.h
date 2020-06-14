/* 

ui_dfp.h - Debugging Front Panel, UI implementation.

Copyright (C) 2014 Alexios Chouchoulas

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

#ifndef UI_DFP_H
#define UI_DFP_H 1


void ui_tab_dfp_focus();

void ui_tab_dfp_tick();

int ui_tab_dfp_input(SDL_Event *);

void ui_tab_dfp_unfocus();

int ui_tab_dfp_autofocus();


#endif /* UI_DFP_H */

// End of file.
