EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "Timers, Interrupts & Clock "
Date ""
Rev ""
Comp ""
Comment1 "TIC"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 8350 1450 1150 4200
U 5DD5525C
F0 "sheet5DD55211" 50
F1 "./bus.sch" 50
F2 "AB[0..23]" U L 8350 2200 50 
F3 "DB[0..15]" U L 8350 2300 50 
F4 "FPD[0..7]" U L 8350 2600 50 
F5 "IBUS[0..15]" U L 8350 1600 50 
F6 "~RESET" U L 8350 1700 50 
F7 "CLK1" U L 8350 1800 50 
F8 "CLK2" U L 8350 1900 50 
F9 "CLK3" U L 8350 2000 50 
F10 "CLK4" U L 8350 2100 50 
F11 "WSTB" U L 8350 2400 50 
F12 "T34" U L 8350 2500 50 
F13 "~IRQ" U L 8350 2700 50 
F14 "~IRQS" U L 8350 2800 50 
F15 "~IRQ[0..7]" U L 8350 2900 50 
F16 "~RSTHOLD" U L 8350 3000 50 
F17 "~SYSDEV" U L 8350 3100 50 
F18 "~IODEV1xx" U L 8350 3200 50 
F19 "~IODEV2xx" U L 8350 3300 50 
F20 "~IODEV3xx" U L 8350 3400 50 
F21 "~MEM" U L 8350 3500 50 
F22 "~IO" U L 8350 3600 50 
F23 "~R" U L 8350 3700 50 
F24 "~W" U L 8350 3800 50 
F25 "~WS" U L 8350 3900 50 
F26 "~ENDEXT" U L 8350 4000 50 
F27 "~SKIPEXT" U L 8350 4100 50 
F28 "~HALT" U L 8350 4200 50 
F29 "ACTION[0..3]" U L 8350 4500 50 
F30 "WADDR[0..4]" U L 8350 4600 50 
F31 "RADDR[0..4]" U L 8350 4700 50 
F32 "RSVD[1..4]" U L 8350 4800 50 
F33 "C1" U R 9500 1600 50 
F34 "C2" U R 9500 1700 50 
F35 "C3" U R 9500 1800 50 
F36 "C4" U R 9500 1900 50 
F37 "C5" U R 9500 2000 50 
F38 "C6" U R 9500 2100 50 
F39 "C7" U R 9500 2200 50 
F40 "C8" U R 9500 2300 50 
F41 "C9" U R 9500 2400 50 
F42 "C10" U R 9500 2500 50 
F43 "C11" U R 9500 2600 50 
F44 "C12" U R 9500 2700 50 
F45 "C13" U R 9500 2800 50 
F46 "C14" U R 9500 2900 50 
F47 "C15" U R 9500 3000 50 
F48 "C16" U R 9500 3100 50 
F49 "C17" U R 9500 3200 50 
F50 "C18" U R 9500 3300 50 
F51 "C19" U R 9500 3400 50 
F52 "C20" U R 9500 3500 50 
F53 "C21" U R 9500 3600 50 
F54 "C22" U R 9500 3700 50 
F55 "C23" U R 9500 3800 50 
F56 "C24" U R 9500 3900 50 
F57 "C25" U R 9500 4000 50 
F58 "C26" U R 9500 4100 50 
F59 "C27" U R 9500 4200 50 
F60 "C28" U R 9500 4300 50 
F61 "C29" U R 9500 4400 50 
F62 "C30" U R 9500 4500 50 
F63 "C31" U R 9500 4600 50 
F64 "C32" U R 9500 4700 50 
F65 "C33" U R 9500 4800 50 
F66 "C34" U R 9500 4900 50 
F67 "C35" U R 9500 5000 50 
F68 "C36" U R 9500 5100 50 
F69 "C37" U R 9500 5200 50 
F70 "C38" U R 9500 5300 50 
F71 "C39" U R 9500 5400 50 
F72 "C40" U R 9500 5500 50 
F73 "~RUEN" U L 8350 4300 50 
F74 "~WUEN" U L 8350 4400 50 
$EndSheet
Wire Bus Line
	8350 2200 7800 2200
Wire Bus Line
	8350 2300 7800 2300
Text Label 7800 2300 0    50   ~ 0
DB[0..15]
Wire Bus Line
	7800 2600 8350 2600
Text Label 7800 2600 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	8350 1800 7800 1800
Wire Wire Line
	8350 1900 7800 1900
Wire Wire Line
	8350 2000 7800 2000
Wire Wire Line
	8350 2100 7800 2100
Wire Wire Line
	8350 1700 7800 1700
Wire Wire Line
	8350 3000 7800 3000
Wire Wire Line
	8350 3100 7800 3100
Wire Wire Line
	8350 3200 7800 3200
Wire Wire Line
	8350 2700 7800 2700
Wire Wire Line
	8350 3500 7800 3500
Wire Wire Line
	8350 3600 7800 3600
Wire Wire Line
	8350 3700 7800 3700
Wire Wire Line
	8350 3800 7800 3800
Wire Wire Line
	8350 3400 7800 3400
Wire Wire Line
	8350 3300 7800 3300
Wire Wire Line
	8350 4100 7800 4100
Wire Wire Line
	8350 4200 7800 4200
Wire Wire Line
	8350 4000 7800 4000
Wire Wire Line
	8350 3900 7800 3900
Wire Bus Line
	7800 2900 8350 2900
Text Label 7800 2900 0    50   ~ 0
~IRQ[0..7]
Text Label 7800 2700 0    50   ~ 0
~IRQ
Wire Wire Line
	8350 2400 7800 2400
Wire Wire Line
	8350 2500 7800 2500
Wire Bus Line
	7800 1600 8350 1600
Text Label 7800 1600 0    50   ~ 0
IBUS[0..15]
Text Label 7800 1700 0    50   ~ 0
~RESET
Text Label 7800 1800 0    50   ~ 0
CLK1
Text Label 7800 1900 0    50   ~ 0
CLK2
Text Label 7800 2000 0    50   ~ 0
CLK3
Text Label 7800 2100 0    50   ~ 0
CLK4
Text Label 7800 2400 0    50   ~ 0
WSTB
Text Label 7800 2500 0    50   ~ 0
T34
Wire Wire Line
	8350 2800 7800 2800
Text Label 7800 2800 0    50   ~ 0
~IRQS
Text Label 7800 3000 0    50   ~ 0
~RSTHOLD
Text Label 7800 3100 0    50   ~ 0
~SYSDEV
Text Label 7800 3200 0    50   ~ 0
~IODEV1xx
Text Label 7800 3300 0    50   ~ 0
~IODEV2xx
Text Label 7800 3400 0    50   ~ 0
~IODEV3xx
Text Label 7800 3500 0    50   ~ 0
~MEM
Text Label 7800 3600 0    50   ~ 0
~IO
Text Label 7800 3700 0    50   ~ 0
~R
Text Label 7800 3900 0    50   ~ 0
~WS
Text Label 7800 4000 0    50   ~ 0
~ENDEXT
Text Label 7800 4100 0    50   ~ 0
~SKIPEXT
Text Label 7800 4200 0    50   ~ 0
~HALT
Text Label 7800 4500 0    50   ~ 0
ACTION[0..3]
Text Label 7800 4600 0    50   ~ 0
WADDR[0..4]
Text Label 7800 4700 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	8350 4500 7800 4500
Wire Bus Line
	8350 4600 7800 4600
Wire Bus Line
	8350 4700 7800 4700
Wire Bus Line
	7800 4800 8350 4800
Text Label 7800 4800 0    50   ~ 0
RSVD[1..4]
Text Label 7800 3800 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P 10850 6050
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR0168"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0168" H 10850 5900 50  0001 C CNN
F 1 "+5V" H 10792 6087 50  0000 R CNN
F 2 "" H 10850 6050 50  0001 C CNN
F 3 "" H 10850 6050 50  0001 C CNN
	1    10850 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552A6
P 10850 6450
AR Path="/5F67D4B5/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A6" Ref="#PWR0169"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR0169" H 10850 6200 50  0001 C CNN
F 1 "GND" H 10772 6413 50  0000 R CNN
F 2 "" H 10850 6450 50  0001 C CNN
F 3 "" H 10850 6450 50  0001 C CNN
	1    10850 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 6050 10850 6150
$Comp
L Device:CP_Small C60
U 1 1 5DD552AD
P 10850 6250
AR Path="/5DD552AD" Ref="C60"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C60" H 10762 6296 50  0000 R CNN
F 1 "47µF" H 10762 6205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10850 6250 50  0001 C CNN
F 3 "~" H 10850 6250 50  0001 C CNN
	1    10850 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 6350 10850 6450
$Comp
L power:+5V #PWR?
U 1 1 5DD552B4
P 10400 6050
AR Path="/5F67D4B5/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD552B4" Ref="#PWR0170"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0170" H 10400 5900 50  0001 C CNN
F 1 "+5V" H 10342 6087 50  0000 R CNN
F 2 "" H 10400 6050 50  0001 C CNN
F 3 "" H 10400 6050 50  0001 C CNN
	1    10400 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552BA
P 10400 6450
AR Path="/5F67D4B5/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD552BA" Ref="#PWR0171"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0171" H 10400 6200 50  0001 C CNN
F 1 "GND" H 10322 6413 50  0000 R CNN
F 2 "" H 10400 6450 50  0001 C CNN
F 3 "" H 10400 6450 50  0001 C CNN
	1    10400 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 6050 10400 6150
$Comp
L Device:CP_Small C59
U 1 1 5DD552C1
P 10400 6250
AR Path="/5DD552C1" Ref="C59"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C59" H 10312 6296 50  0000 R CNN
F 1 "47µF" H 10312 6205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10400 6250 50  0001 C CNN
F 3 "~" H 10400 6250 50  0001 C CNN
	1    10400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 6350 10400 6450
Text Notes 8300 1200 0    100  ~ 20
Edge Connector
Wire Wire Line
	9500 2600 10100 2600
NoConn ~ 7800 2200
NoConn ~ 7800 2300
NoConn ~ 7800 2900
NoConn ~ 7800 3000
NoConn ~ 7800 3100
NoConn ~ 7800 3200
NoConn ~ 7800 3300
NoConn ~ 7800 3400
NoConn ~ 7800 4800
Wire Wire Line
	9500 2500 10100 2500
Wire Wire Line
	9500 2400 10100 2400
Wire Wire Line
	9500 1600 9850 1600
Wire Wire Line
	9500 1700 9850 1700
Wire Wire Line
	9500 1800 9850 1800
Wire Wire Line
	9500 1900 9850 1900
Wire Wire Line
	9500 2000 9850 2000
Wire Wire Line
	9500 2100 9850 2100
Wire Wire Line
	9500 2200 9850 2200
Text Label 9850 1600 2    50   ~ 0
IR0
Text Label 9850 1700 2    50   ~ 0
IR1
Text Label 9850 1800 2    50   ~ 0
IR2
Text Label 9850 1900 2    50   ~ 0
IR3
Text Label 9850 2000 2    50   ~ 0
IR4
Text Label 9850 2100 2    50   ~ 0
IR5
Text Label 9850 2200 2    50   ~ 0
IR6
Entry Wire Line
	9850 2200 9950 2100
Entry Wire Line
	9850 2100 9950 2000
Entry Wire Line
	9850 2000 9950 1900
Entry Wire Line
	9850 1900 9950 1800
Entry Wire Line
	9850 1800 9950 1700
Entry Wire Line
	9850 1700 9950 1600
Entry Wire Line
	9850 1600 9950 1500
Entry Bus Bus
	9950 1450 10050 1350
Wire Bus Line
	10050 1350 10350 1350
Text Label 10350 1350 2    50   ~ 0
IR[0..6]
Text Label 10100 2600 2    50   ~ 0
~FLAGWE
Text Label 10100 2400 2    50   ~ 0
FL
Text Label 10100 2500 2    50   ~ 0
FV
Text Notes 10150 2400 0    50   ~ 0
← ALU
Text Notes 10150 1600 0    50   ~ 0
→ BUS.MBU
Text Label 7800 2200 0    50   ~ 0
AB[0..23]
Text Notes 10150 2600 0    50   ~ 0
→ ALU
Wire Wire Line
	9500 5500 10100 5500
Wire Wire Line
	8350 4300 7800 4300
Wire Wire Line
	8350 4400 7800 4400
Text Label 7800 4300 0    50   ~ 0
~RUEN
Text Label 7800 4400 0    50   ~ 0
~WUEN
Text Label 10100 5500 2    50   ~ 0
IN-RSVD
Text Notes 10200 5500 0    50   ~ 0
For future expansion
Text Notes 10150 1700 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 1800 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 1900 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 2000 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 2100 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 2500 0    50   ~ 0
← ALU
Wire Wire Line
	9500 5200 10100 5200
Wire Wire Line
	9500 5300 10100 5300
Wire Wire Line
	9500 5400 10100 5400
Wire Wire Line
	9500 4800 10100 4800
Wire Wire Line
	9500 4900 10100 4900
Wire Wire Line
	9500 5000 10100 5000
Wire Wire Line
	9500 5100 10100 5100
Wire Wire Line
	9500 4700 10100 4700
Text Label 10100 4700 2    50   ~ 0
COND0
Text Label 10100 4800 2    50   ~ 0
COND1
Text Label 10100 4900 2    50   ~ 0
COND2
Text Label 10100 5000 2    50   ~ 0
COND3
Text Label 10100 5100 2    50   ~ 0
COND4
Text Label 10100 5200 2    50   ~ 0
CEXT8
Text Label 10100 5300 2    50   ~ 0
CEXT9
Wire Wire Line
	9500 2700 10100 2700
Wire Wire Line
	9500 2800 10100 2800
Text Label 10100 2700 2    50   ~ 0
FZ
Text Label 10100 2800 2    50   ~ 0
FN
Text Notes 10150 2700 0    50   ~ 0
← REG
Text Notes 10150 2800 0    50   ~ 0
← REG
Wire Wire Line
	9500 2900 10100 2900
Wire Wire Line
	9500 3000 10100 3000
Wire Wire Line
	9500 3100 10100 3100
Wire Wire Line
	9500 3200 10100 3200
Wire Wire Line
	9500 3300 10100 3300
Wire Wire Line
	9500 3400 10100 3400
Text Label 10100 2900 2    50   ~ 0
PC10
Text Label 10100 3000 2    50   ~ 0
PC11
Text Label 10100 3100 2    50   ~ 0
PC12
Text Label 10100 3200 2    50   ~ 0
PC13
Text Label 10100 3300 2    50   ~ 0
PC14
Text Label 10100 3400 2    50   ~ 0
PC15
Text Notes 10150 2900 0    50   ~ 0
← REG
Text Notes 10150 3000 0    50   ~ 0
← REG
Text Notes 10150 3100 0    50   ~ 0
← REG
Text Notes 10150 3200 0    50   ~ 0
← REG
Text Notes 10150 3300 0    50   ~ 0
← REG
Text Notes 10150 3400 0    50   ~ 0
← REG
Wire Wire Line
	9500 3500 10100 3500
Text Label 10100 3500 2    50   ~ 0
~FPRESET
Wire Wire Line
	9500 3600 10100 3600
Text Label 10100 3600 2    50   ~ 0
FPCLK
Wire Wire Line
	9500 3700 10100 3700
Text Label 10100 3700 2    50   ~ 0
~FPCLK~⁄CLK
Wire Wire Line
	9500 4600 10100 4600
Text Label 10100 4600 2    50   ~ 0
POWEROK
Wire Wire Line
	9500 3800 10100 3800
Text Label 10100 3800 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes 10150 3500 0    50   ~ 0
← DFP
Text Notes 10150 3600 0    50   ~ 0
← DFP
Text Notes 10150 3700 0    50   ~ 0
← DFP
Text Notes 10150 4600 0    50   ~ 0
← PSU (backplane)
Text Notes 10150 3800 0    50   ~ 0
→ DFP
Text Notes 800  1000 0    100  ~ 20
The INT, IRC and RTC boards
Text Notes 800  1800 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Notes 10200 5200 0    50   ~ 0
For future expansion
Text Notes 10200 5300 0    50   ~ 0
For future expansion
Text Notes 10200 5100 0    50   ~ 0
For future expansion
Text Notes 10200 4800 0    50   ~ 0
For future expansion
Text Notes 10200 4900 0    50   ~ 0
For future expansion
Text Notes 10200 5000 0    50   ~ 0
For future expansion
Text Notes 10200 4700 0    50   ~ 0
For future expansion
Text Label 10100 4200 2    50   ~ 0
~FPµC2
Text Label 10100 4100 2    50   ~ 0
~FPµC1
Text Label 10100 4000 2    50   ~ 0
~FPµC0
Text Label 10100 3900 2    50   ~ 0
~FPµA0
Wire Wire Line
	9500 4200 10100 4200
Wire Wire Line
	9500 4100 10100 4100
Wire Wire Line
	9500 4000 10100 4000
Wire Wire Line
	9500 3900 10100 3900
Text Notes 10150 3900 0    50   ~ 0
← DFP
Text Notes 10150 4000 0    50   ~ 0
← DFP
Text Notes 10150 4100 0    50   ~ 0
← DFP
Text Notes 10150 4200 0    50   ~ 0
← DFP
Wire Wire Line
	9500 4300 10100 4300
Wire Wire Line
	9500 4400 10100 4400
Text Label 10100 4300 2    50   ~ 0
~FPIRL
Text Label 10100 4400 2    50   ~ 0
~FPIRH
Text Notes 10150 4300 0    50   ~ 0
← DFP
Text Notes 10150 4400 0    50   ~ 0
← DFP
Wire Wire Line
	9500 2300 10100 2300
Text Label 10100 2300 2    50   ~ 0
~WEN
Text Notes 10150 2300 0    50   ~ 0
← BUS
Wire Wire Line
	9500 4500 10100 4500
Text Notes 10150 4500 0    50   ~ 0
← DFP
Text Label 10100 4500 2    50   ~ 0
~FPFLAGS
Text Label 10100 5400 2    50   ~ 0
IDXEN
Text Notes 10150 2200 0    50   ~ 0
→ BUS.MBU
Text Notes 10200 5400 0    50   ~ 0
→ BUS.MBU
Text Notes 450  10250 1    50   ~ 10
IO=&030–037
$Comp
L alexios:74HC138 U?
U 1 1 5E74557E
P 400 10000
AR Path="/5F3EA987/5E74557E" Ref="U?"  Part="1" 
AR Path="/5E74557E" Ref="U22"  Part="1" 
AR Path="/61F95ACC/5E74557E" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E74557E" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E74557E" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/5E74557E" Ref="U?"  Part="1" 
F 0 "U22" H 400 10667 50  0000 C CNN
F 1 "74HC138" H 400 10576 50  0000 C CNN
F 2 "alexios:SOIC-16" H 400 10000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 400 10000 50  0001 C CNN
	1    400  10000
	1    0    0    -1  
$EndComp
Wire Wire Line
	-100 9600 -400 9600
Wire Wire Line
	-100 9700 -400 9700
Wire Wire Line
	-100 9800 -400 9800
Text Label -400 9600 0    50   ~ 0
AB3
Text Label -400 9700 0    50   ~ 0
AB4
Text Label -400 10200 0    50   ~ 0
AB5
Wire Wire Line
	-400 10200 -100 10200
Wire Wire Line
	-400 10300 -100 10300
Wire Wire Line
	-400 10400 -100 10400
$Comp
L alexios:74HC259 U26
U 1 1 5EB924D3
P 3200 9900
F 0 "U26" H 3200 10567 50  0000 C CNN
F 1 "74HC259" H 3200 10476 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3200 9900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT259.pdf" H 3200 9900 50  0001 C CNN
	1    3200 9900
	1    0    0    -1  
$EndComp
Entry Wire Line
	11100 11200 11200 11300
Entry Wire Line
	11100 11300 11200 11400
Entry Wire Line
	11100 11400 11200 11500
Entry Wire Line
	11100 11500 11200 11600
Entry Wire Line
	11100 11600 11200 11700
Entry Wire Line
	11100 11700 11200 11800
Entry Wire Line
	11100 11800 11200 11900
Entry Wire Line
	11100 11900 11200 12000
Wire Wire Line
	2700 10300 2400 10300
Text Label 2400 10300 0    50   ~ 0
~RESET
Wire Wire Line
	2700 10100 2400 10100
Text Label 2400 10100 0    50   ~ 0
~WIER
Wire Wire Line
	2700 9500 2400 9500
Wire Wire Line
	2700 9700 2400 9700
Wire Wire Line
	2700 9800 2400 9800
Wire Wire Line
	2700 9900 2400 9900
Text Label 2400 9500 0    50   ~ 0
DB0
Text Label 2400 9700 0    50   ~ 0
DB1
Text Label 2400 9800 0    50   ~ 0
DB2
Text Label 2400 9900 0    50   ~ 0
DB3
Entry Wire Line
	11100 10150 11200 10250
Entry Wire Line
	11100 10050 11200 10150
Entry Wire Line
	11100 9950 11200 10050
Entry Wire Line
	11100 9850 11200 9950
Entry Wire Line
	11100 9750 11200 9850
Entry Wire Line
	11100 9650 11200 9750
Entry Wire Line
	11100 9550 11200 9650
Entry Wire Line
	11100 9450 11200 9550
Text Label 7650 10200 2    50   ~ 0
DB7
Text Label 7650 10100 2    50   ~ 0
DB6
Text Label 7650 10000 2    50   ~ 0
DB5
Text Label 7650 9900 2    50   ~ 0
DB4
Text Label 7650 9800 2    50   ~ 0
DB3
Text Label 7650 9700 2    50   ~ 0
DB2
Text Label 7650 9600 2    50   ~ 0
DB1
Text Label 7650 9500 2    50   ~ 0
DB0
Text Label 6000 10200 0    50   ~ 0
IRF7
Text Label 6000 10100 0    50   ~ 0
IRF6
Text Label 6000 10000 0    50   ~ 0
IRF5
Text Label 6000 9900 0    50   ~ 0
IRF4
Text Label 6000 9800 0    50   ~ 0
IRF3
Text Label 6000 9700 0    50   ~ 0
IRF2
Text Label 6000 9600 0    50   ~ 0
IRF1
Text Label 6000 9500 0    50   ~ 0
IRF0
Wire Wire Line
	6350 10200 6000 10200
Wire Wire Line
	6350 10100 6000 10100
Wire Wire Line
	6350 10000 6000 10000
Wire Wire Line
	6350 9900 6000 9900
Wire Wire Line
	6350 9800 6000 9800
Wire Wire Line
	6350 9700 6000 9700
Wire Wire Line
	6350 9600 6000 9600
Wire Wire Line
	6350 9500 6000 9500
Text Label 6100 10400 0    50   ~ 0
~RISR
Wire Wire Line
	6350 10400 6100 10400
Wire Wire Line
	6300 10500 6300 10550
Wire Wire Line
	6350 10500 6300 10500
$Comp
L power:GND #PWR0126
U 1 1 5F15B1D8
P 6300 10550
F 0 "#PWR0126" H 6300 10300 50  0001 C CNN
F 1 "GND" H 6305 10377 50  0000 C CNN
F 2 "" H 6300 10550 50  0001 C CNN
F 3 "" H 6300 10550 50  0001 C CNN
	1    6300 10550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U17
U 1 1 5F15B1CA
P 6850 10000
F 0 "U17" H 6850 10767 50  0000 C CNN
F 1 "74HC541" H 6850 10676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6850 10000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6850 10000 50  0001 C CNN
	1    6850 10000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 9500 7700 9500
Wire Wire Line
	7350 9600 7700 9600
Wire Wire Line
	7350 9700 7700 9700
Wire Wire Line
	7350 9800 7700 9800
Wire Wire Line
	7350 9900 7700 9900
Wire Wire Line
	7350 10000 7700 10000
Wire Wire Line
	7350 10100 7700 10100
Wire Wire Line
	7350 10200 7700 10200
Entry Wire Line
	7700 9500 7800 9600
Entry Wire Line
	7700 9600 7800 9700
Entry Wire Line
	7700 9700 7800 9800
Entry Wire Line
	7700 9800 7800 9900
Entry Wire Line
	7700 9900 7800 10000
Entry Wire Line
	7700 10000 7800 10100
Entry Wire Line
	7700 10100 7800 10200
Entry Wire Line
	7700 10200 7800 10300
Text Label -400 10400 0    50   ~ 0
~SYSDEV
Text Label -400 10300 0    50   ~ 0
~R
$Comp
L alexios:74HC138 U?
U 1 1 5F455B9F
P 400 11350
AR Path="/5F3EA987/5F455B9F" Ref="U?"  Part="1" 
AR Path="/5F455B9F" Ref="U20"  Part="1" 
AR Path="/61F95ACC/5F455B9F" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5F455B9F" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5F455B9F" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/5F455B9F" Ref="U?"  Part="1" 
F 0 "U20" H 400 12017 50  0000 C CNN
F 1 "74HC138" H 400 11926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 400 11350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 400 11350 50  0001 C CNN
	1    400  11350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-100 10950 -400 10950
Wire Wire Line
	-100 11050 -400 11050
Wire Wire Line
	-100 11150 -400 11150
Wire Wire Line
	-100 11650 -400 11650
Wire Wire Line
	-100 11750 -400 11750
Text Label -400 11050 0    50   ~ 0
AB4
Text Label -400 11150 0    50   ~ 0
AB5
Text Label -400 11650 0    50   ~ 0
AB6
Text Label -400 11750 0    50   ~ 0
AB7
Wire Wire Line
	-100 11550 -400 11550
Text Label -400 10950 0    50   ~ 0
AB3
$Comp
L alexios:74LVC1G02 U19
U 1 1 5F4E1F97
P -600 11550
F 0 "U19" H -650 11817 50  0000 C CNN
F 1 "74LVC1G02" H -650 11726 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -650 11550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -650 11550 50  0001 C CNN
	1    -600 11550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-900 11500 -1200 11500
Text Label -1200 11500 0    50   ~ 0
~R
Text Label -1200 11600 0    50   ~ 0
~SYSDEV
Wire Wire Line
	-1200 11600 -900 11600
Text Notes 450  11600 1    50   ~ 10
IO=&030–037
Wire Wire Line
	900  11550 1300 11550
Wire Wire Line
	4000 9200 4250 9200
Wire Wire Line
	4000 9300 4250 9300
Wire Wire Line
	3700 9500 4250 9500
Wire Wire Line
	3700 9600 4250 9600
Wire Wire Line
	3700 9700 4250 9700
Wire Wire Line
	3700 9800 4250 9800
Wire Wire Line
	3700 9900 4250 9900
Wire Wire Line
	3700 10000 4250 10000
Wire Wire Line
	3700 10100 4250 10100
Wire Wire Line
	3700 10200 4250 10200
Wire Wire Line
	4000 10400 4250 10400
Wire Wire Line
	4000 10500 4250 10500
Wire Wire Line
	4000 10600 4250 10600
Wire Wire Line
	4000 10700 4250 10700
Wire Wire Line
	4000 10800 4250 10800
Wire Wire Line
	4000 10900 4250 10900
Wire Wire Line
	4000 11000 4250 11000
Wire Wire Line
	4000 11100 4250 11100
$Sheet
S 4250 9050 1150 2200
U 600C0F8F
F0 "IRQ State" 50
F1 "irq_state_ffs.sch" 50
F2 "~IRQ0" I L 4250 10400 50 
F3 "IEN0" I L 4250 9500 50 
F4 "~IRQ1" I L 4250 10500 50 
F5 "IEN1" I L 4250 9600 50 
F6 "~IRQ2" I L 4250 10600 50 
F7 "IEN2" I L 4250 9700 50 
F8 "~IRQ3" I L 4250 10700 50 
F9 "IEN3" I L 4250 9800 50 
F10 "CLK2" I L 4250 9200 50 
F11 "CLK3" I L 4250 9300 50 
F12 "IRF7" O R 5400 10200 50 
F13 "~IRQ4" I L 4250 10800 50 
F14 "~IRQ5" I L 4250 10900 50 
F15 "~IRQ6" I L 4250 11000 50 
F16 "~IRQ7" I L 4250 11100 50 
F17 "IEN4" I L 4250 9900 50 
F18 "IEN5" I L 4250 10000 50 
F19 "IEN6" I L 4250 10100 50 
F20 "IEN7" I L 4250 10200 50 
F21 "IRF0" O R 5400 9500 50 
F22 "IRF1" O R 5400 9600 50 
F23 "IRF2" O R 5400 9700 50 
F24 "IRF3" O R 5400 9800 50 
F25 "IRF4" O R 5400 9900 50 
F26 "IRF5" O R 5400 10000 50 
F27 "IRF6" O R 5400 10100 50 
$EndSheet
Text Label 4000 9200 0    50   ~ 0
CLK2
Text Label 4000 9300 0    50   ~ 0
CLK3
Text Label 4000 9500 0    50   ~ 0
IEN0
Text Label 4000 9600 0    50   ~ 0
IEN1
Text Label 4000 9700 0    50   ~ 0
IEN2
Text Label 4000 9800 0    50   ~ 0
IEN3
Text Label 4000 9900 0    50   ~ 0
IEN4
Text Label 4000 10000 0    50   ~ 0
IEN5
Text Label 4000 10100 0    50   ~ 0
IEN6
Text Label 4000 10200 0    50   ~ 0
IEN7
Text Label 4000 10400 0    50   ~ 0
~IRQ0
Text Label 4000 10500 0    50   ~ 0
~IRQ1
Text Label 4000 10600 0    50   ~ 0
~IRQ2
Text Label 4000 10700 0    50   ~ 0
~IRQ3
Text Label 4000 10800 0    50   ~ 0
~IRQ4
Text Label 4000 10900 0    50   ~ 0
~IRQ5
Text Label 4000 11000 0    50   ~ 0
~IRQ6
Text Label 4000 11100 0    50   ~ 0
~IRQ7
Text Label 5650 9500 2    50   ~ 0
IRF0
Text Label 5650 9600 2    50   ~ 0
IRF1
Text Label 5650 9700 2    50   ~ 0
IRF2
Text Label 5650 9800 2    50   ~ 0
IRF3
Text Label 5650 9900 2    50   ~ 0
IRF4
Text Label 5650 10000 2    50   ~ 0
IRF5
Text Label 5650 10100 2    50   ~ 0
IRF6
Text Label 5650 10200 2    50   ~ 0
IRF7
Wire Wire Line
	5400 9500 5800 9500
Wire Wire Line
	5400 9600 5800 9600
Wire Wire Line
	5400 9700 5800 9700
Wire Wire Line
	5400 9800 5800 9800
Wire Wire Line
	5400 9900 5800 9900
Wire Wire Line
	5400 10000 5800 10000
Wire Wire Line
	5400 10100 5800 10100
Wire Wire Line
	5400 10200 5800 10200
Entry Wire Line
	5800 9500 5900 9600
Entry Wire Line
	5800 9600 5900 9700
Entry Wire Line
	5800 9700 5900 9800
Entry Wire Line
	5800 9800 5900 9900
Entry Wire Line
	5800 9900 5900 10000
Entry Wire Line
	5800 10000 5900 10100
Entry Wire Line
	5800 10100 5900 10200
Entry Wire Line
	5800 10200 5900 10300
Entry Wire Line
	6000 9500 5900 9600
Entry Wire Line
	6000 9600 5900 9700
Entry Wire Line
	6000 9700 5900 9800
Entry Wire Line
	6000 9800 5900 9900
Entry Wire Line
	6000 9900 5900 10000
Entry Wire Line
	6000 10000 5900 10100
Entry Wire Line
	6000 10100 5900 10200
Entry Wire Line
	6000 10200 5900 10300
Text Label 9400 11900 0    50   ~ 0
IEN7
Text Label 9400 11800 0    50   ~ 0
IEN6
Text Label 9400 11700 0    50   ~ 0
IEN5
Text Label 9400 11600 0    50   ~ 0
IEN4
Text Label 9400 11500 0    50   ~ 0
IEN3
Text Label 9400 11400 0    50   ~ 0
IEN2
Text Label 9400 11300 0    50   ~ 0
IEN1
Text Label 9400 11200 0    50   ~ 0
IEN0
Wire Wire Line
	10750 11900 11100 11900
Wire Wire Line
	10750 11800 11100 11800
Wire Wire Line
	10750 11700 11100 11700
Wire Wire Line
	10750 11600 11100 11600
Wire Wire Line
	10750 11500 11100 11500
Wire Wire Line
	10750 11400 11100 11400
Wire Wire Line
	10750 11300 11100 11300
Wire Wire Line
	10750 11200 11100 11200
$Comp
L alexios:74HC541 U31
U 1 1 5EEED7F8
P 10250 11700
F 0 "U31" H 10250 12467 50  0000 C CNN
F 1 "74HC541" H 10250 12376 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 10250 11700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10250 11700 50  0001 C CNN
	1    10250 11700
	1    0    0    -1  
$EndComp
Text Label 11050 11200 2    50   ~ 0
FPD0
Text Label 11050 11300 2    50   ~ 0
FPD1
Text Label 11050 11400 2    50   ~ 0
FPD2
Text Label 11050 11500 2    50   ~ 0
FPD3
Text Label 11050 11600 2    50   ~ 0
FPD4
Text Label 11050 11700 2    50   ~ 0
FPD5
Text Label 11050 11800 2    50   ~ 0
FPD6
Text Label 11050 11900 2    50   ~ 0
FPD7
$Comp
L power:GND #PWR0122
U 1 1 5EEED7EA
P 9700 12250
F 0 "#PWR0122" H 9700 12000 50  0001 C CNN
F 1 "GND" H 9705 12077 50  0000 C CNN
F 2 "" H 9700 12250 50  0001 C CNN
F 3 "" H 9700 12250 50  0001 C CNN
	1    9700 12250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 12200 9700 12200
Wire Wire Line
	9700 12200 9700 12250
Wire Wire Line
	9750 12100 9400 12100
Text Label 9400 12100 0    50   ~ 0
~FPIRF
Wire Wire Line
	9750 11200 9400 11200
Wire Wire Line
	9750 11300 9400 11300
Wire Wire Line
	9750 11400 9400 11400
Wire Wire Line
	9750 11500 9400 11500
Wire Wire Line
	9750 11600 9400 11600
Wire Wire Line
	9750 11700 9400 11700
Wire Wire Line
	9750 11800 9400 11800
Wire Wire Line
	9750 11900 9400 11900
Wire Wire Line
	6300 11900 6300 12200
Connection ~ 6300 11900
Wire Wire Line
	6350 11900 6300 11900
Wire Wire Line
	6300 11800 6300 11900
Connection ~ 6300 11800
Wire Wire Line
	6350 11800 6300 11800
Wire Wire Line
	6300 11700 6300 11800
Connection ~ 6300 11700
Wire Wire Line
	6350 11700 6300 11700
Connection ~ 6300 12200
Wire Wire Line
	6300 11600 6300 11700
Wire Wire Line
	6350 11600 6300 11600
Wire Wire Line
	6300 11400 6300 11500
Connection ~ 6300 11400
Wire Wire Line
	6350 11400 6300 11400
Wire Wire Line
	6300 11300 6300 11400
Connection ~ 6300 11300
Wire Wire Line
	6350 11300 6300 11300
Wire Wire Line
	6300 11200 6300 11300
Connection ~ 6300 11200
Wire Wire Line
	6350 11200 6300 11200
Wire Wire Line
	6300 11500 6350 11500
Wire Wire Line
	6300 11100 6300 11200
$Comp
L power:+5V #PWR0131
U 1 1 5F5B442C
P 6300 11100
F 0 "#PWR0131" H 6300 10950 50  0001 C CNN
F 1 "+5V" H 6315 11273 50  0000 C CNN
F 2 "" H 6300 11100 50  0001 C CNN
F 3 "" H 6300 11100 50  0001 C CNN
	1    6300 11100
	1    0    0    -1  
$EndComp
Text Label 7650 11900 2    50   ~ 0
DB15
Text Label 7650 11800 2    50   ~ 0
DB14
Text Label 7650 11700 2    50   ~ 0
DB13
Text Label 7650 11600 2    50   ~ 0
DB12
Text Label 7650 11500 2    50   ~ 0
DB11
Text Label 7650 11400 2    50   ~ 0
DB10
Text Label 7650 11300 2    50   ~ 0
DB9
Text Label 7650 11200 2    50   ~ 0
DB8
Entry Wire Line
	7700 11900 7800 12000
Entry Wire Line
	7700 11800 7800 11900
Entry Wire Line
	7700 11700 7800 11800
Entry Wire Line
	7700 11600 7800 11700
Entry Wire Line
	7700 11500 7800 11600
Entry Wire Line
	7700 11400 7800 11500
Entry Wire Line
	7700 11300 7800 11400
Entry Wire Line
	7700 11200 7800 11300
Wire Wire Line
	7350 11900 7700 11900
Wire Wire Line
	7350 11800 7700 11800
Wire Wire Line
	7350 11700 7700 11700
Wire Wire Line
	7350 11600 7700 11600
Wire Wire Line
	7350 11500 7700 11500
Wire Wire Line
	7350 11400 7700 11400
Wire Wire Line
	7350 11300 7700 11300
Wire Wire Line
	7350 11200 7700 11200
$Comp
L alexios:74HC541 U49
U 1 1 5F4792B5
P 6850 11700
F 0 "U49" H 6850 12467 50  0000 C CNN
F 1 "74HC541" H 6850 12376 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6850 11700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6850 11700 50  0001 C CNN
	1    6850 11700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 5F4792AF
P 6300 12250
F 0 "#PWR0128" H 6300 12000 50  0001 C CNN
F 1 "GND" H 6305 12077 50  0000 C CNN
F 2 "" H 6300 12250 50  0001 C CNN
F 3 "" H 6300 12250 50  0001 C CNN
	1    6300 12250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 12200 6300 12200
Wire Wire Line
	6300 12200 6300 12250
Wire Wire Line
	6350 12100 6000 12100
Text Label 6000 12100 0    50   ~ 0
~RISR
Text Label 9400 10150 0    50   ~ 0
IRF7
Text Label 9400 10050 0    50   ~ 0
IRF6
Text Label 9400 9950 0    50   ~ 0
IRF5
Text Label 9400 9850 0    50   ~ 0
IRF4
Text Label 9400 9750 0    50   ~ 0
IRF3
Text Label 9400 9650 0    50   ~ 0
IRF2
Text Label 9400 9550 0    50   ~ 0
IRF1
Text Label 9400 9450 0    50   ~ 0
IRF0
Wire Wire Line
	9750 10150 9400 10150
Wire Wire Line
	9750 10050 9400 10050
Wire Wire Line
	9750 9950 9400 9950
Wire Wire Line
	9750 9850 9400 9850
Wire Wire Line
	9750 9750 9400 9750
Wire Wire Line
	9750 9650 9400 9650
Wire Wire Line
	9750 9550 9400 9550
Wire Wire Line
	9750 9450 9400 9450
Text Label 9400 10350 0    50   ~ 0
~FPIRF
Wire Wire Line
	9750 10350 9400 10350
Wire Wire Line
	9700 10450 9700 10500
Wire Wire Line
	9750 10450 9700 10450
$Comp
L power:GND #PWR0125
U 1 1 5EC8C696
P 9700 10500
F 0 "#PWR0125" H 9700 10250 50  0001 C CNN
F 1 "GND" H 9705 10327 50  0000 C CNN
F 2 "" H 9700 10500 50  0001 C CNN
F 3 "" H 9700 10500 50  0001 C CNN
	1    9700 10500
	1    0    0    -1  
$EndComp
Text Label 11050 10150 2    50   ~ 0
FPD7
Text Label 11050 10050 2    50   ~ 0
FPD6
Text Label 11050 9950 2    50   ~ 0
FPD5
Text Label 11050 9850 2    50   ~ 0
FPD4
Text Label 11050 9750 2    50   ~ 0
FPD3
Text Label 11050 9650 2    50   ~ 0
FPD2
Text Label 11050 9550 2    50   ~ 0
FPD1
Text Label 11050 9450 2    50   ~ 0
FPD0
$Comp
L alexios:74HC541 U21
U 1 1 5EB94CCA
P 10250 9950
F 0 "U21" H 10250 10717 50  0000 C CNN
F 1 "74HC541" H 10250 10626 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 10250 9950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10250 9950 50  0001 C CNN
	1    10250 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 9450 11100 9450
Wire Wire Line
	10750 9550 11100 9550
Wire Wire Line
	10750 9650 11100 9650
Wire Wire Line
	10750 9750 11100 9750
Wire Wire Line
	10750 9850 11100 9850
Wire Wire Line
	10750 9950 11100 9950
Wire Wire Line
	10750 10050 11100 10050
Wire Wire Line
	10750 10150 11100 10150
Text Label 5500 13600 2    50   ~ 0
DB7
Text Label 5500 13500 2    50   ~ 0
DB6
Text Label 5500 13400 2    50   ~ 0
DB5
Text Label 5500 13300 2    50   ~ 0
DB4
Text Label 5500 13200 2    50   ~ 0
DB3
Text Label 5500 13100 2    50   ~ 0
DB2
Text Label 5500 13000 2    50   ~ 0
DB1
Text Label 5500 12900 2    50   ~ 0
DB0
Wire Wire Line
	4200 13600 3850 13600
Wire Wire Line
	4200 13500 3850 13500
Wire Wire Line
	4200 13400 3850 13400
Wire Wire Line
	4200 13300 3850 13300
Wire Wire Line
	4200 13200 3850 13200
Wire Wire Line
	4200 13100 3850 13100
Wire Wire Line
	4200 13000 3850 13000
Wire Wire Line
	4200 12900 3850 12900
Text Label 3950 13800 0    50   ~ 0
~RIER
Wire Wire Line
	4200 13800 3950 13800
Wire Wire Line
	4150 13900 4150 13950
Wire Wire Line
	4200 13900 4150 13900
$Comp
L power:GND #PWR0101
U 1 1 60DEE209
P 4150 13950
F 0 "#PWR0101" H 4150 13700 50  0001 C CNN
F 1 "GND" H 4155 13777 50  0000 C CNN
F 2 "" H 4150 13950 50  0001 C CNN
F 3 "" H 4150 13950 50  0001 C CNN
	1    4150 13950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U18
U 1 1 60DEE20F
P 4700 13400
F 0 "U18" H 4700 14167 50  0000 C CNN
F 1 "74HC541" H 4700 14076 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4700 13400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4700 13400 50  0001 C CNN
	1    4700 13400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 12900 5550 12900
Wire Wire Line
	5200 13000 5550 13000
Wire Wire Line
	5200 13100 5550 13100
Wire Wire Line
	5200 13200 5550 13200
Wire Wire Line
	5200 13300 5550 13300
Wire Wire Line
	5200 13400 5550 13400
Wire Wire Line
	5200 13500 5550 13500
Wire Wire Line
	5200 13600 5550 13600
Entry Wire Line
	5550 12900 5650 13000
Entry Wire Line
	5550 13000 5650 13100
Entry Wire Line
	5550 13100 5650 13200
Entry Wire Line
	5550 13200 5650 13300
Entry Wire Line
	5550 13300 5650 13400
Entry Wire Line
	5550 13400 5650 13500
Entry Wire Line
	5550 13500 5650 13600
Entry Wire Line
	5550 13600 5650 13700
Text Label 3850 12900 0    50   ~ 0
IEN0
Text Label 3850 13000 0    50   ~ 0
IEN1
Text Label 3850 13100 0    50   ~ 0
IEN2
Text Label 3850 13200 0    50   ~ 0
IEN3
Text Label 3850 13300 0    50   ~ 0
IEN4
Text Label 3850 13400 0    50   ~ 0
IEN5
Text Label 3850 13500 0    50   ~ 0
IEN6
Text Label 3850 13600 0    50   ~ 0
IEN7
$Comp
L alexios:74HC193 U23
U 1 1 60FDB493
P -5650 2200
F 0 "U23" H -5650 2867 50  0000 C CNN
F 1 "74HC193" H -5650 2776 50  0000 C CNN
F 2 "alexios:SOIC-16" H -5600 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -5600 2200 50  0001 C CNN
	1    -5650 2200
	1    0    0    -1  
$EndComp
NoConn ~ -5150 1800
NoConn ~ -5150 1900
NoConn ~ -5150 2000
NoConn ~ -5150 2100
NoConn ~ -5150 2500
Text Label -6750 1800 0    50   ~ 0
DB0
Text Label -6750 1900 0    50   ~ 0
DB1
Text Label -6750 2000 0    50   ~ 0
DB2
Text Label -6750 2100 0    50   ~ 0
DB3
Text Label -6750 3250 0    50   ~ 0
DB4
Text Label -6750 3350 0    50   ~ 0
DB5
Text Label -6750 3450 0    50   ~ 0
DB6
Text Label -6750 3550 0    50   ~ 0
DB7
Text Label -6750 4700 0    50   ~ 0
DB8
Text Label -6750 4800 0    50   ~ 0
DB9
Text Label -6750 4900 0    50   ~ 0
DB10
Text Label -6750 5000 0    50   ~ 0
DB11
Text Label -6750 6150 0    50   ~ 0
DB12
Text Label -6750 6250 0    50   ~ 0
DB13
Text Label -6750 6350 0    50   ~ 0
DB14
Text Label -6750 6450 0    50   ~ 0
DB15
Wire Wire Line
	-5150 2600 -5050 2600
Wire Wire Line
	-5050 2600 -5050 2900
Wire Wire Line
	-5050 2900 -6450 2900
Wire Wire Line
	-6450 2900 -6450 4050
Wire Wire Line
	-6450 4050 -6150 4050
Wire Wire Line
	-6150 2300 -6350 2300
Text Label -6350 2300 0    50   ~ 0
~WT0
$Comp
L power:+5V #PWR0102
U 1 1 61431B14
P -6200 2450
F 0 "#PWR0102" H -6200 2300 50  0001 C CNN
F 1 "+5V" H -6258 2487 50  0000 R CNN
F 2 "" H -6200 2450 50  0001 C CNN
F 3 "" H -6200 2450 50  0001 C CNN
	1    -6200 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6200 2450 -6200 2500
Wire Wire Line
	-6200 2500 -6150 2500
$Comp
L power:GND #PWR0103
U 1 1 6144D9CF
P -6200 2750
F 0 "#PWR0103" H -6200 2500 50  0001 C CNN
F 1 "GND" H -6278 2713 50  0000 R CNN
F 2 "" H -6200 2750 50  0001 C CNN
F 3 "" H -6200 2750 50  0001 C CNN
	1    -6200 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6150 2700 -6200 2700
Wire Wire Line
	-6200 2700 -6200 2750
$Comp
L alexios:74HC193 U24
U 1 1 6146B611
P -5650 3650
F 0 "U24" H -5650 4317 50  0000 C CNN
F 1 "74HC193" H -5650 4226 50  0000 C CNN
F 2 "alexios:SOIC-16" H -5600 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -5600 3650 50  0001 C CNN
	1    -5650 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 6146B617
P -6200 3900
F 0 "#PWR0104" H -6200 3750 50  0001 C CNN
F 1 "+5V" H -6258 3937 50  0000 R CNN
F 2 "" H -6200 3900 50  0001 C CNN
F 3 "" H -6200 3900 50  0001 C CNN
	1    -6200 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6200 3900 -6200 3950
Wire Wire Line
	-6200 3950 -6150 3950
$Comp
L power:GND #PWR0105
U 1 1 6146B61F
P -6200 4200
F 0 "#PWR0105" H -6200 3950 50  0001 C CNN
F 1 "GND" H -6278 4163 50  0000 R CNN
F 2 "" H -6200 4200 50  0001 C CNN
F 3 "" H -6200 4200 50  0001 C CNN
	1    -6200 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6150 4150 -6200 4150
Wire Wire Line
	-6200 4150 -6200 4200
Wire Wire Line
	-5050 4050 -5050 4350
Wire Wire Line
	-5050 4350 -6450 4350
Wire Wire Line
	-6450 4350 -6450 5500
Wire Wire Line
	-6450 5500 -6150 5500
$Comp
L alexios:74HC193 U25
U 1 1 6148B9F4
P -5650 5100
F 0 "U25" H -5650 5767 50  0000 C CNN
F 1 "74HC193" H -5650 5676 50  0000 C CNN
F 2 "alexios:SOIC-16" H -5600 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -5600 5100 50  0001 C CNN
	1    -5650 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 6148B9FA
P -6200 5350
F 0 "#PWR0106" H -6200 5200 50  0001 C CNN
F 1 "+5V" H -6258 5387 50  0000 R CNN
F 2 "" H -6200 5350 50  0001 C CNN
F 3 "" H -6200 5350 50  0001 C CNN
	1    -6200 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6200 5350 -6200 5400
Wire Wire Line
	-6200 5400 -6150 5400
$Comp
L power:GND #PWR0107
U 1 1 6148BA02
P -6200 5650
F 0 "#PWR0107" H -6200 5400 50  0001 C CNN
F 1 "GND" H -6278 5613 50  0000 R CNN
F 2 "" H -6200 5650 50  0001 C CNN
F 3 "" H -6200 5650 50  0001 C CNN
	1    -6200 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6150 5600 -6200 5600
Wire Wire Line
	-6200 5600 -6200 5650
Wire Wire Line
	-5050 5500 -5050 5800
Wire Wire Line
	-5050 5800 -6450 5800
Wire Wire Line
	-6450 5800 -6450 6950
Wire Wire Line
	-6450 6950 -6150 6950
$Comp
L alexios:74HC193 U27
U 1 1 614A9CF2
P -5650 6550
F 0 "U27" H -5650 7217 50  0000 C CNN
F 1 "74HC193" H -5650 7126 50  0000 C CNN
F 2 "alexios:SOIC-16" H -5600 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -5600 6550 50  0001 C CNN
	1    -5650 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 614A9CF8
P -6200 6800
F 0 "#PWR0108" H -6200 6650 50  0001 C CNN
F 1 "+5V" H -6258 6837 50  0000 R CNN
F 2 "" H -6200 6800 50  0001 C CNN
F 3 "" H -6200 6800 50  0001 C CNN
	1    -6200 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6200 6800 -6200 6850
Wire Wire Line
	-6200 6850 -6150 6850
$Comp
L power:GND #PWR0109
U 1 1 614A9D00
P -6200 7100
F 0 "#PWR0109" H -6200 6850 50  0001 C CNN
F 1 "GND" H -6278 7063 50  0000 R CNN
F 2 "" H -6200 7100 50  0001 C CNN
F 3 "" H -6200 7100 50  0001 C CNN
	1    -6200 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6150 7050 -6200 7050
Wire Wire Line
	-6200 7050 -6200 7100
Wire Wire Line
	-5150 4050 -5050 4050
Wire Wire Line
	-5150 5500 -5050 5500
NoConn ~ -5150 6850
NoConn ~ -5150 5400
NoConn ~ -5150 3950
Wire Wire Line
	-6150 2600 -6350 2600
Text Label -6350 2600 0    50   ~ 0
TCP0
Wire Wire Line
	-6150 3750 -6350 3750
Wire Wire Line
	-6150 5200 -6350 5200
Text Label -6350 5200 0    50   ~ 0
TCP0
Wire Wire Line
	-6150 6650 -6350 6650
Text Label -6350 6650 0    50   ~ 0
TCP0
NoConn ~ -5150 3250
NoConn ~ -5150 3350
NoConn ~ -5150 3450
NoConn ~ -5150 3550
NoConn ~ -5150 4700
NoConn ~ -5150 4800
NoConn ~ -5150 4900
NoConn ~ -5150 5000
NoConn ~ -5150 6150
NoConn ~ -5150 6250
NoConn ~ -5150 6350
NoConn ~ -5150 6450
Wire Wire Line
	-5150 6950 -4850 6950
Text Label -4850 6950 2    50   ~ 0
TTC0
$Comp
L alexios:74HC193 U28
U 1 1 6186A687
P -3500 2200
F 0 "U28" H -3500 2867 50  0000 C CNN
F 1 "74HC193" H -3500 2776 50  0000 C CNN
F 2 "alexios:SOIC-16" H -3450 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -3450 2200 50  0001 C CNN
	1    -3500 2200
	1    0    0    -1  
$EndComp
NoConn ~ -3000 1800
NoConn ~ -3000 1900
NoConn ~ -3000 2000
NoConn ~ -3000 2100
NoConn ~ -3000 2500
Wire Wire Line
	-3000 2600 -2900 2600
Wire Wire Line
	-2900 2600 -2900 2900
Wire Wire Line
	-2900 2900 -4300 2900
Wire Wire Line
	-4300 2900 -4300 4050
Wire Wire Line
	-4300 4050 -4000 4050
Wire Wire Line
	-4000 2300 -4200 2300
Text Label -4200 2300 0    50   ~ 0
~WT0
$Comp
L power:+5V #PWR0110
U 1 1 6186A6B9
P -4050 2450
F 0 "#PWR0110" H -4050 2300 50  0001 C CNN
F 1 "+5V" H -4108 2487 50  0000 R CNN
F 2 "" H -4050 2450 50  0001 C CNN
F 3 "" H -4050 2450 50  0001 C CNN
	1    -4050 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4050 2450 -4050 2500
Wire Wire Line
	-4050 2500 -4000 2500
$Comp
L power:GND #PWR0111
U 1 1 6186A6C1
P -4050 2750
F 0 "#PWR0111" H -4050 2500 50  0001 C CNN
F 1 "GND" H -4128 2713 50  0000 R CNN
F 2 "" H -4050 2750 50  0001 C CNN
F 3 "" H -4050 2750 50  0001 C CNN
	1    -4050 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4000 2700 -4050 2700
Wire Wire Line
	-4050 2700 -4050 2750
$Comp
L alexios:74HC193 U29
U 1 1 6186A6C9
P -3500 3650
F 0 "U29" H -3500 4317 50  0000 C CNN
F 1 "74HC193" H -3500 4226 50  0000 C CNN
F 2 "alexios:SOIC-16" H -3450 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -3450 3650 50  0001 C CNN
	1    -3500 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 6186A6CF
P -4050 3900
F 0 "#PWR0112" H -4050 3750 50  0001 C CNN
F 1 "+5V" H -4108 3937 50  0000 R CNN
F 2 "" H -4050 3900 50  0001 C CNN
F 3 "" H -4050 3900 50  0001 C CNN
	1    -4050 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4050 3900 -4050 3950
Wire Wire Line
	-4050 3950 -4000 3950
$Comp
L power:GND #PWR0113
U 1 1 6186A6D7
P -4050 4200
F 0 "#PWR0113" H -4050 3950 50  0001 C CNN
F 1 "GND" H -4128 4163 50  0000 R CNN
F 2 "" H -4050 4200 50  0001 C CNN
F 3 "" H -4050 4200 50  0001 C CNN
	1    -4050 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4000 4150 -4050 4150
Wire Wire Line
	-4050 4150 -4050 4200
Wire Wire Line
	-2900 4050 -2900 4350
Wire Wire Line
	-2900 4350 -4300 4350
Wire Wire Line
	-4300 4350 -4300 5500
Wire Wire Line
	-4300 5500 -4000 5500
$Comp
L alexios:74HC193 U30
U 1 1 6186A6E3
P -3500 5100
F 0 "U30" H -3500 5767 50  0000 C CNN
F 1 "74HC193" H -3500 5676 50  0000 C CNN
F 2 "alexios:SOIC-16" H -3450 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -3450 5100 50  0001 C CNN
	1    -3500 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 6186A6E9
P -4050 5350
F 0 "#PWR0114" H -4050 5200 50  0001 C CNN
F 1 "+5V" H -4108 5387 50  0000 R CNN
F 2 "" H -4050 5350 50  0001 C CNN
F 3 "" H -4050 5350 50  0001 C CNN
	1    -4050 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4050 5350 -4050 5400
Wire Wire Line
	-4050 5400 -4000 5400
$Comp
L power:GND #PWR0115
U 1 1 6186A6F1
P -4050 5650
F 0 "#PWR0115" H -4050 5400 50  0001 C CNN
F 1 "GND" H -4128 5613 50  0000 R CNN
F 2 "" H -4050 5650 50  0001 C CNN
F 3 "" H -4050 5650 50  0001 C CNN
	1    -4050 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4000 5600 -4050 5600
Wire Wire Line
	-4050 5600 -4050 5650
Wire Wire Line
	-2900 5500 -2900 5800
Wire Wire Line
	-2900 5800 -4300 5800
Wire Wire Line
	-4300 5800 -4300 6950
Wire Wire Line
	-4300 6950 -4000 6950
$Comp
L alexios:74HC193 U32
U 1 1 6186A6FD
P -3500 6550
F 0 "U32" H -3500 7217 50  0000 C CNN
F 1 "74HC193" H -3500 7126 50  0000 C CNN
F 2 "alexios:SOIC-16" H -3450 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -3450 6550 50  0001 C CNN
	1    -3500 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 6186A703
P -4050 6800
F 0 "#PWR0116" H -4050 6650 50  0001 C CNN
F 1 "+5V" H -4108 6837 50  0000 R CNN
F 2 "" H -4050 6800 50  0001 C CNN
F 3 "" H -4050 6800 50  0001 C CNN
	1    -4050 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4050 6800 -4050 6850
Wire Wire Line
	-4050 6850 -4000 6850
$Comp
L power:GND #PWR0117
U 1 1 6186A70B
P -4050 7100
F 0 "#PWR0117" H -4050 6850 50  0001 C CNN
F 1 "GND" H -4128 7063 50  0000 R CNN
F 2 "" H -4050 7100 50  0001 C CNN
F 3 "" H -4050 7100 50  0001 C CNN
	1    -4050 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4000 7050 -4050 7050
Wire Wire Line
	-4050 7050 -4050 7100
Wire Wire Line
	-3000 4050 -2900 4050
Wire Wire Line
	-3000 5500 -2900 5500
NoConn ~ -3000 6850
NoConn ~ -3000 5400
NoConn ~ -3000 3950
Wire Wire Line
	-4000 2600 -4200 2600
Text Label -4200 2600 0    50   ~ 0
TCP1
Wire Wire Line
	-4000 3750 -4200 3750
Wire Wire Line
	-4000 5200 -4200 5200
Wire Wire Line
	-4000 6650 -4200 6650
NoConn ~ -3000 3250
NoConn ~ -3000 3350
NoConn ~ -3000 3450
NoConn ~ -3000 3550
NoConn ~ -3000 4700
NoConn ~ -3000 4800
NoConn ~ -3000 4900
NoConn ~ -3000 5000
NoConn ~ -3000 6150
NoConn ~ -3000 6250
NoConn ~ -3000 6350
NoConn ~ -3000 6450
Wire Wire Line
	-3000 6950 -2700 6950
$Comp
L alexios:74HC193 U33
U 1 1 618A96E1
P -1350 2200
F 0 "U33" H -1350 2867 50  0000 C CNN
F 1 "74HC193" H -1350 2776 50  0000 C CNN
F 2 "alexios:SOIC-16" H -1300 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -1300 2200 50  0001 C CNN
	1    -1350 2200
	1    0    0    -1  
$EndComp
NoConn ~ -850 1800
NoConn ~ -850 1900
NoConn ~ -850 2000
NoConn ~ -850 2100
NoConn ~ -850 2500
Wire Wire Line
	-850 2600 -750 2600
Wire Wire Line
	-750 2600 -750 2900
Wire Wire Line
	-750 2900 -2150 2900
Wire Wire Line
	-2150 2900 -2150 4050
Wire Wire Line
	-2150 4050 -1850 4050
Wire Wire Line
	-1850 2300 -2050 2300
Text Label -2050 2300 0    50   ~ 0
~WT0
$Comp
L power:+5V #PWR0118
U 1 1 618A9713
P -1900 2450
F 0 "#PWR0118" H -1900 2300 50  0001 C CNN
F 1 "+5V" H -1958 2487 50  0000 R CNN
F 2 "" H -1900 2450 50  0001 C CNN
F 3 "" H -1900 2450 50  0001 C CNN
	1    -1900 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1900 2450 -1900 2500
Wire Wire Line
	-1900 2500 -1850 2500
$Comp
L power:GND #PWR0119
U 1 1 618A971B
P -1900 2750
F 0 "#PWR0119" H -1900 2500 50  0001 C CNN
F 1 "GND" H -1978 2713 50  0000 R CNN
F 2 "" H -1900 2750 50  0001 C CNN
F 3 "" H -1900 2750 50  0001 C CNN
	1    -1900 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1850 2700 -1900 2700
Wire Wire Line
	-1900 2700 -1900 2750
$Comp
L alexios:74HC193 U34
U 1 1 618A9723
P -1350 3650
F 0 "U34" H -1350 4317 50  0000 C CNN
F 1 "74HC193" H -1350 4226 50  0000 C CNN
F 2 "alexios:SOIC-16" H -1300 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -1300 3650 50  0001 C CNN
	1    -1350 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0120
U 1 1 618A9729
P -1900 3900
F 0 "#PWR0120" H -1900 3750 50  0001 C CNN
F 1 "+5V" H -1958 3937 50  0000 R CNN
F 2 "" H -1900 3900 50  0001 C CNN
F 3 "" H -1900 3900 50  0001 C CNN
	1    -1900 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1900 3900 -1900 3950
Wire Wire Line
	-1900 3950 -1850 3950
$Comp
L power:GND #PWR0121
U 1 1 618A9731
P -1900 4200
F 0 "#PWR0121" H -1900 3950 50  0001 C CNN
F 1 "GND" H -1978 4163 50  0000 R CNN
F 2 "" H -1900 4200 50  0001 C CNN
F 3 "" H -1900 4200 50  0001 C CNN
	1    -1900 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1850 4150 -1900 4150
Wire Wire Line
	-1900 4150 -1900 4200
Wire Wire Line
	-750 4050 -750 4350
Wire Wire Line
	-750 4350 -2150 4350
Wire Wire Line
	-2150 4350 -2150 5500
Wire Wire Line
	-2150 5500 -1850 5500
$Comp
L alexios:74HC193 U35
U 1 1 618A973D
P -1350 5100
F 0 "U35" H -1350 5767 50  0000 C CNN
F 1 "74HC193" H -1350 5676 50  0000 C CNN
F 2 "alexios:SOIC-16" H -1300 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -1300 5100 50  0001 C CNN
	1    -1350 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 618A9743
P -1900 5350
F 0 "#PWR0123" H -1900 5200 50  0001 C CNN
F 1 "+5V" H -1958 5387 50  0000 R CNN
F 2 "" H -1900 5350 50  0001 C CNN
F 3 "" H -1900 5350 50  0001 C CNN
	1    -1900 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1900 5350 -1900 5400
Wire Wire Line
	-1900 5400 -1850 5400
$Comp
L power:GND #PWR0124
U 1 1 618A974B
P -1900 5650
F 0 "#PWR0124" H -1900 5400 50  0001 C CNN
F 1 "GND" H -1978 5613 50  0000 R CNN
F 2 "" H -1900 5650 50  0001 C CNN
F 3 "" H -1900 5650 50  0001 C CNN
	1    -1900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1850 5600 -1900 5600
Wire Wire Line
	-1900 5600 -1900 5650
Wire Wire Line
	-750 5500 -750 5800
Wire Wire Line
	-750 5800 -2150 5800
Wire Wire Line
	-2150 5800 -2150 6950
Wire Wire Line
	-2150 6950 -1850 6950
$Comp
L alexios:74HC193 U36
U 1 1 618A9757
P -1350 6550
F 0 "U36" H -1350 7217 50  0000 C CNN
F 1 "74HC193" H -1350 7126 50  0000 C CNN
F 2 "alexios:SOIC-16" H -1300 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H -1300 6550 50  0001 C CNN
	1    -1350 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0127
U 1 1 618A975D
P -1900 6800
F 0 "#PWR0127" H -1900 6650 50  0001 C CNN
F 1 "+5V" H -1958 6837 50  0000 R CNN
F 2 "" H -1900 6800 50  0001 C CNN
F 3 "" H -1900 6800 50  0001 C CNN
	1    -1900 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1900 6800 -1900 6850
Wire Wire Line
	-1900 6850 -1850 6850
$Comp
L power:GND #PWR0129
U 1 1 618A9765
P -1900 7100
F 0 "#PWR0129" H -1900 6850 50  0001 C CNN
F 1 "GND" H -1978 7063 50  0000 R CNN
F 2 "" H -1900 7100 50  0001 C CNN
F 3 "" H -1900 7100 50  0001 C CNN
	1    -1900 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1850 7050 -1900 7050
Wire Wire Line
	-1900 7050 -1900 7100
Wire Wire Line
	-850 4050 -750 4050
Wire Wire Line
	-850 5500 -750 5500
NoConn ~ -850 6850
NoConn ~ -850 5400
NoConn ~ -850 3950
Wire Wire Line
	-1850 2600 -2050 2600
Text Label -2050 2600 0    50   ~ 0
TCP2
Wire Wire Line
	-1850 3750 -2050 3750
Wire Wire Line
	-1850 5200 -2050 5200
Wire Wire Line
	-1850 6650 -2050 6650
NoConn ~ -850 3250
NoConn ~ -850 3350
NoConn ~ -850 3450
NoConn ~ -850 3550
NoConn ~ -850 4700
NoConn ~ -850 4800
NoConn ~ -850 4900
NoConn ~ -850 5000
NoConn ~ -850 6150
NoConn ~ -850 6250
NoConn ~ -850 6350
NoConn ~ -850 6450
Wire Wire Line
	-850 6950 -550 6950
Text Label -2700 6950 2    50   ~ 0
TTC1
Text Label -6350 3750 0    50   ~ 0
TCP0
Text Label -550 6950 2    50   ~ 0
TTC2
Text Label -4200 3750 0    50   ~ 0
TCP1
Text Label -4200 5200 0    50   ~ 0
TCP1
Text Label -4200 6650 0    50   ~ 0
TCP1
Text Label -2050 3750 0    50   ~ 0
TCP2
Text Label -2050 5200 0    50   ~ 0
TCP2
Text Label -2050 6650 0    50   ~ 0
TCP2
$Comp
L alexios:74HC590 U37
U 1 1 61B73812
P 2700 3300
F 0 "U37" H 2700 4067 50  0000 C CNN
F 1 "74HC590" H 2700 3976 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3000 3650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 3000 3650 50  0001 C CNN
	1    2700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3000 2150 3000
Wire Wire Line
	2150 3000 2150 3100
Wire Wire Line
	2150 3100 2200 3100
Connection ~ 2150 3000
Wire Wire Line
	2150 3000 1850 3000
Text Label 1850 3000 0    50   ~ 0
CLK1
$Comp
L power:+5V #PWR0130
U 1 1 61C7F8F2
P 2200 3300
F 0 "#PWR0130" H 2200 3150 50  0001 C CNN
F 1 "+5V" V 2215 3428 50  0000 L CNN
F 2 "" H 2200 3300 50  0001 C CNN
F 3 "" H 2200 3300 50  0001 C CNN
	1    2200 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 61D0CBEE
P 2200 3700
F 0 "#PWR0132" H 2200 3450 50  0001 C CNN
F 1 "GND" V 2205 3572 50  0000 R CNN
F 2 "" H 2200 3700 50  0001 C CNN
F 3 "" H 2200 3700 50  0001 C CNN
	1    2200 3700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 61C8141F
P 2200 2800
F 0 "#PWR0133" H 2200 2550 50  0001 C CNN
F 1 "GND" V 2205 2672 50  0000 R CNN
F 2 "" H 2200 2800 50  0001 C CNN
F 3 "" H 2200 2800 50  0001 C CNN
	1    2200 2800
	0    1    1    0   
$EndComp
NoConn ~ 3200 3700
Text Label 3500 2800 2    50   ~ 0
DIV2
Text Label 3500 2900 2    50   ~ 0
DIV4
Text Label 3500 3000 2    50   ~ 0
DIV8
Text Label 3500 3100 2    50   ~ 0
DIV16
Text Label 3500 3200 2    50   ~ 0
DIV32
Text Label 3500 3300 2    50   ~ 0
DIV64
Text Label 3500 3400 2    50   ~ 0
DIV128
Text Label 3500 3500 2    50   ~ 0
DIV256
Text Notes 4000 2800 2    50   ~ 0
1 MHz
Text Notes 4000 2900 2    50   ~ 0
500 KHz
Text Notes 4000 3000 2    50   ~ 0
250 KHz
Text Notes 4000 3100 2    50   ~ 0
125 KHz
Text Notes 4000 3200 2    50   ~ 0
62.5 KHz
Text Notes 4000 3300 2    50   ~ 0
31.25 KHz
Text Notes 4000 3400 2    50   ~ 0
15.625 KHz
Text Notes 4000 3500 2    50   ~ 0
7.8125 KHz
Text Label -4600 1800 0    50   ~ 0
DB0
Text Label -4600 1900 0    50   ~ 0
DB1
Text Label -4600 2000 0    50   ~ 0
DB2
Text Label -4600 2100 0    50   ~ 0
DB3
Text Label -4600 3250 0    50   ~ 0
DB4
Text Label -4600 3350 0    50   ~ 0
DB5
Text Label -4600 3450 0    50   ~ 0
DB6
Text Label -4600 3550 0    50   ~ 0
DB7
Text Label -4600 4700 0    50   ~ 0
DB8
Text Label -4600 4800 0    50   ~ 0
DB9
Text Label -4600 4900 0    50   ~ 0
DB10
Text Label -4600 5000 0    50   ~ 0
DB11
Text Label -4600 6150 0    50   ~ 0
DB12
Text Label -4600 6250 0    50   ~ 0
DB13
Text Label -4600 6350 0    50   ~ 0
DB14
Text Label -4600 6450 0    50   ~ 0
DB15
Text Label -2450 1800 0    50   ~ 0
DB0
Text Label -2450 1900 0    50   ~ 0
DB1
Text Label -2450 2000 0    50   ~ 0
DB2
Text Label -2450 2100 0    50   ~ 0
DB3
Text Label -2450 3250 0    50   ~ 0
DB4
Text Label -2450 3350 0    50   ~ 0
DB5
Text Label -2450 3450 0    50   ~ 0
DB6
Text Label -2450 3550 0    50   ~ 0
DB7
Text Label -2450 4700 0    50   ~ 0
DB8
Text Label -2450 4800 0    50   ~ 0
DB9
Text Label -2450 4900 0    50   ~ 0
DB10
Text Label -2450 5000 0    50   ~ 0
DB11
Text Label -2450 6150 0    50   ~ 0
DB12
Text Label -2450 6250 0    50   ~ 0
DB13
Text Label -2450 6350 0    50   ~ 0
DB14
Text Label -2450 6450 0    50   ~ 0
DB15
Entry Wire Line
	-6900 2200 -6800 2100
Entry Wire Line
	-6900 2100 -6800 2000
Entry Wire Line
	-6900 2000 -6800 1900
Entry Wire Line
	-6900 1900 -6800 1800
Wire Wire Line
	-6800 1800 -6150 1800
Wire Wire Line
	-6800 1900 -6150 1900
Wire Wire Line
	-6800 2000 -6150 2000
Wire Wire Line
	-6800 2100 -6150 2100
Entry Wire Line
	-6900 3650 -6800 3550
Entry Wire Line
	-6900 3550 -6800 3450
Entry Wire Line
	-6900 3450 -6800 3350
Entry Wire Line
	-6900 3350 -6800 3250
Wire Wire Line
	-6800 3250 -6150 3250
Wire Wire Line
	-6800 3350 -6150 3350
Wire Wire Line
	-6800 3450 -6150 3450
Wire Wire Line
	-6800 3550 -6150 3550
Entry Wire Line
	-6900 5100 -6800 5000
Entry Wire Line
	-6900 5000 -6800 4900
Entry Wire Line
	-6900 4900 -6800 4800
Entry Wire Line
	-6900 4800 -6800 4700
Wire Wire Line
	-6800 4700 -6150 4700
Wire Wire Line
	-6800 4800 -6150 4800
Wire Wire Line
	-6800 4900 -6150 4900
Wire Wire Line
	-6800 5000 -6150 5000
Entry Wire Line
	-6900 6550 -6800 6450
Entry Wire Line
	-6900 6450 -6800 6350
Entry Wire Line
	-6900 6350 -6800 6250
Entry Wire Line
	-6900 6250 -6800 6150
Wire Wire Line
	-6800 6150 -6150 6150
Wire Wire Line
	-6800 6250 -6150 6250
Wire Wire Line
	-6800 6350 -6150 6350
Wire Wire Line
	-6800 6450 -6150 6450
Entry Wire Line
	-4650 2100 -4750 2000
Entry Wire Line
	-4650 2000 -4750 1900
Entry Wire Line
	-4650 1900 -4750 1800
Entry Wire Line
	-4650 1800 -4750 1700
Entry Wire Line
	-4650 3550 -4750 3450
Entry Wire Line
	-4650 3450 -4750 3350
Entry Wire Line
	-4650 3350 -4750 3250
Entry Wire Line
	-4650 3250 -4750 3150
Entry Wire Line
	-4650 5000 -4750 4900
Entry Wire Line
	-4650 4900 -4750 4800
Entry Wire Line
	-4650 4800 -4750 4700
Entry Wire Line
	-4650 4700 -4750 4600
Entry Wire Line
	-4650 6450 -4750 6350
Entry Wire Line
	-4650 6350 -4750 6250
Entry Wire Line
	-4650 6250 -4750 6150
Entry Wire Line
	-4650 6150 -4750 6050
Wire Wire Line
	-4650 1800 -4000 1800
Wire Wire Line
	-4650 1900 -4000 1900
Wire Wire Line
	-4650 2000 -4000 2000
Wire Wire Line
	-4650 2100 -4000 2100
Wire Wire Line
	-4650 3250 -4000 3250
Wire Wire Line
	-4650 3350 -4000 3350
Wire Wire Line
	-4650 3450 -4000 3450
Wire Wire Line
	-4650 3550 -4000 3550
Wire Wire Line
	-4650 4700 -4000 4700
Wire Wire Line
	-4650 4800 -4000 4800
Wire Wire Line
	-4650 4900 -4000 4900
Wire Wire Line
	-4650 5000 -4000 5000
Wire Wire Line
	-4650 6150 -4000 6150
Wire Wire Line
	-4650 6250 -4000 6250
Wire Wire Line
	-4650 6350 -4000 6350
Wire Wire Line
	-4650 6450 -4000 6450
Entry Wire Line
	-2500 2100 -2600 2000
Entry Wire Line
	-2500 2000 -2600 1900
Entry Wire Line
	-2500 1900 -2600 1800
Entry Wire Line
	-2500 1800 -2600 1700
Entry Wire Line
	-2500 3550 -2600 3450
Entry Wire Line
	-2500 3450 -2600 3350
Entry Wire Line
	-2500 3350 -2600 3250
Entry Wire Line
	-2500 3250 -2600 3150
Entry Wire Line
	-2500 5000 -2600 4900
Entry Wire Line
	-2500 4900 -2600 4800
Entry Wire Line
	-2500 4800 -2600 4700
Entry Wire Line
	-2500 4700 -2600 4600
Entry Wire Line
	-2500 6450 -2600 6350
Entry Wire Line
	-2500 6350 -2600 6250
Entry Wire Line
	-2500 6250 -2600 6150
Entry Wire Line
	-2500 6150 -2600 6050
Wire Wire Line
	-2500 1800 -1850 1800
Wire Wire Line
	-2500 1900 -1850 1900
Wire Wire Line
	-2500 2000 -1850 2000
Wire Wire Line
	-2500 2100 -1850 2100
Wire Wire Line
	-2500 3250 -1850 3250
Wire Wire Line
	-2500 3350 -1850 3350
Wire Wire Line
	-2500 3450 -1850 3450
Wire Wire Line
	-2500 3550 -1850 3550
Wire Wire Line
	-2500 4700 -1850 4700
Wire Wire Line
	-2500 4800 -1850 4800
Wire Wire Line
	-2500 4900 -1850 4900
Wire Wire Line
	-2500 5000 -1850 5000
Wire Wire Line
	-2500 6150 -1850 6150
Wire Wire Line
	-2500 6250 -1850 6250
Wire Wire Line
	-2500 6350 -1850 6350
Wire Wire Line
	-2500 6450 -1850 6450
Entry Bus Bus
	-6900 6800 -7000 6900
Entry Bus Bus
	-2600 1500 -2700 1400
Entry Bus Bus
	-4750 1500 -4650 1400
Wire Bus Line
	-2700 1400 -4650 1400
Entry Bus Bus
	-4750 1500 -4850 1400
Entry Bus Bus
	-6900 1500 -6800 1400
Wire Bus Line
	-4850 1400 -6800 1400
Wire Bus Line
	-7000 6900 -7700 6900
Text Label -7550 6900 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	3200 2800 3500 2800
Wire Wire Line
	3200 2900 3500 2900
Wire Wire Line
	3200 3000 3500 3000
Wire Wire Line
	3200 3200 3500 3200
Wire Wire Line
	3200 3300 3500 3300
Wire Wire Line
	3200 3500 3500 3500
Wire Wire Line
	3200 3100 3500 3100
$Comp
L alexios:74AC251 U38
U 1 1 6199F9AF
P 5400 3400
F 0 "U38" H 5400 4267 50  0000 C CNN
F 1 "74AC251" H 5400 4176 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5400 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 5400 3350 50  0001 C CNN
	1    5400 3400
	1    0    0    -1  
$EndComp
Text Notes 4100 3500 0    50   ~ 0
128 µs
Text Notes 4100 3400 0    50   ~ 0
64 µs
Text Notes 4100 3300 0    50   ~ 0
32 µs
Text Notes 4100 3200 0    50   ~ 0
16 µs
Text Notes 4100 3100 0    50   ~ 0
8 µs
Text Notes 4100 3000 0    50   ~ 0
4 µs
Text Notes 4100 2900 0    50   ~ 0
2 µs
Text Notes 4100 2800 0    50   ~ 0
1 µs
Wire Wire Line
	3200 3400 3500 3400
$Comp
L alexios:DS12C887+ U39
U 1 1 63A7247D
P -5850 10400
F 0 "U39" H -5850 11167 50  0000 C CNN
F 1 "DS12C887+" H -5850 11076 50  0000 C CNN
F 2 "alexios:eDIP-24-DS12x_W15.24mm" H -6850 8300 50  0001 L CNN
F 3 "https://uk.mouser.com/datasheet/2/256/DS12CR887-DS12R887-1513597.pdf" H -5850 10400 50  0001 C CNN
F 4 "Yes" H -6850 8225 50  0001 L CNN "Verified"
F 5 "700-DS12R885S-5; €3.65" H -6850 8150 50  0001 L CNN "Mouser"
	1    -5850 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 11300 2650 11300
Wire Wire Line
	3150 11400 2650 11400
Wire Wire Line
	3150 11500 2650 11500
Wire Wire Line
	3150 11600 2650 11600
Wire Wire Line
	3150 11700 2650 11700
Wire Wire Line
	3150 11800 2650 11800
Wire Wire Line
	3150 11900 2650 11900
Wire Wire Line
	3150 12000 2650 12000
Text Label 3150 11300 2    50   ~ 0
~IRQ0
Text Label 3150 11400 2    50   ~ 0
~IRQ1
Text Label 3150 11500 2    50   ~ 0
~IRQ2
Text Label 3150 11600 2    50   ~ 0
~IRQ3
Text Label 3150 11700 2    50   ~ 0
~IRQ4
Text Label 3150 11800 2    50   ~ 0
~IRQ5
Text Label 3150 11900 2    50   ~ 0
~IRQ6
Text Label 3150 12000 2    50   ~ 0
~IRQ7
$Comp
L power:+5V #PWR049
U 1 1 640B8511
P 2300 11250
F 0 "#PWR049" H 2300 11100 50  0001 C CNN
F 1 "+5V" H 2315 11423 50  0000 C CNN
F 2 "" H 2300 11250 50  0001 C CNN
F 3 "" H 2300 11250 50  0001 C CNN
	1    2300 11250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack04_Split R1
U 1 1 6410C739
P 2500 11300
F 0 "R1" V 2450 11500 50  0000 C CNN
F 1 "4.7kΩ" V 2384 11300 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2430 11300 50  0001 C CNN
F 3 "~" H 2500 11300 50  0001 C CNN
	1    2500 11300
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 11250 2300 11300
$Comp
L Device:R_Pack04_Split R1
U 2 1 641F10C7
P 2500 11400
F 0 "R1" V 2450 11600 50  0000 C CNN
F 1 "4.7kΩ" V 2384 11400 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2430 11400 50  0001 C CNN
F 3 "~" H 2500 11400 50  0001 C CNN
	2    2500 11400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R1
U 3 1 641F14C6
P 2500 11500
F 0 "R1" V 2450 11700 50  0000 C CNN
F 1 "4.7kΩ" V 2384 11500 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2430 11500 50  0001 C CNN
F 3 "~" H 2500 11500 50  0001 C CNN
	3    2500 11500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R1
U 4 1 641F1983
P 2500 11600
F 0 "R1" V 2450 11800 50  0000 C CNN
F 1 "4.7kΩ" V 2384 11600 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2430 11600 50  0001 C CNN
F 3 "~" H 2500 11600 50  0001 C CNN
	4    2500 11600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R2
U 4 1 642409E3
P 2500 12000
F 0 "R2" V 2450 12200 50  0000 C CNN
F 1 "4.7kΩ" V 2600 12000 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2430 12000 50  0001 C CNN
F 3 "~" H 2500 12000 50  0001 C CNN
	4    2500 12000
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 11300 2300 11300
Connection ~ 2300 11300
Wire Wire Line
	2300 11300 2300 11400
Wire Wire Line
	2350 11400 2300 11400
Connection ~ 2300 11400
Wire Wire Line
	2300 11400 2300 11500
Wire Wire Line
	2350 11500 2300 11500
Connection ~ 2300 11500
Wire Wire Line
	2300 11500 2300 11600
Wire Wire Line
	2350 11600 2300 11600
Connection ~ 2300 11600
Wire Wire Line
	2300 11600 2300 11700
Wire Wire Line
	2350 11700 2300 11700
Connection ~ 2300 11700
Wire Wire Line
	2350 11800 2300 11800
Wire Wire Line
	2350 11900 2300 11900
Wire Wire Line
	2350 12000 2300 12000
Connection ~ 2300 11800
Wire Wire Line
	2300 11800 2300 11900
Connection ~ 2300 11900
Wire Wire Line
	2300 11900 2300 12000
Wire Wire Line
	2300 11700 2300 11800
$Comp
L Device:R_Pack04_Split R2
U 3 1 646E1208
P 2500 11900
F 0 "R2" V 2450 12100 50  0000 C CNN
F 1 "4.7kΩ" V 2600 11900 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2430 11900 50  0001 C CNN
F 3 "~" H 2500 11900 50  0001 C CNN
	3    2500 11900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R2
U 2 1 646E15F0
P 2500 11800
F 0 "R2" V 2450 12000 50  0000 C CNN
F 1 "4.7kΩ" V 2600 11800 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2430 11800 50  0001 C CNN
F 3 "~" H 2500 11800 50  0001 C CNN
	2    2500 11800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R2
U 1 1 646E17AA
P 2500 11700
F 0 "R2" V 2450 11900 50  0000 C CNN
F 1 "4.7kΩ" V 2600 11700 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2430 11700 50  0001 C CNN
F 3 "~" H 2500 11700 50  0001 C CNN
	1    2500 11700
	0    1    1    0   
$EndComp
$Comp
L alexios:8254 U40
U 1 1 64762EDE
P -3450 9750
F 0 "U40" H -3450 10767 50  0000 C CNN
F 1 "8254" H -3450 10676 50  0000 C CNN
F 2 "alexios:DIP-24_W15.24mm_socket" H -3450 8725 50  0001 C CNN
F 3 "http://www.scs.stanford.edu/10wi-cs140/pintos/specs/8254.pdf" H -3900 10650 50  0001 C CNN
	1    -3450 9750
	1    0    0    -1  
$EndComp
$Comp
L alexios:8254 U41
U 1 1 6480BEFF
P -3500 12100
F 0 "U41" H -3500 13117 50  0000 C CNN
F 1 "8254" H -3500 13026 50  0000 C CNN
F 2 "alexios:DIP-24_W15.24mm_socket" H -3500 11075 50  0001 C CNN
F 3 "http://www.scs.stanford.edu/10wi-cs140/pintos/specs/8254.pdf" H -3950 13000 50  0001 C CNN
	1    -3500 12100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC112 U42
U 1 1 64AF56F1
P 14300 7550
F 0 "U42" H 13975 7767 50  0000 C CNN
F 1 "74HC112" H 13975 7676 50  0000 C CNN
F 2 "" H 14000 7200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT112.pdf" H 14000 7200 50  0001 C CNN
F 4 "Yes" H 13700 6600 50  0001 C CNN "Verified"
	1    14300 7550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC112 U42
U 2 1 64AF6974
P 15650 7550
F 0 "U42" H 15325 7767 50  0000 C CNN
F 1 "74HC112" H 15325 7676 50  0000 C CNN
F 2 "" H 15350 7200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT112.pdf" H 15350 7200 50  0001 C CNN
F 4 "Yes" H 15050 6600 50  0001 C CNN "Verified"
	2    15650 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	13500 7800 12700 7800
Text Label 12700 7800 0    50   ~ 0
~SEL
Wire Wire Line
	13500 7900 13250 7900
Wire Wire Line
	13250 7900 13250 8150
$Comp
L power:GND #PWR0134
U 1 1 64B98EFC
P 13250 8150
F 0 "#PWR0134" H 13250 7900 50  0001 C CNN
F 1 "GND" H 13255 7977 50  0000 C CNN
F 2 "" H 13250 8150 50  0001 C CNN
F 3 "" H 13250 8150 50  0001 C CNN
	1    13250 8150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0135
U 1 1 64B999E3
P 13400 7500
F 0 "#PWR0135" H 13400 7350 50  0001 C CNN
F 1 "+5V" H 13415 7673 50  0000 C CNN
F 2 "" H 13400 7500 50  0001 C CNN
F 3 "" H 13400 7500 50  0001 C CNN
	1    13400 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	13400 7500 13400 7600
Wire Wire Line
	13400 7700 13500 7700
Wire Wire Line
	13500 7600 13400 7600
Connection ~ 13400 7600
Wire Wire Line
	13400 7600 13400 7700
Wire Bus Line
	9950 1450 9950 2100
Wire Bus Line
	5650 13000 5650 13950
Wire Bus Line
	7800 11300 7800 12250
Wire Bus Line
	5900 9600 5900 10400
Wire Bus Line
	7800 9600 7800 10550
Wire Bus Line
	-4750 1500 -4750 6350
Wire Bus Line
	-2600 1500 -2600 6350
Wire Bus Line
	11200 9550 11200 12300
Wire Bus Line
	-6900 1500 -6900 6800
$EndSCHEMATC
