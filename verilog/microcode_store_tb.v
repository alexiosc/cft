`include "microcode_store.v"

`timescale 1ns/10ps

module microcode_store_tb();
   reg nreset;
   reg nhalt;
   
   reg [18:0] uaddr;

   wire [23:0] udata;
      
   initial begin
      
      //$display ("time\t d pulse");
      //$monitor ("%g\t  %b %b %b %b", 
      // 	       $time, d, pulse1, pulse2, pulse);
      $dumpfile ("vcd/microcode_store_tb.vcd");
      $dumpvars (0, microcode_store_tb);

      nreset = 1'b0;
      nhalt = 1'b1;
      uaddr = 24'b1100000000000000000; // That's where the good stuff starts.

      // Make sure we're not counting during reset.
      #1000 nreset = 1'b1;

      #1000 nhalt = 1'b0;
      #1000 nhalt = 1'b1;

      #500000 $finish;
      
   end // initial begin

   // Simulate a realistic fast clock
   always begin
      #250 uaddr = uaddr + 1;
   end

   microcode_store microcode_store(.nreset(nreset), .nhalt(nhalt), .uaddr(uaddr),
				   .udata(udata));
   
endmodule // step_tb
