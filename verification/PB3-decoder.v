///////////////////////////////////////////////////////////////////////////////
//
// PB3-decoder.v -- Processor Board C, ALU B and Op Decoder
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
// Processor Board C, ALU B REGISTER AND OP DECODER
//
///////////////////////////////////////////////////////////////////////////////

module PB3_decoder(nreset, nrsthold, nt34, runit, ir0, ir2,
		   nuoe, nboe, uop);

   input 	nreset;
   input 	nrsthold;
   input 	nt34;
   input 	clk2;
   input [3:0] 	runit;
   input        ir0;		// Bit 0 of IR
   input        ir2;		// Bit 2 of IR

   output 	nuoe;
   output 	nboe;
   output [2:0] uop;


   // Unary operation decoder
   wire 	opsela;
   or #7 ic101a_32_uop(opsela, runit[0], runit[1]);

   // NOTE: ALUEN# = NOT(CLK1), but we don't have a NOT gate handy so we do it
   // the stupid and slow way. Slow is okay, though. The falling edge of CLK2
   // could be a little too early to engage the ALU.
   wire 	naluen;
   //and #7 ic095c_08_clk(naluen, nt34, clk2);
   assign naluen = nt34;

   mux_253h ic102a_253_uop0(.sel({1'b0, opsela}), .i({2'b00, runit[0], ir0}),
			    .oe(0), .y(uop[0]));

   mux_253h ic102b_253_uop1(.sel({1'b0, opsela}), .i({2'b00, runit[1], ir2}),
			    .oe(0), .y(uop[1]));

   assign uop[2] = opsela;


   // ALU ROM OE# decoder
   wire [7:0] 	y;
   demux_138 ic103_138_oe(.g1(nreset), .g2a(naluen), .g2b(0),
			  .a({nrsthold, runit[3:2]}),
			  .y(y));
   assign nboe = y[6];
   assign nuoe = y[7];

endmodule // PB3_decoder


// End of file.
