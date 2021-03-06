EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 19
Title "16×512kbit SRAM Bank"
Date ""
Rev "1945"
Comp ""
Comment1 "MEM"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 7200 2750 2    50   ~ 0
DB15
Text Label 7200 2650 2    50   ~ 0
DB14
Text Label 7200 2550 2    50   ~ 0
DB13
Text Label 7200 2450 2    50   ~ 0
DB12
Text Label 7200 2350 2    50   ~ 0
DB11
Text Label 7200 2250 2    50   ~ 0
DB10
Text Label 7200 2150 2    50   ~ 0
DB9
Text Label 7200 2050 2    50   ~ 0
DB8
Wire Wire Line
	5100 2050 5250 2050
Wire Wire Line
	5100 2150 5250 2150
Wire Wire Line
	5100 2250 5250 2250
Wire Wire Line
	5100 2350 5250 2350
Wire Wire Line
	5100 2450 5250 2450
Wire Wire Line
	5100 2550 5250 2550
Wire Wire Line
	5100 2650 5250 2650
Wire Wire Line
	5100 2750 5250 2750
Text Label 5250 2050 2    50   ~ 0
DB0
Text Label 5250 2150 2    50   ~ 0
DB1
Text Label 5250 2250 2    50   ~ 0
DB2
Text Label 5250 2350 2    50   ~ 0
DB3
Text Label 5250 2450 2    50   ~ 0
DB4
Text Label 5250 2550 2    50   ~ 0
DB5
Text Label 5250 2650 2    50   ~ 0
DB6
Text Label 5250 2750 2    50   ~ 0
DB7
Wire Wire Line
	7000 2050 7200 2050
Wire Wire Line
	7000 2150 7200 2150
Wire Wire Line
	7000 2250 7200 2250
Wire Wire Line
	7000 2350 7200 2350
Wire Wire Line
	7000 2450 7200 2450
Wire Wire Line
	7000 2550 7200 2550
Wire Wire Line
	7000 2650 7200 2650
Wire Wire Line
	7000 2750 7200 2750
Wire Wire Line
	6000 2050 5800 2050
Wire Wire Line
	6000 2150 5800 2150
Wire Wire Line
	6000 2250 5800 2250
Wire Wire Line
	6000 2350 5800 2350
Wire Wire Line
	6000 2450 5800 2450
Wire Wire Line
	6000 2550 5800 2550
Wire Wire Line
	6000 2650 5800 2650
Wire Wire Line
	6000 2750 5800 2750
Wire Wire Line
	6000 2850 5800 2850
Wire Wire Line
	6000 2950 5800 2950
Wire Wire Line
	6000 3050 5800 3050
Wire Wire Line
	6000 3150 5800 3150
Wire Wire Line
	6000 3250 5800 3250
Wire Wire Line
	6000 3350 5800 3350
Wire Wire Line
	6000 3450 5800 3450
Wire Wire Line
	6000 3550 5800 3550
Wire Wire Line
	6000 3650 5800 3650
Wire Wire Line
	6000 3750 5800 3750
Wire Wire Line
	6000 3850 5800 3850
Wire Wire Line
	6000 4050 5800 4050
Wire Wire Line
	6000 4150 5800 4150
Wire Wire Line
	6000 4250 5800 4250
Text Label 5800 2050 0    50   ~ 0
AB0
Text Label 5800 2150 0    50   ~ 0
AB1
Text Label 5800 2250 0    50   ~ 0
AB2
Text Label 5800 2350 0    50   ~ 0
AB3
Text Label 5800 2450 0    50   ~ 0
AB4
Text Label 5800 2550 0    50   ~ 0
AB5
Text Label 5800 2650 0    50   ~ 0
AB6
Text Label 5800 2750 0    50   ~ 0
AB7
Text Label 5800 2850 0    50   ~ 0
AB8
Text Label 5800 2950 0    50   ~ 0
AB9
Text Label 5800 3050 0    50   ~ 0
AB10
Text Label 5800 3150 0    50   ~ 0
AB11
Text Label 5800 3250 0    50   ~ 0
AB12
Text Label 5800 3350 0    50   ~ 0
AB13
Text Label 5800 3450 0    50   ~ 0
AB14
Text Label 5800 3550 0    50   ~ 0
AB15
Text Label 5800 3650 0    50   ~ 0
AB16
Text Label 5800 3750 0    50   ~ 0
AB17
Text Label 5800 3850 0    50   ~ 0
AB18
Text Label 5800 4150 0    50   ~ 0
~R
Text Label 5800 4250 0    50   ~ 0
~W
Text Label 5800 4050 0    50   ~ 0
~CE
$Comp
L power:+5V #PWR010
U 1 1 5EADE4AF
P 4150 5350
AR Path="/5E94D03A/5EADE4AF" Ref="#PWR010"  Part="1" 
AR Path="/5EC68F14/5EADE4AF" Ref="#PWR018"  Part="1" 
AR Path="/5EC75B87/5EADE4AF" Ref="#PWR026"  Part="1" 
AR Path="/5EC75B97/5EADE4AF" Ref="#PWR034"  Part="1" 
AR Path="/5EC8475C/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/5EADE4AF" Ref="#PWR042"  Part="1" 
AR Path="/5ECCD519/5EADE4AF" Ref="#PWR050"  Part="1" 
AR Path="/5ECCD529/5EADE4AF" Ref="#PWR058"  Part="1" 
AR Path="/5ECCD539/5EADE4AF" Ref="#PWR066"  Part="1" 
AR Path="/5ECDEC4E/5EADE4AF" Ref="#PWR074"  Part="1" 
AR Path="/5ECDEC5E/5EADE4AF" Ref="#PWR082"  Part="1" 
AR Path="/5ECDEC6E/5EADE4AF" Ref="#PWR090"  Part="1" 
AR Path="/5ECDEC7E/5EADE4AF" Ref="#PWR098"  Part="1" 
AR Path="/60F438E4/5E94D03A/5EADE4AF" Ref="#PWR0160"  Part="1" 
AR Path="/60F438E4/5EC68F14/5EADE4AF" Ref="#PWR0168"  Part="1" 
AR Path="/60F438E4/5EC75B87/5EADE4AF" Ref="#PWR0176"  Part="1" 
AR Path="/60F438E4/5EC75B97/5EADE4AF" Ref="#PWR0186"  Part="1" 
AR Path="/60F438E4/5ECCD509/5EADE4AF" Ref="#PWR0194"  Part="1" 
AR Path="/60F438E4/5ECCD519/5EADE4AF" Ref="#PWR0202"  Part="1" 
AR Path="/60F438E4/5ECCD529/5EADE4AF" Ref="#PWR0210"  Part="1" 
AR Path="/60F438E4/5ECCD539/5EADE4AF" Ref="#PWR0218"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/5EADE4AF" Ref="#PWR0226"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/5EADE4AF" Ref="#PWR0234"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/5EADE4AF" Ref="#PWR0242"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/5EADE4AF" Ref="#PWR0250"  Part="1" 
AR Path="/60F438E4/651F3F42/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/5EADE4AF" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/5EADE4AF" Ref="#PWR0148"  Part="1" 
AR Path="/65B2AF51/5EADE4AF" Ref="#PWR0152"  Part="1" 
AR Path="/65B2AF5D/5EADE4AF" Ref="#PWR0156"  Part="1" 
AR Path="/65B2AF69/5EADE4AF" Ref="#PWR0160"  Part="1" 
AR Path="/65B2AF75/5EADE4AF" Ref="#PWR0164"  Part="1" 
AR Path="/65B2AF81/5EADE4AF" Ref="#PWR0168"  Part="1" 
AR Path="/65B2AF8D/5EADE4AF" Ref="#PWR0172"  Part="1" 
AR Path="/65B2AF99/5EADE4AF" Ref="#PWR0176"  Part="1" 
AR Path="/65B2AFA5/5EADE4AF" Ref="#PWR0182"  Part="1" 
AR Path="/65B2AFB1/5EADE4AF" Ref="#PWR0186"  Part="1" 
AR Path="/65B2AFBD/5EADE4AF" Ref="#PWR0190"  Part="1" 
AR Path="/65B2AFC9/5EADE4AF" Ref="#PWR0194"  Part="1" 
AR Path="/65B2B182/5EADE4AF" Ref="#PWR0198"  Part="1" 
AR Path="/65B2B18E/5EADE4AF" Ref="#PWR0202"  Part="1" 
AR Path="/65B2B19A/5EADE4AF" Ref="#PWR0206"  Part="1" 
AR Path="/65B2B1A6/5EADE4AF" Ref="#PWR0210"  Part="1" 
AR Path="/65B2B1C6/5EADE4AF" Ref="#PWR0214"  Part="1" 
AR Path="/65B2B1D2/5EADE4AF" Ref="#PWR0218"  Part="1" 
AR Path="/65B2B1DE/5EADE4AF" Ref="#PWR0222"  Part="1" 
AR Path="/65B2B1EA/5EADE4AF" Ref="#PWR0226"  Part="1" 
F 0 "#PWR0152" H 4150 5200 50  0001 C CNN
F 1 "+5V" H 4165 5523 50  0000 C CNN
F 2 "" H 4150 5350 50  0001 C CNN
F 3 "" H 4150 5350 50  0001 C CNN
	1    4150 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5EADE7CB
P 6050 5350
AR Path="/5E94D03A/5EADE7CB" Ref="#PWR014"  Part="1" 
AR Path="/5EC68F14/5EADE7CB" Ref="#PWR022"  Part="1" 
AR Path="/5EC75B87/5EADE7CB" Ref="#PWR030"  Part="1" 
AR Path="/5EC75B97/5EADE7CB" Ref="#PWR038"  Part="1" 
AR Path="/5EC8475C/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/5EADE7CB" Ref="#PWR046"  Part="1" 
AR Path="/5ECCD519/5EADE7CB" Ref="#PWR054"  Part="1" 
AR Path="/5ECCD529/5EADE7CB" Ref="#PWR062"  Part="1" 
AR Path="/5ECCD539/5EADE7CB" Ref="#PWR070"  Part="1" 
AR Path="/5ECDEC4E/5EADE7CB" Ref="#PWR078"  Part="1" 
AR Path="/5ECDEC5E/5EADE7CB" Ref="#PWR086"  Part="1" 
AR Path="/5ECDEC6E/5EADE7CB" Ref="#PWR094"  Part="1" 
AR Path="/5ECDEC7E/5EADE7CB" Ref="#PWR0102"  Part="1" 
AR Path="/60F438E4/5E94D03A/5EADE7CB" Ref="#PWR0162"  Part="1" 
AR Path="/60F438E4/5EC68F14/5EADE7CB" Ref="#PWR0170"  Part="1" 
AR Path="/60F438E4/5EC75B87/5EADE7CB" Ref="#PWR0180"  Part="1" 
AR Path="/60F438E4/5EC75B97/5EADE7CB" Ref="#PWR0188"  Part="1" 
AR Path="/60F438E4/5ECCD509/5EADE7CB" Ref="#PWR0196"  Part="1" 
AR Path="/60F438E4/5ECCD519/5EADE7CB" Ref="#PWR0204"  Part="1" 
AR Path="/60F438E4/5ECCD529/5EADE7CB" Ref="#PWR0212"  Part="1" 
AR Path="/60F438E4/5ECCD539/5EADE7CB" Ref="#PWR0220"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/5EADE7CB" Ref="#PWR0228"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/5EADE7CB" Ref="#PWR0236"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/5EADE7CB" Ref="#PWR0244"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/5EADE7CB" Ref="#PWR0252"  Part="1" 
AR Path="/60F438E4/651F3F42/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/5EADE7CB" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/5EADE7CB" Ref="#PWR0149"  Part="1" 
AR Path="/65B2AF51/5EADE7CB" Ref="#PWR0153"  Part="1" 
AR Path="/65B2AF5D/5EADE7CB" Ref="#PWR0157"  Part="1" 
AR Path="/65B2AF69/5EADE7CB" Ref="#PWR0161"  Part="1" 
AR Path="/65B2AF75/5EADE7CB" Ref="#PWR0165"  Part="1" 
AR Path="/65B2AF81/5EADE7CB" Ref="#PWR0169"  Part="1" 
AR Path="/65B2AF8D/5EADE7CB" Ref="#PWR0173"  Part="1" 
AR Path="/65B2AF99/5EADE7CB" Ref="#PWR0179"  Part="1" 
AR Path="/65B2AFA5/5EADE7CB" Ref="#PWR0183"  Part="1" 
AR Path="/65B2AFB1/5EADE7CB" Ref="#PWR0187"  Part="1" 
AR Path="/65B2AFBD/5EADE7CB" Ref="#PWR0191"  Part="1" 
AR Path="/65B2AFC9/5EADE7CB" Ref="#PWR0195"  Part="1" 
AR Path="/65B2B182/5EADE7CB" Ref="#PWR0199"  Part="1" 
AR Path="/65B2B18E/5EADE7CB" Ref="#PWR0203"  Part="1" 
AR Path="/65B2B19A/5EADE7CB" Ref="#PWR0207"  Part="1" 
AR Path="/65B2B1A6/5EADE7CB" Ref="#PWR0211"  Part="1" 
AR Path="/65B2B1C6/5EADE7CB" Ref="#PWR0215"  Part="1" 
AR Path="/65B2B1D2/5EADE7CB" Ref="#PWR0219"  Part="1" 
AR Path="/65B2B1DE/5EADE7CB" Ref="#PWR0223"  Part="1" 
AR Path="/65B2B1EA/5EADE7CB" Ref="#PWR0227"  Part="1" 
F 0 "#PWR0153" H 6050 5200 50  0001 C CNN
F 1 "+5V" H 6065 5523 50  0000 C CNN
F 2 "" H 6050 5350 50  0001 C CNN
F 3 "" H 6050 5350 50  0001 C CNN
	1    6050 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5EADF1C4
P 6050 5550
AR Path="/5E94D03A/5EADF1C4" Ref="#PWR015"  Part="1" 
AR Path="/5EC68F14/5EADF1C4" Ref="#PWR023"  Part="1" 
AR Path="/5EC75B87/5EADF1C4" Ref="#PWR031"  Part="1" 
AR Path="/5EC75B97/5EADF1C4" Ref="#PWR039"  Part="1" 
AR Path="/5EC8475C/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/5EADF1C4" Ref="#PWR047"  Part="1" 
AR Path="/5ECCD519/5EADF1C4" Ref="#PWR055"  Part="1" 
AR Path="/5ECCD529/5EADF1C4" Ref="#PWR063"  Part="1" 
AR Path="/5ECCD539/5EADF1C4" Ref="#PWR071"  Part="1" 
AR Path="/5ECDEC4E/5EADF1C4" Ref="#PWR079"  Part="1" 
AR Path="/5ECDEC5E/5EADF1C4" Ref="#PWR087"  Part="1" 
AR Path="/5ECDEC6E/5EADF1C4" Ref="#PWR095"  Part="1" 
AR Path="/5ECDEC7E/5EADF1C4" Ref="#PWR0103"  Part="1" 
AR Path="/60F438E4/5E94D03A/5EADF1C4" Ref="#PWR0165"  Part="1" 
AR Path="/60F438E4/5EC68F14/5EADF1C4" Ref="#PWR0173"  Part="1" 
AR Path="/60F438E4/5EC75B87/5EADF1C4" Ref="#PWR0183"  Part="1" 
AR Path="/60F438E4/5EC75B97/5EADF1C4" Ref="#PWR0191"  Part="1" 
AR Path="/60F438E4/5ECCD509/5EADF1C4" Ref="#PWR0199"  Part="1" 
AR Path="/60F438E4/5ECCD519/5EADF1C4" Ref="#PWR0207"  Part="1" 
AR Path="/60F438E4/5ECCD529/5EADF1C4" Ref="#PWR0215"  Part="1" 
AR Path="/60F438E4/5ECCD539/5EADF1C4" Ref="#PWR0223"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/5EADF1C4" Ref="#PWR0231"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/5EADF1C4" Ref="#PWR0239"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/5EADF1C4" Ref="#PWR0247"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/5EADF1C4" Ref="#PWR0255"  Part="1" 
AR Path="/60F438E4/651F3F42/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/5EADF1C4" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/5EADF1C4" Ref="#PWR0150"  Part="1" 
AR Path="/65B2AF51/5EADF1C4" Ref="#PWR0154"  Part="1" 
AR Path="/65B2AF5D/5EADF1C4" Ref="#PWR0158"  Part="1" 
AR Path="/65B2AF69/5EADF1C4" Ref="#PWR0162"  Part="1" 
AR Path="/65B2AF75/5EADF1C4" Ref="#PWR0166"  Part="1" 
AR Path="/65B2AF81/5EADF1C4" Ref="#PWR0170"  Part="1" 
AR Path="/65B2AF8D/5EADF1C4" Ref="#PWR0174"  Part="1" 
AR Path="/65B2AF99/5EADF1C4" Ref="#PWR0180"  Part="1" 
AR Path="/65B2AFA5/5EADF1C4" Ref="#PWR0184"  Part="1" 
AR Path="/65B2AFB1/5EADF1C4" Ref="#PWR0188"  Part="1" 
AR Path="/65B2AFBD/5EADF1C4" Ref="#PWR0192"  Part="1" 
AR Path="/65B2AFC9/5EADF1C4" Ref="#PWR0196"  Part="1" 
AR Path="/65B2B182/5EADF1C4" Ref="#PWR0200"  Part="1" 
AR Path="/65B2B18E/5EADF1C4" Ref="#PWR0204"  Part="1" 
AR Path="/65B2B19A/5EADF1C4" Ref="#PWR0208"  Part="1" 
AR Path="/65B2B1A6/5EADF1C4" Ref="#PWR0212"  Part="1" 
AR Path="/65B2B1C6/5EADF1C4" Ref="#PWR0216"  Part="1" 
AR Path="/65B2B1D2/5EADF1C4" Ref="#PWR0220"  Part="1" 
AR Path="/65B2B1DE/5EADF1C4" Ref="#PWR0224"  Part="1" 
AR Path="/65B2B1EA/5EADF1C4" Ref="#PWR0228"  Part="1" 
F 0 "#PWR0154" H 6050 5300 50  0001 C CNN
F 1 "GND" H 6055 5377 50  0000 C CNN
F 2 "" H 6050 5550 50  0001 C CNN
F 3 "" H 6050 5550 50  0001 C CNN
	1    6050 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5EADF5B8
P 4150 5550
AR Path="/5E94D03A/5EADF5B8" Ref="#PWR011"  Part="1" 
AR Path="/5EC68F14/5EADF5B8" Ref="#PWR019"  Part="1" 
AR Path="/5EC75B87/5EADF5B8" Ref="#PWR027"  Part="1" 
AR Path="/5EC75B97/5EADF5B8" Ref="#PWR035"  Part="1" 
AR Path="/5EC8475C/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/5EC8476C/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/5EC8477C/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/5EC8478C/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/5ECB980E/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/5ECB981E/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/5ECCD509/5EADF5B8" Ref="#PWR043"  Part="1" 
AR Path="/5ECCD519/5EADF5B8" Ref="#PWR051"  Part="1" 
AR Path="/5ECCD529/5EADF5B8" Ref="#PWR059"  Part="1" 
AR Path="/5ECCD539/5EADF5B8" Ref="#PWR067"  Part="1" 
AR Path="/5ECDEC4E/5EADF5B8" Ref="#PWR075"  Part="1" 
AR Path="/5ECDEC5E/5EADF5B8" Ref="#PWR083"  Part="1" 
AR Path="/5ECDEC6E/5EADF5B8" Ref="#PWR091"  Part="1" 
AR Path="/5ECDEC7E/5EADF5B8" Ref="#PWR099"  Part="1" 
AR Path="/60F438E4/5E94D03A/5EADF5B8" Ref="#PWR0166"  Part="1" 
AR Path="/60F438E4/5EC68F14/5EADF5B8" Ref="#PWR0174"  Part="1" 
AR Path="/60F438E4/5EC75B87/5EADF5B8" Ref="#PWR0184"  Part="1" 
AR Path="/60F438E4/5EC75B97/5EADF5B8" Ref="#PWR0192"  Part="1" 
AR Path="/60F438E4/5ECCD509/5EADF5B8" Ref="#PWR0200"  Part="1" 
AR Path="/60F438E4/5ECCD519/5EADF5B8" Ref="#PWR0208"  Part="1" 
AR Path="/60F438E4/5ECCD529/5EADF5B8" Ref="#PWR0216"  Part="1" 
AR Path="/60F438E4/5ECCD539/5EADF5B8" Ref="#PWR0224"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/5EADF5B8" Ref="#PWR0232"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/5EADF5B8" Ref="#PWR0240"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/5EADF5B8" Ref="#PWR0248"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/5EADF5B8" Ref="#PWR0256"  Part="1" 
AR Path="/60F438E4/651F3F42/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F4E/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F5A/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/651F3F66/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A51/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A5D/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A69/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/60F438E4/65440A75/5EADF5B8" Ref="#PWR?"  Part="1" 
AR Path="/65B2AF42/5EADF5B8" Ref="#PWR0151"  Part="1" 
AR Path="/65B2AF51/5EADF5B8" Ref="#PWR0155"  Part="1" 
AR Path="/65B2AF5D/5EADF5B8" Ref="#PWR0159"  Part="1" 
AR Path="/65B2AF69/5EADF5B8" Ref="#PWR0163"  Part="1" 
AR Path="/65B2AF75/5EADF5B8" Ref="#PWR0167"  Part="1" 
AR Path="/65B2AF81/5EADF5B8" Ref="#PWR0171"  Part="1" 
AR Path="/65B2AF8D/5EADF5B8" Ref="#PWR0175"  Part="1" 
AR Path="/65B2AF99/5EADF5B8" Ref="#PWR0181"  Part="1" 
AR Path="/65B2AFA5/5EADF5B8" Ref="#PWR0185"  Part="1" 
AR Path="/65B2AFB1/5EADF5B8" Ref="#PWR0189"  Part="1" 
AR Path="/65B2AFBD/5EADF5B8" Ref="#PWR0193"  Part="1" 
AR Path="/65B2AFC9/5EADF5B8" Ref="#PWR0197"  Part="1" 
AR Path="/65B2B182/5EADF5B8" Ref="#PWR0201"  Part="1" 
AR Path="/65B2B18E/5EADF5B8" Ref="#PWR0205"  Part="1" 
AR Path="/65B2B19A/5EADF5B8" Ref="#PWR0209"  Part="1" 
AR Path="/65B2B1A6/5EADF5B8" Ref="#PWR0213"  Part="1" 
AR Path="/65B2B1C6/5EADF5B8" Ref="#PWR0217"  Part="1" 
AR Path="/65B2B1D2/5EADF5B8" Ref="#PWR0221"  Part="1" 
AR Path="/65B2B1DE/5EADF5B8" Ref="#PWR0225"  Part="1" 
AR Path="/65B2B1EA/5EADF5B8" Ref="#PWR0229"  Part="1" 
F 0 "#PWR0155" H 4150 5300 50  0001 C CNN
F 1 "GND" H 4155 5377 50  0000 C CNN
F 2 "" H 4150 5550 50  0001 C CNN
F 3 "" H 4150 5550 50  0001 C CNN
	1    4150 5550
	1    0    0    -1  
$EndComp
Entry Wire Line
	5700 1950 5800 2050
Entry Wire Line
	5700 2050 5800 2150
Entry Wire Line
	5700 2150 5800 2250
Entry Wire Line
	5700 2250 5800 2350
Entry Wire Line
	5700 2350 5800 2450
Entry Wire Line
	5700 2450 5800 2550
Entry Wire Line
	5700 2550 5800 2650
Entry Wire Line
	5700 2650 5800 2750
Entry Wire Line
	5700 2750 5800 2850
Entry Wire Line
	5700 2850 5800 2950
Entry Wire Line
	5700 2950 5800 3050
Entry Wire Line
	5700 3050 5800 3150
Entry Wire Line
	5700 3150 5800 3250
Entry Wire Line
	5700 3250 5800 3350
Entry Wire Line
	5700 3350 5800 3450
Entry Wire Line
	5700 3450 5800 3550
Entry Wire Line
	5700 3550 5800 3650
Entry Wire Line
	5700 3650 5800 3750
Entry Wire Line
	5700 3750 5800 3850
Entry Wire Line
	5250 2050 5350 2150
Entry Wire Line
	5250 2150 5350 2250
Entry Wire Line
	5250 2250 5350 2350
Entry Wire Line
	5250 2350 5350 2450
Entry Wire Line
	5250 2450 5350 2550
Entry Wire Line
	5250 2550 5350 2650
Entry Wire Line
	5250 2650 5350 2750
Entry Wire Line
	5250 2750 5350 2850
Entry Wire Line
	7200 2050 7300 2150
Entry Wire Line
	7200 2150 7300 2250
Entry Wire Line
	7200 2250 7300 2350
Entry Wire Line
	7200 2350 7300 2450
Entry Wire Line
	7200 2450 7300 2550
Entry Wire Line
	7200 2550 7300 2650
Entry Wire Line
	7200 2650 7300 2750
Entry Wire Line
	7200 2750 7300 2850
Entry Bus Bus
	5350 4500 5450 4600
Wire Bus Line
	5450 4600 7200 4600
Entry Bus Bus
	7200 4600 7300 4500
Entry Bus Bus
	5600 1600 5700 1700
Entry Bus Bus
	5250 4600 5350 4500
Text Label 3150 4600 0    50   ~ 0
DB[0..15]
Text HLabel 3100 4600 0    50   3State ~ 0
~DB[0..15]
Text HLabel 3100 4250 0    50   Input ~ 0
~W
Text HLabel 3100 4150 0    50   Input ~ 0
~R
Text HLabel 3100 4050 0    50   Input ~ 0
~CE
Wire Bus Line
	3100 4600 5250 4600
Text Label 3150 1600 0    50   ~ 0
AB[0..18]
Text HLabel 3100 1600 0    50   Input ~ 0
AB[0..18]
Text Label 3150 4250 0    50   ~ 0
~W
Text Label 3150 4150 0    50   ~ 0
~R
Text Label 3150 4050 0    50   ~ 0
~CE
Wire Wire Line
	3100 4250 4100 4250
Wire Wire Line
	3100 4150 4100 4150
Wire Wire Line
	3100 4050 4100 4050
Wire Bus Line
	3700 1600 3100 1600
Entry Bus Bus
	3800 1700 3700 1600
Entry Bus Bus
	3800 1700 3900 1600
Wire Bus Line
	5600 1600 3900 1600
Entry Wire Line
	3800 3750 3900 3850
Entry Wire Line
	3800 3650 3900 3750
Entry Wire Line
	3800 3550 3900 3650
Entry Wire Line
	3800 3450 3900 3550
Entry Wire Line
	3800 3350 3900 3450
Entry Wire Line
	3800 3250 3900 3350
Entry Wire Line
	3800 3150 3900 3250
Entry Wire Line
	3800 3050 3900 3150
Entry Wire Line
	3800 2950 3900 3050
Entry Wire Line
	3800 2850 3900 2950
Entry Wire Line
	3800 2750 3900 2850
Entry Wire Line
	3800 2650 3900 2750
Entry Wire Line
	3800 2550 3900 2650
Entry Wire Line
	3800 2450 3900 2550
Entry Wire Line
	3800 2350 3900 2450
Entry Wire Line
	3800 2250 3900 2350
Entry Wire Line
	3800 2150 3900 2250
Entry Wire Line
	3800 2050 3900 2150
Entry Wire Line
	3800 1950 3900 2050
Text Label 3900 4050 0    50   ~ 0
~CE
Text Label 3900 4250 0    50   ~ 0
~W
Text Label 3900 4150 0    50   ~ 0
~R
Text Label 3900 3850 0    50   ~ 0
AB18
Text Label 3900 3750 0    50   ~ 0
AB17
Text Label 3900 3650 0    50   ~ 0
AB16
Text Label 3900 3550 0    50   ~ 0
AB15
Text Label 3900 3450 0    50   ~ 0
AB14
Text Label 3900 3350 0    50   ~ 0
AB13
Text Label 3900 3250 0    50   ~ 0
AB12
Text Label 3900 3150 0    50   ~ 0
AB11
Text Label 3900 3050 0    50   ~ 0
AB10
Text Label 3900 2950 0    50   ~ 0
AB9
Text Label 3900 2850 0    50   ~ 0
AB8
Text Label 3900 2750 0    50   ~ 0
AB7
Text Label 3900 2650 0    50   ~ 0
AB6
Text Label 3900 2550 0    50   ~ 0
AB5
Text Label 3900 2450 0    50   ~ 0
AB4
Text Label 3900 2350 0    50   ~ 0
AB3
Text Label 3900 2250 0    50   ~ 0
AB2
Text Label 3900 2150 0    50   ~ 0
AB1
Text Label 3900 2050 0    50   ~ 0
AB0
Wire Wire Line
	4100 3850 3900 3850
Wire Wire Line
	4100 3750 3900 3750
Wire Wire Line
	4100 3650 3900 3650
Wire Wire Line
	4100 3550 3900 3550
Wire Wire Line
	4100 3450 3900 3450
Wire Wire Line
	4100 3350 3900 3350
Wire Wire Line
	4100 3250 3900 3250
Wire Wire Line
	4100 3150 3900 3150
Wire Wire Line
	4100 3050 3900 3050
Wire Wire Line
	4100 2950 3900 2950
Wire Wire Line
	4100 2850 3900 2850
Wire Wire Line
	4100 2750 3900 2750
Wire Wire Line
	4100 2650 3900 2650
Wire Wire Line
	4100 2550 3900 2550
Wire Wire Line
	4100 2450 3900 2450
Wire Wire Line
	4100 2350 3900 2350
Wire Wire Line
	4100 2250 3900 2250
Wire Wire Line
	4100 2150 3900 2150
Wire Wire Line
	4100 2050 3900 2050
Connection ~ 4150 5550
Connection ~ 4150 5350
Connection ~ 6050 5550
Connection ~ 6050 5350
$Comp
L alexios:AS6C4008-55PCN U?
U 1 1 64F3F75C
P 6500 3150
AR Path="/60F438E4/5E94D03A/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD529/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5EC68F14/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5EC75B87/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5EC75B97/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD509/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD519/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD539/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F42/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F4E/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F5A/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F66/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A51/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A5D/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A69/64F3F75C" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A75/64F3F75C" Ref="U?"  Part="1" 
AR Path="/65B2AF42/64F3F75C" Ref="U302"  Part="1" 
AR Path="/65B2AF51/64F3F75C" Ref="U402"  Part="1" 
AR Path="/65B2AF5D/64F3F75C" Ref="U502"  Part="1" 
AR Path="/65B2AF69/64F3F75C" Ref="U602"  Part="1" 
AR Path="/65B2AF75/64F3F75C" Ref="U702"  Part="1" 
AR Path="/65B2AF81/64F3F75C" Ref="U802"  Part="1" 
AR Path="/65B2AF8D/64F3F75C" Ref="U902"  Part="1" 
AR Path="/65B2AF99/64F3F75C" Ref="U1002"  Part="1" 
AR Path="/65B2AFA5/64F3F75C" Ref="U1102"  Part="1" 
AR Path="/65B2AFB1/64F3F75C" Ref="U1202"  Part="1" 
AR Path="/65B2AFBD/64F3F75C" Ref="U1302"  Part="1" 
AR Path="/65B2AFC9/64F3F75C" Ref="U1402"  Part="1" 
AR Path="/65B2B182/64F3F75C" Ref="U1502"  Part="1" 
AR Path="/65B2B18E/64F3F75C" Ref="U1602"  Part="1" 
AR Path="/65B2B19A/64F3F75C" Ref="U1702"  Part="1" 
AR Path="/65B2B1A6/64F3F75C" Ref="U1802"  Part="1" 
AR Path="/65B2B1C6/64F3F75C" Ref="U1902"  Part="1" 
AR Path="/65B2B1D2/64F3F75C" Ref="U2002"  Part="1" 
AR Path="/65B2B1DE/64F3F75C" Ref="U2002"  Part="1" 
AR Path="/65B2B1EA/64F3F75C" Ref="U2202"  Part="1" 
F 0 "U402" H 6500 4517 50  0000 C CNN
F 1 "AS6C4008-55PCN" H 6500 4426 50  0000 C CNN
F 2 "alexios:DIP-32_W15.24mm_Socketed_IC" V 6500 3375 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 6500 3450 50  0001 C CNN
F 4 "913-AS6C4008-55PCN;€4.5" H 5700 1600 50  0001 L CNN "AC:BOM-Mouser"
	1    6500 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:AS6C4008-55PCN U?
U 2 1 651E017A
P 6400 5450
AR Path="/60F438E4/5E94D03A/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD529/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5EC68F14/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5EC75B87/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5EC75B97/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD509/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD519/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD539/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC4E/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC5E/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC6E/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC7E/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F42/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F4E/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F5A/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F66/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A51/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A5D/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A69/651E017A" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A75/651E017A" Ref="U?"  Part="2" 
AR Path="/65B2AF42/651E017A" Ref="U302"  Part="2" 
AR Path="/65B2AF51/651E017A" Ref="U402"  Part="2" 
AR Path="/65B2AF5D/651E017A" Ref="U502"  Part="2" 
AR Path="/65B2AF69/651E017A" Ref="U602"  Part="2" 
AR Path="/65B2AF75/651E017A" Ref="U702"  Part="2" 
AR Path="/65B2AF81/651E017A" Ref="U802"  Part="2" 
AR Path="/65B2AF8D/651E017A" Ref="U902"  Part="2" 
AR Path="/65B2AF99/651E017A" Ref="U1002"  Part="2" 
AR Path="/65B2AFA5/651E017A" Ref="U1102"  Part="2" 
AR Path="/65B2AFB1/651E017A" Ref="U1202"  Part="2" 
AR Path="/65B2AFBD/651E017A" Ref="U1302"  Part="2" 
AR Path="/65B2AFC9/651E017A" Ref="U1402"  Part="2" 
AR Path="/65B2B182/651E017A" Ref="U1502"  Part="2" 
AR Path="/65B2B18E/651E017A" Ref="U1602"  Part="2" 
AR Path="/65B2B19A/651E017A" Ref="U1702"  Part="2" 
AR Path="/65B2B1A6/651E017A" Ref="U1802"  Part="2" 
AR Path="/65B2B1C6/651E017A" Ref="U1902"  Part="2" 
AR Path="/65B2B1D2/651E017A" Ref="U2002"  Part="2" 
AR Path="/65B2B1DE/651E017A" Ref="U2002"  Part="2" 
AR Path="/65B2B1EA/651E017A" Ref="U2202"  Part="2" 
F 0 "U402" H 6580 5496 50  0000 L CNN
F 1 "AS6C4008-55PCN" H 6580 5405 50  0000 L CNN
F 2 "alexios:DIP-32_W15.24mm_Socketed_IC" V 6400 5675 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 6400 5750 50  0001 C CNN
F 4 "913-AS6C4008-55PCN;€4.5" H 5600 3900 50  0001 L CNN "AC:BOM-Mouser"
	2    6400 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5EAE37CE
P 6050 5450
AR Path="/5E94D03A/5EAE37CE" Ref="C5"  Part="1" 
AR Path="/5EC68F14/5EAE37CE" Ref="C9"  Part="1" 
AR Path="/5EC75B87/5EAE37CE" Ref="C13"  Part="1" 
AR Path="/5EC75B97/5EAE37CE" Ref="C17"  Part="1" 
AR Path="/5EC8475C/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/5EC8476C/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/5EC8477C/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/5EC8478C/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/5ECB980E/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/5ECB981E/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/5ECCD509/5EAE37CE" Ref="C21"  Part="1" 
AR Path="/5ECCD519/5EAE37CE" Ref="C25"  Part="1" 
AR Path="/5ECCD529/5EAE37CE" Ref="C29"  Part="1" 
AR Path="/5ECCD539/5EAE37CE" Ref="C33"  Part="1" 
AR Path="/5ECDEC4E/5EAE37CE" Ref="C37"  Part="1" 
AR Path="/5ECDEC5E/5EAE37CE" Ref="C41"  Part="1" 
AR Path="/5ECDEC6E/5EAE37CE" Ref="C45"  Part="1" 
AR Path="/5ECDEC7E/5EAE37CE" Ref="C49"  Part="1" 
AR Path="/60F438E4/5E94D03A/5EAE37CE" Ref="C303"  Part="1" 
AR Path="/60F438E4/5EC68F14/5EAE37CE" Ref="C403"  Part="1" 
AR Path="/60F438E4/5EC75B87/5EAE37CE" Ref="C503"  Part="1" 
AR Path="/60F438E4/5EC75B97/5EAE37CE" Ref="C603"  Part="1" 
AR Path="/60F438E4/5ECCD509/5EAE37CE" Ref="C703"  Part="1" 
AR Path="/60F438E4/5ECCD519/5EAE37CE" Ref="C803"  Part="1" 
AR Path="/60F438E4/5ECCD529/5EAE37CE" Ref="C903"  Part="1" 
AR Path="/60F438E4/5ECCD539/5EAE37CE" Ref="C1003"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/5EAE37CE" Ref="C1103"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/5EAE37CE" Ref="C1203"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/5EAE37CE" Ref="C1303"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/5EAE37CE" Ref="C1403"  Part="1" 
AR Path="/60F438E4/651F3F42/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F4E/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F5A/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F66/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A51/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A5D/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A69/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A75/5EAE37CE" Ref="C?"  Part="1" 
AR Path="/65B2AF42/5EAE37CE" Ref="C302"  Part="1" 
AR Path="/65B2AF51/5EAE37CE" Ref="C402"  Part="1" 
AR Path="/65B2AF5D/5EAE37CE" Ref="C502"  Part="1" 
AR Path="/65B2AF69/5EAE37CE" Ref="C602"  Part="1" 
AR Path="/65B2AF75/5EAE37CE" Ref="C702"  Part="1" 
AR Path="/65B2AF81/5EAE37CE" Ref="C802"  Part="1" 
AR Path="/65B2AF8D/5EAE37CE" Ref="C902"  Part="1" 
AR Path="/65B2AF99/5EAE37CE" Ref="C1002"  Part="1" 
AR Path="/65B2AFA5/5EAE37CE" Ref="C1102"  Part="1" 
AR Path="/65B2AFB1/5EAE37CE" Ref="C1202"  Part="1" 
AR Path="/65B2AFBD/5EAE37CE" Ref="C1302"  Part="1" 
AR Path="/65B2AFC9/5EAE37CE" Ref="C1402"  Part="1" 
AR Path="/65B2B182/5EAE37CE" Ref="C1502"  Part="1" 
AR Path="/65B2B18E/5EAE37CE" Ref="C1602"  Part="1" 
AR Path="/65B2B19A/5EAE37CE" Ref="C1702"  Part="1" 
AR Path="/65B2B1A6/5EAE37CE" Ref="C1802"  Part="1" 
AR Path="/65B2B1C6/5EAE37CE" Ref="C1902"  Part="1" 
AR Path="/65B2B1D2/5EAE37CE" Ref="C2002"  Part="1" 
AR Path="/65B2B1DE/5EAE37CE" Ref="C2002"  Part="1" 
AR Path="/65B2B1EA/5EAE37CE" Ref="C2202"  Part="1" 
F 0 "C402" H 5959 5496 50  0000 R CNN
F 1 "100nF" H 5959 5405 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6050 5450 50  0001 C CNN
F 3 "~" H 6050 5450 50  0001 C CNN
	1    6050 5450
	1    0    0    -1  
$EndComp
$Comp
L alexios:AS6C4008-55PCN U?
U 2 1 651D6766
P 4500 5450
AR Path="/60F438E4/5E94D03A/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD529/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5EC68F14/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5EC75B87/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5EC75B97/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD509/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD519/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECCD539/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC4E/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC5E/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC6E/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/5ECDEC7E/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F42/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F4E/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F5A/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/651F3F66/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A51/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A5D/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A69/651D6766" Ref="U?"  Part="2" 
AR Path="/60F438E4/65440A75/651D6766" Ref="U?"  Part="2" 
AR Path="/65B2AF42/651D6766" Ref="U301"  Part="2" 
AR Path="/65B2AF51/651D6766" Ref="U401"  Part="2" 
AR Path="/65B2AF5D/651D6766" Ref="U501"  Part="2" 
AR Path="/65B2AF69/651D6766" Ref="U601"  Part="2" 
AR Path="/65B2AF75/651D6766" Ref="U701"  Part="2" 
AR Path="/65B2AF81/651D6766" Ref="U801"  Part="2" 
AR Path="/65B2AF8D/651D6766" Ref="U901"  Part="2" 
AR Path="/65B2AF99/651D6766" Ref="U1001"  Part="2" 
AR Path="/65B2AFA5/651D6766" Ref="U1101"  Part="2" 
AR Path="/65B2AFB1/651D6766" Ref="U1201"  Part="2" 
AR Path="/65B2AFBD/651D6766" Ref="U1301"  Part="2" 
AR Path="/65B2AFC9/651D6766" Ref="U1401"  Part="2" 
AR Path="/65B2B182/651D6766" Ref="U1501"  Part="2" 
AR Path="/65B2B18E/651D6766" Ref="U1601"  Part="2" 
AR Path="/65B2B19A/651D6766" Ref="U1701"  Part="2" 
AR Path="/65B2B1A6/651D6766" Ref="U1801"  Part="2" 
AR Path="/65B2B1C6/651D6766" Ref="U1901"  Part="2" 
AR Path="/65B2B1D2/651D6766" Ref="U2001"  Part="2" 
AR Path="/65B2B1DE/651D6766" Ref="U2001"  Part="2" 
AR Path="/65B2B1EA/651D6766" Ref="U2201"  Part="2" 
F 0 "U401" H 4680 5496 50  0000 L CNN
F 1 "AS6C4008-55PCN" H 4680 5405 50  0000 L CNN
F 2 "alexios:DIP-32_W15.24mm_Socketed_IC" V 4500 5675 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 4500 5750 50  0001 C CNN
F 4 "913-AS6C4008-55PCN;€4.5" H 3700 3900 50  0001 L CNN "AC:BOM-Mouser"
	2    4500 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5EAE1505
P 4150 5450
AR Path="/5E94D03A/5EAE1505" Ref="C3"  Part="1" 
AR Path="/5EC68F14/5EAE1505" Ref="C7"  Part="1" 
AR Path="/5EC75B87/5EAE1505" Ref="C11"  Part="1" 
AR Path="/5EC75B97/5EAE1505" Ref="C15"  Part="1" 
AR Path="/5EC8475C/5EAE1505" Ref="C?"  Part="1" 
AR Path="/5EC8476C/5EAE1505" Ref="C?"  Part="1" 
AR Path="/5EC8477C/5EAE1505" Ref="C?"  Part="1" 
AR Path="/5EC8478C/5EAE1505" Ref="C?"  Part="1" 
AR Path="/5ECB980E/5EAE1505" Ref="C?"  Part="1" 
AR Path="/5ECB981E/5EAE1505" Ref="C?"  Part="1" 
AR Path="/5ECCD509/5EAE1505" Ref="C19"  Part="1" 
AR Path="/5ECCD519/5EAE1505" Ref="C23"  Part="1" 
AR Path="/5ECCD529/5EAE1505" Ref="C27"  Part="1" 
AR Path="/5ECCD539/5EAE1505" Ref="C31"  Part="1" 
AR Path="/5ECDEC4E/5EAE1505" Ref="C35"  Part="1" 
AR Path="/5ECDEC5E/5EAE1505" Ref="C39"  Part="1" 
AR Path="/5ECDEC6E/5EAE1505" Ref="C43"  Part="1" 
AR Path="/5ECDEC7E/5EAE1505" Ref="C47"  Part="1" 
AR Path="/60F438E4/5E94D03A/5EAE1505" Ref="C?"  Part="1" 
AR Path="/60F438E4/5EC68F14/5EAE1505" Ref="C401"  Part="1" 
AR Path="/60F438E4/5EC75B87/5EAE1505" Ref="C501"  Part="1" 
AR Path="/60F438E4/5EC75B97/5EAE1505" Ref="C601"  Part="1" 
AR Path="/60F438E4/5ECCD509/5EAE1505" Ref="C701"  Part="1" 
AR Path="/60F438E4/5ECCD519/5EAE1505" Ref="C801"  Part="1" 
AR Path="/60F438E4/5ECCD529/5EAE1505" Ref="C901"  Part="1" 
AR Path="/60F438E4/5ECCD539/5EAE1505" Ref="C1001"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/5EAE1505" Ref="C1101"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/5EAE1505" Ref="C1201"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/5EAE1505" Ref="C1301"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/5EAE1505" Ref="C1401"  Part="1" 
AR Path="/60F438E4/651F3F42/5EAE1505" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F4E/5EAE1505" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F5A/5EAE1505" Ref="C?"  Part="1" 
AR Path="/60F438E4/651F3F66/5EAE1505" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A51/5EAE1505" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A5D/5EAE1505" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A69/5EAE1505" Ref="C?"  Part="1" 
AR Path="/60F438E4/65440A75/5EAE1505" Ref="C?"  Part="1" 
AR Path="/65B2AF42/5EAE1505" Ref="C301"  Part="1" 
AR Path="/65B2AF51/5EAE1505" Ref="C401"  Part="1" 
AR Path="/65B2AF5D/5EAE1505" Ref="C501"  Part="1" 
AR Path="/65B2AF69/5EAE1505" Ref="C601"  Part="1" 
AR Path="/65B2AF75/5EAE1505" Ref="C701"  Part="1" 
AR Path="/65B2AF81/5EAE1505" Ref="C801"  Part="1" 
AR Path="/65B2AF8D/5EAE1505" Ref="C901"  Part="1" 
AR Path="/65B2AF99/5EAE1505" Ref="C1001"  Part="1" 
AR Path="/65B2AFA5/5EAE1505" Ref="C1101"  Part="1" 
AR Path="/65B2AFB1/5EAE1505" Ref="C1201"  Part="1" 
AR Path="/65B2AFBD/5EAE1505" Ref="C1301"  Part="1" 
AR Path="/65B2AFC9/5EAE1505" Ref="C1401"  Part="1" 
AR Path="/65B2B182/5EAE1505" Ref="C1501"  Part="1" 
AR Path="/65B2B18E/5EAE1505" Ref="C1601"  Part="1" 
AR Path="/65B2B19A/5EAE1505" Ref="C1701"  Part="1" 
AR Path="/65B2B1A6/5EAE1505" Ref="C1801"  Part="1" 
AR Path="/65B2B1C6/5EAE1505" Ref="C1901"  Part="1" 
AR Path="/65B2B1D2/5EAE1505" Ref="C2001"  Part="1" 
AR Path="/65B2B1DE/5EAE1505" Ref="C2001"  Part="1" 
AR Path="/65B2B1EA/5EAE1505" Ref="C2201"  Part="1" 
F 0 "C401" H 4059 5496 50  0000 R CNN
F 1 "100nF" H 4059 5405 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4150 5450 50  0001 C CNN
F 3 "~" H 4150 5450 50  0001 C CNN
	1    4150 5450
	1    0    0    -1  
$EndComp
$Comp
L alexios:AS6C4008-55PCN U?
U 1 1 64F3C523
P 4600 3150
AR Path="/60F438E4/5E94D03A/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD529/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5EC68F14/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5EC75B87/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5EC75B97/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD509/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD519/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECCD539/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC4E/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC5E/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC6E/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/5ECDEC7E/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F42/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F4E/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F5A/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/651F3F66/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A51/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A5D/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A69/64F3C523" Ref="U?"  Part="1" 
AR Path="/60F438E4/65440A75/64F3C523" Ref="U?"  Part="1" 
AR Path="/65B2AF42/64F3C523" Ref="U301"  Part="1" 
AR Path="/65B2AF51/64F3C523" Ref="U401"  Part="1" 
AR Path="/65B2AF5D/64F3C523" Ref="U501"  Part="1" 
AR Path="/65B2AF69/64F3C523" Ref="U601"  Part="1" 
AR Path="/65B2AF75/64F3C523" Ref="U701"  Part="1" 
AR Path="/65B2AF81/64F3C523" Ref="U801"  Part="1" 
AR Path="/65B2AF8D/64F3C523" Ref="U901"  Part="1" 
AR Path="/65B2AF99/64F3C523" Ref="U1001"  Part="1" 
AR Path="/65B2AFA5/64F3C523" Ref="U1101"  Part="1" 
AR Path="/65B2AFB1/64F3C523" Ref="U1201"  Part="1" 
AR Path="/65B2AFBD/64F3C523" Ref="U1301"  Part="1" 
AR Path="/65B2AFC9/64F3C523" Ref="U1401"  Part="1" 
AR Path="/65B2B182/64F3C523" Ref="U1501"  Part="1" 
AR Path="/65B2B18E/64F3C523" Ref="U1601"  Part="1" 
AR Path="/65B2B19A/64F3C523" Ref="U1701"  Part="1" 
AR Path="/65B2B1A6/64F3C523" Ref="U1801"  Part="1" 
AR Path="/65B2B1C6/64F3C523" Ref="U1901"  Part="1" 
AR Path="/65B2B1D2/64F3C523" Ref="U2001"  Part="1" 
AR Path="/65B2B1DE/64F3C523" Ref="U2001"  Part="1" 
AR Path="/65B2B1EA/64F3C523" Ref="U2201"  Part="1" 
F 0 "U401" H 4600 4517 50  0000 C CNN
F 1 "AS6C4008-55PCN" H 4600 4426 50  0000 C CNN
F 2 "alexios:DIP-32_W15.24mm_Socketed_IC" V 4600 3375 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 4600 3450 50  0001 C CNN
F 4 "913-AS6C4008-55PCN;€4.5" H 3800 1600 50  0001 L CNN "AC:BOM-Mouser"
	1    4600 3150
	1    0    0    -1  
$EndComp
Wire Bus Line
	7300 2150 7300 4500
Wire Bus Line
	5350 2150 5350 4500
Wire Bus Line
	5700 1700 5700 3750
Wire Bus Line
	3800 1700 3800 3750
$EndSCHEMATC
