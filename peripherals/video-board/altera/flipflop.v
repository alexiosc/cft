`ifndef flipflop_v
 `define flipflop_v

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// J-K FLIPFLOP WITH SET AND RESET
//
///////////////////////////////////////////////////////////////////////////////


module ff_jk(j, k, clk, set, clr, q);

   input j, k, clk, set, clr;
   output reg q;

   always @(posedge clk, posedge set, posedge clr) begin
      if (set == 1'b1) q <= 1;
      else if (clr == 1'b1) q <= 0;
      else begin
	 case ({j,k})
	    2'b01: q <= 0;
	    2'b10: q <= 1;
	    2'b11: q <= ~q;
	    default: q <= q;
	 endcase // case ({j,k})
      end
   end

endmodule // ff_jk


module ff_sr(set, rst, q);

   input set, rst;
   output reg q;

   initial q<= 0;

   always @(posedge set, posedge rst) begin
      if (set == 1'b1) q <= 1;
      else if (rst == 1'b1) q <= 0;
   end

endmodule // ff_sr

`endif //  `ifndef flipflop_v

// End of file.
