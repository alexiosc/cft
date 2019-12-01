// -*- indent-c++ -*-


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
  => Milestone: we now have control of the Control Bus.

  Detect Processor Boards:
    Detect CTL board via RADDR.
    Detect ALU board via RADDR.
    Detect REG board via RADDR.
    Detect BUS board via RADDR/Bus.
  => Milestone: we now know what parts of the processor are present.

  
  


 */

errno_t
run_diags()
{
	
}


// End of file.
