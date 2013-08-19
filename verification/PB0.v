///////////////////////////////////////////////////////////////////////////////
//
// PB0.v -- Processor Board, Microcode Store
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

`include "rom.v"
`include "demux.v"
`include "flipflop.v"
`include "mux.v"
`include "PB0-UPC.v"
`include "PB0-ROM.v"
`include "PB0-UCB.v"
`include "PB0-decoders.v"

`timescale 1ns/1ps


`ifndef BASEDIR
 `define BASEDIR ".."
`endif // BASEDIR


// Define to allow the UCB extension to be built.
`define HAVE_UCB 1


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board: microcode personality
//
///////////////////////////////////////////////////////////////////////////////

module PB0(
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

	   // Front panel connector (not in order!)
	   p1_fv,
	   p1_nincpc,
	   p1_nstpdr,
	   p1_ncpl,
	   p1_nio,
	   p1_nmem,
	   p1_nr,
	   p1_nwen,
	   p1_wunit,      //       WUNIT (3 bits)
	   p1_runit,      //       RUNIT (4 bits)
	   p1_upc,        //       UPC (4 bits)
	   p1_opif,       //       OPIF (4 bits)
	   p1_ndec,       //       DEC#
	   p1_nend,       //       END#
	   p1_nstpac,
	   p1_ncli,
	   p1_fl,
	   p1_nsti,
	   p1_ncll,
	   p1_nrsthold,
	   p1_nirqs,
	   p1_naindex,
	   p1_nskip,
	   p1_ucb,        //       UCB (4 bits)

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
   input        ec_nirqs;     // IRQ acknowledge, active low
   inout        ec_nmem;      // memory strobe, active low
   inout        ec_nio;       // I/O strobe, active low
   inout        ec_nr;        // read strobe, active low
   input        ec_nw;        // write strobe, active low
   input        ec_nhalt;     // halt machine, open drain
   input        ec_nreset;    // reset machine, open drain
   input        ec_nrsthold;  // reset hold, active low
   input        ec_nendext;   // end current instruction, open drain
   input        ec_nskipext;  // skip input, open drain
   input        ec_nws;       // wait state, open drain
   input        ec_nsysdev;   // I/O 0000-00FF selected
   input        ec_niodev1xx; // I/O 0100-01FF selected
   input        ec_niodev2xx; // I/O 0200-02FF selected
   input        ec_niodev3xx; // I/O 0300-03ff selected
   input        ec_clk1;      // 4 MHz clock, 75%, 90°
   input        ec_clk2;      // 4 MHz clock, 75%, 180°
   input        ec_clk3;      // 4 MHz clock, 75%, 270°
   input        ec_clk4;      // 4 MHz clock, 75%, 0°
   input        ec_nt34;      // 4 MHz clock, 50%, 0°

   // Control Bus, Port 1 (P1)
   output 	c1_ncll;       // 1     CLL#
   output 	c1_ncpl;       // 2     CPL#
   output 	c1_nragl;      // 3     RAGL#
   output 	c1_nwalu;      // 4     WALU#
   inout 	c1_fl;         // 5     FL
   inout 	c1_fv;         // 6     FV
   inout 	c1_ir0;        // 7     IR[0]
   output 	c1_nwen;       // 8     WEN#
   inout 	c1_ir2;        // 9     IR[2]
   output 	c1_nend;       // 10    END#
   output [3:0] c1_runit;      // 11-14 RUNIT (4 bits)
   inout 	c1_nskip;      // 15    SKIP#
   output 	c1_nsti;       // 16    STI#
   output 	c1_ncli;       // 17    CLI#
   output [3:0] c1_opif;       // 18-21 OPIF (4 bits)
   inout 	c1_ir11;       // 22    IR[11] (indirection mode)
   inout [15:0] c1_ac;         // 23-38 Accumulator (16 bits; PBB->PBC)
   inout 	c1_naccpl;     // 39    ACCPL#
   inout 	c1_ndec;       // 40    DEC#

   // Control Bus, Port 2 (P2)
   output 	c2_nstpac;     // 1     STPAC#
   output 	c2_nstpdr;     // 2     STPDR#
   output 	c2_nincpc;     // 3     INCPC#
   output 	c2_nrac;       // 4     RAC#
   output 	c2_nrdr;       // 5     RDR#
   output 	c2_nrpc;       // 6     RPC#
   output 	c2_nwac;       // 7     WAC#
   output 	c2_nwar;       // 8     WAR#
   output 	c2_nwdr;       // 9     WDR#
   output 	c2_nwpc;       // 10    WPC#
   inout 	c2_fneg;       // 11    FNEG (input from PB B)
   inout 	c2_fzero;      // 12    FZERO (input from PB B)
   inout [5:0] 	c2_pc10_15;    // 13-18 PC[15:10]
   output 	c2_nwir;       // 19    WIR#
   inout 	c2_naindex;    // 20    AINDEX#
   inout [15:0] c2_ibus;       // 21-36 IBUS (16 bits; I/O)
   inout [3:0] 	c2_ir12_15;    // 37-40 IR[15:12] (4 bits)

   // Front Panel Output (we do not emulate buffering on these outputs)
   output 	p1_fv;
   output 	p1_nincpc;
   output 	p1_nstpdr;
   output 	p1_ncpl;
   output 	p1_nio;
   output 	p1_nmem;
   output 	p1_nr;
   output 	p1_nwen;
   output [2:0] p1_wunit;      //       WUNIT (3 bits)
   output [3:0] p1_runit;      //       RUNIT (4 bits)
   output [3:0] p1_upc;        //       UPC (4 bits)
   output [3:0] p1_opif;       //       OPIF (4 bits)
   output 	p1_ndec;       //       DEC#
   output 	p1_nend;       //       END#
   output 	p1_nstpac;
   output 	p1_ncli;
   output 	p1_fl;
   output 	p1_nsti;
   output 	p1_ncll;
   output 	p1_nrsthold;
   output 	p1_nirqs;
   output 	p1_naindex;
   output 	p1_nskip;
   output [3:0] p1_ucb;        //       UCB (4 bits)

   // Pulling up/down inputs
   pullup(ec_nendext);		// Sheet 2
   pullup(ec_nhalt);		// Sheet 2
   pullup(ec_nws);		// Sheet 2

   // Pulling up/down outputs
   pulldown(runit[0]);
   pulldown(runit[1]);
   pulldown(runit[2]);
   pulldown(runit[3]);
   
   pulldown(wunit[0]);
   pulldown(wunit[1]);
   pulldown(wunit[2]);
   
   pulldown(opif[0]);
   pulldown(opif[1]);
   pulldown(opif[2]);
   pulldown(opif[3]);
   
   pullup(ncpl);
   pullup(ncll);
   pullup(nsti);
   pullup(ncli);
   pullup(nincpc);
   pullup(nstpac);
   pullup(nstpdr);
   pullup(nwen);
   pullup(ndec);
   pullup(nend);

   // Simulate bus hold (badly, but we don't have transmission line
   // effects here, so there's no real difference)
   pullup(ec_ab[0]);
   pullup(ec_ab[1]);
   pullup(ec_ab[2]);
   pullup(ec_ab[3]);
   pullup(ec_ab[4]);
   pullup(ec_ab[5]);
   pullup(ec_ab[6]);
   pullup(ec_ab[7]);
   pullup(ec_ab[8]);
   pullup(ec_ab[9]);
   pullup(ec_ab[10]);
   pullup(ec_ab[11]);
   pullup(ec_ab[12]);
   pullup(ec_ab[13]);
   pullup(ec_ab[14]);
   pullup(ec_ab[15]);
   
   pullup(ec_db[0]);
   pullup(ec_db[1]);
   pullup(ec_db[2]);
   pullup(ec_db[3]);
   pullup(ec_db[4]);
   pullup(ec_db[5]);
   pullup(ec_db[6]);
   pullup(ec_db[7]);
   pullup(ec_db[8]);
   pullup(ec_db[9]);
   pullup(ec_db[10]);
   pullup(ec_db[11]);
   pullup(ec_db[12]);
   pullup(ec_db[13]);
   pullup(ec_db[14]);
   pullup(ec_db[15]);
   
   pullup(ec_aext[0]);
   pullup(ec_aext[1]);
   pullup(ec_aext[2]);
   pullup(ec_aext[3]);
   pullup(ec_aext[4]);
   pullup(ec_aext[5]);
   pullup(ec_aext[6]);
   pullup(ec_aext[7]);

   pullup(ec_nmem);
   pullup(ec_nio);
   pullup(ec_nr);
   pullup(ec_nw);
   
   pullup(ec_clk1);
   pullup(ec_clk2);
   pullup(ec_clk3);
   pullup(ec_clk4);
   pullup(ec_nt34);
   pullup(ec_nsysdev);
   pullup(ec_niodev1xx);
   pullup(ec_niodev2xx);
   pullup(ec_niodev3xx);
   
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // MICROCODE SEQUENCER
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Locals
   wire 	nuce;
   wire [3:0] 	upc;
   wire [3:0] 	runit;
   wire [2:0] 	wunit;
   wire [3:0] 	opif;
   wire 	ncpl, ncll;
   wire 	ncli, nsti;
   wire 	nincpc, nstpdr, nstpac, ndec;
   wire 	nwen;
   wire 	nend;
   
   wire [3:0] 	ucb;       // Microcode bank (4 bits)
   wire [18:0] 	uaddr;     // 19-bit microcode address
   wire [23:0] 	udata;     // 24-bit microcode control signals

   // For debugging
   reg 		debugging_connect_upc;

   initial begin
      debugging_connect_upc <= 1;
   end

   // The UPC
   PB0_UPC UPC (.nrsthold(ec_nrsthold),
		.clk4(ec_clk4),
		.nhalt(ec_nhalt),
		.nws(ec_nws),
		.nend(c1_nend),
		.nendext(ec_nendext),
		.upc(upc));

   // The UCE# signal
   nand #6 ic_00_nuce(nuce, ec_nhalt, ec_nreset);


   ///////////////////////////////////////////////////////////////////////////////
   //
   // MICROCODE ROMS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire nirqcu;
   
   // Encode the ROM address
   assign uaddr = {
		   ucb,		// 18:15
		   ec_nrsthold,	// 14
		   nirqcu,	// 13
		   c1_fv,	// 12
		   c1_fl,	// 11
		   c2_ir12_15,	// 10:7
		   c1_ir11,	// 6
		   c1_nskip,	// 5
		   c2_naindex,	// 4
		   upc		// 3:0
		   };
   

   PB0_ROM pb0_rom (uaddr, udata, nuce);

   // Decode the output data
   assign runit = udata[3:0];
   assign wunit = udata[6:4];
   assign opif = udata[10:7];
   assign ncpl = udata[11];
   assign ncll = udata[12];
   assign nsti = udata[13];
   assign ncli = udata[14];
   assign nincpc = udata[15];
   assign nstpdr = udata[16];
   assign nstpac = udata[17];
   assign ndec = udata[18];
   assign ec_nmem = udata[19];
   assign ec_nio = udata[20];
   assign ec_nr = udata[21];
   assign nwen = udata[22];
   assign nend = udata[23];


   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE WRITE UNIT DECODER
   //
   ///////////////////////////////////////////////////////////////////////////////

   read_unit_decoder PB0_RUD(.nreset(ec_nreset),
			     .clk1(ec_clk1),
			     .nuce(nuce),
			     .runit(runit),
			     .nragl(c1_nragl),
			     .nrpc(c2_nrpc),
			     .nrdr(c2_nrdr),
			     .nrac(c2_nrac));

   write_unit_decoder PB0_WUD(.nreset(ec_nreset),
			      .clk3(ec_clk3),
			      .nuce(nuce),
			      .wunit(wunit),
			      .nwar(c2_nwar),
			      .nwpc(c2_nwpc),
			      .nwir(c2_nwir),
			      .nwdr(c2_nwdr),
			      .nwac(c2_nwac),
			      .nwalu(c1_nwalu));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // SHEET 3: UCB EXTENSION
   //
   ///////////////////////////////////////////////////////////////////////////////

`ifdef HAVE_UCB

   wire ninhibit_irq;
   PB0_UCB pb0_ucb(.nreset(ec_nreset),
		   .nsysdev(ec_nsysdev),
		   .nw(ec_nw),
		   .ab(ec_ab),
		   .nend(c1_nend),
		   .ucb(ucb),
		   .ninhibit_irq(ninhibit_irq));

   or #6 (nirqcu, ninhibit_irq, ec_nirqs);
`else

   // If the UCB extension is absent, solder bridges connect the four
   // UCB lines to ground, and only microcode bank 0 can be accessed.
   assign ucb = 4'b0000;
   assign nirqcu = ec_nirqs;
   
`endif // !`ifdef HAVE_UCB


   ///////////////////////////////////////////////////////////////////////////////
   //
   // CONNECTIONS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Control bus (remaining signals are driven directly)
   assign c1_ncll = ncll;
   assign c1_ncpl = ncpl;
   assign c1_runit = runit;
   assign c1_opif = opif;
   assign c1_nsti = nsti;
   assign c1_ncli = ncli;
   assign c1_ndec = ndec;
   assign c1_nwen = nwen;
   assign c1_nend = nend;

   assign c2_nincpc = nincpc;
   assign c2_nstpdr = nstpdr;
   assign c2_nstpac = nstpac;

   // Front panel output
   assign p1_fv = c1_fv;
   assign p1_nincpc = nincpc;
   assign p1_nstpdr = nstpdr;
   assign p1_ncpl = ncpl;
   assign p1_nio = ec_nio;
   assign p1_nmem = ec_nmem;
   assign p1_nr = ec_nr;
   assign p1_nwen = nwen;
   assign p1_wunit = wunit;
   assign p1_runit = runit;
   assign p1_upc = upc;
   assign p1_opif = opif;
   assign p1_ndec = ndec;
   assign p1_nend = nend;
   assign p1_nstpac = nstpac;
   assign p1_ncli = ncli;
   assign p1_fl = c1_fl;
   assign p1_nsti = nsti;
   assign p1_ncll = ncll;
   assign p1_nrsthold = ec_nrsthold;
   assign p1_nirqs = ec_nirqs;
   assign p1_naindex = c2_naindex;
   assign p1_nskip = c1_nskip;
   assign p1_ucb = ucb;

endmodule // PB0

// End of file.
