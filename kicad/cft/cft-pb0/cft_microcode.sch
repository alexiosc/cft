EESchema Schematic File Version 4
LIBS:cft-pb0-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 12
Title "Control Store"
Date ""
Rev ""
Comp ""
Comment1 "CUB"
Comment2 ""
Comment3 ""
Comment4 "microcode_store.v"
$EndDescr
$Comp
L alexios:74AHC1G08 U?
U 1 1 5DEB2D66
P 2950 1300
AR Path="/5DEB2D66" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB2D66" Ref="U43"  Part="1" 
F 0 "U43" H 2875 1567 50  0000 C CNN
F 1 "74AHC1G08" H 2875 1476 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2600 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2600 1300 50  0001 C CNN
	1    2950 1300
	1    0    0    -1  
$EndComp
Text Label 1350 1250 0    50   ~ 0
~ENDEXT
Wire Wire Line
	1350 1350 2650 1350
Text HLabel 950  1250 0    50   Input ~ 0
~ENDEXT
Text Label 1350 1350 0    50   ~ 0
~END
Wire Wire Line
	4350 900  4250 900 
Wire Wire Line
	4250 900  4250 1000
Wire Wire Line
	4350 1000 4250 1000
Connection ~ 4250 1000
Wire Wire Line
	4250 1000 4250 1100
Wire Wire Line
	4350 1100 4250 1100
Connection ~ 4250 1100
Wire Wire Line
	4250 1100 4250 1200
Wire Wire Line
	4350 1200 4250 1200
Connection ~ 4250 1200
Wire Wire Line
	4250 1200 4250 1250
$Comp
L power:GND #PWR?
U 1 1 5DEB2D82
P 4250 1250
AR Path="/5DEB2D82" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5DEB2D82" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 4250 1000 50  0001 C CNN
F 1 "GND" H 4150 1300 50  0000 R CNN
F 2 "" H 4250 1250 50  0001 C CNN
F 3 "" H 4250 1250 50  0001 C CNN
	1    4250 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1400 4350 1400
Text Label 3150 1300 0    50   ~ 0
~µPCCLR
Text HLabel 950  1900 0    50   Input ~ 0
~RSTHOLD
Text Label 1350 1900 0    50   ~ 0
~RSTHOLD
Text Label 4300 1900 2    50   ~ 0
~RSTHOLD
Text Label 4150 1400 2    50   ~ 0
~µPCCLR
Wire Wire Line
	950  1900 4350 1900
Text HLabel 950  1500 0    50   Input ~ 0
~WS
Text Label 1350 1500 0    50   ~ 0
~WS
Wire Wire Line
	3100 1300 3550 1300
Wire Wire Line
	3550 1300 3550 1400
Text Label 4300 1500 2    50   ~ 0
~WS
Text Label 1350 1600 0    50   ~ 0
~HALT
Text HLabel 950  1600 0    50   Input ~ 0
~HALT
Text Label 1350 1700 0    50   ~ 0
CLK4
Text HLabel 950  1700 0    50   Input ~ 0
CLK4
NoConn ~ 5350 1400
Wire Wire Line
	5350 900  5700 900 
Wire Wire Line
	5350 1000 5700 1000
Wire Wire Line
	5350 1100 5700 1100
Wire Wire Line
	5350 1200 5700 1200
Text Label 5700 900  2    50   ~ 0
UPC0
Text Label 5700 1000 2    50   ~ 0
UPC1
Text Label 5700 1100 2    50   ~ 0
UPC2
Text Label 5700 1200 2    50   ~ 0
UPC3
Wire Wire Line
	950  1250 1000 1250
Text Label 4300 1600 2    50   ~ 0
~HALT
Text Label 4300 1700 2    50   ~ 0
CLK4
Text Notes 4250 2550 0    50   ~ 0
The µPC controls the running of the processor. It counts up to 16, so\nmicroprograms can only have  up to 16 steps. It resets to 0000 when the\nControl Unit asserts ~END~ or a processor extension card asserts ~ENDEXT~\non the bus.  It increments at the end of a processor cycle (rising edge of\nCLK4), and only when ~RSTHOLD~, ~HALT~ and ~WS~ are all deasserted.
Text Label 10450 3900 2    50   ~ 0
COND[0..4]
Text Label 10450 3200 2    50   ~ 0
WADDR[0..4]
Text HLabel 10500 2500 2    50   Output ~ 0
RADDR[0..4]
Text HLabel 10500 3200 2    50   Output ~ 0
WADDR[0..4]
Text HLabel 10500 3900 2    50   Output ~ 0
COND[0..4]
Text Notes 4100 850  2    100  ~ 20
Microprogram Counter (µPC)
Text Label 10450 4600 2    50   ~ 0
ACTION[0..3]
Text HLabel 10500 4600 2    50   Output ~ 0
ACTION[0..3]
$Comp
L alexios:74HC161 U?
U 1 1 5DEB2D71
P 4850 1400
AR Path="/5DEB2D71" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB2D71" Ref="U44"  Part="1" 
F 0 "U44" H 4850 2167 50  0000 C CNN
F 1 "74HC161" H 4850 2076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5150 1650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC161.pdf" H 5150 1650 50  0001 C CNN
	1    4850 1400
	1    0    0    -1  
$EndComp
Text Notes 3500 6350 0    50   ~ 0
2019 Design Update: both micro-Address Vector and\nmicro-Control Vector have changed significantly in this\nversion. Fields are much more vertical now.
Text Notes 3500 6050 0    63   ~ 13
2019 Design Update
Text HLabel 10500 5450 2    50   Output ~ 0
~MEM
Text HLabel 10500 5550 2    50   Output ~ 0
~IO
Text HLabel 10500 5650 2    50   Output ~ 0
~R
Text HLabel 10500 5750 2    50   Output ~ 0
~WEN
Text HLabel 10500 5850 2    50   Output ~ 0
~END
Text Notes 9200 5250 1    100  ~ 20
Microcode Control Vector
Wire Wire Line
	9300 3150 9700 3150
Wire Wire Line
	9300 3050 9700 3050
Wire Wire Line
	9300 2950 9700 2950
Wire Wire Line
	9300 2850 9700 2850
Wire Wire Line
	9300 2750 9700 2750
Wire Wire Line
	9300 3450 9700 3450
Wire Wire Line
	9300 3550 9700 3550
Wire Wire Line
	9300 3650 9700 3650
Wire Wire Line
	9300 3750 9700 3750
Wire Wire Line
	9300 3850 9700 3850
Wire Wire Line
	9300 4150 9700 4150
Wire Wire Line
	9300 4250 9700 4250
Wire Wire Line
	9300 4350 9700 4350
Wire Wire Line
	9300 4450 9700 4450
Wire Wire Line
	9300 4550 9700 4550
Wire Wire Line
	9300 4850 9700 4850
Wire Wire Line
	9300 4950 9700 4950
Wire Wire Line
	9300 5050 9700 5050
Wire Wire Line
	9300 5150 9700 5150
Wire Wire Line
	9300 5450 10500 5450
Wire Wire Line
	9300 5550 10500 5550
Wire Wire Line
	9300 5650 10500 5650
Wire Wire Line
	9300 5850 10500 5850
Wire Wire Line
	9300 5750 10500 5750
Text Label 9300 5150 0    50   ~ 0
ACTION3
Text Label 9300 5050 0    50   ~ 0
ACTION2
Text Label 9300 4950 0    50   ~ 0
ACTION1
Text Label 9300 4850 0    50   ~ 0
ACTION0
Text Label 9300 4550 0    50   ~ 0
COND4
Text Label 9300 4450 0    50   ~ 0
COND3
Text Label 9300 4350 0    50   ~ 0
COND2
Text Label 9300 4250 0    50   ~ 0
COND1
Text Label 9300 4150 0    50   ~ 0
COND0
Text Label 9300 3850 0    50   ~ 0
WADDR4
Text Label 9300 3750 0    50   ~ 0
WADDR3
Text Label 9300 3650 0    50   ~ 0
WADDR2
Text Label 9300 3550 0    50   ~ 0
WADDR1
Text Label 9300 3450 0    50   ~ 0
WADDR0
Text Label 9300 3150 0    50   ~ 0
RADDR4
Text Label 9300 3050 0    50   ~ 0
RADDR3
Text Label 9300 2950 0    50   ~ 0
RADDR2
Text Label 9300 2850 0    50   ~ 0
RADDR1
Text Label 9300 2750 0    50   ~ 0
RADDR0
Text Label 9300 5850 0    50   ~ 0
~END
Text Label 9300 5750 0    50   ~ 0
~WEN
Text Label 9300 5650 0    50   ~ 0
~R
Text Label 9300 5550 0    50   ~ 0
~IO
Text Label 9300 5450 0    50   ~ 0
~MEM
Entry Wire Line
	9800 2650 9700 2750
Entry Wire Line
	9800 2750 9700 2850
Entry Wire Line
	9800 2850 9700 2950
Entry Wire Line
	9800 2950 9700 3050
Entry Wire Line
	9800 3050 9700 3150
Entry Wire Line
	9800 3350 9700 3450
Entry Wire Line
	9800 3450 9700 3550
Entry Wire Line
	9800 3550 9700 3650
Entry Wire Line
	9800 3650 9700 3750
Entry Wire Line
	9800 3750 9700 3850
Entry Wire Line
	9800 4050 9700 4150
Entry Wire Line
	9800 4150 9700 4250
Entry Wire Line
	9800 4250 9700 4350
Entry Wire Line
	9800 4350 9700 4450
Entry Wire Line
	9800 4450 9700 4550
Entry Wire Line
	9800 4750 9700 4850
Entry Wire Line
	9800 4850 9700 4950
Entry Wire Line
	9800 4950 9700 5050
Entry Wire Line
	9800 5050 9700 5150
Entry Bus Bus
	9800 2600 9900 2500
Entry Bus Bus
	9800 3300 9900 3200
Entry Bus Bus
	9800 4000 9900 3900
Entry Bus Bus
	9800 4700 9900 4600
Wire Bus Line
	9900 3200 10500 3200
Wire Bus Line
	9900 3900 10500 3900
Wire Bus Line
	9900 4600 10500 4600
Text Label 10450 2500 2    50   ~ 0
RADDR[0..4]
Wire Bus Line
	9900 2500 10500 2500
Wire Wire Line
	1900 4450 1550 4450
Wire Wire Line
	1900 4350 1550 4350
Wire Wire Line
	1900 4250 1550 4250
Wire Wire Line
	1900 4150 1550 4150
Entry Wire Line
	1450 4050 1550 4150
Entry Wire Line
	1450 4150 1550 4250
Entry Wire Line
	1450 4250 1550 4350
Entry Wire Line
	1450 4350 1550 4450
Wire Wire Line
	1550 3650 1900 3650
Wire Wire Line
	1550 3750 1900 3750
Wire Wire Line
	1550 3850 1900 3850
Wire Wire Line
	1550 3950 1900 3950
Wire Wire Line
	1550 4050 1900 4050
Entry Wire Line
	1450 3550 1550 3650
Entry Wire Line
	1450 3650 1550 3750
Entry Wire Line
	1450 3750 1550 3850
Entry Wire Line
	1450 3850 1550 3950
Entry Wire Line
	1450 3950 1550 4050
Text Label 1900 3650 2    50   ~ 0
IR7
Text Label 1900 3750 2    50   ~ 0
IR8
Text Label 1900 3850 2    50   ~ 0
IR9
Text Label 1900 3950 2    50   ~ 0
IR10
Text Label 1900 4050 2    50   ~ 0
IR11
Text Label 1900 4150 2    50   ~ 0
IR12
Text Label 1900 4250 2    50   ~ 0
IR13
Text Label 1900 4350 2    50   ~ 0
IR14
Text Label 1900 4450 2    50   ~ 0
IR15
Text HLabel 950  4650 0    50   Input ~ 0
~IRQSµC
Text HLabel 950  4750 0    50   Input ~ 0
~RSTHOLD
Wire Wire Line
	950  4650 1900 4650
Wire Wire Line
	950  4750 1900 4750
Text Label 1900 4650 2    50   ~ 0
~IRQSµC
Text Label 1900 4750 2    50   ~ 0
~RSTHOLD
Wire Wire Line
	950  4850 1500 4850
Text HLabel 950  4850 0    50   Input ~ 0
IN-RSVD
Text Label 1900 4850 2    50   ~ 0
IN-RSVD
Text Label 1900 2900 2    50   ~ 0
IDX0
Text Label 1900 3000 2    50   ~ 0
IDX1
Wire Wire Line
	1900 3000 1550 3000
Wire Wire Line
	1900 2900 1550 2900
Wire Wire Line
	950  3200 1900 3200
Text Label 1900 3200 2    50   ~ 0
COND
Text HLabel 950  3200 0    50   Input ~ 0
COND
Entry Bus Bus
	1450 3500 1350 3400
Text Label 1000 3400 0    50   ~ 0
IR[7..15]
Text HLabel 950  3400 0    50   Input ~ 0
IR[7..15]
Wire Bus Line
	950  3400 1350 3400
Text Notes 2200 4850 1    100  ~ 20
Microcode Address Vector
Wire Wire Line
	950  1500 4350 1500
Wire Wire Line
	950  1700 4350 1700
Text HLabel 10500 6150 2    50   3State ~ 0
FPD[0..7]
Text Label 9300 6150 0    50   ~ 0
FPD[0..7]
Wire Bus Line
	10500 6150 9300 6150
$Comp
L power:+5V #PWR0108
U 1 1 5E28DA06
P 8200 4950
AR Path="/5DEAC282/5E28DA06" Ref="#PWR0108"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E28DA06" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 8200 4800 50  0001 C CNN
F 1 "+5V" H 8215 5123 50  0000 C CNN
F 2 "" H 8200 4950 50  0001 C CNN
F 3 "" H 8200 4950 50  0001 C CNN
	1    8200 4950
	1    0    0    -1  
$EndComp
Entry Wire Line
	1450 2900 1550 3000
Entry Wire Line
	1450 2800 1550 2900
Entry Bus Bus
	1450 2750 1350 2650
Text Label 7550 3400 0    50   ~ 0
COND0
Text Label 7550 3500 0    50   ~ 0
COND1
Text Label 7550 3600 0    50   ~ 0
COND2
Text Label 7550 3700 0    50   ~ 0
COND3
Text Label 7550 3800 0    50   ~ 0
COND4
Wire Wire Line
	7900 3400 7550 3400
Wire Wire Line
	7900 3500 7550 3500
Wire Wire Line
	7900 3600 7550 3600
Wire Wire Line
	7900 3700 7550 3700
Wire Wire Line
	7900 3800 7550 3800
$Comp
L alexios:SN74ACT1071 U?
U 1 1 5E1680B3
P 8400 3900
AR Path="/5DEAC282/5DEAA264/5E1680B3" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E1680B3" Ref="U47"  Part="1" 
AR Path="/5E1680B3" Ref="U?"  Part="1" 
F 0 "U47" H 8350 4700 50  0000 L CNN
F 1 "SN74ACT1071" H 8150 4600 50  0000 L CNN
F 2 "alexios:SOIC-14" H 8100 4250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 8100 4250 50  0001 C CNN
	1    8400 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3900 7550 3900
Text Label 7550 3900 0    50   ~ 0
~END
$Sheet
S 5450 3150 1150 2750
U 5D82AC00
F0 "Sheet5D82ABFF" 50
F1 "cpu_microcode_fp.sch" 50
F2 "RADDR0" I R 6600 3300 50 
F3 "RADDR1" I R 6600 3400 50 
F4 "RADDR2" I R 6600 3500 50 
F5 "RADDR3" I R 6600 3600 50 
F6 "RADDR4" I R 6600 3700 50 
F7 "WADDR0" I R 6600 3800 50 
F8 "WADDR1" I R 6600 3900 50 
F9 "WADDR2" I R 6600 4000 50 
F10 "WADDR3" I R 6600 4100 50 
F11 "WADDR4" I R 6600 4200 50 
F12 "COND0" I R 6600 4300 50 
F13 "COND1" I R 6600 4400 50 
F14 "COND2" I R 6600 4500 50 
F15 "COND3" I R 6600 4600 50 
F16 "COND4" I R 6600 4700 50 
F17 "ACTION0" I R 6600 4800 50 
F18 "ACTION1" I R 6600 4900 50 
F19 "ACTION2" I R 6600 5000 50 
F20 "ACTION3" I R 6600 5100 50 
F21 "~MEM" I R 6600 5200 50 
F22 "~IO" I R 6600 5300 50 
F23 "~R" I R 6600 5400 50 
F24 "~WEN" I R 6600 5500 50 
F25 "~END" I R 6600 5600 50 
F26 "FPD[0..7]" I R 6600 5800 50 
F27 "~FPµA0" I L 5450 5300 50 
F28 "~FPµA1" I L 5450 5400 50 
F29 "~FPµA2" I L 5450 5500 50 
F30 "~FPµC0" I L 5450 5600 50 
F31 "~FPµC1" I L 5450 5700 50 
F32 "~FPµC2" I L 5450 5800 50 
F33 "UPC0" I L 5450 3300 50 
F34 "UPC1" I L 5450 3400 50 
F35 "UPC2" I L 5450 3500 50 
F36 "UPC3" I L 5450 3600 50 
F37 "IDX0" I L 5450 3700 50 
F38 "IDX1" I L 5450 3800 50 
F39 "COND" I L 5450 3900 50 
F40 "IN-RSVD" I L 5450 4000 50 
F41 "IR7" I L 5450 4100 50 
F42 "IR8" I L 5450 4200 50 
F43 "IR9" I L 5450 4300 50 
F44 "IR10" I L 5450 4400 50 
F45 "IR11" I L 5450 4500 50 
F46 "IR12" I L 5450 4600 50 
F47 "IR13" I L 5450 4700 50 
F48 "IR14" I L 5450 4800 50 
F49 "IR15" I L 5450 4900 50 
F50 "~IRQSµC" I L 5450 5000 50 
F51 "~RSTHOLD" I L 5450 5100 50 
$EndSheet
Text Label 7050 5200 2    50   ~ 0
~MEM
Text Label 7050 5300 2    50   ~ 0
~IO
Text Label 7050 5400 2    50   ~ 0
~R
Text Label 7050 5500 2    50   ~ 0
~WEN
Text Label 7050 5600 2    50   ~ 0
~END
Text Label 7050 3300 2    50   ~ 0
RADDR0
Text Label 7050 3400 2    50   ~ 0
RADDR1
Text Label 7050 3500 2    50   ~ 0
RADDR2
Text Label 7050 3600 2    50   ~ 0
RADDR3
Text Label 7050 3700 2    50   ~ 0
RADDR4
Text Label 7050 3800 2    50   ~ 0
WADDR0
Text Label 7050 3900 2    50   ~ 0
WADDR1
Text Label 7050 4000 2    50   ~ 0
WADDR2
Text Label 7050 4100 2    50   ~ 0
WADDR3
Text Label 7050 4200 2    50   ~ 0
WADDR4
Text Label 7050 4300 2    50   ~ 0
COND0
Text Label 7050 4400 2    50   ~ 0
COND1
Text Label 7050 4500 2    50   ~ 0
COND2
Text Label 7050 4600 2    50   ~ 0
COND3
Text Label 7050 4700 2    50   ~ 0
COND4
Text Label 7050 4800 2    50   ~ 0
ACTION0
Text Label 7050 4900 2    50   ~ 0
ACTION1
Text Label 7050 5000 2    50   ~ 0
ACTION2
Text Label 7050 5100 2    50   ~ 0
ACTION3
Wire Wire Line
	6600 5500 7050 5500
Wire Wire Line
	6600 5600 7050 5600
Wire Wire Line
	6600 5400 7050 5400
Wire Wire Line
	6600 5300 7050 5300
Wire Wire Line
	6600 5200 7050 5200
Text Label 7050 5800 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	5450 5800 5050 5800
Wire Wire Line
	5450 5700 5050 5700
Wire Wire Line
	5450 5600 5050 5600
Wire Wire Line
	5450 5500 5050 5500
Wire Wire Line
	5450 5400 5050 5400
Wire Wire Line
	5450 5300 5050 5300
Text Label 5050 3300 0    50   ~ 0
UPC0
Text Label 5050 3400 0    50   ~ 0
UPC1
Text Label 5050 3500 0    50   ~ 0
UPC2
Text Label 5050 3600 0    50   ~ 0
UPC3
Text Label 5050 5000 0    50   ~ 0
~IRQSµC
Text Label 5050 5100 0    50   ~ 0
~RSTHOLD
Text Label 5050 3700 0    50   ~ 0
IDX0
Text Label 5050 3800 0    50   ~ 0
IDX1
Text Label 5050 4200 0    50   ~ 0
IR8
Text Label 5050 4300 0    50   ~ 0
IR9
Text Label 5050 4400 0    50   ~ 0
IR10
Text Label 5050 4500 0    50   ~ 0
IR11
Text Label 5050 4600 0    50   ~ 0
IR12
Text Label 5050 4700 0    50   ~ 0
IR13
Text Label 5050 4800 0    50   ~ 0
IR14
Text Label 5050 4900 0    50   ~ 0
IR15
Text Label 5050 4000 0    50   ~ 0
IN-RSVD
Text Label 5050 3900 0    50   ~ 0
COND
Text Label 5050 4100 0    50   ~ 0
IR7
Wire Wire Line
	5050 4900 5450 4900
Wire Wire Line
	5050 4800 5450 4800
Wire Wire Line
	5050 4700 5450 4700
Wire Wire Line
	5050 4600 5450 4600
Wire Wire Line
	5050 4500 5450 4500
Wire Wire Line
	5050 4400 5450 4400
Wire Wire Line
	5050 4300 5450 4300
Wire Wire Line
	5050 4200 5450 4200
Wire Wire Line
	5050 4100 5450 4100
Wire Wire Line
	5050 4000 5450 4000
Wire Wire Line
	5050 3900 5450 3900
Wire Wire Line
	5050 3800 5450 3800
Wire Wire Line
	5050 3700 5450 3700
Wire Wire Line
	5050 3600 5450 3600
Wire Wire Line
	5050 3500 5450 3500
Wire Wire Line
	5050 3400 5450 3400
Wire Wire Line
	5050 3300 5450 3300
Wire Wire Line
	5050 5000 5450 5000
Wire Wire Line
	5050 5100 5450 5100
Text Notes 6800 2950 2    100  ~ 20
Front Panel Buffers
Text Label 5050 5300 0    50   ~ 0
~FPµA0
Text Label 5050 5400 0    50   ~ 0
~FPµA1
Text Label 5050 5500 0    50   ~ 0
~FPµA2
Text Label 5050 5600 0    50   ~ 0
~FPµC0
Text Label 5050 5700 0    50   ~ 0
~FPµC1
Text Label 5050 5800 0    50   ~ 0
~FPµC2
Wire Bus Line
	6600 5800 7050 5800
Wire Wire Line
	6600 5100 7050 5100
Wire Wire Line
	6600 5000 7050 5000
Wire Wire Line
	6600 4900 7050 4900
Wire Wire Line
	6600 4800 7050 4800
Wire Wire Line
	6600 4700 7050 4700
Wire Wire Line
	6600 4600 7050 4600
Wire Wire Line
	6600 4500 7050 4500
Wire Wire Line
	6600 4400 7050 4400
Wire Wire Line
	6600 4300 7050 4300
Wire Wire Line
	6600 4200 7050 4200
Wire Wire Line
	6600 4100 7050 4100
Wire Wire Line
	6600 4000 7050 4000
Wire Wire Line
	6600 3900 7050 3900
Wire Wire Line
	6600 3800 7050 3800
Wire Wire Line
	6600 3700 7050 3700
Wire Wire Line
	6600 3600 7050 3600
Wire Wire Line
	6600 3500 7050 3500
Wire Wire Line
	6600 3400 7050 3400
Wire Wire Line
	6600 3300 7050 3300
Text Label 4550 5200 2    50   ~ 0
~MEM
Text Label 4550 5300 2    50   ~ 0
~IO
Text Label 4550 5400 2    50   ~ 0
~R
Text Label 4550 5500 2    50   ~ 0
~WEN
Text Label 4550 5600 2    50   ~ 0
~END
Text Notes 4200 2950 2    100  ~ 20
Microcode Store
Text Label 4550 3300 2    50   ~ 0
RADDR0
Text Label 4550 3400 2    50   ~ 0
RADDR1
Text Label 4550 3500 2    50   ~ 0
RADDR2
Text Label 4550 3600 2    50   ~ 0
RADDR3
Text Label 4550 3700 2    50   ~ 0
RADDR4
Text Label 4550 3800 2    50   ~ 0
WADDR0
Text Label 4550 3900 2    50   ~ 0
WADDR1
Text Label 4550 4000 2    50   ~ 0
WADDR2
Text Label 4550 4100 2    50   ~ 0
WADDR3
Text Label 4550 4200 2    50   ~ 0
WADDR4
Text Label 4550 4300 2    50   ~ 0
COND0
Text Label 4550 4400 2    50   ~ 0
COND1
Text Label 4550 4500 2    50   ~ 0
COND2
Text Label 4550 4600 2    50   ~ 0
COND3
Text Label 4550 4700 2    50   ~ 0
COND4
Text Label 4550 4800 2    50   ~ 0
ACTION0
Text Label 4550 4900 2    50   ~ 0
ACTION1
Text Label 4550 5000 2    50   ~ 0
ACTION2
Text Label 4550 5100 2    50   ~ 0
ACTION3
$Sheet
S 2950 3150 1150 2600
U 5E34FD9B
F0 "Microcode Store" 50
F1 "cpu_microcode_store.sch" 50
F2 "UPC0" I L 2950 3300 50 
F3 "UPC1" I L 2950 3400 50 
F4 "UPC2" I L 2950 3500 50 
F5 "UPC3" I L 2950 3600 50 
F6 "IDX0" I L 2950 3700 50 
F7 "IDX1" I L 2950 3800 50 
F8 "COND" I L 2950 3900 50 
F9 "IN-RSVD" I L 2950 4000 50 
F10 "IR7" I L 2950 4100 50 
F11 "IR8" I L 2950 4200 50 
F12 "IR9" I L 2950 4300 50 
F13 "IR10" I L 2950 4400 50 
F14 "IR11" I L 2950 4500 50 
F15 "IR12" I L 2950 4600 50 
F16 "IR13" I L 2950 4700 50 
F17 "IR14" I L 2950 4800 50 
F18 "IR15" I L 2950 4900 50 
F19 "~IRQSµC" I L 2950 5000 50 
F20 "~RSTHOLD" I L 2950 5100 50 
F21 "RADDR0" O R 4100 3300 50 
F22 "RADDR1" O R 4100 3400 50 
F23 "RADDR2" O R 4100 3500 50 
F24 "RADDR3" O R 4100 3600 50 
F25 "RADDR4" O R 4100 3700 50 
F26 "WADDR0" O R 4100 3800 50 
F27 "WADDR1" O R 4100 3900 50 
F28 "WADDR2" O R 4100 4000 50 
F29 "WADDR3" O R 4100 4100 50 
F30 "WADDR4" O R 4100 4200 50 
F31 "COND0" O R 4100 4300 50 
F32 "COND1" O R 4100 4400 50 
F33 "COND2" O R 4100 4500 50 
F34 "COND3" O R 4100 4600 50 
F35 "COND4" O R 4100 4700 50 
F36 "ACTION0" O R 4100 4800 50 
F37 "ACTION1" O R 4100 4900 50 
F38 "ACTION2" O R 4100 5000 50 
F39 "ACTION3" O R 4100 5100 50 
F40 "~MEM" O R 4100 5200 50 
F41 "~IO" O R 4100 5300 50 
F42 "~R" O R 4100 5400 50 
F43 "~WEN" O R 4100 5500 50 
F44 "~END" O R 4100 5600 50 
F45 "~µSE" I L 2950 5600 50 
$EndSheet
Wire Wire Line
	4100 5500 4550 5500
Wire Wire Line
	4100 5600 4550 5600
Wire Wire Line
	4100 5400 4550 5400
Wire Wire Line
	4100 5300 4550 5300
Text Label 2550 3300 0    50   ~ 0
UPC0
Text Label 2550 3400 0    50   ~ 0
UPC1
Text Label 2550 3500 0    50   ~ 0
UPC2
Text Label 2550 3600 0    50   ~ 0
UPC3
Text Label 2550 5000 0    50   ~ 0
~IRQSµC
Text Label 2550 5100 0    50   ~ 0
~RSTHOLD
Text Label 2550 3700 0    50   ~ 0
IDX0
Text Label 2550 3800 0    50   ~ 0
IDX1
Text Label 2550 4200 0    50   ~ 0
IR8
Text Label 2550 4300 0    50   ~ 0
IR9
Text Label 2550 4400 0    50   ~ 0
IR10
Text Label 2550 4500 0    50   ~ 0
IR11
Text Label 2550 4600 0    50   ~ 0
IR12
Text Label 2550 4700 0    50   ~ 0
IR13
Text Label 2550 4800 0    50   ~ 0
IR14
Text Label 2550 4900 0    50   ~ 0
IR15
Text Label 2550 4000 0    50   ~ 0
IN-RSVD
Text Label 2550 3900 0    50   ~ 0
COND
Text Label 2550 4100 0    50   ~ 0
IR7
Wire Wire Line
	2550 4900 2950 4900
Wire Wire Line
	2550 4800 2950 4800
Wire Wire Line
	2550 4700 2950 4700
Wire Wire Line
	2550 4600 2950 4600
Wire Wire Line
	2550 4500 2950 4500
Wire Wire Line
	2550 4400 2950 4400
Wire Wire Line
	2550 4300 2950 4300
Wire Wire Line
	2550 4200 2950 4200
Wire Wire Line
	2550 4100 2950 4100
Wire Wire Line
	2550 4000 2950 4000
Wire Wire Line
	2550 3900 2950 3900
Wire Wire Line
	2550 3800 2950 3800
Wire Wire Line
	2550 3700 2950 3700
Wire Wire Line
	2550 3600 2950 3600
Wire Wire Line
	2550 3500 2950 3500
Wire Wire Line
	2550 3400 2950 3400
Wire Wire Line
	2550 3300 2950 3300
Wire Wire Line
	4100 3300 4550 3300
Wire Wire Line
	4100 3400 4550 3400
Wire Wire Line
	4100 3500 4550 3500
Wire Wire Line
	4100 3600 4550 3600
Wire Wire Line
	4100 3700 4550 3700
Wire Wire Line
	2550 5000 2950 5000
Wire Wire Line
	2550 5100 2950 5100
Text Label 2550 5600 0    50   ~ 0
~µSE
Wire Wire Line
	4100 3800 4550 3800
Wire Wire Line
	4100 3900 4550 3900
Wire Wire Line
	4100 4000 4550 4000
Wire Wire Line
	4100 4100 4550 4100
Wire Wire Line
	4100 4200 4550 4200
Wire Wire Line
	4100 4300 4550 4300
Wire Wire Line
	4100 4400 4550 4400
Wire Wire Line
	4100 4500 4550 4500
Wire Wire Line
	4100 4600 4550 4600
Wire Wire Line
	4100 4700 4550 4700
Wire Wire Line
	4100 4800 4550 4800
Wire Wire Line
	4100 4900 4550 4900
Wire Wire Line
	4100 5000 4550 5000
Wire Wire Line
	4100 5100 4550 5100
Wire Wire Line
	4100 5200 4550 5200
Text Notes 8750 2900 2    100  ~ 20
Bus Hold
Text HLabel 950  2650 0    50   Input ~ 0
IDX[0..1]
Text Label 1000 2650 0    50   ~ 0
IDX[0..1]
Wire Bus Line
	950  2650 1350 2650
$Comp
L alexios:74HC85 U45
U 1 1 5FE49D00
P 8750 1500
F 0 "U45" H 8750 525 50  0000 C CNN
F 1 "74HC85" H 8750 434 50  0000 C CNN
F 2 "alexios:SOIC-16" H 8750 1525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 8750 1525 50  0001 C CNN
	1    8750 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2100 8150 2100
Connection ~ 8150 2100
Wire Wire Line
	8150 2100 8150 2300
Wire Wire Line
	8250 2300 8150 2300
Connection ~ 8150 2300
Wire Wire Line
	8150 2300 8150 2350
$Comp
L power:GND #PWR0107
U 1 1 5FE9AF52
P 8150 2350
F 0 "#PWR0107" H 8150 2100 50  0001 C CNN
F 1 "GND" H 8155 2177 50  0000 C CNN
F 2 "" H 8150 2350 50  0001 C CNN
F 3 "" H 8150 2350 50  0001 C CNN
	1    8150 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5FEA12FB
P 8050 2200
F 0 "#PWR0105" H 8050 2050 50  0001 C CNN
F 1 "+5V" V 8150 2200 50  0000 L CNN
F 2 "" H 8050 2200 50  0001 C CNN
F 3 "" H 8050 2200 50  0001 C CNN
	1    8050 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8050 2200 8250 2200
Text Label 10400 2100 2    50   ~ 0
FPFETCH
Text HLabel 10500 2100 2    50   Output ~ 0
FPFETCH
Wire Wire Line
	8250 1100 7900 1100
Wire Wire Line
	8250 1200 7900 1200
Wire Wire Line
	8250 1900 8150 1900
Wire Wire Line
	8150 1900 8150 2100
Wire Wire Line
	8250 1300 7900 1300
Wire Wire Line
	8250 1400 7900 1400
Text Label 7900 1100 0    50   ~ 0
UPC0
Text Label 7900 1200 0    50   ~ 0
UPC1
Text Label 7900 1300 0    50   ~ 0
UPC2
Text Label 7900 1400 0    50   ~ 0
UPC3
$Comp
L Switch:SW_DIP_x03 SW2
U 1 1 5F1C726F
P 7500 1250
F 0 "SW2" V 7500 1120 50  0000 R CNN
F 1 "SW_DIP_x03" V 7545 1580 50  0001 L CNN
F 2 "" H 7500 1250 50  0001 C CNN
F 3 "" H 7500 1250 50  0001 C CNN
	1    7500 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Network03 RN2
U 1 1 5F1C7404
P 7600 2100
F 0 "RN2" H 7420 2054 50  0000 R CNN
F 1 "4.7kΩ" H 7420 2145 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP4" V 7875 2100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7600 2100 50  0001 C CNN
	1    7600 2100
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5F1C7514
P 7500 2300
F 0 "#PWR0106" H 7500 2050 50  0001 C CNN
F 1 "GND" H 7505 2127 50  0000 C CNN
F 2 "" H 7500 2300 50  0001 C CNN
F 3 "" H 7500 2300 50  0001 C CNN
	1    7500 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 5F1C75A1
P 7500 900
F 0 "#PWR0103" H 7500 750 50  0001 C CNN
F 1 "+5V" H 7350 950 50  0000 C CNN
F 2 "" H 7500 900 50  0001 C CNN
F 3 "" H 7500 900 50  0001 C CNN
	1    7500 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 900  7600 900 
Wire Wire Line
	7700 900  7700 950 
Wire Wire Line
	7600 900  7600 950 
Connection ~ 7600 900 
Wire Wire Line
	7600 900  7700 900 
Wire Wire Line
	7500 900  7500 950 
Connection ~ 7500 900 
Wire Wire Line
	7500 1550 7500 1600
Wire Wire Line
	7600 1550 7600 1700
Wire Wire Line
	7700 1550 7700 1800
Wire Wire Line
	7500 1600 8250 1600
Connection ~ 7500 1600
Wire Wire Line
	7500 1600 7500 1900
Wire Wire Line
	7600 1700 8250 1700
Connection ~ 7600 1700
Wire Wire Line
	7600 1700 7600 1900
Wire Wire Line
	7700 1800 8250 1800
Connection ~ 7700 1800
Wire Wire Line
	7700 1800 7700 1900
NoConn ~ 9250 2200
NoConn ~ 9250 2300
$Comp
L alexios:74HC85 U45
U 2 1 5F4A7223
P 6250 7700
F 0 "U45" H 6250 8367 50  0000 C CNN
F 1 "74HC85" H 6250 8276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6250 7725 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 6250 7725 50  0001 C CNN
	2    6250 7700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F4ADA60
P 5900 7400
AR Path="/5CC0D65F/5F4ADA60" Ref="C?"  Part="1" 
AR Path="/5F4ADA60" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F4ADA60" Ref="C38"  Part="1" 
F 0 "C38" H 5809 7446 50  0000 R CNN
F 1 "100nF" H 5809 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5900 7400 50  0001 C CNN
F 3 "~" H 5900 7400 50  0001 C CNN
	1    5900 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5F4ADA67
P 5900 7500
F 0 "#PWR0120" H 5900 7250 50  0001 C CNN
F 1 "GND" H 5905 7327 50  0000 C CNN
F 2 "" H 5900 7500 50  0001 C CNN
F 3 "" H 5900 7500 50  0001 C CNN
	1    5900 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 5F4ADA6D
P 5900 7300
F 0 "#PWR0116" H 5900 7150 50  0001 C CNN
F 1 "+5V" H 5915 7473 50  0000 C CNN
F 2 "" H 5900 7300 50  0001 C CNN
F 3 "" H 5900 7300 50  0001 C CNN
	1    5900 7300
	1    0    0    -1  
$EndComp
Connection ~ 5900 7300
Connection ~ 5900 7500
Text Notes 9200 1850 0    50   ~ 0
High = Fetch.\nLow = Execute.\nThis is for the benefit of the front panel only.
Text Notes 7800 900  0    50   ~ 0
Set to 010 for Microcode v.7.
Wire Wire Line
	9250 2100 10500 2100
NoConn ~ 7900 4000
NoConn ~ 7900 4100
NoConn ~ 7900 4200
NoConn ~ 7900 4300
$Comp
L power:GND #PWR0109
U 1 1 5DB1C76A
P 1500 5100
F 0 "#PWR0109" H 1500 4850 50  0001 C CNN
F 1 "GND" H 1505 4927 50  0000 C CNN
F 2 "" H 1500 5100 50  0001 C CNN
F 3 "" H 1500 5100 50  0001 C CNN
	1    1500 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 4900 1500 4850
Connection ~ 1500 4850
Wire Wire Line
	1500 4850 1900 4850
Wire Wire Line
	950  1600 1150 1600
$Comp
L Device:R_Small R?
U 1 1 5DB1C764
P 1500 5000
AR Path="/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DB1C764" Ref="R26"  Part="1" 
AR Path="/5F67D4B5/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DB1C764" Ref="R?"  Part="1" 
F 0 "R26" H 1559 5046 50  0000 L CNN
F 1 "4.7kΩ" H 1559 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1500 5000 50  0001 C CNN
F 3 "~" H 1500 5000 50  0001 C CNN
	1    1500 5000
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DD09005
P 1000 950
AR Path="/5DD09005" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DD09005" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DD09005" Ref="R24"  Part="1" 
AR Path="/5F67D4B5/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DD09005" Ref="R?"  Part="1" 
F 0 "R24" H 1059 996 50  0000 L CNN
F 1 "4.7kΩ" H 1059 905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1000 950 50  0001 C CNN
F 3 "~" H 1000 950 50  0001 C CNN
	1    1000 950 
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DD0C349
P 1150 950
AR Path="/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DD0C349" Ref="R25"  Part="1" 
AR Path="/5F67D4B5/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DD0C349" Ref="R?"  Part="1" 
F 0 "R25" H 1091 904 50  0000 R CNN
F 1 "4.7kΩ" H 1091 995 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1150 950 50  0001 C CNN
F 3 "~" H 1150 950 50  0001 C CNN
	1    1150 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	1000 1050 1000 1250
Connection ~ 1000 1250
Wire Wire Line
	1000 1250 2650 1250
Wire Wire Line
	1150 1050 1150 1600
Connection ~ 1150 1600
Wire Wire Line
	1150 1600 2400 1600
Text Notes 1550 1500 0    50   ~ 0
(pulled up by the Wait State Handler circuitry)
$Comp
L power:+5V #PWR0101
U 1 1 5DD4145D
P 1000 850
F 0 "#PWR0101" H 1000 700 50  0001 C CNN
F 1 "+5V" H 850 950 50  0000 C CNN
F 2 "" H 1000 850 50  0001 C CNN
F 3 "" H 1000 850 50  0001 C CNN
	1    1000 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5DD4162D
P 1150 850
F 0 "#PWR0102" H 1150 700 50  0001 C CNN
F 1 "+5V" H 1250 950 50  0000 C CNN
F 2 "" H 1150 850 50  0001 C CNN
F 3 "" H 1150 850 50  0001 C CNN
	1    1150 850 
	1    0    0    -1  
$EndComp
Text HLabel 950  1800 0    50   Input ~ 0
~RESET
Wire Wire Line
	950  1800 2300 1800
Wire Wire Line
	2300 1800 2300 2250
Wire Wire Line
	2400 1600 2400 2250
Wire Wire Line
	2350 5600 2950 5600
Connection ~ 2400 1600
Wire Wire Line
	2400 1600 4350 1600
Text Label 1350 1800 0    50   ~ 0
~RESET
Text Label 2300 2250 1    50   ~ 0
~RESET
Text Label 2400 2250 1    50   ~ 0
~HALT
Text Notes 2500 2250 0    50   ~ 0
The Microcode Store is enabled\nwhen ~RESET~ and ~HALT~\nare both deasserted.
Text Label 1400 5750 2    50   ~ 0
~FPµA2
Text Label 1400 6150 2    50   ~ 0
~FPµĊ2
Text Label 1400 6050 2    50   ~ 0
~FPµĊ1
Text Label 1400 5950 2    50   ~ 0
~FPµĊ0
Text Label 1400 5650 2    50   ~ 0
~FPµA1
Text Label 1400 5550 2    50   ~ 0
~FPµA0
Wire Wire Line
	950  6150 1400 6150
Wire Wire Line
	950  6050 1400 6050
Wire Wire Line
	950  5950 1400 5950
Wire Wire Line
	950  5750 1400 5750
Wire Wire Line
	950  5650 1400 5650
Wire Wire Line
	950  5550 1400 5550
Text HLabel 950  6150 0    50   Input ~ 0
~FPµC2
Text HLabel 950  6050 0    50   Input ~ 0
~FPµC1
Text HLabel 950  5950 0    50   Input ~ 0
~FPµC0
Text HLabel 950  5750 0    50   Input ~ 0
~FPµA2
Text HLabel 950  5650 0    50   Input ~ 0
~FPµA1
Text HLabel 950  5550 0    50   Input ~ 0
~FPµA0
Connection ~ 900  6700
$Comp
L power:GND #PWR0112
U 1 1 5DEBA8B7
P 900 6700
F 0 "#PWR0112" H 900 6450 50  0001 C CNN
F 1 "GND" H 905 6527 50  0000 C CNN
F 2 "" H 900 6700 50  0001 C CNN
F 3 "" H 900 6700 50  0001 C CNN
	1    900  6700
	1    0    0    -1  
$EndComp
Connection ~ 900  6500
$Comp
L power:+5V #PWR0111
U 1 1 5DEBA174
P 900 6500
F 0 "#PWR0111" H 900 6350 50  0001 C CNN
F 1 "+5V" H 915 6673 50  0000 C CNN
F 2 "" H 900 6500 50  0001 C CNN
F 3 "" H 900 6500 50  0001 C CNN
	1    900  6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DEB8F55
P 900 6600
AR Path="/5CC0D65F/5DEB8F55" Ref="C?"  Part="1" 
AR Path="/5DEB8F55" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEB8F55" Ref="C34"  Part="1" 
F 0 "C34" H 809 6646 50  0000 R CNN
F 1 "100nF" H 809 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 900 6600 50  0001 C CNN
F 3 "~" H 900 6600 50  0001 C CNN
	1    900  6600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G08 U?
U 2 1 5DEB32A6
P 1350 6500
AR Path="/5DEB32A6" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB32A6" Ref="U48"  Part="2" 
F 0 "U48" H 1430 6446 50  0000 L CNN
F 1 "74AHC1G08" H 1430 6355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1000 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1000 6500 50  0001 C CNN
	2    1350 6500
	1    0    0    -1  
$EndComp
Connection ~ 900  7300
$Comp
L power:+5V #PWR0113
U 1 1 5DEBC983
P 900 7300
F 0 "#PWR0113" H 900 7150 50  0001 C CNN
F 1 "+5V" H 915 7473 50  0000 C CNN
F 2 "" H 900 7300 50  0001 C CNN
F 3 "" H 900 7300 50  0001 C CNN
	1    900  7300
	1    0    0    -1  
$EndComp
Connection ~ 900  7500
$Comp
L power:GND #PWR0117
U 1 1 5DEBC032
P 900 7500
F 0 "#PWR0117" H 900 7250 50  0001 C CNN
F 1 "GND" H 905 7327 50  0000 C CNN
F 2 "" H 900 7500 50  0001 C CNN
F 3 "" H 900 7500 50  0001 C CNN
	1    900  7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DEB9AAE
P 900 7400
AR Path="/5CC0D65F/5DEB9AAE" Ref="C?"  Part="1" 
AR Path="/5DEB9AAE" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEB9AAE" Ref="C35"  Part="1" 
F 0 "C35" H 809 7446 50  0000 R CNN
F 1 "100nF" H 809 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 900 7400 50  0001 C CNN
F 3 "~" H 900 7400 50  0001 C CNN
	1    900  7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC161 U?
U 2 1 5DEB3C99
P 1250 7800
AR Path="/5DEB3C99" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB3C99" Ref="U44"  Part="2" 
F 0 "U44" H 1430 8246 50  0000 L CNN
F 1 "74HC161" H 1430 8155 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1550 8050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 1550 8050 50  0001 C CNN
	2    1250 7800
	1    0    0    -1  
$EndComp
Connection ~ 2700 7300
Connection ~ 2700 7500
$Comp
L power:+5V #PWR0114
U 1 1 5DEBC5C9
P 2700 7300
F 0 "#PWR0114" H 2700 7150 50  0001 C CNN
F 1 "+5V" H 2715 7473 50  0000 C CNN
F 2 "" H 2700 7300 50  0001 C CNN
F 3 "" H 2700 7300 50  0001 C CNN
	1    2700 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5DEBAB17
P 2700 7500
F 0 "#PWR0118" H 2700 7250 50  0001 C CNN
F 1 "GND" H 2705 7327 50  0000 C CNN
F 2 "" H 2700 7500 50  0001 C CNN
F 3 "" H 2700 7500 50  0001 C CNN
	1    2700 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DEB9460
P 2700 7400
AR Path="/5CC0D65F/5DEB9460" Ref="C?"  Part="1" 
AR Path="/5DEB9460" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEB9460" Ref="C36"  Part="1" 
F 0 "C36" H 2609 7446 50  0000 R CNN
F 1 "100nF" H 2609 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2700 7400 50  0001 C CNN
F 3 "~" H 2700 7400 50  0001 C CNN
	1    2700 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G00 U?
U 2 1 5DEB36D4
P 3150 7300
AR Path="/5DEB36D4" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB36D4" Ref="U49"  Part="2" 
F 0 "U49" H 3230 7246 50  0000 L CNN
F 1 "74AHC1G00" H 3230 7155 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2800 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2800 7300 50  0001 C CNN
	2    3150 7300
	1    0    0    -1  
$EndComp
Text Notes 7550 4600 0    50   ~ 0
Note: The DFP adds bus hold\nto all other outputs.
Connection ~ 8200 4950
Connection ~ 8200 5350
Connection ~ 8200 5250
Connection ~ 8200 5050
$Comp
L alexios:SN74ACT1071 U?
U 2 1 5DA7AA39
P 8550 5450
AR Path="/5DEAC282/5DEAA264/5DA7AA39" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DA7AA39" Ref="U47"  Part="2" 
AR Path="/5DA7AA39" Ref="U?"  Part="1" 
F 0 "U47" H 8400 5150 50  0000 L CNN
F 1 "SN74ACT1071" H 8300 5250 50  0000 L CNN
F 2 "alexios:SOIC-14" H 8250 5800 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 8250 5800 50  0001 C CNN
	2    8550 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 5250 8200 5350
Wire Wire Line
	8200 5050 8200 4950
$Comp
L power:GND #PWR0110
U 1 1 5E28DA00
P 8200 5350
AR Path="/5DEAC282/5E28DA00" Ref="#PWR0110"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E28DA00" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 8200 5100 50  0001 C CNN
F 1 "GND" H 8205 5177 50  0000 C CNN
F 2 "" H 8200 5350 50  0001 C CNN
F 3 "" H 8200 5350 50  0001 C CNN
	1    8200 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E28D9FA
P 8200 5150
AR Path="/5CC0D65F/5E28D9FA" Ref="C?"  Part="1" 
AR Path="/5E28D9FA" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E28D9FA" Ref="C33"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E28D9FA" Ref="C?"  Part="1" 
F 0 "C33" H 8108 5196 50  0000 R CNN
F 1 "100nF" H 8108 5105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8200 5150 50  0001 C CNN
F 3 "~" H 8200 5150 50  0001 C CNN
	1    8200 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 5600 2350 2700
$Comp
L alexios:74LVC1G00 U46
U 1 1 5DD994A9
P 2350 2550
F 0 "U46" V 2229 2680 50  0000 L CNN
F 1 "74LVC1G00" V 2320 2680 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2000 2550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G00.pdf" H 2000 2550 50  0001 C CNN
	1    2350 2550
	0    1    1    0   
$EndComp
$Comp
L alexios:74LVC1G00 U46
U 2 1 5DF346BA
P 4650 7300
F 0 "U46" H 4730 7246 50  0000 L CNN
F 1 "74LVC1G00" H 4730 7155 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4300 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G00.pdf" H 4300 7300 50  0001 C CNN
	2    4650 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DF3702C
P 4200 7400
AR Path="/5CC0D65F/5DF3702C" Ref="C?"  Part="1" 
AR Path="/5DF3702C" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DF3702C" Ref="C37"  Part="1" 
F 0 "C37" H 4109 7446 50  0000 R CNN
F 1 "100nF" H 4109 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4200 7400 50  0001 C CNN
F 3 "~" H 4200 7400 50  0001 C CNN
	1    4200 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5DF37032
P 4200 7500
F 0 "#PWR0119" H 4200 7250 50  0001 C CNN
F 1 "GND" H 4205 7327 50  0000 C CNN
F 2 "" H 4200 7500 50  0001 C CNN
F 3 "" H 4200 7500 50  0001 C CNN
	1    4200 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0115
U 1 1 5DF37038
P 4200 7300
F 0 "#PWR0115" H 4200 7150 50  0001 C CNN
F 1 "+5V" H 4215 7473 50  0000 C CNN
F 2 "" H 4200 7300 50  0001 C CNN
F 3 "" H 4200 7300 50  0001 C CNN
	1    4200 7300
	1    0    0    -1  
$EndComp
Connection ~ 4200 7300
Connection ~ 4200 7500
Wire Bus Line
	1450 2750 1450 2900
Wire Bus Line
	9800 4700 9800 5050
Wire Bus Line
	9800 4000 9800 4450
Wire Bus Line
	9800 3300 9800 3750
Wire Bus Line
	9800 2600 9800 3050
Wire Bus Line
	1450 3500 1450 4350
$EndSCHEMATC
