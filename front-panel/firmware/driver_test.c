// -*- indent-c -*-

#ifdef HOST

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <stdint.h>
#include <assert.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <termios.h>

#include "bus.h"


// This 'driver' is only available on the host.


#include "proto.h"
#include "abstract.h"
#include "utils.h"
#include "panel.h"


static uint16_t _or;
static uint16_t _ab;
static uint16_t _sr = 0xbeef, _pc = 0xdead;
static uint16_t * _mem;
static int _pd;
static char _pipebuf[4096];
static char *_pp = _pipebuf;

#define IMAGE_NAME "../../forth/forth-rom.bin"
#define FIFO "cmd.fifo"


static struct termios _orig_termios;


// Lazily borrowed from:
// http://www.cs.uleth.ca/~holzmann/C/system/ttyraw.c 
// (even though I've coded this a dozen times in the past.)

static void
term_init()
{
	struct termios raw;

	raw = _orig_termios;  /* copy original and then modify below */

	/* input modes - clear indicated ones giving: no break, no CR to NL, 
	   no parity check, no strip char, no start/stop output (sic) control */
	raw.c_iflag &= ~(BRKINT | ICRNL | INPCK | ISTRIP | IXON);
	
	/* output modes - clear giving: no post processing such as NL to CR+NL */
	raw.c_oflag |= OPOST | ONLCR;
	
	/* control modes - set 8 bit chars */
	raw.c_cflag |= (CS8);
	
	/* local modes - clear giving: echoing off, canonical off (no erase with 
	   backspace, ^U,...),  no extended functions, no signal chars (^Z,^C) */
	raw.c_lflag &= ~(ECHO | ICANON | IEXTEN | ISIG);
	
	/* control chars - set return condition: min number of bytes and timer */
	raw.c_cc[VMIN] = 0;
	raw.c_cc[VTIME] = 0;
	
	/* put terminal in raw mode after flushing */
	if (tcsetattr(0, TCSAFLUSH, &raw) < 0) {
		perror("can't set raw mode: ");
		exit(1);
	}
}


static void
term_done()
{
	// Flush and reset
	//if (tcsetattr(0, TCSAFLUSH, &_orig_termios) < 0) return -1;
	if (system("stty sane"));
}


void
hw_init()
{
	struct stat st;
	FILE * fp;
	int i;
	
	_mem = calloc(65536, sizeof(uint16_t));

	// Initialise the terminal (and restore its settings on exit).
	term_init();
	atexit(term_done);
	
	// If we can open a memory image, do so. Load up to 32k at the
	// top of memory. The rest is uninitialised RAM (noise).

	memset(_mem, 0, sizeof(65536));
	for (i = 0; i < 65536; i++) _mem[i] = rand() & 0xffff;
	//for (i = 0; i < 65536; i++) _mem[i] = (i * 1024) & 0xffff;

	if (stat(IMAGE_NAME, &st) == 0) {
		int s = max(32768, st.st_size);
		if ((fp = fopen("../../forth/forth-rom.bin", "r")) != NULL) {
			printf("*** Simulating ROM at address %04x-FFFF\n", 65536 - s);
			if (fread(&_mem[65536 - s], s, 1, fp) != 1) {
				// We don't really care. Do nothing.
			}
		}
	}

	// Create and open the command pipe.
	if (stat(FIFO, &st) != 0) {
		if (mkfifo(FIFO, 0600) != 0) {
			perror("mkfifo()");
			exit(1);
		}
	}
	
	if ((_pd = open(FIFO, O_RDWR | O_NONBLOCK)) < 0) {
		perror("open()");
		exit(1);
	}

	// Pretend we don't have a processor if env var NOPROC is defined.
	if (getenv("NOPROC") == NULL) {
		flags |= FL_PROC;
	} else {
		printf("*** NOPROC environment variable seen, simulating standalone mode.\n");
	}
}


void
hw_tick()
{
	printf("*** hw_tick\n");
}


void
hw_done()
{
	printf("*** hw_done\n");
}


static void
cmdpipe_input(char c)
{
	static uint16_t sr0 = 0;
	static uint8_t rom0 = 255;

	if (c == 10) {
		int i;
		*_pp = '\0';
		_pp = _pipebuf;
		if (sscanf(_pipebuf, "lock %d", &i) == 1) {
			panel_lock(i);
			return;
		} if (sscanf(_pipebuf, "sr %x", &i) == 1) {
			if (sr0 != i) panel_sr(sr0 = i);
			return;
		} else if (!strcmp(_pipebuf, "reset")) {
			panel_reset();
			return;
		} else if (!strcmp(_pipebuf, "stop")) {
			panel_stop();
			return;
		} else if (!strcmp(_pipebuf, "run")) {
			panel_run();
			return;
		} else if (!strcmp(_pipebuf, "start")) {
			panel_start();
			return;
		} else if (!strcmp(_pipebuf, "step")) {
			panel_step();
			return;
		} else if (!strcmp(_pipebuf, "ustep")) {
			panel_ustep();
			return;
		} else if (sscanf(_pipebuf, "spd %d", &i) == 1) {
			panel_spd(i);
			return;
		} else if (!strcmp(_pipebuf, "ldir")) {
			panel_ldir();
			return;
		} else if (!strcmp(_pipebuf, "ldaddr")) {
			panel_ldaddr();
			return;
		} else if (!strcmp(_pipebuf, "ldac")) {
			panel_ldac();
			return;
		} else if (!strcmp(_pipebuf, "wmem")) {
			panel_wmem(0, _pc, _sr);
			return;
		} else if (!strcmp(_pipebuf, "wmem+")) {
			panel_wmem(1, _pc, _sr);
			return;
		} else if (!strcmp(_pipebuf, "rmem")) {
			panel_rmem(0, _pc);
			return;
		} else if (!strcmp(_pipebuf, "rmem+")) {
			panel_rmem(1, _pc);
			return;
		} else if (!strcmp(_pipebuf, "wio")) {
			panel_wio(0, _pc, _sr);
			return;
		} else if (!strcmp(_pipebuf, "wio+")) {
			panel_wio(1, _pc, _sr);
			return;
		} else if (!strcmp(_pipebuf, "rio")) {
			panel_rio(0, _pc);
			return;
		} else if (!strcmp(_pipebuf, "rio+")) {
			panel_rio(1, _pc);
			return;
		} else if (sscanf(_pipebuf, "rom %d", &i) == 1) {
			if (rom0 != i) panel_rom(rom0 = i);
			return;
		} else if (!strcmp(_pipebuf, "ifr1")) {
			panel_ifr1();
			return;
		} else if (!strcmp(_pipebuf, "ifr6")) {
			panel_ifr6();
			return;
		} 

		// Simulate bus-side messages

		else if (sscanf(_pipebuf, "printa %x", &i) == 1) {
			buscmd_print('A', i);
			return;
		} else if (sscanf(_pipebuf, "printb %x", &i) == 1) {
			buscmd_print('B', i);
			return;
		} else if (sscanf(_pipebuf, "printh %x", &i) == 1) {
			buscmd_print('H', i);
			return;
		} else if (sscanf(_pipebuf, "printc %x", &i) == 1) {
			buscmd_print('C', i);
			return;
		} else if (sscanf(_pipebuf, "printd %x", &i) == 1) {
			buscmd_print('D', i);
			return;
		} else if (sscanf(_pipebuf, "printu %x", &i) == 1) {
			buscmd_print('U', i);
			return;
		} else if (sscanf(_pipebuf, "printhi %x", &i) == 1) {
			buscmd_printhi(i);
			return;
		} else if (sscanf(_pipebuf, "printlo %x", &i) == 1) {
			buscmd_print('L', i);
			return;
		} else if (!strcmp(_pipebuf, "printnl")) {
			buscmd_print('C', 10);
			return;
		} else if (!strcmp(_pipebuf, "printsp")) {
			buscmd_print('C', 32);
			return;
		} else if (!strcmp(_pipebuf, "success")) {
			buscmd_success();
			return;
		} else if (!strcmp(_pipebuf, "halt")) {
			buscmd_halt();
			return;
		} else if (!strcmp(_pipebuf, "sentinel")) {
			buscmd_sentinel();
			return;
		} else if (!strcmp(_pipebuf, "fail")) {
			buscmd_fail();
			return;
		}

		printf("*** \n*** Unhandled command: %d\n", c);
		fflush(stdin);
		flags |= FL_ASYNC;
	}

	*_pp++ = c;
}


// Console I/O

unsigned char
query_char(int timeout_usec)
{
	fd_set rfds;
	struct timeval tv;
	int retval;
	
	FD_ZERO(&rfds);
	FD_SET(0, &rfds);
	FD_SET(_pd, &rfds);
	tv.tv_sec = 0;
	tv.tv_usec = 20000;

	retval = select(_pd + 1, &rfds, NULL, NULL, &tv);
	if (retval == -1) {
		perror("select()");
		exit(1);
	} else if (retval) {
		unsigned char c;
		if (FD_ISSET(_pd, &rfds)) {
			c = 0;
			while (read(_pd, &c, 1) > 0) cmdpipe_input(c);
			if (errno && errno != EWOULDBLOCK) {
				perror("fifo read");
				exit(1);
			}
		}
		if (FD_ISSET(0, &rfds)) {
			if (read(0, &c, 1) != 1) {
				printf("*** eof. Bailing out.\n");
				exit(0);
			}
			return c;
		}
	}
	return 0;
}

unsigned char
read_next_char()
{
	unsigned char c;
	while((c = query_char(500 * 1000 * 1000)) == 0);
	return c;
}


void
serial_write(unsigned char c)
{
	if(write(2, &c, 1));	// Just to silence spurious warning.
}


// Input

void
deb_sample(bool_t quick)
{
	// Does nothing here.
}


uint16_t
get_ac()
{
	return 0;
}


uint16_t
get_pc()
{
	return _pc;
}


uint8_t
get_misc()
{
	return 0x42;
}


uint32_t get_uvec()
{
	return 0xffffffff;
}

uint16_t
get_ir()
{
	return 0x70d0;
}


uint16_t
get_ab()
{
	return 0;
}


uint16_t
get_db()
{
	return _mem[_ab];
}


uint16_t
get_dsr()
{
	return 0;
}


/* This is only used for the test driver. */
void
set_sr(uint16_t sr)
{
	_sr = sr;
}


inline uint16_t
get_sr()
{
	return _sr;
}


uint32_t
get_sw()
{
	return 0;
}


void
virtual_panel_sample(bool_t quick)
{
	//int i;
	//for (i = 0; i < 5; i++) bus_state.vp.w[i] = rand() & 0xffff;
	//printf("*** Virtual Panel sample\n");
}


uint32_t
read_misc()
{
	return 0;
}


uint16_t
read_ir()
{
	return 0;
}


uint16_t
read_pc()
{
	return 0;
}


uint16_t
read_ac()
{
	return 0;
}


// Output

void
write_leds(const uint8_t x)
{
	register uint8_t i;
	assert(x >= 0 && x <= 15);
	printf("*** Diagnostic LEDs: ");
	for (i = 8; i; i >>= 1) {
		if (x & i) printf("(*)");
		else printf("( )");
	}
	printf("\n");
}


inline uint16_t
get_or()
{
	return _or;
}

void
set_or(const uint16_t or)
{
	_or = or;
}


void
drive_ibus()
{
}


void
write_ibus(const uint16_t ibus)
{
}


void
tristate_ibus()
{
}



void
drive_ab()
{
	//printf("*** AB driving\n");
}


void
write_ab(const uint16_t abus)
{
	//printf("*** AB <- %04x\n", abus);
	_ab = abus;
}


void
tristate_ab()
{
	//printf("*** AB at high impedance\n");
}



void
drive_db()
{
}


void
write_db(const uint16_t dbus)
{
}


void
tristate_db()
{
}


void
addr_inc()
{
	_pc++;
}



///////////////////////////////////////////////////////////////////////////////
//
// STROBES AND MISCELLANEOUS SIGNALS
//
///////////////////////////////////////////////////////////////////////////////


void
wait_for_halt()
{
}



void
clk_stop()
{
}


void
clk_start()
{
}


void
set_clkfreq(uint8_t prescaler, uint16_t div)
{
}


void
clk_fast()
{
}


void
clk_slow()
{
}


void
clk_creep()
{
}


void
set_stopping()
{
}


void
set_steprun(bool_t x)
{
	//printf("*** STEPRUN: %d\n", x);
}


void
perform_step()
{
	//printf("*** STEP INITIATED\n");
}


void
perform_ustep()
{
	//printf("*** µSTEP INITIATED\n");
}


void
set_buspu(uint8_t x)
{
}


void
set_safe(bool_t x)
{
}


void
set_irq1(bool_t x)
{
}


void
set_irq6(bool_t x)
{
}


void
set_fpram(bool_t x)
{
}


void
set_fprunstop(bool_t x)
{
}


void
perform_reset()
{
}


void
strobe_wpc()
{
}


void
strobe_wac()
{
}


void
strobe_wir()
{
}


void
strobe_w()
{
}


void
set_r(bool_t x)
{
}


void
set_mem(bool_t x)
{
}


void
set_io(bool_t x)
{
}


void
strobe_war()
{
}


void
strobe_rpc()
{
}


void
strobe_incpc()
{
}


void
set_halt(bool_t x)
{
}


void
set_runstop(bool_t x)
{
}


void
queue_char(uint8_t c)
{
	// Do nothing, there's no CFT on the other side.
}


uint16_t
maybe_dequeue_char()
{
	// Do nothing, there's no CFT on the other side.
	return 0;
}

#endif // HOST


// End of file.
