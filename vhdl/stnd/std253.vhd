--------------------------------------------------------------------------------
--  File Name: std253.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1999 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    99 Dec 26   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       STD253
-- 
--  Description: 4 Input Mux with 3-state Output
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std253 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_Y                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_S1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_S0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_I3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_I2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_I1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_I0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_S0_Y                 : VitalDelayType01 := UnitDelay01;
        tpd_I0_Y                 : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_Y              : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_logic := 'U';
        S1              : IN    std_logic := 'U';
        S0              : IN    std_logic := 'U';
        I3              : IN    std_logic := 'U';
        I2              : IN    std_logic := 'U';
        I1              : IN    std_logic := 'U';
        I0              : IN    std_logic := 'U';
        OENeg           : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std253 : ENTITY IS TRUE;
END std253;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std253 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL S1_ipd              : std_ulogic := 'X';
    SIGNAL S0_ipd              : std_ulogic := 'X';
    SIGNAL I3_ipd              : std_ulogic := 'X';
    SIGNAL I2_ipd              : std_ulogic := 'X';
    SIGNAL I1_ipd              : std_ulogic := 'X';
    SIGNAL I0_ipd              : std_ulogic := 'X';
    SIGNAL OENeg_ipd           : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_2 : VitalWireDelay (S1_ipd, S1, tipd_S1);
        w_3 : VitalWireDelay (S0_ipd, S0, tipd_S0);
        w_4 : VitalWireDelay (I3_ipd, I3, tipd_I3);
        w_5 : VitalWireDelay (I2_ipd, I2, tipd_I2);
        w_6 : VitalWireDelay (I1_ipd, I1, tipd_I1);
        w_7 : VitalWireDelay (I0_ipd, I0, tipd_I0);
        w_8 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (I0_ipd, I1_ipd, I2_ipd, I3_ipd, S0_ipd, S1_ipd,
                             OENeg_ipd)

        VARIABLE IData          : std_logic_vector4;
        VARIABLE SEL            : std_logic_vector2;

        -- Functionality Results Variables
        VARIABLE Y_zd           : std_ulogic;
        VARIABLE Mint           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        IData := (I3_ipd & I2_ipd & I1_ipd & I0_ipd);
        SEL := (S1_ipd & S0_ipd);

        Mint := VitalMUX4(
                     Data    => IData,
                     dSelect => SEL
                 );

        Y_zd := VitalBUFIF0 (data => Mint, enable => OENeg_ipd);

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
                0 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_Y,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => I0_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_I0_Y),
                      PathCondition     => (OENeg_ipd = '0')),
                2 => (InputChangeTime   => I1_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_I0_Y),
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => I2_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_I0_Y),
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => I3_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_I0_Y),
                      PathCondition     => TRUE),
                5 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_S0_Y),
                      PathCondition     => TRUE),
                6 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_S0_Y),
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
