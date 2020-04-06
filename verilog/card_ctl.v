///////////////////////////////////////////////////////////////////////////////
//
// THE CTL BOARD
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// cft-ctl.v -- The CFT's CTL Board
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

`ifndef card_ctl_v
`define card_ctl_v

`include "clock.v"
`include "microcode_sequencer.v"
`include "reg_ir.v"
`include "flag_unit.v"
`include "agl.v"
`include "ail.v"
`include "sbu.v"
`include "ism.v"

`timescale 1ns/1ps

// All cards start with card_ and have identical port definitions.

module card_ctl(
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

   inout         nreset;	// Open drain, various drivers.
   output        nrsthold;	// Driven by the reset unit.

   output 	 clk1;		// Output by the clock unit.
   output 	 clk2;		// Output by the clock unit.
   output 	 clk3;		// Output by the clock unit.
   output 	 clk4;		// Output by the clock unit.
   output 	 t34;		// Output by the clock unit.

   input 	 nirq;		// Input to the ISM
   output 	 nirqs;		// Interrupt acknowledge, driven by the ISM

   input 	 nsysdev;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev1xx;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev2xx;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev3xx;	// Driven by the I/O addr decoder (BUS board)

   output 	 nmem;		// Microcode store output
   output 	 nio;		// Microcode store output
   input 	 nw;		// Driven by the BUS board.
   output 	 nr;		// Microcode store output
   inout 	 nws;		// Open drain, handled by BUS board

   inout  [23:0] ab;		// 24-bit address bus
   inout  [15:0] db;		// 16-bit data bus

   inout  [7:0]	 nirqn;		// Open drain extended IRQs (INT board)

   inout 	 nhalt;		// Open drain, multiple readers
   inout 	 nendext;	// Open drain, handled by the microcode sequencer
   inout 	 nskipext;	// Open drain, handled by SBU

   inout  [15:0] ibus;		// 16-bit processor bus
   output [4:0]  raddr;		// 5-bit IBus read address
   output [4:0]  waddr;		// 5-bit IBus write address
   output [3:0]  action;	// 4-bit action address (STI, CLI, etc.)

   output [7:0]  fpd;		// 8-bit front panel data
   inout  [40:1] cport;		// The unbussed backplane port. User-defined.

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

   wire 	 fpclk;		// ← DFP, slow clock
   wire 	 nfpclk_or_clk;	// ← DFP, clock select (L: slow clock, H: 4 MHz)
   wire 	 nfpreset;	// ← DFP, DFP µCU (totem pole) reset source

   wire 	 fpfetch;	// ← DFP, fetch/execute state decoder output to DFP
   wire 	 nfpua0;	// ← DFP, request µADDR low light group
   wire 	 nfpuc0;	// ← DFP, request Control Vector low
   wire 	 nfpuc1;	// ← DFP, request Control Vector mid
   wire 	 nfpuc2;	// ← DFP, request Control Vector high

   wire 	 nfpirl;	// ← DFP, request IR low
   wire 	 nfpirh;	// ← DFP, request IR high

   wire 	 fl;		// ← ALU, the Link register/flag
   wire 	 fv;		// ← ALU, Overflow flag
   wire 	 fz;		// ← REG, Zero flag
   wire 	 fn;		// ← ALU, Negative flag
   wire 	 nfpflags;	// ← DFP, request flags group
   wire 	 nflagwe;	// → ALU/REG, strobe to write flags from IBus

   wire [15:10]  pc;		// Used by the AGL.

   wire 	 powerok;	// Power Good signal from the PSU (backplane)
   wire 	 in_rsvd;	// microcode addrress vector spare input

   assign cport[7:1] = ir[6:0];
   assign cport[8] = nwen;
   assign fl = cport[9];
   assign fv = cport[10];
   assign cport[11] = nflagwe;
   assign fz = cport[12];
   assign fn = cport[13];
   assign pc[15:10] = cport[19:14];
   assign nfpreset = cport[20];
   assign fpclk = cport[21];
   assign nfpclk_or_clk = cport[22];
   assign cport[23] = fpfetch;
   assign nfpua0 = cport[24];
   assign nfpuc0 = cport[25];
   assign nfpuc1 = cport[26];
   assign nfpuc2 = cport[27];
   assign nfpirl = cport[28];
   assign nfpirh = cport[29];
   assign nfpflags = cport[30];
   assign powerok = cport[31];
   assign cport[36:32] = cond[4:0];
   assign cport[37] = cext8;
   assign cport[38] = cext9;
   assign cport[39] = nir_idx;
   assign in_rsvd = cport[40];

   ///////////////////////////////////////////////////////////////////////////////
   //
   // LOCAL SIGNALS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [4:0]    cond;		// 5-bit conditional selector (output to C Port)
   wire 	 nend;		// End of instruction
   wire [1:0] 	 idx;		// autoindex mode, input from the AIL
   wire 	 ncond;		// conditional result, input from the SBU
   wire 	 nirqsuc;	// interrupt seen, input from the ISM
   wire 	 nwen;		// write enable, output to the BUS board
   wire [15:0] 	 ir;		// The IR output (read by many units!)
   wire 	 nwrite_ir;	// WADDR decoder output (flag unit): write to IR
   wire 	 nread_agl;	// RADDR decoder output: read from the AGL
   wire 	 fi;		// output to the flag unit
   wire 	 cext8;
   wire 	 cext9;
   wire 	 cext10;	// testpoint on board, not on cport
   wire 	 naction_idx;	// Maybe use IR[2:0] to select memory bank.
   wire 	 nidxen;	// Operand is in the auto-indexing range
   wire 	 nir_idx;       // → BUS.MBU, uses IR[2:0] to select memory bank

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE CLOCK GENERATOR
   //
   ///////////////////////////////////////////////////////////////////////////////

   // NB: on the schematics, the clock generator still outputs WSTB. The signal
   // is merely connected to a test pad (for future expansion) in the clock
   // generator schematic, and is not used.
   clock_generator clock_generator (.nreset(nreset),
				    .fpclk(fpclk),
				    .nfpclk_or_clk(nfpclk_or_clk),
				    .clk1(clk1),
				    .clk2(clk2),
				    .clk3(clk3),
				    .clk4(clk4),
				    .t34(t34),
				    .nrsthold(nrsthold));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE MICROCODE SEQUENCER
   //
   ///////////////////////////////////////////////////////////////////////////////

   // This one's a big one.
   microcode_sequencer microcode_sequencer(
					   .nreset(nreset),
					   .nrsthold(nrsthold),
					   .clk2(clk2),
					   .clk4(clk4),
					   .nhalt(nhalt),
					   .nendext(nendext),
					   .nws(nws),
					   .idx(idx),
					   .ncond(ncond),
					   .in_rsvd(in_rsvd),
					   .ir(ir[15:7]),
					   .nirqsuc(nirqsuc),
					   .raddr(raddr),
					   .waddr(waddr),
					   .cond(cond),
					   .action(action),
					   .nmem(nmem),
					   .nio(nio),
					   .nr(nr),
					   .nwen(nwen),
					   .nend(nend),
					   .fpfetch(fpfetch),
					   .nfpua0(nfpua0),
					   .nfpuc0(nfpuc0),
					   .nfpuc1(nfpuc1),
					   .nfpuc2(nfpuc2),
					   .fpd(fpd));
   
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE INSTRUCTION REGISTER
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   reg_ir reg_ir (.clk4(clk4),
		  .ibus(ibus),
		  .nwrite_ir(nwrite_ir), // Generated by the flag unit
		  .ir(ir),
		  .nfpirl(nfpirl),
		  .nfpirh(nfpirh),
		  .fpd(fpd));

   // The IR starts in an indeterminate state, but in order for the
   // machine to start, we need it to have a good value. So we hack
   // it. This doesn't compromise realism. On real hardware, the IR
   // will have a valid random value at startup, and this value is
   // effectively ignored by the control unit while it runs its reset
   // microprogram.
   initial begin
      #50 reg_ir.ir_lo.q0 <= 8'hef;
      reg_ir.ir_hi.q0 <= 8'hbe;
   end
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE FLAG UNIT
   //
   ///////////////////////////////////////////////////////////////////////////////

   flag_unit flag_unit (.clk4(clk4),
   			.waddr(waddr),
   			.raddr(raddr),
   			.fn(fn),
   			.fz(fz),
   			.fl(fl),
   			.fv(fv),
   			.fi(fi),
   			.ibus(ibus[15:8]),
   			.nflagwe(nflagwe),
   			.nread_agl(nread_agl),
   			.nwrite_ir(nwrite_ir),
   			.nfpflags(nfpflags),
   			.fpd(fpd));
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // ADDRESSING MODES: THE AGL AND AIL
   //
   ///////////////////////////////////////////////////////////////////////////////

   agl agl (
	    .ir(ir[10:0]),
	    .pc(pc[15:10]),
	    .nread_agl(nread_agl),
	    .nend(nend), 
	    .ibus(ibus)
	    );

   ail ail (
	    .ir(ir), 
	    .idx(idx),
	    .nidxen(nidxen));

   // Generate the IR-IDX signal for the MBU.
   assign #4 nir_idx = naction_idx | nidxen;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE SKIP/BRANCH UNIT (SBU)
   //
   ///////////////////////////////////////////////////////////////////////////////

   sbu sbu(
	   .nreset(nreset),
	   .clk4(clk4),
	   .nskipext(nskipext),
	   .ir(ir),
	   .cond(cond),
	   .fv(fv),
	   .fl(fl),
	   .fz(fz),
	   .fn(fn),
	   .cext8(cext8),
	   .cext9(cext9),
	   .cext10(cext10),
	   .ncond(ncond));
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // INTERRUPT STATE MACHINE (ISM)
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Connect DUT to test bench
   int_fsm ism (.nreset(nreset),
		.clk4(clk4),
		.nend(nend),
		.ibus15(ibus[15]),
		.nflagwe(nflagwe),
		.action(action),
		.nirq(nirq),
		.fi(fi),
		.nirqs(nirqs),
		.nirqsuc(nirqsuc),
		.naction_idx(naction_idx));

endmodule // card_ctl

`endif // card_ctl_v
