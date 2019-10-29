EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 24 34
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
P 2800 2000
AR Path="/5D33F5C7" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F5C7" Ref="U1501"  Part="1" 
AR Path="/5D44ECB5/5D33F5C7" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F5C7" Ref="U701"  Part="1" 
F 0 "U701" H 2750 2267 50  0000 C CNN
F 1 "74AHC1G32" H 2750 2176 50  0000 C CNN
F 2 "" H 2810 1980 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2810 1980 50  0001 C CNN
	1    2800 2000
	1    0    0    -1  
$EndComp
Text Label 1750 1950 0    50   ~ 0
~WS
Text Label 1750 2050 0    50   ~ 0
T34
Text HLabel 1650 1950 0    50   Input ~ 0
~WS
Text HLabel 1650 2050 0    50   Input ~ 0
T34
Wire Wire Line
	1650 2050 2600 2050
Text Label 1750 2200 0    50   ~ 0
CLK3
$Comp
L alexios:74AUC1G74 U?
U 1 1 5D33F5D3
P 4250 2150
AR Path="/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F5D3" Ref="U1502"  Part="1" 
AR Path="/5D44ECB5/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F5D3" Ref="U702"  Part="1" 
F 0 "U702" H 4250 2567 50  0000 C CNN
F 1 "74AUC1G74" H 4250 2476 50  0000 C CNN
F 2 "" H 4700 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4700 2150 50  0001 C CNN
	1    4250 2150
	1    0    0    -1  
$EndComp
Text Label 3650 2000 2    50   ~ 0
~WS-in-T34
Text Label 3650 2200 2    50   ~ 0
CLK3
Text Label 1750 2300 0    50   ~ 0
~RESET
Text Label 3650 2300 2    50   ~ 0
~RESET
Wire Wire Line
	3800 2100 3750 2100
Text Label 5050 2300 2    50   ~ 0
~WAITING
Wire Wire Line
	4700 2300 5150 2300
Text HLabel 1650 2200 0    50   Input ~ 0
CLK3
Text HLabel 1650 2300 0    50   Input ~ 0
~RESET
Wire Wire Line
	3100 2000 3750 2000
Wire Wire Line
	1650 2200 3800 2200
Text Label 1750 1400 0    50   ~ 0
WSTB
Wire Wire Line
	5300 1300 2350 1300
Text Label 1750 1300 0    50   ~ 0
~WEN
Text HLabel 1650 1300 0    50   Input ~ 0
~WEN
Text HLabel 1650 1400 0    50   Input ~ 0
WSTB
$Comp
L Device:C_Small C?
U 1 1 5D33F674
P 2500 6550
AR Path="/5CC0D65F/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F674" Ref="C1506"  Part="1" 
AR Path="/5D44ECB5/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F674" Ref="C703"  Part="1" 
F 0 "C703" H 2409 6596 50  0000 R CNN
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
AR Path="/5D30488D/5D33F67A" Ref="#PWR01516"  Part="1" 
AR Path="/5D44ECB5/5D33F67A" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F67A" Ref="#PWR0707"  Part="1" 
F 0 "#PWR0707" H 2500 6400 50  0001 C CNN
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
AR Path="/5D30488D/5D33F681" Ref="#PWR01512"  Part="1" 
AR Path="/5D44ECB5/5D33F681" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F681" Ref="#PWR0706"  Part="1" 
F 0 "#PWR0706" H 2500 6300 50  0001 C CNN
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
AR Path="/5D30488D/5D33F68E" Ref="C1501"  Part="1" 
AR Path="/5D44ECB5/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F68E" Ref="C706"  Part="1" 
F 0 "C706" H 5309 7296 50  0000 R CNN
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
AR Path="/5D30488D/5D33F694" Ref="#PWR01507"  Part="1" 
AR Path="/5D44ECB5/5D33F694" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F694" Ref="#PWR0713"  Part="1" 
F 0 "#PWR0713" H 5400 7100 50  0001 C CNN
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
AR Path="/5D30488D/5D33F69B" Ref="#PWR01505"  Part="1" 
AR Path="/5D44ECB5/5D33F69B" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F69B" Ref="#PWR0712"  Part="1" 
F 0 "#PWR0712" H 5400 7000 50  0001 C CNN
F 1 "+5V" H 5415 7323 50  0000 C CNN
F 2 "" H 5400 7150 50  0001 C CNN
F 3 "" H 5400 7150 50  0001 C CNN
	1    5400 7150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F70F
P 6100 1400
AR Path="/5F67D4B5/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F70F" Ref="TP1503"  Part="1" 
AR Path="/5D44ECB5/5D33F70F" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F70F" Ref="TP703"  Part="1" 
F 0 "TP703" H 6050 1650 50  0000 L CNN
F 1 "TestPoint" H 6158 1427 50  0001 L CNN
F 2 "" H 6300 1400 50  0001 C CNN
F 3 "~" H 6300 1400 50  0001 C CNN
	1    6100 1400
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F718
P 4700 2000
AR Path="/5F67D4B5/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F718" Ref="TP1506"  Part="1" 
AR Path="/5D44ECB5/5D33F718" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F718" Ref="TP702"  Part="1" 
F 0 "TP702" V 4600 2000 50  0000 L CNN
F 1 "TestPoint" H 4758 2027 50  0001 L CNN
F 2 "" H 4900 2000 50  0001 C CNN
F 3 "~" H 4900 2000 50  0001 C CNN
	1    4700 2000
	0    1    1    0   
$EndComp
Connection ~ 3750 2000
Wire Wire Line
	3750 2000 3800 2000
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F721
P 3750 2000
AR Path="/5F67D4B5/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F721" Ref="TP1505"  Part="1" 
AR Path="/5D44ECB5/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F721" Ref="TP701"  Part="1" 
F 0 "TP701" H 3750 2234 50  0000 C CNN
F 1 "TestPoint" H 3808 2027 50  0001 L CNN
F 2 "" H 3950 2000 50  0001 C CNN
F 3 "~" H 3950 2000 50  0001 C CNN
	1    3750 2000
	1    0    0    -1  
$EndComp
Text HLabel 1650 950  0    50   Input ~ 0
~HALT
$Comp
L Device:C_Small C?
U 1 1 5D33F777
P 3950 7250
AR Path="/5CC0D65F/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F777" Ref="C1502"  Part="1" 
AR Path="/5D44ECB5/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F777" Ref="C705"  Part="1" 
F 0 "C705" H 3859 7296 50  0000 R CNN
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
AR Path="/5D30488D/5D33F77D" Ref="#PWR01508"  Part="1" 
AR Path="/5D44ECB5/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F77D" Ref="#PWR0711"  Part="1" 
F 0 "#PWR0711" H 3950 7100 50  0001 C CNN
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
AR Path="/5D30488D/5D33F784" Ref="#PWR01506"  Part="1" 
AR Path="/5D44ECB5/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F784" Ref="#PWR0710"  Part="1" 
F 0 "#PWR0710" H 3950 7000 50  0001 C CNN
F 1 "+5V" H 3965 7323 50  0000 C CNN
F 2 "" H 3950 7150 50  0001 C CNN
F 3 "" H 3950 7150 50  0001 C CNN
	1    3950 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F7B4
P 1000 7200
AR Path="/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F7B4" Ref="#PWR01517"  Part="1" 
AR Path="/5D44ECB5/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F7B4" Ref="#PWR0702"  Part="1" 
F 0 "#PWR0702" H 1000 7050 50  0001 C CNN
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
AR Path="/5D30488D/5D33F7BB" Ref="#PWR01518"  Part="1" 
AR Path="/5D44ECB5/5D33F7BB" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F7BB" Ref="#PWR0703"  Part="1" 
F 0 "#PWR0703" H 1000 7150 50  0001 C CNN
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
AR Path="/5D30488D/5D33F7C1" Ref="C1507"  Part="1" 
AR Path="/5D44ECB5/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F7C1" Ref="C701"  Part="1" 
F 0 "C701" H 909 7346 50  0000 R CNN
F 1 "100nF" H 909 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1000 7300 50  0001 C CNN
F 3 "~" H 1000 7300 50  0001 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F601
P 1050 6450
AR Path="/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F601" Ref="#PWR01511"  Part="1" 
AR Path="/5D44ECB5/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F601" Ref="#PWR0704"  Part="1" 
F 0 "#PWR0704" H 1050 6300 50  0001 C CNN
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
AR Path="/5D30488D/5D33F5FA" Ref="#PWR01515"  Part="1" 
AR Path="/5D44ECB5/5D33F5FA" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F5FA" Ref="#PWR0705"  Part="1" 
F 0 "#PWR0705" H 1050 6400 50  0001 C CNN
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
AR Path="/5D30488D/5D33F5E1" Ref="C1505"  Part="1" 
AR Path="/5D44ECB5/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F5E1" Ref="C702"  Part="1" 
F 0 "C702" H 959 6596 50  0000 R CNN
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
AR Path="/5D46B22D/5D4281C6" Ref="C704"  Part="1" 
F 0 "C704" H 2409 7296 50  0000 R CNN
F 1 "100nF" H 2409 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 7250 50  0001 C CNN
F 3 "~" H 2500 7250 50  0001 C CNN
	1    2500 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0709
U 1 1 5D428DF8
P 2500 7350
F 0 "#PWR0709" H 2500 7100 50  0001 C CNN
F 1 "GND" H 2505 7177 50  0000 C CNN
F 2 "" H 2500 7350 50  0001 C CNN
F 3 "" H 2500 7350 50  0001 C CNN
	1    2500 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0708
U 1 1 5D429670
P 2500 7150
F 0 "#PWR0708" H 2500 7000 50  0001 C CNN
F 1 "+5V" H 2515 7323 50  0000 C CNN
F 2 "" H 2500 7150 50  0001 C CNN
F 3 "" H 2500 7150 50  0001 C CNN
	1    2500 7150
	1    0    0    -1  
$EndComp
Text Notes 7100 7000 0    197  ~ 39
Data Bus & Wait States
Text Notes 5200 4250 0    50   ~ 0
Keep the data bus enabled\nwhile waiting.
Wire Wire Line
	1650 2300 3800 2300
$Comp
L alexios:74AHC1G125 U?
U 1 1 5D6CFDA6
P 6600 1400
AR Path="/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D6CFDA6" Ref="U706"  Part="1" 
F 0 "U706" H 6650 1226 50  0000 C CNN
F 1 "74AHC1G125" H 6650 1135 50  0000 C CNN
F 2 "" H 6750 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 6750 1650 50  0001 C CNN
	1    6600 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1400 9550 1400
Text Label 9450 1400 2    50   ~ 0
~W
Text HLabel 9550 1400 2    50   3State ~ 0
~W
Wire Wire Line
	6650 1200 6650 950 
$Comp
L alexios:74LVC1G04 U705
U 1 1 5D6F45CB
P 6350 950
F 0 "U705" H 6300 1217 50  0000 C CNN
F 1 "74LVC1G04" H 6300 1126 50  0000 C CNN
F 2 "" H 6350 950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 6350 950 50  0001 C CNN
	1    6350 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 950  6650 950 
Text Label 1750 950  0    50   ~ 0
~HALT
Wire Wire Line
	1650 950  6050 950 
Text Notes 6250 2550 0    50   ~ 0
~WEN~\n\n X\n X\n 1\n 0\n 0
Wire Wire Line
	6050 1400 6100 1400
Wire Notes Line width 20 style solid
	5475 1925 7000 1925
Wire Notes Line style solid
	5475 2100 7000 2100
Wire Notes Line width 20 style solid
	7000 2600 7000 1925
Wire Notes Line width 20 style solid
	5475 2600 5475 1925
Wire Notes Line width 20 style solid
	5475 2600 7000 2600
Wire Notes Line
	6750 1925 6750 2600
Wire Wire Line
	5150 2300 5150 1500
Connection ~ 5150 2300
Wire Wire Line
	5150 1500 5300 1500
Connection ~ 6100 1400
Wire Wire Line
	6100 1400 6400 1400
Wire Wire Line
	1650 1400 5300 1400
Text Label 5050 1300 2    50   ~ 0
~WEN
Text Label 5050 1400 2    50   ~ 0
WSTB
Text Notes 5550 2550 0    50   ~ 0
~HALT~\n\n 0\n 1\n 1\n 1\n 1
$Comp
L alexios:74AHC1G32 U?
U 2 1 5D1B7CC1
P 1450 6300
AR Path="/5D1B7CC1" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D1B7CC1" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D1B7CC1" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D1B7CC1" Ref="U?"  Part="2" 
F 0 "U?" H 1580 6096 50  0000 L CNN
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
AR Path="/5D46B22D/5D1B8DEA" Ref="U?"  Part="2" 
F 0 "U?" H 3030 6596 50  0000 L CNN
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
AR Path="/5D46B22D/5D1BEF9C" Ref="U?"  Part="2" 
F 0 "U?" H 1530 7046 50  0000 L CNN
F 1 "74LVC1G11" H 1530 6955 50  0000 L CNN
F 2 "" H 1350 7075 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1350 7075 50  0001 C CNN
	2    1450 7150
	1    0    0    -1  
$EndComp
Connection ~ 1000 7400
Connection ~ 1000 7200
$Comp
L alexios:74LVC1G04 U?
U 2 1 5D1C6D66
P 4300 7250
F 0 "U?" H 4480 7296 50  0000 L CNN
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
AR Path="/5D46B22D/5D1C70BE" Ref="U?"  Part="2" 
F 0 "U?" H 5930 7296 50  0000 L CNN
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
Text Notes 6750 1150 0    50   ~ 0
Tristate ~W~ on ~HALT~.
Text Notes 5450 1850 0    50   ~ 0
Keep ~W~ low during a wait state.
$Comp
L Device:R_Small R?
U 1 1 5D2DC64D
P 2100 1800
AR Path="/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5D2DC64D" Ref="R?"  Part="1" 
F 0 "R?" H 2159 1846 50  0000 L CNN
F 1 "4.7kΩ" H 2159 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2100 1800 50  0001 C CNN
F 3 "~" H 2100 1800 50  0001 C CNN
	1    2100 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D2DC653
P 2100 1700
AR Path="/5F67D4B5/5D2DC653" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D2DC653" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2100 1550 50  0001 C CNN
F 1 "+5V" H 2115 1873 50  0000 C CNN
F 2 "" H 2100 1700 50  0001 C CNN
F 3 "" H 2100 1700 50  0001 C CNN
	1    2100 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1950 2100 1950
Wire Wire Line
	2100 1900 2100 1950
Connection ~ 2100 1950
Wire Wire Line
	2100 1950 2600 1950
$Comp
L alexios:74HC245 U?
U 2 1 5E214BF4
P 4300 6950
F 0 "U?" H 4480 7396 50  0000 L CNN
F 1 "74HC245" H 4480 7305 50  0000 L CNN
F 2 "" H 4300 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 4300 7000 50  0001 C CNN
	2    4300 6950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U?
U 2 1 5E214BFA
P 5750 6850
F 0 "U?" H 5930 7296 50  0000 L CNN
F 1 "74HC245" H 5930 7205 50  0000 L CNN
F 2 "" H 5750 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 5750 6900 50  0001 C CNN
	2    5750 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E214C00
P 3950 6550
AR Path="/5CC0D65F/5E214C00" Ref="C?"  Part="1" 
AR Path="/5E214C00" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/5E214C00" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E214C00" Ref="C?"  Part="1" 
F 0 "C?" H 3859 6596 50  0000 R CNN
F 1 "100nF" H 3859 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3950 6550 50  0001 C CNN
F 3 "~" H 3950 6550 50  0001 C CNN
	1    3950 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E214C06
P 5400 6450
AR Path="/5CC0D65F/5E214C06" Ref="C?"  Part="1" 
AR Path="/5E214C06" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/5E214C06" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E214C06" Ref="C?"  Part="1" 
F 0 "C?" H 5309 6496 50  0000 R CNN
F 1 "100nF" H 5309 6405 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5400 6450 50  0001 C CNN
F 3 "~" H 5400 6450 50  0001 C CNN
	1    5400 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E214C0C
P 5400 6550
F 0 "#PWR?" H 5400 6300 50  0001 C CNN
F 1 "GND" H 5405 6377 50  0000 C CNN
F 2 "" H 5400 6550 50  0001 C CNN
F 3 "" H 5400 6550 50  0001 C CNN
	1    5400 6550
	1    0    0    -1  
$EndComp
Connection ~ 5400 6550
$Comp
L power:GND #PWR?
U 1 1 5E214C13
P 3950 6650
F 0 "#PWR?" H 3950 6400 50  0001 C CNN
F 1 "GND" H 3955 6477 50  0000 C CNN
F 2 "" H 3950 6650 50  0001 C CNN
F 3 "" H 3950 6650 50  0001 C CNN
	1    3950 6650
	1    0    0    -1  
$EndComp
Connection ~ 3950 6650
$Comp
L power:+5V #PWR?
U 1 1 5E214C1A
P 3950 6450
F 0 "#PWR?" H 3950 6300 50  0001 C CNN
F 1 "+5V" H 3965 6623 50  0000 C CNN
F 2 "" H 3950 6450 50  0001 C CNN
F 3 "" H 3950 6450 50  0001 C CNN
	1    3950 6450
	1    0    0    -1  
$EndComp
Connection ~ 3950 6450
$Comp
L power:+5V #PWR?
U 1 1 5E214C21
P 5400 6350
F 0 "#PWR?" H 5400 6200 50  0001 C CNN
F 1 "+5V" H 5415 6523 50  0000 C CNN
F 2 "" H 5400 6350 50  0001 C CNN
F 3 "" H 5400 6350 50  0001 C CNN
	1    5400 6350
	1    0    0    -1  
$EndComp
Connection ~ 5400 6350
$Comp
L Connector:TestPoint TP?
U 1 1 5E2DFCE5
P 6650 950
AR Path="/5F67D4B5/5E2DFCE5" Ref="TP?"  Part="1" 
AR Path="/5E2DFCE5" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5E2DFCE5" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5E2DFCE5" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5E2DFCE5" Ref="TP?"  Part="1" 
F 0 "TP?" H 6600 1200 50  0000 L CNN
F 1 "TestPoint" H 6708 977 50  0001 L CNN
F 2 "" H 6850 950 50  0001 C CNN
F 3 "~" H 6850 950 50  0001 C CNN
	1    6650 950 
	1    0    0    -1  
$EndComp
Connection ~ 6650 950 
$Comp
L power:GND #PWR?
U 1 1 5D33F613
P 3750 2100
AR Path="/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F613" Ref="#PWR01503"  Part="1" 
AR Path="/5D44ECB5/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F613" Ref="#PWR0701"  Part="1" 
F 0 "#PWR0701" H 3750 1850 50  0001 C CNN
F 1 "GND" V 3700 2000 50  0000 R CNN
F 2 "" H 3750 2100 50  0001 C CNN
F 3 "" H 3750 2100 50  0001 C CNN
	1    3750 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	6500 4600 6500 6000
Connection ~ 6500 4600
$Comp
L Connector:TestPoint TP?
U 1 1 5E2D2825
P 6150 4600
AR Path="/5F67D4B5/5E2D2825" Ref="TP?"  Part="1" 
AR Path="/5E2D2825" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5E2D2825" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5E2D2825" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5E2D2825" Ref="TP?"  Part="1" 
F 0 "TP?" H 6250 4850 50  0000 R CNN
F 1 "TestPoint" H 6208 4627 50  0001 L CNN
F 2 "" H 6350 4600 50  0001 C CNN
F 3 "~" H 6350 4600 50  0001 C CNN
	1    6150 4600
	-1   0    0    1   
$EndComp
Text Notes 7000 3050 0    100  ~ 20
Data Bus Transceiver
Wire Wire Line
	5800 4600 6150 4600
Entry Wire Line
	8750 5600 8650 5700
Entry Wire Line
	8750 5500 8650 5600
Entry Wire Line
	8750 5400 8650 5500
Entry Wire Line
	8750 5300 8650 5400
Entry Wire Line
	8750 5200 8650 5300
Entry Wire Line
	8750 5100 8650 5200
Entry Wire Line
	8750 5000 8650 5100
Entry Wire Line
	8750 4900 8650 5000
Entry Wire Line
	8750 4100 8650 4200
Entry Wire Line
	8750 4000 8650 4100
Entry Wire Line
	8750 3900 8650 4000
Entry Wire Line
	8750 3800 8650 3900
Entry Wire Line
	8750 3700 8650 3800
Entry Wire Line
	8750 3600 8650 3700
Entry Wire Line
	8750 3500 8650 3600
Entry Wire Line
	8750 3400 8650 3500
Text Label 7000 6000 0    50   ~ 0
~BUSEN
Text Label 6500 5050 1    50   ~ 0
~BUSEN
Text Label 6650 5050 1    50   ~ 0
~R
Wire Wire Line
	6500 4500 7300 4500
Wire Wire Line
	6500 6000 7300 6000
Wire Wire Line
	6500 4500 6500 4600
Text HLabel 1650 4400 0    50   Input ~ 0
~R
Text Label 6050 4400 0    50   ~ 0
~R
Text Label 7000 5900 0    50   ~ 0
~R
Text Label 7000 4400 0    50   ~ 0
~R
Wire Wire Line
	6650 4400 7300 4400
Connection ~ 6650 4400
Wire Wire Line
	6650 5900 7300 5900
Wire Wire Line
	6650 4400 6650 5900
Wire Wire Line
	1650 4400 6650 4400
Text HLabel 1650 3150 0    50   3State ~ 0
IBUS[0..15]
Text Label 6050 3150 0    50   ~ 0
IBUS[0..15]
Entry Bus Bus
	6750 3150 6850 3250
Text HLabel 9550 3150 2    50   3State ~ 0
DB[0..15]
Text Label 9100 3150 0    50   ~ 0
DB[0..15]
Entry Bus Bus
	8750 3250 8850 3150
Wire Bus Line
	8850 3150 9550 3150
Wire Bus Line
	6750 3150 1650 3150
$Comp
L alexios:74HC245 U?
U 1 1 5E214C80
P 7800 4000
F 0 "U?" H 7800 4767 50  0000 C CNN
F 1 "74HC245" H 7800 4676 50  0000 C CNN
F 2 "" H 7800 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 7800 4050 50  0001 C CNN
	1    7800 4000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U?
U 1 1 5E214C7A
P 7800 5500
F 0 "U?" H 7800 6267 50  0000 C CNN
F 1 "74HC245" H 7800 6176 50  0000 C CNN
F 2 "" H 7800 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 7800 5550 50  0001 C CNN
	1    7800 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3500 6950 3500
Wire Wire Line
	7300 3600 6950 3600
Wire Wire Line
	7300 3700 6950 3700
Wire Wire Line
	7300 3800 6950 3800
Wire Wire Line
	7300 3900 6950 3900
Wire Wire Line
	7300 4000 6950 4000
Wire Wire Line
	7300 4100 6950 4100
Wire Wire Line
	7300 4200 6950 4200
Wire Wire Line
	7300 5000 6950 5000
Wire Wire Line
	7300 5100 6950 5100
Wire Wire Line
	7300 5200 6950 5200
Wire Wire Line
	7300 5300 6950 5300
Wire Wire Line
	7300 5400 6950 5400
Wire Wire Line
	7300 5500 6950 5500
Wire Wire Line
	7300 5600 6950 5600
Wire Wire Line
	7300 5700 6950 5700
Text Label 7000 3500 0    50   ~ 0
IBUS0
Text Label 7000 3600 0    50   ~ 0
IBUS1
Text Label 7000 3700 0    50   ~ 0
IBUS2
Text Label 7000 3800 0    50   ~ 0
IBUS3
Text Label 7000 3900 0    50   ~ 0
IBUS4
Text Label 7000 4000 0    50   ~ 0
IBUS5
Text Label 7000 4100 0    50   ~ 0
IBUS6
Text Label 7000 4200 0    50   ~ 0
IBUS7
Text Label 7050 5000 0    50   ~ 0
IBUS8
Text Label 7050 5100 0    50   ~ 0
IBUS9
Text Label 7050 5200 0    50   ~ 0
IBUS10
Text Label 7050 5300 0    50   ~ 0
IBUS11
Text Label 7050 5400 0    50   ~ 0
IBUS12
Text Label 7050 5500 0    50   ~ 0
IBUS13
Text Label 7050 5600 0    50   ~ 0
IBUS14
Text Label 7050 5700 0    50   ~ 0
IBUS15
Wire Wire Line
	8300 3500 8650 3500
Wire Wire Line
	8300 3600 8650 3600
Wire Wire Line
	8300 3700 8650 3700
Wire Wire Line
	8300 3800 8650 3800
Wire Wire Line
	8300 3900 8650 3900
Wire Wire Line
	8300 4000 8650 4000
Wire Wire Line
	8300 4100 8650 4100
Wire Wire Line
	8300 4200 8650 4200
Wire Wire Line
	8300 5000 8650 5000
Wire Wire Line
	8300 5100 8650 5100
Wire Wire Line
	8300 5200 8650 5200
Wire Wire Line
	8300 5300 8650 5300
Wire Wire Line
	8300 5400 8650 5400
Wire Wire Line
	8300 5500 8650 5500
Wire Wire Line
	8300 5600 8650 5600
Wire Wire Line
	8300 5700 8650 5700
Text Label 8350 3500 0    50   ~ 0
DB0
Text Label 8350 3600 0    50   ~ 0
DB1
Text Label 8350 3700 0    50   ~ 0
DB2
Text Label 8350 3800 0    50   ~ 0
DB3
Text Label 8350 3900 0    50   ~ 0
DB4
Text Label 8350 4000 0    50   ~ 0
DB5
Text Label 8350 4100 0    50   ~ 0
DB6
Text Label 8350 4200 0    50   ~ 0
DB7
Text Label 8350 5000 0    50   ~ 0
DB8
Text Label 8350 5100 0    50   ~ 0
DB9
Text Label 8350 5200 0    50   ~ 0
DB10
Text Label 8350 5300 0    50   ~ 0
DB11
Text Label 8350 5400 0    50   ~ 0
DB12
Text Label 8350 5500 0    50   ~ 0
DB13
Text Label 8350 5600 0    50   ~ 0
DB14
Text Label 8350 5700 0    50   ~ 0
DB15
Entry Wire Line
	6850 3400 6950 3500
Entry Wire Line
	6850 3500 6950 3600
Entry Wire Line
	6850 3600 6950 3700
Entry Wire Line
	6850 3700 6950 3800
Entry Wire Line
	6850 3800 6950 3900
Entry Wire Line
	6850 3900 6950 4000
Entry Wire Line
	6850 4000 6950 4100
Entry Wire Line
	6850 4100 6950 4200
Entry Wire Line
	6850 4900 6950 5000
Entry Wire Line
	6850 5000 6950 5100
Entry Wire Line
	6850 5100 6950 5200
Entry Wire Line
	6850 5200 6950 5300
Entry Wire Line
	6850 5300 6950 5400
Entry Wire Line
	6850 5400 6950 5500
Entry Wire Line
	6850 5500 6950 5600
Entry Wire Line
	6850 5600 6950 5700
Text Label 6850 5050 1    50   ~ 0
IBUS[0..15]
Text Label 8750 4650 1    50   ~ 0
DB[0..15]
Wire Wire Line
	1650 4700 5300 4700
Wire Wire Line
	1650 4600 5300 4600
Text Label 5050 4700 2    50   ~ 0
~MEM
Text Label 1750 4700 0    50   ~ 0
~MEM
Text Label 5050 4600 2    50   ~ 0
~IO
Text Label 5800 4600 0    50   ~ 0
~BUSEN
Text HLabel 1650 4700 0    50   Input ~ 0
~MEM
Text HLabel 1650 4600 0    50   Input ~ 0
~IO
Text Label 1750 4600 0    50   ~ 0
~IO
Wire Wire Line
	5150 4500 5300 4500
Wire Wire Line
	5150 2300 5150 4500
$Comp
L alexios:74LVC1G11 U?
U 1 1 5D33F61B
P 5600 4550
AR Path="/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F61B" Ref="U1504"  Part="1" 
AR Path="/5D44ECB5/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F61B" Ref="U703"  Part="1" 
F 0 "U703" H 5550 4300 50  0000 C CNN
F 1 "74LVC1G11" H 5550 4209 50  0000 C CNN
F 2 "" H 5500 4475 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5500 4475 50  0001 C CNN
	1    5600 4550
	1    0    0    -1  
$EndComp
Text Notes 3850 2650 0    100  ~ 20
Wait State
Connection ~ 6150 4600
Wire Wire Line
	6150 4600 6500 4600
Text Label 7000 4500 0    50   ~ 0
~BUSEN
Text Notes 5150 5600 0    50   ~ 0
~WAITING~\n\n  X\n  X\n  0\n  1
Text Notes 5650 5600 0    50   ~ 0
~BUSEN~\n\n  0\n  0\n  0\n  1
Wire Notes Line width 20 style solid
	4625 5050 6000 5050
Wire Notes Line style solid
	4625 5225 6000 5225
Wire Notes Line width 20 style solid
	6000 5650 6000 5050
Wire Notes Line width 20 style solid
	4625 5650 4625 5050
Wire Notes Line width 20 style solid
	4625 5650 6000 5650
Wire Notes Line
	5550 5050 5550 5650
Text Notes 4950 5600 0    50   ~ 0
~IO~\n\n X\n 0\n X\n 1
Text Notes 4700 5600 0    50   ~ 0
~MEM~\n\n 0\n X\n X\n 1
$Comp
L Device:R_Small R?
U 1 1 5E3D8531
P 2200 1200
AR Path="/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5D54E677/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5E3D8531" Ref="R?"  Part="1" 
F 0 "R?" V 2100 1500 50  0000 C CNN
F 1 "4.7kΩ" V 2200 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2200 1200 50  0001 C CNN
F 3 "~" H 2200 1200 50  0001 C CNN
	1    2200 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 1200 2350 1200
Wire Wire Line
	2350 1200 2350 1300
Connection ~ 2350 1300
Wire Wire Line
	2350 1300 1650 1300
$Comp
L power:+5V #PWR?
U 1 1 5E3DAB69
P 2050 1150
AR Path="/5F67D4B5/5E3DAB69" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E3DAB69" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2050 1000 50  0001 C CNN
F 1 "+5V" H 2200 1250 50  0000 C CNN
F 2 "" H 2050 1150 50  0001 C CNN
F 3 "" H 2050 1150 50  0001 C CNN
	1    2050 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1150 2050 1200
Wire Wire Line
	2050 1200 2100 1200
Text Notes 2700 1150 0    50   ~ 0
Pull-up  may be optional, test!
Text Notes 5800 2550 0    50   ~ 0
~WAITING~\n\n  X\n  0\n  1\n  1\n  1
Text Notes 6850 2550 0    50   ~ 0
~W~\n\nZ\n0\n1\n1\n0
$Comp
L alexios:74LVC1G3208 U704
U 1 1 5E46DC19
P 5650 1400
F 0 "U704" H 5675 1714 50  0000 C CNN
F 1 "74LVC1G3208" H 5675 1623 50  0000 C CNN
F 2 "" H 5650 750 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5650 750 50  0001 C CNN
	1    5650 1400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G3208 U?
U 2 1 5E46F249
P 2850 7250
F 0 "U?" H 3030 7296 50  0000 L CNN
F 1 "74LVC1G3208" H 3030 7205 50  0000 L CNN
F 2 "" H 2850 6600 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2850 6600 50  0001 C CNN
	2    2850 7250
	1    0    0    -1  
$EndComp
Connection ~ 2500 7350
Connection ~ 2500 7150
Text Notes 6500 2550 0    50   ~ 0
WSTB\n\n  X\n  X\n  X\n  1\n  0
Wire Bus Line
	6850 3250 6850 5600
Wire Bus Line
	8750 3250 8750 5600
$EndSCHEMATC
