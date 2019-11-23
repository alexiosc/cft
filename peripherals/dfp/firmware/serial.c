 // -*- indent-c -*-

#include <inttypes.h>
#include <string.h>

#ifdef TEST

// We use this for testing.
#include <stdio.h>

#else

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>
#include <avr/pgmspace.h>

#include "iocompat.h"		/* Note [1] */

#endif // TEST

#include "serial.h"
#include "utils.h"
#include "proto.h"

#ifdef HOST
#define PROGMEM
#endif // HOST


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
#ifndef HOST

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

#else

	printf("serial_init(): CPU clock=%lu.%06lu MHz, bps=%lu, divider=%lu (%02x/%02x)\n",
	       (unsigned long int)F_CPU / 1000000UL,
	       (unsigned long int)F_CPU % 1000000UL,
	       SERIAL_BPS, INIT_RATE,
	       (unsigned)INIT_RATE_H, (unsigned)INIT_RATE_L);

#endif // HOST
}


uint8_t cmode = 8;

// Serial receive interrupt handler.
#ifndef HOST
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
	
	c = proto_input(c);
	if (c) serial_send(c);
}
#endif // HOST



// Wait until the serial port is ready, then send a character to it.
void
serial_send(unsigned char c)
{
#ifndef HOST

	loop_until_bit_is_set(UCSR0A, UDRE0);
	UDR0 = c;
        //_delay_ms(11);

#else

        // When compiling a test to run on the host architecture, we use
        // putchar instead, so output goes to the screen.

	putchar(c);

#endif // HOST
}



// Send a string message to the serial port.
void
report(char *msg)
{
	register char c;
	while ((c = *msg++) != '\0') {
		// Convert \n to \r\n, which is fairly standard practice on
		// terminal comms.
		if (c == '\n') serial_send('\r');
		serial_send(c);
	}
}



// Send a string message to the serial port, when the string resides in program
// memory. Naturally, this is only available on the microcontroller. On the
// host, we fall back to the simple report() function.
#ifndef HOST
void
report_pstr(const char *msg)
{
	register unsigned char c;
	while ((c = (unsigned char) pgm_read_byte(msg++)) != '\0') {
		// Convert \n to \r\n, which is fairly standard practice on
		// terminal comms.
		if (c == '\n') serial_send('\r');
		serial_send(c);
	}
}


// Like report_pstr, but sends at most n characters.
void
report_npstr(const char *msg, uint16_t n)
{
	register unsigned char c;
	while ((c = (unsigned char) pgm_read_byte(msg++)) != '\0') {
		if (!n--) return;
		// Convert \n to \r\n, which is fairly standard practice on
		// terminal comms.
		if (c == '\n') serial_send('\r');
		serial_send(c);
	}
}


#else


// The host isn't a Von Neuman machine (we hope), so all memory is accessibile
// via the same instructions (we hope). The PSTR() macro does nothing on the
// host anyway.

#define report_pstr(x) report((unsigned char*)(x))
#define report_npstr(x) report("TODO: Write this");

#endif // HOST



// Send out a newline
void
report_nl() {
	serial_send('\r');
	serial_send('\n');
}
       

// Send a hexadecimal number to the serial port.
void
report_hex(uint32_t val, uint8_t pad)
{
	// PAD=3, shift = f00 (0xf << 8)
	// PAD=2, shift =  f0 (0xf << 4)
	// PAD=1, shift =   f (0xf << 0)
	// shift = f << ((pad - 1) * 4)
	const char * hex = PSTR("0123456789abcdef");

	uint32_t shift = (pad - 1L) << 2L;
	uint32_t bits = 0xfL << shift;
	while (bits) {
		serial_send(pgm_read_byte(&(hex[(val & bits) >> shift])));
		bits >>= 4;
		shift -= 4;
	}
}


// Send an unsigned decimal number to the serial port.
void
report_uint(uint16_t val)
{
	int8_t i;
	char buf[6];
	buf[5] = '\0';
	for (i = 4; val && i >= 0; i--, val /= 10) {
		buf[i] = '0' + (val % 10);
	}
	report(&buf[i + 1]);
}


// Send a signed decimal number to the serial port.
void
report_int(int16_t val)
{
	if (val < 0) {
		serial_send('-');
		val = -val;
	}
	report_uint(val & 0x7fff);
}


// Send a decimal number to the serial port.
void
report_bin(uint16_t val)
{
	uint16_t i;
	for (i = 0x8000; i; i >>= 1) {
		serial_send(val & i ? '1' : '0');
	}
}


static
void _report(const char *result, const char *msg)
{
	//report_pstr(PSTR("FLASHPROG: "));
	if (result != NULL) report_pstr((char *)result);
	if (msg != NULL) report_pstr((char *)msg);
	report_nl();
}


// Send an OK report to the serial port.
void
report_ok(char *msg) {
#ifdef TEST
	printf("\033[0;1;32m");
#endif // TEST

	_report(PSTR("OK\n\r"), msg);

#ifdef TEST
	printf("\033[0m");
#endif // TEST
}


// Send an error report to the serial port.
void
report_error(char *msg) {
#ifdef TEST
	printf("\033[0;1;31m");
#endif // TEST

	_report(PSTR(" ERROR "), msg);

#ifdef TEST
	printf("\033[0m");
#endif // TEST
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

// End of file.
