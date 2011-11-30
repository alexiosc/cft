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

module demux_138 (g1, g2a, g2b, a, y);
   parameter delay = 12;
   parameter delay_g1 = 10.5;
   parameter delay_g2 = 11;

   input        g1;		// Active high enable
   input        g2a;		// Active low enable 1
   input        g2b;		// Active low enable 2
   input [2:0] 	a;		// Input vector (3 bits)
   
   output [7:0] y;		// Output.
   
   wire 	g1, g2a, g2b;
   wire 	g10, g2a0, g2b0;
   wire [2:0] 	a;
   
   reg [7:0] 	y0;
   wire [7:0] 	y;
   
   wire 	q;

   initial begin
      $display("BOM: 74x138");
   end

   // The enable inputs have slightly different propagation
   // delays. This could cause glitches. Simulate this.
   assign #delay_g1 g10 = g1;
   assign #delay_g2 g2a0 = g2a;
   assign #delay_g2 g2b0 = g2b;
   
   // The 138 DOES NOT tri-state output. Instead, when disabled, all
   // its active-low outputs are high.
   assign #delay y = (g10 && !g2a0 && !g2b0) ? y0 : 8'b11111111;
   
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


module demux_139 (g1, a1, y1, g2, a2, y2);
   parameter delay = 16;

   input        g1, g2;		// Active high enable
   input [1:0] 	a1, a2;		// Input vector (3 bits)
   
   output [3:0] y1, y2;		// Output.
   
   wire 	g1, g2;
   wire [1:0] 	a1, a2;
   
   reg [3:0] 	y01, y02;
   wire [3:0] 	y1, y2;
   
   wire 	q;

   initial begin
      $display("BOM: 74x139");
   end

   // The 139 DOES NOT tri-state output. Instead, when disabled, all
   // its active-low outputs are high.
   assign #delay y1 = g1 ? 4'b1111 : y01;
   assign #delay y2 = g2 ? 4'b1111 : y02;
   
   always @ (a1) begin
      case (a1)
	0: y01 = 4'b1110;
	1: y01 = 4'b1101;
	2: y01 = 4'b1011;
	3: y01 = 4'b0111;
	default: y01 = 4'b1111; // Could happen when a=X.
      endcase // case (a)
   end // always @ (a)

   always @ (a2) begin
      case (a2)
	0: y02 = 4'b1110;
	1: y02 = 4'b1101;
	2: y02 = 4'b1011;
	3: y02 = 4'b0111;
	default: y02 = 4'b1111; // Could happen when a=X.
      endcase // case (a)
   end // always @ (a)

endmodule // demux_138

`endif //  `ifndef demux_v

// End of file.
