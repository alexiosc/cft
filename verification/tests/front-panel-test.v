///////////////////////////////////////////////////////////////////////////////
//
// front-panel.v -- Test the debugging board (DEB)
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

`include "../front-panel.v"

`timescale 1ns/10ps


module front_panel_test();

   reg [15:0] ab;
   reg [15:0] db_drv;
   reg 	      clk1;
   reg 	      nsysdev;

   reg 	      nio, nr, nw;

   wire       nhalt;

   wire [15:0] db;
   assign db = db_drv;

   integer     i, j;


   task out;
      input [15:0] addr;
      input [15:0] val;

      begin
	 #250 ab <= addr;
	 #30 nsysdev <= 0;
	 #220 db_drv <= val;
	 nio <= 0;
	 #125 nw <= 0;
	 #60 nw <= 1;
	 #65 nsysdev <= 1;
	 nio <= 1;
	 db_drv <= {16{1'bz}};
	 ab <= {16{1'bz}};
      end
   endtask // out
   
   
   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/front-panel-test.vcd");
      $dumpvars (0, front_panel_test);
`endif

      // Initialise other things
      nr <= 1;
      nw <= 1;
      ab <= 0;
      db_drv <= {16{1'bz}};
      nsysdev <= 1;		// Keep it low, whatever.
      nio <= 1;			// Ditto.
      clk1 <= 1;

      // TICK instruction test
      #1000 out (16'h0027, 0);	// HALT
      $display("%s: [ok] Pass (PFP card).", `TESTNAME);
      
      // FAIL will have terminated the simulation before we get to this point.
      #5000 ;
      $display("%s: [fail] FAIL instruction should have halted the system (and ended the simulation).", `TESTNAME);
      $display("%s: [fail] PFP card failure.", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   always begin
      #187 clk1 <= 0;
      #63 clk1 <= 1;
   end
   
   front_panel dut(
		   // DIN-41612
		   .ec_ab(ab),	// 16-bit address bus
		   .ec_db(db),	// 16-bit data bus
		   .ec_nio(nio),	// front-panel strobe, active low
		   .ec_nr(nr),	// read strobe, active low
		   .ec_nw(nw),	// write strobe, active low
		   .ec_nhalt(nhalt), // halt
		   .ec_nsysdev(nsysdev)
	      );

endmodule // processor_test

// End of file.
