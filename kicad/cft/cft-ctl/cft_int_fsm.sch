EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 13
Title "CFT Homebrew 16-bit Minicomputer"
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
U 1 1 5F68A0E8
P 1050 7250
AR Path="/5CC0D65F/5F68A0E8" Ref="C?"  Part="1" 
AR Path="/5F68A0E8" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F68A0E8" Ref="C48"  Part="1" 
F 0 "C48" H 959 7296 50  0000 R CNN
F 1 "100nF" H 959 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 7250 50  0001 C CNN
F 3 "~" H 1050 7250 50  0001 C CNN
	1    1050 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0180
U 1 1 5DEFC7DB
P 1050 7150
F 0 "#PWR0180" H 1050 7000 50  0001 C CNN
F 1 "+5V" H 1065 7323 50  0000 C CNN
F 2 "" H 1050 7150 50  0001 C CNN
F 3 "" H 1050 7150 50  0001 C CNN
	1    1050 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0181
U 1 1 5DEFC7DC
P 1050 7350
F 0 "#PWR0181" H 1050 7100 50  0001 C CNN
F 1 "GND" H 1055 7177 50  0000 C CNN
F 2 "" H 1050 7350 50  0001 C CNN
F 3 "" H 1050 7350 50  0001 C CNN
	1    1050 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DEFC7DD
P 2500 7250
AR Path="/5CC0D65F/5DEFC7DD" Ref="C?"  Part="1" 
AR Path="/5DEFC7DD" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7DD" Ref="C55"  Part="1" 
F 0 "C55" H 2409 7296 50  0000 R CNN
F 1 "100nF" H 2409 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 7250 50  0001 C CNN
F 3 "~" H 2500 7250 50  0001 C CNN
	1    2500 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0182
U 1 1 5DEFC7DE
P 2500 7150
F 0 "#PWR0182" H 2500 7000 50  0001 C CNN
F 1 "+5V" H 2515 7323 50  0000 C CNN
F 2 "" H 2500 7150 50  0001 C CNN
F 3 "" H 2500 7150 50  0001 C CNN
	1    2500 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0183
U 1 1 5DEFC7DF
P 2500 7350
F 0 "#PWR0183" H 2500 7100 50  0001 C CNN
F 1 "GND" H 2505 7177 50  0000 C CNN
F 2 "" H 2500 7350 50  0001 C CNN
F 3 "" H 2500 7350 50  0001 C CNN
	1    2500 7350
	1    0    0    -1  
$EndComp
Text HLabel 1700 2100 0    50   Input ~ 0
~ACTION-STI
$Comp
L Device:C_Small C?
U 1 1 5DEFC7E0
P 1050 6500
AR Path="/5CC0D65F/5DEFC7E0" Ref="C?"  Part="1" 
AR Path="/5DEFC7E0" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7E0" Ref="C46"  Part="1" 
F 0 "C46" H 959 6546 50  0000 R CNN
F 1 "100nF" H 959 6455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 6500 50  0001 C CNN
F 3 "~" H 1050 6500 50  0001 C CNN
	1    1050 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0184
U 1 1 5F85F21B
P 1050 6400
F 0 "#PWR0184" H 1050 6250 50  0001 C CNN
F 1 "+5V" H 1065 6573 50  0000 C CNN
F 2 "" H 1050 6400 50  0001 C CNN
F 3 "" H 1050 6400 50  0001 C CNN
	1    1050 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0185
U 1 1 5F85F700
P 1050 6600
F 0 "#PWR0185" H 1050 6350 50  0001 C CNN
F 1 "GND" H 1055 6427 50  0000 C CNN
F 2 "" H 1050 6600 50  0001 C CNN
F 3 "" H 1050 6600 50  0001 C CNN
	1    1050 6600
	1    0    0    -1  
$EndComp
Text Notes 7050 6950 0    197  ~ 39
Interrupt State Machine
Text Label 1850 2500 0    50   ~ 0
~ACTION-CLI
Text Label 1850 2100 0    50   ~ 0
~ACTION-STI
$Comp
L alexios:74LVC1G08 U42
U 1 1 5D183FAB
P 3500 2450
F 0 "U42" H 3425 2275 50  0000 C CNN
F 1 "74LVC1G08" H 3425 2184 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 3150 2450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 3150 2450 50  0001 C CNN
	1    3500 2450
	1    0    0    -1  
$EndComp
Text HLabel 1700 2500 0    50   Input ~ 0
~ACTION-CLI
Text HLabel 1700 2400 0    50   Input ~ 0
~RESET
Wire Wire Line
	1700 2500 3200 2500
Text Label 1850 2400 0    50   ~ 0
~RESET
Text Label 4550 2400 2    50   ~ 0
~RESET-OR-CLI
Text HLabel 9150 2100 2    50   Output ~ 0
FI
$Comp
L Device:C_Small C?
U 1 1 5D5F498A
P 2500 6500
AR Path="/5CC0D65F/5D5F498A" Ref="C?"  Part="1" 
AR Path="/5D5F498A" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5D5F498A" Ref="C47"  Part="1" 
F 0 "C47" H 2409 6546 50  0000 R CNN
F 1 "100nF" H 2409 6455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 6500 50  0001 C CNN
F 3 "~" H 2500 6500 50  0001 C CNN
	1    2500 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0186
U 1 1 5D5F4991
P 2500 6400
F 0 "#PWR0186" H 2500 6250 50  0001 C CNN
F 1 "+5V" H 2515 6573 50  0000 C CNN
F 2 "" H 2500 6400 50  0001 C CNN
F 3 "" H 2500 6400 50  0001 C CNN
	1    2500 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0187
U 1 1 5DEFC7B8
P 2500 6600
F 0 "#PWR0187" H 2500 6350 50  0001 C CNN
F 1 "GND" H 2505 6427 50  0000 C CNN
F 2 "" H 2500 6600 50  0001 C CNN
F 3 "" H 2500 6600 50  0001 C CNN
	1    2500 6600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U50
U 1 1 5D6227E0
P 6750 3500
F 0 "U50" H 6750 3917 50  0000 C CNN
F 1 "74AC74" H 6750 3826 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6750 3500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6750 3500 50  0001 C CNN
	1    6750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4200 5950 4200
Text Label 1900 4150 0    50   ~ 0
CLK4
Text HLabel 1750 4150 0    50   Input ~ 0
CLK4
Wire Wire Line
	3200 4150 1750 4150
$Comp
L alexios:74LVC1G32 U51
U 1 1 5DEFC7B5
P 3400 4200
F 0 "U51" H 3450 4467 50  0000 C CNN
F 1 "74LVC1G32" H 3450 4376 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 3510 4180 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3510 4180 50  0001 C CNN
	1    3400 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4250 3200 4250
$Comp
L power:+5V #PWR0188
U 1 1 5DEFC7B4
P 2200 3200
F 0 "#PWR0188" H 2200 3050 50  0001 C CNN
F 1 "+5V" H 2215 3373 50  0000 C CNN
F 2 "" H 2200 3200 50  0001 C CNN
F 3 "" H 2200 3200 50  0001 C CNN
	1    2200 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3400 2200 3450
$Comp
L Device:R_Small R?
U 1 1 5DEFC7B3
P 2200 3300
AR Path="/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEFC7B3" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7B3" Ref="R28"  Part="1" 
F 0 "R28" H 2259 3346 50  0000 L CNN
F 1 "4.7kΩ" H 2259 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2200 3300 50  0001 C CNN
F 3 "~" H 2200 3300 50  0001 C CNN
	1    2200 3300
	1    0    0    -1  
$EndComp
Text Label 1900 4250 0    50   ~ 0
~END
Text HLabel 1750 4250 0    50   Input ~ 0
~END
Wire Wire Line
	5950 3550 6300 3550
Wire Wire Line
	1750 3450 2200 3450
Text HLabel 1750 3450 0    50   Input ~ 0
~IRQ
Text Label 1900 3450 0    50   ~ 0
~IRQ
Wire Wire Line
	2200 3450 3200 3450
Connection ~ 2200 3450
Wire Wire Line
	2900 2900 2900 3350
Wire Wire Line
	2900 3350 3200 3350
Text Label 3200 3350 2    50   ~ 0
~FI
Text Label 3200 3450 2    50   ~ 0
~IRQ
$Comp
L Connector:TestPoint TP3
U 1 1 5DEFC7E3
P 5450 3750
F 0 "TP3" V 5450 3938 50  0000 L CNN
F 1 "TestPoint" H 5508 3777 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5650 3750 50  0001 C CNN
F 3 "~" H 5650 3750 50  0001 C CNN
	1    5450 3750
	0    1    1    0   
$EndComp
$Comp
L alexios:74HC74 U41
U 2 1 5D13ACC5
P 5000 3600
F 0 "U41" H 5000 4017 50  0000 C CNN
F 1 "74AC74" H 5000 3926 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5000 3600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5000 3600 50  0001 C CNN
	2    5000 3600
	1    0    0    -1  
$EndComp
Text Label 5500 3450 0    50   ~ 0
INTERRUPT
Text Label 3950 4200 0    50   ~ 0
ENDCP
Wire Wire Line
	5950 3550 5950 4200
Text Label 6300 3550 2    50   ~ 0
ENDCP
Wire Wire Line
	3750 3450 4550 3450
$Comp
L alexios:74LVC1G332 U9
U 1 1 5DCE02F5
P 3550 3400
F 0 "U9" H 3475 3664 50  0000 C CNN
F 1 "74LVC1G332" H 3475 3573 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4450 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4450 3450 50  0001 C CNN
	1    3550 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3550 1750 3550
Text HLabel 1750 3550 0    50   Input ~ 0
CLK1
Text Label 4550 3450 2    50   ~ 0
~IRQSYNC
Text Label 1900 3550 0    50   ~ 0
CLK1
Text Label 3200 3550 2    50   ~ 0
CLK1
Wire Wire Line
	5450 3450 6300 3450
$Comp
L Connector:TestPoint TP2
U 1 1 5F9349A9
P 7200 3350
F 0 "TP2" V 7200 3538 50  0000 L CNN
F 1 "TestPoint" H 7258 3377 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 7400 3350 50  0001 C CNN
F 3 "~" H 7400 3350 50  0001 C CNN
	1    7200 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 2400 2800 2400
Text Label 4550 3750 2    50   ~ 0
~RESET-OR-CLI
Wire Wire Line
	4550 3750 3800 3750
Wire Wire Line
	3800 3750 3800 2450
Text Label 4550 2100 2    50   ~ 0
~ACTION-STI
Wire Wire Line
	1700 2100 4550 2100
Wire Wire Line
	3800 2400 4550 2400
Wire Wire Line
	5600 2400 5650 2400
Connection ~ 5600 2400
Wire Wire Line
	5600 2900 2900 2900
Wire Wire Line
	5600 2400 5600 2900
Text Label 5450 2400 0    50   ~ 0
~FI
Wire Wire Line
	5450 2400 5600 2400
$Comp
L Connector:TestPoint TP1
U 1 1 5DEFC7AF
P 5650 2400
F 0 "TP1" V 5650 2588 50  0000 L CNN
F 1 "TestPoint" H 5708 2427 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5850 2400 50  0001 C CNN
F 3 "~" H 5850 2400 50  0001 C CNN
	1    5650 2400
	0    1    1    0   
$EndComp
Text Notes 6200 2300 0    50   ~ 0
This is the Interrupt Flag (interrupt handling enabled)\ndisplayed on the front panel.
Text Label 5700 2100 0    50   ~ 0
FI
Text Notes 6350 2050 0    79   ~ 16
Enabling Interrupts (~STI~)
$Comp
L power:+5V #PWR0189
U 1 1 5DEFC7BD
P 6300 3350
F 0 "#PWR0189" H 6300 3200 50  0001 C CNN
F 1 "+5V" V 6315 3478 50  0000 L CNN
F 2 "" H 6300 3350 50  0001 C CNN
F 3 "" H 6300 3350 50  0001 C CNN
	1    6300 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 5150 9650 5150
Text HLabel 9650 5150 2    50   Output ~ 0
~IRQSµC
Text HLabel 9700 3650 2    50   Output ~ 0
~IRQS
Text Notes 8050 4650 0    50   ~ 0
~IRQS~ and ~IRQµC~ are the same signal.\nThe former is output to the bus. The latter is\nfor the Microcode Store. We drive them separately\nto keep the capacitance down and because the one going\nto the Microcode Store is more important and must be\nless loaded (and thus rise faster).\n\nTODO: Drive ~IRQSµC using the leftover FF.
Wire Wire Line
	8200 3650 9700 3650
Wire Wire Line
	8000 3650 7900 3650
$Comp
L Device:R_Small R?
U 1 1 5DEFC7BE
P 8100 3650
AR Path="/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEFC7BE" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7BE" Ref="R29"  Part="1" 
F 0 "R29" V 8204 3650 50  0000 C CNN
F 1 "30Ω" V 8295 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8100 3650 50  0001 C CNN
F 3 "~" H 8100 3650 50  0001 C CNN
	1    8100 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	7900 3650 7900 5150
Connection ~ 7900 3650
Wire Wire Line
	7200 3650 7900 3650
$Comp
L alexios:74LVC1G08 U42
U 2 1 5DEFC7BF
P 1500 6400
F 0 "U42" H 1580 6346 50  0000 L CNN
F 1 "74LVC1G08" H 1580 6255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 1150 6400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 1150 6400 50  0001 C CNN
	2    1500 6400
	1    0    0    -1  
$EndComp
Connection ~ 1050 6600
Connection ~ 1050 6400
$Comp
L alexios:74LVC1G332 U55
U 2 1 5DEFC7C0
P 1500 7050
F 0 "U55" H 1580 6896 50  0000 L CNN
F 1 "74LVC1G332" H 1580 6805 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 2400 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2400 7100 50  0001 C CNN
	2    1500 7050
	1    0    0    -1  
$EndComp
Connection ~ 1050 7350
Connection ~ 1050 7150
$Comp
L alexios:74LVC1G32 U51
U 2 1 5DEFC7C1
P 2900 6250
F 0 "U51" H 3030 6046 50  0000 L CNN
F 1 "74LVC1G32" H 3030 5955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 3010 6230 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3010 6230 50  0001 C CNN
	2    2900 6250
	1    0    0    -1  
$EndComp
Connection ~ 2500 6600
Connection ~ 2500 6400
Connection ~ 2500 7150
Connection ~ 2500 7350
Wire Wire Line
	6300 3650 6050 3650
Wire Wire Line
	6050 3650 6050 4400
Wire Wire Line
	6050 4400 2800 4400
Connection ~ 2800 2400
Wire Wire Line
	2800 2400 3200 2400
Text Label 6300 3650 2    50   ~ 0
~RESET
$Comp
L Device:R_Small R?
U 1 1 5DEE33CE
P 5550 2100
AR Path="/5DEE33CE" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEE33CE" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEE33CE" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEE33CE" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEE33CE" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEE33CE" Ref="R27"  Part="1" 
F 0 "R27" V 5354 2100 50  0000 C CNN
F 1 "30Ω" V 5445 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5550 2100 50  0001 C CNN
F 3 "~" H 5550 2100 50  0001 C CNN
	1    5550 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 2100 9150 2100
Wire Wire Line
	4500 3550 4500 3650
$Comp
L power:+5V #PWR0190
U 1 1 5DEFC7C4
P 4500 3550
F 0 "#PWR0190" H 4500 3400 50  0001 C CNN
F 1 "+5V" V 4515 3678 50  0000 L CNN
F 2 "" H 4500 3550 50  0001 C CNN
F 3 "" H 4500 3550 50  0001 C CNN
	1    4500 3550
	0    -1   -1   0   
$EndComp
Connection ~ 4500 3550
Wire Wire Line
	4550 3650 4500 3650
Wire Wire Line
	4550 3550 4500 3550
Text HLabel 1700 2200 0    50   Input ~ 0
IBUS15
Wire Wire Line
	1700 2200 4550 2200
Text Label 1850 2200 0    50   ~ 0
IBUS15
Text Notes 2450 2200 0    50   ~ 0
(FI bit for retrieving FI from stack)
Wire Wire Line
	2800 4400 2800 2400
Wire Wire Line
	3650 2450 3800 2450
Connection ~ 3800 2450
Wire Wire Line
	3800 2450 3800 2400
Text HLabel 1700 2300 0    50   Input ~ 0
~FLAGWE
Wire Wire Line
	1700 2300 4550 2300
Text Label 1850 2300 0    50   ~ 0
~FLAGWE
Text Label 4550 2300 2    50   ~ 0
~FLAGWE
Text Label 4550 2200 2    50   ~ 0
IBUS15
Text Notes 2400 1650 0    50   ~ 10
Assumption
Text Notes 2400 1900 0    50   ~ 0
~ACTION_STI~ and ~ACTION_CLI~ remain de-asserted\nflags are being written using ~FLAGWE~.
$Comp
L alexios:74HC74 U41
U 3 1 5DDCA2A2
P 2850 7250
F 0 "U41" H 3030 7296 50  0000 L CNN
F 1 "74AC74" H 3030 7205 50  0000 L CNN
F 2 "alexios:SOIC-14" H 2850 7250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2850 7250 50  0001 C CNN
	3    2850 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U41
U 1 1 5D13AAD9
P 5000 2250
F 0 "U41" H 5000 2667 50  0000 C CNN
F 1 "74AC74" H 5000 2576 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5000 2250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5000 2250 50  0001 C CNN
	1    5000 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U50
U 2 1 5DEFC7C5
P 5950 7150
F 0 "U50" H 5950 7567 50  0000 C CNN
F 1 "74AC74" H 5950 7476 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5950 7150 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5950 7150 50  0001 C CNN
	2    5950 7150
	1    0    0    -1  
$EndComp
NoConn ~ 6400 7000
NoConn ~ 6400 7300
Wire Wire Line
	5500 7000 5400 7000
Wire Wire Line
	5400 7000 5400 7100
$Comp
L power:GND #PWR0191
U 1 1 5DEFC7C6
P 5400 7400
F 0 "#PWR0191" H 5400 7150 50  0001 C CNN
F 1 "GND" H 5405 7227 50  0000 C CNN
F 2 "" H 5400 7400 50  0001 C CNN
F 3 "" H 5400 7400 50  0001 C CNN
	1    5400 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 7100 5400 7100
Connection ~ 5400 7100
Wire Wire Line
	5400 7100 5400 7200
Wire Wire Line
	5500 7200 5400 7200
Connection ~ 5400 7200
Wire Wire Line
	5400 7200 5400 7300
Wire Wire Line
	5500 7300 5400 7300
Connection ~ 5400 7300
Wire Wire Line
	5400 7300 5400 7400
Text Notes 4650 1650 0    50   ~ 0
Use LVC or AC family for flip-flops.\nIt reduces the chances of metastability.
$EndSCHEMATC
