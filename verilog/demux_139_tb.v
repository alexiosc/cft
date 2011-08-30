`include "demux.v"
`timescale 1ns/10ps

module demux_139_tb();

// Declare inputs as regs and outputs as wires
   reg [1:0]  a1, a2;
   reg 	      g1, g2;
   wire [3:0] y1, y2;

   integer    i, j;

   // Initialize all variables
   initial begin        
      $display ("time\tg1 a1 y1    g2 a2 y2");	
      $monitor ("%g\t %b %b %b %b %b %b", 
		$time, g1, a1, y1, g2, a2, y2);
      $dumpfile ("vcd/demux_139_tb.vcd");
      $dumpvars (0, demux_139_tb);

      g1 = 1;
      g2 = 1;
      a1 = 0;
      a2 = 0;

      #100 g1 = 0;
      #100 g2 = 0;
      #100 g1 = 1;
      #100 g1 = 1;
      #100 g1 = 0;
      g2 = 0;

      for (i = 0; i < 4; i = i + 1) begin
	 for (j = 0; j < 4; j = j + 1) begin
	    #100 begin
	       a1 = i;
	       a2 = j;
	    end
	 end
      end

      #100 g1 = 1;
      g2 = 1;

      #200 $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   demux_139 demux (g1, a1, y1, g2, a2, y2);

endmodule
