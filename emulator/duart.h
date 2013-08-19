/* 

duart.h - Emulates the dual DUART card (two Philips/NXP 26C92 DUARTs)

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

#ifndef DUART_H
#define DUART_H 1


#include <stdint.h>
#include <sys/types.h>


#include "fifo.h"
#include "uterm.h"


extern int duart;

extern int debug_duart;


#define UART_MAGIC 0x55415254


typedef struct {
	int magic;		/* Always 0x11223344 */
	
	int txen;
	int rxen;
	int rxirq;
	uint8_t scratch;
	
	int is_stdin;
	int is_stdout;
	int echo;
	
	fifo_t * rxfifo;
	fifo_t * txfifo;

	FILE *fp;		/* Output log */
	uterm_t * term;		/* UI terminal */
} uart_t;


#define NUM_UARTS 4


extern uart_t uart[NUM_UARTS];

typedef enum {
	UART_SOURCE_NONE = 0
	,UART_SOURCE_STDIO
	,UART_SOURCE_FILE
} uart_source_t;


extern uart_source_t uart_source[NUM_UARTS];

extern int tty_irqs[NUM_UARTS];



void duart_init();

void duart_tick(int tick);

void duart_done();

int duart_write(uint16_t addr, uint16_t data);

int duart_read(uint16_t addr, uint16_t * data);



void uart_rx(int unit, uart_t * u, char c);

void uart_tx(int unit, uart_t * u, char c);


#endif /* DUART_H */

/* End of file. */
