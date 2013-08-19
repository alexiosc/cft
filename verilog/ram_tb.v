`include "ram.v"
`timescale 1ns/10ps

module ram_tb();

   parameter bits = 12;

// Declare inputs as regs and outputs as wires
   reg [bits:0] a;
   reg 		oe;
   reg 		we;
   reg 		ce;

   wire [7:0] 	d;
   reg [7:0] 	d_write;

   integer 	i;
   integer 	t;

   assign d = d_write;
   
   // Initialize all variables
   initial begin        
      $display ("time\t oe ce a            d");	
      $monitor ("%g\t %b %b %b %b %b %b", $time, oe, we, ce, a, d, d_write);
      $dumpfile ("vcd/ram_tb.vcd");
      $dumpvars (0, ram_tb);

      d_write = 8'bzzzzzzzz;
      oe = 1;
      we = 1;
      ce = 1;
      a = 0;

      // Read some data.
      
      #0 oe = 0;
      #0 ce = 0;
      #0 we = 1;

      #100 a = 0;
      #100 a = 1;
      #100 a = 2;
      #100 a = 3;
      #100 a = 4;
      #100 a = 5;

      // Write some data.

      #900 oe = 1;

      t = 1000;
      for (i = 0; i < 4; i = i + 1) begin
	 t = 1000 + (100 * i);
	 #t a = i;
	 #(t + 10) we = 0;
	 #(t + 50) d_write = 16 << i;
	 #(t + 80) we = 1;
	 #(t + 85) d_write = 8'bzzzzzzzz;
      end

      #(t + 500) d_write = 8'bzzzzzzzz;
      
      // Read stuff back.

      #2000 oe = 0;
      #2000 ce = 0;
      #20000 we = 1;

      #2100 a = 0;
      #2200 a = 1;
      #2300 a = 2;
      #2400 a = 3;
      #2500 a = 4;
      #2600 a = 5;

      #10000 $finish;
   end
   
   // Connect DUT to test bench
   sram #(13, 70, "test_rom.bin") test_ram (a, d, ce, we, oe);

endmodule
