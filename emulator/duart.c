/* 
   
duart.c - Emulates the dual DUART card (two Philips/NXP 26C92 DUARTs)

Copyright (C) 2012 Alexios Chouchoulas

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
#include <time.h> 
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
#include "util.h"
#include "io.h"
#include "duart.h"
#include "irc.h"
#include "uterm.h"


int duart = 1;

int debug_duart = 0;

uart_t uart[NUM_UARTS];

uart_source_t uart_source[NUM_UARTS];

#if NUM_UARTS==4
int tty_irqs[NUM_UARTS] = { IRQ_TTY01, IRQ_TTY01, IRQ_TTY23, IRQ_TTY23 };
#else
#error Unsupported value for NUM_UARTS (add more IRQ definitions)
#endif

#ifndef UART16550
#error Only 16550 UARTs are supported as of 2014-09-14.
#endif

///////////////////////////////////////////////////////////////////////////////
//
// CONNECT UNIX STDIO/STDOUT TO UART 0A.
//
///////////////////////////////////////////////////////////////////////////////


static struct termios _input_termios;
static fifo_t * inputbuf;

static void
input_reset_terminal_mode()
{
	tcsetattr(0, TCSANOW, &_input_termios);
}


static int _input_init = 0;

static void
input_init()
{
	struct termios new_termios;

	_input_init = 1;
	
	inputbuf = fifo_init(16);
	
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


static void
input_done()
{
	if (!_input_init) return;

	input_reset_terminal_mode();
}


static int
input_kbhit()
{
	struct timeval tv = { 0L, 30L };

	// Do nothing if the stdio input source hasn't been started.
	if (!_input_init) return 0;

	fd_set fds;
	//int maxfd;
	FD_ZERO(&fds);
	FD_SET(0, &fds);
	return select(1, &fds, NULL, NULL, &tv);
}


static int
input_getch()
{
	int r;
	uint8_t c;

	// Do nothing if the stdio input source hasn't been started.
	if (!_input_init) return 0;

	if ((r = read(0, &c, sizeof(c))) < 0) {
		return r;
	} else {
		return c;
	}
}


///////////////////////////////////////////////////////////////////////////////
//
// DUART DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////


static void
uart_init(uart_t *u, char *fname)
{
	u->magic = UART_MAGIC;

	u->ier = 0;
	u->isr = 1;
	u->fcr = 0;
	u->lcr = 0;
	u->mcr = 0;
	u->lsr = 0x60;
	u->msr = 0;
	u->spr = 0xff;

	u->int_lsr = 0;
	u->int_rxrdy = 0;
	u->int_rxtimeout = 0;
	u->int_txrdy = 0;
	u->int_msr = 0;
	u->int_txrdy_arm = 0;

	u->dll = 0x12;			// arbitrary values
	u->dlh = 0x34;
	u->afr = 0;

	u->is_stdin = 0;
	u->is_stdout = 0;
	u->echo = 0;

	u->rxfifo = fifo_init(16);
	u->txfifo = fifo_init(16);
	
	//u->term = NULL;
	u->term = uterm_new(200);
	
	if(fname && fname[0]) {
		u->fp = fopen(fname, "w+");
		if (u->fp == NULL) {
			fail("Failed to open UART file %s: %m\n", fname);
		}
	} else {
		u->fp = NULL;
	}
}


static void
uart_done(uart_t *u)
{
	assert(u != NULL);
	assert(u->magic == UART_MAGIC);
	fifo_done(u->rxfifo);
	fifo_done(u->txfifo);
	if (u->fp != NULL) fclose(u->fp);
	if (u->term != NULL) uterm_destroy(u->term);
}


void
uart_rx(int unit, uart_t * u, char c)
{
	assert(u != NULL);
	assert(u->magic == UART_MAGIC);
	//if (!u->rxen) return;

	// Duplicate 16550 behaviour: FIFO is not updated on overruns.
	if (fifo_full(u->rxfifo)) {
		u->lsr |= 2;		// Flag overrun error
		duartdebug("Unit %d FIFO full, receive overrun\n", unit);
	} else {
		u->lsr &= 0xfd;		// Clear overrun error flag
		u->lsr |= 1;		// Data available
		fifo_put(u->rxfifo, c);
		duartdebug("UART%d RB %d %d\n", unit, u->rxfifo->rp, u->rxfifo->wp);
	}

	// RXRDY interrupt?
	if (u->ier & 1) {
		u->int_rxrdy = 1;
		interrupt(tty_irqs[unit]);
	}

	if (u->echo) {
		if (u->fp != NULL) {
			if (write(fileno(u->fp), &c, 1) != 1) {
				fail("UART%d: failed to write to stdout: %s",
				     unit,
				     strerror(errno));
				exit(1);
			}
		}
		if (u->term != NULL) uterm_putc(u->term, c);
	}
}


void
uart_tx(int unit, uart_t * u, char c)
{
	assert(u != NULL);
	assert(u->magic == UART_MAGIC);

	if (u->fp != NULL) {
		if (write(fileno(u->fp), &c, 1) != 1) {
			fail("UART%d: failed to write to stdout: %s",
			     unit,
			     strerror(errno));
			exit(1);
		}
	}
	if (u->term != NULL) uterm_putc(u->term, c);
}


//////////////////////////////////////////////////////////////////////////////
//
// Board-level emulation
//
///////////////////////////////////////////////////////////////////////////////


void
duart_init()
{
	int i;
	int need_input = 0;

	for(i = 0; i < NUM_UARTS; i++) {
		char fname[80];
		snprintf(fname, sizeof(fname), "output%d", i);
		duartinfo("Initialising UART %d%c, file %s.\n", i >> 1, 'A' + (i & 1), fname);
		uart_init(&uart[i], fname);

		if (uart_source[i] == UART_SOURCE_STDIO) {
			uart[i].is_stdin = 1;
			uart[i].is_stdout = 1;
			uart[i].echo = 0;
			need_input = 1;
		}
	}

	if (need_input) {
		input_init();
	}
}


void
duart_done() 
{
	int i;
	for(i = 0; i < NUM_UARTS; i++) {
		uart_done(&uart[i]);
	}
	input_done();
}



#ifdef UART16550
int 
duart_write(uint16_t addr, uint16_t dbus)
{
	int unit = -1;
	char c;
	
	/* Which chip is being addressed? */
	if ((addr & 0xfff8) == IO_TTY0_RX) unit = 0;
	else if ((addr & 0xfff8) == IO_TTY1_RX) unit = 1;
	else if ((addr & 0xfff8) == IO_TTY2_RX) unit = 2;
	else if ((addr & 0xfff8) == IO_TTY3_RX) unit = 3;
	else return 0;
	
	int ofs = addr & 0xf;
	
	switch (ofs) {
	case 0:			/* Transmit Holding Reg / Baud Rate Low */
	case 8:
		if (uart[unit].lcr & 0x80) {
			uart[unit].dll = dbus;
			duartdebug("Unit %d DLL %02x (%d bps)\n",
				   unit, dbus,
				   921600 / (uart[unit].dll | (uart[unit].dlh << 8)));
		} else {
			duartdebug("Unit %d Tx %02x\n", unit, dbus);

			// TxRDY interrupt? (we don't emulate UART transmission delays)
			if (uart[unit].ier & 2) {
				uart[unit].int_txrdy_arm++;
				uart[unit].lsr &= ~0x60; // Clear the TX FIFO empty flags
			}

			fputc(dbus & 0xff,log_file);
			c = dbus & 0xff;
			fifo_put(uart[unit].txfifo, dbus);
			if (uart[unit].is_stdout) {
				if (write(fileno(stdout), &c, 1) != 1) {
					fail("UART%d: failed to write to stdout: %s",
					     unit,
					     strerror(errno));
					exit(1);
				}
			}
			if (uart[unit].fp != NULL) {
				if (write(fileno(uart[unit].fp), &c, 1) != 1) {
					fail("UART%d: failed to write to output file: %s",
					     unit,
					     strerror(errno));
					exit(1);
				}
			}
			if (uart[unit].term != NULL) uterm_putc(uart[unit].term, c);
		}
		return 1;

	case 1:
	case 9:
		if (uart[unit].lcr & 0x80) {
			uart[unit].dlh = dbus;
			duartdebug("Unit %d DLH %02x (%d bps)\n",
				   unit, dbus,
				   921600 / (uart[unit].dll | (uart[unit].dlh << 8)));
		} else {
			duartdebug("Unit %d IER %02x\n", unit, dbus);
			uart[unit].ier = dbus & 0xff;
		}
		return 1;

	case 2:
	case 10:
		if (uart[unit].lcr & 0x80) {
			duartdebug("Unit %d AFR %02x\n", unit, dbus);
		} else {
			duartdebug("Unit %d FCR %02x\n", unit, dbus);
			uart[unit].fcr = dbus & 0xff;
		}
		return 1;
		
	case 3:
	case 11:
		uart[unit].lcr = dbus & 0xff;
		duartdebug("Unit %d LCR %02x\n", unit, dbus);
		return 1;

	case 4:
	case 12:
		if (uart[unit].lcr & 0x80) {
			warning("DUART%d: attempt to write to MCR with LCR[7] high.\n", unit);
		}
		uart[unit].mcr = dbus & 0xff;
		duartdebug("Unit %d MCR %02x\n", unit, dbus);
		return 1;

	case 5:				// Decoded but non-existent registers.
	case 13:
	case 6:
	case 14:
		warning("DUART%d: write to non-existent registr %04d\n", unit, addr);
		return 1;

	case 7:
	case 15:
		if (uart[unit].lcr & 0x80) {
			warning("DUART%d: attempt to write to SPR with LCR[7] high.\n", unit);
		}
		uart[unit].spr = dbus & 0xff;
		duartdebug("Unit %d SPR %02x\n", unit, dbus);
		return 1;
	}
	
	return 0;
}



int
duart_read(uint16_t addr, uint16_t *dbus)
{
	int unit = -1;
	uint32_t c = 0xffff;
	
	/* Which chip is being addressed? */
	if ((addr & 0xfff8) == IO_TTY0_RX) unit = 0;
	else if ((addr & 0xfff8) == IO_TTY1_RX) unit = 1;
	else if ((addr & 0xfff8) == IO_TTY2_RX) unit = 2;
	else if ((addr & 0xfff8) == IO_TTY3_RX) unit = 3;
	else return 0;
	
	int ofs = addr & 0xf;
	
	switch (ofs) {
	case 0:			/* Receive Holding Reg */
	case 8:
		fifo_get(uart[unit].rxfifo, &c);
		if (!fifo_poll(uart[unit].rxfifo)) {
			uart[unit].lsr &= 0xfe; // No data ready, FIFO empty.
		}
		*dbus = c;
		duartdebug("Read UART %d = %04x\n", unit, *dbus);
		return 1;

	case 1:				// IER
	case 9:
		*dbus = uart[unit].ier;
		duartdebug("UART%d IER=%02x\n", unit, *dbus);
		return 1;

	case 2:				// ISR
	case 10:
		if (uart[unit].int_lsr) {
			*dbus = 0xc6;
			uart[unit].int_lsr = 0;
		} else if (uart[unit].int_rxrdy) {
			*dbus = 0xc4;
			uart[unit].int_rxrdy = 0;
		} else if (uart[unit].int_rxtimeout) {
			*dbus = 0xcc;
			uart[unit].int_rxtimeout = 0;
		} else if (uart[unit].int_txrdy) {
			*dbus = 0xc2;
			uart[unit].int_txrdy = 0;
		} else if (uart[unit].int_msr) {
			*dbus = 0xc0;
			uart[unit].int_msr = 0;
		} else {
			*dbus = 0xc1;	// No interrupts pending.
		}
		duartdebug("UART%d ISR=%02x\n", unit, *dbus);
		return 1;

	case 3:				// LCR
	case 11:
		*dbus = uart[unit].lcr;
		return 1;

	case 4:				// MCR
	case 12:
		*dbus = uart[unit].mcr;
		return 1;

	case 5:				// LSR
	case 13:
		*dbus = uart[unit].lsr;
		//*dbus |= fifo_poll(uart[unit].rxfifo) ? 0x0001 : 0;
		//*dbus |= !fifo_full(uart[unit].txfifo) ? 0x0020 : 0;
		duartdebug("UART %d LSR = %04x\n", unit, *dbus);
		return 1;

	case 6:				// MSR
	case 14:
		*dbus = uart[unit].msr;
		return 1;

	case 7:				// SPR
	case 15:
		*dbus = uart[unit].spr;
		duartdebug("UART%d SPR = %04x\n", unit, *dbus);
		return 1;
	}
	
	return 0;
}
#endif


void
duart_tick(int tick)
{
	/* Is there input? */
	if (input_kbhit()) {
		int c = input_getch();
		if (c == 28) {
			quit(0);
		} else {
			int i;
			for (i = 0; i < NUM_UARTS; i++) {
				if (uart[i].is_stdin) {
					uart_rx(i, &uart[i], c);
				}
			}
		}
	}

	// Are there interrupts to issue?
	for (int i = 0 ; i < NUM_UARTS; i++) {
		if (uart[i].int_txrdy_arm) {
			duartdebug("Unit %d TX FIFO %d deep\n", i, uart[i].int_txrdy_arm);
			uart[i].int_txrdy_arm -= 16; // This is ROUGHLY equivalent to 57600 bps.
			if (uart[i].int_txrdy_arm < 0) uart[i].int_txrdy_arm = 0;

			if (uart[i].int_txrdy_arm == 0) {
				uart[i].int_txrdy = 1;
				uart[i].lsr |= 0x60;
				interrupt(tty_irqs[i]);
				duartdebug("Unit %d TXRDY int\n", i);
			}
		}
	}
}


/* End of file. */
