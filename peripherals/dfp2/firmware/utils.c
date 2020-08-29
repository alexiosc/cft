// -*- c -*-
#warning "TODO: Review this file for DFP2"

///////////////////////////////////////////////////////////////////////////////
//
// CODE TO HANDLE HEXADECIMAL NUMBERS
//
///////////////////////////////////////////////////////////////////////////////

#include <string.h>
#include <ctype.h>

#ifdef HOST

#include <assert.h>
#include <stdio.h>

#else 

#endif // HOST


//const char hex[16] = "0123456789ABCDEF";


/*unsigned short int
parse_hex(unsigned char *str)
{
	unsigned short int result = 0;
	for (; *str != '\0'; str++) {
		// Oversimplified domain-specific upper case conversion (NOT
		// CORRECT IN GENERAL CASE!)
		unsigned char c = *str;
		c = (c & 96) == 96 ? c & ~32 : c;
		// Get the value of the hex character.
		unsigned char val = ((unsigned char *)strchrnul((char *)hex, c) - (unsigned char *)hex);
                // If val == 15, the NUL was found (i.e *str isn't a hex char)
		if (val > 15) return 0xffff;
                // Amortise result.
		result = (result << 4) | val;
	}
	return result;
}
*/

///////////////////////////////////////////////////////////////////////////////
//
// TESTING CODE
//
///////////////////////////////////////////////////////////////////////////////

#ifdef TEST_UTILS

int main(int argc, char **argv)
{
	char buf[5];
	int i, parsed;
	
	for (i = 0; i < 4096; i++) {

		// Try zero-padded
		snprintf(buf, sizeof(buf), "%04X", i);
		parsed = parse_hex((unsigned char *)buf);
		printf("Parsing \"%s\" -> %x\n", buf, parsed);

		// Try unpadded
		snprintf(buf, sizeof(buf), "%X", i);
		parsed = parse_hex((unsigned char *)buf);
		printf("Parsing \"%s\" -> %x\n", buf, parsed);

		// Try zero-padded, lower case
		snprintf(buf, sizeof(buf), "%04x", i);
		parsed = parse_hex((unsigned char *)buf);
		printf("Parsing \"%s\" -> %x\n", buf, parsed);

		// Try unpadded, lower case
		snprintf(buf, sizeof(buf), "%x", i);
		parsed = parse_hex((unsigned char *)buf);
		printf("Parsing \"%s\" -> %x\n", buf, parsed);

		assert(i == parsed);
	}

	printf("All tests passed.\n");
	return 0;
}

#endif // TEST_UTILS

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
