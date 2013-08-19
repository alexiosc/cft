;;; A test program.

;;; Define mnemonics

;;; Basic mnemonics (these should eventually be built-ins)
TRAP = 0400
LOAD = 2400
STORE = 3400
IN = 4400
OUT = 5400
JMP = 6400
JSR = 7400
ADD = 8400
AND = 9400
OR = A400
XOR = B400
OP1 = C400
OP2 = D400
LIA = F400

R =- 0400
I = 0800

LI = LIA R

;;; OP1 Mnemonics, in order of execution.

CLA = OP1  '1---------		; A <- 0
CLL = OP1  '-1--------		; L <- 0
NOT = OP1  '--1-------		; A <- NOT A
INC = OP1  '---1------		; <L,A> <- <L,A> + 1
CPL = OP1  '----1-----		; L <- NOT L
RBL = OP1  '-------010		; <L,A> <- <L,A> >> 1
RBR = OP1  '-------001		; <L,A> <- <L,A> << 1
RNL = OP1  '-------110		; <L,A> <- <L,A> >> 4
RNR = OP1  '-------101		; <L,A> <- <L,A> << 4
; HALT = OP1 '------1---		; Stop clock.

NEG = NOT INC			; Negate A, in twos complement

;;; OP2 Mnemonics, in order of execution.

LPG =  OP2 '1---------		; A <= PR
SPG =  OP2 '-1--------		; PR <= A
CPG =  OP2 '--1-------		; PR <= PC
NOP =  OP2 '------0000		; (no semantics)
SNA =  OP2 '------01--		; A & 0x8000 == 1 ==> PC := PC + 1  }
SZA =  OP2 '------0-1-		; A == 0 ==> PC := PC + 1           } ORred together
SSL =  OP2 '------0--1		; L == 1 ==> PC := PC + 1           }
SKIP = OP2 '------1000		; PC := PC + 1
SNN =  OP2 '------11--		; A & 0x8000 == 0 ==> PC := PC + 1    }
SNZ =  OP2 '------1-1-		; A != 0 ==> PC := PC + 1           } ANDed together
SCL =  OP2 '------1--1		; L == 0 ==> PC := PC + 1           }
CLA2 = OP2 '---1------		; A <- 0
CLI =  OP2 '----1-----		; INT <= 0
CPI =  OP2 '-----1----		; INT <= !INT

SPA = SNN SNZ			; Skip on positive A

;;; Common macros

RET = JMP I R 1

;;; Some standard I/O mnemonics

CONSOLE = 0100
PRINTC = OUT CONSOLE 1		; Print out a character
PRINTD = OUT CONSOLE 2		; Print out a decimal number in A
PRINTX = OUT CONSOLE 3		; Print out a hex number in A
PRINTB = OUT CONSOLE 4		; Print out a binary number in A
PANEL = 0000
HALT = OUT PANEL 1
TESTIN = IN PANEL 2


TMP0 = R 30
TMP1 = R 31

&0666:
	JMP [3ff]

;;; Programs start on page 2 (0800)
&0800:
	LI 	30f
	STORE 	R 10
	LI	a
	STORE 	R 11

	JSR	div

	LOAD 	R 10
	PRINTD
	LOAD	R 11
	PRINTD
	LOAD 	R 20
	PRINTD

	HALT

	;; A division routine found at http://www.bearcave.com/software/divide.htm
	;; Inputs:
	;;   R10 = divident
	;;   R11 = divisor
	;; Output:
	;;   R20 = quotient
	;;   R21 = remainder
	;;   R22 = 0001 => division by zero.

div:
	LI	0
	STORE 	R 20		; Quotient = 0
	
	LOAD 	R 11		; divisor == 0?
	SNZ
	JMP	div_by0		; yes: return division by zero

	NEG
	ADD	R 10		; divident - divisor
	SNN			; divident < divisor?
	JMP	div_q0		; yes: quotient is zero

	SNZ			; divident == divisor?
	JMP	div_q1		; yes: quotient is one.

	;;  Out of luck with shortcuts. We'll have to do actual work now.

	;; Step one: shift divisor left while it's less than the
	;; divident.

	LI	1
	STORE 	R 30		; Keep track of how many shifts we've done.
step1:
	LOAD	R 30
	CLL RBL
	STORE	R 30
	LOAD	R 11
	CLL RBL			; Shift left 1.
	PRINTB
	STORE	R 11
	
	NEG
	ADD	R 10		; R10 - R11
	SNA			; 
	JMP	step1

	;; Negate the last roll to make sure the divisor is less than
	;; the divident.
	LOAD	R 30
	RBR
	STORE 	R 30
	LOAD	R 11
	CLL RBR
	STORE	R 11
	PRINTB

	;; Step two: repeated subtractions.
step2:
	LOAD	R 11
	NEG
	ADD	R 10		; R10 - R11
	SPA
	JMP	step2_ng
	
	STORE 	R 10		; R10 = R10 - R11
	
	LOAD 	R 30		; Load shift amount
	ADD	R 20		; Add to quotient
	STORE	R 20		; Store quotient

step2_ng:

	LOAD 	R 11		; Shift the divisor right.
	RBR
	STORE	R 11

	LOAD 	R 30
	RBR			; Shift the mask right.
	STORE 	R 30
	PRINTB
	SZA
	JMP	step2

	RET

div_by0:
	LI  	1		; Yes.
	RET			; return division by zero

div_q0:
	LI	0		; Quotient = 0
	STORE	R 20
	LOAD	R 10		; Remainder = divident
	STORE 	R 21
	RET
	
div_q1:
	LI	1		; Quotient = 1
	STORE	R 20
	LI	0		; Remainder = 0
	STORE 	R 21
	RET



&fffe:	JMP [baddr]
&ffff:
baddr:	0800
