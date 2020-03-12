;; -*- cftasm -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 
;;; STACK MANIPULATION MACROS
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Please note: CFT stacks grow upwards.

;;; Macro: PUSH(stack)
;;;
;;; Push AC onto the stack pointed to by stack.
;;; 
;;; Warnings:	
;;;   No checks are performed.
;;;
;;; Preconditions:
;;;   Stack must be an autoincrement location.
;;;
;;; Side effects:
;;;   mem[%stack++] = AC
;;;
;;; Deprecation:
;;;   Legacy macro. Don't use in new code.

.macro PUSH (stack)
		PUSH %stack		; Legacy macro: mem[%stack++] <- AC
.endmacro


	
;;; Macro: RPUSH(stack, src)
;;;
;;; Push value of address src onto the stack pointed to by stack.
;;; 
;;; Preconditions:
;;;   Stack must be an autoincrement location.
;;;
;;; Warnings:	
;;;   No checks are performed.
;;; 
;;; Side effects:
;;;   mem[%stack++] = mem[%src]

.macro RPUSH (stack, src)
		LOAD %src		; RPUSH(%stack,%src)
		PUSH %stack
.endmacro


	
;;; Macro: LPUSH(stack, lit)
;;;
;;; Push literal value lit onto the stack pointed to by stack.
;;; 
;;; Preconditions:
;;;   Stack must be an autoincrement location.
;;;
;;; Warnings:	
;;;   No checks are performed.
;;; 
;;; Side effects:
;;;   mem[%stack++] = %lit

.macro LPUSH (stack, lit)
		LI %lit			; RPUSH(%stack,%lit)
		PUSH %stack		; mem[%stack++] <- AC
.endmacro


	
;;; Macro: POP (stack)
;;;
;;; Pop a value from a stack. Return it in AC.
;;;
;;; Warnings:
;;;   No checks are performed.
;;;
;;; Side effects:
;;;   %stack--
;;;   MTMP0 = %stack
;;;   AC = mem[MTMP0]
;;;
;;; Deprecation:
;;;   Legacy macro. Don't use in new code.
	
.macro POP (stack)
		POP %stack		; POP(%stack)
.endmacro


;;; Macro: RPOP (tgt, stack)
;;;
;;; Pop a value from a stack. Store it in tgt. The value is actually popped and
;;; then pushed onto the stack again, because this action is faster than the
;;; alternative.
;;;
;;; Warnings:
;;;   No checks are performed.
;;;
;;; Side effects:
;;;   %stack--
;;;   MTMP0 = %stack
;;;   AC = mem[MTMP0]
	
.macro RPOP (tgt, stack)
		POP %stack		; POP(%tgt, %stack)
		STORE %tgt
.endmacro


	
;;; Macro: PEEK (stack)
;;;
;;; Load the top value of a stack without popping.
;;;
;;; Warnings:
;;;   No checks are performed.
;;;
;;; Side effects:
;;;   AC = mem[%stack]
;;;   L
	
.macro PEEK (stack)
		POP %stack		; PEEK(%stack)
		PUSH %stack
.endmacro


	
;;; Macro: RPEEK (reg, stack)
;;;
;;; Save to register reg the value at the top of the specified stack.
;;;
;;; Warnings:
;;;   No checks are performed.
;;;
;;; Side effects:
;;;   AC = mem[MTMP0]
;;;   L
	
.macro RPEEK (reg, stack)
		POP %stack		; RPEEK(%reg, %stack)
		PUSH %stack
		STORE %reg
.endmacro


	
;;; Macro: PEEKn (stack)
;;;
;;; Load the n-th-from-the-top value of a stack without popping. The value of n
;;; must be in the region 1-6. n=1 indicates the second item from the top. The
;;; top item may be accessed faster using the plain PEEK() macro.
;;;
;;; Warnings:
;;;   No checks are performed.
;;;   n must be 1-6.
;;;
;;; Side effects:
;;;   MTMP0 = %stack - n
;;;   AC = mem[MTMP0]
;;;   L
	
.macro PEEKn (stack, n)
		LOAD %stack		; PEEKn(%stack, %n). Get stack pointer.
		ADD @MINUS%n+1		; Macro/register/memory map hackery!
		STORE MTMP0		; Store for indirection
		LOAD I MTMP0		; AC <- mem[%stack-1]
.endmacro


		
;;; Macro: POKE (stack)
;;;
;;; Directly modify the top value of a stack.
;;;
;;; Warnings:
;;;   No checks are performed.
;;;
;;; Side effects:
;;;   MTMP0 = %stack - 1
;;;   mem[MTMP0] = AC
;;;   TMP1 = AC
;;;   L
	
.macro POKE (stack)
		STORE MTMP0		; POKE(%stack)
		POP %stack		; Pop and discard
		LOAD MTMP0
		PUSH %stack
.endmacro


	
;;; Macro: POKEn (stack, n)
;;;
;;; Directly modify the n-th from the top value of a stack. The value of n must
;;; be in the region 1-6. n=1 indicates the second item from the top. The top
;;; item may be accessed faster using the plain PEEK() macro.
;;;
;;; Warnings:
;;;   No checks are performed.
;;;   n must be 1, 2, or 3.
;;;
;;; Side effects:
;;;   MTMP0 = %stack - 1
;;;   mem[MTMP0] = AC
;;;   TMP1 = AC
;;;   L
	
.macro POKEn (stack, n)
		STORE MTMP1		; POKEn(%stack, %n). Keep a copy of AC.
		LOAD %stack		; Find [%stack-1]
		ADD @MINUS%n+1		; Macro/register/memory map hackery!
		STORE MTMP0		; Store for indirection
		LOAD TMP1		; Get initial AC again
		STORE I MTMP0		; mem[%stack-1] <- AC
.endmacro

	
	
;;; Macro: DROPn (stack, n)
;;;
;;; Drop the top 1-7 values from the stack.
;;;
;;; Warnings:
;;;   No checks are performed.
;;;
;;; Side effects:
;;;   mem[sp] -= n
;;;   AC = mem[sp]
;;;   L

.macro DROPn (stack, n)
		LOAD %stack		; DROPn(%stack, %n)
		ADD @MINUS%n
		STORE %stack
.endmacro

	

;;; Macro: DROP (stack)
;;;
;;; Drop the top value from the stack.
;;;
;;; Warnings:
;;;   No checks are performed.
;;;
;;; Side effects:
;;;   mem[sp] -= n
;;;   AC = mem[sp]
;;;   L

.macro DROP (stack)
	POP %stack			; DROP(%stack, %n)
.endmacro

	

;;; End of file.
		