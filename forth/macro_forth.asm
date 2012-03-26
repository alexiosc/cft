// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// MACROS USEFUL FOR FORTH CODING
//
///////////////////////////////////////////////////////////////////////////////


	
// Macro: doLIT(n)
//
// Compiles a doLIT word and its associated literal. Useful in putting literal
// values (or string addresses) on the stack in hand-compiled Forth.
//
// Side effects:
//   None.	

.macro doLIT(n)
	.word dw_doLIT		; doLIT(%n)
	.word %n
.end



// Macro: doCHAR(c)
//
// Compiles a doLIT word with a character literal. Useful in putting single
// character codepoints on the stack.
//
// Side effects:
//   None.	

.macro doCHAR(c)
	.word dw_doLIT		; doLIT(%c)
	.str %c
.end

// End of file.
