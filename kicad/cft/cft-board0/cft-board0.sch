EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 17
Title "Control Unit Board"
Date ""
Rev "2119"
Comp ""
Comment1 "B0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 5D8B16F5
P 8700 9650
AR Path="/5F67D4B5/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16F5" Ref="#PWR0118"  Part="1" 
AR Path="/5D34E810/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H 8700 9500 50  0001 C CNN
F 1 "+5V" H 8642 9687 50  0000 R CNN
F 2 "" H 8700 9650 50  0001 C CNN
F 3 "" H 8700 9650 50  0001 C CNN
	1    8700 9650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8B16FB
P 8700 10050
AR Path="/5F67D4B5/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16FB" Ref="#PWR0128"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0128" H 8700 9800 50  0001 C CNN
F 1 "GND" H 8622 10013 50  0000 R CNN
F 2 "" H 8700 10050 50  0001 C CNN
F 3 "" H 8700 10050 50  0001 C CNN
	1    8700 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 9650 8700 9750
$Comp
L Device:CP_Small C108
U 1 1 5D8B1702
P 8700 9850
AR Path="/5D8B1702" Ref="C108"  Part="1" 
AR Path="/5D34E810/5D8B1702" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8B1702" Ref="C?"  Part="1" 
F 0 "C108" H 8612 9896 50  0000 R CNN
F 1 "47µF" H 8612 9805 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8700 9850 50  0001 C CNN
F 3 "~" H 8700 9850 50  0001 C CNN
	1    8700 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 9950 8700 10050
$Comp
L power:+5V #PWR?
U 1 1 5D8C8446
P 8250 9650
AR Path="/5F67D4B5/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D8C8446" Ref="#PWR0117"  Part="1" 
AR Path="/5D34E810/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8446" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H 8250 9500 50  0001 C CNN
F 1 "+5V" H 8192 9687 50  0000 R CNN
F 2 "" H 8250 9650 50  0001 C CNN
F 3 "" H 8250 9650 50  0001 C CNN
	1    8250 9650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8C844C
P 8250 10050
AR Path="/5F67D4B5/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D8C844C" Ref="#PWR0127"  Part="1" 
AR Path="/5D34E810/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C844C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0127" H 8250 9800 50  0001 C CNN
F 1 "GND" H 8172 10013 50  0000 R CNN
F 2 "" H 8250 10050 50  0001 C CNN
F 3 "" H 8250 10050 50  0001 C CNN
	1    8250 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 9650 8250 9750
$Comp
L Device:CP_Small C107
U 1 1 5D8C8453
P 8250 9850
AR Path="/5D8C8453" Ref="C107"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C107" H 8162 9896 50  0000 R CNN
F 1 "47µF" H 8162 9805 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8250 9850 50  0001 C CNN
F 3 "~" H 8250 9850 50  0001 C CNN
	1    8250 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 9950 8250 10050
Text Notes 3100 -7050 0    197  ~ 39
Registers
Text Notes -3950 -150 0    197  ~ 39
Decoders
Text Label 2350 -6300 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	3200 -6300 2350 -6300
Text Label 2350 -5000 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	3200 -5000 2350 -5000
Text Label 2350 -6100 0    50   ~ 0
~READ-PC
Text Label 2350 -6000 0    50   ~ 0
~WRITE-PC
Wire Wire Line
	3200 -4800 2350 -4800
Wire Wire Line
	3200 -4700 2350 -4700
Wire Wire Line
	3200 -4600 2350 -4600
Wire Wire Line
	3200 -4500 2350 -4500
Text Label 2350 -4800 0    50   ~ 0
~READ-DR
Text Label 2350 -4700 0    50   ~ 0
~WRITE-DR
Wire Bus Line
	4350 -6000 4850 -6000
Text Label 4850 -6000 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	4350 -5900 4850 -5900
Wire Wire Line
	4350 -5800 4850 -5800
Text Label 4850 -5900 2    50   ~ 0
~FPPCH
Text Label 4850 -5800 2    50   ~ 0
~FPPCL
Wire Bus Line
	4350 -4700 4850 -4700
Text Label 4850 -4700 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	4350 -4600 4850 -4600
Wire Wire Line
	4350 -4500 4850 -4500
Text Label 4850 -4600 2    50   ~ 0
~FPDRH
Text Label 4850 -4500 2    50   ~ 0
~FPDRL
Wire Bus Line
	4350 -6500 4850 -6500
Text Label 4850 -6500 2    50   ~ 0
PC[10..15]
Wire Wire Line
	3200 -5900 2350 -5900
Wire Wire Line
	3200 -6000 2350 -6000
Wire Wire Line
	3200 -6100 2350 -6100
$Sheet
S 3200 -5350 1150 1000
U 5D967A8B
F0 "Data Register" 50
F1 "cft-reg-dr-sp.sch" 50
F2 "~FPH" I R 4350 -4600 50 
F3 "~FPL" I R 4350 -4500 50 
F4 "~READ" I L 3200 -4800 50 
F5 "~INC" I L 3200 -4600 50 
F6 "~WRITE" I L 3200 -4700 50 
F7 "RESET" I L 3200 -5200 50 
F8 "IBUS[0..15]" I L 3200 -5000 50 
F9 "~DEC" I L 3200 -4500 50 
F10 "FPD[0..7]" T R 4350 -4700 50 
$EndSheet
Text Label 2350 -4500 0    50   ~ 0
~DECDR
Text Label 2350 -4600 0    50   ~ 0
~INCDR
Text Label 2350 -5900 0    50   ~ 0
~INCPC
Text Notes 11450 10200 0    50   ~ 0
[RW]ADDR\n\n01000\n01001\n01010\n01011
Text Notes 12000 10200 0    50   ~ 0
Reg\n\nPC\nDR\nAC\nSP
Wire Notes Line width 12 style solid
	11400 9675 12200 9675
Wire Notes Line width 12 style solid
	11400 10250 11400 9675
Wire Notes Line width 12 style solid
	12200 10250 11400 10250
Wire Notes Line width 12 style solid
	12200 9675 12200 10250
Wire Notes Line style solid
	11400 9850 12200 9850
Wire Notes Line
	11950 9675 11950 10250
Text Notes 4000 9400 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 8700 10500
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H 8700 10350 50  0001 C CNN
F 1 "+5V" H 8642 10537 50  0000 R CNN
F 2 "" H 8700 10500 50  0001 C CNN
F 3 "" H 8700 10500 50  0001 C CNN
	1    8700 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 8700 10900
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR0115"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 8700 10650 50  0001 C CNN
F 1 "GND" H 8622 10863 50  0000 R CNN
F 2 "" H 8700 10900 50  0001 C CNN
F 3 "" H 8700 10900 50  0001 C CNN
	1    8700 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 10500 8700 10600
Wire Wire Line
	8700 10800 8700 10900
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 8250 10500
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR0108"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 8250 10350 50  0001 C CNN
F 1 "+5V" H 8192 10537 50  0000 R CNN
F 2 "" H 8250 10500 50  0001 C CNN
F 3 "" H 8250 10500 50  0001 C CNN
	1    8250 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF9C
P 8250 10900
AR Path="/5F67D4B5/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF9C" Ref="#PWR0114"  Part="1" 
AR Path="/5D34E810/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF9C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 8250 10650 50  0001 C CNN
F 1 "GND" H 8172 10863 50  0000 R CNN
F 2 "" H 8250 10900 50  0001 C CNN
F 3 "" H 8250 10900 50  0001 C CNN
	1    8250 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 10500 8250 10600
Wire Wire Line
	8250 10800 8250 10900
Wire Bus Line
	9450 -4200 8600 -4200
Text Label 8600 -4200 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	10600 -3350 11450 -3350
Text Label 11450 -3350 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	7400 -4350 8250 -4350
Text Label 8250 -4350 2    50   ~ 0
AEXT[0..7]
Wire Bus Line
	6250 -3700 5400 -3700
Text Label 5400 -3700 0    50   ~ 0
IBUS[0..15]
Text Label 11400 -1400 2    50   ~ 0
~W
Wire Wire Line
	9450 -3950 8600 -3950
Text Label 8600 -3950 0    50   ~ 0
~IO
Wire Wire Line
	10600 -3450 11450 -3450
Text Label 11450 -3450 2    50   ~ 0
~FPAEXT
Wire Wire Line
	6250 -3100 5400 -3100
Text Label 5400 -3100 0    50   ~ 0
~FPRAM~∕ROM
Text Label 7500 -3100 0    50   ~ 0
~WAR
Text Label 5400 -3800 0    50   ~ 0
WADDR[0..4]
Text Label 5400 -3900 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	6250 -3900 5400 -3900
Wire Bus Line
	6250 -3800 5400 -3800
Wire Wire Line
	10600 -3950 11450 -3950
Wire Wire Line
	10600 -3850 11450 -3850
Wire Wire Line
	10600 -3750 11450 -3750
Wire Wire Line
	10600 -3650 11450 -3650
Text Label 11450 -3950 2    50   ~ 0
~SYSDEV
Text Label 11450 -3850 2    50   ~ 0
~IODEV1XX
Text Label 11450 -3750 2    50   ~ 0
~IODEV2XX
Text Label 11450 -3650 2    50   ~ 0
~IODEV3XX
$Sheet
S 9450 -4500 1150 1500
U 5CC06F10
F0 "Address Register (AR)" 50
F1 "cft_ar.sch" 50
F2 "~IO" T L 9450 -3950 50 
F3 "IBUS[0..15]" T L 9450 -4200 50 
F4 "~WRITE-AR" I L 9450 -3100 50 
F5 "AB[0..23]" O R 10600 -4200 50 
F6 "AEXT[0..7]" I L 9450 -4350 50 
F7 "~SYSDEV" O R 10600 -3950 50 
F8 "~IODEV1XX" O R 10600 -3850 50 
F9 "~IODEV2XX" O R 10600 -3750 50 
F10 "~IODEV3XX" O R 10600 -3650 50 
F11 "~FPAEXT" I R 10600 -3450 50 
F12 "FPD[0..7]" T R 10600 -3350 50 
F13 "~ABEN" I R 10600 -3100 50 
$EndSheet
Text Label 11450 -4200 2    50   ~ 0
AB[0..23]
Wire Bus Line
	10600 -4200 11450 -4200
Text Label 8600 -4350 0    50   ~ 0
AEXT[0..7]
Wire Bus Line
	9450 -4350 8600 -4350
Text Notes 5900 -4700 0    100  ~ 20
Memory Bank Unit (MBU)
Text Label 8550 -1050 0    50   ~ 0
~WS
Text Label 8550 -1200 0    50   ~ 0
~WEN
Text Label 8550 -1400 0    50   ~ 0
~IO
Text Label 8550 -1500 0    50   ~ 0
~MEM
Text Label 8550 -2050 0    50   ~ 0
~HALT
Text Label 8550 -2150 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	9400 -1050 8550 -1050
Wire Wire Line
	9400 -1200 8550 -1200
Wire Wire Line
	9400 -1400 8550 -1400
Wire Wire Line
	9400 -1500 8550 -1500
Wire Wire Line
	9400 -2050 8550 -2050
Wire Wire Line
	9400 -2150 8550 -2150
Wire Wire Line
	10550 -1400 11400 -1400
Text Label 11400 -950 2    50   ~ 0
DB[0..15]
Wire Bus Line
	10550 -950 11400 -950
Text Label 8550 -950 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	9400 -950 8550 -950
Text Notes 6200 -2500 0    100  ~ 20
Constant Store
Wire Bus Line
	7350 -2150 8200 -2150
Text Label 8200 -2150 2    50   ~ 0
IBUS[0..15]
Text Label 5350 -2150 0    50   ~ 0
RADDR[0..1]
Wire Bus Line
	6200 -2150 5350 -2150
Wire Wire Line
	6250 -3600 5400 -3600
Text Label 5400 -3600 0    50   ~ 0
~IR-IDX
Wire Wire Line
	7400 -3100 9450 -3100
Text Notes 9400 -4750 0    100  ~ 20
Address Register
Wire Wire Line
	10550 -1300 11400 -1300
Text Label 11400 -1300 2    50   ~ 0
~WAITING
Wire Wire Line
	9400 -1950 8550 -1950
Text Label 11400 -2050 2    50   ~ 0
~ABEN
$Sheet
S 6200 -2300 1150 450 
U 5E25A7FA
F0 "Constant Store" 50
F1 "cpu_cs.sch" 50
F2 "RADDR[0..1]" I L 6200 -2150 50 
F3 "IBUS[0..15]" B R 7350 -2150 50 
F4 "~READ-CS" I L 6200 -2000 50 
$EndSheet
Wire Wire Line
	6200 -2000 5350 -2000
Text Label 5350 -2000 0    50   ~ 0
~READ-CS
$Sheet
S 6250 -4500 1150 1550
U 61F95ACC
F0 "Memory Bank Unit (MBU)" 50
F1 "mbu.sch" 50
F2 "AEXT[0..7]" O R 7400 -4350 50 
F3 "WADDR[0..4]" I L 6250 -3800 50 
F4 "~FPRAM~∕ROM" I L 6250 -3100 50 
F5 "IBUS[0..7]" T L 6250 -3700 50 
F6 "RADDR[0..4]" I L 6250 -3900 50 
F7 "~IR-IDX" I L 6250 -3600 50 
F8 "~WAR" O R 7400 -3100 50 
F9 "CLK4" I L 6250 -4150 50 
F10 "CLK2" I L 6250 -4250 50 
F11 "~RSTHOLD" I L 6250 -4350 50 
F12 "IR[0..2]" I L 6250 -3500 50 
F13 "T34" I L 6250 -4050 50 
F14 "~FPCTX" I L 6250 -3200 50 
F15 "FPD[0..7]" T R 7400 -3200 50 
$EndSheet
Wire Wire Line
	9400 -1750 8550 -1750
Text Label 8550 -1750 0    50   ~ 0
T34
Wire Wire Line
	9400 -1850 8550 -1850
Text Label 8550 -1850 0    50   ~ 0
CLK3
$Comp
L power:+5V #PWR?
U 1 1 5EFD0815
P 9150 10500
AR Path="/5F67D4B5/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5EFD0815" Ref="#PWR0110"  Part="1" 
AR Path="/5D34E810/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD0815" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 9150 10350 50  0001 C CNN
F 1 "+5V" H 9092 10537 50  0000 R CNN
F 2 "" H 9150 10500 50  0001 C CNN
F 3 "" H 9150 10500 50  0001 C CNN
	1    9150 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFD081B
P 9150 10900
AR Path="/5F67D4B5/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5EFD081B" Ref="#PWR0116"  Part="1" 
AR Path="/5D34E810/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD081B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H 9150 10650 50  0001 C CNN
F 1 "GND" H 9072 10863 50  0000 R CNN
F 2 "" H 9150 10900 50  0001 C CNN
F 3 "" H 9150 10900 50  0001 C CNN
	1    9150 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 10500 9150 10600
Wire Wire Line
	9150 10800 9150 10900
Wire Wire Line
	-1450 6850 -1100 6850
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
	-1450 5150 -1100 5150
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
	-3000 4150 -2650 4150
Wire Wire Line
	-3000 4050 -2650 4050
Wire Wire Line
	-3550 4550 -3200 4550
Wire Wire Line
	-3550 4450 -3200 4450
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
Text Label -1100 5350 2    50   ~ 0
DB0
Text Label -1100 5450 2    50   ~ 0
DB1
Text Label -1100 5550 2    50   ~ 0
DB2
Text Label -1100 5650 2    50   ~ 0
DB3
Text Label -1100 5750 2    50   ~ 0
DB4
Text Label -1100 5850 2    50   ~ 0
DB5
Text Label -1100 5950 2    50   ~ 0
DB6
Text Label -1100 6050 2    50   ~ 0
DB7
Text Label -1100 6150 2    50   ~ 0
DB8
Text Label -1100 6250 2    50   ~ 0
DB9
Text Label -1100 6350 2    50   ~ 0
DB10
Text Label -1100 6450 2    50   ~ 0
DB11
Text Label -1100 6550 2    50   ~ 0
DB12
Text Label -1100 6650 2    50   ~ 0
DB13
Text Label -1100 6750 2    50   ~ 0
DB14
Text Label -1100 6850 2    50   ~ 0
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
Text Label -1100 4350 2    50   ~ 0
~SYSDEV
Text Label -1100 4450 2    50   ~ 0
~IODEV1XX
Text Label -1100 4550 2    50   ~ 0
~IODEV2XX
Text Label -1100 4650 2    50   ~ 0
~IODEV3XX
Text Label -1100 4750 2    50   ~ 0
~WS
Text Label -1100 4850 2    50   ~ 0
~WAITING
Text Label -1100 4950 2    50   ~ 0
~HALT
Text Label -1100 5050 2    50   ~ 0
~IRQ
Text Label -1100 5150 2    50   ~ 0
~IRQS
Text Label -1100 -3050 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-1700 -3050 -1100 -3050
Text Label -1100 -3150 2    50   ~ 0
~FPµC2
Text Label -1100 -3250 2    50   ~ 0
~FPµC1
Text Label -1100 -3350 2    50   ~ 0
~FPµC0
Text Label -1100 -3450 2    50   ~ 0
~FPµA0
Wire Wire Line
	-1700 -3150 -1100 -3150
Wire Wire Line
	-1700 -3250 -1100 -3250
Wire Wire Line
	-1700 -3350 -1100 -3350
Wire Wire Line
	-1700 -3450 -1100 -3450
Text Label -1100 -4250 2    50   ~ 0
~END
Text Label -1100 -4350 2    50   ~ 0
~WEN
Text Label -1100 -4450 2    50   ~ 0
~REN
Text Label -1100 -4550 2    50   ~ 0
~IO
Text Label -1100 -4650 2    50   ~ 0
~MEM
Wire Wire Line
	-1700 -4350 -1100 -4350
Wire Wire Line
	-1700 -4450 -1100 -4450
Wire Wire Line
	-1700 -4550 -1100 -4550
Wire Wire Line
	-1700 -4650 -1100 -4650
Text Label -3450 -4350 0    50   ~ 0
~ENDEXT
Text Label -3450 -4950 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	-3450 -4950 -2850 -4950
Text Label -3450 -4550 0    50   ~ 0
CLK4
Wire Wire Line
	-2850 -4750 -3450 -4750
Text Label -3450 -4450 0    50   ~ 0
~HALT
Text Label -1250 -5850 2    50   ~ 0
T34
Text Label -1250 -6000 2    50   ~ 0
CLK4
Text Label -1250 -6100 2    50   ~ 0
CLK3
Text Label -1250 -6200 2    50   ~ 0
CLK2
Text Label -1250 -6300 2    50   ~ 0
CLK1
Text Label -1250 -6450 2    50   ~ 0
~RSTHOLD
$Sheet
S -2850 -6600 1150 1050
U 5E36D9C8
F0 "Clock Generator" 50
F1 "cft_clk.sch" 50
F2 "CLK1" O R -1700 -6300 50 
F3 "CLK2" O R -1700 -6200 50 
F4 "CLK3" O R -1700 -6100 50 
F5 "CLK4" O R -1700 -6000 50 
F6 "~RESET" I L -2850 -6450 50 
F7 "FPCLK" I L -2850 -6200 50 
F8 "~RSTHOLD" O R -1700 -6450 50 
F9 "POWEROK" I L -2850 -5850 50 
F10 "~FPRESET" I L -2850 -6300 50 
F11 "~FPCLK~⁄CLK" I L -2850 -6100 50 
F12 "T34" O R -1700 -5850 50 
F13 "16MHz" O R -1700 -5750 50 
$EndSheet
Wire Wire Line
	-1250 -6450 -1700 -6450
Text Label -3450 -5850 0    50   ~ 0
POWEROK
Text Label -3450 -6100 0    50   ~ 0
~FPCLK~⁄CLK
Text Label -3450 -6200 0    50   ~ 0
FPCLK
Text Label -3450 -6300 0    50   ~ 0
~FPRESET
Wire Wire Line
	-2850 -6100 -3450 -6100
Wire Wire Line
	-2850 -6200 -3450 -6200
Wire Wire Line
	-2850 -6300 -3450 -6300
Wire Wire Line
	-2850 -5850 -3450 -5850
Text Label -1100 -5050 2    50   ~ 0
RADDR[0..4]
Text Label -1100 -4950 2    50   ~ 0
WADDR[0..4]
Text Label -1100 -4850 2    50   ~ 0
COND[0..4]
Text Label -1100 -4750 2    50   ~ 0
ACTION[0..3]
Text Label 1600 -6450 2    50   ~ 0
IR[0..15]
Text Label 1600 -6050 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	1000 -6050 1600 -6050
Wire Bus Line
	-150 -6250 -750 -6250
Text Label -750 -6250 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	1000 -6250 1600 -6250
Wire Wire Line
	1000 -6150 1600 -6150
Text Label 1600 -6250 2    50   ~ 0
~FPIRL
Text Label 1600 -6150 2    50   ~ 0
~FPIRH
Wire Wire Line
	-1700 -3550 -1100 -3550
Text Label -1100 -3550 2    50   ~ 0
FPFETCH
Wire Bus Line
	1000 -5350 1600 -5350
Text Label 1600 -5350 2    50   ~ 0
IBUS[0..15]
Wire Bus Line
	-150 -4900 -750 -4900
Text Label -750 -4900 0    50   ~ 0
PC[10..15]
Text Label -750 -5250 0    50   ~ 0
~END
Wire Bus Line
	-2850 -2050 -3450 -2050
Text Label -3450 -2050 0    50   ~ 0
IBUS[0..15]
Text Label -1100 -1350 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-1700 -1350 -1100 -1350
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P 550 8600
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR0106"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H 550 8450 50  0001 C CNN
F 1 "+5V" H 492 8637 50  0000 R CNN
F 2 "" H 550 8600 50  0001 C CNN
F 3 "" H 550 8600 50  0001 C CNN
	1    550  8600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552A6
P 550 9000
AR Path="/5F67D4B5/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A6" Ref="#PWR0113"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H 550 8750 50  0001 C CNN
F 1 "GND" H 472 8963 50  0000 R CNN
F 2 "" H 550 9000 50  0001 C CNN
F 3 "" H 550 9000 50  0001 C CNN
	1    550  9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  8600 550  8700
$Comp
L Device:CP_Small C103
U 1 1 5DD552AD
P 550 8800
AR Path="/5DD552AD" Ref="C103"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C103" H 462 8846 50  0000 R CNN
F 1 "47µF" H 462 8755 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 550 8800 50  0001 C CNN
F 3 "~" H 550 8800 50  0001 C CNN
	1    550  8800
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  8900 550  9000
$Comp
L power:+5V #PWR?
U 1 1 5DD552B4
P 100 8600
AR Path="/5F67D4B5/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD552B4" Ref="#PWR0105"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0105" H 100 8450 50  0001 C CNN
F 1 "+5V" H 42  8637 50  0000 R CNN
F 2 "" H 100 8600 50  0001 C CNN
F 3 "" H 100 8600 50  0001 C CNN
	1    100  8600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552BA
P 100 9000
AR Path="/5F67D4B5/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD552BA" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 100 8750 50  0001 C CNN
F 1 "GND" H 22  8963 50  0000 R CNN
F 2 "" H 100 9000 50  0001 C CNN
F 3 "" H 100 9000 50  0001 C CNN
	1    100  9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	100  8600 100  8700
$Comp
L Device:CP_Small C102
U 1 1 5DD552C1
P 100 8800
AR Path="/5DD552C1" Ref="C102"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C102" H 12  8846 50  0000 R CNN
F 1 "47µF" H 12  8755 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 100 8800 50  0001 C CNN
F 3 "~" H 100 8800 50  0001 C CNN
	1    100  8800
	1    0    0    -1  
$EndComp
Wire Wire Line
	100  8900 100  9000
Wire Wire Line
	-3450 -4850 -2850 -4850
Text Label -3450 -4850 0    50   ~ 0
CLK1
Wire Bus Line
	1000 -6450 1600 -6450
$Sheet
S -150 -6600 1150 750 
U 5F63066B
F0 "Instruction Register (IR)" 50
F1 "cfg_reg_ir.sch" 50
F2 "IBUS[0..15]" T L -150 -6250 50 
F3 "IR[0..15]" B R 1000 -6450 50 
F4 "~FPIRL" I R 1000 -6250 50 
F5 "~FPIRH" I R 1000 -6150 50 
F6 "FPD[0..7]" T R 1000 -6050 50 
F7 "~WRITE-IR" I L -150 -6450 50 
$EndSheet
Wire Bus Line
	-750 -5000 -150 -5000
Text Label -750 -5000 0    50   ~ 0
IR[0..11]
Wire Wire Line
	-2850 -1900 -3450 -1900
Wire Wire Line
	-2850 -1800 -3450 -1800
Wire Wire Line
	-2850 -1700 -3450 -1700
Wire Wire Line
	-2850 -1600 -3450 -1600
Wire Wire Line
	-2850 -1500 -3450 -1500
Wire Wire Line
	-2850 -1350 -3450 -1350
Text Label -3450 -1350 0    50   ~ 0
~FPFLAGS
Text Label -3450 -1900 0    50   ~ 0
FI
Text Label -3450 -1800 0    50   ~ 0
FV
Text Label -3450 -1700 0    50   ~ 0
FL
Text Label -3450 -1600 0    50   ~ 0
FZ
Text Label -3450 -1500 0    50   ~ 0
FN
Wire Wire Line
	-1700 -6300 -1250 -6300
Text Label -5250 5750 0    50   ~ 0
~FPRESET
Text Label -5250 4050 0    50   ~ 0
FPCLK
Text Label -5250 4150 0    50   ~ 0
~FPCLK~⁄CLK
Text Label -5250 5850 0    50   ~ 0
POWEROK
Wire Bus Line
	-1700 -5050 -1100 -5050
Wire Bus Line
	-1700 -4750 -1100 -4750
Wire Bus Line
	-1700 -4850 -1100 -4850
Wire Bus Line
	-1700 -4950 -1100 -4950
Text Label -5250 5650 0    50   ~ 0
FPFETCH
Wire Wire Line
	-1700 -4250 -1100 -4250
Wire Wire Line
	-750 -5250 -150 -5250
Wire Wire Line
	-1700 -6200 -1250 -6200
Wire Wire Line
	-1700 -6100 -1250 -6100
Wire Wire Line
	-1700 -6000 -1250 -6000
Wire Wire Line
	-1700 -5850 -1250 -5850
Text Label -3450 -5050 0    50   ~ 0
~RESET
Wire Wire Line
	-3450 -6450 -2850 -6450
Wire Wire Line
	-3450 -5050 -2850 -5050
Text Notes -3550 -7700 0    100  ~ 20
The Control Unit Board
Text Notes -3550 -6900 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Label -5250 4750 0    50   ~ 0
~FPµC2
Text Label -5250 4650 0    50   ~ 0
~FPµC1
Text Label -5250 4550 0    50   ~ 0
~FPµC0
Text Label -5250 4450 0    50   ~ 0
~FPµA0
Text Label -5250 4350 0    50   ~ 0
~FPIRL
Text Label -5250 4850 0    50   ~ 0
~FPIRH
Wire Wire Line
	-150 -5350 -750 -5350
Text Label -750 -5350 0    50   ~ 0
~READ-AGL
Text Label -750 -6450 0    50   ~ 0
~WRITE-IR
Wire Wire Line
	-150 -6450 -750 -6450
Text Label -3450 -6450 0    50   ~ 0
~RESET
Text Label -5250 4950 0    50   ~ 0
~FPFLAGS
Wire Wire Line
	-1700 -5750 -1250 -5750
Text Label -1250 -5750 2    50   ~ 0
16MHz
$Sheet
S -150 -5500 1150 750 
U 5F3EA987
F0 "Addressing Modes" 50
F1 "cft_agl.sch" 50
F2 "IBUS[0..15]" T R 1000 -5350 50 
F3 "IR[0..11]" I L -150 -5000 50 
F4 "PC[10..15]" I L -150 -4900 50 
F5 "~END" I L -150 -5250 50 
F6 "~READ-AGL" I L -150 -5350 50 
$EndSheet
Wire Wire Line
	-2850 -4450 -3450 -4450
Wire Wire Line
	-3450 -4350 -2850 -4350
Wire Wire Line
	-2850 -4550 -3450 -4550
Text Label -3450 -4750 0    50   ~ 0
CLK2
Text Label -750 -2350 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	-150 -1650 -750 -1650
Text Label 1600 -1500 2    50   ~ 0
~IRQSµC
Text Label 1600 -1600 2    50   ~ 0
~IRQS
Wire Wire Line
	1000 -1500 1600 -1500
Wire Wire Line
	1000 -1600 1600 -1600
Text Label 1600 -2350 2    50   ~ 0
FI
Wire Wire Line
	1000 -2350 1600 -2350
Text Label -750 -2050 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	-150 -2050 -750 -2050
Text Label -750 -1500 0    50   ~ 0
~IRQ
Text Label -750 -1650 0    50   ~ 0
~END
Text Label -750 -1750 0    50   ~ 0
~WRITE-FL
Text Label -750 -1850 0    50   ~ 0
IBUS15
Wire Wire Line
	-150 -1500 -750 -1500
Wire Wire Line
	-150 -1750 -750 -1750
Wire Wire Line
	-150 -1850 -750 -1850
Wire Wire Line
	-150 -2350 -750 -2350
Wire Bus Line
	-150 -4050 -750 -4050
Text Label -750 -3250 0    50   ~ 0
~SKIPEXT
Wire Wire Line
	-150 -3250 -750 -3250
Text Label -750 -3950 0    50   ~ 0
IR[0..6]
Text Label -750 -4050 0    50   ~ 0
COND[0..4]
Text Label -750 -3450 0    50   ~ 0
FN
Text Label -750 -3550 0    50   ~ 0
FZ
Text Label -750 -3650 0    50   ~ 0
FL
Text Label -750 -3750 0    50   ~ 0
FV
Wire Wire Line
	-150 -3450 -750 -3450
Wire Wire Line
	-150 -3550 -750 -3550
Wire Wire Line
	-150 -3650 -750 -3650
Wire Wire Line
	-150 -3750 -750 -3750
Wire Bus Line
	-750 -3950 -150 -3950
Wire Wire Line
	-150 -4150 -750 -4150
Text Label -750 -4150 0    50   ~ 0
CLK4
Wire Wire Line
	-150 -4250 -750 -4250
Text Label -750 -4250 0    50   ~ 0
~RESET
$Sheet
S -150 -4400 1150 1600
U 5EFCF155
F0 "Skip/Branch Unit" 50
F1 "cft_sbu.sch" 50
F2 "~COND" O R 1000 -4250 50 
F3 "FN" I L -150 -3450 50 
F4 "~SKIPEXT" T L -150 -3250 50 
F5 "FV" I L -150 -3750 50 
F6 "FL" I L -150 -3650 50 
F7 "FZ" I L -150 -3550 50 
F8 "CLK4" I L -150 -4150 50 
F9 "COND[0..4]" I L -150 -4050 50 
F10 "~RESET" I L -150 -4250 50 
F11 "IR[0..6]" I L -150 -3950 50 
$EndSheet
$Sheet
S -2850 -5200 1150 2450
U 5DEAC282
F0 "Microprogram Sequencer" 50
F1 "cft_microcode.sch" 50
F2 "~ENDEXT" I L -2850 -4350 50 
F3 "~RSTHOLD" I L -2850 -4950 50 
F4 "~HALT" I L -2850 -4450 50 
F5 "CLK4" I L -2850 -4550 50 
F6 "~RESET" I L -2850 -5050 50 
F7 "RADDR[0..4]" O R -1700 -5050 50 
F8 "WADDR[0..4]" O R -1700 -4950 50 
F9 "COND[0..4]" O R -1700 -4850 50 
F10 "ACTION[0..3]" O R -1700 -4750 50 
F11 "~MEM" O R -1700 -4650 50 
F12 "~IO" O R -1700 -4550 50 
F13 "~REN" O R -1700 -4450 50 
F14 "~WEN" O R -1700 -4350 50 
F15 "~END" O R -1700 -4250 50 
F16 "~IRQSµC" I L -2850 -2950 50 
F17 "~COND" I L -2850 -3950 50 
F18 "FPD[0..7]" T R -1700 -3050 50 
F19 "~FPµA0" I R -1700 -3450 50 
F20 "~FPµC0" I R -1700 -3350 50 
F21 "~FPµC1" I R -1700 -3250 50 
F22 "~FPµC2" I R -1700 -3150 50 
F23 "FPFETCH" O R -1700 -3550 50 
F24 "IDX0" I L -2850 -4150 50 
F25 "IDX1" I L -2850 -4050 50 
F26 "IR7" I L -2850 -3850 50 
F27 "IR8" I L -2850 -3750 50 
F28 "IR9" I L -2850 -3650 50 
F29 "IR10" I L -2850 -3550 50 
F30 "IR11" I L -2850 -3450 50 
F31 "IR12" I L -2850 -3350 50 
F32 "IR13" I L -2850 -3250 50 
F33 "IR14" I L -2850 -3150 50 
F34 "IR15" I L -2850 -3050 50 
F35 "CLK1" I L -2850 -4850 50 
F36 "CLK2" I L -2850 -4750 50 
F37 "~WAITING" I L -2850 -2850 50 
F38 "CLK3" I L -2850 -4650 50 
$EndSheet
Wire Wire Line
	-2850 -4150 -3450 -4150
Wire Wire Line
	-2850 -4050 -3450 -4050
Wire Wire Line
	-2850 -3850 -3450 -3850
Wire Wire Line
	-2850 -3750 -3450 -3750
Wire Wire Line
	-2850 -3650 -3450 -3650
Wire Wire Line
	-2850 -3550 -3450 -3550
Wire Wire Line
	-2850 -3450 -3450 -3450
Wire Wire Line
	-2850 -3350 -3450 -3350
Wire Wire Line
	-2850 -3250 -3450 -3250
Wire Wire Line
	-2850 -3150 -3450 -3150
Wire Wire Line
	-2850 -3050 -3450 -3050
Wire Wire Line
	-2850 -3950 -3450 -3950
Text Label -3550 -3250 1    50   ~ 0
IR[0..15]
Entry Wire Line
	-3550 -2950 -3450 -3050
Entry Wire Line
	-3550 -3750 -3450 -3850
Entry Wire Line
	-3550 -3650 -3450 -3750
Entry Wire Line
	-3550 -3550 -3450 -3650
Entry Wire Line
	-3550 -3450 -3450 -3550
Entry Wire Line
	-3550 -3350 -3450 -3450
Entry Wire Line
	-3550 -3250 -3450 -3350
Entry Wire Line
	-3550 -3150 -3450 -3250
Entry Wire Line
	-3550 -3050 -3450 -3150
Text Label -3350 -2950 0    50   ~ 0
~IRQSµC
Text Label -3450 -3050 0    50   ~ 0
IR15
Text Label -3450 -3150 0    50   ~ 0
IR14
Text Label -3450 -3250 0    50   ~ 0
IR13
Text Label -3450 -3350 0    50   ~ 0
IR12
Text Label -3450 -3450 0    50   ~ 0
IR11
Text Label -3450 -3550 0    50   ~ 0
IR10
Text Label -3450 -3650 0    50   ~ 0
IR9
Text Label -3450 -3750 0    50   ~ 0
IR8
Text Label -3450 -3850 0    50   ~ 0
IR7
Wire Wire Line
	-2850 -2950 -3350 -2950
Text Label -3450 -4050 0    50   ~ 0
IDX1
Text Label -3450 -4150 0    50   ~ 0
IDX0
Text Label -3450 -3950 0    50   ~ 0
~COND
Wire Wire Line
	-2850 -2850 -3350 -2850
Wire Wire Line
	1000 -4250 1600 -4250
Text Label 1600 -4250 2    50   ~ 0
~COND
Text Label -3350 -2850 0    50   ~ 0
~WAITING
Wire Bus Line
	6250 -3500 5400 -3500
Text Label 5400 -3500 0    50   ~ 0
IR[0..2]
Wire Wire Line
	6250 -4350 5400 -4350
Wire Wire Line
	6250 -4250 5400 -4250
Wire Wire Line
	6250 -4150 5400 -4150
Wire Wire Line
	6250 -4050 5400 -4050
Text Label 5400 -4350 0    50   ~ 0
~RSTHOLD
Text Label 5400 -4250 0    50   ~ 0
CLK2
Text Label 5400 -4150 0    50   ~ 0
CLK3
Text Label 5400 -4050 0    50   ~ 0
T34
Wire Wire Line
	5400 -3200 6250 -3200
Text Label 5400 -3200 0    50   ~ 0
~FPCTX
Wire Bus Line
	7400 -3200 8250 -3200
Text Label 8250 -3200 2    50   ~ 0
FPD[0..7]
$Comp
L alexios:16V8 U2
U 1 1 608B34AB
P -3350 2250
F 0 "U2" H -3350 3000 50  0000 C CNN
F 1 "16V8" H -3350 2900 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -3350 2250 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -3350 2250 50  0001 C CNN
F 4 "CUWDEC00" V -3350 2250 50  0000 C CNB "Signature"
F 5 "ctl-waddr-decode.jed" H -3350 1600 50  0000 C CNN "Image Filename"
	1    -3350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3800 1100 -4250 1100
Wire Wire Line
	-3800 900  -4250 900 
Wire Wire Line
	-3800 1000 -4250 1000
Wire Wire Line
	-3800 800  -4250 800 
Wire Wire Line
	-3800 700  -4250 700 
Text Label -4250 1100 0    50   ~ 0
RADDR0
Text Label -4250 900  0    50   ~ 0
RADDR1
Text Label -4250 1000 0    50   ~ 0
RADDR2
Text Label -4250 800  0    50   ~ 0
RADDR3
Text Label -4250 700  0    50   ~ 0
RADDR4
Wire Wire Line
	-2400 300  -2900 300 
Wire Wire Line
	-2400 400  -2900 400 
Wire Wire Line
	-2400 500  -2900 500 
Wire Wire Line
	-2400 600  -2900 600 
Text Label -2400 300  2    50   ~ 0
~READ-DR
Text Label -2400 400  2    50   ~ 0
~READ-PC
Text Label -2400 500  2    50   ~ 0
~READ-FL
Text Label -2400 600  2    50   ~ 0
~READ-AGL
Wire Wire Line
	-3800 2000 -4250 2000
Wire Wire Line
	-3800 2100 -4250 2100
Wire Wire Line
	-3800 2200 -4250 2200
Wire Wire Line
	-3800 1800 -4250 1800
Wire Wire Line
	-3800 1900 -4250 1900
Wire Wire Line
	-3800 2700 -4250 2700
Text Label -4250 2700 0    50   ~ 0
CLK4
Text Label -4250 2000 0    50   ~ 0
WADDR2
Text Label -4250 2100 0    50   ~ 0
WADDR1
Text Label -4250 2200 0    50   ~ 0
WADDR0
Text Label -4250 1800 0    50   ~ 0
WADDR4
Text Label -4250 1900 0    50   ~ 0
WADDR3
Wire Wire Line
	-2400 1800 -2900 1800
Wire Wire Line
	-2400 1900 -2900 1900
Wire Wire Line
	-2400 2000 -2900 2000
Wire Wire Line
	-2400 2100 -2900 2100
Text Label -2400 1800 2    50   ~ 0
~WRITE-DR
Text Label -2400 1900 2    50   ~ 0
~WRITE-PC
Text Label -2400 2000 2    50   ~ 0
~WRITE-FL
Text Label -2400 2100 2    50   ~ 0
~WRITE-IR
NoConn ~ -3800 2300
NoConn ~ -3800 2400
NoConn ~ -3800 2500
NoConn ~ -3800 2600
$Comp
L alexios:16V8 U1
U 2 1 6184158E
P -1500 900
F 0 "U1" H -1320 946 50  0000 L CNN
F 1 "16V8" H -1320 855 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -1500 900 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -1500 900 50  0001 C CNN
F 4 "CURDEC00" H -1320 855 50  0001 L CNB "Signature"
F 5 "ctl-raddr-decode.jed" H -1320 809 50  0001 L CNN "Image Filename"
	2    -1500 900 
	1    0    0    -1  
$EndComp
$Comp
L alexios:16V8 U2
U 2 1 61841B1E
P -1450 2100
F 0 "U2" H -1270 2146 50  0000 L CNN
F 1 "16V8" H -1270 2055 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -1450 2100 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -1450 2100 50  0001 C CNN
F 4 "CUWDEC00" V -1050 2050 50  0001 C CNB "Signature"
F 5 "ctl-waddr-decode.jed" H -1450 1450 50  0001 C CNN "Image Filename"
	2    -1450 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61848C85
P -1800 2000
AR Path="/5CE16E65/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/61848C85" Ref="#PWR0137"  Part="1" 
AR Path="/5D54E677/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/61848C85" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/61848C85" Ref="#PWR?"  Part="1" 
F 0 "#PWR0137" H -1800 1850 50  0001 C CNN
F 1 "+5V" H -1785 2173 50  0000 C CNN
F 2 "" H -1800 2000 50  0001 C CNN
F 3 "" H -1800 2000 50  0001 C CNN
	1    -1800 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61848C8B
P -1800 2200
AR Path="/5CE16E65/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/61848C8B" Ref="#PWR0138"  Part="1" 
AR Path="/5D54E677/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/61848C8B" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/61848C8B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0138" H -1800 1950 50  0001 C CNN
F 1 "GND" H -1795 2027 50  0000 C CNN
F 2 "" H -1800 2200 50  0001 C CNN
F 3 "" H -1800 2200 50  0001 C CNN
	1    -1800 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61848C91
P -1800 2100
AR Path="/5CC0D65F/61848C91" Ref="C?"  Part="1" 
AR Path="/5CE16E65/61848C91" Ref="C?"  Part="1" 
AR Path="/61848C91" Ref="C2"  Part="1" 
AR Path="/5D54E677/61848C91" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/61848C91" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/61848C91" Ref="C?"  Part="1" 
AR Path="/5D892D5E/61848C91" Ref="C?"  Part="1" 
AR Path="/5D9672D4/61848C91" Ref="C?"  Part="1" 
F 0 "C2" H -1891 2146 50  0000 R CNN
F 1 "100nF" H -1891 2055 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1800 2100 50  0001 C CNN
F 3 "~" H -1800 2100 50  0001 C CNN
	1    -1800 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 618A940C
P -1850 800
AR Path="/5CE16E65/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/618A940C" Ref="#PWR0139"  Part="1" 
AR Path="/5D54E677/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/618A940C" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/618A940C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0139" H -1850 650 50  0001 C CNN
F 1 "+5V" H -1835 973 50  0000 C CNN
F 2 "" H -1850 800 50  0001 C CNN
F 3 "" H -1850 800 50  0001 C CNN
	1    -1850 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 618A9412
P -1850 1000
AR Path="/5CE16E65/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/618A9412" Ref="#PWR0140"  Part="1" 
AR Path="/5D54E677/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/618A9412" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/618A9412" Ref="#PWR?"  Part="1" 
F 0 "#PWR0140" H -1850 750 50  0001 C CNN
F 1 "GND" H -1845 827 50  0000 C CNN
F 2 "" H -1850 1000 50  0001 C CNN
F 3 "" H -1850 1000 50  0001 C CNN
	1    -1850 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 618A9418
P -1850 900
AR Path="/5CC0D65F/618A9418" Ref="C?"  Part="1" 
AR Path="/5CE16E65/618A9418" Ref="C?"  Part="1" 
AR Path="/618A9418" Ref="C1"  Part="1" 
AR Path="/5D54E677/618A9418" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/618A9418" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/618A9418" Ref="C?"  Part="1" 
AR Path="/5D892D5E/618A9418" Ref="C?"  Part="1" 
AR Path="/5D9672D4/618A9418" Ref="C?"  Part="1" 
F 0 "C1" H -1941 946 50  0000 R CNN
F 1 "100nF" H -1941 855 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1850 900 50  0001 C CNN
F 3 "~" H -1850 900 50  0001 C CNN
	1    -1850 900 
	1    0    0    -1  
$EndComp
Connection ~ -1850 1000
Connection ~ -1850 800 
Connection ~ -1800 2000
Connection ~ -1800 2200
Wire Wire Line
	-3800 300  -4250 300 
Text Label -4250 300  0    50   ~ 0
T34
Wire Wire Line
	-2900 700  -2400 700 
Text Label -2400 700  2    50   ~ 0
~READ-CS
$Comp
L Device:CP_Small C22
U 1 1 5EFD0822
P 9150 10700
AR Path="/5EFD0822" Ref="C22"  Part="1" 
AR Path="/5D34E810/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5EFD0822" Ref="C?"  Part="1" 
F 0 "C22" H 9062 10746 50  0000 R CNN
F 1 "47µF" H 9062 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9150 10700 50  0001 C CNN
F 3 "~" H 9150 10700 50  0001 C CNN
	1    9150 10700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C21
U 1 1 5DF0FF8F
P 8700 10700
AR Path="/5DF0FF8F" Ref="C21"  Part="1" 
AR Path="/5D34E810/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF8F" Ref="C?"  Part="1" 
F 0 "C21" H 8612 10746 50  0000 R CNN
F 1 "47µF" H 8612 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8700 10700 50  0001 C CNN
F 3 "~" H 8700 10700 50  0001 C CNN
	1    8700 10700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C20
U 1 1 5DF0FFA3
P 8250 10700
AR Path="/5DF0FFA3" Ref="C20"  Part="1" 
AR Path="/5D34E810/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FFA3" Ref="C?"  Part="1" 
F 0 "C20" H 8162 10746 50  0000 R CNN
F 1 "47µF" H 8162 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8250 10700 50  0001 C CNN
F 3 "~" H 8250 10700 50  0001 C CNN
	1    8250 10700
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1700 -2350 -1100 -2350
Text Label -1100 -2350 2    50   ~ 0
~READ-FL
Text Label -750 -2250 0    50   ~ 0
CLK3
Wire Wire Line
	-150 -2250 -750 -2250
Wire Wire Line
	1000 -1950 1600 -1950
Wire Wire Line
	1000 -1850 1600 -1850
Wire Wire Line
	1000 -1750 1600 -1750
Text Label 1600 -1950 2    50   ~ 0
~INCPC
Text Label 1600 -1850 2    50   ~ 0
~INCDR
Text Label 1600 -1750 2    50   ~ 0
~DECDR
Text Label 1600 -2150 2    50   ~ 0
~IR-IDX
Text Label 1600 -2250 2    50   ~ 0
~IDXEN
Wire Wire Line
	1000 -2250 1600 -2250
Wire Wire Line
	1000 -2150 1600 -2150
$Comp
L alexios:16V8 U1
U 1 1 60850EA3
P -3350 750
F 0 "U1" H -3350 1500 50  0000 C CNN
F 1 "16V8" H -3350 1400 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -3350 750 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -3350 750 50  0001 C CNN
F 4 "CURDEC00" V -3350 750 50  0000 C CNB "Signature"
F 5 "ctl-raddr-decode.jed" H -3350 100 50  0000 C CNN "Image Filename"
	1    -3350 750 
	1    0    0    -1  
$EndComp
NoConn ~ -2900 2500
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
Text Label -5250 5050 0    50   ~ 0
~FPAEXT
Text Label -3450 -4650 0    50   ~ 0
CLK3
Wire Wire Line
	-2850 -4650 -3450 -4650
Wire Wire Line
	-1450 4250 -1100 4250
Text Label -1100 4250 2    50   ~ 0
T34
Text Notes 8850 -2500 0    100  ~ 20
Data Bus Driver & Wait States
Wire Wire Line
	10600 -3100 11500 -3100
Wire Wire Line
	11500 -3100 11500 -2050
Wire Wire Line
	10550 -2050 11500 -2050
Text Label 11450 -3100 2    50   ~ 0
~ABEN
Wire Wire Line
	10550 -1500 11400 -1500
Text Label 11400 -1500 2    50   ~ 0
~R
Wire Wire Line
	9400 -1300 8550 -1300
Text Label 8550 -1300 0    50   ~ 0
~REN
Text Label -5250 5150 0    50   ~ 0
~FPPCL
Text Label -5250 5250 0    50   ~ 0
~FPPCH
Text Label -5250 5350 0    50   ~ 0
~FPDRL
Text Label -5250 5450 0    50   ~ 0
~FPDRH
Text Label -5250 4250 0    50   ~ 0
~FPCTX
Wire Wire Line
	-3800 400  -4250 400 
Wire Wire Line
	-3800 500  -4250 500 
Wire Wire Line
	-3800 600  -4250 600 
Text Label -4250 400  0    50   ~ 0
IR6
Text Label -4250 500  0    50   ~ 0
IR7
Text Label -4250 600  0    50   ~ 0
IR8
Text Label -4250 1200 0    50   ~ 0
IR9
Wire Wire Line
	-3800 1200 -4250 1200
Wire Wire Line
	-2900 800  -2400 800 
Wire Wire Line
	-2900 900  -2400 900 
Wire Wire Line
	-2900 1000 -2400 1000
Text Label -2400 1000 2    50   ~ 0
~IDXEN
Text Label -2400 900  2    50   ~ 0
IDX0
Text Label -2400 800  2    50   ~ 0
IDX1
Wire Notes Line width 24 style solid
	-4450 1100 -7250 1100
Wire Notes Line width 24 style solid
	-4450 1100 -4450 400 
Wire Notes Line width 24 style solid
	-7250 400  -4450 400 
Wire Notes Line width 24 style solid
	-7250 400  -7250 1100
Text Notes -7150 650  0    63   ~ 13
Note: IDX Registration
Text Notes -7150 1000 0    50   ~ 0
IDX0 and IDX1 are not registered because they rely solely on the\ncurrent value of the IR. IR is latched during CLK4, so at worst\nIDX will be valid at CLK1 + ~20ns.
$Sheet
S 3200 -6650 1150 1000
U 5D9672D4
F0 "Program Counter" 50
F1 "cft-reg-pc.sch" 50
F2 "~FPH" I R 4350 -5900 50 
F3 "~FPL" I R 4350 -5800 50 
F4 "~READ" I L 3200 -6100 50 
F5 "~INC" I L 3200 -5900 50 
F6 "~WRITE" I L 3200 -6000 50 
F7 "RESET" I L 3200 -6500 50 
F8 "IBUS[0..15]" I L 3200 -6300 50 
F9 "FPD[0..7]" T R 4350 -6000 50 
F10 "PC[10..15]" O R 4350 -6500 50 
$EndSheet
Wire Wire Line
	3200 -6500 3100 -6500
Wire Wire Line
	3100 -6500 3100 -6450
$Comp
L power:GND #PWR0101
U 1 1 61693C57
P 3100 -6450
F 0 "#PWR0101" H 3100 -6700 50  0001 C CNN
F 1 "GND" H 2950 -6450 50  0000 C CNN
F 2 "" H 3100 -6450 50  0001 C CNN
F 3 "" H 3100 -6450 50  0001 C CNN
	1    3100 -6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 -5200 3100 -5200
Wire Wire Line
	3100 -5200 3100 -5150
$Comp
L power:GND #PWR0103
U 1 1 616940D5
P 3100 -5150
F 0 "#PWR0103" H 3100 -5400 50  0001 C CNN
F 1 "GND" H 2950 -5150 50  0000 C CNN
F 2 "" H 3100 -5150 50  0001 C CNN
F 3 "" H 3100 -5150 50  0001 C CNN
	1    3100 -5150
	1    0    0    -1  
$EndComp
NoConn ~ -2900 2200
NoConn ~ -2900 2300
NoConn ~ -2900 2400
Text Label -5250 5550 0    50   ~ 0
~FPRAM~∕ROM
$Comp
L power:+5V #PWR?
U 1 1 610E4076
P 9650 9650
AR Path="/5F67D4B5/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/610E4076" Ref="#PWR0182"  Part="1" 
AR Path="/5D34E810/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E4076" Ref="#PWR?"  Part="1" 
F 0 "#PWR0182" H 9650 9500 50  0001 C CNN
F 1 "+5V" H 9592 9687 50  0000 R CNN
F 2 "" H 9650 9650 50  0001 C CNN
F 3 "" H 9650 9650 50  0001 C CNN
	1    9650 9650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610E407C
P 9650 10050
AR Path="/5F67D4B5/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/610E407C" Ref="#PWR0183"  Part="1" 
AR Path="/5D34E810/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E407C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0183" H 9650 9800 50  0001 C CNN
F 1 "GND" H 9572 10013 50  0000 R CNN
F 2 "" H 9650 10050 50  0001 C CNN
F 3 "" H 9650 10050 50  0001 C CNN
	1    9650 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 9650 9650 9750
$Comp
L Device:CP_Small C110
U 1 1 610E4083
P 9650 9850
AR Path="/610E4083" Ref="C110"  Part="1" 
AR Path="/5D34E810/610E4083" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/610E4083" Ref="C?"  Part="1" 
F 0 "C110" H 9562 9896 50  0000 R CNN
F 1 "47µF" H 9562 9805 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9650 9850 50  0001 C CNN
F 3 "~" H 9650 9850 50  0001 C CNN
	1    9650 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 9950 9650 10050
$Comp
L power:+5V #PWR?
U 1 1 610E408A
P 9200 9650
AR Path="/5F67D4B5/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/610E408A" Ref="#PWR0184"  Part="1" 
AR Path="/5D34E810/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E408A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0184" H 9200 9500 50  0001 C CNN
F 1 "+5V" H 9142 9687 50  0000 R CNN
F 2 "" H 9200 9650 50  0001 C CNN
F 3 "" H 9200 9650 50  0001 C CNN
	1    9200 9650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610E4090
P 9200 10050
AR Path="/5F67D4B5/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/610E4090" Ref="#PWR0185"  Part="1" 
AR Path="/5D34E810/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E4090" Ref="#PWR?"  Part="1" 
F 0 "#PWR0185" H 9200 9800 50  0001 C CNN
F 1 "GND" H 9122 10013 50  0000 R CNN
F 2 "" H 9200 10050 50  0001 C CNN
F 3 "" H 9200 10050 50  0001 C CNN
	1    9200 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 9650 9200 9750
$Comp
L Device:CP_Small C109
U 1 1 610E4097
P 9200 9850
AR Path="/610E4097" Ref="C109"  Part="1" 
AR Path="/5D34E810/610E4097" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/610E4097" Ref="C?"  Part="1" 
F 0 "C109" H 9112 9896 50  0000 R CNN
F 1 "47µF" H 9112 9805 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9200 9850 50  0001 C CNN
F 3 "~" H 9200 9850 50  0001 C CNN
	1    9200 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 9950 9200 10050
Text Label -750 -2150 0    50   ~ 0
CLK4
Wire Wire Line
	-150 -2150 -750 -2150
$Sheet
S -150 -2450 1150 1050
U 5F67D4B5
F0 "Interrupt State Machine" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L -150 -1500 50 
F3 "~RESET" I L -150 -2350 50 
F4 "FI" O R 1000 -2350 50 
F5 "~IRQS" O R 1000 -1600 50 
F6 "~END" I L -150 -1650 50 
F7 "CLK4" I L -150 -2150 50 
F8 "~IRQSµC" O R 1000 -1500 50 
F9 "IBUS15" I L -150 -1850 50 
F10 "~WRITE-FL" I L -150 -1750 50 
F11 "ACTION[0..3]" I L -150 -2050 50 
F12 "~IR-IDX" O R 1000 -2150 50 
F13 "~ACTION-INCPC" O R 1000 -1950 50 
F14 "~ACTION-DECDR" O R 1000 -1750 50 
F15 "~ACTION-INCDR" O R 1000 -1850 50 
F16 "CLK3" I L -150 -2250 50 
F17 "IDXEN" I R 1000 -2250 50 
$EndSheet
$Sheet
S 9400 -2300 1150 1500
U 5D46B22D
F0 "Wait States & Write Strobes" 50
F1 "cft_ws_busen.sch" 50
F2 "T34" I L 9400 -1750 50 
F3 "~RSTHOLD" I L 9400 -2150 50 
F4 "CLK3" I L 9400 -1850 50 
F5 "~MEM" I L 9400 -1500 50 
F6 "~IO" I L 9400 -1400 50 
F7 "~HALT" I L 9400 -2050 50 
F8 "~WEN" I L 9400 -1200 50 
F9 "~WS" I L 9400 -1050 50 
F10 "~W" T R 10550 -1400 50 
F11 "IBUS[0..15]" T L 9400 -950 50 
F12 "DB[0..15]" T R 10550 -950 50 
F13 "~WAITING" O R 10550 -1300 50 
F14 "CLK1" I L 9400 -1950 50 
F15 "~ABEN" O R 10550 -2050 50 
F16 "~REN" I L 9400 -1300 50 
F17 "~R" T R 10550 -1500 50 
$EndSheet
Text Label 8550 -1950 0    50   ~ 0
CLK2
$Sheet
S -2850 -2500 1150 1300
U 5D69F3FD
F0 "Flag Unit" 50
F1 "flag_unit.sch" 50
F2 "FPD[0..7]" T R -1700 -1350 50 
F3 "IBUS[8..15]" T L -2850 -2050 50 
F4 "~FPFLAGS" I L -2850 -1350 50 
F5 "FI" I L -2850 -1900 50 
F6 "FV" I L -2850 -1800 50 
F7 "FL" I L -2850 -1700 50 
F8 "FZ" I L -2850 -1600 50 
F9 "FN" I L -2850 -1500 50 
F10 "~READ-FL" I R -1700 -2350 50 
$EndSheet
NoConn ~ -3000 6850
NoConn ~ -3000 6950
NoConn ~ -3000 7050
NoConn ~ -3000 7150
NoConn ~ -3000 7250
NoConn ~ -3000 7350
NoConn ~ -3000 7450
NoConn ~ -3000 7550
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61115B2C
P -7100 3850
F 0 "#FLG0101" H -7100 3925 50  0001 C CNN
F 1 "PWR_FLAG" V -7100 3977 50  0000 L CNN
F 2 "" H -7100 3850 50  0001 C CNN
F 3 "~" H -7100 3850 50  0001 C CNN
	1    -7100 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-7100 3850 -7050 3850
Connection ~ -7050 3850
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 61150065
P -5650 6750
F 0 "#FLG0102" H -5650 6825 50  0001 C CNN
F 1 "PWR_FLAG" V -5650 6878 50  0000 L CNN
F 2 "" H -5650 6750 50  0001 C CNN
F 3 "~" H -5650 6750 50  0001 C CNN
	1    -5650 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	-5700 6750 -5650 6750
Connection ~ -5700 6750
Wire Wire Line
	-3550 4350 -3200 4350
Wire Wire Line
	-5250 4350 -4750 4350
Wire Wire Line
	-3000 4350 -2650 4350
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
Text Label -7350 4050 0    50   ~ 0
CLK1
Wire Wire Line
	-7350 4050 -7000 4050
NoConn ~ -4750 3850
NoConn ~ -4750 3950
Wire Bus Line
	-3550 -3750 -3550 -2950
$EndSCHEMATC
