///////////////////////////////////////////////////////////////////////////////
//
// PORT A OF THE ALU
//
// REDESIGNED IN 2019
//
// NOTES: 
//
///////////////////////////////////////////////////////////////////////////////


`ifndef alu_porta_v
`define alu_porta_v

`include "flipflop.v"

`timescale 1ns/1ps

module alu_porta (ac, clk4, a);

   input [15:0]   ac;
   input 	  clk4;

   output [15:0]  a;

   flipflop_574 fflo (.d(ac[7:0]), .clk(clk4), .noe(1'b0), .q(a[7:0]));
   flipflop_574 ffhi (.d(ac[15:8]), .clk(clk4), .noe(1'b0), .q(a[15:8]));

endmodule // alu_rom

`endif //  `ifndef alu_porta_v

// End of file
