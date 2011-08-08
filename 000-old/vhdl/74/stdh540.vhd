--------------------------------------------------------------------------------
--  File Name: stdh540.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2001 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   01 OCT 14   initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: 54/74XXXX
--  Part:       STDH540
-- 
--  Desciption: Inverting Driver with 3-state output and Bus Hold
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh540 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_YNeg                : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE1Neg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE2Neg              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_YNeg               : VitalDelayType01 := UnitDelay01;
        tpd_OE1Neg_YNeg          : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXOn;
        InstancePath        : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        YNeg            : OUT   std_ulogic := 'U';
        A               : IN    std_ulogic := 'U';
        OE1Neg          : IN    std_ulogic := 'U';
        OE2Neg          : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh540 : ENTITY IS TRUE;
END stdh540;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh540 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A_ipd               : std_ulogic := 'U';
    SIGNAL OE1Neg_ipd          : std_ulogic := 'U';
    SIGNAL OE2Neg_ipd          : std_ulogic := 'U';
    SIGNAL Aint                : std_logic := 'U';
    SIGNAL AintNeg             : std_logic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (OE1Neg_ipd, OE1Neg, tipd_OE1Neg);
        w_3 : VitalWireDelay (OE2Neg_ipd, OE2Neg, tipd_OE2Neg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUF (q => Aint, a => A_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_2: VitalINV (q => AintNeg, a => Aint);
    a_3: VitalINV (q => Aint, a => AintNeg, ResultMap => ('Z', 'Z', '0', '1'));

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (Aint, OE1Neg_ipd, OE2Neg_ipd)

        -- Functionality Results Variables
        VARIABLE Y_zd               : std_ulogic;
        VARIABLE OEint              : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        OEint := VitalNOR2 (a => OE1Neg_ipd, b=> OE2Neg_ipd);
        Y_zd := VitalBUFIF1 (data => not Aint, enable => OEint);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => YNeg,
            OutSignalName   => "NegY",
            OutTemp         => Y_zd,
            GlitchData      => Y_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => Aint'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_YNeg),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_YNeg,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OE2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_YNeg,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
