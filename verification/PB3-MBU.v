///////////////////////////////////////////////////////////////////////////////
//
// PB3-MBU.v -- Processor Board C, Memory Banking Unit
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
`include "register.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board C, MBU.
//
///////////////////////////////////////////////////////////////////////////////

// This is a full expansion card (just colocated with Processor Board
// C. Not all of these signals will be used, of course.

// The board uses four 74x670 4x4-bit register file chips to form an
// 8×8 dual-ported register file.
//
// There are overall 65 bits of memory in the MBU: eight write-only
// bank registers and one write-only enable bit. When initialised, the
// card is disabled and a ‘hard’ banking configuration is used. This
// depends on the state of the FPRAM# signal. When FPRAM# is low, the
// lowest 64KW of RAM is mapped to the entire CFT address space. When
// FPRAM# is high, the first 32KW of RAM is mapped to the first 32KW
// of the CFT address space, and the first 32KW of ROM is mapped to
// the latter 32KW of the address space.

// The MBU board has nine outputs to the front panel, and one input
// from it. 8 lines for the currently selected bank, 1 line for the
// enable signal, and one input for the FPRAM# switch.

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

   wire [7:0] 	_nmbusel;
   wire 	nmbusel;

   // This decodes SYSDEV:0010:0XXX, i.e. 0000:0000:0010:0XXX or &20-&27.
   demux_138 ic026_138_mbusel(.g1(ab[5]), .g2a(ab[7]), .g2b(nsysdev),
			      .a({ab[6], ab[4], ab[3]}),
			      .y(_nmbusel));
   assign nmbusel = _nmbusel[0];

   wire [0:1] 	nbankw, nbankr;
   wire [3:0] 	_nbankw, _nbankr;
   wire 	nwbanken;

   and #6 (nwbanken, nw, nmbusel);

   // Write decoding
   demux_139h ic30a_139h_wdec (.g(nwbanken), .a({ab[2], 1'b1}), .y(_nbankw));
   assign nbankw[0] = _nbankw[1];
   assign nbankw[1] = _nbankw[3];

   // Read decoding
   demux_139h ic30b_139h_rdec (.g(nmem), .a({ab[15], 1'b1}), .y(_nbankr));
   assign nbankr[0] = _nbankr[1];
   assign nbankr[1] = _nbankr[3];

   // Banking enable register

   wire 	banking, nbanking;
   
   flipflop_74h ic28a_74_reg (.set(nreset), .rst(1), .d(db[8]), .clk(nbankw[0]),
			       .q(nbanking), .qn(banking));

   // Four 74670 4x4 bit register files in a 2x2 formation, making 8
   // 8-bit bank registers.

   wire [7:0] 	ae;

   // Banks 0-3, low nybble
   register_670 ic31_670_r0lo (.d(db[3:0]), .wa(ab[1:0]), .nwe(nbankw[0]),
			       .q(ae[3:0]), .ra(ab[14:13]), .nre(nbankr[0]));
   // Banks 0-3, high nybble
   register_670 ic32_670_r0hi (.d(db[7:4]), .wa(ab[1:0]), .nwe(nbankw[0]),
			       .q(ae[7:4]), .ra(ab[14:13]), .nre(nbankr[0]));

   // Banks 4-7, low nybble
   register_670 ic33_670_r1lo (.d(db[3:0]), .wa(ab[1:0]), .nwe(nbankw[1]),
			       .q(ae[3:0]), .ra(ab[14:13]), .nre(nbankr[1]));
   // Banks 4-7, high nybble
   register_670 ic34_670_r1hi (.d(db[7:4]), .wa(ab[1:0]), .nwe(nbankw[1]),
			       .q(ae[7:4]), .ra(ab[14:13]), .nre(nbankr[1]));



   // Hardwired mapping MUX. Calculates bits 3 and 7 of the hardwired
   // mapping based on this truth table:

   // NFPRAM    AB15     HWA2    HWA7
   // --------------------------------
   //   0        0        0        0
   //   0        1        1        0
   //   1        0        0        0
   //   1        1        0        1

   wire 	hwa2, hwa7;
   wire 	a15, a14, a13;

   // Simulate bus hold (badly, but we don't care)
   pullup(a15);
   pullup(a14);
   pullup(a13);
   assign a15 = ab[15];
   assign a14 = ab[14];
   assign a13 = ab[13];
	       
   mux_253 ic29_253_hardmap (.sel({nfpram, a15}),
			     .i1(4'b0010), .oe1(0), .y1(hwa2),
			     .i2(4'b1000), .oe2(0), .y2(hwa7));
   
   // This buffer provides a hardwired (front-panel controlled) memory mapping
   // before the MBU is initialised. The mapping includes either the first 64kW
   // of RAM (RAM/ROM front panel switch in the RAM position), or the first
   // 32kW of RAM at logical locations 0000-7FFF and the first 32kW of ROM at
   // 8000-FFFF.

   buffer_541 ic36_541_hardmap (.a({hwa7, 4'b0000, hwa2, a14, a13}),
				 .y(aext),
				 .oe1(banking),
				 .oe2(nmem));


   // This buffer provides the programmable mapping once the MBU has been
   // enabled. It and the buffer above are mutually exclusively tri-stated by
   // the '74 register above.

   buffer_541 ic35_541_softmap (.a(ae), .y(aext), .oe1(nbanking), .oe2(0));


   // The 74HC541 buffer for the AEXT0-7 signals to the front panel lights is
   // not modelled.

   
   
endmodule // PB3_MBU




// End of file.
