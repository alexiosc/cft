--------------------------------------------------------------------------------
--  File Name: std148.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2000 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made
--    V1.0     R. Munden   00 DEC 10   Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STND
--  Technology:  54/74XXXX
--  Part:        STD148
-- 
--  Desciption:  8-Line to 3-Line Priority Encoder
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std148 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D0             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D1             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D2             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D3             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D4             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D5             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D6             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D7             : VitalDelayType01 := VitalZeroDelay01;
        tipd_EI             : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_D1_A0           : VitalDelayType01 := UnitDelay01;
        tpd_D0_EO           : VitalDelayType01 := UnitDelay01;
        tpd_D0_GS           : VitalDelayType01 := UnitDelay01;
        tpd_EI_A0           : VitalDelayType01 := UnitDelay01;
        tpd_EI_EO           : VitalDelayType01 := UnitDelay01;
        tpd_EI_GS           : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING   := DefaultInstancePath;
        MsgOn               : BOOLEAN  := DefaultMsgOn;
        XOn                 : BOOLEAN  := DefaultXOn;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        D0          : IN    std_ulogic := 'U';
        D1          : IN    std_ulogic := 'U';
        D2          : IN    std_ulogic := 'U';
        D3          : IN    std_ulogic := 'U';
        D4          : IN    std_ulogic := 'U';
        D5          : IN    std_ulogic := 'U';
        D6          : IN    std_ulogic := 'U';
        D7          : IN    std_ulogic := 'U';
        EI          : IN    std_ulogic := 'U';
        A0          : OUT   std_ulogic := 'U';
        A1          : OUT   std_ulogic := 'U';
        A2          : OUT   std_ulogic := 'U';
        EO          : OUT   std_ulogic := 'U';
        GS          : OUT   std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std148 : ENTITY IS TRUE;
END std148;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std148 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL D0_ipd        : std_ulogic := 'U';
    SIGNAL D1_ipd        : std_ulogic := 'U';
    SIGNAL D2_ipd        : std_ulogic := 'U';
    SIGNAL D3_ipd        : std_ulogic := 'U';
    SIGNAL D4_ipd        : std_ulogic := 'U';
    SIGNAL D5_ipd        : std_ulogic := 'U';
    SIGNAL D6_ipd        : std_ulogic := 'U';
    SIGNAL D7_ipd        : std_ulogic := 'U';
    SIGNAL EI_ipd        : std_ulogic := 'U';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (D0_ipd, D0, tipd_D0);
        w_2: VitalWireDelay (D1_ipd, D1, tipd_D1);
        w_3: VitalWireDelay (D2_ipd, D2, tipd_D2);
        w_4: VitalWireDelay (D3_ipd, D3, tipd_D3);
        w_5: VitalWireDelay (D4_ipd, D4, tipd_D4);
        w_6: VitalWireDelay (D5_ipd, D5, tipd_D5);
        w_7: VitalWireDelay (D6_ipd, D6, tipd_D6);
        w_8: VitalWireDelay (D7_ipd, D7, tipd_D7);
        w_9: VitalWireDelay (EI_ipd, EI, tipd_EI);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Encode Process
    ----------------------------------------------------------------------------
    Encode : PROCESS (D0_ipd, D1_ipd, D2_ipd, D3_ipd, D4_ipd, D5_ipd, D6_ipd,
                      D7_ipd, EI_ipd) 

        CONSTANT std148_tab : VitalTruthTableType := (
        -----------------------------------------------------------------------
        -------INPUTS-------------------------------|--------OUTPUTS-----------
        --EI   D0   D1   D2   D3  D4   D5   D6   D7   A2   A1   A0   GS   EO
        -----------------------------------------------------------------------
        ('1', '-', '-', '-', '-', '-', '-', '-', '-', '1', '1', '1', '1', '1'), 
        ('0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0'), 
        ('0', '-', '-', '-', '-', '-', '-', '-', '0', '0', '0', '0', '0', '1'), 
        ('0', '-', '-', '-', '-', '-', '-', '0', '1', '0', '0', '1', '0', '1'), 
        ('0', '-', '-', '-', '-', '-', '0', '1', '1', '0', '1', '0', '0', '1'), 
        ('0', '-', '-', '-', '-', '0', '1', '1', '1', '0', '1', '1', '0', '1'), 
        ('0', '-', '-', '-', '0', '1', '1', '1', '1', '1', '0', '0', '0', '1'), 
        ('0', '-', '-', '0', '1', '1', '1', '1', '1', '1', '0', '1', '0', '1'),
        ('0', '-', '0', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1'),
        ('0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1')
        );

        -- Functionality Results Variables
        VARIABLE OutData     : std_logic_vector(0 to 4);
        ALIAS A2_zd          : std_ulogic IS OutData(0);
        ALIAS A1_zd          : std_ulogic IS OutData(1);
        ALIAS A0_zd          : std_ulogic IS OutData(2);
        ALIAS GS_zd          : std_ulogic IS OutData(3);
        ALIAS EO_zd          : std_ulogic IS OutData(4);


        -- Output Glitch Detection Variables
        VARIABLE A2_GlitchData  : VitalGlitchDataType;
        VARIABLE A1_GlitchData  : VitalGlitchDataType;
        VARIABLE A0_GlitchData  : VitalGlitchDataType;
        VARIABLE GS_GlitchData  : VitalGlitchDataType;
        VARIABLE EO_GlitchData  : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        OutData := VitalTruthTable (
                    TruthTable  => std148_tab,
                    DataIn      => (EI_ipd, D0_ipd, D1_ipd, D2_ipd, D3_ipd,
                                    D4_ipd, D5_ipd, D6_ipd, D7_ipd) 
                 );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => A2,
            OutSignalName   => "A2",
            OutTemp         => A2_zd,
            GlitchData      => A2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => EI_ipd'LAST_EVENT,
                    PathDelay       => tpd_EI_A0,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => D1_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                2 => (
                    InputChangeTime => D2_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                3 => (
                    InputChangeTime => D3_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                4 => (
                    InputChangeTime => D4_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                5 => (
                    InputChangeTime => D5_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                6 => (
                    InputChangeTime => D6_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                7 => (
                    InputChangeTime => D7_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')))
            );

        VitalPathDelay01 (
            OutSignal       => A1,
            OutSignalName   => "A1",
            OutTemp         => A1_zd,
            GlitchData      => A1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => EI_ipd'LAST_EVENT,
                    PathDelay       => tpd_EI_A0,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => D1_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                2 => (
                    InputChangeTime => D2_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                3 => (
                    InputChangeTime => D3_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                4 => (
                    InputChangeTime => D4_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                5 => (
                    InputChangeTime => D5_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                6 => (
                    InputChangeTime => D6_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                7 => (
                    InputChangeTime => D7_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')))
            );

        VitalPathDelay01 (
            OutSignal       => A0,
            OutSignalName   => "A0",
            OutTemp         => A0_zd,
            GlitchData      => A0_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => EI_ipd'LAST_EVENT,
                    PathDelay       => tpd_EI_A0,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => D1_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                2 => (
                    InputChangeTime => D2_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                3 => (
                    InputChangeTime => D3_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                4 => (
                    InputChangeTime => D4_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                5 => (
                    InputChangeTime => D5_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                6 => (
                    InputChangeTime => D6_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                7 => (
                    InputChangeTime => D7_ipd'LAST_EVENT,
                    PathDelay       => tpd_D1_A0,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')))
            );

        VitalPathDelay01 (
            OutSignal       => GS,
            OutSignalName   => "GS",
            OutTemp         => GS_zd,
            GlitchData      => GS_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => D0_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_GS,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                1 => (
                    InputChangeTime => D1_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_GS,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                2 => (
                    InputChangeTime => D2_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_GS,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                3 => (
                    InputChangeTime => D3_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_GS,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                4 => (
                    InputChangeTime => D4_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_GS,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                5 => (
                    InputChangeTime => D5_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_GS,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                6 => (
                    InputChangeTime => D6_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_GS,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                7 => (
                    InputChangeTime => D7_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_GS,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                8 => (
                    InputChangeTime => EI_ipd'LAST_EVENT,
                    PathDelay       => tpd_EI_GS,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => EO,
            OutSignalName   => "EO",
            OutTemp         => EO_zd,
            GlitchData      => EO_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => D0_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_EO,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                1 => (
                    InputChangeTime => D1_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_EO,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                2 => (
                    InputChangeTime => D2_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_EO,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                3 => (
                    InputChangeTime => D3_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_EO,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                4 => (
                    InputChangeTime => D4_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_EO,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                5 => (
                    InputChangeTime => D5_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_EO,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                6 => (
                    InputChangeTime => D6_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_EO,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                7 => (
                    InputChangeTime => D7_ipd'LAST_EVENT,
                    PathDelay       => tpd_D0_EO,
                    PathCondition   => (EI_ipd = '0' OR EI_ipd = 'L')),
                8 => (
                    InputChangeTime => EI_ipd'LAST_EVENT,
                    PathDelay       => tpd_EI_EO,
                    PathCondition   => TRUE))
            );

    END PROCESS;

END vhdl_behavioral;
