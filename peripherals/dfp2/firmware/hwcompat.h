// -*- indent-c -*-

///////////////////////////////////////////////////////////////////////////////
//
// MULTI-PLATFORM HARDWARE COMPATIBILITY DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __HWCOMPAT_H__
#define __HWCOMPAT_H__

#define bool_t uint8_t

///////////////////////////////////////////////////////////////////////////////
//
// SWITCHES
//
///////////////////////////////////////////////////////////////////////////////

// The CFT has 30 switches. Some are double throw. Each front panel module
// allows for 8 double-throw switches and the DFP scans 64 switch bits. The
// switches are scanned using Port F of the MCU. Four bits are decoded to
// address switch pairs in modules A and C and B and D.
//
// SWA    SWD0-SWD1   SWD2-SWD3
//  0       SW A0        SW B0
//  1       SW A1	 SW B1
//  2       SW A2	 SW B2
//  3       SW A3	 SW B3
//  4       SW A4	 SW B4
//  5       SW A5	 SW B5
//  6       SW A6	 SW B6
//  7       SW A7	 SW B7
//  8       SW C0        SW D0
//  9       SW C1        SW D1
// 10       SW C2        SW D2
// 11       SW C3        SW D3
// 12       SW C4        SW D4
// 13       SW C5        SW D5
// 14       SW C6        SW D6
// 15       SW C7        SW D7
//
// Switches:
//   Module A:
//     * Panel lock
//     * START/RESET
//     * STOP/RUN
//     * STEP/µSTEP
//     * SPEED: Creep
//     * SPEED: Fast
//     * LTS
//     * MFD: SP
//     * MFD: OR
//
//   Module B:
//     * SR (8 switches)
//
//   Module C
//     * SR (8 switches)
//
//   Module D
//     * SR->PC/SR->IR
//     * SR->AC/TEST
//     * NEXT
//     * MEM W
//     * MEM R
//     * IO W
//     * IO R
//     * ROM
//     * A/B


#ifdef AVR

// COMPILING FOR THE ATMEGA

#include <avr/pgmspace.h>
#include <util/delay.h>

#if (F_CPU != 14745600)
#  warning "The only supported clock speed is 14.7456 MHz (TODO: check why)"
#endif

// At ~16 MHz and 2 cycles per NOP, this is a 125ns delay.
#define short_delay() asm("nop");

// Not all devices support an 8 second watchdog timeout. All devices support a 2s one.
#ifdef WDTO_8S
#  define WATCHDOG_TIMEOUT WDTO_8S
#else
#  define WATCHDOG_TIMEOUT WDTO_2S
#endif

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
#define short_delay() usleep(100);

#define setup() 
#define hold() 

#endif // ! AVR

#endif // __HWCOMPAT_H__

// End of file.
