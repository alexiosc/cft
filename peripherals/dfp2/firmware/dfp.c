#warning "TODO: Review this file for DFP2"
#ifdef HOST
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#endif


#include "abstract.h"
#include "proto.h"

#ifdef AVR
#include <avr/wdt.h>
#endif // AVR


inline void
diag()
{
//#warning "TODO: Implement diags"
}


inline void
init()
{
	hw_init();
	diag();
	proto_init();
}


inline void
run()
{
	proto_loop();
}


#ifndef AVR
inline void
done()
{
	hw_done();
}
#endif // AVR


#ifdef AVR
__attribute__ ((noreturn))
#endif
int
main(int argc, char **argv)
{
#ifdef AVR
	// First things first, clear the WDRF and reset the watchdog
	MCUSR = 0;
	wdt_disable();

	init();
	for (;;) run();
#else
	init();
	run();
	done();
	return 0;
#endif // ! AVR
}

// End of file.
