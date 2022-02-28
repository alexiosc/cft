// -*- c -*-

///////////////////////////////////////////////////////////////////////////////
//
// THE DFP 2 FIRMWARE
//
///////////////////////////////////////////////////////////////////////////////

#ifdef HOST
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#endif

#include "driver.h"
#include "proto.h"

#ifdef AVR
#include <avr/wdt.h>
#endif // AVR


inline void
init()
{
        // Start with terminal bells and whistles.
        uistate.is_term = 1;
        
        // Initialise hardware. Also run diagnostics at appropriate points
        // during the initialisation process.
	hw_init();

        // Initialise the serial/debugging UI/protocol.
	proto_init();
}


inline void
run()
{
        // We've clearly finished booting.
        hwstate.is_booting = 0;

        // Read and react to serial/debugging input.
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
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
