EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
L Device:R_Small R?
U 1 1 603507C6
P 5850 1600
AR Path="/603507C6" Ref="R?"  Part="1" 
AR Path="/64C48268/603507C6" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/603507C6" Ref="R?"  Part="1" 
AR Path="/6032CE30/603507C6" Ref="R23"  Part="1" 
F 0 "R23" V 5950 1600 50  0000 C CNN
F 1 "150Ω" V 6050 1600 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 1600 50  0001 C CNN
F 3 "~" H 5850 1600 50  0001 C CNN
	1    5850 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 1600 6000 1600
$Comp
L Device:LED_ALT D?
U 1 1 603507CD
P 6150 1600
AR Path="/603507CD" Ref="D?"  Part="1" 
AR Path="/64C48268/603507CD" Ref="D?"  Part="1" 
AR Path="/5FF44A8A/603507CD" Ref="D?"  Part="1" 
AR Path="/6032CE30/603507CD" Ref="D23"  Part="1" 
F 0 "D23" H 6143 1436 50  0000 C CNN
F 1 "LED_ALT" H 6143 1436 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 1600 50  0001 C CNN
F 3 "~" H 6150 1600 50  0001 C CNN
	1    6150 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 1600 3850 1600
Text Label 3850 1600 0    50   ~ 0
LED1
Wire Wire Line
	4600 1600 4750 1600
Wire Wire Line
	4750 1700 4750 1600
Connection ~ 4750 1600
Wire Wire Line
	4950 1600 4950 1700
Connection ~ 4950 1600
Wire Wire Line
	4950 1600 5150 1600
Wire Wire Line
	4750 1600 4950 1600
Wire Wire Line
	4850 1950 4950 1950
$Comp
L power:GND #PWR?
U 1 1 603507E3
P 4850 1950
AR Path="/603507E3" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/603507E3" Ref="#PWR?"  Part="1" 
AR Path="/5FF44A8A/603507E3" Ref="#PWR?"  Part="1" 
AR Path="/6032CE30/603507E3" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 4850 1700 50  0001 C CNN
F 1 "GND" H 4855 1777 50  0000 C CNN
F 2 "" H 4850 1950 50  0001 C CNN
F 3 "" H 4850 1950 50  0001 C CNN
	1    4850 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1950 4950 1900
Connection ~ 4850 1950
Wire Wire Line
	4750 1950 4850 1950
Wire Wire Line
	4750 1900 4750 1950
$Comp
L Device:C_Small C?
U 1 1 603507ED
P 4950 1800
AR Path="/603507ED" Ref="C?"  Part="1" 
AR Path="/64C48268/603507ED" Ref="C?"  Part="1" 
AR Path="/5FF44A8A/603507ED" Ref="C?"  Part="1" 
AR Path="/6032CE30/603507ED" Ref="C7"  Part="1" 
F 0 "C7" H 5042 1846 50  0000 L CNN
F 1 "1µF" H 5042 1755 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 1800 50  0001 C CNN
F 3 "~" H 4950 1800 50  0001 C CNN
	1    4950 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 603507F3
P 4750 1800
AR Path="/603507F3" Ref="R?"  Part="1" 
AR Path="/64C48268/603507F3" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/603507F3" Ref="R?"  Part="1" 
AR Path="/6032CE30/603507F3" Ref="R17"  Part="1" 
F 0 "R17" H 4809 1754 50  0000 L CNN
F 1 "100kΩ" H 4809 1845 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 1800 50  0001 C CNN
F 3 "~" H 4750 1800 50  0001 C CNN
	1    4750 1800
	-1   0    0    1   
$EndComp
$Comp
L alexios:74HC14 U3
U 1 1 603507F9
P 5350 1600
F 0 "U3" H 5425 1867 50  0000 C CNN
F 1 "74HC14" H 5425 1776 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5350 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 5350 1800 50  0001 C CNN
	1    5350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1600 5750 1600
$Comp
L power:+5V #PWR0114
U 1 1 60350800
P 6450 1550
F 0 "#PWR0114" H 6450 1400 50  0001 C CNN
F 1 "+5V" H 6465 1723 50  0000 C CNN
F 2 "" H 6450 1550 50  0001 C CNN
F 3 "" H 6450 1550 50  0001 C CNN
	1    6450 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1600 6450 1600
Wire Wire Line
	6450 1600 6450 1550
$Comp
L Device:D_Schottky_ALT D17
U 1 1 6035E850
P 4450 1600
F 0 "D17" H 4450 1384 50  0000 C CNN
F 1 "CUS520" H 4450 1475 50  0000 C CNN
F 2 "alexios:SOD-323" H 4450 1600 50  0001 C CNN
F 3 "~" H 4450 1600 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 4450 1600 50  0001 C CNN "Mouser"
	1    4450 1600
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 603886BB
P 5850 2250
AR Path="/603886BB" Ref="R?"  Part="1" 
AR Path="/64C48268/603886BB" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/603886BB" Ref="R?"  Part="1" 
AR Path="/6032CE30/603886BB" Ref="R24"  Part="1" 
F 0 "R24" V 5950 2250 50  0000 C CNN
F 1 "150Ω" V 6050 2250 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 2250 50  0001 C CNN
F 3 "~" H 5850 2250 50  0001 C CNN
	1    5850 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 2250 6000 2250
$Comp
L Device:LED_ALT D?
U 1 1 603886C2
P 6150 2250
AR Path="/603886C2" Ref="D?"  Part="1" 
AR Path="/64C48268/603886C2" Ref="D?"  Part="1" 
AR Path="/5FF44A8A/603886C2" Ref="D?"  Part="1" 
AR Path="/6032CE30/603886C2" Ref="D24"  Part="1" 
F 0 "D24" H 6143 2086 50  0000 C CNN
F 1 "LED_ALT" H 6143 2086 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 2250 50  0001 C CNN
F 3 "~" H 6150 2250 50  0001 C CNN
	1    6150 2250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 2250 3850 2250
Text Label 3850 2250 0    50   ~ 0
LED2
Wire Wire Line
	4600 2250 4750 2250
Wire Wire Line
	4750 2350 4750 2250
Connection ~ 4750 2250
Wire Wire Line
	4950 2250 4950 2350
Connection ~ 4950 2250
Wire Wire Line
	4950 2250 5150 2250
Wire Wire Line
	4750 2250 4950 2250
Wire Wire Line
	4850 2600 4950 2600
$Comp
L power:GND #PWR?
U 1 1 603886D2
P 4850 2600
AR Path="/603886D2" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/603886D2" Ref="#PWR?"  Part="1" 
AR Path="/5FF44A8A/603886D2" Ref="#PWR?"  Part="1" 
AR Path="/6032CE30/603886D2" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 4850 2350 50  0001 C CNN
F 1 "GND" H 4855 2427 50  0000 C CNN
F 2 "" H 4850 2600 50  0001 C CNN
F 3 "" H 4850 2600 50  0001 C CNN
	1    4850 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2600 4950 2550
Connection ~ 4850 2600
Wire Wire Line
	4750 2600 4850 2600
Wire Wire Line
	4750 2550 4750 2600
$Comp
L Device:C_Small C?
U 1 1 603886DC
P 4950 2450
AR Path="/603886DC" Ref="C?"  Part="1" 
AR Path="/64C48268/603886DC" Ref="C?"  Part="1" 
AR Path="/5FF44A8A/603886DC" Ref="C?"  Part="1" 
AR Path="/6032CE30/603886DC" Ref="C8"  Part="1" 
F 0 "C8" H 5042 2496 50  0000 L CNN
F 1 "1µF" H 5042 2405 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 2450 50  0001 C CNN
F 3 "~" H 4950 2450 50  0001 C CNN
	1    4950 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 603886E2
P 4750 2450
AR Path="/603886E2" Ref="R?"  Part="1" 
AR Path="/64C48268/603886E2" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/603886E2" Ref="R?"  Part="1" 
AR Path="/6032CE30/603886E2" Ref="R18"  Part="1" 
F 0 "R18" H 4809 2404 50  0000 L CNN
F 1 "100kΩ" H 4809 2495 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 2450 50  0001 C CNN
F 3 "~" H 4750 2450 50  0001 C CNN
	1    4750 2450
	-1   0    0    1   
$EndComp
$Comp
L alexios:74HC14 U3
U 2 1 603886E8
P 5350 2250
F 0 "U3" H 5425 2517 50  0000 C CNN
F 1 "74HC14" H 5425 2426 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5350 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 5350 2450 50  0001 C CNN
	2    5350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2250 5750 2250
$Comp
L power:+5V #PWR0116
U 1 1 603886EF
P 6450 2200
F 0 "#PWR0116" H 6450 2050 50  0001 C CNN
F 1 "+5V" H 6465 2373 50  0000 C CNN
F 2 "" H 6450 2200 50  0001 C CNN
F 3 "" H 6450 2200 50  0001 C CNN
	1    6450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2250 6450 2250
Wire Wire Line
	6450 2250 6450 2200
$Comp
L Device:D_Schottky_ALT D18
U 1 1 603886F8
P 4450 2250
F 0 "D18" H 4450 2034 50  0000 C CNN
F 1 "CUS520" H 4450 2125 50  0000 C CNN
F 2 "alexios:SOD-323" H 4450 2250 50  0001 C CNN
F 3 "~" H 4450 2250 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 4450 2250 50  0001 C CNN "Mouser"
	1    4450 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6038D0B0
P 5850 2900
AR Path="/6038D0B0" Ref="R?"  Part="1" 
AR Path="/64C48268/6038D0B0" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/6038D0B0" Ref="R?"  Part="1" 
AR Path="/6032CE30/6038D0B0" Ref="R25"  Part="1" 
F 0 "R25" V 5950 2900 50  0000 C CNN
F 1 "150Ω" V 6050 2900 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 2900 50  0001 C CNN
F 3 "~" H 5850 2900 50  0001 C CNN
	1    5850 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 2900 6000 2900
$Comp
L Device:LED_ALT D?
U 1 1 6038D0B7
P 6150 2900
AR Path="/6038D0B7" Ref="D?"  Part="1" 
AR Path="/64C48268/6038D0B7" Ref="D?"  Part="1" 
AR Path="/5FF44A8A/6038D0B7" Ref="D?"  Part="1" 
AR Path="/6032CE30/6038D0B7" Ref="D25"  Part="1" 
F 0 "D25" H 6143 2736 50  0000 C CNN
F 1 "LED_ALT" H 6143 2736 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 2900 50  0001 C CNN
F 3 "~" H 6150 2900 50  0001 C CNN
	1    6150 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 2900 3850 2900
Text Label 3850 2900 0    50   ~ 0
LED3
Wire Wire Line
	4600 2900 4750 2900
Wire Wire Line
	4750 3000 4750 2900
Connection ~ 4750 2900
Wire Wire Line
	4950 2900 4950 3000
Connection ~ 4950 2900
Wire Wire Line
	4950 2900 5150 2900
Wire Wire Line
	4750 2900 4950 2900
Wire Wire Line
	4850 3250 4950 3250
$Comp
L power:GND #PWR?
U 1 1 6038D0C7
P 4850 3250
AR Path="/6038D0C7" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/6038D0C7" Ref="#PWR?"  Part="1" 
AR Path="/5FF44A8A/6038D0C7" Ref="#PWR?"  Part="1" 
AR Path="/6032CE30/6038D0C7" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 4850 3000 50  0001 C CNN
F 1 "GND" H 4855 3077 50  0000 C CNN
F 2 "" H 4850 3250 50  0001 C CNN
F 3 "" H 4850 3250 50  0001 C CNN
	1    4850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3250 4950 3200
Connection ~ 4850 3250
Wire Wire Line
	4750 3250 4850 3250
Wire Wire Line
	4750 3200 4750 3250
$Comp
L Device:C_Small C?
U 1 1 6038D0D1
P 4950 3100
AR Path="/6038D0D1" Ref="C?"  Part="1" 
AR Path="/64C48268/6038D0D1" Ref="C?"  Part="1" 
AR Path="/5FF44A8A/6038D0D1" Ref="C?"  Part="1" 
AR Path="/6032CE30/6038D0D1" Ref="C9"  Part="1" 
F 0 "C9" H 5042 3146 50  0000 L CNN
F 1 "1µF" H 5042 3055 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 3100 50  0001 C CNN
F 3 "~" H 4950 3100 50  0001 C CNN
	1    4950 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6038D0D7
P 4750 3100
AR Path="/6038D0D7" Ref="R?"  Part="1" 
AR Path="/64C48268/6038D0D7" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/6038D0D7" Ref="R?"  Part="1" 
AR Path="/6032CE30/6038D0D7" Ref="R19"  Part="1" 
F 0 "R19" H 4809 3054 50  0000 L CNN
F 1 "100kΩ" H 4809 3145 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 3100 50  0001 C CNN
F 3 "~" H 4750 3100 50  0001 C CNN
	1    4750 3100
	-1   0    0    1   
$EndComp
$Comp
L alexios:74HC14 U3
U 3 1 6038D0DD
P 5350 2900
F 0 "U3" H 5425 3167 50  0000 C CNN
F 1 "74HC14" H 5425 3076 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5350 3100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 5350 3100 50  0001 C CNN
	3    5350 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2900 5750 2900
$Comp
L power:+5V #PWR0118
U 1 1 6038D0E4
P 6450 2850
F 0 "#PWR0118" H 6450 2700 50  0001 C CNN
F 1 "+5V" H 6465 3023 50  0000 C CNN
F 2 "" H 6450 2850 50  0001 C CNN
F 3 "" H 6450 2850 50  0001 C CNN
	1    6450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2900 6450 2900
Wire Wire Line
	6450 2900 6450 2850
$Comp
L Device:D_Schottky_ALT D19
U 1 1 6038D0ED
P 4450 2900
F 0 "D19" H 4450 2684 50  0000 C CNN
F 1 "CUS520" H 4450 2775 50  0000 C CNN
F 2 "alexios:SOD-323" H 4450 2900 50  0001 C CNN
F 3 "~" H 4450 2900 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 4450 2900 50  0001 C CNN "Mouser"
	1    4450 2900
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6038D0F3
P 5850 3550
AR Path="/6038D0F3" Ref="R?"  Part="1" 
AR Path="/64C48268/6038D0F3" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/6038D0F3" Ref="R?"  Part="1" 
AR Path="/6032CE30/6038D0F3" Ref="R26"  Part="1" 
F 0 "R26" V 5950 3550 50  0000 C CNN
F 1 "150Ω" V 6050 3550 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 3550 50  0001 C CNN
F 3 "~" H 5850 3550 50  0001 C CNN
	1    5850 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 3550 6000 3550
$Comp
L Device:LED_ALT D?
U 1 1 6038D0FA
P 6150 3550
AR Path="/6038D0FA" Ref="D?"  Part="1" 
AR Path="/64C48268/6038D0FA" Ref="D?"  Part="1" 
AR Path="/5FF44A8A/6038D0FA" Ref="D?"  Part="1" 
AR Path="/6032CE30/6038D0FA" Ref="D26"  Part="1" 
F 0 "D26" H 6143 3386 50  0000 C CNN
F 1 "LED_ALT" H 6143 3386 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 3550 50  0001 C CNN
F 3 "~" H 6150 3550 50  0001 C CNN
	1    6150 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 3550 3850 3550
Text Label 3850 3550 0    50   ~ 0
LED4
Wire Wire Line
	4600 3550 4750 3550
Wire Wire Line
	4750 3650 4750 3550
Connection ~ 4750 3550
Wire Wire Line
	4950 3550 4950 3650
Connection ~ 4950 3550
Wire Wire Line
	4950 3550 5150 3550
Wire Wire Line
	4750 3550 4950 3550
Wire Wire Line
	4850 3900 4950 3900
$Comp
L power:GND #PWR?
U 1 1 6038D10A
P 4850 3900
AR Path="/6038D10A" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/6038D10A" Ref="#PWR?"  Part="1" 
AR Path="/5FF44A8A/6038D10A" Ref="#PWR?"  Part="1" 
AR Path="/6032CE30/6038D10A" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 4850 3650 50  0001 C CNN
F 1 "GND" H 4855 3727 50  0000 C CNN
F 2 "" H 4850 3900 50  0001 C CNN
F 3 "" H 4850 3900 50  0001 C CNN
	1    4850 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3900 4950 3850
Connection ~ 4850 3900
Wire Wire Line
	4750 3900 4850 3900
Wire Wire Line
	4750 3850 4750 3900
$Comp
L Device:C_Small C?
U 1 1 6038D114
P 4950 3750
AR Path="/6038D114" Ref="C?"  Part="1" 
AR Path="/64C48268/6038D114" Ref="C?"  Part="1" 
AR Path="/5FF44A8A/6038D114" Ref="C?"  Part="1" 
AR Path="/6032CE30/6038D114" Ref="C10"  Part="1" 
F 0 "C10" H 5042 3796 50  0000 L CNN
F 1 "1µF" H 5042 3705 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 3750 50  0001 C CNN
F 3 "~" H 4950 3750 50  0001 C CNN
	1    4950 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6038D11A
P 4750 3750
AR Path="/6038D11A" Ref="R?"  Part="1" 
AR Path="/64C48268/6038D11A" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/6038D11A" Ref="R?"  Part="1" 
AR Path="/6032CE30/6038D11A" Ref="R20"  Part="1" 
F 0 "R20" H 4809 3704 50  0000 L CNN
F 1 "100kΩ" H 4809 3795 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 3750 50  0001 C CNN
F 3 "~" H 4750 3750 50  0001 C CNN
	1    4750 3750
	-1   0    0    1   
$EndComp
$Comp
L alexios:74HC14 U3
U 4 1 6038D120
P 5350 3550
F 0 "U3" H 5425 3817 50  0000 C CNN
F 1 "74HC14" H 5425 3726 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5350 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 5350 3750 50  0001 C CNN
	4    5350 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3550 5750 3550
$Comp
L power:+5V #PWR0120
U 1 1 6038D127
P 6450 3500
F 0 "#PWR0120" H 6450 3350 50  0001 C CNN
F 1 "+5V" H 6465 3673 50  0000 C CNN
F 2 "" H 6450 3500 50  0001 C CNN
F 3 "" H 6450 3500 50  0001 C CNN
	1    6450 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3550 6450 3550
Wire Wire Line
	6450 3550 6450 3500
$Comp
L Device:D_Schottky_ALT D20
U 1 1 6038D130
P 4450 3550
F 0 "D20" H 4450 3334 50  0000 C CNN
F 1 "CUS520" H 4450 3425 50  0000 C CNN
F 2 "alexios:SOD-323" H 4450 3550 50  0001 C CNN
F 3 "~" H 4450 3550 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 4450 3550 50  0001 C CNN "Mouser"
	1    4450 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 603B00D8
P 5850 4250
AR Path="/603B00D8" Ref="R?"  Part="1" 
AR Path="/64C48268/603B00D8" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/603B00D8" Ref="R?"  Part="1" 
AR Path="/6032CE30/603B00D8" Ref="R27"  Part="1" 
F 0 "R27" V 5950 4250 50  0000 C CNN
F 1 "150Ω" V 6050 4250 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 4250 50  0001 C CNN
F 3 "~" H 5850 4250 50  0001 C CNN
	1    5850 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 4250 6000 4250
$Comp
L Device:LED_ALT D?
U 1 1 603B00DF
P 6150 4250
AR Path="/603B00DF" Ref="D?"  Part="1" 
AR Path="/64C48268/603B00DF" Ref="D?"  Part="1" 
AR Path="/5FF44A8A/603B00DF" Ref="D?"  Part="1" 
AR Path="/6032CE30/603B00DF" Ref="D27"  Part="1" 
F 0 "D27" H 6143 4086 50  0000 C CNN
F 1 "LED_ALT" H 6143 4086 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 4250 50  0001 C CNN
F 3 "~" H 6150 4250 50  0001 C CNN
	1    6150 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 4250 3850 4250
Text Label 3850 4250 0    50   ~ 0
LED5
Wire Wire Line
	4600 4250 4750 4250
Wire Wire Line
	4750 4350 4750 4250
Connection ~ 4750 4250
Wire Wire Line
	4950 4250 4950 4350
Connection ~ 4950 4250
Wire Wire Line
	4950 4250 5150 4250
Wire Wire Line
	4750 4250 4950 4250
Wire Wire Line
	4850 4600 4950 4600
$Comp
L power:GND #PWR?
U 1 1 603B00EF
P 4850 4600
AR Path="/603B00EF" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/603B00EF" Ref="#PWR?"  Part="1" 
AR Path="/5FF44A8A/603B00EF" Ref="#PWR?"  Part="1" 
AR Path="/6032CE30/603B00EF" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 4850 4350 50  0001 C CNN
F 1 "GND" H 4855 4427 50  0000 C CNN
F 2 "" H 4850 4600 50  0001 C CNN
F 3 "" H 4850 4600 50  0001 C CNN
	1    4850 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 4600 4950 4550
Connection ~ 4850 4600
Wire Wire Line
	4750 4600 4850 4600
Wire Wire Line
	4750 4550 4750 4600
$Comp
L Device:C_Small C?
U 1 1 603B00F9
P 4950 4450
AR Path="/603B00F9" Ref="C?"  Part="1" 
AR Path="/64C48268/603B00F9" Ref="C?"  Part="1" 
AR Path="/5FF44A8A/603B00F9" Ref="C?"  Part="1" 
AR Path="/6032CE30/603B00F9" Ref="C11"  Part="1" 
F 0 "C11" H 5042 4496 50  0000 L CNN
F 1 "1µF" H 5042 4405 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 4450 50  0001 C CNN
F 3 "~" H 4950 4450 50  0001 C CNN
	1    4950 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 603B00FF
P 4750 4450
AR Path="/603B00FF" Ref="R?"  Part="1" 
AR Path="/64C48268/603B00FF" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/603B00FF" Ref="R?"  Part="1" 
AR Path="/6032CE30/603B00FF" Ref="R21"  Part="1" 
F 0 "R21" H 4809 4404 50  0000 L CNN
F 1 "100kΩ" H 4809 4495 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 4450 50  0001 C CNN
F 3 "~" H 4750 4450 50  0001 C CNN
	1    4750 4450
	-1   0    0    1   
$EndComp
$Comp
L alexios:74HC14 U3
U 5 1 603B0105
P 5350 4250
F 0 "U3" H 5425 4517 50  0000 C CNN
F 1 "74HC14" H 5425 4426 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5350 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 5350 4450 50  0001 C CNN
	5    5350 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4250 5750 4250
$Comp
L power:+5V #PWR0122
U 1 1 603B010C
P 6450 4200
F 0 "#PWR0122" H 6450 4050 50  0001 C CNN
F 1 "+5V" H 6465 4373 50  0000 C CNN
F 2 "" H 6450 4200 50  0001 C CNN
F 3 "" H 6450 4200 50  0001 C CNN
	1    6450 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4250 6450 4250
Wire Wire Line
	6450 4250 6450 4200
$Comp
L Device:D_Schottky_ALT D21
U 1 1 603B0115
P 4450 4250
F 0 "D21" H 4450 4034 50  0000 C CNN
F 1 "CUS520" H 4450 4125 50  0000 C CNN
F 2 "alexios:SOD-323" H 4450 4250 50  0001 C CNN
F 3 "~" H 4450 4250 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 4450 4250 50  0001 C CNN "Mouser"
	1    4450 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 603B011B
P 5850 4900
AR Path="/603B011B" Ref="R?"  Part="1" 
AR Path="/64C48268/603B011B" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/603B011B" Ref="R?"  Part="1" 
AR Path="/6032CE30/603B011B" Ref="R28"  Part="1" 
F 0 "R28" V 5950 4900 50  0000 C CNN
F 1 "150Ω" V 6050 4900 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 4900 50  0001 C CNN
F 3 "~" H 5850 4900 50  0001 C CNN
	1    5850 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 4900 6000 4900
$Comp
L Device:LED_ALT D?
U 1 1 603B0122
P 6150 4900
AR Path="/603B0122" Ref="D?"  Part="1" 
AR Path="/64C48268/603B0122" Ref="D?"  Part="1" 
AR Path="/5FF44A8A/603B0122" Ref="D?"  Part="1" 
AR Path="/6032CE30/603B0122" Ref="D28"  Part="1" 
F 0 "D28" H 6143 4736 50  0000 C CNN
F 1 "LED_ALT" H 6143 4736 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 4900 50  0001 C CNN
F 3 "~" H 6150 4900 50  0001 C CNN
	1    6150 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 4900 3850 4900
Text Label 3850 4900 0    50   ~ 0
LED6
Wire Wire Line
	4600 4900 4750 4900
Wire Wire Line
	4750 5000 4750 4900
Connection ~ 4750 4900
Wire Wire Line
	4950 4900 4950 5000
Connection ~ 4950 4900
Wire Wire Line
	4950 4900 5150 4900
Wire Wire Line
	4750 4900 4950 4900
Wire Wire Line
	4850 5250 4950 5250
$Comp
L power:GND #PWR?
U 1 1 603B0132
P 4850 5250
AR Path="/603B0132" Ref="#PWR?"  Part="1" 
AR Path="/64C48268/603B0132" Ref="#PWR?"  Part="1" 
AR Path="/5FF44A8A/603B0132" Ref="#PWR?"  Part="1" 
AR Path="/6032CE30/603B0132" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 4850 5000 50  0001 C CNN
F 1 "GND" H 4855 5077 50  0000 C CNN
F 2 "" H 4850 5250 50  0001 C CNN
F 3 "" H 4850 5250 50  0001 C CNN
	1    4850 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5250 4950 5200
Connection ~ 4850 5250
Wire Wire Line
	4750 5250 4850 5250
Wire Wire Line
	4750 5200 4750 5250
$Comp
L Device:C_Small C?
U 1 1 603B013C
P 4950 5100
AR Path="/603B013C" Ref="C?"  Part="1" 
AR Path="/64C48268/603B013C" Ref="C?"  Part="1" 
AR Path="/5FF44A8A/603B013C" Ref="C?"  Part="1" 
AR Path="/6032CE30/603B013C" Ref="C12"  Part="1" 
F 0 "C12" H 5042 5146 50  0000 L CNN
F 1 "1µF" H 5042 5055 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 5100 50  0001 C CNN
F 3 "~" H 4950 5100 50  0001 C CNN
	1    4950 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 603B0142
P 4750 5100
AR Path="/603B0142" Ref="R?"  Part="1" 
AR Path="/64C48268/603B0142" Ref="R?"  Part="1" 
AR Path="/5FF44A8A/603B0142" Ref="R?"  Part="1" 
AR Path="/6032CE30/603B0142" Ref="R22"  Part="1" 
F 0 "R22" H 4809 5054 50  0000 L CNN
F 1 "100kΩ" H 4809 5145 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 5100 50  0001 C CNN
F 3 "~" H 4750 5100 50  0001 C CNN
	1    4750 5100
	-1   0    0    1   
$EndComp
$Comp
L alexios:74HC14 U3
U 6 1 603B0148
P 5350 4900
F 0 "U3" H 5425 5167 50  0000 C CNN
F 1 "74HC14" H 5425 5076 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5350 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 5350 5100 50  0001 C CNN
	6    5350 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4900 5750 4900
$Comp
L power:+5V #PWR0124
U 1 1 603B014F
P 6450 4850
F 0 "#PWR0124" H 6450 4700 50  0001 C CNN
F 1 "+5V" H 6465 5023 50  0000 C CNN
F 2 "" H 6450 4850 50  0001 C CNN
F 3 "" H 6450 4850 50  0001 C CNN
	1    6450 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4900 6450 4900
Wire Wire Line
	6450 4900 6450 4850
$Comp
L Device:D_Schottky_ALT D22
U 1 1 603B0158
P 4450 4900
F 0 "D22" H 4450 4684 50  0000 C CNN
F 1 "CUS520" H 4450 4775 50  0000 C CNN
F 2 "alexios:SOD-323" H 4450 4900 50  0001 C CNN
F 3 "~" H 4450 4900 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 4450 4900 50  0001 C CNN "Mouser"
	1    4450 4900
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 603BA466
P 5100 6050
AR Path="/601AEAED/603BA466" Ref="C?"  Part="1" 
AR Path="/6032CE30/603BA466" Ref="C13"  Part="1" 
F 0 "C13" H 5192 6096 50  0000 L CNN
F 1 "100nF" H 5192 6005 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5100 6050 50  0001 C CNN
F 3 "~" H 5100 6050 50  0001 C CNN
	1    5100 6050
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 603BA46C
P 5100 6150
AR Path="/601AEAED/603BA46C" Ref="#PWR?"  Part="1" 
AR Path="/6032CE30/603BA46C" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 5100 5900 50  0001 C CNN
F 1 "GND" H 5105 5977 50  0000 C CNN
F 2 "" H 5100 6150 50  0001 C CNN
F 3 "" H 5100 6150 50  0001 C CNN
	1    5100 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 603BA473
P 5100 5950
AR Path="/601AEAED/603BA473" Ref="#PWR?"  Part="1" 
AR Path="/6032CE30/603BA473" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 5100 5800 50  0001 C CNN
F 1 "+5V" H 5115 6123 50  0000 C CNN
F 2 "" H 5100 5950 50  0001 C CNN
F 3 "" H 5100 5950 50  0001 C CNN
	1    5100 5950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC14 U3
U 7 1 603BC305
P 5450 5950
F 0 "U3" H 5525 6217 50  0000 C CNN
F 1 "74HC14" H 5525 6126 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5450 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 5450 6150 50  0001 C CNN
	7    5450 5950
	1    0    0    -1  
$EndComp
Connection ~ 5100 5950
Connection ~ 5100 6150
$Comp
L Connector_Generic:Conn_01x06 J19
U 1 1 603BE7EC
P 2450 1800
F 0 "J19" H 2368 2125 50  0000 C CNN
F 1 "Conn_01x06" H 2368 2126 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 2450 1800 50  0001 C CNN
F 3 "~" H 2450 1800 50  0001 C CNN
	1    2450 1800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2650 1600 2950 1600
Wire Wire Line
	2650 1700 2950 1700
Wire Wire Line
	2650 1800 2950 1800
Wire Wire Line
	2650 1900 2950 1900
Wire Wire Line
	2650 2000 2950 2000
Wire Wire Line
	2650 2100 2950 2100
Text Label 2950 1600 2    50   ~ 0
LED1
Text Label 2950 1700 2    50   ~ 0
LED2
Text Label 2950 1800 2    50   ~ 0
LED3
Text Label 2950 1900 2    50   ~ 0
LED4
Text Label 2950 2000 2    50   ~ 0
LED5
Text Label 2950 2100 2    50   ~ 0
LED6
$EndSCHEMATC
