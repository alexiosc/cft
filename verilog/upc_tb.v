`include "upc.v"

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

   wire [3:0] upc_out;
      
   initial begin
      
      //$display ("time\t d pulse");
      //$monitor ("%g\t  %b %b %b %b", 
      // 	       $time, d, pulse1, pulse2, pulse);
      $dumpfile ("vcd/upc_tb.vcd");
      $dumpvars (0, upc_tb);

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

      // Make sure we don't count on WS#
      #10000 nws = 1'b0;
      #10000 nws = 1'b1;
      
      // Make sure we don't count on HALT#
      #10000 nhalt = 1'b0;
      #10000 nhalt = 1'b1;

      // Assert a reset and let it run.
      #10000 nreset = 1'b0;
      #30 nrsthold = 1'b0;
      #10000 nreset = 1'b1;
      nrsthold = 1'b1;
      

      #50000 $finish;
      
   end // initial begin

   // Simulate a realistic fast clock
   always begin
      #185.5 clk4 = 0;
      #63.5 clk4 = 1;
   end

   // Simulate asynchronous END# and ENDEXT# strobes
   always begin
      #12400 nend = 0;
      #250 nend = 1;
   end
   always begin
      #14100 nendext = 0;
      #250 nendext = 1;
   end

   upc upc(.nreset(nreset), .nrsthold(nrsthold), .clk4(clk4),
	   .nend(nend), .nendext(nendext), .nws(nws), .nhalt(nhalt),
	   .upc(upc_out));
   
endmodule // step_tb
