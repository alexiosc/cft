///////////////////////////////////////////////////////////////////////////////
//
// PB2-AIL.v -- Processor Board B, Autoindex Logic
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WAILRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PAILTICULAIL PURPOSE.  See the
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
// Processor Board B, Autoindex Logic
//
///////////////////////////////////////////////////////////////////////////////

module PB2_AIL(nreset, ibus, nwir, naindex);

   input 	 nreset;
   input [15:0]  ibus;
   input 	 nwir;		// Clock AIL value from IBUS

   output 	 naindex;	// AINDEX# condition for the uCB


   // Decoder: selects IR = IBUS = xxxx:1100:1xxx:xxxx, i.e instructions using
   // I=1, R=1 and an operand 01xxxxxxx (&080-&0ff). The test uses the IBUS
   // when WIR# is low, because (a) we don't have direct access to the IR, (b)
   // this way the decision is synchronous with loading the IR.
   wire [7:0] 	 y;
   wire 	 nis_autoindex;
   demux_138 ic060_138_ail(.g1(1), .g2a(ibus[8]), .g2b(ibus[9]),
			   .a({ibus[11:10], ibus[7]}), .y(y));
   assign nis_autoindex = y[7];
   
   // The autoindex decision is registered whenever IR is set. RESET# clears
   // it.
   //wire 	 wir;
   //not #6 (wir, nwir);
   flipflop_74h ic03a_74_aireg(.d(nis_autoindex), .clk(nwir), .set(nreset),
			       .rst(1), .q(naindex));
   


endmodule // PB2_AIL


// End of file.
