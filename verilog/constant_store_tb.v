`include "constant_store.v"

`timescale 1ns/10ps

module constant_store_tb();

// Declare inputs as regs and outputs as wires
   reg         nrsthold;
   reg         nruen;
   reg [4:0]   raddr;
   wire [15:0] ibus;

   integer     i, j, k;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/constant_store_tb.vcd");
      $dumpvars (0, constant_store_tb);

      $display ("time\t nrsthold nruen raddr ibus");	
      $monitor ("%g\t %b   %b  %b %b", $time, nrsthold, nruen, raddr, ibus);

      nrsthold = 0;
      nruen = 1;
      raddr = 0;

      for (i = 0; i < 2; i = i + 1) begin
	 for (j = 0; j < 2; j = j + 1) begin
	    for (k = 0; k < 32; k = k + 1) begin
	       #200 begin
		  nrsthold = i;
		  nruen = j;
		  raddr = k;
	       end
	    end
	 end
      end // for (i = 0; i < 2; i = i + 1)
      #500 $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   constant_store constant_store (.nrsthold(nrsthold),
				  .nruen(nruen),
				  .raddr(raddr),
				  .ibus(ibus));

endmodule
