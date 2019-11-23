`ifndef ram_v
`define ram_v

`timescale 1ns/10ps

module flashram (a, d, ce, we, oe);
   parameter bits = 13;
   parameter access_time = 70;
   parameter bin_fname = "img/rom.bin";
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

   reg 		    wp;	// Boot-time write protection

   initial begin
      $readmemb(bin_fname, mem); // Read the memory image.
      // $display("BOM:%dkx8 SRAM", 1<<(bits - 10));
      wp <= 1;
   end

   always begin
      #10 wp <= 0;		// Clear the write protection just after boot.
   end

   assign #access_time d = (oe | ce) ? {8{1'bz}} : mem[a];

   always @(posedge we, posedge ce) begin
      if (!we || !ce) begin
	 if (wp == 0) begin
	    #access_time mem[a] = d;
	    //$display("sram ", name, " write a:", a, ", d:", d);
	 end
      end
   end

   always @(oe or we) begin
      if (!oe && !we) begin
	 $display("sram: /OE and /WE both active.");
      end
   end

endmodule // End of Module counter



module sram (a, d, ce, we, oe);
   parameter bits = 19;
   parameter access_time = 70;
   parameter sentinel = 'hf0;
   
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

   integer 	    i;

   initial begin
      // $display("BOM:'040 SRAM (4 MBits, 512x8)')");
      for(i=0 ; i < (1 << bits); i = i + 1) mem[i] = 16'h0f;
   end

   assign #access_time d = (oe | ce) ? {8{1'bz}} : mem[a];

   always @(posedge we, posedge ce) begin
      if (!we || !ce) begin
	 #access_time mem[a] = d;
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
