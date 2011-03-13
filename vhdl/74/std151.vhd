--------------------------------------------------------------------------------
--  File Name: std151.vhd
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
--    V1.0    R. Munden    00 Dec 21   Initial release
--    V1.1    R. Munden    01 Feb 03   Added separate timing for W output
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       STD151
-- 
--  Description: 8 Input Mux with Strobe
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std151 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_C                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_D7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_GNeg                : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y                  : VitalDelayType01 := UnitDelay01;
        tpd_D0_Y                 : VitalDelayType01 := UnitDelay01;
        tpd_GNeg_Y               : VitalDelayType01 := UnitDelay01;
        tpd_A_W                  : VitalDelayType01 := UnitDelay01;
        tpd_D0_W                 : VitalDelayType01 := UnitDelay01;
        tpd_GNeg_W               : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_ulogic := 'U';
        W               : OUT   std_ulogic := 'U';
        C               : IN    std_ulogic := 'U';
        B               : IN    std_ulogic := 'U';
        A               : IN    std_ulogic := 'U';
        D7              : IN    std_ulogic := 'U';
        D6              : IN    std_ulogic := 'U';
        D5              : IN    std_ulogic := 'U';
        D4              : IN    std_ulogic := 'U';
        D3              : IN    std_ulogic := 'U';
        D2              : IN    std_ulogic := 'U';
        D1              : IN    std_ulogic := 'U';
        D0              : IN    std_ulogic := 'U';
        GNeg            : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std151 : ENTITY IS TRUE;
END std151;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std151 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL C_ipd               : std_ulogic := 'X';
    SIGNAL B_ipd               : std_ulogic := 'X';
    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL D7_ipd              : std_ulogic := 'X';
    SIGNAL D6_ipd              : std_ulogic := 'X';
    SIGNAL D5_ipd              : std_ulogic := 'X';
    SIGNAL D4_ipd              : std_ulogic := 'X';
    SIGNAL D3_ipd              : std_ulogic := 'X';
    SIGNAL D2_ipd              : std_ulogic := 'X';
    SIGNAL D1_ipd              : std_ulogic := 'X';
    SIGNAL D0_ipd              : std_ulogic := 'X';
    SIGNAL GNeg_ipd            : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (C_ipd, C, tipd_C);
        w_2 : VitalWireDelay (B_ipd, B, tipd_B);
        w_3 : VitalWireDelay (A_ipd, A, tipd_A);
        w_4 : VitalWireDelay (D7_ipd, D7, tipd_D7);
        w_5 : VitalWireDelay (D6_ipd, D6, tipd_D6);
        w_6 : VitalWireDelay (D5_ipd, D5, tipd_D5);
        w_7 : VitalWireDelay (D4_ipd, D4, tipd_D4);
        w_8 : VitalWireDelay (D3_ipd, D3, tipd_D3);
        w_9 : VitalWireDelay (D2_ipd, D2, tipd_D2);
        w_10 : VitalWireDelay (D1_ipd, D1, tipd_D1);
        w_11 : VitalWireDelay (D0_ipd, D0, tipd_D0);
        w_12 : VitalWireDelay (GNeg_ipd, GNeg, tipd_GNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (D0_ipd, D1_ipd, D2_ipd, D3_ipd, D4_ipd, D5_ipd,
                             D6_ipd, D7_ipd, A_ipd, B_ipd, C_ipd, GNeg_ipd)

        VARIABLE I0Data         : std_logic_vector4;
        VARIABLE I1Data         : std_logic_vector4;
        VARIABLE SEL            : std_logic_vector2;

        -- Functionality Results Variables
        VARIABLE Y_zd           : std_ulogic;
        VARIABLE W_zd           : std_ulogic;
        VARIABLE M0int          : std_ulogic;
        VARIABLE M1int          : std_ulogic;
        VARIABLE M2int          : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData   : VitalGlitchDataType;
        VARIABLE W_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        I0Data := (D3_ipd & D2_ipd & D1_ipd & D0_ipd);
        I1Data := (D7_ipd & D6_ipd & D5_ipd & D4_ipd);
        SEL := (B_ipd & A_ipd);

        M0int := VitalMUX4(
                     Data    => I0Data,
                     dSelect => SEL
                 );

        M1int := VitalMUX4(
                     Data    => I1Data,
                     dSelect => SEL
                 );

        M2int := VitalMUX2(
                     Data1   => M1int,
                     Data0   => M0int,
                     dSelect => C_ipd
                 );

        Y_zd := VitalAND2 (a => M2int, b => not GNeg_ipd);
        W_zd := VitalNAND2 (a => M2int, b => not GNeg_ipd);

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
                1 => (InputChangeTime   => D0_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_Y,
                      PathCondition     => (GNeg_ipd = '0')),
                2 => (InputChangeTime   => D1_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_Y,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => D2_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_Y,
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => D3_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_Y,
                      PathCondition     => TRUE),
                5 => (InputChangeTime   => D4_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_Y,
                      PathCondition     => TRUE),
                6 => (InputChangeTime   => D5_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_Y,
                      PathCondition     => TRUE),
                7 => (InputChangeTime   => D6_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_Y,
                      PathCondition     => TRUE),
                8 => (InputChangeTime   => D7_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_Y,
                      PathCondition     => TRUE),
                9 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Y,
                      PathCondition     => TRUE),
               10 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Y,
                      PathCondition     => TRUE),
               11 => (InputChangeTime   => C_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Y,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => W,
            OutSignalName   => "W",
            OutTemp         => W_zd,
            GlitchData      => W_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_W,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => D0_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_W,
                      PathCondition     => (GNeg_ipd = '0')),
                2 => (InputChangeTime   => D1_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_W,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => D2_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_W,
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => D3_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_W,
                      PathCondition     => TRUE),
                5 => (InputChangeTime   => D4_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_W,
                      PathCondition     => TRUE),
                6 => (InputChangeTime   => D5_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_W,
                      PathCondition     => TRUE),
                7 => (InputChangeTime   => D6_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_W,
                      PathCondition     => TRUE),
                8 => (InputChangeTime   => D7_ipd'LAST_EVENT,
                      PathDelay         => tpd_D0_W,
                      PathCondition     => TRUE),
                9 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_W,
                      PathCondition     => TRUE),
               10 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_W,
                      PathCondition     => TRUE),
               11 => (InputChangeTime   => C_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_W,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
