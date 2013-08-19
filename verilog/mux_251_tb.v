`include "mux.v"
`timescale 1ns/10ps

module mux_251_tb();

   reg [2:0] sel;
   reg [7:0] d;
   reg 	     e;

   wire      y, w;

   integer   i, j;

   // Initialize all variables
   initial begin
      /*
      $display ("time\t oe1 sel i1  y1   oe2 sel i2   y2");
      $monitor ("%g\t %b  %b  %b  %b   %b  %b  %b   %b",
		$time, oe1, sel, i1, y1, oe2, sel, i2, y2);
       */
      $dumpfile ("vcd/mux_251_tb.vcd");
      $dumpvars (0, mux_251_tb);

      e = 1;
      d = 0;
      sel = 0;

      #200 e = 0;

      for (i = 0; i < 8; i = i + 1) begin
	 for (j = 0; j < 8; j = j + 1) begin
	    #200
	    d <= 1 << i;
	    sel <= j;
	 end
      end

      #1000 e = 1;

      #1000 $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   mux_251 mux_251 (sel, d, e, y, w);

endmodule
