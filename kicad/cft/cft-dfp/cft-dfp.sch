EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 17
Title "Debugging Front Panel"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 "Last revision manufactured: 1939."
Comment3 "R1945 reallocates A72/A73 due to short."
Comment4 ""
$EndDescr
$Sheet
S 1350 5050 1150 1500
U 5ED99F01
F0 "Run Control State Machine" 50
F1 "cft_dfp_rc_fsm.sch" 50
F2 "~WAIT" O R 2500 6100 50 
F3 "FPCLKEN" T R 2500 6250 50 
F4 "FPµSTEP" T R 2500 6400 50 
F5 "FPCLKEN-IN" I L 1350 6250 50 
F6 "FPµSTEP-IN" I L 1350 6400 50 
F7 "STEP∕~RUN" I L 1350 5950 50 
F8 "FPFETCH∕~EXEC" I L 1350 5650 50 
F9 "~CLR" I L 1350 5800 50 
F10 "~µSTEP" I L 1350 6100 50 
F11 "CLK4" I L 1350 5500 50 
F12 "~RESET" I L 1350 5200 50 
F13 "~RSTHOLD" I L 1350 5350 50 
$EndSheet
Wire Wire Line
	2500 6100 3050 6100
Text Label 3050 6100 2    50   ~ 0
~WAIT
Wire Wire Line
	2500 6250 3050 6250
Text Label 3050 6250 2    50   ~ 0
FPCLKEN
Wire Wire Line
	2500 6400 3050 6400
Text Label 3050 6400 2    50   ~ 0
FPµSTEP
Wire Wire Line
	1350 6100 750  6100
Text Label 750  6100 0    50   ~ 0
~µSTEP
Wire Wire Line
	1350 6250 750  6250
Text Label 750  6250 0    50   ~ 0
FPCLKEN-IN
Wire Wire Line
	1350 6400 750  6400
Text Label 750  6400 0    50   ~ 0
FPµSTEP-IN
Wire Wire Line
	1350 5950 750  5950
Text Label 750  5950 0    50   ~ 0
STEP∕~RUN
Wire Wire Line
	1350 5800 750  5800
Text Label 750  5800 0    50   ~ 0
~CLR
Wire Wire Line
	1350 5650 750  5650
Text Label 750  5650 0    50   ~ 0
FPFETCH∕~EXEC
Wire Wire Line
	1350 5500 750  5500
Text Label 750  5500 0    50   ~ 0
CLK4
Wire Wire Line
	1350 5350 750  5350
Text Label 750  5350 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	1350 5200 750  5200
Text Label 750  5200 0    50   ~ 0
~RESET
$Sheet
S 3100 5050 1150 900 
U 614F5B8D
F0 "Address Decoder & Wait States" 50
F1 "cft_dfp_ws.sch" 50
F2 "~WS" T R 4250 5200 50 
F3 "~IOINT" O R 4250 5350 50 
F4 "~DBOE1" O R 4250 5800 50 
F5 "~R" T L 3100 5200 50 
F6 "~DBOE0" I L 3100 5800 50 
F7 "CLRWS" I L 3100 5650 50 
F8 "~IODEV1xx" I L 3100 5350 50 
F9 "AB[5..7]" I L 3100 5500 50 
$EndSheet
Wire Wire Line
	3100 5200 2600 5200
Text Label 2600 5200 0    50   ~ 0
~R
Wire Wire Line
	3100 5350 2600 5350
Text Label 2600 5350 0    50   ~ 0
~IODEV1xx
Wire Bus Line
	3100 5500 2600 5500
Text Label 2600 5500 0    50   ~ 0
AB[0..23]
Wire Wire Line
	3100 5650 2600 5650
Text Label 2600 5650 0    50   ~ 0
CLRWS
Wire Wire Line
	3100 5800 2600 5800
Text Label 2600 5800 0    50   ~ 0
~DBOE0
Wire Wire Line
	4250 5200 4750 5200
Text Label 4750 5200 2    50   ~ 0
~WS
Wire Wire Line
	4250 5350 4750 5350
Text Label 4750 5350 2    50   ~ 0
~IOINT
Wire Wire Line
	4250 5800 4750 5800
Text Label 4750 5800 2    50   ~ 0
~DBOE1
Text Notes 1150 4900 0    100  ~ 20
Run/Step/Stop FSM
Text Notes 2900 4900 0    100  ~ 20
CFT Bus Address Decoder
Wire Bus Line
	4950 1000 4400 1000
Text Label 4400 1000 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	6100 2800 6650 2800
Text Label 6650 2800 2    50   ~ 0
~ABOE
Text Label 4350 1200 0    50   ~ 0
~WAB0
Text Label 4350 1300 0    50   ~ 0
~WAB1
Text Label 4350 1400 0    50   ~ 0
~WAB2
Text Label 4550 2300 2    50   ~ 0
~RAB0
Text Label 4550 2400 2    50   ~ 0
~RAB1
Text Label 4550 2500 2    50   ~ 0
~RAB2
Wire Wire Line
	6650 3300 6100 3300
Text Label 6650 1100 2    50   ~ 0
DB[0..15]
Text Label 6650 3300 2    50   ~ 0
BUSCP
Wire Wire Line
	6100 3000 6650 3000
Text Label 4350 1500 0    50   ~ 0
~WDB0
Text Label 4350 1600 0    50   ~ 0
~WDB1
Text Label 6650 1000 2    50   ~ 0
AB[0..23]
Text Label 6650 1400 2    50   ~ 0
RADDR[0..4]
Text Label 6650 1500 2    50   ~ 0
WADDR[0..4]
Text Label 6650 1600 2    50   ~ 0
ACTION[0..3]
Text Label 4350 1900 0    50   ~ 0
~WCV0
Text Label 4350 2000 0    50   ~ 0
~WCV1
Text Label 4350 2100 0    50   ~ 0
~WCV2
Text Label 4350 1700 0    50   ~ 0
~WIB0
Text Label 4350 1800 0    50   ~ 0
~WIB1
Wire Wire Line
	6100 2900 6650 2900
Wire Wire Line
	6100 3100 6650 3100
Text Label 6650 2900 2    50   ~ 0
~CVOE
Text Label 6650 3100 2    50   ~ 0
~IBOE
Text Label 6650 1200 2    50   ~ 0
IBUS[0..15]
Text Label 4550 2800 2    50   ~ 0
~RIB0
Text Label 4550 2900 2    50   ~ 0
~RIB1
Text Label 4550 2600 2    50   ~ 0
~RDB0
Text Label 4550 2700 2    50   ~ 0
~RDB1
Text Label 4550 3000 2    50   ~ 0
~RCV0
Text Label 4550 3100 2    50   ~ 0
~RCV1
Text Label 4550 3200 2    50   ~ 0
~RCV2
Text Notes 1650 -1850 0    63   ~ 13
TO DO:
Text Notes 1650 -400 0    50   ~ 0
Done: Add replaceable pods for buses and MCU/clock.\nDone: Isolate front panel connector from rest of FPD.\nDone: Disable front panel during programming.\nDone: Disable serial port during programming.\nDone: Add configurable pull-ups on various signals.\nDone: Fix FTDI cable pin-out (swap RX/TX; likely ALREADY SWAPPED in R1943).\nDone: Add reset switch.\nDone: Add 1-2 more banks of DIP switches.\nDone: Left bus for peripherals.\nDone: Right bus for processor, memory and memory-mapped I/O.\nFix TTYD LED.\nFix activity LED.\nAdd front-panel switch LED.\nAdd PANELEN LED.\nAdd CFT IRQ LED.\nWeakly pull-up ALL MCU outputs!!!\nDone: Pull-up MCU ~RESET~
$Comp
L Device:CP_Small C?
U 1 1 609CAF2E
P -3150 5250
AR Path="/609CAF2E" Ref="C?"  Part="1" 
AR Path="/5D34E810/609CAF2E" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF2E" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF2E" Ref="C?"  Part="1" 
F 0 "C?" H -3238 5296 50  0000 R CNN
F 1 "47µF" H -3238 5205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -3150 5250 50  0001 C CNN
F 3 "~" H -3150 5250 50  0001 C CNN
	1    -3150 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF34
P -3150 5450
AR Path="/5F67D4B5/609CAF34" Ref="#PWR?"  Part="1" 
AR Path="/609CAF34" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF34" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF34" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF34" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF34" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -3150 5200 50  0001 C CNN
F 1 "GND" H -3228 5413 50  0000 R CNN
F 2 "" H -3150 5450 50  0001 C CNN
F 3 "" H -3150 5450 50  0001 C CNN
	1    -3150 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF3A
P -3150 5050
AR Path="/5F67D4B5/609CAF3A" Ref="#PWR?"  Part="1" 
AR Path="/609CAF3A" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF3A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF3A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF3A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF3A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -3150 4900 50  0001 C CNN
F 1 "+5V" H -3208 5087 50  0000 R CNN
F 2 "" H -3150 5050 50  0001 C CNN
F 3 "" H -3150 5050 50  0001 C CNN
	1    -3150 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3150 5050 -3150 5150
Wire Wire Line
	-3150 5350 -3150 5450
$Comp
L Device:CP_Small C?
U 1 1 609CAF42
P -2750 5250
AR Path="/609CAF42" Ref="C?"  Part="1" 
AR Path="/5D34E810/609CAF42" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF42" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF42" Ref="C?"  Part="1" 
F 0 "C?" H -2838 5296 50  0000 R CNN
F 1 "47µF" H -2838 5205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2750 5250 50  0001 C CNN
F 3 "~" H -2750 5250 50  0001 C CNN
	1    -2750 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF48
P -2750 5450
AR Path="/5F67D4B5/609CAF48" Ref="#PWR?"  Part="1" 
AR Path="/609CAF48" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF48" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF48" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF48" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF48" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -2750 5200 50  0001 C CNN
F 1 "GND" H -2828 5413 50  0000 R CNN
F 2 "" H -2750 5450 50  0001 C CNN
F 3 "" H -2750 5450 50  0001 C CNN
	1    -2750 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF4E
P -2750 5050
AR Path="/5F67D4B5/609CAF4E" Ref="#PWR?"  Part="1" 
AR Path="/609CAF4E" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF4E" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF4E" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF4E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF4E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -2750 4900 50  0001 C CNN
F 1 "+5V" H -2808 5087 50  0000 R CNN
F 2 "" H -2750 5050 50  0001 C CNN
F 3 "" H -2750 5050 50  0001 C CNN
	1    -2750 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2750 5050 -2750 5150
Wire Wire Line
	-2750 5350 -2750 5450
$Comp
L Device:CP_Small C?
U 1 1 609CAF56
P -2300 5250
AR Path="/609CAF56" Ref="C?"  Part="1" 
AR Path="/5D34E810/609CAF56" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF56" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF56" Ref="C?"  Part="1" 
F 0 "C?" H -2388 5296 50  0000 R CNN
F 1 "47µF" H -2388 5205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2300 5250 50  0001 C CNN
F 3 "~" H -2300 5250 50  0001 C CNN
	1    -2300 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF5C
P -2300 5450
AR Path="/5F67D4B5/609CAF5C" Ref="#PWR?"  Part="1" 
AR Path="/609CAF5C" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF5C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF5C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF5C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF5C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -2300 5200 50  0001 C CNN
F 1 "GND" H -2378 5413 50  0000 R CNN
F 2 "" H -2300 5450 50  0001 C CNN
F 3 "" H -2300 5450 50  0001 C CNN
	1    -2300 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF62
P -2300 5050
AR Path="/5F67D4B5/609CAF62" Ref="#PWR?"  Part="1" 
AR Path="/609CAF62" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF62" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF62" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF62" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF62" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -2300 4900 50  0001 C CNN
F 1 "+5V" H -2358 5087 50  0000 R CNN
F 2 "" H -2300 5050 50  0001 C CNN
F 3 "" H -2300 5050 50  0001 C CNN
	1    -2300 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2300 5050 -2300 5150
Wire Wire Line
	-2300 5350 -2300 5450
$Comp
L Device:CP_Small C?
U 1 1 609CAF6A
P -1900 5250
AR Path="/609CAF6A" Ref="C?"  Part="1" 
AR Path="/5D34E810/609CAF6A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF6A" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF6A" Ref="C?"  Part="1" 
F 0 "C?" H -1988 5296 50  0000 R CNN
F 1 "47µF" H -1988 5205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -1900 5250 50  0001 C CNN
F 3 "~" H -1900 5250 50  0001 C CNN
	1    -1900 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF70
P -1900 5450
AR Path="/5F67D4B5/609CAF70" Ref="#PWR?"  Part="1" 
AR Path="/609CAF70" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF70" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF70" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF70" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF70" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -1900 5200 50  0001 C CNN
F 1 "GND" H -1978 5413 50  0000 R CNN
F 2 "" H -1900 5450 50  0001 C CNN
F 3 "" H -1900 5450 50  0001 C CNN
	1    -1900 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF76
P -1900 5050
AR Path="/5F67D4B5/609CAF76" Ref="#PWR?"  Part="1" 
AR Path="/609CAF76" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF76" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF76" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF76" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF76" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -1900 4900 50  0001 C CNN
F 1 "+5V" H -1958 5087 50  0000 R CNN
F 2 "" H -1900 5050 50  0001 C CNN
F 3 "" H -1900 5050 50  0001 C CNN
	1    -1900 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1900 5050 -1900 5150
Wire Wire Line
	-1900 5350 -1900 5450
$Comp
L Device:CP_Small C?
U 1 1 609CAF7E
P -1450 5250
AR Path="/609CAF7E" Ref="C?"  Part="1" 
AR Path="/5D34E810/609CAF7E" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF7E" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF7E" Ref="C?"  Part="1" 
F 0 "C?" H -1538 5296 50  0000 R CNN
F 1 "47µF" H -1538 5205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -1450 5250 50  0001 C CNN
F 3 "~" H -1450 5250 50  0001 C CNN
	1    -1450 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF84
P -1450 5450
AR Path="/5F67D4B5/609CAF84" Ref="#PWR?"  Part="1" 
AR Path="/609CAF84" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF84" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF84" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF84" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF84" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -1450 5200 50  0001 C CNN
F 1 "GND" H -1528 5413 50  0000 R CNN
F 2 "" H -1450 5450 50  0001 C CNN
F 3 "" H -1450 5450 50  0001 C CNN
	1    -1450 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF8A
P -1450 5050
AR Path="/5F67D4B5/609CAF8A" Ref="#PWR?"  Part="1" 
AR Path="/609CAF8A" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF8A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF8A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF8A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF8A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -1450 4900 50  0001 C CNN
F 1 "+5V" H -1508 5087 50  0000 R CNN
F 2 "" H -1450 5050 50  0001 C CNN
F 3 "" H -1450 5050 50  0001 C CNN
	1    -1450 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1450 5050 -1450 5150
Wire Wire Line
	-1450 5350 -1450 5450
$Comp
L Device:CP_Small C?
U 1 1 609CAF92
P -1050 5250
AR Path="/609CAF92" Ref="C?"  Part="1" 
AR Path="/5D34E810/609CAF92" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF92" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF92" Ref="C?"  Part="1" 
F 0 "C?" H -1138 5296 50  0000 R CNN
F 1 "47µF" H -1138 5205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -1050 5250 50  0001 C CNN
F 3 "~" H -1050 5250 50  0001 C CNN
	1    -1050 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF98
P -1050 5450
AR Path="/5F67D4B5/609CAF98" Ref="#PWR?"  Part="1" 
AR Path="/609CAF98" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF98" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF98" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF98" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF98" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -1050 5200 50  0001 C CNN
F 1 "GND" H -1128 5413 50  0000 R CNN
F 2 "" H -1050 5450 50  0001 C CNN
F 3 "" H -1050 5450 50  0001 C CNN
	1    -1050 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF9E
P -1050 5050
AR Path="/5F67D4B5/609CAF9E" Ref="#PWR?"  Part="1" 
AR Path="/609CAF9E" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/609CAF9E" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF9E" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF9E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF9E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -1050 4900 50  0001 C CNN
F 1 "+5V" H -1108 5087 50  0000 R CNN
F 2 "" H -1050 5050 50  0001 C CNN
F 3 "" H -1050 5050 50  0001 C CNN
	1    -1050 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1050 5050 -1050 5150
Wire Wire Line
	-1050 5350 -1050 5450
Text Label 8450 2400 2    50   ~ 0
~IO
Text Label 8450 2300 2    50   ~ 0
~MEM
Wire Wire Line
	7900 2600 8550 2600
Wire Wire Line
	7900 2500 8550 2500
Wire Wire Line
	7900 2400 8550 2400
Wire Wire Line
	7900 2300 8550 2300
Text Label 8450 2500 2    50   ~ 0
~R
Wire Wire Line
	7900 2000 8550 2000
Text Label 8450 2000 2    50   ~ 0
~IODEV1xx
$Comp
L alexios:74LVC1G07 U?
U 1 1 64333C23
P 7250 9100
AR Path="/64333C23" Ref="U?"  Part="1" 
AR Path="/60757845/64333C23" Ref="U?"  Part="1" 
F 0 "U?" H 7350 9200 50  0000 L CNN
F 1 "74LVC1G07" H 6750 9050 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7350 9100 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 7350 9100 50  0001 C CNN
	1    7250 9100
	1    0    0    -1  
$EndComp
Text Label 6500 9100 0    50   ~ 0
~FPIRQ
Text Label 6500 9700 0    50   ~ 0
FPFETCH∕~EXEC
Text Label 8950 9700 2    50   ~ 0
~LED-EXEC
$Comp
L alexios:74LVC1G04 U?
U 1 1 64333CAB
P 7500 9950
AR Path="/64333CAB" Ref="U?"  Part="1" 
AR Path="/60757845/64333CAB" Ref="U?"  Part="1" 
F 0 "U?" H 7450 9775 50  0000 C CNN
F 1 "74LVC1G04" H 7450 9684 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7500 9950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 7500 9950 50  0001 C CNN
	1    7500 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 9700 7100 9950
Wire Wire Line
	7100 9950 7200 9950
Connection ~ 7100 9700
Wire Wire Line
	7100 9700 8950 9700
Wire Wire Line
	7700 9950 8950 9950
Text Label 8950 9950 2    50   ~ 0
~LED-FETCH
Wire Wire Line
	6500 9700 7100 9700
$Comp
L power:GND #PWR?
U 1 1 64333D1D
P 9500 9300
AR Path="/64333D1D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333D1D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 9050 50  0001 C CNN
F 1 "GND" H 9505 9127 50  0000 C CNN
F 2 "" H 9500 9300 50  0001 C CNN
F 3 "" H 9500 9300 50  0001 C CNN
	1    9500 9300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64333D23
P 9500 9100
AR Path="/64333D23" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333D23" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 8950 50  0001 C CNN
F 1 "+5V" H 9515 9273 50  0000 C CNN
F 2 "" H 9500 9100 50  0001 C CNN
F 3 "" H 9500 9100 50  0001 C CNN
	1    9500 9100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 64333D29
P 9500 9200
AR Path="/64333D29" Ref="C?"  Part="1" 
AR Path="/60757845/64333D29" Ref="C?"  Part="1" 
F 0 "C?" H 9409 9246 50  0000 R CNN
F 1 "100nF" H 9409 9155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9500 9200 50  0001 C CNN
F 3 "~" H 9500 9200 50  0001 C CNN
	1    9500 9200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G07 U?
U 2 1 64333D2F
P 9850 9800
AR Path="/64333D2F" Ref="U?"  Part="2" 
AR Path="/60757845/64333D2F" Ref="U?"  Part="2" 
F 0 "U?" H 10030 9746 50  0000 L CNN
F 1 "74LVC1G07" H 10030 9655 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9950 9800 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9950 9800 50  0001 C CNN
	2    9850 9800
	1    0    0    -1  
$EndComp
Connection ~ 9500 9300
Connection ~ 9500 9100
$Comp
L power:GND #PWR?
U 1 1 64333D37
P 9500 10000
AR Path="/64333D37" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333D37" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 9750 50  0001 C CNN
F 1 "GND" H 9505 9827 50  0000 C CNN
F 2 "" H 9500 10000 50  0001 C CNN
F 3 "" H 9500 10000 50  0001 C CNN
	1    9500 10000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64333D3D
P 9500 9800
AR Path="/64333D3D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333D3D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 9650 50  0001 C CNN
F 1 "+5V" H 9515 9973 50  0000 C CNN
F 2 "" H 9500 9800 50  0001 C CNN
F 3 "" H 9500 9800 50  0001 C CNN
	1    9500 9800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 64333D43
P 9500 9900
AR Path="/64333D43" Ref="C?"  Part="1" 
AR Path="/60757845/64333D43" Ref="C?"  Part="1" 
F 0 "C?" H 9409 9946 50  0000 R CNN
F 1 "100nF" H 9409 9855 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9500 9900 50  0001 C CNN
F 3 "~" H 9500 9900 50  0001 C CNN
	1    9500 9900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G07 U?
U 2 1 64333D49
P 11300 9100
AR Path="/64333D49" Ref="U?"  Part="2" 
AR Path="/60757845/64333D49" Ref="U?"  Part="2" 
F 0 "U?" H 11480 9046 50  0000 L CNN
F 1 "74LVC1G07" H 11480 8955 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 11400 9100 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 11400 9100 50  0001 C CNN
	2    11300 9100
	1    0    0    -1  
$EndComp
Connection ~ 9500 10000
Connection ~ 9500 9800
$Comp
L power:GND #PWR?
U 1 1 64333D51
P 10950 9300
AR Path="/64333D51" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333D51" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10950 9050 50  0001 C CNN
F 1 "GND" H 10955 9127 50  0000 C CNN
F 2 "" H 10950 9300 50  0001 C CNN
F 3 "" H 10950 9300 50  0001 C CNN
	1    10950 9300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64333D57
P 10950 9100
AR Path="/64333D57" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333D57" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10950 8950 50  0001 C CNN
F 1 "+5V" H 10965 9273 50  0000 C CNN
F 2 "" H 10950 9100 50  0001 C CNN
F 3 "" H 10950 9100 50  0001 C CNN
	1    10950 9100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 64333D5D
P 10950 9200
AR Path="/64333D5D" Ref="C?"  Part="1" 
AR Path="/60757845/64333D5D" Ref="C?"  Part="1" 
F 0 "C?" H 10859 9246 50  0000 R CNN
F 1 "100nF" H 10859 9155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10950 9200 50  0001 C CNN
F 3 "~" H 10950 9200 50  0001 C CNN
	1    10950 9200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G07 U?
U 2 1 64333D63
P 12750 9800
AR Path="/64333D63" Ref="U?"  Part="2" 
AR Path="/60757845/64333D63" Ref="U?"  Part="2" 
F 0 "U?" H 12930 9746 50  0000 L CNN
F 1 "74LVC1G07" H 12930 9655 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 12850 9800 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 12850 9800 50  0001 C CNN
	2    12750 9800
	1    0    0    -1  
$EndComp
Connection ~ 10950 9300
Connection ~ 10950 9100
$Comp
L alexios:74LVC1G04 U?
U 2 1 64333D6B
P 11300 9900
AR Path="/64333D6B" Ref="U?"  Part="2" 
AR Path="/60757845/64333D6B" Ref="U?"  Part="2" 
F 0 "U?" H 11480 9946 50  0000 L CNN
F 1 "74LVC1G04" H 11480 9855 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 11300 9900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 11300 9900 50  0001 C CNN
	2    11300 9900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 64333D71
P 10950 9900
AR Path="/64333D71" Ref="C?"  Part="1" 
AR Path="/60757845/64333D71" Ref="C?"  Part="1" 
F 0 "C?" H 10859 9946 50  0000 R CNN
F 1 "100nF" H 10859 9855 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10950 9900 50  0001 C CNN
F 3 "~" H 10950 9900 50  0001 C CNN
	1    10950 9900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64333D77
P 10950 9800
AR Path="/64333D77" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333D77" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10950 9650 50  0001 C CNN
F 1 "+5V" H 10965 9973 50  0000 C CNN
F 2 "" H 10950 9800 50  0001 C CNN
F 3 "" H 10950 9800 50  0001 C CNN
	1    10950 9800
	1    0    0    -1  
$EndComp
Connection ~ 10950 9800
$Comp
L power:GND #PWR?
U 1 1 64333D7E
P 10950 10000
AR Path="/64333D7E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333D7E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10950 9750 50  0001 C CNN
F 1 "GND" H 10955 9827 50  0000 C CNN
F 2 "" H 10950 10000 50  0001 C CNN
F 3 "" H 10950 10000 50  0001 C CNN
	1    10950 10000
	1    0    0    -1  
$EndComp
Connection ~ 10950 10000
Text Label 6500 9450 0    50   ~ 0
~FPHALT
Text Label 8950 9450 2    50   ~ 0
~HALT
Wire Wire Line
	7750 9450 8250 9450
$Comp
L alexios:74LVC1G07 U?
U 1 1 64333DB5
P 7250 9450
AR Path="/64333DB5" Ref="U?"  Part="1" 
AR Path="/60757845/64333DB5" Ref="U?"  Part="1" 
F 0 "U?" H 7350 9550 50  0000 L CNN
F 1 "74LVC1G07" H 6750 9350 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7350 9450 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 7350 9450 50  0001 C CNN
	1    7250 9450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64333DBB
P 12400 10000
AR Path="/64333DBB" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333DBB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 12400 9750 50  0001 C CNN
F 1 "GND" H 12405 9827 50  0000 C CNN
F 2 "" H 12400 10000 50  0001 C CNN
F 3 "" H 12400 10000 50  0001 C CNN
	1    12400 10000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64333DC1
P 12400 9800
AR Path="/64333DC1" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64333DC1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 12400 9650 50  0001 C CNN
F 1 "+5V" H 12415 9973 50  0000 C CNN
F 2 "" H 12400 9800 50  0001 C CNN
F 3 "" H 12400 9800 50  0001 C CNN
	1    12400 9800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 64333DC7
P 12400 9900
AR Path="/64333DC7" Ref="C?"  Part="1" 
AR Path="/60757845/64333DC7" Ref="C?"  Part="1" 
F 0 "C?" H 12491 9854 50  0000 L CNN
F 1 "100nF" H 12491 9945 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 12400 9900 50  0001 C CNN
F 3 "~" H 12400 9900 50  0001 C CNN
	1    12400 9900
	-1   0    0    1   
$EndComp
$Comp
L alexios:74LVC1G07 U?
U 2 1 64333DCD
P 9850 9100
AR Path="/64333DCD" Ref="U?"  Part="2" 
AR Path="/60757845/64333DCD" Ref="U?"  Part="2" 
F 0 "U?" H 10030 9046 50  0000 L CNN
F 1 "74LVC1G07" H 10030 8955 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9950 9100 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9950 9100 50  0001 C CNN
	2    9850 9100
	1    0    0    -1  
$EndComp
Connection ~ 12400 10000
Connection ~ 12400 9800
$Comp
L Device:R_Small R?
U 1 1 64333DD7
P 7750 9100
AR Path="/64333DD7" Ref="R?"  Part="1" 
AR Path="/60757845/64333DD7" Ref="R?"  Part="1" 
F 0 "R?" V 7854 9100 50  0000 C CNN
F 1 "30Ω" V 7945 9100 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7750 9100 50  0001 C CNN
F 3 "~" H 7750 9100 50  0001 C CNN
	1    7750 9100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64333DDF
P 7650 9450
AR Path="/64333DDF" Ref="R?"  Part="1" 
AR Path="/60757845/64333DDF" Ref="R?"  Part="1" 
F 0 "R?" V 7600 9650 50  0000 C CNN
F 1 "30Ω" V 7700 9650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7650 9450 50  0001 C CNN
F 3 "~" H 7650 9450 50  0001 C CNN
	1    7650 9450
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 64333DFC
P 8250 9450
AR Path="/64333DFC" Ref="TP?"  Part="1" 
AR Path="/60757845/64333DFC" Ref="TP?"  Part="1" 
F 0 "TP?" H 7950 9550 50  0000 L CNN
F 1 "TestPoint" V 8354 9522 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 8450 9450 50  0001 C CNN
F 3 "~" H 8450 9450 50  0001 C CNN
	1    8250 9450
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 9100 7050 9100
Connection ~ 8250 9450
Wire Wire Line
	8250 9450 8950 9450
Wire Wire Line
	6500 9450 7050 9450
Wire Wire Line
	7550 9100 7650 9100
Wire Wire Line
	1350 1000 800  1000
Text Label 800  1000 0    50   ~ 0
~RESET
Wire Wire Line
	1350 1100 800  1100
Text Label 800  1100 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	800  1200 1350 1200
Text Label 800  1200 0    50   ~ 0
~HALT
Wire Wire Line
	1350 1400 800  1400
Text Label 800  1400 0    50   ~ 0
FPCLKEN-IN
Wire Wire Line
	1350 1500 800  1500
Text Label 800  1500 0    50   ~ 0
FPµSTEP-IN
Wire Wire Line
	1350 1700 800  1700
Wire Wire Line
	1350 1800 800  1800
Wire Wire Line
	1350 1900 800  1900
Wire Wire Line
	1350 2000 800  2000
Wire Wire Line
	1350 2200 800  2200
Wire Wire Line
	1350 2400 800  2400
Wire Wire Line
	1350 2500 800  2500
Wire Wire Line
	1350 2600 800  2600
Wire Wire Line
	3050 1900 2500 1900
Wire Wire Line
	3050 2000 2500 2000
Wire Wire Line
	3050 2100 2500 2100
Wire Wire Line
	3050 2200 2500 2200
Wire Wire Line
	3050 2300 2500 2300
Wire Wire Line
	3050 2800 2500 2800
Wire Wire Line
	3050 2900 2500 2900
Wire Wire Line
	800  2900 1350 2900
Wire Wire Line
	3050 2500 2500 2500
Wire Wire Line
	3050 2600 2500 2600
Wire Wire Line
	800  3000 1350 3000
Wire Wire Line
	800  3100 1350 3100
Text Label 3050 2100 2    50   ~ 0
~IBOE
Text Label 3050 2200 2    50   ~ 0
~ABOE
Text Label 3050 2800 2    50   ~ 0
~LTSON
Text Label 3050 2900 2    50   ~ 0
~PANELEN
Text Label 800  2900 0    50   ~ 0
~LED-STOP
Text Label 3050 2500 2    50   ~ 0
MFD0
Text Label 3050 2600 2    50   ~ 0
MFD1
Wire Bus Line
	2500 3000 3050 3000
Wire Bus Line
	2500 3100 3050 3100
Text Label 3050 3000 2    50   ~ 0
SWA[0..3]
Text Label 3050 3100 2    50   ~ 0
SWD[0..3]
Text Label 800  3000 0    50   ~ 0
STEP∕~RUN
Text Label 800  3100 0    50   ~ 0
~µSTEP
$Sheet
S 3150 850  1150 3150
U 64FC7999
F0 "DFP I/O" 50
F1 "dfp_io.sch" 50
F2 "~WAB0" O R 4300 1200 50 
F3 "~WAB1" O R 4300 1300 50 
F4 "~WAB2" O R 4300 1400 50 
F5 "~WDB0" O R 4300 1500 50 
F6 "~WDB1" O R 4300 1600 50 
F7 "~WIB0" O R 4300 1700 50 
F8 "~WIB1" O R 4300 1800 50 
F9 "~WCV0" O R 4300 1900 50 
F10 "~WCV1" O R 4300 2000 50 
F11 "~WCV2" O R 4300 2100 50 
F12 "~RAB0" O R 4300 2300 50 
F13 "~RAB1" O R 4300 2400 50 
F14 "~RAB2" O R 4300 2500 50 
F15 "~RDB0" O R 4300 2600 50 
F16 "~RDB1" O R 4300 2700 50 
F17 "~RIB0" O R 4300 2800 50 
F18 "~RIB1" O R 4300 2900 50 
F19 "~RCV0" O R 4300 3000 50 
F20 "~RCV1" O R 4300 3100 50 
F21 "~RCV2" O R 4300 3200 50 
F22 "~WR" I L 3150 1200 50 
F23 "~RD" I L 3150 1300 50 
F24 "FPD[0..7]" I L 3150 1000 50 
F25 "~ORHOE" I R 4300 3350 50 
F26 "~ORLOE" I R 4300 3450 50 
F27 "FPA[0..7]" I L 3150 1100 50 
$EndSheet
Text Notes -2150 2900 0    100  ~ 20
Multi-Function Display
Text Label -450 4050 2    50   ~ 0
~FPSPLOE
Text Label -450 3950 2    50   ~ 0
~FPDRLOE
Text Label -450 3850 2    50   ~ 0
~ORLOE
Text Label -450 3450 2    50   ~ 0
~FPSPHOE
Text Label -450 3350 2    50   ~ 0
~FPDRHOE
Text Label -450 3250 2    50   ~ 0
~ORHOE
NoConn ~ -850 4150
Wire Wire Line
	-850 4050 -450 4050
Wire Wire Line
	-850 3950 -450 3950
Wire Wire Line
	-850 3850 -450 3850
NoConn ~ -850 3550
Wire Wire Line
	-850 3450 -450 3450
Wire Wire Line
	-850 3350 -450 3350
Wire Wire Line
	-850 3250 -450 3250
Text Label -2150 4150 0    50   ~ 0
~FPOE14
Wire Wire Line
	-1850 4150 -2150 4150
Text Label -2150 3550 0    50   ~ 0
~FPOE13
Text Label -2150 3950 0    50   ~ 0
MFD1
Text Label -2150 3850 0    50   ~ 0
MFD0
Wire Wire Line
	-1850 3950 -2150 3950
Wire Wire Line
	-1850 3850 -2150 3850
Text Label -2150 3350 0    50   ~ 0
MFD1
Text Label -2150 3250 0    50   ~ 0
MFD0
Wire Wire Line
	-1850 3550 -2150 3550
$Comp
L alexios:74HC139 U?
U 2 1 65B2476D
P -1350 3950
AR Path="/65B2476D" Ref="U?"  Part="2" 
AR Path="/60757845/65B2476D" Ref="U?"  Part="2" 
AR Path="/64FC7999/65B2476D" Ref="U?"  Part="2" 
F 0 "U?" H -1350 3575 50  0000 C CNN
F 1 "74HC139" H -1350 3484 50  0000 C CNN
F 2 "alexios:SOIC-16" H -1350 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -1350 3950 50  0001 C CNN
	2    -1350 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U?
U 1 1 65B24773
P -1350 3350
AR Path="/65B24773" Ref="U?"  Part="1" 
AR Path="/60757845/65B24773" Ref="U?"  Part="1" 
AR Path="/64FC7999/65B24773" Ref="U?"  Part="1" 
F 0 "U?" H -1350 3717 50  0000 C CNN
F 1 "74HC139" H -1350 3626 50  0000 C CNN
F 2 "alexios:SOIC-16" H -1350 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -1350 3350 50  0001 C CNN
	1    -1350 3350
	1    0    0    -1  
$EndComp
Text HLabel -2350 3250 0    50   Input ~ 0
MFD0
Wire Wire Line
	-2350 3250 -1850 3250
Text HLabel -2350 3350 0    50   Input ~ 0
MFD1
Wire Wire Line
	-2350 3350 -1850 3350
Text Notes -2400 -950 0    100  ~ 20
Front Panel\nAddress Decoder
Text Label -2950 -1850 0    50   ~ 0
FPA[0..7]
Text Label -600 -1850 2    50   ~ 0
~FPOE[0..31]
Text Label -2950 -1700 0    50   ~ 0
~PANELEN
$Comp
L alexios:74HC139 U?
U 3 1 65BD1B5E
P -3050 650
AR Path="/65BD1B5E" Ref="U?"  Part="3" 
AR Path="/60757845/65BD1B5E" Ref="U?"  Part="3" 
AR Path="/64FC7999/65BD1B5E" Ref="U?"  Part="3" 
F 0 "U?" H -2871 696 50  0000 L CNN
F 1 "74HC139" H -2871 605 50  0000 L CNN
F 2 "alexios:SOIC-16" H -3050 650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -3050 650 50  0001 C CNN
	3    -3050 650 
	1    0    0    -1  
$EndComp
Wire Bus Line
	-1250 -1700 -600 -1700
Text Label -1050 -1700 0    50   ~ 0
~ROW[1..5]
Wire Bus Line
	-2950 -1850 -2400 -1850
$Sheet
S -2400 -2000 1150 600 
U 65BD1B6F
F0 "sheet65BD1B09" 50
F1 "cft-dfp-scan.sch" 50
F2 "FPA[0..7]" I L -2400 -1850 50 
F3 "~FPOE[0..31]" O R -1250 -1850 50 
F4 "~ROW[1..5]" O R -1250 -1700 50 
F5 "~PANELEN" I L -2400 -1700 50 
F6 "~SCANCLR" I R -1250 -1550 50 
$EndSheet
Entry Bus Bus
	-550 -1850 -450 -1750
Wire Bus Line
	-1250 -1850 -550 -1850
Text Label -450 -900 3    50   ~ 0
~FPOE[0..31]
Entry Wire Line
	-550 400  -450 300 
$Comp
L Device:C_Small C?
U 1 1 65BD1B82
P -3350 1850
AR Path="/65BD1B82" Ref="C?"  Part="1" 
AR Path="/60757845/65BD1B82" Ref="C?"  Part="1" 
AR Path="/64FC7999/65BD1B82" Ref="C?"  Part="1" 
F 0 "C?" H -3441 1896 50  0000 R CNN
F 1 "100nF" H -3441 1805 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -3350 1850 50  0001 C CNN
F 3 "~" H -3350 1850 50  0001 C CNN
	1    -3350 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 65BD1B88
P -3350 1750
AR Path="/65BD1B88" Ref="#PWR?"  Part="1" 
AR Path="/60757845/65BD1B88" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65BD1B88" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -3350 1600 50  0001 C CNN
F 1 "+5V" H -3335 1923 50  0000 C CNN
F 2 "" H -3350 1750 50  0001 C CNN
F 3 "" H -3350 1750 50  0001 C CNN
	1    -3350 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 65BD1B8E
P -3350 1950
AR Path="/65BD1B8E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/65BD1B8E" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65BD1B8E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -3350 1700 50  0001 C CNN
F 1 "GND" H -3345 1777 50  0000 C CNN
F 2 "" H -3350 1950 50  0001 C CNN
F 3 "" H -3350 1950 50  0001 C CNN
	1    -3350 1950
	1    0    0    -1  
$EndComp
Connection ~ -3350 1750
$Comp
L alexios:74HC540 U?
U 2 1 65BD1B95
P -3000 1850
AR Path="/65BD1B95" Ref="U?"  Part="2" 
AR Path="/60757845/65BD1B95" Ref="U?"  Part="2" 
AR Path="/64FC7999/65BD1B95" Ref="U?"  Part="2" 
F 0 "U?" H -2821 1896 50  0000 L CNN
F 1 "74HC540" H -2821 1805 50  0000 L CNN
F 2 "alexios:SOIC-20W" H -3000 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC540" H -3000 1850 50  0001 C CNN
	2    -3000 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 65BD1B9B
P -3400 650
AR Path="/65BD1B9B" Ref="C?"  Part="1" 
AR Path="/60757845/65BD1B9B" Ref="C?"  Part="1" 
AR Path="/64FC7999/65BD1B9B" Ref="C?"  Part="1" 
F 0 "C?" H -3491 696 50  0000 R CNN
F 1 "100nF" H -3491 605 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -3400 650 50  0001 C CNN
F 3 "~" H -3400 650 50  0001 C CNN
	1    -3400 650 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 65BD1BA1
P -3400 550
AR Path="/65BD1BA1" Ref="#PWR?"  Part="1" 
AR Path="/60757845/65BD1BA1" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65BD1BA1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -3400 400 50  0001 C CNN
F 1 "+5V" H -3385 723 50  0000 C CNN
F 2 "" H -3400 550 50  0001 C CNN
F 3 "" H -3400 550 50  0001 C CNN
	1    -3400 550 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 65BD1BA7
P -3400 750
AR Path="/65BD1BA7" Ref="#PWR?"  Part="1" 
AR Path="/60757845/65BD1BA7" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65BD1BA7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -3400 500 50  0001 C CNN
F 1 "GND" H -3395 577 50  0000 C CNN
F 2 "" H -3400 750 50  0001 C CNN
F 3 "" H -3400 750 50  0001 C CNN
	1    -3400 750 
	1    0    0    -1  
$EndComp
Connection ~ -3400 550 
Connection ~ -3400 750 
Wire Wire Line
	-1250 -1550 -1050 -1550
Text Label -600 -1550 2    50   ~ 0
~SCANCLR
Wire Wire Line
	-550 400  -2300 400 
Wire Wire Line
	-2300 400  -2300 2050
Text Label -600 400  2    50   ~ 0
~FPOE16
Entry Wire Line
	-550 200  -450 100 
Wire Wire Line
	-550 200  -950 200 
Text Label -600 200  2    50   ~ 0
~FPOE31
$Comp
L Connector:TestPoint TP?
U 1 1 65BD1BB9
P -950 200
AR Path="/65BD1BB9" Ref="TP?"  Part="1" 
AR Path="/60757845/65BD1BB9" Ref="TP?"  Part="1" 
AR Path="/64FC7999/65BD1BB9" Ref="TP?"  Part="1" 
F 0 "TP?" V -950 388 50  0000 L CNN
F 1 "TestPoint" V -846 272 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -750 200 50  0001 C CNN
F 3 "~" H -750 200 50  0001 C CNN
	1    -950 200 
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 65BD1BBF
P -1050 -1550
AR Path="/65BD1BBF" Ref="TP?"  Part="1" 
AR Path="/60757845/65BD1BBF" Ref="TP?"  Part="1" 
AR Path="/64FC7999/65BD1BBF" Ref="TP?"  Part="1" 
F 0 "TP?" H -1400 -1400 50  0000 L CNN
F 1 "TestPoint" V -946 -1478 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -850 -1550 50  0001 C CNN
F 3 "~" H -850 -1550 50  0001 C CNN
	1    -1050 -1550
	-1   0    0    1   
$EndComp
Connection ~ -1050 -1550
Wire Wire Line
	-1050 -1550 -600 -1550
Connection ~ -3350 1950
Wire Wire Line
	-2300 2050 -1700 2050
Text Label -2100 1350 0    50   ~ 0
~LED-STOP
Text Label -2100 1150 0    50   ~ 0
~RSTHOLD
Text Label -2100 1750 0    50   ~ 0
~IRQS
$Comp
L alexios:74HC540 U?
U 1 1 65BD1BCC
P -1200 1650
AR Path="/65BD1BCC" Ref="U?"  Part="1" 
AR Path="/60757845/65BD1BCC" Ref="U?"  Part="1" 
AR Path="/64FC7999/65BD1BCC" Ref="U?"  Part="1" 
F 0 "U?" H -1200 2417 50  0000 C CNN
F 1 "74HC540" H -1200 2326 50  0000 C CNN
F 2 "alexios:SOIC-20W" H -1200 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC540" H -1200 1650 50  0001 C CNN
	1    -1200 1650
	1    0    0    -1  
$EndComp
Text Label -2100 1250 0    50   ~ 0
STEP∕~RUN
Wire Wire Line
	-1750 2150 -1750 1850
Wire Wire Line
	-1700 2150 -1750 2150
Wire Wire Line
	-1750 1850 -1700 1850
Connection ~ -1750 2150
Wire Wire Line
	-1750 2200 -1750 2150
$Comp
L power:GND #PWR?
U 1 1 65BD1BD8
P -1750 2200
AR Path="/65BD1BD8" Ref="#PWR?"  Part="1" 
AR Path="/60757845/65BD1BD8" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65BD1BD8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -1750 1950 50  0001 C CNN
F 1 "GND" H -1745 2027 50  0000 C CNN
F 2 "" H -1750 2200 50  0001 C CNN
F 3 "" H -1750 2200 50  0001 C CNN
	1    -1750 2200
	1    0    0    -1  
$EndComp
Text Label -2100 1650 0    50   ~ 0
~LED-EXEC
Text Label -2100 1550 0    50   ~ 0
~LED-FETCH
Text Label -2100 1450 0    50   ~ 0
~WS
Wire Wire Line
	-1700 1750 -2100 1750
Wire Wire Line
	-1700 1650 -2100 1650
Wire Wire Line
	-1700 1550 -2100 1550
Wire Wire Line
	-1700 1450 -2100 1450
Wire Wire Line
	-1700 1350 -2100 1350
Wire Wire Line
	-1700 1250 -2100 1250
Wire Wire Line
	-1700 1150 -2100 1150
Text Label -450 1850 2    50   ~ 0
FPD7
Text Label -450 1750 2    50   ~ 0
FPD6
Text Label -450 1650 2    50   ~ 0
FPD5
Text Label -450 1550 2    50   ~ 0
FPD4
Text Label -450 1450 2    50   ~ 0
FPD3
Text Label -450 1350 2    50   ~ 0
FPD2
Text Label -450 1250 2    50   ~ 0
FPD1
Text Label -450 1150 2    50   ~ 0
FPD0
Wire Wire Line
	-700 1850 -450 1850
Wire Wire Line
	-700 1750 -450 1750
Wire Wire Line
	-700 1650 -450 1650
Wire Wire Line
	-700 1550 -450 1550
Wire Wire Line
	-700 1450 -450 1450
Wire Wire Line
	-700 1350 -450 1350
Wire Wire Line
	-700 1250 -450 1250
Wire Wire Line
	-700 1150 -450 1150
Text Label -2100 2050 0    50   ~ 0
~FPOE16
Text Notes -2250 750  0    100  ~ 20
State Lights (~FPOE16~)
Wire Wire Line
	4300 2300 4950 2300
Wire Wire Line
	4300 2400 4950 2400
Wire Wire Line
	4300 2500 4950 2500
Wire Wire Line
	4300 3000 4950 3000
Wire Wire Line
	4300 3100 4950 3100
Wire Wire Line
	4300 3200 4950 3200
Wire Wire Line
	4300 2600 4950 2600
Wire Wire Line
	4300 2700 4950 2700
Wire Wire Line
	4300 2800 4950 2800
Wire Wire Line
	4300 2900 4950 2900
Wire Wire Line
	4300 1200 4950 1200
Wire Wire Line
	4300 1300 4950 1300
Wire Wire Line
	4300 1400 4950 1400
Wire Wire Line
	4300 1500 4950 1500
Wire Wire Line
	4300 1600 4950 1600
Wire Wire Line
	4300 1700 4950 1700
Wire Wire Line
	4300 1800 4950 1800
Wire Wire Line
	4300 1900 4950 1900
Wire Wire Line
	4300 2000 4950 2000
Wire Wire Line
	4300 2100 4950 2100
$Sheet
S 4950 850  1150 2600
U 66CDCD87
F0 "Bus Pods" 50
F1 "pods.sch" 50
F2 "FPD[0..7]" B L 4950 1000 50 
F3 "BUSCP" I R 6100 3300 50 
F4 "~RAB0" I L 4950 2300 50 
F5 "~RAB1" I L 4950 2400 50 
F6 "~RAB2" I L 4950 2500 50 
F7 "~WAB0" I L 4950 1200 50 
F8 "~WAB1" I L 4950 1300 50 
F9 "~WAB2" I L 4950 1400 50 
F10 "~RCV0" I L 4950 3000 50 
F11 "~RCV1" I L 4950 3100 50 
F12 "~RCV2" I L 4950 3200 50 
F13 "~WCV0" I L 4950 1900 50 
F14 "~WCV1" I L 4950 2000 50 
F15 "~WCV2" I L 4950 2100 50 
F16 "~RDB0" I L 4950 2600 50 
F17 "~RDB1" I L 4950 2700 50 
F18 "~WDB0" I L 4950 1500 50 
F19 "~WDB1" I L 4950 1600 50 
F20 "~RIB0" I L 4950 2800 50 
F21 "~RIB1" I L 4950 2900 50 
F22 "~WIB0" I L 4950 1700 50 
F23 "~WIB1" I L 4950 1800 50 
F24 "AB[0..23]" B R 6100 1000 50 
F25 "RADDR[0..4]" B R 6100 1400 50 
F26 "WADDR[0..4]" B R 6100 1500 50 
F27 "ACTION[0..3]" B R 6100 1600 50 
F28 "DB[0..15]" B R 6100 1100 50 
F29 "IBUS[0..15]" B R 6100 1200 50 
F30 "~ABOE" I R 6100 2800 50 
F31 "~CVOE" I R 6100 3100 50 
F32 "~DBOE" I R 6100 3000 50 
F33 "~IBOE" I R 6100 2900 50 
$EndSheet
Text Label 3050 2000 2    50   ~ 0
~CVOE
Text Label 3050 1900 2    50   ~ 0
BUSCP
Text Label 3050 1300 2    50   ~ 0
~RD
Text Label 3050 1200 2    50   ~ 0
~WR
Text Label 3050 1100 2    50   ~ 0
FPA[0..7]
Text Label 3050 1000 2    50   ~ 0
FPD[0..7]
$Sheet
S 1350 850  1150 2700
U 60757845
F0 "Microcontroller" 50
F1 "microcontroller.sch" 50
F2 "FPD[0..7]" B R 2500 1000 50 
F3 "FPA[0..7]" B R 2500 1100 50 
F4 "~FPHALT" O L 1350 1200 50 
F5 "~FPRAM~∕ROM" O L 1350 2200 50 
F6 "FPCLKEN-IN" O L 1350 1400 50 
F7 "FPµSTEP-IN" O L 1350 1500 50 
F8 "BUSCP" O R 2500 1900 50 
F9 "~MEM" T L 1350 1700 50 
F10 "~IO" T L 1350 1800 50 
F11 "~R" T L 1350 1900 50 
F12 "~W" T L 1350 2000 50 
F13 "CLRWS" O L 1350 2600 50 
F14 "~IBOE" O R 2500 2100 50 
F15 "~ABOE" O R 2500 2200 50 
F16 "~DBOE" O R 2500 2300 50 
F17 "~IOINT" I L 1350 2400 50 
F18 "~WAIT" O L 1350 2500 50 
F19 "~LTSON" O R 2500 2800 50 
F20 "~PANELEN" O R 2500 2900 50 
F21 "~µSTEP" O L 1350 3100 50 
F22 "SWA[0..3]" O R 2500 3000 50 
F23 "SWD[0..3]" O R 2500 3100 50 
F24 "~CVOE" O R 2500 2000 50 
F25 "~FPRESET" O L 1350 1000 50 
F26 "~FPRSTHOLD" O L 1350 1100 50 
F27 "~FPIRQ" O L 1350 2700 50 
F28 "STEP∕~RUN" O L 1350 3000 50 
F29 "~LED-STOP" O L 1350 2900 50 
F30 "MFD0" O R 2500 2500 50 
F31 "MFD1" O R 2500 2600 50 
F32 "~WR" O R 2500 1200 50 
F33 "~RD" O R 2500 1300 50 
F34 "~LCLKEN" O L 1350 3250 50 
$EndSheet
Wire Wire Line
	1350 2700 800  2700
Wire Wire Line
	8000 9100 8150 9100
Connection ~ 8000 9100
$Comp
L Connector:TestPoint TP?
U 1 1 64333DF6
P 8000 9100
AR Path="/64333DF6" Ref="TP?"  Part="1" 
AR Path="/60757845/64333DF6" Ref="TP?"  Part="1" 
F 0 "TP?" H 7900 9000 50  0000 L CNN
F 1 "TestPoint" V 8104 9172 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 8200 9100 50  0001 C CNN
F 3 "~" H 8200 9100 50  0001 C CNN
	1    8000 9100
	-1   0    0    1   
$EndComp
Connection ~ 8150 9100
Wire Wire Line
	7850 9100 8000 9100
Text Label 8950 9200 2    50   ~ 0
~IRQ6
Text Label 8950 9100 2    50   ~ 0
~IRQ7
Text Label 8950 9300 2    50   ~ 0
~IRQ
Wire Wire Line
	8700 9200 8950 9200
Wire Wire Line
	8700 9100 8950 9100
Wire Wire Line
	8700 9300 8950 9300
Wire Wire Line
	8150 9200 8150 9300
Connection ~ 8150 9200
Wire Wire Line
	8200 9200 8150 9200
Wire Wire Line
	8150 9100 8200 9100
Wire Wire Line
	8150 9300 8200 9300
Wire Wire Line
	8150 9100 8150 9200
$Comp
L Connector_Generic:Conn_02x03_Odd_Even JP?
U 1 1 64333C29
P 8400 9200
AR Path="/64333C29" Ref="JP?"  Part="1" 
AR Path="/60757845/64333C29" Ref="JP?"  Part="1" 
F 0 "JP?" H 8450 9425 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 8450 9426 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 8400 9200 50  0001 C CNN
F 3 "~" H 8400 9200 50  0001 C CNN
	1    8400 9200
	1    0    0    -1  
$EndComp
Text Label 800  2700 0    50   ~ 0
~FPIRQ
Text Label 800  2600 0    50   ~ 0
CLRWS
Text Label 800  2500 0    50   ~ 0
~WAIT
Text Label 800  2400 0    50   ~ 0
~IOINT
Text Label 6650 3000 2    50   ~ 0
~DBOE1
Text Label 3050 2300 2    50   ~ 0
~DBOE0
Text Label 8450 1900 2    50   ~ 0
~SYSDEV
Wire Wire Line
	7900 2200 8550 2200
Wire Wire Line
	7900 2100 8550 2100
Text Label 8450 2100 2    50   ~ 0
~IODEV2xx
Text Label 8450 2200 2    50   ~ 0
~IODEV3xx
Text Label 800  1700 0    50   ~ 0
~MEM
Text Label 800  1800 0    50   ~ 0
~IO
Text Label 800  1900 0    50   ~ 0
~R
Text Label 800  2000 0    50   ~ 0
~W
Text Label 800  2200 0    50   ~ 0
~FPRAM~∕ROM
Wire Wire Line
	-2950 -1700 -2400 -1700
Text Label 8450 1000 2    50   ~ 0
~RESET
Text Label 8450 1100 2    50   ~ 0
~RSTHOLD
Text Label 8450 1200 2    50   ~ 0
CLK1
Text Label 8450 1300 2    50   ~ 0
CLK2
Text Label 8450 1400 2    50   ~ 0
CLK3
Text Label 8450 1500 2    50   ~ 0
CLK4
Text Label 8450 1600 2    50   ~ 0
T34
Text Label 8450 1700 2    50   ~ 0
~IRQ
Text Label 8450 1800 2    50   ~ 0
~IRQS
Text Label 8500 3600 2    50   ~ 0
CFT-FPD[0..7]
Wire Bus Line
	8550 3600 7900 3600
Text Label 8650 4450 2    50   ~ 0
~FPOE[0..31]
Wire Bus Line
	7900 4450 8650 4450
Wire Bus Line
	8550 2800 7900 2800
Text Label 8400 2800 2    50   ~ 0
~IRQ[0..7]
$Sheet
S 8550 850  1150 3300
U 60A2F3C0
F0 "sheet60A2F295" 50
F1 "cft-dfp-bushold.sch" 50
F2 "FPD[0..7]" U L 8550 3900 50 
F3 "CLK1" U L 8550 1200 50 
F4 "CLK2" U L 8550 1300 50 
F5 "CLK3" U L 8550 1400 50 
F6 "CLK4" U L 8550 1500 50 
F7 "T34" U L 8550 1600 50 
F8 "~MEM" U L 8550 2300 50 
F9 "~IO" U L 8550 2400 50 
F10 "~R" U L 8550 2500 50 
F11 "~W" U L 8550 2600 50 
F12 "~IODEV1xx" U L 8550 2000 50 
F13 "~SYSDEV" U L 8550 1900 50 
F14 "~IODEV2xx" U L 8550 2100 50 
F15 "~PANELEN" I L 8550 4000 50 
F16 "~IODEV3xx" U L 8550 2200 50 
F17 "CFT-FPD[0..7]" I L 8550 3600 50 
F18 "~IRQ[0..7]" I L 8550 2800 50 
F19 "~IRQ" U L 8550 1700 50 
F20 "~IRQS" U L 8550 1800 50 
$EndSheet
Text Notes 9250 3300 1    100  ~ 20
Pull-Up & Conditioning
Text Label 8450 2600 2    50   ~ 0
~W
Wire Wire Line
	7900 1200 8550 1200
Wire Wire Line
	7900 1300 8550 1300
Wire Wire Line
	7900 1400 8550 1400
Wire Wire Line
	7900 1500 8550 1500
Wire Wire Line
	7900 1600 8550 1600
Wire Wire Line
	7900 1700 8550 1700
Wire Wire Line
	7900 1800 8550 1800
Wire Wire Line
	7900 1900 8550 1900
Wire Wire Line
	7900 3000 8450 3000
Wire Wire Line
	7900 3100 8450 3100
Wire Wire Line
	7900 3200 8450 3200
Wire Wire Line
	7900 3300 8450 3300
Wire Wire Line
	7900 3400 8450 3400
Text Label 8450 3000 2    50   ~ 0
~WS
Text Label 8450 3100 2    50   ~ 0
~WAITING
Text Label 8450 3200 2    50   ~ 0
~HALT
Text Label 8450 3300 2    50   ~ 0
~ENDEXT
Text Label 8450 3400 2    50   ~ 0
~SKIPEXT
$Sheet
S 6750 850  1150 4200
U 5FE640D1
F0 "Edge Connectors" 50
F1 "edge_connectors.sch" 50
F2 "~RESET" U R 7900 1000 50 
F3 "CLK1" U R 7900 1200 50 
F4 "CLK2" U R 7900 1300 50 
F5 "CLK3" U R 7900 1400 50 
F6 "CLK4" U R 7900 1500 50 
F7 "T34" U R 7900 1600 50 
F8 "~IRQ" U R 7900 1700 50 
F9 "~IRQS" U R 7900 1800 50 
F10 "AB[0..23]" U L 6750 1000 50 
F11 "DB[0..15]" U L 6750 1100 50 
F12 "CFT-FPD[0..7]" U R 7900 3600 50 
F13 "IBUS[0..15]" U L 6750 1200 50 
F14 "~IRQ[0..7]" U R 7900 2800 50 
F15 "ACTION[0..3]" U L 6750 1600 50 
F16 "WADDR[0..4]" U L 6750 1500 50 
F17 "RADDR[0..4]" U L 6750 1400 50 
F18 "RSVD[0..6]" U R 7900 3700 50 
F19 "~RSTHOLD" U R 7900 1100 50 
F20 "~SYSDEV" U R 7900 1900 50 
F21 "~IODEV1xx" U R 7900 2000 50 
F22 "~IODEV2xx" U R 7900 2100 50 
F23 "~IODEV3xx" U R 7900 2200 50 
F24 "~MEM" U R 7900 2300 50 
F25 "~IO" U R 7900 2400 50 
F26 "~R" U R 7900 2500 50 
F27 "~W" U R 7900 2600 50 
F28 "~WS" U R 7900 3000 50 
F29 "FPA[0..1]" I L 6750 4050 50 
F30 "~ROW[1..5]" I L 6750 4150 50 
F31 "SWA[0..3]" I L 6750 4250 50 
F32 "SWD[0..3]" I L 6750 4350 50 
F33 "RXD" U R 7900 4100 50 
F34 "TXD1" U R 7900 4200 50 
F35 "~HALT" U R 7900 3200 50 
F36 "~WAITING" U R 7900 3100 50 
F37 "~ENDEXT" U R 7900 3300 50 
F38 "~SKIPEXT" U R 7900 3400 50 
F39 "~LTSON" I L 6750 4450 50 
F40 "FPCLKEN" I L 6750 1850 50 
F41 "FPµSTEP" I L 6750 1950 50 
F42 "~FPRESET" I L 6750 1750 50 
F43 "~FPRAM~∕ROM" I L 6750 2150 50 
F44 "FPFETCH∕~EXEC" I L 6750 2050 50 
F45 "~FPOE[0..31]" I R 7900 4450 50 
F46 "~FPDRLOE" I L 6750 2250 50 
F47 "~FPSPLOE" I L 6750 2350 50 
F48 "~FPDRHOE" I L 6750 2450 50 
F49 "~FPSPHOE" I L 6750 2550 50 
F50 "FP-FPD[0..7]" I L 6750 3950 50 
$EndSheet
Wire Wire Line
	6750 1750 6200 1750
Wire Wire Line
	6750 1850 6200 1850
Wire Wire Line
	6750 1950 6200 1950
Text Label 6200 1750 0    50   ~ 0
~FPRESET
Text Label 6200 1850 0    50   ~ 0
FPCLKEN
Text Label 6200 1950 0    50   ~ 0
FPµSTEP
Wire Bus Line
	6100 1000 6750 1000
Wire Bus Line
	6100 1100 6750 1100
Wire Bus Line
	6100 1200 6750 1200
Wire Bus Line
	6100 1400 6750 1400
Wire Bus Line
	6100 1500 6750 1500
Wire Bus Line
	6100 1600 6750 1600
Wire Wire Line
	2500 1200 3150 1200
Wire Wire Line
	2500 1300 3150 1300
Wire Bus Line
	2500 1000 3150 1000
Wire Bus Line
	2500 1100 3150 1100
Wire Wire Line
	7900 1000 8450 1000
Wire Wire Line
	7900 1100 8450 1100
Text Label 8450 3700 2    50   ~ 0
RSVD[0..6]
Wire Bus Line
	8450 3700 7900 3700
Text Label 8000 4000 0    50   ~ 0
~PANELEN
Wire Wire Line
	8000 4000 8550 4000
Wire Bus Line
	8550 3900 8000 3900
Text Label 8000 3900 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	7900 4100 8450 4100
Wire Wire Line
	7900 4200 8450 4200
Text Label 8450 4100 2    50   ~ 0
RXD
Text Label 8450 4200 2    50   ~ 0
TXD1
Wire Wire Line
	6750 2050 6200 2050
Wire Wire Line
	6750 2150 6200 2150
Wire Wire Line
	6750 2250 6200 2250
Wire Wire Line
	6750 2350 6200 2350
Wire Wire Line
	6750 2450 6200 2450
Wire Wire Line
	6750 2550 6200 2550
Text Label 6200 2050 0    50   ~ 0
FPFETCH∕~EXEC
Text Label 6200 2150 0    50   ~ 0
~FPRAM~∕ROM
Text Label 6200 2250 0    50   ~ 0
~FPDRLOE
Text Label 6200 2350 0    50   ~ 0
~FPSPLOE
Text Label 6200 2450 0    50   ~ 0
~FPDRHOE
Text Label 6200 2550 0    50   ~ 0
~FPSPHOE
Text Label 6100 3950 0    50   ~ 0
FD-FPD[0..7]
Wire Bus Line
	6750 3950 6100 3950
Text Label 6100 4050 0    50   ~ 0
FPA[0..7]
Wire Bus Line
	6750 4050 6100 4050
Text Label 6100 4150 0    50   ~ 0
~ROW[1..5]
Wire Bus Line
	6750 4150 6100 4150
Text Label 6100 4250 0    50   ~ 0
SWA[0..3]
Wire Bus Line
	6750 4250 6100 4250
Text Label 6100 4350 0    50   ~ 0
SWD[0..3]
Wire Bus Line
	6750 4350 6100 4350
Wire Wire Line
	6100 4450 6750 4450
Text Label 6100 4450 0    50   ~ 0
~LTSON
$Sheet
S 1350 3850 1150 700 
U 61175D3B
F0 "CFT Clock Generator" 50
F1 "clock_generator.sch" 50
F2 "CLK1" I R 2500 4000 50 
F3 "CLK2" I R 2500 4100 50 
F4 "CLK3" I R 2500 4200 50 
F5 "CLK4" I R 2500 4300 50 
F6 "T34" I R 2500 4400 50 
F7 "CLK" I L 1350 4400 50 
F8 "~LCLKEN" I L 1350 4000 50 
F9 "~CLKEN" I L 1350 4200 50 
$EndSheet
Text Label 3050 4000 2    50   ~ 0
CLK1
Text Label 3050 4100 2    50   ~ 0
CLK2
Text Label 3050 4200 2    50   ~ 0
CLK3
Text Label 3050 4300 2    50   ~ 0
CLK4
Wire Wire Line
	3050 4000 2500 4000
Wire Wire Line
	3050 4100 2500 4100
Wire Wire Line
	3050 4200 2500 4200
Wire Wire Line
	3050 4300 2500 4300
Wire Wire Line
	3050 4400 2500 4400
Text Label 3050 4400 2    50   ~ 0
T34
Wire Wire Line
	1350 4200 850  4200
Text Label 850  4200 0    50   ~ 0
FPCLKEN
Wire Wire Line
	1350 4400 850  4400
Text Label 850  4400 0    50   ~ 0
FPµSTEP
Wire Wire Line
	1350 3250 1250 3250
Wire Wire Line
	1250 3250 1250 4000
Wire Wire Line
	1250 4000 1350 4000
Wire Bus Line
	-450 -1750 -450 300 
$EndSCHEMATC
