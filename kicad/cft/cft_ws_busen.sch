EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 26 35
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
L alexios:74AHC1G32 U?
U 1 1 5D33F5C7
P 2800 3500
AR Path="/5D33F5C7" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F5C7" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D33F5C7" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F5C7" Ref="U2601"  Part="1" 
F 0 "U2601" H 2750 3767 50  0000 C CNN
F 1 "74AHC1G32" H 2750 3676 50  0000 C CNN
F 2 "" H 2810 3480 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2810 3480 50  0001 C CNN
	1    2800 3500
	1    0    0    -1  
$EndComp
Text Label 1750 3450 0    50   ~ 0
~WS
Text Label 1750 3550 0    50   ~ 0
~T34
Text HLabel 1650 3450 0    50   Input ~ 0
~WS
Text HLabel 1650 3550 0    50   Input ~ 0
~T34
Wire Wire Line
	1650 3550 2600 3550
Text Label 1750 3700 0    50   ~ 0
CLK3
$Comp
L alexios:74AUC1G74 U?
U 1 1 5D33F5D3
P 4250 3650
AR Path="/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F5D3" Ref="U2603"  Part="1" 
F 0 "U2603" H 4250 4067 50  0000 C CNN
F 1 "74AUC1G74" H 4250 3976 50  0000 C CNN
F 2 "" H 4700 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4700 3650 50  0001 C CNN
	1    4250 3650
	1    0    0    -1  
$EndComp
Text Label 3650 3500 2    50   ~ 0
~WS-in-T34
Text Label 3650 3700 2    50   ~ 0
CLK3
Text Label 1750 3800 0    50   ~ 0
~RESET
Text Label 3650 3800 2    50   ~ 0
~RESET
Wire Wire Line
	3800 3600 3750 3600
Wire Wire Line
	3750 3600 3750 3850
$Comp
L power:GND #PWR?
U 1 1 5D33F613
P 3750 3850
AR Path="/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F613" Ref="#PWR02610"  Part="1" 
F 0 "#PWR02610" H 3750 3600 50  0001 C CNN
F 1 "GND" H 3755 3677 50  0000 C CNN
F 2 "" H 3750 3850 50  0001 C CNN
F 3 "" H 3750 3850 50  0001 C CNN
	1    3750 3850
	1    0    0    -1  
$EndComp
Text Label 5050 3800 2    50   ~ 0
~WAITING
$Comp
L alexios:74LVC1G11 U?
U 1 1 5D33F61B
P 5600 4350
AR Path="/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F61B" Ref="U2602"  Part="1" 
F 0 "U2602" H 5550 4614 50  0000 C CNN
F 1 "74LVC1G11" H 5550 4523 50  0000 C CNN
F 2 "" H 5500 4275 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5500 4275 50  0001 C CNN
	1    5600 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3800 5150 4300
Wire Wire Line
	5150 4300 5300 4300
Wire Wire Line
	4700 3800 5150 3800
Text Label 1750 4400 0    50   ~ 0
~IO
Text HLabel 1650 3700 0    50   Input ~ 0
CLK3
Text HLabel 1650 3800 0    50   Input ~ 0
~RESET
Text HLabel 1650 4400 0    50   Input ~ 0
~IO
Text HLabel 1650 4500 0    50   Input ~ 0
~MEM
Text Label 6150 4400 2    50   ~ 0
~BUSEN
Text Label 5050 4400 2    50   ~ 0
~IO
Text Label 1750 4500 0    50   ~ 0
~MEM
Text Label 5050 4500 2    50   ~ 0
~MEM
Wire Wire Line
	3100 3500 3750 3500
Wire Wire Line
	1650 3700 3800 3700
Wire Wire Line
	1650 4400 5300 4400
Wire Wire Line
	1650 4500 5300 4500
Text Label 1750 2900 0    50   ~ 0
WSTB
Wire Wire Line
	5300 2800 1650 2800
Text Label 1750 2800 0    50   ~ 0
~WEN
Text HLabel 1650 2800 0    50   Input ~ 0
~WEN
Text HLabel 1650 2900 0    50   Input ~ 0
WSTB
$Comp
L Device:C_Small C?
U 1 1 5D33F674
P 2500 6550
AR Path="/5CC0D65F/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F674" Ref="C2603"  Part="1" 
F 0 "C2603" H 2409 6596 50  0000 R CNN
F 1 "100nF" H 2409 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 6550 50  0001 C CNN
F 3 "~" H 2500 6550 50  0001 C CNN
	1    2500 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F67A
P 2500 6650
AR Path="/5D33F67A" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F67A" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F67A" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F67A" Ref="#PWR02607"  Part="1" 
F 0 "#PWR02607" H 2500 6400 50  0001 C CNN
F 1 "GND" H 2505 6477 50  0000 C CNN
F 2 "" H 2500 6650 50  0001 C CNN
F 3 "" H 2500 6650 50  0001 C CNN
	1    2500 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F681
P 2500 6450
AR Path="/5D33F681" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F681" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F681" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F681" Ref="#PWR02606"  Part="1" 
F 0 "#PWR02606" H 2500 6300 50  0001 C CNN
F 1 "+5V" H 2515 6623 50  0000 C CNN
F 2 "" H 2500 6450 50  0001 C CNN
F 3 "" H 2500 6450 50  0001 C CNN
	1    2500 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F68E
P 5400 7250
AR Path="/5CC0D65F/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F68E" Ref="C2606"  Part="1" 
F 0 "C2606" H 5309 7296 50  0000 R CNN
F 1 "100nF" H 5309 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5400 7250 50  0001 C CNN
F 3 "~" H 5400 7250 50  0001 C CNN
	1    5400 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F694
P 5400 7350
AR Path="/5D33F694" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F694" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F694" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F694" Ref="#PWR02614"  Part="1" 
F 0 "#PWR02614" H 5400 7100 50  0001 C CNN
F 1 "GND" H 5405 7177 50  0000 C CNN
F 2 "" H 5400 7350 50  0001 C CNN
F 3 "" H 5400 7350 50  0001 C CNN
	1    5400 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F69B
P 5400 7150
AR Path="/5D33F69B" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F69B" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F69B" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F69B" Ref="#PWR02613"  Part="1" 
F 0 "#PWR02613" H 5400 7000 50  0001 C CNN
F 1 "+5V" H 5415 7323 50  0000 C CNN
F 2 "" H 5400 7150 50  0001 C CNN
F 3 "" H 5400 7150 50  0001 C CNN
	1    5400 7150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F70F
P 6100 2900
AR Path="/5F67D4B5/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F70F" Ref="TP2603"  Part="1" 
F 0 "TP2603" H 6050 3150 50  0000 L CNN
F 1 "TestPoint" H 6158 2927 50  0001 L CNN
F 2 "" H 6300 2900 50  0001 C CNN
F 3 "~" H 6300 2900 50  0001 C CNN
	1    6100 2900
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F718
P 4700 3500
AR Path="/5F67D4B5/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F718" Ref="TP2602"  Part="1" 
F 0 "TP2602" V 4600 3500 50  0000 L CNN
F 1 "TestPoint" H 4758 3527 50  0001 L CNN
F 2 "" H 4900 3500 50  0001 C CNN
F 3 "~" H 4900 3500 50  0001 C CNN
	1    4700 3500
	0    1    1    0   
$EndComp
Connection ~ 3750 3500
Wire Wire Line
	3750 3500 3800 3500
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F721
P 3750 3500
AR Path="/5F67D4B5/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F721" Ref="TP2601"  Part="1" 
F 0 "TP2601" H 3750 3734 50  0000 C CNN
F 1 "TestPoint" H 3808 3527 50  0001 L CNN
F 2 "" H 3950 3500 50  0001 C CNN
F 3 "~" H 3950 3500 50  0001 C CNN
	1    3750 3500
	1    0    0    -1  
$EndComp
Text HLabel 1650 2450 0    50   Input ~ 0
~HALT
$Comp
L Device:C_Small C?
U 1 1 5D33F777
P 3950 7250
AR Path="/5CC0D65F/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F777" Ref="C2605"  Part="1" 
F 0 "C2605" H 3859 7296 50  0000 R CNN
F 1 "100nF" H 3859 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3950 7250 50  0001 C CNN
F 3 "~" H 3950 7250 50  0001 C CNN
	1    3950 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F77D
P 3950 7350
AR Path="/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F77D" Ref="#PWR02612"  Part="1" 
F 0 "#PWR02612" H 3950 7100 50  0001 C CNN
F 1 "GND" H 3955 7177 50  0000 C CNN
F 2 "" H 3950 7350 50  0001 C CNN
F 3 "" H 3950 7350 50  0001 C CNN
	1    3950 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F784
P 3950 7150
AR Path="/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F784" Ref="#PWR02611"  Part="1" 
F 0 "#PWR02611" H 3950 7000 50  0001 C CNN
F 1 "+5V" H 3965 7323 50  0000 C CNN
F 2 "" H 3950 7150 50  0001 C CNN
F 3 "" H 3950 7150 50  0001 C CNN
	1    3950 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4400 9550 4400
$Comp
L power:+5V #PWR?
U 1 1 5D33F7B4
P 1000 7200
AR Path="/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F7B4" Ref="#PWR02601"  Part="1" 
F 0 "#PWR02601" H 1000 7050 50  0001 C CNN
F 1 "+5V" H 1015 7373 50  0000 C CNN
F 2 "" H 1000 7200 50  0001 C CNN
F 3 "" H 1000 7200 50  0001 C CNN
	1    1000 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F7BB
P 1000 7400
AR Path="/5D33F7BB" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F7BB" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F7BB" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F7BB" Ref="#PWR02602"  Part="1" 
F 0 "#PWR02602" H 1000 7150 50  0001 C CNN
F 1 "GND" H 1005 7227 50  0000 C CNN
F 2 "" H 1000 7400 50  0001 C CNN
F 3 "" H 1000 7400 50  0001 C CNN
	1    1000 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F7C1
P 1000 7300
AR Path="/5CC0D65F/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F7C1" Ref="C2601"  Part="1" 
F 0 "C2601" H 909 7346 50  0000 R CNN
F 1 "100nF" H 909 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1000 7300 50  0001 C CNN
F 3 "~" H 1000 7300 50  0001 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
Text HLabel 9550 4400 2    50   Output ~ 0
~BUSEN
$Comp
L power:+5V #PWR?
U 1 1 5D33F601
P 1050 6450
AR Path="/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F601" Ref="#PWR02603"  Part="1" 
F 0 "#PWR02603" H 1050 6300 50  0001 C CNN
F 1 "+5V" H 1065 6623 50  0000 C CNN
F 2 "" H 1050 6450 50  0001 C CNN
F 3 "" H 1050 6450 50  0001 C CNN
	1    1050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F5FA
P 1050 6650
AR Path="/5D33F5FA" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F5FA" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F5FA" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F5FA" Ref="#PWR02604"  Part="1" 
F 0 "#PWR02604" H 1050 6400 50  0001 C CNN
F 1 "GND" H 1055 6477 50  0000 C CNN
F 2 "" H 1050 6650 50  0001 C CNN
F 3 "" H 1050 6650 50  0001 C CNN
	1    1050 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F5E1
P 1050 6550
AR Path="/5CC0D65F/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F5E1" Ref="C2602"  Part="1" 
F 0 "C2602" H 959 6596 50  0000 R CNN
F 1 "100nF" H 959 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 6550 50  0001 C CNN
F 3 "~" H 1050 6550 50  0001 C CNN
	1    1050 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4281C6
P 2500 7250
AR Path="/5CC0D65F/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D4281C6" Ref="C2604"  Part="1" 
F 0 "C2604" H 2409 7296 50  0000 R CNN
F 1 "100nF" H 2409 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 7250 50  0001 C CNN
F 3 "~" H 2500 7250 50  0001 C CNN
	1    2500 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02609
U 1 1 5D428DF8
P 2500 7350
F 0 "#PWR02609" H 2500 7100 50  0001 C CNN
F 1 "GND" H 2505 7177 50  0000 C CNN
F 2 "" H 2500 7350 50  0001 C CNN
F 3 "" H 2500 7350 50  0001 C CNN
	1    2500 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02608
U 1 1 5D429670
P 2500 7150
F 0 "#PWR02608" H 2500 7000 50  0001 C CNN
F 1 "+5V" H 2515 7323 50  0000 C CNN
F 2 "" H 2500 7150 50  0001 C CNN
F 3 "" H 2500 7150 50  0001 C CNN
	1    2500 7150
	1    0    0    -1  
$EndComp
Text Notes 7100 7000 0    197  ~ 39
Wait States
Text Notes 5900 4550 0    50   ~ 0
Keep the bus enabled while waiting.
Wire Wire Line
	1650 3800 3800 3800
$Comp
L alexios:74AHC1G125 U?
U 1 1 5D6CFDA6
P 6600 2900
AR Path="/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D6CFDA6" Ref="U2606"  Part="1" 
F 0 "U2606" H 6650 2726 50  0000 C CNN
F 1 "74AHC1G125" H 6650 2635 50  0000 C CNN
F 2 "" H 6750 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 6750 3150 50  0001 C CNN
	1    6600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2900 9550 2900
Text Label 9450 2900 2    50   ~ 0
~W
Text HLabel 9550 2900 2    50   3State ~ 0
~W
Wire Wire Line
	6650 2700 6650 2450
$Comp
L alexios:74LVC1G04 U2605
U 1 1 5D6F45CB
P 6350 2450
F 0 "U2605" H 6300 2717 50  0000 C CNN
F 1 "74LVC1G04" H 6300 2626 50  0000 C CNN
F 2 "" H 6350 2450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 6350 2450 50  0001 C CNN
	1    6350 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2450 6650 2450
Text Label 1750 2450 0    50   ~ 0
~HALT
Wire Wire Line
	1650 2450 6050 2450
Text Notes 4600 2100 0    50   ~ 0
~WEN~\n\n X\n 1\n 0\n 0\n 0
Text Notes 5150 2100 0    50   ~ 0
~WAITING~\n\n  X\n  X\n  1\n  X\n  0
Text Notes 5650 2100 0    50   ~ 0
~W~\n\nZ\n1\n1\n0\n0
Wire Wire Line
	6050 2900 6100 2900
Wire Notes Line width 20 style solid
	4275 1475 5800 1475
Wire Notes Line style solid
	4275 1650 5800 1650
Wire Notes Line width 20 style solid
	5800 2150 5800 1475
Wire Notes Line width 20 style solid
	4275 2150 4275 1475
Wire Notes Line width 20 style solid
	4275 2150 5800 2150
Wire Notes Line
	5550 1475 5550 2150
Wire Wire Line
	5150 3800 5150 3000
Connection ~ 5150 3800
Wire Wire Line
	5150 3000 5300 3000
Connection ~ 6100 2900
Wire Wire Line
	6100 2900 6400 2900
Wire Wire Line
	1650 2900 5300 2900
$Comp
L alexios:74LVC1G0832 U2604
U 1 1 5D1103B3
P 5650 2900
F 0 "U2604" H 5675 2619 50  0000 C CNN
F 1 "74LVC1G0832" H 5675 2710 50  0000 C CNN
F 2 "" H 5650 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 5650 2900 50  0001 C CNN
	1    5650 2900
	1    0    0    1   
$EndComp
Text Label 5050 2800 2    50   ~ 0
~WEN
Text Label 5050 2900 2    50   ~ 0
WSTB
Text Notes 4350 2100 0    50   ~ 0
~HALT~\n\n 0\n 1\n 1\n 1\n 1
Text Notes 4850 2100 0    50   ~ 0
WSTB\n\n  X\n  X\n  1\n  0\n  X
$Comp
L alexios:74AHC1G32 U?
U 2 1 5D1B7CC1
P 1450 6300
AR Path="/5D1B7CC1" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D1B7CC1" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D1B7CC1" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D1B7CC1" Ref="U2601"  Part="2" 
F 0 "U2601" H 1580 6096 50  0000 L CNN
F 1 "74AHC1G32" H 1580 6005 50  0000 L CNN
F 2 "" H 1460 6280 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1460 6280 50  0001 C CNN
	2    1450 6300
	1    0    0    -1  
$EndComp
Connection ~ 1050 6650
Connection ~ 1050 6450
$Comp
L alexios:74AUC1G74 U?
U 2 1 5D1B8DEA
P 2850 6550
AR Path="/5D1B8DEA" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D1B8DEA" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D1B8DEA" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D1B8DEA" Ref="U2603"  Part="2" 
F 0 "U2603" H 3030 6596 50  0000 L CNN
F 1 "74AUC1G74" H 3030 6505 50  0000 L CNN
F 2 "" H 3300 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3300 6550 50  0001 C CNN
	2    2850 6550
	1    0    0    -1  
$EndComp
Connection ~ 2500 6650
Connection ~ 2500 6450
$Comp
L alexios:74LVC1G11 U?
U 2 1 5D1BEF9C
P 1450 7150
AR Path="/5D1BEF9C" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D1BEF9C" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D1BEF9C" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D1BEF9C" Ref="U2602"  Part="2" 
F 0 "U2602" H 1530 7046 50  0000 L CNN
F 1 "74LVC1G11" H 1530 6955 50  0000 L CNN
F 2 "" H 1350 7075 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1350 7075 50  0001 C CNN
	2    1450 7150
	1    0    0    -1  
$EndComp
Connection ~ 1000 7400
Connection ~ 1000 7200
$Comp
L alexios:74LVC1G0832 U2604
U 2 1 5D1BF7D7
P 2850 7250
F 0 "U2604" H 3030 7204 50  0000 L CNN
F 1 "74LVC1G0832" H 3030 7295 50  0000 L CNN
F 2 "" H 2850 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 2850 7250 50  0001 C CNN
	2    2850 7250
	1    0    0    1   
$EndComp
Connection ~ 2500 7150
Connection ~ 2500 7350
$Comp
L alexios:74LVC1G04 U2605
U 2 1 5D1C6D66
P 4300 7250
F 0 "U2605" H 4480 7296 50  0000 L CNN
F 1 "74LVC1G04" H 4480 7205 50  0000 L CNN
F 2 "" H 4300 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 4300 7250 50  0001 C CNN
	2    4300 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G125 U?
U 2 1 5D1C70BE
P 5750 7250
AR Path="/5D1C70BE" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D1C70BE" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D1C70BE" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D1C70BE" Ref="U2606"  Part="2" 
F 0 "U2606" H 5930 7296 50  0000 L CNN
F 1 "74AHC1G125" H 5930 7205 50  0000 L CNN
F 2 "" H 5900 7500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5900 7500 50  0001 C CNN
	2    5750 7250
	1    0    0    -1  
$EndComp
Connection ~ 3950 7350
Connection ~ 3950 7150
Connection ~ 5400 7350
Connection ~ 5400 7150
Text Notes 3150 4250 0    100  ~ 20
Wait State Handling
Text Notes 6750 2650 0    50   ~ 0
Tristate ~W~ on ~HALT~.
Text Notes 5450 3350 0    50   ~ 0
Keep ~W~ low during a wait state.
$Comp
L Device:R_Small R?
U 1 1 5D2DC64D
P 2100 3300
AR Path="/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5D2DC64D" Ref="R2601"  Part="1" 
F 0 "R2601" H 2159 3346 50  0000 L CNN
F 1 "4.7kΩ" H 2159 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2100 3300 50  0001 C CNN
F 3 "~" H 2100 3300 50  0001 C CNN
	1    2100 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D2DC653
P 2100 3200
AR Path="/5F67D4B5/5D2DC653" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D2DC653" Ref="#PWR02605"  Part="1" 
F 0 "#PWR02605" H 2100 3050 50  0001 C CNN
F 1 "+5V" H 2115 3373 50  0000 C CNN
F 2 "" H 2100 3200 50  0001 C CNN
F 3 "" H 2100 3200 50  0001 C CNN
	1    2100 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 3450 2100 3450
Wire Wire Line
	2100 3400 2100 3450
Connection ~ 2100 3450
Wire Wire Line
	2100 3450 2600 3450
$EndSCHEMATC
