EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 8
Title "MBU Address Selection"
Date ""
Rev "2006"
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 "mbu.v"
$EndDescr
$Comp
L alexios:74LVC1G32 U?
U 1 1 6AF7C184
P 2900 4000
AR Path="/61F95ACC/6AF7C184" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C184" Ref="U41"  Part="1" 
F 0 "U41" H 3050 3900 50  0000 L CNN
F 1 "74LVC1G32" H 3050 3800 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3010 3980 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3010 3980 50  0001 C CNN
	1    2900 4000
	1    0    0    -1  
$EndComp
Text Notes 2250 5100 0    50   ~ 0
MBRs are written by:\n\n1. ~WRITE_MBP~ (address 0 always selected)\n2. ~WRITE_MBP+FLAGS~ (address 0 always selected)\n3. I/O Space writes (address is in AB[2:0])\n\nLogic here: select address 0 unless ~IOWMBR~\nasserted.
Text Notes 8000 5550 0    50   ~ 0
MBRs are read by:\n\n1. ~READ_MBP~ (address 0 always selected)\n2. ~READ_MBP+FLAGS~ (address 0 always selected)\n3. ~WRITE_AR_MBx~ (address in IR[2:0])\n    if IDXEN is low, address is 3 (011)\n    if IDXEN is high, address is IR[1:0] (range 0-3 only)\n4. I/O Space reads (address is in AB[1:0])\n\nValue should always be &00 or &80 if ~DIS~ is\nasserted.
Text Notes 8000 6300 0    50   ~ 0
~DIS~\n\n0\n1\n1\n1\n
Text Notes 8150 6300 0    50   ~ 0
~RMBP~\n\nX\n0\n1\n1\n
Text Notes 8400 6300 0    50   ~ 0
~IOMBR~\n\nX\nX\n0\n1\n
Text Notes 8750 6300 0    50   ~ 0
~WA~\n\n000\n000\nAB[2:0]\nIR[1:0]\n
Text Notes 9150 6300 0    50   ~ 0
~Why~\n\nMBR init, gate disabled\nReading MB0, gate disabled\nI/O space read (IN)\nMBx:AR Indexing\n
$Comp
L alexios:74LVC2G157 U?
U 1 1 6AF7C191
P 2850 1750
AR Path="/61F95ACC/6AF7C191" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C191" Ref="U16"  Part="1" 
F 0 "U16" H 2850 2117 50  0000 C CNN
F 1 "74LVC2G157" H 2850 2026 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 2750 1875 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 2750 1875 50  0001 C CNN
	1    2850 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1650 1500 1650
Text Label 1600 1650 0    50   ~ 0
AB0
Text Label 3450 1650 2    50   ~ 0
WA0
Text Label 1550 1850 0    50   ~ 0
~IOMBR
NoConn ~ 3200 1950
Wire Wire Line
	2500 1750 2450 1750
$Comp
L power:GND #PWR?
U 1 1 6AF7C19F
P 2450 2000
AR Path="/61F95ACC/6AF7C19F" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C19F" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 2450 1750 50  0001 C CNN
F 1 "GND" H 2455 1827 50  0000 C CNN
F 2 "" H 2450 2000 50  0001 C CNN
F 3 "" H 2450 2000 50  0001 C CNN
	1    2450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1750 2450 1950
Wire Wire Line
	2500 1950 2450 1950
Connection ~ 2450 1950
Wire Wire Line
	2450 1950 2450 2000
$Comp
L alexios:74LVC2G157 U?
U 1 1 6AF7C1A9
P 2850 2550
AR Path="/61F95ACC/6AF7C1A9" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C1A9" Ref="U25"  Part="1" 
F 0 "U25" H 2850 2917 50  0000 C CNN
F 1 "74LVC2G157" H 2850 2826 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 2750 2675 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 2750 2675 50  0001 C CNN
	1    2850 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2450 1500 2450
Text Label 1500 2450 0    50   ~ 0
AB1
Wire Wire Line
	3200 2450 3500 2450
Text Label 3450 2450 2    50   ~ 0
WA1
Wire Wire Line
	2500 2650 1500 2650
Text Label 1500 2650 0    50   ~ 0
~IOMBR
NoConn ~ 3200 2750
Wire Wire Line
	2500 2550 2450 2550
$Comp
L power:GND #PWR?
U 1 1 6AF7C1B7
P 2450 2800
AR Path="/61F95ACC/6AF7C1B7" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C1B7" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 2450 2550 50  0001 C CNN
F 1 "GND" H 2455 2627 50  0000 C CNN
F 2 "" H 2450 2800 50  0001 C CNN
F 3 "" H 2450 2800 50  0001 C CNN
	1    2450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2550 2450 2750
Wire Wire Line
	2500 2750 2450 2750
Connection ~ 2450 2750
Wire Wire Line
	2450 2750 2450 2800
$Comp
L alexios:74LVC2G157 U?
U 1 1 6AF7C1C1
P 2850 3350
AR Path="/61F95ACC/6AF7C1C1" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C1C1" Ref="U29"  Part="1" 
F 0 "U29" H 2850 3717 50  0000 C CNN
F 1 "74LVC2G157" H 2850 3626 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 2750 3475 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 2750 3475 50  0001 C CNN
	1    2850 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3250 1500 3250
Text Label 1500 3250 0    50   ~ 0
AB2
Wire Wire Line
	2500 3350 2450 3350
$Comp
L power:GND #PWR?
U 1 1 6AF7C1CC
P 2450 3600
AR Path="/61F95ACC/6AF7C1CC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C1CC" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 2450 3350 50  0001 C CNN
F 1 "GND" H 2455 3427 50  0000 C CNN
F 2 "" H 2450 3600 50  0001 C CNN
F 3 "" H 2450 3600 50  0001 C CNN
	1    2450 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3350 2450 3550
Wire Wire Line
	2500 3550 2450 3550
Connection ~ 2450 3550
Wire Wire Line
	2450 3550 2450 3600
Text Notes 2650 3750 0    50   ~ 0
tpd≅1–4ns
Text Label 8250 1650 2    50   ~ 0
IR0
Wire Wire Line
	8300 1950 8250 1950
$Comp
L power:GND #PWR?
U 1 1 6AF7C1D9
P 8250 2000
AR Path="/61F95ACC/6AF7C1D9" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C1D9" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 8250 1750 50  0001 C CNN
F 1 "GND" H 8255 1827 50  0000 C CNN
F 2 "" H 8250 2000 50  0001 C CNN
F 3 "" H 8250 2000 50  0001 C CNN
	1    8250 2000
	1    0    0    -1  
$EndComp
NoConn ~ 9000 1950
$Comp
L alexios:74LVC2G157 U?
U 1 1 6AF7C1E0
P 8650 1750
AR Path="/61F95ACC/6AF7C1E0" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C1E0" Ref="U20"  Part="1" 
F 0 "U20" H 8650 2117 50  0000 C CNN
F 1 "74LVC2G157" H 8650 2026 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 8550 1875 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 8550 1875 50  0001 C CNN
	1    8650 1750
	1    0    0    -1  
$EndComp
Text Label 8250 2400 2    50   ~ 0
IR1
Wire Wire Line
	8300 2700 8250 2700
$Comp
L power:GND #PWR?
U 1 1 6AF7C1E9
P 8250 2750
AR Path="/61F95ACC/6AF7C1E9" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C1E9" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 8250 2500 50  0001 C CNN
F 1 "GND" H 8255 2577 50  0000 C CNN
F 2 "" H 8250 2750 50  0001 C CNN
F 3 "" H 8250 2750 50  0001 C CNN
	1    8250 2750
	1    0    0    -1  
$EndComp
NoConn ~ 9000 2700
$Comp
L alexios:74LVC2G157 U?
U 1 1 6AF7C1F0
P 8650 2500
AR Path="/61F95ACC/6AF7C1F0" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C1F0" Ref="U23"  Part="1" 
F 0 "U23" H 8650 2867 50  0000 C CNN
F 1 "74LVC2G157" H 8650 2776 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 8550 2625 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 8550 2625 50  0001 C CNN
	1    8650 2500
	1    0    0    -1  
$EndComp
Text Notes 2900 4200 2    50   ~ 0
tpd≅4ns max
$Comp
L alexios:74LVC1G0832 U?
U 1 1 6AF7C1F7
P 4550 3150
AR Path="/61F95ACC/6AF7C1F7" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C1F7" Ref="U26"  Part="1" 
F 0 "U26" H 4575 3464 50  0000 C CNN
F 1 "74LVC1G0832" H 4575 3373 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4550 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 4550 3150 50  0001 C CNN
	1    4550 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3250 4200 3250
Text Label 1500 4300 0    50   ~ 0
~WBMP
Text Label 3200 4000 0    50   ~ 0
~IOWMBR
$Comp
L alexios:74LVC1G0832 U?
U 1 1 6AF7C200
P 4550 3650
AR Path="/61F95ACC/6AF7C200" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C200" Ref="U40"  Part="1" 
F 0 "U40" H 4575 3369 50  0000 C CNN
F 1 "74LVC1G0832" H 4575 3460 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4550 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 4550 3650 50  0001 C CNN
	1    4550 3650
	1    0    0    1   
$EndComp
Wire Wire Line
	3200 3550 4200 3550
Wire Wire Line
	3700 3750 3700 3050
Wire Wire Line
	3700 3050 4200 3050
Wire Wire Line
	3800 3650 3800 3150
Wire Wire Line
	3800 3150 4200 3150
Text Label 4200 3150 2    50   ~ 0
~WBMP
Text Label 4200 3650 2    50   ~ 0
~WBMP
Wire Wire Line
	3800 3650 4200 3650
Wire Wire Line
	3700 3750 4200 3750
Wire Wire Line
	3800 4300 3800 3650
Wire Wire Line
	1500 4300 3800 4300
Connection ~ 3800 3650
Wire Wire Line
	3700 4000 3700 3750
Wire Wire Line
	3200 4000 3700 4000
Connection ~ 3700 3750
Text Notes 4350 3900 0    50   ~ 0
tpd≅1.2–4ns
Text Notes 4500 5000 0    50   ~ 0
Timing: ~WEN0~ & ~WEN1~ are latch enables and must be asserted\n>10ns after WA0 & WA1 change. The WA0 & WA1 muxes change on\n~IOMBR~ which happens early during T3. ~IOWMBR~ strobes in\nsync with the ~W~ strobe, which comes during T4, at least 62.5ns\nafter T3.
Text Label 5250 3650 2    50   ~ 0
~WEN1
Text Label 5250 3150 2    50   ~ 0
~WEN0
Text Label 4200 3750 2    50   ~ 0
~IOWMBR
Text Label 4200 3050 2    50   ~ 0
~IOWMBR
Wire Wire Line
	2100 3950 2700 3950
Wire Wire Line
	2700 4050 1500 4050
Text Label 1500 4050 0    50   ~ 0
~W
Text Label 2650 3950 2    50   ~ 0
~IOMBR
Text Label 8250 1750 2    50   ~ 0
WADDR0
Text Label 8250 2500 2    50   ~ 0
WADDR1
Wire Wire Line
	8300 1850 7800 1850
Wire Wire Line
	7800 2600 8300 2600
Wire Wire Line
	8300 3450 8250 3450
$Comp
L power:GND #PWR?
U 1 1 6AF7C23F
P 8250 3500
AR Path="/61F95ACC/6AF7C23F" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C23F" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 8250 3250 50  0001 C CNN
F 1 "GND" H 8255 3327 50  0000 C CNN
F 2 "" H 8250 3500 50  0001 C CNN
F 3 "" H 8250 3500 50  0001 C CNN
	1    8250 3500
	1    0    0    -1  
$EndComp
NoConn ~ 9000 3450
$Comp
L alexios:74LVC2G157 U?
U 1 1 6AF7C246
P 8650 3250
AR Path="/61F95ACC/6AF7C246" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C246" Ref="U27"  Part="1" 
F 0 "U27" H 8650 3617 50  0000 C CNN
F 1 "74LVC2G157" H 8650 3526 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 8550 3375 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 8550 3375 50  0001 C CNN
	1    8650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2600 7800 3350
Connection ~ 7800 2600
Wire Wire Line
	8250 3450 8250 3500
Wire Wire Line
	8250 1950 8250 2000
Wire Wire Line
	9000 3150 9750 3150
Wire Wire Line
	9000 2400 9750 2400
Wire Wire Line
	9000 1650 9750 1650
Text Label 9350 1650 0    50   ~ 0
CUR0
Text Label 9350 1750 0    50   ~ 0
AB0
Text Label 9350 2500 0    50   ~ 0
AB1
Text Label 9350 2400 0    50   ~ 0
CUR1
Text Label 9350 3150 0    50   ~ 0
CUR2
Text Label 9350 3250 0    50   ~ 0
AB2
Wire Wire Line
	9750 3250 9350 3250
Text Label 9350 1850 0    50   ~ 0
~WAR
Text Label 9350 2600 0    50   ~ 0
~WAR
Text Label 9350 3350 0    50   ~ 0
~WAR
Text Label 9350 3450 0    50   ~ 0
~RG
Text Notes 10500 3550 0    50   ~ 0
≡~RA2~
Text Label 10700 3450 2    50   ~ 0
~REN1
Text Notes 10500 3250 0    50   ~ 0
≡RA2
$Comp
L alexios:74LVC2G157 U?
U 1 1 6AF7C268
P 10100 3250
AR Path="/61F95ACC/6AF7C268" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C268" Ref="U28"  Part="1" 
F 0 "U28" H 10100 3617 50  0000 C CNN
F 1 "74LVC2G157" H 10100 3526 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 10000 3375 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 10000 3375 50  0001 C CNN
	1    10100 3250
	1    0    0    -1  
$EndComp
Text Label 10700 3150 2    50   ~ 0
~REN0
Text Label 9350 2700 0    50   ~ 0
~RG
$Comp
L alexios:74LVC2G157 U?
U 1 1 6AF7C274
P 10100 2500
AR Path="/61F95ACC/6AF7C274" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C274" Ref="U24"  Part="1" 
F 0 "U24" H 10100 2867 50  0000 C CNN
F 1 "74LVC2G157" H 10100 2776 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 10000 2625 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 10000 2625 50  0001 C CNN
	1    10100 2500
	1    0    0    -1  
$EndComp
NoConn ~ 10450 2700
Text Label 10700 2400 2    50   ~ 0
RA1
Wire Wire Line
	9750 2500 9350 2500
Text Label 9350 1950 0    50   ~ 0
~RG
$Comp
L alexios:74LVC2G157 U?
U 1 1 6AF7C281
P 10100 1750
AR Path="/61F95ACC/6AF7C281" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6AF7C281" Ref="U21"  Part="1" 
F 0 "U21" H 10100 2117 50  0000 C CNN
F 1 "74LVC2G157" H 10100 2026 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 10000 1875 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 10000 1875 50  0001 C CNN
	1    10100 1750
	1    0    0    -1  
$EndComp
NoConn ~ 10450 1950
Text Label 10700 1650 2    50   ~ 0
RA0
Wire Wire Line
	9750 1750 9350 1750
Wire Wire Line
	4950 3150 5300 3150
Wire Wire Line
	4950 3650 5300 3650
Text HLabel 5300 3150 2    50   Output ~ 0
~WEN0
Text HLabel 5300 3650 2    50   Output ~ 0
~WEN1
Text HLabel 1500 1650 0    50   Input ~ 0
AB0
Text HLabel 1500 2450 0    50   Input ~ 0
AB1
Text HLabel 1500 3250 0    50   Input ~ 0
AB2
Text HLabel 1500 1850 0    50   Input ~ 0
~IOMBR
Text HLabel 1500 4050 0    50   Input ~ 0
~W
Text HLabel 1500 4300 0    50   Input ~ 0
~WMBP
Wire Wire Line
	2100 1850 1500 1850
Wire Wire Line
	2500 1850 2100 1850
Connection ~ 2100 1850
Connection ~ 2100 3450
Wire Wire Line
	2100 3450 2100 3950
Wire Wire Line
	2500 3450 2100 3450
Wire Wire Line
	2100 3450 2100 1850
Text Label 2400 1850 2    50   ~ 0
~IOMBR
Text Label 2400 1650 2    50   ~ 0
AB0
Text Label 2400 2450 2    50   ~ 0
AB1
Text Label 2400 2650 2    50   ~ 0
~IOMBR
Text Label 2400 3250 2    50   ~ 0
AB2
Text Label 2400 3450 2    50   ~ 0
~IOMBR
Text Label 2650 4050 2    50   ~ 0
~W
Wire Wire Line
	3200 1650 3500 1650
Text HLabel 3500 1650 2    50   Output ~ 0
WA0
Text HLabel 3500 2450 2    50   Output ~ 0
WA1
Text HLabel 6750 1750 0    50   Input ~ 0
WADDR0
Text Label 7350 2500 2    50   ~ 0
WADDR1
Text HLabel 6750 2500 0    50   Input ~ 0
WADDR1
Wire Wire Line
	6750 1650 8300 1650
Text HLabel 6750 1650 0    50   Input ~ 0
IR0
Wire Wire Line
	6750 2400 8300 2400
Text HLabel 6750 2400 0    50   Input ~ 0
IR1
Wire Wire Line
	8250 2700 8250 2750
Wire Wire Line
	9150 3350 9750 3350
Wire Wire Line
	9250 3450 9250 2700
Wire Wire Line
	9250 3450 9750 3450
Wire Wire Line
	9250 1950 9750 1950
Wire Wire Line
	9150 1850 9750 1850
Wire Wire Line
	9150 1850 9150 2600
Wire Wire Line
	9150 2600 9750 2600
Connection ~ 9150 2600
Wire Wire Line
	9150 2600 9150 3350
Wire Wire Line
	9250 2700 9750 2700
Connection ~ 9250 2700
Wire Wire Line
	9250 2700 9250 1950
Text HLabel 6750 3900 0    50   Input ~ 0
~RG
Text HLabel 6750 3800 0    50   Input ~ 0
~WAR
Wire Wire Line
	10450 1650 10750 1650
Wire Wire Line
	10450 2400 10750 2400
Wire Wire Line
	10450 3150 10750 3150
Wire Wire Line
	10450 3450 10750 3450
Text HLabel 10750 1650 2    50   Output ~ 0
RA0
Text HLabel 10750 2400 2    50   Output ~ 0
RA1
Text HLabel 10750 3150 2    50   Output ~ 0
~REN0
Text HLabel 10750 3450 2    50   Output ~ 0
~REN1
Text Label 7350 2400 2    50   ~ 0
IR1
Text Notes 7200 1000 0    100  ~ 20
Read Address Selection
Text Notes 2250 1000 0    100  ~ 20
Write Address Selection
$Comp
L alexios:74LVC2G157 U?
U 2 1 6B026E34
P 1450 7200
AR Path="/61F95ACC/6B026E34" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B026E34" Ref="U25"  Part="2" 
F 0 "U25" H 1630 7246 50  0000 L CNN
F 1 "74LVC2G157" H 1630 7155 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 1350 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 1350 7325 50  0001 C CNN
	2    1450 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B02B3A7
P 1100 7300
AR Path="/6B02B3A7" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B02B3A7" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B02B3A7" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B02B3A7" Ref="#PWR073"  Part="1" 
F 0 "#PWR073" H 1100 7050 50  0001 C CNN
F 1 "GND" H 1105 7127 50  0000 C CNN
F 2 "" H 1100 7300 50  0001 C CNN
F 3 "" H 1100 7300 50  0001 C CNN
	1    1100 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B02B3AD
P 1100 7100
AR Path="/6B02B3AD" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B02B3AD" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B02B3AD" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B02B3AD" Ref="#PWR069"  Part="1" 
F 0 "#PWR069" H 1100 6950 50  0001 C CNN
F 1 "+5V" H 1115 7273 50  0000 C CNN
F 2 "" H 1100 7100 50  0001 C CNN
F 3 "" H 1100 7100 50  0001 C CNN
	1    1100 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B02B3B3
P 1100 7200
AR Path="/5CC0D65F/6B02B3B3" Ref="C?"  Part="1" 
AR Path="/6B02B3B3" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B02B3B3" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B02B3B3" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B02B3B3" Ref="C48"  Part="1" 
F 0 "C48" H 1009 7246 50  0000 R CNN
F 1 "100nF" H 1009 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1100 7200 50  0001 C CNN
F 3 "~" H 1100 7200 50  0001 C CNN
	1    1100 7200
	1    0    0    -1  
$EndComp
Connection ~ 1100 7100
Connection ~ 1100 7300
$Comp
L alexios:74LVC2G157 U?
U 2 1 6B037A82
P 1450 6550
AR Path="/61F95ACC/6B037A82" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B037A82" Ref="U20"  Part="2" 
F 0 "U20" H 1630 6596 50  0000 L CNN
F 1 "74LVC2G157" H 1630 6505 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 1350 6675 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 1350 6675 50  0001 C CNN
	2    1450 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B037A88
P 1100 6650
AR Path="/6B037A88" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B037A88" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B037A88" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B037A88" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H 1100 6400 50  0001 C CNN
F 1 "GND" H 1105 6477 50  0000 C CNN
F 2 "" H 1100 6650 50  0001 C CNN
F 3 "" H 1100 6650 50  0001 C CNN
	1    1100 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B037A8E
P 1100 6450
AR Path="/6B037A8E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B037A8E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B037A8E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B037A8E" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 1100 6300 50  0001 C CNN
F 1 "+5V" H 1115 6623 50  0000 C CNN
F 2 "" H 1100 6450 50  0001 C CNN
F 3 "" H 1100 6450 50  0001 C CNN
	1    1100 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B037A94
P 1100 6550
AR Path="/5CC0D65F/6B037A94" Ref="C?"  Part="1" 
AR Path="/6B037A94" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B037A94" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B037A94" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B037A94" Ref="C26"  Part="1" 
F 0 "C26" H 1009 6596 50  0000 R CNN
F 1 "100nF" H 1009 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1100 6550 50  0001 C CNN
F 3 "~" H 1100 6550 50  0001 C CNN
	1    1100 6550
	1    0    0    -1  
$EndComp
Connection ~ 1100 6450
Connection ~ 1100 6650
$Comp
L alexios:74LVC2G157 U?
U 2 1 6B041BA6
P 2900 7200
AR Path="/61F95ACC/6B041BA6" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B041BA6" Ref="U27"  Part="2" 
F 0 "U27" H 3080 7246 50  0000 L CNN
F 1 "74LVC2G157" H 3080 7155 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 2800 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 2800 7325 50  0001 C CNN
	2    2900 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B041BAC
P 2550 7300
AR Path="/6B041BAC" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B041BAC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B041BAC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B041BAC" Ref="#PWR074"  Part="1" 
F 0 "#PWR074" H 2550 7050 50  0001 C CNN
F 1 "GND" H 2555 7127 50  0000 C CNN
F 2 "" H 2550 7300 50  0001 C CNN
F 3 "" H 2550 7300 50  0001 C CNN
	1    2550 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B041BB2
P 2550 7100
AR Path="/6B041BB2" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B041BB2" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B041BB2" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B041BB2" Ref="#PWR070"  Part="1" 
F 0 "#PWR070" H 2550 6950 50  0001 C CNN
F 1 "+5V" H 2565 7273 50  0000 C CNN
F 2 "" H 2550 7100 50  0001 C CNN
F 3 "" H 2550 7100 50  0001 C CNN
	1    2550 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B041BB8
P 2550 7200
AR Path="/5CC0D65F/6B041BB8" Ref="C?"  Part="1" 
AR Path="/6B041BB8" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B041BB8" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B041BB8" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B041BB8" Ref="C49"  Part="1" 
F 0 "C49" H 2459 7246 50  0000 R CNN
F 1 "100nF" H 2459 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 7200 50  0001 C CNN
F 3 "~" H 2550 7200 50  0001 C CNN
	1    2550 7200
	1    0    0    -1  
$EndComp
Connection ~ 2550 7100
Connection ~ 2550 7300
$Comp
L alexios:74LVC2G157 U?
U 2 1 6B041BC0
P 2900 6550
AR Path="/61F95ACC/6B041BC0" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B041BC0" Ref="U21"  Part="2" 
F 0 "U21" H 3080 6596 50  0000 L CNN
F 1 "74LVC2G157" H 3080 6505 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 2800 6675 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 2800 6675 50  0001 C CNN
	2    2900 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B041BC6
P 2550 6650
AR Path="/6B041BC6" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B041BC6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B041BC6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B041BC6" Ref="#PWR064"  Part="1" 
F 0 "#PWR064" H 2550 6400 50  0001 C CNN
F 1 "GND" H 2555 6477 50  0000 C CNN
F 2 "" H 2550 6650 50  0001 C CNN
F 3 "" H 2550 6650 50  0001 C CNN
	1    2550 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B041BCC
P 2550 6450
AR Path="/6B041BCC" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B041BCC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B041BCC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B041BCC" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 2550 6300 50  0001 C CNN
F 1 "+5V" H 2565 6623 50  0000 C CNN
F 2 "" H 2550 6450 50  0001 C CNN
F 3 "" H 2550 6450 50  0001 C CNN
	1    2550 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B041BD2
P 2550 6550
AR Path="/5CC0D65F/6B041BD2" Ref="C?"  Part="1" 
AR Path="/6B041BD2" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B041BD2" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B041BD2" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B041BD2" Ref="C45"  Part="1" 
F 0 "C45" H 2459 6596 50  0000 R CNN
F 1 "100nF" H 2459 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 6550 50  0001 C CNN
F 3 "~" H 2550 6550 50  0001 C CNN
	1    2550 6550
	1    0    0    -1  
$EndComp
Connection ~ 2550 6450
Connection ~ 2550 6650
$Comp
L alexios:74LVC2G157 U?
U 2 1 6B0455E4
P 4350 7200
AR Path="/61F95ACC/6B0455E4" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B0455E4" Ref="U28"  Part="2" 
F 0 "U28" H 4530 7246 50  0000 L CNN
F 1 "74LVC2G157" H 4530 7155 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 4250 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 4250 7325 50  0001 C CNN
	2    4350 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B0455EA
P 4000 7300
AR Path="/6B0455EA" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B0455EA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B0455EA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B0455EA" Ref="#PWR075"  Part="1" 
F 0 "#PWR075" H 4000 7050 50  0001 C CNN
F 1 "GND" H 4005 7127 50  0000 C CNN
F 2 "" H 4000 7300 50  0001 C CNN
F 3 "" H 4000 7300 50  0001 C CNN
	1    4000 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B0455F0
P 4000 7100
AR Path="/6B0455F0" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B0455F0" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B0455F0" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B0455F0" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H 4000 6950 50  0001 C CNN
F 1 "+5V" H 4015 7273 50  0000 C CNN
F 2 "" H 4000 7100 50  0001 C CNN
F 3 "" H 4000 7100 50  0001 C CNN
	1    4000 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B0455F6
P 4000 7200
AR Path="/5CC0D65F/6B0455F6" Ref="C?"  Part="1" 
AR Path="/6B0455F6" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B0455F6" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B0455F6" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B0455F6" Ref="C50"  Part="1" 
F 0 "C50" H 3909 7246 50  0000 R CNN
F 1 "100nF" H 3909 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4000 7200 50  0001 C CNN
F 3 "~" H 4000 7200 50  0001 C CNN
	1    4000 7200
	1    0    0    -1  
$EndComp
Connection ~ 4000 7100
Connection ~ 4000 7300
$Comp
L alexios:74LVC2G157 U?
U 2 1 6B0455FE
P 4350 6550
AR Path="/61F95ACC/6B0455FE" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B0455FE" Ref="U23"  Part="2" 
F 0 "U23" H 4530 6596 50  0000 L CNN
F 1 "74LVC2G157" H 4530 6505 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 4250 6675 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 4250 6675 50  0001 C CNN
	2    4350 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B045604
P 4000 6650
AR Path="/6B045604" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B045604" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B045604" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B045604" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 4000 6400 50  0001 C CNN
F 1 "GND" H 4005 6477 50  0000 C CNN
F 2 "" H 4000 6650 50  0001 C CNN
F 3 "" H 4000 6650 50  0001 C CNN
	1    4000 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B04560A
P 4000 6450
AR Path="/6B04560A" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B04560A" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B04560A" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04560A" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 4000 6300 50  0001 C CNN
F 1 "+5V" H 4015 6623 50  0000 C CNN
F 2 "" H 4000 6450 50  0001 C CNN
F 3 "" H 4000 6450 50  0001 C CNN
	1    4000 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B045610
P 4000 6550
AR Path="/5CC0D65F/6B045610" Ref="C?"  Part="1" 
AR Path="/6B045610" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B045610" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B045610" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B045610" Ref="C46"  Part="1" 
F 0 "C46" H 3909 6596 50  0000 R CNN
F 1 "100nF" H 3909 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4000 6550 50  0001 C CNN
F 3 "~" H 4000 6550 50  0001 C CNN
	1    4000 6550
	1    0    0    -1  
$EndComp
Connection ~ 4000 6450
Connection ~ 4000 6650
$Comp
L alexios:74LVC2G157 U?
U 2 1 6B04A192
P 5800 7200
AR Path="/61F95ACC/6B04A192" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04A192" Ref="U29"  Part="2" 
F 0 "U29" H 5980 7246 50  0000 L CNN
F 1 "74LVC2G157" H 5980 7155 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 5700 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 5700 7325 50  0001 C CNN
	2    5800 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B04A198
P 5450 7300
AR Path="/6B04A198" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B04A198" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B04A198" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04A198" Ref="#PWR076"  Part="1" 
F 0 "#PWR076" H 5450 7050 50  0001 C CNN
F 1 "GND" H 5455 7127 50  0000 C CNN
F 2 "" H 5450 7300 50  0001 C CNN
F 3 "" H 5450 7300 50  0001 C CNN
	1    5450 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B04A19E
P 5450 7100
AR Path="/6B04A19E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B04A19E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B04A19E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04A19E" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 5450 6950 50  0001 C CNN
F 1 "+5V" H 5465 7273 50  0000 C CNN
F 2 "" H 5450 7100 50  0001 C CNN
F 3 "" H 5450 7100 50  0001 C CNN
	1    5450 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B04A1A4
P 5450 7200
AR Path="/5CC0D65F/6B04A1A4" Ref="C?"  Part="1" 
AR Path="/6B04A1A4" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B04A1A4" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B04A1A4" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04A1A4" Ref="C51"  Part="1" 
F 0 "C51" H 5359 7246 50  0000 R CNN
F 1 "100nF" H 5359 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 7200 50  0001 C CNN
F 3 "~" H 5450 7200 50  0001 C CNN
	1    5450 7200
	1    0    0    -1  
$EndComp
Connection ~ 5450 7100
Connection ~ 5450 7300
$Comp
L alexios:74LVC2G157 U?
U 2 1 6B04A1AC
P 5800 6550
AR Path="/61F95ACC/6B04A1AC" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04A1AC" Ref="U24"  Part="2" 
F 0 "U24" H 5980 6596 50  0000 L CNN
F 1 "74LVC2G157" H 5980 6505 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 5700 6675 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 5700 6675 50  0001 C CNN
	2    5800 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B04A1B2
P 5450 6650
AR Path="/6B04A1B2" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B04A1B2" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B04A1B2" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04A1B2" Ref="#PWR067"  Part="1" 
F 0 "#PWR067" H 5450 6400 50  0001 C CNN
F 1 "GND" H 5455 6477 50  0000 C CNN
F 2 "" H 5450 6650 50  0001 C CNN
F 3 "" H 5450 6650 50  0001 C CNN
	1    5450 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B04A1B8
P 5450 6450
AR Path="/6B04A1B8" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B04A1B8" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B04A1B8" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04A1B8" Ref="#PWR062"  Part="1" 
F 0 "#PWR062" H 5450 6300 50  0001 C CNN
F 1 "+5V" H 5465 6623 50  0000 C CNN
F 2 "" H 5450 6450 50  0001 C CNN
F 3 "" H 5450 6450 50  0001 C CNN
	1    5450 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B04A1BE
P 5450 6550
AR Path="/5CC0D65F/6B04A1BE" Ref="C?"  Part="1" 
AR Path="/6B04A1BE" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B04A1BE" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B04A1BE" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04A1BE" Ref="C47"  Part="1" 
F 0 "C47" H 5359 6596 50  0000 R CNN
F 1 "100nF" H 5359 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 6550 50  0001 C CNN
F 3 "~" H 5450 6550 50  0001 C CNN
	1    5450 6550
	1    0    0    -1  
$EndComp
Connection ~ 5450 6450
Connection ~ 5450 6650
$Comp
L alexios:74LVC2G157 U?
U 2 1 6B04DA4C
P 1450 5900
AR Path="/61F95ACC/6B04DA4C" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04DA4C" Ref="U16"  Part="2" 
F 0 "U16" H 1630 5946 50  0000 L CNN
F 1 "74LVC2G157" H 1630 5855 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 1350 6025 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 1350 6025 50  0001 C CNN
	2    1450 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B04DA52
P 1100 6000
AR Path="/6B04DA52" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B04DA52" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B04DA52" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04DA52" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 1100 5750 50  0001 C CNN
F 1 "GND" H 1105 5827 50  0000 C CNN
F 2 "" H 1100 6000 50  0001 C CNN
F 3 "" H 1100 6000 50  0001 C CNN
	1    1100 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B04DA58
P 1100 5800
AR Path="/6B04DA58" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B04DA58" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B04DA58" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04DA58" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 1100 5650 50  0001 C CNN
F 1 "+5V" H 1115 5973 50  0000 C CNN
F 2 "" H 1100 5800 50  0001 C CNN
F 3 "" H 1100 5800 50  0001 C CNN
	1    1100 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B04DA5E
P 1100 5900
AR Path="/5CC0D65F/6B04DA5E" Ref="C?"  Part="1" 
AR Path="/6B04DA5E" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B04DA5E" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B04DA5E" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B04DA5E" Ref="C22"  Part="1" 
F 0 "C22" H 1009 5946 50  0000 R CNN
F 1 "100nF" H 1009 5855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1100 5900 50  0001 C CNN
F 3 "~" H 1100 5900 50  0001 C CNN
	1    1100 5900
	1    0    0    -1  
$EndComp
Connection ~ 1100 5800
Connection ~ 1100 6000
$Comp
L alexios:74LVC1G0832 U?
U 2 1 6B05FBA4
P 2900 5900
AR Path="/61F95ACC/6B05FBA4" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B05FBA4" Ref="U26"  Part="2" 
F 0 "U26" H 3080 5946 50  0000 L CNN
F 1 "74LVC1G0832" H 3080 5855 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 2900 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 2900 5900 50  0001 C CNN
	2    2900 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B06069E
P 2550 6000
AR Path="/6B06069E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B06069E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B06069E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B06069E" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 2550 5750 50  0001 C CNN
F 1 "GND" H 2555 5827 50  0000 C CNN
F 2 "" H 2550 6000 50  0001 C CNN
F 3 "" H 2550 6000 50  0001 C CNN
	1    2550 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B0606A4
P 2550 5800
AR Path="/6B0606A4" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B0606A4" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B0606A4" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B0606A4" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 2550 5650 50  0001 C CNN
F 1 "+5V" H 2565 5973 50  0000 C CNN
F 2 "" H 2550 5800 50  0001 C CNN
F 3 "" H 2550 5800 50  0001 C CNN
	1    2550 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B0606AA
P 2550 5900
AR Path="/5CC0D65F/6B0606AA" Ref="C?"  Part="1" 
AR Path="/6B0606AA" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B0606AA" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B0606AA" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B0606AA" Ref="C23"  Part="1" 
F 0 "C23" H 2459 5946 50  0000 R CNN
F 1 "100nF" H 2459 5855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 5900 50  0001 C CNN
F 3 "~" H 2550 5900 50  0001 C CNN
	1    2550 5900
	1    0    0    -1  
$EndComp
Connection ~ 2550 6000
Connection ~ 2550 5800
$Comp
L alexios:74LVC1G0832 U?
U 2 1 6B06BC0C
P 4350 5900
AR Path="/61F95ACC/6B06BC0C" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B06BC0C" Ref="U40"  Part="2" 
F 0 "U40" H 4530 5946 50  0000 L CNN
F 1 "74LVC1G0832" H 4530 5855 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4350 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 4350 5900 50  0001 C CNN
	2    4350 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6B06BC12
P 4000 6000
AR Path="/6B06BC12" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B06BC12" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B06BC12" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B06BC12" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 4000 5750 50  0001 C CNN
F 1 "GND" H 4005 5827 50  0000 C CNN
F 2 "" H 4000 6000 50  0001 C CNN
F 3 "" H 4000 6000 50  0001 C CNN
	1    4000 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6B06BC18
P 4000 5800
AR Path="/6B06BC18" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6B06BC18" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6B06BC18" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B06BC18" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 4000 5650 50  0001 C CNN
F 1 "+5V" H 4015 5973 50  0000 C CNN
F 2 "" H 4000 5800 50  0001 C CNN
F 3 "" H 4000 5800 50  0001 C CNN
	1    4000 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6B06BC1E
P 4000 5900
AR Path="/5CC0D65F/6B06BC1E" Ref="C?"  Part="1" 
AR Path="/6B06BC1E" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6B06BC1E" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6B06BC1E" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6B06BC1E" Ref="C24"  Part="1" 
F 0 "C24" H 3909 5946 50  0000 R CNN
F 1 "100nF" H 3909 5855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4000 5900 50  0001 C CNN
F 3 "~" H 4000 5900 50  0001 C CNN
	1    4000 5900
	1    0    0    -1  
$EndComp
Connection ~ 4000 6000
Connection ~ 4000 5800
Wire Wire Line
	3700 4000 5300 4000
Connection ~ 3700 4000
Text Label 5250 4000 2    50   ~ 0
~IOWMBR
Text HLabel 5300 4000 2    50   Output ~ 0
~IOWMBR
Wire Wire Line
	6750 3900 9250 3900
Wire Wire Line
	9250 3900 9250 3450
Connection ~ 9250 3450
Wire Wire Line
	6750 3800 9150 3800
Wire Wire Line
	9150 3800 9150 3350
Connection ~ 9150 3350
$Comp
L power:GND #PWR?
U 1 1 6C2AA005
P 5450 6000
AR Path="/6C2AA005" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C2AA005" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C2AA005" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C2AA005" Ref="#PWR078"  Part="1" 
F 0 "#PWR078" H 5450 5750 50  0001 C CNN
F 1 "GND" H 5455 5827 50  0000 C CNN
F 2 "" H 5450 6000 50  0001 C CNN
F 3 "" H 5450 6000 50  0001 C CNN
	1    5450 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6C2AA00B
P 5450 5800
AR Path="/6C2AA00B" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C2AA00B" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C2AA00B" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C2AA00B" Ref="#PWR077"  Part="1" 
F 0 "#PWR077" H 5450 5650 50  0001 C CNN
F 1 "+5V" H 5465 5973 50  0000 C CNN
F 2 "" H 5450 5800 50  0001 C CNN
F 3 "" H 5450 5800 50  0001 C CNN
	1    5450 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C2AA011
P 5450 5900
AR Path="/5CC0D65F/6C2AA011" Ref="C?"  Part="1" 
AR Path="/6C2AA011" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C2AA011" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6C2AA011" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C2AA011" Ref="C52"  Part="1" 
F 0 "C52" H 5359 5946 50  0000 R CNN
F 1 "100nF" H 5359 5855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 5900 50  0001 C CNN
F 3 "~" H 5450 5900 50  0001 C CNN
	1    5450 5900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U?
U 2 1 6C2AC34B
P 5850 5650
AR Path="/61F95ACC/6C2AC34B" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C2AC34B" Ref="U41"  Part="2" 
F 0 "U41" H 5980 5446 50  0000 L CNN
F 1 "74LVC1G32" H 5980 5355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5960 5630 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5960 5630 50  0001 C CNN
	2    5850 5650
	1    0    0    -1  
$EndComp
Connection ~ 5450 6000
Connection ~ 5450 5800
Wire Wire Line
	6750 1750 8300 1750
Wire Wire Line
	6750 2500 8300 2500
Wire Wire Line
	7800 1850 7800 2600
Connection ~ 7800 1850
Text HLabel 6750 3150 0    50   Input ~ 0
IR2
Text Label 7350 3150 2    50   ~ 0
IR2
Text Label 8200 3150 2    50   ~ 0
IR2
Wire Wire Line
	6750 3150 8300 3150
Wire Wire Line
	8300 3250 8250 3250
Connection ~ 8250 3450
NoConn ~ 6150 1550
Wire Wire Line
	6150 1850 7800 1850
Text Label 8250 1850 2    50   ~ 0
~IR-IDXR
Text Label 8250 2600 2    50   ~ 0
~IR-IDXR
Text Label 7100 1850 2    50   ~ 0
~IR-IDXR
Wire Wire Line
	5200 1650 5250 1650
Text Label 4800 1750 0    50   ~ 0
~T34
Text Label 4800 1550 0    50   ~ 0
~IR-IDX
Text HLabel 4750 1850 0    50   Input ~ 0
~RESET
Text Label 4800 1850 0    50   ~ 0
~RESET
Wire Wire Line
	5250 1850 4750 1850
$Comp
L power:+5V #PWR053
U 1 1 5E838320
P 5200 1400
F 0 "#PWR053" H 5200 1250 50  0001 C CNN
F 1 "+5V" H 5215 1573 50  0000 C CNN
F 2 "" H 5200 1400 50  0001 C CNN
F 3 "" H 5200 1400 50  0001 C CNN
	1    5200 1400
	1    0    0    -1  
$EndComp
Text HLabel 4750 1750 0    50   Input ~ 0
~T34
Wire Wire Line
	5250 1750 4750 1750
Wire Wire Line
	4750 1550 5250 1550
Text HLabel 4750 1550 0    50   Input ~ 0
~IR-IDX
Wire Wire Line
	5200 1400 5200 1650
$Comp
L alexios:74LVC1G74 U18
U 2 1 5E84B6CE
P 5700 2300
F 0 "U18" H 5880 2346 50  0000 L CNN
F 1 "74LVC1G74" H 5880 2255 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 6150 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 6150 2300 50  0001 C CNN
	2    5700 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E84D3C1
P 5350 2400
AR Path="/5E84D3C1" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5E84D3C1" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5E84D3C1" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/5E84D3C1" Ref="#PWR079"  Part="1" 
F 0 "#PWR079" H 5350 2150 50  0001 C CNN
F 1 "GND" H 5355 2227 50  0000 C CNN
F 2 "" H 5350 2400 50  0001 C CNN
F 3 "" H 5350 2400 50  0001 C CNN
	1    5350 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E84D3C7
P 5350 2200
AR Path="/5E84D3C7" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5E84D3C7" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5E84D3C7" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/5E84D3C7" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 5350 2050 50  0001 C CNN
F 1 "+5V" H 5365 2373 50  0000 C CNN
F 2 "" H 5350 2200 50  0001 C CNN
F 3 "" H 5350 2200 50  0001 C CNN
	1    5350 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E84D3CD
P 5350 2300
AR Path="/5CC0D65F/5E84D3CD" Ref="C?"  Part="1" 
AR Path="/5E84D3CD" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5E84D3CD" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5E84D3CD" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/5E84D3CD" Ref="C25"  Part="1" 
F 0 "C25" H 5259 2346 50  0000 R CNN
F 1 "100nF" H 5259 2255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 2300 50  0001 C CNN
F 3 "~" H 5350 2300 50  0001 C CNN
	1    5350 2300
	1    0    0    -1  
$EndComp
Connection ~ 5350 2200
Connection ~ 5350 2400
$Comp
L alexios:74LVC1G74 U18
U 1 1 5E80D2A8
P 5700 1700
F 0 "U18" H 5700 2117 50  0000 C CNN
F 1 "74LVC1G74" H 5700 2026 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 6150 1700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 6150 1700 50  0001 C CNN
	1    5700 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3350 8300 3350
Wire Wire Line
	8250 3250 8250 3450
Text Label 8200 3350 2    50   ~ 0
~IR-IDXR
$EndSCHEMATC
