EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 17
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
P 3600 7200
AR Path="/5CC0D65F/5DEFC7E0" Ref="C?"  Part="1" 
AR Path="/5DEFC7E0" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7E0" Ref="C1403"  Part="1" 
F 0 "C1403" H 3509 7246 50  0000 R CNN
F 1 "100nF" H 3509 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3600 7200 50  0001 C CNN
F 3 "~" H 3600 7200 50  0001 C CNN
	1    3600 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01418
U 1 1 5F85F21B
P 3600 7100
F 0 "#PWR01418" H 3600 6950 50  0001 C CNN
F 1 "+5V" H 3615 7273 50  0000 C CNN
F 2 "" H 3600 7100 50  0001 C CNN
F 3 "" H 3600 7100 50  0001 C CNN
	1    3600 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01422
U 1 1 5F85F700
P 3600 7300
F 0 "#PWR01422" H 3600 7050 50  0001 C CNN
F 1 "GND" H 3605 7127 50  0000 C CNN
F 2 "" H 3600 7300 50  0001 C CNN
F 3 "" H 3600 7300 50  0001 C CNN
	1    3600 7300
	1    0    0    -1  
$EndComp
Text HLabel 1250 2300 0    50   Input ~ 0
~RESET
Text HLabel 9250 3300 2    50   Output ~ 0
FI
Wire Wire Line
	1600 4750 1600 4900
Text Notes 6850 2900 0    79   ~ 16
Interrupt Flag
Text HLabel 9300 4700 2    50   Output ~ 0
~IRQSµC
Text HLabel 1250 2400 0    50   Input ~ 0
IBUS15
Text Label 1350 2400 0    50   ~ 0
IBUS15
Text Notes 1750 2400 0    50   ~ 0
(FI bit for retrieving FI from stack)
Text HLabel 1250 2500 0    50   Input ~ 0
~WRITE-FL
Text Label 1350 2500 0    50   ~ 0
~WRITE-FL
Text Notes 5650 2000 0    63   ~ 13
Microcode Assumption
Text Notes 5650 2250 0    50   ~ 0
~ACTION_STI~ and ~ACTION_CLI~ remain de-asserted\nwhile flags are being written using ~FLAGWE~.
Text Label 1800 2700 2    50   ~ 0
ACTION[0..3]
Wire Bus Line
	1250 2700 1800 2700
Text HLabel 1250 2700 0    50   Input ~ 0
ACTION[0..3]
Text HLabel 1250 4900 0    50   Input ~ 0
~IRQ
Text HLabel 1250 3000 0    50   Input ~ 0
CLK4
Text Label 1300 4900 0    50   ~ 0
~IRQ
Text Notes 2400 6550 0    50   ~ 0
Interrupts are very prone to metastability. Using two flip-flops\nhere greatly reduces the probability of this happening. Normally,\nyou use the same clock for metastability protection, but in this case\nwe can use CLK3 and CLK4 because the rising edge of CLK3 is\nguaranteed to lead the rising edge of CLK4 by 62.5ns, greater than\nthe set-up time on the HC or AC family. We still use the AC family\nbecause its set-up time is shorter, so the chance of metastability is\nlower.
Text HLabel 1250 3600 0    50   Input ~ 0
~END
Text Label 6000 4900 0    50   ~ 0
ENDCP
Text Label 6000 4800 0    50   ~ 0
~IRQR
Wire Wire Line
	6000 4900 6300 4900
$Comp
L power:+5V #PWR01406
U 1 1 5EC5F9F2
P 6850 5000
F 0 "#PWR01406" H 6850 4850 50  0001 C CNN
F 1 "+5V" V 6865 5128 50  0000 L CNN
F 2 "" H 6850 5000 50  0001 C CNN
F 3 "" H 6850 5000 50  0001 C CNN
	1    6850 5000
	0    -1   -1   0   
$EndComp
Text Label 8250 4700 2    50   ~ 0
~IRQSµC
Wire Wire Line
	6000 4700 6500 4700
Text Label 7800 3300 0    50   ~ 0
FI
Text Label 6350 3400 0    50   ~ 0
IBUS15
Text Label 6350 3300 0    50   ~ 0
~STI
Wire Wire Line
	6350 3600 6850 3600
Wire Wire Line
	5300 3400 5300 2400
Wire Wire Line
	5300 2400 1250 2400
Wire Wire Line
	5300 3400 6850 3400
Wire Wire Line
	5400 3500 5400 2500
Wire Wire Line
	5400 2500 1250 2500
Wire Wire Line
	5400 3500 6850 3500
Text Label 5400 3100 1    50   ~ 0
~WRITE-FL
Text Label 5300 3100 1    50   ~ 0
IBUS15
Text Label 1350 2300 0    50   ~ 0
~RESET
NoConn ~ 7750 3600
Text Notes 8100 2100 0    63   ~ 13
6502 users beware!
Text Notes 8100 2400 0    50   ~ 0
On the CFT, the semantics of FI (and thus, STI and CLI) are reversed!\nThe FI is te interrupt ALLOW flag. STI sets it, allowing interrupts; CLI\nclears it, masking interrupts.
Text Notes 6650 4300 0    79   ~ 16
Jump to Interrupt Handler
Text Notes 4150 4400 0    79   ~ 16
Pending IRQ
$Comp
L Device:C_Small C?
U 1 1 5ED8212B
P 1000 7200
AR Path="/5CC0D65F/5ED8212B" Ref="C?"  Part="1" 
AR Path="/5ED8212B" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED8212B" Ref="C1401"  Part="1" 
F 0 "C1401" H 909 7246 50  0000 R CNN
F 1 "100nF" H 909 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1000 7200 50  0001 C CNN
F 3 "~" H 1000 7200 50  0001 C CNN
	1    1000 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01408
U 1 1 5ED82132
P 1000 7100
F 0 "#PWR01408" H 1000 6950 50  0001 C CNN
F 1 "+5V" H 1015 7273 50  0000 C CNN
F 2 "" H 1000 7100 50  0001 C CNN
F 3 "" H 1000 7100 50  0001 C CNN
	1    1000 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01412
U 1 1 5ED82138
P 1000 7300
F 0 "#PWR01412" H 1000 7050 50  0001 C CNN
F 1 "GND" H 1005 7127 50  0000 C CNN
F 2 "" H 1000 7300 50  0001 C CNN
F 3 "" H 1000 7300 50  0001 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5ED8C825
P 2300 7200
AR Path="/5CC0D65F/5ED8C825" Ref="C?"  Part="1" 
AR Path="/5ED8C825" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5ED8C825" Ref="C1402"  Part="1" 
F 0 "C1402" H 2209 7246 50  0000 R CNN
F 1 "100nF" H 2209 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7200 50  0001 C CNN
F 3 "~" H 2300 7200 50  0001 C CNN
	1    2300 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01410
U 1 1 5ED8C82C
P 2300 7100
F 0 "#PWR01410" H 2300 6950 50  0001 C CNN
F 1 "+5V" H 2315 7273 50  0000 C CNN
F 2 "" H 2300 7100 50  0001 C CNN
F 3 "" H 2300 7100 50  0001 C CNN
	1    2300 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01414
U 1 1 5ED8C832
P 2300 7300
F 0 "#PWR01414" H 2300 7050 50  0001 C CNN
F 1 "GND" H 2305 7127 50  0000 C CNN
F 2 "" H 2300 7300 50  0001 C CNN
F 3 "" H 2300 7300 50  0001 C CNN
	1    2300 7300
	1    0    0    -1  
$EndComp
Wire Notes Line width 24 style solid
	8000 1900 11000 1900
Wire Notes Line width 24 style solid
	8000 1900 8000 2550
Wire Notes Line width 24 style solid
	11000 2550 8000 2550
Wire Notes Line width 24 style solid
	11000 2550 11000 1900
Text Label 6350 3600 0    50   ~ 0
~CLI
Text Notes 800  850  0    98   ~ 20
The Interrupt State Machine
Text Notes 800  1700 0    50   ~ 0
The interrupt state machine accepts interrupts and notifies the Control Unit about them. The CFT has a single maskable interrupt. It is signalled by a low level\non ~IRQ~. If the FI flag has been set with SEI, the interrupt request is registered and the state machine is armed. The Control Unit must be allowed to complete\nits current instruction, so we wait until ~END~ is asserted. On the rising edge of CLK4 while ~END~ is low, the ~IRQSµC~ line is asserted and the Microcode\nSequencer enters the interrupt handling micro-program.\n\nExecuting the CLI instruction clears any pending interrupts and disables future ones. The interrupt handling micro-program does this automatically before\njumping to the Interrupt Service Routine vector.\n\nThe FI flag can be set from the Flag Unit. When ~FLAGWE~ is strobed, the value of IBUS15 is used to set FI.
Wire Notes Line width 24 style solid
	5550 1800 7600 1800
Wire Notes Line width 24 style solid
	5550 1800 5550 2400
Wire Notes Line width 24 style solid
	7600 2400 5550 2400
Wire Notes Line width 24 style solid
	7600 2400 7600 1800
Text Notes 8600 4250 0    50   ~ 0
~IRQS~ and ~IRQµC~ are semantically the same signal.\n~IRQS~ is output to the bus. ~IRQµC~ is for the Control\nStore. We drive them separately to keep the capacitance\ndown and because the one going to the Microcode\nSequencer is more important and must be less loaded\n(and thus rise faster). 
Text Notes 8600 3650 0    63   ~ 13
~IRQS~ and ~IRQSµC~
Wire Notes Line width 24 style solid
	8450 3400 10900 3400
Wire Notes Line width 24 style solid
	8450 3400 8450 4350
Text HLabel 4300 3600 2    50   Output ~ 0
~IR-IDX
Text Notes 8400 3200 0    50   ~ 0
This is output to the Flag Unit.
Wire Wire Line
	3450 3200 4050 3200
Wire Wire Line
	3450 3000 4050 3000
Wire Wire Line
	3450 3300 4300 3300
Wire Wire Line
	3450 3400 4300 3400
Wire Wire Line
	3450 3500 4300 3500
Wire Wire Line
	3450 3600 4300 3600
Wire Wire Line
	3450 2900 4050 2900
Wire Wire Line
	3450 3100 4050 3100
Wire Wire Line
	2200 3100 2550 3100
Text Label 2200 2900 0    50   ~ 0
~RESET
Text Label 1350 3000 0    50   ~ 0
CLK4
Text Label 2200 3600 0    50   ~ 0
~END
NoConn ~ 2550 3800
Text Label 4050 3200 2    50   ~ 0
ENDCP
Text Label 4050 3000 2    50   ~ 0
~INH
Text Label 2200 3200 0    50   ~ 0
ACTION0
Text Label 2200 3300 0    50   ~ 0
ACTION1
Text Label 2200 3400 0    50   ~ 0
ACTION2
Text Label 2200 3500 0    50   ~ 0
ACTION3
Text Label 4050 3300 2    50   ~ 0
~ACTION-DECDR
Text Label 4050 3400 2    50   ~ 0
~ACTION-INCDR
Text Label 4050 3500 2    50   ~ 0
~ACTION-INCPC
Text Label 4050 3600 2    50   ~ 0
~IR-IDX
Text Label 4050 3100 2    50   ~ 0
~CLI
Text Label 4050 2900 2    50   ~ 0
~STI
Wire Wire Line
	2200 3200 2550 3200
Wire Wire Line
	2200 3300 2550 3300
Wire Wire Line
	2200 3400 2550 3400
Wire Wire Line
	2200 3500 2550 3500
$Comp
L power:+5V #PWR01402
U 1 1 5DEFC7B4
P 1600 4550
F 0 "#PWR01402" H 1600 4400 50  0001 C CNN
F 1 "+5V" H 1615 4723 50  0000 C CNN
F 2 "" H 1600 4550 50  0001 C CNN
F 3 "" H 1600 4550 50  0001 C CNN
	1    1600 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 4900 1600 4900
Text Label 1350 3600 0    50   ~ 0
~END
Wire Wire Line
	1250 2300 2150 2300
Text HLabel 4300 3500 2    50   Output ~ 0
~ACTION-INCPC
Text HLabel 4300 3300 2    50   Output ~ 0
~ACTION-DECDR
Text HLabel 4300 3400 2    50   Output ~ 0
~ACTION-INCDR
Wire Wire Line
	6850 3300 6350 3300
Text Label 6350 3500 0    50   ~ 0
~WRITE-FL
Wire Wire Line
	2150 2900 2150 2300
Wire Wire Line
	2150 2900 2550 2900
Text Label 2200 3100 0    50   ~ 0
FI
$Comp
L alexios:74HC74 U1402
U 1 1 605A7AD6
P 7300 3450
F 0 "U1402" H 7300 3867 50  0000 C CNN
F 1 "74HC74" H 7300 3776 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7250 3600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 7250 3600 50  0001 C CNN
	1    7300 3450
	1    0    0    1   
$EndComp
$Comp
L alexios:74HC74 U1402
U 2 1 605AA791
P 7300 5650
F 0 "U1402" H 7300 6067 50  0000 C CNN
F 1 "74HC74" H 7300 5976 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7250 5800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 7250 5800 50  0001 C CNN
	2    7300 5650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC74 U1403
U 2 1 606593BD
P 2950 4950
F 0 "U1403" H 2950 5367 50  0000 C CNN
F 1 "74AC74" H 2950 5276 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 2900 5100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2900 5100 50  0001 C CNN
	2    2950 4950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC74 U1403
U 3 1 60659BE2
P 3950 7200
F 0 "U1403" H 4130 7246 50  0000 L CNN
F 1 "74AC74" H 4130 7155 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 3900 7350 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3900 7350 50  0001 C CNN
	3    3950 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5000 1250 5000
Text Label 1300 5000 0    50   ~ 0
CLK3
$Comp
L power:+5V #PWR0141
U 1 1 6065F818
P 2500 5100
F 0 "#PWR0141" H 2500 4950 50  0001 C CNN
F 1 "+5V" V 2515 5228 50  0000 L CNN
F 2 "" H 2500 5100 50  0001 C CNN
F 3 "" H 2500 5100 50  0001 C CNN
	1    2500 5100
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0142
U 1 1 60660F10
P 4250 5100
F 0 "#PWR0142" H 4250 4950 50  0001 C CNN
F 1 "+5V" V 4265 5228 50  0000 L CNN
F 2 "" H 4250 5100 50  0001 C CNN
F 3 "" H 4250 5100 50  0001 C CNN
	1    4250 5100
	0    -1   -1   0   
$EndComp
Text HLabel 1250 5000 0    50   Input ~ 0
CLK3
$Comp
L Device:R_Small R?
U 1 1 5DEFC7B3
P 1600 4650
AR Path="/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7B3" Ref="R1401"  Part="1" 
F 0 "R1401" H 1659 4696 50  0000 L CNN
F 1 "4.7kΩ" H 1659 4605 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1600 4650 50  0001 C CNN
F 3 "~" H 1600 4650 50  0001 C CNN
	1    1600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4800 3700 4800
Wire Wire Line
	3700 4800 3700 4900
Wire Wire Line
	4050 4800 4250 4800
Text Label 4050 4800 0    50   ~ 0
~INH
Text Notes 2400 5500 0    63   ~ 13
Caution: AC Family part!
Connection ~ 1600 4900
Wire Wire Line
	1600 4900 2500 4900
Wire Wire Line
	2300 4800 2500 4800
Text Label 2300 4800 0    50   ~ 0
~INH
Text Label 4050 5000 0    50   ~ 0
CLK4
Text Label 2850 4200 0    50   ~ 0
CLK4
$Comp
L alexios:74AC74 U1403
U 1 1 606579EE
P 4700 4950
F 0 "U1403" H 4700 5367 50  0000 C CNN
F 1 "74AC74" H 4700 5276 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 4650 5100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4650 5100 50  0001 C CNN
	1    4700 4950
	1    0    0    1   
$EndComp
Connection ~ 3600 7100
Connection ~ 3600 7300
Text Notes 2600 4400 0    79   ~ 16
Input Stage
Wire Wire Line
	3950 5000 3950 4200
NoConn ~ 7750 5000
Text Notes 2400 5850 0    63   ~ 13
Metastability
Wire Notes Line width 24 style solid
	2300 5650 5200 5650
Wire Notes Line width 24 style solid
	2300 5650 2300 6650
Wire Notes Line width 24 style solid
	5200 6650 2300 6650
Wire Notes Line width 24 style solid
	5200 6650 5200 5650
$Comp
L alexios:74AC74 U1404
U 2 1 60709A8C
P 7300 4850
F 0 "U1404" H 7300 5267 50  0000 C CNN
F 1 "74AC74" H 7300 5176 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7250 5000 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7250 5000 50  0001 C CNN
	2    7300 4850
	1    0    0    -1  
$EndComp
Wire Notes Line width 24 style solid
	10900 4350 8450 4350
Wire Notes Line width 24 style solid
	10900 4350 10900 3400
Wire Wire Line
	7750 4700 9300 4700
Text Label 8600 5500 2    50   ~ 0
~IRQS
Text HLabel 9300 5500 2    50   Output ~ 0
~IRQS
Text Notes 8000 5100 0    50   ~ 0
Note: these two FFs are in\ndifferent packages and \ndifferent families!
Text Notes 7450 5350 0    118  ~ 24
←
Text Notes 7450 4550 0    118  ~ 24
←
Wire Notes Line
	7650 5250 7950 5100
Wire Notes Line
	7650 4500 7950 4900
Wire Wire Line
	7750 3300 9250 3300
$Comp
L alexios:16V8 U1401
U 2 1 6077605B
P 1350 7200
F 0 "U1401" H 1530 7246 50  0000 L CNN
F 1 "16V8" H 1530 7155 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 1350 7200 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 1350 7200 50  0001 C CNN
F 4 "SIGNTR" V 1350 7300 50  0001 C CNB "Signature"
F 5 "filename.jed" H 1350 6550 50  0001 C CNN "Image Filename"
	2    1350 7200
	1    0    0    -1  
$EndComp
Connection ~ 1000 7300
Connection ~ 1000 7100
Wire Wire Line
	6500 4700 6500 5500
Wire Wire Line
	6500 5500 6850 5500
Connection ~ 6500 4700
Wire Wire Line
	6500 4700 6850 4700
Wire Wire Line
	6400 4800 6400 5600
Wire Wire Line
	6400 5600 6850 5600
Connection ~ 6400 4800
Wire Wire Line
	6400 4800 6850 4800
Wire Wire Line
	6300 5700 6850 5700
$Comp
L power:+5V #PWR0144
U 1 1 60792207
P 6850 5800
F 0 "#PWR0144" H 6850 5650 50  0001 C CNN
F 1 "+5V" V 6865 5928 50  0000 L CNN
F 2 "" H 6850 5800 50  0001 C CNN
F 3 "" H 6850 5800 50  0001 C CNN
	1    6850 5800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 4800 6400 4800
Wire Wire Line
	6300 4900 6300 5700
Connection ~ 6300 4900
Wire Wire Line
	6300 4900 6850 4900
Text Label 6000 4700 0    50   ~ 0
~RESET
Text Label 6850 4700 2    50   ~ 0
~RESET
Text Label 6850 4800 2    50   ~ 0
~IRQR
Text Label 6850 4900 2    50   ~ 0
ENDCP
Text Label 6850 5500 2    50   ~ 0
~RESET
Text Label 6850 5600 2    50   ~ 0
~IRQR
Text Label 6850 5700 2    50   ~ 0
ENDCP
NoConn ~ 3400 5100
Text Label 2200 3000 0    50   ~ 0
CLK4
Wire Wire Line
	1900 3000 1900 4200
Connection ~ 1900 3000
Wire Wire Line
	1900 3000 1250 3000
Wire Wire Line
	1900 4200 3950 4200
$Comp
L alexios:74HC74 U1402
U 3 1 60823366
P 2650 7200
F 0 "U1402" H 2830 7246 50  0000 L CNN
F 1 "74HC74" H 2830 7155 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 2600 7350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 2600 7350 50  0001 C CNN
	3    2650 7200
	1    0    0    -1  
$EndComp
Connection ~ 2300 7100
Connection ~ 2300 7300
$Comp
L Device:C_Small C?
U 1 1 6083F825
P 4900 7200
AR Path="/5CC0D65F/6083F825" Ref="C?"  Part="1" 
AR Path="/6083F825" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/6083F825" Ref="C1404"  Part="1" 
F 0 "C1404" H 4809 7246 50  0000 R CNN
F 1 "100nF" H 4809 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4900 7200 50  0001 C CNN
F 3 "~" H 4900 7200 50  0001 C CNN
	1    4900 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0145
U 1 1 6083F82B
P 4900 7100
F 0 "#PWR0145" H 4900 6950 50  0001 C CNN
F 1 "+5V" H 4915 7273 50  0000 C CNN
F 2 "" H 4900 7100 50  0001 C CNN
F 3 "" H 4900 7100 50  0001 C CNN
	1    4900 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 6083F831
P 4900 7300
F 0 "#PWR0146" H 4900 7050 50  0001 C CNN
F 1 "GND" H 4905 7127 50  0000 C CNN
F 2 "" H 4900 7300 50  0001 C CNN
F 3 "" H 4900 7300 50  0001 C CNN
	1    4900 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC74 U1404
U 3 1 6083F837
P 5250 7200
F 0 "U1404" H 5430 7246 50  0000 L CNN
F 1 "74AC74" H 5430 7155 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5200 7350 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5200 7350 50  0001 C CNN
	3    5250 7200
	1    0    0    -1  
$EndComp
Connection ~ 4900 7100
Connection ~ 4900 7300
Text Notes 5700 5300 2    50   ~ 0
IRQ Received
Wire Wire Line
	1900 3000 2550 3000
$Comp
L power:GND #PWR01
U 1 1 60CEB832
P 5850 5150
F 0 "#PWR01" H 5850 4900 50  0001 C CNN
F 1 "GND" H 5855 4977 50  0000 C CNN
F 2 "" H 5850 5150 50  0001 C CNN
F 3 "" H 5850 5150 50  0001 C CNN
	1    5850 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5100 5850 5100
Wire Wire Line
	5850 5100 5850 5150
Wire Wire Line
	7750 5800 7800 5800
Wire Wire Line
	7800 5800 7800 5850
$Comp
L Device:R_Small R?
U 1 1 60CFE6BE
P 7800 5950
AR Path="/61F95ACC/60CFE6BE" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/60CFE6BE" Ref="R1404"  Part="1" 
F 0 "R1404" H 7741 5996 50  0000 R CNN
F 1 "680Ω" H 7741 5905 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7800 5950 50  0001 C CNN
F 3 "~" H 7800 5950 50  0001 C CNN
	1    7800 5950
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 60CFE6C4
P 7800 6200
AR Path="/61F95ACC/60CFE6C4" Ref="D?"  Part="1" 
AR Path="/5F67D4B5/60CFE6C4" Ref="D1404"  Part="1" 
F 0 "D1404" V 7793 6082 50  0000 R CNN
F 1 "LED_ALT" H 7793 6036 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7800 6200 50  0001 C CNN
F 3 "~" H 7800 6200 50  0001 C CNN
	1    7800 6200
	0    -1   -1   0   
$EndComp
Text Notes 7650 6150 2    50   ~ 0
IRQ Triggered
$Comp
L power:GND #PWR02
U 1 1 60CFE6CB
P 7800 6400
F 0 "#PWR02" H 7800 6150 50  0001 C CNN
F 1 "GND" H 7805 6227 50  0000 C CNN
F 2 "" H 7800 6400 50  0001 C CNN
F 3 "" H 7800 6400 50  0001 C CNN
	1    7800 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 6350 7800 6400
$Comp
L Device:LED_ALT D?
U 1 1 60CD7F25
P 5600 5100
AR Path="/61F95ACC/60CD7F25" Ref="D?"  Part="1" 
AR Path="/5F67D4B5/60CD7F25" Ref="D1402"  Part="1" 
F 0 "D1402" H 5550 4950 50  0000 C CNN
F 1 "LED_ALT" H 5593 4936 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5600 5100 50  0001 C CNN
F 3 "~" H 5600 5100 50  0001 C CNN
	1    5600 5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5150 5100 5250 5100
$Comp
L Device:R_Small R?
U 1 1 60CD7F1F
P 5350 5100
AR Path="/61F95ACC/60CD7F1F" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/60CD7F1F" Ref="R1402"  Part="1" 
F 0 "R1402" V 5154 5100 50  0000 C CNN
F 1 "680Ω" V 5245 5100 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 5100 50  0001 C CNN
F 3 "~" H 5350 5100 50  0001 C CNN
	1    5350 5100
	0    -1   1    0   
$EndComp
$Comp
L alexios:16V8 U1401
U 1 1 6077549F
P 3000 3350
F 0 "U1401" H 3000 4100 50  0000 C CNN
F 1 "16V8" H 3000 4000 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 3000 3350 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 3000 3350 50  0001 C CNN
F 4 "ISMCTL00" V 3000 3400 50  0000 C CNB "Signature"
F 5 "ism-control.jed" H 3000 2700 50  0000 C CNN "Image Filename"
	1    3000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3600 2550 3600
Wire Wire Line
	1250 3700 2550 3700
Text HLabel 1250 3700 0    50   Input ~ 0
IDXEN
Text Label 1350 3700 0    50   ~ 0
~IDXEN
Text Label 2200 3700 0    50   ~ 0
~IDXEN
Wire Wire Line
	3950 5000 4250 5000
Text Label 3450 4800 0    50   ~ 0
~IRQ'
Wire Wire Line
	4250 4900 3700 4900
Text Notes 7700 4500 0    50   ~ 0
U1404A is used in the Skip & Branch Unit.
$Comp
L Device:C_Small C?
U 1 1 61212649
P 8850 5700
AR Path="/5E36D9C8/61212649" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/61212649" Ref="C1405"  Part="1" 
F 0 "C1405" H 8800 5800 50  0000 R CNN
F 1 "120pF" H 8800 5600 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8850 5700 50  0001 C CNN
F 3 "~" H 8850 5700 50  0001 C CNN
	1    8850 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 5800 8850 5850
$Comp
L Device:R_Small R?
U 1 1 61212650
P 8850 5950
AR Path="/5E36D9C8/61212650" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/61212650" Ref="R1405"  Part="1" 
F 0 "R1405" H 8800 5950 50  0000 R CNN
F 1 "100Ω" H 8800 5850 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8850 5950 50  0001 C CNN
F 3 "~" H 8850 5950 50  0001 C CNN
	1    8850 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 5500 8850 5500
Wire Wire Line
	8850 5600 8850 5500
Connection ~ 8850 5500
Wire Wire Line
	8850 5500 9300 5500
$Comp
L power:GND #PWR0176
U 1 1 61218F87
P 8850 6100
F 0 "#PWR0176" H 8850 5850 50  0001 C CNN
F 1 "GND" H 8855 5927 50  0000 C CNN
F 2 "" H 8850 6100 50  0001 C CNN
F 3 "" H 8850 6100 50  0001 C CNN
	1    8850 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 6100 8850 6050
$EndSCHEMATC
