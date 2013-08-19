`timescale 1ns/10ps
`include "counter.v"

module counter_193_tb();

// Declare inputs as regs and outputs as wires
   reg 	     clear;
   reg 	     load;
   reg 	     count_up;
   reg 	     count_down;
   reg [3:0] p;

   wire [3:0] q;
   wire        carry;
   wire        borrow;

   integer     i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_193_tb.vcd");
      $dumpvars (0, counter_193_tb);

      clear = 0;       // initial value of clock
      load = 1;
      count_up = 1;
      count_down = 1;
      p = 4'b1101;

      #50 clear = 1;
      #50 clear = 0;
      #20 load = 0;
      #50 load = 1;
      #20 load = 1;		// NOP

      for (i = 0; i < 32; i = i + 1) begin
	 #50 count_up = 0;
	 #50 count_up = 1;
      end

      #20 load = 1;
      
      for (i = 0; i < 32; i = i + 1) begin
	 #50 count_down = 0;
	 #50 count_down = 1;
      end

      // Now load something high.
      #50 p = 4'ha;
      #50 load = 0;
      #50 load = 1;
      
      for (i = 0; i < 10; i = i + 1) begin
	 #50 count_up = 0;
	 #50 count_up = 1;
      end
      

      // Now load something very high (test wrap-around).
      #200 p = 4'ha;
      #50 load = 0;
      #50 load = 1;
      
      for (i = 0; i < 10; i = i + 1) begin
	 #50 count_up = 0;
	 #50 count_up = 1;
      end
      

      // Now load something very low (test wrap-around).
      #200 p = 4'h3;
      #50 load = 0;
      #50 load = 1;
      
      for (i = 0; i < 10; i = i + 1) begin
	 #50 count_down = 0;
	 #50 count_down = 1;
      end
      
      // Now load something very low (debug carry/borrow on load).
      #200 p = 4'h0;
      #50 load = 0;
      #30 load = 1;
      

      #500 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   counter_193 c0 (clear, load, p,   count_up, count_down, q,   c0, b0);

   // Ripple counting.
   //not u0 (cet_in1, tc_out0);
   //not u1 (cet_in2, tc_out1);
   //not u2 (cet_in3, tc_out2);

endmodule
