`include "video.v"
`timescale 1ns/10ps

module video_paddr_tb();

   reg 	       nstartsl, ncellclk, nlastsl, nframe;
   reg 	       sa;
   wire [15:0] sa_real, dbus, pac, pa;
   
   integer   i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/video_paddr_tb.vcd");
      $dumpvars (0, video_paddr_tb);

      sa = 16'h1234;
      nframe = 1;
      nstartsl = 1;
      ncellclk = 1;
      nlastsl = 1;

      #400000 $finish;      // Terminate simulation
   end // initial begin

   always begin
      #160 ncellclk = 0;
      #160 ncellclk = 1;
   end

   // 20-column rows
   always begin
      #6400 nstartsl = 0;
      i = i + 1;
      #6400 nstartsl = 1;
   ednd
   always begin
      #12800 nlastsl = 0;
      #12800 nlastsl = 1;
   end

   // 5-row frames
   always begin
      #16000 nframe = 0;
      i = i + 1;
      #16000 nframe = 1;
   end

   assign sa_real = sa;

   // nphen: PHEN#, Plane to Host enable (IBUS addresses planes)
   // phen:  PHEN, active low, Plane to Host *DISABLE*
   // nstartsl: STARTSL#, active low start scanline.
   // ncellclk: CELLCLK#, 8-pixel clock
   // nlastsl: LASTSL#, last scanline of row.
   // nframe: FRAME#, start of frame.
   // nwrap: WRAP#, hardware scroll wrap-around.
   // dbus: DBUS.
   // pac: Plane Address Count (fed back to the hardware scroll unit).
   // pa: Plane Address (fed to the plane SRAM).
   // sa: Start Address (from hw scroll unit).
   
   // module PlaneAddress(nphen, phen, nstartsl, ncellclk, nlastsl, nframe, nwrap, dbus, pac, sa, pa);

   PlaneAddress paddr (1, 0, nstartsl, ncellclk, nlastsl, nframe, 1, pac, sa_real, dbus, pa);
endmodule
