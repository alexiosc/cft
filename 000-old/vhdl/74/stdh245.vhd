--------------------------------------------------------------------------------
-- File Name : stdh245.vhd
--------------------------------------------------------------------------------
-- Copyright (C) 1997-2005 Free Model Foundry; http://www.FreeModelFoundry.com
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License version 2 as
-- published by the Free Software Foundation.
--
-- MODIFICATION HISTORY :
--
-- version: |  author:  | mod date:  | changes made:
--  V1.0      R.Munden    97 NOV 28   Conformed to style guide
--  V1.1     D.Vukicevic  05 Jun 30   Style guide: replaced tabs with spaces
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:     STNDH
--  Technology:  54/74XXXX bus hold
--  Part:        STDH245
--
--  Desciption:  TTL Transceiver with bus hold
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_primitives.all;
                 USE IEEE.VITAL_timing.all;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh245 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A          : VitalDelayType01  := VitalZeroDelay01;
        tipd_B          : VitalDelayType01  := VitalZeroDelay01;
        tipd_DIR        : VitalDelayType01  := VitalZeroDelay01;
        tipd_ENeg       : VitalDelayType01  := VitalZeroDelay01;
        -- tpd delays:
        tpd_A_B         : VitalDelayType01  := UnitDelay01;
        tpd_B_A         : VitalDelayType01  := UnitDelay01;
        tpd_DIR_A       : VitalDelayType01Z := UnitDelay01Z;
        tpd_DIR_B       : VitalDelayType01Z := UnitDelay01Z;
        tpd_ENeg_A      : VitalDelayType01Z := UnitDelay01Z;
        tpd_ENeg_B      : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        TimingChecksOn  : BOOLEAN   := DefaultTimingChecks;
        MsgOn           : BOOLEAN   := DefaultMsgOn;
        XOn             : Boolean   := DefaultXOn;
        InstancePath    : STRING    := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel     : STRING    := DefaultTimingModel
        );
    PORT (
        A               : INOUT STD_LOGIC := 'Z';
        B               : INOUT STD_LOGIC := 'Z';
        ENeg            : IN    STD_LOGIC := 'U';
        DIR             : IN    STD_LOGIC := 'U'
    );

    ATTRIBUTE VITAL_LEVEL0 of stdh245 : ENTITY IS TRUE;
END stdh245;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh245 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A_ipd            : std_ulogic := 'X';
    SIGNAL B_ipd            : std_ulogic := 'X';
    SIGNAL Aint             : std_logic  := 'X';
    SIGNAL Bint             : std_logic  := 'X';
    SIGNAL AintNeg          : std_ulogic := 'X';
    SIGNAL BintNeg          : std_ulogic := 'X';
    SIGNAL DIR_ipd          : std_ulogic := 'X';
    SIGNAL ENeg_ipd         : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w1: VitalWireDelay (A_ipd, A, tipd_A);
        w2: VitalWireDelay (B_ipd, B, tipd_B);
        w3: VitalWireDelay (DIR_ipd, DIR, tipd_DIR);
        w4: VitalWireDelay (ENeg_ipd, ENeg, tipd_ENeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUF (q => Aint, a => A_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_2: VitalINV (q => AintNeg, a => Aint);
    a_3: VitalINV (q => Aint, a => AintNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_4: VitalBUF (q => Bint, a => B_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_5: VitalINV (q => BintNeg, a => Bint);
    a_6: VitalINV (q => Bint, a => BintNeg, ResultMap => ('Z', 'Z', '0', '1'));

    ----------------------------------------------------------------------------
    -- VITALBehavior Process
    ----------------------------------------------------------------------------
    VITALBehavior1 : PROCESS(Aint, Bint, DIR_ipd, ENeg_ipd)

        -- Functionality Results Variables
        VARIABLE A_zd       : std_ulogic := 'X';
        VARIABLE B_zd       : std_ulogic := 'X';
        VARIABLE Aen_int    : std_ulogic := 'X';
        VARIABLE Ben_int    : std_ulogic := 'X';

        -- Output Glitch Detection Variables
        VARIABLE A_GlitchData : VitalGlitchDataType;
        VARIABLE B_GlitchData : VitalGlitchDataType;

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Aen_int := VitalAND2(a=> NOT(DIR_ipd), b => NOT(ENeg_ipd));
        Ben_int := VitalAND2(a=> DIR_ipd, b => NOT(ENeg_ipd));

        A_zd := VitalBUFIF1 (data => Bint, enable => Aen_int );
        B_zd := VitalBUFIF1 (data => Aint, enable => Ben_int );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       =>  A,
            OutSignalName   =>  "A",
            OutTemp         =>  A_zd,
            Paths           => (
                0 => (InputChangeTime   => Bint'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B_A),
                      PathCondition     => (Aen_int = '1')),
                1 => (InputChangeTime   => DIR_ipd'LAST_EVENT,
                      PathDelay         => tpd_DIR_A,
                      PathCondition     => TRUE ),
                2 => (InputChangeTime   => ENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_ENeg_A,
                      PathCondition     => TRUE ) ),
            GlitchData      => A_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  B,
            OutSignalName   =>  "B",
            OutTemp         =>  B_zd,
            Paths           => (
                0 => (InputChangeTime   => Aint'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => (Ben_int = '1')),
                1 => (InputChangeTime   => DIR_ipd'LAST_EVENT,
                      PathDelay         => tpd_DIR_B,
                      PathCondition     => TRUE ),
                2 => (InputChangeTime   => ENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_ENeg_B,
                      PathCondition     => TRUE ) ),
            GlitchData      => B_GlitchData );

    END PROCESS;

END vhdl_behavioral;
