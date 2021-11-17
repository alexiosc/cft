EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "CFT & Front Panel Buses"
Date ""
Rev "2133"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 9650 9450 2    50   ~ 0
FP-FPD0
Text Label 8450 9450 0    50   ~ 0
FP-FPD1
Text Label 9650 9350 2    50   ~ 0
FP-FPD2
Text Label 8450 9350 0    50   ~ 0
FP-FPD3
Text Label 9650 9250 2    50   ~ 0
FP-FPD4
Text Label 8450 9250 0    50   ~ 0
FP-FPD5
Text Label 9650 9150 2    50   ~ 0
FP-FPD6
Wire Bus Line
	7400 9250 6800 9250
Text HLabel 6800 9250 0    50   Input ~ 0
FPA[0..1]
Text Label 7400 9250 2    50   ~ 0
FPA[0..1]
Wire Bus Line
	7400 9350 6800 9350
Text HLabel 6800 9350 0    50   Input ~ 0
~ROW[1..5]
Wire Bus Line
	7400 9450 6800 9450
Text HLabel 6800 9450 0    50   Input ~ 0
SWA[0..3]
Text Label 7400 9350 2    50   ~ 0
~ROW[1..5]
Text Label 7400 9450 2    50   ~ 0
SWA[0..3]
Wire Bus Line
	7400 9550 6800 9550
Text HLabel 6800 9550 0    50   Input ~ 0
SWD[0..3]
Text Label 7400 9550 2    50   ~ 0
SWD[0..3]
Text Label 7400 9650 2    50   ~ 0
~LTSON
Wire Wire Line
	6800 9650 7400 9650
Text HLabel 6800 9650 0    50   Input ~ 0
~LTSON
Wire Bus Line
	7400 9150 6800 9150
Text HLabel 6800 9150 0    50   Input ~ 0
FP-FPD[0..7]
Text Label 7400 9150 2    50   ~ 0
FP-FPD[0..7]
Wire Wire Line
	8800 9050 8450 9050
Wire Wire Line
	8800 9150 8450 9150
Wire Wire Line
	8800 9250 8450 9250
Wire Wire Line
	8800 9350 8450 9350
Wire Wire Line
	8800 9450 8450 9450
Wire Wire Line
	8800 9550 8450 9550
Wire Wire Line
	8800 9650 8450 9650
Wire Wire Line
	8800 9750 8450 9750
Wire Wire Line
	8800 9850 8450 9850
Wire Wire Line
	8800 9950 8450 9950
Wire Wire Line
	8800 10050 8450 10050
Wire Wire Line
	8800 10150 8450 10150
Wire Wire Line
	9650 9050 9300 9050
Wire Wire Line
	9650 9150 9300 9150
Wire Wire Line
	9650 9250 9300 9250
Wire Wire Line
	9650 9350 9300 9350
Wire Wire Line
	9650 9450 9300 9450
Wire Wire Line
	9650 9550 9300 9550
Wire Wire Line
	9650 9650 9300 9650
Wire Wire Line
	9650 9750 9300 9750
Wire Wire Line
	9650 9850 9300 9850
Wire Wire Line
	9650 9950 9300 9950
Wire Wire Line
	9650 10050 9300 10050
Wire Wire Line
	9650 10150 9300 10150
Text Label 8450 9050 0    50   ~ 0
FP-FPA0
Text Label 9650 9050 2    50   ~ 0
FP-FPA1
Text Label 8450 9150 0    50   ~ 0
FP-FPD7
Text Label 8450 9550 0    50   ~ 0
~ROW1
Text Label 9650 9550 2    50   ~ 0
~ROW2
Text Label 8450 9650 0    50   ~ 0
~ROW3
Text Label 9650 9650 2    50   ~ 0
~ROW4
Text Label 8450 9750 0    50   ~ 0
~ROW5
$Comp
L power:+5V #PWR01
U 1 1 61A879D6
P 8750 8900
F 0 "#PWR01" H 8750 8750 50  0001 C CNN
F 1 "+5V" H 8765 9073 50  0000 C CNN
F 2 "" H 8750 8900 50  0001 C CNN
F 3 "" H 8750 8900 50  0001 C CNN
	1    8750 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 8900 8750 8950
Wire Wire Line
	8750 8950 8800 8950
$Comp
L power:+5V #PWR02
U 1 1 61AB4B50
P 9350 8900
F 0 "#PWR02" H 9350 8750 50  0001 C CNN
F 1 "+5V" H 9365 9073 50  0000 C CNN
F 2 "" H 9350 8900 50  0001 C CNN
F 3 "" H 9350 8900 50  0001 C CNN
	1    9350 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 8950 9350 8950
Wire Wire Line
	9350 8950 9350 8900
Wire Wire Line
	8800 10250 8450 10250
$Comp
L power:GND #PWR03
U 1 1 61B106C5
P 8750 10400
F 0 "#PWR03" H 8750 10150 50  0001 C CNN
F 1 "GND" H 8755 10227 50  0000 C CNN
F 2 "" H 8750 10400 50  0001 C CNN
F 3 "" H 8750 10400 50  0001 C CNN
	1    8750 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 10400 8750 10350
Wire Wire Line
	8750 10350 8800 10350
$Comp
L power:GND #PWR04
U 1 1 61B3CE62
P 9350 10400
F 0 "#PWR04" H 9350 10150 50  0001 C CNN
F 1 "GND" H 9355 10227 50  0000 C CNN
F 2 "" H 9350 10400 50  0001 C CNN
F 3 "" H 9350 10400 50  0001 C CNN
	1    9350 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 10250 9350 10250
Wire Wire Line
	9350 10250 9350 10350
Wire Wire Line
	9300 10350 9350 10350
Connection ~ 9350 10350
Wire Wire Line
	9350 10350 9350 10400
Text Label 9650 9750 2    50   ~ 0
SWA0
Text Label 8450 9850 0    50   ~ 0
SWA1
Text Label 9650 9850 2    50   ~ 0
SWA2
Text Label 8450 9950 0    50   ~ 0
SWA3
Text Label 9650 9950 2    50   ~ 0
SWD0
Text Label 8450 10050 0    50   ~ 0
SWD1
Text Label 9650 10050 2    50   ~ 0
SWD2
Text Label 8450 10150 0    50   ~ 0
SWD3
Text Label 9650 10150 2    50   ~ 0
~LTSON
Text Label 8450 10250 0    50   ~ 0
POWER
Text Notes 8250 11450 0    50   ~ 0
Note: this is for front panel modules with\nrevision 1951 only! For newer revisions,\nthe order of FPD0-7 must be reversed\nwith a twist in the ribbon cable between\nwires 3 and 12.\n\nThe POWER input may not be needed if\nthe key switch is wired directly to the\npower supply.
$Comp
L Connector_Generic:Conn_02x15_Odd_Even J2
U 1 1 615879D6
P 9000 9650
F 0 "J2" H 9050 10475 50  0000 C CNN
F 1 "Conn_02x15_Odd_Even" H 9050 10476 50  0001 C CNN
F 2 "Connector_IDC:IDC-Header_2x15_P2.54mm_Horizontal" H 9000 9650 50  0001 C CNN
F 3 "~" H 9000 9650 50  0001 C CNN
	1    9000 9650
	1    0    0    -1  
$EndComp
Entry Bus Bus
	2450 5000 2550 5100
Text HLabel 1350 5000 0    50   Input ~ 0
CFT-FPD[0..7]
$Comp
L alexios:74HC541 U28
U 1 1 61794398
P 4100 5950
F 0 "U28" H 4100 6717 50  0000 C CNN
F 1 "74HC541" H 4100 6626 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4100 5950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4100 5950 50  0001 C CNN
	1    4100 5950
	1    0    0    -1  
$EndComp
Text Label 3450 6350 2    50   ~ 0
~PANELEN
Wire Wire Line
	3550 6450 3600 6450
Text HLabel 3050 6350 0    50   Input ~ 0
~PANELEN
Text Label 4900 5750 2    50   ~ 0
FPD3
Text Label 4900 5650 2    50   ~ 0
FPD2
Text Label 4900 5550 2    50   ~ 0
FPD1
Text Label 4900 5450 2    50   ~ 0
FPD0
Wire Wire Line
	4950 5750 4600 5750
Wire Wire Line
	4950 5650 4600 5650
Wire Wire Line
	4950 5550 4600 5550
Wire Wire Line
	4950 5450 4600 5450
Text Label 4900 6150 2    50   ~ 0
FPD7
Text Label 4900 6050 2    50   ~ 0
FPD6
Text Label 4900 5950 2    50   ~ 0
FPD5
Text Label 4900 5850 2    50   ~ 0
FPD4
Wire Wire Line
	4950 6150 4600 6150
Wire Wire Line
	4950 6050 4600 6050
Wire Wire Line
	4950 5950 4600 5950
Wire Wire Line
	4950 5850 4600 5850
Entry Wire Line
	5050 5350 4950 5450
Entry Wire Line
	5050 5450 4950 5550
Entry Wire Line
	5050 5550 4950 5650
Entry Wire Line
	5050 5650 4950 5750
Entry Wire Line
	5050 5750 4950 5850
Entry Wire Line
	5050 5850 4950 5950
Entry Wire Line
	5050 5950 4950 6050
Entry Wire Line
	5050 6050 4950 6150
Text Label 2700 6150 0    50   ~ 0
CFT-FPD7
Text Label 2700 6050 0    50   ~ 0
CFT-FPD6
Text Label 2700 5950 0    50   ~ 0
CFT-FPD5
Text Label 2700 5850 0    50   ~ 0
CFT-FPD4
Text Label 2700 5750 0    50   ~ 0
CFT-FPD3
Text Label 2700 5650 0    50   ~ 0
CFT-FPD2
Text Label 2700 5550 0    50   ~ 0
CFT-FPD1
Text Label 2700 5450 0    50   ~ 0
CFT-FPD0
Text Label 2350 6150 2    50   ~ 0
CFT-FPD7
Text Label 2350 6050 2    50   ~ 0
CFT-FPD6
Text Label 2350 5950 2    50   ~ 0
CFT-FPD5
Text Label 2350 5850 2    50   ~ 0
CFT-FPD4
Text Label 2350 5750 2    50   ~ 0
CFT-FPD3
Text Label 2350 5650 2    50   ~ 0
CFT-FPD2
Text Label 2350 5550 2    50   ~ 0
CFT-FPD1
Text Label 2350 5450 2    50   ~ 0
CFT-FPD0
Entry Bus Bus
	5150 5000 5050 5100
Wire Bus Line
	9300 5000 5150 5000
Text HLabel 9300 5000 2    50   UnSpc ~ 0
FPD[0..7]
$Comp
L alexios:74HC541 U29
U 1 1 61794399
P 6000 5950
F 0 "U29" H 6000 6717 50  0000 C CNN
F 1 "74HC541" H 6000 6626 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6000 5950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6000 5950 50  0001 C CNN
	1    6000 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 6350 5450 6350
Wire Wire Line
	5500 6450 5450 6450
$Comp
L power:GND #PWR0142
U 1 1 6179439A
P 5450 6500
F 0 "#PWR0142" H 5450 6250 50  0001 C CNN
F 1 "GND" H 5455 6327 50  0000 C CNN
F 2 "" H 5450 6500 50  0001 C CNN
F 3 "" H 5450 6500 50  0001 C CNN
	1    5450 6500
	1    0    0    -1  
$EndComp
Entry Wire Line
	9000 5350 8900 5450
Entry Wire Line
	9000 5450 8900 5550
Entry Wire Line
	9000 5550 8900 5650
Entry Wire Line
	9000 5650 8900 5750
Entry Wire Line
	9000 5750 8900 5850
Entry Wire Line
	9000 5850 8900 5950
Entry Wire Line
	9000 5950 8900 6050
Entry Wire Line
	9000 6050 8900 6150
Entry Wire Line
	5050 5350 5150 5450
Entry Wire Line
	5050 5450 5150 5550
Entry Wire Line
	5050 5550 5150 5650
Entry Wire Line
	5050 5650 5150 5750
Entry Wire Line
	5050 5750 5150 5850
Entry Wire Line
	5050 5850 5150 5950
Entry Wire Line
	5050 5950 5150 6050
Entry Wire Line
	5050 6050 5150 6150
Text Label 5450 5750 2    50   ~ 0
FPD3
Text Label 5450 5650 2    50   ~ 0
FPD2
Text Label 5450 5550 2    50   ~ 0
FPD1
Text Label 5450 5450 2    50   ~ 0
FPD0
Wire Wire Line
	5500 5750 5150 5750
Wire Wire Line
	5500 5650 5150 5650
Wire Wire Line
	5500 5550 5150 5550
Wire Wire Line
	5500 5450 5150 5450
Text Label 5450 6150 2    50   ~ 0
FPD7
Text Label 5450 6050 2    50   ~ 0
FPD6
Text Label 5450 5950 2    50   ~ 0
FPD5
Text Label 5450 5850 2    50   ~ 0
FPD4
Wire Wire Line
	5500 6150 5150 6150
Wire Wire Line
	5500 6050 5150 6050
Wire Wire Line
	5500 5950 5150 5950
Wire Wire Line
	5500 5850 5150 5850
Text HLabel 9300 5150 2    50   Output ~ 0
FP-FPD[0..7]
Wire Bus Line
	9300 5150 9100 5150
Entry Bus Bus
	9100 5150 9000 5250
Wire Wire Line
	5450 6350 5450 6450
Connection ~ 5450 6450
Wire Wire Line
	5450 6450 5450 6500
$Comp
L power:GND #PWR0145
U 1 1 5FDEF369
P 7500 6500
F 0 "#PWR0145" H 7500 6250 50  0001 C CNN
F 1 "GND" H 7505 6327 50  0000 C CNN
F 2 "" H 7500 6500 50  0001 C CNN
F 3 "" H 7500 6500 50  0001 C CNN
	1    7500 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:PESD5V2S2UT D19
U 1 1 5FE16E3D
P 8300 6400
F 0 "D19" H 8550 6250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8200 6150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8300 5800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 8200 6425 50  0001 C CNN
	1    8300 6400
	-1   0    0    -1  
$EndComp
$Comp
L alexios:PESD5V2S2UT D20
U 1 1 5FE16E43
P 8700 6400
F 0 "D20" H 8950 6250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8600 6150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8700 5800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 8600 6425 50  0001 C CNN
	1    8700 6400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 5FE492B5
P 7900 6500
F 0 "#PWR0146" H 7900 6250 50  0001 C CNN
F 1 "GND" H 7905 6327 50  0000 C CNN
F 2 "" H 7900 6500 50  0001 C CNN
F 3 "" H 7900 6500 50  0001 C CNN
	1    7900 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0147
U 1 1 5FE49524
P 8300 6500
F 0 "#PWR0147" H 8300 6250 50  0001 C CNN
F 1 "GND" H 8305 6327 50  0000 C CNN
F 2 "" H 8300 6500 50  0001 C CNN
F 3 "" H 8300 6500 50  0001 C CNN
	1    8300 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0148
U 1 1 5FE4971B
P 8700 6500
F 0 "#PWR0148" H 8700 6250 50  0001 C CNN
F 1 "GND" H 8705 6327 50  0000 C CNN
F 2 "" H 8700 6500 50  0001 C CNN
F 3 "" H 8700 6500 50  0001 C CNN
	1    8700 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U28
U 2 1 6179438F
P 4100 7000
F 0 "U28" H 4280 7046 50  0000 L CNN
F 1 "74HC541" H 4280 6955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4100 7000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4100 7000 50  0001 C CNN
	2    4100 7000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U29
U 2 1 5FE8DA93
P 6000 7000
F 0 "U29" H 6180 7046 50  0000 L CNN
F 1 "74HC541" H 6180 6955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6000 7000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6000 7000 50  0001 C CNN
	2    6000 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61794391
P 5650 7000
AR Path="/61794391" Ref="C?"  Part="1" 
AR Path="/60757845/61794391" Ref="C?"  Part="1" 
AR Path="/64FC7999/61794391" Ref="C?"  Part="1" 
AR Path="/60A2F3C0/61794391" Ref="C29"  Part="1" 
AR Path="/5FE640D1/61794391" Ref="C29"  Part="1" 
F 0 "C29" H 5559 7046 50  0000 R CNN
F 1 "100nF" H 5559 6955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5650 7000 50  0001 C CNN
F 3 "~" H 5650 7000 50  0001 C CNN
	1    5650 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FEB43DF
P 5650 6900
AR Path="/5FEB43DF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEB43DF" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEB43DF" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEB43DF" Ref="#PWR0143"  Part="1" 
AR Path="/5FE640D1/5FEB43DF" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 5650 6750 50  0001 C CNN
F 1 "+5V" H 5665 7073 50  0000 C CNN
F 2 "" H 5650 6900 50  0001 C CNN
F 3 "" H 5650 6900 50  0001 C CNN
	1    5650 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FEB43E5
P 5650 7100
AR Path="/5FEB43E5" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEB43E5" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEB43E5" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEB43E5" Ref="#PWR0144"  Part="1" 
AR Path="/5FE640D1/5FEB43E5" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 5650 6850 50  0001 C CNN
F 1 "GND" H 5655 6927 50  0000 C CNN
F 2 "" H 5650 7100 50  0001 C CNN
F 3 "" H 5650 7100 50  0001 C CNN
	1    5650 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FEBAF89
P 3750 7000
AR Path="/5FEBAF89" Ref="C?"  Part="1" 
AR Path="/60757845/5FEBAF89" Ref="C?"  Part="1" 
AR Path="/64FC7999/5FEBAF89" Ref="C?"  Part="1" 
AR Path="/60A2F3C0/5FEBAF89" Ref="C28"  Part="1" 
AR Path="/5FE640D1/5FEBAF89" Ref="C28"  Part="1" 
F 0 "C28" H 3659 7046 50  0000 R CNN
F 1 "100nF" H 3659 6955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 7000 50  0001 C CNN
F 3 "~" H 3750 7000 50  0001 C CNN
	1    3750 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FEBAF8F
P 3750 6900
AR Path="/5FEBAF8F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEBAF8F" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEBAF8F" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEBAF8F" Ref="#PWR0140"  Part="1" 
AR Path="/5FE640D1/5FEBAF8F" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 3750 6750 50  0001 C CNN
F 1 "+5V" H 3765 7073 50  0000 C CNN
F 2 "" H 3750 6900 50  0001 C CNN
F 3 "" H 3750 6900 50  0001 C CNN
	1    3750 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FEBAF95
P 3750 7100
AR Path="/5FEBAF95" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEBAF95" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEBAF95" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEBAF95" Ref="#PWR0141"  Part="1" 
AR Path="/5FE640D1/5FEBAF95" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 3750 6850 50  0001 C CNN
F 1 "GND" H 3755 6927 50  0000 C CNN
F 2 "" H 3750 7100 50  0001 C CNN
F 3 "" H 3750 7100 50  0001 C CNN
	1    3750 7100
	1    0    0    -1  
$EndComp
Connection ~ 5650 6900
Connection ~ 5650 7100
Entry Wire Line
	2650 6150 2550 6050
Entry Wire Line
	2650 6050 2550 5950
Entry Wire Line
	2650 5950 2550 5850
Entry Wire Line
	2650 5850 2550 5750
Entry Wire Line
	2650 5750 2550 5650
Entry Wire Line
	2650 5650 2550 5550
Entry Wire Line
	2650 5550 2550 5450
Entry Wire Line
	2650 5450 2550 5350
Wire Bus Line
	1350 5000 2450 5000
Entry Wire Line
	2450 6150 2550 6050
Entry Wire Line
	2450 6050 2550 5950
Entry Wire Line
	2450 5950 2550 5850
Entry Wire Line
	2450 5750 2550 5650
Entry Wire Line
	2450 5650 2550 5550
Entry Wire Line
	2450 5550 2550 5450
Entry Wire Line
	2450 5450 2550 5350
Entry Wire Line
	2450 5850 2550 5750
Wire Wire Line
	2450 6150 1900 6150
Wire Wire Line
	2450 6050 1900 6050
Wire Wire Line
	2450 5950 1900 5950
Wire Wire Line
	2450 5850 1900 5850
Wire Wire Line
	2450 5750 1900 5750
Wire Wire Line
	2450 5650 1900 5650
Wire Wire Line
	2450 5550 1900 5550
Wire Wire Line
	2450 5450 1900 5450
Wire Wire Line
	6950 5550 7800 5550
Wire Wire Line
	6950 5950 8600 5950
$Comp
L alexios:PESD5V2S2UT D18
U 1 1 61794389
P 7900 6400
F 0 "D18" H 8150 6250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 7800 6150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7900 5800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 7800 6425 50  0001 C CNN
	1    7900 6400
	-1   0    0    -1  
$EndComp
Text Notes 1500 6450 0    50   ~ 0
Optional; the backplane\nhas bus hold for FPD.
Wire Wire Line
	3050 6350 3600 6350
$Comp
L power:GND #PWR0163
U 1 1 6179439B
P 3550 6500
F 0 "#PWR0163" H 3550 6250 50  0001 C CNN
F 1 "GND" H 3555 6327 50  0000 C CNN
F 2 "" H 3550 6500 50  0001 C CNN
F 3 "" H 3550 6500 50  0001 C CNN
	1    3550 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 6450 3550 6500
Text Label 6950 5450 0    50   ~ 0
FP-FPD0
Text Label 6950 5550 0    50   ~ 0
FP-FPD1
Text Label 6950 5650 0    50   ~ 0
FP-FPD2
Text Label 6950 5750 0    50   ~ 0
FP-FPD3
Text Label 6950 5850 0    50   ~ 0
FP-FPD4
Text Label 6950 5950 0    50   ~ 0
FP-FPD5
Text Label 6950 6050 0    50   ~ 0
FP-FPD6
Text Label 6950 6150 0    50   ~ 0
FP-FPD7
Wire Wire Line
	7600 5450 8900 5450
Connection ~ 7600 5450
Wire Wire Line
	7600 6250 7600 5450
Wire Wire Line
	6950 5450 7600 5450
Wire Wire Line
	6950 5650 7400 5650
Wire Wire Line
	7400 5650 8900 5650
Connection ~ 7400 5650
Wire Wire Line
	7400 6250 7400 5650
$Comp
L alexios:PESD5V2S2UT D17
U 1 1 61794387
P 7500 6400
F 0 "D17" H 7800 6250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8300 6400 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7500 5800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 7400 6425 50  0001 C CNN
	1    7500 6400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6950 5750 8000 5750
Wire Wire Line
	7800 6250 7800 5550
Connection ~ 7800 5550
Wire Wire Line
	7800 5550 8900 5550
Wire Wire Line
	8000 6250 8000 5750
Connection ~ 8000 5750
Wire Wire Line
	8000 5750 8900 5750
Wire Wire Line
	6950 5850 8400 5850
Wire Wire Line
	6950 6050 8200 6050
Wire Wire Line
	8200 6250 8200 6050
Connection ~ 8200 6050
Wire Wire Line
	8200 6050 8900 6050
Wire Wire Line
	8400 6250 8400 5850
Connection ~ 8400 5850
Wire Wire Line
	8400 5850 8900 5850
Connection ~ 8600 5950
Wire Wire Line
	6950 6150 8800 6150
Wire Wire Line
	8600 5950 8600 6250
Wire Wire Line
	8600 5950 8900 5950
Wire Wire Line
	8800 6250 8800 6150
Connection ~ 8800 6150
Wire Wire Line
	8800 6150 8900 6150
Wire Wire Line
	2650 6150 3200 6150
Wire Wire Line
	2650 6050 3200 6050
Wire Wire Line
	2650 5950 3200 5950
Wire Wire Line
	2650 5850 3200 5850
Wire Wire Line
	2650 5750 3200 5750
Wire Wire Line
	2650 5650 3200 5650
Wire Wire Line
	2650 5550 3200 5550
Wire Wire Line
	2650 5450 3200 5450
$Comp
L Device:R_Pack08 RN?
U 1 1 62CC0973
P 3400 5850
AR Path="/66CDCD87/61678CAE/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61B4C1AE/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61C8EF6B/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D0EECC/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D30C1E/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB558/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB5B6/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CD84/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CDCA/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C9920/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C999E/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C99B4/62CC0973" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/62CC0973" Ref="RN1701"  Part="1" 
AR Path="/5FE640D1/62CC0973" Ref="RN1701"  Part="1" 
F 0 "RN1701" V 2783 5850 50  0000 C CNN
F 1 "1kΩ" V 2874 5850 50  0000 C CNN
F 2 "alexios:Resistor-Pack-DIP-16_W7.62mm" V 3875 5850 50  0001 C CNN
F 3 "~" H 3400 5850 50  0001 C CNN
	1    3400 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Network08 RN?
U 1 1 62CF0B32
P 1700 5850
AR Path="/60757845/62CF0B32" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/62CF0B32" Ref="RN1702"  Part="1" 
AR Path="/5FE640D1/62CF0B32" Ref="RN1702"  Part="1" 
F 0 "RN1702" V 1083 5850 50  0000 C CNN
F 1 "10kΩ" V 1174 5850 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 2175 5850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 1700 5850 50  0001 C CNN
	1    1700 5850
	0    -1   1    0   
$EndComp
Wire Wire Line
	1450 5400 1450 5450
Wire Wire Line
	1500 5450 1450 5450
$Comp
L power:+5V #PWR0136
U 1 1 6091143C
P 1450 5400
F 0 "#PWR0136" H 1450 5250 50  0001 C CNN
F 1 "+5V" H 1465 5573 50  0000 C CNN
F 2 "" H 1450 5400 50  0001 C CNN
F 3 "" H 1450 5400 50  0001 C CNN
	1    1450 5400
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Pack08 RN?
U 1 1 63156B4F
P 6750 5850
AR Path="/66CDCD87/61678CAE/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61B4C1AE/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61C8EF6B/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D0EECC/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D30C1E/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB558/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB5B6/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CD84/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CDCA/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C9920/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C999E/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C99B4/63156B4F" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/63156B4F" Ref="RN1703"  Part="1" 
AR Path="/5FE640D1/63156B4F" Ref="RN1703"  Part="1" 
F 0 "RN1703" V 6133 5850 50  0000 C CNN
F 1 "1kΩ" V 6224 5850 50  0000 C CNN
F 2 "alexios:Resistor-Pack-DIP-16_W7.62mm" V 7225 5850 50  0001 C CNN
F 3 "~" H 6750 5850 50  0001 C CNN
	1    6750 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	6500 5450 6550 5450
Wire Wire Line
	6500 5550 6550 5550
Wire Wire Line
	6500 5650 6550 5650
Wire Wire Line
	6500 5750 6550 5750
Wire Wire Line
	6500 5850 6550 5850
Wire Wire Line
	6500 5950 6550 5950
Wire Wire Line
	6500 6050 6550 6050
Wire Wire Line
	6500 6150 6550 6150
Text Notes 1450 4950 0    50   ~ 0
up-to-date
Connection ~ 3750 6900
Connection ~ 3750 7100
NoConn ~ 8450 10250
$Comp
L alexios:PESD5V2S2UT D21
U 1 1 63909192
P 10400 6100
F 0 "D21" H 10650 5950 50  0000 R CNN
F 1 "PESD5V2S2UT" H 10300 5850 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 10400 5500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 10300 6125 50  0001 C CNN
	1    10400 6100
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6390A3D5
P 10400 6200
F 0 "#PWR05" H 10400 5950 50  0001 C CNN
F 1 "GND" H 10405 6027 50  0000 C CNN
F 2 "" H 10400 6200 50  0001 C CNN
F 3 "" H 10400 6200 50  0001 C CNN
	1    10400 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 5950 10300 5750
Wire Wire Line
	10300 5750 10750 5750
Wire Wire Line
	10500 5950 10500 5850
Wire Wire Line
	10500 5850 10750 5850
Text Label 10750 5750 2    50   ~ 0
FP-FPA0
Text Label 10750 5850 2    50   ~ 0
FP-FPA1
$Comp
L Device:R_Small R?
U 1 1 639C4088
P 9950 5750
AR Path="/639C4088" Ref="R?"  Part="1" 
AR Path="/60757845/639C4088" Ref="R?"  Part="1" 
AR Path="/5FE640D1/639C4088" Ref="R9"  Part="1" 
F 0 "R9" V 10000 5950 50  0000 C CNN
F 1 "1kΩ" V 10000 5550 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 5750 50  0001 C CNN
F 3 "~" H 9950 5750 50  0001 C CNN
	1    9950 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10050 5750 10300 5750
Connection ~ 10300 5750
Connection ~ 10500 5850
$Comp
L Device:R_Small R?
U 1 1 63B0F292
P 9950 5850
AR Path="/63B0F292" Ref="R?"  Part="1" 
AR Path="/60757845/63B0F292" Ref="R?"  Part="1" 
AR Path="/5FE640D1/63B0F292" Ref="R11"  Part="1" 
F 0 "R11" V 10000 6050 50  0000 C CNN
F 1 "1kΩ" V 10000 5650 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 5850 50  0001 C CNN
F 3 "~" H 9950 5850 50  0001 C CNN
	1    9950 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10050 5850 10500 5850
Wire Wire Line
	9850 5750 9500 5750
Wire Wire Line
	9850 5850 9500 5850
Text Label 9500 5750 0    50   ~ 0
FPA0
Text Label 9500 5850 0    50   ~ 0
FPA1
Wire Bus Line
	2550 5100 2550 6050
Wire Bus Line
	9000 5250 9000 6050
Wire Bus Line
	5050 5100 5050 6050
$EndSCHEMATC
