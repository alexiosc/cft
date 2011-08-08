--------------------------------------------------------------------------------
--  File Name: stdh241.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2005-2007 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: | author:      | mod date: | changes made:
--    V1.0    D. Lukovic      05 Jun 29   initial release
--    V1.1    D. Stanojkovic  07 Jun 11   changed names of tpd delays
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    STNDH
--  Technology: 54/74XXXX
--  Part:       STDH241
--
--  Description: Octal buffers/drivers with 3-state output and bus hold
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh241 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A1                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE1Neg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE2                  : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A1_Y1                 : VitalDelayType01  := UnitDelay01;
        tpd_OE1Neg_Y1             : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        InstancePath              : STRING   := DefaultInstancePath;
        MsgOn                     : BOOLEAN   := DefaultMsgOn;
        XOn                       : BOOLEAN   := DefaultXOn;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y1               : OUT   std_ulogic := 'U';
        A1               : IN    std_ulogic := 'U';
        OE1Neg           : IN    std_ulogic := 'U';
        Y2               : OUT   std_ulogic := 'U';
        A2               : IN    std_ulogic := 'U';
        OE2              : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh241 : ENTITY IS TRUE;
END stdh241;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh241 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A1_ipd               : std_ulogic := 'U';
    SIGNAL A1int                : std_logic  := 'U';
    SIGNAL A1intNeg             : std_ulogic := 'U';
    SIGNAL OE1Neg_ipd           : std_ulogic := 'U';
    SIGNAL A2_ipd               : std_ulogic := 'U';
    SIGNAL A2int                : std_logic  := 'U';
    SIGNAL A2intNeg             : std_ulogic := 'U';
    SIGNAL OE2_ipd              : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A1_ipd, A1, tipd_A1);
        w_2 : VitalWireDelay (OE1Neg_ipd, OE1Neg, tipd_OE1Neg);
        w_3 : VitalWireDelay (A2_ipd, A2, tipd_A2);
        w_4 : VitalWireDelay (OE2_ipd, OE2, tipd_OE2);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUF (q => A1int, a => A1_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_2: VitalINV (q => A1intNeg, a => A1int);
    a_3: VitalINV (q => A1int, a => A1intNeg, 
                                            ResultMap => ('Z', 'Z', '0', '1'));

    a_4: VitalBUF (q => A2int, a => A2_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_5: VitalINV (q => A2intNeg, a => A2int);
    a_6: VitalINV (q => A2int, a => A2intNeg, 
                                            ResultMap => ('Z', 'Z', '0', '1'));

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (A1int, OE1Neg_ipd, A2int, OE2_ipd)

        -- Functionality Results Variables
        VARIABLE A1Neg              : std_ulogic;
        VARIABLE Y1_zd              : std_ulogic;
        VARIABLE A2Neg              : std_ulogic;
        VARIABLE Y2_zd              : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y1_GlitchData   : VitalGlitchDataType;
        VARIABLE Y2_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Y1_zd := VitalBUFIF0 (data => A1int, enable => OE1Neg_ipd);
        Y2_zd := VitalBUFIF0 (data => A2int, enable => NOT (OE2_ipd));

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       =>  Y1,
            OutSignalName   =>  "Y1",
            OutTemp         =>  Y1_zd,
            GlitchData      => Y1_GlitchData,
            Paths           => (
                0 => (InputChangeTime   => A1int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A1_Y1),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_Y1,
                      PathCondition     => TRUE))
        );
        VitalPathDelay01Z (
            OutSignal       =>  Y2,
            OutSignalName   =>  "Y2",
            OutTemp         =>  Y2_zd,
            GlitchData      => Y2_GlitchData,
            Paths           => (
                0 => (InputChangeTime   => A2int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A1_Y1),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OE2_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_Y1,
                      PathCondition     => TRUE))
        );

    END PROCESS;

END vhdl_behavioral;
