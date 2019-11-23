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


module frameEngine(nreset, vduen, clk,
		   hs, hvideo, hcnt,
		   //len40, len80,
		   vs, vvideo, vcnt,
		   video, memenable);

   parameter HBP =     7'd2;	// Horizontal back porch
   parameter HRES =   7'd80;	// Horizontal resolution
   parameter HFP =     7'd6;	// Horizontal front porch
   parameter HSW =    7'd11;	// Horizontal sync width
   parameter CCEN80 =  7'd0;	// Cell clock enable, 80 columns
   parameter CCEN40 = 7'd98;	// Cell clock enable, 40 columns
   
   parameter VBP =    9'd12;	// Vertical back porch
   parameter VRES =  9'd400;	// Vertical resolution
   parameter VFP =    9'd35;	// Vertical front porch
   parameter VSW =     8'd2;	// Vertical sync width
   
   input 	nreset;		// Active low reset signal
   input 	vduen;		// VDU enable signal
   input 	clk;		// 3.125 MHz clock
   
   output 	hs;		// Horizontal sync
   output 	hvideo;		// Horizontal video enable
   output [6:0] hcnt;		// Vertical count (scanline number)
   //output 	len40;		// Start scan line memory cycles, 40 cols
   //output 	len80;		// Start scan line memory cycles, 80 cols
   output  	vs;		// Vertical sync
   output  	vvideo;		// Vertical video enable
   output [8:0] vcnt;		// Vertical count (scanline number)
   output 	video;		// Combined video enable
   output 	memenable;	// Host memory access enable

   // Internal signals and regs.
   wire 		hmemenable;	// Memory enable while in horizontal video
   wire 		vmemenable;	// Memory enable while in horizontal video
   
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

   wire hcnt97, hcnt00, hcntHBP_HRES;
   assign hcnt00 = hcnt == 7'd00;
   assign hcnt97 = hcnt == 7'd97;
   assign hcntHBP_HRES = hcnt == (HBP + HRES);
   
   //ff_sr ff_len40(hcnt97, hcntHBP_HRES, len40);
   //ff_sr ff_len80(hcnt00, hcntHBP_HRES, len80);
   ff_sr ff_hmemenable(hcnt97, hcntHBP_HRES, hmemenable);
   ff_sr ff_hvideo(hcnt == HBP, hcntHBP_HRES, hvideo);
   ff_sr ff_hs(hcnt == (HBP + HRES + HFP), hcnt00, hs);

   // Signal the start of a new field (active low).
   assign nfield = ~(hcnt == (HBP + HRES + HFP + HSW));

   // Vertical counter and state machine
   wire       nframe;
   
   counter #9 vCounter (nfield, nreset & nframe, vcnt);

   wire       vcnt_VBP_VRES;
   assign vcnt_VBP_VRES = vcnt == (VBP + VRES);
      
   ff_sr ff_vmemenable(vcnt == (VBP - 9'd1), vcnt_VBP_VRES, vmemenable);
   ff_sr ff_vvideo(vcnt == VBP, vcnt == (VBP + VRES), vvideo);
   ff_sr ff_vs(vcnt == (VBP + VRES + VFP), vcnt == 9'd0, vs);


   // Signal the start of a new frame (active low)
   assign nframe = ~(vcnt == (VBP + VRES + VFP + VSW));

   // Video enable
   assign video = hvideo & vvideo;

   // TODO: Fix this eqn.
   assign memenable = vmemenable & hmemenable;

endmodule // frameEngine


`endif //  `ifndef frameEngine_v

// End of file.
