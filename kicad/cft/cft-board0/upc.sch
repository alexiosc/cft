EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 13 17
Title "Microprogram Counter"
Date ""
Rev "2119"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "microcode_sequencer.v"
$EndDescr
Text Label 9150 4000 2    50   ~ 0
UPC0
Text Label 9150 4100 2    50   ~ 0
UPC1
Text Label 9150 4200 2    50   ~ 0
UPC2
Text Label 9150 4300 2    50   ~ 0
UPC3
Text HLabel 9200 4000 2    50   Output ~ 0
UPC0
Text HLabel 9200 4100 2    50   Output ~ 0
UPC1
Text HLabel 9200 4200 2    50   Output ~ 0
UPC2
Text HLabel 9200 4300 2    50   Output ~ 0
UPC3
Wire Wire Line
	7650 4000 7600 4000
Wire Wire Line
	7600 4000 7600 4100
Wire Wire Line
	7650 4100 7600 4100
Connection ~ 7600 4100
Wire Wire Line
	7600 4100 7600 4200
Wire Wire Line
	7650 4200 7600 4200
Connection ~ 7600 4200
Wire Wire Line
	7600 4200 7600 4300
Wire Wire Line
	7650 4300 7600 4300
Connection ~ 7600 4300
Wire Wire Line
	7600 4300 7600 4350
$Comp
L power:GND #PWR?
U 1 1 5F65DB1F
P 7600 4350
AR Path="/5F65DB1F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F65DB1F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F65DB1F" Ref="#PWR01905"  Part="1" 
F 0 "#PWR01905" H 7600 4100 50  0001 C CNN
F 1 "GND" H 7500 4400 50  0000 R CNN
F 2 "" H 7600 4350 50  0001 C CNN
F 3 "" H 7600 4350 50  0001 C CNN
	1    7600 4350
	1    0    0    -1  
$EndComp
Text Label 6750 5000 0    50   ~ 0
~RSTHOLD
NoConn ~ 8650 4500
$Comp
L alexios:74HC161 U?
U 1 1 5F65DB32
P 8150 4500
AR Path="/5F65DB32" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5F65DB32" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F65DB32" Ref="U1902"  Part="1" 
F 0 "U1902" H 8150 5267 50  0000 C CNN
F 1 "74AC161" H 8150 5176 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 8450 4750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC161.pdf" H 8450 4750 50  0001 C CNN
	1    8150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4000 9200 4000
Wire Wire Line
	8650 4100 9200 4100
Wire Wire Line
	8650 4200 9200 4200
Wire Wire Line
	8650 4300 9200 4300
Connection ~ 7800 5500
$Comp
L power:+5V #PWR?
U 1 1 5F6721B1
P 7800 5500
AR Path="/5DEAC282/5F6721B1" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6721B1" Ref="#PWR01907"  Part="1" 
F 0 "#PWR01907" H 7800 5350 50  0001 C CNN
F 1 "+5V" H 7815 5673 50  0000 C CNN
F 2 "" H 7800 5500 50  0001 C CNN
F 3 "" H 7800 5500 50  0001 C CNN
	1    7800 5500
	1    0    0    -1  
$EndComp
Connection ~ 7800 5700
$Comp
L power:GND #PWR?
U 1 1 5F6721B8
P 7800 5700
AR Path="/5DEAC282/5F6721B8" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6721B8" Ref="#PWR01909"  Part="1" 
F 0 "#PWR01909" H 7800 5450 50  0001 C CNN
F 1 "GND" H 7805 5527 50  0000 C CNN
F 2 "" H 7800 5700 50  0001 C CNN
F 3 "" H 7800 5700 50  0001 C CNN
	1    7800 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F6721BE
P 7800 5600
AR Path="/5CC0D65F/5F6721BE" Ref="C?"  Part="1" 
AR Path="/5F6721BE" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F6721BE" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6721BE" Ref="C1902"  Part="1" 
F 0 "C1902" H 7709 5646 50  0000 R CNN
F 1 "100nF" H 7709 5555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7800 5600 50  0001 C CNN
F 3 "~" H 7800 5600 50  0001 C CNN
	1    7800 5600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC161 U?
U 2 1 5F6721C4
P 8150 6000
AR Path="/5F6721C4" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5F6721C4" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5F643CAF/5F6721C4" Ref="U1902"  Part="2" 
F 0 "U1902" H 8330 6446 50  0000 L CNN
F 1 "74AC161" H 8330 6355 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 8450 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 8450 6250 50  0001 C CNN
	2    8150 6000
	1    0    0    -1  
$EndComp
Text Notes 5650 2850 0    50   ~ 0
~WAITING~\n\n   X\n   0\n   1\n   1\n   1
Wire Notes Line width 12 style solid
	5350 2250 7000 2250
Wire Notes Line width 12 style solid
	7000 2250 7000 2925
Wire Notes Line width 12 style solid
	5350 2250 5350 2925
Wire Notes Line style solid
	5350 2410 7000 2410
Wire Notes Line
	6540 2250 6540 2925
Wire Notes Line width 12 style solid
	5350 2925 7000 2925
Text Notes 6000 2850 0    50   ~ 0
~END~\n\n X\n X\n 0\n X\n 1
Text Notes 6200 2850 0    50   ~ 0
~ENDEXT~\n\n   X\n   X\n   X\n   0\n   1
Text Notes 5400 2850 0    50   ~ 0
CLK4\n\n   1\n   0\n   0\n   0\n   0
Text Notes 5350 3600 0    50   ~ 0
Use an HC family mux configured as a 4-variable\nfunction generator. The use of an HC IC, and\nfeeding CLK4 to the mux gate with a pull-up makes\nthe signal a little slower. Hopefully slow enough\nthat it satisfies the µPC counter's hold requirements\nfor its ~PE~ input.
Text HLabel 2100 4650 0    50   Input ~ 0
~ENDEXT
Text HLabel 2100 4050 0    50   Input ~ 0
~END
Text HLabel 2100 5200 0    50   Input ~ 0
~HALT
$Comp
L power:+5V #PWR?
U 1 1 5F7457BB
P 3300 5850
AR Path="/5DEAC282/5F7457BB" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F7457BB" Ref="#PWR01906"  Part="1" 
F 0 "#PWR01906" H 3300 5700 50  0001 C CNN
F 1 "+5V" H 3315 6023 50  0000 C CNN
F 2 "" H 3300 5850 50  0001 C CNN
F 3 "" H 3300 5850 50  0001 C CNN
	1    3300 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F7457C2
P 3300 6050
AR Path="/5DEAC282/5F7457C2" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F7457C2" Ref="#PWR01908"  Part="1" 
F 0 "#PWR01908" H 3300 5800 50  0001 C CNN
F 1 "GND" H 3305 5877 50  0000 C CNN
F 2 "" H 3300 6050 50  0001 C CNN
F 3 "" H 3300 6050 50  0001 C CNN
	1    3300 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F7457C8
P 3300 5950
AR Path="/5CC0D65F/5F7457C8" Ref="C?"  Part="1" 
AR Path="/5F7457C8" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F7457C8" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F7457C8" Ref="C1901"  Part="1" 
F 0 "C1901" H 3209 5996 50  0000 R CNN
F 1 "100nF" H 3209 5905 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3300 5950 50  0001 C CNN
F 3 "~" H 3300 5950 50  0001 C CNN
	1    3300 5950
	1    0    0    -1  
$EndComp
Text Notes 850  1850 0    50   ~ 0
The µPC is the basis of the flow of the processor's microcode.\n\nIt counts up to 16, so microprograms can only have up to 16 steps. It resets\nto 0000 when the Control Unit asserts ~END~ or a processor extension card\nasserts ~ENDEXT~ on the bus, unless there's a wait state. In this case, it waits\nuntil the wait state has been cleared before resetting.\n\nIt increments at the end of a processor cycle (rising edge of CLK4), and only\nwhen ~RSTHOLD~, ~HALT~ and ~WS~ are all deasserted.
Text Notes 850  950  0    100  ~ 20
Microprogram Counter (µPC)
Text Notes 6600 2850 0    50   ~ 0
~µPCCLR~\n\n  1\n  1\n  0\n  0\n  1
Text HLabel 2100 4550 0    50   Input ~ 0
~WAITING
$Comp
L alexios:16V8 U1901
U 1 1 62250F79
P 3700 4300
AR Path="/62250F79" Ref="U1901"  Part="1" 
AR Path="/5DEAC282/5F643CAF/62250F79" Ref="U1901"  Part="1" 
F 0 "U1901" H 3700 5050 50  0000 C CNN
F 1 "16V8" H 3700 4950 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 3700 4300 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 3700 4300 50  0001 C CNN
F 4 "uPCGTE00" V 3700 4300 50  0000 C CNB "Signature"
F 5 "upc-gate.jed" H 3700 3650 50  0000 C CNN "Image Filename"
	1    3700 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4450 4150 4450
Wire Wire Line
	4400 4350 4150 4350
Wire Wire Line
	4400 4250 4150 4250
Text Label 2900 3850 0    50   ~ 0
CLK3
Text Label 2900 3950 0    50   ~ 0
~RESET
Text Label 2900 5200 0    50   ~ 0
~HALT
Text Label 2900 4550 0    50   ~ 0
~WAITING
Text Label 2900 4050 0    50   ~ 0
~END
Text Label 2900 4650 0    50   ~ 0
~ENDEXT
Text Label 4400 4450 2    50   ~ 0
~PE
Text Label 4400 4250 2    50   ~ 0
CET
Text Label 4400 4350 2    50   ~ 0
CEP
Wire Wire Line
	2100 3850 3250 3850
Wire Wire Line
	2100 3950 3250 3950
Wire Wire Line
	2100 4050 3250 4050
Wire Wire Line
	2100 4550 3250 4550
$Comp
L alexios:16V8 U1901
U 2 1 6250072D
P 3650 5950
AR Path="/6250072D" Ref="U1901"  Part="2" 
AR Path="/5DEAC282/5F643CAF/6250072D" Ref="U1901"  Part="2" 
F 0 "U1901" H 3830 5996 50  0000 L CNN
F 1 "16V8" H 3830 5905 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 3650 5950 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 3650 5950 50  0001 C CNN
F 4 "uPCGTE00" V 3650 5950 50  0001 C CNB "Signature"
F 5 "upc-gate.jed" H 3830 5859 50  0001 L CNN "Image Filename"
	2    3650 5950
	1    0    0    -1  
$EndComp
Connection ~ 3300 6050
Connection ~ 3300 5850
Wire Wire Line
	7650 4800 6650 4800
Text Label 6750 4800 0    50   ~ 0
CLK4
Wire Wire Line
	7650 5000 6650 5000
Wire Wire Line
	7650 4700 6750 4700
Wire Wire Line
	7650 4500 6750 4500
Wire Wire Line
	7650 4600 6750 4600
Text Label 6750 4500 0    50   ~ 0
~PE
Text Label 6750 4600 0    50   ~ 0
CEP
Text Label 6750 4700 0    50   ~ 0
CET
$Comp
L power:GND #PWR0152
U 1 1 625430D7
P 3250 4750
F 0 "#PWR0152" H 3250 4500 50  0001 C CNN
F 1 "GND" H 3255 4577 50  0000 C CNN
F 2 "" H 3250 4750 50  0001 C CNN
F 3 "" H 3250 4750 50  0001 C CNN
	1    3250 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 5200 4200 4550
Wire Wire Line
	4200 4550 4150 4550
Wire Wire Line
	2100 5200 4200 5200
Text HLabel 2100 3950 0    50   Input ~ 0
~RESET
Text HLabel 2100 3850 0    50   Input ~ 0
CLK3
NoConn ~ 4150 3850
NoConn ~ 4150 3950
NoConn ~ 4150 4050
NoConn ~ 4150 4150
NoConn ~ 3250 4150
NoConn ~ 3250 4250
NoConn ~ 3250 4350
NoConn ~ 3250 4450
Wire Wire Line
	2100 4650 3250 4650
Text HLabel 6650 5000 0    50   Input ~ 0
~RSTHOLD
Text HLabel 6650 4800 0    50   Input ~ 0
CLK4
$EndSCHEMATC
