--------------------------------------------------------------------------------
--  File Name: std283.vhd
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
--    V1.0    R. Munden    98 OCT 15   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XX
--  Part:       STD283
-- 
--  Description: 4-Bit Binary Full Adder
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.conversions.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std283 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CI                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A0                  : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CI_Y0                : VitalDelayType01 := UnitDelay01;
        tpd_CI_CO                : VitalDelayType01 := UnitDelay01;
        tpd_A0_Y0                : VitalDelayType01 := UnitDelay01;
        tpd_A0_CO                : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN := DefaultTimingChecks;
        MsgOn               : BOOLEAN := DefaultMsgOn;
        XOn                 : BOOLEAN := DefaultXOn;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y3              : OUT   std_logic := 'U';
        Y2              : OUT   std_logic := 'U';
        Y1              : OUT   std_logic := 'U';
        Y0              : OUT   std_logic := 'U';
        CO              : OUT   std_logic := 'U';
        CI              : IN    std_logic := 'U';
        B3              : IN    std_logic := 'U';
        B2              : IN    std_logic := 'U';
        B1              : IN    std_logic := 'U';
        B0              : IN    std_logic := 'U';
        A3              : IN    std_logic := 'U';
        A2              : IN    std_logic := 'U';
        A1              : IN    std_logic := 'U';
        A0              : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std283 : ENTITY IS TRUE;
END std283;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std283 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL CI_ipd              : std_ulogic := 'X';
    SIGNAL B3_ipd              : std_ulogic := 'X';
    SIGNAL B2_ipd              : std_ulogic := 'X';
    SIGNAL B1_ipd              : std_ulogic := 'X';
    SIGNAL B0_ipd              : std_ulogic := 'X';
    SIGNAL A3_ipd              : std_ulogic := 'X';
    SIGNAL A2_ipd              : std_ulogic := 'X';
    SIGNAL A1_ipd              : std_ulogic := 'X';
    SIGNAL A0_ipd              : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (CI_ipd, CI, tipd_CI);
        w_2 : VitalWireDelay (B3_ipd, B3, tipd_B3);
        w_3 : VitalWireDelay (B2_ipd, B2, tipd_B2);
        w_4 : VitalWireDelay (B1_ipd, B1, tipd_B1);
        w_5 : VitalWireDelay (B0_ipd, B0, tipd_B0);
        w_6 : VitalWireDelay (A3_ipd, A3, tipd_A3);
        w_7 : VitalWireDelay (A2_ipd, A2, tipd_A2);
        w_8 : VitalWireDelay (A1_ipd, A1, tipd_A1);
        w_9 : VitalWireDelay (A0_ipd, A0, tipd_A0);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CI_ipd, B3_ipd, B2_ipd, B1_ipd, B0_ipd, A3_ipd,
                             A2_ipd, A1_ipd, A0_ipd)

        -- Working Variables
        VARIABLE A             : natural range 0 to 15;
        VARIABLE B             : natural range 0 to 15;
        VARIABLE Y             : natural range 0 to 31;
        VARIABLE Avec          : std_logic_vector(0 to 3);
        VARIABLE Bvec          : std_logic_vector(0 to 3);
        VARIABLE Yvec          : std_logic_vector(0 to 4);

        -- Functionality Results Variables
        ALIAS Y0_zd            : std_ulogic IS Yvec(4);
        ALIAS Y1_zd            : std_ulogic IS Yvec(3);
        ALIAS Y2_zd            : std_ulogic IS Yvec(2);
        ALIAS Y3_zd            : std_ulogic IS Yvec(1);
        ALIAS CO_zd            : std_ulogic IS Yvec(0);

        -- Output Glitch Detection Variables
        VARIABLE Y0_GlitchData  : VitalGlitchDataType;
        VARIABLE Y1_GlitchData  : VitalGlitchDataType;
        VARIABLE Y2_GlitchData  : VitalGlitchDataType;
        VARIABLE Y3_GlitchData  : VitalGlitchDataType;
        VARIABLE CO_GlitchData  : VitalGlitchDataType;

    BEGIN
        Avec  := (A3_ipd, A2_ipd, A1_ipd, A0_ipd);
        Bvec  := (B3_ipd, B2_ipd, B1_ipd, B0_ipd);
        A     := to_nat(Avec);
        B     := to_nat(Bvec);
        Y     := A + B;
        Y     := Y + to_nat(CI_ipd);
        Yvec  := to_slv(Y, 5);
        
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Y0,
            OutSignalName   => "Y0",
            OutTemp         => Y0_zd,
            GlitchData      => Y0_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CI_ipd'LAST_EVENT,
                      PathDelay         => tpd_CI_Y0,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => A0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => B0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => Y1,
            OutSignalName   => "Y1",
            OutTemp         => Y1_zd,
            GlitchData      => Y1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CI_ipd'LAST_EVENT,
                      PathDelay         => tpd_CI_Y0,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => A0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => B0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => A1_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => B1_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => Y2,
            OutSignalName   => "Y2",
            OutTemp         => Y2_zd,
            GlitchData      => Y2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CI_ipd'LAST_EVENT,
                      PathDelay         => tpd_CI_Y0,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => A0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => B0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => A1_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => B1_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                5 => (InputChangeTime   => A2_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                6 => (InputChangeTime   => B2_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => Y3,
            OutSignalName   => "Y3",
            OutTemp         => Y3_zd,
            GlitchData      => Y3_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CI_ipd'LAST_EVENT,
                      PathDelay         => tpd_CI_Y0,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => A0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => B0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => A1_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => B1_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                5 => (InputChangeTime   => A2_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                6 => (InputChangeTime   => B2_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                7 => (InputChangeTime   => A3_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                8 => (InputChangeTime   => B3_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => CO,
            OutSignalName   => "CO",
            OutTemp         => CO_zd,
            GlitchData      => CO_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CI_ipd'LAST_EVENT,
                      PathDelay         => tpd_CI_Y0,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => A0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => B0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => A1_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => B1_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                5 => (InputChangeTime   => A2_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                6 => (InputChangeTime   => B2_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                7 => (InputChangeTime   => A3_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE),
                8 => (InputChangeTime   => B3_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_Y0,
                      PathCondition     => TRUE)
            )
        );


    END PROCESS;

END vhdl_behavioral;
