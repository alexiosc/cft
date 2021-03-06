EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 13
Title "Microcontroller and DFP Bus"
Date ""
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 601187D3
P 15300 2450
AR Path="/601187D3" Ref="RN?"  Part="1" 
AR Path="/60757845/601187D3" Ref="RN11"  Part="1" 
F 0 "RN11" H 15200 2550 50  0000 L CNN
F 1 "30Ω" H 15500 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 2530 50  0001 C CNN
F 3 "~" V 15300 2450 50  0001 C CNN
	1    15300 2450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 601187D9
P 15300 2550
AR Path="/601187D9" Ref="RN?"  Part="2" 
AR Path="/60757845/601187D9" Ref="RN11"  Part="2" 
F 0 "RN11" H 15400 2600 50  0001 L CNN
F 1 "30Ω" H 15275 2656 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 2630 50  0001 C CNN
F 3 "~" V 15300 2550 50  0001 C CNN
	2    15300 2550
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 601187DF
P 15300 2650
AR Path="/601187DF" Ref="RN?"  Part="3" 
AR Path="/60757845/601187DF" Ref="RN11"  Part="3" 
F 0 "RN11" H 15400 2700 50  0001 L CNN
F 1 "30Ω" H 15275 2756 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 2730 50  0001 C CNN
F 3 "~" V 15300 2650 50  0001 C CNN
	3    15300 2650
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 601187E5
P 15300 2750
AR Path="/601187E5" Ref="RN?"  Part="4" 
AR Path="/60757845/601187E5" Ref="RN11"  Part="4" 
F 0 "RN11" H 15400 2800 50  0001 L CNN
F 1 "30Ω" H 15275 2856 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 2830 50  0001 C CNN
F 3 "~" V 15300 2750 50  0001 C CNN
	4    15300 2750
	1    0    0    1   
$EndComp
Wire Wire Line
	15400 2450 15500 2450
Wire Wire Line
	15500 2450 15500 2350
Wire Wire Line
	15400 2750 15500 2750
Wire Wire Line
	15500 2750 15500 2650
Connection ~ 15500 2450
Wire Wire Line
	15400 2550 15500 2550
Connection ~ 15500 2550
Wire Wire Line
	15500 2550 15500 2450
Wire Wire Line
	15400 2650 15500 2650
Connection ~ 15500 2650
Wire Wire Line
	15500 2650 15500 2550
$Comp
L power:+5V #PWR029
U 1 1 601BB232
P 15500 2350
F 0 "#PWR029" H 15500 2200 50  0001 C CNN
F 1 "+5V" H 15515 2523 50  0000 C CNN
F 2 "" H 15500 2350 50  0001 C CNN
F 3 "" H 15500 2350 50  0001 C CNN
	1    15500 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	15150 2450 14750 2450
Wire Wire Line
	15150 2550 14750 2550
Wire Wire Line
	15150 2650 14750 2650
Wire Wire Line
	15150 2750 14750 2750
Text Label 14750 2450 0    50   ~ 0
~WR
Text Label 14750 2550 0    50   ~ 0
~RD
Text Label 14750 2650 0    50   ~ 0
ALE
Text Label 14750 2750 0    50   ~ 0
~LCKLKEN
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6024C551
P 15300 3250
AR Path="/6024C551" Ref="RN?"  Part="1" 
AR Path="/60757845/6024C551" Ref="RN12"  Part="1" 
F 0 "RN12" H 15200 3350 50  0000 L CNN
F 1 "30Ω" H 15500 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 3330 50  0001 C CNN
F 3 "~" V 15300 3250 50  0001 C CNN
	1    15300 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6024C557
P 15300 3350
AR Path="/6024C557" Ref="RN?"  Part="2" 
AR Path="/60757845/6024C557" Ref="RN12"  Part="2" 
F 0 "RN12" H 15400 3400 50  0001 L CNN
F 1 "30Ω" H 15275 3456 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 3430 50  0001 C CNN
F 3 "~" V 15300 3350 50  0001 C CNN
	2    15300 3350
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6024C55D
P 15300 3450
AR Path="/6024C55D" Ref="RN?"  Part="3" 
AR Path="/60757845/6024C55D" Ref="RN12"  Part="3" 
F 0 "RN12" H 15400 3500 50  0001 L CNN
F 1 "30Ω" H 15275 3556 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 3530 50  0001 C CNN
F 3 "~" V 15300 3450 50  0001 C CNN
	3    15300 3450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6024C563
P 15300 3550
AR Path="/6024C563" Ref="RN?"  Part="4" 
AR Path="/60757845/6024C563" Ref="RN12"  Part="4" 
F 0 "RN12" H 15400 3600 50  0001 L CNN
F 1 "30Ω" H 15275 3656 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 3630 50  0001 C CNN
F 3 "~" V 15300 3550 50  0001 C CNN
	4    15300 3550
	1    0    0    1   
$EndComp
Wire Wire Line
	15400 3250 15500 3250
Wire Wire Line
	15500 3250 15500 3150
Wire Wire Line
	15400 3550 15500 3550
Wire Wire Line
	15500 3550 15500 3450
Connection ~ 15500 3250
Wire Wire Line
	15400 3350 15500 3350
Connection ~ 15500 3350
Wire Wire Line
	15500 3350 15500 3250
Wire Wire Line
	15400 3450 15500 3450
Connection ~ 15500 3450
Wire Wire Line
	15500 3450 15500 3350
$Comp
L power:+5V #PWR030
U 1 1 6024C574
P 15500 3150
F 0 "#PWR030" H 15500 3000 50  0001 C CNN
F 1 "+5V" H 15515 3323 50  0000 C CNN
F 2 "" H 15500 3150 50  0001 C CNN
F 3 "" H 15500 3150 50  0001 C CNN
	1    15500 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	15150 3250 14750 3250
Wire Wire Line
	15150 3350 14750 3350
Wire Wire Line
	15150 3450 14750 3450
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6026C92F
P 15300 4050
AR Path="/6026C92F" Ref="RN?"  Part="1" 
AR Path="/60757845/6026C92F" Ref="RN14"  Part="1" 
F 0 "RN14" H 15200 4150 50  0000 L CNN
F 1 "30Ω" H 15500 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 4130 50  0001 C CNN
F 3 "~" V 15300 4050 50  0001 C CNN
	1    15300 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6026C935
P 15300 4150
AR Path="/6026C935" Ref="RN?"  Part="2" 
AR Path="/60757845/6026C935" Ref="RN14"  Part="2" 
F 0 "RN14" H 15400 4200 50  0001 L CNN
F 1 "30Ω" H 15275 4256 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 4230 50  0001 C CNN
F 3 "~" V 15300 4150 50  0001 C CNN
	2    15300 4150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6026C93B
P 15300 4250
AR Path="/6026C93B" Ref="RN?"  Part="3" 
AR Path="/60757845/6026C93B" Ref="RN14"  Part="3" 
F 0 "RN14" H 15400 4300 50  0001 L CNN
F 1 "30Ω" H 15275 4356 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 4330 50  0001 C CNN
F 3 "~" V 15300 4250 50  0001 C CNN
	3    15300 4250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6026C941
P 15300 4350
AR Path="/6026C941" Ref="RN?"  Part="4" 
AR Path="/60757845/6026C941" Ref="RN14"  Part="4" 
F 0 "RN14" H 15400 4400 50  0001 L CNN
F 1 "30Ω" H 15275 4456 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 4430 50  0001 C CNN
F 3 "~" V 15300 4350 50  0001 C CNN
	4    15300 4350
	1    0    0    1   
$EndComp
Wire Wire Line
	15400 4050 15500 4050
Wire Wire Line
	15500 4050 15500 3950
Wire Wire Line
	15400 4350 15500 4350
Wire Wire Line
	15500 4350 15500 4250
Connection ~ 15500 4050
Wire Wire Line
	15400 4150 15500 4150
Connection ~ 15500 4150
Wire Wire Line
	15500 4150 15500 4050
Wire Wire Line
	15400 4250 15500 4250
Connection ~ 15500 4250
Wire Wire Line
	15500 4250 15500 4150
$Comp
L power:+5V #PWR031
U 1 1 6026C952
P 15500 3950
F 0 "#PWR031" H 15500 3800 50  0001 C CNN
F 1 "+5V" H 15515 4123 50  0000 C CNN
F 2 "" H 15500 3950 50  0001 C CNN
F 3 "" H 15500 3950 50  0001 C CNN
	1    15500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	15150 4050 14750 4050
Wire Wire Line
	15150 4250 14750 4250
Wire Wire Line
	15150 4350 14750 4350
Text Label 14750 3250 0    50   ~ 0
MFD0
Text Label 14750 3350 0    50   ~ 0
MFD1
Text Label 14750 4050 0    50   ~ 0
~CLR
Text Label 14750 4350 0    50   ~ 0
CLRWS
Text Notes 14600 1950 0    50   ~ 0
Consider single resistors here
NoConn ~ 14750 3450
Wire Wire Line
	15150 3550 14750 3550
NoConn ~ 14750 3550
$Sheet
S 12450 6400 500  400 
U 5FED7B4A
F0 "sheet5FED7B46" 50
F1 "cft_boardled.sch" 50
F2 "LED1" I L 12450 6550 50 
F3 "LED2" I L 12450 6650 50 
$EndSheet
Wire Wire Line
	12450 6550 12200 6550
Wire Wire Line
	12450 6650 12200 6650
Text Label 12200 6650 0    50   ~ 0
TXD
Text Label 12200 6550 0    50   ~ 0
RXD
Wire Wire Line
	15150 4150 14750 4150
Text Label 14750 4150 0    50   ~ 0
~µCRAM
Text Label 14750 4750 0    50   ~ 0
µCBUSCP
Text Label 14750 4250 0    50   ~ 0
µCCLKEN
Text Notes 13600 500  2    63   ~ 13
SIGNALS TO CHECK
Text Notes 12700 1150 0    63   ~ 0
Ensure these signals are pulled up/down during MCU reset:\n\n* ~WR~\n* ~RD~\n* ALE\n* ~LCLKEN~\n* ~FPHALT~ (likely open drain)\n* 
Text Label 14750 4650 0    50   ~ 0
µUCSTEP
Text Label 14750 4850 0    50   ~ 0
CLRWS
Text Label 14750 5050 0    50   ~ 0
~SCANEN
Text Label 14750 5150 0    50   ~ 0
~PANELEN
Text Label 14750 5250 0    50   ~ 0
~LED-STOP
Text Label 14750 5350 0    50   ~ 0
STEP∕~RUN
Text Label 14750 5450 0    50   ~ 0
~µSTEP
Entry Wire Line
	4550 -5250 4650 -5350
Entry Wire Line
	4550 -5150 4650 -5250
Entry Wire Line
	4550 -5050 4650 -5150
Entry Wire Line
	4550 -4950 4650 -5050
Entry Wire Line
	4550 -4850 4650 -4950
Entry Wire Line
	4550 -4750 4650 -4850
Entry Wire Line
	4550 -4650 4650 -4750
Entry Wire Line
	4550 -4550 4650 -4650
Wire Wire Line
	3550 -5250 4550 -5250
Wire Wire Line
	3550 -5150 4550 -5150
Wire Wire Line
	3550 -5050 4550 -5050
Wire Wire Line
	3550 -4950 4550 -4950
Wire Wire Line
	3550 -4850 4550 -4850
Wire Wire Line
	3550 -4750 4550 -4750
Wire Wire Line
	3550 -4650 4550 -4650
Wire Wire Line
	3550 -4550 4550 -4550
Text Notes 1800 -5700 0    100  ~ 20
DFP Microcontroller
Wire Wire Line
	9350 -3650 9350 -3600
Connection ~ 9050 -3600
Connection ~ 8950 -3600
Wire Wire Line
	8950 -3600 9050 -3600
Wire Wire Line
	8650 -3150 8200 -3150
Connection ~ 8650 -3150
Wire Wire Line
	8650 -3300 8650 -3150
Wire Wire Line
	8750 -3050 8200 -3050
Connection ~ 8750 -3050
Wire Wire Line
	8750 -3300 8750 -3050
Wire Wire Line
	8850 -2950 8200 -2950
Connection ~ 8850 -2950
Wire Wire Line
	8850 -3300 8850 -2950
Wire Wire Line
	8950 -2850 8200 -2850
Connection ~ 8950 -2850
Wire Wire Line
	8950 -3300 8950 -2850
Wire Wire Line
	8950 -3550 8950 -3600
Wire Wire Line
	8850 -3600 8950 -3600
Connection ~ 8850 -3600
Wire Wire Line
	8850 -3550 8850 -3600
Wire Wire Line
	8750 -3600 8850 -3600
Connection ~ 8750 -3600
Wire Wire Line
	8750 -3550 8750 -3600
Wire Wire Line
	8650 -3600 8750 -3600
Wire Wire Line
	8650 -3550 8650 -3600
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 613FD660
P 8950 -3450
AR Path="/613FD660" Ref="RN?"  Part="1" 
AR Path="/60757845/613FD660" Ref="RN7"  Part="1" 
F 0 "RN7" V 9000 -3050 50  0000 L CNN
F 1 "10kΩ" V 8900 -3050 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8950 -3370 50  0001 C CNN
F 3 "~" V 8950 -3450 50  0001 C CNN
	1    8950 -3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9050 -2750 8200 -2750
Connection ~ 9050 -2750
Wire Wire Line
	9050 -3300 9050 -2750
Text Label 1650 -1550 2    50   ~ 0
~µCRAM
Wire Wire Line
	1750 -1650 1200 -1650
Wire Wire Line
	1200 -1800 950  -1800
Wire Wire Line
	1200 -1650 1200 -1800
$Comp
L power:GND #PWR013
U 1 1 6085DCB4
P 450 -1800
F 0 "#PWR013" H 450 -2050 50  0001 C CNN
F 1 "GND" H 600 -1850 50  0000 C CNN
F 2 "" H 450 -1800 50  0001 C CNN
F 3 "" H 450 -1800 50  0001 C CNN
	1    450  -1800
	-1   0    0    -1  
$EndComp
Text Label 1250 -1650 0    50   ~ 0
ACT-LED
$Comp
L Device:R_Small R?
U 1 1 608B26E9
P 850 -1800
AR Path="/608B26E9" Ref="R?"  Part="1" 
AR Path="/64C48268/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/608B26E9" Ref="R?"  Part="1" 
AR Path="/60A2F394/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/608B26E9" Ref="R6"  Part="1" 
F 0 "R6" V 1046 -1800 50  0000 C CNN
F 1 "680Ω" V 955 -1800 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 850 -1800 50  0001 C CNN
F 3 "~" H 850 -1800 50  0001 C CNN
	1    850  -1800
	0    1    -1   0   
$EndComp
Wire Wire Line
	3550 6500 4350 6500
Wire Wire Line
	5400 -3650 5400 -2250
$Comp
L Device:LED_ALT D?
U 1 1 604918F8
P 600 -1800
AR Path="/604918F8" Ref="D?"  Part="1" 
AR Path="/64C48268/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/604918F8" Ref="D?"  Part="1" 
AR Path="/60A2F394/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/604918F8" Ref="D4"  Part="1" 
F 0 "D4" H 593 -1963 50  0000 C CNN
F 1 "LED_ALT" H 593 -1964 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 600 -1800 50  0001 C CNN
F 3 "~" H 600 -1800 50  0001 C CNN
	1    600  -1800
	1    0    0    1   
$EndComp
Text Label 750  -4150 0    50   ~ 0
~LCKLKEN
Text HLabel 400  -4150 0    50   Output ~ 0
~LCLKEN
Text Notes 5900 -3550 0    100  ~ 20
Front Panel\nScanner Counter
Text Notes 7800 -3800 0    100  ~ 20
Address Bus
Connection ~ 5900 -2850
Text Label 5900 -1700 1    50   ~ 0
SCANCLK
Wire Wire Line
	6900 -1400 6800 -1400
Connection ~ 6900 -1400
Wire Wire Line
	6900 -1450 6900 -1400
Wire Wire Line
	7100 -1400 7100 -1350
Connection ~ 7100 -1400
Wire Wire Line
	7100 -1400 6900 -1400
Wire Wire Line
	7100 -1450 7100 -1400
Wire Wire Line
	6000 -1550 5900 -1550
$Comp
L power:+5V #PWR?
U 1 1 601CE94F
P 6000 -1700
AR Path="/601CE94F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE94F" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 6000 -1850 50  0001 C CNN
F 1 "+5V" H 6015 -1527 50  0000 C CNN
F 2 "" H 6000 -1700 50  0001 C CNN
F 3 "" H 6000 -1700 50  0001 C CNN
	1    6000 -1700
	-1   0    0    -1  
$EndComp
$Comp
L alexios:CXO_DIP8 X?
U 1 1 601CE949
P 6500 -1600
AR Path="/601CE949" Ref="X?"  Part="1" 
AR Path="/60757845/601CE949" Ref="X2"  Part="1" 
F 0 "X2" H 6600 -1233 50  0000 C CNN
F 1 "7.3728 MHz?" H 6600 -1324 50  0000 C CNN
F 2 "alexios:Oscillator_DIP-8-socket" H 6650 -2000 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 6600 -1650 50  0001 C CNN
	1    6500 -1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7100 -1700 6900 -1700
Connection ~ 7100 -1700
Wire Wire Line
	7100 -1700 7100 -1650
$Comp
L Device:C_Small C?
U 1 1 601CE940
P 7100 -1550
AR Path="/601CE940" Ref="C?"  Part="1" 
AR Path="/60757845/601CE940" Ref="C12"  Part="1" 
F 0 "C12" H 7000 -1300 50  0000 R CNN
F 1 "1µF" H 7000 -1550 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7100 -1550 50  0001 C CNN
F 3 "~" H 7100 -1550 50  0001 C CNN
	1    7100 -1550
	-1   0    0    -1  
$EndComp
Connection ~ 6900 -1700
Wire Wire Line
	6900 -1650 6900 -1700
Wire Wire Line
	7100 -1700 7100 -1750
Wire Wire Line
	6800 -1700 6900 -1700
$Comp
L power:GND #PWR?
U 1 1 601CE936
P 7100 -1350
AR Path="/601CE936" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE936" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 7100 -1600 50  0001 C CNN
F 1 "GND" H 7105 -1523 50  0000 C CNN
F 2 "" H 7100 -1350 50  0001 C CNN
F 3 "" H 7100 -1350 50  0001 C CNN
	1    7100 -1350
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 601CE930
P 6900 -1550
AR Path="/601CE930" Ref="C?"  Part="1" 
AR Path="/60757845/601CE930" Ref="C11"  Part="1" 
F 0 "C11" H 6950 -1300 50  0000 R CNN
F 1 "100nF" H 7050 -1800 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6900 -1550 50  0001 C CNN
F 3 "~" H 6900 -1550 50  0001 C CNN
	1    6900 -1550
	-1   0    0    -1  
$EndComp
Text Notes 7400 -1350 0    50   ~ 0
Socket X2 and try frequencies that aren't harmonics\nof the CPU clock (4 MHz) to avoid strobe effects on\nthe front panel lights. The panel will update at 1/21\nthe crystal frequency.
$Comp
L power:+5V #PWR024
U 1 1 60145FEC
P 9350 -3650
F 0 "#PWR024" H 9350 -3800 50  0001 C CNN
F 1 "+5V" H 9450 -3550 50  0000 C CNN
F 2 "" H 9350 -3650 50  0001 C CNN
F 3 "" H 9350 -3650 50  0001 C CNN
	1    9350 -3650
	1    0    0    -1  
$EndComp
Connection ~ 9350 -3600
Wire Wire Line
	9350 -3550 9350 -3600
Wire Wire Line
	9250 -3600 9350 -3600
Connection ~ 9250 -3600
Wire Wire Line
	9250 -3550 9250 -3600
Wire Wire Line
	9150 -3600 9250 -3600
Connection ~ 9150 -3600
Wire Wire Line
	9150 -3550 9150 -3600
Wire Wire Line
	9050 -3600 9150 -3600
Wire Wire Line
	9050 -3550 9050 -3600
Wire Wire Line
	9350 -2450 8200 -2450
Connection ~ 9350 -2450
Wire Wire Line
	9350 -3300 9350 -2450
Wire Wire Line
	9250 -2550 8200 -2550
Connection ~ 9250 -2550
Wire Wire Line
	9250 -3300 9250 -2550
Wire Wire Line
	9150 -2650 8200 -2650
Connection ~ 9150 -2650
Wire Wire Line
	9150 -3300 9150 -2650
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 615F27AA
P 9050 -3450
AR Path="/615F27AA" Ref="RN?"  Part="1" 
AR Path="/60757845/615F27AA" Ref="RN8"  Part="1" 
F 0 "RN8" V 9100 -3850 50  0000 R CNN
F 1 "30Ω" V 9000 -3850 50  0000 R CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9050 -3370 50  0001 C CNN
F 3 "~" V 9050 -3450 50  0001 C CNN
	1    9050 -3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9800 -3150 8650 -3150
Wire Wire Line
	9800 -3050 8750 -3050
Wire Wire Line
	9800 -2950 8850 -2950
Wire Wire Line
	9800 -2850 8950 -2850
Wire Wire Line
	9800 -2750 9050 -2750
Wire Wire Line
	9800 -2650 9150 -2650
Wire Wire Line
	9800 -2550 9250 -2550
Wire Wire Line
	9800 -2450 9350 -2450
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610F1C6F
P 8100 -2450
AR Path="/610F1C6F" Ref="RN?"  Part="1" 
AR Path="/60757845/610F1C6F" Ref="RN6"  Part="1" 
F 0 "RN6" H 8200 -2400 50  0001 L CNN
F 1 "30Ω" H 8300 -2850 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8100 -2370 50  0001 C CNN
F 3 "~" V 8100 -2450 50  0001 C CNN
	1    8100 -2450
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610F1C75
P 8100 -2850
AR Path="/610F1C75" Ref="RN?"  Part="1" 
AR Path="/60757845/610F1C75" Ref="RN5"  Part="1" 
F 0 "RN5" H 7950 -3250 50  0000 L CNN
F 1 "30Ω" H 8250 -3200 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8100 -2770 50  0001 C CNN
F 3 "~" V 8100 -2850 50  0001 C CNN
	1    8100 -2850
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610F1C7B
P 8100 -2950
AR Path="/610F1C7B" Ref="RN?"  Part="2" 
AR Path="/60757845/610F1C7B" Ref="RN5"  Part="2" 
F 0 "RN5" H 8200 -2900 50  0001 L CNN
F 1 "30Ω" H 8075 -2844 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8100 -2870 50  0001 C CNN
F 3 "~" V 8100 -2950 50  0001 C CNN
	2    8100 -2950
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610F1C81
P 8100 -3050
AR Path="/610F1C81" Ref="RN?"  Part="3" 
AR Path="/60757845/610F1C81" Ref="RN5"  Part="3" 
F 0 "RN5" H 8200 -3000 50  0001 L CNN
F 1 "30Ω" H 8075 -2944 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8100 -2970 50  0001 C CNN
F 3 "~" V 8100 -3050 50  0001 C CNN
	3    8100 -3050
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610F1C87
P 8100 -3150
AR Path="/610F1C87" Ref="RN?"  Part="4" 
AR Path="/60757845/610F1C87" Ref="RN5"  Part="4" 
F 0 "RN5" H 8200 -3100 50  0001 L CNN
F 1 "30Ω" H 8075 -3044 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8100 -3070 50  0001 C CNN
F 3 "~" V 8100 -3150 50  0001 C CNN
	4    8100 -3150
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610F1C8D
P 8100 -2550
AR Path="/610F1C8D" Ref="RN?"  Part="2" 
AR Path="/60757845/610F1C8D" Ref="RN6"  Part="2" 
F 0 "RN6" H 8200 -2500 50  0001 L CNN
F 1 "30Ω" H 8075 -2444 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8100 -2470 50  0001 C CNN
F 3 "~" V 8100 -2550 50  0001 C CNN
	2    8100 -2550
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610F1C93
P 8100 -2650
AR Path="/610F1C93" Ref="RN?"  Part="3" 
AR Path="/60757845/610F1C93" Ref="RN6"  Part="3" 
F 0 "RN6" H 8200 -2600 50  0001 L CNN
F 1 "30Ω" H 8075 -2544 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8100 -2570 50  0001 C CNN
F 3 "~" V 8100 -2650 50  0001 C CNN
	3    8100 -2650
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610F1C99
P 8100 -2750
AR Path="/610F1C99" Ref="RN?"  Part="4" 
AR Path="/60757845/610F1C99" Ref="RN6"  Part="4" 
F 0 "RN6" H 7950 -2350 50  0000 L CNN
F 1 "30Ω" H 8300 -2400 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8100 -2670 50  0001 C CNN
F 3 "~" V 8100 -2750 50  0001 C CNN
	4    8100 -2750
	1    0    0    1   
$EndComp
Entry Wire Line
	9800 -3150 9900 -3250
Entry Wire Line
	9800 -3050 9900 -3150
Entry Wire Line
	9800 -2950 9900 -3050
Entry Wire Line
	9800 -2850 9900 -2950
Entry Wire Line
	9800 -2750 9900 -2850
Entry Wire Line
	9800 -2650 9900 -2750
Entry Wire Line
	9800 -2550 9900 -2650
Entry Wire Line
	9800 -2450 9900 -2550
Entry Bus Bus
	10000 -3500 9900 -3400
Wire Bus Line
	10450 -3500 10000 -3500
Text Label 10050 -3500 0    50   ~ 0
FPA[0..7]
Text HLabel 10450 -3500 2    50   BiDi ~ 0
FPA[0..7]
Text Label 9550 -3150 0    50   ~ 0
FPA0
Text Label 9550 -3050 0    50   ~ 0
FPA1
Text Label 9550 -2950 0    50   ~ 0
FPA2
Text Label 9550 -2850 0    50   ~ 0
FPA3
Text Label 9550 -2750 0    50   ~ 0
FPA4
Text Label 9550 -2650 0    50   ~ 0
FPA5
Text Label 9550 -2550 0    50   ~ 0
FPA6
Text Label 9550 -2450 0    50   ~ 0
FPA7
Entry Wire Line
	7500 -3150 7400 -3250
Entry Wire Line
	7500 -3050 7400 -3150
Entry Wire Line
	7500 -2950 7400 -3050
Entry Wire Line
	7500 -2850 7400 -2950
Entry Wire Line
	7500 -2750 7400 -2850
Entry Wire Line
	7500 -2650 7400 -2750
Entry Wire Line
	7500 -2550 7400 -2650
Entry Wire Line
	7500 -2450 7400 -2550
Text Label 7600 -2450 0    50   ~ 0
MCA7
Text Label 7600 -2550 0    50   ~ 0
MCA6
Text Label 7600 -2650 0    50   ~ 0
MCA5
Text Label 7600 -2750 0    50   ~ 0
MCA4
Text Label 7600 -2850 0    50   ~ 0
MCA3
Text Label 7600 -2950 0    50   ~ 0
MCA2
Text Label 7600 -3050 0    50   ~ 0
MCA1
Text Label 7600 -3150 0    50   ~ 0
MCA0
Wire Wire Line
	7500 -2450 7950 -2450
Wire Wire Line
	7500 -2550 7950 -2550
Wire Wire Line
	7500 -2650 7950 -2650
Wire Wire Line
	7500 -2750 7950 -2750
Wire Wire Line
	7500 -2850 7950 -2850
Wire Wire Line
	7500 -2950 7950 -2950
Wire Wire Line
	7500 -3050 7950 -3050
Wire Wire Line
	7500 -3150 7950 -3150
Text Label 3900 -2750 2    50   ~ 0
~µCMEM
Text Label 3900 -2850 2    50   ~ 0
~µCIO
Text HLabel 1050 2000 0    50   Output ~ 0
~RD
Text HLabel 1050 1900 0    50   Output ~ 0
~WR
Text HLabel 400  -4050 0    50   Output ~ 0
~FPRESET
Text Label 750  -4050 0    50   ~ 0
~FPRESET
Text HLabel 400  -3950 0    50   Output ~ 0
~FPRSTHOLD
Text Label 750  -3950 0    50   ~ 0
~FPRSTHOLD
Text HLabel 4400 -4250 2    50   Output ~ 0
MFD0
Wire Wire Line
	4400 -4150 3550 -4150
Wire Wire Line
	4400 -4250 3550 -4250
Connection ~ 10150 5400
Connection ~ 10150 5600
$Comp
L Device:C_Small C?
U 1 1 6416E28C
P 10150 5500
AR Path="/6416E28C" Ref="C?"  Part="1" 
AR Path="/60757845/6416E28C" Ref="C15"  Part="1" 
F 0 "C15" H 10059 5546 50  0000 R CNN
F 1 "100nF" H 10059 5455 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 5500 50  0001 C CNN
F 3 "~" H 10150 5500 50  0001 C CNN
	1    10150 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6416E286
P 10150 5400
AR Path="/6416E286" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E286" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 10150 5250 50  0001 C CNN
F 1 "+5V" H 10165 5573 50  0000 C CNN
F 2 "" H 10150 5400 50  0001 C CNN
F 3 "" H 10150 5400 50  0001 C CNN
	1    10150 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6416E280
P 10150 5600
AR Path="/6416E280" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E280" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 10150 5350 50  0001 C CNN
F 1 "GND" H 10155 5427 50  0000 C CNN
F 2 "" H 10150 5600 50  0001 C CNN
F 3 "" H 10150 5600 50  0001 C CNN
	1    10150 5600
	1    0    0    -1  
$EndComp
Connection ~ 8900 5600
Connection ~ 8900 5400
$Comp
L Device:C_Small C?
U 1 1 641091C5
P 8900 5500
AR Path="/641091C5" Ref="C?"  Part="1" 
AR Path="/60757845/641091C5" Ref="C13"  Part="1" 
F 0 "C13" H 8809 5546 50  0000 R CNN
F 1 "100nF" H 8809 5455 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8900 5500 50  0001 C CNN
F 3 "~" H 8900 5500 50  0001 C CNN
	1    8900 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 641091BF
P 8900 5400
AR Path="/641091BF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091BF" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 8900 5250 50  0001 C CNN
F 1 "+5V" H 8915 5573 50  0000 C CNN
F 2 "" H 8900 5400 50  0001 C CNN
F 3 "" H 8900 5400 50  0001 C CNN
	1    8900 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 641091B9
P 8900 5600
AR Path="/641091B9" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091B9" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 8900 5350 50  0001 C CNN
F 1 "GND" H 8905 5427 50  0000 C CNN
F 2 "" H 8900 5600 50  0001 C CNN
F 3 "" H 8900 5600 50  0001 C CNN
	1    8900 5600
	1    0    0    -1  
$EndComp
Connection ~ 8900 6250
Connection ~ 8900 6050
$Comp
L Device:C_Small C?
U 1 1 64073B48
P 8900 6150
AR Path="/64073B48" Ref="C?"  Part="1" 
AR Path="/60757845/64073B48" Ref="C14"  Part="1" 
F 0 "C14" H 8809 6196 50  0000 R CNN
F 1 "100nF" H 8809 6105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8900 6150 50  0001 C CNN
F 3 "~" H 8900 6150 50  0001 C CNN
	1    8900 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64073B42
P 8900 6050
AR Path="/64073B42" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B42" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 8900 5900 50  0001 C CNN
F 1 "+5V" H 8915 6223 50  0000 C CNN
F 2 "" H 8900 6050 50  0001 C CNN
F 3 "" H 8900 6050 50  0001 C CNN
	1    8900 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64073B3C
P 8900 6250
AR Path="/64073B3C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B3C" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 8900 6000 50  0001 C CNN
F 1 "GND" H 8905 6077 50  0000 C CNN
F 2 "" H 8900 6250 50  0001 C CNN
F 3 "" H 8900 6250 50  0001 C CNN
	1    8900 6250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U5
U 2 1 6403F195
P 10500 5900
F 0 "U5" H 10680 6346 50  0000 L CNN
F 1 "74HC245" H 10680 6255 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10500 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 10500 5950 50  0001 C CNN
	2    10500 5900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC590 U?
U 2 1 6403E919
P 9250 5850
AR Path="/6403E919" Ref="U?"  Part="1" 
AR Path="/6233F88C/6403E919" Ref="U?"  Part="1" 
AR Path="/60757845/6403E919" Ref="U4"  Part="2" 
F 0 "U4" H 9430 6246 50  0000 L CNN
F 1 "74HC590" H 9430 6155 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 9550 6200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 9550 6200 50  0001 C CNN
	2    9250 5850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC573 U?
U 2 1 6403DE58
P 9400 6550
AR Path="/6403DE58" Ref="U?"  Part="1" 
AR Path="/60757845/6403DE58" Ref="U3"  Part="2" 
F 0 "U3" H 9430 6996 50  0000 L CNN
F 1 "74AC573" H 9430 6905 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9400 6550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 9400 6550 50  0001 C CNN
F 4 "Yes" H 4100 4800 50  0001 C CNN "Verified"
	2    9400 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 63D14E0F
P 1650 -2150
AR Path="/63D14E0F" Ref="RN?"  Part="2" 
AR Path="/60757845/63D14E0F" Ref="RN2"  Part="4" 
F 0 "RN2" H 1150 -2150 50  0000 L CNN
F 1 "30Ω" H 1650 -2250 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1650 -2070 50  0001 C CNN
F 3 "~" V 1650 -2150 50  0001 C CNN
	4    1650 -2150
	1    0    0    -1  
$EndComp
NoConn ~ 1450 -2150
Wire Wire Line
	1500 -2150 1450 -2150
Wire Wire Line
	4400 -4350 3850 -4350
Wire Wire Line
	3650 -4350 3550 -4350
Text HLabel 4400 -4350 2    50   Output ~ 0
~FPIRQ
Wire Wire Line
	400  -4250 1300 -4250
Wire Wire Line
	2250 2200 2400 2200
$Comp
L Device:R_Small R?
U 1 1 63C79DDA
P 2150 2200
AR Path="/63C79DDA" Ref="R?"  Part="1" 
AR Path="/60757845/63C79DDA" Ref="R2"  Part="1" 
F 0 "R2" V 2200 2400 50  0000 C CNN
F 1 "30Ω" V 2100 2400 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2150 2200 50  0001 C CNN
F 3 "~" H 2150 2200 50  0001 C CNN
	1    2150 2200
	0    -1   -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 63C465B1
P 1100 -1550
AR Path="/63C465B1" Ref="RN?"  Part="1" 
AR Path="/60757845/63C465B1" Ref="RN3"  Part="4" 
F 0 "RN3" H 1050 -1450 50  0000 L CNN
F 1 "30Ω" H 850 -1900 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1100 -1470 50  0001 C CNN
F 3 "~" V 1100 -1550 50  0001 C CNN
	4    1100 -1550
	-1   0    0    -1  
$EndComp
Text HLabel 950  -2450 0    50   Output ~ 0
~CVOE
Wire Wire Line
	950  -2450 1750 -2450
Text Notes 4650 5800 0    50   ~ 0
DTE/DCE cable config\n(aka I'm an idiot and always\nget the pinout wrong)
Text Label 3550 6500 0    50   ~ 0
RXD
Wire Wire Line
	4850 6150 4800 6150
$Comp
L alexios:SolderJumper_3_Bridged23 JP2
U 1 1 62B45C36
P 4950 6150
F 0 "JP2" V 4700 6150 50  0000 C CNN
F 1 "SolderJumper_3_Bridged23" H 4950 6260 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged23_RoundedPad1.0x1.5mm" H 4950 6150 50  0001 C CNN
F 3 "~" H 4950 6150 50  0001 C CNN
	1    4950 6150
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 6350 5100 6350
Connection ~ 4950 6350
Wire Wire Line
	4950 6300 4950 6350
Wire Wire Line
	5100 6350 5100 6150
Wire Wire Line
	4700 6350 4950 6350
Wire Wire Line
	4700 6300 4700 6350
Wire Wire Line
	4950 5950 5100 5950
Connection ~ 4950 5950
Wire Wire Line
	4950 6000 4950 5950
Wire Wire Line
	5100 6050 5250 6050
Wire Wire Line
	5100 5950 5100 6050
Wire Wire Line
	4700 5950 4950 5950
Wire Wire Line
	4700 6000 4700 5950
Wire Wire Line
	4550 6150 4600 6150
$Comp
L alexios:SolderJumper_3_Bridged12 JP1
U 1 1 62B114C6
P 4700 6150
F 0 "JP1" V 4450 6150 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 4700 6260 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 4700 6150 50  0001 C CNN
F 3 "~" H 4700 6150 50  0001 C CNN
	1    4700 6150
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 61A9831B
P 5450 6250
AR Path="/61A9831B" Ref="J?"  Part="1" 
AR Path="/60757845/61A9831B" Ref="J2"  Part="1" 
F 0 "J2" H 5550 6600 50  0000 C CNN
F 1 "Conn_01x06" H 5530 6151 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 5450 6250 50  0001 C CNN
F 3 "~" H 5450 6250 50  0001 C CNN
	1    5450 6250
	1    0    0    1   
$EndComp
Wire Wire Line
	5250 6150 5100 6150
$Comp
L power:GND #PWR?
U 1 1 61A98322
P 5250 6450
AR Path="/61A98322" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A98322" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 5250 6200 50  0001 C CNN
F 1 "GND" H 5255 6277 50  0000 C CNN
F 2 "" H 5250 6450 50  0001 C CNN
F 3 "" H 5250 6450 50  0001 C CNN
	1    5250 6450
	-1   0    0    -1  
$EndComp
NoConn ~ 5250 6350
NoConn ~ 5250 5950
NoConn ~ 5250 6250
Text Notes 5550 5950 0    50   ~ 0
~RTS
Text Notes 5550 6050 0    50   ~ 0
RXD
Text Notes 5550 6150 0    50   ~ 0
TXD
Text Notes 5550 6250 0    50   ~ 0
Vcc
Text Notes 5550 6450 0    50   ~ 0
GND
Text Notes 5550 6350 0    50   ~ 0
~CTS
Text HLabel 950  -2550 0    50   Output ~ 0
~DBOE
Text HLabel 950  -2650 0    50   Output ~ 0
~ABOE
Text HLabel 950  -2750 0    50   Output ~ 0
~IBOE
Text HLabel 950  -2850 0    50   Output ~ 0
CLRWS
Text HLabel 4350 -3050 2    50   3State ~ 0
~W
Text HLabel 4350 -2950 2    50   3State ~ 0
~R
Text HLabel 4350 -2850 2    50   3State ~ 0
~IO
Text HLabel 4350 -2750 2    50   3State ~ 0
~MEM
Wire Wire Line
	4300 -2750 4350 -2750
Wire Wire Line
	4300 -2850 4350 -2850
Wire Wire Line
	4300 -2950 4350 -2950
Wire Wire Line
	4300 -3050 4350 -3050
Wire Wire Line
	3550 -3050 4050 -3050
Wire Wire Line
	3550 -2950 4050 -2950
Wire Wire Line
	3550 -2850 4050 -2850
Wire Wire Line
	3550 -2750 4050 -2750
Wire Wire Line
	1750 -2550 950  -2550
Wire Wire Line
	1750 -2650 950  -2650
Wire Wire Line
	1750 -2750 950  -2750
Wire Wire Line
	1750 -2850 950  -2850
Text Label 1650 -1250 2    50   ~ 0
µCBUSCP
Text Label 1650 -1350 2    50   ~ 0
µCµSTEP
Text Label 1650 -1450 2    50   ~ 0
µCCLKEN
Wire Wire Line
	1750 -1350 1250 -1350
Wire Wire Line
	1750 -1450 1250 -1450
Text HLabel 950  -1250 0    50   Output ~ 0
BUSCP
Wire Wire Line
	1000 -1250 950  -1250
Wire Wire Line
	1000 -1350 950  -1350
Wire Wire Line
	1000 -1450 950  -1450
Wire Wire Line
	1000 -1550 950  -1550
Wire Wire Line
	1750 -1250 1250 -1250
Text HLabel 950  -1350 0    50   Output ~ 0
FPµSTEP-IN
Text HLabel 950  -1450 0    50   Output ~ 0
FPCLKEN-IN
Wire Wire Line
	1750 -1550 1250 -1550
Text HLabel 950  -1550 0    50   Output ~ 0
~FPRAM~∕ROM
$Comp
L alexios:momentary_switch SW1
U 1 1 61CAFDFF
P 1550 -4650
F 0 "SW1" H 1550 -4451 50  0000 C CNN
F 1 "momentary_switch" H 1550 -4710 50  0001 C CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx31-2LFS" H 1550 -4450 50  0001 C CNN
F 3 "" H 1550 -4450 50  0001 C CNN
	1    1550 -4650
	-1   0    0    -1  
$EndComp
Text Label 3550 6150 0    50   ~ 0
TXD
$Comp
L Device:R_Small R?
U 1 1 61A9832D
P 4450 6150
AR Path="/61A9832D" Ref="R?"  Part="1" 
AR Path="/60757845/61A9832D" Ref="R5"  Part="1" 
F 0 "R5" V 4554 6150 50  0000 C CNN
F 1 "30Ω" V 4645 6150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4450 6150 50  0001 C CNN
F 3 "~" H 4450 6150 50  0001 C CNN
	1    4450 6150
	0    1    1    0   
$EndComp
Text Notes 5600 5450 2    100  ~ 20
Control Interface & TTYD
Text HLabel 400  -4250 0    50   Output ~ 0
~FPHALT
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 615F27BC
P 9350 -3450
AR Path="/615F27BC" Ref="RN?"  Part="4" 
AR Path="/60757845/615F27BC" Ref="RN8"  Part="4" 
F 0 "RN8" H 9450 -3400 50  0001 L CNN
F 1 "30Ω" H 9325 -3344 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9350 -3370 50  0001 C CNN
F 3 "~" V 9350 -3450 50  0001 C CNN
	4    9350 -3450
	0    1    -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 615F27B6
P 9250 -3450
AR Path="/615F27B6" Ref="RN?"  Part="3" 
AR Path="/60757845/615F27B6" Ref="RN8"  Part="3" 
F 0 "RN8" H 9350 -3400 50  0001 L CNN
F 1 "30Ω" H 9225 -3344 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 -3370 50  0001 C CNN
F 3 "~" V 9250 -3450 50  0001 C CNN
	3    9250 -3450
	0    -1   -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 615F27B0
P 9150 -3450
AR Path="/615F27B0" Ref="RN?"  Part="2" 
AR Path="/60757845/615F27B0" Ref="RN8"  Part="2" 
F 0 "RN8" H 9250 -3400 50  0001 L CNN
F 1 "30Ω" H 9125 -3344 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9150 -3370 50  0001 C CNN
F 3 "~" V 9150 -3450 50  0001 C CNN
	2    9150 -3450
	0    -1   -1   0   
$EndComp
Entry Wire Line
	7400 -3250 7300 -3150
Entry Wire Line
	7400 -3150 7300 -3050
Entry Wire Line
	7400 -3050 7300 -2950
Entry Wire Line
	7400 -2950 7300 -2850
Entry Wire Line
	7400 -2850 7300 -2750
Text HLabel 10450 -5600 2    50   BiDi ~ 0
FPD[0..7]
Text Label 10050 -5600 0    50   ~ 0
FPD[0..7]
Entry Bus Bus
	10000 -5600 9900 -5500
Entry Wire Line
	9800 -4550 9900 -4650
Entry Wire Line
	9800 -4650 9900 -4750
Entry Wire Line
	9800 -4750 9900 -4850
Entry Wire Line
	9800 -4850 9900 -4950
Entry Wire Line
	9800 -4950 9900 -5050
Entry Wire Line
	9800 -5050 9900 -5150
Entry Wire Line
	9800 -5150 9900 -5250
Entry Wire Line
	9800 -5250 9900 -5350
Text Label 7950 -4550 2    50   ~ 0
MCD7
Text Label 7950 -4650 2    50   ~ 0
MCD6
Text Label 7950 -4750 2    50   ~ 0
MCD5
Text Label 7950 -4850 2    50   ~ 0
MCD4
Text Label 7950 -4950 2    50   ~ 0
MCD3
Text Label 7950 -5050 2    50   ~ 0
MCD2
Text Label 7950 -5150 2    50   ~ 0
MCD1
$Comp
L alexios:74HC245 U5
U 1 1 60AE5F32
P 8550 -4750
F 0 "U5" H 8550 -3983 50  0000 C CNN
F 1 "74HC245" H 8550 -4074 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8550 -4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 8550 -4700 50  0001 C CNN
	1    8550 -4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 -5250 9100 -5250
Wire Wire Line
	9050 -5150 9100 -5150
Wire Wire Line
	9050 -5050 9100 -5050
Wire Wire Line
	9050 -4950 9100 -4950
Wire Wire Line
	9050 -4850 9100 -4850
Wire Wire Line
	9050 -4750 9100 -4750
Wire Wire Line
	9050 -4650 9100 -4650
Wire Wire Line
	9050 -4550 9100 -4550
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60CC9B33
P 9250 -4550
AR Path="/60CC9B33" Ref="RN?"  Part="4" 
AR Path="/60757845/60CC9B33" Ref="RN10"  Part="4" 
F 0 "RN10" H 9150 -4700 50  0000 L CNN
F 1 "30Ω" H 9450 -4600 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 -4470 50  0001 C CNN
F 3 "~" V 9250 -4550 50  0001 C CNN
	4    9250 -4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60CC9B39
P 9250 -4650
AR Path="/60CC9B39" Ref="RN?"  Part="3" 
AR Path="/60757845/60CC9B39" Ref="RN10"  Part="3" 
F 0 "RN10" H 9350 -4600 50  0001 L CNN
F 1 "30Ω" H 9225 -4544 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 -4570 50  0001 C CNN
F 3 "~" V 9250 -4650 50  0001 C CNN
	3    9250 -4650
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60CC9B3F
P 9250 -4750
AR Path="/60CC9B3F" Ref="RN?"  Part="2" 
AR Path="/60757845/60CC9B3F" Ref="RN10"  Part="2" 
F 0 "RN10" H 9350 -4700 50  0001 L CNN
F 1 "30Ω" H 9225 -4644 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 -4670 50  0001 C CNN
F 3 "~" V 9250 -4750 50  0001 C CNN
	2    9250 -4750
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60CC9B45
P 9250 -4950
AR Path="/60CC9B45" Ref="RN?"  Part="4" 
AR Path="/60757845/60CC9B45" Ref="RN9"  Part="4" 
F 0 "RN9" H 9350 -4900 50  0001 L CNN
F 1 "30Ω" H 9225 -4844 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 -4870 50  0001 C CNN
F 3 "~" V 9250 -4950 50  0001 C CNN
	4    9250 -4950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60CC9B4B
P 9250 -5050
AR Path="/60CC9B4B" Ref="RN?"  Part="3" 
AR Path="/60757845/60CC9B4B" Ref="RN9"  Part="3" 
F 0 "RN9" H 9350 -5000 50  0001 L CNN
F 1 "30Ω" H 9225 -4944 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 -4970 50  0001 C CNN
F 3 "~" V 9250 -5050 50  0001 C CNN
	3    9250 -5050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60CC9B51
P 9250 -5150
AR Path="/60CC9B51" Ref="RN?"  Part="2" 
AR Path="/60757845/60CC9B51" Ref="RN9"  Part="2" 
F 0 "RN9" H 9350 -5100 50  0001 L CNN
F 1 "30Ω" H 9225 -5044 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 -5070 50  0001 C CNN
F 3 "~" V 9250 -5150 50  0001 C CNN
	2    9250 -5150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60CC9B57
P 9250 -5250
AR Path="/60CC9B57" Ref="RN?"  Part="1" 
AR Path="/60757845/60CC9B57" Ref="RN9"  Part="1" 
F 0 "RN9" H 9150 -5100 50  0000 L CNN
F 1 "30Ω" H 9400 -5200 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 -5170 50  0001 C CNN
F 3 "~" V 9250 -5250 50  0001 C CNN
	1    9250 -5250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60CC9B5D
P 9250 -4850
AR Path="/60CC9B5D" Ref="RN?"  Part="1" 
AR Path="/60757845/60CC9B5D" Ref="RN10"  Part="1" 
F 0 "RN10" H 9350 -4800 50  0001 L CNN
F 1 "30Ω" H 9450 -5250 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 -4770 50  0001 C CNN
F 3 "~" V 9250 -4850 50  0001 C CNN
	1    9250 -4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 -4550 9350 -4550
Wire Wire Line
	9800 -4650 9350 -4650
Wire Wire Line
	9800 -4750 9350 -4750
Wire Wire Line
	9800 -4850 9350 -4850
Wire Wire Line
	9800 -4950 9350 -4950
Wire Wire Line
	9800 -5050 9350 -5050
Wire Wire Line
	9800 -5150 9350 -5150
Wire Wire Line
	9800 -5250 9350 -5250
Text Label 9750 -5250 2    50   ~ 0
FPD0
Text Label 9750 -5150 2    50   ~ 0
FPD1
Text Label 9750 -5050 2    50   ~ 0
FPD2
Text Label 9750 -4950 2    50   ~ 0
FPD3
Text Label 9750 -4850 2    50   ~ 0
FPD4
Text Label 9750 -4750 2    50   ~ 0
FPD5
Text Label 9750 -4650 2    50   ~ 0
FPD6
Text Label 9750 -4550 2    50   ~ 0
FPD7
Wire Wire Line
	8050 -4350 7750 -4350
Wire Wire Line
	7750 -4250 8050 -4250
Wire Wire Line
	7600 -5250 8050 -5250
Wire Wire Line
	7600 -5150 8050 -5150
Wire Wire Line
	7600 -5050 8050 -5050
Wire Wire Line
	7600 -4950 8050 -4950
Wire Wire Line
	7600 -4850 8050 -4850
Wire Wire Line
	7600 -4750 8050 -4750
Wire Wire Line
	7600 -4650 8050 -4650
Wire Wire Line
	7600 -4550 8050 -4550
Text Label 7750 -4250 0    50   ~ 0
SCANEN
Text Label 7750 -4350 0    50   ~ 0
~RD
Text Label 7950 -5250 2    50   ~ 0
MCD0
Entry Bus Bus
	7400 -5600 7500 -5500
Entry Wire Line
	7600 -4550 7500 -4650
Entry Wire Line
	7600 -4650 7500 -4750
Entry Wire Line
	7600 -4750 7500 -4850
Entry Wire Line
	7600 -4850 7500 -4950
Entry Wire Line
	7600 -4950 7500 -5050
Entry Wire Line
	7600 -5050 7500 -5150
Entry Wire Line
	7600 -5150 7500 -5250
Entry Wire Line
	7600 -5250 7500 -5350
NoConn ~ 2350 1800
Wire Wire Line
	2400 1800 2350 1800
Text Label 1050 -2450 0    50   ~ 0
~CVOE
NoConn ~ 6950 -2650
NoConn ~ 6950 -2550
NoConn ~ 6950 -2450
Text Label 750  -4250 0    50   ~ 0
~FPHALT
Text Notes 5950 -5700 0    100  ~ 20
Address Latch
Text Label 7250 -5600 2    50   ~ 0
MCD[0..7]
Entry Bus Bus
	4650 -5500 4750 -5600
Wire Wire Line
	5400 -2250 5950 -2250
Text Label 7000 -3150 0    50   ~ 0
MCA0
Wire Wire Line
	6950 -2850 7300 -2850
Wire Wire Line
	6950 -2750 7300 -2750
NoConn ~ 6950 -2250
Text Label 5550 -2650 0    50   ~ 0
~SCANCLR
Wire Wire Line
	5900 -2850 5950 -2850
Wire Wire Line
	5900 -2950 5900 -2850
Wire Wire Line
	5950 -2950 5900 -2950
$Comp
L power:GND #PWR?
U 1 1 60796430
P 5950 -3150
AR Path="/60796430" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/60796430" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796430" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 5950 -3400 50  0001 C CNN
F 1 "GND" V 5955 -3278 50  0000 R CNN
F 2 "" H 5950 -3150 50  0001 C CNN
F 3 "" H 5950 -3150 50  0001 C CNN
	1    5950 -3150
	0    1    1    0   
$EndComp
Text Label 5500 -2250 0    50   ~ 0
~SCANEN
Text Label 7000 -2750 0    50   ~ 0
MCA4
Text Label 7000 -2850 0    50   ~ 0
MCA3
Text Label 7000 -2950 0    50   ~ 0
MCA2
Text Label 7000 -3050 0    50   ~ 0
MCA1
Wire Wire Line
	6950 -2950 7300 -2950
Wire Wire Line
	6950 -3050 7300 -3050
Wire Wire Line
	6950 -3150 7300 -3150
$Comp
L alexios:74HC590 U?
U 1 1 60796422
P 6450 -2650
AR Path="/60796422" Ref="U?"  Part="1" 
AR Path="/6233F88C/60796422" Ref="U?"  Part="1" 
AR Path="/60757845/60796422" Ref="U4"  Part="1" 
F 0 "U4" H 6450 -1883 50  0000 C CNN
F 1 "74HC590" H 6450 -1974 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6750 -2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 6750 -2300 50  0001 C CNN
	1    6450 -2650
	1    0    0    -1  
$EndComp
Text Notes 4850 -1725 0    50   ~ 0
(= ~LED-RUN)
Text Label 7400 -3950 1    50   ~ 0
MCA[0..7]
Entry Wire Line
	7300 -4550 7400 -4450
Entry Wire Line
	7300 -4650 7400 -4550
Entry Wire Line
	7300 -4750 7400 -4650
Entry Wire Line
	7300 -4850 7400 -4750
Entry Wire Line
	7300 -4950 7400 -4850
Entry Wire Line
	7300 -5050 7400 -4950
Entry Wire Line
	7300 -5150 7400 -5050
Entry Wire Line
	7300 -5250 7400 -5150
Text Label 3600 -4550 0    50   ~ 0
MCD7
Text Label 3600 -4650 0    50   ~ 0
MCD6
Text Label 3600 -4750 0    50   ~ 0
MCD5
Text Label 3600 -4850 0    50   ~ 0
MCD4
Text Label 3600 -4950 0    50   ~ 0
MCD3
Text Label 3600 -5050 0    50   ~ 0
MCD2
Text Label 3600 -5150 0    50   ~ 0
MCD1
Text Label 3600 -5250 0    50   ~ 0
MCD0
Text Label 4350 -4150 2    50   ~ 0
MFD1
Text Label 4350 -4250 2    50   ~ 0
MFD0
Text Label 1050 -2750 0    50   ~ 0
~IBOE
Text Label 1050 -2650 0    50   ~ 0
~ABOE
Text Label 1050 -2550 0    50   ~ 0
~DBOE
Text Label 1250 -1950 0    50   ~ 0
~CLR
Wire Wire Line
	1750 -1950 1200 -1950
Text Label 4350 -4350 2    50   ~ 0
~FPIRQ
Text Label 3900 -3050 2    50   ~ 0
~µCW
Text Label 3900 -2950 2    50   ~ 0
~µCR
Text Label 1050 -2850 0    50   ~ 0
CLRWS
Text Label 1250 -1850 0    50   ~ 0
SCK
Wire Wire Line
	1750 -1850 1250 -1850
$Comp
L alexios:74LVC1G04 U?
U 1 1 607961F4
P 5400 -3950
AR Path="/607961F4" Ref="U?"  Part="1" 
AR Path="/60757845/607961F4" Ref="U2"  Part="1" 
F 0 "U2" V 5550 -3850 50  0000 L CNN
F 1 "74LVC1G14" V 5450 -3850 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5400 -3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5400 -3950 50  0001 C CNN
	1    5400 -3950
	0    1    -1   0   
$EndComp
Text Label 1900 2100 0    50   ~ 0
ALE
Text Label 1200 2000 0    50   ~ 0
~RD
Text Label 1200 1900 0    50   ~ 0
~WR
Wire Wire Line
	2400 2000 1050 2000
Wire Wire Line
	2400 1900 1050 1900
Wire Wire Line
	2400 2100 1900 2100
$Comp
L Device:C_Small C?
U 1 1 6B347074
P 10150 6150
AR Path="/6B347074" Ref="C?"  Part="1" 
AR Path="/60757845/6B347074" Ref="C16"  Part="1" 
F 0 "C16" H 10059 6196 50  0000 R CNN
F 1 "100nF" H 10059 6105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 6150 50  0001 C CNN
F 3 "~" H 10150 6150 50  0001 C CNN
	1    10150 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B34707A
P 10150 6050
AR Path="/6B34707A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6B34707A" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 10150 5900 50  0001 C CNN
F 1 "+5V" H 10165 6223 50  0000 C CNN
F 2 "" H 10150 6050 50  0001 C CNN
F 3 "" H 10150 6050 50  0001 C CNN
	1    10150 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B347080
P 10150 6250
AR Path="/6B347080" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6B347080" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 10150 6000 50  0001 C CNN
F 1 "GND" H 10155 6077 50  0000 C CNN
F 2 "" H 10150 6250 50  0001 C CNN
F 3 "" H 10150 6250 50  0001 C CNN
	1    10150 6250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U?
U 2 1 6B36D31A
P 10500 6150
AR Path="/6B36D31A" Ref="U?"  Part="1" 
AR Path="/60757845/6B36D31A" Ref="U2"  Part="2" 
F 0 "U2" H 10680 6196 50  0000 L CNN
F 1 "74LVC1G14" H 10680 6105 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10500 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10500 6150 50  0001 C CNN
	2    10500 6150
	1    0    0    -1  
$EndComp
Connection ~ 10150 6250
Connection ~ 10150 6050
Text HLabel 1200 -1950 0    50   Output ~ 0
~CLR
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 623E1F29
P 4200 -2950
AR Path="/623E1F29" Ref="RN?"  Part="3" 
AR Path="/60757845/623E1F29" Ref="RN4"  Part="3" 
F 0 "RN4" H 4300 -2900 50  0001 L CNN
F 1 "30Ω" H 4175 -2844 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4200 -2870 50  0001 C CNN
F 3 "~" V 4200 -2950 50  0001 C CNN
	3    4200 -2950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 623E1F23
P 4200 -2850
AR Path="/623E1F23" Ref="RN?"  Part="2" 
AR Path="/60757845/623E1F23" Ref="RN4"  Part="2" 
F 0 "RN4" H 4300 -2800 50  0001 L CNN
F 1 "30Ω" H 4175 -2744 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4200 -2770 50  0001 C CNN
F 3 "~" V 4200 -2850 50  0001 C CNN
	2    4200 -2850
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 623E1F2F
P 4200 -3050
AR Path="/623E1F2F" Ref="RN?"  Part="4" 
AR Path="/60757845/623E1F2F" Ref="RN4"  Part="4" 
F 0 "RN4" H 4300 -3000 50  0001 L CNN
F 1 "30Ω" H 4175 -2944 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4200 -2970 50  0001 C CNN
F 3 "~" V 4200 -3050 50  0001 C CNN
	4    4200 -3050
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 623E1F1D
P 4200 -2750
AR Path="/623E1F1D" Ref="RN?"  Part="1" 
AR Path="/60757845/623E1F1D" Ref="RN4"  Part="1" 
F 0 "RN4" H 4300 -2850 50  0000 L CNN
F 1 "30Ω" H 3950 -2800 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4200 -2670 50  0001 C CNN
F 3 "~" V 4200 -2750 50  0001 C CNN
	1    4200 -2750
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 613FD65A
P 8650 -3450
AR Path="/613FD65A" Ref="RN?"  Part="4" 
AR Path="/60757845/613FD65A" Ref="RN7"  Part="4" 
F 0 "RN7" H 8750 -3400 50  0001 L CNN
F 1 "30Ω" H 8625 -3344 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8650 -3370 50  0001 C CNN
F 3 "~" V 8650 -3450 50  0001 C CNN
	4    8650 -3450
	0    1    -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 613FD654
P 8750 -3450
AR Path="/613FD654" Ref="RN?"  Part="3" 
AR Path="/60757845/613FD654" Ref="RN7"  Part="3" 
F 0 "RN7" H 8850 -3400 50  0001 L CNN
F 1 "30Ω" H 8725 -3344 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8750 -3370 50  0001 C CNN
F 3 "~" V 8750 -3450 50  0001 C CNN
	3    8750 -3450
	0    -1   -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 613FD64E
P 8850 -3450
AR Path="/613FD64E" Ref="RN?"  Part="2" 
AR Path="/60757845/613FD64E" Ref="RN7"  Part="2" 
F 0 "RN7" H 8950 -3400 50  0001 L CNN
F 1 "30Ω" H 8825 -3344 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8850 -3370 50  0001 C CNN
F 3 "~" V 8850 -3450 50  0001 C CNN
	2    8850 -3450
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 6C5C0C4C
P 1750 -1750
F 0 "TP1" V 1700 -1600 50  0000 L CNN
F 1 "TestPoint" V 1795 -1562 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1950 -1750 50  0001 C CNN
F 3 "~" H 1950 -1750 50  0001 C CNN
	1    1750 -1750
	0    -1   1    0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 63C465B7
P 1100 -1450
AR Path="/63C465B7" Ref="RN?"  Part="2" 
AR Path="/60757845/63C465B7" Ref="RN3"  Part="3" 
F 0 "RN3" H 1200 -1400 50  0001 L CNN
F 1 "30Ω" H 1075 -1344 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1100 -1370 50  0001 C CNN
F 3 "~" V 1100 -1450 50  0001 C CNN
	3    1100 -1450
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 63C465BD
P 1100 -1350
AR Path="/63C465BD" Ref="RN?"  Part="3" 
AR Path="/60757845/63C465BD" Ref="RN3"  Part="2" 
F 0 "RN3" H 1200 -1300 50  0001 L CNN
F 1 "30Ω" H 1075 -1244 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1100 -1270 50  0001 C CNN
F 3 "~" V 1100 -1350 50  0001 C CNN
	2    1100 -1350
	-1   0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 63C465C3
P 1100 -1250
AR Path="/63C465C3" Ref="RN?"  Part="4" 
AR Path="/60757845/63C465C3" Ref="RN3"  Part="1" 
F 0 "RN3" H 1200 -1200 50  0001 L CNN
F 1 "30Ω" H 1075 -1144 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1100 -1170 50  0001 C CNN
F 3 "~" V 1100 -1250 50  0001 C CNN
	1    1100 -1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	5300 -2650 5950 -2650
Text HLabel 5300 -2650 0    50   Input ~ 0
~SCANCLR
Text HLabel 4400 -4150 2    50   Output ~ 0
MFD1
$Comp
L alexios:Arduino-Mega-2560 J8
U 1 1 6158B038
P 2650 -2950
F 0 "J8" H 2650 -311 60  0000 C CNN
F 1 "Arduino-Mega-2560" H 2650 -417 60  0000 C CNN
F 2 "alexios:Arduino-Mega-2560-Mezzanine-Upside-Down" H 3325 -200 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-mega-2560-rev3" H 3325 -200 60  0001 C CNN
	1    2650 -2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 -5250 1700 -5250
Wire Wire Line
	1750 -5050 1700 -5050
Wire Wire Line
	1750 -4950 1700 -4950
$Comp
L power:+12V #PWR0160
U 1 1 61657A32
P 1700 -5300
F 0 "#PWR0160" H 1700 -5450 50  0001 C CNN
F 1 "+12V" H 1715 -5127 50  0000 C CNN
F 2 "" H 1700 -5300 50  0001 C CNN
F 3 "" H 1700 -5300 50  0001 C CNN
	1    1700 -5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 -5300 1700 -5250
NoConn ~ 1750 -5150
Wire Wire Line
	1700 -5050 1700 -4950
NoConn ~ 1750 -4750
$Comp
L power:GND #PWR0161
U 1 1 6172919D
P 1350 -4650
F 0 "#PWR0161" H 1350 -4900 50  0001 C CNN
F 1 "GND" H 1200 -4700 50  0000 C CNN
F 2 "" H 1350 -4650 50  0001 C CNN
F 3 "" H 1350 -4650 50  0001 C CNN
	1    1350 -4650
	1    0    0    -1  
$EndComp
Text Label 5700 -4350 0    50   ~ 0
ALE
Text Label 5700 -4250 0    50   ~ 0
SCANEN
Text Label 5900 -4550 2    50   ~ 0
MCD7
Text Label 5900 -4650 2    50   ~ 0
MCD6
Text Label 5900 -4750 2    50   ~ 0
MCD5
Text Label 5900 -4850 2    50   ~ 0
MCD4
Text Label 5900 -4950 2    50   ~ 0
MCD3
Text Label 5900 -5050 2    50   ~ 0
MCD2
Text Label 5900 -5150 2    50   ~ 0
MCD1
Text Label 5900 -5250 2    50   ~ 0
MCD0
Entry Wire Line
	4750 -4550 4650 -4650
Entry Wire Line
	4750 -4650 4650 -4750
Entry Wire Line
	4750 -4750 4650 -4850
Entry Wire Line
	4750 -4850 4650 -4950
Entry Wire Line
	4750 -4950 4650 -5050
Entry Wire Line
	4750 -5050 4650 -5150
Entry Wire Line
	4750 -5150 4650 -5250
Entry Wire Line
	4750 -5250 4650 -5350
Wire Wire Line
	6950 -5250 7300 -5250
Text Label 7300 -5250 2    50   ~ 0
MCA0
Text Label 7300 -5150 2    50   ~ 0
MCA1
Text Label 7300 -5050 2    50   ~ 0
MCA2
Text Label 7300 -4950 2    50   ~ 0
MCA3
Text Label 7300 -4850 2    50   ~ 0
MCA4
Text Label 7300 -4750 2    50   ~ 0
MCA5
Text Label 7300 -4650 2    50   ~ 0
MCA6
Text Label 7300 -4550 2    50   ~ 0
MCA7
Wire Wire Line
	6950 -5150 7300 -5150
Wire Wire Line
	6950 -5050 7300 -5050
Wire Wire Line
	6950 -4950 7300 -4950
Wire Wire Line
	6950 -4850 7300 -4850
Wire Wire Line
	6950 -4750 7300 -4750
Wire Wire Line
	6950 -4650 7300 -4650
Wire Wire Line
	6950 -4550 7300 -4550
$Comp
L alexios:74AC573 U?
U 1 1 6079616A
P 6450 -4750
AR Path="/6079616A" Ref="U?"  Part="1" 
AR Path="/60757845/6079616A" Ref="U3"  Part="1" 
F 0 "U3" H 6450 -3983 50  0000 C CNN
F 1 "74AC573" H 6450 -4074 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6450 -4750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 6450 -4750 50  0001 C CNN
F 4 "Yes" H 1150 -6500 50  0001 C CNN "Verified"
	1    6450 -4750
	1    0    0    -1  
$EndComp
Wire Bus Line
	4750 -5600 7400 -5600
Wire Bus Line
	10000 -5600 10450 -5600
Text Notes 8000 -5700 0    100  ~ 20
Data Bus Buffer
Wire Wire Line
	1750 -3050 950  -3050
Wire Wire Line
	1750 -3150 950  -3150
Wire Wire Line
	1750 -3250 950  -3250
Wire Wire Line
	1750 -3350 950  -3350
Wire Wire Line
	1550 -3450 1750 -3450
Wire Wire Line
	1550 -3550 1750 -3550
Wire Wire Line
	1550 -3650 1750 -3650
Wire Wire Line
	1550 -3750 1750 -3750
Wire Wire Line
	950  -3450 1300 -3450
Wire Wire Line
	950  -3550 1300 -3550
Wire Wire Line
	950  -3650 1300 -3650
Wire Wire Line
	950  -3750 1300 -3750
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 620F2126
P 1450 -3450
AR Path="/620F2126" Ref="RN?"  Part="4" 
AR Path="/60757845/620F2126" Ref="RN1"  Part="1" 
F 0 "RN1" H 1550 -3400 50  0001 L CNN
F 1 "30Ω" H 1425 -3344 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1450 -3370 50  0001 C CNN
F 3 "~" V 1450 -3450 50  0001 C CNN
	1    1450 -3450
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 620F2120
P 1450 -3550
AR Path="/620F2120" Ref="RN?"  Part="3" 
AR Path="/60757845/620F2120" Ref="RN1"  Part="2" 
F 0 "RN1" H 1550 -3500 50  0001 L CNN
F 1 "30Ω" H 1425 -3444 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1450 -3470 50  0001 C CNN
F 3 "~" V 1450 -3550 50  0001 C CNN
	2    1450 -3550
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 620F211A
P 1450 -3650
AR Path="/620F211A" Ref="RN?"  Part="2" 
AR Path="/60757845/620F211A" Ref="RN1"  Part="3" 
F 0 "RN1" H 1550 -3600 50  0001 L CNN
F 1 "30Ω" H 1425 -3544 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1450 -3570 50  0001 C CNN
F 3 "~" V 1450 -3650 50  0001 C CNN
	3    1450 -3650
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 620F2114
P 1450 -3750
AR Path="/620F2114" Ref="RN?"  Part="1" 
AR Path="/60757845/620F2114" Ref="RN1"  Part="4" 
F 0 "RN1" H 1350 -3650 50  0000 L CNN
F 1 "30Ω" H 1650 -4100 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1450 -3670 50  0001 C CNN
F 3 "~" V 1450 -3750 50  0001 C CNN
	4    1450 -3750
	1    0    0    -1  
$EndComp
Text Notes 1000 -2950 0    50   ~ 0
µCU pulls up SWD
Text Label 1050 -3050 0    50   ~ 0
SWD3
Text Label 1050 -3150 0    50   ~ 0
SWD2
Text Label 1050 -3250 0    50   ~ 0
SWD1
Text Label 1050 -3350 0    50   ~ 0
SWD0
Text Label 1050 -3450 0    50   ~ 0
SWA3
Text Label 1050 -3550 0    50   ~ 0
SWA2
Text Label 1050 -3650 0    50   ~ 0
SWA1
Text Label 1050 -3750 0    50   ~ 0
SWA0
Text Label 3900 -2550 2    50   ~ 0
~IOINT
Wire Wire Line
	3550 -2550 4350 -2550
Wire Wire Line
	3550 -3350 4400 -3350
Text HLabel 4400 -3350 2    50   Output ~ 0
~PANELEN
Wire Wire Line
	3550 -3450 4150 -3450
Text HLabel 4400 -3950 2    50   Output ~ 0
~LED-STOP
Text Label 4250 -3950 2    50   ~ 0
~LED-STOP
Wire Wire Line
	3550 -1650 4350 -1650
Text HLabel 4350 -1650 2    50   Output ~ 0
~µSTEP
Wire Wire Line
	3550 -1750 4350 -1750
Text HLabel 4350 -1750 2    50   Output ~ 0
STEP∕~RUN
Wire Wire Line
	3550 -2450 4350 -2450
Text HLabel 4350 -2450 2    50   Input ~ 0
~WAIT
Text HLabel 4350 -2550 2    50   Input ~ 0
~IOINT
Text Label 4150 -3350 2    50   ~ 0
~PANELEN
Text Label 3900 -2450 2    50   ~ 0
~WAIT
Text Label 3650 -1650 0    50   ~ 0
~µSTEP
Text Label 3650 -1750 0    50   ~ 0
STEP∕~RUN
Text Label 4150 -3450 2    50   ~ 0
~SCANEN
NoConn ~ 3550 -1950
NoConn ~ 3550 -1850
Text Notes 3650 -1900 0    50   ~ 0
USART0 used for\nprogramming
$Comp
L Device:R_Small R?
U 1 1 6274D6EC
P 3750 -4050
AR Path="/6274D6EC" Ref="R?"  Part="1" 
AR Path="/60757845/6274D6EC" Ref="R3"  Part="1" 
F 0 "R3" V 3800 -3900 50  0000 C CNN
F 1 "30Ω" V 3800 -4250 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 -4050 50  0001 C CNN
F 3 "~" H 3750 -4050 50  0001 C CNN
	1    3750 -4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3850 -4050 4400 -4050
Text HLabel 4400 -4050 2    50   Output ~ 0
~LTSON
Text HLabel 4350 -1250 2    50   Output ~ 0
~RD
Text HLabel 4350 -1350 2    50   Output ~ 0
~WR
Text Label 4200 -1250 2    50   ~ 0
~RD
Text Label 4200 -1350 2    50   ~ 0
~WR
Wire Wire Line
	3550 -1250 4350 -1250
Wire Wire Line
	3550 -1350 4350 -1350
Wire Wire Line
	5700 -4350 5950 -4350
Wire Wire Line
	3550 -2350 4350 -2350
Wire Wire Line
	3550 -2250 4350 -2250
Text HLabel 4350 -2350 2    50   Input ~ 0
RXD
Text HLabel 4350 -2250 2    50   Output ~ 0
TXD
Wire Wire Line
	3550 -4050 3650 -4050
Text HLabel 950  -3750 0    50   Output ~ 0
SWA0
Text HLabel 950  -3650 0    50   Output ~ 0
SWA1
Text HLabel 950  -3550 0    50   Output ~ 0
SWA2
Text HLabel 950  -3450 0    50   Output ~ 0
SWA3
Text HLabel 950  -3350 0    50   Input ~ 0
SWD0
Text HLabel 950  -3250 0    50   Input ~ 0
SWD1
Text HLabel 950  -3150 0    50   Input ~ 0
SWD2
Text HLabel 950  -3050 0    50   Input ~ 0
SWD3
Wire Wire Line
	3550 -3950 4400 -3950
NoConn ~ 3550 -1550
NoConn ~ 3550 -850
NoConn ~ 3550 -750
NoConn ~ 3550 -1050
NoConn ~ 3550 -1150
$Comp
L Device:R_Small R?
U 1 1 6216E2A2
P 3750 -4350
AR Path="/6216E2A2" Ref="R?"  Part="1" 
AR Path="/60757845/6216E2A2" Ref="R37"  Part="1" 
F 0 "R37" V 3850 -4300 50  0000 C CNN
F 1 "30Ω" V 3800 -4550 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 -4350 50  0001 C CNN
F 3 "~" H 3750 -4350 50  0001 C CNN
	1    3750 -4350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6265D34E
P 1400 -4150
AR Path="/6265D34E" Ref="R?"  Part="1" 
AR Path="/60757845/6265D34E" Ref="R39"  Part="1" 
F 0 "R39" V 1450 -4000 50  0000 C CNN
F 1 "30Ω" V 1450 -4350 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 -4150 50  0001 C CNN
F 3 "~" H 1400 -4150 50  0001 C CNN
	1    1400 -4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 -4250 1750 -4250
$Comp
L Device:R_Small R?
U 1 1 626D97D3
P 1400 -4250
AR Path="/626D97D3" Ref="R?"  Part="1" 
AR Path="/60757845/626D97D3" Ref="R38"  Part="1" 
F 0 "R38" V 1450 -4100 50  0000 C CNN
F 1 "30Ω" V 1450 -4450 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 -4250 50  0001 C CNN
F 3 "~" H 1400 -4250 50  0001 C CNN
	1    1400 -4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 -4150 1750 -4150
Wire Wire Line
	1300 -4150 400  -4150
$Comp
L Device:R_Small R?
U 1 1 6285AE62
P 1400 -3950
AR Path="/6285AE62" Ref="R?"  Part="1" 
AR Path="/60757845/6285AE62" Ref="R41"  Part="1" 
F 0 "R41" V 1450 -3800 50  0000 C CNN
F 1 "30Ω" V 1450 -4150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 -3950 50  0001 C CNN
F 3 "~" H 1400 -3950 50  0001 C CNN
	1    1400 -3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6285AE68
P 1400 -4050
AR Path="/6285AE68" Ref="R?"  Part="1" 
AR Path="/60757845/6285AE68" Ref="R40"  Part="1" 
F 0 "R40" V 1450 -3900 50  0000 C CNN
F 1 "30Ω" V 1450 -4250 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 -4050 50  0001 C CNN
F 3 "~" H 1400 -4050 50  0001 C CNN
	1    1400 -4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	400  -4050 1300 -4050
Wire Wire Line
	1500 -4050 1750 -4050
Wire Wire Line
	400  -3950 1300 -3950
Wire Wire Line
	1500 -3950 1750 -3950
Wire Wire Line
	4750 -5250 5950 -5250
Wire Wire Line
	4750 -5150 5950 -5150
Wire Wire Line
	4750 -5050 5950 -5050
Wire Wire Line
	4750 -4950 5950 -4950
Wire Wire Line
	4750 -4850 5950 -4850
Wire Wire Line
	4750 -4750 5950 -4750
Wire Wire Line
	4750 -4650 5950 -4650
Wire Wire Line
	4750 -4550 5950 -4550
Wire Wire Line
	5400 -4250 5400 -4150
Wire Wire Line
	5400 -4250 5950 -4250
NoConn ~ 3550 -3850
NoConn ~ 3550 -3750
NoConn ~ 3550 -3650
NoConn ~ 3550 -3250
NoConn ~ 3550 -3150
NoConn ~ 3550 -2150
Wire Wire Line
	5900 -2850 5900 -1550
$Comp
L power:+5V #PWR?
U 1 1 601CE92A
P 7100 -1750
AR Path="/601CE92A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE92A" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 7100 -1900 50  0001 C CNN
F 1 "+5V" H 7115 -1577 50  0000 C CNN
F 2 "" H 7100 -1750 50  0001 C CNN
F 3 "" H 7100 -1750 50  0001 C CNN
	1    7100 -1750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 62FDCC3F
P 4450 6500
AR Path="/62FDCC3F" Ref="R?"  Part="1" 
AR Path="/60757845/62FDCC3F" Ref="R1"  Part="1" 
F 0 "R1" V 4554 6500 50  0000 C CNN
F 1 "30Ω" V 4645 6500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4450 6500 50  0001 C CNN
F 3 "~" H 4450 6500 50  0001 C CNN
	1    4450 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 6500 4800 6500
Wire Wire Line
	4800 6150 4800 6500
Wire Wire Line
	3550 6150 4350 6150
$Comp
L Device:CP_Small C?
U 1 1 632C8EE9
P 1350 -5150
AR Path="/632C8EE9" Ref="C?"  Part="1" 
AR Path="/5D34E810/632C8EE9" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/632C8EE9" Ref="C?"  Part="1" 
AR Path="/60757845/632C8EE9" Ref="C22"  Part="1" 
F 0 "C22" H 1262 -5104 50  0000 R CNN
F 1 "47µF" H 1262 -5195 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 1350 -5150 50  0001 C CNN
F 3 "~" H 1350 -5150 50  0001 C CNN
	1    1350 -5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 632C8EEF
P 1350 -5000
AR Path="/5F67D4B5/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/632C8EEF" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 1350 -5250 50  0001 C CNN
F 1 "GND" H 1272 -5037 50  0000 R CNN
F 2 "" H 1350 -5000 50  0001 C CNN
F 3 "" H 1350 -5000 50  0001 C CNN
	1    1350 -5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 -5300 1350 -5250
Wire Wire Line
	1350 -5050 1350 -5000
$Comp
L power:+12V #PWR0162
U 1 1 632E50B5
P 1350 -5300
F 0 "#PWR0162" H 1350 -5450 50  0001 C CNN
F 1 "+12V" H 1365 -5127 50  0000 C CNN
F 2 "" H 1350 -5300 50  0001 C CNN
F 3 "" H 1350 -5300 50  0001 C CNN
	1    1350 -5300
	1    0    0    -1  
$EndComp
Wire Bus Line
	7500 -5500 7500 -4650
Wire Bus Line
	9900 -5500 9900 -4650
Wire Bus Line
	9900 -3400 9900 -2550
Wire Bus Line
	4650 -5500 4650 -4650
Wire Bus Line
	7400 -5150 7400 -2550
$EndSCHEMATC
