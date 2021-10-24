EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 16 18
Title "Microcontroller and DFP Bus"
Date ""
Rev "2133"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Entry Wire Line
	6100 1200 6200 1100
Entry Wire Line
	6100 1300 6200 1200
Entry Wire Line
	6100 1400 6200 1300
Entry Wire Line
	6100 1500 6200 1400
Entry Wire Line
	6100 1600 6200 1500
Entry Wire Line
	6100 1700 6200 1600
Entry Wire Line
	6100 1800 6200 1700
Entry Wire Line
	6100 1900 6200 1800
Text Notes 2600 750  0    100  ~ 20
DFP Microcontroller
Text Label 2450 4900 2    50   ~ 0
~µCRAM
$Comp
L power:GND #PWR013
U 1 1 6085DCB4
P 950 4850
F 0 "#PWR013" H 950 4600 50  0001 C CNN
F 1 "GND" H 1100 4800 50  0000 C CNN
F 2 "" H 950 4850 50  0001 C CNN
F 3 "" H 950 4850 50  0001 C CNN
	1    950  4850
	-1   0    0    -1  
$EndComp
Text Label 2050 4800 0    50   ~ 0
ACT-LED
$Comp
L Device:R_Small R?
U 1 1 608B26E9
P 1400 4800
AR Path="/608B26E9" Ref="R?"  Part="1" 
AR Path="/64C48268/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/608B26E9" Ref="R?"  Part="1" 
AR Path="/60A2F394/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/608B26E9" Ref="R6"  Part="1" 
F 0 "R6" V 1500 4700 50  0000 C CNN
F 1 "1kΩ" V 1450 5000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 4800 50  0001 C CNN
F 3 "~" H 1400 4800 50  0001 C CNN
	1    1400 4800
	0    1    -1   0   
$EndComp
Wire Wire Line
	1250 7400 1550 7400
$Comp
L Device:LED_ALT D?
U 1 1 604918F8
P 1150 4800
AR Path="/604918F8" Ref="D?"  Part="1" 
AR Path="/64C48268/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/604918F8" Ref="D?"  Part="1" 
AR Path="/60A2F394/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/604918F8" Ref="D4"  Part="1" 
F 0 "D4" H 1100 4950 50  0000 C CNN
F 1 "LED_ALT" H 1143 4636 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1150 4800 50  0001 C CNN
F 3 "~" H 1150 4800 50  0001 C CNN
	1    1150 4800
	1    0    0    1   
$EndComp
Text Notes 6700 2900 0    100  ~ 20
Front Panel\nScanner Counter
Connection ~ 6700 3600
Text Label 6700 4600 1    50   ~ 0
SCANCLK
Wire Wire Line
	7750 5300 7650 5300
Connection ~ 7750 5300
Wire Wire Line
	7750 5250 7750 5300
Wire Wire Line
	7950 5300 7950 5350
Connection ~ 7950 5300
Wire Wire Line
	7950 5300 7750 5300
Wire Wire Line
	7950 5250 7950 5300
$Comp
L power:+5V #PWR?
U 1 1 601CE94F
P 6800 4950
AR Path="/601CE94F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE94F" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 6800 4800 50  0001 C CNN
F 1 "+5V" H 6815 5123 50  0000 C CNN
F 2 "" H 6800 4950 50  0001 C CNN
F 3 "" H 6800 4950 50  0001 C CNN
	1    6800 4950
	-1   0    0    -1  
$EndComp
$Comp
L alexios:CXO_DIP8 X?
U 1 1 601CE949
P 7350 5100
AR Path="/601CE949" Ref="X?"  Part="1" 
AR Path="/60757845/601CE949" Ref="X1"  Part="1" 
F 0 "X1" H 7450 5467 50  0000 C CNN
F 1 "7.3728 MHz?" H 7450 5376 50  0000 C CNN
F 2 "alexios:Oscillator_DIP-8-socket" H 7500 4700 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 7450 5050 50  0001 C CNN
	1    7350 5100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7950 5000 7750 5000
Connection ~ 7950 5000
Wire Wire Line
	7950 5000 7950 5050
$Comp
L Device:C_Small C?
U 1 1 601CE940
P 7950 5150
AR Path="/601CE940" Ref="C?"  Part="1" 
AR Path="/60757845/601CE940" Ref="C12"  Part="1" 
F 0 "C12" H 7850 5400 50  0000 R CNN
F 1 "1µF" H 7850 5150 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7950 5150 50  0001 C CNN
F 3 "~" H 7950 5150 50  0001 C CNN
	1    7950 5150
	-1   0    0    -1  
$EndComp
Connection ~ 7750 5000
Wire Wire Line
	7750 5050 7750 5000
Wire Wire Line
	7950 5000 7950 4950
Wire Wire Line
	7650 5000 7750 5000
$Comp
L power:GND #PWR?
U 1 1 601CE936
P 7950 5350
AR Path="/601CE936" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE936" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 7950 5100 50  0001 C CNN
F 1 "GND" H 7955 5177 50  0000 C CNN
F 2 "" H 7950 5350 50  0001 C CNN
F 3 "" H 7950 5350 50  0001 C CNN
	1    7950 5350
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 601CE930
P 7750 5150
AR Path="/601CE930" Ref="C?"  Part="1" 
AR Path="/60757845/601CE930" Ref="C11"  Part="1" 
F 0 "C11" H 7800 5400 50  0000 R CNN
F 1 "100nF" H 7900 4900 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7750 5150 50  0001 C CNN
F 3 "~" H 7750 5150 50  0001 C CNN
	1    7750 5150
	-1   0    0    -1  
$EndComp
Text Notes 8250 5350 0    50   ~ 0
Socket X2 and try frequencies that aren't harmonics\nof the CPU clock (4 MHz) to avoid strobe effects on\nthe front panel lights. The panel will update at 1/21\nthe crystal frequency.
Entry Wire Line
	8300 3300 8200 3200
Entry Wire Line
	8300 3400 8200 3300
Entry Wire Line
	8300 3500 8200 3400
Entry Wire Line
	8300 3600 8200 3500
Entry Wire Line
	8300 3700 8200 3600
Entry Wire Line
	8300 3800 8200 3700
Entry Wire Line
	8300 3900 8200 3800
Entry Wire Line
	8300 4000 8200 3900
Text Label 4700 3700 2    50   ~ 0
~µCMEM
Text Label 4700 3600 2    50   ~ 0
~µCIO
Text HLabel 1200 2400 0    50   Output ~ 0
~FPRESET
Text Label 1550 2400 0    50   ~ 0
~FPRESET
Text HLabel 1200 2500 0    50   Output ~ 0
~FPRSTHOLD
Text Label 1550 2500 0    50   ~ 0
~FPRSTHOLD
Wire Wire Line
	5200 2300 4350 2300
Wire Wire Line
	5200 2200 4350 2200
Connection ~ 7200 6350
Connection ~ 7200 6550
$Comp
L Device:C_Small C?
U 1 1 6416E28C
P 7200 6450
AR Path="/6416E28C" Ref="C?"  Part="1" 
AR Path="/60757845/6416E28C" Ref="C5"  Part="1" 
F 0 "C5" H 7109 6496 50  0000 R CNN
F 1 "100nF" H 7109 6405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7200 6450 50  0001 C CNN
F 3 "~" H 7200 6450 50  0001 C CNN
	1    7200 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6416E286
P 7200 6350
AR Path="/6416E286" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E286" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 7200 6200 50  0001 C CNN
F 1 "+5V" H 7215 6523 50  0000 C CNN
F 2 "" H 7200 6350 50  0001 C CNN
F 3 "" H 7200 6350 50  0001 C CNN
	1    7200 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6416E280
P 7200 6550
AR Path="/6416E280" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E280" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 7200 6300 50  0001 C CNN
F 1 "GND" H 7205 6377 50  0000 C CNN
F 2 "" H 7200 6550 50  0001 C CNN
F 3 "" H 7200 6550 50  0001 C CNN
	1    7200 6550
	1    0    0    -1  
$EndComp
Connection ~ 5950 6550
Connection ~ 5950 6350
$Comp
L Device:C_Small C?
U 1 1 641091C5
P 5950 6450
AR Path="/641091C5" Ref="C?"  Part="1" 
AR Path="/60757845/641091C5" Ref="C4"  Part="1" 
F 0 "C4" H 5859 6496 50  0000 R CNN
F 1 "100nF" H 5859 6405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5950 6450 50  0001 C CNN
F 3 "~" H 5950 6450 50  0001 C CNN
	1    5950 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 641091BF
P 5950 6350
AR Path="/641091BF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091BF" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 5950 6200 50  0001 C CNN
F 1 "+5V" H 5965 6523 50  0000 C CNN
F 2 "" H 5950 6350 50  0001 C CNN
F 3 "" H 5950 6350 50  0001 C CNN
	1    5950 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 641091B9
P 5950 6550
AR Path="/641091B9" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091B9" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 5950 6300 50  0001 C CNN
F 1 "GND" H 5955 6377 50  0000 C CNN
F 2 "" H 5950 6550 50  0001 C CNN
F 3 "" H 5950 6550 50  0001 C CNN
	1    5950 6550
	1    0    0    -1  
$EndComp
Connection ~ 5950 7200
Connection ~ 5950 7000
$Comp
L Device:C_Small C?
U 1 1 64073B48
P 5950 7100
AR Path="/64073B48" Ref="C?"  Part="1" 
AR Path="/60757845/64073B48" Ref="C3"  Part="1" 
F 0 "C3" H 5859 7146 50  0000 R CNN
F 1 "100nF" H 5859 7055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5950 7100 50  0001 C CNN
F 3 "~" H 5950 7100 50  0001 C CNN
	1    5950 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64073B42
P 5950 7000
AR Path="/64073B42" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B42" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 5950 6850 50  0001 C CNN
F 1 "+5V" H 5965 7173 50  0000 C CNN
F 2 "" H 5950 7000 50  0001 C CNN
F 3 "" H 5950 7000 50  0001 C CNN
	1    5950 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64073B3C
P 5950 7200
AR Path="/64073B3C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B3C" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 5950 6950 50  0001 C CNN
F 1 "GND" H 5955 7027 50  0000 C CNN
F 2 "" H 5950 7200 50  0001 C CNN
F 3 "" H 5950 7200 50  0001 C CNN
	1    5950 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U5
U 2 1 6403F195
P 7550 6850
F 0 "U5" H 7730 7296 50  0000 L CNN
F 1 "74HC245" H 7730 7205 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7550 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 7550 6900 50  0001 C CNN
	2    7550 6850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC590 U?
U 2 1 6403E919
P 6300 6800
AR Path="/6403E919" Ref="U?"  Part="1" 
AR Path="/6233F88C/6403E919" Ref="U?"  Part="1" 
AR Path="/60757845/6403E919" Ref="U4"  Part="2" 
F 0 "U4" H 6480 7196 50  0000 L CNN
F 1 "74HC590" H 6480 7105 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6600 7150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 6600 7150 50  0001 C CNN
	2    6300 6800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC573 U?
U 2 1 6403DE58
P 6450 7500
AR Path="/6403DE58" Ref="U?"  Part="1" 
AR Path="/60757845/6403DE58" Ref="U3"  Part="2" 
F 0 "U3" H 6480 7946 50  0000 L CNN
F 1 "74AC573" H 6480 7855 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6450 7500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 6450 7500 50  0001 C CNN
F 4 "Yes" H 1150 5750 50  0001 C CNN "Verified"
	2    6450 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2100 4650 2100
Wire Wire Line
	4450 2100 4350 2100
Text HLabel 5200 2100 2    50   Output ~ 0
~FPIRQ
Wire Wire Line
	1200 2200 2100 2200
Text HLabel 1750 4000 0    50   Output ~ 0
~CVOE
Wire Wire Line
	1750 4000 2550 4000
Text Notes 1850 6550 0    50   ~ 0
DTE/DCE cable config\n(aka I'm an idiot and always\nget the pinout wrong)
Text Label 1350 7400 0    50   ~ 0
RXD
Wire Wire Line
	2050 6900 2000 6900
$Comp
L alexios:SolderJumper_3_Bridged23 JP2
U 1 1 62B45C36
P 2150 6900
F 0 "JP2" V 1900 6900 50  0000 C CNN
F 1 "SolderJumper_3_Bridged23" H 2150 7010 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged23_RoundedPad1.0x1.5mm" H 2150 6900 50  0001 C CNN
F 3 "~" H 2150 6900 50  0001 C CNN
	1    2150 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 7100 2300 7100
Connection ~ 2150 7100
Wire Wire Line
	2150 7050 2150 7100
Wire Wire Line
	2300 7100 2300 6900
Wire Wire Line
	1900 7100 2150 7100
Wire Wire Line
	1900 7050 1900 7100
Wire Wire Line
	2150 6700 2300 6700
Connection ~ 2150 6700
Wire Wire Line
	2150 6750 2150 6700
Wire Wire Line
	2300 6800 2450 6800
Wire Wire Line
	2300 6700 2300 6800
Wire Wire Line
	1900 6700 2150 6700
Wire Wire Line
	1900 6750 1900 6700
Wire Wire Line
	1750 6900 1800 6900
$Comp
L alexios:SolderJumper_3_Bridged12 JP1
U 1 1 62B114C6
P 1900 6900
F 0 "JP1" V 1650 6900 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 1900 7010 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 1900 6900 50  0001 C CNN
F 3 "~" H 1900 6900 50  0001 C CNN
	1    1900 6900
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 61A9831B
P 2650 7000
AR Path="/61A9831B" Ref="J?"  Part="1" 
AR Path="/60757845/61A9831B" Ref="J1"  Part="1" 
F 0 "J1" H 2750 7350 50  0000 C CNN
F 1 "Conn_01x06" H 2730 6901 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 2650 7000 50  0001 C CNN
F 3 "~" H 2650 7000 50  0001 C CNN
	1    2650 7000
	1    0    0    1   
$EndComp
Wire Wire Line
	2450 6900 2300 6900
$Comp
L power:GND #PWR?
U 1 1 61A98322
P 2450 7200
AR Path="/61A98322" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A98322" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 2450 6950 50  0001 C CNN
F 1 "GND" H 2455 7027 50  0000 C CNN
F 2 "" H 2450 7200 50  0001 C CNN
F 3 "" H 2450 7200 50  0001 C CNN
	1    2450 7200
	-1   0    0    -1  
$EndComp
NoConn ~ 2450 7100
NoConn ~ 2450 6700
NoConn ~ 2450 7000
Text Notes 2750 6700 0    50   ~ 0
~RTS
Text Notes 2750 6800 0    50   ~ 0
RXD
Text Notes 2750 6900 0    50   ~ 0
TXD
Text Notes 2750 7000 0    50   ~ 0
Vcc
Text Notes 2750 7200 0    50   ~ 0
GND
Text Notes 2750 7100 0    50   ~ 0
~CTS
Text HLabel 1750 3900 0    50   Output ~ 0
~DBOE
Text HLabel 1750 3800 0    50   Output ~ 0
~ABOE
Text HLabel 1750 3700 0    50   Output ~ 0
~IBOE
Text HLabel 1750 3600 0    50   Output ~ 0
CLRWS
Text HLabel 5150 3400 2    50   3State ~ 0
~W
Text HLabel 5150 3500 2    50   3State ~ 0
~R
Text HLabel 5150 3600 2    50   3State ~ 0
~IO
Text HLabel 5150 3700 2    50   3State ~ 0
~MEM
Wire Wire Line
	5100 3700 5150 3700
Wire Wire Line
	5100 3600 5150 3600
Wire Wire Line
	5100 3500 5150 3500
Wire Wire Line
	5100 3400 5150 3400
Wire Wire Line
	4350 3400 4850 3400
Wire Wire Line
	4350 3500 4850 3500
Wire Wire Line
	4350 3600 4850 3600
Wire Wire Line
	4350 3700 4850 3700
Wire Wire Line
	2550 3900 1750 3900
Wire Wire Line
	2550 3800 1750 3800
Wire Wire Line
	2550 3700 1750 3700
Wire Wire Line
	2550 3600 1750 3600
Text Label 2450 5100 2    50   ~ 0
µCµSTEP
Text Label 2450 5000 2    50   ~ 0
µCCLKEN
Text HLabel 1750 5100 0    50   Output ~ 0
FPµSTEP-IN
Text HLabel 1750 5000 0    50   Output ~ 0
FPCLKEN-IN
Text HLabel 1750 4900 0    50   Output ~ 0
~FPRAM~∕ROM
$Comp
L alexios:momentary_switch SW1
U 1 1 61CAFDFF
P 2350 1800
F 0 "SW1" H 2350 1999 50  0000 C CNN
F 1 "momentary_switch" H 2350 1740 50  0001 C CNN
F 2 "alexios:SW_Tactile_SPST_Angled_PTS645Vx39-2LFS" H 2350 2000 50  0001 C CNN
F 3 "" H 2350 2000 50  0001 C CNN
	1    2350 1800
	-1   0    0    -1  
$EndComp
Text Label 1350 6900 0    50   ~ 0
TXD
$Comp
L Device:R_Small R?
U 1 1 61A9832D
P 1650 6900
AR Path="/61A9832D" Ref="R?"  Part="1" 
AR Path="/60757845/61A9832D" Ref="R5"  Part="1" 
F 0 "R5" V 1754 6900 50  0000 C CNN
F 1 "1kΩ" V 1845 6900 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 6900 50  0001 C CNN
F 3 "~" H 1650 6900 50  0001 C CNN
	1    1650 6900
	0    1    1    0   
$EndComp
Text Notes 3800 7650 2    100  ~ 20
Control Interface & TTYD
Text HLabel 1200 2200 0    50   Output ~ 0
~FPHALT
Entry Wire Line
	8200 3200 8100 3300
Entry Wire Line
	8200 3300 8100 3400
Entry Wire Line
	8200 3400 8100 3500
Entry Wire Line
	8200 3500 8100 3600
Entry Wire Line
	8200 3600 8100 3700
Text HLabel 10650 850  2    50   BiDi ~ 0
FPD[0..7]
Text Label 10300 850  0    50   ~ 0
FPD[0..7]
Entry Bus Bus
	10300 850  10200 950 
Entry Wire Line
	10100 1900 10200 1800
Entry Wire Line
	10100 1800 10200 1700
Entry Wire Line
	10100 1700 10200 1600
Entry Wire Line
	10100 1600 10200 1500
Entry Wire Line
	10100 1500 10200 1400
Entry Wire Line
	10100 1400 10200 1300
Entry Wire Line
	10100 1300 10200 1200
Entry Wire Line
	10100 1200 10200 1100
Entry Bus Bus
	8200 850  8300 950 
Entry Wire Line
	8400 1900 8300 1800
Entry Wire Line
	8400 1800 8300 1700
Entry Wire Line
	8400 1700 8300 1600
Entry Wire Line
	8400 1600 8300 1500
Entry Wire Line
	8400 1500 8300 1400
Entry Wire Line
	8400 1400 8300 1300
Entry Wire Line
	8400 1300 8300 1200
Entry Wire Line
	8400 1200 8300 1100
Text Label 1850 4000 0    50   ~ 0
~CVOE
Text Label 1550 2200 0    50   ~ 0
~FPHALT
Text Notes 6750 750  0    100  ~ 20
Address Latch
Text Label 8050 850  2    50   ~ 0
MCD[0..7]
Entry Bus Bus
	6200 950  6300 850 
Wire Wire Line
	7750 3600 8100 3600
Wire Wire Line
	7750 3700 8100 3700
NoConn ~ 7750 4200
Wire Wire Line
	6700 3600 6750 3600
Wire Wire Line
	6700 3500 6700 3600
Wire Wire Line
	6750 3500 6700 3500
$Comp
L power:GND #PWR?
U 1 1 60796430
P 6750 3300
AR Path="/60796430" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/60796430" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796430" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 6750 3050 50  0001 C CNN
F 1 "GND" V 6755 3172 50  0000 R CNN
F 2 "" H 6750 3300 50  0001 C CNN
F 3 "" H 6750 3300 50  0001 C CNN
	1    6750 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 3500 8100 3500
Wire Wire Line
	7750 3400 8100 3400
Wire Wire Line
	7750 3300 8100 3300
$Comp
L alexios:74HC590 U?
U 1 1 60796422
P 7250 3800
AR Path="/60796422" Ref="U?"  Part="1" 
AR Path="/6233F88C/60796422" Ref="U?"  Part="1" 
AR Path="/60757845/60796422" Ref="U4"  Part="1" 
F 0 "U4" H 7250 4567 50  0000 C CNN
F 1 "74HC590" H 7250 4476 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 7550 4150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 7550 4150 50  0001 C CNN
	1    7250 3800
	1    0    0    -1  
$EndComp
Text Label 8200 2500 1    50   ~ 0
MCA[0..7]
Entry Wire Line
	8100 1900 8200 2000
Entry Wire Line
	8100 1800 8200 1900
Entry Wire Line
	8100 1700 8200 1800
Entry Wire Line
	8100 1600 8200 1700
Entry Wire Line
	8100 1500 8200 1600
Entry Wire Line
	8100 1400 8200 1500
Entry Wire Line
	8100 1300 8200 1400
Entry Wire Line
	8100 1200 8200 1300
Text Label 4400 1900 0    50   ~ 0
MCD7
Text Label 4400 1800 0    50   ~ 0
MCD6
Text Label 4400 1700 0    50   ~ 0
MCD5
Text Label 4400 1600 0    50   ~ 0
MCD4
Text Label 4400 1500 0    50   ~ 0
MCD3
Text Label 4400 1400 0    50   ~ 0
MCD2
Text Label 4400 1300 0    50   ~ 0
MCD1
Text Label 4400 1200 0    50   ~ 0
MCD0
Text Label 5150 2300 2    50   ~ 0
MFD1
Text Label 5150 2200 2    50   ~ 0
MFD0
Text Label 1850 3700 0    50   ~ 0
~IBOE
Text Label 1850 3800 0    50   ~ 0
~ABOE
Text Label 1850 3900 0    50   ~ 0
~DBOE
Text Label 5150 2100 2    50   ~ 0
~FPIRQ
Text Label 4700 3400 2    50   ~ 0
~µCW
Text Label 4700 3500 2    50   ~ 0
~µCR
Text Label 1850 3600 0    50   ~ 0
CLRWS
Wire Wire Line
	2550 1200 2500 1200
$Comp
L power:+12V #PWR0160
U 1 1 61657A32
P 2500 1150
F 0 "#PWR0160" H 2500 1000 50  0001 C CNN
F 1 "+12V" H 2515 1323 50  0000 C CNN
F 2 "" H 2500 1150 50  0001 C CNN
F 3 "" H 2500 1150 50  0001 C CNN
	1    2500 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1150 2500 1200
NoConn ~ 2550 1300
NoConn ~ 2550 1700
$Comp
L power:GND #PWR0161
U 1 1 6172919D
P 2150 1800
F 0 "#PWR0161" H 2150 1550 50  0001 C CNN
F 1 "GND" H 2000 1750 50  0000 C CNN
F 2 "" H 2150 1800 50  0001 C CNN
F 3 "" H 2150 1800 50  0001 C CNN
	1    2150 1800
	1    0    0    -1  
$EndComp
Text Label 6400 2100 0    50   ~ 0
ALE
Entry Wire Line
	6300 1900 6200 1800
Entry Wire Line
	6300 1800 6200 1700
Entry Wire Line
	6300 1700 6200 1600
Entry Wire Line
	6300 1600 6200 1500
Entry Wire Line
	6300 1500 6200 1400
Entry Wire Line
	6300 1400 6200 1300
Entry Wire Line
	6300 1300 6200 1200
Entry Wire Line
	6300 1200 6200 1100
Wire Wire Line
	7750 1200 8100 1200
Wire Wire Line
	7750 1300 8100 1300
Wire Wire Line
	7750 1400 8100 1400
Wire Wire Line
	7750 1500 8100 1500
Wire Wire Line
	7750 1600 8100 1600
Wire Wire Line
	7750 1700 8100 1700
Wire Wire Line
	7750 1800 8100 1800
Wire Wire Line
	7750 1900 8100 1900
Wire Bus Line
	6300 850  8200 850 
Wire Bus Line
	10300 850  10650 850 
Text Notes 8800 750  0    100  ~ 20
Data Bus Buffer
Wire Wire Line
	2350 3000 2550 3000
Wire Wire Line
	2350 2900 2550 2900
Wire Wire Line
	2350 2800 2550 2800
Wire Wire Line
	2350 2700 2550 2700
Text Notes 1800 3500 0    50   ~ 0
µCU pulls up SWD
Text Label 1600 3400 0    50   ~ 0
SWD3
Text Label 1600 3300 0    50   ~ 0
SWD2
Text Label 1600 3200 0    50   ~ 0
SWD1
Text Label 1600 3100 0    50   ~ 0
SWD0
Text Label 1600 3000 0    50   ~ 0
SWA3
Text Label 1600 2900 0    50   ~ 0
SWA2
Text Label 1600 2800 0    50   ~ 0
SWA1
Text Label 1600 2700 0    50   ~ 0
SWA0
Text Label 4700 3900 2    50   ~ 0
~IOINT
Wire Wire Line
	4350 3900 5150 3900
Text HLabel 5200 2500 2    50   Output ~ 0
~LED-STOP
Text Label 5050 2500 2    50   ~ 0
~LED-STOP
Wire Wire Line
	4350 4000 5150 4000
Text HLabel 5150 3900 2    50   Input ~ 0
~IOINT
Text Label 4950 3200 2    50   ~ 0
~PANELEN
Text Label 4450 4700 0    50   ~ 0
STEP∕~RUN
Text Label 4950 3100 2    50   ~ 0
~AUTOSCAN
NoConn ~ 4350 4500
NoConn ~ 4350 4600
Text Notes 4450 4550 0    50   ~ 0
USART0 used for\nprogramming
$Comp
L Device:R_Small R?
U 1 1 6274D6EC
P 4550 2700
AR Path="/6274D6EC" Ref="R?"  Part="1" 
AR Path="/60757845/6274D6EC" Ref="R3"  Part="1" 
F 0 "R3" V 4600 2850 50  0000 C CNN
F 1 "30Ω" V 4600 2500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 2700 50  0001 C CNN
F 3 "~" H 4550 2700 50  0001 C CNN
	1    4550 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 2700 5200 2700
Text HLabel 5200 2700 2    50   Output ~ 0
~LTSON
Text Label 5000 5200 2    50   ~ 0
~RD
Text Label 5000 5100 2    50   ~ 0
~WR
Wire Wire Line
	6400 2100 6750 2100
Wire Wire Line
	4350 4100 4700 4100
Wire Wire Line
	4350 4200 4700 4200
Wire Wire Line
	4350 2500 5200 2500
NoConn ~ 4350 4900
NoConn ~ 4350 5600
NoConn ~ 4350 5700
NoConn ~ 4350 5400
$Comp
L Device:R_Small R?
U 1 1 6216E2A2
P 4550 2100
AR Path="/6216E2A2" Ref="R?"  Part="1" 
AR Path="/60757845/6216E2A2" Ref="R37"  Part="1" 
F 0 "R37" V 4650 2150 50  0000 C CNN
F 1 "30Ω" V 4600 1900 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 2100 50  0001 C CNN
F 3 "~" H 4550 2100 50  0001 C CNN
	1    4550 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6265D34E
P 2200 2300
AR Path="/6265D34E" Ref="R?"  Part="1" 
AR Path="/60757845/6265D34E" Ref="R39"  Part="1" 
F 0 "R39" V 2150 2450 50  0000 C CNN
F 1 "30Ω" V 2250 2100 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 2300 50  0001 C CNN
F 3 "~" H 2200 2300 50  0001 C CNN
	1    2200 2300
	0    -1   1    0   
$EndComp
Wire Wire Line
	2300 2200 2550 2200
$Comp
L Device:R_Small R?
U 1 1 626D97D3
P 2200 2200
AR Path="/626D97D3" Ref="R?"  Part="1" 
AR Path="/60757845/626D97D3" Ref="R38"  Part="1" 
F 0 "R38" V 2250 2350 50  0000 C CNN
F 1 "30Ω" V 2250 2000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 2200 50  0001 C CNN
F 3 "~" H 2200 2200 50  0001 C CNN
	1    2200 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 2300 2550 2300
$Comp
L Device:R_Small R?
U 1 1 6285AE62
P 2200 2500
AR Path="/6285AE62" Ref="R?"  Part="1" 
AR Path="/60757845/6285AE62" Ref="R41"  Part="1" 
F 0 "R41" V 2250 2650 50  0000 C CNN
F 1 "30Ω" V 2250 2300 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 2500 50  0001 C CNN
F 3 "~" H 2200 2500 50  0001 C CNN
	1    2200 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6285AE68
P 2200 2400
AR Path="/6285AE68" Ref="R?"  Part="1" 
AR Path="/60757845/6285AE68" Ref="R40"  Part="1" 
F 0 "R40" V 2250 2550 50  0000 C CNN
F 1 "30Ω" V 2250 2200 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 2400 50  0001 C CNN
F 3 "~" H 2200 2400 50  0001 C CNN
	1    2200 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 2400 2100 2400
Wire Wire Line
	2300 2400 2550 2400
Wire Wire Line
	1200 2500 2100 2500
Wire Wire Line
	2300 2500 2550 2500
NoConn ~ 4350 2800
NoConn ~ 4350 4300
Wire Wire Line
	6700 3600 6700 4900
$Comp
L power:+5V #PWR?
U 1 1 601CE92A
P 7950 4950
AR Path="/601CE92A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE92A" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 7950 4800 50  0001 C CNN
F 1 "+5V" H 7965 5123 50  0000 C CNN
F 2 "" H 7950 4950 50  0001 C CNN
F 3 "" H 7950 4950 50  0001 C CNN
	1    7950 4950
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 62FDCC3F
P 1650 7400
AR Path="/62FDCC3F" Ref="R?"  Part="1" 
AR Path="/60757845/62FDCC3F" Ref="R1"  Part="1" 
F 0 "R1" V 1754 7400 50  0000 C CNN
F 1 "1kΩ" V 1845 7400 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 7400 50  0001 C CNN
F 3 "~" H 1650 7400 50  0001 C CNN
	1    1650 7400
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 7400 2000 7400
Wire Wire Line
	2000 6900 2000 7400
Wire Wire Line
	1250 6900 1550 6900
$Comp
L Device:CP_Small C?
U 1 1 632C8EE9
P 2150 1300
AR Path="/632C8EE9" Ref="C?"  Part="1" 
AR Path="/5D34E810/632C8EE9" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/632C8EE9" Ref="C?"  Part="1" 
AR Path="/60757845/632C8EE9" Ref="C22"  Part="1" 
F 0 "C22" H 2062 1346 50  0000 R CNN
F 1 "100µF, 16V" H 2062 1255 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 2150 1300 50  0001 C CNN
F 3 "~" H 2150 1300 50  0001 C CNN
	1    2150 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 632C8EEF
P 2150 1450
AR Path="/5F67D4B5/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/632C8EEF" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 2150 1200 50  0001 C CNN
F 1 "GND" H 2072 1413 50  0000 R CNN
F 2 "" H 2150 1450 50  0001 C CNN
F 3 "" H 2150 1450 50  0001 C CNN
	1    2150 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1150 2150 1200
Wire Wire Line
	2150 1400 2150 1450
$Comp
L power:+12V #PWR0162
U 1 1 632E50B5
P 2150 1150
F 0 "#PWR0162" H 2150 1000 50  0001 C CNN
F 1 "+12V" H 2165 1323 50  0000 C CNN
F 2 "" H 2150 1150 50  0001 C CNN
F 3 "" H 2150 1150 50  0001 C CNN
	1    2150 1150
	1    0    0    -1  
$EndComp
Text Label 5000 5300 2    50   ~ 0
ALE
Wire Wire Line
	6300 1900 6750 1900
Wire Wire Line
	6300 1800 6750 1800
Wire Wire Line
	6300 1700 6750 1700
Wire Wire Line
	6300 1600 6750 1600
Wire Wire Line
	6300 1500 6750 1500
Wire Wire Line
	6300 1400 6750 1400
Wire Wire Line
	6300 1300 6750 1300
Wire Wire Line
	6300 1200 6750 1200
Text Label 6700 1200 2    50   ~ 0
MCD0
Text Label 6700 1300 2    50   ~ 0
MCD1
Text Label 6700 1400 2    50   ~ 0
MCD2
Text Label 6700 1500 2    50   ~ 0
MCD3
Text Label 6700 1600 2    50   ~ 0
MCD4
Text Label 6700 1700 2    50   ~ 0
MCD5
Text Label 6700 1800 2    50   ~ 0
MCD6
Text Label 6700 1900 2    50   ~ 0
MCD7
Text Label 7750 1200 0    50   ~ 0
FPA0
Text Label 7750 1300 0    50   ~ 0
FPA1
Text Label 7750 1400 0    50   ~ 0
FPA2
Text Label 7750 1500 0    50   ~ 0
FPA3
Text Label 7750 1600 0    50   ~ 0
FPA4
Text Label 7750 1700 0    50   ~ 0
FPA5
Text Label 7750 1800 0    50   ~ 0
FPA6
Text Label 7750 1900 0    50   ~ 0
FPA7
Text Label 7750 3300 0    50   ~ 0
FPA0
Text Label 7750 3400 0    50   ~ 0
FPA1
Text Label 7750 3500 0    50   ~ 0
FPA2
Text Label 7750 3600 0    50   ~ 0
FPA3
Text Label 7750 3700 0    50   ~ 0
FPA4
Text Label 10050 1200 2    50   ~ 0
FPD0
Text Label 10050 1300 2    50   ~ 0
FPD1
Text Label 10050 1400 2    50   ~ 0
FPD2
Text Label 10050 1500 2    50   ~ 0
FPD3
Text Label 10050 1600 2    50   ~ 0
FPD4
Text Label 10050 1700 2    50   ~ 0
FPD5
Text Label 10050 1800 2    50   ~ 0
FPD6
Text Label 10050 1900 2    50   ~ 0
FPD7
Text Label 8750 1200 2    50   ~ 0
MCD0
Wire Wire Line
	8400 1900 8850 1900
Wire Wire Line
	8400 1800 8850 1800
Wire Wire Line
	8400 1700 8850 1700
Wire Wire Line
	8400 1600 8850 1600
Wire Wire Line
	8400 1500 8850 1500
Wire Wire Line
	8400 1400 8850 1400
Wire Wire Line
	8400 1300 8850 1300
Wire Wire Line
	8400 1200 8850 1200
Text Label 8750 1300 2    50   ~ 0
MCD1
Text Label 8750 1400 2    50   ~ 0
MCD2
Text Label 8750 1500 2    50   ~ 0
MCD3
Text Label 8750 1600 2    50   ~ 0
MCD4
Text Label 8750 1700 2    50   ~ 0
MCD5
Text Label 8750 1800 2    50   ~ 0
MCD6
Text Label 8750 1900 2    50   ~ 0
MCD7
Entry Wire Line
	9550 3300 9650 3200
Entry Wire Line
	9550 3400 9650 3300
Entry Wire Line
	9550 3500 9650 3400
Entry Wire Line
	9550 3600 9650 3500
Entry Wire Line
	9550 3700 9650 3600
Entry Wire Line
	9550 3800 9650 3700
Entry Wire Line
	9550 3900 9650 3800
Entry Wire Line
	9550 4000 9650 3900
Entry Bus Bus
	9750 2950 9650 3050
Wire Bus Line
	10200 2950 9750 2950
Text Label 9800 2950 0    50   ~ 0
FPA[0..7]
Text HLabel 10200 2950 2    50   BiDi ~ 0
FPA[0..7]
Text Label 9300 3300 0    50   ~ 0
FPA0
Text Label 9300 3400 0    50   ~ 0
FPA1
Text Label 9300 3500 0    50   ~ 0
FPA2
Text Label 9300 3600 0    50   ~ 0
FPA3
Text Label 9300 3700 0    50   ~ 0
FPA4
Text Label 9300 3800 0    50   ~ 0
FPA5
Text Label 9300 3900 0    50   ~ 0
FPA6
Text Label 9300 4000 0    50   ~ 0
FPA7
$Comp
L Device:R_Small R?
U 1 1 6263FC4F
P 9050 6450
AR Path="/6263FC4F" Ref="R?"  Part="1" 
AR Path="/64C48268/6263FC4F" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/6263FC4F" Ref="R?"  Part="1" 
AR Path="/60A2F394/6263FC4F" Ref="R?"  Part="1" 
AR Path="/60757845/6263FC4F" Ref="R4"  Part="1" 
F 0 "R4" V 8854 6450 50  0000 C CNN
F 1 "10kΩ" V 8945 6450 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9050 6450 50  0001 C CNN
F 3 "~" H 9050 6450 50  0001 C CNN
	1    9050 6450
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0164
U 1 1 626550E7
P 9200 6550
F 0 "#PWR0164" H 9200 6300 50  0001 C CNN
F 1 "GND" H 9205 6377 50  0000 C CNN
F 2 "" H 9200 6550 50  0001 C CNN
F 3 "" H 9200 6550 50  0001 C CNN
	1    9200 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2300 1200 2300
Text Label 1200 2300 0    50   ~ 0
SPARE
Text Label 4700 4100 2    50   ~ 0
RXDA
Text Label 4700 4200 2    50   ~ 0
TXDA
Wire Wire Line
	2550 5400 2200 5400
Wire Wire Line
	2550 5500 2200 5500
Text Label 2200 5400 0    50   ~ 0
RXDB
Text Label 2200 5500 0    50   ~ 0
TXDB
$Comp
L alexios:SolderJumper_3_Bridged12 JP7
U 1 1 6276C558
P 1150 6900
F 0 "JP7" V 900 6900 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 1150 7010 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 1150 6900 50  0001 C CNN
F 3 "~" H 1150 6900 50  0001 C CNN
	1    1150 6900
	0    -1   1    0   
$EndComp
Wire Wire Line
	1150 6750 750  6750
Wire Wire Line
	1150 7050 750  7050
Text Label 750  6750 0    50   ~ 0
TXDA
Text Label 750  7050 0    50   ~ 0
TXDB
$Comp
L alexios:SolderJumper_3_Bridged12 JP9
U 1 1 627ADF72
P 1150 7400
F 0 "JP9" V 900 7400 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 1150 7510 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 1150 7400 50  0001 C CNN
F 3 "~" H 1150 7400 50  0001 C CNN
	1    1150 7400
	0    -1   1    0   
$EndComp
Wire Wire Line
	1150 7550 750  7550
Wire Wire Line
	1150 7250 750  7250
Text Label 750  7250 0    50   ~ 0
RXDA
Text Label 750  7550 0    50   ~ 0
RXDB
Wire Wire Line
	1750 4900 2550 4900
Wire Wire Line
	1750 5000 2550 5000
Wire Wire Line
	1750 5100 2550 5100
$Comp
L alexios:SolderJumper_3_Bridged12 JP501
U 1 1 611D7AFF
P 6550 4900
F 0 "JP501" V 6550 5100 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 6550 5010 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 6550 4900 50  0001 C CNN
F 3 "~" H 6550 4900 50  0001 C CNN
	1    6550 4900
	0    -1   -1   0   
$EndComp
Text Label 5200 2600 2    50   ~ 0
µCSCANCLK
Text Label 6050 4550 0    50   ~ 0
µCSCANCLK
Wire Wire Line
	6550 4550 6550 4750
Wire Wire Line
	6650 4900 6700 4900
Wire Wire Line
	6550 5050 6550 5150
Wire Wire Line
	6550 5150 6850 5150
Wire Wire Line
	9850 2100 10150 2100
Wire Wire Line
	10150 2200 9850 2200
Text Label 10150 2100 2    50   ~ 0
~WR
$Comp
L Device:R_Network08 RN7
U 1 1 6223B257
P 8800 4300
F 0 "RN7" H 9188 4346 50  0000 L CNN
F 1 "10kΩ" H 9188 4255 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9275 4300 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8800 4300 50  0001 C CNN
	1    8800 4300
	-1   0    0    1   
$EndComp
NoConn ~ 7750 4000
NoConn ~ 7750 3900
NoConn ~ 7750 3800
Wire Wire Line
	8300 3300 8500 3300
Wire Wire Line
	8300 3400 8600 3400
Wire Wire Line
	8300 3500 8700 3500
Wire Wire Line
	8300 3600 8800 3600
Wire Wire Line
	8300 3700 8900 3700
Wire Wire Line
	8300 4000 9200 4000
Wire Wire Line
	8300 3900 9100 3900
$Comp
L power:GND #PWR0232
U 1 1 63D7491E
P 9200 4500
F 0 "#PWR0232" H 9200 4250 50  0001 C CNN
F 1 "GND" H 9205 4327 50  0000 C CNN
F 2 "" H 9200 4500 50  0001 C CNN
F 3 "" H 9200 4500 50  0001 C CNN
	1    9200 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4100 8500 3300
Connection ~ 8500 3300
Wire Wire Line
	8500 3300 9550 3300
Wire Wire Line
	8600 4100 8600 3400
Connection ~ 8600 3400
Wire Wire Line
	8600 3400 9550 3400
Wire Wire Line
	8700 4100 8700 3500
Connection ~ 8700 3500
Wire Wire Line
	8700 3500 9550 3500
Wire Wire Line
	8800 4100 8800 3600
Connection ~ 8800 3600
Wire Wire Line
	8800 3600 9550 3600
Wire Wire Line
	8900 4100 8900 3700
Connection ~ 8900 3700
Wire Wire Line
	8900 3700 9550 3700
Wire Wire Line
	9000 4100 9000 3800
Wire Wire Line
	8300 3800 9000 3800
Connection ~ 9000 3800
Wire Wire Line
	9000 3800 9550 3800
Wire Wire Line
	9100 4100 9100 3900
Connection ~ 9100 3900
Wire Wire Line
	9100 3900 9550 3900
Wire Wire Line
	9200 4100 9200 4000
Connection ~ 9200 4000
Wire Wire Line
	9200 4000 9550 4000
Text Notes 8450 2900 0    100  ~ 20
Address Bus
Wire Wire Line
	4350 3000 4950 3000
Text Label 4950 3000 2    50   ~ 0
~BUSEN
$Comp
L Device:R_Small R?
U 1 1 67A9C2B9
P 2250 2700
AR Path="/67A9C2B9" Ref="R?"  Part="1" 
AR Path="/60757845/67A9C2B9" Ref="R1501"  Part="1" 
F 0 "R1501" V 2300 2900 50  0000 C CNN
F 1 "1kΩ" V 2300 2500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 2700 50  0001 C CNN
F 3 "~" H 2250 2700 50  0001 C CNN
	1    2250 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 2700 2150 2700
Wire Wire Line
	1500 2800 2150 2800
Wire Wire Line
	1500 2900 2150 2900
Wire Wire Line
	1500 3000 2150 3000
$Comp
L Device:R_Small R?
U 1 1 67B0D557
P 2250 2800
AR Path="/67B0D557" Ref="R?"  Part="1" 
AR Path="/60757845/67B0D557" Ref="R1502"  Part="1" 
F 0 "R1502" V 2300 3000 50  0000 C CNN
F 1 "1kΩ" V 2300 2600 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 2800 50  0001 C CNN
F 3 "~" H 2250 2800 50  0001 C CNN
	1    2250 2800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 67B0D6E4
P 2250 2900
AR Path="/67B0D6E4" Ref="R?"  Part="1" 
AR Path="/60757845/67B0D6E4" Ref="R1503"  Part="1" 
F 0 "R1503" V 2300 3100 50  0000 C CNN
F 1 "1kΩ" V 2300 2700 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 2900 50  0001 C CNN
F 3 "~" H 2250 2900 50  0001 C CNN
	1    2250 2900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 67B0D856
P 2250 3000
AR Path="/67B0D856" Ref="R?"  Part="1" 
AR Path="/60757845/67B0D856" Ref="R1504"  Part="1" 
F 0 "R1504" V 2300 3200 50  0000 C CNN
F 1 "1kΩ" V 2300 2800 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 3000 50  0001 C CNN
F 3 "~" H 2250 3000 50  0001 C CNN
	1    2250 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 3100 2550 3100
Wire Wire Line
	1500 3200 2550 3200
Wire Wire Line
	1500 3300 2550 3300
Wire Wire Line
	1500 3400 2550 3400
Text Notes 5650 4725 0    50   ~ 0
(= ~LED-RUN)
Wire Wire Line
	4350 4700 5150 4700
Text HLabel 5150 4700 2    50   Output ~ 0
STEP∕~RUN
Text HLabel 5150 5100 2    50   Output ~ 0
~WR
Text HLabel 5150 5200 2    50   Output ~ 0
~RD
NoConn ~ 2550 4100
NoConn ~ 2550 4200
Wire Wire Line
	4350 3200 5150 3200
Text HLabel 5150 3200 2    50   Output ~ 0
~PANELEN
Wire Wire Line
	4350 3100 5150 3100
Text HLabel 5150 3100 2    50   Output ~ 0
~AUTOSCAN
Wire Wire Line
	4350 2600 5750 2600
Wire Wire Line
	5750 2600 5750 4550
Text HLabel 1200 3150 0    50   Output ~ 0
SWA[0..3]
Text HLabel 1200 3700 0    50   Input ~ 0
SWD[0..3]
Entry Wire Line
	1400 2600 1500 2700
Entry Wire Line
	1400 2700 1500 2800
Entry Wire Line
	1400 2800 1500 2900
Entry Wire Line
	1500 3400 1400 3500
Entry Wire Line
	1500 3300 1400 3400
Entry Wire Line
	1500 3200 1400 3300
Entry Wire Line
	1500 3100 1400 3200
Entry Wire Line
	1400 2900 1500 3000
Entry Bus Bus
	1400 3600 1300 3700
Wire Bus Line
	1300 3700 1200 3700
Entry Bus Bus
	1400 3050 1300 3150
Wire Bus Line
	1300 3150 1200 3150
Wire Wire Line
	4450 2700 4350 2700
Wire Wire Line
	4350 2400 5200 2400
Text Label 4950 2400 0    50   ~ 0
MFD2
Text HLabel 5200 2300 2    50   Output ~ 0
MFD1
Text HLabel 5200 2200 2    50   Output ~ 0
MFD0
Text HLabel 5200 2400 2    50   Output ~ 0
MFD2
Text Label 2450 5200 2    50   ~ 0
µCBUSCP
NoConn ~ 2550 4300
Wire Wire Line
	1750 5200 2550 5200
Text HLabel 1750 5200 0    50   Output ~ 0
BUSCP
$Comp
L Device:R_Small R?
U 1 1 612966AB
P 5750 2450
AR Path="/612966AB" Ref="R?"  Part="1" 
AR Path="/64C48268/612966AB" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/612966AB" Ref="R?"  Part="1" 
AR Path="/60A2F394/612966AB" Ref="R?"  Part="1" 
AR Path="/60757845/612966AB" Ref="R402"  Part="1" 
F 0 "R402" H 5691 2496 50  0000 R CNN
F 1 "10kΩ" H 5691 2405 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5750 2450 50  0001 C CNN
F 3 "~" H 5750 2450 50  0001 C CNN
	1    5750 2450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5750 2550 5750 2600
$Comp
L power:+5V #PWR0403
U 1 1 612AB944
P 5750 2350
F 0 "#PWR0403" H 5750 2200 50  0001 C CNN
F 1 "+5V" H 5900 2400 50  0000 C CNN
F 2 "" H 5750 2350 50  0001 C CNN
F 3 "" H 5750 2350 50  0001 C CNN
	1    5750 2350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U5
U 1 1 60AE5F32
P 9350 1700
F 0 "U5" H 9350 2467 50  0000 C CNN
F 1 "74HC245" H 9350 2376 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9350 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 9350 1750 50  0001 C CNN
	1    9350 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4350 1900 6100 1900
Wire Wire Line
	4350 1800 6100 1800
Wire Wire Line
	4350 1700 6100 1700
Wire Wire Line
	4350 1600 6100 1600
Wire Wire Line
	4350 1500 6100 1500
Wire Wire Line
	4350 1400 6100 1400
Wire Wire Line
	4350 1300 6100 1300
Wire Wire Line
	4350 1200 6100 1200
Wire Wire Line
	9850 1200 10100 1200
Wire Wire Line
	9850 1300 10100 1300
Wire Wire Line
	9850 1400 10100 1400
Wire Wire Line
	9850 1500 10100 1500
Wire Wire Line
	9850 1600 10100 1600
Wire Wire Line
	9850 1700 10100 1700
Wire Wire Line
	9850 1800 10100 1800
Wire Wire Line
	9850 1900 10100 1900
Wire Wire Line
	5750 4550 6550 4550
Connection ~ 5750 2600
Wire Wire Line
	6400 2200 6750 2200
Text Label 6250 4200 0    50   ~ 0
~AUTOSCAN
Wire Wire Line
	6250 4200 6750 4200
Text HLabel 6200 3800 0    50   Input ~ 0
~SCANCLR
Wire Wire Line
	6200 3800 6750 3800
Text Label 6250 3800 0    50   ~ 0
~SCANCLR
Wire Wire Line
	9750 6450 9350 6450
Text Label 9350 6450 0    50   ~ 0
~WR
Wire Wire Line
	9750 6350 9350 6350
Text Label 9350 6350 0    50   ~ 0
~RD
Wire Wire Line
	4350 5100 5150 5100
Wire Wire Line
	4350 5200 5150 5200
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 623E1F1D
P 5000 3700
AR Path="/623E1F1D" Ref="RN?"  Part="1" 
AR Path="/60757845/623E1F1D" Ref="RN4"  Part="1" 
F 0 "RN4" H 5100 3600 50  0000 L CNN
F 1 "30Ω" H 4750 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 5000 3780 50  0001 C CNN
F 3 "~" V 5000 3700 50  0001 C CNN
	1    5000 3700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 623E1F2F
P 5000 3400
AR Path="/623E1F2F" Ref="RN?"  Part="4" 
AR Path="/60757845/623E1F2F" Ref="RN4"  Part="4" 
F 0 "RN4" H 5100 3450 50  0001 L CNN
F 1 "30Ω" H 4975 3506 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 5000 3480 50  0001 C CNN
F 3 "~" V 5000 3400 50  0001 C CNN
	4    5000 3400
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 623E1F23
P 5000 3600
AR Path="/623E1F23" Ref="RN?"  Part="2" 
AR Path="/60757845/623E1F23" Ref="RN4"  Part="2" 
F 0 "RN4" H 5100 3650 50  0001 L CNN
F 1 "30Ω" H 4975 3706 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 5000 3680 50  0001 C CNN
F 3 "~" V 5000 3600 50  0001 C CNN
	2    5000 3600
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 623E1F29
P 5000 3500
AR Path="/623E1F29" Ref="RN?"  Part="3" 
AR Path="/60757845/623E1F29" Ref="RN4"  Part="3" 
F 0 "RN4" H 5100 3550 50  0001 L CNN
F 1 "30Ω" H 4975 3606 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 5000 3580 50  0001 C CNN
F 3 "~" V 5000 3500 50  0001 C CNN
	3    5000 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0404
U 1 1 61B5C1F5
P 10950 6050
F 0 "#PWR0404" H 10950 5900 50  0001 C CNN
F 1 "+5V" H 10800 6100 50  0000 C CNN
F 2 "" H 10950 6050 50  0001 C CNN
F 3 "" H 10950 6050 50  0001 C CNN
	1    10950 6050
	1    0    0    -1  
$EndComp
Text Label 10250 6450 0    50   ~ 0
~PANELEN
Wire Wire Line
	10650 6450 10250 6450
Text Label 10250 6150 0    50   ~ 0
~AUTOSCAN
Wire Wire Line
	10650 6150 10250 6150
Text Label 10250 6250 0    50   ~ 0
~BUSEN
Wire Wire Line
	10650 6250 10250 6250
$Comp
L alexios:R_Pack04 RN401
U 1 1 61C096CC
P 10750 6150
F 0 "RN401" H 10750 5700 50  0000 C CNN
F 1 "10kΩ" H 10700 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 10800 6230 50  0001 C CNN
F 3 "~" V 10800 6150 50  0001 C CNN
	1    10750 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 6050 10950 6150
Wire Wire Line
	10950 6450 10900 6450
Wire Wire Line
	10900 6350 10950 6350
Connection ~ 10950 6350
Wire Wire Line
	10950 6350 10950 6450
Wire Wire Line
	10900 6250 10950 6250
Connection ~ 10950 6250
Wire Wire Line
	10950 6250 10950 6350
Wire Wire Line
	10900 6150 10950 6150
Connection ~ 10950 6150
Wire Wire Line
	10950 6150 10950 6250
NoConn ~ 10650 6350
$Comp
L power:+5V #PWR0126
U 1 1 61D72186
P 10050 6050
F 0 "#PWR0126" H 10050 5900 50  0001 C CNN
F 1 "+5V" H 9900 6100 50  0000 C CNN
F 2 "" H 10050 6050 50  0001 C CNN
F 3 "" H 10050 6050 50  0001 C CNN
	1    10050 6050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04 RN402
U 1 1 61D7218C
P 9850 6150
F 0 "RN402" H 9850 5700 50  0000 C CNN
F 1 "10kΩ" H 9800 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 9900 6230 50  0001 C CNN
F 3 "~" V 9900 6150 50  0001 C CNN
	1    9850 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 6050 10050 6150
Wire Wire Line
	10050 6450 10000 6450
Wire Wire Line
	10000 6350 10050 6350
Connection ~ 10050 6350
Wire Wire Line
	10050 6350 10050 6450
Wire Wire Line
	10000 6250 10050 6250
Connection ~ 10050 6250
Wire Wire Line
	10050 6250 10050 6350
Wire Wire Line
	10000 6150 10050 6150
Connection ~ 10050 6150
Wire Wire Line
	10050 6150 10050 6250
NoConn ~ 2550 4700
Wire Wire Line
	4350 5300 5000 5300
Wire Wire Line
	9200 6550 9200 6450
Wire Wire Line
	9200 6450 9150 6450
Wire Wire Line
	8950 6450 8550 6450
Text Label 8550 6450 0    50   ~ 0
ALE
Wire Wire Line
	6800 4950 6800 5000
Wire Wire Line
	6800 5000 6850 5000
Text Label 9350 6250 0    50   ~ 0
µCBUSCP
Wire Wire Line
	9750 6250 9350 6250
Wire Wire Line
	9750 6150 9350 6150
Text Label 9350 6150 0    50   ~ 0
µCµSTEP
Text Label 4700 4000 2    50   ~ 0
WAIT
Text HLabel 5150 4000 2    50   Input ~ 0
WAIT
Wire Wire Line
	4350 4800 5150 4800
Text HLabel 5150 4800 2    50   Output ~ 0
~µSTEP
Text Label 4450 4800 0    50   ~ 0
~µSTEP
$Comp
L alexios:Arduino-Mega-2560 J8
U 1 1 6158B038
P 3450 3500
F 0 "J8" H 3450 6139 60  0000 C CNN
F 1 "Arduino-Mega-2560" H 3450 6033 60  0000 C CNN
F 2 "alexios:Arduino-Mega-2560-Mezzanine-Upside-Down" H 4125 6250 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-mega-2560-rev3" H 4125 6250 60  0001 C CNN
	1    3450 3500
	1    0    0    -1  
$EndComp
NoConn ~ 4350 3300
$Comp
L alexios:74AC573 U?
U 1 1 6079616A
P 7250 1700
AR Path="/6079616A" Ref="U?"  Part="1" 
AR Path="/60757845/6079616A" Ref="U3"  Part="1" 
F 0 "U3" H 7250 2467 50  0000 C CNN
F 1 "74AC573" H 7250 2376 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7250 1700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 7250 1700 50  0001 C CNN
F 4 "Yes" H 1950 -50 50  0001 C CNN "Verified"
	1    7250 1700
	1    0    0    -1  
$EndComp
Text Label 6400 2200 0    50   ~ 0
~BUSEN
Text Label 10150 2200 2    50   ~ 0
~BUSEN
NoConn ~ 2550 2000
NoConn ~ 2550 2100
NoConn ~ 2550 1500
NoConn ~ 2550 5700
NoConn ~ 2550 5800
NoConn ~ 2550 5900
NoConn ~ 2550 6000
NoConn ~ 1200 2300
$Comp
L power:GND #PWR0101
U 1 1 61DAC69D
P 4050 6850
F 0 "#PWR0101" H 4050 6600 50  0001 C CNN
F 1 "GND" H 4200 6800 50  0000 C CNN
F 2 "" H 4050 6850 50  0001 C CNN
F 3 "" H 4050 6850 50  0001 C CNN
	1    4050 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 61DAC6A3
P 3650 6850
AR Path="/61DAC6A3" Ref="R?"  Part="1" 
AR Path="/64C48268/61DAC6A3" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/61DAC6A3" Ref="R?"  Part="1" 
AR Path="/60A2F394/61DAC6A3" Ref="R?"  Part="1" 
AR Path="/60757845/61DAC6A3" Ref="R7"  Part="1" 
F 0 "R7" V 3846 6850 50  0000 C CNN
F 1 "1kΩ" V 3755 6850 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 6850 50  0001 C CNN
F 3 "~" H 3650 6850 50  0001 C CNN
	1    3650 6850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 61DAC6A9
P 3900 6850
AR Path="/61DAC6A9" Ref="D?"  Part="1" 
AR Path="/64C48268/61DAC6A9" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/61DAC6A9" Ref="D?"  Part="1" 
AR Path="/60A2F394/61DAC6A9" Ref="D?"  Part="1" 
AR Path="/60757845/61DAC6A9" Ref="D2"  Part="1" 
F 0 "D2" H 3893 6687 50  0000 C CNN
F 1 "LED_ALT" H 3893 6686 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 6850 50  0001 C CNN
F 3 "~" H 3900 6850 50  0001 C CNN
	1    3900 6850
	-1   0    0    1   
$EndComp
Wire Wire Line
	3550 6850 3100 6850
Text Label 3100 6850 0    50   ~ 0
~LED-STOP
Text HLabel 1750 4100 0    50   Output ~ 0
~CLR
Wire Wire Line
	2550 4500 2450 4500
Text Label 1850 4100 0    50   ~ 0
~CLR
Wire Wire Line
	1750 4100 2450 4100
Wire Wire Line
	2450 4100 2450 4500
Wire Wire Line
	1500 4800 2550 4800
$Comp
L Device:LED_ALT D?
U 1 1 622DACA0
P 1150 4600
AR Path="/622DACA0" Ref="D?"  Part="1" 
AR Path="/64C48268/622DACA0" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/622DACA0" Ref="D?"  Part="1" 
AR Path="/60A2F394/622DACA0" Ref="D?"  Part="1" 
AR Path="/60757845/622DACA0" Ref="D3"  Part="1" 
F 0 "D3" H 1150 4450 50  0000 C CNN
F 1 "LED_ALT" H 1143 4436 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1150 4600 50  0001 C CNN
F 3 "~" H 1150 4600 50  0001 C CNN
	1    1150 4600
	1    0    0    1   
$EndComp
Wire Wire Line
	1000 4600 950  4600
Wire Wire Line
	1000 4800 950  4800
Wire Wire Line
	950  4600 950  4800
Wire Wire Line
	950  4800 950  4850
Connection ~ 950  4800
$Comp
L Device:R_Small R?
U 1 1 62313475
P 1400 4600
AR Path="/62313475" Ref="R?"  Part="1" 
AR Path="/64C48268/62313475" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/62313475" Ref="R?"  Part="1" 
AR Path="/60A2F394/62313475" Ref="R?"  Part="1" 
AR Path="/60757845/62313475" Ref="R8"  Part="1" 
F 0 "R8" V 1500 4500 50  0000 C CNN
F 1 "1kΩ" V 1450 4800 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 4600 50  0001 C CNN
F 3 "~" H 1400 4600 50  0001 C CNN
	1    1400 4600
	0    1    -1   0   
$EndComp
Wire Wire Line
	1500 4600 2550 4600
Wire Bus Line
	1400 3200 1400 3600
Wire Bus Line
	1400 2600 1400 3050
Wire Bus Line
	9650 3050 9650 3900
Wire Bus Line
	8300 950  8300 1800
Wire Bus Line
	10200 950  10200 1800
Wire Bus Line
	6200 950  6200 1800
Wire Bus Line
	8200 1300 8200 3900
Text Label 2050 4600 0    50   ~ 0
PANEL-LED
Text Notes 4400 2850 0    50   ~ 0
D13 is Arduino LED.
$EndSCHEMATC
