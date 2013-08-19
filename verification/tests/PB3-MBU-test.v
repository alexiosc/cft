///////////////////////////////////////////////////////////////////////////////
//
// PB3-MBU-test.v -- Processor Board C, MBU test
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

`include "../PB3-MBU.v"

`timescale 1ns/10ps
`define MAX 256

module PB3_MBU_test();

   reg [15:0]  ab;
   wire [15:0] db;
   reg 	       nmem;
   reg 	       nw;
   reg 	       nreset;
   reg 	       nsysdev;

   wire        nfpram;
   wire        banking;
   
   wire [7:0] aext;

   reg [15:0]  db_drv;
   assign db = db_drv;

   reg 	       nfpram_drv;
   assign nfpram = nfpram_drv;

   integer     i, j, k, cor, cor_i;
   

   // Represent both hardwired memory maps
   reg [7:0]   testvector [15:0];

   // Test initialistion
   always @(posedge nreset) begin
      #20 if (banking !== 0) begin
   	 $display("%s: [fail] BANKING# did not reset to 1.",
   	    	  `TESTNAME);
   	 $display ("%s: [fail] BANKING# reset failure.", `TESTNAME);
   	 #100 $finish;
      end
   end

   // Test tri-stating
   always @(ab) begin
      if (nmem == 1 && nreset == 1) begin
	 #20 if (aext !== 8'bzzzzzzzz) begin
   	    $display("%s: [fail] AEXT did not tri-state when MEM# deasserted.",
   	    	     `TESTNAME);
   	    $display ("%s: [fail] AEXT tri-stating error.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end

   task test_hardwired;
      begin

	 // The RAM config (FPRAM# = index[4] = 0, i.e. indices 0..7)
	 testvector[0] = 8'h00;
	 testvector[1] = 8'h01;
	 testvector[2] = 8'h02;
	 testvector[3] = 8'h03;
	 testvector[4] = 8'h04;
	 testvector[5] = 8'h05;
	 testvector[6] = 8'h06;
	 testvector[7] = 8'h07;

	 // The RAM+ROM config (FPRAM# = index[4] = 1, i.e. indices 8..15)
	 testvector[8] = 8'h00;
	 testvector[9] = 8'h01;
	 testvector[10] = 8'h02;
	 testvector[11] = 8'h03;
	 testvector[12] = 8'h80;
	 testvector[13] = 8'h81;
	 testvector[14] = 8'h82;
	 testvector[15] = 8'h83;

	 for (i = 0; i < 65536; i = i + 1) begin
	    #187 ab <= i;
	    nmem <= 0;

	    // Check AEXT based on AB
	    #30 begin
	       cor_i = {nfpram, ab[15:13]};
	       if (aext !== testvector[cor_i]) begin
   		  $display("%s: [fail] nfpram=%b, ab=%4h: AEXT should be %2h (bank reg #%1d), was %2h.",
   	    		   `TESTNAME, nfpram, ab, testvector[cor_i], ab[15:13], aext);
   		  $display ("%s: [fail] Hardwired mapping error.", `TESTNAME);
   		  #100 $finish;
	       end
	    end

	    #33 nmem <= 1;
	 end // for (i = 0; i < 65536; i = i + 1)
      end
   endtask // test_hardwired


   task set_reg;
      input [2:0] addr;
      input [15:0] val;

      begin
	 #63 ab <= 16'h0020 | addr;
	 db_drv <= val;
	 nsysdev <= 0;
	 #63 nw <= 0;
	 #63 nw <= 1;
	 #125 nsysdev <= 1;
      end
   endtask // set_reg
   
   
   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB3-MBU-test.vcd");
      $dumpvars (0, PB3_MBU_test);
`endif

      // Initialise the hardwired config vectors. Bit 4 of the index is the
      // value of FPRAM#.

      // Reset and initialise
      ab <= 16'hfff0;
      db_drv <= 0;
      nmem <= 1;
      nw <= 1;
      nreset <= 0;
      nsysdev <= 1;
      nfpram_drv <= 1'bz;

      #500 nreset <= 1;

      // Test hardwired boot-time mappings. First, try the RAM+ROM layout, then
      // the RAM layout
      for (j = 0; j < 2; j = j + 1) begin
	 #50000 nfpram_drv <= ~(j & 1);
	 nreset <= 0;
	 #250 nreset <= 1;
	 #50000 ;

	 test_hardwired();

	 $display("%s: [ok] Pass (MBU hardwired mapping for FPRAM#=%b).",
		  `TESTNAME, nfpram);
      end // for (j = 0; j < 2; j = j + 1)


      // Test enabling and disabling the hardwired mapping.
      for (i = 0; i < 3; i = i + 1) begin
	 // DB=0 means ENABLE MBU. DB=1 means DISABLE MBU.
	 cor = i & 1 ? 0 : 1;
	 #100000;
	 set_reg(0, cor ? 0 : 256);

	 #100 if (banking !== cor) begin
   	    $display("%s: [fail] DB8 (banking enable) bit was %b during BANK0 write, but BANKING# is %d",
   	    	     `TESTNAME, cor[0], banking ^ 1);
   	    $display ("%s: [fail] Banking enable error.", `TESTNAME);
   	    #100 $finish;
	 end
      end // for (i = 0; i < 4; i = i + 1)

      // The previous step left banking enabled. Program patterns and test
      // them. The test domain has 3×8×16=384 bits (banks × values ×
      // addresses), far too much to test exhaustively. We therefore test each
      // banking register separately, and only test every 1024th
      // address. 8×256×64 is 17 bits.

      for (k = 0; k < `MAX; k = k + 1) begin
	 // Program a memory mapping
	 #100000 for (i = 0; i < 8; i = i + 1) begin
	    cor = ((i + k) & 255);
	    set_reg(i, cor);
	    testvector[i] <= cor & 255;
	 end

	 // Test the memory mapping
	 for (i = 0; i < 65536; i = i + 64) begin
	    #187 ab <= i;
	    nmem <= 0;

	    // Check AEXT based on AB
	    #63 begin
	       cor_i = {nfpram, ab[15:13]};
	       if (aext !== testvector[cor_i]) begin
   		  $display("%s: [fail] nfpram=%b, ab=%4h: AEXT should be %2h (bank reg #%1d), was %2h.",
   	    		   `TESTNAME, nfpram, ab, testvector[cor_i], ab[15:13], aext);
   		  $display ("%s: [fail] Programmed mapping error.", `TESTNAME);
   		  #100 $finish;
	       end
	    end

	    nmem <= 1;
	 end // for (i = 0; i < 65536; i = i + 1)
	 //$display("%s: [ok] Pass (MBU, test config %1d/%1d).", `TESTNAME, k, `MAX);
      end
      $display("%s: [ok] Pass (MBU soft mapping).", `TESTNAME);
	 
      // Turn off soft mapping and test hardwired mappings again.
      #50000 set_reg(0, 256);
      
      #50000 for (j = 0; j < 2; j = j + 1) begin
	 #50000 nfpram_drv <= ~(j & 1);
	 nreset <= 0;
	 #250 nreset <= 1;
	 #50000 ;

	 test_hardwired();

	 $display("%s: [ok] Pass (MBU hardwired mapping for FPRAM#=%b).",
		  `TESTNAME, nfpram);
      end // for (j = 0; j < 2; j = j + 1)
      
      // Turn on soft mapping and reset to test initialisation.
      #50000 set_reg(0, 0);
      #50000 nreset <= 0;
      #500 nreset <= 1;
      
      #50000 ;
      $display("%s: [ok] Pass (MBU).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB3_MBU dut(ab,         // 16-bit address bus
			     aext,       // 8-bit address bus extension
			     db,         // 16-bit data bus
			     nmem,       // memory strobe, active low
			     nw,         // write strobe, active low
			     nreset,     // reset machine, open drain
			     nsysdev,    // I/O 0000-00FF selected
			     
			     // From Processor Board B
			     nfpram,     // 1 = RAM/ROM bootstrap, 0 = RAM only
			     banking	 // Front panel output
			     );
			  
endmodule // PB3_MBU_test



// End of file.
