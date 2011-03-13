///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Clock generator and reset controller.
//
// NOTES: I want to experiment with different clocks, and the best and
// easiest way is to use an appropriate programmable part for this. I
// have a lot of Atmega 8s lying around, so I'll use one of those. I
// can program them to issue custom clock pulses.
//
///////////////////////////////////////////////////////////////////////////////

`ifndef clock_v
`define clock_v

`timescale 1ns/10ps

module clock_generator (clock, clock2, clock3, clock4, halt, reset);
   parameter cp = 1000;

   input halt, reset;
   output clock, clock2, clock3, clock4;

   tri1   halt;
   reg 	  clk;
   wire   clk2, clk3, clk4;
   wire   clock, clock2, clock3, clock4;

   reg 	  run_clock;

   assign clock = clk;
   assign clock2 = clk2;
   assign clock3 = clk3;
   assign clock4 = clk4;
   //and (clock, reset, clk);
   //and (clock2, reset, clk2);
   //and (clock3, reset, clk3);
   //and (clock4, reset, clk4);

   initial begin
      clk <= 0;
      run_clock <= 1;
   end

   always @(negedge halt) begin
      if (reset == 1) begin
	 run_clock <= 0;
	 $display("*** CLOCK HALTED ***");
	 #30000 $finish;
      end
   end

   //always @(posedge reset) begin
   //   clk <= 0;
   //end

   always begin
      #(cp / 2) clk <= run_clock & ~clk;
   end

   assign #(cp / 4) clk2 = clk;
   assign #(cp / 2) clk3 = clk;
   assign #(cp / 4) clk4 = ~clk;
endmodule // clock_generator


`endif //  `ifndef clock_v
// End of file.
