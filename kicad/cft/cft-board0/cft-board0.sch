EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
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
P 7900 13450
AR Path="/5F67D4B5/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16F5" Ref="#PWR0118"  Part="1" 
AR Path="/5D34E810/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H 7900 13300 50  0001 C CNN
F 1 "+5V" H 7842 13487 50  0000 R CNN
F 2 "" H 7900 13450 50  0001 C CNN
F 3 "" H 7900 13450 50  0001 C CNN
	1    7900 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8B16FB
P 7900 13850
AR Path="/5F67D4B5/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16FB" Ref="#PWR0128"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0128" H 7900 13600 50  0001 C CNN
F 1 "GND" H 7822 13813 50  0000 R CNN
F 2 "" H 7900 13850 50  0001 C CNN
F 3 "" H 7900 13850 50  0001 C CNN
	1    7900 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 13450 7900 13550
$Comp
L Device:CP_Small C7
U 1 1 5D8B1702
P 7900 13650
AR Path="/5D8B1702" Ref="C7"  Part="1" 
AR Path="/5D34E810/5D8B1702" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8B1702" Ref="C?"  Part="1" 
F 0 "C7" H 7812 13696 50  0000 R CNN
F 1 "47µF" H 7812 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7900 13650 50  0001 C CNN
F 3 "~" H 7900 13650 50  0001 C CNN
	1    7900 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 13750 7900 13850
$Comp
L power:+5V #PWR?
U 1 1 5D8C8446
P 7450 13450
AR Path="/5F67D4B5/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D8C8446" Ref="#PWR0117"  Part="1" 
AR Path="/5D34E810/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8446" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H 7450 13300 50  0001 C CNN
F 1 "+5V" H 7392 13487 50  0000 R CNN
F 2 "" H 7450 13450 50  0001 C CNN
F 3 "" H 7450 13450 50  0001 C CNN
	1    7450 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8C844C
P 7450 13850
AR Path="/5F67D4B5/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D8C844C" Ref="#PWR0127"  Part="1" 
AR Path="/5D34E810/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C844C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0127" H 7450 13600 50  0001 C CNN
F 1 "GND" H 7372 13813 50  0000 R CNN
F 2 "" H 7450 13850 50  0001 C CNN
F 3 "" H 7450 13850 50  0001 C CNN
	1    7450 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 13450 7450 13550
$Comp
L Device:CP_Small C6
U 1 1 5D8C8453
P 7450 13650
AR Path="/5D8C8453" Ref="C6"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C6" H 7362 13696 50  0000 R CNN
F 1 "47µF" H 7362 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7450 13650 50  0001 C CNN
F 3 "~" H 7450 13650 50  0001 C CNN
	1    7450 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 13750 7450 13850
Text Notes 7050 1550 0    197  ~ 39
Registers
Text Label 6650 2100 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	7150 2100 6650 2100
Text Label 6650 3400 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	7150 3400 6650 3400
Text Label 6650 2300 0    50   ~ 0
~READ-PC
Text Label 6650 2400 0    50   ~ 0
~WRITE-PC
Wire Wire Line
	7150 3600 6650 3600
Wire Wire Line
	7150 3700 6650 3700
Wire Wire Line
	7150 3800 6650 3800
Wire Wire Line
	7150 3900 6650 3900
Text Label 6650 3600 0    50   ~ 0
~READ-DR
Text Label 6650 3700 0    50   ~ 0
~WRITE-DR
Wire Bus Line
	8300 2500 8800 2500
Text Label 8800 2500 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	8300 2300 8800 2300
Wire Wire Line
	8300 2400 8800 2400
Text Label 8800 2300 2    50   ~ 0
~FPPCH
Text Label 8800 2400 2    50   ~ 0
~FPPCL
Wire Bus Line
	8300 3900 8800 3900
Text Label 8800 3900 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	8300 3700 8800 3700
Wire Wire Line
	8300 3800 8800 3800
Text Label 8800 3700 2    50   ~ 0
~FPDRH
Text Label 8800 3800 2    50   ~ 0
~FPDRL
Wire Bus Line
	8300 2100 8800 2100
Text Label 8800 2100 2    50   ~ 0
PC[10..15]
Wire Wire Line
	7150 2500 6650 2500
Wire Wire Line
	7150 2400 6650 2400
Wire Wire Line
	7150 2300 6650 2300
$Sheet
S 7150 3250 1150 1000
U 5D967A8B
F0 "Data Register" 50
F1 "cft-reg-dr-sp.sch" 50
F2 "~FPH" I R 8300 3700 50 
F3 "~FPL" I R 8300 3800 50 
F4 "~READ" I L 7150 3600 50 
F5 "~INC" I L 7150 3800 50 
F6 "~WRITE" I L 7150 3700 50 
F7 "IBUS[0..15]" I L 7150 3400 50 
F8 "~DEC" I L 7150 3900 50 
F9 "FPD[0..7]" T R 8300 3900 50 
$EndSheet
Text Label 6650 3900 0    50   ~ 0
~DECDR
Text Label 6650 3800 0    50   ~ 0
~INCDR
Text Label 6650 2500 0    50   ~ 0
~INCPC
Text Notes 10650 14000 0    50   ~ 0
[RW]ADDR\n\n01000\n01001\n01010\n01011
Text Notes 11200 14000 0    50   ~ 0
Reg\n\nPC\nDR\nAC\nSP
Wire Notes Line width 12 style solid
	10600 13475 11400 13475
Wire Notes Line width 12 style solid
	10600 14050 10600 13475
Wire Notes Line width 12 style solid
	11400 14050 10600 14050
Wire Notes Line width 12 style solid
	11400 13475 11400 14050
Wire Notes Line style solid
	10600 13650 11400 13650
Wire Notes Line
	11150 13475 11150 14050
Text Notes 3200 13200 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 5750 13450
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H 5750 13300 50  0001 C CNN
F 1 "+5V" H 5692 13487 50  0000 R CNN
F 2 "" H 5750 13450 50  0001 C CNN
F 3 "" H 5750 13450 50  0001 C CNN
	1    5750 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 5750 13850
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR0115"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 5750 13600 50  0001 C CNN
F 1 "GND" H 5672 13813 50  0000 R CNN
F 2 "" H 5750 13850 50  0001 C CNN
F 3 "" H 5750 13850 50  0001 C CNN
	1    5750 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 13450 5750 13550
Wire Wire Line
	5750 13750 5750 13850
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 5300 13450
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR0108"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 5300 13300 50  0001 C CNN
F 1 "+5V" H 5242 13487 50  0000 R CNN
F 2 "" H 5300 13450 50  0001 C CNN
F 3 "" H 5300 13450 50  0001 C CNN
	1    5300 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF9C
P 5300 13850
AR Path="/5F67D4B5/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF9C" Ref="#PWR0114"  Part="1" 
AR Path="/5D34E810/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF9C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 5300 13600 50  0001 C CNN
F 1 "GND" H 5222 13813 50  0000 R CNN
F 2 "" H 5300 13850 50  0001 C CNN
F 3 "" H 5300 13850 50  0001 C CNN
	1    5300 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 13450 5300 13550
Wire Wire Line
	5300 13750 5300 13850
Wire Bus Line
	13750 1400 13250 1400
Text Label 13250 1400 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	14900 2250 15450 2250
Text Label 15450 2250 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	12500 1250 13000 1250
Text Label 13000 1250 2    50   ~ 0
AEXT[0..7]
Wire Bus Line
	11350 1900 10850 1900
Text Label 10850 1900 0    50   ~ 0
IBUS[0..15]
Text Label 15700 4050 2    50   ~ 0
~W
Wire Wire Line
	13750 1650 13250 1650
Text Label 13250 1650 0    50   ~ 0
~IO
Wire Wire Line
	14900 2150 15450 2150
Text Label 15450 2150 2    50   ~ 0
~FPAEXT
Wire Wire Line
	11350 2500 10850 2500
Text Label 10850 2500 0    50   ~ 0
~FPRAM~∕ROM
Text Label 12600 2500 0    50   ~ 0
~WAR
Text Label 10850 1800 0    50   ~ 0
WADDR[0..4]
Text Label 10850 1700 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	11350 1700 10850 1700
Wire Bus Line
	11350 1800 10850 1800
Wire Wire Line
	14900 1650 15450 1650
Wire Wire Line
	14900 1750 15450 1750
Wire Wire Line
	14900 1850 15450 1850
Wire Wire Line
	14900 1950 15450 1950
Text Label 15450 1650 2    50   ~ 0
~SYSDEV
Text Label 15450 1750 2    50   ~ 0
~IODEV1XX
Text Label 15450 1850 2    50   ~ 0
~IODEV2XX
Text Label 15450 1950 2    50   ~ 0
~IODEV3XX
$Sheet
S 13750 1100 1150 1500
U 5CC06F10
F0 "Address Register (AR)" 50
F1 "cft_ar.sch" 50
F2 "~IO" T L 13750 1650 50 
F3 "IBUS[0..15]" T L 13750 1400 50 
F4 "~WRITE-AR" I L 13750 2500 50 
F5 "AB[0..23]" O R 14900 1400 50 
F6 "AEXT[0..7]" I L 13750 1250 50 
F7 "~SYSDEV" O R 14900 1650 50 
F8 "~IODEV1XX" O R 14900 1750 50 
F9 "~IODEV2XX" O R 14900 1850 50 
F10 "~IODEV3XX" O R 14900 1950 50 
F11 "~FPAEXT" I R 14900 2150 50 
F12 "FPD[0..7]" T R 14900 2250 50 
F13 "~ABEN" I R 14900 2500 50 
$EndSheet
Text Label 15450 1400 2    50   ~ 0
AB[0..23]
Wire Bus Line
	14900 1400 15450 1400
Text Label 13250 1250 0    50   ~ 0
AEXT[0..7]
Wire Bus Line
	13750 1250 13250 1250
Text Notes 11000 900  0    100  ~ 20
Memory Bank Unit (MBU)
Text Label 13250 4400 0    50   ~ 0
~WS
Text Label 13250 4250 0    50   ~ 0
~WEN
Text Label 13250 4050 0    50   ~ 0
~IO
Text Label 13250 3950 0    50   ~ 0
~MEM
Text Label 13250 3400 0    50   ~ 0
~HALT
Text Label 13250 3300 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	13700 4400 13250 4400
Wire Wire Line
	13700 4250 13250 4250
Wire Wire Line
	13700 4050 13250 4050
Wire Wire Line
	13700 3950 13250 3950
Wire Wire Line
	13700 3400 13250 3400
Wire Wire Line
	13700 3300 13250 3300
Wire Wire Line
	14850 4050 15700 4050
Text Label 15700 4500 2    50   ~ 0
DB[0..15]
Wire Bus Line
	14850 4500 15700 4500
Text Label 13250 4500 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	13700 4500 13250 4500
Text Notes 7150 4650 0    100  ~ 20
Constant Store
Wire Bus Line
	8300 5000 8800 5000
Text Label 8800 5000 2    50   ~ 0
IBUS[0..15]
Text Label 6700 5000 0    50   ~ 0
RADDR[0..1]
Wire Bus Line
	7150 5000 6700 5000
Wire Wire Line
	11350 2000 10850 2000
Text Label 10850 2000 0    50   ~ 0
~IR-IDX
Wire Wire Line
	12500 2500 13750 2500
Text Notes 13650 850  0    100  ~ 20
Address Register
Wire Wire Line
	14850 4150 15700 4150
Text Label 15700 4150 2    50   ~ 0
~WAITING
Wire Wire Line
	13700 3500 13250 3500
Text Label 15700 3400 2    50   ~ 0
~ABEN
$Sheet
S 7150 4850 1150 450 
U 5E25A7FA
F0 "Constant Store" 50
F1 "cpu_cs.sch" 50
F2 "RADDR[0..1]" I L 7150 5000 50 
F3 "IBUS[0..15]" B R 8300 5000 50 
F4 "~READ-CS" I L 7150 5150 50 
$EndSheet
Wire Wire Line
	7150 5150 6700 5150
Text Label 6700 5150 0    50   ~ 0
~READ-CS
$Sheet
S 11350 1100 1150 1550
U 61F95ACC
F0 "Memory Bank Unit (MBU)" 50
F1 "mbu.sch" 50
F2 "AEXT[0..7]" O R 12500 1250 50 
F3 "WADDR[0..4]" I L 11350 1800 50 
F4 "~FPRAM~∕ROM" I L 11350 2500 50 
F5 "IBUS[0..7]" T L 11350 1900 50 
F6 "RADDR[0..4]" I L 11350 1700 50 
F7 "~IR-IDX" I L 11350 2000 50 
F8 "~WAR" O R 12500 2500 50 
F9 "CLK4" I L 11350 1450 50 
F10 "CLK2" I L 11350 1350 50 
F11 "~RSTHOLD" I L 11350 1250 50 
F12 "IR[0..2]" I L 11350 2100 50 
F13 "T34" I L 11350 1550 50 
F14 "~FPCTX" I L 11350 2400 50 
F15 "FPD[0..7]" T R 12500 2400 50 
$EndSheet
Wire Wire Line
	13700 3700 13250 3700
Text Label 13250 3700 0    50   ~ 0
T34
Wire Wire Line
	13700 3600 13250 3600
Text Label 13250 3600 0    50   ~ 0
CLK3
$Comp
L power:+5V #PWR?
U 1 1 5EFD0815
P 6200 13450
AR Path="/5F67D4B5/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5EFD0815" Ref="#PWR0110"  Part="1" 
AR Path="/5D34E810/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD0815" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 6200 13300 50  0001 C CNN
F 1 "+5V" H 6142 13487 50  0000 R CNN
F 2 "" H 6200 13450 50  0001 C CNN
F 3 "" H 6200 13450 50  0001 C CNN
	1    6200 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFD081B
P 6200 13850
AR Path="/5F67D4B5/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5EFD081B" Ref="#PWR0116"  Part="1" 
AR Path="/5D34E810/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD081B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H 6200 13600 50  0001 C CNN
F 1 "GND" H 6122 13813 50  0000 R CNN
F 2 "" H 6200 13850 50  0001 C CNN
F 3 "" H 6200 13850 50  0001 C CNN
	1    6200 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 13450 6200 13550
Wire Wire Line
	6200 13750 6200 13850
Wire Wire Line
	15450 9050 15800 9050
Wire Wire Line
	15450 8950 15800 8950
Wire Wire Line
	15450 8850 15800 8850
Wire Wire Line
	15450 8750 15800 8750
Wire Wire Line
	15450 8650 15800 8650
Wire Wire Line
	15450 8550 15800 8550
Wire Wire Line
	15450 8450 15800 8450
Wire Wire Line
	15450 8350 15800 8350
Wire Wire Line
	15450 8250 15800 8250
Wire Wire Line
	15450 8150 15800 8150
Wire Wire Line
	15450 8050 15800 8050
Wire Wire Line
	15450 7950 15800 7950
Wire Wire Line
	15450 7850 15800 7850
Wire Wire Line
	15450 7750 15800 7750
Wire Wire Line
	15450 7650 15800 7650
Wire Wire Line
	15450 7550 15800 7550
Wire Wire Line
	15450 7350 15800 7350
Wire Wire Line
	15450 7250 15800 7250
Wire Wire Line
	15450 7150 15800 7150
Wire Wire Line
	15450 7050 15800 7050
Wire Wire Line
	15450 6950 15800 6950
Wire Wire Line
	15450 6850 15800 6850
Wire Wire Line
	15450 6750 15800 6750
Wire Wire Line
	15450 6650 15800 6650
Wire Wire Line
	15450 6550 15800 6550
Wire Wire Line
	15450 6350 15800 6350
Wire Wire Line
	15450 6250 15800 6250
Wire Wire Line
	15450 6150 15800 6150
Wire Wire Line
	15450 6050 15800 6050
Wire Wire Line
	13900 9750 14250 9750
Wire Wire Line
	13900 9650 14250 9650
Wire Wire Line
	13900 9550 14250 9550
Wire Wire Line
	13900 9450 14250 9450
Wire Wire Line
	13900 9350 14250 9350
Wire Wire Line
	13900 9250 14250 9250
Wire Wire Line
	13900 9150 14250 9150
Wire Wire Line
	13900 9050 14250 9050
Wire Wire Line
	13900 8850 14250 8850
Wire Wire Line
	13900 8750 14250 8750
Wire Wire Line
	13900 8650 14250 8650
Wire Wire Line
	13900 8550 14250 8550
Wire Wire Line
	13900 8450 14250 8450
Wire Wire Line
	13900 8350 14250 8350
Wire Wire Line
	13900 8250 14250 8250
Wire Wire Line
	13900 8150 14250 8150
Wire Wire Line
	13900 8050 14250 8050
Wire Wire Line
	13900 7950 14250 7950
Wire Wire Line
	13900 7850 14250 7850
Wire Wire Line
	13900 7750 14250 7750
Wire Wire Line
	13900 7650 14250 7650
Wire Wire Line
	13900 7550 14250 7550
Wire Wire Line
	13900 7450 14250 7450
Wire Wire Line
	13900 7350 14250 7350
Wire Wire Line
	13900 7250 14250 7250
Wire Wire Line
	13900 7150 14250 7150
Wire Wire Line
	13900 7050 14250 7050
Wire Wire Line
	13900 6950 14250 6950
Wire Wire Line
	13900 6850 14250 6850
Wire Wire Line
	13900 6750 14250 6750
Wire Wire Line
	13900 6650 14250 6650
Wire Wire Line
	13900 6350 14250 6350
Wire Wire Line
	13900 6250 14250 6250
Wire Wire Line
	13350 6750 13700 6750
Wire Wire Line
	13350 6650 13700 6650
Wire Wire Line
	13350 6450 13700 6450
Wire Wire Line
	13350 6350 13700 6350
Wire Wire Line
	13350 6250 13700 6250
Wire Wire Line
	13350 6150 13700 6150
Wire Wire Line
	13350 6050 13700 6050
Wire Wire Line
	13700 8050 13350 8050
Wire Wire Line
	13700 7950 13350 7950
Wire Wire Line
	13700 7850 13350 7850
Wire Wire Line
	13700 7750 13350 7750
Wire Wire Line
	13700 7650 13350 7650
Wire Wire Line
	13700 7550 13350 7550
Wire Wire Line
	13700 7450 13350 7450
Wire Wire Line
	13700 7350 13350 7350
Text Label 13700 6050 2    50   ~ 0
FPD0
Text Label 13700 6150 2    50   ~ 0
FPD1
Text Label 13700 6250 2    50   ~ 0
FPD2
Text Label 13700 6350 2    50   ~ 0
FPD3
Text Label 13700 6450 2    50   ~ 0
FPD4
Text Label 13700 6550 2    50   ~ 0
FPD5
Text Label 13700 6650 2    50   ~ 0
FPD6
Text Label 13700 6750 2    50   ~ 0
FPD7
$Comp
L power:GND #PWR0132
U 1 1 60F6906D
P 15550 9850
F 0 "#PWR0132" H 15550 9600 50  0001 C CNN
F 1 "GND" H 15555 9677 50  0000 C CNN
F 2 "" H 15550 9850 50  0001 C CNN
F 3 "" H 15550 9850 50  0001 C CNN
	1    15550 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	15450 9750 15550 9750
Wire Wire Line
	15550 9750 15550 9850
Text Label 15800 7550 2    50   ~ 0
DB0
Text Label 15800 7650 2    50   ~ 0
DB1
Text Label 15800 7750 2    50   ~ 0
DB2
Text Label 15800 7850 2    50   ~ 0
DB3
Text Label 15800 7950 2    50   ~ 0
DB4
Text Label 15800 8050 2    50   ~ 0
DB5
Text Label 15800 8150 2    50   ~ 0
DB6
Text Label 15800 8250 2    50   ~ 0
DB7
Text Label 15800 8350 2    50   ~ 0
DB8
Text Label 15800 8450 2    50   ~ 0
DB9
Text Label 15800 8550 2    50   ~ 0
DB10
Text Label 15800 8650 2    50   ~ 0
DB11
Text Label 15800 8750 2    50   ~ 0
DB12
Text Label 15800 8850 2    50   ~ 0
DB13
Text Label 15800 8950 2    50   ~ 0
DB14
Text Label 15800 9050 2    50   ~ 0
DB15
$Comp
L power:+5V #PWR0130
U 1 1 61D152B5
P 14200 6000
F 0 "#PWR0130" H 14200 5850 50  0001 C CNN
F 1 "+5V" H 14215 6173 50  0000 C CNN
F 2 "" H 14200 6000 50  0001 C CNN
F 3 "" H 14200 6000 50  0001 C CNN
	1    14200 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	14250 6050 14200 6050
Wire Wire Line
	14200 6050 14200 6000
Text Label 13700 7350 2    50   ~ 0
IR0
Text Label 13700 7450 2    50   ~ 0
IR1
Text Label 13700 7550 2    50   ~ 0
IR2
Text Label 13700 7650 2    50   ~ 0
IR3
Text Label 13700 7750 2    50   ~ 0
IR4
Text Label 13700 7850 2    50   ~ 0
IR5
Text Label 13700 7950 2    50   ~ 0
IR6
Text Label 13700 8050 2    50   ~ 0
IR7
Text Label 13900 6250 0    50   ~ 0
~RESET
Text Label 13900 6350 0    50   ~ 0
~RSTHOLD
Text Label 13900 6550 0    50   ~ 0
AB0
Text Label 13900 6650 0    50   ~ 0
AB1
Text Label 13900 6750 0    50   ~ 0
AB2
Text Label 13900 6850 0    50   ~ 0
AB3
Text Label 13900 6950 0    50   ~ 0
AB4
Text Label 13900 7050 0    50   ~ 0
AB5
Text Label 13900 7150 0    50   ~ 0
AB6
Text Label 13900 7250 0    50   ~ 0
AB7
Text Label 13900 7350 0    50   ~ 0
AB8
Text Label 13900 7450 0    50   ~ 0
AB9
Text Label 13900 7550 0    50   ~ 0
AB10
Text Label 13900 7650 0    50   ~ 0
AB11
Text Label 13900 7750 0    50   ~ 0
AB12
Text Label 13900 7850 0    50   ~ 0
AB13
Text Label 13900 7950 0    50   ~ 0
AB14
Text Label 13900 8050 0    50   ~ 0
AB15
Text Label 13900 8150 0    50   ~ 0
AB16
Text Label 13900 8250 0    50   ~ 0
AB17
Text Label 13900 8350 0    50   ~ 0
AB18
Text Label 13900 8450 0    50   ~ 0
AB19
Text Label 13900 8550 0    50   ~ 0
AB20
Text Label 13900 8650 0    50   ~ 0
AB21
Text Label 13900 8750 0    50   ~ 0
AB22
Text Label 13900 8850 0    50   ~ 0
AB23
Text Label 13900 9050 0    50   ~ 0
~IRQ0
Text Label 13900 9150 0    50   ~ 0
~IRQ1
Text Label 13900 9250 0    50   ~ 0
~IRQ2
Text Label 13900 9350 0    50   ~ 0
~IRQ3
Text Label 13900 9450 0    50   ~ 0
~IRQ4
Text Label 13900 9550 0    50   ~ 0
~IRQ5
Text Label 13900 9650 0    50   ~ 0
~IRQ6
Text Label 13900 9750 0    50   ~ 0
~IRQ7
Text Label 15800 6050 2    50   ~ 0
~MEM
Text Label 15800 6150 2    50   ~ 0
~IO
Text Label 15800 6250 2    50   ~ 0
~R
Text Label 15800 6350 2    50   ~ 0
~W
Text Label 15800 6550 2    50   ~ 0
~SYSDEV
Text Label 15800 6650 2    50   ~ 0
~IODEV1XX
Text Label 15800 6750 2    50   ~ 0
~IODEV2XX
Text Label 15800 6850 2    50   ~ 0
~IODEV3XX
Text Label 15800 6950 2    50   ~ 0
~WS
Text Label 15800 7050 2    50   ~ 0
~WAITING
Text Label 15800 7150 2    50   ~ 0
~HALT
Text Label 15800 7250 2    50   ~ 0
~IRQ
Text Label 15800 7350 2    50   ~ 0
~IRQS
Text Label 3100 5700 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	2600 5700 3100 5700
Text Label 950  5400 0    50   ~ 0
~FPµC2
Text Label 950  5300 0    50   ~ 0
~FPµC1
Text Label 950  5200 0    50   ~ 0
~FPµC0
Text Label 950  5100 0    50   ~ 0
~FPµA0
Wire Wire Line
	1450 5400 950  5400
Wire Wire Line
	1450 5300 950  5300
Wire Wire Line
	1450 5200 950  5200
Wire Wire Line
	1450 5100 950  5100
Text Label 3100 4300 2    50   ~ 0
~END
Text Label 3100 4200 2    50   ~ 0
~WEN
Text Label 3100 4100 2    50   ~ 0
~REN
Text Label 3100 4000 2    50   ~ 0
~IO
Text Label 3100 3900 2    50   ~ 0
~MEM
Wire Wire Line
	2600 4200 3100 4200
Wire Wire Line
	2600 4100 3100 4100
Wire Wire Line
	2600 4000 3100 4000
Wire Wire Line
	2600 3900 3100 3900
Text Label 950  4300 0    50   ~ 0
~ENDEXT
Text Label 950  3600 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	950  3600 1450 3600
Text Label 950  4000 0    50   ~ 0
CLK4
Wire Wire Line
	1450 3800 950  3800
Text Label 950  4200 0    50   ~ 0
~HALT
Text Label 3100 2700 2    50   ~ 0
T34
Text Label 3100 2550 2    50   ~ 0
CLK4
Text Label 3100 2450 2    50   ~ 0
CLK3
Text Label 3100 2350 2    50   ~ 0
CLK2
Text Label 3100 2250 2    50   ~ 0
CLK1
Text Label 3100 2100 2    50   ~ 0
~RSTHOLD
Wire Wire Line
	3100 2100 2600 2100
Text Label 950  2450 0    50   ~ 0
~FPCLK~⁄CLK
Text Label 950  2350 0    50   ~ 0
FPCLK
Wire Wire Line
	1450 2450 950  2450
Wire Wire Line
	1450 2350 950  2350
Text Label 3100 3500 2    50   ~ 0
RADDR[0..4]
Text Label 3100 3600 2    50   ~ 0
WADDR[0..4]
Text Label 3100 3700 2    50   ~ 0
COND[0..4]
Text Label 3100 3800 2    50   ~ 0
ACTION[0..3]
Text Label 5900 2100 2    50   ~ 0
IR[0..15]
Text Label 5900 2500 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	5300 2500 5900 2500
Wire Bus Line
	4150 2300 3550 2300
Text Label 3550 2300 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	5300 2300 5900 2300
Wire Wire Line
	5300 2400 5900 2400
Text Label 5900 2300 2    50   ~ 0
~FPIRL
Text Label 5900 2400 2    50   ~ 0
~FPIRH
Wire Wire Line
	1450 5000 950  5000
Text Label 950  5000 0    50   ~ 0
FPFETCH
Wire Bus Line
	5300 3200 5900 3200
Text Label 5900 3200 2    50   ~ 0
IBUS[0..15]
Wire Bus Line
	4150 3650 3550 3650
Text Label 3550 3650 0    50   ~ 0
PC[10..15]
Text Label 3550 3300 0    50   ~ 0
~END
Wire Bus Line
	1450 6200 950  6200
Text Label 950  6200 0    50   ~ 0
IBUS[0..15]
Text Label 3050 7000 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	2600 7000 3050 7000
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P 7050 13450
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR0106"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H 7050 13300 50  0001 C CNN
F 1 "+5V" H 6992 13487 50  0000 R CNN
F 2 "" H 7050 13450 50  0001 C CNN
F 3 "" H 7050 13450 50  0001 C CNN
	1    7050 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552A6
P 7050 13850
AR Path="/5F67D4B5/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A6" Ref="#PWR0113"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H 7050 13600 50  0001 C CNN
F 1 "GND" H 6972 13813 50  0000 R CNN
F 2 "" H 7050 13850 50  0001 C CNN
F 3 "" H 7050 13850 50  0001 C CNN
	1    7050 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 13450 7050 13550
$Comp
L Device:CP_Small C5
U 1 1 5DD552AD
P 7050 13650
AR Path="/5DD552AD" Ref="C5"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C5" H 6962 13696 50  0000 R CNN
F 1 "47µF" H 6962 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7050 13650 50  0001 C CNN
F 3 "~" H 7050 13650 50  0001 C CNN
	1    7050 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 13750 7050 13850
$Comp
L power:+5V #PWR?
U 1 1 5DD552B4
P 6600 13450
AR Path="/5F67D4B5/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD552B4" Ref="#PWR0105"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0105" H 6600 13300 50  0001 C CNN
F 1 "+5V" H 6542 13487 50  0000 R CNN
F 2 "" H 6600 13450 50  0001 C CNN
F 3 "" H 6600 13450 50  0001 C CNN
	1    6600 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552BA
P 6600 13850
AR Path="/5F67D4B5/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD552BA" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 6600 13600 50  0001 C CNN
F 1 "GND" H 6522 13813 50  0000 R CNN
F 2 "" H 6600 13850 50  0001 C CNN
F 3 "" H 6600 13850 50  0001 C CNN
	1    6600 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 13450 6600 13550
$Comp
L Device:CP_Small C4
U 1 1 5DD552C1
P 6600 13650
AR Path="/5DD552C1" Ref="C4"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C4" H 6512 13696 50  0000 R CNN
F 1 "47µF" H 6512 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6600 13650 50  0001 C CNN
F 3 "~" H 6600 13650 50  0001 C CNN
	1    6600 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 13750 6600 13850
Wire Wire Line
	950  3700 1450 3700
Text Label 950  3700 0    50   ~ 0
CLK1
Wire Bus Line
	5300 2100 5900 2100
$Sheet
S 4150 1950 1150 750 
U 5F63066B
F0 "Instruction Register (IR)" 50
F1 "cfg_reg_ir.sch" 50
F2 "IBUS[0..15]" T L 4150 2300 50 
F3 "IR[0..15]" B R 5300 2100 50 
F4 "~FPIRL" I R 5300 2300 50 
F5 "~FPIRH" I R 5300 2400 50 
F6 "FPD[0..7]" T R 5300 2500 50 
F7 "~WRITE-IR" I L 4150 2100 50 
$EndSheet
Wire Bus Line
	3550 3550 4150 3550
Text Label 3550 3550 0    50   ~ 0
IR[0..11]
Wire Wire Line
	1450 6400 950  6400
Wire Wire Line
	1450 6500 950  6500
Wire Wire Line
	1450 6600 950  6600
Wire Wire Line
	1450 6700 950  6700
Wire Wire Line
	1450 6800 950  6800
Wire Wire Line
	1450 7000 950  7000
Text Label 950  7000 0    50   ~ 0
~FPFLAGS
Text Label 950  6400 0    50   ~ 0
FI
Text Label 950  6500 0    50   ~ 0
FV
Text Label 950  6600 0    50   ~ 0
FL
Text Label 950  6700 0    50   ~ 0
FZ
Text Label 950  6800 0    50   ~ 0
FN
Wire Wire Line
	2600 2250 3100 2250
Text Label 11650 6250 0    50   ~ 0
FPCLK
Text Label 11650 6350 0    50   ~ 0
~FPCLK~⁄CLK
Wire Bus Line
	2600 3500 3100 3500
Wire Bus Line
	2600 3800 3100 3800
Wire Bus Line
	2600 3700 3100 3700
Wire Bus Line
	2600 3600 3100 3600
Text Label 11650 7850 0    50   ~ 0
FPFETCH
Wire Wire Line
	2600 4300 3100 4300
Wire Wire Line
	3550 3300 4150 3300
Wire Wire Line
	2600 2350 3100 2350
Wire Wire Line
	2600 2450 3100 2450
Wire Wire Line
	2600 2550 3100 2550
Wire Wire Line
	2600 2700 3100 2700
Text Label 950  3500 0    50   ~ 0
~RESET
Wire Wire Line
	950  2100 1450 2100
Wire Wire Line
	950  3500 1450 3500
Text Notes 750  850  0    100  ~ 20
The Control Unit Board
Text Notes 750  1650 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Label 11650 6950 0    50   ~ 0
~FPµC2
Text Label 11650 6850 0    50   ~ 0
~FPµC1
Text Label 11650 6750 0    50   ~ 0
~FPµC0
Text Label 11650 6650 0    50   ~ 0
~FPµA0
Text Label 11650 6550 0    50   ~ 0
~FPIRL
Text Label 11650 7050 0    50   ~ 0
~FPIRH
Wire Wire Line
	4150 3200 3550 3200
Text Label 3550 3200 0    50   ~ 0
~READ-AGL
Text Label 3550 2100 0    50   ~ 0
~WRITE-IR
Wire Wire Line
	4150 2100 3550 2100
Text Label 950  2100 0    50   ~ 0
~RESET
Text Label 11650 7150 0    50   ~ 0
~FPFLAGS
Wire Wire Line
	2600 2800 3100 2800
Text Label 3100 2800 2    50   ~ 0
16MHz
$Sheet
S 4150 3050 1150 750 
U 5F3EA987
F0 "Addressing Modes" 50
F1 "cft_agl.sch" 50
F2 "IBUS[0..15]" T R 5300 3200 50 
F3 "IR[0..11]" I L 4150 3550 50 
F4 "PC[10..15]" I L 4150 3650 50 
F5 "~END" I L 4150 3300 50 
F6 "~READ-AGL" I L 4150 3200 50 
$EndSheet
Wire Wire Line
	1450 4200 950  4200
Wire Wire Line
	950  4300 1450 4300
Wire Wire Line
	1450 4000 950  4000
Text Label 950  3800 0    50   ~ 0
CLK2
Text Label 3550 6200 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	4150 6900 3550 6900
Text Label 5900 7050 2    50   ~ 0
~IRQSµC
Text Label 5900 6950 2    50   ~ 0
~IRQS
Wire Wire Line
	5300 7050 5900 7050
Wire Wire Line
	5300 6950 5900 6950
Text Label 5900 6200 2    50   ~ 0
FI
Wire Wire Line
	5300 6200 5900 6200
Text Label 3550 6500 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	4150 6500 3550 6500
Text Label 3550 7050 0    50   ~ 0
~IRQ
Text Label 3550 6900 0    50   ~ 0
~END
Text Label 3550 6800 0    50   ~ 0
~WRITE-FL
Text Label 3550 6700 0    50   ~ 0
IBUS15
Wire Wire Line
	4150 7050 3550 7050
Wire Wire Line
	4150 6800 3550 6800
Wire Wire Line
	4150 6700 3550 6700
Wire Wire Line
	4150 6200 3550 6200
Wire Bus Line
	4150 4500 3550 4500
Text Label 3550 5300 0    50   ~ 0
~SKIPEXT
Wire Wire Line
	4150 5300 3550 5300
Text Label 3550 4600 0    50   ~ 0
IR[0..6]
Text Label 3550 4500 0    50   ~ 0
COND[0..4]
Text Label 3550 5100 0    50   ~ 0
FN
Text Label 3550 5000 0    50   ~ 0
FZ
Text Label 3550 4900 0    50   ~ 0
FL
Text Label 3550 4800 0    50   ~ 0
FV
Wire Wire Line
	4150 5100 3550 5100
Wire Wire Line
	4150 5000 3550 5000
Wire Wire Line
	4150 4900 3550 4900
Wire Wire Line
	4150 4800 3550 4800
Wire Bus Line
	3550 4600 4150 4600
Wire Wire Line
	4150 4400 3550 4400
Text Label 3550 4400 0    50   ~ 0
CLK4
Wire Wire Line
	4150 4300 3550 4300
Text Label 3550 4300 0    50   ~ 0
~RESET
$Sheet
S 4150 4150 1150 1600
U 5EFCF155
F0 "Skip/Branch Unit" 50
F1 "cft_sbu.sch" 50
F2 "~COND" O R 5300 4300 50 
F3 "FN" I L 4150 5100 50 
F4 "~SKIPEXT" T L 4150 5300 50 
F5 "FV" I L 4150 4800 50 
F6 "FL" I L 4150 4900 50 
F7 "FZ" I L 4150 5000 50 
F8 "CLK4" I L 4150 4400 50 
F9 "COND[0..4]" I L 4150 4500 50 
F10 "~RESET" I L 4150 4300 50 
F11 "IR[0..6]" I L 4150 4600 50 
$EndSheet
$Sheet
S 1450 3350 1150 2450
U 5DEAC282
F0 "Microprogram Sequencer" 50
F1 "cft_microcode.sch" 50
F2 "~ENDEXT" I L 1450 4300 50 
F3 "~RSTHOLD" I L 1450 3600 50 
F4 "~HALT" I L 1450 4200 50 
F5 "CLK4" I L 1450 4000 50 
F6 "~RESET" I L 1450 3500 50 
F7 "RADDR[0..4]" O R 2600 3500 50 
F8 "WADDR[0..4]" O R 2600 3600 50 
F9 "COND[0..4]" O R 2600 3700 50 
F10 "ACTION[0..3]" O R 2600 3800 50 
F11 "~MEM" O R 2600 3900 50 
F12 "~IO" O R 2600 4000 50 
F13 "~REN" O R 2600 4100 50 
F14 "~WEN" O R 2600 4200 50 
F15 "~END" O R 2600 4300 50 
F16 "~IRQSµC" I L 1450 5600 50 
F17 "~COND" I L 1450 4700 50 
F18 "FPD[0..7]" T R 2600 5700 50 
F19 "~FPµA0" I L 1450 5100 50 
F20 "~FPµC0" I L 1450 5200 50 
F21 "~FPµC1" I L 1450 5300 50 
F22 "~FPµC2" I L 1450 5400 50 
F23 "FPFETCH" O L 1450 5000 50 
F24 "IDX0" I L 1450 4500 50 
F25 "IDX1" I L 1450 4600 50 
F26 "CLK1" I L 1450 3700 50 
F27 "CLK2" I L 1450 3800 50 
F28 "~WAITING" I L 1450 5700 50 
F29 "CLK3" I L 1450 3900 50 
F30 "IR[6..15]" I L 1450 4800 50 
F31 "~READ-DR" O R 2600 4500 50 
F32 "~READ-PC" O R 2600 4600 50 
F33 "~READ-FL" O R 2600 4700 50 
F34 "~READ-AGL" O R 2600 4800 50 
F35 "~READ-CS" O R 2600 4900 50 
F36 "~IDXEN" O R 2600 5000 50 
F37 "T34" I L 1450 4100 50 
F38 "~WRITE-DR" O R 2600 5200 50 
F39 "~WRITE-PC" O R 2600 5300 50 
F40 "~WRITE-FL" O R 2600 5400 50 
F41 "~WRITE-IR" O R 2600 5500 50 
$EndSheet
Wire Wire Line
	1450 4500 950  4500
Wire Wire Line
	1450 4600 950  4600
Wire Wire Line
	1450 4700 950  4700
Text Label 950  4600 0    50   ~ 0
IDX1
Text Label 950  4500 0    50   ~ 0
IDX0
Text Label 950  4700 0    50   ~ 0
~COND
Wire Wire Line
	5300 4300 5900 4300
Text Label 5900 4300 2    50   ~ 0
~COND
Wire Bus Line
	11350 2100 10850 2100
Text Label 10850 2100 0    50   ~ 0
IR[0..2]
Wire Wire Line
	11350 1250 10850 1250
Wire Wire Line
	11350 1350 10850 1350
Wire Wire Line
	11350 1450 10850 1450
Wire Wire Line
	11350 1550 10850 1550
Text Label 10850 1250 0    50   ~ 0
~RSTHOLD
Text Label 10850 1350 0    50   ~ 0
CLK2
Text Label 10850 1450 0    50   ~ 0
CLK3
Text Label 10850 1550 0    50   ~ 0
T34
Wire Wire Line
	10850 2400 11350 2400
Text Label 10850 2400 0    50   ~ 0
~FPCTX
Wire Bus Line
	12500 2400 12950 2400
Text Label 12950 2400 2    50   ~ 0
FPD[0..7]
$Comp
L Device:CP_Small C3
U 1 1 5EFD0822
P 6200 13650
AR Path="/5EFD0822" Ref="C3"  Part="1" 
AR Path="/5D34E810/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5EFD0822" Ref="C?"  Part="1" 
F 0 "C3" H 6112 13696 50  0000 R CNN
F 1 "47µF" H 6112 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6200 13650 50  0001 C CNN
F 3 "~" H 6200 13650 50  0001 C CNN
	1    6200 13650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C2
U 1 1 5DF0FF8F
P 5750 13650
AR Path="/5DF0FF8F" Ref="C2"  Part="1" 
AR Path="/5D34E810/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF8F" Ref="C?"  Part="1" 
F 0 "C2" H 5662 13696 50  0000 R CNN
F 1 "47µF" H 5662 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5750 13650 50  0001 C CNN
F 3 "~" H 5750 13650 50  0001 C CNN
	1    5750 13650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C1
U 1 1 5DF0FFA3
P 5300 13650
AR Path="/5DF0FFA3" Ref="C1"  Part="1" 
AR Path="/5D34E810/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FFA3" Ref="C?"  Part="1" 
F 0 "C1" H 5212 13696 50  0000 R CNN
F 1 "47µF" H 5212 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5300 13650 50  0001 C CNN
F 3 "~" H 5300 13650 50  0001 C CNN
	1    5300 13650
	1    0    0    -1  
$EndComp
Text Label 3100 6200 2    50   ~ 0
~READ-FL
Text Label 3550 6300 0    50   ~ 0
CLK3
Wire Wire Line
	4150 6300 3550 6300
Wire Wire Line
	5300 6600 5900 6600
Wire Wire Line
	5300 6700 5900 6700
Wire Wire Line
	5300 6800 5900 6800
Text Label 5900 6600 2    50   ~ 0
~INCPC
Text Label 5900 6700 2    50   ~ 0
~INCDR
Text Label 5900 6800 2    50   ~ 0
~DECDR
Text Label 5900 6400 2    50   ~ 0
~IR-IDX
Text Label 5900 6300 2    50   ~ 0
~IDXEN
Wire Wire Line
	5300 6300 5900 6300
Wire Wire Line
	5300 6400 5900 6400
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 2 1 609EF5BD
P 12750 5950
F 0 "P1" H 12750 6117 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 12750 6026 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 12700 5050 50  0001 C CNN
F 3 "" H 12700 5050 50  0001 C CNN
	2    12750 5950
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 1 1 60A3E373
P 10500 5950
F 0 "P1" H 10500 6117 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 10500 6026 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 10450 5050 50  0001 C CNN
F 3 "" H 10450 5050 50  0001 C CNN
	1    10500 5950
	1    0    0    -1  
$EndComp
Text Label 11450 6250 2    50   ~ 0
~END
Wire Wire Line
	11100 6250 11450 6250
Text Label 9550 8950 0    50   ~ 0
~WRITE-FL
Text Label 9550 8850 0    50   ~ 0
FN
Text Label 9550 8750 0    50   ~ 0
FZ
Text Label 9550 8650 0    50   ~ 0
FL
Text Label 9550 8550 0    50   ~ 0
FV
Text Label 9550 8350 0    50   ~ 0
IBUS15
Text Label 9550 8250 0    50   ~ 0
IBUS14
Text Label 9550 8150 0    50   ~ 0
IBUS13
Text Label 9550 8050 0    50   ~ 0
IBUS12
Text Label 9550 7950 0    50   ~ 0
IBUS11
Text Label 9550 7850 0    50   ~ 0
IBUS10
Text Label 9550 7750 0    50   ~ 0
IBUS9
Text Label 9550 7650 0    50   ~ 0
IBUS8
Text Label 9550 7550 0    50   ~ 0
IBUS7
Text Label 9550 7450 0    50   ~ 0
IBUS6
Text Label 9550 7350 0    50   ~ 0
IBUS5
Text Label 9550 7250 0    50   ~ 0
IBUS4
Text Label 9550 7150 0    50   ~ 0
IBUS3
Text Label 9550 7050 0    50   ~ 0
IBUS2
Text Label 9550 6950 0    50   ~ 0
IBUS1
Text Label 9550 6850 0    50   ~ 0
IBUS0
Text Label 9550 6650 0    50   ~ 0
T34
Text Label 9550 6550 0    50   ~ 0
CLK4
Text Label 9550 6450 0    50   ~ 0
CLK3
Text Label 9550 6350 0    50   ~ 0
CLK2
Wire Wire Line
	11200 8950 11200 9050
Wire Wire Line
	11100 8950 11200 8950
$Comp
L power:GND #PWR0131
U 1 1 61C7A92A
P 11200 9050
F 0 "#PWR0131" H 11200 8800 50  0001 C CNN
F 1 "GND" H 11205 8877 50  0000 C CNN
F 2 "" H 11200 9050 50  0001 C CNN
F 3 "" H 11200 9050 50  0001 C CNN
	1    11200 9050
	1    0    0    -1  
$EndComp
Text Label 11450 8650 2    50   ~ 0
COND3
Text Label 11450 8550 2    50   ~ 0
COND2
Text Label 11450 8450 2    50   ~ 0
COND1
Text Label 11450 8350 2    50   ~ 0
COND0
Text Label 11450 8150 2    50   ~ 0
ACTION3
Text Label 11450 8050 2    50   ~ 0
ACTION2
Text Label 11450 7950 2    50   ~ 0
ACTION1
Text Label 11450 7850 2    50   ~ 0
ACTION0
Text Label 11450 7650 2    50   ~ 0
WADDR4
Text Label 11450 7550 2    50   ~ 0
WADDR3
Text Label 11450 7450 2    50   ~ 0
WADDR2
Text Label 11450 7350 2    50   ~ 0
WADDR1
Text Label 11450 7250 2    50   ~ 0
WADDR0
Text Label 11450 7050 2    50   ~ 0
RADDR4
Text Label 11450 6950 2    50   ~ 0
RADDR3
Text Label 11450 6850 2    50   ~ 0
RADDR2
Text Label 11450 6750 2    50   ~ 0
RADDR1
Text Label 11450 6650 2    50   ~ 0
RADDR0
Wire Wire Line
	9850 6050 9850 6000
Wire Wire Line
	9900 6050 9850 6050
$Comp
L power:+5V #PWR0129
U 1 1 60E723B0
P 9850 6000
F 0 "#PWR0129" H 9850 5850 50  0001 C CNN
F 1 "+5V" H 9865 6173 50  0000 C CNN
F 2 "" H 9850 6000 50  0001 C CNN
F 3 "" H 9850 6000 50  0001 C CNN
	1    9850 6000
	1    0    0    -1  
$EndComp
Text Label 11450 6450 2    50   ~ 0
~SKIPEXT
Text Label 11450 6350 2    50   ~ 0
~ENDEXT
Wire Wire Line
	9550 6350 9900 6350
Wire Wire Line
	9550 6450 9900 6450
Wire Wire Line
	9550 6550 9900 6550
Wire Wire Line
	9550 6650 9900 6650
Wire Wire Line
	9550 6850 9900 6850
Wire Wire Line
	9550 6950 9900 6950
Wire Wire Line
	9550 7050 9900 7050
Wire Wire Line
	9550 7150 9900 7150
Wire Wire Line
	9550 7250 9900 7250
Wire Wire Line
	9550 7350 9900 7350
Wire Wire Line
	9550 7450 9900 7450
Wire Wire Line
	9550 7550 9900 7550
Wire Wire Line
	9550 7650 9900 7650
Wire Wire Line
	9550 7750 9900 7750
Wire Wire Line
	9550 7850 9900 7850
Wire Wire Line
	9550 7950 9900 7950
Wire Wire Line
	9550 8050 9900 8050
Wire Wire Line
	9550 8150 9900 8150
Wire Wire Line
	9550 8250 9900 8250
Wire Wire Line
	9550 8350 9900 8350
Wire Wire Line
	9550 8550 9900 8550
Wire Wire Line
	9550 8650 9900 8650
Wire Wire Line
	9550 8750 9900 8750
Wire Wire Line
	9550 8850 9900 8850
Wire Wire Line
	9550 8950 9900 8950
Wire Wire Line
	11100 6350 11450 6350
Wire Wire Line
	11100 6450 11450 6450
Wire Wire Line
	11100 6650 11450 6650
Wire Wire Line
	11100 6750 11450 6750
Wire Wire Line
	11100 6850 11450 6850
Wire Wire Line
	11100 6950 11450 6950
Wire Wire Line
	11100 7050 11450 7050
Wire Wire Line
	11100 7250 11450 7250
Wire Wire Line
	11100 7350 11450 7350
Wire Wire Line
	11100 7450 11450 7450
Wire Wire Line
	11100 7550 11450 7550
Wire Wire Line
	11100 7650 11450 7650
Wire Wire Line
	11100 7850 11450 7850
Wire Wire Line
	11100 7950 11450 7950
Wire Wire Line
	11100 8050 11450 8050
Wire Wire Line
	11100 8150 11450 8150
Wire Wire Line
	11100 8350 11450 8350
Wire Wire Line
	11100 8450 11450 8450
Wire Wire Line
	11100 8550 11450 8550
Wire Wire Line
	11100 8650 11450 8650
Wire Wire Line
	11650 6850 12150 6850
Wire Wire Line
	11650 6750 12150 6750
Wire Wire Line
	11650 6650 12150 6650
Wire Wire Line
	11650 6450 12150 6450
Wire Wire Line
	11650 6350 12150 6350
Wire Wire Line
	11650 6250 12150 6250
Wire Wire Line
	11650 7550 12150 7550
Wire Wire Line
	11650 7450 12150 7450
Wire Wire Line
	11650 7350 12150 7350
Wire Wire Line
	11650 7250 12150 7250
Wire Wire Line
	11650 7150 12150 7150
Wire Wire Line
	11650 7050 12150 7050
Wire Wire Line
	11650 6950 12150 6950
Wire Wire Line
	12150 7650 11650 7650
Wire Wire Line
	12150 7750 11650 7750
Wire Wire Line
	12150 7850 11650 7850
Wire Wire Line
	11100 6050 11450 6050
Text Label 11450 6050 2    50   ~ 0
16MHz
NoConn ~ 11100 8850
Text Label 11650 7250 0    50   ~ 0
~FPAEXT
Text Label 950  3900 0    50   ~ 0
CLK3
Wire Wire Line
	1450 3900 950  3900
Wire Wire Line
	15450 6450 15800 6450
Text Label 15800 6450 2    50   ~ 0
T34
Text Notes 13450 2950 0    100  ~ 20
Expansion Bus Driver
Wire Wire Line
	14900 2500 15800 2500
Wire Wire Line
	15800 2500 15800 3400
Wire Wire Line
	14850 3400 15800 3400
Text Label 15750 2500 2    50   ~ 0
~ABEN
Wire Wire Line
	14850 3950 15700 3950
Text Label 15700 3950 2    50   ~ 0
~R
Wire Wire Line
	13700 4150 13250 4150
Text Label 13250 4150 0    50   ~ 0
~REN
Text Label 11650 7350 0    50   ~ 0
~FPPCL
Text Label 11650 7450 0    50   ~ 0
~FPPCH
Text Label 11650 7550 0    50   ~ 0
~FPDRL
Text Label 11650 7650 0    50   ~ 0
~FPDRH
Text Label 11650 6450 0    50   ~ 0
~FPCTX
Wire Notes Line width 24 style solid
	10950 12700 8150 12700
Wire Notes Line width 24 style solid
	10950 12700 10950 12000
Wire Notes Line width 24 style solid
	8150 12000 10950 12000
Wire Notes Line width 24 style solid
	8150 12000 8150 12700
Text Notes 8250 12250 0    63   ~ 13
Note: IDX Registration
Text Notes 8250 12600 0    50   ~ 0
IDX0 and IDX1 are not registered because they rely solely on the\ncurrent value of the IR. IR is latched during CLK4, so at worst\nIDX will be valid at CLK1 + ~20ns.
Text Label 11650 7750 0    50   ~ 0
~FPRAM~∕ROM
$Comp
L power:+5V #PWR?
U 1 1 610E4076
P 8850 13450
AR Path="/5F67D4B5/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/610E4076" Ref="#PWR0182"  Part="1" 
AR Path="/5D34E810/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E4076" Ref="#PWR?"  Part="1" 
F 0 "#PWR0182" H 8850 13300 50  0001 C CNN
F 1 "+5V" H 8792 13487 50  0000 R CNN
F 2 "" H 8850 13450 50  0001 C CNN
F 3 "" H 8850 13450 50  0001 C CNN
	1    8850 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610E407C
P 8850 13850
AR Path="/5F67D4B5/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/610E407C" Ref="#PWR0183"  Part="1" 
AR Path="/5D34E810/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E407C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0183" H 8850 13600 50  0001 C CNN
F 1 "GND" H 8772 13813 50  0000 R CNN
F 2 "" H 8850 13850 50  0001 C CNN
F 3 "" H 8850 13850 50  0001 C CNN
	1    8850 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 13450 8850 13550
$Comp
L Device:CP_Small C9
U 1 1 610E4083
P 8850 13650
AR Path="/610E4083" Ref="C9"  Part="1" 
AR Path="/5D34E810/610E4083" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/610E4083" Ref="C?"  Part="1" 
F 0 "C9" H 8762 13696 50  0000 R CNN
F 1 "47µF" H 8762 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8850 13650 50  0001 C CNN
F 3 "~" H 8850 13650 50  0001 C CNN
	1    8850 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 13750 8850 13850
$Comp
L power:+5V #PWR?
U 1 1 610E408A
P 8400 13450
AR Path="/5F67D4B5/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/610E408A" Ref="#PWR0184"  Part="1" 
AR Path="/5D34E810/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E408A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0184" H 8400 13300 50  0001 C CNN
F 1 "+5V" H 8342 13487 50  0000 R CNN
F 2 "" H 8400 13450 50  0001 C CNN
F 3 "" H 8400 13450 50  0001 C CNN
	1    8400 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610E4090
P 8400 13850
AR Path="/5F67D4B5/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/610E4090" Ref="#PWR0185"  Part="1" 
AR Path="/5D34E810/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E4090" Ref="#PWR?"  Part="1" 
F 0 "#PWR0185" H 8400 13600 50  0001 C CNN
F 1 "GND" H 8322 13813 50  0000 R CNN
F 2 "" H 8400 13850 50  0001 C CNN
F 3 "" H 8400 13850 50  0001 C CNN
	1    8400 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 13450 8400 13550
$Comp
L Device:CP_Small C8
U 1 1 610E4097
P 8400 13650
AR Path="/610E4097" Ref="C8"  Part="1" 
AR Path="/5D34E810/610E4097" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/610E4097" Ref="C?"  Part="1" 
F 0 "C8" H 8312 13696 50  0000 R CNN
F 1 "47µF" H 8312 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8400 13650 50  0001 C CNN
F 3 "~" H 8400 13650 50  0001 C CNN
	1    8400 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 13750 8400 13850
Text Label 3550 6400 0    50   ~ 0
CLK4
Wire Wire Line
	4150 6400 3550 6400
$Sheet
S 4150 6100 1150 1050
U 5F67D4B5
F0 "Interrupt State Machine" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L 4150 7050 50 
F3 "~RESET" I L 4150 6200 50 
F4 "FI" O R 5300 6200 50 
F5 "~IRQS" O R 5300 6950 50 
F6 "~END" I L 4150 6900 50 
F7 "CLK4" I L 4150 6400 50 
F8 "~IRQSµC" O R 5300 7050 50 
F9 "IBUS15" I L 4150 6700 50 
F10 "~WRITE-FL" I L 4150 6800 50 
F11 "ACTION[0..3]" I L 4150 6500 50 
F12 "~IR-IDX" O R 5300 6400 50 
F13 "~ACTION-INCPC" O R 5300 6600 50 
F14 "~ACTION-DECDR" O R 5300 6800 50 
F15 "~ACTION-INCDR" O R 5300 6700 50 
F16 "CLK3" I L 4150 6300 50 
F17 "IDXEN" I R 5300 6300 50 
$EndSheet
$Sheet
S 13700 3150 1150 1500
U 5D46B22D
F0 "Wait States & Write Strobes" 50
F1 "cft_ws_busen.sch" 50
F2 "T34" I L 13700 3700 50 
F3 "~RSTHOLD" I L 13700 3300 50 
F4 "CLK3" I L 13700 3600 50 
F5 "~MEM" I L 13700 3950 50 
F6 "~IO" I L 13700 4050 50 
F7 "~HALT" I L 13700 3400 50 
F8 "~WEN" I L 13700 4250 50 
F9 "~WS" I L 13700 4400 50 
F10 "~W" T R 14850 4050 50 
F11 "IBUS[0..15]" T L 13700 4500 50 
F12 "DB[0..15]" T R 14850 4500 50 
F13 "~WAITING" O R 14850 4150 50 
F14 "CLK1" I L 13700 3500 50 
F15 "~ABEN" O R 14850 3400 50 
F16 "~REN" I L 13700 4150 50 
F17 "~R" T R 14850 3950 50 
$EndSheet
Text Label 13250 3500 0    50   ~ 0
CLK2
$Sheet
S 1450 6050 1150 1300
U 5D69F3FD
F0 "Flag Unit" 50
F1 "flag_unit.sch" 50
F2 "FPD[0..7]" T R 2600 7000 50 
F3 "IBUS[8..15]" T L 1450 6200 50 
F4 "~FPFLAGS" I L 1450 7000 50 
F5 "FI" I L 1450 6400 50 
F6 "FV" I L 1450 6500 50 
F7 "FL" I L 1450 6600 50 
F8 "FZ" I L 1450 6700 50 
F9 "FN" I L 1450 6800 50 
F10 "~READ-FL" I R 2600 6200 50 
$EndSheet
NoConn ~ 13900 9050
NoConn ~ 13900 9150
NoConn ~ 13900 9250
NoConn ~ 13900 9350
NoConn ~ 13900 9450
NoConn ~ 13900 9550
NoConn ~ 13900 9650
NoConn ~ 13900 9750
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61115B2C
P 9800 6050
F 0 "#FLG0101" H 9800 6125 50  0001 C CNN
F 1 "PWR_FLAG" V 9800 6177 50  0000 L CNN
F 2 "" H 9800 6050 50  0001 C CNN
F 3 "~" H 9800 6050 50  0001 C CNN
	1    9800 6050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9800 6050 9850 6050
Connection ~ 9850 6050
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 61150065
P 11250 8950
F 0 "#FLG0102" H 11250 9025 50  0001 C CNN
F 1 "PWR_FLAG" V 11250 9078 50  0000 L CNN
F 2 "" H 11250 8950 50  0001 C CNN
F 3 "~" H 11250 8950 50  0001 C CNN
	1    11250 8950
	0    1    1    0   
$EndComp
Wire Wire Line
	11200 8950 11250 8950
Connection ~ 11200 8950
Wire Wire Line
	13350 6550 13700 6550
Wire Wire Line
	11650 6550 12150 6550
Wire Wire Line
	13900 6550 14250 6550
$Comp
L alexios:CFT-2021-Peripheral-Bus P2
U 1 1 60987323
P 14850 5950
F 0 "P2" H 14850 6117 50  0000 C CNN
F 1 "CFT-2021-Peripheral-Bus" H 14850 6026 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 14725 5075 50  0001 C CNN
F 3 "" H 14725 5075 50  0001 C CNN
	1    14850 5950
	1    0    0    -1  
$EndComp
Text Label 9550 6250 0    50   ~ 0
CLK1
Wire Wire Line
	9550 6250 9900 6250
NoConn ~ 12150 6050
NoConn ~ 12150 6150
Text Label 950  5700 0    50   ~ 0
~WAITING
Wire Wire Line
	1450 5700 950  5700
Wire Wire Line
	1450 5600 950  5600
Text Label 950  5600 0    50   ~ 0
~IRQSµC
Wire Bus Line
	1450 4800 950  4800
Text Label 950  4800 0    50   ~ 0
IR[6..15]
Wire Wire Line
	2600 4500 3100 4500
Wire Wire Line
	2600 4600 3100 4600
Wire Wire Line
	2600 4800 3100 4800
Wire Wire Line
	2600 4900 3100 4900
Wire Wire Line
	2600 5000 3100 5000
Wire Wire Line
	2600 5200 3100 5200
Wire Wire Line
	2600 5300 3100 5300
Wire Wire Line
	2600 5500 3100 5500
Text Label 3100 4500 2    50   ~ 0
~READ-DR
Text Label 3100 4600 2    50   ~ 0
~READ-PC
Text Label 3100 4700 2    50   ~ 0
~READ-FL
Text Label 3100 4800 2    50   ~ 0
~READ-AGL
Text Label 3100 4900 2    50   ~ 0
~READ-CS
Text Label 3100 5000 2    50   ~ 0
~IDXEN
Text Label 3100 5200 2    50   ~ 0
~WRITE-DR
Text Label 3100 5300 2    50   ~ 0
~WRITE-PC
Text Label 3100 5400 2    50   ~ 0
~WRITE-FL
Text Label 3100 5500 2    50   ~ 0
~WRITE-IR
Wire Wire Line
	2600 5400 3100 5400
Wire Wire Line
	3200 4700 3200 6200
Wire Wire Line
	2600 4700 3200 4700
Wire Wire Line
	2600 6200 3200 6200
Wire Wire Line
	1450 4100 950  4100
Text Label 950  4100 0    50   ~ 0
T34
$Sheet
S 7150 1950 1150 1000
U 5D9672D4
F0 "Program Counter" 50
F1 "cft-reg-pc.sch" 50
F2 "~FPH" I R 8300 2300 50 
F3 "~FPL" I R 8300 2400 50 
F4 "~READ" I L 7150 2300 50 
F5 "~INC" I L 7150 2500 50 
F6 "~WRITE" I L 7150 2400 50 
F7 "IBUS[0..15]" I L 7150 2100 50 
F8 "FPD[0..7]" T R 8300 2500 50 
F9 "PC[10..15]" O R 8300 2100 50 
$EndSheet
Text Notes 9550 5600 0    100  ~ 20
Processor Bus
Text Notes 12350 5600 0    100  ~ 20
Local Bus
Text Notes 14300 5600 0    100  ~ 20
Peripheral Bus
NoConn ~ 14250 6150
NoConn ~ 12150 8050
NoConn ~ 12150 7950
$Sheet
S 1450 1950 1150 1050
U 5E36D9C8
F0 "Clock Generator" 50
F1 "cft_clk.sch" 50
F2 "CLK1" O R 2600 2250 50 
F3 "CLK2" O R 2600 2350 50 
F4 "CLK3" O R 2600 2450 50 
F5 "CLK4" O R 2600 2550 50 
F6 "~RESET" I L 1450 2100 50 
F7 "FPCLK" I L 1450 2350 50 
F8 "~RSTHOLD" O R 2600 2100 50 
F9 "~FPCLK~⁄CLK" I L 1450 2450 50 
F10 "T34" O R 2600 2700 50 
F11 "16MHz" O R 2600 2800 50 
$EndSheet
$EndSCHEMATC
