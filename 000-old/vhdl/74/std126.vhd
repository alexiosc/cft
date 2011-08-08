--------------------------------------------------------------------------------
--  File Name: std126.vhd
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
--    V1.0     R. Munden   00 JUN 24  initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STD
--  Technology: 54/74XXXX
--  Part:       STD126
-- 
--  Desciption: Line driver with 3-state output
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std126 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_Y              : VitalDelayType01 := VitalZeroDelay01;
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE             : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y             : VitalDelayType01 := UnitDelay01;
        tpd_OE_Y            : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_ulogic := 'U';
        A               : IN    std_ulogic := 'U';
        OE              : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std126 : ENTITY IS TRUE;
END std126;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std126 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A_ipd               : std_ulogic := 'U';
    SIGNAL OE_ipd              : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (OE_ipd, OE, tipd_OE);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (A_ipd, OE_ipd)

        -- Functionality Results Variables
        VARIABLE Y_zd               : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Y_zd := VitalBUFIF0 (data => A_ipd, enable => OE_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => Y,
            OutSignalName   => "Y",
            OutTemp         => Y_zd,
            GlitchData      => Y_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_Y),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OE_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE_Y,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
