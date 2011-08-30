`include "int.v"
`include "register.v"

`timescale 10ns/10ps

module int_tb();
   reg clock;
   reg [3:0] upc;
   reg i_flag;
   reg cli;
   reg go_fetch;
   reg irq;
   reg reset;

   wire int_out;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/int_tb.vcd");
      $dumpvars (0, int_tb);

      clock = 0;
      reset = 0;
      upc = 0;
      i_flag = 1;
      go_fetch = 1;
      irq = 1;
      cli = 1;

      #0 reset =0;
      #2000 reset = 1;

      #3000 cli = 0;
      i_flag = 0;		// Enable interrupts.
      #250 cli = 1;
      
      #30000 $finish;      // Terminate simulation
   end // initial begin

   always @(posedge clock) begin
      if (reset == 1) upc = upc + 1;
   end

   always @(posedge go_fetch) begin
      upc <= 0;
   end

   always @(negedge reset) begin
      upc <= 0;
      go_fetch = 0;
   end

   always @(negedge int_out) begin
      #1000 cli = 0;
      #250 cli = 1;
   end

   always begin
      #2250 go_fetch = 0;
      #250 go_fetch = 1;
   end

   always begin
      #500 clock = ~clock;
   end

   always begin
      #13130 irq = 0;
      #50 irq = 1;
   end

   int_unit int (clock, upc, go_fetch, cli, i_flag, irq, reset, int_out);
endmodule
