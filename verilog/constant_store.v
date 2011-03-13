`timescale 1ns/10ps
`include "buffer.v"

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: constant store.
//
// NOTES: outputs either 0000, 0001 or FFFE to the ibus.
//
// CS = 00 -> 0000
// CS = 01 -> 0001
// CS = 10 -> FFFE
// CS = 11 -> FFFF
//
//       OE    !OE
//       
// RST    1     0
//
// !RST   1     1
//
//  OE1 = OE OR !RST = !(!OE AND !!RST) = !(!OE AND RST) = !OE NAND RST
//
// OE !RST  Y  OE OR !RST    !(!OE AND RST)
// ----------------------------------------
//  0  1    1      1               1
//  0  0    0      0               0
//  1  1    1      1               1
//  1  0    0      1               1
//
///////////////////////////////////////////////////////////////////////////////

module constant_store (oe, rst, cs, q);
   input         oe;
   input         rst;		// When 0, forces cs to 11.
   input [1:0]   cs;

   output [15:0] q;

   wire [15:0] 	 q0;
   wire [3:0] 	 vec;

   // Evaluate oe OR !rst with NAND gates.
   nand(noe, oe, oe);		// !oe = oe nand oe
   nand(oe1, noe, rst);		// oe1 = !(noe and rst)

   // Easy wiring.
   assign q0 = {{15{cs[0]}}, cs[1]};

   buffer_244 buf0 (oe1, oe1, q0[3:0], q0[7:4], q[3:0], q[7:4]);
   buffer_244 buf1 (oe1, oe1, q0[11:8], q0[15:12], q[11:8], q[15:12]);

   // The reset vector (fffe)
   buffer_244 buf2 (rst, rst, 4'b1110, 4'b1111, q[3:0], q[7:4]);
   buffer_244 buf3 (rst, rst, 4'b1111, 4'b1111, q[11:8], q[15:12]);
   
endmodule // constant_store

// End of file.
