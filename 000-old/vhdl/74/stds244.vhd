--------------------------------------------------------------------------------
--  File Name: stds244.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998-2002 Free Model Foundry; http://www.FreeModelFoundry.com
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Steele   98 MAR 19   Initial release
--    V2.0     R. Munden   99 JUN 21   Rewritten using Holl method
--    V2.1     R. Munden   02 APR 01   change GATE1 to std_ulogic
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDS
--  Technology: N/A
--  Part:       STDS244
-- 
--  Desciption: FET Bus Switch 
--------------------------------------------------------------------------------
LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.switch_pkg.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stds244 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_OENeg              : VitalDelayType01  := VitalZeroDelay01;
        tipd_B                  : VitalDelayType01  := VitalZeroDelay01;
        tipd_A                  : VitalDelayType01  := VitalZeroDelay01;
        -- tpd delays
        tpd_A_B                 : VitalDelayType01  := UnitDelay01;
        tpd_OENeg_A             : VitalDelayType01  := UnitDelay01;
        -- generic control parameters
        MsgOn               : BOOLEAN  := DefaultMsgOn;
        XOn                 : BOOLEAN  := DefaultXOn;
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        OENeg           : IN    std_logic := 'U'; 
        A               : INOUT std_logic := 'Z'; 
        B               : INOUT std_logic := 'Z'  
    );                                            

    ATTRIBUTE VITAL_LEVEL0 of stds244 : ENTITY IS TRUE;
END stds244;
--------------------------------------------------------------------------------
--  ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Note that this model does honors only tpd_OENeg_A  and tipd_OENeg
--------------------------------------------------------------------------------

ARCHITECTURE vhdl_behavioral OF stds244 IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL OENeg_ipd        : std_ulogic := 'X';
    SIGNAL B_ipd            : std_ulogic := 'X';
    SIGNAL A_ipd            : std_ulogic := 'X';
    signal GATE1            : std_ulogic := 'X';
    signal SUBSTRATE1: std_logic := 'Z';
    signal SUB_DRIVE_1D: std_logic := 'Z';
    signal SUB_DRIVE_1S: std_logic := 'Z';
    signal AUX_EN: X01 := '1';
    signal SUSPEND: boolean;

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (B_ipd, B, tipd_B);
        w_2 : VitalWireDelay (A_ipd, A, tipd_A);
        w_3 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);

    END BLOCK;

    SW1: BILATERAL port map (
            GATE => GATE1,
            DRAIN => A,
            SOURCE => B,
            SUBSTRATE => SUBSTRATE1,
            SUB_DRIVE_D => SUB_DRIVE_1D,
            SUB_DRIVE_S => SUB_DRIVE_1S,
            AUX_EN => AUX_EN,
            SUSPEND => SUSPEND);

    ----------------------------------------------------------------------------
    -- Control Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (OENeg_ipd)

        -- Functionality Results Variables
        VARIABLE OE_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE OE_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        OE_zd := VitalINV(data => OENeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => GATE1,
            OutSignalName   => "GATE1",
            OutTemp         => OE_zd,
            GlitchData      => OE_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
