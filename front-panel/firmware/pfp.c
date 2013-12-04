#ifdef HOST
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#endif


#include "abstract.h"
#include "proto.h"


inline void
diag()
{
//#warning "TODO: Implement diags"
}


inline void
cpu_detect()
{
//#warning "TODO: Implement CPU detection"
}


inline void
init()
{
	hw_init();
	diag();
	cpu_detect();
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
