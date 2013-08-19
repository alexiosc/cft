///////////////////////////////////////////////////////////////////////////////
//
// PB1-wunit.v -- Processor Board A, read unit decoder test
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

`include "../PB0-decoders.v"

`timescale 1ns/10ps

module PB1_wunit();

   reg 	     nreset;
   reg 	     clk3;
   reg 	     nuce;
   reg [2:0] wunit;

   wire      nwar, nwpc, nwir, nwdr, nwac, nwalu;

   integer   i, j, ph;

   wire [5:0] nrvec;
   assign nrvec = { nwar, nwpc, nwir, nwdr, nwac, nwalu };
   reg [5:0]  vectors[7:0];

   // Ensure patterns are correct
   always @(clk3, nuce, nreset) begin
      if (clk3 == 0 && nuce == 0 && nreset == 1) begin
	 #60 if (nrvec !== vectors[wunit]) begin
   	    $display("%s: [fail] wunit=%b, decoded enable vector should be %b, saw %b instead.",
   	 	     `TESTNAME, wunit, vectors[wunit], nrvec);
   	    $display ("%s: [fail] decoding error.", `TESTNAME);
   	    #100 $finish;
	 end
      end else begin
	 #60 if (nrvec !== 6'b111111) begin
   	    $display("%s: [fail] wunit=%b, clk3=%b, nuce=%b, nreset=%b: enable vector should be idle, saw %b instead.",
   	 	     `TESTNAME, wunit, clk3, nuce, nreset, vectors[wunit], nrvec);
   	    $display ("%s: [fail] write unit not idling.", `TESTNAME);
   	    #100 $finish;
	 end
      end // else: !if(clk3 == 0 && nuce == 0 && nreset == 1)
   end // always @ (clk3, nuce, nreset)

   // Initialize all variables
   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB1-wunit.vcd");
      $dumpvars (0, PB1_wunit);
`endif
      
      // Initialise vectors
      vectors[0] <= 6'b111111;
      vectors[1] <= 6'b111111;
      vectors[2] <= 6'b011111;	// WAR#
      vectors[3] <= 6'b101111;	// WPC#
      vectors[4] <= 6'b110111;	// WIR#
      vectors[5] <= 6'b111011;	// WDR#
      vectors[6] <= 6'b111101;	// WAC#
      vectors[7] <= 6'b111110;	// WALU#

      // Reset
      nreset <= 0;
      clk3 <= 1;
      nuce <= 1;
      wunit <= 0;
      #100 nreset <= 1;

      // Loop through WUNIT
      for (i = 0; i < 8; i = i + 1) begin
	 wunit <= i;

	 #250 clk3 <= 1;
	 #125 clk3 <= 0;

	 #375 nuce <= 1;
	 #125 nuce <= 0;
	 
	 #375 nreset <= 0;
	 #125 nreset <= 1;
      end

      #5000 ;
      $display("%s: [ok] Pass (IR).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   write_unit_decoder dut (nreset, clk3, nuce, wunit,
			   nwar, nwpc, nwir, nwdr, nwac, nwalu);
			  
endmodule // PB1_IR_test

// End of file.
