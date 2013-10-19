///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: ROM
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
