--------------------------------------------------------------------------------
--   File Name : stdvmeh22501.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2007 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY :
--
--  version: |    author: |   mod. date: |    changes made:
--    V1.0     R. Munden      07 SEP 23   Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STDVMEH22501
--
--  Desciption:  8-bit Universal Bus Transceiver and Two 1-bit Bus Transceivers
--               with Split Port, Feedback Path, and 3-State Outputs
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_primitives.all;
                 USE IEEE.VITAL_timing.all;
LIBRARY FMF;     USE FMF.gen_utils.ALL;
                 USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdvmeh22501 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBY1Neg            : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEAB1               : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBY2Neg            : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEAB2               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_DIR                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_LE                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKAB               : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKBA               : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBA0                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBA1                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBA2                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBA3                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBA4                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBA5                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBA6                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBA7                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBB0                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBB1                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBB2                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBB3                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBB4                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBB5                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBB6                : VitalDelayType01 := VitalZeroDelay01;
        tipd_UBB7                : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A1_B1                : VitalDelayType01 := UnitDelay01;
        tpd_A1_Y1                : VitalDelayType01 := UnitDelay01;
        tpd_B1_Y1                : VitalDelayType01 := UnitDelay01;
        tpd_OEAB1_B1             : VitalDelayType01Z:= UnitDelay01Z;
        tpd_OEBY1Neg_Y1          : VitalDelayType01Z:= UnitDelay01Z;
        tpd_UBA1_UBB1            : VitalDelayType01 := UnitDelay01;
        tpd_UBB1_UBA1            : VitalDelayType01 := UnitDelay01;
        tpd_LE_UBA1              : VitalDelayType01 := UnitDelay01;
        tpd_LE_UBB1              : VitalDelayType01 := UnitDelay01;
        tpd_CLKAB_UBB1           : VitalDelayType01 := UnitDelay01;
        tpd_CLKBA_UBA1           : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_UBB1           : VitalDelayType01Z:= UnitDelay01Z;
        tpd_OENeg_UBA1           : VitalDelayType01Z:= UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_UBA1_CLKAB        : VitalDelayType := UnitDelay;
        tsetup_UBA1_LE           : VitalDelayType := UnitDelay;
        tsetup_UBB1_CLKBA        : VitalDelayType := UnitDelay;
        tsetup_UBB1_LE           : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_UBA1_CLKAB         : VitalDelayType := UnitDelay;
        thold_UBA1_LE            : VitalDelayType := UnitDelay;
        thold_UBB1_CLKBA         : VitalDelayType := UnitDelay;
        thold_UBB1_LE            : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_LE_posedge           : VitalDelayType := UnitDelay;
        tpw_CLKAB_posedge        : VitalDelayType := UnitDelay;
        tpw_CLKAB_negedge        : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLKAB_posedge    : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        A1               : IN    std_ulogic := 'U';
        B1               : INOUT std_ulogic := 'U';
        OEAB1            : IN    std_ulogic := 'U';
        OEBY1Neg         : IN    std_ulogic := 'U';
        Y1               : OUT   std_ulogic := 'U';
        A2               : IN    std_ulogic := 'U';
        B2               : INOUT std_ulogic := 'U';
        OEAB2            : IN    std_ulogic := 'U';
        OEBY2Neg         : IN    std_ulogic := 'U';
        Y2               : OUT   std_ulogic := 'U';
        OENeg            : IN    std_ulogic := 'U';
        DIR              : IN    std_ulogic := 'U';
        LE               : IN    std_ulogic := 'U';
        CLKAB            : IN    std_ulogic := 'U';
        CLKBA            : IN    std_ulogic := 'U';
        UBA0             : INOUT std_ulogic := 'U';
        UBA1             : INOUT std_ulogic := 'U';
        UBA2             : INOUT std_ulogic := 'U';
        UBA3             : INOUT std_ulogic := 'U';
        UBA4             : INOUT std_ulogic := 'U';
        UBA5             : INOUT std_ulogic := 'U';
        UBA6             : INOUT std_ulogic := 'U';
        UBA7             : INOUT std_ulogic := 'U';
        UBB0             : INOUT std_ulogic := 'U';
        UBB1             : INOUT std_ulogic := 'U';
        UBB2             : INOUT std_ulogic := 'U';
        UBB3             : INOUT std_ulogic := 'U';
        UBB4             : INOUT std_ulogic := 'U';
        UBB5             : INOUT std_ulogic := 'U';
        UBB6             : INOUT std_ulogic := 'U';
        UBB7             : INOUT std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdvmeh22501 : ENTITY IS TRUE;
END stdvmeh22501;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdvmeh22501 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL A1_ipd              : std_ulogic := 'U';
    SIGNAL B1_ipd              : std_ulogic := 'U';
    SIGNAL OEAB1_ipd           : std_ulogic := 'U';
    SIGNAL OEBY1Neg_ipd        : std_ulogic := 'U';
    SIGNAL A2_ipd              : std_ulogic := 'U';
    SIGNAL B2_ipd              : std_ulogic := 'U';
    SIGNAL OEAB2_ipd           : std_ulogic := 'U';
    SIGNAL OEBY2Neg_ipd        : std_ulogic := 'U';
    SIGNAL OENeg_ipd           : std_ulogic := 'U';
    SIGNAL DIR_ipd             : std_ulogic := 'U';
    SIGNAL LE_ipd              : std_ulogic := 'U';
    SIGNAL CLKAB_ipd           : std_ulogic := 'U';
    SIGNAL CLKBA_ipd           : std_ulogic := 'U';
    SIGNAL UBA0_ipd            : std_ulogic := 'U';
    SIGNAL UBA1_ipd            : std_ulogic := 'U';
    SIGNAL UBA2_ipd            : std_ulogic := 'U';
    SIGNAL UBA3_ipd            : std_ulogic := 'U';
    SIGNAL UBA4_ipd            : std_ulogic := 'U';
    SIGNAL UBA5_ipd            : std_ulogic := 'U';
    SIGNAL UBA6_ipd            : std_ulogic := 'U';
    SIGNAL UBA7_ipd            : std_ulogic := 'U';
    SIGNAL UBB0_ipd            : std_ulogic := 'U';
    SIGNAL UBB1_ipd            : std_ulogic := 'U';
    SIGNAL UBB2_ipd            : std_ulogic := 'U';
    SIGNAL UBB3_ipd            : std_ulogic := 'U';
    SIGNAL UBB4_ipd            : std_ulogic := 'U';
    SIGNAL UBB5_ipd            : std_ulogic := 'U';
    SIGNAL UBB6_ipd            : std_ulogic := 'U';
    SIGNAL UBB7_ipd            : std_ulogic := 'U';

    SIGNAL DA                  : std_ulogic := 'U';
    SIGNAL DB                  : std_ulogic := 'U';

    SIGNAL UBA                 : std_logic_vector(7 downto 0) := (others => 'U');
    SIGNAL UBB                 : std_logic_vector(7 downto 0) := (others => 'U');
    SIGNAL UBA_zd              : std_logic_vector(7 downto 0);
    SIGNAL UBB_zd              : std_logic_vector(7 downto 0);
    SIGNAL UBA_out             : std_logic_vector(7 downto 0) := (others => 'Z');
    SIGNAL UBB_out             : std_logic_vector(7 downto 0) := (others => 'Z');

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays       
    ----------------------------------------------------------------------------
    WireDelay : BLOCK    
    BEGIN
        
        w_1  : VitalWireDelay (A1_ipd, A1, tipd_A1);
        w_2  : VitalWireDelay (B1_ipd, B1, tipd_B1);
        w_3  : VitalWireDelay (OEAB1_ipd, OEAB1, tipd_OEAB1);
        w_4  : VitalWireDelay (OEBY1Neg_ipd, OEBY1Neg, tipd_OEBY1Neg);
        w_5  : VitalWireDelay (A2_ipd, A2, tipd_A2);
        w_6  : VitalWireDelay (B2_ipd, B2, tipd_B2);
        w_7  : VitalWireDelay (OEAB2_ipd, OEAB2, tipd_OEAB2);
        w_8  : VitalWireDelay (OEBY2Neg_ipd, OEBY2Neg, tipd_OEBY2Neg);
        w_9  : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);
        w_10 : VitalWireDelay (DIR_ipd, DIR, tipd_DIR);
        w_11 : VitalWireDelay (LE_ipd, LE, tipd_LE);
        w_12 : VitalWireDelay (CLKAB_ipd, CLKAB, tipd_CLKAB);
        w_13 : VitalWireDelay (CLKBA_ipd, CLKBA, tipd_CLKBA);
        w_14 : VitalWireDelay (UBA0_ipd, UBA0, tipd_UBA0);
        w_15 : VitalWireDelay (UBA1_ipd, UBA1, tipd_UBA1);
        w_16 : VitalWireDelay (UBA2_ipd, UBA2, tipd_UBA2);
        w_17 : VitalWireDelay (UBA3_ipd, UBA3, tipd_UBA3);
        w_18 : VitalWireDelay (UBA4_ipd, UBA4, tipd_UBA4);
        w_19 : VitalWireDelay (UBA5_ipd, UBA5, tipd_UBA5);
        w_20 : VitalWireDelay (UBA6_ipd, UBA6, tipd_UBA6);
        w_21 : VitalWireDelay (UBA7_ipd, UBA7, tipd_UBA7);
        w_22 : VitalWireDelay (UBB0_ipd, UBB0, tipd_UBB0);
        w_23 : VitalWireDelay (UBB1_ipd, UBB1, tipd_UBB1);
        w_24 : VitalWireDelay (UBB2_ipd, UBB2, tipd_UBB2);
        w_25 : VitalWireDelay (UBB3_ipd, UBB3, tipd_UBB3);
        w_26 : VitalWireDelay (UBB4_ipd, UBB4, tipd_UBB4);
        w_27 : VitalWireDelay (UBB5_ipd, UBB5, tipd_UBB5);
        w_28 : VitalWireDelay (UBB6_ipd, UBB6, tipd_UBB6);
        w_29 : VitalWireDelay (UBB7_ipd, UBB7, tipd_UBB7);

    END BLOCK;

    UBA(7) <= UBA7_ipd;
    UBA(6) <= UBA6_ipd;
    UBA(5) <= UBA5_ipd;
    UBA(4) <= UBA4_ipd;
    UBA(3) <= UBA3_ipd;
    UBA(2) <= UBA2_ipd;
    UBA(1) <= UBA1_ipd;
    UBA(0) <= UBA0_ipd;
    UBB(7) <= UBB7_ipd;
    UBB(6) <= UBB6_ipd;
    UBB(5) <= UBB5_ipd;
    UBB(4) <= UBB4_ipd;
    UBB(3) <= UBB3_ipd;
    UBB(2) <= UBB2_ipd;
    UBB(1) <= UBB1_ipd;
    UBB(0) <= UBB0_ipd;

    UBA7 <= UBA_out(7);
    UBA6 <= UBA_out(6);
    UBA5 <= UBA_out(5);
    UBA4 <= UBA_out(4);
    UBA3 <= UBA_out(3);
    UBA2 <= UBA_out(2);
    UBA1 <= UBA_out(1);
    UBA0 <= UBA_out(0);

    UBB7 <= UBB_out(7);
    UBB6 <= UBB_out(6);
    UBB5 <= UBB_out(5);
    UBB4 <= UBB_out(4);
    UBB3 <= UBB_out(3);
    UBB2 <= UBB_out(2);
    UBB1 <= UBB_out(1);
    UBB0 <= UBB_out(0);


    ----------------------------------------------------------------------------
    -- VITALBehavior Process
    ----------------------------------------------------------------------------
    VITALBehavior1 : PROCESS(A1_ipd, B1_ipd, OEAB1_ipd, OEBY1Neg_ipd)

        CONSTANT std22501_1b_tab: VitalTruthTableType := (
        ----------------------------------------------
        ---INPUTS-----------|--OUTPUTS---
        --EA   EY   A    B  | B    Y
        ----------------------------------------------
        ('0', '1', '-', '-', 'Z', 'Z'),
        ('1', '1', '0', '-', '0', 'Z'),
        ('1', '1', '1', '-', '1', 'Z'),
        ('1', '1', '-', '-', 'X', 'Z'),  -- unknown A
        ('0', '0', '-', '0', 'Z', '0'),
        ('0', '0', '-', '1', 'Z', '1'),
        ('0', '0', '-', '-', 'Z', 'X'),  -- unknown B
        ('1', '0', '0', '-', '0', '0'),
        ('1', '0', '1', '-', '1', '1')
        );

        -- Functionality Results Variables
        VARIABLE OData : std_logic_vector(0 to 1);
        ALIAS B1_zd     : std_ulogic IS OData(0);
        ALIAS Y1_zd     : std_ulogic IS OData(1);

        -- Output Glitch Detection Variables
        VARIABLE B1_GlitchData : VitalGlitchDataType;
        VARIABLE Y1_GlitchData : VitalGlitchDataType;

    BEGIN
    
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        OData := VitalTruthTable (
                    TruthTable => std22501_1b_tab,
                    DataIn     => (OEAB1_ipd, OEBY1Neg_ipd, A1_ipd, B1_ipd)
                 );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        
        VitalPathDelay01Z (
            OutSignal       =>  B1,
            OutSignalName   =>  "B1",
            OutTemp         =>  B1_zd,
            Paths           => (
                0 => (InputChangeTime   => A1_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A1_B1),
                      PathCondition     => (OEAB1_ipd = '1' OR OEAB1_ipd = 'H') ),
                1 => (InputChangeTime   => OEAB1_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAB1_B1,
                      PathCondition     => TRUE ) ),
            GlitchData      => B1_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  Y1,
            OutSignalName   =>  "Y1",
            OutTemp         =>  Y1_zd,
            Paths           => (
                0 => (InputChangeTime   => A1_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A1_Y1),
                      PathCondition     => (OEBY1Neg_ipd = '0' OR OEBY1Neg_ipd = 'L') ),
                1 => (InputChangeTime   => B1_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B1_Y1),
                      PathCondition     => (OEBY1Neg_ipd = '0' OR OEBY1Neg_ipd = 'L') ),
                2 => (InputChangeTime   => OEBY1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBY1Neg_Y1,
                      PathCondition     => TRUE ) ),
            GlitchData      => Y1_GlitchData );

    END PROCESS VITALBehavior1;

    VITALBehavior2 : PROCESS(A2_ipd, B2_ipd, OEAB2_ipd, OEBY2Neg_ipd)

        CONSTANT std22501_1b_tab: VitalTruthTableType := (
        ----------------------------------------------
        ---INPUTS-----------|--OUTPUTS---
        --EA   EY   A    B  | B    Y
        ----------------------------------------------
        ('0', '1', '-', '-', 'Z', 'Z'),
        ('1', '1', '0', '-', '0', 'Z'),
        ('1', '1', '1', '-', '1', 'Z'),
        ('1', '1', '-', '-', 'X', 'Z'),  -- unknown A
        ('0', '0', '-', '0', 'Z', '0'),
        ('0', '0', '-', '1', 'Z', '1'),
        ('0', '0', '-', '-', 'Z', 'X'),
        ('1', '0', '0', '-', '0', '0'),  -- unknown B
        ('1', '0', '1', '-', '1', '1')
        );

        -- Functionality Results Variables
        VARIABLE OData : std_logic_vector(0 to 1);
        ALIAS B2_zd     : std_ulogic IS OData(0);
        ALIAS Y2_zd     : std_ulogic IS OData(1);

        -- Output Glitch Detection Variables
        VARIABLE B2_GlitchData : VitalGlitchDataType;
        VARIABLE Y2_GlitchData : VitalGlitchDataType;

    BEGIN
    
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        OData := VitalTruthTable (
                    TruthTable => std22501_1b_tab,
                    DataIn     => (OEAB2_ipd, OEBY2Neg_ipd, A2_ipd, B2_ipd)
                 );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        
        VitalPathDelay01Z (
            OutSignal       =>  B2,
            OutSignalName   =>  "B2",
            OutTemp         =>  B2_zd,
            Paths           => (
                0 => (InputChangeTime   => A2_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A1_B1),
                      PathCondition     => (OEAB2_ipd = '1' OR OEAB2_ipd = 'H') ),
                1 => (InputChangeTime   => OEAB2_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAB1_B1,
                      PathCondition     => TRUE ) ),
            GlitchData      => B2_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  Y2,
            OutSignalName   =>  "Y2",
            OutTemp         =>  Y2_zd,
            Paths           => (
                0 => (InputChangeTime   => A2_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A1_Y1),
                      PathCondition     => (OEBY2Neg_ipd = '0' OR OEBY2Neg_ipd = 'L') ),
                1 => (InputChangeTime   => B2_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B1_Y1),
                      PathCondition     => (OEBY2Neg_ipd = '0' OR OEBY2Neg_ipd = 'L') ),
                2 => (InputChangeTime   => OEBY2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBY1Neg_Y1,
                      PathCondition     => TRUE ) ),
            GlitchData      => Y2_GlitchData );

    END PROCESS VITALBehavior2;

    VITALBehavior3 : PROCESS(DIR_ipd, OENeg_ipd)

        CONSTANT dir_tab : VitalTruthTableType := (
        ----------------------------------------------
        ---INPUTS-|--OUTPUTS---
        --E    D  | A    B
        ----------------------------------------------
        ('1', '-', '0', '0'),
        ('0', '1', '0', '1'),
        ('0', '0', '1', '0')
        );

        -- Functionality Results Variables
        VARIABLE OData : std_logic_vector(0 to 1);

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        OData := VitalTruthTable (
                    TruthTable => dir_tab,
                    DataIn     => (OENeg_ipd, DIR_ipd)
                 );

        DA <= OData(0);
        DB <= OData(1);

    END PROCESS VITALBehavior3;

    VITALBehavior4 : PROCESS(CLKAB_ipd, LE_ipd, CLKBA_ipd, UBA, UBB, DA, DB)

        -- Timing Check Variables
        VARIABLE Tviol_UBA_CLKAB   : X01 := '0'; 
        VARIABLE TD_UBA_CLKAB      : VitalTimingDataType;
        
        VARIABLE Tviol_UBA_LE      : X01 := '0'; 
        VARIABLE TD_UBA_LE         : VitalTimingDataType;
        
        VARIABLE Tviol_UBB_CLKBA   : X01 := '0'; 
        VARIABLE TD_UBB_CLKBA      : VitalTimingDataType;
        
        VARIABLE Tviol_UBB_LE      : X01 := '0'; 
        VARIABLE TD_UBB_LE         : VitalTimingDataType;
        
        VARIABLE Pviol_CLKAB        : X01 := '0';
        VARIABLE PD_CLKAB           : VitalPeriodDataType := VitalPeriodDataInit;
        
        VARIABLE Pviol_CLKBA        : X01 := '0';
        VARIABLE PD_CLKBA           : VitalPeriodDataType := VitalPeriodDataInit;
        
        VARIABLE Violation          : X01 := '0';
        
        -- Functionality Results Variables
        VARIABLE UBA_int            : std_logic_vector(7 downto 0);
        VARIABLE UBB_int            : std_logic_vector(7 downto 0);
        VARIABLE PrevDataA7         : std_logic_vector(0 to 3);
        VARIABLE PrevDataA6         : std_logic_vector(0 to 3);
        VARIABLE PrevDataA5         : std_logic_vector(0 to 3);
        VARIABLE PrevDataA4         : std_logic_vector(0 to 3);
        VARIABLE PrevDataA3         : std_logic_vector(0 to 3);
        VARIABLE PrevDataA2         : std_logic_vector(0 to 3);
        VARIABLE PrevDataA1         : std_logic_vector(0 to 3);
        VARIABLE PrevDataA0         : std_logic_vector(0 to 3);
        VARIABLE PrevDataB7         : std_logic_vector(0 to 3);
        VARIABLE PrevDataB6         : std_logic_vector(0 to 3);
        VARIABLE PrevDataB5         : std_logic_vector(0 to 3);
        VARIABLE PrevDataB4         : std_logic_vector(0 to 3);
        VARIABLE PrevDataB3         : std_logic_vector(0 to 3);
        VARIABLE PrevDataB2         : std_logic_vector(0 to 3);
        VARIABLE PrevDataB1         : std_logic_vector(0 to 3);
        VARIABLE PrevDataB0         : std_logic_vector(0 to 3);

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => UBA,
                TestSignalName  => "UBA",
                RefSignal       => CLKAB_ipd,
                RefSignalName   => "CLKAB_ipd",
                SetupHigh       => tsetup_UBA1_CLKAB,
                SetupLow        => tsetup_UBA1_CLKAB,
                HoldHigh        => thold_UBA1_CLKAB,
                HoldLow         => thold_UBA1_CLKAB,
                CheckEnabled    => (LE_ipd = '0' OR LE_ipd = 'L'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdvmeh22501",
                TimingData      => TD_UBA_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_UBA_CLKAB
            );

            VitalSetupHoldCheck (
                TestSignal      => UBB,
                TestSignalName  => "UBB",
                RefSignal       => CLKBA_ipd,
                RefSignalName   => "CLKBA_ipd",
                SetupHigh       => tsetup_UBB1_CLKBA,
                SetupLow        => tsetup_UBB1_CLKBA,
                HoldHigh        => thold_UBB1_CLKBA,
                HoldLow         => thold_UBB1_CLKBA,
                CheckEnabled    => (LE_ipd = '0' OR LE_ipd = 'L'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdvmeh22501",
                TimingData      => TD_UBB_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_UBB_CLKBA
            );

            VitalSetupHoldCheck (
                TestSignal      => UBA,
                TestSignalName  => "UBA",
                RefSignal       => LE_ipd,
                RefSignalName   => "LE_ipd",
                SetupHigh       => tsetup_UBA1_LE,
                SetupLow        => tsetup_UBA1_LE,
                HoldHigh        => thold_UBA1_LE,
                HoldLow         => thold_UBA1_LE,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/stdvmeh22501",
                TimingData      => TD_UBA_LE,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_UBA_LE
            );

            VitalSetupHoldCheck (
                TestSignal      => UBB,
                TestSignalName  => "UBB",
                RefSignal       => LE_ipd,
                RefSignalName   => "LE_ipd",
                SetupHigh       => tsetup_UBB1_LE,
                SetupLow        => tsetup_UBB1_LE,
                HoldHigh        => thold_UBB1_LE,
                HoldLow         => thold_UBB1_LE,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/stdvmeh22501",
                TimingData      => TD_UBB_LE,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_UBB_LE
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKAB_ipd,
                TestSignalName  => "CLKAB_ipd",
                Period          => tperiod_CLKAB_posedge,
                PulseWidthHigh  => tpw_CLKAB_posedge,
                PulseWidthlow   => tpw_CLKAB_negedge,
                CheckEnabled    => (LE_ipd = '0' OR LE_ipd = 'L'),
                HeaderMsg       => InstancePath & "/stdvmeh22501",
                PeriodData      => PD_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKAB
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKBA_ipd,
                TestSignalName  => "CLKBA_ipd",
                Period          => tperiod_CLKAB_posedge,
                PulseWidthHigh  => tpw_CLKAB_posedge,
                PulseWidthlow   => tpw_CLKAB_negedge,
                CheckEnabled    => (LE_ipd = '0' OR LE_ipd = 'L'),
                HeaderMsg       => InstancePath & "/stdvmeh22501",
                PeriodData      => PD_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKBA
            );

            Violation := Tviol_UBA_CLKAB OR Tviol_UBA_LE OR Tviol_UBB_CLKBA
                         OR Tviol_UBB_LE OR Pviol_CLKAB OR Pviol_CLKBA;

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKBA_ipd, UBB(7)),
            Result          => UBA_int(7),
            PreviousDataIn  => PrevDataA7
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKBA_ipd, UBB(6)),
            Result          => UBA_int(6),
            PreviousDataIn  => PrevDataA6
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKBA_ipd, UBB(5)),
            Result          => UBA_int(5),
            PreviousDataIn  => PrevDataA5
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKBA_ipd, UBB(4)),
            Result          => UBA_int(4),
            PreviousDataIn  => PrevDataA4
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKBA_ipd, UBB(3)),
            Result          => UBA_int(3),
            PreviousDataIn  => PrevDataA3
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKBA_ipd, UBB(2)),
            Result          => UBA_int(2),
            PreviousDataIn  => PrevDataA2
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKBA_ipd, UBB(1)),
            Result          => UBA_int(1),
            PreviousDataIn  => PrevDataA1
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKBA_ipd, UBB(0)),
            Result          => UBA_int(0),
            PreviousDataIn  => PrevDataA0
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKAB_ipd, UBA(7)),
            Result          => UBB_int(7),
            PreviousDataIn  => PrevDataB7
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKAB_ipd, UBA(6)),
            Result          => UBB_int(6),
            PreviousDataIn  => PrevDataB6
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKAB_ipd, UBA(5)),
            Result          => UBB_int(5),
            PreviousDataIn  => PrevDataB5
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKAB_ipd, UBA(4)),
            Result          => UBB_int(4),
            PreviousDataIn  => PrevDataB4
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKAB_ipd, UBA(3)),
            Result          => UBB_int(3),
            PreviousDataIn  => PrevDataB3
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKAB_ipd, UBA(2)),
            Result          => UBB_int(2),
            PreviousDataIn  => PrevDataB2
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKAB_ipd, UBA(1)),
            Result          => UBB_int(1),
            PreviousDataIn  => PrevDataB1
        );                                                        

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LE_ipd, CLKAB_ipd, UBA(0)),
            Result          => UBB_int(0),
            PreviousDataIn  => PrevDataB0
        );                                                        

        IF (DA = '1') THEN
            UBA_zd <= UBA_int;
        ELSIF (DA = '0') THEN
            UBA_zd <= (others => 'Z');
        ELSE
            UBA_zd <= (others => 'X');
        END IF;

        IF (DB = '1') THEN
            UBB_zd <= UBB_int;
        ELSIF (DB = '0') THEN
            UBB_zd <= (others => 'Z');
        ELSE
            UBB_zd <= (others => 'X');
        END IF;

    END PROCESS VITALBehavior4;

    ------------------------------------------------------------------------
    -- Path Delay Process
    ------------------------------------------------------------------------
    DataOutBlk : FOR i IN 7 DOWNTO 0 GENERATE
        UBAOut_Delay : PROCESS (UBA_zd(i), UBB_zd(i))
            VARIABLE UBA_GlitchData:VitalGlitchDataArrayType(7 Downto 0);
            VARIABLE UBB_GlitchData:VitalGlitchDataArrayType(7 Downto 0);
        BEGIN
                VitalPathDelay01Z (
                    OutSignal       => UBA_out(i),
                    OutSignalName   => "UBA",
                    OutTemp         => UBA_zd(i),
                    Mode            => VitalTransport,
                    GlitchData      => UBA_GlitchData(i),
                    Paths           => (
                        1 => (InputChangeTime => UBB(i)'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_UBB1_UBA1),
                              PathCondition   => (DA = '1' AND (LE_ipd = '1'
                                                  OR LE_ipd = 'L'))),
                        2 => (InputChangeTime => CLKBA_ipd'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_CLKBA_UBA1),
                              PathCondition   => DA = '1'),
                        3 => (InputChangeTime => LE_ipd'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_LE_UBA1),
                              PathCondition   => DA = '1'),
                        4 => (InputChangeTime => DA'LAST_EVENT,
                              PathDelay => tpd_OENeg_UBA1,
                              PathCondition   => true)
                   )
                );

                VitalPathDelay01Z (
                    OutSignal       => UBB_out(i),
                    OutSignalName   => "UBB",
                    OutTemp         => UBB_zd(i),
                    Mode            => VitalTransport,
                    GlitchData      => UBB_GlitchData(i),
                    Paths           => (
                        1 => (InputChangeTime => UBB(i)'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_UBA1_UBB1),
                              PathCondition   => (DB = '1' AND (LE_ipd = '1'
                                                  OR LE_ipd = 'L'))),
                        2 => (InputChangeTime => CLKAB_ipd'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_CLKAB_UBB1),
                              PathCondition   => DB = '1'),
                        3 => (InputChangeTime => LE_ipd'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_LE_UBB1),
                              PathCondition   => DB = '1'),
                        4 => (InputChangeTime => DB'LAST_EVENT,
                              PathDelay => tpd_OENeg_UBB1,
                              PathCondition   => true)
                   )
                );

            END PROCESS;

        END GENERATE;

END vhdl_behavioral;
