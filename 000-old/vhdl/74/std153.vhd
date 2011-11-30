--------------------------------------------------------------------------------
--  File Name: std153.vhd
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
--    V1.0     R. Munden   98 JUN 02   Initial coding
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       STD153
-- 
--  Desciption: 4:1 Mux with Strobe
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std153 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_I0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_I1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_I2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_I3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_SEL0                : VitalDelayType01 := VitalZeroDelay01;
        tipd_SEL1                : VitalDelayType01 := VitalZeroDelay01;
        tipd_GNeg                : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_I0_Y                 : VitalDelayType01 := UnitDelay01;
        tpd_SEL0_Y               : VitalDelayType01 := UnitDelay01;
        tpd_GNeg_Y               : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXOn;
        InstancePath        : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_logic := 'U';
        I0              : IN    std_logic := 'X';
        I1              : IN    std_logic := 'X';
        I2              : IN    std_logic := 'X';
        I3              : IN    std_logic := 'X';
        SEL0            : IN    std_logic := 'X';
        SEL1            : IN    std_logic := 'X';
        GNeg            : IN    std_logic := 'X'
    );
    ATTRIBUTE VITAL_LEVEL0 of std153 : ENTITY IS TRUE;
END std153;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std153 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL I0_ipd              : std_ulogic := 'X';
    SIGNAL I1_ipd              : std_ulogic := 'X';
    SIGNAL I2_ipd              : std_ulogic := 'X';
    SIGNAL I3_ipd              : std_ulogic := 'X';
    SIGNAL SEL0_ipd            : std_ulogic := 'X';
    SIGNAL SEL1_ipd            : std_ulogic := 'X';
    SIGNAL GNeg_ipd            : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (I0_ipd, I0, tipd_I0);
        w_2 : VitalWireDelay (I1_ipd, I1, tipd_I1);
        w_3 : VitalWireDelay (I2_ipd, I2, tipd_I2);
        w_4 : VitalWireDelay (I3_ipd, I3, tipd_I3);
        w_5 : VitalWireDelay (SEL0_ipd, SEL0, tipd_SEL0);
        w_6 : VitalWireDelay (SEL1_ipd, SEL1, tipd_SEL1);
        w_7 : VitalWireDelay (GNeg_ipd, GNeg, tipd_GNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (I0_ipd, I1_ipd, I2_ipd, I3_ipd, SEL0_ipd, SEL1_ipd,
                              GNeg_ipd)
 
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
        SEL := (SEL1_ipd & SEL0_ipd);

        Mint := VitalMUX4(
                     Data    => IData,
                     dSelect => SEL
                 );
 
        Y_zd := VitalAND2 (a   => not GNeg_ipd, b => Mint);
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Y,
            OutSignalName   => "Y",
            OutTemp         => Y_zd,
            GlitchData      => Y_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_Y,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => I0_ipd'LAST_EVENT,
                      PathDelay         => tpd_I0_Y,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => I1_ipd'LAST_EVENT,
                      PathDelay         => tpd_I0_Y,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => I2_ipd'LAST_EVENT,
                      PathDelay         => tpd_I0_Y,
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => I3_ipd'LAST_EVENT,
                      PathDelay         => tpd_I0_Y,
                      PathCondition     => TRUE),
                5 => (InputChangeTime   => SEL0_ipd'LAST_EVENT,
                      PathDelay         => tpd_SEL0_Y,
                      PathCondition     => TRUE),
                6 => (InputChangeTime   => SEL1_ipd'LAST_EVENT,
                      PathDelay         => tpd_SEL0_Y,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
