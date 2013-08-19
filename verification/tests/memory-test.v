///////////////////////////////////////////////////////////////////////////////
//
// memory-test.v -- Test the memory card (MEM)
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

`include "../memory.v"

`timescale 1ns/10ps


module memory_test();

   reg [15:0] ab;
   reg [15:0] db_drv;
   reg [7:0]  aext;

   reg 	      nmem, nr, nw;

   wire [15:0] db;
   assign db = db_drv;

   integer     i, j;

   always @(negedge nmem, negedge nr, negedge nw) begin
      // R# and W# should never be asserted together
      if (nr == 0 && nw == 0) begin
   	 $display("%s: [fail] R# and W# asserted concurrently (testbench error).",
   		  `TESTNAME);
   	 $display ("%s: [fail] testbench error.", `TESTNAME);
   	 #100 $finish;
      end

      // The data bus should be driven if accessing installed memory.
      if (nmem == 0 && nr == 0 && nw == 1 && aext[6] == 0) begin
	#80 if (db === {16{1'bz}}) begin
   	   $display("%s: [fail] MEM#=%b, R#=%b, AEXT=%02h: memory not driving the data bus!",
   		    `TESTNAME, nmem, nr, aext);
   	   $display ("%s: [fail] memory decoding or tri-state error.", `TESTNAME);
   	   #100 $finish;
	end
      end

      if (nmem == 0 && nr == 0 && nw == 1 && aext[6] == 1) begin
	 #80 if (db !== {16{1'bz}}) begin
   	    $display("%s: [fail] MEM#=%b, R#=%b, AEXT=%02hb: non-existent memory driving the data bus!",
   		     `TESTNAME, nmem, nr, aext);
   	    $display ("%s: [fail] memory decoding or tri-state error.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end
   

   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/memory-test.vcd");
      $dumpvars (0, memory_test);
`endif

      // Initialise the ROM image (since there are no write controls and we
      // have no image on file)
      for (i = 0; i < 524288; i = i + 1) begin
	 dut.ic002_29040_romlo.mem[i] = i[7:0];
	 dut.ic004_29040_romhi.mem[i] = i[15:8];
      end

      // Initialise other things
      nmem <= 1;
      nr <= 1;
      nw <= 1;
      ab <= 0;
      db_drv <= {16{1'bz}};
      aext <= 0;

      #2000;

      // Test mapping and chip select
      for (j = 0; j < 512; j = j + 1) begin
	 #250 aext <= j[7:0];
	 nmem <= j[8];
	 nr <= 0;
	 #250 nr <= 1;
      end

      #5000;

      // Test RAM.
      for (i = 0; i < 524288; i = i + 3) begin
	 #250 begin
	    ab <= i[12:0];
	    aext <= i[20:13];
	    nmem <= 0;
	    db_drv <= i[15:0];
	 end
	 #80 nw <= 0;
	 #250 nw <= 1;
	 #80 db_drv <= {16{1'bz}};
	 #250 nr <= 0;
	 #250 if (db !== i[15:0]) begin
   	    $display("%s: [fail] MEM#=%b, R#=%b, AEXT=%02h, A=%04h: wrote %04h, but read back %04h",
   		     `TESTNAME, nmem, nr, aext, ab, i[15:0], db);
   	    $display ("%s: [fail] RAM write or read error.", `TESTNAME);
   	    #100 $finish;
	 end

	 #20 nmem <= 1;
	 #20 nr <= 1;

	 if ((i % 9000) == 0) begin
	    $display("%s: [ok] RAM write test successful (AEXT=%02h/3f).",
		     `TESTNAME, aext);
	 end
      end
	 
      // Test ROM
      for (i = 0; i < 524288; i = i + 3) begin
	 #250 begin
	    ab <= i[12:0];
	    aext <= {1'b1, i[19:13]};
	    nmem <= 0;
	    db_drv <= i[15:0];
	    nr <= 0;
	 end
	 #80 if (db !== i[15:0]) begin
   	    $display("%s: [fail] MEM#=%b, R#=%b, AEXT=%02h, A=%04h: ROM value should be %04h, was %04h",
   		     `TESTNAME, nmem, nr, aext, ab, i[15:0], db);
   	    $display ("%s: [fail] ROM read error.", `TESTNAME);
   	    #100 $finish;
	 end

	 #20 nmem <= 1;
	 #20 nr <= 1;

	 if ((i % 9000) == 0) begin
	    $display("%s: [ok] ROM read test successful (AEXT=%02h/bf).",
		     `TESTNAME, aext);
	 end
      end
	 

      #5000 ;
      $display("%s: [ok] Pass (fetch-execute cycle).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin
   
   memory dut(
              // DIN-41612
              .ec_ab(ab),	// 16-bit address bus
              .ec_aext(aext),	// 8-bit address bus extension
              .ec_db(db),	// 16-bit data bus
              .ec_nmem(nmem),	// memory strobe, active low
              .ec_nr(nr),	// read strobe, active low
              .ec_nw(nw)	// write strobe, active low
	      );

endmodule // processor_test

// End of file.
