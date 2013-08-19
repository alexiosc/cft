///////////////////////////////////////////////////////////////////////////////
//
// processor.v -- Join all processor boards together
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

`include "PB0.v"
`include "PB1.v"
`include "PB2.v"
`include "PB3.v"


`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor
//
///////////////////////////////////////////////////////////////////////////////

// The purpose of this unit is to join all processor boards together
// using their local control bus. The bus is hidden from view, and the
// processor exposes only its DIN-41612-based expansion bus and front
// panel interface.

module processor(
		 // DIN-41612
		 ec_ab,         // 16-bit address bus
		 ec_aext,       // 8-bit address bus extension
		 ec_db,         // 16-bit data bus
		 ec_nirq0,	// Single open drain interrupt line
		 ec_nirq,       // 8 open drain interrupt lines
		 ec_nirqs,      // IRQ acknowledge, active low
		 ec_nmem,       // memory strobe, active low
		 ec_nio,        // I/O strobe, active low
		 ec_nr,         // read strobe, active low
		 ec_nw,         // write strobe, active low
		 ec_nhalt,      // halt machine, open drain
		 ec_nreset,     // reset machine, open drain
		 ec_nrsthold,   // reset hold
		 ec_nendext,    // end current instruction, open drain
		 ec_nskipext,   // skip input, open drain
		 ec_nws,        // wait state, open drain
		 ec_nsysdev,    // I/O 0000-00FF selected
		 ec_niodev1xx,  // I/O 0100-01FF selected 
		 ec_niodev2xx,  // I/O 0200-02FF selected
		 ec_niodev3xx,  // I/O 0300-03ff selected
		 ec_clk1,       // 4 MHz clock, 75%, 90°
		 ec_clk2,       // 4 MHz clock, 75%, 180°
		 ec_clk3,       // 4 MHz clock, 75%, 270°
		 ec_clk4,       // 4 MHz clock, 75%, 0°
		 ec_nt34,       // 4 MHz clock, 50%, 0°

		 // Front panel, microcode
		 pu1_ucb,	// Front panel UCB output (2 bits)

		 /*
		 // Front Panel I/O Connectors for board A
		 pa1_ir,        // Instruction Register
		 pa1_nincpc,    // INCPC# (for FP controller)
		 pa1_nrac,      // RAC# (for FP controller)
		 pa1_nrpc,      // RPC# (for FP controller)
		 pa1_nwac,      // WAC# (for FP controller)
		 pa1_nwar,      // WAR# (for FP controller)
		 pa1_nwdr,      // WDR# (for FP controller)
		 pa1_nwir,      // WIR# (for FP controller)
		 pa1_nwpc,      // WPC# (for FP controller)
		 pa1_nwen,      // WEN# (for FP controller)
		 pa1_fpclken,   // FPCLKEN
		 pa1_fpustep,   // FPUSTEP
		 pa1_fpfast,    // FPFAST (speed switch)
		 pa1_fpslow,    // FPSLOW (speed switch)
		 pa1_nfpreset,  // FPRESET (reset switch)
		 pa1_powerok,   // POWEROK (ATX PSU via FP controller)
		 // Plus 8 unused pins

		 // Front Panel Buffered Light Connector B
		 pa2_bupc,      // UPC (4 bits)
		 pa2_nbaindex,  // AINDEX# (active low)
		 pa2_nbskip,    // SKIP# (active low)
		 pa2_bfl,       // FL
		 pa2_bfv,       // FV
		 pa2_bfirq,     // FIRQ
		 pa2_nbirqs,    // IRQS# (active low)
		 pa2_nbrsthold, // RSTHOLD# (active low)
		 pa2_brunit,    // Read Unit (4 bits)
		 pa2_bwunit,    // Write Unit (3 bits)
		 pa2_bmem,      // MEM strobe
		 pa2_bio,       // IO strobe
		 pa2_br,	// R strobe
		 pa2_bw,	// WEN strobe (buffered as BW)
		 pa2_bend,      // END# (inverted, buffered)
		 pa2_bcpl,      // CPL# (inverted, buffered)
		 pa2_bcll,      // CLL# (inverted, buffered)
		 pa2_bsti,      // STI# (inverted, buffered)
		 pa2_bcli,      // CLI# (inverted, buffered)
		 pa2_bincpc,    // INCPC# (inverted, buffered)
		 pa2_bstpdr,    // STPDR# (inverted, buffered)
		 pa2_bstpac,    // STPDR# (inverted, buffered)
		 pa2_bdec,      // DEC# (inverted, buffered)
		 pa2_bopif,     // OPIF (4 bits)
		 pa2_bfneg,     // N flag
		 pa2_bfzero,    // Z flag
		 // Plus 3 unused pins

		 // Front Panel Buffered Light Connector A
		 pb1_pc,        // Program Counter register (16 bits)
		 pb1_dr,	// Data Register (16 bits)
		 // Plus 8 unused pins

		 // Front Panel Buffered Light Connector B
		 pb2_ac,        // Accumulator (16 bits)
		 // Plus 24 unused pins

                 // Front panel, MBU connectors
		 pc1_aext,       // MBU output to front panel
		 pc1_banking,    // MBU output to front panel
		 pc1_nfpram,     // MBU input from the RAM/ROM switch
		  
		  */
		 );
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // EXPANSION CONNECTOR (DIN 41612)
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The bus directions are the official directions for interfacing devices.

   output [15:0] ec_ab;		// 16-bit address bus
   output [7:0]  ec_aext;        // 8-bit address bus extension (generated here)
   inout [15:0]  ec_db;		// 16-bit data bus
   input 	 ec_nirq0;	// Single open drain interrupt line
   input [7:0] 	 ec_nirq;	// 8 open drain interrupt lines
   inout 	 ec_nirqs;	// IRQ acknowledge, active low
   inout 	 ec_nmem;	// memory strobe, active low
   inout 	 ec_nio;		// I/O strobe, active low
   inout 	 ec_nr;		// read strobe, active low
   inout 	 ec_nw;		// write strobe, active low
   inout 	 ec_nhalt;	// halt machine, open drain
   inout 	 ec_nreset;	// reset machine, open drain
   inout 	 ec_nrsthold;	// reset hold
   inout 	 ec_nendext;	// end current instruction, open drain
   inout 	 ec_nskipext;	// skip input, open drain
   inout 	 ec_nws;		// wait state, open drain
   output 	 ec_nsysdev;	// I/O 0000-00FF selected
   output 	 ec_niodev1xx;	// I/O 0100-01FF selected
   output 	 ec_niodev2xx;	// I/O 0200-02FF selected
   output 	 ec_niodev3xx;	// I/O 0300-03ff selected
   output 	 ec_clk1;	// 4 MHz clock, 75%, 90°
   output 	 ec_clk2;	// 4 MHz clock, 75%, 180°
   output 	 ec_clk3;	// 4 MHz clock, 75%, 270°
   output 	 ec_clk4;	// 4 MHz clock, 75%, 0°
   output 	 ec_nt34;	// 4 MHz clock, 50%, 0°

   ///////////////////////////////////////////////////////////////////////////////
   //
   // FRONT PANEL CONNECTORS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // These connectors cohabit the same ribbon cables. There are six of them:
   // four 40-conductor cables carrying standard processor signals, and another
   // two smaller ones connecting optional units (the uCB and MBU) to the front
   // panel lights and switches.

   // uCB extension
   output [3:0]  pu1_ucb;

   // Processor Board A, Front Panel connector 1
   output [15:0] pa1_ir;            // Instruction Register
   inout 	 pa1_nincpc;        // INCPC# (for FP controller, opend rain)
   inout 	 pa1_nrac;          // RAC# (FP controller, open drain)
   inout 	 pa1_nrpc;          // RPC# (FP controller, open drain)
   inout 	 pa1_nwac;          // WAC# (FP controller, open drain)
   inout 	 pa1_nwar;          // WAR# (FP controller, open drain)
   inout 	 pa1_nwdr;          // WDR# (FP controller, open drain)
   inout 	 pa1_nwir;          // WIR# (FP controller, open drain)
   inout 	 pa1_nwpc;          // WPC# (FP controller, open drain)
   inout 	 pa1_nwen;          // WEN# (FP controller, open drain)
   inout 	 pa1_fpclken;       // FPCLKEN (pulled high)
   inout 	 pa1_fpustep;       // FPUSTEP (pulled low)
   inout 	 pa1_fpfast;        // FPFAST (speed switch, pulled high)
   inout 	 pa1_fpslow;        // FPSLOW (speed switch, pulled low)
   inout 	 pa1_nfpreset;      // FPRESET (reset switch)
   inout 	 pa1_powerok;       // POWEROK (ATX PSU via FP controller)

   // Processor Board A, Front Panel connector 2
   output [3:0]  pa2_bupc;          // UPC (4 bits)
   output 	 pa2_nbaindex;      // AINDEX# (active low)
   output 	 pa2_nbskip;        // SKIP# (active low)
   output 	 pa2_bfl;           // FL
   output 	 pa2_bfv;           // FV
   output 	 pa2_bfirq;         // FIRQ
   output 	 pa2_nbirqs;        // IRQS# (active low)
   output 	 pa2_nbrsthold;     // RSTHOLD# (active low)
   output [3:0]  pa2_brunit;        // Read Unit (4 bits)
   output [2:0]  pa2_bwunit;        // Write Unit (3 bits)
   output 	 pa2_bmem;          // MEM strobe
   output 	 pa2_bio;           // IO strobe
   output 	 pa2_br;            // R strobe
   output 	 pa2_bw;            // WEN strobe (buffered as BW)
   output 	 pa2_bend;          // END# (inverted, buffered)
   output 	 pa2_bcpl;          // CPL# (inverted, buffered)
   output 	 pa2_bcll;          // CLL# (inverted, buffered)
   output 	 pa2_bsti;          // STI# (inverted, buffered)
   output 	 pa2_bcli;          // CLI# (inverted, buffered)
   output 	 pa2_bincpc;        // INCPC# (inverted, buffered)
   output 	 pa2_bstpdr;        // STPDR# (inverted, buffered)
   output 	 pa2_bstpac;        // STPDR# (inverted, buffered)
   output 	 pa2_bdec;          // DEC# (inverted buffered)
   output [3:0]  pa2_bopif;         // OPIF (4 bits)
   output 	 pa2_bfneg;         // N flag
   output 	 pa2_bfzero;        // Z flag

   
   // Processor Board B, Front Panel connector 1
   output [15:0] pb1_pc;	// Program Counter (16 bits)
   output [15:0] pb1_dr;	// Data Register (16 bits)

   
   // Processor Board B, Front Panel connector 2
   output [15:0] pb2_ac;	// Accumulator (16 bits)
   
   
   // Processor Board C, MBU extension, Front Panel connector
   output [7:0]  pc1_aext;
   output 	 pc1_banking;
   input 	 pc1_nfpram;
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE LOCAL CONTROL BUS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Control Bus, Port 1 (P1)
   wire 	c1_ncll;       // 1     CLL#
   wire 	c1_ncpl;       // 2     CPL#
   wire 	c1_nragl;      // 3     RAGL#
   wire 	c1_nwalu;      // 4     WALU#
   wire 	c1_fl;         // 5     FL
   wire 	c1_fv;         // 6     FV
   wire 	c1_ir0;        // 7     IR[0]
   wire 	c1_nwen;       // 8     WEN#
   wire 	c1_ir2;        // 9     IR[2]
   wire 	c1_nend;       // 10    END#
   wire [3:0] 	c1_runit;      // 11-14 RUNIT (4 bits)
   wire 	c1_nskip;      // 15    SKIP#
   wire 	c1_nsti;       // 16    STI#
   wire 	c1_ncli;       // 17    CLI#
   wire [3:0] 	c1_opif;       // 18-21 OPIF (4 bits)
   wire 	c1_ir11;       // 22    IR[11] (indirection mode)
   wire [15:0] c1_ac;         // 23-38 Accumulator (16 bits; PBB->PBC)
   wire 	c1_naccpl;     // 39    ACCPL#
   wire 	c1_ndec;       // 40    DEC#

   // Control Bus, Port 2 (P2)
   wire 	c2_nstpac;     // 1     STPAC#
   wire 	c2_nstpdr;     // 2     STPDR#
   wire 	c2_nincpc;     // 3     INCPC#
   wire 	c2_nrac;       // 4     RAC#
   wire 	c2_nrdr;       // 5     RDR#
   wire 	c2_nrpc;       // 6     RPC#
   wire 	c2_nwac;       // 7     WAC#
   wire 	c2_nwar;       // 8     WAR#
   wire 	c2_nwdr;       // 9     WDR#
   wire 	c2_nwpc;       // 10    WPC#
   wire 	c2_fneg;       // 11    FNEG (input from PB B)
   wire 	c2_fzero;      // 12    FZERO (input from PB B)
   wire [5:0] 	c2_pc10_15;    // 13-18 PC[15:10]
   wire 	c2_nwir;       // 19    WIR#
   wire 	c2_naindex;    // 20    AINDEX#
   wire [15:0] c2_ibus;       // 21-36 IBUS (16 bits; I/O)
   wire [3:0] 	c2_ir12_15;    // 37-40 IR[15:12] (4 bits)

   ///////////////////////////////////////////////////////////////////////////////
   //
   // BOARD 1 of 4: MICROCODE STORE
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB0 pb0(
	     // DIN-41612
	     .ec_ab(ec_ab),               // 16-bit address bus
	     .ec_aext(ec_aext),           // 8-bit address bus extension
	     .ec_db(ec_db),               // 16-bit data bus
	     .ec_nirq0(ec_nirq0),         // Single open drain interrupt line
	     .ec_nirq(ec_nirq),           // 8 open drain interrupt lines
	     .ec_nirqs(ec_nirqs),         // IRQ acknowledge, active low
	     .ec_nmem(ec_nmem),           // memory strobe, active low
	     .ec_nio(ec_nio),             // I/O strobe, active low
	     .ec_nr(ec_nr),               // read strobe, active low
	     .ec_nw(ec_nw),               // write strobe, active low
	     .ec_nhalt(ec_nhalt),         // halt machine, open drain
	     .ec_nreset(ec_nreset),       // reset machine, open drain
	     .ec_nrsthold(ec_nrsthold),   // reset hold
	     .ec_nendext(ec_nendext),     // end current instruction, open drain
	     .ec_nskipext(ec_nskipext),   // skip input, open drain
	     .ec_nws(ec_nws),	         // wait state, open drain
	     .ec_nsysdev(ec_nsysdev),     // I/O 0000-00FF selected
	     .ec_niodev1xx(ec_niodev1xx), // I/O 0100-01FF selected
	     .ec_niodev2xx(ec_niodev2xx), // I/O 0200-02FF selected
	     .ec_niodev3xx(ec_niodev3xx), // I/O 0300-03ff selected
	     .ec_clk1(ec_clk1),	         // 4 MHz clock, 75%, 90°
	     .ec_clk2(ec_clk2),           // 4 MHz clock, 75%, 180°
	     .ec_clk3(ec_clk3),           // 4 MHz clock, 75%, 270°
	     .ec_clk4(ec_clk4),           // 4 MHz clock, 75%, 0°
	     .ec_nt34(ec_nt34),           // 4 MHz clock, 50%, 0°

             // Control Bus, Port 2 (P1)
             .c1_ncll(c1_ncll),       // 1     CLL#
             .c1_ncpl(c1_ncpl),       // 2     CPL#
             .c1_nragl(c1_nragl),     // 3     RAGL#
             .c1_nwalu(c1_nwalu),     // 4     WALU#
             .c1_fl(c1_fl),           // 5     FL (output from PB C)
             .c1_fv(c1_fv),           // 6     FV (output from PB C)
             .c1_ir0(c1_ir0),         // 7     IR[0]
             .c1_nwen(c1_nwen),       // 8     WEN#
             .c1_ir2(c1_ir2),         // 9     IR[2]
             .c1_nend(c1_nend),       // 10    END#
             .c1_runit(c1_runit),     // 11-14 RUNIT (4 bits)
             .c1_nskip(c1_nskip),     // 15    SKIP#
             .c1_nsti(c1_nsti),       // 16    STI#
             .c1_ncli(c1_ncli),       // 17    CLI#
             .c1_opif(c1_opif),       // 18-21 OPIF (4 bits)
             .c1_ir11(c1_ir11),       // 22    IR[11] (indirection mode)
             .c1_ac(c1_ac),           // 23-38 Accumulator (16 bits, PBB->PBC)
             .c1_naccpl(c1_naccpl),   // 39    CACPL#
             .c1_ndec(c1_ndec),       // 40    DEC#

           // Control Bus, Port 1 (P2)
             .c2_nstpac(c2_nstpac),   // 1     STPAC#
             .c2_nstpdr(c2_nstpdr),   // 2     STPDR#
             .c2_nincpc(c2_nincpc),   // 3     INCPC#
             .c2_nrac(c2_nrac),       // 4     RAC#
             .c2_nrdr(c2_nrdr),       // 5     RDR#
             .c2_nrpc(c2_nrpc),       // 6     RPC#
             .c2_nwac(c2_nwac),       // 7     WAC#
             .c2_nwar(c2_nwar),       // 8     WAR#
             .c2_nwdr(c2_nwdr),       // 9     WDR#
             .c2_nwpc(c2_nwpc),       // 10    WPC#
             .c2_fneg(c2_fneg),       // 11    FNEG (input from PB B)
             .c2_fzero(c2_fzero),     // 12    FZERO (input from PB B)
             .c2_pc10_15(c2_pc10_15), // 13-18 PC[15:10]
             .c2_nwir(c2_nwir),       // 19    WIR#
             .c2_naindex(c2_naindex), // 20    AINDEX#
             .c2_ibus(c2_ibus),       // 21-36 IBUS (16 bits, I/O)
             .c2_ir12_15(c2_ir12_15)  // 37-40 IR[15:12] (4 bits)
	     );


   ///////////////////////////////////////////////////////////////////////////////
   //
   // BOARD 2 of 4: PROCESSOR BOARD 1
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB1 pb1(
	      // DIN-41612
	      .ec_ab(ec_ab),         // 16-bit address bus
	      .ec_aext(ec_aext),       // 8-bit address bus extension
	      .ec_db(ec_db),         // 16-bit data bus
	      .ec_nirq0(ec_nirq0),	// Single open drain interrupt line
	      .ec_nirq(ec_nirq),       // 8 open drain interrupt lines
	      .ec_nirqs(ec_nirqs),      // IRQ acknowledge, active low
	      .ec_nmem(ec_nmem),       // memory strobe, active low
	      .ec_nio(ec_nio),        // I/O strobe, active low
	      .ec_nr(ec_nr),         // read strobe, active low
	      .ec_nw(ec_nw),         // write strobe, active low
	      .ec_nhalt(ec_nhalt),      // halt machine, open drain
	      .ec_nreset(ec_nreset),     // reset machine, open drain
	      .ec_nrsthold(ec_nrsthold),   // reset hold
	      .ec_nendext(ec_nendext),    // end current instruction, open drain
	      .ec_nskipext(ec_nskipext),   // skip input, open drain
	      .ec_nws(ec_nws),        // wait state, open drain
	      .ec_nsysdev(ec_nsysdev),    // I/O 0000-00FF selected
	      .ec_niodev1xx(ec_niodev1xx),  // I/O 0100-01FF selected 
	      .ec_niodev2xx(ec_niodev2xx),  // I/O 0200-02FF selected
	      .ec_niodev3xx(ec_niodev3xx),  // I/O 0300-03ff selected
	      .ec_clk1(ec_clk1),       // 4 MHz clock, 75%, 90°
	      .ec_clk2(ec_clk2),       // 4 MHz clock, 75%, 180°
	      .ec_clk3(ec_clk3),       // 4 MHz clock, 75%, 270°
	      .ec_clk4(ec_clk4),       // 4 MHz clock, 75%, 0°
	      .ec_nt34(ec_nt34),       // 4 MHz clock, 50%, 0°

              // Control Bus, Port 2 (P1)
              .c1_ncll(c1_ncll),       // 1     CLL#
              .c1_ncpl(c1_ncpl),       // 2     CPL#
              .c1_nragl(c1_nragl),     // 3     RAGL#
              .c1_nwalu(c1_nwalu),     // 4     WALU#
              .c1_fl(c1_fl),           // 5     FL (output from PB C)
              .c1_fv(c1_fv),           // 6     FV (output from PB C)
              .c1_ir0(c1_ir0),         // 7     IR[0]
              .c1_nwen(c1_nwen),       // 8     WEN#
              .c1_ir2(c1_ir2),         // 9     IR[2]
              .c1_nend(c1_nend),       // 10    END#
              .c1_runit(c1_runit),     // 11-14 RUNIT (4 bits)
              .c1_nskip(c1_nskip),     // 15    SKIP#
              .c1_nsti(c1_nsti),       // 16    STI#
              .c1_ncli(c1_ncli),       // 17    CLI#
              .c1_opif(c1_opif),       // 18-21 OPIF (4 bits)
              .c1_ir11(c1_ir11),       // 22    IR[11] (indirection mode)
              .c1_ac(c1_ac),           // 23-38 Accumulator (16 bits, PBB->PBC)
              .c1_naccpl(c1_naccpl),   // 39    CACPL#
              .c1_ndec(c1_ndec),       // 40    DEC#

              // Control Bus, Port 1 (P2)
              .c2_nstpac(c2_nstpac),   // 1     STPAC#
              .c2_nstpdr(c2_nstpdr),   // 2     STPDR#
              .c2_nincpc(c2_nincpc),   // 3     INCPC#
              .c2_nrac(c2_nrac),       // 4     RAC#
              .c2_nrdr(c2_nrdr),       // 5     RDR#
              .c2_nrpc(c2_nrpc),       // 6     RPC#
              .c2_nwac(c2_nwac),       // 7     WAC#
              .c2_nwar(c2_nwar),       // 8     WAR#
              .c2_nwdr(c2_nwdr),       // 9     WDR#
              .c2_nwpc(c2_nwpc),       // 10    WPC#
              .c2_fneg(c2_fneg),       // 11    FNEG (input from PB B)
              .c2_fzero(c2_fzero),     // 12    FZERO (input from PB B)
              .c2_pc10_15(c2_pc10_15), // 13-18 PC[15:10]
              .c2_nwir(c2_nwir),       // 19    WIR#
              .c2_naindex(c2_naindex), // 20    AINDEX#
              .c2_ibus(c2_ibus),       // 21-36 IBUS (16 bits, I/O)
              .c2_ir12_15(c2_ir12_15), // 37-40 IR[15:12] (4 bits)

/* -----\/----- EXCLUDED -----\/-----
	      // Front Panel I/O Connector A
	      .p1_ir(pa1_ir),         // Instruction Register
	      .p1_nincpc(pa1_nincpc),     // INCPC# (for FP controller)
	      .p1_nrac(pa1_nrac),       // RAC# (for FP controller)
	      .p1_nrpc(pa1_nrpc),       // RPC# (for FP controller)
	      .p1_nwac(pa1_nwac),       // WAC# (for FP controller)
	      .p1_nwar(pa1_nwar),       // WAR# (for FP controller)
	      .p1_nwdr(pa1_nwdr),       // WDR# (for FP controller)
	      .p1_nwir(pa1_nwir),       // WIR# (for FP controller)
	      .p1_nwpc(pa1_nwpc),       // WPC# (for FP controller)
	      .p1_nwen(pa1_nwen),       // WEN# (for FP controller)
 */
	      .p1_fpclken(pa1_fpclken),    // FPCLKEN
	      .p1_fpustep(pa1_fpustep),    // FPUSTEP
	      .p1_nfpreset(pa1_nfpreset),   // FPRESET (reset switch)
	      .p1_powerok(pa1_powerok)    // POWEROK (ATX PSU via FP controller)
	      // Plus 8 unused pins
/*
	      // Front Panel Buffered Light Connector B
	      .p2_bupc(pa2_bupc),       // UPC (4 bits)
	      .p2_nbaindex(pa2_nbaindex),   // AINDEX# (active low)
	      .p2_nbskip(pa2_nbskip),     // SKIP# (active low)
	      .p2_bfl(pa2_bfl),        // FL
	      .p2_bfv(pa2_bfv),        // FV
	      .p2_bfirq(pa2_bfirq),      // FIRQ
	      .p2_nbirqs(pa2_nbirqs),     // IRQS# (active low)
	      .p2_nbrsthold(pa2_nbrsthold),  // RSTHOLD# (active low)
	      .p2_brunit(pa2_brunit),     // Read Unit (4 bits)
	      .p2_bwunit(pa2_bwunit),     // Write Unit (3 bits)
	      .p2_bmem(pa2_bmem),       // MEM strobe
	      .p2_bio(pa2_bio),        // IO strobe
	      .p2_br(pa2_br),	        // R strobe
	      .p2_bw(pa2_bw),	        // WEN strobe (buffered as BW)
	      .p2_bend(pa2_bend),       // END# (inverted, buffered)
	      .p2_bcpl(pa2_bcpl),       // CPL# (inverted, buffered)
	      .p2_bcll(pa2_bcll),       // CLL# (inverted, buffered)
	      .p2_bsti(pa2_bsti),       // STI# (inverted, buffered)
	      .p2_bcli(pa2_bcli),       // CLI# (inverted, buffered)
	      .p2_bincpc(pa2_bincpc),     // INCPC# (inverted, buffered)
	      .p2_bstpdr(pa2_bstpdr),     // STPDR# (inverted, buffered)
	      .p2_bstpac(pa2_bstpac),     // STPDR# (inverted, buffered)
	      .p2_bdec(pa2_bdec),       // DEC# (inverted, buffered)
	      .p2_bopif(pa2_bopif),      // OPIF (4 bits)
	      .p2_bfneg(pa2_bfneg),      // N flag
	      .p2_bfzero(pa2_bfzero)     // Z flag
	      // Plus 3 unused pins
 -----/\----- EXCLUDED -----/\----- */

	      );
   
   



   ///////////////////////////////////////////////////////////////////////////////
   //
   // BOARD 3 of 4: PROCESSOR BOARD 2 (REGISTERS)
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB2 pb2(
	      // DIN-41612
	      .ec_ab(ec_ab),		      // 16-bit address bus
	      .ec_aext(ec_aext),	      // 8-bit address bus extension
	      .ec_db(ec_db),		      // 16-bit data bus
	      .ec_nirq0(ec_nirq0),	      // Single open drain interrupt line
	      .ec_nirq(ec_nirq),	      // 8 open drain interrupt lines
	      .ec_nirqs(ec_nirqs),	      // IRQ acknowledge, active low
	      .ec_nmem(ec_nmem),	      // memory strobe, active low
	      .ec_nio(ec_nio),	      // I/O strobe, active low
	      .ec_nr(ec_nr),		      // read strobe, active low
	      .ec_nw(ec_nw),		      // write strobe, active low
	      .ec_nhalt(ec_nhalt),	      // halt machine, open drain
	      .ec_nreset(ec_nreset),	      // reset machine, open drain
	      .ec_nrsthold(ec_nrsthold),   // reset hold
	      .ec_nendext(ec_nendext),     // end current instruction, open drain
	      .ec_nskipext(ec_nskipext),   // skip input, open drain
	      .ec_nws(ec_nws),	      // wait state, open drain
	      .ec_nsysdev(ec_nsysdev),     // I/O 0000-00FF selected
	      .ec_niodev1xx(ec_niodev1xx), // I/O 0100-01FF selected 
	      .ec_niodev2xx(ec_niodev2xx), // I/O 0200-02FF selected
	      .ec_niodev3xx(ec_niodev3xx), // I/O 0300-03ff selected
	      .ec_clk1(ec_clk1),	      // 4 MHz clock, 75%, 90°
	      .ec_clk2(ec_clk2),	      // 4 MHz clock, 75%, 180°
	      .ec_clk3(ec_clk3),	      // 4 MHz clock, 75%, 270°
	      .ec_clk4(ec_clk4),	      // 4 MHz clock, 75%, 0°
	      .ec_nt34(ec_nt34),	      // 4 MHz clock, 50%, 0°

              // Control Bus, Port 2 (P1)
              .c1_ncll(c1_ncll),       // 1     CLL#
              .c1_ncpl(c1_ncpl),       // 2     CPL#
              .c1_nragl(c1_nragl),     // 3     RAGL#
              .c1_nwalu(c1_nwalu),     // 4     WALU#
              .c1_fl(c1_fl),           // 5     FL (output from PB C)
              .c1_fv(c1_fv),           // 6     FV (output from PB C)
              .c1_ir0(c1_ir0),         // 7     IR[0]
              .c1_nwen(c1_nwen),       // 8     WEN#
              .c1_ir2(c1_ir2),         // 9     IR[2]
              .c1_nend(c1_nend),       // 10    END#
              .c1_runit(c1_runit),     // 11-14 RUNIT (4 bits)
              .c1_nskip(c1_nskip),     // 15    SKIP#
              .c1_nsti(c1_nsti),       // 16    STI#
              .c1_ncli(c1_ncli),       // 17    CLI#
              .c1_opif(c1_opif),       // 18-21 OPIF (4 bits)
              .c1_ir11(c1_ir11),       // 22    IR[11] (indirection mode)
              .c1_ac(c1_ac),           // 23-38 Accumulator (16 bits, PBB->PBC)
              .c1_naccpl(c1_naccpl),   // 39    CACPL#
              .c1_ndec(c1_ndec),       // 40    DEC#

              // Control Bus, Port 1 (P2)
              .c2_nstpac(c2_nstpac),   // 1     STPAC#
              .c2_nstpdr(c2_nstpdr),   // 2     STPDR#
              .c2_nincpc(c2_nincpc),   // 3     INCPC#
              .c2_nrac(c2_nrac),       // 4     RAC#
              .c2_nrdr(c2_nrdr),       // 5     RDR#
              .c2_nrpc(c2_nrpc),       // 6     RPC#
              .c2_nwac(c2_nwac),       // 7     WAC#
              .c2_nwar(c2_nwar),       // 8     WAR#
              .c2_nwdr(c2_nwdr),       // 9     WDR#
              .c2_nwpc(c2_nwpc),       // 10    WPC#
              .c2_fneg(c2_fneg),       // 11    FNEG (input from PB B)
              .c2_fzero(c2_fzero),     // 12    FZERO (input from PB B)
              .c2_pc10_15(c2_pc10_15), // 13-18 PC[15:10]
              .c2_nwir(c2_nwir),       // 19    WIR#
              .c2_naindex(c2_naindex), // 20    AINDEX#
              .c2_ibus(c2_ibus),       // 21-36 IBUS (16 bits, I/O)
              .c2_ir12_15(c2_ir12_15)  // 37-40 IR[15:12] (4 bits)

	      );


   ///////////////////////////////////////////////////////////////////////////////
   //
   // BOARD 4 of 4: PROCESSOR BOARD 3 (ALU AND MBU)
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB3 pb3(
	   // DIN-41612
	   .ec_ab(ec_ab),	           // 16-bit address bus
	   .ec_aext(ec_aext),           // 8-bit address bus extension
	   .ec_db(ec_db),	           // 16-bit data bus
	   .ec_nirq0(ec_nirq0),	   // Single open drain interrupt line
	   .ec_nirq(ec_nirq),		 // 8 open drain interrupt lines
	   .ec_nirqs(ec_nirqs),	 // IRQ acknowledge, active low
	   .ec_nmem(ec_nmem),		 // memory strobe, active low
	   .ec_nio(ec_nio),		 // I/O strobe, active low
	   .ec_nr(ec_nr),               // read strobe, active low
	   .ec_nw(ec_nw),               // write strobe, active low
	   .ec_nhalt(ec_nhalt),         // halt machine, open drain
	   .ec_nreset(ec_nreset),       // reset machine, open drain
	   .ec_nrsthold(ec_nrsthold),   // reset hold
	   .ec_nendext(ec_nendext),     // end current instruction, open drain
	   .ec_nskipext(ec_nskipext),   // skip input, open drain
	   .ec_nws(ec_nws),		 // wait state, open drain
	   .ec_nsysdev(ec_nsysdev),	 // I/O 0000-00FF selected
	   .ec_niodev1xx(ec_niodev1xx), // I/O 0100-01FF selected 
	   .ec_niodev2xx(ec_niodev2xx), // I/O 0200-02FF selected
	   .ec_niodev3xx(ec_niodev3xx), // I/O 0300-03ff selected
	   .ec_clk1(ec_clk1),		 // 4 MHz clock, 75%, 90°
	   .ec_clk2(ec_clk2),		 // 4 MHz clock, 75%, 180°
	   .ec_clk3(ec_clk3),		 // 4 MHz clock, 75%, 270°
	   .ec_clk4(ec_clk4),		 // 4 MHz clock, 75%, 0°
	   .ec_nt34(ec_nt34),		 // 4 MHz clock, 50%, 0°

	   .p1_nfpram(pc1_nfpram),

           // Control Bus, Port 2 (P1)
           .c1_ncll(c1_ncll),       // 1     CLL#
           .c1_ncpl(c1_ncpl),       // 2     CPL#
           .c1_nragl(c1_nragl),     // 3     RAGL#
           .c1_nwalu(c1_nwalu),     // 4     WALU#
           .c1_fl(c1_fl),           // 5     FL (output from PB C)
           .c1_fv(c1_fv),           // 6     FV (output from PB C)
           .c1_ir0(c1_ir0),         // 7     IR[0]
           .c1_nwen(c1_nwen),       // 8     WEN#
           .c1_ir2(c1_ir2),         // 9     IR[2]
           .c1_nend(c1_nend),       // 10    END#
           .c1_runit(c1_runit),     // 11-14 RUNIT (4 bits)
           .c1_nskip(c1_nskip),     // 15    SKIP#
           .c1_nsti(c1_nsti),       // 16    STI#
           .c1_ncli(c1_ncli),       // 17    CLI#
           .c1_opif(c1_opif),       // 18-21 OPIF (4 bits)
           .c1_ir11(c1_ir11),       // 22    IR[11] (indirection mode)
           .c1_ac(c1_ac),           // 23-38 Accumulator (16 bits, PBB->PBC)
           .c1_naccpl(c1_naccpl),   // 39    CACPL#
           .c1_ndec(c1_ndec),       // 40    DEC#

           // Control Bus, Port 1 (P2)
           .c2_nstpac(c2_nstpac),   // 1     STPAC#
           .c2_nstpdr(c2_nstpdr),   // 2     STPDR#
           .c2_nincpc(c2_nincpc),   // 3     INCPC#
           .c2_nrac(c2_nrac),       // 4     RAC#
           .c2_nrdr(c2_nrdr),       // 5     RDR#
           .c2_nrpc(c2_nrpc),       // 6     RPC#
           .c2_nwac(c2_nwac),       // 7     WAC#
           .c2_nwar(c2_nwar),       // 8     WAR#
           .c2_nwdr(c2_nwdr),       // 9     WDR#
           .c2_nwpc(c2_nwpc),       // 10    WPC#
           .c2_fneg(c2_fneg),       // 11    FNEG (input from PB B)
           .c2_fzero(c2_fzero),     // 12    FZERO (input from PB B)
           .c2_pc10_15(c2_pc10_15), // 13-18 PC[15:10]
           .c2_nwir(c2_nwir),       // 19    WIR#
           .c2_naindex(c2_naindex), // 20    AINDEX#
           .c2_ibus(c2_ibus),       // 21-36 IBUS (16 bits, I/O)
           .c2_ir12_15(c2_ir12_15)  // 37-40 IR[15:12] (4 bits)

	   );
   

endmodule // PB1

// End of file.
