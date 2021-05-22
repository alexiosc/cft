EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 20
Title "ALU Decoding & Control"
Date "2019-11-17"
Rev "2022"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 "alu_decoder.v"
$EndDescr
Text Notes -2950 5200 0    50   ~ 0
This decoder responds to RADDR=11000. It's used to retrieve\nthe result of an SRU (shift/rotate) operation after the SRU has\nfinished cranking. The microcode could also theoretically use\nthe B port as a very temporary scratch register of limited\nutility—since every ALU operation clobbers it.
Text Notes -4300 3200 0    50   ~ 0
This decoder drives the IBus with the ALU result for all ALU\noperations except shifts and rotates. It responds to any\nRADDR like 10xxx, so activates for 8 RADDR addresses.
Text HLabel 1200 1950 0    50   Input ~ 0
ACTION[0..4]
Text Label 1800 1450 2    50   ~ 0
T34
Text HLabel 1200 1450 0    50   Input ~ 0
T34
Text Label 1800 1850 2    50   ~ 0
WADDR[0..4]
Text HLabel 1200 1850 0    50   Input ~ 0
WADDR[0..4]
Wire Bus Line
	1800 1850 1200 1850
Wire Bus Line
	1800 1950 1200 1950
Text HLabel 1200 1750 0    50   Input ~ 0
RADDR[0..4]
Text Label 1800 1750 2    50   ~ 0
RADDR[0..4]
Wire Bus Line
	1200 1750 1800 1750
Text Notes -2000 4600 0    50   ~ 0
This inverter is in card_alu.v.
Wire Wire Line
	1200 1450 1800 1450
Text Label 1800 1350 2    50   ~ 0
CLK4
Text HLabel 1200 1350 0    50   Input ~ 0
CLK4
Wire Wire Line
	1200 1350 1800 1350
$Comp
L alexios:ATF16V8B U202
U 2 1 63A04AA0
P 7000 3600
F 0 "U202" H 7180 3646 50  0000 L CNN
F 1 "ATF16V8B" H 7180 3555 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7000 3600 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 7000 3600 50  0001 C CNN
F 4 "ALWDEC00" V 7000 3600 50  0001 C CNB "Signature"
F 5 "alu-waddr-decode.jed" H 7000 2950 50  0001 C CNN "Image Filename"
	2    7000 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63A07EFB
P 6650 3600
AR Path="/5CC0D65F/63A07EFB" Ref="C?"  Part="1" 
AR Path="/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5F597FD4/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5DC89E19/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5D121AA3/63A07EFB" Ref="C?"  Part="1" 
AR Path="/5E1C970B/63A07EFB" Ref="C202"  Part="1" 
F 0 "C202" H 6559 3646 50  0000 R CNN
F 1 "100nF" H 6559 3555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6650 3600 50  0001 C CNN
F 3 "~" H 6650 3600 50  0001 C CNN
	1    6650 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63A07F01
P 6650 3700
AR Path="/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A07F01" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A07F01" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 6650 3450 50  0001 C CNN
F 1 "GND" H 6655 3527 50  0000 C CNN
F 2 "" H 6650 3700 50  0001 C CNN
F 3 "" H 6650 3700 50  0001 C CNN
	1    6650 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63A07F07
P 6650 3500
AR Path="/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A07F07" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A07F07" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 6650 3350 50  0001 C CNN
F 1 "+5V" H 6665 3673 50  0000 C CNN
F 2 "" H 6650 3500 50  0001 C CNN
F 3 "" H 6650 3500 50  0001 C CNN
	1    6650 3500
	1    0    0    -1  
$EndComp
Connection ~ 6650 3500
Connection ~ 6650 3700
Wire Wire Line
	3950 3500 3650 3500
Wire Wire Line
	3950 3600 3650 3600
Wire Wire Line
	3950 3700 3650 3700
Wire Wire Line
	3950 3800 3650 3800
Wire Wire Line
	3950 3900 3650 3900
Wire Wire Line
	3950 4000 3650 4000
Text Label 3650 3500 0    50   ~ 0
CLK4
Text Label 3650 3600 0    50   ~ 0
WADDR0
Text Label 3650 3700 0    50   ~ 0
WADDR1
Text Label 3650 3800 0    50   ~ 0
WADDR2
Text Label 3650 3900 0    50   ~ 0
WADDR3
Text Label 3650 4000 0    50   ~ 0
WADDR4
NoConn ~ 3950 4100
NoConn ~ 3950 4200
NoConn ~ 3950 4300
NoConn ~ 3950 4400
NoConn ~ 4850 3500
NoConn ~ 4850 3600
$Comp
L alexios:ATF16V8B U201
U 1 1 63A46035
P 4400 1650
F 0 "U201" H 4400 2400 50  0000 C CNN
F 1 "ATF16V8B" H 4400 2300 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4400 1650 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4400 1650 50  0001 C CNN
F 4 "ALRDEC00" V 4400 1650 50  0000 C CNB "Signature"
F 5 "alu-raddr-decode.jed" H 4400 1000 50  0000 C CNN "Image Filename"
	1    4400 1650
	1    0    0    -1  
$EndComp
$Comp
L alexios:ATF16V8B U201
U 2 1 63A4603D
P 7000 1300
F 0 "U201" H 7180 1346 50  0000 L CNN
F 1 "ATF16V8B" H 7180 1255 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7000 1300 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 7000 1300 50  0001 C CNN
F 4 "ALWDEC00" V 7000 1300 50  0001 C CNB "Signature"
F 5 "alu-waddr-decode.jed" H 7000 650 50  0001 C CNN "Image Filename"
	2    7000 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63A46043
P 6650 1300
AR Path="/5CC0D65F/63A46043" Ref="C?"  Part="1" 
AR Path="/63A46043" Ref="C?"  Part="1" 
AR Path="/5F597FD4/63A46043" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A46043" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A46043" Ref="C?"  Part="1" 
AR Path="/5DC89E19/63A46043" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A46043" Ref="C?"  Part="1" 
AR Path="/5D121AA3/63A46043" Ref="C?"  Part="1" 
AR Path="/5E1C970B/63A46043" Ref="C201"  Part="1" 
F 0 "C201" H 6559 1346 50  0000 R CNN
F 1 "100nF" H 6559 1255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6650 1300 50  0001 C CNN
F 3 "~" H 6650 1300 50  0001 C CNN
	1    6650 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63A46049
P 6650 1400
AR Path="/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A46049" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A46049" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 6650 1150 50  0001 C CNN
F 1 "GND" H 6655 1227 50  0000 C CNN
F 2 "" H 6650 1400 50  0001 C CNN
F 3 "" H 6650 1400 50  0001 C CNN
	1    6650 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63A4604F
P 6650 1200
AR Path="/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A4604F" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A4604F" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 6650 1050 50  0001 C CNN
F 1 "+5V" H 6665 1373 50  0000 C CNN
F 2 "" H 6650 1200 50  0001 C CNN
F 3 "" H 6650 1200 50  0001 C CNN
	1    6650 1200
	1    0    0    -1  
$EndComp
Connection ~ 6650 1200
Connection ~ 6650 1400
Wire Wire Line
	3950 1200 3650 1200
Wire Wire Line
	3950 1300 3650 1300
Wire Wire Line
	3950 1400 3650 1400
Wire Wire Line
	3950 1500 3650 1500
Wire Wire Line
	3950 1600 3650 1600
Wire Wire Line
	3950 1700 3650 1700
Text Label 3650 1200 0    50   ~ 0
T34
NoConn ~ 3950 1800
NoConn ~ 3950 1900
NoConn ~ 3950 2000
NoConn ~ 3950 2100
Text Label 5400 1900 2    50   ~ 0
~ALU-OP
Text Label 5400 1800 2    50   ~ 0
ACP
Text Label 5400 1700 2    50   ~ 0
~READ-ALU-Y
Text Label 5400 1600 2    50   ~ 0
~READ-ALU-B
Text Label 5400 1500 2    50   ~ 0
~READ-AC
Text Label 5400 1400 2    50   ~ 0
~READ-SP
NoConn ~ 4850 1200
Text Label 3650 1300 0    50   ~ 0
RADDR0
Text Label 3650 1400 0    50   ~ 0
RADDR1
Text Label 3650 1500 0    50   ~ 0
RADDR2
Text Label 3650 1600 0    50   ~ 0
RADDR3
Text Label 3650 1700 0    50   ~ 0
RADDR4
Text Label 5400 4200 2    50   ~ 0
~WRITE-B
Text Label 5400 4100 2    50   ~ 0
~WRITE-AC
Text Label 5400 4000 2    50   ~ 0
~WRITE-SP
NoConn ~ 4850 3700
NoConn ~ 4850 3800
$Comp
L alexios:ATF16V8B U203
U 1 1 63A656B3
P 4400 6350
F 0 "U203" H 4400 7100 50  0000 C CNN
F 1 "ATF16V8B" H 4400 7000 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4400 6350 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4400 6350 50  0001 C CNN
F 4 "ALADEC00" V 4400 6350 50  0000 C CNB "Signature"
F 5 "alu-action-decode.jed" H 4400 5700 50  0000 C CNN "Image Filename"
	1    4400 6350
	1    0    0    -1  
$EndComp
$Comp
L alexios:ATF16V8B U203
U 2 1 63A656BB
P 7000 6000
F 0 "U203" H 7180 6046 50  0000 L CNN
F 1 "ATF16V8B" H 7180 5955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7000 6000 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 7000 6000 50  0001 C CNN
F 4 "ALWDEC00" V 7000 6000 50  0001 C CNB "Signature"
F 5 "alu-waddr-decode.jed" H 7000 5350 50  0001 C CNN "Image Filename"
	2    7000 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63A656C1
P 6650 6000
AR Path="/5CC0D65F/63A656C1" Ref="C?"  Part="1" 
AR Path="/63A656C1" Ref="C?"  Part="1" 
AR Path="/5F597FD4/63A656C1" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A656C1" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A656C1" Ref="C?"  Part="1" 
AR Path="/5DC89E19/63A656C1" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A656C1" Ref="C?"  Part="1" 
AR Path="/5D121AA3/63A656C1" Ref="C?"  Part="1" 
AR Path="/5E1C970B/63A656C1" Ref="C203"  Part="1" 
F 0 "C203" H 6559 6046 50  0000 R CNN
F 1 "100nF" H 6559 5955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6650 6000 50  0001 C CNN
F 3 "~" H 6650 6000 50  0001 C CNN
	1    6650 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63A656C7
P 6650 6100
AR Path="/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A656C7" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A656C7" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 6650 5850 50  0001 C CNN
F 1 "GND" H 6655 5927 50  0000 C CNN
F 2 "" H 6650 6100 50  0001 C CNN
F 3 "" H 6650 6100 50  0001 C CNN
	1    6650 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63A656CD
P 6650 5900
AR Path="/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/63A656CD" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/63A656CD" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 6650 5750 50  0001 C CNN
F 1 "+5V" H 6665 6073 50  0000 C CNN
F 2 "" H 6650 5900 50  0001 C CNN
F 3 "" H 6650 5900 50  0001 C CNN
	1    6650 5900
	1    0    0    -1  
$EndComp
Connection ~ 6650 5900
Connection ~ 6650 6100
Wire Wire Line
	3950 5900 3650 5900
Wire Wire Line
	3950 6000 3650 6000
Wire Wire Line
	3950 6100 3650 6100
Wire Wire Line
	3950 6200 3650 6200
Wire Wire Line
	3950 6300 3650 6300
Text Label 3650 5900 0    50   ~ 0
CLK4
NoConn ~ 3950 6500
NoConn ~ 3950 6600
NoConn ~ 3950 6700
NoConn ~ 3950 6800
NoConn ~ 4850 5900
Text Label 3650 6000 0    50   ~ 0
ACTION0
Text Label 3650 6100 0    50   ~ 0
ACTION1
Text Label 3650 6200 0    50   ~ 0
ACTION2
Text Label 3650 6300 0    50   ~ 0
ACTION3
NoConn ~ 3950 6400
Text Label 5450 6600 2    50   ~ 0
~ACTION-CPL
Text Label 5450 6500 2    50   ~ 0
~ACTION-CLL
Text Label 5450 6400 2    50   ~ 0
~ACTION-SRU
Text Label 5450 6300 2    50   ~ 0
~INCAC
Text Label 5450 6200 2    50   ~ 0
~DECAC
Text Label 5450 6100 2    50   ~ 0
~INCSP
Text Label 5450 6000 2    50   ~ 0
~DECSP
Wire Wire Line
	4850 6000 5500 6000
Wire Wire Line
	4850 6100 5500 6100
Wire Wire Line
	4850 6200 5500 6200
Wire Wire Line
	4850 6300 5500 6300
Wire Wire Line
	4850 6400 5500 6400
Wire Wire Line
	4850 6500 5500 6500
Wire Wire Line
	4850 6600 5500 6600
Text HLabel 5500 6000 2    50   Output ~ 0
~DECSP
Text HLabel 5500 6100 2    50   Output ~ 0
~INCSP
Text HLabel 5500 6200 2    50   Output ~ 0
~DECAC
Text HLabel 5500 6300 2    50   Output ~ 0
~INCAC
Text HLabel 5500 6400 2    50   Output ~ 0
~ACTION-SRU
Text HLabel 5500 6500 2    50   Output ~ 0
~ACTION-CLL
Text HLabel 5500 6600 2    50   Output ~ 0
~ACTION-CPL
Wire Wire Line
	4850 1400 5500 1400
Wire Wire Line
	4850 1500 5500 1500
Wire Wire Line
	4850 1600 5500 1600
Wire Wire Line
	4850 1700 5500 1700
Wire Wire Line
	4850 1800 5500 1800
Wire Wire Line
	4850 1900 5500 1900
Text HLabel 5500 1400 2    50   Output ~ 0
~READ-SP
Text HLabel 5500 1500 2    50   Output ~ 0
~READ-AC
Text HLabel 5500 1600 2    50   Output ~ 0
~READ-ALU-B
Text HLabel 5500 1700 2    50   Output ~ 0
~READ-ALU-Y
Text HLabel 5500 1800 2    50   Output ~ 0
ACP
Text HLabel 5500 1900 2    50   Output ~ 0
~ALU-OP
Text Label 1800 1950 2    50   ~ 0
ACTION[0..3]
Wire Wire Line
	4850 4000 5500 4000
Wire Wire Line
	4850 4100 5500 4100
Wire Wire Line
	4850 4200 5500 4200
Text HLabel 5500 4000 2    50   Output ~ 0
~WRITE-SP
Text HLabel 5500 4100 2    50   Output ~ 0
~WRITE-AC
Text HLabel 5500 4200 2    50   Output ~ 0
~WRITE-ALU-B
Wire Wire Line
	4850 1300 5500 1300
Text Label 5400 1300 2    50   ~ 0
~ALUOE
Text HLabel 5500 1300 2    50   Output ~ 0
~ALUOE
$Comp
L alexios:ATF16V8B U202
U 1 1 63A0056E
P 4400 3950
F 0 "U202" H 4400 4700 50  0000 C CNN
F 1 "ATF16V8B" H 4400 4600 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4400 3950 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4400 3950 50  0001 C CNN
F 4 "ALWDEC00" V 4400 3950 50  0000 C CNB "Signature"
F 5 "alu-waddr-decode.jed" H 4400 3300 50  0000 C CNN "Image Filename"
	1    4400 3950
	1    0    0    -1  
$EndComp
NoConn ~ 4850 3900
$EndSCHEMATC
