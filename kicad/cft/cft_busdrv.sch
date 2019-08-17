EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 35
Title "CFT Homebrew 16-bit Minicomputer"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC245 U1601
U 2 1 5D4E2D5D
P 7800 3350
F 0 "U1601" H 7980 3796 50  0000 L CNN
F 1 "74HC245" H 7980 3705 50  0000 L CNN
F 2 "" H 7800 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 7800 3400 50  0001 C CNN
	2    7800 3350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U1602
U 2 1 5D4E2D63
P 7800 4700
F 0 "U1602" H 7980 5146 50  0000 L CNN
F 1 "74HC245" H 7980 5055 50  0000 L CNN
F 2 "" H 7800 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 7800 4750 50  0001 C CNN
	2    7800 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4E2D69
P 7450 2950
AR Path="/5CC0D65F/5D4E2D69" Ref="C?"  Part="1" 
AR Path="/5D4E2D69" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/5D4E2D69" Ref="C1601"  Part="1" 
F 0 "C1601" H 7359 2996 50  0000 R CNN
F 1 "100nF" H 7359 2905 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7450 2950 50  0001 C CNN
F 3 "~" H 7450 2950 50  0001 C CNN
	1    7450 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4E2D6F
P 7450 4300
AR Path="/5CC0D65F/5D4E2D6F" Ref="C?"  Part="1" 
AR Path="/5D4E2D6F" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/5D4E2D6F" Ref="C1602"  Part="1" 
F 0 "C1602" H 7359 4346 50  0000 R CNN
F 1 "100nF" H 7359 4255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7450 4300 50  0001 C CNN
F 3 "~" H 7450 4300 50  0001 C CNN
	1    7450 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01604
U 1 1 5D4E2D75
P 7450 4400
F 0 "#PWR01604" H 7450 4150 50  0001 C CNN
F 1 "GND" H 7455 4227 50  0000 C CNN
F 2 "" H 7450 4400 50  0001 C CNN
F 3 "" H 7450 4400 50  0001 C CNN
	1    7450 4400
	1    0    0    -1  
$EndComp
Connection ~ 7450 4400
$Comp
L power:GND #PWR01602
U 1 1 5D4E2D7C
P 7450 3050
F 0 "#PWR01602" H 7450 2800 50  0001 C CNN
F 1 "GND" H 7455 2877 50  0000 C CNN
F 2 "" H 7450 3050 50  0001 C CNN
F 3 "" H 7450 3050 50  0001 C CNN
	1    7450 3050
	1    0    0    -1  
$EndComp
Connection ~ 7450 3050
$Comp
L power:+5V #PWR01601
U 1 1 5D4E2D83
P 7450 2850
F 0 "#PWR01601" H 7450 2700 50  0001 C CNN
F 1 "+5V" H 7465 3023 50  0000 C CNN
F 2 "" H 7450 2850 50  0001 C CNN
F 3 "" H 7450 2850 50  0001 C CNN
	1    7450 2850
	1    0    0    -1  
$EndComp
Connection ~ 7450 2850
$Comp
L power:+5V #PWR01603
U 1 1 5D4E2D8A
P 7450 4200
F 0 "#PWR01603" H 7450 4050 50  0001 C CNN
F 1 "+5V" H 7465 4373 50  0000 C CNN
F 2 "" H 7450 4200 50  0001 C CNN
F 3 "" H 7450 4200 50  0001 C CNN
	1    7450 4200
	1    0    0    -1  
$EndComp
Connection ~ 7450 4200
Text Label 6450 4000 1    50   ~ 0
DB[0..15]
Text Label 4550 4300 1    50   ~ 0
IBUS[0..15]
Entry Wire Line
	4550 4850 4650 4950
Entry Wire Line
	4550 4750 4650 4850
Entry Wire Line
	4550 4650 4650 4750
Entry Wire Line
	4550 4550 4650 4650
Entry Wire Line
	4550 4450 4650 4550
Entry Wire Line
	4550 4350 4650 4450
Entry Wire Line
	4550 4250 4650 4350
Entry Wire Line
	4550 4150 4650 4250
Entry Wire Line
	4550 3350 4650 3450
Entry Wire Line
	4550 3250 4650 3350
Entry Wire Line
	4550 3150 4650 3250
Entry Wire Line
	4550 3050 4650 3150
Entry Wire Line
	4550 2950 4650 3050
Entry Wire Line
	4550 2850 4650 2950
Entry Wire Line
	4550 2750 4650 2850
Entry Wire Line
	4550 2650 4650 2750
Text Label 6050 4950 0    50   ~ 0
DB15
Text Label 6050 4850 0    50   ~ 0
DB14
Text Label 6050 4750 0    50   ~ 0
DB13
Text Label 6050 4650 0    50   ~ 0
DB12
Text Label 6050 4550 0    50   ~ 0
DB11
Text Label 6050 4450 0    50   ~ 0
DB10
Text Label 6050 4350 0    50   ~ 0
DB9
Text Label 6050 4250 0    50   ~ 0
DB8
Text Label 6050 3450 0    50   ~ 0
DB7
Text Label 6050 3350 0    50   ~ 0
DB6
Text Label 6050 3250 0    50   ~ 0
DB5
Text Label 6050 3150 0    50   ~ 0
DB4
Text Label 6050 3050 0    50   ~ 0
DB3
Text Label 6050 2950 0    50   ~ 0
DB2
Text Label 6050 2850 0    50   ~ 0
DB1
Text Label 6050 2750 0    50   ~ 0
DB0
Wire Wire Line
	6000 4950 6350 4950
Wire Wire Line
	6000 4850 6350 4850
Wire Wire Line
	6000 4750 6350 4750
Wire Wire Line
	6000 4650 6350 4650
Wire Wire Line
	6000 4550 6350 4550
Wire Wire Line
	6000 4450 6350 4450
Wire Wire Line
	6000 4350 6350 4350
Wire Wire Line
	6000 4250 6350 4250
Wire Wire Line
	6000 3450 6350 3450
Wire Wire Line
	6000 3350 6350 3350
Wire Wire Line
	6000 3250 6350 3250
Wire Wire Line
	6000 3150 6350 3150
Wire Wire Line
	6000 3050 6350 3050
Wire Wire Line
	6000 2950 6350 2950
Wire Wire Line
	6000 2850 6350 2850
Wire Wire Line
	6000 2750 6350 2750
Text Label 4750 4950 0    50   ~ 0
IBUS15
Text Label 4750 4850 0    50   ~ 0
IBUS14
Text Label 4750 4750 0    50   ~ 0
IBUS13
Text Label 4750 4650 0    50   ~ 0
IBUS12
Text Label 4750 4550 0    50   ~ 0
IBUS11
Text Label 4750 4450 0    50   ~ 0
IBUS10
Text Label 4750 4350 0    50   ~ 0
IBUS9
Text Label 4750 4250 0    50   ~ 0
IBUS8
Text Label 4700 3450 0    50   ~ 0
IBUS7
Text Label 4700 3350 0    50   ~ 0
IBUS6
Text Label 4700 3250 0    50   ~ 0
IBUS5
Text Label 4700 3150 0    50   ~ 0
IBUS4
Text Label 4700 3050 0    50   ~ 0
IBUS3
Text Label 4700 2950 0    50   ~ 0
IBUS2
Text Label 4700 2850 0    50   ~ 0
IBUS1
Text Label 4700 2750 0    50   ~ 0
IBUS0
Wire Wire Line
	5000 4950 4650 4950
Wire Wire Line
	5000 4850 4650 4850
Wire Wire Line
	5000 4750 4650 4750
Wire Wire Line
	5000 4650 4650 4650
Wire Wire Line
	5000 4550 4650 4550
Wire Wire Line
	5000 4450 4650 4450
Wire Wire Line
	5000 4350 4650 4350
Wire Wire Line
	5000 4250 4650 4250
Wire Wire Line
	5000 3450 4650 3450
Wire Wire Line
	5000 3350 4650 3350
Wire Wire Line
	5000 3250 4650 3250
Wire Wire Line
	5000 3150 4650 3150
Wire Wire Line
	5000 3050 4650 3050
Wire Wire Line
	5000 2950 4650 2950
Wire Wire Line
	5000 2850 4650 2850
Wire Wire Line
	5000 2750 4650 2750
$Comp
L alexios:74HC245 U1602
U 1 1 5D4E2DF7
P 5500 4750
F 0 "U1602" H 5500 5517 50  0000 C CNN
F 1 "74HC245" H 5500 5426 50  0000 C CNN
F 2 "" H 5500 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 5500 4800 50  0001 C CNN
	1    5500 4750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U1601
U 1 1 5D4E2DFD
P 5500 3250
F 0 "U1601" H 5500 4017 50  0000 C CNN
F 1 "74HC245" H 5500 3926 50  0000 C CNN
F 2 "" H 5500 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 5500 3300 50  0001 C CNN
	1    5500 3250
	1    0    0    -1  
$EndComp
Wire Bus Line
	4450 2400 3350 2400
Wire Bus Line
	6550 5300 8850 5300
Entry Bus Bus
	6450 5200 6550 5300
Text Label 6750 5300 0    50   ~ 0
DB[0..15]
Text HLabel 8850 5300 2    50   3State ~ 0
DB[0..15]
Entry Bus Bus
	4450 2400 4550 2500
Text Label 3750 2400 0    50   ~ 0
IBUS[0..15]
Text HLabel 3350 2400 0    50   3State ~ 0
IBUS[0..15]
Wire Wire Line
	3350 3650 4350 3650
Wire Wire Line
	4350 3650 4350 5150
Wire Wire Line
	4350 5150 5000 5150
Connection ~ 4350 3650
Wire Wire Line
	4350 3650 5000 3650
Text Label 4700 3650 0    50   ~ 0
~R
Text Label 4700 5150 0    50   ~ 0
~R
Text Label 3750 3650 0    50   ~ 0
~R
Text HLabel 3350 3650 0    50   Input ~ 0
~R
Wire Wire Line
	3350 3750 4200 3750
Wire Wire Line
	4200 3750 4200 5250
Wire Wire Line
	4200 5250 5000 5250
Connection ~ 4200 3750
Wire Wire Line
	4200 3750 5000 3750
Text Label 3750 3750 0    50   ~ 0
~BUSEN
Text Label 4350 4300 1    50   ~ 0
~R
Text Label 4200 4300 1    50   ~ 0
~BUSEN
Text Label 4700 5250 0    50   ~ 0
~BUSEN
Entry Wire Line
	6350 2750 6450 2850
Entry Wire Line
	6350 2850 6450 2950
Entry Wire Line
	6350 2950 6450 3050
Entry Wire Line
	6350 3050 6450 3150
Entry Wire Line
	6350 3150 6450 3250
Entry Wire Line
	6350 3250 6450 3350
Entry Wire Line
	6350 3350 6450 3450
Entry Wire Line
	6350 3450 6450 3550
Entry Wire Line
	6350 4250 6450 4350
Entry Wire Line
	6350 4350 6450 4450
Entry Wire Line
	6350 4450 6450 4550
Entry Wire Line
	6350 4550 6450 4650
Entry Wire Line
	6350 4650 6450 4750
Entry Wire Line
	6350 4750 6450 4850
Entry Wire Line
	6350 4850 6450 4950
Entry Wire Line
	6350 4950 6450 5050
Text Notes 7100 6950 0    197  ~ 39
Data Bus Driver
Text HLabel 3350 3750 0    50   Input ~ 0
~BUSEN
Wire Bus Line
	6450 2850 6450 5200
Wire Bus Line
	4550 2500 4550 4850
$EndSCHEMATC
