/* 

emulator.c - Main emulator code

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
#include <stdint.h>
#include <unistd.h>
#include <assert.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>
#include <time.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/time.h>

#include "cftemu.h"

// The front panel device
#define IO_PANEL_SWITCHES  0x0000
#define IO_PANEL_LIGHTS    0x0001
#define IO_HW_TYPE         0x0002
#define IO_CLOCK_HALT      0x0007


static struct termios _input_termios;

static void
input_reset_terminal_mode()
{
    tcsetattr(0, TCSANOW, &_input_termios);
}

static uint16_t _hword = 0xbeef;

static void
input_init()
{
    struct termios new_termios;

    /* take two copies - one for now, one for later */
    tcgetattr(0, &_input_termios);
    memcpy(&new_termios, &_input_termios, sizeof(new_termios));

    /* register cleanup handler, and set the new terminal mode */
    atexit(input_reset_terminal_mode);
    cfmakeraw(&new_termios);
    new_termios.c_oflag |= OPOST;
    new_termios.c_iflag |= ISIG;
    tcsetattr(0, TCSANOW, &new_termios);
}

static int
input_kbhit()
{
    struct timeval tv = { 0L, 0L };
    fd_set fds;
    int maxfd;
    FD_ZERO(&fds);
    FD_SET(0, &fds);
    return select(1, &fds, NULL, NULL, &tv);
}

static int
input_getch()
{
    int r;
    uint8_t c;
    if ((r = read(0, &c, sizeof(c))) < 0) {
        return r;
    } else {
        return c;
    }
}



static inline void
irq()
{
	if (cpu.i) {
		//info("***IRQ (masked, PC=%04x, INT RET ADDR=%04x)***\n", cpu.pc, cpu.mem[2]);
		//dump();
	} else {
		//info("***IRQ***\n");
		cpu.irq = 0;
	}
}


/*
 * The input ring buffer. We'll use 256 bytes, quite arbitrarily.
 */

#define RBSIZE 16
typedef struct {
	uint8_t buf[RBSIZE];
	int rp;
	int wp;
} ringbuf_t;

ringbuf_t *
ringbuf_init()
{
	ringbuf_t * x = (ringbuf_t *)malloc(sizeof(ringbuf_t));
	if (x == NULL) {
		perror("allocating memory");
		exit(1);
	}
	
	x->rp = 0;
	x->wp = 0;
	return x;
}

void
ringbuf_put(ringbuf_t * rb, uint8_t val)
{
	assert(rb != NULL);
	rb->buf[rb->wp] = val;
	rb->wp = (rb->wp + 1) % RBSIZE;
}

int
ringbuf_get(ringbuf_t * rb, uint8_t * val)
{
	if (rb->wp == rb->rp) return -1;
	*val = rb->buf[rb->rp];
	rb->rp = (rb->rp + 1) % RBSIZE;
	return 0;
}

/* Return 1 if data available, 0 i not. */
int
ringbuf_poll(ringbuf_t * rb)
{
	return rb->wp != rb->rp;
}


/* 
 * This is called to initialise the I/O subsystem.
 */

static ringbuf_t * inputbuf;

void
io_init()
{
	inputbuf = ringbuf_init();
	input_init();
}

/* This is called once per clock tick to handle I/O and other
 * background tasks. */
void
io_tick()
{
#if 0
	static time_t t0 = 0;
	time_t t = time(NULL);
	if ((t - t0) > 2) {
		if (t0) {
			cpu.irq = 0;
			info("TICK %d!\n", t % 3600);
		}
		t0 = t;
	}
#endif

	/* Is there input? */
	if (input_kbhit()) {
		int c = input_getch();
		if (c == 28) {
			cpu.halt = 1;
			dump_state();
			dump_ustate();
			info("*** QUIT PRESSED ***\n");
		} else if (c == '`') {
			dump();
		} else {
			ringbuf_put(inputbuf, c);
			irq();
		}
	}

}



word
unit_io(int r, int w)
{
word addr = cpu.mar & 0x3ff;
word dbus = cpu.dbus;
word retval;
	if(r) {
		switch (addr) {
		case IO_PANEL_SWITCHES:
			/* Read front panel switches */
			retval = 0xf0f0;
			iodebug("IN %x: FRONT PANEL SWITCHES = %04x\n", addr, retval);
			return retval;

		case IO_HW_TYPE:
			/* Read hardware flags */
			retval = 0x0001; /* Emulator */
			iodebug("IN %x: READ HARDWARE TYPE = %04x\n", addr, retval);
			return retval;

		case 0x080:
			/* Poll input buffer */
			retval = ringbuf_poll(inputbuf);
			iodebug("IN %x: TTY0 POLL = %d\n", addr, retval);
			return retval;

		case 0x081:
		{
			/* Read input buffer */
			uint8_t c;
			retval = ringbuf_get(inputbuf, &c);
			retval = retval == 0xffff ? retval : c;
			//printf("**** IN %d ****\n\r", retval);
			//dump();
			iodebug("IN %x: TTY0 GET = %d\n", addr, retval);
			//debug_io = 1;
			//debug_microcode = 1;
			return retval;
		}

		default:
			fail("Input from location %04x: NOT IMPLEMENTED\n", addr);
		}
	} else if(w) {
		switch (addr) {
		case IO_CLOCK_HALT:
			cpu.halt = 1;
			dump_state();
			dump_ustate();
			info("*** HALTING ***\n");
			break;
			
		case 0x81:
			fprintf(log_file, "%c", dbus & 0xff);
			fflush(log_file);
			//printf("**** OUT %d ****\n\r", dbus);
			putchar(dbus & 0xff);
			fflush(stdout);
			//debug_io = 0;
			//debug_microcode = 0;
			break;

		case 0x3f0:
		{
			const char *s = map_get(dbus);
			if (s == NULL) {
				fprintf(log_file, "%hx (?)", dbus);
				fflush(log_file);
				testdebug("PRINTA: %hx (?)\n", dbus);
			} else {
				fprintf(log_file, "%hx (%s)", dbus, s);
				fflush(log_file);
				testdebug("PRINTA: %hx (%s)\n", dbus, s);
			}
			break;
		}
		case 0x3f1:
			fprintf(log_file, "%c", dbus & 0xff);
			fflush(log_file);
			if ((dbus > 32) && (dbus < 127)) {
				testdebug("PRINTC: %c\n", dbus);
			} else {
				testdebug("PRINTc: %d\n", dbus & 0xff);
			}
			break;
		case 0x3f2:
			fprintf(log_file, "%hd", dbus);
			fflush(log_file);
			testdebug("PRINTD: %hd\n", dbus);
			break;
		case 0x3f3:
			fprintf(log_file, "%04hx", dbus);
			fflush(log_file);
			testdebug("PRINTU: %u\n", (uint16_t)dbus);
			break;
		case 0x3f4:
			fprintf(log_file, "%04hx", dbus);
			fflush(log_file);
			testdebug("PRINTH: %04hx\n", dbus);
			break;
		case 0x3f5:
		{
			char s[17];
			to_bin(cpu.a, s, 16);
			fprintf(log_file, "%s", s);
			fflush(log_file);
			testdebug("PRINTB: %s\n", s);
			break;
		}
		case 0x3f6:
			fprintf(log_file, " ");
			fflush(log_file);
			testdebug("PRINTc: 32\n", dbus);
			break;
		case 0x3f7:
			fprintf(log_file, "\n");
			fflush(log_file);
			testdebug("PRINTc: 10\n", dbus);
			break;
		case 0x3f8:
			debug_asm = 1;
			iodebug("Enabling debugging trace\n");
			break;
		case 0x3f9:
			debug_asm = 0;
			iodebug("Disabling debugging trace\n");
			break;
		case 0x3fa:
			fflush(stdout);
			//dump();
			//dumpmem(0x500, 8);
			//dumpmem(0x204, 20);
			//dumpmem(0x860, 16);
			dumpstack(0x500, 0);
			dumpstack(0x600, 1);
			printf(COL_NOR);
			break;
		case 0x3fb:
			// Store the high word of a 32-bit quanity for later printing.
			_hword = dbus;
			break;
		case 0x3fc:
			fprintf(log_file, "%hu", (_hword << 16) | dbus);
			fflush(log_file);
			testdebug("PRINTL: %08x\n", (_hword << 16) | dbus);
			break;
		case 0x3fe:
			testdebug("ASSERT: TRUE\n");
			break;
		case 0x3ff:
			testdebug("ASSERT: FALSE\n");
			cpu.halt = 1;
			break;

		default:
			fail("Output %04x to location %04x: NOT IMPLEMENTED\n", dbus, addr);
		}
	}
	return cpu.dbus;
}

/* End of file */
