--------------------------------------------------------------------------------
--  File Name: std157.vhd
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
--    V1.0     R. Munden   97 OCT 14   conforms to style guide
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STD
--  Technology: 54/74XXXX
--  Part:       STD157
-- 
--  Desciption: 2:1 Mux with enable
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std157 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_Y                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_SEL                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y                  : VitalDelayType01 := UnitDelay01;
        tpd_SEL_Y                : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_Y              : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_logic := 'X';
        A               : IN    std_logic := 'X';
        B               : IN    std_logic := 'X';
        SEL             : IN    std_logic := 'X';
        OENeg           : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std157 : ENTITY IS TRUE;
END std157;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std157 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL B_ipd               : std_ulogic := 'X';
    SIGNAL SEL_ipd             : std_ulogic := 'X';
    SIGNAL OENeg_ipd           : std_ulogic := 'X';
    SIGNAL OEint               : std_ulogic := 'X';
    SIGNAL ABint               : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (B_ipd, B, tipd_B);
        w_3 : VitalWireDelay (SEL_ipd, SEL, tipd_SEL);
        w_4 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalINV (
            q            => OEint,
            a            => OENeg_ipd,
            tpd_a_q      => tpd_OENeg_Y
         );

    a_2: VitalAND2 (
            q             => Y,
            a             => ABint,
            b             => OEint
        );

    a_3: VitalMUX2 (
            q            => ABint,
            d1           => B_ipd,
            d0           => A_ipd,
            dsel         => SEL_ipd,
            tpd_d1_q     => tpd_A_Y,
            tpd_d0_q     => tpd_A_Y,
            tpd_dsel_q   => tpd_SEL_Y
        );

END vhdl_behavioral;
