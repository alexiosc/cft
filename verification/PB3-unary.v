///////////////////////////////////////////////////////////////////////////////
//
// PB3-unary.v -- Processor Board C, Unary ROMS
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
// Processor Board C, UNARY ROMS
//
///////////////////////////////////////////////////////////////////////////////

module PB3_unary(nreset, nuoe, fl, nirqs, ac, uop,
			       roll16, isroll, ibus);

   input 	 nreset;
   input 	 nuoe;
   input 	 fl;
   input 	 nirqs;
   input [15:0]  ac;
   input [2:0] 	 uop;

   output tri0 	 roll16;
   output tri0	 isroll;

   inout [15:0]  ibus;


   // pullup(ac[0]);
   // pullup(ac[1]);
   // pullup(ac[2]);
   // pullup(ac[3]);
   // pullup(ac[4]);
   // pullup(ac[5]);
   // pullup(ac[6]);
   // pullup(ac[7]);
   // pullup(ac[8]);
   // pullup(ac[9]);
   // pullup(ac[10]);
   // pullup(ac[11]);
   // pullup(ac[12]);
   // pullup(ac[13]);
   // pullup(ac[14]);
   // pullup(ac[15]);

   // Note: actual chips also have a WE# signal because they're Flash
   // devices. We simulate them as ROMs, and the ALU ties their WE# lines to
   // Vcc.

   // Also: actual parts are 512K x 8 devices. Here, we simulate with
   // ROMS the exact same size as their images: 256K x 8 for ROMs 00
   // and 01, 128K X 8 for ROM 02.

   // Unary ROM, bits 0-5.
   wire 	 nc0, nc1;
   rom #(18, 50)
   ic111_29040_rom0(.a({/*1'b0, */uop[2:0], nirqs, fl, ac[15:13], ac[9:0]}),
		    .d({nc0, nc1, ibus[5:0]}),
		    .nce(0), .noe(nuoe));
   
   // Unary ROM, bits 6-11.
   wire 	 nc2, nc3;
   rom #(18, 50)
   ic112_29040_rom1(.a({/*1'b0, */uop[2:0], nirqs, ac[15:2]}),
		    .d({nc3, nc2, ibus[11:6]}),
		    .nce(0), .noe(nuoe));
   
   // Unary ROM, bits 12-15 plus roll hints.
   wire 	 nc4, nc5;
   rom #(17, 50)
   ic113_29040_rom2(.a({/*2'b0, */uop[2:0], nirqs, fl, ac[15:8], ac[3:0]}),
		    .d({nc5, nc4, isroll, roll16, ibus[15:12]}),
		    .nce(0), .noe(nuoe));
   

   reg [4096:0]   basedir, s0, s1, s2;
   // Load ROM images
   initial begin
      if (!$value$plusargs("basedir=%s", basedir)) basedir = `BASEDIR;
      $sformat(s0, "%-0s/microcode/alu-unary-00.list", basedir);
      $sformat(s1, "%-0s/microcode/alu-unary-01.list", basedir);
      $sformat(s2, "%-0s/microcode/alu-unary-02.list", basedir);
	
      $readmemb(s0, ic111_29040_rom0.mem);
      $readmemb(s1, ic112_29040_rom1.mem);
      $readmemb(s2, ic113_29040_rom2.mem);
   end
endmodule // PB3_decoder



// End of file.
