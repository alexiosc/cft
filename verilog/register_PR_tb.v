`include "register_PR.v"
`include "register.v"

`timescale 10ns/10ps
module register_PR_tb();

// Declare inputs as regs and outputs as wires
   reg [15:0] pc_in;
   reg 	      w_pc;
   reg 	      inc_pc;
   reg [15:0] pr_in;
   reg 	      w_pr;
   reg 	      oe;

   wire [15:0] pr_out;
   wire [5:0] pr_unbuf;

   integer    i;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t d latch toggle1 toggle2 clock clear reset q nq");
      //$monitor ("%g\t  %b %b %b %b %b %b b %b %b %b", 
      //	$time, d, latch, toggle1, toggle2, clock, clear, reset, q, nq);
      $dumpfile ("vcd/register_PR_tb.vcd");
      $dumpvars (0, register_PR_tb);

      pc_in = 0;
      w_pc = 1;
      inc_pc = 0;
      pr_in = 0;
      w_pr = 1;
      oe = 1;

      #50 w_pc = 0;
      #50 w_pc = 1;
      #100 oe = 0;

      // Simulate incrementing the PC. The PR should update whtn PC goes from
      // 07ff to 0800 (and it should update to 0800 & fc00 = 02).
      for (i = 'h7f8; i < 'h804; i = i + 1) begin
	 #300 inc_pc = 1;
	 #15 pc_in = i;
	 #50 inc_pc = 0;
      end

      // Now, simulate loading the PC.
      #500 pc_in = 'h4242;
      #250 w_pc = 0;
      #250 w_pc = 1;

      // Load from the ibus.
      #500 pr_in = 'h423f;
      #250 w_pr = 0;
      #250 w_pr = 1;

      #1000 $finish;      // Terminate simulation
   end // initial begin

   reg_pr reg_pr (pc_in, w_pc, inc_pc, pr_in, w_pr, oe, pr_out, pr_unbuf);
endmodule
