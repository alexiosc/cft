EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 12
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
NoConn ~ 7800 2200
NoConn ~ 7800 2300
NoConn ~ 7800 2900
NoConn ~ 7800 3000
NoConn ~ 7800 3100
NoConn ~ 7800 3200
NoConn ~ 7800 3300
NoConn ~ 7800 3400
NoConn ~ 7800 4800
Text Label 7800 2200 0    50   ~ 0
AB[0..23]
Wire Wire Line
	8350 4300 7800 4300
Wire Wire Line
	8350 4400 7800 4400
Text Label 7800 4300 0    50   ~ 0
~RUEN
Text Label 7800 4400 0    50   ~ 0
~WUEN
Text Notes 700  850  0    100  ~ 20
The INT, IRC and RTC boards
Text Notes 700  1650 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
$Comp
L alexios:8254 U40
U 1 1 64762EDE
P -2650 8100
F 0 "U40" H -2650 9117 50  0000 C CNN
F 1 "8254" H -2650 9026 50  0000 C CNN
F 2 "alexios:DIP-24_W15.24mm_socket" H -2650 7075 50  0001 C CNN
F 3 "http://www.scs.stanford.edu/10wi-cs140/pintos/specs/8254.pdf" H -3100 9000 50  0001 C CNN
	1    -2650 8100
	1    0    0    -1  
$EndComp
$Comp
L alexios:PCA9564 U3
U 2 1 60BDC4A0
P -2600 6200
F 0 "U3" H -2420 6246 50  0000 L CNN
F 1 "PCA9564" H -2420 6155 50  0000 L CNN
F 2 "" H -2600 6200 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/PCA9564.pdf" H -2600 6200 50  0001 C CNN
	2    -2600 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 60CD808F
P -2950 6200
F 0 "C3" H -3041 6246 50  0000 R CNN
F 1 "100nF" H -3041 6155 50  0000 R CNN
F 2 "" H -2950 6200 50  0001 C CNN
F 3 "~" H -2950 6200 50  0001 C CNN
	1    -2950 6200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR06
U 1 1 60F8DDE7
P -2950 6050
F 0 "#PWR06" H -2950 5900 50  0001 C CNN
F 1 "+3.3V" H -2935 6223 50  0000 C CNN
F 2 "" H -2950 6050 50  0001 C CNN
F 3 "" H -2950 6050 50  0001 C CNN
	1    -2950 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2950 6050 -2950 6100
Connection ~ -2950 6100
Wire Wire Line
	-2950 6300 -2950 6350
Connection ~ -2950 6300
$Comp
L power:GND #PWR07
U 1 1 60FD4CCC
P -2950 6350
F 0 "#PWR07" H -2950 6100 50  0001 C CNN
F 1 "GND" H -2945 6177 50  0000 C CNN
F 2 "" H -2950 6350 50  0001 C CNN
F 3 "" H -2950 6350 50  0001 C CNN
	1    -2950 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3250 8500 -3550 8500
Wire Wire Line
	-3250 8600 -3550 8600
Text Label -3550 8500 0    50   ~ 0
AB0
Text Label -3550 8600 0    50   ~ 0
AB1
Wire Wire Line
	-3550 7400 -3250 7400
Wire Wire Line
	-3550 7500 -3250 7500
Wire Wire Line
	-3550 7600 -3250 7600
Wire Wire Line
	-3550 7700 -3250 7700
Wire Wire Line
	-3550 7800 -3250 7800
Wire Wire Line
	-3550 7900 -3250 7900
Wire Wire Line
	-3550 8000 -3250 8000
Wire Wire Line
	-3550 8100 -3250 8100
Wire Wire Line
	-3550 8300 -3250 8300
Wire Wire Line
	-3550 8400 -3250 8400
Wire Wire Line
	-3550 8800 -3250 8800
Wire Wire Line
	-2050 7500 -1750 7500
Wire Wire Line
	-2050 7600 -1750 7600
Wire Wire Line
	-2050 7700 -1750 7700
Wire Wire Line
	-2050 8000 -1750 8000
Wire Wire Line
	-2050 8100 -1750 8100
Wire Wire Line
	-2050 8200 -1750 8200
Wire Wire Line
	-2050 8500 -1750 8500
Wire Wire Line
	-2050 8600 -1750 8600
Wire Wire Line
	-2050 8700 -1750 8700
Text Label -3550 8800 0    50   ~ 0
~IO18
Text Label -3550 7400 0    50   ~ 0
D0
Text Label -3550 7500 0    50   ~ 0
D1
Text Label -3550 7600 0    50   ~ 0
D2
Text Label -3550 7700 0    50   ~ 0
D3
Text Label -3550 7800 0    50   ~ 0
D4
Text Label -3550 7900 0    50   ~ 0
D5
Text Label -3550 8000 0    50   ~ 0
D6
Text Label -3550 8100 0    50   ~ 0
D7
Text Label -3550 8300 0    50   ~ 0
~R
Text Label -3550 8400 0    50   ~ 0
~W
$Comp
L alexios:8254 U4
U 1 1 60A7222A
P -2650 10150
F 0 "U4" H -2650 11167 50  0000 C CNN
F 1 "M48T02-70PC1" H -2650 11076 50  0000 C CNN
F 2 "alexios:eDIP-24_W15.24mm" H -2650 9125 50  0001 C CNN
F 3 "https://uk.mouser.com/datasheet/2/389/m48t02-1849963.pdf" H -3100 11050 50  0001 C CNN
	1    -2650 10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3250 10550 -3550 10550
Wire Wire Line
	-3250 10650 -3550 10650
Text Label -3550 10550 0    50   ~ 0
AB0
Text Label -3550 10650 0    50   ~ 0
AB1
Wire Wire Line
	-3550 9450 -3250 9450
Wire Wire Line
	-3550 9550 -3250 9550
Wire Wire Line
	-3550 9650 -3250 9650
Wire Wire Line
	-3550 9750 -3250 9750
Wire Wire Line
	-3550 9850 -3250 9850
Wire Wire Line
	-3550 9950 -3250 9950
Wire Wire Line
	-3550 10050 -3250 10050
Wire Wire Line
	-3550 10150 -3250 10150
Wire Wire Line
	-3550 10350 -3250 10350
Wire Wire Line
	-3550 10450 -3250 10450
Wire Wire Line
	-3550 10850 -3250 10850
Wire Wire Line
	-2050 9550 -1750 9550
Wire Wire Line
	-2050 9650 -1750 9650
Wire Wire Line
	-2050 9750 -1750 9750
Wire Wire Line
	-2050 10050 -1750 10050
Wire Wire Line
	-2050 10150 -1750 10150
Wire Wire Line
	-2050 10250 -1750 10250
Wire Wire Line
	-2050 10550 -1750 10550
Wire Wire Line
	-2050 10650 -1750 10650
Wire Wire Line
	-2050 10750 -1750 10750
Text Label -3550 10850 0    50   ~ 0
~IO1C
Text Label -3550 9450 0    50   ~ 0
D0
Text Label -3550 9550 0    50   ~ 0
D1
Text Label -3550 9650 0    50   ~ 0
D2
Text Label -3550 9750 0    50   ~ 0
D3
Text Label -3550 9850 0    50   ~ 0
D4
Text Label -3550 9950 0    50   ~ 0
D5
Text Label -3550 10050 0    50   ~ 0
D6
Text Label -3550 10150 0    50   ~ 0
D7
Text Label -3550 10350 0    50   ~ 0
~R
Text Label -3550 10450 0    50   ~ 0
~W
Wire Wire Line
	1100 2400 650  2400
Wire Wire Line
	1100 2500 650  2500
Wire Wire Line
	1100 2600 650  2600
Wire Wire Line
	1100 2700 650  2700
Wire Wire Line
	1100 2800 650  2800
Wire Wire Line
	650  2950 1100 2950
Wire Wire Line
	650  3050 1100 3050
Wire Wire Line
	650  3150 1100 3150
Wire Wire Line
	650  3250 1100 3250
Wire Wire Line
	650  3350 1100 3350
Wire Wire Line
	650  3450 1100 3450
Wire Wire Line
	650  3550 1100 3550
Wire Wire Line
	2700 2400 2250 2400
Wire Wire Line
	2700 2500 2250 2500
Wire Wire Line
	2700 2600 2250 2600
Wire Wire Line
	2700 2800 2250 2800
Wire Wire Line
	2250 2900 2700 2900
Wire Wire Line
	2250 3100 2700 3100
Wire Wire Line
	2250 3200 2700 3200
Wire Wire Line
	2250 3800 2700 3800
Text Notes 700  2000 0    100  ~ 20
Address Decoding & Wait States
Text Label 650  2400 0    50   ~ 0
~RESET
Text Label 650  2500 0    50   ~ 0
CLK3
Text Label 650  2600 0    50   ~ 0
~SYSDEV
Text Label 650  2700 0    50   ~ 0
~R
Text Label 650  2800 0    50   ~ 0
~W
Text Label 650  2950 0    50   ~ 0
AB1
Text Label 650  3050 0    50   ~ 0
AB2
Text Label 650  3150 0    50   ~ 0
AB3
Text Label 650  3250 0    50   ~ 0
AB4
Text Label 650  3350 0    50   ~ 0
AB5
Text Label 650  3450 0    50   ~ 0
AB6
Text Label 650  3550 0    50   ~ 0
AB7
Text Label 2700 2400 2    50   ~ 0
~IO14
Text Label 2700 2500 2    50   ~ 0
~IO18
Text Label 2700 2600 2    50   ~ 0
~IO1C
Text Label 2700 2800 2    50   ~ 0
~RIO10
Text Label 2700 2900 2    50   ~ 0
~RIO11
Text Label 2700 3100 2    50   ~ 0
~WIO10
Text Label 2700 3200 2    50   ~ 0
~WIO11
Text Label 2700 3800 2    50   ~ 0
~WS
Wire Bus Line
	1100 5350 650  5350
Wire Wire Line
	1100 4400 650  4400
Wire Wire Line
	1100 4550 650  4550
Wire Wire Line
	1100 4650 650  4650
Wire Wire Line
	1100 4800 650  4800
Wire Wire Line
	1100 4950 650  4950
Wire Wire Line
	1100 5050 650  5050
Wire Wire Line
	1100 5200 650  5200
Wire Wire Line
	2250 5150 2700 5150
Wire Wire Line
	2250 5250 2700 5250
Wire Bus Line
	2700 5350 2250 5350
Text Label 2700 5150 2    50   ~ 0
~FPIEN
Text Label 2700 5250 2    50   ~ 0
~FPIRF
Text Label 650  5350 0    50   ~ 0
~IRQ[0..7]
Text Label 650  4400 0    50   ~ 0
~RESET
Text Label 650  4550 0    50   ~ 0
CLK2
Text Label 650  4650 0    50   ~ 0
CLK3
Text Label 650  4800 0    50   ~ 0
DB[0..15]
Text Label 650  4950 0    50   ~ 0
~RIER
Text Label 650  5050 0    50   ~ 0
~WIER
Text Label 650  5200 0    50   ~ 0
~RISR
Text Label 2700 5350 2    50   ~ 0
FPD[0..7]
$Comp
L alexios:M48T02-70PC1 U2
U 1 1 5FD14A01
P -5950 5600
F 0 "U2" H -5950 6367 50  0000 C CNN
F 1 "M48T02-70PC1" H -5950 6276 50  0000 C CNN
F 2 "alexios:eDIP-24_W15.24mm" H -6425 4425 50  0001 L CNN
F 3 "https://uk.mouser.com/datasheet/2/389/m48t02-1849963.pdf" H -5950 5600 50  0001 C CNN
F 4 "Yes" H -6425 4350 50  0001 L CNN "Verified"
F 5 "511-M48T0270PC1; €11.81" H -6425 4275 50  0001 L CNN "Mouser"
	1    -5950 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5FD21DAA
P -6250 7000
F 0 "C4" H -6341 7046 50  0000 R CNN
F 1 "100nF" H -6341 6955 50  0000 R CNN
F 2 "" H -6250 7000 50  0001 C CNN
F 3 "~" H -6250 7000 50  0001 C CNN
	1    -6250 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6250 6850 -6250 6900
Wire Wire Line
	-6250 7100 -6250 7150
$Comp
L power:GND #PWR09
U 1 1 5FD21DBA
P -6250 7150
F 0 "#PWR09" H -6250 6900 50  0001 C CNN
F 1 "GND" H -6245 6977 50  0000 C CNN
F 2 "" H -6250 7150 50  0001 C CNN
F 3 "" H -6250 7150 50  0001 C CNN
	1    -6250 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:M48T02-70PC1 U2
U 2 1 5FD1FE58
P -5900 7000
F 0 "U2" H -5695 7046 50  0000 L CNN
F 1 "M48T02-70PC1" H -5695 6955 50  0000 L CNN
F 2 "alexios:eDIP-24_W15.24mm" H -6375 5825 50  0001 L CNN
F 3 "https://uk.mouser.com/datasheet/2/389/m48t02-1849963.pdf" H -5900 7000 50  0001 C CNN
F 4 "Yes" H -6375 5750 50  0001 L CNN "Verified"
F 5 "511-M48T0270PC1; €11.81" H -6375 5675 50  0001 L CNN "Mouser"
	2    -5900 7000
	1    0    0    -1  
$EndComp
Connection ~ -6250 7100
Connection ~ -6250 6900
Wire Wire Line
	-5150 5100 -5450 5100
Wire Wire Line
	-5150 5200 -5450 5200
Wire Wire Line
	-5150 5300 -5450 5300
Wire Wire Line
	-5150 5400 -5450 5400
Wire Wire Line
	-5150 5500 -5450 5500
Wire Wire Line
	-5150 5600 -5450 5600
Wire Wire Line
	-5150 5700 -5450 5700
Wire Wire Line
	-5150 5800 -5450 5800
Text Label -5150 5100 2    50   ~ 0
D0
Text Label -5150 5200 2    50   ~ 0
D1
Text Label -5150 5300 2    50   ~ 0
D2
Text Label -5150 5400 2    50   ~ 0
D3
Text Label -5150 5500 2    50   ~ 0
D4
Text Label -5150 5600 2    50   ~ 0
D5
Text Label -5150 5700 2    50   ~ 0
D6
Text Label -5150 5800 2    50   ~ 0
D7
Wire Wire Line
	-6850 6400 -6450 6400
Wire Wire Line
	-6850 6500 -6450 6500
Text Label -6850 6400 0    50   ~ 0
~RTCR
Text Label -6850 6500 0    50   ~ 0
~RTCW
Wire Wire Line
	-6450 6300 -6850 6300
Text Label -6850 6300 0    50   ~ 0
~RTCCS
Text Label -7000 5100 0    50   ~ 0
RTCA0
Text Label -7000 5200 0    50   ~ 0
RTCA1
Text Label -7000 5300 0    50   ~ 0
RTCA2
Text Label -7000 5400 0    50   ~ 0
RTCA3
Text Label -7000 5500 0    50   ~ 0
RTCA4
Text Label -7000 5600 0    50   ~ 0
RTCA5
Text Label -7000 5700 0    50   ~ 0
RTCA6
Text Label -7000 5800 0    50   ~ 0
RTCA7
Wire Wire Line
	-6450 5900 -6500 5900
Wire Wire Line
	-6500 5900 -6500 6000
Wire Wire Line
	-6500 6100 -6450 6100
Wire Wire Line
	-6450 6000 -6500 6000
Connection ~ -6500 6000
Wire Wire Line
	-6500 6000 -6500 6100
Wire Wire Line
	-6500 6100 -6600 6100
Connection ~ -6500 6100
$Comp
L power:+5V #PWR?
U 1 1 5FA98934
P -6250 6850
AR Path="/5F67D4B5/5FA98934" Ref="#PWR?"  Part="1" 
AR Path="/5FA98934" Ref="#PWR03"  Part="1" 
AR Path="/5D34E810/5FA98934" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5FA98934" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5FA98934" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5FA98934" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H -6250 6700 50  0001 C CNN
F 1 "+5V" H -6308 6887 50  0000 R CNN
F 2 "" H -6250 6850 50  0001 C CNN
F 3 "" H -6250 6850 50  0001 C CNN
	1    -6250 6850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FA99B8A
P -6600 6000
AR Path="/5F67D4B5/5FA99B8A" Ref="#PWR?"  Part="1" 
AR Path="/5FA99B8A" Ref="#PWR01"  Part="1" 
AR Path="/5D34E810/5FA99B8A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5FA99B8A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5FA99B8A" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5FA99B8A" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H -6600 5850 50  0001 C CNN
F 1 "+5V" H -6658 6037 50  0000 R CNN
F 2 "" H -6600 6000 50  0001 C CNN
F 3 "" H -6600 6000 50  0001 C CNN
	1    -6600 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6600 6000 -6600 6100
Wire Wire Line
	-7050 5100 -6450 5100
Wire Wire Line
	-7050 5200 -6450 5200
Wire Wire Line
	-7050 5300 -6450 5300
Wire Wire Line
	-7050 5400 -6450 5400
Wire Wire Line
	-7050 5500 -6450 5500
Wire Wire Line
	-7050 5600 -6450 5600
Wire Wire Line
	-7050 5700 -6450 5700
Wire Wire Line
	-7050 5800 -6450 5800
$Comp
L alexios:74HC574 U1
U 1 1 5F8C47F7
P -7550 5600
F 0 "U1" H -7550 6367 50  0000 C CNN
F 1 "74HC574" H -7550 6276 50  0000 C CNN
F 2 "" H -7850 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H -7850 5550 50  0001 C CNN
F 4 "Yes" H -7700 4650 50  0001 C CNN "Verified"
	1    -7550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8050 5100 -8350 5100
Wire Wire Line
	-8050 5200 -8350 5200
Wire Wire Line
	-8050 5300 -8350 5300
Wire Wire Line
	-8050 5400 -8350 5400
Wire Wire Line
	-8050 5500 -8350 5500
Wire Wire Line
	-8050 5600 -8350 5600
Wire Wire Line
	-8050 5700 -8350 5700
Wire Wire Line
	-8050 5800 -8350 5800
Wire Wire Line
	-8050 6000 -8350 6000
Text Label -8300 5100 0    50   ~ 0
D0
Text Label -8300 5200 0    50   ~ 0
D1
Text Label -8300 5300 0    50   ~ 0
D2
Text Label -8300 5400 0    50   ~ 0
D3
Text Label -8300 5500 0    50   ~ 0
D4
Text Label -8300 5600 0    50   ~ 0
D5
Text Label -8300 5700 0    50   ~ 0
D6
Text Label -8300 5800 0    50   ~ 0
D7
Entry Wire Line
	-8450 5000 -8350 5100
Entry Wire Line
	-8450 5100 -8350 5200
Entry Wire Line
	-8450 5200 -8350 5300
Entry Wire Line
	-8450 5300 -8350 5400
Entry Wire Line
	-8450 5400 -8350 5500
Entry Wire Line
	-8450 5500 -8350 5600
Entry Wire Line
	-8450 5600 -8350 5700
Entry Wire Line
	-8450 5700 -8350 5800
Wire Wire Line
	-8050 6100 -8100 6100
Wire Wire Line
	-8100 6100 -8100 6150
$Comp
L power:GND #PWR02
U 1 1 5F9D975F
P -8100 6150
F 0 "#PWR02" H -8100 5900 50  0001 C CNN
F 1 "GND" H -8095 5977 50  0000 C CNN
F 2 "" H -8100 6150 50  0001 C CNN
F 3 "" H -8100 6150 50  0001 C CNN
	1    -8100 6150
	1    0    0    -1  
$EndComp
Text Label -8350 6000 0    50   ~ 0
~RTCAW
$Sheet
S 1100 2250 1150 1650
U 60AA2B43
F0 "Bus Interface" 50
F1 "bus_interface.sch" 50
F2 "AB1" I L 1100 2950 50 
F3 "AB2" I L 1100 3050 50 
F4 "AB3" I L 1100 3150 50 
F5 "AB4" I L 1100 3250 50 
F6 "AB5" I L 1100 3350 50 
F7 "AB6" I L 1100 3450 50 
F8 "AB7" I L 1100 3550 50 
F9 "CLK3" I L 1100 2500 50 
F10 "~RESET" I L 1100 2400 50 
F11 "~SYSDEV" I L 1100 2600 50 
F12 "~WS" T R 2250 3800 50 
F13 "~W" I L 1100 2800 50 
F14 "~R" I L 1100 2700 50 
F15 "~T0CS" O R 2250 2400 50 
F16 "~T1CS" O R 2250 2500 50 
F17 "~RTCCS" O R 2250 2600 50 
F18 "~RIO11" O R 2250 2900 50 
F19 "~RIO10" O R 2250 2800 50 
F20 "~WIO11" O R 2250 3200 50 
F21 "~WIO10" O R 2250 3100 50 
F22 "~RTCR" O R 2250 3500 50 
F23 "~RTCAW" O R 2250 3600 50 
F24 "~RTCW" O R 2250 3400 50 
$EndSheet
Wire Wire Line
	2250 3400 2700 3400
Wire Wire Line
	2250 3500 2700 3500
Wire Wire Line
	2250 3600 2700 3600
Text Label 2700 3400 2    50   ~ 0
~RTCW
Text Label 2700 3500 2    50   ~ 0
~RTCR
Text Label 2700 3600 2    50   ~ 0
~RTCAW
$Sheet
S 1100 4250 1150 1250
U 5F160E7C
F0 "Interrupt Controller" 50
F1 "irc.sch" 50
F2 "DB[0..15]" T L 1100 4800 50 
F3 "~RIER" I L 1100 4950 50 
F4 "FPD[0..7]" T R 2250 5350 50 
F5 "CLK3" I L 1100 4650 50 
F6 "CLK2" I L 1100 4550 50 
F7 "~RESET" I L 1100 4400 50 
F8 "~WIER" I L 1100 5050 50 
F9 "~RISR" I L 1100 5200 50 
F10 "~FPIEN" I R 2250 5150 50 
F11 "~FPIRF" I R 2250 5250 50 
F12 "~IRQ[0..7]" T L 1100 5350 50 
F13 "~IRQ" T R 2250 4400 50 
$EndSheet
Wire Wire Line
	2250 4400 2700 4400
Text Label 2700 4400 2    50   ~ 0
~IRQ
$EndSCHEMATC
