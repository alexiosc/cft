EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 14
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
Text Label 4350 6000 0    50   ~ 0
~RTCW
Text Label 4350 5900 0    50   ~ 0
~RTCR
Text Label 4350 5800 0    50   ~ 0
~RTCAW
Text Label 4350 5700 0    50   ~ 0
~RTCCS
Wire Wire Line
	4800 6000 4350 6000
Wire Wire Line
	4800 5900 4350 5900
Wire Wire Line
	4800 5800 4350 5800
Wire Wire Line
	4800 5700 4350 5700
$Sheet
S 4800 5500 1150 600 
U 5FD01D67
F0 "Real Time Clock" 50
F1 "rtc.sch" 50
F2 "~DB[0..15]" B L 4800 5600 50 
F3 "~RTCAW" I L 4800 5800 50 
F4 "~RTCW" I L 4800 6000 50 
F5 "~RTCR" I L 4800 5900 50 
F6 "~RTCCS" I L 4800 5700 50 
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
$Sheet
S 4800 3950 1150 1200
U 607E2CF3
F0 "Timers" 50
F1 "tmr.sch" 50
F2 "G0-0" O R 5950 4100 50 
F3 "G0-1" O R 5950 4200 50 
F4 "G0-2" O R 5950 4300 50 
F5 "G1-0" O R 5950 4400 50 
F6 "G1-1" O R 5950 4500 50 
F7 "G1-2" O R 5950 4600 50 
F8 "~IRQ0" T R 5950 4800 50 
F9 "~IRQ1" T R 5950 4900 50 
F10 "~IRQ2" T R 5950 5000 50 
F11 "DB[0..15]" B L 4800 4500 50 
F12 "~R" I L 4800 4100 50 
F13 "~T0CS" I L 4800 4800 50 
F14 "~T1CS" I L 4800 4900 50 
F15 "~W" I L 4800 4200 50 
F16 "AB0" I L 4800 4300 50 
F17 "AB1" I L 4800 4400 50 
$EndSheet
Wire Wire Line
	2250 2800 3650 2800
Wire Wire Line
	3650 2800 3650 4800
Wire Wire Line
	3650 4800 4800 4800
Wire Wire Line
	2250 2900 3550 2900
Wire Wire Line
	3550 2900 3550 4900
Wire Wire Line
	3550 4900 4800 4900
Wire Bus Line
	4800 4500 4350 4500
Text Label 4350 4500 0    50   ~ 0
DB[0..15]
Wire Bus Line
	4800 5600 4350 5600
Text Label 4350 5600 0    50   ~ 0
DB[0..15]
Wire Bus Line
	4800 2800 4350 2800
Text Label 4350 2800 0    50   ~ 0
DB[0..15]
$EndSCHEMATC
