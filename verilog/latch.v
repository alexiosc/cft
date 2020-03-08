`ifndef latch_v
`define latch_v


`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// 74HC573 8-bit 3-state latch
//
///////////////////////////////////////////////////////////////////////////////

module latch_573 (d, le, noe, q);
   parameter delay = 14;
   
   input [7:0]  d;
   input        le, noe;

   output [7:0] q;

   reg [7:0] 	q0;

   initial begin
      q0 <= $random;
   end

   always @(le, d) begin
     if (le) #(delay-2) q0 = d;
   end

   assign #delay q = noe ? 8'bzzzzzzzz : q0;
endmodule // latch_573


///////////////////////////////////////////////////////////////////////////////
//
// 74HC373 8-bit 3-state latch
//
///////////////////////////////////////////////////////////////////////////////

module latch_373 (d, le, noe, q);
   parameter delay = 14;
   
   input [7:0]  d;
   input        le, noe;

   output [7:0] q;

   reg [7:0] 	q0;

   initial begin
      q0 <= $random;
   end

   always @(le, d) begin
     if (le) #(delay-2) q0 = d;
   end

   assign #delay q = noe ? 8'bzzzzzzzz : q0;
endmodule // latch_373


///////////////////////////////////////////////////////////////////////////////
//
// 74LVC1G373 single-but 3-state latch
//
///////////////////////////////////////////////////////////////////////////////

module latch_1g373 (d, noe, le, q);
   parameter delay = 6;		// Max propagation delay for 5V is 5.3ns.
   
   input        d;
   input        noe, le;

   output       q;

   wire       	d;
   wire 	noe, le;

   wire       	q;
   reg       	q0;

   always @(le or d) begin
     if (le) begin
       #(delay-2) q0 = d;
     end
   end

   assign #delay q = noe ? 1'bz : q0;
endmodule // latch_373


`endif //  `ifndef latch_v


// End of file.
