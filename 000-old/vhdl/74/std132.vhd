--------------------------------------------------------------------------------
--  File Name: std132.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORYNeg:
-- 
--  version | author  | mod date | changes made
--    V1.0  R. Munden  97 DEC 11  Conformed to style guide
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD132
-- 
--  Desciption:  2-input positve-NAND gate
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITYNeg DECLARATION
--------------------------------------------------------------------------------
ENTITY std132 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_YNeg          : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING   := DefaultInstancePath;
        MsgOn               : BOOLEAN := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        B        : IN    std_logic := 'X';
        A        : IN    std_logic := 'X';
        YNeg        : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std132 : ENTITY IS TRUE;
END std132;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std132 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL B_ipd        : std_ulogic := 'X';
    SIGNAL A_ipd        : std_ulogic := 'X';


BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (B_ipd, B, tipd_B);
        w_2: VitalWireDelay (A_ipd, A, tipd_A);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (A_ipd, B_ipd)

        -- Functionality Results Variables
        VARIABLE YNeg_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE YNeg_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        YNeg_zd := VitalNAND2 (a => A_ipd, b => B_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  YNeg,
            OutSignalName   =>  "YNeg",
            OutTemp         =>  YNeg_zd,
            GlitchData      => YNeg_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                     PathCondition     => TRUE),
                1 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_YNeg,
                      PathCondition     => TRUE))
        );

    END PROCESS;

END vhdl_behavioral;
