`ifndef vduMemoryAccess_v
 `define vduMemoryAccess_v

`include "counter.v"
`include "gatedCounter.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// VDU MEMORY ACCESS ENGINE
//
// Function: sequences and performs memory accesses used to refresh the
// image. Also prepares the ground for host-side memory access timing.
//
// Inputs:
//
//   nreset: active low reset signal
//
// Outputs:
//
//   hs: horizontal sync (positive)
//
//
//  WAVEFORMS
//
//  Horizontal/vertical waveform (not to scale):
//
//        Back     :         Video        :  Front  :   Sync     :  Back
//          Porch  :         (H/VRES)     :  Porch  :     width  :    Porch
//        <--                             :         :____________:      -->
//  Sync  __________________________________________/            \___________
//                  ______________________
//  Video _________/                      \__________________________________
//  _____ _____                                                   _
//  FRAME/FIELD _________________________________________________/ \_________
//
//  HCNT/VCNT ....................................................0..........
//
///////////////////////////////////////////////////////////////////////////////


module VDUMemoryAccess(nreset, vduen, enable, memenable,
		       phiclk, col40,
		       paddr, cgaddr, har,
		       pa, pd, ncs0, ncs1, ncs2, noe, nwe,
		       phi, ncellload, b, c, pixels
		       );

   // Inputs
   input 	     nreset;	// Active low reset signal
   input 	     vduen;	// Active high global VDU enable signal
   input 	     enable;	// Active high memory access enable
   input 	     memenable;	// *** Enable signal from frame engine (under review)
   input 	     phiclk;	// Base clock for memory sequencing
   input 	     col40;	// 40 column mode if high
   
   input [16:0]      paddr;	// 128k plane address
   input [16:0]      cgaddr;	// 128k character generator RAM address
   input [15:0]      har;	// Host Address Register
   
   // Memory interface
   output [16:0]     pa;	// Memory bus addresses
   inout [23:0]      pd;	// Memory bus data
   output 	     ncs0;	// Chip select 0 (C plane LSB)
   output 	     ncs1;	// Chip select 1 (C plane MSB)
   output 	     ncs2;	// Chip select 2 (B plane & CG)
   output 	     noe, nwe;	// SRAM read/write strobes

   // Outputs to the VDU module
   output reg [4:0]  phi;	// Output sequencing phase
   output 	     ncellload;	// Sync signal for shift register (data available)
   output reg [7:0]  b;		// B plane data
   output reg [15:0] c;		// C plane data
   output reg [7:0]  pixels;	// Pixel data (bitmap)

   // Implement a mod-8 or mod-16 counter (depending on setting of COL40). Phi
   // is the clock phase used for sequencing everything else here.
   initial phi <= 0;
   always @(posedge phiclk, negedge enable) begin
      if (enable == 1'b0) phi <= 0;
      else if (vduen == 1'b1) begin
	 phi <= (phi + 1) & (col40 ? 5'b11111 : 5'b01111);
      end
   end
   //   gatedCounter #4 phaseCounter (phiclk, vduen, enable, phi);


   // video RAM cycles
   wire 	 memplane, memchargen, memhost;

   assign memplane = (memenable == 1'b1) && (phi == 0 || phi == 1 || phi == 2);
   assign memchargen = (memenable == 1'b1) && (phi == 4 || phi == 5 || phi == 6);
   assign pa = memplane ? paddr :
	       memchargen ? cgaddr :
	       {1'b1, har};
   assign noe = ~(phi == 0 || phi == 1 || phi == 4 || phi == 5);
   assign ncs0 = ~memplane;
   assign ncs1 = ~memplane;
   assign ncs2 = ~(memplane | memchargen);

   // The C0 register allows delaying C data until the start of the new
   // character cell.
   reg [15:0]  c0;

   // Initialise (for simulation only)
   initial begin
      b <= 8'hff;
      c <= 16'hffff;
      c0 <= 16'hffff;
      pixels <= 8'hff;
   end

   // Perform memory reads
   always @(posedge noe) begin
      if (memplane) begin
	 b <= pd[23:16];
	 c0 <= pd[15:0];
      end else if (memchargen) begin
	 pixels <= pd[23:16];
      end
   end

   // Tell the shift register we have data for it to load
   //assign ncellload = ~(cellclken == 1 && phi == 0);
   assign ncellload = ~(phi == 0);

   // Simultaneously, move the loaded value of the C plane (C0 register) to the
   // C register for output, so that B and C planes are synchronised
   // (otherwise, the colours and attributes change in the middle of the
   // previous character cell.
   always @(negedge ncellload) c <= c0;

   
   
endmodule // vduMemoryAccess


`endif //  `ifndef vduMemoryAccess_v

// End of file.
