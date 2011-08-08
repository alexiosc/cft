`include "flipflop.v"
`include "clock.v"

`timescale 1ns/10ps

module test();

   reg rawclk;

   reg reset;
   reg halt;
   reg run;
      
initial begin
     
     //$display ("time\t d pulse");
     //$monitor ("%g\t  %b %b %b %b", 
     // 	       $time, d, pulse1, pulse2, pulse);
     $dumpfile ("vcd/test.vcd");
     $dumpvars (0, test);

   rawclk = 0;
   reset = 0;
   halt = 1;
   run = 0;
   #50 reset = 1;
   #5000 halt = 0;
   #250 halt = 1;
   #5000 run = 1;
   #250 run = 0;

   #10000 $finish;
     
  end // initial begin

   always begin
      #125 rawclk = ~rawclk;
   end

   wire myclock, myclock2, myclock3, myclock4;
   
   assign myclock4 = qn1;
   assign myclock3 = qn2;
   assign myclock2 = q1;
   assign myclock = q2;

   // The first FF: The run-clock FF is cleared by the /RESET signal,
   // and set by the /HALT signal.  The second FF produces clk and
   // nclk, complementary clocks at 0° and 180°, and obviously divides
   // the clock by two.
   wire clk, nclk;
   flipflop_112 ff1 (run, 0, rawclk, reset, halt, clken, nclken,
		    1, 1, rawclk, 1, reset, clk, nclk);

   wire clken, nclken, clk1, nclk1;
   nand and_7408a (clk1, clk, clken);
   nand and_7408b (nclk1, nclk, clken);
   
   // Clock divider and phase generator.
   wire q1, q2, qn1, qn2;
   flipflop_112 ff2 (1, 1, clk1, 1, reset, q1, qn1,
		    1, 1, nclk1, 1, reset, q2, qn2);

   wire myclock14;
   nand nand_7408c (myclock14, myclock2, myclock3);

   wire gc, gc2, gc3, gc4, gc14, gp;
   clock_generator cgen (halt, 0, 0, reset, gc, gc2, gc3, gc4, gc14, gp);
   
endmodule // tritest
