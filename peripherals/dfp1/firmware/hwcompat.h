#ifndef __HWCOMPAT_H__
#define __HWCOMPAT_H__


#define bool_t uint8_t


#ifdef AVR

#include <avr/pgmspace.h>
#include <util/delay.h>

#if (F_CPU != 14745600)
#  error "The only supported clock speed is 14.7456 MHz"
#endif

#define CLKBASE 14400 // << 10

// At ~ 14 MHz and 2 cycles per NOP, this is a 135 ns delay.
#define short_delay() asm("nop");

// If we're on a platform with only one USART, redefine some macros.
#ifndef UCSR0A
#define UCSR0A UCSRA
#define UCSR0B UCSRB
#define UCSR0C UCSRC
#define TXEN0 TXEN
#define RXEN0 RXEN
#define UBRR0L UBRRL
#define UBRR0H UBRRH
#define RXCIE0 RXCIE
#define USART_RX_vect USART_RXC_vect
#define FE0 FE
#define UDR0 UDR
#define UDRE0 UDRE
#endif // UCSR0

#define setup() short_delay()
#define hold() short_delay()

#else



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
#define short_delay() usleep(100);

#define setup() 
#define hold() 

#endif // ! AVR

#endif // __HWCOMPAT_H__

// End of file.
