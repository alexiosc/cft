EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 16 17
Title "Microprogram Counter"
Date ""
Rev "2023"
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
Text Label 3450 4700 2    50   ~ 0
~HALT
Text Label 3450 4800 2    50   ~ 0
CLK4
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
Text Label 3450 4600 2    50   ~ 0
~µPC-INH
Wire Wire Line
	3550 3650 1850 3650
Wire Wire Line
	3550 3750 1850 3750
Text Label 3450 3750 2    50   ~ 0
~END
Text Label 3450 3650 2    50   ~ 0
~ENDEXT
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
Wire Wire Line
	3500 3450 3550 3450
$Comp
L power:GND #PWR?
U 1 1 5F6F5967
P 3500 3450
AR Path="/5DEAC282/5F6F5967" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F5967" Ref="#PWR01904"  Part="1" 
F 0 "#PWR01904" H 3500 3200 50  0001 C CNN
F 1 "GND" V 3500 3300 50  0000 R CNN
F 2 "" H 3500 3450 50  0001 C CNN
F 3 "" H 3500 3450 50  0001 C CNN
	1    3500 3450
	0    1    1    0   
$EndComp
Text Notes 5350 3600 0    50   ~ 0
Use an HC family mux configured as a 4-variable\nfunction generator. The use of an HC IC, and\nfeeding CLK4 to the mux gate with a pull-up makes\nthe signal a little slower. Hopefully slow enough\nthat it satisfies the µPC counter's hold requirements\nfor its ~PE~ input.
Wire Wire Line
	1850 4050 2400 4050
Text HLabel 1850 4050 0    50   Input ~ 0
CLK4
Text HLabel -3500 3250 0    50   Input ~ 0
~ENDEXT
Text HLabel -3500 2650 0    50   Input ~ 0
~END
Text Label 3450 4050 2    50   ~ 0
CLK4
Wire Wire Line
	2500 4600 2500 3850
Connection ~ 2500 3850
Wire Wire Line
	2500 3850 3550 3850
Wire Wire Line
	2400 4800 2400 4050
Connection ~ 2400 4050
Wire Wire Line
	2400 4050 3550 4050
Text HLabel 1850 4700 0    50   Input ~ 0
~HALT
Text HLabel 1850 5000 0    50   Input ~ 0
~RSTHOLD
Text Label 3450 5000 2    50   ~ 0
~RSTHOLD
$Comp
L power:+5V #PWR?
U 1 1 5F7457BB
P 3550 5500
AR Path="/5DEAC282/5F7457BB" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F7457BB" Ref="#PWR01906"  Part="1" 
F 0 "#PWR01906" H 3550 5350 50  0001 C CNN
F 1 "+5V" H 3565 5673 50  0000 C CNN
F 2 "" H 3550 5500 50  0001 C CNN
F 3 "" H 3550 5500 50  0001 C CNN
	1    3550 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F7457C2
P 3550 5700
AR Path="/5DEAC282/5F7457C2" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F7457C2" Ref="#PWR01908"  Part="1" 
F 0 "#PWR01908" H 3550 5450 50  0001 C CNN
F 1 "GND" H 3555 5527 50  0000 C CNN
F 2 "" H 3550 5700 50  0001 C CNN
F 3 "" H 3550 5700 50  0001 C CNN
	1    3550 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F7457C8
P 3550 5600
AR Path="/5CC0D65F/5F7457C8" Ref="C?"  Part="1" 
AR Path="/5F7457C8" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F7457C8" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F7457C8" Ref="C1901"  Part="1" 
F 0 "C1901" H 3459 5646 50  0000 R CNN
F 1 "100nF" H 3459 5555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3550 5600 50  0001 C CNN
F 3 "~" H 3550 5600 50  0001 C CNN
	1    3550 5600
	1    0    0    -1  
$EndComp
Text Notes 850  1850 0    50   ~ 0
The µPC is the basis of the flow of the processor's microcode.\n\nIt counts up to 16, so microprograms can only have up to 16 steps. It resets\nto 0000 when the Control Unit asserts ~END~ or a processor extension card\nasserts ~ENDEXT~ on the bus, unless there's a wait state. In this case, it waits\nuntil the wait state has been cleared before resetting.\n\nIt increments at the end of a processor cycle (rising edge of CLK4), and only\nwhen ~RSTHOLD~, ~HALT~ and ~WS~ are all deasserted.
Text Notes 850  950  0    100  ~ 20
Microprogram Counter (µPC)
Text Notes 6600 2850 0    50   ~ 0
~µPCCLR~\n\n  1\n  1\n  0\n  0\n  1
Text HLabel -3500 3150 0    50   Input ~ 0
~WAITING
Text Label 3450 3850 2    50   ~ 0
~WAITING
Wire Wire Line
	2300 3850 2500 3850
Wire Wire Line
	1850 3850 2300 3850
Connection ~ 2300 3850
Wire Wire Line
	2300 3300 2300 3850
$Comp
L Device:R_Small R?
U 1 1 5F6F591C
P -2900 2100
AR Path="/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5D54E677/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F591C" Ref="R1902"  Part="1" 
F 0 "R1902" H -2841 2054 50  0000 L CNN
F 1 "4.7kΩ" H -2841 2145 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2900 2100 50  0001 C CNN
F 3 "~" H -2900 2100 50  0001 C CNN
	1    -2900 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	-2900 1950 -2900 2000
$Comp
L power:+5V #PWR?
U 1 1 5F6F5915
P -2900 1950
AR Path="/5DEAC282/5F6F5915" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F5915" Ref="#PWR01903"  Part="1" 
F 0 "#PWR01903" H -2900 1800 50  0001 C CNN
F 1 "+5V" H -2885 2123 50  0000 C CNN
F 2 "" H -2900 1950 50  0001 C CNN
F 3 "" H -2900 1950 50  0001 C CNN
	1    -2900 1950
	1    0    0    -1  
$EndComp
$Comp
L alexios:16V8 U1901
U 1 1 62250F79
P -1900 2900
F 0 "U1901" H -1900 3650 50  0000 C CNN
F 1 "16V8" H -1900 3550 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -1900 2900 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -1900 2900 50  0001 C CNN
F 4 "uPCGTE00" V -1900 2900 50  0000 C CNB "Signature"
F 5 "upc-gate.jed" H -1900 2250 50  0000 C CNN "Image Filename"
	1    -1900 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1200 3050 -1450 3050
Wire Wire Line
	-1200 2950 -1450 2950
Wire Wire Line
	-1200 2850 -1450 2850
Text Label -2700 2450 0    50   ~ 0
CLK3
Text Label -2700 2550 0    50   ~ 0
~RESET
Text Label -2700 3800 0    50   ~ 0
~HALT
Text Label -2700 3150 0    50   ~ 0
~WAITING
Text Label -2700 2850 0    50   ~ 0
~INH
Text Label -2700 2650 0    50   ~ 0
~END
Text Label -2700 3250 0    50   ~ 0
~ENDEXT
Text Label -1200 3050 2    50   ~ 0
~PE
Text Label -1200 2850 2    50   ~ 0
CET
Text Label -1200 2950 2    50   ~ 0
CEP
Wire Wire Line
	-3500 2450 -2350 2450
Wire Wire Line
	-3500 2550 -2350 2550
Wire Wire Line
	-3500 2650 -2350 2650
Wire Wire Line
	-3500 3150 -2350 3150
Wire Wire Line
	-3500 3250 -2800 3250
Connection ~ -2800 3250
Wire Wire Line
	-2800 3250 -2350 3250
Wire Wire Line
	-2900 2850 -2900 2200
Wire Wire Line
	-2900 2850 -2350 2850
$Comp
L alexios:16V8 U1901
U 2 1 6250072D
P 3900 5600
F 0 "U1901" H 4080 5646 50  0000 L CNN
F 1 "16V8" H 4080 5555 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 3900 5600 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 3900 5600 50  0001 C CNN
F 4 "uPCGTE00" V 3900 5600 50  0001 C CNB "Signature"
F 5 "upc-gate.jed" H 4080 5509 50  0001 L CNN "Image Filename"
	2    3900 5600
	1    0    0    -1  
$EndComp
Connection ~ 3550 5700
Connection ~ 3550 5500
Wire Wire Line
	7650 4800 6750 4800
Text Label 6750 4800 0    50   ~ 0
CLK4
Wire Wire Line
	7650 5000 6750 5000
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
Wire Wire Line
	-2800 2200 -2800 3250
$Comp
L power:GND #PWR0152
U 1 1 625430D7
P -2350 3350
F 0 "#PWR0152" H -2350 3100 50  0001 C CNN
F 1 "GND" H -2345 3177 50  0000 C CNN
F 2 "" H -2350 3350 50  0001 C CNN
F 3 "" H -2350 3350 50  0001 C CNN
	1    -2350 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1400 3800 -1400 3150
Wire Wire Line
	-1400 3150 -1450 3150
Wire Wire Line
	-3500 3800 -1400 3800
Text HLabel -3500 2550 0    50   Input ~ 0
~RESET
Text HLabel -3500 2450 0    50   Input ~ 0
CLK3
$Comp
L Device:R_Small R?
U 1 1 62556572
P -2800 2100
AR Path="/62556572" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/62556572" Ref="R?"  Part="1" 
AR Path="/5D54E677/62556572" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/62556572" Ref="R?"  Part="1" 
AR Path="/5DEAC282/62556572" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/62556572" Ref="R?"  Part="1" 
AR Path="/5D46B22D/62556572" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/62556572" Ref="R1901"  Part="1" 
F 0 "R1901" H -2850 1950 50  0000 R CNN
F 1 "4.7kΩ" H -2850 2050 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2800 2100 50  0001 C CNN
F 3 "~" H -2800 2100 50  0001 C CNN
	1    -2800 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	-2800 1950 -2800 2000
$Comp
L power:+5V #PWR?
U 1 1 62556579
P -2800 1950
AR Path="/5DEAC282/62556579" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/62556579" Ref="#PWR0153"  Part="1" 
F 0 "#PWR0153" H -2800 1800 50  0001 C CNN
F 1 "+5V" H -2785 2123 50  0000 C CNN
F 2 "" H -2800 1950 50  0001 C CNN
F 3 "" H -2800 1950 50  0001 C CNN
	1    -2800 1950
	1    0    0    -1  
$EndComp
NoConn ~ -1450 2450
NoConn ~ -1450 2550
NoConn ~ -1450 2650
NoConn ~ -1450 2750
$EndSCHEMATC
