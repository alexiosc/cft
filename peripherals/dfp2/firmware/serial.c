// -*- c -*-

///////////////////////////////////////////////////////////////////////////////
//
// LOW LEVEL SERIAL I/O FUNCTIONS
//
///////////////////////////////////////////////////////////////////////////////

#ifdef AVR

#include <inttypes.h>
#include <string.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

//#include "iocompat.h"
#include "serial.h"
#include "utils.h"
#include "proto.h"
//#include "output.h"

// If we're on a platform with only one USART, redefine some macros.
#ifndef UCSR0A
#  define UCSR0A UCSRA
#  define UCSR0B UCSRB
#  define UCSR0C UCSRC
#  define TXEN0 TXEN
#  define RXEN0 RXEN
#  define UBRR0L UBRRL
#  define UBRR0H UBRRH
#  define RXCIE0 RXCIE
#  define USART_RX_vect USART_RXC_vect
#  define FE0 FE
#  define UDR0 UDR
#  define UDRE0 UDRE
#endif // UCSR0

#endif // AVR

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
