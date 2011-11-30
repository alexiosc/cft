--------------------------------------------------------------------------------
--  File name: dgnd.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1996, 1997  Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Steele   97 APR 21   Initial release
--    V1.1     R. Steele   97 JUN 25   Added use vital
--------------------------------------------------------------------------------
--   PART DESCRIPTION:
-- 
--   Library:       SOURCES
--   Technology:    N/A
--   Part:          DGND
-- 
--   Description: Source of simulation value GND -> std_logic '0'
-- 
--------------------------------------------------------------------------------
LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_primitives.all;
                USE IEEE.VITAL_timing.all;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY dgnd IS
    port (    
            G   : OUT   std_logic := '0'  
         );

    ATTRIBUTE VITAL_level0 OF dgnd : ENTITY IS TRUE;
END dgnd;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral OF dgnd IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    G <= '0';

END vhdl_behavioral;
