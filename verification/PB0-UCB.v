///////////////////////////////////////////////////////////////////////////////
//
// PB0-UCB.v -- Processor Board, Microcode Banking Extension
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

`include "rom.v"
`include "demux.v"
`include "flipflop.v"
`include "mux.v"

`timescale 1ns/1ps


`ifndef BASEDIR
 `define BASEDIR ".."
`endif // BASEDIR


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board: uCB extension
//
///////////////////////////////////////////////////////////////////////////////

module PB0_UCB(nreset, nsysdev, nw, ab, nend, ucb, ninhibit_irq);

   input 	nreset;
   input 	nsysdev;
   input 	nw;
   input [15:0] ab;
   input 	nend;
   
   wire 	nen;
   wire [7:0] 	y;
   wire 	nsetucbp;
   wire 	nsetucbt;

   output [3:0] ucb;
   output 	ninhibit_irq;

   assign ninhibit_irq = nucba_ucbb;

   or #6 ic4a_32(nen, nsysdev, nw);
   demux_138 ic5_138_address(.g1(1), .g2a(ab[7]), .g2b(nen),
			     .a(ab[6:4]), .y(y));
   assign nsetucbp = y[0];
   assign nsetucbt = y[1];

   // Registration

   // The permanent bank register
   wire [3:0] 	  ucba;
   flipflop_175 ic6_175_regperm(.d(ab[3:0]), .q(ucba),
                                .clk(nsetucbp), .rst(nreset));
   
   // The temporary bank register
   wire [3:0] 	  ucbb;
   flipflop_175 ic7_175_regtemp(.d(ab[3:0]), .q(ucbb),
                                .clk(nsetucbt), .rst(nreset));

   // The sequencer for temporary bank selection. This sets the
   // temporary bank for the instruction following the currently
   // executing one.

   // _______       ___________   __________________________________
   // SETUCBT                  \_/
   // ___           ______   ______   ______   ______   ______   ___
   // END                 \_/      \_/      \_/      \_/      \_/
   //                       :        :        :        :        :
   // Instruction   1111111122222222233333333344444444455555555566...
   //
   // TODO: complete this
   wire [3:0] 	  seq, nseq, ucbmux;
   wire           nucba_ucbb;

   wire           tmp;
   flipflop_74h ic8a_74_tempseq(.set(nsetucbt), .rst(nreset),
                                .d(0), .clk(nend),
                                .q(nucba_ucbb));

   // Multiplexer for UCB bank registers
   mux_157 ic9_157_bankmux(.sel(nucba_ucbb),
                           .i1(ucba), .i2(ucbb), .oe(0), .y(ucbmux));

   // Final register (delay by one END# pulse)
   flipflop_175 ic10_175_bankreg(.d(ucbmux), .q(ucb),
                                 .clk(nend), .rst(nreset));
endmodule // PB0_UCB

// End of file.
