EESchema Schematic File Version 4
LIBS:cft-front-panel-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5350 1000 1000 700 
U 5CC37D0C
F0 "sheet5CC37D06" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 1150 50 
F3 "LOAD" I L 5350 1350 50 
F4 "~LTSON" I L 5350 1550 50 
$EndSheet
$Sheet
S 5350 2050 1000 700 
U 5CC382A2
F0 "sheet5CC3829A" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 2200 50 
F3 "LOAD" I L 5350 2400 50 
F4 "~LTSON" I L 5350 2600 50 
$EndSheet
$Sheet
S 5350 3100 1000 700 
U 5CC382AC
F0 "sheet5CC3829C" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 3250 50 
F3 "LOAD" I L 5350 3450 50 
F4 "~LTSON" I L 5350 3650 50 
$EndSheet
$Sheet
S 5350 4150 1000 700 
U 5CC38618
F0 "sheet5CC38612" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 4300 50 
F3 "LOAD" I L 5350 4500 50 
F4 "~LTSON" I L 5350 4700 50 
$EndSheet
Entry Bus Bus
	4550 600  4650 700 
Entry Bus Bus
	4650 1050 4750 1150
Wire Bus Line
	4750 1150 5350 1150
Wire Wire Line
	5250 5700 5350 5700
Wire Wire Line
	5350 2600 5250 2600
Connection ~ 5250 2600
Wire Wire Line
	5250 2600 5250 3650
Wire Wire Line
	5350 3650 5250 3650
Connection ~ 5250 3650
Wire Wire Line
	5250 3650 5250 4700
Wire Wire Line
	5350 4700 5250 4700
Connection ~ 5250 4700
Wire Wire Line
	5250 4700 5250 5700
Wire Wire Line
	5350 1550 5250 1550
Wire Wire Line
	5250 1550 5250 2600
Entry Bus Bus
	4650 2100 4750 2200
Wire Bus Line
	4750 2200 5350 2200
Entry Bus Bus
	4650 3150 4750 3250
Wire Bus Line
	4750 3250 5350 3250
Entry Bus Bus
	4650 4200 4750 4300
Wire Bus Line
	4750 4300 5350 4300
Entry Bus Bus
	4650 5200 4750 5300
Wire Bus Line
	4750 5300 5350 5300
$Sheet
S 5350 5150 1000 700 
U 5CC02B94
F0 "Half Row" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 5300 50 
F3 "LOAD" I L 5350 5500 50 
F4 "~LTSON" I L 5350 5700 50 
$EndSheet
Text Label 4650 1800 1    50   ~ 0
D[0..15]
Wire Wire Line
	5350 2400 4850 2400
Wire Wire Line
	5350 3450 4850 3450
Wire Wire Line
	5350 4500 4850 4500
Wire Wire Line
	4850 1350 5350 1350
Connection ~ 5250 5700
Text Label 4850 5500 0    50   ~ 0
ROW-E
Text Label 4850 4500 0    50   ~ 0
ROW-D
Text Label 4850 5700 0    50   ~ 0
~LTSON
Text Label 4850 3450 0    50   ~ 0
ROW-C
Text Label 4850 2400 0    50   ~ 0
ROW-B
$Comp
L alexios:74HC138 U3
U 1 1 5CC738EE
P 9950 1400
F 0 "U3" H 9950 2067 50  0000 C CNN
F 1 "74HC138" H 9950 1976 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 9950 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 9950 1400 50  0001 C CNN
	1    9950 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5CC763A5
P 9500 3200
F 0 "J1" H 9580 3242 50  0000 L CNN
F 1 "Switch 0" H 9580 3151 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9500 3200 50  0001 C CNN
F 3 "~" H 9500 3200 50  0001 C CNN
	1    9500 3200
	1    0    0    -1  
$EndComp
Text Label 10700 1100 2    50   ~ 0
~SW1
Text Label 10700 1200 2    50   ~ 0
~SW2
Text Label 10700 1300 2    50   ~ 0
~SW3
Text Label 10700 1400 2    50   ~ 0
~SW4
Text Label 10700 1500 2    50   ~ 0
~SW5
Text Label 10700 1600 2    50   ~ 0
~SW6
Text Label 10700 1700 2    50   ~ 0
~SW7
Text Label 9050 3200 0    50   ~ 0
~SW0
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5CC7CDFE
P 9500 3600
F 0 "J2" H 9580 3642 50  0000 L CNN
F 1 "Switch 1" H 9580 3551 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9500 3600 50  0001 C CNN
F 3 "~" H 9500 3600 50  0001 C CNN
	1    9500 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5CC7D1AD
P 9500 4000
F 0 "J3" H 9580 4042 50  0000 L CNN
F 1 "Switch 2" H 9580 3951 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9500 4000 50  0001 C CNN
F 3 "~" H 9500 4000 50  0001 C CNN
	1    9500 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5CC7D359
P 9500 4400
F 0 "J4" H 9580 4442 50  0000 L CNN
F 1 "Switch 3" H 9580 4351 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9500 4400 50  0001 C CNN
F 3 "~" H 9500 4400 50  0001 C CNN
	1    9500 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5CC8006E
P 9500 4800
F 0 "J5" H 9580 4842 50  0000 L CNN
F 1 "Switch 4" H 9580 4751 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9500 4800 50  0001 C CNN
F 3 "~" H 9500 4800 50  0001 C CNN
	1    9500 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 5CC80074
P 9500 5200
F 0 "J6" H 9580 5242 50  0000 L CNN
F 1 "Switch 5" H 9580 5151 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9500 5200 50  0001 C CNN
F 3 "~" H 9500 5200 50  0001 C CNN
	1    9500 5200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 5CC8007A
P 9500 5600
F 0 "J7" H 9580 5642 50  0000 L CNN
F 1 "Switch 6" H 9580 5551 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9500 5600 50  0001 C CNN
F 3 "~" H 9500 5600 50  0001 C CNN
	1    9500 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 5CC80080
P 9500 6000
F 0 "J8" H 9580 6042 50  0000 L CNN
F 1 "Switch 7" H 9580 5951 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9500 6000 50  0001 C CNN
F 3 "~" H 9500 6000 50  0001 C CNN
	1    9500 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 1300 10700 1300
Wire Wire Line
	10450 1400 10700 1400
Wire Wire Line
	10450 1200 10700 1200
Wire Wire Line
	10450 1100 10700 1100
Wire Wire Line
	10450 1000 10700 1000
Wire Wire Line
	10450 1500 10700 1500
Wire Wire Line
	10450 1600 10700 1600
Wire Wire Line
	10450 1700 10700 1700
Wire Wire Line
	9300 3100 9050 3100
Wire Wire Line
	9050 3300 9300 3300
Wire Wire Line
	9450 1000 9150 1000
Wire Wire Line
	9450 1100 9150 1100
Wire Wire Line
	9450 1200 9150 1200
$Comp
L power:GND #PWR025
U 1 1 5CCAF5E9
P 9450 1800
F 0 "#PWR025" H 9450 1550 50  0001 C CNN
F 1 "GND" H 9455 1627 50  0000 C CNN
F 2 "" H 9450 1800 50  0001 C CNN
F 3 "" H 9450 1800 50  0001 C CNN
	1    9450 1800
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP1A1
U 1 1 5CE22D32
P 950 1300
F 0 "JP1A1" V 950 1367 50  0000 L CNN
F 1 "Jumper_3_Bridged12" V 995 1367 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 950 1300 50  0001 C CNN
F 3 "~" H 950 1300 50  0001 C CNN
	1    950  1300
	0    -1   1    0   
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP1B1
U 1 1 5CE2348D
P 950 1800
F 0 "JP1B1" V 950 1867 50  0000 L CNN
F 1 "Jumper_3_Bridged12" V 995 1867 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 950 1800 50  0001 C CNN
F 3 "~" H 950 1800 50  0001 C CNN
	1    950  1800
	0    -1   1    0   
$EndComp
$Comp
L alexios:74HC138 U1
U 1 1 5CE5C1E8
P 2200 1300
F 0 "U1" H 2200 1967 50  0000 C CNN
F 1 "74HC138" H 2200 1876 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2200 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2200 1300 50  0001 C CNN
	1    2200 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5CE5D3F3
P 950 1050
F 0 "#PWR03" H 950 900 50  0001 C CNN
F 1 "+5V" H 965 1223 50  0000 C CNN
F 2 "" H 950 1050 50  0001 C CNN
F 3 "" H 950 1050 50  0001 C CNN
	1    950  1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1550 550  1550
Connection ~ 950  1550
Text Label 550  1550 0    50   ~ 0
ROW3
$Comp
L power:GND #PWR04
U 1 1 5CE765E6
P 950 2050
F 0 "#PWR04" H 950 1800 50  0001 C CNN
F 1 "GND" H 955 1877 50  0000 C CNN
F 2 "" H 950 2050 50  0001 C CNN
F 3 "" H 950 2050 50  0001 C CNN
	1    950  2050
	1    0    0    -1  
$EndComp
Text Label 1150 1300 0    50   ~ 0
SEL
Text Label 1150 1800 0    50   ~ 0
~SEL
$Comp
L power:GND #PWR011
U 1 1 5CEA6DD9
P 1700 1700
F 0 "#PWR011" H 1700 1450 50  0001 C CNN
F 1 "GND" H 1705 1527 50  0000 C CNN
F 2 "" H 1700 1700 50  0001 C CNN
F 3 "" H 1700 1700 50  0001 C CNN
	1    1700 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 900  1400 900 
Wire Wire Line
	1700 1000 1400 1000
Wire Wire Line
	1700 1100 1400 1100
Text Label 1400 900  0    50   ~ 0
ROW0
Text Label 1400 1000 0    50   ~ 0
ROW1
Text Label 1400 1100 0    50   ~ 0
ROW2
Wire Wire Line
	1100 1300 1350 1300
Wire Wire Line
	1350 1300 1350 1500
Wire Wire Line
	1350 1500 1700 1500
Wire Wire Line
	1350 1800 1350 1600
Wire Wire Line
	1350 1600 1700 1600
Wire Wire Line
	1100 1800 1350 1800
Text Label 1400 1500 0    50   ~ 0
SEL
Text Label 1400 1600 0    50   ~ 0
~SEL
$Comp
L alexios:74HC04 U2
U 1 1 5CF7E748
P 3500 900
F 0 "U2" H 3500 1217 50  0000 C CNN
F 1 "74HC04" H 3500 1126 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3500 900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3500 900 50  0001 C CNN
	1    3500 900 
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U2
U 4 1 5CF7E74E
P 3500 1950
F 0 "U2" H 3600 2100 50  0000 C CNN
F 1 "74HC04" H 3500 2176 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3500 1950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3500 1950 50  0001 C CNN
	4    3500 1950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U2
U 2 1 5CF7E754
P 3500 1250
F 0 "U2" H 3600 1400 50  0000 C CNN
F 1 "74HC04" H 3650 1400 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3500 1250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3500 1250 50  0001 C CNN
	2    3500 1250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U2
U 5 1 5CF7E75A
P 3500 2300
F 0 "U2" H 3600 2450 50  0000 C CNN
F 1 "74HC04" H 3500 2526 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3500 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3500 2300 50  0001 C CNN
	5    3500 2300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U2
U 3 1 5CF7E760
P 3500 1600
F 0 "U2" H 3600 1750 50  0000 C CNN
F 1 "74HC04" H 3500 1826 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3500 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3500 1600 50  0001 C CNN
	3    3500 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1950 3200 1950
Wire Wire Line
	3000 1600 3200 1600
Wire Wire Line
	3100 1250 3200 1250
Wire Wire Line
	2700 900  3200 900 
Wire Wire Line
	3100 1000 3100 1250
Wire Wire Line
	2700 1000 3100 1000
Wire Wire Line
	3000 1100 3000 1600
Wire Wire Line
	2700 1100 3000 1100
Wire Wire Line
	2900 1200 2900 1950
Wire Wire Line
	2700 1200 2900 1200
Wire Wire Line
	2800 1300 2800 2300
Wire Wire Line
	2800 2300 3200 2300
Wire Wire Line
	2700 1300 2800 1300
NoConn ~ 2700 1400
NoConn ~ 2700 1500
NoConn ~ 2700 1600
Wire Wire Line
	3800 900  4300 900 
Text Label 4300 900  2    50   ~ 0
ROW-A
Wire Wire Line
	3800 1250 4300 1250
Text Label 4300 1250 2    50   ~ 0
ROW-B
Wire Wire Line
	3800 1600 4300 1600
Wire Wire Line
	3800 1950 4300 1950
Wire Wire Line
	3800 2300 4300 2300
Text Label 4300 1600 2    50   ~ 0
ROW-C
Text Label 4300 1950 2    50   ~ 0
ROW-D
Text Label 4300 2300 2    50   ~ 0
ROW-E
Text Label 4850 1350 0    50   ~ 0
ROW-A
Text Label 4300 600  2    50   ~ 0
COL[0..15]
Entry Bus Bus
	6600 600  6700 700 
Entry Bus Bus
	6700 1050 6800 1150
Entry Bus Bus
	6700 2100 6800 2200
Entry Bus Bus
	6700 3150 6800 3250
Entry Bus Bus
	6700 4200 6800 4300
Entry Bus Bus
	6700 5200 6800 5300
Text Label 6700 1800 1    50   ~ 0
D[0..15]
$Comp
L alexios:74HC138 U1
U 2 1 5D1F5B46
P 2250 3300
F 0 "U1" H 2430 3346 50  0000 L CNN
F 1 "74HC138" H 2430 3255 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2250 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2250 3300 50  0001 C CNN
	2    2250 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5D1F63F8
P 1900 3300
AR Path="/5D1F63F8" Ref="C2"  Part="1" 
AR Path="/5CC02B94/5D1F63F8" Ref="C?"  Part="1" 
AR Path="/5CC377D5/5D1F63F8" Ref="C?"  Part="1" 
AR Path="/5CC37D0C/5D1F63F8" Ref="C?"  Part="1" 
AR Path="/5CC37D11/5D1F63F8" Ref="C?"  Part="1" 
AR Path="/5CC382A2/5D1F63F8" Ref="C?"  Part="1" 
AR Path="/5CC382A7/5D1F63F8" Ref="C?"  Part="1" 
AR Path="/5CC382AC/5D1F63F8" Ref="C?"  Part="1" 
AR Path="/5CC382B1/5D1F63F8" Ref="C?"  Part="1" 
AR Path="/5CC38618/5D1F63F8" Ref="C?"  Part="1" 
AR Path="/5CC3861D/5D1F63F8" Ref="C?"  Part="1" 
F 0 "C2" H 1809 3346 50  0000 R CNN
F 1 "100nF" H 1809 3255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1900 3300 50  0001 C CNN
F 3 "~" H 1900 3300 50  0001 C CNN
	1    1900 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5D1F72DD
P 1900 3400
F 0 "#PWR015" H 1900 3150 50  0001 C CNN
F 1 "GND" H 1905 3227 50  0000 C CNN
F 2 "" H 1900 3400 50  0001 C CNN
F 3 "" H 1900 3400 50  0001 C CNN
	1    1900 3400
	1    0    0    -1  
$EndComp
Connection ~ 1900 3400
$Comp
L power:+5V #PWR014
U 1 1 5D1F7FB5
P 1900 3200
F 0 "#PWR014" H 1900 3050 50  0001 C CNN
F 1 "+5V" H 1915 3373 50  0000 C CNN
F 2 "" H 1900 3200 50  0001 C CNN
F 3 "" H 1900 3200 50  0001 C CNN
	1    1900 3200
	1    0    0    -1  
$EndComp
Connection ~ 1900 3200
$Comp
L power:GND #PWR018
U 1 1 5D21E338
P 3200 2650
F 0 "#PWR018" H 3200 2400 50  0001 C CNN
F 1 "GND" H 3205 2477 50  0000 C CNN
F 2 "" H 3200 2650 50  0001 C CNN
F 3 "" H 3200 2650 50  0001 C CNN
	1    3200 2650
	1    0    0    -1  
$EndComp
NoConn ~ 3800 2650
$Comp
L alexios:74HC04 U2
U 6 1 5D22FE3E
P 3500 2650
F 0 "U2" H 3600 2500 50  0000 C CNN
F 1 "74HC04" H 3600 2400 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3500 2650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3500 2650 50  0001 C CNN
	6    3500 2650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U2
U 7 1 5D255CE4
P 3550 3000
F 0 "U2" H 3730 2746 50  0000 L CNN
F 1 "74HC04" H 3730 2655 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3550 3000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3550 3000 50  0001 C CNN
	7    3550 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5D255CEA
P 3200 3300
AR Path="/5D255CEA" Ref="C3"  Part="1" 
AR Path="/5CC02B94/5D255CEA" Ref="C?"  Part="1" 
AR Path="/5CC377D5/5D255CEA" Ref="C?"  Part="1" 
AR Path="/5CC37D0C/5D255CEA" Ref="C?"  Part="1" 
AR Path="/5CC37D11/5D255CEA" Ref="C?"  Part="1" 
AR Path="/5CC382A2/5D255CEA" Ref="C?"  Part="1" 
AR Path="/5CC382A7/5D255CEA" Ref="C?"  Part="1" 
AR Path="/5CC382AC/5D255CEA" Ref="C?"  Part="1" 
AR Path="/5CC382B1/5D255CEA" Ref="C?"  Part="1" 
AR Path="/5CC38618/5D255CEA" Ref="C?"  Part="1" 
AR Path="/5CC3861D/5D255CEA" Ref="C?"  Part="1" 
F 0 "C3" H 3109 3254 50  0000 R CNN
F 1 "100nF" H 3109 3345 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3200 3300 50  0001 C CNN
F 3 "~" H 3200 3300 50  0001 C CNN
	1    3200 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 5D255CF0
P 3200 3200
F 0 "#PWR021" H 3200 3050 50  0001 C CNN
F 1 "+5V" H 3215 3373 50  0000 C CNN
F 2 "" H 3200 3200 50  0001 C CNN
F 3 "" H 3200 3200 50  0001 C CNN
	1    3200 3200
	1    0    0    -1  
$EndComp
Connection ~ 3200 3200
$Comp
L power:GND #PWR022
U 1 1 5D255CF7
P 3200 3400
F 0 "#PWR022" H 3200 3150 50  0001 C CNN
F 1 "GND" H 3205 3227 50  0000 C CNN
F 2 "" H 3200 3400 50  0001 C CNN
F 3 "" H 3200 3400 50  0001 C CNN
	1    3200 3400
	1    0    0    -1  
$EndComp
Connection ~ 3200 3400
$Comp
L alexios:74HC138 U3
U 2 1 5D335BA2
P 9800 2450
F 0 "U3" H 9980 2496 50  0000 L CNN
F 1 "74HC138" H 9980 2405 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 9800 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 9800 2450 50  0001 C CNN
	2    9800 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5D335BA8
P 9450 2450
AR Path="/5D335BA8" Ref="C4"  Part="1" 
AR Path="/5CC02B94/5D335BA8" Ref="C?"  Part="1" 
AR Path="/5CC377D5/5D335BA8" Ref="C?"  Part="1" 
AR Path="/5CC37D0C/5D335BA8" Ref="C?"  Part="1" 
AR Path="/5CC37D11/5D335BA8" Ref="C?"  Part="1" 
AR Path="/5CC382A2/5D335BA8" Ref="C?"  Part="1" 
AR Path="/5CC382A7/5D335BA8" Ref="C?"  Part="1" 
AR Path="/5CC382AC/5D335BA8" Ref="C?"  Part="1" 
AR Path="/5CC382B1/5D335BA8" Ref="C?"  Part="1" 
AR Path="/5CC38618/5D335BA8" Ref="C?"  Part="1" 
AR Path="/5CC3861D/5D335BA8" Ref="C?"  Part="1" 
F 0 "C4" H 9359 2496 50  0000 R CNN
F 1 "100nF" H 9359 2405 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9450 2450 50  0001 C CNN
F 3 "~" H 9450 2450 50  0001 C CNN
	1    9450 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5D335BAE
P 9450 2550
F 0 "#PWR027" H 9450 2300 50  0001 C CNN
F 1 "GND" H 9455 2377 50  0000 C CNN
F 2 "" H 9450 2550 50  0001 C CNN
F 3 "" H 9450 2550 50  0001 C CNN
	1    9450 2550
	1    0    0    -1  
$EndComp
Connection ~ 9450 2550
$Comp
L power:+5V #PWR026
U 1 1 5D335BB5
P 9450 2350
F 0 "#PWR026" H 9450 2200 50  0001 C CNN
F 1 "+5V" H 9465 2523 50  0000 C CNN
F 2 "" H 9450 2350 50  0001 C CNN
F 3 "" H 9450 2350 50  0001 C CNN
	1    9450 2350
	1    0    0    -1  
$EndComp
Connection ~ 9450 2350
Text Label 9150 1000 0    50   ~ 0
SWA0
Text Label 9150 1100 0    50   ~ 0
SWA1
Text Label 9150 1200 0    50   ~ 0
SWA2
Text Label 10700 1000 2    50   ~ 0
~SW0
Wire Wire Line
	9300 3200 9050 3200
Text Label 9050 3100 0    50   ~ 0
SWD0
Text Label 9050 3300 0    50   ~ 0
SWD1
Text Label 9050 3600 0    50   ~ 0
~SW1
Wire Wire Line
	9300 3500 9050 3500
Wire Wire Line
	9050 3700 9300 3700
Wire Wire Line
	9300 3600 9050 3600
Text Label 9050 3500 0    50   ~ 0
SWD0
Text Label 9050 3700 0    50   ~ 0
SWD1
Text Label 9050 4000 0    50   ~ 0
~SW2
Wire Wire Line
	9300 3900 9050 3900
Wire Wire Line
	9050 4100 9300 4100
Wire Wire Line
	9300 4000 9050 4000
Text Label 9050 3900 0    50   ~ 0
SWD0
Text Label 9050 4100 0    50   ~ 0
SWD1
Text Label 9050 4400 0    50   ~ 0
~SW3
Wire Wire Line
	9300 4300 9050 4300
Wire Wire Line
	9050 4500 9300 4500
Wire Wire Line
	9300 4400 9050 4400
Text Label 9050 4300 0    50   ~ 0
SWD0
Text Label 9050 4500 0    50   ~ 0
SWD1
Text Label 9050 4800 0    50   ~ 0
~SW4
Wire Wire Line
	9300 4700 9050 4700
Wire Wire Line
	9050 4900 9300 4900
Wire Wire Line
	9300 4800 9050 4800
Text Label 9050 4700 0    50   ~ 0
SWD0
Text Label 9050 4900 0    50   ~ 0
SWD1
Text Label 9050 5200 0    50   ~ 0
~SW5
Wire Wire Line
	9300 5100 9050 5100
Wire Wire Line
	9050 5300 9300 5300
Wire Wire Line
	9300 5200 9050 5200
Text Label 9050 5100 0    50   ~ 0
SWD0
Text Label 9050 5300 0    50   ~ 0
SWD1
Text Label 9050 5600 0    50   ~ 0
~SW6
Wire Wire Line
	9300 5500 9050 5500
Wire Wire Line
	9050 5700 9300 5700
Wire Wire Line
	9300 5600 9050 5600
Text Label 9050 5500 0    50   ~ 0
SWD0
Text Label 9050 5700 0    50   ~ 0
SWD1
Text Label 9050 6000 0    50   ~ 0
~SW7
Wire Wire Line
	9300 5900 9050 5900
Wire Wire Line
	9050 6100 9300 6100
Wire Wire Line
	9300 6000 9050 6000
Text Label 9050 5900 0    50   ~ 0
SWD0
Text Label 9050 6100 0    50   ~ 0
SWD1
Wire Wire Line
	4850 5700 5250 5700
Wire Wire Line
	5350 5500 4850 5500
Text Label 3000 6500 0    50   ~ 0
ROW0
Text Label 4000 6500 2    50   ~ 0
ROW1
Text Label 3000 6600 0    50   ~ 0
ROW2
Text Label 4000 6000 2    50   ~ 0
COL15
Text Label 3000 6000 0    50   ~ 0
COL14
Text Label 4000 5900 2    50   ~ 0
COL13
Text Label 3000 5900 0    50   ~ 0
COL12
Text Label 4000 5800 2    50   ~ 0
COL11
Text Label 3000 5800 0    50   ~ 0
COL10
Text Label 4000 5700 2    50   ~ 0
COL9
Text Label 3000 5700 0    50   ~ 0
COL8
Text Label 4000 6400 2    50   ~ 0
COL7
Text Label 3000 6400 0    50   ~ 0
COL6
Text Label 4000 6300 2    50   ~ 0
COL5
Text Label 3000 6300 0    50   ~ 0
COL4
Text Label 3000 6200 0    50   ~ 0
COL2
Text Label 3000 6100 0    50   ~ 0
COL0
$Comp
L power:+5V #PWR019
U 1 1 5D7EFFEE
P 3200 5500
F 0 "#PWR019" H 3200 5350 50  0001 C CNN
F 1 "+5V" H 3215 5673 50  0000 C CNN
F 2 "" H 3200 5500 50  0001 C CNN
F 3 "" H 3200 5500 50  0001 C CNN
	1    3200 5500
	1    0    0    -1  
$EndComp
Connection ~ 3200 5500
Wire Wire Line
	3250 7100 3000 7100
Wire Wire Line
	3250 6900 3000 6900
Wire Wire Line
	3250 6800 3000 6800
Wire Wire Line
	3250 6600 3000 6600
Wire Wire Line
	3250 6500 3000 6500
Wire Wire Line
	3250 6000 3000 6000
Wire Wire Line
	3250 5900 3000 5900
Wire Wire Line
	3250 5800 3000 5800
Wire Wire Line
	3250 5700 3000 5700
Wire Wire Line
	3250 6400 3000 6400
Wire Wire Line
	3250 6300 3000 6300
Wire Wire Line
	3250 6200 3000 6200
Wire Wire Line
	3250 6100 3000 6100
Wire Wire Line
	3250 5500 3200 5500
Wire Wire Line
	4000 6200 3750 6200
Wire Wire Line
	4000 6300 3750 6300
Wire Wire Line
	4000 6400 3750 6400
Wire Wire Line
	4000 5700 3750 5700
Wire Wire Line
	4000 5800 3750 5800
Wire Wire Line
	4000 5900 3750 5900
Wire Wire Line
	4000 6000 3750 6000
Wire Wire Line
	4000 6500 3750 6500
Wire Wire Line
	4000 6700 3750 6700
Wire Wire Line
	4000 6800 3750 6800
Wire Wire Line
	4000 7000 3750 7000
Wire Wire Line
	3750 6100 4000 6100
Text Label 4000 6200 2    50   ~ 0
COL3
Text Label 4000 6100 2    50   ~ 0
COL1
$Comp
L Connector_Generic:Conn_02x20_Odd_Even CON2
U 1 1 5D7EFFC9
P 3450 6400
F 0 "CON2" H 3500 7425 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 3500 7426 50  0001 C CNN
F 2 "Connector_Multicomp:Multicomp_MC9A12-4034_2x20_P2.54mm_Vertical" H 3450 6400 50  0001 C CNN
F 3 "~" H 3450 6400 50  0001 C CNN
	1    3450 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 5D7EFFC3
P 3800 5500
F 0 "#PWR023" H 3800 5350 50  0001 C CNN
F 1 "+5V" H 3815 5673 50  0000 C CNN
F 2 "" H 3800 5500 50  0001 C CNN
F 3 "" H 3800 5500 50  0001 C CNN
	1    3800 5500
	1    0    0    -1  
$EndComp
Connection ~ 3800 5500
Wire Wire Line
	3750 5500 3800 5500
Text Label 4000 6700 2    50   ~ 0
~LTSON
Text Label 3000 6800 0    50   ~ 0
SWA0
Text Label 4000 6800 2    50   ~ 0
SWA1
Text Label 3000 6900 0    50   ~ 0
SWA2
Text Label 4000 7000 2    50   ~ 0
SWD2
Text Label 3000 7100 0    50   ~ 0
SWD3
Wire Wire Line
	3750 6600 4000 6600
Text Label 4000 6600 2    50   ~ 0
ROW3
$Comp
L power:GND #PWR020
U 1 1 5D7EFFB1
P 3200 7400
F 0 "#PWR020" H 3200 7150 50  0001 C CNN
F 1 "GND" H 3205 7227 50  0000 C CNN
F 2 "" H 3200 7400 50  0001 C CNN
F 3 "" H 3200 7400 50  0001 C CNN
	1    3200 7400
	1    0    0    -1  
$EndComp
Connection ~ 3200 7400
Wire Wire Line
	3250 7300 3200 7300
Wire Wire Line
	3200 7300 3200 7400
Wire Wire Line
	3250 7400 3200 7400
$Comp
L power:GND #PWR024
U 1 1 5D7EFFA7
P 3800 7400
F 0 "#PWR024" H 3800 7150 50  0001 C CNN
F 1 "GND" H 3805 7227 50  0000 C CNN
F 2 "" H 3800 7400 50  0001 C CNN
F 3 "" H 3800 7400 50  0001 C CNN
	1    3800 7400
	-1   0    0    -1  
$EndComp
Connection ~ 3800 7400
Wire Wire Line
	3750 7300 3800 7300
Wire Wire Line
	3800 7300 3800 7400
Wire Wire Line
	3750 7400 3800 7400
Wire Wire Line
	3250 5600 3200 5600
Wire Wire Line
	3200 5600 3200 5500
Wire Wire Line
	3800 5600 3800 5500
Wire Wire Line
	3750 5600 3800 5600
Wire Wire Line
	3750 7100 4000 7100
Text Label 4000 7100 2    50   ~ 0
SWD0
Wire Wire Line
	3250 7200 3000 7200
Text Label 3000 7200 0    50   ~ 0
SWD1
Text Label 700  6500 0    50   ~ 0
ROW0
Text Label 1700 6500 2    50   ~ 0
ROW1
Text Label 700  6600 0    50   ~ 0
ROW2
Text Label 1700 6400 2    50   ~ 0
COL15
Text Label 700  6400 0    50   ~ 0
COL14
Text Label 1700 6300 2    50   ~ 0
COL13
Text Label 700  6300 0    50   ~ 0
COL12
Text Label 1700 6200 2    50   ~ 0
COL11
Text Label 700  6200 0    50   ~ 0
COL10
Text Label 1700 6100 2    50   ~ 0
COL9
Text Label 700  6100 0    50   ~ 0
COL8
Text Label 1700 6000 2    50   ~ 0
COL7
Text Label 700  6000 0    50   ~ 0
COL6
Text Label 1700 5900 2    50   ~ 0
COL5
Text Label 700  5900 0    50   ~ 0
COL4
Text Label 700  5800 0    50   ~ 0
COL2
Text Label 700  5700 0    50   ~ 0
COL0
$Comp
L power:+5V #PWR01
U 1 1 5D7586E9
P 900 5500
F 0 "#PWR01" H 900 5350 50  0001 C CNN
F 1 "+5V" H 915 5673 50  0000 C CNN
F 2 "" H 900 5500 50  0001 C CNN
F 3 "" H 900 5500 50  0001 C CNN
	1    900  5500
	1    0    0    -1  
$EndComp
Connection ~ 900  5500
Wire Wire Line
	950  7100 700  7100
Wire Wire Line
	950  6900 700  6900
Wire Wire Line
	950  6800 700  6800
Wire Wire Line
	950  6600 700  6600
Wire Wire Line
	950  6500 700  6500
Wire Wire Line
	950  6400 700  6400
Wire Wire Line
	950  6300 700  6300
Wire Wire Line
	950  6200 700  6200
Wire Wire Line
	950  6100 700  6100
Wire Wire Line
	950  6000 700  6000
Wire Wire Line
	950  5900 700  5900
Wire Wire Line
	950  5800 700  5800
Wire Wire Line
	950  5700 700  5700
Wire Wire Line
	950  5500 900  5500
Wire Wire Line
	1700 5800 1450 5800
Wire Wire Line
	1700 5900 1450 5900
Wire Wire Line
	1700 6000 1450 6000
Wire Wire Line
	1700 6100 1450 6100
Wire Wire Line
	1700 6200 1450 6200
Wire Wire Line
	1700 6300 1450 6300
Wire Wire Line
	1700 6400 1450 6400
Wire Wire Line
	1700 6500 1450 6500
Wire Wire Line
	1700 6700 1450 6700
Wire Wire Line
	1700 6800 1450 6800
Wire Wire Line
	1700 7000 1450 7000
Wire Wire Line
	1450 5700 1700 5700
Text Label 1700 5800 2    50   ~ 0
COL3
Text Label 1700 5700 2    50   ~ 0
COL1
$Comp
L Connector_Generic:Conn_02x20_Odd_Even CON1
U 1 1 5D75870D
P 1150 6400
F 0 "CON1" H 1200 7425 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 1200 7426 50  0001 C CNN
F 2 "Connector_Multicomp:Multicomp_MC9A12-4034_2x20_P2.54mm_Vertical" H 1150 6400 50  0001 C CNN
F 3 "~" H 1150 6400 50  0001 C CNN
	1    1150 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 5D758713
P 1500 5500
F 0 "#PWR09" H 1500 5350 50  0001 C CNN
F 1 "+5V" H 1515 5673 50  0000 C CNN
F 2 "" H 1500 5500 50  0001 C CNN
F 3 "" H 1500 5500 50  0001 C CNN
	1    1500 5500
	1    0    0    -1  
$EndComp
Connection ~ 1500 5500
Wire Wire Line
	1450 5500 1500 5500
Text Label 1700 6700 2    50   ~ 0
~LTSON
Text Label 700  6800 0    50   ~ 0
SWA0
Text Label 1700 6800 2    50   ~ 0
SWA1
Text Label 700  6900 0    50   ~ 0
SWA2
Text Label 1700 7000 2    50   ~ 0
SWD0
Text Label 700  7100 0    50   ~ 0
SWD1
Wire Wire Line
	1450 6600 1700 6600
Text Label 1700 6600 2    50   ~ 0
ROW3
$Comp
L power:GND #PWR02
U 1 1 5D758724
P 900 7400
F 0 "#PWR02" H 900 7150 50  0001 C CNN
F 1 "GND" H 905 7227 50  0000 C CNN
F 2 "" H 900 7400 50  0001 C CNN
F 3 "" H 900 7400 50  0001 C CNN
	1    900  7400
	1    0    0    -1  
$EndComp
Connection ~ 900  7400
Wire Wire Line
	950  7300 900  7300
Wire Wire Line
	900  7300 900  7400
Wire Wire Line
	950  7400 900  7400
$Comp
L power:GND #PWR010
U 1 1 5D75872E
P 1500 7400
F 0 "#PWR010" H 1500 7150 50  0001 C CNN
F 1 "GND" H 1505 7227 50  0000 C CNN
F 2 "" H 1500 7400 50  0001 C CNN
F 3 "" H 1500 7400 50  0001 C CNN
	1    1500 7400
	-1   0    0    -1  
$EndComp
Connection ~ 1500 7400
Wire Wire Line
	1450 7300 1500 7300
Wire Wire Line
	1500 7300 1500 7400
Wire Wire Line
	1450 7400 1500 7400
Wire Wire Line
	950  5600 900  5600
Wire Wire Line
	900  5600 900  5500
Wire Wire Line
	1500 5600 1500 5500
Wire Wire Line
	1450 5600 1500 5600
Text Label 1700 7200 2    50   ~ 0
POWER
Wire Wire Line
	1450 7200 1700 7200
Wire Wire Line
	1450 7100 1700 7100
Text Label 1700 7100 2    50   ~ 0
SWD2
Wire Wire Line
	950  7200 700  7200
Text Label 700  7200 0    50   ~ 0
SWD3
Text Notes 700  5250 0    50   ~ 0
From Controller/Previous Module
Text Notes 3200 5250 0    50   ~ 0
To Next Module
Wire Wire Line
	1700 6900 1450 6900
Text Label 1700 6900 2    50   ~ 0
SWA3
Wire Wire Line
	4000 6900 3750 6900
Text Label 4000 6900 2    50   ~ 0
SWA3
$Comp
L Jumper:Jumper_3_Bridged12 JP2A1
U 1 1 5DBC1466
P 950 2850
F 0 "JP2A1" V 950 2917 50  0000 L CNN
F 1 "Jumper_3_Bridged12" V 995 2917 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 950 2850 50  0001 C CNN
F 3 "~" H 950 2850 50  0001 C CNN
	1    950  2850
	0    -1   1    0   
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP2B1
U 1 1 5DBC146C
P 950 3350
F 0 "JP2B1" V 950 3417 50  0000 L CNN
F 1 "Jumper_3_Bridged12" V 995 3417 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 950 3350 50  0001 C CNN
F 3 "~" H 950 3350 50  0001 C CNN
	1    950  3350
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5DBC1472
P 950 2600
F 0 "#PWR05" H 950 2450 50  0001 C CNN
F 1 "+5V" H 965 2773 50  0000 C CNN
F 2 "" H 950 2600 50  0001 C CNN
F 3 "" H 950 2600 50  0001 C CNN
	1    950  2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3100 550  3100
Connection ~ 950  3100
Text Label 550  3100 0    50   ~ 0
SWA3
$Comp
L power:GND #PWR06
U 1 1 5DBC147B
P 950 3600
F 0 "#PWR06" H 950 3350 50  0001 C CNN
F 1 "GND" H 955 3427 50  0000 C CNN
F 2 "" H 950 3600 50  0001 C CNN
F 3 "" H 950 3600 50  0001 C CNN
	1    950  3600
	1    0    0    -1  
$EndComp
Text Label 1350 2850 2    50   ~ 0
SWSEL
Text Label 1350 3350 2    50   ~ 0
~SWSEL
Wire Wire Line
	1100 2850 1350 2850
Wire Wire Line
	1100 3350 1350 3350
Wire Wire Line
	9450 1600 9150 1600
Wire Wire Line
	9450 1700 9150 1700
Text Label 9150 1600 0    50   ~ 0
SWSEL
Text Label 9150 1700 0    50   ~ 0
~SWSEL
$Comp
L Device:CP C1
U 1 1 5DC75151
P 950 4300
F 0 "C1" H 1068 4346 50  0000 L CNN
F 1 "1µF" H 1068 4255 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 988 4150 50  0001 C CNN
F 3 "~" H 950 4300 50  0001 C CNN
	1    950  4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5DC76B70
P 950 4150
F 0 "#PWR07" H 950 4000 50  0001 C CNN
F 1 "+5V" H 965 4323 50  0000 C CNN
F 2 "" H 950 4150 50  0001 C CNN
F 3 "" H 950 4150 50  0001 C CNN
	1    950  4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5DC77527
P 950 4450
F 0 "#PWR08" H 950 4200 50  0001 C CNN
F 1 "GND" H 955 4277 50  0000 C CNN
F 2 "" H 950 4450 50  0001 C CNN
F 3 "" H 950 4450 50  0001 C CNN
	1    950  4450
	1    0    0    -1  
$EndComp
Text Label 6000 600  2    50   ~ 0
COL[0..15]
Text Label 4850 1150 0    50   ~ 0
COL[0..7]
Text Label 4850 2200 0    50   ~ 0
COL[0..7]
Text Label 4850 3250 0    50   ~ 0
COL[0..7]
Text Label 4850 4300 0    50   ~ 0
COL[0..7]
Text Label 4850 5300 0    50   ~ 0
COL[0..7]
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 5CCF6BC2
P 1900 7200
F 0 "J9" H 1980 7146 50  0000 L CNN
F 1 "Conn_01x02" H 1980 7101 50  0001 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 1900 7200 50  0001 C CNN
F 3 "~" H 1900 7200 50  0001 C CNN
	1    1900 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 7300 1700 7300
Connection ~ 1500 7300
Wire Wire Line
	3750 7200 3800 7200
Wire Wire Line
	3800 7200 3800 7300
Connection ~ 3800 7300
Text Notes 4050 7600 0    50   ~ 0
Note: COL0–7 & COL8–15 and SWD0–1 & SWD2–3 are swapped\nin the daisy chain. This lets us sample two modules at once.
NoConn ~ 3250 6700
NoConn ~ 3250 7000
NoConn ~ 950  6700
NoConn ~ 950  7000
Wire Bus Line
	4300 600  6600 600 
Wire Bus Line
	6700 700  6700 5200
Wire Bus Line
	4650 700  4650 5200
$EndSCHEMATC
