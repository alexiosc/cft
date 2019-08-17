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
// Function: 74x253 dual 4-to-1 line data selector/multiplexer with
// tri-state enable.
//
// Notes:
//
///////////////////////////////////////////////////////////////////////////////

module mux_253 (sel, i1, oe1, y1, i2, oe2, y2);
   parameter delay = 16;

   input [1:0] sel;		// The signal selector
   input [3:0] i1, i2;		// Input signals.
   input       oe1, oe2;	// Active low tri-state output enables.
   output      y1, y2;		// Outputs.

   wire [1:0]  sel;
   wire [3:0]  i1, i2;
   wire        oe1, oe2;
   wire        y1, y2;

   initial begin
      // $display("BOM: 74x253");
   end
   
   assign #delay y1 = oe1 ? 1'bz : i1[sel];
   assign #delay y2 = oe2 ? 1'bz : i2[sel];

endmodule // mux_253


module mux_253h (sel, i, oe, y);
   parameter delay = 16;

   input [1:0] sel;	// The signal selector
   input [3:0] i;	// Input signals.
   input       oe;	// Active low tri-state output enables.
   output      y;	// Outputs.

   wire [1:0]  sel;
   wire [3:0]  i;
   wire        oe;
   wire        y;

   initial begin
      // $display("BOM: 1/2 74x253");
   end
   
   assign #delay y = oe ? 1'bz : i[sel];

endmodule // mux_253h


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

   initial begin
      // $display("BOM: 74x257");
   end
   
   assign #delay y = oe ? 1'bz : (sel == 0? i1 : i2);

endmodule // mux_257

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x157 8-to-4 line data selector/multiplexer.
//
// Notes:
//
///////////////////////////////////////////////////////////////////////////////

module mux_157 (sel, i1, i2, oe, y);
   parameter delay = 20;

   input        sel;		// The signal selector
   input [3:0]  i1, i2;		// Input signals.
   input        oe;	        // Active low tri-state output enables.
   output [3:0] y;		// Outputs.

   wire        sel;
   wire [3:0]  i1, i2;
   wire        oe;
   wire [3:0]  y;

   initial begin
      // $display("BOM: 74x157");
   end
   
   assign #delay y = oe ? 4'bzzzz : (sel == 0? i1 : i2);

endmodule // mux_157

// The 74LVC2G157 is a 2:1 version of the '157. It has a complementary
// output too though.
module mux_1g_157 (sel, a, b, ng, y, ny);
   parameter delay = 20;

   input        sel;		// The signal selector
   input 	a, b;		// Inputs
   input        ng;	        // Active low tri-state output enables.
   output 	y;		// Output
   output 	ny;		// Output

   wire 	sel;
   wire 	a, b;
   wire 	ng;
   wire 	y;
   wire 	ny;
   
   initial begin
      // $display("BOM: 74x157");
   end
   
   assign #delay y = ng ? 1'bz : (sel == 0? a : b);
   assign #delay ny = ng ? 1'bz : (sel == 0? ~a : ~b);

endmodule // mux_157

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x1G157 2-to-1 line data selector/multiplexer.
//
// Notes:
//
///////////////////////////////////////////////////////////////////////////////

module mux_1g157 (sel, i1, i2, oe, y);
   parameter delay = 20;

   input        sel;		// The signal selector
   input        i1, i2;		// Input signals.
   input        oe;	        // Active low tri-state output enables.
   output       y;		// Outputs.

   wire        sel;
   wire        i1, i2;
   wire        oe;
   wire        y;

   initial begin
      // $display("BOM: 74x1G157");
   end
   
   assign #delay y = oe ? 1'bz : (sel == 0? i1 : i2);

endmodule // mux_1G157

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x151 8-to-1 line data selector/multiplexer with
// complementary outputs. Not tri-state.
//
// Notes:
//
///////////////////////////////////////////////////////////////////////////////

module mux_151 (sel, d, e, y, w);
   parameter delay = 20;

   input [2:0] sel;		// The signal selector
   input [7:0] d;		// 8 input lines
   input       e;	        // Active low tri-state output enables.
   output      y, w;

   wire [2:0]  sel;
   wire [7:0]  d;
   wire        e, y, w;

   initial begin
      // $display("BOM: 74x251");
   end
   
   assign #delay y = e ? 1'b0 : d[sel];
   assign #delay w = e ? 1'b1 : ~d[sel];

endmodule // mux_151


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x251 8-to-1 line data selector/multiplexer with
// complementary outputs and tri-state enable.
//
// Notes:
//
///////////////////////////////////////////////////////////////////////////////

module mux_251 (sel, d, e, y, w);
   parameter delay = 20;

   input [2:0] sel;		// The signal selector
   input [7:0] d;		// 8 input lines
   input       e;	        // Active low tri-state output enables.
   output      y, w;

   wire [2:0]  sel;
   wire [7:0]  d;
   wire        e, y, w;

   initial begin
      // $display("BOM: 74x251");
   end
   
   assign #delay y = e ? 1'bz : d[sel];
   assign #delay w = e ? 1'bz : ~d[sel];

endmodule // mux_251


`endif //  `ifdef mux_v
