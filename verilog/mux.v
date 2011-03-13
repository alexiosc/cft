///////////////////////////////////////////////////////////////////////////////
//
// Function: Multiplexers.
//
// Dataset: 
//
///////////////////////////////////////////////////////////////////////////////

`ifndef mux_v
`define mux_v

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x253 8-to-1 line data selector/multiplexer with complementary
// outputs and tri-state enable.
//
// Notes:
//
///////////////////////////////////////////////////////////////////////////////

module mux_253 (sel, i1, oe1, y1, i2, oe2, y2);
   parameter delay = 20;

   input [1:0] sel;		// The signal selector
   input [3:0] i1, i2;		// Input signals.
   input       oe1, oe2;	// Active low tri-state output enables.
   output      y1, y2;		// Outputs.

   wire [1:0]  sel;
   wire [3:0]  i1, i2;
   wire        oe1, oe2;
   wire        y1, y2;

   assign #delay y1 = oe1 ? 1'bz : i1[sel];
   assign #delay y2 = oe2 ? 1'bz : i2[sel];

endmodule // mux_253


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x257 8-to-4 line data selector/multiplexer.
//
// Notes:
//
///////////////////////////////////////////////////////////////////////////////

module mux_257 (sel, i1, i2, oe, y);
   parameter delay = 20;

   input        sel;		// The signal selector
   input [3:0]  i1, i2;		// Input signals.
   input        oe;	        // Active low tri-state output enables.
   output [3:0] y;		// Outputs.

   wire        sel;
   wire [3:0]  i1, i2;
   wire        oe;
   wire [3:0]  y;

   assign #delay y = oe ? 1'bz : (sel == 0? i1 : i2);

endmodule // mux_257

`endif //  `ifdef mux_v
