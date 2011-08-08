--------------------------------------------------------------------------------
--  File Name: stdh240.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2001 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   01 MAR 17   initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: 54/74XXXX
--  Part:       STDH240
-- 
--  Description: Inverting line driver w/ 3-state output and bus hold
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh240 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_YNeg                : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_YNeg               : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_YNeg           : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        YNeg            : OUT   std_logic := 'U';
        A               : IN    std_logic := 'U';
        OENeg           : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh240 : ENTITY IS TRUE;
END stdh240;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh240 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A_ipd               : std_ulogic := 'U';
    SIGNAL Aint                : std_logic  := 'U';
    SIGNAL AintNeg             : std_ulogic := 'U';
    SIGNAL OENeg_ipd           : std_ulogic := 'U';

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
        VARIABLE ANeg              : std_ulogic;
        VARIABLE YNeg_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE YNeg_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        ANeg := VitalINV (data => Aint);
        YNeg_zd := VitalBUFIF0 (data => ANeg, enable => OENeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       =>  YNeg,
            OutSignalName   =>  "YNeg",
            OutTemp         =>  YNeg_zd,
            GlitchData      => YNeg_GlitchData,
            Paths           => (
                0 => (InputChangeTime   => Aint'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_YNeg),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_YNeg,
                      PathCondition     => TRUE))
        );

    END PROCESS;

END vhdl_behavioral;
