EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 11
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
S 3850 9350 1150 1500
U 5ED99F01
F0 "Run Control State Machine" 50
F1 "cft_dfp_rc_fsm.sch" 50
F2 "~WAIT" O R 5000 10400 50 
F3 "FPCLKEN" T R 5000 10550 50 
F4 "FPµSTEP" T R 5000 10700 50 
F5 "FPCLKEN-IN" I L 3850 10550 50 
F6 "FPµSTEP-IN" I L 3850 10700 50 
F7 "STEP∕~RUN" I L 3850 10250 50 
F8 "FPFETCH∕~EXEC" I L 3850 9950 50 
F9 "~CLR" I L 3850 10100 50 
F10 "~µSTEP" I L 3850 10400 50 
F11 "CLK4" I L 3850 9800 50 
F12 "~RESET" I L 3850 9500 50 
F13 "~RSTHOLD" I L 3850 9650 50 
$EndSheet
Wire Wire Line
	5000 10400 5500 10400
Text Label 5500 10400 2    50   ~ 0
~WAIT
Wire Wire Line
	5000 10550 5500 10550
Text Label 5500 10550 2    50   ~ 0
FPCLKEN
Wire Wire Line
	5000 10700 5500 10700
Text Label 5500 10700 2    50   ~ 0
FPµSTEP
Wire Wire Line
	3850 10400 3250 10400
Text Label 3250 10400 0    50   ~ 0
~µSTEP
Wire Wire Line
	3850 10550 3250 10550
Text Label 3250 10550 0    50   ~ 0
FPCLKEN-IN
Wire Wire Line
	3850 10700 3250 10700
Text Label 3250 10700 0    50   ~ 0
FPµSTEP-IN
Wire Wire Line
	3850 10250 3250 10250
Text Label 3250 10250 0    50   ~ 0
STEP∕~RUN
Wire Wire Line
	3850 10100 3250 10100
Text Label 3250 10100 0    50   ~ 0
~CLR
Wire Wire Line
	3850 9950 3250 9950
Text Label 3250 9950 0    50   ~ 0
FPFETCH∕~EXEC
Wire Wire Line
	3850 9800 3250 9800
Text Label 3250 9800 0    50   ~ 0
CLK4
Wire Wire Line
	3850 9650 3250 9650
Text Label 3250 9650 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	3850 9500 3250 9500
Text Label 3250 9500 0    50   ~ 0
~RESET
$Sheet
S 3850 11450 1150 900 
U 614F5B8D
F0 "Address Decoder & Wait States" 50
F1 "cft_dfp_ws.sch" 50
F2 "~WS" T R 5000 11600 50 
F3 "~IOINT" O R 5000 11750 50 
F4 "~DBOE1" O R 5000 12200 50 
F5 "~R" T L 3850 11600 50 
F6 "~DBOE0" I L 3850 12200 50 
F7 "CLRWS" I L 3850 12050 50 
F8 "~IODEV1xx" I L 3850 11750 50 
F9 "AB[5..7]" I L 3850 11900 50 
$EndSheet
Wire Wire Line
	3850 11600 3250 11600
Text Label 3250 11600 0    50   ~ 0
~R
Wire Wire Line
	3850 11750 3250 11750
Text Label 3250 11750 0    50   ~ 0
~IODEV1xx
Wire Bus Line
	3850 11900 3250 11900
Text Label 3250 11900 0    50   ~ 0
AB[0..23]
Wire Wire Line
	3850 12050 3250 12050
Text Label 3250 12050 0    50   ~ 0
CLRWS
Wire Wire Line
	3850 12200 3250 12200
Text Label 3250 12200 0    50   ~ 0
~DBOE0
Wire Wire Line
	5000 11600 5500 11600
Text Label 5500 11600 2    50   ~ 0
~WS
Wire Wire Line
	5000 11750 5500 11750
Text Label 5500 11750 2    50   ~ 0
~IOINT
Wire Wire Line
	5000 12200 5500 12200
Text Label 5500 12200 2    50   ~ 0
~DBOE1
Text Notes 3450 9200 0    100  ~ 20
Run/Step/Stop Control FSM
Text Notes 3450 11250 0    100  ~ 20
CFT Bus Address Decoder
Wire Bus Line
	7750 1100 7350 1100
Text Label 7350 1100 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	8900 2000 9400 2000
Text Label 9400 2000 2    50   ~ 0
~ABOE
Text Label 7300 1300 0    50   ~ 0
~WAB0
Text Label 7300 1400 0    50   ~ 0
~WAB1
Text Label 7300 1500 0    50   ~ 0
~WAB2
Text Label 7500 2400 2    50   ~ 0
~RAB0
Text Label 7500 2500 2    50   ~ 0
~RAB1
Text Label 7500 2600 2    50   ~ 0
~RAB2
Wire Bus Line
	9400 1200 8900 1200
Wire Wire Line
	9400 2500 8900 2500
Text Label 9400 1200 2    50   ~ 0
DB[0..15]
Text Label 9400 2500 2    50   ~ 0
BUSCP
Wire Wire Line
	8900 2200 9400 2200
Text Label 7300 1600 0    50   ~ 0
~WDB0
Text Label 7300 1700 0    50   ~ 0
~WDB1
Wire Bus Line
	9400 1100 8900 1100
Text Label 9400 1100 2    50   ~ 0
AB[0..23]
Wire Bus Line
	8900 1500 9400 1500
Wire Bus Line
	8900 1600 9400 1600
Text Label 9400 1500 2    50   ~ 0
RADDR[0..4]
Text Label 9400 1600 2    50   ~ 0
WADDR[0..4]
Wire Bus Line
	8900 1700 9400 1700
Text Label 9400 1700 2    50   ~ 0
ACTION[0..3]
Wire Bus Line
	8900 1800 9400 1800
Text Label 9400 1800 2    50   ~ 0
COND[0..3]
Text Label 7300 2000 0    50   ~ 0
~WCV0
Text Label 7300 2100 0    50   ~ 0
~WCV1
Text Label 7300 2200 0    50   ~ 0
~WCV2
Text Label 7300 1800 0    50   ~ 0
~WIB0
Text Label 7300 1900 0    50   ~ 0
~WIB1
Wire Wire Line
	8900 2100 9400 2100
Wire Wire Line
	8900 2300 9400 2300
Text Label 9400 2100 2    50   ~ 0
~CVOE
Text Label 9400 2300 2    50   ~ 0
~IBOE
Wire Bus Line
	9400 1300 8900 1300
Text Label 9400 1300 2    50   ~ 0
IBUS[0..15]
Text Label 7500 2900 2    50   ~ 0
~RIB0
Text Label 7500 3000 2    50   ~ 0
~RIB1
Text Label 7500 2700 2    50   ~ 0
~RDB0
Text Label 7500 2800 2    50   ~ 0
~RDB1
Text Label 7500 3100 2    50   ~ 0
~RCV0
Text Label 7500 3200 2    50   ~ 0
~RCV1
Text Label 7500 3300 2    50   ~ 0
~RCV2
Text Notes 750  900  0    63   ~ 13
TO DO:
Text Notes 750  2350 0    50   ~ 0
Add replaceable pods for buses and MCU/clock.\nIsolate front panel connector from rest of FPD.\nDisable front panel during programming.\nDisable serial port during programming.\nAdd configurable pull-ups on various signals.\nFix FTDI cable pin-out (swap RX/TX; likely ALREADY SWAPPED in R1943).\nAdd reset switch.\nAdd 1-2 more banks of DIP switches.\nLeft bus for peripherals.\nRight bus for processor, memory and memory-mapped I/O.\nFix TTYD LED.\nFix activity LED.\nAdd front-panel switch LED.\nAdd PANELEN LED.\nAdd CFT IRQ LED.\nWeakly pull-up ALL MCU outputs!!!\nPull-up MCU ~RESET~
$Comp
L alexios:74HC590 U?
U 1 1 6057B648
P -2100 9700
F 0 "U?" H -2100 10467 50  0000 C CNN
F 1 "74HC139" H -2100 10376 50  0000 C CNN
F 2 "" H -1800 10050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -1800 10050 50  0001 C CNN
	1    -2100 9700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U?
U 1 1 6058149A
P -850 9300
F 0 "U?" H -850 9667 50  0000 C CNN
F 1 "74HC139" H -850 9576 50  0000 C CNN
F 2 "" H -850 9300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -850 9300 50  0001 C CNN
	1    -850 9300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U?
U 2 1 6058247F
P -850 9900
F 0 "U?" H -850 9525 50  0000 C CNN
F 1 "74HC139" H -850 9434 50  0001 C CNN
F 2 "" H -850 9900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -850 9900 50  0001 C CNN
	2    -850 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-350 9800 -300 9800
Wire Wire Line
	-1600 9300 -1500 9300
Wire Wire Line
	-1500 9300 -1500 9800
Wire Wire Line
	-1500 9800 -1350 9800
Connection ~ -1500 9300
Wire Wire Line
	-1500 9300 -1350 9300
$Comp
L power:GND #PWR?
U 1 1 609B98D5
P -1400 10150
F 0 "#PWR?" H -1400 9900 50  0001 C CNN
F 1 "GND" H -1395 9977 50  0000 C CNN
F 2 "" H -1400 10150 50  0001 C CNN
F 3 "" H -1400 10150 50  0001 C CNN
	1    -1400 10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1350 10100 -1400 10100
Wire Wire Line
	-1400 10100 -1400 10150
NoConn ~ -1600 9400
NoConn ~ -1600 9500
NoConn ~ -1600 9600
NoConn ~ -1600 9700
NoConn ~ -1600 9800
NoConn ~ -1600 9900
NoConn ~ -1600 10100
$Comp
L power:GND #PWR?
U 1 1 60EF35E9
P -2700 10150
F 0 "#PWR?" H -2700 9900 50  0001 C CNN
F 1 "GND" H -2695 9977 50  0000 C CNN
F 2 "" H -2700 10150 50  0001 C CNN
F 3 "" H -2700 10150 50  0001 C CNN
	1    -2700 10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2600 10100 -2700 10100
Wire Wire Line
	-2700 10100 -2700 10150
Wire Wire Line
	-2600 9200 -2700 9200
Wire Wire Line
	-2700 9200 -2700 9250
Wire Wire Line
	-2600 9400 -2650 9400
Wire Wire Line
	-2600 9500 -2650 9500
Wire Wire Line
	-2650 9500 -2650 9400
Wire Wire Line
	-2650 9500 -3300 9500
$Comp
L power:GND #PWR?
U 1 1 61125FE4
P -2700 9250
F 0 "#PWR?" H -2700 9000 50  0001 C CNN
F 1 "GND" H -2850 9250 50  0000 C CNN
F 2 "" H -2700 9250 50  0001 C CNN
F 3 "" H -2700 9250 50  0001 C CNN
	1    -2700 9250
	1    0    0    -1  
$EndComp
Connection ~ -2650 9500
Wire Wire Line
	-200 9900 -200 9700
Wire Wire Line
	-350 9900 -200 9900
Wire Wire Line
	-200 9700 100  9700
Wire Wire Line
	-300 9600 100  9600
Wire Wire Line
	-350 9500 100  9500
Wire Wire Line
	-350 9400 100  9400
Wire Wire Line
	-350 9300 100  9300
Wire Wire Line
	-350 9200 100  9200
Wire Wire Line
	1400 9500 2100 9500
Wire Wire Line
	1400 9400 2100 9400
Wire Wire Line
	1400 9300 2100 9300
Wire Wire Line
	1400 9200 2100 9200
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 61862867
P 1300 9900
F 0 "RN?" H 1200 9750 50  0000 L CNN
F 1 "30Ω" H 1500 9850 50  0000 C CNN
F 2 "" H 1300 9980 50  0001 C CNN
F 3 "~" V 1300 9900 50  0001 C CNN
	4    1300 9900
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 61862861
P 1300 9800
F 0 "RN?" H 1400 9850 50  0001 L CNN
F 1 "30Ω" H 1275 9906 50  0001 C CNN
F 2 "" H 1300 9880 50  0001 C CNN
F 3 "~" V 1300 9800 50  0001 C CNN
	3    1300 9800
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6186285B
P 1300 9700
F 0 "RN?" H 1400 9750 50  0001 L CNN
F 1 "30Ω" H 1275 9806 50  0001 C CNN
F 2 "" H 1300 9780 50  0001 C CNN
F 3 "~" V 1300 9700 50  0001 C CNN
	2    1300 9700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6185C9FB
P 1300 9500
F 0 "RN?" H 1400 9550 50  0001 L CNN
F 1 "30Ω" H 1275 9606 50  0001 C CNN
F 2 "" H 1300 9580 50  0001 C CNN
F 3 "~" V 1300 9500 50  0001 C CNN
	4    1300 9500
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6185C75F
P 1300 9400
F 0 "RN?" H 1400 9450 50  0001 L CNN
F 1 "30Ω" H 1275 9506 50  0001 C CNN
F 2 "" H 1300 9480 50  0001 C CNN
F 3 "~" V 1300 9400 50  0001 C CNN
	3    1300 9400
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6185B607
P 1300 9300
F 0 "RN?" H 1400 9350 50  0001 L CNN
F 1 "30Ω" H 1275 9406 50  0001 C CNN
F 2 "" H 1300 9380 50  0001 C CNN
F 3 "~" V 1300 9300 50  0001 C CNN
	2    1300 9300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 9900 1150 9900
Wire Wire Line
	1100 9800 1150 9800
Wire Wire Line
	1100 9700 1150 9700
Wire Wire Line
	1100 9600 1150 9600
Wire Wire Line
	1100 9500 1150 9500
Wire Wire Line
	1100 9400 1150 9400
Wire Wire Line
	1100 9300 1150 9300
Wire Wire Line
	1100 9200 1150 9200
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 614517E5
P 1300 9200
F 0 "RN?" H 1200 9350 50  0000 L CNN
F 1 "30Ω" H 1450 9250 50  0000 C CNN
F 2 "" H 1300 9280 50  0001 C CNN
F 3 "~" V 1300 9200 50  0001 C CNN
	1    1300 9200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 6144C589
P 600 9700
F 0 "U?" H 600 10467 50  0000 C CNN
F 1 "74HC541" H 600 10376 50  0000 C CNN
F 2 "" H 600 9700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 600 9700 50  0001 C CNN
	1    600  9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	100  10100 50   10100
Wire Wire Line
	50   10100 50   10200
Wire Wire Line
	100  10200 50   10200
Connection ~ 50   10200
Wire Wire Line
	50   10200 50   10300
Wire Wire Line
	-1600 9200 -1350 9200
Wire Wire Line
	-1350 9900 -1400 9900
Wire Wire Line
	-1400 9900 -1400 10100
Connection ~ -1400 10100
$Comp
L power:GND #PWR?
U 1 1 626F8918
P -1400 9550
F 0 "#PWR?" H -1400 9300 50  0001 C CNN
F 1 "GND" H -1395 9377 50  0000 C CNN
F 2 "" H -1400 9550 50  0001 C CNN
F 3 "" H -1400 9550 50  0001 C CNN
	1    -1400 9550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1400 9550 -1400 9500
Wire Wire Line
	-1400 9500 -1350 9500
Wire Wire Line
	-300 9800 -300 9600
Text Label -100 9200 0    50   ~ 0
LCLK1
Text Label -100 9300 0    50   ~ 0
LCLK2
Text Label -100 9400 0    50   ~ 0
LCLK3
Text Label -100 9500 0    50   ~ 0
LCLK4
Text Label -100 9600 0    50   ~ 0
LT12
Text Label -100 9700 0    50   ~ 0
LT34
Wire Wire Line
	100  9800 50   9800
Wire Wire Line
	50   9800 50   9900
Wire Wire Line
	100  9900 50   9900
Connection ~ 50   9900
NoConn ~ -350 10000
NoConn ~ -350 10100
Text Label -3200 10400 0    50   ~ 0
~LCLKEN
Text Notes -2550 8750 0    100  ~ 20
CFT Clock Generator
$Comp
L power:+5V #PWR?
U 1 1 60365E6C
P -2650 9700
F 0 "#PWR?" H -2650 9550 50  0001 C CNN
F 1 "+5V" H -2650 9650 50  0000 C CNN
F 2 "" H -2650 9700 50  0001 C CNN
F 3 "" H -2650 9700 50  0001 C CNN
	1    -2650 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2650 9700 -2600 9700
$Comp
L alexios:SolderJumper_3_Bridged12 JP?
U 1 1 5FDC3F20
P 50 10400
F 0 "JP?" H 50  10513 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 50  10510 50  0001 C CNN
F 2 "" H 50  10400 50  0001 C CNN
F 3 "~" H 50  10400 50  0001 C CNN
	1    50   10400
	1    0    0    1   
$EndComp
Text Label -3200 9500 0    50   ~ 0
FPCLKEN
Text Label 1800 9200 2    50   ~ 0
CLK1
Text Label 1800 9300 2    50   ~ 0
CLK2
Text Label 1800 9400 2    50   ~ 0
CLK3
Text Label 1800 9500 2    50   ~ 0
CLK4
Text Label 1800 9700 2    50   ~ 0
T34
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 61862855
P 1300 9600
F 0 "RN?" H 1400 9650 50  0001 L CNN
F 1 "30Ω" H 1500 9200 50  0001 C CNN
F 2 "" H 1300 9680 50  0001 C CNN
F 3 "~" V 1300 9600 50  0001 C CNN
	1    1300 9600
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 6002D310
P 1700 9600
F 0 "TP?" V 1700 9788 50  0000 L CNN
F 1 "TestPoint" V 1745 9788 50  0001 L CNN
F 2 "" H 1900 9600 50  0001 C CNN
F 3 "~" H 1900 9600 50  0001 C CNN
	1    1700 9600
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 9600 1700 9600
$Comp
L Connector:TestPoint TP?
U 1 1 60212D2E
P 1700 9800
F 0 "TP?" V 1700 9988 50  0000 L CNN
F 1 "TestPoint" V 1745 9988 50  0001 L CNN
F 2 "" H 1900 9800 50  0001 C CNN
F 3 "~" H 1900 9800 50  0001 C CNN
	1    1700 9800
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 9800 1700 9800
$Comp
L Connector:TestPoint TP?
U 1 1 6028B30C
P 1700 9900
F 0 "TP?" V 1700 10088 50  0000 L CNN
F 1 "TestPoint" V 1745 10088 50  0001 L CNN
F 2 "" H 1900 9900 50  0001 C CNN
F 3 "~" H 1900 9900 50  0001 C CNN
	1    1700 9900
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 9900 1700 9900
Text HLabel 2100 9200 2    50   Input ~ 0
CLK1
Text HLabel 2100 9300 2    50   Input ~ 0
CLK2
Text HLabel 2100 9400 2    50   Input ~ 0
CLK3
Text HLabel 2100 9500 2    50   Input ~ 0
CLK4
Text HLabel 2100 9700 2    50   Input ~ 0
T34
Wire Wire Line
	1400 9700 2100 9700
Text HLabel -3300 9500 0    50   Input ~ 0
FPCLKEN
Text HLabel -3300 10400 0    50   Input ~ 0
~LCLKEN
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
$Sheet
S 3800 -4900 1150 4200
U 60A2F2E0
F0 "sheet60A2F293" 50
F1 "dfp-bus-left.sch" 50
F2 "AB[0..23]" U L 3800 -4150 50 
F3 "DB[0..15]" U L 3800 -4050 50 
F4 "FPD[0..7]" U L 3800 -3750 50 
F5 "IBUS[0..15]" U L 3800 -4750 50 
F6 "~RESET" U L 3800 -4650 50 
F7 "CLK1" U L 3800 -4550 50 
F8 "CLK2" U L 3800 -4450 50 
F9 "CLK3" U L 3800 -4350 50 
F10 "CLK4" U L 3800 -4250 50 
F11 "T34" U L 3800 -3850 50 
F12 "~IRQ" U L 3800 -3650 50 
F13 "~IRQS" U L 3800 -3550 50 
F14 "~IRQ[0..7]" U L 3800 -3450 50 
F15 "~RSTHOLD" U L 3800 -3350 50 
F16 "~SYSDEV" U L 3800 -3250 50 
F17 "~IODEV1xx" U L 3800 -3150 50 
F18 "~IODEV2xx" U L 3800 -3050 50 
F19 "~IODEV3xx" U L 3800 -2950 50 
F20 "~MEM" U L 3800 -2850 50 
F21 "~IO" U L 3800 -2750 50 
F22 "~R" U L 3800 -2650 50 
F23 "~W" U L 3800 -2550 50 
F24 "~WS" U L 3800 -2450 50 
F25 "~ENDEXT" U L 3800 -2350 50 
F26 "~SKIPEXT" U L 3800 -2250 50 
F27 "~HALT" U L 3800 -2150 50 
F28 "ACTION[0..3]" U L 3800 -1850 50 
F29 "WADDR[0..4]" U L 3800 -1750 50 
F30 "RADDR[0..4]" U L 3800 -1650 50 
F31 "RSVD[0..6]" U L 3800 -1550 50 
F32 "C1" U R 4950 -4750 50 
F33 "C2" U R 4950 -4650 50 
F34 "C3" U R 4950 -4550 50 
F35 "C4" U R 4950 -4450 50 
F36 "C5" U R 4950 -4350 50 
F37 "C6" U R 4950 -4250 50 
F38 "C7" U R 4950 -4150 50 
F39 "C8" U R 4950 -4050 50 
F40 "C9" U R 4950 -3950 50 
F41 "C10" U R 4950 -3850 50 
F42 "C11" U R 4950 -3750 50 
F43 "C12" U R 4950 -3650 50 
F44 "C13" U R 4950 -3550 50 
F45 "C14" U R 4950 -3450 50 
F46 "C15" U R 4950 -3350 50 
F47 "C16" U R 4950 -3250 50 
F48 "C17" U R 4950 -3150 50 
F49 "C18" U R 4950 -3050 50 
F50 "C19" U R 4950 -2950 50 
F51 "C20" U R 4950 -2850 50 
F52 "C21" U R 4950 -2750 50 
F53 "C22" U R 4950 -2650 50 
F54 "C23" U R 4950 -2550 50 
F55 "C24" U R 4950 -2450 50 
F56 "C25" U R 4950 -2350 50 
F57 "C26" U R 4950 -2250 50 
F58 "C27" U R 4950 -2150 50 
F59 "C28" U R 4950 -2050 50 
F60 "C29" U R 4950 -1950 50 
F61 "C30" U R 4950 -1850 50 
F62 "C31" U R 4950 -1750 50 
F63 "C32" U R 4950 -1650 50 
F64 "C33" U R 4950 -1550 50 
F65 "C34" U R 4950 -1450 50 
F66 "C35" U R 4950 -1350 50 
F67 "C36" U R 4950 -1250 50 
F68 "C37" U R 4950 -1150 50 
F69 "C38" U R 4950 -1050 50 
F70 "C39" U R 4950 -950 50 
F71 "C40" U R 4950 -850 50 
F72 "~RUEN" U L 3800 -2050 50 
F73 "~WAITING" U L 3800 -1950 50 
$EndSheet
Wire Bus Line
	3800 -4150 3250 -4150
Wire Bus Line
	3800 -4050 3250 -4050
Text Label 3250 -4150 0    50   ~ 0
AB[0..23]
Text Label 3250 -4050 0    50   ~ 0
DB[0..15]
Wire Bus Line
	3250 -3750 3800 -3750
Text Label 3250 -3750 0    50   ~ 0
CFT-FPD[0..7]
Wire Wire Line
	3800 -4550 3250 -4550
Wire Wire Line
	3800 -4450 3250 -4450
Wire Wire Line
	3800 -4350 3250 -4350
Wire Wire Line
	3800 -4250 3250 -4250
Wire Wire Line
	3800 -4650 3250 -4650
Wire Wire Line
	3800 -3350 3250 -3350
Wire Wire Line
	3800 -3250 3250 -3250
Wire Wire Line
	3800 -3150 3250 -3150
Wire Wire Line
	3800 -2850 3250 -2850
Wire Wire Line
	3800 -2750 3250 -2750
Wire Wire Line
	3800 -2650 3250 -2650
Wire Wire Line
	3800 -2550 3250 -2550
Wire Wire Line
	3800 -2950 3250 -2950
Wire Wire Line
	3800 -3050 3250 -3050
Wire Wire Line
	3800 -2250 3250 -2250
Wire Wire Line
	3800 -2150 3250 -2150
Wire Wire Line
	3800 -2350 3250 -2350
Wire Wire Line
	3800 -2450 3250 -2450
Wire Bus Line
	3250 -3450 3800 -3450
Text Label 3250 -3450 0    50   ~ 0
~IRQ[0..7]
Text Label 3250 -3650 0    50   ~ 0
~IRQ
Wire Wire Line
	3800 -3850 3250 -3850
Wire Bus Line
	3250 -4750 3800 -4750
Text Label 3250 -4750 0    50   ~ 0
IBUS[0..15]
Text Label 3250 -4650 0    50   ~ 0
~RESET
Text Label 3250 -4550 0    50   ~ 0
CLK1
Text Label 3250 -4450 0    50   ~ 0
CLK2
Text Label 3250 -4350 0    50   ~ 0
CLK3
Text Label 3250 -4250 0    50   ~ 0
CLK4
Text Label 3250 -3850 0    50   ~ 0
T34
Wire Wire Line
	3800 -3550 3250 -3550
Text Label 3250 -3550 0    50   ~ 0
~IRQS
Text Label 3250 -3350 0    50   ~ 0
~RSTHOLD
Text Label 3250 -3250 0    50   ~ 0
~SYSDEV
Text Label 3250 -3150 0    50   ~ 0
~IODEV1xx
Text Label 3250 -3050 0    50   ~ 0
~IODEV2xx
Text Label 3250 -2950 0    50   ~ 0
~IODEV3xx
Text Label 3250 -2850 0    50   ~ 0
~MEM
Text Label 3250 -2750 0    50   ~ 0
~IO
Text Label 3250 -2650 0    50   ~ 0
~R
Text Label 3250 -2450 0    50   ~ 0
~WS
Text Label 3250 -2350 0    50   ~ 0
~ENDEXT
Text Label 3250 -2250 0    50   ~ 0
~SKIPEXT
Text Label 3250 -2150 0    50   ~ 0
~HALT
Text Label 3250 -1850 0    50   ~ 0
ACTION[0..3]
Text Label 3250 -1750 0    50   ~ 0
WADDR[0..4]
Text Label 3250 -1650 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	3800 -1850 3250 -1850
Wire Bus Line
	3800 -1750 3250 -1750
Wire Bus Line
	3800 -1650 3250 -1650
Wire Bus Line
	3250 -1550 3800 -1550
Text Label 3250 -1550 0    50   ~ 0
RSVD[0..6]
Text Label 5500 -4450 2    50   ~ 0
FPA1
$Comp
L power:+5V #PWR?
U 1 1 60A2F324
P 4950 -4650
AR Path="/60A2F324" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60A2F324" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4950 -4800 50  0001 C CNN
F 1 "+5V" V 4965 -4522 50  0000 L CNN
F 2 "" H 4950 -4650 50  0001 C CNN
F 3 "" H 4950 -4650 50  0001 C CNN
	1    4950 -4650
	0    1    1    0   
$EndComp
Text Label 5500 -2150 2    50   ~ 0
POWER
Text Label 5500 -2250 2    50   ~ 0
~LTSON
Text Label 5500 -2350 2    50   ~ 0
SWD3
Text Label 5500 -2450 2    50   ~ 0
SWD2
Text Label 5500 -2550 2    50   ~ 0
SWD1
Text Label 5500 -2650 2    50   ~ 0
SWD0
Text Label 5500 -2750 2    50   ~ 0
SWA3
Text Label 5500 -2850 2    50   ~ 0
SWA2
Text Label 5500 -2950 2    50   ~ 0
SWA1
Text Label 5500 -3050 2    50   ~ 0
SWA0
Text Label 5500 -3150 2    50   ~ 0
~ROW5
Text Label 5500 -3250 2    50   ~ 0
~ROW4
Text Label 5500 -3350 2    50   ~ 0
~ROW3
Text Label 5500 -3450 2    50   ~ 0
~ROW2
Text Label 5500 -3550 2    50   ~ 0
~ROW1
Wire Wire Line
	4950 -4450 5500 -4450
Wire Wire Line
	4950 -4550 5500 -4550
Wire Wire Line
	4950 -1450 5100 -1450
Wire Wire Line
	4950 -1550 5100 -1550
Wire Wire Line
	4950 -1650 5100 -1650
Wire Wire Line
	4950 -1750 5100 -1750
Wire Wire Line
	4950 -2250 5500 -2250
Wire Wire Line
	4950 -2350 5500 -2350
Wire Wire Line
	4950 -2450 5500 -2450
Wire Wire Line
	4950 -2550 5500 -2550
Wire Wire Line
	4950 -2650 5500 -2650
Wire Wire Line
	4950 -2750 5500 -2750
Wire Wire Line
	4950 -2850 5500 -2850
Wire Wire Line
	4950 -2950 5500 -2950
Wire Wire Line
	4950 -3050 5500 -3050
Wire Wire Line
	4950 -3150 5500 -3150
Wire Wire Line
	4950 -3250 5500 -3250
Wire Wire Line
	4950 -3350 5500 -3350
Wire Wire Line
	4950 -3450 5500 -3450
Wire Wire Line
	4950 -3550 5500 -3550
Text Label 5500 -4550 2    50   ~ 0
FPA0
NoConn ~ 5100 -1750
NoConn ~ 5100 -1550
$Comp
L power:+5V #PWR?
U 1 1 60A2F350
P 4950 -4750
AR Path="/60A2F350" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60A2F350" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4950 -4900 50  0001 C CNN
F 1 "+5V" V 4965 -4622 50  0000 L CNN
F 2 "" H 4950 -4750 50  0001 C CNN
F 3 "" H 4950 -4750 50  0001 C CNN
	1    4950 -4750
	0    1    1    0   
$EndComp
Text Label 3150 -2750 2    50   ~ 0
~IO
Text Label 3150 -2850 2    50   ~ 0
~MEM
Text Label 3150 -3850 2    50   ~ 0
T34
Text Label 3150 -4250 2    50   ~ 0
CLK4
Text Label 3150 -4350 2    50   ~ 0
CLK3
Text Label 3150 -4450 2    50   ~ 0
CLK2
Text Label 3150 -4550 2    50   ~ 0
CLK1
Wire Wire Line
	2600 -3850 3150 -3850
Wire Wire Line
	2600 -2550 3150 -2550
Wire Wire Line
	2600 -2650 3150 -2650
Wire Wire Line
	2600 -2750 3150 -2750
Wire Wire Line
	2600 -2850 3150 -2850
Wire Wire Line
	2600 -4250 3150 -4250
Wire Wire Line
	2600 -4350 3150 -4350
Wire Wire Line
	2600 -4450 3150 -4450
Wire Wire Line
	2600 -4550 3150 -4550
Text Notes 1900 -2200 1    100  ~ 20
Pull-Up & Conditioning
Text Notes 4550 -2900 1    100  ~ 20
Left Slot
Entry Wire Line
	5500 -3050 5600 -2950
Entry Wire Line
	5500 -2950 5600 -2850
Entry Wire Line
	5500 -2850 5600 -2750
Entry Wire Line
	5500 -2750 5600 -2650
Entry Wire Line
	5500 -2650 5600 -2550
Entry Wire Line
	5500 -2550 5600 -2450
Entry Wire Line
	5500 -2450 5600 -2350
Entry Wire Line
	5500 -2350 5600 -2250
Text Label 5600 -2950 0    50   ~ 0
SWA[0..3]
Text Label 5600 -2550 0    50   ~ 0
SWD[0..3]
Text Notes 5650 -2150 0    50   ~ 0
Power switch from front panel
Wire Wire Line
	4950 -1350 5100 -1350
Wire Wire Line
	4950 -1250 5100 -1250
Wire Wire Line
	4950 -1150 5100 -1150
NoConn ~ 5100 -1350
NoConn ~ 5100 -1150
Wire Wire Line
	4950 -850 5100 -850
NoConn ~ 5100 -1650
NoConn ~ 5100 -1450
NoConn ~ 5100 -1250
$Comp
L power:GND #PWR?
U 1 1 60A2F38C
P 5100 -850
AR Path="/60A2F38C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60A2F38C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5100 -1100 50  0001 C CNN
F 1 "GND" H 5105 -1023 50  0000 C CNN
F 2 "" H 5100 -850 50  0001 C CNN
F 3 "" H 5100 -850 50  0001 C CNN
	1    5100 -850
	1    0    0    -1  
$EndComp
Text Label 5500 -950 2    50   ~ 0
TXD1
Text Label 5500 -1050 2    50   ~ 0
RXD
Wire Wire Line
	4950 -1050 5500 -1050
Wire Wire Line
	4950 -950 5500 -950
$Sheet
S 6000 -1200 500  400 
U 60A2F394
F0 "sheet60A2F294" 50
F1 "cft_boardled.sch" 50
F2 "LED1" I L 6000 -1050 50 
F3 "LED2" I L 6000 -950 50 
$EndSheet
Wire Wire Line
	6000 -1050 5750 -1050
Wire Wire Line
	6000 -950 5750 -950
Text Label 5750 -950 0    50   ~ 0
TXD
Text Label 5750 -1050 0    50   ~ 0
RXD
Wire Wire Line
	4950 -2150 5500 -2150
Text Label 3250 -2550 0    50   ~ 0
~W
Text Label 3150 -2650 2    50   ~ 0
~R
Text Label 3150 -2550 2    50   ~ 0
~W
$Sheet
S 1450 -4900 1150 3300
U 60A2F3C0
F0 "sheet60A2F295" 50
F1 "cft-dfp-bushold.sch" 50
F2 "FPD[0..7]" U R 2600 -1850 50 
F3 "CLK1" U R 2600 -4550 50 
F4 "CLK2" U R 2600 -4450 50 
F5 "CLK3" U R 2600 -4350 50 
F6 "CLK4" U R 2600 -4250 50 
F7 "T34" U R 2600 -3850 50 
F8 "~MEM" U R 2600 -2850 50 
F9 "~IO" U R 2600 -2750 50 
F10 "~R" U R 2600 -2650 50 
F11 "~W" U R 2600 -2550 50 
F12 "~IODEV1xx" U R 2600 -3150 50 
F13 "~SYSDEV" U R 2600 -3250 50 
F14 "~IODEV2xx" U R 2600 -3050 50 
F15 "~PANELEN" I R 2600 -1750 50 
F16 "~IODEV3xx" U R 2600 -2950 50 
F17 "CFT-FPD[0..7]" I R 2600 -3750 50 
F18 "~IRQ[0..7]" I R 2600 -3450 50 
F19 "~IRQ" U R 2600 -3650 50 
F20 "~IRQS" U R 2600 -3550 50 
$EndSheet
Wire Wire Line
	2600 -3150 3150 -3150
Text Label 3150 -3150 2    50   ~ 0
~IODEV1xx
$Comp
L power:GND #PWR?
U 1 1 60A2F3C8
P 5250 -1800
AR Path="/60A2F3C8" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60A2F3C8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5250 -2050 50  0001 C CNN
F 1 "GND" H 5255 -1973 50  0000 C CNN
F 2 "" H 5250 -1800 50  0001 C CNN
F 3 "" H 5250 -1800 50  0001 C CNN
	1    5250 -1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 -2050 5250 -2050
Wire Wire Line
	5250 -2050 5250 -1950
Wire Wire Line
	4950 -1950 5250 -1950
Connection ~ 5250 -1950
Wire Wire Line
	4950 -1850 5250 -1850
Wire Wire Line
	5250 -1950 5250 -1850
Connection ~ 5250 -1850
Wire Wire Line
	5250 -1850 5250 -1800
Wire Wire Line
	3800 -2050 3700 -2050
Wire Wire Line
	3800 -1950 3700 -1950
NoConn ~ 3700 -2050
NoConn ~ 3700 -1950
Wire Bus Line
	7800 -4150 7250 -4150
Wire Bus Line
	7800 -4050 7250 -4050
Text Label 7250 -4150 0    50   ~ 0
AB[0..23]
Text Label 7250 -4050 0    50   ~ 0
DB[0..15]
Wire Bus Line
	7250 -3750 7800 -3750
Text Label 7250 -3750 0    50   ~ 0
CFT-FPD[0..7]
Wire Wire Line
	7800 -4550 7250 -4550
Wire Wire Line
	7800 -4450 7250 -4450
Wire Wire Line
	7800 -4350 7250 -4350
Wire Wire Line
	7800 -4250 7250 -4250
Wire Wire Line
	7800 -4650 7250 -4650
Wire Wire Line
	7800 -3350 7250 -3350
Wire Wire Line
	7800 -3250 7250 -3250
Wire Wire Line
	7800 -3150 7250 -3150
Wire Wire Line
	7800 -3650 7250 -3650
Wire Wire Line
	7800 -2850 7250 -2850
Wire Wire Line
	7800 -2750 7250 -2750
Wire Wire Line
	7800 -2650 7250 -2650
Wire Wire Line
	7800 -2550 7250 -2550
Wire Wire Line
	7800 -2950 7250 -2950
Wire Wire Line
	7800 -3050 7250 -3050
Wire Wire Line
	7800 -2250 7250 -2250
Wire Wire Line
	7800 -2150 7250 -2150
Wire Wire Line
	7800 -2350 7250 -2350
Wire Wire Line
	7800 -2450 7250 -2450
Wire Bus Line
	7250 -3450 7800 -3450
Text Label 7250 -3450 0    50   ~ 0
~IRQ[0..7]
Text Label 7250 -3650 0    50   ~ 0
~IRQ
Wire Wire Line
	7800 -3850 7250 -3850
Wire Bus Line
	7250 -4750 7800 -4750
Text Label 7250 -4750 0    50   ~ 0
IBUS[0..15]
Text Label 7250 -4650 0    50   ~ 0
~RESET
Text Label 7250 -4550 0    50   ~ 0
CLK1
Text Label 7250 -4450 0    50   ~ 0
CLK2
Text Label 7250 -4350 0    50   ~ 0
CLK3
Text Label 7250 -4250 0    50   ~ 0
CLK4
Text Label 7250 -3850 0    50   ~ 0
T34
Wire Wire Line
	7800 -3550 7250 -3550
Text Label 7250 -3550 0    50   ~ 0
~IRQS
Text Label 7250 -3350 0    50   ~ 0
~RSTHOLD
Text Label 7250 -3250 0    50   ~ 0
~SYSDEV
Text Label 7250 -3150 0    50   ~ 0
~IODEV1xx
Text Label 7250 -3050 0    50   ~ 0
~IODEV2xx
Text Label 7250 -2950 0    50   ~ 0
~IODEV3xx
Text Label 7250 -2850 0    50   ~ 0
~MEM
Text Label 7250 -2750 0    50   ~ 0
~IO
Text Label 7250 -2650 0    50   ~ 0
~R
Text Label 7250 -2550 0    50   ~ 0
~W
Text Label 7250 -2450 0    50   ~ 0
~WS
Text Label 7250 -2350 0    50   ~ 0
~ENDEXT
Text Label 7250 -2250 0    50   ~ 0
~SKIPEXT
Text Label 7250 -2150 0    50   ~ 0
~HALT
Text Label 7250 -1850 0    50   ~ 0
ACTION[0..3]
Text Label 7250 -1750 0    50   ~ 0
WADDR[0..4]
Text Label 7250 -1650 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	7800 -1850 7250 -1850
Wire Bus Line
	7800 -1750 7250 -1750
Wire Bus Line
	7800 -1650 7250 -1650
Wire Bus Line
	7250 -1550 7800 -1550
Text Label 7250 -1550 0    50   ~ 0
RSVD[0..6]
Wire Wire Line
	8950 -4550 9500 -4550
Text Label 9500 -4550 2    50   ~ 0
FPCLKEN
Wire Wire Line
	8950 -4350 9500 -4350
Text Label 9500 -4350 2    50   ~ 0
FPµSTEP
$Comp
L power:GND #PWR?
U 1 1 60A644DF
P 8950 -4450
AR Path="/60A644DF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60A644DF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8950 -4700 50  0001 C CNN
F 1 "GND" V 9000 -4550 50  0000 R CNN
F 2 "" H 8950 -4450 50  0001 C CNN
F 3 "" H 8950 -4450 50  0001 C CNN
	1    8950 -4450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A644E5
P 8950 -4250
AR Path="/60A644E5" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60A644E5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8950 -4500 50  0001 C CNN
F 1 "GND" V 9000 -4350 50  0000 R CNN
F 2 "" H 8950 -4250 50  0001 C CNN
F 3 "" H 8950 -4250 50  0001 C CNN
	1    8950 -4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 -4050 9500 -4050
Text Label 9500 -4050 2    50   ~ 0
~FPRAM~∕ROM
Wire Wire Line
	8950 -4150 9500 -4150
Text Label 9500 -4150 2    50   ~ 0
~FPRESET
Text Notes 9700 -4650 0    50   ~ 0
To reset and clock generator
Text Notes 9700 -4050 0    50   ~ 0
To Memory Bank Registers
Wire Wire Line
	8950 -3950 9500 -3950
Text Label 9500 -3950 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes 9700 -3950 0    50   ~ 0
From Microcode Sequencer
Text Notes 8550 -2600 1    100  ~ 20
Right Slot
Wire Wire Line
	8950 -4750 9500 -4750
Text Label 9500 -4750 2    50   ~ 0
POWER
Text Notes 9700 -4750 0    50   ~ 0
Power enable → backplane
Text Label 9500 -3350 2    50   ~ 0
~FPOE29
Text Label 9500 -3050 2    50   ~ 0
~FPOE25
Text Label 9500 -3150 2    50   ~ 0
~FPOE21
Wire Wire Line
	8950 -3350 9500 -3350
Wire Wire Line
	8950 -3050 9500 -3050
Wire Wire Line
	8950 -3150 9500 -3150
Text Notes 9700 -2950 0    50   ~ 0
IR high
Text Label 9500 -2950 2    50   ~ 0
~FPOE17
Wire Wire Line
	8950 -2950 9500 -2950
Text Notes 9700 -2850 0    50   ~ 0
AC high
Text Notes 9700 -2750 0    50   ~ 0
PC high
Text Notes 9700 -2650 0    50   ~ 0
µCV mid
Text Label 9500 -2850 2    50   ~ 0
~FPOE9
Text Label 9500 -2750 2    50   ~ 0
~FPOE5
Text Label 9500 -2650 2    50   ~ 0
~FPOE1
Wire Wire Line
	8950 -2850 9500 -2850
Wire Wire Line
	8950 -2750 9500 -2750
Wire Wire Line
	8950 -2650 9500 -2650
Text Label 9500 -2550 2    50   ~ 0
~FPOE30
Wire Wire Line
	8950 -2250 9500 -2250
Text Label 9500 -2450 2    50   ~ 0
~FPOE26
Wire Wire Line
	8950 -2450 9500 -2450
Text Notes 9700 -2350 0    50   ~ 0
IR low\n
Text Notes 9700 -2050 0    50   ~ 0
AC low
Text Notes 9700 -2150 0    50   ~ 0
PC low
Text Notes 9700 -1850 0    50   ~ 0
µCV low
Text Label 9500 -2050 2    50   ~ 0
~FPOE10
Text Label 9500 -2150 2    50   ~ 0
~FPOE6
Text Label 9500 -1850 2    50   ~ 0
~FPOE2
Wire Wire Line
	8950 -2050 9500 -2050
Wire Wire Line
	8950 -2150 9500 -2150
Wire Wire Line
	8950 -1850 9500 -1850
Text Label 9500 -1250 2    50   ~ 0
~FPOE23
Wire Wire Line
	8950 -1250 9500 -1250
Text Label 9500 -1350 2    50   ~ 0
~FPOE19
Wire Wire Line
	8950 -1350 9500 -1350
Text Notes 10150 -1250 0    50   ~ 0
µAddress low
Text Notes 10150 -1150 0    50   ~ 0
(reserved)
Text Label 9500 -1050 2    50   ~ 0
~FPOE15
Wire Wire Line
	8950 -1050 9500 -1050
Text Notes 10150 -1050 0    50   ~ 0
(reserved)
Text Notes 9700 -850 0    50   ~ 0
IRQs enabled
Text Notes 9700 -950 0    50   ~ 0
IRQ requests
Text Label 9500 -1150 2    50   ~ 0
~FPOE11
Text Label 9500 -850 2    50   ~ 0
~FPOE7
Text Label 9500 -950 2    50   ~ 0
~FPOE3
Wire Wire Line
	8950 -1150 9500 -1150
Wire Wire Line
	8950 -850 9500 -850
Wire Wire Line
	8950 -950 9500 -950
Wire Wire Line
	8950 -1450 9500 -1450
Wire Wire Line
	8950 -1650 9500 -1650
Wire Wire Line
	8950 -1750 9500 -1750
Wire Wire Line
	8950 -1950 9500 -1950
Text Label 9500 -1650 2    50   ~ 0
~FPSPHOE
Text Label 9500 -1950 2    50   ~ 0
~FPSPLOE
Text Notes 9700 -1450 0    50   ~ 0
MFD: DR high
Text Notes 9700 -1650 0    50   ~ 0
MFD: DR low
Text Notes 9700 -1750 0    50   ~ 0
MFD: SP high\n
Text Notes 9700 -1950 0    50   ~ 0
MFD: SP low
Wire Wire Line
	8950 -3250 9500 -3250
Text Label 9500 -3250 2    50   ~ 0
~FPOE0
Text Notes 9700 -3250 0    50   ~ 0
µCV high
Wire Wire Line
	8950 -3450 9500 -3450
Wire Wire Line
	8950 -3550 9500 -3550
Text Label 9500 -3450 2    50   ~ 0
~FPOE4
Text Label 9500 -3550 2    50   ~ 0
~FPOE8
Text Notes 9700 -3450 0    50   ~ 0
AEXT
Text Notes 9700 -3550 0    50   ~ 0
Flags
Wire Wire Line
	8950 -3650 9500 -3650
Text Label 9500 -3650 2    50   ~ 0
~FPOE12
Text Notes 9700 -3650 0    50   ~ 0
(reserved)
Wire Wire Line
	8950 -3750 9500 -3750
Text Label 9500 -3750 2    50   ~ 0
~FPOE24
Wire Wire Line
	8950 -1550 9500 -1550
Text Label 9500 -1550 2    50   ~ 0
~FPOE27
Wire Wire Line
	8950 -3850 9500 -3850
Text Label 9500 -3850 2    50   ~ 0
~FPOE28
Text Label 9500 -1450 2    50   ~ 0
~FPDRHOE
Text Label 9500 -1750 2    50   ~ 0
~FPDRLOE
Wire Wire Line
	8950 -2350 9500 -2350
Text Label 9500 -2350 2    50   ~ 0
~FPOE18
Wire Wire Line
	8950 -2550 9500 -2550
Text Label 9500 -2250 2    50   ~ 0
~FPOE22
$Sheet
S 7800 -4900 1150 4200
U 60A64590
F0 "sheet60A64497" 50
F1 "dfp-bus-right.sch" 50
F2 "AB[0..23]" U L 7800 -4150 50 
F3 "DB[0..15]" U L 7800 -4050 50 
F4 "FPD[0..7]" U L 7800 -3750 50 
F5 "IBUS[0..15]" U L 7800 -4750 50 
F6 "~RESET" U L 7800 -4650 50 
F7 "CLK1" U L 7800 -4550 50 
F8 "CLK2" U L 7800 -4450 50 
F9 "CLK3" U L 7800 -4350 50 
F10 "CLK4" U L 7800 -4250 50 
F11 "T34" U L 7800 -3850 50 
F12 "~IRQ" U L 7800 -3650 50 
F13 "~IRQS" U L 7800 -3550 50 
F14 "~IRQ[0..7]" U L 7800 -3450 50 
F15 "~RSTHOLD" U L 7800 -3350 50 
F16 "~SYSDEV" U L 7800 -3250 50 
F17 "~IODEV1xx" U L 7800 -3150 50 
F18 "~IODEV2xx" U L 7800 -3050 50 
F19 "~IODEV3xx" U L 7800 -2950 50 
F20 "~MEM" U L 7800 -2850 50 
F21 "~IO" U L 7800 -2750 50 
F22 "~R" U L 7800 -2650 50 
F23 "~W" U L 7800 -2550 50 
F24 "~WS" U L 7800 -2450 50 
F25 "~ENDEXT" U L 7800 -2350 50 
F26 "~SKIPEXT" U L 7800 -2250 50 
F27 "~HALT" U L 7800 -2150 50 
F28 "ACTION[0..3]" U L 7800 -1850 50 
F29 "WADDR[0..4]" U L 7800 -1750 50 
F30 "RADDR[0..4]" U L 7800 -1650 50 
F31 "RSVD[0..6]" U L 7800 -1550 50 
F32 "C1" U R 8950 -4750 50 
F33 "C2" U R 8950 -4650 50 
F34 "C3" U R 8950 -4550 50 
F35 "C4" U R 8950 -4450 50 
F36 "C5" U R 8950 -4350 50 
F37 "C6" U R 8950 -4250 50 
F38 "C7" U R 8950 -4150 50 
F39 "C8" U R 8950 -4050 50 
F40 "C9" U R 8950 -3950 50 
F41 "C10" U R 8950 -3850 50 
F42 "C11" U R 8950 -3750 50 
F43 "C12" U R 8950 -3650 50 
F44 "C13" U R 8950 -3550 50 
F45 "C14" U R 8950 -3450 50 
F46 "C15" U R 8950 -3350 50 
F47 "C16" U R 8950 -3250 50 
F48 "C17" U R 8950 -3150 50 
F49 "C18" U R 8950 -3050 50 
F50 "C19" U R 8950 -2950 50 
F51 "C20" U R 8950 -2850 50 
F52 "C21" U R 8950 -2750 50 
F53 "C22" U R 8950 -2650 50 
F54 "C23" U R 8950 -2550 50 
F55 "C24" U R 8950 -2450 50 
F56 "C25" U R 8950 -2350 50 
F57 "C26" U R 8950 -2250 50 
F58 "C27" U R 8950 -2150 50 
F59 "C28" U R 8950 -2050 50 
F60 "C29" U R 8950 -1950 50 
F61 "C30" U R 8950 -1850 50 
F62 "C31" U R 8950 -1750 50 
F63 "C32" U R 8950 -1650 50 
F64 "C33" U R 8950 -1550 50 
F65 "C34" U R 8950 -1450 50 
F66 "C35" U R 8950 -1350 50 
F67 "C36" U R 8950 -1250 50 
F68 "C37" U R 8950 -1150 50 
F69 "C38" U R 8950 -1050 50 
F70 "C39" U R 8950 -950 50 
F71 "C40" U R 8950 -850 50 
F72 "~RUEN" U L 7800 -2050 50 
F73 "~WAITING" U L 7800 -1950 50 
$EndSheet
Wire Wire Line
	8950 -4650 9500 -4650
NoConn ~ 9500 -4650
Wire Wire Line
	7800 -2050 7250 -2050
Wire Wire Line
	7800 -1950 7250 -1950
NoConn ~ 7250 -2050
NoConn ~ 7250 -1950
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
	4450 1100 3900 1100
Text Label 3900 1100 0    50   ~ 0
~RESET
Wire Wire Line
	4450 1200 3900 1200
Text Label 3900 1200 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	3900 1300 4450 1300
Text Label 3900 1300 0    50   ~ 0
~HALT
Wire Wire Line
	4450 1500 3900 1500
Text Label 3900 1500 0    50   ~ 0
FPCLKEN-IN
Wire Wire Line
	4450 1600 3900 1600
Text Label 3900 1600 0    50   ~ 0
FPµSTEP-IN
Wire Wire Line
	4450 1800 3900 1800
Wire Wire Line
	4450 1900 3900 1900
Wire Wire Line
	4450 2000 3900 2000
Wire Wire Line
	4450 2100 3900 2100
Wire Wire Line
	4450 2300 3900 2300
Wire Wire Line
	4450 2500 3900 2500
Wire Wire Line
	4450 2600 3900 2600
Wire Wire Line
	4450 2700 3900 2700
Wire Wire Line
	6000 2000 5600 2000
Wire Wire Line
	6000 2100 5600 2100
Wire Wire Line
	6000 2200 5600 2200
Wire Wire Line
	6000 2300 5600 2300
Wire Wire Line
	6000 2400 5600 2400
Wire Wire Line
	6000 2900 5600 2900
Wire Wire Line
	6000 3000 5600 3000
Wire Wire Line
	3900 3000 4450 3000
Wire Wire Line
	6000 2600 5600 2600
Wire Wire Line
	6000 2700 5600 2700
Wire Wire Line
	3900 3100 4450 3100
Wire Wire Line
	3900 3200 4450 3200
Text Label 6000 2200 2    50   ~ 0
~IBOE
Text Label 6000 2300 2    50   ~ 0
~ABOE
Text Label 6000 2900 2    50   ~ 0
~LTSON
Text Label 6000 3000 2    50   ~ 0
~PANELEN
Text Label 3900 3000 0    50   ~ 0
~LED-STOP
Text Label 6000 2600 2    50   ~ 0
MFD0
Text Label 6000 2700 2    50   ~ 0
MFD1
Wire Bus Line
	5600 1200 6100 1200
Wire Bus Line
	5600 3100 6000 3100
Wire Bus Line
	5600 3200 6000 3200
Text Label 6000 3100 2    50   ~ 0
SWA[0..3]
Text Label 6000 3200 2    50   ~ 0
SWD[0..3]
Text Label 3900 3100 0    50   ~ 0
STEP∕~RUN
Text Label 3900 3200 0    50   ~ 0
~µSTEP
Wire Wire Line
	-3300 10400 -100 10400
$Comp
L power:+5V #PWR?
U 1 1 64D66638
P 200 10400
F 0 "#PWR?" H 200 10250 50  0001 C CNN
F 1 "+5V" H 300 10400 50  0000 C CNN
F 2 "" H 200 10400 50  0001 C CNN
F 3 "" H 200 10400 50  0001 C CNN
	1    200  10400
	1    0    0    -1  
$EndComp
$Sheet
S 6100 950  1150 3150
U 64FC7999
F0 "DFP I/O" 50
F1 "dfp_io.sch" 50
F2 "~WAB0" O R 7250 1300 50 
F3 "~WAB1" O R 7250 1400 50 
F4 "~WAB2" O R 7250 1500 50 
F5 "~WDB0" O R 7250 1600 50 
F6 "~WDB1" O R 7250 1700 50 
F7 "~WIB0" O R 7250 1800 50 
F8 "~WIB1" O R 7250 1900 50 
F9 "~WCV0" O R 7250 2000 50 
F10 "~WCV1" O R 7250 2100 50 
F11 "~WCV2" O R 7250 2200 50 
F12 "~RAB0" O R 7250 2400 50 
F13 "~RAB1" O R 7250 2500 50 
F14 "~RAB2" O R 7250 2600 50 
F15 "~RDB0" O R 7250 2700 50 
F16 "~RDB1" O R 7250 2800 50 
F17 "~RIB0" O R 7250 2900 50 
F18 "~RIB1" O R 7250 3000 50 
F19 "~RCV0" O R 7250 3100 50 
F20 "~RCV1" O R 7250 3200 50 
F21 "~RCV2" O R 7250 3300 50 
F22 "~WR" I L 6100 1300 50 
F23 "~RD" I L 6100 1400 50 
F24 "FPD[0..7]" I L 6100 1100 50 
F25 "~ORHOE" I R 7250 3450 50 
F26 "~ORLOE" I R 7250 3550 50 
F27 "FPA[0..7]" I L 6100 1200 50 
$EndSheet
Wire Wire Line
	5600 1300 6100 1300
Wire Wire Line
	5600 1400 6100 1400
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
	7250 2400 7750 2400
Wire Wire Line
	7250 2500 7750 2500
Wire Wire Line
	7250 2600 7750 2600
Wire Wire Line
	7250 3100 7750 3100
Wire Wire Line
	7250 3200 7750 3200
Wire Wire Line
	7250 3300 7750 3300
Wire Wire Line
	7250 2700 7750 2700
Wire Wire Line
	7250 2800 7750 2800
Wire Wire Line
	7250 2900 7750 2900
Wire Wire Line
	7250 3000 7750 3000
Wire Wire Line
	7250 1300 7750 1300
Wire Wire Line
	7250 1400 7750 1400
Wire Wire Line
	7250 1500 7750 1500
Wire Wire Line
	7250 1600 7750 1600
Wire Wire Line
	7250 1700 7750 1700
Wire Wire Line
	7250 1800 7750 1800
Wire Wire Line
	7250 1900 7750 1900
Wire Wire Line
	7250 2000 7750 2000
Wire Wire Line
	7250 2100 7750 2100
Wire Wire Line
	7250 2200 7750 2200
$Sheet
S 7750 950  1150 2600
U 66CDCD87
F0 "Bus Pods" 50
F1 "pods.sch" 50
F2 "FPD[0..7]" B L 7750 1100 50 
F3 "BUSCP" I R 8900 2500 50 
F4 "~RAB0" I L 7750 2400 50 
F5 "~RAB1" I L 7750 2500 50 
F6 "~RAB2" I L 7750 2600 50 
F7 "~WAB0" I L 7750 1300 50 
F8 "~WAB1" I L 7750 1400 50 
F9 "~WAB2" I L 7750 1500 50 
F10 "~RCV0" I L 7750 3100 50 
F11 "~RCV1" I L 7750 3200 50 
F12 "~RCV2" I L 7750 3300 50 
F13 "~WCV0" I L 7750 2000 50 
F14 "~WCV1" I L 7750 2100 50 
F15 "~WCV2" I L 7750 2200 50 
F16 "~RDB0" I L 7750 2700 50 
F17 "~RDB1" I L 7750 2800 50 
F18 "~WDB0" I L 7750 1600 50 
F19 "~WDB1" I L 7750 1700 50 
F20 "~RIB0" I L 7750 2900 50 
F21 "~RIB1" I L 7750 3000 50 
F22 "~WIB0" I L 7750 1800 50 
F23 "~WIB1" I L 7750 1900 50 
F24 "AB[0..23]" B R 8900 1100 50 
F25 "RADDR[0..4]" B R 8900 1500 50 
F26 "WADDR[0..4]" B R 8900 1600 50 
F27 "ACTION[0..3]" B R 8900 1700 50 
F28 "COND[0..3]" B R 8900 1800 50 
F29 "DB[0..15]" B R 8900 1200 50 
F30 "IBUS[0..15]" B R 8900 1300 50 
F31 "~ABOE" I R 8900 2000 50 
F32 "~CVOE" I R 8900 2300 50 
F33 "~DBOE" I R 8900 2200 50 
F34 "~IBOE" I R 8900 2100 50 
$EndSheet
Wire Bus Line
	5600 1100 6100 1100
Text Label 6000 2100 2    50   ~ 0
~CVOE
Text Label 6000 2000 2    50   ~ 0
BUSCP
Text Label 6000 1400 2    50   ~ 0
~RD
Text Label 6000 1300 2    50   ~ 0
~WR
Text Label 6000 1200 2    50   ~ 0
FPA[0..7]
Text Label 6000 1100 2    50   ~ 0
FPD[0..7]
$Sheet
S 4450 950  1150 2700
U 60757845
F0 "Microcontroller" 50
F1 "microcontroller.sch" 50
F2 "FPD[0..7]" B R 5600 1100 50 
F3 "FPA[0..7]" B R 5600 1200 50 
F4 "~FPHALT" O L 4450 1300 50 
F5 "~FPRAM~∕ROM" O L 4450 2300 50 
F6 "FPCLKEN-IN" O L 4450 1500 50 
F7 "FPµSTEP-IN" O L 4450 1600 50 
F8 "BUSCP" O R 5600 2000 50 
F9 "~MEM" T L 4450 1800 50 
F10 "~IO" T L 4450 1900 50 
F11 "~R" T L 4450 2000 50 
F12 "~W" T L 4450 2100 50 
F13 "CLRWS" O L 4450 2700 50 
F14 "~IBOE" O R 5600 2200 50 
F15 "~ABOE" O R 5600 2300 50 
F16 "~DBOE" O R 5600 2400 50 
F17 "~IOINT" I L 4450 2500 50 
F18 "~WAIT" O L 4450 2600 50 
F19 "~LTSON" O R 5600 2900 50 
F20 "~PANELEN" O R 5600 3000 50 
F21 "~µSTEP" O L 4450 3200 50 
F22 "SWA[0..3]" O R 5600 3100 50 
F23 "SWD[0..3]" O R 5600 3200 50 
F24 "~CVOE" O R 5600 2100 50 
F25 "~FPRESET" O L 4450 1100 50 
F26 "~FPRSTHOLD" O L 4450 1200 50 
F27 "~FPIRQ" O L 4450 2800 50 
F28 "STEP∕~RUN" O L 4450 3100 50 
F29 "~LED-STOP" O L 4450 3000 50 
F30 "MFD0" O R 5600 2600 50 
F31 "MFD1" O R 5600 2700 50 
F32 "~WR" O R 5600 1300 50 
F33 "~RD" O R 5600 1400 50 
$EndSheet
Wire Wire Line
	4450 2800 3900 2800
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
Text Label 3900 2800 0    50   ~ 0
~FPIRQ
Text Label 3900 2700 0    50   ~ 0
CLRWS
Text Label 3900 2600 0    50   ~ 0
~WAIT
Text Label 3900 2500 0    50   ~ 0
~IOINT
Text Label 9400 2200 2    50   ~ 0
~DBOE1
Text Label 6000 2400 2    50   ~ 0
~DBOE0
Wire Wire Line
	2600 -3250 3150 -3250
Text Label 3150 -3250 2    50   ~ 0
~SYSDEV
Wire Wire Line
	2600 -2950 3150 -2950
Wire Wire Line
	2600 -3050 3150 -3050
Text Label 3150 -3050 2    50   ~ 0
~IODEV2xx
Text Label 3150 -2950 2    50   ~ 0
~IODEV3xx
Text Label 3150 -3750 2    50   ~ 0
CFT-FPD[0..7]
Wire Bus Line
	3150 -3750 2600 -3750
Wire Bus Line
	3150 -3450 2600 -3450
Text Label 3150 -3450 2    50   ~ 0
~IRQ[0..7]
Wire Wire Line
	3800 -3650 3250 -3650
Text Label 3150 -3650 2    50   ~ 0
~IRQ
Wire Wire Line
	2600 -3550 3150 -3550
Text Label 3150 -3550 2    50   ~ 0
~IRQS
Wire Wire Line
	2600 -3650 3150 -3650
Wire Wire Line
	50   9900 50   9950
$Comp
L power:GND #PWR?
U 1 1 5FF89A74
P 50 9950
F 0 "#PWR?" H 50  9700 50  0001 C CNN
F 1 "GND" H -100 9850 50  0000 C CNN
F 2 "" H 50  9950 50  0001 C CNN
F 3 "" H 50  9950 50  0001 C CNN
	1    50   9950
	1    0    0    -1  
$EndComp
Text Label 3900 1800 0    50   ~ 0
~MEM
Text Label 3900 1900 0    50   ~ 0
~IO
Text Label 3900 2000 0    50   ~ 0
~R
Text Label 3900 2100 0    50   ~ 0
~W
Text Label 3900 2300 0    50   ~ 0
~FPRAM~∕ROM
Text Label 3150 -1850 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	3150 -1850 2600 -1850
Wire Wire Line
	2600 -1750 3150 -1750
Text Label 3150 -1750 2    50   ~ 0
~PANELEN
Wire Wire Line
	-2950 -1700 -2400 -1700
Wire Wire Line
	4950 -3750 5500 -3750
Wire Wire Line
	4950 -3850 5500 -3850
Wire Wire Line
	4950 -3950 5500 -3950
Wire Wire Line
	4950 -4050 5500 -4050
Wire Wire Line
	4950 -4150 5500 -4150
Wire Wire Line
	4950 -4250 5500 -4250
Wire Wire Line
	4950 -4350 5500 -4350
Text Label 5500 -3650 2    50   ~ 0
FP-FPD0
Text Label 5500 -3750 2    50   ~ 0
FP-FPD1
Text Label 5500 -3850 2    50   ~ 0
FP-FPD2
Text Label 5500 -3950 2    50   ~ 0
FP-FPD3
Text Label 5500 -4050 2    50   ~ 0
FP-FPD4
Text Label 5500 -4150 2    50   ~ 0
FP-FPD5
Text Label 5500 -4250 2    50   ~ 0
FP-FPD6
Text Label 5500 -4350 2    50   ~ 0
FP-FPD7
Wire Wire Line
	4950 -3650 5500 -3650
Text Notes 5550 -4000 0    50   ~ 0
Flipped to account for\nFront Panel Module\nlayout.
Wire Bus Line
	-450 -1750 -450 300 
Wire Bus Line
	5600 -2950 5600 -2650
Wire Bus Line
	5600 -2550 5600 -2250
$EndSCHEMATC
