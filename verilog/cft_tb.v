`include "cft.v"

`timescale 1ns/10ps

module cft_tb();

// Declare inputs as regs and outputs as wires
   wire [15:0] dbus;
   //reg [15:0]  dbus_write;
   wire [15:0] ibus;

   reg 	       nreset;
   reg [7:0]   nirq_in;
   
   initial begin
`ifndef DISABLE_VCD
      $dumpfile ("vcd/cft_tb.vcd");
      $dumpvars (0, cft_tb);
`endif

      nreset = 0;
      nirq_in = 8'b1111_1111;

      #5000 nreset = 1;

      #1000000 begin
	 ->cft.mem.dump_core;
	 $finish;      // Terminate simulation
      end
   end // initial begin

   // Issue interrupts
   /*
   always begin
      #150000 nirq_in = 0;
      #1000 nirq_in = 255;
   end
    */

   always @(cft.debug_io.halting) begin
      ->cft.mem.dump_core;
      #10000 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench

   inout nreset_real;
   assign nreset_real = nreset;
   cft cft(1, 0, 1, 0, 1, 1, 1,	// No front panel
	   nreset_real,
	   , , , , , , ,
	   nirq_in,
	   , , , , , , );

endmodule // cft_tb

// End of file.
