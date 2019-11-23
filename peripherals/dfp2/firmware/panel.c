#warning "TODO: Review this file for DFP2"
#include <stdlib.h>
#include <stdint.h>

#include "hwcompat.h"
#include "proto.h"
#include "abstract.h"
#include "panel.h"
#include "output.h"
#include "bus.h"


//panel_in_t panel_in;
//panel_out_t panel_out;


static bool_t _lock;
static uint16_t _oldsr = 0xffff;
static uint8_t _rom = 0xff;
static uint8_t _spd = 0xff;


bool_t
panel_lock(bool_t lock)
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	if (lock == _lock) return lock;
	_lock = lock;
	say_break();
	report_bool_value(PSTR(STR_PLOCK), _lock);
	proto_prompt();
	return _lock;
}


void
panel_sr(uint16_t sr)
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	if (sr == _oldsr) return;

	_oldsr = sr;

	say_break();
	set_sr(sr);
	say_sr();
	proto_prompt();
}


void
panel_reset()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	go_reset();
	proto_prompt();
}


void
panel_start()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	go_start();
	proto_prompt();
}


void
panel_stop()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	flags |= FL_BUSY;
	say_break();
	go_stop();
	flags &= ~FL_BUSY;
	proto_prompt();
}


void
panel_run()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	go_run();
	proto_prompt();
}


void
panel_step()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	go_step();
	proto_prompt();
}


void
panel_ustep()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	go_ustep();
	proto_prompt();
}


// Spd is:
// bit 1 (FAST)   bit 0 (SLOW)    Value    Meaning
// 0              0               0        Not possible (full speed)
// 0              1               1        Fast
// 1              0               2        Creep
// 1              1               3        Slow
void
panel_spd(uint8_t spd)
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	//uint8_t tmp = _spd != 0xff;

	if (spd == _spd) return;
	uint8_t tmp = _spd;
	_spd = spd;

	// Do nothing the very first time we're run (during
	// initilisation).
	if (tmp == 0xff) return;
	
	say_break();
	if (spd == 2) {
		go_creep();
		//report_pstr(PSTR(STR_CREEP));
	} else if (spd == 3) {
		go_slow();
		//report_pstr(PSTR(STR_SLOW));
	} else {
		go_fast();
		//report_pstr(PSTR(STR_FAST));
	}
	proto_prompt();
}


void
panel_ldir()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	if (assert_halted()) {
		set_reg(REG_IR, get_sr());

		report_gs(1);
		report_hex_value(PSTR(STR_GSIR), get_ir(), 4);
		check_mismatch(get_sr(), get_ir());
	}
	proto_prompt();
}


void
panel_ldaddr()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	if (assert_halted()) {
		extern uint16_t addr;
		addr = get_sr();
		
		if (flags & FL_PROC) {
			// We have a processor. Set the PC as well.
			set_reg(REG_PCAR, addr);
			report_gs(1);
			report_hex_value(PSTR(STR_GSPC), get_pc(), 4);
			check_mismatch(get_sr(), get_pc());
		} else {
			// No processor, report the address.
			report_gs(1);
			report_hex_value(PSTR(STR_ADDR), addr, 4);
		}
	}
	proto_prompt();
}


void
panel_ldac()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	if (assert_halted()) {
		set_reg(REG_AC, get_sr());

		report_gs(1);
		report_hex_value(PSTR(STR_GSAC), get_ac(), 4);
		check_mismatch(get_sr(), get_ac());
	}
	proto_prompt();
}


void
panel_wmem(bool_t inc, uint16_t a, uint16_t d)
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	if (assert_halted()) {
		perform_write(SPACE_MEM, a, d);
		if (inc) addr_inc();
		
		report_pstr(PSTR(STR_WMEM));
		report_hex(a, 4);
		report_hex_value(PSTR(STR_WDATA), d, 4);
	}
	proto_prompt();
}


void
panel_rmem(bool_t inc, uint16_t a)
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	if (assert_halted()) {
		uint16_t d = perform_read(SPACE_MEM, a);
		if (inc) addr_inc();
		
		report_pstr(PSTR(STR_RMEM));
		report_hex(a, 4);
		report_hex_value(PSTR(STR_RDATA), d, 4);
	}
	proto_prompt();
}


void
panel_wio(bool_t inc, uint16_t a, uint16_t d)
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	if (assert_halted()) {
		perform_write(SPACE_IO, a, d);
		if (inc) addr_inc();
		
		report_pstr(PSTR(STR_WIO));
		report_hex(a, 4);
		report_hex_value(PSTR(STR_WDATA), d, 4);
	}
	proto_prompt();
}


void
panel_rio(bool_t inc, uint16_t a)
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	if (assert_halted()) {
		uint16_t d = perform_read(SPACE_IO, a);
		if (inc) addr_inc();
		
		report_pstr(PSTR(STR_RIO));
		report_hex(a, 4);
		report_hex_value(PSTR(STR_RDATA), d, 4);
	}
	proto_prompt();
}


void
panel_rom(uint8_t rom)
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	if ((flags & FL_HALT) == 0) return;
	if (rom == _rom) return;
	uint8_t tmp = _rom;
	_rom = rom;
	set_fpram(rom);

	// Don't print anything out if this is the first invocation
	// after power on.
	if (tmp == 0xff) return;

	// Output to the debugging console.
	say_break();
	report_pstr(PSTR(STR_FPRAM));
	report_pstr(rom ? PSTR(STR_FPRAM1) : PSTR(STR_FPRAM0));
	proto_prompt();
}


void
panel_ifr1()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	if (icr & ICR_IFR1) {
		set_irq1(1);
		report_pstr(PSTR(STR_IFR1));
	} else {
		report_pstr(PSTR(STR_IFR1M));
	}
	proto_prompt();
}


void
panel_ifr6()
{
	//report(__FUNCTION__); report_pstr(PSTR("()\n"));
	say_break();
	if (icr & ICR_IFR6) {
		set_irq6(1, 1);
		report_pstr(PSTR(STR_IFR6));
	} else {
		report_pstr(PSTR(STR_IFR6M));
	}
	proto_prompt();
}


// End of file.
