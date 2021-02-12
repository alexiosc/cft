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
Text Label -9900 5450 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-10500 5450 -9900 5450
Text Label -9900 5350 2    50   ~ 0
~FPµC2
Text Label -9900 5250 2    50   ~ 0
~FPµC1
Text Label -9900 5150 2    50   ~ 0
~FPµC0
Text Label -9900 5050 2    50   ~ 0
~FPµA0
Wire Wire Line
	-10500 5350 -9900 5350
Wire Wire Line
	-10500 5250 -9900 5250
Wire Wire Line
	-10500 5150 -9900 5150
Wire Wire Line
	-10500 5050 -9900 5050
Text Label -9900 4250 2    50   ~ 0
~END
Text Label -9900 4150 2    50   ~ 0
~WEN
Text Label -9900 4050 2    50   ~ 0
~R
Text Label -9900 3950 2    50   ~ 0
~IO
Text Label -9900 3850 2    50   ~ 0
~MEM
Wire Wire Line
	-10500 4150 -9900 4150
Wire Wire Line
	-10500 4050 -9900 4050
Wire Wire Line
	-10500 3950 -9900 3950
Wire Wire Line
	-10500 3850 -9900 3850
Text Label -12250 4150 0    50   ~ 0
~WS
Text Label -12250 4050 0    50   ~ 0
~ENDEXT
Text Label -12250 3550 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	-12250 3550 -11650 3550
Text Label -12250 3850 0    50   ~ 0
CLK4
Wire Wire Line
	-11650 3750 -12250 3750
Text Label -12250 3950 0    50   ~ 0
~HALT
Text Label -10050 2650 2    50   ~ 0
T34
Text Label -10050 2500 2    50   ~ 0
CLK4
Text Label -10050 2400 2    50   ~ 0
CLK3
Text Label -10050 2300 2    50   ~ 0
CLK2
Text Label -10050 2200 2    50   ~ 0
CLK1
Text Label -10050 2050 2    50   ~ 0
~RSTHOLD
$Sheet
S -11650 1900 1150 1050
U 5E36D9C8
F0 "Clock Generator" 50
F1 "cft_clk.sch" 50
F2 "CLK1" O R -10500 2200 50 
F3 "CLK2" O R -10500 2300 50 
F4 "CLK3" O R -10500 2400 50 
F5 "CLK4" O R -10500 2500 50 
F6 "~RESET" I L -11650 2050 50 
F7 "FPCLK" I L -11650 2300 50 
F8 "~RSTHOLD" O R -10500 2050 50 
F9 "POWEROK" I L -11650 2650 50 
F10 "~FPRESET" I L -11650 2200 50 
F11 "~FPCLK~⁄CLK" I L -11650 2400 50 
F12 "T34" O R -10500 2650 50 
F13 "WSTB" U R -10500 2750 50 
$EndSheet
Wire Wire Line
	-10050 2050 -10500 2050
Text Label -12250 2650 0    50   ~ 0
POWEROK
Text Label -12250 2400 0    50   ~ 0
~FPCLK~⁄CLK
Text Label -12250 2300 0    50   ~ 0
FPCLK
Text Label -12250 2200 0    50   ~ 0
~FPRESET
Wire Wire Line
	-11650 2400 -12250 2400
Wire Wire Line
	-11650 2300 -12250 2300
Wire Wire Line
	-11650 2200 -12250 2200
Wire Wire Line
	-11650 2650 -12250 2650
Text Label -9900 3450 2    50   ~ 0
RADDR[0..4]
Text Label -9900 3550 2    50   ~ 0
WADDR[0..4]
Text Label -9900 3650 2    50   ~ 0
COND[0..4]
Text Label -9900 3750 2    50   ~ 0
ACTION[0..3]
Text Label -7200 2050 2    50   ~ 0
IR[0..15]
Text Label -7200 2450 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-7800 2450 -7200 2450
Wire Bus Line
	-8950 2250 -9550 2250
Text Label -9550 2250 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	-7800 2250 -7200 2250
Wire Wire Line
	-7800 2350 -7200 2350
Text Label -7200 2250 2    50   ~ 0
~FPIRL
Text Label -7200 2350 2    50   ~ 0
~FPIRH
Wire Wire Line
	-10500 4950 -9900 4950
Text Label -9900 4950 2    50   ~ 0
FPFETCH∕~EXEC
Wire Bus Line
	-7800 3150 -7200 3150
Text Label -7200 3150 2    50   ~ 0
IBUS[0..15]
Wire Bus Line
	-8950 3600 -9550 3600
Text Label -9550 3600 0    50   ~ 0
PC[10..15]
Text Label -9550 3250 0    50   ~ 0
~END
Wire Bus Line
	-11650 6450 -12250 6450
Text Label -12250 6450 0    50   ~ 0
IBUS[0..15]
Text Label -9900 7150 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-10500 7150 -9900 7150
Wire Bus Line
	-5350 2400 -4800 2400
Text Label -5350 2400 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-4800 1600 -5350 1600
Wire Wire Line
	-4800 1700 -5350 1700
Wire Wire Line
	-4800 1800 -5350 1800
Wire Wire Line
	-4800 1900 -5350 1900
Wire Wire Line
	-4800 1500 -5350 1500
Wire Wire Line
	-4800 2800 -5350 2800
Wire Wire Line
	-4800 2900 -5350 2900
Wire Wire Line
	-4800 3000 -5350 3000
Wire Wire Line
	-4800 2500 -5350 2500
Wire Wire Line
	-4800 3300 -5350 3300
Wire Wire Line
	-4800 3400 -5350 3400
Wire Wire Line
	-4800 3500 -5350 3500
Wire Wire Line
	-4800 3200 -5350 3200
Wire Wire Line
	-4800 3100 -5350 3100
Wire Wire Line
	-4800 4100 -5350 4100
Wire Wire Line
	-4800 4200 -5350 4200
Wire Wire Line
	-4800 4000 -5350 4000
Wire Wire Line
	-4800 3800 -5350 3800
Text Label -5350 2500 0    50   ~ 0
~IRQ
Wire Wire Line
	-4800 2200 -5350 2200
Wire Wire Line
	-4800 2300 -5350 2300
Wire Bus Line
	-5350 1400 -4800 1400
Text Label -5350 1400 0    50   ~ 0
IBUS[0..15]
Text Label -5350 1500 0    50   ~ 0
~RESET
Text Label -5350 1600 0    50   ~ 0
CLK1
Text Label -5350 1700 0    50   ~ 0
CLK2
Text Label -5350 1800 0    50   ~ 0
CLK3
Text Label -5350 1900 0    50   ~ 0
CLK4
Text Label -5350 2200 0    50   ~ 0
WSTB
Text Label -5350 2300 0    50   ~ 0
T34
Wire Wire Line
	-4800 2600 -5350 2600
Text Label -5350 2600 0    50   ~ 0
~IRQS
Text Label -5350 2800 0    50   ~ 0
~RSTHOLD
Text Label -5350 2900 0    50   ~ 0
~SYSDEV
Text Label -5350 3000 0    50   ~ 0
~IODEV1xx
Text Label -5350 3100 0    50   ~ 0
~IODEV2xx
Text Label -5350 3200 0    50   ~ 0
~IODEV3xx
Text Label -5350 3300 0    50   ~ 0
~MEM
Text Label -5350 3400 0    50   ~ 0
~IO
Text Label -5350 3500 0    50   ~ 0
~R
Text Label -5350 3800 0    50   ~ 0
~WS
Text Label -5350 4000 0    50   ~ 0
~ENDEXT
Text Label -5350 4100 0    50   ~ 0
~SKIPEXT
Text Label -5350 4200 0    50   ~ 0
~HALT
Text Label -5350 4300 0    50   ~ 0
ACTION[0..3]
Text Label -5350 4400 0    50   ~ 0
WADDR[0..4]
Text Label -5350 4500 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	-4800 4300 -5350 4300
Wire Bus Line
	-4800 4400 -5350 4400
Wire Bus Line
	-4800 4500 -5350 4500
Wire Bus Line
	-5350 4600 -4800 4600
Text Label -5350 4600 0    50   ~ 0
RSVD[1..4]
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P -2300 5850
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR0105"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0105" H -2300 5700 50  0001 C CNN
F 1 "+5V" H -2358 5887 50  0000 R CNN
F 2 "" H -2300 5850 50  0001 C CNN
F 3 "" H -2300 5850 50  0001 C CNN
	1    -2300 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552A6
P -2300 6250
AR Path="/5F67D4B5/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A6" Ref="#PWR0110"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H -2300 6000 50  0001 C CNN
F 1 "GND" H -2378 6213 50  0000 R CNN
F 2 "" H -2300 6250 50  0001 C CNN
F 3 "" H -2300 6250 50  0001 C CNN
	1    -2300 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2300 5850 -2300 5950
$Comp
L Device:CP_Small C103
U 1 1 5DD552AD
P -2300 6050
AR Path="/5DD552AD" Ref="C103"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C103" H -2388 6096 50  0000 R CNN
F 1 "47µF" H -2388 6005 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2300 6050 50  0001 C CNN
F 3 "~" H -2300 6050 50  0001 C CNN
	1    -2300 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2300 6150 -2300 6250
$Comp
L power:+5V #PWR?
U 1 1 5DD552B4
P -2750 5850
AR Path="/5F67D4B5/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD552B4" Ref="#PWR0104"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0104" H -2750 5700 50  0001 C CNN
F 1 "+5V" H -2808 5887 50  0000 R CNN
F 2 "" H -2750 5850 50  0001 C CNN
F 3 "" H -2750 5850 50  0001 C CNN
	1    -2750 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552BA
P -2750 6250
AR Path="/5F67D4B5/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD552BA" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H -2750 6000 50  0001 C CNN
F 1 "GND" H -2828 6213 50  0000 R CNN
F 2 "" H -2750 6250 50  0001 C CNN
F 3 "" H -2750 6250 50  0001 C CNN
	1    -2750 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2750 5850 -2750 5950
$Comp
L Device:CP_Small C102
U 1 1 5DD552C1
P -2750 6050
AR Path="/5DD552C1" Ref="C102"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C102" H -2838 6096 50  0000 R CNN
F 1 "47µF" H -2838 6005 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2750 6050 50  0001 C CNN
F 3 "~" H -2750 6050 50  0001 C CNN
	1    -2750 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2750 6150 -2750 6250
Text Notes -4850 1000 0    100  ~ 20
Edge Connector
Wire Wire Line
	-3650 2400 -3050 2400
NoConn ~ -5350 2900
NoConn ~ -5350 3000
NoConn ~ -5350 3100
NoConn ~ -5350 3200
NoConn ~ -5350 4600
Wire Wire Line
	-3650 1400 -3300 1400
Wire Wire Line
	-3650 1500 -3300 1500
Wire Wire Line
	-3650 1600 -3300 1600
Wire Wire Line
	-3650 1700 -3300 1700
Wire Wire Line
	-3650 1800 -3300 1800
Wire Wire Line
	-3650 1900 -3300 1900
Wire Wire Line
	-3650 2000 -3300 2000
Text Label -3300 1400 2    50   ~ 0
IR0
Text Label -3300 1500 2    50   ~ 0
IR1
Text Label -3300 1600 2    50   ~ 0
IR2
Text Label -3300 1700 2    50   ~ 0
IR3
Text Label -3300 1800 2    50   ~ 0
IR4
Text Label -3300 1900 2    50   ~ 0
IR5
Text Label -3300 2000 2    50   ~ 0
IR6
Entry Wire Line
	-3300 2000 -3200 1900
Entry Wire Line
	-3300 1900 -3200 1800
Entry Wire Line
	-3300 1800 -3200 1700
Entry Wire Line
	-3300 1700 -3200 1600
Entry Wire Line
	-3300 1600 -3200 1500
Entry Wire Line
	-3300 1500 -3200 1400
Entry Wire Line
	-3300 1400 -3200 1300
Entry Bus Bus
	-3200 1250 -3100 1150
Wire Bus Line
	-3100 1150 -2800 1150
Text Label -2800 1150 2    50   ~ 0
IR[0..6]
Text Label -3050 2400 2    50   ~ 0
~FLAGWE
Text Label -3050 2200 2    50   ~ 0
FL
Text Label -3050 2300 2    50   ~ 0
FV
Text Notes -3000 2200 0    50   ~ 0
← ALU
Text Notes -3000 1400 0    50   ~ 0
→ BUS.MBU
Text Notes -3000 2400 0    50   ~ 0
→ ALU
Wire Wire Line
	-3650 5300 -3050 5300
Wire Wire Line
	-12250 3650 -11650 3650
Text Label -12250 3650 0    50   ~ 0
CLK1
Wire Bus Line
	-7800 2050 -7200 2050
$Sheet
S -8950 1900 1150 750 
U 5F63066B
F0 "Instruction Register (IR)" 50
F1 "cfg_reg_ir.sch" 50
F2 "IBUS[0..15]" T L -8950 2250 50 
F3 "IR[0..15]" B R -7800 2050 50 
F4 "~FPIRL" I R -7800 2250 50 
F5 "~FPIRH" I R -7800 2350 50 
F6 "FPD[0..7]" T R -7800 2450 50 
F7 "CLK4" I L -8950 2050 50 
F8 "~WRITE-IR" I L -8950 2150 50 
$EndSheet
Wire Wire Line
	-8950 2050 -9550 2050
Text Label -9550 2050 0    50   ~ 0
CLK4
Wire Wire Line
	-7800 3250 -7200 3250
Wire Wire Line
	-7800 3350 -7200 3350
Text Label -7200 3250 2    50   ~ 0
IDX0
Text Label -7200 3350 2    50   ~ 0
IDX1
Wire Bus Line
	-9550 3500 -8950 3500
Text Label -9550 3500 0    50   ~ 0
IR[0..11]
$Sheet
S -11650 6000 1150 1300
U 5D69F3FD
F0 "Flag Unit" 50
F1 "flag_unit.sch" 50
F2 "FPD[0..7]" T R -10500 7150 50 
F3 "IBUS[8..15]" T L -11650 6450 50 
F4 "~FPFLAGS" I L -11650 7150 50 
F5 "WADDR[0..4]" I L -11650 6250 50 
F6 "RADDR[0..4]" I L -11650 6350 50 
F7 "FI" I L -11650 6600 50 
F8 "FV" I L -11650 6700 50 
F9 "FL" I L -11650 6800 50 
F10 "FZ" I L -11650 6900 50 
F11 "FN" I L -11650 7000 50 
F12 "~FLAGWE" O R -10500 6250 50 
F13 "CLK4" I L -11650 6150 50 
F14 "~READ-AGL" O R -10500 6650 50 
F15 "~WRITE-IR" O R -10500 6750 50 
$EndSheet
Wire Bus Line
	-11650 6250 -12250 6250
Text Label -12250 6250 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	-11650 6350 -12250 6350
Text Label -12250 6350 0    50   ~ 0
RADDR[4..0]
Wire Wire Line
	-11650 6150 -12250 6150
Text Label -12250 6150 0    50   ~ 0
CLK4
Text Notes -3000 1500 0    50   ~ 0
→ BUS.MBU
Text Notes -3000 1600 0    50   ~ 0
→ BUS.MBU
Text Notes -3000 1700 0    50   ~ 0
→ BUS.MBU
Text Notes -3000 1800 0    50   ~ 0
→ BUS.MBU
Text Notes -3000 1900 0    50   ~ 0
→ BUS.MBU
Text Notes -3000 2300 0    50   ~ 0
← ALU
Wire Wire Line
	-3650 5000 -3050 5000
Wire Wire Line
	-3650 5100 -3050 5100
Wire Wire Line
	-3650 5200 -3050 5200
Wire Wire Line
	-3650 4600 -3050 4600
Wire Wire Line
	-3650 4700 -3050 4700
Wire Wire Line
	-3650 4800 -3050 4800
Wire Wire Line
	-3650 4900 -3050 4900
Wire Wire Line
	-3650 4500 -3050 4500
Text Label -3050 4500 2    50   ~ 0
COND0
Text Label -3050 4600 2    50   ~ 0
COND1
Text Label -3050 4700 2    50   ~ 0
COND2
Text Label -3050 4800 2    50   ~ 0
COND3
Text Label -3050 4900 2    50   ~ 0
COND4
Text Label -3050 5000 2    50   ~ 0
CEXT8
Text Label -3050 5100 2    50   ~ 0
CEXT9
Wire Wire Line
	-10500 6250 -9900 6250
Text Label -9900 6250 2    50   ~ 0
~FLAGWE
Wire Wire Line
	-11650 6600 -12250 6600
Wire Wire Line
	-11650 6700 -12250 6700
Wire Wire Line
	-11650 6800 -12250 6800
Wire Wire Line
	-11650 6900 -12250 6900
Wire Wire Line
	-11650 7000 -12250 7000
Wire Wire Line
	-11650 7150 -12250 7150
Text Label -12250 7150 0    50   ~ 0
~FPFLAGS
Text Label -12250 6600 0    50   ~ 0
FI
Text Label -12250 6700 0    50   ~ 0
FV
Text Label -12250 6800 0    50   ~ 0
FL
Text Label -12250 6900 0    50   ~ 0
FZ
Text Label -12250 7000 0    50   ~ 0
FN
Text Label -3050 2500 2    50   ~ 0
FZ
Text Label -3050 2600 2    50   ~ 0
FN
Text Notes -3000 2500 0    50   ~ 0
← REG
Text Notes -3000 2600 0    50   ~ 0
← REG
Text Label -3050 2700 2    50   ~ 0
PC10
Text Label -3050 2800 2    50   ~ 0
PC11
Text Label -3050 2900 2    50   ~ 0
PC12
Text Label -3050 3000 2    50   ~ 0
PC13
Text Label -3050 3100 2    50   ~ 0
PC14
Text Label -3050 3200 2    50   ~ 0
PC15
Text Notes -3000 2700 0    50   ~ 0
← REG
Text Notes -3000 2800 0    50   ~ 0
← REG
Text Notes -3000 2900 0    50   ~ 0
← REG
Text Notes -3000 3000 0    50   ~ 0
← REG
Text Notes -3000 3100 0    50   ~ 0
← REG
Text Notes -3000 3200 0    50   ~ 0
← REG
Wire Wire Line
	-10500 2200 -10050 2200
Wire Wire Line
	-3650 3300 -3050 3300
Text Label -3050 3300 2    50   ~ 0
~FPRESET
Wire Wire Line
	-3650 3400 -3050 3400
Text Label -3050 3400 2    50   ~ 0
FPCLK
Wire Wire Line
	-3650 3500 -3050 3500
Text Label -3050 3500 2    50   ~ 0
~FPCLK~⁄CLK
Wire Wire Line
	-3650 4400 -3050 4400
Text Label -3050 4400 2    50   ~ 0
POWEROK
Wire Bus Line
	-10500 3450 -9900 3450
Wire Bus Line
	-10500 3750 -9900 3750
Wire Bus Line
	-10500 3650 -9900 3650
Wire Bus Line
	-10500 3550 -9900 3550
Wire Wire Line
	-3650 3600 -3050 3600
Text Label -3050 3600 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes -3000 3300 0    50   ~ 0
← DFP
Text Notes -3000 3400 0    50   ~ 0
← DFP
Text Notes -3000 3500 0    50   ~ 0
← DFP
Text Notes -3000 4400 0    50   ~ 0
← PSU (backplane)
Text Notes -3000 3600 0    50   ~ 0
→ DFP
Wire Wire Line
	-10500 4250 -9900 4250
Wire Wire Line
	-9550 3250 -8950 3250
Wire Wire Line
	-10500 2300 -10050 2300
Wire Wire Line
	-10500 2400 -10050 2400
Wire Wire Line
	-10500 2500 -10050 2500
Wire Wire Line
	-10500 2650 -10050 2650
Text Label -12250 3450 0    50   ~ 0
~RESET
Wire Wire Line
	-12250 2050 -11650 2050
Wire Wire Line
	-12250 3450 -11650 3450
Text Notes -12350 800  0    100  ~ 20
The Control Unit Board
Text Notes -12350 1600 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Notes -3000 4500 0    50   ~ 0
Future expansion
Text Label -3050 4000 2    50   ~ 0
~FPµC2
Text Label -3050 3900 2    50   ~ 0
~FPµC1
Text Label -3050 3800 2    50   ~ 0
~FPµC0
Text Label -3050 3700 2    50   ~ 0
~FPµA0
Text Notes -3000 3700 0    50   ~ 0
← DFP
Text Notes -3000 3800 0    50   ~ 0
← DFP
Text Notes -3000 3900 0    50   ~ 0
← DFP
Text Notes -3000 4000 0    50   ~ 0
← DFP
Text Label -3050 4100 2    50   ~ 0
~FPIRL
Text Label -3050 4200 2    50   ~ 0
~FPIRH
Text Notes -3000 4100 0    50   ~ 0
← DFP
Text Notes -3000 4200 0    50   ~ 0
← DFP
Wire Wire Line
	-10500 6650 -9900 6650
Text Label -9900 6650 2    50   ~ 0
~READ-AGL
Wire Wire Line
	-8950 3150 -9550 3150
Text Label -9550 3150 0    50   ~ 0
~READ-AGL
Text Label -9550 2150 0    50   ~ 0
~WRITE-IR
Wire Wire Line
	-8950 2150 -9550 2150
Wire Wire Line
	-10500 6750 -9900 6750
Text Label -9900 6750 2    50   ~ 0
~WRITE-IR
Text Label -12250 2050 0    50   ~ 0
~RESET
Text Label -3050 2100 2    50   ~ 0
~WEN
Text Notes -3000 2100 0    50   ~ 0
→ BUS
Text Notes -3000 4300 0    50   ~ 0
← DFP
Text Label -3050 4300 2    50   ~ 0
~FPFLAGS
Wire Wire Line
	-10500 2750 -10050 2750
Text Label -10050 2750 2    50   ~ 0
WSTB
Text Notes -3000 2000 0    50   ~ 0
→ BUS.MBU
Text Notes -2950 5200 0    50   ~ 0
→ BUS.MBU
Text Label -3050 5200 2    50   ~ 0
~IR-IDX
Wire Wire Line
	-6900 5550 -6300 5550
Wire Wire Line
	-6900 5650 -6300 5650
$Comp
L power:GND #PWR0108
U 1 1 6C5C85C4
P -6400 6150
AR Path="/6C5C85C4" Ref="#PWR0108"  Part="1" 
AR Path="/5CBF1647/6C5C85C4" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/6C5C85C4" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/6C5C85C4" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C5C85C4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H -6400 5900 50  0001 C CNN
F 1 "GND" H -6395 5977 50  0000 C CNN
F 2 "" H -6400 6150 50  0001 C CNN
F 3 "" H -6400 6150 50  0001 C CNN
	1    -6400 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C5C85BE
P -6400 6050
AR Path="/5CC0D65F/6C5C85BE" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/6C5C85BE" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C5C85BE" Ref="C?"  Part="1" 
AR Path="/6C5C85BE" Ref="C101"  Part="1" 
F 0 "C101" H -6491 6096 50  0000 R CNN
F 1 "100nF" H -6491 6005 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -6400 6050 50  0001 C CNN
F 3 "~" H -6400 6050 50  0001 C CNN
	1    -6400 6050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 6C5C85B8
P -6400 5950
AR Path="/6C5C85B8" Ref="#PWR0106"  Part="1" 
AR Path="/5CC0D65F/6C5C85B8" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/6C5C85B8" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C5C85B8" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H -6400 5800 50  0001 C CNN
F 1 "+5V" H -6385 6123 50  0000 C CNN
F 2 "" H -6400 5950 50  0001 C CNN
F 3 "" H -6400 5950 50  0001 C CNN
	1    -6400 5950
	1    0    0    -1  
$EndComp
Connection ~ -6400 5950
Connection ~ -6400 6150
$Comp
L alexios:74LVC1G32 U104
U 2 1 6C5AEB2D
P -6000 5800
F 0 "U104" H -5870 5596 50  0000 L CNN
F 1 "74LVC1G32" H -5870 5505 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -5890 5780 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -5890 5780 50  0001 C CNN
	2    -6000 5800
	1    0    0    -1  
$EndComp
Text Label -5500 5600 2    50   ~ 0
~IR-IDX
Wire Wire Line
	-5800 5600 -5500 5600
Text Label -6750 5550 0    50   ~ 0
~IDXEN
Text Label -6750 5650 0    50   ~ 0
~ACTION-IDX
$Comp
L alexios:74LVC1G32 U104
U 1 1 6C570E28
P -6100 5600
F 0 "U104" H -6050 5867 50  0000 C CNN
F 1 "74LVC1G32" H -6050 5776 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -5990 5580 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -5990 5580 50  0001 C CNN
	1    -6100 5600
	1    0    0    -1  
$EndComp
Text Label -7200 3550 2    50   ~ 0
~IDXEN
$Sheet
S -8950 3000 1150 750 
U 5F3EA987
F0 "Addressing Modes" 50
F1 "cft_agl.sch" 50
F2 "IBUS[0..15]" T R -7800 3150 50 
F3 "IR[0..11]" I L -8950 3500 50 
F4 "PC[10..15]" I L -8950 3600 50 
F5 "~END" I L -8950 3250 50 
F6 "IDX0" O R -7800 3250 50 
F7 "IDX1" O R -7800 3350 50 
F8 "~READ-AGL" I L -8950 3150 50 
F9 "~IDXEN" O R -7800 3550 50 
$EndSheet
Wire Wire Line
	-7800 3550 -6900 3550
Wire Wire Line
	-11650 3950 -12250 3950
Wire Wire Line
	-12250 4050 -11650 4050
Wire Wire Line
	-12250 4150 -11650 4150
Wire Wire Line
	-11650 3850 -12250 3850
Text Label -12250 3750 0    50   ~ 0
CLK2
Wire Wire Line
	-6900 6350 -6900 5650
Wire Wire Line
	-7800 6350 -6900 6350
Text Label -7200 6350 2    50   ~ 0
~ACTION-IDX
Text Label -9550 6150 0    50   ~ 0
~RESET
$Sheet
S -8950 6050 1150 1050
U 5F67D4B5
F0 "Interrupt State Machine" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L -8950 7000 50 
F3 "~RESET" I L -8950 6150 50 
F4 "FI" O R -7800 6150 50 
F5 "~IRQS" O R -7800 6900 50 
F6 "~END" I L -8950 6850 50 
F7 "CLK4" I L -8950 6250 50 
F8 "~IRQSµC" O R -7800 7000 50 
F9 "IBUS15" I L -8950 6650 50 
F10 "~FLAGWE" I L -8950 6750 50 
F11 "ACTION[0..3]" I L -8950 6450 50 
F12 "~ACTION-IDX" O R -7800 6350 50 
$EndSheet
Wire Wire Line
	-8950 6850 -9550 6850
Text Label -7200 7000 2    50   ~ 0
~IRQSµC
Text Label -7200 6900 2    50   ~ 0
~IRQS
Wire Wire Line
	-7800 7000 -7200 7000
Wire Wire Line
	-7800 6900 -7200 6900
Text Label -7200 6150 2    50   ~ 0
FI
Wire Wire Line
	-7800 6150 -7200 6150
Text Label -9550 6450 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	-8950 6450 -9550 6450
Text Label -9550 7000 0    50   ~ 0
~IRQ
Text Label -9550 6850 0    50   ~ 0
~END
Text Label -9550 6750 0    50   ~ 0
~FLAGWE
Text Label -9550 6650 0    50   ~ 0
IBUS15
Text Label -9550 6250 0    50   ~ 0
CLK4
Wire Wire Line
	-8950 7000 -9550 7000
Wire Wire Line
	-8950 6750 -9550 6750
Wire Wire Line
	-8950 6650 -9550 6650
Wire Wire Line
	-8950 6250 -9550 6250
Wire Wire Line
	-8950 6150 -9550 6150
$Comp
L Connector:TestPoint TP101
U 1 1 5E9C8A8F
P -9600 5550
F 0 "TP101" V -9497 5622 50  0000 C CNN
F 1 "TestPoint" V -9496 5622 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -9400 5550 50  0001 C CNN
F 3 "~" H -9400 5550 50  0001 C CNN
	1    -9600 5550
	0    -1   -1   0   
$EndComp
Wire Bus Line
	-8950 4450 -9550 4450
Text Label -9550 5550 0    50   ~ 0
CEXT10
Text Label -9550 5450 0    50   ~ 0
CEXT9
Text Label -9550 5350 0    50   ~ 0
CEXT8
Wire Wire Line
	-8950 5550 -9600 5550
Wire Wire Line
	-8950 5450 -9550 5450
Wire Wire Line
	-8950 5350 -9550 5350
Text Label -9550 5250 0    50   ~ 0
~SKIPEXT
Wire Wire Line
	-8950 5250 -9550 5250
Text Label -9550 4550 0    50   ~ 0
IR[0..6]
Text Label -9550 4450 0    50   ~ 0
COND[0..4]
Text Label -9550 5050 0    50   ~ 0
FN
Text Label -9550 4950 0    50   ~ 0
FZ
Text Label -9550 4850 0    50   ~ 0
FL
Text Label -9550 4750 0    50   ~ 0
FV
Wire Wire Line
	-8950 5050 -9550 5050
Wire Wire Line
	-8950 4950 -9550 4950
Wire Wire Line
	-8950 4850 -9550 4850
Wire Wire Line
	-8950 4750 -9550 4750
Wire Bus Line
	-9550 4550 -8950 4550
Wire Wire Line
	-8950 4350 -9550 4350
Text Label -9550 4350 0    50   ~ 0
CLK4
Wire Wire Line
	-8950 4250 -9550 4250
Text Label -9550 4250 0    50   ~ 0
~RESET
$Sheet
S -8950 4100 1150 1600
U 5EFCF155
F0 "Skip/Branch Unit" 50
F1 "cft_sbu.sch" 50
F2 "~COND" O R -7800 4250 50 
F3 "FN" I L -8950 5050 50 
F4 "~SKIPEXT" T L -8950 5250 50 
F5 "FV" I L -8950 4750 50 
F6 "FL" I L -8950 4850 50 
F7 "FZ" I L -8950 4950 50 
F8 "CLK4" I L -8950 4350 50 
F9 "COND[0..4]" I L -8950 4450 50 
F10 "~RESET" I L -8950 4250 50 
F11 "IR[0..6]" I L -8950 4550 50 
F12 "CEXT8" T L -8950 5350 50 
F13 "CEXT9" T L -8950 5450 50 
F14 "CEXT10" T L -8950 5550 50 
$EndSheet
Wire Wire Line
	-4800 3900 -5350 3900
Text Label -5350 3900 0    50   ~ 0
~WAITING
$Sheet
S -11650 3300 1150 2450
U 5DEAC282
F0 "Microprogram Sequencer" 50
F1 "cft_microcode.sch" 50
F2 "~ENDEXT" I L -11650 4050 50 
F3 "~RSTHOLD" I L -11650 3550 50 
F4 "~WS" I L -11650 4150 50 
F5 "~HALT" I L -11650 3950 50 
F6 "CLK4" I L -11650 3850 50 
F7 "~RESET" I L -11650 3450 50 
F8 "RADDR[0..4]" O R -10500 3450 50 
F9 "WADDR[0..4]" O R -10500 3550 50 
F10 "COND[0..4]" O R -10500 3650 50 
F11 "ACTION[0..3]" O R -10500 3750 50 
F12 "~MEM" O R -10500 3850 50 
F13 "~IO" O R -10500 3950 50 
F14 "~R" O R -10500 4050 50 
F15 "~WEN" O R -10500 4150 50 
F16 "~END" O R -10500 4250 50 
F17 "~IRQSµC" I L -11650 5450 50 
F18 "~COND" I L -11650 4450 50 
F19 "FPD[0..7]" T R -10500 5450 50 
F20 "~FPµA0" I R -10500 5050 50 
F21 "~FPµC0" I R -10500 5150 50 
F22 "~FPµC1" I R -10500 5250 50 
F23 "~FPµC2" I R -10500 5350 50 
F24 "FPFETCH" O R -10500 4950 50 
F25 "IDX0" I L -11650 4250 50 
F26 "IDX1" I L -11650 4350 50 
F27 "IR7" I L -11650 4550 50 
F28 "IR8" I L -11650 4650 50 
F29 "IR9" I L -11650 4750 50 
F30 "IR10" I L -11650 4850 50 
F31 "IR11" I L -11650 4950 50 
F32 "IR12" I L -11650 5050 50 
F33 "IR13" I L -11650 5150 50 
F34 "IR14" I L -11650 5250 50 
F35 "IR15" I L -11650 5350 50 
F36 "CLK1" I L -11650 3650 50 
F37 "CLK2" I L -11650 3750 50 
F38 "~µPC-INH" I L -11650 5550 50 
$EndSheet
Wire Wire Line
	-11650 4250 -12250 4250
Wire Wire Line
	-11650 4350 -12250 4350
Wire Wire Line
	-11650 4550 -12250 4550
Wire Wire Line
	-11650 4650 -12250 4650
Wire Wire Line
	-11650 4750 -12250 4750
Wire Wire Line
	-11650 4850 -12250 4850
Wire Wire Line
	-11650 4950 -12250 4950
Wire Wire Line
	-11650 5050 -12250 5050
Wire Wire Line
	-11650 5150 -12250 5150
Wire Wire Line
	-11650 5250 -12250 5250
Wire Wire Line
	-11650 5350 -12250 5350
Wire Wire Line
	-11650 4450 -12250 4450
Text Label -12350 5150 1    50   ~ 0
IR[0..15]
Entry Wire Line
	-12350 5450 -12250 5350
Entry Wire Line
	-12350 4650 -12250 4550
Entry Wire Line
	-12350 4750 -12250 4650
Entry Wire Line
	-12350 4850 -12250 4750
Entry Wire Line
	-12350 4950 -12250 4850
Entry Wire Line
	-12350 5050 -12250 4950
Entry Wire Line
	-12350 5150 -12250 5050
Entry Wire Line
	-12350 5250 -12250 5150
Entry Wire Line
	-12350 5350 -12250 5250
Text Label -12150 5450 0    50   ~ 0
~IRQSµC
Text Label -12250 5350 0    50   ~ 0
IR15
Text Label -12250 5250 0    50   ~ 0
IR14
Text Label -12250 5150 0    50   ~ 0
IR13
Text Label -12250 5050 0    50   ~ 0
IR12
Text Label -12250 4950 0    50   ~ 0
IR11
Text Label -12250 4850 0    50   ~ 0
IR10
Text Label -12250 4750 0    50   ~ 0
IR9
Text Label -12250 4650 0    50   ~ 0
IR8
Text Label -12250 4550 0    50   ~ 0
IR7
Wire Wire Line
	-11650 5450 -12150 5450
Text Label -12250 4350 0    50   ~ 0
IDX1
Text Label -12250 4250 0    50   ~ 0
IDX0
Text Label -12250 4450 0    50   ~ 0
~COND
Wire Wire Line
	-11650 5550 -12150 5550
Text Label -12150 5550 0    50   ~ 0
~µPC-INH
$Sheet
S -4800 1250 1150 4200
U 5DD5525C
F0 "sheet5DD55211" 50
F1 "./bus.sch" 50
F2 "FPD[0..7]" U L -4800 2400 50 
F3 "IBUS[0..15]" U L -4800 1400 50 
F4 "~RESET" U L -4800 1500 50 
F5 "CLK1" U L -4800 1600 50 
F6 "CLK2" U L -4800 1700 50 
F7 "CLK3" U L -4800 1800 50 
F8 "CLK4" U L -4800 1900 50 
F9 "WSTB" U L -4800 2200 50 
F10 "T34" U L -4800 2300 50 
F11 "~IRQ" U L -4800 2500 50 
F12 "~IRQS" U L -4800 2600 50 
F13 "~RSTHOLD" U L -4800 2800 50 
F14 "~SYSDEV" U L -4800 2900 50 
F15 "~IODEV1xx" U L -4800 3000 50 
F16 "~IODEV2xx" U L -4800 3100 50 
F17 "~IODEV3xx" U L -4800 3200 50 
F18 "~MEM" U L -4800 3300 50 
F19 "~IO" U L -4800 3400 50 
F20 "~R" U L -4800 3500 50 
F21 "~WS" U L -4800 3800 50 
F22 "~ENDEXT" U L -4800 4000 50 
F23 "~SKIPEXT" U L -4800 4100 50 
F24 "~HALT" U L -4800 4200 50 
F25 "ACTION[0..3]" U L -4800 4300 50 
F26 "WADDR[0..4]" U L -4800 4400 50 
F27 "RADDR[0..4]" U L -4800 4500 50 
F28 "RSVD[1..4]" U L -4800 4600 50 
F29 "C1" U R -3650 1400 50 
F30 "C2" U R -3650 1500 50 
F31 "C3" U R -3650 1600 50 
F32 "C4" U R -3650 1700 50 
F33 "C5" U R -3650 1800 50 
F34 "C6" U R -3650 1900 50 
F35 "C7" U R -3650 2000 50 
F36 "C8" U R -3650 2100 50 
F37 "C9" U R -3650 2200 50 
F38 "C10" U R -3650 2300 50 
F39 "C11" U R -3650 2400 50 
F40 "C12" U R -3650 2500 50 
F41 "C13" U R -3650 2600 50 
F42 "C14" U R -3650 2700 50 
F43 "C15" U R -3650 2800 50 
F44 "C16" U R -3650 2900 50 
F45 "C17" U R -3650 3000 50 
F46 "C18" U R -3650 3100 50 
F47 "C19" U R -3650 3200 50 
F48 "C20" U R -3650 3300 50 
F49 "C21" U R -3650 3400 50 
F50 "C22" U R -3650 3500 50 
F51 "C23" U R -3650 3600 50 
F52 "C24" U R -3650 3700 50 
F53 "C25" U R -3650 3800 50 
F54 "C26" U R -3650 3900 50 
F55 "C27" U R -3650 4000 50 
F56 "C28" U R -3650 4100 50 
F57 "C29" U R -3650 4200 50 
F58 "C30" U R -3650 4300 50 
F59 "C31" U R -3650 4400 50 
F60 "C32" U R -3650 4500 50 
F61 "C33" U R -3650 4600 50 
F62 "C34" U R -3650 4700 50 
F63 "C35" U R -3650 4800 50 
F64 "C36" U R -3650 4900 50 
F65 "C37" U R -3650 5000 50 
F66 "C38" U R -3650 5100 50 
F67 "C39" U R -3650 5200 50 
F68 "C40" U R -3650 5300 50 
F69 "~WAITING" O L -4800 3900 50 
$EndSheet
Wire Wire Line
	-6900 3550 -6900 5550
Wire Wire Line
	-7800 4250 -7200 4250
Text Label -7200 4250 2    50   ~ 0
~COND
Wire Wire Line
	-6000 4900 -5500 4900
Text Label -5500 4900 2    50   ~ 0
~µPC-INH
$Comp
L alexios:Jumper_3_Bridged12 JP103
U 1 1 6091E201
P -6150 4900
F 0 "JP103" V -6150 4967 50  0000 L CNN
F 1 "Jumper_3_Bridged12" H -6150 5010 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H -6150 4900 50  0001 C CNN
F 3 "~" H -6150 4900 50  0001 C CNN
	1    -6150 4900
	0    -1   1    0   
$EndComp
Wire Wire Line
	-6150 4650 -6150 4600
Wire Wire Line
	-6150 4600 -6750 4600
Wire Wire Line
	-6150 5150 -6150 5200
Wire Wire Line
	-6150 5200 -6750 5200
Text Label -6750 4600 0    50   ~ 0
~WAITING
Text Label -6750 5200 0    50   ~ 0
~WS
NoConn ~ -3050 5300
Text Notes -3400 5600 0    50   ~ 0
Pull-downs above are for testing\nCTL board without other boards.
$Comp
L power:GND #PWR0102
U 1 1 60407157
P -2100 4350
F 0 "#PWR0102" H -2100 4100 50  0001 C CNN
F 1 "GND" H -2095 4177 50  0000 C CNN
F 2 "" H -2100 4350 50  0001 C CNN
F 3 "" H -2100 4350 50  0001 C CNN
	1    -2100 4350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-2200 3200 -2100 3200
Wire Wire Line
	-2100 3100 -2100 3200
Connection ~ -2100 3100
Wire Wire Line
	-2200 3100 -2100 3100
Wire Wire Line
	-2100 3000 -2100 3100
Connection ~ -2100 3000
Wire Wire Line
	-2200 3000 -2100 3000
Wire Wire Line
	-2100 2900 -2100 3000
Connection ~ -2100 2900
Wire Wire Line
	-2200 2900 -2100 2900
Wire Wire Line
	-2100 2800 -2100 2900
Connection ~ -2100 2800
Wire Wire Line
	-2200 2800 -2100 2800
Wire Wire Line
	-2100 2700 -2100 2800
Connection ~ -2100 2700
Wire Wire Line
	-2200 2700 -2100 2700
Wire Wire Line
	-2100 2600 -2100 2700
Connection ~ -2100 2600
Wire Wire Line
	-2200 2600 -2100 2600
Wire Wire Line
	-2100 2500 -2100 2600
Connection ~ -2100 2500
Wire Wire Line
	-2200 2500 -2100 2500
Wire Wire Line
	-2100 2300 -2100 2500
Connection ~ -2100 2300
Wire Wire Line
	-2200 2300 -2100 2300
Wire Wire Line
	-2100 2200 -2100 2300
Wire Wire Line
	-2200 2200 -2100 2200
$Comp
L Device:R_Small R110
U 1 1 601C6ACC
P -2300 3200
F 0 "R110" V -2350 3350 50  0000 C CNN
F 1 "4.7kΩ" V -2400 3050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 3200 50  0001 C CNN
F 3 "~" H -2300 3200 50  0001 C CNN
	1    -2300 3200
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R109
U 1 1 601C6AC6
P -2300 3100
F 0 "R109" V -2350 3250 50  0000 C CNN
F 1 "4.7kΩ" V -2400 2950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 3100 50  0001 C CNN
F 3 "~" H -2300 3100 50  0001 C CNN
	1    -2300 3100
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R108
U 1 1 601B696E
P -2300 3000
F 0 "R108" V -2350 3150 50  0000 C CNN
F 1 "4.7kΩ" V -2400 2850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 3000 50  0001 C CNN
F 3 "~" H -2300 3000 50  0001 C CNN
	1    -2300 3000
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R107
U 1 1 601B6968
P -2300 2900
F 0 "R107" V -2350 3050 50  0000 C CNN
F 1 "4.7kΩ" V -2400 2750 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 2900 50  0001 C CNN
F 3 "~" H -2300 2900 50  0001 C CNN
	1    -2300 2900
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R106
U 1 1 601A6784
P -2300 2800
F 0 "R106" V -2350 2950 50  0000 C CNN
F 1 "4.7kΩ" V -2400 2650 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 2800 50  0001 C CNN
F 3 "~" H -2300 2800 50  0001 C CNN
	1    -2300 2800
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R105
U 1 1 601A677E
P -2300 2700
F 0 "R105" V -2350 2850 50  0000 C CNN
F 1 "4.7kΩ" V -2400 2550 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 2700 50  0001 C CNN
F 3 "~" H -2300 2700 50  0001 C CNN
	1    -2300 2700
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R104
U 1 1 60196662
P -2300 2600
F 0 "R104" V -2350 2750 50  0000 C CNN
F 1 "4.7kΩ" V -2400 2450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 2600 50  0001 C CNN
F 3 "~" H -2300 2600 50  0001 C CNN
	1    -2300 2600
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R103
U 1 1 6019665C
P -2300 2500
F 0 "R103" V -2350 2650 50  0000 C CNN
F 1 "4.7kΩ" V -2400 2350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 2500 50  0001 C CNN
F 3 "~" H -2300 2500 50  0001 C CNN
	1    -2300 2500
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R102
U 1 1 60185C13
P -2300 2300
F 0 "R102" V -2350 2450 50  0000 C CNN
F 1 "4.7kΩ" V -2400 2150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 2300 50  0001 C CNN
F 3 "~" H -2300 2300 50  0001 C CNN
	1    -2300 2300
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R101
U 1 1 6018580D
P -2300 2200
F 0 "R101" V -2350 2350 50  0000 C CNN
F 1 "4.7kΩ" V -2400 2050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2300 2200 50  0001 C CNN
F 3 "~" H -2300 2200 50  0001 C CNN
	1    -2300 2200
	0    -1   1    0   
$EndComp
Wire Wire Line
	-3650 2300 -2400 2300
Wire Wire Line
	-3650 2200 -2400 2200
Wire Wire Line
	-3650 2500 -2400 2500
Wire Wire Line
	-3650 2600 -2400 2600
Wire Wire Line
	-3650 2700 -2400 2700
Wire Wire Line
	-3650 2800 -2400 2800
Wire Wire Line
	-3650 2900 -2400 2900
Wire Wire Line
	-3650 3000 -2400 3000
Wire Wire Line
	-3650 3100 -2400 3100
Wire Wire Line
	-3650 3200 -2400 3200
Wire Wire Line
	-3650 2100 -3050 2100
Text Notes -3000 4600 0    50   ~ 0
Future expansion
Text Notes -3000 4700 0    50   ~ 0
Future expansion
Text Notes -3000 4800 0    50   ~ 0
Future expansion
Text Notes -3000 4900 0    50   ~ 0
Future expansion
Text Notes -3000 5000 0    50   ~ 0
Future expansion
Text Notes -3000 5100 0    50   ~ 0
Future expansion
Connection ~ -2100 3200
Wire Wire Line
	-3650 4300 -3050 4300
Wire Wire Line
	-3650 4200 -3050 4200
Wire Wire Line
	-3650 4100 -3050 4100
Wire Wire Line
	-3650 4000 -3050 4000
Wire Wire Line
	-3650 3900 -3050 3900
Wire Wire Line
	-3650 3800 -3050 3800
Wire Wire Line
	-3650 3700 -3050 3700
Wire Wire Line
	-2100 3200 -2100 4350
$Sheet
S 9250 1350 1150 4200
U 5D34E810
F0 "Left Edge Connector" 50
F1 "bus.sch" 50
F2 "FPD[0..7]" U L 9250 2500 50 
F3 "IBUS[0..15]" U L 9250 1500 50 
F4 "~RESET" U L 9250 1600 50 
F5 "CLK1" U L 9250 1700 50 
F6 "CLK2" U L 9250 1800 50 
F7 "CLK3" U L 9250 1900 50 
F8 "CLK4" U L 9250 2000 50 
F9 "WSTB" U L 9250 2300 50 
F10 "T34" U L 9250 2400 50 
F11 "~IRQ" U L 9250 2600 50 
F12 "~IRQS" U L 9250 2700 50 
F13 "~RSTHOLD" U L 9250 2900 50 
F14 "~SYSDEV" U L 9250 3000 50 
F15 "~IODEV1xx" U L 9250 3100 50 
F16 "~IODEV2xx" U L 9250 3200 50 
F17 "~IODEV3xx" U L 9250 3300 50 
F18 "~MEM" U L 9250 3400 50 
F19 "~IO" U L 9250 3500 50 
F20 "~R" U L 9250 3600 50 
F21 "~W" U L 9250 3700 50 
F22 "~WS" U L 9250 3800 50 
F23 "~ENDEXT" U L 9250 3900 50 
F24 "~SKIPEXT" U L 9250 4000 50 
F25 "~HALT" U L 9250 4100 50 
F26 "ACTION[0..3]" U L 9250 4400 50 
F27 "WADDR[0..4]" U L 9250 4500 50 
F28 "RADDR[0..4]" U L 9250 4600 50 
F29 "RSVD[1..4]" U L 9250 4700 50 
F30 "C1" U R 10400 1500 50 
F31 "C2" U R 10400 1600 50 
F32 "C3" U R 10400 1700 50 
F33 "C4" U R 10400 1800 50 
F34 "C5" U R 10400 1900 50 
F35 "C6" U R 10400 2000 50 
F36 "C7" U R 10400 2100 50 
F37 "C8" U R 10400 2200 50 
F38 "C9" U R 10400 2300 50 
F39 "C10" U R 10400 2400 50 
F40 "C11" U R 10400 2500 50 
F41 "C12" U R 10400 2600 50 
F42 "C13" U R 10400 2700 50 
F43 "C14" U R 10400 2800 50 
F44 "C15" U R 10400 2900 50 
F45 "C16" U R 10400 3000 50 
F46 "C17" U R 10400 3100 50 
F47 "C18" U R 10400 3200 50 
F48 "C19" U R 10400 3300 50 
F49 "C20" U R 10400 3400 50 
F50 "C21" U R 10400 3500 50 
F51 "C22" U R 10400 3600 50 
F52 "C23" U R 10400 3700 50 
F53 "C24" U R 10400 3800 50 
F54 "C25" U R 10400 3900 50 
F55 "C26" U R 10400 4000 50 
F56 "C27" U R 10400 4100 50 
F57 "C28" U R 10400 4200 50 
F58 "C29" U R 10400 4300 50 
F59 "C30" U R 10400 4400 50 
F60 "C31" U R 10400 4500 50 
F61 "C32" U R 10400 4600 50 
F62 "C33" U R 10400 4700 50 
F63 "C34" U R 10400 4800 50 
F64 "C35" U R 10400 4900 50 
F65 "C36" U R 10400 5000 50 
F66 "C37" U R 10400 5100 50 
F67 "C38" U R 10400 5200 50 
F68 "C39" U R 10400 5300 50 
F69 "C40" U R 10400 5400 50 
$EndSheet
Wire Bus Line
	9250 2100 8700 2100
Wire Bus Line
	9250 2200 8700 2200
Text Label 8700 2100 0    50   ~ 0
AB[0..23]
Text Label 8700 2200 0    50   ~ 0
DB[0..15]
Wire Bus Line
	8700 2500 9250 2500
Text Label 8700 2500 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	9250 1700 8700 1700
Wire Wire Line
	9250 1800 8700 1800
Wire Wire Line
	9250 1900 8700 1900
Wire Wire Line
	9250 2000 8700 2000
Wire Wire Line
	9250 1600 8700 1600
Wire Wire Line
	9250 2900 8700 2900
Wire Wire Line
	9250 3000 8700 3000
Wire Wire Line
	9250 3100 8700 3100
Wire Wire Line
	9250 2600 8700 2600
Wire Wire Line
	9250 3400 8700 3400
Wire Wire Line
	9250 3500 8700 3500
Wire Wire Line
	9250 3600 8700 3600
Wire Wire Line
	9250 3700 8700 3700
Wire Wire Line
	9250 3300 8700 3300
Wire Wire Line
	9250 3200 8700 3200
Wire Wire Line
	9250 4000 8700 4000
Wire Wire Line
	9250 4100 8700 4100
Wire Wire Line
	9250 3900 8700 3900
Wire Wire Line
	9250 3800 8700 3800
Wire Bus Line
	8700 2800 9250 2800
Text Label 8700 2800 0    50   ~ 0
~IRQ[0..7]
Text Label 8700 2600 0    50   ~ 0
~IRQ
Wire Wire Line
	9250 2300 8700 2300
Wire Wire Line
	9250 2400 8700 2400
Wire Bus Line
	8700 1500 9250 1500
Text Label 8700 1500 0    50   ~ 0
IBUS[0..15]
Text Label 8700 1600 0    50   ~ 0
~RESET
Text Label 8700 1700 0    50   ~ 0
CLK1
Text Label 8700 1800 0    50   ~ 0
CLK2
Text Label 8700 1900 0    50   ~ 0
CLK3
Text Label 8700 2300 0    50   ~ 0
WSTB
Text Label 8700 2400 0    50   ~ 0
T34
Wire Wire Line
	9250 2700 8700 2700
Text Label 8700 2700 0    50   ~ 0
~IRQS
Text Label 8700 2900 0    50   ~ 0
~RSTHOLD
Text Label 8700 3000 0    50   ~ 0
~SYSDEV
Text Label 8700 3100 0    50   ~ 0
~IODEV1xx
Text Label 8700 3200 0    50   ~ 0
~IODEV2xx
Text Label 8700 3300 0    50   ~ 0
~IODEV3xx
Text Label 8700 3400 0    50   ~ 0
~MEM
Text Label 8700 3500 0    50   ~ 0
~IO
Text Label 8700 3600 0    50   ~ 0
~R
Text Label 8700 3800 0    50   ~ 0
~WS
Text Label 8700 3900 0    50   ~ 0
~ENDEXT
Text Label 8700 4000 0    50   ~ 0
~SKIPEXT
Text Label 8700 4100 0    50   ~ 0
~HALT
Text Label 8700 4400 0    50   ~ 0
ACTION[0..3]
Text Label 8700 4500 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	9250 4400 8700 4400
Wire Bus Line
	9250 4500 8700 4500
Wire Bus Line
	9250 4600 8700 4600
Wire Bus Line
	8700 4700 9250 4700
Text Label 8700 4700 0    50   ~ 0
RSVD[1..4]
Text Notes 10000 3350 1    100  ~ 20
Left Slot
Text Label 8700 3700 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5D8B16F5
P 6750 7050
AR Path="/5F67D4B5/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16F5" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 6750 6900 50  0001 C CNN
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
AR Path="/5D8B16FB" Ref="#PWR0122"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0122" H 6750 7200 50  0001 C CNN
F 1 "GND" H 6672 7413 50  0000 R CNN
F 2 "" H 6750 7450 50  0001 C CNN
F 3 "" H 6750 7450 50  0001 C CNN
	1    6750 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 7050 6750 7150
$Comp
L Device:CP_Small C105
U 1 1 5D8B1702
P 6750 7250
AR Path="/5D8B1702" Ref="C105"  Part="1" 
AR Path="/5D34E810/5D8B1702" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8B1702" Ref="C?"  Part="1" 
F 0 "C105" H 6662 7296 50  0000 R CNN
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
AR Path="/5D8C8446" Ref="#PWR0111"  Part="1" 
AR Path="/5D34E810/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8446" Ref="#PWR?"  Part="1" 
F 0 "#PWR0111" H 6300 6900 50  0001 C CNN
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
AR Path="/5D8C844C" Ref="#PWR0121"  Part="1" 
AR Path="/5D34E810/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C844C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0121" H 6300 7200 50  0001 C CNN
F 1 "GND" H 6222 7413 50  0000 R CNN
F 2 "" H 6300 7450 50  0001 C CNN
F 3 "" H 6300 7450 50  0001 C CNN
	1    6300 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 7050 6300 7150
$Comp
L Device:CP_Small C104
U 1 1 5D8C8453
P 6300 7250
AR Path="/5D8C8453" Ref="C104"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C104" H 6212 7296 50  0000 R CNN
F 1 "47µF" H 6212 7205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6300 7250 50  0001 C CNN
F 3 "~" H 6300 7250 50  0001 C CNN
	1    6300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 7350 6300 7450
Text Notes 8900 1050 0    197  ~ 39
Card Edge
$Sheet
S 5900 1350 1150 1000
U 5D9672D4
F0 "Program Counter" 50
F1 "cft-reg-pc.sch" 50
F2 "~FPH" I R 7050 2100 50 
F3 "~FPL" I R 7050 2200 50 
F4 "~READ" I L 5900 1900 50 
F5 "~INC" I L 5900 2100 50 
F6 "~WRITE" I L 5900 2000 50 
F7 "RESET" I L 5900 1500 50 
F8 "IBUS[0..15]" I L 5900 1700 50 
F9 "FPD[0..7]" T R 7050 2000 50 
F10 "PC[10..15]" O R 7050 1500 50 
$EndSheet
Text Notes 5800 950  0    197  ~ 39
Registers
Text Notes 1250 950  0    197  ~ 39
Decoders
$Comp
L alexios:74HC138 U102
U 1 1 5DA3111B
P 2300 2500
F 0 "U102" H 2300 3167 50  0000 C CNN
F 1 "74HC138" H 2300 3076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2300 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2300 2500 50  0001 C CNN
F 4 "Yes" H 2225 1675 50  0001 C CNN "Verified"
	1    2300 2500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U105
U 1 1 5DA3323E
P 2300 5600
F 0 "U105" H 2300 6267 50  0000 C CNN
F 1 "74HC138" H 2300 6176 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2300 5600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2300 5600 50  0001 C CNN
F 4 "Yes" H 2225 4775 50  0001 C CNN "Verified"
	1    2300 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5200 1450 5200
Wire Wire Line
	1800 5300 1450 5300
Wire Wire Line
	1800 5400 1450 5400
Wire Wire Line
	1800 5800 1450 5800
Text Label 1500 5800 0    50   ~ 0
ACTION3
Text Label 1500 5200 0    50   ~ 0
ACTION0
Text Label 1500 5300 0    50   ~ 0
ACTION1
Text Label 1500 5400 0    50   ~ 0
ACTION2
Entry Wire Line
	1350 5100 1450 5200
Entry Wire Line
	1350 5200 1450 5300
Entry Wire Line
	1350 5300 1450 5400
Entry Wire Line
	1350 5700 1450 5800
Text Label 3400 5200 2    50   ~ 0
~ACTION-INCPC
Text Label 3400 5400 2    50   ~ 0
~ACTION-INCDR
Text Label 3400 5600 2    50   ~ 0
~ACTION-INCAC
Text Label 3400 5700 2    50   ~ 0
~ACTION-DECAC
Text Label 3400 5800 2    50   ~ 0
~ACTION-INCSP
Text Label 3400 5900 2    50   ~ 0
~ACTION-DECSP
Wire Wire Line
	2800 5200 3400 5200
Text Notes 2350 2750 1    50   ~ 10
RADDR=010xx
Wire Wire Line
	1800 2700 1450 2700
Wire Wire Line
	1800 2800 1450 2800
Wire Wire Line
	1800 2100 1450 2100
Wire Wire Line
	1800 2200 1450 2200
Wire Wire Line
	1800 2300 1450 2300
Wire Wire Line
	1800 4150 1450 4150
Wire Wire Line
	1800 4250 1450 4250
Wire Wire Line
	1800 3550 1450 3550
Wire Wire Line
	1800 3650 1450 3650
Wire Wire Line
	1800 3750 1450 3750
Text Notes 2350 4250 1    50   ~ 10
WADDR=010xx
Text Label 1500 2100 0    50   ~ 0
RADDR0
Text Label 1500 2200 0    50   ~ 0
RADDR1
Text Label 1500 2300 0    50   ~ 0
RADDR2
Text Label 1500 2700 0    50   ~ 0
RADDR3
Text Label 1500 2800 0    50   ~ 0
RADDR4
Text Label 1500 3550 0    50   ~ 0
WADDR0
Text Label 1500 3650 0    50   ~ 0
WADDR1
Text Label 1500 3750 0    50   ~ 0
WADDR2
Text Label 1500 4250 0    50   ~ 0
WADDR4
Text Label 1500 4150 0    50   ~ 0
WADDR3
Entry Wire Line
	1350 2000 1450 2100
Entry Wire Line
	1350 2100 1450 2200
Entry Wire Line
	1350 2200 1450 2300
Entry Wire Line
	1350 2600 1450 2700
Entry Wire Line
	1350 2700 1450 2800
Entry Wire Line
	1350 3450 1450 3550
Entry Wire Line
	1350 3550 1450 3650
Entry Wire Line
	1350 3650 1450 3750
Entry Wire Line
	1350 4050 1450 4150
Entry Wire Line
	1350 4150 1450 4250
Text Label 3400 3650 2    50   ~ 0
~WRITE-DR
Text Label 3400 3750 2    50   ~ 0
~WRITE-AC
Text Label 3400 3850 2    50   ~ 0
~WRITE-SP
NoConn ~ 2800 2500
NoConn ~ 2800 2600
NoConn ~ 2800 2700
NoConn ~ 2800 2800
NoConn ~ 2800 3950
NoConn ~ 2800 4050
NoConn ~ 2800 4150
NoConn ~ 2800 4250
Text Label 1350 2600 1    50   ~ 0
RADDR[4..0]
Text Label 1350 4050 1    50   ~ 0
WADDR[4..0]
Text Label 1350 5650 1    50   ~ 0
ACTION[3..0]
Text Label 5050 1700 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5900 1700 5050 1700
Text Label 5050 3000 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5900 3000 5050 3000
Text Label 5050 2800 0    50   ~ 0
RESET
Text Label 5050 1900 0    50   ~ 0
~READ-PC
Text Label 5050 2000 0    50   ~ 0
~WRITE-PC
Wire Wire Line
	5900 3200 5050 3200
Wire Wire Line
	5900 3300 5050 3300
Wire Wire Line
	5900 3400 5050 3400
Wire Wire Line
	5900 3500 5050 3500
Text Label 5050 3200 0    50   ~ 0
~READ-DR
Text Label 5050 3300 0    50   ~ 0
~WRITE-DR
Wire Bus Line
	7050 2000 7550 2000
Text Label 7550 2000 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	7050 2100 7550 2100
Wire Wire Line
	7050 2200 7550 2200
Text Label 7550 2100 2    50   ~ 0
~FPPCH
Text Label 7550 2200 2    50   ~ 0
~FPPCL
Wire Bus Line
	7050 3300 7550 3300
Text Label 7550 3300 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	7050 3400 7550 3400
Wire Wire Line
	7050 3500 7550 3500
Text Label 7550 3400 2    50   ~ 0
~FPDRH
Text Label 7550 3500 2    50   ~ 0
~FPDRL
Wire Bus Line
	7050 1500 7550 1500
Text Label 7550 1500 2    50   ~ 0
PC[10..15]
Text Label 10900 3700 2    50   ~ 0
AC0
Text Label 10900 3800 2    50   ~ 0
AC1
Text Label 10900 3900 2    50   ~ 0
AC2
Text Label 10900 4000 2    50   ~ 0
AC3
Text Label 10900 4100 2    50   ~ 0
AC4
Text Label 10900 4200 2    50   ~ 0
AC5
Text Label 10900 4300 2    50   ~ 0
AC6
Text Label 10900 4400 2    50   ~ 0
AC7
Text Label 10900 4500 2    50   ~ 0
AC8
Text Label 10900 4600 2    50   ~ 0
AC9
Text Label 10900 4700 2    50   ~ 0
AC10
Text Label 10900 4800 2    50   ~ 0
AC11
Text Label 10900 4900 2    50   ~ 0
AC12
Text Label 10900 5000 2    50   ~ 0
AC13
Text Label 10900 5100 2    50   ~ 0
AC14
Text Label 10900 5200 2    50   ~ 0
AC15
Text Label 10900 5300 2    50   ~ 0
FZ
Text Label 10900 5400 2    50   ~ 0
~ACCPL
Wire Wire Line
	10400 3700 10900 3700
Wire Wire Line
	10400 3800 10900 3800
Wire Wire Line
	10400 3900 10900 3900
Wire Wire Line
	10400 4000 10900 4000
Wire Wire Line
	10400 4100 10900 4100
Wire Wire Line
	10400 4200 10900 4200
Wire Wire Line
	10400 4300 10900 4300
Wire Wire Line
	10400 4400 10900 4400
Wire Wire Line
	10400 4500 10900 4500
Wire Wire Line
	10400 4600 10900 4600
Wire Wire Line
	10400 4700 10900 4700
Wire Wire Line
	10400 4800 10900 4800
Wire Wire Line
	10400 4900 10900 4900
Wire Wire Line
	10400 5000 10900 5000
Wire Wire Line
	10400 5100 10900 5100
Wire Wire Line
	10400 5200 10900 5200
Wire Wire Line
	10400 5300 10900 5300
Wire Wire Line
	10400 5400 10900 5400
Wire Wire Line
	5900 2100 5050 2100
Wire Wire Line
	5900 2000 5050 2000
Wire Wire Line
	5900 1900 5050 1900
Text Label 5050 1500 0    50   ~ 0
RESET
$Comp
L alexios:74HC138 U102
U 2 1 5DD287C8
P 2600 7300
F 0 "U102" H 2779 7346 50  0000 L CNN
F 1 "74HC138" H 2779 7255 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2600 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2600 7300 50  0001 C CNN
F 4 "Yes" H 2525 6475 50  0001 C CNN "Verified"
	2    2600 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U103
U 2 1 5DD288BF
P 4000 7300
F 0 "U103" H 4179 7346 50  0000 L CNN
F 1 "74HC138" H 4179 7255 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4000 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4000 7300 50  0001 C CNN
F 4 "Yes" H 3925 6475 50  0001 C CNN "Verified"
	2    4000 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U105
U 2 1 5DD28B4B
P 5400 7300
F 0 "U105" H 5579 7346 50  0000 L CNN
F 1 "74HC138" H 5579 7255 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5400 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5400 7300 50  0001 C CNN
F 4 "Yes" H 5325 6475 50  0001 C CNN "Verified"
	2    5400 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD296FB
P 2250 7200
AR Path="/5CE16E65/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5DD296FB" Ref="#PWR0114"  Part="1" 
AR Path="/5D54E677/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD296FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 2250 7050 50  0001 C CNN
F 1 "+5V" H 2265 7373 50  0000 C CNN
F 2 "" H 2250 7200 50  0001 C CNN
F 3 "" H 2250 7200 50  0001 C CNN
	1    2250 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD29701
P 2250 7400
AR Path="/5CE16E65/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5DD29701" Ref="#PWR0118"  Part="1" 
AR Path="/5D54E677/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD29701" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H 2250 7150 50  0001 C CNN
F 1 "GND" H 2255 7227 50  0000 C CNN
F 2 "" H 2250 7400 50  0001 C CNN
F 3 "" H 2250 7400 50  0001 C CNN
	1    2250 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD29707
P 2250 7300
AR Path="/5CC0D65F/5DD29707" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD29707" Ref="C?"  Part="1" 
AR Path="/5DD29707" Ref="C107"  Part="1" 
AR Path="/5D54E677/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD29707" Ref="C?"  Part="1" 
F 0 "C107" H 2159 7346 50  0000 R CNN
F 1 "100nF" H 2159 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 7300 50  0001 C CNN
F 3 "~" H 2250 7300 50  0001 C CNN
	1    2250 7300
	1    0    0    -1  
$EndComp
Connection ~ 2250 7200
Connection ~ 2250 7400
$Comp
L power:+5V #PWR?
U 1 1 5DD3D3CC
P 850 7200
AR Path="/5CE16E65/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D3CC" Ref="#PWR0113"  Part="1" 
AR Path="/5D54E677/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD3D3CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H 850 7050 50  0001 C CNN
F 1 "+5V" H 865 7373 50  0000 C CNN
F 2 "" H 850 7200 50  0001 C CNN
F 3 "" H 850 7200 50  0001 C CNN
	1    850  7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD3D3D2
P 850 7400
AR Path="/5CE16E65/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D3D2" Ref="#PWR0117"  Part="1" 
AR Path="/5D54E677/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD3D3D2" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H 850 7150 50  0001 C CNN
F 1 "GND" H 855 7227 50  0000 C CNN
F 2 "" H 850 7400 50  0001 C CNN
F 3 "" H 850 7400 50  0001 C CNN
	1    850  7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD3D3D8
P 850 7300
AR Path="/5CC0D65F/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5DD3D3D8" Ref="C106"  Part="1" 
AR Path="/5D54E677/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD3D3D8" Ref="C?"  Part="1" 
F 0 "C106" H 759 7346 50  0000 R CNN
F 1 "100nF" H 759 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 850 7300 50  0001 C CNN
F 3 "~" H 850 7300 50  0001 C CNN
	1    850  7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD47236
P 3650 7200
AR Path="/5CE16E65/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5DD47236" Ref="#PWR0115"  Part="1" 
AR Path="/5D54E677/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD47236" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 3650 7050 50  0001 C CNN
F 1 "+5V" H 3665 7373 50  0000 C CNN
F 2 "" H 3650 7200 50  0001 C CNN
F 3 "" H 3650 7200 50  0001 C CNN
	1    3650 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD4723C
P 3650 7400
AR Path="/5CE16E65/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5DD4723C" Ref="#PWR0119"  Part="1" 
AR Path="/5D54E677/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD4723C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0119" H 3650 7150 50  0001 C CNN
F 1 "GND" H 3655 7227 50  0000 C CNN
F 2 "" H 3650 7400 50  0001 C CNN
F 3 "" H 3650 7400 50  0001 C CNN
	1    3650 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD47242
P 3650 7300
AR Path="/5CC0D65F/5DD47242" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD47242" Ref="C?"  Part="1" 
AR Path="/5DD47242" Ref="C108"  Part="1" 
AR Path="/5D54E677/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD47242" Ref="C?"  Part="1" 
F 0 "C108" H 3559 7346 50  0000 R CNN
F 1 "100nF" H 3559 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 7300 50  0001 C CNN
F 3 "~" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD51026
P 5050 7200
AR Path="/5CE16E65/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5DD51026" Ref="#PWR0116"  Part="1" 
AR Path="/5D54E677/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD51026" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H 5050 7050 50  0001 C CNN
F 1 "+5V" H 5065 7373 50  0000 C CNN
F 2 "" H 5050 7200 50  0001 C CNN
F 3 "" H 5050 7200 50  0001 C CNN
	1    5050 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD5102C
P 5050 7400
AR Path="/5CE16E65/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5DD5102C" Ref="#PWR0120"  Part="1" 
AR Path="/5D54E677/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD5102C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0120" H 5050 7150 50  0001 C CNN
F 1 "GND" H 5055 7227 50  0000 C CNN
F 2 "" H 5050 7400 50  0001 C CNN
F 3 "" H 5050 7400 50  0001 C CNN
	1    5050 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD51032
P 5050 7300
AR Path="/5CC0D65F/5DD51032" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD51032" Ref="C?"  Part="1" 
AR Path="/5DD51032" Ref="C109"  Part="1" 
AR Path="/5D54E677/5DD51032" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD51032" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD51032" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD51032" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD51032" Ref="C?"  Part="1" 
F 0 "C109" H 4959 7346 50  0000 R CNN
F 1 "100nF" H 4959 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5050 7300 50  0001 C CNN
F 3 "~" H 5050 7300 50  0001 C CNN
	1    5050 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U101
U 2 1 5DD5B011
P 1200 7300
F 0 "U101" H 1380 7346 50  0000 L CNN
F 1 "74LVC1G04" H 1380 7255 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1200 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 1200 7300 50  0001 C CNN
	2    1200 7300
	1    0    0    -1  
$EndComp
Connection ~ 850  7400
Connection ~ 850  7200
Connection ~ 3650 7200
Connection ~ 3650 7400
Connection ~ 5050 7200
Connection ~ 5050 7400
NoConn ~ 8700 1650
NoConn ~ 8700 2050
NoConn ~ 8700 2150
NoConn ~ 8700 2250
NoConn ~ 8700 2350
NoConn ~ 8700 2550
NoConn ~ 8700 2650
NoConn ~ 8700 2750
NoConn ~ 8700 2850
NoConn ~ 8700 2950
NoConn ~ 8700 3050
NoConn ~ 8700 3150
NoConn ~ 8700 3250
NoConn ~ 8700 3350
NoConn ~ 8700 3450
NoConn ~ 8700 3550
NoConn ~ 8700 3650
NoConn ~ 8700 3750
NoConn ~ 8700 3850
NoConn ~ 8700 3950
NoConn ~ 8700 4050
NoConn ~ 8700 4650
$Sheet
S 5900 3950 1150 1000
U 5D9746C5
F0 "Accumulator" 50
F1 "cft-reg-ac.sch" 50
F2 "~FPH" I R 7050 4700 50 
F3 "~FPL" I R 7050 4800 50 
F4 "~READ" I L 5900 4500 50 
F5 "~INC" I L 5900 4700 50 
F6 "~WRITE" I L 5900 4600 50 
F7 "RESET" I L 5900 4100 50 
F8 "IBUS[0..15]" I L 5900 4300 50 
F9 "~DEC" I L 5900 4800 50 
F10 "FPD[0..7]" T R 7050 4600 50 
F11 "FZ" O R 7050 4300 50 
F12 "~REGCPL" O R 7050 4400 50 
F13 "AC[0..15]" O R 7050 4100 50 
$EndSheet
Text Label 5050 4300 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5900 4300 5050 4300
Text Label 5050 5600 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5900 5600 5050 5600
Text Label 5050 5400 0    50   ~ 0
RESET
Wire Wire Line
	5900 5800 5050 5800
Wire Wire Line
	5900 5900 5050 5900
Wire Wire Line
	5900 6100 5050 6100
Wire Bus Line
	7050 4600 7550 4600
Text Label 7550 4600 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	7050 4700 7550 4700
Wire Wire Line
	7050 4800 7550 4800
Text Label 7550 4700 2    50   ~ 0
~FPACH
Text Label 7550 4800 2    50   ~ 0
~FPACL
Wire Bus Line
	7050 5900 7550 5900
Text Label 7550 5900 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	7050 6000 7550 6000
Wire Wire Line
	7050 6100 7550 6100
Text Label 7550 6000 2    50   ~ 0
~FPSPH
Text Label 7550 6100 2    50   ~ 0
~FPSPL
Wire Bus Line
	7050 4100 7550 4100
Text Label 7550 4100 2    50   ~ 0
AC[0..15]
Wire Wire Line
	7050 4300 7550 4300
Text Label 7550 4300 2    50   ~ 0
FZ
Wire Wire Line
	7050 4400 7550 4400
Text Label 7550 4400 2    50   ~ 0
~ACCPL
Wire Wire Line
	5900 4800 5050 4800
Wire Wire Line
	5900 4700 5050 4700
Wire Wire Line
	5900 4600 5050 4600
Wire Wire Line
	5900 4500 5050 4500
Text Label 5050 4100 0    50   ~ 0
RESET
$Sheet
S 5900 2650 1150 1000
U 5D967A8B
F0 "Data Register" 50
F1 "cft-reg-dr-sp.sch" 50
F2 "~FPH" I R 7050 3400 50 
F3 "~FPL" I R 7050 3500 50 
F4 "~READ" I L 5900 3200 50 
F5 "~INC" I L 5900 3400 50 
F6 "~WRITE" I L 5900 3300 50 
F7 "RESET" I L 5900 2800 50 
F8 "IBUS[0..15]" I L 5900 3000 50 
F9 "~DEC" I L 5900 3500 50 
F10 "FPD[0..7]" T R 7050 3300 50 
$EndSheet
$Sheet
S 5900 5250 1150 1000
U 5D9BD2A8
F0 "Stack Pointer" 50
F1 "cft-reg-dr-sp.sch" 50
F2 "~FPH" I R 7050 6000 50 
F3 "~FPL" I R 7050 6100 50 
F4 "~READ" I L 5900 5800 50 
F5 "~INC" I L 5900 6000 50 
F6 "~WRITE" I L 5900 5900 50 
F7 "RESET" I L 5900 5400 50 
F8 "IBUS[0..15]" I L 5900 5600 50 
F9 "~DEC" I L 5900 6100 50 
F10 "FPD[0..7]" T R 7050 5900 50 
$EndSheet
Text Label 3400 5500 2    50   ~ 0
~ACTION-DECDR
Wire Wire Line
	2800 5400 3400 5400
Wire Wire Line
	2800 5500 3400 5500
Wire Wire Line
	2800 5600 3400 5600
Wire Wire Line
	2800 5700 3400 5700
Wire Wire Line
	2800 5800 3400 5800
Wire Wire Line
	2800 5900 3400 5900
Wire Wire Line
	2800 3550 3400 3550
Wire Wire Line
	2800 3650 3400 3650
Wire Wire Line
	2800 3750 3400 3750
Wire Wire Line
	2800 3850 3400 3850
Text Label 3400 3550 2    50   ~ 0
~WRITE-PC
Text Label 3400 2400 2    50   ~ 0
~READ-SP
Text Label 3400 2300 2    50   ~ 0
~READ-AC
Text Label 3400 2200 2    50   ~ 0
~READ-DR
Text Label 3400 2100 2    50   ~ 0
~READ-PC
Wire Wire Line
	2800 2100 3400 2100
Wire Wire Line
	2800 2200 3400 2200
Wire Wire Line
	2800 2300 3400 2300
Wire Wire Line
	2800 2400 3400 2400
Text Label 1350 1450 0    50   ~ 0
~RESET
Wire Wire Line
	1900 1450 1350 1450
$Comp
L alexios:74LVC1G04 U101
U 1 1 5DAE39EC
P 2200 1450
F 0 "U101" H 2150 1717 50  0000 C CNN
F 1 "74LVC1G04" H 2150 1626 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2200 1450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 2200 1450 50  0001 C CNN
	1    2200 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 1500 5900 1500
Wire Wire Line
	5050 2800 5900 2800
Wire Wire Line
	5050 4100 5900 4100
Wire Wire Line
	5050 5400 5900 5400
Text Label 2900 1450 2    50   ~ 0
RESET
Wire Wire Line
	2400 1450 2900 1450
Wire Wire Line
	5900 6000 5050 6000
Text Label 5050 3500 0    50   ~ 0
~ACTION-DECDR
Text Label 5050 3400 0    50   ~ 0
~ACTION-INCDR
Text Label 5050 4500 0    50   ~ 0
~READ-AC
Text Label 5050 4600 0    50   ~ 0
~WRITE-AC
Text Label 5050 4700 0    50   ~ 0
~ACTION-INCAC
Text Label 5050 4800 0    50   ~ 0
~ACTION-DECAC
Text Label 5050 5800 0    50   ~ 0
~READ-SP
Text Label 5050 5900 0    50   ~ 0
~WRITE-SP
Text Label 5050 6000 0    50   ~ 0
~ACTION-INCSP
Text Label 5050 6100 0    50   ~ 0
~ACTION-DECSP
Wire Wire Line
	10400 1500 10900 1500
Wire Wire Line
	10400 1600 10900 1600
Wire Wire Line
	10400 1700 10900 1700
Wire Wire Line
	10400 1800 10900 1800
Wire Wire Line
	10400 1900 10900 1900
Wire Wire Line
	10400 2000 10900 2000
Wire Wire Line
	10400 2500 10900 2500
Wire Wire Line
	10400 2600 10900 2600
Wire Wire Line
	10400 2700 10900 2700
Wire Wire Line
	10400 2800 10900 2800
Wire Wire Line
	10400 2900 10900 2900
Wire Wire Line
	10400 3000 10900 3000
Wire Wire Line
	10400 3100 10900 3100
Wire Wire Line
	10400 3200 10900 3200
Text Label 10900 3100 2    50   ~ 0
~FPSPH
Text Label 10900 3200 2    50   ~ 0
~FPSPL
Text Label 10900 2900 2    50   ~ 0
~FPACH
Text Label 10900 3000 2    50   ~ 0
~FPACL
Text Label 10900 2700 2    50   ~ 0
~FPDRH
Text Label 10900 2800 2    50   ~ 0
~FPDRL
Text Label 10900 2500 2    50   ~ 0
~FPPCH
Text Label 10900 2600 2    50   ~ 0
~FPPCL
Text Label 10900 1500 2    50   ~ 0
PC10
Text Label 10900 1600 2    50   ~ 0
PC11
Text Label 10900 1700 2    50   ~ 0
PC12
Text Label 10900 1800 2    50   ~ 0
PC13
Text Label 10900 1900 2    50   ~ 0
PC14
Text Label 10900 2000 2    50   ~ 0
PC15
Text Label 5050 2100 0    50   ~ 0
~ACTION-INCPC
NoConn ~ 10900 3400
NoConn ~ 10900 3300
NoConn ~ 10900 2400
NoConn ~ 10900 2300
NoConn ~ 10900 2200
NoConn ~ 10900 2100
Wire Wire Line
	10400 3500 10900 3500
Wire Wire Line
	10400 3400 10900 3400
Wire Wire Line
	10400 3300 10900 3300
Wire Wire Line
	10400 2400 10900 2400
Wire Wire Line
	10400 2300 10900 2300
Wire Wire Line
	10400 2200 10900 2200
Wire Wire Line
	10400 2100 10900 2100
NoConn ~ 10900 3500
Wire Wire Line
	10400 3600 10900 3600
NoConn ~ 10900 3600
NoConn ~ 2800 5300
Text Notes 3450 5300 0    50   ~ 0
The PC doesn't decrement
Text Label 8700 4600 0    50   ~ 0
RADDR[0..4]
Text Notes 3100 3200 0    50   ~ 0
[RW]ADDR\n\n01000\n01001\n01010\n01011
Text Notes 3650 3200 0    50   ~ 0
Reg\n\nPC\nDR\nAC\nSP
Wire Notes Line width 12 style solid
	3050 2675 3850 2675
Wire Notes Line width 12 style solid
	3050 3250 3050 2675
Wire Notes Line width 12 style solid
	3850 3250 3050 3250
Wire Notes Line width 12 style solid
	3850 2675 3850 3250
Wire Notes Line style solid
	3050 2850 3850 2850
Wire Notes Line
	3600 2675 3600 3250
$Comp
L alexios:74HC138 U103
U 1 1 5DA31171
P 2300 3950
F 0 "U103" H 2300 4617 50  0000 C CNN
F 1 "74HC138" H 2300 4526 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2300 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2300 3950 50  0001 C CNN
F 4 "Yes" H 2225 3125 50  0001 C CNN "Verified"
	1    2300 3950
	1    0    0    -1  
$EndComp
Text Label 1800 4350 2    50   ~ 0
CLK4'
Text Label 8700 2000 0    50   ~ 0
CLK4
Text Notes 10700 5200 2    50   ~ 0
FN≡
Text Label 1500 6000 0    50   ~ 0
CLK4'
Wire Wire Line
	1500 6000 1800 6000
Text Notes 2050 6800 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
NoConn ~ 8700 1850
Wire Wire Line
	1550 2900 1450 2900
Wire Wire Line
	1450 2900 1450 2950
$Comp
L power:GND #PWR0101
U 1 1 5D9C912E
P 1450 2950
F 0 "#PWR0101" H 1450 2700 50  0001 C CNN
F 1 "GND" H 1455 2777 50  0000 C CNN
F 2 "" H 1450 2950 50  0001 C CNN
F 3 "" H 1450 2950 50  0001 C CNN
	1    1450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2900 1800 2900
Wire Wire Line
	1550 5900 1300 5900
Wire Wire Line
	1300 5900 1300 5950
$Comp
L power:GND #PWR0107
U 1 1 60249AD4
P 1300 5950
F 0 "#PWR0107" H 1300 5700 50  0001 C CNN
F 1 "GND" H 1305 5777 50  0000 C CNN
F 2 "" H 1300 5950 50  0001 C CNN
F 3 "" H 1300 5950 50  0001 C CNN
	1    1300 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5900 1800 5900
$Comp
L Device:Jumper_NC_Small JP104
U 1 1 602831A6
P 1650 5900
F 0 "JP104" H 1500 5950 50  0000 C CNN
F 1 "Jumper_NC_Small" H 1650 6021 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 1650 5900 50  0001 C CNN
F 3 "~" H 1650 5900 50  0001 C CNN
	1    1650 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP101
U 1 1 60284772
P 1650 2900
F 0 "JP101" H 1650 2807 50  0000 C CNN
F 1 "Jumper_NC_Small" H 1650 3021 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 1650 2900 50  0001 C CNN
F 3 "~" H 1650 2900 50  0001 C CNN
	1    1650 2900
	1    0    0    -1  
$EndComp
NoConn ~ 8700 1750
Wire Wire Line
	1200 4150 800  4150
$Comp
L power:GND #PWR0103
U 1 1 5EEF256F
P 1200 4550
F 0 "#PWR0103" H 1200 4300 50  0001 C CNN
F 1 "GND" H 1205 4377 50  0000 C CNN
F 2 "" H 1200 4550 50  0001 C CNN
F 3 "" H 1200 4550 50  0001 C CNN
	1    1200 4550
	1    0    0    -1  
$EndComp
Text Label 800  4150 0    50   ~ 0
CLK4
Text Notes 1400 4750 0    50   ~ 0
1-2: Normal Operation\n2-3: Standalone REG Board Testing
$Comp
L Jumper:SolderJumper_3_Open JP102
U 1 1 5EF00BEB
P 1200 4350
F 0 "JP102" V 1200 4418 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 1245 4417 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm" H 1200 4350 50  0001 C CNN
F 3 "~" H 1200 4350 50  0001 C CNN
	1    1200 4350
	0    -1   1    0   
$EndComp
Wire Wire Line
	1350 4350 1800 4350
Text Notes 9600 6250 0    63   ~ 13
Errata
Text Notes 9600 6400 0    50   ~ 0
2021: PC.~DEC~ left floating.
Wire Notes Line width 12 style solid
	9500 6050 11100 6050
Wire Notes Line width 12 style solid
	11100 6050 11100 6700
Wire Notes Line width 12 style solid
	11100 6700 9500 6700
Wire Notes Line width 12 style solid
	9500 6700 9500 6050
Wire Bus Line
	1350 3350 1350 4150
Wire Bus Line
	1350 1900 1350 2700
Wire Bus Line
	1350 5000 1350 5700
Wire Bus Line
	-3200 1250 -3200 1900
Wire Bus Line
	-12350 4650 -12350 5450
$EndSCHEMATC
