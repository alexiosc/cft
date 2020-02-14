EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 13 12
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
AR Path="/5F63066B/5F6441DB" Ref="U10"  Part="2" 
F 0 "U10" H 3030 7396 50  0000 L CNN
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
AR Path="/5F63066B/5F6441E1" Ref="U13"  Part="2" 
F 0 "U13" H 3030 8146 50  0000 L CNN
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
P 7850 3000
AR Path="/5F4B0011/5F644233" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644233" Ref="U11"  Part="1" 
F 0 "U11" H 7850 3767 50  0000 C CNN
F 1 "74HC541" H 7850 3676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7850 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 7850 3000 50  0001 C CNN
	1    7850 3000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5F644239
P 7850 4600
AR Path="/5F4B0011/5F644239" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644239" Ref="U14"  Part="1" 
F 0 "U14" H 7850 5367 50  0000 C CNN
F 1 "74HC541" H 7850 5276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7850 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 7850 4600 50  0001 C CNN
	1    7850 4600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5F64423F
P 4200 6550
AR Path="/5F4B0011/5F64423F" Ref="U?"  Part="2" 
AR Path="/5F63066B/5F64423F" Ref="U11"  Part="2" 
F 0 "U11" H 4380 6596 50  0000 L CNN
F 1 "74HC541" H 4380 6505 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4200 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 4200 6550 50  0001 C CNN
	2    4200 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5F644245
P 4200 7300
AR Path="/5F4B0011/5F644245" Ref="U?"  Part="2" 
AR Path="/5F63066B/5F644245" Ref="U14"  Part="2" 
F 0 "U14" H 4380 7346 50  0000 L CNN
F 1 "74HC541" H 4380 7255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4200 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 4200 7300 50  0001 C CNN
	2    4200 7300
	1    0    0    -1  
$EndComp
Connection ~ 3850 6650
Connection ~ 3850 6450
Connection ~ 3850 7400
Connection ~ 3850 7200
Text Label 4650 3500 3    50   ~ 0
IBUS[0..15]
Wire Wire Line
	5300 2500 4750 2500
Wire Wire Line
	5300 2600 4750 2600
Wire Wire Line
	5300 2700 4750 2700
Wire Wire Line
	5300 2800 4750 2800
Wire Wire Line
	5300 2900 4750 2900
Wire Wire Line
	5300 3000 4750 3000
Wire Wire Line
	5300 3100 4750 3100
Wire Wire Line
	5300 3200 4750 3200
Wire Wire Line
	5300 4100 4750 4100
Wire Wire Line
	5300 4200 4750 4200
Wire Wire Line
	5300 4300 4750 4300
Wire Wire Line
	5300 4400 4750 4400
Wire Wire Line
	5300 4500 4750 4500
Wire Wire Line
	5300 4600 4750 4600
Wire Wire Line
	5300 4700 4750 4700
Wire Wire Line
	5300 4800 4750 4800
Wire Wire Line
	5300 5100 5250 5100
$Comp
L alexios:74HC573 U?
U 1 1 5F644261
P 5800 4600
AR Path="/5F4B0011/5F644261" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644261" Ref="U13"  Part="1" 
F 0 "U13" H 5800 5367 50  0000 C CNN
F 1 "74HC573" H 5800 5276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5800 4600 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 5800 4600 50  0001 C CNN
	1    5800 4600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC573 U?
U 1 1 5F644267
P 5800 3000
AR Path="/5F4B0011/5F644267" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644267" Ref="U10"  Part="1" 
F 0 "U10" H 5800 3767 50  0000 C CNN
F 1 "74HC573" H 5800 3676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5800 3000 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 5800 3000 50  0001 C CNN
	1    5800 3000
	1    0    0    -1  
$EndComp
Entry Wire Line
	4650 2400 4750 2500
Entry Wire Line
	4650 2500 4750 2600
Entry Wire Line
	4650 2600 4750 2700
Entry Wire Line
	4650 2700 4750 2800
Entry Wire Line
	4650 2800 4750 2900
Entry Wire Line
	4650 2900 4750 3000
Entry Wire Line
	4650 3000 4750 3100
Entry Wire Line
	4650 3100 4750 3200
Entry Wire Line
	4650 4000 4750 4100
Entry Wire Line
	4650 4100 4750 4200
Entry Wire Line
	4650 4200 4750 4300
Entry Wire Line
	4650 4300 4750 4400
Entry Wire Line
	4650 4400 4750 4500
Entry Wire Line
	4650 4500 4750 4600
Entry Wire Line
	4650 4600 4750 4700
Entry Wire Line
	4650 4700 4750 4800
Text Label 4800 2500 0    50   ~ 0
IBUS0
Text Label 4800 2600 0    50   ~ 0
IBUS1
Text Label 4800 2700 0    50   ~ 0
IBUS2
Text Label 4800 2800 0    50   ~ 0
IBUS3
Text Label 4800 2900 0    50   ~ 0
IBUS4
Text Label 4800 3000 0    50   ~ 0
IBUS5
Text Label 4800 3100 0    50   ~ 0
IBUS6
Text Label 4800 3200 0    50   ~ 0
IBUS7
Text Label 4800 4100 0    50   ~ 0
IBUS8
Text Label 4800 4200 0    50   ~ 0
IBUS9
Text Label 4800 4300 0    50   ~ 0
IBUS10
Text Label 4800 4400 0    50   ~ 0
IBUS11
Text Label 4800 4500 0    50   ~ 0
IBUS12
Text Label 4800 4600 0    50   ~ 0
IBUS13
Text Label 4800 4700 0    50   ~ 0
IBUS14
Text Label 4800 4800 0    50   ~ 0
IBUS15
Wire Wire Line
	6300 2500 6600 2500
Wire Wire Line
	6300 2600 6600 2600
Wire Wire Line
	6300 2700 6600 2700
Wire Wire Line
	6300 2800 6600 2800
Wire Wire Line
	6300 2900 6600 2900
Wire Wire Line
	6300 3000 6600 3000
Wire Wire Line
	6300 3100 6600 3100
Wire Wire Line
	6300 3200 6600 3200
Wire Wire Line
	6300 4100 6600 4100
Wire Wire Line
	6300 4200 6600 4200
Wire Wire Line
	6300 4300 6600 4300
Wire Wire Line
	6300 4400 6600 4400
Wire Wire Line
	6300 4500 6600 4500
Wire Wire Line
	6300 4600 6600 4600
Wire Wire Line
	6300 4700 6600 4700
Wire Wire Line
	6300 4800 6600 4800
Text Label 6350 2500 0    50   ~ 0
IR0
Text Label 6350 2600 0    50   ~ 0
IR1
Text Label 6350 2700 0    50   ~ 0
IR2
Text Label 6350 2800 0    50   ~ 0
IR3
Text Label 6350 2900 0    50   ~ 0
IR4
Text Label 6350 3000 0    50   ~ 0
IR5
Text Label 6350 3100 0    50   ~ 0
IR6
Text Label 6350 3200 0    50   ~ 0
IR7
Text Label 6350 4100 0    50   ~ 0
IR8
Text Label 6350 4200 0    50   ~ 0
IR9
Text Label 6350 4300 0    50   ~ 0
IR10
Text Label 6350 4400 0    50   ~ 0
IR11
Text Label 6350 4500 0    50   ~ 0
IR12
Text Label 6350 4600 0    50   ~ 0
IR13
Text Label 6350 4700 0    50   ~ 0
IR14
Text Label 6350 4800 0    50   ~ 0
IR15
Text Label 7100 2500 0    50   ~ 0
IR0
Text Label 7100 2600 0    50   ~ 0
IR1
Text Label 7100 2700 0    50   ~ 0
IR2
Text Label 7100 2800 0    50   ~ 0
IR3
Text Label 7100 2900 0    50   ~ 0
IR4
Text Label 7100 3000 0    50   ~ 0
IR5
Text Label 7100 3100 0    50   ~ 0
IR6
Text Label 7100 3200 0    50   ~ 0
IR7
Text Label 7100 4100 0    50   ~ 0
IR8
Text Label 7100 4200 0    50   ~ 0
IR9
Text Label 6700 3850 1    50   ~ 0
IR[0..15]
Wire Wire Line
	8350 2500 8650 2500
Wire Wire Line
	8350 2600 8650 2600
Wire Wire Line
	8350 2700 8650 2700
Wire Wire Line
	8350 2800 8650 2800
Wire Wire Line
	8350 2900 8650 2900
Wire Wire Line
	8350 3000 8650 3000
Wire Wire Line
	8350 3100 8650 3100
Wire Wire Line
	8350 3200 8650 3200
Entry Wire Line
	8650 2500 8750 2600
Entry Wire Line
	8650 2600 8750 2700
Entry Wire Line
	8650 2700 8750 2800
Entry Wire Line
	8650 2800 8750 2900
Entry Wire Line
	8650 2900 8750 3000
Entry Wire Line
	8650 3000 8750 3100
Entry Wire Line
	8650 3100 8750 3200
Entry Wire Line
	8650 3200 8750 3300
Wire Wire Line
	8350 4100 8650 4100
Wire Wire Line
	8350 4200 8650 4200
Wire Wire Line
	8350 4300 8650 4300
Wire Wire Line
	8350 4400 8650 4400
Wire Wire Line
	8350 4500 8650 4500
Wire Wire Line
	8350 4600 8650 4600
Wire Wire Line
	8350 4700 8650 4700
Wire Wire Line
	8350 4800 8650 4800
Entry Wire Line
	8650 4100 8750 4200
Entry Wire Line
	8650 4200 8750 4300
Entry Wire Line
	8650 4300 8750 4400
Entry Wire Line
	8650 4400 8750 4500
Entry Wire Line
	8650 4500 8750 4600
Entry Wire Line
	8650 4600 8750 4700
Entry Wire Line
	8650 4700 8750 4800
Entry Wire Line
	8650 4800 8750 4900
Text Label 8750 3850 1    50   ~ 0
FPO[0..7]
$Comp
L power:GND #PWR?
U 1 1 5F6442FF
P 7300 5150
AR Path="/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6442FF" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 7300 4900 50  0001 C CNN
F 1 "GND" H 7305 4977 50  0000 C CNN
F 2 "" H 7300 5150 50  0001 C CNN
F 3 "" H 7300 5150 50  0001 C CNN
	1    7300 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F64430B
P 7300 3550
AR Path="/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64430B" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 7300 3300 50  0001 C CNN
F 1 "GND" H 7305 3377 50  0000 C CNN
F 2 "" H 7300 3550 50  0001 C CNN
F 3 "" H 7300 3550 50  0001 C CNN
	1    7300 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3500 7300 3500
Wire Wire Line
	7300 3500 7300 3550
Wire Wire Line
	7350 5100 7300 5100
Wire Wire Line
	7300 5100 7300 5150
Text Label 7100 3400 0    50   ~ 0
~FPIRL
Text Label 7100 5000 0    50   ~ 0
~FPIRH
$Comp
L power:GND #PWR?
U 1 1 5F64431F
P 5300 3550
AR Path="/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64431F" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 5300 3300 50  0001 C CNN
F 1 "GND" H 5305 3377 50  0000 C CNN
F 2 "" H 5300 3550 50  0001 C CNN
F 3 "" H 5300 3550 50  0001 C CNN
	1    5300 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3500 5300 3550
$Comp
L power:GND #PWR?
U 1 1 5F64432C
P 5250 5150
AR Path="/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64432C" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 5250 4900 50  0001 C CNN
F 1 "GND" H 5255 4977 50  0000 C CNN
F 2 "" H 5250 5150 50  0001 C CNN
F 3 "" H 5250 5150 50  0001 C CNN
	1    5250 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5100 5250 5150
Wire Bus Line
	1200 2200 4550 2200
Entry Bus Bus
	4550 2200 4650 2300
Text Label 1250 2200 0    50   ~ 0
IBUS[0..15]
Text HLabel 1200 2200 0    50   3State ~ 0
IBUS[0..15]
Entry Bus Bus
	8750 5100 8850 5200
Wire Bus Line
	8850 5200 9450 5200
Text Label 9350 5200 2    50   ~ 0
FPD[0..7]
Text HLabel 9450 5200 2    50   3State ~ 0
FPD[0..7]
Entry Bus Bus
	6700 5550 6800 5650
Text Label 9350 5650 2    50   ~ 0
IR[0..15]
Text HLabel 9450 5650 2    50   BiDi ~ 0
IR[0..15]
Entry Wire Line
	6600 2500 6700 2600
Entry Wire Line
	6600 2600 6700 2700
Entry Wire Line
	6600 2700 6700 2800
Entry Wire Line
	6600 2800 6700 2900
Entry Wire Line
	6600 2900 6700 3000
Entry Wire Line
	6600 3000 6700 3100
Entry Wire Line
	6600 3100 6700 3200
Entry Wire Line
	6600 3200 6700 3300
Entry Wire Line
	6600 4100 6700 4200
Entry Wire Line
	6600 4200 6700 4300
Entry Wire Line
	6600 4300 6700 4400
Entry Wire Line
	6600 4400 6700 4500
Entry Wire Line
	6600 4500 6700 4600
Entry Wire Line
	6600 4600 6700 4700
Entry Wire Line
	6600 4700 6700 4800
Entry Wire Line
	6600 4800 6700 4900
Entry Wire Line
	6700 2600 6800 2500
Entry Wire Line
	6700 2700 6800 2600
Entry Wire Line
	6700 2800 6800 2700
Entry Wire Line
	6700 2900 6800 2800
Entry Wire Line
	6700 3000 6800 2900
Entry Wire Line
	6700 3100 6800 3000
Entry Wire Line
	6700 3200 6800 3100
Entry Wire Line
	6700 3300 6800 3200
Entry Wire Line
	6700 4200 6800 4100
Entry Wire Line
	6700 4300 6800 4200
Entry Wire Line
	6700 4400 6800 4300
Entry Wire Line
	6700 4500 6800 4400
Entry Wire Line
	6700 4600 6800 4500
Entry Wire Line
	6700 4700 6800 4600
Entry Wire Line
	6700 4800 6800 4700
Entry Wire Line
	6700 4900 6800 4800
$Comp
L alexios:74AHC1G04 U?
U 1 1 5F644365
P 4200 3400
AR Path="/5F4B0011/5F644365" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644365" Ref="U12"  Part="1" 
F 0 "U12" H 4175 3667 50  0000 C CNN
F 1 "74AHC1G04" H 4175 3576 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4200 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4200 3400 50  0001 C CNN
	1    4200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3400 4500 3400
Wire Wire Line
	4500 5000 4500 3400
Wire Wire Line
	4500 5000 5300 5000
Connection ~ 4500 3400
Wire Wire Line
	4500 3400 5300 3400
Text Label 4800 3400 0    50   ~ 0
LATCH-IR
Text Label 4800 5000 0    50   ~ 0
LATCH-IR
Wire Wire Line
	3900 3400 3400 3400
Text Label 3400 3400 0    50   ~ 0
~WRITE-IR
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
Text Label 1250 1850 0    50   ~ 0
~FPIRL
Text Label 1250 1950 0    50   ~ 0
~FPIRH
Text HLabel 1200 1850 0    50   Input ~ 0
~FPIRL
Text HLabel 1200 1950 0    50   Input ~ 0
~FPIRH
Text Label 7100 4800 0    50   ~ 0
IR15
Text Label 7100 4700 0    50   ~ 0
IR14
Text Label 7100 4600 0    50   ~ 0
IR13
Text Label 7100 4500 0    50   ~ 0
IR12
Text Label 7100 4400 0    50   ~ 0
IR11
Text Label 7100 4300 0    50   ~ 0
IR10
Wire Bus Line
	6800 5650 9450 5650
Wire Wire Line
	6900 1950 6900 5000
Wire Wire Line
	6900 5000 7350 5000
Wire Wire Line
	1200 1950 6900 1950
Wire Wire Line
	7000 1850 7000 3400
Wire Wire Line
	7000 3400 7350 3400
Wire Wire Line
	1200 1850 7000 1850
Wire Wire Line
	7350 4100 6800 4100
Wire Wire Line
	7350 4200 6800 4200
Wire Wire Line
	7350 4300 6800 4300
Wire Wire Line
	7350 4400 6800 4400
Wire Wire Line
	7350 4500 6800 4500
Wire Wire Line
	7350 4600 6800 4600
Wire Wire Line
	7350 4700 6800 4700
Wire Wire Line
	7350 4800 6800 4800
Wire Wire Line
	7350 2500 6800 2500
Wire Wire Line
	7350 2600 6800 2600
Wire Wire Line
	7350 2700 6800 2700
Wire Wire Line
	7350 2800 6800 2800
Wire Wire Line
	7350 2900 6800 2900
Wire Wire Line
	7350 3000 6800 3000
Wire Wire Line
	7350 3100 6800 3100
Wire Wire Line
	7350 3200 6800 3200
Text Label 8400 2500 0    50   ~ 0
FPD0
Text Label 8400 2600 0    50   ~ 0
FPD1
Text Label 8400 2700 0    50   ~ 0
FPD2
Text Label 8400 2800 0    50   ~ 0
FPD3
Text Label 8400 2900 0    50   ~ 0
FPD4
Text Label 8400 3000 0    50   ~ 0
FPD5
Text Label 8400 3100 0    50   ~ 0
FPD6
Text Label 8400 3200 0    50   ~ 0
FPD7
Text Label 8400 4100 0    50   ~ 0
FPD0
Text Label 8400 4200 0    50   ~ 0
FPD1
Text Label 8400 4300 0    50   ~ 0
FPD2
Text Label 8400 4400 0    50   ~ 0
FPD3
Text Label 8400 4500 0    50   ~ 0
FPD4
Text Label 8400 4600 0    50   ~ 0
FPD5
Text Label 8400 4700 0    50   ~ 0
FPD6
Text Label 8400 4800 0    50   ~ 0
FPD7
$Comp
L alexios:74HC138 U?
U 1 1 60BFC4E0
P 2900 3800
F 0 "U?" H 2900 4467 50  0000 C CNN
F 1 "74HC138" H 2900 4376 50  0000 C CNN
F 2 "" H 2900 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2900 3800 50  0001 C CNN
F 4 "Yes" H 2825 2975 50  0001 C CNN "Verified"
	1    2900 3800
	1    0    0    -1  
$EndComp
Text Notes 2850 4050 1    50   ~ 10
WADDR=00010
$Comp
L alexios:74HC138 U?
U 2 1 60C5EB83
P 1400 6550
F 0 "U?" H 1580 6596 50  0000 L CNN
F 1 "74HC138" H 1580 6505 50  0000 L CNN
F 2 "" H 1400 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1400 6550 50  0001 C CNN
F 4 "Yes" H 1325 5725 50  0001 C CNN "Verified"
	2    1400 6550
	1    0    0    -1  
$EndComp
Connection ~ 1050 6450
Connection ~ 1050 6650
Text HLabel 1200 3050 0    50   3State ~ 0
WADDR[4..0]
Text Label 1300 3050 0    50   ~ 0
WADDR[4..0]
Wire Bus Line
	1200 3050 1800 3050
Entry Bus Bus
	1800 3050 1900 3150
Entry Wire Line
	1900 4000 2000 4100
Entry Wire Line
	1900 3900 2000 4000
Entry Wire Line
	1900 3500 2000 3600
Entry Wire Line
	1900 3400 2000 3500
Entry Wire Line
	1900 3300 2000 3400
Text HLabel 1200 4200 0    50   Input ~ 0
CLK4
Text Label 2050 4200 0    50   ~ 0
CLK4
Text Label 2050 4100 0    50   ~ 0
WADDR4
Text Label 2050 3600 0    50   ~ 0
WADDR3
Text Label 2050 3500 0    50   ~ 0
WADDR2
Text Label 2050 4000 0    50   ~ 0
WADDR1
Text Label 2050 3400 0    50   ~ 0
WADDR0
Wire Wire Line
	2400 4200 1200 4200
Wire Wire Line
	2400 4100 2000 4100
Wire Wire Line
	2400 4000 2000 4000
Wire Wire Line
	2400 3600 2000 3600
Wire Wire Line
	2400 3500 2000 3500
Wire Wire Line
	2400 3400 2000 3400
Wire Bus Line
	1900 3150 1900 4000
Wire Bus Line
	6700 2600 6700 5550
Wire Bus Line
	8750 2600 8750 5100
Wire Bus Line
	4650 2300 4650 4700
Text Label 1250 4200 0    50   ~ 0
CLK4
$EndSCHEMATC
