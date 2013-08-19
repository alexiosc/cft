`ifndef counter193_v
 `define counter193_v

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// n-BIT COUNTER WITH ASYNCHRONOUS CLEAR AND LOAD
//
// Function: a 74x193-style counter with an active-low asynchronous
// clear signal and an active-low asynchronous load signal. The count
// goes up by one on the rising edge of clk.
//
// By default, this is a 4-bit counter but it can be configured for
// any number of bits. Here's a 11-bit counter:
//
// counter193 #11 foo(clk, nclr, nload, 999, q);
//
///////////////////////////////////////////////////////////////////////////////


module counter193(clk, nclr, nload, d, q);

   parameter bits = 4;

   input 		 clk, nclr, nload;
   input [bits-1:0] 	 d;

   output reg [bits-1:0] q;

   initial begin
      q <= 0;
   end

   always @(posedge clk or negedge nclr or negedge nload) begin
      if (nclr == 0) q <= 0;
      else if (nload == 0) q <= d;
      else begin 
	 q <= q + 1;
      end
   end

endmodule // counter193

`endif //  `ifndef counter193_v


// End of file.
