///////////////////////////////////////////////////////////////////////////////
//
// READ ONLY MEMORY
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// rom.v -- Read Only Memory
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



`ifndef rom_v
`define rom_v

`timescale 1ns/10ps

`ifndef SENTINEL
 `define SENTINEL 8'h0f
`endif


module rom (a, d, nce, noe);
   parameter bits = 13;
   parameter access_time = 70;
   parameter bin_fname = "foo";
   
   input [bits-1:0] a;		// Address
   input 	    nce;	// CE# (active low): chip enable
   input 	    noe;	// OE# (active low): output enable

   output [7:0]     d;		// Output

   reg [7:0] 	    mem [0:(1 << bits) - 1];

   integer 	    i, j;

   initial begin
      if (bin_fname !== "foo") begin
	 $readmemb(bin_fname, mem); // Read the memory image.
      end
      // else begin
      // 	 j = 1 << bits;
      // 	 for (i = 0; i < j; i = i + 1) mem[i] = `SENTINEL;
      // end
   end

   assign #access_time d = (noe | nce) ? 8'bzzzzzzzz : mem[a];

endmodule // rom

`endif //  `ifndef rom_v

// End of file.
