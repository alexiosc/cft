// -*- c -*-
// 
// cmdline.h — Command-line parsing interface
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <argp.h>


static error_t parse_opt (int key, char *arg, struct argp_state *state);

static void show_version (FILE *stream, struct argp_state *state);


/* argp option keys */
enum {DUMMY_KEY=129
      ,KEY_DEBUG_MICROCODE
      ,KEY_DEBUG_MEM
      ,KEY_DEBUG_IO
      ,KEY_DEBUG_ASM
      ,KEY_IMAGE_START
      ,KEY_IMAGE_SIZE
      ,KEY_NO_SANITY
      ,KEY_SOME_SANITY
      ,KEY_SENTINEL

      ,KEY_MBU
      ,KEY_NO_MBU
      ,KEY_DEBUG_MBU

      ,KEY_IRC
      ,KEY_NO_IRC
      ,KEY_DEBUG_IRC

      ,KEY_NVRAM

      ,KEY_DEBUG_DUART
      ,KEY_DUART_STDIO

      ,KEY_HD0
      ,KEY_HD1
      ,KEY_HD2
      ,KEY_HD3
      ,KEY_IDE_SPEED
      ,KEY_DEBUG_IDE
      
      ,KEY_FS

      // ,KEY_DEB_PTS
      // ,KEY_DEB_TTY
      // ,KEY_DEB_IN
      // ,KEY_DEB_OUT
      ,KEY_DFP_PTS
      ,KEY_DFP_TTY
      ,KEY_DFP_IN
      ,KEY_DFP_OUT
      ,KEY_DFP_TESTMODE

      ,KEY_PSG
      ,KEY_NO_PSG
      ,KEY_DEBUG_PSG

      ,KEY_DEBUG_VIDEO
};


static struct argp_option options[] =
{
	{ "brief-help",        'h',     NULL,             0,
	  "Show brief syntax help", 1 },
	{ "verbose",     'v',           NULL,            0,
	  "Print more information (cumulative)", 0 },
	{ "quiet",     'q',           NULL,            0,
	  "Print less information (cumulative)", 0 },

	// { "arch", 'a', "ARCHITECTURE", 0,
	//   "Select machine revision to emulate. Revision 0: 64kW RAM "
	//   "image expected. Say -a list for a list of available machines.", 0 },

	// { "image-size", KEY_IMAGE_SIZE, "WORDS", 0,
	//   "Set the expected size of the memory image in words (default: 65536).", 0 },
	// { "image-start", KEY_IMAGE_START, "ADDRESS", 0,
	//   "Set the address in memory where the image will be loaded (default: 0).", 0 },

	// { "debug-microcode", KEY_DEBUG_MICROCODE, NULL, 0,
	//   "Print out microcode-level information (insane amounts of output).", 0 },
	// { "debug-mem", KEY_DEBUG_MEM, NULL, 0,
	//   "Print out memory reads/wrires.", 0 },
	// { "debug-io", KEY_DEBUG_IO, NULL, 0,
	//   "Print out I/O debugging information.", 0 },
	// { "debug-asm", KEY_DEBUG_ASM, NULL, 0,
	//   "Print out assembly instructions as they are executed.", 0 },
	// { "pasm", 'p', "PASM-FILE", 0,
	//   "Load a .pasm file. Where available, use its contents when --debug-asm is "
	//   "printing out assembly instructions.", 0 },
	// { "map", 'M', "MAP-FILE", 0,
	//   "Load a .map file. Where possible, use it to simplify listing of addresses.",
	//   0 },

	// { "testing",     't',           NULL,            0,
	//   "Enable test/debug device and testing output.", 0 },
	// { "no-sanity",   KEY_NO_SANITY,  NULL,            0,
	//   "Inhibit sanity checks meant to catch common bugs.", 0 },
	// { "some-sanity",   KEY_SOME_SANITY,  NULL,            0,
	//   "Only warn about failed sanity checks.", 0 },
	// { "sentinel",   KEY_SENTINEL,  NULL,            0,
	//   "Fill unpopulated memory image with a sentinel instruction (OUT R &3EF) "
	//   "that will halt the emulator if it executes an empty region of memory.", 0 },

	// // MBU

	// { "mbu",    KEY_MBU,  NULL,            0,
	//   "Enable the 21-bit memory banking unit (at &020-&02F).", 0 },
	// { "no-mbu", KEY_NO_MBU,  NULL,            0,
	//   "Disable the 21-bit memory banking unit (at &020-&02F).", 0 },
	// { "debug-mbu", KEY_DEBUG_MBU, NULL, 0,
	//   "Trace the operation of the Memory Banking Unit (MBU).", 0 },

	// // INTerrupt Controller

	// { "ird",    KEY_IRC,  NULL,            0,
	//   "Enable the 8-line interrupt controller (at &030-&03F).", 0 },
	// { "no-irc", KEY_NO_IRC,  NULL,            0,
	//   "Disable the 8-line interrupt controller (at &030-&03F).", 0 },
	// { "debug-irc", KEY_DEBUG_IRC, NULL, 0,
	//   "Trace the operation of the INTerrupt controller.", 0 },

        // // DUART

	// { "debug-duart", KEY_DEBUG_DUART, NULL, 0,
	//   "Trace the operation of the double DUART (console) board.", 0 },
	// { "stdio", KEY_DUART_STDIO, "UART-NUMBER", 0,
	//   "Connect UART-NUMBER (0-3) to the emulator's stdin and stdout. "
	//   "May be used multiple times, though this is of limited functionality.", 0 },

	// NVRAM

	// { "nvram",    KEY_NVRAM,  NULL,            0,
	//   "Enable a 2k TimeKeeper/NVRAM chip (offset at &090/&08x). "
	//   "The contents of the NVRAM are stored in file " NVRAM_FNAME, 0 },

        // IDE

	// { "hd0",    KEY_HD0,  "DISK-IMAGE",            0,
	//   "Specify an image file for the first IDE disk (channel 1, disk 1). "
	//   "If unspecified, no disk is emulated.", 0 },
	// { "hd1",    KEY_HD1,  "DISK-IMAGE",            0,
	//   "Specify an image file for the second IDE disk (channel 1, disk 2). "
	//   "If unspecified, no disk is emulated.", 0 },
	// { "hd2",    KEY_HD2,  "DISK-IMAGE",            0,
	//   "Specify an image file for the third IDE disk (channel 2, disk 1). "
	//   "If unspecified, no disk is emulated.", 0 },
	// { "hd3",    KEY_HD3,  "DISK-IMAGE",            0,
	//   "Specify an image file for the fourth IDE disk (channel 2, disk 2). "
	//   "If unspecified, no disk is emulated.", 0 },
	// { "ide-speed",    KEY_IDE_SPEED, "FACTOR",            0,
	//   "Set IDE speed factor. The default is 10, which is normal speed. 20 is double speed, etc. Values below 10 slow down access for debugging.", 0 },
	// { "debug-ide", KEY_DEBUG_IDE, NULL, 0,
	//   "Trace the operation of the IDE host adaptors.", 0 },

        // Video

	// { "video", 'V',  NULL, 0,
	//   "Enable the video card.", 0 },
	// { "fs", 'f',  NULL, 0,
	//   "Full-screen video.", 0 },
	// { "scale2", '2',  NULL, 0,
	//   "Double-sized display. Uses 1280x800 resolution.", 0 },
	// { "debug-video", KEY_DEBUG_VIDEO,  NULL, 0,
	//   "Debug VDU card.", 0 },

	// AY-3-8910 PSG

	// { "psg",    KEY_PSG,  NULL,            0,
	//   "Enable the General Instrument AY-3-8910 PSG audio chip (at &030-&03F).", 0 },
	// { "no-psg", KEY_NO_PSG,  NULL,            0,
	//   "Disable the GI AY-3-8910 emulation.", 0 },
	// { "debug-psg", KEY_DEBUG_PSG, NULL, 0,
	//   "Trace the operation of the GI AY-3-8910.", 0 },

	// Debugging Card

	// { "dfp-testmode", KEY_DFP_TESTMODE,  NULL, 0,
	//   "Used for automated testing (the simulation ends on HALT, DFP is put in "
	//   "testing mode immediately).", 0 },

	// { "dfp-pts", KEY_DFP_PTS,  NULL, 0,
	//   "Allocate a new pseudo-terminal and let the DFP listen on it.", 0 },

	// { "dfp-tty", KEY_DFP_TTY,  NULL, 0,
	//   "The DFP will open this terminal for interactive debugging.", 0 },

	// { "dfp-in", KEY_DFP_IN,  NULL, 0,
	//   "The DFP will open this file and read a debugging script from it.", 0 },

	// { "dfp-out", KEY_DFP_OUT,  "FILE", 0,
	//   "The DFP will log its output to this file.", 0 },

#if 0
	{ "microcode",     'm',           NULL,            0,
	  "Select microcode basename (cumulative)", 0 },
#endif
	// { "log",     'l',           "FILE",            0,
	//   "File to log output to (default: output)", 0 },

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
	"CFT Emulator",
	NULL, NULL, NULL
};


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
