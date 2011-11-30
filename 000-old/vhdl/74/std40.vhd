--------------------------------------------------------------------------------
--  File Name: std40.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2000 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundry.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0   R. Munden 00 JUL 03  Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STND
--  Technology:  54/74XXXX
--  Part:        STD40
-- 
--  Description:  4-input positive-NAND gate
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std40 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_C              : VitalDelayType01 := VitalZeroDelay01;
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
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
        A        : IN    std_ulogic := 'U';
        B        : IN    std_ulogic := 'U';
        C        : IN    std_ulogic := 'U';
        D        : IN    std_ulogic := 'U';
        YNeg     : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std40 : ENTITY IS TRUE;
END std40;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std40 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A_ipd        : std_ulogic := 'U';
    SIGNAL B_ipd        : std_ulogic := 'U';
    SIGNAL C_ipd        : std_ulogic := 'U';
    SIGNAL D_ipd        : std_ulogic := 'U';

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

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (A_ipd, B_ipd, C_ipd, D_ipd)

        -- Functionality Results Variables
        VARIABLE YNeg_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE YNeg_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        YNeg_zd := VitalNAND4 (a => A_ipd,
                            b => B_ipd, 
                            c => C_ipd, 
                            d => D_ipd);

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
                      PathCondition     => TRUE))
        );

    END PROCESS;

END vhdl_behavioral;
