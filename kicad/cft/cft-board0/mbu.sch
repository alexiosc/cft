EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 17
Title "Memory Bank Unit"
Date ""
Rev "2023"
Comp ""
Comment1 "MBU"
Comment2 "MBU Revision 3 (SRAM reg file, CTX reg, no longed I/O-mapped)"
Comment3 ""
Comment4 "mbu.v"
$EndDescr
Wire Notes Line width 20 style solid
	9350 3500 9350 4150
Wire Notes Line width 20 style solid
	11000 4150 9350 4150
Wire Notes Line width 20 style solid
	9350 3500 11000 3500
Text Notes 9450 4000 0    50   ~ 0
Signals IBUS[8..15] are intentionally\nnot driven here! They are handled by\nthe flag unit.
Text Notes 9450 3700 0    50   ~ 10
Note
Text HLabel 1250 2750 0    50   Input ~ 0
CLK4
Text Label 3600 2300 0    50   ~ 0
WADDR0
Text Label 3600 2400 0    50   ~ 0
WADDR1
Text Label 3600 2200 0    50   ~ 0
~IR-IDXR
Text Label 5450 1800 2    50   ~ 0
RA2
Text Label 5450 1700 2    50   ~ 0
RA1
Text Label 5450 1600 2    50   ~ 0
RA0
Text Label 9050 1600 2    50   ~ 0
AEXT5
Text Label 9050 1700 2    50   ~ 0
AEXT6
Text Label 9050 1800 2    50   ~ 0
AEXT7
Text Label 9050 1900 2    50   ~ 0
AEXT4
Text Label 9050 2000 2    50   ~ 0
AEXT3
Text Label 9050 2100 2    50   ~ 0
AEXT2
Text Label 9050 2200 2    50   ~ 0
AEXT1
Text Label 9050 2300 2    50   ~ 0
AEXT0
Text Label 3800 3650 0    50   ~ 0
IBUS0
Text Label 3800 3750 0    50   ~ 0
IBUS1
Text Label 3800 3850 0    50   ~ 0
IBUS2
Text Label 3800 3950 0    50   ~ 0
IBUS3
Text Label 3800 4050 0    50   ~ 0
IBUS4
Text Label 3800 4150 0    50   ~ 0
IBUS5
Text Label 3800 4250 0    50   ~ 0
IBUS6
Text Label 3800 4350 0    50   ~ 0
IBUS7
Wire Wire Line
	4150 3650 3800 3650
Wire Wire Line
	4150 3750 3800 3750
Wire Wire Line
	4150 3850 3800 3850
Wire Wire Line
	4150 3950 3800 3950
Wire Wire Line
	4150 4050 3800 4050
Wire Wire Line
	4150 4150 3800 4150
Wire Wire Line
	4150 4250 3800 4250
Wire Wire Line
	4150 4350 3800 4350
Wire Wire Line
	7800 2500 7600 2500
Wire Wire Line
	7800 1900 7600 1900
Wire Wire Line
	7800 2600 7600 2600
Wire Wire Line
	7800 1800 7600 1800
Wire Wire Line
	7800 1700 7600 1700
Wire Wire Line
	7800 1600 7600 1600
Text Label 7600 2500 0    50   ~ 0
CTX2
Text Label 7600 1900 0    50   ~ 0
CTX3
Text Label 7600 2600 0    50   ~ 0
CTX4
Text Label 7600 1800 0    50   ~ 0
CTX5
Text Label 7600 1700 0    50   ~ 0
CTX6
Text Label 7600 1600 0    50   ~ 0
CTX7
$Comp
L power:GND #PWR0610
U 1 1 608480BA
P 4100 4700
F 0 "#PWR0610" H 4100 4450 50  0001 C CNN
F 1 "GND" H 4105 4527 50  0000 C CNN
F 2 "" H 4100 4700 50  0001 C CNN
F 3 "" H 4100 4700 50  0001 C CNN
	1    4100 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4650 4100 4700
Wire Wire Line
	4150 4650 4100 4650
Wire Wire Line
	4150 4550 3800 4550
Text Label 7450 3300 0    50   ~ 0
~OE
Text Label 5450 2000 2    50   ~ 0
~OE
Text Label 5450 1900 2    50   ~ 0
~WE
Text Label 5300 4350 0    50   ~ 0
CTX7
Text Label 5300 4250 0    50   ~ 0
CTX6
Text Label 5300 4150 0    50   ~ 0
CTX5
Text Label 5300 4050 0    50   ~ 0
CTX4
Text Label 5300 3950 0    50   ~ 0
CTX3
Text Label 5300 3850 0    50   ~ 0
CTX2
Text Label 5300 3750 0    50   ~ 0
CTX1
Text Label 5300 3650 0    50   ~ 0
CTX0
Text Label 5400 4550 0    50   ~ 0
~RCTX
$Comp
L alexios:74HC541 U605
U 1 1 60513838
P 6150 4150
F 0 "U605" H 6500 3800 50  0000 L CNN
F 1 "74HC541" H 6500 3700 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6150 4150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6150 4150 50  0001 C CNN
	1    6150 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4550 5400 4550
Wire Wire Line
	5650 4650 5600 4650
Wire Wire Line
	5600 4650 5600 4700
$Comp
L power:GND #PWR0611
U 1 1 6051382E
P 5600 4700
F 0 "#PWR0611" H 5600 4450 50  0001 C CNN
F 1 "GND" H 5605 4527 50  0000 C CNN
F 2 "" H 5600 4700 50  0001 C CNN
F 3 "" H 5600 4700 50  0001 C CNN
	1    5600 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3300 7800 3300
Wire Wire Line
	5100 1900 7200 1900
Text Notes 4000 1200 0    100  ~ 20
Control ROM (GAL)
Text Notes 5850 3450 0    100  ~ 20
CTX → IBus
Text Notes 4250 3450 0    100  ~ 20
IBus → CTX
Text Notes 7600 1200 0    100  ~ 20
Register File
Text Label 3300 2100 2    50   ~ 0
~RCTX
Wire Wire Line
	3050 2100 3300 2100
Wire Wire Line
	3050 2200 3300 2200
Text Label 3300 2200 2    50   ~ 0
~WCTX
$Comp
L alexios:16V8 U?
U 1 1 60FA549C
P 2600 2050
AR Path="/61F95ACC/6AF25BF3/60FA549C" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60FA549C" Ref="U601"  Part="1" 
F 0 "U601" H 2600 2767 50  0000 C CNN
F 1 "16V8" H 2600 2676 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2600 2050 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2600 2050 50  0001 C CNN
F 4 "mbu-decode.jed" H 2600 1450 50  0000 C CNN "Image Filename"
F 5 "MBUDEC00" V 2600 2100 50  0000 C CNB "Signature"
	1    2600 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2300 3350 2300
Wire Wire Line
	3350 2300 3350 2750
Wire Wire Line
	3350 2750 1250 2750
Text Label 1750 2750 0    50   ~ 0
CLK4
Text Notes 2655 2335 0    50   ~ 0
IN
Text Label 1750 2500 0    50   ~ 0
WADDR4
Text Label 1750 2400 0    50   ~ 0
WADDR3
Text Label 1750 2300 0    50   ~ 0
WADDR2
Text Label 1750 2200 0    50   ~ 0
WADDR1
Text Label 1750 2100 0    50   ~ 0
WADDR0
Text Label 1750 2000 0    50   ~ 0
RADDR4
Text Label 1750 1900 0    50   ~ 0
RADDR3
Wire Wire Line
	1750 1900 2150 1900
Wire Wire Line
	1750 2000 2150 2000
Wire Wire Line
	1750 1600 2150 1600
Wire Wire Line
	1750 1700 2150 1700
Wire Wire Line
	1750 1800 2150 1800
Text Label 1750 1600 0    50   ~ 0
RADDR0
Text Label 1750 1800 0    50   ~ 0
RADDR2
Text Label 1750 1700 0    50   ~ 0
RADDR1
Text Label 3600 1600 0    50   ~ 0
~WAR
Wire Wire Line
	3600 2300 4200 2300
Wire Wire Line
	3600 2400 4200 2400
Text Label 3600 1700 0    50   ~ 0
~WMBn
Text Label 3600 1800 0    50   ~ 0
~RMBn
Text Label 3300 1900 2    50   ~ 0
~RMBP
Text Label 3600 2100 0    50   ~ 0
~WMBP
Text Label 3600 2000 0    50   ~ 0
~DIS
Wire Wire Line
	5100 2200 5250 2200
Wire Wire Line
	5250 2200 5250 2850
Wire Wire Line
	5100 2300 5150 2300
Wire Wire Line
	5150 2300 5150 2750
Text Notes 4700 2230 0    50   ~ 0
IN
Text Notes 4700 2330 0    50   ~ 0
IN
Wire Wire Line
	3050 1600 4200 1600
Wire Wire Line
	3050 1700 4200 1700
Wire Wire Line
	3050 1800 4200 1800
Text Notes 2300 1200 0    100  ~ 20
Decoder
Wire Wire Line
	5150 3650 5650 3650
Wire Wire Line
	5150 3750 5650 3750
Wire Wire Line
	5150 3850 5650 3850
Wire Wire Line
	5150 3950 5650 3950
Wire Wire Line
	5150 4050 5650 4050
Wire Wire Line
	5150 4150 5650 4150
Wire Wire Line
	5150 4250 5650 4250
Wire Wire Line
	5150 4350 5650 4350
Text Label 6900 3650 2    50   ~ 0
IBUS0
Text Label 6900 3750 2    50   ~ 0
IBUS1
Text Label 6900 3850 2    50   ~ 0
IBUS2
Text Label 6900 3950 2    50   ~ 0
IBUS3
Text Label 6900 4050 2    50   ~ 0
IBUS4
Text Label 6900 4150 2    50   ~ 0
IBUS5
Text Label 6900 4250 2    50   ~ 0
IBUS6
Text Label 6900 4350 2    50   ~ 0
IBUS7
Wire Wire Line
	6650 3650 6900 3650
Wire Wire Line
	6650 3750 6900 3750
Wire Wire Line
	6650 3850 6900 3850
Wire Wire Line
	6650 3950 6900 3950
Wire Wire Line
	6650 4050 6900 4050
Wire Wire Line
	6650 4150 6900 4150
Wire Wire Line
	6650 4250 6900 4250
Wire Wire Line
	6650 4350 6900 4350
Text Label 7450 3400 0    50   ~ 0
~WE
Text Notes 4250 5150 0    100  ~ 20
IBus → MBn
Text Notes 5850 5150 0    100  ~ 20
MBn → IBus
Text Label 3800 6250 0    50   ~ 0
~WE
Wire Wire Line
	4150 6050 3800 6050
Wire Wire Line
	4150 5950 3800 5950
Wire Wire Line
	4150 5850 3800 5850
Wire Wire Line
	4150 5750 3800 5750
Wire Wire Line
	4150 5650 3800 5650
Wire Wire Line
	4150 5550 3800 5550
Wire Wire Line
	4150 5450 3800 5450
Wire Wire Line
	4150 5350 3800 5350
Text Label 3800 6050 0    50   ~ 0
IBUS7
Text Label 3800 5950 0    50   ~ 0
IBUS6
Text Label 3800 5850 0    50   ~ 0
IBUS5
Text Label 3800 5750 0    50   ~ 0
IBUS4
Text Label 3800 5650 0    50   ~ 0
IBUS3
Text Label 3800 5550 0    50   ~ 0
IBUS2
Text Label 3800 5450 0    50   ~ 0
IBUS1
Text Label 3800 5350 0    50   ~ 0
IBUS0
Text Label 6900 5350 2    50   ~ 0
IBUS0
Text Label 6900 5450 2    50   ~ 0
IBUS1
Text Label 6900 5550 2    50   ~ 0
IBUS2
Text Label 6900 5650 2    50   ~ 0
IBUS3
Text Label 6900 5750 2    50   ~ 0
IBUS4
Text Label 6900 5850 2    50   ~ 0
IBUS5
Text Label 6900 5950 2    50   ~ 0
IBUS6
Text Label 6900 6050 2    50   ~ 0
IBUS7
Wire Wire Line
	6650 5350 6900 5350
Wire Wire Line
	6650 5450 6900 5450
Wire Wire Line
	6650 5550 6900 5550
Wire Wire Line
	6650 5650 6900 5650
Wire Wire Line
	6650 5750 6900 5750
Wire Wire Line
	6650 5850 6900 5850
Wire Wire Line
	6650 5950 6900 5950
Wire Wire Line
	6650 6050 6900 6050
$Comp
L alexios:74HC541 U608
U 1 1 60964F8F
P 4650 5850
F 0 "U608" H 5000 5500 50  0000 L CNN
F 1 "74HC541" H 5000 5400 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4650 5850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4650 5850 50  0001 C CNN
	1    4650 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 6250 3800 6250
$Comp
L Device:C_Small C?
U 1 1 6BD5B1AC
P 8100 3950
AR Path="/5CC0D65F/6BD5B1AC" Ref="C?"  Part="1" 
AR Path="/6BD5B1AC" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6BD5B1AC" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6BD5B1AC" Ref="C603"  Part="1" 
F 0 "C603" H 8009 3996 50  0000 R CNN
F 1 "100nF" H 8009 3905 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8100 3950 50  0001 C CNN
F 3 "~" H 8100 3950 50  0001 C CNN
	1    8100 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6BD5B1A6
P 8100 3850
AR Path="/6BD5B1A6" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BD5B1A6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BD5B1A6" Ref="#PWR0607"  Part="1" 
F 0 "#PWR0607" H 8100 3700 50  0001 C CNN
F 1 "+5V" H 8115 4023 50  0000 C CNN
F 2 "" H 8100 3850 50  0001 C CNN
F 3 "" H 8100 3850 50  0001 C CNN
	1    8100 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6BD5B1A0
P 8100 4050
AR Path="/6BD5B1A0" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BD5B1A0" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BD5B1A0" Ref="#PWR0608"  Part="1" 
F 0 "#PWR0608" H 8100 3800 50  0001 C CNN
F 1 "GND" H 8105 3877 50  0000 C CNN
F 2 "" H 8100 4050 50  0001 C CNN
F 3 "" H 8100 4050 50  0001 C CNN
	1    8100 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 6250 5400 6250
$Comp
L alexios:74HC541 U609
U 1 1 61720F4D
P 6150 5850
F 0 "U609" H 6500 5500 50  0000 L CNN
F 1 "74HC541" H 6500 5400 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6150 5850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6150 5850 50  0001 C CNN
	1    6150 5850
	1    0    0    -1  
$EndComp
$Comp
L alexios:16V8 U?
U 1 1 605C98FF
P 4650 2050
AR Path="/61F95ACC/6AF25BF3/605C98FF" Ref="U?"  Part="1" 
AR Path="/61F95ACC/605C98FF" Ref="U602"  Part="1" 
F 0 "U602" H 4650 2767 50  0000 C CNN
F 1 "16V8" H 4650 2676 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4650 2050 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4650 2050 50  0001 C CNN
F 4 "mbu-control.jed" H 4650 1450 50  0000 C CNN "Image Filename"
F 5 "MBUCTL00" V 4650 2100 50  0000 C CNB "Signature"
	1    4650 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2100 5450 2100
Text Label 5450 2100 2    50   ~ 0
~IBUSEN
Text Label 5400 6250 0    50   ~ 0
~IBUSEN
$Comp
L power:GND #PWR0625
U 1 1 60E34396
P 4150 6350
F 0 "#PWR0625" H 4150 6100 50  0001 C CNN
F 1 "GND" H 4155 6177 50  0000 C CNN
F 2 "" H 4150 6350 50  0001 C CNN
F 3 "" H 4150 6350 50  0001 C CNN
	1    4150 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5800 1850 5800
Text Label 1300 5900 0    50   ~ 0
CLK2
Text Label 1300 5700 0    50   ~ 0
~IR-IDX
Wire Wire Line
	1850 6000 1700 6000
Text HLabel 1250 5900 0    50   Input ~ 0
CLK2
Wire Wire Line
	1850 5900 1250 5900
Wire Wire Line
	1250 5700 1850 5700
Text HLabel 1250 5700 0    50   Input ~ 0
~IR-IDX
$Comp
L alexios:74HC74 U606
U 3 1 60E7FBA7
P 2250 6500
F 0 "U606" H 2430 6546 50  0000 L CNN
F 1 "74HC74" H 2430 6455 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 2200 6650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 2200 6650 50  0001 C CNN
	3    2250 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U606
U 1 1 60E7EBE5
P 2300 4900
F 0 "U606" H 2300 5317 50  0000 C CNN
F 1 "74HC74" H 2300 5226 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 2250 5050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 2250 5050 50  0001 C CNN
	1    2300 4900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U606
U 2 1 60E7F327
P 2300 5850
F 0 "U606" H 2300 6267 50  0000 C CNN
F 1 "74HC74" H 2300 6176 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 2250 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 2250 6000 50  0001 C CNN
	2    2300 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60E848BA
P 1900 6600
AR Path="/60E848BA" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60E848BA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/60E848BA" Ref="#PWR0627"  Part="1" 
F 0 "#PWR0627" H 1900 6350 50  0001 C CNN
F 1 "GND" H 1905 6427 50  0000 C CNN
F 2 "" H 1900 6600 50  0001 C CNN
F 3 "" H 1900 6600 50  0001 C CNN
	1    1900 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60E848C0
P 1900 6400
AR Path="/60E848C0" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60E848C0" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/60E848C0" Ref="#PWR0626"  Part="1" 
F 0 "#PWR0626" H 1900 6250 50  0001 C CNN
F 1 "+5V" H 1915 6573 50  0000 C CNN
F 2 "" H 1900 6400 50  0001 C CNN
F 3 "" H 1900 6400 50  0001 C CNN
	1    1900 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60E848C6
P 1900 6500
AR Path="/5CC0D65F/60E848C6" Ref="C?"  Part="1" 
AR Path="/60E848C6" Ref="C?"  Part="1" 
AR Path="/5F3EA987/60E848C6" Ref="C?"  Part="1" 
AR Path="/61F95ACC/60E848C6" Ref="C606"  Part="1" 
F 0 "C606" H 1809 6546 50  0000 R CNN
F 1 "100nF" H 1809 6455 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1900 6500 50  0001 C CNN
F 3 "~" H 1900 6500 50  0001 C CNN
	1    1900 6500
	1    0    0    -1  
$EndComp
Connection ~ 1900 6400
Connection ~ 1900 6600
Wire Wire Line
	1250 5050 1700 5050
Text HLabel 1250 5050 0    50   Input ~ 0
~RSTHOLD
Text Label 1300 5050 0    50   ~ 0
~RSTHOLD
Text Notes 1750 4100 0    100  ~ 20
MBU Enable
Wire Wire Line
	1850 4950 1800 4950
$Comp
L power:+5V #PWR0609
U 1 1 60EB7CBD
P 1800 4650
F 0 "#PWR0609" H 1800 4500 50  0001 C CNN
F 1 "+5V" H 1815 4823 50  0000 C CNN
F 2 "" H 1800 4650 50  0001 C CNN
F 3 "" H 1800 4650 50  0001 C CNN
	1    1800 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 4750 1850 4750
Wire Wire Line
	1800 4850 1800 4650
Wire Wire Line
	1800 4950 1800 4850
Connection ~ 1800 4850
Wire Wire Line
	1850 4850 1800 4850
Text Label 1300 4750 0    50   ~ 0
~WMBn
$Comp
L Device:R_Small R602
U 1 1 60EB7CD2
P 2850 5050
F 0 "R602" V 2654 5050 50  0000 C CNN
F 1 "680Ω" V 2745 5050 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2850 5050 50  0001 C CNN
F 3 "~" H 2850 5050 50  0001 C CNN
	1    2850 5050
	0    -1   1    0   
$EndComp
$Comp
L Device:LED_ALT D601
U 1 1 60EB7CCC
P 3100 5050
F 0 "D601" H 3100 5200 50  0000 C CNN
F 1 "LED_ALT" H 3093 4886 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3100 5050 50  0001 C CNN
F 3 "~" H 3100 5050 50  0001 C CNN
	1    3100 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5050 3300 5050
Text Notes 1200 4350 0    50   ~ 0
The MBU is disabled after reset and enabled\nwhen a Memory Bank Register is first written to.
Wire Wire Line
	2750 4750 3300 4750
Text Label 3300 4750 2    50   ~ 0
~DIS
$Comp
L power:+5V #PWR0612
U 1 1 61045B09
P 3300 5000
F 0 "#PWR0612" H 3300 4850 50  0001 C CNN
F 1 "+5V" H 3250 5150 50  0000 C CNN
F 2 "" H 3300 5000 50  0001 C CNN
F 3 "" H 3300 5000 50  0001 C CNN
	1    3300 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5000 3300 5050
Text Notes 3200 5250 2    50   ~ 0
MBU Enable
Wire Wire Line
	1800 5650 1800 5800
$Comp
L power:+5V #PWR?
U 1 1 60E66D13
P 1800 5650
AR Path="/61F95ACC/6AF25BF3/60E66D13" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/60E66D13" Ref="#PWR0622"  Part="1" 
F 0 "#PWR0622" H 1800 5500 50  0001 C CNN
F 1 "+5V" H 1815 5823 50  0000 C CNN
F 2 "" H 1800 5650 50  0001 C CNN
F 3 "" H 1800 5650 50  0001 C CNN
	1    1800 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5050 1700 6000
Connection ~ 1700 5050
Wire Wire Line
	1700 5050 1850 5050
Wire Wire Line
	2750 5700 3350 5700
Text Label 3350 5700 2    50   ~ 0
~IR-IDXR
NoConn ~ 2750 6000
Text Label 1650 1800 1    50   ~ 0
RADDR[0..4]
Text Label 1550 1800 1    50   ~ 0
WADDR[0..4]
Entry Wire Line
	1650 1500 1750 1600
Entry Wire Line
	1650 1600 1750 1700
Entry Wire Line
	1650 1700 1750 1800
Entry Wire Line
	1650 1800 1750 1900
Entry Wire Line
	1650 1900 1750 2000
Entry Wire Line
	1550 2000 1650 2100
Entry Wire Line
	1550 2100 1650 2200
Entry Wire Line
	1550 2200 1650 2300
Entry Wire Line
	1550 2300 1650 2400
Entry Wire Line
	1550 2400 1650 2500
Wire Wire Line
	1650 2100 2150 2100
Wire Wire Line
	1650 2200 2150 2200
Wire Wire Line
	1650 2300 2150 2300
Wire Wire Line
	1650 2400 2150 2400
Wire Wire Line
	1650 2500 2150 2500
Wire Bus Line
	1450 950  1250 950 
Entry Bus Bus
	1450 950  1550 1050
Entry Bus Bus
	1550 900  1650 1000
Wire Bus Line
	1500 850  1550 900 
Wire Bus Line
	1500 850  1250 850 
Text HLabel 1250 950  0    50   Input ~ 0
WADDR[0..4]
Text HLabel 1250 850  0    50   Input ~ 0
RADDR[0..4]
Text HLabel 1250 3150 0    50   Input ~ 0
IR[0..2]
Text Label 1750 3150 0    50   ~ 0
IR[0..2]
Entry Wire Line
	3700 3550 3800 3650
Entry Wire Line
	3700 3650 3800 3750
Entry Wire Line
	3700 3750 3800 3850
Entry Wire Line
	3700 3850 3800 3950
Entry Wire Line
	3700 3950 3800 4050
Entry Wire Line
	3700 4050 3800 4150
Entry Wire Line
	3700 4150 3800 4250
Entry Wire Line
	3700 4250 3800 4350
Entry Wire Line
	3700 5250 3800 5350
Entry Wire Line
	3700 5350 3800 5450
Entry Wire Line
	3700 5450 3800 5550
Entry Wire Line
	3700 5550 3800 5650
Entry Wire Line
	3700 5650 3800 5750
Entry Wire Line
	3700 5750 3800 5850
Entry Wire Line
	3700 5850 3800 5950
Entry Wire Line
	3700 5950 3800 6050
Entry Bus Bus
	3600 3300 3700 3400
Wire Bus Line
	1300 3300 3600 3300
Text HLabel 1250 3300 0    50   Input ~ 0
IBUS[0..7]
Text Label 1800 3300 0    50   ~ 0
IBUS[0..7]
Wire Bus Line
	3600 3150 1250 3150
Entry Bus Bus
	3600 3150 3700 3050
Entry Wire Line
	3700 2950 3800 2850
Entry Wire Line
	3700 2850 3800 2750
Entry Wire Line
	3700 2600 3800 2500
Wire Wire Line
	5150 2750 3800 2750
Wire Wire Line
	5250 2850 3800 2850
Wire Wire Line
	3800 2500 4200 2500
Text Label 3800 2850 0    50   ~ 0
IR2
Text Label 3800 2750 0    50   ~ 0
IR1
Text Label 3800 2500 0    50   ~ 0
IR0
Wire Wire Line
	3600 2200 4200 2200
$Comp
L power:GND #PWR0605
U 1 1 617A9385
P 9150 2900
AR Path="/61F95ACC/617A9385" Ref="#PWR0605"  Part="1" 
AR Path="/61F95ACC/6888FBA2/617A9385" Ref="#PWR?"  Part="1" 
F 0 "#PWR0605" H 9150 2650 50  0001 C CNN
F 1 "GND" H 9155 2727 50  0000 C CNN
F 2 "" H 9150 2900 50  0001 C CNN
F 3 "" H 9150 2900 50  0001 C CNN
	1    9150 2900
	-1   0    0    -1  
$EndComp
NoConn ~ 9150 2500
Entry Wire Line
	10050 1600 10150 1700
Entry Wire Line
	10050 1700 10150 1800
Entry Wire Line
	10050 1800 10150 1900
Entry Wire Line
	10050 1900 10150 2000
Entry Wire Line
	10050 2000 10150 2100
Entry Wire Line
	10050 2100 10150 2200
Entry Wire Line
	10050 2200 10150 2300
Entry Wire Line
	10050 2300 10150 2400
Entry Bus Bus
	10150 2600 10250 2700
Wire Bus Line
	10250 2700 10500 2700
Text HLabel 10500 2700 2    50   Output ~ 0
AEXT[0..7]
Entry Wire Line
	7000 6150 6900 6050
Entry Wire Line
	7000 6050 6900 5950
Entry Wire Line
	7000 5950 6900 5850
Entry Wire Line
	7000 5850 6900 5750
Entry Wire Line
	7000 5750 6900 5650
Entry Wire Line
	7000 5650 6900 5550
Entry Wire Line
	7000 5550 6900 5450
Entry Wire Line
	7000 5450 6900 5350
Entry Wire Line
	7000 4450 6900 4350
Entry Wire Line
	7000 4350 6900 4250
Entry Wire Line
	7000 4250 6900 4150
Entry Wire Line
	7000 4150 6900 4050
Entry Wire Line
	7000 4050 6900 3950
Entry Wire Line
	7000 3950 6900 3850
Entry Wire Line
	7000 3850 6900 3750
Entry Wire Line
	7000 3750 6900 3650
Entry Bus Bus
	3700 6550 3800 6650
Entry Bus Bus
	6900 6650 7000 6550
Wire Bus Line
	3800 6650 6900 6650
Text HLabel 1250 750  0    50   Input ~ 0
~FPRAM~∕ROM
Text Label 9000 750  2    50   ~ 0
~FPRAM~∕ROM
$Comp
L Device:R_Small R601
U 1 1 61D0DEA7
P 9150 1350
F 0 "R601" H 9400 1400 50  0000 R CNN
F 1 "10kΩ" H 9400 1300 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9150 1350 50  0001 C CNN
F 3 "~" H 9150 1350 50  0001 C CNN
	1    9150 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9150 1450 9150 1800
Wire Wire Line
	9150 1250 9150 750 
Wire Notes Line width 20 style solid
	11000 3500 11000 4150
$Comp
L alexios:16V8 U?
U 2 1 6239B646
P 6300 1200
AR Path="/61F95ACC/6AF25BF3/6239B646" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6239B646" Ref="U601"  Part="2" 
F 0 "U601" H 6480 1246 50  0000 L CNN
F 1 "16V8" H 6480 1155 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6300 1200 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 6300 1200 50  0001 C CNN
F 4 "mbu-decode.jed" H 6480 1109 50  0001 L CNN "Image Filename"
F 5 "MBUDEC00" V 6650 1200 50  0001 C CNB "Signature"
	2    6300 1200
	1    0    0    -1  
$EndComp
Connection ~ 5950 1100
Connection ~ 5950 1300
$Comp
L Device:C_Small C?
U 1 1 623ADD5C
P 5950 1200
AR Path="/5CC0D65F/623ADD5C" Ref="C?"  Part="1" 
AR Path="/623ADD5C" Ref="C?"  Part="1" 
AR Path="/5F3EA987/623ADD5C" Ref="C?"  Part="1" 
AR Path="/61F95ACC/623ADD5C" Ref="C601"  Part="1" 
F 0 "C601" H 5859 1246 50  0000 R CNN
F 1 "100nF" H 5859 1155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5950 1200 50  0001 C CNN
F 3 "~" H 5950 1200 50  0001 C CNN
	1    5950 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 623ADD62
P 5950 1100
AR Path="/623ADD62" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/623ADD62" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/623ADD62" Ref="#PWR0601"  Part="1" 
F 0 "#PWR0601" H 5950 950 50  0001 C CNN
F 1 "+5V" H 5965 1273 50  0000 C CNN
F 2 "" H 5950 1100 50  0001 C CNN
F 3 "" H 5950 1100 50  0001 C CNN
	1    5950 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 623ADD68
P 5950 1300
AR Path="/623ADD68" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/623ADD68" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/623ADD68" Ref="#PWR0602"  Part="1" 
F 0 "#PWR0602" H 5950 1050 50  0001 C CNN
F 1 "GND" H 5955 1127 50  0000 C CNN
F 2 "" H 5950 1300 50  0001 C CNN
F 3 "" H 5950 1300 50  0001 C CNN
	1    5950 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 623BDE16
P 5950 2400
AR Path="/5CC0D65F/623BDE16" Ref="C?"  Part="1" 
AR Path="/623BDE16" Ref="C?"  Part="1" 
AR Path="/5F3EA987/623BDE16" Ref="C?"  Part="1" 
AR Path="/61F95ACC/623BDE16" Ref="C602"  Part="1" 
F 0 "C602" H 5859 2446 50  0000 R CNN
F 1 "100nF" H 5859 2355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5950 2400 50  0001 C CNN
F 3 "~" H 5950 2400 50  0001 C CNN
	1    5950 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 623BDE1C
P 5950 2300
AR Path="/623BDE1C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/623BDE1C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/623BDE1C" Ref="#PWR0603"  Part="1" 
F 0 "#PWR0603" H 5950 2150 50  0001 C CNN
F 1 "+5V" H 5965 2473 50  0000 C CNN
F 2 "" H 5950 2300 50  0001 C CNN
F 3 "" H 5950 2300 50  0001 C CNN
	1    5950 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 623BDE22
P 5950 2500
AR Path="/623BDE22" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/623BDE22" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/623BDE22" Ref="#PWR0604"  Part="1" 
F 0 "#PWR0604" H 5950 2250 50  0001 C CNN
F 1 "GND" H 5955 2327 50  0000 C CNN
F 2 "" H 5950 2500 50  0001 C CNN
F 3 "" H 5950 2500 50  0001 C CNN
	1    5950 2500
	1    0    0    -1  
$EndComp
$Comp
L alexios:16V8 U?
U 2 1 623CB169
P 6300 2400
AR Path="/61F95ACC/6AF25BF3/623CB169" Ref="U?"  Part="1" 
AR Path="/61F95ACC/623CB169" Ref="U602"  Part="2" 
F 0 "U602" H 6480 2537 50  0000 L CNN
F 1 "16V8" H 6480 2446 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6300 2400 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 6300 2400 50  0001 C CNN
F 4 "mbu-control.jed" H 6480 2355 50  0000 L CNN "Image Filename"
F 5 "MBUCTL00" H 6480 2264 50  0000 L CNB "Signature"
	2    6300 2400
	1    0    0    -1  
$EndComp
Connection ~ 5950 2500
Connection ~ 5950 2300
Wire Notes Line width 20 style solid
	8600 8300 8600 7650
$Comp
L Device:C_Small C?
U 1 1 623F4C2F
P 2100 7350
AR Path="/5CC0D65F/623F4C2F" Ref="C?"  Part="1" 
AR Path="/623F4C2F" Ref="C?"  Part="1" 
AR Path="/5F3EA987/623F4C2F" Ref="C?"  Part="1" 
AR Path="/61F95ACC/623F4C2F" Ref="C604"  Part="1" 
F 0 "C604" H 2009 7396 50  0000 R CNN
F 1 "100nF" H 2009 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2100 7350 50  0001 C CNN
F 3 "~" H 2100 7350 50  0001 C CNN
	1    2100 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 623F4C35
P 2100 7250
AR Path="/623F4C35" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/623F4C35" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/623F4C35" Ref="#PWR0613"  Part="1" 
F 0 "#PWR0613" H 2100 7100 50  0001 C CNN
F 1 "+5V" H 2115 7423 50  0000 C CNN
F 2 "" H 2100 7250 50  0001 C CNN
F 3 "" H 2100 7250 50  0001 C CNN
	1    2100 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 623F4C3B
P 2100 7450
AR Path="/623F4C3B" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/623F4C3B" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/623F4C3B" Ref="#PWR0617"  Part="1" 
F 0 "#PWR0617" H 2100 7200 50  0001 C CNN
F 1 "GND" H 2105 7277 50  0000 C CNN
F 2 "" H 2100 7450 50  0001 C CNN
F 3 "" H 2100 7450 50  0001 C CNN
	1    2100 7450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U608
U 2 1 6245744C
P 5050 7350
F 0 "U608" H 5230 7396 50  0000 L CNN
F 1 "74HC541" H 5230 7305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5050 7350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 5050 7350 50  0001 C CNN
	2    5050 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 62457452
P 4700 7350
AR Path="/5CC0D65F/62457452" Ref="C?"  Part="1" 
AR Path="/62457452" Ref="C?"  Part="1" 
AR Path="/5F3EA987/62457452" Ref="C?"  Part="1" 
AR Path="/61F95ACC/62457452" Ref="C608"  Part="1" 
F 0 "C608" H 4609 7396 50  0000 R CNN
F 1 "100nF" H 4609 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 7350 50  0001 C CNN
F 3 "~" H 4700 7350 50  0001 C CNN
	1    4700 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62457458
P 4700 7250
AR Path="/62457458" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/62457458" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/62457458" Ref="#PWR0615"  Part="1" 
F 0 "#PWR0615" H 4700 7100 50  0001 C CNN
F 1 "+5V" H 4715 7423 50  0000 C CNN
F 2 "" H 4700 7250 50  0001 C CNN
F 3 "" H 4700 7250 50  0001 C CNN
	1    4700 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6245745E
P 4700 7450
AR Path="/6245745E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6245745E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6245745E" Ref="#PWR0619"  Part="1" 
F 0 "#PWR0619" H 4700 7200 50  0001 C CNN
F 1 "GND" H 4705 7277 50  0000 C CNN
F 2 "" H 4700 7450 50  0001 C CNN
F 3 "" H 4700 7450 50  0001 C CNN
	1    4700 7450
	1    0    0    -1  
$EndComp
Connection ~ 4700 7450
Connection ~ 4700 7250
$Comp
L alexios:74HC541 U605
U 2 1 62467195
P 3750 7350
F 0 "U605" H 3930 7396 50  0000 L CNN
F 1 "74HC541" H 3930 7305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 3750 7350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 3750 7350 50  0001 C CNN
	2    3750 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6246719B
P 3400 7350
AR Path="/5CC0D65F/6246719B" Ref="C?"  Part="1" 
AR Path="/6246719B" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6246719B" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6246719B" Ref="C605"  Part="1" 
F 0 "C605" H 3309 7396 50  0000 R CNN
F 1 "100nF" H 3309 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3400 7350 50  0001 C CNN
F 3 "~" H 3400 7350 50  0001 C CNN
	1    3400 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 624671A1
P 3400 7250
AR Path="/624671A1" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/624671A1" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/624671A1" Ref="#PWR0614"  Part="1" 
F 0 "#PWR0614" H 3400 7100 50  0001 C CNN
F 1 "+5V" H 3415 7423 50  0000 C CNN
F 2 "" H 3400 7250 50  0001 C CNN
F 3 "" H 3400 7250 50  0001 C CNN
	1    3400 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 624671A7
P 3400 7450
AR Path="/624671A7" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/624671A7" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/624671A7" Ref="#PWR0618"  Part="1" 
F 0 "#PWR0618" H 3400 7200 50  0001 C CNN
F 1 "GND" H 3405 7277 50  0000 C CNN
F 2 "" H 3400 7450 50  0001 C CNN
F 3 "" H 3400 7450 50  0001 C CNN
	1    3400 7450
	1    0    0    -1  
$EndComp
Connection ~ 3400 7450
Connection ~ 3400 7250
$Comp
L alexios:74HC541 U609
U 2 1 624671AF
P 6350 7350
F 0 "U609" H 6530 7396 50  0000 L CNN
F 1 "74HC541" H 6530 7305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6350 7350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6350 7350 50  0001 C CNN
	2    6350 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 624671B5
P 6000 7350
AR Path="/5CC0D65F/624671B5" Ref="C?"  Part="1" 
AR Path="/624671B5" Ref="C?"  Part="1" 
AR Path="/5F3EA987/624671B5" Ref="C?"  Part="1" 
AR Path="/61F95ACC/624671B5" Ref="C609"  Part="1" 
F 0 "C609" H 5909 7396 50  0000 R CNN
F 1 "100nF" H 5909 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 7350 50  0001 C CNN
F 3 "~" H 6000 7350 50  0001 C CNN
	1    6000 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 624671BB
P 6000 7250
AR Path="/624671BB" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/624671BB" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/624671BB" Ref="#PWR0616"  Part="1" 
F 0 "#PWR0616" H 6000 7100 50  0001 C CNN
F 1 "+5V" H 6015 7423 50  0000 C CNN
F 2 "" H 6000 7250 50  0001 C CNN
F 3 "" H 6000 7250 50  0001 C CNN
	1    6000 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 624671C1
P 6000 7450
AR Path="/624671C1" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/624671C1" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/624671C1" Ref="#PWR0620"  Part="1" 
F 0 "#PWR0620" H 6000 7200 50  0001 C CNN
F 1 "GND" H 6005 7277 50  0000 C CNN
F 2 "" H 6000 7450 50  0001 C CNN
F 3 "" H 6000 7450 50  0001 C CNN
	1    6000 7450
	1    0    0    -1  
$EndComp
Connection ~ 6000 7450
Connection ~ 6000 7250
Wire Wire Line
	7200 3400 7800 3400
$Comp
L alexios:6116SA15TPG U603
U 2 1 62694EBC
P 8550 3950
F 0 "U603" H 8630 3996 50  0000 L CNN
F 1 "6116SA15TPG" H 8630 3905 50  0000 L CNN
F 2 "alexios:DIP-24_W7.62mm_Socket" V 8450 3875 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/698/REN_6116_DST_20200717-1995925.pdf" H 8450 3950 50  0001 C CNN
F 4 "972-6116SA15TPG; €4.17" H 7850 2700 50  0001 L CNN "AC:BOM-Mouser"
	2    8550 3950
	1    0    0    -1  
$EndComp
Connection ~ 8100 4050
Connection ~ 8100 3850
Text Label 5400 5350 0    50   ~ 0
AEXT0
Text Label 5400 5450 0    50   ~ 0
AEXT1
Text Label 5400 5550 0    50   ~ 0
AEXT2
Text Label 5400 5650 0    50   ~ 0
AEXT3
Text Label 5400 5750 0    50   ~ 0
AEXT4
Text Label 5400 5850 0    50   ~ 0
AEXT5
Text Label 5400 5950 0    50   ~ 0
AEXT6
Text Label 5400 6050 0    50   ~ 0
AEXT7
Wire Wire Line
	5150 5350 5650 5350
Wire Wire Line
	5150 5450 5650 5450
Wire Wire Line
	5150 5550 5650 5550
Wire Wire Line
	5150 5650 5650 5650
Wire Wire Line
	5150 5750 5650 5750
Wire Wire Line
	5150 5850 5650 5850
Wire Wire Line
	5150 5950 5650 5950
Wire Wire Line
	5150 6050 5650 6050
$Comp
L alexios:6116SA15TPG U603
U 1 1 626357A5
P 8300 2400
F 0 "U603" H 8300 3467 50  0000 C CNN
F 1 "6116SA15TPG" H 8300 3376 50  0000 C CNN
F 2 "alexios:DIP-24_W7.62mm_Socket" V 8200 2325 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/698/REN_6116_DST_20200717-1995925.pdf" H 8200 2400 50  0001 C CNN
F 4 "972-6116SA15TPG; €4.17" H 7600 1150 50  0001 L CNN "AC:BOM-Mouser"
	1    8300 2400
	1    0    0    -1  
$EndComp
Text Label 7600 2400 0    50   ~ 0
CTX1
Wire Wire Line
	7800 2400 7600 2400
Text Label 7600 2300 0    50   ~ 0
CTX0
Wire Wire Line
	7800 2300 7600 2300
Wire Wire Line
	5100 1600 5450 1600
Wire Wire Line
	5100 1700 5450 1700
Wire Wire Line
	5100 1800 5450 1800
Wire Wire Line
	7800 2200 7600 2200
Wire Wire Line
	7800 2100 7600 2100
Wire Wire Line
	7800 2000 7600 2000
Text Label 7600 2200 0    50   ~ 0
RA0
Text Label 7600 2100 0    50   ~ 0
RA1
Text Label 7600 2000 0    50   ~ 0
RA2
Text HLabel 10500 2900 2    50   Output ~ 0
~WAR
Wire Wire Line
	10500 2900 10250 2900
Text Label 10250 2900 0    50   ~ 0
~WAR
Wire Wire Line
	3050 1900 3300 1900
Wire Wire Line
	3600 1900 4200 1900
Text Label 3300 2000 2    50   ~ 0
~WMBP
Wire Wire Line
	3050 2000 3300 2000
Wire Wire Line
	4200 2000 3600 2000
Wire Wire Line
	3600 2100 4200 2100
Text Label 3600 1900 0    50   ~ 0
~RMBP
Text Label 3300 2300 2    50   ~ 0
CLK4
Wire Wire Line
	7300 2000 7300 3300
Wire Wire Line
	5100 2000 7300 2000
Wire Wire Line
	7200 1900 7200 3400
Text HLabel 1250 2850 0    50   Input ~ 0
T34
Wire Wire Line
	1250 2850 1950 2850
Text Label 1950 2850 2    50   ~ 0
T34
Text Label 3800 4550 0    50   ~ 0
~WCTX
$Comp
L alexios:74HC574 U604
U 1 1 60417CE4
P 4650 4150
F 0 "U604" H 5000 3700 50  0000 L CNN
F 1 "74HC574" H 5000 3600 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4350 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 4350 4100 50  0001 C CNN
F 4 "Yes" H 4500 3200 50  0001 C CNN "Verified"
	1    4650 4150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U604
U 2 1 6041DF9E
P 2450 7350
F 0 "U604" H 2630 7396 50  0000 L CNN
F 1 "74HC574" H 2630 7305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2150 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 2150 7300 50  0001 C CNN
F 4 "Yes" H 2300 6400 50  0001 C CNN "Verified"
	2    2450 7350
	1    0    0    -1  
$EndComp
Connection ~ 2100 7450
Connection ~ 2100 7250
$Comp
L power:GND #PWR0133
U 1 1 60432B3F
P 7750 3500
F 0 "#PWR0133" H 7750 3250 50  0001 C CNN
F 1 "GND" H 7755 3327 50  0000 C CNN
F 2 "" H 7750 3500 50  0001 C CNN
F 3 "" H 7750 3500 50  0001 C CNN
	1    7750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3500 7750 3200
Wire Wire Line
	7750 3200 7800 3200
Text Label 7550 5400 0    50   ~ 0
CTX7
Text Label 7550 5300 0    50   ~ 0
CTX6
Text Label 7550 5200 0    50   ~ 0
CTX5
Text Label 7550 5100 0    50   ~ 0
CTX4
Text Label 7550 5000 0    50   ~ 0
CTX3
Text Label 7550 4900 0    50   ~ 0
CTX2
Text Label 7550 4800 0    50   ~ 0
CTX1
Text Label 7550 4700 0    50   ~ 0
CTX0
Text Label 7550 5600 0    50   ~ 0
~FPCTX
$Comp
L alexios:74HC541 U610
U 1 1 6050F357
P 8400 5200
F 0 "U610" H 8750 4850 50  0000 L CNN
F 1 "74HC541" H 8750 4750 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8400 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8400 5200 50  0001 C CNN
	1    8400 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 5600 7500 5600
Wire Wire Line
	7900 5700 7850 5700
Wire Wire Line
	7850 5700 7850 5750
$Comp
L power:GND #PWR0134
U 1 1 6050F360
P 7850 5750
F 0 "#PWR0134" H 7850 5500 50  0001 C CNN
F 1 "GND" H 7855 5577 50  0000 C CNN
F 2 "" H 7850 5750 50  0001 C CNN
F 3 "" H 7850 5750 50  0001 C CNN
	1    7850 5750
	1    0    0    -1  
$EndComp
Text Notes 8100 4500 0    100  ~ 20
CTX → FP
Wire Wire Line
	7550 4700 7900 4700
Wire Wire Line
	7550 4800 7900 4800
Wire Wire Line
	7550 4900 7900 4900
Wire Wire Line
	7550 5000 7900 5000
Wire Wire Line
	7550 5100 7900 5100
Wire Wire Line
	7550 5200 7900 5200
Wire Wire Line
	7550 5300 7900 5300
Wire Wire Line
	7550 5400 7900 5400
Text Label 9150 4700 2    50   ~ 0
FPD0
Text Label 9150 4800 2    50   ~ 0
FPD1
Text Label 9150 4900 2    50   ~ 0
FPD2
Text Label 9150 5000 2    50   ~ 0
FPD3
Text Label 9150 5100 2    50   ~ 0
FPD4
Text Label 9150 5200 2    50   ~ 0
FPD5
Text Label 9150 5300 2    50   ~ 0
FPD6
Text Label 9150 5400 2    50   ~ 0
FPD7
Text HLabel 7500 5600 0    50   Input ~ 0
~FPCTX
$Comp
L alexios:74HC541 U610
U 2 1 6061F1B9
P 8450 6300
F 0 "U610" H 8630 6346 50  0000 L CNN
F 1 "74HC541" H 8630 6255 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8450 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8450 6300 50  0001 C CNN
	2    8450 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6061F1BF
P 8100 6300
AR Path="/5CC0D65F/6061F1BF" Ref="C?"  Part="1" 
AR Path="/6061F1BF" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6061F1BF" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6061F1BF" Ref="C610"  Part="1" 
F 0 "C610" H 8009 6346 50  0000 R CNN
F 1 "100nF" H 8009 6255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8100 6300 50  0001 C CNN
F 3 "~" H 8100 6300 50  0001 C CNN
	1    8100 6300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6061F1C5
P 8100 6200
AR Path="/6061F1C5" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6061F1C5" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6061F1C5" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 8100 6050 50  0001 C CNN
F 1 "+5V" H 8115 6373 50  0000 C CNN
F 2 "" H 8100 6200 50  0001 C CNN
F 3 "" H 8100 6200 50  0001 C CNN
	1    8100 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6061F1CB
P 8100 6400
AR Path="/6061F1CB" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6061F1CB" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6061F1CB" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 8100 6150 50  0001 C CNN
F 1 "GND" H 8105 6227 50  0000 C CNN
F 2 "" H 8100 6400 50  0001 C CNN
F 3 "" H 8100 6400 50  0001 C CNN
	1    8100 6400
	1    0    0    -1  
$EndComp
Connection ~ 8100 6400
Connection ~ 8100 6200
Wire Wire Line
	8900 4700 9200 4700
Wire Wire Line
	8900 4800 9200 4800
Wire Wire Line
	8900 4900 9200 4900
Wire Wire Line
	8900 5000 9200 5000
Wire Wire Line
	8900 5100 9200 5100
Wire Wire Line
	8900 5200 9200 5200
Wire Wire Line
	8900 5300 9200 5300
Wire Wire Line
	8900 5400 9200 5400
Entry Wire Line
	9200 4700 9300 4800
Entry Wire Line
	9200 4800 9300 4900
Entry Wire Line
	9200 4900 9300 5000
Entry Wire Line
	9200 5000 9300 5100
Entry Wire Line
	9200 5100 9300 5200
Entry Wire Line
	9200 5200 9300 5300
Entry Wire Line
	9200 5300 9300 5400
Entry Wire Line
	9200 5400 9300 5500
Entry Bus Bus
	9300 5700 9400 5800
Wire Bus Line
	9400 5800 9650 5800
Text HLabel 9650 5800 2    50   3State ~ 0
FPD[0..7]
Wire Wire Line
	1250 750  9150 750 
Wire Notes Line width 20 style solid
	9450 750  9450 1350
Wire Notes Line width 20 style solid
	11100 1350 9450 1350
Wire Notes Line width 20 style solid
	9450 750  11100 750 
Text Notes 9550 1250 0    50   ~ 0
Register file address and data buses\nhave been rearranged to ease routing.
Text Notes 9550 950  0    50   ~ 10
Signals not in order!
Wire Notes Line width 20 style solid
	11100 750  11100 1350
$Comp
L Device:R_Network08 RN?
U 1 1 617A93A1
P 9550 2700
AR Path="/61F95ACC/6888FBA2/617A93A1" Ref="RN?"  Part="1" 
AR Path="/61F95ACC/617A93A1" Ref="RN601"  Part="1" 
F 0 "RN601" H 9070 2654 50  0000 R CNN
F 1 "10kΩ" H 9070 2745 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10025 2700 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9550 2700 50  0001 C CNN
	1    9550 2700
	1    0    0    1   
$EndComp
Wire Wire Line
	8800 2200 9750 2200
Wire Wire Line
	8800 2100 9650 2100
Wire Wire Line
	8800 2000 9550 2000
Wire Wire Line
	8800 1600 9350 1600
Wire Wire Line
	8800 1700 9250 1700
Wire Wire Line
	8800 1800 9150 1800
Connection ~ 9150 1800
Wire Wire Line
	9150 1800 10050 1800
Wire Wire Line
	9250 2500 9250 1700
Connection ~ 9250 1700
Wire Wire Line
	9250 1700 10050 1700
Wire Wire Line
	9350 2500 9350 1600
Connection ~ 9350 1600
Wire Wire Line
	9350 1600 10050 1600
Wire Wire Line
	9450 2500 9450 1900
Wire Wire Line
	8800 1900 9450 1900
Connection ~ 9450 1900
Wire Wire Line
	9450 1900 10050 1900
Wire Wire Line
	9550 2500 9550 2000
Connection ~ 9550 2000
Wire Wire Line
	9550 2000 10050 2000
Wire Wire Line
	9650 2500 9650 2100
Connection ~ 9650 2100
Wire Wire Line
	9650 2100 10050 2100
Wire Wire Line
	9750 2500 9750 2200
Connection ~ 9750 2200
Wire Wire Line
	9750 2200 10050 2200
Wire Wire Line
	9850 2500 9850 2300
Wire Wire Line
	8800 2300 9850 2300
Connection ~ 9850 2300
Wire Wire Line
	9850 2300 10050 2300
$Comp
L power:GND #PWR0143
U 1 1 60789539
P 5650 6350
F 0 "#PWR0143" H 5650 6100 50  0001 C CNN
F 1 "GND" H 5655 6177 50  0000 C CNN
F 2 "" H 5650 6350 50  0001 C CNN
F 3 "" H 5650 6350 50  0001 C CNN
	1    5650 6350
	1    0    0    -1  
$EndComp
Wire Bus Line
	3700 2600 3700 3050
Wire Bus Line
	1550 1050 1550 2400
Wire Bus Line
	1650 1000 1650 1900
Wire Bus Line
	9300 4800 9300 5700
Wire Bus Line
	10150 1700 10150 2600
Wire Bus Line
	7000 3750 7000 6550
Wire Bus Line
	3700 3400 3700 6550
$EndSCHEMATC
