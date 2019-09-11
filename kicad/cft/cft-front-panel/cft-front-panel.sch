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
	8700 750  8800 850 
Entry Bus Bus
	8800 1200 8900 1300
Wire Bus Line
	8900 1300 9700 1300
Wire Wire Line
	9600 5300 9700 5300
Wire Wire Line
	9700 2600 9600 2600
Connection ~ 9600 2600
Wire Wire Line
	9600 2600 9600 3500
Wire Wire Line
	9700 3500 9600 3500
Connection ~ 9600 3500
Wire Wire Line
	9700 4400 9600 4400
Connection ~ 9600 4400
Wire Wire Line
	9700 1700 9600 1700
Wire Wire Line
	9600 1700 9600 2600
Entry Bus Bus
	8800 2100 8900 2200
Wire Bus Line
	8900 2200 9700 2200
Entry Bus Bus
	8800 3000 8900 3100
Wire Bus Line
	8900 3100 9700 3100
Entry Bus Bus
	8800 3900 8900 4000
Wire Bus Line
	8900 4000 9700 4000
Entry Bus Bus
	8800 4800 8900 4900
Wire Bus Line
	8900 4900 9700 4900
Text Label 8800 2050 1    50   ~ 0
D[0..15]
Wire Wire Line
	9700 2300 9000 2300
Wire Wire Line
	9700 3200 9000 3200
Wire Wire Line
	9700 4100 9000 4100
Connection ~ 9600 5300
Text Label 9000 5000 0    50   ~ 0
~ROW5
Text Label 9000 4100 0    50   ~ 0
~ROW4
Text Label 9000 5300 0    50   ~ 0
~LTSON
Text Label 9000 3200 0    50   ~ 0
~ROW3
Text Label 9000 2300 0    50   ~ 0
~ROW2
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
L power:GND #PWR015
U 1 1 5CCAF5E9
P 5300 3650
F 0 "#PWR015" H 5300 3400 50  0001 C CNN
F 1 "GND" H 5305 3477 50  0000 C CNN
F 2 "" H 5300 3650 50  0001 C CNN
F 3 "" H 5300 3650 50  0001 C CNN
	1    5300 3650
	1    0    0    -1  
$EndComp
Text Label 9000 1400 0    50   ~ 0
~ROW1
Text Label 8450 750  2    50   ~ 0
FPD[0..15]
$Comp
L alexios:74HC138 U2
U 2 1 5D335BA2
P 5650 4300
F 0 "U2" H 5830 4346 50  0000 L CNN
F 1 "74HC138" H 5830 4255 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5650 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5650 4300 50  0001 C CNN
	2    5650 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5D335BA8
P 5300 4300
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
F 0 "C2" H 5209 4346 50  0000 R CNN
F 1 "100nF" H 5209 4255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5300 4300 50  0001 C CNN
F 3 "~" H 5300 4300 50  0001 C CNN
	1    5300 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5D335BAE
P 5300 4400
F 0 "#PWR017" H 5300 4150 50  0001 C CNN
F 1 "GND" H 5305 4227 50  0000 C CNN
F 2 "" H 5300 4400 50  0001 C CNN
F 3 "" H 5300 4400 50  0001 C CNN
	1    5300 4400
	1    0    0    -1  
$EndComp
Connection ~ 5300 4400
$Comp
L power:+5V #PWR016
U 1 1 5D335BB5
P 5300 4200
F 0 "#PWR016" H 5300 4050 50  0001 C CNN
F 1 "+5V" H 5315 4373 50  0000 C CNN
F 2 "" H 5300 4200 50  0001 C CNN
F 3 "" H 5300 4200 50  0001 C CNN
	1    5300 4200
	1    0    0    -1  
$EndComp
Connection ~ 5300 4200
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
Wire Wire Line
	9000 5300 9600 5300
Wire Wire Line
	9700 5000 9000 5000
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
L power:+5V #PWR013
U 1 1 5DBC1472
P 4300 3000
F 0 "#PWR013" H 4300 2850 50  0001 C CNN
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
L power:GND #PWR014
U 1 1 5DBC147B
P 4300 4000
F 0 "#PWR014" H 4300 3750 50  0001 C CNN
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
L power:+5V #PWR018
U 1 1 5DC76B70
P 6400 6900
F 0 "#PWR018" H 6400 6750 50  0001 C CNN
F 1 "+5V" H 6415 7073 50  0000 C CNN
F 2 "" H 6400 6900 50  0001 C CNN
F 3 "" H 6400 6900 50  0001 C CNN
	1    6400 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5DC77527
P 6400 7200
F 0 "#PWR019" H 6400 6950 50  0001 C CNN
F 1 "GND" H 6405 7027 50  0000 C CNN
F 2 "" H 6400 7200 50  0001 C CNN
F 3 "" H 6400 7200 50  0001 C CNN
	1    6400 7200
	1    0    0    -1  
$EndComp
Text Label 9000 1300 0    50   ~ 0
FPD[0..7]
Text Label 9000 2200 0    50   ~ 0
FPD[0..7]
Text Label 9000 3100 0    50   ~ 0
FPD[0..7]
Text Label 9000 4000 0    50   ~ 0
FPD[0..7]
Text Label 9000 4900 0    50   ~ 0
FPD[0..7]
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
L power:+5V #PWR08
U 1 1 5D758713
P 1750 5300
F 0 "#PWR08" H 1750 5150 50  0001 C CNN
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
L power:+5V #PWR01
U 1 1 5D7586E9
P 1150 5300
F 0 "#PWR01" H 1150 5150 50  0001 C CNN
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
L power:+5V #PWR011
U 1 1 5DA1EBA7
P 3250 5300
F 0 "#PWR011" H 3250 5150 50  0001 C CNN
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
L power:+5V #PWR010
U 1 1 5DA1EBC3
P 2650 5300
F 0 "#PWR010" H 2650 5150 50  0001 C CNN
F 1 "+5V" H 2665 5473 50  0000 C CNN
F 2 "" H 2650 5300 50  0001 C CNN
F 3 "" H 2650 5300 50  0001 C CNN
	1    2650 5300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5DA88669
P 3100 1100
F 0 "JP1" H 3100 1213 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3100 1214 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3100 1100 50  0001 C CNN
F 3 "~" H 3100 1100 50  0001 C CNN
	1    3100 1100
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5DA8922C
P 3100 1350
F 0 "JP2" H 3100 1463 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3100 1464 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3100 1350 50  0001 C CNN
F 3 "~" H 3100 1350 50  0001 C CNN
	1    3100 1350
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5DA946F0
P 3100 1600
F 0 "JP3" H 3100 1713 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3100 1714 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3100 1600 50  0001 C CNN
F 3 "~" H 3100 1600 50  0001 C CNN
	1    3100 1600
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 5DA946F7
P 3100 1850
F 0 "JP4" H 3100 1963 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3100 1964 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3100 1850 50  0001 C CNN
F 3 "~" H 3100 1850 50  0001 C CNN
	1    3100 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1200 2900 1350
Wire Wire Line
	2900 1350 2950 1350
Wire Wire Line
	2800 1300 2800 1600
Wire Wire Line
	2800 1600 2950 1600
Wire Wire Line
	2700 1400 2700 1850
Wire Wire Line
	2700 1850 2950 1850
Wire Wire Line
	3250 1100 3350 1100
Wire Wire Line
	3350 1100 3350 1350
Wire Wire Line
	3350 1850 3250 1850
Wire Wire Line
	3250 1350 3350 1350
Connection ~ 3350 1350
Wire Wire Line
	3350 1350 3350 1500
Wire Wire Line
	3250 1600 3350 1600
Connection ~ 3350 1600
Wire Wire Line
	3350 1600 3350 1850
$Comp
L power:+5V #PWR03
U 1 1 5DB7A873
P 1200 1700
F 0 "#PWR03" H 1200 1550 50  0001 C CNN
F 1 "+5V" H 1050 1750 50  0000 C CNN
F 2 "" H 1200 1700 50  0001 C CNN
F 3 "" H 1200 1700 50  0001 C CNN
	1    1200 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1700 1200 1700
Wire Wire Line
	1250 1900 1200 1900
Wire Wire Line
	1200 1800 1200 1900
Wire Wire Line
	1250 1800 1200 1800
Connection ~ 1200 1900
$Comp
L power:GND #PWR04
U 1 1 5DB243FF
P 1200 1900
F 0 "#PWR04" H 1200 1650 50  0001 C CNN
F 1 "GND" H 1205 1727 50  0000 C CNN
F 2 "" H 1200 1900 50  0001 C CNN
F 3 "" H 1200 1900 50  0001 C CNN
	1    1200 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1300 2800 1300
Wire Wire Line
	2250 1200 2900 1200
Wire Wire Line
	2250 1100 2950 1100
Text Label 2550 1400 2    50   ~ 0
~LMEN3
Text Label 2550 1300 2    50   ~ 0
~LMEN2
Text Label 2550 1200 2    50   ~ 0
~LMEN1
Text Label 2550 1100 2    50   ~ 0
~LMEN0
NoConn ~ 2250 1800
NoConn ~ 2250 1700
NoConn ~ 2250 1600
NoConn ~ 2250 1500
$Comp
L power:GND #PWR02
U 1 1 5DA63E23
P 1200 1300
F 0 "#PWR02" H 1200 1050 50  0001 C CNN
F 1 "GND" H 1050 1300 50  0000 C CNN
F 2 "" H 1200 1300 50  0001 C CNN
F 3 "" H 1200 1300 50  0001 C CNN
	1    1200 1300
	1    0    0    -1  
$EndComp
Text Label 900  1200 0    50   ~ 0
FPA1
Text Label 900  1100 0    50   ~ 0
FPA0
$Comp
L alexios:74HC138 U1
U 1 1 5CE5C1E8
P 1750 1500
F 0 "U1" H 1750 2167 50  0000 C CNN
F 1 "74HC138" H 1750 2076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 1750 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1750 1500 50  0001 C CNN
	1    1750 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1400 2250 1400
Wire Wire Line
	1250 1100 900  1100
Wire Wire Line
	1250 1200 900  1200
Wire Wire Line
	1250 1300 1200 1300
$Comp
L power:+5V #PWR05
U 1 1 5D1F7FB5
P 1200 2450
F 0 "#PWR05" H 1200 2300 50  0001 C CNN
F 1 "+5V" H 1215 2623 50  0000 C CNN
F 2 "" H 1200 2450 50  0001 C CNN
F 3 "" H 1200 2450 50  0001 C CNN
	1    1200 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5D1F72DD
P 1200 2650
F 0 "#PWR06" H 1200 2400 50  0001 C CNN
F 1 "GND" H 1205 2477 50  0000 C CNN
F 2 "" H 1200 2650 50  0001 C CNN
F 3 "" H 1200 2650 50  0001 C CNN
	1    1200 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5D1F63F8
P 1200 2550
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
F 0 "C1" H 1109 2596 50  0000 R CNN
F 1 "100nF" H 1109 2505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 2550 50  0001 C CNN
F 3 "~" H 1200 2550 50  0001 C CNN
	1    1200 2550
	1    0    0    -1  
$EndComp
Connection ~ 1200 2650
Connection ~ 1200 2450
$Comp
L alexios:74HC138 U1
U 2 1 5D1F5B46
P 1550 2550
F 0 "U1" H 1730 2596 50  0000 L CNN
F 1 "74HC138" H 1730 2505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1550 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1550 2550 50  0001 C CNN
	2    1550 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3750 4800 3750
Wire Wire Line
	4800 3250 4800 3450
Wire Wire Line
	4800 3450 5300 3450
Wire Wire Line
	4800 3550 4800 3750
Wire Wire Line
	4800 3550 5300 3550
Text Notes 3900 4900 0    50   ~ 0
Switch module configuration:\n\nModules A & B: short JP2A1\nModules C & D: short JP2B1.\nThe rest happens by swapping SWD0-1 and SWD2-3\non the next module output connector.
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
S 9700 1150 1000 700 
U 5CC37D0C
F0 "sheet5CC37D06" 50
F1 "cft_front-panel-halfrow.sch" 50
F2 "D[0..7]" I L 9700 1300 50 
F3 "~LTSON" I L 9700 1700 50 
F4 "~LE1" I L 9700 1400 50 
F5 "~LE2" I L 9700 1500 50 
$EndSheet
Wire Bus Line
	8700 750  8000 750 
Wire Wire Line
	9600 4400 9600 5300
Wire Wire Line
	9600 3500 9600 4400
$Comp
L Connector_Generic:Conn_01x03 J9
U 1 1 5CC80080
P 7600 5650
F 0 "J9" H 7680 5692 50  0000 L CNN
F 1 "Switch 7" H 7680 5601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 5650 50  0001 C CNN
F 3 "~" H 7600 5650 50  0001 C CNN
	1    7600 5650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 5CC8007A
P 7600 5250
F 0 "J8" H 7680 5292 50  0000 L CNN
F 1 "Switch 6" H 7680 5201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 5250 50  0001 C CNN
F 3 "~" H 7600 5250 50  0001 C CNN
	1    7600 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 5CC80074
P 7600 4850
F 0 "J7" H 7680 4892 50  0000 L CNN
F 1 "Switch 5" H 7680 4801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 4850 50  0001 C CNN
F 3 "~" H 7600 4850 50  0001 C CNN
	1    7600 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 5CC8006E
P 7600 4450
F 0 "J6" H 7680 4492 50  0000 L CNN
F 1 "Switch 4" H 7680 4401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 4450 50  0001 C CNN
F 3 "~" H 7600 4450 50  0001 C CNN
	1    7600 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5CC7D359
P 7600 4050
F 0 "J5" H 7680 4092 50  0000 L CNN
F 1 "Switch 3" H 7680 4001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 4050 50  0001 C CNN
F 3 "~" H 7600 4050 50  0001 C CNN
	1    7600 4050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5CC7D1AD
P 7600 3650
F 0 "J4" H 7680 3692 50  0000 L CNN
F 1 "Switch 2" H 7680 3601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 3650 50  0001 C CNN
F 3 "~" H 7600 3650 50  0001 C CNN
	1    7600 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5CC7CDFE
P 7600 3250
F 0 "J3" H 7680 3292 50  0000 L CNN
F 1 "Switch 1" H 7680 3201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 3250 50  0001 C CNN
F 3 "~" H 7600 3250 50  0001 C CNN
	1    7600 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5CC763A5
P 7600 2850
F 0 "J2" H 7680 2892 50  0000 L CNN
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
L Connector_Generic:Conn_01x02 J1
U 1 1 5CCF6BC2
P 1450 7150
F 0 "J1" H 1530 7096 50  0000 L CNN
F 1 "Conn_01x02" H 1530 7051 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1450 7150 50  0001 C CNN
F 3 "~" H 1450 7150 50  0001 C CNN
	1    1450 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5E13841F
P 1250 7250
F 0 "#PWR07" H 1250 7000 50  0001 C CNN
F 1 "GND" H 1255 7077 50  0000 C CNN
F 2 "" H 1250 7250 50  0001 C CNN
F 3 "" H 1250 7250 50  0001 C CNN
	1    1250 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 5100 9500 5100
Text Label 9000 1500 0    50   ~ 0
~LMEN
Wire Wire Line
	9700 4200 9500 4200
Connection ~ 9500 4200
Wire Wire Line
	9500 4200 9500 5100
Wire Wire Line
	9700 3300 9500 3300
Connection ~ 9500 3300
Wire Wire Line
	9500 3300 9500 4200
Wire Wire Line
	9700 2400 9500 2400
Wire Wire Line
	9500 2400 9500 3300
Wire Wire Line
	3350 1500 9500 1500
Connection ~ 3350 1500
Wire Wire Line
	3350 1500 3350 1600
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
Text Notes 3450 1400 0    50   ~ 0
These configure the light module ID.
Wire Wire Line
	9000 1400 9700 1400
Wire Wire Line
	9500 2400 9500 1500
Connection ~ 9500 2400
Connection ~ 9500 1500
Wire Wire Line
	9500 1500 9700 1500
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J10
U 1 1 5D9844EE
P 5500 6950
F 0 "J10" H 5550 7075 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 5550 7076 50  0001 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A2_2x02_P4.20mm_Vertical" H 5500 6950 50  0001 C CNN
F 3 "~" H 5500 6950 50  0001 C CNN
	1    5500 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR051
U 1 1 5D98FB03
P 5300 7050
F 0 "#PWR051" H 5300 6800 50  0001 C CNN
F 1 "GND" H 5305 6877 50  0000 C CNN
F 2 "" H 5300 7050 50  0001 C CNN
F 3 "" H 5300 7050 50  0001 C CNN
	1    5300 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR053
U 1 1 5D98FD1F
P 5800 7050
F 0 "#PWR053" H 5800 6800 50  0001 C CNN
F 1 "GND" H 5805 6877 50  0000 C CNN
F 2 "" H 5800 7050 50  0001 C CNN
F 3 "" H 5800 7050 50  0001 C CNN
	1    5800 7050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR050
U 1 1 5D98FFC8
P 5300 6950
F 0 "#PWR050" H 5300 6800 50  0001 C CNN
F 1 "+5V" H 5315 7123 50  0000 C CNN
F 2 "" H 5300 6950 50  0001 C CNN
F 3 "" H 5300 6950 50  0001 C CNN
	1    5300 6950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR052
U 1 1 5D990357
P 5800 6950
F 0 "#PWR052" H 5800 6800 50  0001 C CNN
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
L power:GND #PWR09
U 1 1 5D75872E
P 1750 6700
F 0 "#PWR09" H 1750 6450 50  0001 C CNN
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
L power:GND #PWR0101
U 1 1 5DA3FDED
P 1200 6700
F 0 "#PWR0101" H 1200 6450 50  0001 C CNN
F 1 "GND" H 1205 6527 50  0000 C CNN
F 2 "" H 1200 6700 50  0001 C CNN
F 3 "" H 1200 6700 50  0001 C CNN
	1    1200 6700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5DA40097
P 2700 6700
F 0 "#PWR0102" H 2700 6450 50  0001 C CNN
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
L power:GND #PWR012
U 1 1 5DA1EB9F
P 3250 6700
F 0 "#PWR012" H 3250 6450 50  0001 C CNN
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
Wire Bus Line
	8800 850  8800 4800
Wire Bus Line
	7000 2650 7000 5550
Wire Bus Line
	6700 2650 6700 3450
$EndSCHEMATC
