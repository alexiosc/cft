EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 17
Title "Control Unit Board"
Date ""
Rev "2023"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 5D8B16F5
P 7850 -1200
AR Path="/5F67D4B5/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16F5" Ref="#PWR0118"  Part="1" 
AR Path="/5D34E810/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H 7850 -1350 50  0001 C CNN
F 1 "+5V" H 7792 -1163 50  0000 R CNN
F 2 "" H 7850 -1200 50  0001 C CNN
F 3 "" H 7850 -1200 50  0001 C CNN
	1    7850 -1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8B16FB
P 7850 -800
AR Path="/5F67D4B5/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16FB" Ref="#PWR0128"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0128" H 7850 -1050 50  0001 C CNN
F 1 "GND" H 7772 -837 50  0000 R CNN
F 2 "" H 7850 -800 50  0001 C CNN
F 3 "" H 7850 -800 50  0001 C CNN
	1    7850 -800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 -1200 7850 -1100
$Comp
L Device:CP_Small C108
U 1 1 5D8B1702
P 7850 -1000
AR Path="/5D8B1702" Ref="C108"  Part="1" 
AR Path="/5D34E810/5D8B1702" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8B1702" Ref="C?"  Part="1" 
F 0 "C108" H 7762 -954 50  0000 R CNN
F 1 "47µF" H 7762 -1045 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7850 -1000 50  0001 C CNN
F 3 "~" H 7850 -1000 50  0001 C CNN
	1    7850 -1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 -900 7850 -800
$Comp
L power:+5V #PWR?
U 1 1 5D8C8446
P 7400 -1200
AR Path="/5F67D4B5/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D8C8446" Ref="#PWR0117"  Part="1" 
AR Path="/5D34E810/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8446" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H 7400 -1350 50  0001 C CNN
F 1 "+5V" H 7342 -1163 50  0000 R CNN
F 2 "" H 7400 -1200 50  0001 C CNN
F 3 "" H 7400 -1200 50  0001 C CNN
	1    7400 -1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8C844C
P 7400 -800
AR Path="/5F67D4B5/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D8C844C" Ref="#PWR0127"  Part="1" 
AR Path="/5D34E810/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C844C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0127" H 7400 -1050 50  0001 C CNN
F 1 "GND" H 7322 -837 50  0000 R CNN
F 2 "" H 7400 -800 50  0001 C CNN
F 3 "" H 7400 -800 50  0001 C CNN
	1    7400 -800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 -1200 7400 -1100
$Comp
L Device:CP_Small C107
U 1 1 5D8C8453
P 7400 -1000
AR Path="/5D8C8453" Ref="C107"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C107" H 7312 -954 50  0000 R CNN
F 1 "47µF" H 7312 -1045 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7400 -1000 50  0001 C CNN
F 3 "~" H 7400 -1000 50  0001 C CNN
	1    7400 -1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 -900 7400 -800
$Sheet
S 7000 -6900 1150 1000
U 5D9672D4
F0 "Program Counter" 50
F1 "cft-reg-pc.sch" 50
F2 "~FPH" I R 8150 -6150 50 
F3 "~FPL" I R 8150 -6050 50 
F4 "~READ" I L 7000 -6350 50 
F5 "~INC" I L 7000 -6150 50 
F6 "~WRITE" I L 7000 -6250 50 
F7 "RESET" I L 7000 -6750 50 
F8 "IBUS[0..15]" I L 7000 -6550 50 
F9 "FPD[0..7]" T R 8150 -6250 50 
F10 "PC[10..15]" O R 8150 -6750 50 
$EndSheet
Text Notes 6900 -7300 0    197  ~ 39
Registers
Text Notes 2350 -7300 0    197  ~ 39
Decoders
Wire Wire Line
	2900 -5550 2550 -5550
Wire Wire Line
	2900 -5450 2550 -5450
Wire Wire Line
	2900 -4100 2550 -4100
Wire Wire Line
	2900 -4000 2550 -4000
Wire Wire Line
	2900 -4700 2550 -4700
Wire Wire Line
	2900 -4600 2550 -4600
Wire Wire Line
	2900 -4500 2550 -4500
Text Notes 3450 -4000 1    50   ~ 10
WADDR=010xx
Text Label 2600 -5550 0    50   ~ 0
RADDR3
Text Label 2600 -5450 0    50   ~ 0
RADDR4
Text Label 2600 -4700 0    50   ~ 0
WADDR0
Text Label 2600 -4600 0    50   ~ 0
WADDR1
Text Label 2600 -4500 0    50   ~ 0
WADDR2
Text Label 2600 -4000 0    50   ~ 0
WADDR4
Text Label 2600 -4100 0    50   ~ 0
WADDR3
Entry Wire Line
	2450 -5650 2550 -5550
Entry Wire Line
	2450 -5550 2550 -5450
Entry Wire Line
	2450 -4800 2550 -4700
Entry Wire Line
	2450 -4700 2550 -4600
Entry Wire Line
	2450 -4600 2550 -4500
Entry Wire Line
	2450 -4200 2550 -4100
Entry Wire Line
	2450 -4100 2550 -4000
Text Label 4500 -4600 2    50   ~ 0
~WRITE-DR
NoConn ~ 3900 -5750
NoConn ~ 3900 -5650
NoConn ~ 3900 -5550
NoConn ~ 3900 -5450
NoConn ~ 3900 -4300
NoConn ~ 3900 -4200
NoConn ~ 3900 -4100
NoConn ~ 3900 -4000
Text Label 2450 -4200 1    50   ~ 0
WADDR[4..0]
Text Label 6150 -6550 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	7000 -6550 6150 -6550
Text Label 6150 -5250 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	7000 -5250 6150 -5250
Text Label 6150 -5450 0    50   ~ 0
RESET
Text Label 6150 -6350 0    50   ~ 0
~READ-PC
Text Label 6150 -6250 0    50   ~ 0
~WRITE-PC
Wire Wire Line
	7000 -5050 6150 -5050
Wire Wire Line
	7000 -4950 6150 -4950
Wire Wire Line
	7000 -4850 6150 -4850
Wire Wire Line
	7000 -4750 6150 -4750
Text Label 6150 -5050 0    50   ~ 0
~READ-DR
Text Label 6150 -4950 0    50   ~ 0
~WRITE-DR
Wire Bus Line
	8150 -6250 8650 -6250
Text Label 8650 -6250 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	8150 -6150 8650 -6150
Wire Wire Line
	8150 -6050 8650 -6050
Text Label 8650 -6150 2    50   ~ 0
~FPPCH
Text Label 8650 -6050 2    50   ~ 0
~FPPCL
Wire Bus Line
	8150 -4950 8650 -4950
Text Label 8650 -4950 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	8150 -4850 8650 -4850
Wire Wire Line
	8150 -4750 8650 -4750
Text Label 8650 -4850 2    50   ~ 0
~FPDRH
Text Label 8650 -4750 2    50   ~ 0
~FPDRL
Wire Bus Line
	8150 -6750 8650 -6750
Text Label 8650 -6750 2    50   ~ 0
PC[10..15]
Wire Wire Line
	7000 -6150 6150 -6150
Wire Wire Line
	7000 -6250 6150 -6250
Wire Wire Line
	7000 -6350 6150 -6350
Text Label 6150 -6750 0    50   ~ 0
RESET
$Comp
L power:+5V #PWR?
U 1 1 5DD296FB
P 3350 -1050
AR Path="/5CE16E65/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5DD296FB" Ref="#PWR0120"  Part="1" 
AR Path="/5D54E677/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD296FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0120" H 3350 -1200 50  0001 C CNN
F 1 "+5V" H 3365 -877 50  0000 C CNN
F 2 "" H 3350 -1050 50  0001 C CNN
F 3 "" H 3350 -1050 50  0001 C CNN
	1    3350 -1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD29701
P 3350 -850
AR Path="/5CE16E65/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5DD29701" Ref="#PWR0124"  Part="1" 
AR Path="/5D54E677/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD29701" Ref="#PWR?"  Part="1" 
F 0 "#PWR0124" H 3350 -1100 50  0001 C CNN
F 1 "GND" H 3355 -1023 50  0000 C CNN
F 2 "" H 3350 -850 50  0001 C CNN
F 3 "" H 3350 -850 50  0001 C CNN
	1    3350 -850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD29707
P 3350 -950
AR Path="/5CC0D65F/5DD29707" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD29707" Ref="C?"  Part="1" 
AR Path="/5DD29707" Ref="C110"  Part="1" 
AR Path="/5D54E677/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD29707" Ref="C?"  Part="1" 
F 0 "C110" H 3259 -904 50  0000 R CNN
F 1 "100nF" H 3259 -995 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 -950 50  0001 C CNN
F 3 "~" H 3350 -950 50  0001 C CNN
	1    3350 -950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD3D3CC
P 1950 -1050
AR Path="/5CE16E65/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D3CC" Ref="#PWR0119"  Part="1" 
AR Path="/5D54E677/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD3D3CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR0119" H 1950 -1200 50  0001 C CNN
F 1 "+5V" H 1965 -877 50  0000 C CNN
F 2 "" H 1950 -1050 50  0001 C CNN
F 3 "" H 1950 -1050 50  0001 C CNN
	1    1950 -1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD3D3D2
P 1950 -850
AR Path="/5CE16E65/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D3D2" Ref="#PWR0123"  Part="1" 
AR Path="/5D54E677/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD3D3D2" Ref="#PWR?"  Part="1" 
F 0 "#PWR0123" H 1950 -1100 50  0001 C CNN
F 1 "GND" H 1955 -1023 50  0000 C CNN
F 2 "" H 1950 -850 50  0001 C CNN
F 3 "" H 1950 -850 50  0001 C CNN
	1    1950 -850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD3D3D8
P 1950 -950
AR Path="/5CC0D65F/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5DD3D3D8" Ref="C109"  Part="1" 
AR Path="/5D54E677/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD3D3D8" Ref="C?"  Part="1" 
F 0 "C109" H 1859 -904 50  0000 R CNN
F 1 "100nF" H 1859 -995 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1950 -950 50  0001 C CNN
F 3 "~" H 1950 -950 50  0001 C CNN
	1    1950 -950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD47236
P 4750 -1050
AR Path="/5CE16E65/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5DD47236" Ref="#PWR0121"  Part="1" 
AR Path="/5D54E677/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD47236" Ref="#PWR?"  Part="1" 
F 0 "#PWR0121" H 4750 -1200 50  0001 C CNN
F 1 "+5V" H 4765 -877 50  0000 C CNN
F 2 "" H 4750 -1050 50  0001 C CNN
F 3 "" H 4750 -1050 50  0001 C CNN
	1    4750 -1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD4723C
P 4750 -850
AR Path="/5CE16E65/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5DD4723C" Ref="#PWR0125"  Part="1" 
AR Path="/5D54E677/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD4723C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0125" H 4750 -1100 50  0001 C CNN
F 1 "GND" H 4755 -1023 50  0000 C CNN
F 2 "" H 4750 -850 50  0001 C CNN
F 3 "" H 4750 -850 50  0001 C CNN
	1    4750 -850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD47242
P 4750 -950
AR Path="/5CC0D65F/5DD47242" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD47242" Ref="C?"  Part="1" 
AR Path="/5DD47242" Ref="C111"  Part="1" 
AR Path="/5D54E677/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD47242" Ref="C?"  Part="1" 
F 0 "C111" H 4659 -904 50  0000 R CNN
F 1 "100nF" H 4659 -995 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 -950 50  0001 C CNN
F 3 "~" H 4750 -950 50  0001 C CNN
	1    4750 -950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U101
U 2 1 5DD5B011
P 2300 -950
F 0 "U101" H 2480 -904 50  0000 L CNN
F 1 "74LVC1G04" H 2480 -995 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2300 -950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 2300 -950 50  0001 C CNN
	2    2300 -950
	1    0    0    -1  
$EndComp
Connection ~ 1950 -850
Connection ~ 1950 -1050
$Sheet
S 7000 -5600 1150 1000
U 5D967A8B
F0 "Data Register" 50
F1 "cft-reg-dr-sp.sch" 50
F2 "~FPH" I R 8150 -4850 50 
F3 "~FPL" I R 8150 -4750 50 
F4 "~READ" I L 7000 -5050 50 
F5 "~INC" I L 7000 -4850 50 
F6 "~WRITE" I L 7000 -4950 50 
F7 "RESET" I L 7000 -5450 50 
F8 "IBUS[0..15]" I L 7000 -5250 50 
F9 "~DEC" I L 7000 -4750 50 
F10 "FPD[0..7]" T R 8150 -4950 50 
$EndSheet
Wire Wire Line
	3900 -4700 4500 -4700
Wire Wire Line
	3900 -4600 4500 -4600
Text Label 4500 -4700 2    50   ~ 0
~WRITE-PC
Text Label 2450 -6800 0    50   ~ 0
~RESET
Wire Wire Line
	3000 -6800 2450 -6800
$Comp
L alexios:74LVC1G04 U101
U 1 1 5DAE39EC
P 3300 -6800
F 0 "U101" H 3250 -6533 50  0000 C CNN
F 1 "74LVC1G04" H 3250 -6624 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3300 -6800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 3300 -6800 50  0001 C CNN
	1    3300 -6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 -6750 7000 -6750
Wire Wire Line
	6150 -5450 7000 -5450
Text Label 4000 -6800 2    50   ~ 0
RESET
Wire Wire Line
	3500 -6800 4000 -6800
Text Label 6150 -4750 0    50   ~ 0
~DECDR
Text Label 6150 -4850 0    50   ~ 0
~INCDR
Text Label 6150 -6150 0    50   ~ 0
~INCPC
Text Notes 4200 -5050 0    50   ~ 0
[RW]ADDR\n\n01000\n01001\n01010\n01011
Text Notes 4750 -5050 0    50   ~ 0
Reg\n\nPC\nDR\nAC\nSP
Wire Notes Line width 12 style solid
	4150 -5575 4950 -5575
Wire Notes Line width 12 style solid
	4150 -5000 4150 -5575
Wire Notes Line width 12 style solid
	4950 -5000 4150 -5000
Wire Notes Line width 12 style solid
	4950 -5575 4950 -5000
Wire Notes Line style solid
	4150 -5400 4950 -5400
Wire Notes Line
	4700 -5575 4700 -5000
Text Label 2900 -3900 2    50   ~ 0
CLK4'
Text Notes 3150 -1450 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
Wire Wire Line
	2650 -5350 2550 -5350
Wire Wire Line
	2550 -5350 2550 -5300
$Comp
L power:GND #PWR0101
U 1 1 5D9C912E
P 2550 -5300
F 0 "#PWR0101" H 2550 -5550 50  0001 C CNN
F 1 "GND" H 2555 -5473 50  0000 C CNN
F 2 "" H 2550 -5300 50  0001 C CNN
F 3 "" H 2550 -5300 50  0001 C CNN
	1    2550 -5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 -5350 2900 -5350
$Comp
L Device:Jumper_NC_Small JP101
U 1 1 60284772
P 2750 -5350
F 0 "JP101" H 2750 -5443 50  0000 C CNN
F 1 "Jumper_NC_Small" H 2750 -5229 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 2750 -5350 50  0001 C CNN
F 3 "~" H 2750 -5350 50  0001 C CNN
	1    2750 -5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 -4100 1900 -4100
$Comp
L power:GND #PWR0103
U 1 1 5EEF256F
P 2300 -3700
F 0 "#PWR0103" H 2300 -3950 50  0001 C CNN
F 1 "GND" H 2305 -3873 50  0000 C CNN
F 2 "" H 2300 -3700 50  0001 C CNN
F 3 "" H 2300 -3700 50  0001 C CNN
	1    2300 -3700
	1    0    0    -1  
$EndComp
Text Label 1900 -4100 0    50   ~ 0
CLK4
Text Notes 2500 -3500 0    50   ~ 0
1-2: Normal Operation\n2-3: Standalone REG Board Testing
$Comp
L Jumper:SolderJumper_3_Open JP102
U 1 1 5EF00BEB
P 2300 -3900
F 0 "JP102" V 2300 -3832 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 2345 -3833 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2300 -3900 50  0001 C CNN
F 3 "~" H 2300 -3900 50  0001 C CNN
	1    2300 -3900
	0    -1   1    0   
$EndComp
Wire Wire Line
	2450 -3900 2900 -3900
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 19750 -2050
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H 19750 -2200 50  0001 C CNN
F 1 "+5V" H 19692 -2013 50  0000 R CNN
F 2 "" H 19750 -2050 50  0001 C CNN
F 3 "" H 19750 -2050 50  0001 C CNN
	1    19750 -2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 19750 -1650
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR0115"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 19750 -1900 50  0001 C CNN
F 1 "GND" H 19672 -1687 50  0000 R CNN
F 2 "" H 19750 -1650 50  0001 C CNN
F 3 "" H 19750 -1650 50  0001 C CNN
	1    19750 -1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	19750 -2050 19750 -1950
Wire Wire Line
	19750 -1750 19750 -1650
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 19300 -2050
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR0108"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 19300 -2200 50  0001 C CNN
F 1 "+5V" H 19242 -2013 50  0000 R CNN
F 2 "" H 19300 -2050 50  0001 C CNN
F 3 "" H 19300 -2050 50  0001 C CNN
	1    19300 -2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF9C
P 19300 -1650
AR Path="/5F67D4B5/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF9C" Ref="#PWR0114"  Part="1" 
AR Path="/5D34E810/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF9C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 19300 -1900 50  0001 C CNN
F 1 "GND" H 19222 -1687 50  0000 R CNN
F 2 "" H 19300 -1650 50  0001 C CNN
F 3 "" H 19300 -1650 50  0001 C CNN
	1    19300 -1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	19300 -2050 19300 -1950
Wire Wire Line
	19300 -1750 19300 -1650
Wire Bus Line
	14200 -6550 13350 -6550
Text Label 13350 -6550 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	15350 -5500 16200 -5500
Text Label 16200 -5500 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	12150 -6700 13000 -6700
Text Label 13000 -6700 2    50   ~ 0
AEXT[0..7]
Wire Bus Line
	11000 -6050 10150 -6050
Text Label 10150 -6050 0    50   ~ 0
IBUS[0..15]
Text Label 16150 -3750 2    50   ~ 0
~W
Wire Wire Line
	14200 -6300 13350 -6300
Text Label 13350 -6300 0    50   ~ 0
~MEM
Wire Wire Line
	14200 -6200 13350 -6200
Text Label 13350 -6200 0    50   ~ 0
~IO
Wire Wire Line
	15350 -5600 16200 -5600
Text Label 16200 -5600 2    50   ~ 0
~FPAEXT
Wire Wire Line
	11000 -5450 10150 -5450
Text Label 10150 -5450 0    50   ~ 0
~FPRAM~∕ROM
Text Label 12250 -5450 0    50   ~ 0
~WAR
Text Label 10150 -6150 0    50   ~ 0
WADDR[0..4]
Text Label 10150 -6250 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	11000 -6250 10150 -6250
Wire Bus Line
	11000 -6150 10150 -6150
Wire Wire Line
	15350 -6200 16200 -6200
Wire Wire Line
	15350 -6100 16200 -6100
Wire Wire Line
	15350 -6000 16200 -6000
Wire Wire Line
	15350 -5900 16200 -5900
Text Label 16200 -6200 2    50   ~ 0
~SYSDEV
Text Label 16200 -6100 2    50   ~ 0
~IODEV1XX
Text Label 16200 -6000 2    50   ~ 0
~IODEV2XX
Text Label 16200 -5900 2    50   ~ 0
~IODEV3XX
$Sheet
S 14200 -6850 1150 1500
U 5CC06F10
F0 "Address Register (AR)" 50
F1 "cft_ar.sch" 50
F2 "~MEM" T L 14200 -6300 50 
F3 "~IO" T L 14200 -6200 50 
F4 "IBUS[0..15]" T L 14200 -6550 50 
F5 "~WRITE-AR" I L 14200 -5450 50 
F6 "AB[0..23]" O R 15350 -6500 50 
F7 "AEXT[0..7]" I L 14200 -6700 50 
F8 "~SYSDEV" O R 15350 -6200 50 
F9 "~IODEV1XX" O R 15350 -6100 50 
F10 "~IODEV2XX" O R 15350 -6000 50 
F11 "~IODEV3XX" O R 15350 -5900 50 
F12 "~FPAEXT" I R 15350 -5600 50 
F13 "FPD[0..7]" T R 15350 -5500 50 
F14 "~T34" I L 14200 -6400 50 
F15 "HALT" I L 14200 -6100 50 
$EndSheet
Text Label 16200 -6500 2    50   ~ 0
AB[0..23]
Wire Bus Line
	15350 -6500 16200 -6500
Text Label 13350 -6700 0    50   ~ 0
AEXT[0..7]
Wire Bus Line
	14200 -6700 13350 -6700
Wire Wire Line
	14200 -6400 13350 -6400
Text Label 13350 -6400 0    50   ~ 0
~T34
Text Notes 10650 -7050 0    100  ~ 20
Memory Bank Unit (MBU)
Text Label 13300 -3400 0    50   ~ 0
~WS
Text Label 13300 -3550 0    50   ~ 0
~WEN
Text Label 13300 -3650 0    50   ~ 0
~R
Text Label 13300 -3750 0    50   ~ 0
~IO
Text Label 13300 -3850 0    50   ~ 0
~MEM
Text Label 13300 -4400 0    50   ~ 0
~HALT
Text Label 13300 -4500 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	14150 -3400 13300 -3400
Wire Wire Line
	14150 -3550 13300 -3550
Wire Wire Line
	14150 -3650 13300 -3650
Wire Wire Line
	14150 -3750 13300 -3750
Wire Wire Line
	14150 -3850 13300 -3850
Wire Wire Line
	14150 -4400 13300 -4400
Wire Wire Line
	14150 -4500 13300 -4500
Wire Wire Line
	15300 -3750 16150 -3750
Text Label 16150 -3300 2    50   ~ 0
DB[0..15]
Wire Bus Line
	15300 -3300 16150 -3300
Text Label 13300 -3300 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	14150 -3300 13300 -3300
Text Notes 13600 -4850 0    100  ~ 20
Data Bus Driver & Wait States
Text Notes 10950 -4850 0    100  ~ 20
Constant Store
Wire Bus Line
	12100 -4500 12950 -4500
Text Label 12950 -4500 2    50   ~ 0
IBUS[0..15]
Text Label 10100 -4500 0    50   ~ 0
RADDR[0..1]
Wire Bus Line
	10950 -4500 10100 -4500
Wire Wire Line
	11000 -5950 10150 -5950
Text Label 10150 -5950 0    50   ~ 0
~IR-IDX
Wire Wire Line
	12150 -5450 14200 -5450
Text Notes 14150 -7100 0    100  ~ 20
Address Register
Wire Wire Line
	15300 -3650 16150 -3650
Text Label 16150 -3650 2    50   ~ 0
~WAITING
Text Label 13300 -4300 0    50   ~ 0
CLK2
Wire Wire Line
	14150 -4300 13300 -4300
Wire Wire Line
	15300 -4400 16150 -4400
Text Label 16150 -4400 2    50   ~ 0
HALT
Wire Wire Line
	14200 -6100 13350 -6100
Text Label 13350 -6100 0    50   ~ 0
~HALT
$Sheet
S 10950 -4650 1150 450 
U 5E25A7FA
F0 "Constant Store" 50
F1 "cpu_cs.sch" 50
F2 "RADDR[0..1]" I L 10950 -4500 50 
F3 "IBUS[0..15]" B R 12100 -4500 50 
F4 "~READ-CS" I L 10950 -4350 50 
$EndSheet
Wire Wire Line
	10950 -4350 10100 -4350
Text Label 10100 -4350 0    50   ~ 0
~READ-CS
$Sheet
S 11000 -6850 1150 1550
U 61F95ACC
F0 "Memory Bank Unit (MBU)" 50
F1 "mbu.sch" 50
F2 "AEXT[0..7]" O R 12150 -6700 50 
F3 "WADDR[0..4]" I L 11000 -6150 50 
F4 "~FPRAM~∕ROM" I L 11000 -5450 50 
F5 "IBUS[0..7]" T L 11000 -6050 50 
F6 "RADDR[0..4]" I L 11000 -6250 50 
F7 "~IR-IDX" I L 11000 -5950 50 
F8 "~WAR" O R 12150 -5450 50 
F9 "CLK4" I L 11000 -6500 50 
F10 "CLK2" I L 11000 -6600 50 
F11 "~RSTHOLD" I L 11000 -6700 50 
F12 "IR[0..2]" I L 11000 -5850 50 
F13 "~T34" I L 11000 -6400 50 
F14 "~FPCTX" I L 11000 -5550 50 
F15 "FPD[0..7]" T R 12150 -5550 50 
$EndSheet
Wire Wire Line
	14150 -4100 13300 -4100
Text Label 13300 -4100 0    50   ~ 0
~T34
$Sheet
S 14150 -4650 1150 1500
U 5D46B22D
F0 "Wait States & Write Strobes" 50
F1 "cft_ws_busen.sch" 50
F2 "~T34" I L 14150 -4100 50 
F3 "~RSTHOLD" I L 14150 -4500 50 
F4 "CLK3" I L 14150 -4200 50 
F5 "~MEM" I L 14150 -3850 50 
F6 "~IO" I L 14150 -3750 50 
F7 "~HALT" I L 14150 -4400 50 
F8 "~WEN" I L 14150 -3550 50 
F9 "~WS" I L 14150 -3400 50 
F10 "~W" T R 15300 -3750 50 
F11 "~R" I L 14150 -3650 50 
F12 "IBUS[0..15]" T L 14150 -3300 50 
F13 "DB[0..15]" T R 15300 -3300 50 
F14 "~WAITING" O R 15300 -3650 50 
F15 "CLK2" I L 14150 -4300 50 
F16 "HALT" O R 15300 -4400 50 
$EndSheet
Wire Wire Line
	14150 -4200 13300 -4200
Text Label 13300 -4200 0    50   ~ 0
CLK3
$Comp
L power:+5V #PWR?
U 1 1 5EFD0815
P 20200 -2050
AR Path="/5F67D4B5/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5EFD0815" Ref="#PWR0110"  Part="1" 
AR Path="/5D34E810/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD0815" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 20200 -2200 50  0001 C CNN
F 1 "+5V" H 20142 -2013 50  0000 R CNN
F 2 "" H 20200 -2050 50  0001 C CNN
F 3 "" H 20200 -2050 50  0001 C CNN
	1    20200 -2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFD081B
P 20200 -1650
AR Path="/5F67D4B5/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5EFD081B" Ref="#PWR0116"  Part="1" 
AR Path="/5D34E810/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD081B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H 20200 -1900 50  0001 C CNN
F 1 "GND" H 20122 -1687 50  0000 R CNN
F 2 "" H 20200 -1650 50  0001 C CNN
F 3 "" H 20200 -1650 50  0001 C CNN
	1    20200 -1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	20200 -2050 20200 -1950
Wire Wire Line
	20200 -1750 20200 -1650
Wire Wire Line
	-1450 6750 -1100 6750
Wire Wire Line
	-1450 6650 -1100 6650
Wire Wire Line
	-1450 6550 -1100 6550
Wire Wire Line
	-1450 6450 -1100 6450
Wire Wire Line
	-1450 6350 -1100 6350
Wire Wire Line
	-1450 6250 -1100 6250
Wire Wire Line
	-1450 6150 -1100 6150
Wire Wire Line
	-1450 6050 -1100 6050
Wire Wire Line
	-1450 5950 -1100 5950
Wire Wire Line
	-1450 5850 -1100 5850
Wire Wire Line
	-1450 5750 -1100 5750
Wire Wire Line
	-1450 5650 -1100 5650
Wire Wire Line
	-1450 5550 -1100 5550
Wire Wire Line
	-1450 5450 -1100 5450
Wire Wire Line
	-1450 5350 -1100 5350
Wire Wire Line
	-1450 5250 -1100 5250
Wire Wire Line
	-1450 5050 -1100 5050
Wire Wire Line
	-1450 4950 -1100 4950
Wire Wire Line
	-1450 4850 -1100 4850
Wire Wire Line
	-1450 4750 -1100 4750
Wire Wire Line
	-1450 4650 -1100 4650
Wire Wire Line
	-1450 4550 -1100 4550
Wire Wire Line
	-1450 4450 -1100 4450
Wire Wire Line
	-1450 4350 -1100 4350
Wire Wire Line
	-1450 4250 -1100 4250
Wire Wire Line
	-1450 4150 -1100 4150
Wire Wire Line
	-1450 4050 -1100 4050
Wire Wire Line
	-1450 3950 -1100 3950
Wire Wire Line
	-1450 3850 -1100 3850
Wire Wire Line
	-3000 7550 -2650 7550
Wire Wire Line
	-3000 7450 -2650 7450
Wire Wire Line
	-3000 7350 -2650 7350
Wire Wire Line
	-3000 7250 -2650 7250
Wire Wire Line
	-3000 7150 -2650 7150
Wire Wire Line
	-3000 7050 -2650 7050
Wire Wire Line
	-3000 6950 -2650 6950
Wire Wire Line
	-3000 6850 -2650 6850
Wire Wire Line
	-3000 6650 -2650 6650
Wire Wire Line
	-3000 6550 -2650 6550
Wire Wire Line
	-3000 6450 -2650 6450
Wire Wire Line
	-3000 6350 -2650 6350
Wire Wire Line
	-3000 6250 -2650 6250
Wire Wire Line
	-3000 6150 -2650 6150
Wire Wire Line
	-3000 6050 -2650 6050
Wire Wire Line
	-3000 5950 -2650 5950
Wire Wire Line
	-3000 5850 -2650 5850
Wire Wire Line
	-3000 5750 -2650 5750
Wire Wire Line
	-3000 5650 -2650 5650
Wire Wire Line
	-3000 5550 -2650 5550
Wire Wire Line
	-3000 5450 -2650 5450
Wire Wire Line
	-3000 5350 -2650 5350
Wire Wire Line
	-3000 5250 -2650 5250
Wire Wire Line
	-3000 5150 -2650 5150
Wire Wire Line
	-3000 5050 -2650 5050
Wire Wire Line
	-3000 4950 -2650 4950
Wire Wire Line
	-3000 4850 -2650 4850
Wire Wire Line
	-3000 4750 -2650 4750
Wire Wire Line
	-3000 4650 -2650 4650
Wire Wire Line
	-3000 4550 -2650 4550
Wire Wire Line
	-3000 4450 -2650 4450
Wire Wire Line
	-3000 4350 -2650 4350
Wire Wire Line
	-3000 4150 -2650 4150
Wire Wire Line
	-3000 4050 -2650 4050
Wire Wire Line
	-3550 4550 -3200 4550
Wire Wire Line
	-3550 4450 -3200 4450
Wire Wire Line
	-3550 4350 -3200 4350
Wire Wire Line
	-3550 4250 -3200 4250
Wire Wire Line
	-3550 4150 -3200 4150
Wire Wire Line
	-3550 4050 -3200 4050
Wire Wire Line
	-3550 3950 -3200 3950
Wire Wire Line
	-3550 3850 -3200 3850
Wire Wire Line
	-3200 5850 -3550 5850
Wire Wire Line
	-3200 5750 -3550 5750
Wire Wire Line
	-3200 5650 -3550 5650
Wire Wire Line
	-3200 5550 -3550 5550
Wire Wire Line
	-3200 5450 -3550 5450
Wire Wire Line
	-3200 5350 -3550 5350
Wire Wire Line
	-3200 5250 -3550 5250
Wire Wire Line
	-3200 5150 -3550 5150
Text Label -3200 3850 2    50   ~ 0
FPD0
Text Label -3200 3950 2    50   ~ 0
FPD1
Text Label -3200 4050 2    50   ~ 0
FPD2
Text Label -3200 4150 2    50   ~ 0
FPD3
Text Label -3200 4250 2    50   ~ 0
FPD4
Text Label -3200 4350 2    50   ~ 0
FPD5
Text Label -3200 4450 2    50   ~ 0
FPD6
Text Label -3200 4550 2    50   ~ 0
FPD7
$Comp
L power:GND #PWR0132
U 1 1 60F6906D
P -1350 7650
F 0 "#PWR0132" H -1350 7400 50  0001 C CNN
F 1 "GND" H -1345 7477 50  0000 C CNN
F 2 "" H -1350 7650 50  0001 C CNN
F 3 "" H -1350 7650 50  0001 C CNN
	1    -1350 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1450 7550 -1350 7550
Wire Wire Line
	-1350 7550 -1350 7650
Text Label -1100 5250 2    50   ~ 0
DB0
Text Label -1100 5350 2    50   ~ 0
DB1
Text Label -1100 5450 2    50   ~ 0
DB2
Text Label -1100 5550 2    50   ~ 0
DB3
Text Label -1100 5650 2    50   ~ 0
DB4
Text Label -1100 5750 2    50   ~ 0
DB5
Text Label -1100 5850 2    50   ~ 0
DB6
Text Label -1100 5950 2    50   ~ 0
DB7
Text Label -1100 6050 2    50   ~ 0
DB8
Text Label -1100 6150 2    50   ~ 0
DB9
Text Label -1100 6250 2    50   ~ 0
DB10
Text Label -1100 6350 2    50   ~ 0
DB11
Text Label -1100 6450 2    50   ~ 0
DB12
Text Label -1100 6550 2    50   ~ 0
DB13
Text Label -1100 6650 2    50   ~ 0
DB14
Text Label -1100 6750 2    50   ~ 0
DB15
$Comp
L power:+5V #PWR0130
U 1 1 61D152B5
P -2700 3800
F 0 "#PWR0130" H -2700 3650 50  0001 C CNN
F 1 "+5V" H -2685 3973 50  0000 C CNN
F 2 "" H -2700 3800 50  0001 C CNN
F 3 "" H -2700 3800 50  0001 C CNN
	1    -2700 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2650 3850 -2700 3850
Wire Wire Line
	-2700 3850 -2700 3800
Text Label -3200 5150 2    50   ~ 0
IR0
Text Label -3200 5250 2    50   ~ 0
IR1
Text Label -3200 5350 2    50   ~ 0
IR2
Text Label -3200 5450 2    50   ~ 0
IR3
Text Label -3200 5550 2    50   ~ 0
IR4
Text Label -3200 5650 2    50   ~ 0
IR5
Text Label -3200 5750 2    50   ~ 0
IR6
Text Label -3200 5850 2    50   ~ 0
IR7
Text Label -3000 4050 0    50   ~ 0
~RESET
Text Label -3000 4150 0    50   ~ 0
~RSTHOLD
Text Label -3000 4350 0    50   ~ 0
AB0
Text Label -3000 4450 0    50   ~ 0
AB1
Text Label -3000 4550 0    50   ~ 0
AB2
Text Label -3000 4650 0    50   ~ 0
AB3
Text Label -3000 4750 0    50   ~ 0
AB4
Text Label -3000 4850 0    50   ~ 0
AB5
Text Label -3000 4950 0    50   ~ 0
AB6
Text Label -3000 5050 0    50   ~ 0
AB7
Text Label -3000 5150 0    50   ~ 0
AB8
Text Label -3000 5250 0    50   ~ 0
AB9
Text Label -3000 5350 0    50   ~ 0
AB10
Text Label -3000 5450 0    50   ~ 0
AB11
Text Label -3000 5550 0    50   ~ 0
AB12
Text Label -3000 5650 0    50   ~ 0
AB13
Text Label -3000 5750 0    50   ~ 0
AB14
Text Label -3000 5850 0    50   ~ 0
AB15
Text Label -3000 5950 0    50   ~ 0
AB16
Text Label -3000 6050 0    50   ~ 0
AB17
Text Label -3000 6150 0    50   ~ 0
AB18
Text Label -3000 6250 0    50   ~ 0
AB19
Text Label -3000 6350 0    50   ~ 0
AB20
Text Label -3000 6450 0    50   ~ 0
AB21
Text Label -3000 6550 0    50   ~ 0
AB22
Text Label -3000 6650 0    50   ~ 0
AB23
Text Label -3000 6850 0    50   ~ 0
~IRQ0
Text Label -3000 6950 0    50   ~ 0
~IRQ1
Text Label -3000 7050 0    50   ~ 0
~IRQ2
Text Label -3000 7150 0    50   ~ 0
~IRQ3
Text Label -3000 7250 0    50   ~ 0
~IRQ4
Text Label -3000 7350 0    50   ~ 0
~IRQ5
Text Label -3000 7450 0    50   ~ 0
~IRQ6
Text Label -3000 7550 0    50   ~ 0
~IRQ7
Text Label -1100 3850 2    50   ~ 0
~MEM
Text Label -1100 3950 2    50   ~ 0
~IO
Text Label -1100 4050 2    50   ~ 0
~R
Text Label -1100 4150 2    50   ~ 0
~W
Text Label -1100 4250 2    50   ~ 0
~SYSDEV
Text Label -1100 4350 2    50   ~ 0
~IODEV1XX
Text Label -1100 4450 2    50   ~ 0
~IODEV2XX
Text Label -1100 4550 2    50   ~ 0
~IODEV3XX
Text Label -1100 4650 2    50   ~ 0
~WS
Text Label -1100 4750 2    50   ~ 0
~WAITING
Text Label -1100 4850 2    50   ~ 0
~HALT
Text Label -1100 4950 2    50   ~ 0
~IRQ
Text Label -1100 5050 2    50   ~ 0
~IRQS
Text Label -7900 -2650 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-8500 -2650 -7900 -2650
Text Label -7900 -2750 2    50   ~ 0
~FPµC2
Text Label -7900 -2850 2    50   ~ 0
~FPµC1
Text Label -7900 -2950 2    50   ~ 0
~FPµC0
Text Label -7900 -3050 2    50   ~ 0
~FPµA0
Wire Wire Line
	-8500 -2750 -7900 -2750
Wire Wire Line
	-8500 -2850 -7900 -2850
Wire Wire Line
	-8500 -2950 -7900 -2950
Wire Wire Line
	-8500 -3050 -7900 -3050
Text Label -7900 -3850 2    50   ~ 0
~END
Text Label -7900 -3950 2    50   ~ 0
~WEN
Text Label -7900 -4050 2    50   ~ 0
~R
Text Label -7900 -4150 2    50   ~ 0
~IO
Text Label -7900 -4250 2    50   ~ 0
~MEM
Wire Wire Line
	-8500 -3950 -7900 -3950
Wire Wire Line
	-8500 -4050 -7900 -4050
Wire Wire Line
	-8500 -4150 -7900 -4150
Wire Wire Line
	-8500 -4250 -7900 -4250
Text Label -10250 -3950 0    50   ~ 0
~WS
Text Label -10250 -4050 0    50   ~ 0
~ENDEXT
Text Label -10250 -4550 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	-10250 -4550 -9650 -4550
Text Label -10250 -4250 0    50   ~ 0
CLK4
Wire Wire Line
	-9650 -4350 -10250 -4350
Text Label -10250 -4150 0    50   ~ 0
~HALT
Text Label -8050 -5450 2    50   ~ 0
T34
Text Label -8050 -5600 2    50   ~ 0
CLK4
Text Label -8050 -5700 2    50   ~ 0
CLK3
Text Label -8050 -5800 2    50   ~ 0
CLK2
Text Label -8050 -5900 2    50   ~ 0
CLK1
Text Label -8050 -6050 2    50   ~ 0
~RSTHOLD
$Sheet
S -9650 -6200 1150 1050
U 5E36D9C8
F0 "Clock Generator" 50
F1 "cft_clk.sch" 50
F2 "CLK1" O R -8500 -5900 50 
F3 "CLK2" O R -8500 -5800 50 
F4 "CLK3" O R -8500 -5700 50 
F5 "CLK4" O R -8500 -5600 50 
F6 "~RESET" I L -9650 -6050 50 
F7 "FPCLK" I L -9650 -5800 50 
F8 "~RSTHOLD" O R -8500 -6050 50 
F9 "POWEROK" I L -9650 -5450 50 
F10 "~FPRESET" I L -9650 -5900 50 
F11 "~FPCLK~⁄CLK" I L -9650 -5700 50 
F12 "T34" O R -8500 -5450 50 
F13 "16MHz" O R -8500 -5350 50 
$EndSheet
Wire Wire Line
	-8050 -6050 -8500 -6050
Text Label -10250 -5450 0    50   ~ 0
POWEROK
Text Label -10250 -5700 0    50   ~ 0
~FPCLK~⁄CLK
Text Label -10250 -5800 0    50   ~ 0
FPCLK
Text Label -10250 -5900 0    50   ~ 0
~FPRESET
Wire Wire Line
	-9650 -5700 -10250 -5700
Wire Wire Line
	-9650 -5800 -10250 -5800
Wire Wire Line
	-9650 -5900 -10250 -5900
Wire Wire Line
	-9650 -5450 -10250 -5450
Text Label -7900 -4650 2    50   ~ 0
RADDR[0..4]
Text Label -7900 -4550 2    50   ~ 0
WADDR[0..4]
Text Label -7900 -4450 2    50   ~ 0
COND[0..4]
Text Label -7900 -4350 2    50   ~ 0
ACTION[0..3]
Text Label -5200 -6050 2    50   ~ 0
IR[0..15]
Text Label -5200 -5650 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-5800 -5650 -5200 -5650
Wire Bus Line
	-6950 -5850 -7550 -5850
Text Label -7550 -5850 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	-5800 -5850 -5200 -5850
Wire Wire Line
	-5800 -5750 -5200 -5750
Text Label -5200 -5850 2    50   ~ 0
~FPIRL
Text Label -5200 -5750 2    50   ~ 0
~FPIRH
Wire Wire Line
	-8500 -3150 -7900 -3150
Text Label -7900 -3150 2    50   ~ 0
FPFETCH∕~EXEC
Wire Bus Line
	-5800 -4950 -5200 -4950
Text Label -5200 -4950 2    50   ~ 0
IBUS[0..15]
Wire Bus Line
	-6950 -4500 -7550 -4500
Text Label -7550 -4500 0    50   ~ 0
PC[10..15]
Text Label -7550 -4850 0    50   ~ 0
~END
Wire Bus Line
	-9650 -1650 -10250 -1650
Text Label -10250 -1650 0    50   ~ 0
IBUS[0..15]
Text Label -7900 -950 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-8500 -950 -7900 -950
Wire Bus Line
	-3350 -5700 -2800 -5700
Text Label -3350 -5700 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-2800 -6500 -3350 -6500
Wire Wire Line
	-2800 -6400 -3350 -6400
Wire Wire Line
	-2800 -6300 -3350 -6300
Wire Wire Line
	-2800 -6200 -3350 -6200
Wire Wire Line
	-2800 -6600 -3350 -6600
Wire Wire Line
	-2800 -5300 -3350 -5300
Wire Wire Line
	-2800 -5200 -3350 -5200
Wire Wire Line
	-2800 -5100 -3350 -5100
Wire Wire Line
	-2800 -5600 -3350 -5600
Wire Wire Line
	-2800 -4800 -3350 -4800
Wire Wire Line
	-2800 -4700 -3350 -4700
Wire Wire Line
	-2800 -4600 -3350 -4600
Wire Wire Line
	-2800 -4900 -3350 -4900
Wire Wire Line
	-2800 -5000 -3350 -5000
Wire Wire Line
	-2800 -4000 -3350 -4000
Wire Wire Line
	-2800 -3900 -3350 -3900
Wire Wire Line
	-2800 -4100 -3350 -4100
Wire Wire Line
	-2800 -4300 -3350 -4300
Text Label -3350 -5600 0    50   ~ 0
~IRQ
Wire Wire Line
	-2800 -5900 -3350 -5900
Wire Wire Line
	-2800 -5800 -3350 -5800
Wire Bus Line
	-3350 -6700 -2800 -6700
Text Label -3350 -6700 0    50   ~ 0
IBUS[0..15]
Text Label -3350 -6600 0    50   ~ 0
~RESET
Text Label -3350 -6500 0    50   ~ 0
CLK1
Text Label -3350 -6400 0    50   ~ 0
CLK2
Text Label -3350 -6300 0    50   ~ 0
CLK3
Text Label -3350 -6200 0    50   ~ 0
CLK4
Text Label -3350 -5900 0    50   ~ 0
WSTB
Text Label -3350 -5800 0    50   ~ 0
T34
Wire Wire Line
	-2800 -5500 -3350 -5500
Text Label -3350 -5500 0    50   ~ 0
~IRQS
Text Label -3350 -5300 0    50   ~ 0
~RSTHOLD
Text Label -3350 -5200 0    50   ~ 0
~SYSDEV
Text Label -3350 -5100 0    50   ~ 0
~IODEV1xx
Text Label -3350 -5000 0    50   ~ 0
~IODEV2xx
Text Label -3350 -4900 0    50   ~ 0
~IODEV3xx
Text Label -3350 -4800 0    50   ~ 0
~MEM
Text Label -3350 -4700 0    50   ~ 0
~IO
Text Label -3350 -4600 0    50   ~ 0
~R
Text Label -3350 -4300 0    50   ~ 0
~WS
Text Label -3350 -4100 0    50   ~ 0
~ENDEXT
Text Label -3350 -4000 0    50   ~ 0
~SKIPEXT
Text Label -3350 -3900 0    50   ~ 0
~HALT
Text Label -3350 -3800 0    50   ~ 0
ACTION[0..3]
Text Label -3350 -3700 0    50   ~ 0
WADDR[0..4]
Text Label -3350 -3600 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	-2800 -3800 -3350 -3800
Wire Bus Line
	-2800 -3700 -3350 -3700
Wire Bus Line
	-2800 -3600 -3350 -3600
Wire Bus Line
	-3350 -3500 -2800 -3500
Text Label -3350 -3500 0    50   ~ 0
RSVD[1..4]
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P -300 -2250
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR0106"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H -300 -2400 50  0001 C CNN
F 1 "+5V" H -358 -2213 50  0000 R CNN
F 2 "" H -300 -2250 50  0001 C CNN
F 3 "" H -300 -2250 50  0001 C CNN
	1    -300 -2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552A6
P -300 -1850
AR Path="/5F67D4B5/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A6" Ref="#PWR0113"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H -300 -2100 50  0001 C CNN
F 1 "GND" H -378 -1887 50  0000 R CNN
F 2 "" H -300 -1850 50  0001 C CNN
F 3 "" H -300 -1850 50  0001 C CNN
	1    -300 -1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	-300 -2250 -300 -2150
$Comp
L Device:CP_Small C103
U 1 1 5DD552AD
P -300 -2050
AR Path="/5DD552AD" Ref="C103"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C103" H -388 -2004 50  0000 R CNN
F 1 "47µF" H -388 -2095 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -300 -2050 50  0001 C CNN
F 3 "~" H -300 -2050 50  0001 C CNN
	1    -300 -2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-300 -1950 -300 -1850
$Comp
L power:+5V #PWR?
U 1 1 5DD552B4
P -750 -2250
AR Path="/5F67D4B5/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD552B4" Ref="#PWR0105"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0105" H -750 -2400 50  0001 C CNN
F 1 "+5V" H -808 -2213 50  0000 R CNN
F 2 "" H -750 -2250 50  0001 C CNN
F 3 "" H -750 -2250 50  0001 C CNN
	1    -750 -2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552BA
P -750 -1850
AR Path="/5F67D4B5/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD552BA" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H -750 -2100 50  0001 C CNN
F 1 "GND" H -828 -1887 50  0000 R CNN
F 2 "" H -750 -1850 50  0001 C CNN
F 3 "" H -750 -1850 50  0001 C CNN
	1    -750 -1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	-750 -2250 -750 -2150
$Comp
L Device:CP_Small C102
U 1 1 5DD552C1
P -750 -2050
AR Path="/5DD552C1" Ref="C102"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C102" H -838 -2004 50  0000 R CNN
F 1 "47µF" H -838 -2095 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -750 -2050 50  0001 C CNN
F 3 "~" H -750 -2050 50  0001 C CNN
	1    -750 -2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-750 -1950 -750 -1850
Text Notes -2850 -7100 0    100  ~ 20
Edge Connector
Wire Wire Line
	-1650 -5700 -1050 -5700
NoConn ~ -3350 -5200
NoConn ~ -3350 -5100
NoConn ~ -3350 -5000
NoConn ~ -3350 -4900
NoConn ~ -3350 -3500
Wire Wire Line
	-1650 -6700 -1300 -6700
Wire Wire Line
	-1650 -6600 -1300 -6600
Wire Wire Line
	-1650 -6500 -1300 -6500
Wire Wire Line
	-1650 -6400 -1300 -6400
Wire Wire Line
	-1650 -6300 -1300 -6300
Wire Wire Line
	-1650 -6200 -1300 -6200
Wire Wire Line
	-1650 -6100 -1300 -6100
Text Label -1300 -6700 2    50   ~ 0
IR0
Text Label -1300 -6600 2    50   ~ 0
IR1
Text Label -1300 -6500 2    50   ~ 0
IR2
Text Label -1300 -6400 2    50   ~ 0
IR3
Text Label -1300 -6300 2    50   ~ 0
IR4
Text Label -1300 -6200 2    50   ~ 0
IR5
Text Label -1300 -6100 2    50   ~ 0
IR6
Entry Wire Line
	-1300 -6100 -1200 -6200
Entry Wire Line
	-1300 -6200 -1200 -6300
Entry Wire Line
	-1300 -6300 -1200 -6400
Entry Wire Line
	-1300 -6400 -1200 -6500
Entry Wire Line
	-1300 -6500 -1200 -6600
Entry Wire Line
	-1300 -6600 -1200 -6700
Entry Wire Line
	-1300 -6700 -1200 -6800
Entry Bus Bus
	-1200 -6850 -1100 -6950
Wire Bus Line
	-1100 -6950 -800 -6950
Text Label -800 -6950 2    50   ~ 0
IR[0..6]
Text Label -1050 -5700 2    50   ~ 0
~WRITE-FL
Text Label -1050 -5900 2    50   ~ 0
FL
Text Label -1050 -5800 2    50   ~ 0
FV
Text Notes -1000 -5900 0    50   ~ 0
← ALU
Text Notes -1000 -6700 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -5700 0    50   ~ 0
→ ALU
Wire Wire Line
	-1650 -2800 -1050 -2800
Wire Wire Line
	-10250 -4450 -9650 -4450
Text Label -10250 -4450 0    50   ~ 0
CLK1
Wire Bus Line
	-5800 -6050 -5200 -6050
$Sheet
S -6950 -6200 1150 750 
U 5F63066B
F0 "Instruction Register (IR)" 50
F1 "cfg_reg_ir.sch" 50
F2 "IBUS[0..15]" T L -6950 -5850 50 
F3 "IR[0..15]" B R -5800 -6050 50 
F4 "~FPIRL" I R -5800 -5850 50 
F5 "~FPIRH" I R -5800 -5750 50 
F6 "FPD[0..7]" T R -5800 -5650 50 
F7 "~WRITE-IR" I L -6950 -6050 50 
$EndSheet
Wire Wire Line
	-5800 -4850 -5200 -4850
Wire Wire Line
	-5800 -4750 -5200 -4750
Text Label -5200 -4850 2    50   ~ 0
IDX0
Text Label -5200 -4750 2    50   ~ 0
IDX1
Wire Bus Line
	-7550 -4600 -6950 -4600
Text Label -7550 -4600 0    50   ~ 0
IR[0..11]
$Sheet
S -9650 -2100 1150 1300
U 5D69F3FD
F0 "Flag Unit" 50
F1 "flag_unit.sch" 50
F2 "FPD[0..7]" T R -8500 -950 50 
F3 "IBUS[8..15]" T L -9650 -1650 50 
F4 "~FPFLAGS" I L -9650 -950 50 
F5 "WADDR[0..4]" I L -9650 -1850 50 
F6 "RADDR[0..4]" I L -9650 -1750 50 
F7 "FI" I L -9650 -1500 50 
F8 "FV" I L -9650 -1400 50 
F9 "FL" I L -9650 -1300 50 
F10 "FZ" I L -9650 -1200 50 
F11 "FN" I L -9650 -1100 50 
F12 "CLK4" I L -9650 -1950 50 
F13 "~READ-AGL" O R -8500 -1450 50 
F14 "~WRITE-IR" O R -8500 -1350 50 
F15 "~READ-FL" I R -8500 -1950 50 
$EndSheet
Wire Bus Line
	-9650 -1850 -10250 -1850
Text Label -10250 -1850 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	-9650 -1750 -10250 -1750
Text Label -10250 -1750 0    50   ~ 0
RADDR[4..0]
Wire Wire Line
	-9650 -1950 -10250 -1950
Text Label -10250 -1950 0    50   ~ 0
CLK4
Text Notes -1000 -6600 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -6500 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -6400 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -6300 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -6200 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -5800 0    50   ~ 0
← ALU
Wire Wire Line
	-1650 -3100 -1050 -3100
Wire Wire Line
	-1650 -3000 -1050 -3000
Wire Wire Line
	-1650 -3500 -1050 -3500
Wire Wire Line
	-1650 -3400 -1050 -3400
Wire Wire Line
	-1650 -3300 -1050 -3300
Wire Wire Line
	-1650 -3200 -1050 -3200
Wire Wire Line
	-1650 -3600 -1050 -3600
Text Label -1050 -3600 2    50   ~ 0
COND0
Text Label -1050 -3500 2    50   ~ 0
COND1
Text Label -1050 -3400 2    50   ~ 0
COND2
Text Label -1050 -3300 2    50   ~ 0
COND3
Text Label -1050 -3200 2    50   ~ 0
COND4
Text Label -1050 -3100 2    50   ~ 0
CEXT8
Text Label -1050 -3000 2    50   ~ 0
CEXT9
Wire Wire Line
	-9650 -1500 -10250 -1500
Wire Wire Line
	-9650 -1400 -10250 -1400
Wire Wire Line
	-9650 -1300 -10250 -1300
Wire Wire Line
	-9650 -1200 -10250 -1200
Wire Wire Line
	-9650 -1100 -10250 -1100
Wire Wire Line
	-9650 -950 -10250 -950
Text Label -10250 -950 0    50   ~ 0
~FPFLAGS
Text Label -10250 -1500 0    50   ~ 0
FI
Text Label -10250 -1400 0    50   ~ 0
FV
Text Label -10250 -1300 0    50   ~ 0
FL
Text Label -10250 -1200 0    50   ~ 0
FZ
Text Label -10250 -1100 0    50   ~ 0
FN
Text Label -1050 -5600 2    50   ~ 0
FZ
Text Label -1050 -5500 2    50   ~ 0
FN
Text Notes -1000 -5600 0    50   ~ 0
← REG
Text Notes -1000 -5500 0    50   ~ 0
← REG
Text Label -1050 -5400 2    50   ~ 0
PC10
Text Label -1050 -5300 2    50   ~ 0
PC11
Text Label -1050 -5200 2    50   ~ 0
PC12
Text Label -1050 -5100 2    50   ~ 0
PC13
Text Label -1050 -5000 2    50   ~ 0
PC14
Text Label -1050 -4900 2    50   ~ 0
PC15
Text Notes -1000 -5400 0    50   ~ 0
← REG
Text Notes -1000 -5300 0    50   ~ 0
← REG
Text Notes -1000 -5200 0    50   ~ 0
← REG
Text Notes -1000 -5100 0    50   ~ 0
← REG
Text Notes -1000 -5000 0    50   ~ 0
← REG
Text Notes -1000 -4900 0    50   ~ 0
← REG
Wire Wire Line
	-8500 -5900 -8050 -5900
Text Label -5250 5750 0    50   ~ 0
~FPRESET
Text Label -5250 4050 0    50   ~ 0
FPCLK
Text Label -5250 4150 0    50   ~ 0
~FPCLK~⁄CLK
Text Label -5250 5850 0    50   ~ 0
POWEROK
Wire Bus Line
	-8500 -4650 -7900 -4650
Wire Bus Line
	-8500 -4350 -7900 -4350
Wire Bus Line
	-8500 -4450 -7900 -4450
Wire Bus Line
	-8500 -4550 -7900 -4550
Text Label -5250 3850 0    50   ~ 0
FPFETCH
Text Notes -1000 -4800 0    50   ~ 0
← DFP
Text Notes -1000 -4700 0    50   ~ 0
← DFP
Text Notes -1000 -4600 0    50   ~ 0
← DFP
Text Notes -1000 -3700 0    50   ~ 0
← PSU (backplane)
Text Notes -1000 -4500 0    50   ~ 0
→ DFP
Wire Wire Line
	-8500 -3850 -7900 -3850
Wire Wire Line
	-7550 -4850 -6950 -4850
Wire Wire Line
	-8500 -5800 -8050 -5800
Wire Wire Line
	-8500 -5700 -8050 -5700
Wire Wire Line
	-8500 -5600 -8050 -5600
Wire Wire Line
	-8500 -5450 -8050 -5450
Text Label -10250 -4650 0    50   ~ 0
~RESET
Wire Wire Line
	-10250 -6050 -9650 -6050
Wire Wire Line
	-10250 -4650 -9650 -4650
Text Notes -10350 -7300 0    100  ~ 20
The Control Unit Board
Text Notes -10350 -6500 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Notes -1000 -3600 0    50   ~ 0
Future expansion
Text Label -5250 4750 0    50   ~ 0
~FPµC2
Text Label -5250 4650 0    50   ~ 0
~FPµC1
Text Label -5250 4550 0    50   ~ 0
~FPµC0
Text Label -5250 4450 0    50   ~ 0
~FPµA0
Text Notes -1000 -4400 0    50   ~ 0
← DFP
Text Notes -1000 -4300 0    50   ~ 0
← DFP
Text Notes -1000 -4200 0    50   ~ 0
← DFP
Text Notes -1000 -4100 0    50   ~ 0
← DFP
Text Label -5250 4350 0    50   ~ 0
~FPIRL
Text Label -5250 4850 0    50   ~ 0
~FPIRH
Text Notes -1000 -4000 0    50   ~ 0
← DFP
Text Notes -1000 -3900 0    50   ~ 0
← DFP
Wire Wire Line
	-8500 -1450 -7900 -1450
Text Label -7900 -1450 2    50   ~ 0
~READ-AGL
Wire Wire Line
	-6950 -4950 -7550 -4950
Text Label -7550 -4950 0    50   ~ 0
~READ-AGL
Text Label -7550 -6050 0    50   ~ 0
~WRITE-IR
Wire Wire Line
	-6950 -6050 -7550 -6050
Wire Wire Line
	-8500 -1350 -7900 -1350
Text Label -7900 -1350 2    50   ~ 0
~WRITE-IR
Text Label -10250 -6050 0    50   ~ 0
~RESET
Text Label -1050 -6000 2    50   ~ 0
~WEN
Text Notes -1000 -6000 0    50   ~ 0
→ BUS
Text Notes -1000 -3800 0    50   ~ 0
← DFP
Text Label -5250 4950 0    50   ~ 0
~FPFLAGS
Wire Wire Line
	-8500 -5350 -8050 -5350
Text Label -8050 -5350 2    50   ~ 0
16MHz
Text Notes -1000 -6100 0    50   ~ 0
→ BUS.MBU
Text Label -5200 -4550 2    50   ~ 0
~IDXEN
$Sheet
S -6950 -5100 1150 750 
U 5F3EA987
F0 "Addressing Modes" 50
F1 "cft_agl.sch" 50
F2 "IBUS[0..15]" T R -5800 -4950 50 
F3 "IR[0..11]" I L -6950 -4600 50 
F4 "PC[10..15]" I L -6950 -4500 50 
F5 "~END" I L -6950 -4850 50 
F6 "IDX0" O R -5800 -4850 50 
F7 "IDX1" O R -5800 -4750 50 
F8 "~READ-AGL" I L -6950 -4950 50 
F9 "~IDXEN" O R -5800 -4550 50 
$EndSheet
Wire Wire Line
	-5800 -4550 -4900 -4550
Wire Wire Line
	-9650 -4150 -10250 -4150
Wire Wire Line
	-10250 -4050 -9650 -4050
Wire Wire Line
	-10250 -3950 -9650 -3950
Wire Wire Line
	-9650 -4250 -10250 -4250
Text Label -10250 -4350 0    50   ~ 0
CLK2
Text Label -7550 -1950 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	-6950 -1250 -7550 -1250
Text Label -5200 -1100 2    50   ~ 0
~IRQSµC
Text Label -5200 -1200 2    50   ~ 0
~IRQS
Wire Wire Line
	-5800 -1100 -5200 -1100
Wire Wire Line
	-5800 -1200 -5200 -1200
Text Label -5200 -1950 2    50   ~ 0
FI
Wire Wire Line
	-5800 -1950 -5200 -1950
Text Label -7550 -1650 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	-6950 -1650 -7550 -1650
Text Label -7550 -1100 0    50   ~ 0
~IRQ
Text Label -7550 -1250 0    50   ~ 0
~END
Text Label -7550 -1350 0    50   ~ 0
~WRITE-FL
Text Label -7550 -1450 0    50   ~ 0
IBUS15
Text Label -7550 -1750 0    50   ~ 0
CLK4
Wire Wire Line
	-6950 -1100 -7550 -1100
Wire Wire Line
	-6950 -1350 -7550 -1350
Wire Wire Line
	-6950 -1450 -7550 -1450
Wire Wire Line
	-6950 -1750 -7550 -1750
Wire Wire Line
	-6950 -1950 -7550 -1950
$Comp
L Connector:TestPoint TP101
U 1 1 5E9C8A8F
P -7600 -2550
F 0 "TP101" V -7497 -2478 50  0000 C CNN
F 1 "TestPoint" V -7496 -2478 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -7400 -2550 50  0001 C CNN
F 3 "~" H -7400 -2550 50  0001 C CNN
	1    -7600 -2550
	0    -1   -1   0   
$EndComp
Wire Bus Line
	-6950 -3650 -7550 -3650
Text Label -7550 -2550 0    50   ~ 0
CEXT10
Text Label -7550 -2650 0    50   ~ 0
CEXT9
Text Label -7550 -2750 0    50   ~ 0
CEXT8
Wire Wire Line
	-6950 -2550 -7600 -2550
Wire Wire Line
	-6950 -2650 -7550 -2650
Wire Wire Line
	-6950 -2750 -7550 -2750
Text Label -7550 -2850 0    50   ~ 0
~SKIPEXT
Wire Wire Line
	-6950 -2850 -7550 -2850
Text Label -7550 -3550 0    50   ~ 0
IR[0..6]
Text Label -7550 -3650 0    50   ~ 0
COND[0..4]
Text Label -7550 -3050 0    50   ~ 0
FN
Text Label -7550 -3150 0    50   ~ 0
FZ
Text Label -7550 -3250 0    50   ~ 0
FL
Text Label -7550 -3350 0    50   ~ 0
FV
Wire Wire Line
	-6950 -3050 -7550 -3050
Wire Wire Line
	-6950 -3150 -7550 -3150
Wire Wire Line
	-6950 -3250 -7550 -3250
Wire Wire Line
	-6950 -3350 -7550 -3350
Wire Bus Line
	-7550 -3550 -6950 -3550
Wire Wire Line
	-6950 -3750 -7550 -3750
Text Label -7550 -3750 0    50   ~ 0
CLK4
Wire Wire Line
	-6950 -3850 -7550 -3850
Text Label -7550 -3850 0    50   ~ 0
~RESET
$Sheet
S -6950 -4000 1150 1600
U 5EFCF155
F0 "Skip/Branch Unit" 50
F1 "cft_sbu.sch" 50
F2 "~COND" O R -5800 -3850 50 
F3 "FN" I L -6950 -3050 50 
F4 "~SKIPEXT" T L -6950 -2850 50 
F5 "FV" I L -6950 -3350 50 
F6 "FL" I L -6950 -3250 50 
F7 "FZ" I L -6950 -3150 50 
F8 "CLK4" I L -6950 -3750 50 
F9 "COND[0..4]" I L -6950 -3650 50 
F10 "~RESET" I L -6950 -3850 50 
F11 "IR[0..6]" I L -6950 -3550 50 
F12 "CEXT8" T L -6950 -2750 50 
F13 "CEXT9" T L -6950 -2650 50 
F14 "CEXT10" T L -6950 -2550 50 
$EndSheet
Wire Wire Line
	-2800 -4200 -3350 -4200
Text Label -3350 -4200 0    50   ~ 0
~WAITING
$Sheet
S -9650 -4800 1150 2450
U 5DEAC282
F0 "Microprogram Sequencer" 50
F1 "cft_microcode.sch" 50
F2 "~ENDEXT" I L -9650 -4050 50 
F3 "~RSTHOLD" I L -9650 -4550 50 
F4 "~WS" I L -9650 -3950 50 
F5 "~HALT" I L -9650 -4150 50 
F6 "CLK4" I L -9650 -4250 50 
F7 "~RESET" I L -9650 -4650 50 
F8 "RADDR[0..4]" O R -8500 -4650 50 
F9 "WADDR[0..4]" O R -8500 -4550 50 
F10 "COND[0..4]" O R -8500 -4450 50 
F11 "ACTION[0..3]" O R -8500 -4350 50 
F12 "~MEM" O R -8500 -4250 50 
F13 "~IO" O R -8500 -4150 50 
F14 "~R" O R -8500 -4050 50 
F15 "~WEN" O R -8500 -3950 50 
F16 "~END" O R -8500 -3850 50 
F17 "~IRQSµC" I L -9650 -2650 50 
F18 "~COND" I L -9650 -3650 50 
F19 "FPD[0..7]" T R -8500 -2650 50 
F20 "~FPµA0" I R -8500 -3050 50 
F21 "~FPµC0" I R -8500 -2950 50 
F22 "~FPµC1" I R -8500 -2850 50 
F23 "~FPµC2" I R -8500 -2750 50 
F24 "FPFETCH" O R -8500 -3150 50 
F25 "IDX0" I L -9650 -3850 50 
F26 "IDX1" I L -9650 -3750 50 
F27 "IR7" I L -9650 -3550 50 
F28 "IR8" I L -9650 -3450 50 
F29 "IR9" I L -9650 -3350 50 
F30 "IR10" I L -9650 -3250 50 
F31 "IR11" I L -9650 -3150 50 
F32 "IR12" I L -9650 -3050 50 
F33 "IR13" I L -9650 -2950 50 
F34 "IR14" I L -9650 -2850 50 
F35 "IR15" I L -9650 -2750 50 
F36 "CLK1" I L -9650 -4450 50 
F37 "CLK2" I L -9650 -4350 50 
F38 "~µPC-INH" I L -9650 -2550 50 
$EndSheet
Wire Wire Line
	-9650 -3850 -10250 -3850
Wire Wire Line
	-9650 -3750 -10250 -3750
Wire Wire Line
	-9650 -3550 -10250 -3550
Wire Wire Line
	-9650 -3450 -10250 -3450
Wire Wire Line
	-9650 -3350 -10250 -3350
Wire Wire Line
	-9650 -3250 -10250 -3250
Wire Wire Line
	-9650 -3150 -10250 -3150
Wire Wire Line
	-9650 -3050 -10250 -3050
Wire Wire Line
	-9650 -2950 -10250 -2950
Wire Wire Line
	-9650 -2850 -10250 -2850
Wire Wire Line
	-9650 -2750 -10250 -2750
Wire Wire Line
	-9650 -3650 -10250 -3650
Text Label -10350 -2950 1    50   ~ 0
IR[0..15]
Entry Wire Line
	-10350 -2650 -10250 -2750
Entry Wire Line
	-10350 -3450 -10250 -3550
Entry Wire Line
	-10350 -3350 -10250 -3450
Entry Wire Line
	-10350 -3250 -10250 -3350
Entry Wire Line
	-10350 -3150 -10250 -3250
Entry Wire Line
	-10350 -3050 -10250 -3150
Entry Wire Line
	-10350 -2950 -10250 -3050
Entry Wire Line
	-10350 -2850 -10250 -2950
Entry Wire Line
	-10350 -2750 -10250 -2850
Text Label -10150 -2650 0    50   ~ 0
~IRQSµC
Text Label -10250 -2750 0    50   ~ 0
IR15
Text Label -10250 -2850 0    50   ~ 0
IR14
Text Label -10250 -2950 0    50   ~ 0
IR13
Text Label -10250 -3050 0    50   ~ 0
IR12
Text Label -10250 -3150 0    50   ~ 0
IR11
Text Label -10250 -3250 0    50   ~ 0
IR10
Text Label -10250 -3350 0    50   ~ 0
IR9
Text Label -10250 -3450 0    50   ~ 0
IR8
Text Label -10250 -3550 0    50   ~ 0
IR7
Wire Wire Line
	-9650 -2650 -10150 -2650
Text Label -10250 -3750 0    50   ~ 0
IDX1
Text Label -10250 -3850 0    50   ~ 0
IDX0
Text Label -10250 -3650 0    50   ~ 0
~COND
Wire Wire Line
	-9650 -2550 -10150 -2550
Text Label -10150 -2550 0    50   ~ 0
~µPC-INH
Wire Wire Line
	-5800 -3850 -5200 -3850
Text Label -5200 -3850 2    50   ~ 0
~COND
Wire Wire Line
	-4000 -3200 -3500 -3200
Text Label -3500 -3200 2    50   ~ 0
~µPC-INH
$Comp
L alexios:Jumper_3_Bridged12 JP103
U 1 1 6091E201
P -4150 -3200
F 0 "JP103" V -4150 -3133 50  0000 L CNN
F 1 "Jumper_3_Bridged12" H -4150 -3090 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H -4150 -3200 50  0001 C CNN
F 3 "~" H -4150 -3200 50  0001 C CNN
	1    -4150 -3200
	0    -1   1    0   
$EndComp
Wire Wire Line
	-4150 -3450 -4150 -3500
Wire Wire Line
	-4150 -3500 -4750 -3500
Wire Wire Line
	-4150 -2950 -4150 -2900
Wire Wire Line
	-4150 -2900 -4750 -2900
Text Label -4750 -3500 0    50   ~ 0
~WAITING
Text Label -4750 -2900 0    50   ~ 0
~WS
NoConn ~ -1050 -2800
Text Notes -1400 -2500 0    50   ~ 0
Pull-downs above are for testing\nCTL board without other boards.
$Comp
L power:GND #PWR0102
U 1 1 60407157
P -100 -3750
F 0 "#PWR0102" H -100 -4000 50  0001 C CNN
F 1 "GND" H -95 -3923 50  0000 C CNN
F 2 "" H -100 -3750 50  0001 C CNN
F 3 "" H -100 -3750 50  0001 C CNN
	1    -100 -3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-200 -4900 -100 -4900
Wire Wire Line
	-100 -5000 -100 -4900
Connection ~ -100 -5000
Wire Wire Line
	-200 -5000 -100 -5000
Wire Wire Line
	-100 -5100 -100 -5000
Connection ~ -100 -5100
Wire Wire Line
	-200 -5100 -100 -5100
Wire Wire Line
	-100 -5200 -100 -5100
Connection ~ -100 -5200
Wire Wire Line
	-200 -5200 -100 -5200
Wire Wire Line
	-100 -5300 -100 -5200
Connection ~ -100 -5300
Wire Wire Line
	-200 -5300 -100 -5300
Wire Wire Line
	-100 -5400 -100 -5300
Connection ~ -100 -5400
Wire Wire Line
	-200 -5400 -100 -5400
Wire Wire Line
	-100 -5500 -100 -5400
Connection ~ -100 -5500
Wire Wire Line
	-200 -5500 -100 -5500
Wire Wire Line
	-100 -5600 -100 -5500
Connection ~ -100 -5600
Wire Wire Line
	-200 -5600 -100 -5600
Wire Wire Line
	-100 -5800 -100 -5600
Connection ~ -100 -5800
Wire Wire Line
	-200 -5800 -100 -5800
Wire Wire Line
	-100 -5900 -100 -5800
Wire Wire Line
	-200 -5900 -100 -5900
$Comp
L Device:R_Small R110
U 1 1 601C6ACC
P -300 -4900
F 0 "R110" V -350 -4750 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -4900 50  0001 C CNN
F 3 "~" H -300 -4900 50  0001 C CNN
	1    -300 -4900
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R109
U 1 1 601C6AC6
P -300 -5000
F 0 "R109" V -350 -4850 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5000 50  0001 C CNN
F 3 "~" H -300 -5000 50  0001 C CNN
	1    -300 -5000
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R108
U 1 1 601B696E
P -300 -5100
F 0 "R108" V -350 -4950 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5250 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5100 50  0001 C CNN
F 3 "~" H -300 -5100 50  0001 C CNN
	1    -300 -5100
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R107
U 1 1 601B6968
P -300 -5200
F 0 "R107" V -350 -5050 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5200 50  0001 C CNN
F 3 "~" H -300 -5200 50  0001 C CNN
	1    -300 -5200
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R106
U 1 1 601A6784
P -300 -5300
F 0 "R106" V -350 -5150 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5300 50  0001 C CNN
F 3 "~" H -300 -5300 50  0001 C CNN
	1    -300 -5300
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R105
U 1 1 601A677E
P -300 -5400
F 0 "R105" V -350 -5250 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5550 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5400 50  0001 C CNN
F 3 "~" H -300 -5400 50  0001 C CNN
	1    -300 -5400
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R104
U 1 1 60196662
P -300 -5500
F 0 "R104" V -350 -5350 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5650 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5500 50  0001 C CNN
F 3 "~" H -300 -5500 50  0001 C CNN
	1    -300 -5500
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R103
U 1 1 6019665C
P -300 -5600
F 0 "R103" V -350 -5450 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5750 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5600 50  0001 C CNN
F 3 "~" H -300 -5600 50  0001 C CNN
	1    -300 -5600
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R102
U 1 1 60185C13
P -300 -5800
F 0 "R102" V -350 -5650 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5800 50  0001 C CNN
F 3 "~" H -300 -5800 50  0001 C CNN
	1    -300 -5800
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R101
U 1 1 6018580D
P -300 -5900
F 0 "R101" V -350 -5750 50  0000 C CNN
F 1 "4.7kΩ" V -400 -6050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5900 50  0001 C CNN
F 3 "~" H -300 -5900 50  0001 C CNN
	1    -300 -5900
	0    -1   1    0   
$EndComp
Wire Wire Line
	-1650 -5800 -400 -5800
Wire Wire Line
	-1650 -5900 -400 -5900
Wire Wire Line
	-1650 -5600 -400 -5600
Wire Wire Line
	-1650 -5500 -400 -5500
Wire Wire Line
	-1650 -5400 -400 -5400
Wire Wire Line
	-1650 -5300 -400 -5300
Wire Wire Line
	-1650 -5200 -400 -5200
Wire Wire Line
	-1650 -5100 -400 -5100
Wire Wire Line
	-1650 -5000 -400 -5000
Wire Wire Line
	-1650 -4900 -400 -4900
Wire Wire Line
	-1650 -6000 -1050 -6000
Text Notes -1000 -3500 0    50   ~ 0
Future expansion
Text Notes -1000 -3400 0    50   ~ 0
Future expansion
Text Notes -1000 -3300 0    50   ~ 0
Future expansion
Text Notes -1000 -3200 0    50   ~ 0
Future expansion
Text Notes -1000 -3100 0    50   ~ 0
Future expansion
Text Notes -1000 -3000 0    50   ~ 0
Future expansion
Connection ~ -100 -4900
Wire Wire Line
	-100 -4900 -100 -3750
Wire Bus Line
	11000 -5850 10150 -5850
Text Label 10150 -5850 0    50   ~ 0
IR[0..2]
Wire Wire Line
	11000 -6700 10150 -6700
Wire Wire Line
	11000 -6600 10150 -6600
Wire Wire Line
	11000 -6500 10150 -6500
Wire Wire Line
	11000 -6400 10150 -6400
Text Label 10150 -6700 0    50   ~ 0
~RSTHOLD
Text Label 10150 -6600 0    50   ~ 0
CLK2
Text Label 10150 -6500 0    50   ~ 0
CLK3
Text Label 10150 -6400 0    50   ~ 0
~T34
Wire Wire Line
	10150 -5550 11000 -5550
Text Label 10150 -5550 0    50   ~ 0
~FPCTX
Wire Bus Line
	12150 -5550 13000 -5550
Text Label 13000 -5550 2    50   ~ 0
FPD[0..7]
$Comp
L alexios:16V8 U2
U 1 1 608B34AB
P -10950 6150
F 0 "U2" H -10950 6900 50  0000 C CNN
F 1 "16V8" H -10950 6800 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -10950 6150 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -10950 6150 50  0001 C CNN
F 4 "CUWDEC00" V -10950 6150 50  0000 C CNB "Signature"
F 5 "ctl-waddr-decode.jed" H -10950 5500 50  0000 C CNN "Image Filename"
	1    -10950 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-11400 5000 -11850 5000
Wire Wire Line
	-11400 4800 -11850 4800
Wire Wire Line
	-11400 4900 -11850 4900
Wire Wire Line
	-11400 4700 -11850 4700
Wire Wire Line
	-11400 4600 -11850 4600
Text Label -11850 5000 0    50   ~ 0
RADDR0
Text Label -11850 4800 0    50   ~ 0
RADDR1
Text Label -11850 4900 0    50   ~ 0
RADDR2
Text Label -11850 4700 0    50   ~ 0
RADDR3
Text Label -11850 4600 0    50   ~ 0
RADDR4
Wire Wire Line
	-10000 4200 -10500 4200
Wire Wire Line
	-10000 4300 -10500 4300
Wire Wire Line
	-10000 4400 -10500 4400
Wire Wire Line
	-10000 4500 -10500 4500
Text Label -10000 4200 2    50   ~ 0
~READ-DR
Text Label -10000 4300 2    50   ~ 0
~READ-PC
Text Label -10000 4400 2    50   ~ 0
~READ-FL
Text Label -10000 4500 2    50   ~ 0
~READ-AGL
Wire Wire Line
	-11400 5900 -11850 5900
Wire Wire Line
	-11400 6000 -11850 6000
Wire Wire Line
	-11400 6100 -11850 6100
Wire Wire Line
	-11400 5700 -11850 5700
Wire Wire Line
	-11400 5800 -11850 5800
Wire Wire Line
	-11400 6600 -11850 6600
Text Label -11850 6600 0    50   ~ 0
CLK4
Text Label -11850 5900 0    50   ~ 0
WADDR2
Text Label -11850 6000 0    50   ~ 0
WADDR1
Text Label -11850 6100 0    50   ~ 0
WADDR0
Text Label -11850 5700 0    50   ~ 0
WADDR4
Text Label -11850 5800 0    50   ~ 0
WADDR3
Wire Wire Line
	-10000 5700 -10500 5700
Wire Wire Line
	-10000 5800 -10500 5800
Wire Wire Line
	-10000 5900 -10500 5900
Wire Wire Line
	-10000 6000 -10500 6000
Text Label -10000 5700 2    50   ~ 0
~WRITE-DR
Text Label -10000 5800 2    50   ~ 0
~WRITE-PC
Text Label -10000 5900 2    50   ~ 0
~WRITE-FL
Text Label -10000 6000 2    50   ~ 0
~WRITE-IR
NoConn ~ -11400 6200
NoConn ~ -11400 6300
NoConn ~ -11400 6400
NoConn ~ -11400 6500
$Comp
L alexios:16V8 U1
U 2 1 6184158E
P -9100 4800
F 0 "U1" H -8920 4846 50  0000 L CNN
F 1 "16V8" H -8920 4755 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -9100 4800 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -9100 4800 50  0001 C CNN
F 4 "CURDEC00" H -8920 4755 50  0001 L CNB "Signature"
F 5 "ctl-raddr-decode.jed" H -8920 4709 50  0001 L CNN "Image Filename"
	2    -9100 4800
	1    0    0    -1  
$EndComp
$Comp
L alexios:16V8 U2
U 2 1 61841B1E
P -9050 6000
F 0 "U2" H -8870 6046 50  0000 L CNN
F 1 "16V8" H -8870 5955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -9050 6000 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -9050 6000 50  0001 C CNN
F 4 "CUWDEC00" V -8650 5950 50  0001 C CNB "Signature"
F 5 "ctl-waddr-decode.jed" H -9050 5350 50  0001 C CNN "Image Filename"
	2    -9050 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61848C85
P -9400 5900
AR Path="/5CE16E65/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/61848C85" Ref="#PWR0137"  Part="1" 
AR Path="/5D54E677/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/61848C85" Ref="#PWR?"  Part="1" 
F 0 "#PWR0137" H -9400 5750 50  0001 C CNN
F 1 "+5V" H -9385 6073 50  0000 C CNN
F 2 "" H -9400 5900 50  0001 C CNN
F 3 "" H -9400 5900 50  0001 C CNN
	1    -9400 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61848C8B
P -9400 6100
AR Path="/5CE16E65/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/61848C8B" Ref="#PWR0138"  Part="1" 
AR Path="/5D54E677/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/61848C8B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0138" H -9400 5850 50  0001 C CNN
F 1 "GND" H -9395 5927 50  0000 C CNN
F 2 "" H -9400 6100 50  0001 C CNN
F 3 "" H -9400 6100 50  0001 C CNN
	1    -9400 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61848C91
P -9400 6000
AR Path="/5CC0D65F/61848C91" Ref="C?"  Part="1" 
AR Path="/5CE16E65/61848C91" Ref="C?"  Part="1" 
AR Path="/61848C91" Ref="C2"  Part="1" 
AR Path="/5D54E677/61848C91" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/61848C91" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/61848C91" Ref="C?"  Part="1" 
AR Path="/5D892D5E/61848C91" Ref="C?"  Part="1" 
AR Path="/5D9672D4/61848C91" Ref="C?"  Part="1" 
F 0 "C2" H -9491 6046 50  0000 R CNN
F 1 "100nF" H -9491 5955 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -9400 6000 50  0001 C CNN
F 3 "~" H -9400 6000 50  0001 C CNN
	1    -9400 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 618A940C
P -9450 4700
AR Path="/5CE16E65/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/618A940C" Ref="#PWR0139"  Part="1" 
AR Path="/5D54E677/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/618A940C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0139" H -9450 4550 50  0001 C CNN
F 1 "+5V" H -9435 4873 50  0000 C CNN
F 2 "" H -9450 4700 50  0001 C CNN
F 3 "" H -9450 4700 50  0001 C CNN
	1    -9450 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 618A9412
P -9450 4900
AR Path="/5CE16E65/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/618A9412" Ref="#PWR0140"  Part="1" 
AR Path="/5D54E677/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/618A9412" Ref="#PWR?"  Part="1" 
F 0 "#PWR0140" H -9450 4650 50  0001 C CNN
F 1 "GND" H -9445 4727 50  0000 C CNN
F 2 "" H -9450 4900 50  0001 C CNN
F 3 "" H -9450 4900 50  0001 C CNN
	1    -9450 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 618A9418
P -9450 4800
AR Path="/5CC0D65F/618A9418" Ref="C?"  Part="1" 
AR Path="/5CE16E65/618A9418" Ref="C?"  Part="1" 
AR Path="/618A9418" Ref="C1"  Part="1" 
AR Path="/5D54E677/618A9418" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/618A9418" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/618A9418" Ref="C?"  Part="1" 
AR Path="/5D892D5E/618A9418" Ref="C?"  Part="1" 
AR Path="/5D9672D4/618A9418" Ref="C?"  Part="1" 
F 0 "C1" H -9541 4846 50  0000 R CNN
F 1 "100nF" H -9541 4755 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -9450 4800 50  0001 C CNN
F 3 "~" H -9450 4800 50  0001 C CNN
	1    -9450 4800
	1    0    0    -1  
$EndComp
Connection ~ -9450 4900
Connection ~ -9450 4700
Connection ~ -9400 5900
Connection ~ -9400 6100
Wire Wire Line
	-11400 4200 -11850 4200
Text Label -11850 4200 0    50   ~ 0
~T34
Wire Wire Line
	-10500 4600 -10000 4600
Text Label -10000 4600 2    50   ~ 0
~READ-CS
NoConn ~ -11400 4300
NoConn ~ -11400 4400
NoConn ~ -11400 4500
NoConn ~ -11400 5100
NoConn ~ -11400 5200
$Comp
L Device:CP_Small C22
U 1 1 5EFD0822
P 20200 -1850
AR Path="/5EFD0822" Ref="C22"  Part="1" 
AR Path="/5D34E810/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5EFD0822" Ref="C?"  Part="1" 
F 0 "C22" H 20112 -1804 50  0000 R CNN
F 1 "47µF" H 20112 -1895 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 20200 -1850 50  0001 C CNN
F 3 "~" H 20200 -1850 50  0001 C CNN
	1    20200 -1850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C21
U 1 1 5DF0FF8F
P 19750 -1850
AR Path="/5DF0FF8F" Ref="C21"  Part="1" 
AR Path="/5D34E810/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF8F" Ref="C?"  Part="1" 
F 0 "C21" H 19662 -1804 50  0000 R CNN
F 1 "47µF" H 19662 -1895 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 19750 -1850 50  0001 C CNN
F 3 "~" H 19750 -1850 50  0001 C CNN
	1    19750 -1850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C20
U 1 1 5DF0FFA3
P 19300 -1850
AR Path="/5DF0FFA3" Ref="C20"  Part="1" 
AR Path="/5D34E810/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FFA3" Ref="C?"  Part="1" 
F 0 "C20" H 19212 -1804 50  0000 R CNN
F 1 "47µF" H 19212 -1895 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 19300 -1850 50  0001 C CNN
F 3 "~" H 19300 -1850 50  0001 C CNN
	1    19300 -1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8500 -1950 -7900 -1950
Text Label -7900 -1950 2    50   ~ 0
~READ-FL
Text Label -7550 -1850 0    50   ~ 0
CLK3
Wire Wire Line
	-6950 -1850 -7550 -1850
Wire Wire Line
	-5800 -1550 -5200 -1550
Wire Wire Line
	-5800 -1450 -5200 -1450
Wire Wire Line
	-5800 -1350 -5200 -1350
Text Label -5200 -1550 2    50   ~ 0
~INCPC
Text Label -5200 -1450 2    50   ~ 0
~INCDR
Text Label -5200 -1350 2    50   ~ 0
~DECDR
Text Label -5200 -1750 2    50   ~ 0
~IR-IDX
$Sheet
S -6950 -2050 1150 1050
U 5F67D4B5
F0 "Interrupt State Machine" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L -6950 -1100 50 
F3 "~RESET" I L -6950 -1950 50 
F4 "FI" O R -5800 -1950 50 
F5 "~IRQS" O R -5800 -1200 50 
F6 "~END" I L -6950 -1250 50 
F7 "CLK4" I L -6950 -1750 50 
F8 "~IRQSµC" O R -5800 -1100 50 
F9 "IBUS15" I L -6950 -1450 50 
F10 "~WRITE-FL" I L -6950 -1350 50 
F11 "ACTION[0..3]" I L -6950 -1650 50 
F12 "~IR-IDX" O R -5800 -1750 50 
F13 "~ACTION-INCPC" O R -5800 -1550 50 
F14 "~ACTION-DECDR" O R -5800 -1350 50 
F15 "~ACTION-INCDR" O R -5800 -1450 50 
F16 "CLK3" I L -6950 -1850 50 
F17 "IDXEN" I R -5800 -1850 50 
$EndSheet
Text Label -5200 -1850 2    50   ~ 0
~IDXEN
Wire Wire Line
	-5800 -1850 -4900 -1850
Wire Wire Line
	-4900 -4550 -4900 -1850
Wire Wire Line
	-5800 -1750 -5200 -1750
$Comp
L alexios:16V8 U1
U 1 1 60850EA3
P -10950 4650
F 0 "U1" H -10950 5400 50  0000 C CNN
F 1 "16V8" H -10950 5300 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -10950 4650 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -10950 4650 50  0001 C CNN
F 4 "CURDEC00" V -10950 4650 50  0000 C CNB "Signature"
F 5 "ctl-raddr-decode.jed" H -10950 4000 50  0000 C CNN "Image Filename"
	1    -10950 4650
	1    0    0    -1  
$EndComp
NoConn ~ -10500 4900
NoConn ~ -10500 4800
NoConn ~ -10500 4700
Wire Wire Line
	-10500 6100 -10000 6100
Wire Wire Line
	-10500 6200 -10000 6200
Wire Wire Line
	-10500 6300 -10000 6300
Text Label -10000 6100 2    50   ~ 0
XORY
Text Label -10000 6200 2    50   ~ 0
XORB
Text Label -10000 6300 2    50   ~ 0
XORA
NoConn ~ -10500 6400
$Comp
L alexios:CFT-2021-Peripheral-Bus P2
U 1 1 60987323
P -2050 3750
F 0 "P2" H -2050 3917 50  0000 C CNN
F 1 "CFT-2021-Peripheral-Bus" H -2050 3826 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H -2175 2875 50  0001 C CNN
F 3 "" H -2175 2875 50  0001 C CNN
	1    -2050 3750
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 2 1 609EF5BD
P -4150 3750
F 0 "P1" H -4150 3917 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H -4150 3826 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H -4200 2850 50  0001 C CNN
F 3 "" H -4200 2850 50  0001 C CNN
	2    -4150 3750
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 1 1 60A3E373
P -6400 3750
F 0 "P1" H -6400 3917 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H -6400 3826 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H -6450 2850 50  0001 C CNN
F 3 "" H -6450 2850 50  0001 C CNN
	1    -6400 3750
	1    0    0    -1  
$EndComp
Text Label -5450 4050 2    50   ~ 0
~END
Wire Wire Line
	-5800 4050 -5450 4050
Text Label -7350 6750 0    50   ~ 0
~WRITE-FL
Text Label -7350 6650 0    50   ~ 0
FN
Text Label -7350 6550 0    50   ~ 0
FZ
Text Label -7350 6450 0    50   ~ 0
FL
Text Label -7350 6350 0    50   ~ 0
FV
Text Label -7350 6150 0    50   ~ 0
IBUS15
Text Label -7350 6050 0    50   ~ 0
IBUS14
Text Label -7350 5950 0    50   ~ 0
IBUS13
Text Label -7350 5850 0    50   ~ 0
IBUS12
Text Label -7350 5750 0    50   ~ 0
IBUS11
Text Label -7350 5650 0    50   ~ 0
IBUS10
Text Label -7350 5550 0    50   ~ 0
IBUS9
Text Label -7350 5450 0    50   ~ 0
IBUS8
Text Label -7350 5350 0    50   ~ 0
IBUS7
Text Label -7350 5250 0    50   ~ 0
IBUS6
Text Label -7350 5150 0    50   ~ 0
IBUS5
Text Label -7350 5050 0    50   ~ 0
IBUS4
Text Label -7350 4950 0    50   ~ 0
IBUS3
Text Label -7350 4850 0    50   ~ 0
IBUS2
Text Label -7350 4750 0    50   ~ 0
IBUS1
Text Label -7350 4650 0    50   ~ 0
IBUS0
Text Label -7350 4450 0    50   ~ 0
T34
Text Label -7350 4350 0    50   ~ 0
CLK4
Text Label -7350 4250 0    50   ~ 0
CLK3
Text Label -7350 4150 0    50   ~ 0
CLK2
Text Label -7350 4050 0    50   ~ 0
CLK1
Wire Wire Line
	-5700 6750 -5700 6850
Wire Wire Line
	-5800 6750 -5700 6750
$Comp
L power:GND #PWR0131
U 1 1 61C7A92A
P -5700 6850
F 0 "#PWR0131" H -5700 6600 50  0001 C CNN
F 1 "GND" H -5695 6677 50  0000 C CNN
F 2 "" H -5700 6850 50  0001 C CNN
F 3 "" H -5700 6850 50  0001 C CNN
	1    -5700 6850
	1    0    0    -1  
$EndComp
Text Label -5450 6450 2    50   ~ 0
COND3
Text Label -5450 6350 2    50   ~ 0
COND2
Text Label -5450 6250 2    50   ~ 0
COND1
Text Label -5450 6150 2    50   ~ 0
COND0
Text Label -5450 5950 2    50   ~ 0
ACTION3
Text Label -5450 5850 2    50   ~ 0
ACTION2
Text Label -5450 5750 2    50   ~ 0
ACTION1
Text Label -5450 5650 2    50   ~ 0
ACTION0
Text Label -5450 5450 2    50   ~ 0
WADDR4
Text Label -5450 5350 2    50   ~ 0
WADDR3
Text Label -5450 5250 2    50   ~ 0
WADDR2
Text Label -5450 5150 2    50   ~ 0
WADDR1
Text Label -5450 5050 2    50   ~ 0
WADDR0
Text Label -5450 4850 2    50   ~ 0
RADDR4
Text Label -5450 4750 2    50   ~ 0
RADDR3
Text Label -5450 4650 2    50   ~ 0
RADDR2
Text Label -5450 4550 2    50   ~ 0
RADDR1
Text Label -5450 4450 2    50   ~ 0
RADDR0
Wire Wire Line
	-7050 3850 -7050 3800
Wire Wire Line
	-7000 3850 -7050 3850
$Comp
L power:+5V #PWR0129
U 1 1 60E723B0
P -7050 3800
F 0 "#PWR0129" H -7050 3650 50  0001 C CNN
F 1 "+5V" H -7035 3973 50  0000 C CNN
F 2 "" H -7050 3800 50  0001 C CNN
F 3 "" H -7050 3800 50  0001 C CNN
	1    -7050 3800
	1    0    0    -1  
$EndComp
Text Label -5450 4250 2    50   ~ 0
~SKIPEXT
Text Label -5450 4150 2    50   ~ 0
~ENDEXT
Wire Wire Line
	-7350 4050 -7000 4050
Wire Wire Line
	-7350 4150 -7000 4150
Wire Wire Line
	-7350 4250 -7000 4250
Wire Wire Line
	-7350 4350 -7000 4350
Wire Wire Line
	-7350 4450 -7000 4450
Wire Wire Line
	-7350 4650 -7000 4650
Wire Wire Line
	-7350 4750 -7000 4750
Wire Wire Line
	-7350 4850 -7000 4850
Wire Wire Line
	-7350 4950 -7000 4950
Wire Wire Line
	-7350 5050 -7000 5050
Wire Wire Line
	-7350 5150 -7000 5150
Wire Wire Line
	-7350 5250 -7000 5250
Wire Wire Line
	-7350 5350 -7000 5350
Wire Wire Line
	-7350 5450 -7000 5450
Wire Wire Line
	-7350 5550 -7000 5550
Wire Wire Line
	-7350 5650 -7000 5650
Wire Wire Line
	-7350 5750 -7000 5750
Wire Wire Line
	-7350 5850 -7000 5850
Wire Wire Line
	-7350 5950 -7000 5950
Wire Wire Line
	-7350 6050 -7000 6050
Wire Wire Line
	-7350 6150 -7000 6150
Wire Wire Line
	-7350 6350 -7000 6350
Wire Wire Line
	-7350 6450 -7000 6450
Wire Wire Line
	-7350 6550 -7000 6550
Wire Wire Line
	-7350 6650 -7000 6650
Wire Wire Line
	-7350 6750 -7000 6750
Wire Wire Line
	-5800 4150 -5450 4150
Wire Wire Line
	-5800 4250 -5450 4250
Wire Wire Line
	-5800 4450 -5450 4450
Wire Wire Line
	-5800 4550 -5450 4550
Wire Wire Line
	-5800 4650 -5450 4650
Wire Wire Line
	-5800 4750 -5450 4750
Wire Wire Line
	-5800 4850 -5450 4850
Wire Wire Line
	-5800 5050 -5450 5050
Wire Wire Line
	-5800 5150 -5450 5150
Wire Wire Line
	-5800 5250 -5450 5250
Wire Wire Line
	-5800 5350 -5450 5350
Wire Wire Line
	-5800 5450 -5450 5450
Wire Wire Line
	-5800 5650 -5450 5650
Wire Wire Line
	-5800 5750 -5450 5750
Wire Wire Line
	-5800 5850 -5450 5850
Wire Wire Line
	-5800 5950 -5450 5950
Wire Wire Line
	-5800 6150 -5450 6150
Wire Wire Line
	-5800 6250 -5450 6250
Wire Wire Line
	-5800 6350 -5450 6350
Wire Wire Line
	-5800 6450 -5450 6450
Wire Wire Line
	-5250 4650 -4750 4650
Wire Wire Line
	-5250 4550 -4750 4550
Wire Wire Line
	-5250 4450 -4750 4450
Wire Wire Line
	-5250 4250 -4750 4250
Wire Wire Line
	-5250 4150 -4750 4150
Wire Wire Line
	-5250 4050 -4750 4050
Wire Wire Line
	-5250 3950 -4750 3950
Wire Wire Line
	-5250 3850 -4750 3850
Wire Wire Line
	-5250 5350 -4750 5350
Wire Wire Line
	-5250 5250 -4750 5250
Wire Wire Line
	-5250 5150 -4750 5150
Wire Wire Line
	-5250 5050 -4750 5050
Wire Wire Line
	-5250 4950 -4750 4950
Wire Wire Line
	-5250 4850 -4750 4850
Wire Wire Line
	-5250 4750 -4750 4750
Wire Wire Line
	-4750 5450 -5250 5450
Wire Wire Line
	-4750 5550 -5250 5550
Wire Wire Line
	-4750 5650 -5250 5650
Wire Wire Line
	-4750 5750 -5250 5750
Wire Wire Line
	-4750 5850 -5250 5850
Wire Wire Line
	-5800 3850 -5450 3850
Text Label -5450 3850 2    50   ~ 0
16MHz
NoConn ~ -5800 6650
Wire Wire Line
	-5250 4350 -4750 4350
Wire Bus Line
	2450 -4900 2450 -4100
Wire Bus Line
	-1200 -6850 -1200 -6200
Wire Bus Line
	-10350 -3450 -10350 -2650
Text Label -5250 5050 0    50   ~ 0
~FPAEXT
$EndSCHEMATC
