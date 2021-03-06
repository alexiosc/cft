EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 10
Title "The Overflow Register (V)"
Date "2019-11-17"
Rev "2020"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 10750 3050 2    50   Output ~ 0
FV
Text Label 9050 3250 2    50   ~ 0
CLK4
Text Label 7450 3450 2    50   ~ 0
~RSTHOLD
Text Label 10300 3050 0    50   ~ 0
FV
Text Label 7450 3350 2    50   ~ 0
CLKV
Wire Wire Line
	9100 3350 8600 3350
Text Label 9050 3350 2    50   ~ 0
~RSTHOLD
$Comp
L power:+5V #PWR?
U 1 1 5D366A6A
P 9050 3000
AR Path="/5DC89E19/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366A6A" Ref="#PWR0160"  Part="1" 
F 0 "#PWR0160" H 9050 2850 50  0001 C CNN
F 1 "+5V" H 9065 3173 50  0000 C CNN
F 2 "" H 9050 3000 50  0001 C CNN
F 3 "" H 9050 3000 50  0001 C CNN
	1    9050 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 3000 9050 3050
Wire Wire Line
	9050 3050 9100 3050
Wire Wire Line
	7000 3450 7450 3450
Text Label 7450 3250 2    50   ~ 0
VD
$Comp
L alexios:74HC74 U?
U 1 1 5D366A74
P 7900 3300
AR Path="/5DC89E19/5D366A74" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A74" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D366A74" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D366A74" Ref="U?"  Part="1" 
AR Path="/5D35C694/5D366A74" Ref="U23"  Part="1" 
F 0 "U23" H 7900 3717 50  0000 C CNN
F 1 "74AC74" H 7900 3626 50  0000 C CNN
F 2 "alexios:SOIC-14" H 7850 3450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7850 3450 50  0001 C CNN
	1    7900 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 5D366A7A
P 9550 3200
AR Path="/5DC89E19/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D98F946/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5D13B20C/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5D35C694/5D366A7A" Ref="U23"  Part="2" 
F 0 "U23" H 9550 3617 50  0000 C CNN
F 1 "74AC74" H 9550 3526 50  0000 C CNN
F 2 "alexios:SOIC-14" H 9500 3350 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 9500 3350 50  0001 C CNN
	2    9550 3200
	1    0    0    -1  
$EndComp
Text HLabel 1700 4400 0    50   Input ~ 0
~SETV-ROM
Wire Wire Line
	8700 3250 9100 3250
$Comp
L alexios:74LVC1G08 U?
U 2 1 5D366A83
P 4250 7300
AR Path="/5DC89E19/5D366A83" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A83" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D366A83" Ref="U?"  Part="2" 
AR Path="/5D13B20C/5D366A83" Ref="U?"  Part="2" 
AR Path="/5D35C694/5D366A83" Ref="U25"  Part="2" 
F 0 "U25" H 4330 7246 50  0000 L CNN
F 1 "74LVC1G08" H 4330 7155 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3900 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 3900 7300 50  0001 C CNN
	2    4250 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D366A89
P 900 7400
AR Path="/5CC0D65F/5D366A89" Ref="C?"  Part="1" 
AR Path="/5D366A89" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D366A89" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366A89" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366A89" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D366A89" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A89" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D366A89" Ref="C?"  Part="1" 
AR Path="/5D13B20C/5D366A89" Ref="C?"  Part="1" 
AR Path="/5D35C694/5D366A89" Ref="C23"  Part="1" 
F 0 "C23" H 809 7446 50  0000 R CNN
F 1 "100nF" H 809 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 7400 50  0001 C CNN
F 3 "~" H 900 7400 50  0001 C CNN
	1    900  7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D366A8F
P 900 7500
AR Path="/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366A8F" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366A8F" Ref="#PWR0161"  Part="1" 
F 0 "#PWR0161" H 900 7250 50  0001 C CNN
F 1 "GND" H 905 7327 50  0000 C CNN
F 2 "" H 900 7500 50  0001 C CNN
F 3 "" H 900 7500 50  0001 C CNN
	1    900  7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D366A95
P 900 7300
AR Path="/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366A95" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366A95" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 900 7150 50  0001 C CNN
F 1 "+5V" H 915 7473 50  0000 C CNN
F 2 "" H 900 7300 50  0001 C CNN
F 3 "" H 900 7300 50  0001 C CNN
	1    900  7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D366A9B
P 3800 7400
AR Path="/5CC0D65F/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5D13B20C/5D366A9B" Ref="C?"  Part="1" 
AR Path="/5D35C694/5D366A9B" Ref="C25"  Part="1" 
F 0 "C25" H 3709 7446 50  0000 R CNN
F 1 "100nF" H 3709 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3800 7400 50  0001 C CNN
F 3 "~" H 3800 7400 50  0001 C CNN
	1    3800 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D366AA1
P 3800 7500
AR Path="/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366AA1" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AA1" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 3800 7250 50  0001 C CNN
F 1 "GND" H 3805 7327 50  0000 C CNN
F 2 "" H 3800 7500 50  0001 C CNN
F 3 "" H 3800 7500 50  0001 C CNN
	1    3800 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D366AA7
P 3800 7300
AR Path="/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366AA7" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AA7" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 3800 7150 50  0001 C CNN
F 1 "+5V" H 3815 7473 50  0000 C CNN
F 2 "" H 3800 7300 50  0001 C CNN
F 3 "" H 3800 7300 50  0001 C CNN
	1    3800 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D366AAD
P 5250 7400
AR Path="/5CC0D65F/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5D13B20C/5D366AAD" Ref="C?"  Part="1" 
AR Path="/5D35C694/5D366AAD" Ref="C26"  Part="1" 
F 0 "C26" H 5159 7446 50  0000 R CNN
F 1 "100nF" H 5159 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 7400 50  0001 C CNN
F 3 "~" H 5250 7400 50  0001 C CNN
	1    5250 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D366AB3
P 5250 7500
AR Path="/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366AB3" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AB3" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 5250 7250 50  0001 C CNN
F 1 "GND" H 5255 7327 50  0000 C CNN
F 2 "" H 5250 7500 50  0001 C CNN
F 3 "" H 5250 7500 50  0001 C CNN
	1    5250 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D366AB9
P 5250 7300
AR Path="/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366AB9" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AB9" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 5250 7150 50  0001 C CNN
F 1 "+5V" H 5265 7473 50  0000 C CNN
F 2 "" H 5250 7300 50  0001 C CNN
F 3 "" H 5250 7300 50  0001 C CNN
	1    5250 7300
	1    0    0    -1  
$EndComp
Connection ~ 3800 7300
Connection ~ 3800 7500
NoConn ~ 8350 3450
$Comp
L power:+5V #PWR?
U 1 1 5D366AC2
P 7400 3100
AR Path="/5D13B20C/5D366AC2" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AC2" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 7400 2950 50  0001 C CNN
F 1 "+5V" H 7415 3273 50  0000 C CNN
F 2 "" H 7400 3100 50  0001 C CNN
F 3 "" H 7400 3100 50  0001 C CNN
	1    7400 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3100 7400 3150
Wire Wire Line
	7400 3150 7450 3150
Wire Wire Line
	10200 3050 10750 3050
NoConn ~ 10000 3350
Wire Wire Line
	8350 3150 9100 3150
Wire Wire Line
	6900 4350 6900 3350
Wire Wire Line
	6900 3350 7450 3350
Wire Wire Line
	2850 4300 1800 4300
Text Label 1950 4400 0    50   ~ 0
~SETV-ROM
Text Label 1950 4300 0    50   ~ 0
~FLAGWE
Wire Wire Line
	8700 3250 8700 1950
Text HLabel 1700 1950 0    50   Input ~ 0
CLK4
Text Label 1950 1850 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	1700 1850 7000 1850
Wire Wire Line
	7000 3450 7000 1850
Wire Wire Line
	8600 1850 8600 3350
Text Label 7800 1950 0    50   ~ 0
CLK4
Text Label 7800 1850 0    50   ~ 0
~RSTHOLD
Text Label 1950 1950 0    50   ~ 0
CLK4
Text HLabel 1700 1850 0    50   Input ~ 0
~RSTHOLD
$Comp
L alexios:74LVC2G157 U?
U 2 1 5D366AF7
P 1250 7400
AR Path="/5D13B20C/5D366AF7" Ref="U?"  Part="2" 
AR Path="/5D35C694/5D366AF7" Ref="U24"  Part="2" 
F 0 "U24" H 1430 7446 50  0000 L CNN
F 1 "74LVC2G157" H 1430 7355 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 1150 7525 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 1150 7525 50  0001 C CNN
	2    1250 7400
	1    0    0    -1  
$EndComp
Connection ~ 900  7500
Connection ~ 900  7300
Wire Wire Line
	1700 4400 2850 4400
Text Label 3500 4350 0    50   ~ 0
CLKV
$Comp
L alexios:74HC74 U?
U 3 1 5D366B05
P 5600 7400
AR Path="/5DC89E19/5D366B05" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366B05" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D366B05" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D366B05" Ref="U?"  Part="3" 
AR Path="/5D35C694/5D366B05" Ref="U23"  Part="3" 
F 0 "U23" H 5780 7446 50  0000 L CNN
F 1 "74AC74" H 5780 7355 50  0000 L CNN
F 2 "alexios:SOIC-14" H 5550 7550 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5550 7550 50  0001 C CNN
	3    5600 7400
	1    0    0    -1  
$EndComp
Connection ~ 5250 7300
Connection ~ 5250 7500
Wire Wire Line
	3300 4350 6900 4350
Wire Wire Line
	1700 1950 8700 1950
Wire Wire Line
	5100 3450 5100 3400
Wire Wire Line
	5100 3450 5100 3500
Connection ~ 5100 3450
$Comp
L Device:C_Small C?
U 1 1 5D880683
P 2350 7400
AR Path="/5CC0D65F/5D880683" Ref="C?"  Part="1" 
AR Path="/5D880683" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D880683" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D880683" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D880683" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D880683" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D880683" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D880683" Ref="C?"  Part="1" 
AR Path="/5D35C694/5D880683" Ref="C24"  Part="1" 
F 0 "C24" H 2259 7446 50  0000 R CNN
F 1 "100nF" H 2259 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2350 7400 50  0001 C CNN
F 3 "~" H 2350 7400 50  0001 C CNN
	1    2350 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D880689
P 2350 7500
AR Path="/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D880689" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D880689" Ref="#PWR0168"  Part="1" 
F 0 "#PWR0168" H 2350 7250 50  0001 C CNN
F 1 "GND" H 2355 7327 50  0000 C CNN
F 2 "" H 2350 7500 50  0001 C CNN
F 3 "" H 2350 7500 50  0001 C CNN
	1    2350 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D88068F
P 2350 7300
AR Path="/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D88068F" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D88068F" Ref="#PWR0169"  Part="1" 
F 0 "#PWR0169" H 2350 7150 50  0001 C CNN
F 1 "+5V" H 2365 7473 50  0000 C CNN
F 2 "" H 2350 7300 50  0001 C CNN
F 3 "" H 2350 7300 50  0001 C CNN
	1    2350 7300
	1    0    0    -1  
$EndComp
Text Label 8350 3150 0    50   ~ 0
FV0
$Comp
L alexios:74HC08 U22
U 3 1 5E61248D
P 5200 3050
F 0 "U22" H 5325 2925 50  0000 C CNN
F 1 "74HC08" H 5325 2834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5400 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5400 2600 50  0001 C CNN
	3    5200 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D366A62
P 3150 4350
AR Path="/5DC89E19/5D366A62" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A62" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D366A62" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D366A62" Ref="U?"  Part="1" 
AR Path="/5D35C694/5D366A62" Ref="U25"  Part="1" 
F 0 "U25" H 3075 4617 50  0000 C CNN
F 1 "74LVC1G08" H 3075 4526 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2800 4350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2800 4350 50  0001 C CNN
	1    3150 4350
	1    0    0    -1  
$EndComp
Text Notes 3800 3950 0    50   ~ 0
Delay VD by n×Tpd, 0≤n≤4.\nThis delay line gives us more hold time on rising edge of CLKV.\nStart with three, then change if V isn't set properly.
$Comp
L alexios:74HC08 U22
U 2 1 5E61040A
P 4550 3050
F 0 "U22" H 4675 2925 50  0000 C CNN
F 1 "74HC08" H 4675 2834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4750 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4750 2600 50  0001 C CNN
	2    4550 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U22
U 1 1 5E60DB8C
P 3900 3050
F 0 "U22" H 4025 2925 50  0000 C CNN
F 1 "74HC08" H 4025 2834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4100 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4100 2600 50  0001 C CNN
	1    3900 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3450 3800 3500
Connection ~ 3800 3450
Wire Wire Line
	3800 3400 3800 3450
Text Label 3500 3450 0    50   ~ 0
VD0
Wire Wire Line
	1800 3650 2750 3650
Connection ~ 1800 3650
Wire Wire Line
	1800 3650 1800 4300
NoConn ~ 3450 3750
$Comp
L power:GND #PWR?
U 1 1 5D366AF0
P 2700 3800
AR Path="/5D13B20C/5D366AF0" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AF0" Ref="#PWR0170"  Part="1" 
F 0 "#PWR0170" H 2700 3550 50  0001 C CNN
F 1 "GND" H 2705 3627 50  0000 C CNN
F 2 "" H 2700 3800 50  0001 C CNN
F 3 "" H 2700 3800 50  0001 C CNN
	1    2700 3800
	1    0    0    -1  
$EndComp
Text HLabel 1700 3650 0    50   Input ~ 0
~FLAGWE
Wire Wire Line
	1700 3650 1800 3650
Text Label 1950 3650 0    50   ~ 0
~FLAGWE
Wire Wire Line
	1700 3550 2750 3550
Text HLabel 1700 3550 0    50   Input ~ 0
FVOUT-ROM
Text Label 1950 3550 0    50   ~ 0
FVOUT-ROM
Wire Wire Line
	1700 3450 2750 3450
Text HLabel 1700 3450 0    50   Input ~ 0
IBUS13
Text Label 1950 3450 0    50   ~ 0
IBUS13
$Comp
L alexios:74LVC2G157 U?
U 1 1 5D366AE1
P 3100 3550
AR Path="/5D13B20C/5D366AE1" Ref="U?"  Part="1" 
AR Path="/5D35C694/5D366AE1" Ref="U24"  Part="1" 
F 0 "U24" H 3100 3917 50  0000 C CNN
F 1 "74LVC2G157" H 3100 3826 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 3000 3675 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 3000 3675 50  0001 C CNN
	1    3100 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1850 8600 1850
Connection ~ 7000 1850
Wire Wire Line
	5850 3450 5850 3400
Wire Wire Line
	5850 3450 5850 3500
Connection ~ 5850 3450
$Comp
L alexios:74HC08 U22
U 4 1 5E6357B5
P 5950 3050
F 0 "U22" H 6075 2925 50  0000 C CNN
F 1 "74HC08" H 6075 2834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 6150 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6150 2600 50  0001 C CNN
	4    5950 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U22
U 5 1 5E2A7483
P 2550 6850
F 0 "U22" H 2880 6346 50  0000 L CNN
F 1 "74HC08" H 2880 6255 50  0000 L CNN
F 2 "alexios:SOIC-14" H 2750 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2750 6400 50  0001 C CNN
	5    2550 6850
	1    0    0    -1  
$EndComp
Connection ~ 2350 7300
Connection ~ 2350 7500
$Comp
L Device:R_Small R1
U 1 1 5DD10E8A
P 10100 3050
F 0 "R1" V 9904 3050 50  0000 C CNN
F 1 "30Ω" V 9995 3050 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10100 3050 50  0001 C CNN
F 3 "~" H 10100 3050 50  0001 C CNN
	1    10100 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 3400 4450 3450
Wire Wire Line
	4450 3450 4450 3500
Connection ~ 4450 3450
Wire Wire Line
	6900 3250 7450 3250
$Comp
L Jumper:SolderJumper_2_Bridged JP15
U 1 1 5DE15A8C
P 5750 3050
F 0 "JP15" V 5750 3118 50  0000 L CNN
F 1 "SolderJumper_2_Bridged" H 5750 3164 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 5750 3050 50  0001 C CNN
F 3 "~" H 5750 3050 50  0001 C CNN
	1    5750 3050
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP12
U 1 1 5DE15E69
P 3700 3050
F 0 "JP12" V 3700 3118 50  0000 L CNN
F 1 "SolderJumper_2_Open" H 3700 3164 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3700 3050 50  0001 C CNN
F 3 "~" H 3700 3050 50  0001 C CNN
	1    3700 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 3450 5750 3450
Wire Wire Line
	4900 3450 5000 3450
Wire Wire Line
	4250 3450 4350 3450
Wire Wire Line
	3700 3450 3700 3200
Wire Wire Line
	3450 3450 3700 3450
Connection ~ 3700 3450
Wire Wire Line
	3700 3450 3800 3450
$Comp
L Jumper:SolderJumper_2_Open JP13
U 1 1 5DE257A3
P 4350 3050
F 0 "JP13" V 4350 3118 50  0000 L CNN
F 1 "SolderJumper_2_Open" H 4350 3164 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4350 3050 50  0001 C CNN
F 3 "~" H 4350 3050 50  0001 C CNN
	1    4350 3050
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP14
U 1 1 5DE265BF
P 5000 3050
F 0 "JP14" V 5000 3118 50  0000 L CNN
F 1 "SolderJumper_2_Open" H 5000 3164 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5000 3050 50  0001 C CNN
F 3 "~" H 5000 3050 50  0001 C CNN
	1    5000 3050
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP16
U 1 1 5DE27451
P 6400 3050
F 0 "JP16" V 6400 3118 50  0000 L CNN
F 1 "SolderJumper_2_Open" H 6400 3164 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 6400 3050 50  0001 C CNN
F 3 "~" H 6400 3050 50  0001 C CNN
	1    6400 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 2900 3700 2850
Wire Wire Line
	3700 2850 4350 2850
Wire Wire Line
	6900 2850 6900 3250
Wire Wire Line
	4350 2900 4350 2850
Connection ~ 4350 2850
Wire Wire Line
	4350 2850 5000 2850
Wire Wire Line
	5000 2850 5000 2900
Connection ~ 5000 2850
Wire Wire Line
	5000 2850 5750 2850
Connection ~ 5750 2850
Wire Wire Line
	5750 2850 6400 2850
Wire Wire Line
	4350 3200 4350 3450
Connection ~ 4350 3450
Wire Wire Line
	4350 3450 4450 3450
Wire Wire Line
	5000 3200 5000 3450
Connection ~ 5000 3450
Wire Wire Line
	5000 3450 5100 3450
Wire Wire Line
	5750 3200 5750 3450
Connection ~ 5750 3450
Wire Wire Line
	5750 3450 5850 3450
Wire Wire Line
	5750 2900 5750 2850
Text Label 4350 3400 1    50   ~ 0
VD1
Text Label 5000 3400 1    50   ~ 0
VD2
Text Label 5750 3250 3    50   ~ 0
VD3
Wire Wire Line
	6300 3450 6400 3450
Text Label 6400 3400 1    50   ~ 0
VD4
Wire Wire Line
	6400 3200 6400 3450
Wire Wire Line
	6400 2900 6400 2850
Connection ~ 6400 2850
Wire Wire Line
	6400 2850 6900 2850
Text Notes 5600 2800 0    50   ~ 10
Bridged
Wire Wire Line
	2750 3750 2700 3750
Wire Wire Line
	2700 3750 2700 3800
$EndSCHEMATC
