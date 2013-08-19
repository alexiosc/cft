`ifndef databus_v
`define databus_v

`include "buffer.v"
`include "flipflop.v"

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

// The data bus driver. Bus hold circuitry is present on the hardware
// implementation, but not modelled here.

module databus (nws, nreset, wshold, /*memguard, */clk2/* OK */, clk4/* OK */, nt34, ibus, nmem, nio, nr, nwen, db, nw);

   // TOOD: MEMGUARD may be obsolete.
   
   input 	nws, nreset, wshold/*, memguard*/;
   inout [15:0] ibus, db;
   input 	clk2/* OK */, clk4/* OK */, nt34, nmem, nio, nr, nwen;
   output 	nw;

   wire 	ws, nreset, wshold;
   
   wire [15:0] 	ibus, db;
   wire 	clk3/* OK */, nmem, nio, nr, nwen;

   wire 	nbusen, nw, en;

   // Generate the W# signal from the microcode's WEN#. Use the
   // leftover '74 FF to generate a short strobe pulse.
   wire 	nw0, nw1, nnw, wffreset;
   
   or #6 (nw0, nt34/* OK */, nwen);
   or #6 (nw1, nw0, waiting);
   not #7 (nnw, nw1);
   and #6 (wffreset, nreset, d3);
   flipflop_74h wff (1, nnw, 1, wffreset, , nw);

   // Delay clk4
   wire 	d1, d2, d3;
   and #6 (d1, clk4, clk4);
   not #7 (d2, d1);
   not #7 (d3, d2);

   //not #7 (nw2, nw);
   //not #7 (nw3, nw2);

   // Connect the IBUS and data bus (DB).
   wire 	en0, en1, waiting;
   and #6 (en0, nmem, nio);
   or #6 (en1, nt34, ~waiting);
   and #6 (en, en0, en1);

   // The Wait State itself
   // TODO: reinstate this, make it work properly.
   wire 	nws0;
   or #6 (nws0, nws, nt34);
   flipflop_74h wsff (0, clk2, nws0, nreset, waiting, );

   // Connect the buses.
   buffer_245 buf_lo (nr, en, ibus[7:0], db[7:0]);
   buffer_245 buf_hi (nr, en, ibus[15:8], db[15:8]);
   
endmodule // reg_ir

`endif //  `ifndef databus_v

// End of file
