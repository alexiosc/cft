EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 15 19
Title "Microcontroller and DFP Bus"
Date ""
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6026C92F
P 15300 4050
AR Path="/6026C92F" Ref="RN?"  Part="1" 
AR Path="/60757845/6026C92F" Ref="RN14"  Part="1" 
F 0 "RN14" H 15200 4150 50  0000 L CNN
F 1 "30Ω" H 15500 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 4130 50  0001 C CNN
F 3 "~" V 15300 4050 50  0001 C CNN
	1    15300 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6026C935
P 15300 4150
AR Path="/6026C935" Ref="RN?"  Part="2" 
AR Path="/60757845/6026C935" Ref="RN14"  Part="2" 
F 0 "RN14" H 15400 4200 50  0001 L CNN
F 1 "30Ω" H 15275 4256 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 4230 50  0001 C CNN
F 3 "~" V 15300 4150 50  0001 C CNN
	2    15300 4150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6026C93B
P 15300 4250
AR Path="/6026C93B" Ref="RN?"  Part="3" 
AR Path="/60757845/6026C93B" Ref="RN14"  Part="3" 
F 0 "RN14" H 15400 4300 50  0001 L CNN
F 1 "30Ω" H 15275 4356 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 4330 50  0001 C CNN
F 3 "~" V 15300 4250 50  0001 C CNN
	3    15300 4250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6026C941
P 15300 4350
AR Path="/6026C941" Ref="RN?"  Part="4" 
AR Path="/60757845/6026C941" Ref="RN14"  Part="4" 
F 0 "RN14" H 15400 4400 50  0001 L CNN
F 1 "30Ω" H 15275 4456 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 15300 4430 50  0001 C CNN
F 3 "~" V 15300 4350 50  0001 C CNN
	4    15300 4350
	1    0    0    1   
$EndComp
Wire Wire Line
	15400 4050 15500 4050
Wire Wire Line
	15500 4050 15500 3950
Wire Wire Line
	15400 4350 15500 4350
Wire Wire Line
	15500 4350 15500 4250
Connection ~ 15500 4050
Wire Wire Line
	15400 4150 15500 4150
Connection ~ 15500 4150
Wire Wire Line
	15500 4150 15500 4050
Wire Wire Line
	15400 4250 15500 4250
Connection ~ 15500 4250
Wire Wire Line
	15500 4250 15500 4150
$Comp
L power:+5V #PWR031
U 1 1 6026C952
P 15500 3950
F 0 "#PWR031" H 15500 3800 50  0001 C CNN
F 1 "+5V" H 15515 4123 50  0000 C CNN
F 2 "" H 15500 3950 50  0001 C CNN
F 3 "" H 15500 3950 50  0001 C CNN
	1    15500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	15150 4050 14750 4050
Wire Wire Line
	15150 4250 14750 4250
Wire Wire Line
	15150 4350 14750 4350
Text Label 14750 4050 0    50   ~ 0
~CLR
Text Notes 14600 1950 0    50   ~ 0
Consider single resistors here
Wire Wire Line
	15150 4150 14750 4150
Text Label 14750 4150 0    50   ~ 0
~µCRAM
Text Label 14750 4250 0    50   ~ 0
µCCLKEN
Text Notes 13600 500  2    63   ~ 13
SIGNALS TO CHECK
Text Notes 12700 1150 0    63   ~ 0
Ensure these signals are pulled up/down during MCU reset:\n\n* ~WR~\n* ~RD~\n* ALE\n* ~LCLKEN~\n* ~FPHALT~ (likely open drain)\n* 
Entry Wire Line
	4550 -5250 4650 -5350
Entry Wire Line
	4550 -5150 4650 -5250
Entry Wire Line
	4550 -5050 4650 -5150
Entry Wire Line
	4550 -4950 4650 -5050
Entry Wire Line
	4550 -4850 4650 -4950
Entry Wire Line
	4550 -4750 4650 -4850
Entry Wire Line
	4550 -4650 4650 -4750
Entry Wire Line
	4550 -4550 4650 -4650
Wire Wire Line
	3550 -5250 4550 -5250
Wire Wire Line
	3550 -5150 4550 -5150
Wire Wire Line
	3550 -5050 4550 -5050
Wire Wire Line
	3550 -4950 4550 -4950
Wire Wire Line
	3550 -4850 4550 -4850
Wire Wire Line
	3550 -4750 4550 -4750
Wire Wire Line
	3550 -4650 4550 -4650
Wire Wire Line
	3550 -4550 4550 -4550
Text Notes 1800 -5700 0    100  ~ 20
DFP Microcontroller
Text Label 1650 -1550 2    50   ~ 0
~µCRAM
Wire Wire Line
	1750 -1650 1200 -1650
Wire Wire Line
	1200 -1800 950  -1800
Wire Wire Line
	1200 -1650 1200 -1800
$Comp
L power:GND #PWR013
U 1 1 6085DCB4
P 450 -1800
F 0 "#PWR013" H 450 -2050 50  0001 C CNN
F 1 "GND" H 600 -1850 50  0000 C CNN
F 2 "" H 450 -1800 50  0001 C CNN
F 3 "" H 450 -1800 50  0001 C CNN
	1    450  -1800
	-1   0    0    -1  
$EndComp
Text Label 1250 -1650 0    50   ~ 0
ACT-LED
$Comp
L Device:R_Small R?
U 1 1 608B26E9
P 850 -1800
AR Path="/608B26E9" Ref="R?"  Part="1" 
AR Path="/64C48268/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/608B26E9" Ref="R?"  Part="1" 
AR Path="/60A2F394/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/608B26E9" Ref="R6"  Part="1" 
F 0 "R6" V 1046 -1800 50  0000 C CNN
F 1 "680Ω" V 955 -1800 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 850 -1800 50  0001 C CNN
F 3 "~" H 850 -1800 50  0001 C CNN
	1    850  -1800
	0    1    -1   0   
$EndComp
Wire Wire Line
	4050 6650 4350 6650
$Comp
L Device:LED_ALT D?
U 1 1 604918F8
P 600 -1800
AR Path="/604918F8" Ref="D?"  Part="1" 
AR Path="/64C48268/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/604918F8" Ref="D?"  Part="1" 
AR Path="/60A2F394/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/604918F8" Ref="D4"  Part="1" 
F 0 "D4" H 593 -1963 50  0000 C CNN
F 1 "LED_ALT" H 593 -1964 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 600 -1800 50  0001 C CNN
F 3 "~" H 600 -1800 50  0001 C CNN
	1    600  -1800
	1    0    0    1   
$EndComp
Text Notes 5900 -3550 0    100  ~ 20
Front Panel\nScanner Counter
Connection ~ 5900 -2850
Text Label 5900 -1850 1    50   ~ 0
SCANCLK
Wire Wire Line
	6950 -1150 6850 -1150
Connection ~ 6950 -1150
Wire Wire Line
	6950 -1200 6950 -1150
Wire Wire Line
	7150 -1150 7150 -1100
Connection ~ 7150 -1150
Wire Wire Line
	7150 -1150 6950 -1150
Wire Wire Line
	7150 -1200 7150 -1150
$Comp
L power:+5V #PWR?
U 1 1 601CE94F
P 6050 -1450
AR Path="/601CE94F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE94F" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 6050 -1600 50  0001 C CNN
F 1 "+5V" H 6065 -1277 50  0000 C CNN
F 2 "" H 6050 -1450 50  0001 C CNN
F 3 "" H 6050 -1450 50  0001 C CNN
	1    6050 -1450
	-1   0    0    -1  
$EndComp
$Comp
L alexios:CXO_DIP8 X?
U 1 1 601CE949
P 6550 -1350
AR Path="/601CE949" Ref="X?"  Part="1" 
AR Path="/60757845/601CE949" Ref="X2"  Part="1" 
F 0 "X2" H 6650 -983 50  0000 C CNN
F 1 "7.3728 MHz?" H 6650 -1074 50  0000 C CNN
F 2 "alexios:Oscillator_DIP-8-socket" H 6700 -1750 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 6650 -1400 50  0001 C CNN
	1    6550 -1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7150 -1450 6950 -1450
Connection ~ 7150 -1450
Wire Wire Line
	7150 -1450 7150 -1400
$Comp
L Device:C_Small C?
U 1 1 601CE940
P 7150 -1300
AR Path="/601CE940" Ref="C?"  Part="1" 
AR Path="/60757845/601CE940" Ref="C12"  Part="1" 
F 0 "C12" H 7050 -1050 50  0000 R CNN
F 1 "1µF" H 7050 -1300 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 -1300 50  0001 C CNN
F 3 "~" H 7150 -1300 50  0001 C CNN
	1    7150 -1300
	-1   0    0    -1  
$EndComp
Connection ~ 6950 -1450
Wire Wire Line
	6950 -1400 6950 -1450
Wire Wire Line
	7150 -1450 7150 -1500
Wire Wire Line
	6850 -1450 6950 -1450
$Comp
L power:GND #PWR?
U 1 1 601CE936
P 7150 -1100
AR Path="/601CE936" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE936" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 7150 -1350 50  0001 C CNN
F 1 "GND" H 7155 -1273 50  0000 C CNN
F 2 "" H 7150 -1100 50  0001 C CNN
F 3 "" H 7150 -1100 50  0001 C CNN
	1    7150 -1100
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 601CE930
P 6950 -1300
AR Path="/601CE930" Ref="C?"  Part="1" 
AR Path="/60757845/601CE930" Ref="C11"  Part="1" 
F 0 "C11" H 7000 -1050 50  0000 R CNN
F 1 "100nF" H 7100 -1550 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6950 -1300 50  0001 C CNN
F 3 "~" H 6950 -1300 50  0001 C CNN
	1    6950 -1300
	-1   0    0    -1  
$EndComp
Text Notes 7450 -1100 0    50   ~ 0
Socket X2 and try frequencies that aren't harmonics\nof the CPU clock (4 MHz) to avoid strobe effects on\nthe front panel lights. The panel will update at 1/21\nthe crystal frequency.
Entry Wire Line
	7500 -3150 7400 -3250
Entry Wire Line
	7500 -3050 7400 -3150
Entry Wire Line
	7500 -2950 7400 -3050
Entry Wire Line
	7500 -2850 7400 -2950
Entry Wire Line
	7500 -2750 7400 -2850
Entry Wire Line
	7500 -2650 7400 -2750
Entry Wire Line
	7500 -2550 7400 -2650
Entry Wire Line
	7500 -2450 7400 -2550
Text Label 3900 -2750 2    50   ~ 0
~µCMEM
Text Label 3900 -2850 2    50   ~ 0
~µCIO
Text HLabel 400  -4050 0    50   Output ~ 0
~FPRESET
Text Label 750  -4050 0    50   ~ 0
~FPRESET
Text HLabel 400  -3950 0    50   Output ~ 0
~FPRSTHOLD
Text Label 750  -3950 0    50   ~ 0
~FPRSTHOLD
Wire Wire Line
	4400 -4150 3550 -4150
Wire Wire Line
	4400 -4250 3550 -4250
Connection ~ 10150 5400
Connection ~ 10150 5600
$Comp
L Device:C_Small C?
U 1 1 6416E28C
P 10150 5500
AR Path="/6416E28C" Ref="C?"  Part="1" 
AR Path="/60757845/6416E28C" Ref="C15"  Part="1" 
F 0 "C15" H 10059 5546 50  0000 R CNN
F 1 "100nF" H 10059 5455 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 5500 50  0001 C CNN
F 3 "~" H 10150 5500 50  0001 C CNN
	1    10150 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6416E286
P 10150 5400
AR Path="/6416E286" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E286" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 10150 5250 50  0001 C CNN
F 1 "+5V" H 10165 5573 50  0000 C CNN
F 2 "" H 10150 5400 50  0001 C CNN
F 3 "" H 10150 5400 50  0001 C CNN
	1    10150 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6416E280
P 10150 5600
AR Path="/6416E280" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E280" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 10150 5350 50  0001 C CNN
F 1 "GND" H 10155 5427 50  0000 C CNN
F 2 "" H 10150 5600 50  0001 C CNN
F 3 "" H 10150 5600 50  0001 C CNN
	1    10150 5600
	1    0    0    -1  
$EndComp
Connection ~ 8900 5600
Connection ~ 8900 5400
$Comp
L Device:C_Small C?
U 1 1 641091C5
P 8900 5500
AR Path="/641091C5" Ref="C?"  Part="1" 
AR Path="/60757845/641091C5" Ref="C?1"  Part="1" 
F 0 "C?1" H 8809 5546 50  0000 R CNN
F 1 "100nF" H 8809 5455 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8900 5500 50  0001 C CNN
F 3 "~" H 8900 5500 50  0001 C CNN
	1    8900 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 641091BF
P 8900 5400
AR Path="/641091BF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091BF" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 8900 5250 50  0001 C CNN
F 1 "+5V" H 8915 5573 50  0000 C CNN
F 2 "" H 8900 5400 50  0001 C CNN
F 3 "" H 8900 5400 50  0001 C CNN
	1    8900 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 641091B9
P 8900 5600
AR Path="/641091B9" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091B9" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 8900 5350 50  0001 C CNN
F 1 "GND" H 8905 5427 50  0000 C CNN
F 2 "" H 8900 5600 50  0001 C CNN
F 3 "" H 8900 5600 50  0001 C CNN
	1    8900 5600
	1    0    0    -1  
$EndComp
Connection ~ 8900 6250
Connection ~ 8900 6050
$Comp
L Device:C_Small C?
U 1 1 64073B48
P 8900 6150
AR Path="/64073B48" Ref="C?"  Part="1" 
AR Path="/60757845/64073B48" Ref="C14"  Part="1" 
F 0 "C14" H 8809 6196 50  0000 R CNN
F 1 "100nF" H 8809 6105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8900 6150 50  0001 C CNN
F 3 "~" H 8900 6150 50  0001 C CNN
	1    8900 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64073B42
P 8900 6050
AR Path="/64073B42" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B42" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 8900 5900 50  0001 C CNN
F 1 "+5V" H 8915 6223 50  0000 C CNN
F 2 "" H 8900 6050 50  0001 C CNN
F 3 "" H 8900 6050 50  0001 C CNN
	1    8900 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64073B3C
P 8900 6250
AR Path="/64073B3C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B3C" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 8900 6000 50  0001 C CNN
F 1 "GND" H 8905 6077 50  0000 C CNN
F 2 "" H 8900 6250 50  0001 C CNN
F 3 "" H 8900 6250 50  0001 C CNN
	1    8900 6250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U5
U 2 1 6403F195
P 10500 5900
F 0 "U5" H 10680 6346 50  0000 L CNN
F 1 "74HC245" H 10680 6255 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10500 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 10500 5950 50  0001 C CNN
	2    10500 5900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC590 U?
U 2 1 6403E919
P 9250 5850
AR Path="/6403E919" Ref="U?"  Part="1" 
AR Path="/6233F88C/6403E919" Ref="U?"  Part="1" 
AR Path="/60757845/6403E919" Ref="U4"  Part="2" 
F 0 "U4" H 9430 6246 50  0000 L CNN
F 1 "74HC590" H 9430 6155 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 9550 6200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 9550 6200 50  0001 C CNN
	2    9250 5850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC573 U?
U 2 1 6403DE58
P 9400 6550
AR Path="/6403DE58" Ref="U?"  Part="1" 
AR Path="/60757845/6403DE58" Ref="U3"  Part="2" 
F 0 "U3" H 9430 6996 50  0000 L CNN
F 1 "74AC573" H 9430 6905 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9400 6550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 9400 6550 50  0001 C CNN
F 4 "Yes" H 4100 4800 50  0001 C CNN "Verified"
	2    9400 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 -4350 3850 -4350
Wire Wire Line
	3650 -4350 3550 -4350
Text HLabel 4400 -4350 2    50   Output ~ 0
~FPIRQ
Wire Wire Line
	400  -4250 1300 -4250
Text HLabel 950  -2450 0    50   Output ~ 0
~CVOE
Wire Wire Line
	950  -2450 1750 -2450
Text Notes 4650 5800 0    50   ~ 0
DTE/DCE cable config\n(aka I'm an idiot and always\nget the pinout wrong)
Text Label 4150 6650 0    50   ~ 0
RXD
Wire Wire Line
	4850 6150 4800 6150
$Comp
L alexios:SolderJumper_3_Bridged23 JP2
U 1 1 62B45C36
P 4950 6150
F 0 "JP2" V 4700 6150 50  0000 C CNN
F 1 "SolderJumper_3_Bridged23" H 4950 6260 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged23_RoundedPad1.0x1.5mm" H 4950 6150 50  0001 C CNN
F 3 "~" H 4950 6150 50  0001 C CNN
	1    4950 6150
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 6350 5100 6350
Connection ~ 4950 6350
Wire Wire Line
	4950 6300 4950 6350
Wire Wire Line
	5100 6350 5100 6150
Wire Wire Line
	4700 6350 4950 6350
Wire Wire Line
	4700 6300 4700 6350
Wire Wire Line
	4950 5950 5100 5950
Connection ~ 4950 5950
Wire Wire Line
	4950 6000 4950 5950
Wire Wire Line
	5100 6050 5250 6050
Wire Wire Line
	5100 5950 5100 6050
Wire Wire Line
	4700 5950 4950 5950
Wire Wire Line
	4700 6000 4700 5950
Wire Wire Line
	4550 6150 4600 6150
$Comp
L alexios:SolderJumper_3_Bridged12 JP1
U 1 1 62B114C6
P 4700 6150
F 0 "JP1" V 4450 6150 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 4700 6260 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 4700 6150 50  0001 C CNN
F 3 "~" H 4700 6150 50  0001 C CNN
	1    4700 6150
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 61A9831B
P 5450 6250
AR Path="/61A9831B" Ref="J?"  Part="1" 
AR Path="/60757845/61A9831B" Ref="J1"  Part="1" 
F 0 "J1" H 5550 6600 50  0000 C CNN
F 1 "Conn_01x06" H 5530 6151 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 5450 6250 50  0001 C CNN
F 3 "~" H 5450 6250 50  0001 C CNN
	1    5450 6250
	1    0    0    1   
$EndComp
Wire Wire Line
	5250 6150 5100 6150
$Comp
L power:GND #PWR?
U 1 1 61A98322
P 5250 6450
AR Path="/61A98322" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A98322" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 5250 6200 50  0001 C CNN
F 1 "GND" H 5255 6277 50  0000 C CNN
F 2 "" H 5250 6450 50  0001 C CNN
F 3 "" H 5250 6450 50  0001 C CNN
	1    5250 6450
	-1   0    0    -1  
$EndComp
NoConn ~ 5250 6350
NoConn ~ 5250 5950
NoConn ~ 5250 6250
Text Notes 5550 5950 0    50   ~ 0
~RTS
Text Notes 5550 6050 0    50   ~ 0
RXD
Text Notes 5550 6150 0    50   ~ 0
TXD
Text Notes 5550 6250 0    50   ~ 0
Vcc
Text Notes 5550 6450 0    50   ~ 0
GND
Text Notes 5550 6350 0    50   ~ 0
~CTS
Text HLabel 950  -2550 0    50   Output ~ 0
~DBOE
Text HLabel 950  -2650 0    50   Output ~ 0
~ABOE
Text HLabel 950  -2750 0    50   Output ~ 0
~IBOE
Text HLabel 950  -2850 0    50   Output ~ 0
CLRWS
Text HLabel 4350 -3050 2    50   3State ~ 0
~W
Text HLabel 4350 -2950 2    50   3State ~ 0
~R
Text HLabel 4350 -2850 2    50   3State ~ 0
~IO
Text HLabel 4350 -2750 2    50   3State ~ 0
~MEM
Wire Wire Line
	4300 -2750 4350 -2750
Wire Wire Line
	4300 -2850 4350 -2850
Wire Wire Line
	4300 -2950 4350 -2950
Wire Wire Line
	4300 -3050 4350 -3050
Wire Wire Line
	3550 -3050 4050 -3050
Wire Wire Line
	3550 -2950 4050 -2950
Wire Wire Line
	3550 -2850 4050 -2850
Wire Wire Line
	3550 -2750 4050 -2750
Wire Wire Line
	1750 -2550 950  -2550
Wire Wire Line
	1750 -2650 950  -2650
Wire Wire Line
	1750 -2750 950  -2750
Wire Wire Line
	1750 -2850 950  -2850
Text Label 1650 -1250 2    50   ~ 0
µCBUSCP
Text Label 1650 -1350 2    50   ~ 0
µCµSTEP
Text Label 1650 -1450 2    50   ~ 0
µCCLKEN
Text HLabel 950  -1250 0    50   Output ~ 0
BUSCP
Text HLabel 950  -1350 0    50   Output ~ 0
FPµSTEP-IN
Text HLabel 950  -1450 0    50   Output ~ 0
FPCLKEN-IN
Text HLabel 950  -1550 0    50   Output ~ 0
~FPRAM~∕ROM
$Comp
L alexios:momentary_switch SW1
U 1 1 61CAFDFF
P 1550 -4650
F 0 "SW1" H 1550 -4451 50  0000 C CNN
F 1 "momentary_switch" H 1550 -4710 50  0001 C CNN
F 2 "alexios:SW_Tactile_SPST_Angled_PTS645Vx39-2LFS" H 1550 -4450 50  0001 C CNN
F 3 "" H 1550 -4450 50  0001 C CNN
	1    1550 -4650
	-1   0    0    -1  
$EndComp
Text Label 4150 6150 0    50   ~ 0
TXD
$Comp
L Device:R_Small R?
U 1 1 61A9832D
P 4450 6150
AR Path="/61A9832D" Ref="R?"  Part="1" 
AR Path="/60757845/61A9832D" Ref="R5"  Part="1" 
F 0 "R5" V 4554 6150 50  0000 C CNN
F 1 "1kΩ" V 4645 6150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4450 6150 50  0001 C CNN
F 3 "~" H 4450 6150 50  0001 C CNN
	1    4450 6150
	0    1    1    0   
$EndComp
Text Notes 5600 5450 2    100  ~ 20
Control Interface & TTYD
Text HLabel 400  -4250 0    50   Output ~ 0
~FPHALT
Entry Wire Line
	7400 -3250 7300 -3150
Entry Wire Line
	7400 -3150 7300 -3050
Entry Wire Line
	7400 -3050 7300 -2950
Entry Wire Line
	7400 -2950 7300 -2850
Entry Wire Line
	7400 -2850 7300 -2750
Text HLabel 10200 -5600 2    50   BiDi ~ 0
FPD[0..7]
Text Label 9800 -5600 0    50   ~ 0
FPD[0..7]
Entry Bus Bus
	9750 -5600 9650 -5500
Entry Wire Line
	9550 -4550 9650 -4650
Entry Wire Line
	9550 -4650 9650 -4750
Entry Wire Line
	9550 -4750 9650 -4850
Entry Wire Line
	9550 -4850 9650 -4950
Entry Wire Line
	9550 -4950 9650 -5050
Entry Wire Line
	9550 -5050 9650 -5150
Entry Wire Line
	9550 -5150 9650 -5250
Entry Wire Line
	9550 -5250 9650 -5350
$Comp
L alexios:74HC245 U5
U 1 1 60AE5F32
P 8550 -4750
F 0 "U5" H 8550 -3983 50  0000 C CNN
F 1 "74HC245" H 8550 -4074 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8550 -4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 8550 -4700 50  0001 C CNN
	1    8550 -4750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8050 -4350 7750 -4350
Wire Wire Line
	7750 -4250 8050 -4250
Text Label 7750 -4250 0    50   ~ 0
SCANEN
Text Label 7750 -4350 0    50   ~ 0
~RD
Entry Bus Bus
	7400 -5600 7500 -5500
Entry Wire Line
	7600 -4550 7500 -4650
Entry Wire Line
	7600 -4650 7500 -4750
Entry Wire Line
	7600 -4750 7500 -4850
Entry Wire Line
	7600 -4850 7500 -4950
Entry Wire Line
	7600 -4950 7500 -5050
Entry Wire Line
	7600 -5050 7500 -5150
Entry Wire Line
	7600 -5150 7500 -5250
Entry Wire Line
	7600 -5250 7500 -5350
Text Label 1050 -2450 0    50   ~ 0
~CVOE
Text Label 750  -4250 0    50   ~ 0
~FPHALT
Text Notes 5950 -5700 0    100  ~ 20
Address Latch
Text Label 7250 -5600 2    50   ~ 0
MCD[0..7]
Entry Bus Bus
	4650 -5500 4750 -5600
Wire Wire Line
	5500 -2250 5950 -2250
Wire Wire Line
	6950 -2850 7300 -2850
Wire Wire Line
	6950 -2750 7300 -2750
NoConn ~ 6950 -2250
Text Label 5500 -2650 0    50   ~ 0
~SCANCLR
Wire Wire Line
	5900 -2850 5950 -2850
Wire Wire Line
	5900 -2950 5900 -2850
Wire Wire Line
	5950 -2950 5900 -2950
$Comp
L power:GND #PWR?
U 1 1 60796430
P 5950 -3150
AR Path="/60796430" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/60796430" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796430" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 5950 -3400 50  0001 C CNN
F 1 "GND" V 5955 -3278 50  0000 R CNN
F 2 "" H 5950 -3150 50  0001 C CNN
F 3 "" H 5950 -3150 50  0001 C CNN
	1    5950 -3150
	0    1    1    0   
$EndComp
Text Label 5500 -2250 0    50   ~ 0
~AUTOSCAN
Wire Wire Line
	6950 -2950 7300 -2950
Wire Wire Line
	6950 -3050 7300 -3050
Wire Wire Line
	6950 -3150 7300 -3150
$Comp
L alexios:74HC590 U?
U 1 1 60796422
P 6450 -2650
AR Path="/60796422" Ref="U?"  Part="1" 
AR Path="/6233F88C/60796422" Ref="U?"  Part="1" 
AR Path="/60757845/60796422" Ref="U4"  Part="1" 
F 0 "U4" H 6450 -1883 50  0000 C CNN
F 1 "74HC590" H 6450 -1974 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6750 -2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 6750 -2300 50  0001 C CNN
	1    6450 -2650
	1    0    0    -1  
$EndComp
Text Label 7400 -3950 1    50   ~ 0
MCA[0..7]
Entry Wire Line
	7300 -4550 7400 -4450
Entry Wire Line
	7300 -4650 7400 -4550
Entry Wire Line
	7300 -4750 7400 -4650
Entry Wire Line
	7300 -4850 7400 -4750
Entry Wire Line
	7300 -4950 7400 -4850
Entry Wire Line
	7300 -5050 7400 -4950
Entry Wire Line
	7300 -5150 7400 -5050
Entry Wire Line
	7300 -5250 7400 -5150
Text Label 3600 -4550 0    50   ~ 0
MCD7
Text Label 3600 -4650 0    50   ~ 0
MCD6
Text Label 3600 -4750 0    50   ~ 0
MCD5
Text Label 3600 -4850 0    50   ~ 0
MCD4
Text Label 3600 -4950 0    50   ~ 0
MCD3
Text Label 3600 -5050 0    50   ~ 0
MCD2
Text Label 3600 -5150 0    50   ~ 0
MCD1
Text Label 3600 -5250 0    50   ~ 0
MCD0
Text Label 4350 -4150 2    50   ~ 0
MFD1
Text Label 4350 -4250 2    50   ~ 0
MFD0
Text Label 1050 -2750 0    50   ~ 0
~IBOE
Text Label 1050 -2650 0    50   ~ 0
~ABOE
Text Label 1050 -2550 0    50   ~ 0
~DBOE
Text Label 1250 -1950 0    50   ~ 0
~CLR
Wire Wire Line
	1750 -1950 1200 -1950
Text Label 4350 -4350 2    50   ~ 0
~FPIRQ
Text Label 3900 -3050 2    50   ~ 0
~µCW
Text Label 3900 -2950 2    50   ~ 0
~µCR
Text Label 1050 -2850 0    50   ~ 0
CLRWS
Text Label 1250 -1850 0    50   ~ 0
SCK
Wire Wire Line
	1750 -1850 1250 -1850
Text HLabel 1200 -1950 0    50   Output ~ 0
~CLR
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 623E1F29
P 4200 -2950
AR Path="/623E1F29" Ref="RN?"  Part="3" 
AR Path="/60757845/623E1F29" Ref="RN4"  Part="3" 
F 0 "RN4" H 4300 -2900 50  0001 L CNN
F 1 "30Ω" H 4175 -2844 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4200 -2870 50  0001 C CNN
F 3 "~" V 4200 -2950 50  0001 C CNN
	3    4200 -2950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 623E1F23
P 4200 -2850
AR Path="/623E1F23" Ref="RN?"  Part="2" 
AR Path="/60757845/623E1F23" Ref="RN4"  Part="2" 
F 0 "RN4" H 4300 -2800 50  0001 L CNN
F 1 "30Ω" H 4175 -2744 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4200 -2770 50  0001 C CNN
F 3 "~" V 4200 -2850 50  0001 C CNN
	2    4200 -2850
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 623E1F2F
P 4200 -3050
AR Path="/623E1F2F" Ref="RN?"  Part="4" 
AR Path="/60757845/623E1F2F" Ref="RN4"  Part="4" 
F 0 "RN4" H 4300 -3000 50  0001 L CNN
F 1 "30Ω" H 4175 -2944 50  0001 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4200 -2970 50  0001 C CNN
F 3 "~" V 4200 -3050 50  0001 C CNN
	4    4200 -3050
	1    0    0    1   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 623E1F1D
P 4200 -2750
AR Path="/623E1F1D" Ref="RN?"  Part="1" 
AR Path="/60757845/623E1F1D" Ref="RN4"  Part="1" 
F 0 "RN4" H 4300 -2850 50  0000 L CNN
F 1 "30Ω" H 3950 -2800 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" H 4200 -2670 50  0001 C CNN
F 3 "~" V 4200 -2750 50  0001 C CNN
	1    4200 -2750
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 6C5C0C4C
P 1750 -1750
F 0 "TP1" V 1700 -1600 50  0000 L CNN
F 1 "TestPoint" V 1795 -1562 50  0001 L CNN
F 2 "TestPoint:TestPoint_Bridge_Pitch2.54mm_Drill1.0mm" H 1950 -1750 50  0001 C CNN
F 3 "~" H 1950 -1750 50  0001 C CNN
	1    1750 -1750
	0    -1   1    0   
$EndComp
Wire Wire Line
	5450 -2650 5950 -2650
Text HLabel 5450 -2650 0    50   Input ~ 0
~SCANCLR
Wire Wire Line
	1750 -5250 1700 -5250
Wire Wire Line
	1750 -5050 1700 -5050
Wire Wire Line
	1750 -4950 1700 -4950
$Comp
L power:+12V #PWR0160
U 1 1 61657A32
P 1700 -5300
F 0 "#PWR0160" H 1700 -5450 50  0001 C CNN
F 1 "+12V" H 1715 -5127 50  0000 C CNN
F 2 "" H 1700 -5300 50  0001 C CNN
F 3 "" H 1700 -5300 50  0001 C CNN
	1    1700 -5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 -5300 1700 -5250
NoConn ~ 1750 -5150
Wire Wire Line
	1700 -5050 1700 -4950
NoConn ~ 1750 -4750
$Comp
L power:GND #PWR0161
U 1 1 6172919D
P 1350 -4650
F 0 "#PWR0161" H 1350 -4900 50  0001 C CNN
F 1 "GND" H 1200 -4700 50  0000 C CNN
F 2 "" H 1350 -4650 50  0001 C CNN
F 3 "" H 1350 -4650 50  0001 C CNN
	1    1350 -4650
	1    0    0    -1  
$EndComp
Text Label 5700 -4350 0    50   ~ 0
ALE
Text Label 5700 -4250 0    50   ~ 0
~BUSEN
Entry Wire Line
	4750 -4550 4650 -4650
Entry Wire Line
	4750 -4650 4650 -4750
Entry Wire Line
	4750 -4750 4650 -4850
Entry Wire Line
	4750 -4850 4650 -4950
Entry Wire Line
	4750 -4950 4650 -5050
Entry Wire Line
	4750 -5050 4650 -5150
Entry Wire Line
	4750 -5150 4650 -5250
Entry Wire Line
	4750 -5250 4650 -5350
Wire Wire Line
	6950 -5250 7300 -5250
Wire Wire Line
	6950 -5150 7300 -5150
Wire Wire Line
	6950 -5050 7300 -5050
Wire Wire Line
	6950 -4950 7300 -4950
Wire Wire Line
	6950 -4850 7300 -4850
Wire Wire Line
	6950 -4750 7300 -4750
Wire Wire Line
	6950 -4650 7300 -4650
Wire Wire Line
	6950 -4550 7300 -4550
$Comp
L alexios:74AC573 U?
U 1 1 6079616A
P 6450 -4750
AR Path="/6079616A" Ref="U?"  Part="1" 
AR Path="/60757845/6079616A" Ref="U3"  Part="1" 
F 0 "U3" H 6450 -3983 50  0000 C CNN
F 1 "74AC573" H 6450 -4074 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6450 -4750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 6450 -4750 50  0001 C CNN
F 4 "Yes" H 1150 -6500 50  0001 C CNN "Verified"
	1    6450 -4750
	1    0    0    -1  
$EndComp
Wire Bus Line
	4750 -5600 7400 -5600
Wire Bus Line
	9750 -5600 10200 -5600
Text Notes 8000 -5700 0    100  ~ 20
Data Bus Buffer
Wire Wire Line
	1550 -3450 1750 -3450
Wire Wire Line
	1550 -3550 1750 -3550
Wire Wire Line
	1550 -3650 1750 -3650
Wire Wire Line
	1550 -3750 1750 -3750
Text Notes 1000 -2950 0    50   ~ 0
µCU pulls up SWD
Text Label 800  -3050 0    50   ~ 0
SWD3
Text Label 800  -3150 0    50   ~ 0
SWD2
Text Label 800  -3250 0    50   ~ 0
SWD1
Text Label 800  -3350 0    50   ~ 0
SWD0
Text Label 800  -3450 0    50   ~ 0
SWA3
Text Label 800  -3550 0    50   ~ 0
SWA2
Text Label 800  -3650 0    50   ~ 0
SWA1
Text Label 800  -3750 0    50   ~ 0
SWA0
Text Label 3900 -2550 2    50   ~ 0
~IOINT
Wire Wire Line
	3550 -2550 4350 -2550
Text HLabel 4400 -3950 2    50   Output ~ 0
~LED-STOP
Text Label 4250 -3950 2    50   ~ 0
~LED-STOP
Wire Wire Line
	3550 -2450 4350 -2450
Text HLabel 4350 -2450 2    50   Input ~ 0
~WAIT
Text HLabel 4350 -2550 2    50   Input ~ 0
~IOINT
Text Label 4150 -3250 2    50   ~ 0
~PANELEN
Text Label 3900 -2450 2    50   ~ 0
~WAIT
Text Label 3650 -1650 0    50   ~ 0
~µSTEP
Text Label 3650 -1750 0    50   ~ 0
STEP∕~RUN
Text Label 4150 -3350 2    50   ~ 0
~AUTOSCAN
NoConn ~ 3550 -1950
NoConn ~ 3550 -1850
Text Notes 3650 -1900 0    50   ~ 0
USART0 used for\nprogramming
$Comp
L Device:R_Small R?
U 1 1 6274D6EC
P 3750 -3750
AR Path="/6274D6EC" Ref="R?"  Part="1" 
AR Path="/60757845/6274D6EC" Ref="R3"  Part="1" 
F 0 "R3" V 3800 -3600 50  0000 C CNN
F 1 "30Ω" V 3800 -3950 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 -3750 50  0001 C CNN
F 3 "~" H 3750 -3750 50  0001 C CNN
	1    3750 -3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3850 -3750 4400 -3750
Text HLabel 4400 -3750 2    50   Output ~ 0
~LTSON
Text Label 4200 -1250 2    50   ~ 0
~RD
Text Label 4200 -1350 2    50   ~ 0
~WR
Wire Wire Line
	5700 -4350 5950 -4350
Wire Wire Line
	3550 -2350 3900 -2350
Wire Wire Line
	3550 -2250 3900 -2250
Wire Wire Line
	3550 -3950 4400 -3950
NoConn ~ 3550 -1550
NoConn ~ 3550 -850
NoConn ~ 3550 -750
NoConn ~ 3550 -1050
$Comp
L Device:R_Small R?
U 1 1 6216E2A2
P 3750 -4350
AR Path="/6216E2A2" Ref="R?"  Part="1" 
AR Path="/60757845/6216E2A2" Ref="R37"  Part="1" 
F 0 "R37" V 3850 -4300 50  0000 C CNN
F 1 "30Ω" V 3800 -4550 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 -4350 50  0001 C CNN
F 3 "~" H 3750 -4350 50  0001 C CNN
	1    3750 -4350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6265D34E
P 1400 -4150
AR Path="/6265D34E" Ref="R?"  Part="1" 
AR Path="/60757845/6265D34E" Ref="R39"  Part="1" 
F 0 "R39" V 1450 -4000 50  0000 C CNN
F 1 "30Ω" V 1450 -4350 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 -4150 50  0001 C CNN
F 3 "~" H 1400 -4150 50  0001 C CNN
	1    1400 -4150
	0    -1   1    0   
$EndComp
Wire Wire Line
	1500 -4250 1750 -4250
$Comp
L Device:R_Small R?
U 1 1 626D97D3
P 1400 -4250
AR Path="/626D97D3" Ref="R?"  Part="1" 
AR Path="/60757845/626D97D3" Ref="R38"  Part="1" 
F 0 "R38" V 1450 -4100 50  0000 C CNN
F 1 "30Ω" V 1450 -4450 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 -4250 50  0001 C CNN
F 3 "~" H 1400 -4250 50  0001 C CNN
	1    1400 -4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 -4150 1750 -4150
$Comp
L Device:R_Small R?
U 1 1 6285AE62
P 1400 -3950
AR Path="/6285AE62" Ref="R?"  Part="1" 
AR Path="/60757845/6285AE62" Ref="R41"  Part="1" 
F 0 "R41" V 1450 -3800 50  0000 C CNN
F 1 "30Ω" V 1450 -4150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 -3950 50  0001 C CNN
F 3 "~" H 1400 -3950 50  0001 C CNN
	1    1400 -3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6285AE68
P 1400 -4050
AR Path="/6285AE68" Ref="R?"  Part="1" 
AR Path="/60757845/6285AE68" Ref="R40"  Part="1" 
F 0 "R40" V 1450 -3900 50  0000 C CNN
F 1 "30Ω" V 1450 -4250 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 -4050 50  0001 C CNN
F 3 "~" H 1400 -4050 50  0001 C CNN
	1    1400 -4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	400  -4050 1300 -4050
Wire Wire Line
	1500 -4050 1750 -4050
Wire Wire Line
	400  -3950 1300 -3950
Wire Wire Line
	1500 -3950 1750 -3950
Wire Wire Line
	5700 -4250 5950 -4250
NoConn ~ 3550 -3650
NoConn ~ 3550 -3150
NoConn ~ 3550 -2150
Wire Wire Line
	5900 -2850 5900 -1550
$Comp
L power:+5V #PWR?
U 1 1 601CE92A
P 7150 -1500
AR Path="/601CE92A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE92A" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 7150 -1650 50  0001 C CNN
F 1 "+5V" H 7165 -1327 50  0000 C CNN
F 2 "" H 7150 -1500 50  0001 C CNN
F 3 "" H 7150 -1500 50  0001 C CNN
	1    7150 -1500
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 62FDCC3F
P 4450 6650
AR Path="/62FDCC3F" Ref="R?"  Part="1" 
AR Path="/60757845/62FDCC3F" Ref="R1"  Part="1" 
F 0 "R1" V 4554 6650 50  0000 C CNN
F 1 "1kΩ" V 4645 6650 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4450 6650 50  0001 C CNN
F 3 "~" H 4450 6650 50  0001 C CNN
	1    4450 6650
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 6650 4800 6650
Wire Wire Line
	4800 6150 4800 6650
Wire Wire Line
	4050 6150 4350 6150
$Comp
L Device:CP_Small C?
U 1 1 632C8EE9
P 1350 -5150
AR Path="/632C8EE9" Ref="C?"  Part="1" 
AR Path="/5D34E810/632C8EE9" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/632C8EE9" Ref="C?"  Part="1" 
AR Path="/60757845/632C8EE9" Ref="C22"  Part="1" 
F 0 "C22" H 1262 -5104 50  0000 R CNN
F 1 "100µF, 16V" H 1262 -5195 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 1350 -5150 50  0001 C CNN
F 3 "~" H 1350 -5150 50  0001 C CNN
	1    1350 -5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 632C8EEF
P 1350 -5000
AR Path="/5F67D4B5/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/632C8EEF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/632C8EEF" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 1350 -5250 50  0001 C CNN
F 1 "GND" H 1272 -5037 50  0000 R CNN
F 2 "" H 1350 -5000 50  0001 C CNN
F 3 "" H 1350 -5000 50  0001 C CNN
	1    1350 -5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 -5300 1350 -5250
Wire Wire Line
	1350 -5050 1350 -5000
$Comp
L power:+12V #PWR0162
U 1 1 632E50B5
P 1350 -5300
F 0 "#PWR0162" H 1350 -5450 50  0001 C CNN
F 1 "+12V" H 1365 -5127 50  0000 C CNN
F 2 "" H 1350 -5300 50  0001 C CNN
F 3 "" H 1350 -5300 50  0001 C CNN
	1    1350 -5300
	1    0    0    -1  
$EndComp
$Comp
L alexios:Arduino-Mega-2560 J8
U 1 1 6158B038
P 2650 -2950
F 0 "J8" H 2650 -311 60  0000 C CNN
F 1 "Arduino-Mega-2560" H 2650 -417 60  0000 C CNN
F 2 "alexios:Arduino-Mega-2560-Mezzanine-Upside-Down" H 3325 -200 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-mega-2560-rev3" H 3325 -200 60  0001 C CNN
	1    2650 -2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 -1150 4000 -1150
Text Label 4200 -1150 2    50   ~ 0
ALE
Wire Wire Line
	4750 -4550 5950 -4550
Wire Wire Line
	4750 -4650 5950 -4650
Wire Wire Line
	4750 -4750 5950 -4750
Wire Wire Line
	4750 -4850 5950 -4850
Wire Wire Line
	4750 -4950 5950 -4950
Wire Wire Line
	4750 -5050 5950 -5050
Wire Wire Line
	4750 -5150 5950 -5150
Wire Wire Line
	4750 -5250 5950 -5250
Text Label 5900 -5250 2    50   ~ 0
MCD0
Text Label 5900 -5150 2    50   ~ 0
MCD1
Text Label 5900 -5050 2    50   ~ 0
MCD2
Text Label 5900 -4950 2    50   ~ 0
MCD3
Text Label 5900 -4850 2    50   ~ 0
MCD4
Text Label 5900 -4750 2    50   ~ 0
MCD5
Text Label 5900 -4650 2    50   ~ 0
MCD6
Text Label 5900 -4550 2    50   ~ 0
MCD7
Text Label 6950 -5250 0    50   ~ 0
FPA0
Text Label 6950 -5150 0    50   ~ 0
FPA1
Text Label 6950 -5050 0    50   ~ 0
FPA2
Text Label 6950 -4950 0    50   ~ 0
FPA3
Text Label 6950 -4850 0    50   ~ 0
FPA4
Text Label 6950 -4750 0    50   ~ 0
FPA5
Text Label 6950 -4650 0    50   ~ 0
FPA6
Text Label 6950 -4550 0    50   ~ 0
FPA7
Text Label 6950 -3150 0    50   ~ 0
FPA0
Text Label 6950 -3050 0    50   ~ 0
FPA1
Text Label 6950 -2950 0    50   ~ 0
FPA2
Text Label 6950 -2850 0    50   ~ 0
FPA3
Text Label 6950 -2750 0    50   ~ 0
FPA4
Wire Wire Line
	9050 -5250 9550 -5250
Wire Wire Line
	9050 -5150 9550 -5150
Wire Wire Line
	9050 -5050 9550 -5050
Wire Wire Line
	9050 -4950 9550 -4950
Wire Wire Line
	9050 -4850 9550 -4850
Wire Wire Line
	9050 -4750 9550 -4750
Wire Wire Line
	9050 -4650 9550 -4650
Wire Wire Line
	9050 -4550 9550 -4550
Text Label 9500 -5250 2    50   ~ 0
FPD0
Text Label 9500 -5150 2    50   ~ 0
FPD1
Text Label 9500 -5050 2    50   ~ 0
FPD2
Text Label 9500 -4950 2    50   ~ 0
FPD3
Text Label 9500 -4850 2    50   ~ 0
FPD4
Text Label 9500 -4750 2    50   ~ 0
FPD5
Text Label 9500 -4650 2    50   ~ 0
FPD6
Text Label 9500 -4550 2    50   ~ 0
FPD7
Text Label 7950 -5250 2    50   ~ 0
MCD0
Wire Wire Line
	7600 -4550 8050 -4550
Wire Wire Line
	7600 -4650 8050 -4650
Wire Wire Line
	7600 -4750 8050 -4750
Wire Wire Line
	7600 -4850 8050 -4850
Wire Wire Line
	7600 -4950 8050 -4950
Wire Wire Line
	7600 -5050 8050 -5050
Wire Wire Line
	7600 -5150 8050 -5150
Wire Wire Line
	7600 -5250 8050 -5250
Text Label 7950 -5150 2    50   ~ 0
MCD1
Text Label 7950 -5050 2    50   ~ 0
MCD2
Text Label 7950 -4950 2    50   ~ 0
MCD3
Text Label 7950 -4850 2    50   ~ 0
MCD4
Text Label 7950 -4750 2    50   ~ 0
MCD5
Text Label 7950 -4650 2    50   ~ 0
MCD6
Text Label 7950 -4550 2    50   ~ 0
MCD7
Entry Wire Line
	8750 -3150 8850 -3250
Entry Wire Line
	8750 -3050 8850 -3150
Entry Wire Line
	8750 -2950 8850 -3050
Entry Wire Line
	8750 -2850 8850 -2950
Entry Wire Line
	8750 -2750 8850 -2850
Entry Wire Line
	8750 -2650 8850 -2750
Entry Wire Line
	8750 -2550 8850 -2650
Entry Wire Line
	8750 -2450 8850 -2550
Entry Bus Bus
	8950 -3500 8850 -3400
Wire Bus Line
	9400 -3500 8950 -3500
Text Label 9000 -3500 0    50   ~ 0
FPA[0..7]
Text HLabel 9400 -3500 2    50   BiDi ~ 0
FPA[0..7]
Text Label 8500 -3150 0    50   ~ 0
FPA0
Text Label 8500 -3050 0    50   ~ 0
FPA1
Text Label 8500 -2950 0    50   ~ 0
FPA2
Text Label 8500 -2850 0    50   ~ 0
FPA3
Text Label 8500 -2750 0    50   ~ 0
FPA4
Text Label 8500 -2650 0    50   ~ 0
FPA5
Text Label 8500 -2550 0    50   ~ 0
FPA6
Text Label 8500 -2450 0    50   ~ 0
FPA7
$Comp
L Device:R_Small R?
U 1 1 6263FC4F
P 4000 -1000
AR Path="/6263FC4F" Ref="R?"  Part="1" 
AR Path="/64C48268/6263FC4F" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/6263FC4F" Ref="R?"  Part="1" 
AR Path="/60A2F394/6263FC4F" Ref="R?"  Part="1" 
AR Path="/60757845/6263FC4F" Ref="R4"  Part="1" 
F 0 "R4" H 3942 -1046 50  0000 R CNN
F 1 "4.7kΩ" H 3942 -955 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4000 -1000 50  0001 C CNN
F 3 "~" H 4000 -1000 50  0001 C CNN
	1    4000 -1000
	1    0    0    1   
$EndComp
Wire Wire Line
	4000 -1100 4000 -1150
Connection ~ 4000 -1150
Wire Wire Line
	4000 -1150 4200 -1150
$Comp
L power:GND #PWR0164
U 1 1 626550E7
P 4000 -900
F 0 "#PWR0164" H 4000 -1150 50  0001 C CNN
F 1 "GND" H 4005 -1073 50  0000 C CNN
F 2 "" H 4000 -900 50  0001 C CNN
F 3 "" H 4000 -900 50  0001 C CNN
	1    4000 -900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 -4150 400  -4150
Text Label 400  -4150 0    50   ~ 0
SPARE
Text Label 3900 -2350 2    50   ~ 0
RXDA
Text Label 3900 -2250 2    50   ~ 0
TXDA
Wire Wire Line
	1750 -1050 1400 -1050
Wire Wire Line
	1750 -950 1400 -950
Text Label 1400 -1050 0    50   ~ 0
RXDB
Text Label 1400 -950 0    50   ~ 0
TXDB
$Comp
L alexios:SolderJumper_3_Bridged12 JP7
U 1 1 6276C558
P 3950 6150
F 0 "JP7" V 3700 6150 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 3950 6260 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 3950 6150 50  0001 C CNN
F 3 "~" H 3950 6150 50  0001 C CNN
	1    3950 6150
	0    -1   1    0   
$EndComp
Wire Wire Line
	3950 6000 3550 6000
Wire Wire Line
	3950 6300 3550 6300
Text Label 3550 6000 0    50   ~ 0
TXDA
Text Label 3550 6300 0    50   ~ 0
TXDB
$Comp
L alexios:SolderJumper_3_Bridged12 JP9
U 1 1 627ADF72
P 3950 6650
F 0 "JP9" V 3700 6650 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 3950 6760 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 3950 6650 50  0001 C CNN
F 3 "~" H 3950 6650 50  0001 C CNN
	1    3950 6650
	0    -1   1    0   
$EndComp
Wire Wire Line
	3950 6800 3550 6800
Wire Wire Line
	3950 6500 3550 6500
Text Label 3550 6500 0    50   ~ 0
RXDA
Text Label 3550 6800 0    50   ~ 0
RXDB
Wire Wire Line
	950  -1550 1750 -1550
Wire Wire Line
	950  -1450 1750 -1450
Wire Wire Line
	950  -1350 1750 -1350
Wire Wire Line
	950  -1250 1750 -1250
$Comp
L alexios:SolderJumper_3_Bridged12 JP501
U 1 1 611D7AFF
P 5750 -1550
F 0 "JP501" V 5750 -1350 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 5750 -1440 50  0001 C CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 5750 -1550 50  0001 C CNN
F 3 "~" H 5750 -1550 50  0001 C CNN
	1    5750 -1550
	0    -1   -1   0   
$EndComp
Text Label 4400 -3850 2    50   ~ 0
µCSCANCLK
Text Label 5250 -1900 0    50   ~ 0
µCSCANCLK
Wire Wire Line
	5750 -1900 5750 -1700
Wire Wire Line
	5850 -1550 5900 -1550
Wire Wire Line
	5750 -1400 5750 -1300
Wire Wire Line
	5750 -1300 6050 -1300
Wire Wire Line
	9050 -4350 9350 -4350
Wire Wire Line
	9350 -4250 9050 -4250
Text Label 9350 -4250 2    50   ~ 0
SCANEN
Text Label 9350 -4350 2    50   ~ 0
~WR
$Comp
L Device:R_Network08 RN7
U 1 1 6223B257
P 8000 -2150
F 0 "RN7" H 8388 -2104 50  0000 L CNN
F 1 "10kΩ" H 8388 -2195 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 8475 -2150 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8000 -2150 50  0001 C CNN
	1    8000 -2150
	-1   0    0    1   
$EndComp
NoConn ~ 6950 -2450
NoConn ~ 6950 -2550
NoConn ~ 6950 -2650
Wire Wire Line
	7500 -3150 7700 -3150
Wire Wire Line
	7500 -3050 7800 -3050
Wire Wire Line
	7500 -2950 7900 -2950
Wire Wire Line
	7500 -2850 8000 -2850
Wire Wire Line
	7500 -2750 8100 -2750
Wire Wire Line
	7500 -2450 8400 -2450
Wire Wire Line
	7500 -2550 8300 -2550
$Comp
L power:GND #PWR0232
U 1 1 63D7491E
P 8400 -1950
F 0 "#PWR0232" H 8400 -2200 50  0001 C CNN
F 1 "GND" H 8405 -2123 50  0000 C CNN
F 2 "" H 8400 -1950 50  0001 C CNN
F 3 "" H 8400 -1950 50  0001 C CNN
	1    8400 -1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 -2350 7700 -3150
Connection ~ 7700 -3150
Wire Wire Line
	7700 -3150 8750 -3150
Wire Wire Line
	7800 -2350 7800 -3050
Connection ~ 7800 -3050
Wire Wire Line
	7800 -3050 8750 -3050
Wire Wire Line
	7900 -2350 7900 -2950
Connection ~ 7900 -2950
Wire Wire Line
	7900 -2950 8750 -2950
Wire Wire Line
	8000 -2350 8000 -2850
Connection ~ 8000 -2850
Wire Wire Line
	8000 -2850 8750 -2850
Wire Wire Line
	8100 -2350 8100 -2750
Connection ~ 8100 -2750
Wire Wire Line
	8100 -2750 8750 -2750
Wire Wire Line
	8200 -2350 8200 -2650
Wire Wire Line
	7500 -2650 8200 -2650
Connection ~ 8200 -2650
Wire Wire Line
	8200 -2650 8750 -2650
Wire Wire Line
	8300 -2350 8300 -2550
Connection ~ 8300 -2550
Wire Wire Line
	8300 -2550 8750 -2550
Wire Wire Line
	8400 -2350 8400 -2450
Connection ~ 8400 -2450
Wire Wire Line
	8400 -2450 8750 -2450
Text Notes 7650 -3550 0    100  ~ 20
Address Bus
Wire Wire Line
	3550 -3450 4150 -3450
Text Label 4150 -3450 2    50   ~ 0
~BUSEN
$Comp
L Device:R_Small R?
U 1 1 67A9C2B9
P 1450 -3750
AR Path="/67A9C2B9" Ref="R?"  Part="1" 
AR Path="/60757845/67A9C2B9" Ref="R1501"  Part="1" 
F 0 "R1501" V 1500 -3550 50  0000 C CNN
F 1 "1kΩ" V 1500 -3950 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1450 -3750 50  0001 C CNN
F 3 "~" H 1450 -3750 50  0001 C CNN
	1    1450 -3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	700  -3750 1350 -3750
Wire Wire Line
	700  -3650 1350 -3650
Wire Wire Line
	700  -3550 1350 -3550
Wire Wire Line
	700  -3450 1350 -3450
$Comp
L Device:R_Small R?
U 1 1 67B0D557
P 1450 -3650
AR Path="/67B0D557" Ref="R?"  Part="1" 
AR Path="/60757845/67B0D557" Ref="R1502"  Part="1" 
F 0 "R1502" V 1500 -3450 50  0000 C CNN
F 1 "1kΩ" V 1500 -3850 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1450 -3650 50  0001 C CNN
F 3 "~" H 1450 -3650 50  0001 C CNN
	1    1450 -3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 67B0D6E4
P 1450 -3550
AR Path="/67B0D6E4" Ref="R?"  Part="1" 
AR Path="/60757845/67B0D6E4" Ref="R1503"  Part="1" 
F 0 "R1503" V 1500 -3350 50  0000 C CNN
F 1 "1kΩ" V 1500 -3750 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1450 -3550 50  0001 C CNN
F 3 "~" H 1450 -3550 50  0001 C CNN
	1    1450 -3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 67B0D856
P 1450 -3450
AR Path="/67B0D856" Ref="R?"  Part="1" 
AR Path="/60757845/67B0D856" Ref="R1504"  Part="1" 
F 0 "R1504" V 1500 -3250 50  0000 C CNN
F 1 "1kΩ" V 1500 -3650 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1450 -3450 50  0001 C CNN
F 3 "~" H 1450 -3450 50  0001 C CNN
	1    1450 -3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	700  -3350 1750 -3350
Wire Wire Line
	700  -3250 1750 -3250
Wire Wire Line
	700  -3150 1750 -3150
Wire Wire Line
	700  -3050 1750 -3050
Text Notes 4850 -1725 0    50   ~ 0
(= ~LED-RUN)
Wire Wire Line
	3550 -1650 4350 -1650
Text HLabel 4350 -1650 2    50   Output ~ 0
~µSTEP
Wire Wire Line
	3550 -1750 4350 -1750
Text HLabel 4350 -1750 2    50   Output ~ 0
STEP∕~RUN
Wire Wire Line
	3550 -1350 4400 -1350
Wire Wire Line
	3550 -1250 4400 -1250
Text HLabel 5150 -1350 2    50   Output ~ 0
~WR
Text HLabel 5150 -1250 2    50   Output ~ 0
~RD
$Comp
L Device:R_Small R?
U 1 1 6111D492
P 4600 -1100
AR Path="/6111D492" Ref="R?"  Part="1" 
AR Path="/64C48268/6111D492" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/6111D492" Ref="R?"  Part="1" 
AR Path="/60A2F394/6111D492" Ref="R?"  Part="1" 
AR Path="/60757845/6111D492" Ref="R8"  Part="1" 
F 0 "R8" V 4704 -1100 50  0000 C CNN
F 1 "4.7kΩ" V 4795 -1100 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 -1100 50  0001 C CNN
F 3 "~" H 4600 -1100 50  0001 C CNN
	1    4600 -1100
	0    -1   1    0   
$EndComp
Wire Wire Line
	4400 -1250 4400 -1100
Wire Wire Line
	4400 -1100 4500 -1100
Connection ~ 4400 -1250
Wire Wire Line
	4400 -1250 5150 -1250
Wire Wire Line
	4700 -1100 4850 -1100
$Comp
L power:+5V #PWR0126
U 1 1 61179DB6
P 4850 -1500
F 0 "#PWR0126" H 4850 -1650 50  0001 C CNN
F 1 "+5V" H 5000 -1450 50  0000 C CNN
F 2 "" H 4850 -1500 50  0001 C CNN
F 3 "" H 4850 -1500 50  0001 C CNN
	1    4850 -1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 61192B3D
P 4600 -1500
AR Path="/61192B3D" Ref="R?"  Part="1" 
AR Path="/64C48268/61192B3D" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/61192B3D" Ref="R?"  Part="1" 
AR Path="/60A2F394/61192B3D" Ref="R?"  Part="1" 
AR Path="/60757845/61192B3D" Ref="R7"  Part="1" 
F 0 "R7" V 4550 -1650 50  0000 C CNN
F 1 "4.7kΩ" V 4700 -1500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 -1500 50  0001 C CNN
F 3 "~" H 4600 -1500 50  0001 C CNN
	1    4600 -1500
	0    -1   1    0   
$EndComp
Wire Wire Line
	4400 -1350 4400 -1500
Wire Wire Line
	4400 -1500 4500 -1500
Connection ~ 4400 -1350
Wire Wire Line
	4400 -1350 5150 -1350
$Comp
L power:+5V #PWR0127
U 1 1 6129B21F
P 4850 -1100
F 0 "#PWR0127" H 4850 -1250 50  0001 C CNN
F 1 "+5V" H 5000 -1050 50  0000 C CNN
F 2 "" H 4850 -1100 50  0001 C CNN
F 3 "" H 4850 -1100 50  0001 C CNN
	1    4850 -1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 -1500 4850 -1500
NoConn ~ 1750 -2350
NoConn ~ 1750 -2250
NoConn ~ 1750 -2150
Text Label 14750 4850 0    50   ~ 0
CLRWS
Text Label 14750 4650 0    50   ~ 0
µUCSTEP
Text Label 14750 4750 0    50   ~ 0
µCBUSCP
Text Label 14750 5450 0    50   ~ 0
~µSTEP
Text Label 14750 5350 0    50   ~ 0
STEP∕~RUN
Text Label 14750 5250 0    50   ~ 0
~LED-STOP
Text Label 14750 5150 0    50   ~ 0
~PANELEN
Wire Wire Line
	3550 -3250 4350 -3250
Text HLabel 4350 -3250 2    50   Output ~ 0
~PANELEN
Wire Wire Line
	3550 -3350 4350 -3350
Text HLabel 4350 -3350 2    50   Output ~ 0
~AUTOSCAN
Wire Wire Line
	4850 -1900 5750 -1900
Wire Wire Line
	3550 -3850 4850 -3850
Wire Wire Line
	4850 -3850 4850 -1900
Wire Wire Line
	12600 -1300 12200 -1300
Text Label 12200 -1300 0    50   ~ 0
~BUSEN
$Comp
L power:+5V #PWR01501
U 1 1 618C46D8
P 13100 -1300
F 0 "#PWR01501" H 13100 -1450 50  0001 C CNN
F 1 "+5V" H 13250 -1250 50  0000 C CNN
F 2 "" H 13100 -1300 50  0001 C CNN
F 3 "" H 13100 -1300 50  0001 C CNN
	1    13100 -1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 618C46DE
P 12700 -1300
AR Path="/618C46DE" Ref="R?"  Part="1" 
AR Path="/64C48268/618C46DE" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/618C46DE" Ref="R?"  Part="1" 
AR Path="/60A2F394/618C46DE" Ref="R?"  Part="1" 
AR Path="/60757845/618C46DE" Ref="R1505"  Part="1" 
F 0 "R1505" V 12650 -1650 50  0000 L CNN
F 1 "4.7kΩ" V 12750 -1650 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 12700 -1300 50  0001 C CNN
F 3 "~" H 12700 -1300 50  0001 C CNN
	1    12700 -1300
	0    -1   1    0   
$EndComp
Wire Wire Line
	12800 -1300 13100 -1300
Wire Wire Line
	12600 -1100 12200 -1100
Text Label 12200 -1100 0    50   ~ 0
~AUTOSCAN
$Comp
L power:+5V #PWR01502
U 1 1 6190F3A4
P 13100 -1100
F 0 "#PWR01502" H 13100 -1250 50  0001 C CNN
F 1 "+5V" H 13250 -1050 50  0000 C CNN
F 2 "" H 13100 -1100 50  0001 C CNN
F 3 "" H 13100 -1100 50  0001 C CNN
	1    13100 -1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6190F3AA
P 12700 -1100
AR Path="/6190F3AA" Ref="R?"  Part="1" 
AR Path="/64C48268/6190F3AA" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/6190F3AA" Ref="R?"  Part="1" 
AR Path="/60A2F394/6190F3AA" Ref="R?"  Part="1" 
AR Path="/60757845/6190F3AA" Ref="R1506"  Part="1" 
F 0 "R1506" V 12650 -1450 50  0000 L CNN
F 1 "4.7kΩ" V 12750 -1450 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 12700 -1100 50  0001 C CNN
F 3 "~" H 12700 -1100 50  0001 C CNN
	1    12700 -1100
	0    -1   1    0   
$EndComp
Wire Wire Line
	12800 -1100 13100 -1100
Wire Wire Line
	12600 -900 12200 -900
Text Label 12200 -900 0    50   ~ 0
~PANELEN
$Comp
L power:+5V #PWR01503
U 1 1 619355AA
P 13100 -900
F 0 "#PWR01503" H 13100 -1050 50  0001 C CNN
F 1 "+5V" H 13250 -850 50  0000 C CNN
F 2 "" H 13100 -900 50  0001 C CNN
F 3 "" H 13100 -900 50  0001 C CNN
	1    13100 -900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 619355B0
P 12700 -900
AR Path="/619355B0" Ref="R?"  Part="1" 
AR Path="/64C48268/619355B0" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/619355B0" Ref="R?"  Part="1" 
AR Path="/60A2F394/619355B0" Ref="R?"  Part="1" 
AR Path="/60757845/619355B0" Ref="R1507"  Part="1" 
F 0 "R1507" V 12650 -1250 50  0000 L CNN
F 1 "4.7kΩ" V 12750 -1250 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 12700 -900 50  0001 C CNN
F 3 "~" H 12700 -900 50  0001 C CNN
	1    12700 -900
	0    -1   1    0   
$EndComp
Wire Wire Line
	12800 -900 13100 -900
Text HLabel 400  -3300 0    50   Output ~ 0
SWA[0..3]
Text HLabel 400  -2750 0    50   Input ~ 0
SWD[0..3]
Entry Wire Line
	600  -3850 700  -3750
Entry Wire Line
	600  -3750 700  -3650
Entry Wire Line
	600  -3650 700  -3550
Entry Wire Line
	700  -3050 600  -2950
Entry Wire Line
	700  -3150 600  -3050
Entry Wire Line
	700  -3250 600  -3150
Entry Wire Line
	700  -3350 600  -3250
Entry Wire Line
	600  -3550 700  -3450
Entry Bus Bus
	600  -2850 500  -2750
Wire Bus Line
	500  -2750 400  -2750
Entry Bus Bus
	600  -3400 500  -3300
Wire Bus Line
	500  -3300 400  -3300
Wire Wire Line
	3650 -3750 3550 -3750
Wire Wire Line
	3550 -4050 4400 -4050
Text Label 4150 -4050 0    50   ~ 0
MFD2
Text HLabel 4400 -4150 2    50   Output ~ 0
MFD1
Text HLabel 4400 -4250 2    50   Output ~ 0
MFD0
Text HLabel 4400 -4050 2    50   Output ~ 0
MFD2
Wire Bus Line
	600  -3250 600  -2850
Wire Bus Line
	600  -3850 600  -3400
Wire Bus Line
	8850 -3400 8850 -2550
Wire Bus Line
	7500 -5500 7500 -4650
Wire Bus Line
	9650 -5500 9650 -4650
Wire Bus Line
	4650 -5500 4650 -4650
Wire Bus Line
	7400 -5150 7400 -2550
$EndSCHEMATC
