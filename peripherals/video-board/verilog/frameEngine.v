`ifndef frameEngine_v
 `define frameEngine_v

 `include "counter.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// FRAME ENGINE
//
// Function: implements a VGA-like frame state machine, with video blanking and
// enable signals, and sync.
//
// Inputs:
//
//   nreset: active low reset signal
//   vduen: active high VDU enable signal
//   clk: the 50 MHz clock
//
// Outputs:
//
//   hs: horizontal sync (positive)
//   hvideo: horizontal video enable (active high)
//   len40: line enable, 40 columns. Strobes memory sequencing for a 40 column line.
//   len80: line enable, 80 columns. Strobes memory sequencing for an 80 column line.
//   vs: vertical sync (positive)
//   vvideo: vertical video enable (active high)
//   vcnt: the current scanline number (9 bits)
//   video: video enable (active high)
//   memenable: host memory enable (active high). Host can access display
//       memory when this signal is high.
//
//
//  TERMINOLOGY
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


module FrameEngine(nreset, vduen, clk,
		   hs, hvideo, hcnt, len40, len80,
		   vs, vvideo, vcnt,
		   video, memenable);

   parameter HBP =     2;	// Horizontal back porch
   parameter HRES =   80;	// Horizontal resolution
   parameter HFP =     6;	// Horizontal front porch
   parameter HSW =    11;	// Horizontal sync width
   parameter CCEN80 =  0;	// Cell clock enable, 80 columns
   parameter CCEN40 = 98;	// Cell clock enable, 40 columns
   
   parameter VBP =   12;	// Vertical back porch
   parameter VRES = 400;	// Vertical resolution
   parameter VFP =   35;	// Vertical front porch
   parameter VSW =    2;	// Vertical sync width
   
   input 	nreset;		// Active low reset signal
   input 	vduen;		// VDU enable signal
   input 	clk;		// 3.125 MHz clock
   
   output reg 	hs;		// Horizontal sync
   output reg 	hvideo;		// Horizontal video enable
   output [6:0] hcnt;		// Vertical count (scanline number)
   output reg   len40;		// Start scan line memory cycles, 40 cols
   output reg   len80;		// Start scan line memory cycles, 80 cols
   output reg 	vs;		// Vertical sync
   output reg 	vvideo;		// Vertical video enable
   output [8:0] vcnt;		// Vertical count (scanline number)
   output 	video;		// Combined video enable
   output 	memenable;	// Host memory access enable

   // Internal signals and regs.
   reg 		hmemenable;	// Memory enable while in horizontal video
   reg 		vmemenable;	// Memory enable while in horizontal video
   
   // Reset state (for simulation only)
   initial begin
      hs <= 0;
      hvideo <= 0;
      len40 <= 0;
      len80 <= 0;
      hmemenable <= 1;
      vmemenable <= 1;
      vvideo <= 0;
      vs <= 0;
   end

   // Clock divider from ½ pixel clock period to 8 pixel clock periods, which
   // is the basis of the frame engine since counts are multiples of 8 pixels.
   wire [3:0] clkdiv;
   wire       clk16;
   counter #4 clkDiv (clk, vduen & nreset, clkdiv);
   assign clk16 = clkdiv[3];
   
   // Horizontal counter and state machine
   wire [6:0] hcnt;
   wire       nfield;

   counter #7 hCounter (clk16, nreset & nfield, hcnt);

   always @(hcnt) begin
      if (hcnt == 97) begin
	 len40 <= 1;
	 hmemenable <= 1;
      end else if (hcnt == 0) begin
	 len80 <= 1;
      end
      
      if (hcnt == 0) begin
	 hs <= 0;
      end
      else if (hcnt == HBP) begin
	 hvideo <= 1;
      end
      else if (hcnt == (HBP + HRES)) begin
	 hvideo <= 0;
	 len40 <= 0;
	 len80 <= 0;
	 hmemenable <= 0;
      end
      else if (hcnt == (HBP + HRES + HFP)) begin
	 hs <= 1;
      end
   end // always @ (hcnt)

   // Signal the start of a new field (active low).
   assign nfield = ~(hcnt == (HBP + HRES + HFP + HSW));

   // Vertical counter and state machine
   wire       nframe;
   
   counter #9 vCounter (nfield, nreset & nframe, vcnt);
   always @(vcnt) begin
      if (vcnt == 0) vs <= 0;
      else if (vcnt == VBP - 1) vmemenable <= 1;
      else if (vcnt == VBP) vvideo <= 1;
      else if (vcnt == (VBP + VRES)) begin
	 vvideo <= 0;
	 vmemenable <= 0;
      end else if (vcnt == (VBP + VRES + VFP)) vs <= 1;
   end

   // Signal the start of a new frame (active low)
   assign nframe = ~(vcnt == (VBP + VRES + VFP + VSW));

   // Video enable
   assign video = hvideo & vvideo;

   // TODO: Fix this eqn.
   assign memenable = vmemenable & hmemenable;

endmodule // frameEngine


`endif //  `ifndef frameEngine_v

// End of file.
