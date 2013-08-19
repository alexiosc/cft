 `include "addressing.v"

`timescale 1ns/10ps


module addressing_tb();
   reg [15:0]  ibus;
   wire [15:0] ibus_real;

   reg 	       nwar, nreset, nend;

   wire [15:0] ar, ab;

   reg 	       nmem, nio;
   wire        naindex, nsysdev, niodev1, niodev2, niodev3;

   integer    i, j;
   
   initial begin        
      $dumpfile ("vcd/addressing_tb.vcd");
      $dumpvars (0, addressing_tb);

      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      nwar = 1;
      nend = 1;
      nmem = 1;
      nio = 1;

      // Reset
      #1000 nreset = 0;
      #1000 nreset = 1;

      // Set the AR.
      ibus = 16'hbeef;
      #500 nwar = 0;
      #500 nwar = 1;

      // Drive the Address Bus.
      #1000 nmem = 0;
      #500 nmem = 1;
      #1000 nio = 0;
      #500 nio = 1;

      // Set an AutoIndex address
      #1000 ibus = 16'h85;
      #500 nwar = 0;
      #500 nwar = 1;

      #1000 ibus = 0;
      #500 nwar = 0;
      #500 nwar = 1;

      #1000 nend = 0;
      #500 nend = 1;

      // Test SYSDEV#
      #1000 ibus = 42;
      #500 nwar = 0;
      #500 nwar = 1;
      #500 nio = 0;
      #500 nio = 1;

      // Test IODEV1
      #1000 ibus = 'h142;
      #500 nwar = 0;
      #500 nwar = 1;
      #500 nio = 0;
      #500 nio = 1;

      // Test IODEV2
      #1000 ibus = 'h242;
      #500 nwar = 0;
      #500 nwar = 1;
      #500 nio = 0;
      #500 nio = 1;

      // Test IODEV3
      #1000 ibus = 'h342;
      #500 nwar = 0;
      #500 nwar = 1;
      #500 nio = 0;
      #500 nio = 1;

      #1000 $finish;

   end // initial begin

   assign ibus_real = ibus;
   
   // Instantiate all sub-modules.
   reg_ar reg_ar (ibus_real, nwar, nreset, ar);
   sysdev_demux sysdev (ab, nio, nsysdev, niodev1, niodev2, niodev3);
   ail ail_unit (ar, nend, naindex);
   ab_driver ab_drive (ar, nmem, nio, ab, 0);

endmodule // addressing_tb

// End of file.
