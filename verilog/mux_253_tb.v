`timescale 1ns/10ps
`include "mux.v"

module mux_253_tb();

   reg [1:0] sel;
   reg [3:0] i1, i2;
   reg 	     oe1, oe2;
   wire      y1, y2;

   integer   i, s;

   // Initialize all variables
   initial begin        
      $display ("time\t oe1 sel i1  y1   oe2 sel i2   y2");
      $monitor ("%g\t %b  %b  %b  %b   %b  %b  %b   %b",
		$time, oe1, sel, i1, y1, oe2, sel, i2, y2);
      $dumpfile ("mux_253_tb.vcd");
      $dumpvars (0, mux_253_tb);

      oe1 = 1;
      oe1 = 1;

      #200 oe1 = 0;
      #200 oe2 = 0;

      for (i = 0; i < 16; i = i + 1) begin
	 i1 = i;
	 i2 = i;
	 for (s = 0; s < 4; s = s + 1) begin
	    #100 sel = s;
	 end
      end

      #1000 oe1 = 1;
      #200 oe2 = 1;

      #1000 $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   mux_253 mux_253 (sel, i1, oe1, y1, i2, oe2, y2);

endmodule
