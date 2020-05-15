EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 10
Title "Arithmetic & Logic Unit"
Date "2019-11-17"
Rev "2020"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 8500 1300 1150 4200
U 5D34E810
F0 "Left Edge Connector" 50
F1 "bus.sch" 50
F2 "IBUS[0..15]" U L 8500 1450 50 
F3 "~RESET" U L 8500 1550 50 
F4 "CLK1" U L 8500 1650 50 
F5 "CLK2" U L 8500 1750 50 
F6 "CLK3" U L 8500 1850 50 
F7 "CLK4" U L 8500 1950 50 
F8 "T34" U L 8500 2350 50 
F9 "~IRQ" U L 8500 2550 50 
F10 "~IRQS" U L 8500 2650 50 
F11 "~RSTHOLD" U L 8500 2850 50 
F12 "~SYSDEV" U L 8500 2950 50 
F13 "~IODEV1xx" U L 8500 3050 50 
F14 "~IODEV2xx" U L 8500 3150 50 
F15 "~IODEV3xx" U L 8500 3250 50 
F16 "~MEM" U L 8500 3350 50 
F17 "~IO" U L 8500 3450 50 
F18 "~R" U L 8500 3550 50 
F19 "~W" U L 8500 3650 50 
F20 "~WS" U L 8500 3750 50 
F21 "~ENDEXT" U L 8500 3850 50 
F22 "~SKIPEXT" U L 8500 3950 50 
F23 "~HALT" U L 8500 4050 50 
F24 "ACTION[0..3]" U L 8500 4350 50 
F25 "WADDR[0..4]" U L 8500 4450 50 
F26 "RADDR[0..4]" U L 8500 4550 50 
F27 "RSVD[1..4]" U L 8500 4650 50 
F28 "C1" U R 9650 1450 50 
F29 "C2" U R 9650 1550 50 
F30 "C3" U R 9650 1650 50 
F31 "C4" U R 9650 1750 50 
F32 "C5" U R 9650 1850 50 
F33 "C6" U R 9650 1950 50 
F34 "C7" U R 9650 2050 50 
F35 "C8" U R 9650 2150 50 
F36 "C9" U R 9650 2250 50 
F37 "C10" U R 9650 2350 50 
F38 "C11" U R 9650 2450 50 
F39 "C12" U R 9650 2550 50 
F40 "C13" U R 9650 2650 50 
F41 "C14" U R 9650 2750 50 
F42 "C15" U R 9650 2850 50 
F43 "C16" U R 9650 2950 50 
F44 "C17" U R 9650 3050 50 
F45 "C18" U R 9650 3150 50 
F46 "C19" U R 9650 3250 50 
F47 "C20" U R 9650 3350 50 
F48 "C21" U R 9650 3450 50 
F49 "C22" U R 9650 3550 50 
F50 "C23" U R 9650 3650 50 
F51 "C24" U R 9650 3750 50 
F52 "C25" U R 9650 3850 50 
F53 "C26" U R 9650 3950 50 
F54 "C27" U R 9650 4050 50 
F55 "C28" U R 9650 4150 50 
F56 "C29" U R 9650 4250 50 
F57 "C30" U R 9650 4350 50 
F58 "C31" U R 9650 4450 50 
F59 "C32" U R 9650 4550 50 
F60 "C33" U R 9650 4650 50 
F61 "C34" U R 9650 4750 50 
F62 "C35" U R 9650 4850 50 
F63 "C36" U R 9650 4950 50 
F64 "C37" U R 9650 5050 50 
F65 "C38" U R 9650 5150 50 
F66 "C39" U R 9650 5250 50 
F67 "C40" U R 9650 5350 50 
$EndSheet
Wire Wire Line
	8500 1650 7950 1650
Wire Wire Line
	8500 1750 7950 1750
Wire Wire Line
	8500 1850 7950 1850
Wire Wire Line
	8500 1950 7950 1950
Wire Wire Line
	8500 1550 7950 1550
Wire Wire Line
	8500 2850 7950 2850
Wire Wire Line
	8500 2950 7950 2950
Wire Wire Line
	8500 3050 7950 3050
Wire Wire Line
	8500 2550 7950 2550
Wire Wire Line
	8500 3350 7950 3350
Wire Wire Line
	8500 3450 7950 3450
Wire Wire Line
	8500 3550 7950 3550
Wire Wire Line
	8500 3650 7950 3650
Wire Wire Line
	8500 3250 7950 3250
Wire Wire Line
	8500 3150 7950 3150
Wire Wire Line
	8500 3950 7950 3950
Wire Wire Line
	8500 4050 7950 4050
Wire Wire Line
	8500 3850 7950 3850
Wire Wire Line
	8500 3750 7950 3750
Text Label 7950 2550 0    50   ~ 0
~IRQ
Wire Wire Line
	8500 2350 7950 2350
Wire Bus Line
	7950 1450 8500 1450
Text Label 7950 1450 0    50   ~ 0
IBUS[0..15]
Text Label 7950 1550 0    50   ~ 0
~RESET
Text Label 7950 1650 0    50   ~ 0
CLK1
Text Label 7950 1750 0    50   ~ 0
CLK2
Text Label 7950 1850 0    50   ~ 0
CLK3
Text Label 7950 1950 0    50   ~ 0
CLK4
Wire Wire Line
	8500 2650 7950 2650
Text Label 7950 2650 0    50   ~ 0
~IRQS
Text Label 7950 2850 0    50   ~ 0
~RSTHOLD
Text Label 7950 2950 0    50   ~ 0
~SYSDEV
Text Label 7950 3050 0    50   ~ 0
~IODEV1xx
Text Label 7950 3150 0    50   ~ 0
~IODEV2xx
Text Label 7950 3250 0    50   ~ 0
~IODEV3xx
Text Label 7950 3350 0    50   ~ 0
~MEM
Text Label 7950 3450 0    50   ~ 0
~IO
Text Label 7950 3550 0    50   ~ 0
~R
Text Label 7950 3750 0    50   ~ 0
~WS
Text Label 7950 3850 0    50   ~ 0
~ENDEXT
Text Label 7950 3950 0    50   ~ 0
~SKIPEXT
Text Label 7950 4050 0    50   ~ 0
~HALT
Text Label 7950 4350 0    50   ~ 0
ACTION[0..3]
Text Label 7950 4450 0    50   ~ 0
WADDR[0..4]
Text Label 7950 4550 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	8500 4350 7950 4350
Wire Bus Line
	8500 4450 7950 4450
Wire Bus Line
	8500 4550 7950 4550
Wire Bus Line
	7950 4650 8500 4650
Text Label 7950 4650 0    50   ~ 0
RSVD[1..4]
Text Notes 9250 3800 1    100  ~ 20
Backplane Slot
Text Label 7950 3650 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5D8B16F5
P 11000 5900
AR Path="/5F67D4B5/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16F5" Ref="#PWR02"  Part="1" 
AR Path="/5D34E810/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 11000 5750 50  0001 C CNN
F 1 "+5V" H 10942 5937 50  0000 R CNN
F 2 "" H 11000 5900 50  0001 C CNN
F 3 "" H 11000 5900 50  0001 C CNN
	1    11000 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8B16FB
P 11000 6300
AR Path="/5F67D4B5/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16FB" Ref="#PWR04"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 11000 6050 50  0001 C CNN
F 1 "GND" H 10922 6263 50  0000 R CNN
F 2 "" H 11000 6300 50  0001 C CNN
F 3 "" H 11000 6300 50  0001 C CNN
	1    11000 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 5900 11000 6000
$Comp
L Device:CP_Small C2
U 1 1 5D8B1702
P 11000 6100
AR Path="/5D8B1702" Ref="C2"  Part="1" 
AR Path="/5D34E810/5D8B1702" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8B1702" Ref="C?"  Part="1" 
F 0 "C2" H 10912 6146 50  0000 R CNN
F 1 "47µF" H 10912 6055 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 11000 6100 50  0001 C CNN
F 3 "~" H 11000 6100 50  0001 C CNN
	1    11000 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 6200 11000 6300
$Comp
L power:+5V #PWR?
U 1 1 5D8C8446
P 10550 5900
AR Path="/5F67D4B5/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D8C8446" Ref="#PWR01"  Part="1" 
AR Path="/5D34E810/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8446" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 10550 5750 50  0001 C CNN
F 1 "+5V" H 10492 5937 50  0000 R CNN
F 2 "" H 10550 5900 50  0001 C CNN
F 3 "" H 10550 5900 50  0001 C CNN
	1    10550 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8C844C
P 10550 6300
AR Path="/5F67D4B5/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D8C844C" Ref="#PWR03"  Part="1" 
AR Path="/5D34E810/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C844C" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 10550 6050 50  0001 C CNN
F 1 "GND" H 10472 6263 50  0000 R CNN
F 2 "" H 10550 6300 50  0001 C CNN
F 3 "" H 10550 6300 50  0001 C CNN
	1    10550 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 5900 10550 6000
$Comp
L Device:CP_Small C1
U 1 1 5D8C8453
P 10550 6100
AR Path="/5D8C8453" Ref="C1"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C1" H 10462 6146 50  0000 R CNN
F 1 "47µF" H 10462 6055 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10550 6100 50  0001 C CNN
F 3 "~" H 10550 6100 50  0001 C CNN
	1    10550 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 6200 10550 6300
Text Label 10000 3650 2    50   ~ 0
AC0
Text Label 10000 3750 2    50   ~ 0
AC1
Text Label 10000 3850 2    50   ~ 0
AC2
Text Label 10000 3950 2    50   ~ 0
AC3
Text Label 10000 4050 2    50   ~ 0
AC4
Text Label 10000 4150 2    50   ~ 0
AC5
Text Label 10000 4250 2    50   ~ 0
AC6
Text Label 10000 4350 2    50   ~ 0
AC7
Text Label 10000 4450 2    50   ~ 0
AC8
Text Label 10000 4550 2    50   ~ 0
AC9
Text Label 10000 4650 2    50   ~ 0
AC10
Text Label 10000 4750 2    50   ~ 0
AC11
Text Label 10000 4850 2    50   ~ 0
AC12
Text Label 10000 4950 2    50   ~ 0
AC13
Text Label 10000 5050 2    50   ~ 0
AC14
Text Label 10000 5150 2    50   ~ 0
AC15
Wire Wire Line
	9650 3650 10000 3650
Wire Wire Line
	9650 3750 10000 3750
Wire Wire Line
	9650 3850 10000 3850
Wire Wire Line
	9650 3950 10000 3950
Wire Wire Line
	9650 4050 10000 4050
Wire Wire Line
	9650 4150 10000 4150
Wire Wire Line
	9650 4250 10000 4250
Wire Wire Line
	9650 4350 10000 4350
Wire Wire Line
	9650 4450 10000 4450
Wire Wire Line
	9650 4550 10000 4550
Wire Wire Line
	9650 4650 10000 4650
Wire Wire Line
	9650 4750 10000 4750
Wire Wire Line
	9650 4850 10000 4850
Wire Wire Line
	9650 4950 10000 4950
Wire Wire Line
	9650 5050 10000 5050
Wire Wire Line
	9650 5150 10000 5150
Wire Wire Line
	9650 2350 10000 2350
NoConn ~ 7950 1650
NoConn ~ 7950 2550
NoConn ~ 7950 2650
NoConn ~ 7950 2950
NoConn ~ 7950 3050
NoConn ~ 7950 3150
NoConn ~ 7950 3250
NoConn ~ 7950 3350
NoConn ~ 7950 3450
NoConn ~ 7950 3550
NoConn ~ 7950 3650
NoConn ~ 7950 3750
NoConn ~ 7950 3850
NoConn ~ 7950 3950
NoConn ~ 7950 4050
NoConn ~ 7950 4650
Wire Wire Line
	9650 2250 10000 2250
Wire Wire Line
	9650 2150 10200 2150
Wire Wire Line
	9650 3550 9700 3550
Wire Wire Line
	9650 1450 10000 1450
Wire Wire Line
	9650 1550 10000 1550
Wire Wire Line
	9650 1650 10000 1650
Wire Wire Line
	9650 1750 10000 1750
Wire Wire Line
	9650 1850 10000 1850
Wire Wire Line
	9650 1950 10000 1950
Wire Wire Line
	9650 2050 10000 2050
Text Label 10000 1450 2    50   ~ 0
IR0
Text Label 10000 1550 2    50   ~ 0
IR1
Text Label 10000 1650 2    50   ~ 0
IR2
Text Label 10000 1750 2    50   ~ 0
IR3
Text Label 10000 1850 2    50   ~ 0
IR4
Text Label 10000 1950 2    50   ~ 0
IR5
Text Label 10000 2050 2    50   ~ 0
IR6
Entry Wire Line
	10000 2050 10100 1950
Entry Wire Line
	10000 1950 10100 1850
Entry Wire Line
	10000 1850 10100 1750
Entry Wire Line
	10000 1750 10100 1650
Entry Wire Line
	10000 1650 10100 1550
Entry Wire Line
	10000 1550 10100 1450
Entry Wire Line
	10000 1450 10100 1350
Entry Bus Bus
	10100 1300 10200 1200
Wire Bus Line
	10200 1200 10500 1200
Text Label 10500 1200 2    50   ~ 0
IR[0..6]
Text Label 10000 2350 2    50   ~ 0
~FLAGWE
Text Label 10200 2150 2    50   ~ 0
FL-OFFBOARD
Text Label 10000 2250 2    50   ~ 0
FV
Text Notes 10200 2150 0    50   ~ 0
→ Control Unit
Text Notes 10200 2250 0    50   ~ 0
→ Control Unit
Text Notes 10200 2050 0    50   ~ 0
← Control Unit
Text Notes 10200 1950 0    50   ~ 0
← Control Unit
Text Notes 10200 1850 0    50   ~ 0
← Control Unit
Text Notes 10200 1750 0    50   ~ 0
← Control Unit
Text Notes 10200 1650 0    50   ~ 0
← Control Unit
Text Notes 10200 1550 0    50   ~ 0
← Control Unit
Text Notes 10200 1450 0    50   ~ 0
← Control Unit
Wire Bus Line
	6600 1700 7100 1700
Text Label 7100 1700 2    50   ~ 0
IBUS[0..15]
Wire Wire Line
	6600 2050 7100 2050
Wire Wire Line
	6600 2150 7100 2150
Wire Wire Line
	6600 2250 7100 2250
Wire Wire Line
	6600 2350 7100 2350
Wire Wire Line
	6600 2450 7100 2450
Wire Wire Line
	6600 2550 7100 2550
Text Label 7100 2050 2    50   ~ 0
X0
Text Label 7100 2150 2    50   ~ 0
X1
Text Label 7100 2550 2    50   ~ 0
~SETL-ROM
$Sheet
S 5450 3200 1150 2100
U 5DF75CDE
F0 "sheet5DF75CCD" 50
F1 "Serial_Shifter.sch" 50
F2 "CLK2" I L 5450 3550 50 
F3 "CLK4" I L 5450 3750 50 
F4 "DIST[0..3]" I L 5450 4150 50 
F5 "~SHIFT~∕ROTATE" I L 5450 4600 50 
F6 "~LOGIC~∕ARITH" I L 5450 4450 50 
F7 "~LEFT~∕RIGHT" I L 5450 4300 50 
F8 "B[0..15]" I L 5450 4900 50 
F9 "~RESET" I L 5450 3350 50 
F10 "IBUS[0..15]" B R 6600 4800 50 
F11 "FLOUT-SRU" O R 6600 5000 50 
F12 "FLFAST" I L 5450 5000 50 
F13 "BCP" O R 6600 4900 50 
F14 "~START" I L 5450 4750 50 
F15 "~RSTHOLD" I L 5450 3450 50 
F16 "CLK3" I L 5450 3650 50 
$EndSheet
Text Label 4950 4900 0    50   ~ 0
B[0..15]
Wire Wire Line
	5450 4600 4950 4600
Wire Wire Line
	5450 4450 4950 4450
Wire Wire Line
	5450 4300 4950 4300
Wire Bus Line
	5450 4150 4950 4150
Text Label 4950 4150 0    50   ~ 0
IR[0..3]
Text Label 4950 4300 0    50   ~ 0
IR4
Text Label 4950 4450 0    50   ~ 0
IR5
Text Label 4950 4600 0    50   ~ 0
IR6
Wire Wire Line
	4950 3350 5450 3350
Wire Wire Line
	5450 3750 4950 3750
Wire Wire Line
	5450 3550 4950 3550
Text Label 4950 3750 0    50   ~ 0
CLK4
Wire Wire Line
	6600 4900 7100 4900
Text Label 7100 4900 2    50   ~ 0
BCP
Text Label 4950 3350 0    50   ~ 0
~RESET
Text Label 4950 3550 0    50   ~ 0
CLK2
Text Label 4950 5000 0    50   ~ 0
FLFAST
Wire Wire Line
	6600 5000 7100 5000
Wire Bus Line
	6600 4800 7100 4800
Text Label 7100 4800 2    50   ~ 0
IBUS[0..15]
Text Label 7100 5000 2    50   ~ 0
FLOUT-SRU
Text Notes 6550 5250 2    79   ~ 16
SRU
Text Label 1850 2650 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	2400 2650 1850 2650
Wire Wire Line
	1850 2550 2400 2550
Text Label 1850 2550 0    50   ~ 0
T34
Text Label 1850 2750 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	2400 2750 1850 2750
Text Label 1850 2850 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	2400 2850 1850 2850
Wire Wire Line
	3550 2850 4100 2850
Text Label 4100 2750 2    50   ~ 0
~READ-ALU-B
Text Label 4100 2850 2    50   ~ 0
~WRITE-ALU-B
Text Label 4950 6500 0    50   ~ 0
~FLAGWE
Text Label 4950 6000 0    50   ~ 0
CLK4
Text Label 4950 5850 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	4950 6500 5450 6500
Text Label 7150 5850 2    50   ~ 0
FV
Wire Wire Line
	6600 5850 7150 5850
Text Label 4600 5850 2    50   ~ 0
FL
Text Label 1750 6750 0    50   ~ 0
~FLAGWE
Text Label 4950 6600 0    50   ~ 0
IBUS13
Wire Wire Line
	5450 6600 4950 6600
Text Label 1750 6850 0    50   ~ 0
IBUS12
Wire Wire Line
	2450 6850 1750 6850
Text Label 1750 6000 0    50   ~ 0
CLK4
Wire Wire Line
	5450 6000 4950 6000
Wire Wire Line
	5450 5850 4950 5850
Text Label 1750 5850 0    50   ~ 0
~RSTHOLD
$Sheet
S 5450 5700 1150 1100
U 5D35C694
F0 "Overflow Register (V)" 50
F1 "cft_reg_v_2019.sch" 50
F2 "FV" O R 6600 5850 50 
F3 "~SETV-ROM" I L 5450 6200 50 
F4 "CLK4" I L 5450 6000 50 
F5 "~RSTHOLD" I L 5450 5850 50 
F6 "IBUS13" I L 5450 6600 50 
F7 "FVOUT-ROM" I L 5450 6300 50 
F8 "~FLAGWE" I L 5450 6500 50 
$EndSheet
Text Notes 800  5850 0    100  ~ 20
Flags
Text Notes 3500 4450 2    79   ~ 16
A
Text Notes 3500 5250 2    79   ~ 16
B
Wire Bus Line
	1850 4350 2400 4350
Text Label 1850 4350 0    50   ~ 0
AC[0..15]
Text Label 1850 4900 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	1750 5100 2400 5100
Text Label 1750 5200 0    50   ~ 0
~READ-ALU-B
Text Label 1750 5100 0    50   ~ 0
BCP
Wire Wire Line
	2400 5200 1750 5200
Text Label 3650 4900 0    50   ~ 0
B[0..15]
Wire Bus Line
	4400 4900 3550 4900
$Sheet
S 2400 4750 1150 550 
U 5DEA5E6C
F0 "Port B" 50
F1 "alu_port_b.sch" 50
F2 "IBUS[0..15]" B L 2400 4900 50 
F3 "B[0..15]" T R 3550 4900 50 
F4 "~READ-ALU-B" I L 2400 5200 50 
F5 "~WRITE-ALU-B" I L 2400 5000 50 
F6 "BCP" I L 2400 5100 50 
$EndSheet
Text Label 3650 4200 0    50   ~ 0
A[0..15]
$Sheet
S 2400 4050 1150 450 
U 5DE6D8E0
F0 "Port A" 50
F1 "alu_port_a.sch" 50
F2 "A[0..15]" T R 3550 4200 50 
F3 "ACP" I L 2400 4200 50 
F4 "AC[0..15]" I L 2400 4350 50 
$EndSheet
Text Notes 1250 4550 2    100  ~ 20
Ports
Wire Wire Line
	1750 5850 2450 5850
Wire Wire Line
	1750 6000 2450 6000
Wire Wire Line
	1750 6750 2450 6750
$Sheet
S 2450 5700 1150 1650
U 5D121AA3
F0 "Link Register (L)" 50
F1 "cft_reg_l_2019.sch" 50
F2 "FL" O R 3600 5850 50 
F3 "CLK4" I L 2450 6000 50 
F4 "~FLAGWE" I L 2450 6750 50 
F5 "FLOUT-ROM" I L 2450 6350 50 
F6 "IBUS12" I L 2450 6850 50 
F7 "~RSTHOLD" I L 2450 5850 50 
F8 "~ACTION-CLL" I L 2450 7150 50 
F9 "~ACTION-CPL" I L 2450 7050 50 
F10 "BCP" I L 2450 6500 50 
F11 "FLOUT-SRU" I L 2450 6600 50 
F12 "FLFAST" O R 3600 5950 50 
F13 "~SETL-ROM" I L 2450 6250 50 
$EndSheet
Text Label 4600 5950 2    50   ~ 0
FLFAST
Wire Wire Line
	2450 6500 1750 6500
Text Label 1750 6500 0    50   ~ 0
BCP
Wire Wire Line
	2450 6600 1750 6600
Text Label 1750 6600 0    50   ~ 0
FLOUT-SRU
Wire Wire Line
	2450 7150 1750 7150
Text Label 1750 7050 0    50   ~ 0
~ACTION-CPL
Text Label 1750 7150 0    50   ~ 0
~ACTION-CLL
Entry Bus Bus
	4500 2350 4600 2250
Entry Bus Bus
	4500 4800 4600 4900
Wire Bus Line
	4600 4900 5450 4900
Entry Bus Bus
	4400 4900 4500 4800
Entry Bus Bus
	4600 2150 4500 2250
Wire Bus Line
	4400 2350 4500 2250
Entry Bus Bus
	7100 1700 7200 1800
Entry Bus Bus
	7200 4700 7100 4800
Entry Bus Bus
	1650 4800 1750 4900
Wire Bus Line
	1650 4800 1650 3850
Entry Bus Bus
	1750 3750 1650 3850
Wire Bus Line
	1750 3750 4200 3750
Entry Bus Bus
	4300 3650 4200 3750
Entry Bus Bus
	7100 1350 7200 1450
Entry Bus Bus
	4600 1350 4500 1450
Wire Bus Line
	7100 1350 4600 1350
Wire Bus Line
	4300 3650 4300 1650
Wire Bus Line
	4300 1650 4500 1450
Text Notes 10250 4500 1    50   ~ 0
Input From REG Board
Entry Wire Line
	10100 3550 10000 3650
Entry Wire Line
	10100 3650 10000 3750
Entry Wire Line
	10100 3750 10000 3850
Entry Wire Line
	10100 3850 10000 3950
Entry Wire Line
	10100 3950 10000 4050
Entry Wire Line
	10100 4050 10000 4150
Entry Wire Line
	10100 4150 10000 4250
Entry Wire Line
	10100 4250 10000 4350
Entry Wire Line
	10100 4350 10000 4450
Entry Wire Line
	10100 4450 10000 4550
Entry Wire Line
	10100 4550 10000 4650
Entry Wire Line
	10100 4650 10000 4750
Entry Wire Line
	10100 4750 10000 4850
Entry Wire Line
	10100 4850 10000 4950
Entry Wire Line
	10100 4950 10000 5050
Entry Wire Line
	10100 5050 10000 5150
Text Label 10250 3350 0    50   ~ 0
AC[0..15]
Wire Bus Line
	10200 3350 10600 3350
Entry Bus Bus
	10100 3450 10200 3350
Wire Wire Line
	4850 5000 5450 5000
Text Label 4100 2550 2    50   ~ 0
~ALU-OP
Text Label 4100 3050 2    50   ~ 0
~ACTION-CLL
Text Label 4100 2950 2    50   ~ 0
~ACTION-CPL
Wire Wire Line
	3550 3050 4100 3050
Text Label 4100 3250 2    50   ~ 0
~ACTION-SRU
$Sheet
S 2400 2400 1150 1000
U 5E1C970B
F0 "Decoders" 50
F1 "alu_decoder.sch" 50
F2 "RADDR[0..4]" I L 2400 2650 50 
F3 "WADDR[0..4]" I L 2400 2750 50 
F4 "T34" I L 2400 2550 50 
F5 "ACTION[0..4]" I L 2400 2850 50 
F6 "~WRITE-ALU-B" O R 3550 2850 50 
F7 "~ACTION-SRU" O R 3550 3250 50 
F8 "~ACTION-CPL" O R 3550 2950 50 
F9 "~ACTION-CLL" O R 3550 3050 50 
F10 "~READ-ALU-B" O R 3550 2750 50 
F11 "~ACTION-110" O R 3550 3150 50 
F12 "~READ-ALU-Y" O R 3550 2650 50 
F13 "~ALU-OP" O R 3550 2550 50 
F14 "ACP" O L 2400 3250 50 
$EndSheet
Text Label 4400 3100 1    50   ~ 0
A[0..15]
Text Label 4300 3100 1    50   ~ 0
IBUS[0..15]
Wire Bus Line
	3550 4200 4300 4200
Entry Bus Bus
	4400 4100 4300 4200
Wire Bus Line
	4400 2350 4400 4100
Text Label 4500 4550 1    50   ~ 0
B[0..15]
Wire Wire Line
	4850 5000 4850 5950
Wire Wire Line
	3600 5950 4850 5950
Wire Wire Line
	3600 5850 3700 5850
Wire Bus Line
	4600 2150 5450 2150
Wire Bus Line
	4600 2250 5450 2250
Text Label 4750 5600 1    50   ~ 0
FL
Text Label 4850 5600 1    50   ~ 0
FLFAST
Wire Wire Line
	2450 6250 1750 6250
Wire Wire Line
	2450 6350 1750 6350
Text Label 1750 6350 0    50   ~ 0
FLOUT-ROM
Wire Wire Line
	5450 6200 4950 6200
Wire Wire Line
	5450 6300 4950 6300
Text Label 4950 6200 0    50   ~ 0
~SETV-ROM
Text Label 4950 6300 0    50   ~ 0
FVOUT-ROM
Text Label 7100 2450 2    50   ~ 0
FLOUT-ROM
Text Label 7100 2350 2    50   ~ 0
~SETV-ROM
Text Label 7100 2250 2    50   ~ 0
FVOUT-ROM
Wire Wire Line
	4950 4750 5450 4750
Text Label 4950 4750 0    50   ~ 0
~ACTION-SRU
Text Label 4500 3100 1    50   ~ 0
B[0..15]
Text Label 4750 3100 1    50   ~ 0
FL
Wire Wire Line
	3550 2950 4100 2950
Wire Wire Line
	2450 7050 1750 7050
Text Notes 10200 2350 0    50   ~ 0
← Control Unit
Wire Wire Line
	9650 5250 10000 5250
Wire Wire Line
	9650 5350 10000 5350
NoConn ~ 10000 5250
NoConn ~ 10000 5350
Wire Wire Line
	9650 2450 10000 2450
Wire Wire Line
	9650 2550 10000 2550
Wire Wire Line
	9650 2650 10000 2650
Wire Wire Line
	9650 2750 10000 2750
Wire Wire Line
	9650 2850 10000 2850
Wire Wire Line
	9650 2950 10000 2950
Wire Wire Line
	9650 3250 9700 3250
Wire Wire Line
	9650 3350 10000 3350
Wire Wire Line
	9650 3050 10000 3050
Wire Wire Line
	9650 3150 10000 3150
NoConn ~ 10000 3350
Text Notes 10800 2450 3    50   ~ 0
For ROM Expansion
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 5DC7BFB4
P 4550 2050
AR Path="/5DE3C078/5DC7BFB4" Ref="JP?"  Part="1" 
AR Path="/5DC7BFB4" Ref="JP1"  Part="1" 
F 0 "JP1" H 4550 2163 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4550 2164 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4550 2050 50  0001 C CNN
F 3 "~" H 4550 2050 50  0001 C CNN
	1    4550 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5DC97446
P 4400 2100
F 0 "#PWR0113" H 4400 1850 50  0001 C CNN
F 1 "GND" H 4400 2200 50  0000 C CNN
F 2 "" H 4400 2100 50  0001 C CNN
F 3 "" H 4400 2100 50  0001 C CNN
	1    4400 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2050 4400 2100
Text Label 8500 6100 0    50   ~ 0
~ACTION-110
$Comp
L Connector:TestPoint TP?
U 1 1 5DCFA7A8
P 9250 6100
AR Path="/5DF75CDE/5DCFA7A8" Ref="TP?"  Part="1" 
AR Path="/5DCFA7A8" Ref="TP14"  Part="1" 
F 0 "TP14" V 9250 6288 50  0000 L CNN
F 1 "TestPoint" H 9308 6127 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 9450 6100 50  0001 C CNN
F 3 "~" H 9450 6100 50  0001 C CNN
	1    9250 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 6100 8500 6100
Text Notes 8500 5950 0    50   ~ 0
Actions for future expansion
Wire Wire Line
	4700 2050 5450 2050
$Comp
L Connector:TestPoint TP3
U 1 1 5DD216FF
P 9700 3450
F 0 "TP3" V 9700 3638 50  0000 L CNN
F 1 "TestPoint" V 9745 3638 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 9900 3450 50  0001 C CNN
F 3 "~" H 9900 3450 50  0001 C CNN
	1    9700 3450
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5DCAA8B1
P 10000 3050
F 0 "TP1" V 10000 3238 50  0000 L CNN
F 1 "TestPoint" V 10045 3238 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 10200 3050 50  0001 C CNN
F 3 "~" H 10200 3050 50  0001 C CNN
	1    10000 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 3450 9700 3450
$Comp
L Connector:TestPoint TP2
U 1 1 5DCF8FE6
P 9700 3250
F 0 "TP2" V 9700 3438 50  0000 L CNN
F 1 "TestPoint" V 9745 3438 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 9900 3250 50  0001 C CNN
F 3 "~" H 9900 3250 50  0001 C CNN
	1    9700 3250
	0    1    1    0   
$EndComp
NoConn ~ 10000 2450
NoConn ~ 10000 2550
NoConn ~ 10000 2650
NoConn ~ 10000 2750
NoConn ~ 10000 2850
NoConn ~ 10000 2950
NoConn ~ 10000 3150
$Comp
L Connector:TestPoint TP4
U 1 1 5DE16EEE
P 9700 3550
F 0 "TP4" V 9700 3738 50  0000 L CNN
F 1 "TestPoint" V 9745 3738 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 9900 3550 50  0001 C CNN
F 3 "~" H 9900 3550 50  0001 C CNN
	1    9700 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5DCC470D
P 3850 5700
F 0 "R2" V 3654 5700 50  0000 C CNN
F 1 "30Ω" V 3745 5700 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3850 5700 50  0001 C CNN
F 3 "~" H 3850 5700 50  0001 C CNN
	1    3850 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 5700 3700 5700
Wire Wire Line
	3700 5700 3700 5850
Connection ~ 3700 5850
Wire Wire Line
	3700 5850 4750 5850
Wire Wire Line
	3950 5700 4600 5700
Text Label 4600 5700 2    50   ~ 0
FL-OFFBOARD
Wire Wire Line
	5450 3450 4950 3450
Text Label 4950 3450 0    50   ~ 0
~RSTHOLD
Text Label 7950 2350 0    50   ~ 0
T34
Wire Bus Line
	1750 4900 2400 4900
Text Label 1750 6250 0    50   ~ 0
~SETL-ROM
Wire Wire Line
	2400 5000 1750 5000
Text Label 1750 5000 0    50   ~ 0
~WRITE-ALU-B
Wire Wire Line
	3550 3150 4100 3150
Text Label 4100 3150 2    50   ~ 0
~ACTION-110
Wire Wire Line
	3550 2750 4100 2750
Text Label 4100 2650 2    50   ~ 0
~READ-ALU-Y
Text Label 4950 2250 0    50   ~ 0
B[0..15]
Text Label 4950 2150 0    50   ~ 0
A[0..15]
Text Label 4950 2050 0    50   ~ 0
X-IN
Text Label 4950 2400 0    50   ~ 0
FL
Wire Wire Line
	2400 3250 2250 3250
Wire Wire Line
	2250 3250 2250 4200
Wire Wire Line
	2250 4200 2400 4200
$Sheet
S 5450 1550 1150 1300
U 5DE3C078
F0 "sheet5DE3C026" 50
F1 "cft_alu_rom.sch" 50
F2 "A[0..15]" I L 5450 2150 50 
F3 "B[0..15]" I L 5450 2250 50 
F4 "FL" I L 5450 2400 50 
F5 "RADDR0" I L 5450 2500 50 
F6 "RADDR1" I L 5450 2600 50 
F7 "RADDR2" I L 5450 2700 50 
F8 "~ALU-OP" I L 5450 1700 50 
F9 "X-IN" I L 5450 2050 50 
F10 "IBUS[0..15]" T R 6600 1700 50 
F11 "X1" O R 6600 2150 50 
F12 "X0" O R 6600 2050 50 
F13 "FVOUT-ROM" O R 6600 2250 50 
F14 "~SETV-ROM" O R 6600 2350 50 
F15 "FLOUT-ROM" O R 6600 2450 50 
F16 "~SETL-ROM" O R 6600 2550 50 
F17 "~READ-ALU-Y" I L 5450 1800 50 
F18 "T34" I L 5450 1900 50 
$EndSheet
Wire Wire Line
	5450 1900 4950 1900
Text Label 4950 1900 0    50   ~ 0
T34
Connection ~ 4750 5850
Wire Wire Line
	4750 5850 4750 5900
Text Label 4950 2500 0    50   ~ 0
RADDR0
Text Label 4950 2600 0    50   ~ 0
RADDR1
Text Label 4950 2700 0    50   ~ 0
RADDR2
Wire Wire Line
	4950 2600 5450 2600
Wire Wire Line
	4950 2500 5450 2500
Wire Wire Line
	5450 2700 4950 2700
Wire Wire Line
	5450 2400 4750 2400
Wire Wire Line
	4750 2400 4750 5850
Text Notes 8300 950  0    197  ~ 39
Edge Connector
Text Notes 7450 3350 1    100  ~ 20
Operations
Text Notes 800  2800 0    100  ~ 20
Control
Wire Wire Line
	4950 3650 5450 3650
Text Label 4950 3650 0    50   ~ 0
CLK3
Wire Bus Line
	4500 2350 4500 4800
Text Label 3650 3750 0    50   ~ 0
IBUS[0..15]
Text Label 4950 1700 0    50   ~ 0
~ALU-OP
Text Label 4950 1800 0    50   ~ 0
~READ-ALU-Y
Wire Wire Line
	3550 2550 4100 2550
Wire Wire Line
	3550 2650 4100 2650
Wire Wire Line
	4950 1700 5450 1700
Wire Wire Line
	4950 1800 5450 1800
Wire Wire Line
	3550 3250 4100 3250
Text Notes 650  950  0    197  ~ 39
The ALU
Text Notes 700  2050 0    50   ~ 0
The CFT's ALU is probably among the most complex units of the processor. The 2019\nedition uses three ROMs containing all binary and unary operations except shifts and\nrolls. (the original ALU used 6 larger ROMs). The ROMs can perform two's complement\naddition (with carry and overflow), and bitwise AND, OR, XOR and NOT. Three of the\neight possible operations are still undefined.\n\nA separate unit can perform rolls, bitwise shifts and sign-extending (arithmethic) right\nshifts. This is a serial unit, not a barrel shifter, so the longer the bit distance the\nlonger it takes to calculate it. It's still better tha having to wait several clock cycles for\na single bit though.\n\nAlso present here are the L register and V flag.
Text Notes 3550 7300 2    79   ~ 16
L
Text Notes 6550 6750 2    79   ~ 16
V
Text Notes 6550 2800 2    79   ~ 16
ROM
Wire Notes Line
	8400 5800 9700 5800
Wire Notes Line
	9700 5800 9700 6250
Wire Notes Line
	9700 6250 8400 6250
Wire Notes Line
	8400 6250 8400 5800
Wire Bus Line
	7200 1450 7200 4700
Wire Bus Line
	10100 1300 10100 1950
Wire Bus Line
	10100 3450 10100 5050
$EndSCHEMATC
