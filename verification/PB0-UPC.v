///////////////////////////////////////////////////////////////////////////////
//
// PB1-UPC.v -- Processor Board 0, microprogram counter
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
// Processor Board 0, UPC
//
///////////////////////////////////////////////////////////////////////////////

module PB0_UPC(nrsthold, clk4, nhalt, nws, nend, nendext, upc);

   input 	nrsthold;
   input 	clk4;
   input 	nhalt;
   input 	nws;
   input 	nend;
   input 	nendext;
   
   output [3:0] upc;

   wire 	nclr;

   and #6 upcclr(nclr, nendext, nend);
   
   counter_161 upcctr(.mr(nrsthold),
		      .cp(clk4),
   		      .cep(nws), .cet(nhalt),
   		      .pe(nclr), .p(4'b0000),
   		      .q(upc));
   
   
endmodule // PB0_UPC

// End of file.
