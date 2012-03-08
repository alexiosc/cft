;;; Mnemonics used in testing

.equ DEBUG    &03f0

.equ PRINTA   OUT DEBUG &0		; Print out an address
.equ PRINTC   OUT DEBUG &1		; Print out a character
.equ PRINTD   OUT DEBUG &2		; Print out a decimal number in A
.equ PRINTU   OUT DEBUG &3		; Print out a decimal number in A
.equ PRINTH   OUT DEBUG &4		; Print out a hex number in A
.equ PRINTB   OUT DEBUG &5		; Print out a binary number in A
.equ PRINTSP  OUT DEBUG &6		; Print out a space
.equ PRINTNL  OUT DEBUG &7		; Print out a newline
.equ DEBUGON  OUT DEBUG &8		; Emulator: start debugging
.equ DEBUGOFF OUT DEBUG &9		; Emulator: stop debugging
.equ DUMP     OUT DEBUG &a		; Emulator: dump current state
.equ PRINTHI  OUT DEBUG &b		; Set a HI word for later printing.
.equ PRINTLO  OUT DEBUG &c              ; Emulator: print out HI:LO words

.equ SUCCESS  OUT DEBUG &e		; Assert: true
.equ FAIL     OUT DEBUG &f		; Assert: false


;;; End of file.
