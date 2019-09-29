///////////////////////////////////////////////////////////////////////////////
//
// TEST THE INSTRUCTION REGISTER
//
///////////////////////////////////////////////////////////////////////////////

// REDESIGNED IN 2019

`include "reg_ir.v"
`timescale 1ns/10ps

module reg_ir_tb();
   reg         nreset;
   reg         nwrite_ir;
   reg [15:0]  ibus;
   wire [15:0] ibus_real;
   
   reg 	       nfpirl;
   reg 	       nfpirh;
   wire [7:0]  fpd;

   wire [15:0] ir;
   
   integer    i;
   
   // Initialize all variables
   initial begin
      $monitor ("%d | %b %b %h > %h | %b %b > %h", $time, nreset, nwrite_ir, ibus_real, ir, nfpirl, nfpirh, fpd);
      $dumpfile ("vcd/reg_ir_tb.vcd");
      $dumpvars (0, reg_ir_tb);

      ibus = 16'h0000;
      nreset = 0;
      nfpirl = 1;
      nfpirh = 1;
      nwrite_ir = 1;

      // Simulate reset
      #250 nreset = 1;

      for (i = 0; i < 65536; i = i + 1) begin
	 #250 ibus = i;
      end
      
      #1000 $finish;      // Terminate simulation
   end // initial begin

   // Load the IR every now and then
   always begin
      #1000 nwrite_ir = 0;
      #63.5 nwrite_ir = 1;
   end

   assign ibus_real = ibus;

   // Asynchronous Front Panel functionality
   always begin
      #1937 nfpirl = 0;		// 1937 is prime, and so is 1937+30+30
      #30 nfpirl = 1; 
      nfpirh = 0;
      #30 nfpirh = 1;
   end

   // Connect DUT to test bench
   reg_ir reg_ir (.nreset(nreset),
		  .ibus(ibus_real),
		  .nwrite_ir(nwrite_ir),
		  .ir(ir),
		  .nfpirl(nfpirl), .nfpirh(nfpirh), .fpd(fpd));

endmodule // reg_ir_tb

// End of file.
