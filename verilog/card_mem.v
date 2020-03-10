///////////////////////////////////////////////////////////////////////////////
//
// A SIMPLE MEMORY BOARD
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// cft-mem.v -- A simple memory board
//
// Copyright © 2011–2020 Alexios Chouchoulas
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

`ifndef card_mem_v
`define card_mem_v

`include "demux.v"
`include "ram.v"
`include "rom.v"

`timescale 1ns/1ps

// All cards start with card_ and have identical port definitions.

module card_mem(
		nreset, nrsthold,            // Reset
		clk1, clk2, clk3, clk4, t34, // Clock
		nirq, nirqs,                 // Unexpanded Interrupts
		nsysdev,                     // I/O space decoder, I/O 000-0FF
		niodev1xx,		     // I/O space 100-1FF
		niodev2xx,		     // I/O space 200-2FF
		niodev3xx,		     // I/O space 300-3FF
		nmem, nio, nw, nr, nws,      // Bus transactions
		ab,                          // 24-bit address bus
		db,                          // 16-bit data bus
		nirqn,                       // Expanded interrupts (nIRQ0–nIRQ7)
		nhalt, nendext, nskipext,    // Run control for processor extensions
		ibus,                        // Processor bus
		raddr, waddr, action,        // Microcode fields
		fpd,			     // 8-bit front panel bus
		cport,                       // C port, unbussed pins on backplane
		rsvd,                        // Reserved for bussed expansion
		wstb, nruen, nwuen,          // Removed, kept for expansion
                );

   input         nreset;	// Open drain, various drivers.
   input 	 nrsthold;	// Driven by the reset unit.

   input 	 clk1;		// Output by the clock unit.
   input 	 clk2;		// Output by the clock unit.
   input 	 clk3;		// Output by the clock unit.
   input 	 clk4;		// Output by the clock unit.
   input 	 t34;		// Output by the clock unit.

   input 	 nirq;		// Input to the ISM
   input 	 nirqs;		// Interrupt acknowledge, driven by the ISM

   input 	 nsysdev;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev1xx;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev2xx;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev3xx;	// Driven by the I/O addr decoder (BUS board)

   input 	 nmem;		// Microcode store output
   input 	 nio;		// Microcode store output
   input 	 nw;		// Driven by the BUS board.
   input 	 nr;		// Microcode store output
   input 	 nws;		// Open drain, handled by BUS board

   input [23:0]  ab;		// 24-bit address bus
   input [15:0]  db;		// 16-bit data bus

   input [7:0] 	 nirqn;		// Open drain extended IRQs (INT board)

   input 	 nhalt;		// Open drain, multiple readers
   input 	 nendext;	// Open drain, handled by the microcode sequencer
   input 	 nskipext;	// Open drain, handled by SBU

   inout [15:0]  ibus;		// 16-bit processor bus
   input [4:0] 	 raddr;		// 5-bit IBus read address
   input [4:0] 	 waddr;		// 5-bit IBus write address
   input [3:0] 	 action;	// 4-bit action address (STI, CLI, etc.)

   output [7:0]  fpd;		// 8-bit front panel data
   inout [40:1]  cport;		// The unbussed backplane port. User-defined.

   inout  [4:1]	 rsvd;		// Reserved bussed pins
   inout 	 wstb;		// Removed, kept for expansion
   inout 	 nruen;		// Removed, kept for expansion
   inout 	 nwuen;		// Removed, kept for expansion

   // Wire definitions for the above.

   wire          nreset, nrsthold, clk1, clk2, clk3, clk4, t34;
   wire 	 nirq, nirqs, nsysdev, niodev1xx, niodev2xx, niodev3xx;
   wire   	 nmem, nio, nw, nr, nws, nhalt, nendext, nskipext;
   wire  	 wstb, nruen, nwuen;
   wire [23:0] 	 ab;
   wire [15:0] 	 db;
   wire [7:0] 	 nirqn;
   wire [15:0] 	 ibus;
   wire [7:0] 	 fpd;
   wire [40:1] 	 cport;
   wire [4:1] 	 rsvd;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // A SIMPLE VERSION OF THE MEM CARD
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Note: the physical card only uses ncs[11:0], but we only use ncs[0] anyway.
   wire [15:0] 	 ncs;
   demux_138 dec_lo (.a(ab[21:19]), .g1(1'b1), .ng2a(ab[22]), .ng2b(ab[23]), .y(ncs[7:0]));
   demux_138 dec_hi (.a(ab[21:19]), .g1(ab[22]), .ng2a(ab[23]), .ng2b(1'b0), .y(ncs[15:8]));

   wire [7:0] 	 nromcs;
   demux_138 dec_rom (.a(ab[21:19]), .g1(ab[23]), .ng2a(ab[22]), .ng2b(1'b0), .y(nromcs));

   wire 	 nmemr, nmemw;

   // Note: This is probably better done with a smaller '1G139, which also
   // provides safety interlocking as a side effect. Too late though, the
   // card's been made now and it's just extra paranoia anyway.
   assign #7 nmemr = nmem | nr;
   assign #7 nmemw = nmem | nw;

   // 512K RAM
   sram #(19) ramlo (.a(ab[18:0]), .d(db[7:0]), .nce(ncs[0]), .nwe(nmemw), .noe(nmemr));
   sram #(19) ramhi (.a(ab[18:0]), .d(db[15:8]), .nce(ncs[0]), .nwe(nmemw), .noe(nmemr));

   // Another 512K RAM where the ROM should be is, so that individual
   // testbenches can load their own ROM images at will with
   // $readmemb(). Obviously, writing is disabled.
   sram #(19) romlo (.a(ab[18:0]), .d(db[7:0]), .nce(nromcs[0]), .nwe(1'b1), .noe(nmemr));
   sram #(19) romhi (.a(ab[18:0]), .d(db[15:8]), .nce(nromcs[0]), .nwe(1'b1), .noe(nmemr));

   // If instructed, load ROM and/or ROM images for simulation.
   reg [4096:0]  basename, imglo, imghi;
   initial begin
      // Load a RAM image
      if ($value$plusargs("ram=%s", basename)) begin
	 $sformat(imglo, "%-0s-00.list", basename);
	 $sformat(imghi, "%-0s-01.list", basename);
	 // We have two groups of srams, so read in two halves.
	 $readmemb(imglo, ramlo);
	 $readmemb(imghi, ramhi);
      end
      // Load a ROM image
      if ($value$plusargs("rom=%s", basename)) begin
	 $sformat(imglo, "%-0s-00.list", basename);
	 $sformat(imghi, "%-0s-01.list", basename);
	 // We have two groups of srams, so read in two halves.
	 $readmemb(imglo, romlo);
	 $readmemb(imghi, romhi);
      end
   end

endmodule // card_mem

`endif // card_mem_v
