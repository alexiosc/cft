// -*- indent-c -*-
#warning "TODO: Review this file for DFP2"

#ifndef __SERIAL_H__
#define __SERIAL_H__


void serial_init();

void serial_send(unsigned char c);


#ifndef SERIAL_BPS
//#define SERIAL_BPS 300UL
//#define SERIAL_BPS 600UL
//#define SERIAL_BPS 1200UL
//#define SERIAL_BPS 2400UL
//#define SERIAL_BPS 4800UL
#define SERIAL_BPS 9600UL
//#define SERIAL_BPS 19200UL
//#define SERIAL_BPS 38400UL
#endif // SERIAL_BPS


#endif // __SERIAL_H__

// End of file.
