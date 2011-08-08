--------------------------------------------------------------------------------
--  File Name: std1004.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997, 2000 Free Model Foundry http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0  R. Munden  00 OCT 22  modified std04 V2.0
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STND
--  Technology:  54/74XXXX
--  Part:        STD1004
-- 
--  Desciption:  Inverter
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std1004 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
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
        A           : IN    std_ulogic := 'U';
        YNeg        : OUT   std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std1004 : ENTITY IS TRUE;
END std1004;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std1004 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A_ipd        : std_ulogic := 'U';


BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (A_ipd, A, tipd_A);

    END BLOCK;

    ----------------------------------------------------------------------------
        -- VITALBehavior Process
    ----------------------------------------------------------------------------
        VITALBehavior : PROCESS(A_ipd)

        -- Functionality Results Variables
        VARIABLE YNeg_zd        : std_ulogic := 'U';

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData : VitalGlitchDataType;

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
            YNeg_zd := VitalINV (A_ipd);

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
                      PathCondition     => TRUE ) ),
            GlitchData      => Y_GlitchData );

    END PROCESS;

END vhdl_behavioral;
