// -*- c -*-
// 
// tty.c — Quad Serial board
// 
// Copyright © 2012–2021 Alexios Chouchoulas
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

#define DEB_MACROS_UNIT tty_log_unit
#include "log.h"

#include "tty.h"
#include "irc.h"
#include "util.h"


static log_unit_t   tty_log_unit;

uart_t  uart[NUM_UARTS];
uint8_t irqs[NUM_UARTS] = { 7, 7, 7, 6 }; // Tentative allocation



///////////////////////////////////////////////////////////////////////////////
//
// CODE FOR A SINGLE UART
//
///////////////////////////////////////////////////////////////////////////////

static void
uart_init(uart_t *u)
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

	u->tty = NULL;
	
	//u->term = uterm_new(200);

        // TODO: How do we connect this to a host computer TTY?
	
	// if(fname && fname[0]) {
	// 	u->fp = fopen(fname, "w+");
	// 	if (u->fp == NULL) {
	// 		fail("Failed to open UART file %s: %m\n", fname);
	// 	}
	// } else{
	// 	u->fp = NULL;
	// }
}


static void
uart_done(uart_t *u)
{
	assert(u != NULL);
	assert(u->magic == UART_MAGIC);
}


static int
uart_read(int unit, longaddr_t ofs, word *dbus)
{
        assert (unit >= 0 && unit < 4);
        assert (ofs >= 0 && ofs < 8);
        assert (uart[unit].tty != NULL);

	uint32_t c = 0xffff;
        
	switch (ofs) {
	case 0:			/* Receive Holding Reg */
		c = ringbuf_get(uart[unit].tty->input);
		if (ringbuf_empty(uart[unit].tty->input)) {
			uart[unit].lsr &= 0xfe; // No data ready, FIFO empty.
		}
		*dbus = c & 0xff;
		debug("Read UART %d = %04x\n", unit, *dbus);
		return 1;

	case 1:				// IER
		*dbus = uart[unit].ier;
		debug("UART%d IER=%02x\n", unit, *dbus);
		return 1;

	case 2:				// ISR
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
		debug("UART%d ISR=%02x\n", unit, *dbus);
		return 1;

	case 3:				// LCR
		*dbus = uart[unit].lcr;
		return 1;

	case 4:				// MCR
		*dbus = uart[unit].mcr;
		return 1;

	case 5:				// LSR
		*dbus = uart[unit].lsr;
                // 2021-09-23: what is this? (it was commented out, check 16550 docs)
		//*dbus |= fifo_poll(uart[unit].input) ? 0x0001 : 0;
		//*dbus |= !fifo_full(uart[unit].output) ? 0x0020 : 0;
		debug("UART %d LSR = %04x\n", unit, *dbus);
		return 1;

	case 6:				// MSR
		*dbus = uart[unit].msr;
		return 1;

	case 7:				// SPR
		*dbus = uart[unit].spr;
		debug("UART%d SPR = %04x\n", unit, *dbus);
		return 1;
	}
	
	return 0;
}



static int 
uart_write(int unit, longaddr_t ofs, word dbus)
{
	switch (ofs) {
	case 0: {
                /* Transmit Holding Reg / Baud Rate Low */
                if (uart[unit].lcr & 0x80) {
                        uart[unit].dll = dbus;
                        debug("Unit %d DLL %02x (%d bps)\n",
                                   unit, dbus,
                                   921600 / (uart[unit].dll | (uart[unit].dlh << 8)));
		} else {
			debug("Unit %d Tx %02x\n", unit, dbus);
                        
			// TxRDY interrupt? (we don't emulate UART transmission delays)
			if (uart[unit].ier & 2) {
				uart[unit].int_txrdy_arm++;
				uart[unit].lsr &= ~0x60; // Clear the TX FIFO empty flags
			}

                        // TODO: write to the FD/logfile.
			// fputc(dbus & 0xff, log_file);

			// c = dbus & 0xff;
			// fifo_put(uart[unit].output, dbus);
			// if (uart[unit].is_stdout) {
			// 	if (write(fileno(stdout), &c, 1) != 1) {
			// 		fatal("UART%d: failed to write to stdout: %s",
			// 		     unit,
			// 		     strerror(errno));
			// 		exit(1);
			// 	}
			// }
			// if (uart[unit].fp != NULL) {
			// 	if (write(fileno(uart[unit].fp), &c, 1) != 1) {
			// 		fatal("UART%d: failed to write to output file: %s",
			// 		     unit,
			// 		     strerror(errno));
			// 		exit(1);
			// 	}
			// }
			// if (uart[unit].term != NULL) uterm_putc(uart[unit].term, c);
		}
		return 1;
        }
        
	case 1: {
		if (uart[unit].lcr & 0x80) {
			uart[unit].dlh = dbus;
			debug("Unit %d DLH %02x (%d bps)\n",
				   unit, dbus,
				   921600 / (uart[unit].dll | (uart[unit].dlh << 8)));
		} else {
			debug("Unit %d IER %02x\n", unit, dbus);
			uart[unit].ier = dbus & 0xff;
		}
		return 1;
        }

	case 2: {
		if (uart[unit].lcr & 0x80) {
			debug("Unit %d AFR %02x\n", unit, dbus);
		} else {
			debug("Unit %d FCR %02x\n", unit, dbus);
			uart[unit].fcr = dbus & 0xff;
		}
		return 1;
        }
        
        case 3: {
		uart[unit].lcr = dbus & 0xff;
		debug("Unit %d LCR %02x\n", unit, dbus);
		return 1;
        }

	case 4: {
		if (uart[unit].lcr & 0x80) {
			warning("UART%d: attempt to write to MCR with LCR[7] high.\n", unit);
		}
		uart[unit].mcr = dbus & 0xff;
		debug("Unit %d MCR %02x\n", unit, dbus);
		return 1;
        }

	case 5:				// Decoded but non-existent registers.
	case 6: {
		warning("UART%d: write to non-existent register %d\n", unit, ofs);
		return 1;
        }

	case 7: {
		if (uart[unit].lcr & 0x80) {
			warning("UART%d: attempt to write to SPR with LCR[7] high.\n", unit);
		}
		uart[unit].spr = dbus & 0xff;
		debug("Unit %d SPR %02x\n", unit, dbus);
		return 1;
	}
        }
	
	return 0;
}






///////////////////////////////////////////////////////////////////////////////
//
// CONNECT STUFF TO THE HOST
//
///////////////////////////////////////////////////////////////////////////////


void
uart_rx_from_host(int unit, uint8_t c)
{
        info("TODO");
}


void
uart_tx_to_host(int unit, uint8_t c)
{
        info("TODO");
}



// TODO: make this a callback io io.h tty_t and call it asynchronously when
// data is available, rather than polling.

void
uart_rx(int unit, uart_t * u, char c)
{
	assert(u != NULL);
	assert(u->magic == UART_MAGIC);

	// Mimic 16550 behaviour: FIFO is not updated on overruns.
	if (ringbuf_full(u->tty->input)) {
		u->lsr |= 2;		// Flag overrun error
		warning("Unit %d FIFO full, receive overrun\n", unit);
	} else {
		u->lsr &= 0xfd;		// Clear overrun error flag
		u->lsr |= 1;		// Data available
		ringbuf_put(u->tty->input, c);
		debug("UART%d receive byte %d %d\n", unit, u->tty->input->ip, u->tty->input->op);
	}

	// RXRDY interrupt?
	if (u->ier & 1) {
		u->int_rxrdy = 1;
		irc_irq(irqs[unit]);
	}

        // TODO: implement actual echo to host TTY
	// if (u->echo) {
	// 	if (u->fp != NULL) {
	// 		if (write(fileno(u->fp), &c, 1) != 1) {
	// 			fatal("UART%d: failed to write to stdout: %s",
	// 			     unit,
	// 			     strerror(errno));
	// 			exit(1);
	// 		}
	// 	}
	// 	if (u->term != NULL) uterm_putc(u->term, c);
	// }
}


void
uart_tx(int unit, uart_t * u, char c)
{
	assert(u != NULL);
	assert(u->magic == UART_MAGIC);

        // TODO: implement actual write to host TTY
	// if (u->fp != NULL) {
	// 	if (write(fileno(u->fp), &c, 1) != 1) {
	// 		fatal("UART%d: failed to write to stdout: %s",
	// 		     unit,
	// 		     strerror(errno));
	// 		exit(1);
	// 	}
	// }
	// if (u->term != NULL) uterm_putc(u->term, c);
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
	// int need_input = 0;

	for(i = 0; i < NUM_UARTS; i++) {
		// char fname[80];
		// snprintf(fname, sizeof(fname), "output%d", i);
		// info("Initialising UART %d%c, file %s.\n", i >> 1, 'A' + (i & 1), fname);
		uart_init(&uart[i]);

		// if (uart_source[i] == UART_SOURCE_STDIO) {
		// 	uart[i].is_stdin = 1;
		// 	uart[i].is_stdout = 1;
		// 	uart[i].echo = 0;
		// 	need_input = 1;
		// }
	}

	// if (need_input) {
	// 	input_init();
	// }
}


void
duart_done() 
{
	int i;
	for(i = 0; i < NUM_UARTS; i++) {
		uart_done(&uart[i]);
	}
	// input_done();
}





void
duart_tick(int tick)
{
	// /* Is there input? */
	// if (input_kbhit()) {
	// 	int c = input_getch();
	// 	if (c == 28) {
	// 		quit(0);
	// 	} else {
	// 		int i;
	// 		for (i = 0; i < NUM_UARTS; i++) {
	// 			if (uart[i].is_stdin) {
	// 				uart_rx(i, &uart[i], c);
	// 			}
	// 		}
	// 	}
	// }

	// Are there interrupts to issue?
	for (int i = 0 ; i < NUM_UARTS; i++) {
		if (uart[i].int_txrdy_arm) {
			debug("Unit %d TX FIFO %d deep\n", i, uart[i].int_txrdy_arm);
			uart[i].int_txrdy_arm -= 16; // This is ROUGHLY equivalent to 57600 bps.
			if (uart[i].int_txrdy_arm < 0) uart[i].int_txrdy_arm = 0;

			if (uart[i].int_txrdy_arm == 0) {
				uart[i].int_txrdy = 1;
				uart[i].lsr |= 0x60;
				irc_irq(irqs[i]);
				debug("Unit %d TXRDY interrupt (IRQ%d)\n", i, irqs[i]);
			}
		}
	}
}



///////////////////////////////////////////////////////////////////////////////
//
// BOARD-LEVEL EMULATION
//
///////////////////////////////////////////////////////////////////////////////


void tty_init()
{
        tty_log_unit = log_add_unit("TTY", -1, -1);

        for (int i = 0; i < NUM_UARTS; i++) {
                uart_init(&uart[i]);
        }
        debug("Initialised Quad Serial Board");
	tty_reset();
}


void
tty_reset() {
}


void
tty_tick()
{
	// // Signal a CPU interrupt if any of the enabled interrupts lines are
	// // asserted.
	// if (isr & ier) cpu.irq = 1;
}


int
tty_read(longaddr_t addr, word * data)
{
        // Are we selected?
        if (addr < TTY_BASE_ADDRESS || addr >= (TTY_BASE_ADDRESS + 32)) {
                return 0;       // Nope
        }
	
	// Which unit is being addresses?
        int unit = (addr & 31) >> 3;
        uint16_t ofs = addr & 7;

        return uart_read(unit, ofs, data);
}


int
tty_write(longaddr_t addr, word data)
{
        // Are we selected?
        if (addr < TTY_BASE_ADDRESS || addr >= (TTY_BASE_ADDRESS + 32)) {
                return 0;       // Nope
        }
	
	// Which unit is being addresses?
        uint unit = (addr & 31) >> 3;
        uint16_t ofs = addr & 7;

        return uart_write(unit, ofs, data);
}


void
tty_done() {
	for(int i = 0; i < NUM_UARTS; i++) {
		uart_done(&uart[i]);
	}
}


void
tty_connect_tty_t(int unit, tty_t * tty)
{
        assert (unit >= 0 && unit < 4);
        assert (tty != NULL);

        uart[unit].tty = tty;
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
