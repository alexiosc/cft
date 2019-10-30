EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 22 35
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
	2500 2800 2050 2800
Wire Wire Line
	2500 2900 2050 2900
Wire Wire Line
	2500 3000 2050 3000
Wire Wire Line
	2500 3100 2050 3100
Wire Wire Line
	2500 3200 2050 3200
Wire Wire Line
	2500 3300 2050 3300
Wire Wire Line
	2500 3400 1850 3400
Wire Wire Line
	2500 3500 1850 3500
Wire Wire Line
	2500 3600 1850 3600
Wire Wire Line
	2500 3700 1850 3700
Wire Wire Line
	2500 3800 1850 3800
Wire Wire Line
	2500 3900 1850 3900
Wire Wire Line
	2500 4000 1100 4000
Wire Wire Line
	2500 4100 1100 4100
Wire Wire Line
	2500 4200 1100 4200
$Comp
L power:GND #PWR?
U 1 1 5E195CBC
P 2450 4650
AR Path="/5DC89E19/5E195CBC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CBC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 4400 50  0001 C CNN
F 1 "GND" H 2455 4477 50  0000 C CNN
F 2 "" H 2450 4650 50  0001 C CNN
F 3 "" H 2450 4650 50  0001 C CNN
	1    2450 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4400 2450 4400
Wire Wire Line
	2500 4500 2450 4500
Wire Wire Line
	2450 4500 2450 4600
Wire Wire Line
	2500 4600 2450 4600
Connection ~ 2450 4600
Wire Wire Line
	2450 4600 2450 4650
Text Label 2050 2800 0    50   ~ 0
B0
Text Label 2050 2900 0    50   ~ 0
B1
Text Label 2050 3000 0    50   ~ 0
B2
Text Label 2050 3100 0    50   ~ 0
B3
Text Label 2050 3200 0    50   ~ 0
B4
Text Label 2050 3300 0    50   ~ 0
B5
Text Label 1850 3400 0    50   ~ 0
A0
Text Label 1850 3500 0    50   ~ 0
A1
Text Label 1850 3600 0    50   ~ 0
A2
Text Label 1850 3700 0    50   ~ 0
A3
Text Label 1850 3800 0    50   ~ 0
A4
Text Label 1850 3900 0    50   ~ 0
A5
Text Label 1250 4000 0    50   ~ 0
FL-IN
Wire Wire Line
	3600 2800 4100 2800
Wire Wire Line
	3600 2900 4100 2900
Wire Wire Line
	3600 3000 4100 3000
Wire Wire Line
	3600 3100 4100 3100
Wire Wire Line
	3600 3200 4100 3200
Wire Wire Line
	3600 3300 4100 3300
Text Label 3900 3400 2    50   ~ 0
CO1
$Comp
L power:+5V #PWR?
U 1 1 5E195CE2
P 3600 3900
AR Path="/5DC89E19/5E195CE2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CE2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 3750 50  0001 C CNN
F 1 "+5V" V 3700 3900 50  0000 L CNN
F 2 "" H 3600 3900 50  0001 C CNN
F 3 "" H 3600 3900 50  0001 C CNN
	1    3600 3900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E195CE8
P 3600 3700
AR Path="/5DC89E19/5E195CE8" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CE8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 3450 50  0001 C CNN
F 1 "GND" V 3605 3572 50  0000 R CNN
F 2 "" H 3600 3700 50  0001 C CNN
F 3 "" H 3600 3700 50  0001 C CNN
	1    3600 3700
	0    -1   -1   0   
$EndComp
Text Label 3900 2800 2    50   ~ 0
IBUS0
Text Label 3900 2900 2    50   ~ 0
IBUS1
Text Label 3900 3000 2    50   ~ 0
IBUS2
Text Label 3900 3100 2    50   ~ 0
IBUS3
Text Label 3900 3200 2    50   ~ 0
IBUS4
Text Label 3900 3300 2    50   ~ 0
IBUS5
$Comp
L alexios:29W040 U?
U 1 1 5E195CF4
P 5900 3600
AR Path="/5DC89E19/5E195CF4" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CF4" Ref="U?"  Part="1" 
F 0 "U?" H 5900 4667 50  0000 C CNN
F 1 "29W040" H 5900 4576 50  0000 C CNN
F 2 "" H 5900 3600 50  0001 C CNN
F 3 "" H 5900 3600 50  0001 C CNN
	1    5900 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2800 4900 2800
Wire Wire Line
	5350 2900 4900 2900
Wire Wire Line
	5350 3000 4900 3000
Wire Wire Line
	5350 3100 4900 3100
Wire Wire Line
	5350 3200 4900 3200
Wire Wire Line
	5350 3300 4900 3300
$Comp
L power:GND #PWR?
U 1 1 5E195D0A
P 5300 4650
AR Path="/5DC89E19/5E195D0A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D0A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5300 4400 50  0001 C CNN
F 1 "GND" H 5305 4477 50  0000 C CNN
F 2 "" H 5300 4650 50  0001 C CNN
F 3 "" H 5300 4650 50  0001 C CNN
	1    5300 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4400 5300 4400
Wire Wire Line
	5300 4400 5300 4500
Wire Wire Line
	5350 4500 5300 4500
Connection ~ 5300 4500
Wire Wire Line
	5300 4500 5300 4600
Wire Wire Line
	5350 4600 5300 4600
Connection ~ 5300 4600
Wire Wire Line
	5300 4600 5300 4650
Text Label 4900 4000 0    50   ~ 0
CO1
Wire Wire Line
	6450 2800 6950 2800
Wire Wire Line
	6450 2900 6950 2900
Wire Wire Line
	6450 3000 6950 3000
Wire Wire Line
	6450 3100 6950 3100
Wire Wire Line
	6450 3200 6950 3200
Wire Wire Line
	6450 3300 6950 3300
Text Label 6800 3400 2    50   ~ 0
CO2
$Comp
L power:+5V #PWR?
U 1 1 5E195D24
P 6450 3900
AR Path="/5DC89E19/5E195D24" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D24" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6450 3750 50  0001 C CNN
F 1 "+5V" V 6600 3850 50  0000 L CNN
F 2 "" H 6450 3900 50  0001 C CNN
F 3 "" H 6450 3900 50  0001 C CNN
	1    6450 3900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E195D2A
P 6450 3700
AR Path="/5DC89E19/5E195D2A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D2A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6450 3450 50  0001 C CNN
F 1 "GND" V 6455 3572 50  0000 R CNN
F 2 "" H 6450 3700 50  0001 C CNN
F 3 "" H 6450 3700 50  0001 C CNN
	1    6450 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 3400 4050 4000
Wire Wire Line
	3600 3400 4050 3400
Wire Wire Line
	4050 4000 5350 4000
Text Label 6800 2800 2    50   ~ 0
IBUS6
Text Label 6800 2900 2    50   ~ 0
IBUS7
Text Label 6800 3000 2    50   ~ 0
IBUS8
Text Label 6800 3100 2    50   ~ 0
IBUS9
Text Label 6800 3200 2    50   ~ 0
IBUS10
Text Label 6800 3300 2    50   ~ 0
IBUS11
Text Label 4900 2800 0    50   ~ 0
B6
Text Label 4900 2900 0    50   ~ 0
B7
Text Label 4900 3000 0    50   ~ 0
B8
Text Label 4900 3100 0    50   ~ 0
B9
Text Label 4900 3200 0    50   ~ 0
B10
Text Label 4900 3300 0    50   ~ 0
B11
Text Label 4900 3400 0    50   ~ 0
A6
Text Label 4900 3500 0    50   ~ 0
A7
Text Label 4900 3600 0    50   ~ 0
A8
Text Label 4900 3700 0    50   ~ 0
A9
Text Label 4900 3800 0    50   ~ 0
A10
Text Label 4900 3900 0    50   ~ 0
A11
$Comp
L alexios:29W040 U?
U 1 1 5E195D45
P 8750 3600
AR Path="/5DC89E19/5E195D45" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D45" Ref="U?"  Part="1" 
F 0 "U?" H 8750 4667 50  0000 C CNN
F 1 "29W040" H 8750 4576 50  0000 C CNN
F 2 "" H 8750 3600 50  0001 C CNN
F 3 "" H 8750 3600 50  0001 C CNN
	1    8750 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2800 7750 2800
Wire Wire Line
	8200 2900 7750 2900
Wire Wire Line
	8200 3000 7750 3000
Wire Wire Line
	8200 3100 7750 3100
Wire Wire Line
	8200 4300 8150 4300
Wire Wire Line
	8150 4300 8150 4400
$Comp
L power:GND #PWR?
U 1 1 5E195D57
P 8150 4650
AR Path="/5DC89E19/5E195D57" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D57" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8150 4400 50  0001 C CNN
F 1 "GND" H 8155 4477 50  0000 C CNN
F 2 "" H 8150 4650 50  0001 C CNN
F 3 "" H 8150 4650 50  0001 C CNN
	1    8150 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4400 8150 4400
Connection ~ 8150 4400
Wire Wire Line
	8150 4400 8150 4500
Wire Wire Line
	8200 4500 8150 4500
Connection ~ 8150 4500
Wire Wire Line
	8150 4500 8150 4600
Wire Wire Line
	8200 4600 8150 4600
Connection ~ 8150 4600
Wire Wire Line
	8150 4600 8150 4650
Text Label 7750 3600 0    50   ~ 0
CO2
Wire Wire Line
	9300 2800 9800 2800
Wire Wire Line
	9300 2900 9800 2900
Wire Wire Line
	9300 3000 9800 3000
Wire Wire Line
	9300 3100 9800 3100
$Comp
L power:+5V #PWR?
U 1 1 5E195D70
P 9300 3900
AR Path="/5DC89E19/5E195D70" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D70" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9300 3750 50  0001 C CNN
F 1 "+5V" V 9400 3900 50  0000 L CNN
F 2 "" H 9300 3900 50  0001 C CNN
F 3 "" H 9300 3900 50  0001 C CNN
	1    9300 3900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E195D76
P 9300 3700
AR Path="/5DC89E19/5E195D76" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D76" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9300 3450 50  0001 C CNN
F 1 "GND" V 9305 3572 50  0000 R CNN
F 2 "" H 9300 3700 50  0001 C CNN
F 3 "" H 9300 3700 50  0001 C CNN
	1    9300 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6900 3400 6900 3600
Wire Wire Line
	6900 3600 8200 3600
Wire Wire Line
	6450 3400 6900 3400
Text Label 7750 2800 0    50   ~ 0
B12
Text Label 7750 2900 0    50   ~ 0
B13
Text Label 7750 3000 0    50   ~ 0
B14
Text Label 7750 3100 0    50   ~ 0
B15
Text Label 7750 3200 0    50   ~ 0
A12
Text Label 7750 3300 0    50   ~ 0
A13
Text Label 7750 3400 0    50   ~ 0
A14
Text Label 7750 3500 0    50   ~ 0
A15
Wire Wire Line
	8200 4000 8150 4000
Wire Wire Line
	8150 4000 8150 4100
Wire Wire Line
	8200 4100 8150 4100
Connection ~ 8150 4100
Wire Wire Line
	8150 4100 8150 4200
Connection ~ 8150 4300
Wire Wire Line
	8200 4200 8150 4200
Connection ~ 8150 4200
Wire Wire Line
	8150 4200 8150 4300
Text Label 9650 2800 2    50   ~ 0
IBUS12
Text Label 9650 2900 2    50   ~ 0
IBUS13
Text Label 9650 3000 2    50   ~ 0
IBUS14
Text Label 9650 3100 2    50   ~ 0
IBUS15
Wire Wire Line
	3600 3800 3800 3800
Wire Wire Line
	3800 3800 3800 5000
Wire Wire Line
	6450 3800 6650 3800
Wire Wire Line
	6650 3800 6650 5000
Wire Wire Line
	6650 5000 3800 5000
Wire Wire Line
	9300 3800 9500 3800
Wire Wire Line
	9500 3800 9500 5000
Wire Wire Line
	9500 5000 6650 5000
Connection ~ 6650 5000
Connection ~ 3800 5000
Text Label 1250 5000 0    50   ~ 0
~ROMCE
Entry Wire Line
	1950 2700 2050 2800
Entry Wire Line
	1950 2800 2050 2900
Entry Wire Line
	1950 2900 2050 3000
Entry Wire Line
	1950 3000 2050 3100
Entry Wire Line
	1950 3100 2050 3200
Entry Wire Line
	1950 3200 2050 3300
Entry Wire Line
	1750 3300 1850 3400
Entry Wire Line
	1750 3400 1850 3500
Entry Wire Line
	1750 3500 1850 3600
Entry Wire Line
	1750 3600 1850 3700
Entry Wire Line
	1750 3700 1850 3800
Entry Wire Line
	1750 3800 1850 3900
Entry Wire Line
	4800 2700 4900 2800
Entry Wire Line
	4800 2800 4900 2900
Entry Wire Line
	4800 2900 4900 3000
Entry Wire Line
	4800 3000 4900 3100
Entry Wire Line
	4800 3100 4900 3200
Entry Wire Line
	4800 3200 4900 3300
Entry Wire Line
	7650 2700 7750 2800
Entry Wire Line
	7650 2800 7750 2900
Entry Wire Line
	7650 2900 7750 3000
Entry Wire Line
	7650 3000 7750 3100
Entry Wire Line
	4600 3300 4700 3400
Entry Wire Line
	4600 3400 4700 3500
Entry Wire Line
	4600 3500 4700 3600
Entry Wire Line
	4600 3600 4700 3700
Entry Wire Line
	4600 3700 4700 3800
Entry Wire Line
	4600 3800 4700 3900
Wire Wire Line
	4700 3400 5350 3400
Wire Wire Line
	4700 3500 5350 3500
Wire Wire Line
	4700 3600 5350 3600
Wire Wire Line
	4700 3700 5350 3700
Wire Wire Line
	4700 3800 5350 3800
Wire Wire Line
	4700 3900 5350 3900
Entry Wire Line
	7450 3100 7550 3200
Entry Wire Line
	7450 3200 7550 3300
Entry Wire Line
	7450 3300 7550 3400
Entry Wire Line
	7450 3400 7550 3500
Wire Wire Line
	7550 3200 8200 3200
Wire Wire Line
	7550 3300 8200 3300
Wire Wire Line
	7550 3400 8200 3400
Wire Wire Line
	7550 3500 8200 3500
Entry Bus Bus
	1650 2300 1750 2400
Entry Bus Bus
	1850 2150 1950 2250
Entry Bus Bus
	4500 2300 4600 2400
Entry Bus Bus
	7350 2300 7450 2400
Entry Wire Line
	4100 2800 4200 2900
Entry Wire Line
	4100 2900 4200 3000
Entry Wire Line
	4100 3000 4200 3100
Entry Wire Line
	4100 3100 4200 3200
Entry Wire Line
	4100 3200 4200 3300
Entry Wire Line
	4100 3300 4200 3400
Entry Wire Line
	6950 2800 7050 2900
Entry Wire Line
	6950 2900 7050 3000
Entry Wire Line
	6950 3000 7050 3100
Entry Wire Line
	6950 3100 7050 3200
Entry Wire Line
	6950 3200 7050 3300
Entry Wire Line
	6950 3300 7050 3400
Entry Wire Line
	9800 2800 9900 2900
Entry Wire Line
	9800 2900 9900 3000
Entry Wire Line
	9800 3000 9900 3100
Entry Wire Line
	9800 3100 9900 3200
Entry Bus Bus
	4700 2150 4800 2250
Entry Bus Bus
	7550 2150 7650 2250
Wire Bus Line
	1100 2300 1650 2300
Entry Bus Bus
	1750 2400 1850 2300
Wire Bus Line
	1850 2300 4500 2300
Entry Bus Bus
	4700 2150 4800 2250
Entry Bus Bus
	4600 2400 4700 2300
Wire Bus Line
	4700 2300 7350 2300
Entry Bus Bus
	1950 2250 2050 2150
Wire Bus Line
	2050 2150 4700 2150
Entry Bus Bus
	4800 2250 4900 2150
Wire Bus Line
	4900 2150 7550 2150
Wire Bus Line
	1850 2150 1100 2150
Text HLabel 1100 2300 0    50   Input ~ 0
A[0..15]
Text HLabel 1100 2150 0    50   Input ~ 0
B[0..15]
Text HLabel 10450 5150 2    50   Input ~ 0
IBUS[0..15]
Entry Bus Bus
	9900 5050 10000 5150
Entry Bus Bus
	9800 5150 9900 5050
Wire Bus Line
	10000 5150 10450 5150
Entry Bus Bus
	7050 5050 7150 5150
Entry Bus Bus
	6950 5150 7050 5050
Wire Bus Line
	7150 5150 9800 5150
Entry Bus Bus
	4200 5050 4300 5150
Wire Bus Line
	4300 5150 6950 5150
Text Label 1200 2150 0    50   ~ 0
B[0..15]
Text Label 2900 2150 0    50   ~ 0
B[0..15]
Text Label 5750 2150 0    50   ~ 0
B[0..15]
Text Label 1200 2300 0    50   ~ 0
A[0..15]
Text Label 2900 2300 0    50   ~ 0
A[0..15]
Text Label 5750 2300 0    50   ~ 0
A[0..15]
Text Label 4800 2900 1    50   ~ 0
B[0..15]
Text Label 4600 2900 1    50   ~ 0
A[0..15]
Text Label 1750 2900 1    50   ~ 0
A[0..15]
Text Label 1950 2900 1    50   ~ 0
B[0..15]
Text Label 7650 2900 1    50   ~ 0
B[0..15]
Text Label 7450 2900 1    50   ~ 0
A[0..15]
Text Label 4200 4700 1    50   ~ 0
IBUS[0..15]
Text Label 7050 4700 1    50   ~ 0
IBUS[0..15]
Text Label 9900 4700 1    50   ~ 0
IBUS[0..15]
Text Label 5700 5150 0    50   ~ 0
IBUS[0..15]
Text Label 8600 5150 0    50   ~ 0
IBUS[0..15]
Text HLabel 1100 4000 0    50   Input ~ 0
FL-IN
$Comp
L alexios:29W040 U?
U 1 1 5E195CA5
P 3050 3600
AR Path="/5DC89E19/5E195CA5" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CA5" Ref="U?"  Part="1" 
F 0 "U?" H 3050 4667 50  0000 C CNN
F 1 "29W040" H 3050 4576 50  0000 C CNN
F 2 "" H 3050 3600 50  0001 C CNN
F 3 "" H 3050 3600 50  0001 C CNN
	1    3050 3600
	1    0    0    -1  
$EndComp
Connection ~ 2450 4500
Wire Wire Line
	2450 4400 2450 4500
Wire Wire Line
	1100 4300 2500 4300
Text Label 1250 4100 0    50   ~ 0
OP0
Text Label 1250 4200 0    50   ~ 0
OP1
Text Label 1250 4300 0    50   ~ 0
OP2
Wire Wire Line
	5350 4100 4900 4100
Wire Wire Line
	5350 4200 4900 4200
Wire Wire Line
	5350 4300 4900 4300
Text Label 4900 4100 0    50   ~ 0
OP0
Text Label 4900 4200 0    50   ~ 0
OP1
Text Label 4900 4300 0    50   ~ 0
OP2
Wire Wire Line
	8200 3700 7750 3700
Wire Wire Line
	8200 3800 7750 3800
Wire Wire Line
	8200 3900 7750 3900
Text Label 7750 3700 0    50   ~ 0
OP0
Text Label 7750 3800 0    50   ~ 0
OP1
Text Label 7750 3900 0    50   ~ 0
OP2
Text HLabel 1100 4100 0    50   Input ~ 0
OP0
Text HLabel 1100 4200 0    50   Input ~ 0
OP1
Text HLabel 1100 4300 0    50   Input ~ 0
OP2
Text HLabel 1100 5000 0    50   Input ~ 0
~ROMCE
Wire Wire Line
	1100 5000 3800 5000
Wire Wire Line
	9300 3200 9650 3200
Wire Wire Line
	9300 3300 9650 3300
Text Label 9650 3200 2    50   ~ 0
X2
Text Label 9650 3300 2    50   ~ 0
X3
Text HLabel 10450 4700 2    50   3State ~ 0
X2
Text HLabel 10450 4800 2    50   3State ~ 0
X3
Text HLabel 10450 4900 2    50   3State ~ 0
X4
Text HLabel 10450 5000 2    50   3State ~ 0
X5
Wire Wire Line
	6450 3500 6800 3500
Text Label 6800 3500 2    50   ~ 0
X1
Text HLabel 10450 4600 2    50   3State ~ 0
X1
Text Label 3900 3500 2    50   ~ 0
X0
Text HLabel 10450 4500 2    50   3State ~ 0
X0
Wire Wire Line
	10450 4500 10100 4500
Wire Wire Line
	10450 4600 10100 4600
Wire Wire Line
	10450 4700 10100 4700
Wire Wire Line
	10450 4800 10100 4800
Wire Wire Line
	10450 4900 10100 4900
Wire Wire Line
	10450 5000 10100 5000
Text Label 10100 4500 0    50   ~ 0
X0
Text Label 10100 4600 0    50   ~ 0
X1
Text Label 10100 4700 0    50   ~ 0
X2
Text Label 10100 4800 0    50   ~ 0
X3
Text Label 10100 4900 0    50   ~ 0
X4
Text Label 10100 5000 0    50   ~ 0
X5
Text Label 9650 3500 2    50   ~ 0
X5
Text Label 9650 3400 2    50   ~ 0
X4
Wire Wire Line
	9300 3500 9650 3500
Wire Wire Line
	9300 3400 9650 3400
Wire Wire Line
	3600 3500 3900 3500
$Comp
L alexios:29W040 U?
U 2 1 5E426152
P 3050 5550
AR Path="/5DC89E19/5E426152" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E426152" Ref="U?"  Part="2" 
F 0 "U?" H 3230 5596 50  0000 L CNN
F 1 "29W040" H 3230 5505 50  0000 L CNN
F 2 "" H 3050 5550 50  0001 C CNN
F 3 "" H 3050 5550 50  0001 C CNN
	2    3050 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E42E1EE
P 2700 5550
AR Path="/5CC0D65F/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E42E1EE" Ref="C?"  Part="1" 
F 0 "C?" H 2609 5596 50  0000 R CNN
F 1 "100nF" H 2609 5505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2700 5550 50  0001 C CNN
F 3 "~" H 2700 5550 50  0001 C CNN
	1    2700 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E42E1F4
P 2700 5650
AR Path="/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E42E1F4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2700 5400 50  0001 C CNN
F 1 "GND" H 2705 5477 50  0000 C CNN
F 2 "" H 2700 5650 50  0001 C CNN
F 3 "" H 2700 5650 50  0001 C CNN
	1    2700 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E42E1FA
P 2700 5450
AR Path="/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E42E1FA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2700 5300 50  0001 C CNN
F 1 "+5V" H 2715 5623 50  0000 C CNN
F 2 "" H 2700 5450 50  0001 C CNN
F 3 "" H 2700 5450 50  0001 C CNN
	1    2700 5450
	1    0    0    -1  
$EndComp
Connection ~ 2700 5650
Connection ~ 2700 5450
$Comp
L alexios:29W040 U?
U 2 1 5E434AC0
P 5900 5550
AR Path="/5DC89E19/5E434AC0" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E434AC0" Ref="U?"  Part="2" 
F 0 "U?" H 6080 5596 50  0000 L CNN
F 1 "29W040" H 6080 5505 50  0000 L CNN
F 2 "" H 5900 5550 50  0001 C CNN
F 3 "" H 5900 5550 50  0001 C CNN
	2    5900 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E434AC6
P 5550 5550
AR Path="/5CC0D65F/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E434AC6" Ref="C?"  Part="1" 
F 0 "C?" H 5459 5596 50  0000 R CNN
F 1 "100nF" H 5459 5505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5550 5550 50  0001 C CNN
F 3 "~" H 5550 5550 50  0001 C CNN
	1    5550 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E434ACC
P 5550 5650
AR Path="/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E434ACC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5550 5400 50  0001 C CNN
F 1 "GND" H 5555 5477 50  0000 C CNN
F 2 "" H 5550 5650 50  0001 C CNN
F 3 "" H 5550 5650 50  0001 C CNN
	1    5550 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E434AD2
P 5550 5450
AR Path="/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E434AD2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5550 5300 50  0001 C CNN
F 1 "+5V" H 5565 5623 50  0000 C CNN
F 2 "" H 5550 5450 50  0001 C CNN
F 3 "" H 5550 5450 50  0001 C CNN
	1    5550 5450
	1    0    0    -1  
$EndComp
Connection ~ 5550 5650
Connection ~ 5550 5450
$Comp
L alexios:29W040 U?
U 2 1 5E43A76F
P 8750 5550
AR Path="/5DC89E19/5E43A76F" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E43A76F" Ref="U?"  Part="2" 
F 0 "U?" H 8930 5596 50  0000 L CNN
F 1 "29W040" H 8930 5505 50  0000 L CNN
F 2 "" H 8750 5550 50  0001 C CNN
F 3 "" H 8750 5550 50  0001 C CNN
	2    8750 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E43A775
P 8400 5550
AR Path="/5CC0D65F/5E43A775" Ref="C?"  Part="1" 
AR Path="/5E43A775" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E43A775" Ref="C?"  Part="1" 
F 0 "C?" H 8309 5596 50  0000 R CNN
F 1 "100nF" H 8309 5505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8400 5550 50  0001 C CNN
F 3 "~" H 8400 5550 50  0001 C CNN
	1    8400 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E43A77B
P 8400 5650
AR Path="/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E43A77B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8400 5400 50  0001 C CNN
F 1 "GND" H 8405 5477 50  0000 C CNN
F 2 "" H 8400 5650 50  0001 C CNN
F 3 "" H 8400 5650 50  0001 C CNN
	1    8400 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E43A781
P 8400 5450
AR Path="/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E43A781" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8400 5300 50  0001 C CNN
F 1 "+5V" H 8415 5623 50  0000 C CNN
F 2 "" H 8400 5450 50  0001 C CNN
F 3 "" H 8400 5450 50  0001 C CNN
	1    8400 5450
	1    0    0    -1  
$EndComp
Connection ~ 8400 5650
Connection ~ 8400 5450
Wire Bus Line
	9900 2900 9900 5050
Wire Bus Line
	7450 2400 7450 3400
Wire Bus Line
	7650 2250 7650 3000
Wire Bus Line
	1950 2250 1950 3200
Wire Bus Line
	1750 2400 1750 3800
Wire Bus Line
	4800 2250 4800 3200
Wire Bus Line
	4600 2400 4600 3800
Wire Bus Line
	4200 2900 4200 5050
Wire Bus Line
	7050 2900 7050 5050
$EndSCHEMATC
