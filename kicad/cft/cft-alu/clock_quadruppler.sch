EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 10
Title "Clock Quadruppler"
Date ""
Rev "2020"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7100 1650 7150 1650
$Comp
L Device:R_Small R?
U 1 1 5EF439D5
P 7250 1650
AR Path="/5DF75CDE/5EF439D5" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF439D5" Ref="R5"  Part="1" 
F 0 "R5" V 7054 1650 50  0000 C CNN
F 1 "0Ω" V 7145 1650 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7250 1650 50  0001 C CNN
F 3 "~" H 7250 1650 50  0001 C CNN
	1    7250 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5EF439DB
P 5800 1850
AR Path="/5DF75CDE/5EF439DB" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF439DB" Ref="R4"  Part="1" 
F 0 "R4" V 5604 1850 50  0000 C CNN
F 1 "0Ω" V 5695 1850 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5800 1850 50  0001 C CNN
F 3 "~" H 5800 1850 50  0001 C CNN
	1    5800 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 1850 5950 1850
Wire Wire Line
	5650 1850 5700 1850
Wire Wire Line
	5900 1400 5950 1400
Wire Wire Line
	5650 1400 5700 1400
$Comp
L Device:R_Small R?
U 1 1 5EF439E5
P 5800 1400
AR Path="/5DF75CDE/5EF439E5" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF439E5" Ref="R3"  Part="1" 
F 0 "R3" V 5604 1400 50  0000 C CNN
F 1 "0Ω" V 5695 1400 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5800 1400 50  0001 C CNN
F 3 "~" H 5800 1400 50  0001 C CNN
	1    5800 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5EF439EB
P 7100 1650
AR Path="/5DF75CDE/5EF439EB" Ref="TP?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF439EB" Ref="TP6"  Part="1" 
F 0 "TP6" H 7100 1900 50  0000 C CNN
F 1 "TestPoint" H 7158 1677 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 7300 1650 50  0001 C CNN
F 3 "~" H 7300 1650 50  0001 C CNN
	1    7100 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	6550 1900 6550 1700
$Comp
L Connector:TestPoint TP?
U 1 1 5EF439F2
P 6550 1900
AR Path="/5DF75CDE/5EF439F2" Ref="TP?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF439F2" Ref="TP7"  Part="1" 
F 0 "TP7" H 6400 2050 50  0000 C CNN
F 1 "TestPoint" H 6608 1927 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6750 1900 50  0001 C CNN
F 3 "~" H 6750 1900 50  0001 C CNN
	1    6550 1900
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5EF439F8
P 6550 1450
AR Path="/5DF75CDE/5EF439F8" Ref="TP?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF439F8" Ref="TP5"  Part="1" 
F 0 "TP5" H 6550 1700 50  0000 C CNN
F 1 "TestPoint" H 6608 1477 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6750 1450 50  0001 C CNN
F 3 "~" H 6750 1450 50  0001 C CNN
	1    6550 1450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC86 U?
U 1 1 5EF439FE
P 6200 1450
AR Path="/5CE09726/5EF439FE" Ref="U?"  Part="1" 
AR Path="/6A313729/5EF439FE" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EF439FE" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EF439FE" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5EF439FE" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF439FE" Ref="U12"  Part="1" 
F 0 "U12" H 6225 1725 50  0000 C CNN
F 1 "74AC86" H 6225 1634 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5725 1050 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 5725 1050 50  0001 C CNN
	1    6200 1450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC86 U?
U 2 1 5EF43A04
P 6200 1900
AR Path="/5CE09726/5EF43A04" Ref="U?"  Part="2" 
AR Path="/6A313729/5EF43A04" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5EF43A04" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5EF43A04" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5EF43A04" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5EF12B5A/5EF43A04" Ref="U12"  Part="2" 
F 0 "U12" H 6225 2175 50  0000 C CNN
F 1 "74AC86" H 6225 2084 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5725 1500 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 5725 1500 50  0001 C CNN
	2    6200 1900
	1    0    0    -1  
$EndComp
Connection ~ 7100 1650
$Comp
L alexios:74AC86 U?
U 3 1 5EF43A0B
P 6800 1650
AR Path="/5CE09726/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/6A313729/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D0A147D/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D396E91/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/5DF75CDE/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/5DF75CDE/5EF12B5A/5EF43A0B" Ref="U12"  Part="3" 
F 0 "U12" H 6825 1832 50  0000 C CNN
F 1 "74AC86" H 6825 1923 50  0000 C CNN
F 2 "alexios:SOIC-14" H 6325 1250 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6325 1250 50  0001 C CNN
	3    6800 1650
	1    0    0    1   
$EndComp
$Comp
L alexios:74HC04 U?
U 4 1 5EF43A11
P 5300 1850
AR Path="/6A313729/5EF43A11" Ref="U?"  Part="4" 
AR Path="/5DC89E19/5D0A147D/5EF43A11" Ref="U?"  Part="4" 
AR Path="/5DC89E19/5D396E91/5EF43A11" Ref="U?"  Part="4" 
AR Path="/5DF75CDE/5EF43A11" Ref="U?"  Part="4" 
AR Path="/5EF43A11" Ref="U?"  Part="4" 
AR Path="/5DF75CDE/5EF12B5A/5EF43A11" Ref="U11"  Part="4" 
F 0 "U11" H 5400 2000 50  0000 C CNN
F 1 "74HC04" H 5375 2026 50  0001 C CNN
F 2 "alexios:SOIC-14" H 5300 2050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5300 2050 50  0001 C CNN
	4    5300 1850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U?
U 3 1 5EF43A17
P 4750 1850
AR Path="/6A313729/5EF43A17" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D0A147D/5EF43A17" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D396E91/5EF43A17" Ref="U?"  Part="3" 
AR Path="/5DF75CDE/5EF43A17" Ref="U?"  Part="3" 
AR Path="/5EF43A17" Ref="U?"  Part="3" 
AR Path="/5DF75CDE/5EF12B5A/5EF43A17" Ref="U11"  Part="3" 
F 0 "U11" H 4900 2000 50  0000 C CNN
F 1 "74HC04" H 4825 2026 50  0001 C CNN
F 2 "alexios:SOIC-14" H 4750 2050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4750 2050 50  0001 C CNN
	3    4750 1850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U?
U 2 1 5EF43A1D
P 5300 1400
AR Path="/6A313729/5EF43A1D" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5EF43A1D" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5EF43A1D" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5EF43A1D" Ref="U?"  Part="2" 
AR Path="/5EF43A1D" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5EF12B5A/5EF43A1D" Ref="U11"  Part="2" 
F 0 "U11" H 5375 1667 50  0000 C CNN
F 1 "74HC04" H 5375 1576 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5300 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5300 1600 50  0001 C CNN
	2    5300 1400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U?
U 1 1 5EF43A23
P 4750 1400
AR Path="/6A313729/5EF43A23" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EF43A23" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EF43A23" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5EF43A23" Ref="U?"  Part="1" 
AR Path="/5EF43A23" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF43A23" Ref="U11"  Part="1" 
F 0 "U11" H 4825 1667 50  0000 C CNN
F 1 "74HC04" H 4825 1576 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4750 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4750 1600 50  0001 C CNN
	1    4750 1400
	1    0    0    -1  
$EndComp
Text Notes 8700 3000 0    50   ~ 0
16 MHz clock
Wire Wire Line
	4500 2050 5650 2050
Wire Wire Line
	4500 1850 4550 1850
Wire Wire Line
	4500 1400 4550 1400
Wire Wire Line
	4500 1600 5650 1600
Text HLabel 3900 3100 0    50   Input ~ 0
CLK4
Text HLabel 3950 1500 0    50   Input ~ 0
CLK2
Wire Wire Line
	6550 1450 6550 1600
Connection ~ 6550 1450
Wire Wire Line
	6500 1450 6550 1450
Wire Wire Line
	5650 1500 5950 1500
Wire Wire Line
	5650 1950 5950 1950
Connection ~ 6550 1900
Wire Wire Line
	6500 1900 6550 1900
Wire Wire Line
	3900 3100 4500 3100
Wire Wire Line
	5650 1950 5650 2050
Wire Wire Line
	4500 1500 4500 1600
Wire Wire Line
	4500 1400 4500 1500
Connection ~ 4500 1500
Wire Wire Line
	3950 1500 4500 1500
Wire Wire Line
	5650 1500 5650 1600
NoConn ~ 1650 6450
Wire Wire Line
	1050 6450 1100 6450
Wire Wire Line
	1050 6400 1050 6450
$Comp
L power:+5V #PWR?
U 1 1 5EF51032
P 1050 6400
AR Path="/6A313729/5EF51032" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EF51032" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EF51032" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF51032" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF51032" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 1050 6250 50  0001 C CNN
F 1 "+5V" H 1065 6573 50  0000 C CNN
F 2 "" H 1050 6400 50  0001 C CNN
F 3 "" H 1050 6400 50  0001 C CNN
	1    1050 6400
	1    0    0    -1  
$EndComp
NoConn ~ 2400 6450
$Comp
L alexios:74AC04 U?
U 6 1 5EF51039
P 1300 6450
AR Path="/5CE09726/5EF51039" Ref="U?"  Part="6" 
AR Path="/6A313729/5EF51039" Ref="U?"  Part="6" 
AR Path="/5DC89E19/5D0A147D/5EF51039" Ref="U?"  Part="6" 
AR Path="/5DC89E19/5D396E91/5EF51039" Ref="U?"  Part="6" 
AR Path="/5DF75CDE/5EF51039" Ref="U?"  Part="6" 
AR Path="/5EF51039" Ref="U?"  Part="6" 
AR Path="/5DF75CDE/5EF12B5A/5EF51039" Ref="U11"  Part="6" 
F 0 "U11" H 1375 6717 50  0000 C CNN
F 1 "74HC04" H 1375 6626 50  0000 C CNN
F 2 "alexios:SOIC-14" H 1300 6450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1300 6450 50  0001 C CNN
	6    1300 6450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 5 1 5EF5103F
P 2050 6450
AR Path="/5CE09726/5EF5103F" Ref="U?"  Part="6" 
AR Path="/6A313729/5EF5103F" Ref="U?"  Part="5" 
AR Path="/5DC89E19/5D0A147D/5EF5103F" Ref="U?"  Part="5" 
AR Path="/5DC89E19/5D396E91/5EF5103F" Ref="U?"  Part="5" 
AR Path="/5DF75CDE/5EF5103F" Ref="U?"  Part="5" 
AR Path="/5EF5103F" Ref="U?"  Part="5" 
AR Path="/5DF75CDE/5EF12B5A/5EF5103F" Ref="U11"  Part="5" 
F 0 "U11" H 2125 6717 50  0000 C CNN
F 1 "74HC04" H 2125 6626 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2050 6450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2050 6450 50  0001 C CNN
	5    2050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF51045
P 1850 6450
AR Path="/5DF75CDE/5EF51045" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF51045" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 1850 6200 50  0001 C CNN
F 1 "GND" H 1855 6277 50  0000 C CNN
F 2 "" H 1850 6450 50  0001 C CNN
F 3 "" H 1850 6450 50  0001 C CNN
	1    1850 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF9EB32
P 1050 7250
AR Path="/5EF9EB32" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF9EB32" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5EF9EB32" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EF9EB32" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EF9EB32" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF9EB32" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF9EB32" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 1050 7000 50  0001 C CNN
F 1 "GND" H 1055 7077 50  0000 C CNN
F 2 "" H 1050 7250 50  0001 C CNN
F 3 "" H 1050 7250 50  0001 C CNN
	1    1050 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EF9EB38
P 1050 7050
AR Path="/5EF9EB38" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF9EB38" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5EF9EB38" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EF9EB38" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EF9EB38" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF9EB38" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF9EB38" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 1050 6900 50  0001 C CNN
F 1 "+5V" H 1065 7223 50  0000 C CNN
F 2 "" H 1050 7050 50  0001 C CNN
F 3 "" H 1050 7050 50  0001 C CNN
	1    1050 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EF9EB3E
P 1050 7150
AR Path="/5CC0D65F/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5EF76914/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/6A313729/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF9EB3E" Ref="C17"  Part="1" 
F 0 "C17" H 959 7196 50  0000 R CNN
F 1 "100nF" H 959 7105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1050 7150 50  0001 C CNN
F 3 "~" H 1050 7150 50  0001 C CNN
	1    1050 7150
	1    0    0    -1  
$EndComp
Connection ~ 1050 7250
Connection ~ 1050 7050
$Comp
L alexios:74AC86 U?
U 5 1 5EF9EB46
P 1400 7050
AR Path="/5CE09726/5EF9EB46" Ref="U?"  Part="1" 
AR Path="/6A313729/5EF9EB46" Ref="U?"  Part="5" 
AR Path="/5DC89E19/5D0A147D/5EF9EB46" Ref="U?"  Part="5" 
AR Path="/5DC89E19/5D396E91/5EF9EB46" Ref="U?"  Part="5" 
AR Path="/5DF75CDE/5EF9EB46" Ref="U?"  Part="5" 
AR Path="/5DF75CDE/5EF12B5A/5EF9EB46" Ref="U12"  Part="5" 
F 0 "U12" H 1580 6996 50  0000 L CNN
F 1 "74AC86" H 1580 6905 50  0000 L CNN
F 2 "alexios:SOIC-14" H 925 6650 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 925 6650 50  0001 C CNN
	5    1400 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EFB3368
P 2300 7150
AR Path="/5CC0D65F/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5EF76914/5EFB3368" Ref="C?"  Part="1" 
AR Path="/6A313729/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EFB3368" Ref="C13"  Part="1" 
F 0 "C13" H 2209 7196 50  0000 R CNN
F 1 "100nF" H 2209 7105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7150 50  0001 C CNN
F 3 "~" H 2300 7150 50  0001 C CNN
	1    2300 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFB336E
P 2300 7250
AR Path="/5EFB336E" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EFB336E" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5EFB336E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EFB336E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EFB336E" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EFB336E" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EFB336E" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 2300 7000 50  0001 C CNN
F 1 "GND" H 2305 7077 50  0000 C CNN
F 2 "" H 2300 7250 50  0001 C CNN
F 3 "" H 2300 7250 50  0001 C CNN
	1    2300 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EFB3374
P 2300 7050
AR Path="/5EFB3374" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EFB3374" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5EFB3374" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EFB3374" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EFB3374" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EFB3374" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EFB3374" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 2300 6900 50  0001 C CNN
F 1 "+5V" H 2315 7223 50  0000 C CNN
F 2 "" H 2300 7050 50  0001 C CNN
F 3 "" H 2300 7050 50  0001 C CNN
	1    2300 7050
	1    0    0    -1  
$EndComp
Connection ~ 2300 7250
Connection ~ 2300 7050
$Comp
L alexios:74HC04 U?
U 7 1 5EFB337C
P 2650 7050
AR Path="/6A313729/5EFB337C" Ref="U?"  Part="7" 
AR Path="/5DC89E19/5D0A147D/5EFB337C" Ref="U?"  Part="7" 
AR Path="/5DC89E19/5D396E91/5EFB337C" Ref="U?"  Part="7" 
AR Path="/5DF75CDE/5EFB337C" Ref="U?"  Part="7" 
AR Path="/5EFB337C" Ref="U?"  Part="7" 
AR Path="/5DF75CDE/5EF12B5A/5EFB337C" Ref="U11"  Part="7" 
F 0 "U11" H 2830 6996 50  0000 L CNN
F 1 "74HC04" H 2830 6905 50  0000 L CNN
F 2 "alexios:SOIC-14" H 2650 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2650 7250 50  0001 C CNN
	7    2650 7050
	1    0    0    -1  
$EndComp
Text Label 7450 1650 0    50   ~ 0
x4CLK
Wire Wire Line
	7350 1650 7800 1650
Text HLabel 8700 3100 2    50   Output ~ 0
x4CLK
Text Label 4550 4500 0    50   ~ 0
CLK4
$Comp
L alexios:ICS501 U?
U 1 1 5F091B58
P 5300 4650
AR Path="/5DF75CDE/5F091B58" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F091B58" Ref="U46"  Part="1" 
F 0 "U46" H 5300 5067 50  0000 C CNN
F 1 "ICS501" H 5300 4976 50  0000 C CNN
F 2 "alexios:SOIC-8" H 5250 4800 50  0001 C CNN
F 3 "https://uk.mouser.com/datasheet/2/698/IDT__DST_20170331-1711217.pdf" H 5250 4800 50  0001 C CNN
	1    5300 4650
	1    0    0    -1  
$EndComp
NoConn ~ 4800 5000
$Comp
L alexios:74LVC1G04 U?
U 1 1 5F0A251C
P 6600 4350
AR Path="/5DF75CDE/5F0A251C" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0A251C" Ref="U21"  Part="1" 
F 0 "U21" H 6550 4617 50  0000 C CNN
F 1 "74LVC1G04" H 6550 4526 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6600 4350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 6600 4350 50  0001 C CNN
	1    6600 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4500 6250 4500
$Comp
L Device:R_Small R?
U 1 1 5F0A2523
P 7250 4500
AR Path="/5DF75CDE/5F0A2523" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0A2523" Ref="R7"  Part="1" 
F 0 "R7" V 7054 4500 50  0000 C CNN
F 1 "0Ω" V 7145 4500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7250 4500 50  0001 C CNN
F 3 "~" H 7250 4500 50  0001 C CNN
	1    7250 4500
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5F0A252B
P 6050 4950
AR Path="/5DF75CDE/5F0A252B" Ref="JP?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0A252B" Ref="JP2"  Part="1" 
F 0 "JP2" V 6050 5100 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 6050 5064 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 6050 4950 50  0001 C CNN
F 3 "~" H 6050 4950 50  0001 C CNN
	1    6050 4950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0A2531
P 5850 5150
AR Path="/5DF75CDE/5F0A2531" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0A2531" Ref="#PWR0156"  Part="1" 
F 0 "#PWR0156" H 5850 4900 50  0001 C CNN
F 1 "GND" H 5855 4977 50  0000 C CNN
F 2 "" H 5850 5150 50  0001 C CNN
F 3 "" H 5850 5150 50  0001 C CNN
	1    5850 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4900 5850 4900
Wire Wire Line
	5850 5150 5850 5000
Wire Wire Line
	5800 4800 6050 4800
$Comp
L power:GND #PWR?
U 1 1 5F0A253A
P 6050 5150
AR Path="/5DF75CDE/5F0A253A" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0A253A" Ref="#PWR0222"  Part="1" 
F 0 "#PWR0222" H 6050 4900 50  0001 C CNN
F 1 "GND" H 6055 4977 50  0000 C CNN
F 2 "" H 6050 5150 50  0001 C CNN
F 3 "" H 6050 5150 50  0001 C CNN
	1    6050 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5100 6050 5150
Wire Wire Line
	5800 5000 5850 5000
Connection ~ 5850 5000
Wire Wire Line
	5850 5000 5850 4900
Text Label 7650 4500 2    50   ~ 0
x4CLK
Connection ~ 4800 7050
Connection ~ 4800 7250
$Comp
L Device:C_Small C?
U 1 1 5F0B2E84
P 4800 7150
AR Path="/5CC0D65F/5F0B2E84" Ref="C?"  Part="1" 
AR Path="/5F0B2E84" Ref="C?"  Part="1" 
AR Path="/5EF76914/5F0B2E84" Ref="C?"  Part="1" 
AR Path="/6A313729/5F0B2E84" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5F0B2E84" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5F0B2E84" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5F0B2E84" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0B2E84" Ref="C53"  Part="1" 
F 0 "C53" H 4709 7196 50  0000 R CNN
F 1 "100nF" H 4709 7105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4800 7150 50  0001 C CNN
F 3 "~" H 4800 7150 50  0001 C CNN
	1    4800 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0B2E8A
P 4800 7050
AR Path="/5F0B2E8A" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5F0B2E8A" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5F0B2E8A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5F0B2E8A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5F0B2E8A" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5F0B2E8A" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0B2E8A" Ref="#PWR0223"  Part="1" 
F 0 "#PWR0223" H 4800 6900 50  0001 C CNN
F 1 "+5V" H 4815 7223 50  0000 C CNN
F 2 "" H 4800 7050 50  0001 C CNN
F 3 "" H 4800 7050 50  0001 C CNN
	1    4800 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0B2E90
P 4800 7250
AR Path="/5F0B2E90" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5F0B2E90" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5F0B2E90" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5F0B2E90" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5F0B2E90" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5F0B2E90" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0B2E90" Ref="#PWR0224"  Part="1" 
F 0 "#PWR0224" H 4800 7000 50  0001 C CNN
F 1 "GND" H 4805 7077 50  0000 C CNN
F 2 "" H 4800 7250 50  0001 C CNN
F 3 "" H 4800 7250 50  0001 C CNN
	1    4800 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U?
U 2 1 5F0B2E96
P 5150 7150
AR Path="/5DF75CDE/5F0B2E96" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5EF12B5A/5F0B2E96" Ref="U21"  Part="2" 
F 0 "U21" H 5330 7196 50  0000 L CNN
F 1 "74LVC1G04" H 5330 7105 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5150 7150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 5150 7150 50  0001 C CNN
	2    5150 7150
	1    0    0    -1  
$EndComp
Connection ~ 3550 7250
Connection ~ 3550 7050
$Comp
L Device:C_Small C?
U 1 1 5F0B2E9E
P 3550 7150
AR Path="/5CC0D65F/5F0B2E9E" Ref="C?"  Part="1" 
AR Path="/5F0B2E9E" Ref="C?"  Part="1" 
AR Path="/5EF76914/5F0B2E9E" Ref="C?"  Part="1" 
AR Path="/6A313729/5F0B2E9E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5F0B2E9E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5F0B2E9E" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5F0B2E9E" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0B2E9E" Ref="C48"  Part="1" 
F 0 "C48" H 3459 7196 50  0000 R CNN
F 1 "100nF" H 3459 7105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3550 7150 50  0001 C CNN
F 3 "~" H 3550 7150 50  0001 C CNN
	1    3550 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0B2EA4
P 3550 7050
AR Path="/5F0B2EA4" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5F0B2EA4" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5F0B2EA4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5F0B2EA4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5F0B2EA4" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5F0B2EA4" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0B2EA4" Ref="#PWR0225"  Part="1" 
F 0 "#PWR0225" H 3550 6900 50  0001 C CNN
F 1 "+5V" H 3565 7223 50  0000 C CNN
F 2 "" H 3550 7050 50  0001 C CNN
F 3 "" H 3550 7050 50  0001 C CNN
	1    3550 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0B2EAA
P 3550 7250
AR Path="/5F0B2EAA" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5F0B2EAA" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5F0B2EAA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5F0B2EAA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5F0B2EAA" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5F0B2EAA" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F0B2EAA" Ref="#PWR0226"  Part="1" 
F 0 "#PWR0226" H 3550 7000 50  0001 C CNN
F 1 "GND" H 3555 7077 50  0000 C CNN
F 2 "" H 3550 7250 50  0001 C CNN
F 3 "" H 3550 7250 50  0001 C CNN
	1    3550 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:ICS501 U?
U 2 1 5F0B2EB0
P 3900 7150
AR Path="/5DF75CDE/5F0B2EB0" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5EF12B5A/5F0B2EB0" Ref="U46"  Part="2" 
F 0 "U46" H 4080 7196 50  0000 L CNN
F 1 "ICS501" H 4080 7105 50  0000 L CNN
F 2 "alexios:SOIC-8" H 3850 7300 50  0001 C CNN
F 3 "https://uk.mouser.com/datasheet/2/698/IDT__DST_20170331-1711217.pdf" H 3850 7300 50  0001 C CNN
	2    3900 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4500 4800 4500
Connection ~ 4500 2050
Wire Wire Line
	7350 4500 7800 4500
Wire Wire Line
	8700 3100 7800 3100
Wire Wire Line
	7800 1650 7800 3100
Connection ~ 7800 3100
Wire Wire Line
	7800 3100 7800 4500
Wire Wire Line
	4500 1850 4500 2050
Connection ~ 4500 3100
Wire Wire Line
	4500 3100 4500 4500
Wire Wire Line
	4500 2050 4500 3100
Text Notes 5050 3400 0    50   ~ 0
To select the quadruppled clock source, install R5 or R7.\nThey should be either 0Ω shunts or small terminating\nresistors to match the impedance of the 16 MHz clock.\n\nFor reference, the x4CLK trace is around 49mm long\nand rise/fall times can be as short as 1 ns.
Text Notes 5050 2850 0    63   ~ 13
Option Selection & Impedance Matching
Wire Notes Line width 20 style solid
	7400 3550 4950 3550
Wire Notes Line width 20 style solid
	4950 3550 4950 2650
Wire Notes Line width 20 style solid
	4950 2650 7400 2650
Wire Notes Line width 20 style solid
	7400 2650 7400 3550
Text Notes 800  2300 0    50   ~ 0
The inverters are used as delays and are purposefully HC family\nto produce decent propagation delay. Each pair of inverters\ndelays the clock signal by about 14 ns. An optional resistor\nchanges the slew rate and can change the delay a little bit. 0Ω\nshunts to be fitted initially.\n\nThis implements edge detection: the output of each chain is\nnormally low, and presents short positive strobes on the rising\nand falling CLK2 and CLK4 edges. (plus 74AC86 propagation\ndelay) This multiplies each clock rate by two.\n\nBoth edge-detected CLK2 and CLK4 are combined to form a\nquadruppled clock rate, since CLK2 and CLK4 are 180° apart.\nR5 can be used to change the slew rate to slightly change the\nsignal's phase (and duty cycle, but the SRU doesn't care about\nthat).
Text Notes 800  900  0    63   ~ 13
Gate Tree Option
Wire Notes Line width 20 style solid
	700  700  3550 700 
Wire Notes Line width 20 style solid
	3550 700  3550 2400
Wire Notes Line width 20 style solid
	3550 2400 700  2400
Wire Notes Line width 20 style solid
	700  2400 700  700 
$Comp
L alexios:74AC86 U?
U 4 1 5F19409C
P 2950 6450
AR Path="/5CE09726/5F19409C" Ref="U?"  Part="3" 
AR Path="/6A313729/5F19409C" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D0A147D/5F19409C" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D396E91/5F19409C" Ref="U?"  Part="4" 
AR Path="/5DF75CDE/5F19409C" Ref="U?"  Part="4" 
AR Path="/5DF75CDE/5EF12B5A/5F19409C" Ref="U12"  Part="4" 
F 0 "U12" H 2975 6725 50  0000 C CNN
F 1 "74AC86" H 2975 6634 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2475 6050 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 2475 6050 50  0001 C CNN
	4    2950 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6400 2650 6400
Wire Wire Line
	2650 6400 2650 6500
Wire Wire Line
	2700 6500 2650 6500
NoConn ~ 3250 6450
$Comp
L power:+5V #PWR?
U 1 1 5F1940A6
P 2650 6400
AR Path="/5DC89E19/5D396E91/5F1940A6" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5F1940A6" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5F1940A6" Ref="#PWR0227"  Part="1" 
F 0 "#PWR0227" H 2650 6250 50  0001 C CNN
F 1 "+5V" H 2665 6573 50  0000 C CNN
F 2 "" H 2650 6400 50  0001 C CNN
F 3 "" H 2650 6400 50  0001 C CNN
	1    2650 6400
	1    0    0    -1  
$EndComp
Connection ~ 2650 6400
Text Notes 8350 1350 0    50   ~ 0
CLK2
Wire Notes Line width 10 style solid
	8600 1250 8650 1250
Wire Notes Line width 10 style solid
	8650 1250 8650 1350
Wire Notes Line width 10 style solid
	8650 1350 8750 1350
Wire Notes Line width 10 style solid
	8750 1250 8750 1350
Wire Notes Line width 10 style solid
	8750 1250 9050 1250
Wire Notes Line width 10 style solid
	9050 1250 9050 1350
Wire Notes Line width 10 style solid
	9050 1350 9150 1350
Wire Notes Line width 10 style solid
	9150 1250 9150 1350
Wire Notes Line width 10 style solid
	9150 1250 9450 1250
Wire Notes Line width 10 style solid
	9450 1250 9450 1350
Wire Notes Line width 10 style solid
	9450 1350 9550 1350
Wire Notes Line width 10 style solid
	9550 1250 9550 1350
Wire Notes Line width 10 style solid
	9550 1250 9800 1250
Text Notes 8350 1500 0    50   ~ 0
CLK4
Wire Notes Line width 10 style solid
	8850 1400 8850 1500
Wire Notes Line width 10 style solid
	8850 1500 8950 1500
Wire Notes Line width 10 style solid
	8950 1400 8950 1500
Wire Notes Line width 10 style solid
	8950 1400 9250 1400
Wire Notes Line width 10 style solid
	9250 1400 9250 1500
Wire Notes Line width 10 style solid
	9250 1500 9350 1500
Wire Notes Line width 10 style solid
	9350 1400 9350 1500
Wire Notes Line width 10 style solid
	9350 1400 9650 1400
Wire Notes Line width 10 style solid
	9650 1400 9650 1500
Wire Notes Line width 10 style solid
	9650 1500 9750 1500
Wire Notes Line width 10 style solid
	9750 1400 9750 1500
Wire Notes Line width 10 style solid
	9750 1400 9800 1400
Text Notes 9900 1350 0    50   ~ 0
4 MHz, 90° clock
Text Notes 9900 1500 0    50   ~ 0
4 MHz, 270° clock
Text Notes 8350 1650 0    50   ~ 0
U12A
Wire Notes Line width 10 style solid
	8660 1550 8660 1650
Wire Notes Line width 10 style solid
	8660 1550 8680 1550
Wire Notes Line width 10 style solid
	8680 1550 8680 1650
Wire Notes Line width 10 style solid
	8680 1650 8760 1650
Wire Notes Line width 10 style solid
	8760 1550 8760 1650
Wire Notes Line width 10 style solid
	8760 1550 8780 1550
Wire Notes Line width 10 style solid
	8780 1550 8780 1650
Wire Notes Line width 10 style solid
	8780 1650 9060 1650
Wire Notes Line width 10 style solid
	9060 1550 9060 1650
Wire Notes Line width 10 style solid
	9060 1550 9080 1550
Wire Notes Line width 10 style solid
	9080 1550 9080 1650
Wire Notes Line width 10 style solid
	9080 1650 9160 1650
Wire Notes Line width 10 style solid
	9160 1550 9160 1650
Wire Notes Line width 10 style solid
	9160 1550 9180 1550
Wire Notes Line width 10 style solid
	9180 1550 9180 1650
Wire Notes Line width 10 style solid
	9180 1650 9460 1650
Wire Notes Line width 10 style solid
	9460 1550 9460 1650
Wire Notes Line width 10 style solid
	9460 1550 9480 1550
Wire Notes Line width 10 style solid
	9480 1550 9480 1650
Wire Notes Line width 10 style solid
	9480 1650 9560 1650
Wire Notes Line width 10 style solid
	9560 1550 9560 1650
Wire Notes Line width 10 style solid
	9560 1550 9580 1550
Wire Notes Line width 10 style solid
	9580 1550 9580 1650
Wire Notes Line width 10 style solid
	9580 1650 9800 1650
Wire Notes Line width 10 style solid
	8860 1700 8860 1800
Wire Notes Line width 10 style solid
	8860 1700 8880 1700
Wire Notes Line width 10 style solid
	8880 1700 8880 1800
Wire Notes Line width 10 style solid
	8960 1700 8960 1800
Wire Notes Line width 10 style solid
	8960 1700 8980 1700
Wire Notes Line width 10 style solid
	8980 1700 8980 1800
Wire Notes Line width 10 style solid
	8980 1800 9260 1800
Wire Notes Line width 10 style solid
	9260 1700 9260 1800
Wire Notes Line width 10 style solid
	9260 1700 9280 1700
Wire Notes Line width 10 style solid
	9280 1700 9280 1800
Wire Notes Line width 10 style solid
	9280 1800 9360 1800
Wire Notes Line width 10 style solid
	9360 1700 9360 1800
Wire Notes Line width 10 style solid
	9360 1700 9380 1700
Wire Notes Line width 10 style solid
	9380 1700 9380 1800
Wire Notes Line width 10 style solid
	9380 1800 9660 1800
Wire Notes Line width 10 style solid
	9660 1700 9660 1800
Wire Notes Line width 10 style solid
	9660 1700 9680 1700
Wire Notes Line width 10 style solid
	9680 1700 9680 1800
Wire Notes Line width 10 style solid
	9680 1800 9760 1800
Wire Notes Line width 10 style solid
	9760 1700 9760 1800
Wire Notes Line width 10 style solid
	9760 1700 9780 1700
Wire Notes Line width 10 style solid
	9780 1700 9780 1800
Wire Notes Line width 10 style solid
	9780 1800 9800 1800
Text Notes 8350 1950 0    50   ~ 0
U12C
Wire Notes Line width 10 style solid
	8670 1850 8670 1950
Wire Notes Line width 10 style solid
	8670 1850 8690 1850
Wire Notes Line width 10 style solid
	8690 1850 8690 1950
Wire Notes Line width 10 style solid
	8690 1950 8770 1950
Wire Notes Line width 10 style solid
	8770 1850 8770 1950
Wire Notes Line width 10 style solid
	8770 1850 8790 1850
Wire Notes Line width 10 style solid
	8790 1850 8790 1950
Wire Notes Line width 10 style solid
	9070 1850 9070 1950
Wire Notes Line width 10 style solid
	9070 1850 9090 1850
Wire Notes Line width 10 style solid
	9090 1850 9090 1950
Wire Notes Line width 10 style solid
	9090 1950 9170 1950
Wire Notes Line width 10 style solid
	9170 1850 9170 1950
Wire Notes Line width 10 style solid
	9170 1850 9190 1850
Wire Notes Line width 10 style solid
	9190 1850 9190 1950
Wire Notes Line width 10 style solid
	9470 1850 9470 1950
Wire Notes Line width 10 style solid
	9470 1850 9490 1850
Wire Notes Line width 10 style solid
	9490 1850 9490 1950
Wire Notes Line width 10 style solid
	9490 1950 9570 1950
Wire Notes Line width 10 style solid
	9570 1850 9570 1950
Wire Notes Line width 10 style solid
	9570 1850 9590 1850
Wire Notes Line width 10 style solid
	9590 1850 9590 1950
Wire Notes Line width 10 style solid
	8870 1850 8870 1950
Wire Notes Line width 10 style solid
	8870 1850 8890 1850
Wire Notes Line width 10 style solid
	8890 1850 8890 1950
Wire Notes Line width 10 style solid
	8890 1950 8970 1950
Wire Notes Line width 10 style solid
	8970 1850 8970 1950
Wire Notes Line width 10 style solid
	8970 1850 8990 1850
Wire Notes Line width 10 style solid
	8990 1850 8990 1950
Wire Notes Line width 10 style solid
	9270 1850 9270 1950
Wire Notes Line width 10 style solid
	9270 1850 9290 1850
Wire Notes Line width 10 style solid
	9290 1850 9290 1950
Wire Notes Line width 10 style solid
	9290 1950 9370 1950
Wire Notes Line width 10 style solid
	9370 1850 9370 1950
Wire Notes Line width 10 style solid
	9370 1850 9390 1850
Wire Notes Line width 10 style solid
	9390 1850 9390 1950
Wire Notes Line width 10 style solid
	9670 1850 9670 1950
Wire Notes Line width 10 style solid
	9670 1850 9690 1850
Wire Notes Line width 10 style solid
	9690 1850 9690 1950
Wire Notes Line width 10 style solid
	9690 1950 9770 1950
Wire Notes Line width 10 style solid
	9770 1850 9770 1950
Wire Notes Line width 10 style solid
	9770 1850 9790 1850
Wire Notes Line width 10 style solid
	9790 1850 9790 1950
Wire Notes Line width 10 style solid
	8880 1800 8960 1800
Wire Notes Line width 10 style solid
	8790 1950 8870 1950
Wire Notes Line width 10 style solid
	8990 1950 9070 1950
Wire Notes Line width 10 style solid
	9190 1950 9270 1950
Wire Notes Line width 10 style solid
	9390 1950 9470 1950
Wire Notes Line width 10 style solid
	9590 1950 9670 1950
Wire Notes Line width 10 style solid
	9790 1950 9800 1950
Wire Notes Line width 10 style solid
	8600 1400 8850 1400
Text Notes 8350 1800 0    50   ~ 0
U12B
Wire Notes Line width 10 style solid
	8600 1650 8660 1650
Wire Notes Line width 10 style solid
	8600 1800 8860 1800
Wire Notes Line width 10 style solid
	8600 1950 8670 1950
Wire Notes Line
	8750 1350 8760 1550
Wire Notes Line
	8650 1350 8660 1550
Wire Notes Line
	8950 1500 8960 1700
Wire Notes Line
	8850 1500 8860 1700
Wire Notes Line
	8760 1650 8770 1850
Wire Notes Line
	8660 1650 8670 1850
Wire Notes Line
	8960 1695 8970 1895
Wire Notes Line
	8860 1695 8870 1895
Text Notes 9900 1650 0    50   ~ 0
8 MHz edge strobes
Text Notes 9900 1800 0    50   ~ 0
8 MHz edge strobes
Text Notes 9900 1950 0    50   ~ 0
16 MHz edge strobes
Wire Notes Line width 20 style solid
	8250 1100 10850 1100
Wire Notes Line width 20 style solid
	10850 1100 10850 2100
Wire Notes Line width 20 style solid
	10850 2100 8250 2100
Wire Notes Line width 20 style solid
	8250 2100 8250 1100
Wire Notes Line
	7250 1750 7250 2600
Wire Notes Line
	7250 3600 7250 4250
Text Notes 6200 4000 0    50   ~ 0
Bridge JP6 if U21\nis not needed.
Wire Notes Line
	6150 3750 6150 4800
Wire Notes Line
	6150 4800 7050 4800
Wire Notes Line
	7050 4800 7050 3750
Wire Notes Line
	7050 3750 6150 3750
Wire Notes Line
	4050 800  4050 2350
Wire Notes Line
	4050 2350 8000 2350
Wire Notes Line
	8000 2350 8000 800 
Wire Notes Line
	8000 800  4050 800 
Wire Notes Line
	8000 5450 8000 2450
Wire Notes Line
	8000 2450 4050 2450
Wire Notes Line
	4050 2450 4050 5450
Wire Notes Line
	4050 5450 8000 5450
Wire Notes Line width 20 style solid
	1250 5450 1250 3950
Wire Notes Line width 20 style solid
	3850 5450 1250 5450
Wire Notes Line width 20 style solid
	3850 3950 3850 5450
Wire Notes Line width 20 style solid
	1250 3950 3850 3950
Text Notes 1350 4150 0    63   ~ 13
PLL Option
Text Notes 1350 5300 0    50   ~ 0
An ICS501 cheap PLL-based clock multiplier IC can be used\ninstead of the delay line/XOR tree. It has the advantage of\nbeing much more reliable at clock generation, with less\njitter and less calibration needed.\n\nU21 is an optional inverter. Testing shows this may be\nneeded to shift the clock output phase by 180° (plus\npropagation delay, of course). If not installed, pins\n2 and 4 need to be bridged.\n\nTo disable the PLL, JP2 can be bridged. This tri-states\nthe clock output for testing. This only works if U21 is\nnot installed.
Text Notes 9950 4000 0    50   ~ 0
4 MHz, 270° clock
Wire Notes Line width 10 style solid
	9800 4050 9850 4050
Wire Notes Line width 10 style solid
	8650 4150 8700 4150
Wire Notes Line width 10 style solid
	8650 4050 8650 4150
Wire Notes Line width 10 style solid
	9800 4050 9800 4150
Wire Notes Line width 10 style solid
	9750 4150 9800 4150
Wire Notes Line width 10 style solid
	9750 4050 9750 4150
Wire Notes Line width 10 style solid
	9700 4050 9750 4050
Wire Notes Line width 10 style solid
	9700 4050 9700 4150
Wire Notes Line width 10 style solid
	9650 4150 9700 4150
Wire Notes Line width 10 style solid
	9650 4050 9650 4150
Wire Notes Line width 10 style solid
	9600 4050 9650 4050
Wire Notes Line width 10 style solid
	9600 4050 9600 4150
Wire Notes Line width 10 style solid
	9550 4150 9600 4150
Wire Notes Line width 10 style solid
	9550 4050 9550 4150
Wire Notes Line width 10 style solid
	9500 4050 9550 4050
Wire Notes Line width 10 style solid
	9500 4050 9500 4150
Wire Notes Line width 10 style solid
	9450 4150 9500 4150
Wire Notes Line width 10 style solid
	9450 4050 9450 4150
Wire Notes Line width 10 style solid
	9400 4050 9450 4050
Wire Notes Line width 10 style solid
	9400 4050 9400 4150
Wire Notes Line width 10 style solid
	9350 4150 9400 4150
Wire Notes Line width 10 style solid
	9350 4050 9350 4150
Wire Notes Line width 10 style solid
	9300 4050 9350 4050
Wire Notes Line width 10 style solid
	9300 4050 9300 4150
Wire Notes Line width 10 style solid
	9250 4150 9300 4150
Wire Notes Line width 10 style solid
	9250 4050 9250 4150
Wire Notes Line width 10 style solid
	9200 4050 9250 4050
Wire Notes Line width 10 style solid
	9200 4050 9200 4150
Wire Notes Line width 10 style solid
	9150 4150 9200 4150
Wire Notes Line width 10 style solid
	9150 4050 9150 4150
Wire Notes Line width 10 style solid
	9100 4050 9150 4050
Wire Notes Line width 10 style solid
	9100 4050 9100 4150
Wire Notes Line width 10 style solid
	9050 4150 9100 4150
Wire Notes Line width 10 style solid
	9050 4050 9050 4150
Wire Notes Line width 10 style solid
	9000 4050 9050 4050
Wire Notes Line width 10 style solid
	9000 4050 9000 4150
Wire Notes Line width 10 style solid
	8950 4150 9000 4150
Wire Notes Line width 10 style solid
	8950 4050 8950 4150
Wire Notes Line width 10 style solid
	8900 4050 8950 4050
Wire Notes Line width 10 style solid
	8900 4050 8900 4150
Wire Notes Line width 10 style solid
	8850 4150 8900 4150
Wire Notes Line width 10 style solid
	8850 4050 8850 4150
Wire Notes Line width 10 style solid
	8800 4050 8850 4050
Wire Notes Line width 20 style solid
	8300 4300 8300 3750
Wire Notes Line width 20 style solid
	10900 4300 8300 4300
Wire Notes Line width 20 style solid
	10900 3750 10900 4300
Wire Notes Line width 20 style solid
	8300 3750 10900 3750
Text Notes 9950 4150 0    50   ~ 0
16 MHZ PLL-synced
Wire Notes Line width 10 style solid
	8650 3900 8900 3900
Wire Notes Line width 10 style solid
	8800 4050 8800 4150
Wire Notes Line width 10 style solid
	8750 4150 8800 4150
Wire Notes Line width 10 style solid
	8750 4050 8750 4150
Wire Notes Line width 10 style solid
	8700 4050 8750 4050
Wire Notes Line width 10 style solid
	8700 4050 8700 4150
Text Notes 8400 4150 0    50   ~ 0
U46
Wire Notes Line width 10 style solid
	9800 3900 9850 3900
Wire Notes Line width 10 style solid
	9800 3900 9800 4000
Wire Notes Line width 10 style solid
	9700 4000 9800 4000
Wire Notes Line width 10 style solid
	9700 3900 9700 4000
Wire Notes Line width 10 style solid
	9400 3900 9700 3900
Wire Notes Line width 10 style solid
	9400 3900 9400 4000
Wire Notes Line width 10 style solid
	9300 4000 9400 4000
Wire Notes Line width 10 style solid
	9300 3900 9300 4000
Wire Notes Line width 10 style solid
	9000 3900 9300 3900
Wire Notes Line width 10 style solid
	9000 3900 9000 4000
Wire Notes Line width 10 style solid
	8900 4000 9000 4000
Wire Notes Line width 10 style solid
	8900 3900 8900 4000
Text Notes 8400 4000 0    50   ~ 0
CLK4
Wire Wire Line
	6250 4500 6250 4650
Wire Wire Line
	6250 4650 6400 4650
Connection ~ 6250 4500
Wire Wire Line
	6700 4650 6950 4650
Wire Wire Line
	6950 4650 6950 4500
Connection ~ 6950 4500
Wire Wire Line
	6950 4500 7150 4500
Wire Wire Line
	6250 4350 6300 4350
Wire Wire Line
	6800 4350 6950 4350
Wire Wire Line
	6950 4350 6950 4500
Wire Wire Line
	6250 4350 6250 4500
$Comp
L Jumper:SolderJumper_2_Bridged JP6
U 1 1 5F834555
P 6550 4650
F 0 "JP6" H 6550 4763 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 6550 4764 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6550 4650 50  0001 C CNN
F 3 "~" H 6550 4650 50  0001 C CNN
	1    6550 4650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
