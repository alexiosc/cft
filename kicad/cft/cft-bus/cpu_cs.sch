EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title "Constant Store"
Date ""
Rev ""
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 "constant_store.v"
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 5E51C06B
P 1000 7250
AR Path="/5E4DDD44/5E51C06B" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C06B" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEB9/5E51C06B" Ref="#PWR011"  Part="1" 
AR Path="/5E25A7FA/5E51C06B" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 1000 7100 50  0001 C CNN
F 1 "+5V" H 1015 7423 50  0000 C CNN
F 2 "" H 1000 7250 50  0001 C CNN
F 3 "" H 1000 7250 50  0001 C CNN
	1    1000 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E51C071
P 1000 7450
AR Path="/5E4DDD44/5E51C071" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C071" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEB9/5E51C071" Ref="#PWR014"  Part="1" 
AR Path="/5E25A7FA/5E51C071" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 1000 7200 50  0001 C CNN
F 1 "GND" H 1005 7277 50  0000 C CNN
F 2 "" H 1000 7450 50  0001 C CNN
F 3 "" H 1000 7450 50  0001 C CNN
	1    1000 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E51C077
P 1000 7350
AR Path="/5CC0D65F/5E51C077" Ref="C?"  Part="1" 
AR Path="/5E51C077" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5E51C077" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5E51C077" Ref="C?"  Part="1" 
AR Path="/5DF0FEB9/5E51C077" Ref="C3"  Part="1" 
AR Path="/5E25A7FA/5E51C077" Ref="C3"  Part="1" 
F 0 "C3" H 909 7396 50  0000 R CNN
F 1 "100nF" H 909 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1000 7350 50  0001 C CNN
F 3 "~" H 1000 7350 50  0001 C CNN
	1    1000 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E51C0B5
P 2450 7350
AR Path="/5CC0D65F/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5DF0FEB9/5E51C0B5" Ref="C4"  Part="1" 
AR Path="/5E25A7FA/5E51C0B5" Ref="C4"  Part="1" 
F 0 "C4" H 2359 7396 50  0000 R CNN
F 1 "100nF" H 2359 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 7350 50  0001 C CNN
F 3 "~" H 2450 7350 50  0001 C CNN
	1    2450 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E51C0BB
P 2450 7450
AR Path="/5E4DDD44/5E51C0BB" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C0BB" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEB9/5E51C0BB" Ref="#PWR015"  Part="1" 
AR Path="/5E25A7FA/5E51C0BB" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 2450 7200 50  0001 C CNN
F 1 "GND" H 2455 7277 50  0000 C CNN
F 2 "" H 2450 7450 50  0001 C CNN
F 3 "" H 2450 7450 50  0001 C CNN
	1    2450 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E51C0C1
P 2450 7250
AR Path="/5E4DDD44/5E51C0C1" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C0C1" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEB9/5E51C0C1" Ref="#PWR012"  Part="1" 
AR Path="/5E25A7FA/5E51C0C1" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 2450 7100 50  0001 C CNN
F 1 "+5V" H 2465 7423 50  0000 C CNN
F 2 "" H 2450 7250 50  0001 C CNN
F 3 "" H 2450 7250 50  0001 C CNN
	1    2450 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 1 1 5E55BF66
P 7100 3050
AR Path="/5E4DDD44/5E55BF66" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5E55BF66" Ref="U?"  Part="1" 
AR Path="/5DF0FEB9/5E55BF66" Ref="U1"  Part="1" 
AR Path="/5E25A7FA/5E55BF66" Ref="U1"  Part="1" 
F 0 "U1" H 7100 3817 50  0000 C CNN
F 1 "74AC541" H 7100 3726 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7100 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 7100 3050 50  0001 C CNN
	1    7100 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 1 1 5E55BF6C
P 7100 4600
AR Path="/5E4DDD44/5E55BF6C" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5E55BF6C" Ref="U?"  Part="1" 
AR Path="/5DF0FEB9/5E55BF6C" Ref="U3"  Part="1" 
AR Path="/5E25A7FA/5E55BF6C" Ref="U3"  Part="1" 
F 0 "U3" H 7100 5367 50  0000 C CNN
F 1 "74AC541" H 7100 5276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7100 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 7100 4600 50  0001 C CNN
	1    7100 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4100 2950 4100
Text Label 3250 4100 2    50   ~ 0
RADDR2
Text Label 3000 4800 0    50   ~ 0
~RUEN
Entry Wire Line
	2850 4000 2950 4100
Entry Bus Bus
	2750 2250 2850 2350
Wire Wire Line
	2150 4800 3750 4800
Text HLabel 2150 4800 0    50   Input ~ 0
~RUEN
Text Label 2250 2250 0    50   ~ 0
RADDR[0..4]
Text HLabel 2150 2250 0    50   Input ~ 0
RADDR[0..4]
Wire Bus Line
	2750 2250 2150 2250
Text Notes 4300 4750 1    50   ~ 10
RADDR=001xx
Text Label 4850 4200 0    50   ~ 0
~CSOE
Text Notes 5400 4300 2    50   ~ 0
RADDR=001XX
Text Label 6450 3450 2    50   ~ 0
~CSOE
Wire Wire Line
	6500 3550 6600 3550
Text Label 6450 5000 2    50   ~ 0
~CSOE
Wire Wire Line
	6500 5100 6600 5100
Wire Wire Line
	6600 2750 6500 2750
Wire Wire Line
	6500 2750 6500 2850
$Comp
L power:GND #PWR0136
U 1 1 5DEFC7D1
P 6500 3250
F 0 "#PWR0136" H 6500 3000 50  0001 C CNN
F 1 "GND" H 6350 3250 50  0000 C CNN
F 2 "" H 6500 3250 50  0001 C CNN
F 3 "" H 6500 3250 50  0001 C CNN
	1    6500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3250 6500 3250
Connection ~ 6500 3250
Wire Wire Line
	6600 3150 6500 3150
Connection ~ 6500 3150
Wire Wire Line
	6500 3150 6500 3250
Wire Wire Line
	6600 3050 6500 3050
Connection ~ 6500 3050
Wire Wire Line
	6500 3050 6500 3150
Wire Wire Line
	6600 2950 6500 2950
Connection ~ 6500 2950
Wire Wire Line
	6500 2950 6500 3050
Wire Wire Line
	6600 2850 6500 2850
Connection ~ 6500 2850
Wire Wire Line
	6500 2850 6500 2950
$Comp
L power:GND #PWR0137
U 1 1 5DEFC7D2
P 6500 4800
F 0 "#PWR0137" H 6500 4550 50  0001 C CNN
F 1 "GND" H 6350 4800 50  0000 C CNN
F 2 "" H 6500 4800 50  0001 C CNN
F 3 "" H 6500 4800 50  0001 C CNN
	1    6500 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4100 6600 4100
Wire Wire Line
	6600 4200 6500 4200
Connection ~ 6500 4200
Wire Wire Line
	6500 4200 6500 4100
Wire Wire Line
	6600 4300 6500 4300
Connection ~ 6500 4300
Wire Wire Line
	6500 4300 6500 4200
Wire Wire Line
	6600 4400 6500 4400
Connection ~ 6500 4400
Wire Wire Line
	6500 4400 6500 4300
Wire Wire Line
	6600 4500 6500 4500
Connection ~ 6500 4500
Wire Wire Line
	6500 4500 6500 4400
Wire Wire Line
	6500 4600 6600 4600
Connection ~ 6500 4600
Wire Wire Line
	6500 4600 6500 4500
Wire Wire Line
	6600 4700 6500 4700
Connection ~ 6500 4700
Wire Wire Line
	6500 4700 6500 4600
Wire Wire Line
	6500 4800 6600 4800
Connection ~ 6500 4800
Wire Wire Line
	6500 4800 6500 4700
Text Label 6450 2550 2    50   ~ 0
RADDR0
Text Label 6450 2650 2    50   ~ 0
RADDR1
Text Label 8050 3800 1    50   ~ 0
IBUS[0..15]
Text Label 7650 4800 0    50   ~ 0
IBUS15
Text Label 7650 4700 0    50   ~ 0
IBUS14
Text Label 7650 4600 0    50   ~ 0
IBUS13
Text Label 7650 4500 0    50   ~ 0
IBUS12
Text Label 7650 4400 0    50   ~ 0
IBUS11
Text Label 7650 4300 0    50   ~ 0
IBUS10
Text Label 7650 4200 0    50   ~ 0
IBUS9
Text Label 7650 4100 0    50   ~ 0
IBUS8
Entry Wire Line
	8050 4700 7950 4800
Entry Wire Line
	8050 4600 7950 4700
Entry Wire Line
	8050 4500 7950 4600
Entry Wire Line
	8050 4400 7950 4500
Wire Wire Line
	7950 4800 7600 4800
Wire Wire Line
	7950 4700 7600 4700
Wire Wire Line
	7950 4600 7600 4600
Wire Wire Line
	7600 4500 7950 4500
Entry Wire Line
	8050 4300 7950 4400
Entry Wire Line
	8050 4200 7950 4300
Entry Wire Line
	8050 4100 7950 4200
Entry Wire Line
	8050 4000 7950 4100
Wire Wire Line
	7950 4400 7600 4400
Wire Wire Line
	7950 4300 7600 4300
Wire Wire Line
	7950 4200 7600 4200
Wire Wire Line
	7600 4100 7950 4100
Text Label 7650 3250 0    50   ~ 0
IBUS7
Text Label 7650 3150 0    50   ~ 0
IBUS6
Text Label 7650 3050 0    50   ~ 0
IBUS5
Text Label 7650 2950 0    50   ~ 0
IBUS4
Text Label 7650 2850 0    50   ~ 0
IBUS3
Text Label 7650 2750 0    50   ~ 0
IBUS2
Text Label 7650 2650 0    50   ~ 0
IBUS1
Text Label 7650 2550 0    50   ~ 0
IBUS0
Entry Wire Line
	8050 3150 7950 3250
Entry Wire Line
	8050 3050 7950 3150
Entry Wire Line
	8050 2950 7950 3050
Entry Wire Line
	8050 2850 7950 2950
Wire Wire Line
	7950 3250 7600 3250
Wire Wire Line
	7950 3150 7600 3150
Wire Wire Line
	7950 3050 7600 3050
Wire Wire Line
	7600 2950 7950 2950
Entry Wire Line
	8050 2750 7950 2850
Entry Wire Line
	8050 2650 7950 2750
Entry Wire Line
	8050 2550 7950 2650
Entry Wire Line
	8050 2450 7950 2550
Wire Wire Line
	7950 2850 7600 2850
Wire Wire Line
	7950 2750 7600 2750
Wire Wire Line
	7950 2650 7600 2650
Wire Wire Line
	7600 2550 7950 2550
Entry Bus Bus
	8050 2250 8150 2150
Wire Bus Line
	8150 2150 8750 2150
Text Label 8250 2150 0    50   ~ 0
IBUS[0..15]
Entry Wire Line
	2850 2550 2950 2650
Entry Wire Line
	2850 2450 2950 2550
$Comp
L alexios:74HC138 U?
U 2 1 5DEFC7D3
P 1350 7350
AR Path="/5DC89E19/5DEFC7D3" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5DEFC7D3" Ref="U?"  Part="2" 
AR Path="/5DEFC7D3" Ref="U?"  Part="2" 
AR Path="/5DF0FEB9/5DEFC7D3" Ref="U2"  Part="2" 
AR Path="/5E25A7FA/5DEFC7D3" Ref="U2"  Part="2" 
F 0 "U2" H 1530 7396 50  0000 L CNN
F 1 "74HC138" H 1530 7305 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1350 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1350 7350 50  0001 C CNN
	2    1350 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 5DEFC7D4
P 2800 7350
AR Path="/5E4DDD44/5DEFC7D4" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5DEFC7D4" Ref="U?"  Part="2" 
AR Path="/5DF0FEB9/5DEFC7D4" Ref="U1"  Part="2" 
AR Path="/5E25A7FA/5DEFC7D4" Ref="U1"  Part="2" 
F 0 "U1" H 2980 7396 50  0000 L CNN
F 1 "74AC541" H 2980 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2800 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 2800 7350 50  0001 C CNN
	2    2800 7350
	1    0    0    -1  
$EndComp
Connection ~ 1000 7250
Connection ~ 1000 7450
Connection ~ 2450 7250
Connection ~ 2450 7450
$Comp
L Device:C_Small C?
U 1 1 5E8B296C
P 3900 7350
AR Path="/5CC0D65F/5E8B296C" Ref="C?"  Part="1" 
AR Path="/5E8B296C" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5E8B296C" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5E8B296C" Ref="C?"  Part="1" 
AR Path="/5DF0FEB9/5E8B296C" Ref="C5"  Part="1" 
AR Path="/5E25A7FA/5E8B296C" Ref="C5"  Part="1" 
F 0 "C5" H 3809 7396 50  0000 R CNN
F 1 "100nF" H 3809 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 7350 50  0001 C CNN
F 3 "~" H 3900 7350 50  0001 C CNN
	1    3900 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E8B2972
P 3900 7450
AR Path="/5E4DDD44/5E8B2972" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E8B2972" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEB9/5E8B2972" Ref="#PWR016"  Part="1" 
AR Path="/5E25A7FA/5E8B2972" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 3900 7200 50  0001 C CNN
F 1 "GND" H 3905 7277 50  0000 C CNN
F 2 "" H 3900 7450 50  0001 C CNN
F 3 "" H 3900 7450 50  0001 C CNN
	1    3900 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E8B2978
P 3900 7250
AR Path="/5E4DDD44/5E8B2978" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E8B2978" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEB9/5E8B2978" Ref="#PWR013"  Part="1" 
AR Path="/5E25A7FA/5E8B2978" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 3900 7100 50  0001 C CNN
F 1 "+5V" H 3915 7423 50  0000 C CNN
F 2 "" H 3900 7250 50  0001 C CNN
F 3 "" H 3900 7250 50  0001 C CNN
	1    3900 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 5E8B297E
P 4250 7350
AR Path="/5E4DDD44/5E8B297E" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5E8B297E" Ref="U?"  Part="2" 
AR Path="/5DF0FEB9/5E8B297E" Ref="U3"  Part="2" 
AR Path="/5E25A7FA/5E8B297E" Ref="U3"  Part="2" 
F 0 "U3" H 4430 7396 50  0000 L CNN
F 1 "74AC541" H 4430 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4250 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 4250 7350 50  0001 C CNN
	2    4250 7350
	1    0    0    -1  
$EndComp
Connection ~ 3900 7250
Connection ~ 3900 7450
NoConn ~ 4750 4100
NoConn ~ 4750 4300
NoConn ~ 4750 4400
NoConn ~ 4750 4500
NoConn ~ 4750 4600
NoConn ~ 4750 4700
NoConn ~ 4750 4800
Text Notes 4000 6200 0    50   ~ 0
~RUEN~\n\n  1\n  0\n  0\n  0\n  0\n  0\n  0\n  0
Text Notes 4250 6200 0    50   ~ 0
RADDR\n\nXXXXX\n1XXXX\nX1XXX\nXX0XX\n00100\n00101\n00110\n00111
Wire Wire Line
	6050 3450 6050 4200
Wire Notes Line width 20 style solid
	3950 5350 5500 5350
Wire Notes Line width 20 style solid
	3950 6250 3950 5350
Wire Notes Line style solid
	3950 5500 5500 5500
Wire Notes Line width 20 style solid
	5500 6250 3950 6250
Wire Notes Line
	4550 5350 4550 6250
Wire Notes Line width 20 style solid
	5500 6250 5500 5350
Text HLabel 8750 2150 2    50   BiDi ~ 0
IBUS[0..15]
Text Notes 8350 6350 0    50   ~ 0
The constant store now needs to emit just three constants:\n0000, 0002 and 0003. We get 0001 for free because of the\ncombinational wiring. All of these are used as vector\naddresses, so it would be easy to change them to e.g.\n0000, 0001, 0008 and 0009 by moving the wiring around.\n\nUnlike the previous design, ~RSTHOLD~ does not drive the\nIBUS with a constant. The Reset microprogram is responsible\nfor that, and this is now possible because the Reset Vector\nis 0000 and it can be issued without wiring magic like on the\nprevious design.
Text Notes 8350 5300 0    63   ~ 13
2019 Design Update
Text Label 3050 2550 0    50   ~ 0
RADDR0
Text Label 3050 2650 0    50   ~ 0
RADDR1
Text Notes 4600 6200 0    50   ~ 0
Output to IBUS\n\nHigh Impendance\nHigh Impendance\nHigh Impendance\nHigh Impendance\n0000'0000'0000'0000\n0000'0000'0000'0001\n0000'0000'0000'0010\n0000'0000'0000'0011\n
Wire Wire Line
	6050 3450 6600 3450
Wire Wire Line
	6050 5000 6600 5000
$Comp
L power:GND #PWR0141
U 1 1 5DEFC7BA
P 6500 3550
F 0 "#PWR0141" H 6500 3300 50  0001 C CNN
F 1 "GND" H 6505 3377 50  0000 C CNN
F 2 "" H 6500 3550 50  0001 C CNN
F 3 "" H 6500 3550 50  0001 C CNN
	1    6500 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0142
U 1 1 5DEFC7BB
P 6500 5100
F 0 "#PWR0142" H 6500 4850 50  0001 C CNN
F 1 "GND" H 6505 4927 50  0000 C CNN
F 2 "" H 6500 5100 50  0001 C CNN
F 3 "" H 6500 5100 50  0001 C CNN
	1    6500 5100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 5E56A57B
P 4250 4500
AR Path="/5DC89E19/5E56A57B" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5E56A57B" Ref="U?"  Part="1" 
AR Path="/5E56A57B" Ref="U?"  Part="1" 
AR Path="/5DF0FEB9/5E56A57B" Ref="U2"  Part="1" 
AR Path="/5E25A7FA/5E56A57B" Ref="U2"  Part="1" 
F 0 "U2" H 4250 5167 50  0000 C CNN
F 1 "74HC138" H 4250 5076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4250 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4250 4500 50  0001 C CNN
	1    4250 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4200 2950 4200
Text Label 3250 4200 2    50   ~ 0
RADDR3
Entry Wire Line
	2850 4100 2950 4200
Wire Wire Line
	3750 4300 2950 4300
Text Label 3250 4300 2    50   ~ 0
RADDR4
Entry Wire Line
	2850 4200 2950 4300
$Comp
L power:+5V #PWR0143
U 1 1 5E03D7B4
P 3750 4700
F 0 "#PWR0143" H 3750 4550 50  0001 C CNN
F 1 "+5V" H 3765 4873 50  0000 C CNN
F 2 "" H 3750 4700 50  0001 C CNN
F 3 "" H 3750 4700 50  0001 C CNN
	1    3750 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 5E040054
P 3750 4900
F 0 "#PWR0144" H 3750 4650 50  0001 C CNN
F 1 "GND" H 3755 4727 50  0000 C CNN
F 2 "" H 3750 4900 50  0001 C CNN
F 3 "" H 3750 4900 50  0001 C CNN
	1    3750 4900
	1    0    0    -1  
$EndComp
Wire Notes Line width 20 style solid
	8200 6550 8200 5050
Wire Notes Line width 20 style solid
	10950 6550 8200 6550
Wire Notes Line width 20 style solid
	10950 5050 10950 6550
Wire Notes Line width 20 style solid
	8200 5050 10950 5050
Connection ~ 6050 4200
Wire Wire Line
	6050 4200 6050 5000
Wire Wire Line
	4750 4200 6050 4200
Wire Wire Line
	2950 2550 6600 2550
Wire Wire Line
	2950 2650 6600 2650
Wire Bus Line
	2850 2350 2850 4200
Wire Bus Line
	8050 2250 8050 4700
$EndSCHEMATC
