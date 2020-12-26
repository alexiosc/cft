EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 15
Title "Activity LEDs"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 60F3945C
P 5650 2300
AR Path="/66CDCD87/60F3945C" Ref="C?"  Part="1" 
AR Path="/60A2F394/60F3945C" Ref="C?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F3945C" Ref="C40"  Part="1" 
AR Path="/66CDCD87/6100D438/60F3945C" Ref="C?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F3945C" Ref="C43"  Part="1" 
AR Path="/60757845/611019EB/60F3945C" Ref="C?"  Part="1" 
AR Path="/60757845/611243B5/60F3945C" Ref="C?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F3945C" Ref="C?"  Part="1" 
AR Path="/5FEAC8E9/60F3945C" Ref="C?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F3945C" Ref="C46"  Part="1" 
F 0 "C46" V 5450 2400 50  0000 C CNN
F 1 "1μF" V 5550 2500 50  0000 C CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5650 2300 50  0001 C CNN
F 3 "~" H 5650 2300 50  0001 C CNN
	1    5650 2300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F39462
P 6000 2500
AR Path="/66CDCD87/60F39462" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60F39462" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F39462" Ref="#PWR0112"  Part="1" 
AR Path="/66CDCD87/6100D438/60F39462" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F39462" Ref="#PWR0122"  Part="1" 
AR Path="/60757845/611019EB/60F39462" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60F39462" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F39462" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60F39462" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F39462" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 6000 2250 50  0001 C CNN
F 1 "GND" H 6050 2300 50  0000 C CNN
F 2 "" H 6000 2500 50  0001 C CNN
F 3 "" H 6000 2500 50  0001 C CNN
	1    6000 2500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC123 U?
U 1 1 60F3946E
P 5550 2900
AR Path="/66CDCD87/60F3946E" Ref="U?"  Part="1" 
AR Path="/60A2F394/60F3946E" Ref="U?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F3946E" Ref="U22"  Part="1" 
AR Path="/66CDCD87/6100D438/60F3946E" Ref="U?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F3946E" Ref="U23"  Part="1" 
AR Path="/60757845/611019EB/60F3946E" Ref="U?"  Part="1" 
AR Path="/60757845/611243B5/60F3946E" Ref="U?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F3946E" Ref="U?"  Part="1" 
AR Path="/5FEAC8E9/60F3946E" Ref="U?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F3946E" Ref="U24"  Part="1" 
F 0 "U24" H 5550 2601 50  0000 C CNN
F 1 "74HC123" H 5550 2510 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5550 2900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT123.pdf" H 5550 2900 50  0001 C CNN
	1    5550 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2300 5550 2300
Connection ~ 5550 2300
Connection ~ 5750 2300
$Comp
L power:+5V #PWR?
U 1 1 60F39478
P 5000 2250
AR Path="/66CDCD87/60F39478" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60F39478" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F39478" Ref="#PWR0106"  Part="1" 
AR Path="/66CDCD87/6100D438/60F39478" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F39478" Ref="#PWR0116"  Part="1" 
AR Path="/60757845/611019EB/60F39478" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60F39478" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F39478" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60F39478" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F39478" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 5000 2100 50  0001 C CNN
F 1 "+5V" H 4850 2300 50  0000 C CNN
F 2 "" H 5000 2250 50  0001 C CNN
F 3 "" H 5000 2250 50  0001 C CNN
	1    5000 2250
	1    0    0    -1  
$EndComp
Text Label 3550 2950 0    50   ~ 0
~LED1
NoConn ~ 6000 2950
$Comp
L alexios:74HC123 U?
U 3 1 60F394EA
P 5550 5900
AR Path="/66CDCD87/60F394EA" Ref="U?"  Part="3" 
AR Path="/60A2F394/60F394EA" Ref="U?"  Part="3" 
AR Path="/66CDCD87/60FF3530/60F394EA" Ref="U22"  Part="3" 
AR Path="/66CDCD87/6100D438/60F394EA" Ref="U?"  Part="3" 
AR Path="/66CDCD87/610E2BBB/60F394EA" Ref="U23"  Part="3" 
AR Path="/60757845/611019EB/60F394EA" Ref="U?"  Part="3" 
AR Path="/60757845/611243B5/60F394EA" Ref="U?"  Part="3" 
AR Path="/5FE640D1/5FE9C190/60F394EA" Ref="U?"  Part="3" 
AR Path="/5FEAC8E9/60F394EA" Ref="U?"  Part="3" 
AR Path="/60757845/5FED7B4A/60F394EA" Ref="U24"  Part="3" 
F 0 "U24" H 5730 5946 50  0000 L CNN
F 1 "74HC123" H 5730 5855 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5550 5900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT123.pdf" H 5550 5900 50  0001 C CNN
	3    5550 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60F394F0
P 5250 5900
AR Path="/60F394F0" Ref="C?"  Part="1" 
AR Path="/60757845/60F394F0" Ref="C?"  Part="1" 
AR Path="/64FC7999/60F394F0" Ref="C?"  Part="1" 
AR Path="/66CDCD87/60F394F0" Ref="C?"  Part="1" 
AR Path="/60A2F394/60F394F0" Ref="C?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F394F0" Ref="C39"  Part="1" 
AR Path="/66CDCD87/6100D438/60F394F0" Ref="C?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F394F0" Ref="C42"  Part="1" 
AR Path="/60757845/611019EB/60F394F0" Ref="C?"  Part="1" 
AR Path="/60757845/611243B5/60F394F0" Ref="C?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F394F0" Ref="C?"  Part="1" 
AR Path="/5FEAC8E9/60F394F0" Ref="C?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F394F0" Ref="C45"  Part="1" 
F 0 "C45" H 5159 5946 50  0000 R CNN
F 1 "100nF" H 5159 5855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 5900 50  0001 C CNN
F 3 "~" H 5250 5900 50  0001 C CNN
	1    5250 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60F394F6
P 5250 5800
AR Path="/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F394F6" Ref="#PWR0110"  Part="1" 
AR Path="/66CDCD87/6100D438/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F394F6" Ref="#PWR0120"  Part="1" 
AR Path="/60757845/611019EB/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60F394F6" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F394F6" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 5250 5650 50  0001 C CNN
F 1 "+5V" H 5265 5973 50  0000 C CNN
F 2 "" H 5250 5800 50  0001 C CNN
F 3 "" H 5250 5800 50  0001 C CNN
	1    5250 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F394FC
P 5250 6000
AR Path="/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F394FC" Ref="#PWR0111"  Part="1" 
AR Path="/66CDCD87/6100D438/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F394FC" Ref="#PWR0121"  Part="1" 
AR Path="/60757845/611019EB/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60F394FC" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F394FC" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 5250 5750 50  0001 C CNN
F 1 "GND" H 5255 5827 50  0000 C CNN
F 2 "" H 5250 6000 50  0001 C CNN
F 3 "" H 5250 6000 50  0001 C CNN
	1    5250 6000
	1    0    0    -1  
$EndComp
Connection ~ 5250 5800
Connection ~ 5250 6000
$Comp
L Device:D_Schottky_ALT D?
U 1 1 60F39504
P 5350 2050
AR Path="/66CDCD87/60F39504" Ref="D?"  Part="1" 
AR Path="/60A2F394/60F39504" Ref="D?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F39504" Ref="D5"  Part="1" 
AR Path="/66CDCD87/6100D438/60F39504" Ref="D?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F39504" Ref="D9"  Part="1" 
AR Path="/60757845/611019EB/60F39504" Ref="D?"  Part="1" 
AR Path="/60757845/611243B5/60F39504" Ref="D?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F39504" Ref="D?"  Part="1" 
AR Path="/5FEAC8E9/60F39504" Ref="D?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F39504" Ref="D13"  Part="1" 
F 0 "D13" H 5350 2267 50  0000 C CNN
F 1 "D_Schottky_ALT" H 5500 2150 50  0000 C CNN
F 2 "alexios:SOD-323" H 5350 2050 50  0001 C CNN
F 3 "~" H 5350 2050 50  0001 C CNN
	1    5350 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2050 5550 2050
Wire Wire Line
	5550 2050 5550 2300
Wire Wire Line
	5100 2950 3450 2950
Wire Wire Line
	6000 3050 6200 3050
Wire Wire Line
	6950 3050 6950 3000
Wire Wire Line
	6800 3050 6950 3050
$Comp
L power:+5V #PWR?
U 1 1 60F3949C
P 6950 3000
AR Path="/66CDCD87/60F3949C" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60F3949C" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F3949C" Ref="#PWR0114"  Part="1" 
AR Path="/66CDCD87/6100D438/60F3949C" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F3949C" Ref="#PWR0124"  Part="1" 
AR Path="/60757845/611019EB/60F3949C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60F3949C" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F3949C" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60F3949C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F3949C" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 6950 2850 50  0001 C CNN
F 1 "+5V" H 7100 3100 50  0000 C CNN
F 2 "" H 6950 3000 50  0001 C CNN
F 3 "" H 6950 3000 50  0001 C CNN
	1    6950 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3050 5050 3050
Wire Wire Line
	5050 3050 5050 3100
$Comp
L power:GND #PWR?
U 1 1 60F77FA6
P 5050 3100
AR Path="/66CDCD87/60F77FA6" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60F77FA6" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F77FA6" Ref="#PWR0108"  Part="1" 
AR Path="/66CDCD87/6100D438/60F77FA6" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F77FA6" Ref="#PWR0118"  Part="1" 
AR Path="/60757845/611019EB/60F77FA6" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60F77FA6" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F77FA6" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60F77FA6" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F77FA6" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 5050 2850 50  0001 C CNN
F 1 "GND" H 5055 2927 50  0000 C CNN
F 2 "" H 5050 3100 50  0001 C CNN
F 3 "" H 5050 3100 50  0001 C CNN
	1    5050 3100
	1    0    0    -1  
$EndComp
Text HLabel 3450 2950 0    50   Input ~ 0
~LED1
$Comp
L Device:LED_ALT D?
U 1 1 60F93891
P 6650 3050
AR Path="/60F93891" Ref="D?"  Part="1" 
AR Path="/64C48268/60F93891" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/60F93891" Ref="D?"  Part="1" 
AR Path="/60A2F394/60F93891" Ref="D?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F93891" Ref="D7"  Part="1" 
AR Path="/66CDCD87/6100D438/60F93891" Ref="D?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F93891" Ref="D11"  Part="1" 
AR Path="/60757845/611019EB/60F93891" Ref="D?"  Part="1" 
AR Path="/60757845/611243B5/60F93891" Ref="D?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F93891" Ref="D?"  Part="1" 
AR Path="/5FEAC8E9/60F93891" Ref="D?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F93891" Ref="D15"  Part="1" 
F 0 "D15" H 6643 2886 50  0000 C CNN
F 1 "LED_ALT" H 6643 2886 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6650 3050 50  0001 C CNN
F 3 "~" H 6650 3050 50  0001 C CNN
	1    6650 3050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60F9A7AA
P 6300 3050
AR Path="/60F9A7AA" Ref="R?"  Part="1" 
AR Path="/64C48268/60F9A7AA" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/60F9A7AA" Ref="R?"  Part="1" 
AR Path="/60A2F394/60F9A7AA" Ref="R?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F9A7AA" Ref="R18"  Part="1" 
AR Path="/66CDCD87/6100D438/60F9A7AA" Ref="R?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F9A7AA" Ref="R24"  Part="1" 
AR Path="/60757845/611019EB/60F9A7AA" Ref="R?"  Part="1" 
AR Path="/60757845/611243B5/60F9A7AA" Ref="R?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F9A7AA" Ref="R?"  Part="1" 
AR Path="/5FEAC8E9/60F9A7AA" Ref="R?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F9A7AA" Ref="R30"  Part="1" 
F 0 "R30" V 6496 3050 50  0000 C CNN
F 1 "680Ω" V 6405 3050 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6300 3050 50  0001 C CNN
F 3 "~" H 6300 3050 50  0001 C CNN
	1    6300 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6400 3050 6500 3050
$Comp
L Device:R_Small R?
U 1 1 60F9FFDA
P 5000 2600
AR Path="/60F9FFDA" Ref="R?"  Part="1" 
AR Path="/64C48268/60F9FFDA" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/60F9FFDA" Ref="R?"  Part="1" 
AR Path="/60A2F394/60F9FFDA" Ref="R?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F9FFDA" Ref="R14"  Part="1" 
AR Path="/66CDCD87/6100D438/60F9FFDA" Ref="R?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F9FFDA" Ref="R20"  Part="1" 
AR Path="/60757845/611019EB/60F9FFDA" Ref="R?"  Part="1" 
AR Path="/60757845/611243B5/60F9FFDA" Ref="R?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F9FFDA" Ref="R?"  Part="1" 
AR Path="/5FEAC8E9/60F9FFDA" Ref="R?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F9FFDA" Ref="R26"  Part="1" 
F 0 "R26" H 4942 2646 50  0000 R CNN
F 1 "4.7kΩ" H 4942 2555 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 2600 50  0001 C CNN
F 3 "~" H 5000 2600 50  0001 C CNN
	1    5000 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2500 6000 2300
Wire Wire Line
	5750 2300 6000 2300
Wire Wire Line
	5750 2300 5750 2500
Wire Wire Line
	5550 2300 5550 2500
Wire Wire Line
	5000 2300 5150 2300
Connection ~ 5000 2300
Wire Wire Line
	5000 2300 5000 2500
Wire Wire Line
	5000 2700 5000 2750
Wire Wire Line
	5000 2750 5100 2750
Wire Wire Line
	5000 2250 5000 2300
Wire Wire Line
	5200 2050 5150 2050
Wire Wire Line
	5150 2050 5150 2300
Connection ~ 5150 2300
Wire Wire Line
	5150 2300 5300 2300
$Comp
L Device:R_Small R?
U 1 1 60F39468
P 5400 2300
AR Path="/66CDCD87/60F39468" Ref="R?"  Part="1" 
AR Path="/60A2F394/60F39468" Ref="R?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60F39468" Ref="R16"  Part="1" 
AR Path="/66CDCD87/6100D438/60F39468" Ref="R?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60F39468" Ref="R22"  Part="1" 
AR Path="/60757845/611019EB/60F39468" Ref="R?"  Part="1" 
AR Path="/60757845/611243B5/60F39468" Ref="R?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60F39468" Ref="R?"  Part="1" 
AR Path="/5FEAC8E9/60F39468" Ref="R?"  Part="1" 
AR Path="/60757845/5FED7B4A/60F39468" Ref="R28"  Part="1" 
F 0 "R28" V 5300 2300 50  0000 C CNN
F 1 "100kΩ" V 5500 2200 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5400 2300 50  0001 C CNN
F 3 "~" H 5400 2300 50  0001 C CNN
	1    5400 2300
	0    1    1    0   
$EndComp
Text Notes 6600 2150 0    50   ~ 0
t (ns) = 0.45 × Rext (kΩ) × Cext (pF)\nRext = 100kΩ\nCext = 1μF = 1×10⁶ pF\n⇒ t = 0.45 × 100 × 10⁶ = 45000000ns = 0.045s
Text Notes 7350 3100 0    50   ~ 0
The LEDs I'm using are insanely bright,\nso I reduce their current significantly.\nI'm sure the '123s are happy about\nthat too.
$Comp
L Device:C_Small C?
U 1 1 60FE8DAA
P 5650 4050
AR Path="/66CDCD87/60FE8DAA" Ref="C?"  Part="1" 
AR Path="/60A2F394/60FE8DAA" Ref="C?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DAA" Ref="C41"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8DAA" Ref="C?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DAA" Ref="C44"  Part="1" 
AR Path="/60757845/611019EB/60FE8DAA" Ref="C?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DAA" Ref="C?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DAA" Ref="C?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DAA" Ref="C?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DAA" Ref="C47"  Part="1" 
F 0 "C47" V 5450 4150 50  0000 C CNN
F 1 "1μF" V 5550 4250 50  0000 C CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5650 4050 50  0001 C CNN
F 3 "~" H 5650 4050 50  0001 C CNN
	1    5650 4050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60FE8DB0
P 6000 4250
AR Path="/66CDCD87/60FE8DB0" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60FE8DB0" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DB0" Ref="#PWR0113"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8DB0" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DB0" Ref="#PWR0123"  Part="1" 
AR Path="/60757845/611019EB/60FE8DB0" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DB0" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DB0" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DB0" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DB0" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 6000 4000 50  0001 C CNN
F 1 "GND" H 6050 4050 50  0000 C CNN
F 2 "" H 6000 4250 50  0001 C CNN
F 3 "" H 6000 4250 50  0001 C CNN
	1    6000 4250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC123 U?
U 2 1 60FE8DB6
P 5550 4650
AR Path="/66CDCD87/60FE8DB6" Ref="U?"  Part="1" 
AR Path="/60A2F394/60FE8DB6" Ref="U?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DB6" Ref="U22"  Part="2" 
AR Path="/66CDCD87/6100D438/60FE8DB6" Ref="U?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DB6" Ref="U23"  Part="2" 
AR Path="/60757845/611019EB/60FE8DB6" Ref="U?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DB6" Ref="U?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DB6" Ref="U?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DB6" Ref="U?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DB6" Ref="U24"  Part="2" 
F 0 "U24" H 5550 4351 50  0000 C CNN
F 1 "74HC123" H 5550 4260 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5550 4650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT123.pdf" H 5550 4650 50  0001 C CNN
	2    5550 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4050 5550 4050
Connection ~ 5550 4050
Connection ~ 5750 4050
$Comp
L power:+5V #PWR?
U 1 1 60FE8DBF
P 5000 4000
AR Path="/66CDCD87/60FE8DBF" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60FE8DBF" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DBF" Ref="#PWR0107"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8DBF" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DBF" Ref="#PWR0117"  Part="1" 
AR Path="/60757845/611019EB/60FE8DBF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DBF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DBF" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 5000 3850 50  0001 C CNN
F 1 "+5V" H 4850 4050 50  0000 C CNN
F 2 "" H 5000 4000 50  0001 C CNN
F 3 "" H 5000 4000 50  0001 C CNN
	1    5000 4000
	1    0    0    -1  
$EndComp
Text Label 3550 4700 0    50   ~ 0
~LED2
NoConn ~ 6000 4700
$Comp
L Device:D_Schottky_ALT D?
U 1 1 60FE8DC7
P 5350 3800
AR Path="/66CDCD87/60FE8DC7" Ref="D?"  Part="1" 
AR Path="/60A2F394/60FE8DC7" Ref="D?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DC7" Ref="D6"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8DC7" Ref="D?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DC7" Ref="D10"  Part="1" 
AR Path="/60757845/611019EB/60FE8DC7" Ref="D?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DC7" Ref="D?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DC7" Ref="D?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DC7" Ref="D?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DC7" Ref="D14"  Part="1" 
F 0 "D14" H 5350 4017 50  0000 C CNN
F 1 "D_Schottky_ALT" H 5500 3900 50  0000 C CNN
F 2 "alexios:SOD-323" H 5350 3800 50  0001 C CNN
F 3 "~" H 5350 3800 50  0001 C CNN
	1    5350 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3800 5550 3800
Wire Wire Line
	5550 3800 5550 4050
Wire Wire Line
	5100 4700 3450 4700
Wire Wire Line
	6000 4800 6200 4800
Wire Wire Line
	6950 4800 6950 4750
Wire Wire Line
	6800 4800 6950 4800
$Comp
L power:+5V #PWR?
U 1 1 60FE8DD3
P 6950 4750
AR Path="/66CDCD87/60FE8DD3" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60FE8DD3" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DD3" Ref="#PWR0115"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8DD3" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DD3" Ref="#PWR0125"  Part="1" 
AR Path="/60757845/611019EB/60FE8DD3" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DD3" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DD3" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DD3" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DD3" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 6950 4600 50  0001 C CNN
F 1 "+5V" H 7100 4850 50  0000 C CNN
F 2 "" H 6950 4750 50  0001 C CNN
F 3 "" H 6950 4750 50  0001 C CNN
	1    6950 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4800 5050 4800
Wire Wire Line
	5050 4800 5050 4850
$Comp
L power:GND #PWR?
U 1 1 60FE8DDB
P 5050 4850
AR Path="/66CDCD87/60FE8DDB" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/60FE8DDB" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DDB" Ref="#PWR0109"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8DDB" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DDB" Ref="#PWR0119"  Part="1" 
AR Path="/60757845/611019EB/60FE8DDB" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DDB" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DDB" Ref="#PWR?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DDB" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DDB" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 5050 4600 50  0001 C CNN
F 1 "GND" H 5055 4677 50  0000 C CNN
F 2 "" H 5050 4850 50  0001 C CNN
F 3 "" H 5050 4850 50  0001 C CNN
	1    5050 4850
	1    0    0    -1  
$EndComp
Text HLabel 3450 4700 0    50   Input ~ 0
~LED2
$Comp
L Device:LED_ALT D?
U 1 1 60FE8DE2
P 6650 4800
AR Path="/60FE8DE2" Ref="D?"  Part="1" 
AR Path="/64C48268/60FE8DE2" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/60FE8DE2" Ref="D?"  Part="1" 
AR Path="/60A2F394/60FE8DE2" Ref="D?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DE2" Ref="D8"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8DE2" Ref="D?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DE2" Ref="D12"  Part="1" 
AR Path="/60757845/611019EB/60FE8DE2" Ref="D?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DE2" Ref="D?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DE2" Ref="D?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DE2" Ref="D?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DE2" Ref="D16"  Part="1" 
F 0 "D16" H 6643 4636 50  0000 C CNN
F 1 "LED_ALT" H 6643 4636 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6650 4800 50  0001 C CNN
F 3 "~" H 6650 4800 50  0001 C CNN
	1    6650 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60FE8DE8
P 6300 4800
AR Path="/60FE8DE8" Ref="R?"  Part="1" 
AR Path="/64C48268/60FE8DE8" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/60FE8DE8" Ref="R?"  Part="1" 
AR Path="/60A2F394/60FE8DE8" Ref="R?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DE8" Ref="R19"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8DE8" Ref="R?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DE8" Ref="R25"  Part="1" 
AR Path="/60757845/611019EB/60FE8DE8" Ref="R?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DE8" Ref="R?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DE8" Ref="R?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DE8" Ref="R?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DE8" Ref="R31"  Part="1" 
F 0 "R31" V 6496 4800 50  0000 C CNN
F 1 "680Ω" V 6405 4800 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6300 4800 50  0001 C CNN
F 3 "~" H 6300 4800 50  0001 C CNN
	1    6300 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6400 4800 6500 4800
$Comp
L Device:R_Small R?
U 1 1 60FE8DEF
P 5000 4350
AR Path="/60FE8DEF" Ref="R?"  Part="1" 
AR Path="/64C48268/60FE8DEF" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/60FE8DEF" Ref="R?"  Part="1" 
AR Path="/60A2F394/60FE8DEF" Ref="R?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8DEF" Ref="R15"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8DEF" Ref="R?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8DEF" Ref="R21"  Part="1" 
AR Path="/60757845/611019EB/60FE8DEF" Ref="R?"  Part="1" 
AR Path="/60757845/611243B5/60FE8DEF" Ref="R?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8DEF" Ref="R?"  Part="1" 
AR Path="/5FEAC8E9/60FE8DEF" Ref="R?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8DEF" Ref="R27"  Part="1" 
F 0 "R27" H 4942 4396 50  0000 R CNN
F 1 "4.7kΩ" H 4942 4305 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 4350 50  0001 C CNN
F 3 "~" H 5000 4350 50  0001 C CNN
	1    5000 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4250 6000 4050
Wire Wire Line
	5750 4050 6000 4050
Wire Wire Line
	5750 4050 5750 4250
Wire Wire Line
	5550 4050 5550 4250
Wire Wire Line
	5000 4050 5150 4050
Connection ~ 5000 4050
Wire Wire Line
	5000 4050 5000 4250
Wire Wire Line
	5000 4450 5000 4500
Wire Wire Line
	5000 4500 5100 4500
Wire Wire Line
	5000 4000 5000 4050
Wire Wire Line
	5200 3800 5150 3800
Wire Wire Line
	5150 3800 5150 4050
Connection ~ 5150 4050
Wire Wire Line
	5150 4050 5300 4050
$Comp
L Device:R_Small R?
U 1 1 60FE8E03
P 5400 4050
AR Path="/66CDCD87/60FE8E03" Ref="R?"  Part="1" 
AR Path="/60A2F394/60FE8E03" Ref="R?"  Part="1" 
AR Path="/66CDCD87/60FF3530/60FE8E03" Ref="R17"  Part="1" 
AR Path="/66CDCD87/6100D438/60FE8E03" Ref="R?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/60FE8E03" Ref="R23"  Part="1" 
AR Path="/60757845/611019EB/60FE8E03" Ref="R?"  Part="1" 
AR Path="/60757845/611243B5/60FE8E03" Ref="R?"  Part="1" 
AR Path="/5FE640D1/5FE9C190/60FE8E03" Ref="R?"  Part="1" 
AR Path="/5FEAC8E9/60FE8E03" Ref="R?"  Part="1" 
AR Path="/60757845/5FED7B4A/60FE8E03" Ref="R29"  Part="1" 
F 0 "R29" V 5300 4050 50  0000 C CNN
F 1 "100kΩ" V 5500 3950 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5400 4050 50  0001 C CNN
F 3 "~" H 5400 4050 50  0001 C CNN
	1    5400 4050
	0    1    1    0   
$EndComp
Text Notes 7350 3400 0    50   ~ 0
1.2kΩ for I=2mA, Vf=2.65V.
Text Notes 7350 3550 0    50   ~ 0
Vf=2.1V (red 0805 LEDs), I=20mA: R=145Ω (use 150Ω)\nVf=3.2V (green 0805 LEDs), I=20mA: R=90Ω (use 100Ω)
$EndSCHEMATC
