EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title "4× Major Registers"
Date ""
Rev "2007"
Comp ""
Comment1 "REG"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 9250 1950 1150 4200
U 5D34E810
F0 "Left Edge Connector" 50
F1 "bus.sch" 50
F2 "FPD[0..7]" U L 9250 3100 50 
F3 "IBUS[0..15]" U L 9250 2100 50 
F4 "~RESET" U L 9250 2200 50 
F5 "CLK1" U L 9250 2300 50 
F6 "CLK2" U L 9250 2400 50 
F7 "CLK3" U L 9250 2500 50 
F8 "CLK4" U L 9250 2600 50 
F9 "WSTB" U L 9250 2900 50 
F10 "T34" U L 9250 3000 50 
F11 "~IRQ" U L 9250 3200 50 
F12 "~IRQS" U L 9250 3300 50 
F13 "~RSTHOLD" U L 9250 3500 50 
F14 "~SYSDEV" U L 9250 3600 50 
F15 "~IODEV1xx" U L 9250 3700 50 
F16 "~IODEV2xx" U L 9250 3800 50 
F17 "~IODEV3xx" U L 9250 3900 50 
F18 "~MEM" U L 9250 4000 50 
F19 "~IO" U L 9250 4100 50 
F20 "~R" U L 9250 4200 50 
F21 "~W" U L 9250 4300 50 
F22 "~WS" U L 9250 4400 50 
F23 "~ENDEXT" U L 9250 4500 50 
F24 "~SKIPEXT" U L 9250 4600 50 
F25 "~HALT" U L 9250 4700 50 
F26 "ACTION[0..3]" U L 9250 5000 50 
F27 "WADDR[0..4]" U L 9250 5100 50 
F28 "RADDR[0..4]" U L 9250 5200 50 
F29 "RSVD[1..4]" U L 9250 5300 50 
F30 "C1" U R 10400 2100 50 
F31 "C2" U R 10400 2200 50 
F32 "C3" U R 10400 2300 50 
F33 "C4" U R 10400 2400 50 
F34 "C5" U R 10400 2500 50 
F35 "C6" U R 10400 2600 50 
F36 "C7" U R 10400 2700 50 
F37 "C8" U R 10400 2800 50 
F38 "C9" U R 10400 2900 50 
F39 "C10" U R 10400 3000 50 
F40 "C11" U R 10400 3100 50 
F41 "C12" U R 10400 3200 50 
F42 "C13" U R 10400 3300 50 
F43 "C14" U R 10400 3400 50 
F44 "C15" U R 10400 3500 50 
F45 "C16" U R 10400 3600 50 
F46 "C17" U R 10400 3700 50 
F47 "C18" U R 10400 3800 50 
F48 "C19" U R 10400 3900 50 
F49 "C20" U R 10400 4000 50 
F50 "C21" U R 10400 4100 50 
F51 "C22" U R 10400 4200 50 
F52 "C23" U R 10400 4300 50 
F53 "C24" U R 10400 4400 50 
F54 "C25" U R 10400 4500 50 
F55 "C26" U R 10400 4600 50 
F56 "C27" U R 10400 4700 50 
F57 "C28" U R 10400 4800 50 
F58 "C29" U R 10400 4900 50 
F59 "C30" U R 10400 5000 50 
F60 "C31" U R 10400 5100 50 
F61 "C32" U R 10400 5200 50 
F62 "C33" U R 10400 5300 50 
F63 "C34" U R 10400 5400 50 
F64 "C35" U R 10400 5500 50 
F65 "C36" U R 10400 5600 50 
F66 "C37" U R 10400 5700 50 
F67 "C38" U R 10400 5800 50 
F68 "C39" U R 10400 5900 50 
F69 "C40" U R 10400 6000 50 
$EndSheet
Wire Bus Line
	9250 2700 8700 2700
Wire Bus Line
	9250 2800 8700 2800
Text Label 8700 2700 0    50   ~ 0
AB[0..23]
Text Label 8700 2800 0    50   ~ 0
DB[0..15]
Wire Bus Line
	8700 3100 9250 3100
Text Label 8700 3100 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	9250 2300 8700 2300
Wire Wire Line
	9250 2400 8700 2400
Wire Wire Line
	9250 2500 8700 2500
Wire Wire Line
	9250 2600 8700 2600
Wire Wire Line
	9250 2200 8700 2200
Wire Wire Line
	9250 3500 8700 3500
Wire Wire Line
	9250 3600 8700 3600
Wire Wire Line
	9250 3700 8700 3700
Wire Wire Line
	9250 3200 8700 3200
Wire Wire Line
	9250 4000 8700 4000
Wire Wire Line
	9250 4100 8700 4100
Wire Wire Line
	9250 4200 8700 4200
Wire Wire Line
	9250 4300 8700 4300
Wire Wire Line
	9250 3900 8700 3900
Wire Wire Line
	9250 3800 8700 3800
Wire Wire Line
	9250 4600 8700 4600
Wire Wire Line
	9250 4700 8700 4700
Wire Wire Line
	9250 4500 8700 4500
Wire Wire Line
	9250 4400 8700 4400
Wire Bus Line
	8700 3400 9250 3400
Text Label 8700 3400 0    50   ~ 0
~IRQ[0..7]
Text Label 8700 3200 0    50   ~ 0
~IRQ
Wire Wire Line
	9250 2900 8700 2900
Wire Wire Line
	9250 3000 8700 3000
Wire Bus Line
	8700 2100 9250 2100
Text Label 8700 2100 0    50   ~ 0
IBUS[0..15]
Text Label 8700 2200 0    50   ~ 0
~RESET
Text Label 8700 2300 0    50   ~ 0
CLK1
Text Label 8700 2400 0    50   ~ 0
CLK2
Text Label 8700 2500 0    50   ~ 0
CLK3
Text Label 8700 2900 0    50   ~ 0
WSTB
Text Label 8700 3000 0    50   ~ 0
T34
Wire Wire Line
	9250 3300 8700 3300
Text Label 8700 3300 0    50   ~ 0
~IRQS
Text Label 8700 3500 0    50   ~ 0
~RSTHOLD
Text Label 8700 3600 0    50   ~ 0
~SYSDEV
Text Label 8700 3700 0    50   ~ 0
~IODEV1xx
Text Label 8700 3800 0    50   ~ 0
~IODEV2xx
Text Label 8700 3900 0    50   ~ 0
~IODEV3xx
Text Label 8700 4000 0    50   ~ 0
~MEM
Text Label 8700 4100 0    50   ~ 0
~IO
Text Label 8700 4200 0    50   ~ 0
~R
Text Label 8700 4400 0    50   ~ 0
~WS
Text Label 8700 4500 0    50   ~ 0
~ENDEXT
Text Label 8700 4600 0    50   ~ 0
~SKIPEXT
Text Label 8700 4700 0    50   ~ 0
~HALT
Text Label 8700 5000 0    50   ~ 0
ACTION[0..3]
Text Label 8700 5100 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	9250 5000 8700 5000
Wire Bus Line
	9250 5100 8700 5100
Wire Bus Line
	9250 5200 8700 5200
Wire Bus Line
	8700 5300 9250 5300
Text Label 8700 5300 0    50   ~ 0
RSVD[1..4]
Text Notes 10000 3950 1    100  ~ 20
Left Slot
Text Label 8700 4300 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5D8B16F5
P 6750 7050
AR Path="/5F67D4B5/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16F5" Ref="#PWR014"  Part="1" 
AR Path="/5D34E810/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR014" H 6750 6900 50  0001 C CNN
F 1 "+5V" H 6692 7087 50  0000 R CNN
F 2 "" H 6750 7050 50  0001 C CNN
F 3 "" H 6750 7050 50  0001 C CNN
	1    6750 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8B16FB
P 6750 7450
AR Path="/5F67D4B5/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16FB" Ref="#PWR015"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR015" H 6750 7200 50  0001 C CNN
F 1 "GND" H 6672 7413 50  0000 R CNN
F 2 "" H 6750 7450 50  0001 C CNN
F 3 "" H 6750 7450 50  0001 C CNN
	1    6750 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 7050 6750 7150
$Comp
L Device:CP_Small C6
U 1 1 5D8B1702
P 6750 7250
AR Path="/5D8B1702" Ref="C6"  Part="1" 
AR Path="/5D34E810/5D8B1702" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8B1702" Ref="C?"  Part="1" 
F 0 "C6" H 6662 7296 50  0000 R CNN
F 1 "47µF" H 6662 7205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6750 7250 50  0001 C CNN
F 3 "~" H 6750 7250 50  0001 C CNN
	1    6750 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 7350 6750 7450
$Comp
L power:+5V #PWR?
U 1 1 5D8C8446
P 6300 7050
AR Path="/5F67D4B5/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D8C8446" Ref="#PWR012"  Part="1" 
AR Path="/5D34E810/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8446" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H 6300 6900 50  0001 C CNN
F 1 "+5V" H 6242 7087 50  0000 R CNN
F 2 "" H 6300 7050 50  0001 C CNN
F 3 "" H 6300 7050 50  0001 C CNN
	1    6300 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8C844C
P 6300 7450
AR Path="/5F67D4B5/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D8C844C" Ref="#PWR013"  Part="1" 
AR Path="/5D34E810/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C844C" Ref="#PWR?"  Part="1" 
F 0 "#PWR013" H 6300 7200 50  0001 C CNN
F 1 "GND" H 6222 7413 50  0000 R CNN
F 2 "" H 6300 7450 50  0001 C CNN
F 3 "" H 6300 7450 50  0001 C CNN
	1    6300 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 7050 6300 7150
$Comp
L Device:CP_Small C5
U 1 1 5D8C8453
P 6300 7250
AR Path="/5D8C8453" Ref="C5"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C5" H 6212 7296 50  0000 R CNN
F 1 "47µF" H 6212 7205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6300 7250 50  0001 C CNN
F 3 "~" H 6300 7250 50  0001 C CNN
	1    6300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 7350 6300 7450
Text Notes 8900 1000 0    197  ~ 39
Card Edge
$Sheet
S 5900 1350 1150 1000
U 5D9672D4
F0 "Program Counter" 50
F1 "cft-reg-pc.sch" 50
F2 "~FPH" I R 7050 2100 50 
F3 "~FPL" I R 7050 2200 50 
F4 "~READ" I L 5900 1900 50 
F5 "~INC" I L 5900 2100 50 
F6 "~WRITE" I L 5900 2000 50 
F7 "RESET" I L 5900 1500 50 
F8 "IBUS[0..15]" I L 5900 1700 50 
F9 "FPD[0..7]" T R 7050 2000 50 
F10 "PC[10..15]" O R 7050 1500 50 
$EndSheet
Text Notes 5800 950  0    197  ~ 39
Registers
Text Notes 750  950  0    197  ~ 39
Decoders
$Comp
L alexios:74HC138 U2
U 1 1 5DA3111B
P 1800 2500
F 0 "U2" H 1800 3167 50  0000 C CNN
F 1 "74HC138" H 1800 3076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 1800 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1800 2500 50  0001 C CNN
F 4 "Yes" H 1725 1675 50  0001 C CNN "Verified"
	1    1800 2500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U4
U 1 1 5DA3323E
P 1800 5400
F 0 "U4" H 1800 6067 50  0000 C CNN
F 1 "74HC138" H 1800 5976 50  0000 C CNN
F 2 "alexios:SOIC-16" H 1800 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1800 5400 50  0001 C CNN
F 4 "Yes" H 1725 4575 50  0001 C CNN "Verified"
	1    1800 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5000 950  5000
Wire Wire Line
	1300 5100 950  5100
Wire Wire Line
	1300 5200 950  5200
Wire Wire Line
	1300 5600 950  5600
Text Label 1000 5600 0    50   ~ 0
ACTION3
Text Label 1000 5000 0    50   ~ 0
ACTION0
Text Label 1000 5100 0    50   ~ 0
ACTION1
Text Label 1000 5200 0    50   ~ 0
ACTION2
$Comp
L power:GND #PWR01
U 1 1 5DA37617
P 1250 5850
F 0 "#PWR01" H 1250 5600 50  0001 C CNN
F 1 "GND" H 1255 5677 50  0000 C CNN
F 2 "" H 1250 5850 50  0001 C CNN
F 3 "" H 1250 5850 50  0001 C CNN
	1    1250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5800 1250 5800
Wire Wire Line
	1250 5800 1250 5850
Entry Wire Line
	850  4900 950  5000
Entry Wire Line
	850  5000 950  5100
Entry Wire Line
	850  5100 950  5200
Entry Wire Line
	850  5500 950  5600
Text Label 2900 5000 2    50   ~ 0
~ACTION-INCPC
Text Label 2900 5200 2    50   ~ 0
~ACTION-INCDR
Text Label 2900 5400 2    50   ~ 0
~ACTION-INCAC
Text Label 2900 5500 2    50   ~ 0
~ACTION-DECAC
Text Label 2900 5600 2    50   ~ 0
~ACTION-INCSP
Text Label 2900 5700 2    50   ~ 0
~ACTION-DECSP
Wire Wire Line
	2300 5000 2900 5000
Text Notes 1850 2750 1    50   ~ 10
RADDR=010xx
Wire Wire Line
	1300 2700 950  2700
Wire Wire Line
	1300 2800 950  2800
Wire Wire Line
	1300 2100 950  2100
Wire Wire Line
	1300 2200 950  2200
Wire Wire Line
	1300 2300 950  2300
Wire Wire Line
	1300 4150 950  4150
Wire Wire Line
	1300 4250 950  4250
Wire Wire Line
	1300 3550 950  3550
Wire Wire Line
	1300 3650 950  3650
Wire Wire Line
	1300 3750 950  3750
Text Notes 1850 4250 1    50   ~ 10
WADDR=010xx
Text Label 1000 2100 0    50   ~ 0
RADDR0
Text Label 1000 2200 0    50   ~ 0
RADDR1
Text Label 1000 2300 0    50   ~ 0
RADDR2
Text Label 1000 2700 0    50   ~ 0
RADDR3
Text Label 1000 2800 0    50   ~ 0
RADDR4
$Comp
L power:GND #PWR02
U 1 1 5D9C912E
P 1300 2900
F 0 "#PWR02" H 1300 2650 50  0001 C CNN
F 1 "GND" H 1305 2727 50  0000 C CNN
F 2 "" H 1300 2900 50  0001 C CNN
F 3 "" H 1300 2900 50  0001 C CNN
	1    1300 2900
	1    0    0    -1  
$EndComp
Text Label 1000 3550 0    50   ~ 0
WADDR0
Text Label 1000 3650 0    50   ~ 0
WADDR1
Text Label 1000 3750 0    50   ~ 0
WADDR2
Text Label 1000 4250 0    50   ~ 0
WADDR4
Text Label 1000 4150 0    50   ~ 0
WADDR3
Entry Wire Line
	850  2000 950  2100
Entry Wire Line
	850  2100 950  2200
Entry Wire Line
	850  2200 950  2300
Entry Wire Line
	850  2600 950  2700
Entry Wire Line
	850  2700 950  2800
Entry Wire Line
	850  3450 950  3550
Entry Wire Line
	850  3550 950  3650
Entry Wire Line
	850  3650 950  3750
Entry Wire Line
	850  4050 950  4150
Entry Wire Line
	850  4150 950  4250
Text Label 2900 3650 2    50   ~ 0
~WRITE-DR
Text Label 2900 3750 2    50   ~ 0
~WRITE-AC
Text Label 2900 3850 2    50   ~ 0
~WRITE-SP
NoConn ~ 2300 2500
NoConn ~ 2300 2600
NoConn ~ 2300 2700
NoConn ~ 2300 2800
NoConn ~ 2300 3950
NoConn ~ 2300 4050
NoConn ~ 2300 4150
NoConn ~ 2300 4250
Text Label 850  2600 1    50   ~ 0
RADDR[4..0]
Text Label 850  4050 1    50   ~ 0
WADDR[4..0]
Text Label 850  5450 1    50   ~ 0
ACTION[3..0]
Text Label 5050 1700 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5900 1700 5050 1700
Text Label 5050 3000 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5900 3000 5050 3000
Text Label 5050 2800 0    50   ~ 0
RESET
Text Label 5050 1900 0    50   ~ 0
~READ-PC
Text Label 5050 2000 0    50   ~ 0
~WRITE-PC
Wire Wire Line
	5900 3200 5050 3200
Wire Wire Line
	5900 3300 5050 3300
Wire Wire Line
	5900 3400 5050 3400
Wire Wire Line
	5900 3500 5050 3500
Text Label 5050 3200 0    50   ~ 0
~READ-DR
Text Label 5050 3300 0    50   ~ 0
~WRITE-DR
Wire Bus Line
	7050 2000 7550 2000
Text Label 7550 2000 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	7050 2100 7550 2100
Wire Wire Line
	7050 2200 7550 2200
Text Label 7550 2100 2    50   ~ 0
~FPPCH
Text Label 7550 2200 2    50   ~ 0
~FPPCL
Wire Bus Line
	7050 3300 7550 3300
Text Label 7550 3300 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	7050 3400 7550 3400
Wire Wire Line
	7050 3500 7550 3500
Text Label 7550 3400 2    50   ~ 0
~FPDRH
Text Label 7550 3500 2    50   ~ 0
~FPDRL
Wire Bus Line
	7050 1500 7550 1500
Text Label 7550 1500 2    50   ~ 0
PC[10..15]
Text Label 10900 4300 2    50   ~ 0
AC0
Text Label 10900 4400 2    50   ~ 0
AC1
Text Label 10900 4500 2    50   ~ 0
AC2
Text Label 10900 4600 2    50   ~ 0
AC3
Text Label 10900 4700 2    50   ~ 0
AC4
Text Label 10900 4800 2    50   ~ 0
AC5
Text Label 10900 4900 2    50   ~ 0
AC6
Text Label 10900 5000 2    50   ~ 0
AC7
Text Label 10900 5100 2    50   ~ 0
AC8
Text Label 10900 5200 2    50   ~ 0
AC9
Text Label 10900 5300 2    50   ~ 0
AC10
Text Label 10900 5400 2    50   ~ 0
AC11
Text Label 10900 5500 2    50   ~ 0
AC12
Text Label 10900 5600 2    50   ~ 0
AC13
Text Label 10900 5700 2    50   ~ 0
AC14
Text Label 10900 5800 2    50   ~ 0
AC15
Text Label 10900 5900 2    50   ~ 0
FZ
Text Label 10900 6000 2    50   ~ 0
~ACCPL
Wire Wire Line
	10400 4300 10900 4300
Wire Wire Line
	10400 4400 10900 4400
Wire Wire Line
	10400 4500 10900 4500
Wire Wire Line
	10400 4600 10900 4600
Wire Wire Line
	10400 4700 10900 4700
Wire Wire Line
	10400 4800 10900 4800
Wire Wire Line
	10400 4900 10900 4900
Wire Wire Line
	10400 5000 10900 5000
Wire Wire Line
	10400 5100 10900 5100
Wire Wire Line
	10400 5200 10900 5200
Wire Wire Line
	10400 5300 10900 5300
Wire Wire Line
	10400 5400 10900 5400
Wire Wire Line
	10400 5500 10900 5500
Wire Wire Line
	10400 5600 10900 5600
Wire Wire Line
	10400 5700 10900 5700
Wire Wire Line
	10400 5800 10900 5800
Wire Wire Line
	10400 5900 10900 5900
Wire Wire Line
	10400 6000 10900 6000
Wire Wire Line
	5900 2100 5050 2100
Wire Wire Line
	5900 2000 5050 2000
Wire Wire Line
	5900 1900 5050 1900
Text Label 5050 1500 0    50   ~ 0
RESET
$Comp
L alexios:74HC138 U2
U 2 1 5DD287C8
P 2600 7300
F 0 "U2" H 2779 7346 50  0000 L CNN
F 1 "74HC138" H 2779 7255 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2600 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2600 7300 50  0001 C CNN
F 4 "Yes" H 2525 6475 50  0001 C CNN "Verified"
	2    2600 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U3
U 2 1 5DD288BF
P 4000 7300
F 0 "U3" H 4179 7346 50  0000 L CNN
F 1 "74HC138" H 4179 7255 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4000 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4000 7300 50  0001 C CNN
F 4 "Yes" H 3925 6475 50  0001 C CNN "Verified"
	2    4000 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U4
U 2 1 5DD28B4B
P 5400 7300
F 0 "U4" H 5579 7346 50  0000 L CNN
F 1 "74HC138" H 5579 7255 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5400 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5400 7300 50  0001 C CNN
F 4 "Yes" H 5325 6475 50  0001 C CNN "Verified"
	2    5400 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD296FB
P 2250 7200
AR Path="/5CE16E65/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5DD296FB" Ref="#PWR06"  Part="1" 
AR Path="/5D54E677/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD296FB" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD296FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR06" H 2250 7050 50  0001 C CNN
F 1 "+5V" H 2265 7373 50  0000 C CNN
F 2 "" H 2250 7200 50  0001 C CNN
F 3 "" H 2250 7200 50  0001 C CNN
	1    2250 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD29701
P 2250 7400
AR Path="/5CE16E65/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5DD29701" Ref="#PWR07"  Part="1" 
AR Path="/5D54E677/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD29701" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD29701" Ref="#PWR?"  Part="1" 
F 0 "#PWR07" H 2250 7150 50  0001 C CNN
F 1 "GND" H 2255 7227 50  0000 C CNN
F 2 "" H 2250 7400 50  0001 C CNN
F 3 "" H 2250 7400 50  0001 C CNN
	1    2250 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD29707
P 2250 7300
AR Path="/5CC0D65F/5DD29707" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD29707" Ref="C?"  Part="1" 
AR Path="/5DD29707" Ref="C2"  Part="1" 
AR Path="/5D54E677/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD29707" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD29707" Ref="C?"  Part="1" 
F 0 "C2" H 2159 7346 50  0000 R CNN
F 1 "100nF" H 2159 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 7300 50  0001 C CNN
F 3 "~" H 2250 7300 50  0001 C CNN
	1    2250 7300
	1    0    0    -1  
$EndComp
Connection ~ 2250 7200
Connection ~ 2250 7400
$Comp
L power:+5V #PWR?
U 1 1 5DD3D3CC
P 850 7200
AR Path="/5CE16E65/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D3CC" Ref="#PWR04"  Part="1" 
AR Path="/5D54E677/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD3D3CC" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD3D3CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 850 7050 50  0001 C CNN
F 1 "+5V" H 865 7373 50  0000 C CNN
F 2 "" H 850 7200 50  0001 C CNN
F 3 "" H 850 7200 50  0001 C CNN
	1    850  7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD3D3D2
P 850 7400
AR Path="/5CE16E65/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D3D2" Ref="#PWR05"  Part="1" 
AR Path="/5D54E677/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD3D3D2" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD3D3D2" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 850 7150 50  0001 C CNN
F 1 "GND" H 855 7227 50  0000 C CNN
F 2 "" H 850 7400 50  0001 C CNN
F 3 "" H 850 7400 50  0001 C CNN
	1    850  7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD3D3D8
P 850 7300
AR Path="/5CC0D65F/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5DD3D3D8" Ref="C1"  Part="1" 
AR Path="/5D54E677/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD3D3D8" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD3D3D8" Ref="C?"  Part="1" 
F 0 "C1" H 759 7346 50  0000 R CNN
F 1 "100nF" H 759 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 850 7300 50  0001 C CNN
F 3 "~" H 850 7300 50  0001 C CNN
	1    850  7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD47236
P 3650 7200
AR Path="/5CE16E65/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5DD47236" Ref="#PWR08"  Part="1" 
AR Path="/5D54E677/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD47236" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD47236" Ref="#PWR?"  Part="1" 
F 0 "#PWR08" H 3650 7050 50  0001 C CNN
F 1 "+5V" H 3665 7373 50  0000 C CNN
F 2 "" H 3650 7200 50  0001 C CNN
F 3 "" H 3650 7200 50  0001 C CNN
	1    3650 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD4723C
P 3650 7400
AR Path="/5CE16E65/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5DD4723C" Ref="#PWR09"  Part="1" 
AR Path="/5D54E677/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD4723C" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD4723C" Ref="#PWR?"  Part="1" 
F 0 "#PWR09" H 3650 7150 50  0001 C CNN
F 1 "GND" H 3655 7227 50  0000 C CNN
F 2 "" H 3650 7400 50  0001 C CNN
F 3 "" H 3650 7400 50  0001 C CNN
	1    3650 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD47242
P 3650 7300
AR Path="/5CC0D65F/5DD47242" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD47242" Ref="C?"  Part="1" 
AR Path="/5DD47242" Ref="C3"  Part="1" 
AR Path="/5D54E677/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD47242" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD47242" Ref="C?"  Part="1" 
F 0 "C3" H 3559 7346 50  0000 R CNN
F 1 "100nF" H 3559 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 7300 50  0001 C CNN
F 3 "~" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD51026
P 5050 7200
AR Path="/5CE16E65/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5DD51026" Ref="#PWR010"  Part="1" 
AR Path="/5D54E677/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD51026" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD51026" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 5050 7050 50  0001 C CNN
F 1 "+5V" H 5065 7373 50  0000 C CNN
F 2 "" H 5050 7200 50  0001 C CNN
F 3 "" H 5050 7200 50  0001 C CNN
	1    5050 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD5102C
P 5050 7400
AR Path="/5CE16E65/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5DD5102C" Ref="#PWR011"  Part="1" 
AR Path="/5D54E677/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DD5102C" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DD5102C" Ref="#PWR?"  Part="1" 
F 0 "#PWR011" H 5050 7150 50  0001 C CNN
F 1 "GND" H 5055 7227 50  0000 C CNN
F 2 "" H 5050 7400 50  0001 C CNN
F 3 "" H 5050 7400 50  0001 C CNN
	1    5050 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD51032
P 5050 7300
AR Path="/5CC0D65F/5DD51032" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5DD51032" Ref="C?"  Part="1" 
AR Path="/5DD51032" Ref="C4"  Part="1" 
AR Path="/5D54E677/5DD51032" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5DD51032" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5DD51032" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5DD51032" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5DD51032" Ref="C?"  Part="1" 
F 0 "C4" H 4959 7346 50  0000 R CNN
F 1 "100nF" H 4959 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5050 7300 50  0001 C CNN
F 3 "~" H 5050 7300 50  0001 C CNN
	1    5050 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U1
U 2 1 5DD5B011
P 1200 7300
F 0 "U1" H 1380 7346 50  0000 L CNN
F 1 "74LVC1G04" H 1380 7255 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1200 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 1200 7300 50  0001 C CNN
	2    1200 7300
	1    0    0    -1  
$EndComp
Connection ~ 850  7400
Connection ~ 850  7200
Connection ~ 3650 7200
Connection ~ 3650 7400
Connection ~ 5050 7200
Connection ~ 5050 7400
NoConn ~ 8700 2300
NoConn ~ 8700 2400
NoConn ~ 8700 2500
NoConn ~ 8700 2700
NoConn ~ 8700 2800
NoConn ~ 8700 2900
NoConn ~ 8700 3000
NoConn ~ 8700 3200
NoConn ~ 8700 3300
NoConn ~ 8700 3400
NoConn ~ 8700 3500
NoConn ~ 8700 3600
NoConn ~ 8700 3700
NoConn ~ 8700 3800
NoConn ~ 8700 3900
NoConn ~ 8700 4000
NoConn ~ 8700 4100
NoConn ~ 8700 4200
NoConn ~ 8700 4300
NoConn ~ 8700 4400
NoConn ~ 8700 4500
NoConn ~ 8700 4600
NoConn ~ 8700 4700
NoConn ~ 8700 5300
$Sheet
S 5900 3950 1150 1000
U 5D9746C5
F0 "Accumulator" 50
F1 "cft-reg-ac.sch" 50
F2 "~FPH" I R 7050 4700 50 
F3 "~FPL" I R 7050 4800 50 
F4 "~READ" I L 5900 4500 50 
F5 "~INC" I L 5900 4700 50 
F6 "~WRITE" I L 5900 4600 50 
F7 "RESET" I L 5900 4100 50 
F8 "IBUS[0..15]" I L 5900 4300 50 
F9 "~DEC" I L 5900 4800 50 
F10 "FPD[0..7]" T R 7050 4600 50 
F11 "FZ" O R 7050 4300 50 
F12 "~REGCPL" O R 7050 4400 50 
F13 "AC[0..15]" O R 7050 4100 50 
$EndSheet
Text Label 5050 4300 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5900 4300 5050 4300
Text Label 5050 5600 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	5900 5600 5050 5600
Text Label 5050 5400 0    50   ~ 0
RESET
Wire Wire Line
	5900 5800 5050 5800
Wire Wire Line
	5900 5900 5050 5900
Wire Wire Line
	5900 6100 5050 6100
Wire Bus Line
	7050 4600 7550 4600
Text Label 7550 4600 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	7050 4700 7550 4700
Wire Wire Line
	7050 4800 7550 4800
Text Label 7550 4700 2    50   ~ 0
~FPACH
Text Label 7550 4800 2    50   ~ 0
~FPACL
Wire Bus Line
	7050 5900 7550 5900
Text Label 7550 5900 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	7050 6000 7550 6000
Wire Wire Line
	7050 6100 7550 6100
Text Label 7550 6000 2    50   ~ 0
~FPSPH
Text Label 7550 6100 2    50   ~ 0
~FPSPL
Wire Bus Line
	7050 4100 7550 4100
Text Label 7550 4100 2    50   ~ 0
AC[0..15]
Wire Wire Line
	7050 4300 7550 4300
Text Label 7550 4300 2    50   ~ 0
FZ
Wire Wire Line
	7050 4400 7550 4400
Text Label 7550 4400 2    50   ~ 0
~ACCPL
Wire Wire Line
	5900 4800 5050 4800
Wire Wire Line
	5900 4700 5050 4700
Wire Wire Line
	5900 4600 5050 4600
Wire Wire Line
	5900 4500 5050 4500
Text Label 5050 4100 0    50   ~ 0
RESET
$Sheet
S 5900 2650 1150 1000
U 5D967A8B
F0 "Data Register" 50
F1 "cft-reg-dr-sp.sch" 50
F2 "~FPH" I R 7050 3400 50 
F3 "~FPL" I R 7050 3500 50 
F4 "~READ" I L 5900 3200 50 
F5 "~INC" I L 5900 3400 50 
F6 "~WRITE" I L 5900 3300 50 
F7 "RESET" I L 5900 2800 50 
F8 "IBUS[0..15]" I L 5900 3000 50 
F9 "~DEC" I L 5900 3500 50 
F10 "FPD[0..7]" T R 7050 3300 50 
$EndSheet
$Sheet
S 5900 5250 1150 1000
U 5D9BD2A8
F0 "Stack Pointer" 50
F1 "cft-reg-dr-sp.sch" 50
F2 "~FPH" I R 7050 6000 50 
F3 "~FPL" I R 7050 6100 50 
F4 "~READ" I L 5900 5800 50 
F5 "~INC" I L 5900 6000 50 
F6 "~WRITE" I L 5900 5900 50 
F7 "RESET" I L 5900 5400 50 
F8 "IBUS[0..15]" I L 5900 5600 50 
F9 "~DEC" I L 5900 6100 50 
F10 "FPD[0..7]" T R 7050 5900 50 
$EndSheet
Text Label 2900 5300 2    50   ~ 0
~ACTION-DECDR
Wire Wire Line
	2300 5200 2900 5200
Wire Wire Line
	2300 5300 2900 5300
Wire Wire Line
	2300 5400 2900 5400
Wire Wire Line
	2300 5500 2900 5500
Wire Wire Line
	2300 5600 2900 5600
Wire Wire Line
	2300 5700 2900 5700
Wire Wire Line
	2300 3550 2900 3550
Wire Wire Line
	2300 3650 2900 3650
Wire Wire Line
	2300 3750 2900 3750
Wire Wire Line
	2300 3850 2900 3850
Text Label 2900 3550 2    50   ~ 0
~WRITE-PC
Text Label 2900 2400 2    50   ~ 0
~READ-SP
Text Label 2900 2300 2    50   ~ 0
~READ-AC
Text Label 2900 2200 2    50   ~ 0
~READ-DR
Text Label 2900 2100 2    50   ~ 0
~READ-PC
Wire Wire Line
	2300 2100 2900 2100
Wire Wire Line
	2300 2200 2900 2200
Wire Wire Line
	2300 2300 2900 2300
Wire Wire Line
	2300 2400 2900 2400
Text Label 850  1450 0    50   ~ 0
~RESET
Wire Wire Line
	1400 1450 850  1450
$Comp
L alexios:74LVC1G04 U1
U 1 1 5DAE39EC
P 1700 1450
F 0 "U1" H 1650 1717 50  0000 C CNN
F 1 "74LVC1G04" H 1650 1626 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1700 1450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 1700 1450 50  0001 C CNN
	1    1700 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 1500 5900 1500
Wire Wire Line
	5050 2800 5900 2800
Wire Wire Line
	5050 4100 5900 4100
Wire Wire Line
	5050 5400 5900 5400
Text Label 2400 1450 2    50   ~ 0
RESET
Wire Wire Line
	1900 1450 2400 1450
Wire Wire Line
	5900 6000 5050 6000
Text Label 5050 3500 0    50   ~ 0
~ACTION-DECDR
Text Label 5050 3400 0    50   ~ 0
~ACTION-INCDR
Text Label 5050 4500 0    50   ~ 0
~READ-AC
Text Label 5050 4600 0    50   ~ 0
~WRITE-AC
Text Label 5050 4700 0    50   ~ 0
~ACTION-INCAC
Text Label 5050 4800 0    50   ~ 0
~ACTION-DECAC
Text Label 5050 5800 0    50   ~ 0
~READ-SP
Text Label 5050 5900 0    50   ~ 0
~WRITE-SP
Text Label 5050 6000 0    50   ~ 0
~ACTION-INCSP
Text Label 5050 6100 0    50   ~ 0
~ACTION-DECSP
Wire Wire Line
	10400 2100 10900 2100
Wire Wire Line
	10400 2200 10900 2200
Wire Wire Line
	10400 2300 10900 2300
Wire Wire Line
	10400 2400 10900 2400
Wire Wire Line
	10400 2500 10900 2500
Wire Wire Line
	10400 2600 10900 2600
Wire Wire Line
	10400 3100 10900 3100
Wire Wire Line
	10400 3200 10900 3200
Wire Wire Line
	10400 3300 10900 3300
Wire Wire Line
	10400 3400 10900 3400
Wire Wire Line
	10400 3500 10900 3500
Wire Wire Line
	10400 3600 10900 3600
Wire Wire Line
	10400 3700 10900 3700
Wire Wire Line
	10400 3800 10900 3800
Text Label 10900 3700 2    50   ~ 0
~FPSPH
Text Label 10900 3800 2    50   ~ 0
~FPSPL
Text Label 10900 3500 2    50   ~ 0
~FPACH
Text Label 10900 3600 2    50   ~ 0
~FPACL
Text Label 10900 3300 2    50   ~ 0
~FPDRH
Text Label 10900 3400 2    50   ~ 0
~FPDRL
Text Label 10900 3100 2    50   ~ 0
~FPPCH
Text Label 10900 3200 2    50   ~ 0
~FPPCL
Text Label 10900 2100 2    50   ~ 0
PC10
Text Label 10900 2200 2    50   ~ 0
PC11
Text Label 10900 2300 2    50   ~ 0
PC12
Text Label 10900 2400 2    50   ~ 0
PC13
Text Label 10900 2500 2    50   ~ 0
PC14
Text Label 10900 2600 2    50   ~ 0
PC15
Text Label 5050 2100 0    50   ~ 0
~ACTION-INCPC
NoConn ~ 10900 4000
NoConn ~ 10900 3900
NoConn ~ 10900 3000
NoConn ~ 10900 2900
NoConn ~ 10900 2800
NoConn ~ 10900 2700
Wire Wire Line
	10400 4100 10900 4100
Wire Wire Line
	10400 4000 10900 4000
Wire Wire Line
	10400 3900 10900 3900
Wire Wire Line
	10400 3000 10900 3000
Wire Wire Line
	10400 2900 10900 2900
Wire Wire Line
	10400 2800 10900 2800
Wire Wire Line
	10400 2700 10900 2700
NoConn ~ 10900 4100
Wire Wire Line
	10400 4200 10900 4200
NoConn ~ 10900 4200
NoConn ~ 2300 5100
Text Notes 2950 5100 0    50   ~ 0
The PC doesn't decrement
Text Label 8700 5200 0    50   ~ 0
RADDR[0..4]
Text Notes 2600 3200 0    50   ~ 0
[RW]ADDR\n\n01000\n01001\n01010\n01011
Text Notes 3150 3200 0    50   ~ 0
Reg\n\nPC\nDR\nAC\nSP
Wire Notes Line width 12 style solid
	2550 2675 3350 2675
Wire Notes Line width 12 style solid
	2550 3250 2550 2675
Wire Notes Line width 12 style solid
	3350 3250 2550 3250
Wire Notes Line width 12 style solid
	3350 2675 3350 3250
Wire Notes Line style solid
	2550 2850 3350 2850
Wire Notes Line
	3100 2675 3100 3250
$Comp
L alexios:74HC138 U3
U 1 1 5DA31171
P 1800 3950
F 0 "U3" H 1800 4617 50  0000 C CNN
F 1 "74HC138" H 1800 4526 50  0000 C CNN
F 2 "alexios:SOIC-16" H 1800 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1800 3950 50  0001 C CNN
F 4 "Yes" H 1725 3125 50  0001 C CNN "Verified"
	1    1800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 4350 1000 4350
Text Label 1000 4350 0    50   ~ 0
CLK4
Text Label 8700 2600 0    50   ~ 0
CLK4
Text Notes 10700 5800 2    50   ~ 0
FN≡
Text Label 1000 5700 0    50   ~ 0
CLK3
Wire Wire Line
	1000 5700 1300 5700
Text Notes 1550 6600 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
Wire Bus Line
	850  3350 850  4150
Wire Bus Line
	850  1900 850  2700
Wire Bus Line
	850  4800 850  5500
$EndSCHEMATC
