EESchema Schematic File Version 4
LIBS:cft-alu-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 8
Title "CFT Homebrew 16-bit Minicomputer"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1450 2500 1150 2100
U 5DC89E19
F0 "ALU" 50
F1 "alu.sch" 50
F2 "IBUS[0..15]" T R 2600 2650 50 
F3 "RADDR[0..4]" I L 1450 3150 50 
F4 "~RUEN" I L 1450 3050 50 
F5 "CLK4" I L 1450 2850 50 
F6 "AC[0..15]" I L 1450 3950 50 
F7 "FLOUT" I R 2600 3750 50 
F8 "FLFAST" I L 1450 3750 50 
F9 "CLK2" I L 1450 2750 50 
F10 "IR[0..6]" I L 1450 3850 50 
F11 "~RESET" I L 1450 2650 50 
F12 "FLCP" I R 2600 3850 50 
F13 "WADDR[0..4]" I L 1450 3450 50 
F14 "~WUEN" I L 1450 3350 50 
F15 "FV" I R 2600 3950 50 
F16 "~ACTION-SRU" I L 1450 3550 50 
F17 "FVCP" O R 2600 4050 50 
$EndSheet
$Sheet
S 5050 4050 1150 1100
U 5D35C694
F0 "Overflow Register (V)" 50
F1 "cft_reg_v_2019.sch" 50
F2 "FV" O R 6200 4200 50 
F3 "~READ-ALU-ADD" I L 5050 4550 50 
F4 "CLK4" I L 5050 4350 50 
F5 "~RESET" I L 5050 4200 50 
F6 "IBUS13" I L 5050 4950 50 
F7 "FVIN-ADD" I L 5050 4650 50 
F8 "~FLAGWE" I L 5050 4850 50 
$EndSheet
$Sheet
S 5050 2100 1150 1650
U 5D121AA3
F0 "Link Register (L)" 50
F1 "cft_reg_l_2019.sch" 50
F2 "FL" O R 6200 2250 50 
F3 "CLK4" I L 5050 2400 50 
F4 "~FLAGWE" I L 5050 3150 50 
F5 "~READ-ALU-ADD" I L 5050 2650 50 
F6 "FLIN-SRU" I L 5050 3000 50 
F7 "FLIN-ADD" I L 5050 2750 50 
F8 "IBUS12" I L 5050 3250 50 
F9 "BCP" I L 5050 2900 50 
F10 "~RESET" I L 5050 2250 50 
F11 "FLFAST" O R 6200 2900 50 
F12 "WSTB" I L 5050 2500 50 
F13 "ACTION[0..3]" I L 5050 3400 50 
F14 "~ACTION-SRU" O R 6200 3000 50 
$EndSheet
Text Notes 5750 5000 0    70   ~ 14
Verilog
Text Notes 5700 3600 0    70   ~ 14
Verilog
$Sheet
S 8550 1850 1150 4200
U 5D34E810
F0 "Left Edge Connector" 50
F1 "bus.sch" 50
F2 "AB[0..23]" U L 8550 2600 50 
F3 "DB[0..15]" U L 8550 2700 50 
F4 "FPD[0..7]" U L 8550 3000 50 
F5 "IBUS[0..15]" U L 8550 2000 50 
F6 "~RESET" U L 8550 2100 50 
F7 "CLK1" U L 8550 2200 50 
F8 "CLK2" U L 8550 2300 50 
F9 "CLK3" U L 8550 2400 50 
F10 "CLK4" U L 8550 2500 50 
F11 "WSTB" U L 8550 2800 50 
F12 "T34" U L 8550 2900 50 
F13 "~IRQ" U L 8550 3100 50 
F14 "~IRQS" U L 8550 3200 50 
F15 "~IRQ[0..7]" U L 8550 3300 50 
F16 "~RSTHOLD" U L 8550 3400 50 
F17 "~SYSDEV" U L 8550 3500 50 
F18 "~IODEV1xx" U L 8550 3600 50 
F19 "~IODEV2xx" U L 8550 3700 50 
F20 "~IODEV3xx" U L 8550 3800 50 
F21 "~MEM" U L 8550 3900 50 
F22 "~IO" U L 8550 4000 50 
F23 "~R" U L 8550 4100 50 
F24 "~W" U L 8550 4200 50 
F25 "~WS" U L 8550 4300 50 
F26 "~ENDEXT" U L 8550 4400 50 
F27 "~SKIPEXT" U L 8550 4500 50 
F28 "~HALT" U L 8550 4600 50 
F29 "ACTION[0..3]" U L 8550 4700 50 
F30 "WADDR[0..4]" U L 8550 4800 50 
F31 "RADDR[0..4]" U L 8550 4900 50 
F32 "RSVD[0..8]" U L 8550 5000 50 
F33 "C1" U R 9700 2000 50 
F34 "C2" U R 9700 2100 50 
F35 "C3" U R 9700 2200 50 
F36 "C4" U R 9700 2300 50 
F37 "C5" U R 9700 2400 50 
F38 "C6" U R 9700 2500 50 
F39 "C7" U R 9700 2600 50 
F40 "C8" U R 9700 2700 50 
F41 "C9" U R 9700 2800 50 
F42 "C10" U R 9700 2900 50 
F43 "C11" U R 9700 3000 50 
F44 "C12" U R 9700 3100 50 
F45 "C13" U R 9700 3200 50 
F46 "C14" U R 9700 3300 50 
F47 "C15" U R 9700 3400 50 
F48 "C16" U R 9700 3500 50 
F49 "C17" U R 9700 3600 50 
F50 "C18" U R 9700 3700 50 
F51 "C19" U R 9700 3800 50 
F52 "C20" U R 9700 3900 50 
F53 "C21" U R 9700 4000 50 
F54 "C22" U R 9700 4100 50 
F55 "C23" U R 9700 4200 50 
F56 "C24" U R 9700 4300 50 
F57 "C25" U R 9700 4400 50 
F58 "C26" U R 9700 4500 50 
F59 "C27" U R 9700 4600 50 
F60 "C28" U R 9700 4700 50 
F61 "C29" U R 9700 4800 50 
F62 "C30" U R 9700 4900 50 
F63 "C31" U R 9700 5000 50 
F64 "C32" U R 9700 5100 50 
F65 "C33" U R 9700 5200 50 
F66 "C34" U R 9700 5300 50 
F67 "C35" U R 9700 5400 50 
F68 "C36" U R 9700 5500 50 
F69 "C37" U R 9700 5600 50 
F70 "C38" U R 9700 5700 50 
F71 "C39" U R 9700 5800 50 
F72 "C40" U R 9700 5900 50 
$EndSheet
Wire Bus Line
	8550 2600 8000 2600
Wire Bus Line
	8550 2700 8000 2700
Text Label 8000 2600 0    50   ~ 0
AB[0..23]
Text Label 8000 2700 0    50   ~ 0
DB[0..15]
Wire Bus Line
	8000 3000 8550 3000
Text Label 8000 3000 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	8550 2200 8000 2200
Wire Wire Line
	8550 2300 8000 2300
Wire Wire Line
	8550 2400 8000 2400
Wire Wire Line
	8550 2500 8000 2500
Wire Wire Line
	8550 2100 8000 2100
Wire Wire Line
	8550 3400 8000 3400
Wire Wire Line
	8550 3500 8000 3500
Wire Wire Line
	8550 3600 8000 3600
Wire Wire Line
	8550 3100 8000 3100
Wire Wire Line
	8550 3900 8000 3900
Wire Wire Line
	8550 4000 8000 4000
Wire Wire Line
	8550 4100 8000 4100
Wire Wire Line
	8550 4200 8000 4200
Wire Wire Line
	8550 3800 8000 3800
Wire Wire Line
	8550 3700 8000 3700
Wire Wire Line
	8550 4500 8000 4500
Wire Wire Line
	8550 4600 8000 4600
Wire Wire Line
	8550 4400 8000 4400
Wire Wire Line
	8550 4300 8000 4300
Wire Bus Line
	8000 3300 8550 3300
Text Label 8000 3300 0    50   ~ 0
~IRQ[0..7]
Text Label 8000 3100 0    50   ~ 0
~IRQ
Wire Wire Line
	8550 2800 8000 2800
Wire Wire Line
	8550 2900 8000 2900
Wire Bus Line
	8000 2000 8550 2000
Text Label 8000 2000 0    50   ~ 0
IBUS[0..15]
Text Label 8000 2100 0    50   ~ 0
~RESET
Text Label 8000 2200 0    50   ~ 0
CLK1
Text Label 8000 2300 0    50   ~ 0
CLK2
Text Label 8000 2400 0    50   ~ 0
CLK3
Text Label 8000 2500 0    50   ~ 0
CLK4
Text Label 8000 2800 0    50   ~ 0
WSTB
Text Label 8000 2900 0    50   ~ 0
T34
Wire Wire Line
	8550 3200 8000 3200
Text Label 8000 3200 0    50   ~ 0
~IRQS
Text Label 8000 3400 0    50   ~ 0
~RSTHOLD
Text Label 8000 3500 0    50   ~ 0
~SYSDEV
Text Label 8000 3600 0    50   ~ 0
~IODEV1xx
Text Label 8000 3700 0    50   ~ 0
~IODEV2xx
Text Label 8000 3800 0    50   ~ 0
~IODEV3xx
Text Label 8000 3900 0    50   ~ 0
~MEM
Text Label 8000 4000 0    50   ~ 0
~IO
Text Label 8000 4100 0    50   ~ 0
~R
Text Label 8000 4300 0    50   ~ 0
~WS
Text Label 8000 4400 0    50   ~ 0
~ENDEXT
Text Label 8000 4500 0    50   ~ 0
~SKIPEXT
Text Label 8000 4600 0    50   ~ 0
~HALT
Text Label 8000 4700 0    50   ~ 0
ACTION[0..3]
Text Label 8000 4800 0    50   ~ 0
WADDR[0..4]
Text Label 8000 4900 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	8550 4700 8000 4700
Wire Bus Line
	8550 4800 8000 4800
Wire Bus Line
	8550 4900 8000 4900
Wire Bus Line
	8000 5000 8550 5000
Text Label 8000 5000 0    50   ~ 0
RSVD[0..8]
Text Notes 9300 3850 1    100  ~ 20
Left Slot
Text Label 8000 4200 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5D8B16F5
P 6750 7050
AR Path="/5F67D4B5/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16F5" Ref="#PWR02"  Part="1" 
AR Path="/5D34E810/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 6750 6900 50  0001 C CNN
F 1 "+5V" H 6692 7087 50  0000 R CNN
F 2 "" H 6750 7050 50  0001 C CNN
F 3 "" H 6750 7050 50  0001 C CNN
	1    6750 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8B16FB
P 6750 7450
AR Path="/5F67D4B5/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16FB" Ref="#PWR04"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 6750 7200 50  0001 C CNN
F 1 "GND" H 6672 7413 50  0000 R CNN
F 2 "" H 6750 7450 50  0001 C CNN
F 3 "" H 6750 7450 50  0001 C CNN
	1    6750 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 7050 6750 7150
$Comp
L Device:CP_Small C2
U 1 1 5D8B1702
P 6750 7250
AR Path="/5D8B1702" Ref="C2"  Part="1" 
AR Path="/5D34E810/5D8B1702" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8B1702" Ref="C?"  Part="1" 
F 0 "C2" H 6662 7296 50  0000 R CNN
F 1 "47µF" H 6662 7205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6750 7250 50  0001 C CNN
F 3 "~" H 6750 7250 50  0001 C CNN
	1    6750 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 7350 6750 7450
$Comp
L power:+5V #PWR?
U 1 1 5D8C8446
P 6300 7050
AR Path="/5F67D4B5/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D8C8446" Ref="#PWR01"  Part="1" 
AR Path="/5D34E810/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8446" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 6300 6900 50  0001 C CNN
F 1 "+5V" H 6242 7087 50  0000 R CNN
F 2 "" H 6300 7050 50  0001 C CNN
F 3 "" H 6300 7050 50  0001 C CNN
	1    6300 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8C844C
P 6300 7450
AR Path="/5F67D4B5/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D8C844C" Ref="#PWR03"  Part="1" 
AR Path="/5D34E810/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C844C" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 6300 7200 50  0001 C CNN
F 1 "GND" H 6222 7413 50  0000 R CNN
F 2 "" H 6300 7450 50  0001 C CNN
F 3 "" H 6300 7450 50  0001 C CNN
	1    6300 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 7050 6300 7150
$Comp
L Device:CP_Small C1
U 1 1 5D8C8453
P 6300 7250
AR Path="/5D8C8453" Ref="C1"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C1" H 6212 7296 50  0000 R CNN
F 1 "47µF" H 6212 7205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6300 7250 50  0001 C CNN
F 3 "~" H 6300 7250 50  0001 C CNN
	1    6300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 7350 6300 7450
Text Notes 8900 1000 0    197  ~ 39
Card Edge
Text Label 10200 4200 2    50   ~ 0
AC0
Text Label 10200 4300 2    50   ~ 0
AC1
Text Label 10200 4400 2    50   ~ 0
AC2
Text Label 10200 4500 2    50   ~ 0
AC3
Text Label 10200 4600 2    50   ~ 0
AC4
Text Label 10200 4700 2    50   ~ 0
AC5
Text Label 10200 4800 2    50   ~ 0
AC6
Text Label 10200 4900 2    50   ~ 0
AC7
Text Label 10200 5000 2    50   ~ 0
AC8
Text Label 10200 5100 2    50   ~ 0
AC9
Text Label 10200 5200 2    50   ~ 0
AC10
Text Label 10200 5300 2    50   ~ 0
AC11
Text Label 10200 5400 2    50   ~ 0
AC12
Text Label 10200 5500 2    50   ~ 0
AC13
Text Label 10200 5600 2    50   ~ 0
AC14
Text Label 10200 5700 2    50   ~ 0
AC15
Wire Wire Line
	9700 4200 10200 4200
Wire Wire Line
	9700 4300 10200 4300
Wire Wire Line
	9700 4400 10200 4400
Wire Wire Line
	9700 4500 10200 4500
Wire Wire Line
	9700 4600 10200 4600
Wire Wire Line
	9700 4700 10200 4700
Wire Wire Line
	9700 4800 10200 4800
Wire Wire Line
	9700 4900 10200 4900
Wire Wire Line
	9700 5000 10200 5000
Wire Wire Line
	9700 5100 10200 5100
Wire Wire Line
	9700 5200 10200 5200
Wire Wire Line
	9700 5300 10200 5300
Wire Wire Line
	9700 5400 10200 5400
Wire Wire Line
	9700 5500 10200 5500
Wire Wire Line
	9700 5600 10200 5600
Wire Wire Line
	9700 5700 10200 5700
Wire Wire Line
	9700 5800 10200 5800
Wire Wire Line
	9700 5900 10200 5900
NoConn ~ 8000 2200
NoConn ~ 8000 2400
NoConn ~ 8000 2600
NoConn ~ 8000 2700
NoConn ~ 8000 2900
NoConn ~ 8000 3100
NoConn ~ 8000 3200
NoConn ~ 8000 3300
NoConn ~ 8000 3400
NoConn ~ 8000 3500
NoConn ~ 8000 3600
NoConn ~ 8000 3700
NoConn ~ 8000 3800
NoConn ~ 8000 3900
NoConn ~ 8000 4000
NoConn ~ 8000 4100
NoConn ~ 8000 4200
NoConn ~ 8000 4300
NoConn ~ 8000 4400
NoConn ~ 8000 4500
NoConn ~ 8000 4600
NoConn ~ 8000 5000
Text Notes 7050 6950 0    197  ~ 39
Arithmetic & Logic (ALU)
Wire Wire Line
	9700 3000 10200 3000
Wire Wire Line
	9700 3100 10200 3100
Wire Wire Line
	9700 3200 10200 3200
Wire Wire Line
	9700 3300 10200 3300
Wire Wire Line
	9700 3400 10200 3400
Wire Wire Line
	9700 3500 10200 3500
Wire Wire Line
	9700 3600 10200 3600
Wire Wire Line
	9700 3700 10200 3700
NoConn ~ 10200 3900
NoConn ~ 10200 3800
NoConn ~ 10200 3700
NoConn ~ 10200 2900
Wire Wire Line
	9700 4000 10200 4000
Wire Wire Line
	9700 3900 10200 3900
Wire Wire Line
	9700 3800 10200 3800
Wire Wire Line
	9700 2900 10200 2900
Wire Wire Line
	9700 2800 10200 2800
Wire Wire Line
	9700 2700 10200 2700
NoConn ~ 10200 4000
Wire Wire Line
	9700 4100 10200 4100
NoConn ~ 10200 4100
Text Notes 10450 5250 1    50   ~ 0
Input From REG Board
NoConn ~ 10200 3000
NoConn ~ 10200 3100
NoConn ~ 10200 3200
NoConn ~ 10200 3300
NoConn ~ 10200 3400
NoConn ~ 10200 3500
NoConn ~ 10200 3600
Wire Bus Line
	3150 2650 2600 2650
Text Label 3150 2650 2    50   ~ 0
IBUS[0..15]
Entry Wire Line
	10200 4200 10300 4300
Entry Wire Line
	10200 4300 10300 4400
Entry Wire Line
	10200 4400 10300 4500
Entry Wire Line
	10200 4500 10300 4600
Entry Wire Line
	10200 4600 10300 4700
Entry Wire Line
	10200 4700 10300 4800
Entry Wire Line
	10200 4800 10300 4900
Entry Wire Line
	10200 4900 10300 5000
Entry Wire Line
	10200 5000 10300 5100
Entry Wire Line
	10200 5100 10300 5200
Entry Wire Line
	10200 5200 10300 5300
Entry Wire Line
	10200 5300 10300 5400
Entry Wire Line
	10200 5400 10300 5500
Entry Wire Line
	10200 5500 10300 5600
Entry Wire Line
	10200 5600 10300 5700
Entry Wire Line
	10200 5700 10300 5800
Text Label 10450 4200 0    50   ~ 0
AC[0..15]
Wire Bus Line
	10400 4200 10800 4200
Entry Bus Bus
	10300 4300 10400 4200
Wire Bus Line
	900  3950 1450 3950
Text Label 900  3950 0    50   ~ 0
AC[0..15]
Wire Wire Line
	9700 2000 10200 2000
Wire Wire Line
	9700 2100 10200 2100
Wire Wire Line
	9700 2200 10200 2200
Wire Wire Line
	9700 2300 10200 2300
Wire Wire Line
	9700 2400 10200 2400
Wire Wire Line
	9700 2500 10200 2500
Wire Wire Line
	9700 2600 10200 2600
Text Label 10200 2000 2    50   ~ 0
IR0
Text Label 10200 2100 2    50   ~ 0
IR1
Text Label 10200 2200 2    50   ~ 0
IR2
Text Label 10200 2300 2    50   ~ 0
IR3
Text Label 10200 2400 2    50   ~ 0
IR4
Text Label 10200 2500 2    50   ~ 0
IR5
Text Label 10200 2600 2    50   ~ 0
IR6
Entry Wire Line
	10200 2600 10300 2500
Entry Wire Line
	10200 2500 10300 2400
Entry Wire Line
	10200 2400 10300 2300
Entry Wire Line
	10200 2300 10300 2200
Entry Wire Line
	10200 2200 10300 2100
Entry Wire Line
	10200 2100 10300 2000
Entry Wire Line
	10200 2000 10300 1900
Entry Bus Bus
	10300 1850 10400 1750
Wire Bus Line
	10400 1750 10700 1750
Text Label 10700 1750 2    50   ~ 0
IR[0..6]
Wire Bus Line
	900  3850 1450 3850
Text Label 900  3850 0    50   ~ 0
IR[0..6]
Wire Wire Line
	5050 2250 4500 2250
Text Label 4500 2250 0    50   ~ 0
~RESET
Wire Wire Line
	5050 4200 4500 4200
Text Label 4500 4200 0    50   ~ 0
~RESET
Wire Wire Line
	5050 4350 4500 4350
Text Label 4500 4350 0    50   ~ 0
CLK4
Wire Wire Line
	5050 2400 4500 2400
Text Label 4500 2400 0    50   ~ 0
CLK4
Wire Wire Line
	5050 2500 4500 2500
Text Label 4500 2500 0    50   ~ 0
WSTB
Wire Wire Line
	5050 3250 4500 3250
Text Label 4500 3250 0    50   ~ 0
IBUS12
Wire Wire Line
	5050 4950 4500 4950
Text Label 4500 4950 0    50   ~ 0
IBUS13
Wire Wire Line
	5050 3150 4500 3150
Text Label 4500 3150 0    50   ~ 0
~FLAGWE
Text Label 4500 4850 0    50   ~ 0
~FLAGWE
Wire Wire Line
	4500 4850 5050 4850
Text Label 10200 5900 2    50   ~ 0
~FLAGWE
Wire Wire Line
	1450 2650 900  2650
Text Label 900  2650 0    50   ~ 0
~RESET
Wire Wire Line
	1450 2750 900  2750
Text Label 900  2750 0    50   ~ 0
CLK2
Wire Wire Line
	1450 2850 900  2850
Text Label 900  2850 0    50   ~ 0
CLK4
NoConn ~ 10200 5800
Text Label 10200 2700 2    50   ~ 0
~RUEN
Text Label 10200 2800 2    50   ~ 0
~WUEN
Wire Wire Line
	1450 3350 900  3350
Text Label 900  3350 0    50   ~ 0
~WUEN
Wire Wire Line
	900  3050 1450 3050
Text Label 900  3050 0    50   ~ 0
~RUEN
Wire Bus Line
	900  3150 1450 3150
Text Label 900  3150 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	900  3450 1450 3450
Text Label 900  3450 0    50   ~ 0
WADDR[0..4]
Text Label 10200 2900 2    50   ~ 0
FL
Text Label 10200 3000 2    50   ~ 0
FV
Text Notes 10400 2900 0    50   ~ 0
→ Control Unit
Text Notes 10400 3000 0    50   ~ 0
→ Control Unit
Text Notes 10400 2800 0    50   ~ 0
← Control Unit
Text Notes 10400 2700 0    50   ~ 0
← Control Unit
Text Notes 10400 2600 0    50   ~ 0
← Control Unit
Text Notes 10400 2500 0    50   ~ 0
← Control Unit
Text Notes 10400 2400 0    50   ~ 0
← Control Unit
Text Notes 10400 2300 0    50   ~ 0
← Control Unit
Text Notes 10400 2200 0    50   ~ 0
← Control Unit
Text Notes 10400 2100 0    50   ~ 0
← Control Unit
Text Notes 10400 2000 0    50   ~ 0
← Control Unit
Text Notes 10400 5900 0    50   ~ 0
From Flag Unit
Wire Wire Line
	6200 2250 6750 2250
Text Label 6750 2250 2    50   ~ 0
FL
Wire Wire Line
	6200 4200 6750 4200
Text Label 6750 4200 2    50   ~ 0
FV
Wire Bus Line
	10300 1850 10300 2500
Wire Bus Line
	10300 4300 10300 5800
$EndSCHEMATC
