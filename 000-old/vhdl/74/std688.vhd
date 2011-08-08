--------------------------------------------------------------------------------
--  File Name: std688.vhd
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
--    V1.0    R. Munden    01 Dec 19   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: TTL
--  Part:       STD688
-- 
--  Description: 8-Bit Identity Comparator
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.conversions.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std688 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_GNeg                : VitalDelayType01 := VitalZeroDelay01;
        tipd_B7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A0                  : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_GNeg_AEQBNeg         : VitalDelayType01 := UnitDelay01;
        tpd_B0_AEQBNeg           : VitalDelayType01 := UnitDelay01;
        tpd_A0_AEQBNeg           : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        B7              : IN    std_ulogic := 'U';
        B6              : IN    std_ulogic := 'U';
        B5              : IN    std_ulogic := 'U';
        B4              : IN    std_ulogic := 'U';
        B3              : IN    std_ulogic := 'U';
        B2              : IN    std_ulogic := 'U';
        B1              : IN    std_ulogic := 'U';
        B0              : IN    std_ulogic := 'U';
        A7              : IN    std_ulogic := 'U';
        A6              : IN    std_ulogic := 'U';
        A5              : IN    std_ulogic := 'U';
        A4              : IN    std_ulogic := 'U';
        A3              : IN    std_ulogic := 'U';
        A2              : IN    std_ulogic := 'U';
        A1              : IN    std_ulogic := 'U';
        A0              : IN    std_ulogic := 'U';
        GNeg            : IN    std_ulogic := 'U';
        AEQBNeg         : OUT   std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std688 : ENTITY IS TRUE;
END std688;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std688 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL B7_ipd              : std_ulogic := 'U';
    SIGNAL B6_ipd              : std_ulogic := 'U';
    SIGNAL B5_ipd              : std_ulogic := 'U';
    SIGNAL B4_ipd              : std_ulogic := 'U';
    SIGNAL B3_ipd              : std_ulogic := 'U';
    SIGNAL B2_ipd              : std_ulogic := 'U';
    SIGNAL B1_ipd              : std_ulogic := 'U';
    SIGNAL B0_ipd              : std_ulogic := 'U';
    SIGNAL A7_ipd              : std_ulogic := 'U';
    SIGNAL A6_ipd              : std_ulogic := 'U';
    SIGNAL A5_ipd              : std_ulogic := 'U';
    SIGNAL A4_ipd              : std_ulogic := 'U';
    SIGNAL A3_ipd              : std_ulogic := 'U';
    SIGNAL A2_ipd              : std_ulogic := 'U';
    SIGNAL A1_ipd              : std_ulogic := 'U';
    SIGNAL A0_ipd              : std_ulogic := 'U';
    SIGNAL GNeg_ipd            : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (B7_ipd, B7, tipd_B7);
        w_2 : VitalWireDelay (B6_ipd, B6, tipd_B6);
        w_3 : VitalWireDelay (B5_ipd, B5, tipd_B5);
        w_4 : VitalWireDelay (B4_ipd, B4, tipd_B4);
        w_5 : VitalWireDelay (B3_ipd, B3, tipd_B3);
        w_6 : VitalWireDelay (B2_ipd, B2, tipd_B2);
        w_7 : VitalWireDelay (B1_ipd, B1, tipd_B1);
        w_8 : VitalWireDelay (B0_ipd, B0, tipd_B0);
        w_9 : VitalWireDelay (A7_ipd, A7, tipd_A7);
        w_10 : VitalWireDelay (A6_ipd, A6, tipd_A6);
        w_11 : VitalWireDelay (A5_ipd, A5, tipd_A5);
        w_12 : VitalWireDelay (A4_ipd, A4, tipd_A4);
        w_13 : VitalWireDelay (A3_ipd, A3, tipd_A3);
        w_14 : VitalWireDelay (A2_ipd, A2, tipd_A2);
        w_15 : VitalWireDelay (A1_ipd, A1, tipd_A1);
        w_16 : VitalWireDelay (A0_ipd, A0, tipd_A0);
        w_17 : VitalWireDelay (GNeg_ipd, GNeg, tipd_GNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Block
    ----------------------------------------------------------------------------
    Behavior: BLOCK

        PORT (
            AIn          : IN    std_logic_vector(7 downto 0);
            BIn          : IN    std_logic_vector(7 downto 0);
            GNegIn       : IN    std_ulogic;
            AEQBNegOut   : OUT   std_ulogic
        );
        PORT MAP (
            AIn(0) => A0_ipd,
            AIn(1) => A1_ipd,
            AIn(2) => A2_ipd,
            AIn(3) => A3_ipd,
            AIn(4) => A4_ipd,
            AIn(5) => A5_ipd,
            AIn(6) => A6_ipd,
            AIn(7) => A7_ipd,
            BIn(0) => B0_ipd,
            BIn(1) => B1_ipd,
            BIn(2) => B2_ipd,
            BIn(3) => B3_ipd,
            BIn(4) => B4_ipd,
            BIn(5) => B5_ipd,
            BIn(6) => B6_ipd,
            BIn(7) => B7_ipd,
            GNegIn => GNeg_ipd,
            AEQBNegOut => AEQBNeg
        );

    BEGIN
        ------------------------------------------------------------------------
        -- Behavior Process
        ------------------------------------------------------------------------
        Behavior : PROCESS (AIn, BIn, GNegIn)

            VARIABLE A : NATURAL;
            VARIABLE B : NATURAL;

            -- Functionality Results Variables
            VARIABLE AEQB_zd : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE AEQB_GlitchData  : VitalGlitchDataType;


        BEGIN
            A := To_Nat(AIn);
            B := To_Nat(BIn);

            IF A = B AND To_UX01(GNegIn) = '0' THEN
                AEQB_zd := '0';
            ELSE
                AEQB_zd := '1';
            END IF;
            
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => AEQBNegOut,
            OutSignalName   => "AEQBNeg",
            OutTemp         => AEQB_zd,
            GlitchData      => AEQB_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNegIn'LAST_EVENT,
                      PathDelay         => tpd_GNeg_AEQBNeg,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => AIn'LAST_EVENT,
                      PathDelay         => tpd_A0_AEQBNeg,
                      PathCondition     => (To_UX01(GNegIn) = '0')),
                2 => (InputChangeTime   => BIn'LAST_EVENT,
                      PathDelay         => tpd_B0_AEQBNeg,
                      PathCondition     => (To_UX01(GNegIn) = '0'))
            )
        );


        END PROCESS;
    END BLOCK;
END vhdl_behavioral;
