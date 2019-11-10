EESchema Schematic File Version 4
LIBS:cft-alu-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
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
Wire Wire Line
	2100 2900 950  2900
Wire Wire Line
	2100 3000 950  3000
$Comp
L power:GND #PWR?
U 1 1 5E195CBC
P 1650 3350
AR Path="/5DC89E19/5E195CBC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CBC" Ref="#PWR066"  Part="1" 
AR Path="/5DE3C078/5E195CBC" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 1650 3100 50  0001 C CNN
F 1 "GND" H 1655 3177 50  0000 C CNN
F 2 "" H 1650 3350 50  0001 C CNN
F 3 "" H 1650 3350 50  0001 C CNN
	1    1650 3350
	1    0    0    -1  
$EndComp
Text Label 1750 2700 0    50   ~ 0
FL-IN
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
AR Path="/5DC89E19/5E18A3E1/5E195CE2" Ref="#PWR063"  Part="1" 
AR Path="/5DE3C078/5E195CE2" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 3200 2450 50  0001 C CNN
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
AR Path="/5DC89E19/5E18A3E1/5E195D24" Ref="#PWR064"  Part="1" 
AR Path="/5DE3C078/5E195D24" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 5850 2450 50  0001 C CNN
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
$Comp
L alexios:29W040 U?
U 1 1 5E195D45
P 7950 2300
AR Path="/5DC89E19/5E195D45" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D45" Ref="U36"  Part="1" 
AR Path="/5DE3C078/5E195D45" Ref="U5"  Part="1" 
F 0 "U5" H 7950 3367 50  0000 C CNN
F 1 "29W040" H 7950 3276 50  0000 C CNN
F 2 "alexios:PLCC32" H 7950 2300 50  0001 C CNN
F 3 "" H 7950 2300 50  0001 C CNN
	1    7950 2300
	1    0    0    -1  
$EndComp
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
AR Path="/5DC89E19/5E18A3E1/5E195D70" Ref="#PWR065"  Part="1" 
AR Path="/5DE3C078/5E195D70" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 8500 2450 50  0001 C CNN
F 1 "+5V" V 8600 2600 50  0000 L CNN
F 2 "" H 8500 2600 50  0001 C CNN
F 3 "" H 8500 2600 50  0001 C CNN
	1    8500 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 2100 6300 2300
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
Text Label 1300 5500 0    50   ~ 0
~OE
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
	6650 1800 6750 1900
Entry Wire Line
	6650 1900 6750 2000
Entry Wire Line
	6650 2000 6750 2100
Entry Wire Line
	6650 2100 6750 2200
Wire Wire Line
	6750 1900 7400 1900
Wire Wire Line
	6750 2000 7400 2000
Wire Wire Line
	6750 2100 7400 2100
Wire Wire Line
	6750 2200 7400 2200
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
Text HLabel 1350 850  0    50   Input ~ 0
A[0..15]
Text HLabel 10200 5800 2    50   3State ~ 0
IBUS[0..15]
Entry Bus Bus
	9200 3700 9300 3600
Entry Bus Bus
	6450 3600 6550 3700
Entry Bus Bus
	3800 3600 3900 3700
Text Label 1450 850  0    50   ~ 0
A[0..15]
Text Label 2900 850  0    50   ~ 0
A[0..15]
Text Label 5550 850  0    50   ~ 0
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
Text Label 9300 3400 1    50   ~ 0
Y[0..15]
Text Label 4500 3700 0    50   ~ 0
Y[0..15]
Text Label 8200 3700 0    50   ~ 0
Y[0..15]
Text HLabel 950  2700 0    50   Input ~ 0
FL-IN
$Comp
L alexios:29W040 U?
U 1 1 5E195CA5
P 2650 2300
AR Path="/5DC89E19/5E195CA5" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CA5" Ref="U34"  Part="1" 
AR Path="/5DE3C078/5E195CA5" Ref="U3"  Part="1" 
F 0 "U3" H 2650 3367 50  0000 C CNN
F 1 "29W040" H 2650 3276 50  0000 C CNN
F 2 "alexios:PLCC32" H 2650 2300 50  0001 C CNN
F 3 "" H 2650 2300 50  0001 C CNN
	1    2650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3100 2100 3100
Text Label 1750 2900 0    50   ~ 0
OP0
Text Label 1750 3000 0    50   ~ 0
OP1
Text Label 1750 3100 0    50   ~ 0
OP2
Wire Wire Line
	4750 2900 4400 2900
Wire Wire Line
	4750 3000 4400 3000
Wire Wire Line
	4750 3100 4400 3100
Text Label 4400 2900 0    50   ~ 0
OP0
Text Label 4400 3000 0    50   ~ 0
OP1
Text Label 4400 3100 0    50   ~ 0
OP2
Wire Wire Line
	7400 2500 7050 2500
Wire Wire Line
	7400 2600 7050 2600
Wire Wire Line
	7400 2700 7050 2700
Text Label 7050 2500 0    50   ~ 0
OP0
Text Label 7050 2600 0    50   ~ 0
OP1
Text Label 7050 2700 0    50   ~ 0
OP2
Text HLabel 950  2900 0    50   Input ~ 0
OP0
Text HLabel 950  3000 0    50   Input ~ 0
OP1
Text HLabel 950  3100 0    50   Input ~ 0
OP2
Text HLabel 1100 5500 0    50   Input ~ 0
~OE
Wire Wire Line
	5850 2200 6200 2200
Text Label 6200 2200 2    50   ~ 0
X1
Text HLabel 9850 2400 2    50   Output ~ 0
X1
Text Label 3250 2200 0    50   ~ 0
X0
Text HLabel 9850 2300 2    50   Output ~ 0
X0
Wire Wire Line
	9850 2300 9550 2300
Wire Wire Line
	9850 2400 9550 2400
Text Label 9550 2300 0    50   ~ 0
X0
Text Label 9550 2400 0    50   ~ 0
X1
Wire Wire Line
	8500 2200 8800 2200
$Comp
L alexios:29W040 U?
U 2 1 5E426152
P 1250 7350
AR Path="/5DC89E19/5E426152" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E426152" Ref="U34"  Part="2" 
AR Path="/5DE3C078/5E426152" Ref="U3"  Part="2" 
F 0 "U3" H 1430 7396 50  0000 L CNN
F 1 "29W040" H 1430 7305 50  0000 L CNN
F 2 "alexios:PLCC32" H 1250 7350 50  0001 C CNN
F 3 "" H 1250 7350 50  0001 C CNN
	2    1250 7350
	1    0    0    -1  
$EndComp
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
AR Path="/5DC89E19/5E18A3E1/5E42E1EE" Ref="C23"  Part="1" 
AR Path="/5DE3C078/5E42E1EE" Ref="C3"  Part="1" 
F 0 "C3" H 809 7396 50  0000 R CNN
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
AR Path="/5DC89E19/5E18A3E1/5E42E1F4" Ref="#PWR072"  Part="1" 
AR Path="/5DE3C078/5E42E1F4" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 900 7200 50  0001 C CNN
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
AR Path="/5DC89E19/5E18A3E1/5E42E1FA" Ref="#PWR069"  Part="1" 
AR Path="/5DE3C078/5E42E1FA" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 900 7100 50  0001 C CNN
F 1 "+5V" H 915 7423 50  0000 C CNN
F 2 "" H 900 7250 50  0001 C CNN
F 3 "" H 900 7250 50  0001 C CNN
	1    900  7250
	1    0    0    -1  
$EndComp
Connection ~ 900  7450
Connection ~ 900  7250
$Comp
L alexios:29W040 U?
U 2 1 5E434AC0
P 2500 7350
AR Path="/5DC89E19/5E434AC0" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E434AC0" Ref="U35"  Part="2" 
AR Path="/5DE3C078/5E434AC0" Ref="U4"  Part="2" 
F 0 "U4" H 2680 7396 50  0000 L CNN
F 1 "29W040" H 2680 7305 50  0000 L CNN
F 2 "alexios:PLCC32" H 2500 7350 50  0001 C CNN
F 3 "" H 2500 7350 50  0001 C CNN
	2    2500 7350
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
AR Path="/5DC89E19/5E18A3E1/5E434AC6" Ref="C24"  Part="1" 
AR Path="/5DE3C078/5E434AC6" Ref="C4"  Part="1" 
F 0 "C4" H 2059 7396 50  0000 R CNN
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
AR Path="/5DC89E19/5E18A3E1/5E434ACC" Ref="#PWR073"  Part="1" 
AR Path="/5DE3C078/5E434ACC" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 2150 7200 50  0001 C CNN
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
AR Path="/5DC89E19/5E18A3E1/5E434AD2" Ref="#PWR070"  Part="1" 
AR Path="/5DE3C078/5E434AD2" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 2150 7100 50  0001 C CNN
F 1 "+5V" H 2165 7423 50  0000 C CNN
F 2 "" H 2150 7250 50  0001 C CNN
F 3 "" H 2150 7250 50  0001 C CNN
	1    2150 7250
	1    0    0    -1  
$EndComp
Connection ~ 2150 7450
Connection ~ 2150 7250
$Comp
L alexios:29W040 U?
U 2 1 5E43A76F
P 3800 7350
AR Path="/5DC89E19/5E43A76F" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E43A76F" Ref="U36"  Part="2" 
AR Path="/5DE3C078/5E43A76F" Ref="U5"  Part="2" 
F 0 "U5" H 3980 7396 50  0000 L CNN
F 1 "29W040" H 3980 7305 50  0000 L CNN
F 2 "alexios:PLCC32" H 3800 7350 50  0001 C CNN
F 3 "" H 3800 7350 50  0001 C CNN
	2    3800 7350
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
AR Path="/5DC89E19/5E18A3E1/5E43A775" Ref="C25"  Part="1" 
AR Path="/5DE3C078/5E43A775" Ref="C5"  Part="1" 
F 0 "C5" H 3359 7396 50  0000 R CNN
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
AR Path="/5DC89E19/5E18A3E1/5E43A77B" Ref="#PWR074"  Part="1" 
AR Path="/5DE3C078/5E43A77B" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 3450 7200 50  0001 C CNN
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
AR Path="/5DC89E19/5E18A3E1/5E43A781" Ref="#PWR071"  Part="1" 
AR Path="/5DE3C078/5E43A781" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 3450 7100 50  0001 C CNN
F 1 "+5V" H 3465 7423 50  0000 C CNN
F 2 "" H 3450 7250 50  0001 C CNN
F 3 "" H 3450 7250 50  0001 C CNN
	1    3450 7250
	1    0    0    -1  
$EndComp
Connection ~ 3450 7450
Connection ~ 3450 7250
$Comp
L alexios:29W040 U?
U 1 1 5E195CF4
P 5300 2300
AR Path="/5DC89E19/5E195CF4" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CF4" Ref="U35"  Part="1" 
AR Path="/5DE3C078/5E195CF4" Ref="U4"  Part="1" 
F 0 "U4" H 5300 3367 50  0000 C CNN
F 1 "29W040" H 5300 3276 50  0000 C CNN
F 2 "alexios:PLCC32" H 5300 2300 50  0001 C CNN
F 3 "" H 5300 2300 50  0001 C CNN
	1    5300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2800 3550 2800
Wire Wire Line
	3550 2800 3550 2200
Wire Wire Line
	3200 2200 3550 2200
Wire Wire Line
	6200 2200 6200 2400
Text Label 4400 2800 0    50   ~ 0
X0
Text Label 7050 2400 0    50   ~ 0
X1
Wire Wire Line
	8800 2200 8800 2800
Wire Wire Line
	8900 2100 8900 2700
Wire Wire Line
	8500 2100 8900 2100
Wire Wire Line
	9000 2000 9000 2600
Wire Wire Line
	8500 2000 9000 2000
Wire Wire Line
	9100 1900 9100 2500
Text Label 9800 2500 2    50   ~ 0
FVOUT
Text HLabel 9850 2500 2    50   Output ~ 0
FVOUT
Text HLabel 9850 2600 2    50   Output ~ 0
~SETV
Text HLabel 9850 2700 2    50   Output ~ 0
FLOUT
Text HLabel 9850 2800 2    50   Output ~ 0
~SETL
Text Label 9800 2600 2    50   ~ 0
~SETV
Text Label 9800 2700 2    50   ~ 0
FLOUT
Text Label 9800 2800 2    50   ~ 0
~SETL
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
Text Label 7050 2300 0    50   ~ 0
C1
Text Label 7050 1500 0    50   ~ 0
A12
Text Label 7050 1600 0    50   ~ 0
A13
Text Label 7050 1700 0    50   ~ 0
A14
Text Label 7050 1800 0    50   ~ 0
A15
Text Label 7050 1900 0    50   ~ 0
B12
Text Label 7050 2000 0    50   ~ 0
B13
Text Label 7050 2100 0    50   ~ 0
B14
Text Label 7050 2200 0    50   ~ 0
B15
$Comp
L alexios:74HC541 U34
U 1 1 5DC85DD2
P 5250 4600
F 0 "U34" H 5250 5367 50  0000 C CNN
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
L power:GND #PWR0109
U 1 1 5DCA6050
P 4750 5100
F 0 "#PWR0109" H 4750 4850 50  0001 C CNN
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
AR Path="/5DE3C078/5DCAB563" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 8550 2250 50  0001 C CNN
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
AR Path="/5DE3C078/5DCB7239" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 5900 2250 50  0001 C CNN
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
AR Path="/5DE3C078/5DCBCB79" Ref="#PWR0177"  Part="1" 
F 0 "#PWR0177" H 3250 2250 50  0001 C CNN
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
~OE
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
L alexios:74HC541 U35
U 1 1 5DCDF731
P 7900 4600
F 0 "U35" H 7900 5367 50  0000 C CNN
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
L power:GND #PWR0178
U 1 1 5DCDF750
P 7400 5100
F 0 "#PWR0178" H 7400 4850 50  0001 C CNN
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
~OE
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
	6200 2400 7400 2400
Wire Wire Line
	6300 2300 7400 2300
Wire Wire Line
	8800 2800 9850 2800
Wire Wire Line
	8900 2700 9850 2700
Wire Wire Line
	9000 2600 9850 2600
Wire Wire Line
	9100 2500 9850 2500
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
Wire Wire Line
	1100 5500 4500 5500
Connection ~ 4500 5500
$Comp
L alexios:74HC541 U34
U 2 1 5E1F00D4
P 5050 7350
F 0 "U34" H 5229 7396 50  0000 L CNN
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
AR Path="/5DE3C078/5E1F0362" Ref="C24"  Part="1" 
F 0 "C24" H 4609 7396 50  0000 R CNN
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
AR Path="/5DE3C078/5E1F0369" Ref="#PWR0179"  Part="1" 
F 0 "#PWR0179" H 4700 7200 50  0001 C CNN
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
AR Path="/5DE3C078/5E1F036F" Ref="#PWR0180"  Part="1" 
F 0 "#PWR0180" H 4700 7100 50  0001 C CNN
F 1 "+5V" H 4715 7423 50  0000 C CNN
F 2 "" H 4700 7250 50  0001 C CNN
F 3 "" H 4700 7250 50  0001 C CNN
	1    4700 7250
	1    0    0    -1  
$EndComp
Connection ~ 4700 7450
Connection ~ 4700 7250
$Comp
L alexios:74HC541 U35
U 2 1 5E1F9603
P 6350 7350
F 0 "U35" H 6529 7396 50  0000 L CNN
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
AR Path="/5DE3C078/5E1F960A" Ref="C25"  Part="1" 
F 0 "C25" H 5909 7396 50  0000 R CNN
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
AR Path="/5DE3C078/5E1F9611" Ref="#PWR0181"  Part="1" 
F 0 "#PWR0181" H 6000 7200 50  0001 C CNN
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
AR Path="/5DE3C078/5E1F9617" Ref="#PWR0182"  Part="1" 
F 0 "#PWR0182" H 6000 7100 50  0001 C CNN
F 1 "+5V" H 6015 7423 50  0000 C CNN
F 2 "" H 6000 7250 50  0001 C CNN
F 3 "" H 6000 7250 50  0001 C CNN
	1    6000 7250
	1    0    0    -1  
$EndComp
Connection ~ 6000 7450
Connection ~ 6000 7250
Text Notes 900  4450 0    66   ~ 13
Tri-Stating
Text Notes 900  5050 0    50   ~ 0
The ROMs can't be tri-stated because they feed into each other, and we need\nto keep the cascade as fast as possible and allow it to run for longer than a\nprocessor cycle, if needed. The Control Unit forcibly tri-states every IBus\ndriver for part of the cycle, so we use external buffers and the ROM's own\nsignals (plus output control signals that shouldn't ever be tri-stated anyway)\ncan stay driven.
Wire Notes Line width 20 style solid
	800  4250 800  5200
Wire Notes Line width 20 style solid
	4050 4250 800  4250
Wire Notes Line width 20 style solid
	4050 5200 4050 4250
Wire Notes Line width 20 style solid
	800  5200 4050 5200
Text Label 8550 2000 0    50   ~ 0
~SETV
Text Label 8550 2200 0    50   ~ 0
~SETL
Wire Wire Line
	1700 3200 1650 3200
Wire Wire Line
	1650 3200 1650 3300
Wire Wire Line
	1700 3300 1650 3300
Connection ~ 1650 3300
Wire Wire Line
	1650 3300 1650 3350
Wire Wire Line
	2000 3200 2100 3200
Wire Wire Line
	2000 3300 2100 3300
$Comp
L power:GND #PWR?
U 1 1 5DC6A9F1
P 4400 3350
AR Path="/5DC89E19/5DC6A9F1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5DC6A9F1" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5DC6A9F1" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 4400 3100 50  0001 C CNN
F 1 "GND" H 4405 3177 50  0000 C CNN
F 2 "" H 4400 3350 50  0001 C CNN
F 3 "" H 4400 3350 50  0001 C CNN
	1    4400 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3200 4400 3200
Wire Wire Line
	4400 3200 4400 3300
Wire Wire Line
	4450 3300 4400 3300
Connection ~ 4400 3300
Wire Wire Line
	4400 3300 4400 3350
$Comp
L power:GND #PWR?
U 1 1 5DC750E4
P 7050 3350
AR Path="/5DC89E19/5DC750E4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5DC750E4" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5DC750E4" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 7050 3100 50  0001 C CNN
F 1 "GND" H 7055 3177 50  0000 C CNN
F 2 "" H 7050 3350 50  0001 C CNN
F 3 "" H 7050 3350 50  0001 C CNN
	1    7050 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3200 7050 3200
Wire Wire Line
	7050 3200 7050 3300
Wire Wire Line
	7100 3300 7050 3300
Connection ~ 7050 3300
Wire Wire Line
	7050 3300 7050 3350
Wire Wire Line
	7050 3200 7050 3100
Wire Wire Line
	7050 2800 7100 2800
Connection ~ 7050 3200
Wire Wire Line
	7100 2900 7050 2900
Connection ~ 7050 2900
Wire Wire Line
	7050 2900 7050 2800
Wire Wire Line
	7100 3000 7050 3000
Connection ~ 7050 3000
Wire Wire Line
	7050 3000 7050 2900
Wire Wire Line
	7100 3100 7050 3100
Connection ~ 7050 3100
Wire Wire Line
	7050 3100 7050 3000
Text Notes 850  4000 0    50   ~ 0
X-IN is reserved for future expansion, but wired to allow this. It can be\ncascaded like carry using X0 and X1, or independent of them.\n\nLikewise, the solder jumpers are for future expansion:\ncut the trace to disconnect from ground, patch to another signal.
$Comp
L Jumper:SolderJumper_2_Bridged JP6
U 1 1 5DD4B079
P 1850 3300
F 0 "JP6" H 1600 3300 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 1850 3414 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 1850 3300 50  0001 C CNN
F 3 "~" H 1850 3300 50  0001 C CNN
	1    1850 3300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP7
U 1 1 5DD4B2B6
P 4600 3200
F 0 "JP7" H 4350 3200 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 4600 3314 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4600 3200 50  0001 C CNN
F 3 "~" H 4600 3200 50  0001 C CNN
	1    4600 3200
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP8
U 1 1 5DD4B50E
P 4600 3300
F 0 "JP8" H 4350 3300 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 4600 3414 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4600 3300 50  0001 C CNN
F 3 "~" H 4600 3300 50  0001 C CNN
	1    4600 3300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP9
U 1 1 5DD4D377
P 7250 2800
F 0 "JP9" H 7000 2800 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 7250 2914 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7250 2800 50  0001 C CNN
F 3 "~" H 7250 2800 50  0001 C CNN
	1    7250 2800
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP10
U 1 1 5DD4D37D
P 7250 2900
F 0 "JP10" H 7000 2900 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 7250 3014 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7250 2900 50  0001 C CNN
F 3 "~" H 7250 2900 50  0001 C CNN
	1    7250 2900
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP11
U 1 1 5DD574F3
P 7250 3000
F 0 "JP11" H 7000 3000 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 7250 3114 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7250 3000 50  0001 C CNN
F 3 "~" H 7250 3000 50  0001 C CNN
	1    7250 3000
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP12
U 1 1 5DD574F9
P 7250 3100
F 0 "JP12" H 7000 3100 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 7250 3214 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7250 3100 50  0001 C CNN
F 3 "~" H 7250 3100 50  0001 C CNN
	1    7250 3100
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP13
U 1 1 5DD61519
P 7250 3200
F 0 "JP13" H 7000 3200 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 7250 3314 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7250 3200 50  0001 C CNN
F 3 "~" H 7250 3200 50  0001 C CNN
	1    7250 3200
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP14
U 1 1 5DD6151F
P 7250 3300
F 0 "JP14" H 7000 3300 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 7250 3414 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7250 3300 50  0001 C CNN
F 3 "~" H 7250 3300 50  0001 C CNN
	1    7250 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  2800 2100 2800
$Comp
L Jumper:SolderJumper_2_Bridged JP5
U 1 1 5DC249EA
P 1850 3200
F 0 "JP5" H 1600 3200 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 1850 3314 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 1850 3200 50  0001 C CNN
F 3 "~" H 1850 3200 50  0001 C CNN
	1    1850 3200
	1    0    0    -1  
$EndComp
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
Wire Bus Line
	6400 5800 10200 5800
Wire Bus Line
	950  1000 6550 1000
Wire Bus Line
	1350 850  6750 850 
Wire Bus Line
	6850 950  6850 1700
Wire Bus Line
	6650 1100 6650 2100
Wire Bus Line
	9300 1600 9300 3600
Wire Bus Line
	3900 3700 9200 3700
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
	4400 3800 4400 4700
Wire Bus Line
	6300 4200 6300 5700
Wire Bus Line
	7050 3800 7050 4700
Wire Bus Line
	8950 4200 8950 5700
$EndSCHEMATC
