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
			    idx, ncond, in_rsvd, ir, nirqsuc,
			    raddr, waddr, cond, action, nmem, nio, nr, nwen, nend,
			    nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd, fpfetch);

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
   input 	nirqsuc;

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
   output 	fpfetch;

   wire 	ncse;

   // The µPC counter counts 0..15 to execute microprograms. It is reset while
   // nrsthold is asserted and loaded with 0 (i.e. also reset) when either nend
   // or nendext are asserted.
   wire [3:0] upc;
   wire       nupcclr;
   assign #6 nupcclr = nend & nendext;
   counter_161 upc_ctr (.mr(nrsthold), .cp(clk4), .cep(nws), .cet(nhalt),
			.pe(nupcclr), .p(4'd0), .q(upc));
   

   // Generate the nCSE signal to enable the ROMs. The ROMs are enable when
   // both HALT and RESET are deasserted.
   assign #6 ncse = !(nreset & nhalt);

   // Set up the Address and Control vectors
   assign uaddr = { nrsthold, nirqsuc, ir[15:7], in_rsvd, ncond, idx, upc };
   assign { nend, nwen, nr, nio, nmem, action, cond, waddr, raddr  } = udata;
   
   // The Microcode Store.
   microcode_store ucs(.ncse(ncse),
		       .uaddr(uaddr), .udata(udata),
		       .nfpua0(nfpua0), .nfpuc0(nfpuc0),
		       .nfpuc1(nfpuc1), .nfpuc2(nfpuc2), .fpd(fpd));

   // For the benefit of the DFP and Front Panel, decode fetch and execute
   // states here.
   comparator_85 fetch_exec_cmp (.a(upc), .b(3'b010),
				 .ilt(1'b0), .ieq(1'b1), .igt(1'b0),
				 .olt(fpfetch));

endmodule // sequencer

// End of file.
