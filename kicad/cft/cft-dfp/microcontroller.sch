EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 15
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
$Comp
L power:+5V #PWR?
U 1 1 60796633
P 4750 1750
AR Path="/60796633" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796633" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 4750 1600 50  0001 C CNN
F 1 "+5V" H 4765 1923 50  0000 C CNN
F 2 "" H 4750 1750 50  0001 C CNN
F 3 "" H 4750 1750 50  0001 C CNN
	1    4750 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1750 5000 1750
Connection ~ 4750 1750
Connection ~ 5250 2050
Wire Wire Line
	5250 2050 5250 2100
Wire Wire Line
	4750 2050 5000 2050
Wire Wire Line
	5000 2050 5250 2050
Connection ~ 5000 2050
Wire Wire Line
	5000 1750 5250 1750
Connection ~ 5000 1750
Wire Wire Line
	5250 1750 5250 1800
Wire Wire Line
	5250 2050 5250 2000
$Comp
L Device:C_Small C?
U 1 1 60796664
P 5250 1900
AR Path="/60796664" Ref="C?"  Part="1" 
AR Path="/60757845/60796664" Ref="C10"  Part="1" 
F 0 "C10" H 5250 2250 50  0000 C CNN
F 1 "100nF" H 5300 2150 50  0000 C CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 1900 50  0001 C CNN
F 3 "~" H 5250 1900 50  0001 C CNN
	1    5250 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6079662D
P 5000 1900
AR Path="/6079662D" Ref="C?"  Part="1" 
AR Path="/60757845/6079662D" Ref="C9"  Part="1" 
F 0 "C9" H 5000 2250 50  0000 C CNN
F 1 "100nF" H 5000 2150 50  0000 C CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 1900 50  0001 C CNN
F 3 "~" H 5000 1900 50  0001 C CNN
	1    5000 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1800 4750 1750
Wire Wire Line
	4750 2000 4750 2050
$Comp
L Device:C_Small C?
U 1 1 60796625
P 4750 1900
AR Path="/60796625" Ref="C?"  Part="1" 
AR Path="/60757845/60796625" Ref="C8"  Part="1" 
F 0 "C8" H 4659 1946 50  0000 R CNN
F 1 "1µF" H 4659 1855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 1900 50  0001 C CNN
F 3 "~" H 4750 1900 50  0001 C CNN
	1    4750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1800 5000 1750
Wire Wire Line
	5000 2000 5000 2050
$Comp
L power:GND #PWR?
U 1 1 6079661D
P 5250 2100
AR Path="/6079661D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079661D" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 5250 1850 50  0001 C CNN
F 1 "GND" H 5255 1927 50  0000 C CNN
F 2 "" H 5250 2100 50  0001 C CNN
F 3 "" H 5250 2100 50  0001 C CNN
	1    5250 2100
	1    0    0    -1  
$EndComp
Entry Bus Bus
	4550 1250 4450 1350
Wire Bus Line
	5500 1250 4550 1250
Entry Bus Bus
	5500 1250 5600 1350
Entry Wire Line
	4350 1600 4450 1500
Entry Wire Line
	4350 1700 4450 1600
Entry Wire Line
	4350 1800 4450 1700
Entry Wire Line
	4350 1900 4450 1800
Entry Wire Line
	4350 2000 4450 1900
Entry Wire Line
	4350 2100 4450 2000
Entry Wire Line
	4350 2200 4450 2100
Entry Wire Line
	4350 2300 4450 2200
Wire Wire Line
	3900 1600 4350 1600
Wire Wire Line
	3900 1700 4350 1700
Wire Wire Line
	3900 1800 4350 1800
Wire Wire Line
	3900 1900 4350 1900
Wire Wire Line
	3900 2000 4350 2000
Wire Wire Line
	3900 2100 4350 2100
Wire Wire Line
	3900 2200 4350 2200
Wire Wire Line
	3900 2300 4350 2300
Text Label 5600 1600 3    50   ~ 0
MCD[0..7]
Text Notes 3800 1100 0    100  ~ 20
DFP Microcontroller
Wire Wire Line
	9550 3200 9550 3250
Connection ~ 9250 3250
Connection ~ 9150 3250
Wire Wire Line
	9150 3250 9250 3250
Wire Wire Line
	8850 3700 8400 3700
Connection ~ 8850 3700
Wire Wire Line
	8850 3550 8850 3700
Wire Wire Line
	8950 3800 8400 3800
Connection ~ 8950 3800
Wire Wire Line
	8950 3550 8950 3800
Wire Wire Line
	9050 3900 8400 3900
Connection ~ 9050 3900
Wire Wire Line
	9050 3550 9050 3900
Wire Wire Line
	9150 4000 8400 4000
Connection ~ 9150 4000
Wire Wire Line
	9150 3550 9150 4000
Wire Wire Line
	9150 3300 9150 3250
Wire Wire Line
	9050 3250 9150 3250
Connection ~ 9050 3250
Wire Wire Line
	9050 3300 9050 3250
Wire Wire Line
	8950 3250 9050 3250
Connection ~ 8950 3250
Wire Wire Line
	8950 3300 8950 3250
Wire Wire Line
	8850 3250 8950 3250
Wire Wire Line
	8850 3300 8850 3250
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 613FD660
P 9150 3400
AR Path="/613FD660" Ref="RN?"  Part="1" 
AR Path="/60757845/613FD660" Ref="RN7"  Part="1" 
F 0 "RN7" V 9200 3800 50  0000 L CNN
F 1 "30Ω" V 9100 3800 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9150 3480 50  0001 C CNN
F 3 "~" V 9150 3400 50  0001 C CNN
	1    9150 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9250 4100 8400 4100
Connection ~ 9250 4100
Wire Wire Line
	9250 3550 9250 4100
Text Label 4000 2900 0    50   ~ 0
~µCRAM
Wire Wire Line
	3900 2800 4450 2800
Wire Wire Line
	4450 2650 4700 2650
Wire Wire Line
	4450 2800 4450 2650
Text Label 4500 4300 2    50   ~ 0
~IOINT
Wire Wire Line
	3900 4300 4700 4300
Wire Wire Line
	3900 4700 4700 4700
Text HLabel 4700 4500 2    50   Output ~ 0
~LTSON
Text HLabel 4700 4700 2    50   Output ~ 0
~PANELEN
Wire Wire Line
	3900 4600 5600 4600
$Comp
L power:GND #PWR013
U 1 1 6085DCB4
P 5200 2650
F 0 "#PWR013" H 5200 2400 50  0001 C CNN
F 1 "GND" H 5350 2600 50  0000 C CNN
F 2 "" H 5200 2650 50  0001 C CNN
F 3 "" H 5200 2650 50  0001 C CNN
	1    5200 2650
	1    0    0    -1  
$EndComp
Text Label 4400 2800 2    50   ~ 0
ACT-LED
$Comp
L Device:R_Small R?
U 1 1 608B26E9
P 4800 2650
AR Path="/608B26E9" Ref="R?"  Part="1" 
AR Path="/64C48268/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/608B26E9" Ref="R?"  Part="1" 
AR Path="/60A2F394/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/608B26E9" Ref="R6"  Part="1" 
F 0 "R6" V 4996 2650 50  0000 C CNN
F 1 "680Ω" V 4905 2650 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4800 2650 50  0001 C CNN
F 3 "~" H 4800 2650 50  0001 C CNN
	1    4800 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3550 6450 4800 6450
Wire Wire Line
	5600 3200 5600 4600
$Comp
L Device:LED_ALT D?
U 1 1 604918F8
P 5050 2650
AR Path="/604918F8" Ref="D?"  Part="1" 
AR Path="/64C48268/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/604918F8" Ref="D?"  Part="1" 
AR Path="/60A2F394/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/604918F8" Ref="D4"  Part="1" 
F 0 "D4" H 5043 2487 50  0000 C CNN
F 1 "LED_ALT" H 5043 2486 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5050 2650 50  0001 C CNN
F 3 "~" H 5050 2650 50  0001 C CNN
	1    5050 2650
	-1   0    0    1   
$EndComp
Text Label 1200 2300 0    50   ~ 0
~LCKLKEN
Text HLabel 1050 2300 0    50   Output ~ 0
~LCLKEN
Wire Wire Line
	2400 2300 1050 2300
Text Notes 6100 3300 0    100  ~ 20
Front Panel\nScanner Counter
Text Notes 8000 3050 0    100  ~ 20
Address Bus
Text Notes 8250 1150 0    100  ~ 20
Data Bus Buffer
Connection ~ 5600 4600
Wire Wire Line
	6100 4000 6100 5350
Connection ~ 6100 4000
Wire Wire Line
	6100 5350 6250 5350
Text Label 6100 5150 1    50   ~ 0
SCANCLK
Wire Wire Line
	7150 5500 7050 5500
Connection ~ 7150 5500
Wire Wire Line
	7150 5450 7150 5500
Wire Wire Line
	7350 5500 7350 5550
Connection ~ 7350 5500
Wire Wire Line
	7350 5500 7150 5500
Wire Wire Line
	7350 5450 7350 5500
Wire Wire Line
	6200 5200 6200 5150
Wire Wire Line
	6250 5200 6200 5200
$Comp
L power:+5V #PWR?
U 1 1 601CE94F
P 6200 5150
AR Path="/601CE94F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE94F" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 6200 5000 50  0001 C CNN
F 1 "+5V" H 6215 5323 50  0000 C CNN
F 2 "" H 6200 5150 50  0001 C CNN
F 3 "" H 6200 5150 50  0001 C CNN
	1    6200 5150
	-1   0    0    -1  
$EndComp
$Comp
L alexios:CXO_DIP8 X?
U 1 1 601CE949
P 6750 5300
AR Path="/601CE949" Ref="X?"  Part="1" 
AR Path="/60757845/601CE949" Ref="X2"  Part="1" 
F 0 "X2" H 6850 5667 50  0000 C CNN
F 1 "33 MHz?" H 6850 5576 50  0000 C CNN
F 2 "alexios:Oscillator_DIP-8-socket" H 6900 4900 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 6850 5250 50  0001 C CNN
	1    6750 5300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7350 5200 7150 5200
Connection ~ 7350 5200
Wire Wire Line
	7350 5200 7350 5250
$Comp
L Device:C_Small C?
U 1 1 601CE940
P 7350 5350
AR Path="/601CE940" Ref="C?"  Part="1" 
AR Path="/60757845/601CE940" Ref="C12"  Part="1" 
F 0 "C12" H 7250 5600 50  0000 R CNN
F 1 "1µF" H 7250 5350 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7350 5350 50  0001 C CNN
F 3 "~" H 7350 5350 50  0001 C CNN
	1    7350 5350
	-1   0    0    -1  
$EndComp
Connection ~ 7150 5200
Wire Wire Line
	7150 5250 7150 5200
Wire Wire Line
	7350 5200 7350 5150
Wire Wire Line
	7050 5200 7150 5200
$Comp
L power:GND #PWR?
U 1 1 601CE936
P 7350 5550
AR Path="/601CE936" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE936" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 7350 5300 50  0001 C CNN
F 1 "GND" H 7355 5377 50  0000 C CNN
F 2 "" H 7350 5550 50  0001 C CNN
F 3 "" H 7350 5550 50  0001 C CNN
	1    7350 5550
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 601CE930
P 7150 5350
AR Path="/601CE930" Ref="C?"  Part="1" 
AR Path="/60757845/601CE930" Ref="C11"  Part="1" 
F 0 "C11" H 7200 5600 50  0000 R CNN
F 1 "100nF" H 7300 5100 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 5350 50  0001 C CNN
F 3 "~" H 7150 5350 50  0001 C CNN
	1    7150 5350
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 601CE92A
P 7350 5150
AR Path="/601CE92A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE92A" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 7350 5000 50  0001 C CNN
F 1 "+5V" H 7365 5323 50  0000 C CNN
F 2 "" H 7350 5150 50  0001 C CNN
F 3 "" H 7350 5150 50  0001 C CNN
	1    7350 5150
	-1   0    0    -1  
$EndComp
Text Notes 6850 4900 0    50   ~ 0
Socket X2 and try frequencies that aren't harmonics of the CPU clock, 4 MHz to avoid\nstrobe effects on the front panel lights. The panel will update at 1/21 the crystal frequency.
$Comp
L power:+5V #PWR024
U 1 1 60145FEC
P 9550 3200
F 0 "#PWR024" H 9550 3050 50  0001 C CNN
F 1 "+5V" H 9650 3300 50  0000 C CNN
F 2 "" H 9550 3200 50  0001 C CNN
F 3 "" H 9550 3200 50  0001 C CNN
	1    9550 3200
	1    0    0    -1  
$EndComp
Connection ~ 9550 3250
Wire Wire Line
	9550 3300 9550 3250
Wire Wire Line
	9450 3250 9550 3250
Connection ~ 9450 3250
Wire Wire Line
	9450 3300 9450 3250
Wire Wire Line
	9350 3250 9450 3250
Connection ~ 9350 3250
Wire Wire Line
	9350 3300 9350 3250
Wire Wire Line
	9250 3250 9350 3250
Wire Wire Line
	9250 3300 9250 3250
Wire Wire Line
	9550 4400 8400 4400
Connection ~ 9550 4400
Wire Wire Line
	9550 3550 9550 4400
Wire Wire Line
	9450 4300 8400 4300
Connection ~ 9450 4300
Wire Wire Line
	9450 3550 9450 4300
Wire Wire Line
	9350 4200 8400 4200
Connection ~ 9350 4200
Wire Wire Line
	9350 3550 9350 4200
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 615F27AA
P 9250 3400
AR Path="/615F27AA" Ref="RN?"  Part="1" 
AR Path="/60757845/615F27AA" Ref="RN8"  Part="1" 
F 0 "RN8" V 9300 3000 50  0000 R CNN
F 1 "30Ω" V 9200 3000 50  0000 R CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9250 3480 50  0001 C CNN
F 3 "~" V 9250 3400 50  0001 C CNN
	1    9250 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10000 3700 8850 3700
Wire Wire Line
	10000 3800 8950 3800
Wire Wire Line
	10000 3900 9050 3900
Wire Wire Line
	10000 4000 9150 4000
Wire Wire Line
	10000 4100 9250 4100
Wire Wire Line
	10000 4200 9350 4200
Wire Wire Line
	10000 4300 9450 4300
Wire Wire Line
	10000 4400 9550 4400
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610F1C6F
P 8300 4400
AR Path="/610F1C6F" Ref="RN?"  Part="1" 
AR Path="/60757845/610F1C6F" Ref="RN6"  Part="1" 
F 0 "RN6" H 8400 4450 50  0001 L CNN
F 1 "30Ω" H 8500 4000 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8300 4480 50  0001 C CNN
F 3 "~" V 8300 4400 50  0001 C CNN
	1    8300 4400
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610F1C75
P 8300 4000
AR Path="/610F1C75" Ref="RN?"  Part="1" 
AR Path="/60757845/610F1C75" Ref="RN5"  Part="1" 
F 0 "RN5" H 8150 3600 50  0000 L CNN
F 1 "30Ω" H 8450 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8300 4080 50  0001 C CNN
F 3 "~" V 8300 4000 50  0001 C CNN
	1    8300 4000
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610F1C7B
P 8300 3900
AR Path="/610F1C7B" Ref="RN?"  Part="2" 
AR Path="/60757845/610F1C7B" Ref="RN5"  Part="2" 
F 0 "RN5" H 8400 3950 50  0001 L CNN
F 1 "30Ω" H 8275 4006 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8300 3980 50  0001 C CNN
F 3 "~" V 8300 3900 50  0001 C CNN
	2    8300 3900
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610F1C81
P 8300 3800
AR Path="/610F1C81" Ref="RN?"  Part="3" 
AR Path="/60757845/610F1C81" Ref="RN5"  Part="3" 
F 0 "RN5" H 8400 3850 50  0001 L CNN
F 1 "30Ω" H 8275 3906 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8300 3880 50  0001 C CNN
F 3 "~" V 8300 3800 50  0001 C CNN
	3    8300 3800
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610F1C87
P 8300 3700
AR Path="/610F1C87" Ref="RN?"  Part="4" 
AR Path="/60757845/610F1C87" Ref="RN5"  Part="4" 
F 0 "RN5" H 8400 3750 50  0001 L CNN
F 1 "30Ω" H 8275 3806 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8300 3780 50  0001 C CNN
F 3 "~" V 8300 3700 50  0001 C CNN
	4    8300 3700
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610F1C8D
P 8300 4300
AR Path="/610F1C8D" Ref="RN?"  Part="2" 
AR Path="/60757845/610F1C8D" Ref="RN6"  Part="2" 
F 0 "RN6" H 8400 4350 50  0001 L CNN
F 1 "30Ω" H 8275 4406 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8300 4380 50  0001 C CNN
F 3 "~" V 8300 4300 50  0001 C CNN
	2    8300 4300
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610F1C93
P 8300 4200
AR Path="/610F1C93" Ref="RN?"  Part="3" 
AR Path="/60757845/610F1C93" Ref="RN6"  Part="3" 
F 0 "RN6" H 8400 4250 50  0001 L CNN
F 1 "30Ω" H 8275 4306 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8300 4280 50  0001 C CNN
F 3 "~" V 8300 4200 50  0001 C CNN
	3    8300 4200
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610F1C99
P 8300 4100
AR Path="/610F1C99" Ref="RN?"  Part="4" 
AR Path="/60757845/610F1C99" Ref="RN6"  Part="4" 
F 0 "RN6" H 8150 4500 50  0000 L CNN
F 1 "30Ω" H 8500 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8300 4180 50  0001 C CNN
F 3 "~" V 8300 4100 50  0001 C CNN
	4    8300 4100
	1    0    0    1   
$EndComp
Entry Wire Line
	10000 3700 10100 3600
Entry Wire Line
	10000 3800 10100 3700
Entry Wire Line
	10000 3900 10100 3800
Entry Wire Line
	10000 4000 10100 3900
Entry Wire Line
	10000 4100 10100 4000
Entry Wire Line
	10000 4200 10100 4100
Entry Wire Line
	10000 4300 10100 4200
Entry Wire Line
	10000 4400 10100 4300
Entry Bus Bus
	10200 3350 10100 3450
Wire Bus Line
	10650 3350 10200 3350
Text Label 10250 3350 0    50   ~ 0
FPA[0..7]
Text HLabel 10650 3350 2    50   BiDi ~ 0
FPA[0..7]
Text Label 9750 3700 0    50   ~ 0
FPA0
Text Label 9750 3800 0    50   ~ 0
FPA1
Text Label 9750 3900 0    50   ~ 0
FPA2
Text Label 9750 4000 0    50   ~ 0
FPA3
Text Label 9750 4100 0    50   ~ 0
FPA4
Text Label 9750 4200 0    50   ~ 0
FPA5
Text Label 9750 4300 0    50   ~ 0
FPA6
Text Label 9750 4400 0    50   ~ 0
FPA7
Entry Wire Line
	7700 3700 7600 3600
Entry Wire Line
	7700 3800 7600 3700
Entry Wire Line
	7700 3900 7600 3800
Entry Wire Line
	7700 4000 7600 3900
Entry Wire Line
	7700 4100 7600 4000
Entry Wire Line
	7700 4200 7600 4100
Entry Wire Line
	7700 4300 7600 4200
Entry Wire Line
	7700 4400 7600 4300
Text Label 7800 4400 0    50   ~ 0
MCA7
Text Label 7800 4300 0    50   ~ 0
MCA6
Text Label 7800 4200 0    50   ~ 0
MCA5
Text Label 7800 4100 0    50   ~ 0
MCA4
Text Label 7800 4000 0    50   ~ 0
MCA3
Text Label 7800 3900 0    50   ~ 0
MCA2
Text Label 7800 3800 0    50   ~ 0
MCA1
Text Label 7800 3700 0    50   ~ 0
MCA0
Wire Wire Line
	7700 4400 8150 4400
Wire Wire Line
	7700 4300 8150 4300
Wire Wire Line
	7700 4200 8150 4200
Wire Wire Line
	7700 4100 8150 4100
Wire Wire Line
	7700 4000 8150 4000
Wire Wire Line
	7700 3900 8150 3900
Wire Wire Line
	7700 3800 8150 3800
Wire Wire Line
	7700 3700 8150 3700
Text Label 4250 4100 2    50   ~ 0
~µCMEM
Text Label 4250 4000 2    50   ~ 0
~µCIO
Text HLabel 1050 2000 0    50   Output ~ 0
~RD
Text HLabel 1050 1900 0    50   Output ~ 0
~WR
Connection ~ 1800 700 
Wire Wire Line
	1800 700  1800 750 
Wire Wire Line
	1400 700  1800 700 
Wire Wire Line
	1650 1300 1650 1450
Connection ~ 1650 1450
Wire Wire Line
	1250 1450 1650 1450
Wire Wire Line
	1650 1450 1650 1500
$Comp
L power:GND #PWR?
U 1 1 61A9833F
P 1650 1500
AR Path="/61A9833F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A9833F" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 1650 1250 50  0001 C CNN
F 1 "GND" H 1655 1327 50  0000 C CNN
F 2 "" H 1650 1500 50  0001 C CNN
F 3 "" H 1650 1500 50  0001 C CNN
	1    1650 1500
	1    0    0    -1  
$EndComp
Text HLabel 1050 4200 0    50   Output ~ 0
~FPRESET
Text Label 1200 4200 0    50   ~ 0
~FPRESET
Text HLabel 1050 4300 0    50   Output ~ 0
~FPRSTHOLD
Text Label 1200 4300 0    50   ~ 0
~FPRSTHOLD
Text HLabel 1050 3900 0    50   Output ~ 0
MFD0
Wire Wire Line
	1050 4000 2400 4000
Wire Wire Line
	1050 3900 2400 3900
Text HLabel 4700 4800 2    50   Output ~ 0
~LED-STOP
Text Label 4500 4800 2    50   ~ 0
~LED-STOP
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
F 2 "alexios:SOIC-20W" H 10500 5950 50  0001 C CNN
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
F 2 "alexios:SOIC-16" H 9550 6200 50  0001 C CNN
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
F 2 "alexios:SOIC-20W" H 9400 6550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 9400 6550 50  0001 C CNN
F 4 "Yes" H 4100 4800 50  0001 C CNN "Verified"
	2    9400 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 63D14E0F
P 2150 4400
AR Path="/63D14E0F" Ref="RN?"  Part="2" 
AR Path="/60757845/63D14E0F" Ref="RN2"  Part="4" 
F 0 "RN2" H 1650 4400 50  0000 L CNN
F 1 "30Ω" H 2150 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2150 4480 50  0001 C CNN
F 3 "~" V 2150 4400 50  0001 C CNN
	4    2150 4400
	1    0    0    -1  
$EndComp
NoConn ~ 1950 4400
Wire Wire Line
	2000 4400 1950 4400
NoConn ~ 2300 4400
Wire Wire Line
	2250 4400 2300 4400
Wire Wire Line
	1050 3800 1600 3800
Wire Wire Line
	1850 3800 2400 3800
Text HLabel 1050 3800 0    50   Output ~ 0
~FPIRQ
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 63D14E1B
P 2150 4300
AR Path="/63D14E1B" Ref="RN?"  Part="4" 
AR Path="/60757845/63D14E1B" Ref="RN2"  Part="3" 
F 0 "RN2" H 2250 4350 50  0001 L CNN
F 1 "30Ω" H 2125 4406 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2150 4380 50  0001 C CNN
F 3 "~" V 2150 4300 50  0001 C CNN
	3    2150 4300
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 63D14E15
P 2150 4200
AR Path="/63D14E15" Ref="RN?"  Part="3" 
AR Path="/60757845/63D14E15" Ref="RN2"  Part="2" 
F 0 "RN2" H 2250 4250 50  0001 L CNN
F 1 "30Ω" H 2125 4306 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2150 4280 50  0001 C CNN
F 3 "~" V 2150 4200 50  0001 C CNN
	2    2150 4200
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 63D14E09
P 1750 3800
AR Path="/63D14E09" Ref="RN?"  Part="1" 
AR Path="/60757845/63D14E09" Ref="RN2"  Part="1" 
F 0 "RN2" H 1725 3997 50  0000 C CNN
F 1 "30Ω" H 1725 3906 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 1750 3880 50  0001 C CNN
F 3 "~" V 1750 3800 50  0001 C CNN
	1    1750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2200 2050 2200
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
P 4550 2900
AR Path="/63C465B1" Ref="RN?"  Part="1" 
AR Path="/60757845/63C465B1" Ref="RN3"  Part="4" 
F 0 "RN3" H 4500 3000 50  0000 L CNN
F 1 "30Ω" H 4300 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4550 2980 50  0001 C CNN
F 3 "~" V 4550 2900 50  0001 C CNN
	4    4550 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 4300 2000 4300
Wire Wire Line
	1050 4200 2000 4200
Wire Wire Line
	2250 4300 2400 4300
Wire Wire Line
	2250 4200 2400 4200
Text HLabel 1050 4100 0    50   Output ~ 0
~CVOE
Wire Wire Line
	1050 4100 2400 4100
Wire Wire Line
	2400 3400 1650 3400
Wire Wire Line
	2400 3300 1650 3300
Wire Wire Line
	2400 3200 1650 3200
Wire Wire Line
	2400 3100 1650 3100
Text HLabel 1050 3700 0    50   Output ~ 0
SWD[0..3]
Wire Bus Line
	1450 3700 1050 3700
Entry Bus Bus
	1450 3700 1550 3600
Wire Wire Line
	2200 3000 2400 3000
Wire Wire Line
	2200 2900 2400 2900
Wire Wire Line
	2200 2800 2400 2800
Wire Wire Line
	2200 2700 2400 2700
Wire Wire Line
	1650 3000 1950 3000
Wire Wire Line
	1650 2900 1950 2900
Wire Wire Line
	1650 2800 1950 2800
Wire Wire Line
	1650 2700 1950 2700
Entry Wire Line
	1650 2700 1550 2600
Entry Wire Line
	1550 2700 1650 2800
Entry Wire Line
	1550 2800 1650 2900
Entry Wire Line
	1550 2900 1650 3000
Text HLabel 1050 2400 0    50   Output ~ 0
SWA[0..3]
Wire Bus Line
	1450 2400 1050 2400
Entry Bus Bus
	1450 2400 1550 2500
Wire Wire Line
	2700 5250 2700 5400
Text Notes 4650 5800 0    50   ~ 0
DTE/DCE cable config\n(aka I'm an idiot and always\nget the pinout wrong)
$Comp
L Device:D_Schottky_ALT D?
U 1 1 61A98383
P 4050 6050
AR Path="/61A98383" Ref="D?"  Part="1" 
AR Path="/60757845/61A98383" Ref="D2"  Part="1" 
F 0 "D2" H 4050 6267 50  0000 C CNN
F 1 "?" H 4050 6176 50  0000 C CNN
F 2 "alexios:SOD-323" H 4050 6050 50  0001 C CNN
F 3 "~" H 4050 6050 50  0001 C CNN
	1    4050 6050
	1    0    0    -1  
$EndComp
Text Label 3550 6450 0    50   ~ 0
RXD
Wire Wire Line
	4800 6150 4800 6450
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
Text Notes 3900 5900 2    50   ~ 0
The wired AND gate disables\nthe transmitter during µCU\nprogramming.
Wire Wire Line
	3900 5000 4700 5000
Text HLabel 4700 5000 2    50   Output ~ 0
~µSTEP
Wire Wire Line
	3900 4900 4700 4900
Text HLabel 4700 4900 2    50   Output ~ 0
STEP∕~RUN
Wire Wire Line
	3900 4800 4700 4800
Wire Wire Line
	4150 4500 4700 4500
$Comp
L Device:R_Small R?
U 1 1 6274D6EC
P 4050 4500
AR Path="/6274D6EC" Ref="R?"  Part="1" 
AR Path="/60757845/6274D6EC" Ref="R3"  Part="1" 
F 0 "R3" V 4100 4350 50  0000 C CNN
F 1 "30Ω" V 4100 4150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 4500 50  0001 C CNN
F 3 "~" H 4050 4500 50  0001 C CNN
	1    4050 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3900 4500 3950 4500
Wire Wire Line
	3900 4400 4700 4400
Text HLabel 4700 4400 2    50   Input ~ 0
~WAIT
Text HLabel 4700 4300 2    50   Input ~ 0
~IOINT
Text HLabel 4700 3700 2    50   Output ~ 0
~DBOE
Text HLabel 4700 3600 2    50   Output ~ 0
~ABOE
Text HLabel 4700 3500 2    50   Output ~ 0
~IBOE
Text HLabel 4700 3400 2    50   Output ~ 0
CLRWS
Text HLabel 4700 3800 2    50   3State ~ 0
~W
Text HLabel 4700 3900 2    50   3State ~ 0
~R
Text HLabel 4700 4000 2    50   3State ~ 0
~IO
Text HLabel 4700 4100 2    50   3State ~ 0
~MEM
Wire Wire Line
	4650 4100 4700 4100
Wire Wire Line
	4650 4000 4700 4000
Wire Wire Line
	4650 3900 4700 3900
Wire Wire Line
	4650 3800 4700 3800
Wire Wire Line
	3900 3800 4400 3800
Wire Wire Line
	3900 3900 4400 3900
Wire Wire Line
	3900 4000 4400 4000
Wire Wire Line
	3900 4100 4400 4100
Wire Wire Line
	3900 3700 4700 3700
Wire Wire Line
	3900 3600 4700 3600
Wire Wire Line
	3900 3500 4700 3500
Wire Wire Line
	3900 3400 4700 3400
Text Label 4000 3200 0    50   ~ 0
µCBUSCP
Text Label 4000 3100 0    50   ~ 0
µCµSTEP
Text Label 4000 3000 0    50   ~ 0
µCCLKEN
Wire Wire Line
	3900 3100 4400 3100
Wire Wire Line
	3900 3000 4400 3000
Text HLabel 4700 3200 2    50   Output ~ 0
BUSCP
Wire Wire Line
	4650 3200 4700 3200
Wire Wire Line
	4650 3100 4700 3100
Wire Wire Line
	4650 3000 4700 3000
Wire Wire Line
	4650 2900 4700 2900
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 620F2126
P 2100 3000
AR Path="/620F2126" Ref="RN?"  Part="4" 
AR Path="/60757845/620F2126" Ref="RN1"  Part="1" 
F 0 "RN1" H 2200 3050 50  0001 L CNN
F 1 "30Ω" H 2075 3106 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2100 3080 50  0001 C CNN
F 3 "~" V 2100 3000 50  0001 C CNN
	1    2100 3000
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 620F2120
P 2100 2900
AR Path="/620F2120" Ref="RN?"  Part="3" 
AR Path="/60757845/620F2120" Ref="RN1"  Part="2" 
F 0 "RN1" H 2200 2950 50  0001 L CNN
F 1 "30Ω" H 2075 3006 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2100 2980 50  0001 C CNN
F 3 "~" V 2100 2900 50  0001 C CNN
	2    2100 2900
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 620F211A
P 2100 2800
AR Path="/620F211A" Ref="RN?"  Part="2" 
AR Path="/60757845/620F211A" Ref="RN1"  Part="3" 
F 0 "RN1" H 2200 2850 50  0001 L CNN
F 1 "30Ω" H 2075 2906 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2100 2880 50  0001 C CNN
F 3 "~" V 2100 2800 50  0001 C CNN
	3    2100 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 620F2114
P 2100 2700
AR Path="/620F2114" Ref="RN?"  Part="1" 
AR Path="/60757845/620F2114" Ref="RN1"  Part="4" 
F 0 "RN1" H 2000 2800 50  0000 L CNN
F 1 "30Ω" H 2300 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 2100 2780 50  0001 C CNN
F 3 "~" V 2100 2700 50  0001 C CNN
	4    2100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3200 4400 3200
Text HLabel 4700 3100 2    50   Output ~ 0
FPµSTEP-IN
Text HLabel 4700 3000 2    50   Output ~ 0
FPCLKEN-IN
Wire Wire Line
	3900 2900 4400 2900
Text HLabel 4700 2900 2    50   Output ~ 0
~FPRAM~∕ROM
Text Label 800  1050 0    50   ~ 0
~DFPRESET
Wire Wire Line
	1400 1050 1650 1050
Connection ~ 1400 1050
Wire Wire Line
	1400 1000 1400 1050
Wire Wire Line
	1250 1050 1400 1050
Wire Wire Line
	1650 1050 1800 1050
Connection ~ 1650 1050
Connection ~ 1800 1050
Connection ~ 1250 1050
Wire Wire Line
	1250 1050 800  1050
$Comp
L alexios:momentary_switch SW1
U 1 1 61CAFDFF
P 1250 1250
F 0 "SW1" V 1250 1403 50  0000 L CNN
F 1 "momentary_switch" H 1250 1190 50  0001 C CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx31-2LFS" H 1250 1450 50  0001 C CNN
F 3 "" H 1250 1450 50  0001 C CNN
	1    1250 1250
	0    -1   1    0   
$EndComp
Wire Wire Line
	1800 2500 2400 2500
Wire Wire Line
	1800 1050 1800 2500
Text Notes 1950 700  0    50   ~ 0
Decoupling for each power pin.
Wire Wire Line
	2250 1250 2250 1300
Wire Wire Line
	2250 1050 2250 1000
Wire Wire Line
	2500 1050 2500 1000
Connection ~ 2500 1000
Wire Wire Line
	2500 1000 2750 1000
Wire Wire Line
	2500 1250 2500 1300
Connection ~ 2250 1000
Connection ~ 2250 1300
Wire Wire Line
	2250 1300 2500 1300
Wire Wire Line
	2250 1000 2500 1000
Wire Wire Line
	2750 1250 2750 1300
Wire Wire Line
	2750 1300 2500 1300
Connection ~ 2500 1300
Wire Wire Line
	2750 1050 2750 1000
$Comp
L Device:C_Small C?
U 1 1 607965F5
P 2750 1150
AR Path="/607965F5" Ref="C?"  Part="1" 
AR Path="/60757845/607965F5" Ref="C7"  Part="1" 
F 0 "C7" H 2800 1500 50  0000 R CNN
F 1 "100nF" H 2800 1400 50  0000 C CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 1150 50  0001 C CNN
F 3 "~" H 2750 1150 50  0001 C CNN
	1    2750 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 607965FB
P 2500 1150
AR Path="/607965FB" Ref="C?"  Part="1" 
AR Path="/60757845/607965FB" Ref="C6"  Part="1" 
F 0 "C6" H 2550 1500 50  0000 R CNN
F 1 "100nF" H 2500 1400 50  0000 C CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2500 1150 50  0001 C CNN
F 3 "~" H 2500 1150 50  0001 C CNN
	1    2500 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60796601
P 2250 1150
AR Path="/60796601" Ref="C?"  Part="1" 
AR Path="/60757845/60796601" Ref="C5"  Part="1" 
F 0 "C5" H 2300 1500 50  0000 R CNN
F 1 "1µF" H 2250 1400 50  0000 C CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 1150 50  0001 C CNN
F 3 "~" H 2250 1150 50  0001 C CNN
	1    2250 1150
	1    0    0    -1  
$EndComp
Connection ~ 2000 1300
$Comp
L power:GND #PWR?
U 1 1 60796608
P 2000 1300
AR Path="/60796608" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796608" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 2000 1050 50  0001 C CNN
F 1 "GND" H 2000 1100 50  0000 C CNN
F 2 "" H 2000 1300 50  0001 C CNN
F 3 "" H 2000 1300 50  0001 C CNN
	1    2000 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1300 2250 1300
Wire Wire Line
	2000 1000 2250 1000
$Comp
L Device:C_Small C?
U 1 1 60796610
P 2000 1150
AR Path="/60796610" Ref="C?"  Part="1" 
AR Path="/60757845/60796610" Ref="C4"  Part="1" 
F 0 "C4" H 2050 1500 50  0000 R CNN
F 1 "1µF" H 2000 1400 50  0000 C CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2000 1150 50  0001 C CNN
F 3 "~" H 2000 1150 50  0001 C CNN
	1    2000 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1250 2000 1300
Wire Wire Line
	2000 1050 2000 1000
Wire Wire Line
	2750 1000 2900 1000
Connection ~ 2750 1000
Connection ~ 2900 1000
Wire Wire Line
	3300 900  3300 1000
$Comp
L Device:D_Schottky_ALT D?
U 1 1 61A98389
P 4050 6250
AR Path="/61A98389" Ref="D?"  Part="1" 
AR Path="/60757845/61A98389" Ref="D3"  Part="1" 
F 0 "D3" H 3950 6350 50  0000 R CNN
F 1 "?" H 4150 6150 50  0000 C CNN
F 2 "alexios:SOD-323" H 4050 6250 50  0001 C CNN
F 3 "~" H 4050 6250 50  0001 C CNN
	1    4050 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6150 4300 6250
Connection ~ 4300 6150
Wire Wire Line
	4300 6150 4350 6150
Connection ~ 4300 6050
Wire Wire Line
	4300 6000 4300 6050
Wire Wire Line
	4300 6250 4200 6250
Wire Wire Line
	4300 6050 4300 6150
Wire Wire Line
	4200 6050 4300 6050
$Comp
L power:+5V #PWR?
U 1 1 61A9836E
P 4300 5800
AR Path="/61A9836E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A9836E" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 4300 5650 50  0001 C CNN
F 1 "+5V" H 4315 5973 50  0000 C CNN
F 2 "" H 4300 5800 50  0001 C CNN
F 3 "" H 4300 5800 50  0001 C CNN
	1    4300 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 61A98368
P 4300 5900
AR Path="/61A98368" Ref="R?"  Part="1" 
AR Path="/60757845/61A98368" Ref="R4"  Part="1" 
F 0 "R4" H 4241 5854 50  0000 R CNN
F 1 "10kΩ" H 4241 5945 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4300 5900 50  0001 C CNN
F 3 "~" H 4300 5900 50  0001 C CNN
	1    4300 5900
	-1   0    0    1   
$EndComp
Text Label 3550 6250 0    50   ~ 0
TXD
Text Label 3550 6050 0    50   ~ 0
~uCRESET
Wire Wire Line
	3900 6250 3550 6250
Wire Wire Line
	3900 6050 3550 6050
$Comp
L Device:D_ALT D?
U 1 1 61A98354
P 1400 850
AR Path="/61A98354" Ref="D?"  Part="1" 
AR Path="/60757845/61A98354" Ref="D1"  Part="1" 
F 0 "D1" V 1354 770 50  0000 R CNN
F 1 "D_ALT" V 1445 770 50  0000 R CNN
F 2 "alexios:SOD-323" H 1400 850 50  0001 C CNN
F 3 "~" H 1400 850 50  0001 C CNN
	1    1400 850 
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61A9834E
P 1800 700
AR Path="/61A9834E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A9834E" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 1800 550 50  0001 C CNN
F 1 "+5V" H 1350 800 50  0000 C CNN
F 2 "" H 1800 700 50  0001 C CNN
F 3 "" H 1800 700 50  0001 C CNN
	1    1800 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 950  1800 1050
$Comp
L Device:R_Small R?
U 1 1 61A98345
P 1800 850
AR Path="/61A98345" Ref="R?"  Part="1" 
AR Path="/60757845/61A98345" Ref="R1"  Part="1" 
F 0 "R1" H 1858 804 50  0000 L CNN
F 1 "4.7kΩ" H 1858 895 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1800 850 50  0001 C CNN
F 3 "~" H 1800 850 50  0001 C CNN
	1    1800 850 
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 1050 1650 1100
$Comp
L Device:C_Small C?
U 1 1 61A98336
P 1650 1200
AR Path="/61A98336" Ref="C?"  Part="1" 
AR Path="/60757845/61A98336" Ref="C3"  Part="1" 
F 0 "C3" H 1559 1246 50  0000 R CNN
F 1 "100nF" H 1559 1155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 1200 50  0001 C CNN
F 3 "~" H 1650 1200 50  0001 C CNN
	1    1650 1200
	1    0    0    -1  
$EndComp
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
Text HLabel 1050 2200 0    50   Output ~ 0
~FPHALT
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 615F27BC
P 9550 3400
AR Path="/615F27BC" Ref="RN?"  Part="4" 
AR Path="/60757845/615F27BC" Ref="RN8"  Part="4" 
F 0 "RN8" H 9650 3450 50  0001 L CNN
F 1 "30Ω" H 9525 3506 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9550 3480 50  0001 C CNN
F 3 "~" V 9550 3400 50  0001 C CNN
	4    9550 3400
	0    1    -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 615F27B6
P 9450 3400
AR Path="/615F27B6" Ref="RN?"  Part="3" 
AR Path="/60757845/615F27B6" Ref="RN8"  Part="3" 
F 0 "RN8" H 9550 3450 50  0001 L CNN
F 1 "30Ω" H 9425 3506 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9450 3480 50  0001 C CNN
F 3 "~" V 9450 3400 50  0001 C CNN
	3    9450 3400
	0    -1   -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 615F27B0
P 9350 3400
AR Path="/615F27B0" Ref="RN?"  Part="2" 
AR Path="/60757845/615F27B0" Ref="RN8"  Part="2" 
F 0 "RN8" H 9450 3450 50  0001 L CNN
F 1 "30Ω" H 9325 3506 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9350 3480 50  0001 C CNN
F 3 "~" V 9350 3400 50  0001 C CNN
	2    9350 3400
	0    -1   -1   0   
$EndComp
Entry Wire Line
	7600 3600 7500 3700
Entry Wire Line
	7600 3700 7500 3800
Entry Wire Line
	7600 3800 7500 3900
Entry Wire Line
	7600 3900 7500 4000
Entry Wire Line
	7600 4000 7500 4100
Text HLabel 10650 1250 2    50   BiDi ~ 0
FPD[0..7]
Text Label 10250 1250 0    50   ~ 0
FPD[0..7]
Wire Bus Line
	10650 1250 10200 1250
Entry Bus Bus
	10200 1250 10100 1350
Entry Wire Line
	10000 2300 10100 2200
Entry Wire Line
	10000 2200 10100 2100
Entry Wire Line
	10000 2100 10100 2000
Entry Wire Line
	10000 2000 10100 1900
Entry Wire Line
	10000 1900 10100 1800
Entry Wire Line
	10000 1800 10100 1700
Entry Wire Line
	10000 1700 10100 1600
Entry Wire Line
	10000 1600 10100 1500
Text Label 5700 2500 0    50   ~ 0
ALE
Text Label 5700 2600 0    50   ~ 0
SCANEN
Wire Wire Line
	5700 2500 6150 2500
Text Label 8150 2300 2    50   ~ 0
MCD7
Text Label 8150 2200 2    50   ~ 0
MCD6
Text Label 8150 2100 2    50   ~ 0
MCD5
Text Label 8150 2000 2    50   ~ 0
MCD4
Text Label 8150 1900 2    50   ~ 0
MCD3
Text Label 8150 1800 2    50   ~ 0
MCD2
Text Label 8150 1700 2    50   ~ 0
MCD1
$Comp
L alexios:74HC245 U5
U 1 1 60AE5F32
P 8750 2100
F 0 "U5" H 8750 2867 50  0000 C CNN
F 1 "74HC245" H 8750 2776 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8750 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 8750 2150 50  0001 C CNN
	1    8750 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 1600 9300 1600
Wire Wire Line
	9250 1700 9300 1700
Wire Wire Line
	9250 1800 9300 1800
Wire Wire Line
	9250 1900 9300 1900
Wire Wire Line
	9250 2000 9300 2000
Wire Wire Line
	9250 2100 9300 2100
Wire Wire Line
	9250 2200 9300 2200
Wire Wire Line
	9250 2300 9300 2300
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60CC9B33
P 9450 2300
AR Path="/60CC9B33" Ref="RN?"  Part="4" 
AR Path="/60757845/60CC9B33" Ref="RN10"  Part="4" 
F 0 "RN10" H 9350 2150 50  0000 L CNN
F 1 "30Ω" H 9650 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9450 2380 50  0001 C CNN
F 3 "~" V 9450 2300 50  0001 C CNN
	4    9450 2300
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60CC9B39
P 9450 2200
AR Path="/60CC9B39" Ref="RN?"  Part="3" 
AR Path="/60757845/60CC9B39" Ref="RN10"  Part="3" 
F 0 "RN10" H 9550 2250 50  0001 L CNN
F 1 "30Ω" H 9425 2306 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9450 2280 50  0001 C CNN
F 3 "~" V 9450 2200 50  0001 C CNN
	3    9450 2200
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60CC9B3F
P 9450 2100
AR Path="/60CC9B3F" Ref="RN?"  Part="2" 
AR Path="/60757845/60CC9B3F" Ref="RN10"  Part="2" 
F 0 "RN10" H 9550 2150 50  0001 L CNN
F 1 "30Ω" H 9425 2206 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9450 2180 50  0001 C CNN
F 3 "~" V 9450 2100 50  0001 C CNN
	2    9450 2100
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60CC9B45
P 9450 1900
AR Path="/60CC9B45" Ref="RN?"  Part="4" 
AR Path="/60757845/60CC9B45" Ref="RN9"  Part="4" 
F 0 "RN9" H 9550 1950 50  0001 L CNN
F 1 "30Ω" H 9425 2006 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9450 1980 50  0001 C CNN
F 3 "~" V 9450 1900 50  0001 C CNN
	4    9450 1900
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60CC9B4B
P 9450 1800
AR Path="/60CC9B4B" Ref="RN?"  Part="3" 
AR Path="/60757845/60CC9B4B" Ref="RN9"  Part="3" 
F 0 "RN9" H 9550 1850 50  0001 L CNN
F 1 "30Ω" H 9425 1906 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9450 1880 50  0001 C CNN
F 3 "~" V 9450 1800 50  0001 C CNN
	3    9450 1800
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60CC9B51
P 9450 1700
AR Path="/60CC9B51" Ref="RN?"  Part="2" 
AR Path="/60757845/60CC9B51" Ref="RN9"  Part="2" 
F 0 "RN9" H 9550 1750 50  0001 L CNN
F 1 "30Ω" H 9425 1806 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9450 1780 50  0001 C CNN
F 3 "~" V 9450 1700 50  0001 C CNN
	2    9450 1700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60CC9B57
P 9450 1600
AR Path="/60CC9B57" Ref="RN?"  Part="1" 
AR Path="/60757845/60CC9B57" Ref="RN9"  Part="1" 
F 0 "RN9" H 9350 1750 50  0000 L CNN
F 1 "30Ω" H 9600 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9450 1680 50  0001 C CNN
F 3 "~" V 9450 1600 50  0001 C CNN
	1    9450 1600
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60CC9B5D
P 9450 2000
AR Path="/60CC9B5D" Ref="RN?"  Part="1" 
AR Path="/60757845/60CC9B5D" Ref="RN10"  Part="1" 
F 0 "RN10" H 9550 2050 50  0001 L CNN
F 1 "30Ω" H 9650 1600 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9450 2080 50  0001 C CNN
F 3 "~" V 9450 2000 50  0001 C CNN
	1    9450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2300 9550 2300
Wire Wire Line
	10000 2200 9550 2200
Wire Wire Line
	10000 2100 9550 2100
Wire Wire Line
	10000 2000 9550 2000
Wire Wire Line
	10000 1900 9550 1900
Wire Wire Line
	10000 1800 9550 1800
Wire Wire Line
	10000 1700 9550 1700
Wire Wire Line
	10000 1600 9550 1600
Text Label 9950 1600 2    50   ~ 0
FPD0
Text Label 9950 1700 2    50   ~ 0
FPD1
Text Label 9950 1800 2    50   ~ 0
FPD2
Text Label 9950 1900 2    50   ~ 0
FPD3
Text Label 9950 2000 2    50   ~ 0
FPD4
Text Label 9950 2100 2    50   ~ 0
FPD5
Text Label 9950 2200 2    50   ~ 0
FPD6
Text Label 9950 2300 2    50   ~ 0
FPD7
Wire Wire Line
	8250 2500 7950 2500
Wire Wire Line
	7950 2600 8250 2600
Wire Wire Line
	7800 1600 8250 1600
Wire Wire Line
	7800 1700 8250 1700
Wire Wire Line
	7800 1800 8250 1800
Wire Wire Line
	7800 1900 8250 1900
Wire Wire Line
	7800 2000 8250 2000
Wire Wire Line
	7800 2100 8250 2100
Wire Wire Line
	7800 2200 8250 2200
Wire Wire Line
	7800 2300 8250 2300
Text Label 7950 2600 0    50   ~ 0
SCANEN
Text Label 7950 2500 0    50   ~ 0
~RD
Wire Bus Line
	5700 1250 7600 1250
Text Label 8150 1600 2    50   ~ 0
MCD0
Entry Bus Bus
	7600 1250 7700 1350
Entry Wire Line
	7800 2300 7700 2200
Entry Wire Line
	7800 2200 7700 2100
Entry Wire Line
	7800 2100 7700 2000
Entry Wire Line
	7800 2000 7700 1900
Entry Wire Line
	7800 1900 7700 1800
Entry Wire Line
	7800 1800 7700 1700
Entry Wire Line
	7800 1700 7700 1600
Entry Wire Line
	7800 1600 7700 1500
Text Label 2150 3700 0    50   ~ 0
MISO
Text Label 2150 3600 0    50   ~ 0
MOSI
NoConn ~ 2350 1800
Wire Wire Line
	2400 1800 2350 1800
Text Label 1200 4100 0    50   ~ 0
~CVOE
Text Notes 900  3500 0    50   ~ 0
Pulled up\ninternally
Connection ~ 3300 1000
Wire Wire Line
	3300 1000 3300 1350
Wire Wire Line
	2400 3700 1900 3700
Text Label 1900 3700 0    50   ~ 0
TXD
NoConn ~ 7150 4200
NoConn ~ 7150 4300
NoConn ~ 7150 4400
$Comp
L alexios:CXO X?
U 1 1 607966FC
P 1800 5350
AR Path="/607966FC" Ref="X?"  Part="1" 
AR Path="/60757845/607966FC" Ref="X1"  Part="1" 
F 0 "X1" H 1900 5717 50  0000 C CNN
F 1 "CXO" H 1900 5626 50  0000 C CNN
F 2 "alexios:Crystal_SMD_7050-4Pin_7.0x5.0mm" H 1950 4950 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/741/LFSPXO022296Bulk-985375.pdf" H 1900 5300 50  0001 C CNN
F 4 "449-LFSPXO019275REEL" H 1800 5350 50  0001 C CNN "BOM-Mouser"
F 5 "Yes" H 1800 5350 50  0001 C CNN "Verified"
	1    1800 5350
	1    0    0    -1  
$EndComp
Text Label 1200 2200 0    50   ~ 0
~FPHALT
$Comp
L power:GND #PWR?
U 1 1 607965C8
P 3350 5250
AR Path="/607965C8" Ref="#PWR?"  Part="1" 
AR Path="/60757845/607965C8" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 3350 5000 50  0001 C CNN
F 1 "GND" H 3355 5077 50  0000 C CNN
F 2 "" H 3350 5250 50  0001 C CNN
F 3 "" H 3350 5250 50  0001 C CNN
	1    3350 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 607965C2
P 1200 5200
AR Path="/607965C2" Ref="#PWR?"  Part="1" 
AR Path="/60757845/607965C2" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 1200 5050 50  0001 C CNN
F 1 "+5V" H 1215 5373 50  0000 C CNN
F 2 "" H 1200 5200 50  0001 C CNN
F 3 "" H 1200 5200 50  0001 C CNN
	1    1200 5200
	1    0    0    -1  
$EndComp
Text Notes 1200 6350 0    100  ~ 20
ISP
Wire Wire Line
	850  7050 850  7100
Wire Wire Line
	900  7050 850  7050
Wire Wire Line
	850  6750 900  6750
Wire Wire Line
	850  6700 850  6750
$Comp
L alexios:AVR-ISP-6 J?
U 1 1 6079658C
P 1300 6900
AR Path="/6079658C" Ref="J?"  Part="1" 
AR Path="/60757845/6079658C" Ref="J1"  Part="1" 
F 0 "J1" H 1300 7367 50  0000 C CNN
F 1 "AVR-ISP-6" H 1300 7276 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x03_P2.54mm_Horizontal" V 1050 6900 50  0001 C CNN
F 3 " ~" H 25  6350 50  0001 C CNN
	1    1300 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60796581
P 850 7100
AR Path="/60796581" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796581" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 850 6850 50  0001 C CNN
F 1 "GND" H 855 6927 50  0000 C CNN
F 2 "" H 850 7100 50  0001 C CNN
F 3 "" H 850 7100 50  0001 C CNN
	1    850  7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6079657B
P 850 6700
AR Path="/6079657B" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079657B" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 850 6550 50  0001 C CNN
F 1 "+5V" H 865 6873 50  0000 C CNN
F 2 "" H 850 6700 50  0001 C CNN
F 3 "" H 850 6700 50  0001 C CNN
	1    850  6700
	1    0    0    -1  
$EndComp
Text Notes 6100 1100 0    100  ~ 20
Address Latch
Text Label 7450 1250 2    50   ~ 0
MCD[0..7]
Entry Bus Bus
	5600 1350 5700 1250
Wire Wire Line
	5700 1600 6150 1600
Wire Wire Line
	5700 1700 6150 1700
Wire Wire Line
	5700 1800 6150 1800
Wire Wire Line
	5700 1900 6150 1900
Wire Wire Line
	5700 2000 6150 2000
Wire Wire Line
	5700 2100 6150 2100
Wire Wire Line
	5700 2200 6150 2200
Wire Wire Line
	5700 2300 6150 2300
Text Label 6100 2300 2    50   ~ 0
MCD7
Text Label 6100 2200 2    50   ~ 0
MCD6
Text Label 6100 2100 2    50   ~ 0
MCD5
Text Label 6100 2000 2    50   ~ 0
MCD4
Text Label 6100 1900 2    50   ~ 0
MCD3
Text Label 6100 1800 2    50   ~ 0
MCD2
Text Label 6100 1700 2    50   ~ 0
MCD1
Text Label 6100 1600 2    50   ~ 0
MCD0
Wire Wire Line
	5600 2600 6150 2600
Wire Wire Line
	5600 2700 5600 2600
Wire Wire Line
	5600 4600 6150 4600
Text Label 7200 3700 0    50   ~ 0
MCA0
Wire Wire Line
	7150 4000 7500 4000
Wire Wire Line
	7150 4100 7500 4100
NoConn ~ 7150 4600
Text Label 5750 4200 0    50   ~ 0
~SCANCLR
Wire Wire Line
	6100 4000 6150 4000
Wire Wire Line
	6100 3900 6100 4000
Wire Wire Line
	6150 3900 6100 3900
$Comp
L power:GND #PWR?
U 1 1 60796430
P 6150 3700
AR Path="/60796430" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/60796430" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796430" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 6150 3450 50  0001 C CNN
F 1 "GND" V 6155 3572 50  0000 R CNN
F 2 "" H 6150 3700 50  0001 C CNN
F 3 "" H 6150 3700 50  0001 C CNN
	1    6150 3700
	0    1    1    0   
$EndComp
Text Label 5700 4600 0    50   ~ 0
~SCANEN
Text Label 7200 4100 0    50   ~ 0
MCA4
Text Label 7200 4000 0    50   ~ 0
MCA3
Text Label 7200 3900 0    50   ~ 0
MCA2
Text Label 7200 3800 0    50   ~ 0
MCA1
Wire Wire Line
	7150 3900 7500 3900
Wire Wire Line
	7150 3800 7500 3800
Wire Wire Line
	7150 3700 7500 3700
$Comp
L alexios:74HC590 U?
U 1 1 60796422
P 6650 4200
AR Path="/60796422" Ref="U?"  Part="1" 
AR Path="/6233F88C/60796422" Ref="U?"  Part="1" 
AR Path="/60757845/60796422" Ref="U4"  Part="1" 
F 0 "U4" H 6650 4967 50  0000 C CNN
F 1 "74HC590" H 6650 4876 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6950 4550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 6950 4550 50  0001 C CNN
	1    6650 4200
	1    0    0    -1  
$EndComp
Text Notes 5250 4950 0    50   ~ 0
(= ~LED-RUN)
Text Label 1550 3600 1    50   ~ 0
SWD[0..3]
Text Label 1550 2850 1    50   ~ 0
SWA[0..3]
Entry Wire Line
	1650 3400 1550 3500
Entry Wire Line
	1650 3300 1550 3400
Entry Wire Line
	1650 3200 1550 3300
Entry Wire Line
	1650 3100 1550 3200
Text Label 7600 2900 1    50   ~ 0
MCA[0..7]
Text Label 2350 5400 0    50   ~ 0
µCCLK
Entry Wire Line
	7500 2300 7600 2400
Entry Wire Line
	7500 2200 7600 2300
Entry Wire Line
	7500 2100 7600 2200
Entry Wire Line
	7500 2000 7600 2100
Entry Wire Line
	7500 1900 7600 2000
Entry Wire Line
	7500 1800 7600 1900
Entry Wire Line
	7500 1700 7600 1800
Entry Wire Line
	7500 1600 7600 1700
Wire Wire Line
	3100 1000 3100 1350
Wire Wire Line
	2900 1000 2900 1350
Text Label 3950 2300 0    50   ~ 0
MCD7
Text Label 3950 2200 0    50   ~ 0
MCD6
Text Label 3950 2100 0    50   ~ 0
MCD5
Text Label 3950 2000 0    50   ~ 0
MCD4
Text Label 3950 1900 0    50   ~ 0
MCD3
Text Label 3950 1800 0    50   ~ 0
MCD2
Text Label 3950 1700 0    50   ~ 0
MCD1
Text Label 3950 1600 0    50   ~ 0
MCD0
Text Label 1200 4000 0    50   ~ 0
MFD1
Text Label 1200 3900 0    50   ~ 0
MFD0
Wire Wire Line
	2300 5250 2350 5250
Wire Wire Line
	2300 5400 2700 5400
NoConn ~ 3000 5250
Wire Wire Line
	2350 5250 2350 5200
$Comp
L power:+5V #PWR?
U 1 1 60796357
P 2350 5200
AR Path="/60796357" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796357" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 2350 5050 50  0001 C CNN
F 1 "+5V" H 2365 5373 50  0000 C CNN
F 2 "" H 2350 5200 50  0001 C CNN
F 3 "" H 2350 5200 50  0001 C CNN
	1    2350 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 5550 1400 5550
Connection ~ 1200 5550
Wire Wire Line
	1200 5250 1400 5250
Connection ~ 1200 5250
Wire Wire Line
	1200 5550 1200 5500
Wire Wire Line
	1200 5250 1200 5300
$Comp
L Device:C_Small C?
U 1 1 6079634B
P 1200 5400
AR Path="/6079634B" Ref="C?"  Part="1" 
AR Path="/60757845/6079634B" Ref="C1"  Part="1" 
F 0 "C1" H 1100 5650 50  0000 R CNN
F 1 "1µF" H 1100 5400 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 5400 50  0001 C CNN
F 3 "~" H 1200 5400 50  0001 C CNN
	1    1200 5400
	1    0    0    -1  
$EndComp
Connection ~ 1400 5550
Wire Wire Line
	1200 5550 1200 5600
Wire Wire Line
	1400 5550 1500 5550
Wire Wire Line
	1400 5500 1400 5550
Connection ~ 1400 5250
Wire Wire Line
	1400 5300 1400 5250
Wire Wire Line
	1200 5250 1200 5200
Wire Wire Line
	1500 5250 1400 5250
$Comp
L power:GND #PWR?
U 1 1 6079633D
P 1200 5600
AR Path="/6079633D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079633D" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 1200 5350 50  0001 C CNN
F 1 "GND" H 1205 5427 50  0000 C CNN
F 2 "" H 1200 5600 50  0001 C CNN
F 3 "" H 1200 5600 50  0001 C CNN
	1    1200 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60796337
P 1400 5400
AR Path="/60796337" Ref="C?"  Part="1" 
AR Path="/60757845/60796337" Ref="C2"  Part="1" 
F 0 "C2" H 1450 5650 50  0000 R CNN
F 1 "100nF" H 1550 5150 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 5400 50  0001 C CNN
F 3 "~" H 1400 5400 50  0001 C CNN
	1    1400 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6750 2150 6750
Wire Wire Line
	1700 6950 2150 6950
Wire Wire Line
	1700 6850 2150 6850
Wire Wire Line
	1700 7050 2150 7050
Text Label 4500 4700 2    50   ~ 0
~PANELEN
Text Label 4600 3500 2    50   ~ 0
~IBOE
Text Label 4600 3600 2    50   ~ 0
~ABOE
Text Label 4600 3700 2    50   ~ 0
~DBOE
Text Label 4500 4400 2    50   ~ 0
~WAIT
Text Label 4500 5000 2    50   ~ 0
~µSTEP
Text Label 4500 4900 2    50   ~ 0
STEP∕~RUN
Text Label 1700 3400 0    50   ~ 0
SWD3
Text Label 1700 3300 0    50   ~ 0
SWD2
Text Label 1700 3200 0    50   ~ 0
SWD1
Text Label 1700 3100 0    50   ~ 0
SWD0
Text Label 1700 3000 0    50   ~ 0
SWA3
Text Label 1700 2900 0    50   ~ 0
SWA2
Text Label 1700 2800 0    50   ~ 0
SWA1
Text Label 1700 2700 0    50   ~ 0
SWA0
Text Label 4400 2500 2    50   ~ 0
~CLR
Wire Wire Line
	3900 2500 4450 2500
Text Label 1200 3800 0    50   ~ 0
~FPIRQ
Text Label 1900 3600 0    50   ~ 0
RXD
Wire Wire Line
	2400 3600 1900 3600
Text Label 4250 3800 2    50   ~ 0
~µCW
Text Label 4250 3900 2    50   ~ 0
~µCR
Text Label 4600 3400 2    50   ~ 0
CLRWS
Text Label 4400 2600 2    50   ~ 0
SCK
Wire Wire Line
	3900 2600 4400 2600
Text Label 2150 6850 2    50   ~ 0
MOSI
Text Label 1900 2500 0    50   ~ 0
~µCRESET
Text Label 2150 7050 2    50   ~ 0
~DFPRESET
Text Label 2150 6950 2    50   ~ 0
SCK
Text Label 2150 6750 2    50   ~ 0
MISO
$Comp
L alexios:74LVC1G04 U?
U 1 1 607961F4
P 5600 2900
AR Path="/607961F4" Ref="U?"  Part="1" 
AR Path="/60757845/607961F4" Ref="U2"  Part="1" 
F 0 "U2" V 5750 3000 50  0000 L CNN
F 1 "74LVC1G14" V 5650 3000 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5600 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5600 2900 50  0001 C CNN
	1    5600 2900
	0    1    -1   0   
$EndComp
Text Label 4500 4600 2    50   ~ 0
~SCANEN
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
Entry Wire Line
	5700 2300 5600 2200
Entry Wire Line
	5700 2200 5600 2100
Entry Wire Line
	5700 2100 5600 2000
Entry Wire Line
	5700 2000 5600 1900
Entry Wire Line
	5700 1900 5600 1800
Entry Wire Line
	5700 1800 5600 1700
Entry Wire Line
	5700 1700 5600 1600
Entry Wire Line
	5700 1600 5600 1500
$Comp
L power:+5V #PWR?
U 1 1 6079614B
P 3300 900
AR Path="/6079614B" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079614B" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 3300 750 50  0001 C CNN
F 1 "+5V" H 3315 1073 50  0000 C CNN
F 2 "" H 3300 900 50  0001 C CNN
F 3 "" H 3300 900 50  0001 C CNN
	1    3300 900 
	1    0    0    -1  
$EndComp
Connection ~ 3100 1000
Wire Wire Line
	3100 1000 3300 1000
Wire Wire Line
	2900 1000 3100 1000
Wire Wire Line
	2400 2100 1900 2100
Wire Wire Line
	7150 1600 7500 1600
Text Label 7500 1600 2    50   ~ 0
MCA0
Text Label 7500 1700 2    50   ~ 0
MCA1
Text Label 7500 1800 2    50   ~ 0
MCA2
Text Label 7500 1900 2    50   ~ 0
MCA3
Text Label 7500 2000 2    50   ~ 0
MCA4
Text Label 7500 2100 2    50   ~ 0
MCA5
Text Label 7500 2200 2    50   ~ 0
MCA6
Text Label 7500 2300 2    50   ~ 0
MCA7
Wire Wire Line
	7150 1700 7500 1700
Wire Wire Line
	7150 1800 7500 1800
Wire Wire Line
	7150 1900 7500 1900
Wire Wire Line
	7150 2000 7500 2000
Wire Wire Line
	7150 2100 7500 2100
Wire Wire Line
	7150 2200 7500 2200
Wire Wire Line
	7150 2300 7500 2300
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
$Comp
L alexios:74AC573 U?
U 1 1 6079616A
P 6650 2100
AR Path="/6079616A" Ref="U?"  Part="1" 
AR Path="/60757845/6079616A" Ref="U3"  Part="1" 
F 0 "U3" H 6650 2867 50  0000 C CNN
F 1 "74AC573" H 6650 2776 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6650 2100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 6650 2100 50  0001 C CNN
F 4 "Yes" H 1350 350 50  0001 C CNN "Verified"
	1    6650 2100
	1    0    0    -1  
$EndComp
Text HLabel 4450 2500 2    50   Output ~ 0
~CLR
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 623E1F29
P 4550 3900
AR Path="/623E1F29" Ref="RN?"  Part="3" 
AR Path="/60757845/623E1F29" Ref="RN4"  Part="3" 
F 0 "RN4" H 4650 3950 50  0001 L CNN
F 1 "30Ω" H 4525 4006 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4550 3980 50  0001 C CNN
F 3 "~" V 4550 3900 50  0001 C CNN
	3    4550 3900
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 623E1F23
P 4550 4000
AR Path="/623E1F23" Ref="RN?"  Part="2" 
AR Path="/60757845/623E1F23" Ref="RN4"  Part="2" 
F 0 "RN4" H 4650 4050 50  0001 L CNN
F 1 "30Ω" H 4525 4106 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4550 4080 50  0001 C CNN
F 3 "~" V 4550 4000 50  0001 C CNN
	2    4550 4000
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 623E1F2F
P 4550 3800
AR Path="/623E1F2F" Ref="RN?"  Part="4" 
AR Path="/60757845/623E1F2F" Ref="RN4"  Part="4" 
F 0 "RN4" H 4650 3850 50  0001 L CNN
F 1 "30Ω" H 4525 3906 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4550 3880 50  0001 C CNN
F 3 "~" V 4550 3800 50  0001 C CNN
	4    4550 3800
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 623E1F1D
P 4550 4100
AR Path="/623E1F1D" Ref="RN?"  Part="1" 
AR Path="/60757845/623E1F1D" Ref="RN4"  Part="1" 
F 0 "RN4" H 4650 4000 50  0000 L CNN
F 1 "30Ω" H 4300 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4550 4180 50  0001 C CNN
F 3 "~" V 4550 4100 50  0001 C CNN
	1    4550 4100
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 613FD65A
P 8850 3400
AR Path="/613FD65A" Ref="RN?"  Part="4" 
AR Path="/60757845/613FD65A" Ref="RN7"  Part="4" 
F 0 "RN7" H 8950 3450 50  0001 L CNN
F 1 "30Ω" H 8825 3506 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8850 3480 50  0001 C CNN
F 3 "~" V 8850 3400 50  0001 C CNN
	4    8850 3400
	0    1    -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 613FD654
P 8950 3400
AR Path="/613FD654" Ref="RN?"  Part="3" 
AR Path="/60757845/613FD654" Ref="RN7"  Part="3" 
F 0 "RN7" H 9050 3450 50  0001 L CNN
F 1 "30Ω" H 8925 3506 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 8950 3480 50  0001 C CNN
F 3 "~" V 8950 3400 50  0001 C CNN
	3    8950 3400
	0    -1   -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 613FD64E
P 9050 3400
AR Path="/613FD64E" Ref="RN?"  Part="2" 
AR Path="/60757845/613FD64E" Ref="RN7"  Part="2" 
F 0 "RN7" H 9150 3450 50  0001 L CNN
F 1 "30Ω" H 9025 3506 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9050 3480 50  0001 C CNN
F 3 "~" V 9050 3400 50  0001 C CNN
	2    9050 3400
	0    -1   -1   0   
$EndComp
$Comp
L alexios:ATmega64-16AU U?
U 1 1 607968E0
P 3200 3300
AR Path="/607968E0" Ref="U?"  Part="1" 
AR Path="/60757845/607968E0" Ref="U1"  Part="1" 
F 0 "U1" H 3600 5350 50  0000 C CNN
F 1 "ATmega64-16AU" H 3650 5250 50  0000 C CNN
F 2 "alexios:TQFP-64" H 1225 4975 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2490-8-bit-avr-microcontroller-atmega64-l_datasheet.pdf" H 2950 3300 50  0001 C CNN
F 4 "556-ATMEGA64L-8AU" H 3200 3300 50  0001 C CNN "BOM-Mouser"
F 5 "Yes" H 3200 3300 50  0001 C CNN "Verified"
	1    3200 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 6C5C0C4C
P 3900 2700
F 0 "TP1" V 3850 2850 50  0000 L CNN
F 1 "TestPoint" V 3945 2888 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 4100 2700 50  0001 C CNN
F 3 "~" H 4100 2700 50  0001 C CNN
	1    3900 2700
	0    1    1    0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 63C465B7
P 4550 3000
AR Path="/63C465B7" Ref="RN?"  Part="2" 
AR Path="/60757845/63C465B7" Ref="RN3"  Part="3" 
F 0 "RN3" H 4650 3050 50  0001 L CNN
F 1 "30Ω" H 4525 3106 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4550 3080 50  0001 C CNN
F 3 "~" V 4550 3000 50  0001 C CNN
	3    4550 3000
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 63C465BD
P 4550 3100
AR Path="/63C465BD" Ref="RN?"  Part="3" 
AR Path="/60757845/63C465BD" Ref="RN3"  Part="2" 
F 0 "RN3" H 4650 3150 50  0001 L CNN
F 1 "30Ω" H 4525 3206 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4550 3180 50  0001 C CNN
F 3 "~" V 4550 3100 50  0001 C CNN
	2    4550 3100
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 63C465C3
P 4550 3200
AR Path="/63C465C3" Ref="RN?"  Part="4" 
AR Path="/60757845/63C465C3" Ref="RN3"  Part="1" 
F 0 "RN3" H 4650 3250 50  0001 L CNN
F 1 "30Ω" H 4525 3306 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4550 3280 50  0001 C CNN
F 3 "~" V 4550 3200 50  0001 C CNN
	1    4550 3200
	1    0    0    1   
$EndComp
Wire Wire Line
	5500 4200 6150 4200
Text HLabel 5500 4200 0    50   Input ~ 0
~SCANCLR
Text HLabel 1050 4000 0    50   Output ~ 0
MFD1
Wire Bus Line
	1550 3200 1550 3600
Wire Bus Line
	1550 2500 1550 2900
Wire Bus Line
	5600 1350 5600 2200
Wire Bus Line
	7700 1350 7700 2200
Wire Bus Line
	10100 1350 10100 2200
Wire Bus Line
	10100 3450 10100 4300
Wire Bus Line
	4450 1350 4450 2200
Wire Bus Line
	7600 1700 7600 4300
$EndSCHEMATC
