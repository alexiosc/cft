EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 15
Title "Termination & Conditioning"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 "Needs cleanup!"
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1300 1600 0    50   UnSpc ~ 0
CLK1
Text HLabel 1300 1700 0    50   UnSpc ~ 0
CLK2
Text HLabel 1300 2200 0    50   UnSpc ~ 0
T34
Text HLabel 1300 1800 0    50   UnSpc ~ 0
CLK3
Text HLabel 1300 1900 0    50   UnSpc ~ 0
CLK4
Text Label 1400 2500 0    50   ~ 0
~MEM
Text Label 1400 2700 0    50   ~ 0
~R
Text Label 1400 2800 0    50   ~ 0
~W
Text Label 1400 1800 0    50   ~ 0
CLK3
Text Label 1400 1900 0    50   ~ 0
CLK4
Text Label 1400 1600 0    50   ~ 0
CLK1
Text Label 1400 1700 0    50   ~ 0
CLK2
Text Label 1400 2200 0    50   ~ 0
T34
Text Label 1400 2600 0    50   ~ 0
~IO
Text HLabel 1300 2600 0    50   UnSpc ~ 0
~IO
Text HLabel 1300 2500 0    50   UnSpc ~ 0
~MEM
Text HLabel 1300 2700 0    50   UnSpc ~ 0
~R
Text HLabel 1300 2800 0    50   UnSpc ~ 0
~W
Text Label 1400 1000 0    50   ~ 0
~SYSDEV
Text HLabel 1300 1000 0    50   UnSpc ~ 0
~SYSDEV
Text Label 1400 1100 0    50   ~ 0
~IODEV1xx
Text HLabel 1300 1100 0    50   UnSpc ~ 0
~IODEV1xx
Text Label 1400 1200 0    50   ~ 0
~IODEV2xx
Text HLabel 1300 1200 0    50   UnSpc ~ 0
~IODEV2xx
Text Label 1400 1300 0    50   ~ 0
~IODEV3xx
Text HLabel 1300 1300 0    50   UnSpc ~ 0
~IODEV3xx
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60885B62
P 2300 1000
AR Path="/60885B62" Ref="RN?"  Part="1" 
AR Path="/60757845/60885B62" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/60885B62" Ref="RN13"  Part="1" 
F 0 "RN13" H 2200 1100 50  0000 L CNN
F 1 "30Ω" H 2250 600 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 1080 50  0001 C CNN
F 3 "~" V 2300 1000 50  0001 C CNN
	1    2300 1000
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60885B68
P 2300 1100
AR Path="/60885B68" Ref="RN?"  Part="2" 
AR Path="/60757845/60885B68" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/60885B68" Ref="RN13"  Part="2" 
F 0 "RN13" H 2400 1150 50  0001 L CNN
F 1 "30Ω" H 2275 1206 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 1180 50  0001 C CNN
F 3 "~" V 2300 1100 50  0001 C CNN
	2    2300 1100
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60885B6E
P 2300 1200
AR Path="/60885B6E" Ref="RN?"  Part="3" 
AR Path="/60757845/60885B6E" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/60885B6E" Ref="RN13"  Part="3" 
F 0 "RN13" H 2400 1250 50  0001 L CNN
F 1 "30Ω" H 2275 1306 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 1280 50  0001 C CNN
F 3 "~" V 2300 1200 50  0001 C CNN
	3    2300 1200
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60885B74
P 2300 1300
AR Path="/60885B74" Ref="RN?"  Part="4" 
AR Path="/60757845/60885B74" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/60885B74" Ref="RN13"  Part="4" 
F 0 "RN13" H 2400 1350 50  0001 L CNN
F 1 "30Ω" H 2275 1406 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 1380 50  0001 C CNN
F 3 "~" V 2300 1300 50  0001 C CNN
	4    2300 1300
	1    0    0    1   
$EndComp
Wire Wire Line
	2400 1000 2500 1000
Wire Wire Line
	2400 1100 2500 1100
Wire Wire Line
	2400 1200 2500 1200
Wire Wire Line
	2400 1300 2500 1300
Wire Wire Line
	2500 1300 2500 1200
Connection ~ 2500 1000
Connection ~ 2500 1100
Wire Wire Line
	2500 1100 2500 1000
Connection ~ 2500 1200
Wire Wire Line
	2500 1200 2500 1100
$Comp
L power:+5V #PWR0138
U 1 1 60888F69
P 2800 1600
F 0 "#PWR0138" H 2800 1450 50  0001 C CNN
F 1 "+5V" H 2815 1773 50  0000 C CNN
F 2 "" H 2800 1600 50  0001 C CNN
F 3 "" H 2800 1600 50  0001 C CNN
	1    2800 1600
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 6089638C
P 2650 1000
F 0 "JP4" H 2650 867 50  0000 C CNN
F 1 "SolderJumper_2_Open" V 2695 1068 50  0001 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2650 1000 50  0001 C CNN
F 3 "~" H 2650 1000 50  0001 C CNN
	1    2650 1000
	-1   0    0    1   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 608A053D
P 2650 1600
F 0 "JP5" H 2650 1467 50  0000 C CNN
F 1 "SolderJumper_2_Open" V 2695 1668 50  0001 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2650 1600 50  0001 C CNN
F 3 "~" H 2650 1600 50  0001 C CNN
	1    2650 1600
	-1   0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 608A31FB
P 2300 1600
AR Path="/608A31FB" Ref="RN?"  Part="1" 
AR Path="/60757845/608A31FB" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/608A31FB" Ref="RN18"  Part="1" 
F 0 "RN18" H 2200 1700 50  0000 L CNN
F 1 "30Ω" H 2250 1200 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 1680 50  0001 C CNN
F 3 "~" V 2300 1600 50  0001 C CNN
	1    2300 1600
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 608A3201
P 2300 1700
AR Path="/608A3201" Ref="RN?"  Part="2" 
AR Path="/60757845/608A3201" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/608A3201" Ref="RN18"  Part="2" 
F 0 "RN18" H 2400 1750 50  0001 L CNN
F 1 "30Ω" H 2275 1806 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 1780 50  0001 C CNN
F 3 "~" V 2300 1700 50  0001 C CNN
	2    2300 1700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 608A3207
P 2300 1800
AR Path="/608A3207" Ref="RN?"  Part="3" 
AR Path="/60757845/608A3207" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/608A3207" Ref="RN18"  Part="3" 
F 0 "RN18" H 2400 1850 50  0001 L CNN
F 1 "30Ω" H 2275 1906 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 1880 50  0001 C CNN
F 3 "~" V 2300 1800 50  0001 C CNN
	3    2300 1800
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 608A320D
P 2300 1900
AR Path="/608A320D" Ref="RN?"  Part="4" 
AR Path="/60757845/608A320D" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/608A320D" Ref="RN18"  Part="4" 
F 0 "RN18" H 2400 1950 50  0001 L CNN
F 1 "30Ω" H 2275 2006 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 1980 50  0001 C CNN
F 3 "~" V 2300 1900 50  0001 C CNN
	4    2300 1900
	1    0    0    1   
$EndComp
Wire Wire Line
	1300 1600 2150 1600
Wire Wire Line
	1300 1700 2150 1700
Wire Wire Line
	1300 1800 2150 1800
Wire Wire Line
	1300 1900 2150 1900
Wire Wire Line
	2400 1600 2500 1600
Wire Wire Line
	2400 1700 2500 1700
Wire Wire Line
	2400 1800 2500 1800
Wire Wire Line
	2400 1900 2500 1900
Connection ~ 2500 1600
Wire Wire Line
	2500 1600 2500 1700
Connection ~ 2500 1700
Wire Wire Line
	2500 1700 2500 1800
Connection ~ 2500 1800
Wire Wire Line
	2500 1800 2500 1900
$Comp
L power:+5V #PWR0137
U 1 1 608B2F3F
P 2800 1000
F 0 "#PWR0137" H 2800 850 50  0001 C CNN
F 1 "+5V" H 2815 1173 50  0000 C CNN
F 2 "" H 2800 1000 50  0001 C CNN
F 3 "" H 2800 1000 50  0001 C CNN
	1    2800 1000
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 608B9B2C
P 2300 2500
AR Path="/608B9B2C" Ref="RN?"  Part="1" 
AR Path="/60757845/608B9B2C" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/608B9B2C" Ref="RN19"  Part="1" 
F 0 "RN19" H 2200 2600 50  0000 L CNN
F 1 "30Ω" H 2250 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 2580 50  0001 C CNN
F 3 "~" V 2300 2500 50  0001 C CNN
	1    2300 2500
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 608B9B32
P 2300 2600
AR Path="/608B9B32" Ref="RN?"  Part="2" 
AR Path="/60757845/608B9B32" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/608B9B32" Ref="RN19"  Part="2" 
F 0 "RN19" H 2400 2650 50  0001 L CNN
F 1 "30Ω" H 2275 2706 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 2680 50  0001 C CNN
F 3 "~" V 2300 2600 50  0001 C CNN
	2    2300 2600
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 608B9B38
P 2300 2700
AR Path="/608B9B38" Ref="RN?"  Part="3" 
AR Path="/60757845/608B9B38" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/608B9B38" Ref="RN19"  Part="3" 
F 0 "RN19" H 2400 2750 50  0001 L CNN
F 1 "30Ω" H 2275 2806 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 2780 50  0001 C CNN
F 3 "~" V 2300 2700 50  0001 C CNN
	3    2300 2700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 608B9B3E
P 2300 2800
AR Path="/608B9B3E" Ref="RN?"  Part="4" 
AR Path="/60757845/608B9B3E" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/608B9B3E" Ref="RN19"  Part="4" 
F 0 "RN19" H 2400 2850 50  0001 L CNN
F 1 "30Ω" H 2275 2906 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 2880 50  0001 C CNN
F 3 "~" V 2300 2800 50  0001 C CNN
	4    2300 2800
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R32
U 1 1 608C1D09
P 2250 2200
F 0 "R32" V 2150 2200 50  0000 C CNN
F 1 "10kΩ" V 2350 2200 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 2200 50  0001 C CNN
F 3 "~" H 2250 2200 50  0001 C CNN
	1    2250 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	1300 2200 2150 2200
Wire Wire Line
	1300 2500 2150 2500
Wire Wire Line
	1300 2600 2150 2600
Wire Wire Line
	1300 2700 2150 2700
Wire Wire Line
	1300 2800 2150 2800
Wire Wire Line
	2350 2200 2500 2200
Wire Wire Line
	2500 2200 2500 1900
Connection ~ 2500 1900
$Comp
L power:+5V #PWR0139
U 1 1 608D5C29
P 2800 2500
F 0 "#PWR0139" H 2800 2350 50  0001 C CNN
F 1 "+5V" H 2815 2673 50  0000 C CNN
F 2 "" H 2800 2500 50  0001 C CNN
F 3 "" H 2800 2500 50  0001 C CNN
	1    2800 2500
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP6
U 1 1 608D5C2F
P 2650 2500
F 0 "JP6" H 2650 2367 50  0000 C CNN
F 1 "SolderJumper_2_Open" V 2695 2568 50  0001 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2650 2500 50  0001 C CNN
F 3 "~" H 2650 2500 50  0001 C CNN
	1    2650 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 2500 2500 2500
Wire Wire Line
	2400 2800 2500 2800
Wire Wire Line
	2500 2800 2500 2700
Connection ~ 2500 2500
Wire Wire Line
	2400 2600 2500 2600
Connection ~ 2500 2600
Wire Wire Line
	2500 2600 2500 2500
Wire Wire Line
	2400 2700 2500 2700
Connection ~ 2500 2700
Wire Wire Line
	2500 2700 2500 2600
$Comp
L power:+5V #PWR0136
U 1 1 6091143C
P 2150 4400
F 0 "#PWR0136" H 2150 4250 50  0001 C CNN
F 1 "+5V" H 2165 4573 50  0000 C CNN
F 2 "" H 2150 4400 50  0001 C CNN
F 3 "" H 2150 4400 50  0001 C CNN
	1    2150 4400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 5050 2150 5150
Connection ~ 2150 5050
Wire Wire Line
	2150 4950 2150 5050
Connection ~ 2150 4950
Wire Wire Line
	2150 4850 2150 4950
Connection ~ 2150 4850
Wire Wire Line
	2150 4750 2150 4850
Connection ~ 2150 4750
Wire Wire Line
	2150 4650 2150 4750
Connection ~ 2150 4650
Wire Wire Line
	2150 4550 2150 4650
Connection ~ 2150 4550
Wire Wire Line
	2150 4450 2150 4550
Wire Wire Line
	2200 5150 2150 5150
Wire Wire Line
	2200 5050 2150 5050
Wire Wire Line
	2200 4950 2150 4950
Wire Wire Line
	2200 4850 2150 4850
Wire Wire Line
	2200 4750 2150 4750
Wire Wire Line
	2200 4650 2150 4650
Wire Wire Line
	2200 4550 2150 4550
Wire Wire Line
	2200 4450 2150 4450
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 608FE548
P 2300 4750
AR Path="/608FE548" Ref="RN?"  Part="4" 
AR Path="/60757845/608FE548" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/608FE548" Ref="RN20"  Part="4" 
F 0 "RN20" H 2400 4800 50  0001 L CNN
F 1 "30Ω" H 2275 4856 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 4830 50  0001 C CNN
F 3 "~" V 2300 4750 50  0001 C CNN
	4    2300 4750
	-1   0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 608FE542
P 2300 4650
AR Path="/608FE542" Ref="RN?"  Part="3" 
AR Path="/60757845/608FE542" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/608FE542" Ref="RN20"  Part="3" 
F 0 "RN20" H 2400 4700 50  0001 L CNN
F 1 "30Ω" H 2275 4756 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 4730 50  0001 C CNN
F 3 "~" V 2300 4650 50  0001 C CNN
	3    2300 4650
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 608FE53C
P 2300 4550
AR Path="/608FE53C" Ref="RN?"  Part="2" 
AR Path="/60757845/608FE53C" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/608FE53C" Ref="RN20"  Part="2" 
F 0 "RN20" H 2400 4600 50  0001 L CNN
F 1 "30Ω" H 2275 4656 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 4630 50  0001 C CNN
F 3 "~" V 2300 4550 50  0001 C CNN
	2    2300 4550
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 608FE536
P 2300 4450
AR Path="/608FE536" Ref="RN?"  Part="1" 
AR Path="/60757845/608FE536" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/608FE536" Ref="RN20"  Part="1" 
F 0 "RN20" H 2550 4350 50  0000 L CNN
F 1 "30Ω" H 2650 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 4530 50  0001 C CNN
F 3 "~" V 2300 4450 50  0001 C CNN
	1    2300 4450
	-1   0    0    -1  
$EndComp
Entry Bus Bus
	3000 4000 3100 4100
Text HLabel 1900 4000 0    50   Input ~ 0
CFT-FPD[0..7]
$Comp
L alexios:74HC541 U28
U 1 1 609488C8
P 4650 4950
F 0 "U28" H 4650 5717 50  0000 C CNN
F 1 "74HC541" H 4650 5626 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4650 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4650 4950 50  0001 C CNN
	1    4650 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5350 4100 5350
Text Label 4000 5350 2    50   ~ 0
~PANELEN
Wire Wire Line
	4100 5350 4100 5450
Wire Wire Line
	4100 5450 4150 5450
Connection ~ 4100 5350
Wire Wire Line
	4100 5350 3600 5350
Text HLabel 3600 5350 0    50   Input ~ 0
~PANELEN
Text Label 5450 4750 2    50   ~ 0
FPD3
Text Label 5450 4650 2    50   ~ 0
FPD2
Text Label 5450 4550 2    50   ~ 0
FPD1
Text Label 5450 4450 2    50   ~ 0
FPD0
Wire Wire Line
	5500 4750 5150 4750
Wire Wire Line
	5500 4650 5150 4650
Wire Wire Line
	5500 4550 5150 4550
Wire Wire Line
	5500 4450 5150 4450
Text Label 5450 5150 2    50   ~ 0
FPD7
Text Label 5450 5050 2    50   ~ 0
FPD6
Text Label 5450 4950 2    50   ~ 0
FPD5
Text Label 5450 4850 2    50   ~ 0
FPD4
Wire Wire Line
	5500 5150 5150 5150
Wire Wire Line
	5500 5050 5150 5050
Wire Wire Line
	5500 4950 5150 4950
Wire Wire Line
	5500 4850 5150 4850
Entry Wire Line
	5600 4350 5500 4450
Entry Wire Line
	5600 4450 5500 4550
Entry Wire Line
	5600 4550 5500 4650
Entry Wire Line
	5600 4650 5500 4750
Entry Wire Line
	5600 4750 5500 4850
Entry Wire Line
	5600 4850 5500 4950
Entry Wire Line
	5600 4950 5500 5050
Entry Wire Line
	5600 5050 5500 5150
Text Label 3250 5150 0    50   ~ 0
CFT-FPD7
Text Label 3250 5050 0    50   ~ 0
CFT-FPD6
Text Label 3250 4950 0    50   ~ 0
CFT-FPD5
Text Label 3250 4850 0    50   ~ 0
CFT-FPD4
Text Label 3250 4750 0    50   ~ 0
CFT-FPD3
Text Label 3250 4650 0    50   ~ 0
CFT-FPD2
Text Label 3250 4550 0    50   ~ 0
CFT-FPD1
Text Label 3250 4450 0    50   ~ 0
CFT-FPD0
Text Label 2900 5150 2    50   ~ 0
CFT-FPD7
Text Label 2900 5050 2    50   ~ 0
CFT-FPD6
Text Label 2900 4950 2    50   ~ 0
CFT-FPD5
Text Label 2900 4850 2    50   ~ 0
CFT-FPD4
Text Label 2900 4750 2    50   ~ 0
CFT-FPD3
Text Label 2900 4650 2    50   ~ 0
CFT-FPD2
Text Label 2900 4550 2    50   ~ 0
CFT-FPD1
Text Label 2900 4450 2    50   ~ 0
CFT-FPD0
Connection ~ 2150 4450
Wire Wire Line
	3200 4450 3900 4450
Wire Wire Line
	3200 4550 3900 4550
Wire Wire Line
	3200 4650 3900 4650
Wire Wire Line
	3200 4750 3900 4750
Wire Wire Line
	3200 4850 3900 4850
Wire Wire Line
	3200 4950 3900 4950
Wire Wire Line
	3200 5050 3900 5050
Wire Wire Line
	3200 5150 3900 5150
Entry Bus Bus
	5700 4000 5600 4100
Wire Bus Line
	9750 4000 5700 4000
Text HLabel 9750 4000 2    50   UnSpc ~ 0
FPD[0..7]
Wire Wire Line
	1300 1000 2150 1000
Wire Wire Line
	1300 1100 2150 1100
Wire Wire Line
	1300 1200 2150 1200
Wire Wire Line
	1300 1300 2150 1300
Wire Wire Line
	10500 1600 10500 1500
Connection ~ 10500 1300
Connection ~ 10500 1400
Wire Wire Line
	10500 1400 10500 1300
Connection ~ 10500 1500
Wire Wire Line
	10500 1500 10500 1400
$Comp
L Jumper:SolderJumper_2_Open JP7
U 1 1 60C5BA86
P 10500 1150
F 0 "JP7" V 10500 1062 50  0000 R CNN
F 1 "SolderJumper_2_Open" V 10545 1218 50  0001 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 10500 1150 50  0001 C CNN
F 3 "~" H 10500 1150 50  0001 C CNN
	1    10500 1150
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0149
U 1 1 60C5BA8C
P 10500 1000
F 0 "#PWR0149" H 10500 850 50  0001 C CNN
F 1 "+5V" H 10515 1173 50  0000 C CNN
F 2 "" H 10500 1000 50  0001 C CNN
F 3 "" H 10500 1000 50  0001 C CNN
	1    10500 1000
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6096B7E4
P 4000 4850
AR Path="/6096B7E4" Ref="RN?"  Part="1" 
AR Path="/60757845/6096B7E4" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6096B7E4" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/6096B7E4" Ref="RN23"  Part="1" 
F 0 "RN23" H 4150 4500 50  0000 L CNN
F 1 "30Ω" H 4200 4450 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4000 4930 50  0001 C CNN
F 3 "~" V 4000 4850 50  0001 C CNN
	1    4000 4850
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6096B7EA
P 4000 4450
AR Path="/6096B7EA" Ref="RN?"  Part="1" 
AR Path="/60757845/6096B7EA" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6096B7EA" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/6096B7EA" Ref="RN22"  Part="1" 
F 0 "RN22" H 3850 4650 50  0000 L CNN
F 1 "30Ω" H 3950 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4000 4530 50  0001 C CNN
F 3 "~" V 4000 4450 50  0001 C CNN
	1    4000 4450
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6096B7F0
P 4000 4550
AR Path="/6096B7F0" Ref="RN?"  Part="2" 
AR Path="/60757845/6096B7F0" Ref="RN?"  Part="2" 
AR Path="/64FC7999/6096B7F0" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/6096B7F0" Ref="RN22"  Part="2" 
F 0 "RN22" H 4100 4600 50  0001 L CNN
F 1 "30Ω" H 3975 4656 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4000 4630 50  0001 C CNN
F 3 "~" V 4000 4550 50  0001 C CNN
	2    4000 4550
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6096B7F6
P 4000 4650
AR Path="/6096B7F6" Ref="RN?"  Part="3" 
AR Path="/60757845/6096B7F6" Ref="RN?"  Part="3" 
AR Path="/64FC7999/6096B7F6" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/6096B7F6" Ref="RN22"  Part="3" 
F 0 "RN22" H 4100 4700 50  0001 L CNN
F 1 "30Ω" H 3975 4756 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4000 4730 50  0001 C CNN
F 3 "~" V 4000 4650 50  0001 C CNN
	3    4000 4650
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6096B7FC
P 4000 4750
AR Path="/6096B7FC" Ref="RN?"  Part="4" 
AR Path="/60757845/6096B7FC" Ref="RN?"  Part="4" 
AR Path="/64FC7999/6096B7FC" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/6096B7FC" Ref="RN@@1"  Part="1" 
F 0 "RN@@1" H 4100 4800 50  0001 L CNN
F 1 "30Ω" H 3975 4856 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4000 4830 50  0001 C CNN
F 3 "~" V 4000 4750 50  0001 C CNN
	1    4000 4750
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6096B802
P 4000 4950
AR Path="/6096B802" Ref="RN?"  Part="2" 
AR Path="/60757845/6096B802" Ref="RN?"  Part="2" 
AR Path="/64FC7999/6096B802" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/6096B802" Ref="RN23"  Part="2" 
F 0 "RN23" H 4100 5000 50  0001 L CNN
F 1 "30Ω" H 3975 5056 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4000 5030 50  0001 C CNN
F 3 "~" V 4000 4950 50  0001 C CNN
	2    4000 4950
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6096B808
P 4000 5050
AR Path="/6096B808" Ref="RN?"  Part="3" 
AR Path="/60757845/6096B808" Ref="RN?"  Part="3" 
AR Path="/64FC7999/6096B808" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/6096B808" Ref="RN23"  Part="3" 
F 0 "RN23" H 4100 5100 50  0001 L CNN
F 1 "30Ω" H 3975 5156 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4000 5130 50  0001 C CNN
F 3 "~" V 4000 5050 50  0001 C CNN
	3    4000 5050
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6096B80E
P 4000 5150
AR Path="/6096B80E" Ref="RN?"  Part="4" 
AR Path="/60757845/6096B80E" Ref="RN?"  Part="4" 
AR Path="/64FC7999/6096B80E" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/6096B80E" Ref="RN23"  Part="4" 
F 0 "RN23" H 3900 5000 50  0001 L CNN
F 1 "30Ω" H 4200 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4000 5230 50  0001 C CNN
F 3 "~" V 4000 5150 50  0001 C CNN
	4    4000 5150
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60C70DA9
P 10250 1700
AR Path="/60C70DA9" Ref="RN?"  Part="1" 
AR Path="/60757845/60C70DA9" Ref="RN?"  Part="1" 
AR Path="/64FC7999/60C70DA9" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/60C70DA9" Ref="RN27"  Part="3" 
F 0 "RN27" H 10400 1350 50  0000 L CNN
F 1 "30Ω" H 10450 1300 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 10250 1780 50  0001 C CNN
F 3 "~" V 10250 1700 50  0001 C CNN
	3    10250 1700
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60C70DAF
P 7200 5050
AR Path="/60C70DAF" Ref="RN?"  Part="1" 
AR Path="/60757845/60C70DAF" Ref="RN?"  Part="1" 
AR Path="/64FC7999/60C70DAF" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/60C70DAF" Ref="RN25"  Part="3" 
F 0 "RN25" H 7100 5300 50  0001 L CNN
F 1 "30Ω" H 7150 5150 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7200 5130 50  0001 C CNN
F 3 "~" V 7200 5050 50  0001 C CNN
	3    7200 5050
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60C70DB5
P 7200 5150
AR Path="/60C70DB5" Ref="RN?"  Part="2" 
AR Path="/60757845/60C70DB5" Ref="RN?"  Part="2" 
AR Path="/64FC7999/60C70DB5" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/60C70DB5" Ref="RN25"  Part="4" 
F 0 "RN25" H 7300 5250 50  0000 L CNN
F 1 "30Ω" H 7175 5256 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7200 5230 50  0001 C CNN
F 3 "~" V 7200 5150 50  0001 C CNN
	4    7200 5150
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60C70DC1
P 10250 1600
AR Path="/60C70DC1" Ref="RN?"  Part="4" 
AR Path="/60757845/60C70DC1" Ref="RN?"  Part="4" 
AR Path="/64FC7999/60C70DC1" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/60C70DC1" Ref="RN27"  Part="2" 
F 0 "RN27" H 10350 1650 50  0001 L CNN
F 1 "30Ω" H 10225 1706 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 10250 1680 50  0001 C CNN
F 3 "~" V 10250 1600 50  0001 C CNN
	2    10250 1600
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60C70DC7
P 10250 1800
AR Path="/60C70DC7" Ref="RN?"  Part="2" 
AR Path="/60757845/60C70DC7" Ref="RN?"  Part="2" 
AR Path="/64FC7999/60C70DC7" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/60C70DC7" Ref="RN27"  Part="4" 
F 0 "RN27" H 10350 1850 50  0001 L CNN
F 1 "30Ω" H 10225 1906 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 10250 1880 50  0001 C CNN
F 3 "~" V 10250 1800 50  0001 C CNN
	4    10250 1800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10500 2000 10500 1900
Connection ~ 10500 1600
Connection ~ 10500 1700
Wire Wire Line
	10500 1700 10500 1600
Connection ~ 10500 1800
Wire Wire Line
	10500 1800 10500 1700
Connection ~ 10500 1900
Wire Wire Line
	10500 1900 10500 1800
Wire Wire Line
	10400 2000 10500 2000
Wire Wire Line
	10400 1900 10500 1900
Wire Wire Line
	10400 1800 10500 1800
Wire Wire Line
	10400 1700 10500 1700
Wire Wire Line
	10400 1600 10500 1600
Wire Wire Line
	10400 1500 10500 1500
Wire Wire Line
	10400 1400 10500 1400
Wire Wire Line
	10400 1300 10500 1300
Text HLabel 9100 1000 0    50   Input ~ 0
~IRQ[0..7]
Wire Bus Line
	9400 1000 9100 1000
Entry Bus Bus
	9400 1000 9500 1100
Entry Wire Line
	9500 1900 9600 2000
Entry Wire Line
	9500 1800 9600 1900
Entry Wire Line
	9500 1700 9600 1800
Entry Wire Line
	9500 1600 9600 1700
Entry Wire Line
	9500 1500 9600 1600
Entry Wire Line
	9500 1400 9600 1500
Entry Wire Line
	9500 1300 9600 1400
Entry Wire Line
	9500 1200 9600 1300
Text Label 9700 2000 0    50   ~ 0
~IRQ7
Text Label 9700 1900 0    50   ~ 0
~IRQ6
Text Label 9700 1800 0    50   ~ 0
~IRQ5
Text Label 9700 1700 0    50   ~ 0
~IRQ4
Text Label 9700 1600 0    50   ~ 0
~IRQ3
Text Label 9700 1500 0    50   ~ 0
~IRQ2
Text Label 9700 1400 0    50   ~ 0
~IRQ1
Text Label 9700 1300 0    50   ~ 0
~IRQ0
Wire Wire Line
	9600 2000 10150 2000
Wire Wire Line
	9600 1900 10150 1900
Wire Wire Line
	9600 1800 10150 1800
Wire Wire Line
	9600 1700 10150 1700
Wire Wire Line
	9600 1600 10150 1600
Wire Wire Line
	9600 1500 10150 1500
Wire Wire Line
	9600 1400 10150 1400
Wire Wire Line
	9600 1300 10150 1300
Text HLabel 9300 2550 0    50   UnSpc ~ 0
~IRQ
Text Label 9400 2550 0    50   ~ 0
~IRQ
$Comp
L Device:R_Small R33
U 1 1 60DE16D6
P 10250 2550
F 0 "R33" V 10150 2550 50  0000 C CNN
F 1 "10kΩ" V 10350 2550 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10250 2550 50  0001 C CNN
F 3 "~" H 10250 2550 50  0001 C CNN
	1    10250 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 2550 10150 2550
Wire Wire Line
	10350 2550 10450 2550
$Comp
L Jumper:SolderJumper_2_Open JP8
U 1 1 60DF07EC
P 10650 2550
F 0 "JP8" H 10650 2663 50  0000 C CNN
F 1 "SolderJumper_2_Open" V 10695 2618 50  0001 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 10650 2550 50  0001 C CNN
F 3 "~" H 10650 2550 50  0001 C CNN
	1    10650 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0150
U 1 1 60DF5410
P 10800 2550
F 0 "#PWR0150" H 10800 2400 50  0001 C CNN
F 1 "+5V" H 10815 2723 50  0000 C CNN
F 2 "" H 10800 2550 50  0001 C CNN
F 3 "" H 10800 2550 50  0001 C CNN
	1    10800 2550
	1    0    0    -1  
$EndComp
Text HLabel 9300 2850 0    50   UnSpc ~ 0
~IRQS
Text Label 9400 2850 0    50   ~ 0
~IRQS
$Comp
L Device:R_Small R34
U 1 1 60DF5C82
P 10250 2850
F 0 "R34" V 10150 2850 50  0000 C CNN
F 1 "10kΩ" V 10350 2850 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10250 2850 50  0001 C CNN
F 3 "~" H 10250 2850 50  0001 C CNN
	1    10250 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 2850 10150 2850
Wire Wire Line
	10350 2850 10450 2850
Wire Wire Line
	10450 2850 10450 2550
Connection ~ 10450 2550
Wire Wire Line
	10450 2550 10500 2550
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610E2605
P 7200 4450
AR Path="/610E2605" Ref="RN?"  Part="1" 
AR Path="/60757845/610E2605" Ref="RN?"  Part="1" 
AR Path="/64FC7999/610E2605" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/610E2605" Ref="RN24"  Part="1" 
F 0 "RN24" H 7050 4650 50  0000 L CNN
F 1 "30Ω" H 7150 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7200 4530 50  0001 C CNN
F 3 "~" V 7200 4450 50  0001 C CNN
	1    7200 4450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610E260B
P 7200 4550
AR Path="/610E260B" Ref="RN?"  Part="2" 
AR Path="/60757845/610E260B" Ref="RN?"  Part="2" 
AR Path="/64FC7999/610E260B" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/610E260B" Ref="RN24"  Part="2" 
F 0 "RN24" H 7300 4600 50  0001 L CNN
F 1 "30Ω" H 7175 4656 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7200 4630 50  0001 C CNN
F 3 "~" V 7200 4550 50  0001 C CNN
	2    7200 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610E2611
P 7200 4650
AR Path="/610E2611" Ref="RN?"  Part="3" 
AR Path="/60757845/610E2611" Ref="RN?"  Part="3" 
AR Path="/64FC7999/610E2611" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/610E2611" Ref="RN24"  Part="3" 
F 0 "RN24" H 7300 4700 50  0001 L CNN
F 1 "30Ω" H 7175 4756 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7200 4730 50  0001 C CNN
F 3 "~" V 7200 4650 50  0001 C CNN
	3    7200 4650
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610E2623
P 7200 4850
AR Path="/610E2623" Ref="RN?"  Part="3" 
AR Path="/60757845/610E2623" Ref="RN?"  Part="3" 
AR Path="/64FC7999/610E2623" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/610E2623" Ref="RN25"  Part="1" 
F 0 "RN25" H 7300 4900 50  0001 L CNN
F 1 "30Ω" H 7175 4956 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7200 4930 50  0001 C CNN
F 3 "~" V 7200 4850 50  0001 C CNN
	1    7200 4850
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610E2629
P 7200 4950
AR Path="/610E2629" Ref="RN?"  Part="4" 
AR Path="/60757845/610E2629" Ref="RN?"  Part="4" 
AR Path="/64FC7999/610E2629" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/610E2629" Ref="RN25"  Part="2" 
F 0 "RN25" H 7100 4800 50  0001 L CNN
F 1 "30Ω" H 7200 4850 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7200 5030 50  0001 C CNN
F 3 "~" V 7200 4950 50  0001 C CNN
	2    7200 4950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U29
U 1 1 610ECA86
P 6550 4950
F 0 "U29" H 6550 5717 50  0000 C CNN
F 1 "74HC541" H 6550 5626 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6550 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6550 4950 50  0001 C CNN
	1    6550 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5350 6000 5350
Wire Wire Line
	6050 5450 6000 5450
$Comp
L power:GND #PWR0142
U 1 1 61109400
P 6000 5500
F 0 "#PWR0142" H 6000 5250 50  0001 C CNN
F 1 "GND" H 6005 5327 50  0000 C CNN
F 2 "" H 6000 5500 50  0001 C CNN
F 3 "" H 6000 5500 50  0001 C CNN
	1    6000 5500
	1    0    0    -1  
$EndComp
Text Label 7750 4450 2    50   ~ 0
FP-FPD0
Text Label 7750 4550 2    50   ~ 0
FP-FPD1
Text Label 7750 4650 2    50   ~ 0
FP-FPD2
Text Label 7750 4750 2    50   ~ 0
FP-FPD3
Text Label 7750 4850 2    50   ~ 0
FP-FPD4
Text Label 7750 4950 2    50   ~ 0
FP-FPD5
Text Label 7750 5050 2    50   ~ 0
FP-FPD6
Text Label 7750 5150 2    50   ~ 0
FP-FPD7
Entry Wire Line
	9450 4350 9350 4450
Entry Wire Line
	9450 4450 9350 4550
Entry Wire Line
	9450 4550 9350 4650
Entry Wire Line
	9450 4650 9350 4750
Entry Wire Line
	9450 4750 9350 4850
Entry Wire Line
	9450 4850 9350 4950
Entry Wire Line
	9450 4950 9350 5050
Entry Wire Line
	9450 5050 9350 5150
Entry Wire Line
	5600 4350 5700 4450
Entry Wire Line
	5600 4450 5700 4550
Entry Wire Line
	5600 4550 5700 4650
Entry Wire Line
	5600 4650 5700 4750
Entry Wire Line
	5600 4750 5700 4850
Entry Wire Line
	5600 4850 5700 4950
Entry Wire Line
	5600 4950 5700 5050
Entry Wire Line
	5600 5050 5700 5150
Text Label 6000 4750 2    50   ~ 0
FPD3
Text Label 6000 4650 2    50   ~ 0
FPD2
Text Label 6000 4550 2    50   ~ 0
FPD1
Text Label 6000 4450 2    50   ~ 0
FPD0
Wire Wire Line
	6050 4750 5700 4750
Wire Wire Line
	6050 4650 5700 4650
Wire Wire Line
	6050 4550 5700 4550
Wire Wire Line
	6050 4450 5700 4450
Text Label 6000 5150 2    50   ~ 0
FPD7
Text Label 6000 5050 2    50   ~ 0
FPD6
Text Label 6000 4950 2    50   ~ 0
FPD5
Text Label 6000 4850 2    50   ~ 0
FPD4
Wire Wire Line
	6050 5150 5700 5150
Wire Wire Line
	6050 5050 5700 5050
Wire Wire Line
	6050 4950 5700 4950
Wire Wire Line
	6050 4850 5700 4850
Text HLabel 9750 4150 2    50   UnSpc ~ 0
FP-FPD[0..7]
Wire Bus Line
	9750 4150 9550 4150
Entry Bus Bus
	9550 4150 9450 4250
Wire Wire Line
	6000 5350 6000 5450
Connection ~ 6000 5450
Wire Wire Line
	6000 5450 6000 5500
$Comp
L power:GND #PWR0145
U 1 1 5FDEF369
P 7950 5500
F 0 "#PWR0145" H 7950 5250 50  0001 C CNN
F 1 "GND" H 7955 5327 50  0000 C CNN
F 2 "" H 7950 5500 50  0001 C CNN
F 3 "" H 7950 5500 50  0001 C CNN
	1    7950 5500
	1    0    0    -1  
$EndComp
$Comp
L alexios:PESD5V2S2UT D18
U 1 1 5FDFD084
P 8350 5400
F 0 "D18" H 8250 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8250 5150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8350 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 8250 5425 50  0001 C CNN
	1    8350 5400
	1    0    0    -1  
$EndComp
$Comp
L alexios:PESD5V2S2UT D19
U 1 1 5FE16E3D
P 8750 5400
F 0 "D19" H 8650 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8650 5150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8750 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 8650 5425 50  0001 C CNN
	1    8750 5400
	1    0    0    -1  
$EndComp
$Comp
L alexios:PESD5V2S2UT D20
U 1 1 5FE16E43
P 9150 5400
F 0 "D20" H 9050 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 9050 5150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9150 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 9050 5425 50  0001 C CNN
	1    9150 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 5FE492B5
P 8350 5500
F 0 "#PWR0146" H 8350 5250 50  0001 C CNN
F 1 "GND" H 8355 5327 50  0000 C CNN
F 2 "" H 8350 5500 50  0001 C CNN
F 3 "" H 8350 5500 50  0001 C CNN
	1    8350 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0147
U 1 1 5FE49524
P 8750 5500
F 0 "#PWR0147" H 8750 5250 50  0001 C CNN
F 1 "GND" H 8755 5327 50  0000 C CNN
F 2 "" H 8750 5500 50  0001 C CNN
F 3 "" H 8750 5500 50  0001 C CNN
	1    8750 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0148
U 1 1 5FE4971B
P 9150 5500
F 0 "#PWR0148" H 9150 5250 50  0001 C CNN
F 1 "GND" H 9155 5327 50  0000 C CNN
F 2 "" H 9150 5500 50  0001 C CNN
F 3 "" H 9150 5500 50  0001 C CNN
	1    9150 5500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U28
U 2 1 5FE8D228
P 4650 6000
F 0 "U28" H 4830 6046 50  0000 L CNN
F 1 "74HC541" H 4830 5955 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4650 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4650 6000 50  0001 C CNN
	2    4650 6000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U29
U 2 1 5FE8DA93
P 6550 6000
F 0 "U29" H 6730 6046 50  0000 L CNN
F 1 "74HC541" H 6730 5955 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 6550 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6550 6000 50  0001 C CNN
	2    6550 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FEB43D9
P 6200 6000
AR Path="/5FEB43D9" Ref="C?"  Part="1" 
AR Path="/60757845/5FEB43D9" Ref="C?"  Part="1" 
AR Path="/64FC7999/5FEB43D9" Ref="C?"  Part="1" 
AR Path="/60A2F3C0/5FEB43D9" Ref="C49"  Part="1" 
F 0 "C49" H 6109 6046 50  0000 R CNN
F 1 "100nF" H 6109 5955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6200 6000 50  0001 C CNN
F 3 "~" H 6200 6000 50  0001 C CNN
	1    6200 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FEB43DF
P 6200 5900
AR Path="/5FEB43DF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEB43DF" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEB43DF" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEB43DF" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 6200 5750 50  0001 C CNN
F 1 "+5V" H 6215 6073 50  0000 C CNN
F 2 "" H 6200 5900 50  0001 C CNN
F 3 "" H 6200 5900 50  0001 C CNN
	1    6200 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FEB43E5
P 6200 6100
AR Path="/5FEB43E5" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEB43E5" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEB43E5" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEB43E5" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 6200 5850 50  0001 C CNN
F 1 "GND" H 6205 5927 50  0000 C CNN
F 2 "" H 6200 6100 50  0001 C CNN
F 3 "" H 6200 6100 50  0001 C CNN
	1    6200 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FEBAF89
P 4300 6000
AR Path="/5FEBAF89" Ref="C?"  Part="1" 
AR Path="/60757845/5FEBAF89" Ref="C?"  Part="1" 
AR Path="/64FC7999/5FEBAF89" Ref="C?"  Part="1" 
AR Path="/60A2F3C0/5FEBAF89" Ref="C48"  Part="1" 
F 0 "C48" H 4209 6046 50  0000 R CNN
F 1 "100nF" H 4209 5955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4300 6000 50  0001 C CNN
F 3 "~" H 4300 6000 50  0001 C CNN
	1    4300 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FEBAF8F
P 4300 5900
AR Path="/5FEBAF8F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEBAF8F" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEBAF8F" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEBAF8F" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 4300 5750 50  0001 C CNN
F 1 "+5V" H 4315 6073 50  0000 C CNN
F 2 "" H 4300 5900 50  0001 C CNN
F 3 "" H 4300 5900 50  0001 C CNN
	1    4300 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FEBAF95
P 4300 6100
AR Path="/5FEBAF95" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEBAF95" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEBAF95" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEBAF95" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 4300 5850 50  0001 C CNN
F 1 "GND" H 4305 5927 50  0000 C CNN
F 2 "" H 4300 6100 50  0001 C CNN
F 3 "" H 4300 6100 50  0001 C CNN
	1    4300 6100
	1    0    0    -1  
$EndComp
Connection ~ 6200 5900
Connection ~ 6200 6100
Entry Wire Line
	3200 5150 3100 5050
Entry Wire Line
	3200 5050 3100 4950
Entry Wire Line
	3200 4950 3100 4850
Entry Wire Line
	3200 4850 3100 4750
Entry Wire Line
	3200 4750 3100 4650
Entry Wire Line
	3200 4650 3100 4550
Entry Wire Line
	3200 4550 3100 4450
Entry Wire Line
	3200 4450 3100 4350
Wire Bus Line
	1900 4000 3000 4000
Entry Wire Line
	3000 5150 3100 5050
Entry Wire Line
	3000 5050 3100 4950
Entry Wire Line
	3000 4950 3100 4850
Entry Wire Line
	3000 4750 3100 4650
Entry Wire Line
	3000 4650 3100 4550
Entry Wire Line
	3000 4550 3100 4450
Entry Wire Line
	3000 4450 3100 4350
Entry Wire Line
	3000 4850 3100 4750
Wire Wire Line
	3000 5150 2450 5150
Wire Wire Line
	3000 5050 2450 5050
Wire Wire Line
	3000 4950 2450 4950
Wire Wire Line
	3000 4850 2450 4850
Wire Wire Line
	3000 4750 2450 4750
Wire Wire Line
	3000 4650 2450 4650
Wire Wire Line
	3000 4550 2450 4550
Wire Wire Line
	3000 4450 2450 4450
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 5FF75FE0
P 2300 5150
AR Path="/5FF75FE0" Ref="RN?"  Part="4" 
AR Path="/60757845/5FF75FE0" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/5FF75FE0" Ref="RN21"  Part="4" 
F 0 "RN21" H 2400 5200 50  0001 L CNN
F 1 "30Ω" H 2275 5256 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 5230 50  0001 C CNN
F 3 "~" V 2300 5150 50  0001 C CNN
	4    2300 5150
	-1   0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 5FF75FE6
P 2300 5050
AR Path="/5FF75FE6" Ref="RN?"  Part="3" 
AR Path="/60757845/5FF75FE6" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/5FF75FE6" Ref="RN21"  Part="3" 
F 0 "RN21" H 2400 5100 50  0001 L CNN
F 1 "30Ω" H 2275 5156 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 5130 50  0001 C CNN
F 3 "~" V 2300 5050 50  0001 C CNN
	3    2300 5050
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 5FF75FEC
P 2300 4950
AR Path="/5FF75FEC" Ref="RN?"  Part="2" 
AR Path="/60757845/5FF75FEC" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/5FF75FEC" Ref="RN21"  Part="2" 
F 0 "RN21" H 2400 5000 50  0001 L CNN
F 1 "30Ω" H 2275 5056 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 5030 50  0001 C CNN
F 3 "~" V 2300 4950 50  0001 C CNN
	2    2300 4950
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 5FF75FF2
P 2300 4850
AR Path="/5FF75FF2" Ref="RN?"  Part="1" 
AR Path="/60757845/5FF75FF2" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/5FF75FF2" Ref="RN21"  Part="1" 
F 0 "RN21" H 2550 4750 50  0000 L CNN
F 1 "30Ω" H 2650 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2300 4930 50  0001 C CNN
F 3 "~" V 2300 4850 50  0001 C CNN
	1    2300 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 4400 2150 4450
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60C70DBB
P 10250 1500
AR Path="/60C70DBB" Ref="RN?"  Part="3" 
AR Path="/60757845/60C70DBB" Ref="RN?"  Part="3" 
AR Path="/64FC7999/60C70DBB" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/60C70DBB" Ref="RN27"  Part="1" 
F 0 "RN27" H 10350 1550 50  0001 L CNN
F 1 "30Ω" H 10225 1606 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 10250 1580 50  0001 C CNN
F 3 "~" V 10250 1500 50  0001 C CNN
	1    10250 1500
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610E2617
P 7200 4750
AR Path="/610E2617" Ref="RN?"  Part="4" 
AR Path="/60757845/610E2617" Ref="RN?"  Part="4" 
AR Path="/64FC7999/610E2617" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/610E2617" Ref="RN24"  Part="4" 
F 0 "RN24" H 7300 4800 50  0001 L CNN
F 1 "30Ω" H 7175 4856 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7200 4830 50  0001 C CNN
F 3 "~" V 7200 4750 50  0001 C CNN
	4    7200 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4450 8050 4450
Wire Wire Line
	7300 4550 9350 4550
Wire Wire Line
	7300 4650 7850 4650
Wire Wire Line
	7300 4750 9350 4750
Wire Wire Line
	7300 4850 9350 4850
Wire Wire Line
	7300 4950 9350 4950
Wire Wire Line
	7300 5050 9350 5050
Wire Wire Line
	7300 5150 9350 5150
$Comp
L alexios:PESD5V2S2UT D17
U 1 1 5FDE6D00
P 7950 5400
F 0 "D17" H 7850 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 7850 5150 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7950 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 7850 5425 50  0001 C CNN
	1    7950 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5250 8050 4450
Connection ~ 8050 4450
Wire Wire Line
	8050 4450 9350 4450
Wire Wire Line
	7850 5250 7850 4650
Wire Bus Line
	3100 4100 3100 5050
Wire Bus Line
	9450 4250 9450 5050
Wire Bus Line
	9500 1100 9500 1900
Wire Bus Line
	5600 4100 5600 5050
Connection ~ 7850 4650
Wire Wire Line
	7850 4650 9350 4650
$EndSCHEMATC
