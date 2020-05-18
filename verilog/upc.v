///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// upc.v -- Micro-Program Counter
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

`include "counter.v"

`timescale 1ns/1ps


`ifndef BASEDIR
 `define BASEDIR ".."
`endif // BASEDIR


module upc(nreset, nrsthold, clk4, nend, nendext, nws, nhalt, upc);

   input        nreset;
   input 	nrsthold;
   input 	clk4;
   input 	nend;
   input 	nendext;
   input 	nws;
   input 	nhalt;

   output [3:0] upc;

   tri1 	nendext;
   tri1 	nhalt;

   // Clear the µPC when ENDEXT# or END# are asserted by loading it with
   // 4'b0000. The reset sequence asserts END#, so it also clears the µPC
   // programmatically, but that's immaterial because RSTHOLD# is connected to
   // the counter's reset input anyway. Update: Don't clear if WS# is
   // asserted. This solves a bug where wait states wouldn't be honoured if
   // requested while END# is also asserted.
   
   wire 	nupcclr;	// Clear the µPC
   //assign #6 nupcclr = nend & nendext;
   assign #6 nupcclr = (nend & nendext) | nws;

   // Note: we ignore the TC output
   counter_161 upc_ctr(.mr(nrsthold), // Async reset on RSTHOLD#
		       .cp(clk4),
		       .cet(nhalt), // Both CET and CEP must be HIGH to count
		       .cep(nws),
		       .pe(nupcclr), // Synchronous clear (Parallel Load) on UPCCLR#
		       .p(4'b0000), // ...this is the loaded value
		       .q(upc));
endmodule // upc

// End of file.
