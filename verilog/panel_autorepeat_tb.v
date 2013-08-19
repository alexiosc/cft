`timescale 1ns/10ps

module panel_autorepeat_tb();

// Declare inputs as regs and outputs as wires
   reg step, clk, pulse;
   wire i, nstep;
   wire q;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/panel_autorepeat_tb.vcd");
      $dumpvars (0, panel_autorepeat_tb);

      clk = 0;
      step = 1;
      pulse = 1;

      #20 step = 0;
      #20 step = 1;

      #80 step = 0;
      #100 step = 1;

      #100 $finish;      // Terminate simulation
   end // initial begin

   nand (i, pulse, clk);
   nand (q, nstep, i);

   not (nstep, step);

   always @(negedge step) begin
      pulse = 0;
      #50 pulse = 1;
   end

   always begin
      #1 clk = ~clk;
   end
   
endmodule
