//
// REDESIGNED IN 2019
//

`include "dfp_scan.v"

`timescale 1ns/10ps


module dfp_scan_tb();
   reg        nscanen;
   reg 	      npanelen;

   reg [7:0]  fpa;

   wire [31:0] nfpoe;
   wire [3:0]  nlmoe;
   wire [5:1]  nrow;
   
   tri0 [7:0] fpa_real;
   
   integer    i;
   
   initial begin        
      $dumpfile ("vcd/dfp_scan_tb.vcd");
      $dumpvars (0, dfp_scan_tb);

      //$monitor ("%g\t %b %b %b %b %b", $time, waddr, raddr, ir[11:0] , ibus[7:0], dfp_scan.sel);

      // Simulate the counter starting at 0.
      fpa = 8'd0;
      nscanen = 1'b1;
      npanelen = 1'b0;

      // Pretend we're the MCU and scan all 256 addresses.
      for (i = 0; i < 256 ; i = i + 1) begin
	 #125 fpa = i;
      end



      #1000 fpa = 8'bzzzzzzzz;
      #100 npanelen = 1;
      #100 nscanen = 1;

      // Do it again with PANELEN de-asserted
      for (i = 0; i < 256 ; i = i + 1) begin
	 #125 fpa = i;
      end

      #1000 fpa = 8'bzzzzzzzz;
      #100 npanelen = 0;
      #100 nscanen = 0;




      // #250 nreset = 1;

      // #1000 nfpram_fprom = 0;
      // #1000 nfpram_fprom = 1;
      // #1000 nfpram_fprom = 0;

      // // First, let's configure the MBn registers.
      // raddr = 4'b0000;
      // for (i = 0; i < 8 ; i = i + 1) begin
      // 	 #50 ibus = ((i ^ 15) << 4) | i; // test data on ibus
      // 	 ir = 16'd0 | i;	       // address on IR
      // 	 #50 waddr = 5'b01111;	       // write_mbn
      // 	 #200 waddr = 5'b00000;	       // idle again
      // 	 #50 ibus = 8'bzzzzzzzz; // test data on ibus
      // end
      // ibus = 8'bzzzzzzzz;
      // #1000;

      // // Then, let's read them back.
      // #1000 waddr = 4'b0000;
      // for (i = 0; i < 8 ; i = i + 1) begin
      // 	 ibus = 8'bzzzzzzzz;
      // 	 ir = 16'd0 | i;	       // address on IR
      // 	 #50 raddr = 5'b01111;	       // write_mbn
      // 	 #200 raddr = 5'b00000;	       // idle again
      // end
      // #1000;

      // #1000 ir = 16'b0000_0100_0000_0000;
      // for (i = 0; i < 32 ; i = i + 1) begin
      // 	 #100 raddr = i;
      // end

      // // Try the write_ar_mb addresses.

      // #1000 ir = 16'b1111_0100_0000_0000;
      // raddr = 0;
      // #1000 for (j = 5'b00100; j <= 5'b00111 ; j = j + 1) begin
      // 	 #250 waddr = j;
      // end

      // #1000;

      // // Try the index registers. This uses an instruction like TRAP I R &0xx
      // // which should NOT select registers based on IR[2:0], just on WADDR.
      // for (i = 5'b00100; i <= 5'b00111; i++) begin
      // 	 waddr = i;
      // 	 //5'b00111;
      // 	 for (j = 16'b0000_1100_0000_0000; j < 16'b0000_1100_0001_0000 ; j = j + 1) begin
      // 	    #100 ir = j;
      // 	 end;
      // 	 // Sample of IR values: TRAP I R &1xx
      // 	 for (j = 16'b0000_1101_0000_0000; j < 16'b0000_1101_0001_0000 ; j = j + 1) begin
      // 	    #100 ir = j;
      // 	 end;
      // 	 // Sample of IR values: Instructions TRAP I R &2xx
      // 	 for (j = 16'b0000_1110_0000_0000; j < 16'b0000_1110_0001_0000 ; j = j + 1) begin
      // 	    #100 ir = j;
      // 	 end;
      // 	 // Sample of IR values: Instructions TRAP I R &3xx. These SHOULD index using IR[2:0].
      // 	 for (j = 16'b0000_1111_0000_0000; j < 16'b0000_1111_0001_0000 ; j = j + 1) begin
      // 	    #100 ir = j;
      // 	 end;
      // 	 #1000;
      // end; // for (i = 5'b00100; i <= 5b'00111; i++)

      #20000 $finish;

   end // initial begin

   assign fpa_real = fpa;

   // Instantiate DUT.
   dfp_scan dfp_scan (.nscanen(nscanen), .npanelen(npanelen),
		      .fpa(fpa_real),
		      .nfpoe(nfpoe), .nlmoe(nlmoe), .nrow(nrow));
   

endmodule // dfp_scan_tb


// End of file.
