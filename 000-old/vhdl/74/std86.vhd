--------------------------------------------------------------------------------
--  File Name: std86.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0  R. Munden  98 APR 09  Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD86
-- 
--  Desciption:  2-input exclusive-OR gate
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std86 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y          : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        MsgOn               : BOOLEAN  := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        B           : IN    std_logic := 'X';
        A           : IN    std_logic := 'X';
        Y        : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std86 : ENTITY IS TRUE;
END std86;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std86 IS
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
        -- VITALBehavior Process
    ----------------------------------------------------------------------------
        VITALBehavior1 : PROCESS(A_ipd, B_ipd)

        -- Functionality Results Variables
        VARIABLE Y_zd        : std_ulogic := 'X';

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData : VitalGlitchDataType;

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
                Y_zd := VitalXOR2(a=> A_ipd, b => B_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  Y,
            OutSignalName   =>  "Y",
            OutTemp         =>  Y_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Y,
                      PathCondition     => TRUE ),
                1 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_Y,
                      PathCondition     => TRUE ) ),
            GlitchData      => Y_GlitchData );

    END PROCESS;

END vhdl_behavioral;
