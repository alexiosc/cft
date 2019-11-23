// -*- indent-c -*-

#ifndef __UTILS_H__
#define __UTILS_H__


// The PSTR macro defines literal strings to be stored in program
// memory. On the host computer, the von Neumann distinction between
// program and data memory doesn't exist (or at least program segments
// are read in the same way as in the same way as data segments), so we
// can access them the normal way. This is too long a paragraph to say
// such a simple thing. :)

#ifdef HOST
#define PSTR(x) x
#endif // HOST


#define bitset(port, bit) ((port) &= ~_BV(bit))
#define clearbit(port, bit) ((port) &= ~_BV(bit))
#define setbit(port, bit) ((port) |= _BV(bit))
#define bit(port, bit, yesno) \
	((port) = (yesno)? (port) | _BV(bit) : (port) & ~_BV(bit))


extern const char hex[16];


//inline unsigned short int parse_hex(unsigned char *str);


#endif // _UTILS_H__

// End of file.
