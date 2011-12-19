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

`include "counter.v"
`include "flipflop.v"

`timescale 1ns/10ps

module reset_logic (clock, reset_in, reset_out);
   input clock, reset_in;
   output     reset_out;

   wire [4:0] dummy;
   //reg 	      reset_out;
   wire       reset_out;

   //initial begin
   //   reset_out = 1'b1;
   //end
   //always @(posedge reset_in) begin
   //   reset_out = 1'b0;
   //   #1000 reset_out = 1'b1;
   //end

   counter_161 div16 (reset_in, clock & ~reset_out, 1'b1, 1'b1, 1'b1, 4'b0, , reset_out);
   //flipflop_112h ff_reset (1'b0, 1'b0, 1'b0, reset_in, reset_done, reset_out, );
   
endmodule // reset_logic


// End of file.
