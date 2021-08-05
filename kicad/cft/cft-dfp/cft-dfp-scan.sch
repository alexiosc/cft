EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 19 19
Title "Front Panel Light Scanner"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 "dfp_scan.v"
$EndDescr
Text Notes 8650 3100 0    50   ~ 0
The front panel scanner synchronises two groups of\nsignals: the front panel output enables on various\nprocessor boards (using the ~FPOExx~ enables), and\nthe enables of the 8-bit latches on the front panel\nboards.\n\nThe front panel boards are organised in four modules\ntimes five rows. The module is enabled for writing by\nthe two-bit address FPA₀₋₁ and a specific row on that\nmodule is enabled for latching using ~ROW₁₋₅~. There\nis a separate FPA decoder on each light module; the ROW\ndecoding happens here.\n\nThese are in phase with the ~FPOExx~ enables, so the\nsame row on each module will always receive data from\nthe same processor board output buffer.\n\nThe addresses are scanned in increasing order,\nmodulo 21: ~FPOE20~ enables nothing, but is used to\nreset the count.\n\nAddresses over 20 are never reached by the autonomic\ncounter, but they may be put on the bus by the MCU to\nenable future units for debugging output (which however\nwon't appear on the front panel).\n\nAddresses are decoded across modules first, then down\nby row numbers: so the enables are interleaved across\n'138 decoders. (each decoder is responsible for one\nfront panel module)
Text Notes 8650 3550 0    100  ~ 20
Front Panel Light Modules
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 3900 10325 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 3925 10325 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 3925 10300 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 3925 10325 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 3900 10375 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 3925 10375 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 3925 10350 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 3925 10375 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 3900 10425 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 3925 10425 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 3925 10400 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 3925 10425 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 3900 10475 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 3925 10475 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 3925 10450 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 3925 10475 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 3900 10525 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 3925 10525 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 3925 10500 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 3925 10525 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 3900 10575 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 3925 10575 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 3925 10550 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 3925 10575 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 3900 10625 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 3925 10625 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 3925 10600 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10625 3925 10625 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 3900 10675 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 3925 10675 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 3925 10650 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10675 3925 10675 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4200 10325 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4225 10325 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4225 10300 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 4225 10325 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4200 10375 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4225 10375 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4225 10350 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 4225 10375 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4200 10425 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4225 10425 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4225 10400 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 4225 10425 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4200 10475 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4225 10475 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4225 10450 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 4225 10475 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4200 10525 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4225 10525 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4225 10500 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 4225 10525 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4200 10575 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4225 10575 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4225 10550 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 4225 10575 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4200 10625 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4225 10625 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4225 10600 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10625 4225 10625 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4200 10675 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4225 10675 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4225 10650 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10675 4225 10675 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4050 10325 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4075 10325 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4075 10300 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 4075 10325 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4050 10375 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4075 10375 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4075 10350 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 4075 10375 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4050 10425 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4075 10425 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4075 10400 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 4075 10425 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4050 10475 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4075 10475 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4075 10450 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 4075 10475 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4050 10525 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4075 10525 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4075 10500 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 4075 10525 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4050 10575 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4075 10575 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4075 10550 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 4075 10575 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4050 10625 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4075 10625 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4075 10600 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10625 4075 10625 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4050 10675 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4075 10675 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4075 10650 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10675 4075 10675 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4350 10325 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4375 10325 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4375 10300 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 4375 10325 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4350 10375 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4375 10375 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4375 10350 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 4375 10375 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4350 10425 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4375 10425 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4375 10400 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 4375 10425 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4350 10475 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4375 10475 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4375 10450 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 4375 10475 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4350 10525 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4375 10525 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4375 10500 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 4375 10525 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4350 10575 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4375 10575 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4375 10550 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 4375 10575 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4350 10625 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4375 10625 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4375 10600 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10625 4375 10625 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4350 10675 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4375 10675 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4375 10650 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10675 4375 10675 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4500 10325 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4525 10325 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4525 10300 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 4525 10325 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4500 10375 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4525 10375 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4525 10350 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 4525 10375 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4500 10425 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4525 10425 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4525 10400 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 4525 10425 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4500 10475 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4525 10475 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4525 10450 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 4525 10475 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4500 10525 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4525 10525 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4525 10500 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 4525 10525 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4500 10575 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4525 10575 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4525 10550 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 4525 10575 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4500 10625 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4525 10625 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10600 4525 10600 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10625 4525 10625 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4500 10675 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4525 10675 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10650 4525 10650 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10675 4525 10675 4500
Text Notes 10800 3950 0    50   ~ 0
Row 1
Text Notes 10800 4100 0    50   ~ 0
Row 2
Text Notes 10800 4250 0    50   ~ 0
Row 3
Text Notes 10800 4400 0    50   ~ 0
Row 4
Text Notes 10800 4550 0    50   ~ 0
Row 5
Wire Notes Line style solid rgb(255, 255, 0)
	10250 3800 10750 3800
Wire Notes Line style solid rgb(255, 255, 0)
	10750 3800 10750 4600
Wire Notes Line style solid rgb(255, 255, 0)
	10750 4600 10250 4600
Wire Notes Line style solid rgb(255, 255, 0)
	10250 4600 10250 3800
Text Notes 10250 3750 0    60   ~ 12
Module D
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 3900 9775 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 3925 9775 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 3925 9750 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 3925 9775 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 3900 9825 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 3925 9825 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 3925 9800 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 3925 9825 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 3900 9875 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 3925 9875 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 3925 9850 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 3925 9875 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 3900 9925 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 3925 9925 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 3925 9900 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 3925 9925 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 3900 9975 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 3925 9975 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 3925 9950 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 3925 9975 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 3900 10025 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 3925 10025 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 3925 10000 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 3925 10025 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 3900 10075 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 3925 10075 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 3925 10050 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10075 3925 10075 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 3900 10125 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 3925 10125 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 3925 10100 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	10125 3925 10125 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4200 9775 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4225 9775 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4225 9750 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 4225 9775 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4200 9825 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4225 9825 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4225 9800 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 4225 9825 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4200 9875 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4225 9875 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4225 9850 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 4225 9875 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4200 9925 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4225 9925 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4225 9900 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 4225 9925 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4200 9975 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4225 9975 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4225 9950 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 4225 9975 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4200 10025 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4225 10025 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4225 10000 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 4225 10025 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4200 10075 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4225 10075 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4225 10050 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10075 4225 10075 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4200 10125 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4225 10125 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4225 10100 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	10125 4225 10125 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4050 9775 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4075 9775 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4075 9750 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 4075 9775 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4050 9825 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4075 9825 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4075 9800 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 4075 9825 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4050 9875 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4075 9875 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4075 9850 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 4075 9875 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4050 9925 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4075 9925 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4075 9900 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 4075 9925 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4050 9975 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4075 9975 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4075 9950 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 4075 9975 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4050 10025 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4075 10025 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4075 10000 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 4075 10025 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4050 10075 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4075 10075 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4075 10050 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10075 4075 10075 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4050 10125 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4075 10125 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4075 10100 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	10125 4075 10125 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4350 9775 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4375 9775 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4375 9750 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 4375 9775 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4350 9825 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4375 9825 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4375 9800 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 4375 9825 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4350 9875 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4375 9875 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4375 9850 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 4375 9875 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4350 9925 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4375 9925 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4375 9900 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 4375 9925 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4350 9975 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4375 9975 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4375 9950 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 4375 9975 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4350 10025 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4375 10025 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4375 10000 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 4375 10025 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4350 10075 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4375 10075 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4375 10050 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10075 4375 10075 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4350 10125 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4375 10125 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4375 10100 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	10125 4375 10125 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4500 9775 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4525 9775 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4525 9750 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 4525 9775 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4500 9825 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4525 9825 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4525 9800 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 4525 9825 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4500 9875 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4525 9875 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4525 9850 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 4525 9875 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4500 9925 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4525 9925 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4525 9900 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 4525 9925 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4500 9975 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4525 9975 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4525 9950 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 4525 9975 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4500 10025 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4525 10025 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4525 10000 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 4525 10025 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4500 10075 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4525 10075 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10050 4525 10050 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10075 4525 10075 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4500 10125 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4525 10125 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	10100 4525 10100 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	10125 4525 10125 4500
Wire Notes Line style solid rgb(255, 255, 0)
	9700 3800 10200 3800
Wire Notes Line style solid rgb(255, 255, 0)
	10200 3800 10200 4600
Wire Notes Line style solid rgb(255, 255, 0)
	10200 4600 9700 4600
Wire Notes Line style solid rgb(255, 255, 0)
	9700 4600 9700 3800
Text Notes 9700 3750 0    60   ~ 12
Module C
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 3900 9225 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 3925 9225 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 3925 9200 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 3925 9225 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 3900 9275 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 3925 9275 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 3925 9250 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 3925 9275 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 3900 9325 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 3925 9325 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 3925 9300 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 3925 9325 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 3900 9375 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 3925 9375 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 3925 9350 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 3925 9375 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 3900 9425 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 3925 9425 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 3925 9400 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 3925 9425 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 3900 9475 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 3925 9475 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 3925 9450 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 3925 9475 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 3900 9525 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 3925 9525 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 3925 9500 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9525 3925 9525 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 3900 9575 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 3925 9575 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 3925 9550 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9575 3925 9575 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4200 9225 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4225 9225 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4225 9200 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 4225 9225 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4200 9275 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4225 9275 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4225 9250 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 4225 9275 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4200 9325 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4225 9325 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4225 9300 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 4225 9325 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4200 9375 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4225 9375 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4225 9350 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 4225 9375 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4200 9425 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4225 9425 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4225 9400 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 4225 9425 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4200 9475 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4225 9475 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4225 9450 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 4225 9475 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4200 9525 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4225 9525 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4225 9500 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9525 4225 9525 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4200 9575 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4225 9575 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4225 9550 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9575 4225 9575 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4050 9225 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4075 9225 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4075 9200 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 4075 9225 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4050 9275 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4075 9275 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4075 9250 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 4075 9275 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4050 9325 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4075 9325 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4075 9300 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 4075 9325 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4050 9375 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4075 9375 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4075 9350 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 4075 9375 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4050 9425 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4075 9425 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4075 9400 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 4075 9425 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4050 9475 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4075 9475 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4075 9450 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 4075 9475 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4050 9525 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4075 9525 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4075 9500 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9525 4075 9525 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4050 9575 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4075 9575 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4075 9550 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9575 4075 9575 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4350 9225 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4375 9225 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4375 9200 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 4375 9225 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4350 9275 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4375 9275 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4375 9250 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 4375 9275 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4350 9325 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4375 9325 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4375 9300 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 4375 9325 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4350 9375 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4375 9375 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4375 9350 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 4375 9375 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4350 9425 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4375 9425 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4375 9400 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 4375 9425 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4350 9475 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4375 9475 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4375 9450 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 4375 9475 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4350 9525 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4375 9525 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4375 9500 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9525 4375 9525 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4350 9575 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4375 9575 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4375 9550 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9575 4375 9575 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4500 9225 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4525 9225 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4525 9200 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 4525 9225 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4500 9275 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4525 9275 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4525 9250 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 4525 9275 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4500 9325 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4525 9325 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4525 9300 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 4525 9325 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4500 9375 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4525 9375 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4525 9350 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 4525 9375 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4500 9425 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4525 9425 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4525 9400 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 4525 9425 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4500 9475 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4525 9475 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4525 9450 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 4525 9475 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4500 9525 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4525 9525 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9500 4525 9500 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9525 4525 9525 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4500 9575 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4525 9575 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9550 4525 9550 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9575 4525 9575 4500
Wire Notes Line style solid rgb(255, 255, 0)
	9150 3800 9650 3800
Wire Notes Line style solid rgb(255, 255, 0)
	9650 3800 9650 4600
Wire Notes Line style solid rgb(255, 255, 0)
	9650 4600 9150 4600
Wire Notes Line style solid rgb(255, 255, 0)
	9150 4600 9150 3800
Text Notes 9150 3750 0    60   ~ 12
Module B
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 3900 8675 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 3925 8675 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 3925 8650 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 3925 8675 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 3900 8725 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 3925 8725 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 3925 8700 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 3925 8725 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 3900 8775 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 3925 8775 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 3925 8750 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 3925 8775 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 3900 8825 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 3925 8825 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 3925 8800 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 3925 8825 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 3900 8875 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 3925 8875 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 3925 8850 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 3925 8875 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 3900 8925 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 3925 8925 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 3925 8900 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 3925 8925 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 3900 8975 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 3925 8975 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 3925 8950 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8975 3925 8975 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 3900 9025 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 3925 9025 3925
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 3925 9000 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	9025 3925 9025 3900
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4200 8675 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4225 8675 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4225 8650 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 4225 8675 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4200 8725 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4225 8725 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4225 8700 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 4225 8725 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4200 8775 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4225 8775 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4225 8750 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 4225 8775 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4200 8825 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4225 8825 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4225 8800 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 4225 8825 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4200 8875 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4225 8875 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4225 8850 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 4225 8875 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4200 8925 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4225 8925 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4225 8900 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 4225 8925 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4200 8975 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4225 8975 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4225 8950 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8975 4225 8975 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4200 9025 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4225 9025 4225
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4225 9000 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	9025 4225 9025 4200
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4050 8675 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4075 8675 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4075 8650 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 4075 8675 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4050 8725 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4075 8725 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4075 8700 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 4075 8725 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4050 8775 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4075 8775 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4075 8750 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 4075 8775 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4050 8825 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4075 8825 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4075 8800 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 4075 8825 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4050 8875 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4075 8875 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4075 8850 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 4075 8875 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4050 8925 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4075 8925 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4075 8900 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 4075 8925 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4050 8975 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4075 8975 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4075 8950 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8975 4075 8975 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4050 9025 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4075 9025 4075
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4075 9000 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	9025 4075 9025 4050
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4350 8675 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4375 8675 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4375 8650 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 4375 8675 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4350 8725 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4375 8725 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4375 8700 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 4375 8725 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4350 8775 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4375 8775 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4375 8750 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 4375 8775 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4350 8825 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4375 8825 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4375 8800 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 4375 8825 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4350 8875 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4375 8875 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4375 8850 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 4375 8875 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4350 8925 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4375 8925 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4375 8900 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 4375 8925 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4350 8975 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4375 8975 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4375 8950 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8975 4375 8975 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4350 9025 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4375 9025 4375
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4375 9000 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	9025 4375 9025 4350
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4500 8675 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4525 8675 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4525 8650 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 4525 8675 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4500 8725 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4525 8725 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4525 8700 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 4525 8725 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4500 8775 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4525 8775 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4525 8750 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 4525 8775 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4500 8825 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4525 8825 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4525 8800 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 4525 8825 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4500 8875 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4525 8875 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4525 8850 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 4525 8875 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4500 8925 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4525 8925 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4525 8900 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 4525 8925 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4500 8975 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4525 8975 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	8950 4525 8950 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	8975 4525 8975 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4500 9025 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4525 9025 4525
Wire Notes Line width 10 rgb(253, 26, 0)
	9000 4525 9000 4500
Wire Notes Line width 10 rgb(253, 26, 0)
	9025 4525 9025 4500
Wire Notes Line style solid rgb(255, 255, 0)
	8600 3800 9100 3800
Wire Notes Line style solid rgb(255, 255, 0)
	9100 3800 9100 4600
Wire Notes Line style solid rgb(255, 255, 0)
	9100 4600 8600 4600
Wire Notes Line style solid rgb(255, 255, 0)
	8600 4600 8600 3800
Text Notes 8600 3750 0    60   ~ 12
Module A
Text Notes 8500 4700 0    50   ~ 0
FPA=xxxxxx00
Text Notes 9250 4700 0    50   ~ 0
xxxxxx01
Text Notes 9800 4700 0    50   ~ 0
xxxxxx10
Text Notes 10350 4700 0    50   ~ 0
xxxxxx11\n
Text Label 4700 1600 0    50   ~ 0
FPA4
Text Label 4700 1400 0    50   ~ 0
FPA3
Text Label 4700 1300 0    50   ~ 0
FPA2
Wire Wire Line
	4700 1300 5250 1300
Wire Wire Line
	4700 1400 5250 1400
Wire Wire Line
	4700 1600 5250 1600
Text Label 4950 1700 0    50   ~ 0
~PANELEN
Wire Wire Line
	5250 1200 4700 1200
Wire Wire Line
	5250 1100 4700 1100
Text Label 4700 1100 0    50   ~ 0
FPA0
Text Label 4700 1200 0    50   ~ 0
FPA1
Text Label 6600 1100 2    50   ~ 0
~FPOE0
Text Label 6600 1200 2    50   ~ 0
~FPOE1
Text Label 6600 1300 2    50   ~ 0
~FPOE2
Text Label 6600 1400 2    50   ~ 0
~FPOE3
Text Label 6600 1500 2    50   ~ 0
~FPOE4
Text Label 6600 1600 2    50   ~ 0
~FPOE5
Text Label 6600 1700 2    50   ~ 0
~FPOE6
Text Label 6600 1800 2    50   ~ 0
~FPOE7
Text Label 6600 1900 2    50   ~ 0
~FPOE8
Text Label 6600 2000 2    50   ~ 0
~FPOE9
Text Label 6600 2100 2    50   ~ 0
~FPOE10
Text Label 6600 2200 2    50   ~ 0
~FPOE11
Text Label 6600 2300 2    50   ~ 0
~FPOE12
Text Label 6600 2400 2    50   ~ 0
~FPOE13
Text Label 6600 2500 2    50   ~ 0
~FPOE14
Text Label 6600 2600 2    50   ~ 0
~FPOE15
Text Label 4700 3350 0    50   ~ 0
FPA3
Text Label 4700 3250 0    50   ~ 0
FPA2
Wire Wire Line
	4700 3250 5250 3250
Wire Wire Line
	4700 3350 5250 3350
Text Label 4950 3650 0    50   ~ 0
~PANELEN
Wire Wire Line
	5250 3150 4700 3150
Wire Wire Line
	5250 3050 4700 3050
Text Label 4700 3050 0    50   ~ 0
FPA0
Text Label 4700 3150 0    50   ~ 0
FPA1
Text Label 6600 3050 2    50   ~ 0
~FPOE16
Text Label 6600 3150 2    50   ~ 0
~FPOE17
Text Label 6600 3250 2    50   ~ 0
~FPOE18
Text Label 6600 3350 2    50   ~ 0
~FPOE19
Text Label 6600 3450 2    50   ~ 0
~FPOE20
Text Label 6600 3550 2    50   ~ 0
~FPOE21
Text Label 6600 3650 2    50   ~ 0
~FPOE22
Text Label 6600 3750 2    50   ~ 0
~FPOE23
Text Label 6600 3850 2    50   ~ 0
~FPOE24
Text Label 6600 3950 2    50   ~ 0
~FPOE25
Text Label 6600 4050 2    50   ~ 0
~FPOE26
Text Label 6600 4150 2    50   ~ 0
~FPOE27
Text Label 6600 4250 2    50   ~ 0
~FPOE28
Text Label 6600 4350 2    50   ~ 0
~FPOE29
Text Label 6600 4450 2    50   ~ 0
~FPOE30
Text Label 6600 4550 2    50   ~ 0
~FPOE31
$Comp
L Device:C_Small C?
U 1 1 62ECDEB3
P 5800 6150
AR Path="/62ECDEB3" Ref="C?"  Part="1" 
AR Path="/6233F88C/62ECDEB3" Ref="C?"  Part="1" 
AR Path="/60757845/607964B6/62ECDEB3" Ref="C?"  Part="1" 
AR Path="/64FC7999/650046D0/62ECDEB3" Ref="C?"  Part="1" 
AR Path="/65BD1B6F/62ECDEB3" Ref="C33"  Part="1" 
F 0 "C33" H 5709 6196 50  0000 R CNN
F 1 "100nF" H 5709 6105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5800 6150 50  0001 C CNN
F 3 "~" H 5800 6150 50  0001 C CNN
	1    5800 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0172
U 1 1 62ED49B6
P 5800 6050
F 0 "#PWR0172" H 5800 5900 50  0001 C CNN
F 1 "+5V" H 5815 6223 50  0000 C CNN
F 2 "" H 5800 6050 50  0001 C CNN
F 3 "" H 5800 6050 50  0001 C CNN
	1    5800 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0173
U 1 1 62ED540F
P 5800 6250
F 0 "#PWR0173" H 5800 6000 50  0001 C CNN
F 1 "GND" H 5805 6077 50  0000 C CNN
F 2 "" H 5800 6250 50  0001 C CNN
F 3 "" H 5800 6250 50  0001 C CNN
	1    5800 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 62EDD3ED
P 5800 6900
AR Path="/62EDD3ED" Ref="C?"  Part="1" 
AR Path="/6233F88C/62EDD3ED" Ref="C?"  Part="1" 
AR Path="/60757845/607964B6/62EDD3ED" Ref="C?"  Part="1" 
AR Path="/64FC7999/650046D0/62EDD3ED" Ref="C?"  Part="1" 
AR Path="/65BD1B6F/62EDD3ED" Ref="C34"  Part="1" 
F 0 "C34" H 5709 6946 50  0000 R CNN
F 1 "100nF" H 5709 6855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5800 6900 50  0001 C CNN
F 3 "~" H 5800 6900 50  0001 C CNN
	1    5800 6900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0174
U 1 1 62EDD3F3
P 5800 6800
F 0 "#PWR0174" H 5800 6650 50  0001 C CNN
F 1 "+5V" H 5815 6973 50  0000 C CNN
F 2 "" H 5800 6800 50  0001 C CNN
F 3 "" H 5800 6800 50  0001 C CNN
	1    5800 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0175
U 1 1 62EDD3F9
P 5800 7000
F 0 "#PWR0175" H 5800 6750 50  0001 C CNN
F 1 "GND" H 5805 6827 50  0000 C CNN
F 2 "" H 5800 7000 50  0001 C CNN
F 3 "" H 5800 7000 50  0001 C CNN
	1    5800 7000
	1    0    0    -1  
$EndComp
Text Notes 7000 3450 0    50   ~ 0
~FPOE20~ triggers a counter reset.
Text Notes 7000 3350 0    50   ~ 0
Module D, Row 5 (µCA low)
Text Notes 7000 2600 0    50   ~ 0
Module D, Row 4 (TBD)
Text Notes 7000 2200 0    50   ~ 0
Module D, Row 3 (for expansion)
Text Notes 7000 1800 0    50   ~ 0
Module D, Row 2 (IRQs enabled)
Text Notes 7000 1400 0    50   ~ 0
Module D, Row 1 (IRQs active)
Text Notes 7000 3250 0    50   ~ 0
Module C, Row 5 (IR low)
Text Notes 7000 2500 0    50   ~ 0
Module C, Row 4 (MFD low)
Text Notes 7000 2100 0    50   ~ 0
Module C, Row 3 (AC low)
Text Notes 7000 1700 0    50   ~ 0
Module C, Row 2 (PC low)
Text Notes 7000 1300 0    50   ~ 0
Module C, Row 1 (µCV low)
Text Notes 7000 3150 0    50   ~ 0
Module B, Row 5 (IR high)
Text Notes 7000 2400 0    50   ~ 0
Module B, Row 4 (MFD high)
Text Notes 7000 2000 0    50   ~ 0
Module B, Row 3 (AC high)
Text Notes 7000 1600 0    50   ~ 0
Module B, Row 2 (PC high)
Text Notes 7000 1200 0    50   ~ 0
Module B, Row 1 (µCV medium)
Text Notes 7000 3050 0    50   ~ 0
Module A, Row 5 (state)
Text Notes 7000 2300 0    50   ~ 0
Module A, Row 4 (TBD)
Text Notes 7000 1900 0    50   ~ 0
Module A, Row 3 (flags)
Text Notes 7000 1500 0    50   ~ 0
Module A, Row 2 (AEXT)
Text Notes 7000 1100 0    50   ~ 0
Module A, Row 1 (µCV high)
Wire Wire Line
	2150 1200 2450 1200
Entry Wire Line
	2050 1000 2150 1100
Entry Wire Line
	2050 1100 2150 1200
Wire Wire Line
	2150 1100 2450 1100
Wire Wire Line
	2150 1300 2450 1300
Entry Wire Line
	2050 1200 2150 1300
Text Label 2250 1100 0    50   ~ 0
FPA2
Text Label 2250 1200 0    50   ~ 0
FPA3
Text Label 2250 1300 0    50   ~ 0
FPA4
Text Label 4350 9350 0    50   ~ 0
~ROW[1..5]
Text HLabel 4900 9350 2    50   Output ~ 0
~ROW[1..5]
Text Notes 6950 1200 2    50   ~ 10
01
Text Notes 6950 1300 2    50   ~ 10
02
Text Notes 6950 1400 2    50   ~ 10
03
Text Notes 6950 1500 2    50   ~ 10
04
Text Notes 6950 1600 2    50   ~ 10
05
Text Notes 6950 1700 2    50   ~ 10
06\n
Text Notes 6950 1800 2    50   ~ 10
07\n
Text Notes 6950 1900 2    50   ~ 10
08
Text Notes 6950 2000 2    50   ~ 10
09
Text Notes 6950 2100 2    50   ~ 10
0A
Text Notes 6950 2200 2    50   ~ 10
0B\n
Text Notes 6950 2300 2    50   ~ 10
0C
Text Notes 6950 2400 2    50   ~ 10
0D
Text Notes 6950 2500 2    50   ~ 10
0E
Text Notes 6950 2600 2    50   ~ 10
0F
Text Notes 6950 3050 2    50   ~ 10
10
Text Notes 6950 3150 2    50   ~ 10
11
Text Notes 6950 3250 2    50   ~ 10
12
Text Notes 6950 3350 2    50   ~ 10
13
Text Notes 6950 3450 2    50   ~ 10
14
Text Notes 6950 3550 2    50   ~ 10
15
Text Notes 6950 3650 2    50   ~ 10
16
Text Notes 6950 3750 2    50   ~ 10
17
Text Notes 6950 3950 2    50   ~ 10
19
Text Notes 6950 4050 2    50   ~ 10
1A
Text Notes 6950 4150 2    50   ~ 10
1B
Text Notes 6950 4250 2    50   ~ 10
1C
Text Notes 6950 4350 2    50   ~ 10
1D
Text Notes 6950 4450 2    50   ~ 10
1E
Text Notes 6950 4550 2    50   ~ 10
1F
Text Label 900  3150 2    50   ~ 0
~PANELEN
Text HLabel 450  3150 0    50   Input ~ 0
~PANELEN
Entry Wire Line
	2050 1700 2150 1800
Entry Wire Line
	2050 1800 2150 1900
Wire Wire Line
	2150 1800 2450 1800
Wire Wire Line
	2150 1900 2450 1900
Text Label 2250 1900 0    50   ~ 0
FPA7
Text Label 2250 1800 0    50   ~ 0
FPA6
Text Notes 2300 2750 0    50   ~ 0
ROW₁ to ROW₅ are decoded strobes\nfor the front panel modules. The\nappropriate module is enabled for\nwriting using address FA₀–FA₁ and\nthe desired 8-bit register on that\nmodule is clocked using the ~ROW~\nstrobes.
Text Notes 2300 3800 0    50   ~ 0
When ~PANELEN~ is de-asserted,\nthe MCU can control the front panel\nlights directly.\n\n~PANELEN~ should ALWAYS be\nde-asserted when writing to MCU\naddresses &00–&03F.
Wire Wire Line
	2450 1700 2400 1700
Wire Notes Line width 24 style solid
	2200 3000 450  3000
Wire Notes Line width 24 style solid
	450  900  2200 900 
Text Notes 550  1750 0    63   ~ 13
Erratum, rev. A (1930)
Wire Notes Line width 24 style solid
	450  3000 450  900 
Text Label 1050 1450 0    50   ~ 0
~AUTOSCAN
Text Label 1050 1350 0    50   ~ 0
~WR
Text HLabel 1000 1450 0    50   Input ~ 0
~AUTOSCAN
Text HLabel 1000 1350 0    50   Input ~ 0
~WR
Wire Wire Line
	1450 1450 1000 1450
Wire Wire Line
	1450 1350 1000 1350
Wire Notes Line width 24 style solid
	2200 3000 2200 900 
Text Notes 550  2900 0    50   ~ 0
In XMem mode, the Atmega drives its\naddress bus all the time, but the '138\ndecoder in Rev. A of the board isn't\ngated, so the front panel shows the\ninner workings of the Atmega instead\nof the CFT!\n\nU1202 should be gated such that it\nstrobes ~ROWx~ when either ~SCANEN~ or\nthe Atmega's ~WR~ signal is asserted.\n\nNote: this removes the (unused)\n‘snoop-update’ mode of the FP.
Text Notes 6950 1100 2    50   ~ 10
00
Wire Wire Line
	6250 1100 6650 1100
Wire Wire Line
	6250 1200 6650 1200
Wire Wire Line
	6250 1300 6650 1300
Wire Wire Line
	6250 1400 6650 1400
Wire Wire Line
	6250 1500 6650 1500
Wire Wire Line
	6250 1600 6650 1600
Wire Wire Line
	6250 1700 6650 1700
Wire Wire Line
	6250 1800 6650 1800
Wire Wire Line
	6250 1900 6650 1900
Wire Wire Line
	6250 2000 6650 2000
Wire Wire Line
	6250 2100 6650 2100
Wire Wire Line
	6250 2200 6650 2200
Wire Wire Line
	6250 2300 6650 2300
Wire Wire Line
	6250 2400 6650 2400
Wire Wire Line
	6250 2500 6650 2500
Wire Wire Line
	6250 2600 6650 2600
Wire Wire Line
	6250 3050 6650 3050
Wire Wire Line
	6250 3150 6650 3150
Wire Wire Line
	6250 3250 6650 3250
Wire Wire Line
	6250 3350 6650 3350
Wire Wire Line
	6250 3450 6650 3450
Wire Wire Line
	6250 3550 6650 3550
Wire Wire Line
	6250 3650 6650 3650
Wire Wire Line
	6250 3750 6650 3750
Wire Wire Line
	6250 3850 6650 3850
Wire Wire Line
	6250 3950 6650 3950
Wire Wire Line
	6250 4050 6650 4050
Wire Wire Line
	6250 4150 6650 4150
Wire Wire Line
	6250 4250 6650 4250
Wire Wire Line
	6250 4350 6650 4350
Wire Wire Line
	6250 4450 6650 4450
Wire Wire Line
	6250 4550 6650 4550
Entry Wire Line
	6650 1100 6750 1200
Entry Wire Line
	6650 1200 6750 1300
Entry Wire Line
	6650 1300 6750 1400
Entry Wire Line
	6650 1400 6750 1500
Entry Wire Line
	6650 1500 6750 1600
Entry Wire Line
	6650 1600 6750 1700
Entry Wire Line
	6650 1700 6750 1800
Entry Wire Line
	6650 1800 6750 1900
Entry Wire Line
	6650 1900 6750 2000
Entry Wire Line
	6650 2000 6750 2100
Entry Wire Line
	6650 2100 6750 2200
Entry Wire Line
	6650 2200 6750 2300
Entry Wire Line
	6650 2300 6750 2400
Entry Wire Line
	6650 2400 6750 2500
Entry Wire Line
	6650 2500 6750 2600
Entry Wire Line
	6650 2600 6750 2700
Entry Wire Line
	6650 3050 6750 3150
Entry Wire Line
	6650 3150 6750 3250
Entry Wire Line
	6650 3250 6750 3350
Entry Wire Line
	6650 3350 6750 3450
Entry Wire Line
	6650 3450 6750 3550
Entry Wire Line
	6650 3550 6750 3650
Entry Wire Line
	6650 3650 6750 3750
Entry Wire Line
	6650 3750 6750 3850
Entry Wire Line
	6650 3850 6750 3950
Entry Wire Line
	6650 3950 6750 4050
Entry Wire Line
	6650 4050 6750 4150
Entry Wire Line
	6650 4150 6750 4250
Entry Wire Line
	6650 4250 6750 4350
Entry Wire Line
	6650 4350 6750 4450
Entry Wire Line
	6650 4450 6750 4550
Entry Wire Line
	6650 4550 6750 4650
Text Notes 6950 3850 2    50   ~ 10
18
Entry Wire Line
	4600 1000 4700 1100
Entry Wire Line
	4600 1100 4700 1200
Entry Wire Line
	4600 1200 4700 1300
Entry Wire Line
	4600 1300 4700 1400
Entry Wire Line
	4600 1500 4700 1600
Entry Wire Line
	4600 2950 4700 3050
Entry Wire Line
	4600 3050 4700 3150
Entry Wire Line
	4600 3150 4700 3250
Entry Wire Line
	4600 3250 4700 3350
Entry Bus Bus
	4500 700  4600 800 
Wire Bus Line
	2150 700  4500 700 
Entry Bus Bus
	1950 700  2050 800 
Text Label 850  700  2    50   ~ 0
FPA[0..7]
Entry Bus Bus
	2150 700  2050 800 
Wire Bus Line
	450  700  1950 700 
Text HLabel 450  700  0    50   Input ~ 0
FPA[0..7]
Text Label 4700 2150 0    50   ~ 0
FPA4
Wire Wire Line
	4700 2150 5200 2150
Entry Wire Line
	4600 2050 4700 2150
Wire Wire Line
	5200 2150 5200 2200
Wire Wire Line
	5200 2700 5200 3550
Wire Wire Line
	5200 3550 5250 3550
Wire Bus Line
	4350 9350 4900 9350
Wire Wire Line
	450  3150 4450 3150
Wire Wire Line
	4450 3650 4450 3150
Wire Wire Line
	4450 3650 5250 3650
Wire Wire Line
	4450 1950 4700 1700
Wire Wire Line
	4700 1700 5250 1700
Text Label 4450 3050 1    50   ~ 0
~PANELEN
NoConn ~ 3450 1700
NoConn ~ 3450 1800
Wire Wire Line
	1900 1400 2400 1400
Wire Wire Line
	2400 1400 2400 1700
Text HLabel 1300 11650 0    50   Input ~ 0
MFD0
Text Notes 1600 6100 0    100  ~ 20
Multi-Function Display
Text Notes 6100 800  0    100  ~ 20
Front-Panel Address Decoder
Connection ~ 4450 3150
Wire Wire Line
	4450 3150 4450 1950
Text Label 1350 4700 0    50   ~ 0
~LED-STOP
Text Label 1350 5200 0    50   ~ 0
~RSTHOLD
Text Label 1350 5300 0    50   ~ 0
~IRQS
Text Label 1350 4600 0    50   ~ 0
STEP∕~RUN
Wire Wire Line
	1800 5600 1750 5600
Wire Wire Line
	1750 5650 1750 5600
$Comp
L power:GND #PWR?
U 1 1 6A5C4772
P 1750 5650
AR Path="/6A5C4772" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6A5C4772" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6A5C4772" Ref="#PWR?"  Part="1" 
AR Path="/65BD1B6F/6A5C4772" Ref="#PWR0182"  Part="1" 
F 0 "#PWR0182" H 1750 5400 50  0001 C CNN
F 1 "GND" H 1755 5477 50  0000 C CNN
F 2 "" H 1750 5650 50  0001 C CNN
F 3 "" H 1750 5650 50  0001 C CNN
	1    1750 5650
	1    0    0    -1  
$EndComp
Text Label 1350 5000 0    50   ~ 0
~LED-EXEC
Text Label 1350 4900 0    50   ~ 0
~LED-FETCH
Text Label 1350 4800 0    50   ~ 0
~WS
Text Label 3000 5300 2    50   ~ 0
FPD7
Text Label 3000 5200 2    50   ~ 0
FPD6
Text Label 3000 5100 2    50   ~ 0
FPD5
Text Label 3000 5000 2    50   ~ 0
FPD4
Text Label 3000 4900 2    50   ~ 0
FPD3
Text Label 3000 4800 2    50   ~ 0
FPD2
Text Label 3000 4700 2    50   ~ 0
FPD1
Text Label 3000 4600 2    50   ~ 0
FPD0
Text Label 1250 5500 0    50   ~ 0
~FPSTATE
Text Notes 1500 4250 0    100  ~ 20
State Lights (~FPOE16~)
Wire Wire Line
	1250 5200 1800 5200
Wire Wire Line
	1250 4600 1800 4600
Wire Wire Line
	1250 4700 1800 4700
Wire Wire Line
	1250 4800 1800 4800
Wire Wire Line
	1250 4900 1800 4900
Wire Wire Line
	1250 5000 1800 5000
Wire Wire Line
	1250 5300 1800 5300
Text HLabel 1250 5200 0    50   Input ~ 0
~RSTHOLD
Text HLabel 1250 4600 0    50   Input ~ 0
STEP∕~RUN
Text HLabel 1250 4700 0    50   Input ~ 0
~LED-STOP
Text HLabel 1250 4800 0    50   Input ~ 0
~WS
Text HLabel 1250 4900 0    50   Input ~ 0
~LED-FETCH
Text HLabel 1250 5000 0    50   Input ~ 0
~LED-EXEC
Text HLabel 1250 5300 0    50   Input ~ 0
~IRQS
$Comp
L Device:C_Small C?
U 1 1 6AEB8989
P 4400 6100
AR Path="/6AEB8989" Ref="C?"  Part="1" 
AR Path="/6233F88C/6AEB8989" Ref="C?"  Part="1" 
AR Path="/60757845/607964B6/6AEB8989" Ref="C?"  Part="1" 
AR Path="/64FC7999/650046D0/6AEB8989" Ref="C?"  Part="1" 
AR Path="/65BD1B6F/6AEB8989" Ref="C38"  Part="1" 
F 0 "C38" H 4309 6146 50  0000 R CNN
F 1 "100nF" H 4309 6055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4400 6100 50  0001 C CNN
F 3 "~" H 4400 6100 50  0001 C CNN
	1    4400 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0183
U 1 1 6AEB898F
P 4400 6000
F 0 "#PWR0183" H 4400 5850 50  0001 C CNN
F 1 "+5V" H 4415 6173 50  0000 C CNN
F 2 "" H 4400 6000 50  0001 C CNN
F 3 "" H 4400 6000 50  0001 C CNN
	1    4400 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0184
U 1 1 6AEB8995
P 4400 6200
F 0 "#PWR0184" H 4400 5950 50  0001 C CNN
F 1 "GND" H 4405 6027 50  0000 C CNN
F 2 "" H 4400 6200 50  0001 C CNN
F 3 "" H 4400 6200 50  0001 C CNN
	1    4400 6200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G00 U33
U 1 1 6AFE1F5D
P 1750 1400
F 0 "U33" H 1675 1667 50  0000 C CNN
F 1 "74LVC1G00" H 1675 1576 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1400 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G00.pdf" H 1400 1400 50  0001 C CNN
	1    1750 1400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC540 U38
U 1 1 6AFE7216
P 2300 5100
F 0 "U38" H 2300 5867 50  0000 C CNN
F 1 "74HC540" H 2300 5776 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2300 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC540" H 2300 5100 50  0001 C CNN
	1    2300 5100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G00 U33
U 2 1 6B647B36
P 6250 6050
F 0 "U33" H 6330 5996 50  0000 L CNN
F 1 "74LVC1G00" H 6330 5905 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5900 6050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G00.pdf" H 5900 6050 50  0001 C CNN
	2    6250 6050
	1    0    0    -1  
$EndComp
Connection ~ 5800 6250
Connection ~ 5800 6050
$Comp
L alexios:74HC138 U34
U 2 1 6B64860C
P 6150 6900
F 0 "U34" H 6330 6946 50  0000 L CNN
F 1 "74HC138" H 6330 6855 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6150 6900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H 6150 6900 50  0001 C CNN
F 4 "Yes" H 6075 6075 50  0001 C CNN "Verified"
	2    6150 6900
	1    0    0    -1  
$EndComp
Connection ~ 5800 6800
Connection ~ 5800 7000
$Comp
L alexios:74HC540 U38
U 2 1 6B64B236
P 4750 6100
F 0 "U38" H 4930 6146 50  0000 L CNN
F 1 "74HC540" H 4930 6055 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4750 6100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC540" H 4750 6100 50  0001 C CNN
	2    4750 6100
	1    0    0    -1  
$EndComp
Connection ~ 4400 6200
Connection ~ 4400 6000
$Comp
L Device:C_Small C?
U 1 1 6BA49249
P 7200 6150
AR Path="/6BA49249" Ref="C?"  Part="1" 
AR Path="/6233F88C/6BA49249" Ref="C?"  Part="1" 
AR Path="/60757845/607964B6/6BA49249" Ref="C?"  Part="1" 
AR Path="/64FC7999/650046D0/6BA49249" Ref="C?"  Part="1" 
AR Path="/65BD1B6F/6BA49249" Ref="C35"  Part="1" 
F 0 "C35" H 7109 6196 50  0000 R CNN
F 1 "100nF" H 7109 6105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7200 6150 50  0001 C CNN
F 3 "~" H 7200 6150 50  0001 C CNN
	1    7200 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0209
U 1 1 6BA4924F
P 7200 6050
F 0 "#PWR0209" H 7200 5900 50  0001 C CNN
F 1 "+5V" H 7215 6223 50  0000 C CNN
F 2 "" H 7200 6050 50  0001 C CNN
F 3 "" H 7200 6050 50  0001 C CNN
	1    7200 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0210
U 1 1 6BA49255
P 7200 6250
F 0 "#PWR0210" H 7200 6000 50  0001 C CNN
F 1 "GND" H 7205 6077 50  0000 C CNN
F 2 "" H 7200 6250 50  0001 C CNN
F 3 "" H 7200 6250 50  0001 C CNN
	1    7200 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4600 3050 4600
Wire Wire Line
	2800 4700 3050 4700
Wire Wire Line
	2800 4800 3050 4800
Wire Wire Line
	2800 4900 3050 4900
Wire Wire Line
	2800 5000 3050 5000
Wire Wire Line
	2800 5100 3050 5100
Wire Wire Line
	2800 5200 3050 5200
Wire Wire Line
	2800 5300 3050 5300
Entry Wire Line
	3050 4600 3150 4700
Entry Wire Line
	3050 4700 3150 4800
Entry Wire Line
	3050 4800 3150 4900
Entry Wire Line
	3050 4900 3150 5000
Entry Wire Line
	3050 5000 3150 5100
Entry Wire Line
	3050 5100 3150 5200
Entry Wire Line
	3050 5200 3150 5300
Entry Wire Line
	3050 5300 3150 5400
Entry Bus Bus
	3150 5450 3250 5550
Wire Bus Line
	3250 5550 7600 5550
Text HLabel 7600 5550 2    50   Output ~ 0
FPD[0..7]
Text Label 7500 5550 2    50   ~ 0
FPD[0..7]
Text Label 4300 1100 2    50   ~ 0
~ROW1
Text Label 4300 1200 2    50   ~ 0
~ROW2
Text Label 4300 1300 2    50   ~ 0
~ROW3
Text Label 4300 1400 2    50   ~ 0
~ROW4
Text Label 4300 1500 2    50   ~ 0
~ROW5
Text HLabel 1300 11750 0    50   Input ~ 0
MFD1
NoConn ~ 3450 1600
$Comp
L alexios:74HC138 U34
U 1 1 6AFE3EEE
P 2950 1500
F 0 "U34" H 2950 2167 50  0000 C CNN
F 1 "74HC138" H 2950 2076 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 2950 1500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H 2950 1500 50  0001 C CNN
F 4 "Yes" H 2875 675 50  0001 C CNN "Verified"
	1    2950 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1500 3550 1500
Wire Wire Line
	3450 1100 3550 1100
Wire Wire Line
	3450 1200 3550 1200
Wire Wire Line
	3450 1300 3550 1300
Wire Wire Line
	3450 1400 3550 1400
$Comp
L Device:R_Small R?
U 1 1 64196A39
P 3650 1100
AR Path="/614F5B8D/64196A39" Ref="R?"  Part="1" 
AR Path="/65BD1B6F/64196A39" Ref="R901"  Part="1" 
F 0 "R901" V 3600 1200 50  0000 L CNN
F 1 "1kΩ?" V 3550 1100 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 1100 50  0001 C CNN
F 3 "~" H 3650 1100 50  0001 C CNN
	1    3650 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 1100 4300 1100
$Comp
L Device:R_Small R?
U 1 1 642B7233
P 3650 1200
AR Path="/614F5B8D/642B7233" Ref="R?"  Part="1" 
AR Path="/65BD1B6F/642B7233" Ref="R902"  Part="1" 
F 0 "R902" V 3600 1300 50  0000 L CNN
F 1 "1kΩ?" V 3550 1200 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 1200 50  0001 C CNN
F 3 "~" H 3650 1200 50  0001 C CNN
	1    3650 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 1200 4300 1200
Wire Wire Line
	3750 1300 4300 1300
Wire Wire Line
	3750 1400 4300 1400
Wire Wire Line
	3750 1500 4300 1500
$Comp
L Device:R_Small R?
U 1 1 644F91ED
P 3650 1300
AR Path="/614F5B8D/644F91ED" Ref="R?"  Part="1" 
AR Path="/65BD1B6F/644F91ED" Ref="R903"  Part="1" 
F 0 "R903" V 3600 1400 50  0000 L CNN
F 1 "1kΩ?" V 3550 1300 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 1300 50  0001 C CNN
F 3 "~" H 3650 1300 50  0001 C CNN
	1    3650 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 644F9382
P 3650 1400
AR Path="/614F5B8D/644F9382" Ref="R?"  Part="1" 
AR Path="/65BD1B6F/644F9382" Ref="R904"  Part="1" 
F 0 "R904" V 3600 1500 50  0000 L CNN
F 1 "1kΩ?" V 3550 1400 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 1400 50  0001 C CNN
F 3 "~" H 3650 1400 50  0001 C CNN
	1    3650 1400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 644F94C4
P 3650 1500
AR Path="/614F5B8D/644F94C4" Ref="R?"  Part="1" 
AR Path="/65BD1B6F/644F94C4" Ref="R905"  Part="1" 
F 0 "R905" V 3600 1600 50  0000 L CNN
F 1 "1kΩ?" V 3550 1500 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 1500 50  0001 C CNN
F 3 "~" H 3650 1500 50  0001 C CNN
	1    3650 1500
	0    1    1    0   
$EndComp
$Comp
L alexios:ATF16V8B U1901
U 1 1 63738EA1
P 2200 10000
F 0 "U1901" H 2200 10750 50  0000 C CNN
F 1 "ATF16V8B" H 2200 10650 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2200 10000 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2200 10000 50  0001 C CNN
F 4 "DFPOEA" V 2200 10050 50  0000 C CNB "Signature"
F 5 "dfp-fpoea.jed" H 2200 9350 50  0000 C CNN "Image Filename"
	1    2200 10000
	1    0    0    -1  
$EndComp
Text Label 1400 9950 0    50   ~ 0
FPA4
Text Label 1400 9850 0    50   ~ 0
FPA3
Text Label 1400 9750 0    50   ~ 0
FPA2
Wire Wire Line
	1400 9750 1750 9750
Wire Wire Line
	1400 9850 1750 9850
Wire Wire Line
	1400 9950 1750 9950
Wire Wire Line
	1750 9650 1400 9650
Wire Wire Line
	1750 9550 1400 9550
Text Label 1400 9550 0    50   ~ 0
FPA0
Text Label 1400 9650 0    50   ~ 0
FPA1
Wire Wire Line
	1750 10050 1400 10050
Text Label 1400 10050 0    50   ~ 0
FPA5
Wire Wire Line
	1750 10150 1400 10150
Text Label 1400 10150 0    50   ~ 0
MFD0
Text Label 1400 10250 0    50   ~ 0
MFD1
Wire Wire Line
	1750 10250 1400 10250
$Comp
L alexios:ATF16V8B U1902
U 1 1 64ADDAFB
P 2150 11500
F 0 "U1902" H 2150 12250 50  0000 C CNN
F 1 "ATF16V8B" H 2150 12150 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2150 11500 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2150 11500 50  0001 C CNN
F 4 "DFPOEB" V 2150 11550 50  0000 C CNB "Signature"
F 5 "dfp-fpoeb.jed" H 2150 10850 50  0000 C CNN "Image Filename"
	1    2150 11500
	1    0    0    -1  
$EndComp
$Comp
L alexios:ATF16V8B U1903
U 1 1 64E5A41B
P 2150 13050
F 0 "U1903" H 2150 13800 50  0000 C CNN
F 1 "ATF16V8B" H 2150 13700 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2150 13050 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2150 13050 50  0001 C CNN
F 4 "DFPOEC" V 2150 13100 50  0000 C CNB "Signature"
F 5 "dfp-fpoec.jed" H 2150 12400 50  0000 C CNN "Image Filename"
	1    2150 13050
	1    0    0    -1  
$EndComp
$Comp
L alexios:ATF16V8B U1904
U 1 1 64EF18CE
P 2150 14550
F 0 "U1904" H 2150 15300 50  0000 C CNN
F 1 "ATF16V8B" H 2150 15200 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2150 14550 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2150 14550 50  0001 C CNN
F 4 "DFPOED" V 2150 14600 50  0000 C CNB "Signature"
F 5 "dfp-fpoed.jed" H 2150 13900 50  0000 C CNN "Image Filename"
	1    2150 14550
	1    0    0    -1  
$EndComp
$Comp
L alexios:ATF16V8B U1901
U 2 1 668CB4F9
P 4950 10450
F 0 "U1901" H 5130 10496 50  0000 L CNN
F 1 "ATF16V8B" H 5130 10405 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4950 10450 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4950 10450 50  0001 C CNN
F 4 "DFPOEA" H 5130 10405 50  0001 L CNB "Signature"
F 5 "dfp-fpoea.jed" H 5130 10314 50  0001 L CNN "Image Filename"
	2    4950 10450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 668CCEC7
P 4600 10450
AR Path="/668CCEC7" Ref="C?"  Part="1" 
AR Path="/6233F88C/668CCEC7" Ref="C?"  Part="1" 
AR Path="/60757845/607964B6/668CCEC7" Ref="C?"  Part="1" 
AR Path="/64FC7999/650046D0/668CCEC7" Ref="C?"  Part="1" 
AR Path="/65BD1B6F/668CCEC7" Ref="C1901"  Part="1" 
F 0 "C1901" H 4509 10496 50  0000 R CNN
F 1 "100nF" H 4509 10405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 10450 50  0001 C CNN
F 3 "~" H 4600 10450 50  0001 C CNN
	1    4600 10450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0233
U 1 1 668CCECD
P 4600 10350
F 0 "#PWR0233" H 4600 10200 50  0001 C CNN
F 1 "+5V" H 4615 10523 50  0000 C CNN
F 2 "" H 4600 10350 50  0001 C CNN
F 3 "" H 4600 10350 50  0001 C CNN
	1    4600 10350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0234
U 1 1 668CCED3
P 4600 10550
F 0 "#PWR0234" H 4600 10300 50  0001 C CNN
F 1 "GND" H 4605 10377 50  0000 C CNN
F 2 "" H 4600 10550 50  0001 C CNN
F 3 "" H 4600 10550 50  0001 C CNN
	1    4600 10550
	1    0    0    -1  
$EndComp
Connection ~ 4600 10350
Connection ~ 4600 10550
$Comp
L alexios:ATF16V8B U1902
U 2 1 66AA11BC
P 4950 11950
F 0 "U1902" H 5130 11996 50  0000 L CNN
F 1 "ATF16V8B" H 5130 11905 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4950 11950 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4950 11950 50  0001 C CNN
F 4 "DFPOEA" H 5130 11905 50  0001 L CNB "Signature"
F 5 "dfp-fpoea.jed" H 5130 11814 50  0001 L CNN "Image Filename"
	2    4950 11950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 66AA11C2
P 4600 11950
AR Path="/66AA11C2" Ref="C?"  Part="1" 
AR Path="/6233F88C/66AA11C2" Ref="C?"  Part="1" 
AR Path="/60757845/607964B6/66AA11C2" Ref="C?"  Part="1" 
AR Path="/64FC7999/650046D0/66AA11C2" Ref="C?"  Part="1" 
AR Path="/65BD1B6F/66AA11C2" Ref="C1902"  Part="1" 
F 0 "C1902" H 4509 11996 50  0000 R CNN
F 1 "100nF" H 4509 11905 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 11950 50  0001 C CNN
F 3 "~" H 4600 11950 50  0001 C CNN
	1    4600 11950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0235
U 1 1 66AA11C8
P 4600 11850
F 0 "#PWR0235" H 4600 11700 50  0001 C CNN
F 1 "+5V" H 4615 12023 50  0000 C CNN
F 2 "" H 4600 11850 50  0001 C CNN
F 3 "" H 4600 11850 50  0001 C CNN
	1    4600 11850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0236
U 1 1 66AA11CE
P 4600 12050
F 0 "#PWR0236" H 4600 11800 50  0001 C CNN
F 1 "GND" H 4605 11877 50  0000 C CNN
F 2 "" H 4600 12050 50  0001 C CNN
F 3 "" H 4600 12050 50  0001 C CNN
	1    4600 12050
	1    0    0    -1  
$EndComp
Connection ~ 4600 11850
Connection ~ 4600 12050
$Comp
L alexios:ATF16V8B U1903
U 2 1 66B3DA7F
P 4950 13450
F 0 "U1903" H 5130 13496 50  0000 L CNN
F 1 "ATF16V8B" H 5130 13405 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4950 13450 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4950 13450 50  0001 C CNN
F 4 "DFPOEA" H 5130 13405 50  0001 L CNB "Signature"
F 5 "dfp-fpoea.jed" H 5130 13314 50  0001 L CNN "Image Filename"
	2    4950 13450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 66B3DA85
P 4600 13450
AR Path="/66B3DA85" Ref="C?"  Part="1" 
AR Path="/6233F88C/66B3DA85" Ref="C?"  Part="1" 
AR Path="/60757845/607964B6/66B3DA85" Ref="C?"  Part="1" 
AR Path="/64FC7999/650046D0/66B3DA85" Ref="C?"  Part="1" 
AR Path="/65BD1B6F/66B3DA85" Ref="C1903"  Part="1" 
F 0 "C1903" H 4509 13496 50  0000 R CNN
F 1 "100nF" H 4509 13405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 13450 50  0001 C CNN
F 3 "~" H 4600 13450 50  0001 C CNN
	1    4600 13450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0237
U 1 1 66B3DA8B
P 4600 13350
F 0 "#PWR0237" H 4600 13200 50  0001 C CNN
F 1 "+5V" H 4615 13523 50  0000 C CNN
F 2 "" H 4600 13350 50  0001 C CNN
F 3 "" H 4600 13350 50  0001 C CNN
	1    4600 13350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0238
U 1 1 66B3DA91
P 4600 13550
F 0 "#PWR0238" H 4600 13300 50  0001 C CNN
F 1 "GND" H 4605 13377 50  0000 C CNN
F 2 "" H 4600 13550 50  0001 C CNN
F 3 "" H 4600 13550 50  0001 C CNN
	1    4600 13550
	1    0    0    -1  
$EndComp
Connection ~ 4600 13350
Connection ~ 4600 13550
$Comp
L alexios:ATF16V8B U1904
U 2 1 66BD92F2
P 4950 14950
F 0 "U1904" H 5130 14996 50  0000 L CNN
F 1 "ATF16V8B" H 5130 14905 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4950 14950 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 4950 14950 50  0001 C CNN
F 4 "DFPOEA" H 5130 14905 50  0001 L CNB "Signature"
F 5 "dfp-fpoea.jed" H 5130 14814 50  0001 L CNN "Image Filename"
	2    4950 14950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 66BD92F8
P 4600 14950
AR Path="/66BD92F8" Ref="C?"  Part="1" 
AR Path="/6233F88C/66BD92F8" Ref="C?"  Part="1" 
AR Path="/60757845/607964B6/66BD92F8" Ref="C?"  Part="1" 
AR Path="/64FC7999/650046D0/66BD92F8" Ref="C?"  Part="1" 
AR Path="/65BD1B6F/66BD92F8" Ref="C1904"  Part="1" 
F 0 "C1904" H 4509 14996 50  0000 R CNN
F 1 "100nF" H 4509 14905 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 14950 50  0001 C CNN
F 3 "~" H 4600 14950 50  0001 C CNN
	1    4600 14950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0239
U 1 1 66BD92FE
P 4600 14850
F 0 "#PWR0239" H 4600 14700 50  0001 C CNN
F 1 "+5V" H 4615 15023 50  0000 C CNN
F 2 "" H 4600 14850 50  0001 C CNN
F 3 "" H 4600 14850 50  0001 C CNN
	1    4600 14850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0240
U 1 1 66BD9304
P 4600 15050
F 0 "#PWR0240" H 4600 14800 50  0001 C CNN
F 1 "GND" H 4605 14877 50  0000 C CNN
F 2 "" H 4600 15050 50  0001 C CNN
F 3 "" H 4600 15050 50  0001 C CNN
	1    4600 15050
	1    0    0    -1  
$EndComp
Connection ~ 4600 14850
Connection ~ 4600 15050
$Comp
L power:+5V #PWR0128
U 1 1 61BD34DB
P 1800 5100
F 0 "#PWR0128" H 1800 4950 50  0001 C CNN
F 1 "+5V" V 1815 5228 50  0000 L CNN
F 2 "" H 1800 5100 50  0001 C CNN
F 3 "" H 1800 5100 50  0001 C CNN
	1    1800 5100
	0    -1   -1   0   
$EndComp
Text Notes 2000 5800 0    50   ~ 0
Checked for Panel v.11.
Wire Wire Line
	1400 10450 1750 10450
Text Label 1400 10450 0    50   ~ 0
~PANELEN
Wire Wire Line
	1750 10350 1400 10350
Text Label 1400 10350 0    50   ~ 0
MFD2
Text Label 1350 11450 0    50   ~ 0
FPA4
Text Label 1350 11350 0    50   ~ 0
FPA3
Text Label 1350 11250 0    50   ~ 0
FPA2
Wire Wire Line
	1350 11250 1700 11250
Wire Wire Line
	1350 11350 1700 11350
Wire Wire Line
	1350 11450 1700 11450
Wire Wire Line
	1700 11150 1350 11150
Wire Wire Line
	1700 11050 1350 11050
Text Label 1350 11050 0    50   ~ 0
FPA0
Text Label 1350 11150 0    50   ~ 0
FPA1
Wire Wire Line
	1700 11550 1350 11550
Text Label 1350 11550 0    50   ~ 0
FPA5
Wire Wire Line
	1700 11650 1300 11650
Text Label 1350 11650 0    50   ~ 0
MFD0
Text Label 1350 11750 0    50   ~ 0
MFD1
Wire Wire Line
	1700 11750 1300 11750
Wire Wire Line
	1350 11950 1700 11950
Text Label 1350 11950 0    50   ~ 0
~PANELEN
Wire Wire Line
	1700 11850 1300 11850
Text Label 1350 11850 0    50   ~ 0
MFD2
Text Label 1350 13000 0    50   ~ 0
FPA4
Text Label 1350 12900 0    50   ~ 0
FPA3
Text Label 1350 12800 0    50   ~ 0
FPA2
Wire Wire Line
	1350 12800 1700 12800
Wire Wire Line
	1350 12900 1700 12900
Wire Wire Line
	1350 13000 1700 13000
Wire Wire Line
	1700 12700 1350 12700
Wire Wire Line
	1700 12600 1350 12600
Text Label 1350 12600 0    50   ~ 0
FPA0
Text Label 1350 12700 0    50   ~ 0
FPA1
Wire Wire Line
	1700 13100 1350 13100
Text Label 1350 13100 0    50   ~ 0
FPA5
Wire Wire Line
	1700 13200 1350 13200
Text Label 1350 13200 0    50   ~ 0
MFD0
Text Label 1350 13300 0    50   ~ 0
MFD1
Wire Wire Line
	1700 13300 1350 13300
Wire Wire Line
	1350 13500 1700 13500
Text Label 1350 13500 0    50   ~ 0
~PANELEN
Wire Wire Line
	1700 13400 1350 13400
Text Label 1350 13400 0    50   ~ 0
MFD2
Text Label 1350 14500 0    50   ~ 0
FPA4
Text Label 1350 14400 0    50   ~ 0
FPA3
Text Label 1350 14300 0    50   ~ 0
FPA2
Wire Wire Line
	1350 14300 1700 14300
Wire Wire Line
	1350 14400 1700 14400
Wire Wire Line
	1350 14500 1700 14500
Wire Wire Line
	1700 14200 1350 14200
Wire Wire Line
	1700 14100 1350 14100
Text Label 1350 14100 0    50   ~ 0
FPA0
Text Label 1350 14200 0    50   ~ 0
FPA1
Wire Wire Line
	1700 14600 1350 14600
Text Label 1350 14600 0    50   ~ 0
FPA5
Wire Wire Line
	1700 14700 1350 14700
Text Label 1350 14700 0    50   ~ 0
MFD0
Text Label 1350 14800 0    50   ~ 0
MFD1
Wire Wire Line
	1700 14800 1350 14800
Wire Wire Line
	1350 15000 1700 15000
Text Label 1350 15000 0    50   ~ 0
~PANELEN
Wire Wire Line
	1700 14900 1350 14900
Text Label 1350 14900 0    50   ~ 0
MFD2
Text HLabel 1300 11850 0    50   Input ~ 0
MFD2
Wire Wire Line
	2650 9550 2700 9550
Text HLabel 2700 9550 2    50   Output ~ 0
~FPCTX
Text HLabel 2700 9650 2    50   Output ~ 0
~FPIRL
Wire Wire Line
	2650 9650 2700 9650
Wire Wire Line
	2650 9750 2700 9750
Wire Wire Line
	2650 9850 2700 9850
Wire Wire Line
	2650 9950 2700 9950
Wire Wire Line
	2650 10050 2700 10050
Wire Wire Line
	2650 10150 2700 10150
Wire Wire Line
	2650 10250 2700 10250
Text HLabel 2700 9750 2    50   Output ~ 0
~FPµA0
Text HLabel 2700 9850 2    50   Output ~ 0
~FPµC0
Text HLabel 2700 9950 2    50   Output ~ 0
~FPµC1
Text HLabel 2700 10050 2    50   Output ~ 0
~FPSPL
Text HLabel 2700 10150 2    50   Output ~ 0
~FPACL
Text HLabel 2700 10250 2    50   Output ~ 0
~FPµC2
Wire Wire Line
	2600 11050 2650 11050
Wire Wire Line
	2600 11150 2650 11150
Wire Wire Line
	2600 11250 2650 11250
Wire Wire Line
	2600 11350 2650 11350
Wire Wire Line
	2600 11450 2650 11450
Wire Wire Line
	2600 11550 2650 11550
Wire Wire Line
	2600 11650 2650 11650
Wire Wire Line
	2600 11750 2650 11750
Text HLabel 2650 11050 2    50   Output ~ 0
~FPIRH
Text HLabel 2650 11150 2    50   Output ~ 0
~FPFLAGS
Text HLabel 2650 11250 2    50   Output ~ 0
~FPAEXT
Text HLabel 2650 11350 2    50   Output ~ 0
~FPPCL
Text HLabel 2650 11450 2    50   Output ~ 0
~FPPCH
Text HLabel 2650 11550 2    50   Output ~ 0
~FPSPH
Text HLabel 2650 11650 2    50   Output ~ 0
~FPACH
Text HLabel 2650 12600 2    50   Output ~ 0
~FPDRL
Text HLabel 2650 11750 2    50   Output ~ 0
~SCANCLR
Wire Wire Line
	2600 12600 2650 12600
Wire Wire Line
	2600 12700 2650 12700
Wire Wire Line
	2600 12800 2650 12800
Wire Wire Line
	2600 12900 2650 12900
Wire Wire Line
	2600 13000 2650 13000
Wire Wire Line
	2600 13100 2650 13100
Wire Wire Line
	2600 13200 2650 13200
Wire Wire Line
	2600 13300 2650 13300
Text HLabel 2650 12700 2    50   Output ~ 0
~FPDRH
Text HLabel 2650 12800 2    50   Output ~ 0
~FPIEN
Text HLabel 2650 12900 2    50   Output ~ 0
~FPIRF
Wire Wire Line
	1250 5500 1800 5500
Wire Wire Line
	2600 14100 2650 14100
Wire Wire Line
	2600 14200 2650 14200
Wire Wire Line
	2600 14300 2650 14300
Wire Wire Line
	2600 14400 2650 14400
Wire Wire Line
	2600 14500 2650 14500
Wire Wire Line
	2600 14600 2650 14600
Wire Wire Line
	2600 14700 2650 14700
Wire Wire Line
	2600 14800 3050 14800
Text Label 3050 14800 2    50   ~ 0
~FPSTATE
Text HLabel 2650 14600 2    50   Output ~ 0
~FPORL
Text HLabel 2650 14700 2    50   Output ~ 0
~FPORH
Text HLabel 2650 14100 2    50   Output ~ 0
~FPABL
Text HLabel 2650 14200 2    50   Output ~ 0
~FPABM
Text HLabel 2650 14300 2    50   Output ~ 0
~FPABH
Text HLabel 2650 14400 2    50   Output ~ 0
~FPDBL
Text HLabel 2650 14500 2    50   Output ~ 0
~FPDBH
Wire Bus Line
	2050 800  2050 1800
Wire Bus Line
	3150 4700 3150 5450
Wire Bus Line
	4600 800  4600 3250
Wire Bus Line
	6750 1200 6750 4850
$EndSCHEMATC
