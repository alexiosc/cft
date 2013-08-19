`include "agl.v"
`timescale 1ns/10ps

module agl_tb();
   localparam DELTA = 21553;

   // Declare inputs as regs and outputs as wires
   reg [15:0] ir, pc;
   reg 	      nragl, nend;

   wire       ir10;
   
   wire [15:0] ibus, pagebase;

   integer     i, j;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/agl_tb.vcd");
      $dumpvars (0, agl_tb);

      ir = 0;
      pc = 0;
      nragl = 0;
      nend = 1;

      j = 0;
      for (i = 0; i < 100 ; i = i + 1) begin
	 j = (j + DELTA) & 65535;
	 #100 pc = j;
	 ir = (j & 1023) | 1024;
	 #100 ir = j & 1023;
      end

      #2000 $finish;      // Terminate simulation
   end

   assign ir10 = ir[10];
   assign pagebase = {agl_unit.page, 10'd0};
   
   always begin
      #2000 nend = 0;
      #100 nend = 1;
   end

   always begin
      #634 nragl = ~nragl;
   end

   agl agl_unit (ir, pc, nragl, nend, ibus);
endmodule
