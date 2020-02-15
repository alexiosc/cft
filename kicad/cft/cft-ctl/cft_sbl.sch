EESchema Schematic File Version 4
LIBS:cft-ctl-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 11
Title "Skip/Branch Unit"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "sbu.v"
$EndDescr
$Comp
L Device:R_Small R?
U 1 1 5F0313EC
P 8400 950
AR Path="/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F0313EC" Ref="R2"  Part="1" 
F 0 "R2" H 8459 996 50  0000 L CNN
F 1 "4.7kΩ" H 8459 905 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8400 950 50  0001 C CNN
F 3 "~" H 8400 950 50  0001 C CNN
	1    8400 950 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0313F2
P 8400 850
AR Path="/5F0313F2" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5F0313F2" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0313F2" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 8400 700 50  0001 C CNN
F 1 "+5V" H 8415 1023 50  0000 C CNN
F 2 "" H 8400 850 50  0001 C CNN
F 3 "" H 8400 850 50  0001 C CNN
	1    8400 850 
	1    0    0    -1  
$EndComp
Text HLabel 1050 5550 0    50   Input ~ 0
COND[0..3]
Text HLabel 1050 1700 0    50   Input ~ 0
IR[0..15]
Entry Bus Bus
	1600 1700 1700 1800
Text Label 1100 1700 0    50   ~ 0
IR[0..15]
Text Label 1100 5550 0    50   ~ 0
COND[0..3]
Entry Bus Bus
	5650 5550 5750 5450
Wire Bus Line
	1050 5550 5650 5550
Text Label 1100 1500 0    50   ~ 0
~SKIPEXT
Text Label 8400 4600 3    50   ~ 0
~COND0
$Comp
L alexios:74LVC1G74 U?
U 2 1 5F031452
P 10300 6450
AR Path="/5F031452" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031452" Ref="U8"  Part="2" 
F 0 "U8" H 10480 6496 50  0000 L CNN
F 1 "74LVC1G74" H 10480 6405 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 10750 6450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 10750 6450 50  0001 C CNN
	2    10300 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F031458
P 950 7400
AR Path="/5CC0D65F/5F031458" Ref="C?"  Part="1" 
AR Path="/5F031458" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F031458" Ref="C6"  Part="1" 
F 0 "C6" H 859 7446 50  0000 R CNN
F 1 "100nF" H 859 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 7400 50  0001 C CNN
F 3 "~" H 950 7400 50  0001 C CNN
	1    950  7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F03145E
P 2300 7400
AR Path="/5CC0D65F/5F03145E" Ref="C?"  Part="1" 
AR Path="/5F03145E" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F03145E" Ref="C7"  Part="1" 
F 0 "C7" H 2209 7446 50  0000 R CNN
F 1 "100nF" H 2209 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 7400 50  0001 C CNN
F 3 "~" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F031464
P 3650 7400
AR Path="/5CC0D65F/5F031464" Ref="C?"  Part="1" 
AR Path="/5F031464" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F031464" Ref="C8"  Part="1" 
F 0 "C8" H 3559 7446 50  0000 R CNN
F 1 "100nF" H 3559 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3650 7400 50  0001 C CNN
F 3 "~" H 3650 7400 50  0001 C CNN
	1    3650 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F03146A
P 9950 6450
AR Path="/5CC0D65F/5F03146A" Ref="C?"  Part="1" 
AR Path="/5F03146A" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F03146A" Ref="C9"  Part="1" 
F 0 "C9" H 9859 6496 50  0000 R CNN
F 1 "100nF" H 9859 6405 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9950 6450 50  0001 C CNN
F 3 "~" H 9950 6450 50  0001 C CNN
	1    9950 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F031470
P 950 7500
AR Path="/5F031470" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031470" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 950 7250 50  0001 C CNN
F 1 "GND" H 955 7327 50  0000 C CNN
F 2 "" H 950 7500 50  0001 C CNN
F 3 "" H 950 7500 50  0001 C CNN
	1    950  7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F031476
P 2300 7500
AR Path="/5F031476" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031476" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 2300 7250 50  0001 C CNN
F 1 "GND" H 2305 7327 50  0000 C CNN
F 2 "" H 2300 7500 50  0001 C CNN
F 3 "" H 2300 7500 50  0001 C CNN
	1    2300 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F03147C
P 3650 7500
AR Path="/5F03147C" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03147C" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 3650 7250 50  0001 C CNN
F 1 "GND" H 3655 7327 50  0000 C CNN
F 2 "" H 3650 7500 50  0001 C CNN
F 3 "" H 3650 7500 50  0001 C CNN
	1    3650 7500
	1    0    0    -1  
$EndComp
Connection ~ 9950 6550
$Comp
L power:GND #PWR?
U 1 1 5F031483
P 9950 6550
AR Path="/5F031483" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031483" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 9950 6300 50  0001 C CNN
F 1 "GND" H 9955 6377 50  0000 C CNN
F 2 "" H 9950 6550 50  0001 C CNN
F 3 "" H 9950 6550 50  0001 C CNN
	1    9950 6550
	1    0    0    -1  
$EndComp
Connection ~ 9950 6350
$Comp
L power:+5V #PWR?
U 1 1 5F03148A
P 9950 6350
AR Path="/5F03148A" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03148A" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 9950 6200 50  0001 C CNN
F 1 "+5V" H 9965 6523 50  0000 C CNN
F 2 "" H 9950 6350 50  0001 C CNN
F 3 "" H 9950 6350 50  0001 C CNN
	1    9950 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F031490
P 3650 7300
AR Path="/5F031490" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031490" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 3650 7150 50  0001 C CNN
F 1 "+5V" H 3665 7473 50  0000 C CNN
F 2 "" H 3650 7300 50  0001 C CNN
F 3 "" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F031496
P 2300 7300
AR Path="/5F031496" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031496" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 2300 7150 50  0001 C CNN
F 1 "+5V" H 2315 7473 50  0000 C CNN
F 2 "" H 2300 7300 50  0001 C CNN
F 3 "" H 2300 7300 50  0001 C CNN
	1    2300 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F03149C
P 950 7300
AR Path="/5F03149C" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03149C" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 950 7150 50  0001 C CNN
F 1 "+5V" H 965 7473 50  0000 C CNN
F 2 "" H 950 7300 50  0001 C CNN
F 3 "" H 950 7300 50  0001 C CNN
	1    950  7300
	1    0    0    -1  
$EndComp
Text Label 7050 5050 2    50   ~ 0
COND2
Text Label 7050 4950 2    50   ~ 0
COND1
Text Label 7050 4850 2    50   ~ 0
COND0
Wire Wire Line
	5600 4250 7050 4250
Wire Wire Line
	5500 4350 7050 4350
Wire Wire Line
	5400 4450 7050 4450
Wire Wire Line
	5300 4550 7050 4550
Text Label 7650 1500 0    50   ~ 0
~SKIPEXT
Connection ~ 3650 7300
Connection ~ 3650 7500
$Comp
L alexios:74LVC1G11 U?
U 2 1 5F0314E3
P 4100 7250
AR Path="/5F0314E3" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F0314E3" Ref="U7"  Part="2" 
F 0 "U7" H 4180 7146 50  0000 L CNN
F 1 "74LVC1G11" H 4180 7055 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4100 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4100 7250 50  0001 C CNN
	2    4100 7250
	1    0    0    -1  
$EndComp
Text Label 7050 4550 2    50   ~ 0
FN
Text Label 7050 4450 2    50   ~ 0
FZ
Text Label 7050 4250 2    50   ~ 0
FV
Text Label 7050 4350 2    50   ~ 0
FL
Wire Wire Line
	5850 3200 7050 3200
Wire Wire Line
	5850 3000 7050 3000
Wire Wire Line
	5850 2900 7050 2900
Wire Wire Line
	5850 2800 7050 2800
Text Label 5900 5250 0    50   ~ 0
COND3
Wire Wire Line
	5850 5250 6150 5250
Entry Wire Line
	5850 5250 5750 5350
Wire Wire Line
	5850 5050 7050 5050
Wire Wire Line
	5850 4950 7050 4950
Wire Wire Line
	5850 4850 7050 4850
Entry Wire Line
	5850 5050 5750 5150
Entry Wire Line
	5850 4950 5750 5050
Entry Wire Line
	5850 4850 5750 4950
Text Label 7050 3200 2    50   ~ 0
COND3
Text Label 7050 3000 2    50   ~ 0
COND2
Text Label 7050 2900 2    50   ~ 0
COND1
Text Label 7050 2800 2    50   ~ 0
COND0
Text Label 6100 3200 0    50   ~ 0
COND3
Text Label 6100 3000 0    50   ~ 0
COND2
Text Label 6100 2900 0    50   ~ 0
COND1
Text Label 6100 2800 0    50   ~ 0
COND0
Entry Wire Line
	5850 3200 5750 3300
Entry Wire Line
	5850 3000 5750 3100
Entry Wire Line
	5850 2900 5750 3000
Entry Wire Line
	5850 2800 5750 2900
Text Label 5750 3850 1    50   ~ 0
COND[0..3]
Text Label 7050 5250 2    50   ~ 0
~COND3
Connection ~ 2300 7500
Connection ~ 2300 7300
$Comp
L alexios:74HC251 U?
U 2 1 5F031555
P 2650 7900
AR Path="/5F031555" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031555" Ref="U5"  Part="2" 
F 0 "U5" H 2830 8446 50  0000 L CNN
F 1 "74HC251" H 2830 8355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2650 7850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 2650 7850 50  0001 C CNN
	2    2650 7900
	1    0    0    -1  
$EndComp
Connection ~ 950  7500
Connection ~ 950  7300
$Comp
L alexios:74HC251 U?
U 2 1 5F03155D
P 1300 7900
AR Path="/5F03155D" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F03155D" Ref="U1"  Part="2" 
F 0 "U1" H 1480 8446 50  0000 L CNN
F 1 "74HC251" H 1480 8355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 7850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 1300 7850 50  0001 C CNN
	2    1300 7900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC251 U?
U 1 1 5F03157B
P 7550 2500
AR Path="/5F03157B" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03157B" Ref="U1"  Part="1" 
F 0 "U1" H 7550 3367 50  0000 C CNN
F 1 "74HC251" H 7550 3276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7550 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7550 2450 50  0001 C CNN
	1    7550 2500
	1    0    0    -1  
$EndComp
Text Label 7050 4650 2    50   ~ 0
IFBRANCH
Entry Wire Line
	1700 4600 1800 4700
Entry Wire Line
	1700 4150 1800 4250
Entry Wire Line
	1700 3700 1800 3800
Entry Wire Line
	1700 3250 1800 3350
Entry Wire Line
	1700 2950 1800 3050
Text Label 1700 3200 1    50   ~ 0
IR[0..15]
Text Label 1800 3050 0    50   ~ 0
IR4
Text Label 1800 3350 0    50   ~ 0
IR3
Text Label 1800 3800 0    50   ~ 0
IR2
Text Label 1800 4250 0    50   ~ 0
IR1
Text Label 1800 4700 0    50   ~ 0
IR0
$Comp
L alexios:74HC08 U?
U 5 1 5F0315A6
P 1150 6150
AR Path="/5F0315A6" Ref="U?"  Part="5" 
AR Path="/5EFCF155/5F0315A6" Ref="U2"  Part="5" 
F 0 "U2" H 1480 5646 50  0000 L CNN
F 1 "74HC08" H 1480 5555 50  0000 L CNN
F 2 "alexios:SOIC-14" H 1350 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 1350 5700 50  0001 C CNN
	5    1150 6150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 5 1 5F0315AC
P 2650 6400
AR Path="/5F0315AC" Ref="U?"  Part="5" 
AR Path="/5EFCF155/5F0315AC" Ref="U3"  Part="5" 
F 0 "U3" H 2830 6146 50  0000 L CNN
F 1 "74HC32" H 2830 6055 50  0000 L CNN
F 2 "alexios:SOIC-14" H 2650 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2650 6400 50  0001 C CNN
	5    2650 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F0315B2
P 950 6700
AR Path="/5CC0D65F/5F0315B2" Ref="C?"  Part="1" 
AR Path="/5F0315B2" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F0315B2" Ref="C2"  Part="1" 
F 0 "C2" H 859 6746 50  0000 R CNN
F 1 "100nF" H 859 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 6700 50  0001 C CNN
F 3 "~" H 950 6700 50  0001 C CNN
	1    950  6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F0315B8
P 2300 6700
AR Path="/5CC0D65F/5F0315B8" Ref="C?"  Part="1" 
AR Path="/5F0315B8" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F0315B8" Ref="C3"  Part="1" 
F 0 "C3" H 2209 6746 50  0000 R CNN
F 1 "100nF" H 2209 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 6700 50  0001 C CNN
F 3 "~" H 2300 6700 50  0001 C CNN
	1    2300 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F0315BE
P 3650 6700
AR Path="/5CC0D65F/5F0315BE" Ref="C?"  Part="1" 
AR Path="/5F0315BE" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F0315BE" Ref="C4"  Part="1" 
F 0 "C4" H 3559 6746 50  0000 R CNN
F 1 "100nF" H 3559 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3650 6700 50  0001 C CNN
F 3 "~" H 3650 6700 50  0001 C CNN
	1    3650 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0315C4
P 950 6600
AR Path="/5F0315C4" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315C4" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 950 6450 50  0001 C CNN
F 1 "+5V" H 965 6773 50  0000 C CNN
F 2 "" H 950 6600 50  0001 C CNN
F 3 "" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
Connection ~ 950  6600
$Comp
L power:+5V #PWR?
U 1 1 5F0315CB
P 2300 6600
AR Path="/5F0315CB" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315CB" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 2300 6450 50  0001 C CNN
F 1 "+5V" H 2315 6773 50  0000 C CNN
F 2 "" H 2300 6600 50  0001 C CNN
F 3 "" H 2300 6600 50  0001 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
Connection ~ 2300 6600
$Comp
L power:+5V #PWR?
U 1 1 5F0315D2
P 3650 6600
AR Path="/5F0315D2" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315D2" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 3650 6450 50  0001 C CNN
F 1 "+5V" H 3665 6773 50  0000 C CNN
F 2 "" H 3650 6600 50  0001 C CNN
F 3 "" H 3650 6600 50  0001 C CNN
	1    3650 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0315D8
P 3650 6800
AR Path="/5F0315D8" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315D8" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 3650 6550 50  0001 C CNN
F 1 "GND" H 3655 6627 50  0000 C CNN
F 2 "" H 3650 6800 50  0001 C CNN
F 3 "" H 3650 6800 50  0001 C CNN
	1    3650 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0315DE
P 2300 6800
AR Path="/5F0315DE" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315DE" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 2300 6550 50  0001 C CNN
F 1 "GND" H 2305 6627 50  0000 C CNN
F 2 "" H 2300 6800 50  0001 C CNN
F 3 "" H 2300 6800 50  0001 C CNN
	1    2300 6800
	1    0    0    -1  
$EndComp
Connection ~ 2300 6800
$Comp
L power:GND #PWR?
U 1 1 5F0315E5
P 950 6800
AR Path="/5F0315E5" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315E5" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 950 6550 50  0001 C CNN
F 1 "GND" H 955 6627 50  0000 C CNN
F 2 "" H 950 6800 50  0001 C CNN
F 3 "" H 950 6800 50  0001 C CNN
	1    950  6800
	1    0    0    -1  
$EndComp
Connection ~ 950  6800
$Comp
L power:GND #PWR?
U 1 1 5F0315F4
P 5100 6800
AR Path="/5F0315F4" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315F4" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 5100 6550 50  0001 C CNN
F 1 "GND" H 5105 6627 50  0000 C CNN
F 2 "" H 5100 6800 50  0001 C CNN
F 3 "" H 5100 6800 50  0001 C CNN
	1    5100 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0315FA
P 5100 6600
AR Path="/5F0315FA" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315FA" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 5100 6450 50  0001 C CNN
F 1 "+5V" H 5115 6773 50  0000 C CNN
F 2 "" H 5100 6600 50  0001 C CNN
F 3 "" H 5100 6600 50  0001 C CNN
	1    5100 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F031600
P 5100 6700
AR Path="/5CC0D65F/5F031600" Ref="C?"  Part="1" 
AR Path="/5F031600" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F031600" Ref="C5"  Part="1" 
F 0 "C5" H 5009 6746 50  0000 R CNN
F 1 "100nF" H 5009 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5100 6700 50  0001 C CNN
F 3 "~" H 5100 6700 50  0001 C CNN
	1    5100 6700
	1    0    0    -1  
$EndComp
Connection ~ 5100 6600
Connection ~ 5100 6800
$Comp
L alexios:74AHC1G86 U?
U 2 1 5F031608
P 5500 6550
AR Path="/5F031608" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031608" Ref="U4"  Part="2" 
F 0 "U4" H 5630 6446 50  0000 L CNN
F 1 "74AHC1G86" H 5630 6355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5430 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5430 6850 50  0001 C CNN
	2    5500 6550
	1    0    0    -1  
$EndComp
Text HLabel 1050 1150 0    50   Input ~ 0
~RESET
Text Label 5600 2800 1    50   ~ 0
FV
Text Label 5500 2800 1    50   ~ 0
FL
Text Label 5400 2800 1    50   ~ 0
FZ
Text Label 5300 2800 1    50   ~ 0
FN
Wire Wire Line
	6650 5250 7050 5250
NoConn ~ 6850 7500
$Comp
L alexios:74HC32 U?
U 4 1 5F031645
P 6600 7300
AR Path="/5F031645" Ref="U?"  Part="4" 
AR Path="/5EFCF155/5F031645" Ref="U3"  Part="4" 
F 0 "U3" H 6600 7375 50  0000 C CNN
F 1 "74HC32" H 6600 7284 50  0000 C CNN
F 2 "alexios:SOIC-14" H 6600 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6600 7300 50  0001 C CNN
	4    6600 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 60F285BC
P 6350 7350
F 0 "#PWR021" H 6350 7200 50  0001 C CNN
F 1 "+5V" H 6365 7523 50  0000 C CNN
F 2 "" H 6350 7350 50  0001 C CNN
F 3 "" H 6350 7350 50  0001 C CNN
	1    6350 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 7350 6350 7450
Connection ~ 6350 7450
Wire Wire Line
	6350 7450 6350 7550
$Comp
L alexios:74LVC1G332 U9
U 2 1 60F5E3DD
P 4100 6500
F 0 "U9" H 4180 6346 50  0000 L CNN
F 1 "74LVC1G332" H 4180 6255 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 5000 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5000 6550 50  0001 C CNN
	2    4100 6500
	1    0    0    -1  
$EndComp
Connection ~ 3650 6800
Connection ~ 3650 6600
$Comp
L Device:C_Small C?
U 1 1 60F76FC9
P 5100 7400
AR Path="/5CC0D65F/60F76FC9" Ref="C?"  Part="1" 
AR Path="/60F76FC9" Ref="C?"  Part="1" 
AR Path="/5EFCF155/60F76FC9" Ref="C1"  Part="1" 
F 0 "C1" H 5009 7446 50  0000 R CNN
F 1 "100nF" H 5009 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5100 7400 50  0001 C CNN
F 3 "~" H 5100 7400 50  0001 C CNN
	1    5100 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 60F7E713
P 5100 7300
F 0 "#PWR05" H 5100 7150 50  0001 C CNN
F 1 "+5V" H 5115 7473 50  0000 C CNN
F 2 "" H 5100 7300 50  0001 C CNN
F 3 "" H 5100 7300 50  0001 C CNN
	1    5100 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 60F7F6B2
P 5100 7500
F 0 "#PWR06" H 5100 7250 50  0001 C CNN
F 1 "GND" H 5105 7327 50  0000 C CNN
F 2 "" H 5100 7500 50  0001 C CNN
F 3 "" H 5100 7500 50  0001 C CNN
	1    5100 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1900 6650 1900
Text Label 6050 2000 0    50   ~ 0
IR0
Text Label 6050 2100 0    50   ~ 0
IR1
Text Label 6050 2200 0    50   ~ 0
IR2
Text Label 6050 2300 0    50   ~ 0
IR3
Text Label 6050 2400 0    50   ~ 0
IR4
Text Label 6050 2500 0    50   ~ 0
IR5
Text Label 6050 2600 0    50   ~ 0
IR6
Text Label 7050 2000 2    50   ~ 0
IR0
Text Label 7050 2100 2    50   ~ 0
IR1
Text Label 7050 2200 2    50   ~ 0
IR2
Text Label 7050 2300 2    50   ~ 0
IR3
Text Label 7050 2400 2    50   ~ 0
IR4
Text Label 7050 2500 2    50   ~ 0
IR5
Text Label 7050 2600 2    50   ~ 0
IR6
Wire Wire Line
	7050 4150 6700 4150
$Comp
L power:GND #PWR03
U 1 1 5DF0BAC9
P 6650 1900
F 0 "#PWR03" H 6650 1650 50  0001 C CNN
F 1 "GND" V 6655 1772 50  0000 R CNN
F 2 "" H 6650 1900 50  0001 C CNN
F 3 "" H 6650 1900 50  0001 C CNN
	1    6650 1900
	0    1    1    0   
$EndComp
NoConn ~ 8050 1900
NoConn ~ 8050 3950
Text Label 8700 5700 2    50   ~ 0
CLK4
$Comp
L power:+5V #PWR?
U 1 1 5F03142A
P 9850 5800
AR Path="/5F03142A" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03142A" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 9850 5650 50  0001 C CNN
F 1 "+5V" V 9750 5800 50  0000 L CNN
F 2 "" H 9850 5800 50  0001 C CNN
F 3 "" H 9850 5800 50  0001 C CNN
	1    9850 5800
	0    -1   -1   0   
$EndComp
Text Label 9600 5950 1    50   ~ 0
CLK4
Text Label 8700 5600 2    50   ~ 0
~COND0
Text Label 7650 1150 0    50   ~ 0
~RESET
Text HLabel 10800 4050 2    50   Output ~ 0
~COND
NoConn ~ 10750 5800
$Comp
L alexios:74LVC1G74 U?
U 1 1 5F03143E
P 10300 5650
AR Path="/5F03143E" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03143E" Ref="U8"  Part="1" 
F 0 "U8" H 10300 6067 50  0000 C CNN
F 1 "74LVC1G74" H 10300 5976 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 10750 5650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 10750 5650 50  0001 C CNN
	1    10300 5650
	1    0    0    -1  
$EndComp
Text Label 10550 4050 0    50   ~ 0
~COND
$Comp
L Device:R_Small R?
U 1 1 5F03144B
P 10800 5350
AR Path="/5E4DDD44/5F03144B" Ref="R?"  Part="1" 
AR Path="/5F03144B" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F03144B" Ref="R7"  Part="1" 
F 0 "R7" H 10741 5304 50  0000 R CNN
F 1 "30Ω" H 10741 5395 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10800 5350 50  0001 C CNN
F 3 "~" H 10800 5350 50  0001 C CNN
	1    10800 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	9650 5600 9850 5600
Wire Wire Line
	9850 5700 9600 5700
Wire Wire Line
	9600 5700 9600 6000
Wire Wire Line
	9600 6000 8400 6000
Wire Wire Line
	8400 6000 8400 5700
Wire Wire Line
	8400 5700 8750 5700
Wire Wire Line
	9850 5500 9700 5500
$Comp
L power:GND #PWR0196
U 1 1 5EC18B69
P 8750 5800
F 0 "#PWR0196" H 8750 5550 50  0001 C CNN
F 1 "GND" H 8600 5800 50  0000 C CNN
F 2 "" H 8750 5800 50  0001 C CNN
F 3 "" H 8750 5800 50  0001 C CNN
	1    8750 5800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G373 U56
U 1 1 5EBE0ABA
P 9200 5700
F 0 "U56" H 9200 6092 50  0000 C CNN
F 1 "74LVC1G373" H 9200 6001 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 9150 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9150 5650 50  0001 C CNN
	1    9200 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 1150 9700 5500
Connection ~ 8400 6000
$Comp
L Device:D_Schottky_ALT D6
U 1 1 5ECA6A10
P 8200 1500
F 0 "D6" H 8200 1600 50  0000 C CNN
F 1 "D_Schottky_ALT" H 8200 1400 50  0000 C CNN
F 2 "alexios:SOD-323" H 8200 1500 50  0001 C CNN
F 3 "~" H 8200 1500 50  0001 C CNN
	1    8200 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1500 8400 1500
Wire Wire Line
	8400 1500 8400 2000
Wire Wire Line
	8400 2000 8400 4050
Connection ~ 8400 2000
Wire Wire Line
	8400 4050 8350 4050
$Comp
L Device:D_Schottky_ALT D8
U 1 1 5ECA111E
P 8200 4050
F 0 "D8" H 8200 4150 50  0000 C CNN
F 1 "D_Schottky_ALT" H 8200 3950 50  0000 C CNN
F 2 "alexios:SOD-323" H 8200 4050 50  0001 C CNN
F 3 "~" H 8200 4050 50  0001 C CNN
	1    8200 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2000 8400 2000
$Comp
L Device:D_Schottky_ALT D7
U 1 1 5EC7DF69
P 8200 2000
F 0 "D7" H 8200 2100 50  0000 C CNN
F 1 "D_Schottky_ALT" H 8200 1900 50  0000 C CNN
F 2 "alexios:SOD-323" H 8200 2000 50  0001 C CNN
F 3 "~" H 8200 2000 50  0001 C CNN
	1    8200 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4050 8400 5600
Connection ~ 8400 4050
Text Label 8400 2350 3    50   ~ 0
~COND0
$Comp
L alexios:74LVC1G04 U6
U 1 1 5ECFB79E
P 6450 5250
F 0 "U6" H 6400 5075 50  0000 C CNN
F 1 "74LVC1G04" H 6400 4984 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6450 5250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 6450 5250 50  0001 C CNN
	1    6450 5250
	1    0    0    -1  
$EndComp
Text Label 7050 4150 2    50   ~ 0
CRSVD14
$Comp
L alexios:74HC251 U?
U 1 1 5F031563
P 7550 4550
AR Path="/5F031563" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031563" Ref="U5"  Part="1" 
F 0 "U5" H 7550 5417 50  0000 C CNN
F 1 "74HC251" H 7550 5326 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7550 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7550 4500 50  0001 C CNN
	1    7550 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G04 U?
U 2 1 5ED7D013
P 5450 7400
AR Path="/5ED7D013" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5ED7D013" Ref="U6"  Part="2" 
F 0 "U6" H 5630 7446 50  0000 L CNN
F 1 "74LVC1G04" H 5630 7355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5450 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5450 7400 50  0001 C CNN
	2    5450 7400
	1    0    0    -1  
$EndComp
Connection ~ 5100 7500
$Comp
L alexios:74HC32 U?
U 3 1 5F031660
P 4150 3850
AR Path="/5F031660" Ref="U?"  Part="3" 
AR Path="/5EFCF155/5F031660" Ref="U3"  Part="3" 
F 0 "U3" H 4150 3925 50  0000 C CNN
F 1 "74HC32" H 4150 3834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4150 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4150 3850 50  0001 C CNN
	3    4150 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G86 U?
U 1 1 5F03165A
P 4850 3900
AR Path="/5F03165A" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03165A" Ref="U4"  Part="1" 
F 0 "U4" H 4850 4068 50  0000 C CNN
F 1 "74LVC1G86" H 4850 3977 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4780 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4780 4200 50  0001 C CNN
	1    4850 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3850 3150 3850
Wire Wire Line
	3150 3700 3200 3700
Wire Wire Line
	3900 4000 3850 4000
Wire Wire Line
	3850 4000 3850 3650
Wire Wire Line
	3850 3650 3700 3650
Wire Wire Line
	2950 4750 3150 4750
Wire Wire Line
	3150 4750 3150 4550
Wire Wire Line
	3150 4550 3200 4550
Wire Wire Line
	2950 4300 3150 4300
Wire Wire Line
	3150 4300 3150 4450
Wire Wire Line
	3150 4450 3200 4450
Wire Wire Line
	3150 3850 3150 3700
Wire Wire Line
	3200 3600 3150 3600
Wire Wire Line
	3150 3400 2950 3400
Wire Wire Line
	3900 4100 3850 4100
Wire Wire Line
	2500 4800 2000 4800
Wire Wire Line
	2500 4700 1800 4700
Wire Wire Line
	2500 4350 2100 4350
Wire Wire Line
	2500 4250 1800 4250
Wire Wire Line
	2500 3900 2200 3900
Wire Wire Line
	2500 3800 1800 3800
Wire Wire Line
	2500 3450 2300 3450
Wire Wire Line
	1800 3350 2500 3350
$Comp
L alexios:74HC32 U?
U 1 1 5F03162F
P 3450 3450
AR Path="/5F03162F" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03162F" Ref="U3"  Part="1" 
F 0 "U3" H 3450 3525 50  0000 C CNN
F 1 "74HC32" H 3450 3434 50  0000 C CNN
F 2 "alexios:SOIC-14" H 3450 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3450 3450 50  0001 C CNN
	1    3450 3450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 UU?
U 2 1 5F031629
P 3450 4300
AR Path="/5F031629" Ref="UU?"  Part="1" 
AR Path="/5EFCF155/5F031629" Ref="U3"  Part="2" 
F 0 "U3" H 3450 4375 50  0000 C CNN
F 1 "74HC32" H 3450 4284 50  0000 C CNN
F 2 "alexios:SOIC-14" H 3450 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3450 4300 50  0001 C CNN
	2    3450 4300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 1 1 5F031623
P 2600 4350
AR Path="/5F031623" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031623" Ref="U2"  Part="1" 
F 0 "U2" H 2725 3775 50  0000 C CNN
F 1 "74HC08" H 2725 3684 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2800 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 3900 50  0001 C CNN
	1    2600 4350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 2 1 5F03161D
P 2600 3900
AR Path="/5F03161D" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F03161D" Ref="U2"  Part="2" 
F 0 "U2" H 2725 3683 50  0000 C CNN
F 1 "74HC08" V 2770 3638 50  0001 L CNN
F 2 "alexios:SOIC-14" H 2800 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 3450 50  0001 C CNN
	2    2600 3900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 4 1 5F031617
P 2600 3000
AR Path="/5F031617" Ref="U?"  Part="4" 
AR Path="/5EFCF155/5F031617" Ref="U2"  Part="4" 
F 0 "U2" H 2725 2875 50  0000 C CNN
F 1 "74HC08" H 2725 2784 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2800 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 2550 50  0001 C CNN
	4    2600 3000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 3 1 5F031611
P 2600 3450
AR Path="/5F031611" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031611" Ref="U2"  Part="3" 
F 0 "U2" H 2750 3200 50  0000 C CNN
F 1 "74HC08" V 2770 3188 50  0001 L CNN
F 2 "alexios:SOIC-14" H 2800 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 3000 50  0001 C CNN
	3    2600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3400 3150 3600
Wire Wire Line
	3850 4500 3700 4500
Wire Wire Line
	3850 4100 3850 4500
Text Label 2500 4800 2    50   ~ 0
FV
Text Label 2500 4350 2    50   ~ 0
FL
Text Label 2500 3900 2    50   ~ 0
FZ
Text Label 2950 4750 0    50   ~ 0
SV
Text Label 2950 4300 0    50   ~ 0
SL
Text Label 2950 3850 0    50   ~ 0
SZ
Text Label 2950 3400 0    50   ~ 0
SN
Text Label 3700 3650 0    50   ~ 0
SZN
Text Label 3700 4500 0    50   ~ 0
SVL
Wire Wire Line
	1800 3050 4400 3050
Wire Wire Line
	4400 3950 4600 3950
Wire Wire Line
	4400 4050 4600 4050
Wire Wire Line
	4400 3050 4400 3950
Text Label 4600 3950 2    50   ~ 0
IR4
Text Label 2500 3350 2    50   ~ 0
IR3
Text Label 2500 3800 2    50   ~ 0
IR2
Text Label 2500 4250 2    50   ~ 0
IR1
Text Label 2500 4700 2    50   ~ 0
IR0
Text Label 2500 3450 2    50   ~ 0
FN
Wire Wire Line
	5100 4000 5150 4000
Wire Wire Line
	5150 4000 5150 4650
Wire Wire Line
	5150 4650 7050 4650
Text Label 1100 2600 0    50   ~ 0
FN
Text HLabel 1050 2500 0    50   Input ~ 0
FZ
Text HLabel 1050 2400 0    50   Input ~ 0
FL
Text HLabel 1050 2300 0    50   Input ~ 0
FV
Text Label 1100 2300 0    50   ~ 0
FV
Text Label 1100 2400 0    50   ~ 0
FL
Text Label 1100 2500 0    50   ~ 0
FZ
Text HLabel 1050 2600 0    50   Input ~ 0
FN
Wire Wire Line
	5850 2000 7050 2000
Wire Wire Line
	5850 2100 7050 2100
Wire Wire Line
	5850 2200 7050 2200
Wire Wire Line
	5850 2300 7050 2300
Wire Wire Line
	5850 2400 7050 2400
Wire Wire Line
	5850 2500 7050 2500
Wire Wire Line
	5850 2600 7050 2600
Text Label 5750 2150 3    50   ~ 0
IR[0..15]
Entry Wire Line
	5750 1900 5850 2000
Entry Wire Line
	5750 2000 5850 2100
Entry Wire Line
	5750 2100 5850 2200
Entry Wire Line
	5750 2200 5850 2300
Entry Wire Line
	5750 2300 5850 2400
Entry Wire Line
	5750 2400 5850 2500
Entry Wire Line
	5750 2500 5850 2600
Entry Bus Bus
	5650 1700 5750 1800
Text HLabel 1050 1500 0    50   3State ~ 0
~SKIPEXT
Wire Wire Line
	1050 1500 8050 1500
Text Notes 2650 2950 0    100  ~ 20
Flag Conditionals (SKP)\n
Wire Wire Line
	7050 3950 6700 3950
Text Label 7050 3950 2    50   ~ 0
CRSVD8
Wire Wire Line
	7050 4050 6700 4050
Text Label 7050 4050 2    50   ~ 0
CRSVD9
Text Notes 8450 6100 0    50   ~ 0
Metastability protection latch
$Comp
L Jumper:SolderJumper_2_Bridged JP9
U 1 1 5E4BD57A
P 6550 3950
F 0 "JP9" H 6400 4000 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 6550 4064 50  0001 C CNN
F 2 "" H 6550 3950 50  0001 C CNN
F 3 "~" H 6550 3950 50  0001 C CNN
	1    6550 3950
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP10
U 1 1 5E4C59E5
P 6550 4050
F 0 "JP10" H 6400 4100 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 6550 4164 50  0001 C CNN
F 2 "" H 6550 4050 50  0001 C CNN
F 3 "~" H 6550 4050 50  0001 C CNN
	1    6550 4050
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP11
U 1 1 5E4C5A4F
P 6550 4150
F 0 "JP11" H 6400 4200 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 6550 4264 50  0001 C CNN
F 2 "" H 6550 4150 50  0001 C CNN
F 3 "~" H 6550 4150 50  0001 C CNN
	1    6550 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E4F37E8
P 6150 4700
F 0 "#PWR?" H 6150 4450 50  0001 C CNN
F 1 "GND" H 6072 4663 50  0000 R CNN
F 2 "" H 6150 4700 50  0001 C CNN
F 3 "" H 6150 4700 50  0001 C CNN
	1    6150 4700
	1    0    0    -1  
$EndComp
Text Notes 7400 1925 0    50   ~ 0
0000
Text Notes 7400 2025 0    50   ~ 0
0001
Text Notes 7400 2125 0    50   ~ 0
0010
Text Notes 7400 2225 0    50   ~ 0
0010
Text Notes 7400 2325 0    50   ~ 0
0100
Text Notes 7400 2425 0    50   ~ 0
0101\n
Text Notes 7400 2525 0    50   ~ 0
0110
Text Notes 7400 2625 0    50   ~ 0
0111
Text Notes 7400 3975 0    50   ~ 0
1000
Text Notes 7400 4075 0    50   ~ 0
1001
Text Notes 7400 4175 0    50   ~ 0
1010
Text Notes 7400 4275 0    50   ~ 0
1010
Text Notes 7400 4375 0    50   ~ 0
1100
Text Notes 7400 4475 0    50   ~ 0
1101\n
Text Notes 7400 4575 0    50   ~ 0
1110
Text Notes 7400 4675 0    50   ~ 0
1111
Wire Wire Line
	1050 2300 2000 2300
Wire Wire Line
	2000 2300 5600 2300
Connection ~ 2000 2300
Wire Wire Line
	2000 4800 2000 2300
Wire Wire Line
	1050 2400 2100 2400
Wire Wire Line
	2100 2400 5500 2400
Connection ~ 2100 2400
Wire Wire Line
	2100 4350 2100 2400
Wire Wire Line
	1050 2500 2200 2500
Wire Wire Line
	2200 2500 5400 2500
Connection ~ 2200 2500
Wire Wire Line
	2200 3900 2200 2500
Wire Wire Line
	1050 2600 2300 2600
Wire Wire Line
	2300 2600 5300 2600
Connection ~ 2300 2600
Wire Wire Line
	2300 3450 2300 2600
Text Label 2000 2950 1    50   ~ 0
FV
Text Label 2100 2950 1    50   ~ 0
FL
Text Label 2300 2950 1    50   ~ 0
FN
Text Label 2200 2950 1    50   ~ 0
FZ
Wire Wire Line
	1050 1150 9700 1150
Text Label 1100 1150 0    50   ~ 0
~RESET
Wire Wire Line
	8400 1050 8400 1500
Connection ~ 8400 1500
Wire Wire Line
	8400 5600 8750 5600
Wire Wire Line
	1050 6000 8400 6000
Text HLabel 1050 6000 0    50   Input ~ 0
CLK4
Text Label 1150 6000 0    50   ~ 0
CLK4
Wire Wire Line
	10800 5500 10800 5450
Wire Wire Line
	10800 5250 10800 4750
Wire Wire Line
	10800 4750 10150 4750
Wire Wire Line
	10150 4750 10150 4050
Wire Wire Line
	10150 4050 10800 4050
$Comp
L alexios:74LVC1G373 U?
U 2 1 5E6542CC
P 8100 6450
F 0 "U?" H 8280 6496 50  0000 L CNN
F 1 "74LVC1G373" H 8280 6405 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 8050 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 8050 6400 50  0001 C CNN
	2    8100 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E6561D2
P 7750 6450
AR Path="/5CC0D65F/5E6561D2" Ref="C?"  Part="1" 
AR Path="/5E6561D2" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5E6561D2" Ref="C?"  Part="1" 
F 0 "C?" H 7659 6496 50  0000 R CNN
F 1 "100nF" H 7659 6405 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7750 6450 50  0001 C CNN
F 3 "~" H 7750 6450 50  0001 C CNN
	1    7750 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E6561D9
P 7750 6350
AR Path="/5E6561D9" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5E6561D9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7750 6200 50  0001 C CNN
F 1 "+5V" H 7765 6523 50  0000 C CNN
F 2 "" H 7750 6350 50  0001 C CNN
F 3 "" H 7750 6350 50  0001 C CNN
	1    7750 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E6561E0
P 7750 6550
AR Path="/5E6561E0" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5E6561E0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7750 6300 50  0001 C CNN
F 1 "GND" H 7755 6377 50  0000 C CNN
F 2 "" H 7750 6550 50  0001 C CNN
F 3 "" H 7750 6550 50  0001 C CNN
	1    7750 6550
	1    0    0    -1  
$EndComp
Connection ~ 7750 6550
Connection ~ 7750 6350
Connection ~ 5100 7300
Wire Wire Line
	10800 5500 10750 5500
Wire Wire Line
	5600 2300 5600 4250
Wire Wire Line
	5500 2400 5500 4350
Wire Wire Line
	5400 2500 5400 4450
Wire Wire Line
	5300 2600 5300 4550
Wire Wire Line
	6150 3950 6150 4050
Connection ~ 6150 4050
Wire Wire Line
	6150 4050 6150 4150
Wire Wire Line
	6150 3950 6400 3950
Wire Wire Line
	6150 4700 6150 4150
Wire Wire Line
	6150 4050 6400 4050
Wire Wire Line
	6150 4150 6400 4150
Wire Bus Line
	1050 1700 5650 1700
Wire Bus Line
	1700 1800 1700 4600
Wire Bus Line
	5750 1800 5750 2500
Wire Bus Line
	5750 2900 5750 5450
Connection ~ 6150 4150
$EndSCHEMATC
