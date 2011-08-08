--------------------------------------------------------------------------------
--  File Name: std258.vhd
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
--    V1.0     R. Munden   98 APR 03   Initial coding
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       STD258
-- 
--  Desciption: 2:1 Mux with 3-state inverting output
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std258 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_Y                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_SEL                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y                  : VitalDelayType01 := UnitDelay01;
        tpd_SEL_Y                : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_Y              : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXOn;
        InstancePath        : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_logic := 'X';
        A               : IN    std_logic := 'X';
        B               : IN    std_logic := 'X';
        SEL             : IN    std_logic := 'X';
        OENeg           : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std258 : ENTITY IS TRUE;
END std258;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std258 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL B_ipd               : std_ulogic := 'X';
    SIGNAL SEL_ipd             : std_ulogic := 'X';
    SIGNAL OENeg_ipd           : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (B_ipd, B, tipd_B);
        w_3 : VitalWireDelay (SEL_ipd, SEL, tipd_SEL);
        w_4 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (A_ipd, B_ipd, SEL_ipd, OENeg_ipd)
 
        -- Functionality Results Variables
        VARIABLE AB_zd          : std_ulogic;
        VARIABLE Y_zd           : std_ulogic;
 
        VARIABLE ABint          : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE AB_GlitchData  : VitalGlitchDataType;
        VARIABLE OE_GlitchData  : VitalGlitchDataType;
 
    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        ABint := VitalMUX2(
                     Data1   => B_ipd,
                     Data0   => A_ipd,
                     dSelect => SEL_ipd
                 );
 
        Y_zd := VitalBUFIF0 (Data   => not ABint,
                              Enable => OENeg_ipd);
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => Y,
            OutSignalName   => "Y",
            OutTemp         => Y_zd,
            GlitchData      => OE_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_Y,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_Y),
                      PathCondition     => (OENeg_ipd = '1')),
                2 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_Y),
                      PathCondition     => (OENeg_ipd = '1')),
                3 => (InputChangeTime   => SEL_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_SEL_Y),
                      PathCondition     => (OENeg_ipd = '1'))
            )
        );

    END PROCESS;

END vhdl_behavioral;
