`include "video.v"
`timescale 1ns/10ps

module video_crc_tb();

   reg       inc, hgr, nvs, nreset;
   reg [1:0] clh;
   
   wire [3:0] rc;
   wire       nincsl, nlastsl, nincrow;
  
   integer   i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/video_crc_tb.vcd");
      $dumpvars (0, video_crc_tb);

      nreset = 0;
      inc = 0;
      hgr = 0;
      clh = 0;
      nvs = 1;
      i = 0;

      #200 nreset = 1;
      nvs = 0;
      #15 nvs = 1;

      #8000 clh = 1; i = 0; nvs = 0;
      #15 nvs = 1;
      #8000 clh = 2; i = 0; nvs = 0;
      #15 nvs = 1;
      #8000 clh = 3; i = 0; nvs = 0;
      #15 nvs = 1;
      #8000 hgr = 1; clh = 0; i = 0; nvs = 0;
      #15 nvs = 1;
      #8000 clh = 1; i = 0; nvs = 0;
      #15 nvs = 1;
      #8000 clh = 2; i = 0; nvs = 0;
      #15 nvs = 1;
      #8000 clh = 3; i = 0; nvs = 0;
      #15 nvs = 1;
      

      #400000 $finish;      // Terminate simulation
   end // initial begin

   always begin
      #80 inc = 1;
      i = i + 1;
      #80 inc = 0;
   end

   wire creg;
   assign creg = inc;

   // Connect DUT to test bench
   CellRowCounter crc (nvs, creg, hgr, clh, inc, nincrow, nlastsl, rc);
endmodule
