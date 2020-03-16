EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 11
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
S -2350 4150 1150 1600
U 5EFCF155
F0 "Skip/Branch Unit" 50
F1 "cft_sbu.sch" 50
F2 "~COND" O R -1200 4300 50 
F3 "FN" I L -2350 5100 50 
F4 "~SKIPEXT" T L -2350 5300 50 
F5 "FV" I L -2350 4800 50 
F6 "FL" I L -2350 4900 50 
F7 "FZ" I L -2350 5000 50 
F8 "CLK4" I L -2350 4400 50 
F9 "COND[0..4]" I L -2350 4500 50 
F10 "~RESET" I L -2350 4300 50 
F11 "IR[0..6]" I L -2350 4600 50 
F12 "CEXT8" T L -2350 5400 50 
F13 "CEXT9" T L -2350 5500 50 
F14 "CEXT10" T L -2350 5600 50 
$EndSheet
Text Label -5650 4500 0    50   ~ 0
IN-RSVD
Text Label -5650 4400 0    50   ~ 0
~COND
Text Label -3300 5500 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-3900 5500 -3300 5500
Text Label -3300 5400 2    50   ~ 0
~FPµC2
Text Label -3300 5300 2    50   ~ 0
~FPµC1
Text Label -3300 5200 2    50   ~ 0
~FPµC0
Text Label -3300 5100 2    50   ~ 0
~FPµA0
Wire Wire Line
	-3900 5400 -3300 5400
Wire Wire Line
	-3900 5300 -3300 5300
Wire Wire Line
	-3900 5200 -3300 5200
Wire Wire Line
	-3900 5100 -3300 5100
Text Label -3300 4300 2    50   ~ 0
~END
Text Label -3300 4200 2    50   ~ 0
~WEN
Text Label -3300 4100 2    50   ~ 0
~R
Text Label -3300 4000 2    50   ~ 0
~IO
Text Label -3300 3900 2    50   ~ 0
~MEM
Wire Wire Line
	-3900 4200 -3300 4200
Wire Wire Line
	-3900 4100 -3300 4100
Wire Wire Line
	-3900 4000 -3300 4000
Wire Wire Line
	-3900 3900 -3300 3900
Text Label -5650 4100 0    50   ~ 0
~WS
Text Label -5650 4000 0    50   ~ 0
~ENDEXT
Wire Wire Line
	-5650 4100 -5050 4100
Wire Wire Line
	-5650 4000 -5050 4000
Text Label -5650 3600 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	-5650 3600 -5050 3600
Text Label -5650 3800 0    50   ~ 0
CLK4
Wire Wire Line
	-5050 3800 -5650 3800
Text Label -5650 3900 0    50   ~ 0
~HALT
Wire Wire Line
	-5050 3900 -5650 3900
Text Label -3450 2700 2    50   ~ 0
T34
Text Label -3450 2550 2    50   ~ 0
CLK4
Text Label -3450 2450 2    50   ~ 0
CLK3
Text Label -3450 2350 2    50   ~ 0
CLK2
Text Label -3450 2250 2    50   ~ 0
CLK1
Text Label -3450 2100 2    50   ~ 0
~RSTHOLD
$Sheet
S -5050 1950 1150 1050
U 5E36D9C8
F0 "Clock Generator" 50
F1 "cft_clk.sch" 50
F2 "CLK1" O R -3900 2250 50 
F3 "CLK2" O R -3900 2350 50 
F4 "CLK3" O R -3900 2450 50 
F5 "CLK4" O R -3900 2550 50 
F6 "~RESET" I L -5050 2100 50 
F7 "FPCLK" I L -5050 2350 50 
F8 "~RSTHOLD" O R -3900 2100 50 
F9 "POWEROK" I L -5050 2700 50 
F10 "~FPRESET" I L -5050 2250 50 
F11 "~FPCLK~⁄CLK" I L -5050 2450 50 
F12 "T34" O R -3900 2700 50 
F13 "WSTB" U R -3900 2800 50 
$EndSheet
Wire Wire Line
	-3450 2100 -3900 2100
Text Label -5650 2700 0    50   ~ 0
POWEROK
Text Label -5650 2450 0    50   ~ 0
~FPCLK~⁄CLK
Text Label -5650 2350 0    50   ~ 0
FPCLK
Text Label -5650 2250 0    50   ~ 0
~FPRESET
Wire Wire Line
	-5050 2450 -5650 2450
Wire Wire Line
	-5050 2350 -5650 2350
Wire Wire Line
	-5050 2250 -5650 2250
Wire Wire Line
	-5050 2700 -5650 2700
Text Label -3300 3500 2    50   ~ 0
RADDR[0..4]
Text Label -3300 3600 2    50   ~ 0
WADDR[0..4]
Text Label -3300 3700 2    50   ~ 0
COND[0..4]
Text Label -3300 3800 2    50   ~ 0
ACTION[0..3]
Text Label -600 2100 2    50   ~ 0
IR[0..15]
Text Label -600 2500 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-1200 2500 -600 2500
Wire Bus Line
	-2350 2300 -2950 2300
Text Label -2950 2300 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	-1200 2300 -600 2300
Wire Wire Line
	-1200 2400 -600 2400
Text Label -600 2300 2    50   ~ 0
~FPIRL
Text Label -600 2400 2    50   ~ 0
~FPIRH
Wire Wire Line
	-3900 5000 -3300 5000
Text Label -3300 5000 2    50   ~ 0
FPFETCH∕~EXEC
Wire Bus Line
	-1200 3200 -600 3200
Text Label -600 3200 2    50   ~ 0
IBUS[0..15]
Wire Wire Line
	-1200 4300 -600 4300
Text Label -600 4300 2    50   ~ 0
~COND
Text Label -2950 4300 0    50   ~ 0
~RESET
Wire Wire Line
	-2350 4300 -2950 4300
Text Label -2950 4400 0    50   ~ 0
CLK4
Wire Wire Line
	-2350 4400 -2950 4400
Wire Bus Line
	-2950 4600 -2350 4600
Wire Bus Line
	-2350 3650 -2950 3650
Text Label -2950 3650 0    50   ~ 0
PC[10..15]
Text Label -2950 3300 0    50   ~ 0
~END
Wire Wire Line
	-2350 4800 -2950 4800
Wire Wire Line
	-2350 4900 -2950 4900
Wire Wire Line
	-2350 5000 -2950 5000
Wire Wire Line
	-2350 5100 -2950 5100
Text Label -2950 4800 0    50   ~ 0
FV
Text Label -2950 4900 0    50   ~ 0
FL
Text Label -2950 5000 0    50   ~ 0
FZ
Text Label -2950 5100 0    50   ~ 0
FN
Text Label -2950 4500 0    50   ~ 0
COND[0..4]
Text Label -2950 4600 0    50   ~ 0
IR[0..6]
Wire Wire Line
	-2350 5300 -2950 5300
Text Label -2950 5300 0    50   ~ 0
~SKIPEXT
Wire Wire Line
	-5650 4500 -5050 4500
Wire Bus Line
	-5050 6500 -5650 6500
Text Label -5650 6500 0    50   ~ 0
IBUS[0..15]
Text Label -3300 7200 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-3900 7200 -3300 7200
Wire Wire Line
	-2350 6200 -2950 6200
Wire Wire Line
	-2350 6300 -2950 6300
Wire Wire Line
	-2350 6700 -2950 6700
Wire Wire Line
	-2350 6800 -2950 6800
Wire Wire Line
	-2350 7050 -2950 7050
Text Label -2950 6300 0    50   ~ 0
CLK4
Text Label -2950 6700 0    50   ~ 0
IBUS15
Text Label -2950 6800 0    50   ~ 0
~FLAGWE
Text Label -2950 6900 0    50   ~ 0
~END
Text Label -2950 7050 0    50   ~ 0
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
NoConn ~ 7800 2200
NoConn ~ 7800 2300
NoConn ~ 7800 2900
NoConn ~ 7800 3000
NoConn ~ 7800 3100
NoConn ~ 7800 3200
NoConn ~ 7800 3300
NoConn ~ 7800 3400
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
	-5050 4200 -5650 4200
Wire Wire Line
	-5050 4300 -5650 4300
Text Label -5650 4200 0    50   ~ 0
IDX0
Text Label -5650 4300 0    50   ~ 0
IDX1
$Sheet
S -5050 3350 1150 2300
U 5DEAC282
F0 "Microprogram Sequencer" 50
F1 "cft_microcode.sch" 50
F2 "~ENDEXT" I L -5050 4000 50 
F3 "~RSTHOLD" I L -5050 3600 50 
F4 "~WS" I L -5050 4100 50 
F5 "~HALT" I L -5050 3900 50 
F6 "CLK4" I L -5050 3800 50 
F7 "~RESET" I L -5050 3500 50 
F8 "RADDR[0..4]" O R -3900 3500 50 
F9 "WADDR[0..4]" O R -3900 3600 50 
F10 "COND[0..4]" O R -3900 3700 50 
F11 "ACTION[0..3]" O R -3900 3800 50 
F12 "~MEM" O R -3900 3900 50 
F13 "~IO" O R -3900 4000 50 
F14 "~R" O R -3900 4100 50 
F15 "~WEN" O R -3900 4200 50 
F16 "~END" O R -3900 4300 50 
F17 "~IRQSµC" I L -5050 5500 50 
F18 "IN-RSVD" I L -5050 4500 50 
F19 "~COND" I L -5050 4400 50 
F20 "FPD[0..7]" T R -3900 5500 50 
F21 "~FPµA0" I R -3900 5100 50 
F22 "~FPµC0" I R -3900 5200 50 
F23 "~FPµC1" I R -3900 5300 50 
F24 "~FPµC2" I R -3900 5400 50 
F25 "FPFETCH" O R -3900 5000 50 
F26 "IDX0" I L -5050 4200 50 
F27 "IDX1" I L -5050 4300 50 
F28 "IR7" I L -5050 4600 50 
F29 "IR8" I L -5050 4700 50 
F30 "IR9" I L -5050 4800 50 
F31 "IR10" I L -5050 4900 50 
F32 "IR11" I L -5050 5000 50 
F33 "IR12" I L -5050 5100 50 
F34 "IR13" I L -5050 5200 50 
F35 "IR14" I L -5050 5300 50 
F36 "IR15" I L -5050 5400 50 
F37 "CLK2" I L -5050 3700 50 
$EndSheet
Wire Wire Line
	-5650 3700 -5050 3700
Text Label -5650 3700 0    50   ~ 0
CLK2
Wire Wire Line
	-5050 4600 -5650 4600
Wire Wire Line
	-5050 4700 -5650 4700
Wire Wire Line
	-5050 4800 -5650 4800
Wire Wire Line
	-5050 4900 -5650 4900
Wire Wire Line
	-5050 5000 -5650 5000
Wire Wire Line
	-5050 5100 -5650 5100
Wire Wire Line
	-5050 5200 -5650 5200
Wire Wire Line
	-5050 5300 -5650 5300
Wire Wire Line
	-5050 5400 -5650 5400
Wire Wire Line
	-5050 5500 -5550 5500
Text Label -5650 4600 0    50   ~ 0
IR7
Text Label -5650 4700 0    50   ~ 0
IR8
Text Label -5650 4800 0    50   ~ 0
IR9
Text Label -5650 4900 0    50   ~ 0
IR10
Text Label -5650 5000 0    50   ~ 0
IR11
Text Label -5650 5100 0    50   ~ 0
IR12
Text Label -5650 5200 0    50   ~ 0
IR13
Text Label -5650 5300 0    50   ~ 0
IR14
Text Label -5650 5400 0    50   ~ 0
IR15
Text Label -5550 5500 0    50   ~ 0
~IRQSµC
Text Label 10100 5500 2    50   ~ 0
IN-RSVD
Text Notes 10200 5500 0    50   ~ 0
For future expansion
Wire Wire Line
	-5050 4400 -5650 4400
Wire Bus Line
	-1200 2100 -600 2100
$Sheet
S -2350 1950 1150 750 
U 5F63066B
F0 "Instruction Register (IR)" 50
F1 "cfg_reg_ir.sch" 50
F2 "IBUS[0..15]" T L -2350 2300 50 
F3 "IR[0..15]" B R -1200 2100 50 
F4 "~FPIRL" I R -1200 2300 50 
F5 "~FPIRH" I R -1200 2400 50 
F6 "FPD[0..7]" T R -1200 2500 50 
F7 "CLK4" I L -2350 2100 50 
F8 "~WRITE-IR" I L -2350 2200 50 
$EndSheet
Wire Wire Line
	-2350 2100 -2950 2100
Text Label -2950 2100 0    50   ~ 0
CLK4
Wire Wire Line
	-1200 3550 -600 3550
Wire Wire Line
	-1200 3650 -600 3650
Text Label -600 3550 2    50   ~ 0
IDX0
Text Label -600 3650 2    50   ~ 0
IDX1
Wire Bus Line
	-2950 3550 -2350 3550
Text Label -2950 3550 0    50   ~ 0
IR[0..11]
$Sheet
S -2350 3050 1150 750 
U 5F3EA987
F0 "Addressing Modes" 50
F1 "cft_agl.sch" 50
F2 "IBUS[0..15]" T R -1200 3200 50 
F3 "IR[0..11]" I L -2350 3550 50 
F4 "PC[10..15]" I L -2350 3650 50 
F5 "~END" I L -2350 3300 50 
F6 "IDX0" O R -1200 3550 50 
F7 "IDX1" O R -1200 3650 50 
F8 "~READ-AGL" I L -2350 3200 50 
F9 "IDXEN" O R -1200 3400 50 
$EndSheet
$Sheet
S -5050 6050 1150 1300
U 5D69F3FD
F0 "Flag Unit" 50
F1 "flag_unit.sch" 50
F2 "FPD[0..7]" T R -3900 7200 50 
F3 "IBUS[8..15]" T L -5050 6500 50 
F4 "~FPFLAGS" I L -5050 7200 50 
F5 "WADDR[0..4]" I L -5050 6300 50 
F6 "RADDR[0..4]" I L -5050 6400 50 
F7 "FI" I L -5050 6650 50 
F8 "FV" I L -5050 6750 50 
F9 "FL" I L -5050 6850 50 
F10 "FZ" I L -5050 6950 50 
F11 "FN" I L -5050 7050 50 
F12 "~FLAGWE" O R -3900 6300 50 
F13 "CLK4" I L -5050 6200 50 
F14 "~READ-AGL" O R -3900 6700 50 
F15 "~WRITE-IR" O R -3900 6800 50 
$EndSheet
Wire Bus Line
	-5050 6300 -5650 6300
Text Label -5650 6300 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	-5050 6400 -5650 6400
Text Label -5650 6400 0    50   ~ 0
RADDR[4..0]
Wire Bus Line
	-2350 6500 -2950 6500
Text Label -2950 6500 0    50   ~ 0
ACTION[0..3]
Wire Wire Line
	-5050 6200 -5650 6200
Text Label -5650 6200 0    50   ~ 0
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
Text Notes 10150 2500 0    50   ~ 0
← ALU
Wire Wire Line
	-2350 5400 -2950 5400
Wire Wire Line
	-2350 5500 -2950 5500
Wire Wire Line
	-2350 5600 -3000 5600
Text Label -2950 5400 0    50   ~ 0
CEXT8
Text Label -2950 5500 0    50   ~ 0
CEXT9
Text Label -2950 5600 0    50   ~ 0
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
Wire Wire Line
	-3900 6300 -3300 6300
Text Label -3300 6300 2    50   ~ 0
~FLAGWE
Wire Wire Line
	-5050 6650 -5650 6650
Wire Wire Line
	-5050 6750 -5650 6750
Wire Wire Line
	-5050 6850 -5650 6850
Wire Wire Line
	-5050 6950 -5650 6950
Wire Wire Line
	-5050 7050 -5650 7050
Wire Wire Line
	-5050 7200 -5650 7200
Text Label -5650 7200 0    50   ~ 0
~FPFLAGS
Text Label -5650 6650 0    50   ~ 0
FI
Text Label -5650 6750 0    50   ~ 0
FV
Text Label -5650 6850 0    50   ~ 0
FL
Text Label -5650 6950 0    50   ~ 0
FZ
Text Label -5650 7050 0    50   ~ 0
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
	-3900 2250 -3450 2250
Wire Wire Line
	9500 3500 10100 3500
Text Label 10100 3500 2    50   ~ 0
~FPRESET
Wire Wire Line
	9500 3600 10100 3600
Text Label 10100 3600 2    50   ~ 0
FPCLK
Wire Wire Line
	9500 3700 10100 3700
Text Label 10100 3700 2    50   ~ 0
~FPCLK~⁄CLK
Wire Wire Line
	9500 4600 10100 4600
Text Label 10100 4600 2    50   ~ 0
POWEROK
Entry Wire Line
	-5750 5400 -5650 5300
Entry Wire Line
	-5750 5300 -5650 5200
Entry Wire Line
	-5750 5200 -5650 5100
Entry Wire Line
	-5750 5100 -5650 5000
Entry Wire Line
	-5750 5000 -5650 4900
Entry Wire Line
	-5750 4900 -5650 4800
Entry Wire Line
	-5750 4800 -5650 4700
Entry Wire Line
	-5750 4700 -5650 4600
Entry Wire Line
	-5750 5500 -5650 5400
Wire Bus Line
	-3900 3500 -3300 3500
Wire Bus Line
	-3900 3800 -3300 3800
Wire Bus Line
	-3900 3700 -3300 3700
Wire Bus Line
	-3900 3600 -3300 3600
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
	-2350 4500 -2950 4500
Wire Wire Line
	-3900 4300 -3300 4300
Wire Wire Line
	-2950 3300 -2350 3300
Wire Wire Line
	-3900 2350 -3450 2350
Wire Wire Line
	-3900 2450 -3450 2450
Wire Wire Line
	-3900 2550 -3450 2550
Wire Wire Line
	-3900 2700 -3450 2700
Text Label -5650 3500 0    50   ~ 0
~RESET
Wire Wire Line
	-5650 2100 -5050 2100
Wire Wire Line
	-5650 3500 -5050 3500
Text Label -5750 5200 1    50   ~ 0
IR[0..15]
Wire Wire Line
	-1200 6200 -600 6200
Text Label -600 6200 2    50   ~ 0
FI
Wire Wire Line
	-1200 6950 -600 6950
Wire Wire Line
	-1200 7050 -600 7050
Text Label -600 6950 2    50   ~ 0
~IRQS
Text Label -600 7050 2    50   ~ 0
~IRQSµC
Text Notes 800  1000 0    100  ~ 20
The INT, IRC and RTC boards
Text Notes 800  1800 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Notes 10200 5200 0    50   ~ 0
For future expansion
Text Notes 10200 5300 0    50   ~ 0
For future expansion
Text Notes 10200 5100 0    50   ~ 0
For future expansion
Text Notes 10200 4800 0    50   ~ 0
For future expansion
Text Notes 10200 4900 0    50   ~ 0
For future expansion
Text Notes 10200 5000 0    50   ~ 0
For future expansion
Text Notes 10200 4700 0    50   ~ 0
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
	-3900 6700 -3300 6700
Text Label -3300 6700 2    50   ~ 0
~READ-AGL
Wire Wire Line
	-2350 3200 -2950 3200
Text Label -2950 3200 0    50   ~ 0
~READ-AGL
Text Label -2950 2200 0    50   ~ 0
~WRITE-IR
Wire Wire Line
	-2350 2200 -2950 2200
Wire Wire Line
	-2350 6900 -2950 6900
Wire Wire Line
	-3900 6800 -3300 6800
Text Label -3300 6800 2    50   ~ 0
~WRITE-IR
$Sheet
S -2350 6100 1150 1050
U 5F67D4B5
F0 "Interrupt State Machine" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L -2350 7050 50 
F3 "~RESET" I L -2350 6200 50 
F4 "FI" O R -1200 6200 50 
F5 "~IRQS" O R -1200 6950 50 
F6 "~END" I L -2350 6900 50 
F7 "CLK4" I L -2350 6300 50 
F8 "~IRQSµC" O R -1200 7050 50 
F9 "IBUS15" I L -2350 6700 50 
F10 "~FLAGWE" I L -2350 6800 50 
F11 "ACTION[0..3]" I L -2350 6500 50 
$EndSheet
Text Label -2950 6200 0    50   ~ 0
~RESET
Text Label -5650 2100 0    50   ~ 0
~RESET
Wire Wire Line
	9500 2300 10100 2300
Text Label 10100 2300 2    50   ~ 0
~WEN
Text Notes 10150 2300 0    50   ~ 0
← BUS
Wire Wire Line
	9500 4500 10100 4500
Text Notes 10150 4500 0    50   ~ 0
← DFP
Text Label 10100 4500 2    50   ~ 0
~FPFLAGS
Wire Wire Line
	-3900 2800 -3450 2800
Text Label -3450 2800 2    50   ~ 0
WSTB
Wire Wire Line
	-1200 3400 -600 3400
Text Label -600 3400 2    50   ~ 0
IDXEN
Text Label 10100 5400 2    50   ~ 0
IDXEN
Text Notes 10150 2200 0    50   ~ 0
→ BUS.MBU
Text Notes 10200 5400 0    50   ~ 0
→ BUS.MBU
$Comp
L Connector:TestPoint TP4
U 1 1 5E9C8A8F
P -3000 5600
F 0 "TP4" V -2897 5672 50  0000 C CNN
F 1 "TestPoint" V -2896 5672 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -2800 5600 50  0001 C CNN
F 3 "~" H -2800 5600 50  0001 C CNN
	1    -3000 5600
	0    -1   -1   0   
$EndComp
Text Notes 4600 3950 1    50   ~ 10
IO=&030–037
$Comp
L power:+5V #PWR0118
U 1 1 5E745588
P 2750 3950
AR Path="/5E745588" Ref="#PWR0118"  Part="1" 
AR Path="/5D65F6EF/5E745588" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5E745588" Ref="#PWR?"  Part="1" 
AR Path="/5F67D4B5/5E745588" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H 2750 3800 50  0001 C CNN
F 1 "+5V" H 2765 4123 50  0000 C CNN
F 2 "" H 2750 3950 50  0001 C CNN
F 3 "" H 2750 3950 50  0001 C CNN
	1    2750 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 5E74557E
P 4550 3700
AR Path="/5F3EA987/5E74557E" Ref="U?"  Part="1" 
AR Path="/5E74557E" Ref="U7"  Part="1" 
AR Path="/61F95ACC/5E74557E" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E74557E" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E74557E" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/5E74557E" Ref="U?"  Part="1" 
F 0 "U7" H 4550 4367 50  0000 C CNN
F 1 "74HC138" H 4550 4276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4550 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4550 3700 50  0001 C CNN
	1    4550 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3300 3750 3300
Wire Wire Line
	4050 3400 3750 3400
Wire Wire Line
	4050 3500 3750 3500
Text Label 3750 3300 0    50   ~ 0
AB3
Text Label 3750 3400 0    50   ~ 0
AB4
Text Label 3750 3900 0    50   ~ 0
AB5
Wire Wire Line
	3750 3900 4050 3900
Wire Wire Line
	3750 4000 4050 4000
Wire Wire Line
	3750 4100 4050 4100
$Comp
L alexios:74HC74 U9
U 1 1 5E7D9D89
P 2250 9550
F 0 "U9" H 2250 9967 50  0000 C CNN
F 1 "74HC74" H 2250 9876 50  0000 C CNN
F 2 "" H 2200 9700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 2200 9700 50  0001 C CNN
	1    2250 9550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U9
U 2 1 5E7DB5F5
P 2250 10700
F 0 "U9" H 2250 10375 50  0000 C CNN
F 1 "74HC74" H 2250 10284 50  0000 C CNN
F 2 "" H 2200 10850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 2200 10850 50  0001 C CNN
	2    2250 10700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC573 U16
U 1 1 5E7ED8E2
P -700 9900
F 0 "U16" H -700 10667 50  0000 C CNN
F 1 "74HC573" H -700 10576 50  0000 C CNN
F 2 "" H -700 9900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H -700 9900 50  0001 C CNN
F 4 "Yes" H -1275 9000 50  0001 C CNN "Verified"
	1    -700 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1200 9400 -1550 9400
Wire Wire Line
	-1200 9500 -1550 9500
Wire Wire Line
	-1200 9600 -1550 9600
Wire Wire Line
	-1200 9700 -1550 9700
Wire Wire Line
	-1200 9800 -1550 9800
Wire Wire Line
	-1200 9900 -1550 9900
Wire Wire Line
	-1200 10000 -1550 10000
Wire Wire Line
	-1200 10100 -1550 10100
Wire Wire Line
	-1200 10300 -1550 10300
Text Label -1550 9400 0    50   ~ 0
~IRQ0
Text Label -1550 9500 0    50   ~ 0
~IRQ1
Text Label -1550 9600 0    50   ~ 0
~IRQ2
Text Label -1550 9700 0    50   ~ 0
~IRQ3
Text Label -1550 9800 0    50   ~ 0
~IRQ4
Text Label -1550 9900 0    50   ~ 0
~IRQ5
Text Label -1550 10000 0    50   ~ 0
~IRQ6
Text Label -1550 10100 0    50   ~ 0
~IRQ7
Text Label -1550 10300 0    50   ~ 0
CLK2
$Comp
L power:GND #PWR0121
U 1 1 5E90EF4B
P -1250 10450
F 0 "#PWR0121" H -1250 10200 50  0001 C CNN
F 1 "GND" H -1245 10277 50  0000 C CNN
F 2 "" H -1250 10450 50  0001 C CNN
F 3 "" H -1250 10450 50  0001 C CNN
	1    -1250 10450
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1200 10400 -1250 10400
Wire Wire Line
	-1250 10400 -1250 10450
Text Label 150  9400 2    50   ~ 0
~LIRQ0
Text Label 150  9500 2    50   ~ 0
~LIRQ1
Text Label 150  9600 2    50   ~ 0
~LIRQ2
Text Label 150  9700 2    50   ~ 0
~LIRQ3
Text Label 150  9800 2    50   ~ 0
~LIRQ4
Text Label 150  9900 2    50   ~ 0
~LIRQ5
Text Label 150  10000 2    50   ~ 0
~LIRQ6
Text Label 150  10100 2    50   ~ 0
~LIRQ7
Wire Wire Line
	-200 9400 200  9400
Wire Wire Line
	-200 9500 200  9500
Wire Wire Line
	-200 9600 200  9600
Wire Wire Line
	-200 9700 200  9700
Wire Wire Line
	-200 9800 200  9800
Wire Wire Line
	-200 9900 200  9900
Wire Wire Line
	-200 10000 200  10000
Wire Wire Line
	-200 10100 200  10100
Entry Wire Line
	200  9400 300  9500
Entry Wire Line
	200  9500 300  9600
Entry Wire Line
	200  9600 300  9700
Entry Wire Line
	200  9700 300  9800
Entry Wire Line
	200  9800 300  9900
Entry Wire Line
	200  9900 300  10000
Entry Wire Line
	200  10000 300  10100
Entry Wire Line
	200  10100 300  10200
Entry Wire Line
	-1550 10100 -1650 10000
Entry Wire Line
	-1550 10000 -1650 9900
Entry Wire Line
	-1550 9900 -1650 9800
Entry Wire Line
	-1550 9800 -1650 9700
Entry Wire Line
	-1550 9700 -1650 9600
Entry Wire Line
	-1550 9600 -1650 9500
Entry Wire Line
	-1550 9500 -1650 9400
Entry Wire Line
	-1550 9400 -1650 9300
$Comp
L alexios:74HC259 U26
U 1 1 5EB924D3
P 8250 11600
F 0 "U26" H 8250 12267 50  0000 C CNN
F 1 "74HC259" H 8250 12176 50  0000 C CNN
F 2 "" H 8250 11600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT259.pdf" H 8250 11600 50  0001 C CNN
	1    8250 11600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 11900 9400 11900
Wire Wire Line
	9750 11800 9400 11800
Wire Wire Line
	9750 11700 9400 11700
Wire Wire Line
	9750 11600 9400 11600
Wire Wire Line
	9750 11500 9400 11500
Wire Wire Line
	9750 11400 9400 11400
Wire Wire Line
	9750 11300 9400 11300
Wire Wire Line
	9750 11200 9400 11200
Text Label 9400 12100 0    50   ~ 0
~FPIRF
Wire Wire Line
	9750 12100 9400 12100
Wire Wire Line
	9700 12200 9700 12250
Wire Wire Line
	9750 12200 9700 12200
$Comp
L power:GND #PWR0122
U 1 1 5EEED7EA
P 9700 12250
F 0 "#PWR0122" H 9700 12000 50  0001 C CNN
F 1 "GND" H 9705 12077 50  0000 C CNN
F 2 "" H 9700 12250 50  0001 C CNN
F 3 "" H 9700 12250 50  0001 C CNN
	1    9700 12250
	1    0    0    -1  
$EndComp
Text Label 11050 11900 2    50   ~ 0
FPD7
Text Label 11050 11800 2    50   ~ 0
FPD6
Text Label 11050 11700 2    50   ~ 0
FPD5
Text Label 11050 11600 2    50   ~ 0
FPD4
Text Label 11050 11500 2    50   ~ 0
FPD3
Text Label 11050 11400 2    50   ~ 0
FPD2
Text Label 11050 11300 2    50   ~ 0
FPD1
Text Label 11050 11200 2    50   ~ 0
FPD0
$Comp
L alexios:74HC541 U31
U 1 1 5EEED7F8
P 10250 11700
F 0 "U31" H 10250 12467 50  0000 C CNN
F 1 "74HC541" H 10250 12376 50  0000 C CNN
F 2 "" H 10250 11700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10250 11700 50  0001 C CNN
	1    10250 11700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 11200 11100 11200
Wire Wire Line
	10750 11300 11100 11300
Wire Wire Line
	10750 11400 11100 11400
Wire Wire Line
	10750 11500 11100 11500
Wire Wire Line
	10750 11600 11100 11600
Wire Wire Line
	10750 11700 11100 11700
Wire Wire Line
	10750 11800 11100 11800
Wire Wire Line
	10750 11900 11100 11900
Entry Wire Line
	11100 11200 11200 11300
Entry Wire Line
	11100 11300 11200 11400
Entry Wire Line
	11100 11400 11200 11500
Entry Wire Line
	11100 11500 11200 11600
Entry Wire Line
	11100 11600 11200 11700
Entry Wire Line
	11100 11700 11200 11800
Entry Wire Line
	11100 11800 11200 11900
Entry Wire Line
	11100 11900 11200 12000
Text Label 9400 11200 0    50   ~ 0
IEN0
Text Label 9400 11300 0    50   ~ 0
IEN1
Text Label 9400 11400 0    50   ~ 0
IEN2
Text Label 9400 11500 0    50   ~ 0
IEN3
Text Label 9400 11600 0    50   ~ 0
IEN4
Text Label 9400 11700 0    50   ~ 0
IEN5
Text Label 9400 11800 0    50   ~ 0
IEN6
Text Label 9400 11900 0    50   ~ 0
IEN7
Wire Wire Line
	7750 12000 7450 12000
Text Label 7450 12000 0    50   ~ 0
~RESET
Wire Wire Line
	7750 11800 7450 11800
Text Label 7450 11800 0    50   ~ 0
~WIER
Wire Wire Line
	7750 11200 7450 11200
Wire Wire Line
	7750 11400 7450 11400
Wire Wire Line
	7750 11500 7450 11500
Wire Wire Line
	7750 11600 7450 11600
Text Label 7450 11200 0    50   ~ 0
DB0
Text Label 7450 11400 0    50   ~ 0
DB1
Text Label 7450 11500 0    50   ~ 0
DB2
Text Label 7450 11600 0    50   ~ 0
DB3
Wire Wire Line
	8750 11900 9100 11900
Wire Wire Line
	8750 11800 9100 11800
Wire Wire Line
	8750 11700 9100 11700
Wire Wire Line
	8750 11600 9100 11600
Wire Wire Line
	8750 11500 9100 11500
Wire Wire Line
	8750 11400 9100 11400
Wire Wire Line
	8750 11300 9100 11300
Wire Wire Line
	8750 11200 9100 11200
Text Label 9100 11200 2    50   ~ 0
IEN0
Text Label 9100 11300 2    50   ~ 0
IEN1
Text Label 9100 11400 2    50   ~ 0
IEN2
Text Label 9100 11500 2    50   ~ 0
IEN3
Text Label 9100 11600 2    50   ~ 0
IEN4
Text Label 9100 11700 2    50   ~ 0
IEN5
Text Label 9100 11800 2    50   ~ 0
IEN6
Text Label 9100 11900 2    50   ~ 0
IEN7
Entry Wire Line
	11100 10150 11200 10250
Entry Wire Line
	11100 10050 11200 10150
Entry Wire Line
	11100 9950 11200 10050
Entry Wire Line
	11100 9850 11200 9950
Entry Wire Line
	11100 9750 11200 9850
Entry Wire Line
	11100 9650 11200 9750
Entry Wire Line
	11100 9550 11200 9650
Entry Wire Line
	11100 9450 11200 9550
Wire Wire Line
	10750 10150 11100 10150
Wire Wire Line
	10750 10050 11100 10050
Wire Wire Line
	10750 9950 11100 9950
Wire Wire Line
	10750 9850 11100 9850
Wire Wire Line
	10750 9750 11100 9750
Wire Wire Line
	10750 9650 11100 9650
Wire Wire Line
	10750 9550 11100 9550
Wire Wire Line
	10750 9450 11100 9450
$Comp
L alexios:74HC541 U21
U 1 1 5EB94CCA
P 10250 9950
F 0 "U21" H 10250 10717 50  0000 C CNN
F 1 "74HC541" H 10250 10626 50  0000 C CNN
F 2 "" H 10250 9950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10250 9950 50  0001 C CNN
	1    10250 9950
	1    0    0    -1  
$EndComp
Text Label 11050 9450 2    50   ~ 0
FPD0
Text Label 11050 9550 2    50   ~ 0
FPD1
Text Label 11050 9650 2    50   ~ 0
FPD2
Text Label 11050 9750 2    50   ~ 0
FPD3
Text Label 11050 9850 2    50   ~ 0
FPD4
Text Label 11050 9950 2    50   ~ 0
FPD5
Text Label 11050 10050 2    50   ~ 0
FPD6
Text Label 11050 10150 2    50   ~ 0
FPD7
$Comp
L power:GND #PWR0125
U 1 1 5EC8C696
P 9700 10500
F 0 "#PWR0125" H 9700 10250 50  0001 C CNN
F 1 "GND" H 9705 10327 50  0000 C CNN
F 2 "" H 9700 10500 50  0001 C CNN
F 3 "" H 9700 10500 50  0001 C CNN
	1    9700 10500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 10450 9700 10450
Wire Wire Line
	9700 10450 9700 10500
Wire Wire Line
	9750 10350 9400 10350
Text Label 9400 10350 0    50   ~ 0
~FPIRF
Wire Wire Line
	9750 9450 9400 9450
Wire Wire Line
	9750 9550 9400 9550
Wire Wire Line
	9750 9650 9400 9650
Wire Wire Line
	9750 9750 9400 9750
Wire Wire Line
	9750 9850 9400 9850
Wire Wire Line
	9750 9950 9400 9950
Wire Wire Line
	9750 10050 9400 10050
Wire Wire Line
	9750 10150 9400 10150
Text Label 9400 9450 0    50   ~ 0
IRF0
Text Label 9400 9550 0    50   ~ 0
IRF1
Text Label 9400 9650 0    50   ~ 0
IRF2
Text Label 9400 9750 0    50   ~ 0
IRF3
Text Label 9400 9850 0    50   ~ 0
IRF4
Text Label 9400 9950 0    50   ~ 0
IRF5
Text Label 9400 10050 0    50   ~ 0
IRF6
Text Label 9400 10150 0    50   ~ 0
IRF7
Text Label 9050 10150 2    50   ~ 0
DB7
Text Label 9050 10050 2    50   ~ 0
DB6
Text Label 9050 9950 2    50   ~ 0
DB5
Text Label 9050 9850 2    50   ~ 0
DB4
Text Label 9050 9750 2    50   ~ 0
DB3
Text Label 9050 9650 2    50   ~ 0
DB2
Text Label 9050 9550 2    50   ~ 0
DB1
Text Label 9050 9450 2    50   ~ 0
DB0
Text Label 7400 10150 0    50   ~ 0
IRF7
Text Label 7400 10050 0    50   ~ 0
IRF6
Text Label 7400 9950 0    50   ~ 0
IRF5
Text Label 7400 9850 0    50   ~ 0
IRF4
Text Label 7400 9750 0    50   ~ 0
IRF3
Text Label 7400 9650 0    50   ~ 0
IRF2
Text Label 7400 9550 0    50   ~ 0
IRF1
Text Label 7400 9450 0    50   ~ 0
IRF0
Wire Wire Line
	7750 10150 7400 10150
Wire Wire Line
	7750 10050 7400 10050
Wire Wire Line
	7750 9950 7400 9950
Wire Wire Line
	7750 9850 7400 9850
Wire Wire Line
	7750 9750 7400 9750
Wire Wire Line
	7750 9650 7400 9650
Wire Wire Line
	7750 9550 7400 9550
Wire Wire Line
	7750 9450 7400 9450
Text Label 7400 10350 0    50   ~ 0
~RISR
Wire Wire Line
	7750 10350 7400 10350
Wire Wire Line
	7700 10450 7700 10500
Wire Wire Line
	7750 10450 7700 10450
$Comp
L power:GND #PWR0126
U 1 1 5F15B1D8
P 7700 10500
F 0 "#PWR0126" H 7700 10250 50  0001 C CNN
F 1 "GND" H 7705 10327 50  0000 C CNN
F 2 "" H 7700 10500 50  0001 C CNN
F 3 "" H 7700 10500 50  0001 C CNN
	1    7700 10500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U17
U 1 1 5F15B1CA
P 8250 9950
F 0 "U17" H 8250 10717 50  0000 C CNN
F 1 "74HC541" H 8250 10626 50  0000 C CNN
F 2 "" H 8250 9950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8250 9950 50  0001 C CNN
	1    8250 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 9450 9100 9450
Wire Wire Line
	8750 9550 9100 9550
Wire Wire Line
	8750 9650 9100 9650
Wire Wire Line
	8750 9750 9100 9750
Wire Wire Line
	8750 9850 9100 9850
Wire Wire Line
	8750 9950 9100 9950
Wire Wire Line
	8750 10050 9100 10050
Wire Wire Line
	8750 10150 9100 10150
Entry Wire Line
	9100 9450 9200 9550
Entry Wire Line
	9100 9550 9200 9650
Entry Wire Line
	9100 9650 9200 9750
Entry Wire Line
	9100 9750 9200 9850
Entry Wire Line
	9100 9850 9200 9950
Entry Wire Line
	9100 9950 9200 10050
Entry Wire Line
	9100 10050 9200 10150
Entry Wire Line
	9100 10150 9200 10250
Wire Wire Line
	1800 9700 1400 9700
Wire Wire Line
	1800 9600 1400 9600
Text Label 1400 9600 0    50   ~ 0
~LIRQ0
Wire Wire Line
	2700 9400 3150 9400
Text Label 3150 9400 2    50   ~ 0
IRF0
Wire Wire Line
	1800 9500 1750 9500
Wire Wire Line
	1750 9500 1750 9400
Text Label 1400 9700 0    50   ~ 0
IEN0
$Comp
L power:+5V #PWR0127
U 1 1 5F3FC5AB
P 1750 9350
F 0 "#PWR0127" H 1750 9200 50  0001 C CNN
F 1 "+5V" H 1765 9523 50  0000 C CNN
F 2 "" H 1750 9350 50  0001 C CNN
F 3 "" H 1750 9350 50  0001 C CNN
	1    1750 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 9400 1750 9400
Connection ~ 1750 9400
Wire Wire Line
	1750 9400 1750 9350
Text Label 7350 14000 0    50   ~ 0
~RISR
Wire Wire Line
	7700 14000 7350 14000
Wire Wire Line
	7650 14100 7650 14150
Wire Wire Line
	7700 14100 7650 14100
$Comp
L power:GND #PWR0128
U 1 1 5F4792AF
P 7650 14150
F 0 "#PWR0128" H 7650 13900 50  0001 C CNN
F 1 "GND" H 7655 13977 50  0000 C CNN
F 2 "" H 7650 14150 50  0001 C CNN
F 3 "" H 7650 14150 50  0001 C CNN
	1    7650 14150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U49
U 1 1 5F4792B5
P 8200 13600
F 0 "U49" H 8200 14367 50  0000 C CNN
F 1 "74HC541" H 8200 14276 50  0000 C CNN
F 2 "" H 8200 13600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8200 13600 50  0001 C CNN
	1    8200 13600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 13100 9050 13100
Wire Wire Line
	8700 13200 9050 13200
Wire Wire Line
	8700 13300 9050 13300
Wire Wire Line
	8700 13400 9050 13400
Wire Wire Line
	8700 13500 9050 13500
Wire Wire Line
	8700 13600 9050 13600
Wire Wire Line
	8700 13700 9050 13700
Wire Wire Line
	8700 13800 9050 13800
Entry Wire Line
	9050 13100 9150 13200
Entry Wire Line
	9050 13200 9150 13300
Entry Wire Line
	9050 13300 9150 13400
Entry Wire Line
	9050 13400 9150 13500
Entry Wire Line
	9050 13500 9150 13600
Entry Wire Line
	9050 13600 9150 13700
Entry Wire Line
	9050 13700 9150 13800
Entry Wire Line
	9050 13800 9150 13900
Text Label 9000 13100 2    50   ~ 0
DB8
Text Label 9000 13200 2    50   ~ 0
DB9
Text Label 9000 13300 2    50   ~ 0
DB10
Text Label 9000 13400 2    50   ~ 0
DB11
Text Label 9000 13500 2    50   ~ 0
DB12
Text Label 9000 13600 2    50   ~ 0
DB13
Text Label 9000 13700 2    50   ~ 0
DB14
Text Label 9000 13800 2    50   ~ 0
DB15
$Comp
L power:+5V #PWR0131
U 1 1 5F5B442C
P 7650 13000
F 0 "#PWR0131" H 7650 12850 50  0001 C CNN
F 1 "+5V" H 7665 13173 50  0000 C CNN
F 2 "" H 7650 13000 50  0001 C CNN
F 3 "" H 7650 13000 50  0001 C CNN
	1    7650 13000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 13000 7650 13100
Wire Wire Line
	7650 13400 7700 13400
Wire Wire Line
	7700 13100 7650 13100
Connection ~ 7650 13100
Wire Wire Line
	7650 13100 7650 13200
Wire Wire Line
	7700 13200 7650 13200
Connection ~ 7650 13200
Wire Wire Line
	7650 13200 7650 13300
Wire Wire Line
	7700 13300 7650 13300
Connection ~ 7650 13300
Wire Wire Line
	7650 13300 7650 13400
Wire Wire Line
	7700 13500 7650 13500
Wire Wire Line
	7650 13500 7650 13600
Connection ~ 7650 14100
Wire Wire Line
	7700 13600 7650 13600
Connection ~ 7650 13600
Wire Wire Line
	7650 13600 7650 13700
Wire Wire Line
	7700 13700 7650 13700
Connection ~ 7650 13700
Wire Wire Line
	7650 13700 7650 13800
Wire Wire Line
	7700 13800 7650 13800
Connection ~ 7650 13800
Wire Wire Line
	7650 13800 7650 14100
$Comp
L alexios:82C54 U23
U 1 1 5F6EEC9C
P 15100 11050
F 0 "U23" H 15100 12067 50  0000 C CNN
F 1 "82C54" H 15100 11976 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W15.24mm" H 15100 10025 50  0001 C CNN
F 3 "http://download.intel.com/design/archives/periphrl/docs/23124406.pdf" H 14650 11950 50  0001 C CNN
	1    15100 11050
	1    0    0    -1  
$EndComp
$Comp
L alexios:82C54 U48
U 1 1 5F6EF7F1
P 15100 13150
F 0 "U48" H 15100 14167 50  0000 C CNN
F 1 "82C54" H 15100 14076 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W15.24mm" H 15100 12125 50  0001 C CNN
F 3 "http://download.intel.com/design/archives/periphrl/docs/23124406.pdf" H 14650 14050 50  0001 C CNN
	1    15100 13150
	1    0    0    -1  
$EndComp
Wire Wire Line
	14500 10350 14150 10350
Wire Wire Line
	14500 10450 14150 10450
Wire Wire Line
	14500 10550 14150 10550
Wire Wire Line
	14500 10650 14150 10650
Wire Wire Line
	14500 10750 14150 10750
Wire Wire Line
	14500 10850 14150 10850
Wire Wire Line
	14500 10950 14150 10950
Wire Wire Line
	14500 11050 14150 11050
Text Label 14150 10350 0    50   ~ 0
DB0
Text Label 14150 10450 0    50   ~ 0
DB1
Text Label 14150 10550 0    50   ~ 0
DB2
Text Label 14150 10650 0    50   ~ 0
DB3
Text Label 14150 10750 0    50   ~ 0
DB4
Text Label 14150 10850 0    50   ~ 0
DB5
Text Label 14150 10950 0    50   ~ 0
DB6
Text Label 14150 11050 0    50   ~ 0
DB7
Wire Wire Line
	14500 12450 14150 12450
Wire Wire Line
	14500 12550 14150 12550
Wire Wire Line
	14500 12650 14150 12650
Wire Wire Line
	14500 12750 14150 12750
Wire Wire Line
	14500 12850 14150 12850
Wire Wire Line
	14500 12950 14150 12950
Wire Wire Line
	14500 13050 14150 13050
Wire Wire Line
	14500 13150 14150 13150
Text Label 14150 12450 0    50   ~ 0
DB0
Text Label 14150 12550 0    50   ~ 0
DB1
Text Label 14150 12650 0    50   ~ 0
DB2
Text Label 14150 12750 0    50   ~ 0
DB3
Text Label 14150 12850 0    50   ~ 0
DB4
Text Label 14150 12950 0    50   ~ 0
DB5
Text Label 14150 13050 0    50   ~ 0
DB6
Text Label 14150 13150 0    50   ~ 0
DB7
Wire Bus Line
	9950 1450 9950 2100
Wire Bus Line
	9200 9550 9200 10500
Wire Bus Line
	-1650 8900 -1650 10000
Wire Bus Line
	300  9500 300  10600
Wire Bus Line
	-5750 4700 -5750 5500
Wire Bus Line
	9150 13200 9150 14150
Wire Bus Line
	11200 9550 11200 12300
$Comp
L Device:Battery_Cell BT1
U 1 1 5F93C39C
P 17450 12150
F 0 "BT1" H 17568 12246 50  0000 L CNN
F 1 "Battery_Cell" H 17568 12155 50  0000 L CNN
F 2 "Battery:Battery_Panasonic_CR2032-VS1N_Vertical_CircularHoles" V 17450 12210 50  0001 C CNN
F 3 "~" V 17450 12210 50  0001 C CNN
	1    17450 12150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
