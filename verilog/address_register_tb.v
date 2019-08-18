//
// REDESIGNED IN 2019
//

`include "address_register.v"
`include "memory_bank_register.v"

`timescale 1ns/10ps


module address_register_tb();
   reg [15:0]  ibus;
   reg [7:0]   aext;

   wire [15:0] ibus_real;
   wire [7:0]  aext_real;

   reg 	       nwrite_ar, nmem, nio;

   wire [23:0] ab;
   wire        nsysdev, niodev1xx, niodev2xx, niodev3xx;

   integer     i, j;
   
   initial begin        
      $dumpfile ("vcd/address_register_tb.vcd");
      $dumpvars (0, address_register_tb);

      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      aext = 8'bzzzz_zzzz;
      nwrite_ar = 1;
      nmem = 1;
      nio = 1;

      // Set the AR.
      ibus = 16'hbeef;
      aext = 16'h12;
      #500 nwrite_ar = 0;
      #500 nwrite_ar = 1;

      // Drive the Address Bus.
      #1000 nmem = 0;
      #500 nmem = 1;
      #1000 nio = 0;
      #500 nio = 1;

      // Test SYSDEV#
      #1000 ibus = 42;
      #500 nwrite_ar = 0;
      #500 nwrite_ar = 1;
      #500 nio = 0;
      #500 nio = 1;

      // Test IODEV1
      #1000 ibus = 'h142;
      #500 nwrite_ar = 0;
      #500 nwrite_ar = 1;
      #500 nio = 0;
      #500 nio = 1;

      // Test IODEV2
      #1000 ibus = 'h242;
      #500 nwrite_ar = 0;
      #500 nwrite_ar = 1;
      #500 nio = 0;
      #500 nio = 1;

      // Test IODEV3
      #1000 ibus = 'h342;
      #500 nwrite_ar = 0;
      #500 nwrite_ar = 1;
      #500 nio = 0;
      #500 nio = 1;

      #1000 $finish;

   end // initial begin

   assign ibus_real = ibus;
   
   // Instantiate all sub-modules.
   reg_ar reg_ar (.ibus(ibus_real), .aext(aext), .nwrite_ar(nwrite_ar), .nmem(nmem), .nio(nio),
		  .ab(ab), .nsysdev(nsysdev),
		  .niodev1xx(niodev1xx),  .niodev2xx(niodev2xx),  .niodev3xx(niodev3xx));

endmodule // address_register_tb

// End of file.
