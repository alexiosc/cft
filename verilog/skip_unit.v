///////////////////////////////////////////////////////////////////////////////
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

`timescale 1ns/1ps


module skip_unit(sel, data, f_zero, f_neg, f_l, f_v, enable, skip);
   input [3:0] sel;
   input [9:0] data;
   input       f_zero, f_neg, f_l, f_v, enable;
   
   output      skip;
   
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
endmodule // skip_unit

`endif //  `ifndef skip_unit_v
