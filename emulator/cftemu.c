// -*- c -*-
// 
// cftemu.c — CFT emulation main program
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

#include "cft.h"
#include "log.h"
#include "util.h"
#include "cmdline.h"

///////////////////////////////////////////////////////////////////////////////
//
// BOILERPLATE
//
///////////////////////////////////////////////////////////////////////////////

#ifndef PACKAGE
#define PACKAGE "cftemu"
#endif

#ifndef VERSION
#define VERSION "0.9"
#endif

#ifndef AUTHOR
#define AUTHOR "Alexios Chouchoulas"
#endif

///////////////////////////////////////////////////////////////////////////////
//
// PARSE COMMAND LINE
//
///////////////////////////////////////////////////////////////////////////////

// static void
// list_archs()
// {
//     fprintf(stderr, "Available architectures:\n\n");
//     fprintf(stderr, "Name     Description                               RAM  ROM  Hardware\n");
//     fprintf(stderr, "------------------------------------------------------------------------------\n");
//     mach_t * m = &mach_revisions[0];
//     while (m->code != NULL) {
//         fprintf(stderr, "%-8.8s %-40.40s %4d %4d  %c%c%c%c%c%c\n",
//                 m->code, m->name, m->ramsize >> 10, m->romsize >> 10,
//                 m->have_mbu? 'b' : '-',
//                 m->have_irc? 'i' : '-',
//                 m->have_ide? 'h' : '-',
//                 m->have_nvram? 'n' : '-',
//                 m->have_video? 'v' : '-',
//                 m->have_ether? 'e' : '-'
//             );
//         m++;
//     }
//     fprintf(stderr, "------------------------------------------------------------------------------\n");
//     fprintf(stderr, "Sizes in kWords. b = Memory Banking, i = Interrupt Controller, h = IDE disks,\n");
//     fprintf(stderr, "n = NVRAM/RTC, v = VDU, e = Ethernet.\n");
//     fprintf(stderr, "\n");
// }

// Parse a single option.
static error_t
parse_opt (int key, char *arg, struct argp_state *state)
{
    //int tmp;

    switch (key) {
    case ARGP_KEY_INIT:
        // Set up default values.
        //verbose = 1;
        //sanity = 2;
        //sentinel = 0;
        // memimg_name = NULL;
        // memimg_file = NULL;
        break;
		
    case 'h':
        argp_help (&argp, stderr,
                   ARGP_HELP_USAGE|ARGP_HELP_EXIT_OK, PACKAGE);
        exit (0);
		
    // case 'v':
    //     verbose++;
    //     break;

    // case 'q':
    //     verbose--;
    //     break;

    // case KEY_DEBUG_MICROCODE:
    //     debug_microcode++;
    //     break;
		
    // case KEY_DEBUG_MEM:
    //     debug_mem++;
    //     break;
		
    // case KEY_DEBUG_IO:
    //     debug_io++;
    //     break;
		
    // case KEY_DEBUG_ASM:
    //     debug_asm++;
    //     break;

    // case KEY_DEBUG_DUART:
    //     debug_duart++;
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

    // case 'p':
    //     pasm_name = strdup (arg);
    //     pasm_file = fopen (pasm_name, "r");
    //     if (!pasm_file) {
    //         argp_failure (state, EXIT_FAILURE, errno,
    //                       "Cannot open .pasm file %s for reading",
    //                       pasm_name);
    //     }
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
    //     if (!sscanf(arg, "%d", &mach.image_start)) {
    //         argp_error (state, "Unable to parse memory image start '%s'", arg);
    //     } else if (mach.image_start < 0 || mach.image_start > mach.romsize) {
    //         argp_error (state, "Memory image start '%ld' is out of bounds (0-%d)", mach.image_start, mach.romsize);
    //     }
    //     break;

    // case KEY_IMAGE_SIZE:
    //     if (!sscanf(arg, "%d", &mach.image_size)) {
    //         argp_error (state, "Unable to parse memory image size '%s'", arg);
    //     } else if (mach.image_size < 0 || mach.image_start > 65535) {
    //         argp_error (state, "Memory image size '%ld' is out of bounds (0-65535)", mach.image_size);
    //     }
    //     break;

    // case KEY_NO_SANITY:
    //     sanity = 0;
    //     break;

    // case KEY_SOME_SANITY:
    //     sanity = 1;
    //     break;

    // case KEY_SENTINEL:
    //     sentinel = 1;
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
		
    // case 'M':
    //     map_name = strdup (arg);
    //     map_file = fopen (map_name, "r");
    //     if (!map_file) {
    //         argp_failure (state, EXIT_FAILURE, errno,
    //                       "Cannot open .map file %s for reading",
    //                       map_name);
    //     }
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

    case ARGP_KEY_ARG:	// MEMORY-IMAGE (only one allowed)
        // if (memimg_name == NULL) {
        //     memimg_name = strdup (arg);
        //     memimg_file = fopen (memimg_name, "r");
        //     if (!memimg_file)
        //         argp_failure (state, EXIT_FAILURE, errno,
        //                       "Cannot open %s for reading",
        //                       memimg_name);
        // } else {
        //     argp_usage (state);
        // }
		
        break;
		
    default:
        return ARGP_ERR_UNKNOWN;
    }
	
    return 0;
}

// Show the version number and copyright information.
static void
show_version (FILE *stream, struct argp_state *state)
{
    (void) state;
    fputs(PACKAGE" "VERSION"\n", stream);
    fprintf(stream, "Written by %s.\n\n", AUTHOR);
    fprintf(stream, "Copyright (C) %s %s\n",
            "2011-2020", "Alexios Chouchoulas");
    fputs("This program is free software; you may redistribute it "
          "under the terms of\n\the GNU General Public License.  "
          "This program has absolutely no warranty.\n",
          stream);
}

void
cmdline_parse(int argc, char **argv)
{
    argp_parse (&argp, argc, argv, 0, NULL, NULL);
	
    // if (memimg_name == NULL) {
    //     fprintf (stderr,
    //              PACKAGE ": please specify a memory image to load.\n");
    //     argp_help (&argp, stderr, ARGP_HELP_USAGE, PACKAGE);
    //     exit (1);
    // }
	
}


///////////////////////////////////////////////////////////////////////////////
//
// MAIN FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////

void
init()
{
    log_init();
    
    // // Initialise the user interface.
    // sdl_init();
        
    // // Read the source code, if available 
    // pasm_load();

    // // Read the map file, if available 
    // map_load();

    // // Open the log file 
    // if ((log_file = fopen(log_name, "w")) == NULL) {
    //     perror("Opening log file");
    //     exit(1);
    // }
    // setbuf(log_file, NULL);
        
    // // Initialise the menuing system 
    // ui_init();

    // Initialise I/O 
    io_init();
        
    cpu_init();
    cpu.memr = memory_read;
    cpu.memw = memory_write;
    cpu.ior = io_read;
    cpu.iow = io_write;
    cpu.iotick = io_tick;
}


void
run()
{
    // Initialise memory (RAM and ROM). Done after I/O init so we have a
    // functioning MBU.
    memory_init();

    // And run the emulation.
    cpu_run();
}


void
done()
{
    cpu_done();
    // memory_done();
    // io_done();
    // sdl_done();
}


void
reset()
{
    printf("Resetting...\n");
    //io_reset();
    cpu_start();
    cpu_reset();
}


int
main (int argc, char **argv)
{
    init();
    cmdline_parse(argc, argv);
    run();
    done();
    return 0;
}

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
