EESchema Schematic File Version 4
LIBS:cft-bus-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title "Peripheral Bus Interface etc."
Date ""
Rev ""
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 8350 1450 1150 4200
U 5DF0FF3E
F0 "sheet5DF0FEB4" 50
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
Text Notes 9100 3450 1    100  ~ 20
Left Slot
Text Label 7800 3800 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 10850 6050
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR02"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 10850 5900 50  0001 C CNN
F 1 "+5V" H 10792 6087 50  0000 R CNN
F 2 "" H 10850 6050 50  0001 C CNN
F 3 "" H 10850 6050 50  0001 C CNN
	1    10850 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 10850 6450
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR04"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 10850 6200 50  0001 C CNN
F 1 "GND" H 10772 6413 50  0000 R CNN
F 2 "" H 10850 6450 50  0001 C CNN
F 3 "" H 10850 6450 50  0001 C CNN
	1    10850 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 6050 10850 6150
$Comp
L Device:CP_Small C2
U 1 1 5DF0FF8F
P 10850 6250
AR Path="/5DF0FF8F" Ref="C2"  Part="1" 
AR Path="/5D34E810/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF8F" Ref="C?"  Part="1" 
F 0 "C2" H 10762 6296 50  0000 R CNN
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
U 1 1 5DF0FF96
P 10400 6050
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR01"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 10400 5900 50  0001 C CNN
F 1 "+5V" H 10342 6087 50  0000 R CNN
F 2 "" H 10400 6050 50  0001 C CNN
F 3 "" H 10400 6050 50  0001 C CNN
	1    10400 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF9C
P 10400 6450
AR Path="/5F67D4B5/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF9C" Ref="#PWR03"  Part="1" 
AR Path="/5D34E810/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF9C" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 10400 6200 50  0001 C CNN
F 1 "GND" H 10322 6413 50  0000 R CNN
F 2 "" H 10400 6450 50  0001 C CNN
F 3 "" H 10400 6450 50  0001 C CNN
	1    10400 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 6050 10400 6150
$Comp
L Device:CP_Small C1
U 1 1 5DF0FFA3
P 10400 6250
AR Path="/5DF0FFA3" Ref="C1"  Part="1" 
AR Path="/5D34E810/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FFA3" Ref="C?"  Part="1" 
F 0 "C1" H 10312 6296 50  0000 R CNN
F 1 "47µF" H 10312 6205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10400 6250 50  0001 C CNN
F 3 "~" H 10400 6250 50  0001 C CNN
	1    10400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 6350 10400 6450
Wire Wire Line
	9500 3200 10000 3200
NoConn ~ 7800 1800
NoConn ~ 7800 2000
NoConn ~ 7800 2500
NoConn ~ 7800 2700
NoConn ~ 7800 2800
NoConn ~ 7800 2900
NoConn ~ 7800 3000
NoConn ~ 7800 3100
NoConn ~ 7800 3200
NoConn ~ 7800 3300
NoConn ~ 7800 3400
NoConn ~ 7800 3500
NoConn ~ 7800 3600
NoConn ~ 7800 3700
NoConn ~ 7800 3800
NoConn ~ 7800 3900
NoConn ~ 7800 4000
NoConn ~ 7800 4100
NoConn ~ 7800 4200
NoConn ~ 7800 4800
Wire Wire Line
	9500 2400 10000 2400
Wire Wire Line
	9500 4800 10000 4800
Wire Wire Line
	9500 1600 9850 1600
Wire Wire Line
	9500 1700 9850 1700
Wire Wire Line
	9500 1800 9850 1800
Text Label 9850 1600 2    50   ~ 0
IR0
Text Label 9850 1700 2    50   ~ 0
IR1
Text Label 9850 1800 2    50   ~ 0
IR2
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
Text Label 10000 5000 2    50   ~ 0
~FLAGWE
Text Label 10000 4800 2    50   ~ 0
FL
Text Label 10000 4900 2    50   ~ 0
FV
Text Notes 10050 4800 0    50   ~ 0
→ ALU
Text Notes 10050 4900 0    50   ~ 0
→ ALU
Text Notes 10050 2200 0    50   ~ 0
← Control Unit
Text Notes 10050 2100 0    50   ~ 0
← Control Unit
Text Notes 10050 2000 0    50   ~ 0
← Control Unit
Text Notes 10050 1900 0    50   ~ 0
← Control Unit
Text Notes 10050 1800 0    50   ~ 0
← Control Unit
Text Notes 10050 1700 0    50   ~ 0
← Control Unit
Text Notes 10050 1600 0    50   ~ 0
← Control Unit
Text Label 7800 2200 0    50   ~ 0
AB[0..23]
Text Notes 10050 2500 0    50   ~ 0
← REG
Wire Wire Line
	8350 4300 7800 4300
Wire Wire Line
	8350 4400 7800 4400
Text Label 7800 4300 0    50   ~ 0
~RUEN
Text Label 7800 4400 0    50   ~ 0
~WUEN
Wire Bus Line
	1750 3700 900  3700
Text Label 900  3700 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	2900 4750 3750 4750
Text Label 3750 4750 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	2900 1450 3750 1450
Text Label 3750 1450 2    50   ~ 0
AEXT[0..7]
Wire Bus Line
	1750 2150 900  2150
Text Label 900  2150 0    50   ~ 0
IBUS[0..15]
Text Label 7150 5900 2    50   ~ 0
~W
Wire Wire Line
	1750 3950 900  3950
Text Label 900  3950 0    50   ~ 0
~MEM
Wire Wire Line
	1750 4050 900  4050
Text Label 900  4050 0    50   ~ 0
~IO
Wire Wire Line
	1750 4750 900  4750
Text Label 900  4750 0    50   ~ 0
~FPAEXT
$Sheet
S 1750 1350 1150 1550
U 61F95ACC
F0 "Memory Bank Unit (MBU)" 50
F1 "mbu.sch" 50
F2 "~RESET" I L 1750 1500 50 
F3 "AEXT[0..7]" O R 2900 1450 50 
F4 "WADDR[0..4]" I L 1750 1950 50 
F5 "~FPRAM~∕ROM" I L 1750 2750 50 
F6 "IBUS[0..7]" T L 1750 2150 50 
F7 "RADDR[0..4]" I L 1750 1850 50 
F8 "AB[0..7]" I R 2900 1850 50 
F9 "WSTB" I L 1750 1700 50 
F10 "~READ-FLAGS" O R 2900 2400 50 
F11 "~WRITE-FLAGS" O R 2900 2650 50 
F12 "~R" I R 2900 1950 50 
F13 "~W" I R 2900 2050 50 
F14 "IR[0..11]" I L 1750 2050 50 
F15 "~SYSDEV" I R 2900 1750 50 
F16 "~READ-MBP+FLAGS" O R 2900 2300 50 
F17 "~WRITE-MBP+FLAGS" O R 2900 2550 50 
F18 "DB[0..7]" B R 2900 2150 50 
F19 "T34" I L 1750 1600 50 
F20 "~WRITE-AR" O R 2900 2750 50 
F21 "~RUEN" I L 1750 2300 50 
F22 "~WUEN" I L 1750 2400 50 
$EndSheet
Wire Bus Line
	1750 2050 900  2050
Wire Wire Line
	2900 1750 3750 1750
Wire Wire Line
	2900 1950 3750 1950
Wire Wire Line
	2900 2050 3750 2050
Text Label 3750 1750 2    50   ~ 0
~SYSDEV
Wire Bus Line
	2900 1850 3750 1850
Text Label 3750 1850 2    50   ~ 0
AB[0..23]
Text Label 900  2050 0    50   ~ 0
IR[0..15]
Text Label 3750 1950 2    50   ~ 0
~R
Text Label 3750 2050 2    50   ~ 0
~W
Wire Bus Line
	2900 2150 3750 2150
Text Label 3750 2150 2    50   ~ 0
DB[0..15]
Text Label 3750 2300 2    50   ~ 0
~READ-MBP+FLAGS
Text Label 3750 2400 2    50   ~ 0
~READ-FLAGS
Text Label 3750 2550 2    50   ~ 0
~WRITE-MBP+FLAGS
Text Label 3750 2650 2    50   ~ 0
~WRITE-FLAGS
Wire Wire Line
	1750 2750 900  2750
Text Label 900  2750 0    50   ~ 0
~FPRAM~∕ROM
Wire Wire Line
	2900 2750 3500 2750
Text Label 3500 2850 3    50   ~ 0
~WRITE-AR-MBx
Text Label 900  1950 0    50   ~ 0
WADDR[0..4]
Text Label 900  1850 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	1750 1850 900  1850
Wire Bus Line
	1750 1950 900  1950
Text Label 900  1700 0    50   ~ 0
WSTB
Wire Wire Line
	1750 1700 900  1700
Text Label 900  1600 0    50   ~ 0
T34
Wire Wire Line
	1750 1600 900  1600
Text Label 900  1500 0    50   ~ 0
~RESET
Wire Wire Line
	1750 1500 900  1500
Wire Wire Line
	1750 2300 900  2300
Wire Wire Line
	1750 2400 900  2400
Text Label 900  2300 0    50   ~ 0
~RUEN
Text Label 900  2400 0    50   ~ 0
~WUEN
Text Label 10000 3000 2    50   ~ 0
~END
Wire Wire Line
	10000 2600 9500 2600
Wire Wire Line
	10000 2500 9500 2500
Wire Wire Line
	2900 4050 3750 4050
Wire Wire Line
	2900 4150 3750 4150
Wire Wire Line
	2900 4250 3750 4250
Wire Wire Line
	2900 4350 3750 4350
Text Label 3750 4050 2    50   ~ 0
~SYSDEV
Text Label 3750 4150 2    50   ~ 0
~IODEV1xx
Text Label 3750 4250 2    50   ~ 0
~IODEV2xx
Text Label 3750 4350 2    50   ~ 0
~IODEV3xx
Text Notes 2350 4300 1    70   ~ 14
Verilog
Wire Wire Line
	3500 2750 3500 3550
Wire Wire Line
	3500 3550 2900 3550
$Sheet
S 1750 3400 1150 1500
U 5CC06F10
F0 "Address Register (AR)" 50
F1 "cft_ar.sch" 50
F2 "~MEM" T L 1750 3950 50 
F3 "~IO" T L 1750 4050 50 
F4 "IBUS[0..15]" T L 1750 3700 50 
F5 "~WRITE-AR" I R 2900 3550 50 
F6 "AB[0..23]" O R 2900 3750 50 
F7 "AEXT[0..7]" I L 1750 3550 50 
F8 "~SYSDEV" O R 2900 4050 50 
F9 "~IODEV1XX" O R 2900 4150 50 
F10 "~IODEV2XX" O R 2900 4250 50 
F11 "~IODEV3XX" O R 2900 4350 50 
F12 "~FPAEXT" I L 1750 4750 50 
F13 "FPD[0..7]" T R 2900 4750 50 
F14 "T34" I L 1750 3850 50 
$EndSheet
Text Label 3750 3750 2    50   ~ 0
AB[0..23]
Wire Bus Line
	2900 3750 3750 3750
Text Label 900  3550 0    50   ~ 0
AEXT[0..7]
Wire Bus Line
	1750 3550 900  3550
Wire Wire Line
	1750 3850 900  3850
Text Label 900  3850 0    50   ~ 0
T34
Wire Wire Line
	2900 2650 3750 2650
Wire Wire Line
	2900 2550 3750 2550
Wire Wire Line
	2900 2400 3750 2400
Wire Wire Line
	2900 2300 3750 2300
Text Label 10000 5500 2    50   ~ 0
~FPFLAGS
Wire Wire Line
	9500 3300 10000 3300
Text Notes 8300 1100 0    100  ~ 20
Edge Connector
Text Notes 1400 1150 0    100  ~ 20
Memory Bank Unit (MBU)
$Sheet
S 5150 5000 1150 1500
U 5D46B22D
F0 "Wait States & Write Strobes" 50
F1 "cft_ws_busen.sch" 50
F2 "WSTB" I L 5150 5550 50 
F3 "~RESET" I L 5150 5150 50 
F4 "CLK3" I L 5150 5350 50 
F5 "T34" I L 5150 5450 50 
F6 "~MEM" I L 5150 5700 50 
F7 "~IO" I L 5150 5800 50 
F8 "~HALT" I L 5150 5250 50 
F9 "~WEN" I L 5150 6000 50 
F10 "~WS" I L 5150 6250 50 
F11 "~W" T R 6300 5900 50 
F12 "~R" I L 5150 5900 50 
F13 "IBUS[0..15]" T L 5150 6350 50 
F14 "DB[0..15]" T R 6300 6350 50 
$EndSheet
Text Label 4300 6250 0    50   ~ 0
~WS
Text Label 4300 6000 0    50   ~ 0
~WEN
Text Label 4300 5900 0    50   ~ 0
~R
Text Label 4300 5800 0    50   ~ 0
~IO
Text Label 4300 5700 0    50   ~ 0
~MEM
Text Label 4300 5550 0    50   ~ 0
WSTB
Text Label 4300 5450 0    50   ~ 0
T34
Text Label 4300 5350 0    50   ~ 0
CLK3
Text Label 4300 5250 0    50   ~ 0
~HALT
Text Label 4300 5150 0    50   ~ 0
~RESET
Wire Wire Line
	5150 6250 4300 6250
Wire Wire Line
	5150 6000 4300 6000
Wire Wire Line
	5150 5900 4300 5900
Wire Wire Line
	5150 5800 4300 5800
Wire Wire Line
	5150 5700 4300 5700
Wire Wire Line
	5150 5550 4300 5550
Wire Wire Line
	5150 5450 4300 5450
Wire Wire Line
	5150 5350 4300 5350
Wire Wire Line
	5150 5250 4300 5250
Wire Wire Line
	5150 5150 4300 5150
Wire Wire Line
	6300 5900 7150 5900
Text Label 7150 6350 2    50   ~ 0
DB[0..15]
Wire Bus Line
	6300 6350 7150 6350
Text Label 4300 6350 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5150 6350 4300 6350
Text Notes 5825 6125 0    70   ~ 14
Verilog
Text Notes 4600 4800 0    100  ~ 20
Data Bus Driver & Wait States
Text Notes 1700 3250 0    100  ~ 20
Address Register
Wire Wire Line
	9500 2200 9850 2200
Wire Wire Line
	9500 2100 9850 2100
Wire Wire Line
	9500 2000 9850 2000
Wire Wire Line
	9500 1900 9850 1900
Text Label 9850 1900 2    50   ~ 0
IR8
Text Label 9850 2000 2    50   ~ 0
IR9
Text Label 9850 2100 2    50   ~ 0
IR10
Text Label 9850 2200 2    50   ~ 0
IR11
Wire Wire Line
	10000 2700 9500 2700
Text Notes 10050 2600 0    50   ~ 0
← REG
Text Notes 10050 2700 0    50   ~ 0
  for testing
Wire Wire Line
	10000 2800 9500 2800
Wire Wire Line
	10000 2900 9500 2900
Wire Wire Line
	10000 3400 9500 3400
Wire Wire Line
	10000 3500 9500 3500
Wire Wire Line
	10000 3600 9500 3600
Wire Wire Line
	10000 3700 9500 3700
Wire Wire Line
	10000 3800 9500 3800
Wire Wire Line
	10000 3900 9500 3900
Wire Wire Line
	10000 4000 9500 4000
Wire Wire Line
	10000 4100 9500 4100
Wire Wire Line
	10000 4200 9500 4200
Wire Wire Line
	10000 4300 9500 4300
Wire Wire Line
	10000 4400 9500 4400
Wire Wire Line
	10000 4500 9500 4500
Wire Wire Line
	10000 4600 9500 4600
Wire Wire Line
	10000 4700 9500 4700
Wire Wire Line
	10000 4900 9500 4900
Wire Wire Line
	10000 5000 9500 5000
Wire Wire Line
	10000 5400 9500 5400
Wire Wire Line
	10000 5500 9500 5500
Text Notes 10050 2800 0    50   ~ 0
→ Control Unit
Text Notes 10050 2900 0    50   ~ 0
← Control Unit
Text Notes 10050 5000 0    50   ~ 0
→ ALU
Text Notes 10050 5500 0    50   ~ 0
← Front Panel
Text Label 10000 2900 2    50   ~ 0
~WEN
Text Notes 10050 3000 0    50   ~ 0
← Control Unit
Wire Wire Line
	10000 3000 9500 3000
Wire Wire Line
	10000 3100 9500 3100
Wire Wire Line
	10000 2300 9500 2300
NoConn ~ 10000 2300
NoConn ~ 10000 2400
Text Label 10000 5300 2    50   ~ 0
~FPRAM~∕ROM
Text Notes 10050 5400 0    50   ~ 0
← Front Panel
Wire Wire Line
	9500 5300 10000 5300
Text Notes 10050 5300 0    50   ~ 0
← Front Panel
Text Label 10000 5400 2    50   ~ 0
~FPAEXT
Wire Wire Line
	10000 5100 9500 5100
Wire Wire Line
	10000 5200 9500 5200
NoConn ~ 10000 2500
NoConn ~ 10000 2600
NoConn ~ 10000 2700
NoConn ~ 10000 2800
$Sheet
S 1750 5350 1150 450 
U 5E25A7FA
F0 "Constant Store" 50
F1 "cpu_cs.sch" 50
F2 "~RUEN" I L 1750 5500 50 
F3 "RADDR[0..4]" I L 1750 5650 50 
F4 "IBUS[0..15]" B R 2900 5500 50 
$EndSheet
Wire Bus Line
	2900 5500 3750 5500
Text Label 3750 5500 2    50   ~ 0
IBUS[0..15]
Wire Wire Line
	1750 5500 900  5500
Text Label 900  5500 0    50   ~ 0
~RUEN
Text Label 900  5650 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	1750 5650 900  5650
Wire Bus Line
	9950 1450 9950 2100
$EndSCHEMATC
