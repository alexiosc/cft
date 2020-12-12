EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 11
Title "Wait State & MCU Interrupts"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
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
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 7100 50  0001 C CNN
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
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 7100 50  0001 C CNN
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
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 7100 50  0001 C CNN
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
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4000 7100 50  0001 C CNN
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
Text Notes 8600 1950 0    100  ~ 20
Wait State Generator
Text Notes 2450 3300 0    50   ~ 0
Decodes I/O Space &0100–&011F
Wire Wire Line
	7450 2500 7550 2500
$Comp
L Device:R_Small R501
U 1 1 5DB1351D
P 7650 2500
F 0 "R501" V 7454 2500 50  0000 C CNN
F 1 "30Ω" V 7545 2500 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7650 2500 50  0001 C CNN
F 3 "~" H 7650 2500 50  0001 C CNN
	1    7650 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 2800 2550 2800
$Comp
L power:+5V #PWR?
U 1 1 637D2AD7
P 5850 3800
AR Path="/637D2AD7" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/637D2AD7" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 5850 3650 50  0001 C CNN
F 1 "+5V" V 5865 3928 50  0000 L CNN
F 2 "" H 5850 3800 50  0001 C CNN
F 3 "" H 5850 3800 50  0001 C CNN
	1    5850 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 3800 5850 3800
Text Label 7900 1700 2    50   ~ 0
~IOINT
Text Label 4150 3200 1    50   ~ 0
~DFPSEL
Text Label 4800 2800 0    50   ~ 0
~IOINT
Wire Wire Line
	4400 2900 4400 3500
Wire Wire Line
	5600 2900 4400 2900
Text HLabel 1400 2600 0    50   Input ~ 0
AB[5..7]
Text Label 1450 2600 0    50   ~ 0
AB[5..7]
Wire Bus Line
	1850 2600 1400 2600
Entry Bus Bus
	1850 2600 1950 2500
Entry Wire Line
	2050 2100 1950 2200
Entry Wire Line
	2050 2200 1950 2300
Entry Wire Line
	2050 2300 1950 2400
Text HLabel 1400 2800 0    50   Input ~ 0
~IODEV1xx
Text HLabel 1400 3500 0    50   Input ~ 0
CLRWS
Text HLabel 1400 4400 0    50   Input ~ 0
~DBOE
Text HLabel 1400 4500 0    50   3State ~ 0
~R
Text Label 1450 4500 0    50   ~ 0
~R
Text Label 1450 4400 0    50   ~ 0
~DBOE
Text HLabel 8200 3500 2    50   Output ~ 0
~DBOE
Text HLabel 8000 1700 2    50   Output ~ 0
~IOINT
Connection ~ 5500 2100
Wire Wire Line
	5500 1700 8000 1700
Wire Wire Line
	5500 2100 5500 1700
Text Label 1450 3500 0    50   ~ 0
CLRWS
Text Label 7900 3500 2    50   ~ 0
~DBOE
Wire Wire Line
	7000 3500 8200 3500
NoConn ~ 7000 3600
Wire Wire Line
	5850 4200 6000 4200
Wire Wire Line
	6000 4000 5850 4000
$Comp
L power:+5V #PWR?
U 1 1 616384F7
P 5850 4200
AR Path="/616384F7" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384F7" Ref="#PWR0513"  Part="1" 
F 0 "#PWR0513" H 5850 4050 50  0001 C CNN
F 1 "+5V" V 5865 4328 50  0000 L CNN
F 2 "" H 5850 4200 50  0001 C CNN
F 3 "" H 5850 4200 50  0001 C CNN
	1    5850 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 616384F1
P 5850 4000
AR Path="/616384F1" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384F1" Ref="#PWR0512"  Part="1" 
F 0 "#PWR0512" H 5850 3850 50  0001 C CNN
F 1 "+5V" V 5865 4128 50  0000 L CNN
F 2 "" H 5850 4000 50  0001 C CNN
F 3 "" H 5850 4000 50  0001 C CNN
	1    5850 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 4100 5950 3900
Connection ~ 5950 4100
Wire Wire Line
	6000 4100 5950 4100
Wire Wire Line
	5950 3900 5950 3700
Connection ~ 5950 3900
Wire Wire Line
	6000 3900 5950 3900
Wire Wire Line
	5950 3700 5950 3600
Connection ~ 5950 3700
Wire Wire Line
	6000 3700 5950 3700
Wire Wire Line
	5950 3600 5950 3500
Connection ~ 5950 3600
Wire Wire Line
	5950 3600 6000 3600
Wire Wire Line
	6000 3500 5950 3500
Wire Wire Line
	1400 4500 6000 4500
Wire Wire Line
	1400 4400 6000 4400
Text Label 5600 4600 0    50   ~ 0
~DFPSEL
Text Label 5600 4500 0    50   ~ 0
~R
Text Label 5600 4400 0    50   ~ 0
~DBOE
Wire Wire Line
	5950 4800 5950 4100
Connection ~ 5950 4800
Wire Wire Line
	6000 4800 5950 4800
Wire Wire Line
	5950 4850 5950 4800
$Comp
L power:GND #PWR?
U 1 1 616384CD
P 5950 4850
AR Path="/616384CD" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384CD" Ref="#PWR0515"  Part="1" 
F 0 "#PWR0515" H 5950 4600 50  0001 C CNN
F 1 "GND" H 5955 4677 50  0000 C CNN
F 2 "" H 5950 4850 50  0001 C CNN
F 3 "" H 5950 4850 50  0001 C CNN
	1    5950 4850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC251 U?
U 1 1 616384C7
P 6500 4100
AR Path="/616384C7" Ref="U?"  Part="1" 
AR Path="/614F5B8D/616384C7" Ref="U503"  Part="1" 
F 0 "U503" H 6500 4967 50  0000 C CNN
F 1 "74HC251" H 6500 4876 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6500 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 6500 4050 50  0001 C CNN
	1    6500 4100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G07 U?
U 1 1 616384BA
P 7150 2500
AR Path="/616384BA" Ref="U?"  Part="1" 
AR Path="/614F5B8D/616384BA" Ref="U504"  Part="1" 
F 0 "U504" H 7200 2767 50  0000 C CNN
F 1 "74LVC1G07" H 7200 2676 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7225 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 7225 2500 50  0001 C CNN
	1    7150 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3500 4400 3500
NoConn ~ 6950 2100
NoConn ~ 5400 2100
$Comp
L power:GND #PWR?
U 1 1 6163846A
P 6000 2200
AR Path="/6163846A" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163846A" Ref="#PWR0516"  Part="1" 
F 0 "#PWR0516" H 6000 1950 50  0001 C CNN
F 1 "GND" V 5950 2100 50  0000 R CNN
F 2 "" H 6000 2200 50  0001 C CNN
F 3 "" H 6000 2200 50  0001 C CNN
	1    6000 2200
	0    1    1    0   
$EndComp
Text Label 5650 2100 0    50   ~ 0
~IOINT
Text Label 5650 2300 0    50   ~ 0
CLRWS
Text Label 4800 2900 0    50   ~ 0
CLRWS
Wire Wire Line
	5600 2300 5600 2900
Wire Wire Line
	6000 2300 5600 2300
Connection ~ 5950 2400
Wire Wire Line
	5950 2500 6000 2500
Wire Wire Line
	5950 2400 5950 2500
Wire Wire Line
	6000 2400 5950 2400
$Comp
L power:+5V #PWR?
U 1 1 6163845B
P 5950 2400
AR Path="/6163845B" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163845B" Ref="#PWR0514"  Part="1" 
F 0 "#PWR0514" H 5950 2250 50  0001 C CNN
F 1 "+5V" V 5965 2528 50  0000 L CNN
F 2 "" H 5950 2400 50  0001 C CNN
F 3 "" H 5950 2400 50  0001 C CNN
	1    5950 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 2500 4400 2800
Wire Wire Line
	4450 2500 4400 2500
Wire Wire Line
	5500 2500 5500 2800
Connection ~ 5500 2500
Wire Wire Line
	5400 2500 5500 2500
Wire Wire Line
	5500 2800 4400 2800
Wire Wire Line
	5500 2100 5500 2500
Wire Wire Line
	6000 2100 5500 2100
$Comp
L alexios:74HC112 U?
U 2 1 6163844D
P 6800 2050
AR Path="/6163844D" Ref="U?"  Part="2" 
AR Path="/614F5B8D/6163844D" Ref="U502"  Part="2" 
F 0 "U502" H 6475 2267 50  0000 C CNN
F 1 "74HC112" H 6475 2176 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6500 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 6500 1700 50  0001 C CNN
	2    6800 2050
	1    0    0    -1  
$EndComp
Text HLabel 8000 2500 2    50   3State ~ 0
~WS
Text Label 7950 2500 2    50   ~ 0
~WS
Wire Wire Line
	7750 2500 8000 2500
Wire Wire Line
	3550 2100 4150 2100
Wire Wire Line
	4150 2300 4450 2300
Wire Wire Line
	4150 2100 4150 2300
$Comp
L power:GND #PWR?
U 1 1 61638441
P 4450 2400
AR Path="/61638441" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638441" Ref="#PWR0508"  Part="1" 
F 0 "#PWR0508" H 4450 2150 50  0001 C CNN
F 1 "GND" V 4550 2300 50  0000 R CNN
F 2 "" H 4450 2400 50  0001 C CNN
F 3 "" H 4450 2400 50  0001 C CNN
	1    4450 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 2100 4400 2200
Connection ~ 4400 2100
Wire Wire Line
	4450 2100 4400 2100
Wire Wire Line
	4400 2200 4450 2200
Wire Wire Line
	4400 2050 4400 2100
$Comp
L power:+5V #PWR?
U 1 1 61638436
P 4400 2050
AR Path="/61638436" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638436" Ref="#PWR0507"  Part="1" 
F 0 "#PWR0507" H 4400 1900 50  0001 C CNN
F 1 "+5V" H 4415 2223 50  0000 C CNN
F 2 "" H 4400 2050 50  0001 C CNN
F 3 "" H 4400 2050 50  0001 C CNN
	1    4400 2050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC112 U?
U 1 1 61638430
P 5250 2050
AR Path="/61638430" Ref="U?"  Part="1" 
AR Path="/614F5B8D/61638430" Ref="U502"  Part="1" 
F 0 "U502" H 4925 2267 50  0000 C CNN
F 1 "74HC112" H 4925 2176 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4950 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 4950 1700 50  0001 C CNN
	1    5250 2050
	1    0    0    -1  
$EndComp
Text Label 3600 2100 0    50   ~ 0
~DFPSEL
NoConn ~ 3550 2800
NoConn ~ 3550 2700
NoConn ~ 3550 2600
NoConn ~ 3550 2500
NoConn ~ 3550 2400
NoConn ~ 3550 2300
NoConn ~ 3550 2200
Text Label 1450 2800 0    50   ~ 0
~IODEV1xx
$Comp
L power:GND #PWR?
U 1 1 61638421
P 2550 2900
AR Path="/61638421" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638421" Ref="#PWR0502"  Part="1" 
F 0 "#PWR0502" H 2550 2650 50  0001 C CNN
F 1 "GND" H 2555 2727 50  0000 C CNN
F 2 "" H 2550 2900 50  0001 C CNN
F 3 "" H 2550 2900 50  0001 C CNN
	1    2550 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6163841B
P 2550 2700
AR Path="/6163841B" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163841B" Ref="#PWR0501"  Part="1" 
F 0 "#PWR0501" H 2550 2550 50  0001 C CNN
F 1 "+5V" H 2565 2873 50  0000 C CNN
F 2 "" H 2550 2700 50  0001 C CNN
F 3 "" H 2550 2700 50  0001 C CNN
	1    2550 2700
	1    0    0    -1  
$EndComp
Text Label 2050 2300 0    50   ~ 0
AB7
Text Label 2050 2200 0    50   ~ 0
AB6
Text Label 2050 2100 0    50   ~ 0
AB5
Wire Wire Line
	2550 2300 2050 2300
Wire Wire Line
	2550 2200 2050 2200
Wire Wire Line
	2550 2100 2050 2100
$Comp
L alexios:74HC138 U?
U 1 1 6163840E
P 3050 2500
AR Path="/6163840E" Ref="U?"  Part="1" 
AR Path="/614F5B8D/6163840E" Ref="U501"  Part="1" 
F 0 "U501" H 3050 3167 50  0000 C CNN
F 1 "74HC138" H 3050 3076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3050 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3050 2500 50  0001 C CNN
	1    3050 2500
	1    0    0    -1  
$EndComp
Text Notes 8600 2850 0    50   ~ 0
When the DFP is addressed at I/O space &0100–&011F,\na flip flop is set, asserting a Wait State ~WS~.\nSimultaneously, the MCU is interrupted to service the\nbus request by asserting ~IOINT~.\n\nOnce the request has been service, the MCU strobes\nCLRWS, which clears the Wait State and the processor\ncan move on.\n\nThis is obviously very slow.
Wire Notes Line width 12 style solid
	10900 1650 8450 1650
Wire Notes Line width 12 style solid
	8450 1650 8450 3000
Wire Notes Line width 12 style solid
	8450 3000 10900 3000
Wire Notes Line width 12 style solid
	10900 3000 10900 1650
Text Notes 2400 1500 0    100  ~ 20
Address Decoder
Text Notes 4350 1500 0    100  ~ 20
Wait State Generation & Microcontroller Interrupts
Text Notes 5900 3050 0    100  ~ 20
Autonomic Data Bus Driver
Text Notes 7550 4250 0    100  ~ 20
Autonomic Data Bus Driver
Text Notes 7550 5050 0    50   ~ 0
The '251 is configured as an arbitrary function generator. It\nenables the Data Bus driver when the CFT is addressing the DFP\nfor reading, or when the MCU asserts ~DBOE~ to take control of\nthe Data Bus.\n\nDriving is done autonomically rather than purely under MCU\nprogrammatic control in an effort to speed up reporting values to\nthe CFT when it performs DFP register reads.
Wire Notes Line width 12 style solid
	10300 3950 7400 3950
Wire Notes Line width 12 style solid
	7400 3950 7400 5200
Wire Notes Line width 12 style solid
	7400 5200 10300 5200
Wire Notes Line width 12 style solid
	10300 5200 10300 3950
Wire Wire Line
	6000 4600 4150 4600
Wire Wire Line
	4150 4600 4150 2300
Connection ~ 4150 2300
Text Notes 6250 6150 0    50   ~ 0
~DBOE~\n\n  0\n  1\n  0\n  1\n  0\n  1\n  0\n  1
Text Notes 6100 6150 0    50   ~ 0
~R~\n\n0\n0\n1\n1\n0\n0\n1\n1
Text Notes 5700 6150 0    50   ~ 0
~DFPSEL~\n\n   0\n   0\n   0\n   0\n   1\n   1\n   1\n   1
Text Notes 6650 6150 0    50   ~ 0
~DBOE1~\n\n  0\n  0\n  0\n  1\n  0\n  1\n  0\n  1
Wire Notes Line width 12 style solid
	5600 5290 7000 5290
Wire Notes Line width 12 style solid
	5600 6200 7000 6200
Wire Notes Line width 12 style solid
	5600 6200 5600 5290
Wire Notes Line width 12 style solid
	5600 5460 7000 5460
Wire Notes Line width 12 style solid
	7000 6200 7000 5290
Wire Notes Line
	6560 6200 6560 5280
Wire Bus Line
	1950 2200 1950 2500
$EndSCHEMATC
