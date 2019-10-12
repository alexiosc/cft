///////////////////////////////////////////////////////////////////////////////
//
// TEST THE SKIP/BRANCH UNIT
//
///////////////////////////////////////////////////////////////////////////////

// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT

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

      #2000 $display("OK");
      $finish;      // Terminate simulation
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

   ///////////////////////////////////////////////////////////////////////////////
   //
   // CHECK OUR RESULTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // This is horribly ugly because iverilog lacks full support for
   // assertions.
   reg [1023:0] msg;
   always @(posedge clk4) begin
      // Allow for propagation delay
      #30 begin
	 msg[0] = "";		// Clear the msg and use it as a flag.

	 // nskipext overrides all the logic here.
	 if (nskipext === 0) begin
	    if (nskip !== 0) $sformat(msg, "nskipext=%b but nskip=%b", nskipext, nskip);

	 end else begin
	    // Okay, nskipext is deasserted, so we can look at other things.
	    casex (cond)
	      // Idle
	      4'b0000 : if (nskip !== 1) begin
		 $sformat(msg,
			  "nskipext=%b but nskip=%b with cond=%b (shoule be idle)",
			  nskipext, nskip, cond);
	      end

	      // IR0 to IR6: when asserted and the equivalent bit is 1, nskip should be 0
	      4'b0??? : if (nskip !== !ir[cond - 1])
		$sformat(msg, "cond=%b, ir%1d=%b but nskip=%b", cond, cond - 1, ir[cond - 1], nskip);

	      // CEXT1 to CEXT3
	      4'b1000 : if (nskip !== !sbu.cext1)
		 $sformat(msg, "cond=%b, cext1=%b but nskip=%b", cond, sbu.cext1, nskip);

	      4'b1001 : if (nskip !== !sbu.cext2)
		 $sformat(msg, "cond=%b, cext2=%b but nskip=%b", cond, sbu.cext2, nskip);

	      4'b1010 : if (nskip !== !sbu.cext3)
		 $sformat(msg, "cond=%b, cext3=%b but nskip=%b", cond, sbu.cext3, nskip);
	      
	      // FV
	      4'b1011 : if (nskip !== !fv)
		 $sformat(msg, "cond=%b, fv=%b but nskip=%b", cond, fv, nskip);

	      // FL
	      4'b1100 : if (nskip !== !fl)
		 $sformat(msg, "cond=%b, fl=%b but nskip=%b", cond, fl, nskip);

	      // FZ
	      4'b1101 : if (nskip !== !fz)
		 $sformat(msg, "cond=%b, fz=%b but nskip=%b", cond, fz, nskip);

	      // FN
	      4'b1110 : if (nskip !== !fn)
		 $sformat(msg, "cond=%b, fn=%b but nskip=%b", cond, fn, nskip);

	      4'b1111 : begin
		 tst = 0;
		 tst = tst | ir[0] & fv;
		 tst = tst | ir[1] & fl;
		 tst = tst | ir[2] & fz;
		 tst = tst | ir[3] & fn;
		 tst = tst ^ ir[4];
		 if (nskip !== !tst)
		    $sformat(msg, "cond=%b, ir[4:0]=%b, flags=%b but nskip=%b", cond, ir[4:0], {fn, fz, fl, fv}, nskip);
	      end
	    endcase // casex (cond)
	 end // else: !if(nskipext == 0)

	 // Fail if we've logged an issue.
	 if (msg[0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
      end // always @ (posedge clk4)
   end // always @ (posedge clk4)

endmodule // reg_ar_tb

// End of file.
