// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// GENERIC MACROS
//
///////////////////////////////////////////////////////////////////////////////

// We need quite a few macros on the CFT because of its simplicity

// Macro: INCMn (addr, n)
//
// Increment the value at addr by n.
//
// Warnings:
//   %addr must be page-local.
//   %n must be between &000 and &3ff.
//	
// Side effects:
//   mem[addr] += n
//   AC = mem[addr]
//   L
.macro INCMn (addr,n)
	LI %n
	ADD %addr
	STORE %addr
.end

// Macro: INCM (addr)
//
// Increment the value at addr by 1.
//
// Warnings:
//   %addr must be page-local.
//   %n must be between &000 and &3ff.
//	
// Side effects:
//   mem[addr]++
//   AC = mem[addr]
//   L
.macro INCM (addr)
	INCMn (%addr, %n)
.end

// Macro: DECMn (addr)
//
// Decrement the value at addr by one.
//
// Conditions:
//   %n must be 1, 2, or 3.
//
// Side effects:
//   mem[addr] -= n
//   AC = mem[addr]
//   L
.macro DECMn (addr, n)
	LOAD %addr
	ADD MINUS%n
	STORE %addr
.end

// Macro: DECM (addr)
//
// Decrement the value at addr by one.
//
// Side effects:
//   mem[addr]--
//   AC = mem[addr]
//   L
.macro DECM (addr)
	DECMn (%addr, 1)
.end


///////////////////////////////////////////////////////////////////////////////
//
// CALLING TRAPS
//
///////////////////////////////////////////////////////////////////////////////

.macro ROMTRAP1(trap, arg1)
.end

// End of file.
