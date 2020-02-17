EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 11
Title "Control Unit Board"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 4200 4300 1150 1600
U 5EFCF155
F0 "Skip/Branch Unit" 50
F1 "cft_sbu.sch" 50
F2 "~COND" O R 5350 4450 50 
F3 "FN" I L 4200 5250 50 
F4 "~SKIPEXT" T L 4200 5450 50 
F5 "FV" I L 4200 4950 50 
F6 "FL" I L 4200 5050 50 
F7 "FZ" I L 4200 5150 50 
F8 "CLK4" I L 4200 4550 50 
F9 "COND[0..4]" I L 4200 4650 50 
F10 "~RESET" I L 4200 4450 50 
F11 "IR[0..6]" I L 4200 4750 50 
F12 "CEXT8" T L 4200 5550 50 
F13 "CEXT9" T L 4200 5650 50 
F14 "CEXT10" T L 4200 5750 50 
$EndSheet
Text Label 900  4650 0    50   ~ 0
IN-RSVD
Text Label 900  4550 0    50   ~ 0
~COND
Text Label 3250 5650 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	2650 5650 3250 5650
Text Label 3250 5550 2    50   ~ 0
~FPµC2
Text Label 3250 5450 2    50   ~ 0
~FPµC1
Text Label 3250 5350 2    50   ~ 0
~FPµC0
Text Label 3250 5250 2    50   ~ 0
~FPµA0
Wire Wire Line
	2650 5550 3250 5550
Wire Wire Line
	2650 5450 3250 5450
Wire Wire Line
	2650 5350 3250 5350
Wire Wire Line
	2650 5250 3250 5250
Text Label 3250 4450 2    50   ~ 0
~END
Text Label 3250 4350 2    50   ~ 0
~WEN
Text Label 3250 4250 2    50   ~ 0
~R
Text Label 3250 4150 2    50   ~ 0
~IO
Text Label 3250 4050 2    50   ~ 0
~MEM
Wire Wire Line
	2650 4350 3250 4350
Wire Wire Line
	2650 4250 3250 4250
Wire Wire Line
	2650 4150 3250 4150
Wire Wire Line
	2650 4050 3250 4050
Text Label 900  4250 0    50   ~ 0
~WS
Text Label 900  4150 0    50   ~ 0
~ENDEXT
Wire Wire Line
	900  4250 1500 4250
Wire Wire Line
	900  4150 1500 4150
Text Label 900  3750 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	900  3750 1500 3750
Text Label 900  3950 0    50   ~ 0
CLK4
Wire Wire Line
	1500 3950 900  3950
Text Label 900  4050 0    50   ~ 0
~HALT
Wire Wire Line
	1500 4050 900  4050
Text Label 3100 2850 2    50   ~ 0
T34
Text Label 3100 2700 2    50   ~ 0
CLK4
Text Label 3100 2600 2    50   ~ 0
CLK3
Text Label 3100 2500 2    50   ~ 0
CLK2
Text Label 3100 2400 2    50   ~ 0
CLK1
Text Label 3100 2250 2    50   ~ 0
~RSTHOLD
$Sheet
S 1500 2100 1150 1050
U 5E36D9C8
F0 "Clock Generator" 50
F1 "cft_clk.sch" 50
F2 "CLK1" O R 2650 2400 50 
F3 "CLK2" O R 2650 2500 50 
F4 "CLK3" O R 2650 2600 50 
F5 "CLK4" O R 2650 2700 50 
F6 "~RESET" I L 1500 2250 50 
F7 "FPCLK" I L 1500 2500 50 
F8 "~RSTHOLD" O R 2650 2250 50 
F9 "POWEROK" I L 1500 2850 50 
F10 "~FPRESET" I L 1500 2400 50 
F11 "~FPCLK~⁄CLK" I L 1500 2600 50 
F12 "T34" O R 2650 2850 50 
$EndSheet
Wire Wire Line
	3100 2250 2650 2250
Text Label 900  2850 0    50   ~ 0
POWEROK
Text Label 900  2600 0    50   ~ 0
FPCLKEN
Text Label 900  2500 0    50   ~ 0
FPCLK
Text Label 900  2400 0    50   ~ 0
~FPRESET
Wire Wire Line
	1500 2600 900  2600
Wire Wire Line
	1500 2500 900  2500
Wire Wire Line
	1500 2400 900  2400
Wire Wire Line
	1500 2850 900  2850
Text Label 3250 3650 2    50   ~ 0
RADDR[0..4]
Text Label 3250 3750 2    50   ~ 0
WADDR[0..4]
Text Label 3250 3850 2    50   ~ 0
COND[0..4]
Text Label 3250 3950 2    50   ~ 0
ACTION[0..3]
Text Label 5950 2250 2    50   ~ 0
IR[0..15]
Text Label 5950 2650 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	5350 2650 5950 2650
Wire Bus Line
	4200 2450 3600 2450
Text Label 3600 2450 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	5350 2450 5950 2450
Wire Wire Line
	5350 2550 5950 2550
Text Label 5950 2450 2    50   ~ 0
~FPIRL
Text Label 5950 2550 2    50   ~ 0
~FPIRH
Wire Wire Line
	2650 5150 3250 5150
Text Label 3250 5150 2    50   ~ 0
FPFETCH∕~EXEC
Wire Bus Line
	5350 3350 5950 3350
Text Label 5950 3350 2    50   ~ 0
IBUS[0..15]
Wire Wire Line
	5350 4450 5950 4450
Text Label 5950 4450 2    50   ~ 0
~COND
Text Label 3600 4450 0    50   ~ 0
~RESET
Wire Wire Line
	4200 4450 3600 4450
Text Label 3600 4550 0    50   ~ 0
CLK4
Wire Wire Line
	4200 4550 3600 4550
Wire Bus Line
	3600 4750 4200 4750
Wire Bus Line
	4200 3800 3600 3800
Text Label 3600 3800 0    50   ~ 0
PC[10..15]
Text Label 3600 3450 0    50   ~ 0
~END
Wire Wire Line
	4200 4950 3600 4950
Wire Wire Line
	4200 5050 3600 5050
Wire Wire Line
	4200 5150 3600 5150
Wire Wire Line
	4200 5250 3600 5250
Text Label 3600 4950 0    50   ~ 0
FV
Text Label 3600 5050 0    50   ~ 0
FL
Text Label 3600 5150 0    50   ~ 0
FZ
Text Label 3600 5250 0    50   ~ 0
FN
Text Label 3600 4650 0    50   ~ 0
COND[0..4]
Text Label 3600 4750 0    50   ~ 0
IR[0..6]
Wire Wire Line
	4200 5450 3600 5450
Text Label 3600 5450 0    50   ~ 0
~SKIPEXT
Wire Wire Line
	900  4650 1500 4650
Wire Bus Line
	1500 6650 900  6650
Text Label 900  6650 0    50   ~ 0
IBUS[0..15]
Text Label 3250 7350 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	2650 7350 3250 7350
Wire Wire Line
	4200 6350 3600 6350
Wire Wire Line
	4200 6450 3600 6450
Wire Wire Line
	4200 6550 3600 6550
Wire Wire Line
	4200 6850 3600 6850
Wire Wire Line
	4200 6950 3600 6950
Wire Wire Line
	4200 7200 3600 7200
Text Label 3600 6450 0    50   ~ 0
CLK1
Text Label 3600 6550 0    50   ~ 0
CLK4
Text Label 3600 6850 0    50   ~ 0
IBUS15
Text Label 3600 6950 0    50   ~ 0
~FLAGWE
Text Label 3600 7050 0    50   ~ 0
~END
Text Label 3600 7200 0    50   ~ 0
~IRQ
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
Wire Wire Line
	9500 2600 10100 2600
NoConn ~ 7800 1800
NoConn ~ 7800 2000
NoConn ~ 7800 2200
NoConn ~ 7800 2300
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
	9500 2500 10100 2500
Wire Wire Line
	9500 2400 10100 2400
Wire Wire Line
	9500 1600 9850 1600
Wire Wire Line
	9500 1700 9850 1700
Wire Wire Line
	9500 1800 9850 1800
Wire Wire Line
	9500 1900 9850 1900
Wire Wire Line
	9500 2000 9850 2000
Wire Wire Line
	9500 2100 9850 2100
Wire Wire Line
	9500 2200 9850 2200
Text Label 9850 1600 2    50   ~ 0
IR0
Text Label 9850 1700 2    50   ~ 0
IR1
Text Label 9850 1800 2    50   ~ 0
IR2
Text Label 9850 1900 2    50   ~ 0
IR3
Text Label 9850 2000 2    50   ~ 0
IR4
Text Label 9850 2100 2    50   ~ 0
IR5
Text Label 9850 2200 2    50   ~ 0
IR6
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
Text Label 10100 2600 2    50   ~ 0
~FLAGWE
Text Label 10100 2400 2    50   ~ 0
FL
Text Label 10100 2500 2    50   ~ 0
FV
Text Notes 10150 2400 0    50   ~ 0
← ALU
Text Notes 10150 1600 0    50   ~ 0
→ BUS.MBU
Text Label 7800 2200 0    50   ~ 0
AB[0..23]
Text Notes 10150 2600 0    50   ~ 0
→ ALU
Wire Wire Line
	9500 5500 10100 5500
Wire Wire Line
	8350 4300 7800 4300
Wire Wire Line
	8350 4400 7800 4400
Text Label 7800 4300 0    50   ~ 0
~RUEN
Text Label 7800 4400 0    50   ~ 0
~WUEN
Wire Wire Line
	1500 4350 900  4350
Wire Wire Line
	1500 4450 900  4450
Text Label 900  4350 0    50   ~ 0
IDX0
Text Label 900  4450 0    50   ~ 0
IDX1
$Sheet
S 1500 3500 1150 2300
U 5DEAC282
F0 "Microprogram Sequencer" 50
F1 "cft_microcode.sch" 50
F2 "~ENDEXT" I L 1500 4150 50 
F3 "~RSTHOLD" I L 1500 3750 50 
F4 "~WS" I L 1500 4250 50 
F5 "~HALT" I L 1500 4050 50 
F6 "CLK4" I L 1500 3950 50 
F7 "~RESET" I L 1500 3650 50 
F8 "RADDR[0..4]" O R 2650 3650 50 
F9 "WADDR[0..4]" O R 2650 3750 50 
F10 "COND[0..4]" O R 2650 3850 50 
F11 "ACTION[0..3]" O R 2650 3950 50 
F12 "~MEM" O R 2650 4050 50 
F13 "~IO" O R 2650 4150 50 
F14 "~R" O R 2650 4250 50 
F15 "~WEN" O R 2650 4350 50 
F16 "~END" O R 2650 4450 50 
F17 "~IRQSµC" I L 1500 5650 50 
F18 "IN-RSVD" I L 1500 4650 50 
F19 "~COND" I L 1500 4550 50 
F20 "FPD[0..7]" T R 2650 5650 50 
F21 "~FPµA0" I R 2650 5250 50 
F22 "~FPµC0" I R 2650 5350 50 
F23 "~FPµC1" I R 2650 5450 50 
F24 "~FPµC2" I R 2650 5550 50 
F25 "FPFETCH" O R 2650 5150 50 
F26 "IDX0" I L 1500 4350 50 
F27 "IDX1" I L 1500 4450 50 
F28 "IR7" I L 1500 4750 50 
F29 "IR8" I L 1500 4850 50 
F30 "IR9" I L 1500 4950 50 
F31 "IR10" I L 1500 5050 50 
F32 "IR11" I L 1500 5150 50 
F33 "IR12" I L 1500 5250 50 
F34 "IR13" I L 1500 5350 50 
F35 "IR14" I L 1500 5450 50 
F36 "IR15" I L 1500 5550 50 
F37 "CLK2" I L 1500 3850 50 
$EndSheet
Wire Wire Line
	900  3850 1500 3850
Text Label 900  3850 0    50   ~ 0
CLK2
Wire Wire Line
	1500 4750 900  4750
Wire Wire Line
	1500 4850 900  4850
Wire Wire Line
	1500 4950 900  4950
Wire Wire Line
	1500 5050 900  5050
Wire Wire Line
	1500 5150 900  5150
Wire Wire Line
	1500 5250 900  5250
Wire Wire Line
	1500 5350 900  5350
Wire Wire Line
	1500 5450 900  5450
Wire Wire Line
	1500 5550 900  5550
Wire Wire Line
	1500 5650 1000 5650
Text Label 900  4750 0    50   ~ 0
IR7
Text Label 900  4850 0    50   ~ 0
IR8
Text Label 900  4950 0    50   ~ 0
IR9
Text Label 900  5050 0    50   ~ 0
IR10
Text Label 900  5150 0    50   ~ 0
IR11
Text Label 900  5250 0    50   ~ 0
IR12
Text Label 900  5350 0    50   ~ 0
IR13
Text Label 900  5450 0    50   ~ 0
IR14
Text Label 900  5550 0    50   ~ 0
IR15
Text Label 1000 5650 0    50   ~ 0
~IRQSµC
Text Label 10100 5500 2    50   ~ 0
IN-RSVD
Text Notes 10200 5500 0    50   ~ 0
For future expansion
Wire Wire Line
	1500 4550 900  4550
Wire Bus Line
	5350 2250 5950 2250
$Sheet
S 4200 2100 1150 750 
U 5F63066B
F0 "Instruction Register (IR)" 50
F1 "cfg_reg_ir.sch" 50
F2 "IBUS[0..15]" T L 4200 2450 50 
F3 "IR[0..15]" B R 5350 2250 50 
F4 "~FPIRL" I R 5350 2450 50 
F5 "~FPIRH" I R 5350 2550 50 
F6 "FPD[0..7]" T R 5350 2650 50 
F7 "CLK4" I L 4200 2250 50 
F8 "~WRITE-IR" I L 4200 2350 50 
$EndSheet
Wire Wire Line
	4200 2250 3600 2250
Text Label 3600 2250 0    50   ~ 0
CLK4
Wire Wire Line
	5350 3700 5950 3700
Wire Wire Line
	5350 3800 5950 3800
Text Label 5950 3700 2    50   ~ 0
IDX0
Text Label 5950 3800 2    50   ~ 0
IDX1
Wire Bus Line
	3600 3700 4200 3700
Text Label 3600 3700 0    50   ~ 0
IR[0..11]
$Sheet
S 4200 3200 1150 750 
U 5F3EA987
F0 "Addressing Modes" 50
F1 "cft_agl.sch" 50
F2 "IBUS[0..15]" T R 5350 3350 50 
F3 "IR[0..11]" I L 4200 3700 50 
F4 "PC[10..15]" I L 4200 3800 50 
F5 "~END" I L 4200 3450 50 
F6 "IDX0" O R 5350 3700 50 
F7 "IDX1" O R 5350 3800 50 
F8 "~READ-AGL" I L 4200 3350 50 
$EndSheet
$Sheet
S 1500 6200 1150 1300
U 5D69F3FD
F0 "Flag Unit" 50
F1 "flag_unit.sch" 50
F2 "FPD[0..7]" T R 2650 7350 50 
F3 "IBUS[8..15]" T L 1500 6650 50 
F4 "~FPFLAGS" I L 1500 7350 50 
F5 "WADDR[0..4]" I L 1500 6450 50 
F6 "RADDR[0..4]" I L 1500 6550 50 
F7 "FI" I L 1500 6800 50 
F8 "FV" I L 1500 6900 50 
F9 "FL" I L 1500 7000 50 
F10 "FZ" I L 1500 7100 50 
F11 "FN" I L 1500 7200 50 
F12 "~FLAGWE" O R 2650 6450 50 
F13 "CLK4" I L 1500 6350 50 
F14 "~READ-AGL" O R 2650 6850 50 
F15 "~WRITE-IR" O R 2650 6950 50 
$EndSheet
Wire Bus Line
	1500 6450 900  6450
Text Label 900  6450 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	1500 6550 900  6550
Text Label 900  6550 0    50   ~ 0
RADDR[4..0]
Wire Bus Line
	4200 6650 3600 6650
Text Label 3600 6650 0    50   ~ 0
ACTION[0..3]
Wire Wire Line
	1500 6350 900  6350
Text Label 900  6350 0    50   ~ 0
CLK4
Text Notes 10150 1700 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 1800 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 1900 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 2000 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 2100 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 2200 0    50   ~ 0
→ BUS.MBU
Text Notes 10150 2500 0    50   ~ 0
← ALU
Wire Wire Line
	4200 5550 3600 5550
Wire Wire Line
	4200 5650 3600 5650
Wire Wire Line
	4200 5750 3600 5750
Text Label 3600 5550 0    50   ~ 0
CEXT8
Text Label 3600 5650 0    50   ~ 0
CEXT9
Text Label 3600 5750 0    50   ~ 0
CEXT10
Wire Wire Line
	9500 5200 10100 5200
Wire Wire Line
	9500 5300 10100 5300
Wire Wire Line
	9500 5400 10100 5400
Wire Wire Line
	9500 4800 10100 4800
Wire Wire Line
	9500 4900 10100 4900
Wire Wire Line
	9500 5000 10100 5000
Wire Wire Line
	9500 5100 10100 5100
Wire Wire Line
	9500 4700 10100 4700
Text Label 10100 4700 2    50   ~ 0
COND0
Text Label 10100 4800 2    50   ~ 0
COND1
Text Label 10100 4900 2    50   ~ 0
COND2
Text Label 10100 5000 2    50   ~ 0
COND3
Text Label 10100 5100 2    50   ~ 0
COND4
Text Label 10100 5200 2    50   ~ 0
CEXT8
Text Label 10100 5300 2    50   ~ 0
CEXT9
Text Label 10100 5400 2    50   ~ 0
CEXT10
Wire Wire Line
	2650 6450 3250 6450
Text Label 3250 6450 2    50   ~ 0
~FLAGWE
Wire Wire Line
	1500 6800 900  6800
Wire Wire Line
	1500 6900 900  6900
Wire Wire Line
	1500 7000 900  7000
Wire Wire Line
	1500 7100 900  7100
Wire Wire Line
	1500 7200 900  7200
Wire Wire Line
	1500 7350 900  7350
Text Label 900  7350 0    50   ~ 0
~FPFLAGS
Text Label 900  6800 0    50   ~ 0
FI
Text Label 900  6900 0    50   ~ 0
FV
Text Label 900  7000 0    50   ~ 0
FL
Text Label 900  7100 0    50   ~ 0
FZ
Text Label 900  7200 0    50   ~ 0
FN
Wire Wire Line
	9500 2700 10100 2700
Wire Wire Line
	9500 2800 10100 2800
Text Label 10100 2700 2    50   ~ 0
FZ
Text Label 10100 2800 2    50   ~ 0
FN
Text Notes 10150 2700 0    50   ~ 0
← REG
Text Notes 10150 2800 0    50   ~ 0
← REG
Wire Wire Line
	9500 2900 10100 2900
Wire Wire Line
	9500 3000 10100 3000
Wire Wire Line
	9500 3100 10100 3100
Wire Wire Line
	9500 3200 10100 3200
Wire Wire Line
	9500 3300 10100 3300
Wire Wire Line
	9500 3400 10100 3400
Text Label 10100 2900 2    50   ~ 0
PC10
Text Label 10100 3000 2    50   ~ 0
PC11
Text Label 10100 3100 2    50   ~ 0
PC12
Text Label 10100 3200 2    50   ~ 0
PC13
Text Label 10100 3300 2    50   ~ 0
PC14
Text Label 10100 3400 2    50   ~ 0
PC15
Text Notes 10150 2900 0    50   ~ 0
← REG
Text Notes 10150 3000 0    50   ~ 0
← REG
Text Notes 10150 3100 0    50   ~ 0
← REG
Text Notes 10150 3200 0    50   ~ 0
← REG
Text Notes 10150 3300 0    50   ~ 0
← REG
Text Notes 10150 3400 0    50   ~ 0
← REG
Wire Wire Line
	2650 2400 3100 2400
Wire Wire Line
	9500 3500 10100 3500
Text Label 10100 3500 2    50   ~ 0
FPRESET
Wire Wire Line
	9500 3600 10100 3600
Text Label 10100 3600 2    50   ~ 0
FPCLK
Wire Wire Line
	9500 3700 10100 3700
Text Label 10100 3700 2    50   ~ 0
FPCLKEN
Wire Wire Line
	9500 4600 10100 4600
Text Label 10100 4600 2    50   ~ 0
POWEROK
Entry Wire Line
	800  5550 900  5450
Entry Wire Line
	800  5450 900  5350
Entry Wire Line
	800  5350 900  5250
Entry Wire Line
	800  5250 900  5150
Entry Wire Line
	800  5150 900  5050
Entry Wire Line
	800  5050 900  4950
Entry Wire Line
	800  4950 900  4850
Entry Wire Line
	800  4850 900  4750
Entry Wire Line
	800  5650 900  5550
Wire Bus Line
	2650 3650 3250 3650
Wire Bus Line
	2650 3950 3250 3950
Wire Bus Line
	2650 3850 3250 3850
Wire Bus Line
	2650 3750 3250 3750
Wire Wire Line
	9500 3800 10100 3800
Text Label 10100 3800 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes 10150 3500 0    50   ~ 0
← DFP
Text Notes 10150 3600 0    50   ~ 0
← DFP
Text Notes 10150 3700 0    50   ~ 0
← DFP
Text Notes 10150 4600 0    50   ~ 0
← PSU (backplane)
Text Notes 10150 3800 0    50   ~ 0
→ DFP
Wire Bus Line
	4200 4650 3600 4650
Wire Wire Line
	2650 4450 3250 4450
Wire Wire Line
	3600 3450 4200 3450
Wire Wire Line
	2650 2500 3100 2500
Wire Wire Line
	2650 2600 3100 2600
Wire Wire Line
	2650 2700 3100 2700
Wire Wire Line
	2650 2850 3100 2850
Text Label 900  3650 0    50   ~ 0
~RESET
Wire Wire Line
	900  2250 1500 2250
Wire Wire Line
	900  3650 1500 3650
Text Label 800  5350 1    50   ~ 0
IR[0..15]
Wire Wire Line
	5350 6350 5950 6350
Text Label 5950 6350 2    50   ~ 0
FI
Wire Wire Line
	5350 7100 5950 7100
Wire Wire Line
	5350 7200 5950 7200
Text Label 5950 7100 2    50   ~ 0
~IRQS
Text Label 5950 7200 2    50   ~ 0
~IRQSµC
Text Notes 800  1000 0    100  ~ 20
The Control Unit Board
Text Notes 800  1800 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Notes 10200 5200 0    50   ~ 0
For future expansion
Text Notes 10200 5300 0    50   ~ 0
For future expansion
Text Notes 10200 5400 0    50   ~ 0
For future expansion
Text Notes 10200 5100 0    50   ~ 0
For future expansion
Text Notes 10200 4800 0    50   ~ 0
For future expansion
Text Notes 10200 4900 0    50   ~ 0
For future expansion
Text Notes 10200 5000 0    50   ~ 0
For future expansion
Text Notes 9400 4900 0    50   ~ 0
For future expansion
Text Label 10100 4200 2    50   ~ 0
~FPµC2
Text Label 10100 4100 2    50   ~ 0
~FPµC1
Text Label 10100 4000 2    50   ~ 0
~FPµC0
Text Label 10100 3900 2    50   ~ 0
~FPµA0
Wire Wire Line
	9500 4200 10100 4200
Wire Wire Line
	9500 4100 10100 4100
Wire Wire Line
	9500 4000 10100 4000
Wire Wire Line
	9500 3900 10100 3900
Text Notes 10150 3900 0    50   ~ 0
← DFP
Text Notes 10150 4000 0    50   ~ 0
← DFP
Text Notes 10150 4100 0    50   ~ 0
← DFP
Text Notes 10150 4200 0    50   ~ 0
← DFP
Wire Wire Line
	9500 4300 10100 4300
Wire Wire Line
	9500 4400 10100 4400
Text Label 10100 4300 2    50   ~ 0
~FPIRL
Text Label 10100 4400 2    50   ~ 0
~FPIRH
Text Notes 10150 4300 0    50   ~ 0
← DFP
Text Notes 10150 4400 0    50   ~ 0
← DFP
Wire Wire Line
	2650 6850 3250 6850
Text Label 3250 6850 2    50   ~ 0
~READ-AGL
Wire Wire Line
	4200 3350 3600 3350
Text Label 3600 3350 0    50   ~ 0
~READ-AGL
Text Label 3600 2350 0    50   ~ 0
~WRITE-IR
Wire Wire Line
	4200 2350 3600 2350
Wire Wire Line
	4200 7050 3600 7050
Wire Wire Line
	2650 6950 3250 6950
Text Label 3250 6950 2    50   ~ 0
~WRITE-IR
$Sheet
S 4200 6250 1150 1050
U 5F67D4B5
F0 "Interrupt State Machine" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L 4200 7200 50 
F3 "~RESET" I L 4200 6350 50 
F4 "FI" O R 5350 6350 50 
F5 "~IRQS" O R 5350 7100 50 
F6 "~END" I L 4200 7050 50 
F7 "CLK4" I L 4200 6550 50 
F8 "CLK1" I L 4200 6450 50 
F9 "~IRQSµC" O R 5350 7200 50 
F10 "IBUS15" I L 4200 6850 50 
F11 "~FLAGWE" I L 4200 6950 50 
F12 "ACTION[0..3]" I L 4200 6650 50 
$EndSheet
Text Label 3600 6350 0    50   ~ 0
~RESET
Text Label 900  2250 0    50   ~ 0
~RESET
Wire Wire Line
	9500 2300 10100 2300
Text Label 10100 2300 2    50   ~ 0
~WEN
Wire Bus Line
	9950 1450 9950 2100
Wire Bus Line
	800  4850 800  5650
Text Notes 10150 2300 0    50   ~ 0
← BUS
$EndSCHEMATC
