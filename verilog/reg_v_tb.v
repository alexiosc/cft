//
// REDESIGNED IN 2019
//

`include "reg_v.v"

`timescale 1ns/10ps


module reg_v_tb();
   reg nreset;
   reg clk;
   reg ibus13;
   reg fvin_add;
   reg nread_alu_add;
   reg nflagwe;
   reg clken;

   wire fv;
   wire clk4;
   reg _clk4;

   integer     i, j, k;

   initial begin        
      $dumpfile ("vcd/reg_v_tb.vcd");
      $dumpvars (0, reg_v_tb);

      //$monitor ("%g\t %b %b %b %b %b", $time, waddr, raddr, ir[11:0] , ibus[7:0], reg_v.sel);

      nreset = 0;
      clk = 1;
      ibus13 = 0;
      nflagwe = 1;
      fvin_add = 0;
      nread_alu_add = 1;
      clken = 0;
      #1000 nreset = 1;
      #1000 clken = 1;

      // Test write_flags from the bus.
      #400 for (i = 0; i < 4; i++) begin
	 #400 ibus13 = 0;
	 #50 nflagwe = 0;
	 #50 nflagwe = 1;
	 
	 #400 ibus13 = 1;
	 #50 nflagwe = 0;
	 #50 nflagwe = 1;
      end

      // Test L loading from the ALU's adder
      #1000 for (i = 0; i < 4; i++) begin
	 #400 fvin_add = 0;
	 #50 nread_alu_add = 0;
	 #50 nread_alu_add = 1;
	 
	 #400 fvin_add = 1;
	 #50 nread_alu_add = 0;
	 #50 nread_alu_add = 1;
      end

      #10000 $finish;

   end // initial begin

   always begin
      #62.5 _clk4 = 1;
      #187.5 _clk4 = 0;
   end
   assign clk4 = clken == 1 ? _clk4 : clk;

  // Instantiate all sub-modules.
   reg_v reg_v (.nreset(nreset), .clk4(clk4),
		.ibus13(ibus13), .fvin_add(fvin_add),
		.nread_alu_add(nread_alu_add), .nflagwe(nflagwe),
		.fv(fv));

endmodule // reg_v_tb


// End of file.
