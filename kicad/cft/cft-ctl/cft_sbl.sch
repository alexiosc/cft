EESchema Schematic File Version 4
LIBS:cft-ctl-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 12
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
P 8850 900
AR Path="/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F0313EC" Ref="R2"  Part="1" 
F 0 "R2" H 8909 946 50  0000 L CNN
F 1 "4.7kΩ" H 8909 855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8850 900 50  0001 C CNN
F 3 "~" H 8850 900 50  0001 C CNN
	1    8850 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0313F2
P 8850 800
AR Path="/5F0313F2" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5F0313F2" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0313F2" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 8850 650 50  0001 C CNN
F 1 "+5V" H 8865 973 50  0000 C CNN
F 2 "" H 8850 800 50  0001 C CNN
F 3 "" H 8850 800 50  0001 C CNN
	1    8850 800 
	1    0    0    -1  
$EndComp
Text HLabel 950  2000 0    50   Input ~ 0
COND[0..3]
Text HLabel 950  1500 0    50   Input ~ 0
IR[0..15]
Entry Bus Bus
	1500 1500 1600 1600
Text Label 1000 1500 0    50   ~ 0
IR[0..15]
Text Label 1000 2000 0    50   ~ 0
COND[0..3]
Entry Bus Bus
	6000 2000 6100 2100
Wire Bus Line
	950  2000 6000 2000
Text Label 1000 1100 0    50   ~ 0
~SKIPEXT
Text Label 8850 4600 3    50   ~ 0
~COND0
$Comp
L alexios:74LVC1G74 U?
U 2 1 5F031452
P 5450 7400
AR Path="/5F031452" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031452" Ref="U8"  Part="2" 
F 0 "U8" H 5630 7446 50  0000 L CNN
F 1 "74LVC1G74" H 5630 7355 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 5900 7400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 5900 7400 50  0001 C CNN
	2    5450 7400
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
P 5100 7400
AR Path="/5CC0D65F/5F03146A" Ref="C?"  Part="1" 
AR Path="/5F03146A" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F03146A" Ref="C9"  Part="1" 
F 0 "C9" H 5009 7446 50  0000 R CNN
F 1 "100nF" H 5009 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5100 7400 50  0001 C CNN
F 3 "~" H 5100 7400 50  0001 C CNN
	1    5100 7400
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
Connection ~ 5100 7500
$Comp
L power:GND #PWR?
U 1 1 5F031483
P 5100 7500
AR Path="/5F031483" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031483" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 5100 7250 50  0001 C CNN
F 1 "GND" H 5105 7327 50  0000 C CNN
F 2 "" H 5100 7500 50  0001 C CNN
F 3 "" H 5100 7500 50  0001 C CNN
	1    5100 7500
	1    0    0    -1  
$EndComp
Connection ~ 5100 7300
$Comp
L power:+5V #PWR?
U 1 1 5F03148A
P 5100 7300
AR Path="/5F03148A" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03148A" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 5100 7150 50  0001 C CNN
F 1 "+5V" H 5115 7473 50  0000 C CNN
F 2 "" H 5100 7300 50  0001 C CNN
F 3 "" H 5100 7300 50  0001 C CNN
	1    5100 7300
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
Text Label 7400 5050 2    50   ~ 0
COND2
Text Label 7400 4950 2    50   ~ 0
COND1
Text Label 7400 4850 2    50   ~ 0
COND0
Text Label 6250 4850 0    50   ~ 0
COND0
Text Label 6250 4150 0    50   ~ 0
FV
Text Label 6250 4250 0    50   ~ 0
FL
Text Label 6250 4450 0    50   ~ 0
FN
Text Label 6250 4350 0    50   ~ 0
FZ
Wire Wire Line
	5950 4150 7400 4150
Wire Wire Line
	5950 4150 5950 2300
Wire Wire Line
	5850 4250 7400 4250
Wire Wire Line
	5850 4250 5850 2400
Wire Wire Line
	5750 4350 7400 4350
Wire Wire Line
	5750 4350 5750 2500
Wire Wire Line
	5650 4450 7400 4450
Wire Wire Line
	5650 4450 5650 2600
Text Label 2350 2950 1    50   ~ 0
FZ
Text Label 2450 2950 1    50   ~ 0
FN
Text Label 2250 2950 1    50   ~ 0
FL
Text Label 2150 2950 1    50   ~ 0
FV
Connection ~ 2450 2600
Wire Wire Line
	2450 3450 2450 2600
Wire Wire Line
	2350 2500 5750 2500
Connection ~ 2350 2500
Wire Wire Line
	2350 3900 2350 2500
Wire Wire Line
	2250 2400 5850 2400
Connection ~ 2250 2400
Wire Wire Line
	2250 4350 2250 2400
Wire Wire Line
	2150 2300 5950 2300
Connection ~ 2150 2300
Wire Wire Line
	2150 4800 2150 2300
Text Label 8000 1100 0    50   ~ 0
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
Text Label 7400 4450 2    50   ~ 0
FN
Text Label 7400 4350 2    50   ~ 0
FZ
Text Label 7400 4150 2    50   ~ 0
FV
Text Label 7400 4250 2    50   ~ 0
FL
Wire Wire Line
	6200 3200 7400 3200
Wire Wire Line
	6200 3000 7400 3000
Wire Wire Line
	6200 2900 7400 2900
Wire Wire Line
	6200 2800 7400 2800
Text Label 6250 5250 0    50   ~ 0
COND3
Wire Wire Line
	6200 5250 6500 5250
Entry Wire Line
	6100 5150 6200 5250
Text Label 6250 5050 0    50   ~ 0
COND2
Text Label 6250 4950 0    50   ~ 0
COND1
Wire Wire Line
	6200 5050 7400 5050
Wire Wire Line
	6200 4950 7400 4950
Wire Wire Line
	6200 4850 7400 4850
Entry Wire Line
	6100 4950 6200 5050
Entry Wire Line
	6100 4850 6200 4950
Entry Wire Line
	6100 4750 6200 4850
Text Label 7400 3200 2    50   ~ 0
COND3
Text Label 7400 3000 2    50   ~ 0
COND2
Text Label 7400 2900 2    50   ~ 0
COND1
Text Label 7400 2800 2    50   ~ 0
COND0
Text Label 6450 3200 0    50   ~ 0
COND3
Text Label 6450 3000 0    50   ~ 0
COND2
Text Label 6450 2900 0    50   ~ 0
COND1
Text Label 6450 2800 0    50   ~ 0
COND0
Entry Wire Line
	6100 3100 6200 3200
Entry Wire Line
	6100 2900 6200 3000
Entry Wire Line
	6100 2800 6200 2900
Entry Wire Line
	6100 2700 6200 2800
Text Label 6100 3200 1    50   ~ 0
COND[0..3]
Text Label 7400 5250 2    50   ~ 0
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
P 7900 2500
AR Path="/5F03157B" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03157B" Ref="U1"  Part="1" 
F 0 "U1" H 7900 3367 50  0000 C CNN
F 1 "74HC251" H 7900 3276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7900 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7900 2450 50  0001 C CNN
	1    7900 2500
	1    0    0    -1  
$EndComp
Text Label 6250 4650 0    50   ~ 0
OP1-BRANCH
Entry Wire Line
	1600 4600 1700 4700
Entry Wire Line
	1600 4150 1700 4250
Entry Wire Line
	1600 3700 1700 3800
Entry Wire Line
	1600 3250 1700 3350
Entry Wire Line
	1600 2950 1700 3050
Text Label 1600 3200 1    50   ~ 0
IR[0..15]
Text Label 1700 3050 0    50   ~ 0
IR4
Text Label 1700 3350 0    50   ~ 0
IR3
Text Label 1700 3800 0    50   ~ 0
IR2
Text Label 1700 4250 0    50   ~ 0
IR1
Text Label 1700 4700 0    50   ~ 0
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
Text HLabel 10050 5200 0    50   Input ~ 0
~RESET
Text Label 5950 2800 1    50   ~ 0
FV
Text Label 5850 2800 1    50   ~ 0
FL
Text Label 5750 2800 1    50   ~ 0
FZ
Text Label 5650 2800 1    50   ~ 0
FN
Wire Wire Line
	7000 5250 7400 5250
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
P 6500 5950
AR Path="/5CC0D65F/60F76FC9" Ref="C?"  Part="1" 
AR Path="/60F76FC9" Ref="C?"  Part="1" 
AR Path="/5EFCF155/60F76FC9" Ref="C1"  Part="1" 
F 0 "C1" H 6409 5996 50  0000 R CNN
F 1 "100nF" H 6409 5905 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6500 5950 50  0001 C CNN
F 3 "~" H 6500 5950 50  0001 C CNN
	1    6500 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 60F7E713
P 6500 5850
F 0 "#PWR05" H 6500 5700 50  0001 C CNN
F 1 "+5V" H 6515 6023 50  0000 C CNN
F 2 "" H 6500 5850 50  0001 C CNN
F 3 "" H 6500 5850 50  0001 C CNN
	1    6500 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 60F7F6B2
P 6500 6050
F 0 "#PWR06" H 6500 5800 50  0001 C CNN
F 1 "GND" H 6505 5877 50  0000 C CNN
F 2 "" H 6500 6050 50  0001 C CNN
F 3 "" H 6500 6050 50  0001 C CNN
	1    6500 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1900 7100 1900
Text Label 6100 5150 1    50   ~ 0
COND[0..3]
Text Label 6500 2000 0    50   ~ 0
IR0
Text Label 6500 2100 0    50   ~ 0
IR1
Text Label 6500 2200 0    50   ~ 0
IR2
Text Label 6500 2300 0    50   ~ 0
IR3
Text Label 6500 2400 0    50   ~ 0
IR4
Text Label 6500 2500 0    50   ~ 0
IR5
Text Label 6500 2600 0    50   ~ 0
IR6
Text Label 7400 2000 2    50   ~ 0
IR0
Text Label 7400 2100 2    50   ~ 0
IR1
Text Label 7400 2200 2    50   ~ 0
IR2
Text Label 7400 2300 2    50   ~ 0
IR3
Text Label 7400 2400 2    50   ~ 0
IR4
Text Label 7400 2500 2    50   ~ 0
IR5
Text Label 7400 2600 2    50   ~ 0
IR6
Wire Wire Line
	7400 4550 7000 4550
Text Notes 2650 950  0    197  ~ 39
Under Review! DO NOT IMPLEMENT
$Comp
L power:GND #PWR03
U 1 1 5DF0BAC9
P 7100 1900
F 0 "#PWR03" H 7100 1650 50  0001 C CNN
F 1 "GND" V 7105 1772 50  0000 R CNN
F 2 "" H 7100 1900 50  0001 C CNN
F 3 "" H 7100 1900 50  0001 C CNN
	1    7100 1900
	0    1    1    0   
$EndComp
NoConn ~ 8400 1900
NoConn ~ 8400 3950
Text Label 10000 5700 2    50   ~ 0
CLK4
$Comp
L power:+5V #PWR?
U 1 1 5F03142A
P 11100 5800
AR Path="/5F03142A" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03142A" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 11100 5650 50  0001 C CNN
F 1 "+5V" V 11000 5800 50  0000 L CNN
F 2 "" H 11100 5800 50  0001 C CNN
F 3 "" H 11100 5800 50  0001 C CNN
	1    11100 5800
	0    -1   -1   0   
$EndComp
Text HLabel 9550 6000 0    50   Input ~ 0
CLK4
Text Label 11100 5700 2    50   ~ 0
CLK4
Wire Wire Line
	9550 6000 9700 6000
Text Label 10000 5600 2    50   ~ 0
~COND0
Text Label 10300 5200 0    50   ~ 0
~RESET
Text HLabel 12500 5500 2    50   Output ~ 0
~COND
NoConn ~ 12000 5800
$Comp
L alexios:74LVC1G74 U?
U 1 1 5F03143E
P 11550 5650
AR Path="/5F03143E" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03143E" Ref="U8"  Part="1" 
F 0 "U8" H 11550 6067 50  0000 C CNN
F 1 "74LVC1G74" H 11550 5976 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 12000 5650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 12000 5650 50  0001 C CNN
	1    11550 5650
	1    0    0    -1  
$EndComp
Text Label 12250 5500 0    50   ~ 0
~COND
Wire Wire Line
	12200 5500 12500 5500
$Comp
L Device:R_Small R?
U 1 1 5F03144B
P 12100 5500
AR Path="/5E4DDD44/5F03144B" Ref="R?"  Part="1" 
AR Path="/5F03144B" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F03144B" Ref="R7"  Part="1" 
F 0 "R7" V 11904 5500 50  0000 C CNN
F 1 "30Ω" V 11995 5500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 12100 5500 50  0001 C CNN
F 3 "~" H 12100 5500 50  0001 C CNN
	1    12100 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	10950 5600 11100 5600
Wire Wire Line
	11100 5700 10850 5700
Wire Wire Line
	10850 5700 10850 6000
Wire Wire Line
	10850 6000 9700 6000
Wire Wire Line
	9700 6000 9700 5700
Wire Wire Line
	9700 5700 10050 5700
Wire Wire Line
	11100 5500 10850 5500
$Comp
L power:GND #PWR0196
U 1 1 5EC18B69
P 10050 5800
F 0 "#PWR0196" H 10050 5550 50  0001 C CNN
F 1 "GND" H 9900 5800 50  0000 C CNN
F 2 "" H 10050 5800 50  0001 C CNN
F 3 "" H 10050 5800 50  0001 C CNN
	1    10050 5800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G373 U56
U 1 1 5EBE0ABA
P 10500 5700
F 0 "U56" H 10500 6092 50  0000 C CNN
F 1 "74LVC1G373" H 10500 6001 50  0000 C CNN
F 2 "" H 10450 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10450 5650 50  0001 C CNN
	1    10500 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 5200 10050 5200
Wire Wire Line
	10850 5200 10850 5500
Connection ~ 9700 6000
$Comp
L Device:D_Schottky_ALT D6
U 1 1 5ECA6A10
P 8550 1100
F 0 "D6" H 8550 1200 50  0000 C CNN
F 1 "D_Schottky_ALT" H 8550 1000 50  0000 C CNN
F 2 "" H 8550 1100 50  0001 C CNN
F 3 "~" H 8550 1100 50  0001 C CNN
	1    8550 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1100 8850 1100
Wire Wire Line
	8850 1000 8850 1100
Connection ~ 8850 1100
Wire Wire Line
	8850 1100 8850 2000
Wire Wire Line
	8850 2000 8850 4050
Connection ~ 8850 2000
Wire Wire Line
	8850 4050 8700 4050
$Comp
L Device:D_Schottky_ALT D8
U 1 1 5ECA111E
P 8550 4050
F 0 "D8" H 8550 4150 50  0000 C CNN
F 1 "D_Schottky_ALT" H 8550 3950 50  0000 C CNN
F 2 "" H 8550 4050 50  0001 C CNN
F 3 "~" H 8550 4050 50  0001 C CNN
	1    8550 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2000 8850 2000
$Comp
L Device:D_Schottky_ALT D7
U 1 1 5EC7DF69
P 8550 2000
F 0 "D7" H 8550 2100 50  0000 C CNN
F 1 "D_Schottky_ALT" H 8550 1900 50  0000 C CNN
F 2 "" H 8550 2000 50  0001 C CNN
F 3 "~" H 8550 2000 50  0001 C CNN
	1    8550 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4050 8850 5600
Connection ~ 8850 4050
Wire Wire Line
	8850 5600 10050 5600
Text Label 8850 2350 3    50   ~ 0
~COND0
$Comp
L alexios:74LVC1G04 U6
U 1 1 5ECFB79E
P 6800 5250
F 0 "U6" H 6750 5075 50  0000 C CNN
F 1 "74LVC1G04" H 6750 4984 50  0000 C CNN
F 2 "" H 6800 5250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 6800 5250 50  0001 C CNN
	1    6800 5250
	1    0    0    -1  
$EndComp
Text Label 7000 4550 0    50   ~ 0
CRSVD14
Wire Wire Line
	13800 1950 13400 1950
Wire Wire Line
	13800 1650 13400 1650
Text Label 13800 1950 2    50   ~ 0
CRSVD9
Text Label 13800 1650 2    50   ~ 0
CRSVD8
$Comp
L power:GND #PWR0197
U 1 1 5ED30807
P 12950 1700
F 0 "#PWR0197" H 12950 1450 50  0001 C CNN
F 1 "GND" H 12955 1527 50  0000 C CNN
F 2 "" H 12950 1700 50  0001 C CNN
F 3 "" H 12950 1700 50  0001 C CNN
	1    12950 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13000 1650 12950 1650
Wire Wire Line
	12950 1650 12950 1700
$Comp
L power:GND #PWR0198
U 1 1 5ED4360D
P 12950 2000
F 0 "#PWR0198" H 12950 1750 50  0001 C CNN
F 1 "GND" H 12955 1827 50  0000 C CNN
F 2 "" H 12950 2000 50  0001 C CNN
F 3 "" H 12950 2000 50  0001 C CNN
	1    12950 2000
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Bridged JP10
U 1 1 5ED43613
P 13200 1950
F 0 "JP10" H 13200 2053 50  0000 C CNN
F 1 "Jumper_2_Bridged" H 13200 2054 50  0001 C CNN
F 2 "" H 13200 1950 50  0001 C CNN
F 3 "~" H 13200 1950 50  0001 C CNN
	1    13200 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	13000 1950 12950 1950
Wire Wire Line
	12950 1950 12950 2000
Wire Wire Line
	13800 2250 13400 2250
$Comp
L power:GND #PWR0199
U 1 1 5ED4E058
P 12950 2300
F 0 "#PWR0199" H 12950 2050 50  0001 C CNN
F 1 "GND" H 12955 2127 50  0000 C CNN
F 2 "" H 12950 2300 50  0001 C CNN
F 3 "" H 12950 2300 50  0001 C CNN
	1    12950 2300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Bridged JP11
U 1 1 5ED4E05E
P 13200 2250
F 0 "JP11" H 13200 2353 50  0000 C CNN
F 1 "Jumper_2_Bridged" H 13200 2354 50  0001 C CNN
F 2 "" H 13200 2250 50  0001 C CNN
F 3 "~" H 13200 2250 50  0001 C CNN
	1    13200 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	13000 2250 12950 2250
Wire Wire Line
	12950 2250 12950 2300
Text Label 13800 2250 2    50   ~ 0
CRSVD14
$Comp
L alexios:74HC251 U?
U 1 1 5F031563
P 7900 4550
AR Path="/5F031563" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031563" Ref="U5"  Part="1" 
F 0 "U5" H 7900 5417 50  0000 C CNN
F 1 "74HC251" H 7900 5326 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7900 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7900 4500 50  0001 C CNN
	1    7900 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G04 U?
U 2 1 5ED7D013
P 6850 5950
AR Path="/5ED7D013" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5ED7D013" Ref="U57"  Part="2" 
F 0 "U57" H 7030 5996 50  0000 L CNN
F 1 "74AHC1G04" H 7030 5905 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6850 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 6850 5950 50  0001 C CNN
	2    6850 5950
	1    0    0    -1  
$EndComp
Connection ~ 6500 6050
Connection ~ 6500 5850
$Comp
L alexios:74HC32 U?
U 3 1 5F031660
P 4300 3850
AR Path="/5F031660" Ref="U?"  Part="3" 
AR Path="/5EFCF155/5F031660" Ref="U3"  Part="3" 
F 0 "U3" H 4300 3925 50  0000 C CNN
F 1 "74HC32" H 4300 3834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4300 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4300 3850 50  0001 C CNN
	3    4300 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G86 U?
U 1 1 5F03165A
P 5000 3900
AR Path="/5F03165A" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03165A" Ref="U4"  Part="1" 
F 0 "U4" H 5000 4068 50  0000 C CNN
F 1 "74AHC1G86" H 5000 3977 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4930 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4930 4200 50  0001 C CNN
	1    5000 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3850 3300 3850
Wire Wire Line
	3300 3700 3350 3700
Wire Wire Line
	4050 4000 4000 4000
Wire Wire Line
	4000 4000 4000 3650
Wire Wire Line
	4000 3650 3850 3650
Wire Wire Line
	3100 4750 3300 4750
Wire Wire Line
	3300 4750 3300 4550
Wire Wire Line
	3300 4550 3350 4550
Wire Wire Line
	3100 4300 3300 4300
Wire Wire Line
	3300 4300 3300 4450
Wire Wire Line
	3300 4450 3350 4450
Wire Wire Line
	3300 3850 3300 3700
Wire Wire Line
	3350 3600 3300 3600
Wire Wire Line
	3300 3400 3100 3400
Wire Wire Line
	4050 4100 4000 4100
Wire Wire Line
	2650 4800 2150 4800
Wire Wire Line
	2650 4700 1700 4700
Wire Wire Line
	2650 4350 2250 4350
Wire Wire Line
	2650 4250 1700 4250
Wire Wire Line
	2650 3900 2350 3900
Wire Wire Line
	2650 3800 1700 3800
Wire Wire Line
	2650 3450 2450 3450
Wire Wire Line
	1700 3350 2650 3350
$Comp
L alexios:74HC32 U?
U 1 1 5F03162F
P 3600 3450
AR Path="/5F03162F" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03162F" Ref="U3"  Part="1" 
F 0 "U3" H 3600 3525 50  0000 C CNN
F 1 "74HC32" H 3600 3434 50  0000 C CNN
F 2 "alexios:SOIC-14" H 3600 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3600 3450 50  0001 C CNN
	1    3600 3450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 UU?
U 2 1 5F031629
P 3600 4300
AR Path="/5F031629" Ref="UU?"  Part="1" 
AR Path="/5EFCF155/5F031629" Ref="U3"  Part="2" 
F 0 "U3" H 3600 4375 50  0000 C CNN
F 1 "74HC32" H 3600 4284 50  0000 C CNN
F 2 "alexios:SOIC-14" H 3600 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3600 4300 50  0001 C CNN
	2    3600 4300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 1 1 5F031623
P 2750 4350
AR Path="/5F031623" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031623" Ref="U2"  Part="1" 
F 0 "U2" H 2875 3775 50  0000 C CNN
F 1 "74HC08" H 2875 3684 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2950 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2950 3900 50  0001 C CNN
	1    2750 4350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 2 1 5F03161D
P 2750 3900
AR Path="/5F03161D" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F03161D" Ref="U2"  Part="2" 
F 0 "U2" H 2875 3683 50  0000 C CNN
F 1 "74HC08" V 2920 3638 50  0001 L CNN
F 2 "alexios:SOIC-14" H 2950 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2950 3450 50  0001 C CNN
	2    2750 3900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 4 1 5F031617
P 2750 3000
AR Path="/5F031617" Ref="U?"  Part="4" 
AR Path="/5EFCF155/5F031617" Ref="U2"  Part="4" 
F 0 "U2" H 2875 2875 50  0000 C CNN
F 1 "74HC08" H 2875 2784 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2950 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2950 2550 50  0001 C CNN
	4    2750 3000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 3 1 5F031611
P 2750 3450
AR Path="/5F031611" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031611" Ref="U2"  Part="3" 
F 0 "U2" H 2900 3200 50  0000 C CNN
F 1 "74HC08" V 2920 3188 50  0001 L CNN
F 2 "alexios:SOIC-14" H 2950 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2950 3000 50  0001 C CNN
	3    2750 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3400 3300 3600
Wire Wire Line
	4000 4500 3850 4500
Wire Wire Line
	4000 4100 4000 4500
Text Label 2650 4800 2    50   ~ 0
FV
Text Label 2650 4350 2    50   ~ 0
FL
Text Label 2650 3900 2    50   ~ 0
FZ
Text Label 3100 4750 0    50   ~ 0
SV
Text Label 3100 4300 0    50   ~ 0
SL
Text Label 3100 3850 0    50   ~ 0
SZ
Text Label 3100 3400 0    50   ~ 0
SN
Text Label 3850 3650 0    50   ~ 0
SZN
Text Label 3850 4500 0    50   ~ 0
SVL
Wire Wire Line
	1700 3050 4550 3050
Wire Wire Line
	4550 3950 4750 3950
Wire Wire Line
	4550 4050 4750 4050
Wire Wire Line
	4550 3050 4550 3950
Text Label 4750 3950 2    50   ~ 0
IR4
Text Label 2650 3350 2    50   ~ 0
IR3
Text Label 2650 3800 2    50   ~ 0
IR2
Text Label 2650 4250 2    50   ~ 0
IR1
Text Label 2650 4700 2    50   ~ 0
IR0
Text Label 2650 3450 2    50   ~ 0
FN
Wire Wire Line
	5250 4000 5500 4000
Wire Wire Line
	5500 4000 5500 4650
Wire Wire Line
	5500 4650 7400 4650
Wire Wire Line
	2450 2600 5650 2600
Text Label 1000 2600 0    50   ~ 0
FN
Wire Wire Line
	950  2500 2350 2500
Wire Wire Line
	950  2300 2150 2300
Wire Wire Line
	950  2400 2250 2400
Wire Wire Line
	950  2600 2450 2600
Text HLabel 950  2500 0    50   Input ~ 0
FZ
Text HLabel 950  2400 0    50   Input ~ 0
FL
Text HLabel 950  2300 0    50   Input ~ 0
FV
Text Label 1000 2300 0    50   ~ 0
FV
Text Label 1000 2400 0    50   ~ 0
FL
Text Label 1000 2500 0    50   ~ 0
FZ
Text HLabel 950  2600 0    50   Input ~ 0
FN
Wire Wire Line
	6300 2000 7400 2000
Wire Wire Line
	6300 2100 7400 2100
Wire Wire Line
	6300 2200 7400 2200
Wire Wire Line
	6300 2300 7400 2300
Wire Wire Line
	6300 2400 7400 2400
Wire Wire Line
	6300 2500 7400 2500
Wire Wire Line
	6300 2600 7400 2600
Text Label 6200 1700 3    50   ~ 0
IR[0..15]
Entry Wire Line
	6200 1900 6300 2000
Entry Wire Line
	6200 2000 6300 2100
Entry Wire Line
	6200 2100 6300 2200
Entry Wire Line
	6200 2200 6300 2300
Entry Wire Line
	6200 2300 6300 2400
Entry Wire Line
	6200 2400 6300 2500
Entry Wire Line
	6200 2500 6300 2600
Entry Bus Bus
	6100 1500 6200 1600
Text HLabel 950  1100 0    50   3State ~ 0
~SKIPEXT
Wire Wire Line
	950  1100 8400 1100
$Comp
L Jumper:Jumper_2_Bridged JP9
U 1 1 5ED3B178
P 13200 1650
F 0 "JP9" H 13200 1753 50  0000 C CNN
F 1 "Jumper_2_Bridged" H 13200 1754 50  0001 C CNN
F 2 "" H 13200 1650 50  0001 C CNN
F 3 "~" H 13200 1650 50  0001 C CNN
	1    13200 1650
	1    0    0    -1  
$EndComp
Text Notes 2550 2950 0    100  ~ 20
Flag Conditionals (SKP)\n
Wire Wire Line
	7400 3950 7000 3950
Text Label 7000 3950 0    50   ~ 0
CRSVD8
Wire Wire Line
	7400 4050 7000 4050
Text Label 7000 4050 0    50   ~ 0
CRSVD9
Wire Bus Line
	950  1500 6100 1500
Wire Bus Line
	1600 1600 1600 4600
Wire Bus Line
	6200 1600 6200 2500
Wire Bus Line
	6100 2100 6100 5150
$EndSCHEMATC
