--------------------------------------------------------------------------------
--  File Name: std21.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1999 Free Model Foundation; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
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
--  Part:        STD21
-- 
--  Description:  4-input positive-AND gate
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std21 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
        tipd_C              : VitalDelayType01 := VitalZeroDelay01;
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y          : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        MsgOn               : BOOLEAN := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        D        : IN    std_logic := 'X';
        C        : IN    std_logic := 'X';
        B        : IN    std_logic := 'X';
        A        : IN    std_logic := 'X';
        Y        : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std21 : ENTITY IS TRUE;
END std21;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std21 IS
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
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (A_ipd, B_ipd, C_ipd, D_ipd)

        -- Functionality Results Variables
        VARIABLE Y_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Y_zd := VitalAND4  (a => A_ipd,
                            b => B_ipd, 
                            c => C_ipd, 
                            d => D_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  Y,
            OutSignalName   =>  "Y",
            OutTemp         =>  Y_zd,
            GlitchData      => Y_GlitchData,
            Paths           => (
                0 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Y,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Y,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => C_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Y,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => D_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Y,
                      PathCondition     => TRUE))
        );

    END PROCESS;

END vhdl_behavioral;
