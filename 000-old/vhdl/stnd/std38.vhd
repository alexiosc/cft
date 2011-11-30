--------------------------------------------------------------------------------
--  File Name: std38.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997-2006 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0  R. Steele  97 JAN 30  Conformed to style guide
--    V1.1  R. Steele  97 APR 16  Changed wired-or to wired-and
--    V1.2  R. Munden  06 Aug 31  Made ResultMap locally static
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD38
-- 
--  Desciption:  Quadruple 2-input positve-NAND buffers
--               with open-collector outputs
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std38 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_B_YNeg          : VitalDelayType01 := UnitDelay01;
        tpd_A_YNeg          : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        B           : IN    std_ulogic := 'U';
        A           : IN    std_ulogic := 'U';
        YNeg        : OUT   std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std38 : ENTITY IS TRUE;
END std38;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std38 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL B_ipd        : std_ulogic := 'U';
    SIGNAL A_ipd        : std_ulogic := 'U';


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
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalNAND2 (
            q         => YNeg,
            a         => A_ipd,
            b         => B_ipd,
            tpd_a_q   => tpd_A_YNeg,
            tpd_b_q   => tpd_B_YNeg,
            Resultmap => ('U','X','0','Z')
         );

END vhdl_behavioral;
