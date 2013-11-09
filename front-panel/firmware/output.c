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

// Send a string message to the serial port.
void
report(const char *msg)
{
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
	register char c;
	while ((c = *msg++) != '\0') {
		if (!n--) return;
		// Convert \n to \r\n, which is fairly standard practice on
		// terminal comms.
		if (c == '\n') serial_write('\r');
		serial_write(c);
	}
}


// Send a string message to the serial port, when the string resides in program
// memory. Naturally, this is only available on the microcontroller. On the
// host, we fall back to the simple report() function.
#ifdef AVR
void
report_pstr(const char *msg)
{
	register unsigned char c;
	while ((c = (unsigned char) pgm_read_byte(msg++)) != '\0') {
		// Convert \n to \r\n, which is fairly standard practice on
		// terminal comms.
		if (c == '\n') serial_write('\r');
		serial_write(c);
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
		if (c == '\n') serial_write('\r');
		serial_write(c);
	}
}
#endif // ! AVR


// Send out a newline
void
report_nl() {
	serial_write('\r');
	serial_write('\n');
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
		serial_write((unsigned char)pgm_read_byte(&(hex[(val & bits) >> shift])));
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
		serial_write('-');
		val = -val;
	}
	report_uint(val & 0x7fff);
}


// Send a binary number to the serial port.
void
report_bin(uint16_t val)
{
	uint16_t i;
	for (i = 0x8000; i; i >>= 1) {
		serial_write(val & i ? '1' : '0');
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

#ifdef HOST
	printf("\033[0;1;32m");
#endif // HOST

	_report(PSTR("OK\n\r"), msg);

#ifdef HOST
	printf("\033[0m");
#endif // HOST
}


// Send an error report to the serial port.
void
report_error(char *msg) {
#ifdef HOST
	printf("\033[0;1;31m");
#endif // HOST

	_report(PSTR(" ERROR "), msg);

#ifdef HOST
	printf("\033[0m");
#endif // HOST
}


void
report_hex_value(const char *msg, uint32_t val, uint8_t pad)
{
	report_pstr((char *)msg);
	report_hex(val, pad);
	report_nl();
}


void
report_bool_value(const char *msg, char val)
{
	report_pstr((char *)msg);
	report_pstr(val ? PSTR("on") : PSTR("off"));
	report_nl();
}

// End of file.
