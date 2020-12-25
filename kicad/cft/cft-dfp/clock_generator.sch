EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 13 15
Title "CFT Clock Generator"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC590 U?
U 1 1 6119F170
P 4350 3650
AR Path="/6119F170" Ref="U?"  Part="1" 
AR Path="/61175D3B/6119F170" Ref="U30"  Part="1" 
F 0 "U30" H 4350 4417 50  0000 C CNN
F 1 "74HC139" H 4350 4326 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4650 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4650 4000 50  0001 C CNN
	1    4350 3650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U?
U 1 1 6119F176
P 5600 3250
AR Path="/6119F176" Ref="U?"  Part="1" 
AR Path="/61175D3B/6119F176" Ref="U31"  Part="1" 
F 0 "U31" H 5600 3617 50  0000 C CNN
F 1 "74HC139" H 5600 3526 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5600 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5600 3250 50  0001 C CNN
	1    5600 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U?
U 2 1 6119F17C
P 5600 3850
AR Path="/6119F17C" Ref="U?"  Part="2" 
AR Path="/61175D3B/6119F17C" Ref="U31"  Part="2" 
F 0 "U31" H 5600 3475 50  0000 C CNN
F 1 "74HC139" H 5600 3384 50  0001 C CNN
F 2 "alexios:SOIC-16" H 5600 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5600 3850 50  0001 C CNN
	2    5600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3750 6150 3750
Wire Wire Line
	4850 3250 4950 3250
Wire Wire Line
	4950 3250 4950 3750
Wire Wire Line
	4950 3750 5100 3750
Connection ~ 4950 3250
Wire Wire Line
	4950 3250 5100 3250
$Comp
L power:GND #PWR?
U 1 1 6119F188
P 5050 4100
AR Path="/6119F188" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6119F188" Ref="#PWR0168"  Part="1" 
F 0 "#PWR0168" H 5050 3850 50  0001 C CNN
F 1 "GND" H 5055 3927 50  0000 C CNN
F 2 "" H 5050 4100 50  0001 C CNN
F 3 "" H 5050 4100 50  0001 C CNN
	1    5050 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4050 5050 4050
Wire Wire Line
	5050 4050 5050 4100
NoConn ~ 4850 3350
NoConn ~ 4850 3450
NoConn ~ 4850 3550
NoConn ~ 4850 3650
NoConn ~ 4850 3750
NoConn ~ 4850 3850
NoConn ~ 4850 4050
$Comp
L power:GND #PWR?
U 1 1 6119F197
P 3800 4100
AR Path="/6119F197" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6119F197" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 3800 3850 50  0001 C CNN
F 1 "GND" H 3805 3927 50  0000 C CNN
F 2 "" H 3800 4100 50  0001 C CNN
F 3 "" H 3800 4100 50  0001 C CNN
	1    3800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4050 3800 4050
Wire Wire Line
	3800 4050 3800 4100
Wire Wire Line
	3850 3350 3800 3350
Wire Wire Line
	3850 3450 3800 3450
Wire Wire Line
	3800 3450 3800 3350
Wire Wire Line
	3800 3450 3150 3450
Connection ~ 3800 3450
Wire Wire Line
	6250 3850 6250 3650
Wire Wire Line
	6100 3850 6250 3850
Wire Wire Line
	6250 3650 6550 3650
Wire Wire Line
	6150 3550 6550 3550
Wire Wire Line
	6100 3450 6550 3450
Wire Wire Line
	6100 3350 6550 3350
Wire Wire Line
	6100 3250 6550 3250
Wire Wire Line
	6100 3150 6550 3150
Wire Wire Line
	7850 3450 8550 3450
Wire Wire Line
	7850 3350 8550 3350
Wire Wire Line
	7850 3250 8550 3250
Wire Wire Line
	7850 3150 8550 3150
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6119F1B8
P 7750 3850
AR Path="/6119F1B8" Ref="RN?"  Part="4" 
AR Path="/61175D3B/6119F1B8" Ref="RN30"  Part="2" 
F 0 "RN30" H 7650 3700 50  0000 L CNN
F 1 "30Ω" H 7950 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7750 3930 50  0001 C CNN
F 3 "~" V 7750 3850 50  0001 C CNN
	2    7750 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6119F1BE
P 7750 3750
AR Path="/6119F1BE" Ref="RN?"  Part="3" 
AR Path="/61175D3B/6119F1BE" Ref="RN30"  Part="1" 
F 0 "RN30" H 7850 3800 50  0001 L CNN
F 1 "30Ω" H 7725 3856 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7750 3830 50  0001 C CNN
F 3 "~" V 7750 3750 50  0001 C CNN
	1    7750 3750
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6119F1C4
P 7750 3650
AR Path="/6119F1C4" Ref="RN?"  Part="2" 
AR Path="/61175D3B/6119F1C4" Ref="RN29"  Part="4" 
F 0 "RN29" H 7850 3700 50  0001 L CNN
F 1 "30Ω" H 7725 3756 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7750 3730 50  0001 C CNN
F 3 "~" V 7750 3650 50  0001 C CNN
	4    7750 3650
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6119F1CA
P 7750 3450
AR Path="/6119F1CA" Ref="RN?"  Part="4" 
AR Path="/61175D3B/6119F1CA" Ref="RN29"  Part="2" 
F 0 "RN29" H 7850 3500 50  0001 L CNN
F 1 "30Ω" H 7725 3556 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7750 3530 50  0001 C CNN
F 3 "~" V 7750 3450 50  0001 C CNN
	2    7750 3450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6119F1D0
P 7750 3350
AR Path="/6119F1D0" Ref="RN?"  Part="3" 
AR Path="/61175D3B/6119F1D0" Ref="RN29"  Part="1" 
F 0 "RN29" H 7850 3400 50  0001 L CNN
F 1 "30Ω" H 7725 3456 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7750 3430 50  0001 C CNN
F 3 "~" V 7750 3350 50  0001 C CNN
	1    7750 3350
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6119F1D6
P 7750 3250
AR Path="/6119F1D6" Ref="RN?"  Part="2" 
AR Path="/61175D3B/6119F1D6" Ref="RN28"  Part="4" 
F 0 "RN28" H 7850 3300 50  0001 L CNN
F 1 "30Ω" H 7725 3356 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7750 3330 50  0001 C CNN
F 3 "~" V 7750 3250 50  0001 C CNN
	4    7750 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3850 7600 3850
Wire Wire Line
	7550 3750 7600 3750
Wire Wire Line
	7550 3650 7600 3650
Wire Wire Line
	7550 3550 7600 3550
Wire Wire Line
	7550 3450 7600 3450
Wire Wire Line
	7550 3350 7600 3350
Wire Wire Line
	7550 3250 7600 3250
Wire Wire Line
	7550 3150 7600 3150
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6119F1E4
P 7750 3150
AR Path="/6119F1E4" Ref="RN?"  Part="1" 
AR Path="/61175D3B/6119F1E4" Ref="RN28"  Part="3" 
F 0 "RN28" H 7650 3300 50  0000 L CNN
F 1 "30Ω" H 7900 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7750 3230 50  0001 C CNN
F 3 "~" V 7750 3150 50  0001 C CNN
	3    7750 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 6119F1EA
P 7050 3650
AR Path="/6119F1EA" Ref="U?"  Part="1" 
AR Path="/61175D3B/6119F1EA" Ref="U32"  Part="1" 
F 0 "U32" H 7050 4417 50  0000 C CNN
F 1 "74HC541" H 7050 4326 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7050 3650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7050 3650 50  0001 C CNN
	1    7050 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4050 6500 4050
Wire Wire Line
	6500 4050 6500 4150
Wire Wire Line
	6550 4150 6500 4150
Connection ~ 6500 4150
Wire Wire Line
	4850 3150 5100 3150
Wire Wire Line
	5100 3850 5050 3850
Wire Wire Line
	5050 3850 5050 4050
Connection ~ 5050 4050
$Comp
L power:GND #PWR?
U 1 1 6119F1F8
P 5050 3500
AR Path="/6119F1F8" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6119F1F8" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 5050 3250 50  0001 C CNN
F 1 "GND" H 5055 3327 50  0000 C CNN
F 2 "" H 5050 3500 50  0001 C CNN
F 3 "" H 5050 3500 50  0001 C CNN
	1    5050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3500 5050 3450
Wire Wire Line
	5050 3450 5100 3450
Wire Wire Line
	6150 3750 6150 3550
Text Label 6350 3150 0    50   ~ 0
LCLK1
Text Label 6350 3250 0    50   ~ 0
LCLK2
Text Label 6350 3350 0    50   ~ 0
LCLK3
Text Label 6350 3450 0    50   ~ 0
LCLK4
Text Label 6350 3550 0    50   ~ 0
LT12
Text Label 6350 3650 0    50   ~ 0
LT34
Wire Wire Line
	6550 3750 6500 3750
Wire Wire Line
	6500 3750 6500 3850
Wire Wire Line
	6550 3850 6500 3850
Connection ~ 6500 3850
NoConn ~ 6100 3950
NoConn ~ 6100 4050
Text Label 3200 4850 0    50   ~ 0
~LCLKEN
$Comp
L power:+5V #PWR?
U 1 1 6119F20F
P 3800 3650
AR Path="/6119F20F" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6119F20F" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 3800 3500 50  0001 C CNN
F 1 "+5V" H 3742 3687 50  0000 R CNN
F 2 "" H 3800 3650 50  0001 C CNN
F 3 "" H 3800 3650 50  0001 C CNN
	1    3800 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3650 3850 3650
Text Label 3250 3450 0    50   ~ 0
CLK
Text Label 8250 3150 2    50   ~ 0
CLK1
Text Label 8250 3250 2    50   ~ 0
CLK2
Text Label 8250 3350 2    50   ~ 0
CLK3
Text Label 8250 3450 2    50   ~ 0
CLK4
Text Label 8250 3650 2    50   ~ 0
T34
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6119F21C
P 7750 3550
AR Path="/6119F21C" Ref="RN?"  Part="1" 
AR Path="/61175D3B/6119F21C" Ref="RN29"  Part="3" 
F 0 "RN29" H 7850 3600 50  0001 L CNN
F 1 "30Ω" H 7950 3150 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7750 3630 50  0001 C CNN
F 3 "~" V 7750 3550 50  0001 C CNN
	3    7750 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 6119F222
P 8150 3550
AR Path="/6119F222" Ref="TP?"  Part="1" 
AR Path="/61175D3B/6119F222" Ref="TP10"  Part="1" 
F 0 "TP10" V 8150 3738 50  0000 L CNN
F 1 "TestPoint" V 8195 3738 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 8350 3550 50  0001 C CNN
F 3 "~" H 8350 3550 50  0001 C CNN
	1    8150 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 3550 8150 3550
$Comp
L Connector:TestPoint TP?
U 1 1 6119F229
P 8150 3750
AR Path="/6119F229" Ref="TP?"  Part="1" 
AR Path="/61175D3B/6119F229" Ref="TP11"  Part="1" 
F 0 "TP11" V 8150 3938 50  0000 L CNN
F 1 "TestPoint" V 8195 3938 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 8350 3750 50  0001 C CNN
F 3 "~" H 8350 3750 50  0001 C CNN
	1    8150 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 3750 8150 3750
$Comp
L Connector:TestPoint TP?
U 1 1 6119F230
P 8150 3850
AR Path="/6119F230" Ref="TP?"  Part="1" 
AR Path="/61175D3B/6119F230" Ref="TP12"  Part="1" 
F 0 "TP12" V 8150 4038 50  0000 L CNN
F 1 "TestPoint" V 8195 4038 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 8350 3850 50  0001 C CNN
F 3 "~" H 8350 3850 50  0001 C CNN
	1    8150 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 3850 8150 3850
Text HLabel 8550 3150 2    50   Input ~ 0
CLK1
Text HLabel 8550 3250 2    50   Input ~ 0
CLK2
Text HLabel 8550 3350 2    50   Input ~ 0
CLK3
Text HLabel 8550 3450 2    50   Input ~ 0
CLK4
Text HLabel 8550 3650 2    50   Input ~ 0
T34
Wire Wire Line
	7850 3650 8550 3650
Text HLabel 3150 3450 0    50   Input ~ 0
CLK
Text HLabel 3150 4850 0    50   Input ~ 0
~LCLKEN
$Comp
L power:+5V #PWR?
U 1 1 6119F23F
P 6300 4500
AR Path="/6119F23F" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6119F23F" Ref="#PWR0169"  Part="1" 
F 0 "#PWR0169" H 6300 4350 50  0001 C CNN
F 1 "+5V" H 6315 4673 50  0000 C CNN
F 2 "" H 6300 4500 50  0001 C CNN
F 3 "" H 6300 4500 50  0001 C CNN
	1    6300 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3850 6500 3900
$Comp
L power:GND #PWR?
U 1 1 6119F246
P 6500 3900
AR Path="/6119F246" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6119F246" Ref="#PWR0170"  Part="1" 
F 0 "#PWR0170" H 6500 3650 50  0001 C CNN
F 1 "GND" H 6350 3800 50  0000 C CNN
F 2 "" H 6500 3900 50  0001 C CNN
F 3 "" H 6500 3900 50  0001 C CNN
	1    6500 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6119F24C
P 7400 4550
AR Path="/66CDCD87/6119F24C" Ref="#PWR?"  Part="1" 
AR Path="/60A2F394/6119F24C" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/60FF3530/6119F24C" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/6100D438/6119F24C" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/6119F24C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611019EB/6119F24C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/611243B5/6119F24C" Ref="#PWR?"  Part="1" 
AR Path="/6119F24C" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6119F24C" Ref="#PWR0171"  Part="1" 
F 0 "#PWR0171" H 7400 4400 50  0001 C CNN
F 1 "+5V" H 7415 4723 50  0000 C CNN
F 2 "" H 7400 4550 50  0001 C CNN
F 3 "" H 7400 4550 50  0001 C CNN
	1    7400 4550
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 6119F252
P 7100 4650
AR Path="/6119F252" Ref="D?"  Part="1" 
AR Path="/64C48268/6119F252" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/6119F252" Ref="D?"  Part="1" 
AR Path="/60A2F394/6119F252" Ref="D?"  Part="1" 
AR Path="/66CDCD87/60FF3530/6119F252" Ref="D?"  Part="1" 
AR Path="/66CDCD87/6100D438/6119F252" Ref="D?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/6119F252" Ref="D?"  Part="1" 
AR Path="/60757845/611019EB/6119F252" Ref="D?"  Part="1" 
AR Path="/60757845/611243B5/6119F252" Ref="D?"  Part="1" 
AR Path="/61175D3B/6119F252" Ref="D21"  Part="1" 
F 0 "D21" H 7100 4750 50  0000 C CNN
F 1 "LED_ALT" H 7093 4486 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7100 4650 50  0001 C CNN
F 3 "~" H 7100 4650 50  0001 C CNN
	1    7100 4650
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6119F258
P 6850 4650
AR Path="/6119F258" Ref="R?"  Part="1" 
AR Path="/64C48268/6119F258" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/6119F258" Ref="R?"  Part="1" 
AR Path="/60A2F394/6119F258" Ref="R?"  Part="1" 
AR Path="/66CDCD87/60FF3530/6119F258" Ref="R?"  Part="1" 
AR Path="/66CDCD87/6100D438/6119F258" Ref="R?"  Part="1" 
AR Path="/66CDCD87/610E2BBB/6119F258" Ref="R?"  Part="1" 
AR Path="/60757845/611019EB/6119F258" Ref="R?"  Part="1" 
AR Path="/60757845/611243B5/6119F258" Ref="R?"  Part="1" 
AR Path="/61175D3B/6119F258" Ref="R35"  Part="1" 
F 0 "R35" V 6654 4650 50  0000 C CNN
F 1 "680Ω" V 6745 4650 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 4650 50  0001 C CNN
F 3 "~" H 6850 4650 50  0001 C CNN
	1    6850 4650
	0    -1   1    0   
$EndComp
Wire Wire Line
	6300 4850 3150 4850
Wire Wire Line
	7250 4650 7400 4650
Wire Wire Line
	7400 4650 7400 4550
Wire Wire Line
	6500 4150 6500 4650
$Comp
L alexios:SolderJumper_3_Bridged12 JP?
U 1 1 6119F25E
P 6300 4650
AR Path="/6119F25E" Ref="JP?"  Part="1" 
AR Path="/61175D3B/6119F25E" Ref="JP9"  Part="1" 
F 0 "JP9" V 6300 4800 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 6300 4760 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 6300 4650 50  0001 C CNN
F 3 "~" H 6300 4650 50  0001 C CNN
	1    6300 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6400 4650 6500 4650
Wire Wire Line
	6300 4800 6300 4850
Wire Wire Line
	6500 4650 6750 4650
Connection ~ 6500 4650
Text Notes 4200 2400 0    50   ~ 0
This is a duplicate of the clock generator on the CTL card, and is available here so\nother subsystems of the computer can be tested before the CTL card is built or\nwithout it present on the bus.\n\nThe local clock generator is controlled directly by the MCU, but may also be disabled\nmanually using the solder jumper.
Text Notes 4200 1700 0    100  ~ 20
CFT Clock Generator
Text Label 3250 3150 0    50   ~ 0
~CLKEN
Text HLabel 3150 3150 0    50   Input ~ 0
~CLKEN
Wire Wire Line
	3150 3150 3850 3150
$Comp
L Device:C_Small C?
U 1 1 6B624E6B
P 4050 7250
AR Path="/6B624E6B" Ref="C?"  Part="1" 
AR Path="/60757845/6B624E6B" Ref="C?"  Part="1" 
AR Path="/61175D3B/6B624E6B" Ref="C65"  Part="1" 
F 0 "C65" H 3959 7296 50  0000 R CNN
F 1 "100nF" H 3959 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 7250 50  0001 C CNN
F 3 "~" H 4050 7250 50  0001 C CNN
	1    4050 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B624E71
P 4050 7150
AR Path="/6B624E71" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6B624E71" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6B624E71" Ref="#PWR0205"  Part="1" 
F 0 "#PWR0205" H 4050 7000 50  0001 C CNN
F 1 "+5V" H 4065 7323 50  0000 C CNN
F 2 "" H 4050 7150 50  0001 C CNN
F 3 "" H 4050 7150 50  0001 C CNN
	1    4050 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B624E77
P 4050 7350
AR Path="/6B624E77" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6B624E77" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6B624E77" Ref="#PWR0206"  Part="1" 
F 0 "#PWR0206" H 4050 7100 50  0001 C CNN
F 1 "GND" H 4055 7177 50  0000 C CNN
F 2 "" H 4050 7350 50  0001 C CNN
F 3 "" H 4050 7350 50  0001 C CNN
	1    4050 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B624E7F
P 2800 7250
AR Path="/6B624E7F" Ref="C?"  Part="1" 
AR Path="/60757845/6B624E7F" Ref="C?"  Part="1" 
AR Path="/61175D3B/6B624E7F" Ref="C58"  Part="1" 
F 0 "C58" H 2709 7296 50  0000 R CNN
F 1 "100nF" H 2709 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2800 7250 50  0001 C CNN
F 3 "~" H 2800 7250 50  0001 C CNN
	1    2800 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B624E85
P 2800 7150
AR Path="/6B624E85" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6B624E85" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6B624E85" Ref="#PWR0180"  Part="1" 
F 0 "#PWR0180" H 2800 7000 50  0001 C CNN
F 1 "+5V" H 2815 7323 50  0000 C CNN
F 2 "" H 2800 7150 50  0001 C CNN
F 3 "" H 2800 7150 50  0001 C CNN
	1    2800 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B624E8B
P 2800 7350
AR Path="/6B624E8B" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6B624E8B" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6B624E8B" Ref="#PWR0181"  Part="1" 
F 0 "#PWR0181" H 2800 7100 50  0001 C CNN
F 1 "GND" H 2805 7177 50  0000 C CNN
F 2 "" H 2800 7350 50  0001 C CNN
F 3 "" H 2800 7350 50  0001 C CNN
	1    2800 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC590 U?
U 2 1 6B626203
P 3150 7600
AR Path="/6B626203" Ref="U?"  Part="1" 
AR Path="/61175D3B/6B626203" Ref="U30"  Part="2" 
F 0 "U30" H 3330 7996 50  0000 L CNN
F 1 "74HC139" H 3330 7905 50  0000 L CNN
F 2 "alexios:SOIC-16" H 3450 7950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 3450 7950 50  0001 C CNN
	2    3150 7600
	1    0    0    -1  
$EndComp
Connection ~ 2800 7150
Connection ~ 2800 7350
$Comp
L alexios:74HC139 U?
U 3 1 6B628B09
P 4400 7250
AR Path="/6B628B09" Ref="U?"  Part="1" 
AR Path="/61175D3B/6B628B09" Ref="U31"  Part="3" 
F 0 "U31" H 4580 7296 50  0000 L CNN
F 1 "74HC139" H 4580 7205 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4400 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4400 7250 50  0001 C CNN
	3    4400 7250
	1    0    0    -1  
$EndComp
Connection ~ 4050 7150
Connection ~ 4050 7350
$Comp
L alexios:74HC541 U?
U 2 1 6B629A7A
P 5700 7250
AR Path="/6B629A7A" Ref="U?"  Part="1" 
AR Path="/61175D3B/6B629A7A" Ref="U32"  Part="2" 
F 0 "U32" H 5880 7296 50  0000 L CNN
F 1 "74HC541" H 5880 7205 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5700 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 5700 7250 50  0001 C CNN
	2    5700 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B62AAFE
P 5350 7250
AR Path="/6B62AAFE" Ref="C?"  Part="1" 
AR Path="/60757845/6B62AAFE" Ref="C?"  Part="1" 
AR Path="/61175D3B/6B62AAFE" Ref="C66"  Part="1" 
F 0 "C66" H 5259 7296 50  0000 R CNN
F 1 "100nF" H 5259 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 7250 50  0001 C CNN
F 3 "~" H 5350 7250 50  0001 C CNN
	1    5350 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B62AB04
P 5350 7150
AR Path="/6B62AB04" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6B62AB04" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6B62AB04" Ref="#PWR0207"  Part="1" 
F 0 "#PWR0207" H 5350 7000 50  0001 C CNN
F 1 "+5V" H 5365 7323 50  0000 C CNN
F 2 "" H 5350 7150 50  0001 C CNN
F 3 "" H 5350 7150 50  0001 C CNN
	1    5350 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B62AB0A
P 5350 7350
AR Path="/6B62AB0A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6B62AB0A" Ref="#PWR?"  Part="1" 
AR Path="/61175D3B/6B62AB0A" Ref="#PWR0208"  Part="1" 
F 0 "#PWR0208" H 5350 7100 50  0001 C CNN
F 1 "GND" H 5355 7177 50  0000 C CNN
F 2 "" H 5350 7350 50  0001 C CNN
F 3 "" H 5350 7350 50  0001 C CNN
	1    5350 7350
	1    0    0    -1  
$EndComp
Connection ~ 5350 7350
Connection ~ 5350 7150
$EndSCHEMATC
