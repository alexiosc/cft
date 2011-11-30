// -*- asm -*-
//
// Purpose: define registers
//
///////////////////////////////////////////////////////////////////////////////	

	;; Hardware registers

	.equ SUBRET  R &0000
	.equ TRAPRET R &0001
	.equ ISRRET  R &0002

	;; General purpose registers

	.equ R0	         R &0010
	.equ R1	         R &0011
	.equ R2	         R &0012
	.equ R3	         R &0013
	.equ R4	         R &0014
	.equ R5	         R &0015
	.equ R6	         R &0016
	.equ R7	         R &0017
	.equ R8	         R &0018
	.equ R9	         R &0019
	.equ R10         R &001a
	.equ R11         R &001b
	.equ R12         R &001c
	.equ R13         R &001d
	.equ R14         R &001e
	.equ R15         R &001f
	.equ R16         R &0020
	.equ R17         R &0021
	.equ R18         R &0022
	.equ R19         R &0023
	.equ R20         R &0024
	.equ R21         R &0025
	.equ R22         R &0026
	.equ R23         R &0027
	.equ R24         R &0028
	.equ R25         R &0029
	.equ R26         R &002a
	.equ R27         R &002b
	.equ R28         R &002c ; Scratch reg
	.equ R29         R &002d ; Scratch reg
	.equ R30         R &002e ; Scratch reg
	.equ R31         R &002f ; Scratch reg

	.equ ZERO	 R &0030 ; &ffff (-1)
	.equ MINUS1	 R &0031 ; &ffff (-1)
	.equ MINUS2	 R &0032 ; &fffe (-2)
	.equ MINUS4	 R &0033 ; &fffc (-4)
	.equ PLUS1	 R &0034 ; 1
	.equ PLUS2	 R &0035 ; 2
	.equ PLUS4	 R &0036 ; 4
	.equ BIT15	 R &0037 ; &8000 (#10000000 00000000)
	.equ NOTBIT15	 R &0038 ; &7fff (#01111111 11111111)

	.equ IR0         R &0080
	.equ IR1         R &0081
	.equ IR2         R &0082
	.equ IR3         R &0083
	.equ IR4         R &0084
	.equ IR5         R &0085
	.equ IR6         R &0086
	.equ IR7         R &0087
	.equ IR8         R &0088
	.equ IR9         R &0089
	.equ IR10        R &008a
	.equ IR11        R &008b
	.equ IR12        R &008c
	.equ IR13        R &008d
	.equ IR14        R &008e
	.equ IR15        R &008f

	;; ROM registers and indices

	.equ LIPTR	R &00f7	; Line input pointer
	.equ RIR1	R &00f6
	.equ RIR2	R &00f5
	.equ RIR3	R &00f4
	.equ RIR4	R &00f3
	.equ RIR5	R &00f2
	.equ RIR6	R &00f1
	.equ RIR7	R &00f0
	
	;; TRAP registers

	.equ TR0	 R &0060
	.equ TR1	 R &0061
	.equ TR2	 R &0062
	.equ TR3	 R &0063

	.equ TIR0	 R &00f8
	.equ TIR1	 R &00f9
	.equ TIR2	 R &00fa
	.equ TIR3	 R &00fb

	;; ISR registers

	.equ ISRR0	 R &0070
	.equ ISRR1	 R &0071
	.equ ISRR2	 R &0072
	.equ ISRR3	 R &0073

	.equ ISRABKP     R &007d
	.equ ISRR0BKP    R &007e
	.equ ISRR1BKP    R &007f

	.equ IIR0	 R &00fc
	.equ IIR1	 R &00fd
	.equ IIR2	 R &00fe
	.equ IIR3	 R &00ff

// End of file.
