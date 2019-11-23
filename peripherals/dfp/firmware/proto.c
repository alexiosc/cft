// -*- indent-c -*-

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

#include "iocompat.h"		/* Note [1] */

#endif // TEST

#include "serial.h"
#include "utils.h"
#include "proto.h"
#include "hw.h"
#include "i2cmaster.h"

#ifdef HOST
#define PROGMEM
#endif // HOST


#ifdef DUMP_TEXT
#define BANNER1 "201 Version: " VERSION "+t\n"
#else
#define BANNER1 "201 Version: " VERSION "\n"
#endif // DUMP_TEXT

#define BANNER2 "201 BufSize: " BUFSIZE_S "\n"
#define BANNER3 "202 (c) 2012 Alexios Chouchoulas <alexios@bedroomlan.org>\n"
#define BANNER4 "202 Licensed under the GNU Public License v.2.\n"
#define BANNER5 "202 http://www.bedroomlan.org/cft\n"

#define STR_READY   "200 Ready\n"
#define STR_ADDR    "203 Address: "
#define STR_COUNT   "204 Count: "
#define STR_TEXT    "205 Output: text\n"
#define STR_BIN     "206 Output: bin\n"
#define STR_ECHON   "207 Echo: on\n"
#define STR_ECHOFF  "208 Echo: off\n"
#define STR_LEDS    "209 LEDs: "
#define STR_HOFON   "210 Halt on FAIL: on\n"
#define STR_HOFOFF  "211 Halt on FAIL: off\n"

#define STR_DUMP    "300 Dumping\n"
#define STR_DONE    "301 Done\n"
#define STR_ABORT   "302 Aborted\n"
#define STR_CKSUM   "303 Checksum: "
#define STR_VALUE   "304 Value: "
#define STR_ARUN    "305 Host running\n"
#define STR_AHALTED "306 Host halted\n"
#define STR_RESET   "307 Host reset\n"

#define STR_WRAP    "401 Warning: write will wrap around.\n"

#define STR_BADCMD  "500 Unknown command\n"
#define STR_BADVAL  "501 Bad value\n"
#define STR_COUNT8  "502 Count must be multiple of 8\n"
#define STR_RUNNING "503 Halt host first.\n"
#define STR_CHATTER "504 Bus chatter.\n"
#define STR_ALRHALT "505 Already halted.\n"
#define STR_ALRRUN  "506 Already running.\n"

#define STR_PROMPT  "> "
#define STR_PRUN    "[running]" STR_PROMPT
#define STR_PSTOP   "[halted] "

// The blocksize for block-oriented writes.
#define BLOCKSIZE ((BUFSIZE - 3) / 5)

#define DIVIDER " |"

static char buf[BUFSIZE];
static uint16_t buflen, bp;
uint16_t volatile flags = FL_BUSY | FL_ECHO;
static uint16_t addr, count = 0x80;


//uint8_t progress[5] = {0, 1, 3, 7, 15};


static void
say_done()
{
	report_pstr(PSTR(STR_DONE));
}

static char*
get_arg()
{
	register uint16_t i, j;
	// Is there any input left?
	if (bp >= buflen) {
		flags |= FL_EOL;
		return NULL;
	}
	
	// Skip blanks.
	for (i=bp ; i < buflen; i++) {
		if (buf[i] != ' ') break;
	}
	if (i >= buflen) {
		flags |= FL_ERROR;
		return NULL;
	}
	// Set the origin to the first non-blank character.
	j = i;

	// Now skip non-blanks.
	for (; i < buflen; i++) {
		if (buf[i] == ' ') break;
	}
	if (i < buflen) {
		buf[i] = '\0';
	}
	
	// Set the buf pointer past the \0.
	bp = i + 1;

#if 0
	report("Got: (");
	report(&buf[j]);
	report("), flags=");
	report_hex(flags, 2);
	report_nl();
#endif
	
	return &buf[j];
}

static uint32_t
parse_hex(char *s)
{
	register uint32_t x;
	x = 0;
	while (*s) {
		x = x << 4;
		if ((*s) >= '0' && (*s) <= '9') x |= (*s - 48L);
		else if ((*s) >= 'a' && (*s) <= 'f') x |= (*s - 87L);
		else if ((*s) >= 'A' && (*s) <= 'Z') x |= (*s - 55L);
		else {
			flags |= FL_ERROR;
			return 0;
		}
		/*
		  report("c=");
		  serial_send(*s);
		  report(", ");
		  report_hex((*s - 48), 2);
		  report(", x=");
		  report_hex(x, 6);
		  report_nl();
		*/

		s++;
	}
	return x;
}

static void
cancel()
{
	report_pstr(PSTR("\n\n" STR_ABORT));
}


static void
say_version()
{
	report_pstr(PSTR(BANNER1));
}

static void
say_bufsize()
{
	report(BANNER2);
}

static void
say_addr()
{
	report_pstr(PSTR(STR_ADDR));
	report_hex(addr, 4);
	report_nl();
}

static void
say_count()
{
	report_pstr(PSTR(STR_COUNT));
	report_hex(count, 4);
	report_nl();
}

static void
warn_wrap()
{
	if (count && ((addr + count) & 0xffff) < addr) {
		report_pstr(PSTR(STR_WRAP));
	}
}


#define NUM_SAMPLES 128

static int
_buschatter(uint8_t reg)
{
	gpio_input();
	uint8_t i;
	uint8_t a0, a1;
	uint8_t b0, b1, first = 1, ok = 1;

	i2c_start_wait((reg << 1) | I2C_WRITE);
	i2c_write(0);
	i2c_rep_start((reg << 1) | I2C_READ);
	for (i = 0; i < NUM_SAMPLES; i++){
		b0 = i2c_readAck();
		b1 = i2c_readAck();
		
		if (first) {
			a0 = b0;
			a1 = b1;
			first = 0;
			continue;
		}
		
		if (a0 != b0 || a1 != b1) {
			ok = 0;
			break;
		}
	}

	i2c_readAck();
	i2c_readNak();
	i2c_stop();

	return ok;
}


static int
_ctrlchatter()
{
	gpio_input();
	uint8_t i;
	uint8_t a;

	// Configure PCR..PCIO (R#, W#, MEM#, IO#) as inputs.
	DDRC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
	a = PORTC & (_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));

	for (i = 0; i < NUM_SAMPLES; i++)
		if ((PORTC & (_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO))) != a)
			return 0;
	return 1;
}


static int
assert_halted()
{
	// Ensure it's stopped.
	if ((flags & FL_HALT) == 0) {
		report_pstr(PSTR(STR_RUNNING));
		flags |= FL_ERROR;
		return 0;
	}
	
	// Check for bus chatter.
	if (!_buschatter(GPIO_ADDR_LSB) ||
	    !_buschatter(GPIO_ADDR_MSB) ||
	    !_ctrlchatter()) {
		report_pstr(PSTR(STR_CHATTER));
		flags |= FL_ERROR;
		return 0;
	}

	return 1;
}


#ifdef DUMP_TEXT
static void
set_text()
{
	flags &= ~FL_BIN;
	report_pstr(PSTR(STR_TEXT));
}

static void
set_bin(){
	flags |= FL_BIN;
	report_pstr(PSTR(STR_BIN));
}
#endif // DUMP_TEXT


static void
set_echo_off()
{
	flags &= ~FL_ECHO;
	report_pstr(PSTR(STR_ECHOFF));
}

static void
set_echo_on()
{
	flags |= FL_ECHO;
	report_pstr(PSTR(STR_ECHON));
}

static void
set_hof_off()
{
	flags &= ~FL_HOF;
	report_pstr(PSTR(STR_HOFOFF));
}

static void
set_hof_on()
{
	flags |= FL_HOF;
	report_pstr(PSTR(STR_HOFON));
}

static void
go_halt(){
	if (flags & FL_HALT) {
		report_pstr(PSTR(STR_ALRHALT));
		return;
	}
	flags |= FL_HALT;
	sethalt(1);
	report_pstr(PSTR(STR_AHALTED));
}

static void
go_run(){
	if ((flags & FL_HALT) == 0) {
		report_pstr(PSTR(STR_ALRRUN));
		return;
	}
	flags &= ~FL_HALT;
	// This also changes the GPIO pins to inputs.
	sethalt(0);
	report_pstr(PSTR(STR_ARUN));
}

static void
go_reset(){
	// This also changes the GPIO pins to inputs.
	gpio_hiz();
	setreset(1);
	_delay_us(250);
	sethalt(0);
	setreset(0);
	report_pstr(PSTR(STR_RESET));
}

static int32_t
get_addr()
{
	register char * s = get_arg();
	register uint32_t n;

	if (flags & FL_EOL) return -1;

	if ((flags & FL_ERROR) == 0) {
		n = parse_hex(s);
		if ((flags & FL_ERROR) == 0) return n;
	}

	flags |= FL_ERROR;
	report_pstr(PSTR(STR_BADVAL));
	return -1;
}

static void
set_addr(){
	register uint16_t a = get_addr();
	if (flags & FL_ERROR) return;
	addr = a;
	say_addr();
	warn_wrap();
}

static void
set_count(){
	register uint16_t a = get_addr();
	if (flags & (FL_ERROR|FL_EOL)) return;
	count = a;
	say_count();
	warn_wrap();
}

static uint8_t _leds = 0;
static void
set_leds(){
	register uint16_t a = get_addr();
	if (flags & (FL_ERROR|FL_EOL)) return;
	setleds(_leds = (a & 0xf));
	report_pstr(PSTR(STR_LEDS));
	report_hex(_leds, 1);
	report_nl();
}


static void
go_clear()
{
	flags |= FL_CLEAR;
}



#define SPACE_MEM 0
#define SPACE_IO 1


static void
_write_init()
{
	// Prepare the control signals. Drive the pins (signals de-asserted),
	// then set to output. This will glitch momentarily, turning on
	// Pull-Ups on all the ports (first line), but there's no adverse
	// effect.
	PORTC |= _BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO);
	DDRC |= _BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO);

	// Drive GPIO pins
	gpio_output();
}


static void
_write_done()
{
	// Tri-state the GPIO pins.
	gpio_hiz();

	// Tri-state the control signals.
	DDRC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
	PORTC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
}


static void
_perform_write(uint8_t space, uint16_t addr, uint16_t val)
{
	uint8_t sig = space == SPACE_MEM ? PCMEM : PCIO;

	// Ensure the bus is quiet. 
	if (!assert_halted()) return;

	_write_init();

	// Set buses
	setab(addr);
	setdb(val);
	
	clearbit(PORTC, sig);	// Assert MEM#/IO# (low).
	_delay_us(1);		// Wait a little bit.
	clearbit(PORTC, PCW);	// Assert W# (low).
	_delay_us(1);		// Wait a little bit.
	setbit(PORTC, PCW);	// De-assert W# (high).
	_delay_us(1);		// Wait a little bit.
	setbit(PORTC, sig);	// De-assert MEM/IO# (high).

	_write_done();
}


static void
_read_init()
{
	// Prepare the control signals. Drive the pins (signals de-asserted),
	// then set to output. This will glitch momentarily, turning on
	// Pull-Ups on all the ports (first line), but there's no adverse
	// effect.
	PORTC |= _BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO);
	DDRC |= _BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO);

	// Drive GPIO pins
	gpio_busread();
}


static void
_read_done()
{
	// Tri-state the GPIO pins.
	gpio_hiz();

	// Tri-state the control signals.
	DDRC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
	PORTC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
}


static uint16_t
_perform_read(uint8_t space, uint16_t addr)
{
	uint8_t sig = space == SPACE_MEM ? PCMEM : PCIO;

	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;
	
	_read_init();

	// Set address
	setab(addr);
	
	clearbit(PORTC, sig);	// Assert MEM#/IO# (low).
	//_delay_us(1);		// Wait a little bit.
	clearbit(PORTC, PCR);	// Assert R# (low).
	//_delay_us(1);		// Wait a little bit.

	// Read.
	uint16_t val = getdb();

	setbit(PORTC, PCR);	// De-assert R# (high).
	//_delay_us(1);		// Wait a little bit.
	setbit(PORTC, sig);	// De-assert MEM/IO# (high).

	_read_done();

	return val;
}


#ifdef DUMP_TEXT
static uint32_t
go_dump_text()
{
	uint32_t i, sum = 0;
	register uint16_t x = 0;

	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	_read_init();

	for (i = 0; i < count; i++, addr++) {
		//setleds(progress[5 * i / count]);

		if (flags & FL_BREAK) {
			cancel();
			goto dump_text_done;
		}
		if ((i & 7) == 0) {
			report_hex(addr, 4);
			report_pstr(PSTR(DIVIDER));
		}

		// Set address
		setab(addr);
	
		// Perform a read cycle
		clearbit(PORTC, PCMEM);	// Assert MEM# (low).
		clearbit(PORTC, PCR);	// Assert R# (low).
		x = getdb();
		setbit(PORTC, PCR);	// De-assert R# (high).
		setbit(PORTC, PCMEM);	// De-assert MEM# (high).

		sum += x;
		buf[i & 7] = x;
		serial_send(' ');
		report_hex(x, 4);
		if ((i & 7) == 7) {
			uint8_t j;
			report_pstr(PSTR(DIVIDER));
			serial_send(' ');
			for (j=0; j < 8; j++) {
				if((buf[j] >= 32) && (buf[j] < 127)) serial_send(buf[j]);
				else serial_send('.');
			}
			report_pstr(PSTR(DIVIDER));
			serial_send(' ');
			report_hex(sum, 8);
			report_nl();
		}
	}

	// If dumping short blocks, provide some LED feedback to the user.
	if (count < 1024) {
		//blink_led(0, 50);
	}

dump_text_done:
	_read_done();

	return sum;
}
#endif // DUMP_TEXT



static uint32_t
go_dump_bin()
{
	register uint32_t i, sum = 0, x;

	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	_read_init();

        // How simple is THIS?
	for (i = 0; i < count; i++) {
		if (flags & FL_BREAK) {
			cancel();
			goto dump_bin_done;
		}

		// Set address
		setab(addr);
	
		// Perform a read cycle
		clearbit(PORTC, PCMEM);	// Assert MEM# (low).
		clearbit(PORTC, PCR);	// Assert R# (low).
		x = getdb();
		setbit(PORTC, PCR);	// De-assert R# (high).
		setbit(PORTC, PCMEM);	// De-assert MEM# (high).

		sum += x;
		serial_send((x >> 8) & 0xff);
		serial_send(x & 0xff);
		
#if SERIAL_BPS > 57600
		// On fast links, stop for 200ms every 32k and blink
		// the LED to provide feedback.
		//if ((i & 32767) == 0) blink_led(0xffffff, 100);
#endif // SERIAL_BPS > 57600
	}

dump_bin_done:
	_read_done();

	return sum;
}


static void
go_dump() {
	uint32_t addr0 = addr, sum;

	// Sanity check
#ifdef DUMP_TEXT
	if (!(flags & FL_BIN) && (count & 0xf)) {
		report_pstr(PSTR(STR_COUNT));
		flags |= FL_ERROR;
		return;
	}
#endif // DUMP_TEXT

	say_addr();
	say_count();
	report_pstr(PSTR(STR_DUMP));
	
	// Dump, depending on mode.
	//hw_read_init();

#ifdef DUMP_TEXT
	if (flags & FL_BIN) sum = go_dump_bin();
	else sum = go_dump_text();
#else
	sum = go_dump_bin();
#endif // DUMP_TEXT
	
	//hw_read_done();
	
	if (flags & (FL_BREAK|FL_ERROR)) {
		// Restore the previous addring address.
		addr = addr0;
		return;
	}

	say_done();
	report_pstr(PSTR(STR_CKSUM));
	report_hex(sum, 8);
	report_nl();
	//say_addr();
}


static void
go_out()
{
	register uint16_t a = get_addr();
	if (flags & (FL_ERROR|FL_EOL)) return;

	register uint16_t val = get_addr();
	if (flags & (FL_ERROR|FL_EOL)) return;

	_perform_write(SPACE_IO, a, val);
	if (flags & (FL_ERROR|FL_EOL)) return;

	say_done();
}


static void
go_write()
{
	uint32_t sum = 0;
	register uint8_t i = BLOCKSIZE + 1, j = 0;

	//if (flags & FL_ERROR) return;

	// Ensure the bus is quiet. 
	if (!assert_halted()) return;

	_write_init();

	while (--i) {
		// Get a word from the command line.
		register uint16_t data = get_addr() & 0xffff;
		if (flags & (FL_EOL | FL_ERROR)) goto go_write_done;

		// Set buses
		setab(addr);
		setdb(data);
		
		clearbit(PORTC, PCMEM);	// Assert MEM#/IO# (low).
		_delay_us(1);		// Wait a little bit.
		clearbit(PORTC, PCW);	// Assert W# (low).
		_delay_us(1);		// Wait a little bit.
		setbit(PORTC, PCW);	// De-assert W# (high).
		_delay_us(1);		// Wait a little bit.
		setbit(PORTC, PCMEM);	// De-assert MEM/IO# (high).

		sum += (uint32_t)data;
		addr++;
		j = 1;
	}

go_write_done:
	_write_done();

	say_done();
	if (j) {
		report_pstr(PSTR(STR_CKSUM));
		report_hex(sum, 8);
		report_nl();
	}
	//say_addr();
}


static void
go_in()
{
	register uint16_t a = get_addr();
	if (flags & (FL_ERROR|FL_EOL)) return;

	uint16_t val = _perform_read(SPACE_IO, a);
	if (flags & (FL_ERROR|FL_EOL)) return;

	report_pstr(PSTR(STR_VALUE));
	report_hex(val, 4);
	report_nl();
}


static void
go_read()
{
	uint16_t val = _perform_read(SPACE_MEM, addr);
	if (flags & (FL_ERROR|FL_EOL)) return;

	report_pstr(PSTR(STR_VALUE));
	report_hex(val, 4);
	report_nl();

	addr++;
	//say_addr();
}


static void say_help();

#define CMD_SIZE 4
static const struct {
	char cmd[CMD_SIZE];
	void (*handler)();
	char help[50];
} cmds[] PROGMEM = {
	{"?",     say_help, "-- Show help."},
	{"help",  say_help, "-- Show help."},
	{"ver?",  say_version, "-- Show version."},
	{"buf?",  say_bufsize, "-- Show size of command buffer."},
	//{"a?",    say_addr, "-- Show current address"},
	{"c?",    say_count, "-- Show current word count."},
#ifdef DUMP_TEXT
	{"ob",    set_bin, "-- Set binary for dump."},
	{"ot",    set_text, "-- Set text for dump."},
#endif // DUMP_TEXT
	{"leds",  set_leds, "NYBBLE -- Set diagnostic LEDs (0-F)."},

	{"halt",  go_halt, "-- Halt the CFT & become bus master."},
	{"run",   go_run, "-- Resume the CFT."},
	{"rst!",  go_reset, "-- Reset the CFT."},

	{"e0",    set_echo_off, "-- Local echo off."},
	{"e1",    set_echo_on, "-- Local echo on."},

	{"hof0",  set_hof_off, "-- Halt on FAIL."},
	{"hof1",  set_hof_on, "-- Continue on FAIL."},

	{"a",     set_addr, "WORD -- Set address."},
	{"c",     set_count, "WORD -- Set count."},
	{"r",     go_read, "-- Read word from memory."},
	{"w",     go_write, "WORD ... -- Write words to memory, step address."},
	{"in",    go_in, "WORD -- Read from I/O address WORD."},
	{"out",   go_out, "ADDR WORD -- Write WORD to I/O ADDR."},
	{"d",     go_dump, "-- Dump count words starting at addr, step addr."},

	{"clr!",  go_clear, "-- Reset the DEB board."},
	{"\0", (void*)-1}
};


static void
say_help()
{
	int i;
	report_pstr(PSTR("\n201 Available commands:"));
	for(i=0; (uint16_t) pgm_read_word(&(cmds[i].handler)) != -1; i++) {
		report_pstr(PSTR("\n201  "));
		report_npstr((char *)cmds[i].cmd, CMD_SIZE);
		report_c(32);
		report_pstr((char *)cmds[i].help);
	}
	report_pstr(PSTR("\n201 Consult documentation for details.\n"));
}


void proto_init()
{
	report(BANNER1);
	report(BANNER2);
	report(BANNER3);
	report(BANNER4);
	report(BANNER5);
	buflen = 0;
	flags = (flags & FL_HALT) | FL_ECHO;
	count = 0x80;
	addr = 0;
}

void proto_loop()
{
	for(; (flags & FL_CLEAR) == 0;) {
		if (flags & FL_HALT) {
			report_pstr(PSTR(STR_PSTOP));
			report_hex(addr, 4);
			report_pstr(PSTR(STR_PROMPT));
		} else {
			report_pstr(PSTR(STR_PRUN));
		}

		// Wait for input to be complete.
		while((flags & FL_INPOK) == 0);

		/* if (flags & FL_ECHO) blink_led(0, 10); */

		flags |= FL_BUSY;
		flags &= ~(FL_ERROR | FL_EOL);
		bp = 0;

		// Process the input
		//...
		//report_pstr(PSTR("BUSY...\n"));
		buf[buflen]=0;

		if (!buflen) {
			report_pstr(PSTR(STR_READY));
			goto done;
		}

		// All valid commands are between 1 and 4 characters long.
		if (buflen < 1) goto unknown_command;

		int i;
		char *s = get_arg();

		if(flags & FL_ERROR) {
			goto error;
		}

		// All commands must start with 'fp'
		/* if(strncmp_P(s, PSTR("fp"), 2)) { */
		/* 	goto unknown_command; */
		/* } */

		for(i=0; (uint16_t) pgm_read_word(&(cmds[i].handler)) != -1; i++) {
			if(!strncmp_P(s, cmds[i].cmd, CMD_SIZE)) {
				void (*handler)() = (void *)pgm_read_word(&(cmds[i].handler));
				(*handler)();
				goto done;
			}
		}

	unknown_command:
		report_pstr(PSTR(STR_BADCMD));
		goto done;

	error:
		report_pstr(PSTR("???\n"));
		goto done;

	done:
		// Clear the input okay and busy bits.
		buflen = 0;
		flags &= ~(FL_INPOK | FL_BUSY | FL_BREAK);
	}
}


char
proto_input(char c)
{
	// Allow breaks at all times.
	if (c == 3 || c == 24) {
		// Cancel input or operation (ASCII 24, Ctrl-X or Ctrl-C)
		if (flags & FL_BUSY) {
			flags |= FL_BREAK;
		} else {
			if (flags & FL_ECHO) report_pstr(PSTR("\\\n"));
			buflen = 0;
			return 0;
		}
	}
	
	// Don't echo characters if we're busy.
	if (flags & FL_BUSY) return '\0';

	// Is the buffer full?
	if (buflen >= BUFSIZE) return flags & FL_ECHO ? '*' : '\0';

	// End of line? (ignore multiple ones and blank lines)
	if (c == 10 || c== 13) {
		flags |= FL_INPOK;
		if (flags & FL_ECHO) {
			serial_send('\r');
			return '\n';
		}
		return 0;
	} else if ((c == 8) || (c == 127)) {
		if (buflen) {
			buflen--;
			if (flags & FL_ECHO) report("\b \b");
		}
		return 0;
	}

	// Store the character.
	buf[buflen++] = c;

	if (flags & FL_ECHO) return c;
	return '\0';
}

// End of file.
