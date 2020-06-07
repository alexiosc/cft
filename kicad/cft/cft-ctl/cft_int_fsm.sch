EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 12
Title "Interrupt State Machine"
Date ""
Rev "2023"
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
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1050 7300 50  0001 C CNN
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
P 5900 3850
F 0 "U42" H 5825 3675 50  0000 C CNN
F 1 "74LVC1G08" H 5825 3584 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5550 3850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5550 3850 50  0001 C CNN
	1    5900 3850
	1    0    0    -1  
$EndComp
Text HLabel 2250 2300 0    50   Input ~ 0
~RESET
Text Label 5600 3800 2    50   ~ 0
~RESET
Text HLabel 8850 3300 2    50   Output ~ 0
FI
$Comp
L alexios:74LVC1G32 U51
U 1 1 5DEFC7B5
P 5350 5700
F 0 "U51" H 5400 5525 50  0000 C CNN
F 1 "74LVC1G32" H 5400 5434 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5460 5680 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5460 5680 50  0001 C CNN
	1    5350 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0188
U 1 1 5DEFC7B4
P 2700 4950
F 0 "#PWR0188" H 2700 4800 50  0001 C CNN
F 1 "+5V" H 2715 5123 50  0000 C CNN
F 2 "" H 2700 4950 50  0001 C CNN
F 3 "" H 2700 4950 50  0001 C CNN
	1    2700 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 5150 2700 5200
$Comp
L Device:R_Small R?
U 1 1 5DEFC7B3
P 2700 5050
AR Path="/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7B3" Ref="R28"  Part="1" 
F 0 "R28" H 2759 5096 50  0000 L CNN
F 1 "4.7kΩ" H 2759 5005 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2700 5050 50  0001 C CNN
F 3 "~" H 2700 5050 50  0001 C CNN
	1    2700 5050
	1    0    0    -1  
$EndComp
Text Notes 6850 2900 0    79   ~ 16
Interrupt Flag
Text HLabel 8850 5100 2    50   Output ~ 0
~IRQSµC
Text HLabel 8850 5400 2    50   Output ~ 0
~IRQS
Wire Wire Line
	8500 5400 8850 5400
$Comp
L Device:R_Small R?
U 1 1 5DEFC7BE
P 8400 5400
AR Path="/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7BE" Ref="R29"  Part="1" 
F 0 "R29" V 8504 5400 50  0000 C CNN
F 1 "30Ω" V 8595 5400 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8400 5400 50  0001 C CNN
F 3 "~" H 8400 5400 50  0001 C CNN
	1    8400 5400
	0    1    1    0   
$EndComp
Text HLabel 2250 2400 0    50   Input ~ 0
IBUS15
Text Label 2350 2400 0    50   ~ 0
IBUS15
Text Notes 2750 2400 0    50   ~ 0
(FI bit for retrieving FI from stack)
Text HLabel 2250 2500 0    50   Input ~ 0
~FLAGWE
Text Label 2350 2500 0    50   ~ 0
~FLAGWE
Text Notes 5650 2300 0    63   ~ 13
Assumption
Text Notes 5650 2550 0    50   ~ 0
~ACTION_STI~ and ~ACTION_CLI~ remain de-asserted\nflags are being written using ~FLAGWE~.
Text Label 3050 3550 1    50   ~ 0
ACTION[0..3]
Text Label 2350 2750 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	2250 2750 2950 2750
Entry Bus Bus
	2950 2750 3050 2850
Entry Wire Line
	3050 3600 3150 3700
Entry Wire Line
	3050 3100 3150 3200
Entry Wire Line
	3050 3000 3150 3100
Entry Wire Line
	3050 2900 3150 3000
$Comp
L alexios:74HC138 U?
U 1 1 610B639A
P 4000 3400
AR Path="/5F3EA987/610B639A" Ref="U?"  Part="1" 
AR Path="/610B639A" Ref="U?"  Part="1" 
AR Path="/61F95ACC/610B639A" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/610B639A" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/610B639A" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/610B639A" Ref="U15"  Part="1" 
F 0 "U15" H 4000 4067 50  0000 C CNN
F 1 "74HC138" H 4000 3976 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4000 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4000 3400 50  0001 C CNN
	1    4000 3400
	1    0    0    -1  
$EndComp
Text Label 3150 3000 0    50   ~ 0
ACTION0
Text Label 3150 3100 0    50   ~ 0
ACTION1
Text Label 3150 3200 0    50   ~ 0
ACTION2
Text Label 3150 3700 0    50   ~ 0
ACTION3
$Comp
L power:+5V #PWR?
U 1 1 610B63A4
P 3500 3600
AR Path="/610B63A4" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/610B63A4" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/610B63A4" Ref="#PWR?"  Part="1" 
AR Path="/5F67D4B5/610B63A4" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 3500 3450 50  0001 C CNN
F 1 "+5V" H 3515 3773 50  0000 C CNN
F 2 "" H 3500 3600 50  0001 C CNN
F 3 "" H 3500 3600 50  0001 C CNN
	1    3500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3400 5100 3400
Text Label 4550 3300 0    50   ~ 0
~ACTION-STI
Text Label 4550 3400 0    50   ~ 0
~ACTION-CLI
NoConn ~ 4500 3000
NoConn ~ 4500 3600
NoConn ~ 4500 3700
Text Notes 4050 3650 1    50   ~ 10
ACTION=0xxx
Wire Wire Line
	3500 3700 3150 3700
Wire Wire Line
	3500 3200 3150 3200
Wire Wire Line
	3500 3100 3150 3100
Wire Wire Line
	3500 3000 3150 3000
Text HLabel 2250 2750 0    50   Input ~ 0
ACTION[0..3]
NoConn ~ 4500 3100
NoConn ~ 4500 3200
Text Label 3150 3800 0    50   ~ 0
CLK4
$Comp
L alexios:74LVC1G373 U50
U 1 1 5EB1699E
P 3700 5300
F 0 "U50" H 3700 5667 50  0000 C CNN
F 1 "74LVC1G373" H 3700 5576 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 3600 5325 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3600 5325 50  0001 C CNN
	1    3700 5300
	1    0    0    -1  
$EndComp
Text HLabel 2250 5200 0    50   Input ~ 0
~IRQ
Text Label 3250 5200 2    50   ~ 0
~IRQ
Wire Wire Line
	4350 5650 3000 5650
Text HLabel 2250 5650 0    50   Input ~ 0
CLK4
Text Label 3250 5300 2    50   ~ 0
CLK4
Wire Wire Line
	3250 5300 3000 5300
Wire Wire Line
	3000 5300 3000 5650
Connection ~ 3000 5650
Wire Wire Line
	3000 5650 2250 5650
$Comp
L power:GND #PWR073
U 1 1 5EB26974
P 3250 5400
F 0 "#PWR073" H 3250 5150 50  0001 C CNN
F 1 "GND" H 3255 5227 50  0000 C CNN
F 2 "" H 3250 5400 50  0001 C CNN
F 3 "" H 3250 5400 50  0001 C CNN
	1    3250 5400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U22
U 1 1 5EB2B410
P 5400 5250
F 0 "U22" H 5400 5667 50  0000 C CNN
F 1 "74LVC1G74" H 5400 5576 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 5850 5250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 5850 5250 50  0001 C CNN
	1    5400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5300 4350 5300
Text Label 4950 5300 2    50   ~ 0
CLK4
Wire Wire Line
	4150 5200 4950 5200
$Comp
L alexios:74LVC1G04 U40
U 1 1 5EBBC99F
P 8050 5400
F 0 "U40" H 8000 5225 50  0000 C CNN
F 1 "74LVC1G04" H 8000 5134 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8050 5400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 8050 5400 50  0001 C CNN
	1    8050 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 5400 8300 5400
Text Label 8750 5400 2    50   ~ 0
~IRQS
Text Label 2350 5650 0    50   ~ 0
CLK4
Text Label 2350 5200 0    50   ~ 0
~IRQ
Wire Wire Line
	2250 5200 2700 5200
Connection ~ 2700 5200
Wire Wire Line
	2700 5200 3250 5200
Text Notes 2750 5950 0    50   ~ 0
Interrupts are very prone to metastability. Using a latch\nhere greatly reduces the probability of this happening.
Wire Wire Line
	4500 3300 6850 3300
Wire Wire Line
	4350 5300 4350 5650
$Comp
L alexios:74LVC1G74 U41
U 1 1 5EC1D079
P 7250 5250
F 0 "U41" H 7250 5667 50  0000 C CNN
F 1 "74LVC1G74" H 7250 5576 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 7700 5250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 7700 5250 50  0001 C CNN
	1    7250 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5750 5150 5750
Wire Wire Line
	4350 5650 5150 5650
Connection ~ 4350 5650
Text HLabel 2250 5750 0    50   Input ~ 0
~END
Text Label 2350 5750 0    50   ~ 0
~END
Text Label 5100 5650 2    50   ~ 0
CLK4
Text Label 5100 5750 2    50   ~ 0
~END
Wire Wire Line
	5650 5700 6050 5700
Wire Wire Line
	6050 5700 6050 5300
Text Label 6750 5300 2    50   ~ 0
ENDCP
Text Label 6500 5200 0    50   ~ 0
~IRQ1
NoConn ~ 5850 5400
Wire Wire Line
	6050 5200 6800 5200
Wire Wire Line
	6050 5100 6050 5200
Wire Wire Line
	5850 5100 6050 5100
Wire Wire Line
	6050 5300 6800 5300
$Comp
L power:+5V #PWR0138
U 1 1 5EC5F9F2
P 6800 5400
F 0 "#PWR0138" H 6800 5250 50  0001 C CNN
F 1 "+5V" V 6815 5528 50  0000 L CNN
F 2 "" H 6800 5400 50  0001 C CNN
F 3 "" H 6800 5400 50  0001 C CNN
	1    6800 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7700 5100 8850 5100
Text Label 8750 5100 2    50   ~ 0
~IRQSµC
Text Label 5700 5700 0    50   ~ 0
ENDCP
Wire Wire Line
	7750 5400 7700 5400
Wire Wire Line
	6500 5100 6800 5100
Wire Wire Line
	5200 2300 2250 2300
Text Label 6800 3600 2    50   ~ 0
~RESET-OR-CLI
Text Label 8400 3300 0    50   ~ 0
FI
$Comp
L Device:R_Small R?
U 1 1 5ECB817C
P 8250 3300
AR Path="/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5D54E677/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5ECB817C" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5ECB817C" Ref="R53"  Part="1" 
F 0 "R53" V 8054 3300 50  0000 C CNN
F 1 "30Ω" V 8145 3300 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8250 3300 50  0001 C CNN
F 3 "~" H 8250 3300 50  0001 C CNN
	1    8250 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 3300 8600 3300
Text Label 6800 3500 2    50   ~ 0
~FLAGWE
Text Label 6800 3400 2    50   ~ 0
IBUS15
Text Label 6800 3300 2    50   ~ 0
~ACTION-STI
Wire Wire Line
	7750 3300 8050 3300
Text Label 8750 3300 2    50   ~ 0
FI
Wire Wire Line
	5200 3800 5200 2300
Wire Wire Line
	6150 3600 6850 3600
Wire Wire Line
	5300 3400 5300 2400
Wire Wire Line
	5300 2400 2250 2400
Wire Wire Line
	5300 3400 6850 3400
Wire Wire Line
	5400 3500 5400 2500
Wire Wire Line
	5400 2500 2250 2500
Wire Wire Line
	5400 3500 6850 3500
Text Label 5400 3100 1    50   ~ 0
~FLAGWE
Text Label 5200 3100 1    50   ~ 0
~RESET
Text Label 5300 3100 1    50   ~ 0
IBUS15
Text Label 2350 2300 0    50   ~ 0
~RESET
Wire Wire Line
	4350 5100 4350 4400
Wire Wire Line
	4350 5100 4950 5100
Connection ~ 8050 3300
Wire Wire Line
	8050 3300 8150 3300
NoConn ~ 7750 3600
$Comp
L alexios:74LVC1G74 U13
U 1 1 5ED47F01
P 7300 3450
F 0 "U13" H 7300 3867 50  0000 C CNN
F 1 "74LVC1G74" H 7300 3776 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 7750 3450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 7750 3450 50  0001 C CNN
	1    7300 3450
	1    0    0    -1  
$EndComp
Text Label 4400 4400 0    50   ~ 0
~INH
Text Label 4950 5100 2    50   ~ 0
~INH
Text Label 4950 5200 2    50   ~ 0
~IRQ0
Text Notes 8150 2500 0    63   ~ 13
6502 users beware!
Text Notes 8150 2800 0    50   ~ 0
On the CFT, the semantics of FI (and thus, STI and CLI) are reversed!\nThe FI is te interrupt ALLOW flag. STI sets it, allowing interrupts; CLI\nclears it, masking interrupts.
$Comp
L Connector:TestPoint TP2
U 1 1 5ECB8174
P 8600 3300
F 0 "TP2" H 8550 3550 50  0000 L CNN
F 1 "TestPoint" H 8658 3327 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 8800 3300 50  0001 C CNN
F 3 "~" H 8800 3300 50  0001 C CNN
	1    8600 3300
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5ED75C31
P 6050 5100
F 0 "TP3" H 6050 5334 50  0000 C CNN
F 1 "TestPoint" H 6108 5127 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6250 5100 50  0001 C CNN
F 3 "~" H 6250 5100 50  0001 C CNN
	1    6050 5100
	1    0    0    -1  
$EndComp
Connection ~ 6050 5100
Text Notes 6600 4700 0    79   ~ 16
Jump to Interrupt Handler
Text Notes 5050 4700 0    79   ~ 16
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
AR Path="/5F67D4B5/5ED81F88" Ref="U15"  Part="2" 
F 0 "U15" H 1579 6496 50  0000 L CNN
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
AR Path="/5F67D4B5/5ED8212B" Ref="C22"  Part="1" 
F 0 "C22" H 959 6496 50  0000 R CNN
F 1 "100nF" H 959 6405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1050 6450 50  0001 C CNN
F 3 "~" H 1050 6450 50  0001 C CNN
	1    1050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0139
U 1 1 5ED82132
P 1050 6350
F 0 "#PWR0139" H 1050 6200 50  0001 C CNN
F 1 "+5V" H 1065 6523 50  0000 C CNN
F 2 "" H 1050 6350 50  0001 C CNN
F 3 "" H 1050 6350 50  0001 C CNN
	1    1050 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0145
U 1 1 5ED82138
P 1050 6550
F 0 "#PWR0145" H 1050 6300 50  0001 C CNN
F 1 "GND" H 1055 6377 50  0000 C CNN
F 2 "" H 1050 6550 50  0001 C CNN
F 3 "" H 1050 6550 50  0001 C CNN
	1    1050 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G373 U50
U 2 1 5ED83232
P 1400 7300
F 0 "U50" H 1580 7346 50  0000 L CNN
F 1 "74LVC1G373" H 1580 7255 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 1300 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1300 7325 50  0001 C CNN
	2    1400 7300
	1    0    0    -1  
$EndComp
Connection ~ 1050 7200
Connection ~ 1050 7400
$Comp
L alexios:74LVC1G08 U42
U 2 1 5ED85C6A
P 3000 6350
F 0 "U42" H 3080 6296 50  0000 L CNN
F 1 "74LVC1G08" H 3080 6205 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2650 6350 50  0001 C CNN
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
AR Path="/5F67D4B5/5ED85E2E" Ref="C47"  Part="1" 
F 0 "C47" H 2459 6496 50  0000 R CNN
F 1 "100nF" H 2459 6405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 6450 50  0001 C CNN
F 3 "~" H 2550 6450 50  0001 C CNN
	1    2550 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0140
U 1 1 5ED85E35
P 2550 6350
F 0 "#PWR0140" H 2550 6200 50  0001 C CNN
F 1 "+5V" H 2565 6523 50  0000 C CNN
F 2 "" H 2550 6350 50  0001 C CNN
F 3 "" H 2550 6350 50  0001 C CNN
	1    2550 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 5ED85E3B
P 2550 6550
F 0 "#PWR0146" H 2550 6300 50  0001 C CNN
F 1 "GND" H 2555 6377 50  0000 C CNN
F 2 "" H 2550 6550 50  0001 C CNN
F 3 "" H 2550 6550 50  0001 C CNN
	1    2550 6550
	1    0    0    -1  
$EndComp
Connection ~ 2550 6550
Connection ~ 2550 6350
$Comp
L alexios:74LVC1G74 U41
U 2 1 5ED8B0CA
P 2900 7300
F 0 "U41" H 3080 7346 50  0000 L CNN
F 1 "74LVC1G74" H 3080 7255 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 3350 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 3350 7300 50  0001 C CNN
	2    2900 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U13
U 2 1 5ED8B6E9
P 4400 6450
F 0 "U13" H 4580 6496 50  0000 L CNN
F 1 "74LVC1G74" H 4580 6405 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 4850 6450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 4850 6450 50  0001 C CNN
	2    4400 6450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U22
U 2 1 5ED8B785
P 4400 7250
F 0 "U22" H 4580 7296 50  0000 L CNN
F 1 "74LVC1G74" H 4580 7205 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 4850 7250 50  0001 C CNN
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
AR Path="/5F67D4B5/5ED8B8B1" Ref="C64"  Part="1" 
F 0 "C64" H 2459 7346 50  0000 R CNN
F 1 "100nF" H 2459 7255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 7300 50  0001 C CNN
F 3 "~" H 2550 7300 50  0001 C CNN
	1    2550 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0157
U 1 1 5ED8B8B8
P 2550 7200
F 0 "#PWR0157" H 2550 7050 50  0001 C CNN
F 1 "+5V" H 2565 7373 50  0000 C CNN
F 2 "" H 2550 7200 50  0001 C CNN
F 3 "" H 2550 7200 50  0001 C CNN
	1    2550 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0160
U 1 1 5ED8B8BE
P 2550 7400
F 0 "#PWR0160" H 2550 7150 50  0001 C CNN
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
AR Path="/5F67D4B5/5ED8C825" Ref="C48"  Part="1" 
F 0 "C48" H 3959 6496 50  0000 R CNN
F 1 "100nF" H 3959 6405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 6450 50  0001 C CNN
F 3 "~" H 4050 6450 50  0001 C CNN
	1    4050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0143
U 1 1 5ED8C82C
P 4050 6350
F 0 "#PWR0143" H 4050 6200 50  0001 C CNN
F 1 "+5V" H 4065 6523 50  0000 C CNN
F 2 "" H 4050 6350 50  0001 C CNN
F 3 "" H 4050 6350 50  0001 C CNN
	1    4050 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 5ED8C832
P 4050 6550
F 0 "#PWR0153" H 4050 6300 50  0001 C CNN
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
AR Path="/5F67D4B5/5ED8F21F" Ref="C63"  Part="1" 
F 0 "C63" H 3959 7296 50  0000 R CNN
F 1 "100nF" H 3959 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 7250 50  0001 C CNN
F 3 "~" H 4050 7250 50  0001 C CNN
	1    4050 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0156
U 1 1 5ED8F226
P 4050 7150
F 0 "#PWR0156" H 4050 7000 50  0001 C CNN
F 1 "+5V" H 4065 7323 50  0000 C CNN
F 2 "" H 4050 7150 50  0001 C CNN
F 3 "" H 4050 7150 50  0001 C CNN
	1    4050 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0159
U 1 1 5ED8F22C
P 4050 7350
F 0 "#PWR0159" H 4050 7100 50  0001 C CNN
F 1 "GND" H 4055 7177 50  0000 C CNN
F 2 "" H 4050 7350 50  0001 C CNN
F 3 "" H 4050 7350 50  0001 C CNN
	1    4050 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U51
U 2 1 5ED906EB
P 5950 6200
F 0 "U51" H 6080 5996 50  0000 L CNN
F 1 "74LVC1G32" H 6080 5905 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6060 6180 50  0001 C CNN
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
AR Path="/5F67D4B5/5ED908A1" Ref="C55"  Part="1" 
F 0 "C55" H 5459 6496 50  0000 R CNN
F 1 "100nF" H 5459 6405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 6450 50  0001 C CNN
F 3 "~" H 5550 6450 50  0001 C CNN
	1    5550 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0144
U 1 1 5ED908A8
P 5550 6350
F 0 "#PWR0144" H 5550 6200 50  0001 C CNN
F 1 "+5V" H 5565 6523 50  0000 C CNN
F 2 "" H 5550 6350 50  0001 C CNN
F 3 "" H 5550 6350 50  0001 C CNN
	1    5550 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0154
U 1 1 5ED908AE
P 5550 6550
F 0 "#PWR0154" H 5550 6300 50  0001 C CNN
F 1 "GND" H 5555 6377 50  0000 C CNN
F 2 "" H 5550 6550 50  0001 C CNN
F 3 "" H 5550 6550 50  0001 C CNN
	1    5550 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ED919E5
P 5550 7200
AR Path="/5CC0D65F/5ED919E5" Ref="C?"  Part="1" 
AR Path="/5ED919E5" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED919E5" Ref="C62"  Part="1" 
F 0 "C62" H 5459 7246 50  0000 R CNN
F 1 "100nF" H 5459 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 7200 50  0001 C CNN
F 3 "~" H 5550 7200 50  0001 C CNN
	1    5550 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0155
U 1 1 5ED919EC
P 5550 7100
F 0 "#PWR0155" H 5550 6950 50  0001 C CNN
F 1 "+5V" H 5565 7273 50  0000 C CNN
F 2 "" H 5550 7100 50  0001 C CNN
F 3 "" H 5550 7100 50  0001 C CNN
	1    5550 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0158
U 1 1 5ED919F2
P 5550 7300
F 0 "#PWR0158" H 5550 7050 50  0001 C CNN
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
Wire Notes Line width 24 style solid
	8050 2300 11050 2300
Wire Notes Line width 24 style solid
	8050 2300 8050 2950
Wire Notes Line width 24 style solid
	11050 2950 8050 2950
Wire Notes Line width 24 style solid
	11050 2950 11050 2300
Wire Wire Line
	3000 3800 3000 5300
Wire Wire Line
	3000 3800 3500 3800
Connection ~ 3000 5300
$Comp
L power:+5V #PWR074
U 1 1 5EDB9385
P 4950 5400
F 0 "#PWR074" H 4950 5250 50  0001 C CNN
F 1 "+5V" V 4965 5528 50  0000 L CNN
F 2 "" H 4950 5400 50  0001 C CNN
F 3 "" H 4950 5400 50  0001 C CNN
	1    4950 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 3800 5600 3800
Wire Wire Line
	5600 3900 5100 3900
Wire Wire Line
	5100 3400 5100 3900
Wire Wire Line
	6050 3850 6150 3850
Wire Wire Line
	6150 3850 6150 3600
Text Label 5600 3900 2    50   ~ 0
~ACTION-CLI
Text Notes 800  850  0    98   ~ 20
The Interrupt State Machine
Text Notes 800  1700 0    50   ~ 0
The interrupt state machine accepts interrupts and notifies the Control Unit about them. The CFT has a single maskable interrupt. It is signalled by a low level\non ~IRQ~. If the FI flag has been set with SEI, the interrupt request is registered and the state machine is armed. The Control Unit must be allowed to complete\nits current instruction, so we wait until ~END~ is asserted. On the rising edge of CLK4 while ~END~ is low, the ~IRQSµC~ line is asserted and the Microcode\nSequencer enters the interrupt handling micro-program.\n\nExecuting the CLI instruction clears any pending interrupts and disables future ones. The interrupt handling micro-program does this automatically before\njumping to the Interrupt Service Routine vector.\n\nThe FI flag can be set from the Flag Unit. When ~FLAGWE~ is strobed, the value of IBUS15 is used to set FI.
Wire Notes Line width 24 style solid
	5550 2100 7600 2100
Wire Notes Line width 24 style solid
	5550 2100 5550 2700
Wire Notes Line width 24 style solid
	7600 2700 5550 2700
Wire Notes Line width 24 style solid
	7600 2700 7600 2100
Text Notes 8150 6550 0    50   ~ 0
~IRQS~ and ~IRQµC~ are semantically the same signal. The former is\noutput to the bus. The latter is for the Microcode Store. We drive\nthem separately to keep the capacitance down and because the one\ngoing to the Microcode Sequencer is more important and must be\nless loaded (and thus rise faster). 
Text Notes 8150 6050 0    63   ~ 13
~IRQS~ and ~IRQSµC~
Wire Notes Line width 24 style solid
	8050 5800 11050 5800
Wire Notes Line width 24 style solid
	8050 5800 8050 6700
Wire Notes Line width 24 style solid
	11050 6700 8050 6700
Wire Notes Line width 24 style solid
	11050 6700 11050 5800
$Comp
L alexios:74LVC1G04 U?
U 2 1 5E53BCA0
P 5900 7200
AR Path="/5E36D9C8/5E53BCA0" Ref="U?"  Part="2" 
AR Path="/5F67D4B5/5E53BCA0" Ref="U40"  Part="2" 
F 0 "U40" H 6080 7246 50  0000 L CNN
F 1 "74LVC1G04" H 6080 7155 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5900 7200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 5900 7200 50  0001 C CNN
	2    5900 7200
	1    0    0    -1  
$EndComp
Connection ~ 5550 7300
Connection ~ 5550 7100
Wire Wire Line
	4500 3500 5000 3500
Wire Wire Line
	5000 3500 5000 4200
Wire Wire Line
	5000 4200 8850 4200
Text HLabel 8850 4200 2    50   Output ~ 0
~ACTION-IDX
Text Label 4550 3500 0    50   ~ 0
~ACTION-IDX
Text Notes 8400 4100 0    50   ~ 0
This is used to select addressing modes.
Text Notes 8400 3200 0    50   ~ 0
This is output to the Flag Unit.
Text Label 6500 5100 0    50   ~ 0
~RESET
Wire Wire Line
	4550 4400 4350 4400
$Comp
L alexios:74LVC1G08 U25
U 1 1 5ED6CD5B
P 4700 4400
F 0 "U25" H 4625 4575 50  0000 C CNN
F 1 "74LVC1G08" H 4625 4666 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4350 4400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 4350 4400 50  0001 C CNN
	1    4700 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 4350 6150 4350
Wire Wire Line
	6150 4350 6150 3850
Connection ~ 6150 3850
Wire Wire Line
	5000 4450 8050 4450
Text Label 5100 4350 0    50   ~ 0
~RESET-OR-CLI
Text Label 7800 3300 0    50   ~ 0
~INH₀
Text Label 5100 4450 0    50   ~ 0
~INH₀
$Comp
L Device:C_Small C?
U 1 1 5ED8BD3E
P 9950 5300
AR Path="/5CC0D65F/5ED8BD3E" Ref="C?"  Part="1" 
AR Path="/5ED8BD3E" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED8BD3E" Ref="C4"  Part="1" 
F 0 "C4" H 9859 5346 50  0000 R CNN
F 1 "100nF" H 9859 5255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 5300 50  0001 C CNN
F 3 "~" H 9950 5300 50  0001 C CNN
	1    9950 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 5ED8BD44
P 9950 5200
F 0 "#PWR0109" H 9950 5050 50  0001 C CNN
F 1 "+5V" H 9965 5373 50  0000 C CNN
F 2 "" H 9950 5200 50  0001 C CNN
F 3 "" H 9950 5200 50  0001 C CNN
	1    9950 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5ED8BD4A
P 9950 5400
F 0 "#PWR0124" H 9950 5150 50  0001 C CNN
F 1 "GND" H 9955 5227 50  0000 C CNN
F 2 "" H 9950 5400 50  0001 C CNN
F 3 "" H 9950 5400 50  0001 C CNN
	1    9950 5400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U25
U 2 1 5ED8D07D
P 10400 5200
F 0 "U25" H 10480 5146 50  0000 L CNN
F 1 "74LVC1G08" H 10480 5055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 10050 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 10050 5200 50  0001 C CNN
	2    10400 5200
	1    0    0    -1  
$EndComp
Connection ~ 9950 5400
Connection ~ 9950 5200
Connection ~ 8600 3300
Wire Wire Line
	8600 3300 8850 3300
Wire Wire Line
	8050 3300 8050 4450
Wire Bus Line
	3050 2850 3050 3600
$EndSCHEMATC
