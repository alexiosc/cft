EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 8
Title "Peripheral Bus Interface etc."
Date ""
Rev "2023"
Comp ""
Comment1 "BUS"
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
	8350 4300 7800 4300
Wire Wire Line
	8350 4400 7800 4400
Wire Wire Line
	8350 4200 7800 4200
Wire Wire Line
	8350 4000 7800 4000
Text Label 7800 2700 0    50   ~ 0
~IRQ
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
Text Label 7800 2500 0    50   ~ 0
~T34
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
Text Label 7800 4000 0    50   ~ 0
~WS
Text Label 7800 4200 0    50   ~ 0
~ENDEXT
Text Label 7800 4300 0    50   ~ 0
~SKIPEXT
Text Label 7800 4400 0    50   ~ 0
~HALT
Text Label 7800 4600 0    50   ~ 0
WADDR[0..4]
Text Label 7800 4700 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	8350 4600 7800 4600
Wire Bus Line
	8350 4700 7800 4700
Text Notes 9100 3450 1    100  ~ 20
Backplane Slot
Text Label 7800 3800 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 10500 6150
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR02"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 10500 6000 50  0001 C CNN
F 1 "+5V" H 10442 6187 50  0000 R CNN
F 2 "" H 10500 6150 50  0001 C CNN
F 3 "" H 10500 6150 50  0001 C CNN
	1    10500 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 10500 6550
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR04"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 10500 6300 50  0001 C CNN
F 1 "GND" H 10422 6513 50  0000 R CNN
F 2 "" H 10500 6550 50  0001 C CNN
F 3 "" H 10500 6550 50  0001 C CNN
	1    10500 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 6150 10500 6250
$Comp
L Device:CP_Small C2
U 1 1 5DF0FF8F
P 10500 6350
AR Path="/5DF0FF8F" Ref="C2"  Part="1" 
AR Path="/5D34E810/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF8F" Ref="C?"  Part="1" 
F 0 "C2" H 10412 6396 50  0000 R CNN
F 1 "47µF" H 10412 6305 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10500 6350 50  0001 C CNN
F 3 "~" H 10500 6350 50  0001 C CNN
	1    10500 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 6450 10500 6550
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 10050 6150
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR01"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 10050 6000 50  0001 C CNN
F 1 "+5V" H 9992 6187 50  0000 R CNN
F 2 "" H 10050 6150 50  0001 C CNN
F 3 "" H 10050 6150 50  0001 C CNN
	1    10050 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF9C
P 10050 6550
AR Path="/5F67D4B5/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF9C" Ref="#PWR03"  Part="1" 
AR Path="/5D34E810/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF9C" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 10050 6300 50  0001 C CNN
F 1 "GND" H 9972 6513 50  0000 R CNN
F 2 "" H 10050 6550 50  0001 C CNN
F 3 "" H 10050 6550 50  0001 C CNN
	1    10050 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 6150 10050 6250
$Comp
L Device:CP_Small C1
U 1 1 5DF0FFA3
P 10050 6350
AR Path="/5DF0FFA3" Ref="C1"  Part="1" 
AR Path="/5D34E810/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FFA3" Ref="C?"  Part="1" 
F 0 "C1" H 9962 6396 50  0000 R CNN
F 1 "47µF" H 9962 6305 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10050 6350 50  0001 C CNN
F 3 "~" H 10050 6350 50  0001 C CNN
	1    10050 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 6450 10050 6550
Wire Wire Line
	9500 3200 10000 3200
NoConn ~ 7800 1800
NoConn ~ 7800 2700
NoConn ~ 7800 2800
NoConn ~ 7800 4200
NoConn ~ 7800 4300
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
Text Notes 10050 5400 0    50   ~ 0
← Control Unit
Text Notes 10050 1800 0    50   ~ 0
← Control Unit
Text Notes 10050 1700 0    50   ~ 0
← Control Unit
Text Notes 10050 1600 0    50   ~ 0
← Control Unit
Text Label 7800 2200 0    50   ~ 0
AB[0..23]
Wire Bus Line
	4950 1650 4100 1650
Text Label 4100 1650 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	6100 2700 6950 2700
Text Label 6950 2700 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	2900 1500 3750 1500
Text Label 3750 1500 2    50   ~ 0
AEXT[0..7]
Wire Bus Line
	1750 2150 900  2150
Text Label 900  2150 0    50   ~ 0
IBUS[0..15]
Text Label 6900 4450 2    50   ~ 0
~W
Wire Wire Line
	4950 1900 4100 1900
Text Label 4100 1900 0    50   ~ 0
~MEM
Wire Wire Line
	4950 2000 4100 2000
Text Label 4100 2000 0    50   ~ 0
~IO
Wire Wire Line
	6100 2600 6950 2600
Text Label 6950 2600 2    50   ~ 0
~FPAEXT
Wire Wire Line
	2900 1750 3750 1750
Wire Wire Line
	2900 2050 3750 2050
Text Label 3750 1750 2    50   ~ 0
~SYSDEV
Wire Bus Line
	2900 1850 3750 1850
Text Label 3750 1850 2    50   ~ 0
AB[0..23]
Text Label 3750 2050 2    50   ~ 0
~W
Wire Bus Line
	2900 2150 3750 2150
Text Label 3750 2150 2    50   ~ 0
DB[0..15]
Wire Wire Line
	1750 2750 900  2750
Text Label 900  2750 0    50   ~ 0
~FPRAM~∕ROM
Text Label 3000 2750 0    50   ~ 0
~WAR
Text Label 900  2050 0    50   ~ 0
WADDR[0..4]
Text Label 900  1950 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	1750 1950 900  1950
Wire Bus Line
	1750 2050 900  2050
Text Label 900  1500 0    50   ~ 0
~RESET
Wire Wire Line
	1750 1500 900  1500
Wire Wire Line
	6100 2000 6950 2000
Wire Wire Line
	6100 2100 6950 2100
Wire Wire Line
	6100 2200 6950 2200
Wire Wire Line
	6100 2300 6950 2300
Text Label 6950 2000 2    50   ~ 0
~SYSDEV
Text Label 6950 2100 2    50   ~ 0
~IODEV1xx
Text Label 6950 2200 2    50   ~ 0
~IODEV2xx
Text Label 6950 2300 2    50   ~ 0
~IODEV3xx
$Sheet
S 4950 1350 1150 1500
U 5CC06F10
F0 "Address Register (AR)" 50
F1 "cft_ar.sch" 50
F2 "~MEM" T L 4950 1900 50 
F3 "~IO" T L 4950 2000 50 
F4 "IBUS[0..15]" T L 4950 1650 50 
F5 "~WRITE-AR" I L 4950 2750 50 
F6 "AB[0..23]" O R 6100 1700 50 
F7 "AEXT[0..7]" I L 4950 1500 50 
F8 "~SYSDEV" O R 6100 2000 50 
F9 "~IODEV1XX" O R 6100 2100 50 
F10 "~IODEV2XX" O R 6100 2200 50 
F11 "~IODEV3XX" O R 6100 2300 50 
F12 "~FPAEXT" I R 6100 2600 50 
F13 "FPD[0..7]" T R 6100 2700 50 
F14 "~T34" I L 4950 1800 50 
F15 "HALT" I L 4950 2100 50 
$EndSheet
Text Label 6950 1700 2    50   ~ 0
AB[0..23]
Wire Bus Line
	6100 1700 6950 1700
Text Label 4100 1500 0    50   ~ 0
AEXT[0..7]
Wire Bus Line
	4950 1500 4100 1500
Wire Wire Line
	4950 1800 4100 1800
Text Label 4100 1800 0    50   ~ 0
~T34
Wire Wire Line
	9500 3300 10000 3300
Text Notes 8300 1100 0    100  ~ 20
Edge Connector
Text Notes 1400 1150 0    100  ~ 20
Memory Bank Unit (MBU)
Text Label 4050 4800 0    50   ~ 0
~WS
Text Label 4050 4650 0    50   ~ 0
~WEN
Text Label 4050 4550 0    50   ~ 0
~R
Text Label 4050 4450 0    50   ~ 0
~IO
Text Label 4050 4350 0    50   ~ 0
~MEM
Text Label 4050 3800 0    50   ~ 0
~HALT
Text Label 4050 3700 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	4900 4800 4050 4800
Wire Wire Line
	4900 4650 4050 4650
Wire Wire Line
	4900 4550 4050 4550
Wire Wire Line
	4900 4450 4050 4450
Wire Wire Line
	4900 4350 4050 4350
Wire Wire Line
	4900 3800 4050 3800
Wire Wire Line
	4900 3700 4050 3700
Wire Wire Line
	6050 4450 6900 4450
Text Label 6900 4900 2    50   ~ 0
DB[0..15]
Wire Bus Line
	6050 4900 6900 4900
Text Label 4050 4900 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	4900 4900 4050 4900
Text Notes 4350 3350 0    100  ~ 20
Data Bus Driver & Wait States
Text Notes 1700 3350 0    100  ~ 20
Constant Store
Wire Wire Line
	10000 2700 9500 2700
Wire Wire Line
	10000 2800 9500 2800
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
	10000 5300 9500 5300
Wire Wire Line
	10000 5100 9500 5100
Wire Wire Line
	10000 3100 9500 3100
Text Label 10000 5000 2    50   ~ 0
~FPRAM~∕ROM
Text Notes 10050 5100 0    50   ~ 0
← Front Panel
Wire Wire Line
	9500 5000 10000 5000
Text Notes 10050 5000 0    50   ~ 0
← Front Panel
Text Label 10000 5100 2    50   ~ 0
~FPAEXT
Wire Wire Line
	10000 1900 9500 1900
Wire Wire Line
	10000 5400 9500 5400
NoConn ~ 10000 2700
NoConn ~ 10000 2800
Wire Bus Line
	2850 3700 3700 3700
Text Label 3700 3700 2    50   ~ 0
IBUS[0..15]
Text Label 850  3700 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	1700 3700 850  3700
NoConn ~ 10000 2600
NoConn ~ 10000 2500
NoConn ~ 10000 2400
NoConn ~ 10000 2300
Wire Wire Line
	10000 2300 9500 2300
Wire Wire Line
	10000 2500 9500 2500
Wire Wire Line
	10000 2600 9500 2600
Wire Wire Line
	9500 2400 10000 2400
Text Label 10000 5400 2    50   ~ 0
~IR-IDX
NoConn ~ 10000 2200
NoConn ~ 10000 2100
NoConn ~ 10000 2000
Wire Wire Line
	10000 2100 9500 2100
Wire Wire Line
	10000 2200 9500 2200
Wire Wire Line
	9500 2000 10000 2000
NoConn ~ 10000 3100
NoConn ~ 10000 3200
NoConn ~ 10000 3300
NoConn ~ 10000 3400
NoConn ~ 10000 3500
NoConn ~ 10000 3600
NoConn ~ 10000 3800
NoConn ~ 10000 3900
NoConn ~ 10000 4000
NoConn ~ 10000 4100
NoConn ~ 10000 4200
NoConn ~ 10000 4300
NoConn ~ 10000 4400
NoConn ~ 10000 4500
NoConn ~ 10000 4600
NoConn ~ 10000 4700
NoConn ~ 10000 4800
NoConn ~ 10000 4900
NoConn ~ 10000 5300
NoConn ~ 10000 1900
NoConn ~ 10000 5200
Wire Wire Line
	9500 5200 10000 5200
Wire Wire Line
	1750 2250 900  2250
Text Label 900  2250 0    50   ~ 0
~IR-IDX
Wire Wire Line
	10000 3000 9500 3000
Wire Wire Line
	10000 5500 9500 5500
NoConn ~ 10000 5500
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
F11 "~T34" U L 8350 2500 50 
F12 "~IRQ" U L 8350 2700 50 
F13 "~IRQS" U L 8350 2800 50 
F14 "~RSTHOLD" U L 8350 3000 50 
F15 "~SYSDEV" U L 8350 3100 50 
F16 "~IODEV1xx" U L 8350 3200 50 
F17 "~IODEV2xx" U L 8350 3300 50 
F18 "~IODEV3xx" U L 8350 3400 50 
F19 "~MEM" U L 8350 3500 50 
F20 "~IO" U L 8350 3600 50 
F21 "~R" U L 8350 3700 50 
F22 "~W" U L 8350 3800 50 
F23 "~WS" U L 8350 4000 50 
F24 "~ENDEXT" U L 8350 4200 50 
F25 "~SKIPEXT" U L 8350 4300 50 
F26 "~HALT" U L 8350 4400 50 
F27 "WADDR[0..4]" U L 8350 4600 50 
F28 "RADDR[0..4]" U L 8350 4700 50 
F29 "C1" U R 9500 1600 50 
F30 "C2" U R 9500 1700 50 
F31 "C3" U R 9500 1800 50 
F32 "C4" U R 9500 1900 50 
F33 "C5" U R 9500 2000 50 
F34 "C6" U R 9500 2100 50 
F35 "C7" U R 9500 2200 50 
F36 "C8" U R 9500 2300 50 
F37 "C9" U R 9500 2400 50 
F38 "C10" U R 9500 2500 50 
F39 "C11" U R 9500 2600 50 
F40 "C12" U R 9500 2700 50 
F41 "C13" U R 9500 2800 50 
F42 "C14" U R 9500 2900 50 
F43 "C15" U R 9500 3000 50 
F44 "C16" U R 9500 3100 50 
F45 "C17" U R 9500 3200 50 
F46 "C18" U R 9500 3300 50 
F47 "C19" U R 9500 3400 50 
F48 "C20" U R 9500 3500 50 
F49 "C21" U R 9500 3600 50 
F50 "C22" U R 9500 3700 50 
F51 "C23" U R 9500 3800 50 
F52 "C24" U R 9500 3900 50 
F53 "C25" U R 9500 4000 50 
F54 "C26" U R 9500 4100 50 
F55 "C27" U R 9500 4200 50 
F56 "C28" U R 9500 4300 50 
F57 "C29" U R 9500 4400 50 
F58 "C30" U R 9500 4500 50 
F59 "C31" U R 9500 4600 50 
F60 "C32" U R 9500 4700 50 
F61 "C33" U R 9500 4800 50 
F62 "C34" U R 9500 4900 50 
F63 "C35" U R 9500 5000 50 
F64 "C36" U R 9500 5100 50 
F65 "C37" U R 9500 5200 50 
F66 "C38" U R 9500 5300 50 
F67 "C39" U R 9500 5400 50 
F68 "C40" U R 9500 5500 50 
F69 "~WAITING" U L 8350 4100 50 
$EndSheet
Wire Wire Line
	2900 2750 4950 2750
Text Notes 4900 1100 0    100  ~ 20
Address Register
Wire Wire Line
	1750 2350 900  2350
Wire Wire Line
	1750 2450 900  2450
Text Label 900  2350 0    50   ~ 0
IR0
Text Label 900  2450 0    50   ~ 0
IR1
Wire Wire Line
	2900 1950 3750 1950
Text Label 3750 1950 2    50   ~ 0
~R
Wire Wire Line
	1750 2550 900  2550
Text Label 900  2550 0    50   ~ 0
IR2
Wire Wire Line
	6050 4550 6900 4550
Text Label 6900 4550 2    50   ~ 0
~WAITING
Wire Wire Line
	8350 4100 7800 4100
Text Label 7800 4100 0    50   ~ 0
~WAITING
Wire Wire Line
	10000 2900 9500 2900
NoConn ~ 10000 2900
Text Label 10000 3700 2    50   ~ 0
~WEN
Text Label 4050 3900 0    50   ~ 0
CLK2
Wire Wire Line
	4900 3900 4050 3900
Wire Wire Line
	6050 3800 6900 3800
Text Label 6900 3800 2    50   ~ 0
HALT
Wire Wire Line
	4950 2100 4100 2100
Text Label 4100 2100 0    50   ~ 0
~HALT
NoConn ~ 10000 3000
Wire Wire Line
	1750 1600 900  1600
Text Label 900  1600 0    50   ~ 0
CLK2
Wire Wire Line
	1750 1700 900  1700
Text Label 900  1700 0    50   ~ 0
CLK4
$Sheet
S 1700 3550 1150 450 
U 5E25A7FA
F0 "Constant Store" 50
F1 "cpu_cs.sch" 50
F2 "RADDR[0..4]" I L 1700 3700 50 
F3 "IBUS[0..15]" B R 2850 3700 50 
F4 "T34" I L 1700 3850 50 
$EndSheet
Wire Wire Line
	1700 3850 850  3850
Text Label 850  3850 0    50   ~ 0
~T34
$Sheet
S 1750 1350 1150 1550
U 61F95ACC
F0 "Memory Bank Unit (MBU)" 50
F1 "mbu.sch" 50
F2 "~RESET" I L 1750 1500 50 
F3 "AEXT[0..7]" O R 2900 1500 50 
F4 "WADDR[0..4]" I L 1750 2050 50 
F5 "~FPRAM~∕ROM" I L 1750 2750 50 
F6 "IBUS[0..7]" T L 1750 2150 50 
F7 "RADDR[0..4]" I L 1750 1950 50 
F8 "AB[0..7]" I R 2900 1850 50 
F9 "~W" I R 2900 2050 50 
F10 "~SYSDEV" I R 2900 1750 50 
F11 "DB[0..7]" B R 2900 2150 50 
F12 "~IR-IDX" I L 1750 2250 50 
F13 "~WAR" O R 2900 2750 50 
F14 "IR0" I L 1750 2350 50 
F15 "IR1" I L 1750 2450 50 
F16 "~R" I R 2900 1950 50 
F17 "IR2" I L 1750 2550 50 
F18 "CLK4" I L 1750 1700 50 
F19 "CLK2" I L 1750 1600 50 
$EndSheet
Wire Wire Line
	4900 4100 4050 4100
Text Label 4050 4100 0    50   ~ 0
~T34
$Sheet
S 4900 3550 1150 1500
U 5D46B22D
F0 "Wait States & Write Strobes" 50
F1 "cft_ws_busen.sch" 50
F2 "~T34" I L 4900 4100 50 
F3 "~RSTHOLD" I L 4900 3700 50 
F4 "CLK3" I L 4900 4000 50 
F5 "~MEM" I L 4900 4350 50 
F6 "~IO" I L 4900 4450 50 
F7 "~HALT" I L 4900 3800 50 
F8 "~WEN" I L 4900 4650 50 
F9 "~WS" I L 4900 4800 50 
F10 "~W" T R 6050 4450 50 
F11 "~R" I L 4900 4550 50 
F12 "IBUS[0..15]" T L 4900 4900 50 
F13 "DB[0..15]" T R 6050 4900 50 
F14 "~WAITING" O R 6050 4550 50 
F15 "CLK2" I L 4900 3900 50 
F16 "HALT" O R 6050 3800 50 
$EndSheet
Wire Wire Line
	4900 4000 4050 4000
Text Label 4050 4000 0    50   ~ 0
CLK3
$Comp
L power:+5V #PWR?
U 1 1 5EFD0815
P 10950 6150
AR Path="/5F67D4B5/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5EFD0815" Ref="#PWR0158"  Part="1" 
AR Path="/5D34E810/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD0815" Ref="#PWR?"  Part="1" 
F 0 "#PWR0158" H 10950 6000 50  0001 C CNN
F 1 "+5V" H 10892 6187 50  0000 R CNN
F 2 "" H 10950 6150 50  0001 C CNN
F 3 "" H 10950 6150 50  0001 C CNN
	1    10950 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFD081B
P 10950 6550
AR Path="/5F67D4B5/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5EFD081B" Ref="#PWR0159"  Part="1" 
AR Path="/5D34E810/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD081B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0159" H 10950 6300 50  0001 C CNN
F 1 "GND" H 10872 6513 50  0000 R CNN
F 2 "" H 10950 6550 50  0001 C CNN
F 3 "" H 10950 6550 50  0001 C CNN
	1    10950 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 6150 10950 6250
$Comp
L Device:CP_Small C56
U 1 1 5EFD0822
P 10950 6350
AR Path="/5EFD0822" Ref="C56"  Part="1" 
AR Path="/5D34E810/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5EFD0822" Ref="C?"  Part="1" 
F 0 "C56" H 10862 6396 50  0000 R CNN
F 1 "47µF" H 10862 6305 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10950 6350 50  0001 C CNN
F 3 "~" H 10950 6350 50  0001 C CNN
	1    10950 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 6450 10950 6550
Wire Bus Line
	9950 1450 9950 1700
$EndSCHEMATC