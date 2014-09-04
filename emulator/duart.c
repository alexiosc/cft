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
#error "Unsupported value for NUM_UARTS (add more IRQ definitions)"
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
	
	inputbuf = fifo_init(64);
	
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

	u->txen = 0;
	u->rxen = 0;
	u->rxirq = 0;
	u->is_stdin = 0;
	u->is_stdout = 0;
	u->echo = 0;

	u->txen = 1;		/* Temporary */
	u->rxen = 1;		/* Temporary */
	u->rxirq = 1;		/* Temporary */

	u->rxfifo = fifo_init(8);
	u->txfifo = fifo_init(8);
	
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
	if (!u->rxen) return;
	fifo_put(u->rxfifo, c);
	if (u->rxirq) interrupt(tty_irqs[unit]);
	if (u->echo) {
		if (u->fp != NULL) write(fileno(u->fp), &c, 1);
		if (u->term != NULL) uterm_putc(u->term, c);
	}
}


void
uart_tx(int unit, uart_t * u, char c)
{
	assert(u != NULL);
	assert(u->magic == UART_MAGIC);
	if (!u->txen) return;
	//fifo_put(u->txfifo, c);
	//if (u->txirq) interrupt(tty_irqs[unit]);
	printf(">>>(%d)\n", c);
	if (u->fp != NULL) write(fileno(u->fp), &c, 1);
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



#ifdef UART26C92
int 
duart_write(uint16_t addr, uint16_t dbus)
{
	int unit = -1, chip = -1;
	char c;
	
	/* Which chip is being addressed? */
	if ((addr & 0xfff0) == IO_DUART0_BASE) chip = 0;
	else if ((addr & 0xfff0) == IO_DUART1_BASE) chip = 1;
	else return 0;
	
	/* Select A/B UART */
	unit = chip * 2;
	if (addr & 8) unit++;
	
	int ofs = addr & 0xf;
	
	switch (ofs) {
	case 0:			/* Mode register */
	case 8:
		return 1;
		
	case 1:			/* Clock Select register */
	case 9:
		return 1;

	case 2:			/* Command Register */
	case 10:
		return 1;
		
	case 4:			/* Aux Control Register */
	case 12:
		return 1;

	case 5:			/* Interrupt Mask Register */
		if (0) {
			duartinfo("UART chip %d (units %d & %d): IMR = %08x\n",
				  chip, chip * 2, chip * 2 + 1, dbus);
		}
		uart[chip * 2].rxirq = dbus & 0x02;
		uart[chip * 2 + 1].rxirq = dbus & 0x20;
		return 1;

	case 6:			/* C/T Upper Preset Value */
	case 7:			/* C/T Lower Preset Value */
	case 14:		/* Set Output Port Bits command */
	case 13:		/* Output Port Conf Register  */
	case 15:		/* Reset Output Port Bits command */
		return 1;

	case 3:			/* TxFIFO */
	case 11:
		duartdebug("Unit %d Tx %02x\n", unit, dbus);
		fputc(dbus & 0xff,log_file);
		c = dbus & 0xff;
		fifo_put(uart[unit].txfifo, dbus);
		if (uart[unit].is_stdout) {
			write(fileno(stdout), &c, 1);
		}
		if (uart[unit].fp != NULL) write(fileno(uart[unit].fp), &c, 1);
		if (uart[unit].term != NULL) uterm_putc(uart[unit].term, c);
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
	if ((addr & 0xfff0) == IO_DUART0_BASE) unit = 0;
	else if ((addr & 0xfff0) == IO_DUART1_BASE) unit = 2;
	else return 0;
	
	/* Select A/B UART */
	if (addr & 8) unit++;
	
	int ofs = addr & 0xf;
	
	switch (ofs) {
	case 0:			/* Mode register */
	case 8:
		
	case 2:			/* Reserved */
	case 10:
		
	case 4:			/* Input port change register */
	case 12:

	case 5:			/* Interrupt Status Register */
	case 13:

	case 6:			/* Counter/Timer upper value */
	case 7:			/* Counter/Timer lower value */
	case 14:		/* Start counter command */
	case 15:		/* Stop counter command */
		*dbus = 0;
		return 1;

	case 1:			/* Status register */
	case 9:
		*dbus = 0;
		*dbus |= fifo_poll(uart[unit].rxfifo) ? 0x0001 : 0;
		*dbus |= !fifo_full(uart[unit].txfifo) ? 0x0004 : 0;
		duartdebug("Poll UART %d = %04x\n", unit, *dbus);
		return 1;

	case 3:			/* RxFIFO */
	case 11:
		fifo_get(uart[unit].rxfifo, &c);
		*dbus = c;
		duartdebug("Read UART %d = %04x\n", unit, *dbus);
		return 1;
	}
	
	return 0;
}
#endif


#ifdef UART16550
int 
duart_write(uint16_t addr, uint16_t dbus)
{
	int unit = -1;
	char c;
	
	/* Which chip is being addressed? */
	if ((addr & 0xfff0) == IO_TTY0_RX) unit = 0;
	else if ((addr & 0xfff0) == IO_TTY1_RX) unit = 1;
	else if ((addr & 0xfff0) == IO_TTY2_RX) unit = 2;
	else if ((addr & 0xfff0) == IO_TTY3_RX) unit = 3;
	else return 0;
	
	int ofs = addr & 0xf;
	
	switch (ofs) {
	case 0:			/* Transmit Holding Reg */
	case 8:
		duartdebug("Unit %d Tx %02x\n", unit, dbus);
		fputc(dbus & 0xff,log_file);
		c = dbus & 0xff;
		fifo_put(uart[unit].txfifo, dbus);
		if (uart[unit].is_stdout) {
			write(fileno(stdout), &c, 1);
		}
		if (uart[unit].fp != NULL) write(fileno(uart[unit].fp), &c, 1);
		if (uart[unit].term != NULL) uterm_putc(uart[unit].term, c);
		return 1;

	case 1:
	case 9:

	case 2:
	case 10:
		
	case 3:
	case 11:

	case 4:
	case 12:

	case 5:
	case 13:

	case 6:
	case 14:
		return 1;

	case 7:
	case 15:
		uart[unit].scratch = dbus & 0xff;
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
	if ((addr & 0xfff0) == IO_TTY0_RX) unit = 0;
	else if ((addr & 0xfff0) == IO_TTY1_RX) unit = 1;
	else if ((addr & 0xfff0) == IO_TTY2_RX) unit = 2;
	else if ((addr & 0xfff0) == IO_TTY3_RX) unit = 3;
	else return 0;
	
	int ofs = addr & 0xf;
	
	switch (ofs) {
	case 0:			/* Receive Holding Reg */
	case 8:
		fifo_get(uart[unit].rxfifo, &c);
		*dbus = c;
		duartdebug("Read UART %d = %04x\n", unit, *dbus);
		return 1;

	case 5:
	case 13:
		*dbus = 0;
		*dbus |= fifo_poll(uart[unit].rxfifo) ? 0x0001 : 0;
		*dbus |= !fifo_full(uart[unit].txfifo) ? 0x0020 : 0;
		duartdebug("UART %d LSR = %04x\n", unit, *dbus);
		return 1;

	case 1:
	case 9:

	case 2:
	case 10:
		
	case 3:
	case 11:

	case 4:
	case 12:

	case 6:
	case 14:
		return 1;

	case 7:
	case 15:
		*dbus = uart[unit].scratch;
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
}


/* End of file. */
