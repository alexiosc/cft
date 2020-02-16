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
   reg 		nskipext_drv;
   reg [15:0] 	ir;
   reg [4:0] 	cond;
   reg 		fv, fl, fz, fn;
   reg 		cext8_drv, cext9_drv, cext10_drv;

   wire 	ncond;
   
   integer 	i, j, tst;
   reg [800:0] 	status;

   // Hack to allow bidirectional tri-state driving/reading.
   wire 	cext8, cext9, cext10, nskipext;
   assign cext8 = cext8_drv;
   assign cext9 = cext9_drv;
   assign cext10 = cext10_drv;
   assign nskipext = nskipext_drv;

   // Initialize all variables
   initial begin
      $monitor ("t: %7d | %b %b %b %b %b %b %b %b %b %b %b %b > %b # [i=%0d]", $time,
      		nreset, clk4,
		nskipext, cond, ir, fv, fl, fz, fn,
		cext8, cext9, cext10, ncond, i);
      $dumpfile ("vcd/sbu_tb.vcd");
      $dumpvars (0, sbu_tb);

      status = "reset";
      clk4 = 1;
      nskipext_drv = 1'bz;
      cext8_drv = 1'bz;
      cext9_drv = 1'bz;
      cext10_drv = 1'bz;
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

      status = "idle";
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

      status = "skipext";
      for (i = 0; i < 32; i = i + 1) begin
	 #500 cond = i;
	 #500 nskipext_drv = 1'b0;
	 #500 nskipext_drv = 1'bz;
	 $display("OK (nskipext %0d)", i);
      end;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // Test IR bits, CEXT8..10 and flags: cond 1..31.
      //
      ///////////////////////////////////////////////////////////////////////////////

      // Strategy: for each cond 1..7 (IR0--IR6) we'll assert the condition,
      // then set and then clear all the IR bits, flags and #SKIPEXT one by
      // one. #SKIP should be asserted only for #SKIPEXT and the correct bit of
      // IR.

      status = "bit check conditionals";
      for (i = 1; i < 32; i = i + 1) begin
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
	 #500 cext8_drv = 1;
	 #500 cext8_drv = 1'bz;
	 #500 cext9_drv = 1;
	 #500 cext9_drv = 1'bz;
	 #500 cext10_drv = 1;
	 #500 cext10_drv = 1'bz;
	 $display("OK (cond %0d)", i);
      end // for (i = 1; i < 15; i = i + 1)
      $display("OK (flags and cext)");

      ///////////////////////////////////////////////////////////////////////////////
      //
      // Test the SKP instruction circuitry
      //
      ///////////////////////////////////////////////////////////////////////////////

      status = "SKP instruction";
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
	   .cext8(cext8), .cext9(cext9), .cext10(cext10),
	   .ncond(ncond));

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
	 msg[7:0] = "";		// Clear the msg and use it as a flag.

	 // nskipext overrides all the logic here.
	 if (nskipext === 0) begin
	    if (ncond !== 0) $sformat(msg, "nskipext=%b but ncond=%b", nskipext, ncond);

	 end else begin
	    // Okay, nskipext is deasserted, so we can look at other things.
	    casex (cond)
	      // Idle
	      5'b00000 : if (ncond !== 1) begin
		 $sformat(msg,
			  "nskipext=%b but ncond=%b with cond=%b (should be idle)",
			  nskipext, ncond, cond);
	      end

	      // Unused COND addresses
	      5'b1???? : if (ncond !== 1) begin
		 $sformat(msg,
			  "nskipext=%b but ncond=%b with cond=%b (unused address, should be 1)",
			  nskipext, ncond, cond);
	      end

	      // IR0 to IR6: when asserted and the equivalent bit is 1, ncond should be 0
	      5'b00??? : if (ncond !== !ir[cond - 1])
		$sformat(msg, "cond=%b, ir%1d=%b but ncond=%b", cond, cond - 1, ir[cond - 1], ncond);

	      // CEXT8 to CEXT10
	      5'b01000 : if (ncond !== !sbu.cext8)
		 $sformat(msg, "cond=%b, cext8=%b but ncond=%b", cond, sbu.cext8, ncond);

	      5'b01001 : if (ncond !== !sbu.cext9)
		 $sformat(msg, "cond=%b, cext9=%b but ncond=%b", cond, sbu.cext9, ncond);

	      5'b01010 : if (ncond !== !sbu.cext10)
		 $sformat(msg, "cond=%b, cext10=%b but ncond=%b", cond, sbu.cext10, ncond);
	      
	      // FV
	      5'b01011 : if (ncond !== !fv)
		 $sformat(msg, "cond=%b, fv=%b but ncond=%b", cond, fv, ncond);

	      // FL
	      5'b01100 : if (ncond !== !fl)
		 $sformat(msg, "cond=%b, fl=%b but ncond=%b", cond, fl, ncond);

	      // FZ
	      5'b01101 : if (ncond !== !fz)
		 $sformat(msg, "cond=%b, fz=%b but ncond=%b", cond, fz, ncond);

	      // FN
	      5'b01110 : if (ncond !== !fn)
		 $sformat(msg, "cond=%b, fn=%b but ncond=%b", cond, fn, ncond);

	      5'b01111 : begin
		 tst = 0;
		 tst = tst | ir[0] & fv;
		 tst = tst | ir[1] & fl;
		 tst = tst | ir[2] & fz;
		 tst = tst | ir[3] & fn;
		 tst = tst ^ ir[4];
		 if (ncond !== !tst)
		   $sformat(msg, "cond=%b, ir[4:0]=%b, flags=%b but ncond=%b", cond, ir[4:0], {fn, fz, fl, fv}, ncond);
	      end
	    endcase // casex (cond)
	 end // else: !if(nskipext == 0)

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK SBU");
      end // always @ (posedge clk4)
   end // always @ (posedge clk4)

endmodule // reg_ar_tb

// End of file.
