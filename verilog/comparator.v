`ifndef comparator_v
`define comparator_v


`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x688 8-bit comparator
//
// Notes:
// 
// 8-bit inverting identity comparator with enable.
// 
//     +---+--+---+
//  /G |1  +--+ 20| VCC
//  A0 |2       19| /A=B
//  B0 |3       18| B7
//  A1 |4       17| A7
//  B1 |5   74  16| B6
//  A2 |6  688  15| A6
//  B2 |7       14| B5
//  A3 |8       13| A5
//  B3 |9       12| B4
// GND |10      11| A4
//     +----------+
//
///////////////////////////////////////////////////////////////////////////////

module comparator_688 (a, b,  ng, neq);
   input [7:0] a, b;	// Inputs
   input       ng;	// Enable (active low) or previous stage input
   output      neq;	// A = B (active low)

   initial begin
      // $display("BOM: 74x688");
   end

   assign #20 neq = (ng == 1'b0) ? ~(a == b) : 1'b1;
endmodule // comparator_688

///////////////////////////////////////////////////////////////////////////////
//
// Function: 4-bit noninverting magnitude comparator with cascade inputs.
//        +---+--+---+
//     B3 |1  +--+ 16| VCC
//   IA<B |2       15| A3
//   IA=B |3       14| B2
//   IA>B |4       13| A2
//   OA>B |5  7485 12| A1
//   OA=B |6       11| B1
//   OA<B |7       10| A0
//    GND |8        9| B0
//        +----------+
//
///////////////////////////////////////////////////////////////////////////////

module comparator_85 (a, b, ilt, ieq, igt, olt, oeq, ogt);
   parameter delay = 20;
   
   input [3:0] a, b;
   input       ilt, ieq, igt;

   output      olt, oeq, ogt;

   reg 	       olt, oeq, ogt;

   wire [4:0]  csl, csg;

   initial begin
      // $display("BOM: 74x85");
   end

   // Follow the definitions on the datasheet. This will never be
   // synthesised and we only use a single one on the CFT, so
   // whatever, do it the stupid way.

   always @(a, b, ilt, igt, ieq) begin
      if (a[3] > b[3]) { ogt, olt, oeq } <= 3'b100;
      else if (a[3] < b[3]) { ogt, olt, oeq } <= 3'b010;
      else if (a[3] === b[3]) begin
	 
	 if (a[2] > b[2]) { ogt, olt, oeq } <= 3'b100;
	 else if (a[2] < b[2]) { ogt, olt, oeq } <= 3'b010;
	 else if (a[2] === b[2]) begin
	    
	    if (a[1] > b[1]) { ogt, olt, oeq } <= 3'b100;
	    else if (a[1] < b[1]) { ogt, olt, oeq } <= 3'b010;
	    else if (a[1] === b[1]) begin
	       
	       if (a[0] > b[0]) { ogt, olt, oeq } <= 3'b100;
	       else if (a[0] < b[0]) { ogt, olt, oeq } <= 3'b010;
	       else if (a[0] === b[0]) begin
		  case ({ igt, ilt, ieq })
		    // These two cases are invalid, but are included nonetheless
		    3'b000: { ogt, olt, oeq } = 3'b110;
		    3'b110: { ogt, olt, oeq } = 3'b000;
		    
		    3'b001: { ogt, olt, oeq } = 3'b001;
		    3'b010: { ogt, olt, oeq } = 3'b010;
		    3'b100: { ogt, olt, oeq } = 3'b100;
		    
		    3'b011: { ogt, olt, oeq } = 3'b001;
		    3'b101: { ogt, olt, oeq } = 3'b001;
		    3'b111: { ogt, olt, oeq } = 3'b001;
		  endcase // case ({ igt, ilt, ieq })
	       end // if (a[0] === b[0])
	    end // if (a[1] === b[1])
	 end // if (a[2] === b[2])
      end // if (a[3] === b[3])
   end // always @ (a, b, ilt, igt, ieq)

  // assign csl = ~a + b + ilt;
  // assign olt = ~csl[4];
  // assign csg = a + ~b + igt;
  // assign ogt = ~csg[4];
  // assign oeq = ((a == b) && ieq);

endmodule // comparator_85


`endif //  `ifndef comparator_v

// End of file.

