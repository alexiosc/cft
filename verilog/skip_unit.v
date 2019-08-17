///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// NOTE: these notes are old and out of date!
//
// THE SKIP UNIT
//
// NOTES: the skip unit provides both microcode and code skip functionality to
// the control unit. It tests the selected bit in the data field (i.e. the 10
// low order bits of the IR), and outputs the /SKIP signal (active low).
//
// MACHINE CODE SKIPS: these are implemented using the three low order bits of
// OP1. If sel==2 (sel=0010, ifskip signal), and data[2:0] != 0, data[2:0] is
// used to determine the check or checks to carry out on the f_x ALU
// flags. This is in turn output as skip.
//
// ROLLS: if sel==1 (sel=0001, ifroll signal), data[3] or data[2] or data[1] or
// data[0] is selected and output. The roll unit will decode this to select the
// right roll operation.
//
// MULTIPLEXING: we have nine values to select from. This means we need two
// levels of multiplexers (A and B multiplex the 2 low-order bits, C
// multiplexes between them using the high-order bits). This obviously
// increases propagation delay. To reduce propagation delay for the roll and
// skip equations, which are already complex, we connect them straight to mux
// C. This obviously means sel is partially decoded, but this isn't a problem
// as seen below.
//
// SEL    MUX  SIGNAL   uCode signal
// 00 00   A   unused   unused (*)
// 00 01   A   d3       if3
// 00 10   A   d4       if4
// 00 11   A   d5       if5
// 01 00   B   d6       if6
// 01 01   B   d7       if7
// 01 10   B   d8       if8
// 01 11   B   d9       if9
// 10 XX   C   roll     ifroll (1011)
// 11 XX   C   skip     ifskip (1111)
//
// (*) When SEL=0000, we output 1 (don't skip) because the skip unit is
// actually deselected.
//
// MACHINE CODE-LEVEL BRANCH LOGIC:
//
// ===BRANCH INSTRUCTIONS===
//
// NOP =  OP2 '------0000		; (no semantics)
// SNA =  OP2 '------01--		; A & 0x8000 == 1 ==> PC := PC + 1  }
// SZA =  OP2 '------0-1-		; A == 0 ==> PC := PC + 1           } ORred together
// SSL =  OP2 '------0--1		; L == 1 ==> PC := PC + 1           }
// SKIP = OP2 '------1000		; PC := PC + 1
// SNN =  OP2 '------11--		; A & 0x80 == 1 ==> PC := PC + 1    }
// SNZ =  OP2 '------1-1-		; A != 0 ==> PC := PC + 1           } ANDed together
// SCL =  OP2 '------1--1		; L == 0 ==> PC := PC + 1           }
//
// ===SKIP MECHANISM===
// 
// data[3] sets skip flag (0 = clear, 1 = skip)
// data[2:0] set the skip flag when the appropriate condition is true.
// 
// ====SKIP LOGIC PROOF====
//
// SN = flag_n AND data[0]
// SZ = flag_z AND data[1]
// SL = flag_l AND data[2]
// D = data[3]
// 
// SKIP = (SN or SZ or SL) XNOR D
//
// Gate count: 3×AND, 1×OR, 1×XNOR (74266) => 3 ICs.
//
// PROOF
// 
// D  SN SZ SL   SN·SZ·SL  SN+SZ+SL   !((SN+SZ+SL) ^ D)  COMMENT
// -------------------------------------------------------------
// 0  0  0  0        0        0            1             NEVER SKIP (NOP)
// 0  0  0  1        0        1            0             SSL (skip if L set)
// 0  0  1  0        0        1            0             SZA (skip if A == 0)
// 0  0  1  1        0        1            0
// 0  1  0  0        0        1            0             SNA (skip if A < 0)
// 0  1  0  1        0        1            0
// 0  1  1  0        0        1            0             **1
// 0  1  1  1        1        1            0
// 1  0  0  0        0        0            0             ALWAYS SKIP (SKIP)
// 1  0  0  1        0        1            1             DON'T SKIP IF L set <==> SNN skip if L clear
// 1  0  1  0        0        1            1             DON'T SKIP IF A == 0 <==> SKIP IF A non-zero
// 1  0  1  1        0        1            1
// 1  1  0  0        0        1            1             DON'T SKIP IF A < 0 <==> SKIP IF A >= 0
// 1  1  0  1        0        1            1
// 1  1  1  0        0        1            1             **2
// 1  1  1  1        0        1            0
//                                          \-- *** 0 = BRANCH! ***
// 
// **1 = SKIP if (A == 0)   OR   (A < 0)
//       ==        SKIP IF A <= 0
// 
// **2 = SKIP if NOT ((A == 0)   OR   (A < 0))
//       DeMorgan: SKIP IF (NOT (A == 0) AND NOT (A < 0))
//       ==        SKIP IF ((A != 0) AND (A >= 0))
//       ==        SKIP IF A > 0
//
//
//
//
//
//
//
//
// 2012-01-28: PROOF USING NAND GATES:
//
// SN = flag_n NAND data[0]
// SZ = flag_z NAND data[1]
// SL = flag_l NAND data[2]
// D = data[3]
// 
// SKIP = (SN or SZ or SL) XNOR D
//
//    (NAND)                 (NAND)
//    __ __ __   __ __ __    __ __ __
// D  SN SZ SL   SN·SZ·SL  !(SN·SZ·SL)  SN+SZ+SL   !((SN+SZ+SL) ^ D)  COMMENT
// -------------------------------------------------------------
// 0  1  1  1        1          0    ==    0            1             NEVER SKIP (NOP)
// 0  1  1  0        0          1    ==    1            0             SSL (skip if L set)
// 0  1  0  1        0          1    ==    1            0             SZA (skip if A == 0)
// 0  1  0  0        0          1    ==    1            0
// 0  0  1  1        0          1    ==    1            0             SNA (skip if A < 0)
// 0  0  1  0        0          1    ==    1            0
// 0  0  0  1        0          1    ==    1            0             **1
// 0  0  0  0        0          1    ==    1            0
// 1  1  1  1        1          0    ==    0            0             ALWAYS SKIP (SKIP)
// 1  1  1  0        0          1    ==    1            1             DON'T SKIP IF L set <==> SNN skip if L clear
// 1  1  0  1        0          1    ==    1            1             DON'T SKIP IF A == 0 <==> SKIP IF A non-zero
// 1  1  0  0        0          1    ==    1            1
// 1  0  1  1        0          1    ==    1            1             DON'T SKIP IF A < 0 <==> SKIP IF A >= 0
// 1  0  1  0        0          1    ==    1            1
// 1  0  0  1        0          1    ==    1            1             **2
// 1  0  0  0        0          1    ==    1            0
//                                          \-- *** 0 = BRANCH! ***
// 
//
// OP       FLAGS
// m n z l  N Z L  nN zZ lL   /S  (Nn+zZ+lL)^m
// ---------------------------------------------
// 0 0 0 0  X X X   0  0  0    1     0
// 0 0 0 1  X X 0   0  0  0    1     0
// 0 0 0 1  X X 1   0  0  1    0     1
// 0 0 1 0  
// 0 0 1 1  
// 0 1 0 0  
// 0 1 0 1  
// 0 1 1 0  0 0 X   0  0  0    1     0  (nN + zZ) == m
// 0 1 1 0  0 1 X   0  1  0    0     1  (nN + zZ) == m
// 0 1 1 0  1 0 X   1  0  0    0     1  (nN + zZ) == m
// 0 1 1 0  1 1 X   1  1  0    0     1  (nN + zZ) == m
// 0 1 1 1  
// 1 0 0 0  X X X   0  0  0    0     1 *** SHOULD BE 0
// 1 0 0 1  X X 0   0  0  0    0     1
// 1 0 0 1  X X 1   0  0  1    1
// 1 0 1 0
// 1 0 1 1  
// 1 1 0 0  
// 1 1 0 1  
// 1 1 1 0  0 0 X   0  0  0    0     1  (nN + zZ + lL) == m
// 1 1 1 0  0 1 X   0  1  0    1     0  (nN + zZ + lL) == m
// 1 1 1 0  1 0 X   1  0  0    1     0  (nN + zZ + lL) == m
// 1 1 1 0  1 1 X   1  1  0    1     0  (nN + zZ + lL) == m
// 1 1 1 1
// 
///////////////////////////////////////////////////////////////////////////////


`ifndef skip_unit_v
`define skip_unit_v

`include "mux.v"
`include "demux.v"
`include "flipflop.v"

`timescale 1ns/1ps


`ifdef OLD_VERSIONS
module skip_unit_v0(sel, data, f_zero, f_neg, f_l, f_v, enable, skip, ifend);
   input [3:0] sel;
   input [9:0] data;
   input       f_zero, f_neg, f_l, f_v, enable;
   
   output      skip, ifend;
   
   wire        sig_op1_branch;
   wire        sig_op2_roll;
   
   wire [3:0]  ia, ib, ic;
   wire        ya, yb;

   tri0        skip; // PULL DOWN skip.

   wire        sn, sz, sl, sv, sx0, sx;
        
   assign ia = { data[5:3], 1'b0 };
   assign ib = data[9:6];
   assign ic = { sig_op1_branch, sig_op2_roll, yb, ya};

   // Roll logic.
   or or_cd74hc4075e_a (sig_op2_roll, data[2], data[1], data[0]); // 1/3 of a 4075 (or equiv)

   // Skip logic I: calculate SN, SZ, SL.
   and and_cd7408_a (sn, f_neg, data[3]);
   and and_cd7408_b (sz, f_zero, data[2]);
   and and_cd7408_c (sl, f_l, data[1]);
   and and_cd7408_d (sv, f_v, data[0]);

   // Skip logic II: (SN + SZ + SL + SV) XNOR data[3]
   or or_cd74hc4075e_b (sx0, sn, sz, sl);
   or or_cd74hc4075e_b (sx, sv, 1'b0, sx0);
   xor xnor_74266_a (sig_op1_branch, sx, data[4]);
   
   // We use three '253 muxes (two 74x253 ICs) to select the signals.
   mux_253 mux_ab (sel[1:0], ia, enable, ya, ib, 0, yb);
   mux_253 mux_c  (sel[3:2], ic, enable, skip, 4'b0000, 1, );

   // The OP termination circuitry.
   wire        if9e, if8e, if7e, if6e, if5e, if4e, if3e;
   wire        if9z, if8z, if7z, if6z, if5z, if4z, if3z;

   wire [7:0]  opif;
   demux_138 optdemux (1, 0, sel[3], sel[2:0], opif);
   
   or #6 (if3z, data[3], data[2], data[1], data[0]);
   or #6 (if4z, if3z, data[4]);
   or #6 (if5z, if4z, data[5]);
   or #6 (if6z, if5z, data[6]);
   or #6 (if7z, if6z, data[7]);
   or #6 (if8z, if7z, data[8]);
   or #6 (if9z, if8z, data[9]);

   or #6 (if3e, if3z, opif[1]);
   or #6 (if4e, if4z, opif[2]);
   or #6 (if5e, if5z, opif[3]);
   or #6 (if6e, if6z, opif[4]);
   or #6 (if7e, if7z, opif[5]);
   or #6 (if8e, if8z, opif[6]);
   or #6 (if9e, if9z, opif[7]);

   and #10 (ifend, if3e, if4e, if5e, if6e, if7e, if8e, if9e);

endmodule // skip_unit


module skip_unit_v1(clk1, nreset,
		 ir, opif, fneg, fzero, fl, fv,
		 nskip);
   
   input        clk1, nreset;
   input [15:0] ir;
   input [3:0] 	opif;
   input 	fneg, fzero, fl, fv;

   output 	nskip;

   wire 	clk1, nreset;
   wire [15:0] 	ir;
   wire [3:0] 	opif;
   wire 	fneg, fzero, fl, fv;

   wire 	nskip;

   wire 	sv, sl, sz, sn;

   // Flag (macrocode) skip logic, for branch instructions. This simultaneously
   // detects if a branch instruction has been specified and if the branch
   // should be taken.
   and #6 (sv, fv, ir[0]);
   and #6 (sl, fl, ir[1]);
   and #6 (sz, fzero, ir[2]);
   and #6 (sn, fneg, ir[3]);

   // Second level of the gate tree
   wire 	sa, sb, s;
   or #6 (sa, sv, sl);
   or #6 (sb, sz, sn);

   // Third level of the gate tree
   or #6 (s, sa, sb);

   // The XOR gate allows us to negate the branch semantics when IR4 is set.
   wire 	op1_branch;
   xor #11 (op1_branch, s, ir[4]);

   
   // IR (microcode) skip logic for roll instructions.
   wire 	b, op2_roll;
   or #6 (b, ir[0], ir[1]);
   or #6 (op2_roll, b, ir[2]);


   // Condition multiplexing
   tri1 	skipmuxlo, skipmuxhi, nopif3;
   nand #6 (nopif3, opif[3], 1'b1); // Negation with NAND
   mux_251 muxlo (opif[2:0], {ir[9:3], 1'b1}, opif[3], skipmuxlo, );
   mux_251 muxhi (opif[2:0], {op1_branch, op2_roll, fneg, fzero, fl, fv, 2'b1}, nopif3, skipmuxhi, );

   // Combine the outputs
   wire 	skip0, skip1;
   nand #6 (skip0, skipmuxlo, skipmuxhi);
   nand #6 (skip1, skip0, 1'b1); // Negation with NAND

   // Register SKIP# for the duration of this micro-instruction.
   wire [3:0] 	nq;
   flipflop_175 skipff ({3'b0, skip1}, , nq, clk1, nreset);
   assign nskip = nq[0];

endmodule // skip_unit
`endif //  `ifdef OLD_VERSIONS


///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module skip_unit(nreset, clk4,
		 ir, cond, fv, fl, fz, fn,
		 nskipext,
		 nskip);
   
   input        clk4;
   input 	nreset;
   input [6:0] 	ir;
   input [4:0] 	cond;
   input 	fv;
   input 	fl;
   input 	fz;
   input 	fn;
   input 	nskipext;

   output 	nskip;

   wire 	clk4, nreset;
   wire [6:0] 	ir;
   wire [4:0] 	cond;
   wire 	fv, fl, fz, fn;
   
   wire 	nskip;

   wire 	sv, sl, sz, sn;

   // Cond address decoder using a 74HC139 (one unit unused)
   wire [3:0] 	y;
   wire 	ncondcs0, ncondcs1;
   demux_139h cond_decoder (.g(1'b0), .a(cond[4:3]), .y(y));
   assign ncondcs0 = y[0];
   assign ncondcs1 = y[1];

   // The condition multiplexers. Two of them decode up to 16 COND addresses
   // (half of the address space). They output an INVERTED signal.
   tri1 	nskip0, nskip1, branch_;
   mux_251 cond_mux0 (.sel(cond[2:0]), .d({ir[6:0], 1'b0}),                       .e(ncondcs0), .w(nskip0));
   mux_251 cond_mux1 (.sel(cond[2:0]), .d({branch_, 1'b0, fn, fz, fl, fv, 2'b0}), .e(ncondcs1), .w(nskip1));

   // Combine the outputs
   wire 	nskipd;
   assign #6 nskipd = nskip0 & nskip1 & nskipext;

   // Register the skip value on the rising edge of CLK4 (end of processor
   // cycle)
   flipflop_74h skip_reg (.d(nskipd), .clk(clk4), .set(nreset), .rst(1'b1), .q(nskip));

   // Now for the branch logic. This is stole^Wheavily inspired by the PDP-8
   // branch unit.
   and #6 (sv, fv, ir[0]);
   and #6 (sl, fl, ir[1]);
   and #6 (sz, fz, ir[2]);
   and #6 (sn, fn, ir[3]);

   // Second stage
   wire 	szn, svl, s;
   or #6 (szn, sz, sn);
   or #6 (svl, sv, sl);

   // Third stage
   or #6 (s, szn, svl);

   // Fourth stage: the XOR gate allows us to negate the branch semantics when
   // IR4 is set.
   xor #11 (branch_, s, ir[4]);

endmodule // skip_unit

     
`endif //  `ifndef skip_unit_v
