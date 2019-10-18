//
// REDESIGNED IN 2019
//

`include "reg_mbr.v"

`timescale 1ns/10ps


module reg_mbr_tb();
   reg        nreset;
   reg        nfpram_fprom;
   reg [7:0]  ibus;
   reg [15:0] ir;
   reg [4:0]  waddr;
   reg [4:0]  raddr;
   
   wire [7:0] ibus_real;
   wire [7:0] aext;
   wire [7:0] fpd;
   reg 	      nfpaext;
   
   integer    i, j, k;

   reg [800:0] status;
   
   initial begin        
      $dumpfile ("vcd/reg_mbr_tb.vcd");
      $dumpvars (0, reg_mbr_tb);

      // $monitor ("t: %7d | %b %b %b %b > %b", $time, waddr, raddr, ir[11:0] , ibus[7:0], reg_mbr.sel);

      nreset = 0;
      nfpram_fprom = 0;		// RAM
      ibus = 8'bzzzzzzzz;
      ir = 16'b0000_0000_0000_0000;
      waddr = 4'b0000;
      raddr = 4'b0000;

      status = "reset";

      #250 nreset = 1;

      #1000 nfpram_fprom = 0;
      #1000 nfpram_fprom = 1;
      #1000 nfpram_fprom = 0;

      // First, let's configure the MBn registers. Make sure all 256
      // values × 8 regs work fine.
      status = "write";
      raddr = 4'b0000;
      for (i = 0; i < 8 ; i = i + 1) begin
	 #1000

	 for (j = 0; j < 256; j = j + 1) begin
	    #62.5 ibus = j;
	    ir = i;
	    #62.5 waddr = 5'b01111;
	    #62.5 waddr = 5'b00000;
	    #62.5 ibus = 8'bzzzzzzzz;
	    #62.5 raddr = 5'b01111;
	    #185.5 raddr = 5'b00000;
	 end
      end
      #1000;

      // Now let's configure a known set of registers to help with further
      // testing.
      status = "config";
      
      #1000 raddr = 4'b0000;
      for (i = 0; i < 8 ; i = i + 1) begin
	 #125 ibus = (i ^ 4'hf) << 4 | (i & 4'hf);
	 ir = 16'd0 | i;	       // MBn address on IR
	 #62.5 waddr = 5'b01111;	       // write_mbn
	 #62.5 waddr = 5'b00000;	       // idle again
      end
      #1000;

      // Then, let's read them back.
      status = "read MBN";
      #1000 waddr = 4'b0000;
      for (i = 0; i < 8 ; i = i + 1) begin
	 $display("I=", i);
	 
      	 ibus = 8'bzzzzzzzz;
      	 ir = 16'd0 | i;	       // address on IR
      	 #50 raddr = 5'b01111;	       // write_mbn
      	 #200 raddr = 5'b00000;	       // idle again
      end
      #1000;

      // #1000 ir = 16'b0000_0100_0000_0000;
      // for (i = 0; i < 32 ; i = i + 1) begin
      // 	 #100 raddr = i;
      // end

      // // Try the write_ar_mb addresses.
      // status = "reference AR:MBx";
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

      #10000 $finish;

   end // initial begin

   always begin
      #950 nfpaext = 1'b0;
      #50 nfpaext = 1'b1;
   end

   assign ibus_real = ibus;

   // Instantiate all sub-modules.
   reg_mbr reg_mbr (.nreset(nreset),
		    .waddr(waddr), .raddr(raddr), .ir(ir[11:0]),
		    .ibus(ibus_real[7:0]), .aext(aext),
		    .nfpram_fprom(nfpram_fprom),
		    .nfpaext(nfpaext), .fpd(fpd));

   // Verify our findings.
   reg [8191:0] msg;
   reg [7:0] 	mbn[7:0];

   // MBn register snooping to facilitate further testing.
   always @(waddr, ibus_real) begin
      if (waddr === 5'b01111) begin
	 mbn[ir[2:0]] = ibus_real[7:0];
	 // $display("REGS NOW %02x %02x %02x %02x %02x %02x %02x %02x",
	 // 	  mbn[0], mbn[1], mbn[2], mbn[3], 
	 // 	  mbn[4], mbn[5], mbn[6], mbn[7]);
      end
   end

   // Verify reading. We'll peer into the '670 to do this properly.
   always @ (raddr) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 if (raddr === 5'b01111) begin
	    // Snoop the MBn register to compare against later
	    if (ibus_real !== mbn[ir[2:0]]) begin
	       $sformat(msg, "raddr=%b, n=%1d, mb%1d=%02x, but ibus=%04x",
			raddr, ir[2:0], ir[2:0], mbn[ir[2:0]], ibus_real);
	       $display("*** ibus=%04x ir=%04x n=%01x mbn=%02x", ibus_real, ir, ir[2:0], mbn[ir[2:0]]);
	       $display("*** REGS NOW %02x %02x %02x %02x %02x %02x %02x %02x",
			mbn[0], mbn[1], mbn[2], mbn[3], 
			mbn[4], mbn[5], mbn[6], mbn[7]);
	       $display("msg=%0s",msg);
	       
	    end else begin
	    end	       
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
	    
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK read");
      end
   end

endmodule // reg_mbr_tb


// End of file.
