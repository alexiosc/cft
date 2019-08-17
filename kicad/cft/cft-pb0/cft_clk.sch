EESchema Schematic File Version 4
LIBS:cft-pb0-cache
LIBS:cft-card-blank-single-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 9
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
L Device:C_Small C?
U 1 1 5D15813B
P 2950 4600
AR Path="/5CC0D65F/5D15813B" Ref="C?"  Part="1" 
AR Path="/5D15813B" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D15813B" Ref="C51"  Part="1" 
F 0 "C51" H 2859 4646 50  0000 R CNN
F 1 "100nF" H 2859 4555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2950 4600 50  0001 C CNN
F 3 "~" H 2950 4600 50  0001 C CNN
	1    2950 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D15813C
P 2750 4800
AR Path="/5D15813C" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D15813C" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 2750 4550 50  0001 C CNN
F 1 "GND" H 2600 4750 50  0000 C CNN
F 2 "" H 2750 4800 50  0001 C CNN
F 3 "" H 2750 4800 50  0001 C CNN
	1    2750 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D15813D
P 2750 4400
AR Path="/5D15813D" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D15813D" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 2750 4250 50  0001 C CNN
F 1 "+5V" H 2765 4573 50  0000 C CNN
F 2 "" H 2750 4400 50  0001 C CNN
F 3 "" H 2750 4400 50  0001 C CNN
	1    2750 4400
	1    0    0    -1  
$EndComp
$Comp
L alexios:CXO_DIP8 X?
U 1 1 5E381107
P 3400 4550
AR Path="/5E381107" Ref="X?"  Part="1" 
AR Path="/5E36D9C8/5E381107" Ref="X1"  Part="1" 
F 0 "X1" H 3500 4917 50  0000 C CNN
F 1 "CXO_DIP8" H 3500 4826 50  0000 C CNN
F 2 "Oscillator:Oscillator_DIP-8" H 3550 4150 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 3500 4500 50  0001 C CNN
	1    3400 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4500 2950 4450
Wire Wire Line
	3100 4450 2950 4450
Connection ~ 2950 4450
Wire Wire Line
	2950 4700 2950 4750
Wire Wire Line
	3100 4750 2950 4750
Connection ~ 2950 4750
$Comp
L power:+5V #PWR?
U 1 1 5E38111F
P 1350 7200
AR Path="/5E38111F" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E38111F" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 1350 7050 50  0001 C CNN
F 1 "+5V" H 1365 7373 50  0000 C CNN
F 2 "" H 1350 7200 50  0001 C CNN
F 3 "" H 1350 7200 50  0001 C CNN
	1    1350 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E381125
P 1350 7300
AR Path="/5CC0D65F/5E381125" Ref="C?"  Part="1" 
AR Path="/5E381125" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E381125" Ref="C48"  Part="1" 
F 0 "C48" H 1259 7346 50  0000 R CNN
F 1 "100nF" H 1259 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1350 7300 50  0001 C CNN
F 3 "~" H 1350 7300 50  0001 C CNN
	1    1350 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E38112C
P 1350 7400
AR Path="/5E38112C" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E38112C" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 1350 7150 50  0001 C CNN
F 1 "GND" H 1355 7227 50  0000 C CNN
F 2 "" H 1350 7400 50  0001 C CNN
F 3 "" H 1350 7400 50  0001 C CNN
	1    1350 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D158142
P 2500 4600
AR Path="/5CC0D65F/5D158142" Ref="C?"  Part="1" 
AR Path="/5D158142" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D158142" Ref="C49"  Part="1" 
F 0 "C49" H 2409 4646 50  0000 R CNN
F 1 "10µF" H 2409 4555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 4600 50  0001 C CNN
F 3 "~" H 2500 4600 50  0001 C CNN
	1    2500 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4450 2750 4450
Wire Wire Line
	2500 4750 2750 4750
Wire Wire Line
	2750 4400 2750 4450
Connection ~ 2750 4450
Wire Wire Line
	2750 4450 2950 4450
Wire Wire Line
	2750 4800 2750 4750
Connection ~ 2750 4750
Wire Wire Line
	2750 4750 2950 4750
Text Label 3950 4600 0    50   ~ 0
CLK
Wire Wire Line
	2500 4700 2500 4750
Wire Wire Line
	2500 4500 2500 4450
Text Label 1550 3300 0    50   ~ 0
FPCLK
Text Label 6650 4100 2    50   ~ 0
~RESET
Text HLabel 1500 3300 0    50   Input ~ 0
FPCLK
Text Notes 7100 7000 0    197  ~ 39
Clock & Reset
Wire Wire Line
	6850 3600 6800 3600
Wire Wire Line
	6800 3600 6800 3700
$Comp
L power:GND #PWR?
U 1 1 5D158143
P 6800 4600
AR Path="/5D158143" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D158143" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 6800 4350 50  0001 C CNN
F 1 "GND" H 6805 4427 50  0000 C CNN
F 2 "" H 6800 4600 50  0001 C CNN
F 3 "" H 6800 4600 50  0001 C CNN
	1    6800 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3700 6800 3700
Connection ~ 6800 3700
Wire Wire Line
	6800 3700 6800 3800
Wire Wire Line
	6850 3800 6800 3800
Connection ~ 6800 3800
Wire Wire Line
	6800 3800 6800 3900
Wire Wire Line
	6850 3900 6800 3900
Connection ~ 6800 3900
NoConn ~ 7850 3800
NoConn ~ 7850 3900
NoConn ~ 7850 4300
NoConn ~ 7850 4100
$Comp
L alexios:74HC139 U?
U 2 1 5D158144
P 8700 4500
AR Path="/5D158144" Ref="U?"  Part="2" 
AR Path="/5E36D9C8/5D158144" Ref="U32"  Part="2" 
F 0 "U32" H 8700 4867 50  0000 C CNN
F 1 "74HC139" H 8700 4776 50  0000 C CNN
F 2 "Package_SO:SOIC-16_4.55x10.3mm_P1.27mm" H 8700 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8700 4500 50  0001 C CNN
	2    8700 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D158145
P 8150 4750
AR Path="/5D158145" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D158145" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 8150 4500 50  0001 C CNN
F 1 "GND" H 8155 4577 50  0000 C CNN
F 2 "" H 8150 4750 50  0001 C CNN
F 3 "" H 8150 4750 50  0001 C CNN
	1    8150 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4500 8150 4500
Wire Wire Line
	8150 4500 8150 4700
Wire Wire Line
	8200 4700 8150 4700
Connection ~ 8150 4700
Wire Wire Line
	8150 4700 8150 4750
Wire Wire Line
	7850 3700 8000 3700
NoConn ~ 9200 4400
NoConn ~ 9200 4700
$Comp
L power:GND #PWR?
U 1 1 5E3811BF
P 2750 7450
AR Path="/5E3811BF" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811BF" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 2750 7200 50  0001 C CNN
F 1 "GND" H 2755 7277 50  0000 C CNN
F 2 "" H 2750 7450 50  0001 C CNN
F 3 "" H 2750 7450 50  0001 C CNN
	1    2750 7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3811C5
P 4150 7450
AR Path="/5E3811C5" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811C5" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 4150 7200 50  0001 C CNN
F 1 "GND" H 4155 7277 50  0000 C CNN
F 2 "" H 4150 7450 50  0001 C CNN
F 3 "" H 4150 7450 50  0001 C CNN
	1    4150 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E3811CB
P 4150 7250
AR Path="/5E3811CB" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811CB" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 4150 7100 50  0001 C CNN
F 1 "+5V" H 4165 7423 50  0000 C CNN
F 2 "" H 4150 7250 50  0001 C CNN
F 3 "" H 4150 7250 50  0001 C CNN
	1    4150 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E3811D1
P 2750 7350
AR Path="/5CC0D65F/5E3811D1" Ref="C?"  Part="1" 
AR Path="/5E3811D1" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E3811D1" Ref="C50"  Part="1" 
F 0 "C50" H 2659 7396 50  0000 R CNN
F 1 "100nF" H 2659 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2750 7350 50  0001 C CNN
F 3 "~" H 2750 7350 50  0001 C CNN
	1    2750 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E3811D7
P 4150 7350
AR Path="/5CC0D65F/5E3811D7" Ref="C?"  Part="1" 
AR Path="/5E3811D7" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E3811D7" Ref="C53"  Part="1" 
F 0 "C53" H 4059 7396 50  0000 R CNN
F 1 "100nF" H 4059 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4150 7350 50  0001 C CNN
F 3 "~" H 4150 7350 50  0001 C CNN
	1    4150 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D15814B
P 2750 7250
AR Path="/5D15814B" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D15814B" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 2750 7100 50  0001 C CNN
F 1 "+5V" H 2765 7423 50  0000 C CNN
F 2 "" H 2750 7250 50  0001 C CNN
F 3 "" H 2750 7250 50  0001 C CNN
	1    2750 7250
	1    0    0    -1  
$EndComp
Text Label 8050 3600 0    50   ~ 0
÷2
Text Label 8050 3700 0    50   ~ 0
÷4
Wire Wire Line
	9200 3600 10600 3600
Wire Wire Line
	9200 3700 10600 3700
Wire Wire Line
	9200 3800 9700 3800
Text Label 9300 3600 0    50   ~ 0
CLK1
$Comp
L alexios:74HC139 U?
U 1 1 5D15814C
P 8700 3700
AR Path="/5D15814C" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D15814C" Ref="U32"  Part="1" 
F 0 "U32" H 8700 4067 50  0000 C CNN
F 1 "74HC139" H 8700 3976 50  0000 C CNN
F 2 "Package_SO:SOIC-16_4.55x10.3mm_P1.27mm" H 8700 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8700 3700 50  0001 C CNN
	1    8700 3700
	1    0    0    -1  
$EndComp
Text Label 9300 3700 0    50   ~ 0
CLK2
Text Label 9300 3800 0    50   ~ 0
CLK3
Text Label 9300 3900 0    50   ~ 0
CLK4
Text HLabel 10600 3600 2    50   Output ~ 0
CLK1
Text HLabel 10600 3700 2    50   Output ~ 0
CLK2
Text HLabel 10600 3800 2    50   Output ~ 0
CLK3
Text HLabel 10600 3900 2    50   Output ~ 0
CLK4
Wire Wire Line
	8000 4400 8200 4400
Wire Wire Line
	8200 3900 8150 3900
Wire Wire Line
	8150 3900 8150 3950
$Comp
L power:GND #PWR?
U 1 1 5D15814D
P 8150 3950
AR Path="/5D15814D" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D15814D" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 8150 3700 50  0001 C CNN
F 1 "GND" H 8155 3777 50  0000 C CNN
F 2 "" H 8150 3950 50  0001 C CNN
F 3 "" H 8150 3950 50  0001 C CNN
	1    8150 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 4500 10600 4500
Text Label 9300 4500 0    50   ~ 0
T34
Text HLabel 10600 4500 2    50   Output ~ 0
T34
Wire Wire Line
	6850 4100 6300 4100
Wire Wire Line
	4600 4100 4600 3200
Wire Wire Line
	4600 3200 4250 3200
$Comp
L alexios:74HC590 U?
U 1 1 5D1580B4
P 8250 1350
AR Path="/5E4DDD44/5D1580B4" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D1580B4" Ref="U31"  Part="1" 
F 0 "U31" H 8250 775 50  0000 C CNN
F 1 "74HC590" H 8250 684 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_5.3x10.2mm_P1.27mm" H 8250 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 8250 1400 50  0001 C CNN
	1    8250 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 1150 7700 1150
Wire Wire Line
	8900 600  8900 1550
Wire Wire Line
	8900 1550 8750 1550
NoConn ~ 8750 850 
NoConn ~ 8750 950 
NoConn ~ 8750 1050
NoConn ~ 8750 1150
NoConn ~ 8750 1250
NoConn ~ 8750 1350
NoConn ~ 8750 1450
$Comp
L power:+5V #PWR0115
U 1 1 5D1580B6
P 5500 7250
F 0 "#PWR0115" H 5500 7100 50  0001 C CNN
F 1 "+5V" H 5515 7423 50  0000 C CNN
F 2 "" H 5500 7250 50  0001 C CNN
F 3 "" H 5500 7250 50  0001 C CNN
	1    5500 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5D0FD6D8
P 5500 7450
F 0 "#PWR0116" H 5500 7200 50  0001 C CNN
F 1 "GND" H 5505 7277 50  0000 C CNN
F 2 "" H 5500 7450 50  0001 C CNN
F 3 "" H 5500 7450 50  0001 C CNN
	1    5500 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D0FD6DE
P 5500 7350
AR Path="/5CC0D65F/5D0FD6DE" Ref="C?"  Part="1" 
AR Path="/5D0FD6DE" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5D0FD6DE" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D0FD6DE" Ref="C54"  Part="1" 
F 0 "C54" H 5409 7396 50  0000 R CNN
F 1 "100nF" H 5409 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5500 7350 50  0001 C CNN
F 3 "~" H 5500 7350 50  0001 C CNN
	1    5500 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1550 9100 1550
Connection ~ 8900 1550
$Comp
L Device:R_Small R8
U 1 1 5D0FD6E9
P 9200 1550
F 0 "R8" V 9004 1550 50  0000 C CNN
F 1 "30Ω" V 9095 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9200 1550 50  0001 C CNN
F 3 "~" H 9200 1550 50  0001 C CNN
	1    9200 1550
	0    1    1    0   
$EndComp
Text Label 9400 1550 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	9300 1550 10600 1550
Wire Wire Line
	7700 600  8900 600 
Wire Wire Line
	7700 850  7700 600 
Wire Wire Line
	7750 850  7700 850 
Text HLabel 10600 1550 2    50   Output ~ 0
~RSTHOLD
$Comp
L power:GND #PWR0120
U 1 1 5D1580BA
P 7750 1750
F 0 "#PWR0120" H 7750 1500 50  0001 C CNN
F 1 "GND" H 7755 1577 50  0000 C CNN
F 2 "" H 7750 1750 50  0001 C CNN
F 3 "" H 7750 1750 50  0001 C CNN
	1    7750 1750
	1    0    0    -1  
$EndComp
Text HLabel 1500 1350 0    50   3State ~ 0
~RESET
Text Label 7450 1050 0    50   ~ 0
CLK3
Text Label 7450 1350 0    50   ~ 0
~RESET
Wire Wire Line
	7750 1350 4250 1350
Wire Wire Line
	7700 1150 7700 1050
Connection ~ 7700 1050
Wire Wire Line
	7700 1050 7750 1050
Text HLabel 1500 2700 0    50   Input ~ 0
POWEROK
Text HLabel 1500 2400 0    50   Input ~ 0
~FPRESET
$Comp
L power:+5V #PWR?
U 1 1 5D1580BE
P 3050 1600
AR Path="/5E4DDD44/5D1580BE" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D1580BE" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 3050 1450 50  0001 C CNN
F 1 "+5V" H 3065 1773 50  0000 C CNN
F 2 "" H 3050 1600 50  0001 C CNN
F 3 "" H 3050 1600 50  0001 C CNN
	1    3050 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1850 3150 1850
Wire Wire Line
	2900 1850 2950 1850
Connection ~ 3050 1850
$Comp
L power:+5V #PWR0113
U 1 1 5D14C3C4
P 4250 1100
F 0 "#PWR0113" H 4250 950 50  0001 C CNN
F 1 "+5V" H 4265 1273 50  0000 C CNN
F 2 "" H 4250 1100 50  0001 C CNN
F 3 "" H 4250 1100 50  0001 C CNN
	1    4250 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1300 4250 1350
Connection ~ 4250 1350
Wire Wire Line
	4250 1350 1500 1350
$Comp
L Device:R_Small R?
U 1 1 5D150EAB
P 4250 1200
AR Path="/5E4DDD44/5D150EAB" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5D150EAB" Ref="R7"  Part="1" 
F 0 "R7" H 4309 1246 50  0000 L CNN
F 1 "10kΩ" H 4309 1155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 1200 50  0001 C CNN
F 3 "~" H 4250 1200 50  0001 C CNN
	1    4250 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3800 9700 3150
Wire Wire Line
	9700 3150 7350 3150
Wire Wire Line
	7350 3150 7350 1050
Connection ~ 9700 3800
Wire Wire Line
	9700 3800 10600 3800
Wire Wire Line
	7350 1050 7700 1050
$Comp
L alexios:tactile_switch SW1
U 1 1 5D1580AC
P 2700 1850
F 0 "SW1" H 2700 2049 50  0000 C CNN
F 1 "tactile_switch" H 2700 1790 50  0001 C CNN
F 2 "Button_Switch_THT:SW_MEC_5GTH9" H 2700 2050 50  0001 C CNN
F 3 "" H 2700 2050 50  0001 C CNN
	1    2700 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1800 3050 1850
Wire Wire Line
	2450 1850 2500 1850
$Comp
L power:GND #PWR0108
U 1 1 5D1580AD
P 3150 2250
F 0 "#PWR0108" H 3150 2000 50  0001 C CNN
F 1 "GND" H 3000 2200 50  0000 C CNN
F 2 "" H 3150 2250 50  0001 C CNN
F 3 "" H 3150 2250 50  0001 C CNN
	1    3150 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small_ALT D1
U 1 1 5CFB5E58
P 3850 1850
F 0 "D1" H 3850 1950 50  0000 C CNN
F 1 "???" H 3850 1750 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3850 1850 50  0001 C CNN
F 3 "~" V 3850 1850 50  0001 C CNN
	1    3850 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D1580AF
P 3150 2000
AR Path="/5CC0D65F/5D1580AF" Ref="C?"  Part="1" 
AR Path="/5D1580AF" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D1580AF" Ref="C52"  Part="1" 
F 0 "C52" H 3059 2046 50  0000 R CNN
F 1 "100nF" H 3059 1955 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3150 2000 50  0001 C CNN
F 3 "~" H 3150 2000 50  0001 C CNN
	1    3150 2000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G17 U27
U 1 1 5D1580B0
P 3550 1850
F 0 "U27" H 3500 1675 50  0000 C CNN
F 1 "74LVC1G17" H 3500 1584 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 3550 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3550 1850 50  0001 C CNN
	1    3550 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D1580BD
P 3050 1700
AR Path="/5E4DDD44/5D1580BD" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5D1580BD" Ref="R4"  Part="1" 
F 0 "R4" H 3109 1746 50  0000 L CNN
F 1 "10kΩ" H 3109 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 1700 50  0001 C CNN
F 3 "~" H 3050 1700 50  0001 C CNN
	1    3050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1900 3150 1850
Connection ~ 3150 1850
Wire Wire Line
	3150 1850 3250 1850
Wire Wire Line
	2450 2150 2450 1850
Wire Wire Line
	3150 2100 3150 2150
Wire Wire Line
	3150 2150 2450 2150
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5D1580B1
P 2200 1850
F 0 "J1" H 2200 1600 50  0000 C CNN
F 1 "Conn_01x02" H 2500 1800 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2200 1850 50  0001 C CNN
F 3 "~" H 2200 1850 50  0001 C CNN
	1    2200 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 1850 2450 1850
Connection ~ 2450 1850
Wire Wire Line
	2400 1750 2450 1750
Wire Wire Line
	2450 1750 2450 1550
Wire Wire Line
	2450 1550 2950 1550
Wire Wire Line
	2950 1550 2950 1850
Connection ~ 2950 1850
Wire Wire Line
	2950 1850 3050 1850
$Comp
L Device:D_Small_ALT D2
U 1 1 5D05847A
P 3850 2400
F 0 "D2" H 3850 2500 50  0000 C CNN
F 1 "???" H 3850 2300 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3850 2400 50  0001 C CNN
F 3 "~" V 3850 2400 50  0001 C CNN
	1    3850 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small_ALT D3
U 1 1 5D058B2E
P 3850 2700
F 0 "D3" H 3850 2800 50  0000 C CNN
F 1 "???" H 3850 2600 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3850 2700 50  0001 C CNN
F 3 "~" V 3850 2700 50  0001 C CNN
	1    3850 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1850 4250 1850
Wire Wire Line
	4250 1850 4250 2400
Wire Wire Line
	4250 2700 3950 2700
Wire Wire Line
	3950 2400 4250 2400
Connection ~ 4250 2400
Wire Wire Line
	4250 2400 4250 2700
Wire Wire Line
	3150 2250 3150 2150
Connection ~ 3150 2150
Wire Wire Line
	4250 1850 4250 1350
Connection ~ 4250 1850
Wire Wire Line
	4250 2700 4250 3200
Connection ~ 4250 2700
NoConn ~ 9200 4600
Wire Wire Line
	7850 3600 8200 3600
Wire Wire Line
	8000 4400 8000 3700
Connection ~ 8000 3700
Wire Wire Line
	8000 3700 8200 3700
Text Label 8050 4400 0    50   ~ 0
÷4
Wire Notes Line style solid
	5350 3450 5800 3450
Wire Notes Line style solid
	5800 3450 5800 3500
Wire Notes Line style solid
	5800 3500 5950 3500
Wire Notes Line style solid
	5950 3500 5950 3450
Wire Notes Line style solid
	5950 3450 6000 3450
Wire Notes Line style solid
	5325 3350 5650 3350
Wire Notes Line style solid
	5650 3350 5650 3400
Wire Notes Line style solid
	5650 3400 5800 3400
Wire Notes Line style solid
	5800 3400 5800 3350
Wire Notes Line style solid
	5800 3350 6000 3350
Wire Notes Line style solid
	5325 3250 5500 3250
Wire Notes Line style solid
	5500 3250 5500 3300
Wire Notes Line style solid
	5500 3300 5650 3300
Wire Notes Line style solid
	5650 3300 5650 3250
Wire Notes Line style solid
	5650 3250 6000 3250
Wire Notes Line style solid
	5325 3150 5350 3150
Wire Notes Line style solid
	5350 3150 5350 3200
Wire Notes Line style solid
	5350 3200 5500 3200
Wire Notes Line style solid
	5350 3450 5350 3500
Wire Notes Line style solid
	5350 3500 5325 3500
Wire Notes Line style solid
	5950 3200 6000 3200
Wire Notes Line style solid
	5350 3550 5650 3550
Wire Notes Line style solid
	5650 3550 5650 3600
Wire Notes Line style solid
	5650 3600 5950 3600
Wire Notes Line style solid
	5950 3600 5950 3550
Wire Notes Line style solid
	5950 3550 6000 3550
Wire Notes Line style solid
	5350 3550 5350 3600
Wire Notes Line style solid
	5350 3600 5325 3600
Wire Notes Line style solid
	5325 3050 5325 3100
Text Notes 5300 3100 2    50   ~ 0
CLKIN
Text Notes 5300 3600 2    50   ~ 0
T34
Text Notes 5300 3300 2    50   ~ 0
CLK2
Text Notes 5300 3400 2    50   ~ 0
CLK3
Text Notes 5300 3500 2    50   ~ 0
CLK4
Text Notes 5300 3200 2    50   ~ 0
CLK1
Wire Notes Line style solid
	5825 3650 5835 3700
Wire Notes Line style solid
	5890 3700 5900 3650
Text Notes 5300 3700 2    50   ~ 0
WSTB
Wire Notes Line style solid
	5350 3100 5350 3050
Wire Notes Line style solid
	5325 3100 5350 3100
Wire Notes Line style solid
	5350 3050 5375 3050
Wire Notes Line style solid
	5500 3150 5950 3150
Wire Notes Line style solid
	5950 3150 5950 3200
Wire Notes Line style solid
	5500 3200 5500 3150
Wire Notes Line style solid
	5375 3050 5375 3100
Wire Notes Line style solid
	5400 3100 5400 3050
Wire Notes Line style solid
	5375 3100 5400 3100
Wire Notes Line style solid
	5400 3050 5425 3050
Wire Notes Line style solid
	5425 3050 5425 3100
Wire Notes Line style solid
	5450 3100 5450 3050
Wire Notes Line style solid
	5425 3100 5450 3100
Wire Notes Line style solid
	5450 3050 5475 3050
Wire Notes Line style solid
	5475 3050 5475 3100
Wire Notes Line style solid
	5500 3100 5500 3050
Wire Notes Line style solid
	5475 3100 5500 3100
Wire Notes Line style solid
	5500 3050 5525 3050
Wire Notes Line style solid
	5525 3050 5525 3100
Wire Notes Line style solid
	5550 3100 5550 3050
Wire Notes Line style solid
	5525 3100 5550 3100
Wire Notes Line style solid
	5550 3050 5575 3050
Wire Notes Line style solid
	5575 3050 5575 3100
Wire Notes Line style solid
	5600 3100 5600 3050
Wire Notes Line style solid
	5575 3100 5600 3100
Wire Notes Line style solid
	5600 3050 5625 3050
Wire Notes Line style solid
	5625 3050 5625 3100
Wire Notes Line style solid
	5650 3100 5650 3050
Wire Notes Line style solid
	5625 3100 5650 3100
Wire Notes Line style solid
	5650 3050 5675 3050
Wire Notes Line style solid
	5675 3050 5675 3100
Wire Notes Line style solid
	5700 3100 5700 3050
Wire Notes Line style solid
	5675 3100 5700 3100
Wire Notes Line style solid
	5700 3050 5725 3050
Wire Notes Line style solid
	5725 3050 5725 3100
Wire Notes Line style solid
	5750 3100 5750 3050
Wire Notes Line style solid
	5725 3100 5750 3100
Wire Notes Line style solid
	5750 3050 5775 3050
Wire Notes Line style solid
	5775 3050 5775 3100
Wire Notes Line style solid
	5800 3100 5800 3050
Wire Notes Line style solid
	5775 3100 5800 3100
Wire Notes Line style solid
	5800 3050 5825 3050
Wire Notes Line style solid
	5825 3050 5825 3100
Wire Notes Line style solid
	5850 3100 5850 3050
Wire Notes Line style solid
	5825 3100 5850 3100
Wire Notes Line style solid
	5850 3050 5875 3050
Wire Notes Line style solid
	5875 3050 5875 3100
Wire Notes Line style solid
	5900 3100 5900 3050
Wire Notes Line style solid
	5875 3100 5900 3100
Wire Notes Line style solid
	5900 3050 5925 3050
Wire Notes Line style solid
	5925 3050 5925 3100
Wire Notes Line style solid
	5950 3100 5950 3050
Wire Notes Line style solid
	5925 3100 5950 3100
Wire Notes Line style solid
	5950 3050 5975 3050
Wire Notes Line style solid
	5975 3050 5975 3100
Wire Notes Line style solid
	6000 3100 6000 3050
Wire Notes Line style solid
	5975 3100 6000 3100
Wire Notes Line style solid
	5915 3700 5925 3650
Wire Notes Line style solid
	5835 3700 5915 3700
Wire Notes Line style solid
	5860 3700 5850 3650
Wire Notes Line style solid
	5900 3650 6000 3650
Wire Notes Line style solid
	5350 3650 5850 3650
Wire Notes Line style solid
	5350 3650 5350 3700
Wire Notes Line style solid
	5350 3700 5325 3700
Text Notes 7650 2700 0    50   ~ 0
After a ~RESET~ pulse, the clock starts and we count 128 processor cycles.\nAt a 4 MHz clock, this is 32 µs. During this time, ~RSTHOLD~ is asserted, and\nmost of the processor units remain tri-stated and in reset while everything\nstabilises, capacitors are charged, etc. During this time, the processor\nalso performs its reset microprogram to initialise the PC with the boot\nvector.
Text Label 5050 4600 2    50   ~ 0
CLK
$Comp
L alexios:74LVC2G157 U28
U 1 1 5D1580C4
P 5500 4600
F 0 "U28" H 5500 4967 50  0000 C CNN
F 1 "74LVC2G157" H 5500 4876 50  0000 C CNN
F 2 "Package_SO:SSOP-8_3.9x5.05mm_P1.27mm" H 5400 4725 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 5400 4725 50  0001 C CNN
	1    5500 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5D1580C5
P 5100 4850
F 0 "#PWR0114" H 5100 4600 50  0001 C CNN
F 1 "GND" H 5105 4677 50  0000 C CNN
F 2 "" H 5100 4850 50  0001 C CNN
F 3 "" H 5100 4850 50  0001 C CNN
	1    5100 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4800 5100 4800
Wire Wire Line
	5100 4800 5100 4850
NoConn ~ 5850 4800
Wire Wire Line
	3900 4600 5150 4600
Wire Wire Line
	4500 4500 5150 4500
$Comp
L power:GND #PWR?
U 1 1 5D158150
P 3150 3650
AR Path="/5D158150" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D158150" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 3150 3400 50  0001 C CNN
F 1 "GND" H 3155 3477 50  0000 C CNN
F 2 "" H 3150 3650 50  0001 C CNN
F 3 "" H 3150 3650 50  0001 C CNN
	1    3150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E38120E
P 3150 3550
AR Path="/5E38120E" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E38120E" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5E38120E" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5E38120E" Ref="R5"  Part="1" 
F 0 "R5" H 3092 3596 50  0000 R CNN
F 1 "10kΩ" H 3092 3505 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3150 3550 50  0001 C CNN
F 3 "~" H 3150 3550 50  0001 C CNN
	1    3150 3550
	1    0    0    -1  
$EndComp
Text HLabel 1500 3400 0    50   Input ~ 0
~FPCLK~⁄CLK
Text Label 1550 3400 0    50   ~ 0
~FPCLK~⁄CLK
$Comp
L power:+5V #PWR0110
U 1 1 5D18908F
P 3300 3050
F 0 "#PWR0110" H 3300 2900 50  0001 C CNN
F 1 "+5V" H 3315 3223 50  0000 C CNN
F 2 "" H 3300 3050 50  0001 C CNN
F 3 "" H 3300 3050 50  0001 C CNN
	1    3300 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D15814F
P 3300 3150
AR Path="/5D15814F" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D15814F" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5D15814F" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5D15814F" Ref="R6"  Part="1" 
F 0 "R6" H 3242 3196 50  0000 R CNN
F 1 "10kΩ" H 3242 3105 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3300 3150 50  0001 C CNN
F 3 "~" H 3300 3150 50  0001 C CNN
	1    3300 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3250 3300 3400
Wire Wire Line
	3300 3400 4400 3400
Wire Wire Line
	3150 3450 3150 3300
Wire Wire Line
	3150 3300 4500 3300
Wire Wire Line
	4400 4700 5150 4700
Wire Wire Line
	5850 4500 6200 4500
Text Label 6650 4500 2    50   ~ 0
CLKIN
$Comp
L alexios:74AC191 U?
U 1 1 5D805641
P 7350 4000
AR Path="/5CE09726/5D805641" Ref="U?"  Part="1" 
AR Path="/6A313729/5D805641" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D805641" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D805641" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D805641" Ref="U29"  Part="1" 
F 0 "U29" H 7350 3325 50  0000 C CNN
F 1 "74AC191" H 7350 3234 50  0000 C CNN
F 2 "Package_SO:SOIC-16_4.55x10.3mm_P1.27mm" H 7325 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 7325 4000 50  0001 C CNN
	1    7350 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3900 6800 4200
Wire Wire Line
	6850 4400 6800 4400
Connection ~ 6800 4400
Wire Wire Line
	6800 4400 6800 4600
Wire Wire Line
	6850 4200 6800 4200
Connection ~ 6800 4200
Wire Wire Line
	6800 4200 6800 4400
Wire Wire Line
	4500 3300 4500 4500
Wire Wire Line
	4400 3400 4400 4700
Text Label 5100 4700 2    50   ~ 0
~FPCLK~⁄CLK
Text Label 5050 4500 2    50   ~ 0
FPCLK
Wire Wire Line
	6850 5000 6800 5000
$Comp
L power:GND #PWR?
U 1 1 5D94BF66
P 6800 6000
AR Path="/5D94BF66" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D94BF66" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 6800 5750 50  0001 C CNN
F 1 "GND" H 6805 5827 50  0000 C CNN
F 2 "" H 6800 6000 50  0001 C CNN
F 3 "" H 6800 6000 50  0001 C CNN
	1    6800 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 5100 6800 5100
Wire Wire Line
	6800 5100 6800 5200
Wire Wire Line
	6850 5200 6800 5200
Connection ~ 6800 5200
Wire Wire Line
	6800 5200 6800 5300
Wire Wire Line
	6850 5300 6800 5300
Connection ~ 6800 5300
NoConn ~ 7850 5200
NoConn ~ 7850 5300
NoConn ~ 7850 5700
NoConn ~ 7850 5500
$Comp
L alexios:74AC191 U?
U 1 1 5D1580F3
P 7350 5400
AR Path="/5CE09726/5D1580F3" Ref="U?"  Part="1" 
AR Path="/6A313729/5D1580F3" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D1580F3" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D1580F3" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D1580F3" Ref="U30"  Part="1" 
F 0 "U30" H 7350 4725 50  0000 C CNN
F 1 "74AC191" H 7350 4634 50  0000 C CNN
F 2 "Package_SO:SOIC-16_4.55x10.3mm_P1.27mm" H 7325 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 7325 5400 50  0001 C CNN
	1    7350 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 5300 6800 5600
Wire Wire Line
	6850 5800 6800 5800
Connection ~ 6800 5800
Wire Wire Line
	6800 5800 6800 6000
Wire Wire Line
	6850 5600 6800 5600
Connection ~ 6800 5600
Wire Wire Line
	6800 5600 6800 5800
Wire Wire Line
	6300 4100 6300 5500
Wire Wire Line
	6300 5500 6850 5500
Connection ~ 6300 4100
Wire Wire Line
	6300 4100 4600 4100
Text Label 6650 5500 2    50   ~ 0
~RESET
Wire Wire Line
	6200 4500 6200 5900
Connection ~ 6200 4500
Wire Wire Line
	6200 4500 6850 4500
Wire Wire Line
	6200 5900 6850 5900
Text Label 6650 5900 2    50   ~ 0
CLKIN
$Comp
L power:+5V #PWR0118
U 1 1 5D1580F4
P 6800 5000
F 0 "#PWR0118" H 6800 4850 50  0001 C CNN
F 1 "+5V" V 6815 5128 50  0000 L CNN
F 2 "" H 6800 5000 50  0001 C CNN
F 3 "" H 6800 5000 50  0001 C CNN
	1    6800 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7850 5000 9700 5000
$Comp
L alexios:74LVC1G08 U33
U 1 1 5D9A3743
P 10000 4950
F 0 "U33" H 9950 4750 50  0000 C CNN
F 1 "74LVC1G08" H 9950 4650 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 9650 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 9650 4950 50  0001 C CNN
	1    10000 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4950 10600 4950
NoConn ~ 7850 5100
Text HLabel 10600 4950 2    50   Output ~ 0
WSTB
Text Label 10300 4950 0    50   ~ 0
WSTB
Text Label 10500 4500 2    50   ~ 0
T34
Text Label 10500 3600 2    50   ~ 0
CLK1
Text Label 10500 3700 2    50   ~ 0
CLK2
Text Label 10500 3800 2    50   ~ 0
CLK3
Text Label 10500 3900 2    50   ~ 0
CLK4
Wire Wire Line
	9600 4900 9700 4900
Wire Wire Line
	9600 3900 10600 3900
Connection ~ 9600 3900
Wire Wire Line
	9200 3900 9600 3900
Wire Wire Line
	9600 3900 9600 4900
Wire Wire Line
	1500 2400 3750 2400
Wire Wire Line
	1500 2700 3750 2700
Wire Wire Line
	1500 3300 3150 3300
Connection ~ 3150 3300
Wire Wire Line
	1500 3400 3300 3400
Connection ~ 3300 3400
$Comp
L alexios:74LVC2G157 U28
U 2 1 5D1CB815
P 1700 7300
F 0 "U28" H 1880 7346 50  0000 L CNN
F 1 "74LVC2G157" H 1880 7255 50  0000 L CNN
F 2 "Package_SO:SSOP-8_3.9x5.05mm_P1.27mm" H 1600 7425 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 1600 7425 50  0001 C CNN
	2    1700 7300
	1    0    0    -1  
$EndComp
Connection ~ 1350 7400
Connection ~ 1350 7200
Connection ~ 5500 7450
Connection ~ 5500 7250
$Comp
L alexios:74HC590 U31
U 2 1 5D0FD6CB
P 5850 7700
F 0 "U31" H 6030 8096 50  0000 L CNN
F 1 "74HC590" H 6030 8005 50  0000 L CNN
F 2 "Package_SO:SOIC-16W_5.3x10.2mm_P1.27mm" H 5850 7750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 5850 7750 50  0001 C CNN
	2    5850 7700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC191 U?
U 2 1 5D1CE954
P 3100 7600
AR Path="/5CE09726/5D1CE954" Ref="U?"  Part="1" 
AR Path="/6A313729/5D1CE954" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D1CE954" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D1CE954" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D1CE954" Ref="U29"  Part="2" 
F 0 "U29" H 3280 7896 50  0000 L CNN
F 1 "74AC191" H 3280 7805 50  0000 L CNN
F 2 "Package_SO:SOIC-16_4.55x10.3mm_P1.27mm" H 3075 7600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 3075 7600 50  0001 C CNN
	2    3100 7600
	1    0    0    -1  
$EndComp
Connection ~ 2750 7250
Connection ~ 2750 7450
$Comp
L alexios:74AC191 U?
U 2 1 5D1CF43E
P 4500 7600
AR Path="/5CE09726/5D1CF43E" Ref="U?"  Part="1" 
AR Path="/6A313729/5D1CF43E" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D1CF43E" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D1CF43E" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D1CF43E" Ref="U30"  Part="2" 
F 0 "U30" H 4680 7896 50  0000 L CNN
F 1 "74AC191" H 4680 7805 50  0000 L CNN
F 2 "Package_SO:SOIC-16_4.55x10.3mm_P1.27mm" H 4475 7600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 4475 7600 50  0001 C CNN
	2    4500 7600
	1    0    0    -1  
$EndComp
Connection ~ 4150 7250
Connection ~ 4150 7450
$Comp
L alexios:74HC139 U?
U 3 1 5D1D1904
P 8800 6050
AR Path="/5D1D1904" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D1D1904" Ref="U32"  Part="3" 
F 0 "U32" H 8800 6417 50  0000 C CNN
F 1 "74HC139" H 8800 6326 50  0000 C CNN
F 2 "Package_SO:SOIC-16_4.55x10.3mm_P1.27mm" H 8800 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8800 6050 50  0001 C CNN
	3    8800 6050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 5D1D2B27
P 8450 5950
F 0 "#PWR0123" H 8450 5800 50  0001 C CNN
F 1 "+5V" H 8465 6123 50  0000 C CNN
F 2 "" H 8450 5950 50  0001 C CNN
F 3 "" H 8450 5950 50  0001 C CNN
	1    8450 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5D1D2B2D
P 8450 6150
F 0 "#PWR0124" H 8450 5900 50  0001 C CNN
F 1 "GND" H 8455 5977 50  0000 C CNN
F 2 "" H 8450 6150 50  0001 C CNN
F 3 "" H 8450 6150 50  0001 C CNN
	1    8450 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D1D2B33
P 8450 6050
AR Path="/5CC0D65F/5D1D2B33" Ref="C?"  Part="1" 
AR Path="/5D1D2B33" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5D1D2B33" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D1D2B33" Ref="C55"  Part="1" 
F 0 "C55" H 8359 6096 50  0000 R CNN
F 1 "100nF" H 8359 6005 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8450 6050 50  0001 C CNN
F 3 "~" H 8450 6050 50  0001 C CNN
	1    8450 6050
	1    0    0    -1  
$EndComp
Connection ~ 8450 5950
Connection ~ 8450 6150
$Comp
L alexios:74LVC1G17 U27
U 2 1 5D1EA8E3
P 1700 6500
F 0 "U27" H 1880 6446 50  0000 L CNN
F 1 "74LVC1G17" H 1880 6355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 1700 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1700 6500 50  0001 C CNN
	2    1700 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR098
U 1 1 5CF0C819
P 800 7450
F 0 "#PWR098" H 800 7200 50  0001 C CNN
F 1 "GND" H 805 7277 50  0000 C CNN
F 2 "" H 800 7450 50  0001 C CNN
F 3 "" H 800 7450 50  0001 C CNN
	1    800  7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR097
U 1 1 5D1580AA
P 800 7250
F 0 "#PWR097" H 800 7100 50  0001 C CNN
F 1 "+5V" H 815 7423 50  0000 C CNN
F 2 "" H 800 7250 50  0001 C CNN
F 3 "" H 800 7250 50  0001 C CNN
	1    800  7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D1580A9
P 800 7350
AR Path="/5CC0D65F/5D1580A9" Ref="C?"  Part="1" 
AR Path="/5D1580A9" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D1580A9" Ref="C46"  Part="1" 
F 0 "C46" H 709 7396 50  0000 R CNN
F 1 "47µF" H 709 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 800 7350 50  0001 C CNN
F 3 "~" H 800 7350 50  0001 C CNN
	1    800  7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D1F2761
P 1350 6600
AR Path="/5CC0D65F/5D1F2761" Ref="C?"  Part="1" 
AR Path="/5D1F2761" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D1F2761" Ref="C47"  Part="1" 
F 0 "C47" H 1259 6646 50  0000 R CNN
F 1 "100nF" H 1259 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1350 6600 50  0001 C CNN
F 3 "~" H 1350 6600 50  0001 C CNN
	1    1350 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D1F2AE1
P 1350 6500
AR Path="/5D1F2AE1" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D1F2AE1" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 1350 6350 50  0001 C CNN
F 1 "+5V" H 1365 6673 50  0000 C CNN
F 2 "" H 1350 6500 50  0001 C CNN
F 3 "" H 1350 6500 50  0001 C CNN
	1    1350 6500
	1    0    0    -1  
$EndComp
Connection ~ 1350 6500
$Comp
L power:GND #PWR?
U 1 1 5D1F2C92
P 1350 6700
AR Path="/5D1F2C92" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D1F2C92" Ref="#PWR0100"  Part="1" 
F 0 "#PWR0100" H 1350 6450 50  0001 C CNN
F 1 "GND" H 1355 6527 50  0000 C CNN
F 2 "" H 1350 6700 50  0001 C CNN
F 3 "" H 1350 6700 50  0001 C CNN
	1    1350 6700
	1    0    0    -1  
$EndComp
Connection ~ 1350 6700
$Comp
L alexios:74LVC1G08 U33
U 2 1 5D224F13
P 10100 5950
F 0 "U33" H 10180 5896 50  0000 L CNN
F 1 "74LVC1G08" H 10180 5805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 9750 5950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 9750 5950 50  0001 C CNN
	2    10100 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0125
U 1 1 5D225A06
P 9650 5950
F 0 "#PWR0125" H 9650 5800 50  0001 C CNN
F 1 "+5V" H 9665 6123 50  0000 C CNN
F 2 "" H 9650 5950 50  0001 C CNN
F 3 "" H 9650 5950 50  0001 C CNN
	1    9650 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5D225A0C
P 9650 6150
F 0 "#PWR0126" H 9650 5900 50  0001 C CNN
F 1 "GND" H 9655 5977 50  0000 C CNN
F 2 "" H 9650 6150 50  0001 C CNN
F 3 "" H 9650 6150 50  0001 C CNN
	1    9650 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D225A12
P 9650 6050
AR Path="/5CC0D65F/5D225A12" Ref="C?"  Part="1" 
AR Path="/5D225A12" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5D225A12" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D225A12" Ref="C56"  Part="1" 
F 0 "C56" H 9559 6096 50  0000 R CNN
F 1 "100nF" H 9559 6005 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9650 6050 50  0001 C CNN
F 3 "~" H 9650 6050 50  0001 C CNN
	1    9650 6050
	1    0    0    -1  
$EndComp
Connection ~ 9650 6150
Connection ~ 9650 5950
NoConn ~ 3900 4450
NoConn ~ 8750 1750
$EndSCHEMATC
