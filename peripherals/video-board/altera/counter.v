`ifndef counter_v
 `define counter_v

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// n-BIT COUNTER WITH ASYNCHRONOUS CLEAR
//
// Function: a simple n-bit counter with an active-low asynchronous
// clear signal. By default, this is a 4-bit counter but it can be configured
// for any number of bits. Here's a 11-bit counter:
//
// counter #11 foo(clk, nclr, q);
//
///////////////////////////////////////////////////////////////////////////////


module counter(clk, nclr, q);

   parameter bits = 4;

   input 		 clk, nclr;

   output reg [bits-1:0] q;

   always @(posedge clk, negedge nclr) begin
      if (nclr == 1'b0) q <= 0;
      else q <= q + 1;
   end

endmodule // counter


module counter_pr(clk, nclr, nload, d, q);

   parameter bits = 4;

   input 		 clk, nclr, nload;
   input [bits-1:0] 	 d;
   output reg [bits-1:0] q;

   always @(posedge clk, negedge nclr, negedge nload) begin
      if (nclr == 1'b0) q <= 0;
      else if (nload == 1'b0) q <= d;
      else q <= q + 1;
   end

endmodule // counter


module counter_fe(clk, nclr, q);

   parameter bits = 4;

   input 		 clk, nclr;

   output reg [bits-1:0] q;

   always @(negedge clk, negedge nclr) begin
      if (nclr == 1'b0) q <= 0;
      else q <= q + 1;
   end

endmodule // counter


module counter_en(clk, en, nclr, q);

   parameter bits = 4;

   input 		 clk, en, nclr;

   output reg [bits-1:0] q;

   always @(posedge clk, negedge nclr) begin
      if (nclr == 1'b0) q <= 0;
      else if (en == 1'b1) q <= q + 1;
   end

endmodule // counter

`endif //  `ifndef counter_v

// End of file.
