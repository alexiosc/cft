EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 11
Title "Flag Unit"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "flag_unit.v"
$EndDescr
Text Label 7250 2050 0    50   ~ 0
RSVD14
Text Label 7250 5500 0    50   ~ 0
FI
Text Label 7250 5300 0    50   ~ 0
FV
Text Label 7250 5200 0    50   ~ 0
FL
Text Label 7250 5100 0    50   ~ 0
FZ
Text Label 7250 5000 0    50   ~ 0
FN
Text Label 7250 4900 0    50   ~ 0
FPRSVD9
Text Label 7250 4800 0    50   ~ 0
FPRSVD8
Text Label 7250 2150 0    50   ~ 0
FI
Text Label 7250 1950 0    50   ~ 0
FV
Text Label 7250 1850 0    50   ~ 0
FL
Text Label 7250 1750 0    50   ~ 0
FZ
Text Label 7250 1650 0    50   ~ 0
FN
Wire Wire Line
	7600 1950 6850 1950
Text Label 7250 1550 0    50   ~ 0
RSVD9
Text Label 7250 1450 0    50   ~ 0
RSVD8
Wire Wire Line
	7600 2150 6750 2150
Wire Wire Line
	7600 1850 6950 1850
Wire Wire Line
	7600 1750 7050 1750
Text Label 7250 2350 0    50   ~ 0
~FLAGOE
Text Label 9700 6250 2    50   ~ 0
FPD[0..7]
Text Label 9050 6050 1    50   ~ 0
FPD[0..7]
Text Label 9700 2950 2    50   ~ 0
IBUS[8..15]
Text Label 9050 2750 1    50   ~ 0
IBUS[8..15]
Text HLabel 9800 6250 2    50   3State ~ 0
FPD[0..7]
Text HLabel 9800 2950 2    50   3State ~ 0
IBUS[8..15]
Wire Bus Line
	9150 6250 9800 6250
Wire Bus Line
	9150 2950 9800 2950
Entry Bus Bus
	9050 6150 9150 6250
Entry Bus Bus
	9050 2850 9150 2950
Entry Wire Line
	8950 2150 9050 2250
Entry Wire Line
	8950 2050 9050 2150
Entry Wire Line
	8950 1950 9050 2050
Entry Wire Line
	8950 1850 9050 1950
Entry Wire Line
	8950 1750 9050 1850
Entry Wire Line
	8950 1650 9050 1750
Entry Wire Line
	8950 1550 9050 1650
Entry Wire Line
	8950 1450 9050 1550
Entry Wire Line
	8950 5500 9050 5600
Entry Wire Line
	8950 5400 9050 5500
Entry Wire Line
	8950 5300 9050 5400
Entry Wire Line
	8950 5200 9050 5300
Entry Wire Line
	8950 5100 9050 5200
Entry Wire Line
	8950 5000 9050 5100
Entry Wire Line
	8950 4900 9050 5000
Entry Wire Line
	8950 4800 9050 4900
Text HLabel 1900 5700 0    50   Input ~ 0
~FPFLAGS
Text Label 7250 5700 0    50   ~ 0
~FPFLAGS
Wire Wire Line
	7600 5700 1900 5700
$Comp
L power:GND #PWR?
U 1 1 5D676F48
P 7600 5800
AR Path="/5D676F48" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676F48" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676F48" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 7600 5550 50  0001 C CNN
F 1 "GND" H 7605 5627 50  0000 C CNN
F 2 "" H 7600 5800 50  0001 C CNN
F 3 "" H 7600 5800 50  0001 C CNN
	1    7600 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D676F4E
P 7600 2450
AR Path="/5D676F4E" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676F4E" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676F4E" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 7600 2200 50  0001 C CNN
F 1 "GND" H 7605 2277 50  0000 C CNN
F 2 "" H 7600 2450 50  0001 C CNN
F 3 "" H 7600 2450 50  0001 C CNN
	1    7600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5500 8950 5500
Wire Wire Line
	8600 5400 8950 5400
Wire Wire Line
	8600 5300 8950 5300
Wire Wire Line
	8600 5200 8950 5200
Wire Wire Line
	8600 5100 8950 5100
Wire Wire Line
	8600 5000 8950 5000
Wire Wire Line
	8600 4900 8950 4900
Wire Wire Line
	8600 4800 8950 4800
$Comp
L alexios:74HC541 U?
U 1 1 5D676F64
P 8100 5300
AR Path="/5D676F64" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676F64" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676F64" Ref="U32"  Part="1" 
F 0 "U32" H 8100 6067 50  0000 C CNN
F 1 "74HC541" H 8100 5976 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8100 5300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8100 5300 50  0001 C CNN
	1    8100 5300
	1    0    0    -1  
$EndComp
Text Label 8950 2150 2    50   ~ 0
IBUS15
Text Label 8950 2050 2    50   ~ 0
IBUS14
Text Label 8950 1950 2    50   ~ 0
IBUS13
Text Label 8950 1850 2    50   ~ 0
IBUS12
Text Label 8950 1750 2    50   ~ 0
IBUS11
Text Label 8950 1650 2    50   ~ 0
IBUS10
Text Label 8950 1550 2    50   ~ 0
IBUS9
Text Label 8950 1450 2    50   ~ 0
IBUS8
Wire Wire Line
	8600 2150 8950 2150
Wire Wire Line
	8600 1950 8950 1950
Wire Wire Line
	8600 1850 8950 1850
Wire Wire Line
	8600 1750 8950 1750
Wire Wire Line
	8600 1650 8950 1650
Wire Wire Line
	8600 1550 8950 1550
Wire Wire Line
	8600 1450 8950 1450
$Comp
L alexios:74HC541 U?
U 1 1 5D676F7A
P 8100 1950
AR Path="/5D676F7A" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676F7A" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676F7A" Ref="U27"  Part="1" 
F 0 "U27" H 8100 2717 50  0000 C CNN
F 1 "74HC541" H 8100 2626 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8100 1950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8100 1950 50  0001 C CNN
	1    8100 1950
	1    0    0    -1  
$EndComp
Text Label 2700 3150 1    50   ~ 0
WADDR[0..4]
Text Label 2700 4550 1    50   ~ 0
RADDR[0..4]
Text Label 2000 3700 0    50   ~ 0
RADDR[0..4]
Text Label 2000 2400 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	1900 3700 2600 3700
Wire Bus Line
	1900 2400 2600 2400
Entry Bus Bus
	2600 3700 2700 3800
Entry Bus Bus
	2600 2400 2700 2500
Entry Wire Line
	2700 4550 2800 4650
Entry Wire Line
	2700 4450 2800 4550
Entry Wire Line
	2700 4050 2800 4150
Entry Wire Line
	2700 3950 2800 4050
Entry Wire Line
	2700 3850 2800 3950
Entry Wire Line
	2700 3250 2800 3350
Entry Wire Line
	2700 3150 2800 3250
Entry Wire Line
	2700 2750 2800 2850
Entry Wire Line
	2700 2650 2800 2750
Entry Wire Line
	2700 2550 2800 2650
Wire Wire Line
	3150 2650 2800 2650
Wire Wire Line
	3150 2750 2800 2750
Wire Wire Line
	2800 2850 3150 2850
Wire Wire Line
	3150 3950 2800 3950
Wire Wire Line
	3150 4050 2800 4050
Wire Wire Line
	2800 4150 3150 4150
Wire Wire Line
	3150 4650 2800 4650
Wire Wire Line
	3150 4550 2800 4550
Text Label 6250 3250 0    50   ~ 0
~FLAGWE
NoConn ~ 4150 4350
NoConn ~ 4150 4250
NoConn ~ 4150 4150
NoConn ~ 4150 4050
NoConn ~ 4150 3950
NoConn ~ 4150 3050
NoConn ~ 4150 2950
NoConn ~ 4150 2850
NoConn ~ 4150 2750
NoConn ~ 4150 2650
Text Label 2800 4650 0    50   ~ 0
RADDR4
Text Label 2800 4550 0    50   ~ 0
RADDR3
Text Label 2800 4150 0    50   ~ 0
RADDR2
Text Label 2800 4050 0    50   ~ 0
RADDR1
Text Label 2800 3950 0    50   ~ 0
RADDR0
$Comp
L alexios:74HC138 U?
U 1 1 5D676FFB
P 3650 4350
AR Path="/5F3EA987/5D676FFB" Ref="U?"  Part="1" 
AR Path="/5D676FFB" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5D676FFB" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676FFB" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676FFB" Ref="U30"  Part="1" 
F 0 "U30" H 3650 5017 50  0000 C CNN
F 1 "74HC138" H 3650 4926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3650 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3650 4350 50  0001 C CNN
	1    3650 4350
	1    0    0    -1  
$EndComp
Text Notes 3700 4600 1    50   ~ 10
RADDR=01xxx
Text Label 4900 3250 2    50   ~ 0
~WRITE-FLAGS
Text Label 4900 3150 2    50   ~ 0
~WRITE-MBP+FLAGS
Text Label 2800 2850 0    50   ~ 0
WADDR2
Text Label 2800 2750 0    50   ~ 0
WADDR1
Text Label 2800 2650 0    50   ~ 0
WADDR0
$Comp
L alexios:74HC138 U?
U 1 1 5D67700F
P 3650 3050
AR Path="/5F3EA987/5D67700F" Ref="U?"  Part="1" 
AR Path="/5D67700F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5D67700F" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D67700F" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D67700F" Ref="U28"  Part="1" 
F 0 "U28" H 3650 3717 50  0000 C CNN
F 1 "74HC138" H 3650 3626 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3650 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3650 3050 50  0001 C CNN
	1    3650 3050
	1    0    0    -1  
$EndComp
Text Notes 3700 3300 1    50   ~ 10
WADDR=011xx
Text HLabel 1900 2400 0    50   Input ~ 0
WADDR[0..4]
Text HLabel 1900 3700 0    50   Input ~ 0
RADDR[0..4]
Wire Wire Line
	7600 1650 7150 1650
Wire Wire Line
	7150 5000 7600 5000
Wire Wire Line
	7050 5100 7600 5100
Wire Wire Line
	6950 5200 7600 5200
Wire Wire Line
	6850 5300 7600 5300
Wire Wire Line
	6750 5500 7600 5500
Wire Wire Line
	6750 5500 1900 5500
Wire Wire Line
	6850 5300 1900 5300
Wire Wire Line
	6950 5200 1900 5200
Wire Wire Line
	7050 5100 1900 5100
Wire Wire Line
	7150 5000 1900 5000
Text HLabel 1900 5500 0    50   Input ~ 0
FI
Text HLabel 1900 5300 0    50   Input ~ 0
FV
Text HLabel 1900 5200 0    50   Input ~ 0
FL
Text HLabel 1900 5100 0    50   Input ~ 0
FZ
Text HLabel 1900 5000 0    50   Input ~ 0
FN
Text HLabel 9800 3250 2    50   Output ~ 0
~FLAGWE
Wire Wire Line
	6650 2350 7600 2350
Text Label 6650 2900 1    50   ~ 0
~FLAGOE
Text Label 6750 2900 1    50   ~ 0
FI
Text Label 6850 2900 1    50   ~ 0
FV
Text Label 6950 2900 1    50   ~ 0
FL
Text Label 7050 2900 1    50   ~ 0
FZ
Text Label 7150 2900 1    50   ~ 0
FN
Text Label 2000 5000 0    50   ~ 0
FN
Text Label 2000 5100 0    50   ~ 0
FZ
Text Label 2000 5200 0    50   ~ 0
FL
Text Label 2000 5300 0    50   ~ 0
FV
Text Label 2000 5500 0    50   ~ 0
FI
Text Label 7250 5400 0    50   ~ 0
FPRSVD14
Wire Wire Line
	2800 3250 3150 3250
Wire Wire Line
	2800 3350 3150 3350
Text Label 2800 3250 0    50   ~ 0
WADDR3
Text Label 2800 3350 0    50   ~ 0
WADDR4
$Comp
L power:GND #PWR0172
U 1 1 5DFDCB26
P 3150 4750
F 0 "#PWR0172" H 3150 4500 50  0001 C CNN
F 1 "GND" H 3155 4577 50  0000 C CNN
F 2 "" H 3150 4750 50  0001 C CNN
F 3 "" H 3150 4750 50  0001 C CNN
	1    3150 4750
	1    0    0    -1  
$EndComp
Text Notes 4350 3900 0    50   ~ 0
RADDR or WADDR = 01101 → Read/Write MBP & Flags\nRADDR or WADDR = 01110 → Read/Write Flags
Text Label 8650 4800 0    50   ~ 0
FPD0
Text Label 8650 4900 0    50   ~ 0
FPD1
Text Label 8650 5000 0    50   ~ 0
FPD2
Text Label 8650 5100 0    50   ~ 0
FPD3
Text Label 8650 5200 0    50   ~ 0
FPD4
Text Label 8650 5300 0    50   ~ 0
FPD5
Text Label 8650 5400 0    50   ~ 0
FPD6
Text Label 8650 5500 0    50   ~ 0
FPD7
$Comp
L power:+5V #PWR?
U 1 1 5DDC2767
P 9550 1800
AR Path="/5F4B0011/5DDC2767" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC2767" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC2767" Ref="#PWR0176"  Part="1" 
F 0 "#PWR0176" H 9550 1650 50  0001 C CNN
F 1 "+5V" H 9565 1973 50  0000 C CNN
F 2 "" H 9550 1800 50  0001 C CNN
F 3 "" H 9550 1800 50  0001 C CNN
	1    9550 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDC276D
P 9550 2000
AR Path="/5DDC276D" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5DDC276D" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC276D" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC276D" Ref="#PWR0177"  Part="1" 
F 0 "#PWR0177" H 9550 1750 50  0001 C CNN
F 1 "GND" H 9555 1827 50  0000 C CNN
F 2 "" H 9550 2000 50  0001 C CNN
F 3 "" H 9550 2000 50  0001 C CNN
	1    9550 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DDC2773
P 9550 1900
AR Path="/5CC0D65F/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5F63066B/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5D69F3FD/5DDC2773" Ref="C44"  Part="1" 
F 0 "C44" H 9459 1946 50  0000 R CNN
F 1 "100nF" H 9459 1855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 1900 50  0001 C CNN
F 3 "~" H 9550 1900 50  0001 C CNN
	1    9550 1900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5DDC2779
P 9900 1900
AR Path="/5F4B0011/5DDC2779" Ref="U?"  Part="2" 
AR Path="/5F63066B/5DDC2779" Ref="U?"  Part="2" 
AR Path="/5D69F3FD/5DDC2779" Ref="U27"  Part="2" 
F 0 "U27" H 10080 1946 50  0000 L CNN
F 1 "74HC541" H 10080 1855 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 9900 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 9900 1900 50  0001 C CNN
	2    9900 1900
	1    0    0    -1  
$EndComp
Connection ~ 9550 2000
Connection ~ 9550 1800
$Comp
L power:+5V #PWR?
U 1 1 5DDC83A1
P 9550 5150
AR Path="/5F4B0011/5DDC83A1" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC83A1" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC83A1" Ref="#PWR0178"  Part="1" 
F 0 "#PWR0178" H 9550 5000 50  0001 C CNN
F 1 "+5V" H 9565 5323 50  0000 C CNN
F 2 "" H 9550 5150 50  0001 C CNN
F 3 "" H 9550 5150 50  0001 C CNN
	1    9550 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDC83A7
P 9550 5350
AR Path="/5DDC83A7" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5DDC83A7" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC83A7" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC83A7" Ref="#PWR0179"  Part="1" 
F 0 "#PWR0179" H 9550 5100 50  0001 C CNN
F 1 "GND" H 9555 5177 50  0000 C CNN
F 2 "" H 9550 5350 50  0001 C CNN
F 3 "" H 9550 5350 50  0001 C CNN
	1    9550 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DDC83AD
P 9550 5250
AR Path="/5CC0D65F/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5F63066B/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5D69F3FD/5DDC83AD" Ref="C45"  Part="1" 
F 0 "C45" H 9459 5296 50  0000 R CNN
F 1 "100nF" H 9459 5205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 5250 50  0001 C CNN
F 3 "~" H 9550 5250 50  0001 C CNN
	1    9550 5250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5DDC83B3
P 9900 5250
AR Path="/5F4B0011/5DDC83B3" Ref="U?"  Part="2" 
AR Path="/5F63066B/5DDC83B3" Ref="U?"  Part="2" 
AR Path="/5D69F3FD/5DDC83B3" Ref="U32"  Part="2" 
F 0 "U32" H 10080 5296 50  0000 L CNN
F 1 "74HC541" H 10080 5205 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 9900 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 9900 5250 50  0001 C CNN
	2    9900 5250
	1    0    0    -1  
$EndComp
Connection ~ 9550 5350
Connection ~ 9550 5150
Text HLabel 4900 3400 0    50   Input ~ 0
CLK4
Text Label 5100 3400 0    50   ~ 0
CLK4
Text Notes 7500 4400 0    98   ~ 20
Front Panel Buffer
Wire Wire Line
	8600 2050 8950 2050
Wire Wire Line
	6200 3250 9800 3250
Text Notes 7650 2950 0    98   ~ 20
IBus Buffer
$Comp
L alexios:74HC138 U?
U 2 1 5E5A9D24
P 1400 6550
AR Path="/5F3EA987/5E5A9D24" Ref="U?"  Part="1" 
AR Path="/5E5A9D24" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E5A9D24" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E5A9D24" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E5A9D24" Ref="U28"  Part="2" 
F 0 "U28" H 1579 6596 50  0000 L CNN
F 1 "74HC138" H 1579 6505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1400 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1400 6550 50  0001 C CNN
	2    1400 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5E5A9E50
P 2900 6550
AR Path="/5F3EA987/5E5A9E50" Ref="U?"  Part="1" 
AR Path="/5E5A9E50" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E5A9E50" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E5A9E50" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E5A9E50" Ref="U30"  Part="2" 
F 0 "U30" H 3079 6596 50  0000 L CNN
F 1 "74HC138" H 3079 6505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2900 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2900 6550 50  0001 C CNN
	2    2900 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E5AF321
P 1050 6450
AR Path="/5F4B0011/5E5AF321" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5E5AF321" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5E5AF321" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 1050 6300 50  0001 C CNN
F 1 "+5V" H 1065 6623 50  0000 C CNN
F 2 "" H 1050 6450 50  0001 C CNN
F 3 "" H 1050 6450 50  0001 C CNN
	1    1050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E5AF327
P 1050 6650
AR Path="/5E5AF327" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5E5AF327" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5E5AF327" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5E5AF327" Ref="#PWR0181"  Part="1" 
F 0 "#PWR0181" H 1050 6400 50  0001 C CNN
F 1 "GND" H 1055 6477 50  0000 C CNN
F 2 "" H 1050 6650 50  0001 C CNN
F 3 "" H 1050 6650 50  0001 C CNN
	1    1050 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E5AF32D
P 1050 6550
AR Path="/5CC0D65F/5E5AF32D" Ref="C?"  Part="1" 
AR Path="/5E5AF32D" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5E5AF32D" Ref="C?"  Part="1" 
AR Path="/5F63066B/5E5AF32D" Ref="C?"  Part="1" 
AR Path="/5D69F3FD/5E5AF32D" Ref="C66"  Part="1" 
F 0 "C66" H 959 6596 50  0000 R CNN
F 1 "100nF" H 959 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1050 6550 50  0001 C CNN
F 3 "~" H 1050 6550 50  0001 C CNN
	1    1050 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E5B19FE
P 2550 6450
AR Path="/5F4B0011/5E5B19FE" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5E5B19FE" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5E5B19FE" Ref="#PWR0180"  Part="1" 
F 0 "#PWR0180" H 2550 6300 50  0001 C CNN
F 1 "+5V" H 2565 6623 50  0000 C CNN
F 2 "" H 2550 6450 50  0001 C CNN
F 3 "" H 2550 6450 50  0001 C CNN
	1    2550 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E5B1A04
P 2550 6650
AR Path="/5E5B1A04" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5E5B1A04" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5E5B1A04" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5E5B1A04" Ref="#PWR0182"  Part="1" 
F 0 "#PWR0182" H 2550 6400 50  0001 C CNN
F 1 "GND" H 2555 6477 50  0000 C CNN
F 2 "" H 2550 6650 50  0001 C CNN
F 3 "" H 2550 6650 50  0001 C CNN
	1    2550 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E5B1A0A
P 2550 6550
AR Path="/5CC0D65F/5E5B1A0A" Ref="C?"  Part="1" 
AR Path="/5E5B1A0A" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5E5B1A0A" Ref="C?"  Part="1" 
AR Path="/5F63066B/5E5B1A0A" Ref="C?"  Part="1" 
AR Path="/5D69F3FD/5E5B1A0A" Ref="C67"  Part="1" 
F 0 "C67" H 2459 6596 50  0000 R CNN
F 1 "100nF" H 2459 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 6550 50  0001 C CNN
F 3 "~" H 2550 6550 50  0001 C CNN
	1    2550 6550
	1    0    0    -1  
$EndComp
Connection ~ 2550 6450
Connection ~ 2550 6650
Connection ~ 1050 6450
Connection ~ 1050 6650
Connection ~ 6850 5300
Connection ~ 6950 5200
Connection ~ 7050 5100
Connection ~ 7150 5000
Wire Wire Line
	6850 1950 6850 5300
Wire Wire Line
	6950 1850 6950 5200
Wire Wire Line
	7050 1750 7050 5100
Wire Wire Line
	7150 1650 7150 5000
Text Notes 1350 1950 0    50   ~ 0
The flag unit collects the values of all the flags in the processor and puts them on the IBus. This is used by the\ncontrol unit to store flags onto the stack, which is necessary to implement subrouines and interrupts.\n\nIt can also read some of these flags and update them. Not all flags can be updated this way. The Link (L)\nflag/register, Interrupt flag (I), and Overflow (V) flag can be written to this way. The Negative (N) and\nZero (Z) flags are read-only because they depend directly on the value of the AC. They are automatically\nrestored when the AC is popped from the stack.\n\nSince all flags are implemented in their respective units, this unit simply provides a ~FLAGWE~ strobe which\nindividual flags can use to set themselves from the appropriate IBUS signal.
Text Notes 1350 1000 0    98   ~ 20
The Flag Unit
$Comp
L power:GND #PWR0166
U 1 1 5E5FF3C3
P 3150 3450
F 0 "#PWR0166" H 3150 3200 50  0001 C CNN
F 1 "GND" H 3155 3277 50  0000 C CNN
F 2 "" H 3150 3450 50  0001 C CNN
F 3 "" H 3150 3450 50  0001 C CNN
	1    3150 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4650 7250 4650
Wire Wire Line
	7250 4050 9800 4050
Text Label 4250 4650 0    50   ~ 0
~READ-AGL
Text HLabel 9800 4050 2    50   Output ~ 0
~READ-AGL
Text Label 9700 3250 2    50   ~ 0
~FLAGWE
Text Label 9700 4050 2    50   ~ 0
~READ-AGL
$Comp
L power:+5V #PWR?
U 1 1 5EF39B94
P 1050 7150
AR Path="/5F4B0011/5EF39B94" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5EF39B94" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5EF39B94" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 1050 7000 50  0001 C CNN
F 1 "+5V" H 1065 7323 50  0000 C CNN
F 2 "" H 1050 7150 50  0001 C CNN
F 3 "" H 1050 7150 50  0001 C CNN
	1    1050 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF39B9A
P 1050 7350
AR Path="/5EF39B9A" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5EF39B9A" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5EF39B9A" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5EF39B9A" Ref="#PWR0187"  Part="1" 
F 0 "#PWR0187" H 1050 7100 50  0001 C CNN
F 1 "GND" H 1055 7177 50  0000 C CNN
F 2 "" H 1050 7350 50  0001 C CNN
F 3 "" H 1050 7350 50  0001 C CNN
	1    1050 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EF39BA0
P 1050 7250
AR Path="/5CC0D65F/5EF39BA0" Ref="C?"  Part="1" 
AR Path="/5EF39BA0" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5EF39BA0" Ref="C?"  Part="1" 
AR Path="/5F63066B/5EF39BA0" Ref="C?"  Part="1" 
AR Path="/5D69F3FD/5EF39BA0" Ref="C1"  Part="1" 
F 0 "C1" H 959 7296 50  0000 R CNN
F 1 "100nF" H 959 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1050 7250 50  0001 C CNN
F 3 "~" H 1050 7250 50  0001 C CNN
	1    1050 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3350 4400 3350
Wire Wire Line
	4400 3350 4400 3650
Wire Wire Line
	4400 3650 9800 3650
Text HLabel 9800 3650 2    50   Output ~ 0
~WRITE-IR
Text Label 9700 3650 2    50   ~ 0
~WRITE-IR
Connection ~ 6750 5500
Wire Wire Line
	6750 2150 6750 5500
Text Notes 4000 6700 0    50   ~ 0
These solder jumpers can be used to change the meanings\nof the unused LEDs on the flag section of the front panel.\nThey should be fully bridged (ground, LED off) until this is required.\n\nThe bridge between pads 2 and 3 can be cut to change a bit on the\nIBus but not on the front panel.\n\nTo change it for both, cut the bridge between pads 1 and 2.
Connection ~ 6650 4900
Connection ~ 6650 5400
Wire Wire Line
	6650 4800 6650 4900
Wire Wire Line
	6650 4900 6650 5400
Wire Wire Line
	6650 5400 6650 5750
$Comp
L power:GND #PWR06
U 1 1 61E0C769
P 6650 5750
F 0 "#PWR06" H 6650 5500 50  0001 C CNN
F 1 "GND" H 6655 5577 50  0000 C CNN
F 2 "" H 6650 5750 50  0001 C CNN
F 3 "" H 6650 5750 50  0001 C CNN
	1    6650 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1550 6150 2050
Connection ~ 6150 1550
Wire Wire Line
	6150 2050 6150 2100
Connection ~ 6150 2050
$Comp
L power:GND #PWR05
U 1 1 61DEC249
P 6150 2100
F 0 "#PWR05" H 6150 1850 50  0001 C CNN
F 1 "GND" H 6155 1927 50  0000 C CNN
F 2 "" H 6150 2100 50  0001 C CNN
F 3 "" H 6150 2100 50  0001 C CNN
	1    6150 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1450 6150 1550
Wire Wire Line
	6650 4800 7600 4800
Wire Wire Line
	6650 4900 7600 4900
Wire Wire Line
	6650 5400 7600 5400
Wire Wire Line
	6150 1450 7600 1450
Wire Wire Line
	6150 2050 7600 2050
Wire Wire Line
	6150 1550 7600 1550
Text Notes 6150 1150 0    50   ~ 0
These traces are named, but connected to ground directly.\nThe traces on the board are long so they can be cut and the\nsignals repurposed (e.g. tied to Vcc).
Wire Wire Line
	4150 3150 5450 3150
$Comp
L alexios:74LVC1G0832 U6
U 1 1 5EE068C9
P 5800 3250
F 0 "U6" H 5825 3564 50  0000 C CNN
F 1 "74LVC1G0832" H 5825 3473 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 5800 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 5800 3250 50  0001 C CNN
	1    5800 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3250 5450 3250
Wire Wire Line
	5400 3350 5400 3400
Wire Wire Line
	5400 3400 4900 3400
Wire Wire Line
	5400 3350 5450 3350
$Comp
L alexios:74LVC1G0832 U6
U 2 1 5EE2A72B
P 1400 7250
F 0 "U6" H 1580 7204 50  0000 L CNN
F 1 "74LVC1G0832" H 1580 7295 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 1400 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 1400 7250 50  0001 C CNN
	2    1400 7250
	1    0    0    -1  
$EndComp
Text Label 4250 4450 0    50   ~ 0
~FLAGOE
Wire Wire Line
	4150 4450 6650 4450
Wire Wire Line
	7250 4650 7250 4050
Wire Wire Line
	6650 2350 6650 4450
NoConn ~ 4150 4550
Connection ~ 1050 7150
Connection ~ 1050 7350
Wire Bus Line
	2700 3800 2700 4550
Wire Bus Line
	2700 2500 2700 3250
Wire Bus Line
	9050 4900 9050 6150
Wire Bus Line
	9050 1550 9050 2850
$EndSCHEMATC
