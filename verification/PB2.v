///////////////////////////////////////////////////////////////////////////////
//
// PB2.v -- Processor Board B
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

`include "PB2-AR.v"
`include "PB2-AIL.v"
`include "PB2-IOD.v"
`include "PB2-PC.v"
`include "PB2-DR.v"
`include "PB2-AC.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board B
//
///////////////////////////////////////////////////////////////////////////////

module PB2(
	   // DIN-41612
           ec_ab,        // 16-bit address bus
           ec_aext,      // 8-bit address bus extension
           ec_db,        // 16-bit data bus
           ec_nirq0,     // Single open drain interrupt line
           ec_nirq,      // 8 open drain interrupt lines
           ec_nirqs,     // IRQ acknowledge, active low
           ec_nmem,      // memory strobe, active low
           ec_nio,       // I/O strobe, active low
           ec_nr,        // read strobe, active low
           ec_nw,        // write strobe, active low
           ec_nhalt,     // halt machine, open drain
           ec_nreset,    // reset machine, open drain
           ec_nrsthold,  // reset hold signal, active low
           ec_nendext,   // end current instruction, open drain
           ec_nskipext,  // skip input, open drain
           ec_nws,       // wait state, open drain
           ec_nsysdev,   // I/O 0000-00FF selected
           ec_niodev1xx, // I/O 0100-01FF selected
           ec_niodev2xx, // I/O 0200-02FF selected
           ec_niodev3xx, // I/O 0300-03ff selected
           ec_clk1,      // 4 MHz clock, 75%, 90°
           ec_clk2,      // 4 MHz clock, 75%, 180°
           ec_clk3,      // 4 MHz clock, 75%, 270°
           ec_clk4,      // 4 MHz clock, 75%, 0°
           ec_nt34,      // 4 MHz clock, 50%, 0°

	   // Front Panel Buffered Light Connector A
	   p1_pc,	        // Program Counter register (16 bits)
	   p1_dr,		// Data Register (16 bits)
	   // Plus 8 unused pins

	   // Front Panel Buffered Light Connector B
	   p2_ac,	        // Accumulator (16 bits)
	   // Plus 24 unused pins

           // Control Bus, Port 2 (P1)
           c1_ncll,       // 1     CLL#
           c1_ncpl,       // 2     CPL#
           c1_nragl,      // 3     RAGL#
           c1_nwalu,      // 4     WALU#
           c1_fl,         // 5     FL (output from PB C)
           c1_fv,         // 6     FV (output from PB C)
           c1_ir0,        // 7     IR[0]
           c1_nwen,       // 8     WEN#
           c1_ir2,        // 9     IR[2]
           c1_nend,       // 10    END#
           c1_runit,      // 11-14 RUNIT (4 bits)
           c1_nskip,      // 15    SKIP#
           c1_nsti,       // 16    STI#
           c1_ncli,       // 17    CLI#
           c1_opif,       // 18-21 OPIF (4 bits)
           c1_ir11,       // 22    IR[11] (indirection mode)
           c1_ac,         // 23-38 Accumulator (16 bits, PBB->PBC)
           c1_naccpl,     // 39    CACPL#
           c1_ndec,       // 40    DEC#

           // Control Bus, Port 1 (P2)
           c2_nstpac,     // 1     STPAC#
           c2_nstpdr,     // 2     STPDR#
           c2_nincpc,     // 3     INCPC#
           c2_nrac,       // 4     RAC#
           c2_nrdr,       // 5     RDR#
           c2_nrpc,       // 6     RPC#
           c2_nwac,       // 7     WAC#
           c2_nwar,       // 8     WAR#
           c2_nwdr,       // 9     WDR#
           c2_nwpc,       // 10    WPC#
           c2_fneg,       // 11    FNEG (input from PB B)
           c2_fzero,      // 12    FZERO (input from PB B)
           c2_pc10_15,    // 13-18 PC[15:10]
           c2_nwir,       // 19    WIR#
           c2_naindex,    // 20    AINDEX#
           c2_ibus,       // 21-36 IBUS (16 bits, I/O)
           c2_ir12_15,    // 37-40 IR[15:12] (4 bits)

	   );

   // Expansion connector (DIN 41612)
   input [15:0] ec_ab;        // 16-bit address bus
   input [7:0] 	ec_aext;      // 8-bit address bus extension
   inout [15:0] ec_db;        // 16-bit data bus
   input        ec_nirq0;     // Single open drain interrupt line
   input [7:0] 	ec_nirq;      // 8 open drain interrupt lines
   input 	ec_nirqs;     // IRQ acknowledge, active low
   input	ec_nmem;      // memory strobe, active low
   input	ec_nio;       // I/O strobe, active low
   input	ec_nr;        // read strobe, active low
   input 	ec_nw;        // write strobe, active low
   input 	ec_nhalt;     // halt machine, open drain
   input	ec_nreset;    // reset machine, open drain
   output	ec_nrsthold;  // Reset hold
   input	ec_nendext;   // end current instruction, open drain
   input 	ec_nskipext;  // skip input, open drain
   input 	ec_nws;       // wait state, open drain
   input 	ec_nsysdev;   // I/O 0000-00FF selected
   input 	ec_niodev1xx; // I/O 0100-01FF selected
   input 	ec_niodev2xx; // I/O 0200-02FF selected
   input 	ec_niodev3xx; // I/O 0300-03ff selected
   input 	ec_clk1;      // 4 MHz clock, 75%, 90°
   input 	ec_clk2;      // 4 MHz clock, 75%, 180°
   input 	ec_clk3;      // 4 MHz clock, 75%, 270°
   input 	ec_clk4;      // 4 MHz clock, 75%, 0°
   input 	ec_nt34;      // 4 MHz clock, 50%, 0°

   // Front Panel Connectors
   output [15:0] p1_pc;	      // Program Counter (16 bits)
   output [15:0] p1_dr;	      // Data Register (16 bits)
   
   output [15:0] p2_ac;	      // Accumulator (16 bits)

   // Control Bus, Port 1 (P1)
   inout 	c1_ncll;       // 1     CLL#
   inout 	c1_ncpl;       // 2     CPL#
   inout 	c1_nragl;      // 3     RAGL#
   inout 	c1_nwalu;      // 4     WALU#
   inout 	c1_fl;         // 5     FL
   inout 	c1_fv;         // 6     FV
   inout 	c1_ir0;        // 7     IR[0]
   inout 	c1_nwen;       // 8     WEN#
   inout 	c1_ir2;        // 9     IR[2]
   inout 	c1_nend;       // 10    END#
   inout [3:0] 	c1_runit;      // 11-14 RUNIT (4 bits)
   inout 	c1_nskip;      // 15    SKIP#
   inout 	c1_nsti;       // 16    STI#
   inout 	c1_ncli;       // 17    CLI#
   inout [3:0] 	c1_opif;       // 18-21 OPIF (4 bits)
   inout 	c1_ir11;       // 22    IR[11] (indirection mode)
   inout [15:0] c1_ac;         // 23-38 Accumulator (16 bits; PBB->PBC)
   inout 	c1_naccpl;     // 39    ACCPL#
   inout 	c1_ndec;       // 40    DEC#

   // Control Bus, Port 2 (P2)
   inout 	c2_nstpac;     // 1     STPAC#
   inout 	c2_nstpdr;     // 2     STPDR#
   inout 	c2_nincpc;     // 3     INCPC#
   inout 	c2_nrac;       // 4     RAC#
   inout 	c2_nrdr;       // 5     RDR#
   inout 	c2_nrpc;       // 6     RPC#
   inout 	c2_nwac;       // 7     WAC#
   inout 	c2_nwar;       // 8     WAR#
   inout 	c2_nwdr;       // 9     WDR#
   inout 	c2_nwpc;       // 10    WPC#
   inout 	c2_fneg;       // 11    FNEG (input from PB B)
   inout 	c2_fzero;      // 12    FZERO (input from PB B)
   inout [5:0] 	c2_pc10_15;    // 13-18 PC[15:10]
   inout 	c2_nwir;       // 19    WIR#
   inout 	c2_naindex;    // 20    AINDEX#
   inout [15:0] c2_ibus;       // 21-36 IBUS (16 bits; I/O)
   inout [3:0] 	c2_ir12_15;    // 37-40 IR[15:12] (4 bits)


   ///////////////////////////////////////////////////////////////////////////////
   //
   // INTERNAL WIRES (CROSSING SHEET BOUNDARIES)
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [15:0] 	 pc;		// The Program Counter
   wire [15:0] 	 dr;		// The Data Register
   wire [15:0] 	 ac;		// The Accumulator

   wire 	 naben;	// ABEN# Address bus enable
   wire 	 reset;	// Board-local active HIGH reset signal
   


   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 2: ADDRESS REGISTER, AUTOINDEX AND I/O DEVICE DECODER
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [15:0] 	 ar;
   PB2_AR PBB_AR(.ibus(c2_ibus), .nwar(c2_nwar),
		 .nmem(ec_nmem), .nio(ec_nio), .naben(naben),
		 .ar(ar),
		 .abus(ec_ab));


   PB2_AIL PBB_AIL(.nreset(ec_nreset), .ibus(c2_ibus), .nwir(c2_nwir),
		   .naindex(c2_naindex));


   PB2_IOD PBB_IOD(.nio(ec_nio),
		   .ar(ar),
		   .nsysdev(ec_nsysdev),
		   .niodev1xx(ec_niodev1xx),
		   .niodev2xx(ec_niodev2xx),
		   .niodev3xx(ec_niodev3xx));


   ///////////////////////////////////////////////////////////////////////////////
     //
   // SHEET 3: PROGRAM COUNTER
   //
   ///////////////////////////////////////////////////////////////////////////////

   not #7 (reset, ec_nreset);
   PB2_PC PBB_PC(.reset(reset),
		 .nrpc(c2_nrpc),
		 .nwpc(c2_nwpc),
		 .nincpc(c2_nincpc),
		 .ibus(c2_ibus),
		 .pc(pc));
   
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 4: DATA REGISTER
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB2_DR PBB_DR(.reset(reset),
		 .nrdr(c2_nrdr),
		 .nwdr(c2_nwdr),
		 .nstpdr(c2_nstpdr),
		 .ndec(c1_ndec),
		 .ibus(c2_ibus),
		 .dr(dr));
   
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 5: ACCUMULATOR (WITH CARRY/BORROW OUT, NEGATIVE FLAG & ZERO FLAG)
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB2_AC PBB_AC(.reset(reset),
		 .nrac(c2_nrac),
		 .nwac(c2_nwac),
		 .nstpac(c2_nstpac),
		 .ndec(c1_ndec),
		 .ibus(c2_ibus),
		 .ac(ac),
		 .naccpl(c1_naccpl),
		 .fn(c2_fneg),
		 .fz(c2_fzero));
   
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // SIGNAL ASSIGNMENTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Signals to the front panel
   assign p1_pc = pc;
   assign p1_dr = dr;

   assign p2_ac = ac;

   assign c1_ac = ac;

   assign c2_pc10_15 = pc[15:10];
   

   
endmodule // PB1

// End of file.
