///////////////////////////////////////////////////////////////////////////////
//
// PB3-binary.v -- Processor Board C, Binary ROMS
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WPCRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PPCTICULPC PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
//
///////////////////////////////////////////////////////////////////////////////

`include "counter.v"
`include "buffer.v"
`include "vibrator.v"
`include "demux.v"
`include "flipflop.v"
`include "mux.v"
`include "rom.v"

`timescale 1ns/1ps


`ifndef BASEDIR
 `define BASEDIR ".."
`endif // BASEDIR


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board C, BINARY ROMS
//
///////////////////////////////////////////////////////////////////////////////

module PB3_binary(nreset, clk3, nboe, fl, ac, b, runit,
				y, fv, nfltadd);

   input 	 nreset;
   input 	 clk3;
   input 	 nboe;
   input 	 fl;
   input [15:0]  ac;
   input [15:0]  b;
   input [3:0] 	 runit;

   output [15:0] y;
   output 	 fv;
   output 	 nfltadd;


   // Note: actual chips also have a WE# signal because they're Flash
   // devices. We simulate them as ROMs, and the ALU ties their WE# lines to
   // Vcc.

   // Hardware parts are 512 KB devices (19 address lines). The ROM images are
   // 32 KB long each, so we use 15-bit devices.

   // Binary ALU, bits 0-5.
   wire 	 nc0;
   
   tri0 	 co1;
   rom #(15, 50)
   ic106_29040_rom0(.a({/*4'b0000, */runit[1:0], 1'b0/* Note 1 */, ac[5:0], b[5:0]}),
		    .d({nc0, co1, y[5:0]}),
		    .nce(0), .noe(0));
   // Note 1: this used to input FL, which had the effect of turning
   // all ADD operations to Add-with-Carry-In operations (which the
   // CFT can only have via a two-instruction macro, anyway. ADD is
   // more useful than ADC, so the FL input was removed.
   
   // Binary ALU, bits 6-11. Same ROM image as the previous ROM.
   wire 	 nc1;
   tri0 	 co2;
   rom #(15, 50)
   ic107_29040_rom1(.a({/*4'b0000, */runit[1:0], co1, ac[11:6], b[11:6]}),
		    .d({nc1, co2, y[11:6]}),
		    .nce(0), .noe(0));
   
   
   // Binary ALU, bits 12-15. Calculates last 4 bits only (plus strobe
   // enables).
   wire 	 nc2;
   wire 	 flatch;
   wire 	 nalucpl;
   wire 	 fvout;

   // Like the 6-bit ROMs, hardware parts here are 512 KB devices (19
   // address lines) due to economies of scale. The ROM image is 2 KB
   // long, so we simulate using an 11 bit device. On the ALU board,
   // address lines A11 to A18 are all tied to ground so only the
   // first 2 KB are ever accessed.
   rom #(11, 50)
   ic108_29040_rom2(.a({/*8'b0000_0000,*/ runit[1:0], co2, ac[15:12], b[15:12]}),
		    .d({fvout, nalucpl, flatch, nc2, y[15:12]}),
		    .nce(0), .noe(0));


   // Flag Strobe generation
   wire 	 flagclk;
   mux_253h ic109_253_flagstrobe(.sel({flatch, nboe}),
				 .i({1'b0, clk3, 2'b00}),
				 .oe(0), .y(flagclk));

   // Flag registration
   flipflop_74h ic110a_74_fv(.set(1), .rst(nreset),
			     .d(fvout), .clk(flagclk),
			     .q(fv));
   
   flipflop_74h ic110b_74_fltadd(.set(clk3), .rst(1),
				 .d(nalucpl), .clk(flagclk),
				 .q(nfltadd));
   

   reg [4096:0]   basedir, s0, s1, s2;
   // Load ROM images
   initial begin
      if (!$value$plusargs("basedir=%s", basedir)) basedir = `BASEDIR;
      $sformat(s0, "%-0s/microcode/alu-binary-6bit-00.list", basedir);
      $sformat(s1, "%-0s/microcode/alu-binary-6bit-00.list", basedir);
      $sformat(s2, "%-0s/microcode/alu-binary-4bit-00.list", basedir);
	
      $readmemb(s0, ic106_29040_rom0.mem);
      $readmemb(s1, ic107_29040_rom1.mem);
      $readmemb(s2, ic108_29040_rom2.mem);
   end
endmodule // PB3_decoder



// End of file.
