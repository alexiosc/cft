EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 17
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
L Device:C_Small C?
U 1 1 5E51C0B5
P 2450 7350
AR Path="/5CC0D65F/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5E507DE3/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5DF0FEB9/5E51C0B5" Ref="C?"  Part="1" 
AR Path="/5E25A7FA/5E51C0B5" Ref="C501"  Part="1" 
F 0 "C501" H 2359 7396 50  0000 R CNN
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
P 6100 3550
AR Path="/5E4DDD44/5E55BF66" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5E55BF66" Ref="U?"  Part="1" 
AR Path="/5DF0FEB9/5E55BF66" Ref="U?"  Part="1" 
AR Path="/5E25A7FA/5E55BF66" Ref="U501"  Part="1" 
F 0 "U501" H 6100 4317 50  0000 C CNN
F 1 "74AC541" H 6100 4226 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6100 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 6100 3550 50  0001 C CNN
	1    6100 3550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 1 1 5E55BF6C
P 6100 5100
AR Path="/5E4DDD44/5E55BF6C" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5E55BF6C" Ref="U?"  Part="1" 
AR Path="/5DF0FEB9/5E55BF6C" Ref="U?"  Part="1" 
AR Path="/5E25A7FA/5E55BF6C" Ref="U503"  Part="1" 
F 0 "U503" H 6100 5867 50  0000 C CNN
F 1 "74AC541" H 6100 5776 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6100 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 6100 5100 50  0001 C CNN
	1    6100 5100
	1    0    0    -1  
$EndComp
Entry Bus Bus
	4000 2750 4100 2850
Text Label 3500 2750 0    50   ~ 0
RADDR[0..1]
Text HLabel 3400 2750 0    50   Input ~ 0
RADDR[0..1]
Wire Bus Line
	4000 2750 3400 2750
Text Label 3500 3950 0    50   ~ 0
~READ-CS
Text Notes 4050 4050 2    50   ~ 0
RADDR=001XX
Text Label 5450 3950 2    50   ~ 0
~READ-CS
Wire Wire Line
	5500 4050 5600 4050
Text Label 5450 5500 2    50   ~ 0
~READ-CS
Wire Wire Line
	5500 5600 5600 5600
Wire Wire Line
	5600 3250 5500 3250
Wire Wire Line
	5500 3250 5500 3350
$Comp
L power:GND #PWR0501
U 1 1 5DEFC7D1
P 5500 3750
F 0 "#PWR0501" H 5500 3500 50  0001 C CNN
F 1 "GND" H 5350 3750 50  0000 C CNN
F 2 "" H 5500 3750 50  0001 C CNN
F 3 "" H 5500 3750 50  0001 C CNN
	1    5500 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3750 5500 3750
Connection ~ 5500 3750
Wire Wire Line
	5600 3650 5500 3650
Connection ~ 5500 3650
Wire Wire Line
	5500 3650 5500 3750
Wire Wire Line
	5600 3550 5500 3550
Connection ~ 5500 3550
Wire Wire Line
	5500 3550 5500 3650
Wire Wire Line
	5600 3450 5500 3450
Connection ~ 5500 3450
Wire Wire Line
	5500 3450 5500 3550
Wire Wire Line
	5600 3350 5500 3350
Connection ~ 5500 3350
Wire Wire Line
	5500 3350 5500 3450
$Comp
L power:GND #PWR0504
U 1 1 5DEFC7D2
P 5500 5300
F 0 "#PWR0504" H 5500 5050 50  0001 C CNN
F 1 "GND" H 5350 5300 50  0000 C CNN
F 2 "" H 5500 5300 50  0001 C CNN
F 3 "" H 5500 5300 50  0001 C CNN
	1    5500 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4600 5600 4600
Wire Wire Line
	5600 4700 5500 4700
Connection ~ 5500 4700
Wire Wire Line
	5500 4700 5500 4600
Wire Wire Line
	5600 4800 5500 4800
Connection ~ 5500 4800
Wire Wire Line
	5500 4800 5500 4700
Wire Wire Line
	5600 4900 5500 4900
Connection ~ 5500 4900
Wire Wire Line
	5500 4900 5500 4800
Wire Wire Line
	5600 5000 5500 5000
Connection ~ 5500 5000
Wire Wire Line
	5500 5000 5500 4900
Wire Wire Line
	5500 5100 5600 5100
Connection ~ 5500 5100
Wire Wire Line
	5500 5100 5500 5000
Wire Wire Line
	5600 5200 5500 5200
Connection ~ 5500 5200
Wire Wire Line
	5500 5200 5500 5100
Wire Wire Line
	5500 5300 5600 5300
Connection ~ 5500 5300
Wire Wire Line
	5500 5300 5500 5200
Text Label 5450 3050 2    50   ~ 0
RADDR0
Text Label 5450 3150 2    50   ~ 0
RADDR1
Text Label 7050 4300 1    50   ~ 0
IBUS[0..15]
Text Label 6650 5300 0    50   ~ 0
IBUS15
Text Label 6650 5200 0    50   ~ 0
IBUS14
Text Label 6650 5100 0    50   ~ 0
IBUS13
Text Label 6650 5000 0    50   ~ 0
IBUS12
Text Label 6650 4900 0    50   ~ 0
IBUS11
Text Label 6650 4800 0    50   ~ 0
IBUS10
Text Label 6650 4700 0    50   ~ 0
IBUS9
Text Label 6650 4600 0    50   ~ 0
IBUS8
Entry Wire Line
	7050 5200 6950 5300
Entry Wire Line
	7050 5100 6950 5200
Entry Wire Line
	7050 5000 6950 5100
Entry Wire Line
	7050 4900 6950 5000
Wire Wire Line
	6950 5300 6600 5300
Wire Wire Line
	6950 5200 6600 5200
Wire Wire Line
	6950 5100 6600 5100
Wire Wire Line
	6600 5000 6950 5000
Entry Wire Line
	7050 4800 6950 4900
Entry Wire Line
	7050 4700 6950 4800
Entry Wire Line
	7050 4600 6950 4700
Entry Wire Line
	7050 4500 6950 4600
Wire Wire Line
	6950 4900 6600 4900
Wire Wire Line
	6950 4800 6600 4800
Wire Wire Line
	6950 4700 6600 4700
Wire Wire Line
	6600 4600 6950 4600
Text Label 6650 3750 0    50   ~ 0
IBUS7
Text Label 6650 3650 0    50   ~ 0
IBUS6
Text Label 6650 3550 0    50   ~ 0
IBUS5
Text Label 6650 3450 0    50   ~ 0
IBUS4
Text Label 6650 3350 0    50   ~ 0
IBUS3
Text Label 6650 3250 0    50   ~ 0
IBUS2
Text Label 6650 3150 0    50   ~ 0
IBUS1
Text Label 6650 3050 0    50   ~ 0
IBUS0
Entry Wire Line
	7050 3650 6950 3750
Entry Wire Line
	7050 3550 6950 3650
Entry Wire Line
	7050 3450 6950 3550
Entry Wire Line
	7050 3350 6950 3450
Wire Wire Line
	6950 3750 6600 3750
Wire Wire Line
	6950 3650 6600 3650
Wire Wire Line
	6950 3550 6600 3550
Wire Wire Line
	6600 3450 6950 3450
Entry Wire Line
	7050 3250 6950 3350
Entry Wire Line
	7050 3150 6950 3250
Entry Wire Line
	7050 3050 6950 3150
Entry Wire Line
	7050 2950 6950 3050
Wire Wire Line
	6950 3350 6600 3350
Wire Wire Line
	6950 3250 6600 3250
Wire Wire Line
	6950 3150 6600 3150
Wire Wire Line
	6600 3050 6950 3050
Entry Bus Bus
	7050 2750 7150 2650
Wire Bus Line
	7150 2650 7750 2650
Text Label 7250 2650 0    50   ~ 0
IBUS[0..15]
Entry Wire Line
	4100 3050 4200 3150
Entry Wire Line
	4100 2950 4200 3050
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
Text Notes 3450 5250 0    50   ~ 0
RADDR\n\nXXXXX\n1XXXX\nX1XXX\nXX0XX\n00100\n00101\n00110\n00111
Wire Notes Line width 20 style solid
	3400 4400 4700 4400
Wire Notes Line width 20 style solid
	3400 5300 3400 4400
Wire Notes Line style solid
	3400 4550 4700 4550
Wire Notes Line width 20 style solid
	4700 5300 3400 5300
Wire Notes Line
	3750 4400 3750 5300
Wire Notes Line width 20 style solid
	4700 5300 4700 4400
Text HLabel 7750 2650 2    50   BiDi ~ 0
IBUS[0..15]
Text Notes 1100 1900 0    50   ~ 0
The new constant store needs to emit just three constants: 0000, 0002 and 0003.\nWe get 0001 for free because of the combinational wiring. All of these are used\nas vector addresses, so it would be easy to change them to e.g. 0000, 0001, 0008\nand 0009 by moving the wiring around.\n\nUnlike the previous design, ~RSTHOLD~ does not drive the IBUS with a constant.\nThe Reset microprogram is responsible for that, and this is now possible because\nthe Reset Vector is 0000 and it can be issued without wiring magic like on the\nprevious design.
Text Label 4300 3050 0    50   ~ 0
RADDR0
Text Label 4300 3150 0    50   ~ 0
RADDR1
Text Notes 3800 5250 0    50   ~ 0
Output to IBUS\n\nHigh Impendance\nHigh Impendance\nHigh Impendance\nHigh Impendance\n0000'0000'0000'0000\n0000'0000'0000'0001\n0000'0000'0000'0010\n0000'0000'0000'0011\n
Wire Wire Line
	5050 3950 5600 3950
Wire Wire Line
	5050 5500 5600 5500
$Comp
L power:GND #PWR0502
U 1 1 5DEFC7BA
P 5500 4050
F 0 "#PWR0502" H 5500 3800 50  0001 C CNN
F 1 "GND" H 5505 3877 50  0000 C CNN
F 2 "" H 5500 4050 50  0001 C CNN
F 3 "" H 5500 4050 50  0001 C CNN
	1    5500 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0507
U 1 1 5DEFC7BB
P 5500 5600
F 0 "#PWR0507" H 5500 5350 50  0001 C CNN
F 1 "GND" H 5505 5427 50  0000 C CNN
F 2 "" H 5500 5600 50  0001 C CNN
F 3 "" H 5500 5600 50  0001 C CNN
	1    5500 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3950 5050 3950
Wire Wire Line
	4200 3050 5600 3050
Wire Wire Line
	4200 3150 5600 3150
Text Notes 1100 1050 0    100  ~ 20
The Constant Store
Text HLabel 3400 3950 0    50   Input ~ 0
~READ-CS
Connection ~ 5050 3950
Wire Wire Line
	5050 3950 5050 5500
Wire Bus Line
	4100 2850 4100 3050
Wire Bus Line
	7050 2750 7050 5200
$EndSCHEMATC
