#include <stdlib.h>
#include <stdint.h>

#include "hwcompat.h"
#include "proto.h"
#include "panel.h"
#include "output.h"


panel_in_t panel_in;
panel_out_t panel_out;


void
say_break()
{
	report_pstr(PSTR("***\n"));
	flags |= FL_ASYNC;
}


static uint16_t _lock;
void
async_lock(uint8_t lock)
{
	if (lock == _lock) return;
	_lock = lock;
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


static uint16_t _sr0;
void
async_sr(uint16_t sr)
{
	if (sr == _sr0) return;
	_sr0 = sr;
	say_break();
	panel_in.b.sr = sr;
	say_sr();
	proto_prompt();
}


void
async_reset()
{
	say_break();
	go_reset();
	proto_prompt();
}


void
async_start()
{
	say_break();
	go_start();
	proto_prompt();
}


void
async_stop()
{
	say_break();
	go_stop();
	proto_prompt();
}


void
async_run()
{
	say_break();
	go_run();
	proto_prompt();
}


void
async_step()
{
	say_break();
	go_step();
	proto_prompt();
}


void
async_ustep()
{
	say_break();
	go_ustep();
	proto_prompt();
}


static uint8_t _spd;
void
async_spd(uint8_t spd)
{
	if (spd == _spd) return;
	_spd = spd;
	say_break();
	if (spd == 0) go_fast();
	else if (spd == 1) go_slow();
	else if (spd == 2) go_creep();
	proto_prompt();
}


void
async_ldir()
{
	say_break();
	printf("*** TODO\n");
	proto_prompt();
}


void
async_ldaddr()
{
	say_break();
	printf("*** TODO\n");
	proto_prompt();
}


void
async_ldac()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
async_wmem()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
async_wmeminc()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
async_rmem()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
async_rmeminc()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
async_wio()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
async_wioinc()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
async_rio()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
async_rioinc()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


static uint8_t _rom;
void
async_rom(uint8_t rom)
{
	if (rom == _rom) return;
	_rom = rom;
	printf("*** TODO: set RAM/ROM\n");
	//say_break();
	//panel_in.b.sr = sr;
	//say_sr();
	proto_prompt();
}


void
async_ifr1()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


void
async_ifr6()
{
	say_break();
	printf("*** TODO: %s\n", __FUNCTION__);
	proto_prompt();
}


// End of file.
