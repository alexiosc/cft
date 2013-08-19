///////////////////////////////////////////////////////////////////////////////
//
// PB2-AR.v -- Processor Board B, Address Register
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
// Processor Board B, Address Register
//
///////////////////////////////////////////////////////////////////////////////

module PB2_AR(ibus, nwar, nmem, nio, ar,
	      naben, ar, abus);

   input [15:0]  ibus;
   input 	 nwar;		// Clock AR value from IBUS
   input 	 nmem;		// MEM# strobe
   input 	 nio;		// IO# strobe

   output [15:0] ar;		// The AR (for the IOD, debugging or
				// the front panel)
   output 	 naben;		// ABEN#: address bus enable (active low)
   output [15:0] abus;		// The address bus
   

   // We do not model the buffers for the front panel LEDs.
   
   flipflop_574 ic056_574_arlo (.d(ibus[7:0]), .q(ar[7:0]),
				.clk(nwar), .oe(0));
   
   flipflop_574 ic057_574_arhi (.d(ibus[15:8]), .q(ar[15:8]),
				.clk(nwar), .oe(0));

   // Tri-stating support
   and #7 ic055a_08_aben (naben, nmem, nio);

   buffer_541 ic058_541_ablo(.oe1(naben), .oe2(0),
			     .a(ar[7:0]), .y(abus[7:0]));
   buffer_541 ic059_541_abhi(.oe1(naben), .oe2(0),
			     .a(ar[15:8]), .y(abus[15:8]));

   // Address bus hold is not modelled here. It's moved to the Microcode board.
   

endmodule // PB2_AR


// End of file.
