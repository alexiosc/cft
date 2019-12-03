// -*- indent-c -*-

///////////////////////////////////////////////////////////////////////////////
//
// LOW LEVEL SERIAL I/O FUNCTIONS
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __SERIAL_H__
#define __SERIAL_H__


void serial_init();

void serial_send(unsigned char c);


#ifndef SERIAL_BPS
#  define SERIAL_BPS 9600UL
#endif // SERIAL_BPS


#endif // __SERIAL_H__

// End of file.
