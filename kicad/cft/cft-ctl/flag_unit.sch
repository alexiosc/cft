EESchema Schematic File Version 4
LIBS:cft-ctl-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 11
Title "Flag Unit"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "flag_unit.v"
$EndDescr
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
FPRSVD9
Text Label 7450 4800 0    50   ~ 0
FPRSVD8
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
FPD[0..7]
Text Label 9250 6050 1    50   ~ 0
FPD[0..7]
Text Label 9900 2650 2    50   ~ 0
IBUS[8..15]
Text Label 9250 2450 1    50   ~ 0
IBUS[8..15]
Text HLabel 10000 6250 2    50   3State ~ 0
FPD[0..7]
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
AR Path="/5D69F3FD/5D676F48" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 7800 5550 50  0001 C CNN
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
AR Path="/5D69F3FD/5D676F4E" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 7800 1900 50  0001 C CNN
F 1 "GND" H 7805 1977 50  0000 C CNN
F 2 "" H 7800 2150 50  0001 C CNN
F 3 "" H 7800 2150 50  0001 C CNN
	1    7800 2150
	1    0    0    -1  
$EndComp
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
AR Path="/5D69F3FD/5D676F64" Ref="U32"  Part="1" 
F 0 "U32" H 8300 6067 50  0000 C CNN
F 1 "74HC541" H 8300 5976 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8300 5300 50  0001 C CNN
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
AR Path="/5D69F3FD/5D676F7A" Ref="U27"  Part="1" 
F 0 "U27" H 8300 2417 50  0000 C CNN
F 1 "74HC541" H 8300 2326 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8300 1650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8300 1650 50  0001 C CNN
	1    8300 1650
	1    0    0    -1  
$EndComp
Text Label 2900 2950 1    50   ~ 0
WADDR[0..4]
Text Label 2900 4300 1    50   ~ 0
RADDR[0..4]
Text Label 2200 3450 0    50   ~ 0
RADDR[0..4]
Text Label 2200 2200 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	2100 3450 2800 3450
Wire Bus Line
	2100 2200 2800 2200
Entry Bus Bus
	2800 3450 2900 3550
Entry Bus Bus
	2800 2200 2900 2300
Entry Wire Line
	2900 4300 3000 4400
Entry Wire Line
	2900 4200 3000 4300
Entry Wire Line
	2900 3800 3000 3900
Entry Wire Line
	2900 3700 3000 3800
Entry Wire Line
	2900 3600 3000 3700
Entry Wire Line
	2900 3050 3000 3150
Entry Wire Line
	2900 2950 3000 3050
Entry Wire Line
	2900 2550 3000 2650
Entry Wire Line
	2900 2450 3000 2550
Entry Wire Line
	2900 2350 3000 2450
Wire Wire Line
	3350 2450 3000 2450
Wire Wire Line
	3350 2550 3000 2550
Wire Wire Line
	3000 2650 3350 2650
Wire Wire Line
	3350 3700 3000 3700
Wire Wire Line
	3350 3800 3000 3800
Wire Wire Line
	3000 3900 3350 3900
Wire Wire Line
	3350 4400 3000 4400
Wire Wire Line
	3350 4300 3000 4300
Text Label 5950 3000 2    50   ~ 0
~FLAGWE
Wire Wire Line
	4350 4200 5200 4200
Wire Wire Line
	4350 4300 5200 4300
Text Label 5200 4200 2    50   ~ 0
~READ-MBP+FLAGS
Text Label 5200 4300 2    50   ~ 0
~READ-FLAGS
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
Text Label 3000 4400 0    50   ~ 0
RADDR4
Text Label 3000 4300 0    50   ~ 0
RADDR3
Text Label 3000 3900 0    50   ~ 0
RADDR2
Text Label 3000 3800 0    50   ~ 0
RADDR1
Text Label 3000 3700 0    50   ~ 0
RADDR0
$Comp
L alexios:74HC138 U?
U 1 1 5D676FFB
P 3850 4100
AR Path="/5F3EA987/5D676FFB" Ref="U?"  Part="1" 
AR Path="/5D676FFB" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5D676FFB" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676FFB" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676FFB" Ref="U30"  Part="1" 
F 0 "U30" H 3850 4767 50  0000 C CNN
F 1 "74HC138" H 3850 4676 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3850 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 4100 50  0001 C CNN
	1    3850 4100
	1    0    0    -1  
$EndComp
Text Notes 3900 4350 1    50   ~ 10
RADDR=011xx
Text Label 5200 3050 2    50   ~ 0
~WRITE-FLAGS
Text Label 5200 2950 2    50   ~ 0
~WRITE-MBP+FLAGS
Wire Wire Line
	4350 3050 5200 3050
Wire Wire Line
	4350 2950 5200 2950
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
AR Path="/5D69F3FD/5D67700F" Ref="U28"  Part="1" 
F 0 "U28" H 3850 3517 50  0000 C CNN
F 1 "74HC138" H 3850 3426 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3850 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 2850 50  0001 C CNN
	1    3850 2850
	1    0    0    -1  
$EndComp
Text Notes 3900 3100 1    50   ~ 10
WADDR=011xx
Text HLabel 2100 2200 0    50   Input ~ 0
WADDR[0..4]
Text HLabel 2100 3450 0    50   Input ~ 0
RADDR[0..4]
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
Text Label 7450 5400 0    50   ~ 0
FPRSVD14
Wire Wire Line
	3000 3050 3350 3050
Wire Wire Line
	3000 3150 3350 3150
Text Label 3000 3050 0    50   ~ 0
WADDR3
Text Label 3000 3150 0    50   ~ 0
WADDR4
$Comp
L power:GND #PWR0172
U 1 1 5DFDCB26
P 3350 4500
F 0 "#PWR0172" H 3350 4250 50  0001 C CNN
F 1 "GND" H 3355 4327 50  0000 C CNN
F 2 "" H 3350 4500 50  0001 C CNN
F 3 "" H 3350 4500 50  0001 C CNN
	1    3350 4500
	1    0    0    -1  
$EndComp
Text Notes 4550 3550 0    50   ~ 0
RADDR or WADDR = 01101 → Read/Write MBP & Flags\nRADDR or WADDR = 01110 → Read/Write Flags
Text Notes 8350 3700 0    50   ~ 0
Individual flags respond to ~FLAGWE~ assertions\nby sampling the appropriate bit of the IBUS and\nmodifying their values.\n\nThe only flags that can currently be set this way\nare FI, FL and FV. FZ and FN are controlled by the\ncurrent value of the AC.
Text Label 8850 4800 0    50   ~ 0
FPD0
Text Label 8850 4900 0    50   ~ 0
FPD1
Text Label 8850 5000 0    50   ~ 0
FPD2
Text Label 8850 5100 0    50   ~ 0
FPD3
Text Label 8850 5200 0    50   ~ 0
FPD4
Text Label 8850 5300 0    50   ~ 0
FPD5
Text Label 8850 5400 0    50   ~ 0
FPD6
Text Label 8850 5500 0    50   ~ 0
FPD7
Text Notes 3900 6650 0    50   ~ 0
These solder jumpers can be used to change the meanings\nof the unused LEDs on the flag section of the front panel.\nThey should be fully bridged (ground, LED off) until this is required.
$Comp
L Jumper:SolderJumper_3_Bridged123 JP1
U 1 1 5E0D2D96
P 4150 7200
F 0 "JP1" V 4150 7267 50  0000 L CNN
F 1 "SolderJumper_3_Bridged123" V 4105 7267 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged2Bar12_Pad1.0x1.5mm" H 4150 7200 50  0001 C CNN
F 3 "~" H 4150 7200 50  0001 C CNN
	1    4150 7200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 7200 4650 7200
Text Label 4650 7200 2    50   ~ 0
FPRSVD8
Wire Wire Line
	4150 7000 3850 7000
Text Label 3850 7000 0    50   ~ 0
RSVD8
$Comp
L power:GND #PWR0173
U 1 1 5E0E6829
P 4150 7400
F 0 "#PWR0173" H 4150 7150 50  0001 C CNN
F 1 "GND" H 4155 7227 50  0000 C CNN
F 2 "" H 4150 7400 50  0001 C CNN
F 3 "" H 4150 7400 50  0001 C CNN
	1    4150 7400
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged123 JP2
U 1 1 5E0F938B
P 5100 7200
F 0 "JP2" V 5100 7267 50  0000 L CNN
F 1 "SolderJumper_3_Bridged123" V 5055 7267 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged2Bar12_Pad1.0x1.5mm" H 5100 7200 50  0001 C CNN
F 3 "~" H 5100 7200 50  0001 C CNN
	1    5100 7200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 7200 5600 7200
Text Label 5600 7200 2    50   ~ 0
FPRSVD9
Wire Wire Line
	5100 7000 4800 7000
Text Label 4800 7000 0    50   ~ 0
RSVD9
$Comp
L power:GND #PWR0174
U 1 1 5E0F9395
P 5100 7400
F 0 "#PWR0174" H 5100 7150 50  0001 C CNN
F 1 "GND" H 5105 7227 50  0000 C CNN
F 2 "" H 5100 7400 50  0001 C CNN
F 3 "" H 5100 7400 50  0001 C CNN
	1    5100 7400
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged123 JP3
U 1 1 5E104138
P 6050 7200
F 0 "JP3" V 6050 7267 50  0000 L CNN
F 1 "SolderJumper_3_Bridged123" V 6005 7267 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged2Bar12_Pad1.0x1.5mm" H 6050 7200 50  0001 C CNN
F 3 "~" H 6050 7200 50  0001 C CNN
	1    6050 7200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6200 7200 6550 7200
Text Label 6550 7200 2    50   ~ 0
FPRSVD14
Wire Wire Line
	6050 7000 5750 7000
Text Label 5750 7000 0    50   ~ 0
RSVD14
$Comp
L power:GND #PWR0175
U 1 1 5E104142
P 6050 7400
F 0 "#PWR0175" H 6050 7150 50  0001 C CNN
F 1 "GND" H 6055 7227 50  0000 C CNN
F 2 "" H 6050 7400 50  0001 C CNN
F 3 "" H 6050 7400 50  0001 C CNN
	1    6050 7400
	1    0    0    -1  
$EndComp
Text Notes 4800 4500 0    50   ~ 0
AND gate IC shared with AIL.
$Comp
L power:+5V #PWR?
U 1 1 5DDC2767
P 9850 1500
AR Path="/5F4B0011/5DDC2767" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC2767" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC2767" Ref="#PWR0176"  Part="1" 
F 0 "#PWR0176" H 9850 1350 50  0001 C CNN
F 1 "+5V" H 9865 1673 50  0000 C CNN
F 2 "" H 9850 1500 50  0001 C CNN
F 3 "" H 9850 1500 50  0001 C CNN
	1    9850 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDC276D
P 9850 1700
AR Path="/5DDC276D" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5DDC276D" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC276D" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC276D" Ref="#PWR0177"  Part="1" 
F 0 "#PWR0177" H 9850 1450 50  0001 C CNN
F 1 "GND" H 9855 1527 50  0000 C CNN
F 2 "" H 9850 1700 50  0001 C CNN
F 3 "" H 9850 1700 50  0001 C CNN
	1    9850 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DDC2773
P 9850 1600
AR Path="/5CC0D65F/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5F63066B/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5D69F3FD/5DDC2773" Ref="C44"  Part="1" 
F 0 "C44" H 9759 1646 50  0000 R CNN
F 1 "100nF" H 9759 1555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9850 1600 50  0001 C CNN
F 3 "~" H 9850 1600 50  0001 C CNN
	1    9850 1600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5DDC2779
P 10200 1600
AR Path="/5F4B0011/5DDC2779" Ref="U?"  Part="2" 
AR Path="/5F63066B/5DDC2779" Ref="U?"  Part="2" 
AR Path="/5D69F3FD/5DDC2779" Ref="U27"  Part="2" 
F 0 "U27" H 10380 1646 50  0000 L CNN
F 1 "74HC541" H 10380 1555 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10200 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 10200 1600 50  0001 C CNN
	2    10200 1600
	1    0    0    -1  
$EndComp
Connection ~ 9850 1700
Connection ~ 9850 1500
$Comp
L power:+5V #PWR?
U 1 1 5DDC83A1
P 9850 5100
AR Path="/5F4B0011/5DDC83A1" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC83A1" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC83A1" Ref="#PWR0178"  Part="1" 
F 0 "#PWR0178" H 9850 4950 50  0001 C CNN
F 1 "+5V" H 9865 5273 50  0000 C CNN
F 2 "" H 9850 5100 50  0001 C CNN
F 3 "" H 9850 5100 50  0001 C CNN
	1    9850 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDC83A7
P 9850 5300
AR Path="/5DDC83A7" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5DDC83A7" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC83A7" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC83A7" Ref="#PWR0179"  Part="1" 
F 0 "#PWR0179" H 9850 5050 50  0001 C CNN
F 1 "GND" H 9855 5127 50  0000 C CNN
F 2 "" H 9850 5300 50  0001 C CNN
F 3 "" H 9850 5300 50  0001 C CNN
	1    9850 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DDC83AD
P 9850 5200
AR Path="/5CC0D65F/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5F63066B/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5D69F3FD/5DDC83AD" Ref="C45"  Part="1" 
F 0 "C45" H 9759 5246 50  0000 R CNN
F 1 "100nF" H 9759 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9850 5200 50  0001 C CNN
F 3 "~" H 9850 5200 50  0001 C CNN
	1    9850 5200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5DDC83B3
P 10200 5200
AR Path="/5F4B0011/5DDC83B3" Ref="U?"  Part="2" 
AR Path="/5F63066B/5DDC83B3" Ref="U?"  Part="2" 
AR Path="/5D69F3FD/5DDC83B3" Ref="U32"  Part="2" 
F 0 "U32" H 10380 5246 50  0000 L CNN
F 1 "74HC541" H 10380 5155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10200 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 10200 5200 50  0001 C CNN
	2    10200 5200
	1    0    0    -1  
$EndComp
Connection ~ 9850 5300
Connection ~ 9850 5100
Text Label 3000 3250 0    50   ~ 0
CLK4
Text HLabel 2100 3250 0    50   Input ~ 0
CLK4
Text Label 2200 3250 0    50   ~ 0
CLK4
Text Notes 7700 4400 0    98   ~ 20
Front Panel Buffer
Wire Wire Line
	2100 3250 3350 3250
Wire Bus Line
	2900 3550 2900 4300
Wire Bus Line
	2900 2300 2900 3050
Wire Bus Line
	9250 4900 9250 6150
Wire Bus Line
	9250 1250 9250 2550
$Comp
L alexios:74LVC1G08 U22
U 1 1 610F8BD1
P 5500 3000
F 0 "U22" H 5425 3267 50  0000 C CNN
F 1 "74LVC1G08" H 5425 3176 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5150 3000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5150 3000 50  0001 C CNN
	1    5500 3000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U29
U 1 1 610F934E
P 5500 4250
F 0 "U29" H 5425 4517 50  0000 C CNN
F 1 "74LVC1G08" H 5425 4426 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5150 4250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5150 4250 50  0001 C CNN
	1    5500 4250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
