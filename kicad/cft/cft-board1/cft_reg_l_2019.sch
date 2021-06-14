EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 19
Title "The L Register"
Date "2019-11-17"
Rev "2020"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 "reg_l.v"
$EndDescr
Text HLabel 9800 1750 2    50   Output ~ 0
FLFAST
Text HLabel 5600 2650 0    50   Input ~ 0
CLK4
Wire Wire Line
	5600 2400 5150 2400
Text Label 5150 2100 0    50   ~ 0
~SETL
Text Label 5150 2400 0    50   ~ 0
~CLRL
Text Label 5150 2300 0    50   ~ 0
BCP
Text Label 5150 2200 0    50   ~ 0
FLOUT-SRU
Wire Wire Line
	6500 2100 6800 2100
Wire Wire Line
	5600 3150 5150 3150
Wire Wire Line
	5600 3450 5150 3450
Text Label 5150 3150 0    50   ~ 0
~SETV
Text Label 5150 3450 0    50   ~ 0
~CLRV
$Comp
L alexios:74HC74 U?
U 1 1 611FBA53
P 7650 2250
AR Path="/5DC89E19/611FBA53" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/611FBA53" Ref="U?"  Part="1" 
AR Path="/5D121AA3/611FBA53" Ref="U803"  Part="1" 
F 0 "U803" H 7650 2667 50  0000 C CNN
F 1 "74AC74" H 7650 2576 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7600 2400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7600 2400 50  0001 C CNN
	1    7650 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 611FBA59
P 7650 3300
AR Path="/5DC89E19/611FBA59" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/611FBA59" Ref="U?"  Part="1" 
AR Path="/5D121AA3/611FBA59" Ref="U803"  Part="2" 
F 0 "U803" H 7650 3717 50  0000 C CNN
F 1 "74AC74" H 7650 3626 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7600 3450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7600 3450 50  0001 C CNN
	2    7650 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 1 1 612043E3
P 9050 2250
AR Path="/5DC89E19/612043E3" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/612043E3" Ref="U?"  Part="1" 
AR Path="/5D121AA3/612043E3" Ref="U804"  Part="1" 
F 0 "U804" H 9050 2667 50  0000 C CNN
F 1 "74AC74" H 9050 2576 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 9000 2400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 9000 2400 50  0001 C CNN
	1    9050 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 612043E9
P 9050 3300
AR Path="/5DC89E19/612043E9" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/612043E9" Ref="U?"  Part="1" 
AR Path="/5D121AA3/612043E9" Ref="U804"  Part="2" 
F 0 "U804" H 9050 3717 50  0000 C CNN
F 1 "74AC74" H 9050 3626 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 9000 3450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 9000 3450 50  0001 C CNN
	2    9050 3300
	1    0    0    -1  
$EndComp
Text Label 6900 2200 0    50   ~ 0
FLFAST
Wire Wire Line
	6800 2200 7200 2200
Text Label 6900 2400 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	7200 2400 6900 2400
Text Label 6900 2300 0    50   ~ 0
CLK4
Wire Wire Line
	6800 2100 6800 2200
$Comp
L power:+5V #PWR?
U 1 1 61272365
P 7150 2050
AR Path="/5DC89E19/61272365" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/61272365" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/61272365" Ref="#PWR0801"  Part="1" 
F 0 "#PWR0801" H 7150 1900 50  0001 C CNN
F 1 "+5V" H 7165 2223 50  0000 C CNN
F 2 "" H 7150 2050 50  0001 C CNN
F 3 "" H 7150 2050 50  0001 C CNN
	1    7150 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2050 7150 2100
Wire Wire Line
	7150 2100 7200 2100
Wire Wire Line
	8250 2750 8250 2300
Wire Wire Line
	8250 2300 8600 2300
Wire Wire Line
	6800 2300 6800 2650
Wire Wire Line
	6800 2300 7200 2300
Wire Wire Line
	6500 3150 6600 3150
Wire Wire Line
	6600 3150 6600 3250
Wire Wire Line
	6600 3250 7200 3250
Text Label 8400 2300 0    50   ~ 0
CLK1
Wire Wire Line
	8100 2100 8250 2100
Wire Wire Line
	8250 2100 8250 2200
Wire Wire Line
	8250 2200 8600 2200
Text Label 8300 2400 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	8300 2400 8600 2400
$Comp
L power:+5V #PWR?
U 1 1 61327614
P 7150 3100
AR Path="/5DC89E19/61327614" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/61327614" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/61327614" Ref="#PWR0803"  Part="1" 
F 0 "#PWR0803" H 7150 2950 50  0001 C CNN
F 1 "+5V" H 7165 3273 50  0000 C CNN
F 2 "" H 7150 3100 50  0001 C CNN
F 3 "" H 7150 3100 50  0001 C CNN
	1    7150 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3100 7150 3150
Wire Wire Line
	7150 3150 7200 3150
Text Label 6900 3450 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	7200 3450 6900 3450
Text Label 10250 3150 2    50   ~ 0
FV
Text HLabel 10300 3150 2    50   Output ~ 0
FV
Text HLabel 10300 2100 2    50   Input ~ 0
FL
Text Label 10250 2100 2    50   ~ 0
FL
NoConn ~ 9500 2400
NoConn ~ 6500 2400
NoConn ~ 6500 3450
Text Label 5650 2650 0    50   ~ 0
CLK4
$Comp
L power:+5V #PWR?
U 1 1 6137B1EF
P 8550 2050
AR Path="/5DC89E19/6137B1EF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/6137B1EF" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/6137B1EF" Ref="#PWR0802"  Part="1" 
F 0 "#PWR0802" H 8550 1900 50  0001 C CNN
F 1 "+5V" H 8565 2223 50  0000 C CNN
F 2 "" H 8550 2050 50  0001 C CNN
F 3 "" H 8550 2050 50  0001 C CNN
	1    8550 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2050 8550 2100
Wire Wire Line
	8550 2100 8600 2100
Text Label 6900 3350 0    50   ~ 0
CLK4
$Comp
L power:+5V #PWR?
U 1 1 613C2712
P 3100 4350
AR Path="/613C2712" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/613C2712" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/613C2712" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/613C2712" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/613C2712" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/613C2712" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/613C2712" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/613C2712" Ref="#PWR0805"  Part="1" 
F 0 "#PWR0805" H 3100 4200 50  0001 C CNN
F 1 "+5V" H 3115 4523 50  0000 C CNN
F 2 "" H 3100 4350 50  0001 C CNN
F 3 "" H 3100 4350 50  0001 C CNN
	1    3100 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 613C2718
P 3100 4550
AR Path="/613C2718" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/613C2718" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/613C2718" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/613C2718" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/613C2718" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/613C2718" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/613C2718" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/613C2718" Ref="#PWR0809"  Part="1" 
F 0 "#PWR0809" H 3100 4300 50  0001 C CNN
F 1 "GND" H 3105 4377 50  0000 C CNN
F 2 "" H 3100 4550 50  0001 C CNN
F 3 "" H 3100 4550 50  0001 C CNN
	1    3100 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 613C271E
P 3100 4450
AR Path="/5CC0D65F/613C271E" Ref="C?"  Part="1" 
AR Path="/613C271E" Ref="C?"  Part="1" 
AR Path="/5F597FD4/613C271E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/613C271E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/613C271E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/613C271E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/613C271E" Ref="C?"  Part="1" 
AR Path="/5DE3C078/613C271E" Ref="C?"  Part="1" 
AR Path="/5D121AA3/613C271E" Ref="C801"  Part="1" 
F 0 "C801" H 3009 4496 50  0000 R CNN
F 1 "100nF" H 3009 4405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3100 4450 50  0001 C CNN
F 3 "~" H 3100 4450 50  0001 C CNN
	1    3100 4450
	1    0    0    -1  
$EndComp
Connection ~ 3100 4550
Connection ~ 3100 4350
$Comp
L power:+5V #PWR?
U 1 1 614226E3
P 5750 4350
AR Path="/614226E3" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/614226E3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/614226E3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/614226E3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/614226E3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/614226E3" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/614226E3" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/614226E3" Ref="#PWR0806"  Part="1" 
F 0 "#PWR0806" H 5750 4200 50  0001 C CNN
F 1 "+5V" H 5765 4523 50  0000 C CNN
F 2 "" H 5750 4350 50  0001 C CNN
F 3 "" H 5750 4350 50  0001 C CNN
	1    5750 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614226E9
P 5750 4550
AR Path="/614226E9" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/614226E9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/614226E9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/614226E9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/614226E9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/614226E9" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/614226E9" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/614226E9" Ref="#PWR0810"  Part="1" 
F 0 "#PWR0810" H 5750 4300 50  0001 C CNN
F 1 "GND" H 5755 4377 50  0000 C CNN
F 2 "" H 5750 4550 50  0001 C CNN
F 3 "" H 5750 4550 50  0001 C CNN
	1    5750 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 614226EF
P 5750 4450
AR Path="/5CC0D65F/614226EF" Ref="C?"  Part="1" 
AR Path="/614226EF" Ref="C?"  Part="1" 
AR Path="/5F597FD4/614226EF" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/614226EF" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/614226EF" Ref="C?"  Part="1" 
AR Path="/5DC89E19/614226EF" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/614226EF" Ref="C?"  Part="1" 
AR Path="/5DE3C078/614226EF" Ref="C?"  Part="1" 
AR Path="/5D121AA3/614226EF" Ref="C802"  Part="1" 
F 0 "C802" H 5659 4496 50  0000 R CNN
F 1 "100nF" H 5659 4405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5750 4450 50  0001 C CNN
F 3 "~" H 5750 4450 50  0001 C CNN
	1    5750 4450
	1    0    0    -1  
$EndComp
Connection ~ 5750 4350
Connection ~ 5750 4550
$Comp
L power:+5V #PWR?
U 1 1 6142C816
P 7350 4350
AR Path="/6142C816" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/6142C816" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/6142C816" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/6142C816" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/6142C816" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/6142C816" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/6142C816" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/6142C816" Ref="#PWR0807"  Part="1" 
F 0 "#PWR0807" H 7350 4200 50  0001 C CNN
F 1 "+5V" H 7365 4523 50  0000 C CNN
F 2 "" H 7350 4350 50  0001 C CNN
F 3 "" H 7350 4350 50  0001 C CNN
	1    7350 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6142C81C
P 7350 4550
AR Path="/6142C81C" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/6142C81C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/6142C81C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/6142C81C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/6142C81C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/6142C81C" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/6142C81C" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/6142C81C" Ref="#PWR0811"  Part="1" 
F 0 "#PWR0811" H 7350 4300 50  0001 C CNN
F 1 "GND" H 7355 4377 50  0000 C CNN
F 2 "" H 7350 4550 50  0001 C CNN
F 3 "" H 7350 4550 50  0001 C CNN
	1    7350 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6142C822
P 7350 4450
AR Path="/5CC0D65F/6142C822" Ref="C?"  Part="1" 
AR Path="/6142C822" Ref="C?"  Part="1" 
AR Path="/5F597FD4/6142C822" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/6142C822" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/6142C822" Ref="C?"  Part="1" 
AR Path="/5DC89E19/6142C822" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/6142C822" Ref="C?"  Part="1" 
AR Path="/5DE3C078/6142C822" Ref="C?"  Part="1" 
AR Path="/5D121AA3/6142C822" Ref="C803"  Part="1" 
F 0 "C803" H 7259 4496 50  0000 R CNN
F 1 "100nF" H 7259 4405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7350 4450 50  0001 C CNN
F 3 "~" H 7350 4450 50  0001 C CNN
	1    7350 4450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 3 1 6142C828
P 7700 4450
AR Path="/5DC89E19/6142C828" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/6142C828" Ref="U?"  Part="1" 
AR Path="/5D121AA3/6142C828" Ref="U803"  Part="3" 
F 0 "U803" H 7700 4867 50  0000 C CNN
F 1 "74AC74" H 7700 4776 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7650 4600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7650 4600 50  0001 C CNN
	3    7700 4450
	1    0    0    -1  
$EndComp
Connection ~ 7350 4350
Connection ~ 7350 4550
$Comp
L power:+5V #PWR?
U 1 1 61433656
P 8600 4350
AR Path="/61433656" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/61433656" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/61433656" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/61433656" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/61433656" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/61433656" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/61433656" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/61433656" Ref="#PWR0808"  Part="1" 
F 0 "#PWR0808" H 8600 4200 50  0001 C CNN
F 1 "+5V" H 8615 4523 50  0000 C CNN
F 2 "" H 8600 4350 50  0001 C CNN
F 3 "" H 8600 4350 50  0001 C CNN
	1    8600 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6143365C
P 8600 4550
AR Path="/6143365C" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/6143365C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/6143365C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/6143365C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/6143365C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/6143365C" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/6143365C" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/6143365C" Ref="#PWR0812"  Part="1" 
F 0 "#PWR0812" H 8600 4300 50  0001 C CNN
F 1 "GND" H 8605 4377 50  0000 C CNN
F 2 "" H 8600 4550 50  0001 C CNN
F 3 "" H 8600 4550 50  0001 C CNN
	1    8600 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61433662
P 8600 4450
AR Path="/5CC0D65F/61433662" Ref="C?"  Part="1" 
AR Path="/61433662" Ref="C?"  Part="1" 
AR Path="/5F597FD4/61433662" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/61433662" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/61433662" Ref="C?"  Part="1" 
AR Path="/5DC89E19/61433662" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/61433662" Ref="C?"  Part="1" 
AR Path="/5DE3C078/61433662" Ref="C?"  Part="1" 
AR Path="/5D121AA3/61433662" Ref="C804"  Part="1" 
F 0 "C804" H 8509 4496 50  0000 R CNN
F 1 "100nF" H 8509 4405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8600 4450 50  0001 C CNN
F 3 "~" H 8600 4450 50  0001 C CNN
	1    8600 4450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 3 1 61433668
P 8950 4450
AR Path="/5DC89E19/61433668" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/61433668" Ref="U?"  Part="1" 
AR Path="/5D121AA3/61433668" Ref="U804"  Part="3" 
F 0 "U804" H 8950 4867 50  0000 C CNN
F 1 "74AC74" H 8950 4776 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 8900 4600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 8900 4600 50  0001 C CNN
	3    8950 4450
	1    0    0    -1  
$EndComp
Connection ~ 8600 4350
Connection ~ 8600 4550
Wire Wire Line
	6800 2100 6800 1750
Wire Wire Line
	6800 1750 9800 1750
Connection ~ 6800 2100
Text Label 9750 1750 2    50   ~ 0
FLFAST
Wire Wire Line
	8250 3350 8600 3350
Text Label 8400 3350 0    50   ~ 0
CLK1
Wire Wire Line
	8100 3150 8350 3150
Wire Wire Line
	8350 3150 8350 3250
Wire Wire Line
	8350 3250 8600 3250
Text Label 8300 3450 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	8300 3450 8600 3450
$Comp
L power:+5V #PWR?
U 1 1 61463A78
P 8550 3100
AR Path="/5DC89E19/61463A78" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/61463A78" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/61463A78" Ref="#PWR0804"  Part="1" 
F 0 "#PWR0804" H 8550 2950 50  0001 C CNN
F 1 "+5V" H 8565 3273 50  0000 C CNN
F 2 "" H 8550 3100 50  0001 C CNN
F 3 "" H 8550 3100 50  0001 C CNN
	1    8550 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3100 8550 3150
Wire Wire Line
	8550 3150 8600 3150
Wire Wire Line
	6800 3350 7200 3350
Wire Wire Line
	5600 2650 6800 2650
Connection ~ 6800 2650
Wire Wire Line
	6800 2650 6800 3350
Wire Wire Line
	8250 2750 8250 3350
Connection ~ 8250 2750
Text Label 5650 2750 0    50   ~ 0
CLK1
Text HLabel 5600 2750 0    50   Input ~ 0
CLK1
Wire Wire Line
	5600 2750 8250 2750
Wire Wire Line
	5600 2100 5150 2100
Wire Wire Line
	4800 2200 5600 2200
Wire Wire Line
	4900 2300 5600 2300
Wire Wire Line
	4900 3400 4900 2300
Wire Wire Line
	1650 3400 4900 3400
Text Label 1700 3300 0    50   ~ 0
FLOUT-SRU
Wire Wire Line
	4800 3300 4800 2200
Wire Wire Line
	1650 3300 4800 3300
Text HLabel 1650 3400 0    50   Input ~ 0
BCP
Text HLabel 1650 3300 0    50   Input ~ 0
FLOUT-SRU
Text Label 1700 3400 0    50   ~ 0
BCP
NoConn ~ 9500 3450
$Comp
L alexios:ATF16V8B U?
U 2 1 6115A75F
P 3450 4450
AR Path="/5E1C970B/6115A75F" Ref="U?"  Part="1" 
AR Path="/5D121AA3/6115A75F" Ref="U801"  Part="2" 
AR Path="/6115A75F" Ref="U801"  Part="2" 
F 0 "U801" H 3630 4496 50  0000 L CNN
F 1 "ATF16V8B" H 3630 4405 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 3450 4450 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 3450 4450 50  0001 C CNN
F 4 "ALRDEC00" V 3450 4450 50  0001 C CNB "Signature"
F 5 "alu-raddr-decode.jed" H 3450 3800 50  0001 C CNN "Image Filename"
	2    3450 4450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 1 1 611B98D7
P 6050 2250
AR Path="/5DC89E19/611B98D7" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/611B98D7" Ref="U?"  Part="1" 
AR Path="/5D121AA3/611B98D7" Ref="U802"  Part="1" 
F 0 "U802" H 6050 2667 50  0000 C CNN
F 1 "74AC74" H 6050 2576 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 6000 2400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6000 2400 50  0001 C CNN
	1    6050 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 611E1733
P 6050 3300
AR Path="/5DC89E19/611E1733" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/611E1733" Ref="U?"  Part="1" 
AR Path="/5D121AA3/611E1733" Ref="U802"  Part="2" 
F 0 "U802" H 6050 3717 50  0000 C CNN
F 1 "74AC74" H 6050 3626 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 6000 3450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6000 3450 50  0001 C CNN
	2    6050 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 3 1 6142A645
P 6100 4450
AR Path="/5DC89E19/6142A645" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/6142A645" Ref="U?"  Part="1" 
AR Path="/5D121AA3/6142A645" Ref="U802"  Part="3" 
F 0 "U802" H 6100 4867 50  0000 C CNN
F 1 "74AC74" H 6100 4776 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 6050 4600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6050 4600 50  0001 C CNN
	3    6100 4450
	1    0    0    -1  
$EndComp
Text HLabel 1650 2900 0    50   Input ~ 0
~ACCPL1
Text HLabel 1650 3000 0    50   Input ~ 0
~ACCPL2
Text HLabel 1650 2150 0    50   Input ~ 0
~SETV-ROM
Wire Wire Line
	1650 2150 2250 2150
Text HLabel 1650 2350 0    50   Input ~ 0
FVOUT-ROM
Wire Wire Line
	1650 2350 2250 2350
Text HLabel 1650 1850 0    50   Input ~ 0
~RSTHOLD
Text HLabel 1650 1750 0    50   Input ~ 0
~ACTION-CLL
Text HLabel 1650 2450 0    50   Input ~ 0
IBUS12
Text HLabel 1650 2050 0    50   Input ~ 0
FLCPL-ROM
Text HLabel 1650 2250 0    50   Input ~ 0
~SETL-ROM
Text HLabel 1650 1950 0    50   Input ~ 0
~FLAGWE
Text HLabel 1650 1650 0    50   Input ~ 0
~ACTION-CPL
$Comp
L alexios:ATF16V8B U?
U 1 1 61156997
P 2700 2100
AR Path="/5E1C970B/61156997" Ref="U?"  Part="1" 
AR Path="/5D121AA3/61156997" Ref="U801"  Part="1" 
AR Path="/61156997" Ref="U801"  Part="1" 
F 0 "U801" H 2700 2850 50  0000 C CNN
F 1 "ATF16V8B" H 2700 2750 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2700 2100 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2700 2100 50  0001 C CNN
F 4 "ALUFLG00" V 2700 2100 50  0000 C CNB "Signature"
F 5 "alu-flags.jed" H 2700 1450 50  0000 C CNN "Image Filename"
	1    2700 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1850 1650 1850
Text Label 1700 1850 0    50   ~ 0
~RSTHOLD
Text Label 1700 1650 0    50   ~ 0
~ACTION-CPL
Wire Wire Line
	1650 1650 2250 1650
Wire Wire Line
	1650 2450 2250 2450
Wire Wire Line
	1650 2550 2250 2550
Wire Wire Line
	1650 2050 2250 2050
Wire Wire Line
	1650 2250 2250 2250
Wire Wire Line
	1650 1950 2250 1950
Wire Wire Line
	1650 1750 2250 1750
Wire Wire Line
	3150 1650 3700 1650
Wire Wire Line
	3150 2350 3700 2350
Wire Wire Line
	3150 1750 3700 1750
Text Label 1700 2450 0    50   ~ 0
IBUS12
Text Label 1700 2550 0    50   ~ 0
IBUS13
Text Label 1700 2050 0    50   ~ 0
FLROM
Text Label 1700 2250 0    50   ~ 0
~SLROM
Text Label 1700 1950 0    50   ~ 0
~FLAGWE
Text Label 1700 1750 0    50   ~ 0
~ACTION-CLL
Text Label 1700 2150 0    50   ~ 0
~SVROM
Text Label 1700 2350 0    50   ~ 0
FVROM
Text Label 3700 1750 2    50   ~ 0
~CLRV
Text Label 3700 2350 2    50   ~ 0
~SETV
Text Label 3700 1650 2    50   ~ 0
~CLRL
Text Label 3700 1850 2    50   ~ 0
~SETL
Text HLabel 1650 2550 0    50   Input ~ 0
IBUS13
Wire Wire Line
	3150 1850 3700 1850
Text HLabel 1650 3100 0    50   Input ~ 0
~READ-ALU-Y
Wire Wire Line
	1650 3100 4100 3100
Wire Wire Line
	4100 3100 4100 2050
Wire Wire Line
	4000 2150 4000 3000
Wire Wire Line
	1650 3000 4000 3000
Wire Wire Line
	3900 2250 3900 2900
Wire Wire Line
	1650 2900 3900 2900
Wire Wire Line
	3150 2250 3900 2250
Wire Wire Line
	3150 2150 4000 2150
Text Label 3700 2250 2    50   ~ 0
~ACCPL1
Text Label 3700 2150 2    50   ~ 0
~ACCPL2
Text Label 3700 1950 2    50   ~ 0
FL
Wire Wire Line
	3150 1950 3700 1950
Text Label 3700 2050 2    50   ~ 0
~READ-ALU-Y
Wire Wire Line
	3150 2050 4100 2050
$Comp
L Device:R_Small R?
U 1 1 60C45379
P 9750 2100
AR Path="/5DF75CDE/60C45379" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/60C45379" Ref="R?"  Part="1" 
AR Path="/5D121AA3/60C45379" Ref="R801"  Part="1" 
F 0 "R801" V 9554 2100 50  0000 C CNN
F 1 "30Ω" V 9645 2100 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9750 2100 50  0001 C CNN
F 3 "~" H 9750 2100 50  0001 C CNN
	1    9750 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60C473CC
P 9750 3150
AR Path="/5DF75CDE/60C473CC" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/60C473CC" Ref="R?"  Part="1" 
AR Path="/5D121AA3/60C473CC" Ref="R802"  Part="1" 
F 0 "R802" V 9554 3150 50  0000 C CNN
F 1 "30Ω" V 9645 3150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9750 3150 50  0001 C CNN
F 3 "~" H 9750 3150 50  0001 C CNN
	1    9750 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 2100 9650 2100
Wire Wire Line
	9850 2100 10300 2100
Wire Wire Line
	9500 3150 9650 3150
Wire Wire Line
	9850 3150 10300 3150
$EndSCHEMATC
