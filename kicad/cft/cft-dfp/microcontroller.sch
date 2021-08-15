EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 19 18
Title "Microcontroller and DFP Bus"
Date ""
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 14600 1950 0    50   ~ 0
Consider single resistors here
Text Notes 13600 500  2    63   ~ 13
SIGNALS TO CHECK
Text Notes 12700 1150 0    63   ~ 0
Ensure these signals are pulled up/down during MCU reset:\n\n* ~WR~\n* ~RD~\n* ALE\n* ~LCLKEN~\n* ~FPHALT~ (likely open drain)\n* 
Entry Wire Line
	6100 1450 6200 1350
Entry Wire Line
	6100 1550 6200 1450
Entry Wire Line
	6100 1650 6200 1550
Entry Wire Line
	6100 1750 6200 1650
Entry Wire Line
	6100 1850 6200 1750
Entry Wire Line
	6100 1950 6200 1850
Entry Wire Line
	6100 2050 6200 1950
Entry Wire Line
	6100 2150 6200 2050
Text Notes 2600 1000 0    100  ~ 20
DFP Microcontroller
Text Label 2450 5150 2    50   ~ 0
~µCRAM
Wire Wire Line
	2550 5050 2000 5050
Wire Wire Line
	2000 4900 1750 4900
Wire Wire Line
	2000 5050 2000 4900
$Comp
L power:GND #PWR013
U 1 1 6085DCB4
P 1250 4900
F 0 "#PWR013" H 1250 4650 50  0001 C CNN
F 1 "GND" H 1400 4850 50  0000 C CNN
F 2 "" H 1250 4900 50  0001 C CNN
F 3 "" H 1250 4900 50  0001 C CNN
	1    1250 4900
	-1   0    0    -1  
$EndComp
Text Label 2050 5050 0    50   ~ 0
ACT-LED
$Comp
L Device:R_Small R?
U 1 1 608B26E9
P 1650 4900
AR Path="/608B26E9" Ref="R?"  Part="1" 
AR Path="/64C48268/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/608B26E9" Ref="R?"  Part="1" 
AR Path="/60A2F394/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/608B26E9" Ref="R6"  Part="1" 
F 0 "R6" V 1846 4900 50  0000 C CNN
F 1 "680Ω" V 1755 4900 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 4900 50  0001 C CNN
F 3 "~" H 1650 4900 50  0001 C CNN
	1    1650 4900
	0    1    -1   0   
$EndComp
Wire Wire Line
	15450 8750 15750 8750
$Comp
L Device:LED_ALT D?
U 1 1 604918F8
P 1400 4900
AR Path="/604918F8" Ref="D?"  Part="1" 
AR Path="/64C48268/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/604918F8" Ref="D?"  Part="1" 
AR Path="/60A2F394/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/604918F8" Ref="D4"  Part="1" 
F 0 "D4" H 1393 4737 50  0000 C CNN
F 1 "LED_ALT" H 1393 4736 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 4900 50  0001 C CNN
F 3 "~" H 1400 4900 50  0001 C CNN
	1    1400 4900
	1    0    0    1   
$EndComp
Text Notes 6700 3150 0    100  ~ 20
Front Panel\nScanner Counter
Connection ~ 6700 3850
Text Label 6700 4850 1    50   ~ 0
SCANCLK
Wire Wire Line
	7750 5550 7650 5550
Connection ~ 7750 5550
Wire Wire Line
	7750 5500 7750 5550
Wire Wire Line
	7950 5550 7950 5600
Connection ~ 7950 5550
Wire Wire Line
	7950 5550 7750 5550
Wire Wire Line
	7950 5500 7950 5550
$Comp
L power:+5V #PWR?
U 1 1 601CE94F
P 6800 5200
AR Path="/601CE94F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE94F" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 6800 5050 50  0001 C CNN
F 1 "+5V" H 6815 5373 50  0000 C CNN
F 2 "" H 6800 5200 50  0001 C CNN
F 3 "" H 6800 5200 50  0001 C CNN
	1    6800 5200
	-1   0    0    -1  
$EndComp
$Comp
L alexios:CXO_DIP8 X?
U 1 1 601CE949
P 7350 5350
AR Path="/601CE949" Ref="X?"  Part="1" 
AR Path="/60757845/601CE949" Ref="X1"  Part="1" 
F 0 "X1" H 7450 5717 50  0000 C CNN
F 1 "7.3728 MHz?" H 7450 5626 50  0000 C CNN
F 2 "alexios:Oscillator_DIP-8-socket" H 7500 4950 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 7450 5300 50  0001 C CNN
	1    7350 5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7950 5250 7750 5250
Connection ~ 7950 5250
Wire Wire Line
	7950 5250 7950 5300
$Comp
L Device:C_Small C?
U 1 1 601CE940
P 7950 5400
AR Path="/601CE940" Ref="C?"  Part="1" 
AR Path="/60757845/601CE940" Ref="C12"  Part="1" 
F 0 "C12" H 7850 5650 50  0000 R CNN
F 1 "1µF" H 7850 5400 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7950 5400 50  0001 C CNN
F 3 "~" H 7950 5400 50  0001 C CNN
	1    7950 5400
	-1   0    0    -1  
$EndComp
Connection ~ 7750 5250
Wire Wire Line
	7750 5300 7750 5250
Wire Wire Line
	7950 5250 7950 5200
Wire Wire Line
	7650 5250 7750 5250
$Comp
L power:GND #PWR?
U 1 1 601CE936
P 7950 5600
AR Path="/601CE936" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE936" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 7950 5350 50  0001 C CNN
F 1 "GND" H 7955 5427 50  0000 C CNN
F 2 "" H 7950 5600 50  0001 C CNN
F 3 "" H 7950 5600 50  0001 C CNN
	1    7950 5600
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 601CE930
P 7750 5400
AR Path="/601CE930" Ref="C?"  Part="1" 
AR Path="/60757845/601CE930" Ref="C11"  Part="1" 
F 0 "C11" H 7800 5650 50  0000 R CNN
F 1 "100nF" H 7900 5150 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7750 5400 50  0001 C CNN
F 3 "~" H 7750 5400 50  0001 C CNN
	1    7750 5400
	-1   0    0    -1  
$EndComp
Text Notes 8250 5600 0    50   ~ 0
Socket X2 and try frequencies that aren't harmonics\nof the CPU clock (4 MHz) to avoid strobe effects on\nthe front panel lights. The panel will update at 1/21\nthe crystal frequency.
Entry Wire Line
	8300 3550 8200 3450
Entry Wire Line
	8300 3650 8200 3550
Entry Wire Line
	8300 3750 8200 3650
Entry Wire Line
	8300 3850 8200 3750
Entry Wire Line
	8300 3950 8200 3850
Entry Wire Line
	8300 4050 8200 3950
Entry Wire Line
	8300 4150 8200 4050
Entry Wire Line
	8300 4250 8200 4150
Text Label 4700 3950 2    50   ~ 0
~µCMEM
Text Label 4700 3850 2    50   ~ 0
~µCIO
Text HLabel 1200 2650 0    50   Output ~ 0
~FPRESET
Text Label 1550 2650 0    50   ~ 0
~FPRESET
Text HLabel 1200 2750 0    50   Output ~ 0
~FPRSTHOLD
Text Label 1550 2750 0    50   ~ 0
~FPRSTHOLD
Wire Wire Line
	5200 2550 4350 2550
Wire Wire Line
	5200 2450 4350 2450
Connection ~ 13800 6550
Connection ~ 13800 6750
$Comp
L Device:C_Small C?
U 1 1 6416E28C
P 13800 6650
AR Path="/6416E28C" Ref="C?"  Part="1" 
AR Path="/60757845/6416E28C" Ref="C5"  Part="1" 
F 0 "C5" H 13709 6696 50  0000 R CNN
F 1 "100nF" H 13709 6605 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 13800 6650 50  0001 C CNN
F 3 "~" H 13800 6650 50  0001 C CNN
	1    13800 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6416E286
P 13800 6550
AR Path="/6416E286" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E286" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 13800 6400 50  0001 C CNN
F 1 "+5V" H 13815 6723 50  0000 C CNN
F 2 "" H 13800 6550 50  0001 C CNN
F 3 "" H 13800 6550 50  0001 C CNN
	1    13800 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6416E280
P 13800 6750
AR Path="/6416E280" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E280" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 13800 6500 50  0001 C CNN
F 1 "GND" H 13805 6577 50  0000 C CNN
F 2 "" H 13800 6750 50  0001 C CNN
F 3 "" H 13800 6750 50  0001 C CNN
	1    13800 6750
	1    0    0    -1  
$EndComp
Connection ~ 12550 6750
Connection ~ 12550 6550
$Comp
L Device:C_Small C?
U 1 1 641091C5
P 12550 6650
AR Path="/641091C5" Ref="C?"  Part="1" 
AR Path="/60757845/641091C5" Ref="C4"  Part="1" 
F 0 "C4" H 12459 6696 50  0000 R CNN
F 1 "100nF" H 12459 6605 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 12550 6650 50  0001 C CNN
F 3 "~" H 12550 6650 50  0001 C CNN
	1    12550 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 641091BF
P 12550 6550
AR Path="/641091BF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091BF" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 12550 6400 50  0001 C CNN
F 1 "+5V" H 12565 6723 50  0000 C CNN
F 2 "" H 12550 6550 50  0001 C CNN
F 3 "" H 12550 6550 50  0001 C CNN
	1    12550 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 641091B9
P 12550 6750
AR Path="/641091B9" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091B9" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 12550 6500 50  0001 C CNN
F 1 "GND" H 12555 6577 50  0000 C CNN
F 2 "" H 12550 6750 50  0001 C CNN
F 3 "" H 12550 6750 50  0001 C CNN
	1    12550 6750
	1    0    0    -1  
$EndComp
Connection ~ 12550 7400
Connection ~ 12550 7200
$Comp
L Device:C_Small C?
U 1 1 64073B48
P 12550 7300
AR Path="/64073B48" Ref="C?"  Part="1" 
AR Path="/60757845/64073B48" Ref="C3"  Part="1" 
F 0 "C3" H 12459 7346 50  0000 R CNN
F 1 "100nF" H 12459 7255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 12550 7300 50  0001 C CNN
F 3 "~" H 12550 7300 50  0001 C CNN
	1    12550 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64073B42
P 12550 7200
AR Path="/64073B42" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B42" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 12550 7050 50  0001 C CNN
F 1 "+5V" H 12565 7373 50  0000 C CNN
F 2 "" H 12550 7200 50  0001 C CNN
F 3 "" H 12550 7200 50  0001 C CNN
	1    12550 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64073B3C
P 12550 7400
AR Path="/64073B3C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B3C" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 12550 7150 50  0001 C CNN
F 1 "GND" H 12555 7227 50  0000 C CNN
F 2 "" H 12550 7400 50  0001 C CNN
F 3 "" H 12550 7400 50  0001 C CNN
	1    12550 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U5
U 2 1 6403F195
P 14150 7050
F 0 "U5" H 14330 7496 50  0000 L CNN
F 1 "74HC245" H 14330 7405 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 14150 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 14150 7100 50  0001 C CNN
	2    14150 7050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC590 U?
U 2 1 6403E919
P 12900 7000
AR Path="/6403E919" Ref="U?"  Part="1" 
AR Path="/6233F88C/6403E919" Ref="U?"  Part="1" 
AR Path="/60757845/6403E919" Ref="U4"  Part="2" 
F 0 "U4" H 13080 7396 50  0000 L CNN
F 1 "74HC590" H 13080 7305 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 13200 7350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 13200 7350 50  0001 C CNN
	2    12900 7000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC573 U?
U 2 1 6403DE58
P 13050 7700
AR Path="/6403DE58" Ref="U?"  Part="1" 
AR Path="/60757845/6403DE58" Ref="U3"  Part="2" 
F 0 "U3" H 13080 8146 50  0000 L CNN
F 1 "74AC573" H 13080 8055 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 13050 7700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 13050 7700 50  0001 C CNN
F 4 "Yes" H 7750 5950 50  0001 C CNN "Verified"
	2    13050 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2350 4650 2350
Wire Wire Line
	4450 2350 4350 2350
Text HLabel 5200 2350 2    50   Output ~ 0
~FPIRQ
Wire Wire Line
	1200 2450 2100 2450
Text HLabel 1750 4250 0    50   Output ~ 0
~CVOE
Wire Wire Line
	1750 4250 2550 4250
Text Notes 16050 7900 0    50   ~ 0
DTE/DCE cable config\n(aka I'm an idiot and always\nget the pinout wrong)
Text Label 15550 8750 0    50   ~ 0
RXD
Wire Wire Line
	16250 8250 16200 8250
$Comp
L alexios:SolderJumper_3_Bridged23 JP2
U 1 1 62B45C36
P 16350 8250
F 0 "JP2" V 16100 8250 50  0000 C CNN
F 1 "SolderJumper_3_Bridged23" H 16350 8360 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged23_RoundedPad1.0x1.5mm" H 16350 8250 50  0001 C CNN
F 3 "~" H 16350 8250 50  0001 C CNN
	1    16350 8250
	0    1    1    0   
$EndComp
Wire Wire Line
	16350 8450 16500 8450
Connection ~ 16350 8450
Wire Wire Line
	16350 8400 16350 8450
Wire Wire Line
	16500 8450 16500 8250
Wire Wire Line
	16100 8450 16350 8450
Wire Wire Line
	16100 8400 16100 8450
Wire Wire Line
	16350 8050 16500 8050
Connection ~ 16350 8050
Wire Wire Line
	16350 8100 16350 8050
Wire Wire Line
	16500 8150 16650 8150
Wire Wire Line
	16500 8050 16500 8150
Wire Wire Line
	16100 8050 16350 8050
Wire Wire Line
	16100 8100 16100 8050
Wire Wire Line
	15950 8250 16000 8250
$Comp
L alexios:SolderJumper_3_Bridged12 JP1
U 1 1 62B114C6
P 16100 8250
F 0 "JP1" V 15850 8250 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 16100 8360 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 16100 8250 50  0001 C CNN
F 3 "~" H 16100 8250 50  0001 C CNN
	1    16100 8250
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 61A9831B
P 16850 8350
AR Path="/61A9831B" Ref="J?"  Part="1" 
AR Path="/60757845/61A9831B" Ref="J1"  Part="1" 
F 0 "J1" H 16950 8700 50  0000 C CNN
F 1 "Conn_01x06" H 16930 8251 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 16850 8350 50  0001 C CNN
F 3 "~" H 16850 8350 50  0001 C CNN
	1    16850 8350
	1    0    0    1   
$EndComp
Wire Wire Line
	16650 8250 16500 8250
$Comp
L power:GND #PWR?
U 1 1 61A98322
P 16650 8550
AR Path="/61A98322" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A98322" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 16650 8300 50  0001 C CNN
F 1 "GND" H 16655 8377 50  0000 C CNN
F 2 "" H 16650 8550 50  0001 C CNN
F 3 "" H 16650 8550 50  0001 C CNN
	1    16650 8550
	-1   0    0    -1  
$EndComp
NoConn ~ 16650 8450
NoConn ~ 16650 8050
NoConn ~ 16650 8350
Text Notes 16950 8050 0    50   ~ 0
~RTS
Text Notes 16950 8150 0    50   ~ 0
RXD
Text Notes 16950 8250 0    50   ~ 0
TXD
Text Notes 16950 8350 0    50   ~ 0
Vcc
Text Notes 16950 8550 0    50   ~ 0
GND
Text Notes 16950 8450 0    50   ~ 0
~CTS
Text HLabel 1750 4150 0    50   Output ~ 0
~DBOE
Text HLabel 1750 4050 0    50   Output ~ 0
~ABOE
Text HLabel 1750 3950 0    50   Output ~ 0
~IBOE
Text HLabel 1750 3850 0    50   Output ~ 0
CLRWS
Text HLabel 5150 3650 2    50   3State ~ 0
~W
Text HLabel 5150 3750 2    50   3State ~ 0
~R
Text HLabel 5150 3850 2    50   3State ~ 0
~IO
Text HLabel 5150 3950 2    50   3State ~ 0
~MEM
Wire Wire Line
	5100 3950 5150 3950
Wire Wire Line
	5100 3850 5150 3850
Wire Wire Line
	5100 3750 5150 3750
Wire Wire Line
	5100 3650 5150 3650
Wire Wire Line
	4350 3650 4850 3650
Wire Wire Line
	4350 3750 4850 3750
Wire Wire Line
	4350 3850 4850 3850
Wire Wire Line
	4350 3950 4850 3950
Wire Wire Line
	2550 4150 1750 4150
Wire Wire Line
	2550 4050 1750 4050
Wire Wire Line
	2550 3950 1750 3950
Wire Wire Line
	2550 3850 1750 3850
Text Label 2450 5350 2    50   ~ 0
µCµSTEP
Text Label 2450 5250 2    50   ~ 0
µCCLKEN
Text HLabel 1750 5350 0    50   Output ~ 0
FPµSTEP-IN
Text HLabel 1750 5250 0    50   Output ~ 0
FPCLKEN-IN
Text HLabel 1750 5150 0    50   Output ~ 0
~FPRAM~∕ROM
$Comp
L alexios:momentary_switch SW1
U 1 1 61CAFDFF
P 2350 2050
F 0 "SW1" H 2350 2249 50  0000 C CNN
F 1 "momentary_switch" H 2350 1990 50  0001 C CNN
F 2 "alexios:SW_Tactile_SPST_Angled_PTS645Vx39-2LFS" H 2350 2250 50  0001 C CNN
F 3 "" H 2350 2250 50  0001 C CNN
	1    2350 2050
	-1   0    0    -1  
$EndComp
Text Label 15550 8250 0    50   ~ 0
TXD
$Comp
L Device:R_Small R?
U 1 1 61A9832D
P 15850 8250
AR Path="/61A9832D" Ref="R?"  Part="1" 
AR Path="/60757845/61A9832D" Ref="R5"  Part="1" 
F 0 "R5" V 15954 8250 50  0000 C CNN
F 1 "1kΩ" V 16045 8250 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 15850 8250 50  0001 C CNN
F 3 "~" H 15850 8250 50  0001 C CNN
	1    15850 8250
	0    1    1    0   
$EndComp
Text Notes 17000 7550 2    100  ~ 20
Control Interface & TTYD
Text HLabel 1200 2450 0    50   Output ~ 0
~FPHALT
Entry Wire Line
	8200 3450 8100 3550
Entry Wire Line
	8200 3550 8100 3650
Entry Wire Line
	8200 3650 8100 3750
Entry Wire Line
	8200 3750 8100 3850
Entry Wire Line
	8200 3850 8100 3950
Text HLabel 10650 1100 2    50   BiDi ~ 0
FPD[0..7]
Text Label 10300 1100 0    50   ~ 0
FPD[0..7]
Entry Bus Bus
	10300 1100 10200 1200
Entry Wire Line
	10100 2150 10200 2050
Entry Wire Line
	10100 2050 10200 1950
Entry Wire Line
	10100 1950 10200 1850
Entry Wire Line
	10100 1850 10200 1750
Entry Wire Line
	10100 1750 10200 1650
Entry Wire Line
	10100 1650 10200 1550
Entry Wire Line
	10100 1550 10200 1450
Entry Wire Line
	10100 1450 10200 1350
Entry Bus Bus
	8200 1100 8300 1200
Entry Wire Line
	8400 2150 8300 2050
Entry Wire Line
	8400 2050 8300 1950
Entry Wire Line
	8400 1950 8300 1850
Entry Wire Line
	8400 1850 8300 1750
Entry Wire Line
	8400 1750 8300 1650
Entry Wire Line
	8400 1650 8300 1550
Entry Wire Line
	8400 1550 8300 1450
Entry Wire Line
	8400 1450 8300 1350
Text Label 1850 4250 0    50   ~ 0
~CVOE
Text Label 1550 2450 0    50   ~ 0
~FPHALT
Text Notes 6750 1000 0    100  ~ 20
Address Latch
Text Label 8050 1100 2    50   ~ 0
MCD[0..7]
Entry Bus Bus
	6200 1200 6300 1100
Wire Wire Line
	7750 3850 8100 3850
Wire Wire Line
	7750 3950 8100 3950
NoConn ~ 7750 4450
Wire Wire Line
	6700 3850 6750 3850
Wire Wire Line
	6700 3750 6700 3850
Wire Wire Line
	6750 3750 6700 3750
$Comp
L power:GND #PWR?
U 1 1 60796430
P 6750 3550
AR Path="/60796430" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/60796430" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796430" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 6750 3300 50  0001 C CNN
F 1 "GND" V 6755 3422 50  0000 R CNN
F 2 "" H 6750 3550 50  0001 C CNN
F 3 "" H 6750 3550 50  0001 C CNN
	1    6750 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 3750 8100 3750
Wire Wire Line
	7750 3650 8100 3650
Wire Wire Line
	7750 3550 8100 3550
$Comp
L alexios:74HC590 U?
U 1 1 60796422
P 7250 4050
AR Path="/60796422" Ref="U?"  Part="1" 
AR Path="/6233F88C/60796422" Ref="U?"  Part="1" 
AR Path="/60757845/60796422" Ref="U4"  Part="1" 
F 0 "U4" H 7250 4817 50  0000 C CNN
F 1 "74HC590" H 7250 4726 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 7550 4400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 7550 4400 50  0001 C CNN
	1    7250 4050
	1    0    0    -1  
$EndComp
Text Label 8200 2750 1    50   ~ 0
MCA[0..7]
Entry Wire Line
	8100 2150 8200 2250
Entry Wire Line
	8100 2050 8200 2150
Entry Wire Line
	8100 1950 8200 2050
Entry Wire Line
	8100 1850 8200 1950
Entry Wire Line
	8100 1750 8200 1850
Entry Wire Line
	8100 1650 8200 1750
Entry Wire Line
	8100 1550 8200 1650
Entry Wire Line
	8100 1450 8200 1550
Text Label 4400 2150 0    50   ~ 0
MCD7
Text Label 4400 2050 0    50   ~ 0
MCD6
Text Label 4400 1950 0    50   ~ 0
MCD5
Text Label 4400 1850 0    50   ~ 0
MCD4
Text Label 4400 1750 0    50   ~ 0
MCD3
Text Label 4400 1650 0    50   ~ 0
MCD2
Text Label 4400 1550 0    50   ~ 0
MCD1
Text Label 4400 1450 0    50   ~ 0
MCD0
Text Label 5150 2550 2    50   ~ 0
MFD1
Text Label 5150 2450 2    50   ~ 0
MFD0
Text Label 1850 3950 0    50   ~ 0
~IBOE
Text Label 1850 4050 0    50   ~ 0
~ABOE
Text Label 1850 4150 0    50   ~ 0
~DBOE
Text Label 2050 4750 0    50   ~ 0
~CLR
Wire Wire Line
	2550 4750 2000 4750
Text Label 5150 2350 2    50   ~ 0
~FPIRQ
Text Label 4700 3650 2    50   ~ 0
~µCW
Text Label 4700 3750 2    50   ~ 0
~µCR
Text Label 1850 3850 0    50   ~ 0
CLRWS
Text Label 2050 4850 0    50   ~ 0
SCK
Wire Wire Line
	2550 4850 2050 4850
Text HLabel 2000 4750 0    50   Output ~ 0
~CLR
Wire Wire Line
	2550 1450 2500 1450
Wire Wire Line
	2550 1650 2500 1650
Wire Wire Line
	2550 1750 2500 1750
$Comp
L power:+12V #PWR0160
U 1 1 61657A32
P 2500 1400
F 0 "#PWR0160" H 2500 1250 50  0001 C CNN
F 1 "+12V" H 2515 1573 50  0000 C CNN
F 2 "" H 2500 1400 50  0001 C CNN
F 3 "" H 2500 1400 50  0001 C CNN
	1    2500 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1400 2500 1450
NoConn ~ 2550 1550
Wire Wire Line
	2500 1650 2500 1750
NoConn ~ 2550 1950
$Comp
L power:GND #PWR0161
U 1 1 6172919D
P 2150 2050
F 0 "#PWR0161" H 2150 1800 50  0001 C CNN
F 1 "GND" H 2000 2000 50  0000 C CNN
F 2 "" H 2150 2050 50  0001 C CNN
F 3 "" H 2150 2050 50  0001 C CNN
	1    2150 2050
	1    0    0    -1  
$EndComp
Text Label 6400 2350 0    50   ~ 0
ALE
Text Label 6400 2450 0    50   ~ 0
~BUSEN
Entry Wire Line
	6300 2150 6200 2050
Entry Wire Line
	6300 2050 6200 1950
Entry Wire Line
	6300 1950 6200 1850
Entry Wire Line
	6300 1850 6200 1750
Entry Wire Line
	6300 1750 6200 1650
Entry Wire Line
	6300 1650 6200 1550
Entry Wire Line
	6300 1550 6200 1450
Entry Wire Line
	6300 1450 6200 1350
Wire Wire Line
	7750 1450 8100 1450
Wire Wire Line
	7750 1550 8100 1550
Wire Wire Line
	7750 1650 8100 1650
Wire Wire Line
	7750 1750 8100 1750
Wire Wire Line
	7750 1850 8100 1850
Wire Wire Line
	7750 1950 8100 1950
Wire Wire Line
	7750 2050 8100 2050
Wire Wire Line
	7750 2150 8100 2150
$Comp
L alexios:74AC573 U?
U 1 1 6079616A
P 7250 1950
AR Path="/6079616A" Ref="U?"  Part="1" 
AR Path="/60757845/6079616A" Ref="U3"  Part="1" 
F 0 "U3" H 7250 2717 50  0000 C CNN
F 1 "74AC573" H 7250 2626 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7250 1950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 7250 1950 50  0001 C CNN
F 4 "Yes" H 1950 200 50  0001 C CNN "Verified"
	1    7250 1950
	1    0    0    -1  
$EndComp
Wire Bus Line
	6300 1100 8200 1100
Wire Bus Line
	10300 1100 10650 1100
Text Notes 8800 1000 0    100  ~ 20
Data Bus Buffer
Wire Wire Line
	2350 3250 2550 3250
Wire Wire Line
	2350 3150 2550 3150
Wire Wire Line
	2350 3050 2550 3050
Wire Wire Line
	2350 2950 2550 2950
Text Notes 1800 3750 0    50   ~ 0
µCU pulls up SWD
Text Label 1600 3650 0    50   ~ 0
SWD3
Text Label 1600 3550 0    50   ~ 0
SWD2
Text Label 1600 3450 0    50   ~ 0
SWD1
Text Label 1600 3350 0    50   ~ 0
SWD0
Text Label 1600 3250 0    50   ~ 0
SWA3
Text Label 1600 3150 0    50   ~ 0
SWA2
Text Label 1600 3050 0    50   ~ 0
SWA1
Text Label 1600 2950 0    50   ~ 0
SWA0
Text Label 4700 4150 2    50   ~ 0
~IOINT
Wire Wire Line
	4350 4150 5150 4150
Text HLabel 5200 2750 2    50   Output ~ 0
~LED-STOP
Text Label 5050 2750 2    50   ~ 0
~LED-STOP
Wire Wire Line
	4350 4250 5150 4250
Text HLabel 5150 4150 2    50   Input ~ 0
~IOINT
Text Label 4950 3450 2    50   ~ 0
~PANELEN
Text Label 4450 4950 0    50   ~ 0
STEP∕~RUN
Text Label 4950 3350 2    50   ~ 0
~AUTOSCAN
NoConn ~ 4350 4750
NoConn ~ 4350 4850
Text Notes 4450 4800 0    50   ~ 0
USART0 used for\nprogramming
$Comp
L Device:R_Small R?
U 1 1 6274D6EC
P 4550 2950
AR Path="/6274D6EC" Ref="R?"  Part="1" 
AR Path="/60757845/6274D6EC" Ref="R3"  Part="1" 
F 0 "R3" V 4600 3100 50  0000 C CNN
F 1 "30Ω" V 4600 2750 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 2950 50  0001 C CNN
F 3 "~" H 4550 2950 50  0001 C CNN
	1    4550 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 2950 5200 2950
Text HLabel 5200 2950 2    50   Output ~ 0
~LTSON
Text Label 5000 5450 2    50   ~ 0
~RD
Text Label 5000 5350 2    50   ~ 0
~WR
Wire Wire Line
	6400 2350 6750 2350
Wire Wire Line
	4350 4350 4700 4350
Wire Wire Line
	4350 4450 4700 4450
Wire Wire Line
	4350 2750 5200 2750
NoConn ~ 4350 5150
NoConn ~ 4350 5850
NoConn ~ 4350 5950
NoConn ~ 4350 5650
$Comp
L Device:R_Small R?
U 1 1 6216E2A2
P 4550 2350
AR Path="/6216E2A2" Ref="R?"  Part="1" 
AR Path="/60757845/6216E2A2" Ref="R37"  Part="1" 
F 0 "R37" V 4650 2400 50  0000 C CNN
F 1 "30Ω" V 4600 2150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 2350 50  0001 C CNN
F 3 "~" H 4550 2350 50  0001 C CNN
	1    4550 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6265D34E
P 2200 2550
AR Path="/6265D34E" Ref="R?"  Part="1" 
AR Path="/60757845/6265D34E" Ref="R39"  Part="1" 
F 0 "R39" V 2250 2700 50  0000 C CNN
F 1 "30Ω" V 2250 2350 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 2550 50  0001 C CNN
F 3 "~" H 2200 2550 50  0001 C CNN
	1    2200 2550
	0    -1   1    0   
$EndComp
Wire Wire Line
	2300 2450 2550 2450
$Comp
L Device:R_Small R?
U 1 1 626D97D3
P 2200 2450
AR Path="/626D97D3" Ref="R?"  Part="1" 
AR Path="/60757845/626D97D3" Ref="R38"  Part="1" 
F 0 "R38" V 2250 2600 50  0000 C CNN
F 1 "30Ω" V 2250 2250 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 2450 50  0001 C CNN
F 3 "~" H 2200 2450 50  0001 C CNN
	1    2200 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 2550 2550 2550
$Comp
L Device:R_Small R?
U 1 1 6285AE62
P 2200 2750
AR Path="/6285AE62" Ref="R?"  Part="1" 
AR Path="/60757845/6285AE62" Ref="R41"  Part="1" 
F 0 "R41" V 2250 2900 50  0000 C CNN
F 1 "30Ω" V 2250 2550 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 2750 50  0001 C CNN
F 3 "~" H 2200 2750 50  0001 C CNN
	1    2200 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6285AE68
P 2200 2650
AR Path="/6285AE68" Ref="R?"  Part="1" 
AR Path="/60757845/6285AE68" Ref="R40"  Part="1" 
F 0 "R40" V 2250 2800 50  0000 C CNN
F 1 "30Ω" V 2250 2450 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 2650 50  0001 C CNN
F 3 "~" H 2200 2650 50  0001 C CNN
	1    2200 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 2650 2100 2650
Wire Wire Line
	2300 2650 2550 2650
Wire Wire Line
	1200 2750 2100 2750
Wire Wire Line
	2300 2750 2550 2750
NoConn ~ 4350 3050
NoConn ~ 4350 3550
NoConn ~ 4350 4550
Wire Wire Line
	6700 3850 6700 5150
$Comp
L power:+5V #PWR?
U 1 1 601CE92A
P 7950 5200
AR Path="/601CE92A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE92A" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 7950 5050 50  0001 C CNN
F 1 "+5V" H 7965 5373 50  0000 C CNN
F 2 "" H 7950 5200 50  0001 C CNN
F 3 "" H 7950 5200 50  0001 C CNN
	1    7950 5200
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 62FDCC3F
P 15850 8750
AR Path="/62FDCC3F" Ref="R?"  Part="1" 
AR Path="/60757845/62FDCC3F" Ref="R1"  Part="1" 
F 0 "R1" V 15954 8750 50  0000 C CNN
F 1 "1kΩ" V 16045 8750 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 15850 8750 50  0001 C CNN
F 3 "~" H 15850 8750 50  0001 C CNN
	1    15850 8750
	0    1    1    0   
$EndComp
Wire Wire Line
	15950 8750 16200 8750
Wire Wire Line
	16200 8250 16200 8750
Wire Wire Line
	15450 8250 15750 8250
$Comp
L Device:CP_Small C?
U 1 1 632C8EE9
P 2150 1550
AR Path="/632C8EE9" Ref="C?"  Part="1" 
AR Path="/5D34E810/632C8EE9" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/632C8EE9" Ref="C?"  Part="1" 
AR Path="/60757845/632C8EE9" Ref="C22"  Part="1" 
F 0 "C22" H 2062 1596 50  0000 R CNN
F 1 "100µF, 16V" H 2062 1505 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 2150 1550 50  0001 C CNN
F 3 "~" H 2150 1550 50  0001 C CNN
	1    2150 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 632C8EEF
P 2150 1700
AR Path="/5F67D4B5/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/632C8EEF" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 2150 1450 50  0001 C CNN
F 1 "GND" H 2072 1663 50  0000 R CNN
F 2 "" H 2150 1700 50  0001 C CNN
F 3 "" H 2150 1700 50  0001 C CNN
	1    2150 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1400 2150 1450
Wire Wire Line
	2150 1650 2150 1700
$Comp
L power:+12V #PWR0162
U 1 1 632E50B5
P 2150 1400
F 0 "#PWR0162" H 2150 1250 50  0001 C CNN
F 1 "+12V" H 2165 1573 50  0000 C CNN
F 2 "" H 2150 1400 50  0001 C CNN
F 3 "" H 2150 1400 50  0001 C CNN
	1    2150 1400
	1    0    0    -1  
$EndComp
$Comp
L alexios:Arduino-Mega-2560 J8
U 1 1 6158B038
P 3450 3750
F 0 "J8" H 3450 6389 60  0000 C CNN
F 1 "Arduino-Mega-2560" H 3450 6283 60  0000 C CNN
F 2 "alexios:Arduino-Mega-2560-Mezzanine-Upside-Down" H 4125 6500 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-mega-2560-rev3" H 4125 6500 60  0001 C CNN
	1    3450 3750
	1    0    0    -1  
$EndComp
Text Label 5000 5550 2    50   ~ 0
ALE
Wire Wire Line
	6300 2150 6750 2150
Wire Wire Line
	6300 2050 6750 2050
Wire Wire Line
	6300 1950 6750 1950
Wire Wire Line
	6300 1850 6750 1850
Wire Wire Line
	6300 1750 6750 1750
Wire Wire Line
	6300 1650 6750 1650
Wire Wire Line
	6300 1550 6750 1550
Wire Wire Line
	6300 1450 6750 1450
Text Label 6700 1450 2    50   ~ 0
MCD0
Text Label 6700 1550 2    50   ~ 0
MCD1
Text Label 6700 1650 2    50   ~ 0
MCD2
Text Label 6700 1750 2    50   ~ 0
MCD3
Text Label 6700 1850 2    50   ~ 0
MCD4
Text Label 6700 1950 2    50   ~ 0
MCD5
Text Label 6700 2050 2    50   ~ 0
MCD6
Text Label 6700 2150 2    50   ~ 0
MCD7
Text Label 7750 1450 0    50   ~ 0
FPA0
Text Label 7750 1550 0    50   ~ 0
FPA1
Text Label 7750 1650 0    50   ~ 0
FPA2
Text Label 7750 1750 0    50   ~ 0
FPA3
Text Label 7750 1850 0    50   ~ 0
FPA4
Text Label 7750 1950 0    50   ~ 0
FPA5
Text Label 7750 2050 0    50   ~ 0
FPA6
Text Label 7750 2150 0    50   ~ 0
FPA7
Text Label 7750 3550 0    50   ~ 0
FPA0
Text Label 7750 3650 0    50   ~ 0
FPA1
Text Label 7750 3750 0    50   ~ 0
FPA2
Text Label 7750 3850 0    50   ~ 0
FPA3
Text Label 7750 3950 0    50   ~ 0
FPA4
Text Label 10050 1450 2    50   ~ 0
FPD0
Text Label 10050 1550 2    50   ~ 0
FPD1
Text Label 10050 1650 2    50   ~ 0
FPD2
Text Label 10050 1750 2    50   ~ 0
FPD3
Text Label 10050 1850 2    50   ~ 0
FPD4
Text Label 10050 1950 2    50   ~ 0
FPD5
Text Label 10050 2050 2    50   ~ 0
FPD6
Text Label 10050 2150 2    50   ~ 0
FPD7
Text Label 8750 1450 2    50   ~ 0
MCD0
Wire Wire Line
	8400 2150 8850 2150
Wire Wire Line
	8400 2050 8850 2050
Wire Wire Line
	8400 1950 8850 1950
Wire Wire Line
	8400 1850 8850 1850
Wire Wire Line
	8400 1750 8850 1750
Wire Wire Line
	8400 1650 8850 1650
Wire Wire Line
	8400 1550 8850 1550
Wire Wire Line
	8400 1450 8850 1450
Text Label 8750 1550 2    50   ~ 0
MCD1
Text Label 8750 1650 2    50   ~ 0
MCD2
Text Label 8750 1750 2    50   ~ 0
MCD3
Text Label 8750 1850 2    50   ~ 0
MCD4
Text Label 8750 1950 2    50   ~ 0
MCD5
Text Label 8750 2050 2    50   ~ 0
MCD6
Text Label 8750 2150 2    50   ~ 0
MCD7
Entry Wire Line
	9550 3550 9650 3450
Entry Wire Line
	9550 3650 9650 3550
Entry Wire Line
	9550 3750 9650 3650
Entry Wire Line
	9550 3850 9650 3750
Entry Wire Line
	9550 3950 9650 3850
Entry Wire Line
	9550 4050 9650 3950
Entry Wire Line
	9550 4150 9650 4050
Entry Wire Line
	9550 4250 9650 4150
Entry Bus Bus
	9750 3200 9650 3300
Wire Bus Line
	10200 3200 9750 3200
Text Label 9800 3200 0    50   ~ 0
FPA[0..7]
Text HLabel 10200 3200 2    50   BiDi ~ 0
FPA[0..7]
Text Label 9300 3550 0    50   ~ 0
FPA0
Text Label 9300 3650 0    50   ~ 0
FPA1
Text Label 9300 3750 0    50   ~ 0
FPA2
Text Label 9300 3850 0    50   ~ 0
FPA3
Text Label 9300 3950 0    50   ~ 0
FPA4
Text Label 9300 4050 0    50   ~ 0
FPA5
Text Label 9300 4150 0    50   ~ 0
FPA6
Text Label 9300 4250 0    50   ~ 0
FPA7
$Comp
L Device:R_Small R?
U 1 1 6263FC4F
P 5850 9050
AR Path="/6263FC4F" Ref="R?"  Part="1" 
AR Path="/64C48268/6263FC4F" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/6263FC4F" Ref="R?"  Part="1" 
AR Path="/60A2F394/6263FC4F" Ref="R?"  Part="1" 
AR Path="/60757845/6263FC4F" Ref="R4"  Part="1" 
F 0 "R4" V 5654 9050 50  0000 C CNN
F 1 "10kΩ" V 5745 9050 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 9050 50  0001 C CNN
F 3 "~" H 5850 9050 50  0001 C CNN
	1    5850 9050
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0164
U 1 1 626550E7
P 6000 9150
F 0 "#PWR0164" H 6000 8900 50  0001 C CNN
F 1 "GND" H 6005 8977 50  0000 C CNN
F 2 "" H 6000 9150 50  0001 C CNN
F 3 "" H 6000 9150 50  0001 C CNN
	1    6000 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2550 1200 2550
Text Label 1200 2550 0    50   ~ 0
SPARE
Text Label 4700 4350 2    50   ~ 0
RXDA
Text Label 4700 4450 2    50   ~ 0
TXDA
Wire Wire Line
	2550 5650 2200 5650
Wire Wire Line
	2550 5750 2200 5750
Text Label 2200 5650 0    50   ~ 0
RXDB
Text Label 2200 5750 0    50   ~ 0
TXDB
$Comp
L alexios:SolderJumper_3_Bridged12 JP7
U 1 1 6276C558
P 15350 8250
F 0 "JP7" V 15100 8250 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 15350 8360 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 15350 8250 50  0001 C CNN
F 3 "~" H 15350 8250 50  0001 C CNN
	1    15350 8250
	0    -1   1    0   
$EndComp
Wire Wire Line
	15350 8100 14950 8100
Wire Wire Line
	15350 8400 14950 8400
Text Label 14950 8100 0    50   ~ 0
TXDA
Text Label 14950 8400 0    50   ~ 0
TXDB
$Comp
L alexios:SolderJumper_3_Bridged12 JP9
U 1 1 627ADF72
P 15350 8750
F 0 "JP9" V 15100 8750 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 15350 8860 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 15350 8750 50  0001 C CNN
F 3 "~" H 15350 8750 50  0001 C CNN
	1    15350 8750
	0    -1   1    0   
$EndComp
Wire Wire Line
	15350 8900 14950 8900
Wire Wire Line
	15350 8600 14950 8600
Text Label 14950 8600 0    50   ~ 0
RXDA
Text Label 14950 8900 0    50   ~ 0
RXDB
Wire Wire Line
	1750 5150 2550 5150
Wire Wire Line
	1750 5250 2550 5250
Wire Wire Line
	1750 5350 2550 5350
$Comp
L alexios:SolderJumper_3_Bridged12 JP501
U 1 1 611D7AFF
P 6550 5150
F 0 "JP501" V 6550 5350 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 6550 5260 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 6550 5150 50  0001 C CNN
F 3 "~" H 6550 5150 50  0001 C CNN
	1    6550 5150
	0    -1   -1   0   
$EndComp
Text Label 5200 2850 2    50   ~ 0
µCSCANCLK
Text Label 6050 4800 0    50   ~ 0
µCSCANCLK
Wire Wire Line
	6550 4800 6550 5000
Wire Wire Line
	6650 5150 6700 5150
Wire Wire Line
	6550 5300 6550 5400
Wire Wire Line
	6550 5400 6850 5400
Wire Wire Line
	9850 2350 10150 2350
Wire Wire Line
	10150 2450 9850 2450
Text Label 10150 2450 2    50   ~ 0
SCANEN
Text Label 10150 2350 2    50   ~ 0
~WR
$Comp
L Device:R_Network08 RN7
U 1 1 6223B257
P 8800 4550
F 0 "RN7" H 9188 4596 50  0000 L CNN
F 1 "10kΩ" H 9188 4505 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9275 4550 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8800 4550 50  0001 C CNN
	1    8800 4550
	-1   0    0    1   
$EndComp
NoConn ~ 7750 4250
NoConn ~ 7750 4150
NoConn ~ 7750 4050
Wire Wire Line
	8300 3550 8500 3550
Wire Wire Line
	8300 3650 8600 3650
Wire Wire Line
	8300 3750 8700 3750
Wire Wire Line
	8300 3850 8800 3850
Wire Wire Line
	8300 3950 8900 3950
Wire Wire Line
	8300 4250 9200 4250
Wire Wire Line
	8300 4150 9100 4150
$Comp
L power:GND #PWR0232
U 1 1 63D7491E
P 9200 4750
F 0 "#PWR0232" H 9200 4500 50  0001 C CNN
F 1 "GND" H 9205 4577 50  0000 C CNN
F 2 "" H 9200 4750 50  0001 C CNN
F 3 "" H 9200 4750 50  0001 C CNN
	1    9200 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4350 8500 3550
Connection ~ 8500 3550
Wire Wire Line
	8500 3550 9550 3550
Wire Wire Line
	8600 4350 8600 3650
Connection ~ 8600 3650
Wire Wire Line
	8600 3650 9550 3650
Wire Wire Line
	8700 4350 8700 3750
Connection ~ 8700 3750
Wire Wire Line
	8700 3750 9550 3750
Wire Wire Line
	8800 4350 8800 3850
Connection ~ 8800 3850
Wire Wire Line
	8800 3850 9550 3850
Wire Wire Line
	8900 4350 8900 3950
Connection ~ 8900 3950
Wire Wire Line
	8900 3950 9550 3950
Wire Wire Line
	9000 4350 9000 4050
Wire Wire Line
	8300 4050 9000 4050
Connection ~ 9000 4050
Wire Wire Line
	9000 4050 9550 4050
Wire Wire Line
	9100 4350 9100 4150
Connection ~ 9100 4150
Wire Wire Line
	9100 4150 9550 4150
Wire Wire Line
	9200 4350 9200 4250
Connection ~ 9200 4250
Wire Wire Line
	9200 4250 9550 4250
Text Notes 8450 3150 0    100  ~ 20
Address Bus
Wire Wire Line
	4350 3250 4950 3250
Text Label 4950 3250 2    50   ~ 0
~BUSEN
$Comp
L Device:R_Small R?
U 1 1 67A9C2B9
P 2250 2950
AR Path="/67A9C2B9" Ref="R?"  Part="1" 
AR Path="/60757845/67A9C2B9" Ref="R1501"  Part="1" 
F 0 "R1501" V 2300 3150 50  0000 C CNN
F 1 "1kΩ" V 2300 2750 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 2950 50  0001 C CNN
F 3 "~" H 2250 2950 50  0001 C CNN
	1    2250 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 2950 2150 2950
Wire Wire Line
	1500 3050 2150 3050
Wire Wire Line
	1500 3150 2150 3150
Wire Wire Line
	1500 3250 2150 3250
$Comp
L Device:R_Small R?
U 1 1 67B0D557
P 2250 3050
AR Path="/67B0D557" Ref="R?"  Part="1" 
AR Path="/60757845/67B0D557" Ref="R1502"  Part="1" 
F 0 "R1502" V 2300 3250 50  0000 C CNN
F 1 "1kΩ" V 2300 2850 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 3050 50  0001 C CNN
F 3 "~" H 2250 3050 50  0001 C CNN
	1    2250 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 67B0D6E4
P 2250 3150
AR Path="/67B0D6E4" Ref="R?"  Part="1" 
AR Path="/60757845/67B0D6E4" Ref="R1503"  Part="1" 
F 0 "R1503" V 2300 3350 50  0000 C CNN
F 1 "1kΩ" V 2300 2950 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 3150 50  0001 C CNN
F 3 "~" H 2250 3150 50  0001 C CNN
	1    2250 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 67B0D856
P 2250 3250
AR Path="/67B0D856" Ref="R?"  Part="1" 
AR Path="/60757845/67B0D856" Ref="R1504"  Part="1" 
F 0 "R1504" V 2300 3450 50  0000 C CNN
F 1 "1kΩ" V 2300 3050 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 3250 50  0001 C CNN
F 3 "~" H 2250 3250 50  0001 C CNN
	1    2250 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 3350 2550 3350
Wire Wire Line
	1500 3450 2550 3450
Wire Wire Line
	1500 3550 2550 3550
Wire Wire Line
	1500 3650 2550 3650
Text Notes 5650 4975 0    50   ~ 0
(= ~LED-RUN)
Wire Wire Line
	4350 4950 5150 4950
Text HLabel 5150 4950 2    50   Output ~ 0
STEP∕~RUN
Text HLabel 5150 5350 2    50   Output ~ 0
~WR
Text HLabel 5150 5450 2    50   Output ~ 0
~RD
NoConn ~ 2550 4350
NoConn ~ 2550 4450
Wire Wire Line
	4350 3450 5150 3450
Text HLabel 5150 3450 2    50   Output ~ 0
~PANELEN
Wire Wire Line
	4350 3350 5150 3350
Text HLabel 5150 3350 2    50   Output ~ 0
~AUTOSCAN
Wire Wire Line
	4350 2850 5750 2850
Wire Wire Line
	5750 2850 5750 4800
Text HLabel 1200 3400 0    50   Output ~ 0
SWA[0..3]
Text HLabel 1200 3950 0    50   Input ~ 0
SWD[0..3]
Entry Wire Line
	1400 2850 1500 2950
Entry Wire Line
	1400 2950 1500 3050
Entry Wire Line
	1400 3050 1500 3150
Entry Wire Line
	1500 3650 1400 3750
Entry Wire Line
	1500 3550 1400 3650
Entry Wire Line
	1500 3450 1400 3550
Entry Wire Line
	1500 3350 1400 3450
Entry Wire Line
	1400 3150 1500 3250
Entry Bus Bus
	1400 3850 1300 3950
Wire Bus Line
	1300 3950 1200 3950
Entry Bus Bus
	1400 3300 1300 3400
Wire Bus Line
	1300 3400 1200 3400
Wire Wire Line
	4450 2950 4350 2950
Wire Wire Line
	4350 2650 5200 2650
Text Label 4950 2650 0    50   ~ 0
MFD2
Text HLabel 5200 2550 2    50   Output ~ 0
MFD1
Text HLabel 5200 2450 2    50   Output ~ 0
MFD0
Text HLabel 5200 2650 2    50   Output ~ 0
MFD2
Text Label 2450 5450 2    50   ~ 0
µCBUSCP
NoConn ~ 2550 4550
Wire Wire Line
	1750 5450 2550 5450
Text HLabel 1750 5450 0    50   Output ~ 0
BUSCP
$Comp
L Device:R_Small R?
U 1 1 612966AB
P 5750 2700
AR Path="/612966AB" Ref="R?"  Part="1" 
AR Path="/64C48268/612966AB" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/612966AB" Ref="R?"  Part="1" 
AR Path="/60A2F394/612966AB" Ref="R?"  Part="1" 
AR Path="/60757845/612966AB" Ref="R402"  Part="1" 
F 0 "R402" H 5691 2746 50  0000 R CNN
F 1 "10kΩ" H 5691 2655 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5750 2700 50  0001 C CNN
F 3 "~" H 5750 2700 50  0001 C CNN
	1    5750 2700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5750 2800 5750 2850
$Comp
L power:+5V #PWR0403
U 1 1 612AB944
P 5750 2600
F 0 "#PWR0403" H 5750 2450 50  0001 C CNN
F 1 "+5V" H 5900 2650 50  0000 C CNN
F 2 "" H 5750 2600 50  0001 C CNN
F 3 "" H 5750 2600 50  0001 C CNN
	1    5750 2600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U5
U 1 1 60AE5F32
P 9350 1950
F 0 "U5" H 9350 2717 50  0000 C CNN
F 1 "74HC245" H 9350 2626 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9350 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 9350 2000 50  0001 C CNN
	1    9350 1950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4350 2150 6100 2150
Wire Wire Line
	4350 2050 6100 2050
Wire Wire Line
	4350 1950 6100 1950
Wire Wire Line
	4350 1850 6100 1850
Wire Wire Line
	4350 1750 6100 1750
Wire Wire Line
	4350 1650 6100 1650
Wire Wire Line
	4350 1550 6100 1550
Wire Wire Line
	4350 1450 6100 1450
Wire Wire Line
	9850 1450 10100 1450
Wire Wire Line
	9850 1550 10100 1550
Wire Wire Line
	9850 1650 10100 1650
Wire Wire Line
	9850 1750 10100 1750
Wire Wire Line
	9850 1850 10100 1850
Wire Wire Line
	9850 1950 10100 1950
Wire Wire Line
	9850 2050 10100 2050
Wire Wire Line
	9850 2150 10100 2150
Wire Wire Line
	5750 4800 6550 4800
Connection ~ 5750 2850
Wire Wire Line
	6400 2450 6750 2450
Text Label 6250 4450 0    50   ~ 0
~AUTOSCAN
Wire Wire Line
	6250 4450 6750 4450
Text HLabel 6200 4050 0    50   Input ~ 0
~SCANCLR
Wire Wire Line
	6200 4050 6750 4050
Text Label 6250 4050 0    50   ~ 0
~SCANCLR
Wire Wire Line
	6550 9050 6150 9050
Text Label 6150 9050 0    50   ~ 0
~WR
Wire Wire Line
	6550 8950 6150 8950
Text Label 6150 8950 0    50   ~ 0
~RD
Wire Wire Line
	4350 5350 5150 5350
Wire Wire Line
	4350 5450 5150 5450
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 623E1F1D
P 5000 3950
AR Path="/623E1F1D" Ref="RN?"  Part="1" 
AR Path="/60757845/623E1F1D" Ref="RN4"  Part="1" 
F 0 "RN4" H 5100 3850 50  0000 L CNN
F 1 "30Ω" H 4750 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 5000 4030 50  0001 C CNN
F 3 "~" V 5000 3950 50  0001 C CNN
	1    5000 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 623E1F2F
P 5000 3650
AR Path="/623E1F2F" Ref="RN?"  Part="4" 
AR Path="/60757845/623E1F2F" Ref="RN4"  Part="4" 
F 0 "RN4" H 5100 3700 50  0001 L CNN
F 1 "30Ω" H 4975 3756 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 5000 3730 50  0001 C CNN
F 3 "~" V 5000 3650 50  0001 C CNN
	4    5000 3650
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 623E1F23
P 5000 3850
AR Path="/623E1F23" Ref="RN?"  Part="2" 
AR Path="/60757845/623E1F23" Ref="RN4"  Part="2" 
F 0 "RN4" H 5100 3900 50  0001 L CNN
F 1 "30Ω" H 4975 3956 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 5000 3930 50  0001 C CNN
F 3 "~" V 5000 3850 50  0001 C CNN
	2    5000 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 623E1F29
P 5000 3750
AR Path="/623E1F29" Ref="RN?"  Part="3" 
AR Path="/60757845/623E1F29" Ref="RN4"  Part="3" 
F 0 "RN4" H 5100 3800 50  0001 L CNN
F 1 "30Ω" H 4975 3856 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 5000 3830 50  0001 C CNN
F 3 "~" V 5000 3750 50  0001 C CNN
	3    5000 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0404
U 1 1 61B5C1F5
P 7750 8650
F 0 "#PWR0404" H 7750 8500 50  0001 C CNN
F 1 "+5V" H 7600 8700 50  0000 C CNN
F 2 "" H 7750 8650 50  0001 C CNN
F 3 "" H 7750 8650 50  0001 C CNN
	1    7750 8650
	1    0    0    -1  
$EndComp
Text Label 7050 9050 0    50   ~ 0
~PANELEN
Wire Wire Line
	7450 9050 7050 9050
Text Label 7050 8750 0    50   ~ 0
~AUTOSCAN
Wire Wire Line
	7450 8750 7050 8750
Text Label 7050 8850 0    50   ~ 0
~BUSEN
Wire Wire Line
	7450 8850 7050 8850
$Comp
L alexios:R_Pack04 RN401
U 1 1 61C096CC
P 7550 8750
F 0 "RN401" H 7550 8300 50  0000 C CNN
F 1 "10kΩ" H 7500 8200 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 7600 8830 50  0001 C CNN
F 3 "~" V 7600 8750 50  0001 C CNN
	1    7550 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 8650 7750 8750
Wire Wire Line
	7750 9050 7700 9050
Wire Wire Line
	7700 8950 7750 8950
Connection ~ 7750 8950
Wire Wire Line
	7750 8950 7750 9050
Wire Wire Line
	7700 8850 7750 8850
Connection ~ 7750 8850
Wire Wire Line
	7750 8850 7750 8950
Wire Wire Line
	7700 8750 7750 8750
Connection ~ 7750 8750
Wire Wire Line
	7750 8750 7750 8850
NoConn ~ 7450 8950
$Comp
L power:+5V #PWR0126
U 1 1 61D72186
P 6850 8650
F 0 "#PWR0126" H 6850 8500 50  0001 C CNN
F 1 "+5V" H 6700 8700 50  0000 C CNN
F 2 "" H 6850 8650 50  0001 C CNN
F 3 "" H 6850 8650 50  0001 C CNN
	1    6850 8650
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04 RN402
U 1 1 61D7218C
P 6650 8750
F 0 "RN402" H 6650 8300 50  0000 C CNN
F 1 "10kΩ" H 6600 8200 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 6700 8830 50  0001 C CNN
F 3 "~" V 6700 8750 50  0001 C CNN
	1    6650 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 8650 6850 8750
Wire Wire Line
	6850 9050 6800 9050
Wire Wire Line
	6800 8950 6850 8950
Connection ~ 6850 8950
Wire Wire Line
	6850 8950 6850 9050
Wire Wire Line
	6800 8850 6850 8850
Connection ~ 6850 8850
Wire Wire Line
	6850 8850 6850 8950
Wire Wire Line
	6800 8750 6850 8750
Connection ~ 6850 8750
Wire Wire Line
	6850 8750 6850 8850
NoConn ~ 2550 4950
Wire Wire Line
	4350 5550 5000 5550
Wire Wire Line
	6000 9150 6000 9050
Wire Wire Line
	6000 9050 5950 9050
Wire Wire Line
	5750 9050 5350 9050
Text Label 5350 9050 0    50   ~ 0
ALE
Wire Wire Line
	6800 5200 6800 5250
Wire Wire Line
	6800 5250 6850 5250
Text Label 6150 8850 0    50   ~ 0
µCBUSCP
Wire Wire Line
	6550 8850 6150 8850
Wire Wire Line
	6550 8750 6150 8750
Text Label 6150 8750 0    50   ~ 0
µCµSTEP
Text Label 4700 4250 2    50   ~ 0
WAIT
Text HLabel 5150 4250 2    50   Input ~ 0
WAIT
Wire Wire Line
	4350 5050 5150 5050
Wire Bus Line
	1400 3450 1400 3850
Wire Bus Line
	1400 2850 1400 3300
Wire Bus Line
	9650 3300 9650 4150
Wire Bus Line
	8300 1200 8300 2050
Wire Bus Line
	10200 1200 10200 2050
Wire Bus Line
	6200 1200 6200 2050
Wire Bus Line
	8200 1550 8200 4150
Text HLabel 5150 5050 2    50   Output ~ 0
~µSTEP
Text Label 4450 5050 0    50   ~ 0
~µSTEP
$EndSCHEMATC
