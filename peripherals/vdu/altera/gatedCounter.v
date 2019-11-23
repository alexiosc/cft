`ifndef gatedCounter_v
 `define gatedCounter_v

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// n-BIT COUNTER WITH COUNT ENABLE GATE AND ASYNCHRONOUS CLEAR
//
// Function: a simple n-bit counter with an active-low asynchronous
// clear signal. By default, this is a 4-bit counter but it can be configured
// for any number of bits. Here's a 11-bit counter:
//
// counter #11 foo(clk, clken, nclr, q);
//
// The count goes up by 1 on the rising edge of clk, provided clken is high.
//
///////////////////////////////////////////////////////////////////////////////


module gatedCounter(clk, clken, nclr, q);

   parameter bits = 4;

   input 		 clk, clken, nclr;
   
   output reg [bits-1:0] q;

   always @(posedge clk, negedge nclr) begin
      if (nclr == 1'b0) q <= 0;
      else if (clken == 1'b1) q <= q + 1;
   end

endmodule // gatedCounter

`endif //  `ifndef gatedCounter_v

// End of file.
