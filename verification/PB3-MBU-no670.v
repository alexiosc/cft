///////////////////////////////////////////////////////////////////////////////
//
// PB3-MBU-no670.v -- Processor Board C, Memory Banking Unit
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
`include "comparator.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board C, MBU without 74670 register file chips
//
///////////////////////////////////////////////////////////////////////////////

// This is a full expansion card (just colocated with Processor Board
// C, so it has access to the entire CFT Expansion Bus.
// but. Not all of these signals will be used, of course.

// Update: it does, of course, have an input from the front panel, namely the
// FPRAM signal. This comes from the processor board since the front panel
// connects to the processor board.

module PB3_MBU(
			     // DIN-41612 (partial)
			     ab,         // 16-bit address bus
			     aext,       // 8-bit address bus extension
			     db,         // 16-bit data bus
			     nmem,       // memory strobe, active low
			     nw,         // write strobe, active low
			     nreset,     // reset machine, open drain
			     nsysdev,    // I/O 0000-00FF selected

			     // From Processor Board B
			     nfpram,     // 1 = RAM/ROM bootstrap, 0 = RAM only
			     banking	 // Front panel output
			     );


   // Expansion connector (DIN 41612)
   input [15:0] ab;        // 16-bit address bus
   inout [15:0] db;        // 16-bit data bus
   input 	nmem;      // memory strobe, active low
   input  	nw;        // write strobe, active low
   input 	nreset;    // reset machine, open drain
   input 	nsysdev;   // I/O 0000-00FF selected

   output [7:0] aext;	   // 8-bit address bus extension
   inout	nfpram;    // memory map configuration switch (front panel)
   output 	banking;   // front panel output

   pullup(nfpram);

   // Address decoder

   wire 	nmbusel;

   comparator_688 ic114_688_mbusel(.a({3'b000, ab[7:3]}),
				   .b(8'b0000_1000),
				   .en(nsysdev),
				   .equal(nmbusel));
   
   wire [7:0] 	nbankw;
   demux_138 ic115_138_out(.g1(1), .g2a(nw), .g2b(nmbusel),
			   .a(ab[2:0]), .y(nbankw));
   
   wire [7:0] 	nbankr;
   demux_138 ic116_138_read(.g1(1), .g2a(nmem), .g2b(0),
			    .a(ab[15:13]), .y(nbankr));


   // Banking enable register

   wire 	banking, nbanking;
   
   flipflop_74h ic117a_74_reg (.set(1), .rst(nreset), .d(db[8]), .clk(nbankw[7]),
			       .q(banking), .qn(nbanking));


   // The eight bank registers
   wire [7:0] 	ae;

   flipflop_574 ic118_574_bank (.d(db[7:0]), .q(ae), .clk(nbankw[0]), .oe(nbankr[0]));
   flipflop_574 ic119_574_bank (.d(db[7:0]), .q(ae), .clk(nbankw[1]), .oe(nbankr[1]));
   flipflop_574 ic120_574_bank (.d(db[7:0]), .q(ae), .clk(nbankw[2]), .oe(nbankr[2]));
   flipflop_574 ic121_574_bank (.d(db[7:0]), .q(ae), .clk(nbankw[3]), .oe(nbankr[3]));
   flipflop_574 ic122_574_bank (.d(db[7:0]), .q(ae), .clk(nbankw[4]), .oe(nbankr[4]));
   flipflop_574 ic123_574_bank (.d(db[7:0]), .q(ae), .clk(nbankw[5]), .oe(nbankr[5]));
   flipflop_574 ic124_574_bank (.d(db[7:0]), .q(ae), .clk(nbankw[6]), .oe(nbankr[6]));
   flipflop_574 ic125_574_bank (.d(db[7:0]), .q(ae), .clk(nbankw[7]), .oe(nbankr[7]));
   // These are the only variations:                            ***             ***


   // Hardwired mapping MUX. Calculates bits 3 and 7 of the hardwired
   // mapping based on this truth table:

   // NFPRAM    AB15     HWA2    HWA7
   // --------------------------------
   //   0        0        0        0
   //   0        1        1        0
   //   1        0        0        0
   //   1        1        0        1

   wire 	a2, a7;
   wire 	a15, a14, a13;

   // Simulate bus hold (badly, but we don't care)
   pullup(a15);
   pullup(a14);
   pullup(a13);
   assign a15 = ab[15];
   assign a14 = ab[14];
   assign a13 = ab[13];
	       
   mux_253 ic129_253_hardmap (.sel({nfpram, a15}),
			      .i1(4'b0010), .oe1(0), .y1(a2),
			      .i2(4'b1000), .oe2(0), .y2(a7));
   
   // This buffer provides a hardwired (front-panel controlled) memory mapping
   // before the MBU is initialised. The mapping includes either the first 64kW
   // of RAM (RAM/ROM front panel switch in the RAM position), or the first
   // 32kW of RAM at logical locations 0000-7FFF and the first 32kW of ROM at
   // 8000-FFFF.

   buffer_541 ic126_541_hardmap (.a({a7, 4'b0000, a2, a14, a13}),
				 .y(aext),
				 .oe1(banking),
				 .oe2(nmem));


   // This buffer provides the programmable mapping once the MBU has been
   // enabled. It and the buffer above are mutually exclusively tri-stated by
   // the '74 register above.

   buffer_541 ic127_541_softmap (.a(ae), .y(aext), .oe1(nbanking), .oe2(0));


   // The 74HC541 buffer for the AEXT0-7 signals to the front panel lights is
   // not modelled.

   
   
endmodule // PB3_MBU




// End of file.
