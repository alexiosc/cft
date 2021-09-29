;;; -*- cftasm -*-
;;; 
;;; Definitions for the TMR (Real Time Clock) device, part of the TIC board.

;;; The TMR has one or two 82C54 timer ICs. The datasheet is here:
;;;
;;; http://www.scs.stanford.edu/10wi-cs140/pintos/specs/8254.pdf
;;;
;;; The devices are timed using a 32,768 Hz oscillator. With their 16-bit
;;; timers, they can count periods of 30 microseconds to 2 seconds with a
;;; resolution of 30 microseconds which should be fine for the CFT's intended
;;; use.

.pushns tmr

;;; How to set timer 1 counter 0 to mode 2 and set a count rate:
;;;
;;; LI tmr.CTR0 tmr.RWB tmr.MODE2   ; Counter 0, write LSB & MSB, set mode 2
;;; OUT tmr.TMR1 tmr.CW             ; Send to Timer 1 Control Word
;;; LOAD RATE                       ; Load 16 bit rate
;;; OUT tmr.TMR1 tmr.CTR0           ; Write LSB to timer 1 counter 0
;;; SHL 8
;;; OUT tmr.TMR1 tmr.CTR0           ; Write MSB to timer 1 counter 0

;;; Definitions

.equ TMR0 &14				; Base address of Timer 0
.equ TMR1 &18				; Base address of Timer 1

.equ C0 0				; Counter 0 address offset
.equ C1 1				; Counter 1 address offset
.equ C2 2				; Counter 2 address offset
.equ CW 3				; Control Word

;;; Control Word format

.pushns cw
.equ CTR0  #00------			; Select counter 0
.equ CTR1  #01------			; Select counter 1
.equ CTR2  #10------			; Select counter 2

.equ CLC   #--00----			; Counter Latch Command
.equ LSB   #--01----			; Read/Write LSB only
.equ MSB   #--10----			; Read/Write MSB only
.equ RWB   #--11----			; Read/Write LSB followed by MSB

.equ MODE0 #----000-			; Mode 0: Interrupt on Terminal Count
.equ MODE1 #----001-			; Mode 1: HW-Retriggerable One-Shot
.equ MODE2 #----010-			; Mode 2: Rate Generator
.equ MODE3 #----011-			; Mode 3: Square Wave Mode
.equ MODE4 #----100-			; Mode 4: Software Triggered Strobe
.equ MODE5 #----101-			; Mode 5: Hardware Triggered Strobe

.equ BCD  #-------1			; Count in BCD (4 decades only)
.popns cw

;;; To detect the TMR, read TMR.DATA. The top eight bits should be as
;;; follows:

.equ DET_MASK   #11111111'00000000
.equ TMR_DETECT #11110000'--------

.popns tmr

;;; End of file.
