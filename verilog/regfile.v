`ifndef regfile_v
`define regfile_v


`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x670 4x4 Register File
//
// Notes:
// 
// 4x4-bit 3-state dual-port register file.
// 
//     +---+--+---+
//  D2 |1  +--+ 16| VCC
//  D3 |2       15| D1
//  D4 |3       14| WA0
// RA1 |4   74  13| WA1
// RA0 |5  670  12| /WR
//  Q4 |6       11| /RD
//  Q3 |7       10| Q1
// GND |8        9| Q2
//     +----------+
//
///////////////////////////////////////////////////////////////////////////////

module regfile_670 (d, re, we, ra, wa, q);
   input [3:0] d;
   input       we;
   input       re;
   input [1:0] ra;
   input [1:0] wa;
   
   output [3:0] q;

   reg [3:0] 	q0[0:3];

   initial begin
      // $display("BOM: 74x670");
   end

   always @(we, d) begin
      if (we == 1'b0) #21 q0[wa] = d;
   end

   assign #17 q = (re == 1'b0) ? q0[ra] : 4'bzzzz;
   
endmodule // regfile_jk

`endif //  `ifndef regfile_v

// End of file.

