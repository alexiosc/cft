///////////////////////////////////////////////////////////////////////////////
//
// PB1-SBL.v -- Processor Board A, Skip/Branch Logic
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
//
///////////////////////////////////////////////////////////////////////////////

`include "counter.v"
`include "buffer.v"
`include "vibrator.v"
`include "demux.v"
`include "flipflop.v"
`include "mux.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board A, Skip/Branch Logic
//
///////////////////////////////////////////////////////////////////////////////

module PB1_SBL(nreset, clk4, fv, fl, fz, fn, ir, opif,
			     nskipext, nskip);

   input        nreset;
   input 	clk4;
   input 	fv;
   input 	fl;
   input 	fz;
   input        fn;
   input [9:0]  ir;
   input [3:0] 	opif;
   inout tri1 	nskipext;	// Open drain input

   output 	nskip;

   wire 	sv, sl, sz, sn, svl, szn, svlzn, op1_branch;

   // The OP2 skip logic is simpler than it looks.
   and #6 ic030a_08_skip0 (sv, fv, ir[0]);
   and #6 ic030b_08_skip0 (sl, fl, ir[1]);
   and #6 ic030c_08_skip0 (sz, fz, ir[2]);
   and #6 ic030d_08_skip0 (sn, fn, ir[3]);

   or #6 ic029a_32_skip1 (svl, sv, sl);
   or #6 ic029b_32_skip1 (szn, sz, sn);

   or #6 ic029c_32_skip2 (svlzn, svl, szn);

   wire ir4;
   assign ir4 = ir[4];
   xor #7 ic031a_86_skip3 (op1_branch, svlzn, ir4);
   //wire nir4;
   //not #6 ic024f_04_skip2 (nir4, ir[4]);
   //xor #7 ic031a_86_skip3 (op1_branch, svlzn, nir4);


   // Detect when OP1 roll is used: ir[0] | ir[1] | ir[2]
   //wire           roll0, op2_roll;
   //or #6 ic032a_32_roll0 (roll0, ir[0], ir[1]);
   //or #6 ic032b_32_roll1 (op2_roll, roll0, ir[2]);
   wire op2_roll;
   //nor #6 ic41_27_roll(op2_roll, ir[0], ir[1], ir[2]);
   or #6 ic41_xxx_roll(op2_roll, ir[0], ir[1], ir[2]);
   


   // Condition multiplexers. CAUTION: the multiplexer can generate glitches,
   // but we use a register to filter them out.

   tri1 	  _skipmuxlo, _skipmuxhi;
   mux_251 ic034_251_sblmuxlo (.d({ir[9:3], 1'b0}),
			       .sel(opif[2:0]), .e(opif[3]), .w(_skipmuxlo));

   wire 	  _nopif3;
   not #6 ic33a_00_nopif3 (_nopif3, opif[3]);
   mux_251 ic035_251_sblmuxhi (.d({op1_branch, op2_roll, fn, fz, fl, fv, 2'b00}),
			       .sel(opif[2:0]), .e(_nopif3), .w(_skipmuxhi));

   // The outputs of the multiplexers are 2:1 multiplexed by tri-stating them,
   // pulling their outputs up, and using a NAND gate. This yields an
   // active-low (inverted) output for the skip flag.

   //wire 	  _nskip;
   //and #6 ic7_08_sblmux (_nskip, _skipmuxlo, _skipmuxhi);

   // This is further NANDed with the open drain SKIPEXT# signal, used to
   // create new skip conditions via expansion hardware (or to force skips,
   // depending on the microprogram being executed). The result is an
   // active-high skip flag.

   //wire 	  _skip;
   //and #6 ic6_08_skipext (_skip, _nskip, nskipext);


   wire 	  nskip0;
   and #4 (nskip0, _skipmuxlo, _skipmuxhi, nskipext);

   // This flag is registered on the raising edge of CLK4. THe INVERTED (active
   // low) output is sent to the microcode store, where it acts as part of the
   // microprogram address.
   flipflop_74h ic36a_74_skip (.d(nskip0), .clk(clk4), .set(nreset), .rst(1),
			       .q(nskip));

   
endmodule // PB1_SBL

// End of file.
