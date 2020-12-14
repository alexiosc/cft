EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 11
Title "Bus Hold"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 "Needs cleanup!"
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1250 2350 0    50   UnSpc ~ 0
CLK1
Text HLabel 1250 2450 0    50   UnSpc ~ 0
CLK2
Text HLabel 1250 2950 0    50   UnSpc ~ 0
T34
Text HLabel 1250 2550 0    50   UnSpc ~ 0
CLK3
Text HLabel 1250 2650 0    50   UnSpc ~ 0
CLK4
Text Label 1350 3250 0    50   ~ 0
~MEM
Text Label 1350 3450 0    50   ~ 0
~R
Text Label 1350 3550 0    50   ~ 0
~W
Text Label 1350 2550 0    50   ~ 0
CLK3
Text Label 1350 2650 0    50   ~ 0
CLK4
Text Label 1350 2350 0    50   ~ 0
CLK1
Text Label 1350 2450 0    50   ~ 0
CLK2
Text Label 1350 2950 0    50   ~ 0
T34
Text Label 1350 3350 0    50   ~ 0
~IO
Text HLabel 1250 3350 0    50   UnSpc ~ 0
~IO
Text HLabel 1250 3250 0    50   UnSpc ~ 0
~MEM
Text HLabel 1250 3450 0    50   UnSpc ~ 0
~R
Text HLabel 1250 3550 0    50   UnSpc ~ 0
~W
Text Label 1350 1750 0    50   ~ 0
~SYSDEV
Text HLabel 1250 1750 0    50   UnSpc ~ 0
~SYSDEV
Text Label 1350 1850 0    50   ~ 0
~IODEV1xx
Text HLabel 1250 1850 0    50   UnSpc ~ 0
~IODEV1xx
Text Label 1350 1950 0    50   ~ 0
~IODEV2xx
Text HLabel 1250 1950 0    50   UnSpc ~ 0
~IODEV2xx
Text Label 1350 2050 0    50   ~ 0
~IODEV3xx
Text HLabel 1250 2050 0    50   UnSpc ~ 0
~IODEV3xx
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60885B62
P 2250 1750
AR Path="/60885B62" Ref="RN?"  Part="1" 
AR Path="/60757845/60885B62" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/60885B62" Ref="RN?"  Part="1" 
F 0 "RN?" H 2150 1850 50  0000 L CNN
F 1 "10kΩ" H 2200 1350 50  0000 C CNN
F 2 "" H 2250 1830 50  0001 C CNN
F 3 "~" V 2250 1750 50  0001 C CNN
	1    2250 1750
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60885B68
P 2250 1850
AR Path="/60885B68" Ref="RN?"  Part="2" 
AR Path="/60757845/60885B68" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/60885B68" Ref="RN?"  Part="2" 
F 0 "RN?" H 2350 1900 50  0001 L CNN
F 1 "30Ω" H 2225 1956 50  0001 C CNN
F 2 "" H 2250 1930 50  0001 C CNN
F 3 "~" V 2250 1850 50  0001 C CNN
	2    2250 1850
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60885B6E
P 2250 1950
AR Path="/60885B6E" Ref="RN?"  Part="3" 
AR Path="/60757845/60885B6E" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/60885B6E" Ref="RN?"  Part="3" 
F 0 "RN?" H 2350 2000 50  0001 L CNN
F 1 "30Ω" H 2225 2056 50  0001 C CNN
F 2 "" H 2250 2030 50  0001 C CNN
F 3 "~" V 2250 1950 50  0001 C CNN
	3    2250 1950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60885B74
P 2250 2050
AR Path="/60885B74" Ref="RN?"  Part="4" 
AR Path="/60757845/60885B74" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/60885B74" Ref="RN?"  Part="4" 
F 0 "RN?" H 2350 2100 50  0001 L CNN
F 1 "30Ω" H 2225 2156 50  0001 C CNN
F 2 "" H 2250 2130 50  0001 C CNN
F 3 "~" V 2250 2050 50  0001 C CNN
	4    2250 2050
	1    0    0    1   
$EndComp
Wire Wire Line
	2350 1750 2450 1750
Wire Wire Line
	2350 1850 2450 1850
Wire Wire Line
	2350 1950 2450 1950
Wire Wire Line
	2350 2050 2450 2050
Wire Wire Line
	2450 2050 2450 1950
Connection ~ 2450 1750
Connection ~ 2450 1850
Wire Wire Line
	2450 1850 2450 1750
Connection ~ 2450 1950
Wire Wire Line
	2450 1950 2450 1850
$Comp
L power:+5V #PWR?
U 1 1 60888F69
P 2750 2350
F 0 "#PWR?" H 2750 2200 50  0001 C CNN
F 1 "+5V" H 2765 2523 50  0000 C CNN
F 2 "" H 2750 2350 50  0001 C CNN
F 3 "" H 2750 2350 50  0001 C CNN
	1    2750 2350
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 6089638C
P 2600 1750
F 0 "JP?" H 2600 1617 50  0000 C CNN
F 1 "SolderJumper_2_Open" V 2645 1818 50  0001 L CNN
F 2 "" H 2600 1750 50  0001 C CNN
F 3 "~" H 2600 1750 50  0001 C CNN
	1    2600 1750
	-1   0    0    1   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 608A053D
P 2600 2350
F 0 "JP?" H 2600 2217 50  0000 C CNN
F 1 "SolderJumper_2_Open" V 2645 2418 50  0001 L CNN
F 2 "" H 2600 2350 50  0001 C CNN
F 3 "~" H 2600 2350 50  0001 C CNN
	1    2600 2350
	-1   0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 608A31FB
P 2250 2350
AR Path="/608A31FB" Ref="RN?"  Part="1" 
AR Path="/60757845/608A31FB" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/608A31FB" Ref="RN?"  Part="1" 
F 0 "RN?" H 2150 2450 50  0000 L CNN
F 1 "10kΩ" H 2200 1950 50  0000 C CNN
F 2 "" H 2250 2430 50  0001 C CNN
F 3 "~" V 2250 2350 50  0001 C CNN
	1    2250 2350
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 608A3201
P 2250 2450
AR Path="/608A3201" Ref="RN?"  Part="2" 
AR Path="/60757845/608A3201" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/608A3201" Ref="RN?"  Part="2" 
F 0 "RN?" H 2350 2500 50  0001 L CNN
F 1 "30Ω" H 2225 2556 50  0001 C CNN
F 2 "" H 2250 2530 50  0001 C CNN
F 3 "~" V 2250 2450 50  0001 C CNN
	2    2250 2450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 608A3207
P 2250 2550
AR Path="/608A3207" Ref="RN?"  Part="3" 
AR Path="/60757845/608A3207" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/608A3207" Ref="RN?"  Part="3" 
F 0 "RN?" H 2350 2600 50  0001 L CNN
F 1 "30Ω" H 2225 2656 50  0001 C CNN
F 2 "" H 2250 2630 50  0001 C CNN
F 3 "~" V 2250 2550 50  0001 C CNN
	3    2250 2550
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 608A320D
P 2250 2650
AR Path="/608A320D" Ref="RN?"  Part="4" 
AR Path="/60757845/608A320D" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/608A320D" Ref="RN?"  Part="4" 
F 0 "RN?" H 2350 2700 50  0001 L CNN
F 1 "30Ω" H 2225 2756 50  0001 C CNN
F 2 "" H 2250 2730 50  0001 C CNN
F 3 "~" V 2250 2650 50  0001 C CNN
	4    2250 2650
	1    0    0    1   
$EndComp
Wire Wire Line
	1250 2350 2100 2350
Wire Wire Line
	1250 2450 2100 2450
Wire Wire Line
	1250 2550 2100 2550
Wire Wire Line
	1250 2650 2100 2650
Wire Wire Line
	2350 2350 2450 2350
Wire Wire Line
	2350 2450 2450 2450
Wire Wire Line
	2350 2550 2450 2550
Wire Wire Line
	2350 2650 2450 2650
Connection ~ 2450 2350
Wire Wire Line
	2450 2350 2450 2450
Connection ~ 2450 2450
Wire Wire Line
	2450 2450 2450 2550
Connection ~ 2450 2550
Wire Wire Line
	2450 2550 2450 2650
$Comp
L power:+5V #PWR?
U 1 1 608B2F3F
P 2750 1750
F 0 "#PWR?" H 2750 1600 50  0001 C CNN
F 1 "+5V" H 2765 1923 50  0000 C CNN
F 2 "" H 2750 1750 50  0001 C CNN
F 3 "" H 2750 1750 50  0001 C CNN
	1    2750 1750
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 608B9B2C
P 2250 3250
AR Path="/608B9B2C" Ref="RN?"  Part="1" 
AR Path="/60757845/608B9B2C" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/608B9B2C" Ref="RN?"  Part="1" 
F 0 "RN?" H 2150 3350 50  0000 L CNN
F 1 "10kΩ" H 2200 2850 50  0000 C CNN
F 2 "" H 2250 3330 50  0001 C CNN
F 3 "~" V 2250 3250 50  0001 C CNN
	1    2250 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 608B9B32
P 2250 3350
AR Path="/608B9B32" Ref="RN?"  Part="2" 
AR Path="/60757845/608B9B32" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/608B9B32" Ref="RN?"  Part="2" 
F 0 "RN?" H 2350 3400 50  0001 L CNN
F 1 "30Ω" H 2225 3456 50  0001 C CNN
F 2 "" H 2250 3430 50  0001 C CNN
F 3 "~" V 2250 3350 50  0001 C CNN
	2    2250 3350
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 608B9B38
P 2250 3450
AR Path="/608B9B38" Ref="RN?"  Part="3" 
AR Path="/60757845/608B9B38" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/608B9B38" Ref="RN?"  Part="3" 
F 0 "RN?" H 2350 3500 50  0001 L CNN
F 1 "30Ω" H 2225 3556 50  0001 C CNN
F 2 "" H 2250 3530 50  0001 C CNN
F 3 "~" V 2250 3450 50  0001 C CNN
	3    2250 3450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 608B9B3E
P 2250 3550
AR Path="/608B9B3E" Ref="RN?"  Part="4" 
AR Path="/60757845/608B9B3E" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/608B9B3E" Ref="RN?"  Part="4" 
F 0 "RN?" H 2350 3600 50  0001 L CNN
F 1 "30Ω" H 2225 3656 50  0001 C CNN
F 2 "" H 2250 3630 50  0001 C CNN
F 3 "~" V 2250 3550 50  0001 C CNN
	4    2250 3550
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 608C1D09
P 2200 2950
F 0 "R?" V 2100 2950 50  0000 C CNN
F 1 "10kΩ" V 2300 2950 50  0000 C CNN
F 2 "" H 2200 2950 50  0001 C CNN
F 3 "~" H 2200 2950 50  0001 C CNN
	1    2200 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	1250 2950 2100 2950
Wire Wire Line
	1250 3250 2100 3250
Wire Wire Line
	1250 3350 2100 3350
Wire Wire Line
	1250 3450 2100 3450
Wire Wire Line
	1250 3550 2100 3550
Wire Wire Line
	2300 2950 2450 2950
Wire Wire Line
	2450 2950 2450 2650
Connection ~ 2450 2650
$Comp
L power:+5V #PWR?
U 1 1 608D5C29
P 2750 3250
F 0 "#PWR?" H 2750 3100 50  0001 C CNN
F 1 "+5V" H 2765 3423 50  0000 C CNN
F 2 "" H 2750 3250 50  0001 C CNN
F 3 "" H 2750 3250 50  0001 C CNN
	1    2750 3250
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 608D5C2F
P 2600 3250
F 0 "JP?" H 2600 3117 50  0000 C CNN
F 1 "SolderJumper_2_Open" V 2645 3318 50  0001 L CNN
F 2 "" H 2600 3250 50  0001 C CNN
F 3 "~" H 2600 3250 50  0001 C CNN
	1    2600 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 3250 2450 3250
Wire Wire Line
	2350 3550 2450 3550
Wire Wire Line
	2450 3550 2450 3450
Connection ~ 2450 3250
Wire Wire Line
	2350 3350 2450 3350
Connection ~ 2450 3350
Wire Wire Line
	2450 3350 2450 3250
Wire Wire Line
	2350 3450 2450 3450
Connection ~ 2450 3450
Wire Wire Line
	2450 3450 2450 3350
$Comp
L power:+5V #PWR?
U 1 1 6091143C
P 2450 4000
F 0 "#PWR?" H 2450 3850 50  0001 C CNN
F 1 "+5V" H 2465 4173 50  0000 C CNN
F 2 "" H 2450 4000 50  0001 C CNN
F 3 "" H 2450 4000 50  0001 C CNN
	1    2450 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 4800 2450 4900
Connection ~ 2450 4800
Wire Wire Line
	2450 4700 2450 4800
Connection ~ 2450 4700
Wire Wire Line
	2450 4600 2450 4700
Connection ~ 2450 4600
Wire Wire Line
	2450 4300 2450 4600
Connection ~ 2450 4300
Wire Wire Line
	2450 4200 2450 4300
Connection ~ 2450 4200
Wire Wire Line
	2450 4100 2450 4200
Connection ~ 2450 4100
Wire Wire Line
	2450 4000 2450 4100
Wire Wire Line
	2350 4900 2450 4900
Wire Wire Line
	2350 4800 2450 4800
Wire Wire Line
	2350 4700 2450 4700
Wire Wire Line
	2350 4600 2450 4600
Wire Wire Line
	2350 4300 2450 4300
Wire Wire Line
	2350 4200 2450 4200
Wire Wire Line
	2350 4100 2450 4100
Wire Wire Line
	2350 4000 2450 4000
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60901EB6
P 2250 4900
AR Path="/60901EB6" Ref="RN?"  Part="4" 
AR Path="/60757845/60901EB6" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/60901EB6" Ref="RN?"  Part="4" 
F 0 "RN?" H 2350 4950 50  0001 L CNN
F 1 "30Ω" H 2225 5006 50  0001 C CNN
F 2 "" H 2250 4980 50  0001 C CNN
F 3 "~" V 2250 4900 50  0001 C CNN
	4    2250 4900
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60901EB0
P 2250 4800
AR Path="/60901EB0" Ref="RN?"  Part="3" 
AR Path="/60757845/60901EB0" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/60901EB0" Ref="RN?"  Part="3" 
F 0 "RN?" H 2350 4850 50  0001 L CNN
F 1 "30Ω" H 2225 4906 50  0001 C CNN
F 2 "" H 2250 4880 50  0001 C CNN
F 3 "~" V 2250 4800 50  0001 C CNN
	3    2250 4800
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60901EAA
P 2250 4700
AR Path="/60901EAA" Ref="RN?"  Part="2" 
AR Path="/60757845/60901EAA" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/60901EAA" Ref="RN?"  Part="2" 
F 0 "RN?" H 2350 4750 50  0001 L CNN
F 1 "30Ω" H 2225 4806 50  0001 C CNN
F 2 "" H 2250 4780 50  0001 C CNN
F 3 "~" V 2250 4700 50  0001 C CNN
	2    2250 4700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60901EA4
P 2250 4600
AR Path="/60901EA4" Ref="RN?"  Part="1" 
AR Path="/60757845/60901EA4" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/60901EA4" Ref="RN?"  Part="1" 
F 0 "RN?" H 2150 4700 50  0000 L CNN
F 1 "10kΩ" H 2200 4200 50  0000 C CNN
F 2 "" H 2250 4680 50  0001 C CNN
F 3 "~" V 2250 4600 50  0001 C CNN
	1    2250 4600
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 608FE548
P 2250 4300
AR Path="/608FE548" Ref="RN?"  Part="4" 
AR Path="/60757845/608FE548" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/608FE548" Ref="RN?"  Part="4" 
F 0 "RN?" H 2350 4350 50  0001 L CNN
F 1 "30Ω" H 2225 4406 50  0001 C CNN
F 2 "" H 2250 4380 50  0001 C CNN
F 3 "~" V 2250 4300 50  0001 C CNN
	4    2250 4300
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 608FE542
P 2250 4200
AR Path="/608FE542" Ref="RN?"  Part="3" 
AR Path="/60757845/608FE542" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/608FE542" Ref="RN?"  Part="3" 
F 0 "RN?" H 2350 4250 50  0001 L CNN
F 1 "30Ω" H 2225 4306 50  0001 C CNN
F 2 "" H 2250 4280 50  0001 C CNN
F 3 "~" V 2250 4200 50  0001 C CNN
	3    2250 4200
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 608FE53C
P 2250 4100
AR Path="/608FE53C" Ref="RN?"  Part="2" 
AR Path="/60757845/608FE53C" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/608FE53C" Ref="RN?"  Part="2" 
F 0 "RN?" H 2350 4150 50  0001 L CNN
F 1 "30Ω" H 2225 4206 50  0001 C CNN
F 2 "" H 2250 4180 50  0001 C CNN
F 3 "~" V 2250 4100 50  0001 C CNN
	2    2250 4100
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 608FE536
P 2250 4000
AR Path="/608FE536" Ref="RN?"  Part="1" 
AR Path="/60757845/608FE536" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/608FE536" Ref="RN?"  Part="1" 
F 0 "RN?" H 2150 4100 50  0000 L CNN
F 1 "10kΩ" H 2200 3600 50  0000 C CNN
F 2 "" H 2250 4080 50  0001 C CNN
F 3 "~" V 2250 4000 50  0001 C CNN
	1    2250 4000
	1    0    0    -1  
$EndComp
Entry Wire Line
	1550 4000 1450 4100
Entry Wire Line
	1550 4100 1450 4200
Entry Wire Line
	1550 4200 1450 4300
Entry Wire Line
	1550 4600 1450 4700
Entry Wire Line
	1550 4700 1450 4800
Entry Wire Line
	1550 4800 1450 4900
Entry Wire Line
	1550 4900 1450 5000
Entry Bus Bus
	1350 5200 1450 5100
Wire Bus Line
	1350 5200 1250 5200
Text HLabel 1250 5200 0    50   Input ~ 0
CFT-FPD[0..7]
$Comp
L alexios:74HC541 U?
U 1 1 609488C8
P 4300 4600
F 0 "U?" H 4300 5367 50  0000 C CNN
F 1 "74HC541" H 4300 5276 50  0000 C CNN
F 2 "" H 4300 4600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4300 4600 50  0001 C CNN
	1    4300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5000 3750 5000
Text Label 3650 5000 2    50   ~ 0
~PANELEN
Wire Wire Line
	3750 5000 3750 5100
Wire Wire Line
	3750 5100 3800 5100
Connection ~ 3750 5000
Wire Wire Line
	3750 5000 3250 5000
Text HLabel 3250 5000 0    50   Input ~ 0
~PANELEN
Text Label 5100 4400 2    50   ~ 0
FPD3
Text Label 5100 4300 2    50   ~ 0
FPD2
Text Label 5100 4200 2    50   ~ 0
FPD1
Text Label 5100 4100 2    50   ~ 0
FPD0
Wire Wire Line
	5150 4400 4800 4400
Wire Wire Line
	5150 4300 4800 4300
Wire Wire Line
	5150 4200 4800 4200
Wire Wire Line
	5150 4100 4800 4100
Text Label 5100 4800 2    50   ~ 0
FPD7
Text Label 5100 4700 2    50   ~ 0
FPD6
Text Label 5100 4600 2    50   ~ 0
FPD5
Text Label 5100 4500 2    50   ~ 0
FPD4
Wire Wire Line
	5150 4800 4800 4800
Wire Wire Line
	5150 4700 4800 4700
Wire Wire Line
	5150 4600 4800 4600
Wire Wire Line
	5150 4500 4800 4500
Entry Wire Line
	5250 4000 5150 4100
Entry Wire Line
	5250 4100 5150 4200
Entry Wire Line
	5250 4200 5150 4300
Entry Wire Line
	5250 4300 5150 4400
Entry Wire Line
	5250 4400 5150 4500
Entry Wire Line
	5250 4500 5150 4600
Entry Wire Line
	5250 4600 5150 4700
Entry Wire Line
	5250 4700 5150 4800
Text Label 2900 4800 0    50   ~ 0
CFT-FPD7
Text Label 2900 4700 0    50   ~ 0
CFT-FPD6
Text Label 2900 4600 0    50   ~ 0
CFT-FPD5
Text Label 2900 4500 0    50   ~ 0
CFT-FPD4
Text Label 2900 4400 0    50   ~ 0
CFT-FPD3
Text Label 2900 4300 0    50   ~ 0
CFT-FPD2
Text Label 2900 4200 0    50   ~ 0
CFT-FPD1
Text Label 2900 4100 0    50   ~ 0
CFT-FPD0
Entry Wire Line
	2750 4700 2850 4800
Entry Wire Line
	2750 4600 2850 4700
Entry Wire Line
	2750 4500 2850 4600
Entry Wire Line
	2750 4400 2850 4500
Entry Wire Line
	2750 4300 2850 4400
Entry Wire Line
	2750 4200 2850 4300
Entry Wire Line
	2750 4100 2850 4200
Entry Wire Line
	2750 4000 2850 4100
Text Label 1650 4900 0    50   ~ 0
CFT-FPD7
Text Label 1650 4800 0    50   ~ 0
CFT-FPD6
Text Label 1650 4700 0    50   ~ 0
CFT-FPD5
Text Label 1650 4600 0    50   ~ 0
CFT-FPD4
Text Label 1650 4300 0    50   ~ 0
CFT-FPD3
Text Label 1650 4200 0    50   ~ 0
CFT-FPD2
Text Label 1650 4100 0    50   ~ 0
CFT-FPD1
Text Label 1650 4000 0    50   ~ 0
CFT-FPD0
Wire Wire Line
	1550 4000 2100 4000
Wire Wire Line
	1550 4100 2100 4100
Wire Wire Line
	1550 4200 2100 4200
Wire Wire Line
	1550 4300 2100 4300
Wire Wire Line
	1550 4600 2100 4600
Wire Wire Line
	1550 4700 2100 4700
Wire Wire Line
	1550 4800 2100 4800
Wire Wire Line
	1550 4900 2100 4900
Entry Wire Line
	1550 4300 1450 4400
Connection ~ 2450 4000
Wire Wire Line
	2850 4100 3550 4100
Wire Wire Line
	2850 4200 3550 4200
Wire Wire Line
	2850 4300 3550 4300
Wire Wire Line
	2850 4400 3550 4400
Wire Wire Line
	2850 4500 3550 4500
Wire Wire Line
	2850 4600 3550 4600
Wire Wire Line
	2850 4700 3550 4700
Wire Wire Line
	2850 4800 3550 4800
Entry Bus Bus
	5350 3650 5250 3750
Wire Bus Line
	7800 3650 5350 3650
Text HLabel 7800 3650 2    50   UnSpc ~ 0
FPD[0..7]
Wire Wire Line
	1250 1750 2100 1750
Wire Wire Line
	1250 1850 2100 1850
Wire Wire Line
	1250 1950 2100 1950
Wire Wire Line
	1250 2050 2100 2050
Wire Wire Line
	6450 1850 6450 1750
Connection ~ 6450 1550
Connection ~ 6450 1650
Wire Wire Line
	6450 1650 6450 1550
Connection ~ 6450 1750
Wire Wire Line
	6450 1750 6450 1650
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 60C5BA86
P 6450 1400
F 0 "JP?" V 6450 1312 50  0000 R CNN
F 1 "SolderJumper_2_Open" V 6495 1468 50  0001 L CNN
F 2 "" H 6450 1400 50  0001 C CNN
F 3 "~" H 6450 1400 50  0001 C CNN
	1    6450 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60C5BA8C
P 6450 1250
F 0 "#PWR?" H 6450 1100 50  0001 C CNN
F 1 "+5V" H 6465 1423 50  0000 C CNN
F 2 "" H 6450 1250 50  0001 C CNN
F 3 "" H 6450 1250 50  0001 C CNN
	1    6450 1250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6096B7E4
P 3650 4500
AR Path="/6096B7E4" Ref="RN?"  Part="1" 
AR Path="/60757845/6096B7E4" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6096B7E4" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/6096B7E4" Ref="RN?"  Part="1" 
F 0 "RN?" H 3800 4150 50  0000 L CNN
F 1 "30Ω" H 3850 4100 50  0001 C CNN
F 2 "" H 3650 4580 50  0001 C CNN
F 3 "~" V 3650 4500 50  0001 C CNN
	1    3650 4500
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6096B7EA
P 3650 4100
AR Path="/6096B7EA" Ref="RN?"  Part="1" 
AR Path="/60757845/6096B7EA" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6096B7EA" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/6096B7EA" Ref="RN?"  Part="1" 
F 0 "RN?" H 3500 4300 50  0000 L CNN
F 1 "30Ω" H 3600 4200 50  0000 C CNN
F 2 "" H 3650 4180 50  0001 C CNN
F 3 "~" V 3650 4100 50  0001 C CNN
	1    3650 4100
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6096B7F0
P 3650 4200
AR Path="/6096B7F0" Ref="RN?"  Part="2" 
AR Path="/60757845/6096B7F0" Ref="RN?"  Part="2" 
AR Path="/64FC7999/6096B7F0" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/6096B7F0" Ref="RN?"  Part="2" 
F 0 "RN?" H 3750 4250 50  0001 L CNN
F 1 "30Ω" H 3625 4306 50  0001 C CNN
F 2 "" H 3650 4280 50  0001 C CNN
F 3 "~" V 3650 4200 50  0001 C CNN
	2    3650 4200
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6096B7F6
P 3650 4300
AR Path="/6096B7F6" Ref="RN?"  Part="3" 
AR Path="/60757845/6096B7F6" Ref="RN?"  Part="3" 
AR Path="/64FC7999/6096B7F6" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/6096B7F6" Ref="RN?"  Part="3" 
F 0 "RN?" H 3750 4350 50  0001 L CNN
F 1 "30Ω" H 3625 4406 50  0001 C CNN
F 2 "" H 3650 4380 50  0001 C CNN
F 3 "~" V 3650 4300 50  0001 C CNN
	3    3650 4300
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6096B7FC
P 3650 4400
AR Path="/6096B7FC" Ref="RN?"  Part="4" 
AR Path="/60757845/6096B7FC" Ref="RN?"  Part="4" 
AR Path="/64FC7999/6096B7FC" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/6096B7FC" Ref="RN?"  Part="4" 
F 0 "RN?" H 3750 4450 50  0001 L CNN
F 1 "30Ω" H 3625 4506 50  0001 C CNN
F 2 "" H 3650 4480 50  0001 C CNN
F 3 "~" V 3650 4400 50  0001 C CNN
	4    3650 4400
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6096B802
P 3650 4600
AR Path="/6096B802" Ref="RN?"  Part="2" 
AR Path="/60757845/6096B802" Ref="RN?"  Part="2" 
AR Path="/64FC7999/6096B802" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/6096B802" Ref="RN?"  Part="2" 
F 0 "RN?" H 3750 4650 50  0001 L CNN
F 1 "30Ω" H 3625 4706 50  0001 C CNN
F 2 "" H 3650 4680 50  0001 C CNN
F 3 "~" V 3650 4600 50  0001 C CNN
	2    3650 4600
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6096B808
P 3650 4700
AR Path="/6096B808" Ref="RN?"  Part="3" 
AR Path="/60757845/6096B808" Ref="RN?"  Part="3" 
AR Path="/64FC7999/6096B808" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/6096B808" Ref="RN?"  Part="3" 
F 0 "RN?" H 3750 4750 50  0001 L CNN
F 1 "30Ω" H 3625 4806 50  0001 C CNN
F 2 "" H 3650 4780 50  0001 C CNN
F 3 "~" V 3650 4700 50  0001 C CNN
	3    3650 4700
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6096B80E
P 3650 4800
AR Path="/6096B80E" Ref="RN?"  Part="4" 
AR Path="/60757845/6096B80E" Ref="RN?"  Part="4" 
AR Path="/64FC7999/6096B80E" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/6096B80E" Ref="RN?"  Part="4" 
F 0 "RN?" H 3550 4650 50  0001 L CNN
F 1 "30Ω" H 3850 4850 50  0000 C CNN
F 2 "" H 3650 4880 50  0001 C CNN
F 3 "~" V 3650 4800 50  0001 C CNN
	4    3650 4800
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60C70DA9
P 6200 1950
AR Path="/60C70DA9" Ref="RN?"  Part="1" 
AR Path="/60757845/60C70DA9" Ref="RN?"  Part="1" 
AR Path="/64FC7999/60C70DA9" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/60C70DA9" Ref="RN?"  Part="1" 
F 0 "RN?" H 6350 1600 50  0000 L CNN
F 1 "30Ω" H 6400 1550 50  0001 C CNN
F 2 "" H 6200 2030 50  0001 C CNN
F 3 "~" V 6200 1950 50  0001 C CNN
	1    6200 1950
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60C70DAF
P 6200 1550
AR Path="/60C70DAF" Ref="RN?"  Part="1" 
AR Path="/60757845/60C70DAF" Ref="RN?"  Part="1" 
AR Path="/64FC7999/60C70DAF" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/60C70DAF" Ref="RN?"  Part="1" 
F 0 "RN?" H 6050 1750 50  0000 L CNN
F 1 "30Ω" H 6150 1650 50  0000 C CNN
F 2 "" H 6200 1630 50  0001 C CNN
F 3 "~" V 6200 1550 50  0001 C CNN
	1    6200 1550
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60C70DB5
P 6200 1650
AR Path="/60C70DB5" Ref="RN?"  Part="2" 
AR Path="/60757845/60C70DB5" Ref="RN?"  Part="2" 
AR Path="/64FC7999/60C70DB5" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/60C70DB5" Ref="RN?"  Part="2" 
F 0 "RN?" H 6300 1700 50  0001 L CNN
F 1 "30Ω" H 6175 1756 50  0001 C CNN
F 2 "" H 6200 1730 50  0001 C CNN
F 3 "~" V 6200 1650 50  0001 C CNN
	2    6200 1650
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60C70DBB
P 6200 1750
AR Path="/60C70DBB" Ref="RN?"  Part="3" 
AR Path="/60757845/60C70DBB" Ref="RN?"  Part="3" 
AR Path="/64FC7999/60C70DBB" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/60C70DBB" Ref="RN?"  Part="3" 
F 0 "RN?" H 6300 1800 50  0001 L CNN
F 1 "30Ω" H 6175 1856 50  0001 C CNN
F 2 "" H 6200 1830 50  0001 C CNN
F 3 "~" V 6200 1750 50  0001 C CNN
	3    6200 1750
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60C70DC1
P 6200 1850
AR Path="/60C70DC1" Ref="RN?"  Part="4" 
AR Path="/60757845/60C70DC1" Ref="RN?"  Part="4" 
AR Path="/64FC7999/60C70DC1" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/60C70DC1" Ref="RN?"  Part="4" 
F 0 "RN?" H 6300 1900 50  0001 L CNN
F 1 "30Ω" H 6175 1956 50  0001 C CNN
F 2 "" H 6200 1930 50  0001 C CNN
F 3 "~" V 6200 1850 50  0001 C CNN
	4    6200 1850
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60C70DC7
P 6200 2050
AR Path="/60C70DC7" Ref="RN?"  Part="2" 
AR Path="/60757845/60C70DC7" Ref="RN?"  Part="2" 
AR Path="/64FC7999/60C70DC7" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/60C70DC7" Ref="RN?"  Part="2" 
F 0 "RN?" H 6300 2100 50  0001 L CNN
F 1 "30Ω" H 6175 2156 50  0001 C CNN
F 2 "" H 6200 2130 50  0001 C CNN
F 3 "~" V 6200 2050 50  0001 C CNN
	2    6200 2050
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60C70DCD
P 6200 2150
AR Path="/60C70DCD" Ref="RN?"  Part="3" 
AR Path="/60757845/60C70DCD" Ref="RN?"  Part="3" 
AR Path="/64FC7999/60C70DCD" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/60C70DCD" Ref="RN?"  Part="3" 
F 0 "RN?" H 6300 2200 50  0001 L CNN
F 1 "30Ω" H 6175 2256 50  0001 C CNN
F 2 "" H 6200 2230 50  0001 C CNN
F 3 "~" V 6200 2150 50  0001 C CNN
	3    6200 2150
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60C70DD3
P 6200 2250
AR Path="/60C70DD3" Ref="RN?"  Part="4" 
AR Path="/60757845/60C70DD3" Ref="RN?"  Part="4" 
AR Path="/64FC7999/60C70DD3" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/60C70DD3" Ref="RN?"  Part="4" 
F 0 "RN?" H 6100 2100 50  0001 L CNN
F 1 "30Ω" H 6400 2300 50  0000 C CNN
F 2 "" H 6200 2330 50  0001 C CNN
F 3 "~" V 6200 2250 50  0001 C CNN
	4    6200 2250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6450 2250 6450 2150
Connection ~ 6450 1850
Connection ~ 6450 1950
Wire Wire Line
	6450 1950 6450 1850
Connection ~ 6450 2050
Wire Wire Line
	6450 2050 6450 1950
Connection ~ 6450 2150
Wire Wire Line
	6450 2150 6450 2050
Wire Wire Line
	6350 2250 6450 2250
Wire Wire Line
	6350 2150 6450 2150
Wire Wire Line
	6350 2050 6450 2050
Wire Wire Line
	6350 1950 6450 1950
Wire Wire Line
	6350 1850 6450 1850
Wire Wire Line
	6350 1750 6450 1750
Wire Wire Line
	6350 1650 6450 1650
Wire Wire Line
	6350 1550 6450 1550
Text HLabel 5050 1250 0    50   Input ~ 0
~IRQ[0..7]
Wire Bus Line
	5350 1250 5050 1250
Entry Bus Bus
	5350 1250 5450 1350
Entry Wire Line
	5450 2150 5550 2250
Entry Wire Line
	5450 2050 5550 2150
Entry Wire Line
	5450 1950 5550 2050
Entry Wire Line
	5450 1850 5550 1950
Entry Wire Line
	5450 1750 5550 1850
Entry Wire Line
	5450 1650 5550 1750
Entry Wire Line
	5450 1550 5550 1650
Entry Wire Line
	5450 1450 5550 1550
Text Label 5650 2250 0    50   ~ 0
~IRQ7
Text Label 5650 2150 0    50   ~ 0
~IRQ6
Text Label 5650 2050 0    50   ~ 0
~IRQ5
Text Label 5650 1950 0    50   ~ 0
~IRQ4
Text Label 5650 1850 0    50   ~ 0
~IRQ3
Text Label 5650 1750 0    50   ~ 0
~IRQ2
Text Label 5650 1650 0    50   ~ 0
~IRQ1
Text Label 5650 1550 0    50   ~ 0
~IRQ0
Wire Wire Line
	5550 2250 6100 2250
Wire Wire Line
	5550 2150 6100 2150
Wire Wire Line
	5550 2050 6100 2050
Wire Wire Line
	5550 1950 6100 1950
Wire Wire Line
	5550 1850 6100 1850
Wire Wire Line
	5550 1750 6100 1750
Wire Wire Line
	5550 1650 6100 1650
Wire Wire Line
	5550 1550 6100 1550
Text HLabel 5250 2800 0    50   UnSpc ~ 0
~IRQ
Text Label 5350 2800 0    50   ~ 0
~IRQ
$Comp
L Device:R_Small R?
U 1 1 60DE16D6
P 6200 2800
F 0 "R?" V 6100 2800 50  0000 C CNN
F 1 "10kΩ" V 6300 2800 50  0000 C CNN
F 2 "" H 6200 2800 50  0001 C CNN
F 3 "~" H 6200 2800 50  0001 C CNN
	1    6200 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 2800 6100 2800
Wire Wire Line
	6300 2800 6400 2800
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 60DF07EC
P 6600 2800
F 0 "JP?" H 6600 2913 50  0000 C CNN
F 1 "SolderJumper_2_Open" V 6645 2868 50  0001 L CNN
F 2 "" H 6600 2800 50  0001 C CNN
F 3 "~" H 6600 2800 50  0001 C CNN
	1    6600 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60DF5410
P 6750 2800
F 0 "#PWR?" H 6750 2650 50  0001 C CNN
F 1 "+5V" H 6765 2973 50  0000 C CNN
F 2 "" H 6750 2800 50  0001 C CNN
F 3 "" H 6750 2800 50  0001 C CNN
	1    6750 2800
	1    0    0    -1  
$EndComp
Text HLabel 5250 3100 0    50   UnSpc ~ 0
~IRQS
Text Label 5350 3100 0    50   ~ 0
~IRQS
$Comp
L Device:R_Small R?
U 1 1 60DF5C82
P 6200 3100
F 0 "R?" V 6100 3100 50  0000 C CNN
F 1 "10kΩ" V 6300 3100 50  0000 C CNN
F 2 "" H 6200 3100 50  0001 C CNN
F 3 "~" H 6200 3100 50  0001 C CNN
	1    6200 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 3100 6100 3100
Wire Wire Line
	6300 3100 6400 3100
Wire Wire Line
	6400 3100 6400 2800
Connection ~ 6400 2800
Wire Wire Line
	6400 2800 6450 2800
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610E25FF
P 6850 4500
AR Path="/610E25FF" Ref="RN?"  Part="1" 
AR Path="/60757845/610E25FF" Ref="RN?"  Part="1" 
AR Path="/64FC7999/610E25FF" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/610E25FF" Ref="RN?"  Part="1" 
F 0 "RN?" H 6750 4100 50  0000 L CNN
F 1 "30Ω" H 7050 4100 50  0001 C CNN
F 2 "" H 6850 4580 50  0001 C CNN
F 3 "~" V 6850 4500 50  0001 C CNN
	1    6850 4500
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610E2605
P 6850 4100
AR Path="/610E2605" Ref="RN?"  Part="1" 
AR Path="/60757845/610E2605" Ref="RN?"  Part="1" 
AR Path="/64FC7999/610E2605" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/610E2605" Ref="RN?"  Part="1" 
F 0 "RN?" H 6700 4300 50  0000 L CNN
F 1 "30Ω" H 6800 4200 50  0000 C CNN
F 2 "" H 6850 4180 50  0001 C CNN
F 3 "~" V 6850 4100 50  0001 C CNN
	1    6850 4100
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610E260B
P 6850 4200
AR Path="/610E260B" Ref="RN?"  Part="2" 
AR Path="/60757845/610E260B" Ref="RN?"  Part="2" 
AR Path="/64FC7999/610E260B" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/610E260B" Ref="RN?"  Part="2" 
F 0 "RN?" H 6950 4250 50  0001 L CNN
F 1 "30Ω" H 6825 4306 50  0001 C CNN
F 2 "" H 6850 4280 50  0001 C CNN
F 3 "~" V 6850 4200 50  0001 C CNN
	2    6850 4200
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610E2611
P 6850 4300
AR Path="/610E2611" Ref="RN?"  Part="3" 
AR Path="/60757845/610E2611" Ref="RN?"  Part="3" 
AR Path="/64FC7999/610E2611" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/610E2611" Ref="RN?"  Part="3" 
F 0 "RN?" H 6950 4350 50  0001 L CNN
F 1 "30Ω" H 6825 4406 50  0001 C CNN
F 2 "" H 6850 4380 50  0001 C CNN
F 3 "~" V 6850 4300 50  0001 C CNN
	3    6850 4300
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610E2617
P 6850 4400
AR Path="/610E2617" Ref="RN?"  Part="4" 
AR Path="/60757845/610E2617" Ref="RN?"  Part="4" 
AR Path="/64FC7999/610E2617" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/610E2617" Ref="RN?"  Part="4" 
F 0 "RN?" H 6950 4450 50  0001 L CNN
F 1 "30Ω" H 6825 4506 50  0001 C CNN
F 2 "" H 6850 4480 50  0001 C CNN
F 3 "~" V 6850 4400 50  0001 C CNN
	4    6850 4400
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610E261D
P 6850 4600
AR Path="/610E261D" Ref="RN?"  Part="2" 
AR Path="/60757845/610E261D" Ref="RN?"  Part="2" 
AR Path="/64FC7999/610E261D" Ref="RN?"  Part="2" 
AR Path="/60A2F3C0/610E261D" Ref="RN?"  Part="2" 
F 0 "RN?" H 6950 4650 50  0001 L CNN
F 1 "30Ω" H 6825 4706 50  0001 C CNN
F 2 "" H 6850 4680 50  0001 C CNN
F 3 "~" V 6850 4600 50  0001 C CNN
	2    6850 4600
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610E2623
P 6850 4700
AR Path="/610E2623" Ref="RN?"  Part="3" 
AR Path="/60757845/610E2623" Ref="RN?"  Part="3" 
AR Path="/64FC7999/610E2623" Ref="RN?"  Part="3" 
AR Path="/60A2F3C0/610E2623" Ref="RN?"  Part="3" 
F 0 "RN?" H 6950 4750 50  0001 L CNN
F 1 "30Ω" H 6825 4806 50  0001 C CNN
F 2 "" H 6850 4780 50  0001 C CNN
F 3 "~" V 6850 4700 50  0001 C CNN
	3    6850 4700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610E2629
P 6850 4800
AR Path="/610E2629" Ref="RN?"  Part="4" 
AR Path="/60757845/610E2629" Ref="RN?"  Part="4" 
AR Path="/64FC7999/610E2629" Ref="RN?"  Part="4" 
AR Path="/60A2F3C0/610E2629" Ref="RN?"  Part="4" 
F 0 "RN?" H 6750 4650 50  0001 L CNN
F 1 "30Ω" H 6850 4600 50  0000 C CNN
F 2 "" H 6850 4880 50  0001 C CNN
F 3 "~" V 6850 4800 50  0001 C CNN
	4    6850 4800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 610ECA86
P 6200 4600
F 0 "U?" H 6200 5367 50  0000 C CNN
F 1 "74HC541" H 6200 5276 50  0000 C CNN
F 2 "" H 6200 4600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6200 4600 50  0001 C CNN
	1    6200 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5000 5650 5000
Wire Wire Line
	5700 5100 5650 5100
$Comp
L power:GND #PWR?
U 1 1 61109400
P 5650 5150
F 0 "#PWR?" H 5650 4900 50  0001 C CNN
F 1 "GND" H 5655 4977 50  0000 C CNN
F 2 "" H 5650 5150 50  0001 C CNN
F 3 "" H 5650 5150 50  0001 C CNN
	1    5650 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 4200 7400 4200
Wire Wire Line
	6950 4300 7400 4300
Wire Wire Line
	6950 4400 7400 4400
Wire Wire Line
	6950 4500 7400 4500
Wire Wire Line
	6950 4600 7400 4600
Wire Wire Line
	6950 4700 7400 4700
Wire Wire Line
	6950 4800 7400 4800
Text Label 7400 4100 2    50   ~ 0
FP-FPD0
Text Label 7400 4200 2    50   ~ 0
FP-FPD1
Text Label 7400 4300 2    50   ~ 0
FP-FPD2
Text Label 7400 4400 2    50   ~ 0
FP-FPD3
Text Label 7400 4500 2    50   ~ 0
FP-FPD4
Text Label 7400 4600 2    50   ~ 0
FP-FPD5
Text Label 7400 4700 2    50   ~ 0
FP-FPD6
Text Label 7400 4800 2    50   ~ 0
FP-FPD7
Wire Wire Line
	6950 4100 7400 4100
Entry Wire Line
	7500 4000 7400 4100
Entry Wire Line
	7500 4100 7400 4200
Entry Wire Line
	7500 4200 7400 4300
Entry Wire Line
	7500 4300 7400 4400
Entry Wire Line
	7500 4400 7400 4500
Entry Wire Line
	7500 4500 7400 4600
Entry Wire Line
	7500 4600 7400 4700
Entry Wire Line
	7500 4700 7400 4800
Entry Wire Line
	5250 4000 5350 4100
Entry Wire Line
	5250 4100 5350 4200
Entry Wire Line
	5250 4200 5350 4300
Entry Wire Line
	5250 4300 5350 4400
Entry Wire Line
	5250 4400 5350 4500
Entry Wire Line
	5250 4500 5350 4600
Entry Wire Line
	5250 4600 5350 4700
Entry Wire Line
	5250 4700 5350 4800
Text Label 5650 4400 2    50   ~ 0
FPD3
Text Label 5650 4300 2    50   ~ 0
FPD2
Text Label 5650 4200 2    50   ~ 0
FPD1
Text Label 5650 4100 2    50   ~ 0
FPD0
Wire Wire Line
	5700 4400 5350 4400
Wire Wire Line
	5700 4300 5350 4300
Wire Wire Line
	5700 4200 5350 4200
Wire Wire Line
	5700 4100 5350 4100
Text Label 5650 4800 2    50   ~ 0
FPD7
Text Label 5650 4700 2    50   ~ 0
FPD6
Text Label 5650 4600 2    50   ~ 0
FPD5
Text Label 5650 4500 2    50   ~ 0
FPD4
Wire Wire Line
	5700 4800 5350 4800
Wire Wire Line
	5700 4700 5350 4700
Wire Wire Line
	5700 4600 5350 4600
Wire Wire Line
	5700 4500 5350 4500
Text HLabel 7800 3800 2    50   UnSpc ~ 0
FP-FPD[0..7]
Wire Bus Line
	7800 3800 7600 3800
Entry Bus Bus
	7600 3800 7500 3900
Wire Wire Line
	5650 5000 5650 5100
Connection ~ 5650 5100
Wire Wire Line
	5650 5100 5650 5150
Wire Bus Line
	2750 4000 2750 4700
Wire Bus Line
	5450 1350 5450 2150
Wire Bus Line
	5250 3750 5250 4700
Wire Bus Line
	1450 4100 1450 5100
Wire Bus Line
	7500 3900 7500 4700
$EndSCHEMATC
