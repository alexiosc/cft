#include "hwcompat.h"
#include "input.h"
#include "output.h"
#include "proto.h"
#include "abstract.h"
#include "bus.h"


#define NUM_SAMPLES 128


bus_state_t bus_state;


#define setup() short_delay();
#define hold() short_delay();


uint8_t
_buschatter()
{
#ifdef HOST
	//printf("*** Host mode, bus chatter test always succeeds.\n");
	return 0;
#endif // HOST

	// Account for bus hold AND pull-ups using an initial sample.
	uint16_t ab = read_ab();
	uint16_t db = read_db();
	uint8_t i;
	for (i = 0; i < NUM_SAMPLES; i++) {
		if (read_ab() != ab) return 1;
		if (read_db() != db) return 1;
		short_delay();
	}
	return 0;
}


uint8_t
assert_halted()
{
	// Ensure it's stopped.
	if ((flags & FL_HALT) == 0) {
		report_pstr(PSTR(STR_RUNNING));
		flags |= FL_ERROR;
		return 0;
	}
	
	// Check for bus chatter.
	if (_buschatter()) {
		report_pstr(PSTR(STR_CHATTER));
		flags |= FL_ERROR;
		return 0;
	}

	return 1;
}


uint16_t
_perform_read(uint8_t space, uint16_t addr)
{
	uint16_t val;

	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	// Perform a cycle
	write_ab(addr);
	drive_ab();
	space == SPACE_MEM ? set_mem(1) : set_io(1);
	set_r(1);

	// Setup delay
	setup();

	// Sample.
	val = read_db();

	hold();

	// Release the bus
	set_r(0);
	space == SPACE_MEM ? set_mem(0) : set_io(0);
	tristate_ab();

	return val;
}


uint8_t
_perform_write(uint8_t space, uint16_t addr, uint16_t word)
{
	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	// Perform a cycle
	write_ab(addr);
	write_db(word);
	drive_ab();
	space == SPACE_MEM ? set_mem(1) : set_io(1);
	drive_db();

	// Setup delay
	setup();

	// Strobe.
	strobe_w(1);

	hold();

	// Release the bus
	space == SPACE_MEM ? set_mem(0) : set_io(0);
	tristate_db();
	tristate_ab();

	return 1;
}


uint16_t
_perform_block_read(uint16_t base, int16_t n, uint16_t * buf)
{
	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	while (n--) {
		// Perform a cycle
		write_ab(base++);
		drive_ab();
		set_mem(1);
		set_r(1);

		setup();

		// Sample.
		*buf++ = read_db();

		// Release the bus
		set_r(0);
		set_mem(0);

		// Hold delay
		hold();

		tristate_ab();

		// Wait a little
		short_delay();
	}

	return 1;
}


uint8_t
set_reg(uint8_t reg, uint16_t value)
{
	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	// Stop the clock (just in case).
	set_clk(0);
	
	write_ibus(value);
	drive_ibus();
	setup();
	switch (reg) {
	case REG_IR:
		strobe_wir();
		break;
	case REG_AC:
		strobe_wac();
		break;
	case REG_PC:
		strobe_wpc();
		break;
	}
	hold();
	tristate_ibus();
	
	return 1;
}


// End of file.
