EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 13 14
Title "Bus Hold"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 "Needs cleanup!"
Comment3 ""
Comment4 ""
$EndDescr
Wire Bus Line
	1850 6650 1250 6650
Wire Bus Line
	1250 6750 1850 6750
Text Label 1350 6650 0    50   ~ 0
AB[0..23]
Text Label 1350 6750 0    50   ~ 0
DB[0..15]
Text HLabel 1250 6650 0    50   UnSpc ~ 0
AB[0..23]
Text HLabel 1250 6750 0    50   UnSpc ~ 0
DB[0..15]
Wire Bus Line
	1250 7050 1850 7050
Text Label 1350 7050 0    50   ~ 0
FPD[0..7]
Wire Bus Line
	1850 6950 1250 6950
Text Label 1350 6950 0    50   ~ 0
IBUS[0..15]
Text HLabel 1250 6950 0    50   UnSpc ~ 0
IBUS[0..15]
Text HLabel 6800 1900 0    50   UnSpc ~ 0
CLK1
Text HLabel 6800 2000 0    50   UnSpc ~ 0
CLK2
Text HLabel 8900 1900 0    50   UnSpc ~ 0
WSTB
Text HLabel 8900 2000 0    50   UnSpc ~ 0
T34
Wire Bus Line
	1850 7150 1250 7150
Wire Bus Line
	1850 7250 1250 7250
Wire Bus Line
	1850 7350 1250 7350
Text Label 1350 7150 0    50   ~ 0
ACTION[0..3]
Text Label 1350 7250 0    50   ~ 0
WADDR[0..4]
Text Label 1350 7350 0    50   ~ 0
RADDR[0..4]
Text HLabel 1250 7150 0    50   UnSpc ~ 0
ACTION[0..3]
Text HLabel 1250 7250 0    50   UnSpc ~ 0
WADDR[0..4]
Text HLabel 1250 7350 0    50   UnSpc ~ 0
RADDR[0..4]
$Comp
L Device:C_Small C?
U 1 1 5DF06667
P 3600 2600
AR Path="/5D78E680/5DF06667" Ref="C?"  Part="1" 
AR Path="/5D363063/5DF06667" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5DF06667" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF06667" Ref="C1102"  Part="1" 
F 0 "C1102" H 3509 2646 50  0000 R CNN
F 1 "100nF" H 3509 2555 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3600 2600 50  0001 C CNN
F 3 "~" H 3600 2600 50  0001 C CNN
	1    3600 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0666D
P 3600 2850
AR Path="/5D78E680/5DF0666D" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DF0666D" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DF0666D" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0666D" Ref="#PWR01104"  Part="1" 
F 0 "#PWR01104" H 3600 2600 50  0001 C CNN
F 1 "GND" H 3605 2677 50  0000 C CNN
F 2 "" H 3600 2850 50  0001 C CNN
F 3 "" H 3600 2850 50  0001 C CNN
	1    3600 2850
	-1   0    0    -1  
$EndComp
Text HLabel 4850 1900 0    50   UnSpc ~ 0
CLK3
Text HLabel 4850 2000 0    50   UnSpc ~ 0
CLK4
$Comp
L power:+5V #PWR?
U 1 1 5DF06661
P 3600 2400
AR Path="/5D78E680/5DF06661" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DF06661" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DF06661" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF06661" Ref="#PWR01103"  Part="1" 
F 0 "#PWR01103" H 3600 2250 50  0001 C CNN
F 1 "+5V" H 3542 2437 50  0000 R CNN
F 2 "" H 3600 2400 50  0001 C CNN
F 3 "" H 3600 2400 50  0001 C CNN
	1    3600 2400
	1    0    0    -1  
$EndComp
Text HLabel 1250 7450 0    50   UnSpc ~ 0
FPD[0..7]
Wire Bus Line
	1250 7450 1850 7450
Text Label 1350 7450 0    50   ~ 0
FPD[0..7]
Text Label 2750 4450 0    50   ~ 0
~MEM
Text Label 3050 1900 0    50   ~ 0
~R
Text Label 3050 2000 0    50   ~ 0
~W
$Comp
L alexios:SN74ACT1071 U1102
U 1 1 5DD2D8B9
P 3950 1600
F 0 "U1102" H 4280 1696 50  0000 L CNN
F 1 "SN74ACT1071" H 4280 1605 50  0000 L CNN
F 2 "alexios:SOIC-14" H 3650 1950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 3650 1950 50  0001 C CNN
	1    3950 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1100 3050 1100
Wire Wire Line
	3450 1200 3050 1200
Wire Wire Line
	3450 1300 3050 1300
Wire Wire Line
	3450 1400 3050 1400
Wire Wire Line
	3450 1500 3050 1500
Wire Wire Line
	3450 1600 3050 1600
Wire Wire Line
	3450 1700 3050 1700
Wire Wire Line
	3450 1800 3050 1800
Wire Wire Line
	2950 1900 3450 1900
Wire Wire Line
	2950 2000 3450 2000
$Comp
L alexios:SN74ACT1071 U1102
U 2 1 5DD6AC9A
P 3950 2900
F 0 "U1102" H 4130 3259 50  0000 L CNN
F 1 "SN74ACT1071" H 4130 3168 50  0000 L CNN
F 2 "alexios:SOIC-14" H 3650 3250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 3650 3250 50  0001 C CNN
	2    3950 2900
	1    0    0    -1  
$EndComp
Text Label 3050 1100 0    50   ~ 0
DB0
Text Label 3050 1200 0    50   ~ 0
DB1
Text Label 3050 1300 0    50   ~ 0
DB2
Text Label 3050 1400 0    50   ~ 0
DB3
Text Label 3050 1500 0    50   ~ 0
DB4
Text Label 3050 1600 0    50   ~ 0
DB5
Text Label 3050 1700 0    50   ~ 0
DB6
Text Label 3050 1800 0    50   ~ 0
DB7
Wire Wire Line
	3600 2800 3600 2850
$Comp
L Device:C_Small C?
U 1 1 5DDD0CD3
P 5500 2600
AR Path="/5D78E680/5DDD0CD3" Ref="C?"  Part="1" 
AR Path="/5D363063/5DDD0CD3" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5DDD0CD3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DDD0CD3" Ref="C1103"  Part="1" 
F 0 "C1103" H 5409 2646 50  0000 R CNN
F 1 "100nF" H 5409 2555 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5500 2600 50  0001 C CNN
F 3 "~" H 5500 2600 50  0001 C CNN
	1    5500 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDD0CD9
P 5500 2850
AR Path="/5D78E680/5DDD0CD9" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DDD0CD9" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DDD0CD9" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DDD0CD9" Ref="#PWR01106"  Part="1" 
F 0 "#PWR01106" H 5500 2600 50  0001 C CNN
F 1 "GND" H 5505 2677 50  0000 C CNN
F 2 "" H 5500 2850 50  0001 C CNN
F 3 "" H 5500 2850 50  0001 C CNN
	1    5500 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5500 2400 5500 2500
$Comp
L power:+5V #PWR?
U 1 1 5DDD0CE0
P 5500 2400
AR Path="/5D78E680/5DDD0CE0" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DDD0CE0" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DDD0CE0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DDD0CE0" Ref="#PWR01105"  Part="1" 
F 0 "#PWR01105" H 5500 2250 50  0001 C CNN
F 1 "+5V" H 5442 2437 50  0000 R CNN
F 2 "" H 5500 2400 50  0001 C CNN
F 3 "" H 5500 2400 50  0001 C CNN
	1    5500 2400
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U1103
U 1 1 5DDD0CE6
P 5850 1600
F 0 "U1103" H 6180 1696 50  0000 L CNN
F 1 "SN74ACT1071" H 6180 1605 50  0000 L CNN
F 2 "alexios:SOIC-14" H 5550 1950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 5550 1950 50  0001 C CNN
	1    5850 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1100 4950 1100
Wire Wire Line
	5350 1200 4950 1200
Wire Wire Line
	5350 1300 4950 1300
Wire Wire Line
	5350 1400 4950 1400
Wire Wire Line
	5350 1500 4950 1500
Wire Wire Line
	5350 1600 4950 1600
Wire Wire Line
	5350 1700 4950 1700
Wire Wire Line
	5350 1800 4950 1800
Wire Wire Line
	4850 1900 5350 1900
Wire Wire Line
	4850 2000 5350 2000
$Comp
L alexios:SN74ACT1071 U1103
U 2 1 5DDD0CF6
P 5850 2900
F 0 "U1103" H 6030 3259 50  0000 L CNN
F 1 "SN74ACT1071" H 6030 3168 50  0000 L CNN
F 2 "alexios:SOIC-14" H 5550 3250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 5550 3250 50  0001 C CNN
	2    5850 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2700 5500 2800
Connection ~ 5500 2400
Connection ~ 5500 2500
Connection ~ 5500 2700
Connection ~ 5500 2800
Wire Wire Line
	5500 2800 5500 2850
Text Label 4950 1100 0    50   ~ 0
IBUS8
Text Label 4950 1200 0    50   ~ 0
IBUS9
Text Label 4950 1300 0    50   ~ 0
IBUS10
Text Label 4950 1400 0    50   ~ 0
IBUS11
Text Label 4950 1500 0    50   ~ 0
IBUS12
Text Label 4950 1600 0    50   ~ 0
IBUS13
Text Label 4950 1700 0    50   ~ 0
IBUS14
Text Label 4950 1800 0    50   ~ 0
IBUS15
$Comp
L Device:C_Small C?
U 1 1 5DE4E3AD
P 7450 2600
AR Path="/5D78E680/5DE4E3AD" Ref="C?"  Part="1" 
AR Path="/5D363063/5DE4E3AD" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5DE4E3AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DE4E3AD" Ref="C1104"  Part="1" 
F 0 "C1104" H 7359 2646 50  0000 R CNN
F 1 "100nF" H 7359 2555 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7450 2600 50  0001 C CNN
F 3 "~" H 7450 2600 50  0001 C CNN
	1    7450 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE4E3B3
P 7450 2850
AR Path="/5D78E680/5DE4E3B3" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DE4E3B3" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DE4E3B3" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DE4E3B3" Ref="#PWR01108"  Part="1" 
F 0 "#PWR01108" H 7450 2600 50  0001 C CNN
F 1 "GND" H 7455 2677 50  0000 C CNN
F 2 "" H 7450 2850 50  0001 C CNN
F 3 "" H 7450 2850 50  0001 C CNN
	1    7450 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7450 2400 7450 2500
$Comp
L power:+5V #PWR?
U 1 1 5DE4E3BA
P 7450 2400
AR Path="/5D78E680/5DE4E3BA" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DE4E3BA" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DE4E3BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DE4E3BA" Ref="#PWR01107"  Part="1" 
F 0 "#PWR01107" H 7450 2250 50  0001 C CNN
F 1 "+5V" H 7392 2437 50  0000 R CNN
F 2 "" H 7450 2400 50  0001 C CNN
F 3 "" H 7450 2400 50  0001 C CNN
	1    7450 2400
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U1104
U 1 1 5DE4E3C0
P 7800 1600
F 0 "U1104" H 8130 1696 50  0000 L CNN
F 1 "SN74ACT1071" H 8130 1605 50  0000 L CNN
F 2 "alexios:SOIC-14" H 7500 1950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 7500 1950 50  0001 C CNN
	1    7800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 1100 6900 1100
Wire Wire Line
	7300 1200 6900 1200
Wire Wire Line
	7300 1300 6900 1300
Wire Wire Line
	7300 1400 6900 1400
Wire Wire Line
	7300 1500 6900 1500
Wire Wire Line
	7300 1600 6900 1600
Wire Wire Line
	7300 1700 6900 1700
Wire Wire Line
	7300 1800 6900 1800
Wire Wire Line
	6800 1900 7300 1900
Wire Wire Line
	6800 2000 7300 2000
$Comp
L alexios:SN74ACT1071 U1104
U 2 1 5DE4E3D0
P 7800 2900
F 0 "U1104" H 7980 3259 50  0000 L CNN
F 1 "SN74ACT1071" H 7980 3168 50  0000 L CNN
F 2 "alexios:SOIC-14" H 7500 3250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 7500 3250 50  0001 C CNN
	2    7800 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2700 7450 2800
Connection ~ 7450 2400
Connection ~ 7450 2500
Connection ~ 7450 2700
Connection ~ 7450 2800
Wire Wire Line
	7450 2800 7450 2850
Text Label 6900 1100 0    50   ~ 0
AB8
Text Label 6900 1200 0    50   ~ 0
AB9
Text Label 6900 1300 0    50   ~ 0
AB10
Text Label 6900 1400 0    50   ~ 0
AB11
Text Label 6900 1500 0    50   ~ 0
AB12
Text Label 6900 1600 0    50   ~ 0
AB13
Text Label 6900 1700 0    50   ~ 0
AB14
Text Label 6900 1800 0    50   ~ 0
AB15
$Comp
L Device:C_Small C?
U 1 1 5DECF819
P 9550 2600
AR Path="/5D78E680/5DECF819" Ref="C?"  Part="1" 
AR Path="/5D363063/5DECF819" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5DECF819" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DECF819" Ref="C1105"  Part="1" 
F 0 "C1105" H 9459 2646 50  0000 R CNN
F 1 "100nF" H 9459 2555 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2600 50  0001 C CNN
F 3 "~" H 9550 2600 50  0001 C CNN
	1    9550 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DECF81F
P 9550 2850
AR Path="/5D78E680/5DECF81F" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DECF81F" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DECF81F" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DECF81F" Ref="#PWR01110"  Part="1" 
F 0 "#PWR01110" H 9550 2600 50  0001 C CNN
F 1 "GND" H 9555 2677 50  0000 C CNN
F 2 "" H 9550 2850 50  0001 C CNN
F 3 "" H 9550 2850 50  0001 C CNN
	1    9550 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9550 2400 9550 2500
$Comp
L power:+5V #PWR?
U 1 1 5DECF826
P 9550 2400
AR Path="/5D78E680/5DECF826" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DECF826" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DECF826" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DECF826" Ref="#PWR01109"  Part="1" 
F 0 "#PWR01109" H 9550 2250 50  0001 C CNN
F 1 "+5V" H 9492 2437 50  0000 R CNN
F 2 "" H 9550 2400 50  0001 C CNN
F 3 "" H 9550 2400 50  0001 C CNN
	1    9550 2400
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U1105
U 1 1 5DECF82C
P 9900 1600
F 0 "U1105" H 10230 1696 50  0000 L CNN
F 1 "SN74ACT1071" H 10230 1605 50  0000 L CNN
F 2 "alexios:SOIC-14" H 9600 1950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 9600 1950 50  0001 C CNN
	1    9900 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 1100 9000 1100
Wire Wire Line
	9400 1200 9000 1200
Wire Wire Line
	9400 1300 9000 1300
Wire Wire Line
	9400 1400 9000 1400
Wire Wire Line
	9400 1500 9000 1500
Wire Wire Line
	9400 1600 9000 1600
Wire Wire Line
	9400 1700 9000 1700
Wire Wire Line
	9400 1800 9000 1800
Wire Wire Line
	8900 1900 9400 1900
Wire Wire Line
	8900 2000 9400 2000
$Comp
L alexios:SN74ACT1071 U1105
U 2 1 5DECF83C
P 9900 2900
F 0 "U1105" H 10080 3259 50  0000 L CNN
F 1 "SN74ACT1071" H 10080 3168 50  0000 L CNN
F 2 "alexios:SOIC-14" H 9600 3250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 9600 3250 50  0001 C CNN
	2    9900 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 2700 9550 2800
Connection ~ 9550 2400
Connection ~ 9550 2500
Connection ~ 9550 2700
Connection ~ 9550 2800
Wire Wire Line
	9550 2800 9550 2850
Text Label 9000 1100 0    50   ~ 0
AB16
Text Label 9000 1200 0    50   ~ 0
AB17
Text Label 9000 1300 0    50   ~ 0
AB18
Text Label 9000 1400 0    50   ~ 0
AB19
Text Label 9000 1500 0    50   ~ 0
AB20
Text Label 9000 1600 0    50   ~ 0
AB21
Text Label 9000 1700 0    50   ~ 0
AB22
Wire Wire Line
	1600 3000 1600 3100
$Comp
L power:+5V #PWR?
U 1 1 5D758B59
P 1600 3000
AR Path="/5D78E680/5D758B59" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D758B59" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D758B59" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D758B59" Ref="#PWR01101"  Part="1" 
F 0 "#PWR01101" H 1600 2850 50  0001 C CNN
F 1 "+5V" H 1542 3037 50  0000 R CNN
F 2 "" H 1600 3000 50  0001 C CNN
F 3 "" H 1600 3000 50  0001 C CNN
	1    1600 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D758B45
P 1600 3450
AR Path="/5D78E680/5D758B45" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D758B45" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D758B45" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D758B45" Ref="#PWR01102"  Part="1" 
F 0 "#PWR01102" H 1600 3200 50  0001 C CNN
F 1 "GND" H 1605 3277 50  0000 C CNN
F 2 "" H 1600 3450 50  0001 C CNN
F 3 "" H 1600 3450 50  0001 C CNN
	1    1600 3450
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D758B3F
P 1600 3200
AR Path="/5D78E680/5D758B3F" Ref="C?"  Part="1" 
AR Path="/5D363063/5D758B3F" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D758B3F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D758B3F" Ref="C1101"  Part="1" 
F 0 "C1101" H 1509 3246 50  0000 R CNN
F 1 "100nF" H 1509 3155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1600 3200 50  0001 C CNN
F 3 "~" H 1600 3200 50  0001 C CNN
	1    1600 3200
	1    0    0    1   
$EndComp
Text Label 1050 1750 0    50   ~ 0
AB7
Text Label 1050 1650 0    50   ~ 0
AB6
Text Label 1050 1550 0    50   ~ 0
AB5
Text Label 1050 1450 0    50   ~ 0
AB4
Text Label 1050 1350 0    50   ~ 0
AB3
Text Label 1050 1250 0    50   ~ 0
AB2
Text Label 1050 1150 0    50   ~ 0
AB1
Text Label 1050 1050 0    50   ~ 0
AB0
Wire Wire Line
	1450 1750 1050 1750
Wire Wire Line
	1450 1650 1050 1650
Wire Wire Line
	1450 1550 1050 1550
Wire Wire Line
	1450 1450 1050 1450
Wire Wire Line
	1450 1350 1050 1350
Wire Wire Line
	1450 1250 1050 1250
Wire Wire Line
	1450 1150 1050 1150
Wire Wire Line
	1450 1050 1050 1050
Wire Wire Line
	1600 3400 1600 3300
Wire Wire Line
	1600 3400 1600 3450
Connection ~ 1600 3400
Connection ~ 1600 3300
Connection ~ 1600 3100
Connection ~ 1600 3000
$Comp
L alexios:SN74ACT1073 U1101
U 2 1 5D837450
P 1950 3500
F 0 "U1101" H 2130 3859 50  0000 L CNN
F 1 "SN74ACT1073" H 2130 3768 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1650 3850 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1073.pdf" H 1650 3850 50  0001 C CNN
	2    1950 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  2550 1450 2550
Text Label 950  2550 0    50   ~ 0
IBUS0
Text Label 950  2450 0    50   ~ 0
IBUS1
Wire Wire Line
	950  2450 1450 2450
Text Label 950  2350 0    50   ~ 0
IBUS2
Wire Wire Line
	950  2350 1450 2350
Wire Wire Line
	950  2250 1450 2250
Text Label 950  2250 0    50   ~ 0
IBUS3
Wire Wire Line
	950  2150 1450 2150
Text Label 950  2150 0    50   ~ 0
IBUS4
Text Label 950  2050 0    50   ~ 0
IBUS5
Wire Wire Line
	950  2050 1450 2050
Text Label 950  1850 0    50   ~ 0
IBUS7
Text Label 950  1950 0    50   ~ 0
IBUS6
Wire Wire Line
	950  1850 1450 1850
Wire Wire Line
	950  1950 1450 1950
Text Label 9000 1800 0    50   ~ 0
AB23
$Comp
L Device:C_Small C?
U 1 1 5DFDF8A0
P 5500 5650
AR Path="/5D78E680/5DFDF8A0" Ref="C?"  Part="1" 
AR Path="/5D363063/5DFDF8A0" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5DFDF8A0" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DFDF8A0" Ref="C1107"  Part="1" 
F 0 "C1107" H 5409 5696 50  0000 R CNN
F 1 "100nF" H 5409 5605 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5500 5650 50  0001 C CNN
F 3 "~" H 5500 5650 50  0001 C CNN
	1    5500 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DFDF8A6
P 5500 5900
AR Path="/5D78E680/5DFDF8A6" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DFDF8A6" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DFDF8A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DFDF8A6" Ref="#PWR01116"  Part="1" 
F 0 "#PWR01116" H 5500 5650 50  0001 C CNN
F 1 "GND" H 5505 5727 50  0000 C CNN
F 2 "" H 5500 5900 50  0001 C CNN
F 3 "" H 5500 5900 50  0001 C CNN
	1    5500 5900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5500 5450 5500 5550
$Comp
L power:+5V #PWR?
U 1 1 5DFDF8AD
P 5500 5450
AR Path="/5D78E680/5DFDF8AD" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DFDF8AD" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DFDF8AD" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DFDF8AD" Ref="#PWR01115"  Part="1" 
F 0 "#PWR01115" H 5500 5300 50  0001 C CNN
F 1 "+5V" H 5442 5487 50  0000 R CNN
F 2 "" H 5500 5450 50  0001 C CNN
F 3 "" H 5500 5450 50  0001 C CNN
	1    5500 5450
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U1107
U 1 1 5DFDF8B3
P 6000 4050
F 0 "U1107" H 6330 4146 50  0000 L CNN
F 1 "SN74ACT1071" H 6330 4055 50  0000 L CNN
F 2 "alexios:SOIC-14" H 5700 4400 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 5700 4400 50  0001 C CNN
	1    6000 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3550 5100 3550
Wire Wire Line
	5500 3650 5100 3650
Wire Wire Line
	5500 4250 5100 4250
Wire Wire Line
	5500 3850 5100 3850
Wire Wire Line
	5500 3950 5100 3950
Wire Wire Line
	5500 3750 5100 3750
Wire Wire Line
	5500 4350 5100 4350
Wire Wire Line
	5100 4450 5500 4450
$Comp
L alexios:SN74ACT1071 U1107
U 2 1 5DFDF8C3
P 5850 5950
F 0 "U1107" H 6030 6309 50  0000 L CNN
F 1 "SN74ACT1071" H 6030 6218 50  0000 L CNN
F 2 "alexios:SOIC-14" H 5550 6300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 5550 6300 50  0001 C CNN
	2    5850 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5750 5500 5850
Connection ~ 5500 5450
Connection ~ 5500 5550
Connection ~ 5500 5750
Connection ~ 5500 5850
Wire Wire Line
	5500 5850 5500 5900
Text Label 5100 4450 0    50   ~ 0
FPD1
Text Label 5100 3550 0    50   ~ 0
FPD0
Text Label 5100 3650 0    50   ~ 0
FPD2
Text Label 5100 4350 0    50   ~ 0
FPD3
Text Label 5100 4250 0    50   ~ 0
FPD4
Text Label 5100 3750 0    50   ~ 0
FPD5
Text Label 5100 3850 0    50   ~ 0
FPD6
Text Label 5100 3950 0    50   ~ 0
FPD7
$Comp
L Device:C_Small C?
U 1 1 5E0C40A2
P 3150 5750
AR Path="/5D78E680/5E0C40A2" Ref="C?"  Part="1" 
AR Path="/5D363063/5E0C40A2" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5E0C40A2" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5E0C40A2" Ref="C1106"  Part="1" 
F 0 "C1106" H 3059 5796 50  0000 R CNN
F 1 "100nF" H 3059 5705 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3150 5750 50  0001 C CNN
F 3 "~" H 3150 5750 50  0001 C CNN
	1    3150 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0C40A8
P 3150 6000
AR Path="/5D78E680/5E0C40A8" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5E0C40A8" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5E0C40A8" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5E0C40A8" Ref="#PWR01112"  Part="1" 
F 0 "#PWR01112" H 3150 5750 50  0001 C CNN
F 1 "GND" H 3155 5827 50  0000 C CNN
F 2 "" H 3150 6000 50  0001 C CNN
F 3 "" H 3150 6000 50  0001 C CNN
	1    3150 6000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3150 5550 3150 5650
$Comp
L power:+5V #PWR?
U 1 1 5E0C40AF
P 3150 5550
AR Path="/5D78E680/5E0C40AF" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5E0C40AF" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5E0C40AF" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5E0C40AF" Ref="#PWR01111"  Part="1" 
F 0 "#PWR01111" H 3150 5400 50  0001 C CNN
F 1 "+5V" H 3092 5587 50  0000 R CNN
F 2 "" H 3150 5550 50  0001 C CNN
F 3 "" H 3150 5550 50  0001 C CNN
	1    3150 5550
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U1106
U 1 1 5E0C40B5
P 3650 4150
F 0 "U1106" H 3980 4246 50  0000 L CNN
F 1 "SN74ACT1071" H 3980 4155 50  0000 L CNN
F 2 "alexios:SOIC-14" H 3350 4500 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 3350 4500 50  0001 C CNN
	1    3650 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3650 2750 3650
Wire Wire Line
	3150 3750 2750 3750
Wire Wire Line
	3150 3850 2750 3850
Wire Wire Line
	3150 3950 2750 3950
Wire Wire Line
	3150 4050 2750 4050
Wire Wire Line
	3150 4150 2750 4150
Wire Wire Line
	3150 4250 2750 4250
Wire Wire Line
	3150 4350 2750 4350
Wire Wire Line
	2650 4450 3150 4450
Wire Wire Line
	2650 4550 3150 4550
$Comp
L alexios:SN74ACT1071 U1106
U 2 1 5E0C40C5
P 3500 6050
F 0 "U1106" H 3680 6409 50  0000 L CNN
F 1 "SN74ACT1071" H 3680 6318 50  0000 L CNN
F 2 "alexios:SOIC-14" H 3200 6400 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 3200 6400 50  0001 C CNN
	2    3500 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5850 3150 5950
Connection ~ 3150 5550
Connection ~ 3150 5650
Connection ~ 3150 5850
Connection ~ 3150 5950
Wire Wire Line
	3150 5950 3150 6000
Text Label 2750 3650 0    50   ~ 0
DB8
Text Label 2750 3750 0    50   ~ 0
DB9
Text Label 2750 3850 0    50   ~ 0
DB10
Text Label 2750 3950 0    50   ~ 0
DB11
Text Label 2750 4050 0    50   ~ 0
DB12
Text Label 2750 4150 0    50   ~ 0
DB13
Text Label 2750 4250 0    50   ~ 0
DB14
Text Label 2750 4350 0    50   ~ 0
DB15
NoConn ~ 5500 4050
NoConn ~ 5500 4150
Text Label 4950 1900 0    50   ~ 0
CLK3
Text Label 4950 2000 0    50   ~ 0
CLK4
Text Label 6900 1900 0    50   ~ 0
CLK1
Text Label 6900 2000 0    50   ~ 0
CLK2
Text Label 9000 1900 0    50   ~ 0
WSTB
Text Label 9000 2000 0    50   ~ 0
T34
$Comp
L Device:C_Small C?
U 1 1 5D92539B
P 7550 5550
AR Path="/5D78E680/5D92539B" Ref="C?"  Part="1" 
AR Path="/5D363063/5D92539B" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D92539B" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D92539B" Ref="C1108"  Part="1" 
F 0 "C1108" H 7459 5596 50  0000 R CNN
F 1 "100nF" H 7459 5505 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7550 5550 50  0001 C CNN
F 3 "~" H 7550 5550 50  0001 C CNN
	1    7550 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9253A2
P 7550 5800
AR Path="/5D78E680/5D9253A2" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D9253A2" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D9253A2" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D9253A2" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 7550 5550 50  0001 C CNN
F 1 "GND" H 7555 5627 50  0000 C CNN
F 2 "" H 7550 5800 50  0001 C CNN
F 3 "" H 7550 5800 50  0001 C CNN
	1    7550 5800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7700 3350 7300 3350
Wire Wire Line
	7700 3450 7300 3450
Wire Wire Line
	7700 3550 7300 3550
Wire Wire Line
	7700 3650 7300 3650
Wire Wire Line
	7700 4450 7300 4450
Wire Wire Line
	7700 4550 7300 4550
Wire Wire Line
	7700 4650 7300 4650
Wire Wire Line
	7300 4850 7700 4850
Text Label 7300 3350 0    50   ~ 0
RADDR0
Text Label 7300 3450 0    50   ~ 0
RADDR1
Text Label 7300 3550 0    50   ~ 0
RADDR2
Text Label 7300 3650 0    50   ~ 0
RADDR3
Text Label 7300 3750 0    50   ~ 0
RADDR4
Wire Wire Line
	7700 3750 7300 3750
Wire Wire Line
	7700 4750 7300 4750
Text Label 7300 4850 0    50   ~ 0
WADDR0
Text Label 7300 4750 0    50   ~ 0
WADDR1
Text Label 7300 4650 0    50   ~ 0
WADDR2
Text Label 7300 4550 0    50   ~ 0
WADDR3
Text Label 7300 4450 0    50   ~ 0
WADDR4
$Comp
L alexios:SN74ACT1073 U1101
U 1 1 5D82DE62
P 1950 1550
F 0 "U1101" H 2280 1346 50  0000 L CNN
F 1 "SN74ACT1073" H 2280 1255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1650 1900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1073.pdf" H 1650 1900 50  0001 C CNN
	1    1950 1550
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1073 U1108
U 1 1 5DAAD656
P 8200 3850
F 0 "U1108" H 8530 3646 50  0000 L CNN
F 1 "SN74ACT1073" H 8530 3555 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 7900 4200 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1073.pdf" H 7900 4200 50  0001 C CNN
	1    8200 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1073 U1108
U 2 1 5DAD5BD2
P 7900 5850
F 0 "U1108" H 8080 6209 50  0000 L CNN
F 1 "SN74ACT1073" H 8080 6118 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 7600 6200 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1073.pdf" H 7600 6200 50  0001 C CNN
	2    7900 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DBBDE43
P 9700 5550
AR Path="/5D78E680/5DBBDE43" Ref="C?"  Part="1" 
AR Path="/5D363063/5DBBDE43" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5DBBDE43" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DBBDE43" Ref="C1109"  Part="1" 
F 0 "C1109" H 9609 5596 50  0000 R CNN
F 1 "100nF" H 9609 5505 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9700 5550 50  0001 C CNN
F 3 "~" H 9700 5550 50  0001 C CNN
	1    9700 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DBBDE4A
P 9700 5800
AR Path="/5D78E680/5DBBDE4A" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DBBDE4A" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DBBDE4A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DBBDE4A" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 9700 5550 50  0001 C CNN
F 1 "GND" H 9705 5627 50  0000 C CNN
F 2 "" H 9700 5800 50  0001 C CNN
F 3 "" H 9700 5800 50  0001 C CNN
	1    9700 5800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9700 5350 9700 5450
$Comp
L power:+5V #PWR?
U 1 1 5DBBDE51
P 9700 5350
AR Path="/5D78E680/5DBBDE51" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5DBBDE51" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5DBBDE51" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DBBDE51" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 9700 5200 50  0001 C CNN
F 1 "+5V" H 9642 5387 50  0000 R CNN
F 2 "" H 9700 5350 50  0001 C CNN
F 3 "" H 9700 5350 50  0001 C CNN
	1    9700 5350
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U1109
U 1 1 5DBBDE57
P 10200 3950
F 0 "U1109" H 10530 4046 50  0000 L CNN
F 1 "SN74ACT1071" H 10530 3955 50  0000 L CNN
F 2 "alexios:SOIC-14" H 9900 4300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 9900 4300 50  0001 C CNN
	1    10200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3450 9300 3450
Wire Wire Line
	9700 3550 9300 3550
Wire Wire Line
	9700 3650 9300 3650
Wire Wire Line
	9700 3750 9300 3750
$Comp
L alexios:SN74ACT1071 U1109
U 2 1 5DBBDE66
P 10050 5850
F 0 "U1109" H 10230 6209 50  0000 L CNN
F 1 "SN74ACT1071" H 10230 6118 50  0000 L CNN
F 2 "alexios:SOIC-14" H 9750 6200 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 9750 6200 50  0001 C CNN
	2    10050 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 5650 9700 5750
Connection ~ 9700 5350
Connection ~ 9700 5450
Connection ~ 9700 5650
Connection ~ 9700 5750
Wire Wire Line
	9700 5750 9700 5800
NoConn ~ 9700 3850
NoConn ~ 9700 4250
Text Label 9300 3450 0    50   ~ 0
ACTION0
Text Label 9300 3550 0    50   ~ 0
ACTION1
Text Label 9300 3650 0    50   ~ 0
ACTION2
Text Label 9300 3750 0    50   ~ 0
ACTION3
Text Label 2750 4550 0    50   ~ 0
~IODEV1xx
Wire Wire Line
	7700 3850 7300 3850
Text Label 7300 3850 0    50   ~ 0
~IO
NoConn ~ 7700 3950
NoConn ~ 7700 4050
NoConn ~ 7700 4150
NoConn ~ 7700 4250
NoConn ~ 7700 4350
Text HLabel 7300 3850 0    50   UnSpc ~ 0
~IO
Text HLabel 2650 4450 0    50   UnSpc ~ 0
~MEM
Text HLabel 2650 4550 0    50   UnSpc ~ 0
~IODEV1xx
Text HLabel 2950 1900 0    50   UnSpc ~ 0
~R
Text HLabel 2950 2000 0    50   UnSpc ~ 0
~W
Wire Wire Line
	3600 2400 3600 2500
Connection ~ 3600 2400
Connection ~ 3600 2500
Wire Wire Line
	3600 2700 3600 2800
Connection ~ 3600 2700
Connection ~ 3600 2800
NoConn ~ 9700 3950
NoConn ~ 9700 4050
NoConn ~ 9700 4150
NoConn ~ 9700 4350
$Comp
L power:+5V #PWR0164
U 1 1 5E5D8E6A
P 7550 5350
F 0 "#PWR0164" H 7550 5200 50  0001 C CNN
F 1 "+5V" H 7565 5523 50  0000 C CNN
F 2 "" H 7550 5350 50  0001 C CNN
F 3 "" H 7550 5350 50  0001 C CNN
	1    7550 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5350 7550 5450
Connection ~ 7550 5350
Connection ~ 7550 5450
Wire Wire Line
	7550 5650 7550 5750
Connection ~ 7550 5650
Connection ~ 7550 5750
Wire Wire Line
	7550 5750 7550 5800
Text Notes 5550 5000 2    98   ~ 20
TODO: Remove signals dealt with by bus pods.
$EndSCHEMATC
