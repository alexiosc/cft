// -*- asm -*-
//
// Core arithmetic and logic

	;; word:  *
	;; alias: mul16
	;; flags: FFL_PRIMITIVE ROM
	;; notes: * ( w1 w2 -- w )
	;;   16-bit signed integer multiplication. CFT does multiplication in
	;;   software. The algorithm is faster if w1 > w2.

	POP2r(SP)		; POP -> TMP1, POP -> AC
	STORE TMP2
	JSR _umul16
	RPUSH(SP, TMP3)
	NEXT

	

	;; 16-bit unsigned multiplication (works for signed too)
	;;
	;; Inputs:
	;;   TMP1 smaller number
	;;   TMP2 larger number
	;; 
	;; Side effects:
	;;   L
	;;
	;; Outputs:
	;;   TMP3 product
	
_umul16:
	LI 0
	STORE TMP3		; TMP3 = product = 0

_umul16_loop:
	LOAD TMP1		; a == 0?
	SNZ
	RET			; Then we're done.

	SBR			; L = A & 1, A = A >> 1
	STORE TMP1
	SSL			; L == 0?
	JMP _umul16_noadd

	RADD(TMP3, TMP3, TMP2)	; prod += b

_umul16_noadd:
	LOAD TMP2		; b <<= 1
	SBL
	STORE TMP2

	JMP _umul16_loop	; Loop again



	;; word:  UM*
	;; alias: UMtimes
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: * ( w1 w2 -- d )
	;;   16-bit unsigned integer multiplication. Returns 32-bit value.
	;;   Please remember that CFT does multiplication in software. Consider
	;;   using shifts instead of this expensive operation.

	;; Pop 16-bit values, populate 32-bit inputs of mul32.
	RPOP(TMP2, SP)		; A low
	RPOP(TMP4, SP)		; B low
	LI 0
	STORE TMP1		; A high
	STORE TMP3		; B high
	JSR _umul32		; (TMP5,TMP5) = (TMP1,TMP2) * (TMP3,TMP4)
	RPUSH(SP, TMP6)		; Push low result
	RPUSH(SP, TMP5)		; Push high result
	NEXT			; Done.


	
	;; word:  UD*
	;; alias: UDtimes
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: * ( d d -- d )
	;;   32-bit unsigned integer multiplication.
	;;   Please remember that CFT does multiplication in software. Consider
	;;   using shifts instead of this expensive operation.

	;; Pop 16-bit values, populate 32-bit inputs of mul32.
	RPOP(TMP1, SP)		; A high
	RPOP(TMP2, SP)		; A low
	RPOP(TMP3, SP)		; B high
	RPOP(TMP4, SP)		; B low
	JSR _umul32		; (TMP5,TMP5) = (TMP1,TMP2) * (TMP3,TMP4)
	RPUSH(SP, TMP6)		; Push low result
	RPUSH(SP, TMP5)		; Push high result
	NEXT			; Done.


	
	;; 32-bit unsigned integer multiplication
	;; 
	;; Inputs:
	;;   TMP1 = high word of a
	;;   TMP2 = low word of a
	;;   TMP3 = high word of b
	;;   TMP4 = low word of b
	;; 
	;; Output:
	;;   TMP5 = high word of product
	;;   TMP6 = low word of product
	;; 
	;; Algorithm:
	;; sum = 0
	;; while a >= 1:
	;;   if a & 1:
	;;     sum += b
	;;   a = a >> 1
	;;   b = b << 1


_umul32:
	LOAD TMP1
	PRINTHI
	LOAD TMP2
	PRINTLO

	LOAD TMP3
	PRINTHI
	LOAD TMP4
	PRINTLO
	SUCCESS


	LI 0
	STORE TMP5 		; product = 0
	STORE TMP6 		; product = 0

	LOAD TMP1		; stop here if a == 0
	OR TMP2
	SNZ
	RET			; return
	
	LOAD TMP4		; stop here if b ==0
	OR TMP5
	SNZ
	RET			; return

_umul32_loop:

	;; Get bit0 of a by shifting right (which we're going to do
	;; anyway) and testing L.

	;; 32-bit shift-right
	RSBR(TMP1, TMP1)	; a = a >> 1
	RRBR(TMP2, TMP2)

	SSL			; L == 1?
	JMP _umul32_noadd	; No. Skip adding to the product.

	;; Add b to product with carry.
	//LOAD TMP3
	//PRINTHI
	//LOAD TMP4
	//PRINTLO

	OP1 CLL			; clear carry
	RADD(TMP6,TMP6,TMP4)	; prod low += b low
	RADC(TMP5,TMP5,TMP3)	; prod high += b high + carry


_umul32_noadd:
	;; 32-bit shift-left
	RSBL(TMP4, TMP4)	; b = b << 1
	RRBL(TMP3, TMP3)	; roll (using L from above)

	;; Are we done?
	LOAD TMP2		; a == 0?
	OR TMP1
	SNZ
	RET			; Then we're done.

	JMP _umul32_loop	; Loop again

	
// End of file.
