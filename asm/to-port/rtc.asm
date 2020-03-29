;;; -*- cftasm -*-
;;; Definitions for the RTC (Interrupt Controller) board.

;;; The RTC card has a single I/O space address providing access to one
;;; write-only register and one read-only register:

.pushns rtc

;;; Definitions

.equ NVR R &80				; Base address for the NVRAM
.equ OFS R &90				; Base address for the RTC

.popns

;;; End of file.
