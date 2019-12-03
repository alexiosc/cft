#warning "TODO: Review this file for DFP2"
#ifdef HOST
#include <stdio.h>
#endif // HOST

#include <stdlib.h>

#ifdef AVR
#include <avr/pgmspace.h>
#endif // AVR

#include "output.h"
#include "abstract.h"
#include "hwcompat.h"
#include "proto.h"


void
style_normal()
{
	if (flags & FL_TERM) report_pstr(PSTR("\033[0m"));
}


void
style_hibit()
{
	if (flags & FL_TERM) report_pstr(PSTR("\033[4m"));
}


void
style_input()
{
	if (flags & FL_TERM) report_pstr(PSTR("\033[0;1;33m"));
}


void
style_info()
{
	if (flags & FL_TERM) report_pstr(PSTR("\033[0;1m"));
}


void
style_on()
{
	if (flags & FL_TERM) report_pstr(PSTR("\033[0;1;32m"));
}


void
style_off()
{
	if (flags & FL_TERM) report_pstr(PSTR("\033[0;1;31m"));
}


void
style_async()
{
	if (flags & FL_TERM) report_pstr(PSTR("\033[0;1;35m"));
}


void
style_error()
{
	if (flags & FL_TERM) report_pstr(PSTR("\033[0;1;31m"));
}


// Send a string message to the serial port.
void
report(const char *msg)
{
	if (flags & FL_CONS) return;
	register char c;
	while ((c = *msg++) != '\0') {
		// Convert \n to \r\n, which is fairly standard practice on
		// terminal comms.
		if (c == '\n') serial_write('\r');
		serial_write(c);
	}
}


// Send a string message to the serial port.
void
report_n(const char *msg, uint16_t n)
{
	if (flags & FL_CONS) return;
	register char c;
	while ((c = *msg++) != '\0') {
		if (!n--) return;
		// Convert \n to \r\n, which is fairly standard practice on
		// terminal comms.
		if (c == '\n') serial_write('\r');
		serial_write(c);
	}
}


// Output a program memory string. Don't suppress messages if the
// virtual console is running.

char *
report_pstr_in_console(const char *msg)
{
	register unsigned char c;
#ifdef AVR
	while ((c = (unsigned char) pgm_read_byte(msg++)) != '\0') {
#else
	while ((c = *msg++) != '\0') {
#endif
		serial_write(c);
	}
	return (char *)msg;
}


// Send a string message to the serial port, when the string resides in program
// memory. Naturally, this is only available on the microcontroller. On the
// host, we fall back to the simple report() function.
char *
report_pstr(const char *msg)
{
	if (flags & FL_CONS) return (char *)msg;
	register unsigned char c;
#ifdef AVR
	while ((c = (unsigned char) pgm_read_byte(msg++)) != '\0') {
#else
	while ((c = *msg++) != '\0') {
#endif

		// Decompress help string components and process characters.
		switch (c) {
		case 1:
			report_pstr(PSTR("-- "));
			break;
		// case 2:
		// 	report_pstr(PSTR("[ WORD ] "));
		// 	break;
		// case 3:
		// 	report_pstr(PSTR("[ BOOL ] "));
		// 	break;
		// case 4:
		// 	report_pstr(PSTR("Get/set "));
		// 	break;
		case 5:
			report_pstr(PSTR("\n201"));
			break;
		case 6:
			report_pstr(PSTR(" (default: "));
			break;
		case 7:
			report_pstr(PSTR(" ] -- Get/set "));
			break;
		case 3:
			report_pstr(PSTR(" [ BOOL ] -- Get/set "));
			break;
		case '\n':
			// Convert \n to \r\n, which is fairly standard practice on
			// terminal comms.
			serial_write('\r');
			// Fall-through to default case
		default:
			serial_write(c);
		}
	}
	return (char *)msg;
}


// Like report_pstr, but sends at most n characters.
void
report_npstr(const char *msg, uint16_t n)
{
	if (flags & FL_CONS) return;
	register unsigned char c;
#ifdef AVR
	while ((c = (unsigned char) pgm_read_byte(msg++)) != '\0') {
#else
	while ((c = *msg++) != '\0') {
#endif
		if (!n--) return;
		// Convert \n to \r\n, which is fairly standard practice on
		// terminal comms.
		if (c == '\n') serial_write('\r');
		serial_write(c);
	}
}


// Send out a newline
void
report_nl() {
	if (flags & FL_CONS) return;
	style_normal();
	serial_write('\r');
	serial_write('\n');
}
       

// Send a hexadecimal number to the serial port.
void
report_hex(uint32_t val, uint8_t pad)
{
	if (flags & FL_CONS) return;

	// PAD=3, shift = f00 (0xf << 8)
	// PAD=2, shift =  f0 (0xf << 4)
	// PAD=1, shift =   f (0xf << 0)
	// shift = f << ((pad - 1) * 4)
	const char * hex = PSTR("0123456789abcdef");

	uint32_t shift = (pad - 1L) << 2L;
	uint32_t bits = 0xfL << shift;
	while (bits) {
		serial_write((unsigned char)pgm_read_byte(&(hex[(val & bits) >> shift])));
		bits >>= 4;
		shift -= 4;
	}
}


// Send an unsigned decimal number to the serial port.
void
report_uint(uint16_t val)
{
	if (flags & FL_CONS) return;

	// Avoid bringing in division and modulo library functions by
	// using subtractions. Printing out numbers needn't be fast,
	// but it's probably faster than 16-bit software division AND
	// 16-bit software modulo on 8-bit hardware. I think the worst
	// case scenario is printing 59999 (41 subtraction loops).

	char c;
	uint8_t started = 0;

	// 10,000s
	for (c = '0'; val >= 10000; val -= 10000, c++);
	if (started || (c > '0')) started = 1, serial_write(c);
	
	// 1,000s
	for (c = '0'; val >= 1000; val -= 1000, c++);
	if (started || (c > '0')) started = 1, serial_write(c);
	
	// 100s
	for (c = '0'; val >= 100; val -= 100, c++);
	if (started || (c > '0')) started = 1, serial_write(c);
	
	// 10s
	for (c = '0'; val >= 10; val -= 10, c++);
	if (started || (c > '0')) started = 1, serial_write(c);

	// 1s
	serial_write('0' + val);
}


// Send a signed decimal number to the serial port.
void
report_int(int16_t val)
{
	if (flags & FL_CONS) return;

	if (val < 0) {
		serial_write('-');
		val = -val;
	}
	report_uint(val & 0x7fff);
}


// Send a binary number to the serial port.
/*
void
report_bin(uint16_t val)
{
	uint16_t i;
	for (i = 0x8000; i; i >>= 1) {
		serial_write(val & i ? '1' : '0');
	}
}
*/


// Send a binary number to the serial port.
void
report_bin_pad(uint16_t val, uint8_t bits)
{
	if (flags & FL_CONS) return;

	uint16_t i;
	for (i = 1 << (uint16_t)(bits - 1); i; i >>= 1) {
		serial_write(val & i ? '1' : '0');
	}
}


void _report(const char *result, const char *msg)
{
	if (flags & FL_CONS) return;

	//report_pstr(PSTR("FLASHPROG: "));
	if (result != NULL) report_pstr((char *)result);
	if (msg != NULL) report_pstr((char *)msg);
	report_nl();
}


void
report_hex_value(const char *msg, uint32_t val, uint8_t pad)
{
	if (flags & FL_CONS) return;

	report_pstr((char *)msg);
	style_info();
	report_hex(val, pad);
	style_normal();
	report_nl();
}


void
report_bool_value(const char *msg, char val)
{
	if (flags & FL_CONS) return;

	report_pstr((char *)msg);
	if (val) {
		style_on();
		report_pstr(PSTR("on"));
	} else {
		style_off();
		report_pstr(PSTR("off"));
	}
	report_nl();
}

void 
report_mismatch(const char *msg, uint16_t should_be, uint16_t was)
{
	uint32_t x;

	style_error();
	report_pstr((char *)msg);
	x = should_be & 0xffff;
	style_info();
	report_hex(x, 4);

	style_error();
	report_pstr(PSTR(STR_WAS));
	x = was & 0xffff;
	style_info();
	report_hex(x, 4);

	report_nl();
}


// End of file.
