`include "register.v"

`timescale 10ns/10ps

module register_tb();

   reg [15:0]    ibus;
   wire [15:0] 	 ibus_real, pc, dr, ac;

   reg 		 nreset;
   reg 		 nrpc, nrdr, nrac;
   reg 		 nwpc, nwdr, nwac;
   reg 		 ninc;

   wire 	 fneg, fzero, ninccpl;

   wire 	 reset;
   integer 	 i, j, k;
      
   localparam MAX = 1024;
   localparam DELTA = 21553;
   localparam MODULO = 65536;

   // Initialize all variables
   initial begin
      $dumpfile ("vcd/register_tb.vcd");
      $dumpvars (0, register_tb);

      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      nrpc = 1;
      nrdr = 1;
      nrac = 1;
      nwpc = 1;
      nwdr = 1;
      nwac = 1;
      ninc = 1;

      // Reset
      #1000 nreset = 0;
      #1000 nreset = 1;

      j = 65535;
      for (i = 0; i < MAX; i = i + 1) begin
	 #250 ibus = j;

	 // Load the registers.
	 #125 nwpc = 0;
	 #125 nwpc = 1;
	 nwdr = 0;
	 #125 nwdr = 1;
	 nwac = 0;
	 #125 nwac = 1;

	 #63 ibus = 16'bzzzz_zzzz_zzzz_zzzz;

	 // Increment them a bit.

	 #250
	 for (k = 0 ; k < 10; k = k + 1) begin
	    #125 ninc = 0;
	    #125 ninc = 1;
	 end

	 // Put them on the IBUS
	 #250 nrpc = 0;
	 #125 nrpc = 1;
	 nrdr = 0;
	 #125 nrdr = 1;
	 nrac = 0;
	 #125 nrac = 1;

	 j = j + DELTA;
      end

      #1000 $finish;      // Terminate simulation
   end // initial begin

   assign ibus_real = ibus;
   not #6 (reset, nreset);
   reg_pc regpc (ibus_real, nrpc, nwpc, ninc, reset, pc);
   reg_dr regdr (ibus_real, nrdr, nwdr, ninc, reset, dr);
   reg_ac regac (ibus_real, nrac, nwac, ninc, reset, ac, fneg, fzero, ninccpl);
   
endmodule
