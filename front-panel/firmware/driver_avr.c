#ifdef AVR


// This 'driver' is only available on the AVR target.


#include "hwcompat.h"
#include "bus.h"
#include "abstract.h"
#include "utils.h"
#include "serial.h"

/*

  PC0: in  DEBIN
  PC1: in  VPIN
  PC2: out ICLK
  PC3: out DOUT
  PC4: out CMD0
  PC5: out CMD1

  PD0: USART
  PD1: USART
  PD2: in  IOCMD + int
  PD3: out DB-OE#
  PD4: out AB-OE#
  PD5: out IBUS-OE#
  PD6: out CTL-OE#
  PD7: out COUT

  PB0: out CLR-WS
  PB1: out FPCLKEN-IN
  PB2: out FPUSTEP-IN
  PB3: out IOADDR0
  PB4: out IOADDR1
  PB5: out IOADDR2


 */


void
hw_init()
{
	serial_init();


	//DDRB |= _BV(PB0) | _BV(PB1) | _BV(PB2) | _BV(PB3);

}


void
hw_tick()
{
#warning "TODO"
}


void
hw_done()
{
#warning "TODO"
}



// Console I/O

unsigned char
query_char(int timeout_usec)
{
#warning "TODO"
}

unsigned char
read_next_char()
{
#warning "TODO"
}


void
serial_write(unsigned char c)
{
#warning "TODO"
}


// Input

uint16_t
read_ab()
{
#warning "TODO"
	return 0;
}


uint16_t
read_db()
{
#warning "TODO"
	return 0;
}


uint16_t
read_dsr()
{
#warning "TODO"
	return 0;
}


uint16_t
read_sr()
{
#warning "TODO"
	return 0;
}


uint32_t
read_sw()
{
#warning "TODO"
	return 0;
}


void
virtual_panel_sample()
{
#warning "TODO"
}


uint32_t
read_misc()
{
#warning "TODO"
	return 0;
}


uint16_t
read_ir()
{
#warning "TODO"
	return 0;
}


uint16_t
read_pc()
{
#warning "TODO"
	return 0;
}


uint16_t
read_ac()
{
#warning "TODO"
	return 0;
}


// Output

void
write_leds(const uint8_t x)
{
#warning "TODO"
}


void
write_or(const uint16_t or)
{
#warning "TODO"
}


void
drive_ibus()
{
#warning "TODO"
}


void
write_ibus(const uint16_t ibus)
{
#warning "TODO"
}


void
tristate_ibus()
{
#warning "TODO"
}



void
drive_ab()
{
#warning "TODO"
}


void
write_ab(const uint16_t abus)
{
#warning "TODO"
}


void
tristate_ab()
{
#warning "TODO"
}



void
drive_db()
{
#warning "TODO"
}


void
write_db(const uint16_t dbus)
{
#warning "TODO"
}


void
tristate_db()
{
#warning "TODO"
}

// Strobes & miscellaneous signals


void
set_clk(int x)
{
#warning "TODO"
}


void
set_clkfreq(int x)
{
}


void
strobe_step()
{
#warning "TODO"
}


void
strobe_ustep()
{
#warning "TODO"
}


void
set_buspu(int x)
{
#warning "TODO"
}


void
set_safe(int x)
{
#warning "TODO"
}


void
set_irq1(int x)
{
#warning "TODO"
}


void
set_irq6(int x)
{
#warning "TODO"
}


void
set_fpram(int x)
{
#warning "TODO"
}


void
strobe_fpreset()
{
#warning "TODO"
}


void
strobe_wpc()
{
#warning "TODO"
}


void
strobe_wac()
{
#warning "TODO"
}


void
strobe_wir()
{
#warning "TODO"
}


void
strobe_w()
{
#warning "TODO"
}


void
set_r(int x)
{
#warning "TODO"
}


void
set_mem(int x)
{
#warning "TODO"
}


void
set_io(int x)
{
#warning "TODO"
}


void
strobe_war()
{
#warning "TODO"
}


void
strobe_rpc()
{
#warning "TODO"
}


void
strobe_incpc()
{
#warning "TODO"
}


void
set_halt(int x)
{
#warning "TODO"
}


void
set_runstop(int x)
{
#warning "TODO"
}


#endif // HOST


// End of file.
