--------------------------------------------------------------------------------
--  File Name: std27.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1999 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundry.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0  M. Li      99 AUG 20  Conformed to style guide
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD27
-- 
--  Desciption:  3-input positive-NOR gate
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std27 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_C              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_YNeg          : VitalDelayType01 := UnitDelay01;
        tpd_B_YNeg          : VitalDelayType01 := UnitDelay01;
        tpd_C_YNeg          : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        A           : IN    std_logic := 'X';
        B           : IN    std_logic := 'X';
        C           : IN    std_logic := 'X';
        YNeg        : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std27 : ENTITY IS TRUE;
END std27;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std27 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A_ipd        : std_ulogic := 'X';
    SIGNAL B_ipd        : std_ulogic := 'X';
    SIGNAL C_ipd        : std_ulogic := 'X';


BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (A_ipd, A, tipd_A);
        w_2: VitalWireDelay (B_ipd, B, tipd_B);
        w_3: VitalWireDelay (C_ipd, C, tipd_C);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalNOR3 (
            q         => YNeg,
            a         => A_ipd,
            b         => B_ipd,
            c         => C_ipd,
            tpd_a_q   => tpd_A_YNeg,
            tpd_b_q   => tpd_B_YNeg,
            tpd_c_q   => tpd_C_YNeg
         );

END vhdl_behavioral;

