--------------------------------------------------------------------------------
--  File Name: std33.vhd
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
--    V1.0  R. Munden  00 JUN 24  Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD33
-- 
--  Desciption:  2-input positve-NOR gate w/open collector output
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std33 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_B_YNeg          : VitalDelayType01 := UnitDelay01;
        tpd_A_YNeg          : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING   := DefaultInstancePath;
        MsgOn               : BOOLEAN  := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );

    PORT (
        B           : IN    std_ulogic := 'U';
        A           : IN    std_ulogic := 'U';
        YNeg        : OUT   std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std33 : ENTITY IS TRUE;
END std33;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std33 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL B_ipd        : std_ulogic := 'U';
    SIGNAL A_ipd        : std_ulogic := 'U';

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
    -- VITALBehavior Process
    ----------------------------------------------------------------------------
        VITALBehavior1 : PROCESS(A_ipd, B_ipd)

        -- Functionality Results Variables
        VARIABLE YNeg_zd        : std_ulogic := 'X';

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData : VitalGlitchDataType;

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
                YNeg_zd := VitalNOR2(a=> A_ipd, b => B_ipd,
                                      Resultmap => STD_wired_and_rmap);

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
                      PathCondition     => TRUE ) ),
            GlitchData      => Y_GlitchData );

    END PROCESS;

END vhdl_behavioral;

