///////////////////////////////////////////////////////////////////////////////
//
// MEMORY BANK REGISTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// reg_mbr_tb.v -- Memory Bank Register Testbench
//
// Copyright © 2011-2019 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
//
///////////////////////////////////////////////////////////////////////////////

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

   wire [7:0]  mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7;

   // Assemble the 8 registers. This makes strong assumptions about the
   // structure of the MBR circuitry!
   assign mb0 = {reg_mbr.reg0hi.q0[0], reg_mbr.reg0lo.q0[0]};
   assign mb1 = {reg_mbr.reg0hi.q0[1], reg_mbr.reg0lo.q0[1]};
   assign mb2 = {reg_mbr.reg0hi.q0[2], reg_mbr.reg0lo.q0[2]};
   assign mb3 = {reg_mbr.reg0hi.q0[3], reg_mbr.reg0lo.q0[3]};

   assign mb4 = {reg_mbr.reg1hi.q0[0], reg_mbr.reg1lo.q0[0]};
   assign mb5 = {reg_mbr.reg1hi.q0[1], reg_mbr.reg1lo.q0[1]};
   assign mb6 = {reg_mbr.reg1hi.q0[2], reg_mbr.reg1lo.q0[2]};
   assign mb7 = {reg_mbr.reg1hi.q0[3], reg_mbr.reg1lo.q0[3]};
   
   initial begin        
      $dumpfile ("vcd/reg_mbr_tb.vcd");
      $dumpvars (0, reg_mbr_tb);

      $monitor ("t: %7d | %b %b %b %b > %b (%02x %02x %02x %02x  %02x %02x %02x %02x)",
		$time, waddr, raddr, ir[11:0], ibus[7:0], reg_mbr.sel,
		mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7);

      nreset = 0;
      nfpram_fprom = 0;		// RAM
      ibus = 8'bzzzzzzzz;
      ir = 16'b0000_0000_0000_0000;
      waddr = 4'b0000;
      raddr = 4'b0000;
      nfpaext = 1'b1;

      status = "reset";

      #250 nreset = 1;

      // Read the first four power-on default registers. They should all be
      // 8'h00 in RAM mode (nfpram_fprom low), or 8'h80 in ROM mode
      // (nfpram_fprom high)
      status = "read power-on default MBN";
      #1000 waddr = 4'b0000;
      for (i = 0; i < 8 ; i = i + 1) begin
	 nfpram_fprom = i[0];
      	 ibus = 8'bzzzzzzzz;
      	 ir = 16'd0 | i[2:1];	       // address on IR
      	 #50 raddr = 5'b01111;	       // read_mbn
      	 #200 raddr = 5'b00000;	       // idle again
      end
      #1000;

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
	 #62.5 waddr = 5'b01111;	       // read_mbn
	 #62.5 waddr = 5'b00000;	       // idle again
      end
      #1000;

      // Then, let's read them back.
      status = "read MBN";
      #1000 waddr = 4'b0000;
      for (i = 0; i < 8 ; i = i + 1) begin
      	 ibus = 8'bzzzzzzzz;
      	 ir = 16'd0 | i;	       // address on IR
      	 #50 raddr = 5'b01111;	       // write_mbn
      	 #200 raddr = 5'b00000;	       // idle again
      end
      #1000;

      #1000 ir = 16'b0000_0100_0000_0000;
      status = "check raddr";
      for (i = 0; i < 32 ; i = i + 1) begin
      	 #100 raddr = i;
      end

      #1000 ir = 16'b0000_0100_0000_0000;
      status = "reference IR";
      for (i = 0; i < 32 ; i = i + 1) begin
      	 #100 ir = i;
      end

      // Try the write_ar_mb addresses.
      status = "reference AR:MBx";
      #1000 ir = 16'b1111_0100_0000_0000;
      raddr = 0;
      #1000 for (j = 5'b00100; j <= 5'b00111 ; j = j + 1) begin
      	 #250 waddr = j;
      end

      #1000 status="test AR:MBZ auto-index";

      // Try the index registers. This uses an instruction like TRAP I R &0xx
      // which should NOT select registers based on IR[2:0], just on WADDR.
      for (i = 5'b00100; i <= 5'b00111; i++) begin
      	 waddr = i;
      	 //5'b00111;
      	 for (j = 16'b0000_1100_0000_0000; j < 16'b0000_1111_1111_1111 ; j = j + 1) begin
      	    #25 ir = j;
	    // Temporarily drive the IBUS with the complement of the IR to
	    // prove that the register selection isn't influenced by this. If
	    // it were, MBn, n = ir[2:0] XOR 111 would be selected.
	    #25 ibus = j ^ 8'hff;
	    #50 ibus = 8'bzzzzzzzz;
      	 end;
      	 #1000;
      end; // for (i = 5'b00100; i <= 5b'00111; i++)

      #1000 $finish;

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
   reg 		default_values = 1'b1;
   reg [7:0] 	mbn[7:0];	// Snooped register values
   reg [7:0] 	correct_value1, correct_value2;
   reg [2:0] 	n;
   wire [17:0] 	waddr_and_ir;

   // MBn register snooping to facilitate further testing.
   always @(waddr, ir, ibus_real) begin
      if (waddr === 5'b01111) #30 begin
	 mbn[ir[2:0] ] = ibus_real[7:0];
	 // After the first MBR register is written to, the MBR is
	 // enabled. Default values are no longer put on AEXT.
	 if (ir[2:0] < 3'b100) default_values = 0;
      end

      //       waddr      ==? 5'b001??
      else if (waddr[4:2] == 3'b001) #100 begin
	 // write_agl_mbX decoding is complicated. The correct register to use
	 // is selected based on the exact write_agl_mb[pdsz] signal. In the
	 // case of the write_agl_mbz signal, auto-index locations are also
	 // decoded, but only if I=R=1.
	 casex ({waddr[1:0], ir})
	   { 2'b00, 16'b????_??_?????????? }: { n, correct_value1 } = { 3'd0, mb0 }; // write_agl_mbp;
	   { 2'b01, 16'b????_??_?????????? }: { n, correct_value1 } = { 3'd1, mb1 }; // write_agl_mbd;
	   { 2'b10, 16'b????_??_?????????? }: { n, correct_value1 } = { 3'd2, mb2 }; // write_agl_mbs;
	   { 2'b11, 16'b????_0?_?????????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
	   { 2'b11, 16'b????_10_?????????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
	   { 2'b11, 16'b????_11_0????????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
	   { 2'b11, 16'b????_11_10???????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
	   { 2'b11, 16'b????_11_11?????000 }: { n, correct_value1 } = { 3'd0, mb0 }; // write_agl_mbz: MB0 auto-index;
	   { 2'b11, 16'b????_11_11?????001 }: { n, correct_value1 } = { 3'd1, mb1 }; // write_agl_mbz: MB1 auto-index;
	   { 2'b11, 16'b????_11_11?????010 }: { n, correct_value1 } = { 3'd2, mb2 }; // write_agl_mbz: MB2 auto-index;
	   { 2'b11, 16'b????_11_11?????011 }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz: MB3 auto-index;
	   { 2'b11, 16'b????_11_11?????100 }: { n, correct_value1 } = { 3'd4, mb4 }; // write_agl_mbz: MB4 auto-index;
	   { 2'b11, 16'b????_11_11?????101 }: { n, correct_value1 } = { 3'd5, mb5 }; // write_agl_mbz: MB5 auto-index;
	   { 2'b11, 16'b????_11_11?????110 }: { n, correct_value1 } = { 3'd6, mb6 }; // write_agl_mbz: MB6 auto-index;
	   { 2'b11, 16'b????_11_11?????111 }: { n, correct_value1 } = { 3'd7, mb7 }; // write_agl_mbz: MB7 auto-index;
	 endcase // case ({waddr[1:0], ir})

	 if (aext !== correct_value1) begin
	    $sformat(msg, "waddr=%b, ir[11:0]=%b_%b, registered mb%1d=%02x, but aext=%02x",
		     waddr, ir[11:10], ir[9:0], n, correct_value1, aext);
	 end;

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK write");
      end // if (waddr[4:2] == 3'b001)
   end

   // Verify reading. We'll peer into the '670 to do this properly.
   always @ (raddr) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 if (raddr === 5'b01111) begin
	    // Snoop the MBn register to compare against later

	    if (default_values) begin
	       correct_value2 = { nfpram_fprom, 7'd0 };
	    end else begin
	       // The stupid way round
	       case (ir[2:0])
		 3'd0: correct_value2 = mb0;
		 3'd1: correct_value2 = mb1;
		 3'd2: correct_value2 = mb2;
		 3'd3: correct_value2 = mb3;
		 3'd4: correct_value2 = mb4;
		 3'd5: correct_value2 = mb5;
		 3'd6: correct_value2 = mb6;
		 3'd7: correct_value2 = mb7;
	       endcase
	    end // else: !if(default_values)

	    case (default_values)
	      1: if (ibus_real !== correct_value2) begin
		 $sformat(msg, "raddr=%b, n=%1d, registered mb%1d=%02x, but ibus=%04x",
			  raddr, ir[2:0], ir[2:0], correct_value2, ibus_real);
	      end
	      
	      0: if (ibus_real !== mbn[ir[2:0]] || ibus_real !== correct_value2) begin
		 $sformat(msg, "raddr=%b, n=%1d, snooped mb%1d=%02x, registered mb%1d=%02x, but ibus=%04x",
			  raddr, ir[2:0], ir[2:0], mbn[ir[2:0]], ir[2:0], correct_value2, ibus_real);
	      end

	    endcase // case (default_values)
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK read");
      end
   end

endmodule // reg_mbr_tb


// End of file.
