EESchema Schematic File Version 4
LIBS:cft-dfp-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 13
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC138 U?
U 1 1 6163840E
P 4100 2850
AR Path="/6163840E" Ref="U?"  Part="1" 
AR Path="/614F5B8D/6163840E" Ref="U501"  Part="1" 
F 0 "U501" H 4100 3517 50  0000 C CNN
F 1 "74HC138" H 4100 3426 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4100 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4100 2850 50  0001 C CNN
	1    4100 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2450 3100 2450
Wire Wire Line
	3600 2550 3100 2550
Wire Wire Line
	3600 2650 3100 2650
Text Label 3100 2450 0    50   ~ 0
AB5
Text Label 3100 2550 0    50   ~ 0
AB6
Text Label 3100 2650 0    50   ~ 0
AB7
$Comp
L power:+5V #PWR?
U 1 1 6163841B
P 3600 3050
AR Path="/6163841B" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163841B" Ref="#PWR0501"  Part="1" 
F 0 "#PWR0501" H 3600 2900 50  0001 C CNN
F 1 "+5V" H 3615 3223 50  0000 C CNN
F 2 "" H 3600 3050 50  0001 C CNN
F 3 "" H 3600 3050 50  0001 C CNN
	1    3600 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61638421
P 3600 3250
AR Path="/61638421" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638421" Ref="#PWR0502"  Part="1" 
F 0 "#PWR0502" H 3600 3000 50  0001 C CNN
F 1 "GND" H 3605 3077 50  0000 C CNN
F 2 "" H 3600 3250 50  0001 C CNN
F 3 "" H 3600 3250 50  0001 C CNN
	1    3600 3250
	1    0    0    -1  
$EndComp
Text Label 2500 3150 0    50   ~ 0
~IODEV1xx
NoConn ~ 4600 2550
NoConn ~ 4600 2650
NoConn ~ 4600 2750
NoConn ~ 4600 2850
NoConn ~ 4600 2950
NoConn ~ 4600 3050
NoConn ~ 4600 3150
Text Label 4650 2450 0    50   ~ 0
~DFPSEL
$Comp
L alexios:74HC112 U?
U 1 1 61638430
P 6300 2400
AR Path="/61638430" Ref="U?"  Part="1" 
AR Path="/614F5B8D/61638430" Ref="U502"  Part="1" 
F 0 "U502" H 5975 2617 50  0000 C CNN
F 1 "74HC112" H 5975 2526 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6000 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 6000 2050 50  0001 C CNN
	1    6300 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61638436
P 5450 2400
AR Path="/61638436" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638436" Ref="#PWR0507"  Part="1" 
F 0 "#PWR0507" H 5450 2250 50  0001 C CNN
F 1 "+5V" H 5465 2573 50  0000 C CNN
F 2 "" H 5450 2400 50  0001 C CNN
F 3 "" H 5450 2400 50  0001 C CNN
	1    5450 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2400 5450 2450
Wire Wire Line
	5450 2550 5500 2550
Wire Wire Line
	5500 2450 5450 2450
Connection ~ 5450 2450
Wire Wire Line
	5450 2450 5450 2550
$Comp
L power:GND #PWR?
U 1 1 61638441
P 5500 2750
AR Path="/61638441" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638441" Ref="#PWR0508"  Part="1" 
F 0 "#PWR0508" H 5500 2500 50  0001 C CNN
F 1 "GND" V 5600 2650 50  0000 R CNN
F 2 "" H 5500 2750 50  0001 C CNN
F 3 "" H 5500 2750 50  0001 C CNN
	1    5500 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 2450 5200 2650
Wire Wire Line
	5200 2650 5500 2650
Wire Wire Line
	4600 2450 5200 2450
Wire Wire Line
	8800 2850 9250 2850
Text Label 9200 2850 2    50   ~ 0
~WS
Text HLabel 9250 2850 2    50   3State ~ 0
~WS
$Comp
L alexios:74HC112 U?
U 2 1 6163844D
P 7850 2400
AR Path="/6163844D" Ref="U?"  Part="2" 
AR Path="/614F5B8D/6163844D" Ref="U502"  Part="2" 
F 0 "U502" H 7525 2617 50  0000 C CNN
F 1 "74HC112" H 7525 2526 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7550 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 7550 2050 50  0001 C CNN
	2    7850 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2450 6550 2450
Wire Wire Line
	6550 2450 6550 2850
Wire Wire Line
	6550 3150 5450 3150
Wire Wire Line
	6450 2850 6550 2850
Connection ~ 6550 2850
Wire Wire Line
	6550 2850 6550 3150
Wire Wire Line
	5500 2850 5450 2850
Wire Wire Line
	5450 2850 5450 3150
$Comp
L power:+5V #PWR?
U 1 1 6163845B
P 7000 2750
AR Path="/6163845B" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163845B" Ref="#PWR0514"  Part="1" 
F 0 "#PWR0514" H 7000 2600 50  0001 C CNN
F 1 "+5V" V 7015 2878 50  0000 L CNN
F 2 "" H 7000 2750 50  0001 C CNN
F 3 "" H 7000 2750 50  0001 C CNN
	1    7000 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 2750 7000 2750
Wire Wire Line
	7000 2750 7000 2850
Wire Wire Line
	7000 2850 7050 2850
Connection ~ 7000 2750
Wire Wire Line
	7050 2650 6650 2650
Wire Wire Line
	6650 2650 6650 3250
Text Label 5850 3250 0    50   ~ 0
CLRWS
Text Label 6700 2650 0    50   ~ 0
CLRWS
Text Label 6700 2450 0    50   ~ 0
~IOINT
$Comp
L power:GND #PWR?
U 1 1 6163846A
P 7050 2550
AR Path="/6163846A" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163846A" Ref="#PWR0516"  Part="1" 
F 0 "#PWR0516" H 7050 2300 50  0001 C CNN
F 1 "GND" V 7000 2450 50  0000 R CNN
F 2 "" H 7050 2550 50  0001 C CNN
F 3 "" H 7050 2550 50  0001 C CNN
	1    7050 2550
	0    1    1    0   
$EndComp
NoConn ~ 6450 2450
NoConn ~ 8000 2450
Text Notes 4550 1950 0    50   ~ 0
Wait State Generation & Microcontroller Interrupts
Wire Wire Line
	2150 3600 5450 3600
$Comp
L alexios:74HC138 U?
U 2 1 61638474
P 1550 7100
AR Path="/61638474" Ref="U?"  Part="2" 
AR Path="/614F5B8D/61638474" Ref="U501"  Part="2" 
F 0 "U501" H 1730 7146 50  0000 L CNN
F 1 "74HC138" H 1730 7055 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1550 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1550 7100 50  0001 C CNN
	2    1550 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC112 U?
U 3 1 6163847A
P 3200 7300
AR Path="/6163847A" Ref="U?"  Part="3" 
AR Path="/614F5B8D/6163847A" Ref="U502"  Part="3" 
F 0 "U502" H 3080 7546 50  0000 L CNN
F 1 "74HC112" H 3080 7455 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2900 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 2900 6950 50  0001 C CNN
	3    3200 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61638480
P 5450 7100
AR Path="/61638480" Ref="C?"  Part="1" 
AR Path="/614F5B8D/61638480" Ref="C504"  Part="1" 
F 0 "C504" H 5359 7146 50  0000 R CNN
F 1 "100nF" H 5359 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 7100 50  0001 C CNN
F 3 "~" H 5450 7100 50  0001 C CNN
	1    5450 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61638486
P 5450 7000
AR Path="/61638486" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638486" Ref="#PWR0509"  Part="1" 
F 0 "#PWR0509" H 5450 6850 50  0001 C CNN
F 1 "+5V" H 5465 7173 50  0000 C CNN
F 2 "" H 5450 7000 50  0001 C CNN
F 3 "" H 5450 7000 50  0001 C CNN
	1    5450 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6163848C
P 5450 7200
AR Path="/6163848C" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163848C" Ref="#PWR0510"  Part="1" 
F 0 "#PWR0510" H 5450 6950 50  0001 C CNN
F 1 "GND" H 5455 7027 50  0000 C CNN
F 2 "" H 5450 7200 50  0001 C CNN
F 3 "" H 5450 7200 50  0001 C CNN
	1    5450 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61638492
P 1200 7100
AR Path="/61638492" Ref="C?"  Part="1" 
AR Path="/614F5B8D/61638492" Ref="C501"  Part="1" 
F 0 "C501" H 1291 7054 50  0000 L CNN
F 1 "100nF" H 1291 7145 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 7100 50  0001 C CNN
F 3 "~" H 1200 7100 50  0001 C CNN
	1    1200 7100
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61638498
P 1200 7000
AR Path="/61638498" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638498" Ref="#PWR0503"  Part="1" 
F 0 "#PWR0503" H 1200 6850 50  0001 C CNN
F 1 "+5V" H 1215 7173 50  0000 C CNN
F 2 "" H 1200 7000 50  0001 C CNN
F 3 "" H 1200 7000 50  0001 C CNN
	1    1200 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6163849E
P 1200 7200
AR Path="/6163849E" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163849E" Ref="#PWR0504"  Part="1" 
F 0 "#PWR0504" H 1200 6950 50  0001 C CNN
F 1 "GND" H 1205 7027 50  0000 C CNN
F 2 "" H 1200 7200 50  0001 C CNN
F 3 "" H 1200 7200 50  0001 C CNN
	1    1200 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 616384A4
P 2550 7100
AR Path="/616384A4" Ref="C?"  Part="1" 
AR Path="/614F5B8D/616384A4" Ref="C502"  Part="1" 
F 0 "C502" H 2641 7054 50  0000 L CNN
F 1 "100nF" H 2641 7145 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 7100 50  0001 C CNN
F 3 "~" H 2550 7100 50  0001 C CNN
	1    2550 7100
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 616384AA
P 2550 7000
AR Path="/616384AA" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384AA" Ref="#PWR0505"  Part="1" 
F 0 "#PWR0505" H 2550 6850 50  0001 C CNN
F 1 "+5V" H 2565 7173 50  0000 C CNN
F 2 "" H 2550 7000 50  0001 C CNN
F 3 "" H 2550 7000 50  0001 C CNN
	1    2550 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 616384B0
P 2550 7200
AR Path="/616384B0" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384B0" Ref="#PWR0506"  Part="1" 
F 0 "#PWR0506" H 2550 6950 50  0001 C CNN
F 1 "GND" H 2555 7027 50  0000 C CNN
F 2 "" H 2550 7200 50  0001 C CNN
F 3 "" H 2550 7200 50  0001 C CNN
	1    2550 7200
	1    0    0    -1  
$EndComp
Connection ~ 1200 7000
Connection ~ 1200 7200
Connection ~ 2550 7000
Connection ~ 2550 7200
$Comp
L alexios:74LVC1G07 U?
U 1 1 616384BA
P 8200 2850
AR Path="/616384BA" Ref="U?"  Part="1" 
AR Path="/614F5B8D/616384BA" Ref="U504"  Part="1" 
F 0 "U504" H 8250 3117 50  0000 C CNN
F 1 "74LVC1G07" H 8250 3026 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8275 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 8275 2850 50  0001 C CNN
	1    8200 2850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G07 U?
U 2 1 616384C0
P 5800 7000
AR Path="/616384C0" Ref="U?"  Part="2" 
AR Path="/614F5B8D/616384C0" Ref="U504"  Part="2" 
F 0 "U504" H 5980 6946 50  0000 L CNN
F 1 "74LVC1G07" H 5980 6855 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5875 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5875 7000 50  0001 C CNN
	2    5800 7000
	1    0    0    -1  
$EndComp
Connection ~ 5200 2650
$Comp
L alexios:74HC251 U?
U 1 1 616384C7
P 7550 4100
AR Path="/616384C7" Ref="U?"  Part="1" 
AR Path="/614F5B8D/616384C7" Ref="U503"  Part="1" 
F 0 "U503" H 7550 4967 50  0000 C CNN
F 1 "74HC251" H 7550 4876 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7550 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7550 4050 50  0001 C CNN
	1    7550 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 616384CD
P 7000 4850
AR Path="/616384CD" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384CD" Ref="#PWR0515"  Part="1" 
F 0 "#PWR0515" H 7000 4600 50  0001 C CNN
F 1 "GND" H 7005 4677 50  0000 C CNN
F 2 "" H 7000 4850 50  0001 C CNN
F 3 "" H 7000 4850 50  0001 C CNN
	1    7000 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 4850 7000 4800
Wire Wire Line
	7050 4800 7000 4800
Connection ~ 7000 4800
Wire Wire Line
	7000 4800 7000 4100
Text Label 6650 4400 0    50   ~ 0
~DBOE
Text Label 6650 4500 0    50   ~ 0
~R
Text Label 6650 4600 0    50   ~ 0
~DFPSEL
Wire Wire Line
	5200 2650 5200 4600
Wire Wire Line
	5200 4600 7050 4600
Wire Wire Line
	2450 4400 7050 4400
Wire Wire Line
	2450 4500 7050 4500
Wire Wire Line
	7050 3500 7000 3500
Wire Wire Line
	7000 3600 7050 3600
Connection ~ 7000 3600
Wire Wire Line
	7000 3600 7000 3500
Wire Wire Line
	7050 3700 7000 3700
Connection ~ 7000 3700
Wire Wire Line
	7000 3700 7000 3600
Wire Wire Line
	7050 3900 7000 3900
Connection ~ 7000 3900
Wire Wire Line
	7000 3900 7000 3700
Wire Wire Line
	7050 4100 7000 4100
Connection ~ 7000 4100
Wire Wire Line
	7000 4100 7000 3900
$Comp
L power:+5V #PWR?
U 1 1 616384F1
P 6900 4000
AR Path="/616384F1" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384F1" Ref="#PWR0512"  Part="1" 
F 0 "#PWR0512" H 6900 3850 50  0001 C CNN
F 1 "+5V" V 6915 4128 50  0000 L CNN
F 2 "" H 6900 4000 50  0001 C CNN
F 3 "" H 6900 4000 50  0001 C CNN
	1    6900 4000
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 616384F7
P 6900 4200
AR Path="/616384F7" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384F7" Ref="#PWR0513"  Part="1" 
F 0 "#PWR0513" H 6900 4050 50  0001 C CNN
F 1 "+5V" V 6915 4328 50  0000 L CNN
F 2 "" H 6900 4200 50  0001 C CNN
F 3 "" H 6900 4200 50  0001 C CNN
	1    6900 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 4000 6900 4000
Wire Wire Line
	6900 4200 7050 4200
NoConn ~ 8050 3600
Wire Wire Line
	8050 3500 9250 3500
Text Label 8950 3500 2    50   ~ 0
~DBOE1
Text Label 2500 3600 0    50   ~ 0
CLRWS
Wire Wire Line
	6550 2450 6550 2050
Wire Wire Line
	6550 2050 9250 2050
Connection ~ 6550 2450
Text HLabel 9250 2050 2    50   Output ~ 0
~IOINT
Text HLabel 9250 3500 2    50   Output ~ 0
~DBOE1
Text Label 2500 4400 0    50   ~ 0
~DBOE
Text Label 2500 4500 0    50   ~ 0
~R
Text HLabel 2450 4500 0    50   3State ~ 0
~R
Text HLabel 2450 4400 0    50   Input ~ 0
~DBOE
Text HLabel 2150 3600 0    50   Input ~ 0
CLRWS
Text HLabel 2450 3150 0    50   Input ~ 0
~IODEV1xx
Entry Wire Line
	3100 2650 3000 2750
Entry Wire Line
	3100 2550 3000 2650
Entry Wire Line
	3100 2450 3000 2550
Entry Bus Bus
	2900 2950 3000 2850
Wire Bus Line
	2900 2950 2450 2950
Text Label 2500 2950 0    50   ~ 0
AB[5..7]
Text HLabel 2450 2950 0    50   Input ~ 0
AB[5..7]
Wire Wire Line
	6650 3250 5450 3250
Wire Wire Line
	5450 3250 5450 3600
Text Label 5850 3150 0    50   ~ 0
~IOINT
Text Label 5200 4050 1    50   ~ 0
~DFPSEL
Text Label 8950 2050 2    50   ~ 0
~IOINT
Wire Wire Line
	7050 3800 6900 3800
$Comp
L power:+5V #PWR?
U 1 1 637D2AD7
P 6900 3800
AR Path="/637D2AD7" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/637D2AD7" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 6900 3650 50  0001 C CNN
F 1 "+5V" V 6915 3928 50  0000 L CNN
F 2 "" H 6900 3800 50  0001 C CNN
F 3 "" H 6900 3800 50  0001 C CNN
	1    6900 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 3150 3600 3150
$Comp
L alexios:74HC251 U?
U 2 1 660ABF30
P 4350 7600
AR Path="/660ABF30" Ref="U?"  Part="1" 
AR Path="/614F5B8D/660ABF30" Ref="U503"  Part="2" 
F 0 "U503" H 4530 8146 50  0000 L CNN
F 1 "74HC251" H 4530 8055 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4350 7550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 4350 7550 50  0001 C CNN
	2    4350 7600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 660AEB8F
P 4000 7100
AR Path="/660AEB8F" Ref="C?"  Part="1" 
AR Path="/614F5B8D/660AEB8F" Ref="C503"  Part="1" 
F 0 "C503" H 4091 7054 50  0000 L CNN
F 1 "100nF" H 4091 7145 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4000 7100 50  0001 C CNN
F 3 "~" H 4000 7100 50  0001 C CNN
	1    4000 7100
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 660AEB95
P 4000 7000
AR Path="/660AEB95" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/660AEB95" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 4000 6850 50  0001 C CNN
F 1 "+5V" H 4015 7173 50  0000 C CNN
F 2 "" H 4000 7000 50  0001 C CNN
F 3 "" H 4000 7000 50  0001 C CNN
	1    4000 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 660AEB9B
P 4000 7200
AR Path="/660AEB9B" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/660AEB9B" Ref="#PWR0153"  Part="1" 
F 0 "#PWR0153" H 4000 6950 50  0001 C CNN
F 1 "GND" H 4005 7027 50  0000 C CNN
F 2 "" H 4000 7200 50  0001 C CNN
F 3 "" H 4000 7200 50  0001 C CNN
	1    4000 7200
	1    0    0    -1  
$EndComp
Connection ~ 5450 7000
Connection ~ 5450 7200
Connection ~ 4000 7000
Connection ~ 4000 7200
$Comp
L Device:R_Small R501
U 1 1 5DB1351D
P 8700 2850
F 0 "R501" V 8504 2850 50  0000 C CNN
F 1 "30Ω" V 8595 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8700 2850 50  0001 C CNN
F 3 "~" H 8700 2850 50  0001 C CNN
	1    8700 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	8500 2850 8600 2850
Wire Bus Line
	3000 2550 3000 2850
$EndSCHEMATC
