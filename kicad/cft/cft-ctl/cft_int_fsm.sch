EESchema Schematic File Version 4
LIBS:cft-ctl-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 11
Title "Interrupt State Machine"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 5DEFC7E0
P 1050 7300
AR Path="/5CC0D65F/5DEFC7E0" Ref="C?"  Part="1" 
AR Path="/5DEFC7E0" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7E0" Ref="C46"  Part="1" 
F 0 "C46" H 959 7346 50  0000 R CNN
F 1 "100nF" H 959 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 7300 50  0001 C CNN
F 3 "~" H 1050 7300 50  0001 C CNN
	1    1050 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0184
U 1 1 5F85F21B
P 1050 7200
F 0 "#PWR0184" H 1050 7050 50  0001 C CNN
F 1 "+5V" H 1065 7373 50  0000 C CNN
F 2 "" H 1050 7200 50  0001 C CNN
F 3 "" H 1050 7200 50  0001 C CNN
	1    1050 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0185
U 1 1 5F85F700
P 1050 7400
F 0 "#PWR0185" H 1050 7150 50  0001 C CNN
F 1 "GND" H 1055 7227 50  0000 C CNN
F 2 "" H 1050 7400 50  0001 C CNN
F 3 "" H 1050 7400 50  0001 C CNN
	1    1050 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U42
U 1 1 5D183FAB
P 5900 3350
F 0 "U42" H 5825 3175 50  0000 C CNN
F 1 "74LVC1G08" H 5825 3084 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 5550 3350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5550 3350 50  0001 C CNN
	1    5900 3350
	1    0    0    -1  
$EndComp
Text HLabel 2250 1800 0    50   Input ~ 0
~RESET
Text Label 5600 3300 2    50   ~ 0
~RESET
Text HLabel 8850 2800 2    50   Output ~ 0
FI
$Comp
L alexios:74LVC1G32 U51
U 1 1 5DEFC7B5
P 5350 5200
F 0 "U51" H 5400 5025 50  0000 C CNN
F 1 "74LVC1G32" H 5400 4934 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 5460 5180 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5460 5180 50  0001 C CNN
	1    5350 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0188
U 1 1 5DEFC7B4
P 2700 4450
F 0 "#PWR0188" H 2700 4300 50  0001 C CNN
F 1 "+5V" H 2715 4623 50  0000 C CNN
F 2 "" H 2700 4450 50  0001 C CNN
F 3 "" H 2700 4450 50  0001 C CNN
	1    2700 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4650 2700 4700
$Comp
L Device:R_Small R?
U 1 1 5DEFC7B3
P 2700 4550
AR Path="/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7B3" Ref="R28"  Part="1" 
F 0 "R28" H 2759 4596 50  0000 L CNN
F 1 "4.7kΩ" H 2759 4505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2700 4550 50  0001 C CNN
F 3 "~" H 2700 4550 50  0001 C CNN
	1    2700 4550
	1    0    0    -1  
$EndComp
Text Notes 5050 -1700 0    50   ~ 0
This is the Interrupt Flag (interrupt handling enabled)\ndisplayed on the front panel.
Text Notes 6850 2400 0    79   ~ 16
Interrupt Flag
Text HLabel 8850 4600 2    50   Output ~ 0
~IRQSµC
Text HLabel 8850 4900 2    50   Output ~ 0
~IRQS
Text Notes 1600 -2500 0    50   ~ 0
~IRQS~ and ~IRQµC~ are the same signal.\nThe former is output to the bus. The latter is\nfor the Microcode Store. We drive them separately\nto keep the capacitance down and because the one going\nto the Microcode Store is more important and must be\nless loaded (and thus rise faster).\n\nTODO: Drive ~IRQSµC using the leftover FF.
Wire Wire Line
	8500 4900 8850 4900
$Comp
L Device:R_Small R?
U 1 1 5DEFC7BE
P 8400 4900
AR Path="/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7BE" Ref="R29"  Part="1" 
F 0 "R29" V 8504 4900 50  0000 C CNN
F 1 "30Ω" V 8595 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8400 4900 50  0001 C CNN
F 3 "~" H 8400 4900 50  0001 C CNN
	1    8400 4900
	0    1    1    0   
$EndComp
Text HLabel 2250 1900 0    50   Input ~ 0
IBUS15
Text Label 2350 1900 0    50   ~ 0
IBUS15
Text Notes 2750 1900 0    50   ~ 0
(FI bit for retrieving FI from stack)
Text HLabel 2250 2000 0    50   Input ~ 0
~FLAGWE
Text Label 2350 2000 0    50   ~ 0
~FLAGWE
Text Notes 4550 -3450 0    50   ~ 10
Assumption
Text Notes 4550 -3200 0    50   ~ 0
~ACTION_STI~ and ~ACTION_CLI~ remain de-asserted\nflags are being written using ~FLAGWE~.
Text Notes 1900 -1050 0    50   ~ 0
Use LVC or AC family for flip-flops.\nIt reduces the chances of metastability.
Text Label 3050 3050 1    50   ~ 0
ACTION[0..3]
Text Label 2350 2250 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	2250 2250 2950 2250
Entry Bus Bus
	2950 2250 3050 2350
Entry Wire Line
	3050 3100 3150 3200
Entry Wire Line
	3050 2600 3150 2700
Entry Wire Line
	3050 2500 3150 2600
Entry Wire Line
	3050 2400 3150 2500
$Comp
L alexios:74HC138 U?
U 1 1 610B639A
P 4000 2900
AR Path="/5F3EA987/610B639A" Ref="U?"  Part="1" 
AR Path="/610B639A" Ref="U?"  Part="1" 
AR Path="/61F95ACC/610B639A" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/610B639A" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/610B639A" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/610B639A" Ref="U15"  Part="1" 
F 0 "U15" H 4000 3567 50  0000 C CNN
F 1 "74HC138" H 4000 3476 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4000 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4000 2900 50  0001 C CNN
	1    4000 2900
	1    0    0    -1  
$EndComp
Text Label 3150 2500 0    50   ~ 0
ACTION0
Text Label 3150 2600 0    50   ~ 0
ACTION1
Text Label 3150 2700 0    50   ~ 0
ACTION2
Text Label 3150 3200 0    50   ~ 0
ACTION3
$Comp
L power:+5V #PWR?
U 1 1 610B63A4
P 3500 3100
AR Path="/610B63A4" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/610B63A4" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/610B63A4" Ref="#PWR?"  Part="1" 
AR Path="/5F67D4B5/610B63A4" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 3500 2950 50  0001 C CNN
F 1 "+5V" H 3515 3273 50  0000 C CNN
F 2 "" H 3500 3100 50  0001 C CNN
F 3 "" H 3500 3100 50  0001 C CNN
	1    3500 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2900 5100 2900
Text Label 5000 2800 2    50   ~ 0
~ACTION-STI
Text Label 5000 2900 2    50   ~ 0
~ACTION-CLI
NoConn ~ 4500 2500
NoConn ~ 4500 3100
NoConn ~ 4500 3200
Text Notes 4050 3150 1    50   ~ 10
ACTION=0xxx
Wire Wire Line
	3500 3200 3150 3200
Wire Wire Line
	3500 2700 3150 2700
Wire Wire Line
	3500 2600 3150 2600
Wire Wire Line
	3500 2500 3150 2500
Text HLabel 2250 2250 0    50   Input ~ 0
ACTION[0..3]
NoConn ~ 4500 3000
NoConn ~ 4500 2600
NoConn ~ 4500 2700
Text Label 3150 3300 0    50   ~ 0
CLK4
$Comp
L alexios:74LVC1G373 U?
U 1 1 5EB1699E
P 3700 4800
F 0 "U?" H 3700 5167 50  0000 C CNN
F 1 "74LVC1G373" H 3700 5076 50  0000 C CNN
F 2 "" H 3600 4825 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3600 4825 50  0001 C CNN
	1    3700 4800
	1    0    0    -1  
$EndComp
Text HLabel 2250 4700 0    50   Input ~ 0
~IRQ
Text Label 3250 4700 2    50   ~ 0
~IRQ
Wire Wire Line
	4150 5150 3000 5150
Text HLabel 2250 5150 0    50   Input ~ 0
CLK4
Text Label 3250 4800 2    50   ~ 0
CLK4
Wire Wire Line
	3250 4800 3000 4800
Wire Wire Line
	3000 4800 3000 5150
Connection ~ 3000 5150
Wire Wire Line
	3000 5150 2250 5150
$Comp
L power:GND #PWR?
U 1 1 5EB26974
P 3250 4900
F 0 "#PWR?" H 3250 4650 50  0001 C CNN
F 1 "GND" H 3255 4727 50  0000 C CNN
F 2 "" H 3250 4900 50  0001 C CNN
F 3 "" H 3250 4900 50  0001 C CNN
	1    3250 4900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U?
U 1 1 5EB2B410
P 5400 4750
F 0 "U?" H 5400 5167 50  0000 C CNN
F 1 "74LVC1G74" H 5400 5076 50  0000 C CNN
F 2 "" H 5850 4750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 5850 4750 50  0001 C CNN
	1    5400 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 4800 4150 4800
Text Label 4950 4800 2    50   ~ 0
CLK4
Wire Wire Line
	4150 4700 4950 4700
$Comp
L alexios:74LVC1G04 U?
U 1 1 5EBBC99F
P 8050 4900
F 0 "U?" H 8000 4725 50  0000 C CNN
F 1 "74LVC1G04" H 8000 4634 50  0000 C CNN
F 2 "" H 8050 4900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 8050 4900 50  0001 C CNN
	1    8050 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 4900 8300 4900
Text Label 8750 4900 2    50   ~ 0
~IRQS
Text Label 2350 5150 0    50   ~ 0
CLK4
Text Label 2350 4700 0    50   ~ 0
~IRQ
Wire Wire Line
	2250 4700 2700 4700
Connection ~ 2700 4700
Wire Wire Line
	2700 4700 3250 4700
Text Notes 2550 5500 0    50   ~ 0
Interrupts are very prone to metastability. Using a latch\nhere greatly reduces the probability of this happening.
Wire Wire Line
	4500 2800 6850 2800
Wire Wire Line
	4150 4800 4150 5150
$Comp
L alexios:74LVC1G74 U?
U 1 1 5EC1D079
P 7250 4750
F 0 "U?" H 7250 5167 50  0000 C CNN
F 1 "74LVC1G74" H 7250 5076 50  0000 C CNN
F 2 "" H 7700 4750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 7700 4750 50  0001 C CNN
	1    7250 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5250 5150 5250
Wire Wire Line
	4150 5150 5150 5150
Connection ~ 4150 5150
Text HLabel 2250 5250 0    50   Input ~ 0
~END
Text Label 2350 5250 0    50   ~ 0
~END
Text Label 5100 5150 2    50   ~ 0
CLK4
Text Label 5100 5250 2    50   ~ 0
~END
Wire Wire Line
	5650 5200 6050 5200
Wire Wire Line
	6050 5200 6050 4800
Text Label 6750 4800 2    50   ~ 0
ENDCP
Text Label 6750 4700 2    50   ~ 0
~IRQ1
NoConn ~ 5850 4900
Wire Wire Line
	6050 4700 6800 4700
Wire Wire Line
	6050 4600 6050 4700
Wire Wire Line
	5850 4600 6050 4600
Text Label 6200 4600 0    50   ~ 0
~RESET-OR-CLI
Wire Wire Line
	6050 4800 6800 4800
$Comp
L power:+5V #PWR?
U 1 1 5EC5F9F2
P 6800 4900
F 0 "#PWR?" H 6800 4750 50  0001 C CNN
F 1 "+5V" V 6815 5028 50  0000 L CNN
F 2 "" H 6800 4900 50  0001 C CNN
F 3 "" H 6800 4900 50  0001 C CNN
	1    6800 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7700 4600 8850 4600
Text Label 8750 4600 2    50   ~ 0
~IRQSµC
Text Label 5700 5200 0    50   ~ 0
ENDCP
Wire Wire Line
	7750 4900 7700 4900
Wire Wire Line
	6150 4600 6800 4600
Wire Wire Line
	5200 1800 2250 1800
Text Label 6800 3100 2    50   ~ 0
~RESET-OR-CLI
Text Label 8400 2800 0    50   ~ 0
FI
$Comp
L Device:R_Small R?
U 1 1 5ECB817C
P 8250 2800
AR Path="/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5D54E677/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5ECB817C" Ref="R?"  Part="1" 
F 0 "R?" V 8054 2800 50  0000 C CNN
F 1 "30Ω" V 8145 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8250 2800 50  0001 C CNN
F 3 "~" H 8250 2800 50  0001 C CNN
	1    8250 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 2800 8850 2800
Text Label 6800 3000 2    50   ~ 0
~FLAGWE
Text Label 6800 2900 2    50   ~ 0
IBUS15
Text Label 6800 2800 2    50   ~ 0
~ACTION-STI
Wire Wire Line
	7750 2800 8050 2800
Text Label 8750 2800 2    50   ~ 0
FI
Wire Wire Line
	5200 3300 5200 1800
Wire Wire Line
	6150 3100 6850 3100
Wire Wire Line
	5300 2900 5300 1900
Wire Wire Line
	5300 1900 2250 1900
Wire Wire Line
	5300 2900 6850 2900
Wire Wire Line
	5400 3000 5400 2000
Wire Wire Line
	5400 2000 2250 2000
Wire Wire Line
	5400 3000 6850 3000
Text Label 5400 2600 1    50   ~ 0
~FLAGWE
Text Label 5200 2600 1    50   ~ 0
~RESET
Text Label 5300 2600 1    50   ~ 0
IBUS15
Text Label 2350 1800 0    50   ~ 0
~RESET
Wire Wire Line
	4350 4600 4350 3800
Wire Wire Line
	4350 3800 8050 3800
Wire Wire Line
	4350 4600 4950 4600
Wire Wire Line
	8050 2800 8050 3000
Connection ~ 8050 2800
Wire Wire Line
	8050 2800 8150 2800
NoConn ~ 7750 3100
Text Label 7800 2800 0    50   ~ 0
~INH
$Comp
L alexios:74LVC1G74 U?
U 1 1 5ED47F01
P 7300 2950
F 0 "U?" H 7300 3367 50  0000 C CNN
F 1 "74LVC1G74" H 7300 3276 50  0000 C CNN
F 2 "" H 7750 2950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 7750 2950 50  0001 C CNN
	1    7300 2950
	1    0    0    -1  
$EndComp
Text Label 4400 3800 0    50   ~ 0
~INH
Text Label 4950 4600 2    50   ~ 0
~INH
Text Label 4950 4700 2    50   ~ 0
~IRQ0
Text Notes 8150 2000 0    63   ~ 13
6502 users beware!
Text Notes 8150 2300 0    50   ~ 0
On the CFT, the semantics of FI (and thus, STI and CLI) are reversed!\nThe FI is te interrupt ALLOW flag. STI sets it, allowing interrupts; CLI\nclears it, masking interrupts.
$Comp
L Connector:TestPoint TP?
U 1 1 5ECB8174
P 8150 3000
F 0 "TP?" V 8150 3188 50  0000 L CNN
F 1 "TestPoint" H 8208 3027 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 8350 3000 50  0001 C CNN
F 3 "~" H 8350 3000 50  0001 C CNN
	1    8150 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 3000 8050 3000
Connection ~ 8050 3000
Wire Wire Line
	8050 3000 8050 3800
$Comp
L Connector:TestPoint TP?
U 1 1 5ED75C31
P 6050 4600
F 0 "TP?" H 6050 4834 50  0000 C CNN
F 1 "TestPoint" H 6108 4627 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 6250 4600 50  0001 C CNN
F 3 "~" H 6250 4600 50  0001 C CNN
	1    6050 4600
	1    0    0    -1  
$EndComp
Connection ~ 6050 4600
Text Notes 6600 4200 0    79   ~ 16
Jump to Interrupt Handler
Text Notes 5050 4200 0    79   ~ 16
Pending IRQ
$Comp
L alexios:74HC138 U?
U 2 1 5ED81F88
P 1400 6450
AR Path="/5F3EA987/5ED81F88" Ref="U?"  Part="1" 
AR Path="/5ED81F88" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5ED81F88" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5ED81F88" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5ED81F88" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/5ED81F88" Ref="U?"  Part="2" 
F 0 "U?" H 1579 6496 50  0000 L CNN
F 1 "74HC138" H 1579 6405 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1400 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1400 6450 50  0001 C CNN
	2    1400 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ED8212B
P 1050 6450
AR Path="/5CC0D65F/5ED8212B" Ref="C?"  Part="1" 
AR Path="/5ED8212B" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED8212B" Ref="C?"  Part="1" 
F 0 "C?" H 959 6496 50  0000 R CNN
F 1 "100nF" H 959 6405 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 6450 50  0001 C CNN
F 3 "~" H 1050 6450 50  0001 C CNN
	1    1050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED82132
P 1050 6350
F 0 "#PWR?" H 1050 6200 50  0001 C CNN
F 1 "+5V" H 1065 6523 50  0000 C CNN
F 2 "" H 1050 6350 50  0001 C CNN
F 3 "" H 1050 6350 50  0001 C CNN
	1    1050 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED82138
P 1050 6550
F 0 "#PWR?" H 1050 6300 50  0001 C CNN
F 1 "GND" H 1055 6377 50  0000 C CNN
F 2 "" H 1050 6550 50  0001 C CNN
F 3 "" H 1050 6550 50  0001 C CNN
	1    1050 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G373 U?
U 2 1 5ED83232
P 1400 7300
F 0 "U?" H 1580 7346 50  0000 L CNN
F 1 "74LVC1G373" H 1580 7255 50  0000 L CNN
F 2 "" H 1300 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1300 7325 50  0001 C CNN
	2    1400 7300
	1    0    0    -1  
$EndComp
Connection ~ 1050 7200
Connection ~ 1050 7400
$Comp
L alexios:74LVC1G08 U?
U 2 1 5ED85C6A
P 3000 6350
F 0 "U?" H 3080 6296 50  0000 L CNN
F 1 "74LVC1G08" H 3080 6205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 2650 6350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2650 6350 50  0001 C CNN
	2    3000 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ED85E2E
P 2550 6450
AR Path="/5CC0D65F/5ED85E2E" Ref="C?"  Part="1" 
AR Path="/5ED85E2E" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED85E2E" Ref="C?"  Part="1" 
F 0 "C?" H 2459 6496 50  0000 R CNN
F 1 "100nF" H 2459 6405 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2550 6450 50  0001 C CNN
F 3 "~" H 2550 6450 50  0001 C CNN
	1    2550 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED85E35
P 2550 6350
F 0 "#PWR?" H 2550 6200 50  0001 C CNN
F 1 "+5V" H 2565 6523 50  0000 C CNN
F 2 "" H 2550 6350 50  0001 C CNN
F 3 "" H 2550 6350 50  0001 C CNN
	1    2550 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED85E3B
P 2550 6550
F 0 "#PWR?" H 2550 6300 50  0001 C CNN
F 1 "GND" H 2555 6377 50  0000 C CNN
F 2 "" H 2550 6550 50  0001 C CNN
F 3 "" H 2550 6550 50  0001 C CNN
	1    2550 6550
	1    0    0    -1  
$EndComp
Connection ~ 2550 6550
Connection ~ 2550 6350
$Comp
L alexios:74LVC1G74 U?
U 2 1 5ED8B0CA
P 2900 7300
F 0 "U?" H 3080 7346 50  0000 L CNN
F 1 "74LVC1G74" H 3080 7255 50  0000 L CNN
F 2 "" H 3350 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 3350 7300 50  0001 C CNN
	2    2900 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U?
U 2 1 5ED8B6E9
P 4400 6450
F 0 "U?" H 4580 6496 50  0000 L CNN
F 1 "74LVC1G74" H 4580 6405 50  0000 L CNN
F 2 "" H 4850 6450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 4850 6450 50  0001 C CNN
	2    4400 6450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U?
U 2 1 5ED8B785
P 4400 7250
F 0 "U?" H 4580 7296 50  0000 L CNN
F 1 "74LVC1G74" H 4580 7205 50  0000 L CNN
F 2 "" H 4850 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 4850 7250 50  0001 C CNN
	2    4400 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ED8B8B1
P 2550 7300
AR Path="/5CC0D65F/5ED8B8B1" Ref="C?"  Part="1" 
AR Path="/5ED8B8B1" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED8B8B1" Ref="C?"  Part="1" 
F 0 "C?" H 2459 7346 50  0000 R CNN
F 1 "100nF" H 2459 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2550 7300 50  0001 C CNN
F 3 "~" H 2550 7300 50  0001 C CNN
	1    2550 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED8B8B8
P 2550 7200
F 0 "#PWR?" H 2550 7050 50  0001 C CNN
F 1 "+5V" H 2565 7373 50  0000 C CNN
F 2 "" H 2550 7200 50  0001 C CNN
F 3 "" H 2550 7200 50  0001 C CNN
	1    2550 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED8B8BE
P 2550 7400
F 0 "#PWR?" H 2550 7150 50  0001 C CNN
F 1 "GND" H 2555 7227 50  0000 C CNN
F 2 "" H 2550 7400 50  0001 C CNN
F 3 "" H 2550 7400 50  0001 C CNN
	1    2550 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ED8C825
P 4050 6450
AR Path="/5CC0D65F/5ED8C825" Ref="C?"  Part="1" 
AR Path="/5ED8C825" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED8C825" Ref="C?"  Part="1" 
F 0 "C?" H 3959 6496 50  0000 R CNN
F 1 "100nF" H 3959 6405 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4050 6450 50  0001 C CNN
F 3 "~" H 4050 6450 50  0001 C CNN
	1    4050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED8C82C
P 4050 6350
F 0 "#PWR?" H 4050 6200 50  0001 C CNN
F 1 "+5V" H 4065 6523 50  0000 C CNN
F 2 "" H 4050 6350 50  0001 C CNN
F 3 "" H 4050 6350 50  0001 C CNN
	1    4050 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED8C832
P 4050 6550
F 0 "#PWR?" H 4050 6300 50  0001 C CNN
F 1 "GND" H 4055 6377 50  0000 C CNN
F 2 "" H 4050 6550 50  0001 C CNN
F 3 "" H 4050 6550 50  0001 C CNN
	1    4050 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ED8F21F
P 4050 7250
AR Path="/5CC0D65F/5ED8F21F" Ref="C?"  Part="1" 
AR Path="/5ED8F21F" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED8F21F" Ref="C?"  Part="1" 
F 0 "C?" H 3959 7296 50  0000 R CNN
F 1 "100nF" H 3959 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4050 7250 50  0001 C CNN
F 3 "~" H 4050 7250 50  0001 C CNN
	1    4050 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED8F226
P 4050 7150
F 0 "#PWR?" H 4050 7000 50  0001 C CNN
F 1 "+5V" H 4065 7323 50  0000 C CNN
F 2 "" H 4050 7150 50  0001 C CNN
F 3 "" H 4050 7150 50  0001 C CNN
	1    4050 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED8F22C
P 4050 7350
F 0 "#PWR?" H 4050 7100 50  0001 C CNN
F 1 "GND" H 4055 7177 50  0000 C CNN
F 2 "" H 4050 7350 50  0001 C CNN
F 3 "" H 4050 7350 50  0001 C CNN
	1    4050 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U?
U 2 1 5ED906EB
P 5950 6200
F 0 "U?" H 6080 5996 50  0000 L CNN
F 1 "74LVC1G32" H 6080 5905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 6060 6180 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 6060 6180 50  0001 C CNN
	2    5950 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ED908A1
P 5550 6450
AR Path="/5CC0D65F/5ED908A1" Ref="C?"  Part="1" 
AR Path="/5ED908A1" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED908A1" Ref="C?"  Part="1" 
F 0 "C?" H 5459 6496 50  0000 R CNN
F 1 "100nF" H 5459 6405 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5550 6450 50  0001 C CNN
F 3 "~" H 5550 6450 50  0001 C CNN
	1    5550 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED908A8
P 5550 6350
F 0 "#PWR?" H 5550 6200 50  0001 C CNN
F 1 "+5V" H 5565 6523 50  0000 C CNN
F 2 "" H 5550 6350 50  0001 C CNN
F 3 "" H 5550 6350 50  0001 C CNN
	1    5550 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED908AE
P 5550 6550
F 0 "#PWR?" H 5550 6300 50  0001 C CNN
F 1 "GND" H 5555 6377 50  0000 C CNN
F 2 "" H 5550 6550 50  0001 C CNN
F 3 "" H 5550 6550 50  0001 C CNN
	1    5550 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U?
U 2 1 5ED917E5
P 5900 7200
F 0 "U?" H 6080 7246 50  0000 L CNN
F 1 "74LVC1G04" H 6080 7155 50  0000 L CNN
F 2 "" H 5900 7200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 5900 7200 50  0001 C CNN
	2    5900 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ED919E5
P 5550 7200
AR Path="/5CC0D65F/5ED919E5" Ref="C?"  Part="1" 
AR Path="/5ED919E5" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED919E5" Ref="C?"  Part="1" 
F 0 "C?" H 5459 7246 50  0000 R CNN
F 1 "100nF" H 5459 7155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5550 7200 50  0001 C CNN
F 3 "~" H 5550 7200 50  0001 C CNN
	1    5550 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED919EC
P 5550 7100
F 0 "#PWR?" H 5550 6950 50  0001 C CNN
F 1 "+5V" H 5565 7273 50  0000 C CNN
F 2 "" H 5550 7100 50  0001 C CNN
F 3 "" H 5550 7100 50  0001 C CNN
	1    5550 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED919F2
P 5550 7300
F 0 "#PWR?" H 5550 7050 50  0001 C CNN
F 1 "GND" H 5555 7127 50  0000 C CNN
F 2 "" H 5550 7300 50  0001 C CNN
F 3 "" H 5550 7300 50  0001 C CNN
	1    5550 7300
	1    0    0    -1  
$EndComp
Connection ~ 2550 7200
Connection ~ 2550 7400
Connection ~ 4050 6350
Connection ~ 4050 6550
Connection ~ 4050 7150
Connection ~ 4050 7350
Connection ~ 5550 6350
Connection ~ 5550 6550
Connection ~ 1050 6350
Connection ~ 1050 6550
Connection ~ 5550 7100
Connection ~ 5550 7300
Wire Notes Line width 24 style solid
	8050 1800 11050 1800
Wire Notes Line width 24 style solid
	8050 1800 8050 2450
Wire Notes Line width 24 style solid
	11050 2450 8050 2450
Wire Notes Line width 24 style solid
	11050 2450 11050 1800
Wire Wire Line
	3000 3300 3000 4800
Wire Wire Line
	3000 3300 3500 3300
Connection ~ 3000 4800
$Comp
L power:+5V #PWR?
U 1 1 5EDB9385
P 4950 4900
F 0 "#PWR?" H 4950 4750 50  0001 C CNN
F 1 "+5V" V 4965 5028 50  0000 L CNN
F 2 "" H 4950 4900 50  0001 C CNN
F 3 "" H 4950 4900 50  0001 C CNN
	1    4950 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 3300 5600 3300
Wire Wire Line
	5600 3400 5100 3400
Wire Wire Line
	5100 2900 5100 3400
Wire Wire Line
	6050 3350 6150 3350
Connection ~ 6150 3350
Wire Wire Line
	6150 3350 6150 3100
Wire Wire Line
	6150 3350 6150 4600
Text Label 5600 3400 2    50   ~ 0
~ACTION-CLI
Wire Bus Line
	3050 2350 3050 3100
$EndSCHEMATC
