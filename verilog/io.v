`ifndef io_v
`define io_v

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Simulate some I/O for debugging purposes.
//
///////////////////////////////////////////////////////////////////////////////

module debug_io (ab, db, nio, nr, nw, nhalt);

   input [15:0] ab;
   inout [15:0] db;

   input 	nio;		// IO#: cpu wants to talk to I/O.
   input 	nr;		// R#: latch data FROM memory.
   input 	nw;		// W#: latch data TO memory.

   output 	nhalt;		// Debugging only.

   wire [17:0] 	a;
   wire [15:0] 	db;
   wire 	nmem;
   wire 	nr;
   wire 	nw;

   reg 		nhalt;
   reg [15:0] 	db_write;

   assign a[17:16] = 2'b00;	// Force high order bits to zero.
   assign a[15:0] = ab[15:0];	// Connect the low order bits to the ab.

   assign db = (nio || nr) ? {16{1'bz}} : db_write;

   wire [7:0] 	x;

   wire [9:0] 	addr = ab & 'h3ff;

   initial begin
      nhalt = 1;
      db_write = 16'hbeef;
   end

   event assertion_failed;
   event halting;

   // Testing and debugging.
   always @(posedge nw) begin
      if (!nw || !nio) begin
	 if (addr == 'h00f) begin
	    $display("D: *** HALTING ***");
	    $display("D: TIME: %d ns", $time);
	    nhalt <= 1'b0;
	    -> halting;
	 end
	 else if (addr == 'h3f0) begin
	    $display("T: PRINTA: %h (?)", ab);
	 end
	 else if (addr == 'h3f1) begin
	    if (db > 32) $display("T: PRINTC: %s", db[7:0]);
	    else $display("T: PRINTc: %d", db);
	 end
	 else if (addr == 'h3f2) begin
	    $display("T: PRINTD: %d", db); // Does this decode sign properly?
	 end
	 else if (addr == 'h3f3) begin
	    $display("T: PRINTU: %d", db); // This may be wrong
	 end
	 else if (addr == 'h3f4) begin
	    $display("T: PRINTH: %h", db);
	 end
	 else if (addr == 'h3f5) begin
	    $display("T: PRINTB: %b", db);
	 end
	 else if (addr == 'h3f6) begin
	    $display("T: PRINTc: 32");
	 end
	 else if (addr == 'h3f7) begin
	    $display("T: PRINTc: 10");
	 end
	 else if (addr == 'h3fe) begin
	    $display("T: ASSERT: TRUE");
	 end
	 else if (addr == 'h3ff) begin
	    $display("T: ASSERT: FALSE");
	    -> assertion_failed;
	    -> halting;
	 end
	 else $display("io[%h] <- %h", addr, db);
      end
   end
endmodule // debug_io

`endif //  `ifndef io_v

// End of file.
