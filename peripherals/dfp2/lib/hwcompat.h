#warning "TODO: Review this file for DFP2"

#ifndef __HWCOMPAT_H__
#define __HWCOMPAT_H__


#define bool_t uint8_t


///////////////////////////////////////////////////////////////////////////////
//
// I/O ADDRESS MAP
//
///////////////////////////////////////////////////////////////////////////////

// The weirdness of these addresses comes from them being partially
// decoded with 74138s.

// U111 output decoder.
#define WRITE_AB_L    0x40	// Write to AB bits 0-7
#define WRITE_AB_M    0x41	// Write to AB bits 8-15
#define WRITE_AB_H    0x42	// Write to AB bits 16-23
#define WRITE_DB_L    0x43	// Write to DB bits 0-7
#define WRITE_DB_H    0x44	// Write to DB bits 8-15
#define WRITE_IBUS_L  0x45	// Write to IBUS bits 0-7
#define WRITE_IBUS_H  0x46	// Write to IBUS bits 8-15
#define WRITE_OR_L    0x47	// Write to OR, bits 0-7

// U112 output decoder.
#define WRITE_OR_H    0x80	// Write to OR, bits 8-15
#define WRITE_RADDR   0x81	// Output to µCV RADDR field
#define WRITE_WADDR   0x82	// Output to µCV WADDR field
#define WRITE_MCV_H   0x83	// Output to µCV ACTION field
#define WRITE_TP104   0x84	// TP104 output (reserved)
#define WRITE_TP105   0x85	// TP105 output (reserved)
#define WRITE_TP106   0x86	// TP106 output (reserved)
#define WRITE_TP107   0x87	// TP107 output (reserved)

// U113 input decoder
#define READ_AB_L     0x40	// Read AB bits 0-7
#define READ_AB_M     0x41	// Read AB bits 8-15
#define READ_AB_H     0x42	// Read AB bits 16-23
#define READ_DB_L     0x43	// Read DB bits 0-7
#define READ_DB_H     0x44	// Read DB bits 8-15
#define READ_IBUS_L   0x45	// Read IBUS bits 0-7
#define READ_IBUS_H   0x46	// Read IBUS bits 8-15
#define READ_DSR      0x47	// Read DIP switches




#ifdef AVR

#include <avr/pgmspace.h>
#include <util/delay.h>


///////////////////////////////////////////////////////////////////////////////
//
// OLD CODE
//
///////////////////////////////////////////////////////////////////////////////

// TODO: Update everything below this point and move it above this
// section block, or delete it.

// TODO: check why this was the case with the DFP 1.0 code.
// #if (F_CPU != 14745600)
// #  error "The only supported clock speed is 14.7456 MHz"
// #endif

#define CLKBASE 14400 // << 10

// At ~16 MHz and 2 cycles per NOP, this is a 125ns delay.
#define short_delay() asm("nop");

// If we're on a platform with only one USART, redefine some macros.
#ifndef UCSR0A
#define UCSR0A UCSRA
#define UCSR0B UCSRB
#define UCSR0C UCSRC
#define TXEN0 TXEN
#define RXEN0 RXEN
#define UBRR0L UBRRL
#define UBRR0H UBRRH
#define RXCIE0 RXCIE
#define USART_RX_vect USART_RXC_vect
#define FE0 FE
#define UDR0 UDR
#define UDRE0 UDRE
#endif // UCSR0

#define setup() short_delay()
#define hold() short_delay()

#else



#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

#define PGM_P char *
#define PROGMEM
#define PSTR(x) x
#define pgm_read_byte(p) (*(p))
#define pgm_read_word(p) (*(p))
#define strncmp_P strncmp
#define _delay_us(us) usleep(us)
#define _delay_ms(us) usleep((us) * 1000)
#define short_delay() usleep(100);

#define setup() 
#define hold() 

#endif // ! AVR

#endif // __HWCOMPAT_H__

// End of file.
