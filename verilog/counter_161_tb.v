`timescale 1ns/10ps
`include "counter.v"

module counter_161_tb();

// Declare inputs as regs and outputs as wires
   reg 	     mr;
   reg 	     cp;
   reg 	     cet;
   reg 	     cep;
   reg 	     pe;
   reg [15:0] p;

   wire [15:0] q;
   wire       tc;

   // Initialize all variables
   initial begin        
      $display ("time\t cp mr cet cep pe  p   q    tc");	
      $monitor ("%g\t %b %b %b %b %b %b %b %b", 
		$time, cp, mr, cet, cep, pe, p, q, tc);
      $dumpfile ("counter_161_tb.vcd");
      $dumpvars (0, counter_161_tb);

      cp = 0;       // initial value of clock
      mr = 0;
      cet = 0;
      cep = 0;
      pe = 0;
      p = 0;

      #15 mr = 1;
      #100 cet = 1;
      #100 cep = 1;
      #50 pe = 1;

      #200 pe = 0;
      #200 p = 'h0ffa;
      #230 pe = 1;

      #10000 $finish;      // Terminate simulation
   end

   always begin
      #30 cp = ~cp;
   end
   
   // Connect DUT to test bench
   counter_161 c0 (mr, cp, cet, cep, pe, p[3:0], q[3:0], tc_out0);
   counter_161 c1 (mr, cp, tc_out0,   cep, pe, p[7:4],   q[7:4],   tc_out1);
   counter_161 c2 (mr, cp, tc_out1,   cep, pe, p[11:8],  q[11:8],   tc_out2);
   counter_161 c3 (mr, cp, tc_out2,   cep, pe, p[15:12],  q[15:12],  tc);

   // Ripple counting.
   //not u0 (cet_in1, tc_out0);
   //not u1 (cet_in2, tc_out1);
   //not u2 (cet_in3, tc_out2);

endmodule
