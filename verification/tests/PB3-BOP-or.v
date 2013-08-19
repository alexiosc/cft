///////////////////////////////////////////////////////////////////////////////
//
// PB3-BOP-or.v -- Processor Board C, Binary op OR test
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

`include "../PB3-binary.v"

`timescale 1ns/10ps

`ifndef REPS
 `define REPS 1024
`endif
`define REPS2 (`REPS * `REPS)
`ifndef DELTA
 `define DELTA 21553
`endif

module PB3_BOP_or();

   reg 	       nreset;
   reg 	       clk3;
   reg 	       nboe;
   reg 	       fl;
   reg [15:0]  ac;
   reg [15:0]  b;
   reg [3:0]   runit;

   wire [15:0] y;
   wire        fv;
   wire        nfltadd;

   integer     val, log2, c, i, j, a_val, b_val, t, v_correct;

   // Use an event to fill in the coverage array
   event tested;
   always @(tested) begin
      c = ((ac >> 12) & 15) + ((b >> 8) & 16'h00f0);
      //$display("%h (%h) %h (%h) -> %h", ac, ac >> 12, b, b >>12, c);
      coverage[c] = coverage[c] + 1;
   end

   // Encoded 16*16 array
   integer     coverage[0:255];

   always begin
      #187 clk3 <= 0;
      #63 clk3 <= 1;
   end

   always @(ac, b) begin
      // Check the ALU result. Allow enough time for carry to propagate through
      // all three ROMs.
      #170 if (((ac | b) & 16'hffff) != y) begin
   	 $display("%s: [fail] ALU OR result incorrect (%4h & %4h = %4h, got %4h)",
   		  `TESTNAME, ac, b, (ac | b) & 16'hffff, y);
   	 $display ("%s: [fail] ALU result error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   always @(negedge nfltadd) begin
      // Check the L output.
      if (nreset == 1) begin
      	 $display("%s: [fail] FLTAND# asserted for OR operation",
      		  `TESTNAME);
      	 $display ("%s: [fail] ALU FLTAND# output incorrect.", `TESTNAME);
      	 #100 $finish;
      end
   end // always @ (posedge nboe)

   always @(fv) begin
      // Check the V output. Definition: if AC15 == B15 (sign of numbers is the
      // same) and the result is of a different sign (Y15 != AC15, Y15 != B15),
      // then we have overflow. This is only used for signed arithmetic.
      if (nreset == 1 && nboe == 0 && fv == 1) begin
      	 $display("%s: [fail] FV set for OR operation!",
      		  `TESTNAME);
	 $display ("%s: [fail] ALU FV output incorrect.", `TESTNAME);
      	 #100 $finish;
      end
   end // always @ (posedge nboe)

   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB3-BOP-or.vcd");
      $dumpvars (0, PB3_BOP_or);
`endif

      for (i = 0; i < 256; i = i + 1) coverage[i] = 0;

      nreset <= 0;
      clk3 <= 1;
      nboe <= 1;
      fl <= 0;
      ac <= 0;
      b <= 0;
      runit <= 10; 		// ALU_OR
      t <= 0;

      #125 nreset <= 1;
      nboe <= 0;
      #125 nboe <= 1;

      a_val <= 0;
      b_val <= 0;
      for (j = 0 ; j < `REPS; j = j + 1) begin
	 #10000 ac <= a_val;
	 a_val = a_val + `DELTA;
	 b_val = 0;
	 for (i = 0 ; i < `REPS; i = i + 1) begin
	    #250 b <= b_val;
	    #125 nboe <= 0;
	    #125 nboe <= 1;
	    ->tested;

	    // Flip half of B's bits to test more of the B domain.
	    #250 b <= b_val ^ 16'h5555;
	    #125 nboe <= 0;
	    #125 nboe <= 1;
	    ->tested;

	    #250 b <= b_val ^ 16'haaaa;
	    #125 nboe <= 0;
	    #125 nboe <= 1;
	    ->tested;

	    // Test with -b_val, to check L and V flags.
	    #250 b <= -b_val;
	    #125 nboe <= 0;
	    #125 nboe <= 1;
	    ->tested;

	    b_val = b_val + `DELTA;
	    	    
	    t = t + 4;
	    if ((t % 100000) == 0) begin
	       $display("%s: [ok] Tests up to %1d (of %1d) successful (%1d%% done).",
			 `TESTNAME, t, `REPS2 * 2, 25 * t / `REPS2);
	    end
	 end
      end

      #5000 ;
      $display("%s: [ok] Pass (ALU binary ROM, OR: %1d tests, %1.3f%% of 2³² AC/B permutations).", 
	       `TESTNAME, t, 100.0 * t / 4294967297.0);

      // for (j = 0; j < 256; j = j + 1) begin
      // 	 $display("%d -> %d", j, coverage[j]);
      // end
      // █▓▒░
      // Colours: 30 31 33 32
      for (j = 0; j < 256; j = j + 16) begin
	 $write("%s: [report] Coverage: <", `TESTNAME);
	 for (i = 0; i < 16; i = i + 1) begin
	    val = coverage[i + j];
	    // for (log2 = 23; log2 >= 0; log2 = log2 - 1) begin
	    //    if (val > (1 << log2)) begin
	    // 	  $write("\033[0;1;32m");
	    // 	  $exit;
	    //    end
	    // end
	    
	    if (val > 1048576) $write("##");
	    else if (val > 65536) $write("OO");
	    else if (val > 4096) $write("oo");
	    else if (val > 256) $write("..");
	    else $write("  ");
	 end
	 $write(">\n");
      end
	 
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB3_binary PBC_BOP (nreset, clk3, nboe, fl, ac, b, runit, y,
				     fv, nfltadd);
   

endmodule // PB3_BOP_or

// End of file.
