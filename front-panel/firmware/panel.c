#include <stdlib.h>
#include <stdint.h>

#include "hwcompat.h"
#include "abstract.h"
#include "proto.h"
#include "panel.h"
#include "output.h"
#include "bus.h"


//panel_in_t panel_in;
//panel_out_t panel_out;


static uint16_t _lock;

void
panel_lock(uint8_t lock)
{
	if (lock == _lock) return;
	_lock = lock;
	say_break();
//#warning "TODO: finish this"
	proto_prompt();
}


static uint16_t _oldsr = 0xffff;

void
panel_sr(uint16_t sr)
{
	if (sr == _oldsr) return;

	say_break();
	set_sr(sr);
	say_sr();
	proto_prompt();
}


void
panel_reset()
{
	say_break();
	go_reset();
	proto_prompt();
}


void
panel_start()
{
	say_break();
	go_start();
	proto_prompt();
}


void
panel_stop()
{
	say_break();
	go_stop();
	proto_prompt();
}


void
panel_run()
{
	say_break();
	go_run();
	proto_prompt();
}


void
panel_step()
{
	say_break();
	go_step();
	proto_prompt();
}


void
panel_ustep()
{
	say_break();
	go_ustep();
	proto_prompt();
}


// 0 is impossible due to switch configuration, so it's a good starting value.
static uint8_t _spd = 0;


// Spd is:
// bit 1 (FAST)   bit 0 (SLOW)    Value    Meaning
// 0              0               0        Not possible (full speed)
// 0              1               1        Fast
// 1              0               2        Creep
// 1              1               3        Slow
void
panel_spd(uint8_t spd)
{
	if (spd == _spd) return;
	_spd = spd;

	say_break();
	if (spd == 2) {
		go_creep();
		report_pstr(PSTR(STR_CREEP));
	} else if (spd == 3) {
		go_slow();
		report_pstr(PSTR(STR_SLOW));
	} else {
		go_fast();
		report_pstr(PSTR(STR_FAST));
	}
	proto_prompt();
}


void
panel_ldir()
{
	set_reg(REG_IR, get_sr());

	say_break();
	report_gs(1);
	report_hex_value(PSTR(STR_GSIR), get_ir(), 4);
	proto_prompt();
}


void
panel_ldaddr()
{
	set_reg(REG_IR, get_pc());

	say_break();
	report_gs(1);
	report_hex_value(PSTR(STR_GSIR), get_pc(), 4);
	proto_prompt();
}


void
panel_ldac()
{
	say_break();
	//printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
panel_wmem(bool_t inc, uint16_t a, uint16_t d)
{
	if (!assert_halted()) return;

	perform_write(SPACE_MEM, a, d);
	if (inc) addr_inc();

	say_break();
	report_pstr(PSTR(STR_WMEM));
	report_hex(a, 4);
	report_hex_value(PSTR(STR_WDATA), d, 4);
	proto_prompt();
}


void
panel_rmem(bool_t inc, uint16_t a)
{
	if (!assert_halted()) return;

	uint16_t d = perform_read(SPACE_MEM, a);
	if (inc) addr_inc();

	say_break();
	report_pstr(PSTR(STR_RMEM));
	report_hex(a, 4);
	report_hex_value(PSTR(STR_RDATA), d, 4);
	proto_prompt();
}


void
panel_wio(bool_t inc, uint16_t a, uint16_t d)
{
	if (!assert_halted()) return;

	perform_write(SPACE_MEM, a, d);
	if (inc) addr_inc();

	say_break();
	report_pstr(PSTR(STR_WIO));
	report_hex(a, 4);
	report_hex_value(PSTR(STR_WDATA), d, 4);
	proto_prompt();
}


void
panel_rio(bool_t inc, uint16_t a)
{
	if (!assert_halted()) return;

	uint16_t d = perform_read(SPACE_IO, a);
	if (inc) addr_inc();

	say_break();
	report_pstr(PSTR(STR_RIO));
	report_hex(a, 4);
	report_hex_value(PSTR(STR_RDATA), d, 4);
	proto_prompt();
}


static uint16_t _rom = 0xffff;

void
panel_rom(uint8_t rom)
{
	if ((flags & FL_HALT) == 0) return;
	if (rom == _rom) return;
	set_fpram(rom);

	// Output to the debugging console.
	say_break();
	report(PSTR(STR_FPRAM));
	report(rom ? PSTR(STR_FPRAM1) : PSTR(STR_FPRAM0));
	proto_prompt();
}


void
panel_ifr1()
{
	say_break();
	report(PSTR(STR_IFR1));
	set_irq1(1);
	proto_prompt();
}


void
panel_ifr6()
{
	say_break();
	report(PSTR(STR_IFR6));
	set_irq1(6);
	proto_prompt();
}


// End of file.
