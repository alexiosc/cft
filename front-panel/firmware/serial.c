// -*- indent-c -*-

#ifdef AVR
#include <inttypes.h>
#include <string.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>
#include <avr/pgmspace.h>

#include "iocompat.h"
#include "serial.h"
#include "utils.h"
#include "proto.h"

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


///////////////////////////////////////////////////////////////////////////////
//
// GLOBAL VARIABLES
//
///////////////////////////////////////////////////////////////////////////////

unsigned char my_table_id = 255; // An impossibility.


///////////////////////////////////////////////////////////////////////////////
//
// SERIAL PORT SUPPORT
//
///////////////////////////////////////////////////////////////////////////////


// If running on a 1MHz clock, doubling the serial clock rate will give us much
// better accuracy. For example, according to the Atmega168 datasheet, you get
// -7% timing error with U2X0=0, and +0.2% with U2X1=1. The bps rate
// calculation is different, of course.
#if F_CPU == 1000000
#  define INIT_UCSR0A _BV(U2X0)
#  define INIT_RATE_DIV 8UL
#else
#  define INIT_UCSR0A 0
#  define INIT_RATE_DIV 16UL
#endif // F_CPU == 1000000

#define INIT_RATE ((F_CPU / (INIT_RATE_DIV * SERIAL_BPS)) - 1)
#define INIT_RATE_L (INIT_RATE & 0xff)
#define INIT_RATE_H ((INIT_RATE & 0xf00) >> 8)


#define BPSRATE(x) ((F_CPU / (INIT_RATE_DIV * (x))) - 1)
#define BPS BPSRATE(SERIAL_BPS)


void
serial_init()
{
// This function is a NOP if running a test on the host.
	PORTD |= 1;		/* Pull-up */

	UCSR0A = INIT_UCSR0A;

	// Configure the serial port.
	UCSR0B =
		_BV(TXEN0) |	// Enable data transmission
		_BV(RXEN0);	// Enable data reception

	// Set asynchronous mode, no parity, 8 bits, 1 stop bit. This is the
        // default, so we don't actually have to set UCSR0C for this
	// configuration. This saves another 4 bytes of program memory.

	/*
	UCSR0C =
		// Async mode has bits UMSEL00 = 0 and UMSEL01 = 0.
		// No parity has bits UPM00 = 0 and UPM01 = 0.
		// One stop bit has bits USBS0 = 0.
		_BV(UCSZ00) | _BV(UCSZ01) // Set 8 bits per byte.
	*/

	// Set the bps rate.
	UBRR0L = BPS & 0xff;
	UBRR0H = (BPS >> 8) & 0xff;

	// Guard time
	//report_pstr(PSTR("Ready!\n\r"));

        // We can enable interrupt handling now.
	UCSR0B |= _BV(RXCIE0);		// Enable RX complete interrupt

	sei();
}


uint8_t cmode = 8;

// Serial receive interrupt handler.
ISR(USART_RX_vect)
{
	uint8_t c;

	// Ensure we don't have any framing errors. If we do, ignore the received
	// character.
	if (!bit_is_clear(UCSR0A, FE0)) {
		c = UDR0;
		return;
	}
	
	// Process the character directly from its register.
	c = UDR0;
	proto_input(c);
}



// Wait until the serial port is ready, then send a character to it.
void
serial_send(unsigned char c)
{
	loop_until_bit_is_set(UCSR0A, UDRE0);
	UDR0 = c;
        //_delay_ms(11);
}



       

///////////////////////////////////////////////////////////////////////////////
//
// TESTING CODE
//
///////////////////////////////////////////////////////////////////////////////

#ifdef TEST_SERIAL

int main(int argc, char **argv)
{
	serial_init();

	my_table_id = 0x42;
	report_ok(PSTR("TEST MESSAGE"));
	report_error(PSTR("TEST MESSAGE (ERROR OK)"));

	return 0;
}

#endif // TEST_SERIAL

#endif // AVR

// End of file.
