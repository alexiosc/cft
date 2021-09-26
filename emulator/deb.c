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
#include <stdarg.h>
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
#include "ringbuf.h"
#include "util.h"


// Do we want the verilog_test functionality?
#define TST


static log_unit_t   deb_log_unit;
static word         hidata;
static tty_t *      deb_tty = NULL;
static int          warned_tty = 0;

#ifdef TST
static log_unit_t   tst_log_unit;
static word         slow_port;  // In Verilog: WS emulation. Here, just a reg.
static word         iot_port_a; // For IOT testing.
static word         iot_port_b; // For IOT testing.
static word         irq_ctr;    // IRQ counter
static word         irqen;      // IRQs enabled?
static int          irq;        // Our local IRQ has been triggered.
static word         mute_czi;   // Mute Count Zero Interrupt logs
#endif // TST


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

#ifdef TST
        tst_log_unit = log_add_unit("TST", -1, -1);
        log_msg(LOG_DEBUG, tst_log_unit, "Temporary interrupt subsystem initialised.");
        iot_port_a = 0;
        iot_port_b = 0;
        irq_ctr = 0;
        irq = 0;
        irqen = 0;
#endif // TST
}


static void
deb_ttyprintf(char *fmt, ...)
{
        va_list ap;
        char * buf;

        if ((deb_tty == NULL || deb_tty->output == NULL) && warned_tty == 0) {
                warning("Characters output from DEB, but device not connected to a TTY");
                warned_tty = 1;
                return;
        }
        if (warned_tty) return;

        va_start(ap, fmt);
        int result = vasprintf(&buf, fmt, ap);
        assert (result >= 0);
        va_end(ap);

        // Dump to the ring buffer, allow overrun to happen.
        for (char *cp = buf; *cp != '\0'; cp++) {
                if (ringbuf_put(deb_tty->output, (uint32_t)(*cp & 0xff)) < 0) {
                        warning("Output buffer overrun");
                        break;
                }
        }
}


void
deb_connect_tty_t(int unit, tty_t * tty)
{
        assert (tty != NULL);
        deb_tty = tty;
}


int
deb_read(longaddr_t addr, word * data)
{
        switch (addr & 0x3ff) {

#ifdef TST
                // The following is TST functionality, included here because both DEB and
                // TST are temporary modules only used for early emulator testing

        case 0x3f0:
        case 0x3f1:
        case 0x3f2:
        case 0x3f3:
                *data = slow_port;
                return 1;
        
        case 0x3f4:
        case 0x3f5:
        case 0x3f6:
        case 0x3f7:
                *data = 0x0000;
                return 1;
        
        case 0x3f8:
                *data = 0x1234;
                return 1;
        
        case 0x3f9:
                *data = 0x5678;
                return 1;
        
        case 0x3fa:
                *data = 0x9abc;
                return 1;
        
        case 0x3fb:
                *data = 0xdef0;
                return 1;
        
        case 0x3fc:
                *data = 0x4321;
                return 1;
        
        case 0x3fd:
                *data = (iot_port_a * iot_port_b) & 0xffff;
                return 1;
        
        case 0x3fe:
                *data = (iot_port_a * iot_port_b) & 0xffff;
        
                if (*data == 0) {
                        cpu.skipext = 1;
                        log_msg(LOG_DEBUG3, tst_log_unit, "Zero product, asserting SKIPEXT.");
                }
                return 1;

        case 0x3ff:
                *data = irq_ctr;
                return 1;
        }

#endif // TST

        return 0;
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
                deb_ttyprintf("[fail]");
                fatal("DEB board SENTINEL, exiting.");
                return 1;

        case 0x110:
                deb_out("340 PRINTA: %04x", data);
                deb_ttyprintf("%04x", data);
                return 1;
            
        case 0x111:
                deb_out("340 PRINTC: %d", data & 0xff);
                deb_ttyprintf("%c", data & 0xff);
                return 1;
            
        case 0x112:
                deb_out("340 PRINTD: %d", (int16_t)data);
                deb_ttyprintf("%d", (int16_t)data);
                return 1;
            
        case 0x113:
                deb_out("340 PRINTU: %d", data);
                deb_ttyprintf("%d", data);
                return 1;
            
        case 0x114:
                deb_out("340 PRINTH: %04x", data);
                deb_ttyprintf("%04x", data);
                return 1;

        case 0x115:
                deb_out("340 PRINTB: %16.16s", format_bin(data, 16));
                deb_ttyprintf("%16.16s", format_bin(data, 16));
                return 1;

        case 0x116:
                deb_out("340 PRINTC: 32");
                deb_ttyprintf(" ");
                return 1;

        case 0x117:
                deb_out("340 PRINTC: 10");
                deb_ttyprintf("\n");
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
                deb_ttyprintf("%04x%04x", hidata, data);
                return 1;

        case 0x11d:
                deb_out("305 Halted");
                //notice("DEB board halted, ending emulation.");
                cpu.quit = 1;
                return 1;
        
        case 0x11e:
                deb_out("345 Success");
                deb_ttyprintf("[ok]");
                return 1;

        case 0x11f:
                deb_out("346 Fail");
                deb_ttyprintf("[fail]");
                return 1;

#ifdef TST
                // The following is TST functionality, included here because both DEB and
                // TST are temporary modules only used for early emulator testing

        case 0x3f0:
        case 0x3f1:
        case 0x3f2:
        case 0x3f3:
                // These should trigger wait states, but the emulator doesn't support them.

        case 0x3fd:
                iot_port_a = data;
                log_msg(LOG_NOTICE, tst_log_unit, "PROD A=%d", iot_port_a);
                return 1;
        
        case 0x3fe:
                iot_port_b = data;
                log_msg(LOG_NOTICE, tst_log_unit, "PROD B=%d", iot_port_b);
                return 1;

        case 0x3ff:
                if (irq) {
                        log_msg(LOG_DEBUG3, tst_log_unit, "Interrupt acknowledged and cleared.");
                        irq = 0; 
                }
                irqen = data == 0 ? 0 : 1;
                irq_ctr = data;
                log_msg(LOG_DEBUG3, tst_log_unit, "IRQ counter: en=%d, val=%04x", irqen, data);
                mute_czi = 0;
                return 1;
        
#endif // TST
        
        }

        return 0;
}


void deb_tick()
{
        //log_msg(LOG_DEBUG3, tst_log_unit, "tick");
        if (irqen) {
                if (irq_ctr == 0) {
                        irqen = 0;
                        irq = 1;
                        cpu.irq = 1;        // Assert level interrupt
                        if (!mute_czi) {
                                log_msg(LOG_DEBUG3, tst_log_unit, "Count reached zero.");
                                mute_czi = 1;
                        }
                } else {
                        irq_ctr--;          // Count
                }
        }

        // Trigger interrupts.
        if (irq) {
                log_msg(LOG_DEBUG3, tst_log_unit, "Interrupting.");
                cpu.irq = 1;
        }
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
