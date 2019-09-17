EESchema Schematic File Version 4
LIBS:cft-dfp-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 13
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3700 2350 3700 3800
Text HLabel 2500 3700 0    50   Input ~ 0
µCVCPM
Text Label 2600 3700 0    50   ~ 0
µCVCPM
Entry Wire Line
	3600 2800 3500 2700
Entry Wire Line
	3600 2900 3500 2800
Entry Wire Line
	3600 3500 3500 3400
Entry Wire Line
	3600 3400 3500 3300
Entry Wire Line
	3600 3300 3500 3200
Entry Wire Line
	3600 3200 3500 3100
Entry Wire Line
	3600 3100 3500 3000
Entry Wire Line
	3600 3000 3500 2900
Text HLabel 2500 2250 0    50   Input ~ 0
µCVCPL
Text HLabel 2500 2350 0    50   Input ~ 0
~µCVOE
Wire Wire Line
	3700 2350 2500 2350
Connection ~ 3700 2350
Text HLabel 2500 900  0    50   3State ~ 0
FPD[0..7]
Text Label 2600 900  0    50   ~ 0
FPD[0..7]
Wire Bus Line
	3400 900  2500 900 
Entry Bus Bus
	3400 900  3500 1000
Text Label 2600 2250 0    50   ~ 0
µCVCPL
Wire Wire Line
	4100 3800 3700 3800
Text Label 2600 2350 0    50   ~ 0
~µCVOE
Wire Wire Line
	4100 2350 3700 2350
$Comp
L alexios:74HC574 U?
U 1 1 5D492997
P 4600 3300
AR Path="/5D492997" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D492997" Ref="U?"  Part="1" 
AR Path="/5D363063/5D492997" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D492997" Ref="U?"  Part="1" 
AR Path="/5E6A6F4A/5D492997" Ref="U1002"  Part="1" 
F 0 "U1002" H 4600 4067 50  0000 C CNN
F 1 "74HC574" H 4600 3976 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4300 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4300 3250 50  0001 C CNN
	1    4600 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 5D49299E
P 4600 1850
AR Path="/5D49299E" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D49299E" Ref="U?"  Part="1" 
AR Path="/5D363063/5D49299E" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D49299E" Ref="U?"  Part="1" 
AR Path="/5E6A6F4A/5D49299E" Ref="U1001"  Part="1" 
F 0 "U1001" H 4600 2617 50  0000 C CNN
F 1 "74HC574" H 4600 2526 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4300 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4300 1800 50  0001 C CNN
	1    4600 1850
	1    0    0    -1  
$EndComp
Entry Wire Line
	3600 1350 3500 1250
Entry Wire Line
	3600 1450 3500 1350
Entry Wire Line
	3600 2050 3500 1950
Entry Wire Line
	3600 1950 3500 1850
Entry Wire Line
	3600 1850 3500 1750
Entry Wire Line
	3600 1750 3500 1650
Entry Wire Line
	3600 1650 3500 1550
Entry Wire Line
	3600 1550 3500 1450
Wire Wire Line
	4100 5150 2500 5150
Wire Wire Line
	4100 5250 3700 5250
$Comp
L alexios:74HC574 U?
U 1 1 5D4929F9
P 4600 4750
AR Path="/5D4929F9" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D4929F9" Ref="U?"  Part="1" 
AR Path="/5D363063/5D4929F9" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D4929F9" Ref="U?"  Part="1" 
AR Path="/5E6A6F4A/5D4929F9" Ref="U1003"  Part="1" 
F 0 "U1003" H 4600 5517 50  0000 C CNN
F 1 "74HC574" H 4600 5426 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4300 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4300 4700 50  0001 C CNN
	1    4600 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3800 3700 5250
Connection ~ 3700 3800
Text HLabel 2500 5150 0    50   Input ~ 0
µCVCPH
Text Label 2600 5150 0    50   ~ 0
µCVCPH
$Comp
L power:GND #PWR?
U 1 1 5D49B81E
P 3850 7500
AR Path="/5D78E680/5D49B81E" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D49B81E" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D49B81E" Ref="#PWR?"  Part="1" 
AR Path="/5E6A6F4A/5D49B81E" Ref="#PWR01006"  Part="1" 
F 0 "#PWR01006" H 3850 7250 50  0001 C CNN
F 1 "GND" H 3855 7327 50  0000 C CNN
F 2 "" H 3850 7500 50  0001 C CNN
F 3 "" H 3850 7500 50  0001 C CNN
	1    3850 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D49B824
P 3850 7300
AR Path="/5D78E680/5D49B824" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D49B824" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D49B824" Ref="#PWR?"  Part="1" 
AR Path="/5E6A6F4A/5D49B824" Ref="#PWR01005"  Part="1" 
F 0 "#PWR01005" H 3850 7150 50  0001 C CNN
F 1 "+5V" H 3865 7473 50  0000 C CNN
F 2 "" H 3850 7300 50  0001 C CNN
F 3 "" H 3850 7300 50  0001 C CNN
	1    3850 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D49B82A
P 3850 7400
AR Path="/5D78E680/5D49B82A" Ref="C?"  Part="1" 
AR Path="/5D363063/5D49B82A" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D49B82A" Ref="C?"  Part="1" 
AR Path="/5E6A6F4A/5D49B82A" Ref="C1003"  Part="1" 
F 0 "C1003" H 3759 7446 50  0000 R CNN
F 1 "100nF" H 3759 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3850 7400 50  0001 C CNN
F 3 "~" H 3850 7400 50  0001 C CNN
	1    3850 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D49B831
P 4200 7400
AR Path="/5D49B831" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D49B831" Ref="U?"  Part="2" 
AR Path="/5D363063/5D49B831" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D49B831" Ref="U?"  Part="2" 
AR Path="/5E6A6F4A/5D49B831" Ref="U1003"  Part="2" 
F 0 "U1003" H 4379 7446 50  0000 L CNN
F 1 "74HC574" H 4379 7355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3900 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3900 7350 50  0001 C CNN
	2    4200 7400
	1    0    0    -1  
$EndComp
Connection ~ 3850 7500
Connection ~ 3850 7300
Text Label 4050 2250 2    50   ~ 0
µCVCPL
Text Label 4050 3700 2    50   ~ 0
µCVCPM
Wire Wire Line
	2500 2250 4100 2250
Wire Wire Line
	2500 3700 4100 3700
Text Label 4050 5150 2    50   ~ 0
µCVCPH
Text Label 4050 2350 2    50   ~ 0
~µCVOE
Text Label 4050 3800 2    50   ~ 0
~µCVOE
Text Label 4050 5250 2    50   ~ 0
~µCVOE
Entry Wire Line
	3600 4250 3500 4150
Entry Wire Line
	3600 4350 3500 4250
Entry Wire Line
	3600 4950 3500 4850
Entry Wire Line
	3600 4850 3500 4750
Entry Wire Line
	3600 4750 3500 4650
Entry Wire Line
	3600 4650 3500 4550
Entry Wire Line
	3600 4550 3500 4450
Entry Wire Line
	3600 4450 3500 4350
Wire Wire Line
	5100 1350 5850 1350
Wire Wire Line
	5100 1450 5850 1450
Wire Wire Line
	5100 1550 5850 1550
Wire Wire Line
	5100 1650 5850 1650
Wire Wire Line
	5100 1750 5850 1750
Wire Wire Line
	5100 2800 5850 2800
Wire Wire Line
	5100 2900 5850 2900
Wire Wire Line
	5100 3000 5850 3000
Wire Wire Line
	5100 3100 5850 3100
Wire Wire Line
	5100 3200 5850 3200
Text Label 5850 2800 2    50   ~ 0
WADDR0
Text Label 5850 2900 2    50   ~ 0
WADDR1
Text Label 5850 3000 2    50   ~ 0
WADDR2
Text Label 5850 3100 2    50   ~ 0
WADDR3
Text Label 5850 3200 2    50   ~ 0
WADDR4
Text Label 5850 1350 2    50   ~ 0
RADDR0
Text Label 5850 1450 2    50   ~ 0
RADDR1
Text Label 5850 1550 2    50   ~ 0
RADDR2
Text Label 5850 1650 2    50   ~ 0
RADDR3
Text Label 5850 1750 2    50   ~ 0
RADDR4
Entry Wire Line
	5950 1250 5850 1350
Entry Wire Line
	5950 1350 5850 1450
Entry Wire Line
	5950 1450 5850 1550
Entry Wire Line
	5950 1550 5850 1650
Entry Wire Line
	5950 1650 5850 1750
Entry Wire Line
	5950 2700 5850 2800
Entry Wire Line
	5950 2800 5850 2900
Entry Wire Line
	5950 2900 5850 3000
Entry Wire Line
	5950 3000 5850 3100
Entry Wire Line
	5950 3100 5850 3200
Entry Bus Bus
	5950 1000 6050 900 
Wire Bus Line
	6050 900  6650 900 
Entry Bus Bus
	5950 2450 6050 2350
Wire Bus Line
	6050 2350 6650 2350
Text HLabel 6650 900  2    50   3State ~ 0
RADDR[0..4]
Text HLabel 6650 2350 2    50   3State ~ 0
WADDR[0..4]
Wire Wire Line
	3600 1350 4100 1350
Wire Wire Line
	3600 1450 4100 1450
Wire Wire Line
	3600 1550 4100 1550
Wire Wire Line
	3600 1650 4100 1650
Wire Wire Line
	3600 1750 4100 1750
Wire Wire Line
	3600 1850 4100 1850
Wire Wire Line
	3600 1950 4100 1950
Wire Wire Line
	3600 2050 4100 2050
Text Label 4050 1350 2    50   ~ 0
FPD0
Text Label 4050 1450 2    50   ~ 0
FPD1
Text Label 4050 1550 2    50   ~ 0
FPD2
Text Label 4050 1650 2    50   ~ 0
FPD3
Text Label 4050 1750 2    50   ~ 0
FPD4
Text Label 4050 1850 2    50   ~ 0
FPD5
Text Label 4050 1950 2    50   ~ 0
FPD6
Text Label 4050 2050 2    50   ~ 0
FPD7
Wire Wire Line
	3600 2800 4100 2800
Wire Wire Line
	3600 2900 4100 2900
Wire Wire Line
	3600 3000 4100 3000
Wire Wire Line
	3600 3100 4100 3100
Wire Wire Line
	3600 3200 4100 3200
Wire Wire Line
	3600 3300 4100 3300
Wire Wire Line
	3600 3400 4100 3400
Wire Wire Line
	3600 3500 4100 3500
Text Label 4050 2800 2    50   ~ 0
FPD0
Text Label 4050 2900 2    50   ~ 0
FPD1
Text Label 4050 3000 2    50   ~ 0
FPD2
Text Label 4050 3100 2    50   ~ 0
FPD3
Text Label 4050 3200 2    50   ~ 0
FPD4
Text Label 4050 3300 2    50   ~ 0
FPD5
Text Label 4050 3400 2    50   ~ 0
FPD6
Text Label 4050 3500 2    50   ~ 0
FPD7
Wire Wire Line
	3600 4250 4100 4250
Wire Wire Line
	3600 4350 4100 4350
Wire Wire Line
	3600 4450 4100 4450
Wire Wire Line
	3600 4550 4100 4550
Wire Wire Line
	3600 4650 4100 4650
Wire Wire Line
	3600 4750 4100 4750
Wire Wire Line
	3600 4850 4100 4850
Wire Wire Line
	3600 4950 4100 4950
Text Label 4050 4250 2    50   ~ 0
FPD0
Text Label 4050 4350 2    50   ~ 0
FPD1
Text Label 4050 4450 2    50   ~ 0
FPD2
Text Label 4050 4550 2    50   ~ 0
FPD3
Text Label 4050 4650 2    50   ~ 0
FPD4
Text Label 4050 4750 2    50   ~ 0
FPD5
Text Label 4050 4850 2    50   ~ 0
FPD6
Text Label 4050 4950 2    50   ~ 0
FPD7
$Comp
L alexios:74HC574 U?
U 2 1 5D49B815
P 2750 7400
AR Path="/5D49B815" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D49B815" Ref="U?"  Part="2" 
AR Path="/5D363063/5D49B815" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D49B815" Ref="U?"  Part="2" 
AR Path="/5E6A6F4A/5D49B815" Ref="U1002"  Part="2" 
F 0 "U1002" H 2929 7446 50  0000 L CNN
F 1 "74HC574" H 2929 7355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2450 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2450 7350 50  0001 C CNN
	2    2750 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D49B80E
P 2400 7400
AR Path="/5D78E680/5D49B80E" Ref="C?"  Part="1" 
AR Path="/5D363063/5D49B80E" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D49B80E" Ref="C?"  Part="1" 
AR Path="/5E6A6F4A/5D49B80E" Ref="C1002"  Part="1" 
F 0 "C1002" H 2309 7446 50  0000 R CNN
F 1 "100nF" H 2309 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 7400 50  0001 C CNN
F 3 "~" H 2400 7400 50  0001 C CNN
	1    2400 7400
	1    0    0    -1  
$EndComp
Connection ~ 2400 7300
$Comp
L power:+5V #PWR?
U 1 1 5D49B808
P 2400 7300
AR Path="/5D78E680/5D49B808" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D49B808" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D49B808" Ref="#PWR?"  Part="1" 
AR Path="/5E6A6F4A/5D49B808" Ref="#PWR01003"  Part="1" 
F 0 "#PWR01003" H 2400 7150 50  0001 C CNN
F 1 "+5V" H 2415 7473 50  0000 C CNN
F 2 "" H 2400 7300 50  0001 C CNN
F 3 "" H 2400 7300 50  0001 C CNN
	1    2400 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D49B802
P 2400 7500
AR Path="/5D78E680/5D49B802" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D49B802" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D49B802" Ref="#PWR?"  Part="1" 
AR Path="/5E6A6F4A/5D49B802" Ref="#PWR01004"  Part="1" 
F 0 "#PWR01004" H 2400 7250 50  0001 C CNN
F 1 "GND" H 2405 7327 50  0000 C CNN
F 2 "" H 2400 7500 50  0001 C CNN
F 3 "" H 2400 7500 50  0001 C CNN
	1    2400 7500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D49B7F9
P 1300 7400
AR Path="/5D49B7F9" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D49B7F9" Ref="U?"  Part="2" 
AR Path="/5D363063/5D49B7F9" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D49B7F9" Ref="U?"  Part="2" 
AR Path="/5E6A6F4A/5D49B7F9" Ref="U1001"  Part="2" 
F 0 "U1001" H 1479 7446 50  0000 L CNN
F 1 "74HC574" H 1479 7355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1000 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1000 7350 50  0001 C CNN
	2    1300 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D49B7F2
P 950 7400
AR Path="/5D78E680/5D49B7F2" Ref="C?"  Part="1" 
AR Path="/5D363063/5D49B7F2" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D49B7F2" Ref="C?"  Part="1" 
AR Path="/5E6A6F4A/5D49B7F2" Ref="C1001"  Part="1" 
F 0 "C1001" H 859 7446 50  0000 R CNN
F 1 "100nF" H 859 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7400 50  0001 C CNN
F 3 "~" H 950 7400 50  0001 C CNN
	1    950  7400
	1    0    0    -1  
$EndComp
Connection ~ 950  7300
$Comp
L power:+5V #PWR?
U 1 1 5D49B7EC
P 950 7300
AR Path="/5D78E680/5D49B7EC" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D49B7EC" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D49B7EC" Ref="#PWR?"  Part="1" 
AR Path="/5E6A6F4A/5D49B7EC" Ref="#PWR01001"  Part="1" 
F 0 "#PWR01001" H 950 7150 50  0001 C CNN
F 1 "+5V" H 965 7473 50  0000 C CNN
F 2 "" H 950 7300 50  0001 C CNN
F 3 "" H 950 7300 50  0001 C CNN
	1    950  7300
	1    0    0    -1  
$EndComp
Connection ~ 950  7500
$Comp
L power:GND #PWR?
U 1 1 5D49B7E6
P 950 7500
AR Path="/5D78E680/5D49B7E6" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D49B7E6" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D49B7E6" Ref="#PWR?"  Part="1" 
AR Path="/5E6A6F4A/5D49B7E6" Ref="#PWR01002"  Part="1" 
F 0 "#PWR01002" H 950 7250 50  0001 C CNN
F 1 "GND" H 955 7327 50  0000 C CNN
F 2 "" H 950 7500 50  0001 C CNN
F 3 "" H 950 7500 50  0001 C CNN
	1    950  7500
	1    0    0    -1  
$EndComp
NoConn ~ 5100 1850
NoConn ~ 5100 1950
NoConn ~ 5100 2050
NoConn ~ 5100 3300
NoConn ~ 5100 3400
NoConn ~ 5100 3500
NoConn ~ 5100 4650
NoConn ~ 5100 4750
NoConn ~ 5100 4850
NoConn ~ 5100 4950
Wire Wire Line
	5100 4250 5850 4250
Wire Wire Line
	5100 4350 5850 4350
Wire Wire Line
	5100 4450 5850 4450
Wire Wire Line
	5100 4550 5850 4550
Text Label 5850 4250 2    50   ~ 0
ACTION0
Text Label 5850 4350 2    50   ~ 0
ACTION1
Text Label 5850 4450 2    50   ~ 0
ACTION2
Text Label 5850 4550 2    50   ~ 0
ACTION3
Entry Wire Line
	5950 4150 5850 4250
Entry Wire Line
	5950 4250 5850 4350
Entry Wire Line
	5950 4350 5850 4450
Entry Wire Line
	5950 4450 5850 4550
Entry Bus Bus
	5950 3800 6050 3700
Wire Bus Line
	6050 3700 6650 3700
Text HLabel 6650 3700 2    50   3State ~ 0
ACTION[0..3]
Connection ~ 2400 7500
Wire Bus Line
	5950 2450 5950 3100
Wire Bus Line
	5950 1000 5950 1650
Wire Bus Line
	5950 3800 5950 4450
Wire Bus Line
	3500 1000 3500 4850
$EndSCHEMATC
