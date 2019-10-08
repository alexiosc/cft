///////////////////////////////////////////////////////////////////////////////
//
// TEST THE SKIP/BRANCH UNIT
//
///////////////////////////////////////////////////////////////////////////////

// REDESIGNED IN 2019
// VERIFIED

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
   
   integer 	i, j, tst;
   
   // Initialize all variables
   initial begin
      $monitor ("t: %7d | %b %b %b %b %b %b %b %b %b %b %b %b > %b # [i=%0d]", $time,
      		nreset, clk4,
		nskipext, cond, ir, fv, fl, fz, fn,
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
      $display("OK (Idle mode)");

      ///////////////////////////////////////////////////////////////////////////////
      //
      // Test SKIPEXT on all COND modes.
      //
      ///////////////////////////////////////////////////////////////////////////////

      for (i = 0; i < 15; i = i + 1) begin
	 #500 cond = i;
	 #500 nskipext = 1'b0;
	 #500 nskipext = 1'bz;
	 $display("OK (nskipext %0d)", i);
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
	 $display("OK (cond %0d)", i);
      end // for (i = 1; i < 15; i = i + 1)
      $display("OK (flags and cext)");

      ///////////////////////////////////////////////////////////////////////////////
      //
      // Test the SKP instruction circuitry
      //
      ///////////////////////////////////////////////////////////////////////////////

      #1000 cond = 15;
      ir = 0;
      j = 0;
      for (i = 0; i < 512; i = i + 1) begin
	 #500 begin
	    j = ir;
	    ir[4:0] = i[8:4];
	    fv = i[0];
	    fl = i[1];
	    fz = i[2];
	    fn = i[3];

	    if (j != ir) begin
	       $display("OK (SKP &%03x)", ir[9:0]);
	       j = ir;
	    end
	    
	 end // for (i = 0; i < 512; i = i + 1)
      end // for (i = 0; i < 512; i = i + 1)
      $display("OK (SKP)");

      
      $display("OK");
      #2000 $finish;      // Terminate simulation
   end // initial begin

   // Realistic clock ticks
   always begin
      #187.5 clk4 = 0;
      #62.5 clk4 = 1;
   end

   ///////////////////////////////////////////////////////////////////////////////
   //
   // CHECK OUR RESULTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   always @(posedge clk4) begin
      #30 begin

	 // nskipext overrides all the logic here.
	 if (nskipext == 0) begin
	    if (nskip != 0) begin
	       $display("ASSERTION FAILED: at t=%0d, nskipext == 0 but nskip != 0", $time);
	       $finish;
	    end
	 end else begin
	    // Okay, nskipext is deasserted, so we can look at other things.
	    casex (cond)
	      // Idle
	      4'b0000 : if (nskip != 1) begin
		 $error("ASSERTION FAILED: at t=%0d, nskip asserted with cond == 0", $time);
		 #100 $finish;
	      end
	      // IR0 to IR6: when asserted and the equivalent bit is 1, nskip should be 0
	      4'b0??? : if (nskip != !ir[cond - 1]) begin
		 $error("ASSERTION FAILED: at t=%0d, cond=%b, ir%1d=%b but nskip == %b",
			  $time, cond, cond - 1, ir[cond - 1], nskip);
		 #100 $finish;
	      end
	      4'b1000 : if (nskip != !sbu.cext1) begin
		 $error("ASSERTION FAILED: at t=%0d, cond=%b, cext1=%b but nskip == %b",
			  $time, cond, sbu.cext1, nskip);
		 #100 $finish;
	      end
	      4'b1001 : if (nskip != !sbu.cext2) begin
		 $error("ASSERTION FAILED: at t=%0d, cond=%b, cext2=%b but nskip == %b",
			  $time, cond, sbu.cext2, nskip);
		 #100 $finish;
	      end
	      4'b1010 : if (nskip != !sbu.cext3) begin
		 $error("ASSERTION FAILED: at t=%0d, cond=%b, cext3=%b but nskip == %b",
			  $time, cond, sbu.cext2, nskip);
		 #100 $finish;
	      end
	      // FV
	      4'b1011 : if (nskip != !fv) begin
		 $error("ASSERTION FAILED: at t=%0d, cond=%b, fv=%b but nskip == %b",
			  $time, cond, fv, nskip);
		 #100 $finish;
	      end
	      // FL
	      4'b1100 : if (nskip != !fl) begin
		 $error("ASSERTION FAILED: at t=%0d, cond=%b, fl=%b but nskip == %b",
			  $time, cond, fl, nskip);
		 #100 $finish;
	      end
	      // FZ
	      4'b1101 : if (nskip != !fz) begin
		 $error("ASSERTION FAILED: at t=%0d, cond=%b, fz=%b but nskip == %b",
			  $time, cond, fz, nskip);
		 #100 $finish;
	      end
	      // FN
	      4'b1110 : if (nskip != !fn) begin
		 $error("ASSERTION FAILED: at t=%0d, cond=%b, fn=%b but nskip == %b",
			  $time, cond, fn, nskip);
		 #100 $finish;
	      end
	      4'b1111 : begin
		 tst = 0;
		 tst = tst | ir[0] & fv;
		 tst = tst | ir[1] & fl;
		 tst = tst | ir[2] & fz;
		 tst = tst | ir[3] & fn;
		 tst = tst ^ ir[4];
		 if (nskip != !tst) begin
		    $error("ASSERTION FAILED: at t=%0d, cond=%b, ir[4:0]=%b, flags=%b but nskip == %b",
			     $time, cond, ir[4:0], {fn, fz, fl, fv}, nskip);
		    #100 $finish;
		 end
	      end
	    endcase
	 end
      end
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
