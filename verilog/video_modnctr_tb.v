`include "video.v"
`timescale 1ns/10ps

module video_modnctr_tb();

   reg       reset1, inc, hgr;
   reg [1:0] clh;
   
   wire [3:0] q;
   wire       nincsl, nlastsl;
   
   integer   i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/video_modnctr_tb.vcd");
      $dumpvars (0, video_modnctr_tb);

      reset1 = 0;
      inc = 0;
      hgr = 0;
      clh = 0;

      #200 reset1 = 1;
      #15 reset1 = 0;

      #4000 clh = 1;
      #4000 clh = 2;
      #4000 clh = 3;
      #4000 hgr = 1; clh = 0;
      #4000 clh = 1;
      #4000 clh = 2;
      #4000 clh = 3;
      

      #400000 $finish;      // Terminate simulation
   end // initial begin

   always begin
      #100 inc = 1;
      #14 inc = 0;
   end

   // Connect DUT to test bench
   modnctr modnctr (reset1, inc, clh, hgr, q, nincsl, nlastsl);

endmodule
