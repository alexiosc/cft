///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// sequencer.v -- Control Board, Microcode Sequencer
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
`include "counter.v"
`include "flipflop.v"
`include "rom.v"
`include "microcode_store.v"

`timescale 1ns/10ps


module microcode_sequencer (nreset, nrsthold, clk4, nhalt, nendext, nws,
			    idx, ncond, in_rsvd, ir, nirquc,
			    raddr, waddr, cond, action, nmem, nio, nr, nwen, nend,
			    nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd);

   input        nreset;
   input        nrsthold;
   input        clk4;
   tri1 	nhalt;		// Pulled up here
   tri1         nendext;	// Pulled up here
   input        nws;

   input [0:1]  idx;
   input        ncond;
   input        in_rsvd;
   input [7:15] ir;		// IR is only used partially here!
   input 	nirquc;

   output [4:0] raddr;
   output [4:0] waddr;
   output [3:0] cond;
   output [4:0] action;
   output 	nmem;
   output 	nio;
   output 	nr;
   output 	nwen;
   output 	nend;

   input 	nfpua0;
   input 	nfpuc0;
   input 	nfpuc1;
   input 	nfpuc2;
   output [7:0] fpd;

   




/*
   initial begin
      // These initial values are useful to resolve simulation-specific
      // issues. They are simulation-specific because the uPC starts at a known
      // address, and the microcode ROM issues a known vector, so
      // initialisation to a well-defined state is a given. Verilog doesn't
      // know this, of course.
      nmem = 1;
      nio = 1;
      nr = 1;
      nw = 1;
   end*/

   // Microcode PC
   wire [3:0] upc;
   counter_161 counter (nrsthold, clk4, nws, nhalt, nend, 4'b0000, upc, );

   // The Microcode ROMs
   wire [14:0] uaddr;
   wire [23:0] control_out;
   assign uaddr = {nrsthold, nirqs, fv, fl, ir[15:12], ir[11], nskip, naindex, upc};

   nand #6 (nuce, nhalt, nreset);
   rom #(15, 70, "../microcode/microcode-00.list") rom0 (uaddr, control_out[7:0], 1'b0, nuce);
   rom #(15, 70, "../microcode/microcode-01.list") rom1 (uaddr, control_out[15:8], 1'b0, nuce);
   rom #(15, 70, "../microcode/microcode-02.list") rom2 (uaddr, control_out[23:16], 1'b0, nuce);

   // Decode the control vector.
   assign runit = control_out[3:0]; // RUNIT
   assign wunit = control_out[6:4]; // WUNIT
   assign opif = control_out[10:7]; // OPIF

   // Flag control
   assign ncpl = control_out[12];   // CPL#
   assign ncll = control_out[13];   // CLL#
   assign nsti = control_out[14];   // STI#
   assign ncli = control_out[15];   // CLI#

   // Increment controls
   assign nincac = control_out[11]; // INCAC#
   assign nincpc = control_out[16]; // INCPC#
   assign nincdr = control_out[17]; // INCDR#

   // Memory & I/O
   assign nmem = control_out[19]; // MEM#
   assign nio = control_out[20];  // IO#
   assign nr = control_out[21];	  // R#
   assign nwen = control_out[22]; // WEN#
   assign nend = control_out[23]; // END#

   // Reserved
   assign uinstr18 = control_out[18]; // UINSTR18
   
endmodule // sequencer

// End of file.
