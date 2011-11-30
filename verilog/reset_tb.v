`include "reset.v"

`timescale 1ns/10ps

module reset_logic_tb();

// Declare inputs as regs and outputs as wires
   reg clk, reset;
   wire resetting;
   
   // Initialize all variables
   initial begin        
      $display ("time\t clk reset resetting");	
      $monitor ("%g\t %b   %b     %b", 
		$time, clk, reset, resetting);
      $dumpfile ("vcd/reset_tb.vcd");
      $dumpvars (0, reset_logic_tb);

      clk = 1'b0;
      reset = 1'b1;

      #200 reset = 1'b0;
      #10 reset = 1'b1;
      
      #1000 $finish;      // Terminate simulation
   end

   always begin
      #15 clk = ~clk;
   end
   
   // Connect DUT to test bench
   reset_logic reset_logkc (clk, reset, resetting);

endmodule
