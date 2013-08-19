`include "serial.v"
`timescale 1ns/10ps

module video_shiftreg_tb();

   reg [0:7] p;
   reg 	     nshift, nload;
   wire      q;
   
   integer   i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/video_shiftreg_tb.vcd");
      $dumpvars (0, video_shiftreg_tb);

      nshift = 1;
      nload = 1;
      p = 0;

//      #30 nshift = 0;
      #20 nshift = 1;

      #200 p = 8'b01010101;
      nload = 0;
      #20 nload = 1;

      for (i = 0; i < 7; i = i + 1) begin
      	 #20 nshift = 0;
      	 #20 nshift = 1;
      end

      p = 8'b01010101;
      #20 nload = 0;
      #20 nload = 1;
      
      for (i = 0; i < 8; i = i + 1) begin
      	 #20 nshift = 0;
      	 #20 nshift = 1;
      end

      #2000 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   video_shiftreg vsr (p, q, nload, nshift);

endmodule
