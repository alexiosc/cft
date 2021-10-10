EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 17
Title "Microcode Sequencer"
Date ""
Rev "2119"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "sequencer.v"
$EndDescr
Text HLabel 1150 2050 0    50   Input ~ 0
~ENDEXT
Text HLabel 1150 1850 0    50   Input ~ 0
~HALT
Text HLabel 1150 1750 0    50   Input ~ 0
CLK4
Text Label 5000 1600 2    50   ~ 0
UPC0
Text Label 5000 1700 2    50   ~ 0
UPC1
Text Label 5000 1800 2    50   ~ 0
UPC2
Text Label 5000 1900 2    50   ~ 0
UPC3
Text Label 10400 5700 2    50   ~ 0
COND[0..4]
Text Label 10400 5600 2    50   ~ 0
WADDR[0..4]
Text HLabel 10450 5500 2    50   Output ~ 0
RADDR[0..4]
Text HLabel 10450 5600 2    50   Output ~ 0
WADDR[0..4]
Text HLabel 10450 5700 2    50   Output ~ 0
COND[0..4]
Text Label 10400 5800 2    50   ~ 0
ACTION[0..3]
Text HLabel 10450 5800 2    50   Output ~ 0
ACTION[0..3]
Text Notes 6950 6700 0    50   ~ 0
2019 Design Update: both micro-Address Vector and micro-Control Vector have changed significantly\nin this version. Fields are much more vertical now, but the processor is also much more capable.
Text Notes 6950 6400 0    63   ~ 13
2019 Design Update
Text HLabel 10450 5900 2    50   Output ~ 0
~MEM
Text HLabel 10450 6000 2    50   Output ~ 0
~IO
Text HLabel 10450 6100 2    50   Output ~ 0
~REN
Text HLabel 10450 6200 2    50   Output ~ 0
~WEN
Text HLabel 10450 6300 2    50   Output ~ 0
~END
Text Notes 11000 5350 2    100  ~ 20
Control Vector
Wire Wire Line
	9900 5900 10450 5900
Wire Wire Line
	9900 6000 10450 6000
Wire Wire Line
	9900 6100 10450 6100
Wire Wire Line
	9900 6300 10450 6300
Wire Wire Line
	9900 6200 10450 6200
Text Label 9900 6300 0    50   ~ 0
~END
Text Label 9900 6200 0    50   ~ 0
~WEN
Text Label 9900 6100 0    50   ~ 0
~REN
Text Label 9900 6000 0    50   ~ 0
~IO
Text Label 9900 5900 0    50   ~ 0
~MEM
Wire Bus Line
	9900 5600 10450 5600
Wire Bus Line
	9900 5700 10450 5700
Wire Bus Line
	9900 5800 10450 5800
Text Label 10400 5500 2    50   ~ 0
RADDR[0..4]
Wire Bus Line
	9900 5500 10450 5500
Text HLabel 1000 5000 0    50   Input ~ 0
~IRQSµC
Text HLabel 1000 5100 0    50   Input ~ 0
~RSTHOLD
Text HLabel 1000 3900 0    50   Input ~ 0
~COND
Text HLabel 6100 5800 2    50   3State ~ 0
FPD[0..7]
Text Label 6100 5200 2    50   ~ 0
~MEM
Text Label 6100 5300 2    50   ~ 0
~IO
Text Label 6100 5400 2    50   ~ 0
~REN
Text Label 6100 5500 2    50   ~ 0
~WEN
Text Label 6100 5600 2    50   ~ 0
~END
Text Label 6100 3300 2    50   ~ 0
RADDR0
Text Label 6100 3400 2    50   ~ 0
RADDR1
Text Label 6100 3500 2    50   ~ 0
RADDR2
Text Label 6100 3600 2    50   ~ 0
RADDR3
Text Label 6100 3700 2    50   ~ 0
RADDR4
Text Label 6100 3800 2    50   ~ 0
WADDR0
Text Label 6100 3900 2    50   ~ 0
WADDR1
Text Label 6100 4000 2    50   ~ 0
WADDR2
Text Label 6100 4100 2    50   ~ 0
WADDR3
Text Label 6100 4200 2    50   ~ 0
WADDR4
Text Label 6100 4300 2    50   ~ 0
COND0
Text Label 6100 4400 2    50   ~ 0
COND1
Text Label 6100 4500 2    50   ~ 0
COND2
Text Label 6100 4600 2    50   ~ 0
COND3
Text Label 6100 4700 2    50   ~ 0
COND4
Text Label 6100 4800 2    50   ~ 0
ACTION0
Text Label 6100 4900 2    50   ~ 0
ACTION1
Text Label 6100 5000 2    50   ~ 0
ACTION2
Text Label 6100 5100 2    50   ~ 0
ACTION3
Wire Wire Line
	5700 5500 6100 5500
Wire Wire Line
	5700 5600 6100 5600
Wire Wire Line
	5700 5400 6100 5400
Wire Wire Line
	5700 5300 6100 5300
Wire Wire Line
	5700 5200 6100 5200
Text Label 6100 5800 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	4550 5800 4200 5800
Wire Wire Line
	4550 5700 4200 5700
Wire Wire Line
	4550 5600 4200 5600
Wire Wire Line
	4550 5500 4200 5500
Text Label 3900 3300 0    50   ~ 0
UPC0
Text Label 3900 3400 0    50   ~ 0
UPC1
Text Label 3900 3500 0    50   ~ 0
UPC2
Text Label 3900 3600 0    50   ~ 0
UPC3
Text Label 3900 3700 0    50   ~ 0
IDX0
Text Label 3900 3800 0    50   ~ 0
IDX1
Text Label 3900 3900 0    50   ~ 0
~COND
Wire Wire Line
	3900 3900 4550 3900
Wire Wire Line
	3900 3800 4550 3800
Wire Wire Line
	3900 3700 4550 3700
Wire Wire Line
	3900 3600 4550 3600
Wire Wire Line
	3900 3500 4550 3500
Wire Wire Line
	3900 3400 4550 3400
Wire Wire Line
	3900 3300 4550 3300
Text Notes 6000 2950 2    100  ~ 20
Front Panel Buffers
Text Label 4250 5600 0    50   ~ 0
~FPµC0
Text Label 4250 5700 0    50   ~ 0
~FPµC1
Text Label 4250 5800 0    50   ~ 0
~FPµC2
Wire Bus Line
	5700 5800 6100 5800
Wire Wire Line
	5700 5100 6100 5100
Wire Wire Line
	5700 5000 6100 5000
Wire Wire Line
	5700 4900 6100 4900
Wire Wire Line
	5700 4800 6100 4800
Wire Wire Line
	5700 4700 6100 4700
Wire Wire Line
	5700 4600 6100 4600
Wire Wire Line
	5700 4500 6100 4500
Wire Wire Line
	5700 4400 6100 4400
Wire Wire Line
	5700 4300 6100 4300
Wire Wire Line
	5700 4200 6100 4200
Wire Wire Line
	5700 4100 6100 4100
Wire Wire Line
	5700 4000 6100 4000
Wire Wire Line
	5700 3900 6100 3900
Wire Wire Line
	5700 3800 6100 3800
Wire Wire Line
	5700 3700 6100 3700
Wire Wire Line
	5700 3600 6100 3600
Wire Wire Line
	5700 3500 6100 3500
Wire Wire Line
	5700 3400 6100 3400
Wire Wire Line
	5700 3300 6100 3300
Text Label 3700 5200 2    50   ~ 0
~MEM
Text Label 3700 5300 2    50   ~ 0
~IO
Text Label 3700 5400 2    50   ~ 0
~REN
Text Label 3700 5500 2    50   ~ 0
~WEN
Text Label 3700 5600 2    50   ~ 0
~END
Text Notes 3200 2950 2    100  ~ 20
Control Store
Text Label 3700 3300 2    50   ~ 0
RADDR0
Text Label 3700 3400 2    50   ~ 0
RADDR1
Text Label 3700 3500 2    50   ~ 0
RADDR2
Text Label 3700 3600 2    50   ~ 0
RADDR3
Text Label 3700 3700 2    50   ~ 0
RADDR4
Text Label 3700 3800 2    50   ~ 0
WADDR0
Text Label 3700 3900 2    50   ~ 0
WADDR1
Text Label 3700 4000 2    50   ~ 0
WADDR2
Text Label 3700 4100 2    50   ~ 0
WADDR3
Text Label 3700 4200 2    50   ~ 0
WADDR4
Text Label 3700 4300 2    50   ~ 0
COND0
Text Label 3700 4400 2    50   ~ 0
COND1
Text Label 3700 4500 2    50   ~ 0
COND2
Text Label 3700 4600 2    50   ~ 0
COND3
Text Label 3700 4700 2    50   ~ 0
COND4
Text Label 3700 4800 2    50   ~ 0
ACTION0
Text Label 3700 4900 2    50   ~ 0
ACTION1
Text Label 3700 5000 2    50   ~ 0
ACTION2
Text Label 3700 5100 2    50   ~ 0
ACTION3
$Sheet
S 2100 3150 1150 2600
U 5E34FD9B
F0 "Microcode Store" 50
F1 "cpu_microcode_store.sch" 50
F2 "UPC0" I L 2100 3300 50 
F3 "UPC1" I L 2100 3400 50 
F4 "UPC2" I L 2100 3500 50 
F5 "UPC3" I L 2100 3600 50 
F6 "IDX0" I L 2100 3700 50 
F7 "IDX1" I L 2100 3800 50 
F8 "~COND" I L 2100 3900 50 
F9 "IR7" I L 2100 4100 50 
F10 "IR8" I L 2100 4200 50 
F11 "IR9" I L 2100 4300 50 
F12 "IR10" I L 2100 4400 50 
F13 "IR11" I L 2100 4500 50 
F14 "IR12" I L 2100 4600 50 
F15 "IR13" I L 2100 4700 50 
F16 "IR14" I L 2100 4800 50 
F17 "IR15" I L 2100 4900 50 
F18 "~IRQSµC" I L 2100 5000 50 
F19 "~RSTHOLD" I L 2100 5100 50 
F20 "RADDR0" O R 3250 3300 50 
F21 "RADDR1" O R 3250 3400 50 
F22 "RADDR2" O R 3250 3500 50 
F23 "RADDR3" O R 3250 3600 50 
F24 "RADDR4" O R 3250 3700 50 
F25 "WADDR0" O R 3250 3800 50 
F26 "WADDR1" O R 3250 3900 50 
F27 "WADDR2" O R 3250 4000 50 
F28 "WADDR3" O R 3250 4100 50 
F29 "WADDR4" O R 3250 4200 50 
F30 "COND0" O R 3250 4300 50 
F31 "COND1" O R 3250 4400 50 
F32 "COND2" O R 3250 4500 50 
F33 "COND3" O R 3250 4600 50 
F34 "COND4" O R 3250 4700 50 
F35 "ACTION0" O R 3250 4800 50 
F36 "ACTION1" O R 3250 4900 50 
F37 "ACTION2" O R 3250 5000 50 
F38 "ACTION3" O R 3250 5100 50 
F39 "~MEM" O R 3250 5200 50 
F40 "~IO" O R 3250 5300 50 
F41 "~REN" O R 3250 5400 50 
F42 "~WEN" O R 3250 5500 50 
F43 "~END" O R 3250 5600 50 
F44 "CLK" I L 2100 5350 50 
F45 "~OE" I L 2100 5600 50 
$EndSheet
Wire Wire Line
	3250 5500 3700 5500
Wire Wire Line
	3250 5600 3700 5600
Wire Wire Line
	3250 5400 3700 5400
Wire Wire Line
	3250 5300 3700 5300
Text Label 1700 3300 0    50   ~ 0
UPC0
Text Label 1700 3400 0    50   ~ 0
UPC1
Text Label 1700 3500 0    50   ~ 0
UPC2
Text Label 1700 3600 0    50   ~ 0
UPC3
Text Label 1700 5000 0    50   ~ 0
~IRQSµC
Text Label 1700 5100 0    50   ~ 0
~RSTHOLD
Text Label 1700 3700 0    50   ~ 0
IDX0
Text Label 1700 3800 0    50   ~ 0
IDX1
Text Label 1700 4200 0    50   ~ 0
IR8
Text Label 1700 4300 0    50   ~ 0
IR9
Text Label 1700 4400 0    50   ~ 0
IR10
Text Label 1700 4500 0    50   ~ 0
IR11
Text Label 1700 4600 0    50   ~ 0
IR12
Text Label 1700 4700 0    50   ~ 0
IR13
Text Label 1700 4800 0    50   ~ 0
IR14
Text Label 1700 4900 0    50   ~ 0
IR15
Text Label 1700 3900 0    50   ~ 0
~COND
Text Label 1700 4100 0    50   ~ 0
IR7
Wire Wire Line
	1700 3600 2100 3600
Wire Wire Line
	1700 3500 2100 3500
Wire Wire Line
	1700 3400 2100 3400
Wire Wire Line
	1700 3300 2100 3300
Wire Wire Line
	3250 3300 3700 3300
Wire Wire Line
	3250 3400 3700 3400
Wire Wire Line
	3250 3500 3700 3500
Wire Wire Line
	3250 3600 3700 3600
Wire Wire Line
	3250 3700 3700 3700
Wire Wire Line
	3250 3800 3700 3800
Wire Wire Line
	3250 3900 3700 3900
Wire Wire Line
	3250 4000 3700 4000
Wire Wire Line
	3250 4100 3700 4100
Wire Wire Line
	3250 4200 3700 4200
Wire Wire Line
	3250 4300 3700 4300
Wire Wire Line
	3250 4400 3700 4400
Wire Wire Line
	3250 4500 3700 4500
Wire Wire Line
	3250 4600 3700 4600
Wire Wire Line
	3250 4700 3700 4700
Wire Wire Line
	3250 4800 3700 4800
Wire Wire Line
	3250 4900 3700 4900
Wire Wire Line
	3250 5000 3700 5000
Wire Wire Line
	3250 5100 3700 5100
Wire Wire Line
	3250 5200 3700 5200
$Comp
L alexios:74HC85 U1601
U 2 1 5F4A7223
P 10600 1350
F 0 "U1601" H 10600 2017 50  0000 C CNN
F 1 "74HC85" H 10600 1926 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 10600 1375 50  0001 C CNN
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
AR Path="/5DEAC282/5F4ADA60" Ref="C1601"  Part="1" 
F 0 "C1601" H 10159 1096 50  0000 R CNN
F 1 "100nF" H 10159 1005 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10250 1050 50  0001 C CNN
F 3 "~" H 10250 1050 50  0001 C CNN
	1    10250 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01602
U 1 1 5F4ADA67
P 10250 1150
F 0 "#PWR01602" H 10250 900 50  0001 C CNN
F 1 "GND" H 10255 977 50  0000 C CNN
F 2 "" H 10250 1150 50  0001 C CNN
F 3 "" H 10250 1150 50  0001 C CNN
	1    10250 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01601
U 1 1 5F4ADA6D
P 10250 950
F 0 "#PWR01601" H 10250 800 50  0001 C CNN
F 1 "+5V" H 10265 1123 50  0000 C CNN
F 2 "" H 10250 950 50  0001 C CNN
F 3 "" H 10250 950 50  0001 C CNN
	1    10250 950 
	1    0    0    -1  
$EndComp
Connection ~ 10250 950 
Connection ~ 10250 1150
Wire Wire Line
	1350 1700 1350 1850
Text Notes 650  6450 0    50   ~ 0
The Microcode Store is enabled when ~RESET~ and ~HALT~\nare both deasserted. This is synced with CLK1 to ensure\nthe processor doesn't halt mid-microinstruction.
Text HLabel 4200 5800 0    50   Input ~ 0
~FPµC2
Text HLabel 4200 5700 0    50   Input ~ 0
~FPµC1
Text HLabel 4200 5600 0    50   Input ~ 0
~FPµC0
$Comp
L Device:C_Small C?
U 1 1 5DF3702C
P 4550 7350
AR Path="/5CC0D65F/5DF3702C" Ref="C?"  Part="1" 
AR Path="/5DF3702C" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DF3702C" Ref="C1603"  Part="1" 
F 0 "C1603" H 4459 7396 50  0000 R CNN
F 1 "100nF" H 4459 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 7350 50  0001 C CNN
F 3 "~" H 4550 7350 50  0001 C CNN
	1    4550 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01620
U 1 1 5DF37032
P 4550 7450
F 0 "#PWR01620" H 4550 7200 50  0001 C CNN
F 1 "GND" H 4555 7277 50  0000 C CNN
F 2 "" H 4550 7450 50  0001 C CNN
F 3 "" H 4550 7450 50  0001 C CNN
	1    4550 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01618
U 1 1 5DF37038
P 4550 7250
F 0 "#PWR01618" H 4550 7100 50  0001 C CNN
F 1 "+5V" H 4565 7423 50  0000 C CNN
F 2 "" H 4550 7250 50  0001 C CNN
F 3 "" H 4550 7250 50  0001 C CNN
	1    4550 7250
	1    0    0    -1  
$EndComp
Text Notes 1000 7050 0    50   ~ 0
~RESET~\n\n  0\n  X\n  1
Text Notes 1300 7050 0    50   ~ 0
~HALT~\n\n  X\n  0\n  1
Text Notes 1650 7050 0    50   ~ 0
~CSE~\n\n  1\n  1\n  0
Wire Notes Line width 12 style solid
	950  6600 1900 6600
Wire Notes Line width 12 style solid
	1900 6600 1900 7100
Wire Notes Line width 12 style solid
	950  6600 950  7100
Wire Notes Line style solid
	950  6760 1900 6760
Wire Notes Line
	1540 6600 1540 7100
Wire Notes Line width 12 style solid
	950  7100 1900 7100
Text Label 4250 5500 0    50   ~ 0
~FPµA0
$Sheet
S 4550 3150 1150 2750
U 5D82AC00
F0 "Sheet5D82ABFF" 50
F1 "cpu_microcode_fp.sch" 50
F2 "RADDR0" I R 5700 3300 50 
F3 "RADDR1" I R 5700 3400 50 
F4 "RADDR2" I R 5700 3500 50 
F5 "RADDR3" I R 5700 3600 50 
F6 "RADDR4" I R 5700 3700 50 
F7 "WADDR0" I R 5700 3800 50 
F8 "WADDR1" I R 5700 3900 50 
F9 "WADDR2" I R 5700 4000 50 
F10 "WADDR3" I R 5700 4100 50 
F11 "WADDR4" I R 5700 4200 50 
F12 "COND0" I R 5700 4300 50 
F13 "COND1" I R 5700 4400 50 
F14 "COND2" I R 5700 4500 50 
F15 "COND3" I R 5700 4600 50 
F16 "COND4" I R 5700 4700 50 
F17 "ACTION0" I R 5700 4800 50 
F18 "ACTION1" I R 5700 4900 50 
F19 "ACTION2" I R 5700 5000 50 
F20 "ACTION3" I R 5700 5100 50 
F21 "~MEM" I R 5700 5200 50 
F22 "~IO" I R 5700 5300 50 
F23 "~REN" I R 5700 5400 50 
F24 "~WEN" I R 5700 5500 50 
F25 "~END" I R 5700 5600 50 
F26 "FPD[0..7]" I R 5700 5800 50 
F27 "~FPµA0" I L 4550 5500 50 
F28 "~FPµC0" I L 4550 5600 50 
F29 "~FPµC1" I L 4550 5700 50 
F30 "~FPµC2" I L 4550 5800 50 
F31 "UPC0" I L 4550 3300 50 
F32 "UPC1" I L 4550 3400 50 
F33 "UPC2" I L 4550 3500 50 
F34 "UPC3" I L 4550 3600 50 
F35 "IDX0" I L 4550 3700 50 
F36 "IDX1" I L 4550 3800 50 
F37 "~COND" I L 4550 3900 50 
$EndSheet
Text Label 1700 5350 0    50   ~ 0
CLK2
Text HLabel 1000 3700 0    50   Input ~ 0
IDX0
Text HLabel 1000 3800 0    50   Input ~ 0
IDX1
Wire Wire Line
	1000 3700 2100 3700
Wire Wire Line
	1000 3800 2100 3800
Wire Wire Line
	1000 3900 2100 3900
Wire Wire Line
	1600 4100 2100 4100
Wire Wire Line
	1600 4200 2100 4200
Wire Wire Line
	1600 4300 2100 4300
Wire Wire Line
	1600 4400 2100 4400
Wire Wire Line
	1600 4500 2100 4500
Wire Wire Line
	1600 4600 2100 4600
Wire Wire Line
	1600 4700 2100 4700
Wire Wire Line
	1600 4800 2100 4800
Wire Wire Line
	1600 4900 2100 4900
Wire Wire Line
	1000 5000 2100 5000
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
	1600 3200 1700 3300
Entry Wire Line
	1600 3300 1700 3400
Entry Wire Line
	1600 3400 1700 3500
Entry Wire Line
	1600 3500 1700 3600
Entry Bus Bus
	5000 2650 5100 2550
Entry Bus Bus
	1700 2650 1600 2750
Text Label 1600 3100 1    50   ~ 0
UPC[0..3]
Wire Wire Line
	8750 2250 9200 2250
Text Notes 5250 750  0    50   ~ 10
Set to 010 for Microcode v.7.
Text Notes 8650 2100 0    50   ~ 0
High = Fetch.\nLow = Execute.\nThis is for the benefit of the front panel only.
NoConn ~ 8750 2450
NoConn ~ 8750 2350
Wire Wire Line
	7650 2050 7650 2250
Wire Wire Line
	7750 2050 7650 2050
Text HLabel 9200 2250 2    50   Output ~ 0
FPFETCH
Text Label 9150 2250 2    50   ~ 0
FPFETCH
Wire Wire Line
	7600 2350 7750 2350
$Comp
L power:+5V #PWR01611
U 1 1 5FEA12FB
P 7600 2350
F 0 "#PWR01611" H 7600 2200 50  0001 C CNN
F 1 "+5V" V 7700 2350 50  0000 L CNN
F 2 "" H 7600 2350 50  0001 C CNN
F 3 "" H 7600 2350 50  0001 C CNN
	1    7600 2350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR01612
U 1 1 5FE9AF52
P 7650 2500
F 0 "#PWR01612" H 7650 2250 50  0001 C CNN
F 1 "GND" H 7655 2327 50  0000 C CNN
F 2 "" H 7650 2500 50  0001 C CNN
F 3 "" H 7650 2500 50  0001 C CNN
	1    7650 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2450 7650 2500
Connection ~ 7650 2450
Wire Wire Line
	7750 2450 7650 2450
Wire Wire Line
	7650 2250 7650 2450
Connection ~ 7650 2250
Wire Wire Line
	7750 2250 7650 2250
$Comp
L alexios:74HC85 U1601
U 1 1 5FE49D00
P 8250 1650
F 0 "U1601" H 8250 675 50  0000 C CNN
F 1 "74HC85" H 8250 584 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 8250 1675 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 8250 1675 50  0001 C CNN
	1    8250 1650
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
Text Label 7700 1250 2    50   ~ 0
UPC0
Text Label 7700 1350 2    50   ~ 0
UPC1
Text Label 7700 1450 2    50   ~ 0
UPC2
Text Label 7700 1550 2    50   ~ 0
UPC3
Text Notes 5400 1050 0    50   ~ 0
JP4: short 2-3. (GND)\nJP5: short 1-2. (VCC)\nJP6: short 2-3. (GND)
Text Notes 7000 1000 0    100  ~ 20
Fetch/Execute State Decoder
Wire Wire Line
	1000 5100 2100 5100
Text HLabel 1000 5350 0    50   Input ~ 0
CLK2
Text HLabel 4200 5500 0    50   Input ~ 0
~FPµA0
Entry Wire Line
	3800 3200 3900 3300
Entry Wire Line
	3800 3300 3900 3400
Entry Wire Line
	3800 3400 3900 3500
Entry Wire Line
	3800 3500 3900 3600
Entry Bus Bus
	3800 2750 3900 2650
Entry Bus Bus
	3800 2750 3700 2650
Wire Bus Line
	5000 2650 3900 2650
Wire Bus Line
	3700 2650 1700 2650
Wire Wire Line
	1000 5350 2100 5350
$Sheet
S 3400 1450 1150 900 
U 5F643CAF
F0 "Micro-Program Counter" 50
F1 "upc.sch" 50
F2 "UPC0" O R 4550 1600 50 
F3 "UPC1" O R 4550 1700 50 
F4 "UPC2" O R 4550 1800 50 
F5 "UPC3" O R 4550 1900 50 
F6 "CLK4" I L 3400 1750 50 
F7 "~ENDEXT" I L 3400 2050 50 
F8 "~END" I L 3400 1950 50 
F9 "~HALT" I L 3400 1850 50 
F10 "~RSTHOLD" I L 3400 1650 50 
F11 "~WAITING" I L 3400 2150 50 
F12 "~RESET" I L 3400 1550 50 
F13 "CLK3" I L 3400 2250 50 
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
	1150 2150 3400 2150
Text HLabel 1150 2150 0    50   Input ~ 0
~WAITING
Wire Wire Line
	3400 1650 2150 1650
Text Label 2150 1650 0    50   ~ 0
~RSTHOLD
Text Label 2150 1750 0    50   ~ 0
CLK4
Text Label 2150 1850 0    50   ~ 0
~HALT
Text Label 2150 1950 0    50   ~ 0
~END
Text Label 2150 2050 0    50   ~ 0
~ENDEXT
Wire Wire Line
	1350 1850 3400 1850
Connection ~ 1350 1850
Wire Wire Line
	1150 1750 3400 1750
Wire Wire Line
	2150 1950 3400 1950
Text Notes 700  1200 0    50   ~ 0
This is the inner sanctum of the control unit, reading, and decoding microprograms\ninto various fields.
Text Notes 700  900  0    100  ~ 20
The Microprogram Sequencer
Text Label 3800 7050 0    50   ~ 0
~CSE
Text Label 2650 6850 0    50   ~ 0
~HALT
Text Label 2850 6950 2    50   ~ 0
~CLK1
Text Label 2850 7050 2    50   ~ 0
~RESET
NoConn ~ 3750 6750
Connection ~ 4550 7450
Connection ~ 4550 7250
Wire Wire Line
	4000 7050 4000 5950
Wire Wire Line
	3750 7050 4000 7050
Text HLabel 2350 6950 0    50   Input ~ 0
CLK1
Text Label 1700 5600 0    50   ~ 0
~CSE
Wire Wire Line
	1650 5600 2100 5600
Wire Wire Line
	1650 5950 1650 5600
Wire Wire Line
	4000 5950 1650 5950
Wire Wire Line
	1150 1850 1350 1850
Text HLabel 2350 7050 0    50   Input ~ 0
~RESET
Wire Wire Line
	2850 6750 2800 6750
Wire Wire Line
	2800 6750 2800 6700
$Comp
L power:+5V #PWR01616
U 1 1 600341A3
P 2800 6700
F 0 "#PWR01616" H 2800 6550 50  0001 C CNN
F 1 "+5V" H 2815 6873 50  0000 C CNN
F 2 "" H 2800 6700 50  0001 C CNN
F 3 "" H 2800 6700 50  0001 C CNN
	1    2800 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DD09005
P 1800 1600
AR Path="/5DD09005" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DD09005" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DD09005" Ref="R1602"  Part="1" 
AR Path="/5F67D4B5/5DD09005" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DD09005" Ref="R?"  Part="1" 
F 0 "R1602" H 1741 1554 50  0000 R CNN
F 1 "4.7kΩ" H 1741 1645 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1800 1600 50  0001 C CNN
F 3 "~" H 1800 1600 50  0001 C CNN
	1    1800 1600
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR01604
U 1 1 5DD4145D
P 1800 1500
F 0 "#PWR01604" H 1800 1350 50  0001 C CNN
F 1 "+5V" H 1650 1550 50  0000 C CNN
F 2 "" H 1800 1500 50  0001 C CNN
F 3 "" H 1800 1500 50  0001 C CNN
	1    1800 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01603
U 1 1 5DD4162D
P 1350 1500
F 0 "#PWR01603" H 1350 1350 50  0001 C CNN
F 1 "+5V" H 1200 1550 50  0000 C CNN
F 2 "" H 1350 1500 50  0001 C CNN
F 3 "" H 1350 1500 50  0001 C CNN
	1    1350 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DD0C349
P 1350 1600
AR Path="/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DD0C349" Ref="R1601"  Part="1" 
AR Path="/5F67D4B5/5DD0C349" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5DD0C349" Ref="R?"  Part="1" 
F 0 "R1601" H 1291 1554 50  0000 R CNN
F 1 "4.7kΩ" H 1291 1645 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1350 1600 50  0001 C CNN
F 3 "~" H 1350 1600 50  0001 C CNN
	1    1350 1600
	-1   0    0    1   
$EndComp
Text Label 2150 2150 0    50   ~ 0
~WAITING
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
Text Label 9650 6000 2    50   ~ 0
RADDR0
Text Label 9650 5800 2    50   ~ 0
RADDR1
Text Label 9650 5900 2    50   ~ 0
RADDR2
Text Label 9650 5700 2    50   ~ 0
RADDR3
Text Label 9650 5600 2    50   ~ 0
RADDR4
Text Label 9650 5500 2    50   ~ 0
WADDR0
Text Label 9650 5400 2    50   ~ 0
WADDR1
Text Label 9650 5300 2    50   ~ 0
WADDR2
Text Label 9650 5050 2    50   ~ 0
WADDR3
Text Label 9650 4850 2    50   ~ 0
WADDR4
Text Label 9650 4950 2    50   ~ 0
COND0
Text Label 9650 4750 2    50   ~ 0
COND1
Text Label 9650 4650 2    50   ~ 0
COND2
Text Label 9650 4450 2    50   ~ 0
COND3
Text Label 9650 4550 2    50   ~ 0
COND4
Text Label 9650 4350 2    50   ~ 0
ACTION0
Wire Wire Line
	9350 6000 9650 6000
Wire Wire Line
	9350 5800 9650 5800
Wire Wire Line
	9350 5900 9650 5900
Wire Wire Line
	9350 5700 9650 5700
Wire Wire Line
	9350 5600 9650 5600
Wire Wire Line
	9350 5500 9650 5500
Wire Wire Line
	9350 5400 9650 5400
Wire Wire Line
	9350 5300 9650 5300
Wire Wire Line
	9350 5050 9650 5050
Wire Wire Line
	9350 4850 9650 4850
Wire Wire Line
	9350 4950 9650 4950
Wire Wire Line
	9350 4750 9650 4750
Wire Wire Line
	9350 4650 9650 4650
Wire Wire Line
	9350 4450 9650 4450
Wire Wire Line
	9350 4550 9650 4550
Wire Wire Line
	9350 4350 9650 4350
$Comp
L power:GND #PWR?
U 1 1 622D66E4
P 8900 6050
AR Path="/61F95ACC/622D66E4" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/622D66E4" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/622D66E4" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 8900 5800 50  0001 C CNN
F 1 "GND" H 8750 6050 50  0000 C CNN
F 2 "" H 8900 6050 50  0001 C CNN
F 3 "" H 8900 6050 50  0001 C CNN
	1    8900 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 6050 8900 6000
Wire Wire Line
	8950 6000 8900 6000
$Comp
L Device:R_Network08 RN?
U 1 1 622D66EA
P 9150 5600
AR Path="/61F95ACC/6888FBA2/622D66EA" Ref="RN?"  Part="1" 
AR Path="/61F95ACC/622D66EA" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/622D66EA" Ref="RN1601"  Part="1" 
F 0 "RN1601" V 9450 5750 50  0000 L CNN
F 1 "10kΩ" V 9350 5750 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9625 5600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9150 5600 50  0001 C CNN
	1    9150 5600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 623B3808
P 8900 5100
AR Path="/61F95ACC/623B3808" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/623B3808" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/623B3808" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 8900 4850 50  0001 C CNN
F 1 "GND" H 8750 5100 50  0000 C CNN
F 2 "" H 8900 5100 50  0001 C CNN
F 3 "" H 8900 5100 50  0001 C CNN
	1    8900 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5100 8900 5050
Wire Wire Line
	8950 5050 8900 5050
$Comp
L Device:R_Network08 RN?
U 1 1 623B3810
P 9150 4650
AR Path="/61F95ACC/6888FBA2/623B3810" Ref="RN?"  Part="1" 
AR Path="/61F95ACC/623B3810" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/623B3810" Ref="RN1602"  Part="1" 
F 0 "RN1602" V 9450 4800 50  0000 L CNN
F 1 "10kΩ" V 9350 4800 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9625 4650 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9150 4650 50  0001 C CNN
	1    9150 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3400 2250 1150 2250
Text HLabel 1150 2250 0    50   Input ~ 0
CLK3
Wire Wire Line
	3400 1550 2150 1550
Text Label 2150 1550 0    50   ~ 0
~RESET
Wire Wire Line
	9200 3150 9750 3150
Wire Wire Line
	9200 3250 9750 3250
Wire Wire Line
	9200 3350 9750 3350
Text Label 9750 3150 2    50   ~ 0
ACTION3
Text Label 9750 3250 2    50   ~ 0
ACTION2
Text Label 9750 3350 2    50   ~ 0
ACTION1
$Comp
L power:GND #PWR?
U 1 1 6273089B
P 8850 3400
AR Path="/61F95ACC/6273089B" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6273089B" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/6273089B" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 8850 3150 50  0001 C CNN
F 1 "GND" H 8700 3400 50  0000 C CNN
F 2 "" H 8850 3400 50  0001 C CNN
F 3 "" H 8850 3400 50  0001 C CNN
	1    8850 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 628113A2
P 9100 3150
AR Path="/628113A2" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/628113A2" Ref="R?"  Part="1" 
AR Path="/5D54E677/628113A2" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/628113A2" Ref="R?"  Part="1" 
AR Path="/5DEAC282/628113A2" Ref="R1603"  Part="1" 
AR Path="/5F67D4B5/628113A2" Ref="R?"  Part="1" 
AR Path="/5D46B22D/628113A2" Ref="R?"  Part="1" 
F 0 "R1603" V 9050 3350 50  0000 C CNN
F 1 "10kΩ" V 9000 2950 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9100 3150 50  0001 C CNN
F 3 "~" H 9100 3150 50  0001 C CNN
	1    9100 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 62812B62
P 9100 3250
AR Path="/62812B62" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/62812B62" Ref="R?"  Part="1" 
AR Path="/5D54E677/62812B62" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/62812B62" Ref="R?"  Part="1" 
AR Path="/5DEAC282/62812B62" Ref="R1604"  Part="1" 
AR Path="/5F67D4B5/62812B62" Ref="R?"  Part="1" 
AR Path="/5D46B22D/62812B62" Ref="R?"  Part="1" 
F 0 "R1604" V 9050 3450 50  0000 C CNN
F 1 "4.7kΩ" V 9000 3050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9100 3250 50  0001 C CNN
F 3 "~" H 9100 3250 50  0001 C CNN
	1    9100 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 62812DC9
P 9100 3350
AR Path="/62812DC9" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/62812DC9" Ref="R?"  Part="1" 
AR Path="/5D54E677/62812DC9" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/62812DC9" Ref="R?"  Part="1" 
AR Path="/5DEAC282/62812DC9" Ref="R1605"  Part="1" 
AR Path="/5F67D4B5/62812DC9" Ref="R?"  Part="1" 
AR Path="/5D46B22D/62812DC9" Ref="R?"  Part="1" 
F 0 "R1605" V 9150 3150 50  0000 C CNN
F 1 "4.7kΩ" V 9000 3150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9100 3350 50  0001 C CNN
F 3 "~" H 9100 3350 50  0001 C CNN
	1    9100 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9000 3150 8850 3150
Wire Wire Line
	8850 3150 8850 3250
Wire Wire Line
	9000 3250 8850 3250
Connection ~ 8850 3250
Wire Wire Line
	8850 3250 8850 3350
Wire Wire Line
	9000 3350 8850 3350
Connection ~ 8850 3350
Wire Wire Line
	8850 3350 8850 3400
Text Label 9650 4150 2    50   ~ 0
~MEM
Text Label 9650 4050 2    50   ~ 0
~IO
Text Label 9650 3950 2    50   ~ 0
~REN
Text Label 9650 3850 2    50   ~ 0
~WEN
Text Label 9650 3750 2    50   ~ 0
~END
Wire Wire Line
	9350 3850 9650 3850
Wire Wire Line
	9350 3750 9650 3750
Wire Wire Line
	9350 3950 9650 3950
Wire Wire Line
	9350 4050 9650 4050
Wire Wire Line
	9350 4150 9650 4150
$Comp
L Device:R_Network05 RN1603
U 1 1 62C5EA16
P 9150 3950
F 0 "RN1603" V 9350 4150 50  0000 L CNN
F 1 "10kΩ" V 9250 4150 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP6" V 9525 3950 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9150 3950 50  0001 C CNN
	1    9150 3950
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR0151
U 1 1 62C5EA1C
P 8850 3700
F 0 "#PWR0151" H 8850 3550 50  0001 C CNN
F 1 "+5V" H 8700 3800 50  0000 C CNN
F 2 "" H 8850 3700 50  0001 C CNN
F 3 "" H 8850 3700 50  0001 C CNN
	1    8850 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8850 3750 8950 3750
Wire Wire Line
	8850 3700 8850 3750
$Comp
L power:GND #PWR01608
U 1 1 5EF2D6C0
P 5450 2300
F 0 "#PWR01608" H 5450 2050 50  0001 C CNN
F 1 "GND" H 5455 2127 50  0000 C CNN
F 2 "" H 5450 2300 50  0001 C CNN
F 3 "" H 5450 2300 50  0001 C CNN
	1    5450 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01609
U 1 1 5EF2D562
P 5750 2300
F 0 "#PWR01609" H 5750 2050 50  0001 C CNN
F 1 "GND" H 5755 2127 50  0000 C CNN
F 2 "" H 5750 2300 50  0001 C CNN
F 3 "" H 5750 2300 50  0001 C CNN
	1    5750 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01610
U 1 1 5EF1D08A
P 6050 2300
F 0 "#PWR01610" H 6050 2050 50  0001 C CNN
F 1 "GND" H 6055 2127 50  0000 C CNN
F 2 "" H 6050 2300 50  0001 C CNN
F 3 "" H 6050 2300 50  0001 C CNN
	1    6050 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2250 6050 2300
Wire Wire Line
	5450 2000 5450 2300
$Comp
L power:+5V #PWR01605
U 1 1 5EF1BFFC
P 5450 1700
F 0 "#PWR01605" H 5450 1550 50  0001 C CNN
F 1 "+5V" H 5350 1700 50  0000 C CNN
F 2 "" H 5450 1700 50  0001 C CNN
F 3 "" H 5450 1700 50  0001 C CNN
	1    5450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1950 6050 1700
Wire Wire Line
	5750 2100 5750 2300
Wire Wire Line
	5950 1950 5950 1850
Wire Wire Line
	5850 1950 5950 1950
Wire Wire Line
	6150 2100 6250 2100
$Comp
L power:+5V #PWR01607
U 1 1 5EF1C98A
P 6050 1700
F 0 "#PWR01607" H 6050 1550 50  0001 C CNN
F 1 "+5V" H 5950 1700 50  0000 C CNN
F 2 "" H 6050 1700 50  0001 C CNN
F 3 "" H 6050 1700 50  0001 C CNN
	1    6050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2100 6250 1950
$Comp
L power:+5V #PWR01606
U 1 1 5EF1C719
P 5750 1700
F 0 "#PWR01606" H 5750 1550 50  0001 C CNN
F 1 "+5V" H 5650 1700 50  0000 C CNN
F 2 "" H 5750 1700 50  0001 C CNN
F 3 "" H 5750 1700 50  0001 C CNN
	1    5750 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1800 5750 1700
Wire Wire Line
	5650 1850 5650 1750
Wire Wire Line
	5550 1850 5650 1850
Text Notes 5600 2100 0    98   ~ 20
*
$Comp
L alexios:SolderJumper_3_Bridged23 JP1603
U 1 1 5F129456
P 6050 2100
F 0 "JP1603" V 6200 2150 50  0000 L CNN
F 1 "SolderJumper_3_Bridged23" H 6050 2210 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged23_RoundedPad1.0x1.5mm" H 6050 2100 50  0001 C CNN
F 3 "~" H 6050 2100 50  0001 C CNN
	1    6050 2100
	0    -1   1    0   
$EndComp
$Comp
L alexios:SolderJumper_3_Bridged12 JP1602
U 1 1 5F12A1A9
P 5750 1950
F 0 "JP1602" V 6050 2000 50  0000 L CNN
F 1 "SolderJumper_3_Bridged12" H 5750 2060 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 5750 1950 50  0001 C CNN
F 3 "~" H 5750 1950 50  0001 C CNN
	1    5750 1950
	0    -1   1    0   
$EndComp
$Comp
L alexios:SolderJumper_3_Bridged23 JP1601
U 1 1 5F125CF7
P 5450 1850
F 0 "JP1601" V 5850 1900 50  0000 L CNN
F 1 "SolderJumper_3_Bridged23" H 5450 1960 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged23_RoundedPad1.0x1.5mm" H 5450 1850 50  0001 C CNN
F 3 "~" H 5450 1850 50  0001 C CNN
	1    5450 1850
	0    -1   1    0   
$EndComp
Wire Wire Line
	2650 6850 2850 6850
Wire Wire Line
	2350 6950 2850 6950
Wire Wire Line
	2350 7050 2850 7050
$Comp
L alexios:74HC74 U1603
U 1 1 609E7601
P 3300 6900
F 0 "U1603" H 3300 7317 50  0000 C CNN
F 1 "74HC74" H 3300 7226 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 3250 7050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 3250 7050 50  0001 C CNN
	1    3300 6900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U1603
U 2 1 609E8133
P 5250 6700
F 0 "U1603" H 5250 7117 50  0000 C CNN
F 1 "74HC74" H 5250 7026 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5200 6850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 5200 6850 50  0001 C CNN
	2    5250 6700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U1603
U 3 1 609EA091
P 4900 7350
F 0 "U1603" H 5080 7396 50  0000 L CNN
F 1 "74HC74" H 5080 7305 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 4850 7500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 4850 7500 50  0001 C CNN
	3    4900 7350
	1    0    0    -1  
$EndComp
NoConn ~ 5700 6550
NoConn ~ 5700 6850
Wire Wire Line
	4800 6850 4750 6850
Wire Wire Line
	4750 6850 4750 6750
Wire Wire Line
	4800 6550 4750 6550
Wire Wire Line
	4800 6650 4750 6650
Connection ~ 4750 6650
Wire Wire Line
	4750 6650 4750 6550
Wire Wire Line
	4800 6750 4750 6750
Connection ~ 4750 6750
Wire Wire Line
	4750 6750 4750 6650
Wire Wire Line
	5200 1250 7750 1250
Wire Wire Line
	5200 1350 7750 1350
Wire Wire Line
	5200 1450 7750 1450
Wire Wire Line
	5200 1550 7750 1550
$Comp
L Device:R_Small R?
U 1 1 612109FF
P 6600 2200
AR Path="/612109FF" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/612109FF" Ref="R?"  Part="1" 
AR Path="/5D54E677/612109FF" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/612109FF" Ref="R?"  Part="1" 
AR Path="/5DEAC282/612109FF" Ref="R1606"  Part="1" 
AR Path="/5F67D4B5/612109FF" Ref="R?"  Part="1" 
AR Path="/5D46B22D/612109FF" Ref="R?"  Part="1" 
F 0 "R1606" H 6541 2154 50  0000 R CNN
F 1 "4.7kΩ" H 6541 2245 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6600 2200 50  0001 C CNN
F 3 "~" H 6600 2200 50  0001 C CNN
	1    6600 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 612A764A
P 6600 2300
F 0 "#PWR0102" H 6600 2050 50  0001 C CNN
F 1 "GND" H 6605 2127 50  0000 C CNN
F 2 "" H 6600 2300 50  0001 C CNN
F 3 "" H 6600 2300 50  0001 C CNN
	1    6600 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 612A8810
P 6950 2200
AR Path="/612A8810" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/612A8810" Ref="R?"  Part="1" 
AR Path="/5D54E677/612A8810" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/612A8810" Ref="R?"  Part="1" 
AR Path="/5DEAC282/612A8810" Ref="R1607"  Part="1" 
AR Path="/5F67D4B5/612A8810" Ref="R?"  Part="1" 
AR Path="/5D46B22D/612A8810" Ref="R?"  Part="1" 
F 0 "R1607" H 6891 2154 50  0000 R CNN
F 1 "4.7kΩ" H 6891 2245 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6950 2200 50  0001 C CNN
F 3 "~" H 6950 2200 50  0001 C CNN
	1    6950 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0186
U 1 1 612A8816
P 6950 2300
F 0 "#PWR0186" H 6950 2050 50  0001 C CNN
F 1 "GND" H 6955 2127 50  0000 C CNN
F 2 "" H 6950 2300 50  0001 C CNN
F 3 "" H 6950 2300 50  0001 C CNN
	1    6950 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 612F1730
P 7300 2200
AR Path="/612F1730" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/612F1730" Ref="R?"  Part="1" 
AR Path="/5D54E677/612F1730" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/612F1730" Ref="R?"  Part="1" 
AR Path="/5DEAC282/612F1730" Ref="R1608"  Part="1" 
AR Path="/5F67D4B5/612F1730" Ref="R?"  Part="1" 
AR Path="/5D46B22D/612F1730" Ref="R?"  Part="1" 
F 0 "R1608" H 7241 2154 50  0000 R CNN
F 1 "4.7kΩ" H 7241 2245 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7300 2200 50  0001 C CNN
F 3 "~" H 7300 2200 50  0001 C CNN
	1    7300 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0187
U 1 1 612F1736
P 7300 2300
F 0 "#PWR0187" H 7300 2050 50  0001 C CNN
F 1 "GND" H 7305 2127 50  0000 C CNN
F 2 "" H 7300 2300 50  0001 C CNN
F 3 "" H 7300 2300 50  0001 C CNN
	1    7300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2100 6600 1950
Wire Wire Line
	6950 2100 6950 1850
Wire Wire Line
	7300 2100 7300 1750
Wire Notes Line
	6200 1650 6200 2700
Wire Notes Line
	6200 2700 7400 2700
Wire Notes Line
	7400 2700 7400 1650
Wire Notes Line
	7400 1650 6200 1650
Text Notes 6250 2650 0    50   ~ 0
Optional, for safety.
Connection ~ 7300 1750
Wire Wire Line
	7300 1750 7750 1750
Wire Wire Line
	5650 1750 7300 1750
Connection ~ 6950 1850
Wire Wire Line
	6950 1850 7750 1850
Wire Wire Line
	5950 1850 6950 1850
Connection ~ 6600 1950
Wire Wire Line
	6600 1950 7750 1950
Wire Wire Line
	6250 1950 6600 1950
Wire Wire Line
	1150 2050 1800 2050
Wire Wire Line
	1800 2050 3400 2050
Connection ~ 1800 2050
Wire Wire Line
	1800 1700 1800 2050
Connection ~ 4750 6550
Wire Wire Line
	4750 6550 4750 6400
$Comp
L power:+5V #PWR0164
U 1 1 60A2242D
P 4750 6400
F 0 "#PWR0164" H 4750 6250 50  0001 C CNN
F 1 "+5V" H 4765 6573 50  0000 C CNN
F 2 "" H 4750 6400 50  0001 C CNN
F 3 "" H 4750 6400 50  0001 C CNN
	1    4750 6400
	1    0    0    -1  
$EndComp
Entry Wire Line
	1500 4000 1600 4100
Entry Wire Line
	1500 4100 1600 4200
Entry Wire Line
	1500 4200 1600 4300
Entry Wire Line
	1500 4300 1600 4400
Entry Wire Line
	1500 4400 1600 4500
Entry Wire Line
	1500 4500 1600 4600
Entry Wire Line
	1500 4600 1600 4700
Entry Wire Line
	1500 4700 1600 4800
Entry Wire Line
	1500 4800 1600 4900
Entry Bus Bus
	1400 3500 1500 3600
Text HLabel 1000 3500 0    50   Input ~ 0
IR[6..15]
Text Label 1050 3500 0    50   ~ 0
IR[6..15]
Wire Bus Line
	1400 3500 1000 3500
$Comp
L alexios:16V8 U?
U 1 1 6154FCBB
P 7250 5150
AR Path="/6154FCBB" Ref="U?"  Part="1" 
AR Path="/5DEAC282/6154FCBB" Ref="U1611"  Part="1" 
F 0 "U1611" H 7250 5900 50  0000 C CNN
F 1 "16V8" H 7250 5800 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7250 5150 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 7250 5150 50  0001 C CNN
F 4 "CUWDEC00" V 7250 5150 50  0000 C CNB "Signature"
F 5 "ctl-waddr-decode.jed" H 7250 4500 50  0000 C CNN "Image Filename"
	1    7250 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 4900 6450 4900
Wire Wire Line
	6800 5000 6450 5000
Wire Wire Line
	6800 5100 6450 5100
Wire Wire Line
	6800 4700 6450 4700
Wire Wire Line
	6800 4800 6450 4800
Text Label 6450 5600 0    50   ~ 0
CLK4
Text Label 6450 4900 0    50   ~ 0
WADDR2
Text Label 6450 5000 0    50   ~ 0
WADDR1
Text Label 6450 5100 0    50   ~ 0
WADDR0
Text Label 6450 4700 0    50   ~ 0
WADDR4
Text Label 6450 4800 0    50   ~ 0
WADDR3
Text Label 8150 4700 2    50   ~ 0
~WRITE-DR
Text Label 8150 4900 2    50   ~ 0
~WRITE-PC
Text Label 8150 4800 2    50   ~ 0
~WRITE-FL
Text Label 8150 5000 2    50   ~ 0
~WRITE-IR
NoConn ~ 6800 5200
NoConn ~ 6800 5300
NoConn ~ 6800 5400
NoConn ~ 6800 5500
$Comp
L alexios:16V8 U?
U 2 1 6154FCED
P 10550 3200
AR Path="/6154FCED" Ref="U?"  Part="2" 
AR Path="/5DEAC282/6154FCED" Ref="U1610"  Part="2" 
F 0 "U1610" H 10730 3246 50  0000 L CNN
F 1 "16V8" H 10730 3155 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10550 3200 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 10550 3200 50  0001 C CNN
F 4 "CURDEC00" H 10730 3155 50  0001 L CNB "Signature"
F 5 "ctl-raddr-decode.jed" H 10730 3109 50  0001 L CNN "Image Filename"
	2    10550 3200
	1    0    0    -1  
$EndComp
$Comp
L alexios:16V8 U?
U 2 1 6154FCF5
P 10600 4400
AR Path="/6154FCF5" Ref="U?"  Part="2" 
AR Path="/5DEAC282/6154FCF5" Ref="U1611"  Part="2" 
F 0 "U1611" H 10780 4446 50  0000 L CNN
F 1 "16V8" H 10780 4355 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10600 4400 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 10600 4400 50  0001 C CNN
F 4 "CUWDEC00" V 11000 4350 50  0001 C CNB "Signature"
F 5 "ctl-waddr-decode.jed" H 10600 3750 50  0001 C CNN "Image Filename"
	2    10600 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6154FCFB
P 10250 4300
AR Path="/5CE16E65/6154FCFB" Ref="#PWR?"  Part="1" 
AR Path="/6154FCFB" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/6154FCFB" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/6154FCFB" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/6154FCFB" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/6154FCFB" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/6154FCFB" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/6154FCFB" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 10250 4150 50  0001 C CNN
F 1 "+5V" H 10265 4473 50  0000 C CNN
F 2 "" H 10250 4300 50  0001 C CNN
F 3 "" H 10250 4300 50  0001 C CNN
	1    10250 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6154FD01
P 10250 4500
AR Path="/5CE16E65/6154FD01" Ref="#PWR?"  Part="1" 
AR Path="/6154FD01" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/6154FD01" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/6154FD01" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/6154FD01" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/6154FD01" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/6154FD01" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/6154FD01" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 10250 4250 50  0001 C CNN
F 1 "GND" H 10255 4327 50  0000 C CNN
F 2 "" H 10250 4500 50  0001 C CNN
F 3 "" H 10250 4500 50  0001 C CNN
	1    10250 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6154FD07
P 10250 4400
AR Path="/5CC0D65F/6154FD07" Ref="C?"  Part="1" 
AR Path="/5CE16E65/6154FD07" Ref="C?"  Part="1" 
AR Path="/6154FD07" Ref="C?"  Part="1" 
AR Path="/5D54E677/6154FD07" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/6154FD07" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/6154FD07" Ref="C?"  Part="1" 
AR Path="/5D892D5E/6154FD07" Ref="C?"  Part="1" 
AR Path="/5D9672D4/6154FD07" Ref="C?"  Part="1" 
AR Path="/5DEAC282/6154FD07" Ref="C1611"  Part="1" 
F 0 "C1611" H 10159 4446 50  0000 R CNN
F 1 "100nF" H 10159 4355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10250 4400 50  0001 C CNN
F 3 "~" H 10250 4400 50  0001 C CNN
	1    10250 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6154FD0D
P 10200 3100
AR Path="/5CE16E65/6154FD0D" Ref="#PWR?"  Part="1" 
AR Path="/6154FD0D" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/6154FD0D" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/6154FD0D" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/6154FD0D" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/6154FD0D" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/6154FD0D" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/6154FD0D" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 10200 2950 50  0001 C CNN
F 1 "+5V" H 10215 3273 50  0000 C CNN
F 2 "" H 10200 3100 50  0001 C CNN
F 3 "" H 10200 3100 50  0001 C CNN
	1    10200 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6154FD13
P 10200 3300
AR Path="/5CE16E65/6154FD13" Ref="#PWR?"  Part="1" 
AR Path="/6154FD13" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/6154FD13" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/6154FD13" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/6154FD13" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/6154FD13" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/6154FD13" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/6154FD13" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 10200 3050 50  0001 C CNN
F 1 "GND" H 10205 3127 50  0000 C CNN
F 2 "" H 10200 3300 50  0001 C CNN
F 3 "" H 10200 3300 50  0001 C CNN
	1    10200 3300
	1    0    0    -1  
$EndComp
Connection ~ 10200 3300
Connection ~ 10200 3100
Connection ~ 10250 4300
Connection ~ 10250 4500
NoConn ~ 7700 5400
NoConn ~ 7700 5100
NoConn ~ 7700 5200
NoConn ~ 7700 5300
$Comp
L Device:C_Small C?
U 1 1 6154FD33
P 10200 3200
AR Path="/5CC0D65F/6154FD33" Ref="C?"  Part="1" 
AR Path="/5CE16E65/6154FD33" Ref="C?"  Part="1" 
AR Path="/6154FD33" Ref="C?"  Part="1" 
AR Path="/5D54E677/6154FD33" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/6154FD33" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/6154FD33" Ref="C?"  Part="1" 
AR Path="/5D892D5E/6154FD33" Ref="C?"  Part="1" 
AR Path="/5D9672D4/6154FD33" Ref="C?"  Part="1" 
AR Path="/5DEAC282/6154FD33" Ref="C1610"  Part="1" 
F 0 "C1610" H 10109 3246 50  0000 R CNN
F 1 "100nF" H 10109 3155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10200 3200 50  0001 C CNN
F 3 "~" H 10200 3200 50  0001 C CNN
	1    10200 3200
	1    0    0    -1  
$EndComp
$Comp
L alexios:16V8 U?
U 1 1 6154FD3B
P 7250 3650
AR Path="/6154FD3B" Ref="U?"  Part="1" 
AR Path="/5DEAC282/6154FD3B" Ref="U1610"  Part="1" 
F 0 "U1610" H 7250 4400 50  0000 C CNN
F 1 "16V8" H 7250 4300 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7250 3650 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 7250 3650 50  0001 C CNN
F 4 "CURDEC00" V 7250 3650 50  0000 C CNB "Signature"
F 5 "ctl-raddr-decode.jed" H 7250 3000 50  0000 C CNN "Image Filename"
	1    7250 3650
	1    0    0    -1  
$EndComp
Text Notes 8150 3000 2    100  ~ 20
Decoders
Text HLabel 8150 3200 2    50   Output ~ 0
~READ-DR
Text Label 8100 3200 2    50   ~ 0
~READ-DR
Text Label 8100 3300 2    50   ~ 0
~READ-PC
Text Label 8100 3400 2    50   ~ 0
~READ-FL
Text Label 8100 3500 2    50   ~ 0
~READ-AGL
Text Label 8100 3600 2    50   ~ 0
~READ-CS
Text Label 8100 3900 2    50   ~ 0
~IDXEN
Text Label 8100 3800 2    50   ~ 0
IDX0
Text Label 8100 3700 2    50   ~ 0
IDX1
Wire Wire Line
	7700 3300 8150 3300
Wire Wire Line
	7700 3400 8150 3400
Wire Wire Line
	7700 3500 8150 3500
Wire Wire Line
	7700 3600 8150 3600
Wire Wire Line
	7700 3700 8150 3700
Wire Wire Line
	7700 3800 8150 3800
Wire Wire Line
	7700 3900 8150 3900
Wire Wire Line
	7700 3200 8150 3200
Text HLabel 8150 3300 2    50   Output ~ 0
~READ-PC
Text HLabel 8150 3400 2    50   Output ~ 0
~READ-FL
Text HLabel 8150 3500 2    50   Output ~ 0
~READ-AGL
Text HLabel 8150 3600 2    50   Output ~ 0
~READ-CS
Text HLabel 8150 3700 2    50   Output ~ 0
IDX1
Text HLabel 8150 3800 2    50   Output ~ 0
IDX0
Text HLabel 8150 3900 2    50   Output ~ 0
~IDXEN
Wire Wire Line
	6800 5600 6450 5600
Text HLabel 6400 3200 0    50   Input ~ 0
T34
Wire Wire Line
	6800 4100 6450 4100
Text Label 6450 4100 0    50   ~ 0
IR9
Text Label 6450 3500 0    50   ~ 0
IR8
Text Label 6450 3400 0    50   ~ 0
IR7
Text Label 6450 3300 0    50   ~ 0
IR6
Wire Wire Line
	6800 3500 6450 3500
Wire Wire Line
	6800 3400 6450 3400
Wire Wire Line
	6800 3300 6450 3300
Text Label 6450 3200 0    50   ~ 0
T34
Wire Wire Line
	6800 3200 6400 3200
Text Label 6450 3600 0    50   ~ 0
RADDR4
Text Label 6450 3700 0    50   ~ 0
RADDR3
Text Label 6450 3900 0    50   ~ 0
RADDR2
Text Label 6450 3800 0    50   ~ 0
RADDR1
Text Label 6450 4000 0    50   ~ 0
RADDR0
Wire Wire Line
	6800 3600 6450 3600
Wire Wire Line
	6800 3700 6450 3700
Wire Wire Line
	6800 3900 6450 3900
Wire Wire Line
	6800 3800 6450 3800
Wire Wire Line
	6800 4000 6450 4000
Text Notes 9750 2950 2    100  ~ 20
Idling on Halt
Wire Wire Line
	7700 4700 8200 4700
Wire Wire Line
	7700 4800 8200 4800
Wire Wire Line
	7700 4900 8200 4900
Wire Wire Line
	7700 5000 8200 5000
Text HLabel 8200 4700 2    50   Output ~ 0
~WRITE-DR
Text HLabel 8200 4900 2    50   Output ~ 0
~WRITE-PC
Text HLabel 8200 4800 2    50   Output ~ 0
~WRITE-FL
Text HLabel 8200 5000 2    50   Output ~ 0
~WRITE-IR
Wire Bus Line
	3800 2750 3800 3500
Wire Bus Line
	1600 2750 1600 3500
Wire Bus Line
	1500 3600 1500 4800
Wire Bus Line
	5100 1350 5100 2550
$EndSCHEMATC
