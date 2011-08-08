--------------------------------------------------------------------------------
--  File Name: std827.vhd
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
--    V1.0     R. Munden   97 JUN 18   conforms to style guide
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STD
--  Technology: 54/74XXXX
--  Part:       STD827
-- 
--  Desciption: Buffer with 3-state output
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std827 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_Y                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE1Neg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE2Neg              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y                            : VitalDelayType01 := UnitDelay01;
        tpd_OE1Neg_Y                       : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Y               : OUT   std_logic := 'X';
        A               : IN    std_logic := 'X';
        OE1Neg          : IN    std_logic := 'U';
        OE2Neg          : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std827 : ENTITY IS TRUE;
END std827;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std827 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL OE1Neg_ipd          : std_ulogic := 'X';
    SIGNAL OE2Neg_ipd          : std_ulogic := 'X';
    SIGNAL OEint               : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (OE1Neg_ipd, OE1Neg, tipd_OE1Neg);
        w_3 : VitalWireDelay (OE2Neg_ipd, OE2Neg, tipd_OE2Neg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalOR2 (
            q         => OEint,
            a         => OE1Neg_ipd,
            b         => OE2Neg_ipd
         );

    a_2: VitalBUFIF0 (
            q             => Y,
            Data          => A_ipd,
            Enable        => OEint,
            tpd_data_q    => tpd_A_Y,
            tpd_enable_q  => tpd_OE1Neg_Y
        );

END vhdl_behavioral;
