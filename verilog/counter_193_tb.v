`timescale 1ns/10ps
`include "counter.v"

module counter_193_tb();

// Declare inputs as regs and outputs as wires
   reg 	     clear;
   reg 	     load;
   reg 	     count_up;
   reg 	     count_down;
   reg [15:0] p;

   wire [15:0] q;
   wire        carry;
   wire        borrow;

   integer     i;
   
   // Initialize all variables
   initial begin        
      $display ("time\t clear load c_up c_dn p               q               carry borrow");	
      $monitor ("%g\t %b %b %b %b %b %b %b %b", 
		$time, clear, load, count_up, count_down, p, q, carry, borrow);
      $dumpfile ("vcd/counter_193_tb.vcd");
      $dumpvars (0, counter_193_tb);

      clear = 0;       // initial value of clock
      load = 1;
      count_up = 1;
      count_down = 1;
      p = 4'b1101;

      #10 clear = 1;
      #10 clear = 0;
      #20 load = 0;
      #10 load = 1;
      #20 load = 1;		// NOP

      for (i = 0; i < 5; i = i + 1) begin
	 #10 count_up = 0;
	 #10 count_up = 1;
      end

      #20 load = 1;
      
      for (i = 0; i < 5; i = i + 1) begin
	 #10 count_down = 0;
	 #10 count_down = 1;
      end

      // Now load something high.
      #50 p = 16'hfefa;
      #10 load = 0;
      #10 load = 1;
      
      for (i = 0; i < 10; i = i + 1) begin
	 #10 count_up = 0;
	 #10 count_up = 1;
      end
      

      // Now load something very high (test wrap-around).
      #50 p = 16'hfffa;
      #10 load = 0;
      #10 load = 1;
      
      for (i = 0; i < 10; i = i + 1) begin
	 #10 count_up = 0;
	 #10 count_up = 1;
      end
      

      // Now load something very low (test wrap-around).
      #50 p = 16'h0003;
      #10 load = 0;
      #10 load = 1;
      
      for (i = 0; i < 10; i = i + 1) begin
	 #10 count_down = 0;
	 #10 count_down = 1;
      end
      
      // Now load something very low (debug carry/borrow on load).
      #50 p = 16'h0800;
      #10 load = 0;
      #30 load = 1;
      

      #500 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   counter_193 c0 (clear, load, p[3:0],   count_up, count_down, q[3:0],   c0, b0);
   counter_193 c1 (clear, load, p[7:4],   c0, b0,               q[7:4],   c1, b1);
   counter_193 c2 (clear, load, p[11:8],  c1, b1,               q[11:8],  c2, b2);
   counter_193 c3 (clear, load, p[15:12], c2, b2,               q[15:12], c3, b3);
   //counter_193 c1 (mr, cp, tc_out0,   cep, pe, p[7:4],   q[7:4],   tc_out1);
   //counter_193 c2 (mr, cp, tc_out1,   cep, pe, p[11:8],  q[11:8],   tc_out2);
   //counter_193 c3 (mr, cp, tc_out2,   cep, pe, p[15:12],  q[15:12],  tc);

   assign carry = c2;
   assign borrow = b2;

   // Ripple counting.
   //not u0 (cet_in1, tc_out0);
   //not u1 (cet_in2, tc_out1);
   //not u2 (cet_in3, tc_out2);

endmodule
