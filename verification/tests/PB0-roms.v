///////////////////////////////////////////////////////////////////////////////
//
// PB0-roms.v -- Processor Board, Microcode Store, ROM testbed
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

`include "../PB0-ROM.v"

`timescale 10ns/10ps

module PB0_roms();

   // Personality connector: outputs
   input [3:0] 	     uc_runit;     // Read unit, 4 bits
   input [2:0] 	     uc_wunit;     // Write unit, 3 bits
   input [3:0] 	     uc_opif;      // Conditional code, 4 bholits
   input 	     uc_ncpl;      // Complement L, active low
   input 	     uc_ncll;      // Clear L, active low
   input 	     uc_nsti;      // Allow interrupts, active low
   input 	     uc_ncli;	   // Mask interrupts, active low
   input 	     uc_nincpc;	   // Increment PC strobe, active low
   input 	     uc_nstpdr;	   // Step DR strobe, active low
   input 	     uc_nstpac;	   // Step AC storbe, active low
   input 	     uc_ndec;	   // 1: step = inc, 0: step=dec
   input 	     uc_nmem;	   // Memory strobe, active low
   input 	     uc_nio;	   // I/O strobe, active low
   input 	     uc_nr;	   // Read strobe, active low
   input 	     uc_nwen;	   // Write enable active low
   input 	     uc_nend;	   // End of instruction, active low

   parameter TABLE_SIZE = 19; // Size of microcode ROMs (bits)

   integer 	     i, j;
   reg [7:0] 	     d0[0:(1 << TABLE_SIZE) - 1];
   reg [7:0] 	     d1[0:(1 << TABLE_SIZE) - 1];
   reg [7:0] 	     d2[0:(1 << TABLE_SIZE) - 1];

   reg 		     nuce;
   reg [18:0] 	     uaddr;
   wire [23:0] 	     data;

   reg [3:0] 	     upc;	// dummy
   reg [4096:0]      basedir, s0, s1, s2;

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
	   uc_runit} = data;


   always @(uc_runit, uc_nr) begin
      if (uc_runit !== 0 && uc_nr === 0) begin
	 $display("%s: [fail] uaddr=%x: data=%x: runit=%04b and nr=%b.",
		  `TESTNAME, uaddr, data, uc_runit, uc_nr);
	 $display ("%s: [fail] Bus collision", `TESTNAME);
	 #100 $finish;
      end
   end
   
   always @(uc_nio, uc_nmem) begin
      if (uc_nio === 0 && uc_nmem === 0) begin
	 $display("%s: [fail] uaddr=%x: IO# and MEM# asserted simultaneously.",
		  `TESTNAME, uaddr);
	 $display ("%s: [fail] Bus collision", `TESTNAME);
	 #100 $finish;
      end
   end
   
   always @(uc_nr, uc_nwen) begin
      if (uc_nr === 0 && uc_nwen === 0) begin
	 $display("%s: [fail] uaddr=%x: R# and WEN# asserted simultaneously.",
		  `TESTNAME, uaddr);
	 $display ("%s: [fail] Bus collision", `TESTNAME);
	 #100 $finish;
      end
   end
   
   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
//`ifdef WRITE_VCD
      $dumpfile ("vcd/PB0-roms.vcd");
      $dumpvars (0, PB0_roms);
//`endif
      
      if (!$value$plusargs("basedir=%s", basedir)) basedir = `BASEDIR;
      $sformat(s0, "%-0s/microcode/microcode-00.list", basedir);
      $sformat(s1, "%-0s/microcode/microcode-01.list", basedir);
      $sformat(s2, "%-0s/microcode/microcode-02.list", basedir);

      $readmemb(s0, d0);
      $readmemb(s1, d1);
      $readmemb(s2, d2);

      // Reset. Normally, the bus is driven by the processor but in this case,
      // we just idle it to test the microcode ROMs with actually driving any
      // processor units.

      uaddr <= 0;
      nuce <= 1;

      // Come out of tri-state
      #1000 nuce <= 0;

      for (j = 0; j < 16; j = j + 1) begin

	 // Only checking one bank
	 for (i = 0; i < (1 << (TABLE_SIZE - 4)); i = i + 1) begin

	    // Decode the address (i)
	    #100 uaddr <= i[14:0];

	    // Reconstruct the output vector

	    #100 begin

	       // Assert the data returned to be the same as in the ROM files.
	       // $display("%s: i=%h: (%h,%h) (%h,%h) (%h,%h)", `TESTNAME, i,
	       // 	     d0[i], data[7:0],
	       // 	     d1[i], data[15:8],
	       // 	     d2[i], data[23:16]);
	       
	       if (data[7:0] != d0[i]) begin
		  $display("%s: [fail] i=%1d/%h: microcode ROM 00 (%h) and microcode store (%h) disagree",
			   `TESTNAME, j, i, d0[i], data[7:0]);
		  $display ("%s: [fail] Assertion failed (ROM 00 mismatch).", `TESTNAME);
		  #100 $finish;
	       end
	       if (data[15:8] != d1[i]) begin
		  $display("%s: [fail] i=%1d/%h: microcode ROM 01 (%h) and microcode store (%h) disagree",
			   `TESTNAME, j, i, d1[i], data[15:8]);
		  $display ("%s: [fail] Assertion failed (ROM 01 mismatch).", `TESTNAME);
		  #100 $finish;
	       end
	       if (data[23:16] != d2[i]) begin
		  $display("%s: [fail] i=%1d/%h: microcode ROM 02 (%h) and microcode store (%h) disagree",
			   `TESTNAME, j, i, d2[i], data[23:16]);
		  $display ("%s: [fail] Assertion failed (ROM 02 mismatch).", `TESTNAME);
		  #100 $finish;
	       end
	    end
	 end // for (i = 0; i < (1 << (TABLE_SIZE - 4)); i = i + 1)
	 $display("%s: [ok] Pass (microcode ROM bank %1d/15).", `TESTNAME, j);

      end // for (j = 0; j < 16; j = j + 1)
      

      #500 $finish;      // Terminate simulation
   end // initial begin

   PB0_ROM dut(uaddr, data, nuce);
			  
endmodule
