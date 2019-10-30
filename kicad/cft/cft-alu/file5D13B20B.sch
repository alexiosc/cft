EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 36 37
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 9050 3200 2    50   Output ~ 0
FV
Text Label 7400 3400 2    50   ~ 0
CLK4
Text Label 5800 3600 2    50   ~ 0
~RESET
Text Label 8450 3200 0    50   ~ 0
FV
Text Label 5800 3500 2    50   ~ 0
CLKL
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D14D7D0
P 4350 4300
AR Path="/5DC89E19/5D14D7D0" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D7D0" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D14D7D0" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D14D7D0" Ref="U?"  Part="1" 
F 0 "U?" H 4275 4567 50  0000 C CNN
F 1 "74LVC1G08" H 4275 4476 50  0000 C CNN
F 2 "" H 4000 4300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 4000 4300 50  0001 C CNN
	1    4350 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3500 6950 3500
Text Label 7400 3500 2    50   ~ 0
~RESET
$Comp
L power:+5V #PWR?
U 1 1 5D14D7DE
P 7400 3150
AR Path="/5DC89E19/5D14D7DE" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D7DE" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D14D7DE" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D14D7DE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7400 3000 50  0001 C CNN
F 1 "+5V" H 7415 3323 50  0000 C CNN
F 2 "" H 7400 3150 50  0001 C CNN
F 3 "" H 7400 3150 50  0001 C CNN
	1    7400 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3150 7400 3200
Wire Wire Line
	7400 3200 7450 3200
Wire Wire Line
	5100 3600 5800 3600
Text Label 5800 3400 2    50   ~ 0
VD
$Comp
L alexios:74HC74 U?
U 1 1 5D14D7F4
P 6250 3450
AR Path="/5DC89E19/5D14D7F4" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D7F4" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D14D7F4" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D14D7F4" Ref="U?"  Part="1" 
F 0 "U?" H 6250 3867 50  0000 C CNN
F 1 "74HC74" H 6250 3776 50  0000 C CNN
F 2 "" H 6200 3600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6200 3600 50  0001 C CNN
	1    6250 3450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 5D14D7FA
P 7900 3350
AR Path="/5DC89E19/5D14D7FA" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D98F946/5D14D7FA" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D14D7FA" Ref="U?"  Part="2" 
AR Path="/5D13B20C/5D14D7FA" Ref="U?"  Part="2" 
F 0 "U?" H 7900 3767 50  0000 C CNN
F 1 "74HC74" H 7900 3676 50  0000 C CNN
F 2 "" H 7850 3500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7850 3500 50  0001 C CNN
	2    7900 3350
	1    0    0    -1  
$EndComp
Text HLabel 2900 4350 0    50   Input ~ 0
~READ-ALU-ADD
Wire Wire Line
	7050 3400 7450 3400
Text Notes 7150 6950 0    197  ~ 39
The Overflow Register (V)
$Comp
L alexios:74LVC1G08 U?
U 2 1 5D14D89A
P 2850 7250
AR Path="/5DC89E19/5D14D89A" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D89A" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D14D89A" Ref="U?"  Part="2" 
AR Path="/5D13B20C/5D14D89A" Ref="U?"  Part="2" 
F 0 "U?" H 2930 7196 50  0000 L CNN
F 1 "74LVC1G08" H 2930 7105 50  0000 L CNN
F 2 "" H 2500 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2500 7250 50  0001 C CNN
	2    2850 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D14D8BE
P 950 7350
AR Path="/5CC0D65F/5D14D8BE" Ref="C?"  Part="1" 
AR Path="/5D14D8BE" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D14D8BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D14D8BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D14D8BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D14D8BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D8BE" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D14D8BE" Ref="C?"  Part="1" 
AR Path="/5D13B20C/5D14D8BE" Ref="C?"  Part="1" 
F 0 "C?" H 859 7396 50  0000 R CNN
F 1 "100nF" H 859 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 7350 50  0001 C CNN
F 3 "~" H 950 7350 50  0001 C CNN
	1    950  7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D14D8C4
P 950 7450
AR Path="/5D14D8C4" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D14D8C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D14D8C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D14D8C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D14D8C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D8C4" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D14D8C4" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D14D8C4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 7200 50  0001 C CNN
F 1 "GND" H 955 7277 50  0000 C CNN
F 2 "" H 950 7450 50  0001 C CNN
F 3 "" H 950 7450 50  0001 C CNN
	1    950  7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D14D8CA
P 950 7250
AR Path="/5D14D8CA" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D14D8CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D14D8CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D14D8CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D14D8CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D8CA" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D14D8CA" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D14D8CA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 7100 50  0001 C CNN
F 1 "+5V" H 965 7423 50  0000 C CNN
F 2 "" H 950 7250 50  0001 C CNN
F 3 "" H 950 7250 50  0001 C CNN
	1    950  7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D14D8D0
P 2400 7350
AR Path="/5CC0D65F/5D14D8D0" Ref="C?"  Part="1" 
AR Path="/5D14D8D0" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D14D8D0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D14D8D0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D14D8D0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D14D8D0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D8D0" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D14D8D0" Ref="C?"  Part="1" 
AR Path="/5D13B20C/5D14D8D0" Ref="C?"  Part="1" 
F 0 "C?" H 2309 7396 50  0000 R CNN
F 1 "100nF" H 2309 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2400 7350 50  0001 C CNN
F 3 "~" H 2400 7350 50  0001 C CNN
	1    2400 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D14D8D6
P 2400 7450
AR Path="/5D14D8D6" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D14D8D6" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D14D8D6" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D14D8D6" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D14D8D6" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D8D6" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D14D8D6" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D14D8D6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2400 7200 50  0001 C CNN
F 1 "GND" H 2405 7277 50  0000 C CNN
F 2 "" H 2400 7450 50  0001 C CNN
F 3 "" H 2400 7450 50  0001 C CNN
	1    2400 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D14D8DC
P 2400 7250
AR Path="/5D14D8DC" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D14D8DC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D14D8DC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D14D8DC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D14D8DC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D8DC" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D14D8DC" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D14D8DC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2400 7100 50  0001 C CNN
F 1 "+5V" H 2415 7423 50  0000 C CNN
F 2 "" H 2400 7250 50  0001 C CNN
F 3 "" H 2400 7250 50  0001 C CNN
	1    2400 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D14D906
P 3850 7350
AR Path="/5CC0D65F/5D14D906" Ref="C?"  Part="1" 
AR Path="/5D14D906" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D14D906" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D14D906" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D14D906" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D14D906" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D906" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D14D906" Ref="C?"  Part="1" 
AR Path="/5D13B20C/5D14D906" Ref="C?"  Part="1" 
F 0 "C?" H 3759 7396 50  0000 R CNN
F 1 "100nF" H 3759 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3850 7350 50  0001 C CNN
F 3 "~" H 3850 7350 50  0001 C CNN
	1    3850 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D14D90C
P 3850 7450
AR Path="/5D14D90C" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D14D90C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D14D90C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D14D90C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D14D90C" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D90C" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D14D90C" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D14D90C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3850 7200 50  0001 C CNN
F 1 "GND" H 3855 7277 50  0000 C CNN
F 2 "" H 3850 7450 50  0001 C CNN
F 3 "" H 3850 7450 50  0001 C CNN
	1    3850 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D14D912
P 3850 7250
AR Path="/5D14D912" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D14D912" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D14D912" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D14D912" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D14D912" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D14D912" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D14D912" Ref="#PWR?"  Part="1" 
AR Path="/5D13B20C/5D14D912" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3850 7100 50  0001 C CNN
F 1 "+5V" H 3865 7423 50  0000 C CNN
F 2 "" H 3850 7250 50  0001 C CNN
F 3 "" H 3850 7250 50  0001 C CNN
	1    3850 7250
	1    0    0    -1  
$EndComp
Connection ~ 2400 7250
Connection ~ 2400 7450
NoConn ~ 6700 3600
$Comp
L power:+5V #PWR?
U 1 1 5D1B13E3
P 5750 3250
F 0 "#PWR?" H 5750 3100 50  0001 C CNN
F 1 "+5V" H 5765 3423 50  0000 C CNN
F 2 "" H 5750 3250 50  0001 C CNN
F 3 "" H 5750 3250 50  0001 C CNN
	1    5750 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3250 5750 3300
Wire Wire Line
	5750 3300 5800 3300
Wire Wire Line
	8350 3200 9050 3200
NoConn ~ 8350 3500
Wire Wire Line
	6700 3300 7450 3300
Wire Wire Line
	4650 3400 5800 3400
Wire Wire Line
	5000 4300 5000 3500
Wire Wire Line
	5000 3500 5800 3500
Wire Wire Line
	4050 4250 3000 4250
Wire Wire Line
	5000 4300 4500 4300
Text Label 3150 4250 0    50   ~ 0
~READ-ALU-ADD
Text Label 3150 4350 0    50   ~ 0
~WRITE-FLAGS
Wire Wire Line
	7050 3400 7050 2900
Text HLabel 2900 2900 0    50   Input ~ 0
CLK4
Wire Wire Line
	2900 2900 7050 2900
Text Label 3750 2800 0    50   ~ 0
~RESET
Wire Wire Line
	2900 2800 5100 2800
Wire Wire Line
	5100 2800 6950 2800
Connection ~ 5100 2800
Wire Wire Line
	5100 3600 5100 2800
Wire Wire Line
	6950 2800 6950 3500
Text Label 6100 2900 0    50   ~ 0
CLK4
Text Label 6100 2800 0    50   ~ 0
~RESET
Text Label 3750 2900 0    50   ~ 0
CLK4
Text HLabel 2900 2800 0    50   Input ~ 0
~RESET
$Comp
L alexios:74LVC2G157 U?
U 1 1 5D26DCC6
P 4300 3500
F 0 "U?" H 4300 3867 50  0000 C CNN
F 1 "74LVC2G157" H 4300 3776 50  0000 C CNN
F 2 "" H 4200 3625 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 4200 3625 50  0001 C CNN
	1    4300 3500
	1    0    0    -1  
$EndComp
Text Label 3150 3400 0    50   ~ 0
IBUS13
Text HLabel 2900 3400 0    50   Input ~ 0
IBUS13
Wire Wire Line
	2900 3400 3950 3400
Text Label 3150 3500 0    50   ~ 0
FVIN-ADD
Text HLabel 2900 3500 0    50   Input ~ 0
FVIN-ADD
Wire Wire Line
	2900 3500 3950 3500
Text Label 3150 3600 0    50   ~ 0
~WRITE-FLAGS
Wire Wire Line
	2900 3600 3000 3600
Text HLabel 2900 3600 0    50   Input ~ 0
~WRITE-FLAGS
$Comp
L power:GND #PWR?
U 1 1 5D29EA2F
P 3950 3700
F 0 "#PWR?" H 3950 3450 50  0001 C CNN
F 1 "GND" H 3955 3527 50  0000 C CNN
F 2 "" H 3950 3700 50  0001 C CNN
F 3 "" H 3950 3700 50  0001 C CNN
	1    3950 3700
	1    0    0    -1  
$EndComp
NoConn ~ 4650 3700
$Comp
L alexios:74LVC2G157 U?
U 2 1 5D2B8539
P 1300 7350
F 0 "U?" H 1480 7396 50  0000 L CNN
F 1 "74LVC2G157" H 1480 7305 50  0000 L CNN
F 2 "" H 1200 7475 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 1200 7475 50  0001 C CNN
	2    1300 7350
	1    0    0    -1  
$EndComp
Connection ~ 950  7450
Connection ~ 950  7250
Wire Wire Line
	2900 4350 4050 4350
Wire Wire Line
	3000 3600 3000 4250
Connection ~ 3000 3600
Wire Wire Line
	3000 3600 3950 3600
Text Label 4700 4300 0    50   ~ 0
CLKV
Text Label 4700 3400 0    50   ~ 0
VD
$Comp
L alexios:74HC74 U?
U 3 1 5D33342C
P 4200 7350
AR Path="/5DC89E19/5D33342C" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D33342C" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D33342C" Ref="U?"  Part="1" 
AR Path="/5D13B20C/5D33342C" Ref="U?"  Part="3" 
F 0 "U?" H 4200 7767 50  0000 C CNN
F 1 "74HC74" H 4200 7676 50  0000 C CNN
F 2 "" H 4150 7500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4150 7500 50  0001 C CNN
	3    4200 7350
	1    0    0    -1  
$EndComp
Connection ~ 3850 7250
Connection ~ 3850 7450
$EndSCHEMATC
