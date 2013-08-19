///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: ROM
//
///////////////////////////////////////////////////////////////////////////////

`ifndef rom_v
`define rom_v

`timescale 1ns/10ps

module rom (a, d, ce, oe);
   parameter bits = 13;
   parameter access_time = 70;
   parameter bin_fname = "rom.bin";
   
   input [bits-1:0] a;		// Address
   input 	    ce;		// /CE (active low): chip enable
   input 	    oe;		// /OE (active low): output enable

   output [7:0] d;		// Output

   wire [bits-1:0] a;		// Address
   wire 	   ce;
   wire 	   oe;
 	
   wire [7:0] 	 d;

   reg [7:0] 	 mem [0:(1 << bits) - 1];

   initial begin
      $readmemb(bin_fname, mem); // Read the memory image.
      // $display("BOM:%d kbit EEPROM", 1<<(bits - 7));
   end

   assign #access_time d = (oe | ce) ? {8{1'bz}} : mem[a];

endmodule // rom

`endif //  `ifndef rom_v

// End of file.
