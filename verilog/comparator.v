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

///////////////////////////////////////////////////////////////////////////////
//
// Function: 4-bit noninverting magnitude comparator with cascade inputs.
//        +---+--+---+
//     B3 |1  +--+ 16| VCC
//   IA<B |2       15| A3
//   IA=B |3       14| B2
//   IA>B |4       13| A2
//   OA>B |5  7485 12| A1
//   OA=B |6       11| B1
//   OA<B |7       10| A0
//    GND |8        9| B0
//        +----------+
//
///////////////////////////////////////////////////////////////////////////////

module comparator_85 (a, b, ilt, ieq, igt, olt, oeq, ogt);
   parameter delay = 20;
   
   input [3:0] a, b;
   input       ilt, ieq, igt;

   output      olt, oeq, ogt;

   wire [4:0]  csl, csg;

   initial begin
      $display("BOM: 74x85");
   end

  assign csl = ~a + b + ilt;
  assign olt = ~csl[4];
  assign csg = a + ~b + igt;
  assign ogt = ~csg[4];
  assign oeq = ((a == b) && ieq);

endmodule // comparator_85


`endif //  `ifndef comparator_v

// End of file.

