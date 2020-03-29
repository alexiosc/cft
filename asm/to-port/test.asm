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
SEI =  OP2 '-----1----		; INT <= 1

SPA = SNN SNZ			; Skip on positive A

;;; Common macros

RET = JMP I R 0			; Return from jump
RTT = JMP I R 1			; Return from trap
RTI = JMP I R 2			; Return from ISR

;;; Some standard I/O mnemonics

SYSTEM = 0100

DEBUG = R &03f0
PRINTC = OUT DEBUG 1		; Print out a character
PRINTD = OUT DEBUG 2		; Print out a decimal number in A
PRINTH = OUT DEBUG 3		; Print out a hex number in A
PRINTB = OUT DEBUG 4		; Print out a binary number in A
HALT = OUT DEBUG d		; Halt
SUCCESS = OUT DEBUG e		; Assert: true
FAIL = OUT DEBUG f		; Assert: false

PANEL = R &0020
HALT = OUT PANEL 7
TESTIN = IN PANEL 2

&0666:
	JMP [3ff]

;;; Vector table. (64 words long, end of zero page)

&03bf:
vectors:
	boot

;;; Programs start on page 2 (0800)
&0800:
	TRAP traphw
	CLA CLL INC CPL
	OP1 			; Do nothing.
	CLI SEI
	JMP gcd
x:	#1071
y:	#1029

gcd:
	;;  Test various instructions here.
	
	TESTIN
	STORE R 10
	JSR prnl_d

	;; LI #255
	;; AND R 10
	;; JSR prnl_d

	;; LI #255
	;; OR R 10
	;; JSR prnl_d

	;; LI #65534
	;; STORE R 10
	;; INC
	;; XOR R 10
	;; JSR prnl_d
	
	;; TESTIN
	;; JSR prnl_d

	;; End of instruction test.

	LOAD x			; if (x == 0) return y;
	SZA
	JMP loop
	LOAD y			; print out y and finish.
	JMP end

loop:	LOAD x			; Print out x
	PRINTD
	LI #32			; Space
	PRINTC
	LOAD y			; Print out y
	PRINTD
	LI #10
	PRINTC

	LOAD y			; Not trivial.
	SNZ			; if (y == 0)
	JMP retx		;  ... return x

	LOAD Y			; Calculate x - y
	NEG
	ADD X
	SNN SNZ			; Skip if A > 0 (A >= 0 && a != 0)
	JMP ydec		; if x > y

xdec:	STORE x			; x = A (which is x - y)
	JMP loop

ydec:	NEG			; A = x-y already. Get y-x:  y-x = -(x-y)
	STORE y
	jmp loop

retx:	LOAD x			; print out x and finish.
end:	PRINTD
	LOAD R 0		; Load address at 0
	STORE R f0		; Store at 00f0.
	LOAD R [f0]		; Autoincrement test.
	LOAD R [f0]		; Autoincrement test.
	LOAD R [f0]		; Autoincrement test.
	LOAD R [f0]		; Autoincrement test.
	LOAD R [f0]		; Autoincrement test.
	LOAD R [f0]		; Autoincrement test.
	LOAD R [f0]		; Autoincrement test.
	LOAD R [f0]		; Autoincrement test.
	CLI
	HALT
tight:	JMP tight


prnl_d:
	PRINTD
	LI #10
	PRINTC
	RET

traphw:
	LI 48
	PRINTC
	LI 65
	PRINTC
	LI 6C
	PRINTC
	LI 6C
	PRINTC
	LI 6f
	PRINTC
	LI 20
	PRINTC
	LI 57
	PRINTC
	LI 6f
	PRINTC
	LI 72
	PRINTC
	LI 6c
	PRINTC
	LI 64
	PRINTC
	LI 21
	PRINTC
	LI 0a
	PRINTC

	LPG SPG CPG
	RTT
	
	
;; &0900:  JMP loop
;; x:	#10
;; loop:	LI #35
;; 	PRINTC
;; 	CLA NOT			; -1
;; 	ADD x
;; 	STORE x
;; 	SNZ
;; 	HALT
;; 	JMP loop

	
;; 	Jmp gcd1
;; gcd_a:	#1071
;; gcd_b:	#1029
;; gcd1:	LOAD [gcd_a]


	;; A division routine found at http://www.bearcave.com/software/divide.htm
	;; Inputs:
	;;   R10 = divident
	;;   R11 = divisor
	;; Output:
	;;   R20 = quotient
	;;   R21 = remainder
	;;   R22 = 0001 => division by zero.

div:
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

&e000:
boot:
	;; Boot code here.
	;; Run program.
	JMP [paddr]
paddr:	0800			; Address of the program to run.


&f000:
isr:	STORE isr_a
	SKIP
isr_a:	0000			; Temporary storage for A
	LI 0a
	PRINTC
	LI 0a
	PRINTC
	LI 2a
	PRINTC
	LI 2a
	PRINTC
	LI 2a
	PRINTC
	LI 49
	PRINTC
	LI 4E
	PRINTC
	LI 54
	PRINTC
	LI 2a
	PRINTC
	LI 2a
	PRINTC
	LI 2a
	PRINTC
	LI 0a
	PRINTC
	LI 0a
	PRINTC
	LOAD isr_a
	SEI
	RTI

&fffd:

&fff0:
	JMP [baddr]
baddr:	0800

&fff8:
	JMP [isr_vec]
isr_vec:
	f000
