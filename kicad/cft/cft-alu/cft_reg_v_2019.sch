EESchema Schematic File Version 4
LIBS:cft-alu-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 10750 3050 2    50   Output ~ 0
FV
Text Label 8900 3250 2    50   ~ 0
CLK4
Text Label 7300 3450 2    50   ~ 0
~RESET
Text Label 10150 3050 0    50   ~ 0
FV
Text Label 7300 3350 2    50   ~ 0
CLKV
Wire Wire Line
	8950 3350 8450 3350
Text Label 8900 3350 2    50   ~ 0
~RESET
$Comp
L power:+5V #PWR?
U 1 1 5D366A6A
P 8900 3000
AR Path="/5DC89E19/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D366A6A" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366A6A" Ref="#PWR075"  Part="1" 
F 0 "#PWR075" H 8900 2850 50  0001 C CNN
F 1 "+5V" H 8915 3173 50  0000 C CNN
F 2 "" H 8900 3000 50  0001 C CNN
F 3 "" H 8900 3000 50  0001 C CNN
	1    8900 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3000 8900 3050
Wire Wire Line
	8900 3050 8950 3050
Wire Wire Line
	7000 3450 7300 3450
Text Label 7300 3250 2    50   ~ 0
VD
$Comp
L alexios:74HC74 U?
U 1 1 5D366A74
P 7750 3300
AR Path="/5DC89E19/5D366A74" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A74" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D366A74" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D366A74" Ref="U?"  Part="1" 
AR Path="/5D35C694/5D366A74" Ref="U39"  Part="1" 
F 0 "U39" H 7750 3717 50  0000 C CNN
F 1 "74AC74" H 7750 3626 50  0000 C CNN
F 2 "alexios:SOIC-14" H 7700 3450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7700 3450 50  0001 C CNN
	1    7750 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 5D366A7A
P 9400 3200
AR Path="/5DC89E19/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D98F946/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5D13B20C/5D366A7A" Ref="U?"  Part="2" 
AR Path="/5D35C694/5D366A7A" Ref="U39"  Part="2" 
F 0 "U39" H 9400 3617 50  0000 C CNN
F 1 "74AC74" H 9400 3526 50  0000 C CNN
F 2 "alexios:SOIC-14" H 9350 3350 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 9350 3350 50  0001 C CNN
	2    9400 3200
	1    0    0    -1  
$EndComp
Text HLabel 1700 4400 0    50   Input ~ 0
~ROM-SET-V
Wire Wire Line
	8550 3250 8950 3250
Text Notes 7100 7000 0    197  ~ 39
The Overflow Register (V)
$Comp
L alexios:74LVC1G08 U?
U 2 1 5D366A83
P 4250 7300
AR Path="/5DC89E19/5D366A83" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D366A83" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D366A83" Ref="U?"  Part="2" 
AR Path="/5D13B20C/5D366A83" Ref="U?"  Part="2" 
AR Path="/5D35C694/5D366A83" Ref="U40"  Part="2" 
F 0 "U40" H 4330 7246 50  0000 L CNN
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
AR Path="/5D35C694/5D366A89" Ref="C26"  Part="1" 
F 0 "C26" H 809 7446 50  0000 R CNN
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
AR Path="/5D35C694/5D366A8F" Ref="#PWR083"  Part="1" 
F 0 "#PWR083" H 900 7250 50  0001 C CNN
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
AR Path="/5D35C694/5D366A95" Ref="#PWR078"  Part="1" 
F 0 "#PWR078" H 900 7150 50  0001 C CNN
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
AR Path="/5D35C694/5D366A9B" Ref="C28"  Part="1" 
F 0 "C28" H 3709 7446 50  0000 R CNN
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
AR Path="/5D35C694/5D366AA1" Ref="#PWR085"  Part="1" 
F 0 "#PWR085" H 3800 7250 50  0001 C CNN
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
AR Path="/5D35C694/5D366AA7" Ref="#PWR080"  Part="1" 
F 0 "#PWR080" H 3800 7150 50  0001 C CNN
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
AR Path="/5D35C694/5D366AAD" Ref="C29"  Part="1" 
F 0 "C29" H 5159 7446 50  0000 R CNN
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
AR Path="/5D35C694/5D366AB3" Ref="#PWR086"  Part="1" 
F 0 "#PWR086" H 5250 7250 50  0001 C CNN
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
AR Path="/5D35C694/5D366AB9" Ref="#PWR081"  Part="1" 
F 0 "#PWR081" H 5250 7150 50  0001 C CNN
F 1 "+5V" H 5265 7473 50  0000 C CNN
F 2 "" H 5250 7300 50  0001 C CNN
F 3 "" H 5250 7300 50  0001 C CNN
	1    5250 7300
	1    0    0    -1  
$EndComp
Connection ~ 3800 7300
Connection ~ 3800 7500
NoConn ~ 8200 3450
$Comp
L power:+5V #PWR?
U 1 1 5D366AC2
P 7250 3100
AR Path="/5D13B20C/5D366AC2" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AC2" Ref="#PWR076"  Part="1" 
F 0 "#PWR076" H 7250 2950 50  0001 C CNN
F 1 "+5V" H 7265 3273 50  0000 C CNN
F 2 "" H 7250 3100 50  0001 C CNN
F 3 "" H 7250 3100 50  0001 C CNN
	1    7250 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3100 7250 3150
Wire Wire Line
	7250 3150 7300 3150
Wire Wire Line
	10050 3050 10750 3050
NoConn ~ 9850 3350
Wire Wire Line
	8200 3150 8950 3150
Wire Wire Line
	6900 4350 6900 3350
Wire Wire Line
	6900 3350 7300 3350
Wire Wire Line
	2850 4300 1800 4300
Text Label 1950 4400 0    50   ~ 0
~ROM-SET-V
Text Label 1950 4300 0    50   ~ 0
~FLAGWE
Wire Wire Line
	8550 3250 8550 1950
Text HLabel 1700 1950 0    50   Input ~ 0
CLK4
Text Label 1950 1850 0    50   ~ 0
~RESET
Wire Wire Line
	1700 1850 7000 1850
Wire Wire Line
	7000 3450 7000 1850
Wire Wire Line
	8450 1850 8450 3350
Text Label 7650 1950 0    50   ~ 0
CLK4
Text Label 7650 1850 0    50   ~ 0
~RESET
Text Label 1950 1950 0    50   ~ 0
CLK4
Text HLabel 1700 1850 0    50   Input ~ 0
~RESET
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
AR Path="/5D35C694/5D366B05" Ref="U39"  Part="3" 
F 0 "U39" H 5780 7446 50  0000 L CNN
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
	1700 1950 8550 1950
Wire Wire Line
	5150 3450 5150 3400
Wire Wire Line
	5150 3450 5150 3500
Connection ~ 5150 3450
Text Label 6750 3250 2    50   ~ 0
VD
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
AR Path="/5D35C694/5D880683" Ref="C27"  Part="1" 
F 0 "C27" H 2259 7446 50  0000 R CNN
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
AR Path="/5D35C694/5D880689" Ref="#PWR084"  Part="1" 
F 0 "#PWR084" H 2350 7250 50  0001 C CNN
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
AR Path="/5D35C694/5D88068F" Ref="#PWR079"  Part="1" 
F 0 "#PWR079" H 2350 7150 50  0001 C CNN
F 1 "+5V" H 2365 7473 50  0000 C CNN
F 2 "" H 2350 7300 50  0001 C CNN
F 3 "" H 2350 7300 50  0001 C CNN
	1    2350 7300
	1    0    0    -1  
$EndComp
Text Label 8200 3150 0    50   ~ 0
FV0
$Comp
L alexios:74HC08 U30
U 3 1 5E61248D
P 5250 3050
F 0 "U30" H 5375 2925 50  0000 C CNN
F 1 "74HC08" H 5375 2834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5450 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5450 2600 50  0001 C CNN
	3    5250 3050
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
AR Path="/5D35C694/5D366A62" Ref="U40"  Part="1" 
F 0 "U40" H 3075 4617 50  0000 C CNN
F 1 "74LVC1G08" H 3075 4526 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2800 4350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2800 4350 50  0001 C CNN
	1    3150 4350
	1    0    0    -1  
$EndComp
Text Notes 3850 4000 0    50   ~ 0
This delay line gives us more hold time on rising edge of CLKV.\nStart with three gates.
Wire Wire Line
	5100 3450 5150 3450
$Comp
L alexios:74HC08 U30
U 2 1 5E61040A
P 4500 3050
F 0 "U30" H 4625 2925 50  0000 C CNN
F 1 "74HC08" H 4625 2834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4700 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4700 2600 50  0001 C CNN
	2    4500 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U30
U 1 1 5E60DB8C
P 3750 3050
F 0 "U30" H 3875 2925 50  0000 C CNN
F 1 "74HC08" H 3875 2834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 3950 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3950 2600 50  0001 C CNN
	1    3750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 3450 3650 3500
Connection ~ 3650 3450
Wire Wire Line
	3650 3400 3650 3450
Wire Wire Line
	3450 3450 3650 3450
Wire Wire Line
	4400 3450 4400 3500
Connection ~ 4400 3450
Wire Wire Line
	4400 3450 4350 3450
Wire Wire Line
	4400 3400 4400 3450
Text Label 3500 3450 0    50   ~ 0
VD
Wire Wire Line
	1800 3650 2750 3650
Connection ~ 1800 3650
Wire Wire Line
	1800 3650 1800 4300
NoConn ~ 3450 3750
$Comp
L power:GND #PWR?
U 1 1 5D366AF0
P 2750 3750
AR Path="/5D13B20C/5D366AF0" Ref="#PWR?"  Part="1" 
AR Path="/5D35C694/5D366AF0" Ref="#PWR077"  Part="1" 
F 0 "#PWR077" H 2750 3500 50  0001 C CNN
F 1 "GND" H 2755 3577 50  0000 C CNN
F 2 "" H 2750 3750 50  0001 C CNN
F 3 "" H 2750 3750 50  0001 C CNN
	1    2750 3750
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
FVIN-ROM
Text Label 1950 3550 0    50   ~ 0
FVIN-ROM
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
	7000 1850 8450 1850
Connection ~ 7000 1850
Wire Wire Line
	5900 3450 5900 3400
Wire Wire Line
	5900 3450 5900 3500
Connection ~ 5900 3450
$Comp
L alexios:74HC08 U30
U 4 1 5E6357B5
P 6000 3050
F 0 "U30" H 6125 2925 50  0000 C CNN
F 1 "74HC08" H 6125 2834 50  0000 C CNN
F 2 "alexios:SOIC-14" H 6200 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6200 2600 50  0001 C CNN
	4    6000 3050
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged12 JP1
U 1 1 5E63AF3F
P 4250 3450
F 0 "JP1" V 4400 3200 50  0000 L CNN
F 1 "SolderJumper_3_Bridged12" V 4205 3518 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 4250 3450 50  0001 C CNN
F 3 "~" H 4250 3450 50  0001 C CNN
	1    4250 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 3250 4350 3250
Wire Wire Line
	4350 3250 4350 3450
$Comp
L Jumper:SolderJumper_3_Bridged12 JP2
U 1 1 5E64AD46
P 5000 3450
F 0 "JP2" V 5150 3200 50  0000 L CNN
F 1 "SolderJumper_3_Bridged12" V 4955 3518 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 5000 3450 50  0001 C CNN
F 3 "~" H 5000 3450 50  0001 C CNN
	1    5000 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 3250 5100 3250
Wire Wire Line
	5100 3250 5100 3450
$Comp
L Jumper:SolderJumper_3_Bridged12 JP3
U 1 1 5E654230
P 5750 3450
F 0 "JP3" V 5900 3250 50  0000 L CNN
F 1 "SolderJumper_3_Bridged12" V 5705 3518 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 5750 3450 50  0001 C CNN
F 3 "~" H 5750 3450 50  0001 C CNN
	1    5750 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 3250 5850 3250
Wire Wire Line
	5850 3250 5850 3450
Wire Wire Line
	5850 3450 5900 3450
$Comp
L Jumper:SolderJumper_3_Bridged12 JP4
U 1 1 5E66061B
P 6500 3450
F 0 "JP4" V 6650 3250 50  0000 L CNN
F 1 "SolderJumper_3_Bridged12" V 6455 3518 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 6500 3450 50  0001 C CNN
F 3 "~" H 6500 3450 50  0001 C CNN
	1    6500 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	6500 3250 7300 3250
$Comp
L Device:R_Small R1
U 1 1 5E6735D9
P 4250 3000
F 0 "R1" H 4309 3046 50  0000 L CNN
F 1 "10kΩ" H 4309 2955 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 3000 50  0001 C CNN
F 3 "~" H 4250 3000 50  0001 C CNN
	1    4250 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3100 4250 3250
Connection ~ 4250 3250
$Comp
L power:+5V #PWR0169
U 1 1 5E675541
P 4250 2900
F 0 "#PWR0169" H 4250 2750 50  0001 C CNN
F 1 "+5V" H 4265 3073 50  0000 C CNN
F 2 "" H 4250 2900 50  0001 C CNN
F 3 "" H 4250 2900 50  0001 C CNN
	1    4250 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5E677294
P 5000 3000
F 0 "R2" H 5059 3046 50  0000 L CNN
F 1 "10kΩ" H 5059 2955 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 3000 50  0001 C CNN
F 3 "~" H 5000 3000 50  0001 C CNN
	1    5000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3100 5000 3250
$Comp
L power:+5V #PWR0170
U 1 1 5E67729B
P 5000 2900
F 0 "#PWR0170" H 5000 2750 50  0001 C CNN
F 1 "+5V" H 5015 3073 50  0000 C CNN
F 2 "" H 5000 2900 50  0001 C CNN
F 3 "" H 5000 2900 50  0001 C CNN
	1    5000 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5E6784A4
P 5750 3000
F 0 "R3" H 5809 3046 50  0000 L CNN
F 1 "10kΩ" H 5809 2955 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5750 3000 50  0001 C CNN
F 3 "~" H 5750 3000 50  0001 C CNN
	1    5750 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3100 5750 3250
$Comp
L power:+5V #PWR0171
U 1 1 5E6784AB
P 5750 2900
F 0 "#PWR0171" H 5750 2750 50  0001 C CNN
F 1 "+5V" H 5765 3073 50  0000 C CNN
F 2 "" H 5750 2900 50  0001 C CNN
F 3 "" H 5750 2900 50  0001 C CNN
	1    5750 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5E679BBE
P 6500 3000
F 0 "R4" H 6559 3046 50  0000 L CNN
F 1 "10kΩ" H 6559 2955 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6500 3000 50  0001 C CNN
F 3 "~" H 6500 3000 50  0001 C CNN
	1    6500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3100 6500 3250
$Comp
L power:+5V #PWR0172
U 1 1 5E679BC5
P 6500 2900
F 0 "#PWR0172" H 6500 2750 50  0001 C CNN
F 1 "+5V" H 6515 3073 50  0000 C CNN
F 2 "" H 6500 2900 50  0001 C CNN
F 3 "" H 6500 2900 50  0001 C CNN
	1    6500 2900
	1    0    0    -1  
$EndComp
Connection ~ 5000 3250
Connection ~ 5750 3250
Connection ~ 6500 3250
Text Notes 4200 2500 0    50   ~ 0
Resistors are optional. Install only to keep '08 inputs from\nfloating after delay line has been calibrated.
Wire Wire Line
	3650 3750 4250 3750
Wire Wire Line
	6500 3750 6500 3650
Connection ~ 3650 3500
Wire Wire Line
	3650 3500 3650 3750
Wire Wire Line
	4250 3650 4250 3750
Connection ~ 4250 3750
Wire Wire Line
	4250 3750 5000 3750
Wire Wire Line
	5000 3650 5000 3750
Connection ~ 5000 3750
Wire Wire Line
	5000 3750 5750 3750
Wire Wire Line
	5750 3650 5750 3750
Connection ~ 5750 3750
Wire Wire Line
	5750 3750 6500 3750
$Comp
L alexios:74HC08 U30
U 5 1 5E2A7483
P 2550 6850
F 0 "U30" H 2880 6346 50  0000 L CNN
F 1 "74HC08" H 2880 6255 50  0000 L CNN
F 2 "alexios:SOIC-14" H 2750 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2750 6400 50  0001 C CNN
	5    2550 6850
	1    0    0    -1  
$EndComp
Connection ~ 2350 7300
Connection ~ 2350 7500
$Comp
L Device:R_Small R5
U 1 1 5DD10E8A
P 9950 3050
F 0 "R5" V 9754 3050 50  0000 C CNN
F 1 "30Ω" V 9845 3050 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 3050 50  0001 C CNN
F 3 "~" H 9950 3050 50  0001 C CNN
	1    9950 3050
	0    1    1    0   
$EndComp
$EndSCHEMATC
