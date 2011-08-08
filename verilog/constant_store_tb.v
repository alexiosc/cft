`include "constant_store.v"

`timescale 1ns/10ps

module constant_store_tb();

// Declare inputs as regs and outputs as wires
   reg         in_rst;
   reg         in_int;
   reg 	       r_cs1;
   reg 	       r_cs2;
   wire [15:0] q;

   integer     i;

   // Initialize all variables
   initial begin        
      //$display ("time\t rst oe cs q");	
      //$monitor ("%g\t %b   %b  %b %b", $time, rst, oe, cs, q);

      $dumpfile ("vcd/constant_store_tb.vcd");
      $dumpvars (0, constant_store_tb);

      in_rst = 1;
      in_int = 1;
      r_cs1 = 1;
      r_cs2 = 1;

      #200 in_rst = 0;
      for (i = 0; i < 16; i = i + 1) begin
	 #200 begin
	    in_rst = i & 8 ? 1 : 0;
	    in_int = i & 4 ? 1 : 0;
	    r_cs2 = i & 2 ? 1 : 0;
	    r_cs1 = i & 1;
	 end
      end
      
      #500 $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   constant_store constant_store (in_rst, in_int, r_cs1, r_cs2, q);

endmodule
