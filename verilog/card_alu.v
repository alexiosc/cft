///////////////////////////////////////////////////////////////////////////////
//
// THE ALU BOARD
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// cft-alu.v -- The CFT's ALU Board
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

`ifndef card_alu_v
`define card_alu_v

`include "alu_decoder.v"
`include "alu_porta.v"
`include "alu_portb.v"
`include "alu_rom.v"
`include "reg_l.v"

`timescale 1ns/1ps

// All cards start with card_ and have identical port definitions.

module card_alu(
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
   // UNBUSSED INTER-CARD SIGNALS & C PORT CONNECTIONS
   //
   ///////////////////////////////////////////////////////////////////////////////


   ///////////////////////////////////////////////////////////////////////////////
   //
   // LOCAL SIGNALS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	 nromce;
   wire 	 nread_alu_b;
   wire 	 nwrite_alu_b;
   wire 	 naction_cpl;
   wire 	 naction_cll;
   wire 	 naction_sru;
   wire 	 naction_101;	// For future expansion
   wire 	 naction_110;	// For future expansion
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // RADDR, WADDR & ACTION DECODER
   //
   ///////////////////////////////////////////////////////////////////////////////

   alu_decoder (.t34(t34),
		.raddr(raddr),
		.waddr(waddr),
		.action(action), 
		.nromce(nromce),
		.nread_alu_b(nread_alu_b),
		.nwrite_alu_b(nwrite_alu_b),
		.naction_cpl(naction_cpl),
		.naction_cll(naction_cll),
		.naction_sru(naction_sru),
		.naction_101(naction_101),
		.naction_110(naction_110));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE LINK REGISTER/FLAG
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	 flin_add;
   wire 	 flin_sru;
   wire 	 nflagwe;
   wire 	 bcp;
   wire 	 fl;
   wire 	 flfast;
   
   reg_l reg_l (.nreset(nreset),
		.clk4(clk4),
		.naction_cpl(naction_cpl),
		.ibus12(ibus[12]),
		.flin_add(flin_add),
		.flin_sru(flin_sru),
		.nread_alu_add(nread_alu_add),
		.nflagwe(nflagwe),
		.bcp(bcp),
		.naction_cll(naction_cll), 
		.fl(fl),
		.flfast(flfast));


endmodule // card_alu

`endif // card_alu_v
