EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 12
Title "Microprogram Counter"
Date ""
Rev "2020"
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
AR Path="/5DEAC282/5F643CAF/5F65DB1F" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 7600 4100 50  0001 C CNN
F 1 "GND" H 7500 4400 50  0000 R CNN
F 2 "" H 7600 4350 50  0001 C CNN
F 3 "" H 7600 4350 50  0001 C CNN
	1    7600 4350
	1    0    0    -1  
$EndComp
Text Label 7600 5000 2    50   ~ 0
~RSTHOLD
Text Label 7450 4500 2    50   ~ 0
~µPCCLR'
Wire Wire Line
	1850 5000 7650 5000
Text Label 3450 4700 2    50   ~ 0
~HALT
Text Label 3450 4800 2    50   ~ 0
CLK4
NoConn ~ 8650 4500
Text Label 7450 4700 2    50   ~ 0
~HALT
Text Label 7450 4800 2    50   ~ 0
CLK4
$Comp
L alexios:74HC161 U?
U 1 1 5F65DB32
P 8150 4500
AR Path="/5F65DB32" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5F65DB32" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F65DB32" Ref="U44"  Part="1" 
F 0 "U44" H 8150 5267 50  0000 C CNN
F 1 "74AC161" H 8150 5176 50  0000 C CNN
F 2 "alexios:SOIC-16" H 8450 4750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC161.pdf" H 8450 4750 50  0001 C CNN
	1    8150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4500 5150 4500
Wire Wire Line
	2500 4600 7650 4600
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
AR Path="/5DEAC282/5F643CAF/5F6721B1" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 7800 5350 50  0001 C CNN
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
AR Path="/5DEAC282/5F643CAF/5F6721B8" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 7800 5450 50  0001 C CNN
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
AR Path="/5DEAC282/5F643CAF/5F6721BE" Ref="C35"  Part="1" 
F 0 "C35" H 7709 5646 50  0000 R CNN
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
AR Path="/5DEAC282/5F643CAF/5F6721C4" Ref="U44"  Part="2" 
F 0 "U44" H 8330 6446 50  0000 L CNN
F 1 "74AC161" H 8330 6355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 8450 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 8450 6250 50  0001 C CNN
	2    8150 6000
	1    0    0    -1  
$EndComp
Wire Notes Line
	2150 2800 2650 2800
Text Label 3450 3850 2    50   ~ 0
~µPC-INH
Text Notes 1750 2750 0    50   ~ 0
Remove if BUS board is present!
Wire Notes Line
	2150 3350 2150 2800
Wire Notes Line
	2650 3350 2150 3350
$Comp
L power:+5V #PWR?
U 1 1 5F6F5915
P 2300 3050
AR Path="/5DEAC282/5F6F5915" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F5915" Ref="#PWR0189"  Part="1" 
F 0 "#PWR0189" H 2300 2900 50  0001 C CNN
F 1 "+5V" H 2315 3223 50  0000 C CNN
F 2 "" H 2300 3050 50  0001 C CNN
F 3 "" H 2300 3050 50  0001 C CNN
	1    2300 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3050 2300 3100
$Comp
L Device:R_Small R?
U 1 1 5F6F591C
P 2300 3200
AR Path="/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5D54E677/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5F6F591C" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F591C" Ref="R55"  Part="1" 
F 0 "R55" H 2250 3050 50  0000 R CNN
F 1 "4.7kΩ" H 2250 3150 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 3200 50  0001 C CNN
F 3 "~" H 2300 3200 50  0001 C CNN
	1    2300 3200
	-1   0    0    1   
$EndComp
Wire Notes Line
	2650 2800 2650 3350
Wire Wire Line
	1850 3850 2300 3850
Wire Wire Line
	2300 3300 2300 3850
Text HLabel 1850 3850 0    50   Input ~ 0
~µPC-INH
$Comp
L alexios:74HC251 U?
U 1 1 5F6F5927
P 4050 3350
AR Path="/5DEAC282/5F6F5927" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F5927" Ref="U43"  Part="1" 
F 0 "U43" H 4050 4217 50  0000 C CNN
F 1 "74HC251" H 4050 4126 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4050 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 4050 3300 50  0001 C CNN
	1    4050 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F6F592D
P 4650 2450
AR Path="/5DEAC282/5F6F592D" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F592D" Ref="#PWR0190"  Part="1" 
F 0 "#PWR0190" H 4650 2300 50  0001 C CNN
F 1 "+5V" H 4665 2623 50  0000 C CNN
F 2 "" H 4650 2450 50  0001 C CNN
F 3 "" H 4650 2450 50  0001 C CNN
	1    4650 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2450 4650 2500
$Comp
L Device:R_Small R?
U 1 1 5F6F5934
P 4650 2600
AR Path="/5F6F5934" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F6F5934" Ref="R?"  Part="1" 
AR Path="/5D54E677/5F6F5934" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5F6F5934" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F6F5934" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5F6F5934" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5F6F5934" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F5934" Ref="R54"  Part="1" 
F 0 "R54" H 4600 2450 50  0000 R CNN
F 1 "4.7kΩ" H 4600 2550 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4650 2600 50  0001 C CNN
F 3 "~" H 4650 2600 50  0001 C CNN
	1    4650 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	4550 2750 4650 2750
Wire Wire Line
	4650 2700 4650 2750
Connection ~ 4650 2750
Text Label 5100 2750 2    50   ~ 0
~µPCCLR
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
Connection ~ 3450 3050
Wire Wire Line
	3450 3450 3550 3450
Wire Wire Line
	3450 3050 3450 3450
Wire Wire Line
	3450 2950 3450 3050
Connection ~ 3450 2950
Wire Wire Line
	3550 2950 3450 2950
Wire Wire Line
	3450 2850 3450 2950
Connection ~ 3450 2850
Wire Wire Line
	3550 2850 3450 2850
Wire Wire Line
	3450 2750 3450 2850
Connection ~ 3450 2750
Wire Wire Line
	3550 2750 3450 2750
Wire Wire Line
	3450 3050 3550 3050
Wire Wire Line
	3450 2700 3450 2750
$Comp
L power:+5V #PWR?
U 1 1 5F6F595F
P 3450 2700
AR Path="/5DEAC282/5F6F595F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F595F" Ref="#PWR0198"  Part="1" 
F 0 "#PWR0198" H 3450 2550 50  0001 C CNN
F 1 "+5V" H 3465 2873 50  0000 C CNN
F 2 "" H 3450 2700 50  0001 C CNN
F 3 "" H 3450 2700 50  0001 C CNN
	1    3450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3150 3350 3150
Wire Wire Line
	3350 3150 3350 3250
$Comp
L power:GND #PWR?
U 1 1 5F6F5967
P 3350 3400
AR Path="/5DEAC282/5F6F5967" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F6F5967" Ref="#PWR0199"  Part="1" 
F 0 "#PWR0199" H 3350 3150 50  0001 C CNN
F 1 "GND" H 3272 3363 50  0000 R CNN
F 2 "" H 3350 3400 50  0001 C CNN
F 3 "" H 3350 3400 50  0001 C CNN
	1    3350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3250 3350 3250
Connection ~ 3350 3250
Wire Wire Line
	3350 3250 3350 3350
Wire Wire Line
	3550 3350 3350 3350
Connection ~ 3350 3350
Wire Wire Line
	3350 3350 3350 3400
NoConn ~ 4550 2850
Text Notes 5350 3600 0    50   ~ 0
Use an HC family mux configured as a 4-variable\nfunction generator. The use of an HC IC, and\nfeeding CLK4 to the mux gate with a pull-up makes\nthe signal a little slower. Hopefully slow enough\nthat it satisfies the µPC counter's hold requirements\nfor its ~PE~ input.
Wire Wire Line
	1850 4050 2400 4050
Text HLabel 1850 4050 0    50   Input ~ 0
CLK4
Text HLabel 1850 3650 0    50   Input ~ 0
~ENDEXT
Text HLabel 1850 3750 0    50   Input ~ 0
~END
Text Label 3450 4050 2    50   ~ 0
CLK4
Wire Wire Line
	4650 2750 5150 2750
Wire Wire Line
	2500 4600 2500 3850
Connection ~ 2500 3850
Wire Wire Line
	2500 3850 3550 3850
Text Label 7450 4600 2    50   ~ 0
~WAITING
Wire Wire Line
	2400 4800 2400 4050
Wire Wire Line
	2400 4800 7650 4800
Connection ~ 2400 4050
Wire Wire Line
	2400 4050 3550 4050
Wire Wire Line
	1850 4700 7650 4700
Text HLabel 1850 4700 0    50   Input ~ 0
~HALT
Text HLabel 1850 5000 0    50   Input ~ 0
~RSTHOLD
Text Label 3450 5000 2    50   ~ 0
~RSTHOLD
Text Label 3450 4600 2    50   ~ 0
~WAITING
$Comp
L power:+5V #PWR?
U 1 1 5F7457BB
P 3550 5500
AR Path="/5DEAC282/5F7457BB" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F7457BB" Ref="#PWR0201"  Part="1" 
F 0 "#PWR0201" H 3550 5350 50  0001 C CNN
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
AR Path="/5DEAC282/5F643CAF/5F7457C2" Ref="#PWR0202"  Part="1" 
F 0 "#PWR0202" H 3550 5450 50  0001 C CNN
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
AR Path="/5DEAC282/5F643CAF/5F7457C8" Ref="C18"  Part="1" 
F 0 "C18" H 3459 5646 50  0000 R CNN
F 1 "100nF" H 3459 5555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3550 5600 50  0001 C CNN
F 3 "~" H 3550 5600 50  0001 C CNN
	1    3550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2750 5150 3850
$Comp
L Device:R_Small R?
U 1 1 5F74BE91
P 5150 3950
AR Path="/5F74BE91" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F74BE91" Ref="R?"  Part="1" 
AR Path="/5D54E677/5F74BE91" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5F74BE91" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F74BE91" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5F74BE91" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5F74BE91" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F74BE91" Ref="R56"  Part="1" 
F 0 "R56" H 5209 3996 50  0000 L CNN
F 1 "0Ω" H 5209 3905 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5150 3950 50  0001 C CNN
F 3 "~" H 5150 3950 50  0001 C CNN
	1    5150 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4050 5150 4500
Text Notes 5400 4000 0    50   ~ 0
Alter the slew rate to slow down\nthe signal a little more.
Connection ~ 2300 3850
Wire Wire Line
	2300 3850 2500 3850
Text Notes 850  1850 0    50   ~ 0
The µPC is the basis of the flow of the processor's microcode.\n\nIt counts up to 16, so microprograms can only have up to 16 steps. It resets\nto 0000 when the Control Unit asserts ~END~ or a processor extension card\nasserts ~ENDEXT~ on the bus, unless there's a wait state. In this case, it waits\nuntil the wait state has been cleared before resetting.\n\nIt increments at the end of a processor cycle (rising edge of CLK4), and only\nwhen ~RSTHOLD~, ~HALT~ and ~WS~ are all deasserted.
Text Notes 850  950  0    100  ~ 20
Microprogram Counter (µPC)
$Comp
L alexios:74HC251 U?
U 2 1 5F8A8372
P 3900 6100
AR Path="/5DEAC282/5F8A8372" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5F643CAF/5F8A8372" Ref="U43"  Part="2" 
F 0 "U43" H 4080 6646 50  0000 L CNN
F 1 "74HC251" H 4080 6555 50  0000 L CNN
F 2 "alexios:SOIC-16" H 3900 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS251" H 3900 6050 50  0001 C CNN
	2    3900 6100
	1    0    0    -1  
$EndComp
Connection ~ 3550 5500
Connection ~ 3550 5700
Text Notes 6600 2850 0    50   ~ 0
~µPCCLR~\n\n  1\n  1\n  0\n  0\n  1
$EndSCHEMATC
