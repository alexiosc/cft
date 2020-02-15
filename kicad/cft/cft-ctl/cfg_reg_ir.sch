EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 11
Title "Instruction Register (IR)"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "reg_Ir.v"
$EndDescr
$Comp
L alexios:74HC573 U?
U 2 1 5F6441DB
P 3000 6950
AR Path="/5F4B0011/5F6441DB" Ref="U?"  Part="2" 
AR Path="/5F63066B/5F6441DB" Ref="U12"  Part="2" 
F 0 "U12" H 3030 7396 50  0000 L CNN
F 1 "74HC573" H 3030 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3000 6950 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 3000 6950 50  0001 C CNN
	2    3000 6950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC573 U?
U 2 1 5F6441E1
P 3000 7700
AR Path="/5F4B0011/5F6441E1" Ref="U?"  Part="2" 
AR Path="/5F63066B/5F6441E1" Ref="U33"  Part="2" 
F 0 "U33" H 3030 8146 50  0000 L CNN
F 1 "74HC573" H 3030 8055 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3000 7700 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 3000 7700 50  0001 C CNN
	2    3000 7700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F6441E7
P 2500 6450
AR Path="/5F4B0011/5F6441E7" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6441E7" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 2500 6300 50  0001 C CNN
F 1 "+5V" H 2515 6623 50  0000 C CNN
F 2 "" H 2500 6450 50  0001 C CNN
F 3 "" H 2500 6450 50  0001 C CNN
	1    2500 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6441ED
P 2500 6650
AR Path="/5F6441ED" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F6441ED" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6441ED" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 2500 6400 50  0001 C CNN
F 1 "GND" H 2505 6477 50  0000 C CNN
F 2 "" H 2500 6650 50  0001 C CNN
F 3 "" H 2500 6650 50  0001 C CNN
	1    2500 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F6441F3
P 2500 6550
AR Path="/5CC0D65F/5F6441F3" Ref="C?"  Part="1" 
AR Path="/5F6441F3" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F6441F3" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F6441F3" Ref="C11"  Part="1" 
F 0 "C11" H 2409 6596 50  0000 R CNN
F 1 "100nF" H 2409 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 6550 50  0001 C CNN
F 3 "~" H 2500 6550 50  0001 C CNN
	1    2500 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F6441F9
P 2500 7200
AR Path="/5F4B0011/5F6441F9" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6441F9" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 2500 7050 50  0001 C CNN
F 1 "+5V" H 2515 7373 50  0000 C CNN
F 2 "" H 2500 7200 50  0001 C CNN
F 3 "" H 2500 7200 50  0001 C CNN
	1    2500 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6441FF
P 2500 7400
AR Path="/5F6441FF" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F6441FF" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6441FF" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 2500 7150 50  0001 C CNN
F 1 "GND" H 2505 7227 50  0000 C CNN
F 2 "" H 2500 7400 50  0001 C CNN
F 3 "" H 2500 7400 50  0001 C CNN
	1    2500 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F644205
P 2500 7300
AR Path="/5CC0D65F/5F644205" Ref="C?"  Part="1" 
AR Path="/5F644205" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F644205" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F644205" Ref="C13"  Part="1" 
F 0 "C13" H 2409 7346 50  0000 R CNN
F 1 "100nF" H 2409 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 7300 50  0001 C CNN
F 3 "~" H 2500 7300 50  0001 C CNN
	1    2500 7300
	1    0    0    -1  
$EndComp
Connection ~ 2500 6650
Connection ~ 2500 6450
Connection ~ 2500 7400
Connection ~ 2500 7200
$Comp
L power:+5V #PWR?
U 1 1 5F64420F
P 3850 6450
AR Path="/5F4B0011/5F64420F" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64420F" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 3850 6300 50  0001 C CNN
F 1 "+5V" H 3865 6623 50  0000 C CNN
F 2 "" H 3850 6450 50  0001 C CNN
F 3 "" H 3850 6450 50  0001 C CNN
	1    3850 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F644215
P 3850 6650
AR Path="/5F644215" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F644215" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644215" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 3850 6400 50  0001 C CNN
F 1 "GND" H 3855 6477 50  0000 C CNN
F 2 "" H 3850 6650 50  0001 C CNN
F 3 "" H 3850 6650 50  0001 C CNN
	1    3850 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F64421B
P 3850 6550
AR Path="/5CC0D65F/5F64421B" Ref="C?"  Part="1" 
AR Path="/5F64421B" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F64421B" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F64421B" Ref="C12"  Part="1" 
F 0 "C12" H 3759 6596 50  0000 R CNN
F 1 "100nF" H 3759 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3850 6550 50  0001 C CNN
F 3 "~" H 3850 6550 50  0001 C CNN
	1    3850 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F644221
P 3850 7200
AR Path="/5F4B0011/5F644221" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644221" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 3850 7050 50  0001 C CNN
F 1 "+5V" H 3865 7373 50  0000 C CNN
F 2 "" H 3850 7200 50  0001 C CNN
F 3 "" H 3850 7200 50  0001 C CNN
	1    3850 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F644227
P 3850 7400
AR Path="/5F644227" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F644227" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644227" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 3850 7150 50  0001 C CNN
F 1 "GND" H 3855 7227 50  0000 C CNN
F 2 "" H 3850 7400 50  0001 C CNN
F 3 "" H 3850 7400 50  0001 C CNN
	1    3850 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F64422D
P 3850 7300
AR Path="/5CC0D65F/5F64422D" Ref="C?"  Part="1" 
AR Path="/5F64422D" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F64422D" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F64422D" Ref="C14"  Part="1" 
F 0 "C14" H 3759 7346 50  0000 R CNN
F 1 "100nF" H 3759 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3850 7300 50  0001 C CNN
F 3 "~" H 3850 7300 50  0001 C CNN
	1    3850 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5F644233
P 7850 3500
AR Path="/5F4B0011/5F644233" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644233" Ref="U11"  Part="1" 
F 0 "U11" H 7850 4267 50  0000 C CNN
F 1 "74HC541" H 7850 4176 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7850 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 7850 3500 50  0001 C CNN
	1    7850 3500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5F644239
P 7850 5100
AR Path="/5F4B0011/5F644239" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644239" Ref="U14"  Part="1" 
F 0 "U14" H 7850 5867 50  0000 C CNN
F 1 "74HC541" H 7850 5776 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7850 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 7850 5100 50  0001 C CNN
	1    7850 5100
	1    0    0    -1  
$EndComp
Text Label 4650 4000 3    50   ~ 0
IBUS[0..15]
Wire Wire Line
	5300 3000 4750 3000
Wire Wire Line
	5300 3100 4750 3100
Wire Wire Line
	5300 3200 4750 3200
Wire Wire Line
	5300 3300 4750 3300
Wire Wire Line
	5300 3400 4750 3400
Wire Wire Line
	5300 3500 4750 3500
Wire Wire Line
	5300 3600 4750 3600
Wire Wire Line
	5300 3700 4750 3700
Wire Wire Line
	5300 4600 4750 4600
Wire Wire Line
	5300 4700 4750 4700
Wire Wire Line
	5300 4800 4750 4800
Wire Wire Line
	5300 4900 4750 4900
Wire Wire Line
	5300 5000 4750 5000
Wire Wire Line
	5300 5100 4750 5100
Wire Wire Line
	5300 5200 4750 5200
Wire Wire Line
	5300 5300 4750 5300
Wire Wire Line
	5300 5600 5250 5600
Entry Wire Line
	4650 2900 4750 3000
Entry Wire Line
	4650 3000 4750 3100
Entry Wire Line
	4650 3100 4750 3200
Entry Wire Line
	4650 3200 4750 3300
Entry Wire Line
	4650 3300 4750 3400
Entry Wire Line
	4650 3400 4750 3500
Entry Wire Line
	4650 3500 4750 3600
Entry Wire Line
	4650 3600 4750 3700
Entry Wire Line
	4650 4500 4750 4600
Entry Wire Line
	4650 4600 4750 4700
Entry Wire Line
	4650 4700 4750 4800
Entry Wire Line
	4650 4800 4750 4900
Entry Wire Line
	4650 4900 4750 5000
Entry Wire Line
	4650 5000 4750 5100
Entry Wire Line
	4650 5100 4750 5200
Entry Wire Line
	4650 5200 4750 5300
Text Label 4800 3000 0    50   ~ 0
IBUS0
Text Label 4800 3100 0    50   ~ 0
IBUS1
Text Label 4800 3200 0    50   ~ 0
IBUS2
Text Label 4800 3300 0    50   ~ 0
IBUS3
Text Label 4800 3400 0    50   ~ 0
IBUS4
Text Label 4800 3500 0    50   ~ 0
IBUS5
Text Label 4800 3600 0    50   ~ 0
IBUS6
Text Label 4800 3700 0    50   ~ 0
IBUS7
Text Label 4800 4600 0    50   ~ 0
IBUS8
Text Label 4800 4700 0    50   ~ 0
IBUS9
Text Label 4800 4800 0    50   ~ 0
IBUS10
Text Label 4800 4900 0    50   ~ 0
IBUS11
Text Label 4800 5000 0    50   ~ 0
IBUS12
Text Label 4800 5100 0    50   ~ 0
IBUS13
Text Label 4800 5200 0    50   ~ 0
IBUS14
Text Label 4800 5300 0    50   ~ 0
IBUS15
Wire Wire Line
	6300 3000 6600 3000
Wire Wire Line
	6300 3100 6600 3100
Wire Wire Line
	6300 3200 6600 3200
Wire Wire Line
	6300 3300 6600 3300
Wire Wire Line
	6300 3400 6600 3400
Wire Wire Line
	6300 3500 6600 3500
Wire Wire Line
	6300 3600 6600 3600
Wire Wire Line
	6300 3700 6600 3700
Wire Wire Line
	6300 4600 6600 4600
Wire Wire Line
	6300 4700 6600 4700
Wire Wire Line
	6300 4800 6600 4800
Wire Wire Line
	6300 4900 6600 4900
Wire Wire Line
	6300 5000 6600 5000
Wire Wire Line
	6300 5100 6600 5100
Wire Wire Line
	6300 5200 6600 5200
Wire Wire Line
	6300 5300 6600 5300
Text Label 6350 3000 0    50   ~ 0
IR0
Text Label 6350 3100 0    50   ~ 0
IR1
Text Label 6350 3200 0    50   ~ 0
IR2
Text Label 6350 3300 0    50   ~ 0
IR3
Text Label 6350 3400 0    50   ~ 0
IR4
Text Label 6350 3500 0    50   ~ 0
IR5
Text Label 6350 3600 0    50   ~ 0
IR6
Text Label 6350 3700 0    50   ~ 0
IR7
Text Label 6350 4600 0    50   ~ 0
IR8
Text Label 6350 4700 0    50   ~ 0
IR9
Text Label 6350 4800 0    50   ~ 0
IR10
Text Label 6350 4900 0    50   ~ 0
IR11
Text Label 6350 5000 0    50   ~ 0
IR12
Text Label 6350 5100 0    50   ~ 0
IR13
Text Label 6350 5200 0    50   ~ 0
IR14
Text Label 6350 5300 0    50   ~ 0
IR15
Text Label 7100 3000 0    50   ~ 0
IR0
Text Label 7100 3100 0    50   ~ 0
IR1
Text Label 7100 3200 0    50   ~ 0
IR2
Text Label 7100 3300 0    50   ~ 0
IR3
Text Label 7100 3400 0    50   ~ 0
IR4
Text Label 7100 3500 0    50   ~ 0
IR5
Text Label 7100 3600 0    50   ~ 0
IR6
Text Label 7100 3700 0    50   ~ 0
IR7
Text Label 7100 4600 0    50   ~ 0
IR8
Text Label 7100 4700 0    50   ~ 0
IR9
Text Label 6700 4350 1    50   ~ 0
IR[0..15]
Wire Wire Line
	8350 3000 8650 3000
Wire Wire Line
	8350 3100 8650 3100
Wire Wire Line
	8350 3200 8650 3200
Wire Wire Line
	8350 3300 8650 3300
Wire Wire Line
	8350 3400 8650 3400
Wire Wire Line
	8350 3500 8650 3500
Wire Wire Line
	8350 3600 8650 3600
Wire Wire Line
	8350 3700 8650 3700
Entry Wire Line
	8650 3000 8750 3100
Entry Wire Line
	8650 3100 8750 3200
Entry Wire Line
	8650 3200 8750 3300
Entry Wire Line
	8650 3300 8750 3400
Entry Wire Line
	8650 3400 8750 3500
Entry Wire Line
	8650 3500 8750 3600
Entry Wire Line
	8650 3600 8750 3700
Entry Wire Line
	8650 3700 8750 3800
Wire Wire Line
	8350 4600 8650 4600
Wire Wire Line
	8350 4700 8650 4700
Wire Wire Line
	8350 4800 8650 4800
Wire Wire Line
	8350 4900 8650 4900
Wire Wire Line
	8350 5000 8650 5000
Wire Wire Line
	8350 5100 8650 5100
Wire Wire Line
	8350 5200 8650 5200
Wire Wire Line
	8350 5300 8650 5300
Entry Wire Line
	8650 4600 8750 4700
Entry Wire Line
	8650 4700 8750 4800
Entry Wire Line
	8650 4800 8750 4900
Entry Wire Line
	8650 4900 8750 5000
Entry Wire Line
	8650 5000 8750 5100
Entry Wire Line
	8650 5100 8750 5200
Entry Wire Line
	8650 5200 8750 5300
Entry Wire Line
	8650 5300 8750 5400
Text Label 8750 4350 1    50   ~ 0
FPO[0..7]
$Comp
L power:GND #PWR?
U 1 1 5F6442FF
P 7300 5650
AR Path="/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6442FF" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 7300 5400 50  0001 C CNN
F 1 "GND" H 7305 5477 50  0000 C CNN
F 2 "" H 7300 5650 50  0001 C CNN
F 3 "" H 7300 5650 50  0001 C CNN
	1    7300 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F64430B
P 7300 4050
AR Path="/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64430B" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 7300 3800 50  0001 C CNN
F 1 "GND" H 7305 3877 50  0000 C CNN
F 2 "" H 7300 4050 50  0001 C CNN
F 3 "" H 7300 4050 50  0001 C CNN
	1    7300 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4000 7300 4000
Wire Wire Line
	7300 4000 7300 4050
Wire Wire Line
	7350 5600 7300 5600
Wire Wire Line
	7300 5600 7300 5650
Text Label 7100 3900 0    50   ~ 0
~FPIRL
Text Label 7100 5500 0    50   ~ 0
~FPIRH
$Comp
L power:GND #PWR?
U 1 1 5F64431F
P 5300 4050
AR Path="/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64431F" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 5300 3800 50  0001 C CNN
F 1 "GND" H 5305 3877 50  0000 C CNN
F 2 "" H 5300 4050 50  0001 C CNN
F 3 "" H 5300 4050 50  0001 C CNN
	1    5300 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4000 5300 4050
$Comp
L power:GND #PWR?
U 1 1 5F64432C
P 5250 5650
AR Path="/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64432C" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 5250 5400 50  0001 C CNN
F 1 "GND" H 5255 5477 50  0000 C CNN
F 2 "" H 5250 5650 50  0001 C CNN
F 3 "" H 5250 5650 50  0001 C CNN
	1    5250 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5600 5250 5650
Wire Bus Line
	1200 2700 4550 2700
Entry Bus Bus
	4550 2700 4650 2800
Text Label 1250 2700 0    50   ~ 0
IBUS[0..15]
Text HLabel 1200 2700 0    50   3State ~ 0
IBUS[0..15]
Entry Bus Bus
	8750 5600 8850 5700
Wire Bus Line
	8850 5700 9450 5700
Text Label 9350 5700 2    50   ~ 0
FPD[0..7]
Text HLabel 9450 5700 2    50   3State ~ 0
FPD[0..7]
Entry Bus Bus
	6700 6050 6800 6150
Text Label 9350 6150 2    50   ~ 0
IR[0..15]
Text HLabel 9450 6150 2    50   BiDi ~ 0
IR[0..15]
Entry Wire Line
	6600 3000 6700 3100
Entry Wire Line
	6600 3100 6700 3200
Entry Wire Line
	6600 3200 6700 3300
Entry Wire Line
	6600 3300 6700 3400
Entry Wire Line
	6600 3400 6700 3500
Entry Wire Line
	6600 3500 6700 3600
Entry Wire Line
	6600 3600 6700 3700
Entry Wire Line
	6600 3700 6700 3800
Entry Wire Line
	6600 4600 6700 4700
Entry Wire Line
	6600 4700 6700 4800
Entry Wire Line
	6600 4800 6700 4900
Entry Wire Line
	6600 4900 6700 5000
Entry Wire Line
	6600 5000 6700 5100
Entry Wire Line
	6600 5100 6700 5200
Entry Wire Line
	6600 5200 6700 5300
Entry Wire Line
	6600 5300 6700 5400
Entry Wire Line
	6700 3100 6800 3000
Entry Wire Line
	6700 3200 6800 3100
Entry Wire Line
	6700 3300 6800 3200
Entry Wire Line
	6700 3400 6800 3300
Entry Wire Line
	6700 3500 6800 3400
Entry Wire Line
	6700 3600 6800 3500
Entry Wire Line
	6700 3700 6800 3600
Entry Wire Line
	6700 3800 6800 3700
Entry Wire Line
	6700 4700 6800 4600
Entry Wire Line
	6700 4800 6800 4700
Entry Wire Line
	6700 4900 6800 4800
Entry Wire Line
	6700 5000 6800 4900
Entry Wire Line
	6700 5100 6800 5000
Entry Wire Line
	6700 5200 6800 5100
Entry Wire Line
	6700 5300 6800 5200
Entry Wire Line
	6700 5400 6800 5300
Wire Wire Line
	4500 5500 4500 4700
Wire Wire Line
	4500 5500 5300 5500
Wire Wire Line
	4500 3900 5300 3900
$Comp
L Device:C_Small C?
U 1 1 5F64437B
P 1050 6550
AR Path="/5CC0D65F/5F64437B" Ref="C?"  Part="1" 
AR Path="/5F64437B" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F64437B" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F64437B" Ref="C10"  Part="1" 
F 0 "C10" H 959 6596 50  0000 R CNN
F 1 "100nF" H 959 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 6550 50  0001 C CNN
F 3 "~" H 1050 6550 50  0001 C CNN
	1    1050 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F644381
P 1050 6450
AR Path="/5F4B0011/5F644381" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644381" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 1050 6300 50  0001 C CNN
F 1 "+5V" H 1065 6623 50  0000 C CNN
F 2 "" H 1050 6450 50  0001 C CNN
F 3 "" H 1050 6450 50  0001 C CNN
	1    1050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F644388
P 1050 6650
AR Path="/5F644388" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F644388" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644388" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 1050 6400 50  0001 C CNN
F 1 "GND" H 1055 6477 50  0000 C CNN
F 2 "" H 1050 6650 50  0001 C CNN
F 3 "" H 1050 6650 50  0001 C CNN
	1    1050 6650
	1    0    0    -1  
$EndComp
Text Label 1250 2350 0    50   ~ 0
~FPIRL
Text Label 1250 2450 0    50   ~ 0
~FPIRH
Text HLabel 1200 2350 0    50   Input ~ 0
~FPIRL
Text HLabel 1200 2450 0    50   Input ~ 0
~FPIRH
Text Label 7100 5300 0    50   ~ 0
IR15
Text Label 7100 5200 0    50   ~ 0
IR14
Text Label 7100 5100 0    50   ~ 0
IR13
Text Label 7100 5000 0    50   ~ 0
IR12
Text Label 7100 4900 0    50   ~ 0
IR11
Text Label 7100 4800 0    50   ~ 0
IR10
Wire Bus Line
	6800 6150 9450 6150
Wire Wire Line
	6900 2450 6900 5500
Wire Wire Line
	6900 5500 7350 5500
Wire Wire Line
	1200 2450 6900 2450
Wire Wire Line
	7000 2350 7000 3900
Wire Wire Line
	7000 3900 7350 3900
Wire Wire Line
	1200 2350 7000 2350
Wire Wire Line
	7350 4600 6800 4600
Wire Wire Line
	7350 4700 6800 4700
Wire Wire Line
	7350 4800 6800 4800
Wire Wire Line
	7350 4900 6800 4900
Wire Wire Line
	7350 5000 6800 5000
Wire Wire Line
	7350 5100 6800 5100
Wire Wire Line
	7350 5200 6800 5200
Wire Wire Line
	7350 5300 6800 5300
Wire Wire Line
	7350 3000 6800 3000
Wire Wire Line
	7350 3100 6800 3100
Wire Wire Line
	7350 3200 6800 3200
Wire Wire Line
	7350 3300 6800 3300
Wire Wire Line
	7350 3400 6800 3400
Wire Wire Line
	7350 3500 6800 3500
Wire Wire Line
	7350 3600 6800 3600
Wire Wire Line
	7350 3700 6800 3700
Text Label 8400 3000 0    50   ~ 0
FPD0
Text Label 8400 3100 0    50   ~ 0
FPD1
Text Label 8400 3200 0    50   ~ 0
FPD2
Text Label 8400 3300 0    50   ~ 0
FPD3
Text Label 8400 3400 0    50   ~ 0
FPD4
Text Label 8400 3500 0    50   ~ 0
FPD5
Text Label 8400 3600 0    50   ~ 0
FPD6
Text Label 8400 3700 0    50   ~ 0
FPD7
Text Label 8400 4600 0    50   ~ 0
FPD0
Text Label 8400 4700 0    50   ~ 0
FPD1
Text Label 8400 4800 0    50   ~ 0
FPD2
Text Label 8400 4900 0    50   ~ 0
FPD3
Text Label 8400 5000 0    50   ~ 0
FPD4
Text Label 8400 5100 0    50   ~ 0
FPD5
Text Label 8400 5200 0    50   ~ 0
FPD6
Text Label 8400 5300 0    50   ~ 0
FPD7
Text Notes 2950 4300 1    50   ~ 10
WADDR=00010
Text HLabel 1200 3300 0    50   3State ~ 0
WADDR[4..0]
Text Label 1300 3300 0    50   ~ 0
WADDR[4..0]
Wire Bus Line
	1200 3300 1800 3300
Entry Bus Bus
	1800 3300 1900 3400
Entry Wire Line
	1900 4350 2000 4450
Entry Wire Line
	1900 4250 2000 4350
Entry Wire Line
	1900 3750 2000 3850
Entry Wire Line
	1900 3650 2000 3750
Entry Wire Line
	1900 3550 2000 3650
Text HLabel 1200 4750 0    50   Input ~ 0
CLK4
Text Label 2050 4450 0    50   ~ 0
WADDR4
Text Label 2050 4350 0    50   ~ 0
WADDR3
Text Label 2050 3850 0    50   ~ 0
WADDR2
Text Label 2050 3750 0    50   ~ 0
WADDR1
Text Label 2050 3650 0    50   ~ 0
WADDR0
Text Label 1250 4750 0    50   ~ 0
CLK4
Wire Wire Line
	2400 4350 2000 4350
Wire Wire Line
	2400 4450 2000 4450
Wire Wire Line
	2400 3850 2000 3850
Wire Wire Line
	2400 3750 2000 3750
Wire Wire Line
	2400 3650 2000 3650
NoConn ~ 3400 3650
NoConn ~ 3400 3950
NoConn ~ 3400 4050
NoConn ~ 3400 4150
NoConn ~ 3400 4250
NoConn ~ 3400 4350
$Comp
L alexios:74HC574 U12
U 1 1 61409CF5
P 5800 3500
F 0 "U12" H 5800 4267 50  0000 C CNN
F 1 "74HC574" H 5800 4176 50  0000 C CNN
F 2 "" H 5500 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 5500 3450 50  0001 C CNN
F 4 "Yes" H 5650 2550 50  0001 C CNN "Verified"
	1    5800 3500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U33
U 1 1 6140A7F8
P 5800 5100
F 0 "U33" H 5800 5867 50  0000 C CNN
F 1 "74HC574" H 5800 5776 50  0000 C CNN
F 2 "" H 5500 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 5500 5050 50  0001 C CNN
F 4 "Yes" H 5650 4150 50  0001 C CNN "Verified"
	1    5800 5100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U33
U 2 1 6140C507
P 4200 7300
F 0 "U33" H 4380 7346 50  0000 L CNN
F 1 "74HC574" H 4380 7255 50  0000 L CNN
F 2 "" H 3900 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 3900 7250 50  0001 C CNN
F 4 "Yes" H 4050 6350 50  0001 C CNN "Verified"
	2    4200 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U12
U 2 1 6140CC9F
P 4200 6550
F 0 "U12" H 4380 6596 50  0000 L CNN
F 1 "74HC574" H 4380 6505 50  0000 L CNN
F 2 "" H 3900 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 3900 6500 50  0001 C CNN
F 4 "Yes" H 4050 5600 50  0001 C CNN "Verified"
	2    4200 6550
	1    0    0    -1  
$EndComp
Connection ~ 3850 6650
Connection ~ 3850 6450
Connection ~ 3850 7400
Connection ~ 3850 7200
Text Label 4800 3900 0    50   ~ 0
~WRITE-IR
Text Label 4800 5500 0    50   ~ 0
~WRITE-IR
$Comp
L alexios:74HC138 U23
U 1 1 61410578
P 2900 4050
F 0 "U23" H 2900 4717 50  0000 C CNN
F 1 "74HC138" H 2900 4626 50  0000 C CNN
F 2 "" H 2900 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2900 4050 50  0001 C CNN
F 4 "Yes" H 2825 3225 50  0001 C CNN "Verified"
	1    2900 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U23
U 2 1 61411009
P 1400 6550
F 0 "U23" H 1580 6596 50  0000 L CNN
F 1 "74HC138" H 1580 6505 50  0000 L CNN
F 2 "" H 1400 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1400 6550 50  0001 C CNN
F 4 "Yes" H 1325 5725 50  0001 C CNN "Verified"
	2    1400 6550
	1    0    0    -1  
$EndComp
Connection ~ 1050 6450
Connection ~ 1050 6650
Wire Wire Line
	4350 4700 4500 4700
Connection ~ 4500 4700
Wire Wire Line
	4500 4700 4500 3900
Wire Wire Line
	3400 3850 3650 3850
Wire Wire Line
	3650 4650 3850 4650
Wire Wire Line
	3850 4750 1200 4750
Wire Wire Line
	2400 4250 2350 4250
Wire Wire Line
	2350 4250 2350 4200
$Comp
L power:+5V #PWR?
U 1 1 614409DB
P 2350 4200
F 0 "#PWR?" H 2350 4050 50  0001 C CNN
F 1 "+5V" H 2365 4373 50  0000 C CNN
F 2 "" H 2350 4200 50  0001 C CNN
F 3 "" H 2350 4200 50  0001 C CNN
	1    2350 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6144DE30
P 1050 7300
AR Path="/5CC0D65F/6144DE30" Ref="C?"  Part="1" 
AR Path="/6144DE30" Ref="C?"  Part="1" 
AR Path="/5F4B0011/6144DE30" Ref="C?"  Part="1" 
AR Path="/5F63066B/6144DE30" Ref="C?"  Part="1" 
F 0 "C?" H 959 7346 50  0000 R CNN
F 1 "100nF" H 959 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 7300 50  0001 C CNN
F 3 "~" H 1050 7300 50  0001 C CNN
	1    1050 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6144DE36
P 1050 7200
AR Path="/5F4B0011/6144DE36" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/6144DE36" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1050 7050 50  0001 C CNN
F 1 "+5V" H 1065 7373 50  0000 C CNN
F 2 "" H 1050 7200 50  0001 C CNN
F 3 "" H 1050 7200 50  0001 C CNN
	1    1050 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6144DE3C
P 1050 7400
AR Path="/6144DE3C" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/6144DE3C" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/6144DE3C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1050 7150 50  0001 C CNN
F 1 "GND" H 1055 7227 50  0000 C CNN
F 2 "" H 1050 7400 50  0001 C CNN
F 3 "" H 1050 7400 50  0001 C CNN
	1    1050 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U?
U 1 1 61458F47
P 4050 4700
F 0 "U?" H 4100 4967 50  0000 C CNN
F 1 "74LVC1G32" H 4100 4876 50  0000 C CNN
F 2 "" H 4160 4680 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4160 4680 50  0001 C CNN
	1    4050 4700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U?
U 2 1 61464092
P 1450 7050
F 0 "U?" H 1580 6846 50  0000 L CNN
F 1 "74LVC1G32" H 1580 6755 50  0000 L CNN
F 2 "" H 1560 7030 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1560 7030 50  0001 C CNN
	2    1450 7050
	1    0    0    -1  
$EndComp
Connection ~ 1050 7400
Connection ~ 1050 7200
Wire Wire Line
	3650 3850 3650 4650
NoConn ~ 3400 3750
Text Notes 950  2100 0    50   ~ 0
The IR is a minor write-only register, and an integral part of the Control Unit. It holds the instruction being\nexecuted. It is written to from the IBus when WADDR is 00010. Data is clocked on the rising edge of CLK4,\nas with all writable units.\n\nIt's configured to output permanently, and its outputs are routed to the Control Store, where it is\ninterpreted. Parts of the IR are also routed off-board because they need to be intepreted by other units,\nlike the Memory Banking Unit (MBU).\n\nFor something as crucial as this, the design is trivial.\n\nThe IR has a couple of front panel buffers so it can be read by the DFP and displayed on the front panel.
Text Notes 950  1050 0    98   ~ 20
The Instruction Register
Wire Bus Line
	1900 3400 1900 4350
Wire Bus Line
	6700 3100 6700 6050
Wire Bus Line
	8750 3100 8750 5600
Wire Bus Line
	4650 2800 4650 5200
$EndSCHEMATC
