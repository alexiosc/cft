EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 14
Title "Control Unit Pod"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4600 2950 4600 4400
Text HLabel 3400 4300 0    50   Input ~ 0
µCVCPM
Text Label 3500 4300 0    50   ~ 0
µCVCPM
Entry Wire Line
	4500 3400 4400 3300
Entry Wire Line
	4500 3500 4400 3400
Entry Wire Line
	4500 4100 4400 4000
Entry Wire Line
	4500 4000 4400 3900
Entry Wire Line
	4500 3900 4400 3800
Entry Wire Line
	4500 3800 4400 3700
Entry Wire Line
	4500 3700 4400 3600
Entry Wire Line
	4500 3600 4400 3500
Text HLabel 3400 2850 0    50   Input ~ 0
µCVCPL
Text HLabel 3400 2950 0    50   Input ~ 0
~CVOE
Wire Wire Line
	4600 2950 3400 2950
Connection ~ 4600 2950
Text HLabel 3400 1500 0    50   3State ~ 0
FPD[0..7]
Text Label 3500 1500 0    50   ~ 0
FPD[0..7]
Wire Bus Line
	4300 1500 3400 1500
Entry Bus Bus
	4300 1500 4400 1600
Text Label 3500 2850 0    50   ~ 0
µCVCPL
Wire Wire Line
	5000 4400 4600 4400
Text Label 3500 2950 0    50   ~ 0
~CVOE
Wire Wire Line
	5000 2950 4600 2950
$Comp
L alexios:74HC574 U?
U 1 1 5D492997
P 5500 3900
AR Path="/5D492997" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D492997" Ref="U?"  Part="1" 
AR Path="/5D363063/5D492997" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D492997" Ref="U?"  Part="1" 
AR Path="/5E6A6F4A/5D492997" Ref="U1002"  Part="1" 
F 0 "U1002" H 5500 4667 50  0000 C CNN
F 1 "74HC574" H 5500 4576 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5200 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5200 3850 50  0001 C CNN
	1    5500 3900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 5D49299E
P 5500 2450
AR Path="/5D49299E" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D49299E" Ref="U?"  Part="1" 
AR Path="/5D363063/5D49299E" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D49299E" Ref="U?"  Part="1" 
AR Path="/5E6A6F4A/5D49299E" Ref="U1001"  Part="1" 
F 0 "U1001" H 5500 3217 50  0000 C CNN
F 1 "74HC574" H 5500 3126 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5200 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5200 2400 50  0001 C CNN
	1    5500 2450
	1    0    0    -1  
$EndComp
Entry Wire Line
	4500 1950 4400 1850
Entry Wire Line
	4500 2050 4400 1950
Entry Wire Line
	4500 2650 4400 2550
Entry Wire Line
	4500 2550 4400 2450
Entry Wire Line
	4500 2450 4400 2350
Entry Wire Line
	4500 2350 4400 2250
Entry Wire Line
	4500 2250 4400 2150
Entry Wire Line
	4500 2150 4400 2050
Wire Wire Line
	5000 5750 3400 5750
Wire Wire Line
	5000 5850 4600 5850
$Comp
L alexios:74HC574 U?
U 1 1 5D4929F9
P 5500 5350
AR Path="/5D4929F9" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D4929F9" Ref="U?"  Part="1" 
AR Path="/5D363063/5D4929F9" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D4929F9" Ref="U?"  Part="1" 
AR Path="/5E6A6F4A/5D4929F9" Ref="U1003"  Part="1" 
F 0 "U1003" H 5500 6117 50  0000 C CNN
F 1 "74HC574" H 5500 6026 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5200 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5200 5300 50  0001 C CNN
	1    5500 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4400 4600 5850
Connection ~ 4600 4400
Text HLabel 3400 5750 0    50   Input ~ 0
µCVCPH
Text Label 3500 5750 0    50   ~ 0
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
Text Label 4950 2850 2    50   ~ 0
µCVCPL
Text Label 4950 4300 2    50   ~ 0
µCVCPM
Wire Wire Line
	3400 2850 5000 2850
Wire Wire Line
	3400 4300 5000 4300
Text Label 4950 5750 2    50   ~ 0
µCVCPH
Text Label 4950 2950 2    50   ~ 0
~CVOE
Text Label 4950 4400 2    50   ~ 0
~CVOE
Text Label 4950 5850 2    50   ~ 0
~CVOE
Entry Wire Line
	4500 4850 4400 4750
Entry Wire Line
	4500 4950 4400 4850
Entry Wire Line
	4500 5550 4400 5450
Entry Wire Line
	4500 5450 4400 5350
Entry Wire Line
	4500 5350 4400 5250
Entry Wire Line
	4500 5250 4400 5150
Entry Wire Line
	4500 5150 4400 5050
Entry Wire Line
	4500 5050 4400 4950
Wire Wire Line
	6000 1950 6750 1950
Wire Wire Line
	6000 2050 6750 2050
Wire Wire Line
	6000 2150 6750 2150
Wire Wire Line
	6000 2250 6750 2250
Wire Wire Line
	6000 2350 6750 2350
Wire Wire Line
	6000 3400 6750 3400
Wire Wire Line
	6000 3500 6750 3500
Wire Wire Line
	6000 3600 6750 3600
Wire Wire Line
	6000 3700 6750 3700
Wire Wire Line
	6000 3800 6750 3800
Text Label 6750 3400 2    50   ~ 0
WADDR0
Text Label 6750 3500 2    50   ~ 0
WADDR1
Text Label 6750 3600 2    50   ~ 0
WADDR2
Text Label 6750 3700 2    50   ~ 0
WADDR3
Text Label 6750 3800 2    50   ~ 0
WADDR4
Text Label 6750 1950 2    50   ~ 0
RADDR0
Text Label 6750 2050 2    50   ~ 0
RADDR1
Text Label 6750 2150 2    50   ~ 0
RADDR2
Text Label 6750 2250 2    50   ~ 0
RADDR3
Text Label 6750 2350 2    50   ~ 0
RADDR4
Entry Wire Line
	6850 1850 6750 1950
Entry Wire Line
	6850 1950 6750 2050
Entry Wire Line
	6850 2050 6750 2150
Entry Wire Line
	6850 2150 6750 2250
Entry Wire Line
	6850 2250 6750 2350
Entry Wire Line
	6850 3300 6750 3400
Entry Wire Line
	6850 3400 6750 3500
Entry Wire Line
	6850 3500 6750 3600
Entry Wire Line
	6850 3600 6750 3700
Entry Wire Line
	6850 3700 6750 3800
Entry Bus Bus
	6850 1600 6950 1500
Wire Bus Line
	6950 1500 7550 1500
Entry Bus Bus
	6850 3050 6950 2950
Wire Bus Line
	6950 2950 7550 2950
Text HLabel 7550 1500 2    50   3State ~ 0
RADDR[0..4]
Text HLabel 7550 2950 2    50   3State ~ 0
WADDR[0..4]
Wire Wire Line
	4500 1950 5000 1950
Wire Wire Line
	4500 2050 5000 2050
Wire Wire Line
	4500 2150 5000 2150
Wire Wire Line
	4500 2250 5000 2250
Wire Wire Line
	4500 2350 5000 2350
Wire Wire Line
	4500 2450 5000 2450
Wire Wire Line
	4500 2550 5000 2550
Wire Wire Line
	4500 2650 5000 2650
Text Label 4950 1950 2    50   ~ 0
FPD0
Text Label 4950 2050 2    50   ~ 0
FPD1
Text Label 4950 2150 2    50   ~ 0
FPD2
Text Label 4950 2250 2    50   ~ 0
FPD3
Text Label 4950 2350 2    50   ~ 0
FPD4
Text Label 4950 2450 2    50   ~ 0
FPD5
Text Label 4950 2550 2    50   ~ 0
FPD6
Text Label 4950 2650 2    50   ~ 0
FPD7
Wire Wire Line
	4500 3400 5000 3400
Wire Wire Line
	4500 3500 5000 3500
Wire Wire Line
	4500 3600 5000 3600
Wire Wire Line
	4500 3700 5000 3700
Wire Wire Line
	4500 3800 5000 3800
Wire Wire Line
	4500 3900 5000 3900
Wire Wire Line
	4500 4000 5000 4000
Wire Wire Line
	4500 4100 5000 4100
Text Label 4950 3400 2    50   ~ 0
FPD0
Text Label 4950 3500 2    50   ~ 0
FPD1
Text Label 4950 3600 2    50   ~ 0
FPD2
Text Label 4950 3700 2    50   ~ 0
FPD3
Text Label 4950 3800 2    50   ~ 0
FPD4
Text Label 4950 3900 2    50   ~ 0
FPD5
Text Label 4950 4000 2    50   ~ 0
FPD6
Text Label 4950 4100 2    50   ~ 0
FPD7
Wire Wire Line
	4500 4850 5000 4850
Wire Wire Line
	4500 4950 5000 4950
Wire Wire Line
	4500 5050 5000 5050
Wire Wire Line
	4500 5150 5000 5150
Wire Wire Line
	4500 5250 5000 5250
Wire Wire Line
	4500 5350 5000 5350
Wire Wire Line
	4500 5450 5000 5450
Wire Wire Line
	4500 5550 5000 5550
Text Label 4950 4850 2    50   ~ 0
FPD0
Text Label 4950 4950 2    50   ~ 0
FPD1
Text Label 4950 5050 2    50   ~ 0
FPD2
Text Label 4950 5150 2    50   ~ 0
FPD3
Text Label 4950 5250 2    50   ~ 0
FPD4
Text Label 4950 5350 2    50   ~ 0
FPD5
Text Label 4950 5450 2    50   ~ 0
FPD6
Text Label 4950 5550 2    50   ~ 0
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
NoConn ~ 6000 2450
NoConn ~ 6000 2550
NoConn ~ 6000 2650
NoConn ~ 6000 3900
NoConn ~ 6000 4000
NoConn ~ 6000 4100
NoConn ~ 6000 5250
NoConn ~ 6000 5350
NoConn ~ 6000 5450
NoConn ~ 6000 5550
Wire Wire Line
	6000 4850 6750 4850
Wire Wire Line
	6000 4950 6750 4950
Wire Wire Line
	6000 5050 6750 5050
Wire Wire Line
	6000 5150 6750 5150
Text Label 6750 4850 2    50   ~ 0
ACTION0
Text Label 6750 4950 2    50   ~ 0
ACTION1
Text Label 6750 5050 2    50   ~ 0
ACTION2
Text Label 6750 5150 2    50   ~ 0
ACTION3
Entry Wire Line
	6850 4750 6750 4850
Entry Wire Line
	6850 4850 6750 4950
Entry Wire Line
	6850 4950 6750 5050
Entry Wire Line
	6850 5050 6750 5150
Entry Bus Bus
	6850 4400 6950 4300
Wire Bus Line
	6950 4300 7550 4300
Text HLabel 7550 4300 2    50   3State ~ 0
ACTION[0..3]
Connection ~ 2400 7500
Wire Bus Line
	6850 3050 6850 3700
Wire Bus Line
	6850 1600 6850 2250
Wire Bus Line
	6850 4400 6850 5050
Wire Bus Line
	4400 1600 4400 5450
$EndSCHEMATC
