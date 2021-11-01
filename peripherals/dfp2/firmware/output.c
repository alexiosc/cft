// -*- c -*-

///////////////////////////////////////////////////////////////////////////////
//
// HUMAN-ORIENTED OUTPUT FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////

#ifdef HOST
#include <stdio.h>
#endif // HOST

#include <stdlib.h>

#ifdef AVR
#include <avr/pgmspace.h>
#endif // AVR

#include "output.h"
#include "driver.h"
#include "hwcompat.h"
#include "proto.h"
#include "strings.h"


void
style_normal()
{
	if (uistate.is_term) report_pstr(PSTR("\033[0m"));
}


void
style_hibit()
{
	if (uistate.is_term) report_pstr(PSTR("\033[4m"));
}


void
style_input()
{
	if (uistate.is_term) report_pstr(PSTR("\033[0;1;33m"));
}


void
style_info()
{
	if (uistate.is_term) report_pstr(PSTR("\033[0;1m"));
}


void
style_on()
{
	if (uistate.is_term) report_pstr(PSTR("\033[0;1;32m"));
}


void
style_off()
{
	if (uistate.is_term) report_pstr(PSTR("\033[0;1;31m"));
}


void
style_async()
{
	if (uistate.is_term) report_pstr(PSTR("\033[0;1;35m"));
}


void
style_error()
{
	if (uistate.is_term) report_pstr(PSTR("\033[0;1;31m"));
}


// Send a string message to the serial port. The message must be in RAM, not
// Flash (program space). Special characters are not interpreted.
void
report(const char *msg)
{
	if (uistate.in_console) return;
	register char c;
	while ((c = *msg++) != '\0') {
		// Convert \n to \r\n, which is fairly standard practice on
		// terminal comms.
		if (c == '\n') serial_write('\r');
		serial_write(c);
	}
}


// Send a string message to the serial port. Print up to n characters. The
// buffer must be in RAM, not Flash (program space). Special characters are not
// interpreted.
void
report_n(const char *msg, uint16_t n)
{
	if (uistate.in_console) return;
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
// virtual console is running. This prints out even when the console
// is active. Special escape codes are not honoured.
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


// Send to the serial port a string message residing in program memory. (for
// AVR only; on non-Harvard platforms, strings don't need special treatment)

// WARNING: this function recurses. Keep it reentrant!

char *
report_pstr(const char *msg)
{
	if (uistate.in_console) return (char *)msg;
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
			report_pstr(PSTR("\n201 "));
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
                case 16:
			report_pstr(PSTR("CTL"));
			break;
                case 17:
			report_pstr(PSTR("REG"));
			break;
                case 18:
			report_pstr(PSTR("ALU"));
			break;
                case 19:
			report_pstr(PSTR("BUS"));
			break;
                case 20:
			report_pstr(PSTR(": "));
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


// Like report_pstr(), but sends at most n characters.
void
report_npstr(const char *msg, uint16_t n)
{
	if (uistate.in_console) return;
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
	if (uistate.in_console) return;
	style_normal();
	serial_write('\r');
	serial_write('\n');
}


// Send a hexadecimal number to the serial port.
void
report_hex(uint32_t val, uint8_t pad)
{
	if (uistate.in_console) return;
        
	// PAD=5, shift = f0000 (0xf << 16)
	// PAD=4, shift =  f000 (0xf << 12)
	// PAD=3, shift =   f00 (0xf << 8)
	// PAD=2, shift =    f0 (0xf << 4)
	// PAD=1, shift =     f (0xf << 0)
	// shift = f << ((pad - 1) * 4)
	const char * hex = PSTR("0123456789abcdef");
        
	uint32_t shift = (pad - 1L) << 2L;
	uint32_t bits = 0xfL << shift;
	while (bits) {
		serial_write((unsigned char)pgm_read_byte(&(hex[(val & bits) >> shift])));
		bits >>= 4;
		shift -= 4;
                if (bits == 0xf000L) serial_write(':');
	}
}


// Send an unsigned decimal number to the serial port.
void
report_uint(uint16_t val)
{
	if (uistate.in_console) return;

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
	if (uistate.in_console) return;

	if (val < 0) {
		serial_write('-');
		val = -val;
	}
	report_uint(val & 0x7fff);
}


// Send a binary number to the serial port.
void
report_bin_pad(uint16_t val, uint8_t bits)
{
	if (uistate.in_console) return;

	uint16_t i;
	for (i = 1 << (uint16_t)(bits - 1); i; i >>= 1) {
		serial_write(val & i ? '1' : '0');
	}
}


void
_report(const char *result, const char *msg)
{
	if (uistate.in_console) return;
	
	if (result != NULL) report_pstr((char *)result);
	if (msg != NULL) report_pstr((char *)msg);
	report_nl();
}


void
report_hex_value(const char *msg, uint32_t val, uint8_t pad)
{
	if (uistate.in_console) return;

	report_pstr((char *)msg);
	style_info();
	report_hex(val, pad);
	style_normal();
	report_nl();
}


void
report_bool_value(const char *msg, char val)
{
	if (uistate.in_console) return;

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


#define case_err(name)                                  \
        case ERR_ ## name:                              \
                report_pstr(PSTR(STR_ERR_ ## name));    \
                break;

void
report_errno(errno_t err)
{
        style_error();

        // NOTE: not syntax error, look at case_err macro above
        switch (err) {
        case_err(SUCCESS)
        case_err(NMASTER)
        case_err(NHALTED)
        case_err(HALTED)
        case_err(TIMEOUT)
        case_err(RBFULL)
        case_err(BADVAL)
        default:
                report_pstr(PSTR(STR_UNKERR));
        }
        report_nl();
}


// Print out a mismatch message in the following format: should_be +
// ", was " + was. End with a newline.
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
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
