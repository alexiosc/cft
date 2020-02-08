///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// microcode-store.v -- Processor Board, Microcode ROMs
//
// Copyright © 2011-2019 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
//
///////////////////////////////////////////////////////////////////////////////

`include "buffer.v"
`include "rom.v"

`timescale 1ns/1ps


`ifndef BASEDIR
 `define BASEDIR ".."
`endif // BASEDIR


///////////////////////////////////////////////////////////////////////////////
//
// Microcode ROMs
//
///////////////////////////////////////////////////////////////////////////////

module microcode_store(nreset, nhalt, uaddr, udata,
		       nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd);

   input         nreset;
   input         nhalt;
   input [18:0]  uaddr;

   output [23:0] udata;

   input 	 nfpua0;
   input 	 nfpuc0;
   input 	 nfpuc1;
   input 	 nfpuc2;
   output [7:0]  fpd;

   wire 	 ncse;
   assign #6 ncse = !(nreset & nhalt);

   // Connect the microcode ROM/Flash devices
   rom #(19, 50) rom0 (.a(uaddr), .d(udata[7:0]),   .nce(1'b0), .noe(ncse));
   rom #(19, 50) rom1 (.a(uaddr), .d(udata[15:8]),  .nce(1'b0), .noe(ncse));
   rom #(19, 50) rom2 (.a(uaddr), .d(udata[23:16]), .nce(1'b0), .noe(ncse));

   // Uaddr is 19 bits. Of these, 2 are state bits and 9 come from the
   // IR. These are displayed in their own sections of the front
   // panel. The remaining 8 bits are displayed in the uADDR LOW front
   // panel section, requiring just one buffer.
   buffer_541 buf_ua0 (.a(uaddr[7:0]),   .y(fpd), .noe1(nfpua0), .noe2(1'b0));

   buffer_541 buf_uc0 (.a(udata[7:0]),   .y(fpd), .noe1(nfpuc0), .noe2(1'b0));
   buffer_541 buf_uc1 (.a(udata[15:8]),  .y(fpd), .noe1(nfpuc1), .noe2(1'b0));
   buffer_541 buf_uc2 (.a(udata[23:16]), .y(fpd), .noe1(nfpuc2), .noe2(1'b0));
   
   reg [4096:0] basedir, s0, s1, s2;
   // Load ROM images
   initial begin
      if (!$value$plusargs("basedir=%s", basedir)) basedir = `BASEDIR;
      $sformat(s0, "%-0s/microcode/build/microcode-00.list", basedir);
      $sformat(s1, "%-0s/microcode/build/microcode-01.list", basedir);
      $sformat(s2, "%-0s/microcode/build/microcode-02.list", basedir);

      $readmemb(s0, rom0.mem);
      $readmemb(s1, rom1.mem);
      $readmemb(s2, rom2.mem);
   end
endmodule // microcode_store

// End of file.
