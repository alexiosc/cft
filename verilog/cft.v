`include "control_unit.v"
`include "reset.v"
`include "clock.v"
`include "memory.v"
`include "io.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Function: The CFT CPU
//
///////////////////////////////////////////////////////////////////////////////

module cft(abus, dbus,
	   reset, irq,
	   clock, clock2, clock3, clock4,
	   mem, io, r, w,
	   halt,
	   iospace_region);

   inout [15:0]  dbus;
   input 	 reset;		// /RESET: active low reset signal
   input 	 irq;		// /IRQ: active low interrupt request signal

   output 	 clock;
   output 	 clock2;	// Phase 2 of the clock.
   output 	 clock3;	// Phase 3 of the clock.
   output 	 clock4;	// Phase 4 of the clock.
   output [15:0] abus;
   output        mem;
   output        io;
   output        r;
   output        w;
   output 	 halt;
   output [7:0]  iospace_region;

   wire [15:0] 	 ibus;

   wire 	 rst_hold;
   wire 	 clock14;

   // Reset logic.
   reset_logic reset_logic (clock, reset, rst_hold);

   // Clock generator.
   clock_generator clock_generator (halt,
				    0, // run (front panel)
				    0, // step (front panel)
				    reset,
				    clock, clock2, clock3, clock4, clock14, guardpulse);

   // The control unit. This is where most of the magic happens.
   control_unit control_unit (abus, dbus, ibus,
			      reset, rst_hold, irq,
			      clock, clock2, clock3, clock4, clock14, guardpulse,
			      mem, io, r, w, halt, iospace_region);

   // Some memory.
   memory memory (abus, dbus, mem, r, w, clock14);

   // Some I/O for debugging purposes.
   debug_io debug_io (abus, dbus, io, r, w, halt);
   
endmodule // cft

// End of file.
