/* 
   
map.c - CFT emulator MAP file decoding

Copyright (C) 2011 Alexios Chouchoulas

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
#include <sys/types.h>

#include "cftemu.h"


/* This is about to get quite hairy, but modern machines have so much
 * memory it should be a dawdle. */
static char * _map[ADDRSPACE];

char *map_name;
FILE *map_file = NULL;


void
map_load()
{
	int i;
	for (i = 0; i < ADDRSPACE; i++) _map[i] = NULL;

	/* Only act if a MAP file has been provided */
	if (map_file == NULL) return;

	while (!feof(map_file)) {
		char line[4096], *ep, symbol[80];
		word addr;
		if (fgets(line, sizeof(line), map_file) == NULL) {
			if (feof(map_file)) break;
			perror("reading source");
			exit(1);
		}
		if (sscanf(line, "%s %04x", symbol, &addr) == 2) {
			_map[addr] = strdup(symbol);
		}
	}

	char * oldlabel = "";
	int addr;
	i = 0;
	for(addr = 0; addr < ADDRSPACE; addr++, i++) {
		char * label = _map[addr];
		if (label != NULL) {
			oldlabel = label;
			i = 0;
		} else {
			char loc[80];
			snprintf(loc, sizeof(loc), "%s+%d", oldlabel, i);
			_map[addr] = strdup(loc);
		}
		//printf("*** %04x -> %s\n", addr, _map[addr]);
	}
}


const char *
map_get(word addr)
{
	return _map[addr];
}

/* End of file. */
