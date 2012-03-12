// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// STRING SUBROUTINES
//
///////////////////////////////////////////////////////////////////////////////

&f000:

// TRAP: strpack(dst, src)
//
// Pack null-terminated source string to destination.
//
// The source string is a word-packed (16 bits per character) string,
// terminated with a null (&0000). The destination is a byte-packed (8
// bits per character) string, terminated with an 8-bit null. The
// first character is copied to the LSB of the destination. The
// second is copied to the MSB, and this alternates.
//
// If the length of the source string is n words (chars) including the
// terminator, the length of the destination string is ceil(n / 2),
// producing a much more compact representation. A welcome side effect
// is that such strings are also compatible with byte-oriented machines.
//	
// Setup:
//   ARGP points to start of argument block.
//   [ARGP+00]: dst address
//   [ARGP+01]: src address
//	
// Returns:
//   AC: last dst address used + 1
//	
// Side effects:
//   ARGP += 2	
//   [ARGP-02]: last dst address used + 1
//   [ARGP-01]: last src address used + 1
	
_trap_strpack:
	LOAD I ARGP
	STORE TR0		; dst address
	LOAD I ARGP
	STORE TI0		; src address
	
_trap_strpack_loop:
	LOAD I TI0		; Low byte
        STORE I TR0
	PRINTC
        SNZ			; Done?
        JMP _trap_strpack_end	; Yes

        LOAD I TI0		; High byte
        AND BYTELO		; Shift 8 bits left
	PRINTC
        RNL
        RNL
        SNZ			; Done?
        JMP _trap_strpack_end	; Yes

        OR I TR0		; Combine the two bytes
        STORE I TR0

        ISZ TR0			; Increment TR0. Should never skip.

        JMP _trap_strpack_loop	; Loop again

_trap_strpack_end:
        STORE I TR0		; Store the last word
	ISZ TR0			; Return last 

	RTT



// TRAP: strplen(s)
//
// Returns the length (in characters and, indirectly, words) of a
// packed string.
//
// The number of characters of the string is returned in AC. The
// terminating null is not included in the count.
//
// Setup:
//   ARGP points to start of argument block.
//   [ARGP+00]: s address
//	
// Returns:
//   AC: length in characters (excluding terminator)
//	
// Side effects:
//   ARGP += 1
//   [ARGP-01]: last string address used + 1
	
_trap_strplen:
	LOAD I ARGP
	STORE TI0
	LI 0
	STORE TR0

_trap_strplen_loop:
	LOAD I TI0
	SNZ			; Terminator?
	JMP _trap_strplen_end1	; Done.

	AND BYTEHI		; Check the high 8 bits
	SNZ			; Terminator?
	JMP _trap_strplen_end	; Done

	LI 2
	ADD TR0
	STORE TR0		; TR0 += 2

	JMP _trap_strplen_loop	; Again
	
_trap_strplen_end:
	ISZ TR0			; TR0 += 1
	RTT
	
_trap_strplen_end1:
	LOAD TR0
	RTT



// End of file.
	
