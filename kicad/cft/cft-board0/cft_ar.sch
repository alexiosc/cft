EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 17
Title "24-bit Address Register (AR)"
Date ""
Rev "2023"
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 "reg_ar.v"
$EndDescr
$Comp
L alexios:74HC574 U?
U 1 1 5CC2001C
P 4150 1750
AR Path="/5CC0D65F/5CC2001C" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC2001C" Ref="U402"  Part="1" 
F 0 "U402" H 4150 2517 50  0000 C CNN
F 1 "74HC574" H 4150 2426 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4150 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4150 1750 50  0001 C CNN
	1    4150 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2900 4850 2900
Wire Wire Line
	4650 3000 4850 3000
Wire Wire Line
	4650 3100 4850 3100
Wire Wire Line
	4650 3200 4850 3200
Wire Wire Line
	4650 3300 4850 3300
Wire Wire Line
	4650 3400 4850 3400
Wire Wire Line
	4650 3500 4850 3500
Wire Wire Line
	4650 3600 4850 3600
Text Label 4650 2900 0    50   ~ 0
AR8
Text Label 4650 3000 0    50   ~ 0
AR9
Text Label 4650 3100 0    50   ~ 0
AR10
Text Label 4650 3200 0    50   ~ 0
AR11
Text Label 4650 3300 0    50   ~ 0
AR12
Text Label 4650 3400 0    50   ~ 0
AR13
Text Label 4650 3500 0    50   ~ 0
AR14
Text Label 4650 3600 0    50   ~ 0
AR15
Wire Wire Line
	5050 2900 5250 2900
Wire Wire Line
	5050 3000 5250 3000
Wire Wire Line
	5050 3100 5250 3100
Wire Wire Line
	5050 3200 5250 3200
Wire Wire Line
	5050 3300 5250 3300
Wire Wire Line
	5050 3400 5250 3400
Wire Wire Line
	5050 3500 5250 3500
Wire Wire Line
	5050 3600 5250 3600
$Comp
L power:GND #PWR?
U 1 1 5CC2008A
P 3650 3900
AR Path="/5CC0D65F/5CC2008A" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5CC2008A" Ref="#PWR0408"  Part="1" 
F 0 "#PWR0408" H 3650 3650 50  0001 C CNN
F 1 "GND" H 3655 3727 50  0000 C CNN
F 2 "" H 3650 3900 50  0001 C CNN
F 3 "" H 3650 3900 50  0001 C CNN
	1    3650 3900
	1    0    0    -1  
$EndComp
Text Label 5250 2900 2    50   ~ 0
AR8
Text Label 5250 3000 2    50   ~ 0
AR9
Text Label 5250 3100 2    50   ~ 0
AR10
Text Label 5250 3200 2    50   ~ 0
AR11
Text Label 5250 3300 2    50   ~ 0
AR12
Text Label 5250 3400 2    50   ~ 0
AR13
Text Label 5250 3500 2    50   ~ 0
AR14
Text Label 5250 3600 2    50   ~ 0
AR15
Wire Wire Line
	6250 2900 6500 2900
Wire Wire Line
	6250 3000 6500 3000
Wire Wire Line
	6250 3100 6500 3100
Wire Wire Line
	6250 3200 6500 3200
Wire Wire Line
	6250 3300 6500 3300
Wire Wire Line
	6250 3400 6500 3400
Wire Wire Line
	6250 3500 6500 3500
Wire Wire Line
	6250 3600 6500 3600
Wire Wire Line
	3300 2900 3650 2900
Wire Wire Line
	3300 3000 3650 3000
Wire Wire Line
	3300 3100 3650 3100
Wire Wire Line
	3300 3200 3650 3200
Wire Wire Line
	3300 3300 3650 3300
Wire Wire Line
	3300 3400 3650 3400
Wire Wire Line
	3300 3500 3650 3500
Wire Wire Line
	3300 3600 3650 3600
Text Label 3650 2900 2    50   ~ 0
IBUS8
Text Label 3650 3000 2    50   ~ 0
IBUS9
Text Label 3650 3100 2    50   ~ 0
IBUS10
Text Label 3650 3200 2    50   ~ 0
IBUS11
Text Label 3650 3300 2    50   ~ 0
IBUS12
Text Label 3650 3400 2    50   ~ 0
IBUS13
Text Label 3650 3500 2    50   ~ 0
IBUS14
Text Label 3650 3600 2    50   ~ 0
IBUS15
Entry Wire Line
	3200 1250 3300 1350
Entry Wire Line
	3200 1350 3300 1450
Entry Wire Line
	3200 1450 3300 1550
Entry Wire Line
	3200 1550 3300 1650
Entry Wire Line
	3200 1650 3300 1750
Entry Wire Line
	3200 1750 3300 1850
Entry Wire Line
	3200 1150 3300 1250
Entry Wire Line
	3200 2900 3300 3000
Entry Wire Line
	3200 3000 3300 3100
Entry Wire Line
	3200 3100 3300 3200
Entry Wire Line
	3200 3200 3300 3300
Entry Wire Line
	3200 3300 3300 3400
Entry Wire Line
	3200 3400 3300 3500
Entry Wire Line
	3200 2800 3300 2900
Entry Wire Line
	3200 3500 3300 3600
Entry Wire Line
	3200 1850 3300 1950
Wire Wire Line
	1450 2200 1000 2200
Text Label 1100 2300 0    50   ~ 0
~IO
Wire Wire Line
	5250 2150 4600 2150
Text Label 5250 2150 2    50   ~ 0
~ABEN1
Text Label 5250 3800 2    50   ~ 0
~ABEN1
Wire Wire Line
	4600 3800 4600 4200
Wire Wire Line
	4600 4200 2750 4200
Wire Wire Line
	4600 3800 5250 3800
Wire Wire Line
	4600 2150 4600 2500
Wire Wire Line
	4600 2500 2750 2500
Connection ~ 2750 2500
Wire Wire Line
	2750 2500 2400 2500
Text Label 2500 2500 0    50   ~ 0
~ABEN1
Wire Bus Line
	6700 6000 10150 6000
Entry Wire Line
	6500 1250 6600 1350
Entry Wire Line
	6500 1350 6600 1450
Entry Wire Line
	6500 1450 6600 1550
Entry Wire Line
	6500 1550 6600 1650
Entry Wire Line
	6500 1650 6600 1750
Entry Wire Line
	6500 1750 6600 1850
Entry Wire Line
	6500 1850 6600 1950
Entry Wire Line
	6500 1950 6600 2050
Entry Wire Line
	6500 2900 6600 3000
Entry Wire Line
	6500 3000 6600 3100
Entry Wire Line
	6500 3100 6600 3200
Entry Wire Line
	6500 3200 6600 3300
Entry Wire Line
	6500 3300 6600 3400
Entry Wire Line
	6500 3400 6600 3500
Entry Wire Line
	6500 3500 6600 3600
Entry Wire Line
	6500 3600 6600 3700
Text Label 6250 2900 0    50   ~ 0
AB8
Text Label 6250 3000 0    50   ~ 0
AB9
Text Label 6250 3100 0    50   ~ 0
AB10
Text Label 6250 3200 0    50   ~ 0
AB11
Text Label 6250 3300 0    50   ~ 0
AB12
Text Label 6250 3400 0    50   ~ 0
AB13
Text Label 6250 3500 0    50   ~ 0
AB14
Text Label 6250 3600 0    50   ~ 0
AB15
Text HLabel 1000 2200 0    50   3State ~ 0
~MEM
Text HLabel 1000 2300 0    50   3State ~ 0
~IO
Text HLabel 10150 6000 2    50   Output ~ 0
AB[0..23]
Text HLabel 1000 950  0    50   3State ~ 0
IBUS[0..15]
Wire Bus Line
	1000 950  3100 950 
Entry Bus Bus
	3100 950  3200 1050
Wire Wire Line
	3650 2150 2850 2150
Wire Wire Line
	2850 3800 3650 3800
Wire Wire Line
	2850 1750 1000 1750
Text Label 1100 1750 0    50   ~ 0
~WRITE-AR
Text Label 1100 2200 0    50   ~ 0
~MEM
Text HLabel 1000 1750 0    50   Input ~ 0
~WRITE-AR
Text Label 3300 2150 0    50   ~ 0
~WRITE-AR
Text Label 3250 3800 0    50   ~ 0
~WRITE-AR
Text Label 4050 2500 0    50   ~ 0
~ABEN1
Text Label 4050 4200 0    50   ~ 0
~ABEN1
Entry Bus Bus
	6600 5900 6700 6000
Text Label 6900 6000 0    50   ~ 0
AB[0..23]
Text Label 6600 2750 1    50   ~ 0
AB[0..15]
Text Label 4950 2750 1    50   ~ 0
AR[0..15]
Text Label 2750 3350 1    50   ~ 0
~ABEN1
Text Label 2850 3350 1    50   ~ 0
~WRITE-AR
Text Label 1100 950  0    50   ~ 0
IBUS[0..15]
Text Label 3200 2900 1    50   ~ 0
IBUS[0..15]
$Comp
L alexios:74HC574 U?
U 1 1 5CC20022
P 4150 3400
AR Path="/5CC0D65F/5CC20022" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC20022" Ref="U406"  Part="1" 
F 0 "U406" H 4150 4150 50  0000 C CNN
F 1 "74HC574" H 4150 4050 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4150 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4150 3400 50  0001 C CNN
	1    4150 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D1B3A7C
P 3650 5600
AR Path="/5CC0D65F/5D1B3A7C" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D1B3A7C" Ref="#PWR0411"  Part="1" 
F 0 "#PWR0411" H 3650 5350 50  0001 C CNN
F 1 "GND" H 3655 5427 50  0000 C CNN
F 2 "" H 3650 5600 50  0001 C CNN
F 3 "" H 3650 5600 50  0001 C CNN
	1    3650 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4600 6500 4600
Wire Wire Line
	6250 4700 6500 4700
Wire Wire Line
	6250 4800 6500 4800
Wire Wire Line
	6250 4900 6500 4900
Wire Wire Line
	6250 5000 6500 5000
Wire Wire Line
	6250 5100 6500 5100
Wire Wire Line
	6250 5200 6500 5200
Wire Wire Line
	6250 5300 6500 5300
Wire Wire Line
	3150 4600 3650 4600
Wire Wire Line
	3150 4700 3650 4700
Wire Wire Line
	3150 4800 3650 4800
Wire Wire Line
	3150 4900 3650 4900
Wire Wire Line
	3150 5000 3650 5000
Wire Wire Line
	3150 5100 3650 5100
Wire Wire Line
	3150 5200 3650 5200
Wire Wire Line
	3150 5300 3650 5300
Entry Wire Line
	3050 4600 3150 4700
Entry Wire Line
	3050 4700 3150 4800
Entry Wire Line
	3050 4800 3150 4900
Entry Wire Line
	3050 4900 3150 5000
Entry Wire Line
	3050 5000 3150 5100
Entry Wire Line
	3050 5100 3150 5200
Entry Wire Line
	3050 4500 3150 4600
Entry Wire Line
	3050 5200 3150 5300
Text Label 5250 5500 2    50   ~ 0
~ABEN1
Wire Wire Line
	4600 5500 4600 5900
Wire Wire Line
	4600 5900 2750 5900
Wire Wire Line
	4600 5500 5250 5500
Entry Wire Line
	6500 4600 6600 4700
Entry Wire Line
	6500 4700 6600 4800
Entry Wire Line
	6500 4800 6600 4900
Entry Wire Line
	6500 4900 6600 5000
Entry Wire Line
	6500 5000 6600 5100
Entry Wire Line
	6500 5100 6600 5200
Entry Wire Line
	6500 5200 6600 5300
Entry Wire Line
	6500 5300 6600 5400
Wire Wire Line
	2850 5500 3650 5500
Text Label 3250 5500 0    50   ~ 0
~WRITE-AR
Text Label 4050 5900 0    50   ~ 0
~ABEN1
Text Label 6600 4350 1    50   ~ 0
AB[0..15]
Text Label 4950 4350 1    50   ~ 0
AR[0..15]
Text Label 3650 4600 2    50   ~ 0
AEXT0
Text Label 3650 4700 2    50   ~ 0
AEXT1
Text Label 3650 4800 2    50   ~ 0
AEXT2
Text Label 3650 4900 2    50   ~ 0
AEXT3
Text Label 3650 5000 2    50   ~ 0
AEXT4
Text Label 3650 5100 2    50   ~ 0
AEXT5
Text Label 3650 5200 2    50   ~ 0
AEXT6
Text Label 3650 5300 2    50   ~ 0
AEXT7
Entry Bus Bus
	2950 1500 3050 1600
Wire Bus Line
	2950 1500 1000 1500
Wire Wire Line
	2850 3800 2850 5500
Connection ~ 2850 3800
Wire Wire Line
	2750 4200 2750 5900
Connection ~ 2750 4200
Wire Wire Line
	2750 2500 2750 4200
Wire Wire Line
	2850 2150 2850 3800
Text HLabel 1000 1500 0    50   Input ~ 0
AEXT[0..7]
Wire Wire Line
	5250 4600 5050 4600
Wire Wire Line
	5250 4700 5050 4700
Wire Wire Line
	5250 4800 5050 4800
Wire Wire Line
	5250 4900 5050 4900
Wire Wire Line
	5250 5000 5050 5000
Wire Wire Line
	5250 5100 5050 5100
Wire Wire Line
	5250 5200 5050 5200
Wire Wire Line
	5250 5300 5050 5300
Text Label 5250 4600 2    50   ~ 0
AR16
Text Label 5250 4700 2    50   ~ 0
AR17
Text Label 5250 4800 2    50   ~ 0
AR18
Text Label 5250 4900 2    50   ~ 0
AR19
Text Label 5250 5000 2    50   ~ 0
AR20
Text Label 5250 5100 2    50   ~ 0
AR21
Text Label 5250 5200 2    50   ~ 0
AR22
Text Label 5250 5300 2    50   ~ 0
AR23
Text Label 6250 4600 0    50   ~ 0
AB16
Text Label 6250 4700 0    50   ~ 0
AB17
Text Label 6250 4800 0    50   ~ 0
AB18
Text Label 6250 4900 0    50   ~ 0
AB19
Text Label 6250 5000 0    50   ~ 0
AB20
Text Label 6250 5100 0    50   ~ 0
AB21
Text Label 6250 5200 0    50   ~ 0
AB22
Text Label 6250 5300 0    50   ~ 0
AB23
Text Label 1100 1500 0    50   ~ 0
AEXT[0..7]
Text Notes 6750 4200 0    50   ~ 0
2019 Design Update: the AR is now 24 bits wide. It reads its least significant\n16 bits from the IBUS. The most significant 8 bits come from the AEXT bus,\nwhich is driven by one of the eight MBx memory bank registers.
$Comp
L alexios:74HC541 U?
U 2 1 5D344130
P 1250 7400
AR Path="/5CC0D65F/5D344130" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D344130" Ref="U403"  Part="2" 
F 0 "U403" H 1430 7446 50  0000 L CNN
F 1 "74HC541" H 1430 7355 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 1250 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 1250 7400 50  0001 C CNN
	2    1250 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D344136
P 2650 6750
AR Path="/5CC0D65F/5D344136" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D344136" Ref="U406"  Part="2" 
F 0 "U406" H 2830 6796 50  0000 L CNN
F 1 "74HC574" H 2830 6705 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2650 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2650 6750 50  0001 C CNN
	2    2650 6750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D34413C
P 1250 6750
AR Path="/5CC0D65F/5D34413C" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D34413C" Ref="U402"  Part="2" 
F 0 "U402" H 1430 6796 50  0000 L CNN
F 1 "74HC574" H 1430 6705 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 1250 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1250 6750 50  0001 C CNN
	2    1250 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D344142
P 900 6750
AR Path="/5CC0D65F/5D344142" Ref="C?"  Part="1" 
AR Path="/5D344142" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D344142" Ref="C402"  Part="1" 
F 0 "C402" H 809 6796 50  0000 R CNN
F 1 "100nF" H 809 6705 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 6750 50  0001 C CNN
F 3 "~" H 900 6750 50  0001 C CNN
	1    900  6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D344148
P 900 6850
AR Path="/5D344148" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D344148" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344148" Ref="#PWR0418"  Part="1" 
F 0 "#PWR0418" H 900 6600 50  0001 C CNN
F 1 "GND" H 905 6677 50  0000 C CNN
F 2 "" H 900 6850 50  0001 C CNN
F 3 "" H 900 6850 50  0001 C CNN
	1    900  6850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D34414E
P 2300 6750
AR Path="/5CC0D65F/5D34414E" Ref="C?"  Part="1" 
AR Path="/5D34414E" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D34414E" Ref="C406"  Part="1" 
F 0 "C406" H 2209 6796 50  0000 R CNN
F 1 "100nF" H 2209 6705 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 6750 50  0001 C CNN
F 3 "~" H 2300 6750 50  0001 C CNN
	1    2300 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D344154
P 2300 6850
AR Path="/5D344154" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D344154" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344154" Ref="#PWR0419"  Part="1" 
F 0 "#PWR0419" H 2300 6600 50  0001 C CNN
F 1 "GND" H 2305 6677 50  0000 C CNN
F 2 "" H 2300 6850 50  0001 C CNN
F 3 "" H 2300 6850 50  0001 C CNN
	1    2300 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D34415A
P 900 7400
AR Path="/5CC0D65F/5D34415A" Ref="C?"  Part="1" 
AR Path="/5D34415A" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D34415A" Ref="C403"  Part="1" 
F 0 "C403" H 809 7446 50  0000 R CNN
F 1 "100nF" H 809 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 7400 50  0001 C CNN
F 3 "~" H 900 7400 50  0001 C CNN
	1    900  7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D344160
P 900 7500
AR Path="/5D344160" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D344160" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344160" Ref="#PWR0425"  Part="1" 
F 0 "#PWR0425" H 900 7250 50  0001 C CNN
F 1 "GND" H 905 7327 50  0000 C CNN
F 2 "" H 900 7500 50  0001 C CNN
F 3 "" H 900 7500 50  0001 C CNN
	1    900  7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D344166
P 2300 7400
AR Path="/5CC0D65F/5D344166" Ref="C?"  Part="1" 
AR Path="/5D344166" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D344166" Ref="C407"  Part="1" 
F 0 "C407" H 2209 7446 50  0000 R CNN
F 1 "100nF" H 2209 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7400 50  0001 C CNN
F 3 "~" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D34416C
P 2300 7500
AR Path="/5D34416C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D34416C" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D34416C" Ref="#PWR0426"  Part="1" 
F 0 "#PWR0426" H 2300 7250 50  0001 C CNN
F 1 "GND" H 2305 7327 50  0000 C CNN
F 2 "" H 2300 7500 50  0001 C CNN
F 3 "" H 2300 7500 50  0001 C CNN
	1    2300 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D344172
P 900 6650
AR Path="/5CC0D65F/5D344172" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344172" Ref="#PWR0415"  Part="1" 
F 0 "#PWR0415" H 900 6500 50  0001 C CNN
F 1 "+5V" H 915 6823 50  0000 C CNN
F 2 "" H 900 6650 50  0001 C CNN
F 3 "" H 900 6650 50  0001 C CNN
	1    900  6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D344178
P 2300 6650
AR Path="/5CC0D65F/5D344178" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344178" Ref="#PWR0416"  Part="1" 
F 0 "#PWR0416" H 2300 6500 50  0001 C CNN
F 1 "+5V" H 2315 6823 50  0000 C CNN
F 2 "" H 2300 6650 50  0001 C CNN
F 3 "" H 2300 6650 50  0001 C CNN
	1    2300 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D34417E
P 900 7300
AR Path="/5CC0D65F/5D34417E" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D34417E" Ref="#PWR0421"  Part="1" 
F 0 "#PWR0421" H 900 7150 50  0001 C CNN
F 1 "+5V" H 915 7473 50  0000 C CNN
F 2 "" H 900 7300 50  0001 C CNN
F 3 "" H 900 7300 50  0001 C CNN
	1    900  7300
	1    0    0    -1  
$EndComp
Connection ~ 2300 6850
Connection ~ 2300 6650
Connection ~ 900  7500
Connection ~ 900  7300
$Comp
L power:+5V #PWR?
U 1 1 5D344188
P 2300 7300
AR Path="/5CC0D65F/5D344188" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344188" Ref="#PWR0422"  Part="1" 
F 0 "#PWR0422" H 2300 7150 50  0001 C CNN
F 1 "+5V" H 2315 7473 50  0000 C CNN
F 2 "" H 2300 7300 50  0001 C CNN
F 3 "" H 2300 7300 50  0001 C CNN
	1    2300 7300
	1    0    0    -1  
$EndComp
Connection ~ 2300 7300
Connection ~ 2300 7500
$Comp
L alexios:74HC541 U?
U 2 1 5D344190
P 2650 7400
AR Path="/5CC0D65F/5D344190" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D344190" Ref="U407"  Part="2" 
F 0 "U407" H 2830 7446 50  0000 L CNN
F 1 "74HC541" H 2830 7355 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2650 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 2650 7400 50  0001 C CNN
	2    2650 7400
	1    0    0    -1  
$EndComp
Connection ~ 900  6850
Connection ~ 900  6650
$Comp
L alexios:74HC574 U?
U 2 1 5D344198
P 4050 6750
AR Path="/5CC0D65F/5D344198" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D344198" Ref="U408"  Part="2" 
F 0 "U408" H 4230 6796 50  0000 L CNN
F 1 "74HC574" H 4230 6705 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4050 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4050 6750 50  0001 C CNN
	2    4050 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D34419E
P 3700 6750
AR Path="/5CC0D65F/5D34419E" Ref="C?"  Part="1" 
AR Path="/5D34419E" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D34419E" Ref="C408"  Part="1" 
F 0 "C408" H 3609 6796 50  0000 R CNN
F 1 "100nF" H 3609 6705 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3700 6750 50  0001 C CNN
F 3 "~" H 3700 6750 50  0001 C CNN
	1    3700 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D3441A4
P 3700 6850
AR Path="/5D3441A4" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D3441A4" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D3441A4" Ref="#PWR0420"  Part="1" 
F 0 "#PWR0420" H 3700 6600 50  0001 C CNN
F 1 "GND" H 3705 6677 50  0000 C CNN
F 2 "" H 3700 6850 50  0001 C CNN
F 3 "" H 3700 6850 50  0001 C CNN
	1    3700 6850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D3441AA
P 3700 6650
AR Path="/5CC0D65F/5D3441AA" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D3441AA" Ref="#PWR0417"  Part="1" 
F 0 "#PWR0417" H 3700 6500 50  0001 C CNN
F 1 "+5V" H 3715 6823 50  0000 C CNN
F 2 "" H 3700 6650 50  0001 C CNN
F 3 "" H 3700 6650 50  0001 C CNN
	1    3700 6650
	1    0    0    -1  
$EndComp
Connection ~ 3700 6850
Connection ~ 3700 6650
$Comp
L Device:C_Small C?
U 1 1 5D3441B2
P 3700 7400
AR Path="/5CC0D65F/5D3441B2" Ref="C?"  Part="1" 
AR Path="/5D3441B2" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D3441B2" Ref="C409"  Part="1" 
F 0 "C409" H 3609 7446 50  0000 R CNN
F 1 "100nF" H 3609 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3700 7400 50  0001 C CNN
F 3 "~" H 3700 7400 50  0001 C CNN
	1    3700 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D3441B8
P 3700 7500
AR Path="/5D3441B8" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D3441B8" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D3441B8" Ref="#PWR0427"  Part="1" 
F 0 "#PWR0427" H 3700 7250 50  0001 C CNN
F 1 "GND" H 3705 7327 50  0000 C CNN
F 2 "" H 3700 7500 50  0001 C CNN
F 3 "" H 3700 7500 50  0001 C CNN
	1    3700 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D3441BE
P 3700 7300
AR Path="/5CC0D65F/5D3441BE" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D3441BE" Ref="#PWR0423"  Part="1" 
F 0 "#PWR0423" H 3700 7150 50  0001 C CNN
F 1 "+5V" H 3715 7473 50  0000 C CNN
F 2 "" H 3700 7300 50  0001 C CNN
F 3 "" H 3700 7300 50  0001 C CNN
	1    3700 7300
	1    0    0    -1  
$EndComp
Connection ~ 3700 7300
Connection ~ 3700 7500
$Comp
L alexios:74HC541 U?
U 2 1 5D3441C6
P 4050 7400
AR Path="/5CC0D65F/5D3441C6" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D3441C6" Ref="U409"  Part="2" 
F 0 "U409" H 4230 7446 50  0000 L CNN
F 1 "74HC541" H 4230 7355 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4050 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 4050 7400 50  0001 C CNN
	2    4050 7400
	1    0    0    -1  
$EndComp
Text Notes 6750 3900 0    63   ~ 13
2019 Design Update
Wire Notes Line
	11050 6350 2950 6350
Wire Notes Line
	2950 6350 2950 4250
Wire Notes Line
	2950 4250 11050 4250
Wire Notes Line
	11050 4250 11050 6350
$Comp
L alexios:74HC138 U?
U 1 1 5DF054FC
P 8200 1500
AR Path="/5DF054FC" Ref="U?"  Part="1" 
AR Path="/5CD91C88/5DF054FC" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5DF054FC" Ref="U401"  Part="1" 
F 0 "U401" H 8200 2167 50  0000 C CNN
F 1 "74HC138" H 8200 2076 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 8200 1500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H 8200 1500 50  0001 C CNN
F 4 "Yes" H 8200 1500 50  0001 C CNN "Verified"
	1    8200 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 1100 7000 1100
Wire Wire Line
	7700 1200 7000 1200
Wire Wire Line
	7700 1300 7000 1300
Text Label 7700 1100 2    50   ~ 0
AR8
Text Label 7700 1200 2    50   ~ 0
AR9
Text Label 7700 1300 2    50   ~ 0
AR10
Entry Wire Line
	6900 1000 7000 1100
Entry Wire Line
	6900 1100 7000 1200
Entry Wire Line
	6900 1200 7000 1300
Text Label 7250 1100 2    50   ~ 0
AR8
Text Label 7250 1200 2    50   ~ 0
AR9
Text Label 7250 1300 2    50   ~ 0
AR10
Wire Wire Line
	8700 1100 9050 1100
Wire Wire Line
	8700 1200 9050 1200
Wire Wire Line
	8700 1300 9050 1300
Wire Wire Line
	8700 1400 9050 1400
Text HLabel 9050 1100 2    50   Output ~ 0
~SYSDEV
Text HLabel 9050 1200 2    50   Output ~ 0
~IODEV1XX
Text HLabel 9050 1300 2    50   Output ~ 0
~IODEV2XX
Text HLabel 9050 1400 2    50   Output ~ 0
~IODEV3XX
$Comp
L Device:C_Small C?
U 1 1 5DF0555B
P 9900 1300
AR Path="/5CC0D65F/5DF0555B" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5DF0555B" Ref="C?"  Part="1" 
AR Path="/5CD91C88/5DF0555B" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5DF0555B" Ref="C401"  Part="1" 
F 0 "C401" H 9809 1346 50  0000 R CNN
F 1 "100nF" H 9809 1255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9900 1300 50  0001 C CNN
F 3 "~" H 9900 1300 50  0001 C CNN
	1    9900 1300
	1    0    0    -1  
$EndComp
Text Label 5550 850  0    50   ~ 0
AR[8..15]
NoConn ~ 8700 1500
NoConn ~ 8700 1600
NoConn ~ 8700 1700
NoConn ~ 8700 1800
$Comp
L alexios:74HC138 U?
U 2 1 5DF05572
P 10250 1300
AR Path="/5DF05572" Ref="U?"  Part="1" 
AR Path="/5CD91C88/5DF05572" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5DF05572" Ref="U401"  Part="2" 
F 0 "U401" H 10430 1346 50  0000 L CNN
F 1 "74HC138" H 10430 1255 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 10250 1300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H 10250 1300 50  0001 C CNN
	2    10250 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DF05579
P 9900 1200
AR Path="/5DF05579" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5DF05579" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5DF05579" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5DF05579" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5DF05579" Ref="#PWR0401"  Part="1" 
F 0 "#PWR0401" H 9900 1050 50  0001 C CNN
F 1 "+5V" H 9915 1373 50  0000 C CNN
F 2 "" H 9900 1200 50  0001 C CNN
F 3 "" H 9900 1200 50  0001 C CNN
	1    9900 1200
	1    0    0    -1  
$EndComp
Connection ~ 9900 1200
$Comp
L power:GND #PWR?
U 1 1 5DF05581
P 9900 1400
AR Path="/5DF05581" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5DF05581" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5DF05581" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5DF05581" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5DF05581" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5DF05581" Ref="#PWR0402"  Part="1" 
F 0 "#PWR0402" H 9900 1150 50  0001 C CNN
F 1 "GND" H 9905 1227 50  0000 C CNN
F 2 "" H 9900 1400 50  0001 C CNN
F 3 "" H 9900 1400 50  0001 C CNN
	1    9900 1400
	1    0    0    -1  
$EndComp
Connection ~ 9900 1400
Entry Bus Bus
	6800 850  6900 950 
Entry Bus Bus
	4950 950  5050 850 
Wire Bus Line
	5050 850  6800 850 
Text Label 7500 1800 0    50   ~ 0
~IO
Wire Wire Line
	7650 1700 7700 1700
$Comp
L power:+5V #PWR?
U 1 1 5DF05502
P 7650 1650
AR Path="/5DF05502" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5DF05502" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5DF05502" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5DF05502" Ref="#PWR0403"  Part="1" 
F 0 "#PWR0403" H 7650 1500 50  0001 C CNN
F 1 "+5V" H 7700 1800 50  0000 R CNN
F 2 "" H 7650 1650 50  0001 C CNN
F 3 "" H 7650 1650 50  0001 C CNN
	1    7650 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1700 7650 1650
Text Notes 7300 2550 0    63   ~ 13
I/O Address Decoder
Text Notes 7900 2100 0    50   ~ 0
Decodes I/O addresses AR=0000'00nn'nnnn
Wire Notes Line
	6700 700  6700 2950
Wire Notes Line
	6700 2950 11050 2950
Wire Notes Line
	11050 2950 11050 700 
Wire Notes Line
	11050 700  6700 700 
Text Notes 7300 2800 0    50   ~ 0
The I/O address decoder simplifies building I/O devices by partially\ndecoding the most significant 8 bits of the I/O address.
Entry Wire Line
	4850 1950 4950 1850
Entry Wire Line
	4850 1850 4950 1750
Entry Wire Line
	4850 1750 4950 1650
Entry Wire Line
	4850 1650 4950 1550
Entry Wire Line
	4850 1550 4950 1450
Entry Wire Line
	4850 1450 4950 1350
Entry Wire Line
	4850 1350 4950 1250
Entry Wire Line
	4850 1250 4950 1150
Entry Wire Line
	5050 1950 4950 1850
Entry Wire Line
	5050 1850 4950 1750
Entry Wire Line
	5050 1750 4950 1650
Entry Wire Line
	5050 1650 4950 1550
Entry Wire Line
	5050 1550 4950 1450
Entry Wire Line
	5050 1450 4950 1350
Entry Wire Line
	5050 1350 4950 1250
Entry Wire Line
	5050 1250 4950 1150
Entry Wire Line
	4850 3600 4950 3500
Entry Wire Line
	4850 3500 4950 3400
Entry Wire Line
	4850 3400 4950 3300
Entry Wire Line
	4850 3300 4950 3200
Entry Wire Line
	4850 3200 4950 3100
Entry Wire Line
	4850 3100 4950 3000
Entry Wire Line
	4850 3000 4950 2900
Entry Wire Line
	4850 2900 4950 2800
Entry Wire Line
	5050 3600 4950 3500
Entry Wire Line
	5050 3500 4950 3400
Entry Wire Line
	5050 3400 4950 3300
Entry Wire Line
	5050 3300 4950 3200
Entry Wire Line
	5050 3200 4950 3100
Entry Wire Line
	5050 3100 4950 3000
Entry Wire Line
	5050 3000 4950 2900
Entry Wire Line
	5050 2900 4950 2800
Entry Wire Line
	4850 5300 4950 5200
Entry Wire Line
	4850 5200 4950 5100
Entry Wire Line
	4850 5100 4950 5000
Entry Wire Line
	4850 5000 4950 4900
Entry Wire Line
	4850 4900 4950 4800
Entry Wire Line
	4850 4800 4950 4700
Entry Wire Line
	4850 4700 4950 4600
Entry Wire Line
	4850 4600 4950 4500
Entry Wire Line
	5050 5300 4950 5200
Entry Wire Line
	5050 5200 4950 5100
Entry Wire Line
	5050 5100 4950 5000
Entry Wire Line
	5050 5000 4950 4900
Entry Wire Line
	5050 4900 4950 4800
Entry Wire Line
	5050 4800 4950 4700
Entry Wire Line
	5050 4700 4950 4600
Entry Wire Line
	5050 4600 4950 4500
$Comp
L alexios:74HC541 U?
U 1 1 5D1B3ABE
P 5750 5100
AR Path="/5CC0D65F/5D1B3ABE" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5D1B3ABE" Ref="U409"  Part="1" 
F 0 "U409" H 5750 5867 50  0000 C CNN
F 1 "74HC541" H 5750 5776 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5750 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 5750 5100 50  0001 C CNN
	1    5750 5100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5CC2011A
P 5750 3400
AR Path="/5CC0D65F/5CC2011A" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC2011A" Ref="U407"  Part="1" 
F 0 "U407" H 5750 4167 50  0000 C CNN
F 1 "74HC541" H 5750 4076 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5750 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 5750 3400 50  0001 C CNN
	1    5750 3400
	1    0    0    -1  
$EndComp
Text HLabel 7650 5550 0    50   Input ~ 0
~FPAEXT
Text HLabel 10150 5600 2    50   3State ~ 0
FPD[0..7]
Wire Wire Line
	7650 5550 8100 5550
Text Label 7800 5550 0    50   ~ 0
~FPAEXT
Wire Bus Line
	9650 5600 10150 5600
Text Label 9700 5600 0    50   ~ 0
FPD[0..7]
Entry Bus Bus
	9650 5600 9550 5500
Entry Wire Line
	9450 5350 9550 5450
Entry Wire Line
	9450 5250 9550 5350
Entry Wire Line
	9450 5150 9550 5250
Entry Wire Line
	9450 5050 9550 5150
Entry Wire Line
	9450 4950 9550 5050
Entry Wire Line
	9450 4850 9550 4950
Entry Wire Line
	9450 4750 9550 4850
Entry Wire Line
	9450 4650 9550 4750
Wire Wire Line
	9100 5350 9450 5350
Wire Wire Line
	9100 5250 9450 5250
Wire Wire Line
	9100 5150 9450 5150
Wire Wire Line
	9100 5050 9450 5050
Wire Wire Line
	9100 4950 9450 4950
Wire Wire Line
	9100 4850 9450 4850
Wire Wire Line
	9100 4750 9450 4750
Wire Wire Line
	9100 4650 9450 4650
Text Label 7800 5550 0    50   ~ 0
~FPAEXT
$Comp
L power:GND #PWR0412
U 1 1 65225A2F
P 8100 5650
F 0 "#PWR0412" H 8100 5400 50  0001 C CNN
F 1 "GND" H 8105 5477 50  0000 C CNN
F 2 "" H 8100 5650 50  0001 C CNN
F 3 "" H 8100 5650 50  0001 C CNN
	1    8100 5650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U410
U 1 1 65225A45
P 8600 5150
F 0 "U410" H 8600 5917 50  0000 C CNN
F 1 "74HC541" H 8600 5826 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8600 5150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8600 5150 50  0001 C CNN
	1    8600 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 4650 7900 4650
Wire Wire Line
	8100 4750 7900 4750
Wire Wire Line
	8100 4850 7900 4850
Wire Wire Line
	8100 4950 7900 4950
Wire Wire Line
	8100 5050 7900 5050
Wire Wire Line
	8100 5150 7900 5150
Wire Wire Line
	8100 5250 7900 5250
Wire Wire Line
	8100 5350 7900 5350
Text Label 8100 4650 2    50   ~ 0
AR16
Text Label 8100 4750 2    50   ~ 0
AR17
Text Label 8100 4850 2    50   ~ 0
AR18
Text Label 8100 4950 2    50   ~ 0
AR19
Text Label 8100 5050 2    50   ~ 0
AR20
Text Label 8100 5150 2    50   ~ 0
AR21
Text Label 8100 5250 2    50   ~ 0
AR22
Text Label 8100 5350 2    50   ~ 0
AR23
Entry Wire Line
	7900 5350 7800 5250
Entry Wire Line
	7900 5250 7800 5150
Entry Wire Line
	7900 5150 7800 5050
Entry Wire Line
	7900 5050 7800 4950
Entry Wire Line
	7900 4950 7800 4850
Entry Wire Line
	7900 4850 7800 4750
Entry Wire Line
	7900 4750 7800 4650
Entry Wire Line
	7900 4650 7800 4550
Text Label 9150 4650 0    50   ~ 0
FPD0
Text Label 9150 4750 0    50   ~ 0
FPD1
Text Label 9150 4850 0    50   ~ 0
FPD2
Text Label 9150 4950 0    50   ~ 0
FPD3
Text Label 9150 5050 0    50   ~ 0
FPD4
Text Label 9150 5150 0    50   ~ 0
FPD5
Text Label 9150 5250 0    50   ~ 0
FPD6
Text Label 9150 5350 0    50   ~ 0
FPD7
Wire Wire Line
	1300 2650 1000 2650
Wire Wire Line
	1300 2650 1300 2700
$Comp
L power:GND #PWR0407
U 1 1 5E75DBDE
P 1300 3200
F 0 "#PWR0407" H 1300 2950 50  0001 C CNN
F 1 "GND" H 1305 3027 50  0000 C CNN
F 2 "" H 1300 3200 50  0001 C CNN
F 3 "" H 1300 3200 50  0001 C CNN
	1    1300 3200
	1    0    0    -1  
$EndComp
Text HLabel 1000 2650 0    50   Input ~ 0
~T34
Text Label 1100 2650 0    50   ~ 0
~T34
$Comp
L power:GND #PWR?
U 1 1 5CC20084
P 3650 2250
AR Path="/5CC0D65F/5CC20084" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5CC20084" Ref="#PWR0405"  Part="1" 
F 0 "#PWR0405" H 3650 2000 50  0001 C CNN
F 1 "GND" H 3655 2077 50  0000 C CNN
F 2 "" H 3650 2250 50  0001 C CNN
F 3 "" H 3650 2250 50  0001 C CNN
	1    3650 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5CC20114
P 5750 1750
AR Path="/5CC0D65F/5CC20114" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC20114" Ref="U403"  Part="1" 
F 0 "U403" H 5750 2517 50  0000 C CNN
F 1 "74HC541" H 5750 2426 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5750 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 5750 1750 50  0001 C CNN
	1    5750 1750
	1    0    0    -1  
$EndComp
Text Label 5000 2250 0    50   ~ 0
~ABEN2
Text Label 5000 3900 0    50   ~ 0
~ABEN2
Text Label 5000 5600 0    50   ~ 0
~ABEN2
Wire Wire Line
	2650 3000 2650 2600
Wire Wire Line
	2650 2600 4700 2600
Wire Wire Line
	4700 2600 4700 2250
Wire Wire Line
	4700 2250 5250 2250
Wire Wire Line
	2650 3000 2650 4300
Wire Wire Line
	2650 4300 4700 4300
Wire Wire Line
	4700 4300 4700 3900
Wire Wire Line
	4700 3900 5250 3900
Connection ~ 2650 3000
Wire Wire Line
	2650 4300 2650 6000
Wire Wire Line
	2650 6000 4700 6000
Wire Wire Line
	4700 6000 4700 5600
Connection ~ 2650 4300
Text Label 2650 3350 1    50   ~ 0
~ABEN2
Text Label 7800 5050 1    50   ~ 0
AR[0..23]
$Comp
L Device:C_Small C?
U 1 1 5E40E32C
P 5150 7400
AR Path="/5CC0D65F/5E40E32C" Ref="C?"  Part="1" 
AR Path="/5E40E32C" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5E40E32C" Ref="C410"  Part="1" 
F 0 "C410" H 5059 7446 50  0000 R CNN
F 1 "100nF" H 5059 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5150 7400 50  0001 C CNN
F 3 "~" H 5150 7400 50  0001 C CNN
	1    5150 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E40E333
P 5150 7500
AR Path="/5E40E333" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5E40E333" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5E40E333" Ref="#PWR0428"  Part="1" 
F 0 "#PWR0428" H 5150 7250 50  0001 C CNN
F 1 "GND" H 5155 7327 50  0000 C CNN
F 2 "" H 5150 7500 50  0001 C CNN
F 3 "" H 5150 7500 50  0001 C CNN
	1    5150 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E40E339
P 5150 7300
AR Path="/5CC0D65F/5E40E339" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5E40E339" Ref="#PWR0424"  Part="1" 
F 0 "#PWR0424" H 5150 7150 50  0001 C CNN
F 1 "+5V" H 5165 7473 50  0000 C CNN
F 2 "" H 5150 7300 50  0001 C CNN
F 3 "" H 5150 7300 50  0001 C CNN
	1    5150 7300
	1    0    0    -1  
$EndComp
Connection ~ 5150 7300
Connection ~ 5150 7500
$Comp
L alexios:74HC541 U?
U 2 1 5E40E341
P 5500 7400
AR Path="/5CC0D65F/5E40E341" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5E40E341" Ref="U410"  Part="2" 
F 0 "U410" H 5680 7446 50  0000 L CNN
F 1 "74HC541" H 5680 7355 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5500 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 5500 7400 50  0001 C CNN
	2    5500 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G08 U?
U 1 1 5CC20189
P 1750 2250
AR Path="/5CC0D65F/5CC20189" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC20189" Ref="U404"  Part="1" 
F 0 "U404" H 1675 1983 50  0000 C CNN
F 1 "74LVC1G08" H 1675 2074 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1400 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1400 2250 50  0001 C CNN
	1    1750 2250
	1    0    0    1   
$EndComp
Text Label 4300 6000 2    50   ~ 0
~ABEN2
Wire Wire Line
	7500 1800 7700 1800
$Comp
L power:GND #PWR0404
U 1 1 5E93BF5B
P 7650 2000
F 0 "#PWR0404" H 7650 1750 50  0001 C CNN
F 1 "GND" H 7655 1827 50  0000 C CNN
F 2 "" H 7650 2000 50  0001 C CNN
F 3 "" H 7650 2000 50  0001 C CNN
	1    7650 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1900 7650 2000
Wire Wire Line
	7650 1900 7700 1900
Text Notes 650  4450 0    50   ~ 0
The CFT has no bus sharing features normally,\nand it uses slow ROMs, so it helps to drive the\nAB continuously (expect when HALTed).\n\nThese jumpers can set the AB tri-stating when\nnot in use, but the feature is highly\nexperimental.\n\nCurrently, the CPU only passes tests with the\ndefault configuration here.
$Comp
L alexios:74LVC1G32 U405
U 1 1 604BFBBC
P 2050 3000
F 0 "U405" H 2100 2825 50  0000 C CNN
F 1 "74LVC1G32" H 2100 2734 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2160 2980 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2160 2980 50  0001 C CNN
	1    2050 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 2950 1850 2950
Wire Wire Line
	2350 3000 2650 3000
Wire Wire Line
	1850 3050 1550 3050
Text Label 1550 3050 0    50   ~ 0
HALT
Wire Wire Line
	1550 3050 1550 3500
Wire Wire Line
	1550 3500 1000 3500
Text HLabel 1000 3500 0    50   Input ~ 0
HALT
Wire Wire Line
	1000 2300 1450 2300
$Comp
L power:GND #PWR0406
U 1 1 606299C6
P 2250 2750
F 0 "#PWR0406" H 2250 2500 50  0001 C CNN
F 1 "GND" H 2400 2700 50  0000 C CNN
F 2 "" H 2250 2750 50  0001 C CNN
F 3 "" H 2250 2750 50  0001 C CNN
	1    2250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2250 2250 2250
Wire Wire Line
	2850 1750 2850 2150
Connection ~ 2850 2150
Text Label 4050 2600 0    50   ~ 0
~ABEN2
$Comp
L alexios:74HC574 U?
U 1 1 5D1B3ACB
P 4150 5100
AR Path="/5CC0D65F/5D1B3ACB" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5D1B3ACB" Ref="U408"  Part="1" 
F 0 "U408" H 4150 5850 50  0000 C CNN
F 1 "74HC574" H 4150 5750 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4150 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4150 5100 50  0001 C CNN
	1    4150 5100
	1    0    0    -1  
$EndComp
Connection ~ 900  5350
Connection ~ 900  5550
$Comp
L power:+5V #PWR?
U 1 1 5E3EB605
P 900 5350
AR Path="/5CC0D65F/5E3EB605" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5E3EB605" Ref="#PWR0409"  Part="1" 
F 0 "#PWR0409" H 900 5200 50  0001 C CNN
F 1 "+5V" H 915 5523 50  0000 C CNN
F 2 "" H 900 5350 50  0001 C CNN
F 3 "" H 900 5350 50  0001 C CNN
	1    900  5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3EB5FF
P 900 5550
AR Path="/5E3EB5FF" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5E3EB5FF" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5E3EB5FF" Ref="#PWR0410"  Part="1" 
F 0 "#PWR0410" H 900 5300 50  0001 C CNN
F 1 "GND" H 905 5377 50  0000 C CNN
F 2 "" H 900 5550 50  0001 C CNN
F 3 "" H 900 5550 50  0001 C CNN
	1    900  5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E3EB5F8
P 900 5450
AR Path="/5CC0D65F/5E3EB5F8" Ref="C?"  Part="1" 
AR Path="/5E3EB5F8" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5E3EB5F8" Ref="C404"  Part="1" 
F 0 "C404" H 809 5496 50  0000 R CNN
F 1 "100nF" H 809 5405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 5450 50  0001 C CNN
F 3 "~" H 900 5450 50  0001 C CNN
	1    900  5450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G08 U?
U 2 1 5E3EB456
P 1350 5350
AR Path="/5CC0D65F/5E3EB456" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5E3EB456" Ref="U404"  Part="2" 
F 0 "U404" H 1430 5296 50  0000 L CNN
F 1 "74LVC1G08" H 1430 5205 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1000 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1000 5350 50  0001 C CNN
	2    1350 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 604EA909
P 900 6100
AR Path="/5CC0D65F/604EA909" Ref="C?"  Part="1" 
AR Path="/604EA909" Ref="C?"  Part="1" 
AR Path="/5CC06F10/604EA909" Ref="C405"  Part="1" 
F 0 "C405" H 809 6146 50  0000 R CNN
F 1 "100nF" H 809 6055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 6100 50  0001 C CNN
F 3 "~" H 900 6100 50  0001 C CNN
	1    900  6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604EA90F
P 900 6200
AR Path="/604EA90F" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/604EA90F" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/604EA90F" Ref="#PWR0414"  Part="1" 
F 0 "#PWR0414" H 900 5950 50  0001 C CNN
F 1 "GND" H 905 6027 50  0000 C CNN
F 2 "" H 900 6200 50  0001 C CNN
F 3 "" H 900 6200 50  0001 C CNN
	1    900  6200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 604EA915
P 900 6000
AR Path="/5CC0D65F/604EA915" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/604EA915" Ref="#PWR0413"  Part="1" 
F 0 "#PWR0413" H 900 5850 50  0001 C CNN
F 1 "+5V" H 915 6173 50  0000 C CNN
F 2 "" H 900 6000 50  0001 C CNN
F 3 "" H 900 6000 50  0001 C CNN
	1    900  6000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U405
U 2 1 60B11A4D
P 1300 5850
F 0 "U405" H 1430 5646 50  0000 L CNN
F 1 "74LVC1G32" H 1430 5555 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1410 5830 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1410 5830 50  0001 C CNN
	2    1300 5850
	1    0    0    -1  
$EndComp
Connection ~ 900  6200
Connection ~ 900  6000
$Comp
L alexios:Jumper_3_Bridged12 JP401
U 1 1 5EFE936C
P 2250 2500
F 0 "JP401" V 2250 2567 50  0000 L CNN
F 1 "Jumper_3_Bridged12" H 2250 2610 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 2250 2500 50  0001 C CNN
F 3 "~" H 2250 2500 50  0001 C CNN
	1    2250 2500
	0    -1   -1   0   
$EndComp
$Comp
L alexios:Jumper_3_Bridged12 JP402
U 1 1 5EFED9D4
P 1300 2950
F 0 "JP402" V 1300 3017 50  0000 L CNN
F 1 "Jumper_3_Bridged12" H 1300 3060 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 1300 2950 50  0001 C CNN
F 3 "~" H 1300 2950 50  0001 C CNN
	1    1300 2950
	0    -1   -1   0   
$EndComp
Wire Notes Line
	1400 1850 1400 2500
Wire Notes Line
	1400 2500 2000 2500
Wire Notes Line
	2000 2500 2000 1850
Wire Notes Line
	2000 1850 1400 1850
Text Notes 1450 2450 0    50   ~ 0
Optional
Wire Wire Line
	4700 5600 5250 5600
Wire Wire Line
	3300 1250 3650 1250
Wire Wire Line
	3300 1350 3650 1350
Wire Wire Line
	3300 1450 3650 1450
Wire Wire Line
	3300 1550 3650 1550
Wire Wire Line
	3300 1650 3650 1650
Wire Wire Line
	3300 1750 3650 1750
Wire Wire Line
	3300 1850 3650 1850
Wire Wire Line
	3300 1950 3650 1950
Text Label 3650 1250 2    50   ~ 0
IBUS0
Text Label 3650 1350 2    50   ~ 0
IBUS1
Text Label 3650 1450 2    50   ~ 0
IBUS2
Text Label 3650 1550 2    50   ~ 0
IBUS3
Text Label 3650 1650 2    50   ~ 0
IBUS4
Text Label 3650 1750 2    50   ~ 0
IBUS5
Text Label 3650 1850 2    50   ~ 0
IBUS6
Text Label 3650 1950 2    50   ~ 0
IBUS7
Wire Wire Line
	4650 1250 4850 1250
Wire Wire Line
	4650 1350 4850 1350
Wire Wire Line
	4650 1450 4850 1450
Wire Wire Line
	4650 1550 4850 1550
Wire Wire Line
	4650 1650 4850 1650
Wire Wire Line
	4650 1750 4850 1750
Wire Wire Line
	4650 1850 4850 1850
Wire Wire Line
	4650 1950 4850 1950
Text Label 4650 1250 0    50   ~ 0
AR0
Text Label 4650 1350 0    50   ~ 0
AR1
Text Label 4650 1450 0    50   ~ 0
AR2
Text Label 4650 1550 0    50   ~ 0
AR3
Text Label 4650 1650 0    50   ~ 0
AR4
Text Label 4650 1750 0    50   ~ 0
AR5
Text Label 4650 1850 0    50   ~ 0
AR6
Text Label 4650 1950 0    50   ~ 0
AR7
Wire Wire Line
	5050 1250 5250 1250
Wire Wire Line
	5050 1350 5250 1350
Wire Wire Line
	5050 1450 5250 1450
Wire Wire Line
	5050 1550 5250 1550
Wire Wire Line
	5050 1650 5250 1650
Wire Wire Line
	5050 1750 5250 1750
Wire Wire Line
	5050 1850 5250 1850
Wire Wire Line
	5050 1950 5250 1950
Text Label 5250 1250 2    50   ~ 0
AR0
Text Label 5250 1350 2    50   ~ 0
AR1
Text Label 5250 1450 2    50   ~ 0
AR2
Text Label 5250 1550 2    50   ~ 0
AR3
Text Label 5250 1650 2    50   ~ 0
AR4
Text Label 5250 1750 2    50   ~ 0
AR5
Text Label 5250 1850 2    50   ~ 0
AR6
Text Label 5250 1950 2    50   ~ 0
AR7
Wire Wire Line
	6250 1250 6500 1250
Wire Wire Line
	6250 1350 6500 1350
Wire Wire Line
	6250 1450 6500 1450
Wire Wire Line
	6250 1550 6500 1550
Wire Wire Line
	6250 1650 6500 1650
Wire Wire Line
	6250 1750 6500 1750
Wire Wire Line
	6250 1850 6500 1850
Wire Wire Line
	6250 1950 6500 1950
Text Label 6250 1250 0    50   ~ 0
AB0
Text Label 6250 1350 0    50   ~ 0
AB1
Text Label 6250 1450 0    50   ~ 0
AB2
Text Label 6250 1550 0    50   ~ 0
AB3
Text Label 6250 1650 0    50   ~ 0
AB4
Text Label 6250 1750 0    50   ~ 0
AB5
Text Label 6250 1850 0    50   ~ 0
AB6
Text Label 6250 1950 0    50   ~ 0
AB7
Wire Bus Line
	6900 950  6900 1200
Wire Bus Line
	7800 4550 7800 5250
Wire Bus Line
	9550 4750 9550 5500
Wire Bus Line
	3050 1600 3050 5200
Wire Bus Line
	3200 1050 3200 3500
Wire Bus Line
	6600 1350 6600 5900
Wire Bus Line
	4950 950  4950 5200
Text Label 4650 5300 0    50   ~ 0
AR23
Text Label 4650 5200 0    50   ~ 0
AR22
Text Label 4650 5100 0    50   ~ 0
AR21
Text Label 4650 5000 0    50   ~ 0
AR20
Text Label 4650 4900 0    50   ~ 0
AR19
Text Label 4650 4800 0    50   ~ 0
AR18
Text Label 4650 4700 0    50   ~ 0
AR17
Text Label 4650 4600 0    50   ~ 0
AR16
Wire Wire Line
	4650 5300 4850 5300
Wire Wire Line
	4650 5200 4850 5200
Wire Wire Line
	4650 5100 4850 5100
Wire Wire Line
	4650 5000 4850 5000
Wire Wire Line
	4650 4900 4850 4900
Wire Wire Line
	4650 4800 4850 4800
Wire Wire Line
	4650 4700 4850 4700
Wire Wire Line
	4650 4600 4850 4600
$EndSCHEMATC
