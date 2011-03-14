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

;;; Some standard I/O mnemonics

CONSOLE = 0100
PRINTC = OUT CONSOLE 1		; Print out a character
PRINTD = OUT CONSOLE 2		; Print out a decimal number in A
PANEL = 0000
HALT = OUT PANEL 1
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
	JMP gcd
x:	#1071
y:	#1029

gcd:
	;;  Test various instructions here.
	
	TESTIN
	STORE R 10
	JSR prnl_d

	LI #255
	AND R 10
	JSR prnl_d

	LI #255
	OR R 10
	JSR prnl_d

	LI #65534
	STORE R 10
	INC
	XOR R 10
	JSR prnl_d
	
	TESTIN
	JSR prnl_d

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
	HALT
tight:	JMP tight


prnl_d:
	PRINTD
	LI #10
	PRINTC
	JMP R [1]

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
	JMP R [0]
	
	
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
	

&e000:
boot:
	;; Boot code here.
	;; Run program.
	JMP [paddr]
paddr:	0800			; Address of the program to run.
		

&fffe:	JMP [baddr]
&ffff:
baddr:	0800
