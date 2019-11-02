EESchema Schematic File Version 4
LIBS:cft-alu-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 9
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
U 1 1 5E1CEE11
P 7900 4350
AR Path="/5DC89E19/5E1CEE11" Ref="U?"  Part="1" 
AR Path="/5E1CEE11" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE11" Ref="U29"  Part="1" 
F 0 "U29" H 7900 5017 50  0000 C CNN
F 1 "74HC138" H 7900 4926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7900 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 7900 4350 50  0001 C CNN
	1    7900 4350
	1    0    0    -1  
$EndComp
Text Notes 7950 4600 1    50   ~ 10
WADDR=1x0xx
Wire Wire Line
	7400 4050 7050 4050
Wire Wire Line
	7400 4150 7050 4150
Wire Wire Line
	7400 4550 7050 4550
Wire Wire Line
	7400 4650 7050 4650
Entry Wire Line
	6950 4450 7050 4550
Entry Wire Line
	6950 4550 7050 4650
Wire Wire Line
	7400 3950 7050 3950
Text Label 7100 3950 0    50   ~ 0
WADDR0
Text Label 7100 4050 0    50   ~ 0
WADDR1
Text Label 7100 4150 0    50   ~ 0
WADDR3
Text Label 7100 4650 0    50   ~ 0
WADDR2
Text Label 7100 4550 0    50   ~ 0
WADDR4
Wire Wire Line
	6250 4750 7400 4750
Text HLabel 6250 4750 0    50   Input ~ 0
~WUEN
Text Label 6350 4750 0    50   ~ 0
~WUEN
NoConn ~ 8400 4050
NoConn ~ 8400 4150
NoConn ~ 8400 4250
NoConn ~ 8400 4550
NoConn ~ 8400 4650
Wire Wire Line
	8400 4350 9100 4350
Text Label 8500 4350 0    50   ~ 0
~WRITE-ALU-B
NoConn ~ 8400 3950
NoConn ~ 8400 4450
Text Label 4650 2150 2    50   ~ 0
~ROMCE
Text Notes 3550 3150 0    50   ~ 0
NOTE: Use 74AC!
NoConn ~ 4350 2650
NoConn ~ 4350 2550
NoConn ~ 4350 2450
NoConn ~ 4350 2350
NoConn ~ 4350 2250
Wire Wire Line
	3300 2350 3300 2400
Connection ~ 3300 2350
Wire Wire Line
	3350 2350 3300 2350
Wire Wire Line
	3300 2250 3300 2350
Wire Wire Line
	3300 2150 3300 2250
Connection ~ 3300 2250
Wire Wire Line
	3300 2250 3350 2250
$Comp
L power:GND #PWR?
U 1 1 5E1CEE43
P 3300 2400
AR Path="/5DC89E19/5E1CEE43" Ref="#PWR?"  Part="1" 
AR Path="/5E1CEE43" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5E1CEE43" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 3300 2150 50  0001 C CNN
F 1 "GND" H 3305 2227 50  0000 C CNN
F 2 "" H 3300 2400 50  0001 C CNN
F 3 "" H 3300 2400 50  0001 C CNN
	1    3300 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2150 3300 2150
Text Notes 3900 2800 1    50   ~ 10
RADDR=10xxx
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE4B
P 3850 2550
AR Path="/5DC89E19/5E1CEE4B" Ref="U?"  Part="1" 
AR Path="/5E1CEE4B" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE4B" Ref="U26"  Part="1" 
F 0 "U26" H 3850 3217 50  0000 C CNN
F 1 "74AC138" H 3850 3126 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3850 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 2550 50  0001 C CNN
	1    3850 2550
	1    0    0    -1  
$EndComp
NoConn ~ 4350 2750
NoConn ~ 4350 2850
Entry Wire Line
	2900 2750 3000 2850
Entry Wire Line
	2900 2650 3000 2750
Text Label 3050 2950 0    50   ~ 0
~RUEN
Text Label 3050 2850 0    50   ~ 0
RADDR3
Text Label 3050 2750 0    50   ~ 0
RADDR4
Wire Wire Line
	3350 2850 3000 2850
Wire Wire Line
	3350 2750 3000 2750
Entry Bus Bus
	2800 2400 2900 2500
Text Label 2300 2400 0    50   ~ 0
RADDR[0..4]
Text HLabel 2200 2400 0    50   Input ~ 0
RADDR[0..4]
Wire Bus Line
	2800 2400 2200 2400
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE72
P 3850 4350
AR Path="/5DC89E19/5E1CEE72" Ref="U?"  Part="1" 
AR Path="/5E1CEE72" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE72" Ref="U28"  Part="1" 
F 0 "U28" H 3850 5017 50  0000 C CNN
F 1 "74HC138" H 3850 4926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3850 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 4350 50  0001 C CNN
	1    3850 4350
	1    0    0    -1  
$EndComp
Text Notes 3900 4600 1    50   ~ 10
RADDR=1x0xx
Wire Wire Line
	3350 4050 3000 4050
Wire Wire Line
	3350 4150 3000 4150
Wire Wire Line
	3350 4550 3000 4550
Wire Wire Line
	3350 4650 3000 4650
Entry Wire Line
	2900 3850 3000 3950
Entry Wire Line
	2900 3950 3000 4050
Entry Wire Line
	2900 4050 3000 4150
Entry Wire Line
	2900 4450 3000 4550
Entry Wire Line
	2900 4550 3000 4650
Wire Wire Line
	3350 3950 3000 3950
Text Label 3050 3950 0    50   ~ 0
RADDR0
Text Label 3050 4050 0    50   ~ 0
RADDR1
Text Label 3050 4150 0    50   ~ 0
RADDR3
Text Label 3050 4650 0    50   ~ 0
RADDR2
Text Label 3050 4550 0    50   ~ 0
RADDR4
Text Notes 7950 2800 1    50   ~ 10
ACTION=0xxx
Wire Wire Line
	7400 2250 7050 2250
Wire Wire Line
	7400 2350 7050 2350
Wire Wire Line
	7400 2750 7050 2750
Entry Wire Line
	6950 2050 7050 2150
Entry Wire Line
	6950 2150 7050 2250
Entry Wire Line
	6950 2250 7050 2350
Entry Wire Line
	6950 2650 7050 2750
Text Label 6350 1900 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	6850 1900 6250 1900
Wire Wire Line
	7400 2150 7050 2150
Text Label 7100 2150 0    50   ~ 0
ACTION0
Text Label 7100 2750 0    50   ~ 0
ACTION3
Wire Wire Line
	8400 2850 9100 2850
Text Label 8950 2850 2    50   ~ 0
~ACTION-SRU
NoConn ~ 8400 2150
Text Label 7100 2350 0    50   ~ 0
ACTION2
Text Label 7100 2250 0    50   ~ 0
ACTION1
$Comp
L power:GND #PWR?
U 1 1 5E1CEEB5
P 7350 3000
AR Path="/5E1CEEB5" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5E1CEEB5" Ref="#PWR0168"  Part="1" 
F 0 "#PWR0168" H 7350 2750 50  0001 C CNN
F 1 "GND" H 7355 2827 50  0000 C CNN
F 2 "" H 7350 3000 50  0001 C CNN
F 3 "" H 7350 3000 50  0001 C CNN
	1    7350 3000
	1    0    0    -1  
$EndComp
Entry Wire Line
	6950 4050 7050 4150
Entry Wire Line
	6950 3950 7050 4050
Entry Wire Line
	6950 3850 7050 3950
Wire Bus Line
	6850 3700 6250 3700
Text HLabel 6250 3700 0    50   Input ~ 0
WADDR[0..4]
Text Label 6350 3700 0    50   ~ 0
WADDR[0..4]
Entry Bus Bus
	6850 3700 6950 3800
Wire Wire Line
	7400 2850 7350 2850
Wire Wire Line
	7400 2950 7350 2950
Wire Wire Line
	7350 2850 7350 2950
Wire Wire Line
	7350 2950 7350 3000
Connection ~ 7350 2950
Entry Bus Bus
	6850 1900 6950 2000
Text Notes 8850 4700 0    50   ~ 0
1X0XX\nX1X00\n----\n11000
Text Notes 8800 4700 2    50   ~ 0
Base\n~Y4~\n\nFinal
Wire Wire Line
	4350 2150 5050 2150
Text HLabel 5050 2150 2    50   Output ~ 0
~ROMCE
Text HLabel 2200 2950 0    50   Input ~ 0
~RUEN
Wire Wire Line
	2800 4750 3350 4750
Wire Wire Line
	2200 2950 2800 2950
Connection ~ 2800 2950
Wire Wire Line
	2800 2950 3350 2950
Wire Wire Line
	2800 2950 2800 4750
Text Label 3050 4750 0    50   ~ 0
~RUEN
Text Label 2800 3700 1    50   ~ 0
~RUEN
Text Label 2300 2950 0    50   ~ 0
~RUEN
Text Label 2900 3700 1    50   ~ 0
RADDR[0..4]
Text HLabel 6250 1900 0    50   Input ~ 0
ACTION[0..4]
Text HLabel 9100 4350 2    50   Output ~ 0
~WRITE-ALU-B
Text HLabel 9100 2850 2    50   Output ~ 0
~ACTION-SRU
NoConn ~ 4350 3950
Text Label 4400 4350 0    50   ~ 0
~READ-ALU-B
Text HLabel 5050 4350 2    50   Output ~ 0
~READ-ALU-B
Wire Wire Line
	4350 4350 5050 4350
NoConn ~ 4350 4650
NoConn ~ 4350 4550
NoConn ~ 4350 4450
NoConn ~ 4350 4250
NoConn ~ 4350 4150
Text Notes 7100 7000 0    197  ~ 39
ALU Address Decoders
NoConn ~ 4350 4050
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE97
P 7900 2550
AR Path="/5DC89E19/5E1CEE97" Ref="U?"  Part="1" 
AR Path="/5E1CEE97" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE97" Ref="U27"  Part="1" 
F 0 "U27" H 7900 3217 50  0000 C CNN
F 1 "74HC138" H 7900 3126 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7900 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 7900 2550 50  0001 C CNN
	1    7900 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2250 9100 2250
Wire Wire Line
	8400 2350 9100 2350
Text Label 8500 2250 0    50   ~ 0
~ACTION-CPL
Text Label 8500 2350 0    50   ~ 0
~ACTION-CLL
Text HLabel 9100 2250 2    50   Output ~ 0
~ACTION-CPL
Text HLabel 9100 2350 2    50   Output ~ 0
~ACTION-CLL
NoConn ~ 8400 2450
NoConn ~ 8400 2550
Wire Wire Line
	8400 2650 9100 2650
Wire Wire Line
	8400 2750 9100 2750
Text HLabel 9100 2650 2    50   Output ~ 0
~ACTION-101
Text HLabel 9100 2750 2    50   Output ~ 0
~ACTION-110
Text Label 8950 2750 2    50   ~ 0
~ACTION-110
Text Label 8950 2650 2    50   ~ 0
~ACTION-101
Wire Bus Line
	6950 2000 6950 2650
Wire Bus Line
	6950 3800 6950 4550
Wire Bus Line
	2900 2500 2900 4550
$EndSCHEMATC
