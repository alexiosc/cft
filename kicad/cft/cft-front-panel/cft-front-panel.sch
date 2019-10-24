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
$Comp
L alexios:74HC138 U2
U 1 1 5CC738EE
P 5800 3250
F 0 "U2" H 5800 3917 50  0000 C CNN
F 1 "74HC138" H 5800 3826 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5800 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5800 3250 50  0001 C CNN
	1    5800 3250
	1    0    0    -1  
$EndComp
Text Label 6550 2950 2    50   ~ 0
~SW1
Text Label 6550 3050 2    50   ~ 0
~SW2
Text Label 6550 3150 2    50   ~ 0
~SW3
Text Label 6550 3250 2    50   ~ 0
~SW4
Text Label 6550 3350 2    50   ~ 0
~SW5
Text Label 6550 3450 2    50   ~ 0
~SW6
Text Label 6550 3550 2    50   ~ 0
~SW7
Text Label 7150 2850 0    50   ~ 0
~SW0
Wire Wire Line
	6300 3150 6600 3150
Wire Wire Line
	6300 3250 6600 3250
Wire Wire Line
	6300 3050 6600 3050
Wire Wire Line
	6300 2950 6600 2950
Wire Wire Line
	6300 3350 6600 3350
Wire Wire Line
	6300 3450 6600 3450
Wire Wire Line
	6300 3550 6600 3550
Wire Wire Line
	7150 2950 7400 2950
Wire Wire Line
	5300 2850 5000 2850
Wire Wire Line
	5300 2950 5000 2950
Wire Wire Line
	5300 3050 5000 3050
$Comp
L power:GND #PWR014
U 1 1 5CCAF5E9
P 5300 3650
F 0 "#PWR014" H 5300 3400 50  0001 C CNN
F 1 "GND" H 5305 3477 50  0000 C CNN
F 2 "" H 5300 3650 50  0001 C CNN
F 3 "" H 5300 3650 50  0001 C CNN
	1    5300 3650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U2
U 2 1 5D335BA2
P 6100 4300
F 0 "U2" H 6280 4346 50  0000 L CNN
F 1 "74HC138" H 6280 4255 50  0000 L CNN
F 2 "alexios:SOIC-16" H 6100 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 6100 4300 50  0001 C CNN
	2    6100 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5D335BA8
P 5750 4300
AR Path="/5D335BA8" Ref="C2"  Part="1" 
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
F 0 "C2" H 5659 4346 50  0000 R CNN
F 1 "100nF" H 5659 4255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5750 4300 50  0001 C CNN
F 3 "~" H 5750 4300 50  0001 C CNN
	1    5750 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5D335BAE
P 5750 4400
F 0 "#PWR018" H 5750 4150 50  0001 C CNN
F 1 "GND" H 5755 4227 50  0000 C CNN
F 2 "" H 5750 4400 50  0001 C CNN
F 3 "" H 5750 4400 50  0001 C CNN
	1    5750 4400
	1    0    0    -1  
$EndComp
Connection ~ 5750 4400
$Comp
L power:+5V #PWR017
U 1 1 5D335BB5
P 5750 4200
F 0 "#PWR017" H 5750 4050 50  0001 C CNN
F 1 "+5V" H 5765 4373 50  0000 C CNN
F 2 "" H 5750 4200 50  0001 C CNN
F 3 "" H 5750 4200 50  0001 C CNN
	1    5750 4200
	1    0    0    -1  
$EndComp
Connection ~ 5750 4200
Text Label 5000 2850 0    50   ~ 0
SWA0
Text Label 5000 2950 0    50   ~ 0
SWA1
Text Label 5000 3050 0    50   ~ 0
SWA2
Text Label 6550 2850 2    50   ~ 0
~SW0
Wire Wire Line
	7400 2850 7100 2850
Text Label 7150 2750 0    50   ~ 0
SWD0
Text Label 7150 2950 0    50   ~ 0
SWD1
Text Label 7150 3250 0    50   ~ 0
~SW1
Wire Wire Line
	7400 3150 7150 3150
Wire Wire Line
	7150 3350 7400 3350
Wire Wire Line
	7400 3250 7100 3250
Text Label 7150 3150 0    50   ~ 0
SWD0
Text Label 7150 3350 0    50   ~ 0
SWD1
Text Label 7150 3650 0    50   ~ 0
~SW2
Wire Wire Line
	7400 3550 7150 3550
Wire Wire Line
	7150 3750 7400 3750
Wire Wire Line
	7400 3650 7100 3650
Text Label 7150 3550 0    50   ~ 0
SWD0
Text Label 7150 3750 0    50   ~ 0
SWD1
Text Label 7150 4050 0    50   ~ 0
~SW3
Wire Wire Line
	7400 3950 7150 3950
Wire Wire Line
	7150 4150 7400 4150
Wire Wire Line
	7400 4050 7100 4050
Text Label 7150 3950 0    50   ~ 0
SWD0
Text Label 7150 4150 0    50   ~ 0
SWD1
Text Label 7150 4450 0    50   ~ 0
~SW4
Wire Wire Line
	7400 4350 7150 4350
Wire Wire Line
	7150 4550 7400 4550
Wire Wire Line
	7400 4450 7100 4450
Text Label 7150 4350 0    50   ~ 0
SWD0
Text Label 7150 4550 0    50   ~ 0
SWD1
Text Label 7150 4850 0    50   ~ 0
~SW5
Wire Wire Line
	7400 4750 7150 4750
Wire Wire Line
	7150 4950 7400 4950
Wire Wire Line
	7400 4850 7100 4850
Text Label 7150 4750 0    50   ~ 0
SWD0
Text Label 7150 4950 0    50   ~ 0
SWD1
Text Label 7150 5250 0    50   ~ 0
~SW6
Wire Wire Line
	7400 5150 7150 5150
Wire Wire Line
	7150 5350 7400 5350
Wire Wire Line
	7400 5250 7100 5250
Text Label 7150 5150 0    50   ~ 0
SWD0
Text Label 7150 5350 0    50   ~ 0
SWD1
Text Label 7150 5650 0    50   ~ 0
~SW7
Wire Wire Line
	7400 5550 7150 5550
Wire Wire Line
	7150 5750 7400 5750
Wire Wire Line
	7400 5650 7100 5650
Text Label 7150 5550 0    50   ~ 0
SWD0
Text Label 7150 5750 0    50   ~ 0
SWD1
$Comp
L Jumper:Jumper_3_Bridged12 JP5
U 1 1 5DBC1466
P 4300 3250
F 0 "JP5" V 4300 3317 50  0000 L CNN
F 1 "Jumper_3_Bridged12" V 4345 3317 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 4300 3250 50  0001 C CNN
F 3 "~" H 4300 3250 50  0001 C CNN
	1    4300 3250
	0    -1   1    0   
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP6
U 1 1 5DBC146C
P 4300 3750
F 0 "JP6" V 4300 3817 50  0000 L CNN
F 1 "Jumper_3_Bridged12" V 4345 3817 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 4300 3750 50  0001 C CNN
F 3 "~" H 4300 3750 50  0001 C CNN
	1    4300 3750
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5DBC1472
P 4300 3000
F 0 "#PWR011" H 4300 2850 50  0001 C CNN
F 1 "+5V" H 4315 3173 50  0000 C CNN
F 2 "" H 4300 3000 50  0001 C CNN
F 3 "" H 4300 3000 50  0001 C CNN
	1    4300 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3500 3900 3500
Connection ~ 4300 3500
Text Label 3900 3500 0    50   ~ 0
SWA3
$Comp
L power:GND #PWR015
U 1 1 5DBC147B
P 4300 4000
F 0 "#PWR015" H 4300 3750 50  0001 C CNN
F 1 "GND" H 4305 3827 50  0000 C CNN
F 2 "" H 4300 4000 50  0001 C CNN
F 3 "" H 4300 4000 50  0001 C CNN
	1    4300 4000
	1    0    0    -1  
$EndComp
Text Label 4450 3250 0    50   ~ 0
SWSEL
Text Label 4450 3750 0    50   ~ 0
~SWSEL
Wire Wire Line
	4450 3250 4800 3250
Text Label 5000 3450 0    50   ~ 0
SWSEL
Text Label 5000 3550 0    50   ~ 0
~SWSEL
$Comp
L Device:CP C3
U 1 1 5DC75151
P 6400 7050
F 0 "C3" H 6518 7096 50  0000 L CNN
F 1 "100µF" H 6518 7005 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6438 6900 50  0001 C CNN
F 3 "~" H 6400 7050 50  0001 C CNN
	1    6400 7050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR030
U 1 1 5DC76B70
P 6400 6900
F 0 "#PWR030" H 6400 6750 50  0001 C CNN
F 1 "+5V" H 6415 7073 50  0000 C CNN
F 2 "" H 6400 6900 50  0001 C CNN
F 3 "" H 6400 6900 50  0001 C CNN
	1    6400 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5DC77527
P 6400 7200
F 0 "#PWR035" H 6400 6950 50  0001 C CNN
F 1 "GND" H 6405 7027 50  0000 C CNN
F 2 "" H 6400 7200 50  0001 C CNN
F 3 "" H 6400 7200 50  0001 C CNN
	1    6400 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 6600 1700 6600
Text Label 1950 6400 2    50   ~ 0
SWD2
Text Label 1950 6300 2    50   ~ 0
SWD0
Text Label 950  6300 0    50   ~ 0
SWA3
Text Label 1950 6200 2    50   ~ 0
SWA2
Text Label 950  6200 0    50   ~ 0
SWA1
Text Label 1950 6100 2    50   ~ 0
SWA0
Text Label 950  6100 0    50   ~ 0
~ROW5
Text Label 1950 6000 2    50   ~ 0
~ROW4
Text Label 950  6000 0    50   ~ 0
~ROW3
Text Label 1950 5900 2    50   ~ 0
~ROW2
Text Label 950  5900 0    50   ~ 0
~ROW1
Text Label 1950 5800 2    50   ~ 0
FPD7
Text Label 950  5800 0    50   ~ 0
FPD6
Text Label 1950 5700 2    50   ~ 0
FPD5
Text Label 950  5700 0    50   ~ 0
FPD4
Text Label 1950 5600 2    50   ~ 0
FPD3
Text Label 950  5600 0    50   ~ 0
FPD2
Text Label 1950 5500 2    50   ~ 0
FPD1
Text Label 950  5500 0    50   ~ 0
FPD0
Text Label 1950 5400 2    50   ~ 0
FPA1
Text Label 950  5400 0    50   ~ 0
FPA0
Wire Wire Line
	1700 5400 1950 5400
Wire Wire Line
	1200 5400 950  5400
Text Notes 950  5050 0    50   ~ 0
From Controller/Previous Module
Wire Wire Line
	1700 6400 1950 6400
Wire Wire Line
	1700 5300 1750 5300
$Comp
L power:+5V #PWR021
U 1 1 5D758713
P 1750 5300
F 0 "#PWR021" H 1750 5150 50  0001 C CNN
F 1 "+5V" H 1765 5473 50  0000 C CNN
F 2 "" H 1750 5300 50  0001 C CNN
F 3 "" H 1750 5300 50  0001 C CNN
	1    1750 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5500 1950 5500
Wire Wire Line
	1950 6300 1700 6300
Wire Wire Line
	1950 6200 1700 6200
Wire Wire Line
	1950 6100 1700 6100
Wire Wire Line
	1950 6000 1700 6000
Wire Wire Line
	1950 5900 1700 5900
Wire Wire Line
	1950 5800 1700 5800
Wire Wire Line
	1950 5700 1700 5700
Wire Wire Line
	1950 5600 1700 5600
Wire Wire Line
	1200 5300 1150 5300
Wire Wire Line
	1200 5500 950  5500
Wire Wire Line
	1200 5600 950  5600
Wire Wire Line
	1200 5700 950  5700
Wire Wire Line
	1200 5800 950  5800
Wire Wire Line
	1200 5900 950  5900
Wire Wire Line
	1200 6000 950  6000
Wire Wire Line
	1200 6100 950  6100
Wire Wire Line
	1200 6200 950  6200
Wire Wire Line
	1200 6300 950  6300
Wire Wire Line
	1200 6400 950  6400
$Comp
L power:+5V #PWR020
U 1 1 5D7586E9
P 1150 5300
F 0 "#PWR020" H 1150 5150 50  0001 C CNN
F 1 "+5V" H 1165 5473 50  0000 C CNN
F 2 "" H 1150 5300 50  0001 C CNN
F 3 "" H 1150 5300 50  0001 C CNN
	1    1150 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 6600 3200 6600
Wire Wire Line
	2700 6500 2450 6500
Text Label 2450 6400 0    50   ~ 0
SWD3
Text Label 3450 6300 2    50   ~ 0
SWD2
Text Label 2450 6500 0    50   ~ 0
SWD1
Text Label 3450 6400 2    50   ~ 0
SWD0
Text Label 2450 6300 0    50   ~ 0
SWA3
Text Label 3450 6200 2    50   ~ 0
SWA2
Text Label 2450 6200 0    50   ~ 0
SWA1
Text Label 3450 6100 2    50   ~ 0
SWA0
Text Label 2450 6100 0    50   ~ 0
~ROW5
Text Label 3450 6000 2    50   ~ 0
~ROW4
Text Label 2450 6000 0    50   ~ 0
~ROW3
Text Label 3450 5900 2    50   ~ 0
~ROW2
Text Label 2450 5900 0    50   ~ 0
~ROW1
Text Label 3450 5800 2    50   ~ 0
FPD7
Text Label 2450 5800 0    50   ~ 0
FPD6
Text Label 3450 5700 2    50   ~ 0
FPD5
Text Label 2450 5700 0    50   ~ 0
FPD4
Text Label 3450 5600 2    50   ~ 0
FPD3
Text Label 2450 5600 0    50   ~ 0
FPD2
Text Label 3450 5500 2    50   ~ 0
FPD1
Text Label 2450 5500 0    50   ~ 0
FPD0
Text Label 3450 5400 2    50   ~ 0
FPA1
Text Label 2450 5400 0    50   ~ 0
FPA0
Wire Wire Line
	3200 5400 3450 5400
Wire Wire Line
	2700 5400 2450 5400
Text Notes 2450 5050 0    50   ~ 0
To Next Module
Wire Wire Line
	3200 6400 3450 6400
Wire Wire Line
	3200 5300 3250 5300
$Comp
L power:+5V #PWR023
U 1 1 5DA1EBA7
P 3250 5300
F 0 "#PWR023" H 3250 5150 50  0001 C CNN
F 1 "+5V" H 3265 5473 50  0000 C CNN
F 2 "" H 3250 5300 50  0001 C CNN
F 3 "" H 3250 5300 50  0001 C CNN
	1    3250 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5500 3450 5500
Wire Wire Line
	3450 6300 3200 6300
Wire Wire Line
	3450 6200 3200 6200
Wire Wire Line
	3450 6100 3200 6100
Wire Wire Line
	3450 6000 3200 6000
Wire Wire Line
	3450 5900 3200 5900
Wire Wire Line
	3450 5800 3200 5800
Wire Wire Line
	3450 5700 3200 5700
Wire Wire Line
	3450 5600 3200 5600
Wire Wire Line
	2700 5300 2650 5300
Wire Wire Line
	2700 5500 2450 5500
Wire Wire Line
	2700 5600 2450 5600
Wire Wire Line
	2700 5700 2450 5700
Wire Wire Line
	2700 5800 2450 5800
Wire Wire Line
	2700 5900 2450 5900
Wire Wire Line
	2700 6000 2450 6000
Wire Wire Line
	2700 6100 2450 6100
Wire Wire Line
	2700 6200 2450 6200
Wire Wire Line
	2700 6300 2450 6300
Wire Wire Line
	2700 6400 2450 6400
$Comp
L power:+5V #PWR022
U 1 1 5DA1EBC3
P 2650 5300
F 0 "#PWR022" H 2650 5150 50  0001 C CNN
F 1 "+5V" H 2665 5473 50  0000 C CNN
F 2 "" H 2650 5300 50  0001 C CNN
F 3 "" H 2650 5300 50  0001 C CNN
	1    2650 5300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5DA88669
P 3600 1100
F 0 "JP1" H 3600 1213 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3600 1214 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3600 1100 50  0001 C CNN
F 3 "~" H 3600 1100 50  0001 C CNN
	1    3600 1100
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5DA8922C
P 3600 1350
F 0 "JP2" H 3600 1463 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3600 1464 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3600 1350 50  0001 C CNN
F 3 "~" H 3600 1350 50  0001 C CNN
	1    3600 1350
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5DA946F0
P 3600 1600
F 0 "JP3" H 3600 1713 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3600 1714 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3600 1600 50  0001 C CNN
F 3 "~" H 3600 1600 50  0001 C CNN
	1    3600 1600
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 5DA946F7
P 3600 1850
F 0 "JP4" H 3600 1963 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3600 1964 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3600 1850 50  0001 C CNN
F 3 "~" H 3600 1850 50  0001 C CNN
	1    3600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1200 3400 1350
Wire Wire Line
	3400 1350 3450 1350
Wire Wire Line
	3300 1300 3300 1600
Wire Wire Line
	3300 1600 3450 1600
Wire Wire Line
	3200 1400 3200 1850
Wire Wire Line
	3200 1850 3450 1850
Wire Wire Line
	3750 1100 3850 1100
Wire Wire Line
	3850 1100 3850 1350
Wire Wire Line
	3850 1850 3750 1850
Wire Wire Line
	3750 1350 3850 1350
Connection ~ 3850 1350
Wire Wire Line
	3750 1600 3850 1600
Connection ~ 3850 1600
Wire Wire Line
	3850 1600 3850 1850
$Comp
L power:+5V #PWR06
U 1 1 5DB7A873
P 1700 1700
F 0 "#PWR06" H 1700 1550 50  0001 C CNN
F 1 "+5V" H 1550 1750 50  0000 C CNN
F 2 "" H 1700 1700 50  0001 C CNN
F 3 "" H 1700 1700 50  0001 C CNN
	1    1700 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1700 1700 1700
Wire Wire Line
	1750 1900 1700 1900
Wire Wire Line
	1700 1800 1700 1900
Wire Wire Line
	1750 1800 1700 1800
Connection ~ 1700 1900
$Comp
L power:GND #PWR08
U 1 1 5DB243FF
P 1700 1900
F 0 "#PWR08" H 1700 1650 50  0001 C CNN
F 1 "GND" H 1705 1727 50  0000 C CNN
F 2 "" H 1700 1900 50  0001 C CNN
F 3 "" H 1700 1900 50  0001 C CNN
	1    1700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1300 3300 1300
Wire Wire Line
	2750 1200 3400 1200
Wire Wire Line
	2750 1100 3450 1100
Text Label 3050 1400 2    50   ~ 0
~LMEN3
Text Label 3050 1300 2    50   ~ 0
~LMEN2
Text Label 3050 1200 2    50   ~ 0
~LMEN1
Text Label 3050 1100 2    50   ~ 0
~LMEN0
NoConn ~ 2750 1800
NoConn ~ 2750 1700
NoConn ~ 2750 1600
NoConn ~ 2750 1500
$Comp
L power:GND #PWR03
U 1 1 5DA63E23
P 1700 1300
F 0 "#PWR03" H 1700 1050 50  0001 C CNN
F 1 "GND" H 1550 1300 50  0000 C CNN
F 2 "" H 1700 1300 50  0001 C CNN
F 3 "" H 1700 1300 50  0001 C CNN
	1    1700 1300
	1    0    0    -1  
$EndComp
Text Label 600  1200 0    50   ~ 0
FPA1
Text Label 600  1100 0    50   ~ 0
FPA0
$Comp
L alexios:74HC138 U1
U 1 1 5CE5C1E8
P 2250 1500
F 0 "U1" H 2250 2167 50  0000 C CNN
F 1 "74HC138" H 2250 2076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2250 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2250 1500 50  0001 C CNN
	1    2250 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1400 2750 1400
Wire Wire Line
	1750 1300 1700 1300
$Comp
L power:+5V #PWR01
U 1 1 5D1F7FB5
P 4600 800
F 0 "#PWR01" H 4600 650 50  0001 C CNN
F 1 "+5V" H 4615 973 50  0000 C CNN
F 2 "" H 4600 800 50  0001 C CNN
F 3 "" H 4600 800 50  0001 C CNN
	1    4600 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5D1F72DD
P 4600 1000
F 0 "#PWR02" H 4600 750 50  0001 C CNN
F 1 "GND" H 4605 827 50  0000 C CNN
F 2 "" H 4600 1000 50  0001 C CNN
F 3 "" H 4600 1000 50  0001 C CNN
	1    4600 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5D1F63F8
P 4600 900
AR Path="/5D1F63F8" Ref="C1"  Part="1" 
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
F 0 "C1" H 4509 946 50  0000 R CNN
F 1 "100nF" H 4509 855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 900 50  0001 C CNN
F 3 "~" H 4600 900 50  0001 C CNN
	1    4600 900 
	1    0    0    -1  
$EndComp
Connection ~ 4600 1000
Connection ~ 4600 800 
$Comp
L alexios:74HC138 U1
U 2 1 5D1F5B46
P 4950 900
F 0 "U1" H 5130 946 50  0000 L CNN
F 1 "74HC138" H 5130 855 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4950 900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4950 900 50  0001 C CNN
	2    4950 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3750 4800 3750
Wire Wire Line
	4800 3250 4800 3450
Wire Wire Line
	4800 3550 4800 3750
Wire Wire Line
	4800 3550 5300 3550
Text Notes 4200 4950 0    50   ~ 0
Switch module configuration:\n\nModules A & B: short JP5 1-2 and JP6 1-2.\nModules C & D: short JP5 2-3 and JP5 2-3.
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 5CC80080
P 7600 5650
F 0 "J8" H 7680 5692 50  0000 L CNN
F 1 "Switch 7" H 7680 5601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 5650 50  0001 C CNN
F 3 "~" H 7600 5650 50  0001 C CNN
	1    7600 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 5CC8007A
P 7600 5250
F 0 "J7" H 7680 5292 50  0000 L CNN
F 1 "Switch 6" H 7680 5201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 5250 50  0001 C CNN
F 3 "~" H 7600 5250 50  0001 C CNN
	1    7600 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 5CC80074
P 7600 4850
F 0 "J6" H 7680 4892 50  0000 L CNN
F 1 "Switch 5" H 7680 4801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 4850 50  0001 C CNN
F 3 "~" H 7600 4850 50  0001 C CNN
	1    7600 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5CC8006E
P 7600 4450
F 0 "J5" H 7680 4492 50  0000 L CNN
F 1 "Switch 4" H 7680 4401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 4450 50  0001 C CNN
F 3 "~" H 7600 4450 50  0001 C CNN
	1    7600 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5CC7D359
P 7600 4050
F 0 "J4" H 7680 4092 50  0000 L CNN
F 1 "Switch 3" H 7680 4001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 4050 50  0001 C CNN
F 3 "~" H 7600 4050 50  0001 C CNN
	1    7600 4050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5CC7D1AD
P 7600 3650
F 0 "J3" H 7680 3692 50  0000 L CNN
F 1 "Switch 2" H 7680 3601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 3650 50  0001 C CNN
F 3 "~" H 7600 3650 50  0001 C CNN
	1    7600 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5CC7CDFE
P 7600 3250
F 0 "J2" H 7680 3292 50  0000 L CNN
F 1 "Switch 1" H 7680 3201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 3250 50  0001 C CNN
F 3 "~" H 7600 3250 50  0001 C CNN
	1    7600 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5CC763A5
P 7600 2850
F 0 "J1" H 7680 2892 50  0000 L CNN
F 1 "Switch 0" H 7680 2801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 2850 50  0001 C CNN
F 3 "~" H 7600 2850 50  0001 C CNN
	1    7600 2850
	1    0    0    -1  
$EndComp
Text Label 1000 7150 0    50   ~ 0
POWER
Wire Wire Line
	1250 7150 1000 7150
Text Notes 1000 7000 0    50   ~ 0
Power key switch.
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 5CCF6BC2
P 1450 7150
F 0 "J10" H 1530 7096 50  0000 L CNN
F 1 "Conn_01x02" H 1530 7051 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1450 7150 50  0001 C CNN
F 3 "~" H 1450 7150 50  0001 C CNN
	1    1450 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5E13841F
P 1250 7250
F 0 "#PWR036" H 1250 7000 50  0001 C CNN
F 1 "GND" H 1255 7077 50  0000 C CNN
F 2 "" H 1250 7250 50  0001 C CNN
F 3 "" H 1250 7250 50  0001 C CNN
	1    1250 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 2750 7150 2750
Wire Wire Line
	6300 2850 6600 2850
Entry Wire Line
	6600 3550 6700 3450
Entry Wire Line
	6600 3450 6700 3350
Entry Wire Line
	6600 3350 6700 3250
Entry Wire Line
	6600 3250 6700 3150
Entry Wire Line
	6600 3150 6700 3050
Entry Wire Line
	6600 3050 6700 2950
Entry Wire Line
	6600 2950 6700 2850
Entry Wire Line
	6600 2850 6700 2750
Entry Wire Line
	7000 5550 7100 5650
Entry Wire Line
	7000 5150 7100 5250
Entry Wire Line
	7000 4750 7100 4850
Entry Wire Line
	7000 4350 7100 4450
Entry Wire Line
	7000 3950 7100 4050
Entry Wire Line
	7000 3550 7100 3650
Entry Wire Line
	7000 3150 7100 3250
Entry Wire Line
	7000 2750 7100 2850
Entry Bus Bus
	6700 2650 6800 2550
Entry Bus Bus
	6900 2550 7000 2650
Wire Bus Line
	6800 2550 6900 2550
Text Label 7000 3350 1    50   ~ 0
~SW[0..7]
Text Notes 3950 1400 0    50   ~ 0
These configure the light module ID.
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J9
U 1 1 5D9844EE
P 5500 6950
F 0 "J9" H 5550 7075 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 5550 7076 50  0001 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A2_2x02_P4.20mm_Vertical" H 5500 6950 50  0001 C CNN
F 3 "~" H 5500 6950 50  0001 C CNN
	1    5500 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR033
U 1 1 5D98FB03
P 5300 7050
F 0 "#PWR033" H 5300 6800 50  0001 C CNN
F 1 "GND" H 5305 6877 50  0000 C CNN
F 2 "" H 5300 7050 50  0001 C CNN
F 3 "" H 5300 7050 50  0001 C CNN
	1    5300 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR034
U 1 1 5D98FD1F
P 5800 7050
F 0 "#PWR034" H 5800 6800 50  0001 C CNN
F 1 "GND" H 5805 6877 50  0000 C CNN
F 2 "" H 5800 7050 50  0001 C CNN
F 3 "" H 5800 7050 50  0001 C CNN
	1    5800 7050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR031
U 1 1 5D98FFC8
P 5300 6950
F 0 "#PWR031" H 5300 6800 50  0001 C CNN
F 1 "+5V" H 5315 7123 50  0000 C CNN
F 2 "" H 5300 6950 50  0001 C CNN
F 3 "" H 5300 6950 50  0001 C CNN
	1    5300 6950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 5D990357
P 5800 6950
F 0 "#PWR032" H 5800 6800 50  0001 C CNN
F 1 "+5V" H 5815 7123 50  0000 C CNN
F 2 "" H 5800 6950 50  0001 C CNN
F 3 "" H 5800 6950 50  0001 C CNN
	1    5800 6950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x15_Odd_Even CON1
U 1 1 5D9AA51E
P 1400 6000
F 0 "CON1" H 1450 6825 50  0000 C CNN
F 1 "Conn_02x15_Odd_Even" H 1450 6826 50  0001 C CNN
F 2 "Connector_IDC:IDC-Header_2x15_P2.54mm_Vertical" H 1400 6000 50  0001 C CNN
F 3 "~" H 1400 6000 50  0001 C CNN
	1    1400 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6500 3200 6500
Text Label 3450 6500 2    50   ~ 0
~LTSON
Wire Wire Line
	1950 6500 1700 6500
Text Label 1950 6500 2    50   ~ 0
~LTSON
Text Label 950  6500 0    50   ~ 0
SWD3
Wire Wire Line
	1200 6500 950  6500
NoConn ~ 2700 6600
$Comp
L power:GND #PWR027
U 1 1 5D75872E
P 1750 6700
F 0 "#PWR027" H 1750 6450 50  0001 C CNN
F 1 "GND" H 1755 6527 50  0000 C CNN
F 2 "" H 1750 6700 50  0001 C CNN
F 3 "" H 1750 6700 50  0001 C CNN
	1    1750 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1200 6600 950  6600
Text Label 950  6600 0    50   ~ 0
POWER
$Comp
L Connector_Generic:Conn_02x15_Odd_Even CON2
U 1 1 5D99DFE9
P 2900 6000
F 0 "CON2" H 2950 6825 50  0000 C CNN
F 1 "Conn_02x15_Odd_Even" H 2950 6826 50  0001 C CNN
F 2 "Connector_IDC:IDC-Header_2x15_P2.54mm_Vertical" H 2900 6000 50  0001 C CNN
F 3 "~" H 2900 6000 50  0001 C CNN
	1    2900 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 6600 1750 6700
Wire Wire Line
	1750 6700 1700 6700
Connection ~ 1750 6700
$Comp
L power:GND #PWR026
U 1 1 5DA3FDED
P 1200 6700
F 0 "#PWR026" H 1200 6450 50  0001 C CNN
F 1 "GND" H 1205 6527 50  0000 C CNN
F 2 "" H 1200 6700 50  0001 C CNN
F 3 "" H 1200 6700 50  0001 C CNN
	1    1200 6700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5DA40097
P 2700 6700
F 0 "#PWR028" H 2700 6450 50  0001 C CNN
F 1 "GND" H 2705 6527 50  0000 C CNN
F 2 "" H 2700 6700 50  0001 C CNN
F 3 "" H 2700 6700 50  0001 C CNN
	1    2700 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3250 6600 3250 6700
Wire Wire Line
	3200 6700 3250 6700
$Comp
L power:GND #PWR029
U 1 1 5DA1EB9F
P 3250 6700
F 0 "#PWR029" H 3250 6450 50  0001 C CNN
F 1 "GND" H 3255 6527 50  0000 C CNN
F 2 "" H 3250 6700 50  0001 C CNN
F 3 "" H 3250 6700 50  0001 C CNN
	1    3250 6700
	-1   0    0    -1  
$EndComp
Connection ~ 3250 6700
Text Label 950  6400 0    50   ~ 0
SWD1
Text Notes 1950 7350 0    50   ~ 0
Note: SWD0-1 and SWD2-3 are swapped between the two connectors.\nThis allows Modules A and B to send data on SWD0-1 and\nModules B and C on SWD2-3, so we get a 64×4 switch matrix. This\nreduces component count.
Text Notes 7050 7000 0    250  ~ 50
Front Panel Module
Text Notes 3500 4400 0    50   ~ 0
SWSEL pulled down on purpose!\n(unplugging module disables switch decoder)
Text Notes 2000 700  0    50   ~ 0
Pulling up address signals in case cable is unplugged.
Wire Wire Line
	950  3250 1300 3250
Wire Wire Line
	950  3350 1400 3350
Wire Wire Line
	950  3650 2050 3650
Wire Wire Line
	950  3750 2150 3750
Text Label 950  3050 0    50   ~ 0
FPD0
Text Label 950  3150 0    50   ~ 0
FPD1
Text Label 950  3250 0    50   ~ 0
FPD2
Text Label 950  3350 0    50   ~ 0
FPD3
Text Label 950  3450 0    50   ~ 0
FPD4
Text Label 950  3550 0    50   ~ 0
FPD5
Text Label 950  3650 0    50   ~ 0
FPD6
Text Label 950  3750 0    50   ~ 0
FPD7
$Comp
L Device:R_Small R5
U 1 1 5E4F03B5
P 1500 2900
AR Path="/5E4F03B5" Ref="R5"  Part="1" 
AR Path="/5CC02B94/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E4F03B5" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E4F03B5" Ref="R?"  Part="1" 
F 0 "R5" H 1442 2946 50  0000 R CNN
F 1 "4.7kΩ" H 1442 2855 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1500 2900 50  0001 C CNN
F 3 "~" H 1500 2900 50  0001 C CNN
	1    1500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3450 2000 3450
Wire Wire Line
	950  3150 1600 3150
Wire Wire Line
	950  3050 1500 3050
$Comp
L Device:R_Small R6
U 1 1 5E5743BF
P 1600 2900
AR Path="/5E5743BF" Ref="R6"  Part="1" 
AR Path="/5CC02B94/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E5743BF" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E5743BF" Ref="R?"  Part="1" 
F 0 "R6" H 1659 2946 50  0000 L CNN
F 1 "4.7kΩ" H 1659 2855 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1600 2900 50  0001 C CNN
F 3 "~" H 1600 2900 50  0001 C CNN
	1    1600 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5E576273
P 2000 3250
AR Path="/5E576273" Ref="R7"  Part="1" 
AR Path="/5CC02B94/5E576273" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E576273" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E576273" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E576273" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E576273" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E576273" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E576273" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E576273" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E576273" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E576273" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E576273" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E576273" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E576273" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E576273" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E576273" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E576273" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E576273" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E576273" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E576273" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E576273" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E576273" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E576273" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E576273" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E576273" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E576273" Ref="R?"  Part="1" 
F 0 "R7" H 1942 3296 50  0000 R CNN
F 1 "4.7kΩ" H 1942 3205 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2000 3250 50  0001 C CNN
F 3 "~" H 2000 3250 50  0001 C CNN
	1    2000 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5E576279
P 2100 3250
AR Path="/5E576279" Ref="R8"  Part="1" 
AR Path="/5CC02B94/5E576279" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E576279" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E576279" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E576279" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E576279" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E576279" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E576279" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E576279" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E576279" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E576279" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E576279" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E576279" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E576279" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E576279" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E576279" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E576279" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E576279" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E576279" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E576279" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E576279" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E576279" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E576279" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E576279" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E576279" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E576279" Ref="R?"  Part="1" 
F 0 "R8" H 2159 3296 50  0000 L CNN
F 1 "4.7kΩ" H 2159 3205 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2100 3250 50  0001 C CNN
F 3 "~" H 2100 3250 50  0001 C CNN
	1    2100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3000 1500 3050
Wire Wire Line
	1600 3000 1600 3150
Wire Wire Line
	2000 3350 2000 3450
Wire Wire Line
	2100 3350 2100 3550
$Comp
L Device:R_Small R10
U 1 1 5E5C257D
P 1300 3900
AR Path="/5E5C257D" Ref="R10"  Part="1" 
AR Path="/5CC02B94/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E5C257D" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E5C257D" Ref="R?"  Part="1" 
F 0 "R10" H 1242 3946 50  0000 R CNN
F 1 "4.7kΩ" H 1242 3855 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1300 3900 50  0001 C CNN
F 3 "~" H 1300 3900 50  0001 C CNN
	1    1300 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R11
U 1 1 5E5C2583
P 1400 3900
AR Path="/5E5C2583" Ref="R11"  Part="1" 
AR Path="/5CC02B94/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E5C2583" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E5C2583" Ref="R?"  Part="1" 
F 0 "R11" H 1459 3946 50  0000 L CNN
F 1 "4.7kΩ" H 1459 3855 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 3900 50  0001 C CNN
F 3 "~" H 1400 3900 50  0001 C CNN
	1    1400 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R12
U 1 1 5E5C2589
P 2050 3900
AR Path="/5E5C2589" Ref="R12"  Part="1" 
AR Path="/5CC02B94/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E5C2589" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E5C2589" Ref="R?"  Part="1" 
F 0 "R12" H 1992 3946 50  0000 R CNN
F 1 "4.7kΩ" H 1992 3855 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2050 3900 50  0001 C CNN
F 3 "~" H 2050 3900 50  0001 C CNN
	1    2050 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R13
U 1 1 5E5C258F
P 2150 3900
AR Path="/5E5C258F" Ref="R13"  Part="1" 
AR Path="/5CC02B94/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E5C258F" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E5C258F" Ref="R?"  Part="1" 
F 0 "R13" H 2209 3946 50  0000 L CNN
F 1 "4.7kΩ" H 2209 3855 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2150 3900 50  0001 C CNN
F 3 "~" H 2150 3900 50  0001 C CNN
	1    2150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3800 1300 3250
Wire Wire Line
	1400 3800 1400 3350
Wire Wire Line
	950  3550 2100 3550
Wire Wire Line
	2050 3800 2050 3650
Wire Wire Line
	2150 3800 2150 3750
Wire Wire Line
	1500 2800 1500 2750
Wire Wire Line
	1500 2750 1600 2750
Wire Wire Line
	2100 3100 2100 3150
Wire Wire Line
	2000 3150 2000 3100
Wire Wire Line
	2000 3100 2100 3100
Wire Wire Line
	1600 2800 1600 2750
$Comp
L power:+5V #PWR010
U 1 1 5E65418A
P 1500 2750
F 0 "#PWR010" H 1500 2600 50  0001 C CNN
F 1 "+5V" H 1515 2923 50  0000 C CNN
F 2 "" H 1500 2750 50  0001 C CNN
F 3 "" H 1500 2750 50  0001 C CNN
	1    1500 2750
	1    0    0    -1  
$EndComp
Connection ~ 1500 2750
Wire Wire Line
	1300 4000 1300 4050
Wire Wire Line
	1300 4050 1400 4050
Wire Wire Line
	2150 4050 2150 4000
Wire Wire Line
	2050 4000 2050 4050
Connection ~ 2050 4050
Wire Wire Line
	2050 4050 2150 4050
Wire Wire Line
	1400 4000 1400 4050
Connection ~ 1400 4050
Wire Wire Line
	1400 4050 2050 4050
$Comp
L power:GND #PWR016
U 1 1 5E68A501
P 2150 4050
F 0 "#PWR016" H 2150 3800 50  0001 C CNN
F 1 "GND" H 2155 3877 50  0000 C CNN
F 2 "" H 2150 4050 50  0001 C CNN
F 3 "" H 2150 4050 50  0001 C CNN
	1    2150 4050
	1    0    0    -1  
$EndComp
Connection ~ 2150 4050
$Comp
L power:+5V #PWR012
U 1 1 5E6A223F
P 2000 3100
F 0 "#PWR012" H 2000 2950 50  0001 C CNN
F 1 "+5V" H 2015 3273 50  0000 C CNN
F 2 "" H 2000 3100 50  0001 C CNN
F 3 "" H 2000 3100 50  0001 C CNN
	1    2000 3100
	1    0    0    -1  
$EndComp
Connection ~ 2000 3100
Wire Wire Line
	600  1100 1000 1100
Wire Wire Line
	600  1200 1150 1200
Wire Wire Line
	1000 1350 1000 1100
Connection ~ 1000 1100
Wire Wire Line
	1000 1100 1750 1100
Wire Wire Line
	1150 1350 1150 1200
Connection ~ 1150 1200
Wire Wire Line
	1150 1200 1750 1200
$Comp
L power:GND #PWR05
U 1 1 5E749D7A
P 1150 1550
F 0 "#PWR05" H 1150 1300 50  0001 C CNN
F 1 "GND" H 1250 1400 50  0000 C CNN
F 2 "" H 1150 1550 50  0001 C CNN
F 3 "" H 1150 1550 50  0001 C CNN
	1    1150 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E7499B5
P 1000 1550
F 0 "#PWR04" H 1000 1300 50  0001 C CNN
F 1 "GND" H 900 1400 50  0000 C CNN
F 2 "" H 1000 1550 50  0001 C CNN
F 3 "" H 1000 1550 50  0001 C CNN
	1    1000 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5E1D75DA
P 1150 1450
AR Path="/5E1D75DA" Ref="R2"  Part="1" 
AR Path="/5CC02B94/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E1D75DA" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E1D75DA" Ref="R?"  Part="1" 
F 0 "R2" H 1209 1496 50  0000 L CNN
F 1 "4.7kΩ" H 1209 1405 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1150 1450 50  0001 C CNN
F 3 "~" H 1150 1450 50  0001 C CNN
	1    1150 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5E1D6F31
P 1000 1450
AR Path="/5E1D6F31" Ref="R1"  Part="1" 
AR Path="/5CC02B94/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E1D6F31" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E1D6F31" Ref="R?"  Part="1" 
F 0 "R1" H 942 1496 50  0000 R CNN
F 1 "4.7kΩ" H 942 1405 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1000 1450 50  0001 C CNN
F 3 "~" H 1000 1450 50  0001 C CNN
	1    1000 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3450 5300 3450
Connection ~ 3850 1500
Wire Wire Line
	3850 1500 3850 1600
Wire Wire Line
	3850 1350 3850 1500
Wire Wire Line
	9350 4100 9000 4100
Connection ~ 9350 4100
Wire Wire Line
	9350 3200 9000 3200
Connection ~ 9350 3200
Wire Wire Line
	9350 5000 9000 5000
Connection ~ 9350 5000
Wire Wire Line
	9350 5550 9350 5000
$Comp
L power:GND #PWR024
U 1 1 5E3F066C
P 9350 5750
F 0 "#PWR024" H 9350 5500 50  0001 C CNN
F 1 "GND" H 9355 5577 50  0000 C CNN
F 2 "" H 9350 5750 50  0001 C CNN
F 3 "" H 9350 5750 50  0001 C CNN
	1    9350 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R15
U 1 1 5E3F0666
P 9350 5650
AR Path="/5E3F0666" Ref="R15"  Part="1" 
AR Path="/5CC02B94/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E3F0666" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E3F0666" Ref="R?"  Part="1" 
F 0 "R15" H 9292 5696 50  0000 R CNN
F 1 "4.7kΩ" H 9292 5605 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 5650 50  0001 C CNN
F 3 "~" H 9350 5650 50  0001 C CNN
	1    9350 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 4200 9350 4100
$Comp
L power:GND #PWR019
U 1 1 5E3DEB96
P 9350 4400
F 0 "#PWR019" H 9350 4150 50  0001 C CNN
F 1 "GND" H 9355 4227 50  0000 C CNN
F 2 "" H 9350 4400 50  0001 C CNN
F 3 "" H 9350 4400 50  0001 C CNN
	1    9350 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R14
U 1 1 5E3DEB90
P 9350 4300
AR Path="/5E3DEB90" Ref="R14"  Part="1" 
AR Path="/5CC02B94/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E3DEB90" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E3DEB90" Ref="R?"  Part="1" 
F 0 "R14" H 9292 4346 50  0000 R CNN
F 1 "4.7kΩ" H 9292 4255 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 4300 50  0001 C CNN
F 3 "~" H 9350 4300 50  0001 C CNN
	1    9350 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3300 9350 3200
$Comp
L power:GND #PWR013
U 1 1 5E3CFC14
P 9350 3500
F 0 "#PWR013" H 9350 3250 50  0001 C CNN
F 1 "GND" H 9355 3327 50  0000 C CNN
F 2 "" H 9350 3500 50  0001 C CNN
F 3 "" H 9350 3500 50  0001 C CNN
	1    9350 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5E3CFC0E
P 9350 3400
AR Path="/5E3CFC0E" Ref="R9"  Part="1" 
AR Path="/5CC02B94/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E3CFC0E" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E3CFC0E" Ref="R?"  Part="1" 
F 0 "R9" H 9292 3446 50  0000 R CNN
F 1 "4.7kΩ" H 9292 3355 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 3400 50  0001 C CNN
F 3 "~" H 9350 3400 50  0001 C CNN
	1    9350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 2300 9000 2300
Connection ~ 9350 2300
Wire Wire Line
	9350 2400 9350 2300
$Comp
L power:GND #PWR09
U 1 1 5E3A1DFB
P 9350 2600
F 0 "#PWR09" H 9350 2350 50  0001 C CNN
F 1 "GND" H 9355 2427 50  0000 C CNN
F 2 "" H 9350 2600 50  0001 C CNN
F 3 "" H 9350 2600 50  0001 C CNN
	1    9350 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5E3A1DF5
P 9350 2500
AR Path="/5E3A1DF5" Ref="R4"  Part="1" 
AR Path="/5CC02B94/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E3A1DF5" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E3A1DF5" Ref="R?"  Part="1" 
F 0 "R4" H 9292 2546 50  0000 R CNN
F 1 "4.7kΩ" H 9292 2455 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 2500 50  0001 C CNN
F 3 "~" H 9350 2500 50  0001 C CNN
	1    9350 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1400 9700 1400
Connection ~ 9350 1400
Wire Wire Line
	9350 1550 9350 1400
$Comp
L power:GND #PWR07
U 1 1 5E383904
P 9350 1750
F 0 "#PWR07" H 9350 1500 50  0001 C CNN
F 1 "GND" H 9355 1577 50  0000 C CNN
F 2 "" H 9350 1750 50  0001 C CNN
F 3 "" H 9350 1750 50  0001 C CNN
	1    9350 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5E3838FE
P 9350 1650
AR Path="/5E3838FE" Ref="R3"  Part="1" 
AR Path="/5CC02B94/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E3838FE" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E3838FE" Ref="R?"  Part="1" 
F 0 "R3" H 9292 1696 50  0000 R CNN
F 1 "4.7kΩ" H 9292 1605 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 1650 50  0001 C CNN
F 3 "~" H 9350 1650 50  0001 C CNN
	1    9350 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5E38037A
P 9500 5750
F 0 "#PWR025" H 9500 5500 50  0001 C CNN
F 1 "GND" H 9505 5577 50  0000 C CNN
F 2 "" H 9500 5750 50  0001 C CNN
F 3 "" H 9500 5750 50  0001 C CNN
	1    9500 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5300 9600 5300
Connection ~ 9500 5300
Wire Wire Line
	9500 5300 9500 5550
$Comp
L Device:R_Small R16
U 1 1 5E36DF86
P 9500 5650
AR Path="/5E36DF86" Ref="R16"  Part="1" 
AR Path="/5CC02B94/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5CC377D5/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5CC37D0C/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5CC37D11/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5CC382A2/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5CC382A7/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5CC382AC/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5CC382B1/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5CC38618/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5CC3861D/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D17E5F6/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D17E5FB/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D17E600/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D17E605/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D17E622/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D191B3C/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D191B41/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D191B46/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D191B4B/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D191B68/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D1E3362/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D1E3367/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D1E336C/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D1E3371/5E36DF86" Ref="R?"  Part="1" 
AR Path="/5D1E338D/5E36DF86" Ref="R?"  Part="1" 
F 0 "R16" H 9559 5696 50  0000 L CNN
F 1 "4.7kΩ" H 9559 5605 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9500 5650 50  0001 C CNN
F 3 "~" H 9500 5650 50  0001 C CNN
	1    9500 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 1500 9700 1500
Connection ~ 9500 1500
Connection ~ 9500 2400
Wire Wire Line
	9500 2400 9500 1500
Wire Wire Line
	9000 1400 9350 1400
Wire Wire Line
	3850 1500 9500 1500
Wire Wire Line
	9500 2400 9500 3300
Wire Wire Line
	9700 2400 9500 2400
Wire Wire Line
	9500 3300 9500 4200
Connection ~ 9500 3300
Wire Wire Line
	9700 3300 9500 3300
Wire Wire Line
	9500 4200 9500 5100
Connection ~ 9500 4200
Wire Wire Line
	9700 4200 9500 4200
Text Label 9000 1500 0    50   ~ 0
~LMEN
Wire Wire Line
	9700 5100 9500 5100
Wire Wire Line
	9600 3500 9600 4400
Wire Wire Line
	9600 4400 9600 5300
Wire Bus Line
	8700 750  8000 750 
$Sheet
S 9700 1150 1000 700 
U 5CC37D0C
F0 "sheet5CC37D06" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 9700 1300 50 
F3 "~LTSON" I L 9700 1700 50 
F4 "~LE1" I L 9700 1400 50 
F5 "~LE2" I L 9700 1500 50 
$EndSheet
$Sheet
S 9700 2050 1000 700 
U 5CC382A2
F0 "sheet5CC3829A" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 9700 2200 50 
F3 "~LTSON" I L 9700 2600 50 
F4 "~LE1" I L 9700 2300 50 
F5 "~LE2" I L 9700 2400 50 
$EndSheet
$Sheet
S 9700 2950 1000 700 
U 5CC382AC
F0 "sheet5CC3829C" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 9700 3100 50 
F3 "~LTSON" I L 9700 3500 50 
F4 "~LE1" I L 9700 3200 50 
F5 "~LE2" I L 9700 3300 50 
$EndSheet
$Sheet
S 9700 3850 1000 700 
U 5CC38618
F0 "sheet5CC38612" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 9700 4000 50 
F3 "~LTSON" I L 9700 4400 50 
F4 "~LE1" I L 9700 4100 50 
F5 "~LE2" I L 9700 4200 50 
$EndSheet
$Sheet
S 9700 4750 1000 700 
U 5CC02B94
F0 "Half Row" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 9700 4900 50 
F3 "~LTSON" I L 9700 5300 50 
F4 "~LE1" I L 9700 5000 50 
F5 "~LE2" I L 9700 5100 50 
$EndSheet
Text Label 9000 4900 0    50   ~ 0
FPD[0..7]
Text Label 9000 4000 0    50   ~ 0
FPD[0..7]
Text Label 9000 3100 0    50   ~ 0
FPD[0..7]
Text Label 9000 2200 0    50   ~ 0
FPD[0..7]
Text Label 9000 1300 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	9700 5000 9350 5000
Wire Wire Line
	9000 5300 9500 5300
Text Label 8450 750  2    50   ~ 0
FPD[0..15]
Text Label 9000 1400 0    50   ~ 0
~ROW1
Text Label 9000 2300 0    50   ~ 0
~ROW2
Text Label 9000 3200 0    50   ~ 0
~ROW3
Text Label 9000 5300 0    50   ~ 0
~LTSON
Text Label 9000 4100 0    50   ~ 0
~ROW4
Text Label 9000 5000 0    50   ~ 0
~ROW5
Connection ~ 9600 5300
Wire Wire Line
	9700 4100 9350 4100
Wire Wire Line
	9700 3200 9350 3200
Wire Wire Line
	9700 2300 9350 2300
Text Label 8800 2050 1    50   ~ 0
D[0..15]
Wire Bus Line
	8900 4900 9700 4900
Entry Bus Bus
	8800 4800 8900 4900
Wire Bus Line
	8900 4000 9700 4000
Entry Bus Bus
	8800 3900 8900 4000
Wire Bus Line
	8900 3100 9700 3100
Entry Bus Bus
	8800 3000 8900 3100
Wire Bus Line
	8900 2200 9700 2200
Entry Bus Bus
	8800 2100 8900 2200
Wire Wire Line
	9600 1700 9600 2600
Wire Wire Line
	9700 1700 9600 1700
Connection ~ 9600 4400
Wire Wire Line
	9700 4400 9600 4400
Connection ~ 9600 3500
Wire Wire Line
	9700 3500 9600 3500
Wire Wire Line
	9600 2600 9600 3500
Connection ~ 9600 2600
Wire Wire Line
	9700 2600 9600 2600
Wire Wire Line
	9600 5300 9700 5300
Wire Bus Line
	8900 1300 9700 1300
Entry Bus Bus
	8800 1200 8900 1300
Entry Bus Bus
	8700 750  8800 850 
Connection ~ 1750 5300
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5DA0A955
P 1850 5300
F 0 "#FLG0102" H 1850 5375 50  0001 C CNN
F 1 "PWR_FLAG" H 1850 5473 50  0001 C CNN
F 2 "" H 1850 5300 50  0001 C CNN
F 3 "~" H 1850 5300 50  0001 C CNN
	1    1850 5300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5DA0DB97
P 4800 3250
F 0 "#FLG0101" H 4800 3325 50  0001 C CNN
F 1 "PWR_FLAG" H 4800 3423 50  0001 C CNN
F 2 "" H 4800 3250 50  0001 C CNN
F 3 "~" H 4800 3250 50  0001 C CNN
	1    4800 3250
	1    0    0    -1  
$EndComp
Connection ~ 4800 3250
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5DA0DF81
P 4800 3750
F 0 "#FLG0103" H 4800 3825 50  0001 C CNN
F 1 "PWR_FLAG" H 4800 3923 50  0001 C CNN
F 2 "" H 4800 3750 50  0001 C CNN
F 3 "~" H 4800 3750 50  0001 C CNN
	1    4800 3750
	-1   0    0    1   
$EndComp
Connection ~ 4800 3750
Wire Wire Line
	1750 5300 1850 5300
$Comp
L power:PWR_FLAG #FLG0109
U 1 1 5DA228A5
P 1750 6600
F 0 "#FLG0109" H 1750 6675 50  0001 C CNN
F 1 "PWR_FLAG" H 1750 6773 50  0001 C CNN
F 2 "" H 1750 6600 50  0001 C CNN
F 3 "~" H 1750 6600 50  0001 C CNN
	1    1750 6600
	0    1    1    0   
$EndComp
Connection ~ 1750 6600
Wire Bus Line
	8800 850  8800 4800
Wire Bus Line
	7000 2650 7000 5550
Wire Bus Line
	6700 2650 6700 3450
$EndSCHEMATC
