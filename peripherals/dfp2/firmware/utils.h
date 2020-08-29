// -*- c -*-

///////////////////////////////////////////////////////////////////////////////
//
// UTILITIES
//
///////////////////////////////////////////////////////////////////////////////

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
#define wdt_reset() ;
#endif // HOST

// Convert a pin (bit) number to byte.

#ifndef BV
#define BV(x) (1<<(x))
#endif // BIT

// Bit operations

#define clearbit(port, bit) ((port) &= ~(1<<(bit)))
#define togglebit(port, bit) ((port) ^= (1<<(bit)))
#define setbit(port, bit)   ((port) |=  (1<<(bit)))

#define bit(port, bit, yesno) \
	((port) = (yesno)? (port) | _BV(bit) : (port) & ~_BV(bit))

#define clearflags(var, flag) ((var) &= ~(flag))
#define setflags(var, flag) ((var) |= (flag))

/* #define flags(var, flag, yesno) \ */
/* 	((var) = (yesno)? (var) | (flag) : (var) & ~(flag)) */

#define max(a,b) (((a) > (b)) ? (a) : (b))
#define min(a,b) (((a) < (b)) ? (a) : (b))
#define limit(x,l,h) (min(h,max((x),(l))))

// Hex digits used for printing out numbers.
extern const char hex[16];

//inline unsigned short int parse_hex(unsigned char *str);

#endif // _UTILS_H__

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
