// -*- c -*-
// 
// deb.c — Basic debugging board
// 
// Copyright © 2012–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <assert.h>
#include <termios.h>
#include <errno.h>
#include <time.h>
#include <sys/types.h>
#include <sys/time.h>

#include "cftemu.h"
#include "cft.h"

#define LOG_MACROS_UNIT deb_log_unit
#include "log.h"

#include "deb.h"
#include "util.h"


static log_unit_t   deb_log_unit;
static word         hidata;


#define deb_out notice


void deb_init()
{
    deb_log_unit = log_add_unit("DEB", -1, -1);
    debug("Initialised basic DEB board");
    deb_out("345 OK -- debugging subsystem available and ready");
    if (emu.writeable_rom) {
        // This is not available on real hardware.
        deb_out("345 ROM is writeable");
    }
}


int
deb_write(longaddr_t addr, word data)
{
    switch (addr & 0x3ff) {
    case 0x100:
        deb_out("321 Output Register: %04x", data);
        return 1;

    case 0x101:
    case 0x102:
    case 0x103:
    case 0x104:
    case 0x105:
    case 0x106:
    case 0x107:
    case 0x108:
    case 0x109:
    case 0x10a:
    case 0x10b:
    case 0x10c:
    case 0x10d:
    case 0x10e:
        deb_out("509 Not implemented");
        return 1;

    case 0x10f:
        deb_out("341 SENTINEL");
        fatal("DEB board SENTINEL, exiting.");
        return 1;

    case 0x110:
        deb_out("340 PRINTA: %04x", data);
        return 1;
            
    case 0x111:
        deb_out("340 PRINTC: %d", data & 0xff);
        return 1;
            
    case 0x112:
        if (data & 0x8000) {
            data = -((data & 0x7fff) + 1);
        }
        deb_out("340 PRINTD: %d", data);
        return 1;
            
    case 0x113:
        deb_out("340 PRINTU: %d", data);
        return 1;
            
    case 0x114:
        deb_out("340 PRINTH: %04x", data);
        return 1;

    case 0x115:
        deb_out("340 PRINTB: %16.16s", format_bin(data, 16));
        return 1;

    case 0x116:
        deb_out("340 PRINTC: 32");
        return 1;

    case 0x117:
        deb_out("340 PRINTC: 10");
        return 1;

    case 0x118:
    case 0x119:
    case 0x11a:
        deb_out("509 Not implemented");
        return 1;

    case 0x11b:
        hidata = data;
        return 1;

    case 0x11c:
        hidata = data;
        deb_out("340 PRINTL: %04x%04x", hidata, data);
        return 1;

    case 0x11d:
        deb_out("305 Halted");
        //notice("DEB board halted, ending emulation.");
        cpu.quit = 1;
        return 1;
        
    case 0x11e:
        deb_out("345 Success");
        return 1;

    case 0x11f:
        deb_out("346 Fail");
        return 1;
    }

    return 0;
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
