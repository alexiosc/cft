EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 35
Title "CFT Homebrew 16-bit Minicomputer"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 5F68A0E8
P 1200 7100
AR Path="/5CC0D65F/5F68A0E8" Ref="C?"  Part="1" 
AR Path="/5F68A0E8" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F68A0E8" Ref="C902"  Part="1" 
F 0 "C902" H 1109 7146 50  0000 R CNN
F 1 "100nF" H 1109 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1200 7100 50  0001 C CNN
F 3 "~" H 1200 7100 50  0001 C CNN
	1    1200 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0910
U 1 1 5F68A2D6
P 1200 7000
F 0 "#PWR0910" H 1200 6850 50  0001 C CNN
F 1 "+5V" H 1215 7173 50  0000 C CNN
F 2 "" H 1200 7000 50  0001 C CNN
F 3 "" H 1200 7000 50  0001 C CNN
	1    1200 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0911
U 1 1 5F68A4B4
P 1200 7200
F 0 "#PWR0911" H 1200 6950 50  0001 C CNN
F 1 "GND" H 1205 7027 50  0000 C CNN
F 2 "" H 1200 7200 50  0001 C CNN
F 3 "" H 1200 7200 50  0001 C CNN
	1    1200 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F6B4251
P 2650 7100
AR Path="/5CC0D65F/5F6B4251" Ref="C?"  Part="1" 
AR Path="/5F6B4251" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F6B4251" Ref="C904"  Part="1" 
F 0 "C904" H 2559 7146 50  0000 R CNN
F 1 "100nF" H 2559 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2650 7100 50  0001 C CNN
F 3 "~" H 2650 7100 50  0001 C CNN
	1    2650 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0914
U 1 1 5F6B47C5
P 2650 7000
F 0 "#PWR0914" H 2650 6850 50  0001 C CNN
F 1 "+5V" H 2665 7173 50  0000 C CNN
F 2 "" H 2650 7000 50  0001 C CNN
F 3 "" H 2650 7000 50  0001 C CNN
	1    2650 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0915
U 1 1 5F6B4C91
P 2650 7200
F 0 "#PWR0915" H 2650 6950 50  0001 C CNN
F 1 "GND" H 2655 7027 50  0000 C CNN
F 2 "" H 2650 7200 50  0001 C CNN
F 3 "" H 2650 7200 50  0001 C CNN
	1    2650 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F707BE7
P 4100 7100
AR Path="/5CC0D65F/5F707BE7" Ref="C?"  Part="1" 
AR Path="/5F707BE7" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F707BE7" Ref="C905"  Part="1" 
F 0 "C905" H 4009 7146 50  0000 R CNN
F 1 "100nF" H 4009 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4100 7100 50  0001 C CNN
F 3 "~" H 4100 7100 50  0001 C CNN
	1    4100 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0916
U 1 1 5F7083B1
P 4100 7000
F 0 "#PWR0916" H 4100 6850 50  0001 C CNN
F 1 "+5V" H 4115 7173 50  0000 C CNN
F 2 "" H 4100 7000 50  0001 C CNN
F 3 "" H 4100 7000 50  0001 C CNN
	1    4100 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0917
U 1 1 5F708D3E
P 4100 7200
F 0 "#PWR0917" H 4100 6950 50  0001 C CNN
F 1 "GND" H 4105 7027 50  0000 C CNN
F 2 "" H 4100 7200 50  0001 C CNN
F 3 "" H 4100 7200 50  0001 C CNN
	1    4100 7200
	1    0    0    -1  
$EndComp
Text HLabel 1300 1100 0    50   Input ~ 0
~ACTION-STI
Text Notes 3450 3500 0    50   ~ 0
To avoid metastability, bring the asynchronous ~IRQ~ signal into the CFT's clock domain. To reduce\nlatency, and since all four clock phases are really in the same domain, we sample interrupts on\nthe rising edge of CLK1. The second stage clocks on the rising edge of CLK2 or CLK3. The final\n~IRQS~ state is reached on the rising edge of CLK4 when ~END~ is asserted. This reduces the\nminimum latency to 187.5 ns.
Text Notes 5750 1050 0    79   ~ 16
Enabling Interrupts (~STI~)
$Comp
L Device:C_Small C?
U 1 1 5F85ED41
P 1200 6350
AR Path="/5CC0D65F/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F85ED41" Ref="C901"  Part="1" 
F 0 "C901" H 1109 6396 50  0000 R CNN
F 1 "100nF" H 1109 6305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1200 6350 50  0001 C CNN
F 3 "~" H 1200 6350 50  0001 C CNN
	1    1200 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0908
U 1 1 5F85F21B
P 1200 6250
F 0 "#PWR0908" H 1200 6100 50  0001 C CNN
F 1 "+5V" H 1215 6423 50  0000 C CNN
F 2 "" H 1200 6250 50  0001 C CNN
F 3 "" H 1200 6250 50  0001 C CNN
	1    1200 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0909
U 1 1 5F85F700
P 1200 6450
F 0 "#PWR0909" H 1200 6200 50  0001 C CNN
F 1 "GND" H 1205 6277 50  0000 C CNN
F 2 "" H 1200 6450 50  0001 C CNN
F 3 "" H 1200 6450 50  0001 C CNN
	1    1200 6450
	1    0    0    -1  
$EndComp
Text HLabel 9250 4850 2    50   Output ~ 0
~IRQS
Text Label 6750 4850 0    50   ~ 0
~IRQS
$Comp
L Connector:TestPoint TP902
U 1 1 5F9307F3
P 4850 2750
F 0 "TP902" V 4850 2938 50  0000 L CNN
F 1 "TestPoint" H 4908 2777 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5050 2750 50  0001 C CNN
F 3 "~" H 5050 2750 50  0001 C CNN
	1    4850 2750
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP904
U 1 1 5F9349A9
P 6700 2750
F 0 "TP904" V 6700 2938 50  0000 L CNN
F 1 "TestPoint" H 6758 2777 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 6900 2750 50  0001 C CNN
F 3 "~" H 6900 2750 50  0001 C CNN
	1    6700 2750
	0    1    1    0   
$EndComp
Text Notes 7000 4650 0    50   ~ 0
~IRQS~ is Interrupt Seen. It's sent to the Control Unit\nto run the Interrupt microprogram. It also doubles\nas the Interrupt acknowledge signal on the CFT Bus.
Text Notes 7150 6950 0    197  ~ 39
Interrupt State Machine
Text Label 1450 1450 0    50   ~ 0
~ACTION-CLI
Text Label 1450 1100 0    50   ~ 0
~ACTION-STI
Wire Wire Line
	3950 1200 3900 1200
Wire Wire Line
	1300 1100 3950 1100
Wire Wire Line
	4850 1100 5350 1100
Text Label 4850 1100 0    50   ~ 0
FI
$Comp
L Connector:TestPoint TP901
U 1 1 5D12B3FF
P 4850 1400
F 0 "TP901" V 4850 1588 50  0000 L CNN
F 1 "TestPoint" H 4908 1427 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5050 1400 50  0001 C CNN
F 3 "~" H 5050 1400 50  0001 C CNN
	1    4850 1400
	0    1    1    0   
$EndComp
$Comp
L alexios:74HC74 U903
U 1 1 5D13AAD9
P 4400 1250
F 0 "U903" H 4400 1667 50  0000 C CNN
F 1 "74HC74" H 4400 1576 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4400 1250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4400 1250 50  0001 C CNN
	1    4400 1250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U904
U 1 1 5D13ACC5
P 4400 2600
F 0 "U904" H 4400 3017 50  0000 C CNN
F 1 "74HC74" H 4400 2926 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4400 2600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4400 2600 50  0001 C CNN
	1    4400 2600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U905
U 2 1 5D143497
P 6300 4700
F 0 "U905" H 6300 5117 50  0000 C CNN
F 1 "74HC74" H 6300 5026 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6300 4700 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6300 4700 50  0001 C CNN
	2    6300 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2450 3350 2450
Wire Wire Line
	3350 2450 3350 1900
Wire Wire Line
	3350 1900 5350 1900
Wire Wire Line
	5350 1900 5350 2450
Wire Wire Line
	5350 2450 5800 2450
Wire Wire Line
	5350 1100 5350 1900
Connection ~ 5350 1900
Text Label 1450 2550 0    50   ~ 0
~IRQ
Text HLabel 1300 2550 0    50   Input ~ 0
~IRQ
Wire Wire Line
	4850 2450 5250 2450
Wire Wire Line
	5250 2450 5250 2550
Wire Wire Line
	5250 2550 5800 2550
Wire Wire Line
	1300 2550 2050 2550
Wire Wire Line
	5450 2950 5450 2650
Wire Wire Line
	5450 2650 5800 2650
$Comp
L alexios:74LVC1G08 U902
U 1 1 5D183FAB
P 2400 1400
F 0 "U902" H 2325 1225 50  0000 C CNN
F 1 "74LVC1G08" H 2325 1134 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 2050 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2050 1400 50  0001 C CNN
	1    2400 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1200 3900 1300
Wire Wire Line
	3950 1300 3900 1300
$Comp
L power:+5V #PWR0902
U 1 1 5D18C9E4
P 3900 1200
F 0 "#PWR0902" H 3900 1050 50  0001 C CNN
F 1 "+5V" V 3915 1328 50  0000 L CNN
F 2 "" H 3900 1200 50  0001 C CNN
F 3 "" H 3900 1200 50  0001 C CNN
	1    3900 1200
	0    -1   -1   0   
$EndComp
Connection ~ 3900 1200
Text HLabel 1300 1450 0    50   Input ~ 0
~ACTION-CLI
Text HLabel 1300 1350 0    50   Input ~ 0
~RESET
Wire Wire Line
	1300 1450 2100 1450
Text Label 1450 1350 0    50   ~ 0
~RESET
Wire Wire Line
	1300 1350 2100 1350
$Comp
L power:+5V #PWR0903
U 1 1 5D1C81EC
P 3900 2750
F 0 "#PWR0903" H 3900 2600 50  0001 C CNN
F 1 "+5V" V 3915 2878 50  0000 L CNN
F 2 "" H 3900 2750 50  0001 C CNN
F 3 "" H 3900 2750 50  0001 C CNN
	1    3900 2750
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0905
U 1 1 5D1C8231
P 5800 2750
F 0 "#PWR0905" H 5800 2600 50  0001 C CNN
F 1 "+5V" V 5815 2878 50  0000 L CNN
F 2 "" H 5800 2750 50  0001 C CNN
F 3 "" H 5800 2750 50  0001 C CNN
	1    5800 2750
	0    -1   -1   0   
$EndComp
Text Label 2600 1400 0    50   ~ 0
~RESET-OR-CLI
$Comp
L alexios:74HC74 U905
U 1 1 5D1DFC5F
P 4400 4700
F 0 "U905" H 4400 5117 50  0000 C CNN
F 1 "74HC74" H 4400 5026 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4400 4700 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4400 4700 50  0001 C CNN
	1    4400 4700
	1    0    0    -1  
$EndComp
Text HLabel 1300 4200 0    50   Input ~ 0
~END
Text Label 1450 4200 0    50   ~ 0
~END
Wire Wire Line
	5450 4750 5850 4750
Wire Wire Line
	6700 2450 7450 2450
Wire Wire Line
	7450 3700 3350 3700
Wire Wire Line
	3350 3700 3350 4550
Wire Wire Line
	3350 4550 3950 4550
Wire Wire Line
	3250 4850 3950 4850
Wire Wire Line
	3950 4650 3900 4650
Wire Wire Line
	3900 4650 3900 4750
Wire Wire Line
	3950 4750 3900 4750
$Comp
L power:+5V #PWR0904
U 1 1 5D216290
P 3900 4650
F 0 "#PWR0904" H 3900 4500 50  0001 C CNN
F 1 "+5V" V 3915 4778 50  0000 L CNN
F 2 "" H 3900 4650 50  0001 C CNN
F 3 "" H 3900 4650 50  0001 C CNN
	1    3900 4650
	0    -1   -1   0   
$EndComp
Connection ~ 3900 4650
Wire Wire Line
	3900 2750 3950 2750
Text Label 3300 4850 0    50   ~ 0
~RESET-OR-CLI
Wire Wire Line
	5450 4750 5450 4150
Wire Wire Line
	3250 4850 3250 5050
Wire Wire Line
	3250 5050 5550 5050
Wire Wire Line
	5550 5050 5550 4850
Wire Wire Line
	5550 4850 5850 4850
Connection ~ 3250 4850
Wire Wire Line
	4850 4550 5350 4550
Wire Wire Line
	5350 4550 5350 4650
Wire Wire Line
	5350 4650 5850 4650
$Comp
L power:+5V #PWR0906
U 1 1 5D2F6551
P 5850 4550
F 0 "#PWR0906" H 5850 4400 50  0001 C CNN
F 1 "+5V" H 5865 4723 50  0000 C CNN
F 2 "" H 5850 4550 50  0001 C CNN
F 3 "" H 5850 4550 50  0001 C CNN
	1    5850 4550
	1    0    0    -1  
$EndComp
Text Label 3450 1900 0    50   ~ 0
FI
Text Label 3450 2450 0    50   ~ 0
FI
Text Label 3450 2550 0    50   ~ 0
~IRQ
Text Label 3450 2650 0    50   ~ 0
CLK2
Text Label 6750 2450 0    50   ~ 0
~INT
Text Label 3450 3700 0    50   ~ 0
~INT
Text Label 3450 2950 0    50   ~ 0
CLK3
$Comp
L Connector:TestPoint TP903
U 1 1 5D388553
P 4850 4850
F 0 "TP903" V 4850 5038 50  0000 L CNN
F 1 "TestPoint" H 4908 4877 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5050 4850 50  0001 C CNN
F 3 "~" H 5050 4850 50  0001 C CNN
	1    4850 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	6750 4850 7450 4850
Wire Wire Line
	5350 1100 7700 1100
Connection ~ 5350 1100
Text HLabel 7700 1100 2    50   Output ~ 0
FI
Text Label 1450 2950 0    50   ~ 0
CLK3
Text Notes 5750 2050 0    79   ~ 16
~IRQ~ Clock Domain Crossing
Text Notes 5750 4000 0    79   ~ 16
interrupt State
Text Label 3450 4550 0    50   ~ 0
~INT
$Comp
L Device:R_Small R?
U 1 1 5D4C3580
P 2050 2400
AR Path="/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D4C3580" Ref="R901"  Part="1" 
F 0 "R901" H 2109 2446 50  0000 L CNN
F 1 "4.7kΩ" H 2109 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2050 2400 50  0001 C CNN
F 3 "~" H 2050 2400 50  0001 C CNN
	1    2050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2500 2050 2550
Connection ~ 2050 2550
Wire Wire Line
	2050 2550 3950 2550
$Comp
L power:+5V #PWR0901
U 1 1 5D4D2882
P 2050 2300
F 0 "#PWR0901" H 2050 2150 50  0001 C CNN
F 1 "+5V" H 2065 2473 50  0000 C CNN
F 2 "" H 2050 2300 50  0001 C CNN
F 3 "" H 2050 2300 50  0001 C CNN
	1    2050 2300
	1    0    0    -1  
$EndComp
Text Label 4900 2450 0    50   ~ 0
~INT₀
Text Notes 5600 1300 0    50   ~ 0
This is the Interrupt Flag (interrupt handling enabled)\ndisplayed on the front panel.
Wire Wire Line
	1300 2650 3950 2650
Text HLabel 1300 2650 0    50   Input ~ 0
CLK2
Wire Wire Line
	2550 1400 3250 1400
Wire Wire Line
	7450 2450 7450 3700
Wire Wire Line
	1300 4200 2100 4200
$Comp
L alexios:74LVC1G32 U901
U 1 1 5D5A4DFA
P 2300 4150
F 0 "U901" H 2350 4417 50  0000 C CNN
F 1 "74LVC1G32" H 2350 4326 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 2410 4130 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2410 4130 50  0001 C CNN
	1    2300 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4100 1300 4100
Text HLabel 1300 4100 0    50   Input ~ 0
CLK4
Text Label 1450 4100 0    50   ~ 0
CLK4
Wire Wire Line
	2600 4150 5450 4150
NoConn ~ 6700 6950
NoConn ~ 6700 7250
$Comp
L alexios:74HC74 U903
U 3 1 5D5EE74B
P 1550 7100
F 0 "U903" H 1730 7146 50  0000 L CNN
F 1 "74HC74" H 1730 7055 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1550 7100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1550 7100 50  0001 C CNN
	3    1550 7100
	1    0    0    -1  
$EndComp
Connection ~ 1200 7000
Connection ~ 1200 7200
$Comp
L alexios:74HC74 U904
U 3 1 5D5EEA24
P 3000 7100
F 0 "U904" H 3180 7146 50  0000 L CNN
F 1 "74HC74" H 3180 7055 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3000 7100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3000 7100 50  0001 C CNN
	3    3000 7100
	1    0    0    -1  
$EndComp
Connection ~ 2650 7000
Connection ~ 2650 7200
$Comp
L alexios:74HC74 U905
U 3 1 5D5EEA84
P 4450 7100
F 0 "U905" H 4630 7146 50  0000 L CNN
F 1 "74HC74" H 4630 7055 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4450 7100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4450 7100 50  0001 C CNN
	3    4450 7100
	1    0    0    -1  
$EndComp
Connection ~ 4100 7000
Connection ~ 4100 7200
$Comp
L alexios:74LVC1G08 U902
U 2 1 5D5F45BD
P 1650 6250
F 0 "U902" H 1730 6196 50  0000 L CNN
F 1 "74LVC1G08" H 1730 6105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 1300 6250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 1300 6250 50  0001 C CNN
	2    1650 6250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U901
U 2 1 5D5F462B
P 3050 6100
F 0 "U901" H 3180 5896 50  0000 L CNN
F 1 "74LVC1G32" H 3180 5805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 3160 6080 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3160 6080 50  0001 C CNN
	2    3050 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D5F498A
P 2650 6350
AR Path="/5CC0D65F/5D5F498A" Ref="C?"  Part="1" 
AR Path="/5D5F498A" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5D5F498A" Ref="C903"  Part="1" 
F 0 "C903" H 2559 6396 50  0000 R CNN
F 1 "100nF" H 2559 6305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2650 6350 50  0001 C CNN
F 3 "~" H 2650 6350 50  0001 C CNN
	1    2650 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0912
U 1 1 5D5F4991
P 2650 6250
F 0 "#PWR0912" H 2650 6100 50  0001 C CNN
F 1 "+5V" H 2665 6423 50  0000 C CNN
F 2 "" H 2650 6250 50  0001 C CNN
F 3 "" H 2650 6250 50  0001 C CNN
	1    2650 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0913
U 1 1 5D5F4997
P 2650 6450
F 0 "#PWR0913" H 2650 6200 50  0001 C CNN
F 1 "GND" H 2655 6277 50  0000 C CNN
F 2 "" H 2650 6450 50  0001 C CNN
F 3 "" H 2650 6450 50  0001 C CNN
	1    2650 6450
	1    0    0    -1  
$EndComp
Connection ~ 1200 6450
Connection ~ 1200 6250
Connection ~ 2650 6450
Connection ~ 2650 6250
$Comp
L alexios:74HC74 U904
U 2 1 5D6227E0
P 6250 2600
F 0 "U904" H 6250 3017 50  0000 C CNN
F 1 "74HC74" H 6250 2926 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6250 2600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6250 2600 50  0001 C CNN
	2    6250 2600
	1    0    0    -1  
$EndComp
Text Notes 1300 4850 0    50   ~ 0
Synchronise the interrupt assertion with\nthe end of the processor cycle. Otherwise,\n~IRQS~ will be asserted when the next micro-\ninstruction is fetched and ~END~ is deasserted,\nwhich is already too late to fetch the micro-\nprogram.
Wire Wire Line
	3250 1400 3250 4850
Connection ~ 3250 1400
Wire Wire Line
	3250 1400 3950 1400
Text Label 1450 2650 0    50   ~ 0
CLK2
Text HLabel 1300 2950 0    50   Input ~ 0
CLK3
Wire Wire Line
	1300 2950 5450 2950
NoConn ~ 6750 4550
Wire Wire Line
	7450 4850 7450 6350
Text HLabel 9200 6350 2    50   Output ~ 0
~IRQSµC
$Comp
L Device:R_Small R?
U 1 1 5DE59283
P 7650 4850
AR Path="/5DE59283" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DE59283" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DE59283" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DE59283" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DE59283" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DE59283" Ref="R?"  Part="1" 
F 0 "R?" V 7754 4850 50  0000 C CNN
F 1 "30Ω" V 7845 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7650 4850 50  0001 C CNN
F 3 "~" H 7650 4850 50  0001 C CNN
	1    7650 4850
	0    1    1    0   
$EndComp
Connection ~ 7450 4850
Wire Wire Line
	7550 4850 7450 4850
Wire Wire Line
	7750 4850 9250 4850
Wire Wire Line
	7450 6350 9200 6350
Text Notes 7600 5850 0    50   ~ 0
~IRQS~ and ~IRQµC~ are the same signal.\nThe former is output to the bus. The latter is\nfor the Microcode Store. We drive them separately\nto keep the capacitance down and because the one going\nto the Microcode Store is more important and must be\nless loaded (and thus rise faster).\n\nTODO: Drive ~IRQSµC using the leftover FF.
$Comp
L alexios:74HC74 U903
U 2 1 5D1DFCDB
P 6250 7100
F 0 "U903" H 6250 7517 50  0000 C CNN
F 1 "74HC74" H 6250 7426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6250 7100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6250 7100 50  0001 C CNN
	2    6250 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DB48F02
P 5750 7300
F 0 "#PWR?" H 5750 7050 50  0001 C CNN
F 1 "GND" H 5755 7127 50  0000 C CNN
F 2 "" H 5750 7300 50  0001 C CNN
F 3 "" H 5750 7300 50  0001 C CNN
	1    5750 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6950 5800 6950
Wire Wire Line
	5750 6950 5750 7050
Wire Wire Line
	5800 7050 5750 7050
Connection ~ 5750 7050
Wire Wire Line
	5750 7050 5750 7150
Wire Wire Line
	5800 7150 5750 7150
Connection ~ 5750 7150
Wire Wire Line
	5750 7150 5750 7250
Wire Wire Line
	5800 7250 5750 7250
Connection ~ 5750 7250
Wire Wire Line
	5750 7250 5750 7300
Text Notes 4400 1300 0    79   ~ 16
q0
Text Notes 4400 2650 0    79   ~ 16
q1\n
Text Notes 6250 2650 0    79   ~ 16
q2
Text Notes 4400 4750 0    79   ~ 16
q3
Text Notes 6300 4750 0    79   ~ 16
q4
Text Notes 8500 1700 0    50   ~ 10
q0\nq1\nq2\nq3\nq4
Text Notes 8750 1225 0    50   ~ 10
~RESET~
Text Notes 8500 1225 0    50   ~ 10
State
Text Notes 9050 1225 0    50   ~ 10
~CLI~
Text Notes 9300 1225 0    50   ~ 10
~STI~
Text Notes 9550 1225 0    50   ~ 10
~IRQ~¹
Text Notes 10100 1225 0    50   ~ 10
~END~²
Text Notes 8450 2000 0    50   ~ 0
¹ ~IRQ~ must be asserted during raising edge of CLK₂.\n² Transition happens on raising edge of CLK₄ when ~END~ is low.
Text Notes 9800 1700 0    50   ~ 0
\n→q3\n\n\n
Text Notes 10100 1700 0    50   ~ 0
\n\n\n→q4\n\n
Text Notes 9800 1225 0    50   ~ 10
CLK₃↑
Text Notes 9300 1700 0    50   ~ 0
→q1\n\n\n\n\n
Text Notes 9550 1700 0    50   ~ 0
\n→q2\n\n\n\n
Text Notes 9050 1700 0    50   ~ 0
\n→q0\n→q0\n→q0\n→q0
Text Notes 8800 1700 0    50   ~ 0
\n→q0\n→q0\n→q0\n→q0
Wire Notes Line width 15 style solid
	8450 1075 10350 1075
Wire Notes Line width 15 style solid
	10350 1075 10350 1750
Wire Notes Line width 15 style solid
	10350 1750 8450 1750
Wire Notes Line width 15 style solid
	8450 1750 8450 1075
Wire Notes Line style solid
	8450 1250 10350 1250
Wire Notes Line style solid
	8725 1075 8725 1750
Wire Notes Line
	9250 1075 9250 1750
Wire Notes Line
	9025 1075 9025 1750
Wire Notes Line
	9500 1075 9500 1750
Wire Notes Line
	9750 1075 9750 1750
Wire Notes Line
	10050 1075 10050 1750
Text Notes 8650 1000 0    79   ~ 16
State Transition Diagram
$EndSCHEMATC
