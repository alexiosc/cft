`include "databus.v"

`timescale 1ns/10ps


module addressing_tb();

   wire [15:0] ibus_real, db_real;
   wire        nw;

   reg [15:0]  ibus, db;
   reg 	       clk5, nmem, nio, nr, nwen;
   
   initial begin        
      $dumpfile ("vcd/databus_tb.vcd");
      $dumpvars (0, addressing_tb);

      clk5 = 0;
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      nmem = 1;
      nio = 1;
      nr = 1;
      nwen = 1;

      // Simulate memory write
      #500 db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'b1010_1010_1010_1010;
      #100 nmem = 0;
      nwen = 0;
      #100 nwen = 1;
      nmem = 1;
      #100
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      
      // Simulate I/O write
      #500 db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'b1011_1011_1011_1011;
      #500 nio = 0;
      nwen = 0;
      #100 nwen = 1;
      nio = 1;
      #100
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      
      // Simulate memory read
      #500 ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      db = 16'b1100_1100_1100_1100;
      #100 nmem = 0;
      nr = 0;
      #100 nr = 1;
      nmem = 1;
      #100
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      
      // Simulate I/O read
      #500 ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      db = 16'b1101_1101_1101_1101;
      #500 nio = 0;
      nr = 0;
      #100 nr = 1;
      nio = 1;
      #100
      db = 16'bzzzz_zzzz_zzzz_zzzz;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      
      #1000 $finish;

   end // initial begin

   always begin
      #50 clk5=~clk5;
   end

   assign ibus_real = ibus;
   assign db_real = db;

   databus db_iface (clk5, ibus_real, nmem, nio, nr, nwen, db_real, nw);

endmodule // addressing_tb

// End of file.
