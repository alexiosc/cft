`timescale 1ns/10ps
`include "control_unit.v"

module control_unit_tb();

// Declare inputs as regs and outputs as wires
   wire [15:0] dbus;
   //reg [15:0]  dbus_write;
   wire [15:0] ibus;
   wire	       clock;
   wire        clock2;
   wire        clock3;
   wire        clock4;
   reg 	       reset;
   
   wire        mem;
   wire        io;
   wire        r;
   wire        w;
   wire        halt;

   wire [15:0] abus;

   //assign dbus = dbus_write;

   initial begin
      $dumpfile ("vcd/control_unit_tb.vcd");
      $dumpvars (0, control_unit);

      reset = 0;
      //dbus_write = {15{1'bz}};

      #5002 reset = 1;

      //#100000 reset = 0;
      //#200 reset = 1;

      #10000000 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   control_unit control_unit (abus, dbus, ibus, reset, clock, clock2, clock3, clock4,
			      mem, io, r, w, halt);
endmodule

// End of file.
