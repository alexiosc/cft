`timescale 1ns/10ps
`include "constant_store.v"

module constant_store_tb();

// Declare inputs as regs and outputs as wires
   reg         oe;
   reg         rst;
   reg [1:0]   cs;
   wire [15:0] q;
   
   // Initialize all variables
   initial begin        
      $display ("time\t rst oe cs q");	
      $monitor ("%g\t %b   %b  %b %b", 
		$time, rst, oe, cs, q);

      $dumpfile ("constant_store_tb.vcd");
      $dumpvars (0, constant_store_tb);

      oe = 1;
      rst = 1;
      cs = 2'b00;

      #200 oe = 0;
      #200 cs = 2'b00;
      #200 cs = 2'b01;
      #200 cs = 2'b10;
      #200 cs = 2'b11;

      #200 rst = 0;
      #200 oe = 0;
      #200 cs = 2'b00;
      #200 cs = 2'b01;
      #200 cs = 2'b10;
      #200 cs = 2'b11;
      
      #1000 $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   constant_store constant_store (oe, rst, cs, q);

endmodule
