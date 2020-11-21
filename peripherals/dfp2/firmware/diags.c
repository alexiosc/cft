// -*- c -*-


///////////////////////////////////////////////////////////////////////////////
//
// DIAGNOSTICS
//
///////////////////////////////////////////////////////////////////////////////

#include "dfp.h"

/*

  Diagnostics needed:

  Ensure bus is quiescent.
  => Milestone: if a processor is present, it's halted.

  Control Vector tests:
    RADDR tristates.
    RADDR drives.
    WADDR tristates.
    WADDR drives.
    ACTION tristates.
    ACTION drives.
    IBUS tristates.
    IBUS drives.
    MEM# tristates.
    MEM# drives.
    IO# tristates.
    IO# drives.
    R# tristates.
    R# drives.
    W# tristates.
    W# drives.
    FPD health. (scan through addresses, FPD should change)
  => Milestone: we now have control of the Control Bus.

  Detect Processor Boards:
    Detect CTL board via FPD.
    Detect ALU board via RADDR: check B reg for read/write
    Detect REG board via FPD.
    Detect BUS board via RADDR/Bus.
  => Milestone: we now know what parts of the processor are present.

  
  


 */




// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
