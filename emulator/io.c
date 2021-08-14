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
#include "irc.h"
#include "deb.h"
#include "dfp.h"
#include "tty.h"
#include "tmr.h"
#include "rtc.h"

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
                // The MBU is now accessible directly by the control unit. It's
                // no longer an I/O mapped device.
                // .read = mbu_read,
                // .write = mbu_write,
        },

        // The IRC is part of the CPU and permanently enabled.
        {
                .name = "Interrupt Controller",
                .code = "IRC",
                .enabled = 1,
                .reset = irc_reset,
                .read = irc_read,
                .write = irc_write,
                .tick = irc_tick,
        },

#ifdef HAVE_DEB        
        {
                .name = "Basic Debugging Unit (includes verilog TST board)",
                .code = "DEB",
                .enabled = 0,
                .init = deb_init,
                .read = deb_read,
                .write = deb_write,
                .tick = deb_tick
        },
#endif // HAVE_DEB

#ifdef HAVE_DFP
        {
                .name = "Debugging Front Panel 2",
                .code = "DFP",
                .enabled = 0,
                .init = dfp_init,
                .read = dfp_read,
                .write = dfp_write,
                .tick = dfp_tick,
                .done = dfp_done,

                .nttys = 1,
                .ttys = {
                        {
                                .magic = MAGIC_TTY_T,
                                .name = "DFP debugging/diagnostics user interface",
                                .dev = "dfp2"
                        },
                }
        },
#endif // HAVE_DFP

#ifdef HAVE_TMR
        // The dual Timer board
        {
                .name = "Dual Programmable Timer Board",
                .code = "TMR",
                .enabled = 1,
                .reset = tmr_reset,
                .read = tmr_read,
                .write = tmr_write,
                .tick = tmr_tick,
        },
#endif // HAVE_TMR

#ifdef HAVE_RTC
        // The Real-Time Clock board
        {
                .name = "Real-Time Clock Board",
                .code = "RTC",
                .enabled = 1,
                .read = rtc_read,
                .write = rtc_write
        },
#endif // HAVE_RTC

#ifdef HAVE_TTY
        {
                .name = "Quad Serial Board",
                .code = "TTY",
                .enabled = 0,
                .init = tty_init,
                .read = tty_read,
                .write = tty_write,
                .tick = tty_tick,
                .done = tty_done,
                
                .nttys = 4,
                .ttys = {
                        {
                                .magic = MAGIC_TTY_T,
                                .name = "Quad Serial, DUART 1, Port 1",
                                .dev = "tty0",
                        },
                        {
                                .magic = MAGIC_TTY_T,
                                .name = "Quad Serial, DUART 1, Port 2",
                                .dev = "tty1",
                        },
                        {
                                .magic = MAGIC_TTY_T,
                                .name = "Quad Serial, DUART 2, Port 1",
                                .dev = "tty3",
                        },
                        {
                                .magic = MAGIC_TTY_T,
                                .name = "Quad Serial, DUART 2, Port 2",
                                .dev = "tty4",
                        }
                }
        },
#endif // HAVE_DEFP
	
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
                //info("***IRQ (masked, PC=%04x, INT RET ADDR=%04x)***", cpu.pc, cpu.mem[2]);
                //dump();
        } else {
                //info("***IRQ***");
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
                io->magic = MAGIC_DEV_T;

                // Initialise ttys.
                for (int i = 0; i < io->nttys; i++) {
                        io_tty_init(&io->ttys[i]);
                }

                //printf("*** %s: init() (%p, %d)", io->name, io->flag, *io->flag);
                // Is the device enabled?
                if (!io->enabled) continue;
                // Is there an initialiser?
                num_enabled++;
                if (io->init != NULL) {
                        (*io->init)(io);
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
                                debug("IN (%s) io[%03x] -> %04x", io->code, addr, *data);
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
                                debug("OUT (%s) io[%03x] ← %04x", io->code, addr, data);
                                return retval;
                        }
                }
        }

        // Unknown IO device.
        warning("Write to I/O address %03x: no device", addr);
        return 0;
}


void
io_list_devs()
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


void
io_list_ttys()
{
        iodev_t * io;
        printf("DEV  TTY   ENABLED   NAME\n");
        printf("-------------------------------------------------------------------------------\n");
        for (io = iodevs; io->name != NULL; io++){
                for (int i = 0; i < io->nttys; i++) {
                        tty_t * tty = &io->ttys[i];

                        printf("%3.3s  %4.4s  %s  %s\n",
                               io->code, tty->dev, io->enabled ? "enabled " : "disabled", tty->name);
                }
        }
        printf("-------------------------------------------------------------------------------\n");
        exit(0);
}


tty_t *
io_find_tty(char *code)
{
        iodev_t * io;
        for (io = iodevs; io->name != NULL; io++){
                for (int i = 0; i < io->nttys; i++) {
                        if (!strcmp(code, io->ttys[i].dev)) {
                                return &io->ttys[i];
                        }
                }
        }
        return NULL;
}


void
io_tty_init(tty_t *tty)
{
        tty->magic = MAGIC_TTY_T;

        // Unless assigned to somethng, mute this TTY.
        if (tty->mode == TTM_UNASSIGNED) {
                tty->mode = TTM_NONE;
        }

        // Only create ring buffers if we'll be using them.
        if (tty->mode != TTM_NONE) {
                int bufbits = tty->bufbits ? tty->bufbits : DEFAULT_BUFBITS;
                debug("bufbits=%d", bufbits);
                tty->input = ringbuf_init(bufbits);
                tty->output = ringbuf_init(bufbits);
        }

        // File output?
        if (tty->mode == TTM_FILE) {
                assert(tty->fname != NULL);
                if (tty->fp != NULL) {
                        fatal("Device %s has already been assigned to a file.");
                }
                if ((tty->fp = fopen(tty->fname, "a")) == NULL) {
                        fatal("Failed to open %s for appending: %s", tty->fname, strerror(errno));
                }
                info("Output from device '%s' appended to file '%s'", tty->dev, tty->fname);
        }

        // Nothing to do for file descriptor I/O.
}


void
io_tty_set_term(tty_t *tty)
{
        assert(tty != NULL);
        assert(tty->magic == MAGIC_TTY_T);
        tty->mode = TTM_FD;
        tty->in_fd = 0;
        tty->out_fd = 1;
}
      

void
io_tty_set_fname(tty_t *tty, char *fname)
{
        assert(tty != NULL);
        assert(tty->magic == MAGIC_TTY_T);
        tty->mode = TTM_FILE;
        tty->fname = strdup(fname);
}
      

void
io_tty_write(tty_t *tty, char *data)
{
        assert(tty != NULL);
        assert(tty->magic == MAGIC_TTY_T);

        if (tty->fp != NULL) {
                fwrite(data, strlen(data), 1, tty->fp);
        }
}
      

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
