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

#include "cftemu.h"


// static error_t parse_opt (int key, char *arg, struct argp_state *state);

// static void show_version (FILE *stream, struct argp_state *state);

void cmdline_parse(int argc, char **argv);


/* argp option keys */
enum {
        DUMMY_KEY=129
        ,KEY_LIST_DEVS
        ,KEY_LIST_TTYS
        
        ,KEY_FILL_RAM
        ,KEY_WRITEABLE_ROM
        ,KEY_STRICT_SANITY
        
        ,KEY_COLOR
        ,KEY_COLOUR
        
        // These may not be used anymore.
        
        // ,KEY_DEBUG_MICROCODE
        // ,KEY_DEBUG_MEM
        // ,KEY_DEBUG_IO
        // ,KEY_DEBUG_ASM
        // ,KEY_IMAGE_START
        // ,KEY_IMAGE_SIZE
        // ,KEY_NO_SANITY
        // ,KEY_SOME_SANITY
        // ,KEY_SENTINEL

        // ,KEY_MBU
        // ,KEY_NO_MBU
        // ,KEY_DEBUG_MBU

        // ,KEY_IRC
        // ,KEY_NO_IRC
        // ,KEY_DEBUG_IRC

        // ,KEY_NVRAM

        // ,KEY_DEBUG_DUART
        // ,KEY_DUART_STDIO

#ifdef HAVE_IDE
        ,KEY_HD0
        ,KEY_HD1
        ,KEY_HD2
        ,KEY_HD3
        ,KEY_IDE_SPEED
        // ,KEY_DEBUG_IDE
#endif // HAVE_IDE
      
        // ,KEY_FS

        // // ,KEY_DEB_PTS
        // // ,KEY_DEB_TTY
        // // ,KEY_DEB_IN
        // // ,KEY_DEB_OUT
        // ,KEY_DFP_PTS
        // ,KEY_DFP_TTY
        // ,KEY_DFP_IN
        // ,KEY_DFP_OUT
        // ,KEY_DFP_TESTMODE

        // ,KEY_PSG
        // ,KEY_NO_PSG
        // ,KEY_DEBUG_PSG

        // ,KEY_DEBUG_VIDEO
};


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
