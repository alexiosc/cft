EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 12
Title "Microcode Sequencer"
Date ""
Rev "2023"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "sequencer.v"
$EndDescr
Text HLabel 1150 2000 0    50   Input ~ 0
~ENDEXT
Text HLabel 1150 1800 0    50   Input ~ 0
~HALT
Text HLabel 1150 1700 0    50   Input ~ 0
CLK4
Text Label 5000 1600 2    50   ~ 0
UPC0
Text Label 5000 1700 2    50   ~ 0
UPC1
Text Label 5000 1800 2    50   ~ 0
UPC2
Text Label 5000 1900 2    50   ~ 0
UPC3
Text Label 10450 4000 2    50   ~ 0
COND[0..4]
Text Label 10450 3300 2    50   ~ 0
WADDR[0..4]
Text HLabel 10500 2600 2    50   Output ~ 0
RADDR[0..4]
Text HLabel 10500 3300 2    50   Output ~ 0
WADDR[0..4]
Text HLabel 10500 4000 2    50   Output ~ 0
COND[0..4]
Text Label 10450 4700 2    50   ~ 0
ACTION[0..3]
Text HLabel 10500 4700 2    50   Output ~ 0
ACTION[0..3]
Text Notes 6950 6700 0    50   ~ 0
2019 Design Update: both micro-Address Vector and micro-Control Vector have changed significantly\nin this version. Fields are much more vertical now, but the processor is also much more capable.
Text Notes 6950 6400 0    63   ~ 13
2019 Design Update
Text HLabel 10500 5550 2    50   Output ~ 0
~MEM
Text HLabel 10500 5650 2    50   Output ~ 0
~IO
Text HLabel 10500 5750 2    50   Output ~ 0
~R
Text HLabel 10500 5850 2    50   Output ~ 0
~WEN
Text HLabel 10500 5950 2    50   Output ~ 0
~END
Text Notes 9200 5350 1    100  ~ 20
Microcode Control Vector
Wire Wire Line
	9300 3250 9700 3250
Wire Wire Line
	9300 3150 9700 3150
Wire Wire Line
	9300 3050 9700 3050
Wire Wire Line
	9300 2950 9700 2950
Wire Wire Line
	9300 2850 9700 2850
Wire Wire Line
	9300 3550 9700 3550
Wire Wire Line
	9300 3650 9700 3650
Wire Wire Line
	9300 3750 9700 3750
Wire Wire Line
	9300 3850 9700 3850
Wire Wire Line
	9300 3950 9700 3950
Wire Wire Line
	9300 4250 9700 4250
Wire Wire Line
	9300 4350 9700 4350
Wire Wire Line
	9300 4450 9700 4450
Wire Wire Line
	9300 4550 9700 4550
Wire Wire Line
	9300 4650 9700 4650
Wire Wire Line
	9300 4950 9700 4950
Wire Wire Line
	9300 5050 9700 5050
Wire Wire Line
	9300 5150 9700 5150
Wire Wire Line
	9300 5250 9700 5250
Wire Wire Line
	9300 5550 10500 5550
Wire Wire Line
	9300 5650 10500 5650
Wire Wire Line
	9300 5750 10500 5750
Wire Wire Line
	9300 5950 10500 5950
Wire Wire Line
	9300 5850 10500 5850
Text Label 9300 5250 0    50   ~ 0
ACTION3
Text Label 9300 5150 0    50   ~ 0
ACTION2
Text Label 9300 5050 0    50   ~ 0
ACTION1
Text Label 9300 4950 0    50   ~ 0
ACTION0
Text Label 9300 4650 0    50   ~ 0
COND4
Text Label 9300 4550 0    50   ~ 0
COND3
Text Label 9300 4450 0    50   ~ 0
COND2
Text Label 9300 4350 0    50   ~ 0
COND1
Text Label 9300 4250 0    50   ~ 0
COND0
Text Label 9300 3950 0    50   ~ 0
WADDR4
Text Label 9300 3850 0    50   ~ 0
WADDR3
Text Label 9300 3750 0    50   ~ 0
WADDR2
Text Label 9300 3650 0    50   ~ 0
WADDR1
Text Label 9300 3550 0    50   ~ 0
WADDR0
Text Label 9300 3250 0    50   ~ 0
RADDR4
Text Label 9300 3150 0    50   ~ 0
RADDR3
Text Label 9300 3050 0    50   ~ 0
RADDR2
Text Label 9300 2950 0    50   ~ 0
RADDR1
Text Label 9300 2850 0    50   ~ 0
RADDR0
Text Label 9300 5950 0    50   ~ 0
~END
Text Label 9300 5850 0    50   ~ 0
~WEN
Text Label 9300 5750 0    50   ~ 0
~R
Text Label 9300 5650 0    50   ~ 0
~IO
Text Label 9300 5550 0    50   ~ 0
~MEM
Entry Wire Line
	9800 2750 9700 2850
Entry Wire Line
	9800 2850 9700 2950
Entry Wire Line
	9800 2950 9700 3050
Entry Wire Line
	9800 3050 9700 3150
Entry Wire Line
	9800 3150 9700 3250
Entry Wire Line
	9800 3450 9700 3550
Entry Wire Line
	9800 3550 9700 3650
Entry Wire Line
	9800 3650 9700 3750
Entry Wire Line
	9800 3750 9700 3850
Entry Wire Line
	9800 3850 9700 3950
Entry Wire Line
	9800 4150 9700 4250
Entry Wire Line
	9800 4250 9700 4350
Entry Wire Line
	9800 4350 9700 4450
Entry Wire Line
	9800 4450 9700 4550
Entry Wire Line
	9800 4550 9700 4650
Entry Wire Line
	9800 4850 9700 4950
Entry Wire Line
	9800 4950 9700 5050
Entry Wire Line
	9800 5050 9700 5150
Entry Wire Line
	9800 5150 9700 5250
Entry Bus Bus
	9800 2700 9900 2600
Entry Bus Bus
	9800 3400 9900 3300
Entry Bus Bus
	9800 4100 9900 4000
Entry Bus Bus
	9800 4800 9900 4700
Wire Bus Line
	9900 3300 10500 3300
Wire Bus Line
	9900 4000 10500 4000
Wire Bus Line
	9900 4700 10500 4700
Text Label 10450 2600 2    50   ~ 0
RADDR[0..4]
Wire Bus Line
	9900 2600 10500 2600
Text HLabel 1150 5000 0    50   Input ~ 0
~IRQSµC
Text HLabel 1150 5100 0    50   Input ~ 0
~RSTHOLD
Text HLabel 1150 3900 0    50   Input ~ 0
~COND
Text HLabel 6650 5800 2    50   3State ~ 0
FPD[0..7]
$Comp
L power:+5V #PWR0108
U 1 1 5E28DA06
P 7650 5000
AR Path="/5DEAC282/5E28DA06" Ref="#PWR0108"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E28DA06" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 7650 4850 50  0001 C CNN
F 1 "+5V" H 7665 5173 50  0000 C CNN
F 2 "" H 7650 5000 50  0001 C CNN
F 3 "" H 7650 5000 50  0001 C CNN
	1    7650 5000
	1    0    0    -1  
$EndComp
Text Label 7000 3450 0    50   ~ 0
COND0
Text Label 7000 3550 0    50   ~ 0
COND1
Text Label 7000 3650 0    50   ~ 0
COND2
Text Label 7000 3750 0    50   ~ 0
COND3
Text Label 7000 3850 0    50   ~ 0
COND4
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
Wire Wire Line
	7350 3950 7000 3950
Text Label 7000 3950 0    50   ~ 0
~END
Text Label 6650 5200 2    50   ~ 0
~MEM
Text Label 6650 5300 2    50   ~ 0
~IO
Text Label 6650 5400 2    50   ~ 0
~R
Text Label 6650 5500 2    50   ~ 0
~WEN
Text Label 6650 5600 2    50   ~ 0
~END
Text Label 6650 3300 2    50   ~ 0
RADDR0
Text Label 6650 3400 2    50   ~ 0
RADDR1
Text Label 6650 3500 2    50   ~ 0
RADDR2
Text Label 6650 3600 2    50   ~ 0
RADDR3
Text Label 6650 3700 2    50   ~ 0
RADDR4
Text Label 6650 3800 2    50   ~ 0
WADDR0
Text Label 6650 3900 2    50   ~ 0
WADDR1
Text Label 6650 4000 2    50   ~ 0
WADDR2
Text Label 6650 4100 2    50   ~ 0
WADDR3
Text Label 6650 4200 2    50   ~ 0
WADDR4
Text Label 6650 4300 2    50   ~ 0
COND0
Text Label 6650 4400 2    50   ~ 0
COND1
Text Label 6650 4500 2    50   ~ 0
COND2
Text Label 6650 4600 2    50   ~ 0
COND3
Text Label 6650 4700 2    50   ~ 0
COND4
Text Label 6650 4800 2    50   ~ 0
ACTION0
Text Label 6650 4900 2    50   ~ 0
ACTION1
Text Label 6650 5000 2    50   ~ 0
ACTION2
Text Label 6650 5100 2    50   ~ 0
ACTION3
Wire Wire Line
	6200 5500 6650 5500
Wire Wire Line
	6200 5600 6650 5600
Wire Wire Line
	6200 5400 6650 5400
Wire Wire Line
	6200 5300 6650 5300
Wire Wire Line
	6200 5200 6650 5200
Text Label 6650 5800 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	5050 5800 4700 5800
Wire Wire Line
	5050 5700 4700 5700
Wire Wire Line
	5050 5600 4700 5600
Wire Wire Line
	5050 5500 4700 5500
Text Label 4650 3300 0    50   ~ 0
UPC0
Text Label 4650 3400 0    50   ~ 0
UPC1
Text Label 4650 3500 0    50   ~ 0
UPC2
Text Label 4650 3600 0    50   ~ 0
UPC3
Text Label 4650 3700 0    50   ~ 0
IDX0
Text Label 4650 3800 0    50   ~ 0
IDX1
Text Label 4650 3900 0    50   ~ 0
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
Text Notes 6400 2950 2    100  ~ 20
Front Panel Buffers
Text Label 4750 5600 0    50   ~ 0
~FPµC0
Text Label 4750 5700 0    50   ~ 0
~FPµC1
Text Label 4750 5800 0    50   ~ 0
~FPµC2
Wire Bus Line
	6200 5800 6650 5800
Wire Wire Line
	6200 5100 6650 5100
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
Text Label 4250 5200 2    50   ~ 0
~MEM
Text Label 4250 5300 2    50   ~ 0
~IO
Text Label 4250 5400 2    50   ~ 0
~R
Text Label 4250 5500 2    50   ~ 0
~WEN
Text Label 4250 5600 2    50   ~ 0
~END
Text Notes 3750 2950 2    100  ~ 20
Control Store
Text Label 4250 3300 2    50   ~ 0
RADDR0
Text Label 4250 3400 2    50   ~ 0
RADDR1
Text Label 4250 3500 2    50   ~ 0
RADDR2
Text Label 4250 3600 2    50   ~ 0
RADDR3
Text Label 4250 3700 2    50   ~ 0
RADDR4
Text Label 4250 3800 2    50   ~ 0
WADDR0
Text Label 4250 3900 2    50   ~ 0
WADDR1
Text Label 4250 4000 2    50   ~ 0
WADDR2
Text Label 4250 4100 2    50   ~ 0
WADDR3
Text Label 4250 4200 2    50   ~ 0
WADDR4
Text Label 4250 4300 2    50   ~ 0
COND0
Text Label 4250 4400 2    50   ~ 0
COND1
Text Label 4250 4500 2    50   ~ 0
COND2
Text Label 4250 4600 2    50   ~ 0
COND3
Text Label 4250 4700 2    50   ~ 0
COND4
Text Label 4250 4800 2    50   ~ 0
ACTION0
Text Label 4250 4900 2    50   ~ 0
ACTION1
Text Label 4250 5000 2    50   ~ 0
ACTION2
Text Label 4250 5100 2    50   ~ 0
ACTION3
$Sheet
S 2650 3150 1150 2600
U 5E34FD9B
F0 "Microcode Store" 50
F1 "cpu_microcode_store.sch" 50
F2 "UPC0" I L 2650 3300 50 
F3 "UPC1" I L 2650 3400 50 
F4 "UPC2" I L 2650 3500 50 
F5 "UPC3" I L 2650 3600 50 
F6 "IDX0" I L 2650 3700 50 
F7 "IDX1" I L 2650 3800 50 
F8 "~COND" I L 2650 3900 50 
F9 "IR7" I L 2650 4100 50 
F10 "IR8" I L 2650 4200 50 
F11 "IR9" I L 2650 4300 50 
F12 "IR10" I L 2650 4400 50 
F13 "IR11" I L 2650 4500 50 
F14 "IR12" I L 2650 4600 50 
F15 "IR13" I L 2650 4700 50 
F16 "IR14" I L 2650 4800 50 
F17 "IR15" I L 2650 4900 50 
F18 "~IRQSµC" I L 2650 5000 50 
F19 "~RSTHOLD" I L 2650 5100 50 
F20 "RADDR0" O R 3800 3300 50 
F21 "RADDR1" O R 3800 3400 50 
F22 "RADDR2" O R 3800 3500 50 
F23 "RADDR3" O R 3800 3600 50 
F24 "RADDR4" O R 3800 3700 50 
F25 "WADDR0" O R 3800 3800 50 
F26 "WADDR1" O R 3800 3900 50 
F27 "WADDR2" O R 3800 4000 50 
F28 "WADDR3" O R 3800 4100 50 
F29 "WADDR4" O R 3800 4200 50 
F30 "COND0" O R 3800 4300 50 
F31 "COND1" O R 3800 4400 50 
F32 "COND2" O R 3800 4500 50 
F33 "COND3" O R 3800 4600 50 
F34 "COND4" O R 3800 4700 50 
F35 "ACTION0" O R 3800 4800 50 
F36 "ACTION1" O R 3800 4900 50 
F37 "ACTION2" O R 3800 5000 50 
F38 "ACTION3" O R 3800 5100 50 
F39 "~MEM" O R 3800 5200 50 
F40 "~IO" O R 3800 5300 50 
F41 "~R" O R 3800 5400 50 
F42 "~WEN" O R 3800 5500 50 
F43 "~END" O R 3800 5600 50 
F44 "CLK" I L 2650 5350 50 
F45 "~OE" I L 2650 5600 50 
$EndSheet
Wire Wire Line
	3800 5500 4250 5500
Wire Wire Line
	3800 5600 4250 5600
Wire Wire Line
	3800 5400 4250 5400
Wire Wire Line
	3800 5300 4250 5300
Text Label 2250 3300 0    50   ~ 0
UPC0
Text Label 2250 3400 0    50   ~ 0
UPC1
Text Label 2250 3500 0    50   ~ 0
UPC2
Text Label 2250 3600 0    50   ~ 0
UPC3
Text Label 2250 5000 0    50   ~ 0
~IRQSµC
Text Label 2250 5100 0    50   ~ 0
~RSTHOLD
Text Label 2250 3700 0    50   ~ 0
IDX0
Text Label 2250 3800 0    50   ~ 0
IDX1
Text Label 2250 4200 0    50   ~ 0
IR8
Text Label 2250 4300 0    50   ~ 0
IR9
Text Label 2250 4400 0    50   ~ 0
IR10
Text Label 2250 4500 0    50   ~ 0
IR11
Text Label 2250 4600 0    50   ~ 0
IR12
Text Label 2250 4700 0    50   ~ 0
IR13
Text Label 2250 4800 0    50   ~ 0
IR14
Text Label 2250 4900 0    50   ~ 0
IR15
Text Label 2250 3900 0    50   ~ 0
~COND
Text Label 2250 4100 0    50   ~ 0
IR7
Wire Wire Line
	2250 3600 2650 3600
Wire Wire Line
	2250 3500 2650 3500
Wire Wire Line
	2250 3400 2650 3400
Wire Wire Line
	2250 3300 2650 3300
Wire Wire Line
	3800 3300 4250 3300
Wire Wire Line
	3800 3400 4250 3400
Wire Wire Line
	3800 3500 4250 3500
Wire Wire Line
	3800 3600 4250 3600
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
Wire Wire Line
	3800 5200 4250 5200
Text Notes 8200 2950 2    100  ~ 20
Bus Hold
$Comp
L alexios:74HC85 U45
U 2 1 5F4A7223
P 10600 1350
F 0 "U45" H 10600 2017 50  0000 C CNN
F 1 "74HC85" H 10600 1926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 10600 1375 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 10600 1375 50  0001 C CNN
	2    10600 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F4ADA60
P 10250 1050
AR Path="/5CC0D65F/5F4ADA60" Ref="C?"  Part="1" 
AR Path="/5F4ADA60" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F4ADA60" Ref="C38"  Part="1" 
F 0 "C38" H 10159 1096 50  0000 R CNN
F 1 "100nF" H 10159 1005 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10250 1050 50  0001 C CNN
F 3 "~" H 10250 1050 50  0001 C CNN
	1    10250 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5F4ADA67
P 10250 1150
F 0 "#PWR0120" H 10250 900 50  0001 C CNN
F 1 "GND" H 10255 977 50  0000 C CNN
F 2 "" H 10250 1150 50  0001 C CNN
F 3 "" H 10250 1150 50  0001 C CNN
	1    10250 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 5F4ADA6D
P 10250 950
F 0 "#PWR0116" H 10250 800 50  0001 C CNN
F 1 "+5V" H 10265 1123 50  0000 C CNN
F 2 "" H 10250 950 50  0001 C CNN
F 3 "" H 10250 950 50  0001 C CNN
	1    10250 950 
	1    0    0    -1  
$EndComp
Connection ~ 10250 950 
Connection ~ 10250 1150
Wire Wire Line
	1350 1650 1350 1800
Text Notes 650  6450 0    50   ~ 0
The Microcode Store is enabled when ~RESET~ and ~HALT~\nare both deasserted. This is synced with CLK1 to ensure\nthe processor doesn't halt mid-microinstruction.
Text HLabel 4700 5800 0    50   Input ~ 0
~FPµC2
Text HLabel 4700 5700 0    50   Input ~ 0
~FPµC1
Text HLabel 4700 5600 0    50   Input ~ 0
~FPµC0
Text Notes 7000 4650 0    50   ~ 0
Note: The DFP adds bus hold\nto all other control outputs.
Connection ~ 7650 5000
Connection ~ 7650 5400
Connection ~ 7650 5300
Connection ~ 7650 5100
$Comp
L alexios:SN74ACT1071 U?
U 2 1 5DA7AA39
P 8000 5500
AR Path="/5DEAC282/5DEAA264/5DA7AA39" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5DA7AA39" Ref="U47"  Part="2" 
AR Path="/5DA7AA39" Ref="U?"  Part="1" 
F 0 "U47" H 7900 5450 50  0000 L CNN
F 1 "SN74ACT1071" H 7900 5350 50  0000 L CNN
F 2 "alexios:SOIC-14" H 7700 5850 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 7700 5850 50  0001 C CNN
	2    8000 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 5300 7650 5400
Wire Wire Line
	7650 5100 7650 5000
$Comp
L power:GND #PWR0110
U 1 1 5E28DA00
P 7650 5400
AR Path="/5DEAC282/5E28DA00" Ref="#PWR0110"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E28DA00" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 7650 5150 50  0001 C CNN
F 1 "GND" H 7655 5227 50  0000 C CNN
F 2 "" H 7650 5400 50  0001 C CNN
F 3 "" H 7650 5400 50  0001 C CNN
	1    7650 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E28D9FA
P 7650 5200
AR Path="/5CC0D65F/5E28D9FA" Ref="C?"  Part="1" 
AR Path="/5E28D9FA" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E28D9FA" Ref="C33"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E28D9FA" Ref="C?"  Part="1" 
F 0 "C33" H 7558 5246 50  0000 R CNN
F 1 "100nF" H 7558 5155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7650 5200 50  0001 C CNN
F 3 "~" H 7650 5200 50  0001 C CNN
	1    7650 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DF3702C
P 4550 7350
AR Path="/5CC0D65F/5DF3702C" Ref="C?"  Part="1" 
AR Path="/5DF3702C" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DF3702C" Ref="C37"  Part="1" 
F 0 "C37" H 4459 7396 50  0000 R CNN
F 1 "100nF" H 4459 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 7350 50  0001 C CNN
F 3 "~" H 4550 7350 50  0001 C CNN
	1    4550 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5DF37032
P 4550 7450
F 0 "#PWR0119" H 4550 7200 50  0001 C CNN
F 1 "GND" H 4555 7277 50  0000 C CNN
F 2 "" H 4550 7450 50  0001 C CNN
F 3 "" H 4550 7450 50  0001 C CNN
	1    4550 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0115
U 1 1 5DF37038
P 4550 7250
F 0 "#PWR0115" H 4550 7100 50  0001 C CNN
F 1 "+5V" H 4565 7423 50  0000 C CNN
F 2 "" H 4550 7250 50  0001 C CNN
F 3 "" H 4550 7250 50  0001 C CNN
	1    4550 7250
	1    0    0    -1  
$EndComp
Text Notes 700  6050 0    50   ~ 0
~RESET~\n\n  0\n  X\n  1
Text Notes 1000 6050 0    50   ~ 0
~HALT~\n\n  X\n  0\n  1
Text Notes 1350 6050 0    50   ~ 0
~CSE~\n\n  1\n  1\n  0
Wire Notes Line width 12 style solid
	650  5600 1600 5600
Wire Notes Line width 12 style solid
	1600 5600 1600 6100
Wire Notes Line width 12 style solid
	650  5600 650  6100
Wire Notes Line style solid
	650  5760 1600 5760
Wire Notes Line
	1240 5600 1240 6100
Wire Notes Line width 12 style solid
	650  6100 1600 6100
Text Label 4750 5500 0    50   ~ 0
~FPµA0
$Sheet
S 5050 3150 1150 2750
U 5D82AC00
F0 "Sheet5D82ABFF" 50
F1 "cpu_microcode_fp.sch" 50
F2 "RADDR0" I R 6200 3300 50 
F3 "RADDR1" I R 6200 3400 50 
F4 "RADDR2" I R 6200 3500 50 
F5 "RADDR3" I R 6200 3600 50 
F6 "RADDR4" I R 6200 3700 50 
F7 "WADDR0" I R 6200 3800 50 
F8 "WADDR1" I R 6200 3900 50 
F9 "WADDR2" I R 6200 4000 50 
F10 "WADDR3" I R 6200 4100 50 
F11 "WADDR4" I R 6200 4200 50 
F12 "COND0" I R 6200 4300 50 
F13 "COND1" I R 6200 4400 50 
F14 "COND2" I R 6200 4500 50 
F15 "COND3" I R 6200 4600 50 
F16 "COND4" I R 6200 4700 50 
F17 "ACTION0" I R 6200 4800 50 
F18 "ACTION1" I R 6200 4900 50 
F19 "ACTION2" I R 6200 5000 50 
F20 "ACTION3" I R 6200 5100 50 
F21 "~MEM" I R 6200 5200 50 
F22 "~IO" I R 6200 5300 50 
F23 "~R" I R 6200 5400 50 
F24 "~WEN" I R 6200 5500 50 
F25 "~END" I R 6200 5600 50 
F26 "FPD[0..7]" I R 6200 5800 50 
F27 "~FPµA0" I L 5050 5500 50 
F28 "~FPµC0" I L 5050 5600 50 
F29 "~FPµC1" I L 5050 5700 50 
F30 "~FPµC2" I L 5050 5800 50 
F31 "UPC0" I L 5050 3300 50 
F32 "UPC1" I L 5050 3400 50 
F33 "UPC2" I L 5050 3500 50 
F34 "UPC3" I L 5050 3600 50 
F35 "IDX0" I L 5050 3700 50 
F36 "IDX1" I L 5050 3800 50 
F37 "~COND" I L 5050 3900 50 
F38 "RSVD" I L 5050 4000 50 
$EndSheet
Text Label 2250 5350 0    50   ~ 0
CLK2
Text HLabel 1150 3700 0    50   Input ~ 0
IDX0
Text HLabel 1150 3800 0    50   Input ~ 0
IDX1
Text HLabel 1150 4100 0    50   Input ~ 0
IR7
Text HLabel 1150 4200 0    50   Input ~ 0
IR8
Text HLabel 1150 4300 0    50   Input ~ 0
IR9
Text HLabel 1150 4400 0    50   Input ~ 0
IR10
Text HLabel 1150 4500 0    50   Input ~ 0
IR11
Text HLabel 1150 4600 0    50   Input ~ 0
IR12
Text HLabel 1150 4700 0    50   Input ~ 0
IR13
Text HLabel 1150 4800 0    50   Input ~ 0
IR14
Text HLabel 1150 4900 0    50   Input ~ 0
IR15
Wire Wire Line
	1150 3700 2650 3700
Wire Wire Line
	1150 3800 2650 3800
Wire Wire Line
	1150 3900 2650 3900
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
Wire Wire Line
	1150 5000 2650 5000
Entry Wire Line
	5000 1600 5100 1700
Entry Wire Line
	5000 1700 5100 1800
Entry Wire Line
	5000 1800 5100 1900
Entry Wire Line
	5000 1900 5100 2000
Text Label 5100 2450 1    50   ~ 0
UPC[0..3]
Entry Wire Line
	2150 3200 2250 3300
Entry Wire Line
	2150 3300 2250 3400
Entry Wire Line
	2150 3400 2250 3500
Entry Wire Line
	2150 3500 2250 3600
Entry Bus Bus
	5000 2650 5100 2550
Entry Bus Bus
	2250 2650 2150 2750
Text Label 2150 3100 1    50   ~ 0
UPC[0..3]
Wire Wire Line
	7850 2250 8300 2250
Text Notes 5250 750  0    50   ~ 10
Set to 010 for Microcode v.7.
Text Notes 7750 2100 0    50   ~ 0
High = Fetch.\nLow = Execute.\nThis is for the benefit of the front panel only.
NoConn ~ 7850 2450
NoConn ~ 7850 2350
Wire Wire Line
	6750 2050 6750 2250
Wire Wire Line
	6850 2050 6750 2050
Text HLabel 8300 2250 2    50   Output ~ 0
FPFETCH
Text Label 8250 2250 2    50   ~ 0
FPFETCH
Wire Wire Line
	6700 2350 6850 2350
$Comp
L power:+5V #PWR0105
U 1 1 5FEA12FB
P 6700 2350
F 0 "#PWR0105" H 6700 2200 50  0001 C CNN
F 1 "+5V" V 6800 2350 50  0000 L CNN
F 2 "" H 6700 2350 50  0001 C CNN
F 3 "" H 6700 2350 50  0001 C CNN
	1    6700 2350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5FE9AF52
P 6750 2500
F 0 "#PWR0107" H 6750 2250 50  0001 C CNN
F 1 "GND" H 6755 2327 50  0000 C CNN
F 2 "" H 6750 2500 50  0001 C CNN
F 3 "" H 6750 2500 50  0001 C CNN
	1    6750 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2450 6750 2500
Connection ~ 6750 2450
Wire Wire Line
	6850 2450 6750 2450
Wire Wire Line
	6750 2250 6750 2450
Connection ~ 6750 2250
Wire Wire Line
	6850 2250 6750 2250
$Comp
L alexios:74HC85 U45
U 1 1 5FE49D00
P 7350 1650
F 0 "U45" H 7350 675 50  0000 C CNN
F 1 "74HC85" H 7350 584 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7350 1675 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 7350 1675 50  0001 C CNN
	1    7350 1650
	1    0    0    -1  
$EndComp
Text Label 5200 1250 0    50   ~ 0
UPC0
Text Label 5200 1350 0    50   ~ 0
UPC1
Text Label 5200 1450 0    50   ~ 0
UPC2
Text Label 5200 1550 0    50   ~ 0
UPC3
Entry Wire Line
	5200 1250 5100 1350
Entry Wire Line
	5200 1350 5100 1450
Entry Wire Line
	5200 1450 5100 1550
Entry Wire Line
	5200 1550 5100 1650
Wire Wire Line
	5200 1250 6850 1250
Wire Wire Line
	5200 1550 6850 1550
Wire Wire Line
	5200 1450 6850 1450
Wire Wire Line
	5200 1350 6850 1350
Text Label 6800 1250 2    50   ~ 0
UPC0
Text Label 6800 1350 2    50   ~ 0
UPC1
Text Label 6800 1450 2    50   ~ 0
UPC2
Text Label 6800 1550 2    50   ~ 0
UPC3
Text Notes 5600 2100 0    98   ~ 20
*
Text Notes 5400 1050 0    50   ~ 0
JP4: short 2-3. (GND)\nJP5: short 1-2. (VCC)\nJP6: short 2-3. (GND)
Text Notes 6750 1000 0    100  ~ 20
Fetch/Execute State Decoder
Wire Wire Line
	1150 5100 2650 5100
Text HLabel 1150 5350 0    50   Input ~ 0
CLK2
Text HLabel 4700 5500 0    50   Input ~ 0
~FPµA0
Entry Wire Line
	4550 3200 4650 3300
Entry Wire Line
	4550 3300 4650 3400
Entry Wire Line
	4550 3400 4650 3500
Entry Wire Line
	4550 3500 4650 3600
Entry Bus Bus
	4550 2750 4650 2650
Entry Bus Bus
	4550 2750 4450 2650
Wire Bus Line
	5000 2650 4650 2650
Wire Bus Line
	4450 2650 2250 2650
Wire Wire Line
	1150 5350 2650 5350
$Comp
L alexios:SN74ACT1071 U?
U 1 1 5E1680B3
P 7850 3950
AR Path="/5DEAC282/5DEAA264/5E1680B3" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E1680B3" Ref="U47"  Part="1" 
AR Path="/5E1680B3" Ref="U?"  Part="1" 
F 0 "U47" H 7800 4750 50  0000 L CNN
F 1 "SN74ACT1071" H 7600 4650 50  0000 L CNN
F 2 "alexios:SOIC-14" H 7550 4300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 7550 4300 50  0001 C CNN
	1    7850 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 61FE2DF7
P 7200 4050
F 0 "#PWR0114" H 7200 3900 50  0001 C CNN
F 1 "+5V" V 7215 4178 50  0000 L CNN
F 2 "" H 7200 4050 50  0001 C CNN
F 3 "" H 7200 4050 50  0001 C CNN
	1    7200 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 4050 7300 4050
Wire Wire Line
	7300 4050 7300 4150
Wire Wire Line
	7300 4350 7350 4350
Connection ~ 7300 4050
Wire Wire Line
	7300 4050 7350 4050
Wire Wire Line
	7350 4150 7300 4150
Connection ~ 7300 4150
Wire Wire Line
	7300 4150 7300 4250
Wire Wire Line
	7350 4250 7300 4250
Connection ~ 7300 4250
Wire Wire Line
	7300 4250 7300 4350
$Sheet
S 3400 1450 1150 900 
U 5F643CAF
F0 "Micro-Program Counter" 50
F1 "upc.sch" 50
F2 "UPC0" O R 4550 1600 50 
F3 "UPC1" O R 4550 1700 50 
F4 "UPC2" O R 4550 1800 50 
F5 "UPC3" O R 4550 1900 50 
F6 "CLK4" I L 3400 1700 50 
F7 "~ENDEXT" I L 3400 2000 50 
F8 "~END" I L 3400 1900 50 
F9 "~HALT" I L 3400 1800 50 
F10 "~RSTHOLD" I L 3400 1600 50 
F11 "~µPC-INH" I L 3400 2100 50 
$EndSheet
Wire Wire Line
	4550 1600 5000 1600
Wire Wire Line
	4550 1700 5000 1700
Wire Wire Line
	4550 1800 5000 1800
Wire Wire Line
	4550 1900 5000 1900
Wire Wire Line
	1150 2100 3400 2100
Text HLabel 1150 2100 0    50   Input ~ 0
~µPC-INH
Wire Wire Line
	3400 1600 2150 1600
Text Label 2150 1600 0    50   ~ 0
~RSTHOLD
Text Label 2150 1700 0    50   ~ 0
CLK4
Text Label 2150 1800 0    50   ~ 0
~HALT
Text Label 2150 1900 0    50   ~ 0
~END
Text Label 2150 2000 0    50   ~ 0
~ENDEXT
Wire Wire Line
	1350 1800 3400 1800
Connection ~ 1350 1800
Wire Wire Line
	1150 1700 3400 1700
Wire Wire Line
	2150 1900 3400 1900
Text Notes 700  1200 0    50   ~ 0
This is the inner sanctum of the control unit, reading, and decoding microprograms\ninto various fields.
Text Notes 700  900  0    100  ~ 20
The Microprogram Sequencer
Wire Wire Line
	2850 6950 2450 6950
Wire Wire Line
	2450 6950 2450 7400
Text Label 3800 7050 0    50   ~ 0
~CSE
Text Label 1050 7400 0    50   ~ 0
~CLK1
$Comp
L power:GND #PWR0205
U 1 1 5FCC3B45
P 1600 7100
F 0 "#PWR0205" H 1600 6850 50  0001 C CNN
F 1 "GND" H 1605 6927 50  0000 C CNN
F 2 "" H 1600 7100 50  0001 C CNN
F 3 "" H 1600 7100 50  0001 C CNN
	1    1600 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 7050 1600 7100
Wire Wire Line
	1350 6950 1350 7400
Connection ~ 1350 7400
Wire Wire Line
	1350 7400 2450 7400
Text Label 1400 6850 0    50   ~ 0
~HALT
Text Label 2850 6950 2    50   ~ 0
~CLK1
Text Label 2850 7050 2    50   ~ 0
~RESET
NoConn ~ 3750 6750
$Comp
L alexios:74LVC1G373 U46
U 2 1 5FD75300
P 4900 7350
F 0 "U46" H 5080 7396 50  0000 L CNN
F 1 "74LVC1G373" H 5080 7305 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4800 7375 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74lvc1g373.pdf" H 4800 7375 50  0001 C CNN
	2    4900 7350
	1    0    0    -1  
$EndComp
Connection ~ 4550 7450
Connection ~ 4550 7250
$Comp
L Device:C_Small C?
U 1 1 5FD76B39
P 5950 7350
AR Path="/5CC0D65F/5FD76B39" Ref="C?"  Part="1" 
AR Path="/5FD76B39" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5FD76B39" Ref="C34"  Part="1" 
F 0 "C34" H 5859 7396 50  0000 R CNN
F 1 "100nF" H 5859 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5950 7350 50  0001 C CNN
F 3 "~" H 5950 7350 50  0001 C CNN
	1    5950 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0206
U 1 1 5FD76B3F
P 5950 7450
F 0 "#PWR0206" H 5950 7200 50  0001 C CNN
F 1 "GND" H 5955 7277 50  0000 C CNN
F 2 "" H 5950 7450 50  0001 C CNN
F 3 "" H 5950 7450 50  0001 C CNN
	1    5950 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0207
U 1 1 5FD76B45
P 5950 7250
F 0 "#PWR0207" H 5950 7100 50  0001 C CNN
F 1 "+5V" H 5965 7423 50  0000 C CNN
F 2 "" H 5950 7250 50  0001 C CNN
F 3 "" H 5950 7250 50  0001 C CNN
	1    5950 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U29
U 2 1 5FD86D2B
P 6300 7350
F 0 "U29" H 6480 7396 50  0000 L CNN
F 1 "74LVC1G74" H 6480 7305 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 6750 7350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 6750 7350 50  0001 C CNN
	2    6300 7350
	1    0    0    -1  
$EndComp
Connection ~ 5950 7450
Connection ~ 5950 7250
Wire Wire Line
	4000 7050 4000 5950
Wire Wire Line
	3750 7050 4000 7050
Text HLabel 1000 7400 0    50   Input ~ 0
CLK1
Wire Wire Line
	1000 7400 1350 7400
Wire Wire Line
	2850 7050 2550 7050
Text Label 2250 5600 0    50   ~ 0
~CSE
Wire Wire Line
	2200 5600 2650 5600
Wire Wire Line
	2200 5950 2200 5600
Wire Wire Line
	4000 5950 2200 5950
$Comp
L alexios:74LVC1G74 U29
U 1 1 5FA8387E
P 3300 6900
F 0 "U29" H 3300 7317 50  0000 C CNN
F 1 "74LVC1G74" H 3300 7226 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 3750 6900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 3750 6900 50  0001 C CNN
	1    3300 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1800 1350 1800
Text Label 1400 6950 0    50   ~ 0
~CLK1
Wire Wire Line
	2550 7500 2550 7050
Wire Wire Line
	1000 7500 2550 7500
Text Label 1050 7500 0    50   ~ 0
~RESET
Text HLabel 1000 7500 0    50   Input ~ 0
~RESET
Wire Wire Line
	1650 7050 1600 7050
Wire Wire Line
	2550 6850 2850 6850
Wire Wire Line
	1650 6850 1400 6850
Wire Wire Line
	1650 6950 1350 6950
$Comp
L alexios:74LVC1G373 U46
U 1 1 5FC81A21
P 2100 6950
F 0 "U46" H 2100 7317 50  0000 C CNN
F 1 "74LVC1G373" H 2100 7226 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 2000 6975 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74lvc1g373.pdf" H 2000 6975 50  0001 C CNN
	1    2100 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 6750 2800 6750
Wire Wire Line
	2800 6750 2800 6700
$Comp
L power:+5V #PWR0208
U 1 1 600341A3
P 2800 6700
F 0 "#PWR0208" H 2800 6550 50  0001 C CNN
F 1 "+5V" H 2815 6873 50  0000 C CNN
F 2 "" H 2800 6700 50  0001 C CNN
F 3 "" H 2800 6700 50  0001 C CNN
	1    2800 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2000 3400 2000
Connection ~ 1800 2000
Wire Wire Line
	1150 2000 1800 2000
Wire Wire Line
	1800 1650 1800 2000
$Comp
L Device:R_Small R?
U 1 1 5DD09005
P 1800 1550
AR Path="/5DD09005" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DD09005" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DD09005" Ref="R24"  Part="1" 
AR Path="/5F67D4B5/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DD09005" Ref="R?"  Part="1" 
F 0 "R24" H 1741 1504 50  0000 R CNN
F 1 "4.7kΩ" H 1741 1595 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1800 1550 50  0001 C CNN
F 3 "~" H 1800 1550 50  0001 C CNN
	1    1800 1550
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 5DD4145D
P 1800 1450
F 0 "#PWR0101" H 1800 1300 50  0001 C CNN
F 1 "+5V" H 1650 1500 50  0000 C CNN
F 2 "" H 1800 1450 50  0001 C CNN
F 3 "" H 1800 1450 50  0001 C CNN
	1    1800 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5DD4162D
P 1350 1450
F 0 "#PWR0102" H 1350 1300 50  0001 C CNN
F 1 "+5V" H 1200 1500 50  0000 C CNN
F 2 "" H 1350 1450 50  0001 C CNN
F 3 "" H 1350 1450 50  0001 C CNN
	1    1350 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DD0C349
P 1350 1550
AR Path="/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DD0C349" Ref="R25"  Part="1" 
AR Path="/5F67D4B5/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DD0C349" Ref="R?"  Part="1" 
F 0 "R25" H 1291 1504 50  0000 R CNN
F 1 "4.7kΩ" H 1291 1595 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1350 1550 50  0001 C CNN
F 3 "~" H 1350 1550 50  0001 C CNN
	1    1350 1550
	-1   0    0    1   
$EndComp
Text Label 2850 6850 2    50   ~ 0
~HALT₀
Text Label 2150 2100 0    50   ~ 0
~µPC-INH
Wire Wire Line
	5550 1850 5650 1850
Wire Wire Line
	5650 1850 5650 1750
Wire Wire Line
	5650 1750 6850 1750
Wire Wire Line
	5950 1850 6850 1850
Wire Wire Line
	6250 2100 6250 1950
Wire Wire Line
	6250 1950 6850 1950
$Comp
L power:+5V #PWR01
U 1 1 5EF1BFFC
P 5450 1700
F 0 "#PWR01" H 5450 1550 50  0001 C CNN
F 1 "+5V" H 5350 1700 50  0000 C CNN
F 2 "" H 5450 1700 50  0001 C CNN
F 3 "" H 5450 1700 50  0001 C CNN
	1    5450 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5EF1C719
P 5750 1700
F 0 "#PWR04" H 5750 1550 50  0001 C CNN
F 1 "+5V" H 5650 1700 50  0000 C CNN
F 2 "" H 5750 1700 50  0001 C CNN
F 3 "" H 5750 1700 50  0001 C CNN
	1    5750 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5EF1C98A
P 6050 1700
F 0 "#PWR07" H 6050 1550 50  0001 C CNN
F 1 "+5V" H 5950 1700 50  0000 C CNN
F 2 "" H 6050 1700 50  0001 C CNN
F 3 "" H 6050 1700 50  0001 C CNN
	1    6050 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5EF1D08A
P 6050 2300
F 0 "#PWR019" H 6050 2050 50  0001 C CNN
F 1 "GND" H 6055 2127 50  0000 C CNN
F 2 "" H 6050 2300 50  0001 C CNN
F 3 "" H 6050 2300 50  0001 C CNN
	1    6050 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5EF2D562
P 5750 2300
F 0 "#PWR015" H 5750 2050 50  0001 C CNN
F 1 "GND" H 5755 2127 50  0000 C CNN
F 2 "" H 5750 2300 50  0001 C CNN
F 3 "" H 5750 2300 50  0001 C CNN
	1    5750 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5EF2D6C0
P 5450 2300
F 0 "#PWR011" H 5450 2050 50  0001 C CNN
F 1 "GND" H 5455 2127 50  0000 C CNN
F 2 "" H 5450 2300 50  0001 C CNN
F 3 "" H 5450 2300 50  0001 C CNN
	1    5450 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2000 5450 2300
Wire Wire Line
	6050 2250 6050 2300
Wire Wire Line
	6150 2100 6250 2100
Wire Wire Line
	5750 1800 5750 1700
Wire Wire Line
	5850 1950 5950 1950
Wire Wire Line
	5950 1950 5950 1850
Wire Wire Line
	5750 2100 5750 2300
Wire Wire Line
	6050 1950 6050 1700
$Comp
L alexios:SolderJumper_3_Bridged23 JP4
U 1 1 5F125CF7
P 5450 1850
F 0 "JP4" V 5850 1900 50  0000 L CNN
F 1 "SolderJumper_3_Bridged23" H 5450 1960 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5450 1850 50  0001 C CNN
F 3 "~" H 5450 1850 50  0001 C CNN
	1    5450 1850
	0    -1   1    0   
$EndComp
$Comp
L alexios:SolderJumper_3_Bridged23 JP6
U 1 1 5F129456
P 6050 2100
F 0 "JP6" V 6200 2150 50  0000 L CNN
F 1 "SolderJumper_3_Bridged23" H 6050 2210 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm" H 6050 2100 50  0001 C CNN
F 3 "~" H 6050 2100 50  0001 C CNN
	1    6050 2100
	0    -1   1    0   
$EndComp
$Comp
L alexios:SolderJumper_3_Bridged12 JP5
U 1 1 5F12A1A9
P 5750 1950
F 0 "JP5" V 6050 2000 50  0000 L CNN
F 1 "SolderJumper_3_Bridged12" H 5750 2060 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5750 1950 50  0001 C CNN
F 3 "~" H 5750 1950 50  0001 C CNN
	1    5750 1950
	0    -1   1    0   
$EndComp
Wire Notes Line width 20 style solid
	5200 600  6450 600 
Wire Notes Line width 20 style solid
	5200 1100 5200 600 
Text Notes 5250 950  0    98   ~ 20
*
Wire Notes Line width 20 style solid
	6450 1100 5200 1100
Wire Notes Line width 20 style solid
	6450 600  6450 1100
Wire Wire Line
	5050 4000 4650 4000
$Comp
L Connector:TestPoint TP?
U 1 1 5F4495E5
P 4650 4000
AR Path="/5F4495E5" Ref="TP?"  Part="1" 
AR Path="/5DEAC282/5F4495E5" Ref="TP5"  Part="1" 
F 0 "TP5" V 4550 4100 50  0000 C CNN
F 1 "TestPoint" V 4754 4072 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 4850 4000 50  0001 C CNN
F 3 "~" H 4850 4000 50  0001 C CNN
	1    4650 4000
	0    -1   -1   0   
$EndComp
Wire Bus Line
	4550 2750 4550 3500
Wire Bus Line
	2150 2750 2150 3500
Wire Bus Line
	9800 4800 9800 5150
Wire Bus Line
	9800 4100 9800 4550
Wire Bus Line
	9800 3400 9800 3850
Wire Bus Line
	9800 2700 9800 3150
Wire Bus Line
	5100 1350 5100 2550
$EndSCHEMATC
