;;; -*- cftasm -*-
;;; Definitions for the VDU (Video Display Unit) board, integrating both the VDU
;;; (graphic card) and KBD (PS/2 or Sun keyboard).

;;; The VDU card occupies 16 I/O space addresses providing access to a wide
;;; range of registers. It signals a single IRQ for numerous events, and has no
;;; memory-mapped space.

.pushns vdu

;;; Definitions

.equ VDU    R &1f0			; Base address

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; REGISTERS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Display Registers
;;;
;;; Many display registers are paired with an x0 and x1 pair. With split screen
;;; disabled, the x0 registers are the only ones used. With split screen
;;; enabled, x0 regs control the top part of the split, x1 regs control the
;;; bottom part.
;;;
;;; All display registers except for the SR are write-only.
;;; 
;;; Warning: not all x0 and x1 registers have identical bitmaps! Check the VDU
;;; documentation.

.equ MCR0   VDU &0			; Mode Control Register 0
.equ SR     VDU &0			; Status register (read only)
.equ MCR1   VDU &1			; Mode Control Register 1
.equ SCR0   VDU &2			; Scroll Control register 0
.equ SCR1   VDU &3			; Scroll Control register 1
.equ SAR0   VDU &4			; Start Address register 0
.equ SAR1   VDU &5			; Start Address register 1
.equ MAR0   VDU &6			; Modulo Address register 0
.equ MAR1   VDU &7			; Modulo Address register 1
.equ CCR    VDU &8			; Cursor Control register
.equ CAR    VDU &9			; Cursor Address register

;;; Command Registers

.equ HAR    VDU &a			; Host Address register (rw)
.equ CRR    VDU &d			; Command Repetition register (rw)
.equ CPORT  VDU &e			; C plane I/O (rw)

.equ BPORT  VDU &f			; B plane I/O (rw)
.equ CMD    VDU &f			; Command register (rw)
.equ CGPORT VDU &f			; Command register (rw)

;;; The keyboard register

.equ KBD    VDU &b			; Keyboard register (rw)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; BIT FIELDS FOR DISPLAY REGISTERS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; MCR0, Mode Control Register 0 (top of split screen) and Interrupt Control

.equ MCR0_EN    #1---------------	; Enable VDU when bit 15 is 1.
.equ MCR0_DIS   #0---------------	; Disable the VDU
.equ MCR0_KBI   #------1---------	; Enable Keyboard Interrupts
.equ MCR0_VRI   #-------1--------	; Enable VDU Ready Interrupts
.equ MCR0_SCI   #--------1-------	; Enable Split Count Interrupts
.equ MCR0_VSI   #---------1------	; Enable Vertical Sync Interrupts
.equ MCR0_CS20  #----------00----	; Select Character Set 0
.equ MCR0_CS21  #----------01----	; Select Character Set 1
.equ MCR0_CS22  #----------10----	; Select Character Set 2
.equ MCR0_CS23  #----------11----	; Select Character Set 3
.equ MCR0_C80   #------------0---	; 80 Columns (640 pixels)
.equ MCR0_C40   #------------1---	; 40 Columns (320 pixels)
.equ MCR0_CRH16 #-------------000	; 16 scanlines per cell, 30 row modes
.equ MCR0_CRH8  #-------------001	; 8 scanlines per cell, 60 row modes
.equ MCR0_CRH4  #-------------010	; 4 scanlines per cell, 120 row modes
.equ MCR0_CRH2  #-------------011	; 2 scanlines per cell, 240 row modes
.equ MCR0_CRH1  #-------------100	; 1 scanline per cell, 480 row modes

.equ MCR0_40x30 MCR0_EN MCR0_CS20 MCR0_C40 MCR0_CRH16 ; 40x30 settings
.equ MCR0_40x60 MCR0_EN MCR0_CS20 MCR0_C40 MCR0_CRH8  ; 40x60 settings
.equ MCR0_80x30 MCR0_EN MCR0_CS20 MCR0_C80 MCR0_CRH16 ; 80x30 settings
.equ MCR0_80x60 MCR0_EN MCR0_CS20 MCR0_C80 MCR0_CRH8  ; 80x60 settings

;;; SR, Status Register

.equ SR_EN_MSK  MCR0_EN			; VDU is enabled if non-zero
.equ SR_VER_MSK #-11111----------	; Version mask. Should be one of:
.equ SR_VER5    #-00101----------	;   Version 5
.equ SR_KBIS    MCR0_KBI		; Keyboard Interrupt Signalled
.equ SR_VRIS    MCR0_VRI		; VDU Ready Interrupt Signalled
.equ SR_SCIS    MCR0_SCI		; Split Count Interrupt Signalled
.equ SR_VSIS    MCR0_VSI		; Vertical Sync Interrupt Signalled
.equ SR_VSIS    MCR0_VSI		; Vertical Sync Interrupt Signalled
.equ SR_CS2_MSK MCR0_CS23		; CS2 mask. Values should be:
.equ SR_CS20    MCR0_CS20		;   Character Set 0 selected
.equ SR_CS21    MCR0_CS21		;   Character Set 1 selected
.equ SR_CS22    MCR0_CS22		;   Character Set 2 selected
.equ SR_CS23    MCR0_CS23              	;   Character Set 3 selected
.equ SR_C40_MSK MCR0_C40		; C40 mask. Values should be:
.equ SR_C40     MCR0_C40		;   40 columns
.equ SR_C80     MCR0_C80		;   80 columns
.equ SR_CR_MSK  #-------------111   	; CRH mask. Values should be:
.equ SR_CRH16   MCR0_CRH16		;   16 scanlines per cell, 30 row modes
.equ SR_CRH8    MCR0_CRH8		;   8 scanlines per cell, 60 row modes
.equ SR_CRH4    MCR0_CRH4		;   4 scanlines per cell, 120 row modes
.equ SR_CRH2    MCR0_CRH2		;   2 scanlines per cell, 240 row modes
.equ SR_CRH1    MCR0_CRH1		;   1 scanline per cell, 480 row modes

;;; MCR1, Mode Control Register (bottom of split screen) and Split Screen Control

.equ MCR1_SCL_MSK #11111111--------	; Split Control Register mask
.equ MCR1_SEN     #--------1-------     ; Enable Split Screen
.equ MCR1_SDIS    #--------0-------     ; Disable Split Screen
.equ MCR1_CS20    MCR0_CS20		; Select Character Set 0
.equ MCR1_CS21    MCR0_CS21		; Select Character Set 1
.equ MCR1_CS22    MCR0_CS22		; Select Character Set 2
.equ MCR1_CS23    MCR0_CS23		; Select Character Set 3
.equ MCR1_C80     MCR0_C80		; 80 Columns (640 pixels)
.equ MCR1_C40     MCR0_C40		; 40 Columns (320 pixels)
.equ MCR1_CRH16   MCR0_CRH16		; 16 scanlines per cell, 30 row modes
.equ MCR1_CRH8    MCR0_CRH8		; 8 scanlines per cell, 60 row modes
.equ MCR1_CRH4    MCR0_CRH4		; 4 scanlines per cell, 120 row modes
.equ MCR1_CRH2    MCR0_CRH2		; 2 scanlines per cell, 240 row modes
.equ MCR1_CRH1    MCR0_CRH1		; 1 scanline per cell, 480 row modes

;;; SCR0, Smooth Scroll Register (top of split screen)

.equ SCR0_VSCR    #--------1111----	; VSCR field mask (4 bits)
.equ SCR0_HSCR    #-------------111	; HSCR field mask (3 bits)

;;; SCR1, Smooth Scroll Register (bottom of split screen)

.equ SCR0_VSCR    #--------1111----	; VSCR field mask (4 bits)
.equ SCR0_HSCR    #-------------111	; HSCR field mask (3 bits)

;;; SAR0, Start Address Register (top of split screen)
;;; SAR1, Start Address Register (bottom of split screen)
;;; MAR0, Modulo Address Register (top of split screen)
;;; MAR1, Modulo Address Register (bottom of split screen)
;;; CAR, Cursor Address Register
;;; HAR, Host Address Register
;;;
;;; All use this bitmap:
;;;
;;; 111111111------- Row number (0..511, 9 bits)
;;; ---------1111111 Column number (0..127, 7 bits)

;;; CCR, Cursor Control Register

.equ CCR_BG     #--111111--------	; Cursor background colour mask
.equ CCR_CBCOFF #--------00------	; Cursor off
.equ CCR_CBCON  #--------01------	; Cursor on
.equ CCR_CBCFBL #--------10------	; Cursor on, fast blink
.equ CCR_CBCSBL #--------10------	; Cursor on, slow blink
.equ CCR_FG     #----------111111	; Cursor foreground colour mask

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; BIT FIELDS FOR COMMAND REGISTERS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; HAR, Host Address Register: search for HAR above

;;; CRR, Command Repetition Register

;;; CPORT, C Plane Data

.equ CPORT_BLN   #1---------------	; Blink attribute on
.equ CPORT_INV   #-1--------------	; Inverse Video
.equ CPORT_BG    #--111111--------	; Background colour mask
.equ CPORT_CS10  #--------00------	; Character sub-set 0
.equ CPORT_CS11  #--------01------	; Character sub-set 1
.equ CPORT_CS12  #--------10------	; Character sub-set 2
.equ CPORT_CS13  #--------11------	; Character sub-set 3
.equ CPORT_FG    #----------111111	; Foreground colour mask

;; Some foreground colours. To get background colours, the foreground equivalent
;; needs to be shifted eight bits left. Try @COLOR_WHITE<<8 to produce white
;; background in cftasm.

.equ COL_BLACK    #000000		; Black
.equ COL_GREY1    #010101		; Dark grey
.equ COL_GREY2    #101010		; Light grey
.equ COL_WHITE    #111111		; White

.equ COL_RED1     #000001		; Dark Red
.equ COL_RED2     #000010		; Medium Red
.equ COL_RED3     #000011		; Light Red

.equ COL_GREEN1   #000100		; Dark Green
.equ COL_GREEN2   #001000		; Medium Green
.equ COL_GREEN3   #001100		; Light Green
		
.equ COL_YELLOW1  #000101		; Dark Yellow
.equ COL_YELLOW2  #001010		; Medium Yellow
.equ COL_YELLOW3  #001111		; Light Yellow

.equ COL_BLUE1    #010000		; Dark Blue
.equ COL_BLUE2    #100000		; Medium Blue
.equ COL_BLUE3    #110000		; Light Blue
		
.equ COL_MAGENTA1 #010001		; Dark Meganta
.equ COL_MAGENTA2 #100010		; Medium Magenta
.equ COL_MAGENTA3 #110011		; Light Magenta
		
.equ COL_CYAN1    #010100		; Dark Cyan
.equ COL_CYAN2    #101000		; Mediun Cyan
.equ COL_CYAN3    #111100		; Light Cyan

.equ COL_BROWN    #000110		; Brown (the CGA one)
.equ COL_AZURE    #111000		; Azure
.equ COL_INDIGO   #110001		; Indigo
.equ COL_PINK     #111011		; Pink
.equ COL_PURPLE   #100011		; Purple

;;; BPORT register: only the lower 8 bits are used, and they denote either a
;;; character codepoint (in the current (CS2,CS1) character set and sub-set) or
;;; a pixel pattern (which is really just another character in a character set
;;; since the VDU only does text).

;;; CGPORT register: only the lower 8 bits are used to access data in the
;;; character generator RAM, addressing it like a normal plane (using the HAR as
;;; an index register).

;;; CMD register: VDU commands. This register really subsumes the BPORT and
;;; CGPORT registers.

.equ CMD_DONE       #1---------------	; The previous command has completed.
.equ CMD_GO         #0---------------	; Used when issuing a new command.
.equ CMD_CMD_MSK    #--1111----------	; Command mask. Must be one of:
.equ CMD_CMD_WBC    #--0000----------	; Write to B and C planes.
.equ CMD_CMD_WB     #--0001----------	; Write to B plane.
.equ CMD_CMD_ORBWC  #--0010----------	; OR with B plane, write to C plane.
.equ CMD_CMD_ORB    #--0011----------	; OR with B plane.
.equ CMD_CMD_ANDBWC #--0100----------	; AND with B plane, write to C plane.
.equ CMD_CMD_ANDB   #--0101----------	; AND with B plane.
.equ CMD_CMD_XORBWC #--0110----------	; XOR with B plane, write to C plane.
.equ CMD_CMD_XORB   #--0111----------	; XOR with B plane.
.equ CMD_CMD_WC     #--1000----------	; Write to C plane only.
.equ CMD_CMD_WCG    #--1011----------	; Write to CG RAM.
.equ CMD_CMD_RBC    #--1101----------	; Read from B and C planes.
.equ CMD_YINC       #------1---------   ; Increment row after command
.equ CMD_XINC       #-------1--------   ; Increment column after command
.equ CMD_DATA_MSK   #--------11111111	; Data field mask

.equ CMD_PUTC CMD_CMD_WBC CMD_XINC	; putc: write char/attrs, move right
.equ CMD_CLR CMD_CMD_WBC CMD_XINC &20	; Clear: Write space & attrs, move right 

;; Macro: vdu.WAIT ()
;;
;; Wait until the VDU is done executing a command.
;; Conditions:
;;   As this macro includes a relative JMP, it has to be used at least 3 words
;;   before the end of a page.
;;
;; Side effects:
;;   AC.
.macro WAIT()
		IN vdu.CMD		; WAIT()
		SNA			; Wait until bit15 (GO) is set.
		JMP @-2
.end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; BIT FIELDS FOR THE KEYBOARD INTERFACE
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; KBD, PS/2 keyboard register.
;;;
;;; The keyboard driver receives PS/2 keyboard data autonomously (generating an
;;; interrupt every time a full byte is received), but can also be ran from the
;;; computer to programmatically receive individual bit (bit banging).
;;;
;;; Sending data to the keyboard must be done by the computer using bit
;;; banging. To this end, the clock and data lines are available for both
;;; reading and writing. These lines also disable and enable the keyboard.
;;;
;;; Note: this is not finalised! The final Sun/PS/2 decision is still pending
;;; and will depend on a number of factors.

.equ KBD_KDR    #1---------------	; Keyboard Data Ready (r)
.equ KBD_KD     #-1--------------	; Keyboard Data line (rw)
.equ KBD_KC     #--1-------------	; Keyboard Clock line (rw)
.equ KBD_KDP    #-------1--------	; Keyboard data parity mask
.equ KBD_KDATA  #--------11111111	; Keyboard data mask (8 bits, ro)
		
.popns

;;; End of file.
