--------------------------------------------------------------------------------
--  File Name: std13.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2000 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0  R. Munden  00 FEB 26  Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD13
-- 
--  Description:  4-input positve-NAND gate
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std13 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_C              : VitalDelayType01 := VitalZeroDelay01;
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_YNeg          : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        MsgOn               : BOOLEAN  := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        D           : IN    std_logic := 'U';
        C           : IN    std_logic := 'U';
        B           : IN    std_logic := 'U';
        A           : IN    std_logic := 'U';
        YNeg        : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std13 : ENTITY IS TRUE;
END std13;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std13 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL D_ipd        : std_ulogic := 'X';
    SIGNAL C_ipd        : std_ulogic := 'X';
    SIGNAL B_ipd        : std_ulogic := 'X';
    SIGNAL A_ipd        : std_ulogic := 'X';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (D_ipd, D, tipd_D);
        w_2: VitalWireDelay (C_ipd, C, tipd_C);
        w_3: VitalWireDelay (B_ipd, B, tipd_B);
        w_4: VitalWireDelay (A_ipd, A, tipd_A);

    END BLOCK;

    ----------------------------------------------------------------------------
        -- VITALBehavior Process
    ----------------------------------------------------------------------------
        VITALBehavior1 : PROCESS(A_ipd, B_ipd, C_ipd, D_ipd)

        -- Functionality Results Variables
        VARIABLE YNeg_zd        : std_ulogic := 'X';

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData : VitalGlitchDataType;

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
                YNeg_zd := VitalNAND4(a=> A_ipd, b => B_ipd, c=> C_ipd,
                                      d => D_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  YNeg,
            OutSignalName   =>  "YNeg",
            OutTemp         =>  YNeg_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Yneg,
                      PathCondition     => TRUE ),
                1 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Yneg,
                      PathCondition     => TRUE ),
                2 => (InputChangeTime   => C_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Yneg,
                      PathCondition     => TRUE ),
                3 => (InputChangeTime   => D_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Yneg,
                      PathCondition     => TRUE ) ),
            GlitchData      => Y_GlitchData );

    END PROCESS;

END vhdl_behavioral;
