`include "memory.v"
`include "addressing.v"
`timescale 1ns/10ps

module banked_memory_tb();

   reg 	       nreset, nmem, nio, nw, nr, nfpram;
   reg [15:0]  ab, db;
   wire [15:0] db_real;
   wire [7:0]  aext;
   wire        nsysdev;
   wire        banking;

   integer     i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/banked_memory_tb.vcd");
      $dumpvars (0, banked_memory_tb);

      // Initialise
      nreset = 0;
      nmem = 1;
      nio = 1;
      nw = 1;
      nr = 1;
      nfpram = 1;
      ab = 0;
      db = 16'bzzzz_zzzz_zzzz_zzzz;

      // Reset
      #500 nreset = 1;

      // Test addresses using the dfeault banking scheme we just set up, with
      // the FPRAM/FPROM switch in the turnkey position (FPROM, 1).
      nfpram = 1;
      nmem = 0;
      #250 for (i = 0; i < 65536; i = i + 4096) begin
	 #250 ab = i;
      end
      #250 nmem = 1;
      //ab = 16'bzzzz_zzzz_zzzz_zzzz;

      // Now do the same with the switch in the FPRAM position.
      #1000 nfpram = 0;
      nmem = 0;
      #250 for (i = 0; i < 65536; i = i + 4096) begin
	 #250 ab = i;
      end
      #250 nmem = 1;
      //ab = 16'bzzzz_zzzz_zzzz_zzzz;

      // Reset
      #500 nreset = 0;
      #500 nreset = 1;
      
      // Check that writing to the bank registers sets BANKEN#.
      #1000 for (i = 0; i < 8; i = i + 1) begin
	 #250 nio = 0;
	 ab = 'h20 + i; 	// Address the BANKi registers.
	 db = 0;
	 #250 nw = 0;
	 #250 nw = 1;
	 nio = 1;
      end
      //ab = 16'bzzzz_zzzz_zzzz_zzzz;

      // Test addresses using the all-zero banking scheme we just set up.
      #1000 nmem = 0;
      #250
      for (i = 0; i < 65536; i = i + 4096) begin
	 #250 ab = i;
      end
      #250 nmem = 1;
      //ab = 16'bzzzz_zzzz_zzzz_zzzz;

      // Reset
      #500 nreset = 0;
      #500 nreset = 1;
      
      // Setup a banking scheme where the first 48kWords are RAM and the last 16kWords are ROM.
      #1000 for (i = 0; i < 8; i = i + 1) begin
	 #250 nio = 0;
	 ab = 'h20 + i; 	// Address the BANKi registers.
	 db = i < 6 ? i : 'h80 | (i - 6);
	 #250 nw = 0;
	 #250 nw = 1;
	 nio = 1;
      end
      #250 db = 16'bzzzz_zzzz_zzzz_zzzz;
      
      // Test addresses
      #1000 nmem = 0;
      #250
      for (i = 0; i < 65536; i = i + 4096) begin
	 #250 ab = i;
      end
      #250 nmem = 1;
      //ab = 16'bzzzz_zzzz_zzzz_zzzz;

      // Reset
      #500 nreset = 0;
      #500 nreset = 1;
      
      // Read data.
      #1000
      db = 16'bzzzzzzzzzzzzzzzz;
      for (i = 0; i < 65536; i = i + 4096) begin
	 #250 ab = i | 16'h3f8;
	 #250 nmem = 0;
	 #250 nr = 0;
	 #250 nr = 1;
	 nmem = 1;
      end
      db = 16'bzzzzzzzzzzzzzzzz;

      #10000 $finish;      // Terminate simulation
   end

   // Link the 3-state bus and our register (d).
   assign db_real = db;

   sysdev_demux sysdev_demux (ab, nio, nsysdev, , , );

   bank_switch bs (nreset, nmem, nw, nsysdev, ab, db_real, nfpram, aext, banking);

   memory mem (aext, ab, db_real, nmem, nr, nw);

endmodule
