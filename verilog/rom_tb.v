`timescale 1ns/10ps
`include "rom.v"

module rom_tb();

   parameter bits = 12;

// Declare inputs as regs and outputs as wires
   reg [bits:0] a;
   reg 		oe;
   reg 		ce;

   wire [7:0] 	d;

   integer 	i;

   // Initialize all variables
   initial begin        
      //$display ("time\t oe ce a            d");	
      //$monitor ("%g\t %b %b %b %b", $time, oe, ce, a, d);
      $dumpfile ("out.vcd");
      $dumpvars (0, rom_tb);

      oe = 1;
      ce = 1;
      a = 0;
      
      #10 oe = 0;
      #10 ce = 0;

      $display ("Simulating...");
      for (i=0; i < 100; i=i+1) begin
	 if ((i % 1024) == 0) begin
	    $display ("Address = ", i);
	 end
	 #(200 + (i * 100)) a = i;
      end

      #(200 + (i * 200)) $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   rom #(13, 70, "test_rom.bin") test_rom (a, d, ce, oe);

endmodule
