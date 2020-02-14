EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 12
Title "Constant Store"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "constant_store.v"
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 5E51C06B
P 1000 7250
AR Path="/5E4DDD44/5E51C06B" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C06B" Ref="#PWR0138"  Part="1" 
AR Path="/5DF0FEB9/5E51C06B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0138" H 1000 7100 50  0001 C CNN
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
AR Path="/5E507DE3/5E51C071" Ref="#PWR0139"  Part="1" 
AR Path="/5DF0FEB9/5E51C071" Ref="#PWR?"  Part="1" 
F 0 "#PWR0139" H 1000 7200 50  0001 C CNN
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
AR Path="/5E507DE3/5E51C077" Ref="C20"  Part="1" 
AR Path="/5DF0FEB9/5E51C077" Ref="C?"  Part="1" 
F 0 "C20" H 909 7396 50  0000 R CNN
F 1 "100nF" H 909 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1000 7350 50  0001 C CNN
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
AR Path="/5E507DE3/5E51C0B5" Ref="C21"  Part="1" 
AR Path="/5DF0FEB9/5E51C0B5" Ref="C?"  Part="1" 
F 0 "C21" H 2359 7396 50  0000 R CNN
F 1 "100nF" H 2359 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2450 7350 50  0001 C CNN
F 3 "~" H 2450 7350 50  0001 C CNN
	1    2450 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E51C0BB
P 2450 7450
AR Path="/5E4DDD44/5E51C0BB" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E51C0BB" Ref="#PWR0140"  Part="1" 
AR Path="/5DF0FEB9/5E51C0BB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0140" H 2450 7200 50  0001 C CNN
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
AR Path="/5E507DE3/5E51C0C1" Ref="#PWR0153"  Part="1" 
AR Path="/5DF0FEB9/5E51C0C1" Ref="#PWR?"  Part="1" 
F 0 "#PWR0153" H 2450 7100 50  0001 C CNN
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
AR Path="/5E507DE3/5E55BF66" Ref="U25"  Part="1" 
AR Path="/5DF0FEB9/5E55BF66" Ref="U?"  Part="1" 
F 0 "U25" H 7100 3817 50  0000 C CNN
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
AR Path="/5E507DE3/5E55BF6C" Ref="U26"  Part="1" 
AR Path="/5DF0FEB9/5E55BF6C" Ref="U?"  Part="1" 
F 0 "U26" H 7100 5367 50  0000 C CNN
F 1 "74AC541" H 7100 5276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7100 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 7100 4600 50  0001 C CNN
	1    7100 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3350 2950 3350
Text Label 3250 3350 2    50   ~ 0
RADDR2
Entry Wire Line
	2850 3250 2950 3350
Entry Bus Bus
	2750 2150 2850 2250
Text Label 2250 2150 0    50   ~ 0
RADDR[0..4]
Text HLabel 2150 2150 0    50   Input ~ 0
RADDR[0..4]
Wire Bus Line
	2750 2150 2150 2150
Text Notes 4300 3950 1    50   ~ 10
RADDR=001xx
Text Label 6450 3450 2    50   ~ 0
~CSOE
Text Label 6450 5000 2    50   ~ 0
~CSOE
Wire Wire Line
	6600 2750 6550 2750
Wire Wire Line
	6550 2750 6550 2850
Wire Wire Line
	6600 3250 6550 3250
Wire Wire Line
	6600 3150 6550 3150
Connection ~ 6550 3150
Wire Wire Line
	6550 3150 6550 3250
Wire Wire Line
	6600 3050 6550 3050
Connection ~ 6550 3050
Wire Wire Line
	6550 3050 6550 3150
Wire Wire Line
	6600 2950 6550 2950
Connection ~ 6550 2950
Wire Wire Line
	6550 2950 6550 3050
Wire Wire Line
	6600 2850 6550 2850
Connection ~ 6550 2850
Wire Wire Line
	6550 2850 6550 2950
Wire Wire Line
	6550 4100 6600 4100
Wire Wire Line
	6600 4200 6550 4200
Connection ~ 6550 4200
Wire Wire Line
	6550 4200 6550 4100
Wire Wire Line
	6600 4300 6550 4300
Connection ~ 6550 4300
Wire Wire Line
	6550 4300 6550 4200
Wire Wire Line
	6600 4400 6550 4400
Connection ~ 6550 4400
Wire Wire Line
	6550 4400 6550 4300
Wire Wire Line
	6600 4500 6550 4500
Connection ~ 6550 4500
Wire Wire Line
	6550 4500 6550 4400
Wire Wire Line
	6550 4600 6600 4600
Connection ~ 6550 4600
Wire Wire Line
	6550 4600 6550 4500
Wire Wire Line
	6600 4700 6550 4700
Connection ~ 6550 4700
Wire Wire Line
	6550 4700 6550 4600
Wire Wire Line
	6550 4800 6550 4700
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
AR Path="/5E507DE3/5DEFC7D3" Ref="U24"  Part="2" 
AR Path="/5DEFC7D3" Ref="U?"  Part="2" 
AR Path="/5DF0FEB9/5DEFC7D3" Ref="U?"  Part="2" 
F 0 "U24" H 1530 7396 50  0000 L CNN
F 1 "74HC138" H 1530 7305 50  0000 L CNN
F 2 "alexios:SOIC-14" H 1350 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1350 7350 50  0001 C CNN
	2    1350 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 5DEFC7D4
P 2800 7350
AR Path="/5E4DDD44/5DEFC7D4" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5DEFC7D4" Ref="U25"  Part="2" 
AR Path="/5DF0FEB9/5DEFC7D4" Ref="U?"  Part="2" 
F 0 "U25" H 2980 7396 50  0000 L CNN
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
AR Path="/5E507DE3/5E8B296C" Ref="C22"  Part="1" 
AR Path="/5DF0FEB9/5E8B296C" Ref="C?"  Part="1" 
F 0 "C22" H 3809 7396 50  0000 R CNN
F 1 "100nF" H 3809 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3900 7350 50  0001 C CNN
F 3 "~" H 3900 7350 50  0001 C CNN
	1    3900 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E8B2972
P 3900 7450
AR Path="/5E4DDD44/5E8B2972" Ref="#PWR?"  Part="1" 
AR Path="/5E507DE3/5E8B2972" Ref="#PWR0156"  Part="1" 
AR Path="/5DF0FEB9/5E8B2972" Ref="#PWR?"  Part="1" 
F 0 "#PWR0156" H 3900 7200 50  0001 C CNN
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
AR Path="/5E507DE3/5E8B2978" Ref="#PWR0157"  Part="1" 
AR Path="/5DF0FEB9/5E8B2978" Ref="#PWR?"  Part="1" 
F 0 "#PWR0157" H 3900 7100 50  0001 C CNN
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
AR Path="/5E507DE3/5E8B297E" Ref="U26"  Part="2" 
AR Path="/5DF0FEB9/5E8B297E" Ref="U?"  Part="2" 
F 0 "U26" H 4430 7396 50  0000 L CNN
F 1 "74AC541" H 4430 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4250 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74AC541" H 4250 7350 50  0001 C CNN
	2    4250 7350
	1    0    0    -1  
$EndComp
Connection ~ 3900 7250
Connection ~ 3900 7450
NoConn ~ 4750 3350
NoConn ~ 4750 3550
NoConn ~ 4750 3650
NoConn ~ 4750 3750
NoConn ~ 4750 3850
NoConn ~ 4750 3950
NoConn ~ 4750 4050
Text Notes 4050 5250 0    50   ~ 0
RADDR\n\nXXXXX\n0XXXX\n10XXX\n11000\n11001\n11010\n11011\n111XX
Wire Wire Line
	6050 3450 6050 5000
Wire Notes Line width 20 style solid
	3950 4400 5300 4400
Wire Notes Line width 20 style solid
	3950 5300 3950 4400
Wire Notes Line style solid
	3950 4550 5300 4550
Wire Notes Line width 20 style solid
	5300 5300 3950 5300
Wire Notes Line
	4350 4400 4350 5300
Wire Notes Line width 20 style solid
	5300 5300 5300 4400
Text HLabel 8750 2150 2    50   BiDi ~ 0
IBUS[0..15]
Text Notes 8700 6000 0    50   ~ 0
The constant store now needs to emit just three constants:\n0000, 0002 and 0003. We get 0001 for free because of the\ncombinational wiring. All of these are used as vector\naddresses, so it would be easy to change them to e.g.\n0000, 0001, 0008 and 0009 by moving the wiring around.\n\nUnlike the previous design, ~RSTHOLD~ does not drive the\nIBUS with a constant. The Reset microprogram is responsible\nfor that, and this is now possible because the Reset Vector\nis 0000 and it can be issues without wiring magic like on the\nprevious design.
Text Notes 8700 4950 0    63   ~ 13
2019 Design Update
Connection ~ 6050 3450
Text Label 3000 2550 0    50   ~ 0
RADDR0
Text Label 3000 2650 0    50   ~ 0
RADDR1
Text Notes 4400 5250 0    50   ~ 0
Output\n\nHigh Impendance\nHigh Impendance\nHigh Impendance\n0000'0000'0000'0000\n0000'0000'0000'0001\n0000'0000'0000'0010\n0000'0000'0000'0011\nHigh Impendance
Wire Wire Line
	6050 3450 6600 3450
Wire Wire Line
	6050 5000 6600 5000
$Comp
L power:GND #PWR0159
U 1 1 5DEFC7BB
P 6550 5150
F 0 "#PWR0159" H 6550 4900 50  0001 C CNN
F 1 "GND" H 6555 4977 50  0000 C CNN
F 2 "" H 6550 5150 50  0001 C CNN
F 3 "" H 6550 5150 50  0001 C CNN
	1    6550 5150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 5E56A57B
P 4250 3750
AR Path="/5DC89E19/5E56A57B" Ref="U?"  Part="1" 
AR Path="/5E507DE3/5E56A57B" Ref="U24"  Part="1" 
AR Path="/5E56A57B" Ref="U?"  Part="1" 
AR Path="/5DF0FEB9/5E56A57B" Ref="U?"  Part="1" 
F 0 "U24" H 4250 4417 50  0000 C CNN
F 1 "74HC138" H 4250 4326 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4250 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4250 3750 50  0001 C CNN
	1    4250 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3450 2950 3450
Text Label 3250 3450 2    50   ~ 0
RADDR3
Entry Wire Line
	2850 3350 2950 3450
Wire Wire Line
	3750 3550 2950 3550
Text Label 3250 3550 2    50   ~ 0
RADDR4
Entry Wire Line
	2850 3450 2950 3550
$Comp
L power:GND #PWR0161
U 1 1 5E040054
P 3700 4200
F 0 "#PWR0161" H 3700 3950 50  0001 C CNN
F 1 "GND" H 3705 4027 50  0000 C CNN
F 2 "" H 3700 4200 50  0001 C CNN
F 3 "" H 3700 4200 50  0001 C CNN
	1    3700 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4050 3700 4050
Wire Wire Line
	3700 4050 3700 4150
Wire Wire Line
	3750 4150 3700 4150
Connection ~ 3700 4150
Wire Wire Line
	3700 4150 3700 4200
$Comp
L power:+5V #PWR?
U 1 1 60F94276
P 3700 3900
F 0 "#PWR?" H 3700 3750 50  0001 C CNN
F 1 "+5V" H 3715 4073 50  0000 C CNN
F 2 "" H 3700 3900 50  0001 C CNN
F 3 "" H 3700 3900 50  0001 C CNN
	1    3700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3900 3700 3950
Wire Wire Line
	3700 3950 3750 3950
Text Notes 5400 3550 2    50   ~ 0
RADDR=001XX
Text Label 4850 3450 0    50   ~ 0
~CSOE
Wire Wire Line
	4750 3450 6050 3450
Wire Wire Line
	2950 2650 6600 2650
Wire Wire Line
	2950 2550 6600 2550
Wire Wire Line
	6600 3550 6550 3550
Wire Wire Line
	6600 5100 6550 5100
Wire Wire Line
	6550 5100 6550 5150
Wire Wire Line
	6600 4800 6550 4800
Wire Wire Line
	6550 4800 6550 5100
Connection ~ 6550 4800
Connection ~ 6550 5100
Wire Wire Line
	6550 3250 6550 3550
Connection ~ 6550 3250
Connection ~ 6550 3550
Wire Wire Line
	6550 3550 6550 3600
Wire Bus Line
	8050 2250 8050 4700
Wire Bus Line
	2850 2250 2850 3450
$Comp
L power:GND #PWR0158
U 1 1 5DEFC7BA
P 6550 3600
F 0 "#PWR0158" H 6550 3350 50  0001 C CNN
F 1 "GND" H 6555 3427 50  0000 C CNN
F 2 "" H 6550 3600 50  0001 C CNN
F 3 "" H 6550 3600 50  0001 C CNN
	1    6550 3600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
