///////////////////////////////////////////////////////////////////////////////
//
// THE BUS BOARD
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// cft-bus.v -- The CFT's BUS Board
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

`ifndef card_bus_v
`define card_bus_v

`include "reg_ar.v"
`include "mbu.v"
`include "constant_store.v"
`include "databus.v"

`timescale 1ns/1ps

// All cards start with card_ and have identical port definitions.

module card_bus(
		nreset, nrsthold,            // Reset
		clk1, clk2, clk3, clk4, t34, // Clock
		nirq, nirqs,                 // Unexpanded Interrupts
		nsysdev,                     // I/O space decoder, I/O 000-0FF
		niodev1xx,		     // I/O space 100-1FF
		niodev2xx,		     // I/O space 200-2FF
		niodev3xx,		     // I/O space 300-3FF
		nmem, nio, nw, nr, nws,      // Bus transactions
		nwaiting,		     // Wait State acknowledge from BUS board
		ab,                          // 24-bit address bus
		db,                          // 16-bit data bus
		nirqn,                       // Expanded interrupts (nIRQ0–nIRQ7)
		nhalt, nendext, nskipext,    // Run control for processor extensions
		ibus,                        // Processor bus
		raddr, waddr, action,        // Microcode fields
		fpd,			     // 8-bit front panel bus
		cport,                       // C port, unbussed pins on backplane
		rsvd,                        // Reserved for bussed expansion
		wstb, nruen                  // Removed, kept for expansion
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

   output 	 nsysdev;	// Driven by the I/O addr decoder
   output 	 niodev1xx;	// Driven by the I/O addr decoder
   output 	 niodev2xx;	// Driven by the I/O addr decoder
   output	 niodev3xx;	// Driven by the I/O addr decoder

   input 	 nmem;		// Microcode store output
   input 	 nio;		// Microcode store output
   output 	 nw;		// Driven by the databus unit.
   input 	 nr;		// Microcode store output
   inout 	 nws;		// Open drain, handled by BUS board
   output 	 nwaiting;	// Wait State Acknowledge from BUS Board

   output [23:0] ab;		// 24-bit address bus
   inout [15:0]  db;		// 16-bit data bus

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
   // UNBUSSED INTER-CARD SIGNALS & C PORT CONNECTIONS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	 nfparh;	// FP request for ar[23:16]
   wire [2:0] 	 ir2_0;		// IR[2:0] from the Control Unit
   wire 	 nir_idx;	// Input from AIL, use IR[2:0] to select MBn
   wire 	 nwen;		// Input from Control Unit, bus write enable
   wire 	 nfpram_rom;	// Input from DFP to MBU. 0=RAM layout, 1=RAM/ROM
   wire 	 nfpaext;	// FP request for AEXT

   assign ir2_0 = cport[3:1];
   assign nir_idx = cport[39];
   assign nwen = cport[14];
   assign nfpram_rom = cport[38];
   assign nfpaext = cport[39];

   ///////////////////////////////////////////////////////////////////////////////
   //
   // LOCAL SIGNALS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [7:0] 	 aext;		// This feeds into AR[23:16];
   wire 	 nwrite_ar;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE ADDRESS REGISTER
   //
   ///////////////////////////////////////////////////////////////////////////////

   reg_ar reg_ar (.nmem(nmem),
		  .nio(nio),
		  .ibus(ibus),
		  .aext(aext),
		  .nwrite_ar(nwrite_ar),
		  .ab(ab),
		  .nsysdev(nsysdev),
		  .niodev1xx(niodev1xx),
		  .niodev2xx(niodev2xx),
		  .niodev3xx(niodev3xx),
		  .nfparh(nfparh),
		  .fpd(fpd));
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE MEMORY BANKING UNIT (MBU)
   //
   ///////////////////////////////////////////////////////////////////////////////

   mbu mbu (.nreset(nreset),
	    .clk(clk1),
	    .t34(t34),
	    .waddr(waddr),
	    .raddr(raddr),
	    .ir(ir2_0),
	    .nir_idx(nir_idx),
	    .ibus(ibus[7:0]),
	    .aext(aext),
	    .nr(nr),
	    .nw(nw),
	    .ab(ab[7:0]),
	    .db(db),		// Real hardware only receives db[7:0]
	    .nsysdev(nsysdev),
	    .nfpram_rom(nfpram_rom),
	    .nwar(nwrite_ar) // Note port naming difference
	    );

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE CONSTANT STORE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // So nice; so easy!
   constant_store constant_store (.raddr(raddr),
				  .ibus(ibus));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // DATABUS DRIVER
   //
   ///////////////////////////////////////////////////////////////////////////////

   databus databus (.nreset(nreset),
		    .nhalt(nhalt), 
		    .clk3(clk3),
		    .clk4(clk4),
		    .t34(t34),
		    .nmem(nmem),
		    .nio(nio),
		    .nr(nr),
		    .nwen(nwen),
		    .nws(nws),
		    .nwaiting(nwaiting),
		    .ibus(ibus),
		    .nw(nw),
		    .db(db));

endmodule // card_bus

`endif // card_bus_v
