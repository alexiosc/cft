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




// Macro: LOADUP0(reg, ofs)
//
// Store at location %reg the address of user variable with offset %ofs.
//
// Side effects:
//   A = value from user area
//   L
//   TMP0 = address of user variable

.macro LOADUP0(reg, ofs)
	LI %ofs			; LOADUP(%reg, %ofs)
	ADD UP
	STORE %reg
.end




// Macro: LOADUP(ofs)
//
// Read the value at UP+ofs, where UP is the user area pointer.
//
// Side effects:
//   A = value from user area
//   L
//   TMP0 = offset address in user area

.macro LOADUP(ofs)
	LOADUP0(TMP0, %ofs)	; LOADUP(%ofs)
	LOAD I TMP0
.end



// Macro: STOREUP(ofs, reg)
//
// Store the value of %reg at location UP+ofs, where UP is the
// user area pointer.
//
// Side effects:
//   A = value of %reg
//   L
//   TMP0 = offset address in user area

.macro STOREUP(ofs, reg)
	LI %ofs			; STOREUP(%ofs, %reg)
	ADD UP
	STORE TMP0
	STOREUP0(%reg)
.end



// Macro: LSTOREUP(ofs, val)
//
// Store the literal 10-bit value %val at location UP+ofs, where UP is the
// user area pointer.
//
// Side effects:
//   A = value of %val
//   L
//   TMP0 = offset address in user area

.macro LSTOREUP(ofs, val)
	LI %ofs			; STOREUP(%ofs, %val)
	ADD UP
	STORE TMP0
	LI %val
	STORE I TMP0
.end


	
// Macro: STOREUP0(ofs, reg)
//
// Store the value of %reg at the last UP+ofs location (stored in TMP0), where
// UP is the user area pointer. This is expected to be used shortly after
// LOADUP(). If you have doubts about the value of TMP0 having been unchanged,
// please use STOREUP() instead.
//
// Side effects:
//   A = value of %reg

.macro STOREUP0(reg)
	LOAD %reg		; STORE0(%reg)
	STORE I TMP0
.end

// End of file.
