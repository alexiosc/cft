`include "reset.v"

`timescale 1ns/10ps

module reset_logic_tb();

// Declare inputs as regs and outputs as wires
   inout       nreset;		// We drive RESET# open-drain.
   wire [15:0] ibus;
   reg 	       fpreset, powerok, clk1, nreset_r;
   
   wire  nrsthold;
      
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/reset_tb.vcd");
      $dumpvars (0, reset_logic_tb);

      clk1 = 0;
      nreset_r = 1;
      fpreset = 1;
      powerok = 0;

      #1000 powerok = 1;

      #1000 fpreset = 0;
      #200 fpreset = 1;

      #10000 nreset_r = 1'b0;
      #200 nreset_r = 1'b1;
      
      #5000 fpreset = 0;
      #200 fpreset = 1;
      
      #25000 $finish;      // Terminate simulation
   end // initial begin

   assign nreset = nreset_r;

   always begin
      #125 clk1 = ~clk1;
   end

   wire nreset_real;
   wire fpreset_real;
   wire powerok_real;
   
   assign nreset_real = nreset;
   assign fpreset_real = fpreset;
   assign powerok_real = powerok;
   
   // Connect the DUT
   reset_logic reset_logic(nreset_real, nrsthold, clk1, fpreset_real, powerok_real, ibus);

endmodule
