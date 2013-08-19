///////////////////////////////////////////////////////////////////////////////
//
// PB1-uCB-test.v -- Processor Board A, uCB linkage
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

`include "../PB0.v"

`timescale 1ns/10ps


// DO NOT USE FOR NOW.

/* -----\/----- EXCLUDED -----\/-----
module PB0_test();

   wire [3:0] uc_runit;		// Read unit, 4 bits
   wire [2:0] uc_wunit;		// Write unit, 3 bits
   wire [3:0] uc_opif;		// Conditional code, 4 bholits
   wire       uc_ncpl;		// Complement L, active low
   wire       uc_ncll;		// Clear L, active low
   wire       uc_nsti;		// Allow interrupts, active low
   wire       uc_ncli;		// Mask interrupts, active low
   wire       uc_nincpc;	// Increment PC strobe, active low
   wire       uc_nstpdr;	// Step DR strobe, active low
   wire       uc_nstpac;	// Step AC storbe, active low
   wire       uc_ndec;		// 1: step = inc, 0: step=dec
   wire       uc_nmem;		// Memory strobe, active low
   wire       uc_nio;		// I/O strobe, active low
   wire       uc_nr;		// Read strobe, active low
   wire       uc_nwen;		// Write enable active low
   wire       uc_nend;		// End of instruction, active low

   wire [3:0] upc;
   wire       naindex;
   wire       nskip;
   wire       ir11;
   wire [3:0] ir12_15;
   wire       fl;
   wire       fv;

   reg 	      nreset;
   reg 	      nrsthold;
   reg 	      clk4;
   reg 	      nws;
   reg 	      nhalt;
   reg 	      nend;
   reg 	      nendext;

   wire       nuce;

   wire [23:0] ctlvec;

   integer    i, j;

   integer    upc0;

   // Ensure uPC resets when appropriate
   always @(negedge nrsthold) begin
      #30 if (upc !== 4'b0000) begin
   	 $display("%s: [fail] uPC did not reset on RSTHOLD# assertion.",
   		  `TESTNAME);
   	 $display ("%s: [fail] uPC reset error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   always @(posedge clk4) begin
      #30 if (nend == 0 && upc !== 4'b0000) begin
   	 $display("%s: [fail] uPC did not reset on END# assertion.",
   		  `TESTNAME);
   	 $display ("%s: [fail] uPC reset error.", `TESTNAME);
   	 #100 $finish;
      end else if (nendext == 0 && upc != 4'b0000) begin
   	 $display("%s: [fail] uPC did not reset on ENDEXT# assertion.",
   		  `TESTNAME);
   	 $display ("%s: [fail] uPC reset error.", `TESTNAME);
   	 #100 $finish;
      end
   end // always @ (posedge clk4)

   always @(posedge clk4) begin
      if (nend == 1 && nendext == 1 && nreset == 1 && nrsthold == 1) begin
	 upc0 <= upc;
	 #30 if (upc0 == upc) begin
   	    $display("%s: [fail] uPC did not increment on raising edge of CLK4.",
   		     `TESTNAME);
   	    $display ("%s: [fail] uPC count error.", `TESTNAME);
	 end
      end
   end

   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB0-uCB.vcd");
      $dumpvars (0, PB0_uCB);
`endif
      
      // Reset

      nreset <= 0;
      nrsthold <= 0;
      clk4 <= 1;
      nws <= 1;
      nhalt <= 1;
      nend <= 1;
      nendext <= 1;

      #500 nreset <= 1;
      #500 nrsthold <= 1;

      #2000 for (j = 0 ; j < 20; j = j + 1) begin
	 for (i = 0 ; i < j ; i = i + 1) begin
	    #187 clk4 <= 0;
	    #63 clk4 <= 1;
	 end

	 #157 nend <= 0;
	 #30 clk4 <= 0;
	 #63 clk4 <= 1;
	 #30 nend <= 1;
      end

      #2000 for (j = 0 ; j < 20; j = j + 1) begin
	 for (i = 0 ; i < j ; i = i + 1) begin
	    #187 clk4 <= 0;
	    #63 clk4 <= 1;
	 end

	 #157 nendext <= 0;
	 #30 clk4 <= 0;
	 #63 clk4 <= 1;
	 #30 nendext <= 1;
      end

      #2000 nreset <= 0;
      #40 nrsthold <= 0;
      #500 nreset <= 1;
      #500 nrsthold <= 1;

      #2000 nhalt <= 0;
      #500 nhalt <= 1;

      #2000 nws <= 0;
      #500 nws <= 1;

      #5000 ;
      $display("%s: [ok] Pass (A-to-uCB linkage and uPC).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   assign naindex = 1;
   assign nskip = 1;
   assign ir11 = 0;		// R = 0
   assign ir12_15 = 4'b1111;	// Select LA microprogram
   assign fl = 0;
   assign fv = 0;
   
   assign {uc_nend,
	   uc_nwen,
	   uc_nr,
	   uc_nio,
 	   uc_nmem,
 	   uc_ndec,
 	   uc_nstpac,
 	   uc_nstpdr,
 	   uc_nincpc,
 	   uc_ncli,
 	   uc_nsti,
 	   uc_ncll,
 	   uc_ncpl,
 	   uc_opif,
 	   uc_wunit,
	   uc_runit} = ctlvec;

   assign {upc,
	   naindex,
	   nskip,
	   ir11,
	   ir12_15,
	   fl,
	   fv,
	   rsthold
	   } = uaddr;

   PB0 dut(
	   .ec_ab(0),                     // 16-bit address bus
	   .ec_aext(0),		          // 8-bit address bus extension
	   .ec_db(0),			  // 16-bit data bus
	   .ec_nirq0(1),	          // Single open drain interrupt line
	   .ec_nirq(255);,	          // 8 open drain interrupt lines

	   .ec_nirqs(ec_nirqs),	          // IRQ acknowledge, active low
	   .ec_nmem(ec_nmem),		  // memory strobe, active low
	   .ec_nio(ec_nio),		  // I/O strobe, active low
	   .ec_nr(ec_nr),		  // read strobe, active low
	   //.ec_nw(ec_nw),	          // write strobe, active low
	   .ec_nhalt(nhalt),		  // halt machine, open drain
	   .ec_nreset(nreset),		  // reset machine, open drain
	   .ec_nrsthold(nrsthold),	  // reset hold
	   .ec_nendext(nendext),	  // end current instruction, open drain
	   .ec_nws(nws),	       // *** wait state, open drain
	   .ec_nsysdev(1),	          // I/O 0000-00FF selected
	   .ec_niodev1xx(1),		  // I/O 0100-01FF selected
	   .ec_niodev2xx(1),		  // I/O 0200-02FF selected
	   .ec_niodev3xx(1),		  // I/O 0300-03ff selected
	   .ec_clk1(1),			  // 4 MHz clock, 75%, 90°
	   .ec_clk2(1),			  // 4 MHz clock, 75%, 180°
	   .ec_clk3(1),			  // 4 MHz clock, 75%, 270°
	   .ec_clk4(clk4),	       // *** 4 MHz clock, 75%, 0°
	   .ec_nt34(1),		          // 4 MHz clock, 50%, 0°

           // Control Bus, Port 2 (P1)
           .c1_ncll(uc_ncll),	       // *** 1     CLL#
           .c1_ncpl(uc_ncpl),	       // *** 2     CPL#
           .c1_nragl(uc_nragl),	       // *** 3     RAGL#
           .c1_nwalu(uc_nwalu),	       // *** 4     WALU#
           .c1_fl(fl),		       // *** 5     FL (output from PB C)
           .c1_fv(fv),		       // *** 6     FV (output from PB C)
           .c1_ir0(0),		          // 7     IR[0]
           .c1_ir2(0),			  // 9     IR[2]
           .c1_nend(nend),	       // *** 10    END#
           .c1_runit(c1_runit),		  // 11-14 RUNIT (4 bits)
           .c1_nskip(nskip),	       // *** 15    SKIP#
           .c1_nsti(c1_nsti),		  // 16    STI#
           .c1_ncli(c1_ncli),		  // 17    CLI#
           .c1_opif(c1_opif),		  // 18-21 OPIF (4 bits)
           .c1_ir11(ir11),	       // *** 22    IR[11] (indirection mode)
           .c1_ac(c1_ac),		  // 23-38 Accumulator (16 bits, PBB->PBC)
           .c1_naccpl(c1_naccpl),	  // 39    CACPL#
           .c1_ndec(c1_ndec),		  // 40    DEC#

           // Control Bus, Port 1 (P2)
           .c2_nstpac(c2_nstpac),         // 1     STPAC#
           .c2_nstpdr(c2_nstpdr),	  // 2     STPDR#
           .c2_nincpc(c2_nincpc),	  // 3     INCPC#
           .c2_nrac(c2_nrac),		  // 4     ;RAC#
           .c2_nrdr(c2_nrdr),		  // 5     RDR#
           .c2_nrpc(c2_nrpc),		  // 6     RPC#
           .c2_nwac(c2_nwac),		  // 7     WAC#
           .c2_nwar(c2_nwar),		  // 8     WAR#
           .c2_nwdr(uc_nwdr),		  // 9     WDR#
           .c2_nwpc(uc_nwpc),		  // 10    WPC#
           .c2_fneg(c2_fneg),		  // 11    FNEG (input from PB B)
           .c2_fzero(c2_fzero),		  // 12    FZERO (input from PB B)
           .c2_pc10_15(c2_pc10_15),	  // 13-18 PC[15:10]
           .c2_nwir(uc_nwir),		  // 19    WIR#
           .c2_naindex(naindex),       // *** 20    AINDEX#
           .c2_ibus(c2_ibus),		  // 21-36 IBUS (16 bits, I/O)
           .c2_ir12_15(ir12_15)	       // *** 37-40 IR[15:12] (4 bits)
	   );

   assign upc = dut.upc;
   assign nuce = dut.nuce;
   
endmodule // PB0_test
 -----/\----- EXCLUDED -----/\----- */

// End of file.
