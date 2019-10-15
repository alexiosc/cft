EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 35
Title "CFT Homebrew 16-bit Minicomputer"
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
U 1 1 5F0313EC
P 9150 900
AR Path="/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F0313EC" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F0313EC" Ref="R307"  Part="1" 
F 0 "R307" H 9092 946 50  0000 R CNN
F 1 "4.7kΩ" H 9092 855 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 9150 900 50  0001 C CNN
F 3 "~" H 9150 900 50  0001 C CNN
	1    9150 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0313F2
P 9150 800
AR Path="/5F0313F2" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5F0313F2" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0313F2" Ref="#PWR0324"  Part="1" 
F 0 "#PWR0324" H 9150 650 50  0001 C CNN
F 1 "+5V" H 9165 973 50  0000 C CNN
F 2 "" H 9150 800 50  0001 C CNN
F 3 "" H 9150 800 50  0001 C CNN
	1    9150 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1100 8800 1000
Connection ~ 8800 1100
Wire Wire Line
	1000 1100 8800 1100
$Comp
L Device:R_Small R?
U 1 1 5F031400
P 8800 900
AR Path="/5F031400" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F031400" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F031400" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F031400" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F031400" Ref="R304"  Part="1" 
F 0 "R304" H 8742 946 50  0000 R CNN
F 1 "4.7kΩ" H 8742 855 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8800 900 50  0001 C CNN
F 3 "~" H 8800 900 50  0001 C CNN
	1    8800 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F031406
P 8800 800
AR Path="/5F031406" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5F031406" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031406" Ref="#PWR0321"  Part="1" 
F 0 "#PWR0321" H 8800 650 50  0001 C CNN
F 1 "+5V" H 8815 973 50  0000 C CNN
F 2 "" H 8800 800 50  0001 C CNN
F 3 "" H 8800 800 50  0001 C CNN
	1    8800 800 
	1    0    0    -1  
$EndComp
Text HLabel 10900 5800 2    50   Output ~ 0
~SKIP
Text Label 9150 2550 1    50   ~ 0
SKIPMUXLO
Text Label 9050 2550 1    50   ~ 0
~SKIPEXT
Text HLabel 1000 1800 0    50   Input ~ 0
COND[0..3]
Text HLabel 1000 1500 0    50   Input ~ 0
IR[0..15]
Text HLabel 1000 1100 0    50   3State ~ 0
~SKIPEXT
Entry Bus Bus
	1500 1500 1600 1600
Text Label 1050 1500 0    50   ~ 0
IR[0..15]
Text Label 1050 1800 0    50   ~ 0
COND[0..3]
Entry Bus Bus
	6100 1500 6200 1600
Entry Bus Bus
	6000 1800 6100 1900
Wire Bus Line
	1000 1800 6000 1800
Text Label 1050 1100 0    50   ~ 0
~SKIPEXT
Wire Wire Line
	1000 5800 9500 5800
Wire Wire Line
	1000 6000 9500 6000
$Comp
L Device:R_Small R?
U 1 1 5F031432
P 9100 6100
AR Path="/5F031432" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F031432" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F031432" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F031432" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F031432" Ref="R306"  Part="1" 
F 0 "R306" V 9204 6100 50  0000 C CNN
F 1 "10kΩ" V 9295 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 9100 6100 50  0001 C CNN
F 3 "~" H 9100 6100 50  0001 C CNN
	1    9100 6100
	0    1    1    0   
$EndComp
Text Label 1000 6000 0    50   ~ 0
CLK4
Text Label 1000 5800 0    50   ~ 0
~RESET
NoConn ~ 10400 6100
Text Label 9500 6000 2    50   ~ 0
CLK4
$Comp
L alexios:74LVC1G74 U?
U 1 1 5F03143E
P 9950 5950
AR Path="/5F03143E" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03143E" Ref="U307"  Part="1" 
F 0 "U307" H 9950 6367 50  0000 C CNN
F 1 "74LVC1G74" H 9950 6276 50  0000 C CNN
F 2 "" H 10400 5950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 10400 5950 50  0001 C CNN
	1    9950 5950
	1    0    0    -1  
$EndComp
Text Label 9500 5800 2    50   ~ 0
~RESET
Text Label 9050 5300 3    50   ~ 0
~SKIP2
Text Label 9500 5900 2    50   ~ 0
~SKIP2
Wire Wire Line
	9050 5900 9500 5900
Wire Wire Line
	9050 5300 9050 5900
Text Label 10650 5800 0    50   ~ 0
~SKIP
Wire Wire Line
	10600 5800 10900 5800
$Comp
L Device:R_Small R?
U 1 1 5F03144B
P 10500 5800
AR Path="/5E4DDD44/5F03144B" Ref="R?"  Part="1" 
AR Path="/5F03144B" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F03144B" Ref="R308"  Part="1" 
F 0 "R308" V 10304 5800 50  0000 C CNN
F 1 "30Ω" V 10395 5800 50  0000 C CNN
F 2 "" H 10500 5800 50  0001 C CNN
F 3 "~" H 10500 5800 50  0001 C CNN
	1    10500 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 6100 9200 6100
$Comp
L alexios:74LVC1G74 U?
U 2 1 5F031452
P 5450 7400
AR Path="/5F031452" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031452" Ref="U307"  Part="2" 
F 0 "U307" H 5630 7446 50  0000 L CNN
F 1 "74LVC1G74" H 5630 7355 50  0000 L CNN
F 2 "" H 5900 7400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 5900 7400 50  0001 C CNN
	2    5450 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F031458
P 950 7400
AR Path="/5CC0D65F/5F031458" Ref="C?"  Part="1" 
AR Path="/5F031458" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F031458" Ref="C302"  Part="1" 
F 0 "C302" H 859 7446 50  0000 R CNN
F 1 "100nF" H 859 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 7400 50  0001 C CNN
F 3 "~" H 950 7400 50  0001 C CNN
	1    950  7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F031464
P 3650 7400
AR Path="/5CC0D65F/5F031464" Ref="C?"  Part="1" 
AR Path="/5F031464" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F031464" Ref="C305"  Part="1" 
F 0 "C305" H 3559 7446 50  0000 R CNN
F 1 "100nF" H 3559 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3650 7400 50  0001 C CNN
F 3 "~" H 3650 7400 50  0001 C CNN
	1    3650 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F03146A
P 5100 7400
AR Path="/5CC0D65F/5F03146A" Ref="C?"  Part="1" 
AR Path="/5F03146A" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F03146A" Ref="C307"  Part="1" 
F 0 "C307" H 5009 7446 50  0000 R CNN
F 1 "100nF" H 5009 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5100 7400 50  0001 C CNN
F 3 "~" H 5100 7400 50  0001 C CNN
	1    5100 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F031470
P 950 7500
AR Path="/5F031470" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031470" Ref="#PWR0304"  Part="1" 
F 0 "#PWR0304" H 950 7250 50  0001 C CNN
F 1 "GND" H 955 7327 50  0000 C CNN
F 2 "" H 950 7500 50  0001 C CNN
F 3 "" H 950 7500 50  0001 C CNN
	1    950  7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F03147C
P 3650 7500
AR Path="/5F03147C" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03147C" Ref="#PWR0311"  Part="1" 
F 0 "#PWR0311" H 3650 7250 50  0001 C CNN
F 1 "GND" H 3655 7327 50  0000 C CNN
F 2 "" H 3650 7500 50  0001 C CNN
F 3 "" H 3650 7500 50  0001 C CNN
	1    3650 7500
	1    0    0    -1  
$EndComp
Connection ~ 5100 7500
$Comp
L power:GND #PWR?
U 1 1 5F031483
P 5100 7500
AR Path="/5F031483" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031483" Ref="#PWR0315"  Part="1" 
F 0 "#PWR0315" H 5100 7250 50  0001 C CNN
F 1 "GND" H 5105 7327 50  0000 C CNN
F 2 "" H 5100 7500 50  0001 C CNN
F 3 "" H 5100 7500 50  0001 C CNN
	1    5100 7500
	1    0    0    -1  
$EndComp
Connection ~ 5100 7300
$Comp
L power:+5V #PWR?
U 1 1 5F03148A
P 5100 7300
AR Path="/5F03148A" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03148A" Ref="#PWR0314"  Part="1" 
F 0 "#PWR0314" H 5100 7150 50  0001 C CNN
F 1 "+5V" H 5115 7473 50  0000 C CNN
F 2 "" H 5100 7300 50  0001 C CNN
F 3 "" H 5100 7300 50  0001 C CNN
	1    5100 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F031490
P 3650 7300
AR Path="/5F031490" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031490" Ref="#PWR0310"  Part="1" 
F 0 "#PWR0310" H 3650 7150 50  0001 C CNN
F 1 "+5V" H 3665 7473 50  0000 C CNN
F 2 "" H 3650 7300 50  0001 C CNN
F 3 "" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F03149C
P 950 7300
AR Path="/5F03149C" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03149C" Ref="#PWR0303"  Part="1" 
F 0 "#PWR0303" H 950 7150 50  0001 C CNN
F 1 "+5V" H 965 7473 50  0000 C CNN
F 2 "" H 950 7300 50  0001 C CNN
F 3 "" H 950 7300 50  0001 C CNN
	1    950  7300
	1    0    0    -1  
$EndComp
Text Label 7400 4950 2    50   ~ 0
COND1
Text Label 7400 4850 2    50   ~ 0
COND0
Text Label 6250 4850 0    50   ~ 0
COND0
Wire Wire Line
	5650 4250 7400 4250
Wire Wire Line
	5550 4350 7400 4350
Wire Wire Line
	5450 4450 7400 4450
Wire Wire Line
	5350 4550 7400 4550
Text Label 2650 4100 2    50   ~ 0
FN
Text Label 2650 5350 2    50   ~ 0
IR0
Text Label 2650 4900 2    50   ~ 0
IR1
Text Label 2650 4450 2    50   ~ 0
IR2
Text Label 2650 4000 2    50   ~ 0
IR3
Text Label 9050 4700 1    50   ~ 0
~SKIPEXT
Text Label 9150 4700 1    50   ~ 0
~SKIP0
Text Label 8950 4700 1    50   ~ 0
~SKIP1
Text Label 8400 1100 0    50   ~ 0
~SKIPEXT
Connection ~ 3650 7300
Connection ~ 3650 7500
$Comp
L alexios:74LVC1G11 U?
U 2 1 5F0314E3
P 4100 7250
AR Path="/5F0314E3" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F0314E3" Ref="U305"  Part="2" 
F 0 "U305" H 4180 7146 50  0000 L CNN
F 1 "74LVC1G11" H 4180 7055 50  0000 L CNN
F 2 "" H 4100 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 4100 7250 50  0001 C CNN
	2    4100 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 1 1 5F0314E9
P 9100 5100
AR Path="/5F0314E9" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F0314E9" Ref="U305"  Part="1" 
F 0 "U305" V 9004 4896 50  0000 R CNN
F 1 "74LVC1G11" V 9095 4896 50  0000 R CNN
F 2 "" H 9100 5100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 9100 5100 50  0001 C CNN
	1    9100 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 2600 7400 2600
Text Label 7400 4650 2    50   ~ 0
IF-BRANCH
Text Label 7400 4550 2    50   ~ 0
FN
Text Label 7400 4450 2    50   ~ 0
FZ
Text Label 7400 4250 2    50   ~ 0
FV
Text Label 7400 4350 2    50   ~ 0
FL
Text Label 8400 4050 0    50   ~ 0
~SKIP1
Wire Wire Line
	8400 4050 8950 4050
Wire Wire Line
	8400 2000 9150 2000
Text Label 8400 2000 0    50   ~ 0
~SKIP0
$Comp
L power:+5V #PWR?
U 1 1 5F031511
P 8950 3800
AR Path="/5F031511" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5F031511" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031511" Ref="#PWR0322"  Part="1" 
F 0 "#PWR0322" H 8950 3650 50  0001 C CNN
F 1 "+5V" H 8850 3950 50  0000 C CNN
F 2 "" H 8950 3800 50  0001 C CNN
F 3 "" H 8950 3800 50  0001 C CNN
	1    8950 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F031517
P 8950 3900
AR Path="/5F031517" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F031517" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F031517" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F031517" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F031517" Ref="R305"  Part="1" 
F 0 "R305" H 8892 3946 50  0000 R CNN
F 1 "4.7kΩ" H 8892 3855 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8950 3900 50  0001 C CNN
F 3 "~" H 8950 3900 50  0001 C CNN
	1    8950 3900
	1    0    0    -1  
$EndComp
Entry Wire Line
	6200 2500 6300 2600
Entry Wire Line
	6200 2400 6300 2500
Entry Wire Line
	6200 2300 6300 2400
Entry Wire Line
	6200 2200 6300 2300
Entry Wire Line
	6200 2100 6300 2200
Entry Wire Line
	6200 2000 6300 2100
Entry Wire Line
	6200 1900 6300 2000
Text Label 6200 1700 3    50   ~ 0
IR[0..15]
Wire Wire Line
	6200 3000 7400 3000
Wire Wire Line
	6200 2900 7400 2900
Wire Wire Line
	6200 2800 7400 2800
Text Label 6250 5050 0    50   ~ 0
COND2
Text Label 6250 4950 0    50   ~ 0
COND1
Wire Wire Line
	6200 4950 7400 4950
Wire Wire Line
	6200 4850 7400 4850
Entry Wire Line
	6100 4950 6200 5050
Entry Wire Line
	6100 4850 6200 4950
Entry Wire Line
	6100 4750 6200 4850
Text Label 7400 3000 2    50   ~ 0
COND2
Text Label 7400 2900 2    50   ~ 0
COND1
Text Label 7400 2800 2    50   ~ 0
COND0
Text Label 6450 3150 0    50   ~ 0
COND3
Text Label 6450 3000 0    50   ~ 0
COND2
Text Label 6450 2900 0    50   ~ 0
COND1
Text Label 6450 2800 0    50   ~ 0
COND0
Entry Wire Line
	6100 3050 6200 3150
Entry Wire Line
	6100 2900 6200 3000
Entry Wire Line
	6100 2800 6200 2900
Entry Wire Line
	6100 2700 6200 2800
Text Label 6100 3200 1    50   ~ 0
COND[0..3]
Connection ~ 950  7500
Connection ~ 950  7300
$Comp
L alexios:74HC251 U?
U 2 1 5F03155D
P 1300 7900
AR Path="/5F03155D" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F03155D" Ref="U302"  Part="2" 
F 0 "U302" H 1480 8446 50  0000 L CNN
F 1 "74HC251" H 1480 8355 50  0000 L CNN
F 2 "" H 1300 7850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 1300 7850 50  0001 C CNN
	2    1300 7900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC251 U?
U 1 1 5F031563
P 7900 4550
AR Path="/5F031563" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031563" Ref="U304"  Part="1" 
F 0 "U304" H 7900 5417 50  0000 C CNN
F 1 "74HC251" H 7900 5326 50  0000 C CNN
F 2 "" H 7900 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7900 4500 50  0001 C CNN
	1    7900 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2000 7400 2000
Wire Wire Line
	6300 2100 7400 2100
Wire Wire Line
	6300 2300 7400 2300
Wire Wire Line
	6300 2400 7400 2400
Wire Wire Line
	6300 2500 7400 2500
Wire Wire Line
	6300 2200 7400 2200
$Comp
L alexios:74HC251 U?
U 1 1 5F03157B
P 7900 2500
AR Path="/5F03157B" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03157B" Ref="U302"  Part="1" 
F 0 "U302" H 7900 3367 50  0000 C CNN
F 1 "74HC251" H 7900 3276 50  0000 C CNN
F 2 "" H 7900 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7900 2450 50  0001 C CNN
	1    7900 2500
	1    0    0    -1  
$EndComp
Text Label 4750 4600 2    50   ~ 0
IR4
Wire Wire Line
	4550 3700 4550 4600
Wire Wire Line
	4550 4700 4750 4700
Entry Wire Line
	1600 5250 1700 5350
Entry Wire Line
	1600 4800 1700 4900
Entry Wire Line
	1600 4350 1700 4450
Entry Wire Line
	1600 3900 1700 4000
Entry Wire Line
	1600 3600 1700 3700
Text Label 1600 3200 1    50   ~ 0
IR[0..15]
Text Label 1700 3700 0    50   ~ 0
IR4
Wire Wire Line
	4550 4600 4750 4600
Wire Wire Line
	1700 3700 4550 3700
Text Label 3850 5150 0    50   ~ 0
SVL
Text Label 3850 4300 0    50   ~ 0
SZN
Text Label 3100 4050 0    50   ~ 0
SN
Text Label 3100 4500 0    50   ~ 0
SZ
Text Label 3100 4950 0    50   ~ 0
SL
Text Label 3100 5400 0    50   ~ 0
SV
Text Label 1700 4000 0    50   ~ 0
IR3
Text Label 1700 4450 0    50   ~ 0
IR2
Text Label 2650 4550 2    50   ~ 0
FZ
Text Label 1700 4900 0    50   ~ 0
IR1
Text Label 2650 5000 2    50   ~ 0
FL
Text Label 2650 5450 2    50   ~ 0
FV
Text Label 1700 5350 0    50   ~ 0
IR0
$Comp
L alexios:74HC08 U?
U 5 1 5F0315A6
P 1150 6150
AR Path="/5F0315A6" Ref="U?"  Part="5" 
AR Path="/5EFCF155/5F0315A6" Ref="U301"  Part="5" 
F 0 "U301" H 1480 5646 50  0000 L CNN
F 1 "74HC08" H 1480 5555 50  0000 L CNN
F 2 "" H 1350 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 1350 5700 50  0001 C CNN
	5    1150 6150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 5 1 5F0315AC
P 2650 6400
AR Path="/5F0315AC" Ref="U?"  Part="5" 
AR Path="/5EFCF155/5F0315AC" Ref="U303"  Part="5" 
F 0 "U303" H 2830 6146 50  0000 L CNN
F 1 "74HC32" H 2830 6055 50  0000 L CNN
F 2 "" H 2650 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2650 6400 50  0001 C CNN
	5    2650 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F0315B2
P 950 6700
AR Path="/5CC0D65F/5F0315B2" Ref="C?"  Part="1" 
AR Path="/5F0315B2" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F0315B2" Ref="C301"  Part="1" 
F 0 "C301" H 859 6746 50  0000 R CNN
F 1 "100nF" H 859 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 6700 50  0001 C CNN
F 3 "~" H 950 6700 50  0001 C CNN
	1    950  6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F0315B8
P 2300 6700
AR Path="/5CC0D65F/5F0315B8" Ref="C?"  Part="1" 
AR Path="/5F0315B8" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F0315B8" Ref="C303"  Part="1" 
F 0 "C303" H 2209 6746 50  0000 R CNN
F 1 "100nF" H 2209 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 6700 50  0001 C CNN
F 3 "~" H 2300 6700 50  0001 C CNN
	1    2300 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0315C4
P 950 6600
AR Path="/5F0315C4" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315C4" Ref="#PWR0301"  Part="1" 
F 0 "#PWR0301" H 950 6450 50  0001 C CNN
F 1 "+5V" H 965 6773 50  0000 C CNN
F 2 "" H 950 6600 50  0001 C CNN
F 3 "" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
Connection ~ 950  6600
$Comp
L power:+5V #PWR?
U 1 1 5F0315CB
P 2300 6600
AR Path="/5F0315CB" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315CB" Ref="#PWR0305"  Part="1" 
F 0 "#PWR0305" H 2300 6450 50  0001 C CNN
F 1 "+5V" H 2315 6773 50  0000 C CNN
F 2 "" H 2300 6600 50  0001 C CNN
F 3 "" H 2300 6600 50  0001 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
Connection ~ 2300 6600
$Comp
L power:GND #PWR?
U 1 1 5F0315DE
P 2300 6800
AR Path="/5F0315DE" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315DE" Ref="#PWR0306"  Part="1" 
F 0 "#PWR0306" H 2300 6550 50  0001 C CNN
F 1 "GND" H 2305 6627 50  0000 C CNN
F 2 "" H 2300 6800 50  0001 C CNN
F 3 "" H 2300 6800 50  0001 C CNN
	1    2300 6800
	1    0    0    -1  
$EndComp
Connection ~ 2300 6800
$Comp
L power:GND #PWR?
U 1 1 5F0315E5
P 950 6800
AR Path="/5F0315E5" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315E5" Ref="#PWR0302"  Part="1" 
F 0 "#PWR0302" H 950 6550 50  0001 C CNN
F 1 "GND" H 955 6627 50  0000 C CNN
F 2 "" H 950 6800 50  0001 C CNN
F 3 "" H 950 6800 50  0001 C CNN
	1    950  6800
	1    0    0    -1  
$EndComp
Connection ~ 950  6800
$Comp
L power:GND #PWR?
U 1 1 5F0315F4
P 5100 6800
AR Path="/5F0315F4" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315F4" Ref="#PWR0313"  Part="1" 
F 0 "#PWR0313" H 5100 6550 50  0001 C CNN
F 1 "GND" H 5105 6627 50  0000 C CNN
F 2 "" H 5100 6800 50  0001 C CNN
F 3 "" H 5100 6800 50  0001 C CNN
	1    5100 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0315FA
P 5100 6600
AR Path="/5F0315FA" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315FA" Ref="#PWR0312"  Part="1" 
F 0 "#PWR0312" H 5100 6450 50  0001 C CNN
F 1 "+5V" H 5115 6773 50  0000 C CNN
F 2 "" H 5100 6600 50  0001 C CNN
F 3 "" H 5100 6600 50  0001 C CNN
	1    5100 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F031600
P 5100 6700
AR Path="/5CC0D65F/5F031600" Ref="C?"  Part="1" 
AR Path="/5F031600" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F031600" Ref="C306"  Part="1" 
F 0 "C306" H 5009 6746 50  0000 R CNN
F 1 "100nF" H 5009 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5100 6700 50  0001 C CNN
F 3 "~" H 5100 6700 50  0001 C CNN
	1    5100 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4750 4000 5150
Wire Wire Line
	4000 5150 3850 5150
Wire Wire Line
	3300 4050 3300 4250
$Comp
L alexios:74HC08 U?
U 3 1 5F031611
P 2750 4100
AR Path="/5F031611" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031611" Ref="U301"  Part="3" 
F 0 "U301" H 2900 3850 50  0000 C CNN
F 1 "74HC08" V 2920 3838 50  0001 L CNN
F 2 "" H 2950 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2950 3650 50  0001 C CNN
	3    2750 4100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 4 1 5F031617
P 2750 3650
AR Path="/5F031617" Ref="U?"  Part="4" 
AR Path="/5EFCF155/5F031617" Ref="U301"  Part="4" 
F 0 "U301" H 2875 3525 50  0000 C CNN
F 1 "74HC08" H 2875 3434 50  0000 C CNN
F 2 "" H 2950 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2950 3200 50  0001 C CNN
	4    2750 3650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 2 1 5F03161D
P 2750 4550
AR Path="/5F03161D" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F03161D" Ref="U301"  Part="2" 
F 0 "U301" H 2875 4333 50  0000 C CNN
F 1 "74HC08" V 2920 4288 50  0001 L CNN
F 2 "" H 2950 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2950 4100 50  0001 C CNN
	2    2750 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 1 1 5F031623
P 2750 5000
AR Path="/5F031623" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031623" Ref="U301"  Part="1" 
F 0 "U301" H 2875 4425 50  0000 C CNN
F 1 "74HC08" H 2875 4334 50  0000 C CNN
F 2 "" H 2950 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2950 4550 50  0001 C CNN
	1    2750 5000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 2 1 5F031629
P 3600 4950
AR Path="/5F031629" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031629" Ref="U303"  Part="2" 
F 0 "U303" H 3600 5025 50  0000 C CNN
F 1 "74HC32" H 3600 4934 50  0000 C CNN
F 2 "" H 3600 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3600 4950 50  0001 C CNN
	2    3600 4950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 1 1 5F03162F
P 3600 4100
AR Path="/5F03162F" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03162F" Ref="U303"  Part="1" 
F 0 "U303" H 3600 4175 50  0000 C CNN
F 1 "74HC32" H 3600 4084 50  0000 C CNN
F 2 "" H 3600 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3600 4100 50  0001 C CNN
	1    3600 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4000 2650 4000
Wire Wire Line
	2650 4100 2450 4100
Wire Wire Line
	2650 4450 1700 4450
Wire Wire Line
	2650 4550 2350 4550
Wire Wire Line
	2650 4900 1700 4900
Wire Wire Line
	2650 5000 2250 5000
Wire Wire Line
	2650 5350 1700 5350
Wire Wire Line
	2650 5450 2150 5450
Wire Wire Line
	4050 4750 4000 4750
Wire Wire Line
	3300 4050 3100 4050
Wire Wire Line
	3350 4250 3300 4250
Wire Wire Line
	3300 4500 3300 4350
Wire Wire Line
	3300 5100 3350 5100
Wire Wire Line
	3300 4950 3300 5100
Wire Wire Line
	3100 4950 3300 4950
Wire Wire Line
	3300 5200 3350 5200
Wire Wire Line
	3300 5400 3300 5200
Wire Wire Line
	3100 5400 3300 5400
Wire Wire Line
	4000 4300 3850 4300
Wire Wire Line
	4000 4650 4000 4300
Wire Wire Line
	4050 4650 4000 4650
Wire Wire Line
	3300 4350 3350 4350
Wire Wire Line
	3100 4500 3300 4500
$Comp
L alexios:74HC32 U?
U 3 1 5F031660
P 4300 4500
AR Path="/5F031660" Ref="U?"  Part="3" 
AR Path="/5EFCF155/5F031660" Ref="U303"  Part="3" 
F 0 "U303" H 4300 4575 50  0000 C CNN
F 1 "74HC32" H 4300 4484 50  0000 C CNN
F 2 "" H 4300 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4300 4500 50  0001 C CNN
	3    4300 4500
	1    0    0    -1  
$EndComp
Text HLabel 1000 5800 0    50   Input ~ 0
~RESET
Text HLabel 1000 6000 0    50   Input ~ 0
CLK4
Text Notes 7200 7000 0    197  ~ 39
Skip & Branch Unit
NoConn ~ 6700 7500
$Comp
L alexios:74HC32 U?
U 4 1 5F031645
P 6450 7300
AR Path="/5F031645" Ref="U?"  Part="4" 
AR Path="/5EFCF155/5F031645" Ref="U303"  Part="4" 
F 0 "U303" H 6450 7375 50  0000 C CNN
F 1 "74HC32" H 6450 7284 50  0000 C CNN
F 2 "" H 6450 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6450 7300 50  0001 C CNN
	4    6450 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 7450 6200 7550
Wire Wire Line
	7400 1900 7100 1900
Text Label 6100 5150 1    50   ~ 0
COND[0..3]
Text Label 6500 2100 0    50   ~ 0
IR1
Text Label 6500 2200 0    50   ~ 0
IR2
Text Label 6500 2300 0    50   ~ 0
IR3
Text Label 6500 2400 0    50   ~ 0
IR4
Text Label 6500 2500 0    50   ~ 0
IR5
Text Label 6500 2600 0    50   ~ 0
IR6
Text Label 7400 2000 2    50   ~ 0
IR0
Text Label 7400 2100 2    50   ~ 0
IR1
Text Label 7400 2200 2    50   ~ 0
IR2
Text Label 7400 2300 2    50   ~ 0
IR3
Text Label 7400 2400 2    50   ~ 0
IR4
Text Label 7400 2500 2    50   ~ 0
IR5
Text Label 7400 2600 2    50   ~ 0
IR6
Text Notes 9300 1900 0    50   ~ 0
Before the MUX: high is true (skip).\nAfter the MUX:   low is true (skip).
$Comp
L power:GND #PWR0320
U 1 1 5DF0BAC9
P 7100 1900
F 0 "#PWR0320" H 7100 1650 50  0001 C CNN
F 1 "GND" V 7105 1772 50  0000 R CNN
F 2 "" H 7100 1900 50  0001 C CNN
F 3 "" H 7100 1900 50  0001 C CNN
	1    7100 1900
	0    1    1    0   
$EndComp
Connection ~ 9150 2000
Wire Wire Line
	9150 1000 9150 2000
NoConn ~ 8400 1900
Connection ~ 8950 4050
Wire Wire Line
	8950 4050 8950 4800
Wire Wire Line
	8950 4000 8950 4050
NoConn ~ 8400 3950
$Comp
L alexios:74HC86 U306
U 1 1 5DBD6E12
P 5000 4650
F 0 "U306" H 5025 4925 50  0000 C CNN
F 1 "74HC86" H 5025 4834 50  0000 C CNN
F 2 "" H 4525 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 4525 4250 50  0001 C CNN
	1    5000 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4650 7400 4650
$Comp
L alexios:74HC86 U306
U 5 1 5DBDDE09
P 5450 6600
F 0 "U306" H 5630 6546 50  0000 L CNN
F 1 "74HC86" H 5630 6455 50  0000 L CNN
F 2 "" H 4975 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 4975 6200 50  0001 C CNN
	5    5450 6600
	1    0    0    -1  
$EndComp
Connection ~ 5100 6600
Connection ~ 5100 6800
$Comp
L alexios:74HC86 U306
U 2 1 5DBE5948
P 7100 3200
F 0 "U306" H 7125 3025 50  0000 C CNN
F 1 "74HC86" H 7125 2934 50  0000 C CNN
F 2 "" H 6625 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 6625 2800 50  0001 C CNN
	2    7100 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3150 6850 3150
$Comp
L power:GND #PWR0318
U 1 1 5DC04E57
P 6850 3250
F 0 "#PWR0318" H 6850 3000 50  0001 C CNN
F 1 "GND" H 6855 3077 50  0000 C CNN
F 2 "" H 6850 3250 50  0001 C CNN
F 3 "" H 6850 3250 50  0001 C CNN
	1    6850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5050 7400 5050
Text Label 7400 5050 2    50   ~ 0
COND2
$Comp
L alexios:74HC86 U306
U 3 1 5DC126C7
P 7100 5250
F 0 "U306" H 7125 5075 50  0000 C CNN
F 1 "74HC86" H 7125 4984 50  0000 C CNN
F 2 "" H 6625 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 6625 4850 50  0001 C CNN
	3    7100 5250
	1    0    0    -1  
$EndComp
Entry Wire Line
	6100 5200 6200 5300
Wire Wire Line
	6200 5300 6850 5300
Text Label 6250 5300 0    50   ~ 0
COND3
$Comp
L power:+5V #PWR0319
U 1 1 5DC26782
P 6850 5200
F 0 "#PWR0319" H 6850 5050 50  0001 C CNN
F 1 "+5V" V 6865 5328 50  0000 L CNN
F 2 "" H 6850 5200 50  0001 C CNN
F 3 "" H 6850 5200 50  0001 C CNN
	1    6850 5200
	0    -1   -1   0   
$EndComp
Text Notes 9300 3900 0    50   ~ 0
The two XOR gates are configured as a\nbuffer and inverter. Hopefully they'll\nsolve static hazards compared to using\na single inverter stage to get ~COND3~.
Entry Wire Line
	3400 2400 3300 2300
Entry Wire Line
	3400 2500 3300 2400
Entry Wire Line
	3400 2600 3300 2500
Wire Wire Line
	9150 2000 9150 4800
Wire Wire Line
	9050 1100 9050 4800
Wire Wire Line
	5350 4550 5350 3550
Text Label 5350 3750 1    50   ~ 0
FN
Text Label 5450 3750 1    50   ~ 0
FZ
Text Label 5550 3750 1    50   ~ 0
FL
Text Label 5650 3750 1    50   ~ 0
FV
Wire Wire Line
	5450 4450 5450 3450
Wire Wire Line
	5550 4350 5550 3350
Wire Wire Line
	5650 4250 5650 3250
Wire Wire Line
	2250 5000 2250 3350
Wire Wire Line
	2350 4550 2350 3450
Wire Wire Line
	2450 4100 2450 3550
Text Label 2600 3250 0    50   ~ 0
FV
Text Label 2600 3350 0    50   ~ 0
FL
Text Label 2600 3550 0    50   ~ 0
FN
Text Label 2600 3450 0    50   ~ 0
FZ
Wire Wire Line
	3300 2500 3000 2500
$Comp
L Device:R_Small R?
U 1 1 5F0314A2
P 2700 2650
AR Path="/5F0314A2" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F0314A2" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F0314A2" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F0314A2" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F0314A2" Ref="R302"  Part="1" 
F 0 "R302" H 2750 2900 50  0000 R CNN
F 1 "10kΩ" H 2750 3000 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2700 2650 50  0001 C CNN
F 3 "~" H 2700 2650 50  0001 C CNN
	1    2700 2650
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DEA3C4B
P 2400 2650
AR Path="/5DEA3C4B" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEA3C4B" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5DEA3C4B" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5DEA3C4B" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5DEA3C4B" Ref="R301"  Part="1" 
F 0 "R301" H 2400 2900 50  0000 R CNN
F 1 "10kΩ" H 2450 3000 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2400 2650 50  0001 C CNN
F 3 "~" H 2400 2650 50  0001 C CNN
	1    2400 2650
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DC72B33
P 3000 2650
AR Path="/5DC72B33" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DC72B33" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5DC72B33" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5DC72B33" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5DC72B33" Ref="R303"  Part="1" 
F 0 "R303" H 3058 2604 50  0000 L CNN
F 1 "10kΩ" H 3058 2695 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3000 2650 50  0001 C CNN
F 3 "~" H 3000 2650 50  0001 C CNN
	1    3000 2650
	1    0    0    1   
$EndComp
Wire Wire Line
	3000 2550 3000 2500
Connection ~ 3000 2500
Wire Wire Line
	3000 2500 2200 2500
Wire Wire Line
	3300 2400 2700 2400
Wire Wire Line
	3300 2300 2400 2300
Wire Wire Line
	2700 2800 2400 2800
Connection ~ 2700 2800
$Comp
L power:GND #PWR0309
U 1 1 5DDB5FD0
P 3000 2800
F 0 "#PWR0309" H 3000 2550 50  0001 C CNN
F 1 "GND" H 3000 2600 50  0000 C CNN
F 2 "" H 3000 2800 50  0001 C CNN
F 3 "" H 3000 2800 50  0001 C CNN
	1    3000 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2400 2800 2400 2750
Wire Wire Line
	3000 2800 2700 2800
Wire Wire Line
	3000 2750 3000 2800
Connection ~ 3000 2800
Wire Wire Line
	2700 2750 2700 2800
Wire Wire Line
	2700 2550 2700 2400
Connection ~ 2700 2400
Wire Wire Line
	2700 2400 2200 2400
Wire Wire Line
	2400 2550 2400 2300
Connection ~ 2400 2300
Wire Wire Line
	2400 2300 2200 2300
Text HLabel 2200 2300 0    50   Input ~ 0
CEXT1
Text HLabel 2200 2400 0    50   Input ~ 0
CEXT2
Text HLabel 2200 2500 0    50   Input ~ 0
CEXT3
Text Label 1050 3550 0    50   ~ 0
FN
Text HLabel 1000 3450 0    50   Input ~ 0
FZ
Text HLabel 1000 3350 0    50   Input ~ 0
FL
Text HLabel 1000 3250 0    50   Input ~ 0
FV
Text Label 1050 3250 0    50   ~ 0
FV
Text Label 1050 3350 0    50   ~ 0
FL
Text Label 1050 3450 0    50   ~ 0
FZ
Text HLabel 1000 3550 0    50   Input ~ 0
FN
Entry Bus Bus
	3400 2900 3500 3000
Text Label 6500 2000 0    50   ~ 0
IR0
Wire Wire Line
	5850 4150 7400 4150
Wire Wire Line
	5850 4050 7400 4050
Wire Wire Line
	5850 3950 7400 3950
Entry Wire Line
	5750 4050 5850 4150
Entry Wire Line
	5750 3950 5850 4050
Entry Wire Line
	5750 3850 5850 3950
Entry Bus Bus
	5650 3000 5750 3100
Wire Bus Line
	5650 3000 3500 3000
Text Label 5750 3750 1    50   ~ 0
CEXT[1..3]
Text Label 3700 3000 0    50   ~ 0
CEXT[1..3]
$Comp
L alexios:74HC251 U?
U 2 1 5F031555
P 2650 7900
AR Path="/5F031555" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031555" Ref="U304"  Part="2" 
F 0 "U304" H 2830 8446 50  0000 L CNN
F 1 "74HC251" H 2830 8355 50  0000 L CNN
F 2 "" H 2650 7850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 2650 7850 50  0001 C CNN
	2    2650 7900
	1    0    0    -1  
$EndComp
Connection ~ 2300 7300
Connection ~ 2300 7500
$Comp
L power:+5V #PWR?
U 1 1 5F031496
P 2300 7300
AR Path="/5F031496" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031496" Ref="#PWR0307"  Part="1" 
F 0 "#PWR0307" H 2300 7150 50  0001 C CNN
F 1 "+5V" H 2315 7473 50  0000 C CNN
F 2 "" H 2300 7300 50  0001 C CNN
F 3 "" H 2300 7300 50  0001 C CNN
	1    2300 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F031476
P 2300 7500
AR Path="/5F031476" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031476" Ref="#PWR0308"  Part="1" 
F 0 "#PWR0308" H 2300 7250 50  0001 C CNN
F 1 "GND" H 2305 7327 50  0000 C CNN
F 2 "" H 2300 7500 50  0001 C CNN
F 3 "" H 2300 7500 50  0001 C CNN
	1    2300 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F03145E
P 2300 7400
AR Path="/5CC0D65F/5F03145E" Ref="C?"  Part="1" 
AR Path="/5F03145E" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F03145E" Ref="C304"  Part="1" 
F 0 "C304" H 2209 7446 50  0000 R CNN
F 1 "100nF" H 2209 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 7400 50  0001 C CNN
F 3 "~" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 6100 9000 6100
$Comp
L power:+5V #PWR?
U 1 1 5F03142A
P 8950 6100
AR Path="/5F03142A" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03142A" Ref="#PWR0323"  Part="1" 
F 0 "#PWR0323" H 8950 5950 50  0001 C CNN
F 1 "+5V" V 8965 6228 50  0000 L CNN
F 2 "" H 8950 6100 50  0001 C CNN
F 3 "" H 8950 6100 50  0001 C CNN
	1    8950 6100
	0    -1   -1   0   
$EndComp
Text Label 3050 2300 0    50   ~ 0
CEXT1
Text Label 3050 2400 0    50   ~ 0
CEXT2
Text Label 3050 2500 0    50   ~ 0
CEXT3
Text Label 7400 3950 2    50   ~ 0
CEXT1
Text Label 7400 4050 2    50   ~ 0
CEXT2
Text Label 7400 4150 2    50   ~ 0
CEXT3
Text Notes 7400 1900 2    50   ~ 0
IDLE
$Comp
L alexios:74HC86 U306
U 4 1 5DF99F6D
P 6400 6650
F 0 "U306" H 6425 6475 50  0000 C CNN
F 1 "74HC86" H 6425 6384 50  0000 C CNN
F 2 "" H 5925 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 5925 6250 50  0001 C CNN
	4    6400 6650
	1    0    0    -1  
$EndComp
NoConn ~ 6700 6650
$Comp
L power:GND #PWR0317
U 1 1 5DFA4C03
P 6200 7550
F 0 "#PWR0317" H 6200 7300 50  0001 C CNN
F 1 "GND" H 6205 7377 50  0000 C CNN
F 2 "" H 6200 7550 50  0001 C CNN
F 3 "" H 6200 7550 50  0001 C CNN
	1    6200 7550
	1    0    0    -1  
$EndComp
Connection ~ 6200 7550
$Comp
L power:GND #PWR0316
U 1 1 5DFA58C1
P 6150 6700
F 0 "#PWR0316" H 6150 6450 50  0001 C CNN
F 1 "GND" H 6155 6527 50  0000 C CNN
F 2 "" H 6150 6700 50  0001 C CNN
F 3 "" H 6150 6700 50  0001 C CNN
	1    6150 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 6700 6150 6600
Connection ~ 6150 6700
Text Notes 9300 5400 0    50   ~ 0
Register the result until the end of the\nprocessor cycle. This implies conditionals\ncan only control one microcode step.\n(single statements, not block, in C terms)\n\nIf microcode repeats its ~IF_xxx~ instruction,\nblocks are possible but this is untested.\n\nNote that since we clock on the rising edge\nof CLK4, ~IF_xxx~ must be asserted one\nprocessor cycle before the result becomes\navailable.
Wire Notes Line
	7300 3300 9250 3600
Text Notes 3500 5500 0    50   ~ 0
This is the hardwired logic behind the SKP instruction.\nThe PDP-8 does it the same tway. (but with fewer flags)
Text Notes 1700 1000 0    50   ~ 0
The open drain ~SKIPEXT~ signal may be asserted at certain well-defined\ntimes by external hardware to cause an instruction skip. The IOT\ninstruction allows this, for example.
Wire Wire Line
	2150 3250 5650 3250
Wire Wire Line
	2250 3350 5550 3350
Wire Wire Line
	2350 3450 5450 3450
Wire Wire Line
	2450 3550 5350 3550
Wire Wire Line
	2150 3250 1000 3250
Wire Wire Line
	8800 1100 9050 1100
Connection ~ 2150 3250
Wire Wire Line
	2150 5450 2150 3250
Wire Wire Line
	2250 3350 1000 3350
Connection ~ 2250 3350
Wire Wire Line
	2350 3450 1000 3450
Connection ~ 2350 3450
Wire Wire Line
	2450 3550 1000 3550
Connection ~ 2450 3550
Wire Bus Line
	1000 1500 6100 1500
Wire Bus Line
	3400 2400 3400 2900
Wire Bus Line
	5750 3100 5750 4050
Wire Bus Line
	6200 1600 6200 2500
Wire Bus Line
	1600 1600 1600 5250
Wire Bus Line
	6100 1900 6100 5200
Text Notes 1900 2050 0    50   ~ 0
CEXT₁–CEXT₃ are here for future expansion.\nIt'd be a pity to waste three whole conditional sources!
$EndSCHEMATC
