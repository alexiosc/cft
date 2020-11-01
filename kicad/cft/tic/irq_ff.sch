EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 14
Title "Interrupt State Machine"
Date ""
Rev ""
Comp ""
Comment1 "TIC"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 5FBD10C5
P 3650 4250
AR Path="/5F160E7C/5F173948/5FBD10C5" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173948/5FBB5EDB/5FBD10C5" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FC1EA75/5FBD10C5" Ref="#PWR047"  Part="1" 
AR Path="/5F160E7C/5FD4BB81/5FBD10C5" Ref="#PWR053"  Part="1" 
AR Path="/5F160E7C/5FD5B522/5FBD10C5" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD5B536/5FBD10C5" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD6EACB/5FBD10C5" Ref="#PWR059"  Part="1" 
AR Path="/5F160E7C/5FD6EADF/5FBD10C5" Ref="#PWR065"  Part="1" 
AR Path="/5F160E7C/5FD81CE5/5FBD10C5" Ref="#PWR071"  Part="1" 
AR Path="/5F160E7C/5FD81CF9/5FBD10C5" Ref="#PWR077"  Part="1" 
AR Path="/5F160E7C/5FD81D0D/5FBD10C5" Ref="#PWR083"  Part="1" 
AR Path="/5F160E7C/5FD81D21/5FBD10C5" Ref="#PWR089"  Part="1" 
F 0 "#PWR065" H 3650 4100 50  0001 C CNN
F 1 "+5V" V 3665 4378 50  0000 L CNN
F 2 "" H 3650 4250 50  0001 C CNN
F 3 "" H 3650 4250 50  0001 C CNN
	1    3650 4250
	0    -1   -1   0   
$EndComp
NoConn ~ 4600 4250
Text Label 5600 4150 2    50   ~ 0
CLK3
Wire Wire Line
	5000 3950 5000 4050
Text HLabel 2250 3500 0    50   Input ~ 0
IEN
Wire Wire Line
	5000 4050 5600 4050
Text Label 2300 4150 0    50   ~ 0
CLK2
Text HLabel 7800 4250 2    50   Output ~ 0
IRF
Text HLabel 2250 4150 0    50   Input ~ 0
CLK2
Text HLabel 2250 4500 0    50   Input ~ 0
CLK3
Text HLabel 7800 3950 2    50   3State ~ 0
~IRQ
Text Label 2350 3500 0    50   ~ 0
IEN
Wire Wire Line
	3700 4250 3650 4250
Text Label 5600 3950 2    50   ~ 0
IEN
Text Label 5600 4050 2    50   ~ 0
~IRQn-CLK2
$Comp
L power:+5V #PWR?
U 1 1 5FBDC275
P 5550 4250
AR Path="/5F160E7C/5F173948/5FBDC275" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173948/5FBB5EDB/5FBDC275" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FC1EA75/5FBDC275" Ref="#PWR048"  Part="1" 
AR Path="/5F160E7C/5FD4BB81/5FBDC275" Ref="#PWR054"  Part="1" 
AR Path="/5F160E7C/5FD5B522/5FBDC275" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD5B536/5FBDC275" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD6EACB/5FBDC275" Ref="#PWR060"  Part="1" 
AR Path="/5F160E7C/5FD6EADF/5FBDC275" Ref="#PWR066"  Part="1" 
AR Path="/5F160E7C/5FD81CE5/5FBDC275" Ref="#PWR072"  Part="1" 
AR Path="/5F160E7C/5FD81CF9/5FBDC275" Ref="#PWR078"  Part="1" 
AR Path="/5F160E7C/5FD81D0D/5FBDC275" Ref="#PWR084"  Part="1" 
AR Path="/5F160E7C/5FD81D21/5FBDC275" Ref="#PWR090"  Part="1" 
F 0 "#PWR066" H 5550 4100 50  0001 C CNN
F 1 "+5V" V 5565 4378 50  0000 L CNN
F 2 "" H 5550 4250 50  0001 C CNN
F 3 "" H 5550 4250 50  0001 C CNN
	1    5550 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 4250 5550 4250
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5FBD10EF
P 7100 3950
AR Path="/5F160E7C/5F173948/5FBD10EF" Ref="D?"  Part="1" 
AR Path="/5F160E7C/5F173948/5FBB5EDB/5FBD10EF" Ref="D?"  Part="1" 
AR Path="/5F160E7C/5FC1EA75/5FBD10EF" Ref="D3"  Part="1" 
AR Path="/5F160E7C/5FD4BB81/5FBD10EF" Ref="D4"  Part="1" 
AR Path="/5F160E7C/5FD5B522/5FBD10EF" Ref="D?"  Part="1" 
AR Path="/5F160E7C/5FD5B536/5FBD10EF" Ref="D?"  Part="1" 
AR Path="/5F160E7C/5FD6EACB/5FBD10EF" Ref="D5"  Part="1" 
AR Path="/5F160E7C/5FD6EADF/5FBD10EF" Ref="D6"  Part="1" 
AR Path="/5F160E7C/5FD81CE5/5FBD10EF" Ref="D7"  Part="1" 
AR Path="/5F160E7C/5FD81CF9/5FBD10EF" Ref="D8"  Part="1" 
AR Path="/5F160E7C/5FD81D0D/5FBD10EF" Ref="D9"  Part="1" 
AR Path="/5F160E7C/5FD81D21/5FBD10EF" Ref="D10"  Part="1" 
F 0 "D5" H 7100 4166 50  0000 C CNN
F 1 "CUS520" H 7100 4075 50  0000 C CNN
F 2 "alexios:SOD-323" H 7100 3950 50  0001 C CNN
F 3 "~" H 7100 3950 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 7100 3950 50  0001 C CNN "Mouser"
	1    7100 3950
	1    0    0    -1  
$EndComp
Text Label 7750 3950 2    50   ~ 0
~IRQ
Wire Wire Line
	5000 4150 5000 4500
Wire Wire Line
	5000 4150 5600 4150
Wire Wire Line
	2250 4150 3700 4150
Text Label 2300 4500 0    50   ~ 0
CLK3
Wire Wire Line
	2900 4050 3200 4050
Wire Wire Line
	2250 3500 3300 3500
Wire Wire Line
	5100 3500 5100 3950
Wire Wire Line
	5100 3950 5600 3950
Wire Wire Line
	3300 3500 3300 3950
Connection ~ 3300 3500
Wire Wire Line
	3300 3500 5100 3500
Wire Wire Line
	3300 3950 3700 3950
Text Label 3700 3950 2    50   ~ 0
IEN
Text Label 3700 4150 2    50   ~ 0
CLK2
Wire Wire Line
	2250 4500 5000 4500
$Comp
L alexios:74HC74 U?
U 3 1 5FC30665
P 6100 5000
AR Path="/5F160E7C/5F173948/5FC30665" Ref="U?"  Part="3" 
AR Path="/5F160E7C/5FC1EA75/5FC30665" Ref="U16"  Part="3" 
AR Path="/5F160E7C/5FD4BB81/5FC30665" Ref="U18"  Part="3" 
AR Path="/5F160E7C/5FD5B522/5FC30665" Ref="U?"  Part="3" 
AR Path="/5F160E7C/5FD5B536/5FC30665" Ref="U?"  Part="3" 
AR Path="/5F160E7C/5FD6EACB/5FC30665" Ref="U20"  Part="3" 
AR Path="/5F160E7C/5FD6EADF/5FC30665" Ref="U22"  Part="3" 
AR Path="/5F160E7C/5FD81CE5/5FC30665" Ref="U24"  Part="3" 
AR Path="/5F160E7C/5FD81CF9/5FC30665" Ref="U26"  Part="3" 
AR Path="/5F160E7C/5FD81D0D/5FC30665" Ref="U28"  Part="3" 
AR Path="/5F160E7C/5FD81D21/5FC30665" Ref="U30"  Part="3" 
F 0 "U20" H 6280 5046 50  0000 L CNN
F 1 "74HC74" H 6280 4955 50  0000 L CNN
F 2 "alexios:SOIC-14" H 6050 5150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 6050 5150 50  0001 C CNN
	3    6100 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC3066B
P 5750 5000
AR Path="/5F160E7C/5F173948/5FC3066B" Ref="C?"  Part="1" 
AR Path="/5F160E7C/5FC1EA75/5FC3066B" Ref="C18"  Part="1" 
AR Path="/5F160E7C/5FD4BB81/5FC3066B" Ref="C20"  Part="1" 
AR Path="/5F160E7C/5FD5B522/5FC3066B" Ref="C?"  Part="1" 
AR Path="/5F160E7C/5FD5B536/5FC3066B" Ref="C?"  Part="1" 
AR Path="/5F160E7C/5FD6EACB/5FC3066B" Ref="C22"  Part="1" 
AR Path="/5F160E7C/5FD6EADF/5FC3066B" Ref="C24"  Part="1" 
AR Path="/5F160E7C/5FD81CE5/5FC3066B" Ref="C26"  Part="1" 
AR Path="/5F160E7C/5FD81CF9/5FC3066B" Ref="C28"  Part="1" 
AR Path="/5F160E7C/5FD81D0D/5FC3066B" Ref="C30"  Part="1" 
AR Path="/5F160E7C/5FD81D21/5FC3066B" Ref="C32"  Part="1" 
F 0 "C22" H 5658 5046 50  0000 R CNN
F 1 "100n" H 5658 4955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5750 5000 50  0001 C CNN
F 3 "~" H 5750 5000 50  0001 C CNN
	1    5750 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FC30671
P 5750 4900
AR Path="/5F160E7C/5F173948/5FC30671" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FC1EA75/5FC30671" Ref="#PWR051"  Part="1" 
AR Path="/5F160E7C/5FD4BB81/5FC30671" Ref="#PWR057"  Part="1" 
AR Path="/5F160E7C/5FD5B522/5FC30671" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD5B536/5FC30671" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD6EACB/5FC30671" Ref="#PWR063"  Part="1" 
AR Path="/5F160E7C/5FD6EADF/5FC30671" Ref="#PWR069"  Part="1" 
AR Path="/5F160E7C/5FD81CE5/5FC30671" Ref="#PWR075"  Part="1" 
AR Path="/5F160E7C/5FD81CF9/5FC30671" Ref="#PWR081"  Part="1" 
AR Path="/5F160E7C/5FD81D0D/5FC30671" Ref="#PWR087"  Part="1" 
AR Path="/5F160E7C/5FD81D21/5FC30671" Ref="#PWR093"  Part="1" 
F 0 "#PWR069" H 5750 4750 50  0001 C CNN
F 1 "+5V" H 5765 5073 50  0000 C CNN
F 2 "" H 5750 4900 50  0001 C CNN
F 3 "" H 5750 4900 50  0001 C CNN
	1    5750 4900
	1    0    0    -1  
$EndComp
Connection ~ 5750 4900
$Comp
L power:GND #PWR?
U 1 1 5FC30678
P 5750 5100
AR Path="/5F160E7C/5F173948/5FC30678" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FC1EA75/5FC30678" Ref="#PWR052"  Part="1" 
AR Path="/5F160E7C/5FD4BB81/5FC30678" Ref="#PWR058"  Part="1" 
AR Path="/5F160E7C/5FD5B522/5FC30678" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD5B536/5FC30678" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD6EACB/5FC30678" Ref="#PWR064"  Part="1" 
AR Path="/5F160E7C/5FD6EADF/5FC30678" Ref="#PWR070"  Part="1" 
AR Path="/5F160E7C/5FD81CE5/5FC30678" Ref="#PWR076"  Part="1" 
AR Path="/5F160E7C/5FD81CF9/5FC30678" Ref="#PWR082"  Part="1" 
AR Path="/5F160E7C/5FD81D0D/5FC30678" Ref="#PWR088"  Part="1" 
AR Path="/5F160E7C/5FD81D21/5FC30678" Ref="#PWR094"  Part="1" 
F 0 "#PWR070" H 5750 4850 50  0001 C CNN
F 1 "GND" H 5755 4927 50  0000 C CNN
F 2 "" H 5750 5100 50  0001 C CNN
F 3 "" H 5750 5100 50  0001 C CNN
	1    5750 5100
	1    0    0    -1  
$EndComp
Connection ~ 5750 5100
Text HLabel 2250 4050 0    50   Input ~ 0
~IRQn
Text Label 3700 4050 2    50   ~ 0
~IRQni
Wire Notes Line width 12 style solid
	3150 1400 3250 1400
Wire Notes Line width 12 style solid
	3250 1400 3250 1500
Wire Notes Line width 12 style solid
	3250 1500 3500 1500
Wire Notes Line width 12 style solid
	3500 1500 3500 1400
Wire Notes Line width 12 style solid
	4250 1400 4250 1500
Wire Notes Line width 12 style solid
	4250 1500 4500 1500
Wire Notes Line width 12 style solid
	4500 1500 4500 1400
Wire Notes Line width 12 style solid
	3500 1400 4250 1400
Wire Notes Line width 12 style solid
	3150 1550 3500 1550
Wire Notes Line width 12 style solid
	3500 1550 3500 1650
Wire Notes Line width 12 style solid
	3500 1650 3750 1650
Wire Notes Line width 12 style solid
	3750 1650 3750 1550
Wire Notes Line width 12 style solid
	4500 1550 4500 1650
Wire Notes Line width 12 style solid
	4500 1650 4750 1650
Wire Notes Line width 12 style solid
	4750 1650 4750 1550
Wire Notes Line width 12 style solid
	3750 1550 4500 1550
Text Notes 3050 1500 2    50   ~ 0
CLK2
Text Notes 3050 1650 2    50   ~ 0
CLK3
Text Notes 3050 2000 2    50   ~ 0
~IRQn
Wire Notes Line width 12 style solid
	3250 1900 3300 2000
Wire Notes Line width 12 style solid
	3150 1900 3400 1900
Wire Notes Line width 12 style solid
	3300 2000 3700 2000
Text Notes 3050 1800 2    50   ~ 0
IEN
Wire Notes Line width 12 style solid
	4050 1900 4100 2000
Wire Notes Line width 12 style solid
	4400 1900 4450 2000
Wire Notes Line width 12 style solid
	3750 1900 4400 1900
Wire Notes Line width 12 style solid
	3700 2000 3750 1900
Wire Notes Line width 12 style solid
	3550 1800 3600 1700
Wire Notes Line width 12 style solid
	4400 1800 4450 1700
Wire Notes Line width 12 style solid
	3600 1700 5150 1700
Wire Notes Line width 12 style solid
	3150 1800 4400 1800
Text Notes 3050 2200 2    50   ~ 0
~IRQn-CLK2~
Wire Notes Line
	4500 1400 4500 2450
Wire Notes Line width 12 style solid
	4550 2200 5200 2200
Wire Notes Line width 12 style solid
	3150 2100 4500 2100
Wire Notes Line width 12 style solid
	4500 2100 4550 2200
Text Notes 3350 2650 0    50   ~ 0
Interrupt\nmasked
Text Notes 4550 2650 2    50   ~ 0
Interrupt\nregistered
Wire Notes Line width 24 style solid
	2500 1000 5850 1000
Wire Notes Line width 24 style solid
	5850 1000 5850 2800
Wire Notes Line width 24 style solid
	5850 2800 2500 2800
Wire Notes Line width 24 style solid
	2500 2800 2500 1000
Text Notes 3050 2400 2    50   ~ 0
~IRQ
Wire Notes Line width 12 style solid
	4800 2400 5200 2400
Wire Notes Line width 12 style solid
	3150 2300 4750 2300
Wire Notes Line width 12 style solid
	4750 2300 4800 2400
Wire Notes Line
	4750 1600 4750 2450
Text Notes 4700 2650 0    50   ~ 0
~IRQ~\nasserted
Wire Notes Line width 12 style solid
	5200 1800 5150 1700
Wire Notes Line width 12 style solid
	5650 1800 5200 1800
Wire Notes Line width 12 style solid
	5650 1900 5250 1900
Wire Notes Line width 12 style solid
	5250 1900 5200 2000
Wire Notes Line width 12 style solid
	4100 2000 5200 2000
Wire Notes Line
	5200 1800 5200 2450
Wire Notes Line width 12 style solid
	5650 2300 5250 2300
Wire Notes Line width 12 style solid
	5250 2300 5200 2400
Wire Notes Line width 12 style solid
	5650 2100 5250 2100
Wire Notes Line width 12 style solid
	5250 2100 5200 2200
Text Notes 5150 2650 0    50   ~ 0
Interrupt\ndisabled again
Text Notes 3350 1200 0    63   ~ 13
Interrupt State Machine Waveforms
Text Notes 6150 2750 0    63   ~ 0
IEN is the interrupt enable signal. It is low on reset, so\ninterrupts are disabled on power-on. It is set low to disable an\ninterrupt. It is set high to enable an interrupt. Clearing a\nserviced interrupt is performed by a high-low-high transition of IEN.\n\nWhile IEN is low, the '74 FFs' ~SET~ input is asserted, and both FFs\noutput a high Q, and thus a deasserted (low) interrupt flag IRF\nand deasserted (high) ~IRQ~.\n\nWhen IEN is high, a low ~IRQn~ level crossing the CLK2 positive edge\nwill be output to the processor on the next positive edge of CLK3.\nIFR, which is active high, is driven by the FF's ~Q~ output to invert the\nsemnatics.\n\nCLK2 and CLK3 are in the same clock domain and the two FFs work to\ncross the interrupt signal into the processor's clock domain and\navoid metastability.
Wire Notes Line width 12 style solid
	3600 1800 3650 1700
Wire Notes Line width 12 style solid
	3650 1800 3700 1700
Wire Notes Line width 12 style solid
	3700 1800 3750 1700
Wire Notes Line width 12 style solid
	3750 1800 3800 1700
Wire Notes Line width 12 style solid
	3800 1800 3850 1700
Wire Notes Line width 12 style solid
	3850 1800 3900 1700
Wire Notes Line width 12 style solid
	3900 1800 3950 1700
Wire Notes Line width 12 style solid
	3950 1800 4000 1700
Wire Notes Line width 12 style solid
	4000 1800 4050 1700
Wire Notes Line width 12 style solid
	4050 1800 4100 1700
Wire Notes Line width 12 style solid
	4100 1800 4150 1700
Wire Notes Line width 12 style solid
	4150 1800 4200 1700
Wire Notes Line width 12 style solid
	4200 1800 4250 1700
Wire Notes Line width 12 style solid
	4250 1800 4300 1700
Wire Notes Line width 12 style solid
	4300 1800 4350 1700
Wire Notes Line width 12 style solid
	4350 1800 4400 1700
Wire Notes Line width 12 style solid
	3300 1900 3350 2000
Wire Notes Line width 12 style solid
	3350 1900 3400 2000
Wire Notes Line width 12 style solid
	3400 1900 3450 2000
Wire Notes Line width 12 style solid
	4100 1900 4150 2000
Wire Notes Line width 12 style solid
	4150 1900 4200 2000
Wire Notes Line width 12 style solid
	4200 1900 4250 2000
Wire Notes Line width 12 style solid
	4250 1900 4300 2000
Wire Notes Line width 12 style solid
	4300 1900 4350 2000
Wire Notes Line width 12 style solid
	4350 1900 4400 2000
Wire Notes Line
	3500 1500 3500 2450
Wire Notes Line width 12 style solid
	5500 1550 5500 1650
Wire Notes Line width 12 style solid
	5500 1650 5650 1650
Wire Notes Line width 12 style solid
	4750 1550 5500 1550
Wire Notes Line width 12 style solid
	5250 1400 5250 1500
Wire Notes Line width 12 style solid
	5250 1500 5500 1500
Wire Notes Line width 12 style solid
	5500 1500 5500 1400
Wire Notes Line width 12 style solid
	4500 1400 5250 1400
Wire Notes Line width 12 style solid
	5500 1400 5650 1400
Text Label 6550 4250 0    50   ~ 0
IRF
Text Label 7700 4250 2    50   ~ 0
IRF
Text Label 6550 3950 0    50   ~ 0
~IRQTP
Wire Wire Line
	4600 3950 5000 3950
$Comp
L alexios:74HC74 U?
U 1 1 5FBD10B7
P 4150 4100
AR Path="/5F160E7C/5F173948/5FBD10B7" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F173948/5FBB5EDB/5FBD10B7" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5FC1EA75/5FBD10B7" Ref="U16"  Part="1" 
AR Path="/5F160E7C/5FD4BB81/5FBD10B7" Ref="U18"  Part="1" 
AR Path="/5F160E7C/5FD5B522/5FBD10B7" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5FD5B536/5FBD10B7" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5FD6EACB/5FBD10B7" Ref="U20"  Part="1" 
AR Path="/5F160E7C/5FD6EADF/5FBD10B7" Ref="U22"  Part="1" 
AR Path="/5F160E7C/5FD81CE5/5FBD10B7" Ref="U24"  Part="1" 
AR Path="/5F160E7C/5FD81CF9/5FBD10B7" Ref="U26"  Part="1" 
AR Path="/5F160E7C/5FD81D0D/5FBD10B7" Ref="U28"  Part="1" 
AR Path="/5F160E7C/5FD81D21/5FBD10B7" Ref="U30"  Part="1" 
F 0 "U20" H 4150 4517 50  0000 C CNN
F 1 "74HC74" H 4150 4426 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4100 4250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 4100 4250 50  0001 C CNN
	1    4150 4100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 5FBD10BD
P 6050 4100
AR Path="/5F160E7C/5F173948/5FBD10BD" Ref="U?"  Part="2" 
AR Path="/5F160E7C/5F173948/5FBB5EDB/5FBD10BD" Ref="U?"  Part="2" 
AR Path="/5F160E7C/5FC1EA75/5FBD10BD" Ref="U16"  Part="2" 
AR Path="/5F160E7C/5FD4BB81/5FBD10BD" Ref="U18"  Part="2" 
AR Path="/5F160E7C/5FD5B522/5FBD10BD" Ref="U?"  Part="2" 
AR Path="/5F160E7C/5FD5B536/5FBD10BD" Ref="U?"  Part="2" 
AR Path="/5F160E7C/5FD6EACB/5FBD10BD" Ref="U20"  Part="2" 
AR Path="/5F160E7C/5FD6EADF/5FBD10BD" Ref="U22"  Part="2" 
AR Path="/5F160E7C/5FD81CE5/5FBD10BD" Ref="U24"  Part="2" 
AR Path="/5F160E7C/5FD81CF9/5FBD10BD" Ref="U26"  Part="2" 
AR Path="/5F160E7C/5FD81D0D/5FBD10BD" Ref="U28"  Part="2" 
AR Path="/5F160E7C/5FD81D21/5FBD10BD" Ref="U30"  Part="2" 
F 0 "U20" H 6050 4517 50  0000 C CNN
F 1 "74HC74" H 6050 4426 50  0000 C CNN
F 2 "alexios:SOIC-14" H 6000 4250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 6000 4250 50  0001 C CNN
	2    6050 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3950 6950 3950
Wire Wire Line
	7250 3950 7800 3950
Wire Wire Line
	6500 4250 7800 4250
Wire Wire Line
	2250 4050 2700 4050
$Comp
L Device:R_Small R?
U 1 1 5FA3A557
P 2800 4050
AR Path="/5F160E7C/5FA3A557" Ref="R?"  Part="1" 
AR Path="/5F160E7C/5FC1EA75/5FA3A557" Ref="R9"  Part="1" 
AR Path="/5F160E7C/5FD4BB81/5FA3A557" Ref="R10"  Part="1" 
AR Path="/5F160E7C/5FD6EACB/5FA3A557" Ref="R11"  Part="1" 
AR Path="/5F160E7C/5FD6EADF/5FA3A557" Ref="R12"  Part="1" 
AR Path="/5F160E7C/5FD81CE5/5FA3A557" Ref="R13"  Part="1" 
AR Path="/5F160E7C/5FD81CF9/5FA3A557" Ref="R14"  Part="1" 
AR Path="/5F160E7C/5FD81D0D/5FA3A557" Ref="R15"  Part="1" 
AR Path="/5F160E7C/5FD81D21/5FA3A557" Ref="R16"  Part="1" 
F 0 "R11" V 2604 4050 50  0000 C CNN
F 1 "100Ω" V 2695 4050 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2800 4050 50  0001 C CNN
F 3 "~" H 2800 4050 50  0001 C CNN
	1    2800 4050
	0    1    1    0   
$EndComp
Text HLabel 2250 3750 0    50   Input ~ 0
~IRQni
Wire Wire Line
	2250 3750 3200 3750
Wire Wire Line
	3200 3750 3200 4050
Connection ~ 3200 4050
Wire Wire Line
	3200 4050 3700 4050
Text Notes 1500 3100 0    50   ~ 0
For board-local interrupts\n(past series resistor)
Wire Notes Line
	1650 3150 2050 3650
$EndSCHEMATC
