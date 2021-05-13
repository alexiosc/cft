EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 11
Title "ALU Operation Table"
Date "2019-11-17"
Rev "2020"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5000 950  4550 950 
Wire Wire Line
	5000 1050 4550 1050
Wire Wire Line
	5000 1150 4550 1150
Wire Wire Line
	5000 1250 4550 1250
Wire Wire Line
	5000 1350 4550 1350
Wire Wire Line
	5000 1450 4550 1450
Wire Wire Line
	5000 1550 4350 1550
Wire Wire Line
	5000 1650 4350 1650
Wire Wire Line
	5000 1750 4350 1750
Wire Wire Line
	5000 1850 4350 1850
Wire Wire Line
	5000 1950 4350 1950
Wire Wire Line
	5000 2050 4350 2050
Text Label 4650 2150 0    50   ~ 0
FL-REG
Wire Wire Line
	6100 950  6600 950 
Wire Wire Line
	6100 1050 6600 1050
Wire Wire Line
	6100 1150 6600 1150
Wire Wire Line
	6100 1250 6600 1250
Wire Wire Line
	6100 1350 6600 1350
Wire Wire Line
	6100 1450 6600 1450
Text Label 6150 1550 0    50   ~ 0
C0
$Comp
L power:+5V #PWR?
U 1 1 5E195CE2
P 6100 2050
AR Path="/5DC89E19/5E195CE2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195CE2" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E195CE2" Ref="#PWR0504"  Part="1" 
F 0 "#PWR0504" H 6100 1900 50  0001 C CNN
F 1 "+5V" V 6200 2050 50  0000 L CNN
F 2 "" H 6100 2050 50  0001 C CNN
F 3 "" H 6100 2050 50  0001 C CNN
	1    6100 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 3100 4550 3100
Wire Wire Line
	5000 3200 4550 3200
Wire Wire Line
	5000 3300 4550 3300
Wire Wire Line
	5000 3400 4550 3400
Wire Wire Line
	5000 3500 4550 3500
Wire Wire Line
	5000 3600 4550 3600
Text Label 4650 4300 0    50   ~ 0
C0
Wire Wire Line
	6100 3100 6600 3100
Wire Wire Line
	6100 3200 6600 3200
Wire Wire Line
	6100 3300 6600 3300
Wire Wire Line
	6100 3400 6600 3400
Wire Wire Line
	6100 3500 6600 3500
Wire Wire Line
	6100 3600 6600 3600
Text Label 6450 3700 2    50   ~ 0
C1
$Comp
L power:+5V #PWR?
U 1 1 5E195D24
P 6100 4200
AR Path="/5DC89E19/5E195D24" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D24" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E195D24" Ref="#PWR0510"  Part="1" 
F 0 "#PWR0510" H 6100 4050 50  0001 C CNN
F 1 "+5V" V 6250 4150 50  0000 L CNN
F 2 "" H 6100 4200 50  0001 C CNN
F 3 "" H 6100 4200 50  0001 C CNN
	1    6100 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 1550 6550 1550
Wire Wire Line
	4050 4300 5000 4300
Text Label 6450 3100 2    50   ~ 0
Y6
Text Label 6450 3200 2    50   ~ 0
Y7
Text Label 6450 3300 2    50   ~ 0
Y8
Text Label 6450 3400 2    50   ~ 0
Y9
Text Label 6450 3500 2    50   ~ 0
Y10
Text Label 6450 3600 2    50   ~ 0
Y11
Wire Wire Line
	5000 5250 4550 5250
Wire Wire Line
	5000 5350 4550 5350
Wire Wire Line
	5000 5450 4550 5450
Wire Wire Line
	5000 5550 4550 5550
Wire Wire Line
	6100 5250 6600 5250
Wire Wire Line
	6100 5350 6600 5350
Wire Wire Line
	6100 5450 6600 5450
Wire Wire Line
	6100 5550 6600 5550
$Comp
L power:+5V #PWR?
U 1 1 5E195D70
P 6100 6350
AR Path="/5DC89E19/5E195D70" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E195D70" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E195D70" Ref="#PWR0529"  Part="1" 
F 0 "#PWR0529" H 6100 6200 50  0001 C CNN
F 1 "+5V" V 6200 6350 50  0000 L CNN
F 2 "" H 6100 6350 50  0001 C CNN
F 3 "" H 6100 6350 50  0001 C CNN
	1    6100 6350
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 3700 6550 3700
Text Label 6150 5250 0    50   ~ 0
Y12
Text Label 6150 5350 0    50   ~ 0
Y13
Text Label 6150 5450 0    50   ~ 0
Y14
Text Label 6150 5550 0    50   ~ 0
Y15
Entry Wire Line
	4450 850  4550 950 
Entry Wire Line
	4450 950  4550 1050
Entry Wire Line
	4450 1050 4550 1150
Entry Wire Line
	4450 1150 4550 1250
Entry Wire Line
	4450 1250 4550 1350
Entry Wire Line
	4450 1350 4550 1450
Entry Wire Line
	4250 1450 4350 1550
Entry Wire Line
	4250 1550 4350 1650
Entry Wire Line
	4250 1650 4350 1750
Entry Wire Line
	4250 1750 4350 1850
Entry Wire Line
	4250 1850 4350 1950
Entry Wire Line
	4250 1950 4350 2050
Wire Wire Line
	4350 3700 5000 3700
Wire Wire Line
	4350 3800 5000 3800
Wire Wire Line
	4350 3900 5000 3900
Wire Wire Line
	4350 4000 5000 4000
Wire Wire Line
	4350 4100 5000 4100
Wire Wire Line
	4350 4200 5000 4200
Wire Wire Line
	4350 5850 5000 5850
Wire Wire Line
	4350 5950 5000 5950
Wire Wire Line
	4350 6050 5000 6050
Wire Wire Line
	4350 6150 5000 6150
Entry Bus Bus
	4150 800  4250 900 
Entry Bus Bus
	4350 650  4450 750 
Entry Wire Line
	6600 950  6700 1050
Entry Wire Line
	6600 1050 6700 1150
Entry Wire Line
	6600 1150 6700 1250
Entry Wire Line
	6600 1250 6700 1350
Entry Wire Line
	6600 1350 6700 1450
Entry Wire Line
	6600 1450 6700 1550
Text HLabel 1050 800  0    50   Input ~ 0
B[0..15]
Text HLabel 1050 650  0    50   Input ~ 0
A[0..15]
Text Label 1100 650  0    50   ~ 0
A[0..15]
Text Label 1100 800  0    50   ~ 0
B[0..15]
Text Label 4250 1300 1    50   ~ 0
B[0..15]
Text Label 4450 1300 1    50   ~ 0
A[0..15]
Wire Wire Line
	6100 3800 6450 3800
Text Label 6450 3800 2    50   ~ 0
X1
Text HLabel 10550 900  2    50   Output ~ 0
X1
Text Label 6150 1650 0    50   ~ 0
X0
Text HLabel 10550 800  2    50   Output ~ 0
X0
Wire Wire Line
	10550 800  9500 800 
Wire Wire Line
	10550 900  9500 900 
Text Label 9500 800  0    50   ~ 0
X0
Text Label 9500 900  0    50   ~ 0
X1
$Comp
L Device:C_Small C?
U 1 1 5E42E1EE
P 7300 4900
AR Path="/5CC0D65F/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E42E1EE" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E42E1EE" Ref="C502"  Part="1" 
F 0 "C502" H 7209 4946 50  0000 R CNN
F 1 "100nF" H 7209 4855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7300 4900 50  0001 C CNN
F 3 "~" H 7300 4900 50  0001 C CNN
	1    7300 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E42E1F4
P 7300 5000
AR Path="/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E42E1F4" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E42E1F4" Ref="#PWR0516"  Part="1" 
F 0 "#PWR0516" H 7300 4750 50  0001 C CNN
F 1 "GND" H 7305 4827 50  0000 C CNN
F 2 "" H 7300 5000 50  0001 C CNN
F 3 "" H 7300 5000 50  0001 C CNN
	1    7300 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E42E1FA
P 7300 4800
AR Path="/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E42E1FA" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E42E1FA" Ref="#PWR0513"  Part="1" 
F 0 "#PWR0513" H 7300 4650 50  0001 C CNN
F 1 "+5V" H 7315 4973 50  0000 C CNN
F 2 "" H 7300 4800 50  0001 C CNN
F 3 "" H 7300 4800 50  0001 C CNN
	1    7300 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E434AC6
P 7300 5600
AR Path="/5CC0D65F/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E434AC6" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E434AC6" Ref="C505"  Part="1" 
F 0 "C505" H 7209 5646 50  0000 R CNN
F 1 "100nF" H 7209 5555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7300 5600 50  0001 C CNN
F 3 "~" H 7300 5600 50  0001 C CNN
	1    7300 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E434ACC
P 7300 5700
AR Path="/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E434ACC" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E434ACC" Ref="#PWR0522"  Part="1" 
F 0 "#PWR0522" H 7300 5450 50  0001 C CNN
F 1 "GND" H 7305 5527 50  0000 C CNN
F 2 "" H 7300 5700 50  0001 C CNN
F 3 "" H 7300 5700 50  0001 C CNN
	1    7300 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E434AD2
P 7300 5500
AR Path="/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E434AD2" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E434AD2" Ref="#PWR0519"  Part="1" 
F 0 "#PWR0519" H 7300 5350 50  0001 C CNN
F 1 "+5V" H 7315 5673 50  0000 C CNN
F 2 "" H 7300 5500 50  0001 C CNN
F 3 "" H 7300 5500 50  0001 C CNN
	1    7300 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E43A775
P 7300 6300
AR Path="/5CC0D65F/5E43A775" Ref="C?"  Part="1" 
AR Path="/5E43A775" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E43A775" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E43A775" Ref="C508"  Part="1" 
F 0 "C508" H 7209 6346 50  0000 R CNN
F 1 "100nF" H 7209 6255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7300 6300 50  0001 C CNN
F 3 "~" H 7300 6300 50  0001 C CNN
	1    7300 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E43A77B
P 7300 6400
AR Path="/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E43A77B" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E43A77B" Ref="#PWR0530"  Part="1" 
F 0 "#PWR0530" H 7300 6150 50  0001 C CNN
F 1 "GND" H 7305 6227 50  0000 C CNN
F 2 "" H 7300 6400 50  0001 C CNN
F 3 "" H 7300 6400 50  0001 C CNN
	1    7300 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E43A781
P 7300 6200
AR Path="/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E43A781" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E43A781" Ref="#PWR0525"  Part="1" 
F 0 "#PWR0525" H 7300 6050 50  0001 C CNN
F 1 "+5V" H 7315 6373 50  0000 C CNN
F 2 "" H 7300 6200 50  0001 C CNN
F 3 "" H 7300 6200 50  0001 C CNN
	1    7300 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4400 3950 4400
Wire Wire Line
	6100 1650 6450 1650
Text Label 4650 4400 0    50   ~ 0
X0
Text Label 4650 6550 0    50   ~ 0
X1
Wire Wire Line
	6100 5850 6550 5850
Text Label 9500 1000 0    50   ~ 0
FVOUT
Text HLabel 10550 1000 2    50   Output ~ 0
FVOUT-ROM
Text HLabel 10550 1200 2    50   Output ~ 0
~SETV-ROM
Text HLabel 10550 1700 2    50   Output ~ 0
FLOUT-ROM
Text HLabel 10550 2200 2    50   Output ~ 0
~SETL-ROM
Text Label 6550 5850 2    50   ~ 0
FLOUT
Text Label 6550 5650 2    50   ~ 0
FVOUT
Text Label 4650 2250 0    50   ~ 0
X-IN-REG
Text Label 4650 950  0    50   ~ 0
A0
Text Label 4650 1050 0    50   ~ 0
A1
Text Label 4650 1150 0    50   ~ 0
A2
Text Label 4650 1250 0    50   ~ 0
A3
Text Label 4650 1350 0    50   ~ 0
A4
Text Label 4650 1450 0    50   ~ 0
A5
Text Label 4650 1550 0    50   ~ 0
B0
Text Label 4650 1650 0    50   ~ 0
B1
Text Label 4650 1750 0    50   ~ 0
B2
Text Label 4650 1850 0    50   ~ 0
B3
Text Label 4650 1950 0    50   ~ 0
B4
Text Label 4650 2050 0    50   ~ 0
B5
Text Label 6150 950  0    50   ~ 0
Y0
Text Label 6150 1050 0    50   ~ 0
Y1
Text Label 6150 1150 0    50   ~ 0
Y2
Text Label 6150 1250 0    50   ~ 0
Y3
Text Label 6150 1350 0    50   ~ 0
Y4
Text Label 6150 1450 0    50   ~ 0
Y5
Text Label 4650 3100 0    50   ~ 0
A6
Text Label 4650 3200 0    50   ~ 0
A7
Text Label 4650 3300 0    50   ~ 0
A8
Text Label 4650 3400 0    50   ~ 0
A9
Text Label 4650 3500 0    50   ~ 0
A10
Text Label 4650 3600 0    50   ~ 0
A11
Text Label 4650 3700 0    50   ~ 0
B6
Text Label 4650 3800 0    50   ~ 0
B7
Text Label 4650 3900 0    50   ~ 0
B8
Text Label 4650 4000 0    50   ~ 0
B9
Text Label 4650 4100 0    50   ~ 0
B10
Text Label 4650 4200 0    50   ~ 0
B11
Text Label 4650 6450 0    50   ~ 0
C1
Text Label 4650 5250 0    50   ~ 0
A12
Text Label 4650 5350 0    50   ~ 0
A13
Text Label 4650 5450 0    50   ~ 0
A14
Text Label 4650 5550 0    50   ~ 0
A15
Text Label 4650 5850 0    50   ~ 0
B12
Text Label 4650 5950 0    50   ~ 0
B13
Text Label 4650 6050 0    50   ~ 0
B14
Text Label 4650 6150 0    50   ~ 0
B15
$Comp
L alexios:74HC541 U502
U 1 1 5DC85DD2
P 7600 1450
F 0 "U502" H 7600 2217 50  0000 C CNN
F 1 "74HC541" H 7600 2126 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7600 1450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7600 1450 50  0001 C CNN
	1    7600 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 950  6800 950 
Wire Wire Line
	7100 1050 6800 1050
Wire Wire Line
	7100 1150 6800 1150
Wire Wire Line
	7100 1250 6800 1250
Wire Wire Line
	7100 1350 6800 1350
Wire Wire Line
	7100 1450 6800 1450
Wire Wire Line
	7100 1550 6800 1550
Wire Wire Line
	7100 1650 6800 1650
Entry Wire Line
	6800 950  6700 1050
Entry Wire Line
	6800 1050 6700 1150
Entry Wire Line
	6800 1150 6700 1250
Entry Wire Line
	6800 1250 6700 1350
Entry Wire Line
	6800 1350 6700 1450
Entry Wire Line
	6800 1450 6700 1550
Entry Wire Line
	6800 1550 6700 1650
Entry Wire Line
	6800 1650 6700 1750
$Comp
L power:GND #PWR0503
U 1 1 5DCA6050
P 7100 1950
F 0 "#PWR0503" H 7100 1700 50  0001 C CNN
F 1 "GND" H 7105 1777 50  0000 C CNN
F 2 "" H 7100 1950 50  0001 C CNN
F 3 "" H 7100 1950 50  0001 C CNN
	1    7100 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DCAB563
P 6150 6250
AR Path="/5DC89E19/5DCAB563" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5DCAB563" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5DCAB563" Ref="#PWR0528"  Part="1" 
F 0 "#PWR0528" H 6150 6000 50  0001 C CNN
F 1 "GND" V 6300 6250 50  0000 R CNN
F 2 "" H 6150 6250 50  0001 C CNN
F 3 "" H 6150 6250 50  0001 C CNN
	1    6150 6250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 6150 6150 6150
Wire Wire Line
	6150 6150 6150 6250
Wire Wire Line
	6100 6250 6150 6250
Connection ~ 6150 6250
$Comp
L power:GND #PWR?
U 1 1 5DCB7239
P 6150 4100
AR Path="/5DC89E19/5DCB7239" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5DCB7239" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5DCB7239" Ref="#PWR0508"  Part="1" 
F 0 "#PWR0508" H 6150 3850 50  0001 C CNN
F 1 "GND" V 6300 4100 50  0000 R CNN
F 2 "" H 6150 4100 50  0001 C CNN
F 3 "" H 6150 4100 50  0001 C CNN
	1    6150 4100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 4000 6150 4000
Wire Wire Line
	6150 4000 6150 4100
Wire Wire Line
	6100 4100 6150 4100
Connection ~ 6150 4100
$Comp
L power:GND #PWR?
U 1 1 5DCBCB79
P 6150 1950
AR Path="/5DC89E19/5DCBCB79" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5DCBCB79" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5DCBCB79" Ref="#PWR0502"  Part="1" 
F 0 "#PWR0502" H 6150 1700 50  0001 C CNN
F 1 "GND" V 6300 1950 50  0000 R CNN
F 2 "" H 6150 1950 50  0001 C CNN
F 3 "" H 6150 1950 50  0001 C CNN
	1    6150 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 1850 6150 1850
Wire Wire Line
	6150 1850 6150 1950
Wire Wire Line
	6100 1950 6150 1950
Connection ~ 6150 1950
Wire Wire Line
	7100 1850 6850 1850
Text Label 6900 1850 0    50   ~ 0
~ALUOE
Text Label 6700 2450 1    50   ~ 0
Y[0..15]
Wire Wire Line
	6100 5650 6550 5650
Text Label 8150 950  0    50   ~ 0
IBUS0
Text Label 8150 1050 0    50   ~ 0
IBUS1
Text Label 8150 1150 0    50   ~ 0
IBUS2
Text Label 8150 1250 0    50   ~ 0
IBUS3
Text Label 8150 1350 0    50   ~ 0
IBUS4
Text Label 8150 1450 0    50   ~ 0
IBUS5
Text Label 8150 1550 0    50   ~ 0
IBUS6
Text Label 8150 1650 0    50   ~ 0
IBUS7
Wire Wire Line
	3950 6550 5000 6550
Wire Wire Line
	4050 6450 5000 6450
Wire Wire Line
	9500 1000 10550 1000
Wire Wire Line
	8100 950  8550 950 
Wire Wire Line
	8100 1050 8550 1050
Wire Wire Line
	8100 1150 8550 1150
Wire Wire Line
	8100 1250 8550 1250
Wire Wire Line
	8100 1350 8550 1350
Wire Wire Line
	8100 1450 8550 1450
Wire Wire Line
	8100 1550 8550 1550
Wire Wire Line
	8100 1650 8550 1650
$Comp
L alexios:74HC541 U502
U 2 1 5E1F00D4
P 9000 5600
F 0 "U502" H 9179 5646 50  0000 L CNN
F 1 "74HC541" H 9179 5555 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9000 5600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 9000 5600 50  0001 C CNN
	2    9000 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E1F0362
P 8650 5600
AR Path="/5CC0D65F/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F0362" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E1F0362" Ref="C506"  Part="1" 
F 0 "C506" H 8559 5646 50  0000 R CNN
F 1 "100nF" H 8559 5555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 5600 50  0001 C CNN
F 3 "~" H 8650 5600 50  0001 C CNN
	1    8650 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E1F0369
P 8650 5700
AR Path="/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F0369" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E1F0369" Ref="#PWR0523"  Part="1" 
F 0 "#PWR0523" H 8650 5450 50  0001 C CNN
F 1 "GND" H 8655 5527 50  0000 C CNN
F 2 "" H 8650 5700 50  0001 C CNN
F 3 "" H 8650 5700 50  0001 C CNN
	1    8650 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E1F036F
P 8650 5500
AR Path="/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F036F" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E1F036F" Ref="#PWR0520"  Part="1" 
F 0 "#PWR0520" H 8650 5350 50  0001 C CNN
F 1 "+5V" H 8665 5673 50  0000 C CNN
F 2 "" H 8650 5500 50  0001 C CNN
F 3 "" H 8650 5500 50  0001 C CNN
	1    8650 5500
	1    0    0    -1  
$EndComp
Connection ~ 8650 5700
Connection ~ 8650 5500
$Comp
L alexios:74HC541 U506
U 2 1 5E1F9603
P 9000 6300
F 0 "U506" H 9179 6346 50  0000 L CNN
F 1 "74HC541" H 9179 6255 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9000 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 9000 6300 50  0001 C CNN
	2    9000 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E1F960A
P 8650 6300
AR Path="/5CC0D65F/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F960A" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5E1F960A" Ref="C509"  Part="1" 
F 0 "C509" H 8559 6346 50  0000 R CNN
F 1 "100nF" H 8559 6255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 6300 50  0001 C CNN
F 3 "~" H 8650 6300 50  0001 C CNN
	1    8650 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E1F9611
P 8650 6400
AR Path="/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F9611" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E1F9611" Ref="#PWR0531"  Part="1" 
F 0 "#PWR0531" H 8650 6150 50  0001 C CNN
F 1 "GND" H 8655 6227 50  0000 C CNN
F 2 "" H 8650 6400 50  0001 C CNN
F 3 "" H 8650 6400 50  0001 C CNN
	1    8650 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E1F9617
P 8650 6200
AR Path="/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5E1F9617" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5E1F9617" Ref="#PWR0526"  Part="1" 
F 0 "#PWR0526" H 8650 6050 50  0001 C CNN
F 1 "+5V" H 8665 6373 50  0000 C CNN
F 2 "" H 8650 6200 50  0001 C CNN
F 3 "" H 8650 6200 50  0001 C CNN
	1    8650 6200
	1    0    0    -1  
$EndComp
Connection ~ 8650 6400
Connection ~ 8650 6200
Text Notes 1700 1700 0    50   ~ 0
X-IN is reserved for future\nexpansion, and wired to\nallow this. It can be cascaded\nlike carry using X0 and X1, or\nindependent of them.
$Comp
L alexios:74LVC1G32 U501
U 1 1 5EB2EB3A
P 10200 1200
F 0 "U501" H 10250 1025 50  0000 C CNN
F 1 "74LVC1G32" H 10250 934 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10310 1180 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10310 1180 50  0001 C CNN
	1    10200 1200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U504
U 1 1 5EB2F744
P 10200 2200
F 0 "U504" H 10250 2025 50  0000 C CNN
F 1 "74LVC1G32" H 10250 1934 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10310 2180 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10310 2180 50  0001 C CNN
	1    10200 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 1200 10550 1200
Wire Wire Line
	10500 2200 10550 2200
Text Label 9500 1150 0    50   ~ 0
~SETV
Text Label 9500 1250 0    50   ~ 0
~READ-ALU-Y
Wire Wire Line
	9500 2150 10000 2150
Wire Wire Line
	9500 1150 10000 1150
Wire Wire Line
	9500 1250 10000 1250
Wire Wire Line
	9500 2250 10000 2250
Connection ~ 10000 6200
Connection ~ 10000 6400
$Comp
L alexios:74LVC1G32 U504
U 2 1 5EBE3F55
P 10400 6050
F 0 "U504" H 10530 5846 50  0000 L CNN
F 1 "74LVC1G32" H 10530 5755 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10510 6030 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10510 6030 50  0001 C CNN
	2    10400 6050
	1    0    0    -1  
$EndComp
Connection ~ 10000 5500
Connection ~ 10000 5700
$Comp
L power:+5V #PWR?
U 1 1 5EBD972E
P 10000 6200
AR Path="/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBD972E" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBD972E" Ref="#PWR0527"  Part="1" 
F 0 "#PWR0527" H 10000 6050 50  0001 C CNN
F 1 "+5V" H 10015 6373 50  0000 C CNN
F 2 "" H 10000 6200 50  0001 C CNN
F 3 "" H 10000 6200 50  0001 C CNN
	1    10000 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBD9728
P 10000 6400
AR Path="/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBD9728" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBD9728" Ref="#PWR0532"  Part="1" 
F 0 "#PWR0532" H 10000 6150 50  0001 C CNN
F 1 "GND" H 10005 6227 50  0000 C CNN
F 2 "" H 10000 6400 50  0001 C CNN
F 3 "" H 10000 6400 50  0001 C CNN
	1    10000 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EBD9722
P 10000 6300
AR Path="/5CC0D65F/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBD9722" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5EBD9722" Ref="C510"  Part="1" 
F 0 "C510" H 9909 6346 50  0000 R CNN
F 1 "100nF" H 9909 6255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10000 6300 50  0001 C CNN
F 3 "~" H 10000 6300 50  0001 C CNN
	1    10000 6300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EBCD351
P 10000 5500
AR Path="/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBCD351" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBCD351" Ref="#PWR0521"  Part="1" 
F 0 "#PWR0521" H 10000 5350 50  0001 C CNN
F 1 "+5V" H 10015 5673 50  0000 C CNN
F 2 "" H 10000 5500 50  0001 C CNN
F 3 "" H 10000 5500 50  0001 C CNN
	1    10000 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBCD34B
P 10000 5700
AR Path="/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBCD34B" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBCD34B" Ref="#PWR0524"  Part="1" 
F 0 "#PWR0524" H 10000 5450 50  0001 C CNN
F 1 "GND" H 10005 5527 50  0000 C CNN
F 2 "" H 10000 5700 50  0001 C CNN
F 3 "" H 10000 5700 50  0001 C CNN
	1    10000 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EBCD345
P 10000 5600
AR Path="/5CC0D65F/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBCD345" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5EBCD345" Ref="C507"  Part="1" 
F 0 "C507" H 9909 5646 50  0000 R CNN
F 1 "100nF" H 9909 5555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10000 5600 50  0001 C CNN
F 3 "~" H 10000 5600 50  0001 C CNN
	1    10000 5600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U501
U 2 1 5EBCB936
P 10400 5350
F 0 "U501" H 10530 5146 50  0000 L CNN
F 1 "74LVC1G32" H 10530 5055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10510 5330 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10510 5330 50  0001 C CNN
	2    10400 5350
	1    0    0    -1  
$EndComp
Text Label 9500 2150 0    50   ~ 0
~SETL
Text Label 9500 2250 0    50   ~ 0
~READ-ALU-Y
$Comp
L alexios:29W010 U?
U 1 1 5EB0EF1B
P 5550 3900
AR Path="/5EB0EF1B" Ref="U?"  Part="1" 
AR Path="/5DE3C078/5EB0EF1B" Ref="U507"  Part="1" 
F 0 "U507" H 5950 3100 50  0000 L CNN
F 1 "29W010" H 5950 3000 50  0000 L CNN
F 2 "alexios:PLCC32" H 5550 3900 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 5550 3900 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 5550 3900 50  0001 C CNN "Mouser"
	1    5550 3900
	1    0    0    -1  
$EndComp
$Comp
L alexios:29W010 U?
U 1 1 5EB0FEA6
P 5550 6050
AR Path="/5EB0FEA6" Ref="U?"  Part="1" 
AR Path="/5DE3C078/5EB0FEA6" Ref="U510"  Part="1" 
F 0 "U510" H 5950 5250 50  0000 L CNN
F 1 "29W010" H 5950 5150 50  0000 L CNN
F 2 "alexios:PLCC32" H 5550 6050 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 5550 6050 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 5550 6050 50  0001 C CNN "Mouser"
	1    5550 6050
	1    0    0    -1  
$EndComp
$Comp
L alexios:29W010 U?
U 2 1 5EB11557
P 7650 4900
AR Path="/5EB11557" Ref="U?"  Part="2" 
AR Path="/5DE3C078/5EB11557" Ref="U503"  Part="2" 
F 0 "U503" H 7830 4946 50  0000 L CNN
F 1 "29W010" H 7830 4855 50  0000 L CNN
F 2 "alexios:PLCC32" H 7650 4900 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 7650 4900 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 7650 4900 50  0001 C CNN "Mouser"
	2    7650 4900
	1    0    0    -1  
$EndComp
Connection ~ 7300 5000
Connection ~ 7300 4800
$Comp
L alexios:29W010 U?
U 2 1 5EB39402
P 7650 5600
AR Path="/5EB39402" Ref="U?"  Part="2" 
AR Path="/5DE3C078/5EB39402" Ref="U507"  Part="2" 
F 0 "U507" H 7830 5646 50  0000 L CNN
F 1 "29W010" H 7830 5555 50  0000 L CNN
F 2 "alexios:PLCC32" H 7650 5600 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 7650 5600 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 7650 5600 50  0001 C CNN "Mouser"
	2    7650 5600
	1    0    0    -1  
$EndComp
Connection ~ 7300 5700
Connection ~ 7300 5500
$Comp
L alexios:29W010 U?
U 2 1 5EB39CC1
P 7650 6300
AR Path="/5EB39CC1" Ref="U?"  Part="2" 
AR Path="/5DE3C078/5EB39CC1" Ref="U510"  Part="2" 
F 0 "U510" H 7830 6346 50  0000 L CNN
F 1 "29W010" H 7830 6255 50  0000 L CNN
F 2 "alexios:PLCC32" H 7650 6300 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 7650 6300 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 7650 6300 50  0001 C CNN "Mouser"
	2    7650 6300
	1    0    0    -1  
$EndComp
Connection ~ 7300 6400
Connection ~ 7300 6200
$Comp
L alexios:29W010 U?
U 1 1 5EB0B6DB
P 5550 1750
AR Path="/5EB0B6DB" Ref="U?"  Part="1" 
AR Path="/5DE3C078/5EB0B6DB" Ref="U503"  Part="1" 
F 0 "U503" H 5950 950 50  0000 L CNN
F 1 "29W010" H 5950 850 50  0000 L CNN
F 2 "alexios:PLCC32" H 5550 1750 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/S71147-82452.pdf" H 5550 1750 50  0001 C CNN
F 4 "579-39SF010A554CNHE; €1.10" H 5550 1750 50  0001 C CNN "Mouser"
	1    5550 1750
	1    0    0    -1  
$EndComp
Text Notes 5200 7250 0    50   ~ 10
55ns 128K×8 NOR Flash,\nPLCC32
Text Label 4650 2350 0    50   ~ 0
OP0
Text Label 4650 2450 0    50   ~ 0
OP1
Text Label 4650 2550 0    50   ~ 0
OP2
Text Label 4650 4500 0    50   ~ 0
OP0
Text Label 4650 4600 0    50   ~ 0
OP1
Text Label 4650 4700 0    50   ~ 0
OP2
Text Label 4650 6650 0    50   ~ 0
OP0
Text Label 4650 6750 0    50   ~ 0
OP1
Text Label 4650 6850 0    50   ~ 0
OP2
Wire Wire Line
	5000 5650 4950 5650
Wire Wire Line
	4950 5650 4950 5750
$Comp
L power:GND #PWR0533
U 1 1 5EC9ED08
P 4950 7000
F 0 "#PWR0533" H 4950 6750 50  0001 C CNN
F 1 "GND" H 4955 6827 50  0000 C CNN
F 2 "" H 4950 7000 50  0001 C CNN
F 3 "" H 4950 7000 50  0001 C CNN
	1    4950 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5750 4950 5750
Connection ~ 4950 5750
Wire Wire Line
	4950 5750 4950 6250
Wire Wire Line
	5000 6250 4950 6250
Connection ~ 4950 6250
Wire Wire Line
	4950 6250 4950 6350
Wire Wire Line
	5000 6350 4950 6350
Connection ~ 4950 6350
Wire Wire Line
	4950 6350 4950 7000
Text Label 1100 2150 0    50   ~ 0
FL
Text HLabel 1050 2150 0    50   Input ~ 0
FL
Text HLabel 1050 2250 0    50   Input ~ 0
X-IN
Text Label 1100 2250 0    50   ~ 0
X-IN
$Comp
L power:GND #PWR0505
U 1 1 5EBEFCAB
P 2300 3200
F 0 "#PWR0505" H 2300 2950 50  0001 C CNN
F 1 "GND" H 2305 3027 50  0000 C CNN
F 2 "" H 2300 3200 50  0001 C CNN
F 3 "" H 2300 3200 50  0001 C CNN
	1    2300 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3150 2300 3150
Wire Wire Line
	2300 3150 2300 3200
Wire Wire Line
	2350 2650 2300 2650
Wire Wire Line
	2300 2650 2300 2750
Connection ~ 2300 3150
Wire Wire Line
	2350 2750 2300 2750
Connection ~ 2300 2750
Wire Wire Line
	2300 2750 2300 2850
Wire Wire Line
	2350 2850 2300 2850
Connection ~ 2300 2850
Wire Wire Line
	2300 2850 2300 3150
NoConn ~ 3350 2650
NoConn ~ 3350 2750
NoConn ~ 3350 2850
Text Label 1100 2350 0    50   ~ 0
RADDR0
Text Label 1100 2450 0    50   ~ 0
RADDR1
Text Label 1100 2550 0    50   ~ 0
RADDR2
Text HLabel 1050 2350 0    50   Input ~ 0
RADDR0
Text HLabel 1050 2450 0    50   Input ~ 0
RADDR1
Text HLabel 1050 2550 0    50   Input ~ 0
RADDR2
Text Label 3550 2350 2    50   ~ 0
OP0
Text Label 3550 2450 2    50   ~ 0
OP1
Text Label 3550 2550 2    50   ~ 0
OP2
Text HLabel 1250 7350 0    50   Input ~ 0
~READ-ALU-Y
Wire Wire Line
	1650 7350 1250 7350
Wire Wire Line
	1250 7450 1650 7450
Text HLabel 1250 7450 0    50   Input ~ 0
~ALU-OP
$Comp
L alexios:74LVC1G08 U509
U 1 1 5EE5511B
P 1950 7400
F 0 "U509" H 1875 7667 50  0000 C CNN
F 1 "74LVC1G08" H 1875 7576 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1600 7400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 1600 7400 50  0001 C CNN
	1    1950 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1850 6850 3400
Wire Wire Line
	6100 5950 6550 5950
Text Label 6550 5750 2    50   ~ 0
~SETV
Wire Wire Line
	6100 5750 6550 5750
Wire Bus Line
	1050 650  4350 650 
Wire Bus Line
	1050 800  4150 800 
Wire Wire Line
	6450 1650 6450 2800
Wire Wire Line
	6450 2800 3950 2800
Wire Wire Line
	3950 2800 3950 4400
Wire Wire Line
	6550 1550 6550 2900
Wire Wire Line
	6550 2900 4050 2900
Wire Wire Line
	4050 2900 4050 4300
Wire Wire Line
	6450 3800 6450 4950
Wire Wire Line
	6450 4950 3950 4950
Wire Wire Line
	6550 3700 6550 5050
Wire Wire Line
	6550 5050 4050 5050
Wire Wire Line
	3950 4950 3950 6550
Wire Wire Line
	4050 5050 4050 6450
Entry Wire Line
	4250 3600 4350 3700
Entry Wire Line
	4250 3700 4350 3800
Entry Wire Line
	4250 3800 4350 3900
Entry Wire Line
	4250 3900 4350 4000
Entry Wire Line
	4250 4000 4350 4100
Entry Wire Line
	4250 4100 4350 4200
Entry Wire Line
	4250 5750 4350 5850
Entry Wire Line
	4250 5850 4350 5950
Entry Wire Line
	4250 5950 4350 6050
Entry Wire Line
	4250 6050 4350 6150
Entry Wire Line
	4450 3000 4550 3100
Entry Wire Line
	4450 3100 4550 3200
Entry Wire Line
	4450 3200 4550 3300
Entry Wire Line
	4450 3300 4550 3400
Entry Wire Line
	4450 3400 4550 3500
Entry Wire Line
	4450 3500 4550 3600
Entry Wire Line
	4450 5150 4550 5250
Entry Wire Line
	4450 5250 4550 5350
Entry Wire Line
	4450 5350 4550 5450
Entry Wire Line
	4450 5450 4550 5550
Text Label 4250 3450 1    50   ~ 0
B[0..15]
Text Label 4450 3450 1    50   ~ 0
A[0..15]
Text Label 4250 5400 1    50   ~ 0
B[0..15]
Text Label 4450 5400 1    50   ~ 0
A[0..15]
Entry Wire Line
	6700 3400 6600 3500
Entry Wire Line
	6700 3500 6600 3600
Entry Wire Line
	6700 3300 6600 3400
Entry Wire Line
	6700 3200 6600 3300
Entry Wire Line
	6700 3100 6600 3200
Entry Wire Line
	6700 3000 6600 3100
Entry Wire Line
	6700 5450 6600 5550
Entry Wire Line
	6700 5350 6600 5450
Entry Wire Line
	6700 5250 6600 5350
Entry Wire Line
	6700 5150 6600 5250
Wire Wire Line
	8100 3200 8550 3200
Wire Wire Line
	8100 3100 8550 3100
Wire Wire Line
	8100 3000 8550 3000
Wire Wire Line
	8100 2900 8550 2900
Wire Wire Line
	8100 2800 8550 2800
Wire Wire Line
	8100 2700 8550 2700
Wire Wire Line
	8100 2600 8550 2600
Wire Wire Line
	8100 2500 8550 2500
Text Label 6900 3400 0    50   ~ 0
~ALUOE
Wire Wire Line
	7100 3400 6850 3400
$Comp
L power:GND #PWR0506
U 1 1 5DCDF750
P 7100 3500
F 0 "#PWR0506" H 7100 3250 50  0001 C CNN
F 1 "GND" H 7105 3327 50  0000 C CNN
F 2 "" H 7100 3500 50  0001 C CNN
F 3 "" H 7100 3500 50  0001 C CNN
	1    7100 3500
	1    0    0    -1  
$EndComp
Entry Wire Line
	6700 3100 6800 3200
Entry Wire Line
	6700 3000 6800 3100
Entry Wire Line
	6700 2900 6800 3000
Entry Wire Line
	6700 2800 6800 2900
Entry Wire Line
	6700 2700 6800 2800
Entry Wire Line
	6700 2600 6800 2700
Entry Wire Line
	6700 2500 6800 2600
Entry Wire Line
	6700 2400 6800 2500
Wire Wire Line
	7100 3200 6800 3200
Wire Wire Line
	7100 3100 6800 3100
Wire Wire Line
	7100 3000 6800 3000
Wire Wire Line
	7100 2900 6800 2900
Wire Wire Line
	7100 2800 6800 2800
Wire Wire Line
	7100 2700 6800 2700
Wire Wire Line
	7100 2600 6800 2600
Wire Wire Line
	7100 2500 6800 2500
$Comp
L alexios:74HC541 U506
U 1 1 5DCDF731
P 7600 3000
F 0 "U506" H 7600 3767 50  0000 C CNN
F 1 "74HC541" H 7600 3676 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7600 3000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7600 3000 50  0001 C CNN
	1    7600 3000
	1    0    0    -1  
$EndComp
Text Label 7100 950  2    50   ~ 0
Y0
Text Label 7100 1050 2    50   ~ 0
Y1
Text Label 7100 1150 2    50   ~ 0
Y2
Text Label 7100 1250 2    50   ~ 0
Y3
Text Label 7100 1350 2    50   ~ 0
Y4
Text Label 7100 1450 2    50   ~ 0
Y5
Text Label 7100 1550 2    50   ~ 0
Y6
Text Label 7100 1650 2    50   ~ 0
Y7
Text Label 7100 2500 2    50   ~ 0
Y8
Text Label 7100 2600 2    50   ~ 0
Y9
Text Label 7100 2700 2    50   ~ 0
Y10
Text Label 7100 2800 2    50   ~ 0
Y11
Text Label 7100 2900 2    50   ~ 0
Y12
Text Label 7100 3000 2    50   ~ 0
Y13
Text Label 7100 3100 2    50   ~ 0
Y14
Text Label 7100 3200 2    50   ~ 0
Y15
Wire Wire Line
	2100 7400 6850 7400
Text Label 2200 7400 0    50   ~ 0
~ALUOE
Text Label 6850 4600 1    50   ~ 0
~ALUOE
Entry Wire Line
	8650 850  8550 950 
Entry Wire Line
	8650 950  8550 1050
Entry Wire Line
	8650 1050 8550 1150
Entry Wire Line
	8650 1150 8550 1250
Entry Wire Line
	8650 1250 8550 1350
Entry Wire Line
	8650 1350 8550 1450
Entry Wire Line
	8650 1450 8550 1550
Entry Wire Line
	8650 1550 8550 1650
Entry Wire Line
	8650 2400 8550 2500
Entry Wire Line
	8650 2500 8550 2600
Entry Wire Line
	8650 2600 8550 2700
Entry Wire Line
	8650 2700 8550 2800
Entry Wire Line
	8650 2800 8550 2900
Entry Wire Line
	8650 2900 8550 3000
Entry Wire Line
	8650 3000 8550 3100
Entry Wire Line
	8650 3100 8550 3200
Text Label 8150 2500 0    50   ~ 0
IBUS8
Text Label 8150 2600 0    50   ~ 0
IBUS9
Text Label 8150 2700 0    50   ~ 0
IBUS10
Text Label 8150 2800 0    50   ~ 0
IBUS11
Text Label 8150 2900 0    50   ~ 0
IBUS12
Text Label 8150 3000 0    50   ~ 0
IBUS13
Text Label 8150 3100 0    50   ~ 0
IBUS14
Text Label 8150 3200 0    50   ~ 0
IBUS15
Entry Bus Bus
	8650 750  8750 650 
Wire Bus Line
	8750 650  10550 650 
Text HLabel 10550 650  2    50   BiDi ~ 0
IBUS[0..15]
Text Label 10450 650  2    50   ~ 0
IBUS[0..15]
Text Label 8650 2050 3    50   ~ 0
IBUS[0..15]
Connection ~ 6850 3400
Wire Wire Line
	6850 3400 6850 7400
Text Label 6700 4600 1    50   ~ 0
Y[0..15]
Text Label 6550 5950 2    50   ~ 0
~SETL
Wire Notes Line width 20 style solid
	8900 4050 10700 4050
Wire Notes Line width 20 style solid
	10700 4050 10700 2700
Wire Notes Line width 20 style solid
	10700 2700 8900 2700
Wire Notes Line width 20 style solid
	8900 2700 8900 4050
Text Notes 9000 3950 0    50   ~ 0
The ROMs can't be tri-stated because\nthey feed into each other, and we need\nto keep the cascade as fast as possible\nand allow it to run for longer than a\nprocessor cycle, if needed. The Control\nUnit forcibly tri-states every IBus driver\nfor part of the cycle, so we use external\nbuffers and the ROM's own signals (plus\noutput control signals that shouldn't\never be tri-stated anyway) can stay\ndriven.
Text Notes 9000 2900 0    66   ~ 13
Tri-Stating
Wire Wire Line
	3850 2350 3850 4500
Wire Wire Line
	3850 2350 5000 2350
Wire Wire Line
	3850 6650 5000 6650
Wire Wire Line
	3750 2450 5000 2450
Wire Wire Line
	3750 6750 5000 6750
Wire Wire Line
	3650 2550 3650 4700
Wire Wire Line
	3650 2550 5000 2550
Wire Wire Line
	3650 6850 5000 6850
Wire Wire Line
	3850 4500 5000 4500
Connection ~ 3850 4500
Wire Wire Line
	3850 4500 3850 6650
Wire Wire Line
	3750 4600 5000 4600
Connection ~ 3750 4600
Wire Wire Line
	3750 4600 3750 2450
Wire Wire Line
	3750 6750 3750 4600
Wire Wire Line
	3650 4700 5000 4700
Connection ~ 3650 4700
Wire Wire Line
	3650 4700 3650 6850
Wire Wire Line
	3350 2250 5000 2250
Wire Wire Line
	3350 2350 3850 2350
Connection ~ 3850 2350
Wire Wire Line
	3350 2450 3750 2450
Connection ~ 3750 2450
Wire Wire Line
	3350 2550 3650 2550
Connection ~ 3650 2550
Text Label 3850 4050 3    50   ~ 0
OP0
Text Label 3750 4050 3    50   ~ 0
OP1
Text Label 3650 4050 3    50   ~ 0
OP2
Text Label 4650 2900 0    50   ~ 0
C0
Text Label 4650 2800 0    50   ~ 0
X0
Text Label 3950 4200 1    50   ~ 0
X0
Text Label 4050 4200 1    50   ~ 0
C0
Text Label 4650 5050 0    50   ~ 0
C1
Text Label 4650 4950 0    50   ~ 0
X1
Text Label 3650 5400 1    50   ~ 0
OP2
Text Label 3750 5400 1    50   ~ 0
OP1
Text Label 3850 5400 1    50   ~ 0
OP0
Text Label 3950 5400 1    50   ~ 0
X1
Text Label 4050 5400 1    50   ~ 0
C1
Wire Wire Line
	1050 2150 2350 2150
Wire Wire Line
	1050 2250 2350 2250
Wire Wire Line
	1050 2350 2350 2350
Wire Wire Line
	1050 2450 2350 2450
Wire Wire Line
	1050 2550 2350 2550
Text Label 3400 2250 0    50   ~ 0
X-IN-REG
$Comp
L power:+5V #PWR?
U 1 1 5EBBCF5C
P 10000 4800
AR Path="/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBBCF5C" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBBCF5C" Ref="#PWR0515"  Part="1" 
F 0 "#PWR0515" H 10000 4650 50  0001 C CNN
F 1 "+5V" H 10015 4973 50  0000 C CNN
F 2 "" H 10000 4800 50  0001 C CNN
F 3 "" H 10000 4800 50  0001 C CNN
	1    10000 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBBCF56
P 10000 5000
AR Path="/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBBCF56" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EBBCF56" Ref="#PWR0518"  Part="1" 
F 0 "#PWR0518" H 10000 4750 50  0001 C CNN
F 1 "GND" H 10005 4827 50  0000 C CNN
F 2 "" H 10000 5000 50  0001 C CNN
F 3 "" H 10000 5000 50  0001 C CNN
	1    10000 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EBBCF50
P 10000 4900
AR Path="/5CC0D65F/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EBBCF50" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5EBBCF50" Ref="C504"  Part="1" 
F 0 "C504" H 9909 4946 50  0000 R CNN
F 1 "100nF" H 9909 4855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10000 4900 50  0001 C CNN
F 3 "~" H 10000 4900 50  0001 C CNN
	1    10000 4900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U509
U 2 1 5F9A24A9
P 7750 4125
F 0 "U509" H 7830 4071 50  0000 L CNN
F 1 "74LVC1G08" H 7830 3980 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7400 4125 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 7400 4125 50  0001 C CNN
	2    7750 4125
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F9A4A1B
P 7300 4125
AR Path="/5F9A4A1B" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5F9A4A1B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5F9A4A1B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5F9A4A1B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5F9A4A1B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5F9A4A1B" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5F9A4A1B" Ref="#PWR0509"  Part="1" 
F 0 "#PWR0509" H 7300 3975 50  0001 C CNN
F 1 "+5V" H 7315 4298 50  0000 C CNN
F 2 "" H 7300 4125 50  0001 C CNN
F 3 "" H 7300 4125 50  0001 C CNN
	1    7300 4125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F9A4A21
P 7300 4325
AR Path="/5F9A4A21" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5F9A4A21" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5F9A4A21" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5F9A4A21" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5F9A4A21" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5F9A4A21" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5F9A4A21" Ref="#PWR0512"  Part="1" 
F 0 "#PWR0512" H 7300 4075 50  0001 C CNN
F 1 "GND" H 7305 4152 50  0000 C CNN
F 2 "" H 7300 4325 50  0001 C CNN
F 3 "" H 7300 4325 50  0001 C CNN
	1    7300 4325
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F9A4A27
P 7300 4225
AR Path="/5CC0D65F/5F9A4A27" Ref="C?"  Part="1" 
AR Path="/5F9A4A27" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5F9A4A27" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5F9A4A27" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5F9A4A27" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5F9A4A27" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5F9A4A27" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5F9A4A27" Ref="C501"  Part="1" 
F 0 "C501" H 7209 4271 50  0000 R CNN
F 1 "100nF" H 7209 4180 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7300 4225 50  0001 C CNN
F 3 "~" H 7300 4225 50  0001 C CNN
	1    7300 4225
	1    0    0    -1  
$EndComp
Connection ~ 7300 4325
Connection ~ 7300 4125
$Comp
L alexios:74HC573 U?
U 1 1 5FA80993
P 2850 2650
AR Path="/5FA80993" Ref="U?"  Part="1" 
AR Path="/5DE3C078/5FA80993" Ref="U505"  Part="1" 
F 0 "U505" H 2850 3417 50  0000 C CNN
F 1 "74HC573" H 2850 3326 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2850 2650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 2850 2650 50  0001 C CNN
F 4 "Yes" H 2275 1750 50  0001 C CNN "Verified"
	1    2850 2650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC573 U?
U 2 1 5FA82BCD
P 10500 5300
AR Path="/5FA82BCD" Ref="U?"  Part="2" 
AR Path="/5DE3C078/5FA82BCD" Ref="U505"  Part="2" 
F 0 "U505" H 10530 5746 50  0000 L CNN
F 1 "74HC573" H 10530 5655 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10500 5300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 10500 5300 50  0001 C CNN
F 4 "Yes" H 9925 4400 50  0001 C CNN "Verified"
	2    10500 5300
	1    0    0    -1  
$EndComp
Connection ~ 10000 5000
Connection ~ 10000 4800
$Comp
L alexios:74LVC1G74 U508
U 1 1 5EDD7582
P 2000 4100
F 0 "U508" H 2000 4517 50  0000 C CNN
F 1 "74LVC1G74" H 2000 4426 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 2450 4100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 2450 4100 50  0001 C CNN
	1    2000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3050 2350 3050
NoConn ~ 2450 4250
Text Label 1100 4150 0    50   ~ 0
T34
$Comp
L power:GND #PWR0507
U 1 1 5EE27417
P 1550 4050
F 0 "#PWR0507" H 1550 3800 50  0001 C CNN
F 1 "GND" V 1550 3900 50  0000 R CNN
F 2 "" H 1550 4050 50  0001 C CNN
F 3 "" H 1550 4050 50  0001 C CNN
	1    1550 4050
	0    1    1    0   
$EndComp
Text HLabel 1050 3950 0    50   Input ~ 0
~ALU-OP
Text Label 1100 3950 0    50   ~ 0
~ALU-OP
Wire Wire Line
	1050 3950 1550 3950
$Comp
L power:+5V #PWR0511
U 1 1 5EE62A5F
P 1550 4250
F 0 "#PWR0511" H 1550 4100 50  0001 C CNN
F 1 "+5V" V 1565 4378 50  0000 L CNN
F 2 "" H 1550 4250 50  0001 C CNN
F 3 "" H 1550 4250 50  0001 C CNN
	1    1550 4250
	0    -1   -1   0   
$EndComp
Text HLabel 1050 4150 0    50   Input ~ 0
T34
Wire Wire Line
	1050 4150 1550 4150
Text Label 2200 3050 2    50   ~ 0
REGLE
Wire Wire Line
	2450 3950 2850 3950
Wire Wire Line
	2850 3500 1900 3500
Wire Wire Line
	1900 3500 1900 3050
Wire Wire Line
	2850 3500 2850 3950
Text Label 2500 3950 0    50   ~ 0
REGLE
$Comp
L alexios:74LVC1G74 U508
U 2 1 5EFA221D
P 9000 4900
F 0 "U508" H 9180 4946 50  0000 L CNN
F 1 "74LVC1G74" H 9180 4855 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 9450 4900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 9450 4900 50  0001 C CNN
	2    9000 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EFA3463
P 8650 4800
AR Path="/5EFA3463" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EFA3463" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EFA3463" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EFA3463" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EFA3463" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EFA3463" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EFA3463" Ref="#PWR0514"  Part="1" 
F 0 "#PWR0514" H 8650 4650 50  0001 C CNN
F 1 "+5V" H 8665 4973 50  0000 C CNN
F 2 "" H 8650 4800 50  0001 C CNN
F 3 "" H 8650 4800 50  0001 C CNN
	1    8650 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFA3469
P 8650 5000
AR Path="/5EFA3469" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EFA3469" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EFA3469" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EFA3469" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EFA3469" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EFA3469" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EFA3469" Ref="#PWR0517"  Part="1" 
F 0 "#PWR0517" H 8650 4750 50  0001 C CNN
F 1 "GND" H 8655 4827 50  0000 C CNN
F 2 "" H 8650 5000 50  0001 C CNN
F 3 "" H 8650 5000 50  0001 C CNN
	1    8650 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EFA346F
P 8650 4900
AR Path="/5CC0D65F/5EFA346F" Ref="C?"  Part="1" 
AR Path="/5EFA346F" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EFA346F" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EFA346F" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EFA346F" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EFA346F" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EFA346F" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5EFA346F" Ref="C503"  Part="1" 
F 0 "C503" H 8559 4946 50  0000 R CNN
F 1 "100nF" H 8559 4855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 4900 50  0001 C CNN
F 3 "~" H 8650 4900 50  0001 C CNN
	1    8650 4900
	1    0    0    -1  
$EndComp
Connection ~ 8650 4800
Connection ~ 8650 5000
Text Label 9500 1700 0    50   ~ 0
FLOUT
Wire Wire Line
	9500 1700 10550 1700
Wire Notes Line
	1225 4500 1225 5375
Text Notes 1275 5325 0    50   ~ 0
Operation\n\nTwo's complement addition\nBitwise disjunction\nBitwise conjunction\nBitwise complementation\nBitwise exclusive OR\nReserved\nReserved\nReserved\n
Text Notes 750  5325 0    50   ~ 0
 OP\n\n000\n001\n010\n011\n100\n101\n110\n111
Wire Notes Line
	950  4500 950  5375
Wire Notes Line style solid
	700  4625 2550 4625
Wire Notes Line width 20 style solid
	700  5375 700  4500
Wire Notes Line width 20 style solid
	2550 5375 700  5375
Wire Notes Line width 20 style solid
	2550 4500 2550 5375
Wire Notes Line width 20 style solid
	700  4500 2550 4500
Text Notes 1000 5325 0    50   ~ 0
Instr\n\nADD\nAND\nOR\nNOT\nXOR\nN/A\nN/A\nN/A
Text Notes 9500 1850 0    50   ~ 10
FLOUT toggles L on carry out.
Wire Notes Line width 20 style solid
	800  7000 3500 7000
Wire Notes Line width 20 style solid
	3500 7000 3500 5550
Wire Notes Line width 20 style solid
	3500 5550 800  5550
Wire Notes Line width 20 style solid
	800  5550 800  7000
Text Notes 900  6900 0    50   ~ 0
55 ns ROMs must be used. These are the fastest 1Mbit 5V\nparallel devices in existence, but carry propagation triples\ntheir access time when calculationg addition.\n\nTo mitigate the problem, the circuit fully buffers the ROMs'\naddresses and separate buffers isolate them from the IBus.\n\nMicrocode is structured carefully to first perform a dummy read\nfrom the ALU. This latches the operation, and then a full\n250 ns cycle later the microcode reads the ALU Y port value to\ncomplete the operation. This is only necessary for ADD—bitwise\noperations cascade no bits and the result is available within\none cycle.
Text Notes 900  5750 0    66   ~ 13
Timing
Text Notes 5900 750  2    63   ~ 13
55 ns devices!
Text Label 3750 2150 0    50   ~ 0
FL-REG
Wire Wire Line
	3350 2150 3450 2150
Wire Wire Line
	3450 1800 3450 2150
$Comp
L power:GND #PWR0501
U 1 1 5F0DF581
P 3900 1850
F 0 "#PWR0501" H 3900 1600 50  0001 C CNN
F 1 "GND" H 4000 1700 50  0000 C CNN
F 2 "" H 3900 1850 50  0001 C CNN
F 3 "" H 3900 1850 50  0001 C CNN
	1    3900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1800 3900 1850
Wire Wire Line
	3700 2150 5000 2150
Text Notes 3500 1600 0    50   ~ 0
1-2 = ADD\n2-3 = ADC
$Comp
L alexios:SolderJumper_3_Bridged12 JP501
U 1 1 5F119A09
P 3700 1800
F 0 "JP501" H 3700 1913 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 3700 1910 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm_NumberLabels" H 3700 1800 50  0001 C CNN
F 3 "~" H 3700 1800 50  0001 C CNN
	1    3700 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1800 3550 1800
Wire Wire Line
	3850 1800 3900 1800
Wire Wire Line
	3700 1900 3700 2150
Wire Bus Line
	8650 750  8650 3100
Wire Bus Line
	4250 900  4250 6050
Wire Bus Line
	4450 750  4450 5450
Wire Bus Line
	6700 1050 6700 5450
$EndSCHEMATC
