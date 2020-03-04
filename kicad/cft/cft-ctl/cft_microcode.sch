EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 11
Title "Microcode Sequencer"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "sequencer.v"
$EndDescr
$Comp
L alexios:74AHC1G08 U?
U 1 1 5DEB2D66
P 2150 1550
AR Path="/5DEB2D66" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB2D66" Ref="U43"  Part="1" 
F 0 "U43" H 2075 1817 50  0000 C CNN
F 1 "74LVC1G08" H 2075 1726 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1800 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1800 1550 50  0001 C CNN
	1    2150 1550
	1    0    0    -1  
$EndComp
Text Label 1550 1500 0    50   ~ 0
~ENDEXT
Wire Wire Line
	1550 1600 1850 1600
Text HLabel 1150 1500 0    50   Input ~ 0
~ENDEXT
Text Label 1550 1600 0    50   ~ 0
~END
Wire Wire Line
	3750 1150 3650 1150
Wire Wire Line
	3650 1150 3650 1250
Wire Wire Line
	3750 1250 3650 1250
Connection ~ 3650 1250
Wire Wire Line
	3650 1250 3650 1350
Wire Wire Line
	3750 1350 3650 1350
Connection ~ 3650 1350
Wire Wire Line
	3650 1350 3650 1450
Wire Wire Line
	3750 1450 3650 1450
Connection ~ 3650 1450
Wire Wire Line
	3650 1450 3650 1500
$Comp
L power:GND #PWR?
U 1 1 5DEB2D82
P 3650 1500
AR Path="/5DEB2D82" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5DEB2D82" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 3650 1250 50  0001 C CNN
F 1 "GND" H 3550 1550 50  0000 R CNN
F 2 "" H 3650 1500 50  0001 C CNN
F 3 "" H 3650 1500 50  0001 C CNN
	1    3650 1500
	1    0    0    -1  
$EndComp
Text Label 2350 1550 0    50   ~ 0
~µPCCLR
Text HLabel 1150 2150 0    50   Input ~ 0
~RSTHOLD
Text Label 3700 2150 2    50   ~ 0
~RSTHOLD
Text Label 3550 1650 2    50   ~ 0
~µPCCLR
Wire Wire Line
	1150 2150 3750 2150
Text HLabel 1150 1750 0    50   Input ~ 0
~WS
Text Label 1550 1750 0    50   ~ 0
~WS
Wire Wire Line
	2300 1550 2700 1550
Wire Wire Line
	2700 1550 2700 1650
Text Label 3700 1750 2    50   ~ 0
~WS
Text Label 1550 1850 0    50   ~ 0
~HALT
Text HLabel 1150 1850 0    50   Input ~ 0
~HALT
Text Label 1550 1950 0    50   ~ 0
CLK4
Text HLabel 1150 1950 0    50   Input ~ 0
CLK4
NoConn ~ 4750 1650
Wire Wire Line
	4750 1150 5000 1150
Wire Wire Line
	4750 1250 5000 1250
Wire Wire Line
	4750 1350 5000 1350
Wire Wire Line
	4750 1450 5000 1450
Text Label 5000 1150 2    50   ~ 0
UPC0
Text Label 5000 1250 2    50   ~ 0
UPC1
Text Label 5000 1350 2    50   ~ 0
UPC2
Text Label 5000 1450 2    50   ~ 0
UPC3
Wire Wire Line
	1150 1500 1200 1500
Text Label 3700 1850 2    50   ~ 0
~HALT
Text Label 3700 1950 2    50   ~ 0
CLK4
Text Notes 1600 -250 0    50   ~ 0
The µPC controls the running of the processor. It counts up to 16, so\nmicroprograms can only have up to 16 steps. It resets to 0000 when the\nControl Unit asserts ~END~ or a processor extension card asserts ~ENDEXT~\non the bus.  It increments at the end of a processor cycle (rising edge of\nCLK4), and only when ~RSTHOLD~, ~HALT~ and ~WS~ are all deasserted.
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
Text Notes 1650 950  0    100  ~ 20
Microprogram Counter (µPC)
Text Label 10450 4600 2    50   ~ 0
ACTION[0..3]
Text HLabel 10500 4600 2    50   Output ~ 0
ACTION[0..3]
$Comp
L alexios:74HC161 U?
U 1 1 5DEB2D71
P 4250 1650
AR Path="/5DEB2D71" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB2D71" Ref="U44"  Part="1" 
F 0 "U44" H 4250 2417 50  0000 C CNN
F 1 "74HC161" H 4250 2326 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4550 1900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC161.pdf" H 4550 1900 50  0001 C CNN
	1    4250 1650
	1    0    0    -1  
$EndComp
Text Notes -3900 1000 0    50   ~ 0
2019 Design Update: both micro-Address Vector and\nmicro-Control Vector have changed significantly in this\nversion. Fields are much more vertical now.
Text Notes -3950 700  0    63   ~ 13
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
Text HLabel 1150 4900 0    50   Input ~ 0
~IRQSµC
Text HLabel 1150 5000 0    50   Input ~ 0
~RSTHOLD
Text HLabel 1150 3800 0    50   Input ~ 0
~COND
Wire Wire Line
	1150 1750 3750 1750
Wire Wire Line
	1150 1950 3750 1950
Text HLabel 6650 5700 2    50   3State ~ 0
FPD[0..7]
$Comp
L power:+5V #PWR0108
U 1 1 5E28DA06
P 7650 4900
AR Path="/5DEAC282/5E28DA06" Ref="#PWR0108"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E28DA06" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 7650 4750 50  0001 C CNN
F 1 "+5V" H 7665 5073 50  0000 C CNN
F 2 "" H 7650 4900 50  0001 C CNN
F 3 "" H 7650 4900 50  0001 C CNN
	1    7650 4900
	1    0    0    -1  
$EndComp
Text Label 7000 3350 0    50   ~ 0
COND0
Text Label 7000 3450 0    50   ~ 0
COND1
Text Label 7000 3550 0    50   ~ 0
COND2
Text Label 7000 3650 0    50   ~ 0
COND3
Text Label 7000 3750 0    50   ~ 0
COND4
Wire Wire Line
	7350 3350 7000 3350
Wire Wire Line
	7350 3450 7000 3450
Wire Wire Line
	7350 3550 7000 3550
Wire Wire Line
	7350 3650 7000 3650
Wire Wire Line
	7350 3750 7000 3750
Wire Wire Line
	7350 3850 7000 3850
Text Label 7000 3850 0    50   ~ 0
~END
Text Label 6650 5100 2    50   ~ 0
~MEM
Text Label 6650 5200 2    50   ~ 0
~IO
Text Label 6650 5300 2    50   ~ 0
~R
Text Label 6650 5400 2    50   ~ 0
~WEN
Text Label 6650 5500 2    50   ~ 0
~END
Text Label 6650 3200 2    50   ~ 0
RADDR0
Text Label 6650 3300 2    50   ~ 0
RADDR1
Text Label 6650 3400 2    50   ~ 0
RADDR2
Text Label 6650 3500 2    50   ~ 0
RADDR3
Text Label 6650 3600 2    50   ~ 0
RADDR4
Text Label 6650 3700 2    50   ~ 0
WADDR0
Text Label 6650 3800 2    50   ~ 0
WADDR1
Text Label 6650 3900 2    50   ~ 0
WADDR2
Text Label 6650 4000 2    50   ~ 0
WADDR3
Text Label 6650 4100 2    50   ~ 0
WADDR4
Text Label 6650 4200 2    50   ~ 0
COND0
Text Label 6650 4300 2    50   ~ 0
COND1
Text Label 6650 4400 2    50   ~ 0
COND2
Text Label 6650 4500 2    50   ~ 0
COND3
Text Label 6650 4600 2    50   ~ 0
COND4
Text Label 6650 4700 2    50   ~ 0
ACTION0
Text Label 6650 4800 2    50   ~ 0
ACTION1
Text Label 6650 4900 2    50   ~ 0
ACTION2
Text Label 6650 5000 2    50   ~ 0
ACTION3
Wire Wire Line
	6200 5400 6650 5400
Wire Wire Line
	6200 5500 6650 5500
Wire Wire Line
	6200 5300 6650 5300
Wire Wire Line
	6200 5200 6650 5200
Wire Wire Line
	6200 5100 6650 5100
Text Label 6650 5700 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	5050 5700 4700 5700
Wire Wire Line
	5050 5600 4700 5600
Wire Wire Line
	5050 5500 4700 5500
Wire Wire Line
	5050 5400 4700 5400
Text Label 4650 3200 0    50   ~ 0
UPC0
Text Label 4650 3300 0    50   ~ 0
UPC1
Text Label 4650 3400 0    50   ~ 0
UPC2
Text Label 4650 3500 0    50   ~ 0
UPC3
Text Label 4650 3600 0    50   ~ 0
IDX0
Text Label 4650 3700 0    50   ~ 0
IDX1
Text Label 4650 3900 0    50   ~ 0
IN-RSVD
Text Label 4650 3800 0    50   ~ 0
~COND
Wire Wire Line
	4650 3900 5050 3900
Wire Wire Line
	4650 3800 5050 3800
Wire Wire Line
	4650 3700 5050 3700
Wire Wire Line
	4650 3600 5050 3600
Wire Wire Line
	4650 3500 5050 3500
Wire Wire Line
	4650 3400 5050 3400
Wire Wire Line
	4650 3300 5050 3300
Wire Wire Line
	4650 3200 5050 3200
Text Notes 6400 2850 2    100  ~ 20
Front Panel Buffers
Text Label 4750 5500 0    50   ~ 0
~FPµC0
Text Label 4750 5600 0    50   ~ 0
~FPµC1
Text Label 4750 5700 0    50   ~ 0
~FPµC2
Wire Bus Line
	6200 5700 6650 5700
Wire Wire Line
	6200 5000 6650 5000
Wire Wire Line
	6200 4900 6650 4900
Wire Wire Line
	6200 4800 6650 4800
Wire Wire Line
	6200 4700 6650 4700
Wire Wire Line
	6200 4600 6650 4600
Wire Wire Line
	6200 4500 6650 4500
Wire Wire Line
	6200 4400 6650 4400
Wire Wire Line
	6200 4300 6650 4300
Wire Wire Line
	6200 4200 6650 4200
Wire Wire Line
	6200 4100 6650 4100
Wire Wire Line
	6200 4000 6650 4000
Wire Wire Line
	6200 3900 6650 3900
Wire Wire Line
	6200 3800 6650 3800
Wire Wire Line
	6200 3700 6650 3700
Wire Wire Line
	6200 3600 6650 3600
Wire Wire Line
	6200 3500 6650 3500
Wire Wire Line
	6200 3400 6650 3400
Wire Wire Line
	6200 3300 6650 3300
Wire Wire Line
	6200 3200 6650 3200
Text Label 4250 5100 2    50   ~ 0
~MEM
Text Label 4250 5200 2    50   ~ 0
~IO
Text Label 4250 5300 2    50   ~ 0
~R
Text Label 4250 5400 2    50   ~ 0
~WEN
Text Label 4250 5500 2    50   ~ 0
~END
Text Notes 3750 2850 2    100  ~ 20
Control Store
Text Label 4250 3200 2    50   ~ 0
RADDR0
Text Label 4250 3300 2    50   ~ 0
RADDR1
Text Label 4250 3400 2    50   ~ 0
RADDR2
Text Label 4250 3500 2    50   ~ 0
RADDR3
Text Label 4250 3600 2    50   ~ 0
RADDR4
Text Label 4250 3700 2    50   ~ 0
WADDR0
Text Label 4250 3800 2    50   ~ 0
WADDR1
Text Label 4250 3900 2    50   ~ 0
WADDR2
Text Label 4250 4000 2    50   ~ 0
WADDR3
Text Label 4250 4100 2    50   ~ 0
WADDR4
Text Label 4250 4200 2    50   ~ 0
COND0
Text Label 4250 4300 2    50   ~ 0
COND1
Text Label 4250 4400 2    50   ~ 0
COND2
Text Label 4250 4500 2    50   ~ 0
COND3
Text Label 4250 4600 2    50   ~ 0
COND4
Text Label 4250 4700 2    50   ~ 0
ACTION0
Text Label 4250 4800 2    50   ~ 0
ACTION1
Text Label 4250 4900 2    50   ~ 0
ACTION2
Text Label 4250 5000 2    50   ~ 0
ACTION3
$Sheet
S 2650 3050 1150 2600
U 5E34FD9B
F0 "Microcode Store" 50
F1 "cpu_microcode_store.sch" 50
F2 "UPC0" I L 2650 3200 50 
F3 "UPC1" I L 2650 3300 50 
F4 "UPC2" I L 2650 3400 50 
F5 "UPC3" I L 2650 3500 50 
F6 "IDX0" I L 2650 3600 50 
F7 "IDX1" I L 2650 3700 50 
F8 "~COND" I L 2650 3800 50 
F9 "IN-RSVD" I L 2650 3900 50 
F10 "IR7" I L 2650 4000 50 
F11 "IR8" I L 2650 4100 50 
F12 "IR9" I L 2650 4200 50 
F13 "IR10" I L 2650 4300 50 
F14 "IR11" I L 2650 4400 50 
F15 "IR12" I L 2650 4500 50 
F16 "IR13" I L 2650 4600 50 
F17 "IR14" I L 2650 4700 50 
F18 "IR15" I L 2650 4800 50 
F19 "~IRQSµC" I L 2650 4900 50 
F20 "~RSTHOLD" I L 2650 5000 50 
F21 "RADDR0" O R 3800 3200 50 
F22 "RADDR1" O R 3800 3300 50 
F23 "RADDR2" O R 3800 3400 50 
F24 "RADDR3" O R 3800 3500 50 
F25 "RADDR4" O R 3800 3600 50 
F26 "WADDR0" O R 3800 3700 50 
F27 "WADDR1" O R 3800 3800 50 
F28 "WADDR2" O R 3800 3900 50 
F29 "WADDR3" O R 3800 4000 50 
F30 "WADDR4" O R 3800 4100 50 
F31 "COND0" O R 3800 4200 50 
F32 "COND1" O R 3800 4300 50 
F33 "COND2" O R 3800 4400 50 
F34 "COND3" O R 3800 4500 50 
F35 "COND4" O R 3800 4600 50 
F36 "ACTION0" O R 3800 4700 50 
F37 "ACTION1" O R 3800 4800 50 
F38 "ACTION2" O R 3800 4900 50 
F39 "ACTION3" O R 3800 5000 50 
F40 "~MEM" O R 3800 5100 50 
F41 "~IO" O R 3800 5200 50 
F42 "~R" O R 3800 5300 50 
F43 "~WEN" O R 3800 5400 50 
F44 "~END" O R 3800 5500 50 
F45 "CLK" I L 2650 5250 50 
F46 "~OE" I L 2650 5500 50 
$EndSheet
Wire Wire Line
	3800 5400 4250 5400
Wire Wire Line
	3800 5500 4250 5500
Wire Wire Line
	3800 5300 4250 5300
Wire Wire Line
	3800 5200 4250 5200
Text Label 2250 3200 0    50   ~ 0
UPC0
Text Label 2250 3300 0    50   ~ 0
UPC1
Text Label 2250 3400 0    50   ~ 0
UPC2
Text Label 2250 3500 0    50   ~ 0
UPC3
Text Label 2250 4900 0    50   ~ 0
~IRQSµC
Text Label 2250 5000 0    50   ~ 0
~RSTHOLD
Text Label 2250 3600 0    50   ~ 0
IDX0
Text Label 2250 3700 0    50   ~ 0
IDX1
Text Label 2250 4100 0    50   ~ 0
IR8
Text Label 2250 4200 0    50   ~ 0
IR9
Text Label 2250 4300 0    50   ~ 0
IR10
Text Label 2250 4400 0    50   ~ 0
IR11
Text Label 2250 4500 0    50   ~ 0
IR12
Text Label 2250 4600 0    50   ~ 0
IR13
Text Label 2250 4700 0    50   ~ 0
IR14
Text Label 2250 4800 0    50   ~ 0
IR15
Text Label 2250 3900 0    50   ~ 0
IN-RSVD
Text Label 2250 3800 0    50   ~ 0
~COND
Text Label 2250 4000 0    50   ~ 0
IR7
Wire Wire Line
	2250 3500 2650 3500
Wire Wire Line
	2250 3400 2650 3400
Wire Wire Line
	2250 3300 2650 3300
Wire Wire Line
	2250 3200 2650 3200
Wire Wire Line
	3800 3200 4250 3200
Wire Wire Line
	3800 3300 4250 3300
Wire Wire Line
	3800 3400 4250 3400
Wire Wire Line
	3800 3500 4250 3500
Wire Wire Line
	3800 3600 4250 3600
Text Label 2250 5500 0    50   ~ 0
~CSE
Wire Wire Line
	3800 3700 4250 3700
Wire Wire Line
	3800 3800 4250 3800
Wire Wire Line
	3800 3900 4250 3900
Wire Wire Line
	3800 4000 4250 4000
Wire Wire Line
	3800 4100 4250 4100
Wire Wire Line
	3800 4200 4250 4200
Wire Wire Line
	3800 4300 4250 4300
Wire Wire Line
	3800 4400 4250 4400
Wire Wire Line
	3800 4500 4250 4500
Wire Wire Line
	3800 4600 4250 4600
Wire Wire Line
	3800 4700 4250 4700
Wire Wire Line
	3800 4800 4250 4800
Wire Wire Line
	3800 4900 4250 4900
Wire Wire Line
	3800 5000 4250 5000
Wire Wire Line
	3800 5100 4250 5100
Text Notes 8200 2850 2    100  ~ 20
Bus Hold
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
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5900 7400 50  0001 C CNN
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
Wire Wire Line
	1150 1850 1250 1850
$Comp
L Device:R_Small R?
U 1 1 5DB1C764
P 1650 3400
AR Path="/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DB1C764" Ref="R26"  Part="1" 
AR Path="/5F67D4B5/5DB1C764" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DB1C764" Ref="R?"  Part="1" 
F 0 "R26" H 1709 3354 50  0000 L CNN
F 1 "4.7kΩ" H 1709 3445 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 3400 50  0001 C CNN
F 3 "~" H 1650 3400 50  0001 C CNN
	1    1650 3400
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DD09005
P 1200 1200
AR Path="/5DD09005" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DD09005" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DD09005" Ref="R24"  Part="1" 
AR Path="/5F67D4B5/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DD09005" Ref="R?"  Part="1" 
F 0 "R24" H 1259 1246 50  0000 L CNN
F 1 "4.7kΩ" H 1259 1155 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 1200 50  0001 C CNN
F 3 "~" H 1200 1200 50  0001 C CNN
	1    1200 1200
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DD0C349
P 1350 1200
AR Path="/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DD0C349" Ref="R25"  Part="1" 
AR Path="/5F67D4B5/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DD0C349" Ref="R?"  Part="1" 
F 0 "R25" H 1291 1154 50  0000 R CNN
F 1 "4.7kΩ" H 1291 1245 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1350 1200 50  0001 C CNN
F 3 "~" H 1350 1200 50  0001 C CNN
	1    1350 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1200 1300 1200 1500
Connection ~ 1200 1500
Wire Wire Line
	1200 1500 1850 1500
Wire Wire Line
	1350 1300 1350 1850
Connection ~ 1350 1850
Text Notes 1350 2300 0    50   ~ 0
~WS~ is pulled up by the Wait State Handler circuitry.
$Comp
L power:+5V #PWR0101
U 1 1 5DD4145D
P 1200 1100
F 0 "#PWR0101" H 1200 950 50  0001 C CNN
F 1 "+5V" H 1050 1200 50  0000 C CNN
F 2 "" H 1200 1100 50  0001 C CNN
F 3 "" H 1200 1100 50  0001 C CNN
	1    1200 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5DD4162D
P 1350 1100
F 0 "#PWR0102" H 1350 950 50  0001 C CNN
F 1 "+5V" H 1450 1200 50  0000 C CNN
F 2 "" H 1350 1100 50  0001 C CNN
F 3 "" H 1350 1100 50  0001 C CNN
	1    1350 1100
	1    0    0    -1  
$EndComp
Text HLabel 1150 5450 0    50   Input ~ 0
~RESET
Wire Wire Line
	1150 5450 1550 5450
Text Label 1500 5550 2    50   ~ 0
~HALT
Text Notes 3000 6350 0    50   ~ 0
The Microcode Store is enabled\nwhen ~RESET~ and ~HALT~\nare both deasserted.
Text HLabel 4700 5700 0    50   Input ~ 0
~FPµC2
Text HLabel 4700 5600 0    50   Input ~ 0
~FPµC1
Text HLabel 4700 5500 0    50   Input ~ 0
~FPµC0
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
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 6600 50  0001 C CNN
F 3 "~" H 900 6600 50  0001 C CNN
	1    900  6600
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
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 7400 50  0001 C CNN
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
Text Notes 7000 4550 0    50   ~ 0
Note: The DFP adds bus hold\nto all other control outputs.
Connection ~ 7650 4900
Connection ~ 7650 5300
Connection ~ 7650 5200
Connection ~ 7650 5000
$Comp
L alexios:SN74ACT1071 U?
U 2 1 5DA7AA39
P 8000 5400
AR Path="/5DEAC282/5DEAA264/5DA7AA39" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DA7AA39" Ref="U47"  Part="2" 
AR Path="/5DA7AA39" Ref="U?"  Part="1" 
F 0 "U47" H 7900 5350 50  0000 L CNN
F 1 "SN74ACT1071" H 7900 5250 50  0000 L CNN
F 2 "alexios:SOIC-14" H 7700 5750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 7700 5750 50  0001 C CNN
	2    8000 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 5200 7650 5300
Wire Wire Line
	7650 5000 7650 4900
$Comp
L power:GND #PWR0110
U 1 1 5E28DA00
P 7650 5300
AR Path="/5DEAC282/5E28DA00" Ref="#PWR0110"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E28DA00" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 7650 5050 50  0001 C CNN
F 1 "GND" H 7655 5127 50  0000 C CNN
F 2 "" H 7650 5300 50  0001 C CNN
F 3 "" H 7650 5300 50  0001 C CNN
	1    7650 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E28D9FA
P 7650 5100
AR Path="/5CC0D65F/5E28D9FA" Ref="C?"  Part="1" 
AR Path="/5E28D9FA" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E28D9FA" Ref="C33"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E28D9FA" Ref="C?"  Part="1" 
F 0 "C33" H 7558 5146 50  0000 R CNN
F 1 "100nF" H 7558 5055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7650 5100 50  0001 C CNN
F 3 "~" H 7650 5100 50  0001 C CNN
	1    7650 5100
	1    0    0    -1  
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
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4200 7400 50  0001 C CNN
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
$Comp
L alexios:74LVC1G00 U46
U 1 1 5DD994A9
P 1850 5500
F 0 "U46" H 1600 5300 50  0000 C CNN
F 1 "74LVC1G00" H 1600 5200 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1500 5500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G00.pdf" H 1500 5500 50  0001 C CNN
	1    1850 5500
	1    0    0    -1  
$EndComp
Text Notes 1950 6300 0    50   ~ 0
~RESET~\n\n  0\n  X\n  1
Text Notes 2250 6300 0    50   ~ 0
~HALT~\n\n  X\n  0\n  1
Text Notes 2600 6300 0    50   ~ 0
~CSE~\n\n  1\n  1\n  0
Wire Notes Line width 12 style solid
	1900 5850 2850 5850
Wire Notes Line width 12 style solid
	2850 5850 2850 6350
Wire Notes Line width 12 style solid
	1900 5850 1900 6350
Wire Notes Line style solid
	1900 6010 2850 6010
Wire Notes Line
	2490 5850 2490 6350
Wire Notes Line width 12 style solid
	1900 6350 2850 6350
Text Label 4750 5400 0    50   ~ 0
~FPµA0
$Sheet
S 5050 3050 1150 2750
U 5D82AC00
F0 "Sheet5D82ABFF" 50
F1 "cpu_microcode_fp.sch" 50
F2 "RADDR0" I R 6200 3200 50 
F3 "RADDR1" I R 6200 3300 50 
F4 "RADDR2" I R 6200 3400 50 
F5 "RADDR3" I R 6200 3500 50 
F6 "RADDR4" I R 6200 3600 50 
F7 "WADDR0" I R 6200 3700 50 
F8 "WADDR1" I R 6200 3800 50 
F9 "WADDR2" I R 6200 3900 50 
F10 "WADDR3" I R 6200 4000 50 
F11 "WADDR4" I R 6200 4100 50 
F12 "COND0" I R 6200 4200 50 
F13 "COND1" I R 6200 4300 50 
F14 "COND2" I R 6200 4400 50 
F15 "COND3" I R 6200 4500 50 
F16 "COND4" I R 6200 4600 50 
F17 "ACTION0" I R 6200 4700 50 
F18 "ACTION1" I R 6200 4800 50 
F19 "ACTION2" I R 6200 4900 50 
F20 "ACTION3" I R 6200 5000 50 
F21 "~MEM" I R 6200 5100 50 
F22 "~IO" I R 6200 5200 50 
F23 "~R" I R 6200 5300 50 
F24 "~WEN" I R 6200 5400 50 
F25 "~END" I R 6200 5500 50 
F26 "FPD[0..7]" I R 6200 5700 50 
F27 "~FPµA0" I L 5050 5400 50 
F28 "~FPµC0" I L 5050 5500 50 
F29 "~FPµC1" I L 5050 5600 50 
F30 "~FPµC2" I L 5050 5700 50 
F31 "UPC0" I L 5050 3200 50 
F32 "UPC1" I L 5050 3300 50 
F33 "UPC2" I L 5050 3400 50 
F34 "UPC3" I L 5050 3500 50 
F35 "IDX0" I L 5050 3600 50 
F36 "IDX1" I L 5050 3700 50 
F37 "~COND" I L 5050 3800 50 
F38 "IN-RSVD" I L 5050 3900 50 
$EndSheet
Text Label 2250 5250 0    50   ~ 0
CLK2
Text HLabel 1150 3600 0    50   Input ~ 0
IDX0
Text HLabel 1150 3700 0    50   Input ~ 0
IDX1
Text HLabel 1150 4000 0    50   Input ~ 0
IR7
Text HLabel 1150 4100 0    50   Input ~ 0
IR8
Text HLabel 1150 4200 0    50   Input ~ 0
IR9
Text HLabel 1150 4300 0    50   Input ~ 0
IR10
Text HLabel 1150 4400 0    50   Input ~ 0
IR11
Text HLabel 1150 4500 0    50   Input ~ 0
IR12
Text HLabel 1150 4600 0    50   Input ~ 0
IR13
Text HLabel 1150 4700 0    50   Input ~ 0
IR14
Text HLabel 1150 4800 0    50   Input ~ 0
IR15
Wire Wire Line
	1150 3600 2650 3600
Wire Wire Line
	1150 3700 2650 3700
Wire Wire Line
	1150 3800 2650 3800
Wire Wire Line
	1150 4000 2650 4000
Wire Wire Line
	1150 4100 2650 4100
Wire Wire Line
	1150 4200 2650 4200
Wire Wire Line
	1150 4300 2650 4300
Wire Wire Line
	1150 4400 2650 4400
Wire Wire Line
	1150 4500 2650 4500
Wire Wire Line
	1150 4600 2650 4600
Wire Wire Line
	1150 4700 2650 4700
Wire Wire Line
	1150 4800 2650 4800
Wire Wire Line
	1150 4900 2650 4900
Text Label 1500 5450 2    50   ~ 0
~RESET
Wire Wire Line
	3750 1650 2700 1650
Entry Wire Line
	5000 1150 5100 1250
Entry Wire Line
	5000 1250 5100 1350
Entry Wire Line
	5000 1350 5100 1450
Entry Wire Line
	5000 1450 5100 1550
Text Label 5100 1950 1    50   ~ 0
UPC[0..3]
Entry Wire Line
	2150 3100 2250 3200
Entry Wire Line
	2150 3200 2250 3300
Entry Wire Line
	2150 3300 2250 3400
Entry Wire Line
	2150 3400 2250 3500
Entry Bus Bus
	5000 2550 5100 2450
Entry Bus Bus
	2250 2550 2150 2650
Text Label 2150 3000 1    50   ~ 0
UPC[0..3]
Wire Wire Line
	6400 1850 6850 1850
Connection ~ 6400 1850
Wire Wire Line
	6400 1900 6400 1850
Wire Wire Line
	6200 1750 6850 1750
Connection ~ 6200 1750
Wire Wire Line
	6200 1900 6200 1750
Wire Wire Line
	6400 2100 6400 2200
$Comp
L power:GND #PWR041
U 1 1 6047D252
P 6400 2200
F 0 "#PWR041" H 6400 1950 50  0001 C CNN
F 1 "GND" H 6400 2050 50  0000 C CNN
F 2 "" H 6400 2200 50  0001 C CNN
F 3 "" H 6400 2200 50  0001 C CNN
	1    6400 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 6047D24C
P 6400 2000
F 0 "R4" H 6350 2150 50  0000 R CNN
F 1 "4.7kΩ" H 6341 2045 50  0001 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6400 2000 50  0001 C CNN
F 3 "~" H 6400 2000 50  0001 C CNN
	1    6400 2000
	1    0    0    1   
$EndComp
Wire Wire Line
	6200 2100 6200 2200
$Comp
L power:GND #PWR07
U 1 1 6046CC8E
P 6200 2200
F 0 "#PWR07" H 6200 1950 50  0001 C CNN
F 1 "GND" H 6200 2050 50  0000 C CNN
F 2 "" H 6200 2200 50  0001 C CNN
F 3 "" H 6200 2200 50  0001 C CNN
	1    6200 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 6046CC88
P 6200 2000
F 0 "R3" H 6150 2150 50  0000 R CNN
F 1 "4.7kΩ" H 6141 2045 50  0001 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6200 2000 50  0001 C CNN
F 3 "~" H 6200 2000 50  0001 C CNN
	1    6200 2000
	1    0    0    1   
$EndComp
Wire Wire Line
	6000 2100 6000 2200
$Comp
L power:GND #PWR04
U 1 1 6044A2AC
P 6000 2200
F 0 "#PWR04" H 6000 1950 50  0001 C CNN
F 1 "GND" H 6000 2050 50  0000 C CNN
F 2 "" H 6000 2200 50  0001 C CNN
F 3 "" H 6000 2200 50  0001 C CNN
	1    6000 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1650 6850 1650
Connection ~ 6000 1650
Wire Wire Line
	6000 1900 6000 1650
$Comp
L Device:R_Small R1
U 1 1 603FB559
P 6000 2000
F 0 "R1" H 5950 2150 50  0000 R CNN
F 1 "4.7kΩ" H 5941 2045 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 2000 50  0001 C CNN
F 3 "~" H 6000 2000 50  0001 C CNN
	1    6000 2000
	1    0    0    1   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP6
U 1 1 602E0B7C
P 6400 950
F 0 "JP6" V 6400 1050 50  0000 L CNN
F 1 "SolderJumper_2_Bridged" H 6400 1064 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_Pad1.0x1.5mm" H 6400 950 50  0001 C CNN
F 3 "~" H 6400 950 50  0001 C CNN
	1    6400 950 
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP5
U 1 1 602E0974
P 6200 950
F 0 "JP5" V 5900 900 50  0000 L CNN
F 1 "SolderJumper_2_Bridged" H 6200 1064 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_Pad1.0x1.5mm" H 6200 950 50  0001 C CNN
F 3 "~" H 6200 950 50  0001 C CNN
	1    6200 950 
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 602660E1
P 6000 750
F 0 "#PWR01" H 6000 600 50  0001 C CNN
F 1 "+5V" H 5850 800 50  0000 C CNN
F 2 "" H 6000 750 50  0001 C CNN
F 3 "" H 6000 750 50  0001 C CNN
	1    6000 750 
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 6025524A
P 6000 950
F 0 "JP4" V 6000 850 50  0000 R CNN
F 1 "SolderJumper_2_Bridged" H 6000 1064 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_Pad1.0x1.5mm" H 6000 950 50  0001 C CNN
F 3 "~" H 6000 950 50  0001 C CNN
	1    6000 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 2150 8300 2150
Text Notes 7750 1150 0    50   ~ 10
Set to 010 for Microcode v.7.
Text Notes 7750 2000 0    50   ~ 0
High = Fetch.\nLow = Execute.\nThis is for the benefit of the front panel only.
NoConn ~ 7850 2350
NoConn ~ 7850 2250
Wire Wire Line
	6750 1950 6750 2150
Wire Wire Line
	6850 1950 6750 1950
Text HLabel 8300 2150 2    50   Output ~ 0
FPFETCH
Text Label 8250 2150 2    50   ~ 0
FPFETCH
Wire Wire Line
	6700 2250 6850 2250
$Comp
L power:+5V #PWR0105
U 1 1 5FEA12FB
P 6700 2250
F 0 "#PWR0105" H 6700 2100 50  0001 C CNN
F 1 "+5V" V 6800 2250 50  0000 L CNN
F 2 "" H 6700 2250 50  0001 C CNN
F 3 "" H 6700 2250 50  0001 C CNN
	1    6700 2250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5FE9AF52
P 6750 2400
F 0 "#PWR0107" H 6750 2150 50  0001 C CNN
F 1 "GND" H 6755 2227 50  0000 C CNN
F 2 "" H 6750 2400 50  0001 C CNN
F 3 "" H 6750 2400 50  0001 C CNN
	1    6750 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2350 6750 2400
Connection ~ 6750 2350
Wire Wire Line
	6850 2350 6750 2350
Wire Wire Line
	6750 2150 6750 2350
Connection ~ 6750 2150
Wire Wire Line
	6850 2150 6750 2150
$Comp
L alexios:74HC85 U45
U 1 1 5FE49D00
P 7350 1550
F 0 "U45" H 7350 575 50  0000 C CNN
F 1 "74HC85" H 7350 484 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7350 1575 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 7350 1575 50  0001 C CNN
	1    7350 1550
	1    0    0    -1  
$EndComp
Text Label 5200 1150 0    50   ~ 0
UPC0
Text Label 5200 1250 0    50   ~ 0
UPC1
Text Label 5200 1350 0    50   ~ 0
UPC2
Text Label 5200 1450 0    50   ~ 0
UPC3
Entry Wire Line
	5200 1150 5100 1250
Entry Wire Line
	5200 1250 5100 1350
Entry Wire Line
	5200 1350 5100 1450
Entry Wire Line
	5200 1450 5100 1550
Wire Wire Line
	5200 1150 6850 1150
Wire Wire Line
	5200 1450 6850 1450
Wire Wire Line
	5200 1350 6850 1350
Wire Wire Line
	5200 1250 6850 1250
Text Label 6800 1150 2    50   ~ 0
UPC0
Text Label 6800 1250 2    50   ~ 0
UPC1
Text Label 6800 1350 2    50   ~ 0
UPC2
Text Label 6800 1450 2    50   ~ 0
UPC3
Wire Wire Line
	6000 1100 6000 1650
Wire Wire Line
	6200 1100 6200 1750
Wire Wire Line
	6400 1100 6400 1850
Wire Wire Line
	6000 750  6200 750 
Wire Wire Line
	6400 750  6400 800 
Wire Wire Line
	6200 800  6200 750 
Connection ~ 6200 750 
Wire Wire Line
	6200 750  6400 750 
Wire Wire Line
	6000 800  6000 750 
Connection ~ 6000 750 
Text Notes 6100 1950 0    98   ~ 20
*
Text Notes 7750 1350 0    98   ~ 20
*
Text Notes 7900 1350 0    50   ~ 0
Do not install this resistor by default.\nPopulate resistors for open jumpers only.
Text Notes 6750 900  0    100  ~ 20
Fetch/Execute State Decoder
Text Notes 1400 3000 0    50   ~ 0
Remove\npull-up if\nIN-RSVD used.
Wire Wire Line
	1150 5000 2650 5000
Text HLabel 1150 3900 0    50   Input ~ 0
IN-RSVD
$Comp
L power:+5V #PWR055
U 1 1 6070CD65
P 1650 3250
F 0 "#PWR055" H 1650 3100 50  0001 C CNN
F 1 "+5V" H 1665 3423 50  0000 C CNN
F 2 "" H 1650 3250 50  0001 C CNN
F 3 "" H 1650 3250 50  0001 C CNN
	1    1650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 3250 1650 3300
Wire Wire Line
	1650 3500 1650 3900
Wire Wire Line
	1150 3900 1650 3900
Connection ~ 1650 3900
Wire Wire Line
	1650 3900 2650 3900
Text HLabel 1150 5250 0    50   Input ~ 0
CLK2
Text HLabel 4700 5400 0    50   Input ~ 0
~FPµA0
Entry Wire Line
	4550 3100 4650 3200
Entry Wire Line
	4550 3200 4650 3300
Entry Wire Line
	4550 3300 4650 3400
Entry Wire Line
	4550 3400 4650 3500
Entry Bus Bus
	4550 2650 4650 2550
Entry Bus Bus
	4550 2650 4450 2550
Wire Bus Line
	5000 2550 4650 2550
Wire Bus Line
	4450 2550 2250 2550
Wire Wire Line
	2000 5500 2650 5500
Wire Wire Line
	1150 5250 2650 5250
Connection ~ 900  6500
Connection ~ 900  6700
$Comp
L alexios:74AHC1G08 U?
U 2 1 5DEB32A6
P 1350 6500
AR Path="/5DEB32A6" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DEB32A6" Ref="U43"  Part="2" 
F 0 "U43" H 1430 6446 50  0000 L CNN
F 1 "74LVC1G08" H 1430 6355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1000 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1000 6500 50  0001 C CNN
	2    1350 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U?
U 1 1 5E1680B3
P 7850 3850
AR Path="/5DEAC282/5DEAA264/5E1680B3" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E1680B3" Ref="U47"  Part="1" 
AR Path="/5E1680B3" Ref="U?"  Part="1" 
F 0 "U47" H 7800 4650 50  0000 L CNN
F 1 "SN74ACT1071" H 7600 4550 50  0000 L CNN
F 2 "alexios:SOIC-14" H 7550 4200 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 7550 4200 50  0001 C CNN
	1    7850 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 61FE2DF7
P 7200 3950
F 0 "#PWR0114" H 7200 3800 50  0001 C CNN
F 1 "+5V" V 7215 4078 50  0000 L CNN
F 2 "" H 7200 3950 50  0001 C CNN
F 3 "" H 7200 3950 50  0001 C CNN
	1    7200 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 3950 7300 3950
Wire Wire Line
	7300 3950 7300 4050
Wire Wire Line
	7300 4250 7350 4250
Connection ~ 7300 3950
Wire Wire Line
	7300 3950 7350 3950
Wire Wire Line
	7350 4050 7300 4050
Connection ~ 7300 4050
Wire Wire Line
	7300 4050 7300 4150
Wire Wire Line
	7350 4150 7300 4150
Connection ~ 7300 4150
Wire Wire Line
	7300 4150 7300 4250
Wire Wire Line
	1550 5550 1250 5550
Wire Wire Line
	1350 1850 3750 1850
Wire Wire Line
	1250 5550 1250 1850
Connection ~ 1250 1850
Wire Wire Line
	1250 1850 1350 1850
Wire Bus Line
	4550 2650 4550 3400
Wire Bus Line
	2150 2650 2150 3400
Wire Bus Line
	5100 1250 5100 2450
Wire Bus Line
	9800 4700 9800 5050
Wire Bus Line
	9800 4000 9800 4450
Wire Bus Line
	9800 3300 9800 3750
Wire Bus Line
	9800 2600 9800 3050
$EndSCHEMATC
