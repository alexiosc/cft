--------------------------------------------------------------------------------
--  File Name: std125.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997-2007 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:      | mod date: | changes made:
--    V1.0     R. Munden       97 JUL 25   conforms to style guide
--    V1.1     D. Stanojkovic  07 MAY 15   vital behavior process added
--                                         path delay section added
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STD
--  Technology: 54/74XXXX
--  Part:       STD125
-- 
--  Desciption: Line driver with 3-state output
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std125 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_Y              : VitalDelayType01 := VitalZeroDelay01;
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg          : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y             : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_Y         : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        TimingChecksOn  : BOOLEAN   := DefaultTimingChecks;
        MsgOn           : BOOLEAN   := DefaultMsgOn;
        XOn             : Boolean   := DefaultXOn;
        InstancePath    : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_ulogic := 'U';
        A               : IN    std_ulogic := 'U';
        OENeg           : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std125 : ENTITY IS TRUE;
END std125;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std125 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL OENeg_ipd           : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- VITALBehavior Process
    ----------------------------------------------------------------------------
    VITALBehavior : PROCESS(A_ipd, OENeg_ipd)

        -- Functionality Result Variable
        VARIABLE Y_zd               : std_ulogic;

        -- Output Glitch Detection Variable
        VARIABLE Y_GlitchData       : VitalGlitchDataType;

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------

         Y_zd := VitalBUFIF0 (data => A_ipd, enable => OENeg_ipd );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => Y,
            OutSignalName   => "Y",
            OutTemp         => Y_zd,
            GlitchData      => Y_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_Y),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_Y,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
