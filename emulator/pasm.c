/* 
   
pasm.c - CFT emulator PASM-based debugging

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
#include "memory.h"

static char * _source[ADDRSPACE];

char *pasm_name;
FILE *pasm_file = NULL;


void
pasm_load()
{
	int i;
	for (i = 0; i < ADDRSPACE; i++) _source[i] = NULL;

	/* Only act if a PASM file has been provided */
	if (pasm_file == NULL) return;

	while (!feof(pasm_file)) {
		char line[4096], *ep;
		word addr;
		if (fgets(line, sizeof(line), pasm_file) == NULL) {
			if (feof(pasm_file)) break;
			perror("reading source");
			exit(1);
		}

		if ((ep = strrchr(line, '\n')) != NULL) *ep = '\0';
		if ((i = sscanf(line, "&%04hx:", &addr)) != 1) {
			continue;
		}
		if ((ep = strchr(line, ';')) != NULL) {
			ep++;
			while (((*ep == ' ') || (*ep == '\t')) && (*ep != '\0')) *ep++;
			_source[addr] = strdup(ep);
		}
	}
}


const char *
pasm_get(word addr)
{
	return _source[addr];
}

/* End of file. */
