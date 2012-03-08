`include "int.v"
`include "register.v"

`timescale 10ns/10ps

module int_tb();
   reg  nreset, nsti, ncli, nend, nirq;
   wire fint, firq, nirqs;

   integer i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/int_tb.vcd");
      $dumpvars (0, int_tb);

      nreset = 0;
      nsti = 1;
      ncli = 1;
      nend = 1;
      nirq = 1;

      // Reset
      #250 nreset = 1;

      // Allow interrupts.
      #500 nsti = 0;
      #63 nsti = 1;

      // Signal an interrupt.
      #500 nirq = 0;
      #63 nirq = 1;

      // End of the instruction. The interrupt flag is taken to the
      // microcode sequencer.
      #500 nend = 0;
      #63 nend = 1;

      // The interrupt handling microprogram is entered at this point.

      // The microcode sequencer clears interrupts via CLI# (which
      // also clears the IRQS# flag).
      #500 ncli = 0;
      #63 ncli = 1;

      // And the interrupt handling microprogram ends. IRQS# is
      // deasserted.
      #500 nend = 0;
      #63 nend = 1;




      // Show masking of interrupts.

      #3000 nreset = 0;
      #250 nreset = 1;

      // Signal multiple interrupts (which should be ignored).
      for (i = 0; i < 10; i = i + 1) begin
	 #500 nirq = 0;
	 #63 nirq = 1;
      end

      // Nothing should happen.
      
      // Allow interrupts and try again.
      #500 nsti = 0;
      #63 nsti = 1;
      #500 nirq = 0;
      #63 nirq = 1;
      #500 nend = 0;
      #63 nend = 1;
      #500 ncli = 0;
      #63 ncli = 1;
      #500 nend = 0;
      #63 nend = 1;




      // What happens if an interrupt arrives during the interrupt-handling
      // microprogram? Two cases:
      //      
      // 1. If it arrives before CLI# assertion, no new event is
      // generated. BUT: we're entering the ISR anyway, and it should check all
      // interrupt sources anywyay. The interrupt isn't lost.
      //
      // 2. If it arrives after CLI#, the interrupt is ignored. If the device
      // signals in the suggested way (assert IRQ# until IRQS# is asserted),
      // the interrupt is not lost, but will be signalled immediately after
      // STI# is asserted.

      #3000 nreset = 0;
      #250 nreset = 1;
      #500 nsti = 0;
      #63 nsti = 1;
      #500 nirq = 0;
      #63 nirq = 1;
      #500 nend = 0;
      #63 nend = 1;
      #500 ncli = 0;
      #63 ncli = 1;
      #500 nirq = 0;
      #63 nirq = 1;
      #500 nend = 0;
      #63 nend = 1;
      

      // A demonstration of the 'toggle' issue (which is why CLI# must be
      // asserted in the first microprogram after IRQS# is asserted.

      #3000 nreset = 0;
      #250 nreset = 1;
      
      // Allow interrupts.
      #3000 nsti = 0;
      #63 nsti = 1;

      // Signal an interrupt.
      #500 nirq = 0;
      #63 nirq = 1;
      
      // Demonstrate toggling behaviour if CLI# is not asserted before END#:
      for (i = 0; i < 10; i = i + 1) begin
	 #500 nend = 0;
	 #63 nend = 1;
      end

      #1000 $finish;      // Terminate simulation
   end // initial begin

   intsm int_unit (nreset, nsti, ncli, nend, nirq, fint, firq, nirqs);

endmodule
