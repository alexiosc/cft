// -*- c -*-
// 
// io.c — I/O space handling
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

#define LOG_MACROS_UNIT io_log_unit
#include "log.h"

#include "io.h"
#include "deb.h"

// #include "io.h"
// #include "mbu.h"
// #include "irc.h"
// #include "nvram.h"
// #include "duart.h"
// #include "ide.h"
// #include "dfp.h"
// //#include "panel.h"			// Obsoleted by dfp.h
// #include "video.h"
// #include "psg.h"
// //#include "debug.h"			// Obsoleted by dfp.h
// #include "util.h"
// #include "ui.h"


static log_unit_t   io_log_unit;

iodev_t iodevs[] = {
    // The MBU is installed in the CPU and permanently enabled.
    {
        .name = "Memory Banking Unit",
        .code = "MBU",
        .enabled = 1,
        .read = mbu_read,
        .write = mbu_write
    },

    {
        .name = "Basic Debugging Unit",
        .code = "DEB",
        .enabled = 0,
        .init = deb_init,
        .write = deb_write
    },
	
/*
    {
        .name = "Interrupt Controller",
        .code = "IRC",
        .flag = &have_irc,
        .init = irc_init,
        .reset = irc_reset,
        .done = irc_done,
        .read = irc_read,
        .write = irc_write,
        .tick = irc_tick
    },
	
    // PFP obsoleted in favour of DFP
    // {
    // 	.name = "Front Panel",
    // 	.code = "PFP",
    // 	.flag = &panel,
    // 	.init = panel_init,
    // 	//.reset = panel_reset,
    // 	.done = panel_done,
    // 	.tick = panel_tick,
    // 	.read = panel_read,
    // 	.write = panel_write
    // },


    {
        .name = "Debugging Front Panel",
        .code = "DFP",
        .flag = &dfp_enabled,
        .init = dfp_init,
        //.reset = dfp_reset,
        .done = dfp_done,
        // The DFP ticks independently
        //.tick = dfp_tick,
        .read = dfp_read,
        .write = dfp_write
    },
	
    {
        .name = "Dual/Quad Serial Card",
        .code = "TTY",
        .flag = &duart,
        .init = duart_init,
        //.reset = duart_reset,
        .done = duart_done,
        .tick = duart_tick,
        .read = duart_read,
        .write = duart_write
    },
	
    {
        .name = "Non-Volatile RAM",
        .code = "NVR",
        .flag = &nvram,
        .init = nvram_init,
        //.reset = nvram_reset,
        .done = nvram_done,
        .tick = nvram_tick,
        .read = nvram_read,
        .write = nvram_write
    },
	
    {
        .name = "IDE Hard Disk Interface",
        .code = "IDE",
        .flag = &ide,
        .init = ide_init,
        //.reset = ide_reset,
        .done = ide_done,
        .tick = ide_tick,
        .read = ide_read,
        .write = ide_write
    },

    {
        .name = "Video Display Unit and Keyboard",
        .code = "VDU",
        .flag = &video,
        .init = video_init,
        .reset = video_reset,
        .done = video_done,
        .tick = video_tick,
        .read = video_read,
        .write = video_write
    },
	
    {
        .name = "Audio Card",
        .code = "PSG",
        .flag = &have_psg,
        .init = psg_init,
        .reset = psg_reset,
        .done = psg_done,
        .tick = psg_tick,
        .read = psg_read,
        .write = psg_write

    },

    // The DEB board has been obsoleted by the DFP
    // {
    // 	.name = "Debug",
    // 	.code = "DEB",
    // 	.flag = &debugger,
    // 	.init = debug_init,
    // 	//.reset = debug_reset,
    // 	.done = debug_done,
    // 	.tick = debug_tick,
    // 	.read = debug_read,
    // 	.write = debug_write
    // },

    */

    {
        .name = NULL,
    }
};


///////////////////////////////////////////////////////////////////////////////
//
// IRQS
//
///////////////////////////////////////////////////////////////////////////////


inline void
irq()
{
    if (cpu.fi) {
        //info("***IRQ (masked, PC=%04x, INT RET ADDR=%04x)***\n", cpu.pc, cpu.mem[2]);
        //dump();
    } else {
        //info("***IRQ***\n");
        cpu.irq = 0;
    }
}


// Enable or device the specified device. ‘dev’ is the three-letter device
// code. The function returns 0 if the device was not found.
int
io_set_enable(char *dev, int enabled)
{
    for (iodev_t * io = iodevs; io->name != NULL; io++){
        if (!strcmp(io->code, dev)) {
            io->enabled = enabled;
            return 1;
        }
    }
    return 0;
}


// This is called to initialise the I/O subsystem.
void
io_init()
{
    io_log_unit = log_add_unit("I/O", -1, -1);
    debug("Initialising I/O space");

    int num_devs = 0;
    int num_enabled = 0;
    for (iodev_t * io = iodevs; io->name != NULL; io++){
        num_devs++;
        //printf("*** %s: init() (%p, %d)\n", io->name, io->flag, *io->flag);
        // Is the device enabled?
        if (!io->enabled) continue;
        // Is there an initialiser?
        num_enabled++;
        if (io->init != NULL) {
            (*io->init)();
        }
    }

    info("%d I/O devices, %d enabled", num_devs, num_enabled);
}


void
io_reset()
{
    iodev_t * io;
    for (io = iodevs; io->name != NULL; io++){
        // Is the device enabled?
        if (!io->enabled) continue;
        // Is there a reset handler?
        if (io->reset != NULL) {
            (*io->reset)();
        }
    }
}


void
io_done()
{
    iodev_t * io;
    debug("De-initialising I/O space");
    for (io = iodevs; io->name != NULL; io++){
        // Is the device enabled?
        if (!io->enabled) continue;
        // Is there an destructor?
        if (io->done != NULL) {
            (*io->done)();
        }
    }
}


// This is called once per clock tick to handle I/O and other background tasks.

void
io_tick()
{
    static int delay = 0;

    delay = (delay + 1) & 0x3ff; /* Check I/O every 1024 clock ticks */
    if (delay) return;

    iodev_t * io;
    for (io = iodevs; io->name != NULL; io++){
        // Is the device enabled?
        if (!io->enabled) continue;
        // Is there an tick handler?
        if (io->tick != NULL) {
            (*io->tick)(delay);
        }
    }
	
    //ui_tick();
}


int
io_read(longaddr_t addr, word * data)
{
    assert (data != NULL);
    word retval;
    for (iodev_t * io = iodevs; io->name != NULL; io++){
        // Is the device enabled?
        if (!io->enabled) continue;

        // Is there an read handler? If so, attempt to read.
        if (io->read != NULL) {
            retval = (*io->read)(addr, data);
            if (retval) {
                io->hits = 2000;
                debug("IN (%s) io[%03x] -> %04x\n", io->code, addr, *data);
                return retval;
            }
        }
    }

    // Unknown IO device.
    warning("Read from from I/O address %03x: no device", addr);
    return 0;
}


int
io_write(longaddr_t addr, word data)
{
    word retval;
    for (iodev_t * io = iodevs; io->name != NULL; io++){
        // Is the device enabled?
        if (!io->enabled) continue;

        // Is there an read handler? If so, attempt to read.
        if (io->write != NULL) {
            retval = (*io->write)(addr, data);
            if (retval) {
                io->hits = 2000;
                debug("OUT (%s) io[%03x] <- %04x\n", io->code, addr, data);
                return retval;
            }
        }
    }

    // Unknown IO device.
    warning("Write to I/O address %03x: no device", addr);
    return 0;
}


void io_list_devs()
{
    iodev_t * io;
    printf("DEV  ENABLED   NAME\n");
    printf("-------------------------------------------------------------------------------\n");
    for (io = iodevs; io->name != NULL; io++){
        printf("%3.3s  %s  %s\n",
               io->code, io->enabled ? "enabled " : "disabled", io->name);
    }
    printf("-------------------------------------------------------------------------------\n");
    exit(0);
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
