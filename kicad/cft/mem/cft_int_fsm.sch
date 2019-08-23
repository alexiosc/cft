EESchema Schematic File Version 4
LIBS:cft-pb0-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 11
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
AR Path="/5F67D4B5/5F68A0E8" Ref="C402"  Part="1" 
F 0 "C402" H 1109 7146 50  0000 R CNN
F 1 "100nF" H 1109 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1200 7100 50  0001 C CNN
F 3 "~" H 1200 7100 50  0001 C CNN
	1    1200 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0403
U 1 1 5F68A2D6
P 1200 7000
F 0 "#PWR0403" H 1200 6850 50  0001 C CNN
F 1 "+5V" H 1215 7173 50  0000 C CNN
F 2 "" H 1200 7000 50  0001 C CNN
F 3 "" H 1200 7000 50  0001 C CNN
	1    1200 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0404
U 1 1 5F68A4B4
P 1200 7200
F 0 "#PWR0404" H 1200 6950 50  0001 C CNN
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
AR Path="/5F67D4B5/5F6B4251" Ref="C404"  Part="1" 
F 0 "C404" H 2559 7146 50  0000 R CNN
F 1 "100nF" H 2559 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2650 7100 50  0001 C CNN
F 3 "~" H 2650 7100 50  0001 C CNN
	1    2650 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0407
U 1 1 5F6B47C5
P 2650 7000
F 0 "#PWR0407" H 2650 6850 50  0001 C CNN
F 1 "+5V" H 2665 7173 50  0000 C CNN
F 2 "" H 2650 7000 50  0001 C CNN
F 3 "" H 2650 7000 50  0001 C CNN
	1    2650 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0408
U 1 1 5F6B4C91
P 2650 7200
F 0 "#PWR0408" H 2650 6950 50  0001 C CNN
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
AR Path="/5F67D4B5/5F707BE7" Ref="C405"  Part="1" 
F 0 "C405" H 4009 7146 50  0000 R CNN
F 1 "100nF" H 4009 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4100 7100 50  0001 C CNN
F 3 "~" H 4100 7100 50  0001 C CNN
	1    4100 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0410
U 1 1 5F7083B1
P 4100 7000
F 0 "#PWR0410" H 4100 6850 50  0001 C CNN
F 1 "+5V" H 4115 7173 50  0000 C CNN
F 2 "" H 4100 7000 50  0001 C CNN
F 3 "" H 4100 7000 50  0001 C CNN
	1    4100 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0411
U 1 1 5F708D3E
P 4100 7200
F 0 "#PWR0411" H 4100 6950 50  0001 C CNN
F 1 "GND" H 4105 7027 50  0000 C CNN
F 2 "" H 4100 7200 50  0001 C CNN
F 3 "" H 4100 7200 50  0001 C CNN
	1    4100 7200
	1    0    0    -1  
$EndComp
Text HLabel 2200 1500 0    50   Input ~ 0
~ACTION-STI
Text Notes 4350 3900 0    50   ~ 0
To avoid metastability, bring the asynchronous ~IRQ~ signal into the CFT's clock domain. To reduce\nlatency, and since all four clock phases are really in the same domain, we sample interrupts on\nthe rising edge of CLK1. The second stage clocks on the rising edge of CLK2 or CLK3. The final\n~IRQS~ state is reached on the raising edge of CLK4 when ~END~ is asserted. This reduces the\nminimum latency to 187.5 ns.
Text Notes 6650 1450 0    79   ~ 16
Enabling Interrupts (~STI~)
$Comp
L Device:C_Small C?
U 1 1 5F85ED41
P 1200 6350
AR Path="/5CC0D65F/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F85ED41" Ref="C401"  Part="1" 
F 0 "C401" H 1109 6396 50  0000 R CNN
F 1 "100nF" H 1109 6305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1200 6350 50  0001 C CNN
F 3 "~" H 1200 6350 50  0001 C CNN
	1    1200 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0401
U 1 1 5F85F21B
P 1200 6250
F 0 "#PWR0401" H 1200 6100 50  0001 C CNN
F 1 "+5V" H 1215 6423 50  0000 C CNN
F 2 "" H 1200 6250 50  0001 C CNN
F 3 "" H 1200 6250 50  0001 C CNN
	1    1200 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0402
U 1 1 5F85F700
P 1200 6450
F 0 "#PWR0402" H 1200 6200 50  0001 C CNN
F 1 "GND" H 1205 6277 50  0000 C CNN
F 2 "" H 1200 6450 50  0001 C CNN
F 3 "" H 1200 6450 50  0001 C CNN
	1    1200 6450
	1    0    0    -1  
$EndComp
Text HLabel 8600 5250 2    50   Output ~ 0
~IRQS
Text Label 7650 5250 0    50   ~ 0
~IRQS
$Comp
L Connector:TestPoint TP402
U 1 1 5F9307F3
P 5750 3150
F 0 "TP402" V 5750 3338 50  0000 L CNN
F 1 "TestPoint" H 5808 3177 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5950 3150 50  0001 C CNN
F 3 "~" H 5950 3150 50  0001 C CNN
	1    5750 3150
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP404
U 1 1 5F9349A9
P 7600 3150
F 0 "TP404" V 7600 3338 50  0000 L CNN
F 1 "TestPoint" H 7658 3177 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 7800 3150 50  0001 C CNN
F 3 "~" H 7800 3150 50  0001 C CNN
	1    7600 3150
	0    1    1    0   
$EndComp
Text Notes 6950 5700 0    50   ~ 0
~IRQS~ is Interrupt Seen. It's sent to the Control Unit\nto run the Interrupt microprogram. It also doubles\nas the Interrupt acknowledge signal on the CFT Bus.
Text Notes 7150 6950 0    197  ~ 39
Interrupt State Machine
Text Label 2350 1850 0    50   ~ 0
~ACTION-CLI
Text Label 2350 1500 0    50   ~ 0
~ACTION-STI
Wire Wire Line
	4850 1600 4800 1600
Wire Wire Line
	2200 1500 4850 1500
Wire Wire Line
	5750 1500 6250 1500
Text Label 5750 1500 0    50   ~ 0
FI
$Comp
L Connector:TestPoint TP401
U 1 1 5D12B3FF
P 5750 1800
F 0 "TP401" V 5750 1988 50  0000 L CNN
F 1 "TestPoint" H 5808 1827 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5950 1800 50  0001 C CNN
F 3 "~" H 5950 1800 50  0001 C CNN
	1    5750 1800
	0    1    1    0   
$EndComp
$Comp
L alexios:74HC74 U401
U 1 1 5D13AAD9
P 5300 1650
F 0 "U401" H 5300 2067 50  0000 C CNN
F 1 "74HC74" H 5300 1976 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5300 1650 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5300 1650 50  0001 C CNN
	1    5300 1650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U403
U 1 1 5D13ACC5
P 5300 3000
F 0 "U403" H 5300 3417 50  0000 C CNN
F 1 "74HC74" H 5300 3326 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5300 3000 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5300 3000 50  0001 C CNN
	1    5300 3000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U403
U 2 1 5D143497
P 7200 5100
F 0 "U403" H 7200 5517 50  0000 C CNN
F 1 "74HC74" H 7200 5426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7200 5100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7200 5100 50  0001 C CNN
	2    7200 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2850 4250 2850
Wire Wire Line
	4250 2850 4250 2300
Wire Wire Line
	4250 2300 6250 2300
Wire Wire Line
	6250 2300 6250 2850
Wire Wire Line
	6250 2850 6700 2850
Wire Wire Line
	6250 1500 6250 2300
Connection ~ 6250 2300
Text Label 2350 2950 0    50   ~ 0
~IRQ
Text HLabel 2200 2950 0    50   Input ~ 0
~IRQ
Wire Wire Line
	5750 2850 6150 2850
Wire Wire Line
	6150 2850 6150 2950
Wire Wire Line
	6150 2950 6700 2950
Wire Wire Line
	2200 2950 2950 2950
Wire Wire Line
	6350 3350 6350 3050
Wire Wire Line
	6350 3050 6700 3050
$Comp
L alexios:74LVC1G08 U402
U 1 1 5D183FAB
P 3300 1800
F 0 "U402" H 3225 1625 50  0000 C CNN
F 1 "74LVC1G08" H 3225 1534 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 2950 1800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2950 1800 50  0001 C CNN
	1    3300 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1600 4800 1700
Wire Wire Line
	4850 1700 4800 1700
$Comp
L power:+5V #PWR0412
U 1 1 5D18C9E4
P 4800 1600
F 0 "#PWR0412" H 4800 1450 50  0001 C CNN
F 1 "+5V" V 4815 1728 50  0000 L CNN
F 2 "" H 4800 1600 50  0001 C CNN
F 3 "" H 4800 1600 50  0001 C CNN
	1    4800 1600
	0    -1   -1   0   
$EndComp
Connection ~ 4800 1600
Text HLabel 2200 1850 0    50   Input ~ 0
~ACTION-CLI
Text HLabel 2200 1750 0    50   Input ~ 0
~RESET
Wire Wire Line
	2200 1850 3000 1850
Text Label 2350 1750 0    50   ~ 0
~RESET
Wire Wire Line
	2200 1750 3000 1750
$Comp
L power:+5V #PWR0413
U 1 1 5D1C81EC
P 4800 3150
F 0 "#PWR0413" H 4800 3000 50  0001 C CNN
F 1 "+5V" V 4815 3278 50  0000 L CNN
F 2 "" H 4800 3150 50  0001 C CNN
F 3 "" H 4800 3150 50  0001 C CNN
	1    4800 3150
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0415
U 1 1 5D1C8231
P 6700 3150
F 0 "#PWR0415" H 6700 3000 50  0001 C CNN
F 1 "+5V" V 6715 3278 50  0000 L CNN
F 2 "" H 6700 3150 50  0001 C CNN
F 3 "" H 6700 3150 50  0001 C CNN
	1    6700 3150
	0    -1   -1   0   
$EndComp
Text Label 3500 1800 0    50   ~ 0
~RESET-OR-CLI
$Comp
L alexios:74HC74 U405
U 1 1 5D1DFC5F
P 5300 5100
F 0 "U405" H 5300 5517 50  0000 C CNN
F 1 "74HC74" H 5300 5426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5300 5100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5300 5100 50  0001 C CNN
	1    5300 5100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U405
U 2 1 5D1DFCDB
P 10100 1750
F 0 "U405" H 10100 2167 50  0000 C CNN
F 1 "74HC74" H 10100 2076 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10100 1750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 10100 1750 50  0001 C CNN
	2    10100 1750
	1    0    0    -1  
$EndComp
Text HLabel 2200 4600 0    50   Input ~ 0
~END
Text Label 2350 4600 0    50   ~ 0
~END
Wire Wire Line
	6350 5150 6750 5150
Wire Wire Line
	7600 2850 8350 2850
Wire Wire Line
	8350 4100 4250 4100
Wire Wire Line
	4250 4100 4250 4950
Wire Wire Line
	4250 4950 4850 4950
Wire Wire Line
	4150 5250 4850 5250
Wire Wire Line
	4850 5050 4800 5050
Wire Wire Line
	4800 5050 4800 5150
Wire Wire Line
	4850 5150 4800 5150
$Comp
L power:+5V #PWR0414
U 1 1 5D216290
P 4800 5050
F 0 "#PWR0414" H 4800 4900 50  0001 C CNN
F 1 "+5V" V 4815 5178 50  0000 L CNN
F 2 "" H 4800 5050 50  0001 C CNN
F 3 "" H 4800 5050 50  0001 C CNN
	1    4800 5050
	0    -1   -1   0   
$EndComp
Connection ~ 4800 5050
Wire Wire Line
	4800 3150 4850 3150
Text Label 4200 5250 0    50   ~ 0
~RESET-OR-CLI
Wire Wire Line
	6350 5150 6350 4550
Wire Wire Line
	4150 5250 4150 5450
Wire Wire Line
	4150 5450 6450 5450
Wire Wire Line
	6450 5450 6450 5250
Wire Wire Line
	6450 5250 6750 5250
Connection ~ 4150 5250
Wire Wire Line
	5750 4950 6250 4950
Wire Wire Line
	6250 4950 6250 5050
Wire Wire Line
	6250 5050 6750 5050
$Comp
L power:+5V #PWR0416
U 1 1 5D2F6551
P 6750 4950
F 0 "#PWR0416" H 6750 4800 50  0001 C CNN
F 1 "+5V" H 6765 5123 50  0000 C CNN
F 2 "" H 6750 4950 50  0001 C CNN
F 3 "" H 6750 4950 50  0001 C CNN
	1    6750 4950
	1    0    0    -1  
$EndComp
Text Label 4350 2300 0    50   ~ 0
IRQEN
Text Label 4350 2850 0    50   ~ 0
FI
Text Label 4350 2950 0    50   ~ 0
~IRQ
Text Label 4350 3050 0    50   ~ 0
CLK2
Text Label 7650 2850 0    50   ~ 0
~INT
Text Label 4350 4100 0    50   ~ 0
~INT
Text Label 4350 3350 0    50   ~ 0
CLK3
$Comp
L Connector:TestPoint TP403
U 1 1 5D388553
P 5750 5250
F 0 "TP403" V 5750 5438 50  0000 L CNN
F 1 "TestPoint" H 5808 5277 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5950 5250 50  0001 C CNN
F 3 "~" H 5950 5250 50  0001 C CNN
	1    5750 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 5250 8600 5250
Wire Wire Line
	6250 1500 8600 1500
Connection ~ 6250 1500
Text HLabel 8600 1500 2    50   Output ~ 0
FI
Text Label 2350 3350 0    50   ~ 0
CLK3
Text Notes 6650 2450 0    79   ~ 16
~IRQ~ Clock Domain Crossing
Text Notes 6650 4400 0    79   ~ 16
interrupt State
Text Label 4350 4950 0    50   ~ 0
~INT
$Comp
L Device:R_Small R?
U 1 1 5D4C3580
P 2950 2800
AR Path="/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D4C3580" Ref="R401"  Part="1" 
F 0 "R401" H 3009 2846 50  0000 L CNN
F 1 "4.7kΩ" H 3009 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2950 2800 50  0001 C CNN
F 3 "~" H 2950 2800 50  0001 C CNN
	1    2950 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2900 2950 2950
Connection ~ 2950 2950
Wire Wire Line
	2950 2950 4850 2950
$Comp
L power:+5V #PWR0409
U 1 1 5D4D2882
P 2950 2700
F 0 "#PWR0409" H 2950 2550 50  0001 C CNN
F 1 "+5V" H 2965 2873 50  0000 C CNN
F 2 "" H 2950 2700 50  0001 C CNN
F 3 "" H 2950 2700 50  0001 C CNN
	1    2950 2700
	1    0    0    -1  
$EndComp
Text Label 5800 2850 0    50   ~ 0
~INT₀
Text Notes 6500 1700 0    50   ~ 0
This is the Interrupt Flag (interrupt handling enabled)\ndisplayed on the front panel.
Wire Wire Line
	2200 3050 4850 3050
Text HLabel 2200 3050 0    50   Input ~ 0
CLK2
Wire Wire Line
	3450 1800 4150 1800
Wire Wire Line
	8350 2850 8350 4100
Wire Wire Line
	2200 4600 3000 4600
$Comp
L alexios:74LVC1G32 U404
U 1 1 5D5A4DFA
P 3200 4550
F 0 "U404" H 3250 4817 50  0000 C CNN
F 1 "74LVC1G32" H 3250 4726 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 3310 4530 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3310 4530 50  0001 C CNN
	1    3200 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4500 2200 4500
Text HLabel 2200 4500 0    50   Input ~ 0
CLK4
Text Label 2350 4500 0    50   ~ 0
CLK4
Wire Wire Line
	3500 4550 6350 4550
$Comp
L power:+5V #PWR0417
U 1 1 5D5E15D6
P 9600 1500
F 0 "#PWR0417" H 9600 1350 50  0001 C CNN
F 1 "+5V" H 9615 1673 50  0000 C CNN
F 2 "" H 9600 1500 50  0001 C CNN
F 3 "" H 9600 1500 50  0001 C CNN
	1    9600 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1500 9600 1600
Wire Wire Line
	9600 1900 9650 1900
Wire Wire Line
	9650 1800 9600 1800
Connection ~ 9600 1800
Wire Wire Line
	9600 1800 9600 1900
Wire Wire Line
	9600 1700 9650 1700
Connection ~ 9600 1700
Wire Wire Line
	9600 1700 9600 1800
Wire Wire Line
	9650 1600 9600 1600
Connection ~ 9600 1600
Wire Wire Line
	9600 1600 9600 1700
NoConn ~ 10550 1600
NoConn ~ 10550 1900
$Comp
L alexios:74HC74 U401
U 3 1 5D5EE74B
P 1550 7100
F 0 "U401" H 1730 7146 50  0000 L CNN
F 1 "74HC74" H 1730 7055 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1550 7100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1550 7100 50  0001 C CNN
	3    1550 7100
	1    0    0    -1  
$EndComp
Connection ~ 1200 7000
Connection ~ 1200 7200
$Comp
L alexios:74HC74 U403
U 3 1 5D5EEA24
P 3000 7100
F 0 "U403" H 3180 7146 50  0000 L CNN
F 1 "74HC74" H 3180 7055 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3000 7100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3000 7100 50  0001 C CNN
	3    3000 7100
	1    0    0    -1  
$EndComp
Connection ~ 2650 7000
Connection ~ 2650 7200
$Comp
L alexios:74HC74 U405
U 3 1 5D5EEA84
P 4450 7100
F 0 "U405" H 4630 7146 50  0000 L CNN
F 1 "74HC74" H 4630 7055 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4450 7100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4450 7100 50  0001 C CNN
	3    4450 7100
	1    0    0    -1  
$EndComp
Connection ~ 4100 7000
Connection ~ 4100 7200
$Comp
L alexios:74LVC1G08 U402
U 2 1 5D5F45BD
P 1650 6250
F 0 "U402" H 1730 6196 50  0000 L CNN
F 1 "74LVC1G08" H 1730 6105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 1300 6250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 1300 6250 50  0001 C CNN
	2    1650 6250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U404
U 2 1 5D5F462B
P 3050 6100
F 0 "U404" H 3180 5896 50  0000 L CNN
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
AR Path="/5F67D4B5/5D5F498A" Ref="C403"  Part="1" 
F 0 "C403" H 2559 6396 50  0000 R CNN
F 1 "100nF" H 2559 6305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2650 6350 50  0001 C CNN
F 3 "~" H 2650 6350 50  0001 C CNN
	1    2650 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0405
U 1 1 5D5F4991
P 2650 6250
F 0 "#PWR0405" H 2650 6100 50  0001 C CNN
F 1 "+5V" H 2665 6423 50  0000 C CNN
F 2 "" H 2650 6250 50  0001 C CNN
F 3 "" H 2650 6250 50  0001 C CNN
	1    2650 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0406
U 1 1 5D5F4997
P 2650 6450
F 0 "#PWR0406" H 2650 6200 50  0001 C CNN
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
L alexios:74HC74 U401
U 2 1 5D6227E0
P 7150 3000
F 0 "U401" H 7150 3417 50  0000 C CNN
F 1 "74HC74" H 7150 3326 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7150 3000 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7150 3000 50  0001 C CNN
	2    7150 3000
	1    0    0    -1  
$EndComp
Text Notes 2200 5250 0    50   ~ 0
Synchronise the interrupt assertion with\nthe end of the processor cycle. Otherwise,\n~IRQS~ will be asserted when the next micro-\ninstruction is fetched and ~END~ is deasserted,\nwhich is already too late to fetch the micro-\nprogram.
Wire Wire Line
	4150 1800 4150 5250
Connection ~ 4150 1800
Wire Wire Line
	4150 1800 4850 1800
Text Label 2350 3050 0    50   ~ 0
CLK2
Text HLabel 2200 3350 0    50   Input ~ 0
CLK3
Wire Wire Line
	2200 3350 6350 3350
NoConn ~ 7650 4950
$EndSCHEMATC
