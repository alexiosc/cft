`ifndef databus_v
`define databus_v

`include "buffer.v"

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

// The data bus driver. Bus hold circuitry is present on the hardware
// implementation, but not modelled here.

module databus (clk5, ibus, nmem, nio, nr, nwen, db, nw);
   inout [15:0] ibus, db;
   input 	clk5, nmem, nio, nr, nwen;
   output 	nw;
   
   wire [15:0] 	ibus, db;
   wire 	clk5, nmem, nio, nr, nwen;

   wire 	nbusen, nw;

   // Generate the W# signal from the microcode's WEN#.
   or #6 (nw, clk5, nwen);

   // Connect the IBUS and data bus (DB).
   and #6 (nbusen, nmem, nio);
   buffer_245 buf_lo (nr, nbusen, ibus[7:0], db[7:0]);
   buffer_245 buf_hi (nr, nbusen, ibus[15:8], db[15:8]);
   
endmodule // reg_ir

`endif //  `ifndef databus_v

// End of file
