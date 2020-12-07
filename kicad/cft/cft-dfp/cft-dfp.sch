EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 14
Title "Debugging Front Panel"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 "Last revision manufactured: 1939."
Comment3 "R1945 reallocates A72/A73 due to short."
Comment4 ""
$EndDescr
$Sheet
S -3300 450  1150 4200
U 5D34E810
F0 "Left Edge Connector" 50
F1 "dfp-bus-left.sch" 50
F2 "AB[0..23]" U L -3300 1200 50 
F3 "DB[0..15]" U L -3300 1300 50 
F4 "FPD[0..7]" U L -3300 1600 50 
F5 "IBUS[0..15]" U L -3300 600 50 
F6 "~RESET" U L -3300 700 50 
F7 "CLK1" U L -3300 800 50 
F8 "CLK2" U L -3300 900 50 
F9 "CLK3" U L -3300 1000 50 
F10 "CLK4" U L -3300 1100 50 
F11 "WSTB" U L -3300 1400 50 
F12 "T34" U L -3300 1500 50 
F13 "~IRQ" U L -3300 1700 50 
F14 "~IRQS" U L -3300 1800 50 
F15 "~IRQ[0..7]" U L -3300 1900 50 
F16 "~RSTHOLD" U L -3300 2000 50 
F17 "~SYSDEV" U L -3300 2100 50 
F18 "~IODEV1xx" U L -3300 2200 50 
F19 "~IODEV2xx" U L -3300 2300 50 
F20 "~IODEV3xx" U L -3300 2400 50 
F21 "~MEM" U L -3300 2500 50 
F22 "~IO" U L -3300 2600 50 
F23 "~R" U L -3300 2700 50 
F24 "~W" U L -3300 2800 50 
F25 "~WS" U L -3300 2900 50 
F26 "~ENDEXT" U L -3300 3000 50 
F27 "~SKIPEXT" U L -3300 3100 50 
F28 "~HALT" U L -3300 3200 50 
F29 "ACTION[0..3]" U L -3300 3500 50 
F30 "WADDR[0..4]" U L -3300 3600 50 
F31 "RADDR[0..4]" U L -3300 3700 50 
F32 "RSVD[0..6]" U L -3300 3800 50 
F33 "C1" U R -2150 600 50 
F34 "C2" U R -2150 700 50 
F35 "C3" U R -2150 800 50 
F36 "C4" U R -2150 900 50 
F37 "C5" U R -2150 1000 50 
F38 "C6" U R -2150 1100 50 
F39 "C7" U R -2150 1200 50 
F40 "C8" U R -2150 1300 50 
F41 "C9" U R -2150 1400 50 
F42 "C10" U R -2150 1500 50 
F43 "C11" U R -2150 1600 50 
F44 "C12" U R -2150 1700 50 
F45 "C13" U R -2150 1800 50 
F46 "C14" U R -2150 1900 50 
F47 "C15" U R -2150 2000 50 
F48 "C16" U R -2150 2100 50 
F49 "C17" U R -2150 2200 50 
F50 "C18" U R -2150 2300 50 
F51 "C19" U R -2150 2400 50 
F52 "C20" U R -2150 2500 50 
F53 "C21" U R -2150 2600 50 
F54 "C22" U R -2150 2700 50 
F55 "C23" U R -2150 2800 50 
F56 "C24" U R -2150 2900 50 
F57 "C25" U R -2150 3000 50 
F58 "C26" U R -2150 3100 50 
F59 "C27" U R -2150 3200 50 
F60 "C28" U R -2150 3300 50 
F61 "C29" U R -2150 3400 50 
F62 "C30" U R -2150 3500 50 
F63 "C31" U R -2150 3600 50 
F64 "C32" U R -2150 3700 50 
F65 "C33" U R -2150 3800 50 
F66 "C34" U R -2150 3900 50 
F67 "C35" U R -2150 4000 50 
F68 "C36" U R -2150 4100 50 
F69 "C37" U R -2150 4200 50 
F70 "C38" U R -2150 4300 50 
F71 "C39" U R -2150 4400 50 
F72 "C40" U R -2150 4500 50 
F73 "~RUEN" U L -3300 3300 50 
F74 "~WAITING" U L -3300 3400 50 
$EndSheet
Wire Wire Line
	-10450 1500 -10100 1500
Wire Wire Line
	-10450 1400 -10100 1400
Wire Wire Line
	-10450 1300 -10100 1300
Wire Wire Line
	-10450 1200 -10100 1200
Wire Wire Line
	-10450 1100 -10100 1100
Wire Wire Line
	-10450 1000 -10100 1000
Wire Wire Line
	-10450 900  -10100 900 
Text Label -10100 1500 2    50   ~ 0
FPA7
Text Label -10100 1400 2    50   ~ 0
FPA6
Text Label -10100 1300 2    50   ~ 0
FPA5
Text Label -10100 1200 2    50   ~ 0
FPA4
Text Label -10100 1100 2    50   ~ 0
FPA3
Text Label -10100 1000 2    50   ~ 0
FPA2
Text Label -10100 900  2    50   ~ 0
FPA1
Text Label -10100 800  2    50   ~ 0
FPA0
Wire Wire Line
	-10450 800  -10100 800 
Text Label -11900 1700 0    50   ~ 0
ALE
Wire Wire Line
	-14750 1300 -15250 1300
Wire Wire Line
	-14250 200  -14050 200 
Wire Wire Line
	-14050 200  -13850 200 
Connection ~ -14050 200 
$Comp
L power:+5V #PWR0106
U 1 1 5CB9129C
P -13850 200
F 0 "#PWR0106" H -13850 50  50  0001 C CNN
F 1 "+5V" H -13950 100 50  0000 C CNN
F 2 "" H -13850 200 50  0001 C CNN
F 3 "" H -13850 200 50  0001 C CNN
	1    -13850 200 
	1    0    0    -1  
$EndComp
Entry Wire Line
	-12800 800  -12700 700 
Entry Wire Line
	-12800 900  -12700 800 
Entry Wire Line
	-12800 1000 -12700 900 
Entry Wire Line
	-12800 1100 -12700 1000
Entry Wire Line
	-12800 1200 -12700 1100
Entry Wire Line
	-12800 1300 -12700 1200
Entry Wire Line
	-12800 1400 -12700 1300
Entry Wire Line
	-12800 1500 -12700 1400
Entry Wire Line
	-11900 800  -12000 700 
Entry Wire Line
	-11900 900  -12000 800 
Entry Wire Line
	-11900 1000 -12000 900 
Entry Wire Line
	-11900 1100 -12000 1000
Entry Wire Line
	-11900 1200 -12000 1100
Entry Wire Line
	-11900 1300 -12000 1200
Entry Wire Line
	-11900 1400 -12000 1300
Entry Wire Line
	-11900 1500 -12000 1400
Wire Wire Line
	-13250 1500 -12800 1500
Wire Wire Line
	-13250 1400 -12800 1400
Wire Wire Line
	-13250 1300 -12800 1300
Wire Wire Line
	-13250 1200 -12800 1200
Wire Wire Line
	-13250 1100 -12800 1100
Wire Wire Line
	-13250 1000 -12800 1000
Wire Wire Line
	-13250 900  -12800 900 
Wire Wire Line
	-13250 800  -12800 800 
$Comp
L alexios:74AC573 U107
U 1 1 5E1B80B6
P -10950 1300
F 0 "U107" H -10950 2067 50  0000 C CNN
F 1 "74AC573" H -10950 1976 50  0000 C CNN
F 2 "alexios:SOIC-20W" H -10950 1300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H -10950 1300 50  0001 C CNN
F 4 "Yes" H -16250 -450 50  0001 C CNN "Verified"
	1    -10950 1300
	1    0    0    -1  
$EndComp
Wire Bus Line
	-3300 1200 -3850 1200
Wire Bus Line
	-3300 1300 -3850 1300
Text Label -3850 1200 0    50   ~ 0
AB[0..23]
Text Label -3850 1300 0    50   ~ 0
DB[0..15]
Wire Bus Line
	-3850 1600 -3300 1600
Text Label -3850 1600 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-3300 800  -3850 800 
Wire Wire Line
	-3300 900  -3850 900 
Wire Wire Line
	-3300 1000 -3850 1000
Wire Wire Line
	-3300 1100 -3850 1100
Wire Wire Line
	-3300 700  -3850 700 
Wire Wire Line
	-3300 2000 -3850 2000
Wire Wire Line
	-3300 2100 -3850 2100
Wire Wire Line
	-3300 2200 -3850 2200
Wire Wire Line
	-3300 1700 -3850 1700
Wire Wire Line
	-3300 2500 -3850 2500
Wire Wire Line
	-3300 2600 -3850 2600
Wire Wire Line
	-3300 2700 -3850 2700
Wire Wire Line
	-3300 2800 -3850 2800
Wire Wire Line
	-3300 2400 -3850 2400
Wire Wire Line
	-3300 2300 -3850 2300
Wire Wire Line
	-3300 3100 -3850 3100
Wire Wire Line
	-3300 3200 -3850 3200
Wire Wire Line
	-3300 3000 -3850 3000
Wire Wire Line
	-3300 2900 -3850 2900
Wire Bus Line
	-3850 1900 -3300 1900
Text Label -3850 1900 0    50   ~ 0
~IRQ[0..7]
Text Label -3850 1700 0    50   ~ 0
~IRQ
Wire Wire Line
	-3300 1400 -3850 1400
Wire Wire Line
	-3300 1500 -3850 1500
Wire Bus Line
	-3850 600  -3300 600 
Text Label -3850 600  0    50   ~ 0
IBUS[0..15]
Text Label -3850 700  0    50   ~ 0
~RESET
Text Label -3850 800  0    50   ~ 0
CLK1
Text Label -3850 900  0    50   ~ 0
CLK2
Text Label -3850 1000 0    50   ~ 0
CLK3
Text Label -3850 1100 0    50   ~ 0
CLK4
Text Label -3850 1400 0    50   ~ 0
WSTB
Text Label -3850 1500 0    50   ~ 0
T34
Wire Wire Line
	-3300 1800 -3850 1800
Text Label -3850 1800 0    50   ~ 0
~IRQS
Text Label -3850 2000 0    50   ~ 0
~RSTHOLD
Text Label -3850 2100 0    50   ~ 0
~SYSDEV
Text Label -3850 2200 0    50   ~ 0
~IODEV1xx
Text Label -3850 2300 0    50   ~ 0
~IODEV2xx
Text Label -3850 2400 0    50   ~ 0
~IODEV3xx
Text Label -3850 2500 0    50   ~ 0
~MEM
Text Label -3850 2600 0    50   ~ 0
~IO
Text Label -3850 2700 0    50   ~ 0
~R
Text Label -3850 2900 0    50   ~ 0
~WS
Text Label -3850 3000 0    50   ~ 0
~ENDEXT
Text Label -3850 3100 0    50   ~ 0
~SKIPEXT
Text Label -3850 3200 0    50   ~ 0
~HALT
Text Label -3850 3500 0    50   ~ 0
ACTION[0..3]
Text Label -3850 3600 0    50   ~ 0
WADDR[0..4]
Text Label -3850 3700 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	-3300 3500 -3850 3500
Wire Bus Line
	-3300 3600 -3850 3600
Wire Bus Line
	-3300 3700 -3850 3700
Wire Bus Line
	-3300 5700 -3850 5700
Wire Bus Line
	-3300 5800 -3850 5800
Text Label -3850 5700 0    50   ~ 0
AB[0..23]
Text Label -3850 5800 0    50   ~ 0
DB[0..15]
Wire Bus Line
	-3850 6100 -3300 6100
Text Label -3850 6100 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-3300 5300 -3850 5300
Wire Wire Line
	-3300 5400 -3850 5400
Wire Wire Line
	-3300 5500 -3850 5500
Wire Wire Line
	-3300 5600 -3850 5600
Wire Wire Line
	-3300 5200 -3850 5200
Wire Wire Line
	-3300 6500 -3850 6500
Wire Wire Line
	-3300 6600 -3850 6600
Wire Wire Line
	-3300 6700 -3850 6700
Wire Wire Line
	-3300 6200 -3850 6200
Wire Wire Line
	-3300 7000 -3850 7000
Wire Wire Line
	-3300 7100 -3850 7100
Wire Wire Line
	-3300 7200 -3850 7200
Wire Wire Line
	-3300 7300 -3850 7300
Wire Wire Line
	-3300 6900 -3850 6900
Wire Wire Line
	-3300 6800 -3850 6800
Wire Wire Line
	-3300 7600 -3850 7600
Wire Wire Line
	-3300 7700 -3850 7700
Wire Wire Line
	-3300 7500 -3850 7500
Wire Wire Line
	-3300 7400 -3850 7400
Wire Bus Line
	-3850 6400 -3300 6400
Text Label -3850 6400 0    50   ~ 0
~IRQ[0..7]
Text Label -3850 6200 0    50   ~ 0
~IRQ
Wire Wire Line
	-3300 5900 -3850 5900
Wire Wire Line
	-3300 6000 -3850 6000
Wire Bus Line
	-3850 5100 -3300 5100
Text Label -3850 5100 0    50   ~ 0
IBUS[0..15]
Text Label -3850 5200 0    50   ~ 0
~RESET
Text Label -3850 5300 0    50   ~ 0
CLK1
Text Label -3850 5400 0    50   ~ 0
CLK2
Text Label -3850 5500 0    50   ~ 0
CLK3
Text Label -3850 5600 0    50   ~ 0
CLK4
Text Label -3850 5900 0    50   ~ 0
WSTB
Text Label -3850 6000 0    50   ~ 0
T34
Wire Wire Line
	-3300 6300 -3850 6300
Text Label -3850 6300 0    50   ~ 0
~IRQS
Text Label -3850 6500 0    50   ~ 0
~RSTHOLD
Text Label -3850 6600 0    50   ~ 0
~SYSDEV
Text Label -3850 6700 0    50   ~ 0
~IODEV1xx
Text Label -3850 6800 0    50   ~ 0
~IODEV2xx
Text Label -3850 6900 0    50   ~ 0
~IODEV3xx
Text Label -3850 7000 0    50   ~ 0
~MEM
Text Label -3850 7100 0    50   ~ 0
~IO
Text Label -3850 7200 0    50   ~ 0
~R
Text Label -3850 7300 0    50   ~ 0
~W
Text Label -3850 7400 0    50   ~ 0
~WS
Text Label -3850 7500 0    50   ~ 0
~ENDEXT
Text Label -3850 7600 0    50   ~ 0
~SKIPEXT
Text Label -3850 7700 0    50   ~ 0
~HALT
Text Label -3850 8000 0    50   ~ 0
ACTION[0..3]
Text Label -3850 8100 0    50   ~ 0
WADDR[0..4]
Text Label -3850 8200 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	-3300 8000 -3850 8000
Wire Bus Line
	-3300 8100 -3850 8100
Wire Bus Line
	-3300 8200 -3850 8200
Text Notes -15500 7000 0    50   ~ 0
Socket this and try frequencies that\naren't harmonics of the CPU clock, 4 MHz to\navoid strobe effects on the front panel lights.\n\nThe panel will update at 1/21 the crystal frequency.
Text Notes -9350 5550 0    100  ~ 20
Front Panel\nAddress Decoder
Wire Wire Line
	-14750 1100 -15250 1100
Wire Wire Line
	-14750 1200 -15250 1200
Text Label -15250 1100 0    50   ~ 0
~WR
Text Label -15250 1200 0    50   ~ 0
~RD
Text Label -15250 1300 0    50   ~ 0
ALE
Wire Wire Line
	-11900 1700 -11450 1700
Text Label -12650 3800 2    50   ~ 0
~SCANEN
Wire Bus Line
	-3850 8300 -3300 8300
Text Label -3850 8300 0    50   ~ 0
RSVD[0..6]
Wire Bus Line
	-3850 3800 -3300 3800
Text Label -3850 3800 0    50   ~ 0
RSVD[0..6]
$Comp
L alexios:74LVC1G04 U102
U 1 1 5EAD772B
P -12000 2100
F 0 "U102" V -12004 2230 50  0000 L CNN
F 1 "74LVC1G04" V -12095 2230 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -12000 2100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H -12000 2100 50  0001 C CNN
	1    -12000 2100
	0    1    -1   0   
$EndComp
Text Label -11900 1800 0    50   ~ 0
SCANEN
Text Label -1600 900  2    50   ~ 0
FPA1
Text Label -5850 1750 2    50   ~ 0
MISO
Text Label -5850 1950 2    50   ~ 0
SCK
Text Label -5850 2050 2    50   ~ 0
~µCRST
Text Label -15250 1700 0    50   ~ 0
~µCRST
Wire Wire Line
	-14750 1700 -15250 1700
Text Label -5850 1850 2    50   ~ 0
MOSI
Wire Wire Line
	-13250 1800 -12650 1800
Text Label -12650 1800 2    50   ~ 0
SCK
Wire Wire Line
	-13250 3500 -12650 3500
Text Label -12650 3500 2    50   ~ 0
~IOINT
Text Label -12650 2600 2    50   ~ 0
CLRWS
Text Label 9400 -1950 2    50   ~ 0
~WAB0
Text Label -9900 1500 0    50   ~ 0
~WR
Text Label 9400 -1750 2    50   ~ 0
~WAB2
Text Label 9400 -1650 2    50   ~ 0
~WDB0
Text Label 9400 -1550 2    50   ~ 0
~WDB1
Text Label 9400 -1450 2    50   ~ 0
~WIB0
Text Label 9400 -1350 2    50   ~ 0
~WIB1
Text Label 9400 -1250 2    50   ~ 0
~WOR0
Text Label 9400 -1150 2    50   ~ 0
~WOR1
Text Label -9900 800  0    50   ~ 0
FPA0
Text Label -9900 900  0    50   ~ 0
FPA1
Text Label -9900 1000 0    50   ~ 0
FPA2
Text Label -9900 1600 0    50   ~ 0
FPA7
Text Label -9900 1400 0    50   ~ 0
FPA6
Wire Wire Line
	11000 -1950 11400 -1950
Wire Wire Line
	11000 -1750 11400 -1750
Wire Wire Line
	11000 -1650 11400 -1650
Wire Wire Line
	11000 -1550 11400 -1550
Wire Wire Line
	11000 -1450 11400 -1450
Wire Wire Line
	11000 -1350 11400 -1350
Text Label 11400 -1950 2    50   ~ 0
~RAB0
Text Label -9900 4100 0    50   ~ 0
~RD
Text Label 11400 -1750 2    50   ~ 0
~RAB2
Text Label 11400 -1650 2    50   ~ 0
~RDB0
Text Label 11400 -1550 2    50   ~ 0
~RDB1
Text Label 11400 -1450 2    50   ~ 0
~RIB0
Text Label 11400 -1350 2    50   ~ 0
~RIB1
Text Label -9900 3400 0    50   ~ 0
FPA0
Text Label -9900 3500 0    50   ~ 0
FPA1
Text Label -9900 3600 0    50   ~ 0
FPA2
Text Label -9900 4000 0    50   ~ 0
FPA6
Text Label -9900 4200 0    50   ~ 0
FPA7
Text Label 11400 -1250 2    50   ~ 0
~RDSR0
Wire Wire Line
	11000 -1250 11400 -1250
Text Label -9900 2100 0    50   ~ 0
FPA0
Text Label -9900 2200 0    50   ~ 0
FPA1
Text Label -9900 2300 0    50   ~ 0
FPA2
Wire Wire Line
	-13250 3200 -12650 3200
Wire Wire Line
	-14750 3000 -15250 3000
Wire Wire Line
	-12650 3300 -13250 3300
Text Label -12650 3200 2    50   ~ 0
~R
Text Label -12650 3300 2    50   ~ 0
~W
Wire Wire Line
	-14750 2800 -15250 2800
Text Label -15250 2800 0    50   ~ 0
RXD
$Comp
L alexios:74LVC1G07 U104
U 1 1 61396628
P -11350 9000
F 0 "U104" H -11250 9100 50  0000 L CNN
F 1 "74LVC1G07" H -11850 8950 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -11250 9000 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -11250 9000 50  0001 C CNN
	1    -11350 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	-10550 9000 -10000 9000
Text Label -9650 9000 2    50   ~ 0
~RESET
Wire Wire Line
	-11550 9000 -11650 9000
$Comp
L alexios:74LVC1G07 U106
U 1 1 61719DB4
P -11350 9500
F 0 "U106" H -11250 9600 50  0000 L CNN
F 1 "74LVC1G07" H -11850 9450 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -11250 9500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -11250 9500 50  0001 C CNN
	1    -11350 9500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even JP101
U 1 1 617B139E
P -10200 9600
F 0 "JP101" H -10150 9825 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H -10150 9826 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H -10200 9600 50  0001 C CNN
F 3 "~" H -10200 9600 50  0001 C CNN
	1    -10200 9600
	1    0    0    -1  
$EndComp
Wire Wire Line
	-10450 9500 -10450 9600
Wire Wire Line
	-10450 9700 -10400 9700
Wire Wire Line
	-10450 9500 -10400 9500
Wire Wire Line
	-10400 9600 -10450 9600
Connection ~ -10450 9600
Wire Wire Line
	-10450 9600 -10450 9700
Wire Wire Line
	-9900 9700 -9650 9700
Wire Wire Line
	-9900 9500 -9650 9500
Wire Wire Line
	-9900 9600 -9650 9600
Text Label -9650 9700 2    50   ~ 0
~IRQ
Text Label -9650 9500 2    50   ~ 0
~IRQ7
Text Label -9650 9600 2    50   ~ 0
~IRQ6
Text Label -12100 8800 0    50   ~ 0
~FPRESET
Text Label -12100 9500 0    50   ~ 0
~FPIRQ
Text Label -15250 3000 0    50   ~ 0
~FPIRQ
Wire Wire Line
	-13250 3000 -12650 3000
Wire Wire Line
	-13250 1700 -12650 1700
Wire Wire Line
	-12650 3100 -13250 3100
Text Label -12650 3000 2    50   ~ 0
~MEM
Text Label -12650 3100 2    50   ~ 0
~IO
Text Label -12650 1700 2    50   ~ 0
~CLR
Wire Wire Line
	-14750 3500 -15250 3500
Wire Wire Line
	-14750 3400 -15250 3400
Text Label -15250 3400 0    50   ~ 0
~FPRESET
Text Label -15250 3500 0    50   ~ 0
~FPRSTHOLD
Wire Wire Line
	-11650 9000 -11650 8800
Wire Wire Line
	-11650 8800 -11400 8800
Wire Wire Line
	-11650 8800 -12100 8800
Text Label -9650 8800 2    50   ~ 0
~FPRESET
Wire Wire Line
	-13250 2400 -12650 2400
Text Label -12650 2400 2    50   ~ 0
BUSCP
Wire Wire Line
	-14750 1900 -15100 1900
Wire Wire Line
	-14750 2000 -15100 2000
Wire Wire Line
	-14750 2100 -15100 2100
Wire Wire Line
	-14750 2200 -15100 2200
Wire Wire Line
	-14750 2300 -15100 2300
Wire Wire Line
	-14750 2400 -15100 2400
Wire Wire Line
	-14750 2500 -15100 2500
Wire Wire Line
	-14750 2600 -15100 2600
Text Label -15100 1900 0    50   ~ 0
SWA0
Text Label -15100 2000 0    50   ~ 0
SWA1
Text Label -15100 2100 0    50   ~ 0
SWA2
Text Label -15100 2200 0    50   ~ 0
SWA3
Text Label -15100 2300 0    50   ~ 0
SWD0
Text Label -15100 2400 0    50   ~ 0
SWD1
Text Label -15100 2500 0    50   ~ 0
SWD2
Text Label -15100 2600 0    50   ~ 0
SWD3
Wire Wire Line
	-13250 4100 -12650 4100
Wire Wire Line
	-13250 4200 -12650 4200
Text Label -12650 4100 2    50   ~ 0
STEP∕~RUN
Text Label -12650 4200 2    50   ~ 0
~µSTEP
Wire Wire Line
	-13250 3600 -12650 3600
Text Label -12650 3600 2    50   ~ 0
~WAIT
$Sheet
S -14650 7550 1150 1500
U 5ED99F01
F0 "Run Control State Machine" 50
F1 "cft_dfp_rc_fsm.sch" 50
F2 "~WAIT" O R -13500 8600 50 
F3 "FPCLKEN" T R -13500 8750 50 
F4 "FPµSTEP" T R -13500 8900 50 
F5 "FPCLKEN-IN" I L -14650 8750 50 
F6 "FPµSTEP-IN" I L -14650 8900 50 
F7 "STEP∕~RUN" I L -14650 8450 50 
F8 "FPFETCH∕~EXEC" I L -14650 8150 50 
F9 "~CLR" I L -14650 8300 50 
F10 "~µSTEP" I L -14650 8600 50 
F11 "CLK4" I L -14650 8000 50 
F12 "~RESET" I L -14650 7700 50 
F13 "~RSTHOLD" I L -14650 7850 50 
$EndSheet
Wire Wire Line
	-13250 2900 -12650 2900
Text Label -12650 2900 2    50   ~ 0
~DBOE
Wire Wire Line
	-13250 2800 -12650 2800
Text Label -12650 2800 2    50   ~ 0
~ABOE
Wire Wire Line
	-13250 2700 -12650 2700
Text Label -12650 2700 2    50   ~ 0
~IBOE
Text Label -12650 3900 2    50   ~ 0
~PANELEN
Connection ~ -13250 4750
$Comp
L power:GND #PWR0111
U 1 1 5D893C9D
P -13250 4750
F 0 "#PWR0111" H -13250 4500 50  0001 C CNN
F 1 "GND" H -13245 4577 50  0000 C CNN
F 2 "" H -13250 4750 50  0001 C CNN
F 3 "" H -13250 4750 50  0001 C CNN
	1    -13250 4750
	1    0    0    -1  
$EndComp
Connection ~ -13250 4550
$Comp
L power:+5V #PWR0110
U 1 1 5D892BE5
P -13250 4550
F 0 "#PWR0110" H -13250 4400 50  0001 C CNN
F 1 "+5V" H -13235 4723 50  0000 C CNN
F 2 "" H -13250 4550 50  0001 C CNN
F 3 "" H -13250 4550 50  0001 C CNN
	1    -13250 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C107
U 1 1 5D891464
P -13250 4650
F 0 "C107" H -13341 4696 50  0000 R CNN
F 1 "100nF" H -13341 4605 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -13250 4650 50  0001 C CNN
F 3 "~" H -13250 4650 50  0001 C CNN
	1    -13250 4650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U102
U 2 1 5D890468
P -12900 4650
F 0 "U102" H -13050 4900 50  0000 L CNN
F 1 "74LVC1G04" H -13050 4400 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -12900 4650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H -12900 4650 50  0001 C CNN
	2    -12900 4650
	1    0    0    -1  
$EndComp
Text Label -9800 4650 0    50   ~ 0
FPA[0..7]
Text Label -7550 4650 2    50   ~ 0
~FPOE[0..31]
Text Label -9800 4800 0    50   ~ 0
~PANELEN
Wire Wire Line
	-13500 8600 -13000 8600
Text Label -13000 8600 2    50   ~ 0
~WAIT
Wire Wire Line
	-13500 8750 -13000 8750
Text Label -13000 8750 2    50   ~ 0
FPCLKEN
Wire Wire Line
	-13500 8900 -13000 8900
Text Label -13000 8900 2    50   ~ 0
FPµSTEP
Wire Wire Line
	-14650 8600 -15250 8600
Text Label -15250 8600 0    50   ~ 0
~µSTEP
Wire Wire Line
	-14650 8750 -15250 8750
Text Label -15250 8750 0    50   ~ 0
FPCLKEN-IN
Wire Wire Line
	-14650 8900 -15250 8900
Text Label -15250 8900 0    50   ~ 0
FPµSTEP-IN
Wire Wire Line
	-14650 8450 -15250 8450
Text Label -15250 8450 0    50   ~ 0
STEP∕~RUN
Wire Wire Line
	-14650 8300 -15250 8300
Text Label -15250 8300 0    50   ~ 0
~CLR
Wire Wire Line
	-14650 8150 -15250 8150
Text Label -15250 8150 0    50   ~ 0
FPFETCH∕~EXEC
Wire Wire Line
	-14650 8000 -15250 8000
Text Label -15250 8000 0    50   ~ 0
CLK4
Wire Wire Line
	-14650 7850 -15250 7850
Text Label -15250 7850 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	-14650 7700 -15250 7700
Text Label -15250 7700 0    50   ~ 0
~RESET
$Sheet
S -14650 9650 1150 900 
U 614F5B8D
F0 "Address Decoder & Wait States" 50
F1 "cft_dfp_ws.sch" 50
F2 "~WS" T R -13500 9800 50 
F3 "~IOINT" O R -13500 9950 50 
F4 "~DBOE" O R -13500 10100 50 
F5 "~R" T L -14650 9800 50 
F6 "~DBOE" I L -14650 10400 50 
F7 "CLRWS" I L -14650 10250 50 
F8 "~IODEV1xx" I L -14650 9950 50 
F9 "AB[5..7]" I L -14650 10100 50 
$EndSheet
Wire Wire Line
	-14650 9800 -15250 9800
Text Label -15250 9800 0    50   ~ 0
~R
Wire Wire Line
	-14650 9950 -15250 9950
Text Label -15250 9950 0    50   ~ 0
~IODEV1xx
Wire Bus Line
	-14650 10100 -15250 10100
Text Label -15250 10100 0    50   ~ 0
AB[0..23]
Wire Wire Line
	-14650 10250 -15250 10250
Text Label -15250 10250 0    50   ~ 0
CLRWS
Wire Wire Line
	-14650 10400 -15250 10400
Text Label -15250 10400 0    50   ~ 0
~DBOE
Wire Wire Line
	-13500 9800 -13000 9800
Text Label -13000 9800 2    50   ~ 0
~WS
Wire Wire Line
	-13500 9950 -13000 9950
Text Label -13000 9950 2    50   ~ 0
~IOINT
Wire Wire Line
	-13500 10100 -13000 10100
Text Label -13000 10100 2    50   ~ 0
~DBOE
Connection ~ -11650 8800
$Sheet
S -6600 5050 1150 650 
U 5D78E680
F0 "Address Bus Pod" 50
F1 "cft_dfp_abpod.sch" 50
F2 "FPD[0..7]" T L -6600 5200 50 
F3 "~OE" I L -6600 5350 50 
F4 "CPL" I L -6600 5450 50 
F5 "CPH" I L -6600 5650 50 
F6 "BUSCP" I R -5450 5350 50 
F7 "~RL" I R -5450 5450 50 
F8 "~RH" I R -5450 5650 50 
F9 "AB[0..23]" B R -5450 5200 50 
F10 "CPM" I L -6600 5550 50 
F11 "~RM" I R -5450 5550 50 
$EndSheet
Wire Bus Line
	-6600 5200 -7200 5200
Text Label -7200 5200 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-6600 5350 -7200 5350
Wire Bus Line
	-4950 5200 -5450 5200
Wire Wire Line
	-4950 5350 -5450 5350
Wire Wire Line
	-4950 5450 -5450 5450
Wire Wire Line
	-4950 5550 -5450 5550
Text Label -4950 5200 2    50   ~ 0
AB[0..23]
Text Label -4950 5350 2    50   ~ 0
BUSCP
Text Label -4950 5450 2    50   ~ 0
~RAB0
Text Label -4950 5550 2    50   ~ 0
~RAB1
Text Label -7200 5350 0    50   ~ 0
~ABOE
Text Label -7200 5450 0    50   ~ 0
~WAB0
Text Label -7200 5550 0    50   ~ 0
~WAB1
$Sheet
S -6600 5900 1150 650 
U 5D363063
F0 "Data Bus Pod" 50
F1 "cft_dfp_dbpod.sch" 50
F2 "DB[0..15]" B R -5450 6050 50 
F3 "FPD[0..7]" T L -6600 6050 50 
F4 "~OE" I L -6600 6200 50 
F5 "CPL" I L -6600 6350 50 
F6 "CPH" I L -6600 6450 50 
F7 "BUSCP" I R -5450 6200 50 
F8 "~RL" I R -5450 6350 50 
F9 "~RH" I R -5450 6450 50 
$EndSheet
Wire Bus Line
	-6600 6050 -7200 6050
Text Label -7200 6050 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-6600 6200 -7200 6200
Wire Bus Line
	-4950 6050 -5450 6050
Wire Wire Line
	-4950 6200 -5450 6200
Wire Wire Line
	-4950 6350 -5450 6350
Wire Wire Line
	-4950 6450 -5450 6450
Text Label -4950 6050 2    50   ~ 0
DB[0..15]
Text Label -4950 6200 2    50   ~ 0
BUSCP
Text Label -4950 6350 2    50   ~ 0
~RDB0
Text Label -4950 6450 2    50   ~ 0
~RDB1
Text Label -7200 6200 0    50   ~ 0
~DBOE
Text Label -7200 6350 0    50   ~ 0
~WDB0
Text Label -7200 6450 0    50   ~ 0
~WDB1
$Sheet
S -6600 6750 1150 650 
U 5D42FF4D
F0 "IBus Pod" 50
F1 "cft_dfp_ibuspod.sch" 50
F2 "IBUS[0..15]" B R -5450 6900 50 
F3 "FPD[0..7]" T L -6600 6900 50 
F4 "~OE" I L -6600 7050 50 
F5 "CPL" I L -6600 7200 50 
F6 "CPH" I L -6600 7300 50 
F7 "BUSCP" I R -5450 7050 50 
F8 "~RL" I R -5450 7200 50 
F9 "~RH" I R -5450 7300 50 
$EndSheet
Wire Bus Line
	-6600 6900 -7200 6900
Text Label -7200 6900 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-6600 7050 -7200 7050
Wire Bus Line
	-4950 6900 -5450 6900
Wire Wire Line
	-4950 7050 -5450 7050
Wire Wire Line
	-4950 7200 -5450 7200
Wire Wire Line
	-4950 7300 -5450 7300
Text Label -4950 6900 2    50   ~ 0
IBUS[0..15]
Text Label -4950 7050 2    50   ~ 0
BUSCP
Text Label -4950 7200 2    50   ~ 0
~RIB0
Text Label -4950 7300 2    50   ~ 0
~RIB1
Text Label -7200 7050 0    50   ~ 0
~IBOE
Text Label -7200 7200 0    50   ~ 0
~WIB0
Text Label -7200 7300 0    50   ~ 0
~WIB1
$Comp
L power:+5V #PWR0131
U 1 1 5D61E85C
P -2150 700
F 0 "#PWR0131" H -2150 550 50  0001 C CNN
F 1 "+5V" V -2135 828 50  0000 L CNN
F 2 "" H -2150 700 50  0001 C CNN
F 3 "" H -2150 700 50  0001 C CNN
	1    -2150 700 
	0    1    1    0   
$EndComp
Text Label -1600 3200 2    50   ~ 0
POWER
Text Label -1600 3100 2    50   ~ 0
~LTSON
Text Label -1600 3000 2    50   ~ 0
SWD3
Text Label -1600 2900 2    50   ~ 0
SWD2
Text Label -1600 2800 2    50   ~ 0
SWD1
Text Label -1600 2700 2    50   ~ 0
SWD0
Text Label -1600 2600 2    50   ~ 0
SWA3
Text Label -1600 2500 2    50   ~ 0
SWA2
Text Label -1600 2400 2    50   ~ 0
SWA1
Text Label -1600 2300 2    50   ~ 0
SWA0
Text Label -1600 2200 2    50   ~ 0
~ROW5
Text Label -1600 2100 2    50   ~ 0
~ROW4
Text Label -1600 2000 2    50   ~ 0
~ROW3
Text Label -1600 1900 2    50   ~ 0
~ROW2
Text Label -1600 1800 2    50   ~ 0
~ROW1
Wire Wire Line
	-2150 900  -1600 900 
Wire Wire Line
	-2150 800  -1600 800 
Wire Wire Line
	-6150 2050 -5850 2050
Wire Wire Line
	-6150 1850 -5850 1850
Wire Wire Line
	-6150 1950 -5850 1950
Wire Wire Line
	-6150 1750 -5850 1750
Wire Wire Line
	-2150 3900 -2000 3900
Wire Wire Line
	-2150 3800 -2000 3800
Wire Wire Line
	-2150 3700 -2000 3700
Wire Wire Line
	-2150 3600 -2000 3600
Wire Wire Line
	-2150 3100 -1600 3100
Wire Wire Line
	-2150 3000 -1600 3000
Wire Wire Line
	-2150 2900 -1600 2900
Wire Wire Line
	-2150 2800 -1600 2800
Wire Wire Line
	-2150 2700 -1600 2700
Wire Wire Line
	-2150 2600 -1600 2600
Wire Wire Line
	-2150 2500 -1600 2500
Wire Wire Line
	-2150 2400 -1600 2400
Wire Wire Line
	-2150 2300 -1600 2300
Wire Wire Line
	-2150 2200 -1600 2200
Wire Wire Line
	-2150 2100 -1600 2100
Wire Wire Line
	-2150 2000 -1600 2000
Wire Wire Line
	-2150 1900 -1600 1900
Wire Wire Line
	-2150 1800 -1600 1800
Text Label -1600 800  2    50   ~ 0
FPA0
NoConn ~ -2000 3600
NoConn ~ -2000 3800
$Comp
L power:+5V #PWR0130
U 1 1 5E5EDC51
P -2150 600
F 0 "#PWR0130" H -2150 450 50  0001 C CNN
F 1 "+5V" V -2135 728 50  0000 L CNN
F 2 "" H -2150 600 50  0001 C CNN
F 3 "" H -2150 600 50  0001 C CNN
	1    -2150 600 
	0    1    1    0   
$EndComp
$Sheet
S -6600 7600 1150 650 
U 5E4A8360
F0 "DFP Devices" 50
F1 "cft_dfp_localdevs.sch" 50
F2 "CPH" I L -6600 8100 50 
F3 "~RDSR" I R -5450 8100 50 
F4 "CPL" I L -6600 8000 50 
F5 "FPD[0..7]" T L -6600 7700 50 
F6 "~OEL" I R -5450 7700 50 
F7 "~OEH" I R -5450 7800 50 
$EndSheet
Wire Wire Line
	-5450 8100 -4950 8100
Text Label -4950 8100 2    50   ~ 0
~RDSR
Wire Bus Line
	-6600 7700 -7200 7700
Text Label -7200 7700 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-5450 7700 -4950 7700
Text Label -4950 7700 2    50   ~ 0
~ORLOE
Text Label -7200 8000 0    50   ~ 0
~WORL
Text Label -7200 8100 0    50   ~ 0
~WORH
$Sheet
S -6600 8450 1150 650 
U 5E6A6F4A
F0 "µCV Output" 50
F1 "cft_dsp_ucvpod.sch" 50
F2 "WADDR[0..4]" T R -5450 8700 50 
F3 "RADDR[0..4]" I R -5450 8600 50 
F4 "FPD[0..7]" T L -6600 8600 50 
F5 "~CVOE" I R -5450 8950 50 
F6 "µCVCPH" I L -6600 8950 50 
F7 "µCVCPM" I L -6600 8850 50 
F8 "µCVCPL" I L -6600 8750 50 
F9 "ACTION[0..3]" T R -5450 8800 50 
$EndSheet
Wire Bus Line
	-5450 8600 -4950 8600
Wire Bus Line
	-5450 8700 -4950 8700
Wire Bus Line
	-6600 8600 -7200 8600
Text Label -7200 8600 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-6600 8750 -7200 8750
Wire Wire Line
	-6600 8850 -7200 8850
Wire Wire Line
	-6600 8950 -7200 8950
Wire Wire Line
	-5450 8950 -4950 8950
Text Label -4950 8950 2    50   ~ 0
~CVOE
Text Label -7200 8750 0    50   ~ 0
~WCV0
Text Label -7200 8850 0    50   ~ 0
~WCV1
Text Label -7200 8950 0    50   ~ 0
~WCV2
Text Label -4950 8600 2    50   ~ 0
RADDR[0..4]
Text Label -4950 8700 2    50   ~ 0
WADDR[0..4]
Wire Wire Line
	-4950 5650 -5450 5650
Text Label -4950 5650 2    50   ~ 0
~RAB2
Text Label -7200 5650 0    50   ~ 0
~WAB2
$Comp
L Device:C_Small C104
U 1 1 5EBDFC03
P -15100 5250
F 0 "C104" H -15050 5500 50  0000 R CNN
F 1 "100nF" H -14950 5000 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -15100 5250 50  0001 C CNN
F 3 "~" H -15100 5250 50  0001 C CNN
	1    -15100 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EBDFC09
P -15300 5450
F 0 "#PWR0102" H -15300 5200 50  0001 C CNN
F 1 "GND" H -15295 5277 50  0000 C CNN
F 2 "" H -15300 5450 50  0001 C CNN
F 3 "" H -15300 5450 50  0001 C CNN
	1    -15300 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	-15000 5100 -15100 5100
Wire Wire Line
	-15300 5100 -15300 5050
Wire Wire Line
	-15100 5150 -15100 5100
Connection ~ -15100 5100
Wire Wire Line
	-15100 5350 -15100 5400
Wire Wire Line
	-15100 5400 -15000 5400
Wire Wire Line
	-15300 5400 -15300 5450
Connection ~ -15100 5400
$Comp
L Device:C_Small C101
U 1 1 5EBDFC17
P -15300 5250
F 0 "C101" H -15400 5500 50  0000 R CNN
F 1 "1µF" H -15400 5250 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -15300 5250 50  0001 C CNN
F 3 "~" H -15300 5250 50  0001 C CNN
	1    -15300 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-15300 5100 -15300 5150
Wire Wire Line
	-15300 5400 -15300 5350
Connection ~ -15300 5100
Wire Wire Line
	-15300 5100 -15100 5100
Connection ~ -15300 5400
Wire Wire Line
	-15300 5400 -15100 5400
$Comp
L power:+5V #PWR0107
U 1 1 5EBDFC29
P -14150 5050
F 0 "#PWR0107" H -14150 4900 50  0001 C CNN
F 1 "+5V" H -14135 5223 50  0000 C CNN
F 2 "" H -14150 5050 50  0001 C CNN
F 3 "" H -14150 5050 50  0001 C CNN
	1    -14150 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-14150 5100 -14150 5050
NoConn ~ -14150 4450
Wire Wire Line
	-14200 5250 -14000 5250
Wire Wire Line
	-14200 5100 -14150 5100
Text Label -12650 2300 2    50   ~ 0
FPµSTEP-IN
Text Label -12650 2200 2    50   ~ 0
FPCLKEN-IN
Wire Wire Line
	-13250 2300 -12650 2300
Wire Wire Line
	-13250 2200 -12650 2200
Wire Wire Line
	-13250 2100 -12650 2100
Wire Wire Line
	-14750 3100 -15250 3100
Wire Wire Line
	-14750 3200 -15250 3200
Text Label -15250 3100 0    50   ~ 0
MFD0
Text Label -15250 3200 0    50   ~ 0
MFD1
Text Label -13200 800  0    50   ~ 0
FPD0
Text Label -13200 900  0    50   ~ 0
FPD1
Text Label -13200 1000 0    50   ~ 0
FPD2
Text Label -13200 1100 0    50   ~ 0
FPD3
Text Label -13200 1200 0    50   ~ 0
FPD4
Text Label -13200 1300 0    50   ~ 0
FPD5
Text Label -13200 1400 0    50   ~ 0
FPD6
Text Label -13200 1500 0    50   ~ 0
FPD7
Wire Bus Line
	-4500 3500 -3950 3500
Wire Bus Line
	-4500 3400 -3950 3400
Wire Bus Line
	-4500 3300 -3950 3300
Text Label -3950 3500 2    50   ~ 0
RADDR[0..4]
Text Label -3950 3400 2    50   ~ 0
WADDR[0..4]
Text Label -3950 3300 2    50   ~ 0
ACTION[0..3]
Text Label -3950 2600 2    50   ~ 0
~IO
Text Label -3950 2500 2    50   ~ 0
~MEM
Text Label -3950 1500 2    50   ~ 0
T34
Text Label -3950 1400 2    50   ~ 0
WSTB
Text Label -3950 1100 2    50   ~ 0
CLK4
Text Label -3950 1000 2    50   ~ 0
CLK3
Text Label -3950 900  2    50   ~ 0
CLK2
Text Label -3950 800  2    50   ~ 0
CLK1
Text Label -3950 600  2    50   ~ 0
IBUS[0..15]
Wire Bus Line
	-3950 600  -4500 600 
Wire Wire Line
	-4500 1500 -3950 1500
Wire Wire Line
	-4500 1400 -3950 1400
Wire Wire Line
	-4500 2800 -3950 2800
Wire Wire Line
	-4500 2700 -3950 2700
Wire Wire Line
	-4500 2600 -3950 2600
Wire Wire Line
	-4500 2500 -3950 2500
Wire Wire Line
	-4500 1100 -3950 1100
Wire Wire Line
	-4500 1000 -3950 1000
Wire Wire Line
	-4500 900  -3950 900 
Wire Wire Line
	-4500 800  -3950 800 
Text Label -3950 1600 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	-3950 1600 -4500 1600
Text Label -3950 1300 2    50   ~ 0
DB[0..15]
Text Label -3950 1200 2    50   ~ 0
AB[0..23]
Wire Bus Line
	-4500 1300 -3950 1300
Wire Bus Line
	-4500 1200 -3950 1200
Wire Wire Line
	-14250 200  -14250 550 
Wire Wire Line
	-14050 200  -14050 550 
Entry Wire Line
	-10100 800  -10000 900 
Entry Wire Line
	-10100 900  -10000 1000
Entry Wire Line
	-10100 1000 -10000 1100
Entry Wire Line
	-10100 1100 -10000 1200
Entry Wire Line
	-10100 1200 -10000 1300
Entry Wire Line
	-10100 1300 -10000 1400
Entry Wire Line
	-10100 1400 -10000 1500
Entry Wire Line
	-10100 1500 -10000 1600
Text Notes -13750 300  0    100  ~ 20
DFP Microcontroller
Wire Wire Line
	-14450 4750 -14000 4750
Wire Wire Line
	-14000 4750 -14000 5250
Wire Wire Line
	-14450 4450 -14450 4750
Text Label -14350 4750 0    50   ~ 0
µCCLK
Wire Wire Line
	-2150 5300 -1600 5300
Text Label -1600 5300 2    50   ~ 0
FPCLKEN
Wire Wire Line
	-2150 5500 -1600 5500
Text Label -1600 5500 2    50   ~ 0
FPµSTEP
$Comp
L power:GND #PWR0132
U 1 1 5FA867CD
P -2150 5400
F 0 "#PWR0132" H -2150 5150 50  0001 C CNN
F 1 "GND" V -2100 5300 50  0000 R CNN
F 2 "" H -2150 5400 50  0001 C CNN
F 3 "" H -2150 5400 50  0001 C CNN
	1    -2150 5400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 5FA86CA4
P -2150 5600
F 0 "#PWR0133" H -2150 5350 50  0001 C CNN
F 1 "GND" V -2100 5500 50  0000 R CNN
F 2 "" H -2150 5600 50  0001 C CNN
F 3 "" H -2150 5600 50  0001 C CNN
	1    -2150 5600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-2150 5800 -1600 5800
Text Label -1600 5800 2    50   ~ 0
~FPRAM~∕ROM
Text Label -12650 2100 2    50   ~ 0
~FPRAM~∕ROM
Text Label -10000 2100 1    50   ~ 0
FPA[0..7]
Entry Wire Line
	-15100 1900 -15200 2000
Entry Wire Line
	-15100 2000 -15200 2100
Entry Wire Line
	-15100 2100 -15200 2200
Entry Wire Line
	-15100 2200 -15200 2300
Entry Wire Line
	-15100 2300 -15200 2400
Entry Wire Line
	-15100 2400 -15200 2500
Entry Wire Line
	-15100 2500 -15200 2600
Entry Wire Line
	-15100 2600 -15200 2700
Text Label -15200 2300 1    50   ~ 0
SWA[0..3]
Text Label -15200 2700 1    50   ~ 0
SWD[0..3]
Wire Wire Line
	-2150 5700 -1600 5700
Text Label -1600 5700 2    50   ~ 0
~FPRESET
Text Notes -1400 5200 0    50   ~ 0
To reset and clock generator
Text Notes -1400 5800 0    50   ~ 0
To Memory Bank Registers
Wire Wire Line
	-13250 3700 -12650 3700
Text Label -12650 3700 2    50   ~ 0
~LTSON
Text Notes -9200 7250 0    100  ~ 20
State Lights (~FPOE16~)
Text Label -9050 8550 0    50   ~ 0
~FPOE16
Wire Wire Line
	-7650 7650 -7400 7650
Wire Wire Line
	-7650 7750 -7400 7750
Wire Wire Line
	-7650 7850 -7400 7850
Wire Wire Line
	-7650 7950 -7400 7950
Wire Wire Line
	-7650 8050 -7400 8050
Wire Wire Line
	-7650 8150 -7400 8150
Wire Wire Line
	-7650 8250 -7400 8250
Wire Wire Line
	-7650 8350 -7400 8350
Text Label -7400 7650 2    50   ~ 0
FPD0
Text Label -7400 7750 2    50   ~ 0
FPD1
Text Label -7400 7850 2    50   ~ 0
FPD2
Text Label -7400 7950 2    50   ~ 0
FPD3
Text Label -7400 8050 2    50   ~ 0
FPD4
Text Label -7400 8150 2    50   ~ 0
FPD5
Text Label -7400 8250 2    50   ~ 0
FPD6
Text Label -7400 8350 2    50   ~ 0
FPD7
Wire Wire Line
	-8650 7650 -9050 7650
Wire Wire Line
	-8650 7750 -9050 7750
Wire Wire Line
	-8650 7850 -9050 7850
Wire Wire Line
	-8650 7950 -9050 7950
Wire Wire Line
	-8650 8050 -9050 8050
Wire Wire Line
	-8650 8150 -9050 8150
Wire Wire Line
	-8650 8250 -9050 8250
Text Label -9050 7950 0    50   ~ 0
~WS
Text Label -9050 8050 0    50   ~ 0
~LED-FETCH
Text Label -9050 8150 0    50   ~ 0
~LED-EXEC
$Comp
L power:GND #PWR0122
U 1 1 5DA0BAD7
P -8700 8700
F 0 "#PWR0122" H -8700 8450 50  0001 C CNN
F 1 "GND" H -8695 8527 50  0000 C CNN
F 2 "" H -8700 8700 50  0001 C CNN
F 3 "" H -8700 8700 50  0001 C CNN
	1    -8700 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8700 8700 -8700 8650
Wire Wire Line
	-8700 8350 -8650 8350
Wire Wire Line
	-8650 8650 -8700 8650
Connection ~ -8700 8650
Wire Wire Line
	-8700 8650 -8700 8350
Wire Wire Line
	-2150 5900 -1600 5900
Text Label -1600 5900 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes -1400 5900 0    50   ~ 0
From Microcode Sequencer
Text Label -12100 10100 0    50   ~ 0
FPFETCH∕~EXEC
Text Label -9650 10100 2    50   ~ 0
~LED-EXEC
$Comp
L alexios:74LVC1G04 U109
U 1 1 5DED9999
P -11100 10350
F 0 "U109" H -11150 10175 50  0000 C CNN
F 1 "74LVC1G04" H -11150 10084 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -11100 10350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H -11100 10350 50  0001 C CNN
	1    -11100 10350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-11500 10100 -11500 10350
Wire Wire Line
	-11500 10350 -11400 10350
Connection ~ -11500 10100
Wire Wire Line
	-11500 10100 -9650 10100
Wire Wire Line
	-10900 10350 -9650 10350
Text Label -9650 10350 2    50   ~ 0
~LED-FETCH
Wire Wire Line
	-12100 10100 -11500 10100
Text Label -9050 7750 0    50   ~ 0
STEP∕~RUN
$Comp
L alexios:74HC540 U110
U 1 1 5E153E1D
P -8150 8150
F 0 "U110" H -8150 8917 50  0000 C CNN
F 1 "74HC540" H -8150 8826 50  0000 C CNN
F 2 "alexios:SOIC-20W" H -8150 8150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC540" H -8150 8150 50  0001 C CNN
	1    -8150 8150
	1    0    0    -1  
$EndComp
Text Label -9050 8250 0    50   ~ 0
~IRQS
Text Label -9050 7650 0    50   ~ 0
~RSTHOLD
Text Label -9050 7850 0    50   ~ 0
~LED-STOP
Wire Wire Line
	-13250 4000 -12650 4000
Text Label -12650 4000 2    50   ~ 0
~LED-STOP
Text Notes -12600 4100 0    50   ~ 0
(= ~LED-RUN)
Wire Wire Line
	-12650 2600 -13250 2600
Entry Wire Line
	-7300 7550 -7400 7650
Entry Wire Line
	-7300 7650 -7400 7750
Entry Wire Line
	-7300 7750 -7400 7850
Entry Wire Line
	-7300 7850 -7400 7950
Entry Wire Line
	-7300 7950 -7400 8050
Entry Wire Line
	-7300 8050 -7400 8150
Entry Wire Line
	-7300 8150 -7400 8250
Entry Wire Line
	-7300 8250 -7400 8350
$Comp
L alexios:74HC139 U103
U 3 1 5D539CF9
P -10000 7150
F 0 "U103" H -9821 7196 50  0000 L CNN
F 1 "74HC139" H -9821 7105 50  0000 L CNN
F 2 "alexios:SOIC-16" H -10000 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -10000 7150 50  0001 C CNN
	3    -10000 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-5450 7800 -4950 7800
Text Label -4950 7800 2    50   ~ 0
~ORHOE
Wire Wire Line
	-15600 1000 -14950 1000
Text Label 9400 -1850 2    50   ~ 0
~WAB1
Text Label -9900 2800 0    50   ~ 0
~WR
Text Label -9900 2700 0    50   ~ 0
FPA7
Text Label -9900 2900 0    50   ~ 0
FPA6
Text Notes 8550 -950 1    50   ~ 0
FPA=x0xxAAAA
Wire Bus Line
	-8200 4800 -7550 4800
Text Label -8000 4800 0    50   ~ 0
~ROW[1..5]
$Comp
L alexios:74HC590 U108
U 1 1 5E6F6CB0
P -10950 2900
AR Path="/5E6F6CB0" Ref="U108"  Part="1" 
AR Path="/6233F88C/5E6F6CB0" Ref="U?"  Part="1" 
F 0 "U108" H -10950 3667 50  0000 C CNN
F 1 "74HC590" H -10950 3576 50  0000 C CNN
F 2 "alexios:SOIC-16" H -10650 3250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H -10650 3250 50  0001 C CNN
	1    -10950 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-10450 2400 -10100 2400
Wire Wire Line
	-10450 2500 -10100 2500
Wire Wire Line
	-10450 2600 -10100 2600
Text Label -10400 2500 0    50   ~ 0
FPA1
Text Label -10400 2600 0    50   ~ 0
FPA2
Text Label -10400 2700 0    50   ~ 0
FPA3
Text Label -10400 2800 0    50   ~ 0
FPA4
Text Label -11900 3300 0    50   ~ 0
~SCANEN
$Comp
L power:GND #PWR0112
U 1 1 5E6F6CC3
P -11450 2400
AR Path="/5E6F6CC3" Ref="#PWR0112"  Part="1" 
AR Path="/6233F88C/5E6F6CC3" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H -11450 2150 50  0001 C CNN
F 1 "GND" V -11445 2272 50  0000 R CNN
F 2 "" H -11450 2400 50  0001 C CNN
F 3 "" H -11450 2400 50  0001 C CNN
	1    -11450 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	-11450 2600 -11500 2600
Text Label -11900 2600 0    50   ~ 0
SCANCLK
Wire Wire Line
	-11500 2600 -11500 2700
Wire Wire Line
	-11500 2700 -11450 2700
Connection ~ -11500 2600
Text Label -11900 2900 0    50   ~ 0
~SCANCLR
Wire Wire Line
	-11900 2900 -11450 2900
NoConn ~ -10450 3300
Wire Wire Line
	-10450 2800 -10100 2800
Wire Wire Line
	-10450 2700 -10100 2700
Text Label -10400 2400 0    50   ~ 0
FPA0
$Comp
L power:+5V #PWR0103
U 1 1 5E7927AD
P -15300 5950
F 0 "#PWR0103" H -15300 5800 50  0001 C CNN
F 1 "+5V" H -15285 6123 50  0000 C CNN
F 2 "" H -15300 5950 50  0001 C CNN
F 3 "" H -15300 5950 50  0001 C CNN
	1    -15300 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C105
U 1 1 5E7927B3
P -15100 6150
F 0 "C105" H -15050 6400 50  0000 R CNN
F 1 "100nF" H -14950 5900 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -15100 6150 50  0001 C CNN
F 3 "~" H -15100 6150 50  0001 C CNN
	1    -15100 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E7927BA
P -15300 6350
F 0 "#PWR0104" H -15300 6100 50  0001 C CNN
F 1 "GND" H -15295 6177 50  0000 C CNN
F 2 "" H -15300 6350 50  0001 C CNN
F 3 "" H -15300 6350 50  0001 C CNN
	1    -15300 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-15000 6000 -15100 6000
Wire Wire Line
	-15300 6000 -15300 5950
Wire Wire Line
	-15100 6050 -15100 6000
Connection ~ -15100 6000
$Comp
L Device:C_Small C102
U 1 1 5E7927C4
P -15300 6150
F 0 "C102" H -15400 6400 50  0000 R CNN
F 1 "1µF" H -15400 6150 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -15300 6150 50  0001 C CNN
F 3 "~" H -15300 6150 50  0001 C CNN
	1    -15300 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-15300 6000 -15300 6050
Connection ~ -15300 6000
Wire Wire Line
	-15300 6000 -15100 6000
$Comp
L alexios:CXO_DIP8 X102
U 1 1 5E7927CE
P -14700 6100
F 0 "X102" H -14600 6467 50  0000 C CNN
F 1 "33 MHz?" H -14600 6376 50  0000 C CNN
F 2 "alexios:Oscillator_DIP-8-socket" H -14550 5700 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H -14600 6050 50  0001 C CNN
	1    -14700 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5E7927D5
P -14150 5950
F 0 "#PWR0108" H -14150 5800 50  0001 C CNN
F 1 "+5V" H -14135 6123 50  0000 C CNN
F 2 "" H -14150 5950 50  0001 C CNN
F 3 "" H -14150 5950 50  0001 C CNN
	1    -14150 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	-14200 6000 -14150 6000
Wire Wire Line
	-14150 6000 -14150 5950
Wire Wire Line
	-15300 6250 -15300 6300
Wire Wire Line
	-15300 6300 -15100 6300
Connection ~ -15300 6300
Wire Wire Line
	-15300 6300 -15300 6350
Wire Wire Line
	-15100 6250 -15100 6300
Connection ~ -15100 6300
Wire Wire Line
	-15100 6300 -15000 6300
Text Label -13800 6150 2    50   ~ 0
SCANCLK
Wire Wire Line
	-11900 2600 -11500 2600
Wire Wire Line
	-14200 6150 -13800 6150
Wire Wire Line
	-13250 3800 -12000 3800
Wire Wire Line
	-12000 2400 -12000 3300
Wire Wire Line
	-12000 3300 -11450 3300
Wire Wire Line
	-12000 1900 -12000 1800
Wire Wire Line
	-12000 1800 -11450 1800
Entry Wire Line
	-10100 2400 -10000 2500
Entry Wire Line
	-10100 2500 -10000 2600
Entry Wire Line
	-10100 2600 -10000 2700
Entry Wire Line
	-10100 2700 -10000 2800
Entry Wire Line
	-10100 2800 -10000 2900
Text Label -12500 450  0    50   ~ 0
FPD[0..7]
Entry Bus Bus
	-12100 450  -12000 550 
Wire Bus Line
	-12100 450  -12600 450 
Entry Bus Bus
	-12600 450  -12700 550 
Text Label -11500 800  2    50   ~ 0
FPD0
Text Label -11500 900  2    50   ~ 0
FPD1
Text Label -11500 1000 2    50   ~ 0
FPD2
Text Label -11500 1100 2    50   ~ 0
FPD3
Text Label -11500 1200 2    50   ~ 0
FPD4
Text Label -11500 1300 2    50   ~ 0
FPD5
Text Label -11500 1400 2    50   ~ 0
FPD6
Text Label -11500 1500 2    50   ~ 0
FPD7
Wire Wire Line
	-11900 1500 -11450 1500
Wire Wire Line
	-11900 1400 -11450 1400
Wire Wire Line
	-11900 1300 -11450 1300
Wire Wire Line
	-11900 1200 -11450 1200
Wire Wire Line
	-11900 1100 -11450 1100
Wire Wire Line
	-11900 1000 -11450 1000
Wire Wire Line
	-11900 900  -11450 900 
Wire Wire Line
	-11900 800  -11450 800 
Wire Wire Line
	-10550 3900 -10100 3900
Wire Wire Line
	-10350 3800 -10100 3800
Wire Wire Line
	-10550 3700 -10100 3700
Text Label -10100 3900 2    50   ~ 0
FPA7
Text Label -10100 3800 2    50   ~ 0
FPA6
Text Label -10100 3700 2    50   ~ 0
FPA5
Entry Wire Line
	-10100 3700 -10000 3800
Entry Wire Line
	-10100 3800 -10000 3900
Entry Wire Line
	-10100 3900 -10000 4000
Entry Wire Line
	-9900 2100 -10000 2200
Entry Wire Line
	-9900 2200 -10000 2300
Entry Wire Line
	-9900 2300 -10000 2400
Entry Wire Line
	-9900 2700 -10000 2800
Entry Wire Line
	-9900 2900 -10000 3000
Connection ~ -12000 3300
Wire Wire Line
	-12000 3300 -12000 3800
Entry Wire Line
	-9900 3400 -10000 3500
Entry Wire Line
	-9900 3500 -10000 3600
Entry Wire Line
	-9900 3600 -10000 3700
Entry Wire Line
	-9900 4000 -10000 4100
Entry Wire Line
	-9900 4200 -10000 4300
Entry Bus Bus
	-10000 4550 -9900 4650
Wire Bus Line
	-9900 4650 -9350 4650
Entry Bus Bus
	-12000 550  -11900 450 
Wire Bus Line
	-11900 450  -7400 450 
Entry Bus Bus
	-7400 450  -7300 550 
Entry Bus Bus
	-7300 5100 -7200 5200
Entry Bus Bus
	-7300 5950 -7200 6050
Entry Bus Bus
	-7300 6800 -7200 6900
Entry Bus Bus
	-7300 7600 -7200 7700
Entry Bus Bus
	-7300 8500 -7200 8600
$Sheet
S -9350 4500 1150 600 
U 6233F88C
F0 "FP Scan Logic/Decoder" 50
F1 "cft-dfp-scan.sch" 50
F2 "FPA[0..7]" I L -9350 4650 50 
F3 "~FPOE[0..31]" O R -8200 4650 50 
F4 "~ROW[1..5]" O R -8200 4800 50 
F5 "~PANELEN" I L -9350 4800 50 
F6 "~SCANCLR" I R -8200 4950 50 
$EndSheet
Wire Wire Line
	-11600 3900 -11600 4800
Wire Wire Line
	-13250 3900 -11600 3900
Wire Wire Line
	-11600 4800 -9350 4800
Text Notes -15050 7400 0    100  ~ 20
Run/Step/Stop Control FSM
Text Notes -15050 9450 0    100  ~ 20
CFT Bus Address Decoder
Entry Bus Bus
	-7500 4650 -7400 4750
Wire Bus Line
	-8200 4650 -7500 4650
Text Label -7400 5600 3    50   ~ 0
~FPOE[0..31]
Text Label -9800 450  2    50   ~ 0
FPD[0..7]
Text Label -7300 2650 3    50   ~ 0
FPD[0..7]
Entry Wire Line
	-7500 6900 -7400 6800
Entry Wire Line
	-9900 800  -10000 900 
Entry Wire Line
	-9900 900  -10000 1000
Entry Wire Line
	-9900 1400 -10000 1500
Entry Wire Line
	-9900 1600 -10000 1700
Entry Wire Line
	-9900 1000 -10000 1100
Wire Wire Line
	9000 -1150 9400 -1150
Wire Wire Line
	-6600 8100 -7200 8100
Wire Wire Line
	-6600 8000 -7200 8000
Wire Wire Line
	9000 -1250 9400 -1250
Wire Wire Line
	-6600 7300 -7200 7300
Wire Wire Line
	9000 -1350 9400 -1350
Wire Wire Line
	-6600 7200 -7200 7200
Wire Wire Line
	9000 -1450 9400 -1450
Wire Wire Line
	-6600 6450 -7200 6450
Wire Wire Line
	9000 -1550 9400 -1550
Wire Wire Line
	-6600 6350 -7200 6350
Wire Wire Line
	9000 -1650 9400 -1650
Wire Wire Line
	-6600 5650 -7200 5650
Wire Wire Line
	9000 -1750 9400 -1750
Wire Wire Line
	9000 -1850 9400 -1850
Wire Wire Line
	-6600 5550 -7200 5550
Wire Wire Line
	-6600 5450 -7200 5450
Wire Wire Line
	9000 -1950 9400 -1950
$Comp
L Device:C_Small C108
U 1 1 5D43AADB
P -10300 8350
F 0 "C108" H -10391 8396 50  0000 R CNN
F 1 "100nF" H -10391 8305 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10300 8350 50  0001 C CNN
F 3 "~" H -10300 8350 50  0001 C CNN
	1    -10300 8350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 5D43AAD5
P -10300 8250
F 0 "#PWR0114" H -10300 8100 50  0001 C CNN
F 1 "+5V" H -10285 8423 50  0000 C CNN
F 2 "" H -10300 8250 50  0001 C CNN
F 3 "" H -10300 8250 50  0001 C CNN
	1    -10300 8250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5D43AACE
P -10300 8450
F 0 "#PWR0115" H -10300 8200 50  0001 C CNN
F 1 "GND" H -10295 8277 50  0000 C CNN
F 2 "" H -10300 8450 50  0001 C CNN
F 3 "" H -10300 8450 50  0001 C CNN
	1    -10300 8450
	1    0    0    -1  
$EndComp
Connection ~ -10300 8250
$Comp
L alexios:74HC540 U110
U 2 1 5D43A9C3
P -9950 8350
F 0 "U110" H -9771 8396 50  0000 L CNN
F 1 "74HC540" H -9771 8305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H -9950 8350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC540" H -9950 8350 50  0001 C CNN
	2    -9950 8350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C109
U 1 1 6029D913
P -10350 7150
F 0 "C109" H -10441 7196 50  0000 R CNN
F 1 "100nF" H -10441 7105 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10350 7150 50  0001 C CNN
F 3 "~" H -10350 7150 50  0001 C CNN
	1    -10350 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 6029D919
P -10350 7050
F 0 "#PWR0116" H -10350 6900 50  0001 C CNN
F 1 "+5V" H -10335 7223 50  0000 C CNN
F 2 "" H -10350 7050 50  0001 C CNN
F 3 "" H -10350 7050 50  0001 C CNN
	1    -10350 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 6029D91F
P -10350 7250
F 0 "#PWR0117" H -10350 7000 50  0001 C CNN
F 1 "GND" H -10345 7077 50  0000 C CNN
F 2 "" H -10350 7250 50  0001 C CNN
F 3 "" H -10350 7250 50  0001 C CNN
	1    -10350 7250
	1    0    0    -1  
$EndComp
Connection ~ -10350 7050
Connection ~ -10350 7250
$Comp
L power:GND #PWR0119
U 1 1 60AD334D
P -9100 9700
F 0 "#PWR0119" H -9100 9450 50  0001 C CNN
F 1 "GND" H -9095 9527 50  0000 C CNN
F 2 "" H -9100 9700 50  0001 C CNN
F 3 "" H -9100 9700 50  0001 C CNN
	1    -9100 9700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0118
U 1 1 60AD3354
P -9100 9500
F 0 "#PWR0118" H -9100 9350 50  0001 C CNN
F 1 "+5V" H -9085 9673 50  0000 C CNN
F 2 "" H -9100 9500 50  0001 C CNN
F 3 "" H -9100 9500 50  0001 C CNN
	1    -9100 9500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C110
U 1 1 60AD335A
P -9100 9600
F 0 "C110" H -9191 9646 50  0000 R CNN
F 1 "100nF" H -9191 9555 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -9100 9600 50  0001 C CNN
F 3 "~" H -9100 9600 50  0001 C CNN
	1    -9100 9600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G07 U105
U 2 1 60B205FC
P -8750 10200
F 0 "U105" H -8570 10146 50  0000 L CNN
F 1 "74LVC1G07" H -8570 10055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -8650 10200 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -8650 10200 50  0001 C CNN
	2    -8750 10200
	1    0    0    -1  
$EndComp
Connection ~ -9100 9700
Connection ~ -9100 9500
$Comp
L power:GND #PWR0121
U 1 1 60BBE56C
P -9100 10400
F 0 "#PWR0121" H -9100 10150 50  0001 C CNN
F 1 "GND" H -9095 10227 50  0000 C CNN
F 2 "" H -9100 10400 50  0001 C CNN
F 3 "" H -9100 10400 50  0001 C CNN
	1    -9100 10400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0120
U 1 1 60BBE572
P -9100 10200
F 0 "#PWR0120" H -9100 10050 50  0001 C CNN
F 1 "+5V" H -9085 10373 50  0000 C CNN
F 2 "" H -9100 10200 50  0001 C CNN
F 3 "" H -9100 10200 50  0001 C CNN
	1    -9100 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C111
U 1 1 60BBE578
P -9100 10300
F 0 "C111" H -9191 10346 50  0000 R CNN
F 1 "100nF" H -9191 10255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -9100 10300 50  0001 C CNN
F 3 "~" H -9100 10300 50  0001 C CNN
	1    -9100 10300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G07 U106
U 2 1 60BBE57E
P -7300 9500
F 0 "U106" H -7120 9446 50  0000 L CNN
F 1 "74LVC1G07" H -7120 9355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -7200 9500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -7200 9500 50  0001 C CNN
	2    -7300 9500
	1    0    0    -1  
$EndComp
Connection ~ -9100 10400
Connection ~ -9100 10200
$Comp
L power:GND #PWR0124
U 1 1 60C0BD68
P -7650 9700
F 0 "#PWR0124" H -7650 9450 50  0001 C CNN
F 1 "GND" H -7645 9527 50  0000 C CNN
F 2 "" H -7650 9700 50  0001 C CNN
F 3 "" H -7650 9700 50  0001 C CNN
	1    -7650 9700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 60C0BD6E
P -7650 9500
F 0 "#PWR0123" H -7650 9350 50  0001 C CNN
F 1 "+5V" H -7635 9673 50  0000 C CNN
F 2 "" H -7650 9500 50  0001 C CNN
F 3 "" H -7650 9500 50  0001 C CNN
	1    -7650 9500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C112
U 1 1 60C0BD74
P -7650 9600
F 0 "C112" H -7741 9646 50  0000 R CNN
F 1 "100nF" H -7741 9555 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -7650 9600 50  0001 C CNN
F 3 "~" H -7650 9600 50  0001 C CNN
	1    -7650 9600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G07 U115
U 2 1 60C0BD7A
P -5850 10200
F 0 "U115" H -5670 10146 50  0000 L CNN
F 1 "74LVC1G07" H -5670 10055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -5750 10200 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -5750 10200 50  0001 C CNN
	2    -5850 10200
	1    0    0    -1  
$EndComp
Connection ~ -7650 9700
Connection ~ -7650 9500
$Comp
L alexios:74LVC1G04 U109
U 2 1 5DF588F5
P -7300 10300
F 0 "U109" H -7120 10346 50  0000 L CNN
F 1 "74LVC1G04" H -7120 10255 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -7300 10300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H -7300 10300 50  0001 C CNN
	2    -7300 10300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C113
U 1 1 5DF588EE
P -7650 10300
F 0 "C113" H -7741 10346 50  0000 R CNN
F 1 "100nF" H -7741 10255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -7650 10300 50  0001 C CNN
F 3 "~" H -7650 10300 50  0001 C CNN
	1    -7650 10300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0125
U 1 1 5DF588E8
P -7650 10200
F 0 "#PWR0125" H -7650 10050 50  0001 C CNN
F 1 "+5V" H -7635 10373 50  0000 C CNN
F 2 "" H -7650 10200 50  0001 C CNN
F 3 "" H -7650 10200 50  0001 C CNN
	1    -7650 10200
	1    0    0    -1  
$EndComp
Connection ~ -7650 10200
$Comp
L power:GND #PWR0126
U 1 1 5DF588E1
P -7650 10400
F 0 "#PWR0126" H -7650 10150 50  0001 C CNN
F 1 "GND" H -7645 10227 50  0000 C CNN
F 2 "" H -7650 10400 50  0001 C CNN
F 3 "" H -7650 10400 50  0001 C CNN
	1    -7650 10400
	1    0    0    -1  
$EndComp
Connection ~ -7650 10400
Text Notes -11500 300  0    100  ~ 20
Address Latch
Text Notes -9600 300  0    100  ~ 20
Address Decoders
Text Notes -5150 2400 1    100  ~ 20
Bus Hold
Text Notes -2550 2450 1    100  ~ 20
Left Slot
Text Notes -2550 7250 1    100  ~ 20
Right Slot
Entry Wire Line
	-1600 2300 -1500 2400
Entry Wire Line
	-1600 2400 -1500 2500
Entry Wire Line
	-1600 2500 -1500 2600
Entry Wire Line
	-1600 2600 -1500 2700
Entry Wire Line
	-1600 2700 -1500 2800
Entry Wire Line
	-1600 2800 -1500 2900
Entry Wire Line
	-1600 2900 -1500 3000
Entry Wire Line
	-1600 3000 -1500 3100
Text Label -1500 2400 0    50   ~ 0
SWA[0..3]
Text Label -1500 2800 0    50   ~ 0
SWD[0..3]
Text Notes -1450 3200 0    50   ~ 0
Power switch from front panel
Wire Wire Line
	-2150 5100 -1600 5100
Text Label -1600 5100 2    50   ~ 0
POWER
Text Notes -1400 5100 0    50   ~ 0
Power enable → backplane
$Comp
L power:+5V #PWR0127
U 1 1 61445C6A
P -7000 1700
F 0 "#PWR0127" H -7000 1550 50  0001 C CNN
F 1 "+5V" H -6985 1873 50  0000 C CNN
F 2 "" H -7000 1700 50  0001 C CNN
F 3 "" H -7000 1700 50  0001 C CNN
	1    -7000 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 61446852
P -7000 2100
F 0 "#PWR0128" H -7000 1850 50  0001 C CNN
F 1 "GND" H -6995 1927 50  0000 C CNN
F 2 "" H -7000 2100 50  0001 C CNN
F 3 "" H -7000 2100 50  0001 C CNN
	1    -7000 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2150 4000 -2000 4000
Wire Wire Line
	-2150 4100 -2000 4100
Wire Wire Line
	-2150 4200 -2000 4200
NoConn ~ -2000 4000
NoConn ~ -2000 4200
$Comp
L alexios:AVR-ISP-6 J101
U 1 1 61739980
P -6550 1900
F 0 "J101" H -6550 2367 50  0000 C CNN
F 1 "AVR-ISP-6" H -6550 2276 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x03_P2.54mm_Horizontal" V -6800 1900 50  0001 C CNN
F 3 " ~" H -7825 1350 50  0001 C CNN
	1    -6550 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-7000 1700 -7000 1750
Wire Wire Line
	-7000 1750 -6950 1750
Wire Wire Line
	-6950 2050 -7000 2050
Wire Wire Line
	-7000 2050 -7000 2100
Text Notes -6650 1350 0    100  ~ 20
ISP
Wire Wire Line
	-2150 4500 -2000 4500
$Comp
L Connector_Generic:Conn_01x06 J102
U 1 1 62B44059
P -6250 3350
F 0 "J102" H -6332 2917 50  0000 C CNN
F 1 "Conn_01x06" H -6170 3251 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H -6250 3350 50  0001 C CNN
F 3 "~" H -6250 3350 50  0001 C CNN
	1    -6250 3350
	1    0    0    1   
$EndComp
Wire Wire Line
	-6450 3150 -7200 3150
$Comp
L power:GND #PWR0129
U 1 1 62BEF3BC
P -6450 3550
F 0 "#PWR0129" H -6450 3300 50  0001 C CNN
F 1 "GND" H -6445 3377 50  0000 C CNN
F 2 "" H -6450 3550 50  0001 C CNN
F 3 "" H -6450 3550 50  0001 C CNN
	1    -6450 3550
	-1   0    0    -1  
$EndComp
NoConn ~ -6450 3450
Text Label -7200 3150 0    50   ~ 0
RXD
NoConn ~ -6450 3050
NoConn ~ -6450 3350
Text Notes -6300 2800 2    100  ~ 20
TTY
Text Notes -6550 4850 0    100  ~ 20
Input/Output
Text Notes -12550 6150 0    100  ~ 20
Multi-Function Display
Text Label -10850 7300 2    50   ~ 0
~FPSPLOE
Text Label -10850 7200 2    50   ~ 0
~FPDRLOE
Text Label -10850 7100 2    50   ~ 0
~ORLOE
Text Label -10850 6700 2    50   ~ 0
~FPSPHOE
Text Label -10850 6600 2    50   ~ 0
~FPDRHOE
Text Label -10850 6500 2    50   ~ 0
~ORHOE
NoConn ~ -11250 7400
Wire Wire Line
	-11250 7300 -10850 7300
Wire Wire Line
	-11250 7200 -10850 7200
Wire Wire Line
	-11250 7100 -10850 7100
NoConn ~ -11250 6800
Wire Wire Line
	-11250 6700 -10850 6700
Wire Wire Line
	-11250 6600 -10850 6600
Wire Wire Line
	-11250 6500 -10850 6500
Text Label -12550 7400 0    50   ~ 0
~FPOE14
Wire Wire Line
	-12250 7400 -12550 7400
Text Label -12550 6800 0    50   ~ 0
~FPOE13
Text Label -12550 7200 0    50   ~ 0
MFD1
Text Label -12550 7100 0    50   ~ 0
MFD0
Wire Wire Line
	-12250 7200 -12550 7200
Wire Wire Line
	-12250 7100 -12550 7100
Text Label -12550 6600 0    50   ~ 0
MFD1
Text Label -12550 6500 0    50   ~ 0
MFD0
Wire Wire Line
	-12250 6800 -12550 6800
Wire Wire Line
	-12250 6600 -12550 6600
Wire Wire Line
	-12250 6500 -12550 6500
$Comp
L alexios:74HC139 U103
U 2 1 5D539C20
P -11750 7200
F 0 "U103" H -11750 6825 50  0000 C CNN
F 1 "74HC139" H -11750 6734 50  0000 C CNN
F 2 "alexios:SOIC-16" H -11750 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -11750 7200 50  0001 C CNN
	2    -11750 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U103
U 1 1 5D539A7A
P -11750 6600
F 0 "U103" H -11750 6967 50  0000 C CNN
F 1 "74HC139" H -11750 6876 50  0000 C CNN
F 2 "alexios:SOIC-16" H -11750 6600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -11750 6600 50  0001 C CNN
	1    -11750 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8200 4950 -8000 4950
Text Label -7550 4950 2    50   ~ 0
~SCANCLR
Wire Wire Line
	9000 -650 9400 -650
Wire Wire Line
	9000 -550 9400 -550
Wire Wire Line
	9000 -450 9400 -450
Text Label 9400 -650 2    50   ~ 0
~WCV0
Text Label 9400 -550 2    50   ~ 0
~WCV1
Text Label 9400 -450 2    50   ~ 0
~WCV2
$Comp
L power:+5V #PWR0101
U 1 1 63AFEA70
P -15300 5050
F 0 "#PWR0101" H -15300 4900 50  0001 C CNN
F 1 "+5V" H -15285 5223 50  0000 C CNN
F 2 "" H -15300 5050 50  0001 C CNN
F 3 "" H -15300 5050 50  0001 C CNN
	1    -15300 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 63B0E1EF
P -13800 4450
F 0 "#PWR0109" H -13800 4200 50  0001 C CNN
F 1 "GND" H -13795 4277 50  0000 C CNN
F 2 "" H -13800 4450 50  0001 C CNN
F 3 "" H -13800 4450 50  0001 C CNN
	1    -13800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	-7500 6900 -9250 6900
Wire Wire Line
	-9250 6900 -9250 8550
Wire Wire Line
	-9250 8550 -8650 8550
Text Label -7550 6900 2    50   ~ 0
~FPOE16
NoConn ~ -2000 3700
NoConn ~ -2000 3900
NoConn ~ -2000 4100
$Comp
L power:GND #PWR0139
U 1 1 63FCB1F1
P -2000 4500
F 0 "#PWR0139" H -2000 4250 50  0001 C CNN
F 1 "GND" H -1995 4327 50  0000 C CNN
F 2 "" H -2000 4500 50  0001 C CNN
F 3 "" H -2000 4500 50  0001 C CNN
	1    -2000 4500
	1    0    0    -1  
$EndComp
Text Label -1600 4400 2    50   ~ 0
TXD1
Text Label -1600 4300 2    50   ~ 0
RXD
Wire Wire Line
	-2150 4300 -1600 4300
Wire Wire Line
	-2150 4400 -1600 4400
$Sheet
S -1100 4150 500  400 
U 64C48268
F0 "LEDs" 50
F1 "cft_boardled.sch" 50
F2 "LED1" I L -1100 4300 50 
F3 "LED2" I L -1100 4400 50 
$EndSheet
Wire Wire Line
	-1100 4300 -1350 4300
Wire Wire Line
	-1100 4400 -1350 4400
Text Label -1350 4400 0    50   ~ 0
TXD
Text Label -1350 4300 0    50   ~ 0
RXD
Wire Wire Line
	-15200 450  -15200 500 
Wire Wire Line
	-15200 250  -15200 200 
Wire Wire Line
	-14950 250  -14950 200 
Connection ~ -14950 200 
Wire Wire Line
	-14950 200  -14700 200 
Wire Wire Line
	-14950 450  -14950 500 
Connection ~ -15200 200 
Connection ~ -15200 500 
Wire Wire Line
	-15200 500  -14950 500 
Wire Wire Line
	-15200 200  -14950 200 
Wire Wire Line
	-14700 450  -14700 500 
Wire Wire Line
	-14700 500  -14950 500 
Connection ~ -14950 500 
Wire Wire Line
	-14700 250  -14700 200 
$Comp
L Device:C_Small C116
U 1 1 5CB8CAD9
P -14700 350
F 0 "C116" H -14600 550 50  0000 R CNN
F 1 "100nF" H -14350 350 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -14700 350 50  0001 C CNN
F 3 "~" H -14700 350 50  0001 C CNN
	1    -14700 350 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C115
U 1 1 6537BC1F
P -14950 350
F 0 "C115" H -14850 550 50  0000 R CNN
F 1 "100nF" H -14850 100 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -14950 350 50  0001 C CNN
F 3 "~" H -14950 350 50  0001 C CNN
	1    -14950 350 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C106
U 1 1 652CDA9D
P -15200 350
F 0 "C106" H -15100 550 50  0000 R CNN
F 1 "1µF" H -15150 100 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -15200 350 50  0001 C CNN
F 3 "~" H -15200 350 50  0001 C CNN
	1    -15200 350 
	1    0    0    -1  
$EndComp
Connection ~ -15450 500 
$Comp
L power:GND #PWR0105
U 1 1 657A3637
P -15450 500
F 0 "#PWR0105" H -15450 250 50  0001 C CNN
F 1 "GND" H -15600 450 50  0000 C CNN
F 2 "" H -15450 500 50  0001 C CNN
F 3 "" H -15450 500 50  0001 C CNN
	1    -15450 500 
	1    0    0    -1  
$EndComp
Wire Wire Line
	-15450 500  -15200 500 
Wire Wire Line
	-15450 200  -15200 200 
$Comp
L Device:C_Small C103
U 1 1 5CB8D474
P -15450 350
F 0 "C103" H -15350 550 50  0000 R CNN
F 1 "1µF" H -15500 450 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -15450 350 50  0001 C CNN
F 3 "~" H -15450 350 50  0001 C CNN
	1    -15450 350 
	1    0    0    -1  
$EndComp
Wire Wire Line
	-15450 450  -15450 500 
Wire Wire Line
	-15450 250  -15450 200 
Wire Wire Line
	-14700 200  -14250 200 
Connection ~ -14700 200 
Connection ~ -14250 200 
Wire Wire Line
	-15150 4150 -15150 4200
Wire Wire Line
	-15150 3950 -15150 3900
$Comp
L power:GND #PWR0150
U 1 1 65C82015
P -15300 4200
F 0 "#PWR0150" H -15300 3950 50  0001 C CNN
F 1 "GND" H -15295 4027 50  0000 C CNN
F 2 "" H -15300 4200 50  0001 C CNN
F 3 "" H -15300 4200 50  0001 C CNN
	1    -15300 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	-15450 4200 -15300 4200
Wire Wire Line
	-15450 3900 -15300 3900
$Comp
L Device:C_Small C117
U 1 1 65C8201D
P -15450 4050
F 0 "C117" H -15541 4096 50  0000 R CNN
F 1 "1µF" H -15541 4005 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -15450 4050 50  0001 C CNN
F 3 "~" H -15450 4050 50  0001 C CNN
	1    -15450 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-15450 4150 -15450 4200
Wire Wire Line
	-15450 3950 -15450 3900
$Comp
L Device:C_Small C118
U 1 1 65D388D9
P -15150 4050
F 0 "C118" H -15058 4096 50  0000 L CNN
F 1 "100nF" H -15058 4005 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -15150 4050 50  0001 C CNN
F 3 "~" H -15150 4050 50  0001 C CNN
	1    -15150 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0151
U 1 1 65D39BEF
P -15300 3900
F 0 "#PWR0151" H -15300 3750 50  0001 C CNN
F 1 "+5V" H -15285 4073 50  0000 C CNN
F 2 "" H -15300 3900 50  0001 C CNN
F 3 "" H -15300 3900 50  0001 C CNN
	1    -15300 3900
	1    0    0    -1  
$EndComp
Connection ~ -15300 3900
Wire Wire Line
	-15300 3900 -15150 3900
Connection ~ -15300 4200
Wire Wire Line
	-15300 4200 -15150 4200
$Comp
L Device:C_Small C114
U 1 1 64FB2807
P -12350 4650
F 0 "C114" H -12441 4696 50  0000 R CNN
F 1 "100nF" H -12441 4605 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -12350 4650 50  0001 C CNN
F 3 "~" H -12350 4650 50  0001 C CNN
	1    -12350 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0149
U 1 1 64FB2801
P -12350 4550
F 0 "#PWR0149" H -12350 4400 50  0001 C CNN
F 1 "+5V" H -12335 4723 50  0000 C CNN
F 2 "" H -12350 4550 50  0001 C CNN
F 3 "" H -12350 4550 50  0001 C CNN
	1    -12350 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U111
U 2 1 664A1EB4
P -12350 5300
F 0 "U111" H -12500 5550 50  0000 L CNN
F 1 "74HC138" H -12500 5050 50  0000 L CNN
F 2 "alexios:SOIC-16" H -12350 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -12350 5300 50  0001 C CNN
F 4 "Yes" H -16250 -450 50  0001 C CNN "Verified"
	2    -12350 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C120
U 1 1 664FF675
P -12700 5300
F 0 "C120" H -12791 5346 50  0000 R CNN
F 1 "100nF" H -12791 5255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -12700 5300 50  0001 C CNN
F 3 "~" H -12700 5300 50  0001 C CNN
	1    -12700 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0156
U 1 1 664FF67B
P -12700 5200
F 0 "#PWR0156" H -12700 5050 50  0001 C CNN
F 1 "+5V" H -12685 5373 50  0000 C CNN
F 2 "" H -12700 5200 50  0001 C CNN
F 3 "" H -12700 5200 50  0001 C CNN
	1    -12700 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 664FF681
P -12700 5400
F 0 "#PWR0157" H -12700 5150 50  0001 C CNN
F 1 "GND" H -12695 5227 50  0000 C CNN
F 2 "" H -12700 5400 50  0001 C CNN
F 3 "" H -12700 5400 50  0001 C CNN
	1    -12700 5400
	1    0    0    -1  
$EndComp
Connection ~ -12700 5200
Connection ~ -12700 5400
$Comp
L Device:C_Small C119
U 1 1 6666ED78
P -13600 5300
F 0 "C119" H -13691 5346 50  0000 R CNN
F 1 "100nF" H -13691 5255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -13600 5300 50  0001 C CNN
F 3 "~" H -13600 5300 50  0001 C CNN
	1    -13600 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0162
U 1 1 6666ED7E
P -13600 5200
F 0 "#PWR0162" H -13600 5050 50  0001 C CNN
F 1 "+5V" H -13585 5373 50  0000 C CNN
F 2 "" H -13600 5200 50  0001 C CNN
F 3 "" H -13600 5200 50  0001 C CNN
	1    -13600 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0163
U 1 1 6666ED84
P -13600 5400
F 0 "#PWR0163" H -13600 5150 50  0001 C CNN
F 1 "GND" H -13595 5227 50  0000 C CNN
F 2 "" H -13600 5400 50  0001 C CNN
F 3 "" H -13600 5400 50  0001 C CNN
	1    -13600 5400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC573 U107
U 2 1 666C9F79
P -13100 5700
F 0 "U107" H -13400 6350 50  0000 L CNN
F 1 "74AC573" H -13400 5850 50  0000 L CNN
F 2 "alexios:SOIC-20W" H -13100 5700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H -13100 5700 50  0001 C CNN
F 4 "Yes" H -16250 -450 50  0001 C CNN "Verified"
	2    -13100 5700
	1    0    0    -1  
$EndComp
Connection ~ -13600 5400
Connection ~ -13600 5200
$Comp
L alexios:74HC138 U112
U 2 1 66786184
P -11450 5300
F 0 "U112" H -11600 5550 50  0000 L CNN
F 1 "74HC138" H -11600 5050 50  0000 L CNN
F 2 "alexios:SOIC-16" H -11450 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -11450 5300 50  0001 C CNN
F 4 "Yes" H -16250 -450 50  0001 C CNN "Verified"
	2    -11450 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C121
U 1 1 6678618A
P -11800 5300
F 0 "C121" H -11891 5346 50  0000 R CNN
F 1 "100nF" H -11891 5255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -11800 5300 50  0001 C CNN
F 3 "~" H -11800 5300 50  0001 C CNN
	1    -11800 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0154
U 1 1 66786190
P -11800 5200
F 0 "#PWR0154" H -11800 5050 50  0001 C CNN
F 1 "+5V" H -11785 5373 50  0000 C CNN
F 2 "" H -11800 5200 50  0001 C CNN
F 3 "" H -11800 5200 50  0001 C CNN
	1    -11800 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0155
U 1 1 66786196
P -11800 5400
F 0 "#PWR0155" H -11800 5150 50  0001 C CNN
F 1 "GND" H -11795 5227 50  0000 C CNN
F 2 "" H -11800 5400 50  0001 C CNN
F 3 "" H -11800 5400 50  0001 C CNN
	1    -11800 5400
	1    0    0    -1  
$EndComp
Connection ~ -11800 5200
Connection ~ -11800 5400
$Comp
L alexios:74HC138 U113
U 2 1 66840818
P -10550 5300
F 0 "U113" H -10700 5550 50  0000 L CNN
F 1 "74HC138" H -10700 5050 50  0000 L CNN
F 2 "alexios:SOIC-16" H -10550 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -10550 5300 50  0001 C CNN
F 4 "Yes" H -16250 -450 50  0001 C CNN "Verified"
	2    -10550 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C122
U 1 1 6684081E
P -10900 5300
F 0 "C122" H -10991 5346 50  0000 R CNN
F 1 "100nF" H -10991 5255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10900 5300 50  0001 C CNN
F 3 "~" H -10900 5300 50  0001 C CNN
	1    -10900 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0158
U 1 1 66840824
P -10900 5200
F 0 "#PWR0158" H -10900 5050 50  0001 C CNN
F 1 "+5V" H -10885 5373 50  0000 C CNN
F 2 "" H -10900 5200 50  0001 C CNN
F 3 "" H -10900 5200 50  0001 C CNN
	1    -10900 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0159
U 1 1 6684082A
P -10900 5400
F 0 "#PWR0159" H -10900 5150 50  0001 C CNN
F 1 "GND" H -10895 5227 50  0000 C CNN
F 2 "" H -10900 5400 50  0001 C CNN
F 3 "" H -10900 5400 50  0001 C CNN
	1    -10900 5400
	1    0    0    -1  
$EndComp
Connection ~ -10900 5200
$Comp
L Device:R_Small R103
U 1 1 66C6F898
P -10450 3800
F 0 "R103" V -10600 3800 50  0000 C CNN
F 1 "4.7kΩ" V -10600 3750 50  0001 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10450 3800 50  0001 C CNN
F 3 "~" H -10450 3800 50  0001 C CNN
	1    -10450 3800
	0    1    1    0   
$EndComp
Text Label -15600 1000 0    50   ~ 0
~FPHALT
Text Label -12100 9250 0    50   ~ 0
~FPRSTHOLD
Wire Wire Line
	-11550 9250 -12100 9250
Text Label -9650 9250 2    50   ~ 0
~RSTHOLD
Wire Wire Line
	-10550 9250 -10050 9250
$Comp
L alexios:74LVC1G07 U105
U 1 1 61555FB7
P -11350 9250
F 0 "U105" H -11250 9350 50  0000 L CNN
F 1 "74LVC1G07" H -11850 9200 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -11250 9250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -11250 9250 50  0001 C CNN
	1    -11350 9250
	1    0    0    -1  
$EndComp
Text Label -12100 9850 0    50   ~ 0
~FPHALT
Text Label -9650 9850 2    50   ~ 0
~HALT
Wire Wire Line
	-10850 9850 -10350 9850
$Comp
L alexios:74LVC1G07 U115
U 1 1 678EA6F2
P -11350 9850
F 0 "U115" H -11250 9950 50  0000 L CNN
F 1 "74LVC1G07" H -11850 9750 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -11250 9850 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -11250 9850 50  0001 C CNN
	1    -11350 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0161
U 1 1 67A522FE
P -6200 10400
F 0 "#PWR0161" H -6200 10150 50  0001 C CNN
F 1 "GND" H -6195 10227 50  0000 C CNN
F 2 "" H -6200 10400 50  0001 C CNN
F 3 "" H -6200 10400 50  0001 C CNN
	1    -6200 10400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0160
U 1 1 67A52304
P -6200 10200
F 0 "#PWR0160" H -6200 10050 50  0001 C CNN
F 1 "+5V" H -6185 10373 50  0000 C CNN
F 2 "" H -6200 10200 50  0001 C CNN
F 3 "" H -6200 10200 50  0001 C CNN
	1    -6200 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C123
U 1 1 67A5230A
P -6200 10300
F 0 "C123" H -6109 10254 50  0000 L CNN
F 1 "100nF" H -6109 10345 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -6200 10300 50  0001 C CNN
F 3 "~" H -6200 10300 50  0001 C CNN
	1    -6200 10300
	-1   0    0    1   
$EndComp
$Comp
L alexios:74LVC1G07 U104
U 2 1 67A52310
P -8750 9500
F 0 "U104" H -8570 9446 50  0000 L CNN
F 1 "74LVC1G07" H -8570 9355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -8650 9500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -8650 9500 50  0001 C CNN
	2    -8750 9500
	1    0    0    -1  
$EndComp
Connection ~ -6200 10400
Connection ~ -6200 10200
Wire Wire Line
	-2150 1000 -1600 1000
Wire Wire Line
	-2150 1100 -1600 1100
Wire Wire Line
	-2150 1200 -1600 1200
Wire Wire Line
	-2150 1300 -1600 1300
Wire Wire Line
	-2150 1400 -1600 1400
Wire Wire Line
	-2150 1500 -1600 1500
Wire Wire Line
	-2150 1600 -1600 1600
Wire Wire Line
	-2150 1700 -1600 1700
Text Label -1600 1000 2    50   ~ 0
FPD0
Text Label -1600 1100 2    50   ~ 0
FPD1
Text Label -1600 1200 2    50   ~ 0
FPD2
Text Label -1600 1300 2    50   ~ 0
FPD3
Text Label -1600 1400 2    50   ~ 0
FPD4
Text Label -1600 1500 2    50   ~ 0
FPD5
Text Label -1600 1600 2    50   ~ 0
FPD6
Text Label -1600 1700 2    50   ~ 0
FPD7
Wire Bus Line
	-5450 8800 -4950 8800
Text Label -4950 8800 2    50   ~ 0
ACTION[0..3]
$Comp
L alexios:CXO X101
U 1 1 5D8C820D
P -14700 5200
F 0 "X101" H -14600 5567 50  0000 C CNN
F 1 "CXO" H -14600 5476 50  0000 C CNN
F 2 "alexios:Crystal_SMD_7050-4Pin_7.0x5.0mm" H -14550 4800 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/741/LFSPXO022296Bulk-985375.pdf" H -14600 5150 50  0001 C CNN
F 4 "449-LFSPXO019275REEL" H -14700 5200 50  0001 C CNN "BOM-Mouser"
F 5 "Yes" H -14700 5200 50  0001 C CNN "Verified"
	1    -14700 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2150 3200 -1600 3200
Text Label -3850 2800 0    50   ~ 0
~W
Wire Wire Line
	-14750 1500 -15250 1500
$Comp
L Device:CP_Small C124
U 1 1 5D6D5C2A
P -10000 6250
AR Path="/5D6D5C2A" Ref="C124"  Part="1" 
AR Path="/5D34E810/5D6D5C2A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D6D5C2A" Ref="C?"  Part="1" 
F 0 "C124" H -10088 6296 50  0000 R CNN
F 1 "47µF" H -10088 6205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -10000 6250 50  0001 C CNN
F 3 "~" H -10000 6250 50  0001 C CNN
	1    -10000 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6D5C23
P -10000 6450
AR Path="/5F67D4B5/5D6D5C23" Ref="#PWR?"  Part="1" 
AR Path="/5D6D5C23" Ref="#PWR0171"  Part="1" 
AR Path="/5D34E810/5D6D5C23" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D6D5C23" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D6D5C23" Ref="#PWR?"  Part="1" 
F 0 "#PWR0171" H -10000 6200 50  0001 C CNN
F 1 "GND" H -10078 6413 50  0000 R CNN
F 2 "" H -10000 6450 50  0001 C CNN
F 3 "" H -10000 6450 50  0001 C CNN
	1    -10000 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D6D5C1D
P -10000 6050
AR Path="/5F67D4B5/5D6D5C1D" Ref="#PWR?"  Part="1" 
AR Path="/5D6D5C1D" Ref="#PWR0172"  Part="1" 
AR Path="/5D34E810/5D6D5C1D" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D6D5C1D" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D6D5C1D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0172" H -10000 5900 50  0001 C CNN
F 1 "+5V" H -10058 6087 50  0000 R CNN
F 2 "" H -10000 6050 50  0001 C CNN
F 3 "" H -10000 6050 50  0001 C CNN
	1    -10000 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-10000 6050 -10000 6150
Wire Wire Line
	-10000 6350 -10000 6450
$Comp
L Device:CP_Small C125
U 1 1 5D8AD6F7
P -9600 6250
AR Path="/5D8AD6F7" Ref="C125"  Part="1" 
AR Path="/5D34E810/5D8AD6F7" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8AD6F7" Ref="C?"  Part="1" 
F 0 "C125" H -9688 6296 50  0000 R CNN
F 1 "47µF" H -9688 6205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -9600 6250 50  0001 C CNN
F 3 "~" H -9600 6250 50  0001 C CNN
	1    -9600 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8AD6FD
P -9600 6450
AR Path="/5F67D4B5/5D8AD6FD" Ref="#PWR?"  Part="1" 
AR Path="/5D8AD6FD" Ref="#PWR0173"  Part="1" 
AR Path="/5D34E810/5D8AD6FD" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8AD6FD" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8AD6FD" Ref="#PWR?"  Part="1" 
F 0 "#PWR0173" H -9600 6200 50  0001 C CNN
F 1 "GND" H -9678 6413 50  0000 R CNN
F 2 "" H -9600 6450 50  0001 C CNN
F 3 "" H -9600 6450 50  0001 C CNN
	1    -9600 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D8AD703
P -9600 6050
AR Path="/5F67D4B5/5D8AD703" Ref="#PWR?"  Part="1" 
AR Path="/5D8AD703" Ref="#PWR0174"  Part="1" 
AR Path="/5D34E810/5D8AD703" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8AD703" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8AD703" Ref="#PWR?"  Part="1" 
F 0 "#PWR0174" H -9600 5900 50  0001 C CNN
F 1 "+5V" H -9658 6087 50  0000 R CNN
F 2 "" H -9600 6050 50  0001 C CNN
F 3 "" H -9600 6050 50  0001 C CNN
	1    -9600 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-9600 6050 -9600 6150
Wire Wire Line
	-9600 6350 -9600 6450
$Comp
L Device:CP_Small C126
U 1 1 5D96B10C
P -9150 6250
AR Path="/5D96B10C" Ref="C126"  Part="1" 
AR Path="/5D34E810/5D96B10C" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D96B10C" Ref="C?"  Part="1" 
F 0 "C126" H -9238 6296 50  0000 R CNN
F 1 "47µF" H -9238 6205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -9150 6250 50  0001 C CNN
F 3 "~" H -9150 6250 50  0001 C CNN
	1    -9150 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D96B112
P -9150 6450
AR Path="/5F67D4B5/5D96B112" Ref="#PWR?"  Part="1" 
AR Path="/5D96B112" Ref="#PWR0175"  Part="1" 
AR Path="/5D34E810/5D96B112" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D96B112" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D96B112" Ref="#PWR?"  Part="1" 
F 0 "#PWR0175" H -9150 6200 50  0001 C CNN
F 1 "GND" H -9228 6413 50  0000 R CNN
F 2 "" H -9150 6450 50  0001 C CNN
F 3 "" H -9150 6450 50  0001 C CNN
	1    -9150 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D96B118
P -9150 6050
AR Path="/5F67D4B5/5D96B118" Ref="#PWR?"  Part="1" 
AR Path="/5D96B118" Ref="#PWR0176"  Part="1" 
AR Path="/5D34E810/5D96B118" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D96B118" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D96B118" Ref="#PWR?"  Part="1" 
F 0 "#PWR0176" H -9150 5900 50  0001 C CNN
F 1 "+5V" H -9208 6087 50  0000 R CNN
F 2 "" H -9150 6050 50  0001 C CNN
F 3 "" H -9150 6050 50  0001 C CNN
	1    -9150 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-9150 6050 -9150 6150
Wire Wire Line
	-9150 6350 -9150 6450
$Comp
L Device:CP_Small C127
U 1 1 5D96B120
P -8750 6250
AR Path="/5D96B120" Ref="C127"  Part="1" 
AR Path="/5D34E810/5D96B120" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D96B120" Ref="C?"  Part="1" 
F 0 "C127" H -8838 6296 50  0000 R CNN
F 1 "47µF" H -8838 6205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -8750 6250 50  0001 C CNN
F 3 "~" H -8750 6250 50  0001 C CNN
	1    -8750 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D96B126
P -8750 6450
AR Path="/5F67D4B5/5D96B126" Ref="#PWR?"  Part="1" 
AR Path="/5D96B126" Ref="#PWR0177"  Part="1" 
AR Path="/5D34E810/5D96B126" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D96B126" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D96B126" Ref="#PWR?"  Part="1" 
F 0 "#PWR0177" H -8750 6200 50  0001 C CNN
F 1 "GND" H -8828 6413 50  0000 R CNN
F 2 "" H -8750 6450 50  0001 C CNN
F 3 "" H -8750 6450 50  0001 C CNN
	1    -8750 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D96B12C
P -8750 6050
AR Path="/5F67D4B5/5D96B12C" Ref="#PWR?"  Part="1" 
AR Path="/5D96B12C" Ref="#PWR0178"  Part="1" 
AR Path="/5D34E810/5D96B12C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D96B12C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D96B12C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0178" H -8750 5900 50  0001 C CNN
F 1 "+5V" H -8808 6087 50  0000 R CNN
F 2 "" H -8750 6050 50  0001 C CNN
F 3 "" H -8750 6050 50  0001 C CNN
	1    -8750 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8750 6050 -8750 6150
Wire Wire Line
	-8750 6350 -8750 6450
$Comp
L Device:CP_Small C128
U 1 1 5DAA26C2
P -8300 6250
AR Path="/5DAA26C2" Ref="C128"  Part="1" 
AR Path="/5D34E810/5DAA26C2" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DAA26C2" Ref="C?"  Part="1" 
F 0 "C128" H -8388 6296 50  0000 R CNN
F 1 "47µF" H -8388 6205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -8300 6250 50  0001 C CNN
F 3 "~" H -8300 6250 50  0001 C CNN
	1    -8300 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DAA26C8
P -8300 6450
AR Path="/5F67D4B5/5DAA26C8" Ref="#PWR?"  Part="1" 
AR Path="/5DAA26C8" Ref="#PWR0179"  Part="1" 
AR Path="/5D34E810/5DAA26C8" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DAA26C8" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DAA26C8" Ref="#PWR?"  Part="1" 
F 0 "#PWR0179" H -8300 6200 50  0001 C CNN
F 1 "GND" H -8378 6413 50  0000 R CNN
F 2 "" H -8300 6450 50  0001 C CNN
F 3 "" H -8300 6450 50  0001 C CNN
	1    -8300 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DAA26CE
P -8300 6050
AR Path="/5F67D4B5/5DAA26CE" Ref="#PWR?"  Part="1" 
AR Path="/5DAA26CE" Ref="#PWR0180"  Part="1" 
AR Path="/5D34E810/5DAA26CE" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DAA26CE" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DAA26CE" Ref="#PWR?"  Part="1" 
F 0 "#PWR0180" H -8300 5900 50  0001 C CNN
F 1 "+5V" H -8358 6087 50  0000 R CNN
F 2 "" H -8300 6050 50  0001 C CNN
F 3 "" H -8300 6050 50  0001 C CNN
	1    -8300 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8300 6050 -8300 6150
Wire Wire Line
	-8300 6350 -8300 6450
$Comp
L Device:CP_Small C129
U 1 1 5DAA26D6
P -7900 6250
AR Path="/5DAA26D6" Ref="C129"  Part="1" 
AR Path="/5D34E810/5DAA26D6" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DAA26D6" Ref="C?"  Part="1" 
F 0 "C129" H -7988 6296 50  0000 R CNN
F 1 "47µF" H -7988 6205 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -7900 6250 50  0001 C CNN
F 3 "~" H -7900 6250 50  0001 C CNN
	1    -7900 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DAA26DC
P -7900 6450
AR Path="/5F67D4B5/5DAA26DC" Ref="#PWR?"  Part="1" 
AR Path="/5DAA26DC" Ref="#PWR0181"  Part="1" 
AR Path="/5D34E810/5DAA26DC" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DAA26DC" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DAA26DC" Ref="#PWR?"  Part="1" 
F 0 "#PWR0181" H -7900 6200 50  0001 C CNN
F 1 "GND" H -7978 6413 50  0000 R CNN
F 2 "" H -7900 6450 50  0001 C CNN
F 3 "" H -7900 6450 50  0001 C CNN
	1    -7900 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DAA26E2
P -7900 6050
AR Path="/5F67D4B5/5DAA26E2" Ref="#PWR?"  Part="1" 
AR Path="/5DAA26E2" Ref="#PWR0182"  Part="1" 
AR Path="/5D34E810/5DAA26E2" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DAA26E2" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DAA26E2" Ref="#PWR?"  Part="1" 
F 0 "#PWR0182" H -7900 5900 50  0001 C CNN
F 1 "+5V" H -7958 6087 50  0000 R CNN
F 2 "" H -7900 6050 50  0001 C CNN
F 3 "" H -7900 6050 50  0001 C CNN
	1    -7900 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-7900 6050 -7900 6150
Wire Wire Line
	-7900 6350 -7900 6450
$Comp
L Device:R_Small R102
U 1 1 66C6FB89
P -10650 3900
F 0 "R102" V -10600 4100 50  0000 C CNN
F 1 "4.7kΩ" V -10500 4050 50  0001 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10650 3900 50  0001 C CNN
F 3 "~" H -10650 3900 50  0001 C CNN
	1    -10650 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R105
U 1 1 5E7D3367
P -10850 9500
F 0 "R105" V -10746 9500 50  0000 C CNN
F 1 "30Ω" V -10655 9500 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10850 9500 50  0001 C CNN
F 3 "~" H -10850 9500 50  0001 C CNN
	1    -10850 9500
	0    1    1    0   
$EndComp
Wire Wire Line
	-10750 9500 -10600 9500
Connection ~ -10450 9500
$Comp
L Device:R_Small R104
U 1 1 5E8F1EEA
P -10950 9850
F 0 "R104" V -11000 10050 50  0000 C CNN
F 1 "30Ω" V -10900 10050 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10950 9850 50  0001 C CNN
F 3 "~" H -10950 9850 50  0001 C CNN
	1    -10950 9850
	0    1    1    0   
$EndComp
Text Label -1600 6500 2    50   ~ 0
~FPOE29
Text Label -1600 6800 2    50   ~ 0
~FPOE25
Text Label -1600 6700 2    50   ~ 0
~FPOE21
Wire Wire Line
	-2150 6500 -1600 6500
Wire Wire Line
	-2150 6800 -1600 6800
Wire Wire Line
	-2150 6700 -1600 6700
Text Notes -1400 6900 0    50   ~ 0
IR high
Text Label -1600 6900 2    50   ~ 0
~FPOE17
Wire Wire Line
	-2150 6900 -1600 6900
Text Notes -1400 7000 0    50   ~ 0
AC high
Text Notes -1400 7100 0    50   ~ 0
PC high
Text Notes -1400 7200 0    50   ~ 0
µCV mid
Text Label -1600 7000 2    50   ~ 0
~FPOE9
Text Label -1600 7100 2    50   ~ 0
~FPOE5
Text Label -1600 7200 2    50   ~ 0
~FPOE1
Wire Wire Line
	-2150 7000 -1600 7000
Wire Wire Line
	-2150 7100 -1600 7100
Wire Wire Line
	-2150 7200 -1600 7200
Text Label -1600 7300 2    50   ~ 0
~FPOE30
Wire Wire Line
	-2150 7600 -1600 7600
Text Label -1600 7400 2    50   ~ 0
~FPOE26
Wire Wire Line
	-2150 7400 -1600 7400
Text Notes -1400 7500 0    50   ~ 0
IR low\n
Text Notes -1400 7800 0    50   ~ 0
AC low
Text Notes -1400 7700 0    50   ~ 0
PC low
Text Notes -1400 8000 0    50   ~ 0
µCV low
Text Label -1600 7800 2    50   ~ 0
~FPOE10
Text Label -1600 7700 2    50   ~ 0
~FPOE6
Text Label -1600 8000 2    50   ~ 0
~FPOE2
Wire Wire Line
	-2150 7800 -1600 7800
Wire Wire Line
	-2150 7700 -1600 7700
Wire Wire Line
	-2150 8000 -1600 8000
Text Label -1600 8600 2    50   ~ 0
~FPOE23
Wire Wire Line
	-2150 8600 -1600 8600
Text Label -1600 8500 2    50   ~ 0
~FPOE19
Wire Wire Line
	-2150 8500 -1600 8500
Text Notes -950 8600 0    50   ~ 0
µAddress low
Text Notes -950 8700 0    50   ~ 0
(reserved)
Text Label -1600 8800 2    50   ~ 0
~FPOE15
Wire Wire Line
	-2150 8800 -1600 8800
Text Notes -950 8800 0    50   ~ 0
(reserved)
Text Notes -1400 9000 0    50   ~ 0
IRQs enabled
Text Notes -1400 8900 0    50   ~ 0
IRQ requests
Text Label -1600 8700 2    50   ~ 0
~FPOE11
Text Label -1600 9000 2    50   ~ 0
~FPOE7
Text Label -1600 8900 2    50   ~ 0
~FPOE3
Wire Wire Line
	-2150 8700 -1600 8700
Wire Wire Line
	-2150 9000 -1600 9000
Wire Wire Line
	-2150 8900 -1600 8900
Wire Wire Line
	-2150 8400 -1600 8400
Wire Wire Line
	-2150 8200 -1600 8200
Wire Wire Line
	-2150 8100 -1600 8100
Wire Wire Line
	-2150 7900 -1600 7900
Text Label -1600 8200 2    50   ~ 0
~FPSPHOE
Text Label -1600 7900 2    50   ~ 0
~FPSPLOE
Text Notes -1400 8400 0    50   ~ 0
MFD: DR high
Text Notes -1400 8200 0    50   ~ 0
MFD: DR low
Text Notes -1400 8100 0    50   ~ 0
MFD: SP high\n
Text Notes -1400 7900 0    50   ~ 0
MFD: SP low
Wire Wire Line
	-2150 6600 -1600 6600
Text Label -1600 6600 2    50   ~ 0
~FPOE0
Text Notes -1400 6600 0    50   ~ 0
µCV high
Wire Wire Line
	-2150 6400 -1600 6400
Wire Wire Line
	-2150 6300 -1600 6300
Text Label -1600 6400 2    50   ~ 0
~FPOE4
Text Label -1600 6300 2    50   ~ 0
~FPOE8
Text Notes -1400 6400 0    50   ~ 0
AEXT
Text Notes -1400 6300 0    50   ~ 0
Flags
Wire Wire Line
	-2150 6200 -1600 6200
Text Label -1600 6200 2    50   ~ 0
~FPOE12
Text Notes -1400 6200 0    50   ~ 0
(reserved)
Wire Wire Line
	-2150 6100 -1600 6100
Text Label -1600 6100 2    50   ~ 0
~FPOE24
Wire Wire Line
	-2150 8300 -1600 8300
Text Label -1600 8300 2    50   ~ 0
~FPOE27
Wire Wire Line
	-2150 6000 -1600 6000
Text Label -1600 6000 2    50   ~ 0
~FPOE28
Text Label -1600 8400 2    50   ~ 0
~FPDRHOE
Text Label -1600 8100 2    50   ~ 0
~FPDRLOE
Wire Wire Line
	-2150 7500 -1600 7500
Text Label -1600 7500 2    50   ~ 0
~FPOE18
Wire Wire Line
	-2150 7300 -1600 7300
Text Label -1600 7600 2    50   ~ 0
~FPOE22
$Comp
L Device:R_Small R106
U 1 1 5D7E44A0
P -10650 9250
F 0 "R106" V -10700 9450 50  0000 C CNN
F 1 "30Ω" V -10600 9450 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10650 9250 50  0001 C CNN
F 3 "~" H -10650 9250 50  0001 C CNN
	1    -10650 9250
	0    1    1    0   
$EndComp
Wire Wire Line
	-11050 9250 -10750 9250
$Comp
L Device:R_Small R107
U 1 1 5D9619DA
P -10650 9000
F 0 "R107" V -10700 9200 50  0000 C CNN
F 1 "30Ω" V -10600 9200 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10650 9000 50  0001 C CNN
F 3 "~" H -10650 9000 50  0001 C CNN
	1    -10650 9000
	0    1    1    0   
$EndComp
Wire Wire Line
	-11050 9000 -10750 9000
Wire Wire Line
	11000 -1850 11400 -1850
Text Label 11400 -1850 2    50   ~ 0
~RAB1
$Sheet
S -3300 4950 1150 4200
U 5D36B851
F0 "Right Edge Connector" 50
F1 "dfp-bus-right.sch" 50
F2 "AB[0..23]" U L -3300 5700 50 
F3 "DB[0..15]" U L -3300 5800 50 
F4 "FPD[0..7]" U L -3300 6100 50 
F5 "IBUS[0..15]" U L -3300 5100 50 
F6 "~RESET" U L -3300 5200 50 
F7 "CLK1" U L -3300 5300 50 
F8 "CLK2" U L -3300 5400 50 
F9 "CLK3" U L -3300 5500 50 
F10 "CLK4" U L -3300 5600 50 
F11 "WSTB" U L -3300 5900 50 
F12 "T34" U L -3300 6000 50 
F13 "~IRQ" U L -3300 6200 50 
F14 "~IRQS" U L -3300 6300 50 
F15 "~IRQ[0..7]" U L -3300 6400 50 
F16 "~RSTHOLD" U L -3300 6500 50 
F17 "~SYSDEV" U L -3300 6600 50 
F18 "~IODEV1xx" U L -3300 6700 50 
F19 "~IODEV2xx" U L -3300 6800 50 
F20 "~IODEV3xx" U L -3300 6900 50 
F21 "~MEM" U L -3300 7000 50 
F22 "~IO" U L -3300 7100 50 
F23 "~R" U L -3300 7200 50 
F24 "~W" U L -3300 7300 50 
F25 "~WS" U L -3300 7400 50 
F26 "~ENDEXT" U L -3300 7500 50 
F27 "~SKIPEXT" U L -3300 7600 50 
F28 "~HALT" U L -3300 7700 50 
F29 "ACTION[0..3]" U L -3300 8000 50 
F30 "WADDR[0..4]" U L -3300 8100 50 
F31 "RADDR[0..4]" U L -3300 8200 50 
F32 "RSVD[0..6]" U L -3300 8300 50 
F33 "C1" U R -2150 5100 50 
F34 "C2" U R -2150 5200 50 
F35 "C3" U R -2150 5300 50 
F36 "C4" U R -2150 5400 50 
F37 "C5" U R -2150 5500 50 
F38 "C6" U R -2150 5600 50 
F39 "C7" U R -2150 5700 50 
F40 "C8" U R -2150 5800 50 
F41 "C9" U R -2150 5900 50 
F42 "C10" U R -2150 6000 50 
F43 "C11" U R -2150 6100 50 
F44 "C12" U R -2150 6200 50 
F45 "C13" U R -2150 6300 50 
F46 "C14" U R -2150 6400 50 
F47 "C15" U R -2150 6500 50 
F48 "C16" U R -2150 6600 50 
F49 "C17" U R -2150 6700 50 
F50 "C18" U R -2150 6800 50 
F51 "C19" U R -2150 6900 50 
F52 "C20" U R -2150 7000 50 
F53 "C21" U R -2150 7100 50 
F54 "C22" U R -2150 7200 50 
F55 "C23" U R -2150 7300 50 
F56 "C24" U R -2150 7400 50 
F57 "C25" U R -2150 7500 50 
F58 "C26" U R -2150 7600 50 
F59 "C27" U R -2150 7700 50 
F60 "C28" U R -2150 7800 50 
F61 "C29" U R -2150 7900 50 
F62 "C30" U R -2150 8000 50 
F63 "C31" U R -2150 8100 50 
F64 "C32" U R -2150 8200 50 
F65 "C33" U R -2150 8300 50 
F66 "C34" U R -2150 8400 50 
F67 "C35" U R -2150 8500 50 
F68 "C36" U R -2150 8600 50 
F69 "C37" U R -2150 8700 50 
F70 "C38" U R -2150 8800 50 
F71 "C39" U R -2150 8900 50 
F72 "C40" U R -2150 9000 50 
F73 "~RUEN" U L -3300 7800 50 
F74 "~WAITING" U L -3300 7900 50 
$EndSheet
NoConn ~ -10450 3100
NoConn ~ -10450 3000
NoConn ~ -10450 2900
$Comp
L Device:R_Small R101
U 1 1 66C6F4B2
P -10650 3700
F 0 "R101" V -10750 3700 50  0000 C CNN
F 1 "4.7kΩ" V -10300 3900 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -10650 3700 50  0001 C CNN
F 3 "~" H -10650 3700 50  0001 C CNN
	1    -10650 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R108
U 1 1 5E696068
P -6850 3250
F 0 "R108" V -6746 3250 50  0000 C CNN
F 1 "30Ω" V -6655 3250 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -6850 3250 50  0001 C CNN
F 3 "~" H -6850 3250 50  0001 C CNN
	1    -6850 3250
	0    1    1    0   
$EndComp
Text Label -15250 2900 0    50   ~ 0
TXD
Wire Wire Line
	-14750 2900 -15250 2900
Text Label -7200 3250 0    50   ~ 0
TXD
Wire Wire Line
	-6950 3250 -7200 3250
Wire Wire Line
	-6750 3250 -6450 3250
Text Label -6700 3250 0    50   ~ 0
TXD1
Text Label -3950 2700 2    50   ~ 0
~R
Text Label -3950 2800 2    50   ~ 0
~W
$Sheet
S -5650 450  1150 3300
U 5F1DB2E8
F0 "Bus Hold" 50
F1 "cft-dfp-bushold.sch" 50
F2 "AB[0..23]" U R -4500 1200 50 
F3 "DB[0..15]" U R -4500 1300 50 
F4 "FPD[0..7]" U R -4500 1600 50 
F5 "IBUS[0..15]" U R -4500 600 50 
F6 "CLK1" U R -4500 800 50 
F7 "CLK2" U R -4500 900 50 
F8 "CLK3" U R -4500 1000 50 
F9 "CLK4" U R -4500 1100 50 
F10 "WSTB" U R -4500 1400 50 
F11 "T34" U R -4500 1500 50 
F12 "~MEM" U R -4500 2500 50 
F13 "~IO" U R -4500 2600 50 
F14 "~R" U R -4500 2700 50 
F15 "~W" U R -4500 2800 50 
F16 "ACTION[0..3]" U R -4500 3300 50 
F17 "WADDR[0..4]" U R -4500 3400 50 
F18 "RADDR[0..4]" U R -4500 3500 50 
F19 "~IODEV1xx" U R -4500 2200 50 
$EndSheet
Entry Wire Line
	-7500 6700 -7400 6600
Wire Wire Line
	-7500 6700 -7900 6700
Text Label -7550 6700 2    50   ~ 0
~FPOE31
$Comp
L Connector:TestPoint TP108
U 1 1 5ED12F3F
P -7900 6700
F 0 "TP108" V -7900 6888 50  0000 L CNN
F 1 "TestPoint" V -7796 6772 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -7700 6700 50  0001 C CNN
F 3 "~" H -7700 6700 50  0001 C CNN
	1    -7900 6700
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP109
U 1 1 5ED26D7D
P -8000 4950
F 0 "TP109" H -8350 5100 50  0000 L CNN
F 1 "TestPoint" V -7896 5022 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -7800 4950 50  0001 C CNN
F 3 "~" H -7800 4950 50  0001 C CNN
	1    -8000 4950
	-1   0    0    1   
$EndComp
Connection ~ -8000 4950
Wire Wire Line
	-8000 4950 -7550 4950
$Comp
L Connector:TestPoint TP112
U 1 1 5DEE97BC
P -11400 8800
F 0 "TP112" H -11300 8950 50  0000 L CNN
F 1 "TestPoint" V -11296 8872 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -11200 8800 50  0001 C CNN
F 3 "~" H -11200 8800 50  0001 C CNN
	1    -11400 8800
	1    0    0    -1  
$EndComp
Connection ~ -11400 8800
Wire Wire Line
	-11400 8800 -9650 8800
$Comp
L Connector:TestPoint TP114
U 1 1 5DEEC4ED
P -10000 9000
F 0 "TP114" H -9900 9150 50  0000 L CNN
F 1 "TestPoint" V -9896 9072 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -9800 9000 50  0001 C CNN
F 3 "~" H -9800 9000 50  0001 C CNN
	1    -10000 9000
	1    0    0    -1  
$EndComp
Connection ~ -10000 9000
Wire Wire Line
	-10000 9000 -9650 9000
$Comp
L Connector:TestPoint TP113
U 1 1 5DEEEC3A
P -10050 9250
F 0 "TP113" H -9950 9400 50  0000 L CNN
F 1 "TestPoint" V -9946 9322 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -9850 9250 50  0001 C CNN
F 3 "~" H -9850 9250 50  0001 C CNN
	1    -10050 9250
	1    0    0    -1  
$EndComp
Connection ~ -10050 9250
Wire Wire Line
	-10050 9250 -9650 9250
$Comp
L Connector:TestPoint TP110
U 1 1 5DEEEF4B
P -10600 9500
F 0 "TP110" H -10700 9400 50  0000 L CNN
F 1 "TestPoint" V -10496 9572 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -10400 9500 50  0001 C CNN
F 3 "~" H -10400 9500 50  0001 C CNN
	1    -10600 9500
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP111
U 1 1 5DEEF33B
P -10350 9850
F 0 "TP111" H -10650 9950 50  0000 L CNN
F 1 "TestPoint" V -10246 9922 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -10150 9850 50  0001 C CNN
F 3 "~" H -10150 9850 50  0001 C CNN
	1    -10350 9850
	-1   0    0    1   
$EndComp
Wire Wire Line
	-12100 9500 -11550 9500
Connection ~ -10350 9850
Wire Wire Line
	-10350 9850 -9650 9850
Wire Wire Line
	-12100 9850 -11550 9850
Connection ~ -10600 9500
Wire Wire Line
	-10600 9500 -10450 9500
Wire Wire Line
	-11050 9500 -10950 9500
Wire Wire Line
	-2150 5200 -1600 5200
NoConn ~ -1600 5200
Wire Wire Line
	-4500 2200 -3950 2200
Text Label -3950 2200 2    50   ~ 0
~IODEV1xx
Connection ~ -10300 8450
Wire Wire Line
	-13850 200  -13850 550 
Connection ~ -13850 200 
Connection ~ -10900 5400
Connection ~ -12350 4550
$Comp
L alexios:74HC590 U108
U 2 1 6511161D
P -12000 5000
AR Path="/6511161D" Ref="U108"  Part="2" 
AR Path="/6233F88C/6511161D" Ref="U?"  Part="1" 
F 0 "U108" H -12150 5600 50  0000 L CNN
F 1 "74HC590" H -12150 5100 50  0000 L CNN
F 2 "alexios:SOIC-16" H -11700 5350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H -11700 5350 50  0001 C CNN
	2    -12000 5000
	1    0    0    -1  
$EndComp
Connection ~ -12350 4750
$Comp
L power:GND #PWR0148
U 1 1 64FB27FA
P -12350 4750
F 0 "#PWR0148" H -12350 4500 50  0001 C CNN
F 1 "GND" H -12345 4577 50  0000 C CNN
F 2 "" H -12350 4750 50  0001 C CNN
F 3 "" H -12350 4750 50  0001 C CNN
	1    -12350 4750
	1    0    0    -1  
$EndComp
Text Notes -15700 2550 0    50   ~ 0
Pulled up\ninternally
Text Label -15250 3300 0    50   ~ 0
~CVOE
Wire Wire Line
	-15250 3300 -14750 3300
$Comp
L Connector:TestPoint TP102
U 1 1 5DD51570
P -15250 1500
F 0 "TP102" V -15250 1688 50  0000 L CNN
F 1 "TestPoint" V -15146 1572 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -15050 1500 50  0001 C CNN
F 3 "~" H -15050 1500 50  0001 C CNN
	1    -15250 1500
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP101
U 1 1 5E77BD30
P -12800 2000
F 0 "TP101" V -12800 2188 50  0000 L CNN
F 1 "TestPoint" V -12696 2072 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H -12600 2000 50  0001 C CNN
F 3 "~" H -12600 2000 50  0001 C CNN
	1    -12800 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	-14750 1400 -14950 1400
$Comp
L power:GND #PWR0167
U 1 1 5D8442FC
P -1850 3550
F 0 "#PWR0167" H -1850 3300 50  0001 C CNN
F 1 "GND" H -1845 3377 50  0000 C CNN
F 2 "" H -1850 3550 50  0001 C CNN
F 3 "" H -1850 3550 50  0001 C CNN
	1    -1850 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2150 3300 -1850 3300
Wire Wire Line
	-1850 3300 -1850 3400
Wire Wire Line
	-2150 3400 -1850 3400
Connection ~ -1850 3400
Wire Wire Line
	-2150 3500 -1850 3500
Wire Wire Line
	-1850 3400 -1850 3500
Connection ~ -1850 3500
Wire Wire Line
	-1850 3500 -1850 3550
Wire Wire Line
	-3300 3300 -3850 3300
Wire Wire Line
	-3300 3400 -3850 3400
NoConn ~ -3850 3300
NoConn ~ -3850 3400
Wire Wire Line
	-3300 7800 -3850 7800
Wire Wire Line
	-3300 7900 -3850 7900
NoConn ~ -3850 7800
NoConn ~ -3850 7900
Wire Wire Line
	-14750 1000 -14800 1000
NoConn ~ -14800 1000
Wire Wire Line
	-14950 1000 -14950 1400
Text Notes -14700 900  2    50   ~ 0
Erratum in R1939\n~PEN~ connected to ~FPHALT~.\nWire to TP101 instead.
Wire Notes Line width 3 style dotted rgb(255, 0, 0)
	-14950 1000 -14800 1000
NoConn ~ -13250 1900
Text Label -15000 2800 0    50   ~ 0
MOSI
Text Label -15000 2900 0    50   ~ 0
MISO
$Comp
L alexios:ATmega64-16AU U101
U 1 1 5CCED7E0
P -13950 2500
F 0 "U101" H -13550 4550 50  0000 C CNN
F 1 "ATmega64-16AU" H -13500 4450 50  0000 C CNN
F 2 "alexios:TQFP-64" H -15925 4175 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2490-8-bit-avr-microcontroller-atmega64-l_datasheet.pdf" H -14200 2500 50  0001 C CNN
F 4 "556-ATMEGA64L-8AU" H -13950 2500 50  0001 C CNN "BOM-Mouser"
F 5 "Yes" H -13950 2500 50  0001 C CNN "Verified"
	1    -13950 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-13250 2000 -12800 2000
$Sheet
S 9100 1250 1150 2600
U 66CDCD87
F0 "Bus Pods" 50
F1 "pods.sch" 50
F2 "FPD[0..7]" B L 9100 1400 50 
F3 "BUSCP" I L 9100 1600 50 
F4 "~RAB0" I R 10250 2500 50 
F5 "~RAB1" I R 10250 2600 50 
F6 "~RAB2" I R 10250 2700 50 
F7 "~WAB0" I L 9100 2500 50 
F8 "~WAB1" I L 9100 2600 50 
F9 "~WAB2" I L 9100 2700 50 
F10 "~RCV0" I R 10250 2900 50 
F11 "~RCV1" I R 10250 3000 50 
F12 "~RCV2" I R 10250 3100 50 
F13 "~WCV0" I L 9100 2900 50 
F14 "~WCV1" I L 9100 3000 50 
F15 "~WCV2" I L 9100 3100 50 
F16 "~RDB0" I R 10250 3300 50 
F17 "~RDB1" I R 10250 3400 50 
F18 "~WDB0" I L 9100 3300 50 
F19 "~WDB1" I L 9100 3400 50 
F20 "~RIB0" I R 10250 3600 50 
F21 "~RIB1" I R 10250 3700 50 
F22 "~WIB0" I L 9100 3600 50 
F23 "~WIB1" I L 9100 3700 50 
F24 "AB[0..23]" B R 10250 1400 50 
F25 "RADDR[0..4]" B R 10250 1600 50 
F26 "WADDR[0..4]" B R 10250 1700 50 
F27 "ACTION[0..3]" B R 10250 1800 50 
F28 "COND[0..3]" B R 10250 1900 50 
F29 "DB[0..15]" B R 10250 2100 50 
F30 "IBUS[0..15]" B R 10250 2300 50 
F31 "~ABOE" I L 9100 1800 50 
F32 "~CVOE" I L 9100 1900 50 
F33 "~DBOE" I L 9100 2000 50 
F34 "~IBOE" I L 9100 2100 50 
$EndSheet
Wire Bus Line
	9100 1400 8600 1400
Text Label 8600 1400 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	9100 1800 8600 1800
Text Label 8600 1800 0    50   ~ 0
~ABOE
Text Label 8600 2500 0    50   ~ 0
~WAB0
Text Label 8600 2600 0    50   ~ 0
~WAB1
Text Label 8600 2700 0    50   ~ 0
~WAB2
Wire Wire Line
	9100 2700 8600 2700
Wire Wire Line
	9100 2600 8600 2600
Wire Wire Line
	9100 2500 8600 2500
Wire Wire Line
	10750 2500 10250 2500
Wire Wire Line
	10750 2600 10250 2600
Text Label 10750 2500 2    50   ~ 0
~RAB0
Text Label 10750 2600 2    50   ~ 0
~RAB1
Wire Wire Line
	10750 2700 10250 2700
Text Label 10750 2700 2    50   ~ 0
~RAB2
Wire Bus Line
	10750 2100 10250 2100
Wire Wire Line
	8600 1600 9100 1600
Text Label 10750 2100 2    50   ~ 0
DB[0..15]
Text Label 8600 1600 0    50   ~ 0
BUSCP
Wire Wire Line
	9100 2000 8600 2000
Text Label 8600 2000 0    50   ~ 0
~DBOE
Text Label 8600 3300 0    50   ~ 0
~WDB0
Text Label 8600 3400 0    50   ~ 0
~WDB1
Wire Wire Line
	9100 3400 8600 3400
Wire Wire Line
	9100 3300 8600 3300
Wire Bus Line
	10750 1400 10250 1400
Text Label 10750 1400 2    50   ~ 0
AB[0..23]
Wire Bus Line
	10250 1600 10750 1600
Wire Bus Line
	10250 1700 10750 1700
Text Label 10750 1600 2    50   ~ 0
RADDR[0..4]
Text Label 10750 1700 2    50   ~ 0
WADDR[0..4]
Wire Bus Line
	10250 1800 10750 1800
Text Label 10750 1800 2    50   ~ 0
ACTION[0..3]
Wire Bus Line
	10250 1900 10750 1900
Text Label 10750 1900 2    50   ~ 0
COND[0..3]
Wire Wire Line
	9100 2900 8600 2900
Wire Wire Line
	9100 3000 8600 3000
Wire Wire Line
	9100 3100 8600 3100
Text Label 8600 2900 0    50   ~ 0
~WCV0
Text Label 8600 3000 0    50   ~ 0
~WCV1
Text Label 8600 3100 0    50   ~ 0
~WCV2
Text Label 8600 3600 0    50   ~ 0
~WIB0
Text Label 8600 3700 0    50   ~ 0
~WIB1
Wire Wire Line
	9100 3700 8600 3700
Wire Wire Line
	9100 3600 8600 3600
Wire Wire Line
	9100 1900 8600 1900
Wire Wire Line
	9100 2100 8600 2100
Text Label 8600 1900 0    50   ~ 0
~CVOE
Text Label 8600 2100 0    50   ~ 0
~IBOE
Wire Bus Line
	10750 2300 10250 2300
Text Label 10750 2300 2    50   ~ 0
IBUS[0..15]
Wire Wire Line
	10750 3600 10250 3600
Wire Wire Line
	10750 3700 10250 3700
Text Label 10750 3600 2    50   ~ 0
~RIB0
Text Label 10750 3700 2    50   ~ 0
~RIB1
Wire Wire Line
	10750 3300 10250 3300
Wire Wire Line
	10750 3400 10250 3400
Text Label 10750 3300 2    50   ~ 0
~RDB0
Text Label 10750 3400 2    50   ~ 0
~RDB1
Wire Wire Line
	10250 2900 10750 2900
Wire Wire Line
	10250 3000 10750 3000
Wire Wire Line
	10250 3100 10750 3100
Text Label 10750 2900 2    50   ~ 0
~RCV0
Text Label 10750 3000 2    50   ~ 0
~RCV1
Text Label 10750 3100 2    50   ~ 0
~RCV2
$Comp
L alexios:74HC154 U?
U 1 1 683DA963
P 8500 -1250
F 0 "U?" H 8500 -283 50  0000 C CNN
F 1 "74HC154" H 8500 -374 50  0000 C CNN
F 2 "" H 8500 -1250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT154.pdf" H 8500 -1250 50  0001 C CNN
	1    8500 -1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 -1950 7650 -1950
Wire Wire Line
	8000 -1850 7650 -1850
Wire Wire Line
	8000 -1750 7650 -1750
Text Label 7650 -1950 0    50   ~ 0
FPA0
Text Label 7650 -1850 0    50   ~ 0
FPA1
Text Label 7650 -1750 0    50   ~ 0
FPA2
$Comp
L alexios:74HC154 U?
U 1 1 684AE7DA
P 10500 -1250
F 0 "U?" H 10500 -283 50  0000 C CNN
F 1 "74HC154" H 10500 -374 50  0000 C CNN
F 2 "" H 10500 -1250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT154.pdf" H 10500 -1250 50  0001 C CNN
	1    10500 -1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 -1950 9650 -1950
Wire Wire Line
	10000 -1850 9650 -1850
Wire Wire Line
	10000 -1750 9650 -1750
Text Label 9650 -1950 0    50   ~ 0
FPA0
Text Label 9650 -1850 0    50   ~ 0
FPA1
Text Label 9650 -1750 0    50   ~ 0
FPA2
Wire Wire Line
	8000 -1350 7650 -1350
Text Label 7650 -1350 0    50   ~ 0
~WR
Wire Wire Line
	10000 -1350 9650 -1350
Text Label 9650 -1350 0    50   ~ 0
~RD
Wire Wire Line
	8000 -1650 7650 -1650
Text Label 7650 -1650 0    50   ~ 0
FPA3
Wire Wire Line
	10000 -1650 9650 -1650
Text Label 9650 -1650 0    50   ~ 0
FPA3
Wire Wire Line
	8000 -1450 7650 -1450
Text Label 7650 -1450 0    50   ~ 0
FPA6
Wire Wire Line
	10000 -1450 9650 -1450
Text Label 9650 -1450 0    50   ~ 0
FPA6
Text Notes -10750 4150 2    50   ~ 0
pull these up!
Text Label 11400 -1150 2    50   ~ 0
~RDSR1
Wire Wire Line
	11000 -1150 11400 -1150
Wire Wire Line
	11000 -650 11400 -650
Wire Wire Line
	11000 -550 11400 -550
Wire Wire Line
	11000 -450 11400 -450
Text Label 11400 -650 2    50   ~ 0
~RCV0
Text Label 11400 -550 2    50   ~ 0
~RCV1
Text Label 11400 -450 2    50   ~ 0
~RCV2
Wire Wire Line
	11000 -1050 11400 -1050
Wire Wire Line
	11000 -950 11400 -950
Wire Wire Line
	11000 -850 11400 -850
Wire Wire Line
	11000 -750 11400 -750
Wire Wire Line
	9000 -1050 9400 -1050
Wire Wire Line
	9000 -950 9400 -950
Wire Wire Line
	9000 -850 9400 -850
Wire Wire Line
	9000 -750 9400 -750
Text Label 11400 -1050 2    50   ~ 0
~RDSR2
Text Notes 11950 -1050 2    50   ~ 0
If necessary!
Text Notes 10150 -350 2    50   ~ 0
Reads from\n&00–0F
Text Notes 8150 -350 2    50   ~ 0
Writes to\n&00–0F
Text Notes 10550 -950 1    50   ~ 0
FPA=x0xxAAAA
Text Notes 750  900  0    63   ~ 13
TO DO:
Text Notes 750  2350 0    50   ~ 0
Add replaceable pods for buses and MCU/clock.\nIsolate front panel connector from rest of FPD.\nDisable front panel during programming.\nDisable serial port during programming.\nAdd configurable pull-ups on various signals.\nFix FTDI cable pin-out (swap RX/TX; likely ALREADY SWAPPED in R1943).\nAdd reset switch.\nAdd 1-2 more banks of DIP switches.\nLeft bus for peripherals.\nRight bus for processor, memory and memory-mapped I/O.\nFix TTYD LED.\nFix activity LED.\nAdd front-panel switch LED.\nAdd PANELEN LED.\nAdd CFT IRQ LED.\nWeakly pull-up ALL MCU outputs!!!\nPull-up MCU ~RESET~
Wire Wire Line
	700  2950 850  2950
Text Label 1700 2950 2    50   ~ 0
~uCRESET
$Comp
L Device:C_Small C?
U 1 1 6900ED2F
P 1150 3100
F 0 "C?" H 1059 3146 50  0000 R CNN
F 1 "100nF" H 1059 3055 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1150 3100 50  0001 C CNN
F 3 "~" H 1150 3100 50  0001 C CNN
	1    1150 3100
	1    0    0    -1  
$EndComp
Connection ~ 1150 2950
Wire Wire Line
	1150 2950 1250 2950
Wire Wire Line
	1150 2950 1150 3000
$Comp
L power:GND #PWR?
U 1 1 69076747
P 1150 3200
F 0 "#PWR?" H 1150 2950 50  0001 C CNN
F 1 "GND" H 1155 3027 50  0000 C CNN
F 2 "" H 1150 3200 50  0001 C CNN
F 3 "" H 1150 3200 50  0001 C CNN
	1    1150 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 690DC918
P 1250 2800
F 0 "R?" H 1308 2754 50  0000 L CNN
F 1 "10kΩ" H 1308 2845 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1250 2800 50  0001 C CNN
F 3 "~" H 1250 2800 50  0001 C CNN
	1    1250 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	1250 2900 1250 2950
Connection ~ 1250 2950
Wire Wire Line
	1250 2950 1700 2950
$Comp
L power:+5V #PWR?
U 1 1 69143384
P 1250 2650
F 0 "#PWR?" H 1250 2500 50  0001 C CNN
F 1 "+5V" H 1265 2823 50  0000 C CNN
F 2 "" H 1250 2650 50  0001 C CNN
F 3 "" H 1250 2650 50  0001 C CNN
	1    1250 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 691AAD4F
P 850 2800
F 0 "D?" V 804 2720 50  0000 R CNN
F 1 "D_ALT" V 895 2720 50  0000 R CNN
F 2 "" H 850 2800 50  0001 C CNN
F 3 "~" H 850 2800 50  0001 C CNN
	1    850  2800
	0    1    1    0   
$EndComp
Connection ~ 850  2950
Wire Wire Line
	850  2950 1150 2950
$Comp
L power:+5V #PWR?
U 1 1 691AB36E
P 850 2650
F 0 "#PWR?" H 850 2500 50  0001 C CNN
F 1 "+5V" H 865 2823 50  0000 C CNN
F 2 "" H 850 2650 50  0001 C CNN
F 3 "" H 850 2650 50  0001 C CNN
	1    850  2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2650 1250 2700
Wire Bus Line
	-7400 4750 -7400 6800
Wire Bus Line
	-15200 2000 -15200 2300
Wire Bus Line
	-15200 2400 -15200 2700
Wire Bus Line
	-1500 2400 -1500 2700
Wire Bus Line
	-1500 2800 -1500 3100
Wire Bus Line
	-12000 550  -12000 1400
Wire Bus Line
	-12700 550  -12700 1400
Wire Bus Line
	-7300 550  -7300 8500
Wire Bus Line
	-10000 900  -10000 4550
Text Notes 3450 3600 2    50   ~ 0
https://www.arduino.cc/en/uploads/Main/Arduino_Uno_Rev3-schematic.pdf
$EndSCHEMATC
