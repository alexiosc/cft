EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Address Bus Pod (24 bit I/O)"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0602
U 1 1 5D318588
P 950 6800
AR Path="/5D78E680/5D318588" Ref="#PWR0602"  Part="1" 
AR Path="/5D363063/5D318588" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D318588" Ref="#PWR?"  Part="1" 
AR Path="/5D318588" Ref="#PWR0602"  Part="1" 
F 0 "#PWR0602" H 950 6550 50  0001 C CNN
F 1 "GND" H 955 6627 50  0000 C CNN
F 2 "" H 950 6800 50  0001 C CNN
F 3 "" H 950 6800 50  0001 C CNN
	1    950  6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0601
U 1 1 5D31858E
P 950 6600
AR Path="/5D78E680/5D31858E" Ref="#PWR0601"  Part="1" 
AR Path="/5D363063/5D31858E" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D31858E" Ref="#PWR?"  Part="1" 
AR Path="/5D31858E" Ref="#PWR0601"  Part="1" 
F 0 "#PWR0601" H 950 6450 50  0001 C CNN
F 1 "+5V" H 965 6773 50  0000 C CNN
F 2 "" H 950 6600 50  0001 C CNN
F 3 "" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3500 5400 3500
Wire Wire Line
	4750 3400 5400 3400
Wire Wire Line
	4750 3300 5400 3300
Wire Wire Line
	4750 3200 5400 3200
Wire Wire Line
	4750 3100 5400 3100
Wire Wire Line
	4750 3000 5400 3000
Wire Wire Line
	4750 2900 5400 2900
Wire Wire Line
	4750 2800 5400 2800
Wire Wire Line
	4750 2000 5400 2000
Wire Wire Line
	4750 1900 5400 1900
Wire Wire Line
	4750 1800 5400 1800
Wire Wire Line
	4750 1700 5400 1700
Wire Wire Line
	4750 1600 5400 1600
Wire Wire Line
	4750 1500 5400 1500
Wire Wire Line
	4750 1400 5400 1400
Wire Wire Line
	4750 1300 5400 1300
Text Label 3250 3700 2    50   ~ 0
CP1
Wire Wire Line
	4850 3700 5400 3700
Entry Wire Line
	4750 2800 4650 2700
Entry Wire Line
	4750 3500 4650 3400
Entry Wire Line
	4750 3400 4650 3300
Entry Wire Line
	4750 3300 4650 3200
Entry Wire Line
	4750 3200 4650 3100
Entry Wire Line
	4750 3100 4650 3000
Entry Wire Line
	4750 3000 4650 2900
Entry Wire Line
	4750 2900 4650 2800
Entry Wire Line
	4750 1300 4650 1200
Entry Wire Line
	4750 2000 4650 1900
Entry Wire Line
	4750 1900 4650 1800
Entry Wire Line
	4750 1800 4650 1700
Entry Wire Line
	4750 1700 4650 1600
Entry Wire Line
	4750 1600 4650 1500
Entry Wire Line
	4750 1500 4650 1400
Entry Wire Line
	4750 1400 4650 1300
Wire Wire Line
	4950 2300 5400 2300
Wire Wire Line
	4850 2200 4850 2600
Text Label 5350 3800 2    50   ~ 0
~R1
Text Label 1950 3700 0    50   ~ 0
CP1
Wire Wire Line
	3300 3700 1950 3700
Text Label 3250 3800 2    50   ~ 0
~OE1
Text Label 3250 2300 2    50   ~ 0
~OE0
Wire Wire Line
	4950 2300 4950 2500
Text Label 1950 2600 0    50   ~ 0
BUSCP
Wire Wire Line
	4850 2200 5400 2200
Text Label 6900 3500 0    50   ~ 0
FPD7
Text Label 6900 3400 0    50   ~ 0
FPD6
Text Label 6900 3300 0    50   ~ 0
FPD5
Text Label 6900 3200 0    50   ~ 0
FPD4
Text Label 6900 3100 0    50   ~ 0
FPD3
Text Label 6900 3000 0    50   ~ 0
FPD2
Text Label 6900 2900 0    50   ~ 0
FPD1
Text Label 6900 2800 0    50   ~ 0
FPD0
Text Label 6900 2000 0    50   ~ 0
FPD7
Text Label 6900 1900 0    50   ~ 0
FPD6
Text Label 6900 1800 0    50   ~ 0
FPD5
Text Label 6900 1700 0    50   ~ 0
FPD4
Text Label 6900 1600 0    50   ~ 0
FPD3
Text Label 6900 1500 0    50   ~ 0
FPD2
Text Label 6900 1400 0    50   ~ 0
FPD1
Text Label 6900 1300 0    50   ~ 0
FPD0
Entry Wire Line
	2900 2800 2800 2700
Entry Wire Line
	2900 2900 2800 2800
Entry Wire Line
	2900 3500 2800 3400
Entry Wire Line
	2900 3400 2800 3300
Entry Wire Line
	2900 3300 2800 3200
Entry Wire Line
	2900 3200 2800 3100
Entry Wire Line
	2900 3100 2800 3000
Entry Wire Line
	2900 3000 2800 2900
Text Label 3250 3500 2    50   ~ 0
FPD7
Text Label 3250 3400 2    50   ~ 0
FPD6
Text Label 3250 3300 2    50   ~ 0
FPD5
Text Label 3250 3200 2    50   ~ 0
FPD4
Text Label 3250 3100 2    50   ~ 0
FPD3
Text Label 3250 3000 2    50   ~ 0
FPD2
Text Label 3250 2900 2    50   ~ 0
FPD1
Text Label 3250 2800 2    50   ~ 0
FPD0
Wire Wire Line
	2900 3500 3300 3500
Wire Wire Line
	3300 2800 2900 2800
Wire Wire Line
	3300 2900 2900 2900
Wire Wire Line
	3300 3000 2900 3000
Wire Wire Line
	3300 3100 2900 3100
Wire Wire Line
	3300 3200 2900 3200
Wire Wire Line
	3300 3300 2900 3300
Wire Wire Line
	3300 3400 2900 3400
Text Label 3250 2000 2    50   ~ 0
FPD7
Text Label 3250 1900 2    50   ~ 0
FPD6
Text Label 3250 1800 2    50   ~ 0
FPD5
Text Label 3250 1700 2    50   ~ 0
FPD4
Text Label 3250 1600 2    50   ~ 0
FPD3
Text Label 3250 1500 2    50   ~ 0
FPD2
Text Label 3250 1400 2    50   ~ 0
FPD1
Text Label 3250 1300 2    50   ~ 0
FPD0
Text Label 2250 850  0    50   ~ 0
FPD[0..7]
Wire Bus Line
	2700 850  2250 850 
Entry Bus Bus
	2700 850  2800 950 
Entry Bus Bus
	4650 950  4750 850 
Text Label 1950 2200 0    50   ~ 0
CP0
Text Label 5350 3700 2    50   ~ 0
BUSCP
Text Label 5350 2200 2    50   ~ 0
BUSCP
Text Label 5350 2300 2    50   ~ 0
~R0
Wire Wire Line
	3300 2200 1950 2200
Text Label 1950 2300 0    50   ~ 0
~OE0
$Comp
L alexios:74HC574 U3
U 1 1 5D3186C0
P 5900 1800
AR Path="/5D3186C0" Ref="U3"  Part="1" 
AR Path="/5D78E680/5D3186C0" Ref="U603"  Part="1" 
AR Path="/5D363063/5D3186C0" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D3186C0" Ref="U?"  Part="1" 
F 0 "U3" H 5900 2567 50  0000 C CNN
F 1 "74HC574" H 5900 2476 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5600 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5600 1750 50  0001 C CNN
F 4 "Yes" H -1450 100 50  0001 C CNN "Verified"
	1    5900 1800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U2
U 1 1 5D3186C7
P 3800 3300
AR Path="/5D3186C7" Ref="U2"  Part="1" 
AR Path="/5D78E680/5D3186C7" Ref="U605"  Part="1" 
AR Path="/5D363063/5D3186C7" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D3186C7" Ref="U?"  Part="1" 
F 0 "U2" H 4150 2900 50  0000 L CNN
F 1 "74HC574" H 4150 2800 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3500 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3500 3250 50  0001 C CNN
F 4 "Yes" H -1300 150 50  0001 C CNN "Verified"
	1    3800 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U1
U 1 1 5D3186CE
P 3800 1800
AR Path="/5D3186CE" Ref="U1"  Part="1" 
AR Path="/5D78E680/5D3186CE" Ref="U601"  Part="1" 
AR Path="/5D363063/5D3186CE" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D3186CE" Ref="U?"  Part="1" 
F 0 "U1" H 3800 2567 50  0000 C CNN
F 1 "74HC574" H 3800 2476 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 3500 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3500 1750 50  0001 C CNN
F 4 "Yes" H 3800 1800 50  0001 C CNN "Verified"
	1    3800 1800
	1    0    0    -1  
$EndComp
Entry Wire Line
	4550 2800 4650 2700
Entry Wire Line
	4550 1300 4650 1200
Entry Wire Line
	7250 3500 7350 3600
Entry Wire Line
	7250 3400 7350 3500
Entry Wire Line
	7250 2800 7350 2900
Entry Wire Line
	7250 2900 7350 3000
Entry Wire Line
	7250 3000 7350 3100
Entry Wire Line
	7250 3100 7350 3200
Entry Wire Line
	7250 3200 7350 3300
Entry Wire Line
	7250 3300 7350 3400
Entry Wire Line
	4550 2000 4650 1900
Entry Wire Line
	4550 1900 4650 1800
Entry Wire Line
	4550 1800 4650 1700
Entry Wire Line
	4550 1700 4650 1600
Entry Wire Line
	4550 1600 4650 1500
Entry Wire Line
	4550 1500 4650 1400
Entry Wire Line
	4550 1400 4650 1300
Entry Wire Line
	4750 2000 4650 1900
Entry Wire Line
	4750 1900 4650 1800
Entry Wire Line
	4750 1800 4650 1700
Entry Wire Line
	4750 1700 4650 1600
Entry Wire Line
	4750 1600 4650 1500
Entry Wire Line
	4750 1500 4650 1400
Entry Wire Line
	4750 1400 4650 1300
Entry Wire Line
	4750 1300 4650 1200
Entry Wire Line
	7250 2000 7350 2100
Entry Wire Line
	7250 1900 7350 2000
Entry Wire Line
	7250 1300 7350 1400
Entry Wire Line
	7250 1400 7350 1500
Entry Wire Line
	7250 1500 7350 1600
Entry Wire Line
	7250 1600 7350 1700
Entry Wire Line
	7250 1700 7350 1800
Entry Wire Line
	7250 1800 7350 1900
Wire Wire Line
	2900 2000 3300 2000
Entry Wire Line
	2900 1300 2800 1200
Entry Wire Line
	2900 1400 2800 1300
Entry Wire Line
	4550 3500 4650 3400
Entry Wire Line
	4550 3400 4650 3300
Entry Wire Line
	4550 3300 4650 3200
Entry Wire Line
	4550 3200 4650 3100
Entry Wire Line
	4550 3100 4650 3000
Entry Wire Line
	4550 3000 4650 2900
Entry Wire Line
	4550 2900 4650 2800
Entry Wire Line
	4750 3500 4650 3400
Entry Wire Line
	4750 3400 4650 3300
Entry Wire Line
	4750 3300 4650 3200
Entry Wire Line
	4750 3200 4650 3100
Entry Wire Line
	4750 3100 4650 3000
Entry Wire Line
	4750 3000 4650 2900
Entry Wire Line
	4750 2900 4650 2800
Entry Wire Line
	4750 2800 4650 2700
Wire Wire Line
	3300 1300 2900 1300
Wire Wire Line
	3300 1400 2900 1400
Wire Wire Line
	3300 1500 2900 1500
Wire Wire Line
	3300 1600 2900 1600
Wire Wire Line
	3300 1700 2900 1700
Wire Wire Line
	3300 1800 2900 1800
Wire Wire Line
	3300 1900 2900 1900
Entry Wire Line
	2900 2000 2800 1900
Entry Wire Line
	2900 1900 2800 1800
Entry Wire Line
	2900 1800 2800 1700
Entry Wire Line
	2900 1700 2800 1600
Entry Wire Line
	2900 1600 2800 1500
Entry Wire Line
	2900 1500 2800 1400
$Comp
L power:GND #PWR0604
U 1 1 5D42BD2C
P 950 7500
AR Path="/5D78E680/5D42BD2C" Ref="#PWR0604"  Part="1" 
AR Path="/5D363063/5D42BD2C" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD2C" Ref="#PWR?"  Part="1" 
AR Path="/5D42BD2C" Ref="#PWR0604"  Part="1" 
F 0 "#PWR0604" H 950 7250 50  0001 C CNN
F 1 "GND" H 955 7327 50  0000 C CNN
F 2 "" H 950 7500 50  0001 C CNN
F 3 "" H 950 7500 50  0001 C CNN
	1    950  7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0603
U 1 1 5D42BD32
P 950 7300
AR Path="/5D78E680/5D42BD32" Ref="#PWR0603"  Part="1" 
AR Path="/5D363063/5D42BD32" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD32" Ref="#PWR?"  Part="1" 
AR Path="/5D42BD32" Ref="#PWR0603"  Part="1" 
F 0 "#PWR0603" H 950 7150 50  0001 C CNN
F 1 "+5V" H 965 7473 50  0000 C CNN
F 2 "" H 950 7300 50  0001 C CNN
F 3 "" H 950 7300 50  0001 C CNN
	1    950  7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C602
U 1 1 5D42BD38
P 950 7400
AR Path="/5D78E680/5D42BD38" Ref="C602"  Part="1" 
AR Path="/5D363063/5D42BD38" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D42BD38" Ref="C?"  Part="1" 
AR Path="/5D42BD38" Ref="C2"  Part="1" 
F 0 "C2" H 859 7446 50  0000 R CNN
F 1 "100nF" H 859 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7400 50  0001 C CNN
F 3 "~" H 950 7400 50  0001 C CNN
	1    950  7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0606
U 1 1 631C7286
P 2400 6800
AR Path="/5D78E680/631C7286" Ref="#PWR0606"  Part="1" 
AR Path="/5D363063/631C7286" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/631C7286" Ref="#PWR?"  Part="1" 
AR Path="/631C7286" Ref="#PWR0606"  Part="1" 
F 0 "#PWR0606" H 2400 6550 50  0001 C CNN
F 1 "GND" H 2405 6627 50  0000 C CNN
F 2 "" H 2400 6800 50  0001 C CNN
F 3 "" H 2400 6800 50  0001 C CNN
	1    2400 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0605
U 1 1 631C728C
P 2400 6600
AR Path="/5D78E680/631C728C" Ref="#PWR0605"  Part="1" 
AR Path="/5D363063/631C728C" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/631C728C" Ref="#PWR?"  Part="1" 
AR Path="/631C728C" Ref="#PWR0605"  Part="1" 
F 0 "#PWR0605" H 2400 6450 50  0001 C CNN
F 1 "+5V" H 2415 6773 50  0000 C CNN
F 2 "" H 2400 6600 50  0001 C CNN
F 3 "" H 2400 6600 50  0001 C CNN
	1    2400 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C603
U 1 1 631C7292
P 2400 6700
AR Path="/5D78E680/631C7292" Ref="C603"  Part="1" 
AR Path="/5D363063/631C7292" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/631C7292" Ref="C?"  Part="1" 
AR Path="/631C7292" Ref="C3"  Part="1" 
F 0 "C3" H 2309 6746 50  0000 R CNN
F 1 "100nF" H 2309 6655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 6700 50  0001 C CNN
F 3 "~" H 2400 6700 50  0001 C CNN
	1    2400 6700
	1    0    0    -1  
$EndComp
Text Label 4350 1300 0    50   ~ 0
D0
Text Label 4350 1400 0    50   ~ 0
D1
Text Label 4350 1500 0    50   ~ 0
D2
Text Label 4350 1600 0    50   ~ 0
D3
Text Label 4350 1700 0    50   ~ 0
D4
Text Label 4350 1800 0    50   ~ 0
D5
Text Label 4350 1900 0    50   ~ 0
D6
Text Label 4350 2000 0    50   ~ 0
D7
Text Label 4350 2800 0    50   ~ 0
D8
Text Label 4350 2900 0    50   ~ 0
D9
Text Label 4350 3000 0    50   ~ 0
D10
Text Label 4350 3100 0    50   ~ 0
D11
Text Label 4350 3200 0    50   ~ 0
D12
Text Label 4350 3300 0    50   ~ 0
D13
Text Label 4350 3400 0    50   ~ 0
D14
Text Label 4350 3500 0    50   ~ 0
D15
Text Label 5350 1300 2    50   ~ 0
D0
Text Label 5350 1400 2    50   ~ 0
D1
Text Label 5350 1500 2    50   ~ 0
D2
Text Label 5350 1600 2    50   ~ 0
D3
Text Label 5350 1700 2    50   ~ 0
D4
Text Label 5350 1800 2    50   ~ 0
D5
Text Label 5350 1900 2    50   ~ 0
D6
Text Label 5350 2000 2    50   ~ 0
D7
Text Label 5350 2800 2    50   ~ 0
D8
Text Label 5350 2900 2    50   ~ 0
D9
Text Label 5350 3000 2    50   ~ 0
D10
Text Label 5350 3100 2    50   ~ 0
D11
Text Label 5350 3200 2    50   ~ 0
D12
Text Label 5350 3300 2    50   ~ 0
D13
Text Label 5350 3400 2    50   ~ 0
D14
Text Label 5350 3500 2    50   ~ 0
D15
Text HLabel 8350 850  2    50   BiDi ~ 0
D[0..23]
Text Label 3250 2200 2    50   ~ 0
CP0
Wire Wire Line
	6400 1300 6450 1300
Wire Wire Line
	6400 1400 6450 1400
Wire Wire Line
	6400 1500 6450 1500
Wire Wire Line
	6400 1600 6450 1600
Wire Wire Line
	6400 1700 6450 1700
Wire Wire Line
	6400 1800 6450 1800
Wire Wire Line
	6400 1900 6450 1900
Wire Wire Line
	6400 2000 6450 2000
Wire Wire Line
	6400 2800 6450 2800
Wire Wire Line
	6400 2900 6450 2900
Wire Wire Line
	6400 3000 6450 3000
Wire Wire Line
	6400 3100 6450 3100
Wire Wire Line
	6400 3200 6450 3200
Wire Wire Line
	6400 3300 6450 3300
Wire Wire Line
	6400 3400 6450 3400
Wire Wire Line
	6400 3500 6450 3500
$Comp
L alexios:SN74ACT1073 U?
U 1 1 60239C6E
P 8350 1900
AR Path="/5F1DB2E8/60239C6E" Ref="U?"  Part="1" 
AR Path="/5D78E680/60239C6E" Ref="U?"  Part="1" 
AR Path="/60239C6E" Ref="U5"  Part="1" 
F 0 "U5" H 8350 2700 50  0000 C CNN
F 1 "SN74ACT1073" H 8350 2600 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8050 2250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1073.pdf" H 8050 2250 50  0001 C CNN
	1    8350 1900
	1    0    0    -1  
$EndComp
Text Label 7650 2200 0    50   ~ 0
D0
Text Label 7650 2100 0    50   ~ 0
D1
Text Label 7650 2800 0    50   ~ 0
D9
Text Label 7650 1900 0    50   ~ 0
D5
Text Label 7650 2600 0    50   ~ 0
D11
Text Label 7650 2700 0    50   ~ 0
D13
Text Label 7650 1800 0    50   ~ 0
D7
Text Label 7650 1400 0    50   ~ 0
D12
Text Label 7650 1700 0    50   ~ 0
D8
Text Label 7650 1500 0    50   ~ 0
D14
Text Label 7650 1600 0    50   ~ 0
D15
$Comp
L Device:C_Small C?
U 1 1 5FF83E31
P 9350 1600
AR Path="/5D78E680/5FF83E31" Ref="C?"  Part="1" 
AR Path="/5D363063/5FF83E31" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5FF83E31" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5FF83E31" Ref="C?"  Part="1" 
AR Path="/5FF83E31" Ref="C5"  Part="1" 
F 0 "C5" H 9259 1646 50  0000 R CNN
F 1 "100nF" H 9259 1555 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 1600 50  0001 C CNN
F 3 "~" H 9350 1600 50  0001 C CNN
	1    9350 1600
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF83E37
P 9350 1850
AR Path="/5D78E680/5FF83E37" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5FF83E37" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5FF83E37" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5FF83E37" Ref="#PWR?"  Part="1" 
AR Path="/5FF83E37" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 9350 1600 50  0001 C CNN
F 1 "GND" H 9355 1677 50  0000 C CNN
F 2 "" H 9350 1850 50  0001 C CNN
F 3 "" H 9350 1850 50  0001 C CNN
	1    9350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1400 9350 1500
$Comp
L power:+5V #PWR?
U 1 1 5FF83E3E
P 9350 1400
AR Path="/5D78E680/5FF83E3E" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5FF83E3E" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5FF83E3E" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5FF83E3E" Ref="#PWR?"  Part="1" 
AR Path="/5FF83E3E" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 9350 1250 50  0001 C CNN
F 1 "+5V" H 9292 1437 50  0000 R CNN
F 2 "" H 9350 1400 50  0001 C CNN
F 3 "" H 9350 1400 50  0001 C CNN
	1    9350 1400
	-1   0    0    -1  
$EndComp
Entry Bus Bus
	7400 850  7500 950 
Entry Wire Line
	7600 1400 7500 1300
Entry Wire Line
	7600 2100 7500 2000
Entry Wire Line
	7600 2000 7500 1900
Entry Wire Line
	7600 1900 7500 1800
Entry Wire Line
	7600 1800 7500 1700
Entry Wire Line
	7600 1700 7500 1600
Entry Wire Line
	7600 1600 7500 1500
Entry Wire Line
	7600 1500 7500 1400
Entry Wire Line
	7600 2100 7500 2000
Entry Wire Line
	7600 2000 7500 1900
Entry Wire Line
	7600 1900 7500 1800
Entry Wire Line
	7600 1800 7500 1700
Entry Wire Line
	7600 1700 7500 1600
Entry Wire Line
	7600 1600 7500 1500
Entry Wire Line
	7600 1500 7500 1400
Entry Wire Line
	7600 1400 7500 1300
Wire Wire Line
	7600 2200 7850 2200
Wire Wire Line
	7600 2100 7850 2100
Wire Wire Line
	7600 2800 7850 2800
Wire Wire Line
	7600 1900 7850 1900
Wire Wire Line
	7600 2600 7850 2600
Wire Wire Line
	7600 2700 7850 2700
Wire Wire Line
	7600 1800 7850 1800
Wire Wire Line
	7600 1400 7850 1400
Wire Wire Line
	7600 1700 7850 1700
Wire Wire Line
	7600 1500 7850 1500
Wire Wire Line
	7600 1600 7850 1600
Entry Wire Line
	7600 2200 7500 2100
Entry Wire Line
	7600 2900 7500 2800
Entry Wire Line
	7600 2800 7500 2700
Entry Wire Line
	7600 2700 7500 2600
Entry Wire Line
	7600 2600 7500 2500
Entry Wire Line
	7600 2500 7500 2400
Entry Wire Line
	7600 2400 7500 2300
Entry Wire Line
	7600 2300 7500 2200
Entry Wire Line
	7600 2900 7500 2800
Entry Wire Line
	7600 2800 7500 2700
Entry Wire Line
	7600 2700 7500 2600
Entry Wire Line
	7600 2600 7500 2500
Entry Wire Line
	7600 2500 7500 2400
Entry Wire Line
	7600 2400 7500 2300
Entry Wire Line
	7600 2300 7500 2200
Entry Wire Line
	7600 2200 7500 2100
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 602834D3
P 1400 3400
F 0 "#FLG0101" H 1400 3475 50  0001 C CNN
F 1 "PWR_FLAG" H 1250 3600 50  0000 C CNN
F 2 "" H 1400 3400 50  0001 C CNN
F 3 "~" H 1400 3400 50  0001 C CNN
	1    1400 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	1400 3250 1400 3400
Text Label 9900 1450 0    50   ~ 0
D0
Text Label 9900 1550 0    50   ~ 0
D1
Text Label 9900 1650 0    50   ~ 0
D2
Text Label 9900 1750 0    50   ~ 0
D3
Text Label 9900 1850 0    50   ~ 0
D4
Text Label 9900 1950 0    50   ~ 0
D5
Text Label 9900 2050 0    50   ~ 0
D6
Text Label 9900 2150 0    50   ~ 0
D7
Wire Wire Line
	9900 1450 10100 1450
Wire Wire Line
	9900 1550 10100 1550
Wire Wire Line
	9900 1650 10100 1650
Wire Wire Line
	9900 1750 10100 1750
Wire Wire Line
	9900 1850 10100 1850
Wire Wire Line
	9900 1950 10100 1950
Wire Wire Line
	9900 2050 10100 2050
Wire Wire Line
	9900 2150 10100 2150
Wire Wire Line
	1950 2500 4950 2500
Text Label 1950 2500 0    50   ~ 0
~R0
Text Label 1950 4000 0    50   ~ 0
~R1
$Comp
L Connector:Conn_01x24_Male J2
U 1 1 605CF5EF
P 10300 2550
F 0 "J2" H 10272 2524 50  0000 R CNN
F 1 "Conn_01x24_Male" H 10272 2433 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x12_P2.54mm_Vertical" H 10300 2550 50  0001 C CNN
F 3 "~" H 10300 2550 50  0001 C CNN
	1    10300 2550
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x24_Male J1
U 1 1 605CB07D
P 950 2150
F 0 "J1" H 1000 3400 50  0000 R CNN
F 1 "Conn_01x24_Male" H 1450 3550 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x12_P2.54mm_Vertical" H 950 2150 50  0001 C CNN
F 3 "~" H 950 2150 50  0001 C CNN
	1    950  2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1050 1250 1150
Connection ~ 1250 1050
Wire Wire Line
	1250 1000 1250 1050
Wire Wire Line
	1150 1150 1250 1150
$Comp
L power:+5V #PWR0105
U 1 1 603BCE71
P 1250 1000
F 0 "#PWR0105" H 1250 850 50  0001 C CNN
F 1 "+5V" H 1265 1173 50  0000 C CNN
F 2 "" H 1250 1000 50  0001 C CNN
F 3 "" H 1250 1000 50  0001 C CNN
	1    1250 1000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1150 1050 1250 1050
Connection ~ 1250 3250
Wire Wire Line
	1250 3250 1400 3250
$Comp
L power:GND #PWR0106
U 1 1 60282609
P 1250 3400
F 0 "#PWR0106" H 1250 3150 50  0001 C CNN
F 1 "GND" H 1255 3227 50  0000 C CNN
F 2 "" H 1250 3400 50  0001 C CNN
F 3 "" H 1250 3400 50  0001 C CNN
	1    1250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3350 1250 3400
Connection ~ 1250 3350
Wire Wire Line
	1250 3250 1250 3350
Wire Wire Line
	1150 3350 1250 3350
Wire Wire Line
	1150 3250 1250 3250
Wire Wire Line
	1150 1350 1500 1350
Text Label 1500 1850 2    50   ~ 0
BUSCP
Text Label 1500 3050 2    50   ~ 0
CP1
Text Label 1500 2450 2    50   ~ 0
~OE1
Text Label 1500 1950 2    50   ~ 0
CP0
Text Label 1500 1250 2    50   ~ 0
~OE0
Wire Wire Line
	1150 1850 1500 1850
Wire Wire Line
	1150 3050 1500 3050
Wire Wire Line
	1150 2450 1500 2450
Wire Wire Line
	1150 1950 1500 1950
Wire Wire Line
	1150 1250 1500 1250
Wire Wire Line
	1500 1750 1150 1750
Wire Wire Line
	1500 1650 1150 1650
Wire Wire Line
	1500 1550 1150 1550
Wire Wire Line
	1500 1450 1150 1450
Wire Wire Line
	1150 3150 1500 3150
Text Label 1500 1450 2    50   ~ 0
FPD0
Text Label 1500 1550 2    50   ~ 0
FPD1
Text Label 1500 1650 2    50   ~ 0
FPD2
Text Label 1500 1750 2    50   ~ 0
FPD3
Text Label 1500 3150 2    50   ~ 0
FPD7
Wire Wire Line
	1150 2550 1500 2550
Text Label 1500 1350 2    50   ~ 0
~R0
Text Label 1500 2550 2    50   ~ 0
~R1
Wire Wire Line
	4300 1300 4550 1300
Wire Wire Line
	4300 1400 4550 1400
Wire Wire Line
	4300 1500 4550 1500
Wire Wire Line
	4300 1600 4550 1600
Wire Wire Line
	4300 1700 4550 1700
Wire Wire Line
	4300 1800 4550 1800
Wire Wire Line
	4300 1900 4550 1900
Wire Wire Line
	4300 2000 4550 2000
Wire Wire Line
	4300 2800 4550 2800
Wire Wire Line
	4300 2900 4550 2900
Wire Wire Line
	4300 3000 4550 3000
Wire Wire Line
	4300 3100 4550 3100
Wire Wire Line
	4300 3200 4550 3200
Wire Wire Line
	4300 3300 4550 3300
Wire Wire Line
	4300 3400 4550 3400
Wire Wire Line
	4300 3500 4550 3500
$Comp
L Device:LED_ALT D1
U 1 1 609074B8
P 2250 3450
F 0 "D1" V 2243 3332 50  0000 R CNN
F 1 "LED_ALT" V 2198 3333 50  0001 R CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 3450 50  0001 C CNN
F 3 "~" H 2250 3450 50  0001 C CNN
	1    2250 3450
	0    1    -1   0   
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 609E93C8
P 2250 3100
F 0 "#PWR0107" H 2250 2950 50  0001 C CNN
F 1 "+5V" H 2265 3273 50  0000 C CNN
F 2 "" H 2250 3100 50  0001 C CNN
F 3 "" H 2250 3100 50  0001 C CNN
	1    2250 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3600 2250 3800
$Comp
L Device:LED_ALT D2
U 1 1 60A6ACDD
P 2600 3450
F 0 "D2" V 2547 3333 50  0000 R CNN
F 1 "LED_ALT" V 2638 3333 50  0001 R CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2600 3450 50  0001 C CNN
F 3 "~" H 2600 3450 50  0001 C CNN
	1    2600 3450
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 60A85426
P 2600 3200
F 0 "R2" H 2659 3154 50  0000 L CNN
F 1 "330Ω" H 2659 3245 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2600 3200 50  0001 C CNN
F 3 "~" H 2600 3200 50  0001 C CNN
	1    2600 3200
	-1   0    0    -1  
$EndComp
Text Label 9900 4100 0    50   ~ 0
D0
Text Label 9900 4200 0    50   ~ 0
D1
Text Label 9900 4300 0    50   ~ 0
D2
Text Label 9900 4400 0    50   ~ 0
D3
Text Label 9900 4500 0    50   ~ 0
D4
Text Label 9900 4600 0    50   ~ 0
D5
Text Label 9900 4700 0    50   ~ 0
D6
Text Label 9900 4800 0    50   ~ 0
D7
Text Label 9900 4900 0    50   ~ 0
D8
Text Label 9900 5000 0    50   ~ 0
D9
Text Label 9900 5100 0    50   ~ 0
D10
Text Label 9900 5200 0    50   ~ 0
D11
Text Label 9900 5300 0    50   ~ 0
D12
Text Label 9900 5400 0    50   ~ 0
D13
Text Label 9900 5500 0    50   ~ 0
D14
Text Label 9900 5600 0    50   ~ 0
D15
Wire Wire Line
	9900 4100 10100 4100
Wire Wire Line
	9900 4200 10100 4200
Wire Wire Line
	9900 4300 10100 4300
Wire Wire Line
	9900 4400 10100 4400
Wire Wire Line
	9900 4500 10100 4500
Wire Wire Line
	9900 4600 10100 4600
Wire Wire Line
	9900 4700 10100 4700
Wire Wire Line
	9900 4800 10100 4800
Wire Wire Line
	9900 4900 10100 4900
Wire Wire Line
	9900 5000 10100 5000
Wire Wire Line
	9900 5100 10100 5100
Wire Wire Line
	9900 5200 10100 5200
Wire Wire Line
	9900 5300 10100 5300
Wire Wire Line
	9900 5400 10100 5400
Wire Wire Line
	9900 5500 10100 5500
Wire Wire Line
	9900 5600 10100 5600
$Comp
L alexios:74HC574 U1
U 2 1 60B18F19
P 1300 6700
AR Path="/60B18F19" Ref="U1"  Part="2" 
AR Path="/5D78E680/60B18F19" Ref="U?"  Part="1" 
AR Path="/5D363063/60B18F19" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/60B18F19" Ref="U?"  Part="1" 
F 0 "U1" H 1480 6746 50  0000 L CNN
F 1 "74HC574" H 1480 6655 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1000 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1000 6650 50  0001 C CNN
F 4 "Yes" H 1300 6700 50  0001 C CNN "Verified"
	2    1300 6700
	1    0    0    -1  
$EndComp
Connection ~ 950  7500
Connection ~ 950  7300
$Comp
L alexios:74HC574 U2
U 2 1 60B1D32C
P 1300 7400
AR Path="/60B1D32C" Ref="U2"  Part="2" 
AR Path="/5D78E680/60B1D32C" Ref="U?"  Part="1" 
AR Path="/5D363063/60B1D32C" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/60B1D32C" Ref="U?"  Part="1" 
F 0 "U2" H 1480 7446 50  0000 L CNN
F 1 "74HC574" H 1480 7355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1000 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1000 7350 50  0001 C CNN
F 4 "Yes" H 1300 7400 50  0001 C CNN "Verified"
	2    1300 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U4
U 1 1 60B20A6B
P 5900 3300
AR Path="/60B20A6B" Ref="U4"  Part="1" 
AR Path="/5D78E680/60B20A6B" Ref="U?"  Part="1" 
AR Path="/5D363063/60B20A6B" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/60B20A6B" Ref="U?"  Part="1" 
F 0 "U4" H 6250 2900 50  0000 L CNN
F 1 "74HC574" H 6250 2800 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5600 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5600 3250 50  0001 C CNN
F 4 "Yes" H 800 150 50  0001 C CNN "Verified"
	1    5900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1300 7250 1300
Wire Wire Line
	6700 1400 7250 1400
Wire Wire Line
	6700 1500 7250 1500
Wire Wire Line
	6700 1600 7250 1600
Wire Wire Line
	6700 1700 7250 1700
Wire Wire Line
	6700 1800 7250 1800
Wire Wire Line
	6700 1900 7250 1900
Wire Wire Line
	6700 2000 7250 2000
Wire Wire Line
	6700 2800 7250 2800
Wire Wire Line
	6700 2900 7250 2900
Wire Wire Line
	6700 3000 7250 3000
Wire Wire Line
	6700 3100 7250 3100
Wire Wire Line
	6700 3200 7250 3200
Wire Wire Line
	6700 3300 7250 3300
Wire Wire Line
	6700 3400 7250 3400
Wire Wire Line
	6700 3500 7250 3500
$Comp
L alexios:SN74ACT1073 U?
U 2 1 60F72B12
P 9000 1900
AR Path="/5F1DB2E8/60F72B12" Ref="U?"  Part="1" 
AR Path="/5D78E680/60F72B12" Ref="U?"  Part="1" 
AR Path="/60F72B12" Ref="U5"  Part="2" 
F 0 "U5" H 9000 2700 50  0000 C CNN
F 1 "SN74ACT1073" H 9000 2600 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8700 2250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1073.pdf" H 8700 2250 50  0001 C CNN
	2    9000 1900
	-1   0    0    -1  
$EndComp
Connection ~ 9350 1400
Connection ~ 9350 1500
Wire Wire Line
	9350 1800 9350 1850
Wire Wire Line
	9350 1700 9350 1800
Connection ~ 9350 1700
Connection ~ 9350 1800
$Comp
L alexios:R_Pack04 RN1
U 1 1 616701A8
P 6550 1300
F 0 "RN1" H 6550 1400 50  0000 C CNN
F 1 "30Ω" H 6750 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0402" H 6600 1380 50  0001 C CNN
F 3 "~" V 6600 1300 50  0001 C CNN
	1    6550 1300
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04 RN2
U 1 1 61670FD0
P 6550 1700
F 0 "RN2" H 6550 1300 50  0000 C CNN
F 1 "30Ω" H 6575 1806 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0402" H 6600 1780 50  0001 C CNN
F 3 "~" V 6600 1700 50  0001 C CNN
	1    6550 1700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04 RN3
U 1 1 61672CAA
P 6550 2800
F 0 "RN3" H 6550 2900 50  0000 C CNN
F 1 "30Ω" H 6750 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0402" H 6600 2880 50  0001 C CNN
F 3 "~" V 6600 2800 50  0001 C CNN
	1    6550 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04 RN4
U 1 1 61672CB0
P 6550 3200
F 0 "RN4" H 6550 2800 50  0000 C CNN
F 1 "30Ω" H 6575 3306 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0402" H 6600 3280 50  0001 C CNN
F 3 "~" V 6600 3200 50  0001 C CNN
	1    6550 3200
	1    0    0    -1  
$EndComp
Entry Bus Bus
	7250 4150 7350 4050
Wire Wire Line
	1950 2600 4850 2600
Wire Wire Line
	2600 3600 2600 4000
Wire Wire Line
	1950 4000 2600 4000
Connection ~ 2600 4000
Wire Wire Line
	1950 3800 2250 3800
Text Label 1950 3800 0    50   ~ 0
~OE1
Connection ~ 4850 2600
Wire Wire Line
	4850 2600 4850 3700
Wire Wire Line
	2600 4000 4850 4000
Wire Wire Line
	4850 3800 5400 3800
Wire Wire Line
	4850 3800 4850 4000
Connection ~ 2400 6600
Connection ~ 2400 6800
Wire Bus Line
	2900 4150 7250 4150
Entry Bus Bus
	2800 4050 2900 4150
$Comp
L alexios:74HC574 U3
U 2 1 60B1B6C7
P 2750 6700
AR Path="/60B1B6C7" Ref="U3"  Part="2" 
AR Path="/5D78E680/60B1B6C7" Ref="U?"  Part="1" 
AR Path="/5D363063/60B1B6C7" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/60B1B6C7" Ref="U?"  Part="1" 
F 0 "U3" H 2930 6746 50  0000 L CNN
F 1 "74HC574" H 2930 6655 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2450 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2450 6650 50  0001 C CNN
F 4 "Yes" H 2750 6700 50  0001 C CNN "Verified"
	2    2750 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 61999361
P 2600 3100
F 0 "#PWR0101" H 2600 2950 50  0001 C CNN
F 1 "+5V" H 2615 3273 50  0000 C CNN
F 2 "" H 2600 3100 50  0001 C CNN
F 3 "" H 2600 3100 50  0001 C CNN
	1    2600 3100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U4
U 2 1 60B1E141
P 2750 7350
AR Path="/60B1E141" Ref="U4"  Part="2" 
AR Path="/5D78E680/60B1E141" Ref="U?"  Part="1" 
AR Path="/5D363063/60B1E141" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/60B1E141" Ref="U?"  Part="1" 
F 0 "U4" H 2930 7396 50  0000 L CNN
F 1 "74HC574" H 2930 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2450 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2450 7300 50  0001 C CNN
F 4 "Yes" H 2750 7350 50  0001 C CNN "Verified"
	2    2750 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C606
U 1 1 5D42BD70
P 2400 7350
AR Path="/5D78E680/5D42BD70" Ref="C606"  Part="1" 
AR Path="/5D363063/5D42BD70" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D42BD70" Ref="C?"  Part="1" 
AR Path="/5D42BD70" Ref="C4"  Part="1" 
F 0 "C4" H 2309 7396 50  0000 R CNN
F 1 "100nF" H 2309 7305 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 7350 50  0001 C CNN
F 3 "~" H 2400 7350 50  0001 C CNN
	1    2400 7350
	1    0    0    -1  
$EndComp
Connection ~ 2400 7250
$Comp
L power:+5V #PWR0611
U 1 1 5D42BD6A
P 2400 7250
AR Path="/5D78E680/5D42BD6A" Ref="#PWR0611"  Part="1" 
AR Path="/5D363063/5D42BD6A" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD6A" Ref="#PWR?"  Part="1" 
AR Path="/5D42BD6A" Ref="#PWR0611"  Part="1" 
F 0 "#PWR0611" H 2400 7100 50  0001 C CNN
F 1 "+5V" H 2415 7423 50  0000 C CNN
F 2 "" H 2400 7250 50  0001 C CNN
F 3 "" H 2400 7250 50  0001 C CNN
	1    2400 7250
	1    0    0    -1  
$EndComp
Connection ~ 2400 7450
$Comp
L power:GND #PWR0612
U 1 1 5D42BD64
P 2400 7450
AR Path="/5D78E680/5D42BD64" Ref="#PWR0612"  Part="1" 
AR Path="/5D363063/5D42BD64" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D42BD64" Ref="#PWR?"  Part="1" 
AR Path="/5D42BD64" Ref="#PWR0612"  Part="1" 
F 0 "#PWR0612" H 2400 7200 50  0001 C CNN
F 1 "GND" H 2405 7277 50  0000 C CNN
F 2 "" H 2400 7450 50  0001 C CNN
F 3 "" H 2400 7450 50  0001 C CNN
	1    2400 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 3350 10100 3350
Wire Wire Line
	9900 3250 10100 3250
Wire Wire Line
	9900 3150 10100 3150
Wire Wire Line
	9900 3050 10100 3050
Wire Wire Line
	9900 2950 10100 2950
Wire Wire Line
	9900 2850 10100 2850
Wire Wire Line
	9900 2750 10100 2750
Wire Wire Line
	9900 2650 10100 2650
Text Label 9900 3350 0    50   ~ 0
D15
Text Label 9900 3250 0    50   ~ 0
D14
Text Label 9900 3150 0    50   ~ 0
D13
Text Label 9900 3050 0    50   ~ 0
D12
Text Label 9900 2950 0    50   ~ 0
D11
Text Label 9900 2850 0    50   ~ 0
D10
Text Label 9900 2750 0    50   ~ 0
D9
Text Label 9900 2650 0    50   ~ 0
D8
Text Label 1500 2850 2    50   ~ 0
FPD6
Text Label 1500 2950 2    50   ~ 0
FPD5
Text Label 1500 2650 2    50   ~ 0
FPD4
Wire Wire Line
	1500 2650 1150 2650
Wire Wire Line
	1500 2950 1150 2950
Wire Wire Line
	1500 2850 1150 2850
Wire Wire Line
	1250 2250 1150 2250
Wire Wire Line
	1150 2350 1250 2350
Wire Wire Line
	1250 2250 1250 2350
Connection ~ 1250 2350
Wire Wire Line
	1250 2350 1250 3250
Text Label 7650 2900 0    50   ~ 0
D10
Wire Wire Line
	7600 2900 7850 2900
Wire Wire Line
	7600 2500 7850 2500
Wire Wire Line
	7600 2400 7850 2400
Wire Wire Line
	7600 2000 7850 2000
Wire Wire Line
	7600 2300 7850 2300
Text Label 7650 2500 0    50   ~ 0
D6
Text Label 7650 2400 0    50   ~ 0
D4
Text Label 7650 2000 0    50   ~ 0
D3
Text Label 7650 2300 0    50   ~ 0
D2
$Comp
L Device:C_Small C?
U 1 1 62011A13
P 950 6700
AR Path="/5D78E680/62011A13" Ref="C?"  Part="1" 
AR Path="/5D363063/62011A13" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/62011A13" Ref="C?"  Part="1" 
AR Path="/62011A13" Ref="C1"  Part="1" 
F 0 "C1" H 859 6746 50  0000 R CNN
F 1 "100nF" H 859 6655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 6700 50  0001 C CNN
F 3 "~" H 950 6700 50  0001 C CNN
	1    950  6700
	1    0    0    -1  
$EndComp
Connection ~ 950  6600
Connection ~ 950  6800
$Comp
L Connector:Conn_01x16_Male J3
U 1 1 61F7FFA3
P 10300 4800
F 0 "J3" H 10272 4774 50  0000 R CNN
F 1 "Conn_01x16_Male" H 10272 4683 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 10300 4800 50  0001 C CNN
F 3 "~" H 10300 4800 50  0001 C CNN
	1    10300 4800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10100 2250 10000 2250
Wire Wire Line
	10100 2350 10000 2350
$Comp
L power:+5V #PWR0102
U 1 1 6211A135
P 9750 2200
F 0 "#PWR0102" H 9750 2050 50  0001 C CNN
F 1 "+5V" H 9765 2373 50  0000 C CNN
F 2 "" H 9750 2200 50  0001 C CNN
F 3 "" H 9750 2200 50  0001 C CNN
	1    9750 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 2200 9750 2250
Connection ~ 2250 3800
Wire Wire Line
	2250 3800 3300 3800
Wire Wire Line
	1950 2300 3300 2300
$Comp
L Device:R_Small R1
U 1 1 609088AA
P 2250 3200
F 0 "R1" H 2300 3250 50  0000 L CNN
F 1 "330Ω" H 2300 3150 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 3200 50  0001 C CNN
F 3 "~" H 2250 3200 50  0001 C CNN
	1    2250 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 2050 1250 2050
Wire Wire Line
	1250 2050 1250 2150
Connection ~ 1250 2250
Wire Wire Line
	1150 2150 1250 2150
Connection ~ 1250 2150
Wire Wire Line
	1250 2150 1250 2250
Wire Wire Line
	10000 2350 10000 2250
Wire Bus Line
	4750 850  8350 850 
Wire Bus Line
	4650 950  4650 3400
Wire Bus Line
	7500 950  7500 2800
Wire Bus Line
	7350 1400 7350 4050
Wire Bus Line
	2800 950  2800 4050
Connection ~ 10000 2250
Wire Wire Line
	10000 2250 9750 2250
Connection ~ 10000 2350
Wire Wire Line
	10000 2350 10000 2450
Wire Wire Line
	10100 2450 10000 2450
Wire Wire Line
	10100 2550 10000 2550
Connection ~ 10000 2450
Wire Wire Line
	10000 2450 10000 2550
$EndSCHEMATC
