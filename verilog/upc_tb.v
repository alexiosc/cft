`include "dfp_step.v"

`timescale 1ns/10ps

module upc_tb();
   reg nreset;

   reg nrsthold;
   reg clk4;
   reg nend;
   reg nendext;
   reg nws;
   reg nhalt;
   
   reg [18:0] uaddr;

   wire       upc;
      
   initial begin
      
      //$display ("time\t d pulse");
      //$monitor ("%g\t  %b %b %b %b", 
      // 	       $time, d, pulse1, pulse2, pulse);
      $dumpfile ("vcd/step_tb.vcd");
      $dumpvars (0, step_tb);

      nreset = 1'b0;
      nrsthold = 1'b1;
      nend = 1'b1;
      nendext = 1'b1;
      nws = 1'b1;
      nhalt = 1'b1;
      clk4 = 1;

      // Make sure we're not counting during reset.
      #10000 nrsthold = 1'b0;

      // Make sure we ARE counting during reset hold, because the
      // microcode engine executes the reset microprogram during this
      // time.
      #10000 nrsthold = 1'b1;

      #10000 $finish;
      
   end // initial begin

   // Simulate a realistic fast clock
   always begin
      #185.5 clk4 = 0;
      #63.5 clk4 = 1;
   end

   upc upc(.nreset(nreset), .nrsthold(nrsthold), .clk4(clk4),
	   .nend(nend), .nendext(nendext), .nws(nws), .nhalt(nhalt),
	   .upc(upc));
   
endmodule // step_tb
