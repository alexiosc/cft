EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 8
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
F 0 "C49" H 959 7296 50  0000 R CNN
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
F 0 "C50" H 2409 7296 50  0000 R CNN
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
F 0 "C51" H 3859 7296 50  0000 R CNN
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
$Comp
L Device:C_Small C?
U 1 1 5F85ED41
P 2500 6550
AR Path="/5CC0D65F/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F85ED41" Ref="C39"  Part="1" 
AR Path="/5DF0FEDA/5F85ED41" Ref="C47"  Part="1" 
F 0 "C47" H 2409 6596 50  0000 R CNN
F 1 "100nF" H 2409 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 6550 50  0001 C CNN
F 3 "~" H 2500 6550 50  0001 C CNN
	1    2500 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5DEFC7E1
P 2500 6450
AR Path="/5F67D4B5/5DEFC7E1" Ref="#PWR0104"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7E1" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 2500 6300 50  0001 C CNN
F 1 "+5V" H 2515 6623 50  0000 C CNN
F 2 "" H 2500 6450 50  0001 C CNN
F 3 "" H 2500 6450 50  0001 C CNN
	1    2500 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5DEFC7E2
P 2500 6650
AR Path="/5F67D4B5/5DEFC7E2" Ref="#PWR0106"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7E2" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 2500 6400 50  0001 C CNN
F 1 "GND" H 2505 6477 50  0000 C CNN
F 2 "" H 2500 6650 50  0001 C CNN
F 3 "" H 2500 6650 50  0001 C CNN
	1    2500 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U54
U 1 1 5DEFC7B2
P 5300 3400
AR Path="/5F67D4B5/5DEFC7B2" Ref="U54"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7B2" Ref="U70"  Part="1" 
F 0 "U70" H 5225 3225 50  0000 C CNN
F 1 "74LVC1G08" H 5225 3134 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 4950 3400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 4950 3400 50  0001 C CNN
	1    5300 3400
	1    0    0    -1  
$EndComp
Text Label 6350 3350 2    50   ~ 0
~RESET-OR-CLI
$Comp
L Device:C_Small C?
U 1 1 5DEFC7B6
P 3950 6550
AR Path="/5CC0D65F/5DEFC7B6" Ref="C?"  Part="1" 
AR Path="/5DEFC7B6" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7B6" Ref="C40"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7B6" Ref="C48"  Part="1" 
F 0 "C48" H 3859 6596 50  0000 R CNN
F 1 "100nF" H 3859 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3950 6550 50  0001 C CNN
F 3 "~" H 3950 6550 50  0001 C CNN
	1    3950 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5DEFC7B7
P 3950 6450
AR Path="/5F67D4B5/5DEFC7B7" Ref="#PWR0105"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7B7" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 3950 6300 50  0001 C CNN
F 1 "+5V" H 3965 6623 50  0000 C CNN
F 2 "" H 3950 6450 50  0001 C CNN
F 3 "" H 3950 6450 50  0001 C CNN
	1    3950 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D5F4997
P 3950 6650
AR Path="/5F67D4B5/5D5F4997" Ref="#PWR0107"  Part="1" 
AR Path="/5DF0FEDA/5D5F4997" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 3950 6400 50  0001 C CNN
F 1 "GND" H 3955 6477 50  0000 C CNN
F 2 "" H 3950 6650 50  0001 C CNN
F 3 "" H 3950 6650 50  0001 C CNN
	1    3950 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U56
U 1 1 5DEFC7B9
P 8950 4450
AR Path="/5F67D4B5/5DEFC7B9" Ref="U56"  Part="2" 
AR Path="/5DF0FEDA/5DEFC7B9" Ref="U72"  Part="1" 
F 0 "U72" H 8950 4867 50  0000 C CNN
F 1 "74AC74" H 8950 4776 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8950 4450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 8950 4450 50  0001 C CNN
	1    8950 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5150 7900 5150
$Comp
L alexios:74LVC1G32 U57
U 1 1 5D5A4DFA
P 5200 5150
AR Path="/5F67D4B5/5D5A4DFA" Ref="U57"  Part="1" 
AR Path="/5DF0FEDA/5D5A4DFA" Ref="U73"  Part="1" 
F 0 "U73" H 5250 5417 50  0000 C CNN
F 1 "74LVC1G32" H 5250 5326 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 5310 5130 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5310 5130 50  0001 C CNN
	1    5200 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4500 8500 4500
Wire Wire Line
	4700 3850 4700 4300
Wire Wire Line
	4700 4300 5000 4300
Text Label 5000 4300 2    50   ~ 0
~FI
Text Label 5000 4400 2    50   ~ 0
~IRQ
$Comp
L Connector:TestPoint TP14
U 1 1 5F9307F3
P 7250 4700
AR Path="/5F67D4B5/5F9307F3" Ref="TP14"  Part="1" 
AR Path="/5DF0FEDA/5F9307F3" Ref="TP17"  Part="1" 
F 0 "TP17" V 7250 4888 50  0000 L CNN
F 1 "TestPoint" H 7308 4727 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 7450 4700 50  0001 C CNN
F 3 "~" H 7450 4700 50  0001 C CNN
	1    7250 4700
	0    1    1    0   
$EndComp
$Comp
L alexios:74HC74 U53
U 2 1 5DEFC7B1
P 6800 4550
AR Path="/5F67D4B5/5DEFC7B1" Ref="U53"  Part="2" 
AR Path="/5DF0FEDA/5DEFC7B1" Ref="U69"  Part="2" 
F 0 "U69" H 6800 4967 50  0000 C CNN
F 1 "74AC74" H 6800 4876 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6800 4550 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6800 4550 50  0001 C CNN
	2    6800 4550
	1    0    0    -1  
$EndComp
Text Label 7300 4400 0    50   ~ 0
INTERRUPT
Text Label 5750 5150 0    50   ~ 0
ENDCP
Wire Wire Line
	7900 4500 7900 5150
Text Label 8500 4500 2    50   ~ 0
ENDCP
Wire Wire Line
	5550 4400 6350 4400
$Comp
L alexios:74LVC1G332 U55
U 1 1 5DEFC7BC
P 5350 4350
AR Path="/5F67D4B5/5DEFC7BC" Ref="U55"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7BC" Ref="U71"  Part="1" 
F 0 "U71" H 5275 4614 50  0000 C CNN
F 1 "74LVC1G332" H 5275 4523 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 6250 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 6250 4400 50  0001 C CNN
	1    5350 4350
	1    0    0    -1  
$EndComp
Text Label 6350 4400 2    50   ~ 0
~IRQSYNC
Text Label 5000 4500 2    50   ~ 0
CLK1
Wire Wire Line
	7250 4400 7800 4400
Text Label 6350 4700 2    50   ~ 0
~RESET-OR-CLI
Wire Wire Line
	6350 4700 5600 4700
Wire Wire Line
	5600 4700 5600 3400
Text Label 6350 3050 2    50   ~ 0
~ACTION-STI
Wire Wire Line
	5600 3350 6350 3350
Wire Wire Line
	7400 3350 7450 3350
Connection ~ 7400 3350
Wire Wire Line
	7400 3850 4700 3850
Wire Wire Line
	7400 3350 7400 3850
Text Label 7250 3350 0    50   ~ 0
~FI
Wire Wire Line
	7250 3350 7400 3350
$Comp
L Connector:TestPoint TP12
U 1 1 5D12B3FF
P 7450 3350
AR Path="/5F67D4B5/5D12B3FF" Ref="TP12"  Part="1" 
AR Path="/5DF0FEDA/5D12B3FF" Ref="TP15"  Part="1" 
F 0 "TP15" V 7450 3538 50  0000 L CNN
F 1 "TestPoint" H 7508 3377 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 7650 3350 50  0001 C CNN
F 3 "~" H 7650 3350 50  0001 C CNN
	1    7450 3350
	0    1    1    0   
$EndComp
Text Label 7500 3050 0    50   ~ 0
FI
$Comp
L power:+5V #PWR0102
U 1 1 5DDA768D
P 8500 4300
AR Path="/5F67D4B5/5DDA768D" Ref="#PWR0102"  Part="1" 
AR Path="/5DF0FEDA/5DDA768D" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 8500 4150 50  0001 C CNN
F 1 "+5V" V 8515 4428 50  0000 L CNN
F 2 "" H 8500 4300 50  0001 C CNN
F 3 "" H 8500 4300 50  0001 C CNN
	1    8500 4300
	0    -1   -1   0   
$EndComp
Text HLabel 10250 5250 2    50   Output ~ 0
~IRQSµC
Text HLabel 10250 4600 2    50   Output ~ 0
~IRQS
Text Notes 8350 6350 0    50   ~ 0
~IRQS~ and ~IRQµC~ are the same signal.\nThe former is output to the bus. The latter is\nfor the Microcode Store. We drive them separately\nto keep the capacitance down and because the one going\nto the Microcode Store is more important and must be\nless loaded (and thus rise faster).\n\nTODO: Drive ~IRQSµC using the leftover FF.
Wire Wire Line
	10000 4600 10250 4600
$Comp
L alexios:74LVC1G08 U54
U 2 1 5DDC8304
P 2950 6450
AR Path="/5F67D4B5/5DDC8304" Ref="U54"  Part="2" 
AR Path="/5DF0FEDA/5DDC8304" Ref="U70"  Part="2" 
F 0 "U70" H 3030 6396 50  0000 L CNN
F 1 "74LVC1G08" H 3030 6305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 2600 6450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2600 6450 50  0001 C CNN
	2    2950 6450
	1    0    0    -1  
$EndComp
Connection ~ 2500 6650
Connection ~ 2500 6450
$Comp
L alexios:74LVC1G332 U55
U 2 1 5DDC8CF0
P 1500 7050
AR Path="/5F67D4B5/5DDC8CF0" Ref="U55"  Part="2" 
AR Path="/5DF0FEDA/5DDC8CF0" Ref="U71"  Part="2" 
F 0 "U71" H 1580 6896 50  0000 L CNN
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
P 4350 6300
AR Path="/5F67D4B5/5DDC95B7" Ref="U57"  Part="2" 
AR Path="/5DF0FEDA/5DDC95B7" Ref="U73"  Part="2" 
F 0 "U73" H 4480 6096 50  0000 L CNN
F 1 "74LVC1G32" H 4480 6005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 4460 6280 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4460 6280 50  0001 C CNN
	2    4350 6300
	1    0    0    -1  
$EndComp
Connection ~ 3950 6650
Connection ~ 3950 6450
Connection ~ 2500 7150
Connection ~ 2500 7350
Connection ~ 3950 7150
Connection ~ 3950 7350
Wire Wire Line
	8500 4600 8000 4600
Wire Wire Line
	8000 5350 4600 5350
Connection ~ 4600 3350
Wire Wire Line
	4600 3350 5000 3350
Text Label 8500 4600 2    50   ~ 0
~RESET
$Comp
L Device:R_Small R?
U 1 1 5DEFC7C3
P 7350 3050
AR Path="/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DEFC7C3" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DEFC7C3" Ref="R4"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7C3" Ref="R7"  Part="1" 
F 0 "R7" V 7154 3050 50  0000 C CNN
F 1 "30Ω" V 7245 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7350 3050 50  0001 C CNN
F 3 "~" H 7350 3050 50  0001 C CNN
	1    7350 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 4500 6300 4600
$Comp
L power:+5V #PWR0103
U 1 1 5DF03A6D
P 6300 4500
AR Path="/5F67D4B5/5DF03A6D" Ref="#PWR0103"  Part="1" 
AR Path="/5DF0FEDA/5DF03A6D" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 6300 4350 50  0001 C CNN
F 1 "+5V" V 6315 4628 50  0000 L CNN
F 2 "" H 6300 4500 50  0001 C CNN
F 3 "" H 6300 4500 50  0001 C CNN
	1    6300 4500
	0    -1   -1   0   
$EndComp
Connection ~ 6300 4500
Wire Wire Line
	6350 4600 6300 4600
Wire Wire Line
	6350 4500 6300 4500
Text Notes 4400 3150 0    50   ~ 0
(FI bit for retrieving FI from stack)
Wire Wire Line
	4600 5350 4600 3350
Wire Wire Line
	5450 3400 5600 3400
Connection ~ 5600 3400
Wire Wire Line
	5600 3400 5600 3350
Text Label 6350 3250 2    50   ~ 0
~FLAGWE
Text Label 6350 3150 2    50   ~ 0
IBUS15
Text Notes 4550 2050 0    63   ~ 13
Assumption
Text Notes 4550 2450 0    50   ~ 0
~ACTION_STI~ and ~ACTION_CLI~ remain de-asserted\nwhile flags are being written using ~FLAGWE~. This is\ncurrently valid: no microprogram asserts these actions\nwhile also setting or retrieving flag values.
$Comp
L alexios:74HC74 U58
U 3 1 5DDCAF4B
P 4300 7250
AR Path="/5F67D4B5/5DDCAF4B" Ref="U58"  Part="3" 
AR Path="/5DF0FEDA/5DDCAF4B" Ref="U74"  Part="3" 
F 0 "U74" H 4480 7296 50  0000 L CNN
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
F 0 "U69" H 3030 7296 50  0000 L CNN
F 1 "74AC74" H 3030 7205 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2850 7250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2850 7250 50  0001 C CNN
	3    2850 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U53
U 1 1 5DEFC7B0
P 6800 3200
AR Path="/5F67D4B5/5DEFC7B0" Ref="U53"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7B0" Ref="U69"  Part="1" 
F 0 "U69" H 6800 3617 50  0000 C CNN
F 1 "74AC74" H 6800 3526 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6800 3200 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6800 3200 50  0001 C CNN
	1    6800 3200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U58
U 2 1 5E4DB3A3
P 8950 5100
AR Path="/5F67D4B5/5E4DB3A3" Ref="U58"  Part="2" 
AR Path="/5DF0FEDA/5E4DB3A3" Ref="U74"  Part="2" 
F 0 "U74" H 8950 4775 50  0000 C CNN
F 1 "74AC74" H 8950 4684 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8950 5100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 8950 5100 50  0001 C CNN
	2    8950 5100
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
Text Notes 7250 2600 0    50   ~ 0
Use LVC or AC family for flip-flops.\nIt reduces the chances of metastability.
Text Notes 8150 3000 0    79   ~ 16
Enabling Interrupts (~STI~)
Text Notes 8000 3250 0    50   ~ 0
This is the Interrupt Flag (interrupt handling enabled)\ndisplayed on the front panel.
NoConn ~ 3350 1750
NoConn ~ 3350 1650
NoConn ~ 3350 2050
Text HLabel 1700 1300 0    50   Input ~ 0
ACTION[0..3]
Wire Wire Line
	2350 1550 2000 1550
Wire Wire Line
	2350 1650 2000 1650
Wire Wire Line
	2350 1750 2000 1750
Wire Wire Line
	2350 2250 2000 2250
Text Notes 2900 2200 1    50   ~ 10
ACTION=0xxx
NoConn ~ 3350 2250
NoConn ~ 3350 2150
NoConn ~ 3350 1550
Text Label 3900 1950 2    50   ~ 0
~ACTION-CLI
$Comp
L power:GND #PWR?
U 1 1 5E4F2A89
P 2350 2350
AR Path="/5E4F2A89" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5E4F2A89" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5E4F2A89" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E4F2A89" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEDA/5E4F2A89" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 2100 50  0001 C CNN
F 1 "GND" H 2355 2177 50  0000 C CNN
F 2 "" H 2350 2350 50  0001 C CNN
F 3 "" H 2350 2350 50  0001 C CNN
	1    2350 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E4F2A8F
P 2350 2150
AR Path="/5E4F2A8F" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5E4F2A8F" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5E4F2A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E4F2A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEDA/5E4F2A8F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 2000 50  0001 C CNN
F 1 "+5V" H 2365 2323 50  0000 C CNN
F 2 "" H 2350 2150 50  0001 C CNN
F 3 "" H 2350 2150 50  0001 C CNN
	1    2350 2150
	1    0    0    -1  
$EndComp
Text Label 2350 2250 2    50   ~ 0
ACTION3
Text Label 2350 1750 2    50   ~ 0
ACTION2
Text Label 2350 1650 2    50   ~ 0
ACTION1
Text Label 2350 1550 2    50   ~ 0
ACTION0
$Comp
L alexios:74HC138 U?
U 1 1 5E4F2A99
P 2850 1950
AR Path="/5F3EA987/5E4F2A99" Ref="U?"  Part="1" 
AR Path="/5E4F2A99" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E4F2A99" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E4F2A99" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E4F2A99" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5E4F2A99" Ref="U?"  Part="1" 
AR Path="/5DF0FEDA/5E4F2A99" Ref="U?"  Part="1" 
F 0 "U?" H 2850 2617 50  0000 C CNN
F 1 "74HC138" H 2850 2526 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2850 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2850 1950 50  0001 C CNN
	1    2850 1950
	1    0    0    -1  
$EndComp
Entry Wire Line
	1900 1450 2000 1550
Entry Wire Line
	1900 1550 2000 1650
Entry Wire Line
	1900 1650 2000 1750
Entry Wire Line
	1900 2150 2000 2250
Entry Bus Bus
	1800 1300 1900 1400
Wire Bus Line
	1700 1300 1800 1300
Text Label 1900 2100 1    50   ~ 0
ACTION[0..3]
$Comp
L Device:C_Small C?
U 1 1 5E506314
P 1050 6550
AR Path="/5CC0D65F/5E506314" Ref="C?"  Part="1" 
AR Path="/5E506314" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5E506314" Ref="C?"  Part="1" 
AR Path="/5DF0FEDA/5E506314" Ref="C?"  Part="1" 
F 0 "C?" H 959 6596 50  0000 R CNN
F 1 "100nF" H 959 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 6550 50  0001 C CNN
F 3 "~" H 1050 6550 50  0001 C CNN
	1    1050 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E50631A
P 1050 6450
AR Path="/5F67D4B5/5E50631A" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEDA/5E50631A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1050 6300 50  0001 C CNN
F 1 "+5V" H 1065 6623 50  0000 C CNN
F 2 "" H 1050 6450 50  0001 C CNN
F 3 "" H 1050 6450 50  0001 C CNN
	1    1050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E506320
P 1050 6650
AR Path="/5F67D4B5/5E506320" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEDA/5E506320" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1050 6400 50  0001 C CNN
F 1 "GND" H 1055 6477 50  0000 C CNN
F 2 "" H 1050 6650 50  0001 C CNN
F 3 "" H 1050 6650 50  0001 C CNN
	1    1050 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5E50551D
P 1400 6550
AR Path="/5F3EA987/5E50551D" Ref="U?"  Part="1" 
AR Path="/5E50551D" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E50551D" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E50551D" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E50551D" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5E50551D" Ref="U?"  Part="1" 
AR Path="/5DF0FEDA/5E50551D" Ref="U?"  Part="2" 
F 0 "U?" H 1580 6596 50  0000 L CNN
F 1 "74HC138" H 1580 6505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1400 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1400 6550 50  0001 C CNN
	2    1400 6550
	1    0    0    -1  
$EndComp
Connection ~ 1050 6450
Connection ~ 1050 6650
$Comp
L power:+5V #PWR?
U 1 1 5E5204C8
P 8500 4950
AR Path="/5F67D4B5/5E5204C8" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FEDA/5E5204C8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8500 4800 50  0001 C CNN
F 1 "+5V" V 8515 5078 50  0000 L CNN
F 2 "" H 8500 4950 50  0001 C CNN
F 3 "" H 8500 4950 50  0001 C CNN
	1    8500 4950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP13
U 1 1 5DEFC7E4
P 9400 4300
AR Path="/5F67D4B5/5DEFC7E4" Ref="TP13"  Part="1" 
AR Path="/5DF0FEDA/5DEFC7E4" Ref="TP16"  Part="1" 
F 0 "TP16" V 9400 4488 50  0000 L CNN
F 1 "TestPoint" H 9458 4327 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 9600 4300 50  0001 C CNN
F 3 "~" H 9600 4300 50  0001 C CNN
	1    9400 4300
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E5274EB
P 9400 4950
AR Path="/5F67D4B5/5E5274EB" Ref="TP?"  Part="1" 
AR Path="/5DF0FEDA/5E5274EB" Ref="TP?"  Part="1" 
F 0 "TP?" V 9400 5138 50  0000 L CNN
F 1 "TestPoint" H 9458 4977 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 9600 4950 50  0001 C CNN
F 3 "~" H 9600 4950 50  0001 C CNN
	1    9400 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 5250 10250 5250
Wire Wire Line
	7900 5150 8500 5150
Connection ~ 7900 5150
Wire Wire Line
	8000 4600 8000 5250
Wire Wire Line
	8500 5250 8000 5250
Connection ~ 8000 5250
Wire Wire Line
	8000 5250 8000 5350
Text Label 8500 5150 2    50   ~ 0
ENDCP
Text Label 8500 5250 2    50   ~ 0
~RESET
Wire Wire Line
	8500 5050 7800 5050
Wire Wire Line
	7800 5050 7800 4400
Connection ~ 7800 4400
Wire Wire Line
	7800 4400 8500 4400
Text Label 8500 4400 2    50   ~ 0
INTERRUPT
Text Label 8500 5050 2    50   ~ 0
INTERRUPT
Wire Wire Line
	7450 3050 10250 3050
Text HLabel 10250 3050 2    50   Output ~ 0
FI
Wire Wire Line
	9400 4600 9800 4600
$Comp
L Device:R_Small R?
U 1 1 5DDB48AD
P 9900 4600
AR Path="/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5D54E677/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5DDB48AD" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5DDB48AD" Ref="R6"  Part="1" 
AR Path="/5DF0FEDA/5DDB48AD" Ref="R9"  Part="1" 
F 0 "R9" V 10004 4600 50  0000 C CNN
F 1 "30Ω" V 10095 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 9900 4600 50  0001 C CNN
F 3 "~" H 9900 4600 50  0001 C CNN
	1    9900 4600
	0    1    1    0   
$EndComp
Text Label 3650 3250 0    50   ~ 0
~FLAGWE
Wire Wire Line
	3500 3250 6350 3250
Text HLabel 3500 3250 0    50   Input ~ 0
~FLAGWE
Text Label 3650 3150 0    50   ~ 0
IBUS15
Wire Wire Line
	3500 3150 6350 3150
Text HLabel 3500 3150 0    50   Input ~ 0
IBUS15
Wire Wire Line
	3500 3350 4600 3350
Text Label 3700 4500 0    50   ~ 0
CLK1
Text HLabel 3550 4500 0    50   Input ~ 0
CLK1
Wire Wire Line
	5000 4500 3550 4500
Connection ~ 4000 4400
Wire Wire Line
	4000 4400 5000 4400
Text Label 3700 4400 0    50   ~ 0
~IRQ
Text HLabel 3550 4400 0    50   Input ~ 0
~IRQ
Wire Wire Line
	3550 4400 4000 4400
Text HLabel 3550 5200 0    50   Input ~ 0
~END
Text Label 3700 5200 0    50   ~ 0
~END
$Comp
L Device:R_Small R?
U 1 1 5D4C3580
P 4000 4250
AR Path="/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D4C3580" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D4C3580" Ref="R5"  Part="1" 
AR Path="/5DF0FEDA/5D4C3580" Ref="R8"  Part="1" 
F 0 "R8" H 4059 4296 50  0000 L CNN
F 1 "4.7kΩ" H 4059 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4000 4250 50  0001 C CNN
F 3 "~" H 4000 4250 50  0001 C CNN
	1    4000 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4350 4000 4400
$Comp
L power:+5V #PWR0101
U 1 1 5D4D2882
P 4000 4150
AR Path="/5F67D4B5/5D4D2882" Ref="#PWR0101"  Part="1" 
AR Path="/5DF0FEDA/5D4D2882" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 4000 4000 50  0001 C CNN
F 1 "+5V" H 4015 4323 50  0000 C CNN
F 2 "" H 4000 4150 50  0001 C CNN
F 3 "" H 4000 4150 50  0001 C CNN
	1    4000 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5200 5000 5200
Wire Wire Line
	5000 5100 3550 5100
Text HLabel 3550 5100 0    50   Input ~ 0
CLK4
Text Label 3700 5100 0    50   ~ 0
CLK4
Text Label 3650 3350 0    50   ~ 0
~RESET
Text HLabel 3500 3350 0    50   Input ~ 0
~RESET
Wire Wire Line
	4100 1850 4100 3050
Wire Wire Line
	3350 1850 4100 1850
Wire Wire Line
	4100 3050 6350 3050
Wire Wire Line
	4000 3450 5000 3450
Wire Wire Line
	3350 1950 4000 1950
Wire Wire Line
	4000 1950 4000 3450
Text Label 3900 1850 2    50   ~ 0
~ACTION-STI
Text Label 4100 2300 3    50   ~ 0
~ACTION-STI
Text Label 4000 2300 3    50   ~ 0
~ACTION-CLI
Wire Notes Line width 20 style solid
	4450 2600 4450 1850
Wire Notes Line width 20 style solid
	6800 2600 4450 2600
Wire Notes Line width 20 style solid
	6800 1850 6800 2600
Wire Notes Line width 20 style solid
	4450 1850 6800 1850
Wire Bus Line
	1900 1400 1900 2150
$EndSCHEMATC
