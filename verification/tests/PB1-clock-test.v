///////////////////////////////////////////////////////////////////////////////
//
// PB1-clock-test.v -- Processor Board, clock test
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

`include "../PB1-clock.v"

`timescale 1ns/10ps

module PB1_clock_test();
   
   reg nreset;
   //reg fpslow;
   //reg fpfast;
   reg fpclken;
   reg fpustep;

   wire clk1;
   wire clk2;
   wire clk3;
   wire clk4;
   wire nt12;
   wire nt34;

   wire [5:0] phase, correct_phase;

   assign phase = {nt34, nt12, clk4, clk3, clk2, clk1};

   // Phase sequence (from reset): 2e 2d 1b 17 2e 2d ...

   integer    i, j, ph;
   
   reg [5:0]  phases[3:0];

   always @(phase) begin
      if (nreset == 1'b1) begin
	 ph = (ph + 1) % 4;
	 if (correct_phase != phase) begin
	    $display("%s: [fail] aggregate clock phase %b, should be %b",
		     `TESTNAME, phase, correct_phase);
	    $display ("%s: [fail] Clock out of phase.", `TESTNAME);
	    #100 $finish;
	 end
      end
   end

   assign correct_phase = phases[ph];
      
   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB1-clock-test.vcd");
      $dumpvars (0, PB1_clock_test);
`endif
      
      // Initialise phases
      ph = 0;
      phases[0] = 6'b101110;
      phases[1] = 6'b101101;
      phases[2] = 6'b011011;
      phases[3] = 6'b010111;

      // Reset
      nreset = 0;
      //fpslow = 0;
      //fpfast = 1;
      fpclken = 1;
      fpustep = 0;
      #1000 nreset = 1;

      for (j = 0; j < 25; j = j + 1) begin
	 #2000 fpclken = 0;
	 for (i = 0; i < 10; i = i + 1) begin
	    #500 fpustep = 1;
	    #500 fpustep = 0;
	 end
	 #2000 fpclken = 1;

	 //#2000 fpfast = 0;
	 //#2000 fpslow = 1;
	 //#2000 fpslow = 0;
	 //#2000 fpfast = 1;

	 #50000 ;
      end

      $display("%s: [ok] Pass (clock phase).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   PB1_clock dut(.nreset(nreset),
		 .fpclken(fpclken), .fpustep(fpustep),
		 .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .nt12(nt12), .nt34(nt34));
			  
endmodule

// End of file.
