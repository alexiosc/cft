--------------------------------------------------------------------------------
--  File Name: pull.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   98 FEB 13   conforms to style guide
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    MISC
--  Technology: X
--  Part:       X
-- 
--  Desciption: PULL-UP or PULL-DOWN
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY pull IS
    GENERIC (
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath
    );
    PORT (
        A               : IN    std_logic := 'U';
        B               : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of pull : ENTITY IS FALSE;
END pull;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of pull IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

BEGIN

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------

    B <= 'H' when A = '1' else 'L';

END vhdl_behavioral;
