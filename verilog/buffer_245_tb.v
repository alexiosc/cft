`timescale 1ns/10ps
`include "buffer.v"

module buffer_245_tb();
   reg 	      dir, en;
   
   wire [7:0] a, b;
   reg  [7:0] aw, bw;

   // Hack to allow bidirectional tri-state driving/reading.
   assign a = aw;
   assign b = bw;
   
   integer    i;
   

   // Initialize all variables
   initial begin        
      $dumpfile ("buffer_245_tb.vcd");
      $dumpvars (0, buffer_245_tb);
      $display ("time\t en dir a        aw       b        bw");	
      $monitor ("%g\t  %b   %b %b %b %b %b", 
		$time, en, dir, a, aw, b, bw);

      en = 1;
      dir = 0;
      aw = 8'bzzzzzzzz;
      bw = 8'bzzzzzzzz;

      #10 dir = 1;
      #20 dir = 0;
      #30 en = 0;
      #40 dir = 1;

      // First, try A -> B (dir = 0)
      #50 aw = 1;
      #100 aw = 2;
      #150 aw = 3;
      #200 aw = 8'bzzzzzzzz;
      #250 dir = 0;
      #300 bw = 8'b10101010;
      #350 bw = 8'b01010101;

      #500 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   buffer_245 #(2) buffer (dir, en, a, b);
endmodule // buffer_245_tb

// End of file.
