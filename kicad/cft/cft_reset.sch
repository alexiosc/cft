EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 24
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
L alexios:74HC590 U1001
U 1 1 5E4EA465
P 5050 2350
F 0 "U1001" H 5050 3117 50  0000 C CNN
F 1 "74HC590" H 5050 3026 50  0000 C CNN
F 2 "" H 5050 2400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 5050 2400 50  0001 C CNN
	1    5050 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2350 3900 2350
Text Label 4000 2350 0    50   ~ 0
~RESET
Wire Wire Line
	4550 2050 4500 2050
Text Label 4000 2050 0    50   ~ 0
CLK3
Wire Wire Line
	4550 2150 4500 2150
Wire Wire Line
	4500 2150 4500 2050
Connection ~ 4500 2050
Wire Wire Line
	4500 2050 3900 2050
Wire Wire Line
	5700 3050 5700 2550
Wire Wire Line
	5700 2550 5550 2550
NoConn ~ 5550 1850
NoConn ~ 5550 1950
NoConn ~ 5550 2050
NoConn ~ 5550 2150
NoConn ~ 5550 2250
NoConn ~ 5550 2350
NoConn ~ 5550 2450
$Comp
L alexios:74HC590 U1001
U 2 1 5E4EA47C
P 7150 4100
F 0 "U1001" H 7330 4496 50  0000 L CNN
F 1 "74HC590" H 7330 4405 50  0000 L CNN
F 2 "" H 7150 4150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 7150 4150 50  0001 C CNN
	2    7150 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01002
U 1 1 5E4EA482
P 6800 3650
F 0 "#PWR01002" H 6800 3500 50  0001 C CNN
F 1 "+5V" H 6815 3823 50  0000 C CNN
F 2 "" H 6800 3650 50  0001 C CNN
F 3 "" H 6800 3650 50  0001 C CNN
	1    6800 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01004
U 1 1 5E4EA488
P 6800 3850
F 0 "#PWR01004" H 6800 3600 50  0001 C CNN
F 1 "GND" H 6805 3677 50  0000 C CNN
F 2 "" H 6800 3850 50  0001 C CNN
F 3 "" H 6800 3850 50  0001 C CNN
	1    6800 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E4EA48E
P 6800 3750
AR Path="/5CC0D65F/5E4EA48E" Ref="C?"  Part="1" 
AR Path="/5E4EA48E" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5E4EA48E" Ref="C1001"  Part="1" 
F 0 "C1001" H 6709 3796 50  0000 R CNN
F 1 "100nF" H 6709 3705 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6800 3750 50  0001 C CNN
F 3 "~" H 6800 3750 50  0001 C CNN
	1    6800 3750
	1    0    0    -1  
$EndComp
Connection ~ 6800 3650
Connection ~ 6800 3850
Wire Wire Line
	5700 2550 5900 2550
Connection ~ 5700 2550
$Comp
L Device:R_Small R1001
U 1 1 5E4EA498
P 6000 2550
F 0 "R1001" V 5804 2550 50  0000 C CNN
F 1 "30Ω" V 5895 2550 50  0000 C CNN
F 2 "" H 6000 2550 50  0001 C CNN
F 3 "~" H 6000 2550 50  0001 C CNN
	1    6000 2550
	0    1    1    0   
$EndComp
Text Label 6200 2550 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	6100 2550 6700 2550
$Comp
L alexios:74AC541 U1002
U 1 1 5E4EA4A0
P 5050 4000
F 0 "U1002" H 5050 4767 50  0000 C CNN
F 1 "74AC541" H 5050 4676 50  0000 C CNN
F 2 "" H 5050 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 5050 4000 50  0001 C CNN
	1    5050 4000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U1002
U 2 1 5E4EA4A6
P 7150 4500
F 0 "U1002" H 7330 4546 50  0000 L CNN
F 1 "74AC541" H 7330 4455 50  0000 L CNN
F 2 "" H 7150 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 7150 4500 50  0001 C CNN
	2    7150 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E4EA4AC
P 6800 4500
AR Path="/5CC0D65F/5E4EA4AC" Ref="C?"  Part="1" 
AR Path="/5E4EA4AC" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5E4EA4AC" Ref="C1002"  Part="1" 
F 0 "C1002" H 6709 4546 50  0000 R CNN
F 1 "100nF" H 6709 4455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6800 4500 50  0001 C CNN
F 3 "~" H 6800 4500 50  0001 C CNN
	1    6800 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01005
U 1 1 5E4EA4B2
P 6800 4400
F 0 "#PWR01005" H 6800 4250 50  0001 C CNN
F 1 "+5V" H 6815 4573 50  0000 C CNN
F 2 "" H 6800 4400 50  0001 C CNN
F 3 "" H 6800 4400 50  0001 C CNN
	1    6800 4400
	1    0    0    -1  
$EndComp
Connection ~ 6800 4400
$Comp
L power:GND #PWR01007
U 1 1 5E4EA4B9
P 6800 4600
F 0 "#PWR01007" H 6800 4350 50  0001 C CNN
F 1 "GND" H 6805 4427 50  0000 C CNN
F 2 "" H 6800 4600 50  0001 C CNN
F 3 "" H 6800 4600 50  0001 C CNN
	1    6800 4600
	1    0    0    -1  
$EndComp
Connection ~ 6800 4600
$Comp
L alexios:74AC541 U1003
U 1 1 5E4EA4C0
P 5050 5550
F 0 "U1003" H 5050 6317 50  0000 C CNN
F 1 "74AC541" H 5050 6226 50  0000 C CNN
F 2 "" H 5050 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 5050 5550 50  0001 C CNN
	1    5050 5550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U1003
U 2 1 5E4EA4C6
P 7150 5300
F 0 "U1003" H 7330 5346 50  0000 L CNN
F 1 "74AC541" H 7330 5255 50  0000 L CNN
F 2 "" H 7150 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 7150 5300 50  0001 C CNN
	2    7150 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E4EA4CC
P 6800 5300
AR Path="/5CC0D65F/5E4EA4CC" Ref="C?"  Part="1" 
AR Path="/5E4EA4CC" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5E4EA4CC" Ref="C1003"  Part="1" 
F 0 "C1003" H 6709 5346 50  0000 R CNN
F 1 "100nF" H 6709 5255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6800 5300 50  0001 C CNN
F 3 "~" H 6800 5300 50  0001 C CNN
	1    6800 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01010
U 1 1 5E4EA4D2
P 6800 5400
F 0 "#PWR01010" H 6800 5150 50  0001 C CNN
F 1 "GND" H 6805 5227 50  0000 C CNN
F 2 "" H 6800 5400 50  0001 C CNN
F 3 "" H 6800 5400 50  0001 C CNN
	1    6800 5400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01009
U 1 1 5E4EA4D8
P 6800 5200
F 0 "#PWR01009" H 6800 5050 50  0001 C CNN
F 1 "+5V" H 6815 5373 50  0000 C CNN
F 2 "" H 6800 5200 50  0001 C CNN
F 3 "" H 6800 5200 50  0001 C CNN
	1    6800 5200
	1    0    0    -1  
$EndComp
Connection ~ 6800 5400
Connection ~ 6800 5200
Text Label 6000 4750 1    50   ~ 0
IBUS[0..15]
Text Label 5600 5750 0    50   ~ 0
IBUS15
Text Label 5600 5650 0    50   ~ 0
IBUS14
Text Label 5600 5550 0    50   ~ 0
IBUS13
Text Label 5600 5450 0    50   ~ 0
IBUS12
Text Label 5600 5350 0    50   ~ 0
IBUS11
Text Label 5600 5250 0    50   ~ 0
IBUS10
Text Label 5600 5150 0    50   ~ 0
IBUS9
Text Label 5600 5050 0    50   ~ 0
IBUS8
Entry Wire Line
	6000 5650 5900 5750
Entry Wire Line
	6000 5550 5900 5650
Entry Wire Line
	6000 5450 5900 5550
Entry Wire Line
	6000 5350 5900 5450
Wire Wire Line
	5900 5750 5550 5750
Wire Wire Line
	5900 5650 5550 5650
Wire Wire Line
	5900 5550 5550 5550
Wire Wire Line
	5550 5450 5900 5450
Entry Wire Line
	6000 5250 5900 5350
Entry Wire Line
	6000 5150 5900 5250
Entry Wire Line
	6000 5050 5900 5150
Entry Wire Line
	6000 4950 5900 5050
Wire Wire Line
	5900 5350 5550 5350
Wire Wire Line
	5900 5250 5550 5250
Wire Wire Line
	5900 5150 5550 5150
Wire Wire Line
	5550 5050 5900 5050
Text Label 5600 4200 0    50   ~ 0
IBUS7
Text Label 5600 4100 0    50   ~ 0
IBUS6
Text Label 5600 4000 0    50   ~ 0
IBUS5
Text Label 5600 3900 0    50   ~ 0
IBUS4
Text Label 5600 3800 0    50   ~ 0
IBUS3
Text Label 5600 3700 0    50   ~ 0
IBUS2
Text Label 5600 3600 0    50   ~ 0
IBUS1
Text Label 5600 3500 0    50   ~ 0
IBUS0
Entry Wire Line
	6000 4100 5900 4200
Entry Wire Line
	6000 4000 5900 4100
Entry Wire Line
	6000 3900 5900 4000
Entry Wire Line
	6000 3800 5900 3900
Wire Wire Line
	5900 4200 5550 4200
Wire Wire Line
	5900 4100 5550 4100
Wire Wire Line
	5900 4000 5550 4000
Wire Wire Line
	5550 3900 5900 3900
Entry Wire Line
	6000 3700 5900 3800
Entry Wire Line
	6000 3600 5900 3700
Entry Wire Line
	6000 3500 5900 3600
Entry Wire Line
	6000 3400 5900 3500
Wire Wire Line
	5900 3800 5550 3800
Wire Wire Line
	5900 3700 5550 3700
Wire Wire Line
	5900 3600 5550 3600
Wire Wire Line
	5550 3500 5900 3500
Wire Wire Line
	4350 4400 4550 4400
Wire Wire Line
	4350 4400 4350 4500
Wire Wire Line
	4350 4500 4550 4500
Connection ~ 4350 4400
Wire Wire Line
	4350 4500 4350 5950
Wire Wire Line
	4350 5950 4550 5950
Connection ~ 4350 4500
Wire Wire Line
	4350 5950 4350 6050
Wire Wire Line
	4350 6050 4550 6050
Connection ~ 4350 5950
Wire Wire Line
	4550 3900 4250 3900
Wire Wire Line
	4250 3900 4250 4000
Wire Wire Line
	4550 5750 4500 5750
Wire Wire Line
	4550 5650 4500 5650
Connection ~ 4500 5650
Wire Wire Line
	4500 5650 4500 5750
Wire Wire Line
	4550 5050 4500 5050
Wire Wire Line
	4500 5050 4500 5150
Wire Wire Line
	4550 5150 4500 5150
Wire Wire Line
	4550 5250 4500 5250
Wire Wire Line
	4550 5350 4500 5350
Wire Wire Line
	4550 5450 4500 5450
Wire Wire Line
	4550 5550 4500 5550
Connection ~ 4500 5150
Wire Wire Line
	4500 5150 4500 5250
Connection ~ 4500 5250
Connection ~ 4500 5350
Connection ~ 4500 5450
Connection ~ 4500 5550
Wire Wire Line
	4550 4000 4250 4000
Wire Wire Line
	4500 5250 4500 5350
Wire Wire Line
	4500 5350 4500 5450
Wire Wire Line
	4500 5450 4500 5550
Wire Wire Line
	4500 5550 4500 5650
Connection ~ 4250 4000
Wire Wire Line
	4250 4000 4250 4100
Wire Wire Line
	4550 4100 4250 4100
Wire Wire Line
	4550 4200 4250 4200
Connection ~ 4250 4100
Wire Wire Line
	4250 4100 4250 4200
Connection ~ 4250 3900
Wire Wire Line
	4550 3500 4550 3600
Connection ~ 4550 3600
Wire Wire Line
	4550 3600 4550 3700
Connection ~ 4550 3700
Wire Wire Line
	4550 3700 4550 3800
Connection ~ 4550 3800
Wire Wire Line
	4550 3800 4550 3900
$Comp
L power:GND #PWR01006
U 1 1 5E4EA541
P 4550 4550
F 0 "#PWR01006" H 4550 4300 50  0001 C CNN
F 1 "GND" H 4555 4377 50  0000 C CNN
F 2 "" H 4550 4550 50  0001 C CNN
F 3 "" H 4550 4550 50  0001 C CNN
	1    4550 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01003
U 1 1 5E4EA547
P 4250 3800
F 0 "#PWR01003" H 4250 3650 50  0001 C CNN
F 1 "+5V" H 4192 3837 50  0000 R CNN
F 2 "" H 4250 3800 50  0001 C CNN
F 3 "" H 4250 3800 50  0001 C CNN
	1    4250 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3800 4250 3900
$Comp
L power:+5V #PWR01008
U 1 1 5E4EA54E
P 4500 5050
F 0 "#PWR01008" H 4500 4900 50  0001 C CNN
F 1 "+5V" H 4515 5223 50  0000 C CNN
F 2 "" H 4500 5050 50  0001 C CNN
F 3 "" H 4500 5050 50  0001 C CNN
	1    4500 5050
	1    0    0    -1  
$EndComp
Connection ~ 4500 5050
Wire Wire Line
	4350 3050 5700 3050
Wire Wire Line
	4350 1850 4350 3050
Wire Wire Line
	4550 1850 4350 1850
Entry Bus Bus
	6000 3200 6100 3100
Wire Bus Line
	6100 3100 6700 3100
Text Label 6200 3100 0    50   ~ 0
IBUS[0..15]
Text HLabel 6700 3100 2    50   3State ~ 0
IBUS[0..15]
Text HLabel 6700 2550 2    50   Output ~ 0
~RSTHOLD
Text HLabel 3900 2050 0    50   Input ~ 0
CLK3
Text HLabel 3900 2350 0    50   Input ~ 0
~RESET
Connection ~ 4350 3050
Wire Wire Line
	4350 3050 4350 4400
$Comp
L power:GND #PWR01001
U 1 1 5E4EA561
P 4550 2750
F 0 "#PWR01001" H 4550 2500 50  0001 C CNN
F 1 "GND" H 4555 2577 50  0000 C CNN
F 2 "" H 4550 2750 50  0001 C CNN
F 3 "" H 4550 2750 50  0001 C CNN
	1    4550 2750
	1    0    0    -1  
$EndComp
Connection ~ 4550 3900
Wire Wire Line
	4550 3900 4550 4000
Connection ~ 4550 4000
Wire Wire Line
	4550 4000 4550 4100
Connection ~ 4550 4100
Wire Wire Line
	4550 4100 4550 4200
Connection ~ 4550 4200
Wire Wire Line
	4550 4200 4550 4400
Connection ~ 4550 4400
Wire Wire Line
	4550 4400 4550 4500
Connection ~ 4550 4500
Wire Wire Line
	4550 4500 4550 4550
Text Notes 7100 7000 0    197  ~ 39
Reset Sequencer
Wire Bus Line
	6000 3200 6000 5650
$EndSCHEMATC
