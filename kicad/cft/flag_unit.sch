EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 26 35
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 1600 7200 2    50   ~ 0
RSVD8
Text Label 1600 7350 2    50   ~ 0
RSVD9
Wire Wire Line
	1050 7350 1600 7350
Wire Wire Line
	1050 7200 1600 7200
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5D676EFC
P 900 7200
AR Path="/5D676EFC" Ref="JP?"  Part="1" 
AR Path="/5D65F6EF/5D676EFC" Ref="JP?"  Part="1" 
AR Path="/5D69F3FD/5D676EFC" Ref="JP3301"  Part="1" 
F 0 "JP3301" H 1100 7250 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 900 7314 50  0001 C CNN
F 2 "" H 900 7200 50  0001 C CNN
F 3 "~" H 900 7200 50  0001 C CNN
	1    900  7200
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5D676F02
P 900 7350
AR Path="/5D676F02" Ref="JP?"  Part="1" 
AR Path="/5D65F6EF/5D676F02" Ref="JP?"  Part="1" 
AR Path="/5D69F3FD/5D676F02" Ref="JP3302"  Part="1" 
F 0 "JP3302" H 1100 7400 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 900 7464 50  0001 C CNN
F 2 "" H 900 7350 50  0001 C CNN
F 3 "~" H 900 7350 50  0001 C CNN
	1    900  7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D676F08
P 700 7100
AR Path="/5D676F08" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676F08" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676F08" Ref="#PWR03319"  Part="1" 
F 0 "#PWR03319" H 700 6950 50  0001 C CNN
F 1 "+5V" H 715 7273 50  0000 C CNN
F 2 "" H 700 7100 50  0001 C CNN
F 3 "" H 700 7100 50  0001 C CNN
	1    700  7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  7350 750  7350
Wire Wire Line
	750  7200 700  7200
Text Label 7450 1750 0    50   ~ 0
RSVD14
Text Label 7450 5500 0    50   ~ 0
FI
Text Label 7450 5300 0    50   ~ 0
FV
Text Label 7450 5200 0    50   ~ 0
FL
Text Label 7450 5100 0    50   ~ 0
FZ
Text Label 7450 5000 0    50   ~ 0
FN
Text Label 7450 4900 0    50   ~ 0
RSVD9
Text Label 7450 4800 0    50   ~ 0
RSVD8
Wire Wire Line
	7800 5400 7450 5400
Wire Wire Line
	7800 4900 7450 4900
Wire Wire Line
	7800 4800 7450 4800
Text Label 7450 1850 0    50   ~ 0
FI
Text Label 7450 1650 0    50   ~ 0
FV
Text Label 7450 1550 0    50   ~ 0
FL
Text Label 7450 1450 0    50   ~ 0
FZ
Text Label 7450 1350 0    50   ~ 0
FN
Wire Wire Line
	7800 1650 7050 1650
Text Label 7450 1250 0    50   ~ 0
RSVD9
Text Label 7450 1150 0    50   ~ 0
RSVD8
Wire Wire Line
	7800 1850 6950 1850
Wire Wire Line
	7800 1750 7450 1750
Wire Wire Line
	7800 1550 7150 1550
Wire Wire Line
	7800 1450 7250 1450
Wire Wire Line
	7800 1250 7450 1250
Wire Wire Line
	7800 1150 7450 1150
Text Label 7450 2050 0    50   ~ 0
~FLAGOE
Text Label 9900 6250 2    50   ~ 0
FPO[0..7]
Text Label 9250 6050 1    50   ~ 0
FPO[0..7]
Text Label 9900 2650 2    50   ~ 0
IBUS[8..15]
Text Label 9250 2450 1    50   ~ 0
IBUS[8..15]
Text HLabel 10000 6250 2    50   3State ~ 0
FPO[0..7]
Text HLabel 10000 2650 2    50   3State ~ 0
IBUS[8..15]
Wire Bus Line
	9350 6250 10000 6250
Wire Bus Line
	9350 2650 10000 2650
Entry Bus Bus
	9250 6150 9350 6250
Entry Bus Bus
	9250 2550 9350 2650
Entry Wire Line
	9150 1850 9250 1950
Entry Wire Line
	9150 1750 9250 1850
Entry Wire Line
	9150 1650 9250 1750
Entry Wire Line
	9150 1550 9250 1650
Entry Wire Line
	9150 1450 9250 1550
Entry Wire Line
	9150 1350 9250 1450
Entry Wire Line
	9150 1250 9250 1350
Entry Wire Line
	9150 1150 9250 1250
Entry Wire Line
	9150 5500 9250 5600
Entry Wire Line
	9150 5400 9250 5500
Entry Wire Line
	9150 5300 9250 5400
Entry Wire Line
	9150 5200 9250 5300
Entry Wire Line
	9150 5100 9250 5200
Entry Wire Line
	9150 5000 9250 5100
Entry Wire Line
	9150 4900 9250 5000
Entry Wire Line
	9150 4800 9250 4900
Text HLabel 7450 5700 0    50   Input ~ 0
~FPFLAGS
Text Label 7450 5700 0    50   ~ 0
~FPFLAGS
Wire Wire Line
	7800 5700 7450 5700
$Comp
L power:GND #PWR?
U 1 1 5D676F48
P 7800 5800
AR Path="/5D676F48" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676F48" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676F48" Ref="#PWR03325"  Part="1" 
F 0 "#PWR03325" H 7800 5550 50  0001 C CNN
F 1 "GND" H 7805 5627 50  0000 C CNN
F 2 "" H 7800 5800 50  0001 C CNN
F 3 "" H 7800 5800 50  0001 C CNN
	1    7800 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D676F4E
P 7800 2150
AR Path="/5D676F4E" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676F4E" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676F4E" Ref="#PWR03324"  Part="1" 
F 0 "#PWR03324" H 7800 1900 50  0001 C CNN
F 1 "GND" H 7805 1977 50  0000 C CNN
F 2 "" H 7800 2150 50  0001 C CNN
F 3 "" H 7800 2150 50  0001 C CNN
	1    7800 2150
	1    0    0    -1  
$EndComp
Text Label 9150 5500 2    50   ~ 0
FPO7
Text Label 9150 5400 2    50   ~ 0
FPO6
Text Label 9150 5300 2    50   ~ 0
FPO5
Text Label 9150 5200 2    50   ~ 0
FPO4
Text Label 9150 5100 2    50   ~ 0
FPO3
Text Label 9150 5000 2    50   ~ 0
FPO2
Text Label 9150 4900 2    50   ~ 0
FPO1
Text Label 9150 4800 2    50   ~ 0
FPO0
Wire Wire Line
	8800 5500 9150 5500
Wire Wire Line
	8800 5400 9150 5400
Wire Wire Line
	8800 5300 9150 5300
Wire Wire Line
	8800 5200 9150 5200
Wire Wire Line
	8800 5100 9150 5100
Wire Wire Line
	8800 5000 9150 5000
Wire Wire Line
	8800 4900 9150 4900
Wire Wire Line
	8800 4800 9150 4800
$Comp
L alexios:74HC541 U?
U 1 1 5D676F64
P 8300 5300
AR Path="/5D676F64" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676F64" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676F64" Ref="U1508"  Part="1" 
F 0 "U1508" H 8300 6067 50  0000 C CNN
F 1 "74HC541" H 8300 5976 50  0000 C CNN
F 2 "" H 8300 5300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8300 5300 50  0001 C CNN
	1    8300 5300
	1    0    0    -1  
$EndComp
Text Label 9150 1850 2    50   ~ 0
IBUS15
Text Label 9150 1750 2    50   ~ 0
IBUS14
Text Label 9150 1650 2    50   ~ 0
IBUS13
Text Label 9150 1550 2    50   ~ 0
IBUS12
Text Label 9150 1450 2    50   ~ 0
IBUS11
Text Label 9150 1350 2    50   ~ 0
IBUS10
Text Label 9150 1250 2    50   ~ 0
IBUS9
Text Label 9150 1150 2    50   ~ 0
IBUS8
Wire Wire Line
	8800 1850 9150 1850
Wire Wire Line
	8800 1750 9150 1750
Wire Wire Line
	8800 1650 9150 1650
Wire Wire Line
	8800 1550 9150 1550
Wire Wire Line
	8800 1450 9150 1450
Wire Wire Line
	8800 1350 9150 1350
Wire Wire Line
	8800 1250 9150 1250
Wire Wire Line
	8800 1150 9150 1150
$Comp
L alexios:74HC541 U?
U 1 1 5D676F7A
P 8300 1650
AR Path="/5D676F7A" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676F7A" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676F7A" Ref="U1507"  Part="1" 
F 0 "U1507" H 8300 2417 50  0000 C CNN
F 1 "74HC541" H 8300 2326 50  0000 C CNN
F 2 "" H 8300 1650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8300 1650 50  0001 C CNN
	1    8300 1650
	1    0    0    -1  
$EndComp
Text Label 2900 3050 1    50   ~ 0
WADDR[0..4]
Text Label 2900 4300 1    50   ~ 0
RADDR[0..4]
Text Label 2900 5500 1    50   ~ 0
ACTION[0..3]
Text Label 2200 4700 0    50   ~ 0
ACTION[0..3]
Text Label 2200 3450 0    50   ~ 0
RADDR[0..4]
Text Label 2200 2200 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	2100 4700 2800 4700
Wire Bus Line
	2100 3450 2800 3450
Wire Bus Line
	2100 2200 2800 2200
Entry Bus Bus
	2800 4700 2900 4800
Entry Bus Bus
	2800 3450 2900 3550
Entry Bus Bus
	2800 2200 2900 2300
Entry Wire Line
	2900 5550 3000 5650
Entry Wire Line
	2900 5050 3000 5150
Entry Wire Line
	2900 4950 3000 5050
Entry Wire Line
	2900 4850 3000 4950
Entry Wire Line
	2900 4400 3000 4500
Entry Wire Line
	2900 4300 3000 4400
Entry Wire Line
	2900 3800 3000 3900
Entry Wire Line
	2900 3700 3000 3800
Entry Wire Line
	2900 3600 3000 3700
Entry Wire Line
	2900 3150 3000 3250
Entry Wire Line
	2900 3050 3000 3150
Entry Wire Line
	2900 2550 3000 2650
Entry Wire Line
	2900 2450 3000 2550
Entry Wire Line
	2900 2350 3000 2450
$Comp
L alexios:74HC138 U?
U 1 1 5D676F9A
P 3850 5350
AR Path="/5F3EA987/5D676F9A" Ref="U?"  Part="1" 
AR Path="/5D676F9A" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5D676F9A" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676F9A" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676F9A" Ref="U3309"  Part="1" 
F 0 "U3309" H 3850 6017 50  0000 C CNN
F 1 "74HC138" H 3850 5926 50  0000 C CNN
F 2 "" H 3850 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 5350 50  0001 C CNN
	1    3850 5350
	1    0    0    -1  
$EndComp
Text Label 3000 4950 0    50   ~ 0
ACTION0
Text Label 3000 5050 0    50   ~ 0
ACTION1
Text Label 3000 5150 0    50   ~ 0
ACTION2
Text Label 3000 5650 0    50   ~ 0
ACTION3
$Comp
L power:+5V #PWR?
U 1 1 5D676FA4
P 3350 5550
AR Path="/5D676FA4" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676FA4" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676FA4" Ref="#PWR03322"  Part="1" 
F 0 "#PWR03322" H 3350 5400 50  0001 C CNN
F 1 "+5V" H 3365 5723 50  0000 C CNN
F 2 "" H 3350 5550 50  0001 C CNN
F 3 "" H 3350 5550 50  0001 C CNN
	1    3350 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D676FAA
P 3350 5750
AR Path="/5D676FAA" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676FAA" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676FAA" Ref="#PWR03323"  Part="1" 
F 0 "#PWR03323" H 3350 5500 50  0001 C CNN
F 1 "GND" H 3355 5577 50  0000 C CNN
F 2 "" H 3350 5750 50  0001 C CNN
F 3 "" H 3350 5750 50  0001 C CNN
	1    3350 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5050 6150 5050
Wire Wire Line
	4350 5150 6150 5150
Wire Wire Line
	4350 5250 6150 5250
Wire Wire Line
	4350 5350 6150 5350
Wire Wire Line
	4350 5450 6150 5450
Text Label 5200 5050 2    50   ~ 0
~ACTION-CPL
Text Label 5200 5150 2    50   ~ 0
~ACTION-CLL
Text Label 5200 5250 2    50   ~ 0
~ACTION-STI
Text Label 5200 5350 2    50   ~ 0
~ACTION-CLI
Text Label 5200 5450 2    50   ~ 0
~ACTION-CLA
NoConn ~ 4350 4950
NoConn ~ 4350 5550
NoConn ~ 4350 5650
Text Notes 4500 5850 0    50   ~ 0
~ACTION-CLA~ is needed by\nthe AC register, but it saves\none chip if we decode it\nhere, so why not?
Text Notes 3900 5600 1    50   ~ 10
ACTION=0xxx
Text HLabel 6150 5050 2    50   Output ~ 0
~ACTION-CPL
Text HLabel 6150 5150 2    50   Output ~ 0
~ACTION-CLL
Text HLabel 6150 5250 2    50   Output ~ 0
~ACTION-STI
Text HLabel 6150 5350 2    50   Output ~ 0
~ACTION-CLI
Text HLabel 6150 5450 2    50   Output ~ 0
~ACTION-CLA
Wire Wire Line
	3350 5650 3000 5650
Wire Wire Line
	3350 5150 3000 5150
Wire Wire Line
	3350 5050 3000 5050
Wire Wire Line
	3350 4950 3000 4950
Wire Wire Line
	3350 2450 3000 2450
Wire Wire Line
	3350 2550 3000 2550
Wire Wire Line
	3000 2650 3350 2650
Wire Wire Line
	3350 3150 3000 3150
Wire Wire Line
	3350 3250 3000 3250
Wire Wire Line
	3350 3700 3000 3700
Wire Wire Line
	3350 3800 3000 3800
Wire Wire Line
	3000 3900 3350 3900
Wire Wire Line
	3350 4500 3000 4500
Wire Wire Line
	3350 4400 3000 4400
Text Label 5950 3000 2    50   ~ 0
~FLAGWE
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D676FD3
P 5500 3000
AR Path="/5D676FD3" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676FD3" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676FD3" Ref="U3310"  Part="1" 
F 0 "U3310" H 5425 3267 50  0000 C CNN
F 1 "74LVC1G08" H 5425 3176 50  0000 C CNN
F 2 "" H 5150 3000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5150 3000 50  0001 C CNN
	1    5500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4200 5200 4200
Wire Wire Line
	4350 4300 5200 4300
Text Label 5200 4200 2    50   ~ 0
~READ-MBP+FLAGS
Text Label 5200 4300 2    50   ~ 0
~READ-FLAGS
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D676FDD
P 5500 4250
AR Path="/5D676FDD" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676FDD" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676FDD" Ref="U3311"  Part="1" 
F 0 "U3311" H 5425 4517 50  0000 C CNN
F 1 "74LVC1G08" H 5425 4426 50  0000 C CNN
F 2 "" H 5150 4250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5150 4250 50  0001 C CNN
	1    5500 4250
	1    0    0    -1  
$EndComp
Text Label 5950 4250 2    50   ~ 0
~FLAGOE
NoConn ~ 4350 4400
NoConn ~ 4350 4100
NoConn ~ 4350 4000
NoConn ~ 4350 3900
NoConn ~ 4350 3800
NoConn ~ 4350 3700
NoConn ~ 4350 3150
NoConn ~ 4350 2850
NoConn ~ 4350 2750
NoConn ~ 4350 2650
NoConn ~ 4350 2550
NoConn ~ 4350 2450
Text Label 3000 4500 0    50   ~ 0
RADDR4
Text Label 3000 4400 0    50   ~ 0
RADDR3
Text Label 3000 3900 0    50   ~ 0
RADDR2
Text Label 3000 3800 0    50   ~ 0
RADDR1
Text Label 3000 3700 0    50   ~ 0
RADDR0
$Comp
L power:+5V #PWR?
U 1 1 5D676FF5
P 3350 4300
AR Path="/5D676FF5" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676FF5" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676FF5" Ref="#PWR03321"  Part="1" 
F 0 "#PWR03321" H 3350 4150 50  0001 C CNN
F 1 "+5V" H 3365 4473 50  0000 C CNN
F 2 "" H 3350 4300 50  0001 C CNN
F 3 "" H 3350 4300 50  0001 C CNN
	1    3350 4300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 5D676FFB
P 3850 4100
AR Path="/5F3EA987/5D676FFB" Ref="U?"  Part="1" 
AR Path="/5D676FFB" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5D676FFB" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676FFB" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676FFB" Ref="U3308"  Part="1" 
F 0 "U3308" H 3850 4767 50  0000 C CNN
F 1 "74HC138" H 3850 4676 50  0000 C CNN
F 2 "" H 3850 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 4100 50  0001 C CNN
	1    3850 4100
	1    0    0    -1  
$EndComp
Text Notes 3900 4350 1    50   ~ 10
RADDR=001xx
Text Label 5200 3050 2    50   ~ 0
~WRITE-FLAGS
Text Label 5200 2950 2    50   ~ 0
~WRITE-MBP+FLAGS
Wire Wire Line
	4350 3050 5200 3050
Wire Wire Line
	4350 2950 5200 2950
$Comp
L power:+5V #PWR?
U 1 1 5D677006
P 3350 3050
AR Path="/5D677006" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D677006" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D677006" Ref="#PWR03320"  Part="1" 
F 0 "#PWR03320" H 3350 2900 50  0001 C CNN
F 1 "+5V" H 3365 3223 50  0000 C CNN
F 2 "" H 3350 3050 50  0001 C CNN
F 3 "" H 3350 3050 50  0001 C CNN
	1    3350 3050
	1    0    0    -1  
$EndComp
Text Label 3000 2650 0    50   ~ 0
WADDR2
Text Label 3000 2550 0    50   ~ 0
WADDR1
Text Label 3000 2450 0    50   ~ 0
WADDR0
$Comp
L alexios:74HC138 U?
U 1 1 5D67700F
P 3850 2850
AR Path="/5F3EA987/5D67700F" Ref="U?"  Part="1" 
AR Path="/5D67700F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5D67700F" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D67700F" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D67700F" Ref="U3307"  Part="1" 
F 0 "U3307" H 3850 3517 50  0000 C CNN
F 1 "74HC138" H 3850 3426 50  0000 C CNN
F 2 "" H 3850 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 2850 50  0001 C CNN
	1    3850 2850
	1    0    0    -1  
$EndComp
Text Label 3000 3150 0    50   ~ 0
WADDR3
Text Label 3000 3250 0    50   ~ 0
WADDR4
Text Notes 3900 3100 1    50   ~ 10
WADDR=001xx
Text HLabel 2100 2200 0    50   Input ~ 0
WADDR[0..4]
Text HLabel 2100 3450 0    50   Input ~ 0
RADDR[0..4]
Text HLabel 2100 4700 0    50   Input ~ 0
ACTION[0..3]
Wire Wire Line
	7800 1350 7350 1350
Wire Wire Line
	7350 5000 7800 5000
Wire Wire Line
	7250 5100 7800 5100
Wire Wire Line
	7150 5200 7800 5200
Wire Wire Line
	7050 5300 7800 5300
Wire Wire Line
	6950 5500 7800 5500
Text Label 1600 7500 2    50   ~ 0
RSVD14
Wire Wire Line
	1050 7500 1600 7500
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5D677023
P 900 7500
AR Path="/5D677023" Ref="JP?"  Part="1" 
AR Path="/5D65F6EF/5D677023" Ref="JP?"  Part="1" 
AR Path="/5D69F3FD/5D677023" Ref="JP3303"  Part="1" 
F 0 "JP3303" H 1100 7550 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 900 7614 50  0001 C CNN
F 2 "" H 900 7500 50  0001 C CNN
F 3 "~" H 900 7500 50  0001 C CNN
	1    900  7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  7500 750  7500
Wire Wire Line
	6950 1750 6950 1850
Wire Wire Line
	6950 1750 2100 1750
Wire Wire Line
	7050 1650 2100 1650
Wire Wire Line
	7150 1550 2100 1550
Wire Wire Line
	7250 1450 2100 1450
Wire Wire Line
	7350 1350 2100 1350
Text HLabel 2100 1750 0    50   Input ~ 0
FI
Text HLabel 2100 1650 0    50   Input ~ 0
FV
Text HLabel 2100 1550 0    50   Input ~ 0
FL
Text HLabel 2100 1450 0    50   Input ~ 0
FZ
Text HLabel 2100 1350 0    50   Input ~ 0
FN
Text HLabel 10000 3000 2    50   Output ~ 0
~FLAGWE
Connection ~ 6950 1850
Connection ~ 7050 1650
Connection ~ 7150 1550
Connection ~ 7250 1450
Connection ~ 7350 1350
Wire Wire Line
	7350 1350 7350 5000
Wire Wire Line
	7250 1450 7250 5100
Wire Wire Line
	7150 1550 7150 5200
Wire Wire Line
	7050 1650 7050 5300
Wire Wire Line
	6950 1850 6950 5500
Wire Wire Line
	5650 3000 10000 3000
Wire Wire Line
	5650 4250 6850 4250
Wire Wire Line
	6850 2050 7800 2050
Text Label 6850 4100 1    50   ~ 0
~FLAGOE
Text Label 6950 4100 1    50   ~ 0
FI
Text Label 7050 4100 1    50   ~ 0
FV
Text Label 7150 4100 1    50   ~ 0
FL
Text Label 7250 4100 1    50   ~ 0
FZ
Text Label 7350 4100 1    50   ~ 0
FN
Wire Wire Line
	6850 2050 6850 4250
Text Label 2200 1350 0    50   ~ 0
FN
Text Label 2200 1450 0    50   ~ 0
FZ
Text Label 2200 1550 0    50   ~ 0
FL
Text Label 2200 1650 0    50   ~ 0
FV
Text Label 2200 1750 0    50   ~ 0
FI
Wire Wire Line
	700  7100 700  7200
Connection ~ 700  7200
Wire Wire Line
	700  7200 700  7350
Connection ~ 700  7350
Wire Wire Line
	700  7350 700  7500
Text Notes 7100 7000 0    197  ~ 39
Flag Unit
Text Label 7450 5400 0    50   ~ 0
RSVD14
Wire Bus Line
	2900 4800 2900 5550
Wire Bus Line
	2900 3550 2900 4400
Wire Bus Line
	2900 2300 2900 3150
Wire Bus Line
	9250 4900 9250 6150
Wire Bus Line
	9250 1250 9250 2550
Text Notes 550  4000 0    404  ~ 81
ADDRESSING HAS CHANGED, REDO!
$EndSCHEMATC
