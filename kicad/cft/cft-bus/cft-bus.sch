EESchema Schematic File Version 4
LIBS:cft-bus-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 9
Title "CFT Homebrew 16-bit Minicomputer"
Date ""
Rev ""
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5650 950  1150 1500
U 5D46B22D
F0 "Wait States & Write Strobes" 50
F1 "cft_ws_busen.sch" 50
F2 "WSTB" I L 5650 1500 50 
F3 "~RESET" I L 5650 1100 50 
F4 "CLK3" I L 5650 1300 50 
F5 "T34" I L 5650 1400 50 
F6 "~MEM" I L 5650 1650 50 
F7 "~IO" I L 5650 1750 50 
F8 "~HALT" I L 5650 1200 50 
F9 "~WEN" I L 5650 1950 50 
F10 "~WS" I L 5650 2200 50 
F11 "~W" T R 6800 1850 50 
F12 "~R" I L 5650 1850 50 
F13 "IBUS[0..15]" T L 5650 2300 50 
F14 "DB[0..15]" T R 6800 2300 50 
$EndSheet
$Sheet
S 5650 3750 1150 750 
U 5CC06F10
F0 "Address Register (AR)" 50
F1 "cft_ar.sch" 50
F2 "~MEM" T L 5650 4200 50 
F3 "~IO" T L 5650 4350 50 
F4 "IBUS[0..15]" T L 5650 3900 50 
F5 "~WRITE-AR" I L 5650 4050 50 
F6 "AB[0..23]" O R 6800 3850 50 
F7 "AEXT[0..7]" I L 5650 3800 50 
F8 "~SYSDEV" O R 6800 3950 50 
F9 "~IODEV1XX" O R 6800 4050 50 
F10 "~IODEV2XX" O R 6800 4150 50 
F11 "~IODEV3XX" O R 6800 4250 50 
F12 "~FPAEXT" I L 5650 4450 50 
F13 "FPD[0..7]" T R 6800 4450 50 
$EndSheet
Text Notes 6000 4350 0    70   ~ 14
Verilog
Text Notes 6000 3150 0    70   ~ 14
Verilog
Text Notes 3700 5650 0    70   ~ 14
Verilog
$Sheet
S 3350 4650 1150 1050
U 5F67D4B5
F0 "Interrupt State Machine" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L 3350 5600 50 
F3 "~RESET" I L 3350 4750 50 
F4 "FI" O R 4500 4750 50 
F5 "~IRQS" O R 4500 5500 50 
F6 "~END" I L 3350 5450 50 
F7 "CLK4" I L 3350 4950 50 
F8 "~ACTION-STI" I L 3350 5150 50 
F9 "~ACTION-CLI" I L 3350 5050 50 
F10 "CLK1" I L 3350 4850 50 
F11 "~IRQSµC" O R 4500 5600 50 
F12 "IBUS15" I L 3350 5250 50 
F13 "~FLAGWE" I L 3350 5350 50 
$EndSheet
Text Notes 6325 2075 0    70   ~ 14
Verilog
$Sheet
S 2950 6350 1150 850 
U 5DF0FEB9
F0 "sheet5DF0FEB1" 50
F1 "cpu_cs.sch" 50
F2 "~RUEN" I L 2950 6500 50 
F3 "RADDR[0..4]" I L 2950 6650 50 
F4 "IBUS[0..15]" B R 4100 6500 50 
$EndSheet
$Sheet
S 8500 1750 1150 1300
U 5DF0FECB
F0 "sheet5DF0FEB2" 50
F1 "flag_unit.sch" 50
F2 "FPD[0..7]" T R 9650 2900 50 
F3 "IBUS[8..15]" T R 9650 1900 50 
F4 "~FPFLAGS" I L 8500 2900 50 
F5 "~ACTION-CPL" O R 9650 2050 50 
F6 "~ACTION-CLL" O R 9650 2150 50 
F7 "~ACTION-STI" O R 9650 2250 50 
F8 "~ACTION-CLI" O R 9650 2350 50 
F9 "WADDR[0..4]" I L 8500 1900 50 
F10 "RADDR[0..4]" I L 8500 2050 50 
F11 "ACTION[0..3]" I L 8500 2200 50 
F12 "FI" I L 8500 2350 50 
F13 "FV" I L 8500 2450 50 
F14 "FL" I L 8500 2550 50 
F15 "FZ" I L 8500 2650 50 
F16 "FN" I L 8500 2750 50 
F17 "~FLAGWE" O R 9650 2750 50 
$EndSheet
Text Notes 8850 4500 0    70   ~ 14
Verilog
$Sheet
S 8500 3500 1150 1050
U 5DF0FEDA
F0 "sheet5DF0FEB3" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L 8500 4450 50 
F3 "~RESET" I L 8500 3600 50 
F4 "FI" O R 9650 3600 50 
F5 "~IRQS" O R 9650 4350 50 
F6 "~END" I L 8500 4300 50 
F7 "CLK4" I L 8500 3800 50 
F8 "~ACTION-STI" I L 8500 4000 50 
F9 "~ACTION-CLI" I L 8500 3900 50 
F10 "CLK1" I L 8500 3700 50 
F11 "~IRQSµC" O R 9650 4450 50 
F12 "IBUS15" I L 8500 4100 50 
F13 "~FLAGWE" I L 8500 4200 50 
$EndSheet
Text Notes 8950 2600 0    70   ~ 14
Verilog
Wire Bus Line
	4100 6500 4700 6500
Text Label 4700 6500 2    50   ~ 0
IBUS[0..15]
Wire Bus Line
	9650 1900 10250 1900
Text Label 10250 1900 2    50   ~ 0
IBUS[0..15]
Text Label 10250 2900 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	9650 2900 10250 2900
Wire Wire Line
	8500 3600 8000 3600
Wire Wire Line
	8500 3700 8000 3700
Wire Wire Line
	8500 3800 8000 3800
Wire Wire Line
	8500 3900 8000 3900
Wire Wire Line
	8500 4000 8000 4000
Wire Wire Line
	8500 4100 8000 4100
Wire Wire Line
	8500 4200 8000 4200
Wire Wire Line
	8500 4300 8000 4300
Wire Wire Line
	8500 4450 8000 4450
Text Label 8000 3600 0    50   ~ 0
~RESET
Text Label 8000 3700 0    50   ~ 0
CLK1
Text Label 8000 3800 0    50   ~ 0
CLK4
Text Label 8000 3900 0    50   ~ 0
~ACTION_CLI
Text Label 8000 4000 0    50   ~ 0
~ACTION_STI
Text Label 8000 4100 0    50   ~ 0
IBUS15
Text Label 8000 4200 0    50   ~ 0
~FLAGWE
Text Label 8000 4300 0    50   ~ 0
~END
Text Label 8000 4450 0    50   ~ 0
~IRQ
$Sheet
S 14300 2700 1150 4200
U 5DF0FF3E
F0 "sheet5DF0FEB4" 50
F1 "./bus.sch" 50
F2 "AB[0..23]" U L 14300 3450 50 
F3 "DB[0..15]" U L 14300 3550 50 
F4 "FPD[0..7]" U L 14300 3850 50 
F5 "IBUS[0..15]" U L 14300 2850 50 
F6 "~RESET" U L 14300 2950 50 
F7 "CLK1" U L 14300 3050 50 
F8 "CLK2" U L 14300 3150 50 
F9 "CLK3" U L 14300 3250 50 
F10 "CLK4" U L 14300 3350 50 
F11 "WSTB" U L 14300 3650 50 
F12 "T34" U L 14300 3750 50 
F13 "~IRQ" U L 14300 3950 50 
F14 "~IRQS" U L 14300 4050 50 
F15 "~IRQ[0..7]" U L 14300 4150 50 
F16 "~RSTHOLD" U L 14300 4250 50 
F17 "~SYSDEV" U L 14300 4350 50 
F18 "~IODEV1xx" U L 14300 4450 50 
F19 "~IODEV2xx" U L 14300 4550 50 
F20 "~IODEV3xx" U L 14300 4650 50 
F21 "~MEM" U L 14300 4750 50 
F22 "~IO" U L 14300 4850 50 
F23 "~R" U L 14300 4950 50 
F24 "~W" U L 14300 5050 50 
F25 "~WS" U L 14300 5150 50 
F26 "~ENDEXT" U L 14300 5250 50 
F27 "~SKIPEXT" U L 14300 5350 50 
F28 "~HALT" U L 14300 5450 50 
F29 "ACTION[0..3]" U L 14300 5750 50 
F30 "WADDR[0..4]" U L 14300 5850 50 
F31 "RADDR[0..4]" U L 14300 5950 50 
F32 "RSVD[1..4]" U L 14300 6050 50 
F33 "C1" U R 15450 2850 50 
F34 "C2" U R 15450 2950 50 
F35 "C3" U R 15450 3050 50 
F36 "C4" U R 15450 3150 50 
F37 "C5" U R 15450 3250 50 
F38 "C6" U R 15450 3350 50 
F39 "C7" U R 15450 3450 50 
F40 "C8" U R 15450 3550 50 
F41 "C9" U R 15450 3650 50 
F42 "C10" U R 15450 3750 50 
F43 "C11" U R 15450 3850 50 
F44 "C12" U R 15450 3950 50 
F45 "C13" U R 15450 4050 50 
F46 "C14" U R 15450 4150 50 
F47 "C15" U R 15450 4250 50 
F48 "C16" U R 15450 4350 50 
F49 "C17" U R 15450 4450 50 
F50 "C18" U R 15450 4550 50 
F51 "C19" U R 15450 4650 50 
F52 "C20" U R 15450 4750 50 
F53 "C21" U R 15450 4850 50 
F54 "C22" U R 15450 4950 50 
F55 "C23" U R 15450 5050 50 
F56 "C24" U R 15450 5150 50 
F57 "C25" U R 15450 5250 50 
F58 "C26" U R 15450 5350 50 
F59 "C27" U R 15450 5450 50 
F60 "C28" U R 15450 5550 50 
F61 "C29" U R 15450 5650 50 
F62 "C30" U R 15450 5750 50 
F63 "C31" U R 15450 5850 50 
F64 "C32" U R 15450 5950 50 
F65 "C33" U R 15450 6050 50 
F66 "C34" U R 15450 6150 50 
F67 "C35" U R 15450 6250 50 
F68 "C36" U R 15450 6350 50 
F69 "C37" U R 15450 6450 50 
F70 "C38" U R 15450 6550 50 
F71 "C39" U R 15450 6650 50 
F72 "C40" U R 15450 6750 50 
F73 "~RUEN" U L 14300 5550 50 
F74 "~WUEN" U L 14300 5650 50 
$EndSheet
Wire Bus Line
	14300 3450 13750 3450
Wire Bus Line
	14300 3550 13750 3550
Text Label 13750 3550 0    50   ~ 0
DB[0..15]
Wire Bus Line
	13750 3850 14300 3850
Text Label 13750 3850 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	14300 3050 13750 3050
Wire Wire Line
	14300 3150 13750 3150
Wire Wire Line
	14300 3250 13750 3250
Wire Wire Line
	14300 3350 13750 3350
Wire Wire Line
	14300 2950 13750 2950
Wire Wire Line
	14300 4250 13750 4250
Wire Wire Line
	14300 4350 13750 4350
Wire Wire Line
	14300 4450 13750 4450
Wire Wire Line
	14300 3950 13750 3950
Wire Wire Line
	14300 4750 13750 4750
Wire Wire Line
	14300 4850 13750 4850
Wire Wire Line
	14300 4950 13750 4950
Wire Wire Line
	14300 5050 13750 5050
Wire Wire Line
	14300 4650 13750 4650
Wire Wire Line
	14300 4550 13750 4550
Wire Wire Line
	14300 5350 13750 5350
Wire Wire Line
	14300 5450 13750 5450
Wire Wire Line
	14300 5250 13750 5250
Wire Wire Line
	14300 5150 13750 5150
Wire Bus Line
	13750 4150 14300 4150
Text Label 13750 4150 0    50   ~ 0
~IRQ[0..7]
Text Label 13750 3950 0    50   ~ 0
~IRQ
Wire Wire Line
	14300 3650 13750 3650
Wire Wire Line
	14300 3750 13750 3750
Wire Bus Line
	13750 2850 14300 2850
Text Label 13750 2850 0    50   ~ 0
IBUS[0..15]
Text Label 13750 2950 0    50   ~ 0
~RESET
Text Label 13750 3050 0    50   ~ 0
CLK1
Text Label 13750 3150 0    50   ~ 0
CLK2
Text Label 13750 3250 0    50   ~ 0
CLK3
Text Label 13750 3350 0    50   ~ 0
CLK4
Text Label 13750 3650 0    50   ~ 0
WSTB
Text Label 13750 3750 0    50   ~ 0
T34
Wire Wire Line
	14300 4050 13750 4050
Text Label 13750 4050 0    50   ~ 0
~IRQS
Text Label 13750 4250 0    50   ~ 0
~RSTHOLD
Text Label 13750 4350 0    50   ~ 0
~SYSDEV
Text Label 13750 4450 0    50   ~ 0
~IODEV1xx
Text Label 13750 4550 0    50   ~ 0
~IODEV2xx
Text Label 13750 4650 0    50   ~ 0
~IODEV3xx
Text Label 13750 4750 0    50   ~ 0
~MEM
Text Label 13750 4850 0    50   ~ 0
~IO
Text Label 13750 4950 0    50   ~ 0
~R
Text Label 13750 5150 0    50   ~ 0
~WS
Text Label 13750 5250 0    50   ~ 0
~ENDEXT
Text Label 13750 5350 0    50   ~ 0
~SKIPEXT
Text Label 13750 5450 0    50   ~ 0
~HALT
Text Label 13750 5750 0    50   ~ 0
ACTION[0..3]
Text Label 13750 5850 0    50   ~ 0
WADDR[0..4]
Text Label 13750 5950 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	14300 5750 13750 5750
Wire Bus Line
	14300 5850 13750 5850
Wire Bus Line
	14300 5950 13750 5950
Wire Bus Line
	13750 6050 14300 6050
Text Label 13750 6050 0    50   ~ 0
RSVD[1..4]
Text Notes 15050 4700 1    100  ~ 20
Left Slot
Text Label 13750 5050 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 16800 7300
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR02"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 16800 7150 50  0001 C CNN
F 1 "+5V" H 16742 7337 50  0000 R CNN
F 2 "" H 16800 7300 50  0001 C CNN
F 3 "" H 16800 7300 50  0001 C CNN
	1    16800 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 16800 7700
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR04"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 16800 7450 50  0001 C CNN
F 1 "GND" H 16722 7663 50  0000 R CNN
F 2 "" H 16800 7700 50  0001 C CNN
F 3 "" H 16800 7700 50  0001 C CNN
	1    16800 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	16800 7300 16800 7400
$Comp
L Device:CP_Small C2
U 1 1 5DF0FF8F
P 16800 7500
AR Path="/5DF0FF8F" Ref="C2"  Part="1" 
AR Path="/5D34E810/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF8F" Ref="C?"  Part="1" 
F 0 "C2" H 16712 7546 50  0000 R CNN
F 1 "47µF" H 16712 7455 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 16800 7500 50  0001 C CNN
F 3 "~" H 16800 7500 50  0001 C CNN
	1    16800 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	16800 7600 16800 7700
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 16350 7300
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR01"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 16350 7150 50  0001 C CNN
F 1 "+5V" H 16292 7337 50  0000 R CNN
F 2 "" H 16350 7300 50  0001 C CNN
F 3 "" H 16350 7300 50  0001 C CNN
	1    16350 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF9C
P 16350 7700
AR Path="/5F67D4B5/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF9C" Ref="#PWR03"  Part="1" 
AR Path="/5D34E810/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF9C" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 16350 7450 50  0001 C CNN
F 1 "GND" H 16272 7663 50  0000 R CNN
F 2 "" H 16350 7700 50  0001 C CNN
F 3 "" H 16350 7700 50  0001 C CNN
	1    16350 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	16350 7300 16350 7400
$Comp
L Device:CP_Small C1
U 1 1 5DF0FFA3
P 16350 7500
AR Path="/5DF0FFA3" Ref="C1"  Part="1" 
AR Path="/5D34E810/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FFA3" Ref="C?"  Part="1" 
F 0 "C1" H 16262 7546 50  0000 R CNN
F 1 "47µF" H 16262 7455 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 16350 7500 50  0001 C CNN
F 3 "~" H 16350 7500 50  0001 C CNN
	1    16350 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	16350 7600 16350 7700
Text Notes 14100 2350 0    197  ~ 39
Edge Connector
Text Label 15800 5050 2    50   ~ 0
AC0
Text Label 15800 5150 2    50   ~ 0
AC1
Text Label 15800 5250 2    50   ~ 0
AC2
Text Label 15800 5350 2    50   ~ 0
AC3
Text Label 15800 5450 2    50   ~ 0
AC4
Text Label 15800 5550 2    50   ~ 0
AC5
Text Label 15800 5650 2    50   ~ 0
AC6
Text Label 15800 5750 2    50   ~ 0
AC7
Text Label 15800 5850 2    50   ~ 0
AC8
Text Label 15800 5950 2    50   ~ 0
AC9
Text Label 15800 6050 2    50   ~ 0
AC10
Text Label 15800 6150 2    50   ~ 0
AC11
Text Label 15800 6250 2    50   ~ 0
AC12
Text Label 15800 6350 2    50   ~ 0
AC13
Text Label 15800 6450 2    50   ~ 0
AC14
Text Label 15800 6550 2    50   ~ 0
AC15
Wire Wire Line
	15450 5050 15800 5050
Wire Wire Line
	15450 5150 15800 5150
Wire Wire Line
	15450 5250 15800 5250
Wire Wire Line
	15450 5350 15800 5350
Wire Wire Line
	15450 5450 15800 5450
Wire Wire Line
	15450 5550 15800 5550
Wire Wire Line
	15450 5650 15800 5650
Wire Wire Line
	15450 5750 15800 5750
Wire Wire Line
	15450 5850 15800 5850
Wire Wire Line
	15450 5950 15800 5950
Wire Wire Line
	15450 6050 15800 6050
Wire Wire Line
	15450 6150 15800 6150
Wire Wire Line
	15450 6250 15800 6250
Wire Wire Line
	15450 6350 15800 6350
Wire Wire Line
	15450 6450 15800 6450
Wire Wire Line
	15450 6550 15800 6550
Wire Wire Line
	15450 3750 15800 3750
NoConn ~ 13750 3050
NoConn ~ 13750 3250
NoConn ~ 13750 3750
NoConn ~ 13750 3950
NoConn ~ 13750 4050
NoConn ~ 13750 4150
NoConn ~ 13750 4250
NoConn ~ 13750 4350
NoConn ~ 13750 4450
NoConn ~ 13750 4550
NoConn ~ 13750 4650
NoConn ~ 13750 4750
NoConn ~ 13750 4850
NoConn ~ 13750 4950
NoConn ~ 13750 5050
NoConn ~ 13750 5150
NoConn ~ 13750 5250
NoConn ~ 13750 5350
NoConn ~ 13750 5450
NoConn ~ 13750 6050
Wire Wire Line
	15450 3650 15800 3650
Wire Wire Line
	15450 3550 16000 3550
Wire Wire Line
	15450 4950 15500 4950
Wire Wire Line
	15450 2850 15800 2850
Wire Wire Line
	15450 2950 15800 2950
Wire Wire Line
	15450 3050 15800 3050
Wire Wire Line
	15450 3150 15800 3150
Wire Wire Line
	15450 3250 15800 3250
Wire Wire Line
	15450 3350 15800 3350
Wire Wire Line
	15450 3450 15800 3450
Text Label 15800 2850 2    50   ~ 0
IR0
Text Label 15800 2950 2    50   ~ 0
IR1
Text Label 15800 3050 2    50   ~ 0
IR2
Text Label 15800 3150 2    50   ~ 0
IR3
Text Label 15800 3250 2    50   ~ 0
IR4
Text Label 15800 3350 2    50   ~ 0
IR5
Text Label 15800 3450 2    50   ~ 0
IR6
Entry Wire Line
	15800 3450 15900 3350
Entry Wire Line
	15800 3350 15900 3250
Entry Wire Line
	15800 3250 15900 3150
Entry Wire Line
	15800 3150 15900 3050
Entry Wire Line
	15800 3050 15900 2950
Entry Wire Line
	15800 2950 15900 2850
Entry Wire Line
	15800 2850 15900 2750
Entry Bus Bus
	15900 2700 16000 2600
Wire Bus Line
	16000 2600 16300 2600
Text Label 16300 2600 2    50   ~ 0
IR[0..6]
Text Label 15800 3750 2    50   ~ 0
~FLAGWE
Text Label 16000 3550 2    50   ~ 0
FL-OFFBOARD
Text Label 15800 3650 2    50   ~ 0
FV
Text Notes 16000 3550 0    50   ~ 0
→ Control Unit
Text Notes 16000 3650 0    50   ~ 0
→ Control Unit
Text Notes 16000 3450 0    50   ~ 0
← Control Unit
Text Notes 16000 3350 0    50   ~ 0
← Control Unit
Text Notes 16000 3250 0    50   ~ 0
← Control Unit
Text Notes 16000 3150 0    50   ~ 0
← Control Unit
Text Notes 16000 3050 0    50   ~ 0
← Control Unit
Text Notes 16000 2950 0    50   ~ 0
← Control Unit
Text Notes 16000 2850 0    50   ~ 0
← Control Unit
Text Label 13750 3450 0    50   ~ 0
AB[0..23]
Text Notes 16050 5900 1    50   ~ 0
Input From REG Board
Entry Wire Line
	15900 4950 15800 5050
Entry Wire Line
	15900 5050 15800 5150
Entry Wire Line
	15900 5150 15800 5250
Entry Wire Line
	15900 5250 15800 5350
Entry Wire Line
	15900 5350 15800 5450
Entry Wire Line
	15900 5450 15800 5550
Entry Wire Line
	15900 5550 15800 5650
Entry Wire Line
	15900 5650 15800 5750
Entry Wire Line
	15900 5750 15800 5850
Entry Wire Line
	15900 5850 15800 5950
Entry Wire Line
	15900 5950 15800 6050
Entry Wire Line
	15900 6050 15800 6150
Entry Wire Line
	15900 6150 15800 6250
Entry Wire Line
	15900 6250 15800 6350
Entry Wire Line
	15900 6350 15800 6450
Entry Wire Line
	15900 6450 15800 6550
Text Label 16050 4750 0    50   ~ 0
AC[0..15]
Wire Bus Line
	16000 4750 16400 4750
Entry Bus Bus
	15900 4850 16000 4750
Text Notes 16000 3750 0    50   ~ 0
← Control Unit
Wire Wire Line
	15450 6650 15800 6650
Wire Wire Line
	15450 6750 15800 6750
NoConn ~ 15800 6650
NoConn ~ 15800 6750
Wire Wire Line
	14300 5550 13750 5550
Wire Wire Line
	14300 5650 13750 5650
Text Label 13750 5550 0    50   ~ 0
~RUEN
Text Label 13750 5650 0    50   ~ 0
~WUEN
Wire Wire Line
	15450 3850 15800 3850
Wire Wire Line
	15450 3950 15800 3950
Wire Wire Line
	15450 4050 15800 4050
Wire Wire Line
	15450 4150 15800 4150
Wire Wire Line
	15450 4250 15800 4250
Wire Wire Line
	15450 4350 15800 4350
Wire Wire Line
	15450 4650 15500 4650
Wire Wire Line
	15450 4750 15800 4750
Wire Wire Line
	15450 4450 15800 4450
Wire Wire Line
	15450 4550 15800 4550
NoConn ~ 15800 4750
Text Notes 16600 3850 3    50   ~ 0
For ROM Expansion
$Comp
L Connector:TestPoint TP?
U 1 1 5DF10033
P 15050 7400
AR Path="/5DF75CDE/5DF10033" Ref="TP?"  Part="1" 
AR Path="/5DF10033" Ref="TP5"  Part="1" 
AR Path="/5DD3D79F/5DF10033" Ref="TP?"  Part="1" 
F 0 "TP5" V 15050 7588 50  0000 L CNN
F 1 "TestPoint" H 15108 7427 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 15250 7400 50  0001 C CNN
F 3 "~" H 15250 7400 50  0001 C CNN
	1    15050 7400
	0    1    1    0   
$EndComp
Wire Wire Line
	15050 7400 14300 7400
Text Label 14300 7500 0    50   ~ 0
~ACTION-110
Text Label 14300 7400 0    50   ~ 0
~ACTION-101
$Comp
L Connector:TestPoint TP?
U 1 1 5DF1003C
P 15050 7500
AR Path="/5DF75CDE/5DF1003C" Ref="TP?"  Part="1" 
AR Path="/5DF1003C" Ref="TP6"  Part="1" 
AR Path="/5DD3D79F/5DF1003C" Ref="TP?"  Part="1" 
F 0 "TP6" V 15050 7688 50  0000 L CNN
F 1 "TestPoint" H 15108 7527 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 15250 7500 50  0001 C CNN
F 3 "~" H 15250 7500 50  0001 C CNN
	1    15050 7500
	0    1    1    0   
$EndComp
Wire Wire Line
	15050 7500 14300 7500
Text Notes 14300 7250 0    50   ~ 0
Actions for future expansion
$Comp
L Connector:TestPoint TP?
U 1 1 5DF10044
P 15500 4850
AR Path="/5DD3D79F/5DF10044" Ref="TP?"  Part="1" 
AR Path="/5DF10044" Ref="TP3"  Part="1" 
F 0 "TP3" V 15500 5038 50  0000 L CNN
F 1 "TestPoint" V 15545 5038 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 15700 4850 50  0001 C CNN
F 3 "~" H 15700 4850 50  0001 C CNN
	1    15500 4850
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5DF1004A
P 15800 4450
AR Path="/5DD3D79F/5DF1004A" Ref="TP?"  Part="1" 
AR Path="/5DF1004A" Ref="TP1"  Part="1" 
F 0 "TP1" V 15800 4638 50  0000 L CNN
F 1 "TestPoint" V 15845 4638 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 16000 4450 50  0001 C CNN
F 3 "~" H 16000 4450 50  0001 C CNN
	1    15800 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	15450 4850 15500 4850
$Comp
L Connector:TestPoint TP?
U 1 1 5DF10051
P 15500 4650
AR Path="/5DD3D79F/5DF10051" Ref="TP?"  Part="1" 
AR Path="/5DF10051" Ref="TP2"  Part="1" 
F 0 "TP2" V 15500 4838 50  0000 L CNN
F 1 "TestPoint" V 15545 4838 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 15700 4650 50  0001 C CNN
F 3 "~" H 15700 4650 50  0001 C CNN
	1    15500 4650
	0    1    1    0   
$EndComp
NoConn ~ 15800 3850
NoConn ~ 15800 3950
NoConn ~ 15800 4050
NoConn ~ 15800 4150
NoConn ~ 15800 4250
NoConn ~ 15800 4350
NoConn ~ 15800 4550
$Comp
L Connector:TestPoint TP?
U 1 1 5DF1005E
P 15500 4950
AR Path="/5DD3D79F/5DF1005E" Ref="TP?"  Part="1" 
AR Path="/5DF1005E" Ref="TP4"  Part="1" 
F 0 "TP4" V 15500 5138 50  0000 L CNN
F 1 "TestPoint" V 15545 5138 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 15700 4950 50  0001 C CNN
F 3 "~" H 15700 4950 50  0001 C CNN
	1    15500 4950
	0    1    1    0   
$EndComp
Wire Bus Line
	5650 3900 5050 3900
Text Label 5050 3900 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5650 2300 5050 2300
Text Label 5050 2300 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	6800 3850 7400 3850
Text Label 7400 3850 2    50   ~ 0
AB[0..23]
Wire Bus Line
	6800 2300 7400 2300
Text Label 7400 2300 2    50   ~ 0
DB[0..23]
Wire Bus Line
	6800 4450 7400 4450
Text Label 7400 4450 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	5650 3800 5050 3800
Text Label 5050 3800 0    50   ~ 0
AEXT[0..7]
Wire Bus Line
	6800 2900 7400 2900
Text Label 7400 2900 2    50   ~ 0
AEXT[0..7]
Wire Bus Line
	6800 2800 7400 2800
Text Label 7400 2800 2    50   ~ 0
IBUS[0..15]
Wire Wire Line
	6800 1850 7400 1850
Text Label 7400 1850 2    50   ~ 0
~W
Wire Wire Line
	5650 1100 5050 1100
Wire Wire Line
	5650 1200 5050 1200
Wire Wire Line
	5650 1300 5050 1300
Wire Wire Line
	5650 1400 5050 1400
Wire Wire Line
	5650 1500 5050 1500
Wire Wire Line
	5650 1650 5050 1650
Wire Wire Line
	5650 1750 5050 1750
Wire Wire Line
	5650 1850 5050 1850
Wire Wire Line
	5650 1950 5050 1950
Wire Wire Line
	5650 2200 5050 2200
Text Label 5050 1100 0    50   ~ 0
~RESET
Text Label 5050 1200 0    50   ~ 0
~HALT
Text Label 5050 1300 0    50   ~ 0
CLK3
Text Label 5050 1400 0    50   ~ 0
T34
Text Label 5050 1500 0    50   ~ 0
WSTB
Text Label 5050 1650 0    50   ~ 0
~MEM
Text Label 5050 1750 0    50   ~ 0
~IO
Text Label 5050 1850 0    50   ~ 0
~R
Text Label 5050 1950 0    50   ~ 0
~WEN
Text Label 5050 2200 0    50   ~ 0
~WS
Wire Wire Line
	5650 2800 5050 2800
Text Label 5050 2800 0    50   ~ 0
~RESET
Wire Wire Line
	5650 4200 5050 4200
Text Label 5050 4200 0    50   ~ 0
~MEM
Wire Wire Line
	5650 4350 5050 4350
Text Label 5050 4350 0    50   ~ 0
~IO
Wire Wire Line
	5650 4450 5050 4450
Text Label 5050 4450 0    50   ~ 0
~FPAEXT
$Sheet
S 5650 2700 1150 750 
U 61F95ACC
F0 "Memory Bank Registers (MBR)" 50
F1 "mbu.sch" 50
F2 "~RESET" I L 5650 2800 50 
F3 "AEXT[0..7]" O R 6800 2900 50 
F4 "WADDR[0..4]" I L 5650 3000 50 
F5 "~FPRAM~∕ROM" I L 5650 3300 50 
F6 "IBUS[0..7]" T R 6800 2800 50 
F7 "RADDR[0..4]" I L 5650 2900 50 
F8 "AB[0..7]" I R 6800 3400 50 
F9 "WSTB" I L 5650 3400 50 
F10 "~READ-FLAGS" O R 6800 3300 50 
F11 "~WRITE-FLAGS" O R 6800 3200 50 
F12 "~R" I R 6800 3100 50 
F13 "~W" I R 6800 3000 50 
F14 "IR[0..11]" I L 5650 3200 50 
F15 "~SYSDEV" I L 5650 3100 50 
$EndSheet
Wire Wire Line
	5650 3200 5050 3200
Text Label 5050 3200 0    50   ~ 0
IR[0..11]
Wire Wire Line
	5650 3300 5050 3300
Text Label 5050 3300 0    50   ~ 0
~FPRAM~∕ROM
Text Label -1100 1000 0    50   ~ 0
~READ-MBP+FL
Text Label -1100 1200 0    50   ~ 0
~READ-MBn
Wire Wire Line
	-2900 850  -3200 850 
Wire Wire Line
	-2900 950  -3200 950 
Wire Wire Line
	-2900 1050 -3200 1050
Wire Wire Line
	-2900 1450 -3200 1450
Wire Wire Line
	-2900 1550 -3200 1550
Text Label -3200 850  0    50   ~ 0
RADDR0
Text Label -3200 950  0    50   ~ 0
RADDR1
Text Label -3200 1050 0    50   ~ 0
RADDR2
Text Label -3200 1450 0    50   ~ 0
RADDR3
Text Label -3200 1550 0    50   ~ 0
RADDR4
Wire Wire Line
	-1200 1000 -350 1000
Text Notes -2350 1500 1    50   ~ 10
RADDR=01xxx
$Comp
L alexios:74HC138 U?
U 1 1 5E10B4EC
P -2400 3750
AR Path="/5F3EA987/5E10B4EC" Ref="U?"  Part="1" 
AR Path="/5E10B4EC" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E10B4EC" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5E10B4EC" Ref="U?"  Part="1" 
F 0 "U?" H -2400 4417 50  0000 C CNN
F 1 "74HC138" H -2400 4326 50  0000 C CNN
F 2 "alexios:SOIC-16" H -2400 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -2400 3750 50  0001 C CNN
	1    -2400 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2900 3350 -3200 3350
Wire Wire Line
	-2900 3450 -3200 3450
Wire Wire Line
	-2900 3550 -3200 3550
Text Label -3200 3350 0    50   ~ 0
WADDR2
Text Label -3200 3450 0    50   ~ 0
WADDR3
Text Label -3200 3550 0    50   ~ 0
WADDR4
$Comp
L power:+5V #PWR?
U 1 1 5E10B4FA
P -2950 3900
AR Path="/61F95ACC/5E10B4FA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5E10B4FA" Ref="#PWR?"  Part="1" 
AR Path="/5E10B4FA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -2950 3750 50  0001 C CNN
F 1 "+5V" H -2935 4073 50  0000 C CNN
F 2 "" H -2950 3900 50  0001 C CNN
F 3 "" H -2950 3900 50  0001 C CNN
	1    -2950 3900
	1    0    0    -1  
$EndComp
NoConn ~ -1900 4050
NoConn ~ -1900 3550
NoConn ~ -1900 3350
NoConn ~ -1900 3650
NoConn ~ -1900 3750
NoConn ~ -1900 3850
NoConn ~ -1900 3950
Wire Wire Line
	-1200 1200 -450 1200
Text Notes -2350 4000 1    50   ~ 10
WADDR=001XX
$Comp
L alexios:74HC138 U?
U 1 1 5E10B50F
P -2400 2500
AR Path="/5F3EA987/5E10B50F" Ref="U?"  Part="1" 
AR Path="/5E10B50F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E10B50F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5E10B50F" Ref="U?"  Part="1" 
F 0 "U?" H -2400 3167 50  0000 C CNN
F 1 "74HC138" H -2400 3076 50  0000 C CNN
F 2 "alexios:SOIC-16" H -2400 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -2400 2500 50  0001 C CNN
	1    -2400 2500
	1    0    0    -1  
$EndComp
Text Notes -2350 2750 1    50   ~ 10
WADDR=00XXX
Wire Wire Line
	-2900 2100 -3200 2100
Wire Wire Line
	-2900 2200 -3200 2200
Wire Wire Line
	-2900 2300 -3200 2300
Wire Wire Line
	-2900 2800 -3200 2800
Wire Wire Line
	-2900 2900 -3200 2900
$Comp
L power:+5V #PWR?
U 1 1 5E10B51B
P -2900 2700
AR Path="/61F95ACC/5E10B51B" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5E10B51B" Ref="#PWR?"  Part="1" 
AR Path="/5E10B51B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -2900 2550 50  0001 C CNN
F 1 "+5V" H -2885 2873 50  0000 C CNN
F 2 "" H -2900 2700 50  0001 C CNN
F 3 "" H -2900 2700 50  0001 C CNN
	1    -2900 2700
	1    0    0    -1  
$EndComp
Text Label -3200 2100 0    50   ~ 0
WADDR0
Text Label -3200 2200 0    50   ~ 0
WADDR1
Text Label -3200 2300 0    50   ~ 0
WADDR2
Text Label -3200 2800 0    50   ~ 0
WADDR3
Text Label -3200 2900 0    50   ~ 0
WADDR4
Text Label -1800 2200 0    50   ~ 0
~WRITE-MBP+FL
Text Label -1800 2400 0    50   ~ 0
~WRITE-MBn
Wire Wire Line
	-1900 2200 -1050 2200
Wire Wire Line
	-1900 2400 -1000 2400
Wire Wire Line
	-1900 3450 -1250 3450
Entry Wire Line
	-3300 750  -3200 850 
Entry Wire Line
	-3300 850  -3200 950 
Entry Wire Line
	-3300 950  -3200 1050
Entry Wire Line
	-3300 1350 -3200 1450
Entry Wire Line
	-3300 1450 -3200 1550
Entry Wire Line
	-3300 2000 -3200 2100
Entry Wire Line
	-3300 2100 -3200 2200
Entry Wire Line
	-3300 2200 -3200 2300
Entry Wire Line
	-3300 2700 -3200 2800
Entry Wire Line
	-3300 2800 -3200 2900
Entry Bus Bus
	-3400 600  -3300 700 
Entry Bus Bus
	-3400 1850 -3300 1950
Wire Bus Line
	-3400 1850 -3750 1850
Wire Bus Line
	-3400 600  -3750 600 
Text HLabel -3750 600  0    50   Input ~ 0
RADDR[0..4]
Text HLabel -3750 1850 0    50   Input ~ 0
WADDR[0..4]
Wire Wire Line
	-1200 1100 -550 1100
Wire Wire Line
	-1900 2300 -1150 2300
Text Label -1100 1100 0    50   ~ 0
~READ-FLAGS
Entry Wire Line
	-3300 3250 -3200 3350
Entry Wire Line
	-3300 3350 -3200 3450
Entry Wire Line
	-3300 3450 -3200 3550
Wire Wire Line
	-2950 3900 -2950 3950
Wire Wire Line
	-2950 3950 -2900 3950
Wire Wire Line
	-2900 4050 -3300 4050
Text Label -3300 4050 0    50   ~ 0
~WUEN
Wire Wire Line
	-2900 4150 -2950 4150
Wire Wire Line
	-2950 4150 -2950 4200
$Comp
L power:GND #PWR?
U 1 1 5E192AC7
P -2950 4200
F 0 "#PWR?" H -2950 3950 50  0001 C CNN
F 1 "GND" H -2945 4027 50  0000 C CNN
F 2 "" H -2950 4200 50  0001 C CNN
F 3 "" H -2950 4200 50  0001 C CNN
	1    -2950 4200
	1    0    0    -1  
$EndComp
Text Label -1250 3450 2    50   ~ 0
~WRITE-AR-MBx
Wire Wire Line
	5650 4050 5050 4050
Text Label 5050 4050 0    50   ~ 0
~WRITE-AR-MBx
$Comp
L alexios:74HC138 U?
U 1 1 5E10B4CD
P -2400 1250
AR Path="/5F3EA987/5E10B4CD" Ref="U?"  Part="1" 
AR Path="/5E10B4CD" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E10B4CD" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5E10B4CD" Ref="U?"  Part="1" 
F 0 "U?" H -2400 1917 50  0000 C CNN
F 1 "74HC138" H -2400 1826 50  0000 C CNN
F 2 "alexios:SOIC-16" H -2400 1250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -2400 1250 50  0001 C CNN
	1    -2400 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2900 1650 -3200 1650
Text Label -3200 1650 0    50   ~ 0
~RUEN
Text Notes 950  2450 0    198  ~ 0
Microcode Addressing under review, check\nwith microcode.mc and Verilog!
Wire Bus Line
	-3300 700  -3300 1450
Wire Bus Line
	15900 2700 15900 3350
Wire Bus Line
	-3300 1950 -3300 3450
Wire Bus Line
	15900 4850 15900 6450
$EndSCHEMATC
