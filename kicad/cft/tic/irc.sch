EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1000 1500 0    50   3State ~ 0
DB[0..15]
Text Label 1050 1500 0    50   ~ 0
DB[0..15]
Text HLabel 5450 4000 0    50   Input ~ 0
~RIER
Text Label 9950 2950 2    50   ~ 0
FPD[0..7]
Text HLabel 10650 2950 2    50   3State ~ 0
FPD[0..7]
Entry Wire Line
	3250 2100 3150 2200
Entry Wire Line
	3250 2000 3150 2100
Entry Wire Line
	3250 1900 3150 2000
Entry Wire Line
	3250 1800 3150 1900
Entry Wire Line
	3250 1700 3150 1800
Entry Wire Line
	3250 1600 3150 1700
Entry Wire Line
	3250 1500 3150 1600
Entry Wire Line
	3250 1400 3150 1500
Text Label 3100 2200 2    50   ~ 0
IEN7
Text Label 3100 2100 2    50   ~ 0
IEN6
Text Label 3100 2000 2    50   ~ 0
IEN5
Text Label 3100 1900 2    50   ~ 0
IEN4
Text Label 3100 1800 2    50   ~ 0
IEN3
Text Label 3100 1700 2    50   ~ 0
IEN2
Text Label 3100 1600 2    50   ~ 0
IEN1
Text Label 3100 1500 2    50   ~ 0
IEN0
Wire Wire Line
	3150 2200 2850 2200
Wire Wire Line
	3150 2100 2850 2100
Wire Wire Line
	3150 2000 2850 2000
Wire Wire Line
	3150 1900 2850 1900
Wire Wire Line
	3150 1800 2850 1800
Wire Wire Line
	3150 1700 2850 1700
Wire Wire Line
	3150 1600 2850 1600
Wire Wire Line
	3150 1500 2850 1500
Entry Wire Line
	3250 2100 3350 2200
Entry Wire Line
	3250 2000 3350 2100
Entry Wire Line
	3250 1900 3350 2000
Entry Wire Line
	3250 1800 3350 1900
Entry Wire Line
	3250 1700 3350 1800
Entry Wire Line
	3250 1600 3350 1700
Entry Wire Line
	3250 1500 3350 1600
Entry Wire Line
	3250 1400 3350 1500
Wire Wire Line
	3350 3100 3650 3100
Wire Wire Line
	3350 3000 3650 3000
Wire Wire Line
	3350 2900 3650 2900
Wire Wire Line
	3350 2800 3650 2800
Wire Wire Line
	3350 2700 3650 2700
Wire Wire Line
	3350 2600 3650 2600
Wire Wire Line
	3350 2500 3650 2500
Wire Wire Line
	3350 2400 3650 2400
Entry Wire Line
	3250 2500 3350 2400
Entry Wire Line
	3250 2600 3350 2500
Entry Wire Line
	3250 2700 3350 2600
Entry Wire Line
	3250 2800 3350 2700
Entry Wire Line
	3250 2900 3350 2800
Entry Wire Line
	3250 3000 3350 2900
Entry Wire Line
	3250 3100 3350 3000
Entry Wire Line
	3250 3200 3350 3100
Wire Bus Line
	7100 950  7200 1050
Wire Bus Line
	5400 950  7100 950 
Wire Bus Line
	5300 1050 5400 950 
Entry Wire Line
	7300 1500 7200 1400
Entry Wire Line
	7300 1600 7200 1500
Entry Wire Line
	7300 1700 7200 1600
Entry Wire Line
	7300 1800 7200 1700
Entry Wire Line
	7300 1900 7200 1800
Entry Wire Line
	7300 2000 7200 1900
Entry Wire Line
	7300 2100 7200 2000
Entry Wire Line
	7300 2200 7200 2100
$Comp
L alexios:74HC541 U?
U 1 1 5F173A15
P 8050 2000
AR Path="/5F173A15" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F173A15" Ref="U?"  Part="1" 
F 0 "U?" H 8050 2767 50  0000 C CNN
F 1 "74HC541" H 8050 2676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8050 2000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8050 2000 50  0001 C CNN
	1    8050 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F173A07
P 7500 2550
AR Path="/5F173A07" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173A07" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7500 2300 50  0001 C CNN
F 1 "GND" H 7505 2377 50  0000 C CNN
F 2 "" H 7500 2550 50  0001 C CNN
F 3 "" H 7500 2550 50  0001 C CNN
	1    7500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 2500 7500 2500
Wire Wire Line
	7500 2500 7500 2550
Wire Wire Line
	7550 1500 7300 1500
Wire Wire Line
	7550 1600 7300 1600
Wire Wire Line
	7550 1700 7300 1700
Wire Wire Line
	7550 1800 7300 1800
Wire Wire Line
	7550 1900 7300 1900
Wire Wire Line
	7550 2000 7300 2000
Wire Wire Line
	7550 2100 7300 2100
Wire Wire Line
	7550 2200 7300 2200
Text Label 7300 1500 0    50   ~ 0
IRF0
Text Label 7300 1600 0    50   ~ 0
IRF1
Text Label 7300 1700 0    50   ~ 0
IRF2
Text Label 7300 1800 0    50   ~ 0
IRF3
Text Label 7300 1900 0    50   ~ 0
IRF4
Text Label 7300 2000 0    50   ~ 0
IRF5
Text Label 7300 2100 0    50   ~ 0
IRF6
Text Label 7300 2200 0    50   ~ 0
IRF7
Text HLabel 1000 1300 0    50   Input ~ 0
CLK3
Text HLabel 1000 1200 0    50   Input ~ 0
CLK2
Text HLabel 1000 2300 0    50   Input ~ 0
~RESET
Text HLabel 1000 2100 0    50   Input ~ 0
~WIER
Wire Wire Line
	9100 4000 8450 4000
$Comp
L Device:R_Pack04_Split R?
U 1 1 5F173AB2
P 4000 4150
AR Path="/5F173AB2" Ref="R?"  Part="1" 
AR Path="/5F160E7C/5F173AB2" Ref="R?"  Part="1" 
F 0 "R?" V 3950 4350 50  0000 L CNN
F 1 "4.7kΩ" V 4100 4150 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 3930 4150 50  0001 C CNN
F 3 "~" H 4000 4150 50  0001 C CNN
	1    4000 4150
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R?
U 2 1 5F173AAC
P 4000 4250
AR Path="/5F173AAC" Ref="R?"  Part="2" 
AR Path="/5F160E7C/5F173AAC" Ref="R?"  Part="2" 
F 0 "R?" V 3950 4450 50  0000 L CNN
F 1 "4.7kΩ" V 4100 4250 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 3930 4250 50  0001 C CNN
F 3 "~" H 4000 4250 50  0001 C CNN
	2    4000 4250
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R?
U 3 1 5F173AA6
P 4000 4350
AR Path="/5F173AA6" Ref="R?"  Part="3" 
AR Path="/5F160E7C/5F173AA6" Ref="R?"  Part="3" 
F 0 "R?" V 3950 4550 50  0000 L CNN
F 1 "4.7kΩ" V 4100 4350 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 3930 4350 50  0001 C CNN
F 3 "~" H 4000 4350 50  0001 C CNN
	3    4000 4350
	0    -1   1    0   
$EndComp
Wire Wire Line
	4300 4150 4300 4250
Wire Wire Line
	4300 4350 4300 4450
Connection ~ 4300 4350
Wire Wire Line
	4300 4250 4300 4350
Connection ~ 4300 4250
Wire Wire Line
	4150 4450 4300 4450
Wire Wire Line
	4150 4350 4300 4350
Wire Wire Line
	4150 4250 4300 4250
Connection ~ 4300 4150
Wire Wire Line
	4150 4150 4300 4150
Wire Wire Line
	4300 4050 4300 4150
Connection ~ 4300 4050
Wire Wire Line
	4150 4050 4300 4050
Wire Wire Line
	4300 3950 4300 4050
Connection ~ 4300 3950
Wire Wire Line
	4150 3950 4300 3950
Wire Wire Line
	4300 3850 4300 3950
Connection ~ 4300 3850
Wire Wire Line
	4150 3850 4300 3850
Wire Wire Line
	4300 3750 4300 3850
Connection ~ 4300 3750
Wire Wire Line
	4150 3750 4300 3750
$Comp
L Device:R_Pack04_Split R?
U 4 1 5F173A8A
P 4000 4450
AR Path="/5F173A8A" Ref="R?"  Part="4" 
AR Path="/5F160E7C/5F173A8A" Ref="R?"  Part="4" 
F 0 "R?" V 3950 4650 50  0000 L CNN
F 1 "4.7kΩ" V 4100 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 3930 4450 50  0001 C CNN
F 3 "~" H 4000 4450 50  0001 C CNN
	4    4000 4450
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R?
U 4 1 5F173A84
P 4000 4050
AR Path="/5F173A84" Ref="R?"  Part="4" 
AR Path="/5F160E7C/5F173A84" Ref="R?"  Part="4" 
F 0 "R?" V 3950 4250 50  0000 L CNN
F 1 "4.7kΩ" V 3884 4050 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 3930 4050 50  0001 C CNN
F 3 "~" H 4000 4050 50  0001 C CNN
	4    4000 4050
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R?
U 3 1 5F173A7E
P 4000 3950
AR Path="/5F173A7E" Ref="R?"  Part="3" 
AR Path="/5F160E7C/5F173A7E" Ref="R?"  Part="3" 
F 0 "R?" V 3950 4150 50  0000 L CNN
F 1 "4.7kΩ" V 3884 3950 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 3930 3950 50  0001 C CNN
F 3 "~" H 4000 3950 50  0001 C CNN
	3    4000 3950
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack04_Split R?
U 2 1 5F173A78
P 4000 3850
AR Path="/5F173A78" Ref="R?"  Part="2" 
AR Path="/5F160E7C/5F173A78" Ref="R?"  Part="2" 
F 0 "R?" V 3950 4050 50  0000 L CNN
F 1 "4.7kΩ" V 3884 3850 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 3930 3850 50  0001 C CNN
F 3 "~" H 4000 3850 50  0001 C CNN
	2    4000 3850
	0    -1   1    0   
$EndComp
Wire Wire Line
	4300 3700 4300 3750
$Comp
L Device:R_Pack04_Split R?
U 1 1 5F173A71
P 4000 3750
AR Path="/5F173A71" Ref="R?"  Part="1" 
AR Path="/5F160E7C/5F173A71" Ref="R?"  Part="1" 
F 0 "R?" V 3950 3950 50  0000 L CNN
F 1 "4.7kΩ" V 3884 3750 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 3930 3750 50  0001 C CNN
F 3 "~" H 4000 3750 50  0001 C CNN
	1    4000 3750
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F173A6B
P 4300 3700
AR Path="/5F173A6B" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173A6B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4300 3550 50  0001 C CNN
F 1 "+5V" H 4315 3873 50  0000 C CNN
F 2 "" H 4300 3700 50  0001 C CNN
F 3 "" H 4300 3700 50  0001 C CNN
	1    4300 3700
	-1   0    0    -1  
$EndComp
Text Label 3350 4450 0    50   ~ 0
~IRQ7
Text Label 3350 4350 0    50   ~ 0
~IRQ6
Text Label 3350 4250 0    50   ~ 0
~IRQ5
Text Label 3350 4150 0    50   ~ 0
~IRQ4
Text Label 3350 4050 0    50   ~ 0
~IRQ3
Text Label 3350 3950 0    50   ~ 0
~IRQ2
Text Label 3350 3850 0    50   ~ 0
~IRQ1
Text Label 3350 3750 0    50   ~ 0
~IRQ0
Wire Wire Line
	3350 4450 3850 4450
Wire Wire Line
	3350 4350 3850 4350
Wire Wire Line
	3350 4250 3850 4250
Wire Wire Line
	3350 4150 3850 4150
Wire Wire Line
	3350 4050 3850 4050
Wire Wire Line
	3350 3950 3850 3950
Wire Wire Line
	3350 3850 3850 3850
Wire Wire Line
	3350 3750 3850 3750
Text Label 5400 3800 0    50   ~ 0
IEN7
Text Label 5400 3700 0    50   ~ 0
IEN6
Text Label 5400 3600 0    50   ~ 0
IEN5
Text Label 5400 3500 0    50   ~ 0
IEN4
Text Label 5400 3400 0    50   ~ 0
IEN3
Text Label 5400 3300 0    50   ~ 0
IEN2
Text Label 5400 3200 0    50   ~ 0
IEN1
Text Label 5400 3100 0    50   ~ 0
IEN0
$Comp
L alexios:74HC541 U?
U 1 1 5F173A3D
P 6250 3600
AR Path="/5F173A3D" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F173A3D" Ref="U?"  Part="1" 
F 0 "U?" H 6250 4367 50  0000 C CNN
F 1 "74HC541" H 6250 4276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6250 3600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6250 3600 50  0001 C CNN
	1    6250 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F173A37
P 5700 4150
AR Path="/5F173A37" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173A37" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5700 3900 50  0001 C CNN
F 1 "GND" H 5705 3977 50  0000 C CNN
F 2 "" H 5700 4150 50  0001 C CNN
F 3 "" H 5700 4150 50  0001 C CNN
	1    5700 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4100 5700 4100
Wire Wire Line
	5700 4100 5700 4150
Text Label 5500 4000 0    50   ~ 0
~RIER
Wire Wire Line
	8500 4100 8500 4150
Wire Wire Line
	8450 4100 8500 4100
$Comp
L power:GND #PWR?
U 1 1 5F1739EB
P 8500 4150
AR Path="/5F1739EB" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F1739EB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8500 3900 50  0001 C CNN
F 1 "GND" H 8505 3977 50  0000 C CNN
F 2 "" H 8500 4150 50  0001 C CNN
F 3 "" H 8500 4150 50  0001 C CNN
	1    8500 4150
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5F1739E5
P 7950 3600
AR Path="/5F1739E5" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F1739E5" Ref="U?"  Part="1" 
F 0 "U?" H 7950 4367 50  0000 C CNN
F 1 "74HC541" H 7950 4276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7950 3600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7950 3600 50  0001 C CNN
	1    7950 3600
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1739C7
P 8500 3000
AR Path="/5F1739C7" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F1739C7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8500 2850 50  0001 C CNN
F 1 "+5V" H 8515 3173 50  0000 C CNN
F 2 "" H 8500 3000 50  0001 C CNN
F 3 "" H 8500 3000 50  0001 C CNN
	1    8500 3000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8500 3000 8500 3100
Wire Wire Line
	8500 3400 8450 3400
Wire Wire Line
	8450 3100 8500 3100
Connection ~ 8500 3100
Wire Wire Line
	8500 3100 8500 3200
Wire Wire Line
	8450 3200 8500 3200
Connection ~ 8500 3200
Wire Wire Line
	8500 3200 8500 3300
Wire Wire Line
	8450 3300 8500 3300
Connection ~ 8500 3300
Wire Wire Line
	8500 3300 8500 3400
Wire Wire Line
	8450 3500 8500 3500
Wire Wire Line
	8500 3500 8500 3600
Connection ~ 8500 4100
Wire Wire Line
	8450 3600 8500 3600
Connection ~ 8500 3600
Wire Wire Line
	8500 3600 8500 3700
Wire Wire Line
	8450 3700 8500 3700
Connection ~ 8500 3700
Wire Wire Line
	8500 3700 8500 3800
Wire Wire Line
	8450 3800 8500 3800
Connection ~ 8500 3800
Wire Wire Line
	8500 3800 8500 4100
Entry Wire Line
	5400 1500 5300 1400
Entry Wire Line
	5400 1600 5300 1500
Entry Wire Line
	5400 1700 5300 1600
Entry Wire Line
	5400 1800 5300 1700
Entry Wire Line
	5400 1900 5300 1800
Entry Wire Line
	5400 2000 5300 1900
Entry Wire Line
	5400 2100 5300 2000
Entry Wire Line
	5400 2200 5300 2100
Entry Wire Line
	5200 1500 5300 1400
Entry Wire Line
	5200 1600 5300 1500
Entry Wire Line
	5200 1700 5300 1600
Entry Wire Line
	5200 1800 5300 1700
Entry Wire Line
	5200 1900 5300 1800
Entry Wire Line
	5200 2000 5300 1900
Entry Wire Line
	5200 2100 5300 2000
Entry Wire Line
	5200 2200 5300 2100
Wire Wire Line
	4800 2200 5200 2200
Wire Wire Line
	4800 2100 5200 2100
Wire Wire Line
	4800 2000 5200 2000
Wire Wire Line
	4800 1900 5200 1900
Wire Wire Line
	4800 1800 5200 1800
Wire Wire Line
	4800 1700 5200 1700
Wire Wire Line
	4800 1600 5200 1600
Wire Wire Line
	4800 1500 5200 1500
Text Label 5050 2200 2    50   ~ 0
IRF7
Text Label 5050 2100 2    50   ~ 0
IRF6
Text Label 5050 2000 2    50   ~ 0
IRF5
Text Label 5050 1900 2    50   ~ 0
IRF4
Text Label 5050 1800 2    50   ~ 0
IRF3
Text Label 5050 1700 2    50   ~ 0
IRF2
Text Label 5050 1600 2    50   ~ 0
IRF1
Text Label 5050 1500 2    50   ~ 0
IRF0
Text Label 3400 3100 0    50   ~ 0
~IRQ7
Text Label 3400 3000 0    50   ~ 0
~IRQ6
Text Label 3400 2900 0    50   ~ 0
~IRQ5
Text Label 3400 2800 0    50   ~ 0
~IRQ4
Text Label 3400 2700 0    50   ~ 0
~IRQ3
Text Label 3400 2600 0    50   ~ 0
~IRQ2
Text Label 3400 2500 0    50   ~ 0
~IRQ1
Text Label 3400 2400 0    50   ~ 0
~IRQ0
Text Label 3400 2200 0    50   ~ 0
IEN7
Text Label 3400 2100 0    50   ~ 0
IEN6
Text Label 3400 2000 0    50   ~ 0
IEN5
Text Label 3400 1900 0    50   ~ 0
IEN4
Text Label 3400 1800 0    50   ~ 0
IEN3
Text Label 3400 1700 0    50   ~ 0
IEN2
Text Label 3400 1600 0    50   ~ 0
IEN1
Text Label 3400 1500 0    50   ~ 0
IEN0
Text Label 1050 1300 0    50   ~ 0
CLK3
Text Label 1050 1200 0    50   ~ 0
CLK2
$Sheet
S 3650 1050 1150 2200
U 5F173948
F0 "sheet5F1738C0" 50
F1 "irq_state_ffs.sch" 50
F2 "~IRQ0" I L 3650 2400 50 
F3 "IEN0" I L 3650 1500 50 
F4 "~IRQ1" I L 3650 2500 50 
F5 "IEN1" I L 3650 1600 50 
F6 "~IRQ2" I L 3650 2600 50 
F7 "IEN2" I L 3650 1700 50 
F8 "~IRQ3" I L 3650 2700 50 
F9 "IEN3" I L 3650 1800 50 
F10 "CLK2" I L 3650 1200 50 
F11 "CLK3" I L 3650 1300 50 
F12 "IRF7" O R 4800 2200 50 
F13 "~IRQ4" I L 3650 2800 50 
F14 "~IRQ5" I L 3650 2900 50 
F15 "~IRQ6" I L 3650 3000 50 
F16 "~IRQ7" I L 3650 3100 50 
F17 "IEN4" I L 3650 1900 50 
F18 "IEN5" I L 3650 2000 50 
F19 "IEN6" I L 3650 2100 50 
F20 "IEN7" I L 3650 2200 50 
F21 "IRF0" O R 4800 1500 50 
F22 "IRF1" O R 4800 1600 50 
F23 "IRF2" O R 4800 1700 50 
F24 "IRF3" O R 4800 1800 50 
F25 "IRF4" O R 4800 1900 50 
F26 "IRF5" O R 4800 2000 50 
F27 "IRF6" O R 4800 2100 50 
$EndSheet
Wire Wire Line
	3350 2200 3650 2200
Wire Wire Line
	3350 2100 3650 2100
Wire Wire Line
	3350 2000 3650 2000
Wire Wire Line
	3350 1900 3650 1900
Wire Wire Line
	3350 1800 3650 1800
Wire Wire Line
	3350 1700 3650 1700
Wire Wire Line
	3350 1600 3650 1600
Wire Wire Line
	3350 1500 3650 1500
Entry Wire Line
	7000 2200 7100 2300
Entry Wire Line
	7000 2100 7100 2200
Entry Wire Line
	7000 2000 7100 2100
Entry Wire Line
	7000 1900 7100 2000
Entry Wire Line
	7000 1800 7100 1900
Entry Wire Line
	7000 1700 7100 1800
Entry Wire Line
	7000 1600 7100 1700
Entry Wire Line
	7000 1500 7100 1600
Wire Wire Line
	6750 2200 7000 2200
Wire Wire Line
	6750 2100 7000 2100
Wire Wire Line
	6750 2000 7000 2000
Wire Wire Line
	6750 1900 7000 1900
Wire Wire Line
	6750 1800 7000 1800
Wire Wire Line
	6750 1700 7000 1700
Wire Wire Line
	6750 1600 7000 1600
Wire Wire Line
	6750 1500 7000 1500
$Comp
L alexios:74HC541 U?
U 1 1 5F17390A
P 6250 2000
AR Path="/5F17390A" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F17390A" Ref="U?"  Part="1" 
F 0 "U?" H 6250 2767 50  0000 C CNN
F 1 "74HC541" H 6250 2676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6250 2000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6250 2000 50  0001 C CNN
	1    6250 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F173904
P 5700 2550
AR Path="/5F173904" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173904" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5700 2300 50  0001 C CNN
F 1 "GND" H 5705 2377 50  0000 C CNN
F 2 "" H 5700 2550 50  0001 C CNN
F 3 "" H 5700 2550 50  0001 C CNN
	1    5700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2500 5700 2500
Wire Wire Line
	5700 2500 5700 2550
Text Label 5500 2400 0    50   ~ 0
~RISR
Wire Wire Line
	5750 1500 5400 1500
Wire Wire Line
	5750 1600 5400 1600
Wire Wire Line
	5750 1700 5400 1700
Wire Wire Line
	5750 1800 5400 1800
Wire Wire Line
	5750 1900 5400 1900
Wire Wire Line
	5750 2000 5400 2000
Wire Wire Line
	5750 2100 5400 2100
Wire Wire Line
	5750 2200 5400 2200
Text Label 5400 1500 0    50   ~ 0
IRF0
Text Label 5400 1600 0    50   ~ 0
IRF1
Text Label 5400 1700 0    50   ~ 0
IRF2
Text Label 5400 1800 0    50   ~ 0
IRF3
Text Label 5400 1900 0    50   ~ 0
IRF4
Text Label 5400 2000 0    50   ~ 0
IRF5
Text Label 5400 2100 0    50   ~ 0
IRF6
Text Label 5400 2200 0    50   ~ 0
IRF7
Text Label 6950 1500 2    50   ~ 0
DB0
Text Label 6950 1600 2    50   ~ 0
DB1
Text Label 6950 1700 2    50   ~ 0
DB2
Text Label 6950 1800 2    50   ~ 0
DB3
Text Label 6950 1900 2    50   ~ 0
DB4
Text Label 6950 2000 2    50   ~ 0
DB5
Text Label 6950 2100 2    50   ~ 0
DB6
Text Label 6950 2200 2    50   ~ 0
DB7
Text Label 1650 1900 0    50   ~ 0
DB3
Text Label 1650 1800 0    50   ~ 0
DB2
Text Label 1650 1700 0    50   ~ 0
DB1
Text Label 1650 1500 0    50   ~ 0
DB0
Wire Wire Line
	1850 1900 1650 1900
Wire Wire Line
	1850 1800 1650 1800
Wire Wire Line
	1850 1700 1650 1700
Wire Wire Line
	1850 1500 1650 1500
Text Label 1850 2100 2    50   ~ 0
~WIER
Text Label 1850 2300 2    50   ~ 0
~RESET
$Comp
L alexios:74HC259 U?
U 1 1 5F1738C6
P 2350 1900
AR Path="/5F1738C6" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F1738C6" Ref="U?"  Part="1" 
F 0 "U?" H 2350 1325 50  0000 C CNN
F 1 "74HC259" H 2350 1234 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2350 1900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT259.pdf" H 2350 1900 50  0001 C CNN
	1    2350 1900
	1    0    0    -1  
$EndComp
Wire Bus Line
	3250 850  3350 750 
$Comp
L alexios:74HC541 U?
U 1 1 5F173990
P 6250 5100
AR Path="/5F173990" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F173990" Ref="U?"  Part="1" 
F 0 "U?" H 6250 5867 50  0000 C CNN
F 1 "74HC541" H 6250 5776 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6250 5100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6250 5100 50  0001 C CNN
	1    6250 5100
	1    0    0    -1  
$EndComp
Text Label 7000 4600 2    50   ~ 0
FPD0
Text Label 7000 4700 2    50   ~ 0
FPD1
Text Label 7000 4800 2    50   ~ 0
FPD2
Text Label 7000 4900 2    50   ~ 0
FPD3
Text Label 7000 5000 2    50   ~ 0
FPD4
Text Label 7000 5100 2    50   ~ 0
FPD5
Text Label 7000 5200 2    50   ~ 0
FPD6
Text Label 7000 5300 2    50   ~ 0
FPD7
$Comp
L power:GND #PWR?
U 1 1 5F17399E
P 5700 5650
AR Path="/5F17399E" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F17399E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5700 5400 50  0001 C CNN
F 1 "GND" H 5705 5477 50  0000 C CNN
F 2 "" H 5700 5650 50  0001 C CNN
F 3 "" H 5700 5650 50  0001 C CNN
	1    5700 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5600 5700 5600
Wire Wire Line
	5700 5600 5700 5650
Text Label 8800 2200 2    50   ~ 0
FPD7
Text Label 8800 2100 2    50   ~ 0
FPD6
Text Label 8800 2000 2    50   ~ 0
FPD5
Text Label 8800 1900 2    50   ~ 0
FPD4
Text Label 8800 1800 2    50   ~ 0
FPD3
Text Label 8800 1700 2    50   ~ 0
FPD2
Text Label 8800 1600 2    50   ~ 0
FPD1
Text Label 8800 1500 2    50   ~ 0
FPD0
Wire Wire Line
	8550 1500 8850 1500
Wire Wire Line
	8550 1600 8850 1600
Wire Wire Line
	8550 1700 8850 1700
Wire Wire Line
	8550 1800 8850 1800
Wire Wire Line
	8550 1900 8850 1900
Wire Wire Line
	8550 2000 8850 2000
Wire Wire Line
	8550 2100 8850 2100
Wire Wire Line
	8550 2200 8850 2200
Entry Wire Line
	8850 1500 8950 1600
Entry Wire Line
	8850 1600 8950 1700
Entry Wire Line
	8850 1700 8950 1800
Entry Wire Line
	8850 1800 8950 1900
Entry Wire Line
	8850 1900 8950 2000
Entry Wire Line
	8850 2000 8950 2100
Entry Wire Line
	8850 2100 8950 2200
Entry Wire Line
	8850 2200 8950 2300
Entry Wire Line
	8850 4600 8950 4500
Entry Wire Line
	8850 4700 8950 4600
Entry Wire Line
	8850 4800 8950 4700
Entry Wire Line
	8850 4900 8950 4800
Entry Wire Line
	8850 5000 8950 4900
Entry Wire Line
	8850 5100 8950 5000
Entry Wire Line
	8850 5200 8950 5100
Entry Wire Line
	8850 5300 8950 5200
Wire Bus Line
	8950 2850 9050 2950
Wire Bus Line
	9050 2950 10650 2950
Entry Bus Bus
	5000 750  5100 850 
Wire Bus Line
	3350 750  5000 750 
Entry Wire Line
	5200 3100 5100 3000
Entry Wire Line
	5200 3200 5100 3100
Entry Wire Line
	5200 3300 5100 3200
Entry Wire Line
	5200 3400 5100 3300
Entry Wire Line
	5200 3500 5100 3400
Entry Wire Line
	5200 3600 5100 3500
Entry Wire Line
	5200 3700 5100 3600
Entry Wire Line
	5200 3800 5100 3700
Wire Wire Line
	5200 3100 5750 3100
Wire Wire Line
	5200 3200 5750 3200
Wire Wire Line
	5200 3300 5750 3300
Wire Wire Line
	5200 3400 5750 3400
Wire Wire Line
	5200 3500 5750 3500
Wire Wire Line
	5200 3600 5750 3600
Wire Wire Line
	5200 3700 5750 3700
Wire Wire Line
	5200 3800 5750 3800
Text Label 6950 3800 2    50   ~ 0
DB7
Text Label 6950 3700 2    50   ~ 0
DB6
Text Label 6950 3600 2    50   ~ 0
DB5
Text Label 6950 3500 2    50   ~ 0
DB4
Text Label 6950 3400 2    50   ~ 0
DB3
Text Label 6950 3300 2    50   ~ 0
DB2
Text Label 6950 3200 2    50   ~ 0
DB1
Text Label 6950 3100 2    50   ~ 0
DB0
Wire Wire Line
	6750 3100 7000 3100
Wire Wire Line
	6750 3200 7000 3200
Wire Wire Line
	6750 3300 7000 3300
Wire Wire Line
	6750 3400 7000 3400
Wire Wire Line
	6750 3500 7000 3500
Wire Wire Line
	6750 3600 7000 3600
Wire Wire Line
	6750 3700 7000 3700
Wire Wire Line
	6750 3800 7000 3800
Entry Wire Line
	7000 3100 7100 3200
Entry Wire Line
	7000 3200 7100 3300
Entry Wire Line
	7000 3300 7100 3400
Entry Wire Line
	7000 3400 7100 3500
Entry Wire Line
	7000 3500 7100 3600
Entry Wire Line
	7000 3600 7100 3700
Entry Wire Line
	7000 3700 7100 3800
Entry Wire Line
	7000 3800 7100 3900
Text Label 7250 3800 0    50   ~ 0
DB15
Text Label 7250 3700 0    50   ~ 0
DB14
Text Label 7250 3600 0    50   ~ 0
DB13
Text Label 7250 3500 0    50   ~ 0
DB12
Text Label 7250 3400 0    50   ~ 0
DB11
Text Label 7250 3300 0    50   ~ 0
DB10
Text Label 7250 3200 0    50   ~ 0
DB9
Text Label 7250 3100 0    50   ~ 0
DB8
Wire Wire Line
	7450 3100 7200 3100
Wire Wire Line
	7450 3200 7200 3200
Wire Wire Line
	7450 3300 7200 3300
Wire Wire Line
	7450 3400 7200 3400
Wire Wire Line
	7450 3500 7200 3500
Wire Wire Line
	7450 3600 7200 3600
Wire Wire Line
	7450 3700 7200 3700
Wire Wire Line
	7450 3800 7200 3800
Entry Wire Line
	7100 3900 7200 3800
Entry Wire Line
	7100 3800 7200 3700
Entry Wire Line
	7100 3700 7200 3600
Entry Wire Line
	7100 3600 7200 3500
Entry Wire Line
	7100 3500 7200 3400
Entry Wire Line
	7100 3400 7200 3300
Entry Wire Line
	7100 3300 7200 3200
Entry Wire Line
	7100 3200 7200 3100
Wire Bus Line
	7100 5950 7000 6050
Wire Bus Line
	7000 6050 1650 6050
Entry Wire Line
	1650 1500 1550 1600
Entry Wire Line
	1550 1800 1650 1700
Entry Wire Line
	1550 1900 1650 1800
Entry Wire Line
	1550 2000 1650 1900
Wire Wire Line
	1000 2100 1850 2100
Wire Wire Line
	1000 2300 1850 2300
Wire Bus Line
	1550 1600 1450 1500
Wire Bus Line
	1450 1500 1000 1500
Wire Bus Line
	1650 6050 1550 5950
Wire Wire Line
	1000 1200 3650 1200
Wire Wire Line
	1000 1300 3650 1300
Text Label 3600 1200 2    50   ~ 0
CLK2
Text Label 3600 1300 2    50   ~ 0
CLK3
Entry Wire Line
	3350 4450 3250 4550
Entry Wire Line
	3350 4350 3250 4450
Entry Wire Line
	3350 4250 3250 4350
Entry Wire Line
	3350 4150 3250 4250
Entry Wire Line
	3350 4050 3250 4150
Entry Wire Line
	3350 3950 3250 4050
Entry Wire Line
	3350 3850 3250 3950
Entry Wire Line
	3350 3750 3250 3850
Wire Bus Line
	3250 4750 3150 4850
Wire Bus Line
	3150 4850 2600 4850
Text HLabel 2600 4850 0    50   Input ~ 0
~IRQ[0..7]
Wire Wire Line
	5750 2400 5450 2400
Text HLabel 5450 2400 0    50   Input ~ 0
~RISR
Wire Wire Line
	5450 4000 5750 4000
Text Label 7300 2400 0    50   ~ 0
~FPIRF
Wire Wire Line
	6950 2400 7550 2400
Text HLabel 5450 5500 0    50   Input ~ 0
~FPIEN
Wire Wire Line
	5750 5500 5450 5500
Entry Wire Line
	5100 5200 5200 5300
Entry Wire Line
	5100 5100 5200 5200
Entry Wire Line
	5100 5000 5200 5100
Entry Wire Line
	5100 4900 5200 5000
Entry Wire Line
	5100 4800 5200 4900
Entry Wire Line
	5100 4700 5200 4800
Entry Wire Line
	5100 4600 5200 4700
Entry Wire Line
	5100 4500 5200 4600
Text Label 5400 5300 0    50   ~ 0
IEN7
Text Label 5400 5200 0    50   ~ 0
IEN6
Text Label 5400 5100 0    50   ~ 0
IEN5
Text Label 5400 5000 0    50   ~ 0
IEN4
Text Label 5400 4900 0    50   ~ 0
IEN3
Text Label 5400 4800 0    50   ~ 0
IEN2
Text Label 5400 4700 0    50   ~ 0
IEN1
Text Label 5400 4600 0    50   ~ 0
IEN0
Entry Wire Line
	5200 4600 5100 4500
Entry Wire Line
	5200 4700 5100 4600
Entry Wire Line
	5200 4800 5100 4700
Entry Wire Line
	5200 4900 5100 4800
Entry Wire Line
	5200 5000 5100 4900
Entry Wire Line
	5200 5100 5100 5000
Entry Wire Line
	5200 5200 5100 5100
Entry Wire Line
	5200 5300 5100 5200
Wire Wire Line
	5200 4600 5750 4600
Wire Wire Line
	5200 4700 5750 4700
Wire Wire Line
	5200 4800 5750 4800
Wire Wire Line
	5200 4900 5750 4900
Wire Wire Line
	5200 5000 5750 5000
Wire Wire Line
	5200 5100 5750 5100
Wire Wire Line
	5200 5200 5750 5200
Wire Wire Line
	5200 5300 5750 5300
Text Label 5500 5500 0    50   ~ 0
~FPIEN
Entry Bus Bus
	8950 3050 9050 2950
Text Label 8800 5300 2    50   ~ 0
FPD7
Text Label 8800 5200 2    50   ~ 0
FPD6
Text Label 8800 5100 2    50   ~ 0
FPD5
Text Label 8800 5000 2    50   ~ 0
FPD4
Text Label 8800 4900 2    50   ~ 0
FPD3
Text Label 8800 4800 2    50   ~ 0
FPD2
Text Label 8800 4700 2    50   ~ 0
FPD1
Text Label 8800 4600 2    50   ~ 0
FPD0
Wire Wire Line
	6750 4600 8850 4600
Wire Wire Line
	6750 4700 8850 4700
Wire Wire Line
	6750 4800 8850 4800
Wire Wire Line
	6750 4900 8850 4900
Wire Wire Line
	6750 5000 8850 5000
Wire Wire Line
	6750 5100 8850 5100
Wire Wire Line
	6750 5200 8850 5200
Wire Wire Line
	6750 5300 8850 5300
$Comp
L alexios:74LVC1G08 U?
U 1 1 5F173AB8
P 9250 4000
AR Path="/5F173AB8" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F173AB8" Ref="U?"  Part="1" 
F 0 "U?" H 9175 4267 50  0000 C CNN
F 1 "74LVC1G08" H 9175 4176 50  0000 C CNN
F 2 "" H 8900 4000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 8900 4000 50  0001 C CNN
	1    9250 4000
	-1   0    0    -1  
$EndComp
Text Label 9800 4050 2    50   ~ 0
~RIER
Wire Wire Line
	9550 4050 9800 4050
Text Label 9800 3950 2    50   ~ 0
~RISR
Wire Wire Line
	9550 3950 9800 3950
Text Label 2700 4850 0    50   ~ 0
~IRQ[0..7]
Text HLabel 6950 2400 0    50   Input ~ 0
~FPIRF
Wire Bus Line
	1550 1600 1550 5950
Wire Bus Line
	8950 3050 8950 5200
Wire Bus Line
	8950 1600 8950 2850
Wire Bus Line
	5300 1050 5300 2100
Wire Bus Line
	7200 1050 7200 2100
Wire Bus Line
	3250 850  3250 2100
Wire Bus Line
	5100 850  5100 5200
Wire Bus Line
	7100 1600 7100 5950
Wire Bus Line
	3250 2500 3250 4750
$EndSCHEMATC
