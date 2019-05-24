`timescale 1ns/10ps
`include "counter.v"

module counter_191_tb();

// Declare inputs as regs and outputs as wires
   reg 	      npl;
   reg 	      down;
   reg        nce;
   reg        cp;
   reg [3:0]  p;
   wire [3:0] q;
   wire       nrc;
   wire       tc;
   integer    i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_191_tb.vcd");
      $dumpvars (0, counter_191_tb);

      npl = 1;
      down = 0;
      nce = 1;
      p = 4'b1101;

      #20 npl = 0;
      #50 npl = 1;
      #20 npl = 1;		// NOP

      // Clock is disabled here, no count should take place.
      for (i = 0; i < 4; i = i + 1) begin
	 #50 cp = 0;
	 #50 cp = 1;
      end

      // Enable the clock, but assert load. We shouldn't be counting either.
      #50 nce = 0;
      #50 npl = 0;
      for (i = 0; i < 4; i = i + 1) begin
	 #50 cp = 0;
	 #50 cp = 1;
      end

      // Now let's count
      #50 npl = 1;
      for (i = 0; i < 40; i = i + 1) begin
	 #50 cp = 0;
	 #50 cp = 1;
      end

      // Now let's count *down*
      #200 npl = 1;
      #50 down = 1;
      for (i = 0; i < 40; i = i + 1) begin
	 #50 cp = 0;
	 #50 cp = 1;
      end

      #500 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   counter_191 c0 (.p(p), .npl(npl), .down(down), .nce(nce), .cp(cp),
		   .q(q), .nrc(nrc), .tc(tc));

   // Ripple counting.
   //not u0 (cet_in1, tc_out0);
   //not u1 (cet_in2, tc_out1);
   //not u2 (cet_in3, tc_out2);

endmodule
