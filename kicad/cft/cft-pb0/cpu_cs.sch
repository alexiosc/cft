EESchema Schematic File Version 4
LIBS:cft-pb0-cache
LIBS:cft-card-blank-single-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 10
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
L power:+5V #PWR?
U 1 1 5E51C06B
P 1000 6550
AR Path="/5E4DDD44/5E51C06B" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C06B" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 1000 6400 50  0001 C CNN
F 1 "+5V" H 1015 6723 50  0000 C CNN
F 2 "" H 1000 6550 50  0001 C CNN
F 3 "" H 1000 6550 50  0001 C CNN
	1    1000 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E51C071
P 1000 6750
AR Path="/5E4DDD44/5E51C071" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C071" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 1000 6500 50  0001 C CNN
F 1 "GND" H 1005 6577 50  0000 C CNN
F 2 "" H 1000 6750 50  0001 C CNN
F 3 "" H 1000 6750 50  0001 C CNN
	1    1000 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E51C077
P 1000 6650
AR Path="/5CC0D65F/5E51C077" Ref="C?"  Part="1" 
AR Path="/5E51C077" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5E51C077" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5E51C077" Ref="C3"  Part="1" 
F 0 "C3" H 909 6696 50  0000 R CNN
F 1 "100nF" H 909 6605 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1000 6650 50  0001 C CNN
F 3 "~" H 1000 6650 50  0001 C CNN
	1    1000 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E51C095
P 1000 7350
AR Path="/5CC0D65F/5E51C095" Ref="C?"  Part="1" 
AR Path="/5E51C095" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5E51C095" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5E51C095" Ref="C4"  Part="1" 
F 0 "C4" H 909 7396 50  0000 R CNN
F 1 "100nF" H 909 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1000 7350 50  0001 C CNN
F 3 "~" H 1000 7350 50  0001 C CNN
	1    1000 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E51C09B
P 1000 7250
AR Path="/5E4DDD44/5E51C09B" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C09B" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 1000 7100 50  0001 C CNN
F 1 "+5V" H 1015 7423 50  0000 C CNN
F 2 "" H 1000 7250 50  0001 C CNN
F 3 "" H 1000 7250 50  0001 C CNN
	1    1000 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E51C0A2
P 1000 7450
AR Path="/5E4DDD44/5E51C0A2" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C0A2" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 1000 7200 50  0001 C CNN
F 1 "GND" H 1005 7277 50  0000 C CNN
F 2 "" H 1000 7450 50  0001 C CNN
F 3 "" H 1000 7450 50  0001 C CNN
	1    1000 7450
	1    0    0    -1  
$EndComp
Text Notes 7100 6950 0    197  ~ 39
Constant Store
Wire Wire Line
	3750 2400 2950 2400
Wire Wire Line
	3750 3000 2950 3000
Wire Wire Line
	3750 3100 2950 3100
Text Label 3000 3000 0    50   ~ 0
RADDR4
Text Label 3250 2400 2    50   ~ 0
RADDR3
Text Label 3000 3200 0    50   ~ 0
~RUEN
Entry Wire Line
	2850 2300 2950 2400
Entry Wire Line
	2850 2900 2950 3000
Entry Wire Line
	2850 3000 2950 3100
Entry Bus Bus
	2750 2150 2850 2250
Wire Wire Line
	2150 3200 3750 3200
Text HLabel 2150 3200 0    50   Input ~ 0
~RUEN
Text Label 2250 2150 0    50   ~ 0
RADDR[0..4]
Text HLabel 2150 2150 0    50   Input ~ 0
RADDR[0..4]
Wire Bus Line
	2750 2150 2150 2150
Text Notes 4300 3000 1    50   ~ 10
RADDR=110xx
$Comp
L alexios:74HC138 U?
U 1 1 5E56A57B
P 4250 2800
AR Path="/5DC89E19/5E56A57B" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5E56A57B" Ref="U1"  Part="1" 
F 0 "U1" H 4250 3467 50  0000 C CNN
F 1 "74HC138" H 4250 3376 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 4250 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4250 2800 50  0001 C CNN
	1    4250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2500 3750 2600
$Comp
L power:GND #PWR013
U 1 1 5E5D868B
P 3750 2650
F 0 "#PWR013" H 3750 2400 50  0001 C CNN
F 1 "GND" H 3755 2477 50  0000 C CNN
F 2 "" H 3750 2650 50  0001 C CNN
F 3 "" H 3750 2650 50  0001 C CNN
	1    3750 2650
	1    0    0    -1  
$EndComp
Connection ~ 3750 2600
Wire Wire Line
	3750 2600 3750 2650
Text Label 3300 3100 2    50   ~ 0
RADDR2
Wire Wire Line
	4750 2500 5450 2500
Text Label 4850 2500 0    50   ~ 0
~READ-CSx
Text Notes 5400 2600 2    50   ~ 0
RADDR=110XX
$Comp
L power:GND #PWR012
U 1 1 5E6189E2
P 3650 5250
F 0 "#PWR012" H 3650 5000 50  0001 C CNN
F 1 "GND" H 3655 5077 50  0000 C CNN
F 2 "" H 3650 5250 50  0001 C CNN
F 3 "" H 3650 5250 50  0001 C CNN
	1    3650 5250
	1    0    0    -1  
$EndComp
Text Label 3000 4550 0    50   ~ 0
RADDR1
Text Label 3000 5150 0    50   ~ 0
~RSTHOLD
Text HLabel 2150 5150 0    50   Input ~ 0
~RSTHOLD
Wire Wire Line
	5850 3650 5850 2400
Wire Wire Line
	5950 4350 5950 2500
Text Label 4850 3650 0    50   ~ 0
CONST0
Text Label 4850 4350 0    50   ~ 0
CONST1
Text Label 6450 2400 2    50   ~ 0
CONST0
Text Label 6450 2500 2    50   ~ 0
CONST1
Text Label 8050 4400 1    50   ~ 0
IBUS[0..15]
Text Label 7650 3900 0    50   ~ 0
IBUS15
Text Label 7650 3800 0    50   ~ 0
IBUS14
Text Label 7650 3700 0    50   ~ 0
IBUS13
Text Label 7650 3600 0    50   ~ 0
IBUS12
Text Label 7650 3500 0    50   ~ 0
IBUS11
Text Label 7650 3400 0    50   ~ 0
IBUS10
Text Label 7650 3300 0    50   ~ 0
IBUS9
Text Label 7650 3200 0    50   ~ 0
IBUS8
Entry Wire Line
	8050 3800 7950 3900
Entry Wire Line
	8050 3700 7950 3800
Entry Wire Line
	8050 3600 7950 3700
Entry Wire Line
	8050 3500 7950 3600
Wire Wire Line
	7950 3900 7600 3900
Wire Wire Line
	7950 3800 7600 3800
Wire Wire Line
	7950 3700 7600 3700
Wire Wire Line
	7600 3600 7950 3600
Entry Wire Line
	8050 3400 7950 3500
Entry Wire Line
	8050 3300 7950 3400
Entry Wire Line
	8050 3200 7950 3300
Entry Wire Line
	8050 3100 7950 3200
Wire Wire Line
	7950 3500 7600 3500
Wire Wire Line
	7950 3400 7600 3400
Wire Wire Line
	7950 3300 7600 3300
Wire Wire Line
	7600 3200 7950 3200
Text Label 7650 3100 0    50   ~ 0
IBUS7
Text Label 7650 3000 0    50   ~ 0
IBUS6
Text Label 7650 2900 0    50   ~ 0
IBUS5
Text Label 7650 2800 0    50   ~ 0
IBUS4
Text Label 7650 2700 0    50   ~ 0
IBUS3
Text Label 7650 2600 0    50   ~ 0
IBUS2
Text Label 7650 2500 0    50   ~ 0
IBUS1
Text Label 7650 2400 0    50   ~ 0
IBUS0
Entry Wire Line
	8050 3000 7950 3100
Entry Wire Line
	8050 2900 7950 3000
Entry Wire Line
	8050 2800 7950 2900
Entry Wire Line
	8050 2700 7950 2800
Wire Wire Line
	7950 3100 7600 3100
Wire Wire Line
	7950 3000 7600 3000
Wire Wire Line
	7950 2900 7600 2900
Wire Wire Line
	7600 2800 7950 2800
Entry Wire Line
	8050 2600 7950 2700
Entry Wire Line
	8050 2500 7950 2600
Entry Wire Line
	8050 2400 7950 2500
Entry Wire Line
	8050 2300 7950 2400
Wire Wire Line
	7950 2700 7600 2700
Wire Wire Line
	7950 2600 7600 2600
Wire Wire Line
	7950 2500 7600 2500
Wire Wire Line
	7600 2400 7950 2400
Entry Bus Bus
	8050 2100 8150 2000
Wire Bus Line
	8150 2000 8750 2000
Text Label 8250 2000 0    50   ~ 0
IBUS[0..15]
Text Label 5850 3150 1    50   ~ 0
CONST0
Text Label 5950 3150 1    50   ~ 0
CONST1
Entry Wire Line
	2850 4450 2950 4550
Entry Wire Line
	2850 3750 2950 3850
Text Label 3000 3850 0    50   ~ 0
RADDR0
Wire Wire Line
	2950 3850 3750 3850
Wire Wire Line
	2950 4550 3750 4550
Wire Wire Line
	4750 4350 5950 4350
Wire Wire Line
	4750 3650 5850 3650
$Comp
L alexios:74HC253 U2
U 1 1 5E691B7B
P 4250 4350
F 0 "U2" H 4250 5317 50  0000 C CNN
F 1 "74HC253" H 4250 5226 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 4550 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT253.pdf" H 4550 4950 50  0001 C CNN
	1    4250 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 5250 3650 5050
Wire Wire Line
	3750 4150 3650 4150
Wire Wire Line
	3750 4850 3650 4850
Connection ~ 3650 4850
Wire Wire Line
	3750 5050 3650 5050
Connection ~ 3650 5050
Wire Wire Line
	3650 5050 3650 4850
Wire Wire Line
	3750 3950 3750 3850
Connection ~ 3750 3850
Wire Wire Line
	3750 3650 3650 3650
Wire Wire Line
	3650 3650 3650 3750
Connection ~ 3650 4150
Wire Wire Line
	3750 3750 3650 3750
Connection ~ 3650 3750
Wire Wire Line
	3650 3750 3650 4150
Wire Wire Line
	3650 4150 3650 4350
Wire Wire Line
	3750 4650 3750 4550
Connection ~ 3750 4550
Wire Wire Line
	3750 4350 3650 4350
Connection ~ 3650 4350
Wire Wire Line
	3650 4350 3650 4450
Wire Wire Line
	3750 4450 3650 4450
Connection ~ 3650 4450
Wire Wire Line
	3650 4450 3650 4850
$Comp
L alexios:74HC138 U?
U 2 1 5E89BF6D
P 1350 6650
AR Path="/5DC89E19/5E89BF6D" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5E89BF6D" Ref="U1"  Part="2" 
F 0 "U1" H 1530 6696 50  0000 L CNN
F 1 "74HC138" H 1530 6605 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 1350 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1350 6650 50  0001 C CNN
	2    1350 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC253 U2
U 2 1 5E89C71E
P 1350 7950
F 0 "U2" H 1530 8596 50  0000 L CNN
F 1 "74HC253" H 1530 8505 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 1650 8550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT253.pdf" H 1650 8550 50  0001 C CNN
	2    1350 7950
	1    0    0    -1  
$EndComp
Connection ~ 1000 6550
Connection ~ 1000 6750
Connection ~ 1000 7250
Connection ~ 1000 7450
NoConn ~ 4750 2400
NoConn ~ 4750 2600
NoConn ~ 4750 2700
NoConn ~ 4750 2800
NoConn ~ 4750 2900
NoConn ~ 4750 3000
NoConn ~ 4750 3100
Text Notes 8750 3450 0    50   ~ 0
~RSTHOLD~\n\n    0\n    1\n    1\n    1\n    1\n    1\n    1\n    1\n    1
Text Notes 9150 3450 0    50   ~ 0
~RUEN~\n\n  X\n  1\n  0\n  0\n  0\n  0\n  0\n  0\n  0
Text Notes 9400 3450 0    50   ~ 0
RADDR\n\nXXXXX\nXXXXX\n0XXXX\n10XXX\n11000\n11001\n11010\n11011\n111XX
Text Notes 9750 3450 0    50   ~ 0
Output\n\n0000'0000'0000'0000\nHigh Impendance\nHigh Impendance\nHigh Impendance\n0000'0000'0000'0000\n0000'0000'0000'0001\n0000'0000'0000'0010\n0000'0000'0000'0011\nHigh Impendance
$Comp
L alexios:74LVC1G08 U3
U 1 1 5CF43FFC
P 5800 2050
F 0 "U3" H 5725 2317 50  0000 C CNN
F 1 "74LVC1G08" H 5725 2226 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 5450 2050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5450 2050 50  0001 C CNN
	1    5800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5150 3550 5150
Wire Wire Line
	3550 5150 3550 2000
Wire Wire Line
	3550 2000 5500 2000
Connection ~ 3550 5150
Wire Wire Line
	3550 5150 3750 5150
Wire Wire Line
	5450 2500 5450 2100
Wire Wire Line
	5450 2100 5500 2100
Wire Wire Line
	5950 2050 6050 2050
Wire Notes Line width 20 style solid
	8700 2500 10650 2500
Wire Notes Line width 20 style solid
	8700 3500 8700 2500
Wire Notes Line style solid
	8700 2700 10650 2700
Wire Notes Line width 20 style solid
	10650 3500 8700 3500
Wire Notes Line
	9700 2500 9700 3500
Wire Notes Line width 20 style solid
	10650 3500 10650 2500
Text HLabel 8750 2000 2    50   BiDi ~ 0
IBUS[0..15]
Text Label 4850 2000 0    50   ~ 0
~RSTHOLD
Text Notes 8700 5850 0    50   ~ 0
The constant store now needs to emit just three constants:\n0000, 0002 and 0003. We get 0001 for free because of the\ncombinational wiring. All of these are used as vector\naddresses, so it would be easy to change them to e.g.\n0000, 0001, 0008 and 0009 by moving the wiring around.\n\nJust like the previous design, the initial PC value (0000) is\nemitted while ~RSTHOLD~ is asserted. Getting this done\nis a little complicated and uses one extra chip compared\nto just using two separate '541 buffers, but it saves on PCB\ntraces.
Text Notes 8700 4800 0    63   ~ 13
2019 Design Update
$Comp
L Device:C_Small C?
U 1 1 5D1999EA
P 2450 7400
AR Path="/5CC0D65F/5D1999EA" Ref="C?"  Part="1" 
AR Path="/5D1999EA" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5D1999EA" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5D1999EA" Ref="C5"  Part="1" 
F 0 "C5" H 2359 7446 50  0000 R CNN
F 1 "100nF" H 2359 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2450 7400 50  0001 C CNN
F 3 "~" H 2450 7400 50  0001 C CNN
	1    2450 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D1999F0
P 2450 7300
AR Path="/5E4DDD44/5D1999F0" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D1999F0" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 2450 7150 50  0001 C CNN
F 1 "+5V" H 2465 7473 50  0000 C CNN
F 2 "" H 2450 7300 50  0001 C CNN
F 3 "" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D1999F6
P 2450 7500
AR Path="/5E4DDD44/5D1999F6" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D1999F6" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 2450 7250 50  0001 C CNN
F 1 "GND" H 2455 7327 50  0000 C CNN
F 2 "" H 2450 7500 50  0001 C CNN
F 3 "" H 2450 7500 50  0001 C CNN
	1    2450 7500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U3
U 2 1 5D1A8D36
P 2900 7300
F 0 "U3" H 2825 7567 50  0000 C CNN
F 1 "74LVC1G08" H 2825 7476 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 2550 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2550 7300 50  0001 C CNN
	2    2900 7300
	1    0    0    -1  
$EndComp
Connection ~ 2450 7500
Connection ~ 2450 7300
$Comp
L alexios:74ACT16244 U4
U 1 1 5D247268
P 7100 2900
F 0 "U4" H 7100 3667 50  0000 C CNN
F 1 "74ACT16244" H 7100 3576 50  0000 C CNN
F 2 "Housings_SSOP:SSOP-48_7.5x15.9mm_Pitch0.635mm" H 6975 3275 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/74ac16244.pdf" H 6975 3275 50  0001 C CNN
	1    7100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2600 6500 2600
Wire Wire Line
	6500 2600 6500 2700
Wire Wire Line
	6600 3100 6500 3100
Wire Wire Line
	6600 3000 6500 3000
Connection ~ 6500 3000
Wire Wire Line
	6500 3000 6500 3100
Wire Wire Line
	6600 2900 6500 2900
Connection ~ 6500 2900
Wire Wire Line
	6500 2900 6500 3000
Wire Wire Line
	6600 2800 6500 2800
Connection ~ 6500 2800
Wire Wire Line
	6500 2800 6500 2900
Wire Wire Line
	6600 2700 6500 2700
Connection ~ 6500 2700
Wire Wire Line
	6500 2700 6500 2800
Text Label 6450 2400 2    50   ~ 0
CONST0
Text Label 6450 2500 2    50   ~ 0
CONST1
$Comp
L power:GND #PWR014
U 1 1 5D259DA3
P 6500 3900
F 0 "#PWR014" H 6500 3650 50  0001 C CNN
F 1 "GND" H 6350 3900 50  0000 C CNN
F 2 "" H 6500 3900 50  0001 C CNN
F 3 "" H 6500 3900 50  0001 C CNN
	1    6500 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3200 6600 3200
Wire Wire Line
	6600 3300 6500 3300
Connection ~ 6500 3300
Wire Wire Line
	6500 3300 6500 3200
Wire Wire Line
	6600 3400 6500 3400
Connection ~ 6500 3400
Wire Wire Line
	6500 3400 6500 3300
Wire Wire Line
	6600 3500 6500 3500
Connection ~ 6500 3500
Wire Wire Line
	6500 3500 6500 3400
Wire Wire Line
	6600 3600 6500 3600
Connection ~ 6500 3600
Wire Wire Line
	6500 3600 6500 3500
Wire Wire Line
	6500 3700 6600 3700
Connection ~ 6500 3700
Wire Wire Line
	6500 3700 6500 3600
Wire Wire Line
	6600 3800 6500 3800
Connection ~ 6500 3800
Wire Wire Line
	6500 3800 6500 3700
Wire Wire Line
	6500 3900 6600 3900
Connection ~ 6500 3900
Wire Wire Line
	6500 3900 6500 3800
Wire Wire Line
	6500 3100 6500 3200
Connection ~ 6500 3100
Connection ~ 6500 3200
Wire Wire Line
	6600 4100 6500 4100
Text Label 6450 4100 2    50   ~ 0
~CSOE
Connection ~ 6500 4100
Wire Wire Line
	6050 4100 6500 4100
Wire Wire Line
	6500 4300 6600 4300
Wire Wire Line
	6500 4100 6500 4200
Wire Wire Line
	6600 4200 6500 4200
Connection ~ 6500 4200
Wire Wire Line
	6500 4200 6500 4300
Wire Wire Line
	6500 4300 6500 4400
Wire Wire Line
	6500 4400 6600 4400
Connection ~ 6500 4300
Connection ~ 6600 5000
Connection ~ 7600 5200
Connection ~ 7600 5000
Connection ~ 6600 5200
Connection ~ 7600 5300
Connection ~ 7600 6000
Connection ~ 7600 5800
Connection ~ 7600 6100
Connection ~ 6600 6100
Connection ~ 6600 5800
Connection ~ 6600 6000
Connection ~ 6600 5300
Wire Wire Line
	7600 6100 7600 6000
$Comp
L power:+5V #PWR?
U 1 1 5D29894C
P 7600 5800
AR Path="/5DEAC282/5D29894C" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D29894C" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D29894C" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D29894C" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D29894C" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 7600 5650 50  0001 C CNN
F 1 "+5V" H 7615 5973 50  0000 C CNN
F 2 "" H 7600 5800 50  0001 C CNN
F 3 "" H 7600 5800 50  0001 C CNN
	1    7600 5800
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D298952
P 7600 6100
AR Path="/5DEAC282/5D298952" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D298952" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D298952" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D298952" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D298952" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 7600 5850 50  0001 C CNN
F 1 "GND" H 7605 5927 50  0000 C CNN
F 2 "" H 7600 6100 50  0001 C CNN
F 3 "" H 7600 6100 50  0001 C CNN
	1    7600 6100
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D298958
P 7600 5900
AR Path="/5CC0D65F/5D298958" Ref="C?"  Part="1" 
AR Path="/5D298958" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D298958" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D298958" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D298958" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D298958" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5D298958" Ref="C10"  Part="1" 
F 0 "C10" H 7509 5946 50  0000 R CNN
F 1 "100nF" H 7509 5855 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7600 5900 50  0001 C CNN
F 3 "~" H 7600 5900 50  0001 C CNN
	1    7600 5900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6600 6100 6600 6000
$Comp
L power:+5V #PWR?
U 1 1 5D29895F
P 6600 5800
AR Path="/5DEAC282/5D29895F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D29895F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D29895F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D29895F" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D29895F" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 6600 5650 50  0001 C CNN
F 1 "+5V" H 6615 5973 50  0000 C CNN
F 2 "" H 6600 5800 50  0001 C CNN
F 3 "" H 6600 5800 50  0001 C CNN
	1    6600 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D298965
P 6600 6100
AR Path="/5DEAC282/5D298965" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D298965" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D298965" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D298965" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D298965" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 6600 5850 50  0001 C CNN
F 1 "GND" H 6605 5927 50  0000 C CNN
F 2 "" H 6600 6100 50  0001 C CNN
F 3 "" H 6600 6100 50  0001 C CNN
	1    6600 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D29896B
P 6600 5900
AR Path="/5CC0D65F/5D29896B" Ref="C?"  Part="1" 
AR Path="/5D29896B" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D29896B" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D29896B" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D29896B" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D29896B" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5D29896B" Ref="C8"  Part="1" 
F 0 "C8" H 6509 5946 50  0000 R CNN
F 1 "100nF" H 6509 5855 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6600 5900 50  0001 C CNN
F 3 "~" H 6600 5900 50  0001 C CNN
	1    6600 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 5300 7600 5200
$Comp
L power:+5V #PWR?
U 1 1 5D298972
P 7600 5000
AR Path="/5DEAC282/5D298972" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D298972" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D298972" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D298972" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D298972" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 7600 4850 50  0001 C CNN
F 1 "+5V" H 7615 5173 50  0000 C CNN
F 2 "" H 7600 5000 50  0001 C CNN
F 3 "" H 7600 5000 50  0001 C CNN
	1    7600 5000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D298978
P 7600 5300
AR Path="/5DEAC282/5D298978" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D298978" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D298978" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D298978" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D298978" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 7600 5050 50  0001 C CNN
F 1 "GND" H 7605 5127 50  0000 C CNN
F 2 "" H 7600 5300 50  0001 C CNN
F 3 "" H 7600 5300 50  0001 C CNN
	1    7600 5300
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D29897E
P 7600 5100
AR Path="/5CC0D65F/5D29897E" Ref="C?"  Part="1" 
AR Path="/5D29897E" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D29897E" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D29897E" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D29897E" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D29897E" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5D29897E" Ref="C9"  Part="1" 
F 0 "C9" H 7509 5146 50  0000 R CNN
F 1 "100nF" H 7509 5055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7600 5100 50  0001 C CNN
F 3 "~" H 7600 5100 50  0001 C CNN
	1    7600 5100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6600 5300 6600 5200
$Comp
L power:+5V #PWR?
U 1 1 5D298985
P 6600 5000
AR Path="/5DEAC282/5D298985" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D298985" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D298985" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D298985" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D298985" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 6600 4850 50  0001 C CNN
F 1 "+5V" H 6615 5173 50  0000 C CNN
F 2 "" H 6600 5000 50  0001 C CNN
F 3 "" H 6600 5000 50  0001 C CNN
	1    6600 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D29898B
P 6600 5300
AR Path="/5DEAC282/5D29898B" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D29898B" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D29898B" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D29898B" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5D29898B" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 6600 5050 50  0001 C CNN
F 1 "GND" H 6605 5127 50  0000 C CNN
F 2 "" H 6600 5300 50  0001 C CNN
F 3 "" H 6600 5300 50  0001 C CNN
	1    6600 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D298991
P 6600 5100
AR Path="/5CC0D65F/5D298991" Ref="C?"  Part="1" 
AR Path="/5D298991" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D298991" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D298991" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D298991" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D298991" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5D298991" Ref="C7"  Part="1" 
F 0 "C7" H 6509 5146 50  0000 R CNN
F 1 "100nF" H 6509 5055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6600 5100 50  0001 C CNN
F 3 "~" H 6600 5100 50  0001 C CNN
	1    6600 5100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74ACT16244 U?
U 2 1 5D298997
P 7100 5500
AR Path="/5DEAC282/5D298997" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5D298997" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5D82AC00/5D298997" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5D1580C7/5D298997" Ref="U?"  Part="2" 
AR Path="/5E507DE3/5D298997" Ref="U4"  Part="2" 
F 0 "U4" H 7100 6267 50  0000 C CNN
F 1 "74ACT16244" H 7100 6176 50  0000 C CNN
F 2 "Housings_SSOP:SSOP-48_7.5x15.9mm_Pitch0.635mm" H 6975 5875 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/74ac16244.pdf" H 6975 5875 50  0001 C CNN
	2    7100 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5200 6200 5200
Wire Wire Line
	6600 5000 6200 5000
$Comp
L Device:C_Small C?
U 1 1 5D29899F
P 6200 5100
AR Path="/5CC0D65F/5D29899F" Ref="C?"  Part="1" 
AR Path="/5D29899F" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D29899F" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D29899F" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D29899F" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D1580C7/5D29899F" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5D29899F" Ref="C6"  Part="1" 
F 0 "C6" H 6109 5146 50  0000 R CNN
F 1 "10µF" H 6109 5055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6200 5100 50  0001 C CNN
F 3 "~" H 6200 5100 50  0001 C CNN
	1    6200 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2050 6050 4100
Wire Wire Line
	5850 2400 6600 2400
Wire Wire Line
	5950 2500 6600 2500
Wire Bus Line
	2850 2250 2850 4450
Wire Bus Line
	8050 2100 8050 4550
$EndSCHEMATC
