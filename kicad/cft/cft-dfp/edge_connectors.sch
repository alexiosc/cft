EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 14 16
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3450 1250 1150 4200
U 5FE9C100
F0 "sheet5FE9C0B4" 50
F1 "dfp-bus-left.sch" 50
F2 "AB[0..23]" U L 3450 2000 50 
F3 "DB[0..15]" U L 3450 2100 50 
F4 "FPD[0..7]" U L 3450 2400 50 
F5 "IBUS[0..15]" U L 3450 1400 50 
F6 "~RESET" U L 3450 1500 50 
F7 "CLK1" U L 3450 1600 50 
F8 "CLK2" U L 3450 1700 50 
F9 "CLK3" U L 3450 1800 50 
F10 "CLK4" U L 3450 1900 50 
F11 "T34" U L 3450 2300 50 
F12 "~IRQ" U L 3450 2500 50 
F13 "~IRQS" U L 3450 2600 50 
F14 "~IRQ[0..7]" U L 3450 2700 50 
F15 "~RSTHOLD" U L 3450 2800 50 
F16 "~SYSDEV" U L 3450 2900 50 
F17 "~IODEV1xx" U L 3450 3000 50 
F18 "~IODEV2xx" U L 3450 3100 50 
F19 "~IODEV3xx" U L 3450 3200 50 
F20 "~MEM" U L 3450 3300 50 
F21 "~IO" U L 3450 3400 50 
F22 "~R" U L 3450 3500 50 
F23 "~W" U L 3450 3600 50 
F24 "~WS" U L 3450 3700 50 
F25 "~ENDEXT" U L 3450 3800 50 
F26 "~SKIPEXT" U L 3450 3900 50 
F27 "~HALT" U L 3450 4000 50 
F28 "ACTION[0..3]" U L 3450 4300 50 
F29 "WADDR[0..4]" U L 3450 4400 50 
F30 "RADDR[0..4]" U L 3450 4500 50 
F31 "RSVD[0..6]" U L 3450 4600 50 
F32 "C1" U R 4600 1400 50 
F33 "C2" U R 4600 1500 50 
F34 "C3" U R 4600 1600 50 
F35 "C4" U R 4600 1700 50 
F36 "C5" U R 4600 1800 50 
F37 "C6" U R 4600 1900 50 
F38 "C7" U R 4600 2000 50 
F39 "C8" U R 4600 2100 50 
F40 "C9" U R 4600 2200 50 
F41 "C10" U R 4600 2300 50 
F42 "C11" U R 4600 2400 50 
F43 "C12" U R 4600 2500 50 
F44 "C13" U R 4600 2600 50 
F45 "C14" U R 4600 2700 50 
F46 "C15" U R 4600 2800 50 
F47 "C16" U R 4600 2900 50 
F48 "C17" U R 4600 3000 50 
F49 "C18" U R 4600 3100 50 
F50 "C19" U R 4600 3200 50 
F51 "C20" U R 4600 3300 50 
F52 "C21" U R 4600 3400 50 
F53 "C22" U R 4600 3500 50 
F54 "C23" U R 4600 3600 50 
F55 "C24" U R 4600 3700 50 
F56 "C25" U R 4600 3800 50 
F57 "C26" U R 4600 3900 50 
F58 "C27" U R 4600 4000 50 
F59 "C28" U R 4600 4100 50 
F60 "C29" U R 4600 4200 50 
F61 "C30" U R 4600 4300 50 
F62 "C31" U R 4600 4400 50 
F63 "C32" U R 4600 4500 50 
F64 "C33" U R 4600 4600 50 
F65 "C34" U R 4600 4700 50 
F66 "C35" U R 4600 4800 50 
F67 "C36" U R 4600 4900 50 
F68 "C37" U R 4600 5000 50 
F69 "C38" U R 4600 5100 50 
F70 "C39" U R 4600 5200 50 
F71 "C40" U R 4600 5300 50 
F72 "~RUEN" U L 3450 4100 50 
F73 "~WAITING" U L 3450 4200 50 
$EndSheet
Wire Bus Line
	3450 2000 2900 2000
Wire Bus Line
	3450 2100 2900 2100
Text Label 2900 2000 0    50   ~ 0
AB[0..23]
Text Label 2900 2100 0    50   ~ 0
DB[0..15]
Wire Bus Line
	2900 2400 3450 2400
Text Label 2900 2400 0    50   ~ 0
CFT-FPD[0..7]
Wire Wire Line
	3450 1600 2900 1600
Wire Wire Line
	3450 1700 2900 1700
Wire Wire Line
	3450 1800 2900 1800
Wire Wire Line
	3450 1900 2900 1900
Wire Wire Line
	3450 1500 2900 1500
Wire Wire Line
	3450 2800 2900 2800
Wire Wire Line
	3450 2900 2900 2900
Wire Wire Line
	3450 3000 2900 3000
Wire Wire Line
	3450 3300 2900 3300
Wire Wire Line
	3450 3400 2900 3400
Wire Wire Line
	3450 3500 2900 3500
Wire Wire Line
	3450 3600 2900 3600
Wire Wire Line
	3450 3200 2900 3200
Wire Wire Line
	3450 3100 2900 3100
Wire Wire Line
	3450 4000 2900 4000
Wire Wire Line
	3450 3700 2900 3700
Wire Bus Line
	2900 2700 3450 2700
Text Label 2900 2700 0    50   ~ 0
~IRQ[0..7]
Text Label 2900 2500 0    50   ~ 0
~IRQ
Wire Wire Line
	3450 2300 2900 2300
Wire Bus Line
	2900 1400 3450 1400
Text Label 2900 1400 0    50   ~ 0
IBUS[0..15]
Text Label 2900 1500 0    50   ~ 0
~RESET
Text Label 2900 1600 0    50   ~ 0
CLK1
Text Label 2900 1700 0    50   ~ 0
CLK2
Text Label 2900 1800 0    50   ~ 0
CLK3
Text Label 2900 1900 0    50   ~ 0
CLK4
Text Label 2900 2300 0    50   ~ 0
T34
Wire Wire Line
	3450 2600 2900 2600
Text Label 2900 2600 0    50   ~ 0
~IRQS
Text Label 2900 2800 0    50   ~ 0
~RSTHOLD
Text Label 2900 2900 0    50   ~ 0
~SYSDEV
Text Label 2900 3000 0    50   ~ 0
~IODEV1xx
Text Label 2900 3100 0    50   ~ 0
~IODEV2xx
Text Label 2900 3200 0    50   ~ 0
~IODEV3xx
Text Label 2900 3300 0    50   ~ 0
~MEM
Text Label 2900 3400 0    50   ~ 0
~IO
Text Label 2900 3500 0    50   ~ 0
~R
Text Label 2900 3700 0    50   ~ 0
~WS
Text Label 2900 4000 0    50   ~ 0
~HALT
Text Label 2900 4300 0    50   ~ 0
ACTION[0..3]
Text Label 2900 4400 0    50   ~ 0
WADDR[0..4]
Text Label 2900 4500 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	3450 4300 2900 4300
Wire Bus Line
	3450 4400 2900 4400
Wire Bus Line
	3450 4500 2900 4500
Wire Bus Line
	2900 4600 3450 4600
Text Label 2900 4600 0    50   ~ 0
RSVD[0..6]
Text Label 5150 1700 2    50   ~ 0
FPA1
$Comp
L power:+5V #PWR?
U 1 1 5FE9C141
P 4600 1500
AR Path="/5FE9C141" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C141" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C141" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4600 1350 50  0001 C CNN
F 1 "+5V" V 4615 1628 50  0000 L CNN
F 2 "" H 4600 1500 50  0001 C CNN
F 3 "" H 4600 1500 50  0001 C CNN
	1    4600 1500
	0    1    1    0   
$EndComp
Text Label 5150 4000 2    50   ~ 0
POWER
Text Label 5150 3900 2    50   ~ 0
~LTSON
Text Label 5150 3800 2    50   ~ 0
SWD3
Text Label 5150 3700 2    50   ~ 0
SWD2
Text Label 5150 3600 2    50   ~ 0
SWD1
Text Label 5150 3500 2    50   ~ 0
SWD0
Text Label 5150 3400 2    50   ~ 0
SWA3
Text Label 5150 3300 2    50   ~ 0
SWA2
Text Label 5150 3200 2    50   ~ 0
SWA1
Text Label 5150 3100 2    50   ~ 0
SWA0
Text Label 5150 3000 2    50   ~ 0
~ROW5
Text Label 5150 2900 2    50   ~ 0
~ROW4
Text Label 5150 2800 2    50   ~ 0
~ROW3
Text Label 5150 2700 2    50   ~ 0
~ROW2
Text Label 5150 2600 2    50   ~ 0
~ROW1
Wire Wire Line
	4600 1700 5150 1700
Wire Wire Line
	4600 1600 5150 1600
Wire Wire Line
	4600 4600 4750 4600
Wire Wire Line
	4600 4500 4750 4500
Wire Wire Line
	4600 4400 4750 4400
Wire Wire Line
	4600 3900 5150 3900
Wire Wire Line
	4600 3800 5150 3800
Wire Wire Line
	4600 3700 5150 3700
Wire Wire Line
	4600 3600 5150 3600
Wire Wire Line
	4600 3500 5150 3500
Wire Wire Line
	4600 3400 5150 3400
Wire Wire Line
	4600 3300 5150 3300
Wire Wire Line
	4600 3200 5150 3200
Wire Wire Line
	4600 3100 5150 3100
Wire Wire Line
	4600 3000 5150 3000
Wire Wire Line
	4600 2900 5150 2900
Wire Wire Line
	4600 2800 5150 2800
Wire Wire Line
	4600 2700 5150 2700
Wire Wire Line
	4600 2600 5150 2600
Text Label 5150 1600 2    50   ~ 0
FPA0
NoConn ~ 4750 4400
NoConn ~ 4750 4600
$Comp
L power:+5V #PWR?
U 1 1 5FE9C16D
P 4600 1400
AR Path="/5FE9C16D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C16D" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C16D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4600 1250 50  0001 C CNN
F 1 "+5V" V 4615 1528 50  0000 L CNN
F 2 "" H 4600 1400 50  0001 C CNN
F 3 "" H 4600 1400 50  0001 C CNN
	1    4600 1400
	0    1    1    0   
$EndComp
Text Notes 4200 3250 1    100  ~ 20
Left Slot
Entry Wire Line
	5150 3100 5250 3200
Entry Wire Line
	5150 3200 5250 3300
Entry Wire Line
	5150 3300 5250 3400
Entry Wire Line
	5150 3400 5250 3500
Entry Wire Line
	5150 3500 5250 3600
Entry Wire Line
	5150 3600 5250 3700
Entry Wire Line
	5150 3700 5250 3800
Entry Wire Line
	5150 3800 5250 3900
Text Label 5250 3200 0    50   ~ 0
SWA[0..3]
Text Label 5250 3600 0    50   ~ 0
SWD[0..3]
Text Notes 5300 4000 0    50   ~ 0
Power switch from front panel
Wire Wire Line
	4600 5300 4750 5300
NoConn ~ 4750 4500
$Comp
L power:GND #PWR?
U 1 1 5FE9C188
P 4750 5300
AR Path="/5FE9C188" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C188" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C188" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4750 5050 50  0001 C CNN
F 1 "GND" H 4755 5127 50  0000 C CNN
F 2 "" H 4750 5300 50  0001 C CNN
F 3 "" H 4750 5300 50  0001 C CNN
	1    4750 5300
	1    0    0    -1  
$EndComp
Text Label 5150 5200 2    50   ~ 0
TXD1
Text Label 5150 5100 2    50   ~ 0
RXD
Wire Wire Line
	4600 5100 5150 5100
Wire Wire Line
	4600 5200 5150 5200
Wire Wire Line
	4600 4000 5150 4000
Text Label 2900 3600 0    50   ~ 0
~W
$Comp
L power:GND #PWR?
U 1 1 5FE9C19C
P 4900 4350
AR Path="/5FE9C19C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C19C" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C19C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4900 4100 50  0001 C CNN
F 1 "GND" H 4905 4177 50  0000 C CNN
F 2 "" H 4900 4350 50  0001 C CNN
F 3 "" H 4900 4350 50  0001 C CNN
	1    4900 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4100 4900 4100
Wire Wire Line
	4900 4100 4900 4200
Wire Wire Line
	4600 4200 4900 4200
Connection ~ 4900 4200
Wire Wire Line
	4600 4300 4900 4300
Wire Wire Line
	4900 4200 4900 4300
Connection ~ 4900 4300
Wire Wire Line
	4900 4300 4900 4350
Wire Wire Line
	3450 4100 3350 4100
Wire Wire Line
	3450 4200 2900 4200
NoConn ~ 3350 4100
Wire Bus Line
	7450 2000 6900 2000
Wire Bus Line
	7450 2100 6900 2100
Text Label 6900 2000 0    50   ~ 0
AB[0..7]
Text Label 6900 2100 0    50   ~ 0
DB[0..15]
Wire Bus Line
	6900 2400 7450 2400
Text Label 6900 2400 0    50   ~ 0
CFT-FPD[0..7]
Wire Wire Line
	7450 1600 6900 1600
Wire Wire Line
	7450 1700 6900 1700
Wire Wire Line
	7450 1800 6900 1800
Wire Wire Line
	7450 1900 6900 1900
Wire Wire Line
	7450 1500 6900 1500
Wire Wire Line
	7450 2800 6900 2800
Wire Wire Line
	7450 2900 6900 2900
Wire Wire Line
	7450 3000 6900 3000
Wire Wire Line
	7450 2500 6900 2500
Wire Wire Line
	7450 3500 6900 3500
Wire Wire Line
	7450 3600 6900 3600
Wire Wire Line
	7450 3200 6900 3200
Wire Wire Line
	7450 3100 6900 3100
Wire Wire Line
	7450 4000 6900 4000
Wire Wire Line
	7450 3700 6900 3700
Wire Bus Line
	6900 2700 7450 2700
Text Label 6900 2700 0    50   ~ 0
~IRQ[0..7]
Text Label 6900 2500 0    50   ~ 0
~IRQ
Wire Wire Line
	7450 2300 6900 2300
Text Label 6900 1500 0    50   ~ 0
~RESET
Text Label 6900 1600 0    50   ~ 0
CLK1
Text Label 6900 1700 0    50   ~ 0
CLK2
Text Label 6900 1800 0    50   ~ 0
CLK3
Text Label 6900 1900 0    50   ~ 0
CLK4
Text Label 6900 2300 0    50   ~ 0
T34
Wire Wire Line
	7450 2600 6900 2600
Text Label 6900 2600 0    50   ~ 0
~IRQS
Text Label 6900 2800 0    50   ~ 0
~RSTHOLD
Text Label 6900 2900 0    50   ~ 0
~SYSDEV
Text Label 6900 3000 0    50   ~ 0
~IODEV1xx
Text Label 6900 3100 0    50   ~ 0
~IODEV2xx
Text Label 6900 3200 0    50   ~ 0
~IODEV3xx
Text Label 6900 3500 0    50   ~ 0
~R
Text Label 6900 3600 0    50   ~ 0
~W
Text Label 6900 3700 0    50   ~ 0
~WS
Text Label 6900 4000 0    50   ~ 0
~HALT
Wire Wire Line
	8600 1600 9200 1600
Text Label 9200 1600 2    50   ~ 0
FPCLKEN
Wire Wire Line
	8600 1800 9200 1800
Text Label 9200 1800 2    50   ~ 0
FPµSTEP
$Comp
L power:GND #PWR?
U 1 1 5FE9C1EE
P 8600 1700
AR Path="/5FE9C1EE" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C1EE" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C1EE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8600 1450 50  0001 C CNN
F 1 "GND" V 8650 1600 50  0000 R CNN
F 2 "" H 8600 1700 50  0001 C CNN
F 3 "" H 8600 1700 50  0001 C CNN
	1    8600 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FE9C1F4
P 8600 1900
AR Path="/5FE9C1F4" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C1F4" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C1F4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8600 1650 50  0001 C CNN
F 1 "GND" V 8650 1800 50  0000 R CNN
F 2 "" H 8600 1900 50  0001 C CNN
F 3 "" H 8600 1900 50  0001 C CNN
	1    8600 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 2100 9200 2100
Text Label 9200 2100 2    50   ~ 0
~FPRAM~∕ROM
Wire Wire Line
	8600 2000 9200 2000
Text Label 9200 2000 2    50   ~ 0
~FPRESET
Text Notes 9400 1500 0    50   ~ 0
To reset and clock generator
Text Notes 9900 2100 0    50   ~ 0
To Memory Bank Registers
Wire Wire Line
	8600 2200 9200 2200
Text Label 9200 2200 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes 9900 2200 0    50   ~ 0
From Microcode Sequencer
Text Notes 8200 3550 1    100  ~ 20
Right Slot
Wire Wire Line
	8600 1400 9200 1400
Text Label 9200 1400 2    50   ~ 0
POWER
Text Notes 9400 1400 0    50   ~ 0
Power enable → backplane
Text Label 9200 2800 2    50   ~ 0
~FPOE29
Text Label 9200 3100 2    50   ~ 0
~FPOE25
Text Label 9200 3000 2    50   ~ 0
~FPOE21
Wire Wire Line
	8600 2800 9200 2800
Wire Wire Line
	8600 3100 9200 3100
Wire Wire Line
	8600 3000 9200 3000
Text Notes 9250 3200 0    50   ~ 0
IR high
Text Label 9200 3200 2    50   ~ 0
~FPOE17
Wire Wire Line
	8600 3200 9200 3200
Text Notes 9250 3300 0    50   ~ 0
AC high
Text Notes 9250 3400 0    50   ~ 0
PC high
Text Notes 9250 3500 0    50   ~ 0
µCV mid
Text Label 9200 3300 2    50   ~ 0
~FPOE9
Text Label 9200 3400 2    50   ~ 0
~FPOE5
Text Label 9200 3500 2    50   ~ 0
~FPOE1
Wire Wire Line
	8600 3300 9200 3300
Wire Wire Line
	8600 3400 9200 3400
Wire Wire Line
	8600 3500 9200 3500
Text Label 9200 3600 2    50   ~ 0
~FPOE30
Wire Wire Line
	8600 3900 9200 3900
Text Label 9200 3700 2    50   ~ 0
~FPOE26
Wire Wire Line
	8600 3700 9200 3700
Text Notes 9250 3800 0    50   ~ 0
IR low\n
Text Notes 9250 4100 0    50   ~ 0
AC low
Text Notes 9250 4000 0    50   ~ 0
PC low
Text Notes 9250 4300 0    50   ~ 0
µCV low
Text Label 9200 4100 2    50   ~ 0
~FPOE10
Text Label 9200 4000 2    50   ~ 0
~FPOE6
Text Label 9200 4300 2    50   ~ 0
~FPOE2
Wire Wire Line
	8600 4100 9200 4100
Wire Wire Line
	8600 4000 9200 4000
Wire Wire Line
	8600 4300 9200 4300
Text Label 9200 4900 2    50   ~ 0
~FPOE23
Wire Wire Line
	8600 4900 9200 4900
Text Label 9200 4800 2    50   ~ 0
~FPOE19
Wire Wire Line
	8600 4800 9200 4800
Text Notes 9250 4900 0    50   ~ 0
µAddress low
Text Notes 9250 5000 0    50   ~ 0
(reserved)
Text Label 9200 5100 2    50   ~ 0
~FPOE15
Wire Wire Line
	8600 5100 9200 5100
Text Notes 9250 5100 0    50   ~ 0
(reserved)
Text Notes 9250 5300 0    50   ~ 0
IRQs enabled
Text Notes 9250 5200 0    50   ~ 0
IRQ requests
Text Label 9200 5000 2    50   ~ 0
~FPOE11
Text Label 9200 5300 2    50   ~ 0
~FPOE7
Text Label 9200 5200 2    50   ~ 0
~FPOE3
Wire Wire Line
	8600 5000 9200 5000
Wire Wire Line
	8600 5300 9200 5300
Wire Wire Line
	8600 5200 9200 5200
Wire Wire Line
	8600 4700 9200 4700
Wire Wire Line
	8600 4500 9200 4500
Wire Wire Line
	8600 4400 9200 4400
Wire Wire Line
	8600 4200 9200 4200
Text Label 9200 4500 2    50   ~ 0
~FPSPHOE
Text Label 9200 4200 2    50   ~ 0
~FPSPLOE
Text Notes 9250 4700 0    50   ~ 0
MFD: DR high
Text Notes 9250 4500 0    50   ~ 0
MFD: DR low
Text Notes 9250 4400 0    50   ~ 0
MFD: SP high\n
Text Notes 9250 4200 0    50   ~ 0
MFD: SP low
Wire Wire Line
	8600 2900 9200 2900
Text Label 9200 2900 2    50   ~ 0
~FPOE0
Text Notes 9250 2900 0    50   ~ 0
µCV high
Wire Wire Line
	8600 2700 9200 2700
Wire Wire Line
	8600 2600 9200 2600
Text Label 9200 2700 2    50   ~ 0
~FPOE4
Text Label 9200 2600 2    50   ~ 0
~FPOE8
Text Notes 9250 2700 0    50   ~ 0
AEXT
Text Notes 9250 2600 0    50   ~ 0
Flags
Wire Wire Line
	8600 2500 9200 2500
Text Label 9200 2500 2    50   ~ 0
~FPOE12
Text Notes 9250 2500 0    50   ~ 0
(reserved)
Wire Wire Line
	8600 2400 9200 2400
Text Label 9200 2400 2    50   ~ 0
~FPOE24
Wire Wire Line
	8600 4600 9200 4600
Text Label 9200 4600 2    50   ~ 0
~FPOE27
Wire Wire Line
	8600 2300 9200 2300
Text Label 9200 2300 2    50   ~ 0
~FPOE28
Text Label 9200 4700 2    50   ~ 0
~FPDRHOE
Text Label 9200 4400 2    50   ~ 0
~FPDRLOE
Wire Wire Line
	8600 3800 9200 3800
Text Label 9200 3800 2    50   ~ 0
~FPOE18
Wire Wire Line
	8600 3600 9200 3600
Text Label 9200 3900 2    50   ~ 0
~FPOE22
Wire Wire Line
	8600 1500 9200 1500
NoConn ~ 9200 1500
Wire Wire Line
	3450 2500 2900 2500
Wire Wire Line
	4600 2400 5150 2400
Wire Wire Line
	4600 2300 5150 2300
Wire Wire Line
	4600 2200 5150 2200
Wire Wire Line
	4600 2100 5150 2100
Wire Wire Line
	4600 2000 5150 2000
Wire Wire Line
	4600 1900 5150 1900
Wire Wire Line
	4600 1800 5150 1800
Text Label 5150 2500 2    50   ~ 0
FP-FPD0
Text Label 5150 2400 2    50   ~ 0
FP-FPD1
Text Label 5150 2300 2    50   ~ 0
FP-FPD2
Text Label 5150 2200 2    50   ~ 0
FP-FPD3
Text Label 5150 2100 2    50   ~ 0
FP-FPD4
Text Label 5150 2000 2    50   ~ 0
FP-FPD5
Text Label 5150 1900 2    50   ~ 0
FP-FPD6
Text Label 5150 1800 2    50   ~ 0
FP-FPD7
Wire Wire Line
	4600 2500 5150 2500
Text Notes 5350 2200 0    50   ~ 0
Flipped to account for\nFront Panel Module\nlayout.
Text Notes 2750 1050 0    100  ~ 20
Processor/Memory Mapped Slots
Text Notes 7300 1050 0    100  ~ 20
Device I/O Slots
$Sheet
S 7450 1250 1150 4200
U 5FE9C29E
F0 "sheet5FE9C0B6" 50
F1 "dfp-bus-right.sch" 50
F2 "AB[0..7]" U L 7450 2000 50 
F3 "DB[0..15]" U L 7450 2100 50 
F4 "FPD[0..7]" U L 7450 2400 50 
F5 "~RESET" U L 7450 1500 50 
F6 "CLK1" U L 7450 1600 50 
F7 "CLK2" U L 7450 1700 50 
F8 "CLK3" U L 7450 1800 50 
F9 "CLK4" U L 7450 1900 50 
F10 "T34" U L 7450 2300 50 
F11 "~IRQ" U L 7450 2500 50 
F12 "~IRQS" U L 7450 2600 50 
F13 "~IRQ[0..7]" U L 7450 2700 50 
F14 "~RSTHOLD" U L 7450 2800 50 
F15 "~SYSDEV" U L 7450 2900 50 
F16 "~IODEV1xx" U L 7450 3000 50 
F17 "~IODEV2xx" U L 7450 3100 50 
F18 "~IODEV3xx" U L 7450 3200 50 
F19 "~R" U L 7450 3500 50 
F20 "~W" U L 7450 3600 50 
F21 "~WS" U L 7450 3700 50 
F22 "~HALT" U L 7450 4000 50 
F23 "C1" U R 8600 1400 50 
F24 "C2" U R 8600 1500 50 
F25 "C3" U R 8600 1600 50 
F26 "C4" U R 8600 1700 50 
F27 "C5" U R 8600 1800 50 
F28 "C6" U R 8600 1900 50 
F29 "C7" U R 8600 2000 50 
F30 "C8" U R 8600 2100 50 
F31 "C9" U R 8600 2200 50 
F32 "C10" U R 8600 2300 50 
F33 "C11" U R 8600 2400 50 
F34 "C12" U R 8600 2500 50 
F35 "C13" U R 8600 2600 50 
F36 "C14" U R 8600 2700 50 
F37 "C15" U R 8600 2800 50 
F38 "C16" U R 8600 2900 50 
F39 "C17" U R 8600 3000 50 
F40 "C18" U R 8600 3100 50 
F41 "C19" U R 8600 3200 50 
F42 "C20" U R 8600 3300 50 
F43 "C21" U R 8600 3400 50 
F44 "C22" U R 8600 3500 50 
F45 "C23" U R 8600 3600 50 
F46 "C24" U R 8600 3700 50 
F47 "C25" U R 8600 3800 50 
F48 "C26" U R 8600 3900 50 
F49 "C27" U R 8600 4000 50 
F50 "C28" U R 8600 4100 50 
F51 "C29" U R 8600 4200 50 
F52 "C30" U R 8600 4300 50 
F53 "C31" U R 8600 4400 50 
F54 "C32" U R 8600 4500 50 
F55 "C33" U R 8600 4600 50 
F56 "C34" U R 8600 4700 50 
F57 "C35" U R 8600 4800 50 
F58 "C36" U R 8600 4900 50 
F59 "C37" U R 8600 5000 50 
F60 "C38" U R 8600 5100 50 
F61 "C39" U R 8600 5200 50 
F62 "C40" U R 8600 5300 50 
F63 "~WAITING" U L 7450 4200 50 
$EndSheet
Text Label 2900 4200 0    50   ~ 0
~WAITING
Wire Wire Line
	7450 4200 6900 4200
Text Label 6900 4200 0    50   ~ 0
~WAITING
Text HLabel 2900 1500 0    50   UnSpc ~ 0
~RESET
Text HLabel 2900 1600 0    50   UnSpc ~ 0
CLK1
Text HLabel 2900 1700 0    50   UnSpc ~ 0
CLK2
Text HLabel 2900 1800 0    50   UnSpc ~ 0
CLK3
Text HLabel 2900 1900 0    50   UnSpc ~ 0
CLK4
Text HLabel 2900 2300 0    50   UnSpc ~ 0
T34
Text HLabel 2900 2500 0    50   UnSpc ~ 0
~IRQ
Text HLabel 2900 2600 0    50   UnSpc ~ 0
~IRQS
Text HLabel 2900 2000 0    50   UnSpc ~ 0
AB[0..23]
Text HLabel 2900 2100 0    50   UnSpc ~ 0
DB[0..15]
Text HLabel 2900 2400 0    50   UnSpc ~ 0
CFT-FPD[0..7]
Text HLabel 2900 1400 0    50   UnSpc ~ 0
IBUS[0..15]
Text HLabel 2900 2700 0    50   UnSpc ~ 0
~IRQ[0..7]
Text HLabel 2900 4300 0    50   UnSpc ~ 0
ACTION[0..3]
Text HLabel 2900 4400 0    50   UnSpc ~ 0
WADDR[0..4]
Text HLabel 2900 4500 0    50   UnSpc ~ 0
RADDR[0..4]
Text HLabel 2900 4600 0    50   UnSpc ~ 0
RSVD[0..6]
Text HLabel 2900 2800 0    50   UnSpc ~ 0
~RSTHOLD
Text HLabel 2900 2900 0    50   UnSpc ~ 0
~SYSDEV
Text HLabel 2900 3000 0    50   UnSpc ~ 0
~IODEV1xx
Text HLabel 2900 3100 0    50   UnSpc ~ 0
~IODEV2xx
Text HLabel 2900 3200 0    50   UnSpc ~ 0
~IODEV3xx
Text HLabel 2900 3300 0    50   UnSpc ~ 0
~MEM
Text HLabel 2900 3400 0    50   UnSpc ~ 0
~IO
Text HLabel 2900 3500 0    50   UnSpc ~ 0
~R
Text HLabel 2900 3600 0    50   UnSpc ~ 0
~W
Text HLabel 2900 3700 0    50   UnSpc ~ 0
~WS
Entry Wire Line
	5150 1800 5250 1900
Entry Wire Line
	5150 1900 5250 2000
Entry Wire Line
	5150 2000 5250 2100
Entry Wire Line
	5150 2100 5250 2200
Entry Wire Line
	5150 2200 5250 2300
Entry Wire Line
	5150 2300 5250 2400
Entry Wire Line
	5150 2400 5250 2500
Entry Wire Line
	5150 2500 5250 2600
Text Label 5250 1900 0    50   ~ 0
FP-FPD[0..7]
Wire Bus Line
	3700 6000 4300 6000
Text HLabel 4300 6000 2    50   Input ~ 0
FPA[0..1]
Entry Wire Line
	5150 2600 5250 2700
Entry Wire Line
	5150 2700 5250 2800
Entry Wire Line
	5150 2800 5250 2900
Entry Wire Line
	5150 2900 5250 3000
Entry Wire Line
	5150 3000 5250 3100
Text Label 5250 2700 0    50   ~ 0
~ROW[1..5]
Text Label 3700 6000 0    50   ~ 0
FPA[0..1]
Wire Bus Line
	3700 6100 4300 6100
Text HLabel 4300 6100 2    50   Input ~ 0
~ROW[1..5]
Wire Bus Line
	3700 6200 4300 6200
Text HLabel 4300 6200 2    50   Input ~ 0
SWA[0..3]
Text Label 3700 6100 0    50   ~ 0
~ROW[1..5]
Text Label 3700 6200 0    50   ~ 0
SWA[0..3]
Wire Bus Line
	3700 6300 4300 6300
Text HLabel 4300 6300 2    50   Input ~ 0
SWD[0..3]
Text Label 3700 6300 0    50   ~ 0
SWD[0..3]
Text HLabel 5150 5100 2    50   UnSpc ~ 0
RXD
Text HLabel 5150 5200 2    50   UnSpc ~ 0
TXD1
Text HLabel 2900 4000 0    50   UnSpc ~ 0
~HALT
Text HLabel 2900 4200 0    50   UnSpc ~ 0
~WAITING
Wire Wire Line
	3450 3800 2900 3800
Text Label 2900 3800 0    50   ~ 0
~ENDEXT
Text HLabel 2900 3800 0    50   UnSpc ~ 0
~ENDEXT
Wire Wire Line
	3450 3900 2900 3900
Text Label 2900 3900 0    50   ~ 0
~SKIPEXT
Text HLabel 2900 3900 0    50   UnSpc ~ 0
~SKIPEXT
Text Label 3700 6400 0    50   ~ 0
~LTSON
Wire Wire Line
	4300 6400 3700 6400
Text HLabel 4300 6400 2    50   Input ~ 0
~LTSON
Text HLabel 9200 1600 2    50   Input ~ 0
FPCLKEN
Text HLabel 9200 1800 2    50   Input ~ 0
FPµSTEP
Text HLabel 9200 2000 2    50   Input ~ 0
~FPRESET
Text HLabel 9200 2100 2    50   Input ~ 0
~FPRAM~∕ROM
Text HLabel 9200 2200 2    50   Input ~ 0
FPFETCH∕~EXEC
Wire Bus Line
	7700 6000 8300 6000
Text HLabel 8300 6000 2    50   Input ~ 0
~FPOE[0..31]
Text Label 7700 6000 0    50   ~ 0
~FPOE[0..31]
Text Label 7700 6200 0    50   ~ 0
~FPSPLOE
Text Label 7700 6100 0    50   ~ 0
~FPDRLOE
Text Label 7700 6400 0    50   ~ 0
~FPSPHOE
Text Label 7700 6300 0    50   ~ 0
~FPDRHOE
Wire Wire Line
	8300 6100 7700 6100
Wire Wire Line
	8300 6200 7700 6200
Wire Wire Line
	8300 6300 7700 6300
Wire Wire Line
	8300 6400 7700 6400
Text HLabel 8300 6100 2    50   Input ~ 0
~FPDRLOE
Text HLabel 8300 6200 2    50   Input ~ 0
~FPSPLOE
Text HLabel 8300 6300 2    50   Input ~ 0
~FPDRHOE
Text HLabel 8300 6400 2    50   Input ~ 0
~FPSPHOE
NoConn ~ 4750 4900
NoConn ~ 4750 4700
NoConn ~ 4750 5000
NoConn ~ 4750 4800
Wire Wire Line
	4600 5000 4750 5000
Wire Wire Line
	4600 4900 4750 4900
Wire Wire Line
	4600 4800 4750 4800
Wire Wire Line
	4600 4700 4750 4700
Wire Bus Line
	3700 5900 4300 5900
Text HLabel 4300 5900 2    50   Input ~ 0
FP-FPD[0..7]
Text Label 3700 5900 0    50   ~ 0
FP-FPD[0..7]
Wire Bus Line
	5250 3200 5250 3500
Wire Bus Line
	5250 3600 5250 3900
Wire Bus Line
	5250 2700 5250 3100
Wire Bus Line
	5250 1900 5250 2600
$EndSCHEMATC
