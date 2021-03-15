EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 17
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
L alexios:74AHC1G08 U?
U 1 1 5DEB2D66
P 2950 1300
AR Path="/5DEB2D66" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB2D66" Ref="U1701"  Part="1" 
F 0 "U1701" H 2875 1567 50  0000 C CNN
F 1 "74AHC1G08" H 2875 1476 50  0000 C CNN
F 2 "" H 2600 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2600 1300 50  0001 C CNN
	1    2950 1300
	1    0    0    -1  
$EndComp
Text Label 1350 1250 0    50   ~ 6
~ENDEXT
Wire Wire Line
	950  1350 2650 1350
Text HLabel 950  1250 0    50   Input ~ 6
~ENDEXT
Text Label 1350 1350 0    50   ~ 6
~END
Text HLabel 950  1350 0    50   Input ~ 6
~END
$Comp
L alexios:74HC161 U?
U 1 1 5DEB2D71
P 4850 1400
AR Path="/5DEB2D71" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB2D71" Ref="U1702"  Part="1" 
F 0 "U1702" H 4850 2167 50  0000 C CNN
F 1 "74HC161" H 4850 2076 50  0000 C CNN
F 2 "" H 5150 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 5150 1650 50  0001 C CNN
	1    4850 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 900  4250 900 
Wire Wire Line
	4250 900  4250 1000
Wire Wire Line
	4350 1000 4250 1000
Connection ~ 4250 1000
Wire Wire Line
	4250 1000 4250 1100
Wire Wire Line
	4350 1100 4250 1100
Connection ~ 4250 1100
Wire Wire Line
	4250 1100 4250 1200
Wire Wire Line
	4350 1200 4250 1200
Connection ~ 4250 1200
Wire Wire Line
	4250 1200 4250 1250
$Comp
L power:GND #PWR?
U 1 1 5DEB2D82
P 4250 1250
AR Path="/5DEB2D82" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5DEB2D82" Ref="#PWR01701"  Part="1" 
F 0 "#PWR01701" H 4250 1000 50  0001 C CNN
F 1 "GND" H 4150 1300 50  0000 R CNN
F 2 "" H 4250 1250 50  0001 C CNN
F 3 "" H 4250 1250 50  0001 C CNN
	1    4250 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1400 4350 1400
Text Label 3150 1300 0    50   ~ 6
~µPCCLR
Text HLabel 950  1900 0    50   Input ~ 6
~RSTHOLD
Text Label 1350 1900 0    50   ~ 6
~RSTHOLD
Text Label 4300 1900 2    50   ~ 6
~RSTHOLD
Text Label 4150 1400 2    50   ~ 6
~µPCCLR
Wire Wire Line
	950  1900 4350 1900
Text HLabel 950  1500 0    50   Input ~ 6
~WS
Text Label 1350 1500 0    50   ~ 6
~WS
Wire Wire Line
	3100 1300 3550 1300
Wire Wire Line
	3550 1300 3550 1400
Text Label 4300 1500 2    50   ~ 6
~WS
Wire Wire Line
	4350 1600 2250 1600
Text Label 1350 1600 0    50   ~ 6
~HALT
Text HLabel 950  1600 0    50   Input ~ 6
~HALT
Text Label 1350 1700 0    50   ~ 6
CLK4
Text HLabel 950  1700 0    50   Input ~ 6
CLK4
NoConn ~ 5350 1400
$Comp
L Device:R_Pack04 RN?
U 1 1 5DEB2D9A
P 5550 1100
AR Path="/5DEB2D9A" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5DEB2D9A" Ref="RN1701"  Part="1" 
F 0 "RN1701" V 5133 1100 50  0000 C CNN
F 1 "30Ω" V 5224 1100 50  0000 C CNN
F 2 "" V 5825 1100 50  0001 C CNN
F 3 "~" H 5550 1100 50  0001 C CNN
	1    5550 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 900  6050 900 
Wire Wire Line
	5750 1000 6050 1000
Wire Wire Line
	5750 1100 6050 1100
Wire Wire Line
	5750 1200 6050 1200
Entry Wire Line
	6150 1300 6050 1200
Entry Wire Line
	6150 1200 6050 1100
Entry Wire Line
	6150 1100 6050 1000
Entry Wire Line
	6150 1000 6050 900 
Entry Bus Bus
	6150 1450 6250 1550
Text Label 6700 1550 2    50   ~ 6
µPC[0..3]
Text HLabel 10700 1550 2    50   Output ~ 6
µPC[0..3]
Text Label 5800 900  0    50   ~ 6
UPC0
Text Label 5800 1000 0    50   ~ 6
UPC1
Text Label 5800 1100 0    50   ~ 6
UPC2
Text Label 5800 1200 0    50   ~ 6
UPC3
$Comp
L alexios:74AHC1G00 U?
U 1 1 5DEB2DB0
P 2950 2250
AR Path="/5DEB2DB0" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB2DB0" Ref="U1703"  Part="1" 
F 0 "U1703" H 2875 2075 50  0000 C CNN
F 1 "74AHC1G00" H 2875 1984 50  0000 C CNN
F 2 "" H 2600 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2600 2250 50  0001 C CNN
	1    2950 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2200 2250 2200
Wire Wire Line
	2250 2200 2250 1600
Connection ~ 2250 1600
Text Label 1350 2300 0    50   ~ 6
~RESET
Text HLabel 950  2300 0    50   Input ~ 6
~RESET
$Comp
L Device:R_Small R?
U 1 1 5DEB2DBB
P 3200 2250
AR Path="/5DEB2DBB" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEB2DBB" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEB2DBB" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEB2DBB" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEB2DBB" Ref="R1701"  Part="1" 
F 0 "R1701" V 3396 2250 50  0000 C CNN
F 1 "30Ω" V 3305 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3200 2250 50  0001 C CNN
F 3 "~" H 3200 2250 50  0001 C CNN
	1    3200 2250
	0    -1   -1   0   
$EndComp
Text HLabel 10700 2250 2    50   Output ~ 6
~µCE
Text Label 6350 2250 0    50   ~ 6
~µCE
Text Label 3350 2250 0    50   ~ 6
~µCE
Text Notes 3350 2500 0    50   ~ 6
~µCE~ is used to disable microcode unit decoders when\nthe processor is resetting or halted.
Wire Wire Line
	950  1250 2650 1250
Wire Wire Line
	950  1500 4350 1500
Wire Wire Line
	950  1600 2250 1600
Wire Wire Line
	950  2300 2650 2300
Wire Wire Line
	4350 1700 950  1700
Text Label 2600 2200 2    50   ~ 6
~HALT
Text Label 2600 2300 2    50   ~ 6
~RESET
Text Label 4300 1600 2    50   ~ 6
~HALT
Text Label 4300 1700 2    50   ~ 6
CLK4
$Comp
L alexios:74AHC1G08 U?
U 2 1 5DEB32A6
P 2900 6650
AR Path="/5DEB32A6" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB32A6" Ref="U1403"  Part="2" 
F 0 "U1403" H 2980 6596 50  0000 L CNN
F 1 "74AHC1G08" H 2980 6505 50  0000 L CNN
F 2 "" H 2550 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2550 6650 50  0001 C CNN
	2    2900 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G00 U?
U 2 1 5DEB36D4
P 4700 6650
AR Path="/5DEB36D4" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB36D4" Ref="U1703"  Part="2" 
F 0 "U1703" H 4780 6596 50  0000 L CNN
F 1 "74AHC1G00" H 4780 6505 50  0000 L CNN
F 2 "" H 4350 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4350 6650 50  0001 C CNN
	2    4700 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC161 U?
U 2 1 5DEB3C99
P 6400 7150
AR Path="/5DEB3C99" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB3C99" Ref="U1702"  Part="2" 
F 0 "U1702" H 6580 7596 50  0000 L CNN
F 1 "74HC161" H 6580 7505 50  0000 L CNN
F 2 "" H 6700 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 6700 7400 50  0001 C CNN
	2    6400 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DEB8F55
P 2450 6750
AR Path="/5CC0D65F/5DEB8F55" Ref="C?"  Part="1" 
AR Path="/5DEB8F55" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEB8F55" Ref="C1701"  Part="1" 
F 0 "C1701" H 2359 6796 50  0000 R CNN
F 1 "100nF" H 2359 6705 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2450 6750 50  0001 C CNN
F 3 "~" H 2450 6750 50  0001 C CNN
	1    2450 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DEB9460
P 4250 6750
AR Path="/5CC0D65F/5DEB9460" Ref="C?"  Part="1" 
AR Path="/5DEB9460" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEB9460" Ref="C1702"  Part="1" 
F 0 "C1702" H 4159 6796 50  0000 R CNN
F 1 "100nF" H 4159 6705 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4250 6750 50  0001 C CNN
F 3 "~" H 4250 6750 50  0001 C CNN
	1    4250 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DEB9AAE
P 6050 6750
AR Path="/5CC0D65F/5DEB9AAE" Ref="C?"  Part="1" 
AR Path="/5DEB9AAE" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEB9AAE" Ref="C1703"  Part="1" 
F 0 "C1703" H 5959 6796 50  0000 R CNN
F 1 "100nF" H 5959 6705 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6050 6750 50  0001 C CNN
F 3 "~" H 6050 6750 50  0001 C CNN
	1    6050 6750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01708
U 1 1 5DEBA174
P 2450 6650
F 0 "#PWR01708" H 2450 6500 50  0001 C CNN
F 1 "+5V" H 2465 6823 50  0000 C CNN
F 2 "" H 2450 6650 50  0001 C CNN
F 3 "" H 2450 6650 50  0001 C CNN
	1    2450 6650
	1    0    0    -1  
$EndComp
Connection ~ 2450 6650
$Comp
L power:GND #PWR01711
U 1 1 5DEBA8B7
P 2450 6850
F 0 "#PWR01711" H 2450 6600 50  0001 C CNN
F 1 "GND" H 2455 6677 50  0000 C CNN
F 2 "" H 2450 6850 50  0001 C CNN
F 3 "" H 2450 6850 50  0001 C CNN
	1    2450 6850
	1    0    0    -1  
$EndComp
Connection ~ 2450 6850
$Comp
L power:GND #PWR01712
U 1 1 5DEBAB17
P 4250 6850
F 0 "#PWR01712" H 4250 6600 50  0001 C CNN
F 1 "GND" H 4255 6677 50  0000 C CNN
F 2 "" H 4250 6850 50  0001 C CNN
F 3 "" H 4250 6850 50  0001 C CNN
	1    4250 6850
	1    0    0    -1  
$EndComp
Connection ~ 4250 6850
$Comp
L power:GND #PWR01713
U 1 1 5DEBC032
P 6050 6850
F 0 "#PWR01713" H 6050 6600 50  0001 C CNN
F 1 "GND" H 6055 6677 50  0000 C CNN
F 2 "" H 6050 6850 50  0001 C CNN
F 3 "" H 6050 6850 50  0001 C CNN
	1    6050 6850
	1    0    0    -1  
$EndComp
Connection ~ 6050 6850
$Comp
L power:+5V #PWR01709
U 1 1 5DEBC5C9
P 4250 6650
F 0 "#PWR01709" H 4250 6500 50  0001 C CNN
F 1 "+5V" H 4265 6823 50  0000 C CNN
F 2 "" H 4250 6650 50  0001 C CNN
F 3 "" H 4250 6650 50  0001 C CNN
	1    4250 6650
	1    0    0    -1  
$EndComp
Connection ~ 4250 6650
$Comp
L power:+5V #PWR01710
U 1 1 5DEBC983
P 6050 6650
F 0 "#PWR01710" H 6050 6500 50  0001 C CNN
F 1 "+5V" H 6065 6823 50  0000 C CNN
F 2 "" H 6050 6650 50  0001 C CNN
F 3 "" H 6050 6650 50  0001 C CNN
	1    6050 6650
	1    0    0    -1  
$EndComp
Connection ~ 6050 6650
Text Notes 7150 6950 0    197  ~ 39
Microcode Sequencer
Text Notes 6350 1350 0    50   ~ 6
The µPC controls the running of the processor. It counts up to 16, so\nmicroprograms can only have  up to 16 steps. It resets to 0000 when the\nControl Unit asserts ~END~ or the a CPU extension card asserts ~ENDEXT~\non the bus.  It increments at the end of a processor cycle (rising edge of\nCLK4), and only when ~RSTHOLD~, ~HALT~ and ~WS~ are all deasserted.
$Comp
L alexios:29F040 U1704
U 1 1 5DEE252E
P 2850 4150
F 0 "U1704" H 2825 5267 50  0000 C CNN
F 1 "29F040" H 2825 5176 50  0000 C CNN
F 2 "" H 2850 4150 50  0001 C CNN
F 3 "" H 2850 4150 50  0001 C CNN
	1    2850 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3300 1850 3300
Wire Wire Line
	2200 3400 1850 3400
Wire Wire Line
	2200 3500 1850 3500
Wire Wire Line
	2200 3600 1850 3600
Wire Wire Line
	2200 3700 1850 3700
Wire Wire Line
	2200 3800 1850 3800
Wire Wire Line
	2200 3900 1850 3900
Wire Wire Line
	2200 4000 1850 4000
Wire Wire Line
	2200 4100 1850 4100
Wire Wire Line
	2200 4200 1850 4200
Wire Wire Line
	2200 4300 1850 4300
Wire Wire Line
	2200 4400 1850 4400
Wire Wire Line
	2200 4500 1850 4500
Wire Wire Line
	2200 4600 1850 4600
Wire Wire Line
	2200 4700 1850 4700
Wire Wire Line
	2200 4800 1850 4800
Wire Wire Line
	2200 4900 1850 4900
Wire Wire Line
	2200 5000 1850 5000
Wire Wire Line
	2200 5100 1850 5100
Text Label 1850 3300 0    50   ~ 6
UPC0
Text Label 1850 3400 0    50   ~ 6
UPC1
Text Label 1850 3500 0    50   ~ 6
UPC2
Text Label 1850 3600 0    50   ~ 6
UPC3
Text Label 1850 3700 0    50   ~ 6
~AINDEX
Text Label 1850 3800 0    50   ~ 6
~SKIP
Text Label 1850 3900 0    50   ~ 6
IR11
Text Label 1850 4000 0    50   ~ 6
IR12
Text Label 1850 4100 0    50   ~ 6
IR13
Text Label 1850 4200 0    50   ~ 6
IR14
Text Label 1850 4300 0    50   ~ 6
IR15
Text Label 1850 4400 0    50   ~ 6
FL
Text Label 1850 4500 0    50   ~ 6
FV
Text Label 1850 4600 0    50   ~ 6
~IRQSUC
Text Label 1850 4700 0    50   ~ 6
~RSTHOLD
Text Label 1850 4800 0    50   ~ 6
µCB0
Text Label 1850 4900 0    50   ~ 6
UCB1
Text Label 1850 5000 0    50   ~ 6
UCB2
Text Label 1850 5100 0    50   ~ 6
UCB3
$Comp
L Device:R_Pack04 RN?
U 1 1 5DF01519
P 3650 3500
AR Path="/5DF01519" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5DF01519" Ref="RN1702"  Part="1" 
F 0 "RN1702" V 3233 3500 50  0000 C CNN
F 1 "30Ω" V 3324 3500 50  0000 C CNN
F 2 "" V 3925 3500 50  0001 C CNN
F 3 "~" H 3650 3500 50  0001 C CNN
	1    3650 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5DF01ED8
P 3650 3900
AR Path="/5DF01ED8" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5DF01ED8" Ref="RN1705"  Part="1" 
F 0 "RN1705" V 3883 3900 50  0000 C CNN
F 1 "30Ω" V 3974 3900 50  0000 C CNN
F 2 "" V 3925 3900 50  0001 C CNN
F 3 "~" H 3650 3900 50  0001 C CNN
	1    3650 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	3850 3300 4200 3300
Wire Wire Line
	3850 3400 4200 3400
Wire Wire Line
	3850 3500 4200 3500
Wire Wire Line
	3850 3600 4200 3600
Wire Wire Line
	3850 3700 4200 3700
Wire Wire Line
	3850 3800 4200 3800
Wire Wire Line
	3850 3900 4200 3900
Wire Wire Line
	3850 4000 4200 4000
$Comp
L alexios:29F040 U1705
U 1 1 5DF0D47D
P 5400 4150
F 0 "U1705" H 5375 5267 50  0000 C CNN
F 1 "29F040" H 5375 5176 50  0000 C CNN
F 2 "" H 5400 4150 50  0001 C CNN
F 3 "" H 5400 4150 50  0001 C CNN
	1    5400 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3300 4400 3300
Wire Wire Line
	4750 3400 4400 3400
Wire Wire Line
	4750 3500 4400 3500
Wire Wire Line
	4750 3600 4400 3600
Wire Wire Line
	4750 3700 4400 3700
Wire Wire Line
	4750 3800 4400 3800
Wire Wire Line
	4750 3900 4400 3900
Wire Wire Line
	4750 4000 4400 4000
Wire Wire Line
	4750 4100 4400 4100
Wire Wire Line
	4750 4200 4400 4200
Wire Wire Line
	4750 4300 4400 4300
Wire Wire Line
	4750 4400 4400 4400
Wire Wire Line
	4750 4500 4400 4500
Wire Wire Line
	4750 4600 4400 4600
Wire Wire Line
	4750 4700 4400 4700
Wire Wire Line
	4750 4800 4400 4800
Wire Wire Line
	4750 4900 4400 4900
Wire Wire Line
	4750 5000 4400 5000
Wire Wire Line
	4750 5100 4400 5100
Text Label 4400 3300 0    50   ~ 6
UPC0
Text Label 4400 3400 0    50   ~ 6
UPC1
Text Label 4400 3500 0    50   ~ 6
UPC2
Text Label 4400 3600 0    50   ~ 6
UPC3
Text Label 4400 3700 0    50   ~ 6
~AINDEX
Text Label 4400 3800 0    50   ~ 6
~SKIP
Text Label 4400 3900 0    50   ~ 6
IR11
Text Label 4400 4000 0    50   ~ 6
IR12
Text Label 4400 4100 0    50   ~ 6
IR13
Text Label 4400 4200 0    50   ~ 6
IR14
Text Label 4400 4300 0    50   ~ 6
IR15
Text Label 4400 4400 0    50   ~ 6
FL
Text Label 4400 4500 0    50   ~ 6
FV
Text Label 4400 4600 0    50   ~ 6
~IRQSUC
Text Label 4400 4700 0    50   ~ 6
~RSTHOLD
Text Label 4400 4800 0    50   ~ 6
µCB0
Text Label 4400 4900 0    50   ~ 6
UCB1
Text Label 4400 5000 0    50   ~ 6
UCB2
Text Label 4400 5100 0    50   ~ 6
UCB3
$Comp
L Device:R_Pack04 RN?
U 1 1 5DF0D4A9
P 6200 3500
AR Path="/5DF0D4A9" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5DF0D4A9" Ref="RN1703"  Part="1" 
F 0 "RN1703" V 5783 3500 50  0000 C CNN
F 1 "30Ω" V 5874 3500 50  0000 C CNN
F 2 "" V 6475 3500 50  0001 C CNN
F 3 "~" H 6200 3500 50  0001 C CNN
	1    6200 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5DF0D4AF
P 6200 3900
AR Path="/5DF0D4AF" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5DF0D4AF" Ref="RN1706"  Part="1" 
F 0 "RN1706" V 6433 3900 50  0000 C CNN
F 1 "30Ω" V 6524 3900 50  0000 C CNN
F 2 "" V 6475 3900 50  0001 C CNN
F 3 "~" H 6200 3900 50  0001 C CNN
	1    6200 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 3300 6750 3300
Wire Wire Line
	6400 3400 6750 3400
Wire Wire Line
	6400 3500 6750 3500
Wire Wire Line
	6400 3600 6750 3600
Wire Wire Line
	6400 3700 6750 3700
Wire Wire Line
	6400 3800 6750 3800
Wire Wire Line
	6400 3900 6750 3900
Wire Wire Line
	6400 4000 6750 4000
$Comp
L alexios:29F040 U1706
U 1 1 5DF13364
P 7950 4150
F 0 "U1706" H 7925 5267 50  0000 C CNN
F 1 "29F040" H 7925 5176 50  0000 C CNN
F 2 "" H 7950 4150 50  0001 C CNN
F 3 "" H 7950 4150 50  0001 C CNN
	1    7950 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3300 6950 3300
Wire Wire Line
	7300 3400 6950 3400
Wire Wire Line
	7300 3500 6950 3500
Wire Wire Line
	7300 3600 6950 3600
Wire Wire Line
	7300 3700 6950 3700
Wire Wire Line
	7300 3800 6950 3800
Wire Wire Line
	7300 3900 6950 3900
Wire Wire Line
	7300 4000 6950 4000
Wire Wire Line
	7300 4100 6950 4100
Wire Wire Line
	7300 4200 6950 4200
Wire Wire Line
	7300 4300 6950 4300
Wire Wire Line
	7300 4400 6950 4400
Wire Wire Line
	7300 4500 6950 4500
Wire Wire Line
	7300 4600 6950 4600
Wire Wire Line
	7300 4700 6950 4700
Wire Wire Line
	7300 4800 6950 4800
Wire Wire Line
	7300 4900 6950 4900
Wire Wire Line
	7300 5000 6950 5000
Wire Wire Line
	7300 5100 6950 5100
Text Label 6950 3300 0    50   ~ 6
UPC0
Text Label 6950 3400 0    50   ~ 6
UPC1
Text Label 6950 3500 0    50   ~ 6
UPC2
Text Label 6950 3600 0    50   ~ 6
UPC3
Text Label 6950 3700 0    50   ~ 6
~AINDEX
Text Label 6950 3800 0    50   ~ 6
~SKIP
Text Label 6950 3900 0    50   ~ 6
IR11
Text Label 6950 4000 0    50   ~ 6
IR12
Text Label 6950 4100 0    50   ~ 6
IR13
Text Label 6950 4200 0    50   ~ 6
IR14
Text Label 6950 4300 0    50   ~ 6
IR15
Text Label 6950 4400 0    50   ~ 6
FL
Text Label 6950 4500 0    50   ~ 6
FV
Text Label 6950 4600 0    50   ~ 6
~IRQSUC
Text Label 6950 4700 0    50   ~ 6
~RSTHOLD
Text Label 6950 4800 0    50   ~ 6
µCB0
Text Label 6950 4900 0    50   ~ 6
UCB1
Text Label 6950 5000 0    50   ~ 6
UCB2
Text Label 6950 5100 0    50   ~ 6
UCB3
$Comp
L Device:R_Pack04 RN?
U 1 1 5DF13390
P 8750 3500
AR Path="/5DF13390" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5DF13390" Ref="RN1704"  Part="1" 
F 0 "RN1704" V 8333 3500 50  0000 C CNN
F 1 "30Ω" V 8424 3500 50  0000 C CNN
F 2 "" V 9025 3500 50  0001 C CNN
F 3 "~" H 8750 3500 50  0001 C CNN
	1    8750 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5DF13396
P 8750 3900
AR Path="/5DF13396" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5DF13396" Ref="RN1707"  Part="1" 
F 0 "RN1707" V 8983 3900 50  0000 C CNN
F 1 "30Ω" V 9074 3900 50  0000 C CNN
F 2 "" V 9025 3900 50  0001 C CNN
F 3 "~" H 8750 3900 50  0001 C CNN
	1    8750 3900
	0    1    1    0   
$EndComp
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
	8950 3800 9300 3800
Wire Wire Line
	8950 3900 9300 3900
Wire Wire Line
	8950 4000 9300 4000
Text Label 4200 3300 2    50   ~ 6
RUNIT0
Text Label 4200 3400 2    50   ~ 6
RUNIT1
Text Label 4200 3500 2    50   ~ 6
RUNIT2
Text Label 4200 3600 2    50   ~ 6
RUNIT3
Text Label 4200 3700 2    50   ~ 6
WUNIT0
Text Label 4200 3800 2    50   ~ 6
WUNIT1
Text Label 4200 3900 2    50   ~ 6
WUNIT2
Text Label 4200 4000 2    50   ~ 6
OPIF0
Text Label 6750 3300 2    50   ~ 6
OPIF1
Text Label 6750 3400 2    50   ~ 6
OPIF2
Text Label 6750 3500 2    50   ~ 6
OPIF3
Text Label 6750 3600 2    50   ~ 6
~CPL
Text Label 6750 3700 2    50   ~ 6
~CLL
Text Label 6750 3800 2    50   ~ 6
~STI
Text Label 6750 3900 2    50   ~ 6
~CLI
Text Label 6750 4000 2    50   ~ 6
~INCPC
Text Label 9300 3300 2    50   ~ 6
~STPDR
Text Label 9300 3400 2    50   ~ 6
STPAC
Text Label 9300 3500 2    50   ~ 6
~DEC
Text Label 9300 3600 2    50   ~ 6
~MEM
Text Label 9300 3700 2    50   ~ 6
~IO
Text Label 9300 3800 2    50   ~ 6
~R
Text Label 9300 3900 2    50   ~ 6
~WEN
Text Label 9300 4000 2    50   ~ 6
~END
Wire Wire Line
	10100 2800 9800 2800
Wire Wire Line
	10100 2900 9800 2900
Wire Wire Line
	10100 3000 9800 3000
Wire Wire Line
	10100 3100 9800 3100
Wire Wire Line
	10100 3450 9800 3450
Wire Wire Line
	10100 3550 9800 3550
Wire Wire Line
	10100 3650 9800 3650
Wire Wire Line
	10100 4000 9800 4000
Text Label 9800 2800 0    50   ~ 6
RUNIT0
Text Label 9800 2900 0    50   ~ 6
RUNIT1
Text Label 9800 3000 0    50   ~ 6
RUNIT2
Text Label 9800 3100 0    50   ~ 6
RUNIT3
Text Label 9800 3450 0    50   ~ 6
WUNIT0
Text Label 9800 3550 0    50   ~ 6
WUNIT1
Text Label 9800 3650 0    50   ~ 6
WUNIT2
Text Label 9800 4000 0    50   ~ 6
OPIF0
Wire Wire Line
	10100 4100 9800 4100
Wire Wire Line
	10100 4200 9800 4200
Wire Wire Line
	10100 4300 9800 4300
Wire Wire Line
	10700 4550 9800 4550
Wire Wire Line
	10700 4650 9800 4650
Wire Wire Line
	10700 4900 9800 4900
Wire Wire Line
	10700 5000 9800 5000
Wire Wire Line
	10700 5250 9800 5250
Text Label 9800 4100 0    50   ~ 6
OPIF1
Text Label 9800 4200 0    50   ~ 6
OPIF2
Text Label 9800 4300 0    50   ~ 6
OPIF3
Text Label 9800 4550 0    50   ~ 6
~CPL
Text Label 9800 4650 0    50   ~ 6
~CLL
Text Label 9800 4900 0    50   ~ 6
~STI
Text Label 9800 5000 0    50   ~ 6
~CLI
Text Label 9800 5250 0    50   ~ 6
~INCPC
Wire Wire Line
	10700 5350 9800 5350
Wire Wire Line
	10700 5450 9800 5450
Wire Wire Line
	10700 5550 9800 5550
Wire Wire Line
	10700 5800 9800 5800
Wire Wire Line
	10700 5900 9800 5900
Wire Wire Line
	10700 6000 9800 6000
Wire Wire Line
	10700 6100 9800 6100
Wire Wire Line
	10700 6200 9800 6200
Text Label 9800 5350 0    50   ~ 6
~STPDR
Text Label 9800 5450 0    50   ~ 6
STPAC
Text Label 9800 5550 0    50   ~ 6
~DEC
Text Label 9800 5800 0    50   ~ 6
~MEM
Text Label 9800 5900 0    50   ~ 6
~IO
Text Label 9800 6000 0    50   ~ 6
~R
Text Label 9800 6100 0    50   ~ 6
~WEN
Text Label 9800 6200 0    50   ~ 6
~END
Wire Wire Line
	3050 5500 3150 5500
$Comp
L power:+5V #PWR01703
U 1 1 5DF89A86
P 3150 5500
F 0 "#PWR01703" H 3150 5350 50  0001 C CNN
F 1 "+5V" H 3165 5673 50  0000 C CNN
F 2 "" H 3150 5500 50  0001 C CNN
F 3 "" H 3150 5500 50  0001 C CNN
	1    3150 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01705
U 1 1 5DF917BE
P 5700 5500
F 0 "#PWR01705" H 5700 5350 50  0001 C CNN
F 1 "+5V" H 5715 5673 50  0000 C CNN
F 2 "" H 5700 5500 50  0001 C CNN
F 3 "" H 5700 5500 50  0001 C CNN
	1    5700 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5500 5700 5500
$Comp
L power:+5V #PWR01707
U 1 1 5DF98A23
P 8250 5500
F 0 "#PWR01707" H 8250 5350 50  0001 C CNN
F 1 "+5V" H 8265 5673 50  0000 C CNN
F 2 "" H 8250 5500 50  0001 C CNN
F 3 "" H 8250 5500 50  0001 C CNN
	1    8250 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5500 8250 5500
$Comp
L power:GND #PWR01702
U 1 1 5DFC3605
P 2750 5500
F 0 "#PWR01702" H 2750 5250 50  0001 C CNN
F 1 "GND" H 2755 5327 50  0000 C CNN
F 2 "" H 2750 5500 50  0001 C CNN
F 3 "" H 2750 5500 50  0001 C CNN
	1    2750 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01704
U 1 1 5DFC39A3
P 5300 5500
F 0 "#PWR01704" H 5300 5250 50  0001 C CNN
F 1 "GND" H 5305 5327 50  0000 C CNN
F 2 "" H 5300 5500 50  0001 C CNN
F 3 "" H 5300 5500 50  0001 C CNN
	1    5300 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01706
U 1 1 5DFC3CEF
P 7850 5500
F 0 "#PWR01706" H 7850 5250 50  0001 C CNN
F 1 "GND" H 7855 5327 50  0000 C CNN
F 2 "" H 7850 5500 50  0001 C CNN
F 3 "" H 7850 5500 50  0001 C CNN
	1    7850 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 5800 8000 5500
Wire Wire Line
	2900 5500 2900 5800
Wire Wire Line
	5450 5500 5450 5800
Text Label 5550 5800 0    50   ~ 6
~µCE
Text Label 8150 5800 0    50   ~ 6
~µCE
Text HLabel 10700 4550 2    50   3State ~ 6
~CPL
Text HLabel 10700 4650 2    50   3State ~ 6
~CLL
Text HLabel 10700 4900 2    50   3State ~ 6
~STI
Text HLabel 10700 5000 2    50   3State ~ 6
~CLI
Text HLabel 10700 5250 2    50   3State ~ 6
~INCPC
Text HLabel 10700 5350 2    50   3State ~ 6
~STPDR
Text HLabel 10700 5450 2    50   3State ~ 6
~STPAC
Text HLabel 10700 5550 2    50   3State ~ 6
~DEC
Text HLabel 10700 5800 2    50   3State ~ 6
~MEM
Text HLabel 10700 5900 2    50   3State ~ 6
~IO
Text HLabel 10700 6000 2    50   3State ~ 6
~R
Text HLabel 10700 6100 2    50   3State ~ 6
~WEN
Text HLabel 10700 6200 2    50   3State ~ 6
~END
Text Notes 9700 2800 3    100  ~ 20
Microcode Control Vector (24 bits)
Text Notes 1800 3050 3    100  ~ 20
Microcode Address (19 bits)
Wire Wire Line
	9450 5800 9450 2250
Text Label 9450 4450 1    50   ~ 6
~µCE
Text Label 3000 5800 0    50   ~ 6
~µCE
Text Notes 2750 4950 0    100  ~ 20
µ01
Text Notes 5350 4950 0    100  ~ 20
µ02
Text Notes 7900 4950 0    100  ~ 20
µ03
Wire Wire Line
	950  3950 1500 3950
Wire Wire Line
	950  4050 1500 4050
Wire Wire Line
	1250 3350 1500 3350
Wire Wire Line
	1250 3450 1500 3450
Wire Wire Line
	1250 3550 1500 3550
Wire Wire Line
	1250 3650 1500 3650
Wire Wire Line
	1250 3750 1500 3750
Wire Wire Line
	950  4200 1500 4200
Wire Wire Line
	950  4300 1500 4300
Wire Wire Line
	950  4500 1500 4500
Wire Wire Line
	950  4600 1500 4600
Wire Wire Line
	1250 5100 1500 5100
Wire Wire Line
	1250 5200 1500 5200
Wire Wire Line
	1250 5300 1500 5300
Wire Wire Line
	1250 5400 1500 5400
Text Label 1500 3950 2    50   ~ 6
~AINDEX
Text Label 1500 4050 2    50   ~ 6
~SKIP
Text Label 1500 3350 2    50   ~ 6
IR11
Text Label 1500 3450 2    50   ~ 6
IR12
Text Label 1500 3550 2    50   ~ 6
IR13
Text Label 1500 3650 2    50   ~ 6
IR14
Text Label 1500 3750 2    50   ~ 6
IR15
Text Label 1500 4200 2    50   ~ 6
FL
Text Label 1500 4300 2    50   ~ 6
FV
Text Label 1500 4500 2    50   ~ 6
~IRQSUC
Text Label 1500 4600 2    50   ~ 6
~RSTHOLD
Text Label 1500 5100 2    50   ~ 6
µCB0
Text Label 1500 5200 2    50   ~ 6
UCB1
Text Label 1500 5300 2    50   ~ 6
UCB2
Text Label 1500 5400 2    50   ~ 6
UCB3
Text HLabel 950  3950 0    50   Input ~ 6
~AINDEX
Text HLabel 950  4050 0    50   Input ~ 6
~SKIP
Entry Wire Line
	1150 3250 1250 3350
Entry Wire Line
	1150 3350 1250 3450
Entry Wire Line
	1150 3450 1250 3550
Entry Wire Line
	1150 3550 1250 3650
Entry Wire Line
	1150 3650 1250 3750
Entry Wire Line
	1150 5000 1250 5100
Entry Wire Line
	1150 5100 1250 5200
Entry Wire Line
	1150 5200 1250 5300
Entry Wire Line
	1150 5300 1250 5400
Text HLabel 950  4200 0    50   Input ~ 6
FL
Text HLabel 950  4300 0    50   Input ~ 6
FV
Text HLabel 950  4500 0    50   Input ~ 6
~IRQSUC
Text HLabel 950  4600 0    50   Input ~ 6
~RSTHOLD
Entry Bus Bus
	1050 3100 1150 3200
Wire Bus Line
	1050 3100 950  3100
Text HLabel 950  3100 0    50   Input ~ 6
IR[11..15]
Entry Bus Bus
	1050 4800 1150 4900
Wire Bus Line
	950  4800 1050 4800
Text HLabel 950  4800 0    50   Input ~ 6
µCB[0..3]
Wire Wire Line
	5450 5800 8000 5800
Wire Wire Line
	2900 5800 5450 5800
Connection ~ 5450 5800
Connection ~ 8000 5800
Wire Wire Line
	8000 5800 9450 5800
Wire Wire Line
	3300 2250 9450 2250
Text Notes 3300 5650 0    50   ~ 6
Microcode ROMs are wired as a 512K×24 bit\ntable, so all address lines are the same but\ndata out lines differ.
$Comp
L alexios:29F040 U1704
U 2 1 5E27BF69
P 2800 8150
F 0 "U1704" H 2980 8946 50  0000 L CNN
F 1 "29F040" H 2980 8855 50  0000 L CNN
F 2 "" H 2800 8150 50  0001 C CNN
F 3 "" H 2800 8150 50  0001 C CNN
	2    2800 8150
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U1705
U 2 1 5E27CAD5
P 4600 8150
F 0 "U1705" H 4780 8946 50  0000 L CNN
F 1 "29F040" H 4780 8855 50  0000 L CNN
F 2 "" H 4600 8150 50  0001 C CNN
F 3 "" H 4600 8150 50  0001 C CNN
	2    4600 8150
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U1706
U 2 1 5E27E30A
P 6400 8150
F 0 "U1706" H 6580 8946 50  0000 L CNN
F 1 "29F040" H 6580 8855 50  0000 L CNN
F 2 "" H 6400 8150 50  0001 C CNN
F 3 "" H 6400 8150 50  0001 C CNN
	2    6400 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 7300 2350 7300
Connection ~ 2350 7300
Wire Wire Line
	2450 7500 2350 7500
Connection ~ 2350 7500
$Comp
L Device:C_Small C?
U 1 1 5E29A8D3
P 4150 7400
AR Path="/5CC0D65F/5E29A8D3" Ref="C?"  Part="1" 
AR Path="/5E29A8D3" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E29A8D3" Ref="C1707"  Part="1" 
F 0 "C1707" H 4059 7446 50  0000 R CNN
F 1 "100nF" H 4059 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4150 7400 50  0001 C CNN
F 3 "~" H 4150 7400 50  0001 C CNN
	1    4150 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 7300 4150 7300
Connection ~ 4150 7300
Wire Wire Line
	4150 7300 3750 7300
Wire Wire Line
	4250 7500 4150 7500
Connection ~ 4150 7500
Wire Wire Line
	4150 7500 3750 7500
$Comp
L Device:C_Small C?
U 1 1 5E29A8DF
P 3750 7400
AR Path="/5CC0D65F/5E29A8DF" Ref="C?"  Part="1" 
AR Path="/5E29A8DF" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E29A8DF" Ref="C1706"  Part="1" 
F 0 "C1706" H 3659 7446 50  0000 R CNN
F 1 "1µF" H 3659 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3750 7400 50  0001 C CNN
F 3 "~" H 3750 7400 50  0001 C CNN
	1    3750 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E2A66A2
P 5950 7400
AR Path="/5CC0D65F/5E2A66A2" Ref="C?"  Part="1" 
AR Path="/5E2A66A2" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E2A66A2" Ref="C1709"  Part="1" 
F 0 "C1709" H 5859 7446 50  0000 R CNN
F 1 "100nF" H 5859 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5950 7400 50  0001 C CNN
F 3 "~" H 5950 7400 50  0001 C CNN
	1    5950 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 7300 5950 7300
Connection ~ 5950 7300
Wire Wire Line
	5950 7300 5550 7300
Wire Wire Line
	6050 7500 5950 7500
Connection ~ 5950 7500
Wire Wire Line
	5950 7500 5550 7500
$Comp
L Device:C_Small C?
U 1 1 5E2A66AE
P 5550 7400
AR Path="/5CC0D65F/5E2A66AE" Ref="C?"  Part="1" 
AR Path="/5E2A66AE" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E2A66AE" Ref="C1708"  Part="1" 
F 0 "C1708" H 5459 7446 50  0000 R CNN
F 1 "1µF" H 5459 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5550 7400 50  0001 C CNN
F 3 "~" H 5550 7400 50  0001 C CNN
	1    5550 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01717
U 1 1 5E2B4AFE
P 2450 7500
F 0 "#PWR01717" H 2450 7250 50  0001 C CNN
F 1 "GND" H 2455 7327 50  0000 C CNN
F 2 "" H 2450 7500 50  0001 C CNN
F 3 "" H 2450 7500 50  0001 C CNN
	1    2450 7500
	1    0    0    -1  
$EndComp
Connection ~ 2450 7500
$Comp
L power:GND #PWR01718
U 1 1 5E2B50FE
P 4250 7500
F 0 "#PWR01718" H 4250 7250 50  0001 C CNN
F 1 "GND" H 4255 7327 50  0000 C CNN
F 2 "" H 4250 7500 50  0001 C CNN
F 3 "" H 4250 7500 50  0001 C CNN
	1    4250 7500
	1    0    0    -1  
$EndComp
Connection ~ 4250 7500
$Comp
L power:GND #PWR01719
U 1 1 5E2B52C8
P 6050 7500
F 0 "#PWR01719" H 6050 7250 50  0001 C CNN
F 1 "GND" H 6055 7327 50  0000 C CNN
F 2 "" H 6050 7500 50  0001 C CNN
F 3 "" H 6050 7500 50  0001 C CNN
	1    6050 7500
	1    0    0    -1  
$EndComp
Connection ~ 6050 7500
$Comp
L power:+5V #PWR01714
U 1 1 5E2D6764
P 2450 7300
F 0 "#PWR01714" H 2450 7150 50  0001 C CNN
F 1 "+5V" H 2465 7473 50  0000 C CNN
F 2 "" H 2450 7300 50  0001 C CNN
F 3 "" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
Connection ~ 2450 7300
$Comp
L power:+5V #PWR01715
U 1 1 5E2D6AC6
P 4250 7300
F 0 "#PWR01715" H 4250 7150 50  0001 C CNN
F 1 "+5V" H 4265 7473 50  0000 C CNN
F 2 "" H 4250 7300 50  0001 C CNN
F 3 "" H 4250 7300 50  0001 C CNN
	1    4250 7300
	1    0    0    -1  
$EndComp
Connection ~ 4250 7300
$Comp
L power:+5V #PWR01716
U 1 1 5E2D6C2E
P 6050 7300
F 0 "#PWR01716" H 6050 7150 50  0001 C CNN
F 1 "+5V" H 6065 7473 50  0000 C CNN
F 2 "" H 6050 7300 50  0001 C CNN
F 3 "" H 6050 7300 50  0001 C CNN
	1    6050 7300
	1    0    0    -1  
$EndComp
Connection ~ 6050 7300
$Comp
L Device:C_Small C?
U 1 1 5E280D31
P 2350 7400
AR Path="/5CC0D65F/5E280D31" Ref="C?"  Part="1" 
AR Path="/5E280D31" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E280D31" Ref="C1705"  Part="1" 
F 0 "C1705" H 2259 7446 50  0000 R CNN
F 1 "100nF" H 2259 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 7400 50  0001 C CNN
F 3 "~" H 2350 7400 50  0001 C CNN
	1    2350 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 7500 1950 7500
Wire Wire Line
	2350 7300 1950 7300
$Comp
L Device:C_Small C?
U 1 1 5E296BAE
P 1950 7400
AR Path="/5CC0D65F/5E296BAE" Ref="C?"  Part="1" 
AR Path="/5E296BAE" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E296BAE" Ref="C1704"  Part="1" 
F 0 "C1704" H 1859 7446 50  0000 R CNN
F 1 "1µF" H 1859 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1950 7400 50  0001 C CNN
F 3 "~" H 1950 7400 50  0001 C CNN
	1    1950 7400
	1    0    0    -1  
$EndComp
Entry Wire Line
	10100 2800 10200 2700
Entry Wire Line
	10100 2900 10200 2800
Entry Wire Line
	10100 3000 10200 2900
Entry Wire Line
	10100 3100 10200 3000
Entry Wire Line
	10100 3450 10200 3350
Entry Wire Line
	10100 3550 10200 3450
Entry Wire Line
	10100 3650 10200 3550
Entry Wire Line
	10100 4000 10200 3900
Entry Wire Line
	10100 4100 10200 4000
Entry Wire Line
	10100 4200 10200 4100
Entry Wire Line
	10100 4300 10200 4200
Entry Bus Bus
	10200 2650 10300 2550
Entry Bus Bus
	10200 3300 10300 3200
Entry Bus Bus
	10200 3850 10300 3750
Text Label 10700 3750 2    50   ~ 6
OPIF[0..3]
Text Label 10700 3200 2    50   ~ 6
WUNIT[0..2]
Text Label 10700 2550 2    50   ~ 6
RUNIT[0..3]
Wire Bus Line
	10300 3750 10700 3750
Wire Bus Line
	10300 3200 10700 3200
Wire Bus Line
	10300 2550 10700 2550
Text HLabel 10700 2550 2    50   Output ~ 6
RUNIT[0..3]
Text HLabel 10700 3200 2    50   Output ~ 6
WUNIT[0..2]
Text HLabel 10700 3750 2    50   Output ~ 6
OPIF[0..3]
Connection ~ 9450 2250
Wire Wire Line
	9450 2250 10700 2250
Wire Bus Line
	6250 1550 10700 1550
Text Notes 6000 2800 2    100  ~ 20
Microcode Store
Text Notes 3900 850  2    100  ~ 20
Microprogram Counter (µPC)
Wire Bus Line
	10200 3300 10200 3550
Wire Bus Line
	6150 1000 6150 1450
Wire Bus Line
	10200 3850 10200 4200
Wire Bus Line
	10200 2650 10200 3000
Wire Bus Line
	1150 4900 1150 5300
Wire Bus Line
	1150 3200 1150 3650
$EndSCHEMATC
