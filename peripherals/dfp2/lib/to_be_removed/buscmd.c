#warning "TODO: Review this file for DFP2"

#include "hwcompat.h"
#include "abstract.h"
#include "input.h"
#include "output.h"
#include "proto.h"
#include "abstract.h"
#include "bus.h"
#include "buscmd.h"
#include "utils.h"
#include "panel.h"

#ifdef AVR
#include <util/atomic.h>
#else
#define ATOMIC_BLOCK(x)
#endif


static uint16_t _hi = 0;
static uint16_t features = 0;


// void
// buscmd_enef(uint16_t val)
// {
// 	report_pstr(PSTR(STR_NIMPL));
// }


// void
// buscmd_disef(uint16_t val)
// {
// 	report_pstr(PSTR(STR_NIMPL));
// }


// void
// buscmd_qef()
// {
// 	report_pstr(PSTR(STR_NIMPL));
// }


void
buscmd_print(char op, uint16_t val)
{
	// Do nothing if MESG is off.
	if ((flags & FL_MESG) == 0) return;

	// If this is an unprintable character and we're not on the
	// console, print it as a decimal ('c' opcode).
	if (op == 'C' && ((flags & FL_CONS) == 0) && (val < 33 || val > 127)) {
		op = 'c';
	}

	say_break();
	if ((flags & FL_CONS) == 0) {
		report_pstr(PSTR(STR_DEBPRN));
		report_char(op);
		report_char(32);
	}

	switch (op) {
	case 'A':
	case 'H':
		report_hex(val, 4);
		break;
	case 'B':
		report_bin(val);
		break;
	case 'C':
		report_char(val & 255);
		break;
	case 'c':
		val = val & 255;
		// Purposefully falling through
	case 'D':
		report_int(val);
		break;
	case 'U':
		report_uint(val);
		break;
	case 'L':
		report_hex(_hi, 4);
		report_hex(val, 4);
		break;
	}

	if (flags & FL_CONS) return;
	report_nl();
	proto_prompt();
}


void
buscmd_debugon()
{
	if ((flags & FL_MESG) == 0) return;
	style_error();
	report_pstr(PSTR(STR_NIMPL));
}


void
buscmd_debugoff()
{
	if ((flags & FL_MESG) == 0) return;
	style_error();
	report_pstr(PSTR(STR_NIMPL));
}


void
buscmd_dump()
{
	if ((flags & FL_MESG) == 0) return;
	style_error();
	report_pstr(PSTR(STR_NIMPL));
}


void
buscmd_printhi(uint16_t val)
{
	_hi = val;
}


void
buscmd_success()
{
	if ((flags & FL_MESG) == 0) return;
	say_break();
	if (flags & FL_CONS) report_pstr_in_console(PSTR("[ok]"));
	else report_pstr(PSTR(STR_SUCCESS));
	proto_prompt();
}


void
buscmd_halt()
{
	say_break();
	if (flags & FL_CONS) report_pstr_in_console(PSTR("[halt]"));
	//else report_pstr(PSTR(STR_AHALTED));
	proto_prompt();
	go_stop();
}


void
buscmd_fail()
{
	if (flags & FL_MESG) {
		say_break();
		if (flags & FL_CONS) report_pstr_in_console(PSTR("[fail]"));
		else report_pstr(PSTR(STR_FAIL));
		proto_prompt();
	}
	if (flags & FL_HOF) go_stop();
}


void
buscmd_sentinel()
{
	if (flags & FL_MESG) {
		say_break();
		if (flags & FL_CONS) report_pstr_in_console(PSTR("[sentinel]"));
		else report_pstr(PSTR(STR_DEBSENT));
		proto_prompt();
	}
	if (flags & FL_HOS) go_stop();
}

#ifdef CFTEMU
// #define debug_out(x) printf("*** DFP OUT: %s %04x\n", x, get_db())
// #define debug_in(x) printf("*** DFP IN: %s %04x\n", x, _db)
#define debug_out(x)
#define debug_in(x)
#else
#define debug_out(x)
#define debug_in(x)
#endif

void
buscmd_write()
{
	// Write cycle
	switch ((uint8_t)(get_ab() & 0xff)) {
	case IO_SOR:
		debug_out("SOR");
		set_or(get_db());
		break;

	case IO_ENEF:
		debug_out("ENEF");
		features |= get_db();
		if (features & FTR_TRC) buscmd_debugon();
		if (features & FTR_HOS) flags |= FL_HOS;
		break;

	case IO_DISEF:
		debug_out("DISEF");
		features &= ~get_db();
		if (features & FTR_TRC) buscmd_debugoff();
		if (features & FTR_HOS) flags &= ~FL_HOS;
		break;

	case IO_ICR:
		debug_out("ICR");
		icr = get_db();
		break;

	case IO_SENTINEL:
		debug_out("SENTINEL");
		buscmd_sentinel();
		break;

	case IO_PRINTA:
		debug_out("PRINTA");
		buscmd_print('A', get_db());
		break;

	case IO_PRINTC:
		debug_out("PRINTC");
		buscmd_print('C', get_db());
		break;

	case IO_PRINTD:
		debug_out("PRINTD");
		buscmd_print('D', get_db());
		break;

	case IO_PRINTU:
		debug_out("PRINTU");
		buscmd_print('U', get_db());
		break;

	case IO_PRINTH:
		debug_out("PRINTH");
		buscmd_print('H', get_db());
		break;

	case IO_PRINTB:
		debug_out("PRINTB");
		buscmd_print('B', get_db());
		break;

	case IO_PRINTSP:
		debug_out("PRINTSP");
		buscmd_print('C', 32);
		break;

	case IO_PRINTNL:
		debug_out("PRINTNL");
		buscmd_print('C', 10);
		break;

	case IO_DEBUGON:
		debug_out("DEBUGON");
		buscmd_debugon();
		break;

	case IO_DEBUGOFF:
		debug_out("DEBUGOFF");
		buscmd_debugoff();
		break;

	case IO_DUMP:
		debug_out("DUMP");
		buscmd_dump();
		break;

	case IO_PRINTHI:
		debug_out("PRINTHI");
		buscmd_printhi(get_db());
		break;

	case IO_PRINTLO:
		debug_out("PRINTLO");
		buscmd_print('L', get_db());
		break;

	case IO_HALT:
		debug_out("HALT");
		buscmd_halt();
		break;

	case IO_SUCCESS:
		debug_out("SUCCESS");
		buscmd_success();
		break;

	case IO_FAIL:
		debug_out("FAIL");
		buscmd_fail();
		break;
	}
}

void
buscmd_read()
{
	// Read cycle. We do NOT enable the data bus ourselves. There's an
	// ‘involuntary’ function that makes the data bus register drive
	// whenever the CFT selects the PFP/DEB. All we need to do is update
	// its value and register it for output.

	uint16_t _db = get_db();

	// We only check the lower 
	switch (get_ab() & 0xff) {
	case IO_LSR:
		_db = get_sr();
		debug_in("LSR");
		break;

	case IO_LDSR:
		_db = (get_lsw() & 0xff00) >> 8;
		_db |= (get_rsw() & 0xf000) >> 4;
		debug_in("LDSR");
		break;

	case IO_ISR:
#ifdef CFTEMU
		printf("*** ISR NOT IMPLEMENTED\n");
#else
		_db = 0;
		// Interrupts asserted
		if ((cb[0] & CB0_NIRQ1) == 0) _db |= ISR_IRQ6;
		if ((cb[0] & CB0_NIRQ6) == 0) _db |= ISR_IRQ1;
		// Interrupt sources
		if (ifr6_operated) _db |= ISR_IFR6;
		if (ringbuf.op != ringbuf.ip) _db |= ISR_TTY;

		defer_cb_write(); // Clear both IRQ1 and IRQ6 together.
		set_irq1(0);
		set_irq6(0, 0);
		ifr6_operated = 0;
#endif // AVR

		debug_in("ISR");
		break;

	case IO_QEF1:
	case IO_QEF2:
		_db = QEF_BASE;
		if (flags & FL_HOF) _db |= QEF_HOF;
		if (flags & FL_HOS) _db |= QEF_HOS;
		if (actuated(get_lsw(), SWL_NLOCK)) _db |= QEF_LCK;

		debug_in("QEF");
		break;

	case IO_READC:
		_db = maybe_dequeue_char();
		debug_in("READC");
		break;
	}
	write_db(_db);

}


// End of file.
