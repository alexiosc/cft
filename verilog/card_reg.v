///////////////////////////////////////////////////////////////////////////////
//
// THE REG BOARD
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// cft-reg.v -- The CFT's REG Board
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

`ifndef card_reg_v
`define card_reg_v

`include "demux.v"
`include "reg_major.v"

`timescale 1ns/1ps

// All cards start with card_ and have identical port definitions.

module card_reg(
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

   inout         nreset;	// Open drain, various drivers.
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
   input 	 nwaiting;	// Wait State Acknowledge from BUS Board

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

   wire [15:0]   pc;		// Only bits 15:10 are output though
   wire 	 nfppch;
   wire 	 nfppcl;
   wire 	 nfpdrh;
   wire 	 nfpdrl;
   wire 	 nfpach;
   wire 	 nfpacl;
   wire 	 nfpsph;
   wire 	 nfpspl;
   wire [15:0] 	 ac;
   wire 	 fz;
   wire 	 naccpl;

   assign cport[6:1] = pc[15:10];
   assign nfppch = cport[11];
   assign nfppcl = cport[12];
   assign nfpdrh = cport[13];
   assign nfpdrl = cport[14];
   assign nfpach = cport[15];
   assign nfpacl = cport[16];
   assign nfpsph = cport[17];
   assign nfpspl = cport[18];
   assign cport[38:23] = ac[15:0];
   assign cport[39] = fz;
   assign cport[40] = naccpl;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // LOCAL SIGNALS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	 reset;
   wire [7:0] 	 raddr_y;
   wire [7:0] 	 waddr_y;
   wire [7:0] 	 action_y;

   wire 	 nread_pc;
   wire 	 nread_dr;
   wire 	 nread_ac;
   wire 	 nread_sp;

   wire 	 nwrite_pc;
   wire 	 nwrite_dr;
   wire 	 nwrite_ac;
   wire 	 nwrite_sp;

   wire 	 naction_incpc;
   wire 	 naction_incdr;
   wire 	 naction_decdr;
   wire 	 naction_incac;
   wire 	 naction_decac;
   wire 	 naction_incsp;
   wire 	 naction_decsp;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // RADDR, WADDR & ACTION DECODERS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // First, the RESET signal: inverted from nRESET
   assign #7 reset = ~nreset;

   // Now, the three decoders
   demux_138 raddr_decoder (.g1(raddr[3]), .ng2a(raddr[4]), .ng2b(1'b0), .a(raddr[2:0]), .y(raddr_y));
   demux_138 waddr_decoder (.g1(waddr[3]), .ng2a(waddr[4]), .ng2b(clk4), .a(waddr[2:0]), .y(waddr_y));
   demux_138 action_decoder (.g1(action[3]), .ng2a(clk3), .ng2b(1'b0), .a(action[2:0]), .y(action_y));

   assign nread_pc = raddr_y[0];
   assign nread_dr = raddr_y[1];
   assign nread_ac = raddr_y[2];
   assign nread_sp = raddr_y[3];

   assign nwrite_pc = waddr_y[0];
   assign nwrite_dr = waddr_y[1];
   assign nwrite_ac = waddr_y[2];
   assign nwrite_sp = waddr_y[3];
   
   assign naction_incpc = action_y[0];
   assign naction_incdr = action_y[2];
   assign naction_decdr = action_y[3];
   assign naction_incac = action_y[4];
   assign naction_decac = action_y[5];
   assign naction_incsp = action_y[6];
   assign naction_decsp = action_y[7];

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE FOUR MAJOR REGISTERS THEMSELVES
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The Program Counter (PC): increment and output
   wire 	 naction_incpc1;

   assign #20 naction_incpc1 = (action == 4'b1000) ? 1'b0 : 1'b1;
   reg_major reg_pc (
		     .reset(reset),
		     .ibus(ibus),
		     .nread(nread_pc),
		     .nwrite(nwrite_pc),
		     .ninc(naction_incpc),
		     .ndec(1'b1),
		     .out(pc),	// Only PC[15:10] is used.
		     .nfpl(nfppcl),
		     .nfph(nfppch),
		     .fpd(fpd));

   // The Data Register (DR): increment & decrement
   reg_major reg_dr (
		     .reset(reset),
		     .ibus(ibus),
		     .nread(nread_dr),
		     .nwrite(nwrite_dr),
		     .ninc(naction_incdr),
		     .ndec(naction_decdr),
		     .nfpl(nfpdrl),
		     .nfph(nfpdrh),
		     .fpd(fpd));

   // The Accumulator (AC): increment, decrement, flags and output
   reg_major reg_ac (
		     .reset(reset),
		     .ibus(ibus),
		     .nread(nread_ac),
		     .nwrite(nwrite_ac),
		     .ninc(naction_incac),
		     .ndec(naction_decac),
		     .out(ac),
		     .fz(fz),
		     .naccpl(naccpl),
		     .nfpl(nfpacl),
		     .nfph(nfpach),
		     .fpd(fpd));

   // The Stack Pointer (SP): increment & decrement
   reg_major reg_sp (
		     .reset(reset),
		     .ibus(ibus),
		     .nread(nread_sp),
		     .nwrite(nwrite_sp),
		     .ninc(naction_incsp),
		     .ndec(naction_decsp),
		     .nfpl(nfpspl),
		     .nfph(nfpsph),
		     .fpd(fpd));

endmodule // card_reg

`endif // card_reg_v
