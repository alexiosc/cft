`timescale 1ns/10ps
`ifndef alu_v
`define alu_v

`include "buffer.v"
`include "mux.v"
`include "demux.v"
`include "flipflop.v"


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the roll unit.
//
// NOTES: This can do 1- and 4-bit left or right rolls on <L,A> (17
// bits).
//
// * If /ENABLE is high, output is always Z.
// * OPs:
//   00: L1 (RBL)
//   01: R1 (RBR)
//   10: L4 (RNL)
//   11: R4 (RNR)
//
// To ensure no two operations run at once, we decode OP to four lines
// using a 74138.
// 
// Connections:
//
// RBL (roll 1 bit left)
//
// Assign: A15 | A14 A13 A12 A11 | A10  A9 A8 A7 | A6 A5 A4 A3 | A2 A1 A0 L
// -------------------------------------------------------------------------
// To:     L   | A15 A14 A13 A12 | A11 A10 A9 A8 | A7 A6 A5 A4 | A3 A2 A1 A0 
//
// RBR (roll 1 bit right)
//
// Assign: A0 | L   A15 A14 A13 | A12 A11 A10 A9 | A8 A7 A6 A5 | A4 A3 A2 A1 
// -------------------------------------------------------------------------
// To:     L  | A15 A14 A13 A12 | A11 A10 A9  A8 | A7 A6 A5 A4 | A3 A2 A1 A0 
//
// RNL (roll 4 bits left)
//
// Assign: A12 | A11 A10 A9  A8  | A7  A6  A5 A4 | A3 A2 A1 A0 | L  A15 A14 A13
// ----------------------------------------------------------------------------
// To:     L   | A15 A14 A13 A12 | A11 A10 A9 A8 | A7 A6 A5 A4 | A3 A2  A1  A0
//
// RNR (roll4 bits right)
//
// Assign: A3 | A2  A1  A0  L   | A15 A14 A13 A12 | A11 A10 A9 A8 | A7 A6 A5 A4 
// ----------------------------------------------------------------------------
// To:     L  | A15 A14 A13 A12 | A11 A10 A9  A8  | A7  A6  A5 A4 | A3 A2 A1 A0 
//
///////////////////////////////////////////////////////////////////////////////

module alu_roll_unit(a, l, enable, op, y, l_out);
   input [15:0]  a;
   input 	 l;
   input 	 enable; 	// ACTIVE low enable.
   input [2:0] 	 op;

   output [15:0] y;
   output 	 l_out;

   wire [15:0] 	 a;
   wire 	 l;
   wire  	 l1, r1, l4, r4;

   wire [15:0] 	 y;

   // Decode. This is how signals aren derived:
   //
   //                        111 unused
   // L4: RNL = OP1  '-------110		; <L,A> <- <L,A> >> 4
   // R4: RNR = OP1  '-------101		; <L,A> <- <L,A> << 4
   //                        100 unused
   //                        011 unused
   // L1: RBL = OP1  '-------010		; <L,A> <- <L,A> >> 1
   // R1: RBR = OP1  '-------001		; <L,A> <- <L,A> << 1
   //                        000 unused
   //demux_138 op_decoder(1'b1, 1'b0, enable, {1'b0, op}, {x7, x6, x5, x4, r4, l4, r1, l1});
   demux_138 op_decoder(1'b1, 1'b0, enable, op, {x7, l4, r4, x4, x3, l1, r1, x0});

   // First, deal with the four-bit quantities.

   // L1: RBL                <--- variable -->    <-- constant -->
   buffer_244 rbl_hi(l1, l1, a[14:11], a[10:7],   y[15:12],y[11:8]);
   buffer_244 rbl_lo(l1, l1, a[6:3], {a[2:0], l}, y[7:4],  y[3:0]);

   // R1: RBR                <--- variable -->       <-- constant -->
   buffer_244 rbr_hi(r1, r1, {l, a[15:13]}, a[12:9], y[15:12],y[11:8]);
   buffer_244 rbr_lo(r1, r1, a[8:5], a[4:1],         y[7:4],  y[3:0]);

   // L4: RNL                <--- variable -->       <-- constant -->
   buffer_244 rnl_hi(l4, l4, a[11:8], a[7:4],        y[15:12],y[11:8]);
   buffer_244 rnl_lo(l4, l4, a[3:0], {l, a[15:13]},  y[7:4],  y[3:0]);
   
   // R4: RNR                <--- variable -->       <-- constant -->
   buffer_244 rnr_hi(r4, r4, {a[2:0], l}, a[15:12],  y[15:12],y[11:8]);
   buffer_244 rnr_lo(r4, r4, a[11:8], a[7:4],        y[7:4],  y[3:0]);

   // Now, use another two buffers to decide what goes into the L
   // register. Each bank of the two '244s does one bit (and one bit
   // only).

   wire [2:0] 	 foo0, foo1, x;
   assign x = 3'b000;

   buffer_244 mux_l1(l1, r1, {x, a[15] }, {x, a[0]}, {foo0, l_out}, {foo0, l_out});
   buffer_244 mux_l2(l4, r4, {x, a[12]}, {x, a[3]}, {foo1, l_out}, {foo1, l_out});

endmodule // alu_roll_unit


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the NOT unit.
//
// NOTES: complements the A port implicitly, using two 74x240
// inverting buffers.
//
// ///////////////////////////////////////////////////////////////////////////////

module alu_not_unit(a, enable, y);
   input [15:0]  a;
   input 	 enable;
   output [15:0] y;

   buffer_240 not_hi(enable, enable, a[15:12], a[11:8], y[15:12], y[11:8]);
   buffer_240 not_lo(enable, enable, a[7:4], a[3:0], y[7:4], y[3:0]);

endmodule // alu_not_unit

   

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the AND unit.
//
// NOTES: performs a logic AND between ports A and B. Uses 2x 74x244 and 4x
// 74x08.
//
///////////////////////////////////////////////////////////////////////////////

module alu_and_unit(a, b, enable, y);
   input [15:0]  a, b;
   input 	 enable;
   output [15:0] y, y0;

   and and_7408_4d (y0[15], a[15], b[15]);
   and and_7408_4c (y0[14], a[14], b[14]);
   and and_7408_4b (y0[13], a[13], b[13]);
   and and_7408_4a (y0[12], a[12], b[12]);

   and and_7408_3d (y0[11], a[11], b[11]);
   and and_7408_3c (y0[10], a[10], b[10]);
   and and_7408_3b (y0[9], a[9], b[9]);
   and and_7408_3a (y0[8], a[8], b[8]);

   and and_7408_2d (y0[7], a[7], b[7]);
   and and_7408_2c (y0[6], a[6], b[6]);
   and and_7408_2b (y0[5], a[5], b[5]);
   and and_7408_2a (y0[4], a[4], b[4]);

   and and_7408_1d (y0[3], a[3], b[3]);
   and and_7408_1c (y0[2], a[2], b[2]);
   and and_7408_1b (y0[1], a[1], b[1]);
   and and_7408_1a (y0[0], a[0], b[0]);

   buffer_244 and_hi(enable, enable, y0[15:12], y0[11:8], y[15:12], y[11:8]);
   buffer_244 and_lo(enable, enable, y0[7:4], y0[3:0], y[7:4], y[3:0]);

endmodule // alu_and_unit

   
///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the OR unit.
//
// NOTES: performs a logic AND between ports A and B. Uses 2x 74x244 and 4x
// 74x32.
//
///////////////////////////////////////////////////////////////////////////////

module alu_or_unit(a, b, enable, y);
   input [15:0]  a, b;
   input 	 enable;
   output [15:0] y, y0;

   or or_7432_4d (y0[15], a[15], b[15]);
   or or_7432_4c (y0[14], a[14], b[14]);
   or or_7432_4b (y0[13], a[13], b[13]);
   or or_7432_4a (y0[12], a[12], b[12]);

   or or_7432_3d (y0[11], a[11], b[11]);
   or or_7432_3c (y0[10], a[10], b[10]);
   or or_7432_3b (y0[9], a[9], b[9]);
   or or_7432_3a (y0[8], a[8], b[8]);

   or or_7432_2d (y0[7], a[7], b[7]);
   or or_7432_2c (y0[6], a[6], b[6]);
   or or_7432_2b (y0[5], a[5], b[5]);
   or or_7432_2a (y0[4], a[4], b[4]);

   or or_7432_1d (y0[3], a[3], b[3]);
   or or_7432_1c (y0[2], a[2], b[2]);
   or or_7432_1b (y0[1], a[1], b[1]);
   or or_7432_1a (y0[0], a[0], b[0]);

   buffer_244 or_hi(enable, enable, y0[15:12], y0[11:8], y[15:12], y[11:8]);
   buffer_244 or_lo(enable, enable, y0[7:4], y0[3:0], y[7:4], y[3:0]);

endmodule // alu_or_unit

   
///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the XOR unit.
//
// NOTES: performs a logic XOR between ports A and B. Uses 2x 74x244 and 4x
// 74x86.
//
///////////////////////////////////////////////////////////////////////////////

module alu_xor_unit(a, b, enable, y);
   input [15:0]  a, b;
   input 	 enable;
   output [15:0] y, y0;

   xor xor_7486_4d (y0[15], a[15], b[15]);
   xor xor_7486_4c (y0[14], a[14], b[14]);
   xor xor_7486_4b (y0[13], a[13], b[13]);
   xor xor_7486_4a (y0[12], a[12], b[12]);

   xor xor_7486_3d (y0[11], a[11], b[11]);
   xor xor_7486_3c (y0[10], a[10], b[10]);
   xor xor_7486_3b (y0[9], a[9], b[9]);
   xor xor_7486_3a (y0[8], a[8], b[8]);

   xor xor_7486_2d (y0[7], a[7], b[7]);
   xor xor_7486_2c (y0[6], a[6], b[6]);
   xor xor_7486_2b (y0[5], a[5], b[5]);
   xor xor_7486_2a (y0[4], a[4], b[4]);

   xor xor_7486_1d (y0[3], a[3], b[3]);
   xor xor_7486_1c (y0[2], a[2], b[2]);
   xor xor_7486_1b (y0[1], a[1], b[1]);
   xor xor_7486_1a (y0[0], a[0], b[0]);

   buffer_244 xor_hi(enable, enable, y0[15:12], y0[11:8], y[15:12], y[11:8]);
   buffer_244 xor_lo(enable, enable, y0[7:4], y0[3:0], y[7:4], y[3:0]);

endmodule // alu_xor_unit


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: 7483 4-bit binary full adder with fast carry.
//
///////////////////////////////////////////////////////////////////////////////

module adder_83(a, b, cin, s, cout);
   parameter delay = 10;
   
   input [3:0]  a, b;
   input        cin;

   output [3:0] s;
   output 	cout;

   assign #delay {cout, s} = a + b + cin;
endmodule // alu_83


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: The ADD unit.
//
///////////////////////////////////////////////////////////////////////////////

module alu_add_unit(a, b, enable, y, l_out);
   input [15:0]  a, b;
   input 	 enable;	// Active low enable line.
   
   output [15:0] y, y0;
   output 	 l_out;

   adder_83 add0(a[3:0],   b[3:0],   1'b0, y0[3:0],   c0);
   adder_83 add1(a[7:4],   b[7:4],   c0,   y0[7:4],   c1);
   adder_83 add2(a[11:8],  b[11:8],  c1,   y0[11:8],  c2);
   adder_83 add3(a[15:12], b[15:12], c2,   y0[15:12], c3);

   buffer_244 buf_hi(enable, enable, y0[15:12], y0[11:8], y[15:12], y[11:8]);
   buffer_244 buf_lo(enable, enable, y0[7:4],   y0[3:0],  y[7:4],   y[3:0]);

   // Buffer l_out. Do this with a '244. For simplicity in this code, we do it the simple way.
   //assign l_out = enable ? 1'bz : c3;
   assign l_out = c3;
endmodule // alu_add


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the ALU.
//
// NOTES: 
//
///////////////////////////////////////////////////////////////////////////////

module alu (a, b,
	    clock,
	    e_add, e_and, e_or, e_xor, e_not, e_roll, rollop,
	    l_in, add_l_out, roll_l_out, l_latch,
	    y);
   
   input [15:0]  a, b;

   input 	 clock;		// Clock for latching ALU data.

   input  	 e_add;		// Active Low: select ADD.
   input 	 e_and;		// Active Low: select AND.
   input 	 e_or;		// Active Low: select OR.
   input 	 e_xor;		// Active Low: select XOR.
   input 	 e_not;		// Active Low: select NOT.
   input 	 e_roll;	// Active Low: select R[BN][LR].
   input [2:0] 	 rollop;	// The ROLL operation.

   input 	 l_in;		// Value of L.

   output 	 add_l_out;	// Output value of L.
   output 	 roll_l_out;	// Output value of L.
   output 	 l_latch;	// L latch (only for rolling)
   output [15:0] y0, y;		// Output value.

   wire 	 oe;		// Active low: control tri-stating of y.

   // Output enable using one 4073 (triple 3-input AND)
   and and_4073a (oe1, e_add, e_and, e_or);
   and and_4073b (oe2, e_xor, e_not, e_roll);
   and and_4073c (oe, oe1, oe1, oe2);

   // L Latch: only applies to ADD and ROLL.
   assign l_latch = e_roll;
   //nand nor_xxxxa (l_latch, e_add, e_roll);

   // The ALU units.
   alu_add_unit add_unit(a, b, e_add, y, add_l_out);
   alu_and_unit and_unit(a, b, e_and, y);
   alu_or_unit or_unit(a, b, e_or, y);
   alu_xor_unit xor_unit(a, b, e_xor, y);

   // The complement (not) unit is enabled using OP1 instructions.
   alu_not_unit not_unit(a, e_not, y);

   // The roll unit is enabled using OP2 instructions.
   alu_roll_unit roll_unit(a, l_in, e_roll, rollop, y, roll_l_out);

   // The ALU has a registered output because it updates the A
   // register, which is fed into it.
   flipflop_574 reg_hi (y0[15:8], y[15:8], clock, oe);
   flipflop_574 reg_lo (y0[7:0], y[7:0],   clock, oe);

endmodule // alu


`endif //  `ifndef alu_v


// End of file.
