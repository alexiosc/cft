EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 17
Title "Constant Store"
Date ""
Rev "2023"
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
AR Path="/5DF0FEB9/5E51C06B" Ref="#PWR?"  Part="1" 
AR Path="/5E25A7FA/5E51C06B" Ref="#PWR0508"  Part="1" 
F 0 "#PWR0508" H 1000 7100 50  0001 C CNN
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
AR Path="/5DF0FEB9/5E51C071" Ref="#PWR?"  Part="1" 
AR Path="/5E25A7FA/5E51C071" Ref="#PWR0511"  Part="1" 
F 0 "#PWR0511" H 1000 7200 50  0001 C CNN
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
AR Path="/5DF0FEB9/5E51C077" Ref="C?"  Part="1" 
AR Path="/5E25A7FA/5E51C077" Ref="C501"  Part="1" 
F 0 "C501" H 909 7396 50  0000 R CNN
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
AR Path="/5DF0FEB9/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5E25A7FA/5E51C0B5" Ref="C502"  Part="1" 
F 0 "C502" H 2359 7396 50  0000 R CNN
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
AR Path="/5DF0FEB9/5E51C0BB" Ref="#PWR?"  Part="1" 
AR Path="/5E25A7FA/5E51C0BB" Ref="#PWR0512"  Part="1" 
F 0 "#PWR0512" H 2450 7200 50  0001 C CNN
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
AR Path="/5DF0FEB9/5E51C0C1" Ref="#PWR?"  Part="1" 
AR Path="/5E25A7FA/5E51C0C1" Ref="#PWR0509"  Part="1" 
F 0 "#PWR0509" H 2450 7100 50  0001 C CNN
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
AR Path="/5DF0FEB9/5E55BF66" Ref="U?"  Part="1" 
AR Path="/5E25A7FA/5E55BF66" Ref="U501"  Part="1" 
F 0 "U501" H 7100 3817 50  0000 C CNN
F 1 "74AC541" H 7100 3726 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7100 3050 50  0001 C CNN
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
AR Path="/5DF0FEB9/5E55BF6C" Ref="U?"  Part="1" 
AR Path="/5E25A7FA/5E55BF6C" Ref="U503"  Part="1" 
F 0 "U503" H 7100 5367 50  0000 C CNN
F 1 "74AC541" H 7100 5276 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7100 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 7100 4600 50  0001 C CNN
	1    7100 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4100 2950 4100
Text Label 3300 4100 2    50   ~ 0
RADDR2
Entry Wire Line
	2850 4000 2950 4100
Entry Bus Bus
	2750 2250 2850 2350
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
L power:GND #PWR0501
U 1 1 5DEFC7D1
P 6500 3250
F 0 "#PWR0501" H 6500 3000 50  0001 C CNN
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
L power:GND #PWR0504
U 1 1 5DEFC7D2
P 6500 4800
F 0 "#PWR0504" H 6500 4550 50  0001 C CNN
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
AR Path="/5DF0FEB9/5DEFC7D3" Ref="U?"  Part="2" 
AR Path="/5E25A7FA/5DEFC7D3" Ref="U502"  Part="2" 
F 0 "U502" H 1530 7396 50  0000 L CNN
F 1 "74HC138" H 1530 7305 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 1350 7350 50  0001 C CNN
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
AR Path="/5DF0FEB9/5DEFC7D4" Ref="U?"  Part="2" 
AR Path="/5E25A7FA/5DEFC7D4" Ref="U501"  Part="2" 
F 0 "U501" H 2980 7396 50  0000 L CNN
F 1 "74AC541" H 2980 7305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2800 7350 50  0001 C CNN
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
AR Path="/5DF0FEB9/5E8B296C" Ref="C?"  Part="1" 
AR Path="/5E25A7FA/5E8B296C" Ref="C503"  Part="1" 
F 0 "C503" H 3809 7396 50  0000 R CNN
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
AR Path="/5DF0FEB9/5E8B2972" Ref="#PWR?"  Part="1" 
AR Path="/5E25A7FA/5E8B2972" Ref="#PWR0513"  Part="1" 
F 0 "#PWR0513" H 3900 7200 50  0001 C CNN
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
AR Path="/5DF0FEB9/5E8B2978" Ref="#PWR?"  Part="1" 
AR Path="/5E25A7FA/5E8B2978" Ref="#PWR0510"  Part="1" 
F 0 "#PWR0510" H 3900 7100 50  0001 C CNN
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
AR Path="/5DF0FEB9/5E8B297E" Ref="U?"  Part="2" 
AR Path="/5E25A7FA/5E8B297E" Ref="U503"  Part="2" 
F 0 "U503" H 4430 7396 50  0000 L CNN
F 1 "74AC541" H 4430 7305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4250 7350 50  0001 C CNN
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
Text Notes 4350 6150 0    50   ~ 0
RADDR\n\nXXXXX\n1XXXX\nX1XXX\nXX0XX\n00100\n00101\n00110\n00111
Wire Wire Line
	6050 3450 6050 4200
Wire Notes Line width 20 style solid
	4300 5300 5600 5300
Wire Notes Line width 20 style solid
	4300 6200 4300 5300
Wire Notes Line style solid
	4300 5450 5600 5450
Wire Notes Line width 20 style solid
	5600 6200 4300 6200
Wire Notes Line
	4650 5300 4650 6200
Wire Notes Line width 20 style solid
	5600 6200 5600 5300
Text HLabel 8750 2150 2    50   BiDi ~ 0
IBUS[0..15]
Text Notes 1100 1900 0    50   ~ 0
The new constant store needs to emit just three constants: 0000, 0002 and 0003.\nWe get 0001 for free because of the combinational wiring. All of these are used\nas vector addresses, so it would be easy to change them to e.g. 0000, 0001, 0008\nand 0009 by moving the wiring around.\n\nUnlike the previous design, ~RSTHOLD~ does not drive the IBUS with a constant.\nThe Reset microprogram is responsible for that, and this is now possible because\nthe Reset Vector is 0000 and it can be issued without wiring magic like on the\nprevious design.
Text Label 3050 2550 0    50   ~ 0
RADDR0
Text Label 3050 2650 0    50   ~ 0
RADDR1
Text Notes 4700 6150 0    50   ~ 0
Output to IBUS\n\nHigh Impendance\nHigh Impendance\nHigh Impendance\nHigh Impendance\n0000'0000'0000'0000\n0000'0000'0000'0001\n0000'0000'0000'0010\n0000'0000'0000'0011\n
Wire Wire Line
	6050 3450 6600 3450
Wire Wire Line
	6050 5000 6600 5000
$Comp
L power:GND #PWR0502
U 1 1 5DEFC7BA
P 6500 3550
F 0 "#PWR0502" H 6500 3300 50  0001 C CNN
F 1 "GND" H 6505 3377 50  0000 C CNN
F 2 "" H 6500 3550 50  0001 C CNN
F 3 "" H 6500 3550 50  0001 C CNN
	1    6500 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0507
U 1 1 5DEFC7BB
P 6500 5100
F 0 "#PWR0507" H 6500 4850 50  0001 C CNN
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
AR Path="/5DF0FEB9/5E56A57B" Ref="U?"  Part="1" 
AR Path="/5E25A7FA/5E56A57B" Ref="U502"  Part="1" 
F 0 "U502" H 4250 5167 50  0000 C CNN
F 1 "74HC138" H 4250 5076 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 4250 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4250 4500 50  0001 C CNN
	1    4250 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4200 2950 4200
Text Label 3300 4200 2    50   ~ 0
RADDR3
Entry Wire Line
	2850 4100 2950 4200
Wire Wire Line
	3750 4300 2950 4300
Text Label 3300 4300 2    50   ~ 0
RADDR4
Entry Wire Line
	2850 4200 2950 4300
$Comp
L power:+5V #PWR0503
U 1 1 5E03D7B4
P 3750 4700
F 0 "#PWR0503" H 3750 4550 50  0001 C CNN
F 1 "+5V" H 3765 4873 50  0000 C CNN
F 2 "" H 3750 4700 50  0001 C CNN
F 3 "" H 3750 4700 50  0001 C CNN
	1    3750 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0506
U 1 1 5E040054
P 3700 5100
F 0 "#PWR0506" H 3700 4850 50  0001 C CNN
F 1 "GND" H 3705 4927 50  0000 C CNN
F 2 "" H 3700 5100 50  0001 C CNN
F 3 "" H 3700 5100 50  0001 C CNN
	1    3700 5100
	1    0    0    -1  
$EndComp
Connection ~ 6050 4200
Wire Wire Line
	6050 4200 6050 5000
Wire Wire Line
	4750 4200 6050 4200
Wire Wire Line
	2950 2550 6600 2550
Wire Wire Line
	2950 2650 6600 2650
Wire Wire Line
	3750 4900 3700 4900
Wire Wire Line
	3700 4900 3700 5100
$Comp
L power:GND #PWR0505
U 1 1 5FDB5419
P 3050 4850
F 0 "#PWR0505" H 3050 4600 50  0001 C CNN
F 1 "GND" H 3055 4677 50  0000 C CNN
F 2 "" H 3050 4850 50  0001 C CNN
F 3 "" H 3050 4850 50  0001 C CNN
	1    3050 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4800 3050 4850
Text Label 3450 4800 0    50   ~ 0
~CSEN
Wire Wire Line
	3400 4800 3750 4800
Text Notes 1100 1050 0    100  ~ 20
The Constant Store
$Comp
L Jumper:SolderJumper_2_Bridged JP501
U 1 1 5F93915C
P 3250 4800
F 0 "JP501" H 3250 5005 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 3250 4914 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 3250 4800 50  0001 C CNN
F 3 "~" H 3250 4800 50  0001 C CNN
	1    3250 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4800 3050 4800
Text Label 2450 4700 2    50   ~ 0
T34
Text HLabel 2150 4700 0    50   Input ~ 0
T34
Wire Wire Line
	2150 4700 2450 4700
Wire Notes Line
	2500 4700 3400 4700
Wire Notes Line
	3400 4700 3400 4750
Text Notes 2250 5350 0    50   ~ 0
For testing, T34 may be\nconnected to ~CSEN~, or JP1\ncan be bridged to ground.
Wire Bus Line
	2850 2350 2850 4200
Wire Bus Line
	8050 2250 8050 4700
$EndSCHEMATC
