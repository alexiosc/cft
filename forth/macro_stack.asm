// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// STACK MACROS
//
///////////////////////////////////////////////////////////////////////////////

// Please note: CFT stacks grow upwards.

// Macro: PUSH(stack)
//
// Stack must be an autoincrement location.
// Push AC onto the stack pointed to by stack. No checks are
// performed.

.macro PUSH (stack)
	PUSH %stack		; Legacy macro: mem[%stack++] <- AC
.end


	
// Macro: RPUSH(stack, src)
//
// Stack must be an autoincrement location.
// Push value of address src onto the stack pointed to by stack.
// No checks are performed.

.macro RPUSH (stack, src)
	LOAD %src		; RPUSH(%stack,%src)
	PUSH %stack
.end


	
// Macro: LPUSH(stack, lit)
//
// Stack must be an autoincrement location.
// Push literal value lit onto the stack pointed to by stack.
// No checks are performed.

.macro LPUSH (stack, lit)
	LI %lit			; RPUSH(%stack,%lit)
	PUSH %stack		; mem[%stack++] <- AC
.end


	
// Macro: POP0 (stack)
//
// Decrement a stack pointer. Save a the location of the top item in TMP0.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   %stack--
//   TMP0 = %stack
//   L
	
;; .macro POP0 (stack)
;; 	DECM (%stack)		; POP0(%stack): %stack--
;; 	STORE TMP0		; Store it elsewhere to avoid autoincrement.
;; 	;; // Microcode 6
;; 	;; POP %stack
;; .end


	
// Macro: POP (stack)
//
// Pop a value from a stack. Return it in AC.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   %stack--
//   TMP0 = %stack
//   AC = mem[TMP0]
	
.macro POP (stack)
	;; POP0 (%stack)
	;; LOAD I TMP0		; And load value from stack
	POP %stack
	//STORE TMP0
.end


	
// Macro: RPOP (tgt, stack)
//
// Pop a value from a stack. Store it in tgt.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   %stack--
//   TMP0 = %stack
//   AC = mem[TMP0]
	
.macro RPOP (tgt, stack)
	                     ; POP(%tgt, %stack)
	;; POP0 (%stack)
	;; LOAD I TMP0		; And load value from stack
	;; STORE %tgt

	POP %stack
	STORE %tgt
.end


	
;; // Macro: SPEEK0 (stack)
;; //
;; // Calculate the offset of the top value of a stack and store it in TMP0.
;; //
;; // Warnings:
;; //   No checks are performed.
;; //
;; // Side effects:
;; //   TMP0 = %stack - 1
;; //   AC = TMP0
;; //   L

;; .macro SPEEK0 (stack)
;; 	;; LOAD %stack		; SPEEK0(%stacK)
;; 	;; ADD MINUS1
;; 	;; STORE TMP0		; Store for indirection
;;         // POP & Push is actually 33% faster than the old way.
;; 	POP %stack
;; 	PUSH %stack
;; .end


	
// Macro: SPEEK (stack)
//
// Load the top value of a stack without popping.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   AC = mem[TMP0]
//   L
	
.macro SPEEK (stack)
        // POP & Push is actually 33% faster than the old way (using PEEK0)
	POP %stack
	PUSH %stack
.end


	
// Macro: RPEEK (reg, stack)
//
// Save to register reg the value at the top of the specified stack.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   AC = mem[TMP0]
//   L
	
.macro RPEEK (reg, stack)
        // POP & PUSH is actually 33% faster than the old way (using PEEK0)
	POP %stack		; RPEEK(%reg, %stack)
	PUSH %stack
	STORE %reg
.end


	
// Macro: SPEEKn (stack)
//
// Load the n-th-from-the-top value of a stack without popping.
//
// Warnings:
//   No checks are performed.
//   n must be 1, 2 or 3.
//
// Side effects:
//   TMP0 = %stack - n
//   AC = mem[TMP0]
//   L
	
.macro SPEEKn (stack, n)
	LOAD %stack		; Find [%stack-1]
	ADD MINUS%n
	STORE TMP0		; Store for indirection
	LOAD I TMP0		; AC <- mem[%stack-1]
.end


	
// Macro: SPOKE (stack)
//
// Directly modify the top value of a stack.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   TMP0 = %stack - 1
//   mem[TMP0] = AC
//   TMP1 = AC
//   L
	
.macro SPOKE (stack)
	;; STORE TMP1		; Keep a copy of AC
	;; LOAD %stack		; Find [%stack-1]
	;; ADD MINUS1
	;; STORE TMP0		; Store for indirection
	;; LOAD TMP1		; Get initial AC again
	;; STORE I TMP0		; mem[%stack-1] <- AC

	// With Microcode v6, this is much simpler (and 2/3 the size)
	STORE TMP0
	POP %stack		; Pop and discard
	LOAD TMP0
	PUSH %stack
.end


	
// Macro: SPOKE0 (stack)
//
// Directly modify the top value of a stack.
//
// Preconditions:
//
//   MUST come after SPEEK(stack) and TMP0 MUST NOT be modified.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   mem[TMP0] = AC
	
.macro SPOKE0 (stack)
	STORE I TMP0		; mem[%stack-1] <- AC
.end


	
// Macro: SPOKEn (stack, n)
//
// Directly modify the top value of a stack.
//
// Warnings:
//   No checks are performed.
//   n must be 1, 2, or 3.
//
// Side effects:
//   TMP0 = %stack - 1
//   mem[TMP0] = AC
//   TMP1 = AC
//   L
	
.macro SPOKEn (stack, n)
	STORE TMP1		; Keep a copy of AC
	LOAD %stack		; Find [%stack-1]
	ADD MINUS%n
	STORE TMP0		; Store for indirection
	LOAD TMP1		; Get initial AC again
	STORE I TMP0		; mem[%stack-1] <- AC
.end

	
	
// Macro: POP1PEEK1 (stack)
//
// Prepare for a Forth binary op. The op would pop two values, operate
// on them, and push the result at the end. Instead, we pop one value,
// and peek the other one. The TOP of the stack is returned in AC. The
// second top-most value (first pushed) is in TMP1. TMP0 points to the
// now-topmost value of the stack.
//
// Warnings:
//   No checks are performed.
//   This must be used in conjunction with POKE0().
//
// Side effects:
//   TMP0 = %stack - 1
//   TMP1 = first pop()
//   AC = second pop() (actually the peek)
//   L
	
;; .macro POP1PEEK1 (stack)
;; 	POP %stack
;; 	STORE TMP2
;; 	SPEEK (%stack)
;; 	STORE TMP1
;; 	LOAD TMP2
;; .end

	

// Macro: POP1PEEK1R (stack)
//
// Prepare for a Forth binary op. The op would pop two values, operate
// on them, and push the result at the end. Instead, we pop one value,
// and peek the other one. The TOP of the stack is returned in AC. The
// second top-most value (first pushed) is in TMP1. TMP0 points to the
// now-topmost value of the stack.
//
// Warnings:
//   No checks are performed.
//   This must be used in conjunction with POKE0().
//
// Side effects:
//   TMP0 = %stack - 1
//   TMP1 = first pop()
//   AC = second pop() (actually the peek)
//   L
;; .macro POP1PEEK1R (stack)
;; 	POP %stack
;; 	STORE TMP1
;; 	SPEEK (%stack)
;; 	STORE TMP2
;; .end

	

// Macro: POP2 (stack)
//
// Prepare for a Forth binary op. The op would pop two values and push
// nothing. The first value is in AC, the second in TMP0.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   TMP0 = first pop (%stack - 1)
//   TMP2 = second pop (%stack - 2)
//   AC = first pop()
//   TMP1 = second pop()
//   L
;; .macro POP2 (stack)
;; 	;; LOAD %stack		; POP1PEEK1(%stack)
;; 	;; ADD MINUS1
;; 	;; STORE TMP0		; TMP0 <- %stack-1

;; 	;; ADD MINUS1
;; 	;; STORE TMP2		; TMP2 <- %stack-2
;; 	;; STORE %stack

;; 	;; LOAD I TMP0
;; 	;; STORE TMP1

;; 	;; LOAD I TMP2

;; .end

	

// Macro: POP2r (stack)
//
// Prepare for a Forth binary op. The op would pop two values and push
// nothing. The first value is in TMP1, the second in AC. Useful for
// indirection in Forth ( w a -- ) words.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   TMP0 = %stack - 1
//   TMP2 = %stack - 2
//   TMP1 = a (first pop())
//   AC = w (second pop())
//   L
;; .macro POP2r (stack)
;; 	LOAD %stack		; POP2(%stack)
;; 	ADD MINUS1
;; 	STORE TMP0		; TMP0 <- %stack-1

;; 	ADD MINUS1
;; 	STORE TMP2		; TMP2 <- %stack-2
;; 	STORE %stack

;; 	RMOV(TMP1, I TMP2)

;; 	LOAD I TMP0
;; .end

	

// Macro: SDROPn (stack, n)
//
// Drop the top 1, 2, or 3 values from the stack.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   mem[sp] -= n
//   AC = mem[sp]
//   L
.macro SDROPn (stack, n)
	RADD(%stack, %stack, MINUS%n)
.end

	

// Macro: SDROP (stack)
//
// Drop the top value from the stack.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   mem[sp] -= n
//   AC = mem[sp]
//   L
;; .macro SDROP (stack)
;; 	//SDROPn(%stack, 1)
;; 	POP %stack
;; .end

	

// End of file.
