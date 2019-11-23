EESchema Schematic File Version 4
LIBS:cft-dfp-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 13
Title "Activity LEDs"
Date "2019-11-17"
Rev "1945"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74LVC1G17 U?
U 1 1 64CFABCF
P 5850 2900
AR Path="/64CFABCF" Ref="U?"  Part="1" 
AR Path="/64C48268/64CFABCF" Ref="U1301"  Part="1" 
F 0 "U1301" H 5800 3167 50  0000 C CNN
F 1 "74LVC1G17" H 5800 3076 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5850 2900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 5850 2900 50  0001 C CNN
	1    5850 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64CFABD5
P 6150 2900
AR Path="/64CFABD5" Ref="R?"  Part="1" 
AR Path="/64C48268/64CFABD5" Ref="R1303"  Part="1" 
F 0 "R1303" V 6250 2900 50  0000 C CNN
F 1 "150Ω" V 6350 2900 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 2900 50  0001 C CNN
F 3 "~" H 6150 2900 50  0001 C CNN
	1    6150 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 2900 6300 2900
$Comp
L Device:LED_ALT D?
U 1 1 64CFABDC
P 6450 2900
AR Path="/64CFABDC" Ref="D?"  Part="1" 
AR Path="/64C48268/64CFABDC" Ref="D1303"  Part="1" 
F 0 "D1303" H 6443 2736 50  0000 C CNN
F 1 "LED_ALT" H 6443 2736 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6450 2900 50  0001 C CNN
F 3 "~" H 6450 2900 50  0001 C CNN
	1    6450 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 2900 6650 2900
Wire Wire Line
	6650 2900 6650 2950
$Comp
L power:GND #PWR?
U 1 1 64CFABE4
P 6650 2950
AR Path="/64CFABE4" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/64CFABE4" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 6650 2700 50  0001 C CNN
F 1 "GND" H 6655 2777 50  0000 C CNN
F 2 "" H 6650 2950 50  0001 C CNN
F 3 "" H 6650 2950 50  0001 C CNN
	1    6650 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2900 4250 2900
$Comp
L alexios:74LVC1G17 U?
U 1 1 64CFABEB
P 5850 4000
AR Path="/64CFABEB" Ref="U?"  Part="1" 
AR Path="/64C48268/64CFABEB" Ref="U1302"  Part="1" 
F 0 "U1302" H 5800 4267 50  0000 C CNN
F 1 "74LVC1G17" H 5800 4176 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5850 4000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 5850 4000 50  0001 C CNN
	1    5850 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64CFABF1
P 6150 4000
AR Path="/64CFABF1" Ref="R?"  Part="1" 
AR Path="/64C48268/64CFABF1" Ref="R1304"  Part="1" 
F 0 "R1304" V 6250 4000 50  0000 C CNN
F 1 "150Ω" V 6350 4000 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 4000 50  0001 C CNN
F 3 "~" H 6150 4000 50  0001 C CNN
	1    6150 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 4000 6300 4000
$Comp
L Device:LED_ALT D?
U 1 1 64CFABF8
P 6450 4000
AR Path="/64CFABF8" Ref="D?"  Part="1" 
AR Path="/64C48268/64CFABF8" Ref="D1304"  Part="1" 
F 0 "D1304" H 6443 3836 50  0000 C CNN
F 1 "LED_ALT" H 6443 3836 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6450 4000 50  0001 C CNN
F 3 "~" H 6450 4000 50  0001 C CNN
	1    6450 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 4000 6650 4000
Wire Wire Line
	6650 4000 6650 4050
$Comp
L power:GND #PWR?
U 1 1 64CFAC00
P 6650 4050
AR Path="/64CFAC00" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/64CFAC00" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 6650 3800 50  0001 C CNN
F 1 "GND" H 6655 3877 50  0000 C CNN
F 2 "" H 6650 4050 50  0001 C CNN
F 3 "" H 6650 4050 50  0001 C CNN
	1    6650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4000 4250 4000
Text Label 4400 2900 0    50   ~ 0
LED1
Text Label 4400 4000 0    50   ~ 0
LED2
$Comp
L Device:D_ALT D?
U 1 1 64CFAC09
P 4850 2900
AR Path="/64CFAC09" Ref="D?"  Part="1" 
AR Path="/64C48268/64CFAC09" Ref="D1301"  Part="1" 
F 0 "D1301" H 4850 2684 50  0000 C CNN
F 1 "1N4148" H 4850 2775 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4850 2900 50  0001 C CNN
F 3 "~" H 4850 2900 50  0001 C CNN
	1    4850 2900
	-1   0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 64CFAC0F
P 4850 4000
AR Path="/64CFAC0F" Ref="D?"  Part="1" 
AR Path="/64C48268/64CFAC0F" Ref="D1302"  Part="1" 
F 0 "D1302" H 4850 3784 50  0000 C CNN
F 1 "1N4148" H 4850 3875 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4850 4000 50  0001 C CNN
F 3 "~" H 4850 4000 50  0001 C CNN
	1    4850 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 2900 5150 2900
Wire Wire Line
	5150 3000 5150 2900
Connection ~ 5150 2900
Wire Wire Line
	5350 2900 5350 3000
Connection ~ 5350 2900
Wire Wire Line
	5350 2900 5550 2900
Wire Wire Line
	5150 2900 5350 2900
Wire Wire Line
	5250 3250 5350 3250
$Comp
L power:GND #PWR?
U 1 1 64CFAC1D
P 5250 3250
AR Path="/64CFAC1D" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/64CFAC1D" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 5250 3000 50  0001 C CNN
F 1 "GND" H 5255 3077 50  0000 C CNN
F 2 "" H 5250 3250 50  0001 C CNN
F 3 "" H 5250 3250 50  0001 C CNN
	1    5250 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3250 5350 3200
Connection ~ 5250 3250
Wire Wire Line
	5150 3250 5250 3250
Wire Wire Line
	5150 3200 5150 3250
$Comp
L Device:C_Small C?
U 1 1 64CFAC27
P 5350 3100
AR Path="/64CFAC27" Ref="C?"  Part="1" 
AR Path="/64C48268/64CFAC27" Ref="C1302"  Part="1" 
F 0 "C1302" H 5442 3146 50  0000 L CNN
F 1 "1µF" H 5442 3055 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 3100 50  0001 C CNN
F 3 "~" H 5350 3100 50  0001 C CNN
	1    5350 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64CFAC2D
P 5150 3100
AR Path="/64CFAC2D" Ref="R?"  Part="1" 
AR Path="/64C48268/64CFAC2D" Ref="R1302"  Part="1" 
F 0 "R1302" H 5209 3054 50  0000 L CNN
F 1 "100kΩ" H 5209 3145 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5150 3100 50  0001 C CNN
F 3 "~" H 5150 3100 50  0001 C CNN
	1    5150 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5200 4300 5300 4300
$Comp
L power:GND #PWR?
U 1 1 64CFAC34
P 5200 4300
AR Path="/64CFAC34" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/64CFAC34" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 5200 4050 50  0001 C CNN
F 1 "GND" H 5205 4127 50  0000 C CNN
F 2 "" H 5200 4300 50  0001 C CNN
F 3 "" H 5200 4300 50  0001 C CNN
	1    5200 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4300 5300 4250
Connection ~ 5200 4300
Wire Wire Line
	5100 4300 5200 4300
Wire Wire Line
	5100 4250 5100 4300
$Comp
L Device:C_Small C?
U 1 1 64CFAC3E
P 5300 4150
AR Path="/64CFAC3E" Ref="C?"  Part="1" 
AR Path="/64C48268/64CFAC3E" Ref="C1301"  Part="1" 
F 0 "C1301" H 5392 4196 50  0000 L CNN
F 1 "1µF" H 5392 4105 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5300 4150 50  0001 C CNN
F 3 "~" H 5300 4150 50  0001 C CNN
	1    5300 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64CFAC44
P 5100 4150
AR Path="/64CFAC44" Ref="R?"  Part="1" 
AR Path="/64C48268/64CFAC44" Ref="R1301"  Part="1" 
F 0 "R1301" H 5159 4104 50  0000 L CNN
F 1 "100kΩ" H 5159 4195 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5100 4150 50  0001 C CNN
F 3 "~" H 5100 4150 50  0001 C CNN
	1    5100 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 4000 5100 4000
Wire Wire Line
	5100 4050 5100 4000
Connection ~ 5100 4000
Wire Wire Line
	5100 4000 5300 4000
Wire Wire Line
	5300 4000 5300 4050
Connection ~ 5300 4000
Wire Wire Line
	5300 4000 5550 4000
$Comp
L Device:C_Small C?
U 1 1 64CFAC51
P 7350 4050
AR Path="/64CFAC51" Ref="C?"  Part="1" 
AR Path="/64C48268/64CFAC51" Ref="C1304"  Part="1" 
F 0 "C1304" H 7259 4096 50  0000 R CNN
F 1 "100nF" H 7259 4005 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7350 4050 50  0001 C CNN
F 3 "~" H 7350 4050 50  0001 C CNN
	1    7350 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64CFAC57
P 7350 3950
AR Path="/64CFAC57" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/64CFAC57" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 7350 3800 50  0001 C CNN
F 1 "+5V" H 7365 4123 50  0000 C CNN
F 2 "" H 7350 3950 50  0001 C CNN
F 3 "" H 7350 3950 50  0001 C CNN
	1    7350 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64CFAC5D
P 7350 4150
AR Path="/64CFAC5D" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/64CFAC5D" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 7350 3900 50  0001 C CNN
F 1 "GND" H 7355 3977 50  0000 C CNN
F 2 "" H 7350 4150 50  0001 C CNN
F 3 "" H 7350 4150 50  0001 C CNN
	1    7350 4150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G17 U?
U 2 1 64CFAC63
P 7700 3950
AR Path="/64CFAC63" Ref="U?"  Part="2" 
AR Path="/64C48268/64CFAC63" Ref="U1302"  Part="2" 
F 0 "U1302" H 7880 3896 50  0000 L CNN
F 1 "74LVC1G17" H 7880 3805 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7700 3950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 7700 3950 50  0001 C CNN
	2    7700 3950
	1    0    0    -1  
$EndComp
Connection ~ 7350 4150
Connection ~ 7350 3950
$Comp
L Device:C_Small C?
U 1 1 64CFAC6B
P 7350 2900
AR Path="/64CFAC6B" Ref="C?"  Part="1" 
AR Path="/64C48268/64CFAC6B" Ref="C1303"  Part="1" 
F 0 "C1303" H 7259 2946 50  0000 R CNN
F 1 "100nF" H 7259 2855 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7350 2900 50  0001 C CNN
F 3 "~" H 7350 2900 50  0001 C CNN
	1    7350 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64CFAC71
P 7350 2800
AR Path="/64CFAC71" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/64CFAC71" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 7350 2650 50  0001 C CNN
F 1 "+5V" H 7365 2973 50  0000 C CNN
F 2 "" H 7350 2800 50  0001 C CNN
F 3 "" H 7350 2800 50  0001 C CNN
	1    7350 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64CFAC77
P 7350 3000
AR Path="/64CFAC77" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/64CFAC77" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 7350 2750 50  0001 C CNN
F 1 "GND" H 7355 2827 50  0000 C CNN
F 2 "" H 7350 3000 50  0001 C CNN
F 3 "" H 7350 3000 50  0001 C CNN
	1    7350 3000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G17 U?
U 2 1 64CFAC7D
P 7700 2800
AR Path="/64CFAC7D" Ref="U?"  Part="2" 
AR Path="/64C48268/64CFAC7D" Ref="U1301"  Part="2" 
F 0 "U1301" H 7880 2746 50  0000 L CNN
F 1 "74LVC1G17" H 7880 2655 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7700 2800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 7700 2800 50  0001 C CNN
	2    7700 2800
	1    0    0    -1  
$EndComp
Connection ~ 7350 3000
Connection ~ 7350 2800
Text Notes 6450 4550 0    50   ~ 0
1.2kΩ for I=2mA, Vf=2.65V.
Wire Notes Line style solid
	6150 4300 6350 4500
Text HLabel 4250 2900 0    50   Input ~ 0
LED1
Text HLabel 4250 4000 0    50   Input ~ 0
LED2
Text Notes 6450 4700 0    50   ~ 0
Vf=2.1V (red 0805 LEDs), I=20mA: R=145Ω (use 150Ω)\nVf=3.2V (green 0805 LEDs), I=20mA: R=90Ω (use 100Ω)
$EndSCHEMATC
