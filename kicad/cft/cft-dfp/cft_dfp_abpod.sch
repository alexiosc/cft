EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 13
Title "Address Bus Pod (24 bit I/O)"
Date "2019-11-17"
Rev "1945"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0602
U 1 1 5D318588
P 850 6800
AR Path="/5D78E680/5D318588" Ref="#PWR0602"  Part="1" 
AR Path="/5D363063/5D318588" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D318588" Ref="#PWR?"  Part="1" 
F 0 "#PWR0602" H 850 6550 50  0001 C CNN
F 1 "GND" H 855 6627 50  0000 C CNN
F 2 "" H 850 6800 50  0001 C CNN
F 3 "" H 850 6800 50  0001 C CNN
	1    850  6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0601
U 1 1 5D31858E
P 850 6600
AR Path="/5D78E680/5D31858E" Ref="#PWR0601"  Part="1" 
AR Path="/5D363063/5D31858E" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D31858E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0601" H 850 6450 50  0001 C CNN
F 1 "+5V" H 865 6773 50  0000 C CNN
F 2 "" H 850 6600 50  0001 C CNN
F 3 "" H 850 6600 50  0001 C CNN
	1    850  6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C601
U 1 1 5D318594
P 850 6700
AR Path="/5D78E680/5D318594" Ref="C601"  Part="1" 
AR Path="/5D363063/5D318594" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D318594" Ref="C?"  Part="1" 
F 0 "C601" H 759 6746 50  0000 R CNN
F 1 "100nF" H 759 6655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 850 6700 50  0001 C CNN
F 3 "~" H 850 6700 50  0001 C CNN
	1    850  6700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D31859B
P 1200 6700
AR Path="/5D31859B" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D31859B" Ref="U601"  Part="2" 
AR Path="/5D363063/5D31859B" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D31859B" Ref="U?"  Part="2" 
F 0 "U601" H 1379 6746 50  0000 L CNN
F 1 "74HC574" H 1379 6655 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 900 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 900 6650 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    1200 6700
	1    0    0    -1  
$EndComp
Connection ~ 850  6800
Connection ~ 850  6600
$Comp
L power:GND #PWR0610
U 1 1 5D3185C0
P 3750 6800
AR Path="/5D78E680/5D3185C0" Ref="#PWR0610"  Part="1" 
AR Path="/5D363063/5D3185C0" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D3185C0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0610" H 3750 6550 50  0001 C CNN
F 1 "GND" H 3755 6627 50  0000 C CNN
F 2 "" H 3750 6800 50  0001 C CNN
F 3 "" H 3750 6800 50  0001 C CNN
	1    3750 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0609
U 1 1 5D3185C6
P 3750 6600
AR Path="/5D78E680/5D3185C6" Ref="#PWR0609"  Part="1" 
AR Path="/5D363063/5D3185C6" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D3185C6" Ref="#PWR?"  Part="1" 
F 0 "#PWR0609" H 3750 6450 50  0001 C CNN
F 1 "+5V" H 3765 6773 50  0000 C CNN
F 2 "" H 3750 6600 50  0001 C CNN
F 3 "" H 3750 6600 50  0001 C CNN
	1    3750 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C605
U 1 1 5D3185CC
P 3750 6700
AR Path="/5D78E680/5D3185CC" Ref="C605"  Part="1" 
AR Path="/5D363063/5D3185CC" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D3185CC" Ref="C?"  Part="1" 
F 0 "C605" H 3659 6746 50  0000 R CNN
F 1 "100nF" H 3659 6655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 6700 50  0001 C CNN
F 3 "~" H 3750 6700 50  0001 C CNN
	1    3750 6700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D3185D3
P 4100 6700
AR Path="/5D3185D3" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D3185D3" Ref="U605"  Part="2" 
AR Path="/5D363063/5D3185D3" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D3185D3" Ref="U?"  Part="2" 
F 0 "U605" H 4279 6746 50  0000 L CNN
F 1 "74HC574" H 4279 6655 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3800 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3800 6650 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    4100 6700
	1    0    0    -1  
$EndComp
Connection ~ 3750 6800
Connection ~ 3750 6600
Wire Wire Line
	6200 3350 6850 3350
Wire Wire Line
	6200 3250 6850 3250
Wire Wire Line
	6200 3150 6850 3150
Wire Wire Line
	6200 3050 6850 3050
Wire Wire Line
	6200 2950 6850 2950
Wire Wire Line
	6200 2850 6850 2850
Wire Wire Line
	6200 2750 6850 2750
Wire Wire Line
	6200 2650 6850 2650
Wire Wire Line
	6200 1900 6850 1900
Wire Wire Line
	6200 1800 6850 1800
Wire Wire Line
	6200 1700 6850 1700
Wire Wire Line
	6200 1600 6850 1600
Wire Wire Line
	6200 1500 6850 1500
Wire Wire Line
	6200 1400 6850 1400
Wire Wire Line
	6200 1300 6850 1300
Wire Wire Line
	6200 1200 6850 1200
Text Label 6800 3350 2    50   ~ 0
AB15
Text Label 6800 3250 2    50   ~ 0
AB14
Text Label 6800 3150 2    50   ~ 0
AB13
Text Label 6800 3050 2    50   ~ 0
AB12
Text Label 6800 2950 2    50   ~ 0
AB11
Text Label 6800 2850 2    50   ~ 0
AB10
Text Label 6800 2750 2    50   ~ 0
AB9
Text Label 6800 2650 2    50   ~ 0
AB8
Text Label 6800 1900 2    50   ~ 0
AB7
Text Label 6800 1800 2    50   ~ 0
AB6
Text Label 6800 1700 2    50   ~ 0
AB5
Text Label 6800 1600 2    50   ~ 0
AB4
Text Label 6800 1500 2    50   ~ 0
AB3
Text Label 6800 1400 2    50   ~ 0
AB2
Text Label 6800 1300 2    50   ~ 0
AB1
Text Label 6800 1200 2    50   ~ 0
AB0
Text Label 5650 3350 0    50   ~ 0
AB15
Text Label 5650 3250 0    50   ~ 0
AB14
Text Label 5650 3150 0    50   ~ 0
AB13
Text Label 5650 3050 0    50   ~ 0
AB12
Text Label 5650 2950 0    50   ~ 0
AB11
Text Label 5650 2850 0    50   ~ 0
AB10
Text Label 5650 2750 0    50   ~ 0
AB9
Text Label 5650 2650 0    50   ~ 0
AB8
Text Label 5650 1900 0    50   ~ 0
AB7
Text Label 5650 1800 0    50   ~ 0
AB6
Text Label 5650 1700 0    50   ~ 0
AB5
Text Label 5650 1600 0    50   ~ 0
AB4
Text Label 5650 1500 0    50   ~ 0
AB3
Text Label 5650 1400 0    50   ~ 0
AB2
Text Label 5650 1300 0    50   ~ 0
AB1
Text Label 5650 1200 0    50   ~ 0
AB0
Wire Wire Line
	5600 3350 6000 3350
Wire Wire Line
	5600 3250 6000 3250
Wire Wire Line
	5600 3150 6000 3150
Wire Wire Line
	5600 3050 6000 3050
Wire Wire Line
	5600 2950 6000 2950
Wire Wire Line
	5600 2850 6000 2850
Wire Wire Line
	5600 2750 6000 2750
Wire Wire Line
	5600 2650 6000 2650
Wire Wire Line
	5600 1900 6000 1900
Wire Wire Line
	5600 1800 6000 1800
Wire Wire Line
	5600 1700 6000 1700
Wire Wire Line
	5600 1600 6000 1600
Wire Wire Line
	5600 1500 6000 1500
Wire Wire Line
	5600 1400 6000 1400
Wire Wire Line
	5600 1300 6000 1300
Wire Wire Line
	5600 1200 6000 1200
Wire Wire Line
	6300 3550 6300 5000
Text Label 4550 3550 2    50   ~ 0
CPM
Wire Wire Line
	6500 3650 6850 3650
Connection ~ 6300 3550
Wire Wire Line
	6300 3550 6850 3550
Wire Bus Line
	4200 5450 8250 5450
Entry Wire Line
	6200 2650 6100 2550
Entry Wire Line
	6200 3350 6100 3250
Entry Wire Line
	6200 3250 6100 3150
Entry Wire Line
	6200 3150 6100 3050
Entry Wire Line
	6200 3050 6100 2950
Entry Wire Line
	6200 2950 6100 2850
Entry Wire Line
	6200 2850 6100 2750
Entry Wire Line
	6200 2750 6100 2650
Entry Wire Line
	6200 1200 6100 1100
Entry Wire Line
	6200 1900 6100 1800
Entry Wire Line
	6200 1800 6100 1700
Entry Wire Line
	6200 1700 6100 1600
Entry Wire Line
	6200 1600 6100 1500
Entry Wire Line
	6200 1500 6100 1400
Entry Wire Line
	6200 1400 6100 1300
Entry Wire Line
	6200 1300 6100 1200
Wire Wire Line
	6400 2200 6850 2200
Wire Wire Line
	6300 2100 6300 3550
Text Label 6800 3650 2    50   ~ 0
~RM
Text Label 3200 5950 0    50   ~ 0
~RM
Text HLabel 3100 5950 0    50   Input ~ 0
~RM
Wire Wire Line
	4300 2200 4300 3650
Text HLabel 3100 3550 0    50   Input ~ 0
CPM
Text Label 3200 3550 0    50   ~ 0
CPM
Wire Wire Line
	4600 3550 3100 3550
Text Label 4550 3650 2    50   ~ 0
~OE
Text Label 4550 2200 2    50   ~ 0
~OE
Text Label 4550 2100 2    50   ~ 0
CPL
Text HLabel 3100 5850 0    50   Input ~ 0
~RL
Text HLabel 3100 5750 0    50   Input ~ 0
BUSCP
Text Label 3200 5850 0    50   ~ 0
~RL
Wire Wire Line
	6500 5950 3100 5950
Wire Wire Line
	6500 3650 6500 5950
Wire Wire Line
	6400 5850 3100 5850
Wire Wire Line
	6400 2200 6400 5850
Text Label 3200 5750 0    50   ~ 0
BUSCP
Wire Wire Line
	6300 2100 6850 2100
Wire Wire Line
	6300 5750 3100 5750
Text Label 7900 3350 0    50   ~ 0
FPD7
Text Label 7900 3250 0    50   ~ 0
FPD6
Text Label 7900 3150 0    50   ~ 0
FPD5
Text Label 7900 3050 0    50   ~ 0
FPD4
Text Label 7900 2950 0    50   ~ 0
FPD3
Text Label 7900 2850 0    50   ~ 0
FPD2
Text Label 7900 2750 0    50   ~ 0
FPD1
Text Label 7900 2650 0    50   ~ 0
FPD0
Wire Wire Line
	8250 3350 7850 3350
Wire Wire Line
	7850 2650 8250 2650
Wire Wire Line
	7850 2750 8250 2750
Wire Wire Line
	7850 2850 8250 2850
Wire Wire Line
	7850 2950 8250 2950
Wire Wire Line
	7850 3050 8250 3050
Wire Wire Line
	7850 3150 8250 3150
Wire Wire Line
	7850 3250 8250 3250
Text Label 7900 1900 0    50   ~ 0
FPD7
Text Label 7900 1800 0    50   ~ 0
FPD6
Text Label 7900 1700 0    50   ~ 0
FPD5
Text Label 7900 1600 0    50   ~ 0
FPD4
Text Label 7900 1500 0    50   ~ 0
FPD3
Text Label 7900 1400 0    50   ~ 0
FPD2
Text Label 7900 1300 0    50   ~ 0
FPD1
Text Label 7900 1200 0    50   ~ 0
FPD0
Wire Wire Line
	8250 1900 7850 1900
Wire Wire Line
	7850 1200 8250 1200
Wire Wire Line
	7850 1300 8250 1300
Wire Wire Line
	7850 1400 8250 1400
Wire Wire Line
	7850 1500 8250 1500
Wire Wire Line
	7850 1600 8250 1600
Wire Wire Line
	7850 1700 8250 1700
Wire Wire Line
	7850 1800 8250 1800
Entry Wire Line
	4200 2650 4100 2550
Entry Wire Line
	4200 2750 4100 2650
Entry Wire Line
	4200 3350 4100 3250
Entry Wire Line
	4200 3250 4100 3150
Entry Wire Line
	4200 3150 4100 3050
Entry Wire Line
	4200 3050 4100 2950
Entry Wire Line
	4200 2950 4100 2850
Entry Wire Line
	4200 2850 4100 2750
Text Label 4550 3350 2    50   ~ 0
FPD7
Text Label 4550 3250 2    50   ~ 0
FPD6
Text Label 4550 3150 2    50   ~ 0
FPD5
Text Label 4550 3050 2    50   ~ 0
FPD4
Text Label 4550 2950 2    50   ~ 0
FPD3
Text Label 4550 2850 2    50   ~ 0
FPD2
Text Label 4550 2750 2    50   ~ 0
FPD1
Text Label 4550 2650 2    50   ~ 0
FPD0
Wire Wire Line
	4200 3350 4600 3350
Wire Wire Line
	4600 2650 4200 2650
Wire Wire Line
	4600 2750 4200 2750
Wire Wire Line
	4600 2850 4200 2850
Wire Wire Line
	4600 2950 4200 2950
Wire Wire Line
	4600 3050 4200 3050
Wire Wire Line
	4600 3150 4200 3150
Wire Wire Line
	4600 3250 4200 3250
Text Label 4550 1900 2    50   ~ 0
FPD7
Text Label 4550 1800 2    50   ~ 0
FPD6
Text Label 4550 1700 2    50   ~ 0
FPD5
Text Label 4550 1600 2    50   ~ 0
FPD4
Text Label 4550 1500 2    50   ~ 0
FPD3
Text Label 4550 1400 2    50   ~ 0
FPD2
Text Label 4550 1300 2    50   ~ 0
FPD1
Text Label 4550 1200 2    50   ~ 0
FPD0
Text HLabel 3100 2100 0    50   Input ~ 0
CPL
Text HLabel 3100 2200 0    50   Input ~ 0
~OE
Wire Wire Line
	4300 2200 3100 2200
Connection ~ 4300 2200
Text HLabel 3100 750  0    50   3State ~ 0
FPD[0..7]
Text Label 3200 750  0    50   ~ 0
FPD[0..7]
Wire Bus Line
	4000 750  3100 750 
Entry Bus Bus
	4000 750  4100 850 
Entry Bus Bus
	8250 5450 8350 5350
Entry Bus Bus
	4100 5350 4200 5450
Text HLabel 9800 750  2    50   BiDi ~ 0
AB[0..23]
Wire Bus Line
	6200 750  9800 750 
Entry Bus Bus
	6100 850  6200 750 
Text Label 3200 2100 0    50   ~ 0
CPL
Text Label 6800 3550 2    50   ~ 0
BUSCP
Text Label 6800 2100 2    50   ~ 0
BUSCP
Text Label 6800 2200 2    50   ~ 0
~RL
Wire Wire Line
	4600 2100 3100 2100
Wire Wire Line
	4600 3650 4300 3650
Text Label 3200 2200 0    50   ~ 0
~OE
Wire Wire Line
	4600 2200 4300 2200
$Comp
L alexios:74HC574 U?
U 1 1 5D3186B9
P 7350 3150
AR Path="/5D3186B9" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D3186B9" Ref="U602"  Part="1" 
AR Path="/5D363063/5D3186B9" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D3186B9" Ref="U?"  Part="1" 
F 0 "U602" H 7350 3917 50  0000 C CNN
F 1 "74HC574" H 7350 3826 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7050 3100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7050 3100 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	1    7350 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 5D3186C0
P 7350 1700
AR Path="/5D3186C0" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D3186C0" Ref="U603"  Part="1" 
AR Path="/5D363063/5D3186C0" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D3186C0" Ref="U?"  Part="1" 
F 0 "U603" H 7350 2467 50  0000 C CNN
F 1 "74HC574" H 7350 2376 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7050 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7050 1650 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	1    7350 1700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 5D3186C7
P 5100 3150
AR Path="/5D3186C7" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D3186C7" Ref="U605"  Part="1" 
AR Path="/5D363063/5D3186C7" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D3186C7" Ref="U?"  Part="1" 
F 0 "U605" H 5100 3917 50  0000 C CNN
F 1 "74HC574" H 5100 3826 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4800 3100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4800 3100 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	1    5100 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 5D3186CE
P 5100 1700
AR Path="/5D3186CE" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D3186CE" Ref="U601"  Part="1" 
AR Path="/5D363063/5D3186CE" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D3186CE" Ref="U?"  Part="1" 
F 0 "U601" H 5100 2467 50  0000 C CNN
F 1 "74HC574" H 5100 2376 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4800 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4800 1650 50  0001 C CNN
F 4 "Yes" H 5100 1700 50  0001 C CNN "Verified"
	1    5100 1700
	1    0    0    -1  
$EndComp
Entry Wire Line
	6000 2650 6100 2550
Entry Wire Line
	6000 1200 6100 1100
Entry Wire Line
	8250 3350 8350 3450
Entry Wire Line
	8250 3250 8350 3350
Entry Wire Line
	8250 2650 8350 2750
Entry Wire Line
	8250 2750 8350 2850
Entry Wire Line
	8250 2850 8350 2950
Entry Wire Line
	8250 2950 8350 3050
Entry Wire Line
	8250 3050 8350 3150
Entry Wire Line
	8250 3150 8350 3250
Entry Wire Line
	6000 1900 6100 1800
Entry Wire Line
	6000 1800 6100 1700
Entry Wire Line
	6000 1700 6100 1600
Entry Wire Line
	6000 1600 6100 1500
Entry Wire Line
	6000 1500 6100 1400
Entry Wire Line
	6000 1400 6100 1300
Entry Wire Line
	6000 1300 6100 1200
Entry Wire Line
	6200 1900 6100 1800
Entry Wire Line
	6200 1800 6100 1700
Entry Wire Line
	6200 1700 6100 1600
Entry Wire Line
	6200 1600 6100 1500
Entry Wire Line
	6200 1500 6100 1400
Entry Wire Line
	6200 1400 6100 1300
Entry Wire Line
	6200 1300 6100 1200
Entry Wire Line
	6200 1200 6100 1100
Entry Wire Line
	8250 1900 8350 2000
Entry Wire Line
	8250 1800 8350 1900
Entry Wire Line
	8250 1200 8350 1300
Entry Wire Line
	8250 1300 8350 1400
Entry Wire Line
	8250 1400 8350 1500
Entry Wire Line
	8250 1500 8350 1600
Entry Wire Line
	8250 1600 8350 1700
Entry Wire Line
	8250 1700 8350 1800
Wire Wire Line
	4200 1900 4600 1900
Entry Wire Line
	4200 1200 4100 1100
Entry Wire Line
	4200 1300 4100 1200
Entry Wire Line
	6000 3350 6100 3250
Entry Wire Line
	6000 3250 6100 3150
Entry Wire Line
	6000 3150 6100 3050
Entry Wire Line
	6000 3050 6100 2950
Entry Wire Line
	6000 2950 6100 2850
Entry Wire Line
	6000 2850 6100 2750
Entry Wire Line
	6000 2750 6100 2650
Entry Wire Line
	6200 3350 6100 3250
Entry Wire Line
	6200 3250 6100 3150
Entry Wire Line
	6200 3150 6100 3050
Entry Wire Line
	6200 3050 6100 2950
Entry Wire Line
	6200 2950 6100 2850
Entry Wire Line
	6200 2850 6100 2750
Entry Wire Line
	6200 2750 6100 2650
Entry Wire Line
	6200 2650 6100 2550
Wire Wire Line
	4600 1200 4200 1200
Wire Wire Line
	4600 1300 4200 1300
Wire Wire Line
	4600 1400 4200 1400
Wire Wire Line
	4600 1500 4200 1500
Wire Wire Line
	4600 1600 4200 1600
Wire Wire Line
	4600 1700 4200 1700
Wire Wire Line
	4600 1800 4200 1800
Entry Wire Line
	4200 1900 4100 1800
Entry Wire Line
	4200 1800 4100 1700
Entry Wire Line
	4200 1700 4100 1600
Entry Wire Line
	4200 1600 4100 1500
Entry Wire Line
	4200 1500 4100 1400
Entry Wire Line
	4200 1400 4100 1300
Text Label 4550 5000 2    50   ~ 0
CPH
Wire Wire Line
	4600 5000 3100 5000
Text Label 4550 5100 2    50   ~ 0
~OE
Text Label 4550 4800 2    50   ~ 0
FPD7
Text Label 4550 4700 2    50   ~ 0
FPD6
Text Label 4550 4600 2    50   ~ 0
FPD5
Text Label 4550 4500 2    50   ~ 0
FPD4
Text Label 4550 4400 2    50   ~ 0
FPD3
Text Label 4550 4300 2    50   ~ 0
FPD2
Text Label 4550 4200 2    50   ~ 0
FPD1
Text Label 4550 4100 2    50   ~ 0
FPD0
Wire Wire Line
	4200 4800 4600 4800
Wire Wire Line
	4600 4100 4200 4100
Wire Wire Line
	4600 4200 4200 4200
Wire Wire Line
	4600 4300 4200 4300
Wire Wire Line
	4600 4400 4200 4400
Wire Wire Line
	4600 4500 4200 4500
Wire Wire Line
	4600 4600 4200 4600
Wire Wire Line
	4600 4700 4200 4700
Wire Wire Line
	4600 5100 4300 5100
$Comp
L alexios:74HC574 U?
U 1 1 5D32F4E3
P 5100 4600
AR Path="/5D32F4E3" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D32F4E3" Ref="U604"  Part="1" 
AR Path="/5D363063/5D32F4E3" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D32F4E3" Ref="U?"  Part="1" 
F 0 "U604" H 5100 5367 50  0000 C CNN
F 1 "74HC574" H 5100 5276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4800 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4800 4550 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	1    5100 4600
	1    0    0    -1  
$EndComp
Entry Wire Line
	6000 4100 6100 4000
Entry Wire Line
	6000 4800 6100 4700
Entry Wire Line
	6000 4700 6100 4600
Entry Wire Line
	6000 4600 6100 4500
Entry Wire Line
	6000 4500 6100 4400
Entry Wire Line
	6000 4400 6100 4300
Entry Wire Line
	6000 4300 6100 4200
Entry Wire Line
	6000 4200 6100 4100
Wire Wire Line
	6300 5000 6850 5000
Text Label 6800 5100 2    50   ~ 0
~RH
Text Label 7900 4800 0    50   ~ 0
FPD7
Text Label 7900 4700 0    50   ~ 0
FPD6
Text Label 7900 4600 0    50   ~ 0
FPD5
Text Label 7900 4500 0    50   ~ 0
FPD4
Text Label 7900 4400 0    50   ~ 0
FPD3
Text Label 7900 4300 0    50   ~ 0
FPD2
Text Label 7900 4200 0    50   ~ 0
FPD1
Text Label 7900 4100 0    50   ~ 0
FPD0
Wire Wire Line
	8250 4800 7850 4800
Wire Wire Line
	7850 4100 8250 4100
Wire Wire Line
	7850 4200 8250 4200
Wire Wire Line
	7850 4300 8250 4300
Wire Wire Line
	7850 4400 8250 4400
Wire Wire Line
	7850 4500 8250 4500
Wire Wire Line
	7850 4600 8250 4600
Wire Wire Line
	7850 4700 8250 4700
Text Label 6800 5000 2    50   ~ 0
BUSCP
$Comp
L alexios:74HC574 U?
U 1 1 5D3350C1
P 7350 4600
AR Path="/5D3350C1" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D3350C1" Ref="U606"  Part="1" 
AR Path="/5D363063/5D3350C1" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D3350C1" Ref="U?"  Part="1" 
F 0 "U606" H 7350 5367 50  0000 C CNN
F 1 "74HC574" H 7350 5276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7050 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7050 4550 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	1    7350 4600
	1    0    0    -1  
$EndComp
Entry Wire Line
	8250 4800 8350 4900
Entry Wire Line
	8250 4700 8350 4800
Entry Wire Line
	8250 4100 8350 4200
Entry Wire Line
	8250 4200 8350 4300
Entry Wire Line
	8250 4300 8350 4400
Entry Wire Line
	8250 4400 8350 4500
Entry Wire Line
	8250 4500 8350 4600
Entry Wire Line
	8250 4600 8350 4700
Wire Wire Line
	4300 3650 4300 5100
Connection ~ 4300 3650
Text HLabel 3100 5000 0    50   Input ~ 0
CPH
Text Label 3200 5000 0    50   ~ 0
CPH
Wire Wire Line
	5600 4100 6000 4100
Wire Wire Line
	5600 4200 6000 4200
Wire Wire Line
	5600 4300 6000 4300
Wire Wire Line
	5600 4400 6000 4400
Wire Wire Line
	5600 4500 6000 4500
Wire Wire Line
	5600 4600 6000 4600
Wire Wire Line
	5600 4700 6000 4700
Wire Wire Line
	5600 4800 6000 4800
Text Label 5650 4100 0    50   ~ 0
AB16
Text Label 5650 4200 0    50   ~ 0
AB17
Text Label 5650 4300 0    50   ~ 0
AB18
Text Label 5650 4400 0    50   ~ 0
AB19
Text Label 5650 4500 0    50   ~ 0
AB20
Text Label 5650 4600 0    50   ~ 0
AB21
Text Label 5650 4700 0    50   ~ 0
AB22
Text Label 5650 4800 0    50   ~ 0
AB23
Entry Wire Line
	6200 4100 6100 4000
Entry Wire Line
	6200 4800 6100 4700
Entry Wire Line
	6200 4700 6100 4600
Entry Wire Line
	6200 4600 6100 4500
Entry Wire Line
	6200 4500 6100 4400
Entry Wire Line
	6200 4400 6100 4300
Entry Wire Line
	6200 4300 6100 4200
Entry Wire Line
	6200 4200 6100 4100
Text Label 6800 4100 2    50   ~ 0
AB16
Text Label 6800 4200 2    50   ~ 0
AB17
Text Label 6800 4300 2    50   ~ 0
AB18
Text Label 6800 4400 2    50   ~ 0
AB19
Text Label 6800 4500 2    50   ~ 0
AB20
Text Label 6800 4600 2    50   ~ 0
AB21
Text Label 6800 4700 2    50   ~ 0
AB22
Text Label 6800 4800 2    50   ~ 0
AB23
Wire Wire Line
	6200 4100 6850 4100
Wire Wire Line
	6200 4200 6850 4200
Wire Wire Line
	6200 4300 6850 4300
Wire Wire Line
	6200 4400 6850 4400
Wire Wire Line
	6200 4500 6850 4500
Wire Wire Line
	6200 4600 6850 4600
Wire Wire Line
	6200 4700 6850 4700
Wire Wire Line
	6200 4800 6850 4800
$Comp
L power:GND #PWR0604
U 1 1 5D42BD2C
P 850 7500
AR Path="/5D78E680/5D42BD2C" Ref="#PWR0604"  Part="1" 
AR Path="/5D363063/5D42BD2C" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD2C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0604" H 850 7250 50  0001 C CNN
F 1 "GND" H 855 7327 50  0000 C CNN
F 2 "" H 850 7500 50  0001 C CNN
F 3 "" H 850 7500 50  0001 C CNN
	1    850  7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0603
U 1 1 5D42BD32
P 850 7300
AR Path="/5D78E680/5D42BD32" Ref="#PWR0603"  Part="1" 
AR Path="/5D363063/5D42BD32" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD32" Ref="#PWR?"  Part="1" 
F 0 "#PWR0603" H 850 7150 50  0001 C CNN
F 1 "+5V" H 865 7473 50  0000 C CNN
F 2 "" H 850 7300 50  0001 C CNN
F 3 "" H 850 7300 50  0001 C CNN
	1    850  7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C602
U 1 1 5D42BD38
P 850 7400
AR Path="/5D78E680/5D42BD38" Ref="C602"  Part="1" 
AR Path="/5D363063/5D42BD38" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D42BD38" Ref="C?"  Part="1" 
F 0 "C602" H 759 7446 50  0000 R CNN
F 1 "100nF" H 759 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 850 7400 50  0001 C CNN
F 3 "~" H 850 7400 50  0001 C CNN
	1    850  7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D42BD3F
P 1200 7400
AR Path="/5D42BD3F" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D42BD3F" Ref="U602"  Part="2" 
AR Path="/5D363063/5D42BD3F" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D42BD3F" Ref="U?"  Part="2" 
F 0 "U602" H 1379 7446 50  0000 L CNN
F 1 "74HC574" H 1379 7355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 900 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 900 7350 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    1200 7400
	1    0    0    -1  
$EndComp
Connection ~ 850  7500
Connection ~ 850  7300
$Comp
L power:GND #PWR0608
U 1 1 5D42BD48
P 2300 7500
AR Path="/5D78E680/5D42BD48" Ref="#PWR0608"  Part="1" 
AR Path="/5D363063/5D42BD48" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD48" Ref="#PWR?"  Part="1" 
F 0 "#PWR0608" H 2300 7250 50  0001 C CNN
F 1 "GND" H 2305 7327 50  0000 C CNN
F 2 "" H 2300 7500 50  0001 C CNN
F 3 "" H 2300 7500 50  0001 C CNN
	1    2300 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0607
U 1 1 5D42BD4E
P 2300 7300
AR Path="/5D78E680/5D42BD4E" Ref="#PWR0607"  Part="1" 
AR Path="/5D363063/5D42BD4E" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD4E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0607" H 2300 7150 50  0001 C CNN
F 1 "+5V" H 2315 7473 50  0000 C CNN
F 2 "" H 2300 7300 50  0001 C CNN
F 3 "" H 2300 7300 50  0001 C CNN
	1    2300 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C604
U 1 1 5D42BD54
P 2300 7400
AR Path="/5D78E680/5D42BD54" Ref="C604"  Part="1" 
AR Path="/5D363063/5D42BD54" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D42BD54" Ref="C?"  Part="1" 
F 0 "C604" H 2209 7446 50  0000 R CNN
F 1 "100nF" H 2209 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7400 50  0001 C CNN
F 3 "~" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D42BD5B
P 2650 7400
AR Path="/5D42BD5B" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D42BD5B" Ref="U604"  Part="2" 
AR Path="/5D363063/5D42BD5B" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D42BD5B" Ref="U?"  Part="2" 
F 0 "U604" H 2829 7446 50  0000 L CNN
F 1 "74HC574" H 2829 7355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2350 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2350 7350 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    2650 7400
	1    0    0    -1  
$EndComp
Connection ~ 2300 7500
Connection ~ 2300 7300
$Comp
L power:GND #PWR0612
U 1 1 5D42BD64
P 3750 7500
AR Path="/5D78E680/5D42BD64" Ref="#PWR0612"  Part="1" 
AR Path="/5D363063/5D42BD64" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD64" Ref="#PWR?"  Part="1" 
F 0 "#PWR0612" H 3750 7250 50  0001 C CNN
F 1 "GND" H 3755 7327 50  0000 C CNN
F 2 "" H 3750 7500 50  0001 C CNN
F 3 "" H 3750 7500 50  0001 C CNN
	1    3750 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0611
U 1 1 5D42BD6A
P 3750 7300
AR Path="/5D78E680/5D42BD6A" Ref="#PWR0611"  Part="1" 
AR Path="/5D363063/5D42BD6A" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD6A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0611" H 3750 7150 50  0001 C CNN
F 1 "+5V" H 3765 7473 50  0000 C CNN
F 2 "" H 3750 7300 50  0001 C CNN
F 3 "" H 3750 7300 50  0001 C CNN
	1    3750 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C606
U 1 1 5D42BD70
P 3750 7400
AR Path="/5D78E680/5D42BD70" Ref="C606"  Part="1" 
AR Path="/5D363063/5D42BD70" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D42BD70" Ref="C?"  Part="1" 
F 0 "C606" H 3659 7446 50  0000 R CNN
F 1 "100nF" H 3659 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 7400 50  0001 C CNN
F 3 "~" H 3750 7400 50  0001 C CNN
	1    3750 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D42BD77
P 4100 7400
AR Path="/5D42BD77" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D42BD77" Ref="U606"  Part="2" 
AR Path="/5D363063/5D42BD77" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D42BD77" Ref="U?"  Part="2" 
F 0 "U606" H 4279 7446 50  0000 L CNN
F 1 "74HC574" H 4279 7355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3800 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3800 7350 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    4100 7400
	1    0    0    -1  
$EndComp
Connection ~ 3750 7500
Connection ~ 3750 7300
Connection ~ 6300 5000
Wire Wire Line
	6300 5000 6300 5750
Wire Wire Line
	6850 5100 6600 5100
Wire Wire Line
	6600 5100 6600 6050
Wire Wire Line
	6600 6050 3100 6050
Text HLabel 3100 6050 0    50   Input ~ 0
~RH
Text Label 3200 6050 0    50   ~ 0
~RH
$Comp
L power:GND #PWR0606
U 1 1 631C7286
P 2300 6800
AR Path="/5D78E680/631C7286" Ref="#PWR0606"  Part="1" 
AR Path="/5D363063/631C7286" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/631C7286" Ref="#PWR?"  Part="1" 
F 0 "#PWR0606" H 2300 6550 50  0001 C CNN
F 1 "GND" H 2305 6627 50  0000 C CNN
F 2 "" H 2300 6800 50  0001 C CNN
F 3 "" H 2300 6800 50  0001 C CNN
	1    2300 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0605
U 1 1 631C728C
P 2300 6600
AR Path="/5D78E680/631C728C" Ref="#PWR0605"  Part="1" 
AR Path="/5D363063/631C728C" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/631C728C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0605" H 2300 6450 50  0001 C CNN
F 1 "+5V" H 2315 6773 50  0000 C CNN
F 2 "" H 2300 6600 50  0001 C CNN
F 3 "" H 2300 6600 50  0001 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C603
U 1 1 631C7292
P 2300 6700
AR Path="/5D78E680/631C7292" Ref="C603"  Part="1" 
AR Path="/5D363063/631C7292" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/631C7292" Ref="C?"  Part="1" 
F 0 "C603" H 2209 6746 50  0000 R CNN
F 1 "100nF" H 2209 6655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 6700 50  0001 C CNN
F 3 "~" H 2300 6700 50  0001 C CNN
	1    2300 6700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 631C7298
P 2650 6700
AR Path="/631C7298" Ref="U?"  Part="1" 
AR Path="/5D78E680/631C7298" Ref="U603"  Part="2" 
AR Path="/5D363063/631C7298" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/631C7298" Ref="U?"  Part="2" 
F 0 "U603" H 2829 6746 50  0000 L CNN
F 1 "74HC574" H 2829 6655 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2350 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2350 6650 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    2650 6700
	1    0    0    -1  
$EndComp
Connection ~ 2300 6800
Connection ~ 2300 6600
Entry Wire Line
	4200 4100 4100 4000
Entry Wire Line
	4200 4200 4100 4100
Entry Wire Line
	4200 4800 4100 4700
Entry Wire Line
	4200 4700 4100 4600
Entry Wire Line
	4200 4600 4100 4500
Entry Wire Line
	4200 4500 4100 4400
Entry Wire Line
	4200 4400 4100 4300
Entry Wire Line
	4200 4300 4100 4200
Wire Bus Line
	6100 850  6100 4700
Wire Bus Line
	8350 1300 8350 5350
Wire Bus Line
	4100 850  4100 5350
$EndSCHEMATC
