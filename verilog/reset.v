//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// Function: Reset circuitry
//
// Notes: We'll be implementing reset circuitry using a simple timer circuit.
//
// reset rst_hold go_fetch => IR.rst
// ---------------------------------
//   0       X        X          1
//   1       1        1          1
//   1       1        0          0
//
// IR.rst = rst_hold AND ~go_fetch
//
///////////////////////////////////////////////////////////////////////////////

`include "buffer.v"
`include "counter.v"
`include "flipflop.v"

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module reset_logic (nreset, fpreset, powerok, nrsthold, clk3);

   inout  nreset;
   input  fpreset;
   input  powerok;
   output nrsthold;
   input  clk3;

   wand   nreset;
   tri1   nrsthold, fpreset;

   wire [15:0] ibus;

   // Assign reset input signals to the RESET#. Open drain.
   tri1        fpreset1, powerok1;
   not #6 not_fpreset1(fpreset1, fpreset);
   not #6 not_fpreset2(nreset, fpreset1);
   not #6 not_powerok1(powerok1, powerok);
   not #6 not_powerok2(nreset, powerok1);

   // Reset timer
   wire [7:0] q;
   counter_590 reset_counter (.clk(clk3), .ccken(nrsthold),
			      .cclr(nreset & fpreset & powerok),
			      .rck(clk3), .g(1'b0), .q(q));

   // Allow different reset timings, but use a fast one for verilog testing.
   // assign nrsthold = q[0];	// 2 ticks (0.5µs @ 4 MHz processor clock)
   assign nrsthold = q[1];


endmodule // reset_logic

// End of file.
