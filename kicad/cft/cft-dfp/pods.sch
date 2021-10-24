EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 18
Title "I/O Pods"
Date ""
Rev "2133"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4050 4550 3700 4550
Wire Wire Line
	3700 4650 4050 4650
Wire Wire Line
	3700 4750 4050 4750
Wire Wire Line
	3700 4850 4050 4850
Text Label 9300 1450 2    50   ~ 0
IBUS0
Text Label 9300 1550 2    50   ~ 0
IBUS1
Text Label 9300 1650 2    50   ~ 0
IBUS2
Text Label 9300 1750 2    50   ~ 0
IBUS3
Text Label 9300 1850 2    50   ~ 0
IBUS4
Text Label 9300 1950 2    50   ~ 0
IBUS5
Text Label 9300 2050 2    50   ~ 0
IBUS6
Text Label 9300 2150 2    50   ~ 0
IBUS7
Text Label 9300 3000 2    50   ~ 0
IBUS8
Text Label 9300 3100 2    50   ~ 0
IBUS9
Text Label 9300 3200 2    50   ~ 0
IBUS10
Text Label 9300 3300 2    50   ~ 0
IBUS11
Text Label 9300 3400 2    50   ~ 0
IBUS12
Text Label 9300 3500 2    50   ~ 0
IBUS13
Text Label 9300 3600 2    50   ~ 0
IBUS14
Text Label 9300 3700 2    50   ~ 0
IBUS15
Text Label 4050 4550 2    50   ~ 0
ACTION0
Text Label 4050 4650 2    50   ~ 0
ACTION1
Text Label 4050 4750 2    50   ~ 0
ACTION2
Text Label 4050 4850 2    50   ~ 0
ACTION3
Wire Wire Line
	3700 1450 4050 1450
Wire Wire Line
	3700 1550 4050 1550
Wire Wire Line
	3700 1650 4050 1650
Wire Wire Line
	3700 1750 4050 1750
Wire Wire Line
	3700 1850 4050 1850
Text Label 4050 1450 2    50   ~ 0
RADDR0
Text Label 4050 1550 2    50   ~ 0
RADDR1
Text Label 4050 1650 2    50   ~ 0
RADDR2
Text Label 4050 1750 2    50   ~ 0
RADDR3
Text Label 4050 1850 2    50   ~ 0
RADDR4
Wire Wire Line
	9300 1450 8950 1450
Wire Wire Line
	8950 1550 9300 1550
Wire Wire Line
	8950 1650 9300 1650
Wire Wire Line
	8950 1750 9300 1750
Wire Wire Line
	8950 1850 9300 1850
Wire Wire Line
	8950 1950 9300 1950
Wire Wire Line
	8950 2050 9300 2050
Wire Wire Line
	8950 2150 9300 2150
Wire Wire Line
	8950 3000 9300 3000
Wire Wire Line
	8950 3100 9300 3100
Wire Wire Line
	8950 3200 9300 3200
Wire Wire Line
	8950 3300 9300 3300
Wire Wire Line
	8950 3400 9300 3400
Wire Wire Line
	8950 3500 9300 3500
Wire Wire Line
	8950 3600 9300 3600
Wire Wire Line
	8950 3700 9300 3700
Wire Wire Line
	4050 3000 3700 3000
Wire Wire Line
	3700 3100 4050 3100
Wire Wire Line
	3700 3200 4050 3200
Wire Wire Line
	3700 3300 4050 3300
Wire Wire Line
	3700 3400 4050 3400
Text Label 4050 3000 2    50   ~ 0
WADDR0
Text Label 4050 3100 2    50   ~ 0
WADDR1
Text Label 4050 3200 2    50   ~ 0
WADDR2
Text Label 4050 3300 2    50   ~ 0
WADDR3
Text Label 4050 3400 2    50   ~ 0
WADDR4
Text HLabel 10400 1950 2    50   BiDi ~ 0
AB[0..23]
Text HLabel 10400 1450 2    50   BiDi ~ 0
RADDR[0..4]
Text HLabel 10400 1550 2    50   BiDi ~ 0
WADDR[0..4]
Text HLabel 10400 1650 2    50   BiDi ~ 0
ACTION[0..3]
Text HLabel 10400 2050 2    50   BiDi ~ 0
DB[0..15]
Text HLabel 10400 1850 2    50   BiDi ~ 0
IBUS[0..15]
Wire Bus Line
	10400 1950 9900 1950
Wire Bus Line
	10400 1450 9900 1450
Wire Bus Line
	10400 1550 9900 1550
Wire Bus Line
	10400 1650 9900 1650
Wire Bus Line
	10400 2050 9900 2050
Wire Bus Line
	10400 1850 9900 1850
Text Label 9900 1950 0    50   ~ 0
AB[0..23]
Text Label 9900 1450 0    50   ~ 0
RADDR[0..4]
Text Label 9900 1550 0    50   ~ 0
WADDR[0..4]
Text Label 9900 1650 0    50   ~ 0
ACTION[0..3]
Text Label 9900 2050 0    50   ~ 0
DB[0..15]
Text Label 9900 1850 0    50   ~ 0
IBUS[0..15]
$Comp
L Device:R_Small R10
U 1 1 6045B0F4
P 1850 1700
F 0 "R10" V 1654 1700 50  0000 C CNN
F 1 "10kΩ" V 1745 1700 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1850 1700 50  0001 C CNN
F 3 "~" H 1850 1700 50  0001 C CNN
	1    1850 1700
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0217
U 1 1 6045B0FB
P 2000 1600
F 0 "#PWR0217" H 2000 1450 50  0001 C CNN
F 1 "+5V" H 2015 1773 50  0000 C CNN
F 2 "" H 2000 1600 50  0001 C CNN
F 3 "" H 2000 1600 50  0001 C CNN
	1    2000 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R12
U 1 1 604CE3BB
P 1850 2000
F 0 "R12" V 2046 2000 50  0000 C CNN
F 1 "10kΩ" V 1955 2000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1850 2000 50  0001 C CNN
F 3 "~" H 1850 2000 50  0001 C CNN
	1    1850 2000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R13
U 1 1 605720CE
P 1850 2350
F 0 "R13" V 2046 2350 50  0000 C CNN
F 1 "10kΩ" V 1955 2350 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1850 2350 50  0001 C CNN
F 3 "~" H 1850 2350 50  0001 C CNN
	1    1850 2350
	0    -1   -1   0   
$EndComp
Text Label 2000 1150 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	1200 1500 1600 1500
Text Label 1600 2350 2    50   ~ 0
~IBOE
Text Label 1600 2500 2    50   ~ 0
~DBOE
Text Label 1600 2000 2    50   ~ 0
~CVOE
Text Label 1600 1700 2    50   ~ 0
~ABOE
Wire Wire Line
	1200 2500 1600 2500
Wire Wire Line
	1200 2000 1750 2000
Text HLabel 1200 2350 0    50   Input ~ 0
~IBOE
Text HLabel 1200 2500 0    50   Input ~ 0
~DBOE
Text HLabel 1200 2000 0    50   Input ~ 0
~CVOE
Text HLabel 1200 1700 0    50   Input ~ 0
~ABOE
Text Label 1600 5450 2    50   ~ 0
~WIB1
Text Label 1600 5350 2    50   ~ 0
~WIB0
Text Label 1600 5150 2    50   ~ 0
~RIB1
Text Label 1600 5050 2    50   ~ 0
~RIB0
Text Label 1600 4850 2    50   ~ 0
~WDB1
Text Label 1600 4750 2    50   ~ 0
~WDB0
Text Label 1600 4550 2    50   ~ 0
~RDB1
Text Label 1600 4450 2    50   ~ 0
~RDB0
Text Label 1600 4200 2    50   ~ 0
~WCV2
Text Label 1600 4100 2    50   ~ 0
~WCV1
Text Label 1600 4000 2    50   ~ 0
~WCV0
Text Label 1600 3800 2    50   ~ 0
~RCV2
Text Label 1600 3700 2    50   ~ 0
~RCV1
Text Label 1600 3600 2    50   ~ 0
~RCV0
Text Label 1600 3400 2    50   ~ 0
~WAB2
Text Label 1600 3300 2    50   ~ 0
~WAB1
Text Label 1600 3200 2    50   ~ 0
~WAB0
Text Label 1600 3000 2    50   ~ 0
~RAB2
Text Label 1600 2900 2    50   ~ 0
~RAB1
Text Label 1600 2800 2    50   ~ 0
~RAB0
Text Label 1600 1500 2    50   ~ 0
BUSCP
Wire Wire Line
	1200 5450 1600 5450
Wire Wire Line
	1200 5350 1600 5350
Wire Wire Line
	1200 5150 1600 5150
Wire Wire Line
	1200 5050 1600 5050
Wire Wire Line
	1200 4850 1600 4850
Wire Wire Line
	1200 4750 1600 4750
Wire Wire Line
	1200 4550 1600 4550
Wire Wire Line
	1200 4450 1600 4450
Wire Wire Line
	1200 4200 1600 4200
Wire Wire Line
	1200 4100 1600 4100
Wire Wire Line
	1200 4000 1600 4000
Wire Wire Line
	1200 3800 1600 3800
Wire Wire Line
	1200 3700 1600 3700
Wire Wire Line
	1200 3600 1600 3600
Wire Wire Line
	1200 3400 1600 3400
Wire Wire Line
	1200 3300 1600 3300
Wire Wire Line
	1200 3200 1600 3200
Wire Wire Line
	1200 3000 1600 3000
Wire Wire Line
	1200 2900 1600 2900
Wire Wire Line
	1200 2800 1600 2800
Text HLabel 1200 5450 0    50   Input ~ 0
~WIB1
Text HLabel 1200 5350 0    50   Input ~ 0
~WIB0
Text HLabel 1200 5150 0    50   Input ~ 0
~RIB1
Text HLabel 1200 5050 0    50   Input ~ 0
~RIB0
Text HLabel 1200 4850 0    50   Input ~ 0
~WDB1
Text HLabel 1200 4750 0    50   Input ~ 0
~WDB0
Text HLabel 1200 4550 0    50   Input ~ 0
~RDB1
Text HLabel 1200 4450 0    50   Input ~ 0
~RDB0
Text HLabel 1200 4200 0    50   Input ~ 0
~WCV2
Text HLabel 1200 4100 0    50   Input ~ 0
~WCV1
Text HLabel 1200 4000 0    50   Input ~ 0
~WCV0
Text HLabel 1200 3800 0    50   Input ~ 0
~RCV2
Text HLabel 1200 3700 0    50   Input ~ 0
~RCV1
Text HLabel 1200 3400 0    50   Input ~ 0
~WAB2
Text HLabel 1200 3300 0    50   Input ~ 0
~WAB1
Text HLabel 1200 3200 0    50   Input ~ 0
~WAB0
Text HLabel 1200 3000 0    50   Input ~ 0
~RAB2
Text HLabel 1200 2900 0    50   Input ~ 0
~RAB1
Text HLabel 1200 2800 0    50   Input ~ 0
~RAB0
Wire Bus Line
	1950 1150 2350 1150
Text HLabel 1950 1150 0    50   BiDi ~ 0
FPD[0..7]
Text Label 4300 1450 0    50   ~ 0
FPD0
Text Label 4300 1550 0    50   ~ 0
FPD1
Text Label 4300 1650 0    50   ~ 0
FPD2
Text Label 4300 1750 0    50   ~ 0
FPD3
Text Label 4300 1850 0    50   ~ 0
FPD4
Text Label 4300 1950 0    50   ~ 0
FPD5
Text Label 4300 2050 0    50   ~ 0
FPD6
Text Label 4300 2150 0    50   ~ 0
FPD7
Wire Wire Line
	4650 2150 4300 2150
Wire Wire Line
	4650 2050 4300 2050
Wire Wire Line
	4650 1950 4300 1950
Wire Wire Line
	4650 1850 4300 1850
Wire Wire Line
	4650 1750 4300 1750
Wire Wire Line
	4650 1650 4300 1650
Wire Wire Line
	4650 1550 4300 1550
Wire Wire Line
	4650 1450 4300 1450
Wire Wire Line
	4650 2350 4300 2350
Text Label 4300 2350 0    50   ~ 0
BPCP
Wire Wire Line
	4650 2450 4300 2450
Wire Wire Line
	5450 2350 5800 2350
Wire Wire Line
	5450 2450 5800 2450
Text Label 4300 2450 0    50   ~ 0
~RAB0A
Text Label 5800 2350 2    50   ~ 0
~WAB0
Text Label 5800 2450 2    50   ~ 0
~ABOE
Wire Wire Line
	5450 1450 5800 1450
Wire Wire Line
	5450 1550 5800 1550
Wire Wire Line
	5450 1650 5800 1650
Wire Wire Line
	5450 1750 5800 1750
Wire Wire Line
	5450 1850 5800 1850
Wire Wire Line
	5450 1950 5800 1950
Wire Wire Line
	5450 2050 5800 2050
Wire Wire Line
	5450 2150 5800 2150
Text Label 5800 1450 2    50   ~ 0
AB0
Text Label 5800 1550 2    50   ~ 0
AB1
Text Label 5800 1650 2    50   ~ 0
AB2
Text Label 5800 1750 2    50   ~ 0
AB3
Text Label 5800 1850 2    50   ~ 0
AB4
Text Label 5800 1950 2    50   ~ 0
AB5
Text Label 5800 2050 2    50   ~ 0
AB6
Text Label 5800 2150 2    50   ~ 0
AB7
Text Label 4300 3000 0    50   ~ 0
FPD0
Text Label 4300 3100 0    50   ~ 0
FPD1
Text Label 4300 3200 0    50   ~ 0
FPD2
Text Label 4300 3300 0    50   ~ 0
FPD3
Text Label 4300 3400 0    50   ~ 0
FPD4
Text Label 4300 3500 0    50   ~ 0
FPD5
Text Label 4300 3600 0    50   ~ 0
FPD6
Text Label 4300 3700 0    50   ~ 0
FPD7
Wire Wire Line
	4650 3700 4300 3700
Wire Wire Line
	4650 3600 4300 3600
Wire Wire Line
	4650 3500 4300 3500
Wire Wire Line
	4650 3400 4300 3400
Wire Wire Line
	4650 3300 4300 3300
Wire Wire Line
	4650 3200 4300 3200
Wire Wire Line
	4650 3100 4300 3100
Wire Wire Line
	4650 3000 4300 3000
Wire Wire Line
	4650 3900 4300 3900
Text Label 4300 3900 0    50   ~ 0
BPCP
Wire Wire Line
	4650 4000 4300 4000
Wire Wire Line
	5450 3900 5800 3900
Wire Wire Line
	5450 4000 5800 4000
Text Label 4300 4000 0    50   ~ 0
~RAB1A
Text Label 5800 3900 2    50   ~ 0
~WAB1
Text Label 5800 4000 2    50   ~ 0
~ABOE
Wire Wire Line
	5450 3000 5800 3000
Wire Wire Line
	5450 3100 5800 3100
Wire Wire Line
	5450 3200 5800 3200
Wire Wire Line
	5450 3300 5800 3300
Wire Wire Line
	5450 3400 5800 3400
Wire Wire Line
	5450 3500 5800 3500
Wire Wire Line
	5450 3600 5800 3600
Wire Wire Line
	5450 3700 5800 3700
Text Label 4300 4550 0    50   ~ 0
FPD0
Text Label 4300 4650 0    50   ~ 0
FPD1
Text Label 4300 4750 0    50   ~ 0
FPD2
Text Label 4300 4850 0    50   ~ 0
FPD3
Text Label 4300 4950 0    50   ~ 0
FPD4
Text Label 4300 5050 0    50   ~ 0
FPD5
Text Label 4300 5150 0    50   ~ 0
FPD6
Text Label 4300 5250 0    50   ~ 0
FPD7
Wire Wire Line
	4650 5250 4300 5250
Wire Wire Line
	4650 5150 4300 5150
Wire Wire Line
	4650 5050 4300 5050
Wire Wire Line
	4650 4950 4300 4950
Wire Wire Line
	4650 4850 4300 4850
Wire Wire Line
	4650 4750 4300 4750
Wire Wire Line
	4650 4650 4300 4650
Wire Wire Line
	4650 4550 4300 4550
Wire Wire Line
	4650 5450 4300 5450
Text Label 4300 5450 0    50   ~ 0
BPCP
Wire Wire Line
	4650 5550 4300 5550
Wire Wire Line
	5450 5450 5800 5450
Wire Wire Line
	5450 5550 5800 5550
Text Label 4300 5550 0    50   ~ 0
~RAB2A
Text Label 5800 5450 2    50   ~ 0
~WAB2
Text Label 5800 5550 2    50   ~ 0
~ABOE
Wire Wire Line
	5450 4550 5800 4550
Wire Wire Line
	5450 4650 5800 4650
Wire Wire Line
	5450 4750 5800 4750
Wire Wire Line
	5450 4850 5800 4850
Wire Wire Line
	5450 4950 5800 4950
Wire Wire Line
	5450 5050 5800 5050
Wire Wire Line
	5450 5150 5800 5150
Wire Wire Line
	5450 5250 5800 5250
$Sheet
S 4650 4400 800  1300
U 61D30C1E
F0 "sheet61D30C08" 50
F1 "pod.sch" 50
F2 "IO0" T R 5450 4550 50 
F3 "IO1" T R 5450 4650 50 
F4 "IO2" T R 5450 4750 50 
F5 "IO3" T R 5450 4850 50 
F6 "IO4" T R 5450 4950 50 
F7 "IO5" T R 5450 5050 50 
F8 "IO6" T R 5450 5150 50 
F9 "IO7" T R 5450 5250 50 
F10 "FPD0" T L 4650 4550 50 
F11 "FPD1" T L 4650 4650 50 
F12 "FPD2" T L 4650 4750 50 
F13 "FPD3" T L 4650 4850 50 
F14 "FPD4" T L 4650 4950 50 
F15 "FPD5" T L 4650 5050 50 
F16 "FPD6" T L 4650 5150 50 
F17 "FPD7" T L 4650 5250 50 
F18 "WRITE" I R 5450 5450 50 
F19 "~DRIVE" I R 5450 5550 50 
F20 "SAMPLE" I L 4650 5450 50 
F21 "~READ" I L 4650 5550 50 
$EndSheet
Text Label 5800 3000 2    50   ~ 0
AB8
Text Label 5800 3100 2    50   ~ 0
AB9
Text Label 5800 3200 2    50   ~ 0
AB10
Text Label 5800 3300 2    50   ~ 0
AB11
Text Label 5800 3400 2    50   ~ 0
AB12
Text Label 5800 3500 2    50   ~ 0
AB13
Text Label 5800 3600 2    50   ~ 0
AB14
Text Label 5800 3700 2    50   ~ 0
AB15
Text Label 5800 4550 2    50   ~ 0
AB16
Text Label 5800 4650 2    50   ~ 0
AB17
Text Label 5800 4750 2    50   ~ 0
AB18
Text Label 5800 4850 2    50   ~ 0
AB19
Text Label 5800 4950 2    50   ~ 0
AB20
Text Label 5800 5050 2    50   ~ 0
AB21
Text Label 5800 5150 2    50   ~ 0
AB22
Text Label 5800 5250 2    50   ~ 0
AB23
Text Label 6050 1450 0    50   ~ 0
FPD0
Text Label 6050 1550 0    50   ~ 0
FPD1
Text Label 6050 1650 0    50   ~ 0
FPD2
Text Label 6050 1750 0    50   ~ 0
FPD3
Text Label 6050 1850 0    50   ~ 0
FPD4
Text Label 6050 1950 0    50   ~ 0
FPD5
Text Label 6050 2050 0    50   ~ 0
FPD6
Text Label 6050 2150 0    50   ~ 0
FPD7
Wire Wire Line
	6400 2150 6050 2150
Wire Wire Line
	6400 2050 6050 2050
Wire Wire Line
	6400 1950 6050 1950
Wire Wire Line
	6400 1850 6050 1850
Wire Wire Line
	6400 1750 6050 1750
Wire Wire Line
	6400 1650 6050 1650
Wire Wire Line
	6400 1550 6050 1550
Wire Wire Line
	6400 1450 6050 1450
Wire Wire Line
	6400 2350 6050 2350
Text Label 6050 2350 0    50   ~ 0
BPCP
Wire Wire Line
	6400 2450 6050 2450
Text Label 6050 2450 0    50   ~ 0
~RDB0A
Text Label 6050 3000 0    50   ~ 0
FPD0
Text Label 6050 3100 0    50   ~ 0
FPD1
Text Label 6050 3200 0    50   ~ 0
FPD2
Text Label 6050 3300 0    50   ~ 0
FPD3
Text Label 6050 3400 0    50   ~ 0
FPD4
Text Label 6050 3500 0    50   ~ 0
FPD5
Text Label 6050 3600 0    50   ~ 0
FPD6
Text Label 6050 3700 0    50   ~ 0
FPD7
Wire Wire Line
	6400 3700 6050 3700
Wire Wire Line
	6400 3600 6050 3600
Wire Wire Line
	6400 3500 6050 3500
Wire Wire Line
	6400 3400 6050 3400
Wire Wire Line
	6400 3300 6050 3300
Wire Wire Line
	6400 3200 6050 3200
Wire Wire Line
	6400 3100 6050 3100
Wire Wire Line
	6400 3000 6050 3000
Wire Wire Line
	6400 3900 6050 3900
Text Label 6050 3900 0    50   ~ 0
BPCP
Wire Wire Line
	6400 4000 6050 4000
Text Label 6050 4000 0    50   ~ 0
~RDB1A
Text Label 7800 1450 0    50   ~ 0
FPD0
Text Label 7800 1550 0    50   ~ 0
FPD1
Text Label 7800 1650 0    50   ~ 0
FPD2
Text Label 7800 1750 0    50   ~ 0
FPD3
Text Label 7800 1850 0    50   ~ 0
FPD4
Text Label 7800 1950 0    50   ~ 0
FPD5
Text Label 7800 2050 0    50   ~ 0
FPD6
Text Label 7800 2150 0    50   ~ 0
FPD7
Wire Wire Line
	8150 2150 7800 2150
Wire Wire Line
	8150 2050 7800 2050
Wire Wire Line
	8150 1950 7800 1950
Wire Wire Line
	8150 1850 7800 1850
Wire Wire Line
	8150 1750 7800 1750
Wire Wire Line
	8150 1650 7800 1650
Wire Wire Line
	8150 1550 7800 1550
Wire Wire Line
	8150 1450 7800 1450
Wire Wire Line
	8150 2350 7800 2350
Text Label 7800 2350 0    50   ~ 0
BUSCP
Wire Wire Line
	8150 2450 7800 2450
Wire Wire Line
	8950 2350 9300 2350
Wire Wire Line
	8950 2450 9300 2450
Text Label 7800 2450 0    50   ~ 0
~RIB0
Text Label 9300 2350 2    50   ~ 0
~WIB0
Text Label 9300 2450 2    50   ~ 0
~IBOE
Text Label 7800 3000 0    50   ~ 0
FPD0
Text Label 7800 3100 0    50   ~ 0
FPD1
Text Label 7800 3200 0    50   ~ 0
FPD2
Text Label 7800 3300 0    50   ~ 0
FPD3
Text Label 7800 3400 0    50   ~ 0
FPD4
Text Label 7800 3500 0    50   ~ 0
FPD5
Text Label 7800 3600 0    50   ~ 0
FPD6
Text Label 7800 3700 0    50   ~ 0
FPD7
Wire Wire Line
	8150 3700 7800 3700
Wire Wire Line
	8150 3600 7800 3600
Wire Wire Line
	8150 3500 7800 3500
Wire Wire Line
	8150 3400 7800 3400
Wire Wire Line
	8150 3300 7800 3300
Wire Wire Line
	8150 3200 7800 3200
Wire Wire Line
	8150 3100 7800 3100
Wire Wire Line
	8150 3000 7800 3000
Wire Wire Line
	8150 3900 7800 3900
Text Label 7800 3900 0    50   ~ 0
BUSCP
Wire Wire Line
	8150 4000 7800 4000
Wire Wire Line
	8950 3900 9300 3900
Wire Wire Line
	8950 4000 9300 4000
Text Label 7800 4000 0    50   ~ 0
~RIB1
Text Label 9300 3900 2    50   ~ 0
~WIB1
Text Label 9300 4000 2    50   ~ 0
~IBOE
Text Label 2550 1450 0    50   ~ 0
FPD0
Text Label 2550 1550 0    50   ~ 0
FPD1
Text Label 2550 1650 0    50   ~ 0
FPD2
Text Label 2550 1750 0    50   ~ 0
FPD3
Text Label 2550 1850 0    50   ~ 0
FPD4
Text Label 2550 1950 0    50   ~ 0
FPD5
Text Label 2550 2050 0    50   ~ 0
FPD6
Text Label 2550 2150 0    50   ~ 0
FPD7
Wire Wire Line
	2900 2150 2550 2150
Wire Wire Line
	2900 2050 2550 2050
Wire Wire Line
	2900 1950 2550 1950
Wire Wire Line
	2900 1850 2550 1850
Wire Wire Line
	2900 1750 2550 1750
Wire Wire Line
	2900 1650 2550 1650
Wire Wire Line
	2900 1550 2550 1550
Wire Wire Line
	2900 1450 2550 1450
Wire Wire Line
	2900 2350 2550 2350
Text Label 2550 2350 0    50   ~ 0
BUSCP
Wire Wire Line
	3700 2350 4000 2350
Wire Wire Line
	3700 2450 4000 2450
Text Label 2550 3000 0    50   ~ 0
FPD0
Text Label 2550 3100 0    50   ~ 0
FPD1
Text Label 2550 3200 0    50   ~ 0
FPD2
Text Label 2550 3300 0    50   ~ 0
FPD3
Text Label 2550 3400 0    50   ~ 0
FPD4
Text Label 2550 3500 0    50   ~ 0
FPD5
Text Label 2550 3600 0    50   ~ 0
FPD6
Text Label 2550 3700 0    50   ~ 0
FPD7
Wire Wire Line
	2900 3700 2550 3700
Wire Wire Line
	2900 3600 2550 3600
Wire Wire Line
	2900 3500 2550 3500
Wire Wire Line
	2900 3400 2550 3400
Wire Wire Line
	2900 3300 2550 3300
Wire Wire Line
	2900 3200 2550 3200
Wire Wire Line
	2900 3100 2550 3100
Wire Wire Line
	2900 3000 2550 3000
Wire Wire Line
	2900 3900 2550 3900
Text Label 2550 3900 0    50   ~ 0
BUSCP
Wire Wire Line
	2900 4000 2550 4000
Wire Wire Line
	3700 3900 4000 3900
Wire Wire Line
	3700 4000 4000 4000
Text Label 2550 4550 0    50   ~ 0
FPD0
Text Label 2550 4650 0    50   ~ 0
FPD1
Text Label 2550 4750 0    50   ~ 0
FPD2
Text Label 2550 4850 0    50   ~ 0
FPD3
Text Label 2550 4950 0    50   ~ 0
FPD4
Text Label 2550 5050 0    50   ~ 0
FPD5
Text Label 2550 5150 0    50   ~ 0
FPD6
Text Label 2550 5250 0    50   ~ 0
FPD7
Wire Wire Line
	2900 5250 2550 5250
Wire Wire Line
	2900 5150 2550 5150
Wire Wire Line
	2900 5050 2550 5050
Wire Wire Line
	2900 4950 2550 4950
Wire Wire Line
	2900 4850 2550 4850
Wire Wire Line
	2900 4750 2550 4750
Wire Wire Line
	2900 4650 2550 4650
Wire Wire Line
	2900 4550 2550 4550
Wire Wire Line
	2900 5450 2550 5450
Text Label 2550 5450 0    50   ~ 0
BUSCP
Wire Wire Line
	2900 5550 2550 5550
Wire Wire Line
	3700 5450 4000 5450
Wire Wire Line
	3700 5550 4000 5550
Wire Wire Line
	7200 1450 7550 1450
Wire Wire Line
	7200 2150 7550 2150
Wire Wire Line
	7200 2050 7550 2050
Wire Wire Line
	7200 1950 7550 1950
Wire Wire Line
	7200 1850 7550 1850
Wire Wire Line
	7200 1750 7550 1750
Wire Wire Line
	7200 1650 7550 1650
Wire Wire Line
	7200 1550 7550 1550
Text Label 7550 4000 2    50   ~ 0
~DBOE
Text Label 7550 3900 2    50   ~ 0
~WDB1
Wire Wire Line
	7200 4000 7550 4000
Wire Wire Line
	7200 3900 7550 3900
Text Label 7550 2450 2    50   ~ 0
~DBOE
Text Label 7550 2350 2    50   ~ 0
~WDB0
Wire Wire Line
	7200 2450 7550 2450
Wire Wire Line
	7200 2350 7550 2350
Wire Wire Line
	7200 3700 7550 3700
Wire Wire Line
	7200 3600 7550 3600
Wire Wire Line
	7200 3500 7550 3500
Wire Wire Line
	7200 3400 7550 3400
Wire Wire Line
	7200 3300 7550 3300
Wire Wire Line
	7200 3200 7550 3200
Wire Wire Line
	7200 3100 7550 3100
Wire Wire Line
	7200 3000 7550 3000
Text Label 7550 3700 2    50   ~ 0
DB15
Text Label 7550 3600 2    50   ~ 0
DB14
Text Label 7550 3500 2    50   ~ 0
DB13
Text Label 7550 3400 2    50   ~ 0
DB12
Text Label 7550 3300 2    50   ~ 0
DB11
Text Label 7550 3200 2    50   ~ 0
DB10
Text Label 7550 3100 2    50   ~ 0
DB9
Text Label 7550 3000 2    50   ~ 0
DB8
Text Label 7550 2150 2    50   ~ 0
DB7
Text Label 7550 2050 2    50   ~ 0
DB6
Text Label 7550 1950 2    50   ~ 0
DB5
Text Label 7550 1850 2    50   ~ 0
DB4
Text Label 7550 1750 2    50   ~ 0
DB3
Text Label 7550 1650 2    50   ~ 0
DB2
Text Label 7550 1550 2    50   ~ 0
DB1
Text Label 7550 1450 2    50   ~ 0
DB0
Wire Wire Line
	3700 1950 3850 1950
Wire Wire Line
	3700 2050 3850 2050
Wire Wire Line
	3700 2150 3850 2150
NoConn ~ 3850 1950
NoConn ~ 3850 2050
NoConn ~ 3850 2150
Wire Wire Line
	3700 3500 3850 3500
Wire Wire Line
	3700 3600 3850 3600
Wire Wire Line
	3700 3700 3850 3700
NoConn ~ 3850 3500
NoConn ~ 3850 3600
NoConn ~ 3850 3700
Text Label 2550 2450 0    50   ~ 0
~RCV0
Text Label 2550 4000 0    50   ~ 0
~RCV1
Text Label 2550 5550 0    50   ~ 0
~RCV2
Text Label 4000 2350 2    50   ~ 0
~WCV0
Text Label 4000 3900 2    50   ~ 0
~WCV1
Text Label 4000 5450 2    50   ~ 0
~WCV2
Text Label 4000 2450 2    50   ~ 0
~CVOE
Text Label 4000 4000 2    50   ~ 0
~CVOE
Text Label 4000 5550 2    50   ~ 0
~CVOE
Wire Wire Line
	3700 4950 4050 4950
Wire Wire Line
	3700 5050 4050 5050
Wire Wire Line
	3700 5150 4050 5150
Wire Wire Line
	3700 5250 4050 5250
Text Label 4050 4950 2    50   ~ 0
COND0
Text Label 4050 5050 2    50   ~ 0
COND1
Text Label 4050 5150 2    50   ~ 0
COND2
Text Label 4050 5250 2    50   ~ 0
COND3
Text HLabel 10400 1750 2    50   BiDi ~ 0
COND[0..3]
Wire Bus Line
	10400 1750 9900 1750
Text Label 9900 1750 0    50   ~ 0
COND[0..3]
Wire Wire Line
	6500 4800 6900 4800
Text HLabel 6500 4900 0    50   Input ~ 0
~SCANCLR
Text Label 6550 4900 0    50   ~ 0
~SCANCLR
Text Label 6550 4800 0    50   ~ 0
BUSCP
Wire Wire Line
	6900 4900 6500 4900
Text HLabel 6500 4800 0    50   Input ~ 0
BUSCP
$Comp
L alexios:74HC08 U402
U 5 1 61FF49CC
P 6100 6650
F 0 "U402" H 6430 6146 50  0000 L CNN
F 1 "74HC08" H 6430 6055 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 6300 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6300 6200 50  0001 C CNN
	5    6100 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61FF49C6
P 5900 7300
AR Path="/61FF49C6" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61FF49C6" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/61FF49C6" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 5900 7050 50  0001 C CNN
F 1 "GND" H 5905 7127 50  0000 C CNN
F 2 "" H 5900 7300 50  0001 C CNN
F 3 "" H 5900 7300 50  0001 C CNN
	1    5900 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61FF49C0
P 5900 7100
AR Path="/61FF49C0" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61FF49C0" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/61FF49C0" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 5900 6950 50  0001 C CNN
F 1 "+5V" H 5915 7273 50  0000 C CNN
F 2 "" H 5900 7100 50  0001 C CNN
F 3 "" H 5900 7100 50  0001 C CNN
	1    5900 7100
	1    0    0    -1  
$EndComp
Connection ~ 5900 7300
Connection ~ 5900 7100
$Comp
L Device:C_Small C?
U 1 1 61FF49BA
P 5900 7200
AR Path="/61FF49BA" Ref="C?"  Part="1" 
AR Path="/60757845/61FF49BA" Ref="C?"  Part="1" 
AR Path="/66CDCD87/61FF49BA" Ref="C402"  Part="1" 
F 0 "C402" H 5809 7246 50  0000 R CNN
F 1 "100nF" H 5809 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5900 7200 50  0001 C CNN
F 3 "~" H 5900 7200 50  0001 C CNN
	1    5900 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U401
U 5 1 61FF165F
P 4800 6650
F 0 "U401" H 5130 6146 50  0000 L CNN
F 1 "74HC08" H 5130 6055 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5000 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5000 6200 50  0001 C CNN
	5    4800 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F339FB
P 4600 7300
AR Path="/61F339FB" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61F339FB" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/61F339FB" Ref="#PWR0402"  Part="1" 
F 0 "#PWR0402" H 4600 7050 50  0001 C CNN
F 1 "GND" H 4605 7127 50  0000 C CNN
F 2 "" H 4600 7300 50  0001 C CNN
F 3 "" H 4600 7300 50  0001 C CNN
	1    4600 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61F339F5
P 4600 7100
AR Path="/61F339F5" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61F339F5" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/61F339F5" Ref="#PWR0401"  Part="1" 
F 0 "#PWR0401" H 4600 6950 50  0001 C CNN
F 1 "+5V" H 4615 7273 50  0000 C CNN
F 2 "" H 4600 7100 50  0001 C CNN
F 3 "" H 4600 7100 50  0001 C CNN
	1    4600 7100
	1    0    0    -1  
$EndComp
Connection ~ 4600 7300
Connection ~ 4600 7100
$Comp
L Device:C_Small C?
U 1 1 61F339EF
P 4600 7200
AR Path="/61F339EF" Ref="C?"  Part="1" 
AR Path="/60757845/61F339EF" Ref="C?"  Part="1" 
AR Path="/66CDCD87/61F339EF" Ref="C401"  Part="1" 
F 0 "C401" H 4509 7246 50  0000 R CNN
F 1 "100nF" H 4509 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 7200 50  0001 C CNN
F 3 "~" H 4600 7200 50  0001 C CNN
	1    4600 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5250 8250 5250
Wire Wire Line
	8600 6150 8550 6150
Wire Wire Line
	8600 6250 8550 6250
Wire Wire Line
	8600 4800 8250 4800
Wire Wire Line
	6900 5250 6550 5250
Text Label 6550 5250 0    50   ~ 0
~RAB0
Text Label 6550 5700 0    50   ~ 0
~RAB1
Text Label 6550 6150 0    50   ~ 0
~RAB2
Text Label 8250 4800 0    50   ~ 0
~RDB0
Text Label 8250 5250 0    50   ~ 0
~RDB1
Text Label 6550 5350 0    50   ~ 0
~FPABL
Text Label 6550 5800 0    50   ~ 0
~FPABM
Text Label 6550 6250 0    50   ~ 0
~FPABH
Text Label 8250 4900 0    50   ~ 0
~FPDBL
Text Label 8250 5350 0    50   ~ 0
~FPDBH
Wire Wire Line
	6900 5700 6550 5700
Wire Wire Line
	6900 6150 6550 6150
Wire Wire Line
	8600 5800 8550 5800
Wire Wire Line
	8600 5700 8550 5700
NoConn ~ 9050 5750
NoConn ~ 9050 6200
Wire Wire Line
	8550 5700 8550 5800
Connection ~ 8550 5800
Wire Wire Line
	8550 5800 8550 5850
$Comp
L power:GND #PWR0131
U 1 1 62D6B255
P 8550 5850
F 0 "#PWR0131" H 8550 5600 50  0001 C CNN
F 1 "GND" H 8555 5677 50  0000 C CNN
F 2 "" H 8550 5850 50  0001 C CNN
F 3 "" H 8550 5850 50  0001 C CNN
	1    8550 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 6150 8550 6250
Connection ~ 8550 6250
Wire Wire Line
	8550 6250 8550 6300
$Comp
L power:GND #PWR0132
U 1 1 62D6B678
P 8550 6300
F 0 "#PWR0132" H 8550 6050 50  0001 C CNN
F 1 "GND" H 8555 6127 50  0000 C CNN
F 2 "" H 8550 6300 50  0001 C CNN
F 3 "" H 8550 6300 50  0001 C CNN
	1    8550 6300
	1    0    0    -1  
$EndComp
Text HLabel 6500 5350 0    50   Input ~ 0
~FPABL
Wire Wire Line
	6500 5350 6900 5350
Text HLabel 6500 5800 0    50   Input ~ 0
~FPABM
Wire Wire Line
	6500 5800 6900 5800
Text HLabel 6500 6250 0    50   Input ~ 0
~FPABH
Wire Wire Line
	6500 6250 6900 6250
Text HLabel 8200 4900 0    50   Input ~ 0
~FPDBL
Wire Wire Line
	8200 4900 8600 4900
Text HLabel 8200 5350 0    50   Input ~ 0
~FPDBH
Wire Wire Line
	8200 5350 8600 5350
Text Notes 3350 2100 1    50   ~ 10
µCV 1/3
Text Notes 3350 3600 1    50   ~ 10
µCV 2/3
Text Notes 3350 5150 1    50   ~ 10
µCV 3/3
Text Notes 5100 2100 1    50   ~ 10
AB LO
Text Notes 6850 2100 1    50   ~ 10
DB LO
Text Notes 8600 2100 1    50   ~ 10
IBUS LO
Text Notes 5100 3600 1    50   ~ 10
AB MID
Text Notes 5100 5150 1    50   ~ 10
AB HI
Text Notes 6850 3600 1    50   ~ 10
DB HI
Text Notes 8600 3600 1    50   ~ 10
IBUS HI
Text HLabel 1200 1500 0    50   Input ~ 0
BUSCP
Entry Bus Bus
	2350 1150 2450 1250
Entry Wire Line
	2450 1350 2550 1450
Entry Wire Line
	2450 1450 2550 1550
Entry Wire Line
	2450 1550 2550 1650
Entry Wire Line
	2450 1650 2550 1750
Entry Wire Line
	2450 1750 2550 1850
Entry Wire Line
	2450 1850 2550 1950
Entry Wire Line
	2450 1950 2550 2050
Entry Wire Line
	2450 2050 2550 2150
Wire Wire Line
	2900 2450 2550 2450
Text HLabel 1200 3600 0    50   Input ~ 0
~RCV0
Wire Wire Line
	1200 1700 1750 1700
Wire Wire Line
	1950 1700 2000 1700
Wire Wire Line
	2000 1700 2000 1600
Wire Wire Line
	1950 2000 2000 2000
Wire Wire Line
	2000 2000 2000 1700
Connection ~ 2000 1700
Connection ~ 2000 2000
Wire Wire Line
	1950 2350 2000 2350
Wire Wire Line
	2000 2000 2000 2350
Wire Wire Line
	1200 2350 1750 2350
Text Notes 1400 2600 0    50   ~ 0
~DBOE~ never floats.
Text Notes 6300 900  2    100  ~ 20
I/O Pods
Text Notes 1100 6150 0    100  ~ 20
I/O Pod Enables
Text Notes 1100 7150 0    50   ~ 0
These pods provide byte-wide multiplexed access just under\n80 signals. These include all three buses and the Micro-Control\nVector.\n\nInput: all buses are sampled simultaneously on the rising edge of\nBUSCP (µCU control) or the rising edge of ~SCANCLR~ (for front\npanel display). Pod values drive the FPD when ~IOE~ is low. This is\ndone via µCU control for all pods, or via the autonomic front panel\nscanner for the AB and DB pods. Negative-logic OR gates (AND)\nare provided to do this.\n\nOutput:  when ~OOE~ is low, pod values drive their respective buses.\nThis is done under µCU control only.
Wire Notes Line width 12 style solid
	3850 5900 950  5900
Wire Notes Line width 12 style solid
	950  5900 950  7300
Wire Notes Line width 12 style solid
	950  7300 3850 7300
Wire Notes Line width 12 style solid
	3850 7300 3850 5900
$Sheet
S 6400 1300 800  1300
U 61FBB558
F0 "sheet61FBB541" 50
F1 "pod.sch" 50
F2 "IO0" T R 7200 1450 50 
F3 "IO1" T R 7200 1550 50 
F4 "IO2" T R 7200 1650 50 
F5 "IO3" T R 7200 1750 50 
F6 "IO4" T R 7200 1850 50 
F7 "IO5" T R 7200 1950 50 
F8 "IO6" T R 7200 2050 50 
F9 "IO7" T R 7200 2150 50 
F10 "FPD0" T L 6400 1450 50 
F11 "FPD1" T L 6400 1550 50 
F12 "FPD2" T L 6400 1650 50 
F13 "FPD3" T L 6400 1750 50 
F14 "FPD4" T L 6400 1850 50 
F15 "FPD5" T L 6400 1950 50 
F16 "FPD6" T L 6400 2050 50 
F17 "FPD7" T L 6400 2150 50 
F18 "WRITE" I R 7200 2450 50 
F19 "~DRIVE" I R 7200 2350 50 
F20 "SAMPLE" I L 6400 2350 50 
F21 "~READ" I L 6400 2450 50 
$EndSheet
$Sheet
S 8150 2850 800  1300
U 6215CDCA
F0 "sheet6215CD56" 50
F1 "pod.sch" 50
F2 "IO0" T R 8950 3000 50 
F3 "IO1" T R 8950 3100 50 
F4 "IO2" T R 8950 3200 50 
F5 "IO3" T R 8950 3300 50 
F6 "IO4" T R 8950 3400 50 
F7 "IO5" T R 8950 3500 50 
F8 "IO6" T R 8950 3600 50 
F9 "IO7" T R 8950 3700 50 
F10 "FPD0" T L 8150 3000 50 
F11 "FPD1" T L 8150 3100 50 
F12 "FPD2" T L 8150 3200 50 
F13 "FPD3" T L 8150 3300 50 
F14 "FPD4" T L 8150 3400 50 
F15 "FPD5" T L 8150 3500 50 
F16 "FPD6" T L 8150 3600 50 
F17 "FPD7" T L 8150 3700 50 
F18 "WRITE" I R 8950 4000 50 
F19 "~DRIVE" I R 8950 3900 50 
F20 "SAMPLE" I L 8150 3900 50 
F21 "~READ" I L 8150 4000 50 
$EndSheet
$Sheet
S 6400 2850 800  1300
U 61FBB5B6
F0 "sheet61FBB542" 50
F1 "pod.sch" 50
F2 "IO0" T R 7200 3000 50 
F3 "IO1" T R 7200 3100 50 
F4 "IO2" T R 7200 3200 50 
F5 "IO3" T R 7200 3300 50 
F6 "IO4" T R 7200 3400 50 
F7 "IO5" T R 7200 3500 50 
F8 "IO6" T R 7200 3600 50 
F9 "IO7" T R 7200 3700 50 
F10 "FPD0" T L 6400 3000 50 
F11 "FPD1" T L 6400 3100 50 
F12 "FPD2" T L 6400 3200 50 
F13 "FPD3" T L 6400 3300 50 
F14 "FPD4" T L 6400 3400 50 
F15 "FPD5" T L 6400 3500 50 
F16 "FPD6" T L 6400 3600 50 
F17 "FPD7" T L 6400 3700 50 
F18 "WRITE" I R 7200 3900 50 
F19 "~DRIVE" I R 7200 4000 50 
F20 "SAMPLE" I L 6400 3900 50 
F21 "~READ" I L 6400 4000 50 
$EndSheet
$Sheet
S 4650 2850 800  1300
U 61D0EECC
F0 "sheet61D0EEB6" 50
F1 "pod.sch" 50
F2 "IO0" T R 5450 3000 50 
F3 "IO1" T R 5450 3100 50 
F4 "IO2" T R 5450 3200 50 
F5 "IO3" T R 5450 3300 50 
F6 "IO4" T R 5450 3400 50 
F7 "IO5" T R 5450 3500 50 
F8 "IO6" T R 5450 3600 50 
F9 "IO7" T R 5450 3700 50 
F10 "FPD0" T L 4650 3000 50 
F11 "FPD1" T L 4650 3100 50 
F12 "FPD2" T L 4650 3200 50 
F13 "FPD3" T L 4650 3300 50 
F14 "FPD4" T L 4650 3400 50 
F15 "FPD5" T L 4650 3500 50 
F16 "FPD6" T L 4650 3600 50 
F17 "FPD7" T L 4650 3700 50 
F18 "WRITE" I R 5450 3900 50 
F19 "~DRIVE" I R 5450 4000 50 
F20 "SAMPLE" I L 4650 3900 50 
F21 "~READ" I L 4650 4000 50 
$EndSheet
$Sheet
S 2900 2850 800  1300
U 621C999E
F0 "sheet621C9909" 50
F1 "pod.sch" 50
F2 "IO0" T R 3700 3000 50 
F3 "IO1" T R 3700 3100 50 
F4 "IO2" T R 3700 3200 50 
F5 "IO3" T R 3700 3300 50 
F6 "IO4" T R 3700 3400 50 
F7 "IO5" T R 3700 3500 50 
F8 "IO6" T R 3700 3600 50 
F9 "IO7" T R 3700 3700 50 
F10 "FPD0" T L 2900 3000 50 
F11 "FPD1" T L 2900 3100 50 
F12 "FPD2" T L 2900 3200 50 
F13 "FPD3" T L 2900 3300 50 
F14 "FPD4" T L 2900 3400 50 
F15 "FPD5" T L 2900 3500 50 
F16 "FPD6" T L 2900 3600 50 
F17 "FPD7" T L 2900 3700 50 
F18 "WRITE" I R 3700 3900 50 
F19 "~DRIVE" I R 3700 4000 50 
F20 "SAMPLE" I L 2900 3900 50 
F21 "~READ" I L 2900 4000 50 
$EndSheet
$Sheet
S 4650 1300 800  1300
U 61678CAE
F0 "8-bit I/O Pod" 50
F1 "pod.sch" 50
F2 "IO0" T R 5450 1450 50 
F3 "IO1" T R 5450 1550 50 
F4 "IO2" T R 5450 1650 50 
F5 "IO3" T R 5450 1750 50 
F6 "IO4" T R 5450 1850 50 
F7 "IO5" T R 5450 1950 50 
F8 "IO6" T R 5450 2050 50 
F9 "IO7" T R 5450 2150 50 
F10 "FPD0" T L 4650 1450 50 
F11 "FPD1" T L 4650 1550 50 
F12 "FPD2" T L 4650 1650 50 
F13 "FPD3" T L 4650 1750 50 
F14 "FPD4" T L 4650 1850 50 
F15 "FPD5" T L 4650 1950 50 
F16 "FPD6" T L 4650 2050 50 
F17 "FPD7" T L 4650 2150 50 
F18 "WRITE" I R 5450 2350 50 
F19 "~DRIVE" I R 5450 2450 50 
F20 "SAMPLE" I L 4650 2350 50 
F21 "~READ" I L 4650 2450 50 
$EndSheet
$Sheet
S 2900 1300 800  1300
U 621C9920
F0 "sheet621C9908" 50
F1 "pod.sch" 50
F2 "IO0" T R 3700 1450 50 
F3 "IO1" T R 3700 1550 50 
F4 "IO2" T R 3700 1650 50 
F5 "IO3" T R 3700 1750 50 
F6 "IO4" T R 3700 1850 50 
F7 "IO5" T R 3700 1950 50 
F8 "IO6" T R 3700 2050 50 
F9 "IO7" T R 3700 2150 50 
F10 "FPD0" T L 2900 1450 50 
F11 "FPD1" T L 2900 1550 50 
F12 "FPD2" T L 2900 1650 50 
F13 "FPD3" T L 2900 1750 50 
F14 "FPD4" T L 2900 1850 50 
F15 "FPD5" T L 2900 1950 50 
F16 "FPD6" T L 2900 2050 50 
F17 "FPD7" T L 2900 2150 50 
F18 "WRITE" I R 3700 2350 50 
F19 "~DRIVE" I R 3700 2450 50 
F20 "SAMPLE" I L 2900 2350 50 
F21 "~READ" I L 2900 2450 50 
$EndSheet
$Sheet
S 2900 4400 800  1300
U 621C99B4
F0 "sheet621C990A" 50
F1 "pod.sch" 50
F2 "IO0" T R 3700 4550 50 
F3 "IO1" T R 3700 4650 50 
F4 "IO2" T R 3700 4750 50 
F5 "IO3" T R 3700 4850 50 
F6 "IO4" T R 3700 4950 50 
F7 "IO5" T R 3700 5050 50 
F8 "IO6" T R 3700 5150 50 
F9 "IO7" T R 3700 5250 50 
F10 "FPD0" T L 2900 4550 50 
F11 "FPD1" T L 2900 4650 50 
F12 "FPD2" T L 2900 4750 50 
F13 "FPD3" T L 2900 4850 50 
F14 "FPD4" T L 2900 4950 50 
F15 "FPD5" T L 2900 5050 50 
F16 "FPD6" T L 2900 5150 50 
F17 "FPD7" T L 2900 5250 50 
F18 "WRITE" I R 3700 5450 50 
F19 "~DRIVE" I R 3700 5550 50 
F20 "SAMPLE" I L 2900 5450 50 
F21 "~READ" I L 2900 5550 50 
$EndSheet
$Sheet
S 8150 1300 800  1300
U 6215CD84
F0 "sheet6215CD55" 50
F1 "pod.sch" 50
F2 "IO0" T R 8950 1450 50 
F3 "IO1" T R 8950 1550 50 
F4 "IO2" T R 8950 1650 50 
F5 "IO3" T R 8950 1750 50 
F6 "IO4" T R 8950 1850 50 
F7 "IO5" T R 8950 1950 50 
F8 "IO6" T R 8950 2050 50 
F9 "IO7" T R 8950 2150 50 
F10 "FPD0" T L 8150 1450 50 
F11 "FPD1" T L 8150 1550 50 
F12 "FPD2" T L 8150 1650 50 
F13 "FPD3" T L 8150 1750 50 
F14 "FPD4" T L 8150 1850 50 
F15 "FPD5" T L 8150 1950 50 
F16 "FPD6" T L 8150 2050 50 
F17 "FPD7" T L 8150 2150 50 
F18 "WRITE" I R 8950 2450 50 
F19 "~DRIVE" I R 8950 2350 50 
F20 "SAMPLE" I L 8150 2350 50 
F21 "~READ" I L 8150 2450 50 
$EndSheet
Text Label 9350 5300 2    50   ~ 0
~RDB1A
Text Label 9350 4850 2    50   ~ 0
~RDB0A
Wire Wire Line
	9050 4850 9350 4850
Wire Wire Line
	9050 5300 9350 5300
Wire Bus Line
	2450 1250 2450 2050
Wire Wire Line
	7350 6200 7650 6200
Wire Wire Line
	7350 5750 7650 5750
Text Label 7650 5750 2    50   ~ 0
~RAB1A
Text Label 7650 6200 2    50   ~ 0
~RAB2A
Text Label 7650 5300 2    50   ~ 0
~RAB0A
Wire Wire Line
	7350 5300 7650 5300
Wire Wire Line
	7350 4850 7650 4850
Text Label 7650 4850 2    50   ~ 0
BPCP
$Comp
L alexios:74HC08 U402
U 3 1 61FEAB81
P 8700 5800
F 0 "U402" H 8825 5675 50  0000 C CNN
F 1 "74HC08" H 8825 5584 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 8900 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8900 5350 50  0001 C CNN
	3    8700 5800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U402
U 2 1 61FE9961
P 8700 5350
F 0 "U402" H 8825 5225 50  0000 C CNN
F 1 "74HC08" H 8825 5134 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 8900 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8900 4900 50  0001 C CNN
	2    8700 5350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U401
U 2 1 627A4D3C
P 8700 4900
F 0 "U401" H 8825 4775 50  0000 C CNN
F 1 "74HC08" H 8825 4684 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 8900 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8900 4450 50  0001 C CNN
	2    8700 4900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U402
U 4 1 624150B9
P 8700 4450
F 0 "U402" H 8825 4325 50  0000 C CNN
F 1 "74HC08" H 8825 4234 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 8900 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8900 4000 50  0001 C CNN
	4    8700 4450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U402
U 1 1 61FE438A
P 7000 5800
F 0 "U402" H 7125 5675 50  0000 C CNN
F 1 "74HC08" H 7125 5584 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7200 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7200 5350 50  0001 C CNN
	1    7000 5800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U401
U 4 1 626F0E3A
P 7000 5350
F 0 "U401" H 7125 5225 50  0000 C CNN
F 1 "74HC08" H 7125 5134 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7200 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7200 4900 50  0001 C CNN
	4    7000 5350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U401
U 1 1 61FEF78C
P 7000 4900
F 0 "U401" H 7125 4775 50  0000 C CNN
F 1 "74HC08" H 7125 4684 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7200 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7200 4450 50  0001 C CNN
	1    7000 4900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U401
U 3 1 6272CC8C
P 7000 4450
F 0 "U401" H 7125 4325 50  0000 C CNN
F 1 "74HC08" H 7125 4234 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7200 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7200 4000 50  0001 C CNN
	3    7000 4450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
