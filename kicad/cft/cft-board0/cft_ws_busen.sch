EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 17
Title "Data Bus & Wait States"
Date ""
Rev "2023"
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 12950 1600 0    50   ~ 0
~WEN~\n\n X\n 1\n 1\n 0\n 0
Wire Notes Line width 20 style solid
	12625 975  14150 975 
Wire Notes Line style solid
	12625 1150 14150 1150
Wire Notes Line width 20 style solid
	14150 1650 14150 975 
Wire Notes Line width 20 style solid
	12625 1650 12625 975 
Wire Notes Line width 20 style solid
	12625 1650 14150 1650
Wire Notes Line
	13900 975  13900 1650
Text Notes 12700 1600 0    50   ~ 0
~HALT~\n\n 0\n 1\n 1\n 1\n 1
$Comp
L Device:C_Small C?
U 1 1 5E214C06
P 10050 4200
AR Path="/5CC0D65F/5E214C06" Ref="C?"  Part="1" 
AR Path="/5E214C06" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/5E214C06" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E214C06" Ref="C909"  Part="1" 
F 0 "C909" H 9959 4246 50  0000 R CNN
F 1 "100nF" H 9959 4155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10050 4200 50  0001 C CNN
F 3 "~" H 10050 4200 50  0001 C CNN
	1    10050 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0919
U 1 1 5E214C0C
P 10050 4300
F 0 "#PWR0919" H 10050 4050 50  0001 C CNN
F 1 "GND" H 10055 4127 50  0000 C CNN
F 2 "" H 10050 4300 50  0001 C CNN
F 3 "" H 10050 4300 50  0001 C CNN
	1    10050 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0918
U 1 1 5E214C13
P 10050 5900
F 0 "#PWR0918" H 10050 5650 50  0001 C CNN
F 1 "GND" H 10055 5727 50  0000 C CNN
F 2 "" H 10050 5900 50  0001 C CNN
F 3 "" H 10050 5900 50  0001 C CNN
	1    10050 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0914
U 1 1 5E214C1A
P 10050 5700
F 0 "#PWR0914" H 10050 5550 50  0001 C CNN
F 1 "+5V" H 10065 5873 50  0000 C CNN
F 2 "" H 10050 5700 50  0001 C CNN
F 3 "" H 10050 5700 50  0001 C CNN
	1    10050 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0915
U 1 1 5E214C21
P 10050 4100
F 0 "#PWR0915" H 10050 3950 50  0001 C CNN
F 1 "+5V" H 10065 4273 50  0000 C CNN
F 2 "" H 10050 4100 50  0001 C CNN
F 3 "" H 10050 4100 50  0001 C CNN
	1    10050 4100
	1    0    0    -1  
$EndComp
Text Notes 13500 1600 0    50   ~ 0
~WAITING~\n\n  X\n  X\n  1\n  1\n  1
$Comp
L Device:C_Small C?
U 1 1 5E7D5FA4
P 10050 5800
AR Path="/5CC0D65F/5E7D5FA4" Ref="C?"  Part="1" 
AR Path="/5E7D5FA4" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/5E7D5FA4" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E7D5FA4" Ref="C910"  Part="1" 
F 0 "C910" H 9959 5846 50  0000 R CNN
F 1 "100nF" H 9959 5755 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10050 5800 50  0001 C CNN
F 3 "~" H 10050 5800 50  0001 C CNN
	1    10050 5800
	1    0    0    -1  
$EndComp
Wire Notes Line
	14150 4350 14150 5300
Wire Notes Line width 20 style solid
	12375 5300 14825 5300
Wire Notes Line width 20 style solid
	12375 5300 12375 4350
Wire Notes Line width 20 style solid
	14825 5300 14825 4350
Wire Notes Line style solid
	12775 4000 14825 4000
Wire Notes Line width 20 style solid
	12775 3875 14825 3875
Text Notes 14225 4900 0    50   ~ 0
~DBDIR~\n\n   \n  \n\n  0\n  0\n\n  1\n  1
Text Notes 13300 4900 0    50   ~ 0
~WAITING~\n\n   X\n   1\n\n   X\n   X\n\n   X\n   X
Text Label 7900 4800 0    50   ~ 0
~DBEN
Text Label 9650 4950 1    50   ~ 0
DB[0..15]
Text Label 7750 5350 1    50   ~ 0
IBUS[0..15]
Entry Wire Line
	7750 5400 7850 5300
Entry Wire Line
	7750 5500 7850 5400
Entry Wire Line
	7750 5600 7850 5500
Entry Wire Line
	7750 5700 7850 5600
Entry Wire Line
	7750 5800 7850 5700
Entry Wire Line
	7750 5900 7850 5800
Entry Wire Line
	7750 6000 7850 5900
Entry Wire Line
	7750 6100 7850 6000
Entry Wire Line
	7750 3900 7850 3800
Entry Wire Line
	7750 4000 7850 3900
Entry Wire Line
	7750 4100 7850 4000
Entry Wire Line
	7750 4200 7850 4100
Entry Wire Line
	7750 4300 7850 4200
Entry Wire Line
	7750 4400 7850 4300
Entry Wire Line
	7750 4500 7850 4400
Entry Wire Line
	7750 4600 7850 4500
Text Label 9250 6000 0    50   ~ 0
DB15
Text Label 9250 5900 0    50   ~ 0
DB14
Text Label 9250 5800 0    50   ~ 0
DB13
Text Label 9250 5700 0    50   ~ 0
DB12
Text Label 9250 5600 0    50   ~ 0
DB11
Text Label 9250 5500 0    50   ~ 0
DB10
Text Label 9250 5400 0    50   ~ 0
DB9
Text Label 9250 5300 0    50   ~ 0
DB8
Wire Wire Line
	9200 6000 9550 6000
Wire Wire Line
	9200 5900 9550 5900
Wire Wire Line
	9200 5800 9550 5800
Wire Wire Line
	9200 5700 9550 5700
Wire Wire Line
	9200 5600 9550 5600
Wire Wire Line
	9200 5500 9550 5500
Wire Wire Line
	9200 5400 9550 5400
Wire Wire Line
	9200 5300 9550 5300
Text Label 7950 6000 0    50   ~ 0
IBUS15
Text Label 7950 5900 0    50   ~ 0
IBUS14
Text Label 7950 5800 0    50   ~ 0
IBUS13
Text Label 7950 5700 0    50   ~ 0
IBUS12
Text Label 7950 5600 0    50   ~ 0
IBUS11
Text Label 7950 5500 0    50   ~ 0
IBUS10
Text Label 7950 5400 0    50   ~ 0
IBUS9
Text Label 7950 5300 0    50   ~ 0
IBUS8
Text Label 7900 4500 0    50   ~ 0
IBUS7
Text Label 7900 4400 0    50   ~ 0
IBUS6
Text Label 7900 4300 0    50   ~ 0
IBUS5
Text Label 7900 4200 0    50   ~ 0
IBUS4
Text Label 7900 4100 0    50   ~ 0
IBUS3
Text Label 7900 4000 0    50   ~ 0
IBUS2
Text Label 7900 3900 0    50   ~ 0
IBUS1
Text Label 7900 3800 0    50   ~ 0
IBUS0
Wire Wire Line
	8200 6000 7850 6000
Wire Wire Line
	8200 5900 7850 5900
Wire Wire Line
	8200 5800 7850 5800
Wire Wire Line
	8200 5700 7850 5700
Wire Wire Line
	8200 5600 7850 5600
Wire Wire Line
	8200 5500 7850 5500
Wire Wire Line
	8200 5400 7850 5400
Wire Wire Line
	8200 5300 7850 5300
Wire Wire Line
	8200 4500 7850 4500
Wire Wire Line
	8200 4400 7850 4400
Wire Wire Line
	8200 4300 7850 4300
Wire Wire Line
	8200 4200 7850 4200
Wire Wire Line
	8200 4100 7850 4100
Wire Wire Line
	8200 4000 7850 4000
Wire Wire Line
	8200 3900 7850 3900
Wire Wire Line
	8200 3800 7850 3800
Wire Bus Line
	9750 3450 10700 3450
Entry Bus Bus
	9650 3550 9750 3450
Text Label 10000 3450 0    50   ~ 0
DB[0..15]
Text HLabel 10700 3450 2    50   3State ~ 0
DB[0..15]
Entry Bus Bus
	7650 6450 7750 6350
Text Label 1350 6450 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	7900 6200 8200 6200
Wire Wire Line
	7900 4700 8200 4700
Wire Wire Line
	7900 6300 8200 6300
Wire Wire Line
	7900 4800 8200 4800
Entry Wire Line
	9650 3700 9550 3800
Entry Wire Line
	9650 3800 9550 3900
Entry Wire Line
	9650 3900 9550 4000
Entry Wire Line
	9650 4000 9550 4100
Entry Wire Line
	9650 4100 9550 4200
Entry Wire Line
	9650 4200 9550 4300
Entry Wire Line
	9650 4300 9550 4400
Entry Wire Line
	9650 4400 9550 4500
Entry Wire Line
	9650 5200 9550 5300
Entry Wire Line
	9650 5300 9550 5400
Entry Wire Line
	9650 5400 9550 5500
Entry Wire Line
	9650 5500 9550 5600
Entry Wire Line
	9650 5600 9550 5700
Entry Wire Line
	9650 5700 9550 5800
Entry Wire Line
	9650 5800 9550 5900
Entry Wire Line
	9650 5900 9550 6000
Text Notes 10350 12300 0    100  ~ 20
Data Bus Transceiver
Text Notes 13200 1600 0    50   ~ 0
~WSTB~\n\n  X\n  X\n  X\n  1\n  0
Wire Notes Line width 20 style solid
	12800 7000 17500 7000
Wire Notes Line width 20 style solid
	12800 7000 12800 6000
Wire Notes Line width 20 style solid
	17500 7000 17500 6000
Wire Notes Line width 20 style solid
	12800 6000 17500 6000
Text HLabel 6950 4800 2    50   Output ~ 0
~WAITING
Text Notes 8200 6600 0    50   ~ 10
NOTE: HCT or ACT family!
$Comp
L alexios:74ACT245 U909
U 1 1 5F15FE07
P 8700 4300
F 0 "U909" H 8700 5067 50  0000 C CNN
F 1 "74ACT245" H 8700 4976 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8700 4350 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act245.pdf" H 8700 4350 50  0001 C CNN
	1    8700 4300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74ACT245 U910
U 1 1 5F1617BB
P 8700 5800
F 0 "U910" H 8700 6567 50  0000 C CNN
F 1 "74ACT245" H 8700 6476 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8700 5850 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act245.pdf" H 8700 5850 50  0001 C CNN
	1    8700 5800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74ACT245 U909
U 2 1 5F16217F
P 10400 4600
F 0 "U909" H 10580 5046 50  0000 L CNN
F 1 "74ACT245" H 10580 4955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10400 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 10400 4650 50  0001 C CNN
	2    10400 4600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74ACT245 U910
U 2 1 5F162E45
P 10400 6200
F 0 "U910" H 10580 6646 50  0000 L CNN
F 1 "74ACT245" H 10580 6555 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10400 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 10400 6250 50  0001 C CNN
	2    10400 6200
	1    0    0    -1  
$EndComp
Connection ~ 10050 4300
Connection ~ 10050 4100
Connection ~ 10050 5900
Connection ~ 10050 5700
Text Notes 14000 1600 0    50   ~ 0
~W~\n\nZ\n0\n1\n1\n0
Text Notes 16100 2550 0    50   ~ 0
CLK2
Text Notes 16100 3000 0    50   ~ 0
~WSTB
Wire Notes Line width 12 style solid
	16450 2450 16500 2450
Wire Notes Line width 12 style solid
	16500 2450 16500 2550
Wire Notes Line width 12 style solid
	16600 2450 16900 2450
Wire Notes Line width 12 style solid
	16600 2550 16600 2450
Wire Notes Line width 12 style solid
	16500 2550 16600 2550
Wire Notes Line width 12 style solid
	17000 2550 17000 2450
Wire Notes Line width 12 style solid
	16900 2550 17000 2550
Wire Notes Line width 12 style solid
	16900 2550 16900 2450
Wire Notes Line width 12 style solid
	16450 2900 16700 2900
Wire Notes Line width 12 style solid
	16700 2900 16720 3000
Wire Notes Line width 12 style solid
	16900 3000 16920 2900
Wire Notes Line width 12 style solid
	16720 3000 16900 3000
Wire Notes Line width 20 style solid
	16000 2350 17750 2350
Wire Notes Line width 20 style solid
	16000 3250 16000 2350
Wire Notes Line width 20 style solid
	17750 3250 16000 3250
Wire Notes Line width 20 style solid
	17750 2350 17750 3250
Wire Notes Line width 12 style solid
	17000 2450 17300 2450
Wire Notes Line width 12 style solid
	17400 2550 17400 2450
Wire Notes Line width 12 style solid
	17300 2550 17400 2550
Wire Notes Line width 12 style solid
	17300 2550 17300 2450
Wire Notes Line width 12 style solid
	17400 2450 17650 2450
Wire Notes Line width 20 style solid
	16000 3650 17750 3650
Wire Notes Line width 20 style solid
	16000 5050 16000 3650
Wire Notes Line width 20 style solid
	17750 5050 16000 5050
Text Notes 16100 3150 0    50   ~ 0
~W\n
Text Notes 16100 2850 0    50   ~ 0
~WEN
Wire Notes Line width 12 style solid
	16450 2750 16650 2750
Wire Notes Line width 12 style solid
	16650 2750 16670 2850
Wire Notes Line width 12 style solid
	16600 2750 16620 2850
Wire Notes Line width 12 style solid
	17020 2750 17000 2850
Wire Notes Line width 12 style solid
	17070 2750 17050 2850
Wire Notes Line width 12 style solid
	16620 2850 17050 2850
Wire Notes Line width 12 style solid
	17020 2750 17650 2750
Text Notes 16050 2250 0    100  ~ 20
Write; No Wait State
Text Notes 16050 3550 0    100  ~ 20
Write; One Wait State
Text Notes 16100 2700 0    50   ~ 0
CLK4
Wire Notes Line width 12 style solid
	16450 2600 16700 2600
Wire Notes Line width 12 style solid
	16700 2600 16700 2700
Wire Notes Line width 12 style solid
	16800 2600 17100 2600
Wire Notes Line width 12 style solid
	16800 2700 16800 2600
Wire Notes Line width 12 style solid
	16700 2700 16800 2700
Wire Notes Line width 12 style solid
	17200 2700 17200 2600
Wire Notes Line width 12 style solid
	17100 2700 17200 2700
Wire Notes Line width 12 style solid
	17100 2700 17100 2600
Wire Notes Line width 12 style solid
	17200 2600 17500 2600
Wire Notes Line width 12 style solid
	17600 2700 17600 2600
Wire Notes Line width 12 style solid
	17500 2700 17600 2700
Wire Notes Line width 12 style solid
	17500 2700 17500 2600
Wire Notes Line width 12 style solid
	17600 2600 17650 2600
Wire Notes Line width 12 style solid
	16920 2900 17650 2900
Wire Notes Line width 12 style solid
	16450 3050 16700 3050
Wire Notes Line width 12 style solid
	16700 3050 16720 3150
Wire Notes Line width 12 style solid
	16900 3150 16920 3050
Wire Notes Line width 12 style solid
	16720 3150 16900 3150
Wire Notes Line width 12 style solid
	16920 3050 17650 3050
Text Notes 16100 4000 0    50   ~ 0
CLK2
Text Notes 16100 4450 0    50   ~ 0
~WSTB
Wire Notes Line width 12 style solid
	16450 3900 16500 3900
Wire Notes Line width 12 style solid
	16500 3900 16500 4000
Wire Notes Line width 12 style solid
	16600 3900 16900 3900
Wire Notes Line width 12 style solid
	16600 4000 16600 3900
Wire Notes Line width 12 style solid
	16500 4000 16600 4000
Wire Notes Line width 12 style solid
	17000 4000 17000 3900
Wire Notes Line width 12 style solid
	16900 4000 17000 4000
Wire Notes Line width 12 style solid
	16900 4000 16900 3900
Wire Notes Line width 12 style solid
	16450 4350 16700 4350
Wire Notes Line width 12 style solid
	16700 4350 16720 4450
Wire Notes Line width 12 style solid
	16900 4450 16920 4350
Wire Notes Line width 12 style solid
	16720 4450 16900 4450
Wire Notes Line width 12 style solid
	17000 3900 17300 3900
Wire Notes Line width 12 style solid
	17400 4000 17400 3900
Wire Notes Line width 12 style solid
	17300 4000 17400 4000
Wire Notes Line width 12 style solid
	17300 4000 17300 3900
Wire Notes Line width 12 style solid
	17400 3900 17650 3900
Text Notes 16100 4900 0    50   ~ 0
~W\n
Text Notes 16100 4300 0    50   ~ 0
~WEN
Wire Notes Line width 12 style solid
	16450 4200 16650 4200
Wire Notes Line width 12 style solid
	16650 4200 16670 4300
Wire Notes Line width 12 style solid
	16600 4200 16620 4300
Wire Notes Line width 12 style solid
	17020 4200 17000 4300
Wire Notes Line width 12 style solid
	17070 4200 17050 4300
Wire Notes Line width 12 style solid
	16620 4300 17050 4300
Wire Notes Line width 12 style solid
	17020 4200 17650 4200
Text Notes 16100 4150 0    50   ~ 0
CLK4
Wire Notes Line width 12 style solid
	16450 4050 16700 4050
Wire Notes Line width 12 style solid
	16700 4050 16700 4150
Wire Notes Line width 12 style solid
	16800 4050 17100 4050
Wire Notes Line width 12 style solid
	16800 4150 16800 4050
Wire Notes Line width 12 style solid
	16700 4150 16800 4150
Wire Notes Line width 12 style solid
	17200 4150 17200 4050
Wire Notes Line width 12 style solid
	17100 4150 17200 4150
Wire Notes Line width 12 style solid
	17100 4150 17100 4050
Wire Notes Line width 12 style solid
	17200 4050 17500 4050
Wire Notes Line width 12 style solid
	17600 4150 17600 4050
Wire Notes Line width 12 style solid
	17500 4150 17600 4150
Wire Notes Line width 12 style solid
	17500 4150 17500 4050
Wire Notes Line width 12 style solid
	17600 4050 17650 4050
Wire Notes Line width 12 style solid
	16920 4350 17650 4350
Wire Notes Line width 12 style solid
	16450 4800 16700 4800
Wire Notes Line width 12 style solid
	16700 4800 16720 4900
Wire Notes Line width 12 style solid
	17300 4900 17320 4800
Wire Notes Line width 12 style solid
	16720 4900 17300 4900
Wire Notes Line width 12 style solid
	17320 4800 17650 4800
Text Notes 16100 4750 0    50   ~ 0
~WAITING
Wire Notes Line width 12 style solid
	16450 4650 16900 4650
Text Notes 16100 3850 0    50   ~ 0
CLK1
Wire Notes Line width 12 style solid
	16500 3750 16800 3750
Wire Notes Line width 12 style solid
	16900 3850 16900 3750
Wire Notes Line width 12 style solid
	16800 3850 16900 3850
Wire Notes Line width 12 style solid
	16800 3850 16800 3750
Wire Notes Line width 12 style solid
	16900 3750 17200 3750
Wire Notes Line width 12 style solid
	17300 3850 17300 3750
Wire Notes Line width 12 style solid
	17200 3850 17300 3850
Wire Notes Line width 12 style solid
	17200 3850 17200 3750
Wire Notes Line width 12 style solid
	17300 3750 17650 3750
Wire Notes Line width 12 style solid
	16500 3850 16500 3750
Wire Notes Line width 12 style solid
	16450 3850 16500 3850
Text Notes 16100 4600 0    50   ~ 0
~WS\n
Wire Notes Line width 12 style solid
	16450 4500 16550 4500
Wire Notes Line width 12 style solid
	16550 4500 16570 4600
Wire Notes Line width 12 style solid
	16920 4500 17650 4500
Wire Notes Line width 12 style solid
	16500 4500 16520 4600
Wire Notes Line width 12 style solid
	16950 4600 16970 4500
Wire Notes Line width 12 style solid
	16900 4600 16920 4500
Wire Notes Line width 12 style solid
	16520 4600 17150 4600
Wire Notes Line width 12 style solid
	17050 4600 17070 4500
Wire Notes Line width 12 style solid
	17000 4600 17020 4500
Wire Notes Line width 12 style solid
	17150 4600 17170 4500
Wire Notes Line width 12 style solid
	17100 4600 17120 4500
Wire Notes Line width 12 style solid
	16900 4650 16920 4750
Wire Notes Line width 12 style solid
	17300 4750 17320 4650
Wire Notes Line width 12 style solid
	17320 4650 17650 4650
Wire Notes Line width 12 style solid
	16920 4750 17300 4750
Wire Notes Line width 20 style solid
	17750 5050 17750 3650
Wire Notes Line
	17320 4660 17320 4650
Wire Notes Line rgb(55, 161, 121)
	17300 4010 17300 4910
Wire Notes Line rgb(55, 161, 121)
	17200 3850 17200 4500
Wire Notes Line rgb(55, 161, 121)
	16700 4150 16700 4790
Wire Notes Line rgb(55, 161, 121)
	16900 4000 16900 4450
Wire Notes Line rgb(55, 161, 121)
	16900 2550 16900 3150
Wire Notes Line rgb(55, 161, 121)
	16700 2700 16700 3060
Text Notes 12900 7200 0    50   ~ 0
Wait States must be asserted:\n\n    • As early as possible during T3 or T4.\n    • At the latest one flip-flop setup time before CLK3 goes high.\n    • Remain low at least one hold time after CLK3 goes high.\n\nExecution of the current microinstruction will then be protracted by a whole number of processor cycles, ending on\nthe cycle where ~WS~ was not asserted on the rising edge of CLK3. To generate wait states for slow devices,\nassert ~WS~ asynchronously when the device is addressed, and clear it synchronously when CLK4 go high *after* the\ndevice has finished its work. For a single wait state, ~WS~ may be cleared as soon as ~WAITING~ goes low.\n\n\n\n\n
Text Notes 13100 4900 0    50   ~ 0
~IO~\n\nX\n1\n\nX\n0\n\nX\n0
Text Notes 14850 1550 0    50   ~ 0
Using 0Ω  0805 shunts as a\ncombination testpoint, jumper\nand pads for impedance-\nmatching resistors.
Text Notes 14850 1150 0    63   ~ 13
0Ω Shunts
Wire Notes Line width 20 style solid
	14750 1650 14750 950 
Wire Notes Line width 20 style solid
	14750 950  16100 950 
Wire Notes Line width 20 style solid
	16100 950  16100 1650
Wire Notes Line width 20 style solid
	16100 1650 14750 1650
Text Label 9250 4500 0    50   ~ 0
DB7
Text Label 9250 4400 0    50   ~ 0
DB6
Text Label 9250 4300 0    50   ~ 0
DB5
Text Label 9250 4200 0    50   ~ 0
DB4
Text Label 9250 4100 0    50   ~ 0
DB3
Text Label 9250 4000 0    50   ~ 0
DB2
Text Label 9250 3900 0    50   ~ 0
DB1
Text Label 9250 3800 0    50   ~ 0
DB0
Wire Wire Line
	9200 4500 9550 4500
Wire Wire Line
	9200 4400 9550 4400
Wire Wire Line
	9200 4300 9550 4300
Wire Wire Line
	9200 4200 9550 4200
Wire Wire Line
	9200 4100 9550 4100
Wire Wire Line
	9200 4000 9550 4000
Wire Wire Line
	9200 3900 9550 3900
Wire Wire Line
	9200 3800 9550 3800
$Comp
L alexios:74HC14 U903
U 5 1 62160451
P 9200 1550
F 0 "U903" H 9275 1817 50  0000 C CNN
F 1 "74HC14" H 9275 1726 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 9200 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 9200 1750 50  0001 C CNN
	5    9200 1550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC14 U903
U 6 1 62160457
P 6500 7350
F 0 "U903" H 6575 7617 50  0000 C CNN
F 1 "74HC14" H 6575 7526 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 6500 7550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 6500 7550 50  0001 C CNN
	6    6500 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 6950 6250 6950
Wire Wire Line
	6250 6950 6250 7350
$Comp
L power:GND #PWR0148
U 1 1 621884D6
P 6250 7450
F 0 "#PWR0148" H 6250 7200 50  0001 C CNN
F 1 "GND" H 6255 7277 50  0000 C CNN
F 2 "" H 6250 7450 50  0001 C CNN
F 3 "" H 6250 7450 50  0001 C CNN
	1    6250 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 7350 6250 7350
Connection ~ 6250 7350
Wire Wire Line
	6250 7350 6250 7450
NoConn ~ 6850 6950
NoConn ~ 6850 7350
$Comp
L alexios:16V8 U901
U 1 1 632DEFBE
P 4900 1700
F 0 "U901" H 4900 2450 50  0000 C CNN
F 1 "16V8" H 4900 2350 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4900 1700 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4900 1700 50  0001 C CNN
F 4 "SIGNTR" V 4900 1700 50  0000 C CNB "Signature"
F 5 "filename.jed" H 4900 1075 50  0000 C CNN "Image Filename"
	1    4900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1950 5700 1950
Wire Wire Line
	5350 1750 5700 1750
Wire Wire Line
	5350 1250 5700 1250
Wire Wire Line
	5350 1450 5700 1450
Text Label 4100 1250 0    50   ~ 0
~RSTHOLD
Text Label 4100 1350 0    50   ~ 0
CLK3
Text Label 4100 1450 0    50   ~ 0
T34
Text Label 4100 1750 0    50   ~ 0
~WEN
Text Label 4100 1850 0    50   ~ 0
~REN
Text Label 4100 1950 0    50   ~ 0
~MEM
Text Label 4100 2050 0    50   ~ 0
~IO
Text Label 4100 2150 0    50   ~ 0
~WS
Text Label 5700 1850 2    50   ~ 0
~ABEN
Text Label 5700 1950 2    50   ~ 0
~DBEN
Text Label 5700 1250 2    50   ~ 0
~CLRWS
Text Label 5700 1450 2    50   ~ 0
~SETWS
Text Label 5700 1550 2    50   ~ 0
~CLRRW
Text Label 5700 1650 2    50   ~ 0
~SETW
Text Label 5700 1350 2    50   ~ 0
~SETR
$Comp
L alexios:16V8 U901
U 2 1 6336AA89
P 4900 2700
F 0 "U901" H 5080 2746 50  0000 L CNN
F 1 "16V8" H 5080 2655 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4900 2700 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4900 2700 50  0001 C CNN
F 4 "SIGNTR" H 5080 2655 50  0001 L CNB "Signature"
F 5 "filename.jed" H 5080 2564 50  0001 L CNN "Image Filename"
	2    4900 2700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U904
U 1 1 633ACFBC
P 6000 4650
F 0 "U904" H 6000 5067 50  0000 C CNN
F 1 "74HC74" H 6000 4976 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5950 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 5950 4800 50  0001 C CNN
	1    6000 4650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U904
U 2 1 633ACFC2
P 6000 5650
F 0 "U904" H 6000 6067 50  0000 C CNN
F 1 "74HC74" H 6000 5976 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5950 5800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 5950 5800 50  0001 C CNN
	2    6000 5650
	1    0    0    -1  
$EndComp
NoConn ~ 6450 5500
NoConn ~ 6450 5800
Wire Wire Line
	5550 5800 5500 5800
Wire Wire Line
	5500 5800 5500 5700
$Comp
L power:+5V #PWR0162
U 1 1 6341F9B9
P 5500 5450
F 0 "#PWR0162" H 5500 5300 50  0001 C CNN
F 1 "+5V" H 5515 5623 50  0000 C CNN
F 2 "" H 5500 5450 50  0001 C CNN
F 3 "" H 5500 5450 50  0001 C CNN
	1    5500 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5500 5500 5500
Connection ~ 5500 5500
Wire Wire Line
	5500 5500 5500 5450
Wire Wire Line
	5550 5600 5500 5600
Connection ~ 5500 5600
Wire Wire Line
	5500 5600 5500 5500
Wire Wire Line
	5550 5700 5500 5700
Connection ~ 5500 5700
Wire Wire Line
	5500 5700 5500 5600
Wire Wire Line
	5550 4600 5450 4600
Wire Wire Line
	5450 4600 5450 4900
$Comp
L power:GND #PWR0163
U 1 1 63469115
P 5450 4900
F 0 "#PWR0163" H 5450 4650 50  0001 C CNN
F 1 "GND" H 5455 4727 50  0000 C CNN
F 2 "" H 5450 4900 50  0001 C CNN
F 3 "" H 5450 4900 50  0001 C CNN
	1    5450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4700 5100 4700
Wire Wire Line
	5550 4800 5100 4800
Wire Wire Line
	5550 4500 5100 4500
Text Label 5100 4500 0    50   ~ 0
~SETWS
Text Label 5100 4700 0    50   ~ 0
CLK3
Text Label 5100 4800 0    50   ~ 0
~CLRWS
Wire Wire Line
	6450 4800 6950 4800
Text Label 6750 4800 2    50   ~ 0
~WAITING
Text Label 7900 6300 0    50   ~ 0
~DBEN
Text Label 7900 6200 0    50   ~ 0
DBDIR
Text Label 7900 4700 0    50   ~ 0
DBDIR
Text Label 5700 1750 2    50   ~ 0
DBDIR
Text Notes 14525 4900 0    50   ~ 0
~DBEN~\n\n  1\n  1\n\n  0\n  0\n\n  1\n  1
Text Notes 13675 4900 0    50   ~ 0
~REN~\n\n X\n X\n\n 0\n 0\n\n 1\n 1
Text Notes 13900 4900 0    50   ~ 0
~WEN~\n\n X\n X\n\n X\n X\n\n X\n X
Text Notes 12850 4900 0    50   ~ 0
~MEM~\n\n X\n 1\n\n 0\n X\n\n 0\n X\n
Text Notes 12450 4900 0    50   ~ 0
~RSTHOLD~\n\n 0\n 1\n\n 1\n 1\n\n 1\n 1
$Comp
L Device:C_Small C?
U 1 1 6364E1EB
P 4550 2700
AR Path="/5CC0D65F/6364E1EB" Ref="C?"  Part="1" 
AR Path="/6364E1EB" Ref="C?"  Part="1" 
AR Path="/5D30488D/6364E1EB" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/6364E1EB" Ref="C?"  Part="1" 
AR Path="/5D46B22D/6364E1EB" Ref="C901"  Part="1" 
F 0 "C901" H 4459 2746 50  0000 R CNN
F 1 "100nF" H 4459 2655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 2700 50  0001 C CNN
F 3 "~" H 4550 2700 50  0001 C CNN
	1    4550 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6364E1F1
P 4550 2800
AR Path="/6364E1F1" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/6364E1F1" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/6364E1F1" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/6364E1F1" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 4550 2550 50  0001 C CNN
F 1 "GND" H 4555 2627 50  0000 C CNN
F 2 "" H 4550 2800 50  0001 C CNN
F 3 "" H 4550 2800 50  0001 C CNN
	1    4550 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6364E1F7
P 4550 2600
AR Path="/6364E1F7" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/6364E1F7" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/6364E1F7" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/6364E1F7" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 4550 2450 50  0001 C CNN
F 1 "+5V" H 4565 2773 50  0000 C CNN
F 2 "" H 4550 2600 50  0001 C CNN
F 3 "" H 4550 2600 50  0001 C CNN
	1    4550 2600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC14 U903
U 7 1 6215E1E0
P 5650 7000
F 0 "U903" H 5830 6946 50  0000 L CNN
F 1 "74HC14" H 5830 6855 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5650 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 5650 7200 50  0001 C CNN
	7    5650 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D33F784
P 5300 7000
AR Path="/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F784" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F784" Ref="#PWR0921"  Part="1" 
F 0 "#PWR0921" H 5300 6850 50  0001 C CNN
F 1 "+5V" H 5315 7173 50  0000 C CNN
F 2 "" H 5300 7000 50  0001 C CNN
F 3 "" H 5300 7000 50  0001 C CNN
	1    5300 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D33F77D
P 5300 7200
AR Path="/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D33F77D" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5D33F77D" Ref="#PWR0925"  Part="1" 
F 0 "#PWR0925" H 5300 6950 50  0001 C CNN
F 1 "GND" H 5305 7027 50  0000 C CNN
F 2 "" H 5300 7200 50  0001 C CNN
F 3 "" H 5300 7200 50  0001 C CNN
	1    5300 7200
	1    0    0    -1  
$EndComp
Connection ~ 5300 7200
Connection ~ 5300 7000
$Comp
L Device:C_Small C?
U 1 1 5D33F777
P 5300 7100
AR Path="/5CC0D65F/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D33F777" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5D33F777" Ref="C903"  Part="1" 
F 0 "C903" H 5209 7146 50  0000 R CNN
F 1 "100nF" H 5209 7055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5300 7100 50  0001 C CNN
F 3 "~" H 5300 7100 50  0001 C CNN
	1    5300 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R904
U 1 1 63EAE059
P 6600 4500
F 0 "R904" V 6404 4500 50  0000 C CNN
F 1 "680Ω" V 6495 4500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6600 4500 50  0001 C CNN
F 3 "~" H 6600 4500 50  0001 C CNN
	1    6600 4500
	0    -1   1    0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 63EAE05F
P 6850 4500
AR Path="/61F95ACC/63EAE05F" Ref="D?"  Part="1" 
AR Path="/5D46B22D/63EAE05F" Ref="D903"  Part="1" 
F 0 "D903" H 6843 4337 50  0000 C CNN
F 1 "LED_ALT" H 6843 4336 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 4500 50  0001 C CNN
F 3 "~" H 6850 4500 50  0001 C CNN
	1    6850 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	7000 4500 7050 4500
Wire Wire Line
	7050 4550 7050 4500
Text Notes 7025 4250 2    50   ~ 0
Wait State
Wire Wire Line
	6450 4500 6500 4500
$Comp
L power:GND #PWR0704
U 1 1 63EF05AF
P 7050 4550
F 0 "#PWR0704" H 7050 4300 50  0001 C CNN
F 1 "GND" H 7150 4550 50  0000 C CNN
F 2 "" H 7050 4550 50  0001 C CNN
F 3 "" H 7050 4550 50  0001 C CNN
	1    7050 4550
	1    0    0    -1  
$EndComp
Text HLabel 3700 2050 0    50   Input ~ 0
~IO
Text HLabel 3700 1950 0    50   Input ~ 0
~MEM
Text HLabel 3700 1250 0    50   Input ~ 0
~RSTHOLD
$Comp
L Device:R_Small R?
U 1 1 5D2DC64D
P 3950 1000
AR Path="/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D2DC64D" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5D2DC64D" Ref="R908"  Part="1" 
F 0 "R908" H 4009 1046 50  0000 L CNN
F 1 "4.7kΩ" H 4009 955 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3950 1000 50  0001 C CNN
F 3 "~" H 3950 1000 50  0001 C CNN
	1    3950 1000
	1    0    0    -1  
$EndComp
Text Notes 5650 4100 0    100  ~ 20
Wait State
Wire Wire Line
	3700 1250 4450 1250
Text HLabel 3700 1350 0    50   Input ~ 0
CLK3
Wire Wire Line
	3700 1350 4450 1350
Wire Wire Line
	3700 1450 4450 1450
Wire Wire Line
	3700 1750 4450 1750
Wire Wire Line
	3700 1850 4450 1850
Wire Wire Line
	3700 1950 4450 1950
Wire Wire Line
	3700 2050 4450 2050
Text HLabel 3700 1850 0    50   Input ~ 0
~REN
Text HLabel 3700 1750 0    50   Input ~ 0
~WEN
Text HLabel 3700 1550 0    50   Input ~ 0
~HALT
Text HLabel 3700 1450 0    50   Input ~ 0
T34
Text HLabel 3700 2150 0    50   Input ~ 0
~WS
$Comp
L power:+5V #PWR0701
U 1 1 641E59CE
P 3950 900
F 0 "#PWR0701" H 3950 750 50  0001 C CNN
F 1 "+5V" H 3965 1073 50  0000 C CNN
F 2 "" H 3950 900 50  0001 C CNN
F 3 "" H 3950 900 50  0001 C CNN
	1    3950 900 
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U902
U 3 1 630D5820
P 7200 3200
F 0 "U902" H 7380 3246 50  0000 L CNN
F 1 "74HC74" H 7380 3155 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7150 3350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 7150 3350 50  0001 C CNN
	3    7200 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 1550 10550 1550
Connection ~ 10200 1550
Wire Wire Line
	10200 2500 10550 2500
Wire Wire Line
	10550 2500 10800 2500
Connection ~ 10550 2500
$Comp
L Device:R_Small R?
U 1 1 630E5208
P 10550 2875
AR Path="/5E36D9C8/630E5208" Ref="R?"  Part="1" 
AR Path="/5D46B22D/630E5208" Ref="R923"  Part="1" 
F 0 "R923" H 10500 2875 50  0000 R CNN
F 1 "100Ω" H 10500 2775 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10550 2875 50  0001 C CNN
F 3 "~" H 10550 2875 50  0001 C CNN
	1    10550 2875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0158
U 1 1 630EF4B5
P 10550 2975
F 0 "#PWR0158" H 10550 2725 50  0001 C CNN
F 1 "GND" H 10555 2802 50  0000 C CNN
F 2 "" H 10550 2975 50  0001 C CNN
F 3 "" H 10550 2975 50  0001 C CNN
	1    10550 2975
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 630E520F
P 10550 2675
AR Path="/5E36D9C8/630E520F" Ref="C?"  Part="1" 
AR Path="/5D46B22D/630E520F" Ref="C923"  Part="1" 
F 0 "C923" H 10500 2775 50  0000 R CNN
F 1 "120pF" H 10500 2575 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10550 2675 50  0001 C CNN
F 3 "~" H 10550 2675 50  0001 C CNN
	1    10550 2675
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R902
U 1 1 63F4BB80
P 7800 2200
F 0 "R902" V 7604 2200 50  0000 C CNN
F 1 "680Ω" V 7695 2200 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7800 2200 50  0001 C CNN
F 3 "~" H 7800 2200 50  0001 C CNN
	1    7800 2200
	0    -1   1    0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 63F4BB7A
P 8050 2200
AR Path="/61F95ACC/63F4BB7A" Ref="D?"  Part="1" 
AR Path="/5D46B22D/63F4BB7A" Ref="D902"  Part="1" 
F 0 "D902" H 8043 2037 50  0000 C CNN
F 1 "LED_ALT" H 8043 2036 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 2200 50  0001 C CNN
F 3 "~" H 8050 2200 50  0001 C CNN
	1    8050 2200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0703
U 1 1 63F4BB74
P 8250 2250
F 0 "#PWR0703" H 8250 2000 50  0001 C CNN
F 1 "GND" H 8350 2250 50  0000 C CNN
F 2 "" H 8250 2250 50  0001 C CNN
F 3 "" H 8250 2250 50  0001 C CNN
	1    8250 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 1250 8250 1250
Wire Wire Line
	8250 1250 8250 1300
Wire Wire Line
	7650 1250 7700 1250
$Comp
L Device:R_Small R?
U 1 1 63EF6862
P 7800 1250
AR Path="/61F95ACC/63EF6862" Ref="R?"  Part="1" 
AR Path="/5D46B22D/63EF6862" Ref="R901"  Part="1" 
F 0 "R901" V 7604 1250 50  0000 C CNN
F 1 "680Ω" V 7695 1250 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7800 1250 50  0001 C CNN
F 3 "~" H 7800 1250 50  0001 C CNN
	1    7800 1250
	0    -1   1    0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 63EF6868
P 8050 1250
AR Path="/61F95ACC/63EF6868" Ref="D?"  Part="1" 
AR Path="/5D46B22D/63EF6868" Ref="D901"  Part="1" 
F 0 "D901" H 8043 1087 50  0000 C CNN
F 1 "LED_ALT" H 8043 1086 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 1250 50  0001 C CNN
F 3 "~" H 8050 1250 50  0001 C CNN
	1    8050 1250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0702
U 1 1 63EF6870
P 8250 1300
F 0 "#PWR0702" H 8250 1050 50  0001 C CNN
F 1 "GND" H 8350 1300 50  0000 C CNN
F 2 "" H 8250 1300 50  0001 C CNN
F 3 "" H 8250 1300 50  0001 C CNN
	1    8250 1300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC14 U903
U 1 1 6212B1D8
P 8150 1550
F 0 "U903" H 8225 1375 50  0000 C CNN
F 1 "74HC14" H 8225 1284 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 8150 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 8150 1750 50  0001 C CNN
	1    8150 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 2575 10550 2500
Wire Wire Line
	10100 2500 10200 2500
Connection ~ 10200 2500
Wire Wire Line
	9550 2500 9600 2500
$Comp
L alexios:74AHC1G125 U?
U 1 1 63878377
P 9800 2500
AR Path="/63878377" Ref="U?"  Part="2" 
AR Path="/5D30488D/63878377" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/63878377" Ref="U?"  Part="2" 
AR Path="/5D46B22D/63878377" Ref="U907"  Part="1" 
F 0 "U907" H 9850 2326 50  0000 C CNN
F 1 "74LVC1G125" H 9850 2235 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9950 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9950 2750 50  0001 C CNN
	1    9800 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 2300 9850 2050
Wire Wire Line
	10200 2425 10200 2500
$Comp
L power:+5V #PWR?
U 1 1 638B7D43
P 10200 2225
AR Path="/5F67D4B5/638B7D43" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/638B7D43" Ref="#PWR0173"  Part="1" 
F 0 "#PWR0173" H 10200 2075 50  0001 C CNN
F 1 "+5V" H 10215 2398 50  0000 C CNN
F 2 "" H 10200 2225 50  0001 C CNN
F 3 "" H 10200 2225 50  0001 C CNN
	1    10200 2225
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 638B7D3D
P 10200 2325
AR Path="/638B7D3D" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/638B7D3D" Ref="R?"  Part="1" 
AR Path="/5D54E677/638B7D3D" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/638B7D3D" Ref="R?"  Part="1" 
AR Path="/5DEAC282/638B7D3D" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/638B7D3D" Ref="R?"  Part="1" 
AR Path="/5D46B22D/638B7D3D" Ref="R924"  Part="1" 
F 0 "R924" H 10259 2371 50  0000 L CNN
F 1 "4.7kΩ" H 10259 2280 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10200 2325 50  0001 C CNN
F 3 "~" H 10200 2325 50  0001 C CNN
	1    10200 2325
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 1550 10800 1550
Connection ~ 10550 1550
Text Label 9150 2050 0    50   ~ 0
~ABEN
Wire Wire Line
	9850 2050 9150 2050
Wire Wire Line
	10200 1475 10200 1550
$Comp
L power:+5V #PWR?
U 1 1 63849EB6
P 10200 1275
AR Path="/5F67D4B5/63849EB6" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/63849EB6" Ref="#PWR0172"  Part="1" 
F 0 "#PWR0172" H 10200 1125 50  0001 C CNN
F 1 "+5V" H 10215 1448 50  0000 C CNN
F 2 "" H 10200 1275 50  0001 C CNN
F 3 "" H 10200 1275 50  0001 C CNN
	1    10200 1275
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 63849EB0
P 10200 1375
AR Path="/63849EB0" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/63849EB0" Ref="R?"  Part="1" 
AR Path="/5D54E677/63849EB0" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/63849EB0" Ref="R?"  Part="1" 
AR Path="/5DEAC282/63849EB0" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/63849EB0" Ref="R?"  Part="1" 
AR Path="/5D46B22D/63849EB0" Ref="R922"  Part="1" 
F 0 "R922" H 10259 1421 50  0000 L CNN
F 1 "4.7kΩ" H 10259 1330 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10200 1375 50  0001 C CNN
F 3 "~" H 10200 1375 50  0001 C CNN
	1    10200 1375
	1    0    0    -1  
$EndComp
Text Label 9150 1100 0    50   ~ 0
~ABEN
Wire Wire Line
	9875 1350 9875 1100
Wire Wire Line
	9875 1100 9150 1100
Wire Wire Line
	9550 1550 9625 1550
Wire Wire Line
	10125 1550 10200 1550
Wire Wire Line
	10550 1625 10550 1550
Connection ~ 6850 3300
Connection ~ 6850 3100
$Comp
L power:+5V #PWR?
U 1 1 6367EA7F
P 6850 3100
AR Path="/6367EA7F" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/6367EA7F" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/6367EA7F" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/6367EA7F" Ref="#PWR0171"  Part="1" 
F 0 "#PWR0171" H 6850 2950 50  0001 C CNN
F 1 "+5V" H 6865 3273 50  0000 C CNN
F 2 "" H 6850 3100 50  0001 C CNN
F 3 "" H 6850 3100 50  0001 C CNN
	1    6850 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6367EA79
P 6850 3300
AR Path="/6367EA79" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/6367EA79" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/6367EA79" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/6367EA79" Ref="#PWR0170"  Part="1" 
F 0 "#PWR0170" H 6850 3050 50  0001 C CNN
F 1 "GND" H 6855 3127 50  0000 C CNN
F 2 "" H 6850 3300 50  0001 C CNN
F 3 "" H 6850 3300 50  0001 C CNN
	1    6850 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6367EA73
P 6850 3200
AR Path="/5CC0D65F/6367EA73" Ref="C?"  Part="1" 
AR Path="/6367EA73" Ref="C?"  Part="1" 
AR Path="/5D30488D/6367EA73" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/6367EA73" Ref="C?"  Part="1" 
AR Path="/5D46B22D/6367EA73" Ref="C902"  Part="1" 
F 0 "C902" H 6759 3246 50  0000 R CNN
F 1 "100nF" H 6759 3155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 3200 50  0001 C CNN
F 3 "~" H 6850 3200 50  0001 C CNN
	1    6850 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2500 7950 2500
Wire Wire Line
	8800 2500 8850 2500
NoConn ~ 8850 2500
$Comp
L power:GND #PWR0161
U 1 1 632AEBBC
P 8650 2950
F 0 "#PWR0161" H 8650 2700 50  0001 C CNN
F 1 "GND" H 8655 2777 50  0000 C CNN
F 2 "" H 8650 2950 50  0001 C CNN
F 3 "" H 8650 2950 50  0001 C CNN
	1    8650 2950
	1    0    0    -1  
$EndComp
Connection ~ 8650 2700
Wire Wire Line
	8650 2700 8650 2750
Wire Wire Line
	8950 2500 9000 2500
Wire Wire Line
	8950 2700 8950 2500
Wire Wire Line
	8650 2700 8950 2700
Wire Wire Line
	8650 2650 8650 2700
$Comp
L Device:C_Small C?
U 1 1 632AEBB0
P 8650 2850
AR Path="/5CC0D65F/632AEBB0" Ref="C?"  Part="1" 
AR Path="/632AEBB0" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/632AEBB0" Ref="C?"  Part="1" 
AR Path="/5D46B22D/632AEBB0" Ref="C922"  Part="1" 
F 0 "C922" H 8559 2896 50  0000 R CNN
F 1 "22pF" H 8559 2805 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 2850 50  0001 C CNN
F 3 "~" H 8650 2850 50  0001 C CNN
	1    8650 2850
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT RV902
U 1 1 632AEBAA
P 8650 2500
F 0 "RV902" V 8443 2500 50  0000 C CNN
F 1 "1kΩ" V 8534 2500 50  0000 C CNN
F 2 "alexios:Potentiometer_Bourns_67W" H 8650 2500 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/414/67-1528393.pdf" H 8650 2500 50  0001 C CNN
F 4 "858-67ZR1KLF; €1.02" V 8650 2500 50  0001 C CNN "Mouser"
	1    8650 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 1550 7950 1550
Text HLabel 10800 1550 2    50   3State ~ 0
~R
Text Label 6400 2200 0    50   ~ 0
~SETW
Text Label 6400 2500 0    50   ~ 0
~CLRRW
Wire Wire Line
	6700 2300 6750 2300
Wire Wire Line
	6700 2300 6700 2600
Text Label 6400 2400 0    50   ~ 0
CLK1
Wire Wire Line
	6750 2400 6400 2400
$Comp
L power:GND #PWR0160
U 1 1 631B51B0
P 6700 2600
F 0 "#PWR0160" H 6700 2350 50  0001 C CNN
F 1 "GND" H 6705 2427 50  0000 C CNN
F 2 "" H 6700 2600 50  0001 C CNN
F 3 "" H 6700 2600 50  0001 C CNN
	1    6700 2600
	1    0    0    -1  
$EndComp
Text Label 6400 1550 0    50   ~ 0
~CLRRW
Text Label 6400 1250 0    50   ~ 0
~SETR
Wire Wire Line
	6700 1350 6750 1350
Wire Wire Line
	6700 1350 6700 1650
Text Label 6400 1450 0    50   ~ 0
CLK1
Wire Wire Line
	6750 1450 6400 1450
$Comp
L power:GND #PWR0159
U 1 1 6319585E
P 6700 1650
F 0 "#PWR0159" H 6700 1400 50  0001 C CNN
F 1 "GND" H 6705 1477 50  0000 C CNN
F 2 "" H 6700 1650 50  0001 C CNN
F 3 "" H 6700 1650 50  0001 C CNN
	1    6700 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 630EF3CB
P 10550 2025
F 0 "#PWR0157" H 10550 1775 50  0001 C CNN
F 1 "GND" H 10555 1852 50  0000 C CNN
F 2 "" H 10550 2025 50  0001 C CNN
F 3 "" H 10550 2025 50  0001 C CNN
	1    10550 2025
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 630DC101
P 10550 1725
AR Path="/5E36D9C8/630DC101" Ref="C?"  Part="1" 
AR Path="/5D46B22D/630DC101" Ref="C921"  Part="1" 
F 0 "C921" H 10500 1825 50  0000 R CNN
F 1 "120pF" H 10500 1625 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10550 1725 50  0001 C CNN
F 3 "~" H 10550 1725 50  0001 C CNN
	1    10550 1725
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 630DC0FA
P 10550 1925
AR Path="/5E36D9C8/630DC0FA" Ref="R?"  Part="1" 
AR Path="/5D46B22D/630DC0FA" Ref="R921"  Part="1" 
F 0 "R921" H 10609 1971 50  0000 L CNN
F 1 "100Ω" H 10609 1880 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10550 1925 50  0001 C CNN
F 3 "~" H 10550 1925 50  0001 C CNN
	1    10550 1925
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U902
U 2 1 630D5295
P 7200 2350
F 0 "U902" H 7200 2767 50  0000 C CNN
F 1 "74HC74" H 7200 2676 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7150 2500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 7150 2500 50  0001 C CNN
	2    7200 2350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U902
U 1 1 630D48E7
P 7200 1400
F 0 "U902" H 7200 1817 50  0000 C CNN
F 1 "74HC74" H 7200 1726 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7150 1550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 7150 1550 50  0001 C CNN
	1    7200 1400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC14 U903
U 4 1 6215D1B1
P 9200 2500
F 0 "U903" H 9275 2767 50  0000 C CNN
F 1 "74HC14" H 9275 2676 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 9200 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 9200 2700 50  0001 C CNN
	4    9200 2500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC14 U903
U 3 1 6215C6AA
P 8150 2500
F 0 "U903" H 8225 2325 50  0000 C CNN
F 1 "74HC14" H 8225 2234 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 8150 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 8150 2700 50  0001 C CNN
	3    8150 2500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC14 U903
U 2 1 6214AC9E
P 6500 6950
F 0 "U903" H 6575 7217 50  0000 C CNN
F 1 "74HC14" H 6575 7126 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 6500 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 6500 7150 50  0001 C CNN
	2    6500 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1550 8850 1550
NoConn ~ 8850 1550
$Comp
L power:GND #PWR0126
U 1 1 620FD076
P 8650 2000
F 0 "#PWR0126" H 8650 1750 50  0001 C CNN
F 1 "GND" H 8655 1827 50  0000 C CNN
F 2 "" H 8650 2000 50  0001 C CNN
F 3 "" H 8650 2000 50  0001 C CNN
	1    8650 2000
	1    0    0    -1  
$EndComp
Connection ~ 8650 1750
Wire Wire Line
	8650 1750 8650 1800
Wire Wire Line
	8950 1550 9000 1550
Wire Wire Line
	8950 1750 8950 1550
Wire Wire Line
	8650 1750 8950 1750
Wire Wire Line
	8650 1700 8650 1750
$Comp
L Device:C_Small C?
U 1 1 620A5328
P 8650 1900
AR Path="/5CC0D65F/620A5328" Ref="C?"  Part="1" 
AR Path="/620A5328" Ref="C?"  Part="1" 
AR Path="/5D4D9B4A/620A5328" Ref="C?"  Part="1" 
AR Path="/5D46B22D/620A5328" Ref="C920"  Part="1" 
F 0 "C920" H 8559 1946 50  0000 R CNN
F 1 "22pF" H 8559 1855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 1900 50  0001 C CNN
F 3 "~" H 8650 1900 50  0001 C CNN
	1    8650 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT RV901
U 1 1 62097662
P 8650 1550
F 0 "RV901" V 8443 1550 50  0000 C CNN
F 1 "1kΩ" V 8534 1550 50  0000 C CNN
F 2 "alexios:Potentiometer_Bourns_67W" H 8650 1550 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/414/67-1528393.pdf" H 8650 1550 50  0001 C CNN
F 4 "858-67ZR1KLF; €1.02" V 8650 1550 50  0001 C CNN "Mouser"
	1    8650 1550
	0    1    1    0   
$EndComp
$Comp
L alexios:74AHC1G125 U?
U 1 1 5D6CFDA6
P 9825 1550
AR Path="/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D6CFDA6" Ref="U?"  Part="2" 
AR Path="/5D46B22D/5D6CFDA6" Ref="U906"  Part="1" 
F 0 "U906" H 9875 1376 50  0000 C CNN
F 1 "74LVC1G125" H 9875 1285 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9975 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9975 1800 50  0001 C CNN
	1    9825 1550
	1    0    0    -1  
$EndComp
Text HLabel 10800 2500 2    50   3State ~ 0
~W
Wire Bus Line
	7650 6450 1250 6450
Text HLabel 1250 6450 0    50   3State ~ 0
IBUS[0..15]
Text HLabel 5850 1850 2    50   Output ~ 0
~ABEN
Wire Wire Line
	5350 1850 5850 1850
Wire Wire Line
	6400 1550 6750 1550
Wire Wire Line
	6400 2500 6750 2500
Wire Wire Line
	6400 1250 6750 1250
Wire Wire Line
	5350 1650 5700 1650
Wire Wire Line
	6400 2200 6750 2200
Text HLabel 3700 2350 0    50   Input ~ 0
CLK1
Wire Wire Line
	3700 2350 4000 2350
Text Label 4000 2350 2    50   ~ 0
CLK1
$Comp
L alexios:74HC74 U904
U 3 1 644BAE64
P 7250 5650
F 0 "U904" H 7250 6067 50  0000 C CNN
F 1 "74HC74" H 7250 5976 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7200 5800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 7200 5800 50  0001 C CNN
	3    7250 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 644C6093
P 6900 5650
AR Path="/5CC0D65F/644C6093" Ref="C?"  Part="1" 
AR Path="/644C6093" Ref="C?"  Part="1" 
AR Path="/5D30488D/644C6093" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/644C6093" Ref="C?"  Part="1" 
AR Path="/5D46B22D/644C6093" Ref="C904"  Part="1" 
F 0 "C904" H 6809 5696 50  0000 R CNN
F 1 "100nF" H 6809 5605 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6900 5650 50  0001 C CNN
F 3 "~" H 6900 5650 50  0001 C CNN
	1    6900 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 644C6099
P 6900 5750
AR Path="/644C6099" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/644C6099" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/644C6099" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/644C6099" Ref="#PWR0706"  Part="1" 
F 0 "#PWR0706" H 6900 5500 50  0001 C CNN
F 1 "GND" H 6905 5577 50  0000 C CNN
F 2 "" H 6900 5750 50  0001 C CNN
F 3 "" H 6900 5750 50  0001 C CNN
	1    6900 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 644C609F
P 6900 5550
AR Path="/644C609F" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/644C609F" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/644C609F" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/644C609F" Ref="#PWR0705"  Part="1" 
F 0 "#PWR0705" H 6900 5400 50  0001 C CNN
F 1 "+5V" H 6915 5723 50  0000 C CNN
F 2 "" H 6900 5550 50  0001 C CNN
F 3 "" H 6900 5550 50  0001 C CNN
	1    6900 5550
	1    0    0    -1  
$EndComp
Text Notes 4400 800  0    100  ~ 20
Control Logic
Connection ~ 4550 2600
Connection ~ 4550 2800
Text Notes 6150 800  0    100  ~ 20
Read/Write Transactions
Text Notes 8450 800  0    100  ~ 20
Delay
Text Notes 9050 800  0    100  ~ 20
Tri-Stating
Text Notes 10100 800  0    100  ~ 20
Termination
Wire Wire Line
	5350 1350 5700 1350
Wire Wire Line
	8200 2200 8250 2200
Wire Wire Line
	8250 2200 8250 2250
Wire Wire Line
	7650 2200 7700 2200
Wire Wire Line
	5350 1550 5700 1550
$Comp
L alexios:74AHC1G125 U?
U 2 1 645F852B
P 2750 7100
AR Path="/645F852B" Ref="U?"  Part="2" 
AR Path="/5D30488D/645F852B" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/645F852B" Ref="U?"  Part="2" 
AR Path="/5D46B22D/645F852B" Ref="U906"  Part="2" 
F 0 "U906" H 2930 7146 50  0000 L CNN
F 1 "74LVC1G125" H 2930 7055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2900 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2900 7350 50  0001 C CNN
	2    2750 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6460DF35
P 2400 7100
AR Path="/5CC0D65F/6460DF35" Ref="C?"  Part="1" 
AR Path="/6460DF35" Ref="C?"  Part="1" 
AR Path="/5D30488D/6460DF35" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/6460DF35" Ref="C?"  Part="1" 
AR Path="/5D46B22D/6460DF35" Ref="C906"  Part="1" 
F 0 "C906" H 2309 7146 50  0000 R CNN
F 1 "100nF" H 2309 7055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 7100 50  0001 C CNN
F 3 "~" H 2400 7100 50  0001 C CNN
	1    2400 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6460DF3B
P 2400 7200
AR Path="/6460DF3B" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/6460DF3B" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/6460DF3B" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/6460DF3B" Ref="#PWR0709"  Part="1" 
F 0 "#PWR0709" H 2400 6950 50  0001 C CNN
F 1 "GND" H 2405 7027 50  0000 C CNN
F 2 "" H 2400 7200 50  0001 C CNN
F 3 "" H 2400 7200 50  0001 C CNN
	1    2400 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6460DF41
P 2400 7000
AR Path="/6460DF41" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/6460DF41" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/6460DF41" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/6460DF41" Ref="#PWR0707"  Part="1" 
F 0 "#PWR0707" H 2400 6850 50  0001 C CNN
F 1 "+5V" H 2415 7173 50  0000 C CNN
F 2 "" H 2400 7000 50  0001 C CNN
F 3 "" H 2400 7000 50  0001 C CNN
	1    2400 7000
	1    0    0    -1  
$EndComp
Connection ~ 2400 7000
Connection ~ 2400 7200
$Comp
L alexios:74AHC1G125 U?
U 2 1 64621FAA
P 4200 7100
AR Path="/64621FAA" Ref="U?"  Part="2" 
AR Path="/5D30488D/64621FAA" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/64621FAA" Ref="U?"  Part="2" 
AR Path="/5D46B22D/64621FAA" Ref="U907"  Part="2" 
F 0 "U907" H 4380 7146 50  0000 L CNN
F 1 "74LVC1G125" H 4380 7055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4350 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4350 7350 50  0001 C CNN
	2    4200 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 64621FB0
P 3850 7100
AR Path="/5CC0D65F/64621FB0" Ref="C?"  Part="1" 
AR Path="/64621FB0" Ref="C?"  Part="1" 
AR Path="/5D30488D/64621FB0" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/64621FB0" Ref="C?"  Part="1" 
AR Path="/5D46B22D/64621FB0" Ref="C907"  Part="1" 
F 0 "C907" H 3759 7146 50  0000 R CNN
F 1 "100nF" H 3759 7055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3850 7100 50  0001 C CNN
F 3 "~" H 3850 7100 50  0001 C CNN
	1    3850 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64621FB6
P 3850 7200
AR Path="/64621FB6" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/64621FB6" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/64621FB6" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/64621FB6" Ref="#PWR0710"  Part="1" 
F 0 "#PWR0710" H 3850 6950 50  0001 C CNN
F 1 "GND" H 3855 7027 50  0000 C CNN
F 2 "" H 3850 7200 50  0001 C CNN
F 3 "" H 3850 7200 50  0001 C CNN
	1    3850 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64621FBC
P 3850 7000
AR Path="/64621FBC" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/64621FBC" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/64621FBC" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/64621FBC" Ref="#PWR0708"  Part="1" 
F 0 "#PWR0708" H 3850 6850 50  0001 C CNN
F 1 "+5V" H 3865 7173 50  0000 C CNN
F 2 "" H 3850 7000 50  0001 C CNN
F 3 "" H 3850 7000 50  0001 C CNN
	1    3850 7000
	1    0    0    -1  
$EndComp
Connection ~ 3850 7000
Connection ~ 3850 7200
Connection ~ 6900 5550
Connection ~ 6900 5750
Wire Wire Line
	3700 2150 3950 2150
Wire Wire Line
	4100 1650 4450 1650
Wire Wire Line
	3700 1550 4450 1550
Text Label 4100 1650 0    50   ~ 0
~WAITING
Text Label 4100 1550 0    50   ~ 0
~HALT
Wire Wire Line
	3950 1100 3950 2150
Wire Bus Line
	9650 3550 9650 5900
Wire Bus Line
	7750 3900 7750 6350
Connection ~ 3950 2150
Wire Wire Line
	3950 2150 4450 2150
$EndSCHEMATC
