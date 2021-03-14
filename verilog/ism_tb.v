///////////////////////////////////////////////////////////////////////////////
//
// TEST THE INTERRUPT LOGIC UNIT
//
///////////////////////////////////////////////////////////////////////////////

// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT

`include "ism.v"
`timescale 1ns/10ps

module int_tb();
   reg          nreset;
   reg 		clk3, clk4;
   reg 		nend;
   reg 		ibus15;
   reg 		nwrite_fl;
   reg [3:0] 	action;
   reg 		nirq_drv;

   wire 	fi;
   wire 	nirqs;
   wire 	nirqsuc;
   
   integer 	i;
   integer 	enable_nend;
   reg [800:0] 	status;

   // Hack to allow bidirectional tri-state driving/reading.
   wire 	nirq;
   assign nirq = nirq_drv;

   

   // Initialize all variables
   initial begin
      $monitor ("t: %7d | %b %b %b %b %b | %b %b > fi:%b nirqsuc:%b nirqs:%b",
		$time,
      		nreset, clk4, nend, nirq, action,
		ibus15, nwrite_fl,
		fi, nirqsuc, nirqs);
      $dumpfile ("vcd/ism_tb.vcd");
      $dumpvars (0, int_tb);

      status = "reset";
      clk3 = 1;
      clk4 = 1;
      nend = 1;
      action = 0;
      ibus15 = 0;
      nwrite_fl = 1;
      nirq_drv = 1;
      enable_nend = 1;
     
      status = "reset";
      nreset = 0;
      #1000 nreset = 1;

      #1000 status = "action decoding";
      for (i = 0; i < 64; i = i + 1) begin
	 #500 action = i[3:0];
      end
      #1000 action = 0;


      #1000 status = "flag unit loading";
      for (i = 0; i < 16; i = i + 1) begin
	 #990 ibus15 = i[2];
	 #10 nwrite_fl = i[0];
      end


      #1000 status = "interrupts";
      for (i = 0; i < 16; i = i + 1) begin
	 #1000 action = 4'b0100;
	 #250 action = 0;
	 #1000 nirq_drv = 0;
	 #1000 nirq_drv = 1;

	 #1000 action = 4'b0011;
	 #250 action = 0;
	 #1000 nirq_drv = 0;
	 #1000nirq_drv = 1;
      end
      #1000 action = 0;

      enable_nend = 0;
      #1125 status = "aborted interrupts";
      for (i = 0; i < 16; i = i + 1) begin
	 #1000 action = 4'b0011;
	 #250 action = 0;
	 #500 nirq_drv = 0;
	 #500 nirq_drv = 1;
	 #250 action = 4'b0100;
	 #250 action = 0;
      end
      #1000 action = 0;


      #1000 $finish;
   end // initial begin

   // Realistic clock ticks and somewhat realistic END assertions.
   always begin
      #125 clk3 = 0;
      #62.5 clk3 = 1; clk4 = 0;
      #62.5 clk4 = 1;

      #125 clk3 = 0;
      #62.5 clk3 = 1; clk4 = 0;
      #62.5 clk4 = 1;

      #125 clk3 = 0;
      #62.5 clk3 = 1; clk4 = 0;
      #62.5 clk4 = 1;

      #125  clk3 = 0; nend = enable_nend? 0: 1;
      #62.5 clk3 = 1; clk4 = 0;
      #62.5 clk4 = 1;
      #62.5 nend = 1;
   end

   // Connect DUT to test bench
   int_fsm int_fsm (.nreset(nreset), .clk3(clk3), .clk4(clk4), .nend(nend),
		    .ibus15(ibus15), .nwrite_fl(nwrite_fl),
		    .action(action), 
		    .nirq(nirq), .fi(fi),
		    .nirqs(nirqs), .nirqsuc(nirqsuc),
		    .nidxen(1'b1));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // CHECK OUR RESULTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // This is horribly ugly because iverilog lacks full support for
   // assertions.
   reg [1023:0] msg;

   always @(action, nreset, clk3, clk4) begin
      #30 begin
   	 if (clk3 !== 1'b0 && clk3 !== 1'b1) begin
   	    $sformat(msg, "testbench bug, clk3=%b", clk4);
   	 end

   	 else if (clk4 !== 1'b0 && clk4 !== 1'b1) begin
   	    $sformat(msg, "testbench bug, clk4=%b", clk4);
   	 end

	 // Check asynchronous stuff first
	 else if (nreset == 1'b0) begin
	    if (int_fsm.ncli !== 1'b0) begin
   	       $sformat(msg, "reset failure: nreset=%b, ncli=%b (should be 0)", nreset, int_fsm.ncli);
	    end

	    else if (int_fsm.nsti !== 1'b1) begin
   	       $sformat(msg, "reset failure: nreset=%b, nsti=%b (should be 1)", nreset, int_fsm.nsti);
	    end

	    else if (int_fsm.ninh !== 1'b0) begin
   	       $sformat(msg, "reset failure: nreset=%b, ninh=%b (should be 0)", nreset, int_fsm.ninh);
	    end
	 end

   	 else if (nreset !== 1'b1) begin
   	    $sformat(msg, "testbench bug, nreset=%b", nreset);
   	 end

      	 else if (action === 4'b0011 && clk4 === 1'b0 && int_fsm.nsti !== 1'b0) begin
      	    $sformat(msg, "nsti decoding failure: action=%b, clk4=%b, but nsti=%b (should be 0)",
      		     action, clk4, int_fsm.nsti);
      	 end

      	 else if ((action !== 4'b0011 || clk4 !== 1'b0) && int_fsm.nsti !== 1'b1) begin
      	    $sformat(msg, "nsti decoding failure: action=%b, clk4=%b, but nsti=%b (should be 1)",
      		     action, clk4, int_fsm.nsti);
      	 end

      	 else if (action === 4'b0100 && clk4 === 1'b0 && int_fsm.ncli !== 1'b0) begin
      	    $sformat(msg, "ncli decoding failure: action=%b, clk4=%b, but ncli=%b (should be 0)",
      		     action, clk4, int_fsm.nsti);
      	 end

      	 else if ((action !== 4'b0100 || clk4 !== 1'b0) && int_fsm.ncli !== 1'b1) begin
      	    $sformat(msg, "ncli decoding failure: action=%b, clk4=%b, but ncli=%b (should be 1)",
      		     action, clk4, int_fsm.nsti);
      	 end

      	 else if (int_fsm.ncli === 1'b0 && int_fsm.nsti == 1'b0) begin
      	    $sformat(msg, "nsti and ncli asserted simultaneously");
      	 end

      	 else if (int_fsm.ncli === 1'b0 && fi !== 1'b0) begin
      	    $sformat(msg, "FI failure: ncli=%b but fi=%b (should be 0)",int_fsm.ncli, fi);
      	 end

      	 else if (int_fsm.nsti === 1'b0 && fi !== 1'b1) begin
      	    $sformat(msg, "FI failure: nsti=%b but fi=%b (should be 1)",int_fsm.nsti, fi);
      	 end
      end

      // Fail if we've logged an issue.
      if (msg[7:0]) begin
   	 $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	 $error("assertion failure");
   	 #100 $finish;
      end
      else $display("345 OK action/fi");
   end

   always @(posedge nwrite_fl) begin
      #30 begin
   	 if (ibus15 !== fi) begin
   	    $sformat(msg, "flag loading failure: at nwrite_fl posedge, ibus15=%b but fi=%b (should be %b)",
   		     ibus15, fi, ibus15);
   	 end
      end

      // Fail if we've logged an issue.
      if (msg[7:0]) begin
   	 $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	 $error("assertion failure");
   	 #100 $finish;
      end
      else $display("345 OK nwrite_fl");
   end

   always @(negedge nirqs) begin
      #30 begin
   	 // There are reset-time artifacts, so wait until the FSM has reset
   	 // itself. This takes about 20ns.
   	 if ($time > 60) begin
   	    if (nend !== 1'b0) begin
   	       $sformat(msg, "IRQS failure: acknowledged interrupt while nend=%b", nend);
   	    end

   	    // else if (nirq !== 1'b0) begin
   	    //    // This makes assumptions. On a real machine, a short IRQ pulse can
   	    //    // trigger an interrupt, but here, the testbench will be keeping
   	    //    // the IRQ line asserted throughout, so we can use that to see if
   	    //    // an interrupt has been triggered by mistake.
   	    //    $sformat(msg, "IRQS failure: spurious interrupt, nirq=%b", nirq);
   	    // end
   	 end // if ($time > 60)
      end

      // Fail if we've logged an issue.
      if (msg[7:0]) begin
   	 $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	 $error("assertion failure");
   	 #100 $finish;
      end
      else $display("345 OK IRQS");
   end // always @ (negedge nirqs)

endmodule // reg_ar_tb

// End of file.
