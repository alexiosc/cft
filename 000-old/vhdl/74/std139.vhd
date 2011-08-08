--------------------------------------------------------------------------------
--  File Name: std139.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made
--    V1.0     R. Munden   97 SEP 24   Conformed to style guide
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD139
-- 
--  Desciption:  2 to 4 decoder
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std139 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        tipd_GNeg           : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y0Neg         : VitalDelayType01 := UnitDelay01;
        tpd_GNeg_Y0Neg      : VitalDelayType01 := UnitDelay01;
        -- generic control parameters
        InstancePath        : STRING   := DefaultInstancePath;
        MsgOn               : BOOLEAN  := DefaultMsgOn;
        XOn                 : BOOLEAN  := DefaultXOn;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        A           : IN    std_logic := 'X';
        B           : IN    std_logic := 'X';
        GNeg        : IN    std_logic := 'X';
        Y0Neg       : OUT   std_logic := 'U';
        Y1Neg       : OUT   std_logic := 'U';
        Y2Neg       : OUT   std_logic := 'U';
        Y3Neg       : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std139 : ENTITY IS TRUE;
END std139;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std139 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A_ipd        : std_ulogic := 'X';
    SIGNAL B_ipd        : std_ulogic := 'X';
    SIGNAL GNeg_ipd     : std_ulogic := 'X';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (A_ipd, A, tipd_A);
        w_2: VitalWireDelay (B_ipd, B, tipd_B);
        w_3: VitalWireDelay (GNeg_ipd, GNeg, tipd_GNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Decode Process
    ----------------------------------------------------------------------------
    Decode : PROCESS (GNeg_ipd, B_ipd, A_ipd)

        CONSTANT std139_tab : VitalTruthTableType := (
            -----------------------------------
            -----INPUTS---|-------OUTPUTS------
            --G    B    A | Y0   Y1   Y2   Y3  
            ------------------------------------
            ('1', '-', '-', '1', '1', '1', '1'), 
            ('0', '0', '0', '0', '1', '1', '1'), 
            ('0', '0', '1', '1', '0', '1', '1'), 
            ('0', '1', '0', '1', '1', '0', '1'), 
            ('0', '1', '1', '1', '1', '1', '0')
        );

        -- Functionality Results Variables
        VARIABLE YData          : std_logic_vector(0 to 3);
        ALIAS Y0_zd             : std_ulogic IS YData(0);
        ALIAS Y1_zd             : std_ulogic IS YData(1);
        ALIAS Y2_zd             : std_ulogic IS YData(2);
        ALIAS Y3_zd             : std_ulogic IS YData(3);


        -- Output Glitch Detection Variables
        VARIABLE Y0_GlitchData  : VitalGlitchDataType;
        VARIABLE Y1_GlitchData  : VitalGlitchDataType;
        VARIABLE Y2_GlitchData  : VitalGlitchDataType;
        VARIABLE Y3_GlitchData  : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        YData := VitalTruthTable (
                    TruthTable  => std139_tab,
                    DataIn      => (GNeg_ipd, B_ipd, A_ipd)
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
                    InputChangeTime => GNeg_ipd'LAST_EVENT,
                    PathDelay       => tpd_GNeg_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
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
                    InputChangeTime => GNeg_ipd'LAST_EVENT,
                    PathDelay       => tpd_GNeg_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
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
                    InputChangeTime => GNeg_ipd'LAST_EVENT,
                    PathDelay       => tpd_GNeg_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
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
                    InputChangeTime => GNeg_ipd'LAST_EVENT,
                    PathDelay       => tpd_GNeg_Y0Neg,
                    PathCondition   => TRUE),
                1 => (
                    InputChangeTime => A_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE),
                2 => (
                    InputChangeTime => B_ipd'LAST_EVENT,
                    PathDelay       => tpd_A_Y0Neg,
                    PathCondition   => TRUE))
            );

    END PROCESS;

END vhdl_behavioral;
