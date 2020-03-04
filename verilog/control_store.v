///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// control_store.v -- Processor Board, Microcode ROMs
//
// Copyright © 2011–2020 Alexios Chouchoulas
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
`include "flipflop.v"
`include "rom.v"


`timescale 1ns/1ps


`ifndef BASEDIR
 `define BASEDIR ".."
`endif // BASEDIR


///////////////////////////////////////////////////////////////////////////////
//
// CONTROL STORE
//
///////////////////////////////////////////////////////////////////////////////

module control_store(noe, clk, uaddr, ucontrol);

   input         noe;
   input 	 clk;
   input [18:0]  uaddr;

   output [23:0] ucontrol;

   // Connect the microcode ROM/Flash devices
   wire [23:0] 	 udata;

   rom #(19, 50) rom0 (.a(uaddr), .d(udata[7:0]),   .nce(1'b0), .noe(1'b0));
   rom #(19, 50) rom1 (.a(uaddr), .d(udata[15:8]),  .nce(1'b0), .noe(1'b0));
   rom #(19, 50) rom2 (.a(uaddr), .d(udata[23:16]), .nce(1'b0), .noe(1'b0));

   // The control vector is registered on the rising edge of clk.
   flipflop_574 ff1 (.d(udata[7:0]),   .q(ucontrol[7:0]),   .clk(clk), .noe(noe));
   flipflop_574 ff2 (.d(udata[15:8]),  .q(ucontrol[15:8]),  .clk(clk), .noe(noe));
   flipflop_574 ff3 (.d(udata[23:16]), .q(ucontrol[23:16]), .clk(clk), .noe(noe));

   initial begin
      #30 ff1.q0 <= $random;
      ff2.q0 <= $random;
      ff3.q0 <= $random;
   end

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
endmodule // control_store

// End of file.
