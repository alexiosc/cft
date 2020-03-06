`ifndef alu_v
`define alu_v

`include "buffer.v"
`include "mux.v"
`include "demux.v"
`include "flipflop.v"
`include "rom.v"

`timescale 1ns/10ps


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

   wire 	 x0, x3, x4, x7;

   // Decode. This is how signals are derived:
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
///////////////////////////////////////////////////////////////////////////////

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

   initial begin
      // $display("BOM: 74x08");
      // $display("BOM: 74x08");
      // $display("BOM: 74x08");
      // $display("BOM: 74x08");
   end

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

   initial begin
      // $display("BOM: 74x32");
      // $display("BOM: 74x32");
      // $display("BOM: 74x32");
      // $display("BOM: 74x32");
   end

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

   initial begin
      // $display("BOM: 74x86");
      // $display("BOM: 74x86");
      // $display("BOM: 74x86");
      // $display("BOM: 74x86");
   end

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

   initial begin
      // $display("BOM: 74x83");
   end

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

   wire 	 c0, c1, c2, c3;

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
//  An ALU implemented using traditional 74xxx ICs. This wastes
//  amazing amounts of PCB space, needing around four eurocards.
//
///////////////////////////////////////////////////////////////////////////////

module alu_v1 (a, b,
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

   // Wires for internal logic.
   wire 	 oe1, oe2;

   // Output enable using one 4073 (triple 3-input AND)
   and and_4073a (oe1, e_add, e_and, e_or);
   and and_4073b (oe2, e_xor, e_not, e_roll);
   and and_4073c (oe, oe1, oe1, oe2);

   initial begin
      // $display("BOM: 74x73/4073");
   end

   // L Latch: only applies to ADD and ROLL.
   //assign l_latch = e_roll;
   nand nor_xxxxa (l_latch, e_roll, e_roll);

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


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the ALU (using ROMs)
//
// NOTES:
//
//   Uses six ROMs:
//     3x binary op ROMs: each calculates 7 bits of data (6 data + carry out)
//     3x unary op ROMs: each calculates 6 bits of data
//
// Ops:
//                         IR[2..0]  BROM      UROM
//   OP     aluop   (op)   rollop    -OE  OP   -OE  OP
// ---------------------------------------------------
//   ADD    1000    0100    XXX      0   00    1   XXX
//   AND    1001    0101    XXX      0   01    1   XXX
//   OR     1010    0110    XXX      0   10    1   XXX    
//   XOR    1011    0111    XXX      0   11    1   XXX
// ---------------------------------------------------
//   RBR    1100    1000    001      1   XX    0   001
//   RBL    1100    1000    010      1   XX    0   000
//   RNR    1100    1000    101      1   XX    0   011
//   RNL    1100    1000    110      1   XX    0   010
// ---------------------------------------------------
//   NOT    1101    0101    XXX      1   XX    0   10X
// ---------------------------------------------------
//   CS1    1110    1110    XXX      1   XX    0   110
//   CS2    1111    1111    XXX      1   XX    0   111
// ---------------------------------------------------
//   NOP    0XXX    0XXX    XXX      1   XX    1   XXX  (for reset and idling)
//
// Equations:
//   alu_op = r_unit
//   op = {r_unit[2], r_unit[3], r_unit[1:0]}
//   binary_op = runit[1:0]
//   unary_op = runit[0] | runit[1] == 0 ? {1'b0, rollop[2], rollop[0]} : {1'b1, aluop[1:0]}
//   boe = aluop == 10XX
//   uoe = aluop == 11XX
//
// Thus:
//   binary_op = aluop[1:0]
//   uoe = NOT aluop[2]
//   boe = aluop[2]
//   OE = NOT aluop[3]
//
///////////////////////////////////////////////////////////////////////////////

module rom_alu_v0 (in,
		latch_a, latch_b,
		clock, guardpulse, reset, rsthold,
		aluop, rollop,
		l_in, add_l_out, roll_l_out, l_latch, ints,
		y);
   
   input [15:0]  in;		// Ibus input

   input         latch_a;	// Lach Input to A port.
   input         latch_b;	// Latch Input to B port.
   input 	 clock;	// Clock for latching A register data.
   input 	 guardpulse;	// Guardpulse
   input 	 reset;		// Reset signal.
   input 	 rsthold;	// -RSTHOLD signal.

   input [3:0] 	 aluop;		// Operation code.
   input [2:0] 	 rollop;	// The ROLL sub-operation (from the IR)

   input 	 l_in;		// Value of L.
   input 	 ints;		// Used by the constant store part of the unary ROM.

   output 	 add_l_out;	// Output value of L.
   output 	 roll_l_out;	// Output value of L.
   output 	 l_latch;	// L latch (only for rolling)
   output [15:0] y;		// Output value.

   tri0 	 add_l_out;
   tri0          l_latch;
   tri0 	 roll_l_out;

   wire [15:0] 	 a, b;
   
   wire [3:0] 	 aluop;
   wire [2:0] 	 uop;

   wire [14:0] 	 ba0, ba1;
   wire [10:0] 	 ba2;
   wire [7:0] 	 bd0, bd1, bd2;

   wire [17:0] 	 ua0, ua1;
   wire [16:0]   ua2;
   wire [7:0] 	 ud0, ud1, ud2;
   
   wire          boe, uoe, oe;
   tri0          co0, co1;
   wire [1:0] 	 pad_a, pad_b;
   wire          pad_c;
   wire [7:0] 	 romsel, alusel;
   wire          aluop01;

   tri1 	 add_v_out;

   tri [15:0] 	 y0;
   
   initial begin
      // $display("BOM: ALU Binary Op ROM");
      // $display("BOM: ALU Binary Op ROM");
      // $display("BOM: ALU Binary Op ROM");
      // $display("BOM: ALU Unary Op ROM 01");
      // $display("BOM: ALU Unary Op ROM 02");
      // $display("BOM: ALU Unary Op ROM 03");
      // $display("BOM: 74x138");
      // $display("BOM: 74x574");
      // $display("BOM: 74x574");
      // $display("BOM: 74x574");
      // $display("BOM: 74x574");
      // $display("NB: l_out is pulled down.");
   end

   // Wire the Binary ROMs
   assign ba0 = {aluop[1:0], l_in, a[5:0], b[5:0]};
   assign ba1 = {aluop[1:0], co0, a[11:6], b[11:6]};
   assign ba2 = {aluop[1:0], co1, a[15:12], b[15:12]};
   // Cascaded carry in/outs for ADD
   assign co0 = bd0[6];
   assign co1 = bd1[6];

   // The unary ROMs
   //          17:15    14    13     12     11     10     9      8      7      6      5     4     3     2     1     0
   assign ua0 = {uop, ints, l_in,  a[15], a[14], a[13], a[9],  a[8],  a[7],  a[6],  a[5], a[4], a[3], a[2], a[1], a[0]};
   assign ua1 = {uop, ints, a[15], a[14], a[13], a[12], a[11], a[10], a[9],  a[8],  a[7], a[6], a[5], a[4], a[3], a[2]}; 
   assign ua2 = {     uop,   ints, l_in,  a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[3], a[2], a[1], a[0]};

   // Net  y0 is  driven by one  of two  drivers (the two  banks of  ROMs). The
   // active driver  is determined by which bank of ROMs  has its /OE asserted,
   // and this is determined by the '138 driving the /UOE, /BOE signals.
   assign y0 = {bd2[3:0], bd1[5:0], bd0[5:0]};
   assign y0 = {ud2[3:0], ud1[5:0], ud0[5:0]};

   // Miscellaneous outputs from the ROMs (and the ALU)
   assign add_l_out = bd2[6];
   assign add_v_out = bd2[7];
   assign roll_l_out = ud2[4];
   assign l_latch = ud2[5];

   // The UOP decoder.
   //assign uop = aluop[0] | aluop[1] ? {1'b1, aluop[1:0]} : { 1'b0, rollop[2], rollop[0]};
   or #10 aluop01_or (aluop01, aluop[0], aluop[1]);
   mux_253 uopmux ({1'b0, aluop01}, // Signal selector (single-bit)
		   {2'b0, aluop[0], rollop[0]}, // Input 1
		   1'b0, // /G1 (always asserted)
		   uop[0], // Output 1
		   {2'b0, aluop[1], rollop[2]}, // Input 2
		   1'b0, // /G2 (always asserted)
		   uop[1] // Output 2
		   );
   assign uop[2] = aluop01;

   // We use a '138 for logic (rather than discrete gates) because it
   // avoids glitches.
   demux_138 ubsel (reset, guardpulse, 1'b0, {rsthold, aluop[3], aluop[2]}, romsel);
   assign boe = romsel[6];
   assign uoe = romsel[7];
   
   // Note: all three ROMs use the same signal.
   rom #(15, 70, "../microcode/alu-binary-6bit-00.list") romb0 (ba0, bd0, 1'b0, boe);
   rom #(15, 70, "../microcode/alu-binary-6bit-00.list") romb1 (ba1, bd1, 1'b0, boe);
   rom #(11, 70, "../microcode/alu-binary-4bit-00.list") romb2 (ba2, bd2, 1'b0, boe);

   // The unary ROMs (and constant store)
   rom #(18, 70, "../microcode/alu-unary-00.list") romu0 (ua0, ud0, 1'b0, uoe);
   rom #(18, 70, "../microcode/alu-unary-01.list") romu1 (ua1, ud1, 1'b0, uoe);
   rom #(17, 70, "../microcode/alu-unary-02.list") romu2 (ua2, ud2, 1'b0, uoe);

   // Placeholder (to allow registering of ALU output if necessary)
   assign y=y0;

   // The '& reset' bits are used to latch initial values to the flip
   // flops, but they're used only for Verilog's sake (to avoid 'X'
   // values). On actual hardware, both ALU ports would be set by
   // microcode before the ALU is read, hence avoiding unknown values.
   flipflop_574 rega_hi (in[15:8], a[15:8], latch_a & reset, 1'b0);
   flipflop_574 rega_lo (in[7:0], a[7:0],   latch_a & reset, 1'b0);
   
   flipflop_574 regb_hi (in[15:8], b[15:8], latch_b & reset, 1'b0);
   flipflop_574 regb_lo (in[7:0], b[7:0],   latch_b & reset, 1'b0);

   wire v_out;
   wire fv;
   wire [7:0] v_latches;
   demux_138 vlatch (1'b1, boe, clock, {1'b0, aluop[1:0]}, v_latches);
   wire [6:0] v_dummy;
   //flipflop_574 ffv ({ 7'd0, add_v_out}, { v_dummy, v_out}, v_latches[0], 1'b0);

   wire       nadd_v_out;
   not #8 not_7404a (nadd_v_out, add_v_out);
   flipflop_112 ffv (add_v_out, nadd_v_out, v_latches[0], reset, 1'b1, fv,, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, , );
   
   // The reset vector (migrated from the now defunct separete constant store unit)
   buffer_244 rstlo (rsthold, rsthold, 4'b0000, 4'b1111, y[3:0], y[7:4]);
   buffer_244 rsthi (rsthold, rsthold, 4'b1111, 4'b1111, y[11:8], y[15:12]);

endmodule // alu









///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module alu_decoder (nreset, nrsthold, nt34,
		    runit, ir, ibus, ac, nwalu,
		    nboe, nuoe, uop, b);

   input         nreset, nrsthold, nt34;
   input [3:0]   runit;
   input [15:0]  ir, ibus, ac;
   input 	 nwalu;

   output 	 nboe, nuoe;
   output [2:0]  uop;
   output [15:0] b;

   // ALU Port B Buffer (Port A is the AC)
   flipflop_574 b_lo (ibus[7:0], b[7:0], nwalu, 0);
   flipflop_574 b_hi (ibus[15:8], b[15:8], nwalu, 0);

   // Unary operation decoder
   or #6 (uop[2], runit[0], runit[1]);
   mux_253 uop_mux ({1'b0, uop[2]},
		    {2'b0, runit[0], ir[0]}, 0, uop[0],
		    {2'b0, runit[1], ir[2]}, 0, uop[1]);

   // ALU ROM Selector
   wire [7:0] 	 y;
   // nguard
   demux_138 rom_demux (nreset, nt34, 0, {nrsthold, runit[3:2]}, y);
   assign nuoe = y[7];
   assign nboe = y[6];
endmodule // alu_decoder


// The ALU Binary operations section.
module alu_binary (nreset, clk3/* OK */, clk4/* OK */,
		   ibus,
		   nboe, fl, ac, b, runit,
		   nflstrobe, fv, nfltadd);

   input 	nreset, clk3/* OK */, clk4/* OK */;
   inout [15:0] ibus;
   input [15:0] ac, b;
   input 	nboe, fl;
   input [3:0] 	runit;

   output 	nflstrobe, fv, nfltadd;

   wire 	nreset, clk3/* OK */, clk4/* OK */;
   wire [15:0] 	ibus;
   wire [15:0] 	ac, b;
   wire 	nboe, fl;
   wire [3:0] 	runit;
   
   wire 	nflstrobe, fv, nfltadd;

   wire [14:0] 	ba0, ba1;
   wire [10:0] 	ba2;
   tri0 	co1, co2;
   tri1         flatch, nalucpl, fvout;
   wire [7:0] 	bd0, bd1, bd2;
   wire [15:0] 	y;
   
   assign ba0 = {runit[1:0] , fl, ac[5:0], b[5:0]};
   assign ba1 = {runit[1:0], co1, ac[11:6], b[11:6]};
   assign ba2 = {runit[1:0], co2, ac[15:12], b[15:12]};

   // ROM Data buses
   rom #(15, 70, "../microcode/alu-binary-6bit-00.list") romb0 (ba0, bd0, 1'b0, 1'b0);
   rom #(15, 70, "../microcode/alu-binary-6bit-00.list") romb1 (ba1, bd1, 1'b0, 1'b0);
   rom #(11, 70, "../microcode/alu-binary-4bit-00.list") romb2 (ba2, bd2, 1'b0, 1'b0);

   // Outputs
   
   assign y = {bd2[3:0], bd1[5:0], bd0[5:0]};
   assign co1 = bd0[6];
   assign co2 = bd1[6];
   assign flatch = bd2[5];
   assign nalucpl = bd2[6];
   assign fvout = bd2[7];

   // Y port buffer
   buffer_541 ybuf_lo (nboe, nboe, y[7:0], ibus[7:0]);
   buffer_541 ybuf_hi (nboe, nboe, y[15:8], ibus[15:8]);

   // Post-processing and flags
   wire 	flagclk;
   mux_253h fmux ({flatch, nboe}, {1'b1, clk4/* OK */, 2'b11}, 0, flagclk);
   flipflop_74h ff1 (fvout, flagclk, 1, nreset, fv, );
   flipflop_74h ff2 (nalucpl, flagclk/* OK */, 1, clk3/* OK */, , nfltadd);

endmodule // alu_binary


// The ALU Unary Operations ROM
module alu_unary (nreset, clk3/* OK */,
		  ibus,
		  ac, uop, nuoe, fl, nirqs,
		  roll16, isroll);

   input 	nreset, clk3/* OK */;
   inout [15:0] ibus;
   input [15:0] ac;
   input [2:0] 	uop;
   input 	nuoe, fl, nirqs;

   output 	roll16, isroll;

   wire 	nreset, clk3/* OK */;
   wire [15:0] 	ibus;
   wire [15:0] 	ac;
   wire [2:0] 	uop;
   wire 	nuoe, fl, nirqs;
   
   tri0 	roll16, isroll;

   wire [17:0] 	ua0, ua1;
   wire [16:0]  ua2;
   wire [7:0] 	ud0, ud1, ud2;

   assign ua0 = { uop[2:0], nirqs, fl, ac[15:13], ac[9:0] };
   assign ua1 = { uop[2:0], nirqs, ac[15:2]};
   assign ua2 = { uop[2:0], nirqs, fl, ac[15:8], ac[3:0] };
   
   // The unary ROMs (and constant store)
   rom #(18, 70, "../microcode/alu-unary-00.list") romu0 (ua0, ud0, 0, nuoe);
   rom #(18, 70, "../microcode/alu-unary-01.list") romu1 (ua1, ud1, 0, nuoe);
   rom #(17, 70, "../microcode/alu-unary-02.list") romu2 (ua2, ud2, 0, nuoe);

   assign ibus = { ud2[3:0], ud1[5:0], ud0[5:0] };
   assign roll16 = ud2[4];
   assign isroll = ud2[5];

endmodule // alu_unary


module alu(nreset, nrsthold, clk2/* OK */, clk3/* OK */, clk4/* OK */, nt34/* OK */, nirqs,
	   runit,
	   ir, ibus, ac,
	   fl,
	   nwalu,
	   nflstrobe, fv, nfltadd, roll16, isroll);

   input nreset, nrsthold, clk2/* OK */, clk3/* OK */, clk4/* OK */, nt34/* OK */, nirqs, nwalu;
   input [3:0] runit;
   inout [15:0] ibus;
   input [15:0] ir, ac;
   input 	fl;

   output 	nflstrobe, fv, nfltadd, roll16, isroll;

   wire 	nreset, nrsthold, clk2/* OK */, clk3/* OK */, clk/* OK */, nt34, nirqs, nwalu;
   wire [3:0] 	runit;
   wire [15:0] 	ibus;
   wire [15:0] 	ir, ac;
   wire 	fl;
   
   wire 	nflstrobe, fv, nfltadd, roll16, isroll;

   // Locals
   wire 	nboe, nuoe, aluen;
   wire [2:0] 	uop;
   wire [15:0] 	b;

   // The ALU unit decoder
   and #9 (aluen, clk2, nt34/* OK */);
   alu_decoder decoder (nreset, nrsthold, aluen,
			runit, ir, ibus, ac, nwalu,
			nboe, nuoe, uop, b);

   // Binary operations
   alu_binary binary (nreset, clk3/* OK */, clk4/* OK */,
		      ibus,
		      nboe, fl, ac, b, runit,
		      nflstrobe, fv, nfltadd);

   // Unary operations and constant store.
   alu_unary unary (nreset, clk3/* OK */,
		    ibus,
		    ac, uop, nuoe, fl, nirqs,
		    roll16, isroll);
endmodule // alu

   
`endif //  `ifndef alu_v


// End of file.
