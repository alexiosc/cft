;;; -*- cftasm -*-
;;; Definitions for the MBU (Memory Banking Unit).
;;;
;;; The MBU extends the 16-bit address space of the CFT by 8 bits, but uses the
;;; 3 most significant bits to do so. Thus, the net effect is a 21 bit address
;;; space (up to 2 MW of memory).
;;;
;;; The top three bits index one of eight bank registers, each 8 bits
;;; wide. These control the physical address of the respective 8 kW block of
;;; memory.
;;;
;;; The MBU can be disabled, and this happens automatically on reset. When
;;; disabled, the mapping is hardwired to emulate a CFT without an MBU. This is
;;; currently an impossibility since the MBU became part of the processor, but
;;; it still helps using the machine via the front panel. The default mapping is
;;; to 32 kW of RAM at logical addresses &0000-&7FFF and the lowest 32 kW of ROM
;;; at logical addresses &8000-&FFFF. If the front panel RAM switch is
;;; activated, all 64 kW of memory is RAM.
;;;
;;; The MBU can be enabled by writing to the BANK0 register with bit 8 clear. If
;;; bit 8 is set, the MBU will be disabled.
;;;
;;; There is no facility to directly detect the MBU. It can be detected via its
;;; side effects:
;;;
;;; (a) map a ROM page to a bank between 0 and 3 (usually RAM banks). Change a
;;;     value in that bank. Read it back. If the value hasn't changed, the MBU
;;;     is present.
;;;
;;; (b) Alternatively, write a value to an unused part of memory, change the
;;;     corresponding bank register, and read the value back. Repeat this test a
;;;     few times, and if at least one value differs, the MBU is there.


.equ SMB OUT mbu.MBU			; SMB extended instruction

		
.pushns mbu

;;; Useful macros. You probably won't have to use anything other than these, ISR
;;; and ISR_IRQn for testing if an interrupt has been signaled.

;;; Map memory. Bank is the bank register to access (0-7). Phys is the physical
;;; page to map to that register.

.macro LSMB(bank, phys)
		LI %phys
		SMB %bank
.end

.macro RSMB(bank, addr)
		LOAD %addr
		SMB %bank
.end

; .macro MAPMEM(bank)
; 		SMB %bank
; .end

;;; Definitions

.equ MBU R &20				; Base address
.equ MBU_ENABLE  #----'---0'----'----	; Bit 8 clear to enable the MBU
.equ MBU_DISABLE #----'---1'----'----	; Bit 8 set to disable the MBU

.popns

;;; End of file.
