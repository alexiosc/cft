EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 24 30
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 9950 3250 2    50   Output ~ 0
FV
Text Label 8300 3450 2    50   ~ 0
CLK4
Text Label 6700 3650 2    50   ~ 0
~RESET
Text Label 9350 3250 0    50   ~ 0
FV
Text Label 6700 3550 2    50   ~ 0
CLKL
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D366A62
P 3500 4350
AR Path="/5DC89E19/5D366A62" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A62" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D366A62" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D366A62" Ref="U?"  Part="1" 
AR Path="/5D35C694/5D366A62" Ref="U3216"  Part="1" 
F 0 "U3216" H 3425 4617 50  0000 C CNN
F 1 "74LVC1G08" H 3425 4526 50  0000 C CNN
F 2 "" H 3150 4350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 3150 4350 50  0001 C CNN
	1    3500 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3550 7850 3550
Text Label 8300 3550 2    50   ~ 0
~RESET
$Comp
L power:+5V #PWR?
U 1 1 5D366A6A
P 8300 3200
AR Path="/5DC89E19/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366A6A" Ref="#PWR03243"  Part="1" 
F 0 "#PWR03243" H 8300 3050 50  0001 C CNN
F 1 "+5V" H 8315 3373 50  0000 C CNN
F 2 "" H 8300 3200 50  0001 C CNN
F 3 "" H 8300 3200 50  0001 C CNN
	1    8300 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3200 8300 3250
Wire Wire Line
	8300 3250 8350 3250
Wire Wire Line
	6000 3650 6700 3650
Text Label 6700 3450 2    50   ~ 0
VD
$Comp
L alexios:74HC74 U?
U 1 1 5D366A74
P 7150 3500
AR Path="/5DC89E19/5D366A74" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A74" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D366A74" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D366A74" Ref="U?"  Part="1" 
AR Path="/5D35C694/5D366A74" Ref="U3217"  Part="1" 
F 0 "U3217" H 7150 3917 50  0000 C CNN
F 1 "74HC74" H 7150 3826 50  0000 C CNN
F 2 "" H 7100 3650 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7100 3650 50  0001 C CNN
	1    7150 3500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 5D366A7A
P 8800 3400
AR Path="/5DC89E19/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D98F946/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5D13B20C/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5D35C694/5D366A7A" Ref="U3217"  Part="2" 
F 0 "U3217" H 8800 3817 50  0000 C CNN
F 1 "74HC74" H 8800 3726 50  0000 C CNN
F 2 "" H 8750 3550 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 8750 3550 50  0001 C CNN
	2    8800 3400
	1    0    0    -1  
$EndComp
Text HLabel 2050 4400 0    50   Input ~ 0
~READ-ALU-ADD
Wire Wire Line
	7950 3450 8350 3450
Text Notes 7100 7000 0    197  ~ 39
The Overflow Register (V)
$Comp
L alexios:74LVC1G08 U?
U 2 1 5D366A83
P 4250 7300
AR Path="/5DC89E19/5D366A83" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A83" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D366A83" Ref="U?"  Part="2" 
AR Path="/5D13B20C/5D366A83" Ref="U?"  Part="2" 
AR Path="/5D35C694/5D366A83" Ref="U2603"  Part="2" 
F 0 "U2603" H 4330 7246 50  0000 L CNN
F 1 "74LVC1G08" H 4330 7155 50  0000 L CNN
F 2 "" H 3900 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 3900 7300 50  0001 C CNN
	2    4250 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D366A89
P 900 7400
AR Path="/5CC0D65F/5D366A89" Ref="C?"  Part="1" 
AR Path="/5D366A89" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D366A89" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366A89" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366A89" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D366A89" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A89" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D366A89" Ref="C?"  Part="1" 
AR Path="/5D13B20C/5D366A89" Ref="C?"  Part="1" 
AR Path="/5D35C694/5D366A89" Ref="C3213"  Part="1" 
F 0 "C3213" H 809 7446 50  0000 R CNN
F 1 "100nF" H 809 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 900 7400 50  0001 C CNN
F 3 "~" H 900 7400 50  0001 C CNN
	1    900  7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D366A8F
P 900 7500
AR Path="/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366A8F" Ref="#PWR03233"  Part="1" 
F 0 "#PWR03233" H 900 7250 50  0001 C CNN
F 1 "GND" H 905 7327 50  0000 C CNN
F 2 "" H 900 7500 50  0001 C CNN
F 3 "" H 900 7500 50  0001 C CNN
	1    900  7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D366A95
P 900 7300
AR Path="/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366A95" Ref="#PWR03232"  Part="1" 
F 0 "#PWR03232" H 900 7150 50  0001 C CNN
F 1 "+5V" H 915 7473 50  0000 C CNN
F 2 "" H 900 7300 50  0001 C CNN
F 3 "" H 900 7300 50  0001 C CNN
	1    900  7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D366A9B
P 3800 7400
AR Path="/5CC0D65F/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5D13B20C/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5D35C694/5D366A9B" Ref="C3215"  Part="1" 
F 0 "C3215" H 3709 7446 50  0000 R CNN
F 1 "100nF" H 3709 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3800 7400 50  0001 C CNN
F 3 "~" H 3800 7400 50  0001 C CNN
	1    3800 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D366AA1
P 3800 7500
AR Path="/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AA1" Ref="#PWR03238"  Part="1" 
F 0 "#PWR03238" H 3800 7250 50  0001 C CNN
F 1 "GND" H 3805 7327 50  0000 C CNN
F 2 "" H 3800 7500 50  0001 C CNN
F 3 "" H 3800 7500 50  0001 C CNN
	1    3800 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D366AA7
P 3800 7300
AR Path="/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AA7" Ref="#PWR03237"  Part="1" 
F 0 "#PWR03237" H 3800 7150 50  0001 C CNN
F 1 "+5V" H 3815 7473 50  0000 C CNN
F 2 "" H 3800 7300 50  0001 C CNN
F 3 "" H 3800 7300 50  0001 C CNN
	1    3800 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D366AAD
P 5250 7400
AR Path="/5CC0D65F/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5D13B20C/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5D35C694/5D366AAD" Ref="C3216"  Part="1" 
F 0 "C3216" H 5159 7446 50  0000 R CNN
F 1 "100nF" H 5159 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5250 7400 50  0001 C CNN
F 3 "~" H 5250 7400 50  0001 C CNN
	1    5250 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D366AB3
P 5250 7500
AR Path="/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AB3" Ref="#PWR03240"  Part="1" 
F 0 "#PWR03240" H 5250 7250 50  0001 C CNN
F 1 "GND" H 5255 7327 50  0000 C CNN
F 2 "" H 5250 7500 50  0001 C CNN
F 3 "" H 5250 7500 50  0001 C CNN
	1    5250 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D366AB9
P 5250 7300
AR Path="/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AB9" Ref="#PWR03239"  Part="1" 
F 0 "#PWR03239" H 5250 7150 50  0001 C CNN
F 1 "+5V" H 5265 7473 50  0000 C CNN
F 2 "" H 5250 7300 50  0001 C CNN
F 3 "" H 5250 7300 50  0001 C CNN
	1    5250 7300
	1    0    0    -1  
$EndComp
Connection ~ 3800 7300
Connection ~ 3800 7500
NoConn ~ 7600 3650
$Comp
L power:+5V #PWR?
U 1 1 5D366AC2
P 6650 3300
AR Path="/5D13B20C/5D366AC2" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AC2" Ref="#PWR03242"  Part="1" 
F 0 "#PWR03242" H 6650 3150 50  0001 C CNN
F 1 "+5V" H 6665 3473 50  0000 C CNN
F 2 "" H 6650 3300 50  0001 C CNN
F 3 "" H 6650 3300 50  0001 C CNN
	1    6650 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3300 6650 3350
Wire Wire Line
	6650 3350 6700 3350
Wire Wire Line
	9250 3250 9950 3250
NoConn ~ 9250 3550
Wire Wire Line
	7600 3350 8350 3350
Wire Wire Line
	5900 4350 5900 3550
Wire Wire Line
	5900 3550 6700 3550
Wire Wire Line
	3200 4300 2150 4300
Text Label 2300 4400 0    50   ~ 0
~READ-ALU-ADD
Text Label 2300 4300 0    50   ~ 0
~FLAGWE
Wire Wire Line
	7950 3450 7950 2950
Text HLabel 2050 2950 0    50   Input ~ 0
CLK4
Text Label 2900 2850 0    50   ~ 0
~RESET
Wire Wire Line
	2050 2850 6000 2850
Wire Wire Line
	6000 2850 7850 2850
Connection ~ 6000 2850
Wire Wire Line
	6000 3650 6000 2850
Wire Wire Line
	7850 2850 7850 3550
Text Label 7000 2950 0    50   ~ 0
CLK4
Text Label 7000 2850 0    50   ~ 0
~RESET
Text Label 2900 2950 0    50   ~ 0
CLK4
Text HLabel 2050 2850 0    50   Input ~ 0
~RESET
$Comp
L alexios:74LVC2G157 U?
U 1 1 5D366AE1
P 3450 3550
AR Path="/5D13B20C/5D366AE1" Ref="U?"  Part="1" 
AR Path="/5D35C694/5D366AE1" Ref="U2205"  Part="1" 
F 0 "U2205" H 3450 3917 50  0000 C CNN
F 1 "74LVC2G157" H 3450 3826 50  0000 C CNN
F 2 "" H 3350 3675 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 3350 3675 50  0001 C CNN
	1    3450 3550
	1    0    0    -1  
$EndComp
Text Label 2300 3450 0    50   ~ 0
IBUS13
Text HLabel 2050 3450 0    50   Input ~ 0
IBUS13
Wire Wire Line
	2050 3450 3100 3450
Text Label 2300 3550 0    50   ~ 0
FVIN-ADD
Text HLabel 2050 3550 0    50   Input ~ 0
FVIN-ADD
Wire Wire Line
	2050 3550 3100 3550
Text Label 2300 3650 0    50   ~ 0
~FLAGWE
Wire Wire Line
	2050 3650 2150 3650
Text HLabel 2050 3650 0    50   Input ~ 0
~FLAGWE
$Comp
L power:GND #PWR?
U 1 1 5D366AF0
P 3100 3750
AR Path="/5D13B20C/5D366AF0" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AF0" Ref="#PWR03236"  Part="1" 
F 0 "#PWR03236" H 3100 3500 50  0001 C CNN
F 1 "GND" H 3105 3577 50  0000 C CNN
F 2 "" H 3100 3750 50  0001 C CNN
F 3 "" H 3100 3750 50  0001 C CNN
	1    3100 3750
	1    0    0    -1  
$EndComp
NoConn ~ 3800 3750
$Comp
L alexios:74LVC2G157 U?
U 2 1 5D366AF7
P 1250 7400
AR Path="/5D13B20C/5D366AF7" Ref="U?"  Part="2" 
AR Path="/5D35C694/5D366AF7" Ref="U1807"  Part="2" 
F 0 "U1807" H 1430 7446 50  0000 L CNN
F 1 "74LVC2G157" H 1430 7355 50  0000 L CNN
F 2 "" H 1150 7525 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 1150 7525 50  0001 C CNN
	2    1250 7400
	1    0    0    -1  
$EndComp
Connection ~ 900  7500
Connection ~ 900  7300
Wire Wire Line
	2050 4400 3200 4400
Wire Wire Line
	2150 3650 2150 4300
Connection ~ 2150 3650
Wire Wire Line
	2150 3650 3100 3650
Text Label 3850 4350 0    50   ~ 0
CLKV
Text Label 3850 3450 0    50   ~ 0
VD
$Comp
L alexios:74HC74 U?
U 3 1 5D366B05
P 5600 7400
AR Path="/5DC89E19/5D366B05" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366B05" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D366B05" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D366B05" Ref="U?"  Part="3" 
AR Path="/5D35C694/5D366B05" Ref="U3217"  Part="3" 
F 0 "U3217" H 5600 7817 50  0000 C CNN
F 1 "74HC74" H 5600 7726 50  0000 C CNN
F 2 "" H 5550 7550 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5550 7550 50  0001 C CNN
	3    5600 7400
	1    0    0    -1  
$EndComp
Connection ~ 5250 7300
Connection ~ 5250 7500
Wire Wire Line
	3650 4350 5900 4350
Wire Wire Line
	2050 2950 7950 2950
Wire Wire Line
	5100 3450 5200 3450
Wire Wire Line
	5200 3450 5200 3400
Wire Wire Line
	5200 3450 5200 3500
Connection ~ 5200 3450
Wire Wire Line
	4600 3400 4600 3450
Wire Wire Line
	4600 3450 4500 3450
Connection ~ 4600 3450
Wire Wire Line
	4600 3450 4600 3500
Wire Wire Line
	3800 3450 4000 3450
Wire Wire Line
	4000 3400 4000 3450
Connection ~ 4000 3450
Wire Wire Line
	4000 3450 4000 3500
$Comp
L alexios:74HC32 U?
U 1 1 5D8638B4
P 4250 3250
AR Path="/5DC89E19/5D8638B4" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D8638B4" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D8638B4" Ref="U?"  Part="1" 
AR Path="/5D35C694/5D8638B4" Ref="U3215"  Part="1" 
F 0 "U3215" H 4250 3325 50  0000 C CNN
F 1 "74HC32" H 4250 3234 50  0000 C CNN
F 2 "" H 4250 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4250 3250 50  0001 C CNN
	1    4250 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 2 1 5D8638BA
P 4850 3250
AR Path="/5DC89E19/5D8638BA" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D98F946/5D8638BA" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D8638BA" Ref="U?"  Part="2" 
AR Path="/5D35C694/5D8638BA" Ref="U3103"  Part="2" 
F 0 "U3103" H 4850 3325 50  0000 C CNN
F 1 "74HC32" H 4850 3234 50  0000 C CNN
F 2 "" H 4850 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4850 3250 50  0001 C CNN
	2    4850 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 3 1 5D8638C0
P 5450 3250
AR Path="/5DC89E19/5D8638C0" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D98F946/5D8638C0" Ref="U?"  Part="3" 
AR Path="/5D121AA3/5D8638C0" Ref="U?"  Part="3" 
AR Path="/5D35C694/5D8638C0" Ref="U3215"  Part="3" 
F 0 "U3215" H 5450 3325 50  0000 C CNN
F 1 "74HC32" H 5450 3234 50  0000 C CNN
F 2 "" H 5450 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5450 3250 50  0001 C CNN
	3    5450 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3450 6700 3450
Text Label 5850 3450 2    50   ~ 0
VD
$Comp
L alexios:74HC32 U?
U 4 1 5D877419
P 6550 7250
AR Path="/5DC89E19/5D877419" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D98F946/5D877419" Ref="U?"  Part="3" 
AR Path="/5D121AA3/5D877419" Ref="U?"  Part="3" 
AR Path="/5D35C694/5D877419" Ref="U3215"  Part="4" 
F 0 "U3215" H 6550 7325 50  0000 C CNN
F 1 "74HC32" H 6550 7234 50  0000 C CNN
F 2 "" H 6550 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6550 7250 50  0001 C CNN
	4    6550 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 5 1 5D88067D
P 2700 7100
AR Path="/5DC89E19/5D88067D" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D88067D" Ref="U?"  Part="5" 
AR Path="/5D121AA3/5D88067D" Ref="U?"  Part="5" 
AR Path="/5D35C694/5D88067D" Ref="U3215"  Part="5" 
F 0 "U3215" H 2880 6846 50  0000 L CNN
F 1 "74HC32" H 2880 6755 50  0000 L CNN
F 2 "" H 2700 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2700 7100 50  0001 C CNN
	5    2700 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D880683
P 2350 7400
AR Path="/5CC0D65F/5D880683" Ref="C?"  Part="1" 
AR Path="/5D880683" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D880683" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D880683" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D880683" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D880683" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D880683" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D880683" Ref="C?"  Part="1" 
AR Path="/5D35C694/5D880683" Ref="C3214"  Part="1" 
F 0 "C3214" H 2259 7446 50  0000 R CNN
F 1 "100nF" H 2259 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 7400 50  0001 C CNN
F 3 "~" H 2350 7400 50  0001 C CNN
	1    2350 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D880689
P 2350 7500
AR Path="/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D880689" Ref="#PWR03235"  Part="1" 
F 0 "#PWR03235" H 2350 7250 50  0001 C CNN
F 1 "GND" H 2355 7327 50  0000 C CNN
F 2 "" H 2350 7500 50  0001 C CNN
F 3 "" H 2350 7500 50  0001 C CNN
	1    2350 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D88068F
P 2350 7300
AR Path="/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D88068F" Ref="#PWR03234"  Part="1" 
F 0 "#PWR03234" H 2350 7150 50  0001 C CNN
F 1 "+5V" H 2365 7473 50  0000 C CNN
F 2 "" H 2350 7300 50  0001 C CNN
F 3 "" H 2350 7300 50  0001 C CNN
	1    2350 7300
	1    0    0    -1  
$EndComp
Connection ~ 2350 7300
Connection ~ 2350 7500
$Comp
L power:+5V #PWR03241
U 1 1 5D8986AC
P 6200 7350
F 0 "#PWR03241" H 6200 7200 50  0001 C CNN
F 1 "+5V" H 6215 7523 50  0000 C CNN
F 2 "" H 6200 7350 50  0001 C CNN
F 3 "" H 6200 7350 50  0001 C CNN
	1    6200 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 7350 6200 7400
Wire Wire Line
	6200 7500 6300 7500
Wire Wire Line
	6300 7400 6200 7400
Connection ~ 6200 7400
Wire Wire Line
	6200 7400 6200 7500
NoConn ~ 6800 7450
$EndSCHEMATC
