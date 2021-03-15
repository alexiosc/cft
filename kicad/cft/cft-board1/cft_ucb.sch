EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 35
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
L alexios:74HC138 U?
U 1 1 5ECA14BF
P 3250 2900
AR Path="/5ECA14BF" Ref="U?"  Part="1" 
AR Path="/5EC793F3/5ECA14BF" Ref="U1904"  Part="1" 
F 0 "U1904" H 3250 3567 50  0000 C CNN
F 1 "74HC138" H 3250 3476 50  0000 C CNN
F 2 "" H 3250 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3250 2900 50  0001 C CNN
	1    3250 2900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G32 U?
U 1 1 5ECA14C5
P 1900 3300
AR Path="/5ECA14C5" Ref="U?"  Part="1" 
AR Path="/5EC793F3/5ECA14C5" Ref="U1905"  Part="1" 
F 0 "U1905" H 1850 3567 50  0000 C CNN
F 1 "74AHC1G32" H 1850 3476 50  0000 C CNN
F 2 "" H 1910 3280 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1910 3280 50  0001 C CNN
	1    1900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3300 2750 3300
$Comp
L alexios:74AUC1G74 U?
U 1 1 5ECA14CC
P 5750 5050
AR Path="/5ECA14CC" Ref="U?"  Part="1" 
AR Path="/5EC793F3/5ECA14CC" Ref="U1907"  Part="1" 
F 0 "U1907" H 5750 5467 50  0000 C CNN
F 1 "74AUC1G74" H 5750 5376 50  0000 C CNN
F 2 "" H 6200 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 6200 5050 50  0001 C CNN
	1    5750 5050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC175 U?
U 1 1 5ECA14D2
P 8950 2450
AR Path="/5ECA14D2" Ref="U?"  Part="1" 
AR Path="/5EC793F3/5ECA14D2" Ref="U1902"  Part="1" 
F 0 "U1902" H 8950 3117 50  0000 C CNN
F 1 "74HC175" H 8950 3026 50  0000 C CNN
F 2 "" H 8950 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 8950 2450 50  0001 C CNN
	1    8950 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5ECA14D8
P 4050 2500
AR Path="/5ECA14D8" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5ECA14D8" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5ECA14D8" Ref="R?"  Part="1" 
AR Path="/5CD91C88/5ECA14D8" Ref="R?"  Part="1" 
AR Path="/5EC793F3/5ECA14D8" Ref="R1901"  Part="1" 
F 0 "R1901" V 3854 2500 50  0000 C CNN
F 1 "30Ω" V 3945 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4050 2500 50  0001 C CNN
F 3 "~" H 4050 2500 50  0001 C CNN
	1    4050 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 2500 3950 2500
$Comp
L Device:R_Small R?
U 1 1 5ECA14DF
P 4050 2600
AR Path="/5ECA14DF" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5ECA14DF" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5ECA14DF" Ref="R?"  Part="1" 
AR Path="/5CD91C88/5ECA14DF" Ref="R?"  Part="1" 
AR Path="/5EC793F3/5ECA14DF" Ref="R1902"  Part="1" 
F 0 "R1902" V 4154 2600 50  0000 C CNN
F 1 "30Ω" V 4245 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4050 2600 50  0001 C CNN
F 3 "~" H 4050 2600 50  0001 C CNN
	1    4050 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 2600 3950 2600
NoConn ~ 3750 2700
NoConn ~ 3750 2800
NoConn ~ 3750 2900
NoConn ~ 3750 3000
NoConn ~ 3750 3100
NoConn ~ 3750 3200
Text Label 4400 2500 2    50   ~ 0
~WP
Text Label 4400 2600 2    50   ~ 0
~WT
Wire Wire Line
	2750 2500 2400 2500
Wire Wire Line
	2750 2600 2400 2600
Wire Wire Line
	2750 2700 2400 2700
Text Label 2500 2500 0    50   ~ 0
AB4
Text Label 2500 2600 0    50   ~ 0
AB5
Text Label 2500 2700 0    50   ~ 0
AB6
Wire Wire Line
	2750 3200 2400 3200
Text Label 2500 3200 0    50   ~ 0
AB7
$Comp
L power:+5V #PWR?
U 1 1 5ECA14F6
P 2700 3050
AR Path="/5ECA14F6" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA14F6" Ref="#PWR01901"  Part="1" 
F 0 "#PWR01901" H 2700 2900 50  0001 C CNN
F 1 "+5V" H 2715 3223 50  0000 C CNN
F 2 "" H 2700 3050 50  0001 C CNN
F 3 "" H 2700 3050 50  0001 C CNN
	1    2700 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3050 2700 3100
Wire Wire Line
	2700 3100 2750 3100
Wire Wire Line
	1700 3250 1100 3250
Text Label 1350 3350 0    50   ~ 0
~W
Text Label 1350 3250 0    50   ~ 0
~SYSDEV
Wire Wire Line
	1100 3350 1700 3350
Text HLabel 1100 3250 0    50   Input ~ 0
~SYSDEV
Text HLabel 1100 3350 0    50   Input ~ 0
~W
Entry Wire Line
	2300 2400 2400 2500
Entry Wire Line
	2300 2500 2400 2600
Entry Wire Line
	2300 2600 2400 2700
Entry Wire Line
	2300 3100 2400 3200
Text Label 1150 1000 0    50   ~ 0
AB[0..7]
Entry Bus Bus
	2200 1000 2300 1100
Entry Wire Line
	4500 1200 4600 1300
Entry Wire Line
	4500 1300 4600 1400
Entry Wire Line
	4500 1400 4600 1500
Entry Wire Line
	4500 1500 4600 1600
Wire Wire Line
	4150 2500 4650 2500
Text Label 1350 2100 0    50   ~ 0
~RESET
Text HLabel 1100 2100 0    50   Input ~ 0
~RESET
Entry Bus Bus
	4400 1000 4500 1100
Wire Wire Line
	5250 3200 4600 3200
Wire Wire Line
	5250 3300 4600 3300
Wire Wire Line
	5250 3400 4600 3400
Wire Wire Line
	5250 3500 4600 3500
Text Label 5200 3200 2    50   ~ 0
AB0
Text Label 5200 3400 2    50   ~ 0
AB2
Text Label 5200 3500 2    50   ~ 0
AB3
Text Label 5200 4000 2    50   ~ 0
~RESET
$Comp
L alexios:74HC175 U?
U 1 1 5ECA151A
P 5750 3600
AR Path="/5ECA151A" Ref="U?"  Part="1" 
AR Path="/5EC793F3/5ECA151A" Ref="U1906"  Part="1" 
F 0 "U1906" H 5750 4267 50  0000 C CNN
F 1 "74HC175" H 5750 4176 50  0000 C CNN
F 2 "" H 5750 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 5750 3600 50  0001 C CNN
	1    5750 3600
	1    0    0    -1  
$EndComp
Text Label 5200 3300 2    50   ~ 0
AB1
Wire Wire Line
	4650 3900 5250 3900
Entry Wire Line
	4500 3100 4600 3200
Entry Wire Line
	4500 3200 4600 3300
Entry Wire Line
	4500 3300 4600 3400
Entry Wire Line
	4500 3400 4600 3500
Wire Wire Line
	4150 2600 4650 2600
Wire Wire Line
	4750 4000 5250 4000
Wire Wire Line
	4750 2100 4750 4000
Connection ~ 4750 2100
Wire Wire Line
	4650 2000 5250 2000
Text Label 5000 1400 0    50   ~ 0
AB1
$Comp
L alexios:74HC175 U?
U 1 1 5ECA152C
P 5750 1700
AR Path="/5ECA152C" Ref="U?"  Part="1" 
AR Path="/5EC793F3/5ECA152C" Ref="U1901"  Part="1" 
F 0 "U1901" H 5750 2367 50  0000 C CNN
F 1 "74HC175" H 5750 2276 50  0000 C CNN
F 2 "" H 5750 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 5750 1700 50  0001 C CNN
	1    5750 1700
	1    0    0    -1  
$EndComp
Text Label 5000 2100 0    50   ~ 0
~RESET
Wire Wire Line
	5250 2100 4750 2100
Text Label 5000 1600 0    50   ~ 0
AB3
Text Label 5000 1500 0    50   ~ 0
AB2
Text Label 5000 1300 0    50   ~ 0
AB0
Wire Wire Line
	5250 1600 4600 1600
Wire Wire Line
	5250 1500 4600 1500
Wire Wire Line
	5250 1400 4600 1400
Wire Wire Line
	5250 1300 4600 1300
Wire Wire Line
	4650 2000 4650 2500
Wire Wire Line
	4650 2600 4650 3900
$Comp
L alexios:74HC157 U?
U 1 1 5ECA153D
P 7750 2650
AR Path="/5ECA153D" Ref="U?"  Part="1" 
AR Path="/5EC793F3/5ECA153D" Ref="U1903"  Part="1" 
F 0 "U1903" H 7750 3517 50  0000 C CNN
F 1 "74HC157" H 7750 3426 50  0000 C CNN
F 2 "" H 7750 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 7750 2650 50  0001 C CNN
	1    7750 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1600 6600 1600
Text Label 6300 1300 0    50   ~ 0
P0
Text Label 6300 1400 0    50   ~ 0
P1
Text Label 6300 1500 0    50   ~ 0
P2
Text Label 6300 1600 0    50   ~ 0
P3
Wire Wire Line
	7250 2050 6900 2050
Text Label 7250 2050 2    50   ~ 0
P0
Text Label 7250 2150 2    50   ~ 0
P1
Text Label 7250 2250 2    50   ~ 0
P2
Text Label 7250 2350 2    50   ~ 0
P3
Wire Wire Line
	6900 1300 6900 2050
Wire Wire Line
	6250 1300 6900 1300
Wire Wire Line
	6800 1400 6800 2150
Wire Wire Line
	6250 1400 6800 1400
Wire Wire Line
	6800 2150 7250 2150
Wire Wire Line
	6700 1500 6700 2250
Wire Wire Line
	6250 1500 6700 1500
Wire Wire Line
	6700 2250 7250 2250
Wire Wire Line
	6600 1600 6600 2350
Wire Wire Line
	6600 2350 7250 2350
Wire Wire Line
	6600 3200 6600 2500
Wire Wire Line
	6250 3200 6600 3200
Wire Wire Line
	6600 2500 7250 2500
Wire Wire Line
	6700 3300 6700 2600
Wire Wire Line
	6250 3300 6700 3300
Wire Wire Line
	6700 2600 7250 2600
Wire Wire Line
	6800 3400 6800 2700
Wire Wire Line
	6250 3400 6800 3400
Wire Wire Line
	6800 2700 7250 2700
Wire Wire Line
	6900 3500 6900 2800
Wire Wire Line
	6250 3500 6900 3500
Wire Wire Line
	6900 2800 7250 2800
$Comp
L power:GND #PWR?
U 1 1 5ECA1563
P 7250 3050
AR Path="/5ECA1563" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1563" Ref="#PWR01902"  Part="1" 
F 0 "#PWR01902" H 7250 2800 50  0001 C CNN
F 1 "GND" H 7255 2877 50  0000 C CNN
F 2 "" H 7250 3050 50  0001 C CNN
F 3 "" H 7250 3050 50  0001 C CNN
	1    7250 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2050 8450 2050
Wire Wire Line
	8250 2150 8450 2150
Wire Wire Line
	8250 2250 8450 2250
Wire Wire Line
	8250 2350 8450 2350
$Comp
L Device:R_Pack04 RN?
U 1 1 5ECA156D
P 9650 2250
AR Path="/5ECA156D" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5ECA156D" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/5ECA156D" Ref="RN?"  Part="1" 
AR Path="/5EC793F3/5ECA156D" Ref="RN1901"  Part="1" 
F 0 "RN1901" H 9371 2204 50  0000 R CNN
F 1 "10kΩ" H 9371 2295 50  0000 R CNN
F 2 "" V 9925 2250 50  0001 C CNN
F 3 "~" H 9650 2250 50  0001 C CNN
	1    9650 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	9850 2050 10150 2050
Wire Wire Line
	9850 2150 10150 2150
Wire Wire Line
	9850 2250 10150 2250
Wire Wire Line
	9850 2350 10150 2350
NoConn ~ 9450 2550
NoConn ~ 9450 2650
NoConn ~ 9450 2750
NoConn ~ 9450 2850
NoConn ~ 6250 1800
NoConn ~ 6250 1900
NoConn ~ 6250 2000
NoConn ~ 6250 2100
NoConn ~ 6250 3700
NoConn ~ 6250 3800
NoConn ~ 6250 3900
NoConn ~ 6250 4000
Entry Wire Line
	10150 2050 10250 1950
Entry Wire Line
	10150 2150 10250 2050
Entry Wire Line
	10150 2250 10250 2150
Entry Wire Line
	10150 2350 10250 2250
Entry Bus Bus
	10250 1400 10350 1300
Wire Bus Line
	10350 1300 10600 1300
Wire Wire Line
	4750 4200 4750 4000
Connection ~ 4750 4000
Text Label 1350 4350 0    50   ~ 0
~END
Text HLabel 1100 4350 0    50   Input ~ 0
~END
Text Label 8450 2750 2    50   ~ 0
~END
Wire Wire Line
	8350 4200 4750 4200
Wire Wire Line
	8350 2850 8450 2850
Text Label 8350 3100 1    50   ~ 0
~RESET
Wire Wire Line
	8350 2850 8350 4200
Wire Wire Line
	8200 2750 8450 2750
Wire Wire Line
	1100 4350 4500 4350
Wire Wire Line
	8200 4350 8200 2750
Text HLabel 10600 1300 2    50   Input ~ 0
µCB[0..3]
Text Label 9900 2050 0    50   ~ 0
µCB0
Text Label 9900 2150 0    50   ~ 0
µCB1
Text Label 9900 2250 0    50   ~ 0
µCB2
Text Label 9900 2350 0    50   ~ 0
µCB3
Wire Wire Line
	5300 4900 4650 4900
Wire Wire Line
	4650 4900 4650 3900
Connection ~ 4650 3900
Wire Wire Line
	5300 5100 4500 5100
Wire Wire Line
	4500 5100 4500 4350
Connection ~ 4500 4350
Wire Wire Line
	4500 4350 8200 4350
Text Label 4500 4900 1    50   ~ 0
~END
Wire Wire Line
	5300 5200 4750 5200
Wire Wire Line
	4750 5200 4750 4200
Connection ~ 4750 4200
Text Label 5150 5200 2    50   ~ 0
~RESET
$Comp
L power:GND #PWR?
U 1 1 5ECA15A6
P 5250 5300
AR Path="/5ECA15A6" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA15A6" Ref="#PWR01903"  Part="1" 
F 0 "#PWR01903" H 5250 5050 50  0001 C CNN
F 1 "GND" H 5255 5127 50  0000 C CNN
F 2 "" H 5250 5300 50  0001 C CNN
F 3 "" H 5250 5300 50  0001 C CNN
	1    5250 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 5000 5250 5000
Wire Wire Line
	5250 5000 5250 5300
Text Label 5150 5100 2    50   ~ 0
~END
NoConn ~ 6200 5200
Wire Wire Line
	6200 4900 7000 4900
Wire Wire Line
	7000 4900 7000 2950
Wire Wire Line
	7000 2950 7250 2950
Text Label 6250 4900 0    50   ~ 0
~P~∕T
Text Label 7250 2950 2    50   ~ 0
~P~∕T
Text Label 6300 3200 0    50   ~ 0
T0
Text Label 6300 3300 0    50   ~ 0
T1
Text Label 6300 3400 0    50   ~ 0
T2
Text Label 6300 3500 0    50   ~ 0
T3
Text Label 7150 2500 0    50   ~ 0
T0
Text Label 7150 2600 0    50   ~ 0
T1
Text Label 7150 2700 0    50   ~ 0
T2
Text Label 7150 2800 0    50   ~ 0
T3
Text Label 5000 2000 0    50   ~ 0
~WP
Text Label 4650 2800 3    50   ~ 0
~WT
Text Label 4750 2900 1    50   ~ 0
~RESET
Text Label 4300 4350 0    50   ~ 0
~END
Text Label 7600 4350 0    50   ~ 0
~END
Text Label 5200 3900 2    50   ~ 0
~WT
Text Label 5150 4900 2    50   ~ 0
~WT
$Comp
L alexios:74HC138 U?
U 2 1 5ECA15C4
P 3050 6400
AR Path="/5ECA15C4" Ref="U?"  Part="2" 
AR Path="/5EC793F3/5ECA15C4" Ref="U1904"  Part="2" 
F 0 "U1904" H 3230 6446 50  0000 L CNN
F 1 "74HC138" H 3230 6355 50  0000 L CNN
F 2 "" H 3050 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3050 6400 50  0001 C CNN
	2    3050 6400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G32 U?
U 2 1 5ECA15CA
P 1650 6150
AR Path="/5ECA15CA" Ref="U?"  Part="2" 
AR Path="/5EC793F3/5ECA15CA" Ref="U1905"  Part="2" 
F 0 "U1905" H 1780 5946 50  0000 L CNN
F 1 "74AHC1G32" H 1780 5855 50  0000 L CNN
F 2 "" H 1660 6130 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1660 6130 50  0001 C CNN
	2    1650 6150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC175 U?
U 2 1 5ECA15D0
P 4400 6700
AR Path="/5ECA15D0" Ref="U?"  Part="2" 
AR Path="/5EC793F3/5ECA15D0" Ref="U1901"  Part="2" 
F 0 "U1901" H 4580 7046 50  0000 L CNN
F 1 "74HC175" H 4580 6955 50  0000 L CNN
F 2 "" H 4400 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 4400 6700 50  0001 C CNN
	2    4400 6700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC175 U?
U 2 1 5ECA15D6
P 5750 6700
AR Path="/5ECA15D6" Ref="U?"  Part="2" 
AR Path="/5EC793F3/5ECA15D6" Ref="U1902"  Part="2" 
F 0 "U1902" H 5930 7046 50  0000 L CNN
F 1 "74HC175" H 5930 6955 50  0000 L CNN
F 2 "" H 5750 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 5750 6700 50  0001 C CNN
	2    5750 6700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AUC1G74 U?
U 2 1 5ECA15DC
P 3050 7100
AR Path="/5ECA15DC" Ref="U?"  Part="2" 
AR Path="/5EC793F3/5ECA15DC" Ref="U1907"  Part="2" 
F 0 "U1907" H 3230 7146 50  0000 L CNN
F 1 "74AUC1G74" H 3230 7055 50  0000 L CNN
F 2 "" H 3500 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3500 7100 50  0001 C CNN
	2    3050 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC157 U?
U 2 1 5ECA15E2
P 4400 7600
AR Path="/5ECA15E2" Ref="U?"  Part="2" 
AR Path="/5EC793F3/5ECA15E2" Ref="U1903"  Part="2" 
F 0 "U1903" H 4580 8146 50  0000 L CNN
F 1 "74HC157" H 4580 8055 50  0000 L CNN
F 2 "" H 4400 7600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 4400 7600 50  0001 C CNN
	2    4400 7600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC175 U?
U 2 1 5ECA15E8
P 5750 7400
AR Path="/5ECA15E8" Ref="U?"  Part="2" 
AR Path="/5EC793F3/5ECA15E8" Ref="U1906"  Part="2" 
F 0 "U1906" H 5930 7746 50  0000 L CNN
F 1 "74HC175" H 5930 7655 50  0000 L CNN
F 2 "" H 5750 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 5750 7400 50  0001 C CNN
	2    5750 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ECA15EE
P 5400 7100
AR Path="/5CC0D65F/5ECA15EE" Ref="C?"  Part="1" 
AR Path="/5ECA15EE" Ref="C?"  Part="1" 
AR Path="/5EC793F3/5ECA15EE" Ref="C1907"  Part="1" 
F 0 "C1907" H 5309 7146 50  0000 R CNN
F 1 "100nF" H 5309 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5400 7100 50  0001 C CNN
F 3 "~" H 5400 7100 50  0001 C CNN
	1    5400 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ECA15F4
P 4050 7100
AR Path="/5CC0D65F/5ECA15F4" Ref="C?"  Part="1" 
AR Path="/5ECA15F4" Ref="C?"  Part="1" 
AR Path="/5EC793F3/5ECA15F4" Ref="C1906"  Part="1" 
F 0 "C1906" H 3959 7146 50  0000 R CNN
F 1 "100nF" H 3959 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4050 7100 50  0001 C CNN
F 3 "~" H 4050 7100 50  0001 C CNN
	1    4050 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ECA15FA
P 2700 7100
AR Path="/5CC0D65F/5ECA15FA" Ref="C?"  Part="1" 
AR Path="/5ECA15FA" Ref="C?"  Part="1" 
AR Path="/5EC793F3/5ECA15FA" Ref="C1905"  Part="1" 
F 0 "C1905" H 2609 7146 50  0000 R CNN
F 1 "100nF" H 2609 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2700 7100 50  0001 C CNN
F 3 "~" H 2700 7100 50  0001 C CNN
	1    2700 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ECA1600
P 5400 6400
AR Path="/5CC0D65F/5ECA1600" Ref="C?"  Part="1" 
AR Path="/5ECA1600" Ref="C?"  Part="1" 
AR Path="/5EC793F3/5ECA1600" Ref="C1904"  Part="1" 
F 0 "C1904" H 5309 6446 50  0000 R CNN
F 1 "100nF" H 5309 6355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5400 6400 50  0001 C CNN
F 3 "~" H 5400 6400 50  0001 C CNN
	1    5400 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ECA1606
P 4050 6400
AR Path="/5CC0D65F/5ECA1606" Ref="C?"  Part="1" 
AR Path="/5ECA1606" Ref="C?"  Part="1" 
AR Path="/5EC793F3/5ECA1606" Ref="C1903"  Part="1" 
F 0 "C1903" H 3959 6446 50  0000 R CNN
F 1 "100nF" H 3959 6355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4050 6400 50  0001 C CNN
F 3 "~" H 4050 6400 50  0001 C CNN
	1    4050 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ECA160C
P 2700 6400
AR Path="/5CC0D65F/5ECA160C" Ref="C?"  Part="1" 
AR Path="/5ECA160C" Ref="C?"  Part="1" 
AR Path="/5EC793F3/5ECA160C" Ref="C1902"  Part="1" 
F 0 "C1902" H 2609 6446 50  0000 R CNN
F 1 "100nF" H 2609 6355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2700 6400 50  0001 C CNN
F 3 "~" H 2700 6400 50  0001 C CNN
	1    2700 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ECA1612
P 1250 6400
AR Path="/5CC0D65F/5ECA1612" Ref="C?"  Part="1" 
AR Path="/5ECA1612" Ref="C?"  Part="1" 
AR Path="/5EC793F3/5ECA1612" Ref="C1901"  Part="1" 
F 0 "C1901" H 1159 6446 50  0000 R CNN
F 1 "100nF" H 1159 6355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1250 6400 50  0001 C CNN
F 3 "~" H 1250 6400 50  0001 C CNN
	1    1250 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ECA1618
P 1250 6300
AR Path="/5ECA1618" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1618" Ref="#PWR01904"  Part="1" 
F 0 "#PWR01904" H 1250 6150 50  0001 C CNN
F 1 "+5V" H 1265 6473 50  0000 C CNN
F 2 "" H 1250 6300 50  0001 C CNN
F 3 "" H 1250 6300 50  0001 C CNN
	1    1250 6300
	1    0    0    -1  
$EndComp
Connection ~ 1250 6300
$Comp
L power:+5V #PWR?
U 1 1 5ECA161F
P 2700 6300
AR Path="/5ECA161F" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA161F" Ref="#PWR01905"  Part="1" 
F 0 "#PWR01905" H 2700 6150 50  0001 C CNN
F 1 "+5V" H 2715 6473 50  0000 C CNN
F 2 "" H 2700 6300 50  0001 C CNN
F 3 "" H 2700 6300 50  0001 C CNN
	1    2700 6300
	1    0    0    -1  
$EndComp
Connection ~ 2700 6300
$Comp
L power:+5V #PWR?
U 1 1 5ECA1626
P 4050 6300
AR Path="/5ECA1626" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1626" Ref="#PWR01906"  Part="1" 
F 0 "#PWR01906" H 4050 6150 50  0001 C CNN
F 1 "+5V" H 4065 6473 50  0000 C CNN
F 2 "" H 4050 6300 50  0001 C CNN
F 3 "" H 4050 6300 50  0001 C CNN
	1    4050 6300
	1    0    0    -1  
$EndComp
Connection ~ 4050 6300
$Comp
L power:+5V #PWR?
U 1 1 5ECA162D
P 5400 6300
AR Path="/5ECA162D" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA162D" Ref="#PWR01907"  Part="1" 
F 0 "#PWR01907" H 5400 6150 50  0001 C CNN
F 1 "+5V" H 5415 6473 50  0000 C CNN
F 2 "" H 5400 6300 50  0001 C CNN
F 3 "" H 5400 6300 50  0001 C CNN
	1    5400 6300
	1    0    0    -1  
$EndComp
Connection ~ 5400 6300
$Comp
L power:+5V #PWR?
U 1 1 5ECA1634
P 2700 7000
AR Path="/5ECA1634" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1634" Ref="#PWR01912"  Part="1" 
F 0 "#PWR01912" H 2700 6850 50  0001 C CNN
F 1 "+5V" H 2715 7173 50  0000 C CNN
F 2 "" H 2700 7000 50  0001 C CNN
F 3 "" H 2700 7000 50  0001 C CNN
	1    2700 7000
	1    0    0    -1  
$EndComp
Connection ~ 2700 7000
$Comp
L power:+5V #PWR?
U 1 1 5ECA163B
P 4050 7000
AR Path="/5ECA163B" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA163B" Ref="#PWR01913"  Part="1" 
F 0 "#PWR01913" H 4050 6850 50  0001 C CNN
F 1 "+5V" H 4065 7173 50  0000 C CNN
F 2 "" H 4050 7000 50  0001 C CNN
F 3 "" H 4050 7000 50  0001 C CNN
	1    4050 7000
	1    0    0    -1  
$EndComp
Connection ~ 4050 7000
$Comp
L power:+5V #PWR?
U 1 1 5ECA1642
P 5400 7000
AR Path="/5ECA1642" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1642" Ref="#PWR01914"  Part="1" 
F 0 "#PWR01914" H 5400 6850 50  0001 C CNN
F 1 "+5V" H 5415 7173 50  0000 C CNN
F 2 "" H 5400 7000 50  0001 C CNN
F 3 "" H 5400 7000 50  0001 C CNN
	1    5400 7000
	1    0    0    -1  
$EndComp
Connection ~ 5400 7000
$Comp
L power:GND #PWR?
U 1 1 5ECA1649
P 1250 6500
AR Path="/5ECA1649" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1649" Ref="#PWR01908"  Part="1" 
F 0 "#PWR01908" H 1250 6250 50  0001 C CNN
F 1 "GND" H 1255 6327 50  0000 C CNN
F 2 "" H 1250 6500 50  0001 C CNN
F 3 "" H 1250 6500 50  0001 C CNN
	1    1250 6500
	1    0    0    -1  
$EndComp
Connection ~ 1250 6500
$Comp
L power:GND #PWR?
U 1 1 5ECA1650
P 2700 6500
AR Path="/5ECA1650" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1650" Ref="#PWR01909"  Part="1" 
F 0 "#PWR01909" H 2700 6250 50  0001 C CNN
F 1 "GND" H 2705 6327 50  0000 C CNN
F 2 "" H 2700 6500 50  0001 C CNN
F 3 "" H 2700 6500 50  0001 C CNN
	1    2700 6500
	1    0    0    -1  
$EndComp
Connection ~ 2700 6500
$Comp
L power:GND #PWR?
U 1 1 5ECA1657
P 4050 6500
AR Path="/5ECA1657" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1657" Ref="#PWR01910"  Part="1" 
F 0 "#PWR01910" H 4050 6250 50  0001 C CNN
F 1 "GND" H 4055 6327 50  0000 C CNN
F 2 "" H 4050 6500 50  0001 C CNN
F 3 "" H 4050 6500 50  0001 C CNN
	1    4050 6500
	1    0    0    -1  
$EndComp
Connection ~ 4050 6500
$Comp
L power:GND #PWR?
U 1 1 5ECA165E
P 5400 6500
AR Path="/5ECA165E" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA165E" Ref="#PWR01911"  Part="1" 
F 0 "#PWR01911" H 5400 6250 50  0001 C CNN
F 1 "GND" H 5405 6327 50  0000 C CNN
F 2 "" H 5400 6500 50  0001 C CNN
F 3 "" H 5400 6500 50  0001 C CNN
	1    5400 6500
	1    0    0    -1  
$EndComp
Connection ~ 5400 6500
$Comp
L power:GND #PWR?
U 1 1 5ECA1665
P 2750 7200
AR Path="/5ECA1665" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1665" Ref="#PWR01915"  Part="1" 
F 0 "#PWR01915" H 2750 6950 50  0001 C CNN
F 1 "GND" H 2755 7027 50  0000 C CNN
F 2 "" H 2750 7200 50  0001 C CNN
F 3 "" H 2750 7200 50  0001 C CNN
	1    2750 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ECA166B
P 4050 7200
AR Path="/5ECA166B" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA166B" Ref="#PWR01916"  Part="1" 
F 0 "#PWR01916" H 4050 6950 50  0001 C CNN
F 1 "GND" H 4055 7027 50  0000 C CNN
F 2 "" H 4050 7200 50  0001 C CNN
F 3 "" H 4050 7200 50  0001 C CNN
	1    4050 7200
	1    0    0    -1  
$EndComp
Connection ~ 4050 7200
$Comp
L power:GND #PWR?
U 1 1 5ECA1672
P 5400 7200
AR Path="/5ECA1672" Ref="#PWR?"  Part="1" 
AR Path="/5EC793F3/5ECA1672" Ref="#PWR01917"  Part="1" 
F 0 "#PWR01917" H 5400 6950 50  0001 C CNN
F 1 "GND" H 5405 7027 50  0000 C CNN
F 2 "" H 5400 7200 50  0001 C CNN
F 3 "" H 5400 7200 50  0001 C CNN
	1    5400 7200
	1    0    0    -1  
$EndComp
Connection ~ 5400 7200
Wire Wire Line
	1100 2100 4750 2100
Text HLabel 1100 1000 0    50   Input ~ 0
AB[0..7]
Text Notes 7150 7000 0    197  ~ 39
Microcode Banking (µCB)
Wire Bus Line
	1100 1000 4400 1000
Wire Bus Line
	10250 1400 10250 2250
Wire Bus Line
	2300 1100 2300 3100
Wire Bus Line
	4500 1100 4500 3400
$EndSCHEMATC
