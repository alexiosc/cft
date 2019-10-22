///////////////////////////////////////////////////////////////////////////////
//
// Function: Demultiplexers.
//
// Dataset: 
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

`ifndef demux_v
`define demux_v

module demux_138 (g1, ng2a, ng2b, a, y);
   parameter delay = 14;
   parameter delay_g1 = 14;
   parameter delay_g2 = 22;

   input        g1;		// Active high enable
   input        ng2a;		// Active low enable 1
   input        ng2b;		// Active low enable 2
   input [2:0] 	a;		// Input vector (3 bits)
   
   output [7:0] y;		// Output.
   
   wire 	g1, ng2a, ng2b;
   wire 	g10, ng2a0, ng2b0;
   wire [2:0] 	a;
   
   reg [7:0] 	y0;
   wire [7:0] 	y;
   
   wire 	q;

   initial begin
      // $display("BOM: 74x138");
   end

   // The enable inputs have slightly different propagation
   // delays. This could cause glitches. Simulate this.
   assign #delay_g1 g10 = g1;
   assign #delay_g2 ng2a0 = ng2a;
   assign #delay_g2 ng2b0 = ng2b;
   
   // The 138 DOES NOT tri-state output. Instead, when disabled, all
   // its active-low outputs are high.

   // 2019-09-06: the simulated propagation delay caused glitches
   // during transitions of A while gG1, NG2A and NG2B remained
   // constant. The hardware '138 doesn't produce these, so this is a
   // bug in this code. Removing delays for now.
   assign y = (g1 && !ng2a && !ng2b) ? y0 : 8'b11111111;
   
   always @ (a) begin
      case (a)
	0: y0 = 8'b11111110;
	1: y0 = 8'b11111101;
	2: y0 = 8'b11111011;
	3: y0 = 8'b11110111;
	4: y0 = 8'b11101111;
	5: y0 = 8'b11011111;
	6: y0 = 8'b10111111;
	7: y0 = 8'b01111111;
	default: y0 = 8'b11111111; // Could happen when a=X.
      endcase // case (a)
   end // always @ (a)

endmodule // demux_138


module demux_139 (ng1, a1, y1, ng2, a2, y2);
   parameter delay = 16;

   input        ng1, ng2;	// Active low enables
   input [1:0] 	a1, a2;		// Input vector (3 bits)
   
   output [3:0] y1, y2;		// Output.
   
   wire 	ng1, ng2;
   wire [1:0] 	a1, a2;
   
   reg [3:0] 	y01, y02;
   wire [3:0] 	y1, y2;
   
   wire 	q;

   demux_139h h1 (.ng(ng1), .a(a1), .y(y1));
   demux_139h h2 (.ng(ng2), .a(a2), .y(y2));
   
endmodule // demux_138




module demux_139h (ng, a, y);
   parameter delay = 16;

   input        ng;		// Active high enable
   input [1:0] 	a;		// Input vector (3 bits)
   
   output [3:0] y;		// Output.
   
   wire 	ng;
   wire [1:0] 	a;
   
   reg [3:0] 	y0;
   wire [3:0] 	y;
   
   wire 	q;

   initial begin
     y0 = 4'b1111;
   end

   // The 139 DOES NOT tri-state output. Instead, when disabled, all
   // its active-low outputs are high.
   assign #delay y = ng ? 4'b1111 : y0;
   
   always @ (a) begin
      case (a)
	0: y0 = 4'b1110;
	1: y0 = 4'b1101;
	2: y0 = 4'b1011;
	3: y0 = 4'b0111;
	default: y0 = 4'b1111; // Could happen when a=X.
      endcase // case (a)
   end // always @ (a)

endmodule // demux_139h

// Just like a '138, but with active-high outputs
module demux_238 (g1, ng2a, ng2b, a, y);
   parameter delay = 18;
   parameter delay_g1 = 21;
   parameter delay_g2 = 20;

   input        g1;		// Active high enable
   input        ng2a;		// Active low enable 1
   input        ng2b;		// Active low enable 2
   input [2:0] 	a;		// Input vector (3 bits)
   
   output [7:0] y;		// Output.
   
   wire 	g1, ng2a, ng2b;
   wire 	g10, ng2a0, ng2b0;
   wire [2:0] 	a;
   
   reg [7:0] 	y0;
   wire [7:0] 	y;
   
   wire 	q;

   initial begin
      // $display("BOM: 74x238");
   end

   // The enable inputs have slightly different propagation
   // delays. This could cause glitches. Simulate this.
   assign #delay_g1 g10 = g1;
   assign #delay_g2 ng2a0 = ng2a;
   assign #delay_g2 ng2b0 = ng2b;
   
   // The 138 DOES NOT tri-state output. Instead, when disabled, all
   // its active-low outputs are high.

   // 2019-09-06: the simulated propagation delay caused glitches
   // during transitions of A while G1, nG2A and nG2B remained
   // constant. The hardware '138 doesn't produce these, so this is a
   // bug in this code. Removing delays for now.
   assign y = (g1 && !ng2a && !ng2b) ? y0 : 8'b00000000;
   
   always @ (a) begin
      case (a)
	0: y0 = 8'b00000001;
	1: y0 = 8'b00000010;
	2: y0 = 8'b00000100;
	3: y0 = 8'b00001000;
	4: y0 = 8'b00010000;
	5: y0 = 8'b00100000;
	6: y0 = 8'b01000000;
	7: y0 = 8'b10000000;
	default: y0 = 8'b00000000; // Could happen when a=X.
      endcase // case (a)
   end // always @ (a)

endmodule // demux_138


`endif //  `ifndef demux_v

// End of file.
