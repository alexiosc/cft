`timescale 1ns/10ps

module test();

   reg d, inc;
   wire d1, d2, d3, pulse1, pulse2, pulse;
   
initial begin
     
     $display ("time\t d pulse");
     $monitor ("%g\t  %b %b %b %b", 
      	       $time, d, pulse1, pulse2, pulse);
     $dumpfile ("test.vcd");
     $dumpvars (0, test);

   d = 0;
   inc = 0;

   #400 inc = 1;
   #5000 inc = 0;

   #10000 $finish;
     
  end // initial begin

   always begin
     #500 d = ~d;
   end

   // Detect the rising edge.
   nand #8 u1 (d1, d, d);
   nand #8 u2 (pulse1, d, d1);

   // Detect the falling edge.
   nand #8 u3 (d2, d1, d1);
   nand #8 u4 (pulse2, d2, d1);

   // Combine the two edge detectors.
   nand #8 u5 (pulse3, pulse1, pulse2);

   // Only pulse when inc is high.
   nand #8 u6 (pulse4, inc, pulse3);
   nand #8 u7 (pulse, pulse4, pulse4);


   nand #10 ua (e1, d, d);
   nand #10 ub (e2, e1, e1);
   nand #10 uc (e3, e2, e2);
   nand #10 ud (e4, e3, e3);
   nand #10 ue (e5, e4, e4);
   nand #10 uf (test2, d, e5);
   

endmodule // tritest
