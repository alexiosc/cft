///////////////////////////////////////////////////////////////////////////////
//
// PB3-L.v -- Processor Board C, The L Register
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WPCRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PPCTICULPC PURPOSE.  See the
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
// Processor Board C, THE L (LINK/CARRY) REGISTER
//
///////////////////////////////////////////////////////////////////////////////

module PB3_L(nreset, clk1, ncll, ncpl, isroll, roll16, nfltadd,
			   naccpl, fl);

   input nreset;
   input clk1;

   input ncll;			// CLL# from the uCB
   input ncpl;			// CPL# from the uCB
   input isroll;		// ISROLL from the Unary ROM
   input roll16;		// Roll bit 16 from the Unary ROM
   input nfltadd;		// FLTADD# from the Binary ROM
   input naccpl;		// ACCPL# from the AC register

   output fl;


   // Clear L on RESET# or CLL#
   wire  nlclr;
   and #7 ic095a_08_lclr(nlclr, nreset, ncll);

   // Set L to ROLL16 when running a roll instruction
   wire  lk0, lk, lj;
   nand #7 ic096a_00_lk0(lk0, 1, roll16); // Configured as a NOT gate
   and #7 ic095b_08_lk(lk, lk0, isroll);
   and #7 ic095c_08_lj(lj, roll16, isroll);

   // The toggle inputs
   wire  toggle0, toggle1, toggle;
   nand #7 icxx_10_toggle(toggle, ncpl, nfltadd, naccpl);

   // Replaced INCCPL# and DECCPL# with a single ACCPL# signal. Now
   // noly need a single three-input NAND, rather than two two-input
   // NANDs and an OR gate.
   
   //nand #7 ic096c_00_toggle1(toggle1, ninccpl, ndeccpl);
   //or #7 ic096d_00_toggle(toggle, toggle0, toggle1);

   // The J/K inputs
   wire  j, k;
   or #7 ic097a_32_j(j, toggle, lj);
   or #7 ic097b_32_k(k, toggle, lk);

   // Aaaaand, the register itself.
   flipflop_112h ic098a_112_lreg(.set(1), .rst(nlclr),
				 .j(j), .k(k), .clk(clk1),
				 .q(fl));

endmodule // PB3_L


// End of file.
