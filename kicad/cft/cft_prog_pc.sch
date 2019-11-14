EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 30
Title "CFT Homebrew 16-bit Minicomputer"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Entry Bus Bus
	2000 700  2100 800 
Text HLabel 1200 700  0    50   Input ~ 0
IBUS[0..15]
Entry Wire Line
	2100 1300 2200 1400
Entry Wire Line
	2100 1200 2200 1300
Entry Wire Line
	2100 1100 2200 1200
Entry Wire Line
	2100 1000 2200 1100
Wire Wire Line
	2400 1900 2400 1850
$Comp
L power:+5V #PWR?
U 1 1 5D673AA7
P 2400 1650
AR Path="/5CE16E65/5D673AA7" Ref="#PWR?"  Part="1" 
AR Path="/5D673AA7" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673AA7" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673AA7" Ref="#PWR0505"  Part="1" 
AR Path="/5DDCCE71/5D673AA7" Ref="#PWR?"  Part="1" 
F 0 "#PWR0505" H 2400 1500 50  0001 C CNN
F 1 "+5V" H 2415 1823 50  0000 C CNN
F 2 "" H 2400 1650 50  0001 C CNN
F 3 "" H 2400 1650 50  0001 C CNN
	1    2400 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D673AC0
P 2400 1750
AR Path="/5D673AC0" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D673AC0" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D673AC0" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D673AC0" Ref="R501"  Part="1" 
AR Path="/5DDCCE71/5D673AC0" Ref="R?"  Part="1" 
F 0 "R501" H 2458 1704 50  0000 L CNN
F 1 "10kΩ" H 2458 1795 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2400 1750 50  0001 C CNN
F 3 "~" H 2400 1750 50  0001 C CNN
	1    2400 1750
	-1   0    0    1   
$EndComp
Entry Wire Line
	2100 2550 2200 2650
Entry Wire Line
	2100 2650 2200 2750
Entry Wire Line
	2100 2750 2200 2850
Entry Wire Line
	2100 2850 2200 2950
Entry Wire Line
	2100 4600 2200 4700
Entry Wire Line
	2100 4700 2200 4800
Entry Wire Line
	2100 4800 2200 4900
Entry Wire Line
	2100 4900 2200 5000
Entry Wire Line
	2100 6200 2200 6300
Entry Wire Line
	2100 6300 2200 6400
Entry Wire Line
	2100 6400 2200 6500
Entry Wire Line
	2100 6500 2200 6600
Text Label 2100 2350 1    50   ~ 0
IBUS[0..15]
$Comp
L power:+5V #PWR?
U 1 1 5D673A98
P 2400 6850
AR Path="/5CE16E65/5D673A98" Ref="#PWR?"  Part="1" 
AR Path="/5D673A98" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673A98" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673A98" Ref="#PWR0523"  Part="1" 
AR Path="/5DDCCE71/5D673A98" Ref="#PWR?"  Part="1" 
F 0 "#PWR0523" H 2400 6700 50  0001 C CNN
F 1 "+5V" H 2415 7023 50  0000 C CNN
F 2 "" H 2400 6850 50  0001 C CNN
F 3 "" H 2400 6850 50  0001 C CNN
	1    2400 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 7100 2400 7050
$Comp
L Device:R_Small R?
U 1 1 5D673A90
P 2400 6950
AR Path="/5D673A90" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D673A90" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D673A90" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D673A90" Ref="R507"  Part="1" 
AR Path="/5DDCCE71/5D673A90" Ref="R?"  Part="1" 
F 0 "R507" H 2458 6904 50  0000 L CNN
F 1 "10kΩ" H 2458 6995 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2400 6950 50  0001 C CNN
F 3 "~" H 2400 6950 50  0001 C CNN
	1    2400 6950
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D673A8A
P 2400 5250
AR Path="/5CE16E65/5D673A8A" Ref="#PWR?"  Part="1" 
AR Path="/5D673A8A" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673A8A" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673A8A" Ref="#PWR0521"  Part="1" 
AR Path="/5DDCCE71/5D673A8A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0521" H 2400 5100 50  0001 C CNN
F 1 "+5V" H 2415 5423 50  0000 C CNN
F 2 "" H 2400 5250 50  0001 C CNN
F 3 "" H 2400 5250 50  0001 C CNN
	1    2400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 5500 2400 5450
$Comp
L Device:R_Small R?
U 1 1 5D673A82
P 2400 5350
AR Path="/5D673A82" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D673A82" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D673A82" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D673A82" Ref="R505"  Part="1" 
AR Path="/5DDCCE71/5D673A82" Ref="R?"  Part="1" 
F 0 "R505" H 2458 5304 50  0000 L CNN
F 1 "10kΩ" H 2458 5395 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2400 5350 50  0001 C CNN
F 3 "~" H 2400 5350 50  0001 C CNN
	1    2400 5350
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D673A7C
P 2400 3200
AR Path="/5CE16E65/5D673A7C" Ref="#PWR?"  Part="1" 
AR Path="/5D673A7C" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673A7C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673A7C" Ref="#PWR0515"  Part="1" 
AR Path="/5DDCCE71/5D673A7C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0515" H 2400 3050 50  0001 C CNN
F 1 "+5V" H 2415 3373 50  0000 C CNN
F 2 "" H 2400 3200 50  0001 C CNN
F 3 "" H 2400 3200 50  0001 C CNN
	1    2400 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3450 2400 3400
$Comp
L Device:R_Small R?
U 1 1 5D673A74
P 2400 3300
AR Path="/5D673A74" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D673A74" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D673A74" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D673A74" Ref="R503"  Part="1" 
AR Path="/5DDCCE71/5D673A74" Ref="R?"  Part="1" 
F 0 "R503" H 2458 3254 50  0000 L CNN
F 1 "10kΩ" H 2458 3345 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2400 3300 50  0001 C CNN
F 3 "~" H 2400 3300 50  0001 C CNN
	1    2400 3300
	-1   0    0    1   
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5D673B51
P 9050 3700
AR Path="/5D673B51" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D673B51" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D673B51" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D673B51" Ref="U502"  Part="2" 
AR Path="/5DDCCE71/5D673B51" Ref="U?"  Part="2" 
F 0 "U502" H 9230 3846 50  0000 L CNN
F 1 "74HC193" H 9230 3755 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 9050 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9050 3700 50  0001 C CNN
	2    9050 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D673B4B
P 8700 4400
AR Path="/5CC0D65F/5D673B4B" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D673B4B" Ref="C?"  Part="1" 
AR Path="/5D673B4B" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D673B4B" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D673B4B" Ref="C503"  Part="1" 
AR Path="/5DDCCE71/5D673B4B" Ref="C?"  Part="1" 
F 0 "C503" H 8609 4446 50  0000 R CNN
F 1 "100nF" H 8609 4355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8700 4400 50  0001 C CNN
F 3 "~" H 8700 4400 50  0001 C CNN
	1    8700 4400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5D673B45
P 9050 4500
AR Path="/5D673B45" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D673B45" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D673B45" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D673B45" Ref="U505"  Part="2" 
AR Path="/5DDCCE71/5D673B45" Ref="U?"  Part="2" 
F 0 "U505" H 9230 4646 50  0000 L CNN
F 1 "74HC193" H 9230 4555 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 9050 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9050 4500 50  0001 C CNN
	2    9050 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D673B3F
P 8700 5200
AR Path="/5CC0D65F/5D673B3F" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D673B3F" Ref="C?"  Part="1" 
AR Path="/5D673B3F" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D673B3F" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D673B3F" Ref="C505"  Part="1" 
AR Path="/5DDCCE71/5D673B3F" Ref="C?"  Part="1" 
F 0 "C505" H 8609 5246 50  0000 R CNN
F 1 "100nF" H 8609 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8700 5200 50  0001 C CNN
F 3 "~" H 8700 5200 50  0001 C CNN
	1    8700 5200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5D673B39
P 9050 5300
AR Path="/5D673B39" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D673B39" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D673B39" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D673B39" Ref="U507"  Part="2" 
AR Path="/5DDCCE71/5D673B39" Ref="U?"  Part="2" 
F 0 "U507" H 9230 5446 50  0000 L CNN
F 1 "74HC193" H 9230 5355 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 9050 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9050 5300 50  0001 C CNN
	2    9050 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D673B33
P 8700 6000
AR Path="/5CC0D65F/5D673B33" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D673B33" Ref="C?"  Part="1" 
AR Path="/5D673B33" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D673B33" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D673B33" Ref="C507"  Part="1" 
AR Path="/5DDCCE71/5D673B33" Ref="C?"  Part="1" 
F 0 "C507" H 8609 6046 50  0000 R CNN
F 1 "100nF" H 8609 5955 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8700 6000 50  0001 C CNN
F 3 "~" H 8700 6000 50  0001 C CNN
	1    8700 6000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5D673B2D
P 9050 6100
AR Path="/5D673B2D" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D673B2D" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D673B2D" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D673B2D" Ref="U510"  Part="2" 
AR Path="/5DDCCE71/5D673B2D" Ref="U?"  Part="2" 
F 0 "U510" H 9230 6246 50  0000 L CNN
F 1 "74HC193" H 9230 6155 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 9050 6100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9050 6100 50  0001 C CNN
	2    9050 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D673B27
P 8700 3500
AR Path="/5CE16E65/5D673B27" Ref="#PWR?"  Part="1" 
AR Path="/5D673B27" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673B27" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673B27" Ref="#PWR0501"  Part="1" 
AR Path="/5DDCCE71/5D673B27" Ref="#PWR?"  Part="1" 
F 0 "#PWR0501" H 8700 3350 50  0001 C CNN
F 1 "+5V" H 8715 3673 50  0000 C CNN
F 2 "" H 8700 3500 50  0001 C CNN
F 3 "" H 8700 3500 50  0001 C CNN
	1    8700 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D673B21
P 8700 4300
AR Path="/5CE16E65/5D673B21" Ref="#PWR?"  Part="1" 
AR Path="/5D673B21" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673B21" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673B21" Ref="#PWR0506"  Part="1" 
AR Path="/5DDCCE71/5D673B21" Ref="#PWR?"  Part="1" 
F 0 "#PWR0506" H 8700 4150 50  0001 C CNN
F 1 "+5V" H 8715 4473 50  0000 C CNN
F 2 "" H 8700 4300 50  0001 C CNN
F 3 "" H 8700 4300 50  0001 C CNN
	1    8700 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D673B1B
P 8700 5100
AR Path="/5CE16E65/5D673B1B" Ref="#PWR?"  Part="1" 
AR Path="/5D673B1B" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673B1B" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673B1B" Ref="#PWR0511"  Part="1" 
AR Path="/5DDCCE71/5D673B1B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0511" H 8700 4950 50  0001 C CNN
F 1 "+5V" H 8715 5273 50  0000 C CNN
F 2 "" H 8700 5100 50  0001 C CNN
F 3 "" H 8700 5100 50  0001 C CNN
	1    8700 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D673B15
P 8700 5900
AR Path="/5CE16E65/5D673B15" Ref="#PWR?"  Part="1" 
AR Path="/5D673B15" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673B15" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673B15" Ref="#PWR0516"  Part="1" 
AR Path="/5DDCCE71/5D673B15" Ref="#PWR?"  Part="1" 
F 0 "#PWR0516" H 8700 5750 50  0001 C CNN
F 1 "+5V" H 8715 6073 50  0000 C CNN
F 2 "" H 8700 5900 50  0001 C CNN
F 3 "" H 8700 5900 50  0001 C CNN
	1    8700 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D673B0F
P 8700 4500
AR Path="/5CE16E65/5D673B0F" Ref="#PWR?"  Part="1" 
AR Path="/5D673B0F" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673B0F" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673B0F" Ref="#PWR0508"  Part="1" 
AR Path="/5DDCCE71/5D673B0F" Ref="#PWR?"  Part="1" 
F 0 "#PWR0508" H 8700 4250 50  0001 C CNN
F 1 "GND" H 8705 4327 50  0000 C CNN
F 2 "" H 8700 4500 50  0001 C CNN
F 3 "" H 8700 4500 50  0001 C CNN
	1    8700 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D673B09
P 8700 5300
AR Path="/5CE16E65/5D673B09" Ref="#PWR?"  Part="1" 
AR Path="/5D673B09" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673B09" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673B09" Ref="#PWR0513"  Part="1" 
AR Path="/5DDCCE71/5D673B09" Ref="#PWR?"  Part="1" 
F 0 "#PWR0513" H 8700 5050 50  0001 C CNN
F 1 "GND" H 8705 5127 50  0000 C CNN
F 2 "" H 8700 5300 50  0001 C CNN
F 3 "" H 8700 5300 50  0001 C CNN
	1    8700 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D673B03
P 8700 6100
AR Path="/5CE16E65/5D673B03" Ref="#PWR?"  Part="1" 
AR Path="/5D673B03" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673B03" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673B03" Ref="#PWR0518"  Part="1" 
AR Path="/5DDCCE71/5D673B03" Ref="#PWR?"  Part="1" 
F 0 "#PWR0518" H 8700 5850 50  0001 C CNN
F 1 "GND" H 8705 5927 50  0000 C CNN
F 2 "" H 8700 6100 50  0001 C CNN
F 3 "" H 8700 6100 50  0001 C CNN
	1    8700 6100
	1    0    0    -1  
$EndComp
Text HLabel 7350 4350 2    50   3State ~ 0
FPO[0..7]
$Comp
L alexios:74HCT541 U?
U 2 1 5D673958
P 10400 3600
AR Path="/5D673958" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D673958" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D673958" Ref="U501"  Part="2" 
AR Path="/5DDCCE71/5D673958" Ref="U?"  Part="2" 
F 0 "U501" H 10580 3646 50  0000 L CNN
F 1 "74HCT541" H 10580 3555 50  0000 L CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 10400 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10400 3600 50  0001 C CNN
	2    10400 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D673952
P 8700 3700
AR Path="/5CE16E65/5D673952" Ref="#PWR?"  Part="1" 
AR Path="/5D673952" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673952" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673952" Ref="#PWR0503"  Part="1" 
AR Path="/5DDCCE71/5D673952" Ref="#PWR?"  Part="1" 
F 0 "#PWR0503" H 8700 3450 50  0001 C CNN
F 1 "GND" H 8705 3527 50  0000 C CNN
F 2 "" H 8700 3700 50  0001 C CNN
F 3 "" H 8700 3700 50  0001 C CNN
	1    8700 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D67394C
P 8700 3600
AR Path="/5CC0D65F/5D67394C" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D67394C" Ref="C?"  Part="1" 
AR Path="/5D67394C" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D67394C" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D67394C" Ref="C501"  Part="1" 
AR Path="/5DDCCE71/5D67394C" Ref="C?"  Part="1" 
F 0 "C501" H 8609 3646 50  0000 R CNN
F 1 "100nF" H 8609 3555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8700 3600 50  0001 C CNN
F 3 "~" H 8700 3600 50  0001 C CNN
	1    8700 3600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT541 U?
U 2 1 5D673946
P 10400 4400
AR Path="/5D673946" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D673946" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D673946" Ref="U504"  Part="2" 
AR Path="/5DDCCE71/5D673946" Ref="U?"  Part="2" 
F 0 "U504" H 10580 4446 50  0000 L CNN
F 1 "74HCT541" H 10580 4355 50  0000 L CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 10400 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10400 4400 50  0001 C CNN
	2    10400 4400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT541 U?
U 2 1 5D673940
P 10400 5200
AR Path="/5D673940" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D673940" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D673940" Ref="U506"  Part="2" 
AR Path="/5DDCCE71/5D673940" Ref="U?"  Part="2" 
F 0 "U506" H 10580 5246 50  0000 L CNN
F 1 "74HCT541" H 10580 5155 50  0000 L CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 10400 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10400 5200 50  0001 C CNN
	2    10400 5200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT541 U?
U 2 1 5D67393A
P 10400 6000
AR Path="/5D67393A" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D67393A" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D67393A" Ref="U509"  Part="2" 
AR Path="/5DDCCE71/5D67393A" Ref="U?"  Part="2" 
F 0 "U509" H 10580 6046 50  0000 L CNN
F 1 "74HCT541" H 10580 5955 50  0000 L CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 10400 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10400 6000 50  0001 C CNN
	2    10400 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D673934
P 10050 3600
AR Path="/5CC0D65F/5D673934" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D673934" Ref="C?"  Part="1" 
AR Path="/5D673934" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D673934" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D673934" Ref="C502"  Part="1" 
AR Path="/5DDCCE71/5D673934" Ref="C?"  Part="1" 
F 0 "C502" H 9959 3646 50  0000 R CNN
F 1 "100nF" H 9959 3555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10050 3600 50  0001 C CNN
F 3 "~" H 10050 3600 50  0001 C CNN
	1    10050 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D67392E
P 10050 4400
AR Path="/5CC0D65F/5D67392E" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D67392E" Ref="C?"  Part="1" 
AR Path="/5D67392E" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D67392E" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D67392E" Ref="C504"  Part="1" 
AR Path="/5DDCCE71/5D67392E" Ref="C?"  Part="1" 
F 0 "C504" H 9959 4446 50  0000 R CNN
F 1 "100nF" H 9959 4355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10050 4400 50  0001 C CNN
F 3 "~" H 10050 4400 50  0001 C CNN
	1    10050 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D673928
P 10050 5200
AR Path="/5CC0D65F/5D673928" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D673928" Ref="C?"  Part="1" 
AR Path="/5D673928" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D673928" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D673928" Ref="C506"  Part="1" 
AR Path="/5DDCCE71/5D673928" Ref="C?"  Part="1" 
F 0 "C506" H 9959 5246 50  0000 R CNN
F 1 "100nF" H 9959 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10050 5200 50  0001 C CNN
F 3 "~" H 10050 5200 50  0001 C CNN
	1    10050 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D673922
P 10050 6000
AR Path="/5CC0D65F/5D673922" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D673922" Ref="C?"  Part="1" 
AR Path="/5D673922" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D673922" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D673922" Ref="C508"  Part="1" 
AR Path="/5DDCCE71/5D673922" Ref="C?"  Part="1" 
F 0 "C508" H 9959 6046 50  0000 R CNN
F 1 "100nF" H 9959 5955 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10050 6000 50  0001 C CNN
F 3 "~" H 10050 6000 50  0001 C CNN
	1    10050 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D67391C
P 10050 5900
AR Path="/5CE16E65/5D67391C" Ref="#PWR?"  Part="1" 
AR Path="/5D67391C" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D67391C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D67391C" Ref="#PWR0517"  Part="1" 
AR Path="/5DDCCE71/5D67391C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0517" H 10050 5750 50  0001 C CNN
F 1 "+5V" H 10065 6073 50  0000 C CNN
F 2 "" H 10050 5900 50  0001 C CNN
F 3 "" H 10050 5900 50  0001 C CNN
	1    10050 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D673916
P 10050 5100
AR Path="/5CE16E65/5D673916" Ref="#PWR?"  Part="1" 
AR Path="/5D673916" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673916" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673916" Ref="#PWR0512"  Part="1" 
AR Path="/5DDCCE71/5D673916" Ref="#PWR?"  Part="1" 
F 0 "#PWR0512" H 10050 4950 50  0001 C CNN
F 1 "+5V" H 10065 5273 50  0000 C CNN
F 2 "" H 10050 5100 50  0001 C CNN
F 3 "" H 10050 5100 50  0001 C CNN
	1    10050 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D673910
P 10050 4300
AR Path="/5CE16E65/5D673910" Ref="#PWR?"  Part="1" 
AR Path="/5D673910" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673910" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673910" Ref="#PWR0507"  Part="1" 
AR Path="/5DDCCE71/5D673910" Ref="#PWR?"  Part="1" 
F 0 "#PWR0507" H 10050 4150 50  0001 C CNN
F 1 "+5V" H 10065 4473 50  0000 C CNN
F 2 "" H 10050 4300 50  0001 C CNN
F 3 "" H 10050 4300 50  0001 C CNN
	1    10050 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D67390A
P 10050 3500
AR Path="/5CE16E65/5D67390A" Ref="#PWR?"  Part="1" 
AR Path="/5D67390A" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D67390A" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D67390A" Ref="#PWR0502"  Part="1" 
AR Path="/5DDCCE71/5D67390A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0502" H 10050 3350 50  0001 C CNN
F 1 "+5V" H 10065 3673 50  0000 C CNN
F 2 "" H 10050 3500 50  0001 C CNN
F 3 "" H 10050 3500 50  0001 C CNN
	1    10050 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D673904
P 10050 3700
AR Path="/5CE16E65/5D673904" Ref="#PWR?"  Part="1" 
AR Path="/5D673904" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673904" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673904" Ref="#PWR0504"  Part="1" 
AR Path="/5DDCCE71/5D673904" Ref="#PWR?"  Part="1" 
F 0 "#PWR0504" H 10050 3450 50  0001 C CNN
F 1 "GND" H 10055 3527 50  0000 C CNN
F 2 "" H 10050 3700 50  0001 C CNN
F 3 "" H 10050 3700 50  0001 C CNN
	1    10050 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6738FE
P 10050 4500
AR Path="/5CE16E65/5D6738FE" Ref="#PWR?"  Part="1" 
AR Path="/5D6738FE" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D6738FE" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D6738FE" Ref="#PWR0509"  Part="1" 
AR Path="/5DDCCE71/5D6738FE" Ref="#PWR?"  Part="1" 
F 0 "#PWR0509" H 10050 4250 50  0001 C CNN
F 1 "GND" H 10055 4327 50  0000 C CNN
F 2 "" H 10050 4500 50  0001 C CNN
F 3 "" H 10050 4500 50  0001 C CNN
	1    10050 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6738F8
P 10050 5300
AR Path="/5CE16E65/5D6738F8" Ref="#PWR?"  Part="1" 
AR Path="/5D6738F8" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D6738F8" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D6738F8" Ref="#PWR0514"  Part="1" 
AR Path="/5DDCCE71/5D6738F8" Ref="#PWR?"  Part="1" 
F 0 "#PWR0514" H 10050 5050 50  0001 C CNN
F 1 "GND" H 10055 5127 50  0000 C CNN
F 2 "" H 10050 5300 50  0001 C CNN
F 3 "" H 10050 5300 50  0001 C CNN
	1    10050 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6738F2
P 10050 6100
AR Path="/5CE16E65/5D6738F2" Ref="#PWR?"  Part="1" 
AR Path="/5D6738F2" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D6738F2" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D6738F2" Ref="#PWR0519"  Part="1" 
AR Path="/5DDCCE71/5D6738F2" Ref="#PWR?"  Part="1" 
F 0 "#PWR0519" H 10050 5850 50  0001 C CNN
F 1 "GND" H 10055 5927 50  0000 C CNN
F 2 "" H 10050 6100 50  0001 C CNN
F 3 "" H 10050 6100 50  0001 C CNN
	1    10050 6100
	1    0    0    -1  
$EndComp
Text Label 1950 950  2    50   ~ 0
RESET
Wire Wire Line
	1200 950  1950 950 
Text HLabel 1200 950  0    50   Input ~ 0
RESET
Text HLabel 1200 1100 0    50   Input ~ 0
~WRITE-PC
Text Label 1950 1100 2    50   ~ 0
~WRITE-PC
Wire Wire Line
	1200 1100 1950 1100
Text Label 1950 1400 2    50   ~ 0
~READ-PC
Wire Wire Line
	1200 1400 1950 1400
Wire Wire Line
	1200 1250 1950 1250
Text Label 1950 1250 2    50   ~ 0
~ACTION-INCPC
Text HLabel 1200 1250 0    50   Input ~ 0
~ACTION-INCPC
Text HLabel 1200 1400 0    50   Input ~ 0
~READ-PC
Text Label 1950 1650 2    50   ~ 0
~FPPCL
Text Label 1950 1800 2    50   ~ 0
~FPPCH
Text HLabel 1200 1650 0    50   Input ~ 0
~FPPCL
Wire Wire Line
	1200 1650 1950 1650
Text HLabel 1200 1800 0    50   Input ~ 0
~FPPCH
Wire Wire Line
	1200 1800 1950 1800
NoConn ~ 3900 3450
NoConn ~ 3900 5500
NoConn ~ 3900 7100
NoConn ~ 3900 7000
NoConn ~ 3900 1900
Text Label 4400 3350 0    50   ~ 0
PC15
Text Label 4400 3250 0    50   ~ 0
PC14
Text Label 4400 3150 0    50   ~ 0
PC13
Text Label 4400 3050 0    50   ~ 0
PC12
Text Label 4400 2950 0    50   ~ 0
PC11
Text Label 4400 2850 0    50   ~ 0
PC10
Text Label 4400 2750 0    50   ~ 0
PC9
Text Label 4400 2650 0    50   ~ 0
PC8
Text Label 4400 7000 0    50   ~ 0
PC15
Text Label 4400 6900 0    50   ~ 0
PC14
Text Label 4400 6800 0    50   ~ 0
PC13
Text Label 4400 6700 0    50   ~ 0
PC12
Text Label 4400 6600 0    50   ~ 0
PC11
Text Label 4400 6500 0    50   ~ 0
PC10
Text Label 4400 6400 0    50   ~ 0
PC9
Text Label 4400 6300 0    50   ~ 0
PC8
Wire Wire Line
	2900 1100 2200 1100
Wire Wire Line
	2200 1200 2900 1200
Wire Wire Line
	2200 1300 2900 1300
Wire Wire Line
	2200 1400 2900 1400
Wire Wire Line
	3900 1100 4100 1100
Wire Wire Line
	3900 1200 4100 1200
Wire Wire Line
	3900 1300 4100 1300
Wire Wire Line
	3900 1400 4100 1400
Entry Wire Line
	4100 1100 4200 1200
Entry Wire Line
	4100 1200 4200 1300
Entry Wire Line
	4100 1300 4200 1400
Entry Wire Line
	4100 1400 4200 1500
$Comp
L alexios:74HC193 U?
U 1 1 5D673B9C
P 3400 3050
AR Path="/5D673B9C" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5D673B9C" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D673B9C" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D673B9C" Ref="U505"  Part="1" 
AR Path="/5DDCCE71/5D673B9C" Ref="U?"  Part="1" 
F 0 "U505" H 3400 3717 50  0000 C CNN
F 1 "74HC193" H 3400 3626 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 3400 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 3400 3050 50  0001 C CNN
	1    3400 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2650 2200 2650
Wire Wire Line
	2200 2750 2900 2750
Wire Wire Line
	2200 2850 2900 2850
Wire Wire Line
	2200 2950 2900 2950
Wire Wire Line
	3900 2650 4100 2650
Wire Wire Line
	3900 2750 4100 2750
Wire Wire Line
	3900 2850 4100 2850
Wire Wire Line
	3900 2950 4100 2950
Entry Wire Line
	4100 2650 4200 2750
Entry Wire Line
	4100 2750 4200 2850
Entry Wire Line
	4100 2850 4200 2950
Entry Wire Line
	4100 2950 4200 3050
$Comp
L alexios:74HC193 U?
U 1 1 5D673B86
P 3400 5100
AR Path="/5D673B86" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5D673B86" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D673B86" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D673B86" Ref="U507"  Part="1" 
AR Path="/5DDCCE71/5D673B86" Ref="U?"  Part="1" 
F 0 "U507" H 3400 5767 50  0000 C CNN
F 1 "74HC193" H 3400 5676 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 3400 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 3400 5100 50  0001 C CNN
	1    3400 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4700 2200 4700
Wire Wire Line
	2200 4800 2900 4800
Wire Wire Line
	2200 4900 2900 4900
Wire Wire Line
	2200 5000 2900 5000
Wire Wire Line
	3900 4700 4100 4700
Wire Wire Line
	3900 4800 4100 4800
Wire Wire Line
	3900 4900 4100 4900
Wire Wire Line
	3900 5000 4100 5000
$Comp
L alexios:74HC193 U?
U 1 1 5D673B70
P 3400 6700
AR Path="/5D673B70" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5D673B70" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D673B70" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D673B70" Ref="U510"  Part="1" 
AR Path="/5DDCCE71/5D673B70" Ref="U?"  Part="1" 
F 0 "U510" H 3400 7367 50  0000 C CNN
F 1 "74HC193" H 3400 7276 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 3400 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 3400 6700 50  0001 C CNN
	1    3400 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 6300 2200 6300
Wire Wire Line
	2200 6400 2900 6400
Wire Wire Line
	2200 6500 2900 6500
Wire Wire Line
	2200 6600 2900 6600
Wire Wire Line
	3900 6300 4100 6300
Wire Wire Line
	3900 6400 4100 6400
Wire Wire Line
	3900 6500 4100 6500
Wire Wire Line
	3900 6600 4100 6600
$Comp
L alexios:74HC193 U?
U 1 1 5D673B57
P 3400 1500
AR Path="/5D673B57" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5D673B57" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D673B57" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D673B57" Ref="U502"  Part="1" 
AR Path="/5DDCCE71/5D673B57" Ref="U?"  Part="1" 
F 0 "U502" H 3400 2167 50  0000 C CNN
F 1 "74HC193" H 3400 2076 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 3400 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 3400 1500 50  0001 C CNN
	1    3400 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D673AF7
P 5000 2100
AR Path="/5D673AF7" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D673AF7" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D673AF7" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673AF7" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673AF7" Ref="#PWR0510"  Part="1" 
AR Path="/5DDCCE71/5D673AF7" Ref="#PWR?"  Part="1" 
F 0 "#PWR0510" H 5000 1850 50  0001 C CNN
F 1 "GND" H 5005 1927 50  0000 C CNN
F 2 "" H 5000 2100 50  0001 C CNN
F 3 "" H 5000 2100 50  0001 C CNN
	1    5000 2100
	1    0    0    -1  
$EndComp
Text Label 2650 1100 0    50   ~ 0
IBUS0
Text Label 2650 1200 0    50   ~ 0
IBUS1
Text Label 2650 1300 0    50   ~ 0
IBUS2
Text Label 2650 1400 0    50   ~ 0
IBUS3
Text Label 2650 2650 0    50   ~ 0
IBUS4
Text Label 2650 2750 0    50   ~ 0
IBUS5
Text Label 2650 2850 0    50   ~ 0
IBUS6
Text Label 2650 2950 0    50   ~ 0
IBUS7
Text Label 2650 4700 0    50   ~ 0
IBUS8
Text Label 2650 4800 0    50   ~ 0
IBUS9
Text Label 2650 4900 0    50   ~ 0
IBUS10
Text Label 2650 5000 0    50   ~ 0
IBUS11
Text Label 2650 6300 0    50   ~ 0
IBUS12
Text Label 2650 6400 0    50   ~ 0
IBUS13
Text Label 2650 6500 0    50   ~ 0
IBUS14
Text Label 2650 6600 0    50   ~ 0
IBUS15
Text Label 3900 1100 0    50   ~ 0
PC0
Text Label 3900 1200 0    50   ~ 0
PC1
Text Label 3900 1300 0    50   ~ 0
PC2
Text Label 3900 1400 0    50   ~ 0
PC3
Text Label 3900 2650 0    50   ~ 0
PC4
Text Label 3900 2750 0    50   ~ 0
PC5
Text Label 3900 2850 0    50   ~ 0
PC6
Text Label 3900 2950 0    50   ~ 0
PC7
Text Label 3900 4700 0    50   ~ 0
PC8
Text Label 3900 4800 0    50   ~ 0
PC9
Text Label 3900 4900 0    50   ~ 0
PC10
Text Label 3900 5000 0    50   ~ 0
PC11
Text Label 3900 6300 0    50   ~ 0
PC12
Text Label 3900 6400 0    50   ~ 0
PC13
Text Label 3900 6500 0    50   ~ 0
PC14
Text Label 3900 6600 0    50   ~ 0
PC15
Wire Wire Line
	3900 3350 4000 3350
Wire Wire Line
	4000 3350 4000 3800
Wire Wire Line
	4000 3800 2550 3800
Wire Wire Line
	3900 5400 4050 5400
Wire Wire Line
	4050 5400 4050 5850
Wire Wire Line
	4050 5850 2550 5850
Wire Wire Line
	2650 1600 2900 1600
Wire Wire Line
	2900 1900 2400 1900
Text Label 2650 1800 0    50   ~ 0
~ACTION-INCPC
Text Label 2650 2000 0    50   ~ 0
RESET
Wire Wire Line
	2650 2000 2900 2000
Wire Wire Line
	2650 1800 2900 1800
Text Label 2650 1600 0    50   ~ 0
~WRITE-PC
Wire Wire Line
	2650 3150 2900 3150
Text Label 2650 3150 0    50   ~ 0
~WRITE-PC
Wire Wire Line
	2650 5200 2900 5200
Text Label 2650 5200 0    50   ~ 0
~WRITE-PC
Wire Wire Line
	2650 6800 2900 6800
Text Label 2650 6800 0    50   ~ 0
~WRITE-PC
Text Label 2650 3550 0    50   ~ 0
RESET
Wire Wire Line
	2650 3550 2900 3550
Text Label 2650 5600 0    50   ~ 0
RESET
Wire Wire Line
	2650 5600 2900 5600
Text Label 2650 7200 0    50   ~ 0
RESET
Wire Wire Line
	2650 7200 2900 7200
Wire Wire Line
	3900 1800 4050 1800
Wire Wire Line
	4050 1800 4050 2250
Wire Wire Line
	4050 2250 2550 2250
Wire Wire Line
	2550 2250 2550 3350
Wire Wire Line
	2550 3350 2900 3350
Wire Wire Line
	2550 3800 2550 5400
Wire Wire Line
	2550 5400 2900 5400
Wire Wire Line
	2550 5850 2550 7000
Wire Wire Line
	2550 7000 2900 7000
Wire Wire Line
	2900 7100 2400 7100
Wire Wire Line
	2900 5500 2400 5500
Wire Wire Line
	2900 3450 2400 3450
Text Label 4200 2300 1    50   ~ 0
PC[0..15]
Wire Wire Line
	5000 1100 4300 1100
Wire Wire Line
	5000 1200 4300 1200
Wire Wire Line
	5000 1300 4300 1300
Wire Wire Line
	5000 1400 4300 1400
Wire Wire Line
	5000 1500 4300 1500
Wire Wire Line
	5000 1600 4300 1600
Wire Wire Line
	5000 1700 4300 1700
Wire Wire Line
	5000 1800 4300 1800
Text Label 4400 1100 0    50   ~ 0
PC0
Text Label 4400 1200 0    50   ~ 0
PC1
Text Label 4400 1300 0    50   ~ 0
PC2
Text Label 4400 1400 0    50   ~ 0
PC3
Text Label 4400 1500 0    50   ~ 0
PC4
Text Label 4400 1600 0    50   ~ 0
PC5
Text Label 4400 1700 0    50   ~ 0
PC6
Text Label 4400 1800 0    50   ~ 0
PC7
Entry Wire Line
	4300 1100 4200 1200
Entry Wire Line
	4300 1300 4200 1400
Entry Wire Line
	4300 1200 4200 1300
Entry Wire Line
	4300 1400 4200 1500
Entry Wire Line
	4300 1500 4200 1600
Entry Wire Line
	4300 1600 4200 1700
Entry Wire Line
	4300 1700 4200 1800
Entry Wire Line
	4300 1800 4200 1900
$Comp
L power:GND #PWR?
U 1 1 5D673A4E
P 5000 3650
AR Path="/5D673A4E" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D673A4E" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D673A4E" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673A4E" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673A4E" Ref="#PWR0520"  Part="1" 
AR Path="/5DDCCE71/5D673A4E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0520" H 5000 3400 50  0001 C CNN
F 1 "GND" H 5005 3477 50  0000 C CNN
F 2 "" H 5000 3650 50  0001 C CNN
F 3 "" H 5000 3650 50  0001 C CNN
	1    5000 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2650 4300 2650
Wire Wire Line
	5000 2750 4300 2750
Wire Wire Line
	5000 2850 4300 2850
Wire Wire Line
	5000 2950 4300 2950
Wire Wire Line
	5000 3050 4300 3050
Wire Wire Line
	5000 3150 4300 3150
Wire Wire Line
	5000 3250 4300 3250
Wire Wire Line
	5000 3350 4300 3350
Entry Wire Line
	4300 2650 4200 2750
Entry Wire Line
	4300 2850 4200 2950
Entry Wire Line
	4300 2750 4200 2850
Entry Wire Line
	4300 2950 4200 3050
Entry Wire Line
	4300 3050 4200 3150
Entry Wire Line
	4300 3150 4200 3250
Entry Wire Line
	4300 3250 4200 3350
Entry Wire Line
	4300 3350 4200 3450
$Comp
L alexios:74HCT541 U?
U 1 1 5D673A29
P 5500 5200
AR Path="/5D673A29" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D673A29" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D673A29" Ref="U511"  Part="1" 
AR Path="/5DDCCE71/5D673A29" Ref="U?"  Part="1" 
F 0 "U511" H 5500 5967 50  0000 C CNN
F 1 "74HC541" H 5500 5876 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 5500 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 5500 5200 50  0001 C CNN
	1    5500 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D673A23
P 5000 5700
AR Path="/5D673A23" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D673A23" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D673A23" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D673A23" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D673A23" Ref="#PWR0522"  Part="1" 
AR Path="/5DDCCE71/5D673A23" Ref="#PWR?"  Part="1" 
F 0 "#PWR0522" H 5000 5450 50  0001 C CNN
F 1 "GND" H 5005 5527 50  0000 C CNN
F 2 "" H 5000 5700 50  0001 C CNN
F 3 "" H 5000 5700 50  0001 C CNN
	1    5000 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4700 4300 4700
Wire Wire Line
	5000 4800 4300 4800
Wire Wire Line
	5000 4900 4300 4900
Wire Wire Line
	5000 5000 4300 5000
Wire Wire Line
	5000 5100 4300 5100
Wire Wire Line
	5000 5200 4300 5200
Wire Wire Line
	5000 5300 4300 5300
Wire Wire Line
	5000 5400 4300 5400
Text Label 4400 4700 0    50   ~ 0
PC0
Text Label 4400 4800 0    50   ~ 0
PC1
Text Label 4400 4900 0    50   ~ 0
PC2
Text Label 4400 5000 0    50   ~ 0
PC3
Text Label 4400 5100 0    50   ~ 0
PC4
Text Label 4400 5200 0    50   ~ 0
PC5
Text Label 4400 5300 0    50   ~ 0
PC6
Text Label 4400 5400 0    50   ~ 0
PC7
$Comp
L alexios:74HCT541 U?
U 1 1 5D6739FF
P 5500 6800
AR Path="/5D6739FF" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D6739FF" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D6739FF" Ref="U501"  Part="1" 
AR Path="/5DDCCE71/5D6739FF" Ref="U?"  Part="1" 
F 0 "U501" H 5500 7567 50  0000 C CNN
F 1 "74HCT541" H 5500 7476 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 5500 6800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 5500 6800 50  0001 C CNN
	1    5500 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6739F9
P 5000 7300
AR Path="/5D6739F9" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D6739F9" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D6739F9" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D6739F9" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D6739F9" Ref="#PWR0524"  Part="1" 
AR Path="/5DDCCE71/5D6739F9" Ref="#PWR?"  Part="1" 
F 0 "#PWR0524" H 5000 7050 50  0001 C CNN
F 1 "GND" H 5005 7127 50  0000 C CNN
F 2 "" H 5000 7300 50  0001 C CNN
F 3 "" H 5000 7300 50  0001 C CNN
	1    5000 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6300 4300 6300
Wire Wire Line
	5000 6400 4300 6400
Wire Wire Line
	5000 6500 4300 6500
Wire Wire Line
	5000 6600 4300 6600
Wire Wire Line
	5000 6700 4300 6700
Wire Wire Line
	5000 6800 4300 6800
Wire Wire Line
	5000 6900 4300 6900
Wire Wire Line
	5000 7000 4300 7000
Text Label 4550 2000 0    50   ~ 0
~READ-PC
Wire Wire Line
	4550 2000 5000 2000
Text Label 4750 3550 0    50   ~ 0
~READ-PC
Wire Wire Line
	4750 3550 5000 3550
Wire Wire Line
	4750 5600 5000 5600
Text Label 4750 7200 0    50   ~ 0
~FPPCH
Wire Wire Line
	4750 7200 5000 7200
Text Label 4750 5600 0    50   ~ 0
~FPPCL
Wire Wire Line
	6000 4700 6350 4700
Wire Wire Line
	6000 4800 6350 4800
Wire Wire Line
	6000 4900 6350 4900
Wire Wire Line
	6000 5000 6350 5000
Wire Wire Line
	6000 5100 6350 5100
Wire Wire Line
	6000 5200 6350 5200
Wire Wire Line
	6000 5300 6350 5300
Wire Wire Line
	6000 5400 6350 5400
Wire Wire Line
	6000 6300 6350 6300
Wire Wire Line
	6000 6400 6350 6400
Wire Wire Line
	6000 6500 6350 6500
Wire Wire Line
	6000 6600 6350 6600
Wire Wire Line
	6000 6700 6350 6700
Wire Wire Line
	6000 6800 6350 6800
Wire Wire Line
	6000 6900 6350 6900
Wire Wire Line
	6000 7000 6350 7000
Text Label 6000 4700 0    50   ~ 0
FP0
Text Label 6000 4800 0    50   ~ 0
FP1
Text Label 6000 4900 0    50   ~ 0
FP2
Text Label 6000 5000 0    50   ~ 0
FP3
Text Label 6000 5100 0    50   ~ 0
FP4
Text Label 6000 5200 0    50   ~ 0
FP5
Text Label 6000 5300 0    50   ~ 0
FP6
Text Label 6000 5400 0    50   ~ 0
FP7
Text Label 6000 6300 0    50   ~ 0
FP0
Text Label 6000 6400 0    50   ~ 0
FP1
Text Label 6000 6500 0    50   ~ 0
FP2
Text Label 6000 6600 0    50   ~ 0
FP3
Text Label 6000 6700 0    50   ~ 0
FP4
Text Label 6000 6800 0    50   ~ 0
FP5
Text Label 6000 6900 0    50   ~ 0
FP6
Text Label 6000 7000 0    50   ~ 0
FP7
Entry Bus Bus
	6450 4450 6550 4350
Wire Bus Line
	6550 4350 7350 4350
Text Label 6700 4350 0    50   ~ 0
FPO[0..7]
Entry Bus Bus
	6350 700  6450 800 
Wire Wire Line
	6000 1100 6350 1100
Wire Wire Line
	6350 1200 6000 1200
Wire Wire Line
	6350 1300 6000 1300
Wire Wire Line
	6350 1400 6000 1400
Entry Wire Line
	6450 1000 6350 1100
Entry Wire Line
	6450 1100 6350 1200
Entry Wire Line
	6450 1200 6350 1300
Entry Wire Line
	6450 1300 6350 1400
Wire Wire Line
	6000 1500 6350 1500
Wire Wire Line
	6350 1600 6000 1600
Wire Wire Line
	6350 1700 6000 1700
Wire Wire Line
	6350 1800 6000 1800
Entry Wire Line
	6450 1400 6350 1500
Entry Wire Line
	6450 1500 6350 1600
Entry Wire Line
	6450 1600 6350 1700
Entry Wire Line
	6450 1700 6350 1800
Text Label 6050 1100 0    50   ~ 0
IBUS0
Text Label 6050 1200 0    50   ~ 0
IBUS1
Text Label 6050 1300 0    50   ~ 0
IBUS2
Text Label 6050 1400 0    50   ~ 0
IBUS3
Text Label 6050 1500 0    50   ~ 0
IBUS4
Text Label 6050 1600 0    50   ~ 0
IBUS5
Text Label 6050 1700 0    50   ~ 0
IBUS6
Text Label 6050 1800 0    50   ~ 0
IBUS7
Wire Wire Line
	6000 2650 6350 2650
Wire Wire Line
	6350 2750 6000 2750
Wire Wire Line
	6350 2850 6000 2850
Wire Wire Line
	6350 2950 6000 2950
Entry Wire Line
	6450 2550 6350 2650
Entry Wire Line
	6450 2650 6350 2750
Entry Wire Line
	6450 2750 6350 2850
Entry Wire Line
	6450 2850 6350 2950
Wire Wire Line
	6000 3050 6350 3050
Wire Wire Line
	6350 3150 6000 3150
Wire Wire Line
	6350 3250 6000 3250
Wire Wire Line
	6350 3350 6000 3350
Entry Wire Line
	6450 2950 6350 3050
Entry Wire Line
	6450 3050 6350 3150
Entry Wire Line
	6450 3150 6350 3250
Entry Wire Line
	6450 3250 6350 3350
Text Label 6050 2650 0    50   ~ 0
IBUS8
Text Label 6050 2750 0    50   ~ 0
IBUS9
Text Label 6050 2850 0    50   ~ 0
IBUS10
Text Label 6050 2950 0    50   ~ 0
IBUS11
Text Label 6050 3050 0    50   ~ 0
IBUS12
Text Label 6050 3150 0    50   ~ 0
IBUS13
Text Label 6050 3250 0    50   ~ 0
IBUS14
Text Label 6050 3350 0    50   ~ 0
IBUS15
Text Label 6450 2350 1    50   ~ 0
IBUS[0..15]
$Comp
L alexios:74HC541 U?
U 1 1 5D673AFD
P 5500 1600
AR Path="/5D673AFD" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D673AFD" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D673AFD" Ref="U503"  Part="1" 
AR Path="/5DDCCE71/5D673AFD" Ref="U?"  Part="1" 
F 0 "U503" H 5500 2367 50  0000 C CNN
F 1 "74HC541" H 5500 2276 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 5500 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 5500 1600 50  0001 C CNN
	1    5500 1600
	1    0    0    -1  
$EndComp
Connection ~ 8700 3500
Connection ~ 8700 3700
Connection ~ 8700 4300
Connection ~ 8700 4500
Connection ~ 8700 5100
Connection ~ 8700 5300
Connection ~ 8700 5900
Connection ~ 8700 6100
Connection ~ 10050 3500
Connection ~ 10050 3700
Connection ~ 10050 4300
Connection ~ 10050 4500
Connection ~ 10050 5100
Connection ~ 10050 5300
Connection ~ 10050 5900
Connection ~ 10050 6100
Entry Wire Line
	6350 4700 6450 4600
Entry Wire Line
	6350 4800 6450 4700
Entry Wire Line
	6350 4900 6450 4800
Entry Wire Line
	6350 5000 6450 4900
Entry Wire Line
	6350 5100 6450 5000
Entry Wire Line
	6350 5200 6450 5100
Entry Wire Line
	6350 5300 6450 5200
Entry Wire Line
	6350 5400 6450 5300
Entry Wire Line
	6350 6300 6450 6200
Entry Wire Line
	6350 6400 6450 6300
Entry Wire Line
	6350 6500 6450 6400
Entry Wire Line
	6350 6600 6450 6500
Entry Wire Line
	6350 6700 6450 6600
Entry Wire Line
	6350 6800 6450 6700
Entry Wire Line
	6350 6900 6450 6800
Entry Wire Line
	6350 7000 6450 6900
Wire Bus Line
	7350 4150 4300 4150
Entry Bus Bus
	4200 4050 4300 4150
Text Label 6700 4150 0    50   ~ 0
PC[0..15]
Entry Wire Line
	4200 4600 4300 4700
Entry Wire Line
	4200 4700 4300 4800
Entry Wire Line
	4200 4800 4300 4900
Entry Wire Line
	4200 4900 4300 5000
Entry Wire Line
	4200 5000 4300 5100
Entry Wire Line
	4200 5100 4300 5200
Entry Wire Line
	4200 5200 4300 5300
Entry Wire Line
	4200 5300 4300 5400
Entry Wire Line
	4200 6200 4300 6300
Entry Wire Line
	4200 6300 4300 6400
Entry Wire Line
	4200 6400 4300 6500
Entry Wire Line
	4200 6500 4300 6600
Entry Wire Line
	4200 6600 4300 6700
Entry Wire Line
	4200 6700 4300 6800
Entry Wire Line
	4200 6800 4300 6900
Entry Wire Line
	4200 6900 4300 7000
Entry Wire Line
	4100 4700 4200 4600
Entry Wire Line
	4100 4800 4200 4700
Entry Wire Line
	4100 4900 4200 4800
Entry Wire Line
	4100 5000 4200 4900
Entry Wire Line
	4100 6300 4200 6200
Entry Wire Line
	4100 6400 4200 6300
Entry Wire Line
	4100 6500 4200 6400
Entry Wire Line
	4100 6600 4200 6500
Entry Bus Bus
	4200 4250 4300 4150
Text Label 4200 5950 1    50   ~ 0
PC[0..15]
Text HLabel 7350 4150 2    50   Input ~ 0
PC[0..15]
Text Notes 7100 7000 0    197  ~ 39
Program Counter (PC)
$Comp
L alexios:74HC541 U?
U 1 1 5D673A54
P 5500 3150
AR Path="/5D673A54" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D673A54" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D673A54" Ref="U508"  Part="1" 
AR Path="/5DDCCE71/5D673A54" Ref="U?"  Part="1" 
F 0 "U508" H 5500 3917 50  0000 C CNN
F 1 "74HC541" H 5500 3826 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 5500 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 5500 3150 50  0001 C CNN
	1    5500 3150
	1    0    0    -1  
$EndComp
Wire Bus Line
	1200 700  6350 700 
Wire Bus Line
	2100 800  2100 6500
Wire Bus Line
	6450 4450 6450 6900
Wire Bus Line
	6450 800  6450 3250
Wire Bus Line
	4200 1200 4200 4050
Wire Bus Line
	4200 4250 4200 6900
$EndSCHEMATC
