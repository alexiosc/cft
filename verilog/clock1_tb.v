`include "flipflop.v"
`include "clock.v"

`timescale 1ns/10ps

module clock_tb();

   reg rawclk;

   reg reset;
   reg halt;
   reg run;
   reg step;

   wire clock, clock2, clock3, clock4, clock14, clock34;
   reg 	myclk34, myclk34d;
   
   integer i;
      
initial begin
     
     //$display ("time\t d pulse");
     //$monitor ("%g\t  %b %b %b %b", 
     // 	       $time, d, pulse1, pulse2, pulse);
     $dumpfile ("vcd/clock_tb.vcd");
     $dumpvars (0, clock_tb);

   rawclk = 0;
   reset = 0;
   halt = 1;
   run = 0;
   step = 0;
   
   #50 reset = 1;
   #5000 halt = 0;
   #250 halt = 1;

   #2000 step = 1;
   #1000 step = 0;
   for (i = 0; i < 20; i = i + 1) begin
      #(1000 + ($random % 400) - 200) step = 1;
      #(1000 + ($random % 400) - 200) step = 0;
   end

   #5000 run = 1;
   #250 run = 0;

   #10000 $finish;
     
  end // initial begin

   always begin
      #125 rawclk = ~rawclk;
   end
   always begin
      #120 myclk34 = clock3 & clock4;
   end
   clock_generator cgen (halt, run, step, reset, clock, clock2, clock3, clock4, clock14, clock34);
   
endmodule // triclock_tb
