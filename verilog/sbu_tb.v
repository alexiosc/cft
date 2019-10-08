///////////////////////////////////////////////////////////////////////////////
//
// TEST THE SKIP/BRANCH UNIT
//
///////////////////////////////////////////////////////////////////////////////

// REDESIGNED IN 2019

`include "sbu.v"
`timescale 1ns/10ps

module sbu_tb();
   reg          nreset;
   reg 		clk4;
   reg 		nskipext;
   reg [15:0] 	ir;
   reg [3:0] 	cond;
   reg 		fv, fl, fz, fn;
   reg 		cext1, cext2, cext3;

   wire 	nskip;
   
   integer 	i, j;
   
   // Initialize all variables
   initial begin
      $monitor ("%d | %b %b %b %b %b %b %b %b %b %b %b > %b | %d", $time,
      		nreset, nskipext, cond, ir, fv, fl, fz, fn,
		cext1, cext2, cext3, nskip, i);
      $dumpfile ("vcd/sbu_tb.vcd");
      $dumpvars (0, sbu_tb);

      clk4 = 1;
      nskipext = 1'bz;
      cext1 = 1'bz;
      cext2 = 1'bz;
      cext3 = 1'bz;
      fv = 0;
      fl = 0;
      fz = 0;
      fn = 0;
      cond = 0;
      ir = 0;

      // Right now all our timings will be in sync with the clock. Get some
      // phase difference by waiting something that's not a multiple of 250ns.

      nreset = 1'b0;
      #282 nreset = 1'b1;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // Test idle mode.
      //
      ///////////////////////////////////////////////////////////////////////////////

      #2000 cond = 0;
      #500 fv = 1;
      fl = 1;
      fz = 1;
      fn = 1;
      ir = 16'hffff;
      #500 fv = 0;
      fl = 0;
      fz = 0;
      fn = 0;
      ir = 16'h0000;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // Test SKIPEXT on all COND modes.
      //
      ///////////////////////////////////////////////////////////////////////////////

      for (i = 0; i < 15; i = i + 1) begin
	 #500 cond = i;
	 #500 nskipext = 1'b0;
	 #500 nskipext = 1'bz;
      end;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // Test IR bits, CEXT1..3 and flags: cond 1..14.
      //
      ///////////////////////////////////////////////////////////////////////////////

      // Strategy: for each cond 1..7 (IR0--IR6) we'll assert the condition,
      // then set and then clear all the IR bits, flags and #SKIPEXT one by
      // one. #SKIP should be asserted only for #SKIPEXT and the correct bit of
      // IR.

      for (i = 1; i < 15; i = i + 1) begin
	 #1000 cond = i;
	 for (j = 0; j < 16; j = j + 1) begin
	    #500 ir[j] = 1;
	    #500 ir[j] = 0;
	 end;
	 #500 fv = 1;
	 #500 fv = 0;
	 #500 fl = 1;
	 #500 fl = 0;
	 #500 fz = 1;
	 #500 fz = 0;
	 #500 fn = 1;
	 #500 fn = 0;
	 #500 cext1 = 1;
	 #500 cext1 = 1'bz;
	 #500 cext2 = 1;
	 #500 cext2 = 1'bz;
	 #500 cext3 = 1;
	 #500 cext3 = 1'bz;
      end // for (i = 1; i < 15; i = i + 1)

      ///////////////////////////////////////////////////////////////////////////////
      //
      // Test the SKP instruction circuitry
      //
      ///////////////////////////////////////////////////////////////////////////////

      #1000 cond = 15;
      ir = 0;
      for (i = 0; i < 512; i = i + 1) begin
	 #500 begin
	    ir[4:0] = i[8:4];
	    fv = i[0];
	    fl = i[1];
	    fz = i[2];
	    fn = i[3];
	 end // for (i = 0; i < 512; i = i + 1)
      end // for (i = 0; i < 512; i = i + 1)
      
      #2000 $finish;      // Terminate simulation
   end // initial begin

   // Realistic clock ticks
   always begin
      #187.5 clk4 = 0;
      #62.5 clk4 = 1;
   end

   // Connect DUT to test bench
   sbu sbu(
	   .nreset(nreset),
	   .clk4(clk4),
	   .nskipext(nskipext),
	   .ir(ir),
	   .cond(cond), .fv(fv), .fl(fl), .fz(fz), .fn(fn),
	   .cext1(cext1), .cext2(cext2), .cext3(cext3),
	   .nskip(nskip));

endmodule // reg_ar_tb

// End of file.
