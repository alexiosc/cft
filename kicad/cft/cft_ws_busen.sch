EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 23
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
P 2350 2400
AR Path="/5D33F5C7" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F5C7" Ref="U1501"  Part="1" 
AR Path="/5D44ECB5/5D33F5C7" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F5C7" Ref="U1505"  Part="1" 
F 0 "U1505" H 2300 2667 50  0000 C CNN
F 1 "74AHC1G32" H 2300 2576 50  0000 C CNN
F 2 "" H 2360 2380 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2360 2380 50  0001 C CNN
	1    2350 2400
	1    0    0    -1  
$EndComp
Text Label 1200 2350 0    50   ~ 0
~WS
Text Label 1200 2450 0    50   ~ 0
~T34
Text HLabel 1100 2350 0    50   Input ~ 0
~WS
Text HLabel 1100 2450 0    50   Input ~ 0
~T34
Wire Wire Line
	1100 2450 2050 2450
Text Label 1200 2600 0    50   ~ 0
CLK2
$Comp
L alexios:74AUC1G74 U?
U 1 1 5D33F5D3
P 3700 2550
AR Path="/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F5D3" Ref="U1502"  Part="1" 
AR Path="/5D44ECB5/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F5D3" Ref="U1506"  Part="1" 
F 0 "U1506" H 3700 2967 50  0000 C CNN
F 1 "74AUC1G74" H 3700 2876 50  0000 C CNN
F 2 "" H 4150 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4150 2550 50  0001 C CNN
	1    3700 2550
	1    0    0    -1  
$EndComp
Text Label 3100 2400 2    50   ~ 0
~WS-in-T34
Text Label 3100 2600 2    50   ~ 0
CLK2
Text Label 1200 2700 0    50   ~ 0
~RESET
Text Label 3100 2700 2    50   ~ 0
~RESET
Wire Wire Line
	3250 2500 3200 2500
Wire Wire Line
	3200 2500 3200 2800
$Comp
L power:GND #PWR?
U 1 1 5D33F613
P 3200 2800
AR Path="/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F613" Ref="#PWR01503"  Part="1" 
AR Path="/5D44ECB5/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F613" Ref="#PWR01503"  Part="1" 
F 0 "#PWR01503" H 3200 2550 50  0001 C CNN
F 1 "GND" H 3205 2627 50  0000 C CNN
F 2 "" H 3200 2800 50  0001 C CNN
F 3 "" H 3200 2800 50  0001 C CNN
	1    3200 2800
	1    0    0    -1  
$EndComp
Text Label 4500 2400 2    50   ~ 0
WAITING
Text Label 4500 2700 2    50   ~ 0
~WAITING
$Comp
L alexios:74LVC1G11 U?
U 1 1 5D33F61B
P 4950 3250
AR Path="/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F61B" Ref="U1504"  Part="1" 
AR Path="/5D44ECB5/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F61B" Ref="U1507"  Part="1" 
F 0 "U1507" H 4900 3514 50  0000 C CNN
F 1 "74LVC1G11" H 4900 3423 50  0000 C CNN
F 2 "" H 4850 3175 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4850 3175 50  0001 C CNN
	1    4950 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 2 1 5D33F621
P 4300 6450
AR Path="/5D33F621" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D33F621" Ref="U1504"  Part="2" 
AR Path="/5D44ECB5/5D33F621" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D33F621" Ref="U1507"  Part="2" 
F 0 "U1507" H 4380 6346 50  0000 L CNN
F 1 "74LVC1G11" H 4380 6255 50  0000 L CNN
F 2 "" H 4200 6375 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4200 6375 50  0001 C CNN
	2    4300 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F627
P 3850 6600
AR Path="/5CC0D65F/5D33F627" Ref="C?"  Part="1" 
AR Path="/5D33F627" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F627" Ref="C1504"  Part="1" 
AR Path="/5D44ECB5/5D33F627" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F627" Ref="C1504"  Part="1" 
F 0 "C1504" H 3759 6646 50  0000 R CNN
F 1 "100nF" H 3759 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3850 6600 50  0001 C CNN
F 3 "~" H 3850 6600 50  0001 C CNN
	1    3850 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F62D
P 3850 6500
AR Path="/5D33F62D" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F62D" Ref="#PWR01510"  Part="1" 
AR Path="/5D44ECB5/5D33F62D" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F62D" Ref="#PWR01509"  Part="1" 
F 0 "#PWR01509" H 3850 6350 50  0001 C CNN
F 1 "+5V" H 3865 6673 50  0000 C CNN
F 2 "" H 3850 6500 50  0001 C CNN
F 3 "" H 3850 6500 50  0001 C CNN
	1    3850 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F634
P 3850 6700
AR Path="/5D33F634" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F634" Ref="#PWR01514"  Part="1" 
AR Path="/5D44ECB5/5D33F634" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F634" Ref="#PWR01513"  Part="1" 
F 0 "#PWR01513" H 3850 6450 50  0001 C CNN
F 1 "GND" H 3855 6527 50  0000 C CNN
F 2 "" H 3850 6700 50  0001 C CNN
F 3 "" H 3850 6700 50  0001 C CNN
	1    3850 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2700 4600 3200
Wire Wire Line
	4600 3200 4650 3200
Wire Wire Line
	4150 2700 4600 2700
Text Label 1200 3300 0    50   ~ 0
~IO
Text HLabel 1100 2600 0    50   Input ~ 0
CLK2
Text HLabel 1100 2700 0    50   Input ~ 0
~RESET
Text HLabel 1100 3300 0    50   Input ~ 0
~IO
Text HLabel 1100 3400 0    50   Input ~ 0
~MEM
Text Label 5500 3300 2    50   ~ 0
~BUSEN
Text Label 4500 3300 2    50   ~ 0
~IO
Text Label 1200 3400 0    50   ~ 0
~MEM
Text Label 4500 3400 2    50   ~ 0
~MEM
Wire Wire Line
	2550 2400 3200 2400
Wire Wire Line
	1100 2700 1700 2700
Wire Wire Line
	1100 2600 3250 2600
Wire Wire Line
	1100 3300 4650 3300
Wire Wire Line
	1100 3400 4650 3400
$Comp
L alexios:74LVC1G27 U?
U 1 1 5D33F64C
P 4950 1800
AR Path="/5D33F64C" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F64C" Ref="U1503"  Part="1" 
AR Path="/5D44ECB5/5D33F64C" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F64C" Ref="U1503"  Part="1" 
F 0 "U1503" H 4925 2114 50  0000 C CNN
F 1 "74LVC1G27" H 4925 2023 50  0000 C CNN
F 2 "" H 4950 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4950 1800 50  0001 C CNN
	1    4950 1800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G27 U?
U 2 1 5D33F652
P 2900 6550
AR Path="/5D33F652" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D33F652" Ref="U1503"  Part="2" 
AR Path="/5D44ECB5/5D33F652" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D33F652" Ref="U1503"  Part="2" 
F 0 "U1503" H 2980 6546 50  0000 L CNN
F 1 "74LVC1G27" H 2980 6455 50  0000 L CNN
F 2 "" H 2900 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2900 6550 50  0001 C CNN
	2    2900 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 1900 4600 1900
Wire Wire Line
	4600 1900 4600 2400
Wire Wire Line
	4150 2400 4600 2400
Wire Wire Line
	1100 1800 4650 1800
Text Label 1200 1800 0    50   ~ 0
CLK4
Wire Wire Line
	4650 1700 1100 1700
Text Label 1200 1700 0    50   ~ 0
~WEN
Text HLabel 1100 1700 0    50   Input ~ 0
~WEN
Text HLabel 1100 1800 0    50   Input ~ 0
CLK4
Wire Wire Line
	5200 1800 5350 1800
Text Label 5750 1800 2    50   ~ 0
WCLK
Wire Notes Line style solid
	5100 1850 5200 1850
Wire Notes Line style solid
	5200 1850 5200 1950
Wire Notes Line style solid
	5200 1950 5350 1950
Wire Notes Line style solid
	5350 1950 5350 1850
Wire Notes Line style solid
	5350 1850 5400 1850
$Comp
L alexios:74HC74 U?
U 1 1 5D33F668
P 6200 1550
AR Path="/5D33F668" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F668" Ref="U1506"  Part="1" 
AR Path="/5D44ECB5/5D33F668" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F668" Ref="U1502"  Part="1" 
F 0 "U1502" H 6500 1950 50  0000 C CNN
F 1 "74HC74" H 6500 1850 50  0000 C CNN
F 2 "" H 6150 1550 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6150 1550 50  0001 C CNN
	1    6200 1550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 5D33F66E
P 8100 1550
AR Path="/5D33F66E" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D33F66E" Ref="U1506"  Part="2" 
AR Path="/5D44ECB5/5D33F66E" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D33F66E" Ref="U1502"  Part="2" 
F 0 "U1502" H 8400 1950 50  0000 C CNN
F 1 "74HC74" H 8400 1850 50  0000 C CNN
F 2 "" H 8050 1550 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 8050 1550 50  0001 C CNN
	2    8100 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F674
P 2450 6600
AR Path="/5CC0D65F/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F674" Ref="C1506"  Part="1" 
AR Path="/5D44ECB5/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F674" Ref="C1503"  Part="1" 
F 0 "C1503" H 2359 6646 50  0000 R CNN
F 1 "100nF" H 2359 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2450 6600 50  0001 C CNN
F 3 "~" H 2450 6600 50  0001 C CNN
	1    2450 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F67A
P 2450 6700
AR Path="/5D33F67A" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F67A" Ref="#PWR01516"  Part="1" 
AR Path="/5D44ECB5/5D33F67A" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F67A" Ref="#PWR01512"  Part="1" 
F 0 "#PWR01512" H 2450 6450 50  0001 C CNN
F 1 "GND" H 2455 6527 50  0000 C CNN
F 2 "" H 2450 6700 50  0001 C CNN
F 3 "" H 2450 6700 50  0001 C CNN
	1    2450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F681
P 2450 6500
AR Path="/5D33F681" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F681" Ref="#PWR01512"  Part="1" 
AR Path="/5D44ECB5/5D33F681" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F681" Ref="#PWR01508"  Part="1" 
F 0 "#PWR01508" H 2450 6350 50  0001 C CNN
F 1 "+5V" H 2465 6673 50  0000 C CNN
F 2 "" H 2450 6500 50  0001 C CNN
F 3 "" H 2450 6500 50  0001 C CNN
	1    2450 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 7 1 5D33F688
P 5650 7000
AR Path="/5D33F688" Ref="U?"  Part="7" 
AR Path="/5D30488D/5D33F688" Ref="U1509"  Part="7" 
AR Path="/5D44ECB5/5D33F688" Ref="U?"  Part="7" 
AR Path="/5D46B22D/5D33F688" Ref="U1509"  Part="7" 
F 0 "U1509" H 5830 6746 50  0000 L CNN
F 1 "74AC04" H 5830 6655 50  0000 L CNN
F 2 "" H 5650 7000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5650 7000 50  0001 C CNN
	7    5650 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F68E
P 5300 7300
AR Path="/5CC0D65F/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F68E" Ref="C1501"  Part="1" 
AR Path="/5D44ECB5/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F68E" Ref="C1508"  Part="1" 
F 0 "C1508" H 5209 7346 50  0000 R CNN
F 1 "100nF" H 5209 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5300 7300 50  0001 C CNN
F 3 "~" H 5300 7300 50  0001 C CNN
	1    5300 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F694
P 5300 7400
AR Path="/5D33F694" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F694" Ref="#PWR01507"  Part="1" 
AR Path="/5D44ECB5/5D33F694" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F694" Ref="#PWR01521"  Part="1" 
F 0 "#PWR01521" H 5300 7150 50  0001 C CNN
F 1 "GND" H 5305 7227 50  0000 C CNN
F 2 "" H 5300 7400 50  0001 C CNN
F 3 "" H 5300 7400 50  0001 C CNN
	1    5300 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F69B
P 5300 7200
AR Path="/5D33F69B" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F69B" Ref="#PWR01505"  Part="1" 
AR Path="/5D44ECB5/5D33F69B" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F69B" Ref="#PWR01517"  Part="1" 
F 0 "#PWR01517" H 5300 7050 50  0001 C CNN
F 1 "+5V" H 5315 7373 50  0000 C CNN
F 2 "" H 5300 7200 50  0001 C CNN
F 3 "" H 5300 7200 50  0001 C CNN
	1    5300 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G08 U?
U 1 1 5D33F6A2
P 4950 3700
AR Path="/5D33F6A2" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F6A2" Ref="U1505"  Part="1" 
AR Path="/5D44ECB5/5D33F6A2" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F6A2" Ref="U1508"  Part="1" 
F 0 "U1508" H 4875 3525 50  0000 C CNN
F 1 "74AHC1G08" H 4875 3434 50  0000 C CNN
F 2 "" H 4600 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4600 3700 50  0001 C CNN
	1    4950 3700
	1    0    0    -1  
$EndComp
Text Label 4250 3650 0    50   ~ 0
~RESET
Wire Wire Line
	4650 3750 4600 3750
$Comp
L power:+5V #PWR?
U 1 1 5D33F6AA
P 6250 1150
AR Path="/5D33F6AA" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F6AA" Ref="#PWR01501"  Part="1" 
AR Path="/5D44ECB5/5D33F6AA" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F6AA" Ref="#PWR01501"  Part="1" 
F 0 "#PWR01501" H 6250 1000 50  0001 C CNN
F 1 "+5V" H 6265 1323 50  0000 C CNN
F 2 "" H 6250 1150 50  0001 C CNN
F 3 "" H 6250 1150 50  0001 C CNN
	1    6250 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1450 5750 1150
Wire Wire Line
	5750 1150 6250 1150
Wire Wire Line
	1700 3650 1700 2700
Wire Wire Line
	1700 3650 4650 3650
Connection ~ 1700 2700
Wire Wire Line
	1700 2700 3250 2700
Text Label 1700 3150 1    50   ~ 0
~RESET
Wire Wire Line
	5100 3700 6250 3700
Text Label 5250 3700 0    50   ~ 0
~WCLR-OR-RESET
Wire Wire Line
	4600 3750 4600 4850
Wire Wire Line
	5600 5150 5150 5150
Wire Wire Line
	5700 5050 5850 5050
Connection ~ 5700 5050
Wire Wire Line
	5700 5250 7100 5250
Wire Wire Line
	5700 5050 5700 5250
Wire Wire Line
	5150 5050 5700 5050
Connection ~ 5650 4600
Wire Wire Line
	5650 4950 5150 4950
Wire Wire Line
	5650 4600 5650 4950
Wire Wire Line
	5650 4400 5650 4600
Wire Wire Line
	7100 3950 5500 3950
Wire Wire Line
	5500 4850 5500 3950
Wire Wire Line
	5150 4850 5500 4850
Wire Wire Line
	7100 5050 7050 5050
Wire Wire Line
	7100 4600 7100 5050
Wire Wire Line
	5650 4600 7100 4600
Wire Wire Line
	5850 4400 5650 4400
Wire Wire Line
	7100 4400 7050 4400
Wire Wire Line
	7100 3950 7100 4400
Connection ~ 4600 4850
$Comp
L power:GND #PWR?
U 1 1 5D33F6CF
P 4600 5400
AR Path="/5D33F6CF" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F6CF" Ref="#PWR01504"  Part="1" 
AR Path="/5D44ECB5/5D33F6CF" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F6CF" Ref="#PWR01504"  Part="1" 
F 0 "#PWR01504" H 4600 5150 50  0001 C CNN
F 1 "GND" H 4605 5227 50  0000 C CNN
F 2 "" H 4600 5400 50  0001 C CNN
F 3 "" H 4600 5400 50  0001 C CNN
	1    4600 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4600 5150 4600 5200
Connection ~ 4600 5150
Wire Wire Line
	4650 5150 4600 5150
Wire Wire Line
	4600 5050 4600 5150
Connection ~ 4600 5050
Wire Wire Line
	4650 5050 4600 5050
Wire Wire Line
	4600 4950 4600 5050
Connection ~ 4600 4950
Wire Wire Line
	4650 4950 4600 4950
Wire Wire Line
	4600 4850 4600 4950
Wire Wire Line
	4650 4850 4600 4850
$Comp
L Device:R_Small R?
U 1 1 5D33F6E0
P 4600 5300
AR Path="/5D33F6E0" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D33F6E0" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D33F6E0" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D33F6E0" Ref="R?"  Part="1" 
AR Path="/5F4B0011/5D33F6E0" Ref="R?"  Part="1" 
AR Path="/5F63066B/5D33F6E0" Ref="R?"  Part="1" 
AR Path="/5D30488D/5D33F6E0" Ref="R1502"  Part="1" 
AR Path="/5D44ECB5/5D33F6E0" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5D33F6E0" Ref="R1502"  Part="1" 
F 0 "R1502" H 4541 5346 50  0000 R CNN
F 1 "10kΩ" H 4541 5255 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4600 5300 50  0001 C CNN
F 3 "~" H 4600 5300 50  0001 C CNN
	1    4600 5300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 5D33F6E6
P 4950 4950
AR Path="/5D33F6E6" Ref="J?"  Part="1" 
AR Path="/5D30488D/5D33F6E6" Ref="J1501"  Part="1" 
AR Path="/5D44ECB5/5D33F6E6" Ref="J?"  Part="1" 
AR Path="/5D46B22D/5D33F6E6" Ref="J1501"  Part="1" 
F 0 "J1501" H 5000 5175 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 5000 5176 50  0001 C CNN
F 2 "" H 4950 4950 50  0001 C CNN
F 3 "~" H 4950 4950 50  0001 C CNN
	1    4950 4950
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 6 1 5D33F6EC
P 6150 5050
AR Path="/5D33F6EC" Ref="U?"  Part="6" 
AR Path="/5D30488D/5D33F6EC" Ref="U1509"  Part="6" 
AR Path="/5D44ECB5/5D33F6EC" Ref="U?"  Part="6" 
AR Path="/5D46B22D/5D33F6EC" Ref="U1509"  Part="6" 
F 0 "U1509" H 6150 5367 50  0000 C CNN
F 1 "74AC04" H 6150 5276 50  0000 C CNN
F 2 "" H 6150 5050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6150 5050 50  0001 C CNN
	6    6150 5050
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 3 1 5D33F6F2
P 6750 5050
AR Path="/5D33F6F2" Ref="U?"  Part="3" 
AR Path="/5D30488D/5D33F6F2" Ref="U1509"  Part="3" 
AR Path="/5D44ECB5/5D33F6F2" Ref="U?"  Part="3" 
AR Path="/5D46B22D/5D33F6F2" Ref="U1509"  Part="3" 
F 0 "U1509" H 6750 5367 50  0000 C CNN
F 1 "74AC04" H 6750 5276 50  0000 C CNN
F 2 "" H 6750 5050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6750 5050 50  0001 C CNN
	3    6750 5050
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 1 1 5D33F6F8
P 6750 4400
AR Path="/5D33F6F8" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F6F8" Ref="U1509"  Part="1" 
AR Path="/5D44ECB5/5D33F6F8" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F6F8" Ref="U1509"  Part="1" 
F 0 "U1509" H 6750 4717 50  0000 C CNN
F 1 "74AC04" H 6750 4626 50  0000 C CNN
F 2 "" H 6750 4400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6750 4400 50  0001 C CNN
	1    6750 4400
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 2 1 5D33F6FE
P 6150 4400
AR Path="/5D33F6FE" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D33F6FE" Ref="U1509"  Part="2" 
AR Path="/5D44ECB5/5D33F6FE" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D33F6FE" Ref="U1509"  Part="2" 
F 0 "U1509" H 6150 4717 50  0000 C CNN
F 1 "74AC04" H 6150 4626 50  0000 C CNN
F 2 "" H 6150 4400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6150 4400 50  0001 C CNN
	2    6150 4400
	-1   0    0    -1  
$EndComp
Text Label 6250 2900 1    50   ~ 0
~WCLR-OR-RESET
Wire Wire Line
	6700 1800 7100 1800
Wire Wire Line
	7100 1800 7100 3950
Connection ~ 7100 3950
Text Label 6700 1800 0    50   ~ 0
~WCLR
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F709
P 6700 1450
AR Path="/5F67D4B5/5D33F709" Ref="TP?"  Part="1" 
AR Path="/5D33F709" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F709" Ref="TP1501"  Part="1" 
AR Path="/5D44ECB5/5D33F709" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F709" Ref="TP1501"  Part="1" 
F 0 "TP1501" V 6700 1650 50  0000 L CNN
F 1 "TestPoint" H 6758 1477 50  0001 L CNN
F 2 "" H 6900 1450 50  0001 C CNN
F 3 "~" H 6900 1450 50  0001 C CNN
	1    6700 1450
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F70F
P 5350 1700
AR Path="/5F67D4B5/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F70F" Ref="TP1503"  Part="1" 
AR Path="/5D44ECB5/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F70F" Ref="TP1503"  Part="1" 
F 0 "TP1503" H 5408 1772 50  0000 L CNN
F 1 "TestPoint" H 5408 1727 50  0001 L CNN
F 2 "" H 5550 1700 50  0001 C CNN
F 3 "~" H 5550 1700 50  0001 C CNN
	1    5350 1700
	1    0    0    -1  
$EndComp
Connection ~ 5350 1800
Wire Wire Line
	5350 1800 5750 1800
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F718
P 4600 2400
AR Path="/5F67D4B5/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F718" Ref="TP1506"  Part="1" 
AR Path="/5D44ECB5/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F718" Ref="TP1506"  Part="1" 
F 0 "TP1506" V 4600 2588 50  0000 L CNN
F 1 "TestPoint" H 4658 2427 50  0001 L CNN
F 2 "" H 4800 2400 50  0001 C CNN
F 3 "~" H 4800 2400 50  0001 C CNN
	1    4600 2400
	0    1    1    0   
$EndComp
Connection ~ 3200 2400
Wire Wire Line
	3200 2400 3250 2400
Wire Wire Line
	3200 2250 3200 2400
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F721
P 3200 2250
AR Path="/5F67D4B5/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F721" Ref="TP1505"  Part="1" 
AR Path="/5D44ECB5/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F721" Ref="TP1505"  Part="1" 
F 0 "TP1505" H 3250 2400 50  0000 L CNN
F 1 "TestPoint" H 3258 2277 50  0001 L CNN
F 2 "" H 3400 2250 50  0001 C CNN
F 3 "~" H 3400 2250 50  0001 C CNN
	1    3200 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F727
P 6250 3700
AR Path="/5F67D4B5/5D33F727" Ref="TP?"  Part="1" 
AR Path="/5D33F727" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F727" Ref="TP1507"  Part="1" 
AR Path="/5D44ECB5/5D33F727" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F727" Ref="TP1507"  Part="1" 
F 0 "TP1507" V 6250 3888 50  0000 L CNN
F 1 "TestPoint" H 6308 3727 50  0001 L CNN
F 2 "" H 6450 3700 50  0001 C CNN
F 3 "~" H 6450 3700 50  0001 C CNN
	1    6250 3700
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F72E
P 8150 1150
AR Path="/5D33F72E" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F72E" Ref="#PWR01502"  Part="1" 
AR Path="/5D44ECB5/5D33F72E" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F72E" Ref="#PWR01502"  Part="1" 
F 0 "#PWR01502" H 8150 1000 50  0001 C CNN
F 1 "+5V" H 8165 1323 50  0000 C CNN
F 2 "" H 8150 1150 50  0001 C CNN
F 3 "" H 8150 1150 50  0001 C CNN
	1    8150 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1150 7600 1150
Wire Wire Line
	7600 1150 7600 1450
Wire Wire Line
	7600 1450 7650 1450
Wire Wire Line
	5350 1700 5350 1800
Wire Wire Line
	7450 1800 7650 1800
Text Label 7450 1800 0    50   ~ 0
WCLK
Wire Wire Line
	6250 2150 8150 2150
Wire Wire Line
	8150 2150 8150 2100
Text Label 8100 2150 2    50   ~ 0
~WCLR-OR-RESET
$Comp
L alexios:74AHC1G125 U?
U 1 1 5D33F73E
P 9900 1800
AR Path="/5D33F73E" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F73E" Ref="U1508"  Part="1" 
AR Path="/5D44ECB5/5D33F73E" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F73E" Ref="U1504"  Part="1" 
F 0 "U1504" H 9950 1625 50  0000 C CNN
F 1 "74AHC1G125" H 9950 1534 50  0000 C CNN
F 2 "" H 10050 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10050 2050 50  0001 C CNN
	1    9900 1800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G125 U?
U 2 1 5D33F744
P 4200 7300
AR Path="/5D33F744" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D33F744" Ref="U1508"  Part="2" 
AR Path="/5D44ECB5/5D33F744" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D33F744" Ref="U1504"  Part="2" 
F 0 "U1504" H 4380 7346 50  0000 L CNN
F 1 "74AHC1G125" H 4380 7255 50  0000 L CNN
F 2 "" H 4350 7550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4350 7550 50  0001 C CNN
	2    4200 7300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged12 JP?
U 1 1 5D33F74A
P 10500 1800
AR Path="/5D33F74A" Ref="JP?"  Part="1" 
AR Path="/5D30488D/5D33F74A" Ref="JP1501"  Part="1" 
AR Path="/5D44ECB5/5D33F74A" Ref="JP?"  Part="1" 
AR Path="/5D46B22D/5D33F74A" Ref="JP1501"  Part="1" 
F 0 "JP1501" H 10500 1913 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 10500 1914 50  0001 C CNN
F 2 "" H 10500 1800 50  0001 C CNN
F 3 "~" H 10500 1800 50  0001 C CNN
	1    10500 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D33F750
P 10500 2050
AR Path="/5D33F750" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D33F750" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D33F750" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D33F750" Ref="R?"  Part="1" 
AR Path="/5F4B0011/5D33F750" Ref="R?"  Part="1" 
AR Path="/5F63066B/5D33F750" Ref="R?"  Part="1" 
AR Path="/5D30488D/5D33F750" Ref="R1501"  Part="1" 
AR Path="/5D44ECB5/5D33F750" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5D33F750" Ref="R1501"  Part="1" 
F 0 "R1501" H 10441 2096 50  0000 R CNN
F 1 "30Ω" H 10441 2005 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10500 2050 50  0001 C CNN
F 3 "~" H 10500 2050 50  0001 C CNN
	1    10500 2050
	1    0    0    -1  
$EndComp
Text Label 10550 2250 0    50   ~ 0
~W
Wire Wire Line
	10200 1800 10300 1800
Wire Wire Line
	9950 1300 9950 1600
$Comp
L alexios:74AHC1G04 U?
U 1 1 5D33F75A
P 9950 1100
AR Path="/5D33F75A" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F75A" Ref="U1507"  Part="1" 
AR Path="/5D44ECB5/5D33F75A" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F75A" Ref="U1501"  Part="1" 
F 0 "U1501" V 9850 950 50  0000 R CNN
F 1 "74AHC1G04" V 9950 950 50  0000 R CNN
F 2 "" H 9950 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9950 1100 50  0001 C CNN
	1    9950 1100
	0    1    1    0   
$EndComp
Text Label 1200 750  0    50   ~ 0
~HALT
Text HLabel 1100 750  0    50   Input ~ 0
~HALT
Wire Wire Line
	1100 2350 2050 2350
Text Notes 3000 2050 2    50   ~ 0
~WS~ is pulled up by the µPC circuit.
Wire Notes Line
	1650 2100 1650 2300
Text Label 9950 1550 1    50   ~ 0
~RUN
Wire Wire Line
	8600 1800 9700 1800
Wire Notes Line style solid
	8650 1850 8750 1850
Wire Notes Line style solid
	8750 1850 8750 1950
Wire Notes Line style solid
	8750 1950 8800 1950
Wire Notes Line style solid
	8800 1950 8800 1850
Wire Notes Line style solid
	8800 1850 8950 1850
Text Notes 9750 1900 2    50   ~ 0
Narrow Write strobe
Text Label 8650 1800 0    50   ~ 0
~WRITE-STROBE
Text Label 10200 1600 0    50   ~ 0
WCLK
Text Label 9950 750  2    50   ~ 0
~HALT
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F771
P 8600 1450
AR Path="/5F67D4B5/5D33F771" Ref="TP?"  Part="1" 
AR Path="/5D33F771" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F771" Ref="TP1502"  Part="1" 
AR Path="/5D44ECB5/5D33F771" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F771" Ref="TP1502"  Part="1" 
F 0 "TP1502" V 8600 1638 50  0000 L CNN
F 1 "TestPoint" H 8658 1477 50  0001 L CNN
F 2 "" H 8800 1450 50  0001 C CNN
F 3 "~" H 8800 1450 50  0001 C CNN
	1    8600 1450
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F777
P 3850 7300
AR Path="/5CC0D65F/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F777" Ref="C1502"  Part="1" 
AR Path="/5D44ECB5/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F777" Ref="C1507"  Part="1" 
F 0 "C1507" H 3759 7346 50  0000 R CNN
F 1 "100nF" H 3759 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3850 7300 50  0001 C CNN
F 3 "~" H 3850 7300 50  0001 C CNN
	1    3850 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F77D
P 3850 7400
AR Path="/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F77D" Ref="#PWR01508"  Part="1" 
AR Path="/5D44ECB5/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F77D" Ref="#PWR01520"  Part="1" 
F 0 "#PWR01520" H 3850 7150 50  0001 C CNN
F 1 "GND" H 3855 7227 50  0000 C CNN
F 2 "" H 3850 7400 50  0001 C CNN
F 3 "" H 3850 7400 50  0001 C CNN
	1    3850 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F784
P 3850 7200
AR Path="/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F784" Ref="#PWR01506"  Part="1" 
AR Path="/5D44ECB5/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F784" Ref="#PWR01516"  Part="1" 
F 0 "#PWR01516" H 3850 7050 50  0001 C CNN
F 1 "+5V" H 3865 7373 50  0000 C CNN
F 2 "" H 3850 7200 50  0001 C CNN
F 3 "" H 3850 7200 50  0001 C CNN
	1    3850 7200
	1    0    0    -1  
$EndComp
Text Label 7100 2900 1    50   ~ 0
~WCLR
$Comp
L alexios:74AC04 U?
U 4 1 5D33F78C
P 6150 5700
AR Path="/5D33F78C" Ref="U?"  Part="4" 
AR Path="/5D30488D/5D33F78C" Ref="U1509"  Part="4" 
AR Path="/5D44ECB5/5D33F78C" Ref="U?"  Part="4" 
AR Path="/5D46B22D/5D33F78C" Ref="U1509"  Part="4" 
F 0 "U1509" H 6150 6017 50  0000 C CNN
F 1 "74AC04" H 6150 5926 50  0000 C CNN
F 2 "" H 6150 5700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6150 5700 50  0001 C CNN
	4    6150 5700
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 5 1 5D33F792
P 6750 5700
AR Path="/5D33F792" Ref="U?"  Part="5" 
AR Path="/5D30488D/5D33F792" Ref="U1509"  Part="5" 
AR Path="/5D44ECB5/5D33F792" Ref="U?"  Part="5" 
AR Path="/5D46B22D/5D33F792" Ref="U1509"  Part="5" 
F 0 "U1509" H 6750 6017 50  0000 C CNN
F 1 "74AC04" H 6750 5926 50  0000 C CNN
F 2 "" H 6750 5700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6750 5700 50  0001 C CNN
	5    6750 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7100 5250 7100 5700
Wire Wire Line
	7100 5700 7050 5700
Wire Wire Line
	5850 5700 5600 5700
Wire Wire Line
	5600 5700 5600 5150
Text Label 7100 4700 3    50   ~ 0
~WCLR1
Text Label 7100 5350 3    50   ~ 0
~WCLR2
Text Label 5150 4850 0    50   ~ 0
~WCLR
Wire Wire Line
	6250 2100 6250 2150
Connection ~ 6250 2150
Wire Wire Line
	6250 2150 6250 3700
Text Label 5150 4950 0    50   ~ 0
~WCLR1
Text Label 5150 5050 0    50   ~ 0
~WCLR2
Text Label 5150 5150 0    50   ~ 0
WCLR3
Text Notes 7350 5600 0    50   ~ 0
Configurable delay line using pairs of NOT gates:\n\nHC: 0ns, 14ns, 28ns, 42ns.\nAHC: 0ns, 9ns, 18ns, 27ns.\nAC: 0ns, 7.5ns, 15ns, 22.5ns.\n\nThe appropriate 74 family member must be selected and a\njumper placed in the appropriate place to obtain a\nsuitable delay of the write pulse near the end of  the\nT34 clock phase.
Text Notes 7400 3100 0    50   ~ 0
Both Flip Flops are configured identically. One only creates\nthe pair's clear pulse. The other drives the ~W~ bus signal.\nThis is done so their driving power and propagation delay\nis unimpaired and the clear pulse is more predictable.
Wire Wire Line
	9950 750  9950 800 
Wire Wire Line
	5150 3300 10800 3300
Wire Wire Line
	10500 2150 10500 2250
Wire Wire Line
	10500 2250 10800 2250
$Comp
L power:+5V #PWR?
U 1 1 5D33F7B4
P 1000 7250
AR Path="/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F7B4" Ref="#PWR01517"  Part="1" 
AR Path="/5D44ECB5/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F7B4" Ref="#PWR01518"  Part="1" 
F 0 "#PWR01518" H 1000 7100 50  0001 C CNN
F 1 "+5V" H 1015 7423 50  0000 C CNN
F 2 "" H 1000 7250 50  0001 C CNN
F 3 "" H 1000 7250 50  0001 C CNN
	1    1000 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F7BB
P 1000 7450
AR Path="/5D33F7BB" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F7BB" Ref="#PWR01518"  Part="1" 
AR Path="/5D44ECB5/5D33F7BB" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F7BB" Ref="#PWR01522"  Part="1" 
F 0 "#PWR01522" H 1000 7200 50  0001 C CNN
F 1 "GND" H 1005 7277 50  0000 C CNN
F 2 "" H 1000 7450 50  0001 C CNN
F 3 "" H 1000 7450 50  0001 C CNN
	1    1000 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F7C1
P 1000 7350
AR Path="/5CC0D65F/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F7C1" Ref="C1507"  Part="1" 
AR Path="/5D44ECB5/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F7C1" Ref="C1509"  Part="1" 
F 0 "C1509" H 909 7396 50  0000 R CNN
F 1 "100nF" H 909 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1000 7350 50  0001 C CNN
F 3 "~" H 1000 7350 50  0001 C CNN
	1    1000 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 3 1 5D33F7C7
P 1350 7350
AR Path="/5D33F7C7" Ref="U?"  Part="3" 
AR Path="/5D30488D/5D33F7C7" Ref="U1506"  Part="3" 
AR Path="/5D44ECB5/5D33F7C7" Ref="U?"  Part="3" 
AR Path="/5D46B22D/5D33F7C7" Ref="U1502"  Part="3" 
F 0 "U1502" H 1530 7396 50  0000 L CNN
F 1 "74HC74" H 1530 7305 50  0000 L CNN
F 2 "" H 1300 7350 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1300 7350 50  0001 C CNN
	3    1350 7350
	1    0    0    -1  
$EndComp
Text HLabel 10800 3300 2    50   Output ~ 0
~BUSEN
Text Notes 10200 1450 0    50   ~ 0
The solder jumper\nbypasses the delay\ncircuit and allows\nsomething else to be\ninstalled as a patch.
$Comp
L Connector:TestPoint TP?
U 1 1 5D341E32
P 10700 1800
AR Path="/5F67D4B5/5D341E32" Ref="TP?"  Part="1" 
AR Path="/5D341E32" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D341E32" Ref="TP1504"  Part="1" 
AR Path="/5D44ECB5/5D341E32" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D341E32" Ref="TP1504"  Part="1" 
F 0 "TP1504" V 10700 1988 50  0000 L CNN
F 1 "TestPoint" H 10758 1827 50  0001 L CNN
F 2 "" H 10900 1800 50  0001 C CNN
F 3 "~" H 10900 1800 50  0001 C CNN
	1    10700 1800
	0    1    1    0   
$EndComp
Text HLabel 10800 2250 2    50   3State ~ 0
~W
$Comp
L alexios:74AHC1G08 U?
U 2 1 5D37D730
P 5750 6500
AR Path="/5D37D730" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D37D730" Ref="U1505"  Part="2" 
AR Path="/5D44ECB5/5D37D730" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D37D730" Ref="U1203"  Part="2" 
F 0 "U1203" H 5830 6446 50  0000 L CNN
F 1 "74AHC1G08" H 5830 6355 50  0000 L CNN
F 2 "" H 5400 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5400 6500 50  0001 C CNN
	2    5750 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D37DC51
P 5300 6600
AR Path="/5CC0D65F/5D37DC51" Ref="C?"  Part="1" 
AR Path="/5D37DC51" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D37DC51" Ref="C1508"  Part="1" 
AR Path="/5D44ECB5/5D37DC51" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D37DC51" Ref="C1505"  Part="1" 
F 0 "C1505" H 5209 6646 50  0000 R CNN
F 1 "100nF" H 5209 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5300 6600 50  0001 C CNN
F 3 "~" H 5300 6600 50  0001 C CNN
	1    5300 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01514
U 1 1 5D37E77C
P 5300 6700
F 0 "#PWR01514" H 5300 6450 50  0001 C CNN
F 1 "GND" H 5305 6527 50  0000 C CNN
F 2 "" H 5300 6700 50  0001 C CNN
F 3 "" H 5300 6700 50  0001 C CNN
	1    5300 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01510
U 1 1 5D37F17D
P 5300 6500
F 0 "#PWR01510" H 5300 6350 50  0001 C CNN
F 1 "+5V" H 5315 6673 50  0000 C CNN
F 2 "" H 5300 6500 50  0001 C CNN
F 3 "" H 5300 6500 50  0001 C CNN
	1    5300 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F601
P 1050 6500
AR Path="/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F601" Ref="#PWR01511"  Part="1" 
AR Path="/5D44ECB5/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F601" Ref="#PWR01507"  Part="1" 
F 0 "#PWR01507" H 1050 6350 50  0001 C CNN
F 1 "+5V" H 1065 6673 50  0000 C CNN
F 2 "" H 1050 6500 50  0001 C CNN
F 3 "" H 1050 6500 50  0001 C CNN
	1    1050 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F5FA
P 1050 6700
AR Path="/5D33F5FA" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F5FA" Ref="#PWR01515"  Part="1" 
AR Path="/5D44ECB5/5D33F5FA" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F5FA" Ref="#PWR01511"  Part="1" 
F 0 "#PWR01511" H 1050 6450 50  0001 C CNN
F 1 "GND" H 1055 6527 50  0000 C CNN
F 2 "" H 1050 6700 50  0001 C CNN
F 3 "" H 1050 6700 50  0001 C CNN
	1    1050 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F5E1
P 1050 6600
AR Path="/5CC0D65F/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F5E1" Ref="C1505"  Part="1" 
AR Path="/5D44ECB5/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F5E1" Ref="C1502"  Part="1" 
F 0 "C1502" H 959 6646 50  0000 R CNN
F 1 "100nF" H 959 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 6600 50  0001 C CNN
F 3 "~" H 1050 6600 50  0001 C CNN
	1    1050 6600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AUC1G74 U?
U 2 1 5D33F5D9
P 1400 6600
AR Path="/5D33F5D9" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D33F5D9" Ref="U1502"  Part="2" 
AR Path="/5D44ECB5/5D33F5D9" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D33F5D9" Ref="U1506"  Part="2" 
F 0 "U1506" H 1580 6646 50  0000 L CNN
F 1 "74AUC1G74" H 1580 6555 50  0000 L CNN
F 2 "" H 1850 6600 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1850 6600 50  0001 C CNN
	2    1400 6600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G32 U?
U 2 1 5D33F5E7
P 1450 5600
AR Path="/5D33F5E7" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D33F5E7" Ref="U1501"  Part="2" 
AR Path="/5D44ECB5/5D33F5E7" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D33F5E7" Ref="U1505"  Part="2" 
F 0 "U1505" H 1580 5396 50  0000 L CNN
F 1 "74AHC1G32" H 1580 5305 50  0000 L CNN
F 2 "" H 1460 5580 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1460 5580 50  0001 C CNN
	2    1450 5600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F608
P 1050 5750
AR Path="/5D33F608" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F608" Ref="#PWR01509"  Part="1" 
AR Path="/5D44ECB5/5D33F608" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F608" Ref="#PWR01505"  Part="1" 
F 0 "#PWR01505" H 1050 5600 50  0001 C CNN
F 1 "+5V" H 1065 5923 50  0000 C CNN
F 2 "" H 1050 5750 50  0001 C CNN
F 3 "" H 1050 5750 50  0001 C CNN
	1    1050 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F5F3
P 1050 5950
AR Path="/5D33F5F3" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F5F3" Ref="#PWR01513"  Part="1" 
AR Path="/5D44ECB5/5D33F5F3" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F5F3" Ref="#PWR01506"  Part="1" 
F 0 "#PWR01506" H 1050 5700 50  0001 C CNN
F 1 "GND" H 1055 5777 50  0000 C CNN
F 2 "" H 1050 5950 50  0001 C CNN
F 3 "" H 1050 5950 50  0001 C CNN
	1    1050 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F5ED
P 1050 5850
AR Path="/5CC0D65F/5D33F5ED" Ref="C?"  Part="1" 
AR Path="/5D33F5ED" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F5ED" Ref="C1503"  Part="1" 
AR Path="/5D44ECB5/5D33F5ED" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F5ED" Ref="C1501"  Part="1" 
F 0 "C1501" H 959 5896 50  0000 R CNN
F 1 "100nF" H 959 5805 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 5850 50  0001 C CNN
F 3 "~" H 1050 5850 50  0001 C CNN
	1    1050 5850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G04 U?
U 2 1 5D421837
P 2800 7300
AR Path="/5D421837" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D421837" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D421837" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D421837" Ref="U1103"  Part="2" 
F 0 "U1103" H 2980 7346 50  0000 L CNN
F 1 "74AHC1G04" H 2980 7255 50  0000 L CNN
F 2 "" H 2800 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2800 7300 50  0001 C CNN
	2    2800 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4281C6
P 2450 7300
AR Path="/5CC0D65F/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D4281C6" Ref="C1506"  Part="1" 
F 0 "C1506" H 2359 7346 50  0000 R CNN
F 1 "100nF" H 2359 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2450 7300 50  0001 C CNN
F 3 "~" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01519
U 1 1 5D428DF8
P 2450 7400
F 0 "#PWR01519" H 2450 7150 50  0001 C CNN
F 1 "GND" H 2455 7227 50  0000 C CNN
F 2 "" H 2450 7400 50  0001 C CNN
F 3 "" H 2450 7400 50  0001 C CNN
	1    2450 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01515
U 1 1 5D429670
P 2450 7200
F 0 "#PWR01515" H 2450 7050 50  0001 C CNN
F 1 "+5V" H 2465 7373 50  0000 C CNN
F 2 "" H 2450 7200 50  0001 C CNN
F 3 "" H 2450 7200 50  0001 C CNN
	1    2450 7200
	1    0    0    -1  
$EndComp
Text Notes 2100 1550 0    100  ~ 20
Wait State Handling
Text Notes 7400 2500 0    100  ~ 20
Write Pulse Generator
Text Notes 7350 4550 0    100  ~ 20
Write Pulse Width
Wire Wire Line
	1100 750  9950 750 
Text Notes 7050 7000 0    197  ~ 39
Wait States, Write Strobes
$EndSCHEMATC
