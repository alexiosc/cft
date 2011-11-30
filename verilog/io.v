`ifndef io_v
`define io_v

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Simulate some I/O for debugging purposes.
//
///////////////////////////////////////////////////////////////////////////////

module debug_io (abus, dbus, io, r, w, halt);

   input [15:0] abus;
   inout [15:0] dbus;

   input 	io;		// /IO: cpu wants to talk to I/O.
   input 	r;		// /R: latch data FROM memory.
   input 	w;		// /W: latch data TO memory.

   output 	halt;		// Debugging only.

   wire [17:0] 	a;
   wire [15:0] 	dbus;
   wire 	mem;
   wire 	r;
   wire 	w;

   reg 		halt;
   reg [15:0] 	dbus_write;

   assign a[17:16] = 2'b00;	// Force high order bits to zero.
   assign a[15:0] = abus[15:0];	// Connect the low order bits to the abus.

   assign dbus = (io || r) ? {16{1'bz}} : dbus_write;

   wire [7:0] 	x;

   wire [9:0] 	addr = abus & 'h3ff;

   initial begin
      halt = 1;
      dbus_write = 16'hbeef;
   end

   event assertion_failed;
   event halting;

   // Testing and debugging.
   always @(posedge w) begin
      if (!w || !io) begin
	 if (addr == 'h007) begin
	    $display("D: *** HALTING ***");
	    $display("D: TIME: %d ns", $time);
	    halt <= 1'b0;
	    -> halting;
	 end
	 else if (addr == 'h3f1) begin
	    //$display("*** PRINT CHAR: '%s'", dbus[7:0]);
	    if (dbus > 32) $display("D: PRINTC: %s", dbus[7:0]);
	    else $display("D: PRINTU: %d", dbus);
	 end
	 else if (addr == 'h3f2) begin
	    $display("D: PRINTD: %d", dbus);
	    //$display("*** PRINT INT: %d (%x, %b)", dbus, dbus, dbus);
	 end
	 else if (addr == 'h3f3) begin
	    $display("D: PRINTH: %h", dbus);
	 end
	 else if (addr == 'h3f4) begin
	    $display("D: PRINTB: %b", dbus);
	 end
	 else if (addr == 'h3f5) begin
	    $display("D: PRINTU: 32");
	 end
	 else if (addr == 'h3f6) begin
	    $display("D: PRINTU: 10");
	 end
	 else if (addr == 'h3fe) begin
	    $display("D: ASSERT: TRUE");
	 end
	 else if (addr == 'h3ff) begin
	    $display("D: ASSERT: FALSE");
	    -> assertion_failed;
	    -> halting;
	 end
	 else $display("io[%h] <- %h", addr, dbus);
      end
   end
endmodule // debug_io

`endif //  `ifndef io_v

// End of file.
