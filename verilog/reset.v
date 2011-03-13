///////////////////////////////////////////////////////////////////////////////
//
// Function: Reset circuitry
//
// Notes: We'll be implementing reset circuitry using a simple timer circuit.
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
`include "counter.v"
`include "flipflop.v"

module reset_logic (clock, reset_in, reset_out);
   parameter pulse_width = 200;
   
   input clock, reset_in;
   output     reset_out;

   wire [4:0] dummy;
   wire       reset_out;

   counter_161 div16 (reset_in, clock & ~tc, 1'b1, 1'b1, 1'b1, 4'b0, , tc);
   assign reset_out = tc;

   // always @(negedge reset_in)
   //   begin
   // 	reset_out = 0;
   // 	#pulse_width reset_out = 1;
   //   end
endmodule // reset_logic


// End of file.
