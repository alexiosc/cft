//
// REDESIGNED IN 2019
//

`include "reg_l.v"

`timescale 1ns/10ps


module reg_l_tb();
   reg nreset;
   reg clk;
   reg naction_cpl;
   reg naction_cll;
   reg ibus12;
   reg flout_add;
   reg flout_sru;
   reg nread_alu_add;
   reg nwrite_flags;
   reg bcp;
   reg clken;

   wire fl;
   wire flfast;
   wire clk4;
   reg _clk4;

   integer     i, j, k;

   initial begin        
      $dumpfile ("vcd/reg_l_tb.vcd");
      $dumpvars (0, reg_l_tb);

      //$monitor ("%g\t %b %b %b %b %b", $time, waddr, raddr, ir[11:0] , ibus[7:0], reg_l.sel);

      nreset = 0;
      clk = 1;
      naction_cpl = 1;
      naction_cll = 1;
      ibus12 = 0;
      nwrite_flags = 1;
      flout_add = 0;
      flout_sru = 0;
      nread_alu_add = 1;
      bcp = 1;
      clken = 0;
      #1000 nreset = 1;

      // Try out the asynchronous signals

      #187.5 naction_cll = 0;
      clk = 0;
      #62.5 naction_cll = 1;
      clk = 1;

      #187.5 naction_cpl = 0;
      clk = 0;
      #62.5 naction_cpl = 1;
      clk = 1;
      
      #500 for (i = 0; i < 4; i++) begin
	 #187.6 naction_cpl = 0;
	 clk = 0;
	 #62.5 naction_cpl = 1;
	 clk = 1;
      end

      // Test the synchronous features
      #1000 clken = 1;

      // Test write_flags from the bus.
      #400 for (i = 0; i < 4; i++) begin
	 #400 ibus12 = 0;
	 #50 nwrite_flags = 0;
	 #50 nwrite_flags = 1;
	 
	 #400 ibus12 = 1;
	 #50 nwrite_flags = 0;
	 #50 nwrite_flags = 1;
      end

      // Test L loading from the ALU's adder
      #1000 for (i = 0; i < 4; i++) begin
	 #400 flout_add = 0;
	 #50 nread_alu_add = 0;
	 #50 nread_alu_add = 1;
	 
	 #400 flout_add = 1;
	 #50 nread_alu_add = 0;
	 #50 nread_alu_add = 1;
      end

      // And also test fast toggling from the serial shifter.
      #1000 for (i = 0; i < 32; i++) begin
	 #30 flout_sru = 0;
	 bcp = 0;
	 #30 bcp = 1;
	 
	 #30 flout_sru = 1;
	 bcp = 0;
	 #30 bcp = 1;
      end

      #10000 $finish;

   end // initial begin

   always begin
      #62.5 _clk4 = 1;
      #187.5 _clk4 = 0;
   end
   assign clk4 = clken == 1 ? _clk4 : clk;

  // Instantiate all sub-modules.
   reg_l reg_l (.nreset(nreset),
		.clk4(clk4),
		.naction_cpl(naction_cpl), .ibus12(ibus12),
		.flout_add(flout_add), .flout_sru(flout_sru),
		.nread_alu_add(nread_alu_add), .nwrite_flags(nwrite_flags),
		.bcp(bcp), .naction_cll(naction_cll), 
		.fl(fl), .flfast(flfast));

endmodule // reg_l_tb


// End of file.
