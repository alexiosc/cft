EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 19 19
Title "ALU Decoding & Control"
Date "2019-11-17"
Rev "2022"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 "alu_decoder.v"
$EndDescr
Text HLabel 1650 4050 0    50   Input ~ 0
ACTION[0..4]
Text Label 2250 3550 2    50   ~ 0
T34
Text HLabel 1650 3550 0    50   Input ~ 0
T34
Text Label 2250 3950 2    50   ~ 0
WADDR[0..4]
Text HLabel 1650 3950 0    50   Input ~ 0
WADDR[0..4]
Wire Bus Line
	2250 3950 1650 3950
Wire Bus Line
	2250 4050 1650 4050
Text HLabel 1650 3850 0    50   Input ~ 0
RADDR[0..4]
Text Label 2250 3850 2    50   ~ 0
RADDR[0..4]
Wire Bus Line
	1650 3850 2250 3850
Wire Wire Line
	1650 3550 2250 3550
Text Label 2250 3450 2    50   ~ 0
CLK4
Text HLabel 1650 3450 0    50   Input ~ 0
CLK4
Wire Wire Line
	1650 3450 2250 3450
$Comp
L alexios:ATF16V8B U202
U 2 1 63A04AA0
P 8450 3300
AR Path="/63A04AA0" Ref="U202"  Part="2" 
AR Path="/5E1C970B/63A04AA0" Ref="U202"  Part="2" 
F 0 "U202" H 8630 3346 50  0000 L CNN
F 1 "ATF16V8B" H 8630 3255 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8450 3300 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 8450 3300 50  0001 C CNN
F 4 "ALWDEC00" V 8450 3300 50  0001 C CNB "Signature"
F 5 "alu-waddr-decode.jed" H 8450 2650 50  0001 C CNN "Image Filename"
	2    8450 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63A07EFB
P 8100 3300
AR Path="/5CC0D65F/63A07EFB" Ref="C?"  Part="1" 
AR Path="/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5F597FD4/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5DC89E19/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5D121AA3/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5E1C970B/63A07EFB" Ref="C202"  Part="1" 
F 0 "C202" H 8009 3346 50  0000 R CNN
F 1 "100nF" H 8009 3255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8100 3300 50  0001 C CNN
F 3 "~" H 8100 3300 50  0001 C CNN
	1    8100 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63A07F01
P 8100 3400
AR Path="/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A07F01" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 8100 3150 50  0001 C CNN
F 1 "GND" H 8105 3227 50  0000 C CNN
F 2 "" H 8100 3400 50  0001 C CNN
F 3 "" H 8100 3400 50  0001 C CNN
	1    8100 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63A07F07
P 8100 3200
AR Path="/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A07F07" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 8100 3050 50  0001 C CNN
F 1 "+5V" H 8115 3373 50  0000 C CNN
F 2 "" H 8100 3200 50  0001 C CNN
F 3 "" H 8100 3200 50  0001 C CNN
	1    8100 3200
	1    0    0    -1  
$EndComp
Connection ~ 8100 3200
Connection ~ 8100 3400
Wire Wire Line
	5400 3200 5100 3200
Wire Wire Line
	5400 3300 5100 3300
Wire Wire Line
	5400 3400 5100 3400
Wire Wire Line
	5400 3500 5100 3500
Wire Wire Line
	5400 3600 5100 3600
Wire Wire Line
	5400 3700 5100 3700
Text Label 5100 3200 0    50   ~ 0
CLK4
Text Label 5100 3300 0    50   ~ 0
WADDR0
Text Label 5100 3400 0    50   ~ 0
WADDR1
Text Label 5100 3500 0    50   ~ 0
WADDR2
Text Label 5100 3600 0    50   ~ 0
WADDR3
Text Label 5100 3700 0    50   ~ 0
WADDR4
NoConn ~ 5400 3800
NoConn ~ 5400 3900
NoConn ~ 5400 4000
NoConn ~ 5400 4100
NoConn ~ 6300 3200
$Comp
L alexios:ATF16V8B U201
U 1 1 63A46035
P 5850 1900
AR Path="/63A46035" Ref="U201"  Part="1" 
AR Path="/5E1C970B/63A46035" Ref="U201"  Part="1" 
F 0 "U201" H 5850 2650 50  0000 C CNN
F 1 "ATF16V8B" H 5850 2550 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5850 1900 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 5850 1900 50  0001 C CNN
F 4 "ALRDEC00" V 5850 1900 50  0000 C CNB "Signature"
F 5 "alu-raddr-decode.jed" H 5850 1250 50  0000 C CNN "Image Filename"
	1    5850 1900
	1    0    0    -1  
$EndComp
$Comp
L alexios:ATF16V8B U201
U 2 1 63A4603D
P 8450 1550
AR Path="/63A4603D" Ref="U201"  Part="2" 
AR Path="/5E1C970B/63A4603D" Ref="U201"  Part="2" 
F 0 "U201" H 8630 1596 50  0000 L CNN
F 1 "ATF16V8B" H 8630 1505 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8450 1550 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 8450 1550 50  0001 C CNN
F 4 "ALWDEC00" V 8450 1550 50  0001 C CNB "Signature"
F 5 "alu-waddr-decode.jed" H 8450 900 50  0001 C CNN "Image Filename"
	2    8450 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63A46043
P 8100 1550
AR Path="/5CC0D65F/63A46043" Ref="C?"  Part="1" 
AR Path="/63A46043" Ref="C?"  Part="1" 
AR Path="/5F597FD4/63A46043" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A46043" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A46043" Ref="C?"  Part="1" 
AR Path="/5DC89E19/63A46043" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A46043" Ref="C?"  Part="1" 
AR Path="/5D121AA3/63A46043" Ref="C?"  Part="1" 
AR Path="/5E1C970B/63A46043" Ref="C201"  Part="1" 
F 0 "C201" H 8009 1596 50  0000 R CNN
F 1 "100nF" H 8009 1505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8100 1550 50  0001 C CNN
F 3 "~" H 8100 1550 50  0001 C CNN
	1    8100 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63A46049
P 8100 1650
AR Path="/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A46049" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 8100 1400 50  0001 C CNN
F 1 "GND" H 8105 1477 50  0000 C CNN
F 2 "" H 8100 1650 50  0001 C CNN
F 3 "" H 8100 1650 50  0001 C CNN
	1    8100 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63A4604F
P 8100 1450
AR Path="/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A4604F" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 8100 1300 50  0001 C CNN
F 1 "+5V" H 8115 1623 50  0000 C CNN
F 2 "" H 8100 1450 50  0001 C CNN
F 3 "" H 8100 1450 50  0001 C CNN
	1    8100 1450
	1    0    0    -1  
$EndComp
Connection ~ 8100 1450
Connection ~ 8100 1650
Wire Wire Line
	5400 1450 5100 1450
Wire Wire Line
	5400 1550 5100 1550
Wire Wire Line
	5400 1650 5100 1650
Wire Wire Line
	5400 1750 5100 1750
Wire Wire Line
	5400 1850 5100 1850
Wire Wire Line
	5400 1950 5100 1950
Text Label 5100 1450 0    50   ~ 0
T34
NoConn ~ 5400 2050
NoConn ~ 5400 2150
NoConn ~ 5400 2250
NoConn ~ 5400 2350
Text Label 6850 2150 2    50   ~ 0
~ALU-OP
Text Label 6850 2050 2    50   ~ 0
ACP
Text Label 6850 1950 2    50   ~ 0
~READ-ALU-Y
Text Label 6850 1850 2    50   ~ 0
~READ-ALU-B
Text Label 6850 1750 2    50   ~ 0
~READ-AC
Text Label 6850 1650 2    50   ~ 0
~READ-SP
NoConn ~ 6300 1450
Text Label 5100 1550 0    50   ~ 0
RADDR0
Text Label 5100 1650 0    50   ~ 0
RADDR1
Text Label 5100 1750 0    50   ~ 0
RADDR2
Text Label 5100 1850 0    50   ~ 0
RADDR3
Text Label 5100 1950 0    50   ~ 0
RADDR4
Text Label 6850 3800 2    50   ~ 0
~WRITE-B
Text Label 6850 3300 2    50   ~ 0
~WRITE-AC
Text Label 6850 3900 2    50   ~ 0
~WRITE-SP
NoConn ~ 6300 3400
NoConn ~ 6300 3500
$Comp
L alexios:ATF16V8B U203
U 2 1 63A656BB
P 8450 5050
AR Path="/63A656BB" Ref="U203"  Part="2" 
AR Path="/5E1C970B/63A656BB" Ref="U203"  Part="2" 
F 0 "U203" H 8630 5096 50  0000 L CNN
F 1 "ATF16V8B" H 8630 5005 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8450 5050 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 8450 5050 50  0001 C CNN
F 4 "ALWDEC00" V 8450 5050 50  0001 C CNB "Signature"
F 5 "alu-waddr-decode.jed" H 8450 4400 50  0001 C CNN "Image Filename"
	2    8450 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63A656C1
P 8100 5050
AR Path="/5CC0D65F/63A656C1" Ref="C?"  Part="1" 
AR Path="/63A656C1" Ref="C?"  Part="1" 
AR Path="/5F597FD4/63A656C1" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A656C1" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A656C1" Ref="C?"  Part="1" 
AR Path="/5DC89E19/63A656C1" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A656C1" Ref="C?"  Part="1" 
AR Path="/5D121AA3/63A656C1" Ref="C?"  Part="1" 
AR Path="/5E1C970B/63A656C1" Ref="C203"  Part="1" 
F 0 "C203" H 8009 5096 50  0000 R CNN
F 1 "100nF" H 8009 5005 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8100 5050 50  0001 C CNN
F 3 "~" H 8100 5050 50  0001 C CNN
	1    8100 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63A656C7
P 8100 5150
AR Path="/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A656C7" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 8100 4900 50  0001 C CNN
F 1 "GND" H 8105 4977 50  0000 C CNN
F 2 "" H 8100 5150 50  0001 C CNN
F 3 "" H 8100 5150 50  0001 C CNN
	1    8100 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63A656CD
P 8100 4950
AR Path="/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A656CD" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 8100 4800 50  0001 C CNN
F 1 "+5V" H 8115 5123 50  0000 C CNN
F 2 "" H 8100 4950 50  0001 C CNN
F 3 "" H 8100 4950 50  0001 C CNN
	1    8100 4950
	1    0    0    -1  
$EndComp
Connection ~ 8100 4950
Connection ~ 8100 5150
Wire Wire Line
	5400 4950 5100 4950
Wire Wire Line
	5400 5050 5100 5050
Wire Wire Line
	5400 5150 5100 5150
Wire Wire Line
	5400 5250 5100 5250
Wire Wire Line
	5400 5350 5100 5350
Text Label 5100 4950 0    50   ~ 0
CLK4
NoConn ~ 5400 5550
NoConn ~ 5400 5650
NoConn ~ 5400 5750
NoConn ~ 5400 5850
NoConn ~ 6300 4950
Text Label 5100 5050 0    50   ~ 0
ACTION0
Text Label 5100 5150 0    50   ~ 0
ACTION1
Text Label 5100 5250 0    50   ~ 0
ACTION2
Text Label 5100 5350 0    50   ~ 0
ACTION3
NoConn ~ 5400 5450
Text Label 6900 5650 2    50   ~ 0
~ACTION-CPL
Text Label 6900 5550 2    50   ~ 0
~ACTION-CLL
Text Label 6900 5450 2    50   ~ 0
~ACTION-SRU
Text Label 6900 5350 2    50   ~ 0
~INCAC
Text Label 6900 5250 2    50   ~ 0
~DECAC
Text Label 6900 5150 2    50   ~ 0
~INCSP
Text Label 6900 5050 2    50   ~ 0
~DECSP
Wire Wire Line
	6300 5050 6950 5050
Wire Wire Line
	6300 5150 6950 5150
Wire Wire Line
	6300 5250 6950 5250
Wire Wire Line
	6300 5350 6950 5350
Wire Wire Line
	6300 5450 6950 5450
Wire Wire Line
	6300 5550 6950 5550
Wire Wire Line
	6300 5650 6950 5650
Text HLabel 6950 5050 2    50   Output ~ 0
~DECSP
Text HLabel 6950 5150 2    50   Output ~ 0
~INCSP
Text HLabel 6950 5250 2    50   Output ~ 0
~DECAC
Text HLabel 6950 5350 2    50   Output ~ 0
~INCAC
Text HLabel 6950 5450 2    50   Output ~ 0
~ACTION-SRU
Text HLabel 6950 5550 2    50   Output ~ 0
~ACTION-CLL
Text HLabel 6950 5650 2    50   Output ~ 0
~ACTION-CPL
Wire Wire Line
	6300 1650 6950 1650
Wire Wire Line
	6300 1750 6950 1750
Wire Wire Line
	6300 1850 6950 1850
Wire Wire Line
	6300 1950 6950 1950
Wire Wire Line
	6300 2050 6950 2050
Wire Wire Line
	6300 2150 6950 2150
Text HLabel 6950 1650 2    50   Output ~ 0
~READ-SP
Text HLabel 6950 1750 2    50   Output ~ 0
~READ-AC
Text HLabel 6950 1850 2    50   Output ~ 0
~READ-ALU-B
Text HLabel 6950 1950 2    50   Output ~ 0
~READ-ALU-Y
Text HLabel 6950 2050 2    50   Output ~ 0
ACP
Text HLabel 6950 2150 2    50   Output ~ 0
~ALU-OP
Text Label 2250 4050 2    50   ~ 0
ACTION[0..3]
Wire Wire Line
	6300 3900 6950 3900
Wire Wire Line
	6300 3300 6950 3300
Wire Wire Line
	6300 3800 6950 3800
Text HLabel 6950 3900 2    50   Output ~ 0
~WRITE-SP
Text HLabel 6950 3300 2    50   Output ~ 0
~WRITE-AC
Text HLabel 6950 3800 2    50   Output ~ 0
~WRITE-ALU-B
Wire Wire Line
	6300 1550 6950 1550
Text Label 6850 1550 2    50   ~ 0
~ALUOE
Text HLabel 6950 1550 2    50   Output ~ 0
~ALUOE
$Comp
L alexios:ATF16V8B U202
U 1 1 63A0056E
P 5850 3650
AR Path="/63A0056E" Ref="U202"  Part="1" 
AR Path="/5E1C970B/63A0056E" Ref="U202"  Part="1" 
F 0 "U202" H 5850 4400 50  0000 C CNN
F 1 "ATF16V8B" H 5850 4300 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5850 3650 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 5850 3650 50  0001 C CNN
F 4 "ALWDEC00" V 5850 3650 50  0000 C CNB "Signature"
F 5 "alu-waddr-decode.jed" H 5850 3000 50  0000 C CNN "Image Filename"
	1    5850 3650
	1    0    0    -1  
$EndComp
NoConn ~ 6300 3600
NoConn ~ 6300 3700
$Comp
L alexios:ATF16V8B U203
U 1 1 63A656B3
P 5850 5400
AR Path="/63A656B3" Ref="U203"  Part="1" 
AR Path="/5E1C970B/63A656B3" Ref="U203"  Part="1" 
F 0 "U203" H 5850 6150 50  0000 C CNN
F 1 "ATF16V8B" H 5850 6050 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5850 5400 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 5850 5400 50  0001 C CNN
F 4 "ALADEC00" V 5850 5400 50  0000 C CNB "Signature"
F 5 "alu-action-decode.jed" H 5850 4750 50  0000 C CNN "Image Filename"
	1    5850 5400
	1    0    0    -1  
$EndComp
Text Notes 900  1000 0    63   ~ 13
Decoders
Text Notes 900  1700 0    50   ~ 0
These decoders respond to Control Unit signals in the Read, Write and Action fields.\nThey generate clock-synchronous strobes to operate the units on this board. They're\nimplemented using 16V8 GALs (or compatible) rather than 74HC138 and single\ngates for two reasons: (a) allow mistakes to be fixed without excessive rewiring of the\nboards; and (b) reduce the need for single 74'1Gxx gates.\n\nThey're also good for future expansion.\n
$EndSCHEMATC
