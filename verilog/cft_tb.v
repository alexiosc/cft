`include "cft.v"

`timescale 1ns/10ps

module cft_tb();

// Declare inputs as regs and outputs as wires
   wire [15:0] dbus;
   //reg [15:0]  dbus_write;
   wire [15:0] ibus;
   wire	       clock;
   wire        clock2;
   wire        clock3;
   wire        clock4;

   reg 	       reset;
   reg 	       irq;
   
   wire        mem;
   wire        io;
   wire        r;
   wire        w;
   wire        halt;

   wire [7:0]  iospace_region;

   wire [15:0] abus;

   //assign dbus = dbus_write;

   initial begin
`ifndef DISABLE_VCD
      $dumpfile ("vcd/cft_tb.vcd");
      $dumpvars (0, cft);
`endif

      reset = 0;
      irq = 1;
      //dbus_write = {15{1'bz}};

      #5002 reset = 1;

      //#100000 reset = 0;
      //#200 reset = 1;

      #100000000 begin
	 ->cft.memory.dump_core;
	 $finish;      // Terminate simulation
      end
   end // initial begin

   // Issue interrupts
   always begin
      #150000 irq = 0;
      #1000 irq = 1;
   end

   always @(cft.debug_io.halting) begin
      ->cft.memory.dump_core;
      #10000 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   cft cft(abus, dbus,
	   reset, irq,
	   clock, clock2, clock3, clock4,
	   mem, io, r, w,
	   halt, iospace_region);

endmodule // cft_tb

// End of file.
