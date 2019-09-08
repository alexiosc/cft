EESchema Schematic File Version 4
LIBS:cft-front-panel-cache
EELAYER 30 0
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
Entry Bus Bus
	4550 600  4650 700 
Entry Bus Bus
	4650 1050 4750 1150
Wire Bus Line
	4750 1150 5350 1150
Wire Wire Line
	5250 5150 5350 5150
Wire Wire Line
	5350 2450 5250 2450
Connection ~ 5250 2450
Wire Wire Line
	5250 2450 5250 3350
Wire Wire Line
	5350 3350 5250 3350
Connection ~ 5250 3350
Wire Wire Line
	5350 4250 5250 4250
Connection ~ 5250 4250
Wire Wire Line
	5350 1550 5250 1550
Wire Wire Line
	5250 1550 5250 2450
Entry Bus Bus
	4650 1950 4750 2050
Wire Bus Line
	4750 2050 5350 2050
Entry Bus Bus
	4650 2850 4750 2950
Wire Bus Line
	4750 2950 5350 2950
Entry Bus Bus
	4650 3750 4750 3850
Wire Bus Line
	4750 3850 5350 3850
Entry Bus Bus
	4650 4650 4750 4750
Wire Bus Line
	4750 4750 5350 4750
Text Label 4650 1650 1    50   ~ 0
D[0..15]
Wire Wire Line
	5350 2250 4850 2250
Wire Wire Line
	5350 3150 4850 3150
Wire Wire Line
	5350 4050 4850 4050
Wire Wire Line
	4850 1350 5350 1350
Connection ~ 5250 5150
Text Label 4850 4950 0    50   ~ 0
ROW5
Text Label 4850 4050 0    50   ~ 0
ROW4
Text Label 4850 5150 0    50   ~ 0
~LTSON
Text Label 4850 3150 0    50   ~ 0
ROW3
Text Label 4850 2250 0    50   ~ 0
ROW2
$Comp
L alexios:74HC138 U3
U 1 1 5CC738EE
P 9600 9550
F 0 "U3" H 9600 10217 50  0000 C CNN
F 1 "74HC138" H 9600 10126 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 9600 9550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 9600 9550 50  0001 C CNN
	1    9600 9550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5CC763A5
P 11200 9250
F 0 "J1" H 11280 9292 50  0000 L CNN
F 1 "Switch 0" H 11280 9201 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 11200 9250 50  0001 C CNN
F 3 "~" H 11200 9250 50  0001 C CNN
	1    11200 9250
	1    0    0    -1  
$EndComp
Text Label 10350 9250 2    50   ~ 0
~SW1
Text Label 10350 9350 2    50   ~ 0
~SW2
Text Label 10350 9450 2    50   ~ 0
~SW3
Text Label 10350 9550 2    50   ~ 0
~SW4
Text Label 10350 9650 2    50   ~ 0
~SW5
Text Label 10350 9750 2    50   ~ 0
~SW6
Text Label 10350 9850 2    50   ~ 0
~SW7
Text Label 10750 9250 0    50   ~ 0
~SW0
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5CC7CDFE
P 11200 9650
F 0 "J2" H 11280 9692 50  0000 L CNN
F 1 "Switch 1" H 11280 9601 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 11200 9650 50  0001 C CNN
F 3 "~" H 11200 9650 50  0001 C CNN
	1    11200 9650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5CC7D1AD
P 11200 10050
F 0 "J3" H 11280 10092 50  0000 L CNN
F 1 "Switch 2" H 11280 10001 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 11200 10050 50  0001 C CNN
F 3 "~" H 11200 10050 50  0001 C CNN
	1    11200 10050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5CC7D359
P 11200 10450
F 0 "J4" H 11280 10492 50  0000 L CNN
F 1 "Switch 3" H 11280 10401 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 11200 10450 50  0001 C CNN
F 3 "~" H 11200 10450 50  0001 C CNN
	1    11200 10450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5CC8006E
P 11200 10850
F 0 "J5" H 11280 10892 50  0000 L CNN
F 1 "Switch 4" H 11280 10801 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 11200 10850 50  0001 C CNN
F 3 "~" H 11200 10850 50  0001 C CNN
	1    11200 10850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 5CC80074
P 11200 11250
F 0 "J6" H 11280 11292 50  0000 L CNN
F 1 "Switch 5" H 11280 11201 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 11200 11250 50  0001 C CNN
F 3 "~" H 11200 11250 50  0001 C CNN
	1    11200 11250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 5CC8007A
P 11200 11650
F 0 "J7" H 11280 11692 50  0000 L CNN
F 1 "Switch 6" H 11280 11601 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 11200 11650 50  0001 C CNN
F 3 "~" H 11200 11650 50  0001 C CNN
	1    11200 11650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 5CC80080
P 11200 12050
F 0 "J8" H 11280 12092 50  0000 L CNN
F 1 "Switch 7" H 11280 12001 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 11200 12050 50  0001 C CNN
F 3 "~" H 11200 12050 50  0001 C CNN
	1    11200 12050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 9450 10350 9450
Wire Wire Line
	10100 9550 10350 9550
Wire Wire Line
	10100 9350 10350 9350
Wire Wire Line
	10100 9250 10350 9250
Wire Wire Line
	10100 9150 10350 9150
Wire Wire Line
	10100 9650 10350 9650
Wire Wire Line
	10100 9750 10350 9750
Wire Wire Line
	10100 9850 10350 9850
Wire Wire Line
	11000 9150 10750 9150
Wire Wire Line
	10750 9350 11000 9350
Wire Wire Line
	9100 9150 8800 9150
Wire Wire Line
	9100 9250 8800 9250
Wire Wire Line
	9100 9350 8800 9350
$Comp
L power:GND #PWR025
U 1 1 5CCAF5E9
P 9100 9950
F 0 "#PWR025" H 9100 9700 50  0001 C CNN
F 1 "GND" H 9105 9777 50  0000 C CNN
F 2 "" H 9100 9950 50  0001 C CNN
F 3 "" H 9100 9950 50  0001 C CNN
	1    9100 9950
	1    0    0    -1  
$EndComp
Text Label 4850 1350 0    50   ~ 0
ROW1
Text Label 4300 600  2    50   ~ 0
FPD[0..15]
$Comp
L alexios:74HC138 U3
U 2 1 5D335BA2
P 9450 10600
F 0 "U3" H 9630 10646 50  0000 L CNN
F 1 "74HC138" H 9630 10555 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 9450 10600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 9450 10600 50  0001 C CNN
	2    9450 10600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5D335BA8
P 9100 10600
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
F 0 "C4" H 9009 10646 50  0000 R CNN
F 1 "100nF" H 9009 10555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9100 10600 50  0001 C CNN
F 3 "~" H 9100 10600 50  0001 C CNN
	1    9100 10600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5D335BAE
P 9100 10700
F 0 "#PWR027" H 9100 10450 50  0001 C CNN
F 1 "GND" H 9105 10527 50  0000 C CNN
F 2 "" H 9100 10700 50  0001 C CNN
F 3 "" H 9100 10700 50  0001 C CNN
	1    9100 10700
	1    0    0    -1  
$EndComp
Connection ~ 9100 10700
$Comp
L power:+5V #PWR026
U 1 1 5D335BB5
P 9100 10500
F 0 "#PWR026" H 9100 10350 50  0001 C CNN
F 1 "+5V" H 9115 10673 50  0000 C CNN
F 2 "" H 9100 10500 50  0001 C CNN
F 3 "" H 9100 10500 50  0001 C CNN
	1    9100 10500
	1    0    0    -1  
$EndComp
Connection ~ 9100 10500
Text Label 8800 9150 0    50   ~ 0
SWA0
Text Label 8800 9250 0    50   ~ 0
SWA1
Text Label 8800 9350 0    50   ~ 0
SWA2
Text Label 10350 9150 2    50   ~ 0
~SW0
Wire Wire Line
	11000 9250 10750 9250
Text Label 10750 9150 0    50   ~ 0
SWD0
Text Label 10750 9350 0    50   ~ 0
SWD1
Text Label 10750 9650 0    50   ~ 0
~SW1
Wire Wire Line
	11000 9550 10750 9550
Wire Wire Line
	10750 9750 11000 9750
Wire Wire Line
	11000 9650 10750 9650
Text Label 10750 9550 0    50   ~ 0
SWD0
Text Label 10750 9750 0    50   ~ 0
SWD1
Text Label 10750 10050 0    50   ~ 0
~SW2
Wire Wire Line
	11000 9950 10750 9950
Wire Wire Line
	10750 10150 11000 10150
Wire Wire Line
	11000 10050 10750 10050
Text Label 10750 9950 0    50   ~ 0
SWD0
Text Label 10750 10150 0    50   ~ 0
SWD1
Text Label 10750 10450 0    50   ~ 0
~SW3
Wire Wire Line
	11000 10350 10750 10350
Wire Wire Line
	10750 10550 11000 10550
Wire Wire Line
	11000 10450 10750 10450
Text Label 10750 10350 0    50   ~ 0
SWD0
Text Label 10750 10550 0    50   ~ 0
SWD1
Text Label 10750 10850 0    50   ~ 0
~SW4
Wire Wire Line
	11000 10750 10750 10750
Wire Wire Line
	10750 10950 11000 10950
Wire Wire Line
	11000 10850 10750 10850
Text Label 10750 10750 0    50   ~ 0
SWD0
Text Label 10750 10950 0    50   ~ 0
SWD1
Text Label 10750 11250 0    50   ~ 0
~SW5
Wire Wire Line
	11000 11150 10750 11150
Wire Wire Line
	10750 11350 11000 11350
Wire Wire Line
	11000 11250 10750 11250
Text Label 10750 11150 0    50   ~ 0
SWD0
Text Label 10750 11350 0    50   ~ 0
SWD1
Text Label 10750 11650 0    50   ~ 0
~SW6
Wire Wire Line
	11000 11550 10750 11550
Wire Wire Line
	10750 11750 11000 11750
Wire Wire Line
	11000 11650 10750 11650
Text Label 10750 11550 0    50   ~ 0
SWD0
Text Label 10750 11750 0    50   ~ 0
SWD1
Text Label 10750 12050 0    50   ~ 0
~SW7
Wire Wire Line
	11000 11950 10750 11950
Wire Wire Line
	10750 12150 11000 12150
Wire Wire Line
	11000 12050 10750 12050
Text Label 10750 11950 0    50   ~ 0
SWD0
Text Label 10750 12150 0    50   ~ 0
SWD1
Wire Wire Line
	4850 5150 5250 5150
Wire Wire Line
	5350 4950 4850 4950
$Comp
L Jumper:Jumper_3_Bridged12 JP2A1
U 1 1 5DBC1466
P 8100 9550
F 0 "JP2A1" V 8100 9617 50  0000 L CNN
F 1 "Jumper_3_Bridged12" V 8145 9617 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 8100 9550 50  0001 C CNN
F 3 "~" H 8100 9550 50  0001 C CNN
	1    8100 9550
	0    -1   1    0   
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP2B1
U 1 1 5DBC146C
P 8100 10050
F 0 "JP2B1" V 8100 10117 50  0000 L CNN
F 1 "Jumper_3_Bridged12" V 8145 10117 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 8100 10050 50  0001 C CNN
F 3 "~" H 8100 10050 50  0001 C CNN
	1    8100 10050
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5DBC1472
P 8100 9300
F 0 "#PWR05" H 8100 9150 50  0001 C CNN
F 1 "+5V" H 8115 9473 50  0000 C CNN
F 2 "" H 8100 9300 50  0001 C CNN
F 3 "" H 8100 9300 50  0001 C CNN
	1    8100 9300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 9800 7700 9800
Connection ~ 8100 9800
Text Label 7700 9800 0    50   ~ 0
SWA3
$Comp
L power:GND #PWR06
U 1 1 5DBC147B
P 8100 10300
F 0 "#PWR06" H 8100 10050 50  0001 C CNN
F 1 "GND" H 8105 10127 50  0000 C CNN
F 2 "" H 8100 10300 50  0001 C CNN
F 3 "" H 8100 10300 50  0001 C CNN
	1    8100 10300
	1    0    0    -1  
$EndComp
Text Label 8250 9550 0    50   ~ 0
SWSEL
Text Label 8250 10050 0    50   ~ 0
~SWSEL
Wire Wire Line
	8250 9550 8600 9550
Text Label 8800 9750 0    50   ~ 0
SWSEL
Text Label 8800 9850 0    50   ~ 0
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
Text Label 4850 1150 0    50   ~ 0
FPD[0..7]
Text Label 4850 2050 0    50   ~ 0
FPD[0..7]
Text Label 4850 2950 0    50   ~ 0
FPD[0..7]
Text Label 4850 3850 0    50   ~ 0
FPD[0..7]
Text Label 4850 4750 0    50   ~ 0
FPD[0..7]
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 5CCF6BC2
P 950 7500
F 0 "J9" H 1030 7446 50  0000 L CNN
F 1 "Conn_01x02" H 1030 7401 50  0001 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 950 7500 50  0001 C CNN
F 3 "~" H 950 7500 50  0001 C CNN
	1    950  7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 6800 1450 6800
$Comp
L Connector_Generic:Conn_02x14_Odd_Even CON1
U 1 1 5D9DA3CB
P 1150 6100
F 0 "CON1" H 1200 6825 50  0000 C CNN
F 1 "Conn_02x14_Odd_Even" H 1200 6826 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x14_P2.54mm_Vertical" H 1150 6100 50  0001 C CNN
F 3 "~" H 1150 6100 50  0001 C CNN
	1    1150 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6700 700  6700
Text Label 700  6700 0    50   ~ 0
SWD3
Text Label 1700 6600 2    50   ~ 0
SWD2
Text Label 700  6600 0    50   ~ 0
SWD1
Text Label 1700 6500 2    50   ~ 0
SWD0
Text Label 700  6500 0    50   ~ 0
SWA3
Text Label 1700 6400 2    50   ~ 0
SWA2
Text Label 700  6400 0    50   ~ 0
SWA1
Text Label 1700 6300 2    50   ~ 0
SWA0
Text Label 1700 6700 2    50   ~ 0
~LTSON
Text Label 700  6300 0    50   ~ 0
ROW5
Text Label 1700 6200 2    50   ~ 0
ROW4
Text Label 700  6200 0    50   ~ 0
ROW3
Text Label 1700 6100 2    50   ~ 0
ROW2
Text Label 700  6100 0    50   ~ 0
ROW1
Text Label 1700 6000 2    50   ~ 0
FPD7
Text Label 700  6000 0    50   ~ 0
FPD6
Text Label 1700 5900 2    50   ~ 0
FPD5
Text Label 700  5900 0    50   ~ 0
FPD4
Text Label 1700 5800 2    50   ~ 0
FPD3
Text Label 700  5800 0    50   ~ 0
FPD2
Text Label 1700 5700 2    50   ~ 0
FPD1
Text Label 700  5700 0    50   ~ 0
FPD0
Text Label 1700 5600 2    50   ~ 0
FPA1
Text Label 700  5600 0    50   ~ 0
FPA0
Wire Wire Line
	1450 5600 1700 5600
Wire Wire Line
	950  5600 700  5600
Text Label 700  6800 0    50   ~ 0
POWER
Text Notes 700  5250 0    50   ~ 0
From Controller/Previous Module
$Comp
L power:GND #PWR010
U 1 1 5D75872E
P 1500 6800
F 0 "#PWR010" H 1500 6550 50  0001 C CNN
F 1 "GND" H 1505 6627 50  0000 C CNN
F 2 "" H 1500 6800 50  0001 C CNN
F 3 "" H 1500 6800 50  0001 C CNN
	1    1500 6800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1450 6600 1700 6600
Wire Wire Line
	1450 5500 1500 5500
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
Wire Wire Line
	1450 5700 1700 5700
Wire Wire Line
	1700 6700 1450 6700
Wire Wire Line
	1700 6500 1450 6500
Wire Wire Line
	1700 6400 1450 6400
Wire Wire Line
	1700 6300 1450 6300
Wire Wire Line
	1700 6200 1450 6200
Wire Wire Line
	1700 6100 1450 6100
Wire Wire Line
	1700 6000 1450 6000
Wire Wire Line
	1700 5900 1450 5900
Wire Wire Line
	1700 5800 1450 5800
Wire Wire Line
	950  5500 900  5500
Wire Wire Line
	950  5700 700  5700
Wire Wire Line
	950  5800 700  5800
Wire Wire Line
	950  5900 700  5900
Wire Wire Line
	950  6000 700  6000
Wire Wire Line
	950  6100 700  6100
Wire Wire Line
	950  6200 700  6200
Wire Wire Line
	950  6300 700  6300
Wire Wire Line
	950  6400 700  6400
Wire Wire Line
	950  6500 700  6500
Wire Wire Line
	950  6600 700  6600
Wire Wire Line
	950  6800 700  6800
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
Wire Wire Line
	3000 6800 2950 6800
$Comp
L Connector_Generic:Conn_02x14_Odd_Even CON2
U 1 1 5DA1EB7B
P 2650 6100
F 0 "CON2" H 2700 6825 50  0000 C CNN
F 1 "Conn_02x14_Odd_Even" H 2700 6826 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x14_P2.54mm_Vertical" H 2650 6100 50  0001 C CNN
F 3 "~" H 2650 6100 50  0001 C CNN
	1    2650 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6700 2200 6700
Text Label 2200 6700 0    50   ~ 0
SWD3
Text Label 3200 6500 2    50   ~ 0
SWD2
Text Label 2200 6500 0    50   ~ 0
SWD1
Text Label 3200 6600 2    50   ~ 0
SWD0
Text Label 2200 6600 0    50   ~ 0
SWA3
Text Label 3200 6400 2    50   ~ 0
SWA2
Text Label 2200 6400 0    50   ~ 0
SWA1
Text Label 3200 6300 2    50   ~ 0
SWA0
Text Label 3200 6700 2    50   ~ 0
~LTSON
Text Label 2200 6300 0    50   ~ 0
ROW5
Text Label 3200 6200 2    50   ~ 0
ROW4
Text Label 2200 6200 0    50   ~ 0
ROW3
Text Label 3200 6100 2    50   ~ 0
ROW2
Text Label 2200 6100 0    50   ~ 0
ROW1
Text Label 3200 6000 2    50   ~ 0
FPD7
Text Label 2200 6000 0    50   ~ 0
FPD6
Text Label 3200 5900 2    50   ~ 0
FPD5
Text Label 2200 5900 0    50   ~ 0
FPD4
Text Label 3200 5800 2    50   ~ 0
FPD3
Text Label 2200 5800 0    50   ~ 0
FPD2
Text Label 3200 5700 2    50   ~ 0
FPD1
Text Label 2200 5700 0    50   ~ 0
FPD0
Text Label 3200 5600 2    50   ~ 0
FPA1
Text Label 2200 5600 0    50   ~ 0
FPA0
Wire Wire Line
	2950 5600 3200 5600
Wire Wire Line
	2450 5600 2200 5600
Text Notes 2200 5250 0    50   ~ 0
To Next Module
$Comp
L power:GND #PWR0101
U 1 1 5DA1EB9F
P 3000 6800
F 0 "#PWR0101" H 3000 6550 50  0001 C CNN
F 1 "GND" H 3005 6627 50  0000 C CNN
F 2 "" H 3000 6800 50  0001 C CNN
F 3 "" H 3000 6800 50  0001 C CNN
	1    3000 6800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2950 6600 3200 6600
Wire Wire Line
	2950 5500 3000 5500
$Comp
L power:+5V #PWR0102
U 1 1 5DA1EBA7
P 3000 5500
F 0 "#PWR0102" H 3000 5350 50  0001 C CNN
F 1 "+5V" H 3015 5673 50  0000 C CNN
F 2 "" H 3000 5500 50  0001 C CNN
F 3 "" H 3000 5500 50  0001 C CNN
	1    3000 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 5700 3200 5700
Wire Wire Line
	3200 6700 2950 6700
Wire Wire Line
	3200 6500 2950 6500
Wire Wire Line
	3200 6400 2950 6400
Wire Wire Line
	3200 6300 2950 6300
Wire Wire Line
	3200 6200 2950 6200
Wire Wire Line
	3200 6100 2950 6100
Wire Wire Line
	3200 6000 2950 6000
Wire Wire Line
	3200 5900 2950 5900
Wire Wire Line
	3200 5800 2950 5800
Wire Wire Line
	2450 5500 2400 5500
Wire Wire Line
	2450 5700 2200 5700
Wire Wire Line
	2450 5800 2200 5800
Wire Wire Line
	2450 5900 2200 5900
Wire Wire Line
	2450 6000 2200 6000
Wire Wire Line
	2450 6100 2200 6100
Wire Wire Line
	2450 6200 2200 6200
Wire Wire Line
	2450 6300 2200 6300
Wire Wire Line
	2450 6400 2200 6400
Wire Wire Line
	2450 6500 2200 6500
Wire Wire Line
	2450 6600 2200 6600
$Comp
L power:+5V #PWR0103
U 1 1 5DA1EBC3
P 2400 5500
F 0 "#PWR0103" H 2400 5350 50  0001 C CNN
F 1 "+5V" H 2415 5673 50  0000 C CNN
F 2 "" H 2400 5500 50  0001 C CNN
F 3 "" H 2400 5500 50  0001 C CNN
	1    2400 5500
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP101
U 1 1 5DA88669
P 6700 9150
F 0 "JP101" H 6700 9263 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 6700 9264 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 6700 9150 50  0001 C CNN
F 3 "~" H 6700 9150 50  0001 C CNN
	1    6700 9150
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP102
U 1 1 5DA8922C
P 6700 9400
F 0 "JP102" H 6700 9513 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 6700 9514 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 6700 9400 50  0001 C CNN
F 3 "~" H 6700 9400 50  0001 C CNN
	1    6700 9400
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP103
U 1 1 5DA946F0
P 6700 9650
F 0 "JP103" H 6700 9763 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 6700 9764 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 6700 9650 50  0001 C CNN
F 3 "~" H 6700 9650 50  0001 C CNN
	1    6700 9650
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP104
U 1 1 5DA946F7
P 6700 9900
F 0 "JP104" H 6700 10013 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 6700 10014 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 6700 9900 50  0001 C CNN
F 3 "~" H 6700 9900 50  0001 C CNN
	1    6700 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 9250 6500 9400
Wire Wire Line
	6500 9400 6550 9400
Wire Wire Line
	6400 9350 6400 9650
Wire Wire Line
	6400 9650 6550 9650
Wire Wire Line
	6300 9450 6300 9900
Wire Wire Line
	6300 9900 6550 9900
Wire Wire Line
	6850 9150 6950 9150
Wire Wire Line
	6950 9150 6950 9400
Wire Wire Line
	6950 9900 6850 9900
Connection ~ 6950 9150
Wire Wire Line
	6950 9150 7250 9150
Wire Wire Line
	6850 9400 6950 9400
Connection ~ 6950 9400
Wire Wire Line
	6950 9400 6950 9650
Wire Wire Line
	6850 9650 6950 9650
Connection ~ 6950 9650
Wire Wire Line
	6950 9650 6950 9900
Text Label 7250 9150 2    50   ~ 0
~LMEN
$Comp
L power:+5V #PWR0104
U 1 1 5DB7A873
P 4800 9750
F 0 "#PWR0104" H 4800 9600 50  0001 C CNN
F 1 "+5V" H 4650 9800 50  0000 C CNN
F 2 "" H 4800 9750 50  0001 C CNN
F 3 "" H 4800 9750 50  0001 C CNN
	1    4800 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 9750 4800 9750
Wire Wire Line
	4850 9950 4800 9950
Wire Wire Line
	4800 9850 4800 9950
Wire Wire Line
	4850 9850 4800 9850
Connection ~ 4800 9950
$Comp
L power:GND #PWR0105
U 1 1 5DB243FF
P 4800 9950
F 0 "#PWR0105" H 4800 9700 50  0001 C CNN
F 1 "GND" H 4805 9777 50  0000 C CNN
F 2 "" H 4800 9950 50  0001 C CNN
F 3 "" H 4800 9950 50  0001 C CNN
	1    4800 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 9350 6400 9350
Wire Wire Line
	5850 9250 6500 9250
Wire Wire Line
	5850 9150 6550 9150
Text Label 6150 9450 2    50   ~ 0
~LMEN3
Text Label 6150 9350 2    50   ~ 0
~LMEN2
Text Label 6150 9250 2    50   ~ 0
~LMEN1
Text Label 6150 9150 2    50   ~ 0
~LMEN0
NoConn ~ 5850 9850
NoConn ~ 5850 9750
NoConn ~ 5850 9650
NoConn ~ 5850 9550
$Comp
L power:GND #PWR0106
U 1 1 5DA63E23
P 4800 9350
F 0 "#PWR0106" H 4800 9100 50  0001 C CNN
F 1 "GND" H 4650 9350 50  0000 C CNN
F 2 "" H 4800 9350 50  0001 C CNN
F 3 "" H 4800 9350 50  0001 C CNN
	1    4800 9350
	1    0    0    -1  
$EndComp
Text Label 4500 9250 0    50   ~ 0
FPA1
Text Label 4500 9150 0    50   ~ 0
FPA0
$Comp
L alexios:74HC138 U1
U 1 1 5CE5C1E8
P 5350 9550
F 0 "U1" H 5350 10217 50  0000 C CNN
F 1 "74HC138" H 5350 10126 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5350 9550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5350 9550 50  0001 C CNN
	1    5350 9550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 9450 5850 9450
Wire Wire Line
	4850 9150 4500 9150
Wire Wire Line
	4850 9250 4500 9250
Wire Wire Line
	4850 9350 4800 9350
$Comp
L power:+5V #PWR014
U 1 1 5D1F7FB5
P 4800 10500
F 0 "#PWR014" H 4800 10350 50  0001 C CNN
F 1 "+5V" H 4815 10673 50  0000 C CNN
F 2 "" H 4800 10500 50  0001 C CNN
F 3 "" H 4800 10500 50  0001 C CNN
	1    4800 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5D1F72DD
P 4800 10700
F 0 "#PWR015" H 4800 10450 50  0001 C CNN
F 1 "GND" H 4805 10527 50  0000 C CNN
F 2 "" H 4800 10700 50  0001 C CNN
F 3 "" H 4800 10700 50  0001 C CNN
	1    4800 10700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5D1F63F8
P 4800 10600
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
F 0 "C2" H 4709 10646 50  0000 R CNN
F 1 "100nF" H 4709 10555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4800 10600 50  0001 C CNN
F 3 "~" H 4800 10600 50  0001 C CNN
	1    4800 10600
	1    0    0    -1  
$EndComp
Connection ~ 4800 10700
Connection ~ 4800 10500
$Comp
L alexios:74HC138 U1
U 2 1 5D1F5B46
P 5150 10600
F 0 "U1" H 5330 10646 50  0000 L CNN
F 1 "74HC138" H 5330 10555 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5150 10600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5150 10600 50  0001 C CNN
	2    5150 10600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 10050 8600 10050
Wire Wire Line
	8600 9550 8600 9750
Wire Wire Line
	8600 9750 9100 9750
Wire Wire Line
	8600 9850 8600 10050
Wire Wire Line
	8600 9850 9100 9850
Text Notes 7700 11200 0    50   ~ 0
Modules A & B: short JP2A1\nModules C & D: short JP2B1.\nThe rest happens by swapping SWD0-1 and SWD2-3\non the next module output connector.
$Sheet
S 5350 4600 1000 700 
U 5CC02B94
F0 "Half Row" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 4750 50 
F3 "LOAD" I L 5350 4950 50 
F4 "~LTSON" I L 5350 5150 50 
$EndSheet
$Sheet
S 5350 3700 1000 700 
U 5CC38618
F0 "sheet5CC38612" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 3850 50 
F3 "LOAD" I L 5350 4050 50 
F4 "~LTSON" I L 5350 4250 50 
$EndSheet
$Sheet
S 5350 2800 1000 700 
U 5CC382AC
F0 "sheet5CC3829C" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 2950 50 
F3 "LOAD" I L 5350 3150 50 
F4 "~LTSON" I L 5350 3350 50 
$EndSheet
$Sheet
S 5350 1900 1000 700 
U 5CC382A2
F0 "sheet5CC3829A" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 2050 50 
F3 "LOAD" I L 5350 2250 50 
F4 "~LTSON" I L 5350 2450 50 
$EndSheet
$Sheet
S 5350 1000 1000 700 
U 5CC37D0C
F0 "sheet5CC37D06" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 5350 1150 50 
F3 "LOAD" I L 5350 1350 50 
F4 "~LTSON" I L 5350 1550 50 
$EndSheet
Wire Bus Line
	4550 600  3850 600 
Wire Wire Line
	5250 4250 5250 5150
Wire Wire Line
	5250 3350 5250 4250
Wire Bus Line
	4650 700  4650 4650
$EndSCHEMATC
