`include "int.v"
`include "register.v"
`include "addressing.v"

`timescale 10ns/10ps

module intc_tb();
   reg         nreset;
   reg 	       nio, nmem, nw, nr;
   wire        nsysdev, nirq;

   reg [7:0]   nirq_in;

   reg [15:0]  ab, db;
   tri0 [15:0] ab_real, db_real;

   integer     i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/intc_tb.vcd");
      $dumpvars (0, intc_tb);

      nreset = 0;
      ab = 16'bzzzz_zzzz_zzzz_zzzz;
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      nirq_in = 8'b1111_1111;
      nmem = 1;
      nio = 1;
      nr = 1;
      nw = 1;
      
      // Reset
      #250 nreset = 1;

      // Fire up some interrupts to test the default behaviour.
      #1000 for (i = 0; i < 8; i = i + 1) begin
	 #250 nirq_in[i] = 0;
	 #250 nirq_in[i] = 1;
      end

      // Now set the interrupt mask and fire off interrupts to ensure masking works properly.
      #1000 ab = 16'h0030;
      db = 16'b00000000_1111_0000; // Enable IRQs4-7.
      nmem = 1;
      nio = 0;
      #250 nw = 0;
      #125 nw = 1;
      #125
      ab = 16'bzzzz_zzzz_zzzz_zzzz;
      db = 16'bzzzz_zzzz_zzzz_zzzz;

      // Fire up some interrupts
      #1000 for (i = 0; i < 8; i = i + 1) begin
	 #250 nirq_in[i] = 0;
	 #250 nirq_in[i] = 1;
      end

      #3000 ab = 16'h0030;
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      nio = 0;
      nr = 0;
      #1000 nr = 1;
      nio = 1;

      // Acknowledge interrupts
      #3000 ab = 16'h0030;
      db = 16'b00000000_0000_0000; // Disable all interrupts
      nio = 0;
      #250 nw = 0;
      #125 nw = 1;
      #125 db = 16'b00000000_0101_0101; // Enable even-numbered IRQs.
      #250 nw = 0;
      #125 nw = 1;
      #125
      ab = 16'bzzzz_zzzz_zzzz_zzzz;
      db = 16'bzzzz_zzzz_zzzz_zzzz;

      // Now fire IRQs one by one and check the ISR
      #2000 for (i = 0; i < 8; i = i + 1) begin
	 #1000 nirq_in[i] = 0;
	 #250 nirq_in[i] = 1;

	 // Read the Interrupt Status Register
	 #250 ab = 16'h0030;
	 db = 16'bzzzz_zzzz_zzzz_zzzz;
	 nio = 0;
	 nr = 0;
	 #1000 nr = 1;
	 nio = 1;
      end // for (i = 0; i < 8; i = i + 1)
	 
      // Clear the IRQ flags
      #3000 ab = 16'h0030;
      db = 16'b00000000_0000_0000; // Disable all interrupts
      nio = 0;
      #250 nw = 0;
      #125 nw = 1;
      #125 db = 16'b00000000_0101_0101; // Enable even-numbered IRQs.
      #250 nw = 0;
      #125 nw = 1;
      #125
      ab = 16'bzzzz_zzzz_zzzz_zzzz;
      db = 16'bzzzz_zzzz_zzzz_zzzz;


      // Now fire IRQs one by one and acknowledge one by one
      #2000 for (i = 0; i < 8; i = i + 1) begin
	 #1000 nirq_in[i] = 0;
	 #250 nirq_in[i] = 1;

	 // Read the Interrupt Status Register
	 #250 ab = 16'h0030;
	 db = 16'bzzzz_zzzz_zzzz_zzzz;
	 nio = 0;
	 nr = 0;
	 #250 nr = 1;
	 nio = 1;

	 // Clear the IRQ# line
	 #250 db = 16'b00000000_0000_0000; // Disable all interrupts
	 nio = 0;
	 #250 nw = 0;
	 #125 nw = 1;
	 #125 db = 16'b00000000_0101_0101; // Enable even-numbered IRQs.
	 #250 nw = 0;
	 #125 nw = 1;
	 #125
	   ab = 16'bzzzz_zzzz_zzzz_zzzz;
	 db = 16'bzzzz_zzzz_zzzz_zzzz;
      end // for (i = 0; i < 8; i = i + 1)
	 
      #1000 $finish;

   end // initial begin

   assign db_real = db;
   assign ab_real = ab;

   sysdev_demux sysdev (ab_real, nio, nsysdev, , , );
   intc intc_unit (nreset, nsysdev, nr, nw, ab_real, db_real, nirq_in, nirq);

endmodule
