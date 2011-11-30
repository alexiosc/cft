--------------------------------------------------------------------------------
--  File Name: stdh244.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997, 1999 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Steele   97 NOV 13   conforms to style guide
--    V1.1     R. Munden   99 MAY 05   removed xon, msgon from pathdelay
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: 54/74XXXX bus hold
--  Part:       STDH244
-- 
--  Desciption: Line driver with 3-state output and bus hold
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh244 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_Y                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y                  : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_Y              : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_logic := 'X';
        A               : IN    std_logic := 'X';
        OENeg           : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh244 : ENTITY IS TRUE;
END stdh244;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh244 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL Aint                : std_logic := 'X';
    SIGNAL AintNeg             : std_ulogic := 'X';
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
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUF (q => Aint, a => A_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_2: VitalINV (q => AintNeg, a => Aint);
    a_3: VitalINV (q => Aint, a => AintNeg, ResultMap => ('Z', 'Z', '0', '1'));

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (Aint, OENeg_ipd)

        -- Functionality Results Variables
        VARIABLE Y_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Y_zd := VitalBUFIF0 (data => Aint, enable => OENeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       =>  Y,
            OutSignalName   =>  "Y",
            OutTemp         =>  Y_zd,
            GlitchData      => Y_GlitchData,
            Paths           => (
                0 => (InputChangeTime   => Aint'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_Y),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_Y,
                      PathCondition     => TRUE))
        );
 
    END PROCESS;

END vhdl_behavioral;
