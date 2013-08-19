// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// MEMORY SUBROUTINES
//
///////////////////////////////////////////////////////////////////////////////

// TRAP: memcpy(dst, src, count)
//
// Copy count words from src to dst.
//
// Setup:
//   ARGP points to start of argument block.
//   [ARGP+00]: dst address
//   [ARGP+01]: src address
//   [ARGP+02]: count
	
_trap_memcpy:
	LOAD I ARGP
	STORE TI0		; dst address
	LOAD I ARGP
	STORE TI1		; src address

	LOAD I ARGP
	NEG
	STORE TR1		; src address
	
_trap_memcpy_loop:
	LOAD I TI1		; load source (autoinc)
	STORE I TI0		; store dest (autoinc)
	ISZ TR1			; loop
	JMP _trap_memcpy_loop
	RTT


// TRAP: memrcpy(dst, src, count)
//
// Copy count words from src to dst.
//
// Copies starting at src + count - 1 and moving backwards until src is
// reached. Much slower than memcpy but it's useful for some moves in
// overlapping regions.
//
// Setup:
//   ARGP points to start of argument block.
//   [ARGP+00]: dst address
//   [ARGP+01]: src address
//   [ARGP+02]: count
	
_trap_memrcpy:
	LOAD I ARGP
	STORE TR0		; dst address
	LOAD I ARGP
	STORE TR1		; src address

	LOAD I ARGP
	STORE TR3
	DEC
	STORE TR2		; count - 1

	ADD TR0			; dst += count - 1
	STORE TR0

	LOAD TR2		; src += count - 1
	ADD TR1
	STORE TR1

	LOAD TR3
	NEG
	STORE TR2		; TR2 = -count
	
_trap_memrcpy_loop:
	LOAD I TR1		; load source (autoinc)
	STORE I TI0		; store dest (autoinc)

	LOAD TR1		; src--
	DEC
	STORE TR1

	LOAD TR0		; dst--
	DEC
	STORE TR0

	ISZ TR1			; loop while count > 0
	JMP _trap_memrcpy_loop
	RTT

// End of file.
