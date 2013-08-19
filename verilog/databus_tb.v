`include "databus.v"
`include "clock.v"

`timescale 1ns/10ps


module addressing_tb();

   wire [15:0] ibus_real, db_real;
   wire        nw;

   reg [15:0]  ibus, db;
   reg 	       nmem, nio, nr, nwen;
   wire        clk1, clk2, clk3, clk4, clk5, nguard;

   wire        wshold;

   reg 	       nws;
   reg 	       fpclken;
   reg 	       fpustep;
   reg 	       nreset;
   reg 	       fpfast, fpslow;
   wire        testclk, slowclk;
   
   initial begin        
      $dumpfile ("vcd/databus_tb.vcd");
      $dumpvars (0, addressing_tb);

      nws = 1'b1;
      nreset = 1'b0;
      fpclken = 1'b1;
      fpustep = 1'b1;
      fpfast = 1'b1;
      fpslow = 1'b0;
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      nmem = 1;
      nio = 1;
      nr = 1;
      nwen = 1;
      #750 nreset = 1;

      // Simulate memory write
      #1500 db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'b1010_1010_1010_1010;
      #300 nmem = 0;
      nwen = 0;
      #300 nwen = 1;
      nmem = 1;
      #300
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      
      // Simulate I/O write (with a wait state)
      #1500 db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'b1011_1011_1011_1011;
      #1500 nio = 0;
      nwen = 0;
      nws = 0;
      #300 nws = 1;
      #300 nwen = 1;
      nio = 1;
      #300
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      
      // Simulate memory read
      #1500 ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      db = 16'b1100_1100_1100_1100;
      #300 nmem = 0;
      nr = 0;
      #300 nr = 1;
      nmem = 1;
      #300
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      
      // Simulate I/O read
      #1500 ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      db = 16'b1101_1101_1101_1101;
      #1500 nio = 0;
      nr = 0;
      #300 nr = 1;
      nio = 1;
      #300
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;

      #1160 nws = 0;
      #1250 nws = 1;
      
      #3000 $finish;

   end // initial begin

   assign ibus_real = ibus;
   assign db_real = db;
   
   wire 	 memguard;
   and #6 (memguard, clk2, clk3);
   //and #6 (wshold, clk1, clk2);
   assign wshold = 1'b1;

   clock_generator clock_generator (fpclken, fpustep,
				    nreset,
				    slowclk, testclk,
				    fpfast, fpslow,
				    clk1, clk2, clk3, clk4, nt12, nt34);
   databus db_iface (nws, nreset, wshold, clk2, clk4, nt34, ibus_real, nmem, nio, nr, nwen, db_real, nw);

endmodule // addressing_tb

// End of file.
