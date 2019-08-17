Use IBUS snooping to glean machine state.

* Done: ~FPACH
* Done: ~FPACL
* Done: ~FPAEXT
* MFD: ~FPDRH
* MFD: ~FPDRL
* Done: ~FPFLAGS
* Done: ~FPIRH
* Done: ~FPIRL
* Done: ~FPPCH
* Done: ~FPPCL
* MFD: ~FPSPH
* MFD: ~FPSPL
* MFD: ~FPµA0
* MFD: ~FPµA1
* MFD: ~FPµA2
* Done: ~FPµC0
* Done: ~FPµC1
* Done: ~FPµC2

Add: OR (MFD)
Add: state LEDs.
Add: 4 or 5 8-bit signals for rightmost module

Bussed stuff sampled directly on the DFP:

IBUS
AB
DB
AEXT (so no AEXT buffers needed on AR board?)


| Row | Mod0   | Mod1 | Mod2 | Mod3 |
|-----|--------|------|------|------|
| 0   | µC2    | µC1  | µC2  |      |
| 1   | AEXT   | PCH  | PCL  |      |
| 2   | FLAGS  | ACH  | ACL  |      |
| 3   | MFD2   | MFD1 | MFD0 |      |
| 4   | +State | IRH  | IRL  |      |


Need to add to FP:

* SP
* MB0-7? (but where?)
* 
