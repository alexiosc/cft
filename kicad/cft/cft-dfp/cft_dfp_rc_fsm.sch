EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 20
Title "Run/Step/Stop Control"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 "dfp_run_control.v"
$EndDescr
$Comp
L alexios:74HC74 U?
U 2 1 5EEDDDB8
P 4600 4200
AR Path="/5EEDDDB8" Ref="U?"  Part="2" 
AR Path="/5ED99F01/5EEDDDB8" Ref="U202"  Part="2" 
F 0 "U202" H 4600 4617 50  0000 C CNN
F 1 "74HC74" H 4600 4526 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 4550 4350 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4550 4350 50  0001 C CNN
	2    4600 4200
	1    0    0    -1  
$EndComp
Text Label 3300 3300 0    50   ~ 0
STEP∕~RUN
$Comp
L power:GND #PWR?
U 1 1 5EEDDDCC
P 4100 3650
AR Path="/5EEDDDCC" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEDDDCC" Ref="#PWR0201"  Part="1" 
F 0 "#PWR0201" H 4100 3400 50  0001 C CNN
F 1 "GND" H 4105 3477 50  0000 C CNN
F 2 "" H 4100 3650 50  0001 C CNN
F 3 "" H 4100 3650 50  0001 C CNN
	1    4100 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3600 4000 3600
Text Label 3300 3600 0    50   ~ 0
~CLR
Text Label 3300 3500 0    50   ~ 0
FPFETCH∕~EXEC
Text Label 5750 3300 2    50   ~ 0
STEPPING
Text Label 5400 4050 0    50   ~ 0
µSTEPPING
Text Label 3300 4050 0    50   ~ 0
~µSTEP
Text Label 3300 4250 0    50   ~ 0
CLK4
Text Label 3300 2550 0    50   ~ 0
~RESET
Text Label 3300 2650 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	4150 3400 4100 3400
Wire Wire Line
	4100 3400 4100 3650
$Comp
L power:GND #PWR?
U 1 1 5EEDDDE5
P 4100 4400
AR Path="/5EEDDDE5" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEDDDE5" Ref="#PWR0202"  Part="1" 
F 0 "#PWR0202" H 4100 4150 50  0001 C CNN
F 1 "GND" H 4105 4227 50  0000 C CNN
F 2 "" H 4100 4400 50  0001 C CNN
F 3 "" H 4100 4400 50  0001 C CNN
	1    4100 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4150 4100 4150
Wire Wire Line
	4100 4150 4100 4400
Wire Wire Line
	4000 3600 4000 4350
Connection ~ 4000 3600
Text Label 3300 2850 0    50   ~ 0
FPCLKEN-IN
Text Label 3300 2950 0    50   ~ 0
FPµSTEP-IN
Wire Wire Line
	5050 3300 6000 3300
Text HLabel 9950 2550 2    50   Output ~ 0
~WAIT
$Comp
L Device:C_Small C?
U 1 1 5EEE1D2C
P 1000 7300
AR Path="/5EEE1D2C" Ref="C?"  Part="1" 
AR Path="/5ED99F01/5EEE1D2C" Ref="C201"  Part="1" 
F 0 "C201" H 909 7346 50  0000 R CNN
F 1 "100nF" H 909 7255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1000 7300 50  0001 C CNN
F 3 "~" H 1000 7300 50  0001 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEE1D32
P 1000 7200
AR Path="/5EEE1D32" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEE1D32" Ref="#PWR0203"  Part="1" 
F 0 "#PWR0203" H 1000 7050 50  0001 C CNN
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
AR Path="/5ED99F01/5EEE1D38" Ref="#PWR0205"  Part="1" 
F 0 "#PWR0205" H 1000 7150 50  0001 C CNN
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
AR Path="/5ED99F01/5EEE2B84" Ref="U202"  Part="3" 
F 0 "U202" H 1530 7346 50  0000 L CNN
F 1 "74HC74" H 1530 7255 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 1300 7450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1300 7450 50  0001 C CNN
	3    1350 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EEEAA46
P 2300 7300
AR Path="/5EEEAA46" Ref="C?"  Part="1" 
AR Path="/5ED99F01/5EEEAA46" Ref="C202"  Part="1" 
F 0 "C202" H 2209 7346 50  0000 R CNN
F 1 "100nF" H 2209 7255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7300 50  0001 C CNN
F 3 "~" H 2300 7300 50  0001 C CNN
	1    2300 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEEAA4C
P 2300 7200
AR Path="/5EEEAA4C" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEEAA4C" Ref="#PWR0204"  Part="1" 
F 0 "#PWR0204" H 2300 7050 50  0001 C CNN
F 1 "+5V" H 2315 7373 50  0000 C CNN
F 2 "" H 2300 7200 50  0001 C CNN
F 3 "" H 2300 7200 50  0001 C CNN
	1    2300 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEEAA52
P 2300 7400
AR Path="/5EEEAA52" Ref="#PWR?"  Part="1" 
AR Path="/5ED99F01/5EEEAA52" Ref="#PWR0206"  Part="1" 
F 0 "#PWR0206" H 2300 7150 50  0001 C CNN
F 1 "GND" H 2305 7227 50  0000 C CNN
F 2 "" H 2300 7400 50  0001 C CNN
F 3 "" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
Connection ~ 1000 7200
Connection ~ 1000 7400
Text HLabel 9950 2750 2    50   3State ~ 0
FPCLKEN
Text HLabel 9950 2650 2    50   3State ~ 0
FPµSTEP
Text Label 9900 2650 2    50   ~ 0
FPµSTEP
Wire Wire Line
	8800 2650 9950 2650
Text Label 9900 2750 2    50   ~ 0
FPCLKEN
Wire Wire Line
	8800 2750 9950 2750
Text HLabel 3250 2850 0    50   Input ~ 0
FPCLKEN-IN
Text HLabel 3250 2950 0    50   Input ~ 0
FPµSTEP-IN
Text HLabel 3250 3300 0    50   Input ~ 0
STEP∕~RUN
Text HLabel 3250 3500 0    50   Input ~ 0
FPFETCH∕~EXEC
Text HLabel 3250 3600 0    50   Input ~ 0
~CLR
Text HLabel 3250 4050 0    50   Input ~ 0
~µSTEP
Text HLabel 3250 4250 0    50   Input ~ 0
CLK4
Text HLabel 3250 2550 0    50   Input ~ 0
~RESET
Text HLabel 3250 2650 0    50   Input ~ 0
~RSTHOLD
Wire Wire Line
	4150 3500 4000 3500
Wire Wire Line
	4000 3600 3250 3600
Wire Wire Line
	4150 4050 3250 4050
Wire Wire Line
	4150 4250 3250 4250
Wire Wire Line
	4150 4350 4000 4350
$Comp
L Device:R_Small R?
U 1 1 5DB4499A
P 8700 2750
AR Path="/5DB4499A" Ref="R?"  Part="1" 
AR Path="/5ED99F01/5DB4499A" Ref="R202"  Part="1" 
F 0 "R202" V 8650 2650 50  0000 R CNN
F 1 "30Ω" V 8650 2850 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8700 2750 50  0001 C CNN
F 3 "~" H 8700 2750 50  0001 C CNN
	1    8700 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DB45D45
P 8700 2650
AR Path="/5DB45D45" Ref="R?"  Part="1" 
AR Path="/5ED99F01/5DB45D45" Ref="R201"  Part="1" 
F 0 "R201" V 8650 2550 50  0000 R CNN
F 1 "30Ω" V 8650 2750 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8700 2650 50  0001 C CNN
F 3 "~" H 8700 2650 50  0001 C CNN
	1    8700 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 3300 3250 3300
Connection ~ 4000 3500
Wire Wire Line
	4000 3500 3250 3500
Text HLabel 9950 3150 2    50   Output ~ 0
~LED-EXEC
Text HLabel 9950 3050 2    50   Output ~ 0
~LED-FETCH
$Comp
L alexios:ATF16V8B U201
U 1 1 61067AF8
P 7950 3000
F 0 "U201" H 7950 3750 50  0000 C CNN
F 1 "ATF16V8B" H 7950 3650 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7950 3000 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 7950 3000 50  0001 C CNN
F 4 "DFPRST" V 7950 3000 50  0000 C CNB "Signature"
F 5 "dfp-runstop.jed" H 7950 2350 50  0000 C CNN "Image Filename"
	1    7950 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 2550 8400 2550
Wire Wire Line
	8600 2650 8400 2650
Wire Wire Line
	8600 2750 8400 2750
Wire Wire Line
	9950 3050 8400 3050
Wire Wire Line
	9950 3150 8400 3150
Text Label 6900 2850 0    50   ~ 0
FPCLKEN-IN
Text Label 6900 2950 0    50   ~ 0
FPµSTEP-IN
Text Label 6900 2550 0    50   ~ 0
~RESET
Text Label 6900 2650 0    50   ~ 0
~RSTHOLD
Text Label 6900 3050 0    50   ~ 0
STEPPING
Text Label 6900 3150 0    50   ~ 0
µSTEPPING
Text Label 6900 2750 0    50   ~ 0
FPFETCH∕~EXEC
Text Label 8850 3050 2    50   ~ 0
~LED-FETCH
Text Label 8850 3150 2    50   ~ 0
~LED-EXEC
$Comp
L alexios:ATF16V8B U201
U 2 1 610ADFB8
P 2650 7300
F 0 "U201" H 2830 7346 50  0000 L CNN
F 1 "ATF16V8B" H 2830 7255 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2650 7300 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2650 7300 50  0001 C CNN
F 4 "DFPRST" V 2650 7300 50  0001 C CNB "Signature"
F 5 "dfp-runstop.jed" H 2650 6650 50  0001 C CNN "Image Filename"
	2    2650 7300
	1    0    0    -1  
$EndComp
Connection ~ 2300 7400
Connection ~ 2300 7200
Wire Wire Line
	3250 2850 7500 2850
Wire Wire Line
	3250 2550 7500 2550
Wire Wire Line
	3250 2650 7500 2650
Wire Wire Line
	3250 2950 7500 2950
Wire Wire Line
	6000 3050 7500 3050
Wire Wire Line
	6100 3150 7500 3150
Wire Wire Line
	5050 4050 6100 4050
Wire Wire Line
	6000 3050 6000 3300
Wire Wire Line
	6100 3150 6100 4050
Wire Wire Line
	4000 2750 7500 2750
$Comp
L alexios:74HC74 U?
U 1 1 5EEDDDB2
P 4600 3450
AR Path="/5EEDDDB2" Ref="U?"  Part="1" 
AR Path="/5ED99F01/5EEDDDB2" Ref="U202"  Part="1" 
F 0 "U202" H 4600 3867 50  0000 C CNN
F 1 "74HC74" H 4600 3776 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 4550 3600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4550 3600 50  0001 C CNN
	1    4600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2750 4000 3500
Wire Wire Line
	8400 3250 9150 3250
Text Label 9150 3250 2    50   ~ 0
~LED-WAIT
$EndSCHEMATC
