`ifndef register_v
 `define register_v

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// n-BIT REGISTER WITH ASYNCHRONOUS CLEAR
//
// Function: just a tiny convenience module to keep other code simpler.
//
///////////////////////////////////////////////////////////////////////////////


module register(clk, nclr, d, q);

   parameter bits = 4;

   input 		 clk, nclr;
   input [bits-1:0] 	 d;

   output reg [bits-1:0] q;

   initial q <= 0;

   always @(posedge clk, negedge nclr) begin
      if (nclr == 1'b0) q <= 0;
      else q <= d;
   end

endmodule // register

module fe_register(clk, nclr, d, q);

   parameter bits = 4;

   input 		 clk, nclr;
   input [bits-1:0] 	 d;

   output reg [bits-1:0] q;

   initial q <= 0;

   always @(negedge clk, negedge nclr) begin
      if (nclr == 1'b0) q <= 0;
      else q <= d;
   end

endmodule // register

`endif //  `ifndef register_v

// End of file.
