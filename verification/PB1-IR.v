///////////////////////////////////////////////////////////////////////////////
//
// PB1-IR.v -- Processor Board A, Istruction Register
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
// Processor Board A, Instruction Register
//
///////////////////////////////////////////////////////////////////////////////

module PB1_IR(ibus, nwir, ir);

   input [15:0] ibus;
   input 	nwir;		// Clock IR value from IBUS

   output [15:0] ir;
   
   // We do not model the buffers for the front panel LEDs.

   // TODO: FIX THIS, 573s don't have reset!
   latch_573 ic040_573_irlo (.d(ibus[7:0]), .q(ir[7:0]),
				.nle(nwir), .noe(0));
   
   latch_573 ic041_573_irhi (.d(ibus[15:8]), .q(ir[15:8]),
				.nle(nwir), .noe(0));
endmodule // PB1_IR


// End of file.
