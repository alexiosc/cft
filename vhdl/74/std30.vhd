--------------------------------------------------------------------------------
--  File Name: std30.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1999 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundry.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0  M. Li      99 AUG 19  Conformed to style guide
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD30
-- 
--  Description:  8-input positive-NAND gate
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std30 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_C              : VitalDelayType01 := VitalZeroDelay01;
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
        tipd_E              : VitalDelayType01 := VitalZeroDelay01;
        tipd_F              : VitalDelayType01 := VitalZeroDelay01;
        tipd_G              : VitalDelayType01 := VitalZeroDelay01;
        tipd_H              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_YNeg          : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        MsgOn               : BOOLEAN := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        A        : IN    std_logic := 'X';
        B        : IN    std_logic := 'X';
        C        : IN    std_logic := 'X';
        D        : IN    std_logic := 'X';
        E        : IN    std_logic := 'X';
        F        : IN    std_logic := 'X';
        G        : IN    std_logic := 'X';
        H        : IN    std_logic := 'X';
        YNeg     : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std30 : ENTITY IS TRUE;
END std30;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std30 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A_ipd        : std_ulogic := 'X';
    SIGNAL B_ipd        : std_ulogic := 'X';
    SIGNAL C_ipd        : std_ulogic := 'X';
    SIGNAL D_ipd        : std_ulogic := 'X';
    SIGNAL E_ipd        : std_ulogic := 'X';
    SIGNAL F_ipd        : std_ulogic := 'X';
    SIGNAL G_ipd        : std_ulogic := 'X';
    SIGNAL H_ipd        : std_ulogic := 'X';


BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (A_ipd, A, tipd_A);
        w_2: VitalWireDelay (B_ipd, B, tipd_B);
        w_3: VitalWireDelay (C_ipd, C, tipd_C);
        w_4: VitalWireDelay (D_ipd, D, tipd_D);
        w_5: VitalWireDelay (E_ipd, E, tipd_E);
        w_6: VitalWireDelay (F_ipd, F, tipd_F);
        w_7: VitalWireDelay (G_ipd, G, tipd_G);
        w_8: VitalWireDelay (H_ipd, H, tipd_H);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (
			A_ipd,
			B_ipd, 
			C_ipd,
			D_ipd,
			E_ipd,
			F_ipd,
			G_ipd,
			H_ipd)

        -- Functionality Results Variables
        VARIABLE YNeg_zd           : std_ulogic;
        VARIABLE t1Neg_zd           : std_ulogic;
        VARIABLE t2Neg_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE YNeg_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        t1Neg_zd := VitalNAND4 (
                            a => A_ipd,
                            b => B_ipd, 
                            c => C_ipd, 
                            d => D_ipd); 
        t2Neg_zd := VitalNAND4 (
                            a => E_ipd, 
                            b => F_ipd, 
                            c => G_ipd, 
                            d => H_ipd);
	YNeg_zd := VitalOR2 (
                     a => t1Neg_zd,
                     b => t2Neg_zd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  YNeg,
            OutSignalName   =>  "YNeg",
            OutTemp         =>  YNeg_zd,
            GlitchData      =>  YNeg_GlitchData,
            Paths           => (
                0 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => C_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => D_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => E_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => TRUE),
                5 => (InputChangeTime   => F_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => TRUE),
                6 => (InputChangeTime   => G_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => TRUE),
                7 => (InputChangeTime   => H_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => TRUE))
        );

    END PROCESS;

END vhdl_behavioral;
