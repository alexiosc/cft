--------------------------------------------------------------------------------
--  File Name: std42.vhd
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
--    V1.0     R. Munden   00 DEC 06   Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STND
--  Technology:  54/74XXXX
--  Part:        STD42
-- 
--  Desciption:  4 to 10 decoder
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std42 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_C              : VitalDelayType01 := VitalZeroDelay01;
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y0Neg         : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING   := DefaultInstancePath;
        MsgOn               : BOOLEAN  := DefaultMsgOn;
        XOn                 : BOOLEAN  := DefaultXOn;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        A           : IN    std_ulogic := 'U';
        B           : IN    std_ulogic := 'U';
        C           : IN    std_ulogic := 'U';
        D           : IN    std_ulogic := 'U';
        Y0Neg       : OUT   std_ulogic := 'U';
        Y1Neg       : OUT   std_ulogic := 'U';
        Y2Neg       : OUT   std_ulogic := 'U';
        Y3Neg       : OUT   std_ulogic := 'U';
        Y4Neg       : OUT   std_ulogic := 'U';
        Y5Neg       : OUT   std_ulogic := 'U';
        Y6Neg       : OUT   std_ulogic := 'U';
        Y7Neg       : OUT   std_ulogic := 'U';
        Y8Neg       : OUT   std_ulogic := 'U';
        Y9Neg       : OUT   std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std42 : ENTITY IS TRUE;
END std42;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std42 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A_ipd        : std_ulogic := 'U';
    SIGNAL B_ipd        : std_ulogic := 'U';
    SIGNAL C_ipd        : std_ulogic := 'U';
    SIGNAL D_ipd        : std_ulogic := 'U';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (A_ipd, A, tipd_A);
        w_2: VitalWireDelay (B_ipd, B, tipd_B);
        w_3: VitalWireDelay (C_ipd, C, tipd_C);
        w_4: VitalWireDelay (D_ipd, D, tipd_D);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Decode Process
    ----------------------------------------------------------------------------
    Decode : PROCESS (D_ipd, C_ipd, B_ipd, A_ipd)

        CONSTANT std42_tab : VitalTruthTableType := (
        -----------------------------------------------------------------------
        -------INPUTS------|------------------OUTPUTS--------------------------
        --D    C    B    A | Y0   Y1   Y2   Y3   Y4   Y5   Y6   Y7   Y8   Y9
        -----------------------------------------------------------------------
        ('0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1'), 
        ('0', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1'), 
        ('0', '0', '1', '0', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1'), 
        ('0', '0', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '1', '1'), 
        ('0', '1', '0', '0', '1', '1', '1', '1', '0', '1', '1', '1', '1', '1'), 
        ('0', '1', '0', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1'), 
        ('0', '1', '1', '0', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1'), 
        ('0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1'),
        ('1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1'),
        ('1', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0'),
        ('1', '-', '-', '-', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1')
        );

        -- Functionality Results Variables
        VARIABLE YData          : std_logic_vector(0 to 9);
        ALIAS Y0_zd             : std_ulogic IS YData(0);
        ALIAS Y1_zd             : std_ulogic IS YData(1);
        ALIAS Y2_zd             : std_ulogic IS YData(2);
        ALIAS Y3_zd             : std_ulogic IS YData(3);
        ALIAS Y4_zd             : std_ulogic IS YData(4);
        ALIAS Y5_zd             : std_ulogic IS YData(5);
        ALIAS Y6_zd             : std_ulogic IS YData(6);
        ALIAS Y7_zd             : std_ulogic IS YData(7);
        ALIAS Y8_zd             : std_ulogic IS YData(8);
        ALIAS Y9_zd             : std_ulogic IS YData(9);


        -- Output Glitch Detection Variables
        VARIABLE Y0_GlitchData  : VitalGlitchDataType;
        VARIABLE Y1_GlitchData  : VitalGlitchDataType;
        VARIABLE Y2_GlitchData  : VitalGlitchDataType;
        VARIABLE Y3_GlitchData  : VitalGlitchDataType;
        VARIABLE Y4_GlitchData  : VitalGlitchDataType;
        VARIABLE Y5_GlitchData  : VitalGlitchDataType;
        VARIABLE Y6_GlitchData  : VitalGlitchDataType;
        VARIABLE Y7_GlitchData  : VitalGlitchDataType;
        VARIABLE Y8_GlitchData  : VitalGlitchDataType;
        VARIABLE Y9_GlitchData  : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        YData := VitalTruthTable (
                    TruthTable  => std42_tab,
                    DataIn      => (D_ipd, C_ipd, B_ipd, A_ipd)
                 );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Y0Neg,
            OutSignalName   => "Y0Neg",
            OutTemp         => Y0_zd,
            GlitchData      => Y0_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => Y1Neg,
            OutSignalName   => "Y1Neg",
            OutTemp         => Y1_zd,
            GlitchData      => Y1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => Y2Neg,
            OutSignalName   => "Y2Neg",
            OutTemp         => Y2_zd,
            GlitchData      => Y2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => Y3Neg,
            OutSignalName   => "Y3Neg",
            OutTemp         => Y3_zd,
            GlitchData      => Y3_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => Y4Neg,
            OutSignalName   => "Y4Neg",
            OutTemp         => Y4_zd,
            GlitchData      => Y4_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => Y5Neg,
            OutSignalName   => "Y5Neg",
            OutTemp         => Y5_zd,
            GlitchData      => Y5_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => Y6Neg,
            OutSignalName   => "Y6Neg",
            OutTemp         => Y6_zd,
            GlitchData      => Y6_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => Y7Neg,
            OutSignalName   => "Y7Neg",
            OutTemp         => Y7_zd,
            GlitchData      => Y7_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => Y8Neg,
            OutSignalName   => "Y8Neg",
            OutTemp         => Y8_zd,
            GlitchData      => Y8_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

        VitalPathDelay01 (
            OutSignal       => Y9Neg,
            OutSignalName   => "Y9Neg",
            OutTemp         => Y9_zd,
            GlitchData      => Y9_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => C_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                3 => (
                    InputChangeTime => D_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

    END PROCESS;

END vhdl_behavioral;
