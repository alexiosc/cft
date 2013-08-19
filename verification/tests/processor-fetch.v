///////////////////////////////////////////////////////////////////////////////
//
// processor-fetch.v -- Basic Processor test (fetch/execute cycle)
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

`include "../processor.v"

`timescale 1ns/10ps

// A tiny ROM that contains a short test program
module fake_ROM(ncs, noe, a, y);
   input         ncs, noe;
   input [15:0]  a;
   output [15:0] y;

   reg [15:0] 	 y0;

   always @(a) begin
      case (a[1:0])
	0: y0 <= 16'hd000;	// NOP
	1: y0 <= 16'hd000;	// NOP
	2: y0 <= 16'hd000;	// NOP
	3: y0 <= 16'h63f0;	// JMP 3f0 (fff0)
      endcase // case (a[1:0])
   end
      
   assign #70 y = ncs || noe ? 16'bzzzzzzzzzzzzzzzz : y0;
   
endmodule // fake_ROM


module processor_fetch();

   wire        nreset;
   wire        clk1, clk2, clk3, clk4, nt34;
   wire [15:0] ab, db;
   wire        nmem, nio, nr, nw;
   
   reg 	       nreset_drv;


   assign nreset = nreset_drv;


   always @(ab) begin
      if (nreset) case (ab)
	16'HZZZZ: ;
	16'Hfff0: ;
	16'Hfff1: ;
	16'Hfff2: ;
	16'Hfff3: ;
	default: begin
   	   $display("%s: [fail] Address Bus not driving expected values (was %04h).",
   		    `TESTNAME, ab);
   	   $display ("%s: [fail] Address Bus failure.", `TESTNAME);
   	   #100 $finish;
	end // always @ (ab)
      endcase // case (ab)
   end // always @ (ab)
	



   always @(db) begin
      if (nreset) case (db)
	16'HZZZZ: ;
	16'Hfff0: ;		// Reset vector
	16'H63f0: ;
	16'Hd000: ;
	default: begin
   	   $display("%s: [fail] Data Bus not showing expected values (was %04h).",
   		    `TESTNAME, db);
   	   $display ("%s: [fail] Data Bus failure.", `TESTNAME);
   	   #100 $finish;
	end
      endcase // case (db)
   end // always @ (db)
	

   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/processor-fetch.vcd");
      $dumpvars (0, processor_fetch);
`endif
      
      // Reset
      nreset_drv <= 1'b0;

      #1000 nreset_drv <= 1'bz;


      #5000000 ;
      $display("%s: [ok] Pass (fetch-execute cycle).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   fake_ROM rom(.noe(nr), .ncs(nmem), .a(ab), .y(db));

   processor dut(
		 // DIN-41612
		 .ec_ab(ab),         // 16-bit address bus
		 //ec_aext,       // 8-bit address bus extension
		 .ec_db(db),         // 16-bit data bus
		 /*
		 ec_nirq0,	// Single open drain interrupt line
		 ec_nirq,       // 8 open drain interrupt lines
		 ec_nirqs,      // IRQ acknowledge, active low
		  */
		 .ec_nmem(nmem),       // memory strobe, active low
		 .ec_nio(nio),        // I/O strobe, active low
		 .ec_nr(nr),         // read strobe, active low
		 .ec_nw(nw),         // write strobe, active low
		  /*
		 ec_nhalt,      // halt machine, open drain
		  */
		 .ec_nreset(nreset),    // reset machine, open drain
		 /*
		 ec_nendext,    // end currentinstruction, open drain
		 ec_nskipext,   // skip input, open drain
		 ec_nws,        // wait state, open drain
		 ec_nsysdev,    // I/O 0000-00FF selected
		 ec_niodev1xx,  // I/O 0100-01FF selected 
		 ec_niodev2xx,  // I/O 0200-02FF selected
		 ec_niodev3xx,  // I/O 0300-03ff selected
		  */
		 .ec_clk1(clk1),       // 4 MHz clock, 75%, 90°
		 .ec_clk2(clk2),       // 4 MHz clock, 75%, 180°
		 .ec_clk3(clk3),       // 4 MHz clock, 75%, 270°
		 .ec_clk4(clk4),       // 4 MHz clock, 75%, 0°
		 .ec_nt34(nt34)       // 4 MHz clock, 50%, 0°

		 // Front panel, microcode
		 /*
		 pu1_ucb,	// Front panel UCB output (2 bits)
		  */

		 // Front Panel I/O Connectors for board A
		 /*
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
		  */
		 // Plus 8 unused pins

		 // Front Panel Buffered Light Connector B
		 /*
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
		  */
		 // Plus 3 unused pins

		 // Front Panel Buffered Light Connector A
		 /*
		 pb1_pc,        // Program Counter register (16 bits)
		 pb1_dr,	// Data Register (16 bits)
		  */
		 // Plus 8 unused pins

		 // Front Panel Buffered Light Connector B
		 /*
		 pb2_ac,        // Accumulator (16 bits)
		  */
		 // Plus 24 unused pins

                 // Front panel, MBU connectors
		 /*
		 pc1_aext,       // MBU output to front panel
		 pc1_banking,    // MBU output to front panel
		 pc1_nfpram,     // MBU input from the RAM/ROM switch
		  */
		 );

			  
endmodule // processor_test

// End of file.
