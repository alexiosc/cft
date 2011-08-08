--------------------------------------------------------------------------------
--  File Name: std521.vhd
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
--    V1.0    R. Munden    98 APR 14   initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/7400
--  Part:       54/74XX521
-- 
--  Desciption: 8-Bit Identity Comparator
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std521 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_INeg                : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A0_ONeg                        : VitalDelayType01 := UnitDelay01;
        tpd_B0_ONeg                        : VitalDelayType01 := UnitDelay01;
        tpd_INeg_ONeg                      : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        A7              : IN    std_logic := 'U';
        A6              : IN    std_logic := 'U';
        A5              : IN    std_logic := 'U';
        A4              : IN    std_logic := 'U';
        A3              : IN    std_logic := 'U';
        A2              : IN    std_logic := 'U';
        A1              : IN    std_logic := 'U';
        A0              : IN    std_logic := 'U';
        B7              : IN    std_logic := 'U';
        B6              : IN    std_logic := 'U';
        B5              : IN    std_logic := 'U';
        B4              : IN    std_logic := 'U';
        B3              : IN    std_logic := 'U';
        B2              : IN    std_logic := 'U';
        B1              : IN    std_logic := 'U';
        B0              : IN    std_logic := 'U';
        ONeg            : OUT   std_logic := 'U';
        INeg            : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std521 : ENTITY IS TRUE;
END std521;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std521 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A7_ipd              : std_ulogic := 'X';
    SIGNAL A6_ipd              : std_ulogic := 'X';
    SIGNAL A5_ipd              : std_ulogic := 'X';
    SIGNAL A4_ipd              : std_ulogic := 'X';
    SIGNAL A3_ipd              : std_ulogic := 'X';
    SIGNAL A2_ipd              : std_ulogic := 'X';
    SIGNAL A1_ipd              : std_ulogic := 'X';
    SIGNAL A0_ipd              : std_ulogic := 'X';
    SIGNAL B7_ipd              : std_ulogic := 'X';
    SIGNAL B6_ipd              : std_ulogic := 'X';
    SIGNAL B5_ipd              : std_ulogic := 'X';
    SIGNAL B4_ipd              : std_ulogic := 'X';
    SIGNAL B3_ipd              : std_ulogic := 'X';
    SIGNAL B2_ipd              : std_ulogic := 'X';
    SIGNAL B1_ipd              : std_ulogic := 'X';
    SIGNAL B0_ipd              : std_ulogic := 'X';
    SIGNAL INeg_ipd            : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A7_ipd, A7, tipd_A7);
        w_2 : VitalWireDelay (A6_ipd, A6, tipd_A6);
        w_3 : VitalWireDelay (A5_ipd, A5, tipd_A5);
        w_4 : VitalWireDelay (A4_ipd, A4, tipd_A4);
        w_5 : VitalWireDelay (A3_ipd, A3, tipd_A3);
        w_6 : VitalWireDelay (A2_ipd, A2, tipd_A2);
        w_7 : VitalWireDelay (A1_ipd, A1, tipd_A1);
        w_8 : VitalWireDelay (A0_ipd, A0, tipd_A0);
        w_9 : VitalWireDelay (B7_ipd, B7, tipd_B7);
        w_10 : VitalWireDelay (B6_ipd, B6, tipd_B6);
        w_11 : VitalWireDelay (B5_ipd, B5, tipd_B5);
        w_12 : VitalWireDelay (B4_ipd, B4, tipd_B4);
        w_13 : VitalWireDelay (B3_ipd, B3, tipd_B3);
        w_14 : VitalWireDelay (B2_ipd, B2, tipd_B2);
        w_15 : VitalWireDelay (B1_ipd, B1, tipd_B1);
        w_16 : VitalWireDelay (B0_ipd, B0, tipd_B0);
        w_18 : VitalWireDelay (INeg_ipd, INeg, tipd_INeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (B0_ipd, B1_ipd, B2_ipd, B3_ipd, B4_ipd, B5_ipd, 
                             B6_ipd, B7_ipd, A0_ipd, A1_ipd, A2_ipd, A3_ipd,
                             A4_ipd, A5_ipd, A6_ipd, A7_ipd, INeg_ipd)

        VARIABLE B         : std_logic_vector(7 downto 0);
        VARIABLE A         : std_logic_vector(7 downto 0);

        -- Functionality Results Variables
        VARIABLE ONeg_zd   : std_ulogic := 'X';

        -- Output Glitch Detection Variables
        VARIABLE ONeg_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        B := (B7_ipd & B6_ipd & B5_ipd & B4_ipd & B3_ipd & B2_ipd & B1_ipd 
              & B0_ipd); 
        A := (A7_ipd & A6_ipd & A5_ipd & A4_ipd & A3_ipd & A2_ipd & A1_ipd 
              & A0_ipd); 
      
        IF (INeg_ipd = '1') THEN
            ONeg_zd := '1';
        ELSIF (INeg_ipd = '0') THEN
            IF A = B THEN
                ONeg_zd := '0';
            ELSE
                ONeg_zd := '1';
            END IF;
        ELSE
            ONeg_zd := 'X';
        END IF;

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => ONeg,
            OutSignalName   => "ONeg",
            OutTemp         => ONeg_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => B0_ipd'LAST_EVENT,
                      PathDelay         => tpd_B0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                1 => (InputChangeTime   => B1_ipd'LAST_EVENT,
                      PathDelay         => tpd_B0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                2 => (InputChangeTime   => B2_ipd'LAST_EVENT,
                      PathDelay         => tpd_B0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                3 => (InputChangeTime   => B3_ipd'LAST_EVENT,
                      PathDelay         => tpd_B0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                4 => (InputChangeTime   => B4_ipd'LAST_EVENT,
                      PathDelay         => tpd_B0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                5 => (InputChangeTime   => B5_ipd'LAST_EVENT,
                      PathDelay         => tpd_B0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                6 => (InputChangeTime   => B6_ipd'LAST_EVENT,
                      PathDelay         => tpd_B0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                7 => (InputChangeTime   => B7_ipd'LAST_EVENT,
                      PathDelay         => tpd_B0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                8 => (InputChangeTime   => A0_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                9 => (InputChangeTime   => A1_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                10 => (InputChangeTime   => A2_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                11 => (InputChangeTime   => A3_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                12 => (InputChangeTime   => A4_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                13 => (InputChangeTime   => A5_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                14 => (InputChangeTime   => A6_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                15 => (InputChangeTime   => A7_ipd'LAST_EVENT,
                      PathDelay         => tpd_A0_ONeg,
                      PathCondition     => INeg_ipd = '0'),
                16 => (InputChangeTime   => INeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_INeg_ONeg,
                      PathCondition     => TRUE)),
            GlitchData      => ONeg_GlitchData
        );

    END PROCESS;

END vhdl_behavioral;
