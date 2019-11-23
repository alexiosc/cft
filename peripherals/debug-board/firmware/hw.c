// -*- indent-c -*-

///////////////////////////////////////////////////////////////////////////////
//
// CODE TO CONTROL OUR ACTUAL HARDWARE
//
///////////////////////////////////////////////////////////////////////////////

#include <inttypes.h>
#include <string.h>

#ifdef TEST

// We use this for testing.
#include <stdio.h>

#else

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>
#include <avr/pgmspace.h>

#include "iocompat.h"
#include "i2cmaster.h"
#include "serial.h"

#endif // TEST

#include "hw.h"
#include "utils.h"
#include "i2cmaster.h"
#include "proto.h"

#ifdef HOST
#define PROGMEM
#endif // HOST


void
hw_init (void)			/* Note [6] */
{
	// Configure PC0..PC3 (the LEDs) as outputs.
	DDRB |= _BV(PB0) | _BV(PB1) | _BV(PB2) | _BV(PB3);
	setleds(0xf);

	// Configure PC0..PC3 (R#, W#, MEM#, IO#) as inputs. This isn't
	// strictly necessary (they default to inputs), but couldn't hurt.
	PORTC &= ~(_BV(PC0) | _BV(PC1) | _BV(PC2) | _BV(PC3));
	DDRC &= ~(_BV(PC0) | _BV(PC1) | _BV(PC2) | _BV(PC3));

	// Configure PD0..PD3.
	DDRD |= _BV(PDCONT) | _BV(PDRST) | _BV(PDHALT);

	// Wait a tiny bit (just in case) for things to stabilise. This
	// gives the red LED a chance to glow for a bit, which convinces
	// the user things work.
	_delay_ms(500);

	// Initialise I²C.
	cli();
	i2c_init();
	sei();

	// Initialise the CFT system device interface.
	
	// INT0: falling edge.
	EICRA = (EICRA & 0xf0) | _BV(ISC01);
	EIMSK |= _BV(INT0);
}


static uint8_t gpio_addrs[NUM_GPIOS] = {
	GPIO_ADDR_LSB,
	GPIO_ADDR_MSB,
	//GPIO_ADDR_USER
};

void
gpio_init()
{
	uint8_t i;
	uint8_t leds = 0xf;

	for(i = 0; i < NUM_GPIOS; i++) {
		int8_t addr = gpio_addrs[i];

		// Show progress.
		leds = leds ^ (1 << i);
		setleds(leds);
		report_hex(addr, 2);
		report_c(' ');
		
		// Start up with all pins as inputs (high impedance).
		i2c_start_wait(addr << 1 | I2C_WRITE);
		i2c_write(GPIO_REG_IODIR0);
		i2c_write(0xff);
		i2c_write(0xff);
		i2c_stop();

		_delay_ms(250);
	}
}


void
setleds(uint8_t pattern)
{
	PORTB = pattern;
}


void
gpio_config(uint8_t addr, uint8_t p0, uint8_t p1)
{
	uint8_t i;
	for(i = 0; i < NUM_GPIOS; i++) {
		int8_t addr = gpio_addrs[i];
		i2c_start(addr << 1 | I2C_WRITE);
		i2c_write(GPIO_REG_IODIR0);
		i2c_write(p0);
		i2c_write(p1);
		i2c_stop();
	}
}


void
gpio_hiz()
{
	uint8_t i;
	for(i = 0; i < NUM_GPIOS; i++) {
		gpio_config(gpio_addrs[i], 0xff, 0xff);
	}
}


void
gpio_output()
{
	uint8_t i;
	for(i = 0; i < NUM_GPIOS; i++) {
		gpio_config(gpio_addrs[i], 0, 0);
	}
}


void
gpio_busread()
{
	// Set the first two GPIOs to output AB (port 1) and input DB (port 0).
	uint8_t i;
	for(i = 0; i < 2; i++) {
		gpio_config(gpio_addrs[i], 0xff, 0);
	}
}


void
sethalt(uint8_t on)
{
	if (on) setbit(PORTD, PDHALT);
	else {
		// Tri-state the GPIO pins first.
		gpio_hiz();
		clearbit(PORTD, PDHALT);
	}
}


void
setreset(uint8_t on)
{
	if (on) setbit(PORTD, PDRST);
	else {
		// Tri-state the GPIO pins first.
		gpio_hiz();
		clearbit(PORTD, PDRST);
	}
}


static void
_setgpiobus(uint16_t xb, uint16_t xb0, uint8_t addr, uint8_t reg)
{
	if ((xb & 0xff) == (xb & 0xff)) {
		i2c_start_wait(addr << 1 | I2C_WRITE);
		i2c_write(reg);
		i2c_write(xb & 0xff);
		i2c_stop();
	}
}


void
setab(uint16_t ab)
{
	static uint16_t ab0 = 0;

	if (ab == ab0) return;

	// Output LSB (if we have to)
	_setgpiobus(ab, ab0, GPIO_ADDR_LSB, GPIO_REG_AB);

	// Output MSB (if we have to)
	_setgpiobus(ab >> 8, ab0 >> 8, GPIO_ADDR_MSB, GPIO_REG_AB);

	ab0 = ab;
}


void
setdb(uint16_t db)
{
	static uint16_t db0 = 0;

	if (db == db0) return;

	// Output LSB (if we have to)
	_setgpiobus(db, db0, GPIO_ADDR_LSB, GPIO_REG_DB);

	// Output MSB (if we have to)
	_setgpiobus(db >> 8, db0 >> 8, GPIO_ADDR_MSB, GPIO_REG_DB);

	db0 = db;
}


uint16_t getdb()
{
	uint16_t val;

	i2c_start_wait((GPIO_ADDR_MSB << 1) | I2C_WRITE);
	i2c_write(GPIO_REG_DB);
	i2c_rep_start((GPIO_ADDR_MSB << 1) | I2C_READ);
	val = (i2c_readNak() & 0xff) << 8;
	i2c_stop();

	i2c_start_wait((GPIO_ADDR_LSB << 1) | I2C_WRITE);
	i2c_write(GPIO_REG_DB);
	i2c_rep_start((GPIO_ADDR_LSB << 1) | I2C_READ);
	val |= (i2c_readNak()) & 0xff;
	i2c_stop();

	return val;
}


#define OP_PRINTA	   0x0 /*     3f0: -w-ef Log AC as address */
#define OP_PRINTC	   0x1 /*     3f1: -w-ef Log AC as character */
#define OP_PRINTD	   0x2 /*     3f2: -w-ef Log AC as integer */
#define OP_PRINTU	   0x3 /*     3f3: -w-ef Log AC as unsigned int */
#define OP_PRINTH	   0x4 /*     3f4: -w-ef Log AC in hex */
#define OP_PRINTB	   0x5 /*     3f6: -w-ef Log AC in binary */
#define OP_PRINTSP	   0x6 /*     3f6: -w-ef Log a space */
#define OP_PRINTNL	   0x7 /*     3f7: -w-ef Log a newline */
#define OP_DEBUGON	   0x8 /*     3f8: -w-ef Emulator enables assembly tracing */
#define OP_DEBUGOFF	   0x9 /*     3f9: -w-ef Emulator disables assembly tracing */
#define OP_DUMP  	   0xa /*     3fa: -w-ef Emulator dumps state */
#define OP_PRINTHI	   0xb /*     3fb: -w-ef HI:=AC */
#define OP_PRINTLO	   0xc /*     3fc: -w-ef Log 32-bit int as HI:AC */
#define OP_RESERVED___	   0xd
#define OP_SUCCESS         0xe /*     3fe: -w-ef Log test success */
#define OP_FAIL 	   0xf /*     3ff: -w-ef Log test failure and HALT */

static uint16_t _hword = 0;

static void
debop(uint8_t opcode, uint16_t data)
{
	switch(opcode){
	case OP_PRINTA:
		report_hex(data, 4);
		report_pstr(PSTR(" (?)"));
		break;

	case OP_PRINTC:
		serial_send(data & 0xff);
		break;

	case OP_PRINTD:
		report_int(data);
		break;

	case OP_PRINTU:
		report_uint(data);
		break;

	case OP_PRINTH:
		report_hex(data, 4);
		break;

	case OP_PRINTB:
		report_bin(data);
		break;

	case OP_PRINTSP:
		serial_send(32);
		break;

	case OP_PRINTNL:
		report_nl();
		break;

	case OP_DEBUGON:
	case OP_DEBUGOFF:
	case OP_DUMP:
		/* Only implemented on the emulator */
		break;

	case OP_PRINTHI:
		_hword = data;
		break;

	case OP_PRINTLO:
		report_hex(_hword, 4);
		report_hex(data, 4);
		break;

	case OP_SUCCESS:
		report_pstr(PSTR("[ok]"));
		break;

	case OP_FAIL:
		PORTB |= _BV(PBLED3);
		report_pstr(PSTR("[fail]"));
		if (flags & FL_HOF) {
			sethalt(1);
			report_pstr(PSTR("[halted]"));
			flags |= FL_HALT;
		}
		break;

	}
}


// INT0 handler
#ifndef HOST
ISR(INT0_vect)
{
	uint8_t opcode;
	uint16_t data;

	// Set the GPIOs for input
	gpio_input();

	// Sample AB0-AB3, DB0-DB7
	i2c_start_wait((GPIO_ADDR_LSB << 1) | I2C_WRITE);
	i2c_write(GPIO_REG_AB); 
	i2c_rep_start((GPIO_ADDR_LSB << 1) | I2C_READ);
	opcode = (i2c_readAck()) & 0xf;
	data = i2c_readNak() & 0xff;
	i2c_stop();

	// Sample DB8-DB15
	i2c_start_wait((GPIO_ADDR_MSB << 1) | I2C_WRITE);
	i2c_write(GPIO_REG_DB); 
	i2c_rep_start((GPIO_ADDR_MSB << 1) | I2C_READ);
	data |= (i2c_readNak() & 0xff) << 8;
	i2c_stop();

	// Act on the opcode/data pair.
	debop(opcode, data);

	// Data sampled. Signal the host to continue operating.
	setbit(PORTD, PDCONT);
	clearbit(PORTD, PDCONT);
}
#endif // HOST


// End of file.
