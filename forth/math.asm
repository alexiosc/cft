//////////////////////////////////////////////////////////////////////////////
//
// Memory routines
//
///////////////////////////////////////////////////////////////////////////////


	;; twos-complement of a 32-bit integer
	;; Inputs:
	;;   TR0 = high word of a
	;;   TR1 = low word of a
	;; Output:
	;;   TR0 = high word of -a
	;;   TR1 = low word of -a

_rom_neg32:
	LOAD TR0
	NOT
	STORE TR0
	
	LOAD TR1		; Low order word (easy)
	NEG
	STORE TR1
	
	SZA			; If A == 0, there was carry
	RTT			; Otherwise, return.

	LOAD TR0		; Increment TR0
	INC
	STORE TR0
	RTT


	
	;; 32-bit integer addition
	;; Inputs:
	;;   TR0 = high word of a
	;;   TR1 = low word of a
	;;   TR2 = high word of b
	;;   TR3 = low word of b
	;; Output:
	;;   TR0 = high word of sum
	;;   TR1 = low word of sum

_rom_add32:
	;; Add b to prod with carry.
	LOAD TR1		; low word of a
	ADD TR3			; low word of b
	STORE TR1		; store it

	LOAD TR0		; high word of b
	SCL			; Skip if no carry
	INC			;   if carry set, increase
	ADD TR2			; high word of prod
	STORE TR0

	RTT


	
	;; A 16-bit unsigned division routine found at
	;; http://www.bearcave.com/software/divide.htm.
	;; Inputs:
	;;   TR0 = dividend
	;;   TR1 = divisor
	;; Output:
	;;   TR0 = remainder
	;;   TR2 = quotient
	;;   errno = ERR_SUCCESS => division by zero.
	;;   errno = ERR_DIV0 => division by zero.

_rom_div16:
	LI	0
	STORE 	TR2		; Quotient = 0
	
	LOAD 	TR1		; divisor == 0?
	SNZ
	JMP	div_by0		; yes: return division by zero

	NEG
	ADD	TR0		; divident - divisor
	SNN			; divident < divisor?
	JMP	div_q0		; yes: quotient is zero

	SNZ			; divident == divisor?
	JMP	div_q1		; yes: quotient is one.

	;;  Out of luck with shortcuts. We'll have to do actual work now.

	;; Step one: shift divisor left while it's less than the
	;; divident.

	LI	1
	STORE 	R31		; Keep track of how many shifts we've done.
step1:
	LOAD	R31
	CLL RBL			; A <<= 1
	STORE	R31
	LOAD	TR1
	CLL RBL			; Shift left 1.
	//PRINTB
	STORE	TR1
	
	NEG
	ADD	TR0		; TR0 - R11
	SNA			; 
	JMP	step1

	;; Negate the last roll to make sure the divisor is less than
	;; the divident.
	LOAD	R31
	RBR
	STORE 	R31
	LOAD	TR1
	CLL RBR
	STORE	TR1
	//PRINTB

	;; Step two: repeated subtractions.
step2:
	LOAD	TR1
	NEG
	ADD	TR0		; TR0 - R11
	SPA
	JMP	step2_ng
	
	STORE 	TR0		; TR0 = TR0 - R11
	
	LOAD 	R31		; Load shift amount
	ADD	TR2		; Add to quotient
	STORE	TR2		; Store quotient

step2_ng:

	LOAD 	TR1		; Shift the divisor right.
	RBR
	STORE	TR1

	LOAD 	R31
	RBR			; Shift the mask right.
	STORE 	R31
	//PRINTB
	SZA
	JMP	step2

	RTT

div_by0:
	LI  	ERR_DIV0	; Yes.
	STORE	R errno		; errno = ERR_DIV0
	RTT			; return

div_q0:
	LI	0		; Quotient = 0
	STORE	TR2
	LOAD	TR0		; Remainder = divident
	STORE 	TR3
	RTT
	
div_q1:
	LI	1		; Quotient = 1
	STORE	TR2
	LI	0		; Remainder = 0
	STORE 	TR3
	RTT




	;; 16-bit unsigned integer multiplication
	;; Inputs:
	;;   TR0 = a
	;;   TR1 = b
	;; 
	;; Output:
	;;   TR2 = product
	;;
	;; Clobbers: TR0 TR1 TR2 R31
	;; Algorithm:
	;; sum = 0
	;; while a >= 1:
	;;   if a & 1:
	;;     sum += b
	;;   print "%5d %5d %5d" % (a, b, s)
	;;   a = a >> 1
	;;   b = b << 1


_rom_mul16:
	LI 0
	STORE TR2		; TR2 = product = 0

	;; Stop here if a == 0 or b == 0
	LOAD TR0		; a == 0?
	SNZ
	RTT			; Yes. Return.
	LOAD TR1		; b == 0?
	SNZ
	RTT			; Yes. Return.

	;; Use the smallest number as the multiplicand. This saves loop
	;; iterations.
	LOAD TR1		; TR0 > TR1?
	NEG
	ADD TR0
	SNA
	JMP _rom_mul16_swap	; Yes: swap them.
	JMP _rom_mul16_loop

_rom_mul16_swap:
	LOAD TR0		; R31 = TR0
	STORE R31
	LOAD TR1		; TR0 = TR1
	STORE TR0
	LOAD R31		; TR1 = R31
	STORE TR1
	
_rom_mul16_loop:
	LOAD TR0
	//PRINTB

	AND PLUS1		; a & 1 == 0?
	SNZ
	JMP _rom_mul16_noadd

	LOAD TR1		; prod += b
	ADD TR2
	STORE TR2

_rom_mul16_noadd:
	LOAD TR1		; b <<= 1
	CLL RBL
	STORE TR1

	LOAD TR0		; a >>= 1
	CLL RBR
	STORE TR0

	SNZ			; A == 0?
	RTT			; Then we're done.

	JMP _rom_mul16_loop	; Loop again



	;; 16-bit signed integer multiplication
	;; Inputs:
	;;   TR0 = a
	;;   TR1 = b
	;; 
	;; Output:
	;;   TR2 = product
	;; 
	;; Algorithm:
	;;
	;;   If TR0 and TR1 have different signs (BIT15):
	;;     Run mul16
	;;     negate result
	;;   else:
	;;     Run mul16

;; _rom_imul16:
;; 	LOAD TR0		; Compare sign bits of TR0 and TR1
;; 	XOR TR1
;; 	AND BIT15

;; 	SNZ
;; 	JMP _rom_mul16		; Same sign. Just run mul16

;; 	;; Different sign. Run mul16 and negate its result.
;; 	LOAD TRAPRET
;; 	STORE R30		; store trap return address
;; 	TRAP _rom_mul16

;; 	LOAD TR2		; Negate product
;; 	//NEG
;; 	STORE TR2

;; 	JMP I R30		; RTT to original return address

	
	;; 32-bit unsigned integer multiplication
	;; Inputs:
	;;   TR0 = high word of a
	;;   TR1 = low word of a
	;;   TR2 = high word of b
	;;   TR3 = low word of b
	;; 
	;; Output:
	;;   R30 = high word of product
	;;   R29 = low word of product
	;; 
	;; Algorithm:
	;; sum = 0
	;; while a >= 1:
	;;   if a & 1:
	;;     sum += b
	;;   print "%5d %5d %5d" % (a, b, s)
	;;   a = a >> 1
	;;   b = b << 1


_rom_mul32:
	LI 0
	STORE R30 		; product = 0
	STORE R29 		; product = 0

	LOAD TR0		; stop here if a == 0
	OR TR1
	SNZ
	RTT
	LOAD TR2		; stop here if b ==0
	OR TR3
	SNZ
	RTT

_rom_mul32_loop:
	LOAD TR1		; low word of a
	AND PLUS1		; a & 1 == 0?
	SNZ
	JMP _rom_mul32_noadd

	;; Add b to prod with carry.
	LOAD TR3		; low word of b
	ADD R30			; low word of prod
	STORE R30		; store it

	LOAD TR2		; high word of b
	SCL			; Skip if no carry
	INC			;   if carry set, increase
	ADD R29			; low word of prod
	STORE R29

_rom_mul32_noadd:
	LOAD TR3		; b <<= 1
	CLL RBL			; shift
	STORE TR3
	LOAD TR2		; roll (with L from above)
	RBL
	STORE TR2

	LOAD TR0		; high word first
	CLL RBR			; shift right (/2)
	STORE TR0
	LOAD TR1		; low word next
	RBR			; roll (with L from above)
	STORE TR1

	
	LOAD TR1		; a == 0?
	PRINTB
	OR TR0
	SNZ
	RTT			; Then we're done.

	JMP _rom_mul32_loop	; Loop again


	;; A 32-bit unsigned division routine based on div16.
	;; Inputs (HI,LO)
	;;   TR0,TR1 = dividend
	;;   TR2,TR3 = divisor
	;; Output:
	;;   TR0,TR1 = remainder
	;;   R30,R31 = quotient
	;;   errno = ERR_SUCCESS => division by zero.
	;;   errno = ERR_DIV0 => division by zero.
	;; Registers:
	;;   R28,R29: shift mask
	;;   R26,R27: temporary

_rom_div32:
	LI	0
	STORE 	R30		; Quotient = 0
	STORE 	R31
	
	LOAD 	TR2		; divisor == 0?
	OR	TR3
	SNZ
	JMP	div_by0		; yes: return division by zero from div16

	;; TODO: perhaps optimise for divident < divisor and divident == divisor, like
	;;   we do in int16?

	
	;; Step one: shift divisor left while it's less than the
	;; divident.

	LI	1
	STORE 	R29		; Keep track of how many shifts we've done.
	LI	0
	STORE	R28

	LI 65
	PRINTC
	
_rom_div32_step1:
	LI 10
	PUTCHAR
	
	;; Mask (R28,R29) <<= 1
	LOAD	R29		; Shift low word
	CLL RBL			; A <<= 1
	STORE	R29
	LOAD	R28		; Roll high word
	RBL
	STORE 	R28

	LOAD R28
	PRINTHI
	LOAD R29
	PRINTLO

	;; Divisor (TR2,TR3) <<= 1
	LOAD	TR3		; Shift low word
	CLL RBL			; A <<= 1
	STORE	TR3
	LOAD	TR2		; Roll high word
	RBL
	STORE 	TR2

	;; Repeat step1 while dividend (TR0,TR1) > (TR2,TR3)
	LOAD TR0		; debugging
	PRINTHI			; debugging
	LOAD TR1		; debugging
	PRINTLO			; debugging
	LOAD TR2		; debugging
	PRINTHI			; debugging
	LOAD TR3		; debugging
	PRINTLO			; debugging

	LOAD TR0
	NEG
	ADD TR2			; Compare TR0  and TR2
	SNN
	JMP _rom_div32_step1	; TR0 > TR2. Loop again.
	SZA			; 
	JMP _rom_div32_step1a	; TR0 < TR2. End step1.
	;; TR0 == TR2. Compare TR1 and TR3.
	LOAD TR1
	NEG
	ADD TR3
	SNN
	JMP _rom_div32_step1	; TR1 > TR3. Loop again.

_rom_div32_step1a:
	LI 10			; debugging
	PUTCHAR			; debugging
	LI 66			; debugging
	PRINTC			; debugging
	
	;; Negate the last roll to make sure the divisor is less than
	;; the divident.
	;; Mask (R28,R29) >>= 1
	LOAD	R28		; Shift high word
	CLL RBR			; A >>= 1
	STORE	R28
	LOAD	R29		; Roll low word
	RBR
	STORE 	R29

	;; Divisor (TR2,TR3) >>= 1
	LOAD	TR2		; Shift high word
	CLL RBR			; A >>= 1
	STORE	TR2
	LOAD	TR3		; Roll low word
	RBR
	STORE 	TR3

	LOAD TR0		; debugging
	PRINTHI			; debugging
	LOAD TR1		; debugging
	PRINTLO			; debugging
	LOAD TR2		; debugging
	PRINTHI			; debugging
	LOAD TR3		; debugging
	PRINTLO			; debugging

	;; Get the rest from div16 and adapt.
_rom_div32_step2:
	LI 10			; debugging
	PUTCHAR			; debugging
	LI 67			; debugging
	PRINTC			; debugging

	;; Check if (TR0,TR1) is larger than (TR2,TR3). If it is,
	;; (TR0,TR1) -= (TR2,TR3). Strategy: subtract anyway, store in
	;; temporary registers, and simply check the resultant sign.
	;; If it's positive, use it.


	;; (R26,R27) = -(TR2,TR3) [hi,lo]
_rom_div32_step2_sub:
	LOAD TR2		; High word: ones' complement
	NOT
	STORE R26
	
	LOAD TR3		; Low order word (easy)
	NEG
	STORE R27
	
	SZA			; If A == 0, there was carry
	JMP _rom_div32_step2_add ; No increment

	LOAD R26		; Increment TR0
	INC
	STORE R26

	;; (R26,R27) += (TR0,TR1), i.e (R26,R27) = (TR0,TR1) - (TR2,TR3)
_rom_div32_step2_add:
	LOAD TR1		; low word of divident
	ADD R27			; add it
	STORE R27	 	; store it back

	LOAD TR0		; high word of divident
	SCL			; Skip if no carry
	INC			;   if carry set, increase
	ADD R26
	STORE R26

	LOAD R26		; debugging
	PRINTHI			; debugging
	LOAD R27		; debugging
	PRINTLO			; debugging

	;; Is the result negative? If not, 'it goes'. Add to the quotient.
	;; Otherwise it's a 'no go'. Shift right and go again.
_rom_div32_step2_cmp:
	LI 10			; debugging
	PUTCHAR			; debugging
	LI 68			; debugging
	PRINTC			; debugging
	LOAD R26		; debugging

	SNN
	JMP _rom_div32_step2_ng	; Didn't fit.

	;; It goes. (TR0,TR1) = (R26,R27), i.e. (TR0,TR1) -= (TR2,TR3)
	LOAD R26
	STORE TR0
	LOAD R27
	STORE TR1

	;; Turn on bit in the quotient.
	LOAD R29		; bit mask low
	ADD R31			; quotient low
	STORE R31		; update quotient

	LOAD R28
	SCL			; Skip if no carry
	INC			;   If carry set, increase
	ADD R30			; Add
	STORE R30		; And update quotient.

_rom_div32_step2_ng:
	LOAD R30
	PRINTHI
	LOAD R31
	PRINTLO

	;; Shift the divisor (TR2,TR3) right.
	LOAD TR2
	CLL RBR			; shift right A >>= 1
	STORE TR2
	LOAD TR3
	RBR			; roll right
	STORE TR3
	LOAD TR2
	PRINTHI
	LOAD TR3
	PRINTLO

	;; Shift the mask right the same way.
	LOAD R28
	CLL RBR			; shift right
	STORE R28
	LOAD R29
	RBR			; roll right
	STORE R29

	;; Is the shift mask zero?
	LOAD R28
	OR R29
	SZA
	JMP	_rom_div32_step2

	LI 10
	PUTCHAR
	LI 64
	PRINTC
	RTT
	

// End of file
