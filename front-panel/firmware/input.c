#ifdef HOST
#endif

#include <stdlib.h>
#include <stdint.h>

#include "hwcompat.h"
#include "input.h"
#include "output.h"
#include "proto.h"


void
badval()
{
	report_pstr(PSTR(STR_BADVAL));
}


void
badsyntax()
{
	report_pstr(PSTR(STR_SYNTAX));
}


char *
get_arg()
{
	register uint16_t i, j;

	// Is there any input left?
	if (bp >= buflen) {
		flags |= FL_EOL;
		return NULL;
	}
	
	// Skip blanks.
	for (i=bp ; i < buflen; i++) {
		if (buf[i] != ' ') break;
	}
	if (i >= buflen) {
		flags |= FL_EOL;
		return NULL;
	}
	// Set the origin to the first non-blank character.
	j = i;

	// Now skip non-blanks.
	for (; i < buflen; i++) {
		if (buf[i] == ' ') break;
	}
	if (i < buflen) {
		buf[i] = '\0';
	}
	
	// Set the buf pointer past the \0.
	bp = i + 1;

#if 0
	report("Got: (");
	report(&buf[j]);
	report("), flags=");
	report_hex(flags, 2);
	report_nl();
#endif
	
	return (char*)&buf[j];
}


int32_t
get_addr()
{
	register char * s = get_arg();
	register uint32_t n;

	if (flags & FL_EOL) return -1;

	if ((flags & FL_ERROR) == 0) {
		n = parse_hex(s);
		if ((flags & FL_ERROR) == 0) return n;
	}

	flags |= FL_ERROR;
	badval();
	return -1;
}


uint32_t
parse_hex(char *s)
{
	register uint32_t x;
	x = 0;
	while (*s) {
		x = x << 4;
		if ((*s) >= '0' && (*s) <= '9') x |= (*s - 48);
		else if ((*s) >= 'a' && (*s) <= 'f') x |= (*s - 87);
		else if ((*s) >= 'A' && (*s) <= 'F') x |= (*s - 55);
		else {
			flags |= FL_ERROR;
			return 0;
		}
		s++;
	}
	return x;
}

char
parse_bool(char *s)
{
	// Minimalist parser for (0/1/on/off/true/false)
	if (s[0] == '0') return 0; // 0
	if (s[0] == 'f') return 0; // false
	if (s[0] == 'o' && s[1] == 'f') return 0; // off
	if (s[0] == 'n') return 0; // no
	return 1;
}


int8_t
optional_bool_val(uint8_t * bool)
{
	char * s = get_arg();
	if (s == NULL) return 0;

	*bool = parse_bool(s);
	if (flags & FL_ERROR) {
		badval();
		return -1;
	}
	return 1;
}


int8_t
optional_hex_val(uint16_t * word)
{
	char * s = get_arg();
	if (s == NULL) return 0;

	*word = parse_hex(s);
	if (flags & FL_ERROR) {
		badval();
		return -1;
	}
	return 1;
}


// End of file.
