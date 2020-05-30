EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 8
Title "Data Bus & Wait States"
Date ""
Rev "2022"
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 5D33F674
P 2450 6700
AR Path="/5CC0D65F/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F674" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F674" Ref="C37"  Part="1" 
F 0 "C37" H 2359 6746 50  0000 R CNN
F 1 "100nF" H 2359 6655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 6700 50  0001 C CNN
F 3 "~" H 2450 6700 50  0001 C CNN
	1    2450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F67A
P 2450 6800
AR Path="/5D33F67A" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F67A" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F67A" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F67A" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 2450 6550 50  0001 C CNN
F 1 "GND" H 2455 6627 50  0000 C CNN
F 2 "" H 2450 6800 50  0001 C CNN
F 3 "" H 2450 6800 50  0001 C CNN
	1    2450 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F681
P 2450 6600
AR Path="/5D33F681" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F681" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F681" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F681" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 2450 6450 50  0001 C CNN
F 1 "+5V" H 2465 6773 50  0000 C CNN
F 2 "" H 2450 6600 50  0001 C CNN
F 3 "" H 2450 6600 50  0001 C CNN
	1    2450 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F68E
P 5350 7400
AR Path="/5CC0D65F/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F68E" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F68E" Ref="C41"  Part="1" 
F 0 "C41" H 5259 7446 50  0000 R CNN
F 1 "100nF" H 5259 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 7400 50  0001 C CNN
F 3 "~" H 5350 7400 50  0001 C CNN
	1    5350 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F694
P 5350 7500
AR Path="/5D33F694" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F694" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F694" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F694" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 5350 7250 50  0001 C CNN
F 1 "GND" H 5355 7327 50  0000 C CNN
F 2 "" H 5350 7500 50  0001 C CNN
F 3 "" H 5350 7500 50  0001 C CNN
	1    5350 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F69B
P 5350 7300
AR Path="/5D33F69B" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F69B" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F69B" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F69B" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 5350 7150 50  0001 C CNN
F 1 "+5V" H 5365 7473 50  0000 C CNN
F 2 "" H 5350 7300 50  0001 C CNN
F 3 "" H 5350 7300 50  0001 C CNN
	1    5350 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F777
P 3900 7400
AR Path="/5CC0D65F/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F777" Ref="C40"  Part="1" 
F 0 "C40" H 3809 7446 50  0000 R CNN
F 1 "100nF" H 3809 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 7400 50  0001 C CNN
F 3 "~" H 3900 7400 50  0001 C CNN
	1    3900 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F77D
P 3900 7500
AR Path="/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F77D" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 3900 7250 50  0001 C CNN
F 1 "GND" H 3905 7327 50  0000 C CNN
F 2 "" H 3900 7500 50  0001 C CNN
F 3 "" H 3900 7500 50  0001 C CNN
	1    3900 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F784
P 3900 7300
AR Path="/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F784" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 3900 7150 50  0001 C CNN
F 1 "+5V" H 3915 7473 50  0000 C CNN
F 2 "" H 3900 7300 50  0001 C CNN
F 3 "" H 3900 7300 50  0001 C CNN
	1    3900 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F7B4
P 950 7350
AR Path="/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F7B4" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F7B4" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 950 7200 50  0001 C CNN
F 1 "+5V" H 965 7523 50  0000 C CNN
F 2 "" H 950 7350 50  0001 C CNN
F 3 "" H 950 7350 50  0001 C CNN
	1    950  7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F7BB
P 950 7550
AR Path="/5D33F7BB" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F7BB" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F7BB" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F7BB" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 950 7300 50  0001 C CNN
F 1 "GND" H 955 7377 50  0000 C CNN
F 2 "" H 950 7550 50  0001 C CNN
F 3 "" H 950 7550 50  0001 C CNN
	1    950  7550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F7C1
P 950 7450
AR Path="/5CC0D65F/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F7C1" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F7C1" Ref="C42"  Part="1" 
F 0 "C42" H 859 7496 50  0000 R CNN
F 1 "100nF" H 859 7405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7450 50  0001 C CNN
F 3 "~" H 950 7450 50  0001 C CNN
	1    950  7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F601
P 950 6600
AR Path="/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F601" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F601" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 950 6450 50  0001 C CNN
F 1 "+5V" H 965 6773 50  0000 C CNN
F 2 "" H 950 6600 50  0001 C CNN
F 3 "" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F5FA
P 950 6800
AR Path="/5D33F5FA" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F5FA" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F5FA" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F5FA" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 950 6550 50  0001 C CNN
F 1 "GND" H 955 6627 50  0000 C CNN
F 2 "" H 950 6800 50  0001 C CNN
F 3 "" H 950 6800 50  0001 C CNN
	1    950  6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D33F5E1
P 950 6700
AR Path="/5CC0D65F/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F5E1" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F5E1" Ref="C36"  Part="1" 
F 0 "C36" H 859 6746 50  0000 R CNN
F 1 "100nF" H 859 6655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 6700 50  0001 C CNN
F 3 "~" H 950 6700 50  0001 C CNN
	1    950  6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4281C6
P 2450 7400
AR Path="/5CC0D65F/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4281C6" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D4281C6" Ref="C39"  Part="1" 
F 0 "C39" H 2359 7446 50  0000 R CNN
F 1 "100nF" H 2359 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 7400 50  0001 C CNN
F 3 "~" H 2450 7400 50  0001 C CNN
	1    2450 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5D428DF8
P 2450 7500
F 0 "#PWR0126" H 2450 7250 50  0001 C CNN
F 1 "GND" H 2455 7327 50  0000 C CNN
F 2 "" H 2450 7500 50  0001 C CNN
F 3 "" H 2450 7500 50  0001 C CNN
	1    2450 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0122
U 1 1 5D429670
P 2450 7300
F 0 "#PWR0122" H 2450 7150 50  0001 C CNN
F 1 "+5V" H 2465 7473 50  0000 C CNN
F 2 "" H 2450 7300 50  0001 C CNN
F 3 "" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
Text Notes 7900 1300 0    50   ~ 0
~WEN~\n\n X\n 1\n 1\n 0\n 0
Wire Notes Line width 20 style solid
	7575 675  9100 675 
Wire Notes Line style solid
	7575 850  9100 850 
Wire Notes Line width 20 style solid
	9100 1350 9100 675 
Wire Notes Line width 20 style solid
	7575 1350 7575 675 
Wire Notes Line width 20 style solid
	7575 1350 9100 1350
Wire Notes Line
	8850 675  8850 1350
Text Notes 7650 1300 0    50   ~ 0
~HALT~\n\n 0\n 1\n 1\n 1\n 1
$Comp
L alexios:74LVC1G11 U?
U 2 1 5D1BEF9C
P 1400 7300
AR Path="/5D1BEF9C" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D1BEF9C" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D1BEF9C" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D1BEF9C" Ref="U49"  Part="2" 
F 0 "U49" H 1480 7196 50  0000 L CNN
F 1 "74LVC1G11" H 1480 7105 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 1300 7225 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 1300 7225 50  0001 C CNN
	2    1400 7300
	1    0    0    -1  
$EndComp
Connection ~ 950  7550
Connection ~ 950  7350
$Comp
L alexios:74LVC1G04 U43
U 2 1 5D1C6D66
P 4250 7400
F 0 "U43" H 4430 7446 50  0000 L CNN
F 1 "74LVC1G04" H 4430 7355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4250 7400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 4250 7400 50  0001 C CNN
	2    4250 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G125 U?
U 2 1 5D1C70BE
P 5700 7400
AR Path="/5D1C70BE" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D1C70BE" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D1C70BE" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D1C70BE" Ref="U45"  Part="2" 
F 0 "U45" H 5880 7446 50  0000 L CNN
F 1 "74LVC1G125" H 5880 7355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5850 7650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5850 7650 50  0001 C CNN
	2    5700 7400
	1    0    0    -1  
$EndComp
Connection ~ 3900 7500
Connection ~ 3900 7300
Connection ~ 5350 7500
Connection ~ 5350 7300
$Comp
L Device:C_Small C?
U 1 1 5E214C06
P 5350 6700
AR Path="/5CC0D65F/5E214C06" Ref="C?"  Part="1" 
AR Path="/5E214C06" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/5E214C06" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E214C06" Ref="C35"  Part="1" 
F 0 "C35" H 5259 6746 50  0000 R CNN
F 1 "100nF" H 5259 6655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 6700 50  0001 C CNN
F 3 "~" H 5350 6700 50  0001 C CNN
	1    5350 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5E214C0C
P 5350 6800
F 0 "#PWR0118" H 5350 6550 50  0001 C CNN
F 1 "GND" H 5355 6627 50  0000 C CNN
F 2 "" H 5350 6800 50  0001 C CNN
F 3 "" H 5350 6800 50  0001 C CNN
	1    5350 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5E214C13
P 3900 6800
F 0 "#PWR0121" H 3900 6550 50  0001 C CNN
F 1 "GND" H 3905 6627 50  0000 C CNN
F 2 "" H 3900 6800 50  0001 C CNN
F 3 "" H 3900 6800 50  0001 C CNN
	1    3900 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0117
U 1 1 5E214C1A
P 3900 6600
F 0 "#PWR0117" H 3900 6450 50  0001 C CNN
F 1 "+5V" H 3915 6773 50  0000 C CNN
F 2 "" H 3900 6600 50  0001 C CNN
F 3 "" H 3900 6600 50  0001 C CNN
	1    3900 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 5E214C21
P 5350 6600
F 0 "#PWR0114" H 5350 6450 50  0001 C CNN
F 1 "+5V" H 5365 6773 50  0000 C CNN
F 2 "" H 5350 6600 50  0001 C CNN
F 3 "" H 5350 6600 50  0001 C CNN
	1    5350 6600
	1    0    0    -1  
$EndComp
Text Notes 8450 1300 0    50   ~ 0
~WAITING~\n\n  X\n  X\n  1\n  1\n  1
$Comp
L alexios:74AUC1G74 U?
U 2 1 5E42EF6F
P 2800 6700
AR Path="/5E42EF6F" Ref="U?"  Part="1" 
AR Path="/5D30488D/5E42EF6F" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5E42EF6F" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5E42EF6F" Ref="U47"  Part="2" 
F 0 "U47" H 2980 6746 50  0000 L CNN
F 1 "74LVC1G74" H 2980 6655 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 3250 6700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 3250 6700 50  0001 C CNN
	2    2800 6700
	1    0    0    -1  
$EndComp
Connection ~ 2450 6800
Connection ~ 2450 6600
$Comp
L Device:C_Small C?
U 1 1 5E7D5FA4
P 3900 6700
AR Path="/5CC0D65F/5E7D5FA4" Ref="C?"  Part="1" 
AR Path="/5E7D5FA4" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/5E7D5FA4" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E7D5FA4" Ref="C38"  Part="1" 
F 0 "C38" H 3809 6746 50  0000 R CNN
F 1 "100nF" H 3809 6655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 6700 50  0001 C CNN
F 3 "~" H 3900 6700 50  0001 C CNN
	1    3900 6700
	1    0    0    -1  
$EndComp
Text Notes 5400 3950 0    50   ~ 0
~MEM~\n\n 0\n X\n X\n 1
Wire Notes Line
	6250 3400 6250 4000
Wire Notes Line width 20 style solid
	5325 4000 6700 4000
Wire Notes Line width 20 style solid
	5325 4000 5325 3400
Wire Notes Line width 20 style solid
	6700 4000 6700 3400
Wire Notes Line style solid
	5325 3575 6700 3575
Wire Notes Line width 20 style solid
	5325 3400 6700 3400
Text Notes 6350 3950 0    50   ~ 0
~BUSEN~\n\n  0\n  0\n  0\n  1
Text Notes 5850 3950 0    50   ~ 0
~WAITING~\n\n  X\n  X\n  0\n  1
Text Label 7000 4500 0    50   ~ 0
~BUSEN
Wire Wire Line
	6150 4600 6500 4600
Connection ~ 6150 4600
$Comp
L alexios:74LVC1G11 U?
U 1 1 5D33F61B
P 5600 4550
AR Path="/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D33F61B" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F61B" Ref="U49"  Part="1" 
F 0 "U49" H 5550 4300 50  0000 C CNN
F 1 "74LVC1G11" H 5550 4209 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 5500 4475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 5500 4475 50  0001 C CNN
	1    5600 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4500 5300 4500
Text Label 1750 4600 0    50   ~ 0
~IO
Text Label 5800 4600 0    50   ~ 0
~BUSEN
Text Label 4900 4600 0    50   ~ 0
~IO
Text Label 1750 4700 0    50   ~ 0
~MEM
Text Label 4900 4700 0    50   ~ 0
~MEM
Text Label 8750 4650 1    50   ~ 0
DB[0..15]
Text Label 6850 5050 1    50   ~ 0
IBUS[0..15]
Entry Wire Line
	6850 5100 6950 5000
Entry Wire Line
	6850 5200 6950 5100
Entry Wire Line
	6850 5300 6950 5200
Entry Wire Line
	6850 5400 6950 5300
Entry Wire Line
	6850 5500 6950 5400
Entry Wire Line
	6850 5600 6950 5500
Entry Wire Line
	6850 5700 6950 5600
Entry Wire Line
	6850 5800 6950 5700
Entry Wire Line
	6850 3600 6950 3500
Entry Wire Line
	6850 3700 6950 3600
Entry Wire Line
	6850 3800 6950 3700
Entry Wire Line
	6850 3900 6950 3800
Entry Wire Line
	6850 4000 6950 3900
Entry Wire Line
	6850 4100 6950 4000
Entry Wire Line
	6850 4200 6950 4100
Entry Wire Line
	6850 4300 6950 4200
Text Label 8350 5700 0    50   ~ 0
DB15
Text Label 8350 5600 0    50   ~ 0
DB14
Text Label 8350 5500 0    50   ~ 0
DB13
Text Label 8350 5400 0    50   ~ 0
DB12
Text Label 8350 5300 0    50   ~ 0
DB11
Text Label 8350 5200 0    50   ~ 0
DB10
Text Label 8350 5100 0    50   ~ 0
DB9
Text Label 8350 5000 0    50   ~ 0
DB8
Text Label 8350 4200 0    50   ~ 0
DB7
Text Label 8350 4100 0    50   ~ 0
DB6
Text Label 8350 4000 0    50   ~ 0
DB5
Text Label 8350 3900 0    50   ~ 0
DB4
Text Label 8350 3800 0    50   ~ 0
DB3
Text Label 8350 3700 0    50   ~ 0
DB2
Text Label 8350 3600 0    50   ~ 0
DB1
Text Label 8350 3500 0    50   ~ 0
DB0
Wire Wire Line
	8300 5700 8650 5700
Wire Wire Line
	8300 5600 8650 5600
Wire Wire Line
	8300 5500 8650 5500
Wire Wire Line
	8300 5400 8650 5400
Wire Wire Line
	8300 5300 8650 5300
Wire Wire Line
	8300 5200 8650 5200
Wire Wire Line
	8300 5100 8650 5100
Wire Wire Line
	8300 5000 8650 5000
Wire Wire Line
	8300 4200 8650 4200
Wire Wire Line
	8300 4100 8650 4100
Wire Wire Line
	8300 4000 8650 4000
Wire Wire Line
	8300 3900 8650 3900
Wire Wire Line
	8300 3800 8650 3800
Wire Wire Line
	8300 3700 8650 3700
Wire Wire Line
	8300 3600 8650 3600
Wire Wire Line
	8300 3500 8650 3500
Text Label 7050 5700 0    50   ~ 0
IBUS15
Text Label 7050 5600 0    50   ~ 0
IBUS14
Text Label 7050 5500 0    50   ~ 0
IBUS13
Text Label 7050 5400 0    50   ~ 0
IBUS12
Text Label 7050 5300 0    50   ~ 0
IBUS11
Text Label 7050 5200 0    50   ~ 0
IBUS10
Text Label 7050 5100 0    50   ~ 0
IBUS9
Text Label 7050 5000 0    50   ~ 0
IBUS8
Text Label 7000 4200 0    50   ~ 0
IBUS7
Text Label 7000 4100 0    50   ~ 0
IBUS6
Text Label 7000 4000 0    50   ~ 0
IBUS5
Text Label 7000 3900 0    50   ~ 0
IBUS4
Text Label 7000 3800 0    50   ~ 0
IBUS3
Text Label 7000 3700 0    50   ~ 0
IBUS2
Text Label 7000 3600 0    50   ~ 0
IBUS1
Text Label 7000 3500 0    50   ~ 0
IBUS0
Wire Wire Line
	7300 5700 6950 5700
Wire Wire Line
	7300 5600 6950 5600
Wire Wire Line
	7300 5500 6950 5500
Wire Wire Line
	7300 5400 6950 5400
Wire Wire Line
	7300 5300 6950 5300
Wire Wire Line
	7300 5200 6950 5200
Wire Wire Line
	7300 5100 6950 5100
Wire Wire Line
	7300 5000 6950 5000
Wire Wire Line
	7300 4200 6950 4200
Wire Wire Line
	7300 4100 6950 4100
Wire Wire Line
	7300 4000 6950 4000
Wire Wire Line
	7300 3900 6950 3900
Wire Wire Line
	7300 3800 6950 3800
Wire Wire Line
	7300 3700 6950 3700
Wire Wire Line
	7300 3600 6950 3600
Wire Wire Line
	7300 3500 6950 3500
Wire Bus Line
	6750 6150 1650 6150
Wire Bus Line
	8850 3150 9550 3150
Entry Bus Bus
	8750 3250 8850 3150
Text Label 9100 3150 0    50   ~ 0
DB[0..15]
Text HLabel 9550 3150 2    50   3State ~ 0
DB[0..15]
Entry Bus Bus
	6750 6150 6850 6050
Text Label 1750 6150 0    50   ~ 0
IBUS[0..15]
Text HLabel 1650 6150 0    50   3State ~ 0
IBUS[0..15]
Wire Wire Line
	6650 4400 6650 5900
Wire Wire Line
	6650 5900 7300 5900
Connection ~ 6650 4400
Wire Wire Line
	6650 4400 7300 4400
Text Label 7000 4400 0    50   ~ 0
~R
Text Label 7000 5900 0    50   ~ 0
~R
Text Label 6050 4400 0    50   ~ 0
~R
Wire Wire Line
	6500 4500 6500 4600
Wire Wire Line
	6500 6000 7300 6000
Wire Wire Line
	6500 4500 7300 4500
Text Label 6650 5050 1    50   ~ 0
~R
Text Label 6500 5050 1    50   ~ 0
~BUSEN
Text Label 7000 6000 0    50   ~ 0
~BUSEN
Entry Wire Line
	8750 3400 8650 3500
Entry Wire Line
	8750 3500 8650 3600
Entry Wire Line
	8750 3600 8650 3700
Entry Wire Line
	8750 3700 8650 3800
Entry Wire Line
	8750 3800 8650 3900
Entry Wire Line
	8750 3900 8650 4000
Entry Wire Line
	8750 4000 8650 4100
Entry Wire Line
	8750 4100 8650 4200
Entry Wire Line
	8750 4900 8650 5000
Entry Wire Line
	8750 5000 8650 5100
Entry Wire Line
	8750 5100 8650 5200
Entry Wire Line
	8750 5200 8650 5300
Entry Wire Line
	8750 5300 8650 5400
Entry Wire Line
	8750 5400 8650 5500
Entry Wire Line
	8750 5500 8650 5600
Entry Wire Line
	8750 5600 8650 5700
Wire Wire Line
	5800 4600 6150 4600
Text Notes 7000 6500 0    100  ~ 20
Data Bus Transceiver
$Comp
L Connector:TestPoint TP?
U 1 1 5E2D2825
P 6150 4600
AR Path="/5F67D4B5/5E2D2825" Ref="TP?"  Part="1" 
AR Path="/5E2D2825" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5E2D2825" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5E2D2825" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5E2D2825" Ref="TP5"  Part="1" 
F 0 "TP5" H 6250 4850 50  0000 R CNN
F 1 "TestPoint" H 6208 4627 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6350 4600 50  0001 C CNN
F 3 "~" H 6350 4600 50  0001 C CNN
	1    6150 4600
	-1   0    0    1   
$EndComp
Connection ~ 6500 4600
Wire Wire Line
	6500 4600 6500 6000
$Comp
L power:GND #PWR?
U 1 1 5D33F613
P 3750 3700
AR Path="/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F613" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F613" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 3750 3450 50  0001 C CNN
F 1 "GND" H 3755 3527 50  0000 C CNN
F 2 "" H 3750 3700 50  0001 C CNN
F 3 "" H 3750 3700 50  0001 C CNN
	1    3750 3700
	1    0    0    -1  
$EndComp
Text Notes 5350 4300 0    50   ~ 0
Keep the data bus enabled\nwhile waiting.
$Comp
L Connector:TestPoint TP?
U 1 1 5D33F721
P 3750 3000
AR Path="/5F67D4B5/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D33F721" Ref="TP?"  Part="1" 
AR Path="/5D46B22D/5D33F721" Ref="TP3"  Part="1" 
F 0 "TP3" V 3647 3072 50  0000 C CNN
F 1 "TestPoint" H 3808 3027 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 3950 3000 50  0001 C CNN
F 3 "~" H 3950 3000 50  0001 C CNN
	1    3750 3000
	0    1    1    0   
$EndComp
Text HLabel 1650 3600 0    50   Input ~ 0
~RSTHOLD
Wire Wire Line
	4750 3600 5150 3600
Wire Wire Line
	3850 3400 3750 3400
Text Label 1750 3600 0    50   ~ 0
~RSTHOLD
$Comp
L alexios:74AUC1G74 U?
U 1 1 5D33F5D3
P 4300 3450
AR Path="/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D33F5D3" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5D33F5D3" Ref="U47"  Part="1" 
F 0 "U47" H 4300 3867 50  0000 C CNN
F 1 "74LVC1G74" H 4300 3776 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 4750 3450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 4750 3450 50  0001 C CNN
	1    4300 3450
	1    0    0    -1  
$EndComp
Text Notes 8150 1300 0    50   ~ 0
~WSTB~\n\n  X\n  X\n  X\n  1\n  0
Text Label 1750 4400 0    50   ~ 0
~R
Text HLabel 1650 4400 0    50   Input ~ 0
~R
Text HLabel 1650 4700 0    50   Input ~ 0
~MEM
Text HLabel 1650 4600 0    50   Input ~ 0
~IO
Wire Notes Line width 20 style solid
	1150 6000 5850 6000
Wire Notes Line width 20 style solid
	1150 6000 1150 5000
Wire Notes Line width 20 style solid
	5850 6000 5850 5000
Wire Notes Line width 20 style solid
	1150 5000 5850 5000
Text Notes 3950 2950 0    100  ~ 20
Wait State
Text Label 4900 4400 0    50   ~ 0
~R
$Comp
L Device:R_Small R?
U 1 1 5EEA0A36
P 7700 3000
AR Path="/5EEA0A36" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5EEA0A36" Ref="R?"  Part="1" 
AR Path="/5D54E677/5EEA0A36" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5EEA0A36" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5EEA0A36" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5EEA0A36" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5EEA0A36" Ref="R12"  Part="1" 
F 0 "R12" V 7504 3000 50  0000 C CNN
F 1 "0Ω" V 7595 3000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 3000 50  0001 C CNN
F 3 "~" H 7700 3000 50  0001 C CNN
	1    7700 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 3000 9550 3000
Wire Wire Line
	7600 3000 7450 3000
Text HLabel 9550 3000 2    50   Output ~ 0
~WAITING
Wire Notes Line
	8750 3100 7500 3100
NoConn ~ 4750 3300
Wire Wire Line
	5150 3250 7450 3250
Wire Wire Line
	7450 3250 7450 3000
Wire Wire Line
	5150 3250 5150 3600
Text Notes 7300 6300 0    50   ~ 10
NOTE: HCT or ACT family!
$Comp
L alexios:74ACT245 U48
U 1 1 5F15FE07
P 7800 4000
F 0 "U48" H 7800 4767 50  0000 C CNN
F 1 "74ACT245" H 7800 4676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7800 4050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act245.pdf" H 7800 4050 50  0001 C CNN
	1    7800 4000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74ACT245 U50
U 1 1 5F1617BB
P 7800 5500
F 0 "U50" H 7800 6267 50  0000 C CNN
F 1 "74ACT245" H 7800 6176 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7800 5550 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act245.pdf" H 7800 5550 50  0001 C CNN
	1    7800 5500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74ACT245 U48
U 2 1 5F16217F
P 5700 7100
F 0 "U48" H 5880 7546 50  0000 L CNN
F 1 "74ACT245" H 5880 7455 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5700 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 5700 7150 50  0001 C CNN
	2    5700 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74ACT245 U50
U 2 1 5F162E45
P 4250 7100
F 0 "U50" H 4430 7546 50  0000 L CNN
F 1 "74ACT245" H 4430 7455 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4250 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 4250 7150 50  0001 C CNN
	2    4250 7100
	1    0    0    -1  
$EndComp
Connection ~ 5350 6800
Connection ~ 5350 6600
Connection ~ 3900 6800
Connection ~ 3900 6600
Text Notes 7900 2650 0    50   ~ 0
Optional impedance\nmatching resistors.
Text Label 6400 2450 0    50   ~ 0
~W₀
Text Notes 5450 2100 0    50   ~ 0
Pull-up  used to slow\ndown negative edge.\nMay be optional,\ntest first!
$Comp
L power:+5V #PWR?
U 1 1 5E3DAB69
P 5050 1900
AR Path="/5F67D4B5/5E3DAB69" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E3DAB69" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 5050 1750 50  0001 C CNN
F 1 "+5V" H 5138 1937 50  0000 L CNN
F 2 "" H 5050 1900 50  0001 C CNN
F 3 "" H 5050 1900 50  0001 C CNN
	1    5050 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E3D8531
P 5050 2050
AR Path="/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5D54E677/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5E3D8531" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5E3D8531" Ref="R13"  Part="1" 
F 0 "R13" H 4991 2004 50  0000 R CNN
F 1 "4.7kΩ" H 4991 2095 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5050 2050 50  0001 C CNN
F 3 "~" H 5050 2050 50  0001 C CNN
	1    5050 2050
	-1   0    0    1   
$EndComp
Text Notes 7150 2250 0    50   ~ 0
Tristate ~W~ on ~HALT~.
Text Label 1750 1500 0    50   ~ 0
~HALT
$Comp
L alexios:74LVC1G04 U43
U 1 1 5D6F45CB
P 6450 1500
F 0 "U43" H 6400 1767 50  0000 C CNN
F 1 "74LVC1G04" H 6400 1676 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6450 1500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 6450 1500 50  0001 C CNN
	1    6450 1500
	1    0    0    -1  
$EndComp
Text HLabel 9550 2450 2    50   3State ~ 0
~W
Text Label 9450 2450 2    50   ~ 0
~W
$Comp
L alexios:74AHC1G125 U?
U 1 1 5D6CFDA6
P 7000 2450
AR Path="/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D6CFDA6" Ref="U45"  Part="1" 
F 0 "U45" H 7050 2276 50  0000 C CNN
F 1 "74LVC1G125" H 7050 2185 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7150 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 7150 2700 50  0001 C CNN
	1    7000 2450
	1    0    0    -1  
$EndComp
Text HLabel 1650 1500 0    50   Input ~ 0
~HALT
$Comp
L Device:R_Small R?
U 1 1 600CB36E
P 7700 2450
AR Path="/600CB36E" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/600CB36E" Ref="R?"  Part="1" 
AR Path="/5D54E677/600CB36E" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/600CB36E" Ref="R?"  Part="1" 
AR Path="/5DEAC282/600CB36E" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/600CB36E" Ref="R?"  Part="1" 
AR Path="/5D46B22D/600CB36E" Ref="R8"  Part="1" 
F 0 "R8" V 7800 2450 50  0000 C CNN
F 1 "0Ω" V 7900 2450 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 2450 50  0001 C CNN
F 3 "~" H 7700 2450 50  0001 C CNN
	1    7700 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 2450 7600 2450
Wire Wire Line
	7800 2450 9550 2450
Wire Notes Line
	7500 2350 8750 2350
Wire Notes Line
	7500 3100 7500 2350
Wire Notes Line
	8750 2350 8750 3100
$Comp
L alexios:74AUC1G74 U?
U 1 1 5F1AA80C
P 4350 2300
AR Path="/5F1AA80C" Ref="U?"  Part="1" 
AR Path="/5D30488D/5F1AA80C" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5F1AA80C" Ref="U?"  Part="1" 
AR Path="/5D46B22D/5F1AA80C" Ref="U42"  Part="1" 
F 0 "U42" H 4350 2717 50  0000 C CNN
F 1 "74LVC1G74" H 4350 2626 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 4800 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 4800 2300 50  0001 C CNN
	1    4350 2300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U34
U 1 1 5F1AB8BB
P 3500 2150
F 0 "U34" H 3550 2417 50  0000 C CNN
F 1 "74LVC1G32" H 3550 2326 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3610 2130 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3610 2130 50  0001 C CNN
	1    3500 2150
	1    0    0    -1  
$EndComp
Text Label 1750 2450 0    50   ~ 0
CLK2
NoConn ~ 4800 2150
Text Label 5650 2450 2    50   ~ 0
~WSTB
$Comp
L alexios:74LVC1G0832 U44
U 1 1 5F2CE1F0
P 6000 2450
F 0 "U44" H 6000 2650 50  0000 C CNN
F 1 "74LVC1G0832" H 6000 2750 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 6000 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 6000 2450 50  0001 C CNN
	1    6000 2450
	1    0    0    1   
$EndComp
Wire Wire Line
	4800 2450 5650 2450
Wire Wire Line
	5650 2550 5150 2550
Wire Wire Line
	2000 1600 2500 1600
Wire Wire Line
	4900 1600 4900 2350
Text Label 5650 2350 2    50   ~ 0
~WEN-DELAYED
Wire Wire Line
	5050 1900 5050 1950
Wire Wire Line
	5050 2150 5050 2350
Wire Notes Line
	4950 1700 6450 1700
Wire Notes Line
	6450 1700 6450 2200
Wire Notes Line
	6450 2200 4950 2200
Wire Notes Line
	4950 2200 4950 1700
Text HLabel 1650 2450 0    50   Input ~ 0
CLK2
Wire Wire Line
	1650 1500 5850 1500
Wire Wire Line
	5150 3250 5150 2550
Connection ~ 5150 3250
Text Notes 8950 1300 0    50   ~ 0
~W~\n\nZ\n0\n1\n1\n0
$Comp
L Device:R_Small R?
U 1 1 5F81417E
P 2600 2200
AR Path="/5F81417E" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F81417E" Ref="R?"  Part="1" 
AR Path="/5D54E677/5F81417E" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5F81417E" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F81417E" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5F81417E" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5F81417E" Ref="R10"  Part="1" 
F 0 "R10" V 2796 2200 50  0000 C CNN
F 1 "0Ω" V 2705 2200 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2600 2200 50  0001 C CNN
F 3 "~" H 2600 2200 50  0001 C CNN
	1    2600 2200
	0    -1   -1   0   
$EndComp
Text Label 1750 3500 0    50   ~ 0
CLK3
Text HLabel 1650 3500 0    50   Input ~ 0
CLK3
Text Notes 9250 3950 0    50   ~ 0
CLK2
Text Notes 9250 4400 0    50   ~ 0
~WSTB
Wire Notes Line width 12 style solid
	9600 3850 9650 3850
Wire Notes Line width 12 style solid
	9650 3850 9650 3950
Wire Notes Line width 12 style solid
	9750 3850 10050 3850
Wire Notes Line width 12 style solid
	9750 3950 9750 3850
Wire Notes Line width 12 style solid
	9650 3950 9750 3950
Wire Notes Line width 12 style solid
	10150 3950 10150 3850
Wire Notes Line width 12 style solid
	10050 3950 10150 3950
Wire Notes Line width 12 style solid
	10050 3950 10050 3850
Wire Notes Line width 12 style solid
	9600 4300 9850 4300
Wire Notes Line width 12 style solid
	9850 4300 9870 4400
Wire Notes Line width 12 style solid
	10050 4400 10070 4300
Wire Notes Line width 12 style solid
	9870 4400 10050 4400
Wire Notes Line width 20 style solid
	9150 3750 10900 3750
Wire Notes Line width 20 style solid
	9150 4650 9150 3750
Wire Notes Line width 20 style solid
	10900 4650 9150 4650
Wire Notes Line width 20 style solid
	10900 3750 10900 4650
Wire Notes Line width 12 style solid
	10150 3850 10450 3850
Wire Notes Line width 12 style solid
	10550 3950 10550 3850
Wire Notes Line width 12 style solid
	10450 3950 10550 3950
Wire Notes Line width 12 style solid
	10450 3950 10450 3850
Wire Notes Line width 12 style solid
	10550 3850 10800 3850
Wire Notes Line width 20 style solid
	9150 5050 10900 5050
Wire Notes Line width 20 style solid
	9150 6450 9150 5050
Wire Notes Line width 20 style solid
	10900 6450 9150 6450
Text Notes 9250 4550 0    50   ~ 0
~W\n
Text Notes 9250 4250 0    50   ~ 0
~WEN
Wire Notes Line width 12 style solid
	9600 4150 9800 4150
Wire Notes Line width 12 style solid
	9800 4150 9820 4250
Wire Notes Line width 12 style solid
	9750 4150 9770 4250
Wire Notes Line width 12 style solid
	10170 4150 10150 4250
Wire Notes Line width 12 style solid
	10220 4150 10200 4250
Wire Notes Line width 12 style solid
	9770 4250 10200 4250
Wire Notes Line width 12 style solid
	10170 4150 10800 4150
Text Notes 9200 3650 0    100  ~ 20
Write; No Wait State
Text Notes 9200 4950 0    100  ~ 20
Write; One Wait State
Text Notes 9250 4100 0    50   ~ 0
CLK4
Wire Notes Line width 12 style solid
	9600 4000 9850 4000
Wire Notes Line width 12 style solid
	9850 4000 9850 4100
Wire Notes Line width 12 style solid
	9950 4000 10250 4000
Wire Notes Line width 12 style solid
	9950 4100 9950 4000
Wire Notes Line width 12 style solid
	9850 4100 9950 4100
Wire Notes Line width 12 style solid
	10350 4100 10350 4000
Wire Notes Line width 12 style solid
	10250 4100 10350 4100
Wire Notes Line width 12 style solid
	10250 4100 10250 4000
Wire Notes Line width 12 style solid
	10350 4000 10650 4000
Wire Notes Line width 12 style solid
	10750 4100 10750 4000
Wire Notes Line width 12 style solid
	10650 4100 10750 4100
Wire Notes Line width 12 style solid
	10650 4100 10650 4000
Wire Notes Line width 12 style solid
	10750 4000 10800 4000
Wire Notes Line width 12 style solid
	10070 4300 10800 4300
Wire Notes Line width 12 style solid
	9600 4450 9850 4450
Wire Notes Line width 12 style solid
	9850 4450 9870 4550
Wire Notes Line width 12 style solid
	10050 4550 10070 4450
Wire Notes Line width 12 style solid
	9870 4550 10050 4550
Wire Notes Line width 12 style solid
	10070 4450 10800 4450
Text Notes 9250 5400 0    50   ~ 0
CLK2
Text Notes 9250 5850 0    50   ~ 0
~WSTB
Wire Notes Line width 12 style solid
	9600 5300 9650 5300
Wire Notes Line width 12 style solid
	9650 5300 9650 5400
Wire Notes Line width 12 style solid
	9750 5300 10050 5300
Wire Notes Line width 12 style solid
	9750 5400 9750 5300
Wire Notes Line width 12 style solid
	9650 5400 9750 5400
Wire Notes Line width 12 style solid
	10150 5400 10150 5300
Wire Notes Line width 12 style solid
	10050 5400 10150 5400
Wire Notes Line width 12 style solid
	10050 5400 10050 5300
Wire Notes Line width 12 style solid
	9600 5750 9850 5750
Wire Notes Line width 12 style solid
	9850 5750 9870 5850
Wire Notes Line width 12 style solid
	10050 5850 10070 5750
Wire Notes Line width 12 style solid
	9870 5850 10050 5850
Wire Notes Line width 12 style solid
	10150 5300 10450 5300
Wire Notes Line width 12 style solid
	10550 5400 10550 5300
Wire Notes Line width 12 style solid
	10450 5400 10550 5400
Wire Notes Line width 12 style solid
	10450 5400 10450 5300
Wire Notes Line width 12 style solid
	10550 5300 10800 5300
Text Notes 9250 6300 0    50   ~ 0
~W\n
Text Notes 9250 5700 0    50   ~ 0
~WEN
Wire Notes Line width 12 style solid
	9600 5600 9800 5600
Wire Notes Line width 12 style solid
	9800 5600 9820 5700
Wire Notes Line width 12 style solid
	9750 5600 9770 5700
Wire Notes Line width 12 style solid
	10170 5600 10150 5700
Wire Notes Line width 12 style solid
	10220 5600 10200 5700
Wire Notes Line width 12 style solid
	9770 5700 10200 5700
Wire Notes Line width 12 style solid
	10170 5600 10800 5600
Text Notes 9250 5550 0    50   ~ 0
CLK4
Wire Notes Line width 12 style solid
	9600 5450 9850 5450
Wire Notes Line width 12 style solid
	9850 5450 9850 5550
Wire Notes Line width 12 style solid
	9950 5450 10250 5450
Wire Notes Line width 12 style solid
	9950 5550 9950 5450
Wire Notes Line width 12 style solid
	9850 5550 9950 5550
Wire Notes Line width 12 style solid
	10350 5550 10350 5450
Wire Notes Line width 12 style solid
	10250 5550 10350 5550
Wire Notes Line width 12 style solid
	10250 5550 10250 5450
Wire Notes Line width 12 style solid
	10350 5450 10650 5450
Wire Notes Line width 12 style solid
	10750 5550 10750 5450
Wire Notes Line width 12 style solid
	10650 5550 10750 5550
Wire Notes Line width 12 style solid
	10650 5550 10650 5450
Wire Notes Line width 12 style solid
	10750 5450 10800 5450
Wire Notes Line width 12 style solid
	10070 5750 10800 5750
Wire Notes Line width 12 style solid
	9600 6200 9850 6200
Wire Notes Line width 12 style solid
	9850 6200 9870 6300
Wire Notes Line width 12 style solid
	10450 6300 10470 6200
Wire Notes Line width 12 style solid
	9870 6300 10450 6300
Wire Notes Line width 12 style solid
	10470 6200 10800 6200
Text Notes 9250 6150 0    50   ~ 0
~WAITING
Wire Notes Line width 12 style solid
	9600 6050 10050 6050
Text Notes 9250 5250 0    50   ~ 0
CLK1
Wire Notes Line width 12 style solid
	9650 5150 9950 5150
Wire Notes Line width 12 style solid
	10050 5250 10050 5150
Wire Notes Line width 12 style solid
	9950 5250 10050 5250
Wire Notes Line width 12 style solid
	9950 5250 9950 5150
Wire Notes Line width 12 style solid
	10050 5150 10350 5150
Wire Notes Line width 12 style solid
	10450 5250 10450 5150
Wire Notes Line width 12 style solid
	10350 5250 10450 5250
Wire Notes Line width 12 style solid
	10350 5250 10350 5150
Wire Notes Line width 12 style solid
	10450 5150 10800 5150
Wire Notes Line width 12 style solid
	9650 5250 9650 5150
Wire Notes Line width 12 style solid
	9600 5250 9650 5250
Text Notes 9250 6000 0    50   ~ 0
~WS\n
Wire Notes Line width 12 style solid
	9600 5900 9700 5900
Wire Notes Line width 12 style solid
	9700 5900 9720 6000
Wire Notes Line width 12 style solid
	10070 5900 10800 5900
Wire Notes Line width 12 style solid
	9650 5900 9670 6000
Wire Notes Line width 12 style solid
	10100 6000 10120 5900
Wire Notes Line width 12 style solid
	10050 6000 10070 5900
Wire Notes Line width 12 style solid
	9670 6000 10300 6000
Wire Notes Line width 12 style solid
	10200 6000 10220 5900
Wire Notes Line width 12 style solid
	10150 6000 10170 5900
Wire Notes Line width 12 style solid
	10300 6000 10320 5900
Wire Notes Line width 12 style solid
	10250 6000 10270 5900
Wire Notes Line width 12 style solid
	10050 6050 10070 6150
Wire Notes Line width 12 style solid
	10450 6150 10470 6050
Wire Notes Line width 12 style solid
	10470 6050 10800 6050
Wire Notes Line width 12 style solid
	10070 6150 10450 6150
Wire Notes Line width 20 style solid
	10900 6450 10900 5050
Wire Notes Line
	10470 6060 10470 6050
Wire Notes Line rgb(55, 161, 121)
	10450 5410 10450 6310
Wire Notes Line rgb(55, 161, 121)
	10350 5250 10350 5900
Wire Notes Line rgb(55, 161, 121)
	9850 5550 9850 6190
Wire Notes Line rgb(55, 161, 121)
	10050 5400 10050 5850
Wire Notes Line rgb(55, 161, 121)
	10050 3950 10050 4550
Wire Notes Line rgb(55, 161, 121)
	9850 4100 9850 4460
Connection ~ 5150 3600
Wire Wire Line
	5150 3600 5150 4500
Wire Wire Line
	1650 4700 5300 4700
Wire Wire Line
	1650 4600 5300 4600
Wire Wire Line
	1650 4400 6650 4400
Text Notes 1250 6200 0    50   ~ 0
Wait States must be asserted:\n\n    • As early as possible during T3 or T4.\n    • At the latest one flip-flop setup time before CLK3 goes high.\n    • Remain low at least one hold time after CLK3 goes high.\n\nExecution of the current microinstruction will then be protracted by a whole number of processor cycles, ending on\nthe cycle where ~WS~ was not asserted on the rising edge of CLK3. To generate wait states for slow devices,\nassert ~WS~ asynchronously when the device is addressed, and clear it synchronously when CLK4 go high *after* the\ndevice has finished its work. For a single wait state, ~WS~ may be cleared as soon as ~WAITING~ goes low.\n\n\n\n\n
Text Notes 5650 3950 0    50   ~ 0
~IO~\n\nX\n0\nX\n1
$Comp
L alexios:74LVC1G32 U46
U 2 1 5FCBE129
P 2850 7150
F 0 "U46" H 2980 6946 50  0000 L CNN
F 1 "74LVC1G32" H 2980 6855 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2960 7130 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2960 7130 50  0001 C CNN
	2    2850 7150
	1    0    0    -1  
$EndComp
Connection ~ 2450 7500
Connection ~ 2450 7300
$Comp
L Device:C_Small C?
U 1 1 5FCECB5F
P 9350 1950
AR Path="/5CC0D65F/5FCECB5F" Ref="C?"  Part="1" 
AR Path="/5FCECB5F" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/5FCECB5F" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5FCECB5F" Ref="C54"  Part="1" 
F 0 "C54" H 9259 1996 50  0000 R CNN
F 1 "100nF" H 9259 1905 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 1950 50  0001 C CNN
F 3 "~" H 9350 1950 50  0001 C CNN
	1    9350 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 5FCECB65
P 9350 2050
F 0 "#PWR0153" H 9350 1800 50  0001 C CNN
F 1 "GND" H 9355 1877 50  0000 C CNN
F 2 "" H 9350 2050 50  0001 C CNN
F 3 "" H 9350 2050 50  0001 C CNN
	1    9350 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0154
U 1 1 5FCECB6B
P 9350 1850
F 0 "#PWR0154" H 9350 1700 50  0001 C CNN
F 1 "+5V" H 9200 1950 50  0000 C CNN
F 2 "" H 9350 1850 50  0001 C CNN
F 3 "" H 9350 1850 50  0001 C CNN
	1    9350 1850
	1    0    0    -1  
$EndComp
Text Label 2250 2200 0    50   ~ 0
~WEN
Wire Wire Line
	2700 2200 2750 2200
Wire Wire Line
	3800 2150 3900 2150
Wire Wire Line
	3900 2350 3850 2350
Wire Wire Line
	3850 2350 3850 2250
Wire Wire Line
	3900 2250 3850 2250
Connection ~ 3850 2250
Wire Wire Line
	3850 2250 3850 2100
$Comp
L power:+5V #PWR014
U 1 1 5FF11444
P 3850 2100
F 0 "#PWR014" H 3850 1950 50  0001 C CNN
F 1 "+5V" H 3865 2273 50  0000 C CNN
F 2 "" H 3850 2100 50  0001 C CNN
F 3 "" H 3850 2100 50  0001 C CNN
	1    3850 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2100 3250 2100
Wire Wire Line
	3250 2100 3250 1600
Connection ~ 3250 1600
Wire Wire Line
	3250 2200 3300 2200
Wire Wire Line
	1650 1900 2000 1900
Text HLabel 1650 1900 0    50   Input ~ 0
~WEN
Wire Wire Line
	2000 2200 2500 2200
Connection ~ 2000 1900
Wire Wire Line
	2000 1900 2000 1600
Wire Wire Line
	2000 1900 2000 2200
$Comp
L alexios:74LVC1G32 U46
U 1 1 5FC020D2
P 2400 3300
F 0 "U46" H 2450 3567 50  0000 C CNN
F 1 "74LVC1G32" H 2450 3476 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2510 3280 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2510 3280 50  0001 C CNN
	1    2400 3300
	1    0    0    -1  
$EndComp
Text Label 3450 3300 2    50   ~ 0
~WS-in-T34
Wire Wire Line
	2700 3300 3550 3300
Text Label 1800 3350 0    50   ~ 0
~T34
Text HLabel 1700 3350 0    50   Input ~ 0
~T34
Wire Wire Line
	1700 3350 2200 3350
Wire Wire Line
	2000 3250 2150 3250
Connection ~ 2000 3250
Text Label 1800 3250 0    50   ~ 0
~WS
Text HLabel 1700 3250 0    50   Input ~ 0
~WS
$Comp
L Device:R_Small R?
U 1 1 5D2DC64D
P 2000 3000
AR Path="/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5D2DC64D" Ref="R14"  Part="1" 
F 0 "R14" H 1942 3046 50  0000 R CNN
F 1 "4.7kΩ" H 1942 2955 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2000 3000 50  0001 C CNN
F 3 "~" H 2000 3000 50  0001 C CNN
	1    2000 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D2DC653
P 2000 2900
AR Path="/5F67D4B5/5D2DC653" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D2DC653" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 2000 2750 50  0001 C CNN
F 1 "+5V" H 2015 3073 50  0000 C CNN
F 2 "" H 2000 2900 50  0001 C CNN
F 3 "" H 2000 2900 50  0001 C CNN
	1    2000 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3250 2000 3250
Wire Wire Line
	2000 3100 2000 3250
Wire Wire Line
	2150 3250 2150 2700
Wire Wire Line
	2150 2700 3550 2700
Connection ~ 2150 3250
Wire Wire Line
	2150 3250 2200 3250
Wire Wire Line
	3550 2700 3550 2750
Wire Wire Line
	3750 3000 3750 3300
Wire Wire Line
	3550 3250 3550 3300
Wire Notes Line
	2950 3450 2100 3450
Text Notes 2250 2950 0    50   ~ 0
Optional
Wire Notes Line
	2100 3450 2100 2850
Wire Notes Line
	2950 2850 2950 3450
Wire Notes Line
	2100 2850 2950 2850
$Comp
L Device:R_Small R?
U 1 1 6003673C
P 3100 3500
AR Path="/6003673C" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/6003673C" Ref="R?"  Part="1" 
AR Path="/5D54E677/6003673C" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/6003673C" Ref="R?"  Part="1" 
AR Path="/5DEAC282/6003673C" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/6003673C" Ref="R?"  Part="1" 
AR Path="/5D46B22D/6003673C" Ref="R21"  Part="1" 
F 0 "R21" V 3200 3500 50  0000 C CNN
F 1 "0Ω" V 3150 3350 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3100 3500 50  0001 C CNN
F 3 "~" H 3100 3500 50  0001 C CNN
	1    3100 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 3500 3000 3500
Wire Wire Line
	3200 3500 3850 3500
$Comp
L Device:R_Small R?
U 1 1 60051220
P 2900 3600
AR Path="/60051220" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/60051220" Ref="R?"  Part="1" 
AR Path="/5D54E677/60051220" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/60051220" Ref="R?"  Part="1" 
AR Path="/5DEAC282/60051220" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/60051220" Ref="R?"  Part="1" 
AR Path="/5D46B22D/60051220" Ref="R22"  Part="1" 
F 0 "R22" V 2796 3600 50  0000 C CNN
F 1 "0Ω" V 2705 3600 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2900 3600 50  0001 C CNN
F 3 "~" H 2900 3600 50  0001 C CNN
	1    2900 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 3600 2800 3600
Wire Wire Line
	3000 3600 3850 3600
$Comp
L Device:R_Small R?
U 1 1 600632BF
P 3750 2450
AR Path="/600632BF" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/600632BF" Ref="R?"  Part="1" 
AR Path="/5D54E677/600632BF" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/600632BF" Ref="R?"  Part="1" 
AR Path="/5DEAC282/600632BF" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/600632BF" Ref="R?"  Part="1" 
AR Path="/5D46B22D/600632BF" Ref="R17"  Part="1" 
F 0 "R17" V 3946 2450 50  0000 C CNN
F 1 "0Ω" V 3855 2450 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 2450 50  0001 C CNN
F 3 "~" H 3750 2450 50  0001 C CNN
	1    3750 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3850 2450 3900 2450
Wire Wire Line
	1650 2450 3650 2450
$Comp
L Device:R_Small R?
U 1 1 6006D390
P 2600 1600
AR Path="/6006D390" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/6006D390" Ref="R?"  Part="1" 
AR Path="/5D54E677/6006D390" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/6006D390" Ref="R?"  Part="1" 
AR Path="/5DEAC282/6006D390" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/6006D390" Ref="R?"  Part="1" 
AR Path="/5D46B22D/6006D390" Ref="R15"  Part="1" 
F 0 "R15" V 2496 1600 50  0000 C CNN
F 1 "0Ω" V 2405 1600 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2600 1600 50  0001 C CNN
F 3 "~" H 2600 1600 50  0001 C CNN
	1    2600 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 1600 3250 1600
Text Notes 3900 1800 0    100  ~ 20
Write Strobe
$Comp
L Device:R_Small R?
U 1 1 6008E2C5
P 5950 1500
AR Path="/6008E2C5" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/6008E2C5" Ref="R?"  Part="1" 
AR Path="/5D54E677/6008E2C5" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/6008E2C5" Ref="R?"  Part="1" 
AR Path="/5DEAC282/6008E2C5" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/6008E2C5" Ref="R?"  Part="1" 
AR Path="/5D46B22D/6008E2C5" Ref="R11"  Part="1" 
F 0 "R11" V 6146 1500 50  0000 C CNN
F 1 "0Ω" V 6055 1500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5950 1500 50  0001 C CNN
F 3 "~" H 5950 1500 50  0001 C CNN
	1    5950 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 1500 6150 1500
Wire Wire Line
	6400 2450 6550 2450
$Comp
L Device:R_Small R?
U 1 1 600900A7
P 6650 2450
AR Path="/600900A7" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/600900A7" Ref="R?"  Part="1" 
AR Path="/5D54E677/600900A7" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/600900A7" Ref="R?"  Part="1" 
AR Path="/5DEAC282/600900A7" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/600900A7" Ref="R?"  Part="1" 
AR Path="/5D46B22D/600900A7" Ref="R18"  Part="1" 
F 0 "R18" V 6546 2450 50  0000 C CNN
F 1 "0Ω" V 6455 2450 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6650 2450 50  0001 C CNN
F 3 "~" H 6650 2450 50  0001 C CNN
	1    6650 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6750 2450 6800 2450
Text Notes 9800 1250 0    50   ~ 0
Using 0Ω  0805 shunts as a\ncombination testpoint, jumper\nand pads for impedance-\nmatching resistors.
Text Notes 9800 850  0    63   ~ 13
0Ω Shunts
Wire Notes Line width 20 style solid
	9700 1350 9700 650 
Wire Notes Line width 20 style solid
	9700 650  11050 650 
Wire Notes Line width 20 style solid
	11050 650  11050 1350
Wire Notes Line width 20 style solid
	11050 1350 9700 1350
$Comp
L alexios:74LVC1G32 U34
U 2 1 600CE177
P 9750 1700
F 0 "U34" H 9600 1850 50  0000 L CNN
F 1 "74LVC1G32" H 9500 1750 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9860 1680 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9860 1680 50  0001 C CNN
	2    9750 1700
	1    0    0    -1  
$EndComp
Connection ~ 9350 2050
Connection ~ 9350 1850
$Comp
L alexios:74AUC1G74 U?
U 2 1 6015C566
P 10700 2700
AR Path="/6015C566" Ref="U?"  Part="1" 
AR Path="/5D30488D/6015C566" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/6015C566" Ref="U?"  Part="1" 
AR Path="/5D46B22D/6015C566" Ref="U42"  Part="2" 
F 0 "U42" H 10600 3100 50  0000 L CNN
F 1 "74LVC1G74" H 10500 3000 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 11150 2700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 11150 2700 50  0001 C CNN
	2    10700 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6015DD70
P 10350 2700
AR Path="/5CC0D65F/6015DD70" Ref="C?"  Part="1" 
AR Path="/6015DD70" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/6015DD70" Ref="C?"  Part="1" 
AR Path="/5D46B22D/6015DD70" Ref="C28"  Part="1" 
F 0 "C28" H 10259 2746 50  0000 R CNN
F 1 "100nF" H 10259 2655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10350 2700 50  0001 C CNN
F 3 "~" H 10350 2700 50  0001 C CNN
	1    10350 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 6015DD76
P 10350 2800
F 0 "#PWR0146" H 10350 2550 50  0001 C CNN
F 1 "GND" H 10355 2627 50  0000 C CNN
F 2 "" H 10350 2800 50  0001 C CNN
F 3 "" H 10350 2800 50  0001 C CNN
	1    10350 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0149
U 1 1 6015DD7C
P 10350 2600
F 0 "#PWR0149" H 10350 2450 50  0001 C CNN
F 1 "+5V" H 10200 2700 50  0000 C CNN
F 2 "" H 10350 2600 50  0001 C CNN
F 3 "" H 10350 2600 50  0001 C CNN
	1    10350 2600
	1    0    0    -1  
$EndComp
Connection ~ 10350 2800
Connection ~ 10350 2600
$Comp
L Device:C_Small C?
U 1 1 601722D7
P 10350 1950
AR Path="/5CC0D65F/601722D7" Ref="C?"  Part="1" 
AR Path="/601722D7" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/601722D7" Ref="C?"  Part="1" 
AR Path="/5D46B22D/601722D7" Ref="C53"  Part="1" 
F 0 "C53" H 10259 1996 50  0000 R CNN
F 1 "100nF" H 10259 1905 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10350 1950 50  0001 C CNN
F 3 "~" H 10350 1950 50  0001 C CNN
	1    10350 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 601722DD
P 10350 2050
F 0 "#PWR0150" H 10350 1800 50  0001 C CNN
F 1 "GND" H 10355 1877 50  0000 C CNN
F 2 "" H 10350 2050 50  0001 C CNN
F 3 "" H 10350 2050 50  0001 C CNN
	1    10350 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0151
U 1 1 601722E3
P 10350 1850
F 0 "#PWR0151" H 10350 1700 50  0001 C CNN
F 1 "+5V" H 10200 1950 50  0000 C CNN
F 2 "" H 10350 1850 50  0001 C CNN
F 3 "" H 10350 1850 50  0001 C CNN
	1    10350 1850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G0832 U44
U 2 1 60179FAE
P 10700 1950
F 0 "U44" H 10600 1550 50  0000 L CNN
F 1 "74LVC1G0832" H 10450 1650 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 10700 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 10700 1950 50  0001 C CNN
	2    10700 1950
	1    0    0    1   
$EndComp
Connection ~ 10350 1850
Connection ~ 10350 2050
Text Label 2700 1600 0    50   ~ 0
~WEN1
Wire Wire Line
	3250 1600 4900 1600
$Comp
L alexios:74LVC1G04 U22
U 1 1 60323B52
P 3050 2200
F 0 "U22" H 3000 2467 50  0000 C CNN
F 1 "74LVC1G04" H 3000 2376 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3050 2200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 3050 2200 50  0001 C CNN
	1    3050 2200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U22
U 2 1 60324EC9
P 1300 6700
F 0 "U22" H 1480 6746 50  0000 L CNN
F 1 "74LVC1G04" H 1480 6655 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1300 6700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 1300 6700 50  0001 C CNN
	2    1300 6700
	1    0    0    -1  
$EndComp
Connection ~ 950  6800
Connection ~ 950  6600
Text Notes 5300 2900 0    50   ~ 0
Keep ~W~ low during a wait state.
Wire Wire Line
	6650 1500 7050 1500
Text Label 6700 1500 0    50   ~ 0
HALT
Wire Wire Line
	7050 1500 7050 2250
$Comp
L alexios:Jumper_3_Bridged12 JP3
U 1 1 6035176F
P 3550 3000
F 0 "JP3" V 3550 3067 50  0000 L CNN
F 1 "Jumper_3_Bridged12" H 3550 3110 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 3550 3000 50  0001 C CNN
F 3 "~" H 3550 3000 50  0001 C CNN
	1    3550 3000
	0    -1   1    0   
$EndComp
Wire Wire Line
	3700 3000 3750 3000
Wire Wire Line
	3750 3400 3750 3700
Connection ~ 3750 3000
Wire Wire Line
	3750 3300 3850 3300
Text Label 3450 2700 2    50   ~ 0
~WS
Wire Wire Line
	7050 1500 7200 1500
Connection ~ 7050 1500
Text HLabel 7200 1500 2    50   Output ~ 0
HALT
Text Notes 7200 1650 0    50   ~ 0
Also used by the AR.
Text Label 9450 3000 2    50   ~ 0
~WAITING
Text Label 5650 2550 2    50   ~ 0
~WAITING0
Text Label 5650 3250 2    50   ~ 0
~WAITING0
Text Label 4750 3600 0    50   ~ 0
~WAITING0
Wire Wire Line
	4900 2350 5050 2350
Connection ~ 5050 2350
Wire Wire Line
	5050 2350 5650 2350
Wire Bus Line
	8750 3250 8750 5600
Wire Bus Line
	6850 3600 6850 6050
$EndSCHEMATC
