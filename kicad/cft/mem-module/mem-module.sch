EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "SRAM Adapter Board"
Date ""
Rev "2023"
Comp ""
Comment1 "B1"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 11250 3250 0    50   ~ 0
All devices are 512K which eases decoding. There is space for 24\n512K×8 SRAM packages which provide between 512 kW and 6 MW.\nAll chips except the lowest bank are optional.\n\nROM is mapped to 80:0000₁₆.
Text Notes 11250 2650 0    100  ~ 20
Notes
Text Notes 5100 2450 0    197  ~ 39
Read/Write Decoding
Wire Notes Line width 12 style solid
	11000 3500 14100 3500
Wire Notes Line width 12 style solid
	14100 3500 14100 2250
Text Label 6650 5450 2    50   ~ 0
DB15
Text Label 6650 5350 2    50   ~ 0
DB14
Text Label 6650 5250 2    50   ~ 0
DB13
Text Label 6650 5150 2    50   ~ 0
DB12
Text Label 6650 5050 2    50   ~ 0
DB11
Text Label 6650 4950 2    50   ~ 0
DB10
Text Label 6650 4850 2    50   ~ 0
DB9
Text Label 6650 4750 2    50   ~ 0
DB8
Wire Wire Line
	6450 4750 6650 4750
Wire Wire Line
	6450 4850 6650 4850
Wire Wire Line
	6450 4950 6650 4950
Wire Wire Line
	6450 5050 6650 5050
Wire Wire Line
	6450 5150 6650 5150
Wire Wire Line
	6450 5250 6650 5250
Wire Wire Line
	6450 5350 6650 5350
Wire Wire Line
	6450 5450 6650 5450
Wire Wire Line
	5450 4750 5250 4750
Wire Wire Line
	5450 4850 5250 4850
Wire Wire Line
	5450 4950 5250 4950
Wire Wire Line
	5450 5050 5250 5050
Wire Wire Line
	5450 5150 5250 5150
Wire Wire Line
	5450 5250 5250 5250
Wire Wire Line
	5450 5350 5250 5350
Wire Wire Line
	5450 5450 5250 5450
Wire Wire Line
	5450 5550 5250 5550
Wire Wire Line
	5450 5650 5250 5650
Wire Wire Line
	5450 5750 5250 5750
Wire Wire Line
	5450 5850 5250 5850
Wire Wire Line
	5450 5950 5250 5950
Wire Wire Line
	5450 6050 5250 6050
Wire Wire Line
	5450 6150 5250 6150
Wire Wire Line
	5450 6250 5250 6250
Wire Wire Line
	5450 6350 5250 6350
Wire Wire Line
	5450 6450 5250 6450
Wire Wire Line
	5450 6550 5250 6550
Wire Wire Line
	5450 6750 5250 6750
Wire Wire Line
	5450 6850 5250 6850
Wire Wire Line
	5450 6950 5250 6950
Text Label 5250 4750 0    50   ~ 0
AB0
Text Label 5250 4850 0    50   ~ 0
AB1
Text Label 5250 4950 0    50   ~ 0
AB2
Text Label 5250 5050 0    50   ~ 0
AB3
Text Label 5250 5150 0    50   ~ 0
AB4
Text Label 5250 5250 0    50   ~ 0
AB5
Text Label 5250 5350 0    50   ~ 0
AB6
Text Label 5250 5450 0    50   ~ 0
AB7
Text Label 5250 5550 0    50   ~ 0
AB8
Text Label 5250 5650 0    50   ~ 0
AB9
Text Label 5250 5750 0    50   ~ 0
AB10
Text Label 5250 5850 0    50   ~ 0
AB11
Text Label 5250 5950 0    50   ~ 0
AB12
Text Label 5250 6050 0    50   ~ 0
AB13
Text Label 5250 6150 0    50   ~ 0
AB14
Text Label 5250 6250 0    50   ~ 0
AB15
Text Label 5250 6350 0    50   ~ 0
AB16
Text Label 5250 6450 0    50   ~ 0
AB17
Text Label 5250 6550 0    50   ~ 0
AB18
Text Label 5250 6850 0    50   ~ 0
~R
Text Label 5250 6950 0    50   ~ 0
~W
Text Label 5250 6750 0    50   ~ 0
~CE
$Comp
L power:+5V #PWR?
U 1 1 61A0AB97
P 5500 7950
AR Path="/5E94D03A/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5EC68F14/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B87/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B97/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5EC8475C/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD519/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD529/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD539/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC4E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC5E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC6E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC7E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5E94D03A/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC68F14/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B87/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B97/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD509/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD519/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD529/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD539/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F42/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF51/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF5D/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF69/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF75/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF81/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF8D/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF99/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFA5/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFB1/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFBD/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFC9/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2B182/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2B18E/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2B19A/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1A6/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1C6/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1D2/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1DE/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1EA/61A0AB97" Ref="#PWR?"  Part="1" 
AR Path="/61A0AB97" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 5500 7800 50  0001 C CNN
F 1 "+5V" H 5515 8123 50  0000 C CNN
F 2 "" H 5500 7950 50  0001 C CNN
F 3 "" H 5500 7950 50  0001 C CNN
	1    5500 7950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A0AB9D
P 5500 8150
AR Path="/5E94D03A/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5EC68F14/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B87/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B97/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5EC8475C/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD519/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD529/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD539/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC4E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC5E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC6E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC7E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5E94D03A/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC68F14/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B87/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B97/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD509/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD519/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD529/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD539/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F42/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF51/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF5D/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF69/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF75/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF81/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF8D/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF99/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFA5/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFB1/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFBD/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFC9/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2B182/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2B18E/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2B19A/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1A6/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1C6/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1D2/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1DE/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1EA/61A0AB9D" Ref="#PWR?"  Part="1" 
AR Path="/61A0AB9D" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 5500 7900 50  0001 C CNN
F 1 "GND" H 5505 7977 50  0000 C CNN
F 2 "" H 5500 8150 50  0001 C CNN
F 3 "" H 5500 8150 50  0001 C CNN
	1    5500 8150
	1    0    0    -1  
$EndComp
$Comp
L alexios:AS6C4008-55PCN U?
U 1 1 61A0ABC4
P 5950 5850
AR Path="/60F438E4/5E94D03A/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD529/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5EC68F14/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5EC75B87/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5EC75B97/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD509/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD519/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD539/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F42/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F4E/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F5A/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F66/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A51/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A5D/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A69/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A75/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AF42/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AF51/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AF5D/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AF69/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AF75/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AF81/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AF8D/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AF99/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AFA5/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AFB1/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AFBD/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2AFC9/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2B182/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2B18E/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2B19A/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2B1A6/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2B1C6/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2B1D2/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2B1DE/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/65B2B1EA/61A0ABC4" Ref="U?"  Part="1" 
AR Path="/61A0ABC4" Ref="U2"  Part="1" 
F 0 "U2" H 5950 7217 50  0000 C CNN
F 1 "AS6C4008-55PCN" H 5950 7126 50  0000 C CNN
F 2 "alexios:DIP-32_W15.24mm_Socketed_IC" V 5950 6075 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 5950 6150 50  0001 C CNN
F 4 "913-AS6C4008-55PCN;€4.5" H 5150 4300 50  0001 L CNN "AC:BOM-Mouser"
	1    5950 5850
	1    0    0    -1  
$EndComp
$Comp
L alexios:AS6C4008-55PCN U?
U 2 1 61A0ABCB
P 5850 8050
AR Path="/60F438E4/5E94D03A/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD529/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5EC68F14/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5EC75B87/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5EC75B97/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD509/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD519/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD539/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC4E/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC5E/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC6E/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC7E/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F42/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F4E/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F5A/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F66/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A51/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A5D/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A69/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A75/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AF42/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AF51/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AF5D/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AF69/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AF75/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AF81/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AF8D/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AF99/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AFA5/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AFB1/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AFBD/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2AFC9/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2B182/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2B18E/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2B19A/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2B1A6/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2B1C6/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2B1D2/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2B1DE/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/65B2B1EA/61A0ABCB" Ref="U?"  Part="2" 
AR Path="/61A0ABCB" Ref="U2"  Part="2" 
F 0 "U2" H 6030 8096 50  0000 L CNN
F 1 "AS6C4008-55PCN" H 6030 8005 50  0000 L CNN
F 2 "alexios:DIP-32_W15.24mm_Socketed_IC" V 5850 8275 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 5850 8350 50  0001 C CNN
F 4 "913-AS6C4008-55PCN;€4.5" H 5050 6500 50  0001 L CNN "AC:BOM-Mouser"
	2    5850 8050
	1    0    0    -1  
$EndComp
$Comp
L alexios:IS61C5128AL U1
U 1 1 61A74262
P 8850 5850
F 0 "U1" H 8850 7217 50  0000 C CNN
F 1 "IS61C5128AL" H 8850 7126 50  0000 C CNN
F 2 "Package_SO:SOJ-36_10.16x23.49mm_P1.27mm" V 8750 6075 50  0001 C CNN
F 3 "https://uk.mouser.com/datasheet/2/12/AS6C8008-1288432.pdf" H 8750 6150 50  0001 C CNN
F 4 "870-61C5128AL-10KLI; €3.11" H 8050 4200 50  0001 L CNN "AC:BOM-Mouser"
	1    8850 5850
	1    0    0    -1  
$EndComp
Text Label 8150 6850 0    50   ~ 0
~R
Text Label 8150 6950 0    50   ~ 0
~W
Text Label 8150 6750 0    50   ~ 0
~CE
Text Label 9550 5450 2    50   ~ 0
DB15
Text Label 9550 5350 2    50   ~ 0
DB14
Text Label 9550 5250 2    50   ~ 0
DB13
Text Label 9550 5150 2    50   ~ 0
DB12
Text Label 9550 5050 2    50   ~ 0
DB11
Text Label 9550 4950 2    50   ~ 0
DB10
Text Label 9550 4850 2    50   ~ 0
DB9
Text Label 9550 4750 2    50   ~ 0
DB8
Wire Wire Line
	9350 4750 9550 4750
Wire Wire Line
	9350 4850 9550 4850
Wire Wire Line
	9350 4950 9550 4950
Wire Wire Line
	9350 5050 9550 5050
Wire Wire Line
	9350 5150 9550 5150
Wire Wire Line
	9350 5250 9550 5250
Wire Wire Line
	9350 5350 9550 5350
Wire Wire Line
	9350 5450 9550 5450
$Comp
L alexios:IS61C5128AL U1
U 2 1 61A7C054
P 8850 8050
F 0 "U1" H 8825 8517 50  0000 C CNN
F 1 "IS61C5128AL" H 8825 8426 50  0000 C CNN
F 2 "Package_SO:SOJ-36_10.16x23.49mm_P1.27mm" V 8750 8275 50  0001 C CNN
F 3 "https://uk.mouser.com/datasheet/2/12/AS6C8008-1288432.pdf" H 8750 8350 50  0001 C CNN
F 4 "870-61C5128AL-10KLI; €3.11" H 8050 6400 50  0001 L CNN "AC:BOM-Mouser"
	2    8850 8050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61A7DA55
P 8400 8050
AR Path="/5E94D03A/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5EC68F14/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5EC75B87/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5EC75B97/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5EC8475C/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5EC8476C/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5EC8477C/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5EC8478C/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECB980E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECB981E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECCD509/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECCD519/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECCD529/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECCD539/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5E94D03A/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5EC68F14/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5EC75B87/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5EC75B97/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECCD509/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECCD519/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECCD529/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECCD539/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F42/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F4E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F5A/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F66/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A51/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A5D/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A69/61A7DA55" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A75/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AF42/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AF51/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AF5D/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AF69/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AF75/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AF81/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AF8D/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AF99/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AFA5/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AFB1/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AFBD/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2AFC9/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2B182/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2B18E/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2B19A/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2B1A6/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2B1C6/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2B1D2/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2B1DE/61A7DA55" Ref="C?"  Part="1" 
AR Path="/65B2B1EA/61A7DA55" Ref="C?"  Part="1" 
AR Path="/61A7DA55" Ref="C1"  Part="1" 
F 0 "C1" H 8309 8096 50  0000 R CNN
F 1 "100nF" H 8309 8005 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8400 8050 50  0001 C CNN
F 3 "~" H 8400 8050 50  0001 C CNN
	1    8400 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 6750 8350 6750
Wire Wire Line
	8150 6850 8350 6850
Wire Wire Line
	8150 6950 8350 6950
$Comp
L Device:C_Small C?
U 1 1 61A7FACE
P 9250 8050
AR Path="/5E94D03A/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5EC68F14/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5EC75B87/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5EC75B97/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5EC8475C/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5EC8476C/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5EC8477C/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5EC8478C/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECB980E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECB981E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECCD509/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECCD519/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECCD529/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECCD539/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5E94D03A/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5EC68F14/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5EC75B87/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5EC75B97/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECCD509/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECCD519/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECCD529/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECCD539/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F42/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F4E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F5A/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F66/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A51/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A5D/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A69/61A7FACE" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A75/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AF42/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AF51/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AF5D/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AF69/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AF75/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AF81/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AF8D/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AF99/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AFA5/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AFB1/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AFBD/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2AFC9/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2B182/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2B18E/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2B19A/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2B1A6/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2B1C6/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2B1D2/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2B1DE/61A7FACE" Ref="C?"  Part="1" 
AR Path="/65B2B1EA/61A7FACE" Ref="C?"  Part="1" 
AR Path="/61A7FACE" Ref="C2"  Part="1" 
F 0 "C2" H 9342 8096 50  0000 L CNN
F 1 "100nF" H 9342 8005 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9250 8050 50  0001 C CNN
F 3 "~" H 9250 8050 50  0001 C CNN
	1    9250 8050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A81483
P 8400 8150
AR Path="/5E94D03A/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5EC68F14/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B87/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B97/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5EC8475C/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD519/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD529/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD539/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC4E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC5E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC6E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC7E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5E94D03A/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC68F14/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B87/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B97/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD509/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD519/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD529/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD539/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F42/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF51/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF5D/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF69/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF75/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF81/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF8D/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF99/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFA5/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFB1/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFBD/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFC9/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2B182/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2B18E/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2B19A/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1A6/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1C6/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1D2/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1DE/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1EA/61A81483" Ref="#PWR?"  Part="1" 
AR Path="/61A81483" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 8400 7900 50  0001 C CNN
F 1 "GND" H 8405 7977 50  0000 C CNN
F 2 "" H 8400 8150 50  0001 C CNN
F 3 "" H 8400 8150 50  0001 C CNN
	1    8400 8150
	1    0    0    -1  
$EndComp
Connection ~ 8400 8150
$Comp
L power:+5V #PWR?
U 1 1 61A816F7
P 8400 7950
AR Path="/5E94D03A/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5EC68F14/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B87/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B97/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5EC8475C/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD519/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD529/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD539/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC4E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC5E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC6E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC7E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5E94D03A/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC68F14/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B87/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B97/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD509/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD519/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD529/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD539/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F42/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF51/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF5D/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF69/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF75/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF81/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF8D/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF99/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFA5/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFB1/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFBD/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFC9/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2B182/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2B18E/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2B19A/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1A6/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1C6/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1D2/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1DE/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1EA/61A816F7" Ref="#PWR?"  Part="1" 
AR Path="/61A816F7" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 8400 7800 50  0001 C CNN
F 1 "+5V" H 8415 8123 50  0000 C CNN
F 2 "" H 8400 7950 50  0001 C CNN
F 3 "" H 8400 7950 50  0001 C CNN
	1    8400 7950
	1    0    0    -1  
$EndComp
Connection ~ 8400 7950
$Comp
L power:+5V #PWR?
U 1 1 61A82557
P 9250 7950
AR Path="/5E94D03A/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5EC68F14/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B87/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B97/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5EC8475C/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD519/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD529/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD539/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC4E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC5E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC6E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC7E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5E94D03A/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC68F14/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B87/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B97/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD509/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD519/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD529/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD539/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F42/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF51/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF5D/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF69/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF75/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF81/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF8D/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF99/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFA5/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFB1/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFBD/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFC9/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2B182/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2B18E/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2B19A/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1A6/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1C6/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1D2/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1DE/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1EA/61A82557" Ref="#PWR?"  Part="1" 
AR Path="/61A82557" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 9250 7800 50  0001 C CNN
F 1 "+5V" H 9265 8123 50  0000 C CNN
F 2 "" H 9250 7950 50  0001 C CNN
F 3 "" H 9250 7950 50  0001 C CNN
	1    9250 7950
	1    0    0    -1  
$EndComp
Connection ~ 9250 7950
$Comp
L power:GND #PWR?
U 1 1 61A83440
P 9250 8150
AR Path="/5E94D03A/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5EC68F14/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B87/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5EC75B97/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5EC8475C/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD519/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD529/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD539/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC4E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC5E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC6E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/5ECDEC7E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5E94D03A/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC68F14/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B87/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5EC75B97/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD509/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD519/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD529/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECCD539/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F42/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF51/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF5D/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF69/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF75/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF81/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF8D/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF99/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFA5/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFB1/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFBD/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFC9/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2B182/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2B18E/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2B19A/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1A6/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1C6/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1D2/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1DE/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/65B2B1EA/61A83440" Ref="#PWR?"  Part="1" 
AR Path="/61A83440" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 9250 7900 50  0001 C CNN
F 1 "GND" H 9255 7977 50  0000 C CNN
F 2 "" H 9250 8150 50  0001 C CNN
F 3 "" H 9250 8150 50  0001 C CNN
	1    9250 8150
	1    0    0    -1  
$EndComp
Connection ~ 9250 8150
Wire Wire Line
	8150 6550 8350 6550
Wire Wire Line
	8150 6450 8350 6450
Text Label 8150 6550 0    50   ~ 0
AB18
Text Label 8150 6450 0    50   ~ 0
AB17
Text Label 8150 6350 0    50   ~ 0
AB16
Text Label 8150 6250 0    50   ~ 0
AB15
Text Label 8150 6150 0    50   ~ 0
AB14
Text Label 8150 6050 0    50   ~ 0
AB13
Text Label 8150 5950 0    50   ~ 0
AB12
Text Label 8150 5850 0    50   ~ 0
AB11
Text Label 8150 5750 0    50   ~ 0
AB10
Text Label 8150 5650 0    50   ~ 0
AB9
Text Label 8150 5550 0    50   ~ 0
AB8
Text Label 8150 5450 0    50   ~ 0
AB7
Text Label 8150 5350 0    50   ~ 0
AB6
Text Label 8150 5250 0    50   ~ 0
AB5
Text Label 8150 5150 0    50   ~ 0
AB4
Text Label 8150 5050 0    50   ~ 0
AB3
Text Label 8150 4950 0    50   ~ 0
AB2
Text Label 8150 4850 0    50   ~ 0
AB1
Text Label 8150 4750 0    50   ~ 0
AB0
Wire Wire Line
	8350 6350 8150 6350
Wire Wire Line
	8350 6250 8150 6250
Wire Wire Line
	8350 6150 8150 6150
Wire Wire Line
	8350 6050 8150 6050
Wire Wire Line
	8350 5950 8150 5950
Wire Wire Line
	8350 5850 8150 5850
Wire Wire Line
	8350 5750 8150 5750
Wire Wire Line
	8350 5650 8150 5650
Wire Wire Line
	8350 5550 8150 5550
Wire Wire Line
	8350 5450 8150 5450
Wire Wire Line
	8350 5350 8150 5350
Wire Wire Line
	8350 5250 8150 5250
Wire Wire Line
	8350 5150 8150 5150
Wire Wire Line
	8350 5050 8150 5050
Wire Wire Line
	8350 4950 8150 4950
Wire Wire Line
	8350 4850 8150 4850
Wire Wire Line
	8350 4750 8150 4750
$EndSCHEMATC
