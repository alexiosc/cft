--------------------------------------------------------------------------------
--   File Name : std1g97.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2010 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY :
--
--  version: |    author: |   mod. date: |    changes made:
--    V1.0      R. Munden     10 APR 30   Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD1G97
--
--  Desciption:  Configurable Multiple-Function Gate
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_primitives.all;
                 USE IEEE.VITAL_timing.all;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std1g97 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_In0        : VitalDelayType01 := VitalZeroDelay01;
        tipd_In1        : VitalDelayType01 := VitalZeroDelay01;
        tipd_In2        : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays:
        tpd_In0_Y       : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        TimingChecksOn  : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        InstancePath    : STRING    := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
        );
    PORT (
        Y               : OUT   std_ulogic := 'U';
        In0             : IN    std_ulogic := 'U';
        In1             : IN    std_ulogic := 'U';
        In2             : IN    std_ulogic := 'U'
    );

    ATTRIBUTE VITAL_LEVEL0 of std1g97 : ENTITY IS TRUE;
END std1g97;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std1g97 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL In0_ipd          : std_ulogic := 'U';
    SIGNAL In1_ipd          : std_ulogic := 'U';
    SIGNAL In2_ipd          : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w1: VitalWireDelay (In0_ipd, In0, tipd_In0);
        w2: VitalWireDelay (In1_ipd, In1, tipd_In1);
        w3: VitalWireDelay (In2_ipd, In2, tipd_In2);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- VITALBehavior Process
    ----------------------------------------------------------------------------
    VITALBehavior1 : PROCESS(In2_ipd, In1_ipd, In0_ipd)

        CONSTANT std1g97_tab : VitalTruthTableType := (
        ----------------------------------------------
        ---INPUTS-------|-OUTPUT-
        --In2  In1  In0 | Y
        ----------------------------------------------
        ('-', 'X', '-', 'X'),
        ('X', '-', '-', 'X'),
        ('0', '0', '-', '0'),
        ('0', '1', '-', '1'),
        ('1', '0', 'X', 'X'),
        ('1', '0', '0', '0'),
        ('1', '0', '1', '1'),
        ('1', '1', 'X', 'X'),
        ('1', '1', '0', '0'),
        ('1', '1', '1', '1')
        );

        -- Functionality Results Variables
        VARIABLE OData : std_ulogic;
        ALIAS Y_zd     : std_ulogic IS OData;

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData : VitalGlitchDataType;

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        OData := VitalTruthTable (
                    TruthTable => std1g97_tab,
                    DataIn     => (In2_ipd, In1_ipd, In0_ipd)
                 );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  Y,
            OutSignalName   =>  "Y",
            OutTemp         =>  Y_zd,
            Paths           => (
                0 => (InputChangeTime   => In0_ipd'LAST_EVENT,
                      PathDelay         => tpd_In0_Y,
                      PathCondition     => TRUE ),
                1 => (InputChangeTime   => In1_ipd'LAST_EVENT,
                      PathDelay         => tpd_In0_Y,
                      PathCondition     => TRUE ),
                2 => (InputChangeTime   => In2_ipd'LAST_EVENT,
                      PathDelay         => tpd_In0_Y,
                      PathCondition     => TRUE ) ),
            GlitchData      => Y_GlitchData );

    END PROCESS;

END vhdl_behavioral;
