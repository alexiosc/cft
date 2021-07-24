EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 16 19
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
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4650 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4650 4950 50  0001 C CNN
	1    4650 4950
	1    0    0    -1  
$EndComp
Text Label 4000 5350 2    50   ~ 0
~PANELEN
Wire Wire Line
	4100 5450 4150 5450
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
Entry Bus Bus
	5700 4000 5600 4100
Wire Bus Line
	9850 4000 5700 4000
Text HLabel 9850 4000 2    50   UnSpc ~ 0
FPD[0..7]
Wire Wire Line
	1300 1000 2150 1000
Wire Wire Line
	1300 1100 2150 1100
Wire Wire Line
	1300 1200 2150 1200
Wire Wire Line
	1300 1300 2150 1300
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
L alexios:74HC541 U29
U 1 1 610ECA86
P 6550 4950
F 0 "U29" H 6550 5717 50  0000 C CNN
F 1 "74HC541" H 6550 5626 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6550 4950 50  0001 C CNN
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
Entry Wire Line
	9550 4350 9450 4450
Entry Wire Line
	9550 4450 9450 4550
Entry Wire Line
	9550 4550 9450 4650
Entry Wire Line
	9550 4650 9450 4750
Entry Wire Line
	9550 4750 9450 4850
Entry Wire Line
	9550 4850 9450 4950
Entry Wire Line
	9550 4950 9450 5050
Entry Wire Line
	9550 5050 9450 5150
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
Text HLabel 9850 4150 2    50   Output ~ 0
FP-FPD[0..7]
Wire Bus Line
	9850 4150 9650 4150
Entry Bus Bus
	9650 4150 9550 4250
Wire Wire Line
	6000 5350 6000 5450
Connection ~ 6000 5450
Wire Wire Line
	6000 5450 6000 5500
$Comp
L power:GND #PWR0145
U 1 1 5FDEF369
P 8050 5500
F 0 "#PWR0145" H 8050 5250 50  0001 C CNN
F 1 "GND" H 8055 5327 50  0000 C CNN
F 2 "" H 8050 5500 50  0001 C CNN
F 3 "" H 8050 5500 50  0001 C CNN
	1    8050 5500
	1    0    0    -1  
$EndComp
$Comp
L alexios:PESD5V2S2UT D19
U 1 1 5FE16E3D
P 8850 5400
F 0 "D19" H 9100 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8750 5150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8850 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 8750 5425 50  0001 C CNN
	1    8850 5400
	-1   0    0    -1  
$EndComp
$Comp
L alexios:PESD5V2S2UT D20
U 1 1 5FE16E43
P 9250 5400
F 0 "D20" H 9500 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 9150 5150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9250 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 9150 5425 50  0001 C CNN
	1    9250 5400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 5FE492B5
P 8450 5500
F 0 "#PWR0146" H 8450 5250 50  0001 C CNN
F 1 "GND" H 8455 5327 50  0000 C CNN
F 2 "" H 8450 5500 50  0001 C CNN
F 3 "" H 8450 5500 50  0001 C CNN
	1    8450 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0147
U 1 1 5FE49524
P 8850 5500
F 0 "#PWR0147" H 8850 5250 50  0001 C CNN
F 1 "GND" H 8855 5327 50  0000 C CNN
F 2 "" H 8850 5500 50  0001 C CNN
F 3 "" H 8850 5500 50  0001 C CNN
	1    8850 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0148
U 1 1 5FE4971B
P 9250 5500
F 0 "#PWR0148" H 9250 5250 50  0001 C CNN
F 1 "GND" H 9255 5327 50  0000 C CNN
F 2 "" H 9250 5500 50  0001 C CNN
F 3 "" H 9250 5500 50  0001 C CNN
	1    9250 5500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U28
U 2 1 5FE8D228
P 4650 6000
F 0 "U28" H 4830 6046 50  0000 L CNN
F 1 "74HC541" H 4830 5955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4650 6000 50  0001 C CNN
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
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6550 6000 50  0001 C CNN
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
Wire Wire Line
	7500 4550 8350 4550
Wire Wire Line
	7500 4950 9150 4950
$Comp
L alexios:PESD5V2S2UT D18
U 1 1 5FDFD084
P 8450 5400
F 0 "D18" H 8700 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8350 5150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8450 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 8350 5425 50  0001 C CNN
	1    8450 5400
	-1   0    0    -1  
$EndComp
Text Notes 2050 5450 0    50   ~ 0
Optional; the backplane\nhas bus hold for FPD.
Wire Wire Line
	3600 5350 4150 5350
$Comp
L power:GND #PWR0163
U 1 1 62A0B354
P 4100 5500
F 0 "#PWR0163" H 4100 5250 50  0001 C CNN
F 1 "GND" H 4105 5327 50  0000 C CNN
F 2 "" H 4100 5500 50  0001 C CNN
F 3 "" H 4100 5500 50  0001 C CNN
	1    4100 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5450 4100 5500
Text Label 7500 4450 0    50   ~ 0
FP-FPD0
Text Label 7500 4550 0    50   ~ 0
FP-FPD1
Text Label 7500 4650 0    50   ~ 0
FP-FPD2
Text Label 7500 4750 0    50   ~ 0
FP-FPD3
Text Label 7500 4850 0    50   ~ 0
FP-FPD4
Text Label 7500 4950 0    50   ~ 0
FP-FPD5
Text Label 7500 5050 0    50   ~ 0
FP-FPD6
Text Label 7500 5150 0    50   ~ 0
FP-FPD7
Wire Wire Line
	8150 4450 9450 4450
Connection ~ 8150 4450
Wire Wire Line
	8150 5250 8150 4450
Wire Wire Line
	7500 4450 8150 4450
Wire Wire Line
	7500 4650 7950 4650
Wire Wire Line
	7950 4650 9450 4650
Connection ~ 7950 4650
Wire Wire Line
	7950 5250 7950 4650
$Comp
L alexios:PESD5V2S2UT D17
U 1 1 5FDE6D00
P 8050 5400
F 0 "D17" H 8350 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8850 5400 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8050 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 7950 5425 50  0001 C CNN
	1    8050 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 4750 8550 4750
Wire Wire Line
	8350 5250 8350 4550
Connection ~ 8350 4550
Wire Wire Line
	8350 4550 9450 4550
Wire Wire Line
	8550 5250 8550 4750
Connection ~ 8550 4750
Wire Wire Line
	8550 4750 9450 4750
Wire Wire Line
	7500 4850 8950 4850
Wire Wire Line
	7500 5050 8750 5050
Wire Wire Line
	8750 5250 8750 5050
Connection ~ 8750 5050
Wire Wire Line
	8750 5050 9450 5050
Wire Wire Line
	8950 5250 8950 4850
Connection ~ 8950 4850
Wire Wire Line
	8950 4850 9450 4850
Connection ~ 9150 4950
Wire Wire Line
	7500 5150 9350 5150
Wire Wire Line
	9150 4950 9150 5250
Wire Wire Line
	9150 4950 9450 4950
Wire Wire Line
	9350 5250 9350 5150
Connection ~ 9350 5150
Wire Wire Line
	9350 5150 9450 5150
$Comp
L alexios:PMV48XP T701
U 1 1 613DCC00
P 4050 1250
F 0 "T701" H 4255 1296 50  0000 L CNN
F 1 "PMV48XP" H 4255 1205 50  0000 L CNN
F 2 "alexios:SOT-23_HandSoldering" H 4250 1175 50  0001 L CIN
F 3 "https://assets.nexperia.com/documents/data-sheet/PMV48XP.pdf" H 4050 1250 50  0001 L CNN
	1    4050 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5150 3750 5150
Wire Wire Line
	3200 5050 3750 5050
Wire Wire Line
	3200 4950 3750 4950
Wire Wire Line
	3200 4850 3750 4850
Wire Wire Line
	3200 4750 3750 4750
Wire Wire Line
	3200 4650 3750 4650
Wire Wire Line
	3200 4550 3750 4550
Wire Wire Line
	3200 4450 3750 4450
$Comp
L Device:R_Pack08 RN?
U 1 1 62CC0973
P 3950 4850
AR Path="/66CDCD87/61678CAE/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61B4C1AE/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61C8EF6B/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D0EECC/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D30C1E/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB558/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB5B6/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CD84/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CDCA/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C9920/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C999E/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C99B4/62CC0973" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/62CC0973" Ref="RN1701"  Part="1" 
F 0 "RN1701" V 3333 4850 50  0000 C CNN
F 1 "1kΩ" V 3424 4850 50  0000 C CNN
F 2 "alexios:Resistor-Pack-DIP-16_W7.62mm" V 4425 4850 50  0001 C CNN
F 3 "~" H 3950 4850 50  0001 C CNN
	1    3950 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Network08 RN?
U 1 1 62CF0B32
P 2250 4850
AR Path="/60757845/62CF0B32" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/62CF0B32" Ref="RN1702"  Part="1" 
F 0 "RN1702" V 1633 4850 50  0000 C CNN
F 1 "10kΩ" V 1724 4850 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 2725 4850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2250 4850 50  0001 C CNN
	1    2250 4850
	0    -1   1    0   
$EndComp
Wire Wire Line
	2000 4400 2000 4450
Wire Wire Line
	2050 4450 2000 4450
$Comp
L power:+5V #PWR0136
U 1 1 6091143C
P 2000 4400
F 0 "#PWR0136" H 2000 4250 50  0001 C CNN
F 1 "+5V" H 2015 4573 50  0000 C CNN
F 2 "" H 2000 4400 50  0001 C CNN
F 3 "" H 2000 4400 50  0001 C CNN
	1    2000 4400
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Pack08 RN?
U 1 1 63156B4F
P 7300 4850
AR Path="/66CDCD87/61678CAE/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61B4C1AE/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61C8EF6B/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D0EECC/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D30C1E/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB558/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB5B6/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CD84/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CDCA/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C9920/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C999E/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C99B4/63156B4F" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/63156B4F" Ref="RN1703"  Part="1" 
F 0 "RN1703" V 6683 4850 50  0000 C CNN
F 1 "1kΩ" V 6774 4850 50  0000 C CNN
F 2 "alexios:Resistor-Pack-DIP-16_W7.62mm" V 7775 4850 50  0001 C CNN
F 3 "~" H 7300 4850 50  0001 C CNN
	1    7300 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 4450 7100 4450
Wire Wire Line
	7050 4550 7100 4550
Wire Wire Line
	7050 4650 7100 4650
Wire Wire Line
	7050 4750 7100 4750
Wire Wire Line
	7050 4850 7100 4850
Wire Wire Line
	7050 4950 7100 4950
Wire Wire Line
	7050 5050 7100 5050
Wire Wire Line
	7050 5150 7100 5150
Wire Bus Line
	3100 4100 3100 5050
Wire Bus Line
	9550 4250 9550 5050
Wire Bus Line
	5600 4100 5600 5050
$EndSCHEMATC
