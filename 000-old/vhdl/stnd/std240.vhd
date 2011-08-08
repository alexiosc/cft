--------------------------------------------------------------------------------
--  File Name: std240.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   97 MAY 27   conforms to style guide
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STD
--  Technology: 54/74XXXX
--  Part:       STD240
-- 
--  Desciption: Inverting line driver with 3-state output
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std240 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_YNeg                : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_YNeg                         : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_YNeg                     : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        YNeg            : OUT   std_logic := 'X';
        A               : IN    std_logic := 'X';
        OENeg           : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std240 : ENTITY IS TRUE;
END std240;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std240 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

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
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalINVIF0 (
            q             => YNeg,
            Data          => A_ipd,
            Enable        => OENeg_ipd,
            tpd_data_q    => tpd_A_YNeg,
            tpd_enable_q  => tpd_OENeg_YNeg
        );

END vhdl_behavioral;
