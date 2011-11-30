///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x244 4-bit Dual 4-bit 3-state noninverting buffer/line driver.
//
///////////////////////////////////////////////////////////////////////////////

`ifndef buffer_v
`define buffer_v

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x244 4-bit Dual 4-bit 3-state inverting buffer/line driver.
//
///////////////////////////////////////////////////////////////////////////////

module buffer_240 (oe1, oe2, a1, a2, y1, y2);
   parameter delay = 7;
   
   input        oe1, oe2;	// /OE tri-state active-low enables
   input [3:0]  a1, a2;		// Inputs

   output [3:0] y1, y2;		// Tri-state outputs

   wire 	oe1, oe2;
   wire [3:0] 	a1, a2;
   wire [3:0] 	y1, y2;

   initial begin
      $display("BOM: 74x240");
   end

   assign #delay y1 = oe1 ? 4'bzzzz : ~a1;
   assign #delay y2 = oe2 ? 4'bzzzz : ~a2;
endmodule // End of Module buffer


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x244 4-bit Dual 4-bit 3-state inverting buffer/line driver.
//
///////////////////////////////////////////////////////////////////////////////

module buffer_244 (oe1, oe2, a1, a2, y1, y2);
   parameter delay = 7;
   
   input        oe1, oe2;	// /OE tri-state active-low enables
   input [3:0]  a1, a2;		// Inputs

   output [3:0] y1, y2;		// Tri-state outputs

   wire 	oe1, oe2;
   wire [3:0] 	a1, a2;
   wire [3:0] 	y1, y2;

   initial begin
      $display("BOM: 74x244");
   end

   assign #delay y1 = oe1 ? 4'bzzzz : a1;
   assign #delay y2 = oe2 ? 4'bzzzz : a2;
endmodule // End of Module buffer


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x245 8-bit 3-state noninverting bus transceiver. 
//
// Notes: DIR=1 -> A -> B
//        DIR=0 -> B <- A
//
///////////////////////////////////////////////////////////////////////////////

module buffer_245 (dir, en, a, b);
   parameter delay = 7;
   
   input        dir;
   input 	en;
   inout [7:0] 	a, b;

   wire 	dir;
   wire 	en;
   wire [7:0] 	a, b;

   initial begin
      $display("BOM: 74x245");
   end

   assign a = (~en && ~dir) ? b : 8'bzzzzzzzz;
   assign b = (~en && dir) ? a : 8'bzzzzzzzz;
endmodule // End of Module buffer

`endif //  `ifndef buffer_v

// End of file.
