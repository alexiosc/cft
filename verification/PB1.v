///////////////////////////////////////////////////////////////////////////////
//
// PB1.v -- Processor Board 1
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

`include "PB1-clock.v"
`include "PB1-reset.v"
`include "PB1-uCB.v"
//`include "PB1-decoders.v"
`include "PB1-ISM.v"
`include "PB1-SBL.v"
`include "PB1-AGL.v"
`include "PB1-IR.v"
`include "PB1-DBD.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board A
//
///////////////////////////////////////////////////////////////////////////////

module PB1(
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

	   // Front Panel I/O Connector A
	   p1_ir,         // Instruction Register
	   p1_bfirq,      // FIRQ
	   p1_bfneg,      // N flag
	   p1_bfzero,     // Z flag
	   p1_fpclken,    // FPCLKEN
	   p1_fpustep,    // FPUSTEP
	   p1_nfpreset,   // FPRESET (reset switch)
	   p1_powerok,    // POWEROK (ATX PSU via FP controller)

	   // Control Bus, Port 2 (P1)
	   c1_ncll,	      // 1     CLL#
	   c1_ncpl,	      // 2     CPL#
	   c1_nragl,	      // 3     RAGL#
	   c1_nwalu,	      // 4     WALU#
	   c1_fl,	      // 5     FL (output from PB C)
	   c1_fv,	      // 6     FV (output from PB C)
	   c1_ir0,	      // 7     IR[0]
	   c1_nwen,	      // 8     WEN#
	   c1_ir2,	      // 9     IR[2]
	   c1_nend,	      // 10    END#
	   c1_runit,	      // 11-14 RUNIT (4 bits)
	   c1_nskip,	      // 15    SKIP#
	   c1_nsti,	      // 16    STI#
	   c1_ncli,	      // 17    CLI#
	   c1_opif,	      // 18-21 OPIF (4 bits)
	   c1_ir11,	      // 22    IR[11] (indirection mode)
	   c1_ac,	      // 23-38 Accumulator (16 bits, PBB->PBC)
	   c1_naccpl,	      // 39    CACPL#
	   c1_ndec,	      // 40    DEC#

	   // Control Bus, Port 1 (P2)
	   c2_nstpac,	       // 1     STPAC#
	   c2_nstpdr,	       // 2     STPDR#
	   c2_nincpc,	       // 3     INCPC#
	   c2_nrac,	       // 4     RAC#
	   c2_nrdr,	       // 5     RDR#
	   c2_nrpc,	       // 6     RPC#
	   c2_nwac,	       // 7     WAC#
	   c2_nwar,	       // 8     WAR#
	   c2_nwdr,	       // 9     WDR#
	   c2_nwpc,	       // 10    WPC#
	   c2_fneg,	       // 11    FNEG (input from PB B)
	   c2_fzero,	       // 12    FZERO (input from PB B)
	   c2_pc10_15,	       // 13-18 PC[15:10]
	   c2_nwir,	       // 19    WIR#
	   c2_naindex,	       // 20    AINDEX#
	   c2_ibus,	       // 21-36 IBUS (16 bits, I/O)
	   c2_ir12_15,	       // 37-40 IR[15:12] (4 bits)
	   );

   // Expansion connector (DIN 41612)
   input [15:0] ec_ab;        // 16-bit address bus
   input [7:0] 	ec_aext;      // 8-bit address bus extension
   inout [15:0] ec_db;        // 16-bit data bus
   input        ec_nirq0;     // Single open drain interrupt line
   input [7:0] 	ec_nirq;      // 8 open drain interrupt lines
   input 	ec_nirqs;     // IRQ acknowledge, active low
   inout	ec_nmem;      // memory strobe, active low
   inout	ec_nio;       // I/O strobe, active low
   inout	ec_nr;        // read strobe, active low
   inout 	ec_nw;        // write strobe, active low
   inout 	ec_nhalt;     // halt machine, open drain
   inout 	ec_nreset;    // reset machine, open drain
   inout 	ec_nrsthold;  // Reset hold signal.
   
   inout	ec_nendext;   // end current instruction, open drain
   inout 	ec_nskipext;  // skip input, open drain
   inout 	ec_nws;       // wait state, open drain
   input 	ec_nsysdev;   // I/O 0000-00FF selected
   input 	ec_niodev1xx; // I/O 0100-01FF selected
   input 	ec_niodev2xx; // I/O 0200-02FF selected
   input 	ec_niodev3xx; // I/O 0300-03ff selected
   input 	ec_clk1;      // 4 MHz clock, 75%, 90°
   input 	ec_clk2;      // 4 MHz clock, 75%, 180°
   input 	ec_clk3;      // 4 MHz clock, 75%, 270°
   input 	ec_clk4;      // 4 MHz clock, 75%, 0°
   input 	ec_nt34;      // 4 MHz clock, 50%, 0°

   // Front Panel Ouput (we do not emulate buffering on these outputs)
   output 	p1_ir;         // Instruction Register
   output 	p1_bfirq;      // FIRQ
   output 	p1_bfneg;      // N flag
   output 	p1_bfzero;     // Z flag
   input 	p1_fpclken;    // FPCLKEN
   input 	p1_fpustep;    // FPUSTEP
   input 	p1_nfpreset;   // FPRESET (reset switch)
   input 	p1_powerok;    // POWEROK (ATX PSU via FP controller)

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

   // Pulling up/down inputs

   pullup(p1_fpclken);		// Sheet 2
   pulldown(p1_fpustep);	// Sheet 2

   pullup(p1_nfpreset);		// Sheet 3
   pullup(p1_powerok);		// Sheet 3

   pullup(ec_nskipext);		// Sheet 4

   pullup(ec_nirq0);		// Sheet 7


   ///////////////////////////////////////////////////////////////////////////////
   //
   // INTERNAL WIRES (CROSSING SHEET BOUNDARIES)
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [15:0] 	 ir;		// The instruction register
   wire 	 rstclk;        // A clock source for the reset counter
   


   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 2: CLOCK GENERATOR
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB1_clock pb1_clock (.nreset(ec_nreset),
			.fpclken(p1_fpclken),
			.fpustep(p1_fpustep),
			.rstclk(rstclk),
			.clk1(ec_clk1),
			.clk2(ec_clk2),
			.clk3(ec_clk3),
			.clk4(ec_clk4),
			//.nt12(),
			.nt34(ec_nt34));
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 3: RESET HANDLING AND SEQUENCING, RESET VECTOR
   //
   ///////////////////////////////////////////////////////////////////////////////


   PB1_reset pb1_reset (.nreset(ec_nreset),
			.clk(rstclk),
			.nfpreset(p1_nfpreset),
			.powerok(p1_powerok),
			.nrsthold(ec_nrsthold),
			.ibus(c2_ibus));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 4: MICROCODE BOARD CONNECTOR, ENABLES, PULL UP/DOWNS AND UPC.
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Not used.

   /*
    // Removed 2013-07-14
    xxxxPB1_uCB PBA_uCB(.nreset(ec_nreset),
    .nrsthold(nrsthold),
    .clk4(ec_clk4),
    .nws(ec_nws),
    .nhalt(ec_nhalt),
    .nend(uc_nend),
    .nendext(ec_nendext),
    .upc(uc_upc),
    .nuce(uc_nuce));
    */
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 5: CONNECTORS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Left out. Signals assigned individually, or in the ‘signal assignments’
   // section below.


   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 6: READ/WRITE UNIT DECODING
   //
   ///////////////////////////////////////////////////////////////////////////////

   /*
    // The decoders have moved to PB0.
    read_unit_decoder PBA_RUD(.nreset(ec_nreset),
    .clk1(ec_clk1),
    .nuce(uc_nuce),
    .runit(uc_runit),
    .nragl(nragl),
    .nrpc(c1_nrpc),
    .nrdr(c1_nrdr),
    .nrac(c1_nrac));

    write_unit_decoder PBA_WUD(.nreset(ec_nreset),
    .clk3(ec_clk3),
    .nuce(uc_nuce),
    .wunit(uc_wunit),
    .nwar(c1_nwar),
    .nwpc(c1_nwpc),
    .nwir(c1_nwir),
    .nwdr(c1_nwdr),
    .nwac(c1_nwac),
    .nwalu(c2_nwalu));
    */


   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 7: SKIP/BRANCH LOGIC
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB1_SBL pb1_sbl (.nreset(ec_nreset),
		    .clk4(ec_clk4),
		    .fv(c1_fv),
		    .fl(c1_fl),
		    .fz(c2_fzero),
		    .fn(c2_fneg),
		    .ir(ir[9:0]),
		    .opif(c1_opif),
		    .nskipext(ec_nskipext),
		    .nskip(c1_nskip));
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 8: ADDRESS GENERATION LOGIC
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB1_AGL pb1_agl (.pc10_15(c2_pc10_15),
		    .ir(ir),
		    .nragl(c1_nragl),
		    .nend(c1_nend),
		    .ibus(c2_ibus));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 9: INSTRUCTION REGISTER
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB1_IR pb1_ir (.ibus(c2_ibus),
		  .nwir(c2_nwir),
		  .ir(ir));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 10: INTERRUPT STATE MACHINE
   //
   ///////////////////////////////////////////////////////////////////////////////

   PB1_ISM pb1_ism(.nreset(ec_nreset), .nend(c1_nend),
		   .nsti(c1_nsti), .ncli(c1_ncli),
		   .nirq(ec_nirq0),
		   .firq(p1_bfirq),
		   .nirqs(ec_nirqs));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 11: Data Bus Driver
   //
   ///////////////////////////////////////////////////////////////////////////////


   PB1_DBD pb1_dbd(.nreset(ec_nreset),
		   .clk2(ec_clk2),
		   .clk4(ec_clk4),
		   .nt34(ec_nt34),
		   .nws(ec_nws),
		   .nmem(ec_nmem),
		   .nio(ec_nio),
		   .nr(ec_nr),
		   .nwen(c1_nwen),
		   .nw(ec_nw),
		   .ibus(c2_ibus),
		   .dbus(ec_db));

   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // SIGNAL ASSIGNMENTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The CFT Bus.

   // Control Bus
   assign c1_ir0 = ir[0];
   assign c1_ir2 = ir[2];
   assign c1_ir11 = ir[11];
   assign c2_ir12_15 = ir[15:12];
   
   // Control bus

   // Front Panel, connector 1
   // assign p1_ir = ir;
   // assign p1_nincpc = uc_nincpc;

   // Front Panel, connector 2
   // assign p2_bupc = uc_upc;
   // assign p2_bmem = ~ec_nmem;
   // assign p2_bio = ~ec_nio;
   // assign p2_br = ~ec_nr;
   // assign p2_bw = ~uc_nwen;	// To allow for longer LED pulse
   // assign p2_nbirqs = ec_nirqs;
   

endmodule // PB1

// End of file.
