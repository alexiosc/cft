///////////////////////////////////////////////////////////////////////////////
//
// PORT B OF THE ALU
//
// REDESINGED IN 2019
//
// NOTES: 
//
///////////////////////////////////////////////////////////////////////////////


`ifndef alu_portb_v
`define alu_portb_v

`include "flipflop.v"
`include "buffer.v"

`timescale 1ns/1ps

module alu_portb (ibus, cp, noe, b);

   inout [15:0]   ibus;
   input 	  cp;
   input 	  noe;

   output [15:0]  b;

   flipflop_574 fflo (.d(ibus[7:0]),  .clk(cp), .noe(1'b0), .q(b[7:0]));
   flipflop_574 ffhi (.d(ibus[15:8]), .clk(cp), .noe(1'b0), .q(b[15:8]));

   buffer_541 buflo (.a(b[7:0]),  .y(ibus[7:0]),  .noe1(noe), .noe2(1'b0));
   buffer_541 bufhi (.a(b[15:8]), .y(ibus[15:8]), .noe1(noe), .noe2(1'b0));

endmodule // alu_portb

`endif //  `ifndef alu_portb_v

// End of file
