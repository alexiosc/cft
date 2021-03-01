///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: STATIC RAM
//
///////////////////////////////////////////////////////////////////////////////

`ifndef ram_v
`define ram_v

`timescale 1ns/10ps


`ifndef SENTINEL
 `define SENTINEL 8'h0f
`endif


module sram (a, d, nce, nwe, noe);
   parameter bits = 19;
   parameter access_time = 50;
   
   input [bits-1:0] a;          // Address
   input            nce;        // /CE (active low): chip enable
   input            nwe;        // /WE Read=1, Write=0: latch
   input            noe;        // /OE Output enable. High: tristates D.

   inout [7:0]      d;          // Output
 
   wire [bits-1:0]  a;          // Address
   wire             ce;
   wire             oe;
   
   wire [7:0]       d;

   reg [7:0]        mem [0:(1 << bits) - 1];

   integer          i;

   initial begin
      // $display("BOM:'040 SRAM (4 MBits, 512x8)')");
      if ($test$plusargs("debug-memwrites")) $display("D: Will print out memory writes");
      for(i=0 ; i < (1 << bits); i = i + 1) mem[i] = `SENTINEL;
   end

   assign #access_time d = (noe == 0 && nce == 0) ? mem[a] : 8'bzzzzzzzz;

   always @(nwe, nce, d) begin
      if (nwe == 0 && nce == 0) begin
	 // Most modern chips have Thd=0, so no delay is necessary here.
         mem[a] = d;
	 $display("D: mem[%x] <- %02x", a, mem[a]);
	 if ($test$plusargs("debug-memwrites")) $display("D: mem[%x] <- %02x", a, mem[a]);
      end
   end

   always @(noe or nwe) begin
      if (noe == 0 && nwe == 0) begin
         $display("[fail] sram: /OE and /WE both active.");
	 #100 $finish;
      end
   end

endmodule // sram


// module preloaded_sram (a, d, nce, nwe, noe);

//    parameter bits = 13;
//    parameter access_time = 70;
//    parameter bin_fname = "img/rom.bin";
//    parameter name = "--";
   
//    input [bits-1:0] a;          // Address
//    input            nce;        // /CE (active low): chip enable
//    input            nwe;        // /WE Read=1, Write=0: latch
//    input            noe;        // /OE Output enable. High: tristates D.

//    inout [7:0]      d;          // Output

//    sram #(bits, access_time) _sram (a, d, nce, nwe, noe);

//    initial begin
//       $readmemb(bin_fname, _sram.mem); // Read the memory image.
//    end

// endmodule // preloaded_sram


`endif //  `ifndef ram_v

// End of file.
