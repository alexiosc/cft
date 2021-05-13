EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 11
Title "ALU Port A"
Date "2019-11-17"
Rev "2020"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC574 U?
U 1 1 5DE7C9ED
P 5850 3050
AR Path="/5DE7C9ED" Ref="U?"  Part="1" 
AR Path="/5F597FD4/5DE7C9ED" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DE7C9ED" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DE7C9ED" Ref="U?"  Part="1" 
AR Path="/5DE1A95F/5DE7C9ED" Ref="U?"  Part="1" 
AR Path="/5DE6D8E0/5DE7C9ED" Ref="U301"  Part="1" 
F 0 "U301" H 5850 3817 50  0000 C CNN
F 1 "74HC574" H 5850 3726 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5550 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5550 3000 50  0001 C CNN
	1    5850 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 5DE7C9F3
P 5850 4550
AR Path="/5DE7C9F3" Ref="U?"  Part="1" 
AR Path="/5F597FD4/5DE7C9F3" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DE7C9F3" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DE7C9F3" Ref="U?"  Part="1" 
AR Path="/5DE1A95F/5DE7C9F3" Ref="U?"  Part="1" 
AR Path="/5DE6D8E0/5DE7C9F3" Ref="U302"  Part="1" 
F 0 "U302" H 5850 5317 50  0000 C CNN
F 1 "74HC574" H 5850 5226 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5550 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5550 4500 50  0001 C CNN
	1    5850 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE7C9F9
P 5350 3550
AR Path="/5DE7C9F9" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DE7C9F9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DE7C9F9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DE7C9F9" Ref="#PWR?"  Part="1" 
AR Path="/5DE1A95F/5DE7C9F9" Ref="#PWR?"  Part="1" 
AR Path="/5DE6D8E0/5DE7C9F9" Ref="#PWR0303"  Part="1" 
F 0 "#PWR0303" H 5350 3300 50  0001 C CNN
F 1 "GND" H 5355 3377 50  0000 C CNN
F 2 "" H 5350 3550 50  0001 C CNN
F 3 "" H 5350 3550 50  0001 C CNN
	1    5350 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE7C9FF
P 5350 5050
AR Path="/5DE7C9FF" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DE7C9FF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DE7C9FF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DE7C9FF" Ref="#PWR?"  Part="1" 
AR Path="/5DE1A95F/5DE7C9FF" Ref="#PWR?"  Part="1" 
AR Path="/5DE6D8E0/5DE7C9FF" Ref="#PWR0306"  Part="1" 
F 0 "#PWR0306" H 5350 4800 50  0001 C CNN
F 1 "GND" H 5355 4877 50  0000 C CNN
F 2 "" H 5350 5050 50  0001 C CNN
F 3 "" H 5350 5050 50  0001 C CNN
	1    5350 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2550 4850 2550
Wire Wire Line
	5350 2650 4850 2650
Wire Wire Line
	5350 2750 4850 2750
Wire Wire Line
	5350 2850 4850 2850
Wire Wire Line
	5350 2950 4850 2950
Wire Wire Line
	5350 3050 4850 3050
Wire Wire Line
	5350 3150 4850 3150
Wire Wire Line
	5350 3250 4850 3250
Entry Wire Line
	4750 2450 4850 2550
Entry Wire Line
	4750 2550 4850 2650
Entry Wire Line
	4750 2650 4850 2750
Entry Wire Line
	4750 2750 4850 2850
Entry Wire Line
	4750 2850 4850 2950
Entry Wire Line
	4750 2950 4850 3050
Entry Wire Line
	4750 3050 4850 3150
Entry Wire Line
	4750 3150 4850 3250
Wire Wire Line
	5350 4050 4850 4050
Wire Wire Line
	5350 4150 4850 4150
Wire Wire Line
	5350 4250 4850 4250
Wire Wire Line
	5350 4350 4850 4350
Wire Wire Line
	5350 4450 4850 4450
Wire Wire Line
	5350 4550 4850 4550
Wire Wire Line
	5350 4650 4850 4650
Wire Wire Line
	5350 4750 4850 4750
Entry Wire Line
	4750 3950 4850 4050
Entry Wire Line
	4750 4050 4850 4150
Entry Wire Line
	4750 4150 4850 4250
Entry Wire Line
	4750 4250 4850 4350
Entry Wire Line
	4750 4350 4850 4450
Entry Wire Line
	4750 4450 4850 4550
Entry Wire Line
	4750 4550 4850 4650
Entry Wire Line
	4750 4650 4850 4750
Wire Wire Line
	6350 3250 6650 3250
Wire Wire Line
	6350 3150 6650 3150
Wire Wire Line
	6350 3050 6650 3050
Wire Wire Line
	6350 2950 6650 2950
Wire Wire Line
	6350 2850 6650 2850
Wire Wire Line
	6350 2750 6650 2750
Wire Wire Line
	6350 2650 6650 2650
Wire Wire Line
	6350 2550 6650 2550
Entry Wire Line
	6750 3350 6650 3250
Entry Wire Line
	6750 3250 6650 3150
Entry Wire Line
	6750 3150 6650 3050
Entry Wire Line
	6750 3050 6650 2950
Entry Wire Line
	6750 2950 6650 2850
Entry Wire Line
	6750 2850 6650 2750
Entry Wire Line
	6750 2750 6650 2650
Entry Wire Line
	6750 2650 6650 2550
Wire Wire Line
	6350 4750 6650 4750
Wire Wire Line
	6350 4650 6650 4650
Wire Wire Line
	6350 4550 6650 4550
Wire Wire Line
	6350 4450 6650 4450
Wire Wire Line
	6350 4350 6650 4350
Wire Wire Line
	6350 4250 6650 4250
Wire Wire Line
	6350 4150 6650 4150
Wire Wire Line
	6350 4050 6650 4050
Entry Wire Line
	6750 4850 6650 4750
Entry Wire Line
	6750 4750 6650 4650
Entry Wire Line
	6750 4650 6650 4550
Entry Wire Line
	6750 4550 6650 4450
Entry Wire Line
	6750 4450 6650 4350
Entry Wire Line
	6750 4350 6650 4250
Entry Wire Line
	6750 4250 6650 4150
Entry Wire Line
	6750 4150 6650 4050
Text Label 4900 3450 0    50   ~ 0
ACP
Text Label 4900 4950 0    50   ~ 0
ACP
Text Label 5000 2550 0    50   ~ 0
AC0
Text Label 5000 2650 0    50   ~ 0
AC1
Text Label 5000 2750 0    50   ~ 0
AC2
Text Label 5000 2850 0    50   ~ 0
AC3
Text Label 5000 2950 0    50   ~ 0
AC4
Text Label 5000 3050 0    50   ~ 0
AC5
Text Label 5000 3150 0    50   ~ 0
AC6
Text Label 5000 3250 0    50   ~ 0
AC7
Text Label 5000 4050 0    50   ~ 0
AC8
Text Label 5000 4150 0    50   ~ 0
AC9
Text Label 5000 4250 0    50   ~ 0
AC10
Text Label 5000 4350 0    50   ~ 0
AC11
Text Label 5000 4450 0    50   ~ 0
AC12
Text Label 5000 4550 0    50   ~ 0
AC13
Text Label 5000 4650 0    50   ~ 0
AC14
Text Label 5000 4750 0    50   ~ 0
AC15
Text Label 6450 2550 0    50   ~ 0
A0
Text Label 6450 2650 0    50   ~ 0
A1
Text Label 6450 2750 0    50   ~ 0
A2
Text Label 6450 2850 0    50   ~ 0
A3
Text Label 6450 2950 0    50   ~ 0
A4
Text Label 6450 3050 0    50   ~ 0
A5
Text Label 6450 3150 0    50   ~ 0
A6
Text Label 6450 3250 0    50   ~ 0
A7
Text Label 6450 4050 0    50   ~ 0
A8
Text Label 6450 4150 0    50   ~ 0
A9
Text Label 6450 4250 0    50   ~ 0
A10
Text Label 6450 4350 0    50   ~ 0
A11
Text Label 6450 4450 0    50   ~ 0
A12
Text Label 6450 4550 0    50   ~ 0
A13
Text Label 6450 4650 0    50   ~ 0
A14
Text Label 6450 4750 0    50   ~ 0
A15
Entry Bus Bus
	4650 2200 4750 2300
Entry Bus Bus
	6750 5000 6850 5100
Wire Bus Line
	4650 2200 3300 2200
Wire Bus Line
	6850 5100 8150 5100
Text Label 7450 5100 0    50   ~ 0
A[0..15]
Text HLabel 8150 5100 2    50   3State ~ 0
A[0..15]
Text Label 3600 2200 0    50   ~ 0
AC[0..15]
Wire Wire Line
	3300 3450 4600 3450
Wire Wire Line
	4600 3450 4600 4950
Wire Wire Line
	4600 4950 5350 4950
Connection ~ 4600 3450
Wire Wire Line
	4600 3450 5350 3450
Text Label 4600 4350 1    50   ~ 0
ACP
Text Label 4750 4350 1    50   ~ 0
AC[0..15]
Text Label 3600 3450 0    50   ~ 0
ACP
Text HLabel 3300 3450 0    50   Input ~ 0
ACP
Text HLabel 3300 2200 0    50   Input ~ 0
AC[0..15]
$Comp
L alexios:74HC574 U?
U 2 1 5E6EEC61
P 7900 2900
AR Path="/5E6EEC61" Ref="U?"  Part="2" 
AR Path="/5F597FD4/5E6EEC61" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5CF23BD4/5E6EEC61" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5CF5A95E/5E6EEC61" Ref="U?"  Part="2" 
AR Path="/5DE1A95F/5E6EEC61" Ref="U?"  Part="2" 
AR Path="/5DEA5E6C/5E6EEC61" Ref="U?"  Part="2" 
AR Path="/5DE6D8E0/5E6EEC61" Ref="U301"  Part="2" 
F 0 "U301" H 8080 2946 50  0000 L CNN
F 1 "74HC574" H 8080 2855 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7600 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7600 2850 50  0001 C CNN
	2    7900 2900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5E6EEC67
P 7900 4450
AR Path="/5E6EEC67" Ref="U?"  Part="2" 
AR Path="/5F597FD4/5E6EEC67" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5CF23BD4/5E6EEC67" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5CF5A95E/5E6EEC67" Ref="U?"  Part="2" 
AR Path="/5DE1A95F/5E6EEC67" Ref="U?"  Part="2" 
AR Path="/5DEA5E6C/5E6EEC67" Ref="U?"  Part="2" 
AR Path="/5DE6D8E0/5E6EEC67" Ref="U302"  Part="2" 
F 0 "U302" H 8080 4496 50  0000 L CNN
F 1 "74HC574" H 8080 4405 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7600 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7600 4400 50  0001 C CNN
	2    7900 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E6EEC6D
P 7550 2900
AR Path="/5CC0D65F/5E6EEC6D" Ref="C?"  Part="1" 
AR Path="/5E6EEC6D" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E6EEC6D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E6EEC6D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E6EEC6D" Ref="C?"  Part="1" 
AR Path="/5DE1A95F/5E6EEC6D" Ref="C?"  Part="1" 
AR Path="/5DEA5E6C/5E6EEC6D" Ref="C?"  Part="1" 
AR Path="/5DE6D8E0/5E6EEC6D" Ref="C301"  Part="1" 
F 0 "C301" H 7459 2946 50  0000 R CNN
F 1 "100nF" H 7459 2855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7550 2900 50  0001 C CNN
F 3 "~" H 7550 2900 50  0001 C CNN
	1    7550 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E6EEC73
P 7550 4450
AR Path="/5CC0D65F/5E6EEC73" Ref="C?"  Part="1" 
AR Path="/5E6EEC73" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E6EEC73" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E6EEC73" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E6EEC73" Ref="C?"  Part="1" 
AR Path="/5DE1A95F/5E6EEC73" Ref="C?"  Part="1" 
AR Path="/5DEA5E6C/5E6EEC73" Ref="C?"  Part="1" 
AR Path="/5DE6D8E0/5E6EEC73" Ref="C302"  Part="1" 
F 0 "C302" H 7459 4496 50  0000 R CNN
F 1 "100nF" H 7459 4405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7550 4450 50  0001 C CNN
F 3 "~" H 7550 4450 50  0001 C CNN
	1    7550 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E6EEC79
P 7550 4550
AR Path="/5E6EEC79" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E6EEC79" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E6EEC79" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E6EEC79" Ref="#PWR?"  Part="1" 
AR Path="/5DE1A95F/5E6EEC79" Ref="#PWR?"  Part="1" 
AR Path="/5DEA5E6C/5E6EEC79" Ref="#PWR?"  Part="1" 
AR Path="/5DE6D8E0/5E6EEC79" Ref="#PWR0305"  Part="1" 
F 0 "#PWR0305" H 7550 4300 50  0001 C CNN
F 1 "GND" H 7555 4377 50  0000 C CNN
F 2 "" H 7550 4550 50  0001 C CNN
F 3 "" H 7550 4550 50  0001 C CNN
	1    7550 4550
	1    0    0    -1  
$EndComp
Connection ~ 7550 4550
$Comp
L power:GND #PWR?
U 1 1 5E6EEC80
P 7550 3000
AR Path="/5E6EEC80" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E6EEC80" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E6EEC80" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E6EEC80" Ref="#PWR?"  Part="1" 
AR Path="/5DE1A95F/5E6EEC80" Ref="#PWR?"  Part="1" 
AR Path="/5DEA5E6C/5E6EEC80" Ref="#PWR?"  Part="1" 
AR Path="/5DE6D8E0/5E6EEC80" Ref="#PWR0302"  Part="1" 
F 0 "#PWR0302" H 7550 2750 50  0001 C CNN
F 1 "GND" H 7555 2827 50  0000 C CNN
F 2 "" H 7550 3000 50  0001 C CNN
F 3 "" H 7550 3000 50  0001 C CNN
	1    7550 3000
	1    0    0    -1  
$EndComp
Connection ~ 7550 3000
$Comp
L power:+5V #PWR?
U 1 1 5E6EEC87
P 7550 2800
AR Path="/5E6EEC87" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E6EEC87" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E6EEC87" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E6EEC87" Ref="#PWR?"  Part="1" 
AR Path="/5DE1A95F/5E6EEC87" Ref="#PWR?"  Part="1" 
AR Path="/5DEA5E6C/5E6EEC87" Ref="#PWR?"  Part="1" 
AR Path="/5DE6D8E0/5E6EEC87" Ref="#PWR0301"  Part="1" 
F 0 "#PWR0301" H 7550 2650 50  0001 C CNN
F 1 "+5V" H 7565 2973 50  0000 C CNN
F 2 "" H 7550 2800 50  0001 C CNN
F 3 "" H 7550 2800 50  0001 C CNN
	1    7550 2800
	1    0    0    -1  
$EndComp
Connection ~ 7550 2800
$Comp
L power:+5V #PWR?
U 1 1 5E6EEC8E
P 7550 4350
AR Path="/5E6EEC8E" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E6EEC8E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E6EEC8E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E6EEC8E" Ref="#PWR?"  Part="1" 
AR Path="/5DE1A95F/5E6EEC8E" Ref="#PWR?"  Part="1" 
AR Path="/5DEA5E6C/5E6EEC8E" Ref="#PWR?"  Part="1" 
AR Path="/5DE6D8E0/5E6EEC8E" Ref="#PWR0304"  Part="1" 
F 0 "#PWR0304" H 7550 4200 50  0001 C CNN
F 1 "+5V" H 7565 4523 50  0000 C CNN
F 2 "" H 7550 4350 50  0001 C CNN
F 3 "" H 7550 4350 50  0001 C CNN
	1    7550 4350
	1    0    0    -1  
$EndComp
Connection ~ 7550 4350
Wire Bus Line
	6750 2650 6750 5000
Wire Bus Line
	4750 2300 4750 4650
$EndSCHEMATC
