// -*- c -*-
// 
// cftemut.c — Command-line parsing
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
#include <sys/stat.h>
#include <unistd.h>
#include <assert.h>
#include <argp.h>

#include "cmdline.h"
#include "util.h"
#include "log.h"
#include "mem.h"
#include "io.h"


static error_t parse_opt (int key, char *arg, struct argp_state *state);

static void show_version (FILE *stream, struct argp_state *state);


static struct argp_option options[] =
{
    { "brief-help",        'h',     NULL,             0,
      "Show brief syntax help", 1 },
    { "verbose",     'v',           NULL,            0,
      "Print more information (cumulative)", 0 },
    { "quiet",     'q',           NULL,            0,
      "Print less information (cumulative)", 0 },

    { "list-devs", KEY_LIST_DEVS, NULL, 0,
      "List known devices and exit.", 0},

    { NULL, 0, NULL, 0, "Memory\n", 10 },
    { "ram", 'm', "SIZE", 0,
      "Set the size of RAM in KiW (1,024 16-bit Words). Between 0 and 16384 KiW "
      "can be specified for SIZE. Any ROM images loaded will overlay this RAM "
      "if their regions overlap. (default: 64)"},

    { "rom", 'r', "FILENAME[,BASE-ADDRESS[,SIZE]]", 0,
      "Load the ROM in FILENAME.bin. If available, also load FILENAME.map "
      "and FILENAME.pasm to aid in debugging. If specified, map the ROM to "
      "BASE-ADDRESS, expressed in decimal KiW (1,024 16-bit Words). If SIZE "
      "is specified, it must be a decimal number of KiW and smaller than "
      "the size of the ROM image. Only the first SIZE KiW of the ROM image "
      "will be loaded. The default BASE-ADDRESS is 8192 (bank &80). The "
      "default SIZE is all of the ROM. The loaded ROM image may overlap "
      "RAM. This option may be specified multiple times to map multiple "
      "ROM images to the CFT's address space. (default: no ROM)"},

    { NULL, 0, NULL, 0, "Input/Output\n", 20 },
    { "enable", 'e', "DEV", 0,
      "Enable the specified device given its three-letter code. For a list "
      "of devices, run with --list-devs. You can specify this option "
      "multiple times to enable as many devices as needed.", 0 },

    { "disable", 'd', "DEV", 0,
      "Disable the specified device given its three-letter code. For a list "
      "of devices, run with --list-devs. You can specify this option "
      "multiple times to enable as many devices as needed.", 0 },

    { NULL, 0, NULL, 0, "Testing", -3 },

    { "fill-ram", KEY_FILL_RAM, "WORD", 0,
      "Fill RAM with this 16-bit value. This is used for some tests. (default: 0)" },
    
    { "strict-sanity", KEY_STRICT_SANITY, NULL, 0,
      "Runtie sanity check failures are fatal. (default: non-fatal)" },
    
    { "writeable-rom", KEY_WRITEABLE_ROM, NULL, 0,
      "Make ROMs defined up to this point in the command line writeable. "
      "This is used for some tests." },
    

    { NULL, 0, NULL, 0, "Miscellaneous", -2 },

    { "color", KEY_COLOR, "1 | 0", 0,
      "Control the use of terminal directives in log output. (default: on if stdout is a TTY)" },

    { "colour", KEY_COLOUR, "1 | 0", 0,
      "Same as --colour." },

    { NULL, 0, NULL, 0, "Help", -1 },

    // { "map", 'M', "MAP-FILE", 0,
    //   "Load a .map file. Where possible, use it to simplify listing of addresses.",
      // 0 },

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

    // { "testing",     't',           NULL,            0,
    //   "Enable test/debug device and testing output.", 0 },
    // { "no-sanity",   KEY_NO_SANITY,  NULL,            0,
    //   "Inhibit sanity checks meant to catch common bugs.", 0 },
    // { "some-sanity",   KEY_SOME_SANITY,  NULL,            0,
    //   "Only warn about failed sanity checks.", 0 },
    // { "sentinel",   KEY_SENTINEL,  NULL,            0,
    //   "Fill unpopulated memory image with a sentinel instruction (OUT R &3EF) "
    //   "that will halt the emulator if it executes an empty region of memory.", 0 },

    // MBU

    // { "mbu",    KEY_MBU,  NULL,            0,
    //   "Enable the 21-bit memory banking unit (at &020-&02F).", 0 },
    // { "no-mbu", KEY_NO_MBU,  NULL,            0,
    //   "Disable the 21-bit memory banking unit (at &020-&02F).", 0 },
    // { "debug-mbu", KEY_DEBUG_MBU, NULL, 0,
    //   "Trace the operation of the Memory Banking Unit (MBU).", 0 },

    // INTerrupt Controller

    // { "irc",    KEY_IRC,  NULL,            0,
    //   "Enable the 8-line interrupt controller (at &030-&03F).", 0 },
    // { "no-irc", KEY_NO_IRC,  NULL,            0,
    //   "Disable the 8-line interrupt controller (at &030-&03F).", 0 },
    // { "debug-irc", KEY_DEBUG_IRC, NULL, 0,
    //   "Trace the operation of the INTerrupt controller.", 0 },

    // DUART

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


static void
parse_romspec(struct argp_state *state, char *spec)
{
    romspec_t * rs = (romspec_t *)malloc(sizeof(romspec_t));
    assert (rs != NULL);

    char *arg = NULL, *ctx = NULL;
    arg = strtok_r(spec, ",", &ctx);
    assert (arg != NULL);

    struct stat st;
    if (stat(arg, &st)) {
        free(rs);
        argp_failure (state, EXIT_FAILURE, errno, "Can't stat ROM file %s", arg);
    }

    if (st.st_size % 2048) {
        free(rs);
        argp_error (state, "ROM image %s is not a multiple of 1024 KiW. "
                    "It's probably not a CFT ROM image.", arg);
    }

    rs->fname = strdup(arg);
    rs->addr = 8192;
    rs->size = st.st_size / 2048;

    // Parse the optional BASE-ADDRESS
    arg = strtok_r(NULL, ",", &ctx);
    if (arg != NULL) {
        if (!sscanf(arg, "%d", &rs->addr)) {
            argp_error (state, "Invalid BASE-ADDRESS. Expecting 0 to 16384, got '%s'.", arg);
        }
        if (rs->addr < 0 || rs->addr > 16384) {
            argp_error (state, "BASE-ADDRESS out of range. Expecting 0 to 16384, got '%s'.", arg);
        }

        // Parse the optional SIZE
        int tmp;
        int maxsize = min(16384 - rs->size, rs->size);
        arg = strtok_r(NULL, ",", &ctx);
        if (arg != NULL) {
            if (!sscanf(arg, "%d", &tmp)) {
                argp_error (state, "Invalid SIZE. Expecting 0 to 16384, got '%s'.", arg);
            }
            if (tmp < 0 || tmp > maxsize) {
                argp_error (state, "SIZE out of range. Expecting 0 to %d, got '%d'.",
                            maxsize, tmp);
            }
            rs->size = tmp;
        }
    }

    // Add this to the list of ROMs.
    emu.num_roms++;
    emu.roms = reallocarray(emu.roms, emu.num_roms, sizeof(romspec_t));
    memcpy(&emu.roms[emu.num_roms - 1], rs, sizeof(romspec_t));

    free(rs);
}


// static void
// list_archs()
// {
// 	fprintf(stderr, "Available architectures:\n\n");
// 	fprintf(stderr, "Name     Description                               RAM  ROM  Hardware\n");
// 	fprintf(stderr, "------------------------------------------------------------------------------\n");
// 	mach_t * m = &mach_revisions[0];
// 	while (m->code != NULL) {
// 		fprintf(stderr, "%-8.8s %-40.40s %4d %4d  %c%c%c%c%c%c\n",
// 			m->code, m->name, m->ramsize >> 10, m->romsize >> 10,
// 			m->have_mbu? 'b' : '-',
// 			m->have_irc? 'i' : '-',
// 			m->have_ide? 'h' : '-',
// 			m->have_nvram? 'n' : '-',
// 			m->have_video? 'v' : '-',
// 			m->have_ether? 'e' : '-'
// 			);
// 		m++;
// 	}
// 	fprintf(stderr, "------------------------------------------------------------------------------\n");
// 	fprintf(stderr, "Sizes in kWords. b = Memory Banking, i = Interrupt Controller, h = IDE disks,\n");
// 	fprintf(stderr, "n = NVRAM/RTC, v = VDU, e = Ethernet.\n");
// 	fprintf(stderr, "\n");
// }


// Parse a single option.
static error_t
parse_opt (int key, char *arg, struct argp_state *state)
{
    //int tmp;

    switch (key) {
    case ARGP_KEY_INIT:
        /* Set up default values.  */
        emu.loglevel = LOG_NOTICE;
        emu.sanity = 2;
        emu.sentinel = 0;
        emu.ram_size = 64;      // Default RAM size
        break;
		
    case 'h':
        argp_help (&argp, stderr,
                   ARGP_HELP_USAGE|ARGP_HELP_EXIT_OK, PACKAGE);
        exit (0);
		
    case 'v':
        emu.loglevel++;
        break;

    case 'q':
        emu.loglevel--;
        break;

    case 'm':                   // RAM size in SIZE,BASE-ADDR format.
        if (!sscanf(arg, "%d", &emu.ram_size)) {
            argp_error (state, "Invalid SIZE. Expecting 0 to 16384, got '%s'.", arg);
        } else if (emu.ram_size < 0 || emu.ram_size > 16384) {
            argp_error (state, "Invalid SIZE. Expecting 0 to 16384, got '%d'.", emu.ram_size);
        }
        break;

    case 'r':
        // Parse a ROM spec.
        parse_romspec(state, arg);
        break;

    case KEY_FILL_RAM:
    {
        int val;
        if (!sscanf(arg, "%d", &val)) {
            argp_error (state, "Invalid WORD. Expecting 0 to 65535, got '%s'.", arg);
        } else if (val < 0 || val > 65535) {
            argp_error (state, "Invalid WORD. Expecting 0 to 65535, got '%d'.", emu.ram_size);
        } else {
            emu.ram_sentinel = val;
        }
        break;
    }
    
    case KEY_WRITEABLE_ROM:
        mem_writeable_rom();
        emu.writeable_rom = 1;
        break;

    case KEY_LIST_DEVS:
        io_list_devs();
        exit(0);
        break;

    case 'e':
        if (!io_enable(arg)) {
            argp_error (state, "Unknown device '%s'. Run with --list-devs for a list of devices.", arg);
        }
        break;
        
    case 'd':
        if (!io_disable(arg)) {
            argp_error (state, "Unknown device '%s'. Run with --list-devs for a list of devices.", arg);
        }
        break;

    case KEY_COLOUR:
    case KEY_COLOR:
    {
        int val;
        if (!sscanf(arg, "%d", &val)) {
            argp_error (state, "Expecting 0 or 1, got '%s'.", arg);
        } else if (val != 0 && val != 1) {
            argp_error (state, "Expecting 0 or 1, got '%s'.", arg);
        } else {
            emu.force_colour = val == 0 ? -1 : 1;
        }
        break;
    }

    case KEY_STRICT_SANITY:
        emu.strict_sanity = 1;
        break;

    // case 'p':
    //     emu.pasm_name = strdup (arg);
    //     emu.pasm_file = fopen (emu.pasm_name, "r");
    //     if (!emu.pasm_file) {
    //         argp_failure (state, EXIT_FAILURE, errno,
    //                       "Cannot open .pasm file %s for reading",
    //                       emu.pasm_name);
    //     }
    //     break;

    // case KEY_DEBUG_MICROCODE:
    //     emu.debug_microcode = 1;
    //     break;
		
    // case KEY_DEBUG_MEM:
    //     emu.debug_mem = 1;
    //     break;
		
    // case KEY_DEBUG_IO:
    //     emu.debug_io = 1;
    //     break;
		
    // case KEY_DEBUG_ASM:
    //     emu.debug_asm = 1;
    //     break;

    // case KEY_DEBUG_DUART:
    //     emu.debug_duart = 1;
    //     break;
		
    // case KEY_DUART_STDIO:
    //     if (!sscanf(arg, "%d", &tmp)) {
    //         argp_error (state, "Invalid UART number. Expecting 0 to %d, got '%s'.",
    //                     NUM_UARTS - 1, arg);
    //     } else if (tmp < 0 || tmp >= NUM_UARTS) {
    //         argp_error (state, "Invalid UART number. Expecting 0 to %d, got %d.",
    //                     NUM_UARTS - 1, tmp);
    //     }
    //     uart_source[tmp] = UART_SOURCE_STDIO;
    //     break;
		
    // case 't':
    //     testing++;
    //     break;
		
    // case 'l':
    //     log_name = strdup (arg);
    //     break;

    // case 'a':
    //     if (!strcmp(arg, "list")) {
    //         list_archs();
    //         exit(0);
    //     } else {
    //         mach_t * m = &mach_revisions[0];
    //         while (m->code != NULL) {
    //             if (!strcmp(m->code, arg)) {
    //                 mach_set(m);
    //                 break;
    //             }
    //             m++;
				
    //         }
    //     }
    //     break;
		
    // case KEY_IMAGE_START:
    //     if (!sscanf(arg, "%d", &emu.image_start)) {
    //         argp_error (state, "Unable to parse memory image start '%s'", arg);
    //     } else if (emu.image_start < 0 || emu.image_start > emu.romsize) {
    //         argp_error (state, "Memory image start '%ld' is out of bounds (0-%d)", emu.image_start, emu.romsize);
    //     }
    //     break;

    // case KEY_IMAGE_SIZE:
    //     if (!sscanf(arg, "%d", &emu.image_size)) {
    //         argp_error (state, "Unable to parse memory image size '%s'", arg);
    //     } else if (emu.image_size < 0 || emu.image_start > 65535) {
    //         argp_error (state, "Memory image size '%ld' is out of bounds (0-65535)", emu.image_size);
    //     }
    //     break;

    // case KEY_NO_SANITY:
    //     emu.sanity = 0;
    //     break;

    // case KEY_SOME_SANITY:
    //     emu.sanity = 1;
    //     break;

    // case KEY_SENTINEL:
    //     emu.sentinel = 1;
    //     break;

    // case KEY_MBU:
    //     mbu = 1;
    //     break;

    // case KEY_NO_MBU:
    //     mbu = 0;
    //     break;

    // case KEY_DEBUG_MBU:
    //     debug_mbu++;
    //     break;
		
    // case KEY_IRC:
    //     have_irc = 1;
    //     break;

    // case KEY_NO_IRC:
    //     have_irc = 0;
    //     break;

    // case KEY_DEBUG_IRC:
    //     debug_irc++;
    //     break;

    // case KEY_PSG:
    //     have_psg = 1;
    //     break;

    // case KEY_NO_PSG:
    //     have_psg = 0;
    //     break;

    // case KEY_DEBUG_PSG:
    //     debug_psg++;
    //     break;

    // case KEY_NVRAM:
    //     nvram = 1;
    //     break;

    // case KEY_HD0:
    // case KEY_HD1:
    // case KEY_HD2:
    // case KEY_HD3:
    //     idehd_set(key - KEY_HD0, arg);
    //     break;

    // case KEY_IDE_SPEED:
    //     if (!sscanf(arg, "%d", &ide_speed)) {
    //         argp_error (state, "IDE speed should an integer >= 1.");
    //     }
    //     if (ide_speed < 1) {
    //         argp_error (state, "IDE speed should an integer >= 1.");
    //     }
    //     break;

    // case KEY_DEBUG_IDE:
    //     debug_ide++;
    //     break;
		
    // case 'V':
    //     video = 1;
    //     break;

    // case 'f':
    //     video_fs = 1;
    //     break;

    // case '2':
    //     video_2x = 1;
    //     break;
		
    // case KEY_DEBUG_VIDEO:
    //     debug_video = 1;
    //     break;

    // case KEY_DFP_PTS:
    //     dfp_pts = 1;
    //     break;

    // case KEY_DFP_TTY:
    //     fail("Not implemented.\n");
    //     break;

    // case KEY_DFP_IN:
    //     fail("Not implemented.\n");
    //     break;

    // case KEY_DFP_OUT:
    //     dfp_out_name = strdup (arg);
    //     dfp_out_fp = fopen (dfp_out_name, "w");
    //     if (!dfp_out_fp) {
    //         argp_failure (state, EXIT_FAILURE, errno,
    //                       "Cannot open DFP output file %s for writing",
    //                       dfp_out_name);
    //     }
    //     break;

    // case KEY_DFP_TESTMODE:
    //     dfp_testmode = 1;
    //     break;

    // case ARGP_KEY_ARG:	// MEMORY-IMAGE (only one allowed)
    //     if (emu.memimg_name == NULL) {
    //         emu.memimg_name = strdup (arg);
    //         emu.memimg_file = fopen (emu.memimg_name, "r");
    //         if (!emu.memimg_file)
    //             argp_failure (state, EXIT_FAILURE, errno,
    //                           "Cannot open %s for reading",
    //                           emu.memimg_name);
    //     } else {
    //         argp_usage (state);
    //     }
		
    //     break;
		
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
	
    if (emu.num_roms == 0) {
        fprintf (stderr,
                 PACKAGE ": please use --rom to specify at least one ROM image.\n");
        argp_help (&argp, stderr, ARGP_HELP_USAGE, PACKAGE);
        exit (1);
    }
}

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
