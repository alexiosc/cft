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
AR Path="/5EFCF155/5F0313EC" Ref="R902"  Part="1" 
F 0 "R902" H 9092 946 50  0000 R CNN
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
AR Path="/5EFCF155/5F0313F2" Ref="#PWR0902"  Part="1" 
F 0 "#PWR0902" H 9150 650 50  0001 C CNN
F 1 "+5V" H 9165 973 50  0000 C CNN
F 2 "" H 9150 800 50  0001 C CNN
F 3 "" H 9150 800 50  0001 C CNN
	1    9150 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1100 8800 1100
Wire Wire Line
	8800 1100 8800 1000
Connection ~ 8800 1100
Wire Wire Line
	950  1100 8800 1100
$Comp
L Device:R_Small R?
U 1 1 5F031400
P 8800 900
AR Path="/5F031400" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F031400" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F031400" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F031400" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F031400" Ref="R901"  Part="1" 
F 0 "R901" H 8742 946 50  0000 R CNN
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
AR Path="/5EFCF155/5F031406" Ref="#PWR0901"  Part="1" 
F 0 "#PWR0901" H 8800 650 50  0001 C CNN
F 1 "+5V" H 8815 973 50  0000 C CNN
F 2 "" H 8800 800 50  0001 C CNN
F 3 "" H 8800 800 50  0001 C CNN
	1    8800 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1100 9050 4800
Text HLabel 10900 5800 2    50   Output ~ 0
~SKIP
Text Label 9150 2550 1    50   ~ 0
SKIPMUXLO
Text Label 9050 2550 1    50   ~ 0
~SKIPEXT
Text HLabel 950  2600 0    50   Input ~ 0
FN
Text Label 1000 2500 0    50   ~ 0
FZ
Text Label 1000 2400 0    50   ~ 0
FL
Text Label 1000 2300 0    50   ~ 0
FV
Text HLabel 950  2300 0    50   Input ~ 0
FV
Text HLabel 950  2400 0    50   Input ~ 0
FL
Text HLabel 950  2500 0    50   Input ~ 0
FZ
Text HLabel 950  2000 0    50   Input ~ 0
COND[0..3]
Text HLabel 950  1500 0    50   Input ~ 0
IR[0..15]
Text HLabel 950  1100 0    50   3State ~ 0
~SKIPEXT
Entry Bus Bus
	1500 1500 1600 1600
Text Label 1000 1500 0    50   ~ 0
IR[0..15]
Text Label 1000 2000 0    50   ~ 0
COND[0..3]
Entry Bus Bus
	6100 1500 6200 1600
Entry Bus Bus
	6000 2000 6100 2100
Wire Bus Line
	950  2000 6000 2000
Text Label 1000 1100 0    50   ~ 0
~SKIPEXT
Wire Wire Line
	950  5800 9500 5800
Wire Wire Line
	950  6000 9500 6000
$Comp
L power:+5V #PWR?
U 1 1 5F03142A
P 8950 5750
AR Path="/5F03142A" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03142A" Ref="#PWR0906"  Part="1" 
F 0 "#PWR0906" H 8950 5600 50  0001 C CNN
F 1 "+5V" H 8800 5800 50  0000 C CNN
F 2 "" H 8950 5750 50  0001 C CNN
F 3 "" H 8950 5750 50  0001 C CNN
	1    8950 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 6100 9000 6100
Wire Wire Line
	8950 6100 8950 5750
$Comp
L Device:R_Small R?
U 1 1 5F031432
P 9100 6100
AR Path="/5F031432" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F031432" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F031432" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F031432" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F031432" Ref="R906"  Part="1" 
F 0 "R906" V 9204 6100 50  0000 C CNN
F 1 "10kΩ" V 9295 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 9100 6100 50  0001 C CNN
F 3 "~" H 9100 6100 50  0001 C CNN
	1    9100 6100
	0    1    1    0   
$EndComp
Text Label 950  6000 0    50   ~ 0
CLK4
Text Label 950  5800 0    50   ~ 0
~RESET
NoConn ~ 10400 6100
Text Label 9500 6000 2    50   ~ 0
CLK4
$Comp
L alexios:74LVC1G74 U?
U 1 1 5F03143E
P 9950 5950
AR Path="/5F03143E" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03143E" Ref="U911"  Part="1" 
F 0 "U911" H 9950 6367 50  0000 C CNN
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
AR Path="/5EFCF155/5F03144B" Ref="R905"  Part="1" 
F 0 "R905" V 10304 5800 50  0000 C CNN
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
AR Path="/5EFCF155/5F031452" Ref="U911"  Part="2" 
F 0 "U911" H 5630 7446 50  0000 L CNN
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
AR Path="/5EFCF155/5F031458" Ref="C905"  Part="1" 
F 0 "C905" H 859 7446 50  0000 R CNN
F 1 "100nF" H 859 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 7400 50  0001 C CNN
F 3 "~" H 950 7400 50  0001 C CNN
	1    950  7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F03145E
P 2300 7400
AR Path="/5CC0D65F/5F03145E" Ref="C?"  Part="1" 
AR Path="/5F03145E" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F03145E" Ref="C906"  Part="1" 
F 0 "C906" H 2209 7446 50  0000 R CNN
F 1 "100nF" H 2209 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 7400 50  0001 C CNN
F 3 "~" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F031464
P 3650 7400
AR Path="/5CC0D65F/5F031464" Ref="C?"  Part="1" 
AR Path="/5F031464" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F031464" Ref="C907"  Part="1" 
F 0 "C907" H 3559 7446 50  0000 R CNN
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
AR Path="/5EFCF155/5F03146A" Ref="C908"  Part="1" 
F 0 "C908" H 5009 7446 50  0000 R CNN
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
AR Path="/5EFCF155/5F031470" Ref="#PWR0919"  Part="1" 
F 0 "#PWR0919" H 950 7250 50  0001 C CNN
F 1 "GND" H 955 7327 50  0000 C CNN
F 2 "" H 950 7500 50  0001 C CNN
F 3 "" H 950 7500 50  0001 C CNN
	1    950  7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F031476
P 2300 7500
AR Path="/5F031476" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031476" Ref="#PWR0920"  Part="1" 
F 0 "#PWR0920" H 2300 7250 50  0001 C CNN
F 1 "GND" H 2305 7327 50  0000 C CNN
F 2 "" H 2300 7500 50  0001 C CNN
F 3 "" H 2300 7500 50  0001 C CNN
	1    2300 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F03147C
P 3650 7500
AR Path="/5F03147C" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03147C" Ref="#PWR0921"  Part="1" 
F 0 "#PWR0921" H 3650 7250 50  0001 C CNN
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
AR Path="/5EFCF155/5F031483" Ref="#PWR0922"  Part="1" 
F 0 "#PWR0922" H 5100 7250 50  0001 C CNN
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
AR Path="/5EFCF155/5F03148A" Ref="#PWR0918"  Part="1" 
F 0 "#PWR0918" H 5100 7150 50  0001 C CNN
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
AR Path="/5EFCF155/5F031490" Ref="#PWR0917"  Part="1" 
F 0 "#PWR0917" H 3650 7150 50  0001 C CNN
F 1 "+5V" H 3665 7473 50  0000 C CNN
F 2 "" H 3650 7300 50  0001 C CNN
F 3 "" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F031496
P 2300 7300
AR Path="/5F031496" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031496" Ref="#PWR0916"  Part="1" 
F 0 "#PWR0916" H 2300 7150 50  0001 C CNN
F 1 "+5V" H 2315 7473 50  0000 C CNN
F 2 "" H 2300 7300 50  0001 C CNN
F 3 "" H 2300 7300 50  0001 C CNN
	1    2300 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F03149C
P 950 7300
AR Path="/5F03149C" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F03149C" Ref="#PWR0915"  Part="1" 
F 0 "#PWR0915" H 950 7150 50  0001 C CNN
F 1 "+5V" H 965 7473 50  0000 C CNN
F 2 "" H 950 7300 50  0001 C CNN
F 3 "" H 950 7300 50  0001 C CNN
	1    950  7300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F0314A2
P 7000 4050
AR Path="/5F0314A2" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F0314A2" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F0314A2" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F0314A2" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F0314A2" Ref="R904"  Part="1" 
F 0 "R904" V 6900 3700 50  0000 C CNN
F 1 "10kΩ" V 7000 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7000 4050 50  0001 C CNN
F 3 "~" H 7000 4050 50  0001 C CNN
	1    7000 4050
	0    1    1    0   
$EndComp
Text Label 7400 5050 2    50   ~ 0
COND2
Text Label 7400 4950 2    50   ~ 0
COND1
Text Label 7400 4850 2    50   ~ 0
COND0
Text Label 6250 4850 0    50   ~ 0
COND0
Text Label 6250 4150 0    50   ~ 0
FV
Text Label 6250 4250 0    50   ~ 0
FL
Text Label 6250 4450 0    50   ~ 0
FN
Text Label 6250 4350 0    50   ~ 0
FZ
Wire Wire Line
	5950 4150 7400 4150
Wire Wire Line
	5950 4150 5950 2300
Wire Wire Line
	5850 4250 7400 4250
Wire Wire Line
	5850 4250 5850 2400
Wire Wire Line
	5750 4350 7400 4350
Wire Wire Line
	5750 4350 5750 2500
Wire Wire Line
	5650 4450 7400 4450
Wire Wire Line
	5650 4450 5650 2600
Text Label 2350 2950 1    50   ~ 0
FZ
Text Label 2450 2950 1    50   ~ 0
FN
Text Label 2900 4100 2    50   ~ 0
FN
Text Label 2250 2950 1    50   ~ 0
FL
Text Label 2150 2950 1    50   ~ 0
FV
Text Label 2900 5350 2    50   ~ 0
IR0
Text Label 2900 4900 2    50   ~ 0
IR1
Text Label 2900 4450 2    50   ~ 0
IR2
Text Label 2900 4000 2    50   ~ 0
IR3
Wire Wire Line
	950  2600 2450 2600
Wire Wire Line
	2450 2600 5650 2600
Connection ~ 2450 2600
Wire Wire Line
	2450 4100 2450 2600
Wire Wire Line
	2350 2500 5750 2500
Connection ~ 2350 2500
Wire Wire Line
	2350 4550 2350 2500
Wire Wire Line
	950  2400 2250 2400
Wire Wire Line
	2250 2400 5850 2400
Connection ~ 2250 2400
Wire Wire Line
	2250 5000 2250 2400
Wire Wire Line
	950  2300 2150 2300
Wire Wire Line
	2150 2300 5950 2300
Connection ~ 2150 2300
Wire Wire Line
	2150 5450 2150 2300
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
AR Path="/5EFCF155/5F0314E3" Ref="U909"  Part="2" 
F 0 "U909" H 4180 7146 50  0000 L CNN
F 1 "74LVC1G11" H 4180 7055 50  0000 L CNN
F 2 "" H 4100 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4100 7250 50  0001 C CNN
	2    4100 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 1 1 5F0314E9
P 9100 5100
AR Path="/5F0314E9" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F0314E9" Ref="U909"  Part="1" 
F 0 "U909" V 9004 4896 50  0000 R CNN
F 1 "74LVC1G11" V 9095 4896 50  0000 R CNN
F 2 "" H 9100 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9100 5100 50  0001 C CNN
	1    9100 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 2600 7400 2600
Wire Wire Line
	7100 4050 7400 4050
Text Label 7400 4650 2    50   ~ 0
OP1-BRANCH
Text Label 7400 4450 2    50   ~ 0
FN
Text Label 7400 4350 2    50   ~ 0
FZ
Text Label 7400 4150 2    50   ~ 0
FV
Text Label 7400 4250 2    50   ~ 0
FL
Wire Wire Line
	6900 4050 6800 4050
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
P 8950 3650
AR Path="/5F031511" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5F031511" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F031511" Ref="#PWR0904"  Part="1" 
F 0 "#PWR0904" H 8950 3500 50  0001 C CNN
F 1 "+5V" H 8850 3800 50  0000 C CNN
F 2 "" H 8950 3650 50  0001 C CNN
F 3 "" H 8950 3650 50  0001 C CNN
	1    8950 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F031517
P 8950 3750
AR Path="/5F031517" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F031517" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F031517" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F031517" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5F031517" Ref="R903"  Part="1" 
F 0 "R903" H 8892 3796 50  0000 R CNN
F 1 "4.7kΩ" H 8892 3705 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8950 3750 50  0001 C CNN
F 3 "~" H 8950 3750 50  0001 C CNN
	1    8950 3750
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
	6200 3200 7400 3200
Wire Wire Line
	6200 3000 7400 3000
Wire Wire Line
	6200 2900 7400 2900
Wire Wire Line
	6200 2800 7400 2800
Text Label 6250 5250 0    50   ~ 0
COND3
Wire Wire Line
	6200 5250 6500 5250
Entry Wire Line
	6100 5150 6200 5250
Text Label 6250 5050 0    50   ~ 0
COND2
Text Label 6250 4950 0    50   ~ 0
COND1
Wire Wire Line
	6200 5050 7400 5050
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
Text Label 7400 3200 2    50   ~ 0
COND3
Text Label 7400 3000 2    50   ~ 0
COND2
Text Label 7400 2900 2    50   ~ 0
COND1
Text Label 7400 2800 2    50   ~ 0
COND0
Text Label 6450 3200 0    50   ~ 0
COND3
Text Label 6450 3000 0    50   ~ 0
COND2
Text Label 6450 2900 0    50   ~ 0
COND1
Text Label 6450 2800 0    50   ~ 0
COND0
Entry Wire Line
	6100 3100 6200 3200
Entry Wire Line
	6100 2900 6200 3000
Entry Wire Line
	6100 2800 6200 2900
Entry Wire Line
	6100 2700 6200 2800
Text Label 6100 3200 1    50   ~ 0
COND[0..3]
Text Label 7400 5250 2    50   ~ 0
~COND3
Connection ~ 2300 7500
Connection ~ 2300 7300
$Comp
L alexios:74HC251 U?
U 2 1 5F031555
P 2650 7900
AR Path="/5F031555" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031555" Ref="U907"  Part="2" 
F 0 "U907" H 2830 8446 50  0000 L CNN
F 1 "74HC251" H 2830 8355 50  0000 L CNN
F 2 "" H 2650 7850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 2650 7850 50  0001 C CNN
	2    2650 7900
	1    0    0    -1  
$EndComp
Connection ~ 950  7500
Connection ~ 950  7300
$Comp
L alexios:74HC251 U?
U 2 1 5F03155D
P 1300 7900
AR Path="/5F03155D" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F03155D" Ref="U901"  Part="2" 
F 0 "U901" H 1480 8446 50  0000 L CNN
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
AR Path="/5EFCF155/5F031563" Ref="U907"  Part="1" 
F 0 "U907" H 7900 5417 50  0000 C CNN
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
AR Path="/5EFCF155/5F03157B" Ref="U901"  Part="1" 
F 0 "U901" H 7900 3367 50  0000 C CNN
F 1 "74HC251" H 7900 3276 50  0000 C CNN
F 2 "" H 7900 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 7900 2450 50  0001 C CNN
	1    7900 2500
	1    0    0    -1  
$EndComp
Text Label 6250 4650 0    50   ~ 0
OP1-BRANCH
Text Label 5000 4600 2    50   ~ 0
IR4
Wire Wire Line
	4800 3700 4800 4600
Wire Wire Line
	4800 4700 5000 4700
Entry Wire Line
	1600 3250 1700 3350
Entry Wire Line
	1600 3150 1700 3250
Entry Wire Line
	1600 3050 1700 3150
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
	4800 4600 5000 4600
Wire Wire Line
	1700 3700 4800 3700
Text Label 5300 3250 2    50   ~ 0
OP2-ROLL
Text Label 1700 3150 0    50   ~ 0
IR2
Text Label 1700 3250 0    50   ~ 0
IR1
Text Label 1700 3350 0    50   ~ 0
IR0
Text Label 4100 5150 0    50   ~ 0
SVL
Text Label 4100 4300 0    50   ~ 0
SZN
Text Label 3350 4050 0    50   ~ 0
SN
Text Label 3350 4500 0    50   ~ 0
SZ
Text Label 3350 4950 0    50   ~ 0
SL
Text Label 3350 5400 0    50   ~ 0
SV
Text Label 1700 4000 0    50   ~ 0
IR3
Text Label 1700 4450 0    50   ~ 0
IR2
Text Label 2900 4550 2    50   ~ 0
FZ
Text Label 1700 4900 0    50   ~ 0
IR1
Text Label 2900 5000 2    50   ~ 0
FL
Text Label 2900 5450 2    50   ~ 0
FV
Text Label 1700 5350 0    50   ~ 0
IR0
$Comp
L alexios:74HC08 U?
U 5 1 5F0315A6
P 1150 6150
AR Path="/5F0315A6" Ref="U?"  Part="5" 
AR Path="/5EFCF155/5F0315A6" Ref="U904"  Part="5" 
F 0 "U904" H 1480 5646 50  0000 L CNN
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
AR Path="/5EFCF155/5F0315AC" Ref="U902"  Part="5" 
F 0 "U902" H 2830 6146 50  0000 L CNN
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
AR Path="/5EFCF155/5F0315B2" Ref="C901"  Part="1" 
F 0 "C901" H 859 6746 50  0000 R CNN
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
AR Path="/5EFCF155/5F0315B8" Ref="C902"  Part="1" 
F 0 "C902" H 2209 6746 50  0000 R CNN
F 1 "100nF" H 2209 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 6700 50  0001 C CNN
F 3 "~" H 2300 6700 50  0001 C CNN
	1    2300 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F0315BE
P 3650 6700
AR Path="/5CC0D65F/5F0315BE" Ref="C?"  Part="1" 
AR Path="/5F0315BE" Ref="C?"  Part="1" 
AR Path="/5EFCF155/5F0315BE" Ref="C903"  Part="1" 
F 0 "C903" H 3559 6746 50  0000 R CNN
F 1 "100nF" H 3559 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3650 6700 50  0001 C CNN
F 3 "~" H 3650 6700 50  0001 C CNN
	1    3650 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0315C4
P 950 6600
AR Path="/5F0315C4" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315C4" Ref="#PWR0907"  Part="1" 
F 0 "#PWR0907" H 950 6450 50  0001 C CNN
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
AR Path="/5EFCF155/5F0315CB" Ref="#PWR0908"  Part="1" 
F 0 "#PWR0908" H 2300 6450 50  0001 C CNN
F 1 "+5V" H 2315 6773 50  0000 C CNN
F 2 "" H 2300 6600 50  0001 C CNN
F 3 "" H 2300 6600 50  0001 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
Connection ~ 2300 6600
$Comp
L power:+5V #PWR?
U 1 1 5F0315D2
P 3650 6600
AR Path="/5F0315D2" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315D2" Ref="#PWR0909"  Part="1" 
F 0 "#PWR0909" H 3650 6450 50  0001 C CNN
F 1 "+5V" H 3665 6773 50  0000 C CNN
F 2 "" H 3650 6600 50  0001 C CNN
F 3 "" H 3650 6600 50  0001 C CNN
	1    3650 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0315D8
P 3650 6800
AR Path="/5F0315D8" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315D8" Ref="#PWR0913"  Part="1" 
F 0 "#PWR0913" H 3650 6550 50  0001 C CNN
F 1 "GND" H 3655 6627 50  0000 C CNN
F 2 "" H 3650 6800 50  0001 C CNN
F 3 "" H 3650 6800 50  0001 C CNN
	1    3650 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0315DE
P 2300 6800
AR Path="/5F0315DE" Ref="#PWR?"  Part="1" 
AR Path="/5EFCF155/5F0315DE" Ref="#PWR0912"  Part="1" 
F 0 "#PWR0912" H 2300 6550 50  0001 C CNN
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
AR Path="/5EFCF155/5F0315E5" Ref="#PWR0911"  Part="1" 
F 0 "#PWR0911" H 950 6550 50  0001 C CNN
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
AR Path="/5EFCF155/5F0315F4" Ref="#PWR0914"  Part="1" 
F 0 "#PWR0914" H 5100 6550 50  0001 C CNN
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
AR Path="/5EFCF155/5F0315FA" Ref="#PWR0910"  Part="1" 
F 0 "#PWR0910" H 5100 6450 50  0001 C CNN
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
AR Path="/5EFCF155/5F031600" Ref="C904"  Part="1" 
F 0 "C904" H 5009 6746 50  0000 R CNN
F 1 "100nF" H 5009 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5100 6700 50  0001 C CNN
F 3 "~" H 5100 6700 50  0001 C CNN
	1    5100 6700
	1    0    0    -1  
$EndComp
Connection ~ 5100 6600
Connection ~ 5100 6800
$Comp
L alexios:74AHC1G86 U?
U 2 1 5F031608
P 5500 6550
AR Path="/5F031608" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031608" Ref="U906"  Part="2" 
F 0 "U906" H 5630 6446 50  0000 L CNN
F 1 "74AHC1G86" H 5630 6355 50  0000 L CNN
F 2 "" H 5430 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5430 6850 50  0001 C CNN
	2    5500 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4750 4250 5150
Wire Wire Line
	4250 5150 4100 5150
Wire Wire Line
	3550 4050 3550 4250
$Comp
L alexios:74HC08 U?
U 3 1 5F031611
P 3000 4100
AR Path="/5F031611" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F031611" Ref="U904"  Part="3" 
F 0 "U904" H 3150 3850 50  0000 C CNN
F 1 "74HC08" V 3170 3838 50  0001 L CNN
F 2 "" H 3200 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3200 3650 50  0001 C CNN
	3    3000 4100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 4 1 5F031617
P 3000 3650
AR Path="/5F031617" Ref="U?"  Part="4" 
AR Path="/5EFCF155/5F031617" Ref="U904"  Part="4" 
F 0 "U904" H 3125 3525 50  0000 C CNN
F 1 "74HC08" H 3125 3434 50  0000 C CNN
F 2 "" H 3200 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3200 3200 50  0001 C CNN
	4    3000 3650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 2 1 5F03161D
P 3000 4550
AR Path="/5F03161D" Ref="U?"  Part="2" 
AR Path="/5EFCF155/5F03161D" Ref="U904"  Part="2" 
F 0 "U904" H 3125 4333 50  0000 C CNN
F 1 "74HC08" V 3170 4288 50  0001 L CNN
F 2 "" H 3200 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3200 4100 50  0001 C CNN
	2    3000 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 1 1 5F031623
P 3000 5000
AR Path="/5F031623" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031623" Ref="U904"  Part="1" 
F 0 "U904" H 3125 4425 50  0000 C CNN
F 1 "74HC08" H 3125 4334 50  0000 C CNN
F 2 "" H 3200 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3200 4550 50  0001 C CNN
	1    3000 5000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 2 1 5F031629
P 3850 4950
AR Path="/5F031629" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F031629" Ref="UU902"  Part="2" 
F 0 "UU902" H 3850 5025 50  0000 C CNN
F 1 "74HC32" H 3850 4934 50  0000 C CNN
F 2 "" H 3850 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3850 4950 50  0001 C CNN
	2    3850 4950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 1 1 5F03162F
P 3850 4100
AR Path="/5F03162F" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03162F" Ref="U902"  Part="1" 
F 0 "U902" H 3850 4175 50  0000 C CNN
F 1 "74HC32" H 3850 4084 50  0000 C CNN
F 2 "" H 3850 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3850 4100 50  0001 C CNN
	1    3850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4000 2900 4000
Wire Wire Line
	2900 4100 2450 4100
Wire Wire Line
	2900 4450 1700 4450
Wire Wire Line
	2900 4550 2350 4550
Wire Wire Line
	2900 4900 1700 4900
Wire Wire Line
	2900 5000 2250 5000
Wire Wire Line
	2900 5350 1700 5350
Wire Wire Line
	2900 5450 2150 5450
Wire Wire Line
	4300 4750 4250 4750
Wire Wire Line
	3550 4050 3350 4050
Wire Wire Line
	3600 4250 3550 4250
Wire Wire Line
	3550 4500 3550 4350
Wire Wire Line
	3550 5100 3600 5100
Wire Wire Line
	3550 4950 3550 5100
Wire Wire Line
	3350 4950 3550 4950
Wire Wire Line
	3550 5200 3600 5200
Wire Wire Line
	3550 5400 3550 5200
Wire Wire Line
	3350 5400 3550 5400
Wire Wire Line
	4250 4300 4100 4300
Wire Wire Line
	4250 4650 4250 4300
Wire Wire Line
	4300 4650 4250 4650
Wire Wire Line
	3550 4350 3600 4350
Wire Wire Line
	3350 4500 3550 4500
$Comp
L alexios:74AHC1G86 U?
U 1 1 5F03165A
P 5250 4550
AR Path="/5F03165A" Ref="U?"  Part="1" 
AR Path="/5EFCF155/5F03165A" Ref="U906"  Part="1" 
F 0 "U906" H 5250 4718 50  0000 C CNN
F 1 "74AHC1G86" H 5250 4627 50  0000 C CNN
F 2 "" H 5180 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5180 4850 50  0001 C CNN
	1    5250 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 3 1 5F031660
P 4550 4500
AR Path="/5F031660" Ref="U?"  Part="3" 
AR Path="/5EFCF155/5F031660" Ref="U902"  Part="3" 
F 0 "U902" H 4550 4575 50  0000 C CNN
F 1 "74HC32" H 4550 4484 50  0000 C CNN
F 2 "" H 4550 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4550 4500 50  0001 C CNN
	3    4550 4500
	1    0    0    -1  
$EndComp
Text HLabel 950  5800 0    50   Input ~ 0
~RESET
Text HLabel 950  6000 0    50   Input ~ 0
CLK4
Wire Wire Line
	950  2500 2350 2500
Text Label 5950 2800 1    50   ~ 0
FV
Text Label 5850 2800 1    50   ~ 0
FL
Text Label 5750 2800 1    50   ~ 0
FZ
Text Label 1000 2600 0    50   ~ 0
FN
Text Label 5650 2800 1    50   ~ 0
FN
Text Notes 7200 7000 0    197  ~ 39
Skip & Branch Unit
Wire Wire Line
	5500 4650 7400 4650
Wire Wire Line
	7000 5250 7400 5250
NoConn ~ 6850 7500
$Comp
L alexios:74HC32 U?
U 4 1 5F031645
P 6600 7300
AR Path="/5F031645" Ref="U?"  Part="4" 
AR Path="/5EFCF155/5F031645" Ref="U902"  Part="4" 
F 0 "U902" H 6600 7375 50  0000 C CNN
F 1 "74HC32" H 6600 7284 50  0000 C CNN
F 2 "" H 6600 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6600 7300 50  0001 C CNN
	4    6600 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0801
U 1 1 60F285BC
P 6350 7350
F 0 "#PWR0801" H 6350 7200 50  0001 C CNN
F 1 "+5V" H 6365 7523 50  0000 C CNN
F 2 "" H 6350 7350 50  0001 C CNN
F 3 "" H 6350 7350 50  0001 C CNN
	1    6350 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 7350 6350 7450
Connection ~ 6350 7450
Wire Wire Line
	6350 7450 6350 7550
$Comp
L alexios:74LVC1G332 U801
U 2 1 60F5E3DD
P 4100 6500
F 0 "U801" H 4180 6346 50  0000 L CNN
F 1 "74LVC1G332" H 4180 6255 50  0000 L CNN
F 2 "" H 5000 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5000 6550 50  0001 C CNN
	2    4100 6500
	1    0    0    -1  
$EndComp
Connection ~ 3650 6800
Connection ~ 3650 6600
$Comp
L alexios:74AHC1G04 U?
U 2 1 60F742A0
P 10200 4800
AR Path="/60F742A0" Ref="U?"  Part="1" 
AR Path="/5EFCF155/60F742A0" Ref="U910"  Part="2" 
F 0 "U910" H 10380 4846 50  0000 L CNN
F 1 "74AHC1G04" H 10380 4755 50  0000 L CNN
F 2 "" H 10200 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 10200 4800 50  0001 C CNN
	2    10200 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60F76FC9
P 9850 4800
AR Path="/5CC0D65F/60F76FC9" Ref="C?"  Part="1" 
AR Path="/60F76FC9" Ref="C?"  Part="1" 
AR Path="/5EFCF155/60F76FC9" Ref="C301"  Part="1" 
F 0 "C301" H 9759 4846 50  0000 R CNN
F 1 "100nF" H 9759 4755 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9850 4800 50  0001 C CNN
F 3 "~" H 9850 4800 50  0001 C CNN
	1    9850 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0301
U 1 1 60F7E713
P 9850 4700
F 0 "#PWR0301" H 9850 4550 50  0001 C CNN
F 1 "+5V" H 9865 4873 50  0000 C CNN
F 2 "" H 9850 4700 50  0001 C CNN
F 3 "" H 9850 4700 50  0001 C CNN
	1    9850 4700
	1    0    0    -1  
$EndComp
Connection ~ 9850 4700
$Comp
L power:GND #PWR0302
U 1 1 60F7F6B2
P 9850 4900
F 0 "#PWR0302" H 9850 4650 50  0001 C CNN
F 1 "GND" H 9855 4727 50  0000 C CNN
F 2 "" H 9850 4900 50  0001 C CNN
F 3 "" H 9850 4900 50  0001 C CNN
	1    9850 4900
	1    0    0    -1  
$EndComp
Connection ~ 9850 4900
Wire Wire Line
	7400 1900 7100 1900
Text Label 6100 5150 1    50   ~ 0
COND[0..3]
$Comp
L Device:R_Small R?
U 1 1 5DEA3C4B
P 7000 3950
AR Path="/5DEA3C4B" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEA3C4B" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5DEA3C4B" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5DEA3C4B" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5DEA3C4B" Ref="R?"  Part="1" 
F 0 "R?" V 6804 3950 50  0000 C CNN
F 1 "10kΩ" V 6895 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7000 3950 50  0001 C CNN
F 3 "~" H 7000 3950 50  0001 C CNN
	1    7000 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	7400 3950 7100 3950
Wire Wire Line
	6900 3950 6800 3950
Wire Wire Line
	6800 3950 6800 4050
Text Label 6500 2000 0    50   ~ 0
IR0
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
$Comp
L Device:R_Small R?
U 1 1 5DEC44AB
P 7000 4550
AR Path="/5DEC44AB" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5DEC44AB" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5DEC44AB" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5DEC44AB" Ref="R?"  Part="1" 
AR Path="/5EFCF155/5DEC44AB" Ref="R?"  Part="1" 
F 0 "R?" V 6800 4550 50  0000 C CNN
F 1 "10kΩ" V 6900 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7000 4550 50  0001 C CNN
F 3 "~" H 7000 4550 50  0001 C CNN
	1    7000 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	7400 4550 7100 4550
Wire Wire Line
	6900 4550 6800 4550
Wire Wire Line
	6800 4550 6800 4050
Connection ~ 6800 4050
Text Notes 7900 4900 1    50   ~ 10
TODO: Rearrange these?
Text Notes 6400 3500 0    50   ~ 0
TODO: add a gate here to avoid hazards\nbecause of ~COND3~ below?
Text Notes 2650 950  0    197  ~ 39
Under Review! DO NOT IMPLEMENT
Text Notes 7550 1450 0    50   ~ 10
TODO: Check inversions here! E.g when IR0=1, we want to output 0!
$Comp
L power:GND #PWR?
U 1 1 5DF0BAC9
P 7100 1900
F 0 "#PWR?" H 7100 1650 50  0001 C CNN
F 1 "GND" V 7105 1772 50  0000 R CNN
F 2 "" H 7100 1900 50  0001 C CNN
F 3 "" H 7100 1900 50  0001 C CNN
	1    7100 1900
	0    1    1    0   
$EndComp
Connection ~ 9150 2000
Wire Wire Line
	9150 2000 9150 4800
Wire Wire Line
	9150 1000 9150 2000
NoConn ~ 8400 1900
Connection ~ 8950 4050
Wire Wire Line
	8950 4050 8950 4800
Wire Wire Line
	8950 3850 8950 4050
NoConn ~ 8400 3950
Wire Wire Line
	6800 4550 6800 5450
Connection ~ 6800 4550
$Comp
L power:GND #PWR?
U 1 1 5DF4CE9C
P 6800 5450
F 0 "#PWR?" H 6800 5200 50  0001 C CNN
F 1 "GND" H 6805 5277 50  0000 C CNN
F 2 "" H 6800 5450 50  0001 C CNN
F 3 "" H 6800 5450 50  0001 C CNN
	1    6800 5450
	1    0    0    -1  
$EndComp
Wire Bus Line
	950  1500 6100 1500
Wire Bus Line
	6200 1600 6200 2500
Wire Bus Line
	1600 1600 1600 5250
Wire Bus Line
	6100 2100 6100 5150
$EndSCHEMATC
