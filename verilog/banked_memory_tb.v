`include "memory.v"
`timescale 1ns/10ps

module banked_memory_tb();

// Declare inputs as regs and outputs as wires
   reg clk;

   reg [15:0] a, d;
   wire [15:0] dbus;
   reg 	      mem, io, r, w, reset; // All active low.

   integer    i;
   
   // Link the 3-state bus and our register (d).
   assign dbus = d;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/banked_memory_tb.vcd");
      $dumpvars (0, banked_memory_tb);

      clk = 0;
      reset = 0;
      mem = 1;
      io = 1;
      r = 1;
      w = 1;
      d = 0;
      a = 0;

      // Reset the memory.
      #3000 reset = 1;

      // Test addresses using the power-on banking.
      for (i = 0; i < 65536; i = i + 2048) begin
	 #500 a = i;
	 #500 a = i + 2047;
      end

      #1000 reset = 0;
      #3000 reset = 1;


      // Check that writing to the bank registers sets -BANKEN.
      for (i = 0; i < 8; i = i + 1) begin
	 #200 io = 0;
	 a = 'h20 + i; 	// Address the BANKi registers.
	 #200 w = 0;
	 
	 #200 w = 1;
	 #200 io = 1;
      end


      // Test addresses using the all-zero banking scheme we just set up.
      for (i = 0; i < 65536; i = i + 4096) begin
	 #500 a = i;
      end

      #1000 reset = 0;
      #3000 reset = 1;

      // Test addresses using the all-zero banking scheme we just set up.
      for (i = 0; i < 65536; i = i + 4096) begin
	 #500 a = i;
      end

      // Read data.
      d = 16'bzzzzzzzzzzzzzzzz;
      for (i = 0; i < 65536; i = i + 4096) begin
	 #500 a = i;
	 #100 mem = 0;
	 #100 r = 0;
	 #300 r = 1;
	 #100 mem = 1;
      end


      // Setup a banking scheme where the first 48kWords are RAM and the last 16kWords are ROM.
      for (i = 0; i < 8; i = i + 1) begin
	 #200 io = 0;
	 a = 'h20 + i; 	// Address the BANKi registers.
	 d = i < 6 ? i : 'h80 | (i - 6);
	 #200 w = 0;
	 
	 #200 w = 1;
	 #200 io = 1;
      end

      // Test addresses using the all-zero banking scheme we just set up.
      for (i = 0; i < 65536; i = i + 4096) begin
	 #500 a = i;
      end

      // Read data.
      d = 16'bzzzzzzzzzzzzzzzz;
      for (i = 0; i < 65536; i = i + 4096) begin
	 #500 a = i;
	 #100 mem = 0;
	 #100 r = 0;
	 #300 r = 1;
	 #100 mem = 1;
      end


      #40000 $finish;      // Terminate simulation
   end

   always begin
      #250 clk = ~clk;
   end
   
   // Connect the memory to the testbed.
   banked_memory banked_memory (a, dbus, mem, io, r, w, reset, clk);

endmodule
