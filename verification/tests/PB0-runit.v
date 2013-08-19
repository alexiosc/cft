///////////////////////////////////////////////////////////////////////////////
//
// PB1-runit.v -- Processor Board A, read unit decoder test
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

module PB1_runit();

   reg 	     nreset;
   reg 	     clk1;
   reg 	     nuce;
   reg [3:0] runit;

   wire      nragl, nrpc, nrdr, nrac;

   integer   i, j, ph;

   wire [3:0] nrvec;
   assign nrvec = { nragl, nrpc, nrdr, nrac };
   reg [3:0]  vectors[15:0];

   // Ensure patterns are correct
   always @(clk1, nuce, nreset) begin
      if (clk1 == 1 && nuce == 0 && nreset == 1) begin
	 #60 if (nrvec !== vectors[runit]) begin
   	    $display("%s: [fail] runit=%b, decoded enable vector should be %b, saw %b instead.",
   	 	     `TESTNAME, runit, vectors[runit], nrvec);
   	    $display ("%s: [fail] decoding error.", `TESTNAME);
   	    #100 $finish;
	 end
      end else begin
	 #60 if (nrvec !== 4'b1111) begin
   	    $display("%s: [fail] runit=%b, clk1=%b, nuce=%b, nreset=%b: enable vector should be idle, saw %b instead.",
   	 	     `TESTNAME, runit, clk1, nuce, nreset, vectors[runit], nrvec);
   	    $display ("%s: [fail] read unit not idling.", `TESTNAME);
   	    #100 $finish;
	 end
      end // else: !if(clk1 == 1 && nuce == 0 && nreset == 1)
   end // always @ (clk1, nuce, nreset)

   // Initialize all variables
   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB1-runit.vcd");
      $dumpvars (0, PB1_runit);
`endif
      
      // Initialise vectors
      vectors[0] <= 4'b1111;
      vectors[1] <= 4'b1111;
      vectors[2] <= 4'b0111;	// RAGL#
      vectors[3] <= 4'b1011;	// RPC#
      vectors[4] <= 4'b1101;	// RDR#
      vectors[5] <= 4'b1110;	// RAC#
      vectors[6] <= 4'b1111;
      vectors[7] <= 4'b1111;
      vectors[8] <= 4'b1111;
      vectors[9] <= 4'b1111;
      vectors[10] <= 4'b1111;
      vectors[11] <= 4'b1111;
      vectors[12] <= 4'b1111;
      vectors[13] <= 4'b1111;
      vectors[14] <= 4'b1111;
      vectors[15] <= 4'b1111;

      // Reset
      nreset <= 0;
      clk1 <= 0;
      nuce <= 1;
      runit <= 0;
      #100 nreset <= 1;

      // Loop through RUNIT
      for (i = 0; i < 16; i = i + 1) begin
	 runit <= i;

	 #250 clk1 <= 0;
	 #125 clk1 <= 1;

	 #375 nuce <= 1;
	 #125 nuce <= 0;
	 
	 #375 nreset <= 0;
	 #125 nreset <= 1;
      end

      #5000 ;
      $display("%s: [ok] Pass (IR).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   read_unit_decoder dut (nreset, clk1, nuce, runit, nragl, nrpc, nrdr, nrac);
			  
endmodule // PB1_IR_test

// End of file.
