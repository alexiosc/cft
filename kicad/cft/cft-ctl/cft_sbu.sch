EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 12
Title "Skip/Branch Unit"
Date ""
Rev "2020"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "sbu.v"
$EndDescr
$Comp
L Device:R_Small R?
U 1 1 5F0313EC
P 8300 1350
AR Path="/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F0313EC" Ref="R2"  Part="1" 
F 0 "R2" H 8359 1396 50  0000 L CNN
F 1 "4.7kΩ" H 8359 1305 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8300 1350 50  0001 C CNN
F 3 "~" H 8300 1350 50  0001 C CNN
	1    8300 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0313F2
P 8300 1250
AR Path="/5F0313F2" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5F0313F2" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0313F2" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 8300 1100 50  0001 C CNN
F 1 "+5V" H 8315 1423 50  0000 C CNN
F 2 "" H 8300 1250 50  0001 C CNN
F 3 "" H 8300 1250 50  0001 C CNN
	1    8300 1250
	1    0    0    -1  
$EndComp
Text HLabel 1050 5750 0    50   Input ~ 0
COND[0..4]
Text HLabel 1050 1700 0    50   Input ~ 0
IR[0..6]
Entry Bus Bus
	1300 1700 1400 1800
Text Label 1100 1700 0    50   ~ 0
IR[0..6]
Text Label 1100 5750 0    50   ~ 0
COND[0..4]
Entry Bus Bus
	5650 5750 5750 5650
Text Label 1100 1500 0    50   ~ 0
~SKIPEXT
Text Label 8300 4600 3    50   ~ 0
~COND₀
$Comp
L alexios:74LVC1G74 U?
U 2 1 5F031452
P 5350 7400
AR Path="/5F031452" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031452" Ref="U8"  Part="2" 
F 0 "U8" H 5530 7446 50  0000 L CNN
F 1 "74LVC1G74" H 5530 7355 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 5800 7400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 5800 7400 50  0001 C CNN
	2    5350 7400
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
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7400 50  0001 C CNN
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
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7400 50  0001 C CNN
F 3 "~" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F03146A
P 5000 7400
AR Path="/5CC0D65F/5F03146A" Ref="C?"  Part="1" 
AR Path="/5F03146A" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F03146A" Ref="C9"  Part="1" 
F 0 "C9" H 4909 7446 50  0000 R CNN
F 1 "100nF" H 4909 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 7400 50  0001 C CNN
F 3 "~" H 5000 7400 50  0001 C CNN
	1    5000 7400
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
Connection ~ 5000 7500
$Comp
L power:GND #PWR?
U 1 1 5F031483
P 5000 7500
AR Path="/5F031483" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031483" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 5000 7250 50  0001 C CNN
F 1 "GND" H 5005 7327 50  0000 C CNN
F 2 "" H 5000 7500 50  0001 C CNN
F 3 "" H 5000 7500 50  0001 C CNN
	1    5000 7500
	1    0    0    -1  
$EndComp
Connection ~ 5000 7300
$Comp
L power:+5V #PWR?
U 1 1 5F03148A
P 5000 7300
AR Path="/5F03148A" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03148A" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 5000 7150 50  0001 C CNN
F 1 "+5V" H 5015 7473 50  0000 C CNN
F 2 "" H 5000 7300 50  0001 C CNN
F 3 "" H 5000 7300 50  0001 C CNN
	1    5000 7300
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
Text Label 6950 5050 2    50   ~ 0
COND2
Text Label 6950 4950 2    50   ~ 0
COND1
Text Label 6950 4850 2    50   ~ 0
COND0
Wire Wire Line
	5600 4250 6950 4250
Wire Wire Line
	5500 4350 6950 4350
Wire Wire Line
	5400 4450 6950 4450
Wire Wire Line
	5300 4550 6950 4550
Text Label 7550 1500 0    50   ~ 0
~SKIPEXT
Text Label 6950 4550 2    50   ~ 0
FN
Text Label 6950 4450 2    50   ~ 0
FZ
Text Label 6950 4250 2    50   ~ 0
FV
Text Label 6950 4350 2    50   ~ 0
FL
Wire Wire Line
	5850 3000 6950 3000
Wire Wire Line
	5850 2900 6950 2900
Wire Wire Line
	5850 2800 6950 2800
Wire Wire Line
	5850 5050 6950 5050
Wire Wire Line
	5850 4950 6950 4950
Wire Wire Line
	5850 4850 6950 4850
Entry Wire Line
	5850 5050 5750 5150
Entry Wire Line
	5850 4950 5750 5050
Entry Wire Line
	5850 4850 5750 4950
Text Label 6950 3000 2    50   ~ 0
COND2
Text Label 6950 2900 2    50   ~ 0
COND1
Text Label 6950 2800 2    50   ~ 0
COND0
Text Label 6050 3000 0    50   ~ 0
COND2
Text Label 6050 2900 0    50   ~ 0
COND1
Text Label 6050 2800 0    50   ~ 0
COND0
Entry Wire Line
	5850 3000 5750 3100
Entry Wire Line
	5850 2900 5750 3000
Entry Wire Line
	5850 2800 5750 2900
Text Label 5750 3850 1    50   ~ 0
COND[0..3]
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
P 7450 2500
AR Path="/5F03157B" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03157B" Ref="U1"  Part="1" 
F 0 "U1" H 7450 3367 50  0000 C CNN
F 1 "74HC251" H 7450 3276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7450 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7450 2450 50  0001 C CNN
	1    7450 2500
	1    0    0    -1  
$EndComp
Text Label 6950 4650 2    50   ~ 0
SKP
Entry Wire Line
	1400 4350 1500 4450
Entry Wire Line
	1400 3900 1500 4000
Entry Wire Line
	1400 3450 1500 3550
Entry Wire Line
	1400 3000 1500 3100
Entry Wire Line
	1400 2700 1500 2800
Text Label 1400 2950 1    50   ~ 0
IR[0..6]
Text Label 1500 2800 0    50   ~ 0
IR4
Text Label 1500 3100 0    50   ~ 0
IR3
Text Label 1500 3550 0    50   ~ 0
IR2
Text Label 1500 4000 0    50   ~ 0
IR1
Text Label 1500 4450 0    50   ~ 0
IR0
$Comp
L Device:C_Small C?
U 1 1 5F0315B2
P 950 6700
AR Path="/5CC0D65F/5F0315B2" Ref="C?"  Part="1" 
AR Path="/5F0315B2" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F0315B2" Ref="C2"  Part="1" 
F 0 "C2" H 859 6746 50  0000 R CNN
F 1 "100nF" H 859 6655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 6700 50  0001 C CNN
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
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 6700 50  0001 C CNN
F 3 "~" H 2300 6700 50  0001 C CNN
	1    2300 6700
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
$Comp
L power:GND #PWR?
U 1 1 5F0315F4
P 3650 6800
AR Path="/5F0315F4" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315F4" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 3650 6550 50  0001 C CNN
F 1 "GND" H 3655 6627 50  0000 C CNN
F 2 "" H 3650 6800 50  0001 C CNN
F 3 "" H 3650 6800 50  0001 C CNN
	1    3650 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0315FA
P 3650 6600
AR Path="/5F0315FA" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315FA" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 3650 6450 50  0001 C CNN
F 1 "+5V" H 3665 6773 50  0000 C CNN
F 2 "" H 3650 6600 50  0001 C CNN
F 3 "" H 3650 6600 50  0001 C CNN
	1    3650 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F031600
P 3650 6700
AR Path="/5CC0D65F/5F031600" Ref="C?"  Part="1" 
AR Path="/5F031600" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F031600" Ref="C5"  Part="1" 
F 0 "C5" H 3559 6746 50  0000 R CNN
F 1 "100nF" H 3559 6655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 6700 50  0001 C CNN
F 3 "~" H 3650 6700 50  0001 C CNN
	1    3650 6700
	1    0    0    -1  
$EndComp
Text Label 5600 2800 1    50   ~ 0
FV
Text Label 5500 2800 1    50   ~ 0
FL
Text Label 5400 2800 1    50   ~ 0
FZ
Text Label 5300 2800 1    50   ~ 0
FN
NoConn ~ 6800 7450
$Comp
L power:+5V #PWR021
U 1 1 60F285BC
P 6300 7400
F 0 "#PWR021" H 6300 7250 50  0001 C CNN
F 1 "+5V" H 6150 7450 50  0000 C CNN
F 2 "" H 6300 7400 50  0001 C CNN
F 3 "" H 6300 7400 50  0001 C CNN
	1    6300 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1900 6650 1900
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
Text Label 6950 2000 2    50   ~ 0
IR0
Text Label 6950 2100 2    50   ~ 0
IR1
Text Label 6950 2200 2    50   ~ 0
IR2
Text Label 6950 2300 2    50   ~ 0
IR3
Text Label 6950 2400 2    50   ~ 0
IR4
Text Label 6950 2500 2    50   ~ 0
IR5
Text Label 6950 2600 2    50   ~ 0
IR6
Wire Wire Line
	6950 4150 6600 4150
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
NoConn ~ 7950 1900
NoConn ~ 7950 3950
Text Label 8650 5700 2    50   ~ 0
CLK4
$Comp
L power:+5V #PWR?
U 1 1 5F03142A
P 9900 5800
AR Path="/5F03142A" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03142A" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 9900 5650 50  0001 C CNN
F 1 "+5V" V 9800 5800 50  0000 L CNN
F 2 "" H 9900 5800 50  0001 C CNN
F 3 "" H 9900 5800 50  0001 C CNN
	1    9900 5800
	0    -1   -1   0   
$EndComp
Text Label 9900 5700 2    50   ~ 0
CLK4
Text HLabel 10700 4050 2    50   Output ~ 0
~COND
NoConn ~ 10800 5800
$Comp
L alexios:74LVC1G74 U?
U 1 1 5F03143E
P 10350 5650
AR Path="/5F03143E" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03143E" Ref="U8"  Part="1" 
F 0 "U8" H 10350 6067 50  0000 C CNN
F 1 "74LVC1G74" H 10350 5976 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 10800 5650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 10800 5650 50  0001 C CNN
	1    10350 5650
	1    0    0    -1  
$EndComp
Text Label 10450 4050 0    50   ~ 0
~COND
Wire Wire Line
	9550 5600 9900 5600
Wire Wire Line
	9900 5700 9650 5700
Wire Wire Line
	9650 5700 9650 6000
Wire Wire Line
	9650 6000 8300 6000
Wire Wire Line
	8300 6000 8300 5700
Wire Wire Line
	8300 5700 8650 5700
Wire Wire Line
	9900 5500 9450 5500
$Comp
L power:GND #PWR0196
U 1 1 5EC18B69
P 8650 5800
F 0 "#PWR0196" H 8650 5550 50  0001 C CNN
F 1 "GND" H 8500 5800 50  0000 C CNN
F 2 "" H 8650 5800 50  0001 C CNN
F 3 "" H 8650 5800 50  0001 C CNN
	1    8650 5800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G373 U56
U 1 1 5EBE0ABA
P 9100 5700
F 0 "U56" H 9100 6092 50  0000 C CNN
F 1 "74LVC1G373" H 9100 6001 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 9050 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9050 5650 50  0001 C CNN
	1    9100 5700
	1    0    0    -1  
$EndComp
Connection ~ 8300 6000
$Comp
L Device:D_Schottky_ALT D6
U 1 1 5ECA6A10
P 8100 1500
F 0 "D6" H 8100 1600 50  0000 C CNN
F 1 "CUS520" H 8100 1400 50  0000 C CNN
F 2 "alexios:SOD-323" H 8100 1500 50  0001 C CNN
F 3 "~" H 8100 1500 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 8100 1500 50  0001 C CNN "Mouser"
	1    8100 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 1500 8300 1500
Wire Wire Line
	8300 1500 8300 2000
Wire Wire Line
	8300 2000 8300 4050
Connection ~ 8300 2000
Wire Wire Line
	8300 4050 8250 4050
$Comp
L Device:D_Schottky_ALT D8
U 1 1 5ECA111E
P 8100 4050
F 0 "D8" H 8100 4150 50  0000 C CNN
F 1 "CUS520" H 8100 3950 50  0000 C CNN
F 2 "alexios:SOD-323" H 8100 4050 50  0001 C CNN
F 3 "~" H 8100 4050 50  0001 C CNN
	1    8100 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2000 8300 2000
$Comp
L Device:D_Schottky_ALT D7
U 1 1 5EC7DF69
P 8100 2000
F 0 "D7" H 8100 2100 50  0000 C CNN
F 1 "CUS520" H 8100 1900 50  0000 C CNN
F 2 "alexios:SOD-323" H 8100 2000 50  0001 C CNN
F 3 "~" H 8100 2000 50  0001 C CNN
	1    8100 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4050 8300 5600
Connection ~ 8300 4050
Text Label 8300 2350 3    50   ~ 0
~COND₀
$Comp
L alexios:74AHC1G86 U?
U 1 1 5F03165A
P 4550 3650
AR Path="/5F03165A" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03165A" Ref="U4"  Part="1" 
F 0 "U4" H 4550 3818 50  0000 C CNN
F 1 "74LVC1G86" H 4550 3727 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4480 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4480 3950 50  0001 C CNN
	1    4550 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3600 2850 3600
Wire Wire Line
	2850 3450 2900 3450
Wire Wire Line
	3650 3750 3550 3750
Wire Wire Line
	3550 3750 3550 3400
Wire Wire Line
	3550 3400 3400 3400
Wire Wire Line
	2650 4500 2850 4500
Wire Wire Line
	2850 4500 2850 4300
Wire Wire Line
	2850 4300 2900 4300
Wire Wire Line
	2650 4050 2850 4050
Wire Wire Line
	2850 4050 2850 4200
Wire Wire Line
	2850 4200 2900 4200
Wire Wire Line
	2850 3600 2850 3450
Wire Wire Line
	2900 3350 2850 3350
Wire Wire Line
	2850 3150 2650 3150
Wire Wire Line
	3650 3850 3550 3850
Wire Wire Line
	2200 4550 1700 4550
Wire Wire Line
	2200 4100 1800 4100
Wire Wire Line
	2200 3650 1900 3650
Wire Wire Line
	2200 3200 2000 3200
Wire Wire Line
	2850 3150 2850 3350
Wire Wire Line
	3550 4250 3400 4250
Wire Wire Line
	3550 3850 3550 4250
Text Label 2200 4550 2    50   ~ 0
FV
Text Label 2200 4100 2    50   ~ 0
FL
Text Label 2200 3650 2    50   ~ 0
FZ
Text Label 2650 4500 0    50   ~ 0
SV
Text Label 2650 4050 0    50   ~ 0
SL
Text Label 2650 3600 0    50   ~ 0
SZ
Text Label 2650 3150 0    50   ~ 0
SN
Text Label 3400 3400 0    50   ~ 0
SZN
Text Label 3400 4250 0    50   ~ 0
SVL
Wire Wire Line
	4100 3700 4300 3700
Wire Wire Line
	4150 3800 4300 3800
Wire Wire Line
	4100 2800 4100 3700
Text Label 4300 3700 2    50   ~ 0
IR4
Text Label 2200 3100 2    50   ~ 0
IR3
Text Label 2200 3550 2    50   ~ 0
IR2
Text Label 2200 4000 2    50   ~ 0
IR1
Text Label 2200 4450 2    50   ~ 0
IR0
Text Label 2200 3200 2    50   ~ 0
FN
Wire Wire Line
	4800 3750 5150 3750
Wire Wire Line
	5150 3750 5150 4650
Wire Wire Line
	5150 4650 6950 4650
Text Label 1100 2350 0    50   ~ 0
FN
Text HLabel 1050 2250 0    50   Input ~ 0
FZ
Text HLabel 1050 2150 0    50   Input ~ 0
FL
Text HLabel 1050 2050 0    50   Input ~ 0
FV
Text Label 1100 2050 0    50   ~ 0
FV
Text Label 1100 2150 0    50   ~ 0
FL
Text Label 1100 2250 0    50   ~ 0
FZ
Text HLabel 1050 2350 0    50   Input ~ 0
FN
Wire Wire Line
	5850 2000 6950 2000
Wire Wire Line
	5850 2100 6950 2100
Wire Wire Line
	5850 2200 6950 2200
Wire Wire Line
	5850 2300 6950 2300
Wire Wire Line
	5850 2400 6950 2400
Wire Wire Line
	5850 2500 6950 2500
Wire Wire Line
	5850 2600 6950 2600
Text Label 5750 2150 3    50   ~ 0
IR[0..6]
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
	1050 1500 7950 1500
Text Notes 2150 2650 0    98   ~ 20
Flag Conditionals (SKP)\n
Wire Wire Line
	6950 3950 6600 3950
Wire Wire Line
	6950 4050 6600 4050
Text Notes 8400 6100 0    50   ~ 0
Metastability protection latch
$Comp
L power:GND #PWR050
U 1 1 5E4F37E8
P 9400 3250
F 0 "#PWR050" H 9400 3000 50  0001 C CNN
F 1 "GND" H 9405 3077 50  0000 C CNN
F 2 "" H 9400 3250 50  0001 C CNN
F 3 "" H 9400 3250 50  0001 C CNN
	1    9400 3250
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
	1050 2050 1700 2050
Connection ~ 1700 2050
Wire Wire Line
	1700 4550 1700 2050
Wire Wire Line
	1050 2150 1800 2150
Connection ~ 1800 2150
Wire Wire Line
	1800 4100 1800 2150
Wire Wire Line
	1050 2250 1900 2250
Connection ~ 1900 2250
Wire Wire Line
	1050 2350 2000 2350
Connection ~ 2000 2350
Wire Wire Line
	2000 3200 2000 2350
Text Label 1700 2700 1    50   ~ 0
FV
Text Label 1800 2700 1    50   ~ 0
FL
Text Label 2000 2700 1    50   ~ 0
FN
Text Label 1900 2700 1    50   ~ 0
FZ
Wire Wire Line
	8300 1450 8300 1500
Connection ~ 8300 1500
Wire Wire Line
	8300 5600 8650 5600
Wire Wire Line
	1050 6000 8300 6000
Text HLabel 1050 6000 0    50   Input ~ 0
CLK4
Text Label 1100 6000 0    50   ~ 0
CLK4
Wire Wire Line
	10950 4750 10400 4750
Wire Wire Line
	10400 4750 10400 4050
$Comp
L alexios:74LVC1G373 U56
U 2 1 5E6542CC
P 5350 6700
F 0 "U56" H 5530 6746 50  0000 L CNN
F 1 "74LVC1G373" H 5530 6655 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 5300 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5300 6650 50  0001 C CNN
	2    5350 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E6561D2
P 5000 6700
AR Path="/5CC0D65F/5E6561D2" Ref="C?"  Part="1" 
AR Path="/5E6561D2" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5E6561D2" Ref="C21"  Part="1" 
F 0 "C21" H 4909 6746 50  0000 R CNN
F 1 "100nF" H 4909 6655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 6700 50  0001 C CNN
F 3 "~" H 5000 6700 50  0001 C CNN
	1    5000 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E6561D9
P 5000 6600
AR Path="/5E6561D9" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5E6561D9" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H 5000 6450 50  0001 C CNN
F 1 "+5V" H 5015 6773 50  0000 C CNN
F 2 "" H 5000 6600 50  0001 C CNN
F 3 "" H 5000 6600 50  0001 C CNN
	1    5000 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E6561E0
P 5000 6800
AR Path="/5E6561E0" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5E6561E0" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 5000 6550 50  0001 C CNN
F 1 "GND" H 5005 6627 50  0000 C CNN
F 2 "" H 5000 6800 50  0001 C CNN
F 3 "" H 5000 6800 50  0001 C CNN
	1    5000 6800
	1    0    0    -1  
$EndComp
Connection ~ 5000 6800
Connection ~ 5000 6600
Wire Wire Line
	5600 2050 5600 4250
Wire Wire Line
	5500 2150 5500 4350
Wire Wire Line
	5400 2250 5400 4450
Wire Wire Line
	5300 2350 5300 4550
Wire Wire Line
	9450 5200 9450 5500
Text Label 8800 5200 0    50   ~ 0
~RESET
Wire Wire Line
	1700 2050 5600 2050
Wire Wire Line
	1800 2150 5500 2150
Wire Wire Line
	1900 2250 5400 2250
Wire Wire Line
	2000 2350 5300 2350
Wire Wire Line
	1500 4000 2200 4000
Wire Wire Line
	1500 4450 2200 4450
Wire Wire Line
	1500 2800 4100 2800
Wire Wire Line
	1500 3100 2200 3100
Wire Wire Line
	1900 2250 1900 3650
Wire Wire Line
	1500 3550 2200 3550
Wire Wire Line
	10950 5500 10800 5500
Wire Wire Line
	10400 4050 10700 4050
Wire Wire Line
	10950 4750 10950 5500
$Comp
L alexios:74AC08 U2
U 1 1 5E774C30
P 2300 2750
F 0 "U2" H 2425 2625 50  0000 C CNN
F 1 "74AC08" H 2425 2534 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2500 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2500 2300 50  0001 C CNN
	1    2300 2750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC08 U2
U 2 1 5E774CD8
P 2300 3200
F 0 "U2" H 2425 3075 50  0000 C CNN
F 1 "74AC08" H 2425 2984 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2500 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2500 2750 50  0001 C CNN
	2    2300 3200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC08 U2
U 3 1 5E774D4F
P 2300 3650
F 0 "U2" H 2425 3525 50  0000 C CNN
F 1 "74AC08" H 2425 3434 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2500 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2500 3200 50  0001 C CNN
	3    2300 3650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC08 U2
U 4 1 5E774DD6
P 2300 4100
F 0 "U2" H 2425 3975 50  0000 C CNN
F 1 "74AC08" H 2425 3884 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2500 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2500 3650 50  0001 C CNN
	4    2300 4100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC08 U2
U 5 1 5E774E45
P 1150 6150
F 0 "U2" H 1480 5646 50  0000 L CNN
F 1 "74AC08" H 1480 5555 50  0000 L CNN
F 2 "alexios:SOIC-14" H 1350 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 1350 5700 50  0001 C CNN
	5    1150 6150
	1    0    0    -1  
$EndComp
Connection ~ 950  6600
Connection ~ 950  6800
$Comp
L alexios:74AC32 U3
U 1 1 5E77714D
P 3150 3200
F 0 "U3" H 3150 3275 50  0000 C CNN
F 1 "74AC32" H 3150 3184 50  0000 C CNN
F 2 "alexios:SOIC-14" H 3150 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3150 3200 50  0001 C CNN
	1    3150 3200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC32 U3
U 2 1 5E7773BA
P 3150 4450
F 0 "U3" H 3150 3983 50  0000 C CNN
F 1 "74AC32" H 3150 4074 50  0000 C CNN
F 2 "alexios:SOIC-14" H 3150 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3150 4450 50  0001 C CNN
	2    3150 4450
	1    0    0    1   
$EndComp
$Comp
L alexios:74AC32 U3
U 3 1 5E77741B
P 3900 4000
F 0 "U3" H 3900 3533 50  0000 C CNN
F 1 "74AC32" H 3900 3624 50  0000 C CNN
F 2 "alexios:SOIC-14" H 3900 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3900 4000 50  0001 C CNN
	3    3900 4000
	1    0    0    1   
$EndComp
$Comp
L alexios:74AC32 U3
U 4 1 5E777492
P 6550 7250
F 0 "U3" H 6550 7325 50  0000 C CNN
F 1 "74AC32" H 6550 7234 50  0000 C CNN
F 2 "alexios:SOIC-14" H 6550 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6550 7250 50  0001 C CNN
	4    6550 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC32 U3
U 5 1 5E77C52C
P 2650 6400
F 0 "U3" H 2830 6146 50  0000 L CNN
F 1 "74AC32" H 2830 6055 50  0000 L CNN
F 2 "alexios:SOIC-14" H 2650 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2650 6400 50  0001 C CNN
	5    2650 6400
	1    0    0    -1  
$EndComp
Connection ~ 2300 6600
Connection ~ 2300 6800
Text Notes 2700 3800 0    63   ~ 13
AC Family ICs!
Text Notes 1950 4700 0    50   ~ 0
Stage 1: ≤ 10ns
Text Notes 2800 4700 0    50   ~ 0
Stage 2: ≤ 20ns
Text Notes 3550 4700 0    50   ~ 0
Stage 3: ≤ 30ns
Text Notes 4300 4700 0    50   ~ 0
Stage 4: ≤ 35ns
Text Notes 7150 3450 0    50   ~ 0
Stage 4: ≤ 55ns
Text Notes 8550 4700 0    50   ~ 0
The SKP result is available around\n40ns (worst case) after IR is loaded\nor a flag is changed, asynchronously.\nThe microcode guarantees flags\nare changed at least 500ns before\nthis result is used. The IR is loaded\nat least 125ns before a result is\nneeded.
Text Notes 8550 3950 0    63   ~ 13
Note on SKP Timing
Text Label 6050 5050 0    50   ~ 0
COND2
Text Label 6050 4950 0    50   ~ 0
COND1
Text Label 6050 4850 0    50   ~ 0
COND0
Text HLabel 1050 5900 0    50   Input ~ 0
~RESET
Wire Wire Line
	1050 5900 8200 5900
Text Label 1100 5900 0    50   ~ 0
~RESET
Wire Wire Line
	8200 5200 8200 5900
Wire Wire Line
	8200 5200 9450 5200
Text Label 9900 5500 2    50   ~ 0
~RESET
Text Label 9900 5600 2    50   ~ 0
~COND₁
Wire Notes Line width 24 style solid
	8450 3750 10100 3750
Wire Notes Line width 24 style solid
	10100 3750 10100 4800
Wire Notes Line width 24 style solid
	10100 4800 8450 4800
Wire Notes Line width 24 style solid
	8450 4800 8450 3750
Text Notes 650  800  0    98   ~ 20
The Skip and Branch Unit (SBU)
Text Notes 650  1350 0    50   ~ 0
This implements conditionals at the microcode level. One of 16 conditions may be checked. Conditions check if various bits of the IR are set. These are used to implement\nbitmap instructions. Flags can also be checked individually. In addition, a tree of gates implements the behaviour of the hardwired SKP instruction, in the same way as the\nPDP-8 does it. This result is treated as another source of conditionals. There are three unused signals, routed to solder jumpers and tied to ground. These can be used to\nextend the set of conditionals.\n\n
Text Label 4900 3750 0    50   ~ 0
SKP
Text Notes 8650 2250 0    50   ~ 0
~SKIPEXT~ is an open drain signal that can be asserted\nby external devices or processor extensions to force a\nskip during specific instructions. Currently, the IOT allows\nthis behaviour but the signal will be obeyed during any\nmicrocode conditional, so care must be taken.
Text Notes 8650 1750 0    63   ~ 13
Externally Signalled Skips
Wire Notes Line width 24 style solid
	8550 1550 11000 1550
Wire Notes Line width 24 style solid
	11000 1550 11000 2350
Wire Notes Line width 24 style solid
	11000 2350 8550 2350
Wire Notes Line width 24 style solid
	8550 2350 8550 1550
Entry Wire Line
	6500 3850 6600 3950
Entry Wire Line
	6500 3950 6600 4050
Entry Wire Line
	6500 4050 6600 4150
Entry Bus Bus
	6500 3700 6600 3600
Entry Bus Bus
	10100 3600 10200 3500
Text Label 6750 3600 0    50   ~ 0
CEXT[8..10]
Text Notes 8450 2600 0    50   ~ 0
Conditional inputs for future expansion
$Comp
L Device:R_Small R?
U 1 1 5E4CEF62
P 9400 3150
AR Path="/5E4CEF62" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E4CEF62" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5E4CEF62" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5E4CEF62" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5E4CEF62" Ref="R7"  Part="1" 
F 0 "R7" H 9342 3104 50  0000 R CNN
F 1 "4.7kΩ" H 9342 3195 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9400 3150 50  0001 C CNN
F 3 "~" H 9400 3150 50  0001 C CNN
	1    9400 3150
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E4DB6BE
P 9700 3150
AR Path="/5E4DB6BE" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E4DB6BE" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5E4DB6BE" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5E4DB6BE" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5E4DB6BE" Ref="R27"  Part="1" 
F 0 "R27" H 9650 3100 50  0000 R CNN
F 1 "4.7kΩ" H 9642 3195 50  0001 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9700 3150 50  0001 C CNN
F 3 "~" H 9700 3150 50  0001 C CNN
	1    9700 3150
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E4DF7DA
P 10000 3150
AR Path="/5E4DF7DA" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E4DF7DA" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5E4DF7DA" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5E4DF7DA" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5E4DF7DA" Ref="R52"  Part="1" 
F 0 "R52" H 9950 3100 50  0000 R CNN
F 1 "4.7kΩ" H 9942 3195 50  0001 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10000 3150 50  0001 C CNN
F 3 "~" H 10000 3150 50  0001 C CNN
	1    10000 3150
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR051
U 1 1 5E4F559F
P 9700 3250
F 0 "#PWR051" H 9700 3000 50  0001 C CNN
F 1 "GND" H 9705 3077 50  0000 C CNN
F 2 "" H 9700 3250 50  0001 C CNN
F 3 "" H 9700 3250 50  0001 C CNN
	1    9700 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR052
U 1 1 5E4F97C0
P 10000 3250
F 0 "#PWR052" H 10000 3000 50  0001 C CNN
F 1 "GND" H 10005 3077 50  0000 C CNN
F 2 "" H 10000 3250 50  0001 C CNN
F 3 "" H 10000 3250 50  0001 C CNN
	1    10000 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U10
U 1 1 5E52C0C4
P 2600 5250
AR Path="/5E52C0C4" Ref="U10"  Part="1" 
AR Path="/5EFCF155/5E52C0C4" Ref="U10"  Part="1" 
F 0 "U10" H 2600 5617 50  0000 C CNN
F 1 "74HC139" H 2600 5526 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2600 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 2600 5250 50  0001 C CNN
	1    2600 5250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U10
U 2 1 5E52C2BE
P 4050 5250
AR Path="/5E52C2BE" Ref="U10"  Part="2" 
AR Path="/5EFCF155/5E52C2BE" Ref="U10"  Part="2" 
F 0 "U10" H 4050 5617 50  0000 C CNN
F 1 "74HC139" H 4050 5526 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4050 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4050 5250 50  0001 C CNN
	2    4050 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5250 1750 5250
Wire Wire Line
	2100 5150 1750 5150
Text Label 1750 5150 0    50   ~ 0
COND3
Text Label 1750 5250 0    50   ~ 0
COND4
$Comp
L power:GND #PWR069
U 1 1 5E53BC9E
P 2050 5500
F 0 "#PWR069" H 2050 5250 50  0001 C CNN
F 1 "GND" H 2055 5327 50  0000 C CNN
F 2 "" H 2050 5500 50  0001 C CNN
F 3 "" H 2050 5500 50  0001 C CNN
	1    2050 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5500 2050 5450
Wire Wire Line
	2050 5450 2100 5450
Wire Wire Line
	3550 5150 3500 5150
Wire Wire Line
	3500 5150 3500 5250
$Comp
L power:GND #PWR070
U 1 1 5E54579D
P 3500 5500
F 0 "#PWR070" H 3500 5250 50  0001 C CNN
F 1 "GND" H 3505 5327 50  0000 C CNN
F 2 "" H 3500 5500 50  0001 C CNN
F 3 "" H 3500 5500 50  0001 C CNN
	1    3500 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5250 3500 5250
Connection ~ 3500 5250
Wire Wire Line
	3500 5250 3500 5450
Wire Wire Line
	3550 5450 3500 5450
Connection ~ 3500 5450
Wire Wire Line
	3500 5450 3500 5500
NoConn ~ 4550 5150
NoConn ~ 4550 5250
NoConn ~ 4550 5350
NoConn ~ 4550 5450
$Comp
L alexios:74HC139 U10
U 3 1 5E557E8E
P 4000 7400
AR Path="/5E557E8E" Ref="U10"  Part="3" 
AR Path="/5EFCF155/5E557E8E" Ref="U10"  Part="3" 
F 0 "U10" H 4179 7446 50  0000 L CNN
F 1 "74HC139" H 4179 7355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4000 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4000 7400 50  0001 C CNN
	3    4000 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5150 3350 5150
Wire Wire Line
	3100 5250 3350 5250
Text Label 3350 5150 2    50   ~ 0
~CEN0
Text Label 3350 5250 2    50   ~ 0
~CEN1
NoConn ~ 3100 5350
NoConn ~ 3100 5450
Wire Wire Line
	6950 3200 6700 3200
Text Label 6700 3200 0    50   ~ 0
~CEN0
Wire Wire Line
	6950 5250 6700 5250
Text Label 6700 5250 0    50   ~ 0
~CEN1
Entry Wire Line
	1750 5250 1650 5350
Entry Wire Line
	1750 5150 1650 5250
Entry Bus Bus
	1550 5750 1650 5650
$Comp
L power:GND #PWR?
U 1 1 5E5A40A1
P 3650 7500
AR Path="/5E5A40A1" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5E5A40A1" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 3650 7250 50  0001 C CNN
F 1 "GND" H 3655 7327 50  0000 C CNN
F 2 "" H 3650 7500 50  0001 C CNN
F 3 "" H 3650 7500 50  0001 C CNN
	1    3650 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E5A40A7
P 3650 7300
AR Path="/5E5A40A7" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5E5A40A7" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 3650 7150 50  0001 C CNN
F 1 "+5V" H 3665 7473 50  0000 C CNN
F 2 "" H 3650 7300 50  0001 C CNN
F 3 "" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E5A40AD
P 3650 7400
AR Path="/5CC0D65F/5E5A40AD" Ref="C?"  Part="1" 
AR Path="/5E5A40AD" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5E5A40AD" Ref="C20"  Part="1" 
F 0 "C20" H 3559 7446 50  0000 R CNN
F 1 "100nF" H 3559 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 7400 50  0001 C CNN
F 3 "~" H 3650 7400 50  0001 C CNN
	1    3650 7400
	1    0    0    -1  
$EndComp
Connection ~ 3650 7300
Connection ~ 3650 7500
Connection ~ 6300 7400
Wire Wire Line
	6300 7400 6300 7500
Wire Wire Line
	8900 2750 9400 2750
Wire Wire Line
	8900 2850 9700 2850
Wire Wire Line
	8900 2950 10000 2950
Entry Wire Line
	10100 2750 10200 2850
Entry Wire Line
	10100 2850 10200 2950
Entry Wire Line
	10100 2950 10200 3050
Wire Bus Line
	6600 3600 10100 3600
Wire Wire Line
	9400 3050 9400 2750
Connection ~ 9400 2750
Wire Wire Line
	9400 2750 10100 2750
Wire Wire Line
	9700 3050 9700 2850
Connection ~ 9700 2850
Wire Wire Line
	9700 2850 10100 2850
Wire Wire Line
	10000 3050 10000 2950
Connection ~ 10000 2950
Wire Wire Line
	10000 2950 10100 2950
Text Label 8950 2750 0    50   ~ 0
CEXT8
Text Label 8950 2850 0    50   ~ 0
CEXT9
Text Label 8950 2950 0    50   ~ 0
CEXT10
Text HLabel 8900 2750 0    50   3State ~ 0
CEXT8
Text HLabel 8900 2850 0    50   3State ~ 0
CEXT9
Text HLabel 8900 2950 0    50   3State ~ 0
CEXT10
Text Label 6950 3950 2    50   ~ 0
CEXT8
Text Label 6950 4050 2    50   ~ 0
CEXT9
Text Label 6950 4150 2    50   ~ 0
CEXT10
$Comp
L alexios:74AHC1G86 U?
U 2 1 5EE3BC55
P 4050 6550
AR Path="/5EE3BC55" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5EE3BC55" Ref="U4"  Part="2" 
F 0 "U4" H 4180 6446 50  0000 L CNN
F 1 "74LVC1G86" H 4180 6355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3980 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3980 6850 50  0001 C CNN
	2    4050 6550
	1    0    0    -1  
$EndComp
Connection ~ 3650 6800
Connection ~ 3650 6600
$Comp
L alexios:74HC251 U?
U 1 1 5F031563
P 7450 4550
AR Path="/5F031563" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031563" Ref="U5"  Part="1" 
F 0 "U5" H 7450 5417 50  0000 C CNN
F 1 "74HC251" H 7450 5326 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7450 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7450 4500 50  0001 C CNN
	1    7450 4550
	1    0    0    -1  
$EndComp
Text Label 8650 5600 2    50   ~ 0
~COND₀
Wire Bus Line
	1050 5750 5650 5750
Wire Bus Line
	1650 5250 1650 5650
Wire Bus Line
	1050 1700 5650 1700
Wire Bus Line
	6500 3700 6500 4050
Wire Bus Line
	10200 2850 10200 3500
Wire Bus Line
	5750 2900 5750 5650
Wire Bus Line
	1400 1800 1400 4350
Wire Bus Line
	5750 1800 5750 2500
$EndSCHEMATC
