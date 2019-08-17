//
// REDESIGNED IN 2019
//

`include "reset.v"
`include "constant_store.v"

`timescale 1ns/10ps

module reset_logic_tb();

// Declare inputs as regs and outputs as wires
   inout       nreset;		// We drive RESET# open-drain.
   reg 	       fpreset, powerok, clk, nreset_r;
   
   wire        nrsthold;
   wire [15:0] ibus;
      
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/reset_tb.vcd");
      $dumpvars (0, reset_logic_tb);

      clk = 0;
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
      
      #10000 $finish;      // Terminate simulation
   end // initial begin

   assign nreset = nreset_r;

   always begin
      #187.5 clk = 1;
      #62.5  clk = 0;
   end
   
   reset_logic reset_logic(.nreset(nreset), .nrsthold(nrsthold), .clk3(clk), .fpreset(fpreset), .powerok(powerok));
   constant_store csu (.nrsthold(nrsthold), .nruen(1'b0), .raddr(5'b0), .ibus(ibus));

endmodule
