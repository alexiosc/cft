/* 

cmdline.c - Parse command line options

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
#include <argp.h>

#include "cftemu.h"


static error_t parse_opt (int key, char *arg, struct argp_state *state);
static void show_version (FILE *stream, struct argp_state *state);

/* argp option keys */
enum {DUMMY_KEY=129
      ,KEY_DEBUG_MICROCODE
      ,KEY_DEBUG_IO
      ,KEY_DEBUG_ASM
};

static struct argp_option options[] =
{
	{ "brief-help",        'h',     NULL,             0,
	  "Show brief syntax help", 1 },
	{ "verbose",     'v',           NULL,            0,
	  "Print more information (cumulative)", 0 },
	{ "debug-microcode", KEY_DEBUG_MICROCODE, NULL, 0,
	  "Print out microcode-level information (insane amounts of output)", 0 },
	{ "debug-io", KEY_DEBUG_IO, NULL, 0,
	  "Print out microcode-level information (insane amounts of output)", 0 },
	{ "debug-asm", KEY_DEBUG_ASM, NULL, 0,
	  "Print out assembly instructions as they are executed.", 0 },
	{ "pasm", 'p', "PASM-FILE", 0,
	  "Load a .pasm file. Where available, use its contents when --debug-asm is "
	  "printing out assembly instructions.", 0 },
	{ "map", 'M', "MAP-FILE", 0,
	  "Load a .map file. Where possible, use it to simplify listing of addresses.",
	  0 },
	{ "testing",     't',           NULL,            0,
	  "Enable test/debug device and testing output.", 0 },
	{ "microcode",     'm',           NULL,            0,
	  "Select microcode basename (cumulative)", 0 },
	{ "log",     'l',           "FILE",            0,
	  "File to log output to (default: output)", 0 },
	{ NULL, 0, NULL, 0, NULL, 0 }
};


/* The argp functions examine these global variables.  */

const char *argp_program_bug_address =
"Alexios Chouchoulas <alexios@bedroomlan.org>";

void (*argp_program_version_hook) (FILE *, struct argp_state *) = show_version;

static struct argp argp =
{
	options, parse_opt,
	"MEMORY-IMAGE",
	"CFT CPU Emulator",
	NULL, NULL, NULL
};

/* Parse a single option.  */
static error_t
parse_opt (int key, char *arg, struct argp_state *state)
{
	switch (key)
	{
	case ARGP_KEY_INIT:
		/* Set up default values.  */
		verbose = 0;
		memimg_name = NULL;
		memimg_file = NULL;
		break;
		
	case 'h':
		argp_help (&argp, stderr,
			   ARGP_HELP_USAGE|ARGP_HELP_EXIT_OK, PACKAGE);
		exit (0);
		
	case 'v':
		verbose++;
		break;

	case KEY_DEBUG_MICROCODE:
		debug_microcode++;
		break;
		
	case KEY_DEBUG_IO:
		debug_io++;
		break;
		
	case KEY_DEBUG_ASM:
		debug_asm++;
		break;

	case 't':
		testing++;
		break;
		
	case 'l':
		log_name = strdup (arg);
		break;

	case 'p':
		pasm_name = strdup (arg);
		pasm_file = fopen (pasm_name, "r");
		if (!pasm_file) {
			argp_failure (state, EXIT_FAILURE, errno,
				      "Cannot open .pasm file %s for reading",
				      pasm_name);
		}
		break;

	case 'M':
		map_name = strdup (arg);
		map_file = fopen (map_name, "r");
		if (!map_file) {
			argp_failure (state, EXIT_FAILURE, errno,
				      "Cannot open .map file %s for reading",
				      map_name);
		}
		break;

	case ARGP_KEY_ARG:	// MEMORY-IMAGE (only one allowed)
		if (memimg_name == NULL) {
			memimg_name = strdup (arg);
			memimg_file = fopen (memimg_name, "r");
			if (!memimg_file)
				argp_failure (state, EXIT_FAILURE, errno,
					      "Cannot open %s for reading",
					      memimg_name);
		} else {
			argp_usage (state);
		}
		
		break;
		
	default:
		return ARGP_ERR_UNKNOWN;
	}
	
	return 0;
}

/* Show the version number and copyright information.  */

static void
show_version (FILE *stream, struct argp_state *state)
{
	(void) state;
	/* Print in small parts whose localizations can hopefully be copied
	   from other programs.  */
	fputs(PACKAGE" "VERSION"\n", stream);
	fprintf(stream, "Written by %s.\n\n", "Alexios Chouchoulas");
	fprintf(stream, "Copyright (C) %s %s\n",
		"2011", "Alexios Chouchoulas");
	fputs("This program is free software; you may redistribute it "
	      "under the terms of\n\the GNU General Public License.  "
	      "This program has absolutely no warranty.\n",
	      stream);
}

void
cmdline_parse(int argc, char **argv)
{
	argp_parse (&argp, argc, argv, 0, NULL, NULL);
	
	if (memimg_name == NULL) {
		fprintf (stderr,
			 PACKAGE ": please specify a memory image to load.\n");
		argp_help (&argp, stderr, ARGP_HELP_USAGE, PACKAGE);
		exit (1);
	}
	
}

/* End of file. */
