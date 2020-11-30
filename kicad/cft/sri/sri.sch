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
Wire Bus Line
	8350 2200 7800 2200
Wire Bus Line
	8350 2300 7800 2300
Text Label 7800 2300 0    50   ~ 0
DB[0..15]
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
Text Label 7800 2900 0    50   ~ 0
~IRQ[0..7]
Text Label 7800 2700 0    50   ~ 0
~IRQ
Wire Wire Line
	8350 2400 7800 2400
Wire Wire Line
	8350 2500 7800 2500
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
Text Label 7800 3800 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P 10850 6050
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR012"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H 10850 5900 50  0001 C CNN
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
AR Path="/5DD552A6" Ref="#PWR015"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR015" H 10850 6200 50  0001 C CNN
F 1 "GND" H 10772 6413 50  0000 R CNN
F 2 "" H 10850 6450 50  0001 C CNN
F 3 "" H 10850 6450 50  0001 C CNN
	1    10850 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 6050 10850 6150
$Comp
L Device:CP_Small C4
U 1 1 5DD552AD
P 10850 6250
AR Path="/5DD552AD" Ref="C4"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C4" H 10762 6296 50  0000 R CNN
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
AR Path="/5DD552B4" Ref="#PWR011"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR011" H 10400 5900 50  0001 C CNN
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
AR Path="/5DD552BA" Ref="#PWR014"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR014" H 10400 6200 50  0001 C CNN
F 1 "GND" H 10322 6413 50  0000 R CNN
F 2 "" H 10400 6450 50  0001 C CNN
F 3 "" H 10400 6450 50  0001 C CNN
	1    10400 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 6050 10400 6150
$Comp
L Device:CP_Small C3
U 1 1 5DD552C1
P 10400 6250
AR Path="/5DD552C1" Ref="C3"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C3" H 10312 6296 50  0000 R CNN
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
NoConn ~ 7800 3000
NoConn ~ 7800 3200
NoConn ~ 7800 3300
NoConn ~ 7800 3400
Text Label 7800 2200 0    50   ~ 0
AB[0..23]
Text Notes 700  850  0    100  ~ 20
The INT, IRC and RTC boards
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
F15 "~RTCR" O R 2250 3400 50 
F16 "~RTCAW" O R 2250 3300 50 
F17 "~RTCW" O R 2250 3500 50 
F18 "~RISR" O R 2250 2600 50 
F19 "~RIER" O R 2250 2400 50 
F20 "~WIER" O R 2250 2500 50 
F21 "~T0CS" O R 2250 2800 50 
F22 "~T1CS" O R 2250 2900 50 
F23 "~RTCCS" O R 2250 3100 50 
$EndSheet
Wire Wire Line
	9800 2000 9500 2000
Text Label 9800 1700 2    50   ~ 0
G0-1
Text Label 9800 1800 2    50   ~ 0
G0-2
Text Label 9800 1900 2    50   ~ 0
G1-0
Text Label 9800 2100 2    50   ~ 0
G1-1
Text Label 9800 2000 2    50   ~ 0
G1-2
Text Label 9800 1600 2    50   ~ 0
G0-0
Wire Wire Line
	9500 1600 9800 1600
Wire Wire Line
	9500 1700 9800 1700
Wire Wire Line
	9500 1800 9800 1800
Wire Wire Line
	9500 1900 9800 1900
Wire Wire Line
	9500 2100 9800 2100
$Sheet
S 8350 1450 1150 4200
U 5DD5525C
F0 "sheet5DD55211" 50
F1 "./bus.sch" 50
F2 "AB[0..23]" U L 8350 2200 50 
F3 "DB[0..15]" U L 8350 2300 50 
F4 "FPD[0..7]" U L 8350 2600 50 
F5 "~RESET" U L 8350 1700 50 
F6 "CLK1" U L 8350 1800 50 
F7 "CLK2" U L 8350 1900 50 
F8 "CLK3" U L 8350 2000 50 
F9 "CLK4" U L 8350 2100 50 
F10 "WSTB" U L 8350 2400 50 
F11 "T34" U L 8350 2500 50 
F12 "~IRQ" U L 8350 2700 50 
F13 "~IRQS" U L 8350 2800 50 
F14 "~IRQ[0..7]" U L 8350 2900 50 
F15 "~RSTHOLD" U L 8350 3000 50 
F16 "~SYSDEV" U L 8350 3100 50 
F17 "~IODEV1xx" U L 8350 3200 50 
F18 "~IODEV2xx" U L 8350 3300 50 
F19 "~IODEV3xx" U L 8350 3400 50 
F20 "~MEM" U L 8350 3500 50 
F21 "~IO" U L 8350 3600 50 
F22 "~R" U L 8350 3700 50 
F23 "~W" U L 8350 3800 50 
F24 "~WS" U L 8350 3900 50 
F25 "~ENDEXT" U L 8350 4000 50 
F26 "~SKIPEXT" U L 8350 4100 50 
F27 "~HALT" U L 8350 4200 50 
F28 "C1" U R 9500 1600 50 
F29 "C2" U R 9500 1700 50 
F30 "C3" U R 9500 1800 50 
F31 "C4" U R 9500 1900 50 
F32 "C5" U R 9500 2000 50 
F33 "C6" U R 9500 2100 50 
F34 "C7" U R 9500 2200 50 
F35 "C8" U R 9500 2300 50 
F36 "C9" U R 9500 2400 50 
F37 "C10" U R 9500 2500 50 
F38 "C11" U R 9500 2600 50 
F39 "C12" U R 9500 2700 50 
F40 "C13" U R 9500 2800 50 
F41 "C14" U R 9500 2900 50 
F42 "C15" U R 9500 3000 50 
F43 "C16" U R 9500 3100 50 
F44 "C17" U R 9500 3200 50 
F45 "C18" U R 9500 3300 50 
F46 "C19" U R 9500 3400 50 
F47 "C20" U R 9500 3500 50 
F48 "C21" U R 9500 3600 50 
F49 "C22" U R 9500 3700 50 
F50 "C23" U R 9500 3800 50 
F51 "C24" U R 9500 3900 50 
F52 "C25" U R 9500 4000 50 
F53 "C26" U R 9500 4100 50 
F54 "C27" U R 9500 4200 50 
F55 "C28" U R 9500 4300 50 
F56 "C29" U R 9500 4400 50 
F57 "C30" U R 9500 4500 50 
F58 "C31" U R 9500 4600 50 
F59 "C32" U R 9500 4700 50 
F60 "C33" U R 9500 4800 50 
F61 "C34" U R 9500 4900 50 
F62 "C35" U R 9500 5000 50 
F63 "C36" U R 9500 5100 50 
F64 "C37" U R 9500 5200 50 
F65 "C38" U R 9500 5300 50 
F66 "C39" U R 9500 5400 50 
F67 "C40" U R 9500 5500 50 
$EndSheet
Wire Wire Line
	9500 2200 9800 2200
Wire Wire Line
	9500 2300 9800 2300
Wire Wire Line
	9500 2400 9800 2400
Wire Wire Line
	9500 2500 9800 2500
Wire Wire Line
	9500 2600 9800 2600
Wire Wire Line
	9500 2700 9800 2700
Wire Wire Line
	9500 2800 9800 2800
Wire Wire Line
	9500 2900 9800 2900
Wire Wire Line
	9500 3000 9800 3000
Wire Wire Line
	9500 3100 9800 3100
Wire Wire Line
	9500 3200 9800 3200
Wire Wire Line
	9500 3300 9800 3300
Wire Wire Line
	9500 3400 9800 3400
Wire Wire Line
	9500 3500 9800 3500
Wire Wire Line
	9500 3600 9800 3600
Wire Wire Line
	9500 3700 9800 3700
Wire Wire Line
	9500 3800 9800 3800
Wire Wire Line
	9500 3900 9800 3900
Wire Wire Line
	9500 4000 9800 4000
Wire Wire Line
	9500 4100 9800 4100
Wire Wire Line
	9500 4200 9800 4200
Wire Wire Line
	9500 4300 9800 4300
Wire Wire Line
	9500 4400 9800 4400
Wire Wire Line
	9500 4500 9800 4500
Wire Wire Line
	9500 4600 9800 4600
Wire Wire Line
	9500 4700 9800 4700
Wire Wire Line
	9500 4800 9800 4800
Wire Wire Line
	9500 4900 9800 4900
Wire Wire Line
	9500 5000 9800 5000
Wire Wire Line
	9500 5100 9800 5100
Wire Wire Line
	9500 5200 9800 5200
Wire Wire Line
	9500 5300 9800 5300
Wire Wire Line
	9500 5400 9800 5400
Wire Wire Line
	9500 5500 9800 5500
NoConn ~ 9800 2200
NoConn ~ 9800 2300
NoConn ~ 9800 2400
NoConn ~ 9800 2500
NoConn ~ 9800 2600
NoConn ~ 9800 2700
NoConn ~ 9800 2800
NoConn ~ 9800 2900
NoConn ~ 9800 3000
NoConn ~ 9800 3100
NoConn ~ 9800 3200
NoConn ~ 9800 3300
NoConn ~ 9800 3400
NoConn ~ 9800 3500
NoConn ~ 9800 3600
NoConn ~ 9800 3700
NoConn ~ 9800 3800
NoConn ~ 9800 3900
NoConn ~ 9800 4000
NoConn ~ 9800 4100
NoConn ~ 9800 4200
NoConn ~ 9800 4300
NoConn ~ 9800 4400
NoConn ~ 9800 4500
NoConn ~ 9800 4600
NoConn ~ 9800 4700
NoConn ~ 9800 4800
NoConn ~ 9800 4900
NoConn ~ 9800 5000
NoConn ~ 9800 5100
NoConn ~ 9800 5200
NoConn ~ 9800 5300
Text Label 9800 5400 2    50   ~ 0
~FPIEN
Text Label 9800 5500 2    50   ~ 0
~FPIRF
NoConn ~ 7800 4000
NoConn ~ 7800 4100
NoConn ~ 7800 4200
NoConn ~ 7800 3500
NoConn ~ 7800 2800
NoConn ~ 7800 2400
NoConn ~ 7800 2500
NoConn ~ 7800 2100
NoConn ~ 7800 1800
NoConn ~ 7800 3600
Text Notes 4600 2000 0    100  ~ 20
Interrupt Controller
Text Notes 700  1650 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
$EndSCHEMATC
