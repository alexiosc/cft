// -*- c -*-
// 
// tty.h — Quad Serial Board (TTY) definitions
// 
// Copyright © 2012–2021 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef TTY_H
#define TTY_H 1

#include "cftemu.h"
#include "io.h"

#include "ringbuf.h"
//#include "uterm.h"

#define NUM_UARTS 4

#define TTY_BASE_ADDRESS 0x100

#define UART_MAGIC 0x55415254

typedef struct {
	int     magic;		// UART_MAGIC

	uint8_t ier;            // UART registers
	uint8_t isr, fcr;
	uint8_t lcr;
	uint8_t mcr;
	uint8_t lsr;
	uint8_t msr;
	uint8_t spr;

	uint8_t dll, dlh;       // Rate divider
	uint8_t afr;
       
	int     int_lsr:1;      // Flags
	int     int_rxrdy:1;
	int     int_rxtimeout:1;
	int     int_txrdy:1;
	int     int_msr:1;

	int     int_txrdy_arm;	// TX queue empty, interrupt at next tick
	
	uint8_t scratch;        // Scratchpad register
	
        tty_t * tty;            // Link back to the emulator's struct

	// FILE *fp;		/* Output log */
	// uterm_t * term;		/* UI terminal */
} uart_t;





void tty_init();

void tty_reset();

int tty_read(longaddr_t addr, word * data);

int tty_write(longaddr_t addr, word data);

void tty_tick();

void tty_done();

void tty_connect_tty_t(int unit, tty_t* host_tty);


#endif // TTY_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
