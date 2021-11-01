// -*- c -*-

///////////////////////////////////////////////////////////////////////////////
//
// MULTI-PLATFORM HARDWARE COMPATIBILITY DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __HWCOMPAT_H__
#define __HWCOMPAT_H__

#define bool_t uint8_t

#ifdef AVR

// COMPILING FOR THE ATMEGA

#include <avr/pgmspace.h>
#include <util/delay.h>

#if (F_CPU != 16000000)
#  warning "The only supported clock speed is 16 MHz"
#endif

// At ~16 MHz and 2 cycles per NOP, this is a 125ns delay.
#define short_delay() asm("nop");

// Not all devices support an 8 second watchdog timeout. All devices support a 2s one.
// #ifdef WDTO_8S
// #  define WATCHDOG_TIMEOUT WDTO_8S
// #else
// #  define WATCHDOG_TIMEOUT WDTO_2S
// #endif
#define WATCHDOG_TIMEOUT WDTO_2S

// If we're on a platform with only one USART, redefine some macros.
#ifndef SERIAL_PORT
#error "SERIAL_PORT is undefined"
#endif

#ifndef UCSR0A
#  define UCSRxA          UCSRA
#  define UCSRxB          UCSRB
#  define UCSRxC          UCSRC
#  define RXCIEx          RXCIE
#  define TXENx           TXEN
#  define RXENx           RXEN
#  define UBRRxL          UBRRL
#  define UBRRxH          UBRRH
#  define FEx             FE
#  define UDRx            UDR
#  define UDREx           UDRE
#  define RXCx            RXC
#else
#  if SERIAL_PORT == 0
#    define UCSRxA          UCSR0A
#    define UCSRxB          UCSR0B
#    define UCSRxC          UCSR0C
#    define RXCIEx          RXCIE0
#    define TXENx           TXEN0
#    define RXENx           RXEN0
#    define UBRRxL          UBRR0L
#    define UBRRxH          UBRR0H
#    define FEx             FE0
#    define UDRx            UDR0
#    define UDREx           UDRE0
#    define RXCx            RXC0
#    ifndef ___warned_port0
#      define ___warned_port0
#      warning "PORT 0 is unreliable."
#    endif
#  endif
#  if SERIAL_PORT == 1
#    define UCSRxA          UCSR1A
#    define UCSRxB          UCSR1B
#    define UCSRxC          UCSR1C
#    define RXCIEx          RXCIE1
#    define TXENx           TXEN1
#    define RXENx           RXEN1
#    define UBRRxL          UBRR1L
#    define UBRRxH          UBRR1H
#    define FEx             FE1
#    define UDRx            UDR1
#    define UDREx           UDRE1
#    define RXCx            RXC1
#  endif
#  if SERIAL_PORT == 3
#    define UCSRxA          UCSR3A
#    define UCSRxB          UCSR3B
#    define UCSRxC          UCSR3C
#    define RXCIEx          RXCIE3
#    define TXENx           TXEN3
#    define RXENx           RXEN3
#    define UBRRxL          UBRR3L
#    define UBRRxH          UBRR3H
#    define FEx             FE3
#    define UDRx            UDR3
#    define UDREx           UDRE3
#    define RXCx            RXC3
#  endif
#endif // UCSR0

#define setup() short_delay()
#define hold() short_delay()


#else

// COMPILING FOR A HOST PC, ETC.

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

#define PGM_P char *
#define PROGMEM
#define PSTR(x) x
#define pgm_read_byte(p) (*(p))
#define pgm_read_word(p) (*(p))
#define strncmp_P strncmp
#define _delay_us(us) usleep(us)
#define _delay_ms(us) usleep((us) * 1000)
#define short_delay() usleep(100)
#define strlen_P(s) strlen(s)
#define strnlen_P(s, n) strnlen(s, n)

#define setup() 
#define hold()

#ifndef wdt_reset
#  define wdt_reset()
#endif

#endif // ! AVR

#endif // __HWCOMPAT_H__

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
