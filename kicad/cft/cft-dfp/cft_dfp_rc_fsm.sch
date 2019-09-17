EESchema Schematic File Version 4
LIBS:cft-dfp-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 13
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC74 U?
U 1 1 5EEDDDB2
P 4600 3250
AR Path="/5EEDDDB2" Ref="U?"  Part="1" 
AR Path="/5ED99F01/5EEDDDB2" Ref="U401"  Part="1" 
F 0 "U401" H 4600 3667 50  0000 C CNN
F 1 "74HC74" H 4600 3576 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4550 3400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4550 3400 50  0001 C CNN
	1    4600 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 5EEDDDB8
P 4600 4000
AR Path="/5EEDDDB8" Ref="U?"  Part="2" 
AR Path="/5ED99F01/5EEDDDB8" Ref="U401"  Part="2" 
F 0 "U401" H 4600 4417 50  0000 C CNN
F 1 "74HC74" H 4600 4326 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4550 4150 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4550 4150 50  0001 C CNN
	2    4600 4000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 1 1 5EEDDDBE
P 4600 4750
AR Path="/5EEDDDBE" Ref="U?"  Part="1" 
AR Path="/5ED99F01/5EEDDDBE" Ref="U402"  Part="1" 
F 0 "U402" H 4600 5167 50  0000 C CNN
F 1 "74HC74" H 4600 5076 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4550 4900 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4550 4900 50  0001 C CNN
	1    4600 4750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 5EEDDDC4
P 4600 5500
AR Path="/5EEDDDC4" Ref="U?"  Part="2" 
AR Path="/5ED99F01/5EEDDDC4" Ref="U402"  Part="2" 
F 0 "U402" H 4600 5917 50  0000 C CNN
F 1 "74HC74" H 4600 5826 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4550 5650 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4550 5650 50  0001 C CNN
	2    4600 5500
	1    0    0    -1  
$EndComp
Text Label 3300 3100 0    50   ~ 0
STEP∕~RUN
$Comp
L power:GND #PWR?
U 1 1 5EEDDDCC
P 4100 3450
AR Path="/5EEDDDCC" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEDDDCC" Ref="#PWR0407"  Part="1" 
F 0 "#PWR0407" H 4100 3200 50  0001 C CNN
F 1 "GND" H 4105 3277 50  0000 C CNN
F 2 "" H 4100 3450 50  0001 C CNN
F 3 "" H 4100 3450 50  0001 C CNN
	1    4100 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3400 4000 3400
Text Label 3300 3400 0    50   ~ 0
~CLR
Text Label 3300 3300 0    50   ~ 0
FPFETCH∕~EXEC
Text Label 5750 3100 2    50   ~ 0
STEPPING
Wire Wire Line
	5050 3850 5900 3850
Text Label 5400 3850 0    50   ~ 0
µSTEPPING
Text Label 3300 3850 0    50   ~ 0
~µSTEP
Text Label 3300 4050 0    50   ~ 0
CLK4
Text Label 5400 4600 0    50   ~ 0
RESETTING
Text Label 3300 4600 0    50   ~ 0
~RESET
Wire Wire Line
	4150 4900 4000 4900
Text Label 3300 4800 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	4150 3200 4100 3200
Wire Wire Line
	4100 3200 4100 3450
$Comp
L power:GND #PWR?
U 1 1 5EEDDDE5
P 4100 4200
AR Path="/5EEDDDE5" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEDDDE5" Ref="#PWR0408"  Part="1" 
F 0 "#PWR0408" H 4100 3950 50  0001 C CNN
F 1 "GND" H 4105 4027 50  0000 C CNN
F 2 "" H 4100 4200 50  0001 C CNN
F 3 "" H 4100 4200 50  0001 C CNN
	1    4100 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3950 4100 3950
Wire Wire Line
	4100 3950 4100 4200
$Comp
L power:GND #PWR?
U 1 1 5EEDDDED
P 4100 4950
AR Path="/5EEDDDED" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEDDDED" Ref="#PWR0409"  Part="1" 
F 0 "#PWR0409" H 4100 4700 50  0001 C CNN
F 1 "GND" H 4105 4777 50  0000 C CNN
F 2 "" H 4100 4950 50  0001 C CNN
F 3 "" H 4100 4950 50  0001 C CNN
	1    4100 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4700 4100 4700
Wire Wire Line
	4100 4700 4100 4950
Wire Wire Line
	4000 3400 4000 4150
Connection ~ 4000 3400
Wire Wire Line
	4150 5350 4100 5350
Wire Wire Line
	4100 5350 4100 5450
Wire Wire Line
	4150 5450 4100 5450
Connection ~ 4100 5450
Wire Wire Line
	4100 5450 4100 5550
Wire Wire Line
	4150 5550 4100 5550
Connection ~ 4100 5550
Wire Wire Line
	4100 5550 4100 5650
Wire Wire Line
	4150 5650 4100 5650
Connection ~ 4100 5650
Wire Wire Line
	4100 5650 4100 5750
$Comp
L power:GND #PWR?
U 1 1 5EEDDE03
P 4100 5750
AR Path="/5EEDDE03" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEDDE03" Ref="#PWR0410"  Part="1" 
F 0 "#PWR0410" H 4100 5500 50  0001 C CNN
F 1 "GND" H 4105 5577 50  0000 C CNN
F 2 "" H 4100 5750 50  0001 C CNN
F 3 "" H 4100 5750 50  0001 C CNN
	1    4100 5750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 1 1 5EEDDE09
P 5650 4850
AR Path="/5EEDDE09" Ref="U?"  Part="1" 
AR Path="/5ED99F01/5EEDDE09" Ref="U403"  Part="1" 
F 0 "U403" H 5600 5022 50  0000 C CNN
F 1 "74LVC1G11" H 5600 5113 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 5550 4775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 5550 4775 50  0001 C CNN
	1    5650 4850
	1    0    0    1   
$EndComp
NoConn ~ 5050 5350
NoConn ~ 5050 5650
Wire Wire Line
	5050 3400 5250 3400
Wire Wire Line
	5050 4150 5150 4150
Wire Wire Line
	5050 4900 5350 4900
Text Label 8350 4800 2    50   ~ 0
~WAIT
Wire Wire Line
	5050 4600 6200 4600
$Comp
L power:GND #PWR?
U 1 1 5EEDDE26
P 6650 3150
AR Path="/5EEDDE26" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEDDE26" Ref="#PWR0414"  Part="1" 
F 0 "#PWR0414" H 6650 2900 50  0001 C CNN
F 1 "GND" V 6655 3022 50  0000 R CNN
F 2 "" H 6650 3150 50  0001 C CNN
F 3 "" H 6650 3150 50  0001 C CNN
	1    6650 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 2550 6550 2650
Wire Wire Line
	6550 2650 6650 2650
Connection ~ 6550 2550
Wire Wire Line
	6550 2550 6650 2550
Wire Wire Line
	6550 2650 6550 2750
Wire Wire Line
	6550 2750 6650 2750
Connection ~ 6550 2650
Text Label 3300 2550 0    50   ~ 0
FPCLKEN-IN
Wire Wire Line
	6100 3250 6550 3250
Wire Wire Line
	6550 3250 6550 3350
Wire Wire Line
	6550 3350 6650 3350
Connection ~ 6550 3250
Wire Wire Line
	6550 3250 6650 3250
Wire Wire Line
	6550 3350 6550 3450
Wire Wire Line
	6550 3450 6650 3450
Connection ~ 6550 3350
Wire Wire Line
	6100 2650 6100 3250
Text Label 3300 2650 0    50   ~ 0
FPµSTEP-IN
Wire Wire Line
	6200 4600 6200 3650
Wire Wire Line
	6200 2950 6650 2950
Wire Wire Line
	6650 3650 6200 3650
Connection ~ 6200 3650
Wire Wire Line
	6200 3650 6200 2950
Wire Wire Line
	6650 3950 5900 3950
Wire Wire Line
	5900 3950 5900 3850
Wire Wire Line
	6000 3100 6000 3850
Wire Wire Line
	6000 3850 6650 3850
Wire Wire Line
	5050 3100 6000 3100
Text Label 6250 3850 0    50   ~ 0
STEPPING
Text Label 6250 3950 0    50   ~ 0
µSTEPPING
Text Label 6250 3650 0    50   ~ 0
RESETTING
Text Label 6250 2950 0    50   ~ 0
RESETTING
Text HLabel 8400 4800 2    50   Output ~ 0
~WAIT
Wire Wire Line
	5850 4800 8400 4800
$Comp
L Device:C_Small C?
U 1 1 5EEE1D2C
P 1000 7300
AR Path="/5EEE1D2C" Ref="C?"  Part="1" 
AR Path="/5ED99F01/5EEE1D2C" Ref="C401"  Part="1" 
F 0 "C401" H 909 7346 50  0000 R CNN
F 1 "100nF" H 909 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1000 7300 50  0001 C CNN
F 3 "~" H 1000 7300 50  0001 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEE1D32
P 1000 7200
AR Path="/5EEE1D32" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEE1D32" Ref="#PWR0401"  Part="1" 
F 0 "#PWR0401" H 1000 7050 50  0001 C CNN
F 1 "+5V" H 1015 7373 50  0000 C CNN
F 2 "" H 1000 7200 50  0001 C CNN
F 3 "" H 1000 7200 50  0001 C CNN
	1    1000 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEE1D38
P 1000 7400
AR Path="/5EEE1D38" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEE1D38" Ref="#PWR0402"  Part="1" 
F 0 "#PWR0402" H 1000 7150 50  0001 C CNN
F 1 "GND" H 1005 7227 50  0000 C CNN
F 2 "" H 1000 7400 50  0001 C CNN
F 3 "" H 1000 7400 50  0001 C CNN
	1    1000 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 3 1 5EEE2B84
P 1350 7300
AR Path="/5EEE2B84" Ref="U?"  Part="1" 
AR Path="/5ED99F01/5EEE2B84" Ref="U401"  Part="3" 
F 0 "U401" H 1530 7346 50  0000 L CNN
F 1 "74HC74" H 1530 7255 50  0000 L CNN
F 2 "alexios:SOIC-14" H 1300 7450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1300 7450 50  0001 C CNN
	3    1350 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 3 1 5EEE40AD
P 2800 7300
AR Path="/5EEE40AD" Ref="U?"  Part="1" 
AR Path="/5ED99F01/5EEE40AD" Ref="U402"  Part="3" 
F 0 "U402" H 2980 7346 50  0000 L CNN
F 1 "74HC74" H 2980 7255 50  0000 L CNN
F 2 "alexios:SOIC-14" H 2750 7450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2750 7450 50  0001 C CNN
	3    2800 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 2 1 5EEE5ACC
P 4350 7150
AR Path="/5EEE5ACC" Ref="U?"  Part="1" 
AR Path="/5ED99F01/5EEE5ACC" Ref="U403"  Part="2" 
F 0 "U403" H 4430 7046 50  0000 L CNN
F 1 "74LVC1G11" H 4430 6955 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4250 7075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 4250 7075 50  0001 C CNN
	2    4350 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC253 U?
U 2 1 5EEE7B9D
P 5700 7900
AR Path="/5EEE7B9D" Ref="U?"  Part="1" 
AR Path="/5ED99F01/5EEE7B9D" Ref="U404"  Part="2" 
F 0 "U404" H 5880 8546 50  0000 L CNN
F 1 "74HC253" H 5880 8455 50  0000 L CNN
F 2 "alexios:SOIC-16" H 6000 8500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT253.pdf" H 6000 8500 50  0001 C CNN
	2    5700 7900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EEE93F9
P 3900 7300
AR Path="/5EEE93F9" Ref="C?"  Part="1" 
AR Path="/5ED99F01/5EEE93F9" Ref="C403"  Part="1" 
F 0 "C403" H 3809 7346 50  0000 R CNN
F 1 "100nF" H 3809 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 7300 50  0001 C CNN
F 3 "~" H 3900 7300 50  0001 C CNN
	1    3900 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEE93FF
P 3900 7200
AR Path="/5EEE93FF" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEE93FF" Ref="#PWR0405"  Part="1" 
F 0 "#PWR0405" H 3900 7050 50  0001 C CNN
F 1 "+5V" H 3915 7373 50  0000 C CNN
F 2 "" H 3900 7200 50  0001 C CNN
F 3 "" H 3900 7200 50  0001 C CNN
	1    3900 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEE9405
P 3900 7400
AR Path="/5EEE9405" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEE9405" Ref="#PWR0406"  Part="1" 
F 0 "#PWR0406" H 3900 7150 50  0001 C CNN
F 1 "GND" H 3905 7227 50  0000 C CNN
F 2 "" H 3900 7400 50  0001 C CNN
F 3 "" H 3900 7400 50  0001 C CNN
	1    3900 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EEEAA46
P 5350 7300
AR Path="/5EEEAA46" Ref="C?"  Part="1" 
AR Path="/5ED99F01/5EEEAA46" Ref="C404"  Part="1" 
F 0 "C404" H 5259 7346 50  0000 R CNN
F 1 "100nF" H 5259 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 7300 50  0001 C CNN
F 3 "~" H 5350 7300 50  0001 C CNN
	1    5350 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEEAA4C
P 5350 7200
AR Path="/5EEEAA4C" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEEAA4C" Ref="#PWR0411"  Part="1" 
F 0 "#PWR0411" H 5350 7050 50  0001 C CNN
F 1 "+5V" H 5365 7373 50  0000 C CNN
F 2 "" H 5350 7200 50  0001 C CNN
F 3 "" H 5350 7200 50  0001 C CNN
	1    5350 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEEAA52
P 5350 7400
AR Path="/5EEEAA52" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEEAA52" Ref="#PWR0412"  Part="1" 
F 0 "#PWR0412" H 5350 7150 50  0001 C CNN
F 1 "GND" H 5355 7227 50  0000 C CNN
F 2 "" H 5350 7400 50  0001 C CNN
F 3 "" H 5350 7400 50  0001 C CNN
	1    5350 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EEEC43D
P 2450 7300
AR Path="/5EEEC43D" Ref="C?"  Part="1" 
AR Path="/5ED99F01/5EEEC43D" Ref="C402"  Part="1" 
F 0 "C402" H 2359 7346 50  0000 R CNN
F 1 "100nF" H 2359 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 7300 50  0001 C CNN
F 3 "~" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEEC443
P 2450 7200
AR Path="/5EEEC443" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEEC443" Ref="#PWR0403"  Part="1" 
F 0 "#PWR0403" H 2450 7050 50  0001 C CNN
F 1 "+5V" H 2465 7373 50  0000 C CNN
F 2 "" H 2450 7200 50  0001 C CNN
F 3 "" H 2450 7200 50  0001 C CNN
	1    2450 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEEC449
P 2450 7400
AR Path="/5EEEC449" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEEC449" Ref="#PWR0404"  Part="1" 
F 0 "#PWR0404" H 2450 7150 50  0001 C CNN
F 1 "GND" H 2455 7227 50  0000 C CNN
F 2 "" H 2450 7400 50  0001 C CNN
F 3 "" H 2450 7400 50  0001 C CNN
	1    2450 7400
	1    0    0    -1  
$EndComp
Connection ~ 1000 7200
Connection ~ 1000 7400
Connection ~ 2450 7200
Connection ~ 2450 7400
Connection ~ 3900 7200
Connection ~ 3900 7400
Connection ~ 5350 7200
Connection ~ 5350 7400
$Comp
L power:GND #PWR?
U 1 1 5EEDDE20
P 6650 2450
AR Path="/5EEDDE20" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEDDE20" Ref="#PWR0413"  Part="1" 
F 0 "#PWR0413" H 6650 2200 50  0001 C CNN
F 1 "GND" V 6655 2322 50  0000 R CNN
F 2 "" H 6650 2450 50  0001 C CNN
F 3 "" H 6650 2450 50  0001 C CNN
	1    6650 2450
	0    1    1    0   
$EndComp
Text HLabel 8600 2450 2    50   3State ~ 0
FPCLKEN
Text HLabel 8600 3150 2    50   3State ~ 0
FPµSTEP
Text Label 8550 3150 2    50   ~ 0
FPµSTEP
Wire Wire Line
	7850 3150 8600 3150
Text Label 8550 2450 2    50   ~ 0
FPCLKEN
Wire Wire Line
	7850 2450 8600 2450
$Comp
L alexios:74HC253 U?
U 1 1 5EEDDE1A
P 7150 3150
AR Path="/5EEDDE1A" Ref="U?"  Part="1" 
AR Path="/5ED99F01/5EEDDE1A" Ref="U404"  Part="1" 
F 0 "U404" H 7150 4117 50  0000 C CNN
F 1 "74HC253" H 7150 4026 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7450 3750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT253.pdf" H 7450 3750 50  0001 C CNN
	1    7150 3150
	1    0    0    -1  
$EndComp
Text HLabel 3250 2550 0    50   Input ~ 0
FPCLKEN-IN
Text HLabel 3250 2650 0    50   Input ~ 0
FPµSTEP-IN
Text HLabel 3250 3100 0    50   Input ~ 0
STEP∕~RUN
Text HLabel 3250 3300 0    50   Input ~ 0
FPFETCH∕~EXEC
Text HLabel 3250 3400 0    50   Input ~ 0
~CLR
Text HLabel 3250 3850 0    50   Input ~ 0
~µSTEP
Text HLabel 3250 4050 0    50   Input ~ 0
CLK4
Text HLabel 3250 4600 0    50   Input ~ 0
~RESET
Text HLabel 3250 4800 0    50   Input ~ 0
~RSTHOLD
Wire Wire Line
	3250 2550 6550 2550
Wire Wire Line
	6100 2650 3250 2650
Wire Wire Line
	4150 3100 3250 3100
Wire Wire Line
	4150 3300 3250 3300
Wire Wire Line
	4000 3400 3250 3400
Wire Wire Line
	4150 3850 3250 3850
Wire Wire Line
	4150 4050 3250 4050
Wire Wire Line
	4150 4600 3250 4600
Wire Wire Line
	4150 4800 3250 4800
Wire Wire Line
	4150 4150 4000 4150
Connection ~ 4000 4150
Wire Wire Line
	4000 4150 4000 4900
$Comp
L Device:R_Small R?
U 1 1 5DB4499A
P 7750 2450
AR Path="/5DB4499A" Ref="R?"  Part="1" 
AR Path="/5ED99F01/5DB4499A" Ref="R401"  Part="1" 
F 0 "R401" V 7800 2650 50  0000 C CNN
F 1 "30Ω" V 7700 2650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7750 2450 50  0001 C CNN
F 3 "~" H 7750 2450 50  0001 C CNN
	1    7750 2450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DB45D45
P 7750 3150
AR Path="/5DB45D45" Ref="R?"  Part="1" 
AR Path="/5ED99F01/5DB45D45" Ref="R402"  Part="1" 
F 0 "R402" V 7800 3350 50  0000 C CNN
F 1 "30Ω" V 7700 3350 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7750 3150 50  0001 C CNN
F 3 "~" H 7750 3150 50  0001 C CNN
	1    7750 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 4150 5150 4800
Wire Wire Line
	5250 3400 5250 4700
Wire Wire Line
	5150 4800 5350 4800
Wire Wire Line
	5250 4700 5350 4700
Text Notes 6300 4600 0    50   ~ 0
The Clock Generator pulls FPCLKEN and FPµSTEP up, so when the '253's\noutputs are tri-stated, the processor runs at full speed. This allows\nresetting to run at the full clock speed, rather than whatever slow clock\nwe have set on the DFP.
$EndSCHEMATC
