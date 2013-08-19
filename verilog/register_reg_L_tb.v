`include "register.v"
`include "clock.v"

`timescale 1ns/10ps

module register_reg_L_tb();

   reg nreset, ncll, ncpl, nltadd, nfltadd, isroll, roll16;
   wire fl;

   integer i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/register_reg_L_tb.vcd");
      $dumpvars (0, register_reg_L_tb);

      nreset = 0;
      ncll = 1;
      ncpl = 1;
      nltadd = 1;
      isroll = 0;
      roll16 = 0;
      nfltadd = 1;

      #250 nreset = 1;

      // Toggle sources
      for (i = 0; i < 5; i = i + 1) begin
	 #500 ncpl = 0;
	 #250 ncpl = 1;
      end

      for (i = 0; i < 4; i = i + 1) begin
	 #500 nfltadd = 0;
	 #250 nfltadd = 1;
      end

      // Clear (via CLL#)
      #1000 ncll = 0;
      #250 ncll = 1;

      // Set (via toggle)
      #500 nfltadd = 0;
      #250 nfltadd = 1;

      // Clear (via RESET#)
      #500 nreset = 0;
      #250 nreset = 1;

      // Explicit set (ROLL)
      #1000
      for (i = 0; i < 5; i = i + 1) begin
	 #500 isroll = 1;
	 roll16 = i & 1;
	 #500 isroll = 0;
      end

      #1000 $finish;      // Terminate simulation
   end // initial begin

   wire        clk1, clk2, clk3, clk4, clk5, nt12, nt34;
   clock_generator clock_generator (1, 1,
				    nreset,
				    0, 0,
				    1, 0,
				    clk1, clk2, clk3, clk4, nt12, nt34);


   reg_L reg_L (nreset, clk4, ncll, ncpl, nfltadd, isroll, roll16, fl);
endmodule
