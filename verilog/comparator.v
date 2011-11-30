`ifndef comparator_v
`define comparator_v


`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x688 4x4 Register File
//
// Notes:
// 
// 4x4-bit 3-state dual-port register file.
// 
// 8-bit inverting identity comparator with enable.
// 
//     +---+--+---+
// /EN |1  +--+ 20| VCC
//  A0 |2       19| /A=B
//  B0 |3       18| B7
//  A1 |4       17| A7
//  B1 |5   74  16| B6
//  A2 |6  688  15| A6
//  B2 |7       14| B5
//  A3 |8       13| A5
//  B3 |9       12| B4
// GND |10      11| A4
//     +----------+
//
///////////////////////////////////////////////////////////////////////////////

module comparator_688 (a, b, en, equal);
   input [7:0] a, b;
   input       en;

   output      equal;

   initial begin
      $display("BOM: 74x688");
   end

   assign #20 equal = (en == 1'b0) ? ~(a == b) : 1'b1;
endmodule // comparator_jk

`endif //  `ifndef comparator_v

// End of file.

