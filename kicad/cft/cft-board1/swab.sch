EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 20 20
Title "Byte Swap Unit (SWAB)"
Date ""
Rev "2023"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 4850 2550 0    50   ~ 0
AC0
Text Label 4850 2450 0    50   ~ 0
AC1
Text Label 4850 2950 0    50   ~ 0
AC3
Text Label 4850 2850 0    50   ~ 0
AC5
Text Label 4850 3050 0    50   ~ 0
AC6
Text Label 4850 3150 0    50   ~ 0
AC7
Wire Wire Line
	6600 3150 6250 3150
Wire Wire Line
	6600 3050 6250 3050
Wire Wire Line
	6600 2850 6250 2850
Wire Wire Line
	6250 4350 6600 4350
Wire Wire Line
	6600 2650 6250 2650
Wire Wire Line
	6600 2550 6250 2550
Wire Wire Line
	6600 4150 6250 4150
Wire Wire Line
	6250 2450 6600 2450
Text Label 6300 2550 0    50   ~ 0
IBUS8
Text Label 6300 2450 0    50   ~ 0
IBUS9
Text Label 6300 2750 0    50   ~ 0
IBUS10
Text Label 6300 2950 0    50   ~ 0
IBUS11
Text Label 6300 2650 0    50   ~ 0
IBUS12
Text Label 6300 2850 0    50   ~ 0
IBUS13
Text Label 6300 3050 0    50   ~ 0
IBUS14
Text Label 6300 3150 0    50   ~ 0
IBUS15
Wire Wire Line
	5250 3450 5150 3450
Wire Wire Line
	5250 3350 5050 3350
Text Label 3300 3350 0    50   ~ 0
CLK1
Text Label 3300 3450 0    50   ~ 0
~READ-SWAB
Wire Wire Line
	5250 5150 5150 5150
Wire Wire Line
	5250 5050 5050 5050
Wire Wire Line
	5150 3450 5150 5150
Connection ~ 5150 3450
Wire Wire Line
	5050 3350 5050 5050
Connection ~ 5050 3350
Wire Wire Line
	5050 3350 3250 3350
Text HLabel 3250 3350 0    50   Input ~ 0
CLK1
Text HLabel 3250 3450 0    50   Input ~ 0
~READ-SWAB
Wire Wire Line
	3250 3450 5150 3450
Text Label 4800 4150 0    50   ~ 0
AC8
Text Label 4800 4250 0    50   ~ 0
AC9
Text Label 4800 4450 0    50   ~ 0
AC10
Text Label 4800 4650 0    50   ~ 0
AC11
Text Label 4800 4850 0    50   ~ 0
AC12
Text Label 4800 4750 0    50   ~ 0
AC13
Text Label 4800 4550 0    50   ~ 0
AC14
Text Label 4800 4350 0    50   ~ 0
AC15
Wire Wire Line
	4750 2450 5250 2450
Wire Wire Line
	4750 4150 5250 4150
Wire Wire Line
	4750 2550 5250 2550
Wire Wire Line
	4750 2650 5250 2650
Wire Wire Line
	4750 4350 5250 4350
Wire Wire Line
	4750 2850 5250 2850
Wire Wire Line
	4750 3050 5250 3050
Wire Wire Line
	4750 3150 5250 3150
Wire Wire Line
	4750 4250 5250 4250
Wire Wire Line
	4750 4450 5250 4450
Wire Wire Line
	4750 4650 5250 4650
Wire Wire Line
	4750 4850 5250 4850
Wire Wire Line
	4750 4750 5250 4750
Wire Wire Line
	4750 4550 5250 4550
Entry Wire Line
	4650 2350 4750 2450
Entry Wire Line
	4650 2450 4750 2550
Entry Wire Line
	4650 2550 4750 2650
Entry Wire Line
	4650 2650 4750 2750
Entry Wire Line
	4650 2750 4750 2850
Entry Wire Line
	4650 2850 4750 2950
Entry Wire Line
	4650 2950 4750 3050
Entry Wire Line
	4650 3050 4750 3150
Entry Wire Line
	4650 4050 4750 4150
Entry Wire Line
	4650 4150 4750 4250
Entry Wire Line
	4650 4250 4750 4350
Entry Wire Line
	4650 4350 4750 4450
Entry Wire Line
	4650 4450 4750 4550
Entry Wire Line
	4650 4550 4750 4650
Entry Wire Line
	4650 4650 4750 4750
Entry Wire Line
	4650 4750 4750 4850
Entry Bus Bus
	4550 2150 4650 2250
Wire Bus Line
	4550 2150 3250 2150
Text Label 3300 2150 0    50   ~ 0
AC[0..15]
Text HLabel 3250 2150 0    50   BiDi ~ 0
AC[0..15]
Entry Wire Line
	6700 2550 6600 2450
Entry Wire Line
	6700 2650 6600 2550
Entry Wire Line
	6700 2750 6600 2650
Entry Wire Line
	6700 2850 6600 2750
Entry Wire Line
	6700 2950 6600 2850
Entry Wire Line
	6700 3050 6600 2950
Entry Wire Line
	6700 3150 6600 3050
Entry Wire Line
	6700 3250 6600 3150
Wire Wire Line
	6600 4550 6250 4550
Wire Wire Line
	6600 4750 6250 4750
Wire Wire Line
	6250 4850 6600 4850
Wire Wire Line
	6600 4650 6250 4650
Wire Wire Line
	6600 4450 6250 4450
Wire Wire Line
	6600 4250 6250 4250
Text Label 6300 4150 0    50   ~ 0
IBUS0
Text Label 6300 4250 0    50   ~ 0
IBUS1
Text Label 6300 4450 0    50   ~ 0
IBUS2
Text Label 6300 4650 0    50   ~ 0
IBUS3
Text Label 6300 4850 0    50   ~ 0
IBUS4
Text Label 6300 4750 0    50   ~ 0
IBUS5
Text Label 6300 4550 0    50   ~ 0
IBUS6
Text Label 6300 4350 0    50   ~ 0
IBUS7
Entry Wire Line
	6700 4250 6600 4150
Entry Wire Line
	6700 4350 6600 4250
Entry Wire Line
	6700 4450 6600 4350
Entry Wire Line
	6700 4550 6600 4450
Entry Wire Line
	6700 4650 6600 4550
Entry Wire Line
	6700 4750 6600 4650
Entry Wire Line
	6700 4850 6600 4750
Entry Wire Line
	6700 4950 6600 4850
Text Label 6700 3450 3    50   ~ 0
IBUS[0..15]
Entry Bus Bus
	6800 5150 6700 5050
Wire Bus Line
	6800 5150 7550 5150
Text HLabel 7550 5150 2    50   BiDi ~ 0
IBUS[0..15]
Text Label 7050 5150 0    50   ~ 0
IBUS[0..15]
$Comp
L Device:C_Small C?
U 1 1 619BE1B1
P 8050 4450
AR Path="/5CC0D65F/619BE1B1" Ref="C?"  Part="1" 
AR Path="/5CE16E65/619BE1B1" Ref="C?"  Part="1" 
AR Path="/619BE1B1" Ref="C?"  Part="1" 
AR Path="/5D54E677/619BE1B1" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/619BE1B1" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/619BE1B1" Ref="C?"  Part="1" 
AR Path="/5D892D5E/619BE1B1" Ref="C?"  Part="1" 
AR Path="/5D9672D4/619BE1B1" Ref="C?"  Part="1" 
AR Path="/5D9746C5/619BE1B1" Ref="C?"  Part="1" 
AR Path="/6141B730/619BE1B1" Ref="C902"  Part="1" 
F 0 "C902" H 7959 4496 50  0000 R CNN
F 1 "100nF" H 7959 4405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 4450 50  0001 C CNN
F 3 "~" H 8050 4450 50  0001 C CNN
	1    8050 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 619BE1B7
P 8050 4350
AR Path="/5CE16E65/619BE1B7" Ref="#PWR?"  Part="1" 
AR Path="/619BE1B7" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/619BE1B7" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/619BE1B7" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/619BE1B7" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/619BE1B7" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/619BE1B7" Ref="#PWR?"  Part="1" 
AR Path="/5D9746C5/619BE1B7" Ref="#PWR?"  Part="1" 
AR Path="/6141B730/619BE1B7" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 8050 4200 50  0001 C CNN
F 1 "+5V" H 8065 4523 50  0000 C CNN
F 2 "" H 8050 4350 50  0001 C CNN
F 3 "" H 8050 4350 50  0001 C CNN
	1    8050 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 619BE1BE
P 8050 4550
AR Path="/5CE16E65/619BE1BE" Ref="#PWR?"  Part="1" 
AR Path="/619BE1BE" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/619BE1BE" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/619BE1BE" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/619BE1BE" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/619BE1BE" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/619BE1BE" Ref="#PWR?"  Part="1" 
AR Path="/5D9746C5/619BE1BE" Ref="#PWR?"  Part="1" 
AR Path="/6141B730/619BE1BE" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 8050 4300 50  0001 C CNN
F 1 "GND" H 8055 4377 50  0000 C CNN
F 2 "" H 8050 4550 50  0001 C CNN
F 3 "" H 8050 4550 50  0001 C CNN
	1    8050 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 619F320E
P 8050 2850
AR Path="/5CC0D65F/619F320E" Ref="C?"  Part="1" 
AR Path="/5CE16E65/619F320E" Ref="C?"  Part="1" 
AR Path="/619F320E" Ref="C?"  Part="1" 
AR Path="/5D54E677/619F320E" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/619F320E" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/619F320E" Ref="C?"  Part="1" 
AR Path="/5D892D5E/619F320E" Ref="C?"  Part="1" 
AR Path="/5D9672D4/619F320E" Ref="C?"  Part="1" 
AR Path="/5D9746C5/619F320E" Ref="C?"  Part="1" 
AR Path="/6141B730/619F320E" Ref="C901"  Part="1" 
F 0 "C901" H 7959 2896 50  0000 R CNN
F 1 "100nF" H 7959 2805 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 2850 50  0001 C CNN
F 3 "~" H 8050 2850 50  0001 C CNN
	1    8050 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 619F3214
P 8050 2750
AR Path="/5CE16E65/619F3214" Ref="#PWR?"  Part="1" 
AR Path="/619F3214" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/619F3214" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/619F3214" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/619F3214" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/619F3214" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/619F3214" Ref="#PWR?"  Part="1" 
AR Path="/5D9746C5/619F3214" Ref="#PWR?"  Part="1" 
AR Path="/6141B730/619F3214" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 8050 2600 50  0001 C CNN
F 1 "+5V" H 8065 2923 50  0000 C CNN
F 2 "" H 8050 2750 50  0001 C CNN
F 3 "" H 8050 2750 50  0001 C CNN
	1    8050 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 619F321A
P 8050 2950
AR Path="/5CE16E65/619F321A" Ref="#PWR?"  Part="1" 
AR Path="/619F321A" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/619F321A" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/619F321A" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/619F321A" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/619F321A" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/619F321A" Ref="#PWR?"  Part="1" 
AR Path="/5D9746C5/619F321A" Ref="#PWR?"  Part="1" 
AR Path="/6141B730/619F321A" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 8050 2700 50  0001 C CNN
F 1 "GND" H 8055 2777 50  0000 C CNN
F 2 "" H 8050 2950 50  0001 C CNN
F 3 "" H 8050 2950 50  0001 C CNN
	1    8050 2950
	1    0    0    -1  
$EndComp
Text Notes 2350 3050 0    50   ~ 0
Clock data in from AC on the rising edge of CLK1.\nThis is before T34 is active, when the AC is written to,\nso the output of the SWAB unit won't change as the\nAC latches data.
$Comp
L alexios:74HC574 U901
U 1 1 61C5AF56
P 5750 2950
F 0 "U901" H 5750 3717 50  0000 C CNN
F 1 "74HC574" H 5750 3626 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5450 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 5450 2900 50  0001 C CNN
F 4 "Yes" H 5600 2000 50  0001 C CNN "Verified"
	1    5750 2950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U902
U 1 1 61C5BFD5
P 5750 4650
F 0 "U902" H 5750 5417 50  0000 C CNN
F 1 "74HC574" H 5750 5326 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5450 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 5450 4600 50  0001 C CNN
F 4 "Yes" H 5600 3700 50  0001 C CNN "Verified"
	1    5750 4650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U901
U 2 1 61C5CAEC
P 8400 2850
F 0 "U901" H 8580 2896 50  0000 L CNN
F 1 "74HC574" H 8580 2805 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8100 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 8100 2800 50  0001 C CNN
F 4 "Yes" H 8250 1900 50  0001 C CNN "Verified"
	2    8400 2850
	1    0    0    -1  
$EndComp
Connection ~ 8050 2950
Connection ~ 8050 2750
$Comp
L alexios:74HC574 U902
U 2 1 61C5E5ED
P 8400 4450
F 0 "U902" H 8580 4496 50  0000 L CNN
F 1 "74HC574" H 8580 4405 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8100 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 8100 4400 50  0001 C CNN
F 4 "Yes" H 8250 3500 50  0001 C CNN "Verified"
	2    8400 4450
	1    0    0    -1  
$EndComp
Connection ~ 8050 4550
Connection ~ 8050 4350
Text Label 4850 2750 0    50   ~ 0
AC2
Text Label 4850 2650 0    50   ~ 0
AC4
Wire Wire Line
	4750 2750 5250 2750
Wire Wire Line
	6250 2750 6600 2750
Wire Wire Line
	4750 2950 5250 2950
Wire Wire Line
	6250 2950 6600 2950
Wire Bus Line
	6700 2550 6700 5050
Wire Bus Line
	4650 2250 4650 4750
$EndSCHEMATC
