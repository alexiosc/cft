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

module reset_logic (nreset, nrsthold, clk1, fpreset, powerok, ibus);

   inout nreset;
   output nrsthold;
   input clk1;

   input fpreset;
   input powerok;

   inout [15:0] ibus;

   wand nreset;
   tri1  nrsthold, fpreset;

   wire [15:0] ibus;

   // Assign reset input signals to the RESET#. Open drain.
   tri1        fpreset1, powerok1;
   not #6 not_fpreset1(fpreset1, fpreset);
   not #6 not_fpreset2(nreset, fpreset1);
   not #6 not_powerok1(powerok1, powerok);
   not #6 not_powerok2(nreset, powerok1);

   // Reset timer
   wire [7:0] q;
   counter_590 reset_counter (clk1, nrsthold, nreset, clk1, 1'b0, q,);

   // Allow different reset timings.
   assign nrsthold = q[3];	// 16 ticks (2ms @ 4 MHz processor clock)
   //assign nrsthold = q[4];	// 16 ticks (4ms @ 4 MHz processor clock)
   //assign nrsthold = q[5];	// 32 ticks (8ms)
   //assign nrsthold = q[6];	// 64 ticks (16ms)
   //assign nrsthold = q[7];	// 128 ticks (32ms)

   // Reset vector
   buffer_541 reset_vector_lo (nrsthold, nrsthold, 8'b11110000, ibus[7:0]);
   buffer_541 reset_vector_hi (nrsthold, nrsthold, 8'b11111111, ibus[15:8]);

endmodule // reset_logic

// End of file.
