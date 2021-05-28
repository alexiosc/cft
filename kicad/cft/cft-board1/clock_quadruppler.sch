EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 20 20
Title "16 MHz Shifter Clock"
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
AR Path="/5DF75CDE/5EF12B5A/5EF439D5" Ref="R702"  Part="1" 
F 0 "R702" V 7054 1650 50  0000 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF439DB" Ref="R703"  Part="1" 
F 0 "R703" V 5604 1850 50  0000 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF439E5" Ref="R701"  Part="1" 
F 0 "R701" V 5604 1400 50  0000 C CNN
F 1 "0Ω" V 5695 1400 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5800 1400 50  0001 C CNN
F 3 "~" H 5800 1400 50  0001 C CNN
	1    5800 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 1900 6550 1700
$Comp
L alexios:74AC86 U?
U 1 1 5EF439FE
P 6200 1450
AR Path="/5CE09726/5EF439FE" Ref="U?"  Part="1" 
AR Path="/6A313729/5EF439FE" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EF439FE" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EF439FE" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5EF439FE" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF439FE" Ref="U702"  Part="1" 
F 0 "U702" H 6225 1725 50  0000 C CNN
F 1 "74AC86" H 6225 1634 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5725 1050 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF43A04" Ref="U702"  Part="2" 
F 0 "U702" H 6225 2175 50  0000 C CNN
F 1 "74AC86" H 6225 2084 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5725 1500 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 5725 1500 50  0001 C CNN
	2    6200 1900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC86 U?
U 3 1 5EF43A0B
P 6800 1650
AR Path="/5CE09726/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/6A313729/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D0A147D/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D396E91/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/5DF75CDE/5EF43A0B" Ref="U?"  Part="3" 
AR Path="/5DF75CDE/5EF12B5A/5EF43A0B" Ref="U702"  Part="3" 
F 0 "U702" H 6825 1832 50  0000 C CNN
F 1 "74AC86" H 6825 1923 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 6325 1250 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF43A11" Ref="U701"  Part="4" 
F 0 "U701" H 5400 2000 50  0000 C CNN
F 1 "74HC04" H 5375 2026 50  0001 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5300 2050 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF43A17" Ref="U701"  Part="3" 
F 0 "U701" H 4900 2000 50  0000 C CNN
F 1 "74HC04" H 4825 2026 50  0001 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 4750 2050 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF43A1D" Ref="U701"  Part="2" 
F 0 "U701" H 5375 1667 50  0000 C CNN
F 1 "74HC04" H 5375 1576 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5300 1600 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF43A23" Ref="U701"  Part="1" 
F 0 "U701" H 4825 1667 50  0000 C CNN
F 1 "74HC04" H 4825 1576 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 4750 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4750 1600 50  0001 C CNN
	1    4750 1400
	1    0    0    -1  
$EndComp
Text Notes 10050 2700 0    50   ~ 0
16 MHz clock
Wire Wire Line
	4500 2050 5650 2050
Wire Wire Line
	4500 1850 4550 1850
Wire Wire Line
	4500 1400 4550 1400
Wire Wire Line
	4500 1600 5650 1600
Text HLabel 3950 2050 0    50   Input ~ 0
CLK4
Text HLabel 3950 1500 0    50   Input ~ 0
CLK2
Wire Wire Line
	6550 1450 6550 1600
Wire Wire Line
	6500 1450 6550 1450
Wire Wire Line
	5650 1500 5950 1500
Wire Wire Line
	5650 1950 5950 1950
Wire Wire Line
	6500 1900 6550 1900
Wire Wire Line
	3950 2050 4500 2050
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
AR Path="/5DF75CDE/5EF12B5A/5EF51032" Ref="#PWR0703"  Part="1" 
F 0 "#PWR0703" H 1050 6250 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF51039" Ref="U701"  Part="6" 
F 0 "U701" H 1375 6717 50  0000 C CNN
F 1 "74HC04" H 1375 6626 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 1300 6450 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF5103F" Ref="U701"  Part="5" 
F 0 "U701" H 2125 6717 50  0000 C CNN
F 1 "74HC04" H 2125 6626 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 2050 6450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2050 6450 50  0001 C CNN
	5    2050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF51045
P 1850 6450
AR Path="/5DF75CDE/5EF51045" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF51045" Ref="#PWR0705"  Part="1" 
F 0 "#PWR0705" H 1850 6200 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF9EB32" Ref="#PWR0710"  Part="1" 
F 0 "#PWR0710" H 1050 7000 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EF9EB38" Ref="#PWR0706"  Part="1" 
F 0 "#PWR0706" H 1050 6900 50  0001 C CNN
F 1 "+5V" H 1065 7223 50  0000 C CNN
F 2 "" H 1050 7050 50  0001 C CNN
F 3 "" H 1050 7050 50  0001 C CNN
	1    1050 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EF9EB3E
P 2300 7150
AR Path="/5CC0D65F/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5EF76914/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/6A313729/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF9EB3E" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EF9EB3E" Ref="C701"  Part="1" 
F 0 "C701" H 2209 7196 50  0000 R CNN
F 1 "100nF" H 2209 7105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7150 50  0001 C CNN
F 3 "~" H 2300 7150 50  0001 C CNN
	1    2300 7150
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
AR Path="/5DF75CDE/5EF12B5A/5EF9EB46" Ref="U702"  Part="5" 
F 0 "U702" H 1580 6996 50  0000 L CNN
F 1 "74AC86" H 1580 6905 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 925 6650 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 925 6650 50  0001 C CNN
	5    1400 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EFB3368
P 1050 7150
AR Path="/5CC0D65F/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5EF76914/5EFB3368" Ref="C?"  Part="1" 
AR Path="/6A313729/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EFB3368" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/5EFB3368" Ref="C702"  Part="1" 
F 0 "C702" H 959 7196 50  0000 R CNN
F 1 "100nF" H 959 7105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1050 7150 50  0001 C CNN
F 3 "~" H 1050 7150 50  0001 C CNN
	1    1050 7150
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
AR Path="/5DF75CDE/5EF12B5A/5EFB336E" Ref="#PWR0711"  Part="1" 
F 0 "#PWR0711" H 2300 7000 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EFB3374" Ref="#PWR0707"  Part="1" 
F 0 "#PWR0707" H 2300 6900 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5EFB337C" Ref="U701"  Part="7" 
F 0 "U701" H 2830 6996 50  0000 L CNN
F 1 "74HC04" H 2830 6905 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 2650 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2650 7250 50  0001 C CNN
	7    2650 7050
	1    0    0    -1  
$EndComp
Text HLabel 10050 2800 2    50   Output ~ 0
x4CLK
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
AR Path="/5DF75CDE/5EF12B5A/5F0B2E9E" Ref="C703"  Part="1" 
F 0 "C703" H 3459 7196 50  0000 R CNN
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
AR Path="/5DF75CDE/5EF12B5A/5F0B2EA4" Ref="#PWR0708"  Part="1" 
F 0 "#PWR0708" H 3550 6900 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5F0B2EAA" Ref="#PWR0712"  Part="1" 
F 0 "#PWR0712" H 3550 7000 50  0001 C CNN
F 1 "GND" H 3555 7077 50  0000 C CNN
F 2 "" H 3550 7250 50  0001 C CNN
F 3 "" H 3550 7250 50  0001 C CNN
	1    3550 7250
	1    0    0    -1  
$EndComp
Connection ~ 4500 2050
Wire Wire Line
	4500 1850 4500 2050
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
AR Path="/5DF75CDE/5EF12B5A/5F19409C" Ref="U702"  Part="4" 
F 0 "U702" H 2975 6725 50  0000 C CNN
F 1 "74AC86" H 2975 6634 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 2475 6050 50  0001 C CNN
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
AR Path="/5DF75CDE/5EF12B5A/5F1940A6" Ref="#PWR0704"  Part="1" 
F 0 "#PWR0704" H 2650 6250 50  0001 C CNN
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
	4050 800  4050 2350
Wire Notes Line
	4050 2350 8000 2350
Wire Notes Line
	8000 2350 8000 800 
Wire Notes Line
	8000 800  4050 800 
Wire Notes Line
	8000 2450 4050 2450
Wire Notes Line
	4050 5700 8000 5700
Wire Notes Line
	4050 2450 4050 5700
Wire Notes Line
	8000 5700 8000 2450
$Comp
L alexios:CXO_DIP8 X701
U 1 1 60A9A739
P 5350 4400
F 0 "X701" H 5450 4767 50  0000 C CNN
F 1 "CXO_DIP8" H 5450 4676 50  0000 C CNN
F 2 "alexios:Oscillator_DIP-8-socket" H 5500 4000 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 5450 4350 50  0001 C CNN
	1    5350 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0150
U 1 1 60AB727D
P 5000 4200
F 0 "#PWR0150" H 5000 4050 50  0001 C CNN
F 1 "+5V" H 5015 4373 50  0000 C CNN
F 2 "" H 5000 4200 50  0001 C CNN
F 3 "" H 5000 4200 50  0001 C CNN
	1    5000 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4200 5000 4300
Wire Wire Line
	5000 4300 5050 4300
$Comp
L power:GND #PWR0151
U 1 1 60AC2902
P 5000 4650
F 0 "#PWR0151" H 5000 4400 50  0001 C CNN
F 1 "GND" H 5005 4477 50  0000 C CNN
F 2 "" H 5000 4650 50  0001 C CNN
F 3 "" H 5000 4650 50  0001 C CNN
	1    5000 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4600 5000 4600
Wire Wire Line
	5000 4600 5000 4650
$Comp
L Device:C_Small C?
U 1 1 60ACF0CA
P 5000 4450
AR Path="/5CC0D65F/60ACF0CA" Ref="C?"  Part="1" 
AR Path="/60ACF0CA" Ref="C?"  Part="1" 
AR Path="/5EF76914/60ACF0CA" Ref="C?"  Part="1" 
AR Path="/6A313729/60ACF0CA" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/60ACF0CA" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/60ACF0CA" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/60ACF0CA" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/60ACF0CA" Ref="C705"  Part="1" 
F 0 "C705" H 4909 4496 50  0000 R CNN
F 1 "100nF" H 4909 4405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 4450 50  0001 C CNN
F 3 "~" H 5000 4450 50  0001 C CNN
	1    5000 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4300 5000 4350
Connection ~ 5000 4300
Wire Wire Line
	5000 4550 5000 4600
Connection ~ 5000 4600
Text HLabel 3900 5400 0    50   Input ~ 0
16MHz
Wire Wire Line
	7800 1650 7800 2800
$Comp
L alexios:74AC14 U703
U 1 1 60BE5DA8
P 8700 2800
F 0 "U703" H 8775 3067 50  0000 C CNN
F 1 "74AC14" H 8775 2976 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 8700 3000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 8700 3000 50  0001 C CNN
	1    8700 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60C1E5B2
P 6100 4450
AR Path="/5DF75CDE/60C1E5B2" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/60C1E5B2" Ref="R706"  Part="1" 
F 0 "R706" V 5904 4450 50  0000 C CNN
F 1 "30Ω" V 5995 4450 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6100 4450 50  0001 C CNN
F 3 "~" H 6100 4450 50  0001 C CNN
	1    6100 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60C1F111
P 6100 5400
AR Path="/5DF75CDE/60C1F111" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/60C1F111" Ref="R707"  Part="1" 
F 0 "R707" V 5904 5400 50  0000 C CNN
F 1 "0Ω" V 5995 5400 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6100 5400 50  0001 C CNN
F 3 "~" H 6100 5400 50  0001 C CNN
	1    6100 5400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60C4E68A
P 9250 2800
AR Path="/5DF75CDE/60C4E68A" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/60C4E68A" Ref="R704"  Part="1" 
F 0 "R704" V 9054 2800 50  0000 C CNN
F 1 "0Ω" V 9145 2800 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9250 2800 50  0001 C CNN
F 3 "~" H 9250 2800 50  0001 C CNN
	1    9250 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 2800 9150 2800
Wire Wire Line
	9350 2800 9550 2800
Wire Wire Line
	9550 2850 9550 2800
Connection ~ 9550 2800
Wire Wire Line
	9550 2800 10050 2800
$Comp
L Device:C_Small C?
U 1 1 60D1CF11
P 9550 2950
AR Path="/5CC0D65F/60D1CF11" Ref="C?"  Part="1" 
AR Path="/60D1CF11" Ref="C?"  Part="1" 
AR Path="/5EF76914/60D1CF11" Ref="C?"  Part="1" 
AR Path="/6A313729/60D1CF11" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/60D1CF11" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/60D1CF11" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/60D1CF11" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/60D1CF11" Ref="C704"  Part="1" 
F 0 "C704" H 9459 2996 50  0000 R CNN
F 1 "120pF" H 9459 2905 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2950 50  0001 C CNN
F 3 "~" H 9550 2950 50  0001 C CNN
	1    9550 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60D33432
P 9550 3200
AR Path="/5DF75CDE/60D33432" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/60D33432" Ref="R705"  Part="1" 
F 0 "R705" H 9491 3154 50  0000 R CNN
F 1 "100Ω" H 9491 3245 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3200 50  0001 C CNN
F 3 "~" H 9550 3200 50  0001 C CNN
	1    9550 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	9550 3050 9550 3100
$Comp
L power:GND #PWR0152
U 1 1 60D52B17
P 9550 3350
F 0 "#PWR0152" H 9550 3100 50  0001 C CNN
F 1 "GND" H 9555 3177 50  0000 C CNN
F 2 "" H 9550 3350 50  0001 C CNN
F 3 "" H 9550 3350 50  0001 C CNN
	1    9550 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3300 9550 3350
Wire Wire Line
	8500 2800 7800 2800
Connection ~ 7800 2800
$Comp
L alexios:74AC14 U703
U 2 1 60D96029
P 5000 5400
F 0 "U703" H 5075 5667 50  0000 C CNN
F 1 "74AC14" H 5075 5576 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5000 5600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5000 5600 50  0001 C CNN
	2    5000 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5400 4800 5400
$Comp
L alexios:74AC14 U703
U 3 1 60DA248C
P 5550 5400
F 0 "U703" H 5625 5667 50  0000 C CNN
F 1 "74AC14" H 5625 5576 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5550 5600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5550 5600 50  0001 C CNN
	3    5550 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5400 6000 5400
Wire Wire Line
	6000 4450 5850 4450
$Comp
L Jumper:SolderJumper_2_Open JP702
U 1 1 60E0323D
P 7550 4450
F 0 "JP702" H 7550 4563 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 7550 4226 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 7550 4450 50  0001 C CNN
F 3 "~" H 7550 4450 50  0001 C CNN
	1    7550 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4450 7400 4450
Wire Wire Line
	7700 4450 7800 4450
Wire Wire Line
	7800 2800 7800 4450
Connection ~ 7800 4450
Wire Wire Line
	7800 4450 7800 5400
$Comp
L Jumper:SolderJumper_2_Open JP703
U 1 1 60E18F75
P 7600 5400
F 0 "JP703" H 7600 5513 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 7600 5176 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 7600 5400 50  0001 C CNN
F 3 "~" H 7600 5400 50  0001 C CNN
	1    7600 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5400 7450 5400
Wire Wire Line
	7750 5400 7800 5400
$Comp
L Jumper:SolderJumper_2_Open JP701
U 1 1 60E396FB
P 7550 1650
F 0 "JP701" H 7550 1763 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 7550 1426 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 7550 1650 50  0001 C CNN
F 3 "~" H 7550 1650 50  0001 C CNN
	1    7550 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1650 7400 1650
Wire Wire Line
	7700 1650 7800 1650
$Comp
L alexios:74AC14 U703
U 4 1 60E8A8B7
P 4900 6400
F 0 "U703" H 4975 6667 50  0000 C CNN
F 1 "74AC14" H 4975 6576 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 4900 6600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 6600 50  0001 C CNN
	4    4900 6400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC14 U703
U 5 1 60E8A8BD
P 4900 6850
F 0 "U703" H 4975 7117 50  0000 C CNN
F 1 "74AC14" H 4975 7026 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 4900 7050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 7050 50  0001 C CNN
	5    4900 6850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC14 U703
U 6 1 60E95074
P 4900 7300
F 0 "U703" H 4975 7567 50  0000 C CNN
F 1 "74AC14" H 4975 7476 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 4900 7500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 7500 50  0001 C CNN
	6    4900 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC14 U703
U 7 1 60E95A8F
P 3900 7050
F 0 "U703" H 3975 7317 50  0000 C CNN
F 1 "74AC14" H 3975 7226 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 3900 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3900 7250 50  0001 C CNN
	7    3900 7050
	1    0    0    -1  
$EndComp
Connection ~ 3550 7050
Connection ~ 3550 7250
$Comp
L power:+5V #PWR0153
U 1 1 60ED3748
P 4650 6350
F 0 "#PWR0153" H 4650 6200 50  0001 C CNN
F 1 "+5V" H 4665 6523 50  0000 C CNN
F 2 "" H 4650 6350 50  0001 C CNN
F 3 "" H 4650 6350 50  0001 C CNN
	1    4650 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 6350 4650 6400
Wire Wire Line
	4650 6400 4700 6400
$Comp
L power:+5V #PWR0154
U 1 1 60EE0E14
P 4650 6800
F 0 "#PWR0154" H 4650 6650 50  0001 C CNN
F 1 "+5V" H 4665 6973 50  0000 C CNN
F 2 "" H 4650 6800 50  0001 C CNN
F 3 "" H 4650 6800 50  0001 C CNN
	1    4650 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 6800 4650 6850
Wire Wire Line
	4650 6850 4700 6850
$Comp
L power:+5V #PWR0155
U 1 1 60EEB4C4
P 4650 7250
F 0 "#PWR0155" H 4650 7100 50  0001 C CNN
F 1 "+5V" H 4665 7423 50  0000 C CNN
F 2 "" H 4650 7250 50  0001 C CNN
F 3 "" H 4650 7250 50  0001 C CNN
	1    4650 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 7250 4650 7300
Wire Wire Line
	4650 7300 4700 7300
NoConn ~ 5250 6400
NoConn ~ 5250 6850
NoConn ~ 5250 7300
Text Notes 9150 2500 0    50   ~ 0
0Ω, 30Ω or 100Ω as required\nfor signal integrity.
Text Notes 9700 3000 0    50   ~ 0
Termination is optional.
$Comp
L power:+5V #PWR0156
U 1 1 6122CF3D
P 5900 4200
F 0 "#PWR0156" H 5900 4050 50  0001 C CNN
F 1 "+5V" H 5915 4373 50  0000 C CNN
F 2 "" H 5900 4200 50  0001 C CNN
F 3 "" H 5900 4200 50  0001 C CNN
	1    5900 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4300 5900 4300
Wire Wire Line
	5900 4300 5900 4200
$EndSCHEMATC
