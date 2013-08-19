`ifndef serial_v
`define serial_v

`include "buffer.v"
`include "flipflop.v"


`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x164 shift register
//
///////////////////////////////////////////////////////////////////////////////

module shiftreg_164 (a, b, clk, clr, q);
   parameter delay = 18;
   
   input 	 a, b, clk, clr;
   output [7:0]  q;
   reg [7:0] 	 q;

   initial begin
      // $display("BOM: 74x164");
   end

   always @(clr, posedge clk) begin
      if (clr == 1'b0) begin
	 #delay q <= 0;
      end else begin
	#delay q <= (q << 1) | (a & b);
      end
   end
endmodule // shiftreg_164



`endif //  `ifndef serial_v


// End of file.
