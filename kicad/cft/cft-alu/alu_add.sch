EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3700 1200 0    50   ~ 0
FL
Text HLabel 1050 1200 0    50   3State ~ 0
CIN
Text HLabel 1050 7300 0    50   3State ~ 0
~OE
Text HLabel 1050 7000 0    50   Input ~ 0
B[0..15]
Text HLabel 1050 6800 0    50   Input ~ 0
A[0..15]
Wire Bus Line
	3400 7000 3600 6800
Text Label 1150 7000 0    50   ~ 0
B[0..15]
Text Label 1150 6800 0    50   ~ 0
A[0..15]
Text Label 3600 4200 1    50   ~ 0
B[0..15]
Text Label 3450 4200 1    50   ~ 0
A[0..15]
Wire Bus Line
	3400 7000 1050 7000
Wire Bus Line
	3350 6800 1050 6800
Entry Bus Bus
	3350 6800 3450 6700
Text Label 3700 6050 0    50   ~ 0
A15
Text Label 3700 5950 0    50   ~ 0
A14
Text Label 3700 5850 0    50   ~ 0
A13
Text Label 3700 5750 0    50   ~ 0
A12
Text Label 3700 4600 0    50   ~ 0
A11
Text Label 3700 4500 0    50   ~ 0
A10
Text Label 3700 4400 0    50   ~ 0
A9
Text Label 3700 4300 0    50   ~ 0
A8
Text Label 3700 3150 0    50   ~ 0
A7
Text Label 3700 3050 0    50   ~ 0
A6
Text Label 3700 2950 0    50   ~ 0
A5
Text Label 3700 2850 0    50   ~ 0
A4
Entry Wire Line
	3700 6550 3600 6650
Entry Wire Line
	3700 6450 3600 6550
Entry Wire Line
	3700 6350 3600 6450
Entry Wire Line
	3700 6250 3600 6350
Entry Wire Line
	3550 6050 3450 6150
Entry Wire Line
	3550 5950 3450 6050
Entry Wire Line
	3550 5850 3450 5950
Entry Wire Line
	3550 5750 3450 5850
Entry Wire Line
	3700 5100 3600 5200
Entry Wire Line
	3700 5000 3600 5100
Entry Wire Line
	3700 4900 3600 5000
Entry Wire Line
	3700 4800 3600 4900
Entry Wire Line
	3550 4600 3450 4700
Entry Wire Line
	3550 4500 3450 4600
Entry Wire Line
	3550 4400 3450 4500
Entry Wire Line
	3550 4300 3450 4400
Entry Wire Line
	3700 3650 3600 3750
Entry Wire Line
	3700 3550 3600 3650
Entry Wire Line
	3700 3450 3600 3550
Entry Wire Line
	3700 3350 3600 3450
Entry Wire Line
	3550 3150 3450 3250
Entry Wire Line
	3550 3050 3450 3150
Entry Wire Line
	3550 2950 3450 3050
Entry Wire Line
	3550 2850 3450 2950
Entry Wire Line
	3700 2200 3600 2300
Entry Wire Line
	3700 2100 3600 2200
Entry Wire Line
	3700 2000 3600 2100
Entry Wire Line
	3700 1900 3600 2000
Entry Wire Line
	3550 1700 3450 1800
Entry Wire Line
	3550 1600 3450 1700
Entry Wire Line
	3550 1500 3450 1600
Entry Wire Line
	3550 1400 3450 1500
Text HLabel 10700 6050 2    50   Output ~ 0
COUT
Text Label 5150 6050 0    50   ~ 0
COUT
Text Label 5900 2250 3    50   ~ 0
ADD[0..15]
Text Label 5400 1950 3    50   ~ 0
ADD[0..15]
Wire Wire Line
	5750 3550 5750 4150
Wire Wire Line
	6450 3550 5750 3550
$Comp
L power:GND #PWR?
U 1 1 5E03CE26
P 6450 3650
AR Path="/5DC89E19/5E03CE26" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CE26" Ref="#PWR02714"  Part="1" 
F 0 "#PWR02714" H 6450 3400 50  0001 C CNN
F 1 "GND" H 6455 3477 50  0000 C CNN
F 2 "" H 6450 3650 50  0001 C CNN
F 3 "" H 6450 3650 50  0001 C CNN
	1    6450 3650
	1    0    0    -1  
$EndComp
Text Label 6050 3350 0    50   ~ 0
ADD15
Text Label 6050 3250 0    50   ~ 0
ADD14
Text Label 6050 3150 0    50   ~ 0
ADD13
Text Label 6050 3050 0    50   ~ 0
ADD12
Text Label 6050 2950 0    50   ~ 0
ADD11
Text Label 6050 2850 0    50   ~ 0
ADD10
Text Label 6050 2750 0    50   ~ 0
ADD9
Text Label 6050 2650 0    50   ~ 0
ADD8
Entry Wire Line
	5900 2550 6000 2650
Entry Wire Line
	5900 2650 6000 2750
Entry Wire Line
	5900 2750 6000 2850
Entry Wire Line
	5900 2850 6000 2950
Entry Wire Line
	5900 2950 6000 3050
Entry Wire Line
	5900 3050 6000 3150
Entry Wire Line
	5900 3150 6000 3250
Entry Wire Line
	5900 3250 6000 3350
Wire Wire Line
	6000 2650 6450 2650
Wire Wire Line
	6000 2750 6450 2750
Wire Wire Line
	6000 2850 6450 2850
Wire Wire Line
	6000 2950 6450 2950
Wire Wire Line
	6000 3050 6450 3050
Wire Wire Line
	6000 3150 6450 3150
Wire Wire Line
	6000 3250 6450 3250
Wire Wire Line
	6000 3350 6450 3350
Connection ~ 5750 3550
Wire Wire Line
	5750 2100 5750 3550
Wire Wire Line
	5750 7300 1050 7300
Text Label 1150 7300 0    50   ~ 0
~OE
$Comp
L alexios:74HC541 U?
U 1 1 5E03CE48
P 6950 3150
AR Path="/5DC89E19/5E03CE48" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CE48" Ref="U2706"  Part="1" 
F 0 "U2706" H 6950 2450 50  0000 C CNN
F 1 "74HC541" H 6950 2350 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6950 3150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6950 3150 50  0001 C CNN
	1    6950 3150
	1    0    0    -1  
$EndComp
Text Label 7450 3350 0    50   ~ 0
Y15
Text Label 7450 3250 0    50   ~ 0
Y14
Text Label 7450 3150 0    50   ~ 0
Y13
Text Label 7450 3050 0    50   ~ 0
Y12
Text Label 7450 2950 0    50   ~ 0
Y11
Text Label 7450 2850 0    50   ~ 0
Y10
Text Label 7450 2750 0    50   ~ 0
Y9
Text Label 7450 2650 0    50   ~ 0
Y8
Wire Wire Line
	7450 3350 7750 3350
Wire Wire Line
	7450 3250 7750 3250
Wire Wire Line
	7450 3150 7750 3150
Wire Wire Line
	7450 3050 7750 3050
Wire Wire Line
	7450 2950 7750 2950
Wire Wire Line
	7450 2850 7750 2850
Wire Wire Line
	7450 2750 7750 2750
Wire Wire Line
	7450 2650 7750 2650
Entry Wire Line
	5900 1100 6000 1200
Entry Wire Line
	5900 1200 6000 1300
Entry Wire Line
	5900 1300 6000 1400
Entry Wire Line
	5900 1400 6000 1500
Entry Bus Bus
	5900 1000 5800 900 
Entry Wire Line
	5900 1500 6000 1600
Entry Wire Line
	5900 1600 6000 1700
Entry Wire Line
	5900 1700 6000 1800
Entry Wire Line
	5900 1800 6000 1900
Wire Wire Line
	6000 1200 6450 1200
Wire Wire Line
	6000 1300 6450 1300
Wire Wire Line
	6000 1400 6450 1400
Wire Wire Line
	6000 1500 6450 1500
Wire Bus Line
	5500 900  5800 900 
Wire Wire Line
	6000 1600 6450 1600
Wire Wire Line
	6000 1700 6450 1700
Wire Wire Line
	6000 1800 6450 1800
Wire Wire Line
	6000 1900 6450 1900
Text Label 6050 1200 0    50   ~ 0
ADD0
Text Label 6050 1300 0    50   ~ 0
ADD1
Text Label 6050 1400 0    50   ~ 0
ADD2
Text Label 6050 1500 0    50   ~ 0
ADD3
Text Label 6050 1600 0    50   ~ 0
ADD4
Text Label 6050 1700 0    50   ~ 0
ADD5
$Comp
L power:GND #PWR?
U 1 1 5E03CE78
P 6450 2200
AR Path="/5DC89E19/5E03CE78" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CE78" Ref="#PWR02713"  Part="1" 
F 0 "#PWR02713" H 6450 1950 50  0001 C CNN
F 1 "GND" H 6455 2027 50  0000 C CNN
F 2 "" H 6450 2200 50  0001 C CNN
F 3 "" H 6450 2200 50  0001 C CNN
	1    6450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2100 5750 2100
Text Label 7450 1900 0    50   ~ 0
Y7
Text Label 7450 1800 0    50   ~ 0
Y6
Text Label 7450 1700 0    50   ~ 0
Y5
Text Label 7450 1600 0    50   ~ 0
Y4
Text Label 7450 1500 0    50   ~ 0
Y3
Text Label 7450 1400 0    50   ~ 0
Y2
Text Label 7450 1300 0    50   ~ 0
Y1
Text Label 7450 1200 0    50   ~ 0
Y0
Wire Wire Line
	7450 1900 7750 1900
Wire Wire Line
	7450 1800 7750 1800
Wire Wire Line
	7450 1700 7750 1700
Wire Wire Line
	7450 1600 7750 1600
Wire Wire Line
	7450 1500 7750 1500
Wire Wire Line
	7450 1400 7750 1400
Wire Wire Line
	7450 1300 7750 1300
Wire Wire Line
	7450 1200 7750 1200
$Comp
L alexios:74HC541 U?
U 1 1 5E03CE8F
P 6950 1700
AR Path="/5DC89E19/5E03CE8F" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CE8F" Ref="U2705"  Part="1" 
F 0 "U2705" H 6950 2467 50  0000 C CNN
F 1 "74HC541" H 6950 2376 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6950 1700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6950 1700 50  0001 C CNN
	1    6950 1700
	1    0    0    -1  
$EndComp
Entry Bus Bus
	5400 1000 5500 900 
Entry Wire Line
	5400 5750 5300 5850
Entry Wire Line
	5400 5650 5300 5750
Entry Wire Line
	5400 5550 5300 5650
Entry Wire Line
	5400 5450 5300 5550
Entry Wire Line
	5400 4300 5300 4400
Entry Wire Line
	5400 4200 5300 4300
Entry Wire Line
	5400 4100 5300 4200
Entry Wire Line
	5400 4000 5300 4100
Entry Wire Line
	5400 2850 5300 2950
Entry Wire Line
	5400 2750 5300 2850
Entry Wire Line
	5400 2650 5300 2750
Entry Wire Line
	5400 2550 5300 2650
Entry Wire Line
	5400 1400 5300 1500
Entry Wire Line
	5400 1300 5300 1400
Entry Wire Line
	5400 1200 5300 1300
Entry Wire Line
	5400 1100 5300 1200
Wire Wire Line
	3950 5550 4000 5550
Wire Wire Line
	3950 5300 3950 5550
Wire Wire Line
	3950 4100 4000 4100
Wire Wire Line
	3950 3850 3950 4100
Text Label 3700 6550 0    50   ~ 0
B15
Text Label 3700 6450 0    50   ~ 0
B14
Text Label 3700 6350 0    50   ~ 0
B13
Text Label 3700 6250 0    50   ~ 0
B12
Text Label 3700 5100 0    50   ~ 0
B11
Text Label 3700 5000 0    50   ~ 0
B10
Text Label 3700 4900 0    50   ~ 0
B9
Text Label 3700 4800 0    50   ~ 0
B8
Text Label 3700 3650 0    50   ~ 0
B7
Text Label 3700 3550 0    50   ~ 0
B6
Text Label 3700 3450 0    50   ~ 0
B5
Text Label 3700 3350 0    50   ~ 0
B4
Text Label 3700 2200 0    50   ~ 0
B3
Text Label 3700 2100 0    50   ~ 0
B2
Text Label 3700 2000 0    50   ~ 0
B1
Text Label 3700 1900 0    50   ~ 0
B0
Wire Wire Line
	4000 6550 3700 6550
Wire Wire Line
	4000 6450 3700 6450
Wire Wire Line
	4000 6350 3700 6350
Wire Wire Line
	4000 6250 3700 6250
Wire Wire Line
	4000 6050 3550 6050
Wire Wire Line
	4000 5950 3550 5950
Wire Wire Line
	4000 5850 3550 5850
Wire Wire Line
	4000 5750 3550 5750
Wire Wire Line
	4000 5100 3700 5100
Wire Wire Line
	4000 5000 3700 5000
Wire Wire Line
	4000 4900 3700 4900
Wire Wire Line
	4000 4800 3700 4800
Wire Wire Line
	4000 4600 3550 4600
Wire Wire Line
	4000 4500 3550 4500
Wire Wire Line
	4000 4400 3550 4400
Wire Wire Line
	4000 4300 3550 4300
Wire Wire Line
	4000 3650 3700 3650
Wire Wire Line
	4000 3550 3700 3550
Wire Wire Line
	4000 3450 3700 3450
Wire Wire Line
	4000 3350 3700 3350
Wire Wire Line
	4000 3150 3550 3150
Wire Wire Line
	4000 3050 3550 3050
Wire Wire Line
	4000 2950 3550 2950
Wire Wire Line
	4000 2850 3550 2850
Wire Wire Line
	4000 2200 3700 2200
Wire Wire Line
	4000 2100 3700 2100
Wire Wire Line
	4000 2000 3700 2000
Wire Wire Line
	4000 1900 3700 1900
Text Label 3700 1700 0    50   ~ 0
A3
Text Label 3700 1600 0    50   ~ 0
A2
Text Label 3700 1500 0    50   ~ 0
A1
Text Label 3700 1400 0    50   ~ 0
A0
Wire Wire Line
	4000 1700 3550 1700
Wire Wire Line
	4000 1600 3550 1600
Wire Wire Line
	4000 1500 3550 1500
Wire Wire Line
	4000 1400 3550 1400
Text Label 1150 1200 0    50   ~ 0
CIN
Wire Wire Line
	4000 1200 1050 1200
Wire Wire Line
	5300 5300 3950 5300
Wire Wire Line
	5300 4600 5300 5300
Wire Wire Line
	5300 3850 3950 3850
Wire Wire Line
	5300 3150 5300 3850
Wire Wire Line
	3950 2650 4000 2650
Wire Wire Line
	3950 2400 3950 2650
Wire Wire Line
	5300 2400 3950 2400
Wire Wire Line
	5300 1700 5300 2400
Text Label 5300 5850 2    50   ~ 0
ADD15
Text Label 5300 5750 2    50   ~ 0
ADD14
Text Label 5300 5650 2    50   ~ 0
ADD13
Text Label 5300 5550 2    50   ~ 0
ADD12
Text Label 5300 4400 2    50   ~ 0
ADD11
Text Label 5300 4300 2    50   ~ 0
ADD10
Text Label 5300 4200 2    50   ~ 0
ADD9
Text Label 5300 4100 2    50   ~ 0
ADD8
Text Label 5300 2950 2    50   ~ 0
ADD7
Text Label 5300 2850 2    50   ~ 0
ADD6
Text Label 5300 2750 2    50   ~ 0
ADD5
Text Label 5300 2650 2    50   ~ 0
ADD4
Text Label 5300 1500 2    50   ~ 0
ADD3
Text Label 5300 1400 2    50   ~ 0
ADD2
Text Label 5300 1300 2    50   ~ 0
ADD1
Text Label 5300 1200 2    50   ~ 0
ADD0
Wire Wire Line
	5000 5850 5300 5850
Wire Wire Line
	5000 5750 5300 5750
Wire Wire Line
	5000 5650 5300 5650
Wire Wire Line
	5000 5550 5300 5550
Wire Wire Line
	5000 4600 5300 4600
Wire Wire Line
	5000 4400 5300 4400
Wire Wire Line
	5000 4300 5300 4300
Wire Wire Line
	5000 4200 5300 4200
Wire Wire Line
	5000 4100 5300 4100
Wire Wire Line
	5000 3150 5300 3150
Wire Wire Line
	5000 2950 5300 2950
Wire Wire Line
	5000 2850 5300 2850
Wire Wire Line
	5000 2750 5300 2750
Wire Wire Line
	5000 2650 5300 2650
Wire Wire Line
	5000 1700 5300 1700
Wire Wire Line
	5000 1500 5300 1500
Wire Wire Line
	5000 1400 5300 1400
Wire Wire Line
	5000 1300 5300 1300
Wire Wire Line
	5000 1200 5300 1200
$Comp
L alexios:74AC283 U?
U 1 1 5E03CF1D
P 4500 3150
AR Path="/5DC89E19/5E03CF1D" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CF1D" Ref="U2702"  Part="1" 
F 0 "U2702" H 4900 3000 50  0000 L CNN
F 1 "74AC283" H 4900 2900 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4500 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74ac283.pdf" H 4500 3550 50  0001 C CNN
	1    4500 3150
	1    0    0    -1  
$EndComp
Text Notes 7100 7000 0    197  ~ 39
16-bit Full Adder
Wire Wire Line
	5000 6050 10700 6050
$Comp
L alexios:74AC283 U?
U 1 1 5E03CEF4
P 4500 1700
AR Path="/5DC89E19/5E03CEF4" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CEF4" Ref="U2701"  Part="1" 
F 0 "U2701" H 4900 1550 50  0000 L CNN
F 1 "74AC283" H 4900 1450 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4500 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74ac283.pdf" H 4500 2100 50  0001 C CNN
	1    4500 1700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC283 U?
U 1 1 5E03CEEE
P 4500 4600
AR Path="/5DC89E19/5E03CEEE" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CEEE" Ref="U2703"  Part="1" 
F 0 "U2703" H 4900 4450 50  0000 L CNN
F 1 "74AC283" H 4900 4350 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4500 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74ac283.pdf" H 4500 5000 50  0001 C CNN
	1    4500 4600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC283 U?
U 1 1 5E03CEE8
P 4500 6050
AR Path="/5DC89E19/5E03CEE8" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CEE8" Ref="U2704"  Part="1" 
F 0 "U2704" H 4900 5900 50  0000 L CNN
F 1 "74AC283" H 4900 5800 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4500 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74ac283.pdf" H 4500 6450 50  0001 C CNN
	1    4500 6050
	1    0    0    -1  
$EndComp
Text Label 6050 1800 0    50   ~ 0
ADD6
Text Label 6050 1900 0    50   ~ 0
ADD7
Text Notes 9850 4750 0    50   ~ 0
Overflow flag set if A15 = B15\nbefore addition, and A15 ≠ Y15\nafter.
Text Notes 10200 5650 0    50   ~ 0
A15\n\n 0\n 0\n 0\n 0\n 1\n 1\n 1\n 1
Text Notes 10400 5650 0    50   ~ 0
B15\n\n 0\n 0\n 1\n 1\n 0\n 0\n 1\n 1\n
Text Notes 10850 5650 0    50   ~ 0
FV\n\n 0\n 1\n 0\n 0\n 0\n 0\n 1\n 0
Wire Wire Line
	8450 5200 8950 5200
Wire Wire Line
	8450 5300 8950 5300
Text Label 8450 5200 0    50   ~ 0
A15
Text Label 8450 5300 0    50   ~ 0
B15
Wire Wire Line
	8450 5400 8950 5400
Text Label 8450 5400 0    50   ~ 0
ADD15
$Comp
L alexios:74AC251 U?
U 1 1 5DD50076
P 9450 4900
AR Path="/5DC89E19/5DD50076" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DD50076" Ref="U2708"  Part="1" 
F 0 "U2708" H 9450 4025 50  0000 C CNN
F 1 "74AC251" H 9450 3934 50  0000 C CNN
F 2 "alexios:SOIC-16" H 9450 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 9450 4850 50  0001 C CNN
	1    9450 4900
	1    0    0    -1  
$EndComp
Text Notes 10600 5650 0    50   ~ 0
Y15\n\n 0\n 1\n X\n X\n X\n X\n 0\n 1\n
NoConn ~ 9950 4400
$Comp
L power:GND #PWR?
U 1 1 5DD5007E
P 8900 5650
AR Path="/5DC89E19/5DD5007E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DD5007E" Ref="#PWR02717"  Part="1" 
F 0 "#PWR02717" H 8900 5400 50  0001 C CNN
F 1 "GND" H 8905 5477 50  0000 C CNN
F 2 "" H 8900 5650 50  0001 C CNN
F 3 "" H 8900 5650 50  0001 C CNN
	1    8900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5650 8900 5600
Wire Wire Line
	8950 4300 8900 4300
Wire Wire Line
	8950 4500 8900 4500
Connection ~ 8900 4500
Wire Wire Line
	8900 4500 8900 4300
Wire Wire Line
	8950 4600 8900 4600
Connection ~ 8900 4600
Wire Wire Line
	8900 4600 8900 4500
Wire Wire Line
	8950 4700 8900 4700
Connection ~ 8900 4700
Wire Wire Line
	8900 4700 8900 4600
Wire Wire Line
	8950 4800 8900 4800
Connection ~ 8900 4800
Wire Wire Line
	8900 4800 8900 4700
Wire Wire Line
	8950 5000 8900 5000
Connection ~ 8900 5000
Wire Wire Line
	8900 5000 8900 4800
$Comp
L power:+5V #PWR?
U 1 1 5DD50095
P 8850 4400
AR Path="/5DC89E19/5DD50095" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DD50095" Ref="#PWR02715"  Part="1" 
F 0 "#PWR02715" H 8850 4250 50  0001 C CNN
F 1 "+5V" V 8865 4528 50  0000 L CNN
F 2 "" H 8850 4400 50  0001 C CNN
F 3 "" H 8850 4400 50  0001 C CNN
	1    8850 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8850 4400 8950 4400
$Comp
L power:+5V #PWR?
U 1 1 5DD5009C
P 8850 4900
AR Path="/5DC89E19/5DD5009C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DD5009C" Ref="#PWR02716"  Part="1" 
F 0 "#PWR02716" H 8850 4750 50  0001 C CNN
F 1 "+5V" V 8865 5028 50  0000 L CNN
F 2 "" H 8850 4900 50  0001 C CNN
F 3 "" H 8850 4900 50  0001 C CNN
	1    8850 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8850 4900 8950 4900
Wire Wire Line
	8950 5600 8900 5600
Connection ~ 8900 5600
Wire Wire Line
	8900 5600 8900 5000
Wire Notes Line width 20 style solid
	10150 4800 11000 4800
Wire Notes Line
	10800 4800 10800 5700
Wire Notes Line width 20 style solid
	10150 4800 10150 5700
Wire Notes Line width 20 style solid
	10150 5700 11000 5700
Wire Notes Line width 20 style solid
	11000 4800 11000 5700
Wire Notes Line style solid
	10150 4950 11000 4950
Text Notes 9000 3100 0    79   ~ 16
Overlfow Flag
$Comp
L alexios:74LVC1G74 U?
U 1 1 5DD500AD
P 9450 3650
AR Path="/5DC89E19/5DD500AD" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DD500AD" Ref="U2707"  Part="1" 
F 0 "U2707" H 9450 4067 50  0000 C CNN
F 1 "74LVC1G74" H 9450 3976 50  0000 C CNN
F 2 "Housings_SSOP:SSOP-8_2.95x2.8mm_Pitch0.65mm" H 9900 3650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 9900 3650 50  0001 C CNN
	1    9450 3650
	1    0    0    -1  
$EndComp
NoConn ~ 9900 3800
Wire Wire Line
	9950 4300 10000 4300
Wire Wire Line
	10000 4300 10000 4050
Wire Wire Line
	10000 4050 8900 4050
Wire Wire Line
	8900 4050 8900 3600
Wire Wire Line
	8900 3600 9000 3600
Text Label 8150 3700 0    50   ~ 0
~OE
Text Label 8150 3800 0    50   ~ 0
~RESET
$Comp
L power:+5V #PWR?
U 1 1 5DD500BF
P 9000 3500
AR Path="/5DC89E19/5DD500BF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DD500BF" Ref="#PWR02718"  Part="1" 
F 0 "#PWR02718" H 9000 3350 50  0001 C CNN
F 1 "+5V" H 9015 3673 50  0000 C CNN
F 2 "" H 9000 3500 50  0001 C CNN
F 3 "" H 9000 3500 50  0001 C CNN
	1    9000 3500
	1    0    0    -1  
$EndComp
Entry Wire Line
	7750 1200 7850 1100
Entry Wire Line
	7750 1300 7850 1200
Entry Wire Line
	7750 1400 7850 1300
Entry Wire Line
	7750 1500 7850 1400
Entry Wire Line
	7750 1600 7850 1500
Entry Wire Line
	7750 1700 7850 1600
Entry Wire Line
	7750 1800 7850 1700
Entry Wire Line
	7750 1900 7850 1800
Entry Wire Line
	7750 2650 7850 2550
Entry Wire Line
	7750 2750 7850 2650
Entry Wire Line
	7750 2850 7850 2750
Entry Wire Line
	7750 2950 7850 2850
Entry Wire Line
	7750 3050 7850 2950
Entry Wire Line
	7750 3150 7850 3050
Entry Wire Line
	7750 3250 7850 3150
Entry Wire Line
	7750 3350 7850 3250
Entry Bus Bus
	7850 1000 7950 900 
Text Label 8050 900  0    50   ~ 0
Y[0..15]
Text Label 7850 2400 1    50   ~ 0
Y[0..15]
Wire Wire Line
	5750 4150 7450 4150
Wire Wire Line
	7450 4150 7450 3700
Wire Wire Line
	7450 3700 9000 3700
Connection ~ 5750 4150
Wire Wire Line
	5750 4150 5750 7300
Wire Wire Line
	1050 7450 5850 7450
Wire Wire Line
	5850 7450 5850 4250
Wire Wire Line
	5850 4250 7550 4250
Wire Wire Line
	7550 4250 7550 3800
Wire Wire Line
	7550 3800 9000 3800
Text HLabel 1050 7450 0    50   Input ~ 0
~RESET
Text Label 1150 7450 0    50   ~ 0
~RESET
$Comp
L alexios:74AC283 U?
U 2 1 5E03CDCE
P 2100 2500
AR Path="/5DC89E19/5E03CDCE" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5E018EB3/5E03CDCE" Ref="U2701"  Part="2" 
F 0 "U2701" H 2280 2946 50  0000 L CNN
F 1 "74AC283" H 2280 2855 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2100 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74ac283.pdf" H 2100 2900 50  0001 C CNN
	2    2100 2500
	1    0    0    -1  
$EndComp
Connection ~ 1750 2000
Connection ~ 1750 2200
$Comp
L alexios:74AC283 U?
U 2 1 5E03CDBC
P 2100 3250
AR Path="/5DC89E19/5E03CDBC" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5E018EB3/5E03CDBC" Ref="U2702"  Part="2" 
F 0 "U2702" H 2280 3696 50  0000 L CNN
F 1 "74AC283" H 2280 3605 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2100 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74ac283.pdf" H 2100 3650 50  0001 C CNN
	2    2100 3250
	1    0    0    -1  
$EndComp
Connection ~ 1750 2750
Connection ~ 1750 2950
$Comp
L alexios:74AC283 U?
U 2 1 5E03CDB4
P 2100 4000
AR Path="/5DC89E19/5E03CDB4" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5E018EB3/5E03CDB4" Ref="U2703"  Part="2" 
F 0 "U2703" H 2280 4446 50  0000 L CNN
F 1 "74AC283" H 2280 4355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2100 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74ac283.pdf" H 2100 4400 50  0001 C CNN
	2    2100 4000
	1    0    0    -1  
$EndComp
Connection ~ 1750 3500
Connection ~ 1750 3700
$Comp
L alexios:74AC283 U?
U 2 1 5E03CDAC
P 2100 4750
AR Path="/5DC89E19/5E03CDAC" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5E018EB3/5E03CDAC" Ref="U2704"  Part="2" 
F 0 "U2704" H 2280 5196 50  0000 L CNN
F 1 "74AC283" H 2280 5105 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2100 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74ac283.pdf" H 2100 5150 50  0001 C CNN
	2    2100 4750
	1    0    0    -1  
$EndComp
Connection ~ 1750 4250
Connection ~ 1750 4450
$Comp
L Device:C_Small C?
U 1 1 5E03CD9C
P 1750 2100
AR Path="/5CC0D65F/5E03CD9C" Ref="C?"  Part="1" 
AR Path="/5E03CD9C" Ref="C?"  Part="1" 
AR Path="/5EF76914/5E03CD9C" Ref="C?"  Part="1" 
AR Path="/6A313729/5E03CD9C" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E03CD9C" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD9C" Ref="C2701"  Part="1" 
F 0 "C2701" H 1659 2146 50  0000 R CNN
F 1 "100nF" H 1659 2055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1750 2100 50  0001 C CNN
F 3 "~" H 1750 2100 50  0001 C CNN
	1    1750 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E03CD96
P 1750 2000
AR Path="/5E03CD96" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD96" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD96" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD96" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD96" Ref="#PWR02701"  Part="1" 
F 0 "#PWR02701" H 1750 1850 50  0001 C CNN
F 1 "+5V" H 1765 2173 50  0000 C CNN
F 2 "" H 1750 2000 50  0001 C CNN
F 3 "" H 1750 2000 50  0001 C CNN
	1    1750 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E03CD90
P 1750 2200
AR Path="/5E03CD90" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD90" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD90" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD90" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD90" Ref="#PWR02702"  Part="1" 
F 0 "#PWR02702" H 1750 1950 50  0001 C CNN
F 1 "GND" H 1755 2027 50  0000 C CNN
F 2 "" H 1750 2200 50  0001 C CNN
F 3 "" H 1750 2200 50  0001 C CNN
	1    1750 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E03CD8A
P 1750 2850
AR Path="/5CC0D65F/5E03CD8A" Ref="C?"  Part="1" 
AR Path="/5E03CD8A" Ref="C?"  Part="1" 
AR Path="/5EF76914/5E03CD8A" Ref="C?"  Part="1" 
AR Path="/6A313729/5E03CD8A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E03CD8A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD8A" Ref="C2702"  Part="1" 
F 0 "C2702" H 1659 2896 50  0000 R CNN
F 1 "100nF" H 1659 2805 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1750 2850 50  0001 C CNN
F 3 "~" H 1750 2850 50  0001 C CNN
	1    1750 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E03CD84
P 1750 2750
AR Path="/5E03CD84" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD84" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD84" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD84" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD84" Ref="#PWR02703"  Part="1" 
F 0 "#PWR02703" H 1750 2600 50  0001 C CNN
F 1 "+5V" H 1765 2923 50  0000 C CNN
F 2 "" H 1750 2750 50  0001 C CNN
F 3 "" H 1750 2750 50  0001 C CNN
	1    1750 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E03CD7E
P 1750 2950
AR Path="/5E03CD7E" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD7E" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD7E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD7E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD7E" Ref="#PWR02704"  Part="1" 
F 0 "#PWR02704" H 1750 2700 50  0001 C CNN
F 1 "GND" H 1755 2777 50  0000 C CNN
F 2 "" H 1750 2950 50  0001 C CNN
F 3 "" H 1750 2950 50  0001 C CNN
	1    1750 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E03CD78
P 1750 3600
AR Path="/5CC0D65F/5E03CD78" Ref="C?"  Part="1" 
AR Path="/5E03CD78" Ref="C?"  Part="1" 
AR Path="/5EF76914/5E03CD78" Ref="C?"  Part="1" 
AR Path="/6A313729/5E03CD78" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E03CD78" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD78" Ref="C2703"  Part="1" 
F 0 "C2703" H 1659 3646 50  0000 R CNN
F 1 "100nF" H 1659 3555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1750 3600 50  0001 C CNN
F 3 "~" H 1750 3600 50  0001 C CNN
	1    1750 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E03CD72
P 1750 3500
AR Path="/5E03CD72" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD72" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD72" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD72" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD72" Ref="#PWR02705"  Part="1" 
F 0 "#PWR02705" H 1750 3350 50  0001 C CNN
F 1 "+5V" H 1765 3673 50  0000 C CNN
F 2 "" H 1750 3500 50  0001 C CNN
F 3 "" H 1750 3500 50  0001 C CNN
	1    1750 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E03CD6C
P 1750 3700
AR Path="/5E03CD6C" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD6C" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD6C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD6C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD6C" Ref="#PWR02706"  Part="1" 
F 0 "#PWR02706" H 1750 3450 50  0001 C CNN
F 1 "GND" H 1755 3527 50  0000 C CNN
F 2 "" H 1750 3700 50  0001 C CNN
F 3 "" H 1750 3700 50  0001 C CNN
	1    1750 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E03CD66
P 1750 4350
AR Path="/5CC0D65F/5E03CD66" Ref="C?"  Part="1" 
AR Path="/5E03CD66" Ref="C?"  Part="1" 
AR Path="/5EF76914/5E03CD66" Ref="C?"  Part="1" 
AR Path="/6A313729/5E03CD66" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E03CD66" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD66" Ref="C2704"  Part="1" 
F 0 "C2704" H 1659 4396 50  0000 R CNN
F 1 "100nF" H 1659 4305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1750 4350 50  0001 C CNN
F 3 "~" H 1750 4350 50  0001 C CNN
	1    1750 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E03CD60
P 1750 4250
AR Path="/5E03CD60" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD60" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD60" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD60" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD60" Ref="#PWR02707"  Part="1" 
F 0 "#PWR02707" H 1750 4100 50  0001 C CNN
F 1 "+5V" H 1765 4423 50  0000 C CNN
F 2 "" H 1750 4250 50  0001 C CNN
F 3 "" H 1750 4250 50  0001 C CNN
	1    1750 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E03CD5A
P 1750 4450
AR Path="/5E03CD5A" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD5A" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD5A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD5A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD5A" Ref="#PWR02708"  Part="1" 
F 0 "#PWR02708" H 1750 4200 50  0001 C CNN
F 1 "GND" H 1755 4277 50  0000 C CNN
F 2 "" H 1750 4450 50  0001 C CNN
F 3 "" H 1750 4450 50  0001 C CNN
	1    1750 4450
	1    0    0    -1  
$EndComp
Connection ~ 9100 2500
$Comp
L power:GND #PWR02722
U 1 1 5DF09A9D
P 9100 2500
F 0 "#PWR02722" H 9100 2250 50  0001 C CNN
F 1 "GND" H 9105 2327 50  0000 C CNN
F 2 "" H 9100 2500 50  0001 C CNN
F 3 "" H 9100 2500 50  0001 C CNN
	1    9100 2500
	1    0    0    -1  
$EndComp
Connection ~ 9100 1750
$Comp
L power:GND #PWR02720
U 1 1 5DF09779
P 9100 1750
F 0 "#PWR02720" H 9100 1500 50  0001 C CNN
F 1 "GND" H 9105 1577 50  0000 C CNN
F 2 "" H 9100 1750 50  0001 C CNN
F 3 "" H 9100 1750 50  0001 C CNN
	1    9100 1750
	1    0    0    -1  
$EndComp
Connection ~ 9100 2300
$Comp
L power:+5V #PWR02721
U 1 1 5DF08F38
P 9100 2300
F 0 "#PWR02721" H 9100 2150 50  0001 C CNN
F 1 "+5V" H 9115 2473 50  0000 C CNN
F 2 "" H 9100 2300 50  0001 C CNN
F 3 "" H 9100 2300 50  0001 C CNN
	1    9100 2300
	1    0    0    -1  
$EndComp
Connection ~ 9100 1550
$Comp
L power:+5V #PWR02719
U 1 1 5DF08BC0
P 9100 1550
F 0 "#PWR02719" H 9100 1400 50  0001 C CNN
F 1 "+5V" H 9115 1723 50  0000 C CNN
F 2 "" H 9100 1550 50  0001 C CNN
F 3 "" H 9100 1550 50  0001 C CNN
	1    9100 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DF081FD
P 9100 2400
AR Path="/5CC0D65F/5DF081FD" Ref="C?"  Part="1" 
AR Path="/5DF081FD" Ref="C?"  Part="1" 
AR Path="/5EF76914/5DF081FD" Ref="C?"  Part="1" 
AR Path="/6A313729/5DF081FD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DF081FD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DF081FD" Ref="C2708"  Part="1" 
F 0 "C2708" H 9009 2446 50  0000 R CNN
F 1 "100nF" H 9009 2355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9100 2400 50  0001 C CNN
F 3 "~" H 9100 2400 50  0001 C CNN
	1    9100 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DF07D78
P 9100 1650
AR Path="/5CC0D65F/5DF07D78" Ref="C?"  Part="1" 
AR Path="/5DF07D78" Ref="C?"  Part="1" 
AR Path="/5EF76914/5DF07D78" Ref="C?"  Part="1" 
AR Path="/6A313729/5DF07D78" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DF07D78" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DF07D78" Ref="C2707"  Part="1" 
F 0 "C2707" H 9009 1696 50  0000 R CNN
F 1 "100nF" H 9009 1605 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9100 1650 50  0001 C CNN
F 3 "~" H 9100 1650 50  0001 C CNN
	1    9100 1650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC251 U?
U 2 1 5DEDB303
P 9450 2900
AR Path="/5DC89E19/5DEDB303" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DEDB303" Ref="U2708"  Part="2" 
F 0 "U2708" H 9630 3446 50  0000 L CNN
F 1 "74AC251" H 9630 3355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 9450 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 9450 2850 50  0001 C CNN
	2    9450 2900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U?
U 2 1 5DEDAFB4
P 9450 1650
AR Path="/5DC89E19/5DEDAFB4" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5DEDAFB4" Ref="U2707"  Part="2" 
F 0 "U2707" H 9630 1696 50  0000 L CNN
F 1 "74LVC1G74" H 9630 1605 50  0000 L CNN
F 2 "Housings_SSOP:SSOP-8_2.95x2.8mm_Pitch0.65mm" H 9900 1650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 9900 1650 50  0001 C CNN
	2    9450 1650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5E03CDC6
P 2100 5100
AR Path="/5DC89E19/5E03CDC6" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5E018EB3/5E03CDC6" Ref="U1505"  Part="2" 
F 0 "U1505" H 2280 5146 50  0000 L CNN
F 1 "74HC541" H 2280 5055 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2100 5100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 2100 5100 50  0001 C CNN
	2    2100 5100
	1    0    0    -1  
$EndComp
Connection ~ 1750 5200
Connection ~ 1750 5000
$Comp
L alexios:74HC541 U?
U 2 1 5E03CDA4
P 2100 5850
AR Path="/5DC89E19/5E03CDA4" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5E018EB3/5E03CDA4" Ref="U1506"  Part="2" 
F 0 "U1506" H 2280 5896 50  0000 L CNN
F 1 "74HC541" H 2280 5805 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2100 5850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 2100 5850 50  0001 C CNN
	2    2100 5850
	1    0    0    -1  
$EndComp
Connection ~ 1750 5950
Connection ~ 1750 5750
$Comp
L Device:C_Small C?
U 1 1 5E03CD54
P 1750 5100
AR Path="/5CC0D65F/5E03CD54" Ref="C?"  Part="1" 
AR Path="/5E03CD54" Ref="C?"  Part="1" 
AR Path="/5EF76914/5E03CD54" Ref="C?"  Part="1" 
AR Path="/6A313729/5E03CD54" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E03CD54" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD54" Ref="C2705"  Part="1" 
F 0 "C2705" H 1659 5146 50  0000 R CNN
F 1 "100nF" H 1659 5055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1750 5100 50  0001 C CNN
F 3 "~" H 1750 5100 50  0001 C CNN
	1    1750 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E03CD4E
P 1750 5000
AR Path="/5E03CD4E" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD4E" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD4E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD4E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD4E" Ref="#PWR02709"  Part="1" 
F 0 "#PWR02709" H 1750 4850 50  0001 C CNN
F 1 "+5V" H 1765 5173 50  0000 C CNN
F 2 "" H 1750 5000 50  0001 C CNN
F 3 "" H 1750 5000 50  0001 C CNN
	1    1750 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E03CD48
P 1750 5200
AR Path="/5E03CD48" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD48" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD48" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD48" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD48" Ref="#PWR02710"  Part="1" 
F 0 "#PWR02710" H 1750 4950 50  0001 C CNN
F 1 "GND" H 1755 5027 50  0000 C CNN
F 2 "" H 1750 5200 50  0001 C CNN
F 3 "" H 1750 5200 50  0001 C CNN
	1    1750 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E03CD42
P 1750 5850
AR Path="/5CC0D65F/5E03CD42" Ref="C?"  Part="1" 
AR Path="/5E03CD42" Ref="C?"  Part="1" 
AR Path="/5EF76914/5E03CD42" Ref="C?"  Part="1" 
AR Path="/6A313729/5E03CD42" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E03CD42" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD42" Ref="C2706"  Part="1" 
F 0 "C2706" H 1659 5896 50  0000 R CNN
F 1 "100nF" H 1659 5805 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1750 5850 50  0001 C CNN
F 3 "~" H 1750 5850 50  0001 C CNN
	1    1750 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E03CD3C
P 1750 5750
AR Path="/5E03CD3C" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD3C" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD3C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD3C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD3C" Ref="#PWR02711"  Part="1" 
F 0 "#PWR02711" H 1750 5600 50  0001 C CNN
F 1 "+5V" H 1765 5923 50  0000 C CNN
F 2 "" H 1750 5750 50  0001 C CNN
F 3 "" H 1750 5750 50  0001 C CNN
	1    1750 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E03CD36
P 1750 5950
AR Path="/5E03CD36" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5E03CD36" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5E03CD36" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E03CD36" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E018EB3/5E03CD36" Ref="#PWR02712"  Part="1" 
F 0 "#PWR02712" H 1750 5700 50  0001 C CNN
F 1 "GND" H 1755 5777 50  0000 C CNN
F 2 "" H 1750 5950 50  0001 C CNN
F 3 "" H 1750 5950 50  0001 C CNN
	1    1750 5950
	1    0    0    -1  
$EndComp
Text Notes 6000 5900 0    50   ~ 0
74AC283 Propagation Delay: max. 16 ns at 5V.\nTotal propagation delay: 3×16 = 48 ns for AC, 64 ns for L.\nThe microcode gives addition 250 ns, and this is plenty of time.
Wire Bus Line
	7950 900  10700 900 
Text HLabel 10700 900  2    50   3State ~ 0
Y[0..15]
Text HLabel 10700 3500 2    50   Output ~ 0
FV
Wire Wire Line
	9900 3500 10700 3500
Wire Bus Line
	5900 1000 5900 3250
Wire Bus Line
	7850 1000 7850 3250
Wire Bus Line
	5400 1000 5400 5750
Wire Bus Line
	3450 1500 3450 6700
Wire Bus Line
	3600 2000 3600 6800
$EndSCHEMATC
