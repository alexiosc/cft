`ifndef ram_v
`define ram_v

`timescale 1ns/10ps

module sram (a, d, ce, we, oe);
   parameter bits = 13;
   parameter access_time = 70;
   parameter bin_fname = "rom.bin";
   parameter name = "--";
   
   input [bits-1:0] a;		// Address
   input 	    ce;		// /CE (active low): chip enable
   input 	    we;		// /WE Read=1, Write=0: latch
   input 	    oe;		// /OE Output enable. High: tristates D.

   inout [7:0] 	    d;		// Output

   wire [bits-1:0]  a;		// Address
   wire 	    ce;
   wire 	    oe;
   
   wire [7:0] 	    d;

   reg [7:0] 	    mem [0:(1 << bits) - 1];

   initial begin
      $readmemb(bin_fname, mem); // Read the memory image.
      $display("BOM:%dkx8 SRAM", 1<<(bits - 10));
   end

   assign #access_time d = (oe | ce) ? {8{1'bz}} : mem[a];

   always @(posedge we, posedge ce) begin
      if (!we || !ce) begin
	 #access_time mem[a] = d;
	 //$display("sram ", name, " write a:", a, ", d:", d);
      end
   end

   always @(oe or we) begin
      if (!oe && !we) begin
	 $display("sram: /OE and /WE both active.");
      end
   end

endmodule // End of Module counter

`endif //  `ifndef ram_v

// End of file.
