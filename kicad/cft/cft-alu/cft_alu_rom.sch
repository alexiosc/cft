EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 9
Title "Arithmetic & Logic Unit"
Date "2019-11-17"
Rev ""
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2100 1500 1650 1500
Wire Wire Line
	2100 1600 1650 1600
Wire Wire Line
	2100 1700 1650 1700
Wire Wire Line
	2100 1800 1650 1800
Wire Wire Line
	2100 1900 1650 1900
Wire Wire Line
	2100 2000 1650 2000
Wire Wire Line
	2100 2100 1450 2100
Wire Wire Line
	2100 2200 1450 2200
Wire Wire Line
	2100 2300 1450 2300
Wire Wire Line
	2100 2400 1450 2400
Wire Wire Line
	2100 2500 1450 2500
Wire Wire Line
	2100 2600 1450 2600
Wire Wire Line
	2100 2700 950  2700
Text Label 1750 2700 0    50   ~ 0
FL
Wire Wire Line
	3200 1500 3700 1500
Wire Wire Line
	3200 1600 3700 1600
Wire Wire Line
	3200 1700 3700 1700
Wire Wire Line
	3200 1800 3700 1800
Wire Wire Line
	3200 1900 3700 1900
Wire Wire Line
	3200 2000 3700 2000
Text Label 3250 2100 0    50   ~ 0
C0
$Comp
L power:+5V #PWR?
U 1 1 5E195CE2
P 3200 2600
AR Path="/5DC89E19/5E195CE2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CE2" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E195CE2" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 3200 2450 50  0001 C CNN
F 1 "+5V" V 3300 2600 50  0000 L CNN
F 2 "" H 3200 2600 50  0001 C CNN
F 3 "" H 3200 2600 50  0001 C CNN
	1    3200 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 1500 4300 1500
Wire Wire Line
	4750 1600 4300 1600
Wire Wire Line
	4750 1700 4300 1700
Wire Wire Line
	4750 1800 4300 1800
Wire Wire Line
	4750 1900 4300 1900
Wire Wire Line
	4750 2000 4300 2000
Text Label 4400 2700 0    50   ~ 0
C0
Wire Wire Line
	5850 1500 6350 1500
Wire Wire Line
	5850 1600 6350 1600
Wire Wire Line
	5850 1700 6350 1700
Wire Wire Line
	5850 1800 6350 1800
Wire Wire Line
	5850 1900 6350 1900
Wire Wire Line
	5850 2000 6350 2000
Text Label 6200 2100 2    50   ~ 0
C1
$Comp
L power:+5V #PWR?
U 1 1 5E195D24
P 5850 2600
AR Path="/5DC89E19/5E195D24" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D24" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E195D24" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 5850 2450 50  0001 C CNN
F 1 "+5V" V 6000 2550 50  0000 L CNN
F 2 "" H 5850 2600 50  0001 C CNN
F 3 "" H 5850 2600 50  0001 C CNN
	1    5850 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 2100 3650 2700
Wire Wire Line
	3200 2100 3650 2100
Wire Wire Line
	3650 2700 4750 2700
Text Label 6200 1500 2    50   ~ 0
Y6
Text Label 6200 1600 2    50   ~ 0
Y7
Text Label 6200 1700 2    50   ~ 0
Y8
Text Label 6200 1800 2    50   ~ 0
Y9
Text Label 6200 1900 2    50   ~ 0
Y10
Text Label 6200 2000 2    50   ~ 0
Y11
Wire Wire Line
	7400 1500 6950 1500
Wire Wire Line
	7400 1600 6950 1600
Wire Wire Line
	7400 1700 6950 1700
Wire Wire Line
	7400 1800 6950 1800
Wire Wire Line
	8500 1500 9200 1500
Wire Wire Line
	8500 1600 9200 1600
Wire Wire Line
	8500 1700 9200 1700
Wire Wire Line
	8500 1800 9200 1800
$Comp
L power:+5V #PWR?
U 1 1 5E195D70
P 8500 2600
AR Path="/5DC89E19/5E195D70" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D70" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E195D70" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 8500 2450 50  0001 C CNN
F 1 "+5V" V 8600 2600 50  0000 L CNN
F 2 "" H 8500 2600 50  0001 C CNN
F 3 "" H 8500 2600 50  0001 C CNN
	1    8500 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 2100 6300 2700
Wire Wire Line
	5850 2100 6300 2100
Text Label 8550 1500 0    50   ~ 0
Y12
Text Label 8550 1600 0    50   ~ 0
Y13
Text Label 8550 1700 0    50   ~ 0
Y14
Text Label 8550 1800 0    50   ~ 0
Y15
Entry Wire Line
	1550 1400 1650 1500
Entry Wire Line
	1550 1500 1650 1600
Entry Wire Line
	1550 1600 1650 1700
Entry Wire Line
	1550 1700 1650 1800
Entry Wire Line
	1550 1800 1650 1900
Entry Wire Line
	1550 1900 1650 2000
Entry Wire Line
	1350 2000 1450 2100
Entry Wire Line
	1350 2100 1450 2200
Entry Wire Line
	1350 2200 1450 2300
Entry Wire Line
	1350 2300 1450 2400
Entry Wire Line
	1350 2400 1450 2500
Entry Wire Line
	1350 2500 1450 2600
Entry Wire Line
	4200 1400 4300 1500
Entry Wire Line
	4200 1500 4300 1600
Entry Wire Line
	4200 1600 4300 1700
Entry Wire Line
	4200 1700 4300 1800
Entry Wire Line
	4200 1800 4300 1900
Entry Wire Line
	4200 1900 4300 2000
Entry Wire Line
	6850 1400 6950 1500
Entry Wire Line
	6850 1500 6950 1600
Entry Wire Line
	6850 1600 6950 1700
Entry Wire Line
	6850 1700 6950 1800
Entry Wire Line
	4000 2000 4100 2100
Entry Wire Line
	4000 2100 4100 2200
Entry Wire Line
	4000 2200 4100 2300
Entry Wire Line
	4000 2300 4100 2400
Entry Wire Line
	4000 2400 4100 2500
Entry Wire Line
	4000 2500 4100 2600
Wire Wire Line
	4100 2100 4750 2100
Wire Wire Line
	4100 2200 4750 2200
Wire Wire Line
	4100 2300 4750 2300
Wire Wire Line
	4100 2400 4750 2400
Wire Wire Line
	4100 2500 4750 2500
Wire Wire Line
	4100 2600 4750 2600
Entry Wire Line
	6650 2000 6750 2100
Entry Wire Line
	6650 2100 6750 2200
Entry Wire Line
	6650 2200 6750 2300
Entry Wire Line
	6650 2300 6750 2400
Wire Wire Line
	6750 2100 7400 2100
Wire Wire Line
	6750 2200 7400 2200
Wire Wire Line
	6750 2300 7400 2300
Wire Wire Line
	6750 2400 7400 2400
Entry Bus Bus
	1250 1000 1350 1100
Entry Bus Bus
	1450 850  1550 950 
Entry Bus Bus
	3900 1000 4000 1100
Entry Bus Bus
	6550 1000 6650 1100
Entry Wire Line
	3700 1500 3800 1600
Entry Wire Line
	3700 1600 3800 1700
Entry Wire Line
	3700 1700 3800 1800
Entry Wire Line
	3700 1800 3800 1900
Entry Wire Line
	3700 1900 3800 2000
Entry Wire Line
	3700 2000 3800 2100
Entry Wire Line
	6350 1500 6450 1600
Entry Wire Line
	6350 1600 6450 1700
Entry Wire Line
	6350 1700 6450 1800
Entry Wire Line
	6350 1800 6450 1900
Entry Wire Line
	6350 1900 6450 2000
Entry Wire Line
	6350 2000 6450 2100
Entry Wire Line
	9200 1500 9300 1600
Entry Wire Line
	9200 1600 9300 1700
Entry Wire Line
	9200 1700 9300 1800
Entry Wire Line
	9200 1800 9300 1900
Entry Bus Bus
	4100 850  4200 950 
Entry Bus Bus
	6750 850  6850 950 
Entry Bus Bus
	4100 850  4200 950 
Text HLabel 950  1000 0    50   Input ~ 0
B[0..15]
Text HLabel 950  850  0    50   Input ~ 0
A[0..15]
Text HLabel 10200 5800 2    50   3State ~ 0
IBUS[0..15]
Entry Bus Bus
	9200 3700 9300 3600
Entry Bus Bus
	6450 3600 6550 3700
Entry Bus Bus
	3800 3600 3900 3700
Text Label 1050 850  0    50   ~ 0
A[0..15]
Text Label 2500 850  0    50   ~ 0
A[0..15]
Text Label 5150 850  0    50   ~ 0
A[0..15]
Text Label 1050 1000 0    50   ~ 0
B[0..15]
Text Label 2500 1000 0    50   ~ 0
B[0..15]
Text Label 5150 1000 0    50   ~ 0
B[0..15]
Text Label 4200 1600 1    50   ~ 0
A[0..15]
Text Label 4000 1600 1    50   ~ 0
B[0..15]
Text Label 1350 1600 1    50   ~ 0
B[0..15]
Text Label 1550 1600 1    50   ~ 0
A[0..15]
Text Label 6850 1600 1    50   ~ 0
A[0..15]
Text Label 6650 1600 1    50   ~ 0
B[0..15]
Text Label 3800 3400 1    50   ~ 0
Y[0..15]
Text Label 6450 3400 1    50   ~ 0
Y[0..15]
Text Label 9300 2500 1    50   ~ 0
Y[0..15]
Text Label 4500 3700 0    50   ~ 0
Y[0..15]
Text Label 8200 3700 0    50   ~ 0
Y[0..15]
Text HLabel 950  2700 0    50   Input ~ 0
FL
Text HLabel 950  5500 0    50   Input ~ 0
~ROMOE
Wire Wire Line
	5850 2200 6200 2200
Text Label 6200 2200 2    50   ~ 0
X1
Text HLabel 10550 1900 2    50   Output ~ 0
X1
Text Label 3250 2200 0    50   ~ 0
X0
Text HLabel 10550 1800 2    50   Output ~ 0
X0
Wire Wire Line
	10550 1800 9550 1800
Wire Wire Line
	10550 1900 9550 1900
Text Label 9550 1800 0    50   ~ 0
X0
Text Label 9550 1900 0    50   ~ 0
X1
Wire Wire Line
	8500 2200 8800 2200
$Comp
L Device:C_Small C?
U 1 1 5E42E1EE
P 900 7350
AR Path="/5CC0D65F/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E42E1EE" Ref="C5"  Part="1" 
F 0 "C5" H 809 7396 50  0000 R CNN
F 1 "100nF" H 809 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 7350 50  0001 C CNN
F 3 "~" H 900 7350 50  0001 C CNN
	1    900  7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E42E1F4
P 900 7450
AR Path="/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E42E1F4" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 900 7200 50  0001 C CNN
F 1 "GND" H 905 7277 50  0000 C CNN
F 2 "" H 900 7450 50  0001 C CNN
F 3 "" H 900 7450 50  0001 C CNN
	1    900  7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E42E1FA
P 900 7250
AR Path="/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E42E1FA" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 900 7100 50  0001 C CNN
F 1 "+5V" H 915 7423 50  0000 C CNN
F 2 "" H 900 7250 50  0001 C CNN
F 3 "" H 900 7250 50  0001 C CNN
	1    900  7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E434AC6
P 2150 7350
AR Path="/5CC0D65F/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E434AC6" Ref="C6"  Part="1" 
F 0 "C6" H 2059 7396 50  0000 R CNN
F 1 "100nF" H 2059 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2150 7350 50  0001 C CNN
F 3 "~" H 2150 7350 50  0001 C CNN
	1    2150 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E434ACC
P 2150 7450
AR Path="/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E434ACC" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 2150 7200 50  0001 C CNN
F 1 "GND" H 2155 7277 50  0000 C CNN
F 2 "" H 2150 7450 50  0001 C CNN
F 3 "" H 2150 7450 50  0001 C CNN
	1    2150 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E434AD2
P 2150 7250
AR Path="/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E434AD2" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 2150 7100 50  0001 C CNN
F 1 "+5V" H 2165 7423 50  0000 C CNN
F 2 "" H 2150 7250 50  0001 C CNN
F 3 "" H 2150 7250 50  0001 C CNN
	1    2150 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E43A775
P 3450 7350
AR Path="/5CC0D65F/5E43A775" Ref="C?"  Part="1" 
AR Path="/5E43A775" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E43A775" Ref="C7"  Part="1" 
F 0 "C7" H 3359 7396 50  0000 R CNN
F 1 "100nF" H 3359 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3450 7350 50  0001 C CNN
F 3 "~" H 3450 7350 50  0001 C CNN
	1    3450 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E43A77B
P 3450 7450
AR Path="/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E43A77B" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 3450 7200 50  0001 C CNN
F 1 "GND" H 3455 7277 50  0000 C CNN
F 2 "" H 3450 7450 50  0001 C CNN
F 3 "" H 3450 7450 50  0001 C CNN
	1    3450 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E43A781
P 3450 7250
AR Path="/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E43A781" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 3450 7100 50  0001 C CNN
F 1 "+5V" H 3465 7423 50  0000 C CNN
F 2 "" H 3450 7250 50  0001 C CNN
F 3 "" H 3450 7250 50  0001 C CNN
	1    3450 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2800 3550 2800
Wire Wire Line
	3550 2800 3550 2200
Wire Wire Line
	3200 2200 3550 2200
Wire Wire Line
	6200 2200 6200 2800
Text Label 4400 2800 0    50   ~ 0
X0
Text Label 7050 2800 0    50   ~ 0
X1
Wire Wire Line
	8500 2100 8900 2100
Wire Wire Line
	8500 2000 9000 2000
Wire Wire Line
	9100 1900 9100 2000
Text Label 9550 2000 0    50   ~ 0
FVOUT
Text HLabel 10550 2000 2    50   Output ~ 0
FVOUT-ROM
Text HLabel 10550 2200 2    50   Output ~ 0
~SETV-ROM
Text HLabel 10550 2800 2    50   Output ~ 0
FLOUT-ROM
Text HLabel 10550 3400 2    50   Output ~ 0
~SETL-ROM
Text Label 9550 2750 0    50   ~ 0
FLOUT
Text Label 8550 2100 0    50   ~ 0
FLOUT
Text Label 8550 1900 0    50   ~ 0
FVOUT
Text HLabel 950  2800 0    50   Input ~ 0
X-IN
Text Label 1750 2800 0    50   ~ 0
X-IN
Text Label 1750 1500 0    50   ~ 0
A0
Text Label 1750 1600 0    50   ~ 0
A1
Text Label 1750 1700 0    50   ~ 0
A2
Text Label 1750 1800 0    50   ~ 0
A3
Text Label 1750 1900 0    50   ~ 0
A4
Text Label 1750 2000 0    50   ~ 0
A5
Text Label 1750 2100 0    50   ~ 0
B0
Text Label 1750 2200 0    50   ~ 0
B1
Text Label 1750 2300 0    50   ~ 0
B2
Text Label 1750 2400 0    50   ~ 0
B3
Text Label 1750 2500 0    50   ~ 0
B4
Text Label 1750 2600 0    50   ~ 0
B5
Text Label 3250 1500 0    50   ~ 0
Y0
Text Label 3250 1600 0    50   ~ 0
Y1
Text Label 3250 1700 0    50   ~ 0
Y2
Text Label 3250 1800 0    50   ~ 0
Y3
Text Label 3250 1900 0    50   ~ 0
Y4
Text Label 3250 2000 0    50   ~ 0
Y5
Text Label 4400 1500 0    50   ~ 0
A6
Text Label 4400 1600 0    50   ~ 0
A7
Text Label 4400 1700 0    50   ~ 0
A8
Text Label 4400 1800 0    50   ~ 0
A9
Text Label 4400 1900 0    50   ~ 0
A10
Text Label 4400 2000 0    50   ~ 0
A11
Text Label 4400 2100 0    50   ~ 0
B6
Text Label 4400 2200 0    50   ~ 0
B7
Text Label 4400 2300 0    50   ~ 0
B8
Text Label 4400 2400 0    50   ~ 0
B9
Text Label 4400 2500 0    50   ~ 0
B10
Text Label 4400 2600 0    50   ~ 0
B11
Text Label 7050 2700 0    50   ~ 0
C1
Text Label 7050 1500 0    50   ~ 0
A12
Text Label 7050 1600 0    50   ~ 0
A13
Text Label 7050 1700 0    50   ~ 0
A14
Text Label 7050 1800 0    50   ~ 0
A15
Text Label 7050 2100 0    50   ~ 0
B12
Text Label 7050 2200 0    50   ~ 0
B13
Text Label 7050 2300 0    50   ~ 0
B14
Text Label 7050 2400 0    50   ~ 0
B15
$Comp
L alexios:74HC541 U5
U 1 1 5DC85DD2
P 5250 4600
F 0 "U5" H 5250 5367 50  0000 C CNN
F 1 "74HC541" H 5250 5276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5250 4600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 5250 4600 50  0001 C CNN
	1    5250 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4100 4500 4100
Wire Wire Line
	4750 4200 4500 4200
Wire Wire Line
	4750 4300 4500 4300
Wire Wire Line
	4750 4400 4500 4400
Wire Wire Line
	4750 4500 4500 4500
Wire Wire Line
	4750 4600 4500 4600
Wire Wire Line
	4750 4700 4500 4700
Wire Wire Line
	4750 4800 4500 4800
Entry Wire Line
	4400 4000 4500 4100
Entry Wire Line
	4400 4100 4500 4200
Entry Wire Line
	4400 4200 4500 4300
Entry Wire Line
	4400 4300 4500 4400
Entry Wire Line
	4400 4400 4500 4500
Entry Wire Line
	4400 4500 4500 4600
Entry Wire Line
	4400 4600 4500 4700
Entry Wire Line
	4400 4700 4500 4800
Text Label 4550 4100 0    50   ~ 0
Y0
Text Label 4550 4200 0    50   ~ 0
Y1
Text Label 4550 4300 0    50   ~ 0
Y2
Text Label 4550 4400 0    50   ~ 0
Y3
Text Label 4550 4500 0    50   ~ 0
Y4
Text Label 4550 4600 0    50   ~ 0
Y5
Text Label 4550 4700 0    50   ~ 0
Y6
Text Label 4550 4800 0    50   ~ 0
Y7
$Comp
L power:GND #PWR0116
U 1 1 5DCA6050
P 4750 5100
F 0 "#PWR0116" H 4750 4850 50  0001 C CNN
F 1 "GND" H 4755 4927 50  0000 C CNN
F 2 "" H 4750 5100 50  0001 C CNN
F 3 "" H 4750 5100 50  0001 C CNN
	1    4750 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DCAB563
P 8550 2500
AR Path="/5DC89E19/5DCAB563" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5DCAB563" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5DCAB563" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 8550 2250 50  0001 C CNN
F 1 "GND" V 8700 2500 50  0000 R CNN
F 2 "" H 8550 2500 50  0001 C CNN
F 3 "" H 8550 2500 50  0001 C CNN
	1    8550 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8500 2400 8550 2400
Wire Wire Line
	8550 2400 8550 2500
Wire Wire Line
	8500 2500 8550 2500
Connection ~ 8550 2500
$Comp
L power:GND #PWR?
U 1 1 5DCB7239
P 5900 2500
AR Path="/5DC89E19/5DCB7239" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5DCB7239" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5DCB7239" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 5900 2250 50  0001 C CNN
F 1 "GND" V 6050 2500 50  0000 R CNN
F 2 "" H 5900 2500 50  0001 C CNN
F 3 "" H 5900 2500 50  0001 C CNN
	1    5900 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5850 2400 5900 2400
Wire Wire Line
	5900 2400 5900 2500
Wire Wire Line
	5850 2500 5900 2500
Connection ~ 5900 2500
$Comp
L power:GND #PWR?
U 1 1 5DCBCB79
P 3250 2500
AR Path="/5DC89E19/5DCBCB79" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5DCBCB79" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5DCBCB79" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 3250 2250 50  0001 C CNN
F 1 "GND" V 3400 2500 50  0000 R CNN
F 2 "" H 3250 2500 50  0001 C CNN
F 3 "" H 3250 2500 50  0001 C CNN
	1    3250 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 2400 3250 2400
Wire Wire Line
	3250 2400 3250 2500
Wire Wire Line
	3200 2500 3250 2500
Connection ~ 3250 2500
Wire Wire Line
	4750 5000 4500 5000
Wire Wire Line
	4500 5000 4500 5500
Text Label 4550 5000 0    50   ~ 0
~ROMOE
Entry Wire Line
	6200 4100 6300 4200
Entry Wire Line
	6200 4200 6300 4300
Entry Wire Line
	6200 4300 6300 4400
Entry Wire Line
	6200 4400 6300 4500
Entry Wire Line
	6200 4500 6300 4600
Entry Wire Line
	6200 4600 6300 4700
Entry Wire Line
	6200 4700 6300 4800
Entry Wire Line
	6200 4800 6300 4900
$Comp
L alexios:74HC541 U6
U 1 1 5DCDF731
P 7900 4600
F 0 "U6" H 7900 5367 50  0000 C CNN
F 1 "74HC541" H 7900 5276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7900 4600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7900 4600 50  0001 C CNN
	1    7900 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4100 7150 4100
Wire Wire Line
	7400 4200 7150 4200
Wire Wire Line
	7400 4300 7150 4300
Wire Wire Line
	7400 4400 7150 4400
Wire Wire Line
	7400 4500 7150 4500
Wire Wire Line
	7400 4600 7150 4600
Wire Wire Line
	7400 4700 7150 4700
Wire Wire Line
	7400 4800 7150 4800
Entry Wire Line
	7050 4000 7150 4100
Entry Wire Line
	7050 4100 7150 4200
Entry Wire Line
	7050 4200 7150 4300
Entry Wire Line
	7050 4300 7150 4400
Entry Wire Line
	7050 4400 7150 4500
Entry Wire Line
	7050 4500 7150 4600
Entry Wire Line
	7050 4600 7150 4700
Entry Wire Line
	7050 4700 7150 4800
$Comp
L power:GND #PWR0120
U 1 1 5DCDF750
P 7400 5100
F 0 "#PWR0120" H 7400 4850 50  0001 C CNN
F 1 "GND" H 7405 4927 50  0000 C CNN
F 2 "" H 7400 5100 50  0001 C CNN
F 3 "" H 7400 5100 50  0001 C CNN
	1    7400 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 5000 7150 5000
Wire Wire Line
	7150 5000 7150 5500
Text Label 7200 5000 0    50   ~ 0
~ROMOE
Entry Wire Line
	8850 4100 8950 4200
Entry Wire Line
	8850 4200 8950 4300
Entry Wire Line
	8850 4300 8950 4400
Entry Wire Line
	8850 4400 8950 4500
Entry Wire Line
	8850 4500 8950 4600
Entry Wire Line
	8850 4600 8950 4700
Entry Wire Line
	8850 4700 8950 4800
Entry Wire Line
	8850 4800 8950 4900
Entry Bus Bus
	7050 3800 6950 3700
Entry Bus Bus
	6300 5700 6400 5800
Entry Bus Bus
	8950 5700 9050 5800
Wire Wire Line
	4500 5500 7150 5500
Text Label 9650 5800 0    50   ~ 0
IBUS[0..15]
Text Label 8950 5450 1    50   ~ 0
IBUS[0..15]
Text Label 6300 5450 1    50   ~ 0
IBUS[0..15]
Text Label 4400 4500 1    50   ~ 0
Y[0..15]
Text Label 7050 4500 1    50   ~ 0
Y[0..15]
Wire Wire Line
	8500 1900 9100 1900
Text Label 5800 4100 0    50   ~ 0
IBUS0
Text Label 5800 4200 0    50   ~ 0
IBUS1
Text Label 5800 4300 0    50   ~ 0
IBUS2
Text Label 5800 4400 0    50   ~ 0
IBUS3
Text Label 5800 4500 0    50   ~ 0
IBUS4
Text Label 5800 4600 0    50   ~ 0
IBUS5
Text Label 5800 4700 0    50   ~ 0
IBUS6
Text Label 5800 4800 0    50   ~ 0
IBUS7
Wire Wire Line
	6200 2800 7400 2800
Wire Wire Line
	6300 2700 7400 2700
Wire Wire Line
	9100 2000 10550 2000
Text Label 8550 4100 0    50   ~ 0
IBUS8
Text Label 8550 4200 0    50   ~ 0
IBUS9
Text Label 8550 4300 0    50   ~ 0
IBUS10
Text Label 8550 4400 0    50   ~ 0
IBUS11
Text Label 8550 4500 0    50   ~ 0
IBUS12
Text Label 8550 4600 0    50   ~ 0
IBUS13
Text Label 8550 4700 0    50   ~ 0
IBUS14
Text Label 8550 4800 0    50   ~ 0
IBUS15
Wire Wire Line
	5750 4100 6200 4100
Wire Wire Line
	5750 4200 6200 4200
Wire Wire Line
	5750 4300 6200 4300
Wire Wire Line
	5750 4400 6200 4400
Wire Wire Line
	5750 4500 6200 4500
Wire Wire Line
	5750 4600 6200 4600
Wire Wire Line
	5750 4700 6200 4700
Wire Wire Line
	5750 4800 6200 4800
Wire Wire Line
	8400 4100 8850 4100
Wire Wire Line
	8400 4200 8850 4200
Wire Wire Line
	8400 4300 8850 4300
Wire Wire Line
	8400 4400 8850 4400
Wire Wire Line
	8400 4500 8850 4500
Wire Wire Line
	8400 4600 8850 4600
Wire Wire Line
	8400 4700 8850 4700
Wire Wire Line
	8400 4800 8850 4800
Entry Bus Bus
	4300 3700 4400 3800
Connection ~ 4500 5500
$Comp
L alexios:74HC541 U5
U 2 1 5E1F00D4
P 5050 7350
F 0 "U5" H 5229 7396 50  0000 L CNN
F 1 "74HC541" H 5229 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5050 7350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 5050 7350 50  0001 C CNN
	2    5050 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E1F0362
P 4700 7350
AR Path="/5CC0D65F/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E1F0362" Ref="C8"  Part="1" 
F 0 "C8" H 4609 7396 50  0000 R CNN
F 1 "100nF" H 4609 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 7350 50  0001 C CNN
F 3 "~" H 4700 7350 50  0001 C CNN
	1    4700 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E1F0369
P 4700 7450
AR Path="/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E1F0369" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 4700 7200 50  0001 C CNN
F 1 "GND" H 4705 7277 50  0000 C CNN
F 2 "" H 4700 7450 50  0001 C CNN
F 3 "" H 4700 7450 50  0001 C CNN
	1    4700 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E1F036F
P 4700 7250
AR Path="/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E1F036F" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 4700 7100 50  0001 C CNN
F 1 "+5V" H 4715 7423 50  0000 C CNN
F 2 "" H 4700 7250 50  0001 C CNN
F 3 "" H 4700 7250 50  0001 C CNN
	1    4700 7250
	1    0    0    -1  
$EndComp
Connection ~ 4700 7450
Connection ~ 4700 7250
$Comp
L alexios:74HC541 U6
U 2 1 5E1F9603
P 6350 7350
F 0 "U6" H 6529 7396 50  0000 L CNN
F 1 "74HC541" H 6529 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 6350 7350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6350 7350 50  0001 C CNN
	2    6350 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E1F960A
P 6000 7350
AR Path="/5CC0D65F/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E1F960A" Ref="C9"  Part="1" 
F 0 "C9" H 5909 7396 50  0000 R CNN
F 1 "100nF" H 5909 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 7350 50  0001 C CNN
F 3 "~" H 6000 7350 50  0001 C CNN
	1    6000 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E1F9611
P 6000 7450
AR Path="/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E1F9611" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 6000 7200 50  0001 C CNN
F 1 "GND" H 6005 7277 50  0000 C CNN
F 2 "" H 6000 7450 50  0001 C CNN
F 3 "" H 6000 7450 50  0001 C CNN
	1    6000 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E1F9617
P 6000 7250
AR Path="/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E1F9617" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 6000 7100 50  0001 C CNN
F 1 "+5V" H 6015 7423 50  0000 C CNN
F 2 "" H 6000 7250 50  0001 C CNN
F 3 "" H 6000 7250 50  0001 C CNN
	1    6000 7250
	1    0    0    -1  
$EndComp
Connection ~ 6000 7450
Connection ~ 6000 7250
Text Notes 9250 4400 0    66   ~ 13
Tri-Stating
Text Notes 9250 5450 0    50   ~ 0
The ROMs can't be tri-stated because\nthey feed into each other, and we need\nto keep the cascade as fast as possible\nand allow it to run for longer than a\nprocessor cycle, if needed. The Control\nUnit forcibly tri-states every IBus driver\nfor part of the cycle, so we use external\nbuffers and the ROM's own signals (plus\noutput control signals that shouldn't\never be tri-stated anyway) can stay\ndriven.
Wire Notes Line width 20 style solid
	9150 4200 9150 5550
Wire Notes Line width 20 style solid
	10950 4200 9150 4200
Wire Notes Line width 20 style solid
	10950 5550 10950 4200
Wire Notes Line width 20 style solid
	9150 5550 10950 5550
Text Label 8550 2000 0    50   ~ 0
~SETV
Text Label 8550 2200 0    50   ~ 0
~SETL
Text Notes 700  3600 0    50   ~ 0
X-IN is reserved for future\nexpansion, and wired to\nallow this. It can be cascaded\nlike carry using X0 and X1, or\nindependent of them.
Wire Wire Line
	950  2800 2100 2800
Text Label 7200 4100 0    50   ~ 0
Y8
Text Label 7200 4200 0    50   ~ 0
Y9
Text Label 7200 4300 0    50   ~ 0
Y10
Text Label 7200 4400 0    50   ~ 0
Y11
Text Label 7200 4500 0    50   ~ 0
Y12
Text Label 7200 4600 0    50   ~ 0
Y13
Text Label 7200 4700 0    50   ~ 0
Y14
Text Label 7200 4800 0    50   ~ 0
Y15
$Comp
L alexios:74LVC1G32 U44
U 1 1 5EB2EB3A
P 10200 2200
F 0 "U44" H 10250 2025 50  0000 C CNN
F 1 "74LVC1G32" H 10250 1934 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10310 2180 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10310 2180 50  0001 C CNN
	1    10200 2200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U45
U 1 1 5EB2F744
P 10200 3400
F 0 "U45" H 10250 3225 50  0000 C CNN
F 1 "74LVC1G32" H 10250 3134 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10310 3380 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10310 3380 50  0001 C CNN
	1    10200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 2200 10550 2200
Wire Wire Line
	10500 3400 10550 3400
Text Label 9550 2150 0    50   ~ 0
~SETV
Text Label 9550 2250 0    50   ~ 0
~ROMOE
Wire Wire Line
	8800 3350 10000 3350
Wire Wire Line
	8800 2200 8800 3350
Wire Wire Line
	9000 2150 10000 2150
Wire Wire Line
	9000 2000 9000 2150
Wire Wire Line
	9550 2250 10000 2250
Wire Wire Line
	9550 3450 10000 3450
Wire Wire Line
	8900 2750 10000 2750
Wire Wire Line
	8900 2100 8900 2750
$Comp
L alexios:74LVC1G86 U19
U 1 1 5EA856A9
P 10250 2700
F 0 "U19" H 10250 2424 50  0000 C CNN
F 1 "74LVC1G86" H 10250 2333 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10190 3010 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G86.pdf" H 10190 3010 50  0001 C CNN
	1    10250 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2850 9550 2850
Text Label 9550 2850 0    50   ~ 0
FL
Wire Wire Line
	10550 2800 10500 2800
Connection ~ 8600 6250
Connection ~ 8600 6450
$Comp
L alexios:74LVC1G32 U45
U 2 1 5EBE3F55
P 9000 6100
F 0 "U45" H 9130 5896 50  0000 L CNN
F 1 "74LVC1G32" H 9130 5805 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9110 6080 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9110 6080 50  0001 C CNN
	2    9000 6100
	1    0    0    -1  
$EndComp
Connection ~ 7250 6250
Connection ~ 7250 6450
$Comp
L power:+5V #PWR?
U 1 1 5EBD972E
P 8600 6250
AR Path="/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBD972E" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 8600 6100 50  0001 C CNN
F 1 "+5V" H 8615 6423 50  0000 C CNN
F 2 "" H 8600 6250 50  0001 C CNN
F 3 "" H 8600 6250 50  0001 C CNN
	1    8600 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBD9728
P 8600 6450
AR Path="/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBD9728" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 8600 6200 50  0001 C CNN
F 1 "GND" H 8605 6277 50  0000 C CNN
F 2 "" H 8600 6450 50  0001 C CNN
F 3 "" H 8600 6450 50  0001 C CNN
	1    8600 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EBD9722
P 8600 6350
AR Path="/5CC0D65F/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5EBD9722" Ref="C47"  Part="1" 
F 0 "C47" H 8509 6396 50  0000 R CNN
F 1 "100nF" H 8509 6305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8600 6350 50  0001 C CNN
F 3 "~" H 8600 6350 50  0001 C CNN
	1    8600 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EBCD351
P 7250 6250
AR Path="/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBCD351" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 7250 6100 50  0001 C CNN
F 1 "+5V" H 7265 6423 50  0000 C CNN
F 2 "" H 7250 6250 50  0001 C CNN
F 3 "" H 7250 6250 50  0001 C CNN
	1    7250 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBCD34B
P 7250 6450
AR Path="/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBCD34B" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 7250 6200 50  0001 C CNN
F 1 "GND" H 7255 6277 50  0000 C CNN
F 2 "" H 7250 6450 50  0001 C CNN
F 3 "" H 7250 6450 50  0001 C CNN
	1    7250 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EBCD345
P 7250 6350
AR Path="/5CC0D65F/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5EBCD345" Ref="C46"  Part="1" 
F 0 "C46" H 7159 6396 50  0000 R CNN
F 1 "100nF" H 7159 6305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7250 6350 50  0001 C CNN
F 3 "~" H 7250 6350 50  0001 C CNN
	1    7250 6350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U44
U 2 1 5EBCB936
P 7650 6100
F 0 "U44" H 7780 5896 50  0000 L CNN
F 1 "74LVC1G32" H 7780 5805 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7760 6080 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 7760 6080 50  0001 C CNN
	2    7650 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EB1822C
P 9950 6250
AR Path="/5EB1822C" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EB1822C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EB1822C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EB1822C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EB1822C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EB1822C" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EB1822C" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 9950 6100 50  0001 C CNN
F 1 "+5V" H 9965 6423 50  0000 C CNN
F 2 "" H 9950 6250 50  0001 C CNN
F 3 "" H 9950 6250 50  0001 C CNN
	1    9950 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB18232
P 9950 6450
AR Path="/5EB18232" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EB18232" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EB18232" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EB18232" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EB18232" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EB18232" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EB18232" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 9950 6200 50  0001 C CNN
F 1 "GND" H 9955 6277 50  0000 C CNN
F 2 "" H 9950 6450 50  0001 C CNN
F 3 "" H 9950 6450 50  0001 C CNN
	1    9950 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EB18238
P 9950 6350
AR Path="/5CC0D65F/5EB18238" Ref="C?"  Part="1" 
AR Path="/5EB18238" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EB18238" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EB18238" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EB18238" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EB18238" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EB18238" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5EB18238" Ref="C10"  Part="1" 
F 0 "C10" H 9859 6396 50  0000 R CNN
F 1 "100nF" H 9859 6305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 6350 50  0001 C CNN
F 3 "~" H 9950 6350 50  0001 C CNN
	1    9950 6350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G86 U19
U 2 1 5EB22516
P 10350 6200
F 0 "U19" H 10480 6096 50  0000 L CNN
F 1 "74LVC1G86" H 10480 6005 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10290 6510 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G86.pdf" H 10290 6510 50  0001 C CNN
	2    10350 6200
	1    0    0    -1  
$EndComp
Connection ~ 9950 6450
Connection ~ 9950 6250
Text Label 9550 3350 0    50   ~ 0
~SETL
Text Label 9550 3450 0    50   ~ 0
~ROMOE
$Comp
L alexios:29W010 U2
U 1 1 5EB0EF1B
P 5300 2300
AR Path="/5EB0EF1B" Ref="U2"  Part="1" 
AR Path="/5DE3C078/5EB0EF1B" Ref="U2"  Part="1" 
F 0 "U2" H 5300 3367 50  0000 C CNN
F 1 "29W010" H 5300 3276 50  0000 C CNN
F 2 "alexios:PLCC32" H 5300 2300 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 5300 2300 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 5300 2300 50  0001 C CNN "Mouser"
	1    5300 2300
	1    0    0    -1  
$EndComp
$Comp
L alexios:29W010 U3
U 1 1 5EB0FEA6
P 7950 2300
AR Path="/5EB0FEA6" Ref="U3"  Part="1" 
AR Path="/5DE3C078/5EB0FEA6" Ref="U3"  Part="1" 
F 0 "U3" H 7950 3367 50  0000 C CNN
F 1 "29W010" H 7950 3276 50  0000 C CNN
F 2 "alexios:PLCC32" H 7950 2300 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 7950 2300 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 7950 2300 50  0001 C CNN "Mouser"
	1    7950 2300
	1    0    0    -1  
$EndComp
$Comp
L alexios:29W010 U1
U 2 1 5EB11557
P 1250 7350
AR Path="/5EB11557" Ref="U1"  Part="2" 
AR Path="/5DE3C078/5EB11557" Ref="U1"  Part="2" 
F 0 "U1" H 1430 7396 50  0000 L CNN
F 1 "29W010" H 1430 7305 50  0000 L CNN
F 2 "alexios:PLCC32" H 1250 7350 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 1250 7350 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 1250 7350 50  0001 C CNN "Mouser"
	2    1250 7350
	1    0    0    -1  
$EndComp
Connection ~ 900  7450
Connection ~ 900  7250
$Comp
L alexios:29W010 U2
U 2 1 5EB39402
P 2500 7350
AR Path="/5EB39402" Ref="U2"  Part="2" 
AR Path="/5DE3C078/5EB39402" Ref="U2"  Part="2" 
F 0 "U2" H 2680 7396 50  0000 L CNN
F 1 "29W010" H 2680 7305 50  0000 L CNN
F 2 "alexios:PLCC32" H 2500 7350 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 2500 7350 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 2500 7350 50  0001 C CNN "Mouser"
	2    2500 7350
	1    0    0    -1  
$EndComp
Connection ~ 2150 7450
Connection ~ 2150 7250
$Comp
L alexios:29W010 U3
U 2 1 5EB39CC1
P 3800 7350
AR Path="/5EB39CC1" Ref="U3"  Part="2" 
AR Path="/5DE3C078/5EB39CC1" Ref="U3"  Part="2" 
F 0 "U3" H 3980 7396 50  0000 L CNN
F 1 "29W010" H 3980 7305 50  0000 L CNN
F 2 "alexios:PLCC32" H 3800 7350 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 3800 7350 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 3800 7350 50  0001 C CNN "Mouser"
	2    3800 7350
	1    0    0    -1  
$EndComp
Connection ~ 3450 7450
Connection ~ 3450 7250
$Comp
L alexios:29W010 U1
U 1 1 5EB0B6DB
P 2650 2300
AR Path="/5EB0B6DB" Ref="U1"  Part="1" 
AR Path="/5DE3C078/5EB0B6DB" Ref="U1"  Part="1" 
F 0 "U1" H 2650 3367 50  0000 C CNN
F 1 "29W010" H 2650 3276 50  0000 C CNN
F 2 "alexios:PLCC32" H 2650 2300 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 2650 2300 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 2650 2300 50  0001 C CNN "Mouser"
	1    2650 2300
	1    0    0    -1  
$EndComp
Text Notes 2200 3500 0    50   ~ 0
55ns 128K×8 NOR Flash,\nPLCC32
Wire Wire Line
	1750 2900 2100 2900
Wire Wire Line
	1750 3000 2100 3000
Wire Wire Line
	1750 3100 2100 3100
$Comp
L alexios:74AC157 U43
U 1 1 5EAD0F69
P 1800 4700
F 0 "U43" H 1800 5567 50  0000 C CNN
F 1 "74AC157" H 1800 5476 50  0000 C CNN
F 2 "alexios:SOIC-16" H 1800 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 1800 4700 50  0001 C CNN
	1    1800 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 4400 1300 4400
$Comp
L power:GND #PWR0126
U 1 1 5EB0ECEF
P 1100 4400
F 0 "#PWR0126" H 1100 4150 50  0001 C CNN
F 1 "GND" V 1105 4272 50  0000 R CNN
F 2 "" H 1100 4400 50  0001 C CNN
F 3 "" H 1100 4400 50  0001 C CNN
	1    1100 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	950  4300 1300 4300
Wire Wire Line
	950  4200 1300 4200
Wire Wire Line
	950  4100 1300 4100
Text HLabel 950  4300 0    50   Input ~ 0
RADDR2
Text HLabel 950  4200 0    50   Input ~ 0
RADDR1
Text HLabel 950  4100 0    50   Input ~ 0
RADDR0
Wire Wire Line
	1300 4550 1250 4550
Wire Wire Line
	1250 4550 1250 4000
Wire Wire Line
	1250 4550 1250 4650
Wire Wire Line
	1250 4650 1300 4650
Connection ~ 1250 4550
Wire Wire Line
	1250 4650 1250 4750
Wire Wire Line
	1250 4750 1300 4750
Connection ~ 1250 4650
$Comp
L power:+5V #PWR0158
U 1 1 5EB4E648
P 1250 4000
F 0 "#PWR0158" H 1250 3850 50  0001 C CNN
F 1 "+5V" H 1265 4173 50  0000 C CNN
F 2 "" H 1250 4000 50  0001 C CNN
F 3 "" H 1250 4000 50  0001 C CNN
	1    1250 4000
	1    0    0    -1  
$EndComp
NoConn ~ 2300 4400
Wire Wire Line
	1100 4850 1300 4850
$Comp
L power:GND #PWR0159
U 1 1 5EB5C176
P 1100 4850
F 0 "#PWR0159" H 1100 4600 50  0001 C CNN
F 1 "GND" V 1105 4722 50  0000 R CNN
F 2 "" H 1100 4850 50  0001 C CNN
F 3 "" H 1100 4850 50  0001 C CNN
	1    1100 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 4100 2500 4100
Wire Wire Line
	2300 4200 2500 4200
Wire Wire Line
	2300 4300 2500 4300
Text Label 2500 4100 2    50   ~ 0
OP0
Text Label 2500 4200 2    50   ~ 0
OP1
Text Label 2500 4300 2    50   ~ 0
OP2
$Comp
L power:GND #PWR0185
U 1 1 5EBA2096
P 1250 5150
F 0 "#PWR0185" H 1250 4900 50  0001 C CNN
F 1 "GND" H 1255 4977 50  0000 C CNN
F 2 "" H 1250 5150 50  0001 C CNN
F 3 "" H 1250 5150 50  0001 C CNN
	1    1250 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5100 1250 5100
Wire Wire Line
	1250 5100 1250 5150
Text Label 1050 5000 0    50   ~ 0
~ROMOE
$Comp
L alexios:74AC157 U43
U 2 1 5EBBBBA6
P 1250 7200
F 0 "U43" H 1430 7746 50  0000 L CNN
F 1 "74AC157" H 1430 7655 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1250 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 1250 7200 50  0001 C CNN
	2    1250 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EBBCF50
P 900 6700
AR Path="/5CC0D65F/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5EBBCF50" Ref="C49"  Part="1" 
F 0 "C49" H 809 6746 50  0000 R CNN
F 1 "100nF" H 809 6655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 6700 50  0001 C CNN
F 3 "~" H 900 6700 50  0001 C CNN
	1    900  6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBBCF56
P 900 6800
AR Path="/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBBCF56" Ref="#PWR0186"  Part="1" 
F 0 "#PWR0186" H 900 6550 50  0001 C CNN
F 1 "GND" H 905 6627 50  0000 C CNN
F 2 "" H 900 6800 50  0001 C CNN
F 3 "" H 900 6800 50  0001 C CNN
	1    900  6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EBBCF5C
P 900 6600
AR Path="/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBBCF5C" Ref="#PWR0208"  Part="1" 
F 0 "#PWR0208" H 900 6450 50  0001 C CNN
F 1 "+5V" H 915 6773 50  0000 C CNN
F 2 "" H 900 6600 50  0001 C CNN
F 3 "" H 900 6600 50  0001 C CNN
	1    900  6600
	1    0    0    -1  
$EndComp
Connection ~ 900  6600
Connection ~ 900  6800
Text Label 1750 2900 0    50   ~ 0
OP0
Text Label 1750 3000 0    50   ~ 0
OP1
Text Label 1750 3100 0    50   ~ 0
OP2
Wire Wire Line
	4400 2900 4750 2900
Wire Wire Line
	4400 3000 4750 3000
Wire Wire Line
	4400 3100 4750 3100
Text Label 4400 2900 0    50   ~ 0
OP0
Text Label 4400 3000 0    50   ~ 0
OP1
Text Label 4400 3100 0    50   ~ 0
OP2
Wire Wire Line
	7050 2900 7400 2900
Wire Wire Line
	7050 3000 7400 3000
Wire Wire Line
	7050 3100 7400 3100
Text Label 7050 2900 0    50   ~ 0
OP0
Text Label 7050 3000 0    50   ~ 0
OP1
Text Label 7050 3100 0    50   ~ 0
OP2
Wire Wire Line
	7400 1900 7350 1900
Wire Wire Line
	7350 1900 7350 2000
$Comp
L power:GND #PWR0220
U 1 1 5EC9ED08
P 7350 3250
F 0 "#PWR0220" H 7350 3000 50  0001 C CNN
F 1 "GND" H 7355 3077 50  0000 C CNN
F 2 "" H 7350 3250 50  0001 C CNN
F 3 "" H 7350 3250 50  0001 C CNN
	1    7350 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 2000 7350 2000
Connection ~ 7350 2000
Wire Wire Line
	7350 2000 7350 2500
Wire Wire Line
	7400 2500 7350 2500
Connection ~ 7350 2500
Wire Wire Line
	7350 2500 7350 2600
Wire Wire Line
	7400 2600 7350 2600
Connection ~ 7350 2600
Wire Wire Line
	7350 2600 7350 3250
Wire Wire Line
	1050 5000 1050 5500
Wire Wire Line
	1050 5000 1300 5000
Text Label 3000 5500 0    50   ~ 0
~ROMOE
Wire Wire Line
	950  5500 1050 5500
Connection ~ 1050 5500
Wire Wire Line
	1050 5500 4500 5500
Wire Bus Line
	6400 5800 10200 5800
Wire Bus Line
	950  1000 6550 1000
Wire Bus Line
	950  850  6750 850 
Wire Bus Line
	6650 1100 6650 2300
Wire Bus Line
	3900 3700 9200 3700
Wire Bus Line
	9300 1600 9300 3600
Wire Bus Line
	6850 950  6850 1700
Wire Bus Line
	1550 950  1550 1900
Wire Bus Line
	1350 1100 1350 2500
Wire Bus Line
	4200 950  4200 1900
Wire Bus Line
	4000 1100 4000 2500
Wire Bus Line
	3800 1600 3800 3600
Wire Bus Line
	6450 1600 6450 3600
Wire Bus Line
	8950 4200 8950 5700
Wire Bus Line
	7050 3800 7050 4700
Wire Bus Line
	6300 4200 6300 5700
Wire Bus Line
	4400 3800 4400 4700
Text Notes 600  4600 0    98   ~ 20
TODO: switch to 3× single OR gates?
$EndSCHEMATC
