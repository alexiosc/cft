EESchema Schematic File Version 4
LIBS:cft-bus-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 14
Title "Interrupt State Machine"
Date ""
Rev ""
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 5DEFC7DA
P 1050 7250
AR Path="/5CC0D65F/5DEFC7DA" Ref="C?"  Part="1" 
AR Path="/5DEFC7DA" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7DA" Ref="C41"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7DA" Ref="C49"  Part="1" 
F 0 "C41" H 959 7296 50  0000 R CNN
F 1 "100nF" H 959 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 7250 50  0001 C CNN
F 3 "~" H 1050 7250 50  0001 C CNN
	1    1050 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5F68A2D6
P 1050 7150
AR Path="/5F67D4B5/5F68A2D6" Ref="#PWR0108"  Part="1" 
AR Path="/5DF0FEDA/5F68A2D6" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 1050 7000 50  0001 C CNN
F 1 "+5V" H 1065 7323 50  0000 C CNN
F 2 "" H 1050 7150 50  0001 C CNN
F 3 "" H 1050 7150 50  0001 C CNN
	1    1050 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5F68A4B4
P 1050 7350
AR Path="/5F67D4B5/5F68A4B4" Ref="#PWR0111"  Part="1" 
AR Path="/5DF0FEDA/5F68A4B4" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 1050 7100 50  0001 C CNN
F 1 "GND" H 1055 7177 50  0000 C CNN
F 2 "" H 1050 7350 50  0001 C CNN
F 3 "" H 1050 7350 50  0001 C CNN
	1    1050 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F6B4251
P 2500 7250
AR Path="/5CC0D65F/5F6B4251" Ref="C?"  Part="1" 
AR Path="/5F6B4251" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F6B4251" Ref="C42"  Part="1" 
AR Path="/5DF0FEDA/5F6B4251" Ref="C50"  Part="1" 
F 0 "C42" H 2409 7296 50  0000 R CNN
F 1 "100nF" H 2409 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 7250 50  0001 C CNN
F 3 "~" H 2500 7250 50  0001 C CNN
	1    2500 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 5F6B47C5
P 2500 7150
AR Path="/5F67D4B5/5F6B47C5" Ref="#PWR0109"  Part="1" 
AR Path="/5DF0FEDA/5F6B47C5" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 2500 7000 50  0001 C CNN
F 1 "+5V" H 2515 7323 50  0000 C CNN
F 2 "" H 2500 7150 50  0001 C CNN
F 3 "" H 2500 7150 50  0001 C CNN
	1    2500 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5F6B4C91
P 2500 7350
AR Path="/5F67D4B5/5F6B4C91" Ref="#PWR0112"  Part="1" 
AR Path="/5DF0FEDA/5F6B4C91" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 2500 7100 50  0001 C CNN
F 1 "GND" H 2505 7177 50  0000 C CNN
F 2 "" H 2500 7350 50  0001 C CNN
F 3 "" H 2500 7350 50  0001 C CNN
	1    2500 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F707BE7
P 3950 7250
AR Path="/5CC0D65F/5F707BE7" Ref="C?"  Part="1" 
AR Path="/5F707BE7" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F707BE7" Ref="C43"  Part="1" 
AR Path="/5DF0FEDA/5F707BE7" Ref="C51"  Part="1" 
F 0 "C43" H 3859 7296 50  0000 R CNN
F 1 "100nF" H 3859 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3950 7250 50  0001 C CNN
F 3 "~" H 3950 7250 50  0001 C CNN
	1    3950 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5F7083B1
P 3950 7150
AR Path="/5F67D4B5/5F7083B1" Ref="#PWR0110"  Part="1" 
AR Path="/5DF0FEDA/5F7083B1" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 3950 7000 50  0001 C CNN
F 1 "+5V" H 3965 7323 50  0000 C CNN
F 2 "" H 3950 7150 50  0001 C CNN
F 3 "" H 3950 7150 50  0001 C CNN
	1    3950 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5F708D3E
P 3950 7350
AR Path="/5F67D4B5/5F708D3E" Ref="#PWR0113"  Part="1" 
AR Path="/5DF0FEDA/5F708D3E" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 3950 7100 50  0001 C CNN
F 1 "GND" H 3955 7177 50  0000 C CNN
F 2 "" H 3950 7350 50  0001 C CNN
F 3 "" H 3950 7350 50  0001 C CNN
	1    3950 7350
	1    0    0    -1  
$EndComp
Text HLabel 1700 2100 0    50   Input ~ 0
~ACTION-STI
$Comp
L Device:C_Small C?
U 1 1 5F85ED41
P 1050 6500
AR Path="/5CC0D65F/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F85ED41" Ref="C39"  Part="1" 
AR Path="/5DF0FEDA/5F85ED41" Ref="C47"  Part="1" 
F 0 "C39" H 959 6546 50  0000 R CNN
F 1 "100nF" H 959 6455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 6500 50  0001 C CNN
F 3 "~" H 1050 6500 50  0001 C CNN
	1    1050 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5DEFC7E1
P 1050 6400
AR Path="/5F67D4B5/5DEFC7E1" Ref="#PWR0104"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7E1" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 1050 6250 50  0001 C CNN
F 1 "+5V" H 1065 6573 50  0000 C CNN
F 2 "" H 1050 6400 50  0001 C CNN
F 3 "" H 1050 6400 50  0001 C CNN
	1    1050 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5DEFC7E2
P 1050 6600
AR Path="/5F67D4B5/5DEFC7E2" Ref="#PWR0106"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7E2" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 1050 6350 50  0001 C CNN
F 1 "GND" H 1055 6427 50  0000 C CNN
F 2 "" H 1050 6600 50  0001 C CNN
F 3 "" H 1050 6600 50  0001 C CNN
	1    1050 6600
	1    0    0    -1  
$EndComp
Text Label 1850 2500 0    50   ~ 0
~ACTION-CLI
Text Label 1850 2100 0    50   ~ 0
~ACTION-STI
$Comp
L alexios:74LVC1G08 U54
U 1 1 5DEFC7B2
P 3500 2450
AR Path="/5F67D4B5/5DEFC7B2" Ref="U54"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7B2" Ref="U70"  Part="1" 
F 0 "U54" H 3425 2275 50  0000 C CNN
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
U 1 1 5DEFC7B6
P 2500 6500
AR Path="/5CC0D65F/5DEFC7B6" Ref="C?"  Part="1" 
AR Path="/5DEFC7B6" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7B6" Ref="C40"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7B6" Ref="C48"  Part="1" 
F 0 "C40" H 2409 6546 50  0000 R CNN
F 1 "100nF" H 2409 6455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 6500 50  0001 C CNN
F 3 "~" H 2500 6500 50  0001 C CNN
	1    2500 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5DEFC7B7
P 2500 6400
AR Path="/5F67D4B5/5DEFC7B7" Ref="#PWR0105"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7B7" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 2500 6250 50  0001 C CNN
F 1 "+5V" H 2515 6573 50  0000 C CNN
F 2 "" H 2500 6400 50  0001 C CNN
F 3 "" H 2500 6400 50  0001 C CNN
	1    2500 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D5F4997
P 2500 6600
AR Path="/5F67D4B5/5D5F4997" Ref="#PWR0107"  Part="1" 
AR Path="/5DF0FEDA/5D5F4997" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 2500 6350 50  0001 C CNN
F 1 "GND" H 2505 6427 50  0000 C CNN
F 2 "" H 2500 6600 50  0001 C CNN
F 3 "" H 2500 6600 50  0001 C CNN
	1    2500 6600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U56
U 2 1 5DEFC7B9
P 6750 3500
AR Path="/5F67D4B5/5DEFC7B9" Ref="U56"  Part="2" 
AR Path="/5DF0FEDA/5DEFC7B9" Ref="U72"  Part="2" 
F 0 "U56" H 6750 3917 50  0000 C CNN
F 1 "74AC74" H 6750 3826 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6750 3500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6750 3500 50  0001 C CNN
	2    6750 3500
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
L alexios:74LVC1G32 U57
U 1 1 5D5A4DFA
P 3400 4200
AR Path="/5F67D4B5/5D5A4DFA" Ref="U57"  Part="1" 
AR Path="/5DF0FEDA/5D5A4DFA" Ref="U73"  Part="1" 
F 0 "U57" H 3450 4467 50  0000 C CNN
F 1 "74LVC1G32" H 3450 4376 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 3510 4180 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3510 4180 50  0001 C CNN
	1    3400 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4250 3200 4250
$Comp
L power:+5V #PWR0101
U 1 1 5D4D2882
P 2200 3200
AR Path="/5F67D4B5/5D4D2882" Ref="#PWR0101"  Part="1" 
AR Path="/5DF0FEDA/5D4D2882" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 2200 3050 50  0001 C CNN
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
U 1 1 5D4C3580
P 2200 3300
AR Path="/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D4C3580" Ref="R5"  Part="1" 
AR Path="/5DF0FEDA/5D4C3580" Ref="R8"  Part="1" 
F 0 "R5" H 2259 3346 50  0000 L CNN
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
L Connector:TestPoint TP14
U 1 1 5F9307F3
P 5450 3750
AR Path="/5F67D4B5/5F9307F3" Ref="TP14"  Part="1" 
AR Path="/5DF0FEDA/5F9307F3" Ref="TP17"  Part="1" 
F 0 "TP14" V 5450 3938 50  0000 L CNN
F 1 "TestPoint" H 5508 3777 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5650 3750 50  0001 C CNN
F 3 "~" H 5650 3750 50  0001 C CNN
	1    5450 3750
	0    1    1    0   
$EndComp
$Comp
L alexios:74HC74 U53
U 2 1 5DEFC7B1
P 5000 3600
AR Path="/5F67D4B5/5DEFC7B1" Ref="U53"  Part="2" 
AR Path="/5DF0FEDA/5DEFC7B1" Ref="U69"  Part="2" 
F 0 "U53" H 5000 4017 50  0000 C CNN
F 1 "74AC74" H 5000 3926 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 3600 50  0001 C CNN
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
L alexios:74LVC1G332 U55
U 1 1 5DEFC7BC
P 3550 3400
AR Path="/5F67D4B5/5DEFC7BC" Ref="U55"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7BC" Ref="U71"  Part="1" 
F 0 "U55" H 3475 3664 50  0000 C CNN
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
L Connector:TestPoint TP13
U 1 1 5DEFC7E4
P 7200 3350
AR Path="/5F67D4B5/5DEFC7E4" Ref="TP13"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7E4" Ref="TP16"  Part="1" 
F 0 "TP13" V 7200 3538 50  0000 L CNN
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
L Connector:TestPoint TP12
U 1 1 5D12B3FF
P 5650 2400
AR Path="/5F67D4B5/5D12B3FF" Ref="TP12"  Part="1" 
AR Path="/5DF0FEDA/5D12B3FF" Ref="TP15"  Part="1" 
F 0 "TP12" V 5650 2588 50  0000 L CNN
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
L power:+5V #PWR0102
U 1 1 5DDA768D
P 6300 3350
AR Path="/5F67D4B5/5DDA768D" Ref="#PWR0102"  Part="1" 
AR Path="/5DF0FEDA/5DDA768D" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 6300 3200 50  0001 C CNN
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
U 1 1 5DDB48AD
P 8100 3650
AR Path="/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DDB48AD" Ref="R6"  Part="1" 
AR Path="/5DF0FEDA/5DDB48AD" Ref="R9"  Part="1" 
F 0 "R6" V 8204 3650 50  0000 C CNN
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
L alexios:74LVC1G08 U54
U 2 1 5DDC8304
P 1500 6400
AR Path="/5F67D4B5/5DDC8304" Ref="U54"  Part="2" 
AR Path="/5DF0FEDA/5DDC8304" Ref="U70"  Part="2" 
F 0 "U54" H 1580 6346 50  0000 L CNN
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
U 2 1 5DDC8CF0
P 1500 7050
AR Path="/5F67D4B5/5DDC8CF0" Ref="U55"  Part="2" 
AR Path="/5DF0FEDA/5DDC8CF0" Ref="U71"  Part="2" 
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
L alexios:74LVC1G32 U57
U 2 1 5DDC95B7
P 2900 6250
AR Path="/5F67D4B5/5DDC95B7" Ref="U57"  Part="2" 
AR Path="/5DF0FEDA/5DDC95B7" Ref="U73"  Part="2" 
F 0 "U57" H 3030 6046 50  0000 L CNN
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
Connection ~ 3950 7150
Connection ~ 3950 7350
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
U 1 1 5DEFC7C3
P 5550 2100
AR Path="/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7C3" Ref="R4"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7C3" Ref="R7"  Part="1" 
F 0 "R4" V 5354 2100 50  0000 C CNN
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
L power:+5V #PWR0103
U 1 1 5DF03A6D
P 4500 3550
AR Path="/5F67D4B5/5DF03A6D" Ref="#PWR0103"  Part="1" 
AR Path="/5DF0FEDA/5DF03A6D" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 4500 3400 50  0001 C CNN
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
L alexios:74HC74 U58
U 3 1 5DDCAF4B
P 4300 7250
AR Path="/5F67D4B5/5DDCAF4B" Ref="U58"  Part="3" 
AR Path="/5DF0FEDA/5DDCAF4B" Ref="U74"  Part="3" 
F 0 "U58" H 4480 7296 50  0000 L CNN
F 1 "74AC74" H 4480 7205 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4300 7250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4300 7250 50  0001 C CNN
	3    4300 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U53
U 3 1 5DEFC7C2
P 2850 7250
AR Path="/5F67D4B5/5DEFC7C2" Ref="U53"  Part="3" 
AR Path="/5DF0FEDA/5DEFC7C2" Ref="U69"  Part="3" 
F 0 "U53" H 3030 7296 50  0000 L CNN
F 1 "74AC74" H 3030 7205 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2850 7250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2850 7250 50  0001 C CNN
	3    2850 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U53
U 1 1 5DEFC7B0
P 5000 2250
AR Path="/5F67D4B5/5DEFC7B0" Ref="U53"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7B0" Ref="U69"  Part="1" 
F 0 "U53" H 5000 2667 50  0000 C CNN
F 1 "74AC74" H 5000 2576 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 2250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5000 2250 50  0001 C CNN
	1    5000 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U58
U 2 1 5E4DB3A3
P 5950 7150
AR Path="/5F67D4B5/5E4DB3A3" Ref="U58"  Part="2" 
AR Path="/5DF0FEDA/5E4DB3A3" Ref="U74"  Part="2" 
F 0 "U58" H 5950 7567 50  0000 C CNN
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
L power:GND #PWR0114
U 1 1 5E4DF1B3
P 5400 7400
AR Path="/5F67D4B5/5E4DF1B3" Ref="#PWR0114"  Part="1" 
AR Path="/5DF0FEDA/5E4DF1B3" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 5400 7150 50  0001 C CNN
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
