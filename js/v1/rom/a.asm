;;; A test program for the Javascript CFT Emulator.
;;;
;;; Copyright © 2013–2015 Alexios Chouchoulas.
;;;
;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;; 
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;; 
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software Foundation,
;;; Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  


.include "testing.asm"			; Debugging board definitions
.include "dfp.asm"			; Panel register definitions
.include "macro-generic.asm"		; Load some basic helper macros


;;; Fill both RAM and ROM parts of the image with SENTINEL instructions, which
;;; cause the emulator to terminate. This is so we can catch addresses which
;;; don't contain valid code. On the real CFT, the DFP will also log the failure
;;; to any testing computer attached to the serial port.
        
&0000:
        .fill 65535 SENTINEL

;;; Simplify calling puts using a macro

.equ PUTS R &100
.macro puts(addr)
		
	LIA %addr			; Load address
	JSR I PUTS			; And jump to subroutine

.end


;;; C000: Entry point. Halts, then jumps to the address toggled in the Switch
;;;       Register.

&c000:
start:
.scope

	LOAD _aputs			; Make puts available globally
	STORE PUTS
		
	puts(msg)			; Print out the boot message
		
	LOAD minus1			; We're done. AC = &ffff
        SOR				; Set all the OR lights on
        LI 0				; Set all the AC lights off
        HALT				; Halt and wait for user.

        LSR				; Load the switch register
        STORE R 1			; Store it
        JMP I R 1			; And jump to that address

minus1: .word &ffff
msg:    .str "Ready. Set addr & press Run.\n" 0
_aputs:	.word _puts

.endscope


;;; Note: for the rest of the code, we avoid macros so that the inner workings
;;;       of CFT assembly are made obvious.

                
;;; C100: Counter. Counts up from zero to the value of the Switch Register
;;;       (which can be changed while the program is running). The Output
;;;       Register displays the count.

&c100:
.scope
		
count:  LI 0				; mem[&10] = 0
        STORE R 10

acloop: LOAD R 10			; mem[&10]++
        INC
        STORE R 10
        SOR				; Set the OR lights
        LSR				; Read the panel switches
        XOR R 10			; Compare to the count (mem[&10])?
        SZA				; Different?
        JMP acloop			; Yes. Increment again.
        SUCCESS				; They're equal. Log success.
        HALT				; And halt.
		
        JMP count			; When we continue, run again.

.endscope


;;; C200: Adding machine with printout. Toggle in value to add, then actuate
;;;       the Run switch. The running total is shown on the Output Register
;;;       and printed out to the debugging terminal.

&c200:
.scope

	puts(msg)			; Print out prompt.
        LI 0				; Mem[&10] holds the sum. Reset it to 0.
        STORE R 10
        SOR				; Clear the lights
loop:	HALT				; Wait for user input.
        LSR				; Read the panel switches
        ADD R 10			; Add them to mem[&10]
        STORE R 10			; Store it back
        SOR				; Set the OR lights to the result
        PRINTD				; Print out the result to the DFP.
        PRINTNL				; Print a newline
        JMP loop			; Go again.

msg:	.str "Adder. Set value to sum, press Run.\n" 0

.endscope

		
;;; C300: Echo. The Accumulator and Output Register follow the value set on the
;;;       switches. Extremely simplistic.

&c300:
.scope

loop:   LSR				; Read the switches
        SOR				; Set the lights to the same value
        JMP loop			; Go again.

.endscope
        

;;; C400: Rolling lights. The program halts. Set a starting light pattern using
;;;       the Switch Register and actuate the Run switch. The Accumulator and
;;;       Output Register display a rolling lights display using that pattern.
;;;       The added 17th bit (seen as a gap) is because the L register also
;;;       participates in the rolls, but isn't set from the initial pattern.

&c400:
.scope

	puts(msg)			; Print out prompt
	CLA CLL				; Clear both A and L PDP-8 style
        SOR				; Set the OR lights
        HALT				; Halt & wait the user to set the pattern
		
        LSR				; Load initial pattern
roll:   RBL				; Roll left through L & AC lights
        SOR				; Set OR lights too
        JMP roll			; Keep rolling

msg:	.str "Set initial pattern, press Run.\n" 0

.endscope


;;; C500: Fibonacci sequence. The Output Register shows the Fibonacci sequence.
;;;       The sequence is also printed out on the debug terminal.

&c500:
.scope

        .equ n1 R &10			; First number
        .equ n2 R &11			; Second number
        .equ tmp0 R &12			; Temporary

again:  CLA CLL				; Clear AC and L, PDP-8 style.
        STORE n1			; n1 = 0
        LI 1
        STORE n2			; n2 = 1
loop:   LOAD n2
        STORE tmp0
        ADD n1
        SCL				; Is L set?
        JMP done			; Yes. We've run out of bits, so stop.
        SOR				; Set the OR lights to the current value
        PRINTD				; Print it out to the DFP console
        PRINTSP
        STORE n2			; Store it for the next iteration
        LOAD tmp0
        STORE n1
        JMP loop			; And keep going
done:   SUCCESS
        HALT
        JMP again		        ; Keep running as long as the user wants.

.endscope
        


;;; C600: Eratosthenes' Sieve. Prime number generator. Shows primes < 30.
;;;       The maximum number (30) by default is first printed out on the debug
;;;       terminal, on a line of its own. The primes are then printed out as
;;;       they are found, separated by spaces. They are also shown on the
;;;       Output Register. On the Javascript emulator, the calculation is slow
;;;       enough that the numbers can be read out from the OR.
;;;
;;;       To calculate a different range of primes, write the maximum integer
;;;       needed to location &0017 and start the program from location &C602.


&c600:

.scope

        .equ ONE R &0F          ; Constant 1
        .equ I0 R &080          ; Autoincrement register
        .equ x R &010           ; Count register
        .equ pos R &011         ; Current position
        .equ posptr R &012      ; Pointer to value at current position
        .equ prime R &013       ; Last prime found
        .equ neglimit R &014    ; The last number (negated, for subtracting)
        .equ tmp R &015         ; Temporary register
        .equ tmp2 R &016        ; Temporary register
        .equ count R &017       ; 
		
eratosthenes:   
        ;; Prepare the pad

        LOAD sieve_cnt          ; Size of working memory
        STORE count

	puts(msg)
        LOAD count
        PRINTD
        PRINTNL
        
        NEG
        STORE x                 ; Prepare for clearing the working memory
        LOAD sieve_start        ; Autoindex pointer
        STORE I0

        LOAD count              ; Used for limit checking
        NEG
        STORE neglimit

        LI 1
        STORE ONE

        ;; The first prime we report, 2, is found at initialisation time.
        ;; Since it's the prime that takes the most to mark (half of the
        ;; pad has to be marked!), we join this step and the pad init
        ;; step and start looking for primes at 3.

        LI 2                    ; Report 2
        SOR
        PRINTD
        PRINTSP

sieve_clear:
        LOAD x
        AND ONE                 ; Heh. EBM reference.
        XOR ONE                 ; Thus we initialise the entire table for prime=2
        STORE I I0
        ISZ x
        JMP sieve_clear

sieve_init:
        LI 2                    ; pos = 2 (to be incremented soon)
        STORE pos
        ADD sieve_start
        STORE posptr            ; posptr = &pad[pos]

sieve_next_prime:
        ISZ pos                 ; Next position
        JMP @+1
        ISZ posptr
        JMP @+1

        LOAD pos                ; Past the end of the working memory?
        ADD neglimit
        SNA                     ; pos + neglimit < 0?
        JMP sieve_done          ; The algorithm is done!

        LOAD I posptr           ; Consider pad[pos].
        SNZ                     ; pad[pos] == 0?
        JMP sieve_got_prime     ; Yes. We found a prime.
        JMP sieve_next_prime    ; No. Loop again.
        
sieve_got_prime:
        LOAD pos
        SOR
        PRINTD
        PRINTSP

sieve_mark_mult:
        ADD pos                 ; Next multiple of pos
        STORE tmp

        ADD sieve_start
        STORE tmp2

        LOAD tmp
        ADD neglimit
        SNA                     ; pos + neglimit < 0?
        JMP sieve_next_prime    ; No. Done with the pad, find next prime.

        ;; Within limits. Mark as non-prime and loop.
        LI 1                    ; pad[x] = 1
        STORE I tmp2
        LOAD tmp
        JMP sieve_mark_mult

sieve_done:
        SUCCESS
        HALT
        JMP eratosthenes        ;; If the user continues here, restart.
        
sieve_start:
        .word &1000
sieve_cnt:
        .word 200

msg:	.str "Prime numbers up to " 0

.endscope



;;; C700: Hello world program. Prints out The Standard Message on the debug
;;;       terminal.

&c700:
.scope
hello:  LIA msg
        STORE R &80

loop:   LOAD I R &80
        SOR
        SNZ
        JMP done
        PRINTC
        JMP loop

done:   SUCCESS
        HALT
        JMP hello

msg:    .str "Hello, world!\n"
        .str "This is a microcode-level CFT emulator written in Javascript! "
        .str "It's a lot slower than \nthe real thing, but it works."
        .str "The emulator contains a small ROM of sample programs."
        .str "Read the description below \nfor a list of programs and "
	.str "instruction on how to use them. The source of the ROM "
	.str "is also available below.\n"
        .str 0

.endscope


;;; A basic subroutine to print out a message.
;;; 
;;; AC:	address of message.
;;; 
;;; Side-effects: Clobbers index register &00FF.

_puts:		
.scope

	STORE R &ff			; Store the string address
loop:   LOAD I R &ff			; Load next character
        SNZ				; Is it zero?
        JMP done			; Then we're done.
        PRINTC				; Print it to the debugging terminal
        JMP loop			; And go again
done:	RET				; Return

.endscope

		
;;; System vectors

&fff0:
        JMP I boot
boot:   .word start

;;; Just in case interrupts are enabled by mistake (and an interrupt somehow
;;; triggered), the ISR simply disables interrupts again.

&fff8:  RTI                     ; Interrupts do nothing but disable interrupts

;;; End of file.
