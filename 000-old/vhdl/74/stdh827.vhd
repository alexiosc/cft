--------------------------------------------------------------------------------
--  File Name: stdh827.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   98 DEC 16   initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: 54/74XXXX with bus hold
--  Part:       STDH827
-- 
--  Description: Buffer with 3-state output and bus hold
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh827 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_Y                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE1Neg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE2Neg              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y                            : VitalDelayType01 := UnitDelay01;
        tpd_OE1Neg_Y                       : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_logic := 'X';
        A               : IN    std_logic := 'X';
        OE1Neg          : IN    std_logic := 'U';
        OE2Neg          : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh827 : ENTITY IS TRUE;
END stdh827;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh827 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL Aint                : std_logic := 'X';
    SIGNAL AintNeg             : std_ulogic := 'X';
    SIGNAL OE1Neg_ipd          : std_ulogic := 'X';
    SIGNAL OE2Neg_ipd          : std_ulogic := 'X';

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
        VARIABLE Y_zd           : std_ulogic;
        VARIABLE OEint          : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        OEint := VitalOR2 (a => OE1Neg_ipd, b => OE2Neg_ipd);
        Y_zd := VitalBUFIF0 (data => Aint, enable => OEint);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       =>  Y,
            OutSignalName   =>  "Y",
            OutTemp         =>  Y_zd,
            GlitchData      => Y_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => Aint'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_Y),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_Y,
                      PathCondition     => TRUE))
        );

    END PROCESS;

END vhdl_behavioral;
