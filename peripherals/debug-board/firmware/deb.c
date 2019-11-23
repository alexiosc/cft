/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <joerg@FreeBSD.ORG> wrote this file.  As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return.        Joerg Wunsch
 * ----------------------------------------------------------------------------
 *
 * Simple AVR demonstration.  Controls a LED that can be directly
 * connected from OC1/OC1A to GND.  The brightness of the LED is
 * controlled with the PWM.  After each period of the PWM, the PWM
 * value is either incremented or decremented, that's all.
 *
 * $Id: demo.c,v 1.9 2006/01/05 21:30:10 joerg_wunsch Exp $
 */

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw.h"
#include "utils.h"
#include "serial.h"
#include "iocompat.h"
#include "proto.h"



__attribute__ ((noreturn))
int main()
{
	hw_init();
	serial_init();
	
	report_pstr(PSTR("\n\n\nCFT DEB Board Booting.\n"));

	// Handle software resets.
	for(;;) {
		setleds(0xf);
		_delay_ms(250);
		report_pstr(PSTR("GPIO diag: "));
		gpio_init();
		report("Ready.\n");

		setleds(0);
		_delay_ms(250);

		proto_init();
		// Loop.
		proto_loop();
	}
}
