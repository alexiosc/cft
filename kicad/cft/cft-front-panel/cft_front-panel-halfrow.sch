EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title "Single 8-LED Row"
Date ""
Rev "2026"
Comp ""
Comment1 "FPM"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3000 3450 1    50   ~ 0
D[0..7]
Text HLabel 2650 2800 0    50   Input ~ 0
D[0..7]
Wire Bus Line
	2900 2800 2650 2800
Entry Bus Bus
	2900 2800 3000 2900
Entry Wire Line
	3000 3700 3100 3800
Entry Wire Line
	3000 3600 3100 3700
Entry Wire Line
	3000 3500 3100 3600
Entry Wire Line
	3000 3400 3100 3500
Entry Wire Line
	3000 3300 3100 3400
Entry Wire Line
	3000 3200 3100 3300
Entry Wire Line
	3000 3100 3100 3200
Entry Wire Line
	3000 3000 3100 3100
$Comp
L power:+5V #PWR?
U 1 1 5CC30FA9
P 5800 7150
AR Path="/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5CC02B94/5CC30FA9" Ref="#PWR064"  Part="1" 
AR Path="/5CC377D5/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5CC37D0C/5CC30FA9" Ref="#PWR040"  Part="1" 
AR Path="/5CC37D11/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5CC382A2/5CC30FA9" Ref="#PWR046"  Part="1" 
AR Path="/5CC382A7/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5CC382AC/5CC30FA9" Ref="#PWR052"  Part="1" 
AR Path="/5CC382B1/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5CC38618/5CC30FA9" Ref="#PWR058"  Part="1" 
AR Path="/5CC3861D/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5F6/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5FB/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D17E600/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D17E605/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D17E622/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D191B3C/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D191B41/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D191B46/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D191B4B/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D191B68/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3362/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3367/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D1E336C/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3371/5CC30FA9" Ref="#PWR?"  Part="1" 
AR Path="/5D1E338D/5CC30FA9" Ref="#PWR?"  Part="1" 
F 0 "#PWR040" H 5800 7000 50  0001 C CNN
F 1 "+5V" H 5815 7323 50  0000 C CNN
F 2 "" H 5800 7150 50  0001 C CNN
F 3 "" H 5800 7150 50  0001 C CNN
	1    5800 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CC30FAF
P 5800 7350
AR Path="/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5CC02B94/5CC30FAF" Ref="#PWR066"  Part="1" 
AR Path="/5CC377D5/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5CC37D0C/5CC30FAF" Ref="#PWR042"  Part="1" 
AR Path="/5CC37D11/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5CC382A2/5CC30FAF" Ref="#PWR048"  Part="1" 
AR Path="/5CC382A7/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5CC382AC/5CC30FAF" Ref="#PWR054"  Part="1" 
AR Path="/5CC382B1/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5CC38618/5CC30FAF" Ref="#PWR060"  Part="1" 
AR Path="/5CC3861D/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5F6/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5FB/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D17E600/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D17E605/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D17E622/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D191B3C/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D191B41/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D191B46/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D191B4B/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D191B68/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3362/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3367/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D1E336C/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3371/5CC30FAF" Ref="#PWR?"  Part="1" 
AR Path="/5D1E338D/5CC30FAF" Ref="#PWR?"  Part="1" 
F 0 "#PWR042" H 5800 7100 50  0001 C CNN
F 1 "GND" H 5805 7177 50  0000 C CNN
F 2 "" H 5800 7350 50  0001 C CNN
F 3 "" H 5800 7350 50  0001 C CNN
	1    5800 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC573 U?
U 2 1 5CC30FB5
P 6300 7650
AR Path="/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5CC02B94/5CC30FB5" Ref="U11"  Part="2" 
AR Path="/5CC377D5/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5CC37D0C/5CC30FB5" Ref="U3"  Part="2" 
AR Path="/5CC37D11/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5CC382A2/5CC30FB5" Ref="U5"  Part="2" 
AR Path="/5CC382A7/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5CC382AC/5CC30FB5" Ref="U7"  Part="2" 
AR Path="/5CC382B1/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5CC38618/5CC30FB5" Ref="U9"  Part="2" 
AR Path="/5CC3861D/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D17E5F6/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D17E5FB/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D17E600/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D17E605/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D17E622/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D191B3C/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D191B41/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D191B46/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D191B4B/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D191B68/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D1E3362/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D1E3367/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D1E336C/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D1E3371/5CC30FB5" Ref="U?"  Part="2" 
AR Path="/5D1E338D/5CC30FB5" Ref="U?"  Part="2" 
F 0 "U3" H 6330 8096 50  0000 L CNN
F 1 "74HC573" H 6330 8005 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 6300 7650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 6300 7650 50  0001 C CNN
	2    6300 7650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC573 U?
U 1 1 5CC30FBB
P 4200 3600
AR Path="/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5CC02B94/5CC30FBB" Ref="U11"  Part="1" 
AR Path="/5CC377D5/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5CC37D0C/5CC30FBB" Ref="U3"  Part="1" 
AR Path="/5CC37D11/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5CC382A2/5CC30FBB" Ref="U5"  Part="1" 
AR Path="/5CC382A7/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5CC382AC/5CC30FBB" Ref="U7"  Part="1" 
AR Path="/5CC382B1/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5CC38618/5CC30FBB" Ref="U9"  Part="1" 
AR Path="/5CC3861D/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D17E5F6/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D17E5FB/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D17E600/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D17E605/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D17E622/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D191B3C/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D191B41/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D191B46/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D191B4B/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D191B68/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D1E3362/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D1E3367/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D1E336C/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D1E3371/5CC30FBB" Ref="U?"  Part="1" 
AR Path="/5D1E338D/5CC30FBB" Ref="U?"  Part="1" 
F 0 "U3" H 4200 4367 50  0000 C CNN
F 1 "74HC573" H 4200 4276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4200 3600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 4200 3600 50  0001 C CNN
	1    4200 3600
	1    0    0    -1  
$EndComp
Connection ~ 5950 4500
Wire Wire Line
	5950 4550 5950 4500
Connection ~ 5800 7150
Connection ~ 5800 7350
$Comp
L Device:C_Small C?
U 1 1 5CC30FCE
P 5800 7250
AR Path="/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5CC02B94/5CC30FCE" Ref="C13"  Part="1" 
AR Path="/5CC377D5/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5CC37D0C/5CC30FCE" Ref="C5"  Part="1" 
AR Path="/5CC37D11/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5CC382A2/5CC30FCE" Ref="C7"  Part="1" 
AR Path="/5CC382A7/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5CC382AC/5CC30FCE" Ref="C9"  Part="1" 
AR Path="/5CC382B1/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5CC38618/5CC30FCE" Ref="C11"  Part="1" 
AR Path="/5CC3861D/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D17E5F6/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D17E5FB/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D17E600/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D17E605/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D17E622/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D191B3C/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D191B41/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D191B46/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D191B4B/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D191B68/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D1E3362/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D1E3367/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D1E336C/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D1E3371/5CC30FCE" Ref="C?"  Part="1" 
AR Path="/5D1E338D/5CC30FCE" Ref="C?"  Part="1" 
F 0 "C5" H 5709 7204 50  0000 R CNN
F 1 "100nF" H 5709 7295 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5800 7250 50  0001 C CNN
F 3 "~" H 5800 7250 50  0001 C CNN
	1    5800 7250
	1    0    0    1   
$EndComp
Wire Wire Line
	4750 4400 4750 4500
Wire Wire Line
	4750 4500 5100 4500
Connection ~ 5100 4500
Wire Wire Line
	5100 4400 5100 4500
Wire Wire Line
	5100 4500 5450 4500
Connection ~ 5450 4500
Wire Wire Line
	5450 4400 5450 4500
Wire Wire Line
	5450 4500 5800 4500
Wire Wire Line
	5800 4500 5950 4500
Connection ~ 5800 4500
Wire Wire Line
	5800 4400 5800 4500
Wire Wire Line
	5950 4500 6150 4500
Connection ~ 6150 4500
Wire Wire Line
	6150 4400 6150 4500
Wire Wire Line
	6150 4500 6500 4500
Connection ~ 6500 4500
Wire Wire Line
	6500 4400 6500 4500
Wire Wire Line
	6500 4500 6850 4500
Wire Wire Line
	6850 4500 7200 4500
Connection ~ 6850 4500
Wire Wire Line
	6850 4400 6850 4500
Wire Wire Line
	7200 4500 7200 4400
Wire Wire Line
	4700 3100 4750 3100
Wire Wire Line
	5100 3200 5100 3900
Wire Wire Line
	5450 3300 5450 3900
Wire Wire Line
	4700 3300 5450 3300
Wire Wire Line
	5800 3400 5800 3900
Wire Wire Line
	4700 3400 5800 3400
Wire Wire Line
	6150 3500 6150 3900
Wire Wire Line
	4700 3500 6150 3500
Wire Wire Line
	6500 3600 6500 3900
Wire Wire Line
	4700 3600 6500 3600
Wire Wire Line
	6850 3700 6850 3900
Wire Wire Line
	4700 3700 6850 3700
Wire Wire Line
	7200 3800 7200 3900
Wire Wire Line
	4700 3800 7200 3800
$Comp
L Device:R_Small R?
U 1 1 5CC31004
P 7200 4000
AR Path="/5CC31004" Ref="R?"  Part="1" 
AR Path="/5CC02B94/5CC31004" Ref="R56"  Part="1" 
AR Path="/5CC377D5/5CC31004" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5CC31004" Ref="R24"  Part="1" 
AR Path="/5CC37D11/5CC31004" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5CC31004" Ref="R32"  Part="1" 
AR Path="/5CC382A7/5CC31004" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5CC31004" Ref="R40"  Part="1" 
AR Path="/5CC382B1/5CC31004" Ref="R?"  Part="1" 
AR Path="/5CC38618/5CC31004" Ref="R48"  Part="1" 
AR Path="/5CC3861D/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D17E600/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D17E605/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D17E622/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D191B41/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D191B46/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D191B68/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5CC31004" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5CC31004" Ref="R?"  Part="1" 
F 0 "R24" H 7250 4050 50  0000 L CNN
F 1 "330Ω" H 7250 3950 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7200 4000 50  0001 C CNN
F 3 "~" H 7200 4000 50  0001 C CNN
	1    7200 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT LED?
U 1 1 5CC3100A
P 7200 4250
AR Path="/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5CC02B94/5CC3100A" Ref="LED40"  Part="1" 
AR Path="/5CC377D5/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5CC37D0C/5CC3100A" Ref="LED8"  Part="1" 
AR Path="/5CC37D11/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5CC382A2/5CC3100A" Ref="LED16"  Part="1" 
AR Path="/5CC382A7/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5CC382AC/5CC3100A" Ref="LED24"  Part="1" 
AR Path="/5CC382B1/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5CC38618/5CC3100A" Ref="LED32"  Part="1" 
AR Path="/5CC3861D/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D17E5F6/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D17E5FB/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D17E600/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D17E605/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D17E622/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D191B3C/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D191B41/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D191B46/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D191B4B/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D191B68/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D1E3362/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D1E3367/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D1E336C/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D1E3371/5CC3100A" Ref="LED?"  Part="1" 
AR Path="/5D1E338D/5CC3100A" Ref="LED?"  Part="1" 
F 0 "LED8" V 7200 4000 50  0000 L CNN
F 1 "LED_ALT" V 7150 3850 50  0001 L CNN
F 2 "alexios:LED_1210_3225" H 7200 4250 50  0001 C CNN
F 3 "~" H 7200 4250 50  0001 C CNN
	1    7200 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CC31010
P 6850 4000
AR Path="/5CC31010" Ref="R?"  Part="1" 
AR Path="/5CC02B94/5CC31010" Ref="R55"  Part="1" 
AR Path="/5CC377D5/5CC31010" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5CC31010" Ref="R23"  Part="1" 
AR Path="/5CC37D11/5CC31010" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5CC31010" Ref="R31"  Part="1" 
AR Path="/5CC382A7/5CC31010" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5CC31010" Ref="R39"  Part="1" 
AR Path="/5CC382B1/5CC31010" Ref="R?"  Part="1" 
AR Path="/5CC38618/5CC31010" Ref="R47"  Part="1" 
AR Path="/5CC3861D/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D17E600/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D17E605/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D17E622/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D191B41/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D191B46/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D191B68/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5CC31010" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5CC31010" Ref="R?"  Part="1" 
F 0 "R23" H 6900 4050 50  0000 L CNN
F 1 "330Ω" H 6900 3950 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 4000 50  0001 C CNN
F 3 "~" H 6850 4000 50  0001 C CNN
	1    6850 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT LED?
U 1 1 5CC31016
P 6850 4250
AR Path="/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5CC02B94/5CC31016" Ref="LED39"  Part="1" 
AR Path="/5CC377D5/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5CC37D0C/5CC31016" Ref="LED7"  Part="1" 
AR Path="/5CC37D11/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5CC382A2/5CC31016" Ref="LED15"  Part="1" 
AR Path="/5CC382A7/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5CC382AC/5CC31016" Ref="LED23"  Part="1" 
AR Path="/5CC382B1/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5CC38618/5CC31016" Ref="LED31"  Part="1" 
AR Path="/5CC3861D/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D17E5F6/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D17E5FB/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D17E600/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D17E605/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D17E622/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D191B3C/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D191B41/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D191B46/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D191B4B/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D191B68/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D1E3362/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D1E3367/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D1E336C/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D1E3371/5CC31016" Ref="LED?"  Part="1" 
AR Path="/5D1E338D/5CC31016" Ref="LED?"  Part="1" 
F 0 "LED7" V 6850 4000 50  0000 L CNN
F 1 "LED_ALT" V 6800 3850 50  0001 L CNN
F 2 "alexios:LED_1210_3225" H 6850 4250 50  0001 C CNN
F 3 "~" H 6850 4250 50  0001 C CNN
	1    6850 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CC3101C
P 6500 4000
AR Path="/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5CC02B94/5CC3101C" Ref="R54"  Part="1" 
AR Path="/5CC377D5/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5CC3101C" Ref="R22"  Part="1" 
AR Path="/5CC37D11/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5CC3101C" Ref="R30"  Part="1" 
AR Path="/5CC382A7/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5CC3101C" Ref="R38"  Part="1" 
AR Path="/5CC382B1/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5CC38618/5CC3101C" Ref="R46"  Part="1" 
AR Path="/5CC3861D/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D17E600/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D17E605/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D17E622/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D191B41/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D191B46/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D191B68/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5CC3101C" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5CC3101C" Ref="R?"  Part="1" 
F 0 "R22" H 6550 4050 50  0000 L CNN
F 1 "330Ω" H 6550 3950 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6500 4000 50  0001 C CNN
F 3 "~" H 6500 4000 50  0001 C CNN
	1    6500 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT LED?
U 1 1 5CC31022
P 6500 4250
AR Path="/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5CC02B94/5CC31022" Ref="LED38"  Part="1" 
AR Path="/5CC377D5/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5CC37D0C/5CC31022" Ref="LED6"  Part="1" 
AR Path="/5CC37D11/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5CC382A2/5CC31022" Ref="LED14"  Part="1" 
AR Path="/5CC382A7/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5CC382AC/5CC31022" Ref="LED22"  Part="1" 
AR Path="/5CC382B1/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5CC38618/5CC31022" Ref="LED30"  Part="1" 
AR Path="/5CC3861D/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D17E5F6/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D17E5FB/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D17E600/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D17E605/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D17E622/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D191B3C/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D191B41/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D191B46/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D191B4B/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D191B68/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D1E3362/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D1E3367/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D1E336C/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D1E3371/5CC31022" Ref="LED?"  Part="1" 
AR Path="/5D1E338D/5CC31022" Ref="LED?"  Part="1" 
F 0 "LED6" V 6500 4000 50  0000 L CNN
F 1 "LED_ALT" V 6450 3850 50  0001 L CNN
F 2 "alexios:LED_1210_3225" H 6500 4250 50  0001 C CNN
F 3 "~" H 6500 4250 50  0001 C CNN
	1    6500 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CC31028
P 6150 4000
AR Path="/5CC31028" Ref="R?"  Part="1" 
AR Path="/5CC02B94/5CC31028" Ref="R53"  Part="1" 
AR Path="/5CC377D5/5CC31028" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5CC31028" Ref="R21"  Part="1" 
AR Path="/5CC37D11/5CC31028" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5CC31028" Ref="R29"  Part="1" 
AR Path="/5CC382A7/5CC31028" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5CC31028" Ref="R37"  Part="1" 
AR Path="/5CC382B1/5CC31028" Ref="R?"  Part="1" 
AR Path="/5CC38618/5CC31028" Ref="R45"  Part="1" 
AR Path="/5CC3861D/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D17E600/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D17E605/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D17E622/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D191B41/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D191B46/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D191B68/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5CC31028" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5CC31028" Ref="R?"  Part="1" 
F 0 "R21" H 6200 4050 50  0000 L CNN
F 1 "330Ω" H 6200 3950 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 4000 50  0001 C CNN
F 3 "~" H 6150 4000 50  0001 C CNN
	1    6150 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT LED?
U 1 1 5CC3102E
P 6150 4250
AR Path="/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5CC02B94/5CC3102E" Ref="LED37"  Part="1" 
AR Path="/5CC377D5/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5CC37D0C/5CC3102E" Ref="LED5"  Part="1" 
AR Path="/5CC37D11/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5CC382A2/5CC3102E" Ref="LED13"  Part="1" 
AR Path="/5CC382A7/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5CC382AC/5CC3102E" Ref="LED21"  Part="1" 
AR Path="/5CC382B1/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5CC38618/5CC3102E" Ref="LED29"  Part="1" 
AR Path="/5CC3861D/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D17E5F6/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D17E5FB/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D17E600/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D17E605/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D17E622/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D191B3C/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D191B41/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D191B46/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D191B4B/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D191B68/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D1E3362/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D1E3367/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D1E336C/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D1E3371/5CC3102E" Ref="LED?"  Part="1" 
AR Path="/5D1E338D/5CC3102E" Ref="LED?"  Part="1" 
F 0 "LED5" V 6150 4000 50  0000 L CNN
F 1 "LED_ALT" V 6100 3850 50  0001 L CNN
F 2 "alexios:LED_1210_3225" H 6150 4250 50  0001 C CNN
F 3 "~" H 6150 4250 50  0001 C CNN
	1    6150 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CC31034
P 5800 4000
AR Path="/5CC31034" Ref="R?"  Part="1" 
AR Path="/5CC02B94/5CC31034" Ref="R52"  Part="1" 
AR Path="/5CC377D5/5CC31034" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5CC31034" Ref="R20"  Part="1" 
AR Path="/5CC37D11/5CC31034" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5CC31034" Ref="R28"  Part="1" 
AR Path="/5CC382A7/5CC31034" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5CC31034" Ref="R36"  Part="1" 
AR Path="/5CC382B1/5CC31034" Ref="R?"  Part="1" 
AR Path="/5CC38618/5CC31034" Ref="R44"  Part="1" 
AR Path="/5CC3861D/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D17E600/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D17E605/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D17E622/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D191B41/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D191B46/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D191B68/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5CC31034" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5CC31034" Ref="R?"  Part="1" 
F 0 "R20" H 5850 4050 50  0000 L CNN
F 1 "330Ω" H 5850 3950 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5800 4000 50  0001 C CNN
F 3 "~" H 5800 4000 50  0001 C CNN
	1    5800 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT LED?
U 1 1 5CC3103A
P 5800 4250
AR Path="/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5CC02B94/5CC3103A" Ref="LED36"  Part="1" 
AR Path="/5CC377D5/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5CC37D0C/5CC3103A" Ref="LED4"  Part="1" 
AR Path="/5CC37D11/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5CC382A2/5CC3103A" Ref="LED12"  Part="1" 
AR Path="/5CC382A7/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5CC382AC/5CC3103A" Ref="LED20"  Part="1" 
AR Path="/5CC382B1/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5CC38618/5CC3103A" Ref="LED28"  Part="1" 
AR Path="/5CC3861D/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D17E5F6/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D17E5FB/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D17E600/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D17E605/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D17E622/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D191B3C/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D191B41/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D191B46/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D191B4B/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D191B68/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D1E3362/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D1E3367/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D1E336C/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D1E3371/5CC3103A" Ref="LED?"  Part="1" 
AR Path="/5D1E338D/5CC3103A" Ref="LED?"  Part="1" 
F 0 "LED4" V 5800 4000 50  0000 L CNN
F 1 "LED_ALT" V 5750 3850 50  0001 L CNN
F 2 "alexios:LED_1210_3225" H 5800 4250 50  0001 C CNN
F 3 "~" H 5800 4250 50  0001 C CNN
	1    5800 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CC31040
P 5450 4000
AR Path="/5CC31040" Ref="R?"  Part="1" 
AR Path="/5CC02B94/5CC31040" Ref="R51"  Part="1" 
AR Path="/5CC377D5/5CC31040" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5CC31040" Ref="R19"  Part="1" 
AR Path="/5CC37D11/5CC31040" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5CC31040" Ref="R27"  Part="1" 
AR Path="/5CC382A7/5CC31040" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5CC31040" Ref="R35"  Part="1" 
AR Path="/5CC382B1/5CC31040" Ref="R?"  Part="1" 
AR Path="/5CC38618/5CC31040" Ref="R43"  Part="1" 
AR Path="/5CC3861D/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D17E600/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D17E605/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D17E622/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D191B41/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D191B46/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D191B68/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5CC31040" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5CC31040" Ref="R?"  Part="1" 
F 0 "R19" H 5500 4050 50  0000 L CNN
F 1 "330Ω" H 5500 3950 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 4000 50  0001 C CNN
F 3 "~" H 5450 4000 50  0001 C CNN
	1    5450 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT LED?
U 1 1 5CC31046
P 5450 4250
AR Path="/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5CC02B94/5CC31046" Ref="LED35"  Part="1" 
AR Path="/5CC377D5/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5CC37D0C/5CC31046" Ref="LED3"  Part="1" 
AR Path="/5CC37D11/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5CC382A2/5CC31046" Ref="LED11"  Part="1" 
AR Path="/5CC382A7/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5CC382AC/5CC31046" Ref="LED19"  Part="1" 
AR Path="/5CC382B1/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5CC38618/5CC31046" Ref="LED27"  Part="1" 
AR Path="/5CC3861D/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D17E5F6/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D17E5FB/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D17E600/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D17E605/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D17E622/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D191B3C/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D191B41/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D191B46/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D191B4B/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D191B68/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D1E3362/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D1E3367/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D1E336C/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D1E3371/5CC31046" Ref="LED?"  Part="1" 
AR Path="/5D1E338D/5CC31046" Ref="LED?"  Part="1" 
F 0 "LED3" V 5450 4000 50  0000 L CNN
F 1 "LED_ALT" V 5400 3850 50  0001 L CNN
F 2 "alexios:LED_1210_3225" H 5450 4250 50  0001 C CNN
F 3 "~" H 5450 4250 50  0001 C CNN
	1    5450 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CC3104C
P 5100 4000
AR Path="/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5CC02B94/5CC3104C" Ref="R50"  Part="1" 
AR Path="/5CC377D5/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5CC3104C" Ref="R18"  Part="1" 
AR Path="/5CC37D11/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5CC3104C" Ref="R26"  Part="1" 
AR Path="/5CC382A7/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5CC3104C" Ref="R34"  Part="1" 
AR Path="/5CC382B1/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5CC38618/5CC3104C" Ref="R42"  Part="1" 
AR Path="/5CC3861D/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D17E600/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D17E605/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D17E622/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D191B41/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D191B46/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D191B68/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5CC3104C" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5CC3104C" Ref="R?"  Part="1" 
F 0 "R18" H 5150 4050 50  0000 L CNN
F 1 "330Ω" H 5150 3950 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5100 4000 50  0001 C CNN
F 3 "~" H 5100 4000 50  0001 C CNN
	1    5100 4000
	1    0    0    -1  
$EndComp
Text Label 2700 2800 0    50   ~ 0
D[0..7]
$Comp
L power:+5V #PWR?
U 1 1 5EC3F723
P 4350 7150
AR Path="/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5CC02B94/5EC3F723" Ref="#PWR063"  Part="1" 
AR Path="/5CC377D5/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5CC37D0C/5EC3F723" Ref="#PWR039"  Part="1" 
AR Path="/5CC37D11/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5CC382A2/5EC3F723" Ref="#PWR045"  Part="1" 
AR Path="/5CC382A7/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5CC382AC/5EC3F723" Ref="#PWR051"  Part="1" 
AR Path="/5CC382B1/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5CC38618/5EC3F723" Ref="#PWR057"  Part="1" 
AR Path="/5CC3861D/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5F6/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5FB/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D17E600/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D17E605/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D17E622/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D191B3C/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D191B41/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D191B46/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D191B4B/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D191B68/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3362/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3367/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D1E336C/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3371/5EC3F723" Ref="#PWR?"  Part="1" 
AR Path="/5D1E338D/5EC3F723" Ref="#PWR?"  Part="1" 
F 0 "#PWR039" H 4350 7000 50  0001 C CNN
F 1 "+5V" H 4365 7323 50  0000 C CNN
F 2 "" H 4350 7150 50  0001 C CNN
F 3 "" H 4350 7150 50  0001 C CNN
	1    4350 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC3F729
P 4350 7350
AR Path="/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5CC02B94/5EC3F729" Ref="#PWR065"  Part="1" 
AR Path="/5CC377D5/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5CC37D0C/5EC3F729" Ref="#PWR041"  Part="1" 
AR Path="/5CC37D11/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5CC382A2/5EC3F729" Ref="#PWR047"  Part="1" 
AR Path="/5CC382A7/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5CC382AC/5EC3F729" Ref="#PWR053"  Part="1" 
AR Path="/5CC382B1/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5CC38618/5EC3F729" Ref="#PWR059"  Part="1" 
AR Path="/5CC3861D/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5F6/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5FB/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D17E600/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D17E605/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D17E622/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D191B3C/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D191B41/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D191B46/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D191B4B/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D191B68/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3362/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3367/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D1E336C/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3371/5EC3F729" Ref="#PWR?"  Part="1" 
AR Path="/5D1E338D/5EC3F729" Ref="#PWR?"  Part="1" 
F 0 "#PWR041" H 4350 7100 50  0001 C CNN
F 1 "GND" H 4355 7177 50  0000 C CNN
F 2 "" H 4350 7350 50  0001 C CNN
F 3 "" H 4350 7350 50  0001 C CNN
	1    4350 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EC3F737
P 4350 7250
AR Path="/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5CC02B94/5EC3F737" Ref="C12"  Part="1" 
AR Path="/5CC377D5/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5CC37D0C/5EC3F737" Ref="C4"  Part="1" 
AR Path="/5CC37D11/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5CC382A2/5EC3F737" Ref="C6"  Part="1" 
AR Path="/5CC382A7/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5CC382AC/5EC3F737" Ref="C8"  Part="1" 
AR Path="/5CC382B1/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5CC38618/5EC3F737" Ref="C10"  Part="1" 
AR Path="/5CC3861D/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D17E5F6/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D17E5FB/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D17E600/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D17E605/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D17E622/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D191B3C/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D191B41/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D191B46/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D191B4B/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D191B68/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D1E3362/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D1E3367/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D1E336C/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D1E3371/5EC3F737" Ref="C?"  Part="1" 
AR Path="/5D1E338D/5EC3F737" Ref="C?"  Part="1" 
F 0 "C4" H 4259 7204 50  0000 R CNN
F 1 "100nF" H 4259 7295 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4350 7250 50  0001 C CNN
F 3 "~" H 4350 7250 50  0001 C CNN
	1    4350 7250
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CC31064
P 3900 4500
AR Path="/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5CC02B94/5CC31064" Ref="#PWR061"  Part="1" 
AR Path="/5CC377D5/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5CC37D0C/5CC31064" Ref="#PWR037"  Part="1" 
AR Path="/5CC37D11/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5CC382A2/5CC31064" Ref="#PWR043"  Part="1" 
AR Path="/5CC382A7/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5CC382AC/5CC31064" Ref="#PWR049"  Part="1" 
AR Path="/5CC382B1/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5CC38618/5CC31064" Ref="#PWR055"  Part="1" 
AR Path="/5CC3861D/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5F6/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5FB/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D17E600/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D17E605/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D17E622/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D191B3C/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D191B41/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D191B46/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D191B4B/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D191B68/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3362/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3367/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D1E336C/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3371/5CC31064" Ref="#PWR?"  Part="1" 
AR Path="/5D1E338D/5CC31064" Ref="#PWR?"  Part="1" 
F 0 "#PWR037" H 3900 4250 50  0001 C CNN
F 1 "GND" H 3905 4327 50  0000 C CNN
F 2 "" H 3900 4500 50  0001 C CNN
F 3 "" H 3900 4500 50  0001 C CNN
	1    3900 4500
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP?
U 1 1 5CC30FEE
P 3650 4450
AR Path="/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5CC02B94/5CC30FEE" Ref="JP11"  Part="1" 
AR Path="/5CC377D5/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5CC37D0C/5CC30FEE" Ref="JP7"  Part="1" 
AR Path="/5CC37D11/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5CC382A2/5CC30FEE" Ref="JP8"  Part="1" 
AR Path="/5CC382A7/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5CC382AC/5CC30FEE" Ref="JP9"  Part="1" 
AR Path="/5CC382B1/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5CC38618/5CC30FEE" Ref="JP10"  Part="1" 
AR Path="/5CC3861D/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D17E5F6/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D17E5FB/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D17E600/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D17E605/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D17E622/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D191B3C/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D191B41/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D191B46/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D191B4B/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D191B68/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D1E3362/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D1E3367/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D1E336C/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D1E3371/5CC30FEE" Ref="JP?"  Part="1" 
AR Path="/5D1E338D/5CC30FEE" Ref="JP?"  Part="1" 
F 0 "JP7" H 3650 4562 50  0000 C CNN
F 1 "Jumper_3_Bridged12" H 3650 4250 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3650 4450 50  0001 C CNN
F 3 "~" H 3650 4450 50  0001 C CNN
	1    3650 4450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 4450 3900 4500
Wire Wire Line
	2650 4450 3400 4450
Text Label 2750 4450 0    50   ~ 0
~LTSON
Text HLabel 2650 4450 0    50   Input ~ 0
~LTSON
Text HLabel 2650 4050 0    50   Input ~ 0
~LE2
Wire Wire Line
	2900 4050 2650 4050
Wire Wire Line
	2650 3950 2900 3950
Text HLabel 2650 3950 0    50   Input ~ 0
~LE1
$Comp
L power:GND #PWR?
U 1 1 5CC30FC6
P 5950 4550
AR Path="/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5CC02B94/5CC30FC6" Ref="#PWR062"  Part="1" 
AR Path="/5CC377D5/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5CC37D0C/5CC30FC6" Ref="#PWR038"  Part="1" 
AR Path="/5CC37D11/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5CC382A2/5CC30FC6" Ref="#PWR044"  Part="1" 
AR Path="/5CC382A7/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5CC382AC/5CC30FC6" Ref="#PWR050"  Part="1" 
AR Path="/5CC382B1/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5CC38618/5CC30FC6" Ref="#PWR056"  Part="1" 
AR Path="/5CC3861D/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5F6/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D17E5FB/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D17E600/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D17E605/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D17E622/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D191B3C/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D191B41/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D191B46/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D191B4B/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D191B68/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3362/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3367/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D1E336C/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D1E3371/5CC30FC6" Ref="#PWR?"  Part="1" 
AR Path="/5D1E338D/5CC30FC6" Ref="#PWR?"  Part="1" 
F 0 "#PWR038" H 5950 4300 50  0001 C CNN
F 1 "GND" H 5955 4377 50  0000 C CNN
F 2 "" H 5950 4550 50  0001 C CNN
F 3 "" H 5950 4550 50  0001 C CNN
	1    5950 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CC31058
P 4750 4000
AR Path="/5CC31058" Ref="R?"  Part="1" 
AR Path="/5CC02B94/5CC31058" Ref="R49"  Part="1" 
AR Path="/5CC377D5/5CC31058" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5CC31058" Ref="R17"  Part="1" 
AR Path="/5CC37D11/5CC31058" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5CC31058" Ref="R25"  Part="1" 
AR Path="/5CC382A7/5CC31058" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5CC31058" Ref="R33"  Part="1" 
AR Path="/5CC382B1/5CC31058" Ref="R?"  Part="1" 
AR Path="/5CC38618/5CC31058" Ref="R41"  Part="1" 
AR Path="/5CC3861D/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D17E600/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D17E605/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D17E622/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D191B41/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D191B46/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D191B68/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5CC31058" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5CC31058" Ref="R?"  Part="1" 
F 0 "R17" H 4800 4050 50  0000 L CNN
F 1 "330Ω" H 4800 3950 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 4000 50  0001 C CNN
F 3 "~" H 4750 4000 50  0001 C CNN
	1    4750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4100 3650 4100
Wire Wire Line
	3650 4100 3650 4300
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5DA0F4ED
P 3650 4100
AR Path="/5CC37D0C/5DA0F4ED" Ref="#FLG0104"  Part="1" 
AR Path="/5CC382A2/5DA0F4ED" Ref="#FLG0105"  Part="1" 
AR Path="/5CC382AC/5DA0F4ED" Ref="#FLG0106"  Part="1" 
AR Path="/5CC38618/5DA0F4ED" Ref="#FLG0107"  Part="1" 
AR Path="/5CC02B94/5DA0F4ED" Ref="#FLG0108"  Part="1" 
F 0 "#FLG0104" H 3650 4175 50  0001 C CNN
F 1 "PWR_FLAG" V 3650 4227 50  0001 L CNN
F 2 "" H 3650 4100 50  0001 C CNN
F 3 "~" H 3650 4100 50  0001 C CNN
	1    3650 4100
	0    -1   -1   0   
$EndComp
Connection ~ 3650 4100
Text Notes 8300 4700 0    50   ~ 10
Resistor Values
Text Notes 8300 5500 0    50   ~ 0
LED Vf = 2.8V ± 0.7\nV = 5V\nI ≅ 4mA\n\nEvery pin can source or sink ±35mA, but the '573 can handle\na total of 70mA (supply or ground). The best choice is 620Ω\nresistors, then. The lighting-grade white LEDs I used on the\noriginal front panel will work just fine that way. In fact they're\ntoo bright to look at.
Text Notes 8300 6250 0    50   ~ 0
Resistor\n\n330Ω\n470Ω\n620Ω\n680Ω
Text Notes 8700 6250 0    50   ~ 0
Current\nper LED\n\n6.67mA\n4.68mA\n3.56mA\n3.24mA
Text Notes 9150 6250 0    50   ~ 0
Current\nper '573\n\n53.36mA\n37.44mA\n28.40mA\n25.92mA
Text Notes 9650 6250 0    50   ~ 0
Current\nper board\n\n267mA\n187mA\n142mA\n129mA
Text Notes 10150 6250 0    50   ~ 0
Power\nper board\n\n1,334mW\n  936mW\n  710mW\n  648mW
Wire Wire Line
	4750 3100 4750 3900
Wire Wire Line
	4700 3200 5100 3200
$Comp
L Device:LED_ALT LED?
U 1 1 5CC31052
P 5100 4250
AR Path="/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5CC02B94/5CC31052" Ref="LED34"  Part="1" 
AR Path="/5CC377D5/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5CC37D0C/5CC31052" Ref="LED2"  Part="1" 
AR Path="/5CC37D11/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5CC382A2/5CC31052" Ref="LED10"  Part="1" 
AR Path="/5CC382A7/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5CC382AC/5CC31052" Ref="LED18"  Part="1" 
AR Path="/5CC382B1/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5CC38618/5CC31052" Ref="LED26"  Part="1" 
AR Path="/5CC3861D/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D17E5F6/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D17E5FB/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D17E600/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D17E605/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D17E622/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D191B3C/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D191B41/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D191B46/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D191B4B/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D191B68/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D1E3362/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D1E3367/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D1E336C/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D1E3371/5CC31052" Ref="LED?"  Part="1" 
AR Path="/5D1E338D/5CC31052" Ref="LED?"  Part="1" 
F 0 "LED2" V 5100 4000 50  0000 L CNN
F 1 "LED_ALT" V 5050 3850 50  0001 L CNN
F 2 "alexios:LED_1210_3225" H 5100 4250 50  0001 C CNN
F 3 "~" H 5100 4250 50  0001 C CNN
	1    5100 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_ALT LED?
U 1 1 5CC3105E
P 4750 4250
AR Path="/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5CC02B94/5CC3105E" Ref="LED33"  Part="1" 
AR Path="/5CC377D5/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5CC37D0C/5CC3105E" Ref="LED1"  Part="1" 
AR Path="/5CC37D11/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5CC382A2/5CC3105E" Ref="LED9"  Part="1" 
AR Path="/5CC382A7/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5CC382AC/5CC3105E" Ref="LED17"  Part="1" 
AR Path="/5CC382B1/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5CC38618/5CC3105E" Ref="LED25"  Part="1" 
AR Path="/5CC3861D/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D17E5F6/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D17E5FB/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D17E600/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D17E605/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D17E622/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D191B3C/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D191B41/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D191B46/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D191B4B/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D191B68/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D1E3362/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D1E3367/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D1E336C/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D1E3371/5CC3105E" Ref="LED?"  Part="1" 
AR Path="/5D1E338D/5CC3105E" Ref="LED?"  Part="1" 
F 0 "LED1" V 4750 4000 50  0000 L CNN
F 1 "LED_ALT" V 4700 3850 50  0001 L CNN
F 2 "alexios:LED_1210_3225" H 4750 4250 50  0001 C CNN
F 3 "~" H 4750 4250 50  0001 C CNN
	1    4750 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3400 4000 3700 4000
Connection ~ 4350 7350
Connection ~ 4350 7150
$Comp
L alexios:74LVC1G32 U4
U 1 1 5EF6B0CB
P 3100 4000
AR Path="/5CC37D0C/5EF6B0CB" Ref="U4"  Part="1" 
AR Path="/5CC382A2/5EF6B0CB" Ref="U6"  Part="1" 
AR Path="/5CC382AC/5EF6B0CB" Ref="U8"  Part="1" 
AR Path="/5CC38618/5EF6B0CB" Ref="U10"  Part="1" 
AR Path="/5CC02B94/5EF6B0CB" Ref="U12"  Part="1" 
F 0 "U4" H 3150 3825 50  0000 C CNN
F 1 "74LVC1G32" H 3150 3734 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3210 3980 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3210 3980 50  0001 C CNN
	1    3100 4000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U4
U 2 1 5EF6BA9F
P 4750 7000
AR Path="/5CC37D0C/5EF6BA9F" Ref="U4"  Part="2" 
AR Path="/5CC382A2/5EF6BA9F" Ref="U6"  Part="2" 
AR Path="/5CC382AC/5EF6BA9F" Ref="U8"  Part="2" 
AR Path="/5CC38618/5EF6BA9F" Ref="U10"  Part="2" 
AR Path="/5CC02B94/5EF6BA9F" Ref="U12"  Part="2" 
F 0 "U4" H 4880 6796 50  0000 L CNN
F 1 "74LVC1G32" H 4880 6705 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4860 6980 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4860 6980 50  0001 C CNN
	2    4750 7000
	1    0    0    -1  
$EndComp
Text Label 3150 3700 0    50   ~ 0
D1
Text Label 3150 3800 0    50   ~ 0
D0
Wire Wire Line
	3700 3800 3100 3800
Wire Wire Line
	3700 3700 3100 3700
Wire Wire Line
	3700 3600 3100 3600
Wire Wire Line
	3700 3500 3100 3500
Wire Wire Line
	3700 3400 3100 3400
Wire Wire Line
	3700 3300 3100 3300
Wire Wire Line
	3700 3200 3100 3200
Wire Wire Line
	3700 3100 3100 3100
Text Label 3150 3600 0    50   ~ 0
D2
Text Label 3150 3500 0    50   ~ 0
D3
Text Label 3150 3400 0    50   ~ 0
D4
Text Label 3150 3300 0    50   ~ 0
D5
Text Label 3150 3200 0    50   ~ 0
D6
Text Label 3150 3100 0    50   ~ 0
D7
Text Notes 3250 1850 0    63   ~ 13
Rev E Erratum
Text Notes 3250 2400 0    50   ~ 0
FPD₀–FPD₇ mapped to the LEDs the wrong way. This was\npatched on the constructed Rev E (1951) board by rewiring\nthe first connector of the first module.\n\nRev F (2026) fixes this issue.
Wire Notes Line width 24 style solid
	3100 1600 3100 2550
Wire Notes Line width 24 style solid
	5800 1600 3100 1600
Wire Notes Line width 24 style solid
	5800 2550 5800 1600
Wire Notes Line width 24 style solid
	3100 2550 5800 2550
Wire Notes Line
	3200 3000 3400 2550
Wire Notes Line
	3200 3000 3600 2550
Wire Bus Line
	3000 2900 3000 3700
$EndSCHEMATC
