EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 13
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
P -5850 3300
F 0 "U40" H -5850 4317 50  0000 C CNN
F 1 "8254" H -5850 4226 50  0000 C CNN
F 2 "alexios:DIP-24_W15.24mm_socket" H -5850 2275 50  0001 C CNN
F 3 "http://www.scs.stanford.edu/10wi-cs140/pintos/specs/8254.pdf" H -6300 4200 50  0001 C CNN
	1    -5850 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6450 3700 -6750 3700
Wire Wire Line
	-6450 3800 -6750 3800
Text Label -6750 3700 0    50   ~ 0
AB0
Text Label -6750 3800 0    50   ~ 0
AB1
Wire Wire Line
	-8700 3300 -8400 3300
Wire Wire Line
	-8700 3200 -8400 3200
Wire Wire Line
	-8700 3100 -8400 3100
Wire Wire Line
	-8700 3000 -8400 3000
Wire Wire Line
	-8700 2900 -8400 2900
Wire Wire Line
	-8700 2800 -8400 2800
Wire Wire Line
	-8700 2700 -8400 2700
Wire Wire Line
	-8700 2600 -8400 2600
Wire Wire Line
	-6750 3500 -6450 3500
Wire Wire Line
	-6750 3600 -6450 3600
Wire Wire Line
	-6750 4000 -6450 4000
Text Label -6750 4000 0    50   ~ 0
~T0CS
Text Label -6750 3500 0    50   ~ 0
~R
Text Label -6750 3600 0    50   ~ 0
~W
$Comp
L alexios:8254 U4
U 1 1 60A7222A
P -5850 5800
F 0 "U4" H -5850 6817 50  0000 C CNN
F 1 "M48T02-70PC1" H -5850 6726 50  0000 C CNN
F 2 "alexios:eDIP-24_W15.24mm" H -5850 4775 50  0001 C CNN
F 3 "https://uk.mouser.com/datasheet/2/389/m48t02-1849963.pdf" H -6300 6700 50  0001 C CNN
	1    -5850 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-6450 6200 -6750 6200
Wire Wire Line
	-6450 6300 -6750 6300
Text Label -6750 6200 0    50   ~ 0
AB0
Text Label -6750 6300 0    50   ~ 0
AB1
Wire Wire Line
	-6750 6000 -6450 6000
Wire Wire Line
	-6750 6100 -6450 6100
Wire Wire Line
	-6750 6500 -6450 6500
Text Label -6750 6500 0    50   ~ 0
~T1CS
Text Label -6750 6000 0    50   ~ 0
~R
Text Label -6750 6100 0    50   ~ 0
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
Text Label 2700 3800 2    50   ~ 0
~WS
Wire Bus Line
	4800 3350 4350 3350
Wire Wire Line
	4800 2400 4350 2400
Wire Wire Line
	4800 2550 4350 2550
Wire Wire Line
	4800 2650 4350 2650
Wire Wire Line
	4800 2800 4350 2800
Wire Wire Line
	5950 3150 6400 3150
Wire Wire Line
	5950 3250 6400 3250
Wire Bus Line
	6400 3350 5950 3350
Text Label 6400 3150 2    50   ~ 0
~FPIEN
Text Label 6400 3250 2    50   ~ 0
~FPIRF
Text Label 4350 3350 0    50   ~ 0
~IRQ[0..7]
Text Label 4350 2400 0    50   ~ 0
~RESET
Text Label 4350 2550 0    50   ~ 0
CLK2
Text Label 4350 2650 0    50   ~ 0
CLK3
Text Label 4350 2800 0    50   ~ 0
DB[0..15]
Text Label 4350 2950 0    50   ~ 0
~RIER
Text Label 4350 3050 0    50   ~ 0
~WIER
Text Label 4350 3200 0    50   ~ 0
~RISR
Text Label 6400 3350 2    50   ~ 0
FPD[0..7]
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
S 4800 2250 1150 1250
U 5F160E7C
F0 "Interrupt Controller" 50
F1 "irc.sch" 50
F2 "DB[0..15]" T L 4800 2800 50 
F3 "~RIER" I L 4800 2950 50 
F4 "FPD[0..7]" T R 5950 3350 50 
F5 "CLK3" I L 4800 2650 50 
F6 "CLK2" I L 4800 2550 50 
F7 "~RESET" I L 4800 2400 50 
F8 "~WIER" I L 4800 3050 50 
F9 "~RISR" I L 4800 3200 50 
F10 "~FPIEN" I R 5950 3150 50 
F11 "~FPIRF" I R 5950 3250 50 
F12 "~IRQ[0..7]" T L 4800 3350 50 
F13 "~IRQ" T R 5950 2400 50 
$EndSheet
Wire Wire Line
	5950 2400 6400 2400
Text Label 6400 2400 2    50   ~ 0
~IRQ
Text Label 4350 5850 0    50   ~ 0
~RTCW
Text Label 4350 5750 0    50   ~ 0
~RTCR
Text Label 4350 5650 0    50   ~ 0
~RTCAW
Text Label 4350 5550 0    50   ~ 0
~RTCCS
Wire Wire Line
	4800 5850 4350 5850
Wire Wire Line
	4800 5750 4350 5750
Wire Wire Line
	4800 5650 4350 5650
Wire Wire Line
	4800 5550 4350 5550
Text Label 4350 5450 0    50   ~ 0
DB[0..15]
Wire Wire Line
	4800 5450 4350 5450
$Sheet
S 4800 5350 1150 600 
U 5FD01D67
F0 "Real Time Clock" 50
F1 "rtc.sch" 50
F2 "~DB[0..15]" B L 4800 5450 50 
F3 "~RTCAW" I L 4800 5650 50 
F4 "~RTCW" I L 4800 5850 50 
F5 "~RTCR" I L 4800 5750 50 
F6 "~RTCCS" I L 4800 5550 50 
$EndSheet
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
F15 "~RTCR" O R 2250 3500 50 
F16 "~RTCAW" O R 2250 3600 50 
F17 "~RTCW" O R 2250 3400 50 
F18 "~RISR" O R 2250 2600 50 
F19 "~RIER" O R 2250 2400 50 
F20 "~WIER" O R 2250 2500 50 
F21 "~T0CS" O R 2250 2800 50 
F22 "~T1CS" O R 2250 2900 50 
F23 "~RTCCS" O R 2250 3100 50 
$EndSheet
Wire Wire Line
	2250 2400 3950 2400
Wire Wire Line
	3950 2400 3950 2950
Wire Wire Line
	3950 2950 4800 2950
Wire Wire Line
	2250 2500 3850 2500
Wire Wire Line
	3850 2500 3850 3050
Wire Wire Line
	3850 3050 4800 3050
Wire Wire Line
	2250 2600 3750 2600
Wire Wire Line
	3750 2600 3750 3200
Wire Wire Line
	3750 3200 4800 3200
Text Notes 4600 2000 0    100  ~ 20
Interrupt Controller
Text Label -8700 3300 0    50   ~ 0
DB0
Text Label -8700 3200 0    50   ~ 0
DB1
Text Label -8700 3100 0    50   ~ 0
DB2
Text Label -8700 3000 0    50   ~ 0
DB3
Text Label -8700 2900 0    50   ~ 0
DB4
Text Label -8700 2800 0    50   ~ 0
DB5
Text Label -8700 2700 0    50   ~ 0
DB6
Text Label -8700 2600 0    50   ~ 0
DB7
Text Label -4900 2600 2    50   ~ 0
TCLK
Text Label -4900 3800 2    50   ~ 0
TCLK
Text Label -4900 2700 2    50   ~ 0
G0-0
Text Label -4900 3300 2    50   ~ 0
G0-1
Text Label -4900 3900 2    50   ~ 0
G0-2
Text Label -4900 5200 2    50   ~ 0
G1-0
Text Label -4900 5800 2    50   ~ 0
G1-1
Text Label -4900 6400 2    50   ~ 0
G1-2
Text Label -4900 2800 2    50   ~ 0
OUT0-0
Text Label -4900 3400 2    50   ~ 0
OUT0-1
Text Label -4900 4000 2    50   ~ 0
OUT0-2
Text Label -4900 5300 2    50   ~ 0
OUT1-0
Text Label -4900 5900 2    50   ~ 0
OUT1-1
Text Label -4900 6500 2    50   ~ 0
OUT1-2
Text Label -4900 3200 2    50   ~ 0
TCLK
Text Label -4900 5100 2    50   ~ 0
TCLK
Text Label -4900 5700 2    50   ~ 0
TCLK
Text Label -4900 6300 2    50   ~ 0
TCLK
$Comp
L alexios:74LVC1G11 U?
U 1 1 5F8DBED0
P -3750 3350
F 0 "U?" H -3800 3614 50  0000 C CNN
F 1 "74LVC1G11" H -3800 3523 50  0000 C CNN
F 2 "" H -3850 3275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H -3850 3275 50  0001 C CNN
	1    -3750 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4150 3300 -4050 3300
Wire Wire Line
	-5250 2800 -4150 2800
Wire Wire Line
	-5250 3400 -4050 3400
Wire Wire Line
	-4150 3500 -4050 3500
Wire Wire Line
	-5250 4000 -4150 4000
Wire Wire Line
	-3400 3500 -3350 3500
$Comp
L alexios:74LVC1G07 U?
U 1 1 5F940C9D
P -3150 3500
AR Path="/600C0F8F/5F940C9D" Ref="U?"  Part="1" 
AR Path="/5F940C9D" Ref="U?"  Part="1" 
AR Path="/60AA2B43/5F940C9D" Ref="U?"  Part="1" 
F 0 "U?" H -3100 3325 50  0000 C CNN
F 1 "74LVC1G07" H -3100 3234 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -3050 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -3050 3500 50  0001 C CNN
	1    -3150 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2850 3500 -2800 3500
Wire Wire Line
	-3050 3300 -2800 3300
Wire Wire Line
	-3400 3300 -3350 3300
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5F940CA9
P -3200 3300
AR Path="/600C0F8F/5F940CA9" Ref="D?"  Part="1" 
AR Path="/5F940CA9" Ref="D?"  Part="1" 
AR Path="/60AA2B43/5F940CA9" Ref="D?"  Part="1" 
F 0 "D?" H -3200 3517 50  0000 C CNN
F 1 "CUS520" H -3200 3426 50  0000 C CNN
F 2 "alexios:SOD-323" H -3200 3300 50  0001 C CNN
F 3 "~" H -3200 3300 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H -3200 3300 50  0001 C CNN "Mouser"
	1    -3200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3400 3300 -3400 3400
Wire Wire Line
	-2800 3300 -2800 3400
Wire Wire Line
	-3550 3400 -3400 3400
Connection ~ -3400 3400
Wire Wire Line
	-3400 3400 -3400 3500
Wire Wire Line
	-2800 3400 -2600 3400
Connection ~ -2800 3400
Wire Wire Line
	-2800 3400 -2800 3500
$Comp
L Connector_Generic:Conn_02x03_Odd_Even JP?
U 1 1 5F96BBB3
P -2300 3400
F 0 "JP?" H -2250 3625 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H -2250 3626 50  0001 C CNN
F 2 "" H -2300 3400 50  0001 C CNN
F 3 "~" H -2300 3400 50  0001 C CNN
	1    -2300 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2600 3400 -2600 3300
Wire Wire Line
	-2600 3300 -2500 3300
Wire Wire Line
	-2600 3400 -2500 3400
Connection ~ -2600 3400
Wire Wire Line
	-2600 3400 -2600 3500
Wire Wire Line
	-2600 3500 -2500 3500
Wire Wire Line
	-2000 3300 -1750 3300
Wire Wire Line
	-2000 3400 -1750 3400
Wire Wire Line
	-2000 3500 -1750 3500
Text Label -1750 3300 2    50   ~ 0
~IRQ0
Text Label -1750 3400 2    50   ~ 0
~IRQ1
Text Label -1750 3500 2    50   ~ 0
~IRQ2
Wire Wire Line
	-5250 2600 -4800 2600
Wire Wire Line
	-5250 6300 -4800 6300
Wire Wire Line
	-5250 5700 -4800 5700
Connection ~ -4800 5700
Wire Wire Line
	-5250 5100 -4800 5100
Wire Wire Line
	-5250 3200 -4800 3200
Connection ~ -4800 3200
Wire Wire Line
	-5250 3800 -4800 3800
Wire Wire Line
	-5250 5300 -4150 5300
Wire Wire Line
	-5250 5900 -4050 5900
Wire Wire Line
	-5250 6500 -4150 6500
Text Label -1750 6000 2    50   ~ 0
~IRQ2
Text Label -1750 5900 2    50   ~ 0
~IRQ1
Text Label -1750 5800 2    50   ~ 0
~IRQ0
Wire Wire Line
	-2000 6000 -1750 6000
Wire Wire Line
	-2000 5900 -1750 5900
Wire Wire Line
	-2000 5800 -1750 5800
Wire Wire Line
	-2600 6000 -2500 6000
Wire Wire Line
	-2600 5900 -2600 6000
Connection ~ -2600 5900
Wire Wire Line
	-2600 5900 -2500 5900
Wire Wire Line
	-2600 5800 -2500 5800
Wire Wire Line
	-2600 5900 -2600 5800
$Comp
L Connector_Generic:Conn_02x03_Odd_Even JP?
U 1 1 5F9B5780
P -2300 5900
F 0 "JP?" H -2250 6125 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H -2250 6126 50  0001 C CNN
F 2 "" H -2300 5900 50  0001 C CNN
F 3 "~" H -2300 5900 50  0001 C CNN
	1    -2300 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2800 5900 -2800 6000
Connection ~ -2800 5900
Wire Wire Line
	-2800 5900 -2600 5900
Wire Wire Line
	-3400 5900 -3400 6000
Connection ~ -3400 5900
Wire Wire Line
	-3550 5900 -3400 5900
Wire Wire Line
	-2800 5800 -2800 5900
Wire Wire Line
	-3400 5800 -3400 5900
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5F9B5772
P -3200 5800
AR Path="/600C0F8F/5F9B5772" Ref="D?"  Part="1" 
AR Path="/5F9B5772" Ref="D?"  Part="1" 
AR Path="/60AA2B43/5F9B5772" Ref="D?"  Part="1" 
F 0 "D?" H -3200 6017 50  0000 C CNN
F 1 "CUS520" H -3200 5926 50  0000 C CNN
F 2 "alexios:SOD-323" H -3200 5800 50  0001 C CNN
F 3 "~" H -3200 5800 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H -3200 5800 50  0001 C CNN "Mouser"
	1    -3200 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3400 5800 -3350 5800
Wire Wire Line
	-3050 5800 -2800 5800
Wire Wire Line
	-2850 6000 -2800 6000
$Comp
L alexios:74LVC1G07 U?
U 1 1 5F9B5768
P -3150 6000
AR Path="/600C0F8F/5F9B5768" Ref="U?"  Part="1" 
AR Path="/5F9B5768" Ref="U?"  Part="1" 
AR Path="/60AA2B43/5F9B5768" Ref="U?"  Part="1" 
F 0 "U?" H -3100 5825 50  0000 C CNN
F 1 "74LVC1G07" H -3100 5734 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -3050 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -3050 6000 50  0001 C CNN
	1    -3150 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3400 6000 -3350 6000
Wire Wire Line
	-4150 6000 -4050 6000
Wire Wire Line
	-4150 5800 -4050 5800
$Comp
L alexios:74LVC1G11 U?
U 1 1 5F9B575B
P -3750 5850
F 0 "U?" H -3800 6114 50  0000 C CNN
F 1 "74LVC1G11" H -3800 6023 50  0000 C CNN
F 2 "" H -3850 5775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H -3850 5775 50  0001 C CNN
	1    -3750 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FA901AF
P -4650 2500
F 0 "R?" H -4591 2546 50  0000 L CNN
F 1 "4.7kΩ" H -4591 2455 50  0000 L CNN
F 2 "" H -4650 2500 50  0001 C CNN
F 3 "~" H -4650 2500 50  0001 C CNN
	1    -4650 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4650 2600 -4650 2700
Wire Wire Line
	-5250 2700 -4650 2700
Wire Wire Line
	-4650 3300 -4650 3200
Wire Wire Line
	-5250 3300 -4650 3300
$Comp
L Device:R_Small R?
U 1 1 5FAA840A
P -4650 3100
F 0 "R?" H -4591 3146 50  0000 L CNN
F 1 "4.7kΩ" H -4591 3055 50  0000 L CNN
F 2 "" H -4650 3100 50  0001 C CNN
F 3 "~" H -4650 3100 50  0001 C CNN
	1    -4650 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FAA8DC3
P -4650 3000
F 0 "#PWR?" H -4650 2850 50  0001 C CNN
F 1 "+5V" H -4500 3050 50  0000 C CNN
F 2 "" H -4650 3000 50  0001 C CNN
F 3 "" H -4650 3000 50  0001 C CNN
	1    -4650 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FAA8FDB
P -4650 2400
F 0 "#PWR?" H -4650 2250 50  0001 C CNN
F 1 "+5V" H -4500 2450 50  0000 C CNN
F 2 "" H -4650 2400 50  0001 C CNN
F 3 "" H -4650 2400 50  0001 C CNN
	1    -4650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4650 2700 -4350 2700
Text Label -4350 2700 2    50   ~ 0
G0-0
Wire Wire Line
	-4650 3300 -4350 3300
Connection ~ -4650 3300
Text Label -4350 3300 2    50   ~ 0
G0-1
Wire Wire Line
	-4800 2600 -4800 3200
Connection ~ -4650 2700
Wire Wire Line
	-4150 2800 -4150 3300
Connection ~ -4800 3800
Wire Wire Line
	-4800 3800 -4800 4350
Wire Wire Line
	-4800 3200 -4800 3800
Wire Wire Line
	-4150 3500 -4150 4000
Connection ~ -4800 5100
Wire Wire Line
	-4800 5100 -4800 5700
Wire Wire Line
	-4800 5700 -4800 6300
Wire Wire Line
	-4150 6000 -4150 6500
Wire Wire Line
	-4150 5300 -4150 5800
Wire Wire Line
	-4600 3900 -4600 3800
$Comp
L Device:R_Small R?
U 1 1 5FB9C74B
P -4600 3700
F 0 "R?" H -4541 3746 50  0000 L CNN
F 1 "4.7kΩ" H -4541 3655 50  0000 L CNN
F 2 "" H -4600 3700 50  0001 C CNN
F 3 "~" H -4600 3700 50  0001 C CNN
	1    -4600 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FB9C751
P -4600 3600
F 0 "#PWR?" H -4600 3450 50  0001 C CNN
F 1 "+5V" H -4450 3650 50  0000 C CNN
F 2 "" H -4600 3600 50  0001 C CNN
F 3 "" H -4600 3600 50  0001 C CNN
	1    -4600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	-5250 3900 -4600 3900
Connection ~ -4600 3900
Wire Wire Line
	-4600 3900 -4350 3900
Text Label -4350 3900 2    50   ~ 0
G0-2
$Comp
L Device:R_Small R?
U 1 1 5FBC9E65
P -4650 5000
F 0 "R?" H -4591 5046 50  0000 L CNN
F 1 "4.7kΩ" H -4591 4955 50  0000 L CNN
F 2 "" H -4650 5000 50  0001 C CNN
F 3 "~" H -4650 5000 50  0001 C CNN
	1    -4650 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4650 5100 -4650 5200
$Comp
L power:+5V #PWR?
U 1 1 5FBC9E6D
P -4650 4900
F 0 "#PWR?" H -4650 4750 50  0001 C CNN
F 1 "+5V" H -4500 4950 50  0000 C CNN
F 2 "" H -4650 4900 50  0001 C CNN
F 3 "" H -4650 4900 50  0001 C CNN
	1    -4650 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4650 5200 -4350 5200
Connection ~ -4650 5200
Wire Wire Line
	-5250 5200 -4650 5200
$Comp
L Device:R_Small R?
U 1 1 5FBD6A63
P -4650 5600
F 0 "R?" H -4591 5646 50  0000 L CNN
F 1 "4.7kΩ" H -4591 5555 50  0000 L CNN
F 2 "" H -4650 5600 50  0001 C CNN
F 3 "~" H -4650 5600 50  0001 C CNN
	1    -4650 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4650 5700 -4650 5800
$Comp
L power:+5V #PWR?
U 1 1 5FBD6A6B
P -4650 5500
F 0 "#PWR?" H -4650 5350 50  0001 C CNN
F 1 "+5V" H -4500 5550 50  0000 C CNN
F 2 "" H -4650 5500 50  0001 C CNN
F 3 "" H -4650 5500 50  0001 C CNN
	1    -4650 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4650 5800 -4350 5800
Connection ~ -4650 5800
Wire Wire Line
	-5250 5800 -4650 5800
$Comp
L Device:R_Small R?
U 1 1 5FBE3A0C
P -4650 6200
F 0 "R?" H -4591 6246 50  0000 L CNN
F 1 "4.7kΩ" H -4591 6155 50  0000 L CNN
F 2 "" H -4650 6200 50  0001 C CNN
F 3 "~" H -4650 6200 50  0001 C CNN
	1    -4650 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4650 6300 -4650 6400
$Comp
L power:+5V #PWR?
U 1 1 5FBE3A14
P -4650 6100
F 0 "#PWR?" H -4650 5950 50  0001 C CNN
F 1 "+5V" H -4500 6150 50  0000 C CNN
F 2 "" H -4650 6100 50  0001 C CNN
F 3 "" H -4650 6100 50  0001 C CNN
	1    -4650 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4650 6400 -4350 6400
Connection ~ -4650 6400
Wire Wire Line
	-5250 6400 -4650 6400
Text Label -4350 6400 2    50   ~ 0
G1-2
Text Label -4350 5800 2    50   ~ 0
G1-1
Text Label -4350 5200 2    50   ~ 0
TCLK
$Comp
L alexios:CXO_DIP8 X?
U 1 1 5FE325B2
P -7750 4300
F 0 "X?" H -7650 4667 50  0000 C CNN
F 1 "CXO_DIP8" H -7650 4576 50  0000 C CNN
F 2 "Oscillator:Oscillator_DIP-8" H -7600 3900 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H -7650 4250 50  0001 C CNN
	1    -7750 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FE33C3E
P -8100 4150
F 0 "#PWR?" H -8100 4000 50  0001 C CNN
F 1 "+5V" H -8085 4323 50  0000 C CNN
F 2 "" H -8100 4150 50  0001 C CNN
F 3 "" H -8100 4150 50  0001 C CNN
	1    -8100 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8100 4150 -8100 4200
Wire Wire Line
	-8100 4200 -8050 4200
$Comp
L power:GND #PWR?
U 1 1 5FE3A4BC
P -8100 4550
F 0 "#PWR?" H -8100 4300 50  0001 C CNN
F 1 "GND" H -8095 4377 50  0000 C CNN
F 2 "" H -8100 4550 50  0001 C CNN
F 3 "" H -8100 4550 50  0001 C CNN
	1    -8100 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8050 4500 -8100 4500
Wire Wire Line
	-8100 4500 -8100 4550
$Comp
L Device:C_Small C?
U 1 1 5FE53B82
P -8100 4350
AR Path="/5FE53B82" Ref="C?"  Part="1" 
AR Path="/5F160E7C/5FE53B82" Ref="C?"  Part="1" 
F 0 "C?" H -8191 4396 50  0000 R CNN
F 1 "100nF" H -8191 4305 50  0000 R CNN
F 2 "" H -8100 4350 50  0001 C CNN
F 3 "~" H -8100 4350 50  0001 C CNN
	1    -8100 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8100 4200 -8100 4250
Connection ~ -8100 4200
Wire Wire Line
	-8100 4450 -8100 4500
Connection ~ -8100 4500
Text Label -7150 4350 0    50   ~ 0
TCLK
$Comp
L power:+5V #PWR?
U 1 1 5FE6D877
P -7200 4150
F 0 "#PWR?" H -7200 4000 50  0001 C CNN
F 1 "+5V" H -7185 4323 50  0000 C CNN
F 2 "" H -7200 4150 50  0001 C CNN
F 3 "" H -7200 4150 50  0001 C CNN
	1    -7200 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-7200 4200 -7200 4150
Wire Wire Line
	-7250 4200 -7200 4200
Wire Wire Line
	-7250 4350 -4800 4350
$Comp
L alexios:74HCT245 U?
U 1 1 5FC34F15
P -7900 3100
F 0 "U?" H -7900 3867 50  0000 C CNN
F 1 "74HCT245" H -7900 3776 50  0000 C CNN
F 2 "" H -7900 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H -7900 3150 50  0001 C CNN
	1    -7900 3100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT245 U?
U 1 1 5FD36950
P -7900 5600
F 0 "U?" H -7900 6367 50  0000 C CNN
F 1 "74HCT245" H -7900 6276 50  0000 C CNN
F 2 "" H -7900 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H -7900 5650 50  0001 C CNN
	1    -7900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8700 3600 -8400 3600
Text Label -8700 3600 0    50   ~ 0
~T0CS
Wire Wire Line
	-8700 6100 -8400 6100
Text Label -8700 6100 0    50   ~ 0
~T1CS
Connection ~ -4800 4350
Wire Wire Line
	-4800 4350 -4800 5100
Wire Wire Line
	-8700 3500 -8400 3500
Text Label -8700 3500 0    50   ~ 0
~R
Wire Wire Line
	-8700 6000 -8400 6000
Text Label -8700 6000 0    50   ~ 0
~R
Wire Wire Line
	-7400 2700 -7200 2700
Wire Wire Line
	-7400 2600 -7200 2600
Text Label -7400 3300 0    50   ~ 0
T0D0
Text Label -7400 3200 0    50   ~ 0
T0D1
Text Label -7400 3100 0    50   ~ 0
T0D2
Text Label -7400 3000 0    50   ~ 0
T0D3
Text Label -7400 2900 0    50   ~ 0
T0D4
Text Label -7400 2800 0    50   ~ 0
T0D5
Text Label -7400 2700 0    50   ~ 0
T0D6
Text Label -7400 2600 0    50   ~ 0
T0D7
Wire Wire Line
	-7400 2900 -7200 2900
Wire Wire Line
	-7400 2800 -7200 2800
Wire Wire Line
	-7400 3100 -7200 3100
Wire Wire Line
	-7400 3000 -7200 3000
Wire Wire Line
	-7400 3300 -7200 3300
Wire Wire Line
	-7400 3200 -7200 3200
Entry Wire Line
	-7200 2600 -7100 2500
Entry Wire Line
	-7200 2700 -7100 2600
Entry Wire Line
	-7200 2800 -7100 2700
Entry Wire Line
	-7200 2900 -7100 2800
Entry Wire Line
	-7200 3000 -7100 2900
Entry Wire Line
	-7200 3100 -7100 3000
Entry Wire Line
	-7200 3200 -7100 3100
Entry Wire Line
	-7200 3300 -7100 3200
Entry Wire Line
	-6800 2500 -6700 2600
Entry Wire Line
	-6800 2600 -6700 2700
Entry Wire Line
	-6800 2700 -6700 2800
Entry Wire Line
	-6800 2800 -6700 2900
Entry Wire Line
	-6800 2900 -6700 3000
Entry Wire Line
	-6800 3000 -6700 3100
Entry Wire Line
	-6800 3100 -6700 3200
Entry Wire Line
	-6800 3200 -6700 3300
Text Label -6650 3300 0    50   ~ 0
T0D7
Text Label -6650 3200 0    50   ~ 0
T0D6
Text Label -6650 3100 0    50   ~ 0
T0D5
Text Label -6650 3000 0    50   ~ 0
T0D4
Text Label -6650 2900 0    50   ~ 0
T0D3
Text Label -6650 2800 0    50   ~ 0
T0D2
Text Label -6650 2700 0    50   ~ 0
T0D1
Text Label -6650 2600 0    50   ~ 0
T0D0
Wire Wire Line
	-6700 3300 -6450 3300
Wire Wire Line
	-6700 3200 -6450 3200
Wire Wire Line
	-6700 3100 -6450 3100
Wire Wire Line
	-6700 3000 -6450 3000
Wire Wire Line
	-6700 2900 -6450 2900
Wire Wire Line
	-6700 2800 -6450 2800
Wire Wire Line
	-6700 2700 -6450 2700
Wire Wire Line
	-6700 2600 -6450 2600
Entry Bus Bus
	-7100 2400 -7000 2300
Entry Bus Bus
	-6800 2400 -6900 2300
Wire Bus Line
	-7000 2300 -6900 2300
Text Label -6800 2950 1    50   ~ 0
TOD[0..7]
Wire Wire Line
	-8700 5800 -8400 5800
Wire Wire Line
	-8700 5700 -8400 5700
Wire Wire Line
	-8700 5600 -8400 5600
Wire Wire Line
	-8700 5500 -8400 5500
Wire Wire Line
	-8700 5400 -8400 5400
Wire Wire Line
	-8700 5300 -8400 5300
Wire Wire Line
	-8700 5200 -8400 5200
Wire Wire Line
	-8700 5100 -8400 5100
Text Label -8700 5800 0    50   ~ 0
DB0
Text Label -8700 5700 0    50   ~ 0
DB1
Text Label -8700 5600 0    50   ~ 0
DB2
Text Label -8700 5500 0    50   ~ 0
DB3
Text Label -8700 5400 0    50   ~ 0
DB4
Text Label -8700 5300 0    50   ~ 0
DB5
Text Label -8700 5200 0    50   ~ 0
DB6
Text Label -8700 5100 0    50   ~ 0
DB7
Wire Wire Line
	-7400 5200 -7200 5200
Wire Wire Line
	-7400 5100 -7200 5100
Wire Wire Line
	-7400 5400 -7200 5400
Wire Wire Line
	-7400 5300 -7200 5300
Wire Wire Line
	-7400 5600 -7200 5600
Wire Wire Line
	-7400 5500 -7200 5500
Wire Wire Line
	-7400 5800 -7200 5800
Wire Wire Line
	-7400 5700 -7200 5700
Entry Wire Line
	-7200 5100 -7100 5000
Entry Wire Line
	-7200 5200 -7100 5100
Entry Wire Line
	-7200 5300 -7100 5200
Entry Wire Line
	-7200 5400 -7100 5300
Entry Wire Line
	-7200 5500 -7100 5400
Entry Wire Line
	-7200 5600 -7100 5500
Entry Wire Line
	-7200 5700 -7100 5600
Entry Wire Line
	-7200 5800 -7100 5700
Entry Wire Line
	-6800 5000 -6700 5100
Entry Wire Line
	-6800 5100 -6700 5200
Entry Wire Line
	-6800 5200 -6700 5300
Entry Wire Line
	-6800 5300 -6700 5400
Entry Wire Line
	-6800 5400 -6700 5500
Entry Wire Line
	-6800 5500 -6700 5600
Entry Wire Line
	-6800 5600 -6700 5700
Entry Wire Line
	-6800 5700 -6700 5800
Wire Wire Line
	-6700 5800 -6450 5800
Wire Wire Line
	-6700 5700 -6450 5700
Wire Wire Line
	-6700 5600 -6450 5600
Wire Wire Line
	-6700 5500 -6450 5500
Wire Wire Line
	-6700 5400 -6450 5400
Wire Wire Line
	-6700 5300 -6450 5300
Wire Wire Line
	-6700 5200 -6450 5200
Wire Wire Line
	-6700 5100 -6450 5100
Entry Bus Bus
	-7100 4900 -7000 4800
Entry Bus Bus
	-6800 4900 -6900 4800
Wire Bus Line
	-7000 4800 -6900 4800
Text Label -6800 5450 1    50   ~ 0
T1D[0..7]
Text Label -7400 5800 0    50   ~ 0
T1D0
Text Label -7400 5700 0    50   ~ 0
T1D1
Text Label -7400 5600 0    50   ~ 0
T1D2
Text Label -7400 5500 0    50   ~ 0
T1D3
Text Label -7400 5400 0    50   ~ 0
T1D4
Text Label -7400 5300 0    50   ~ 0
T1D5
Text Label -7400 5200 0    50   ~ 0
T1D6
Text Label -7400 5100 0    50   ~ 0
T1D7
Text Label -6650 5100 0    50   ~ 0
T1D0
Text Label -6650 5200 0    50   ~ 0
T1D1
Text Label -6650 5300 0    50   ~ 0
T1D2
Text Label -6650 5400 0    50   ~ 0
T1D3
Text Label -6650 5500 0    50   ~ 0
T1D4
Text Label -6650 5600 0    50   ~ 0
T1D5
Text Label -6650 5700 0    50   ~ 0
T1D6
Text Label -6650 5800 0    50   ~ 0
T1D7
Wire Bus Line
	-7100 2400 -7100 3200
Wire Bus Line
	-6800 2400 -6800 3200
Wire Bus Line
	-7100 4900 -7100 5700
Wire Bus Line
	-6800 4900 -6800 5700
$EndSCHEMATC
