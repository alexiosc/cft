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
#include <assert.h>

#include "cft.h"
#include "log.h"
#include "util.h"
#include "cmdline.h"
#include "cftemu.h"
#include "mem.h"
#include "io.h"


// Our global state
cftemu_t emu;


///////////////////////////////////////////////////////////////////////////////
//
// MAIN FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////

// Note: command-line arguments have already been parsed here and the emu
// struct has already been updated with options.

void
init()
{
        log_init(NULL);
        log_set_level(emu.loglevel);
        if (emu.force_colour == -1) {
                log_set_colour(0);
        } else if (emu.force_colour == 1) {
                log_set_colour(1);
        }
        log_set_strict_sanity(emu.strict_sanity);

        io_init();

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
        //io_init();
        
        cpu_init();
        assert (cpu.memr != NULL);
        cpu.memr = mem_read;
        cpu.memw = mem_write;
        cpu.ior = io_read;
        cpu.iow = io_write;
        cpu.iotick = io_tick;
}


void
run()
{
        // Initialise memory (RAM and ROM). Done after I/O init so we have a
        // functioning MBU.
        mem_init();

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
        memset(&emu, 0, sizeof(emu));
        cmdline_parse(argc, argv);  // This also sets defaults in emu

        init();
        run();
        done();
        return 0;
}

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
