--------------------------------------------------------------------------------
--  File Name: std158.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2000 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   00 NOV 24   initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       STD158
-- 
--  Desciption: 2:1 Inverting Mux with enable
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std158 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_SEL                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_GNeg                : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_YNeg               : VitalDelayType01 := UnitDelay01;
        tpd_SEL_YNeg             : VitalDelayType01 := UnitDelay01;
        tpd_GNeg_YNeg            : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXOn;
        InstancePath        : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        YNeg            : OUT   std_logic := 'U';
        A               : IN    std_logic := 'U';
        B               : IN    std_logic := 'U';
        SEL             : IN    std_logic := 'U';
        GNeg            : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std158 : ENTITY IS TRUE;
END std158;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std158 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A_ipd               : std_ulogic := 'U';
    SIGNAL B_ipd               : std_ulogic := 'U';
    SIGNAL SEL_ipd             : std_ulogic := 'U';
    SIGNAL GNeg_ipd            : std_ulogic := 'U';
    SIGNAL OEint               : std_ulogic := 'U';
    SIGNAL ABint               : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (B_ipd, B, tipd_B);
        w_3 : VitalWireDelay (SEL_ipd, SEL, tipd_SEL);
        w_4 : VitalWireDelay (GNeg_ipd, GNeg, tipd_GNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (A_ipd, B_ipd, SEL_ipd, GNeg_ipd)

        -- Functionality Results Variables
        VARIABLE AB_zd          : std_ulogic;
        VARIABLE YNeg_zd        : std_ulogic;

        VARIABLE ABint          : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        ABint := VitalMUX2(
                     Data1   => B_ipd,
                     Data0   => A_ipd,
                     dSelect => SEL_ipd
                 );

        YNeg_zd := VitalOR2 (a   => not ABint, b => GNeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => YNeg,
            OutSignalName   => "YNeg",
            OutTemp         => YNeg_zd,
            GlitchData      => Y_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_YNeg,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => (GNeg_ipd = '1')),
                2 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => (GNeg_ipd = '1')),
                3 => (InputChangeTime   => SEL_ipd'LAST_EVENT,
                      PathDelay         => tpd_SEL_YNeg,
                      PathCondition     => (GNeg_ipd = '1'))
            )
        );

    END PROCESS;

END vhdl_behavioral;
