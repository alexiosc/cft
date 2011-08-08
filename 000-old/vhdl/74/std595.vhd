--------------------------------------------------------------------------------
--  File Name: std595.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2001 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: |  author:  | mod date: | changes made:
--    V1.0      B.Bizic    01 JUN 10   Initial release
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    STND
--  Technology: 54/7400
--  Part:       STD595
--
--  Description: 8-Bit Shift Register With Output Latches
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std595 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_GNeg                : VitalDelayType01 := VitalZeroDelay01;
        tipd_RCK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_SER                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_SCK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_SCLRNeg             : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_RCK_QA               : VitalDelayType01 := UnitDelay01;
        tpd_SCK_QHSER            : VitalDelayType01 := UnitDelay01;
        tpd_SCLRNeg_QHSER        : VitalDelayType01 := UnitDelay01;
        tpd_GNeg_QA              : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_SER_SCK           : VitalDelayType := UnitDelay;
        tsetup_SCK_RCK           : VitalDelayType := UnitDelay;
        tsetup_SCLRNeg_RCK       : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_SER_SCK            : VitalDelayType := UnitDelay;
        thold_SCK_RCK            : VitalDelayType := UnitDelay;
        thold_SCLRNeg_RCK        : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_SCLRNeg_negedge      : VitalDelayType := UnitDelay;
        tpw_SCK_posedge          : VitalDelayType := UnitDelay;
        tpw_RCK_posedge         : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_SCK_posedge      : VitalDelayType := UnitDelay;
        tperiod_RCK_posedge         : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (

        GNeg            : IN    std_ulogic := 'U';
        RCK             : IN    std_ulogic := 'U';
        SER             : IN    std_ulogic := 'U';
        SCK             : IN    std_ulogic := 'U';
        SCLRNeg         : IN    std_ulogic := 'U';
        QA              : OUT   std_ulogic := 'U';
        QB              : OUT   std_ulogic := 'U';
        QC              : OUT   std_ulogic := 'U';
        QD              : OUT   std_ulogic := 'U';
        QE              : OUT   std_ulogic := 'U';
        QF              : OUT   std_ulogic := 'U';
        QG              : OUT   std_ulogic := 'U';
        QH              : OUT   std_ulogic := 'U';
        QHSER           : OUT   std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std595 : ENTITY IS TRUE;
END std595;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std595 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID            : STRING := "std595";

    SIGNAL GNeg_ipd            : std_ulogic := 'U';
    SIGNAL RCK_ipd             : std_ulogic := 'U';
    SIGNAL SER_ipd             : std_ulogic := 'U';
    SIGNAL SCK_ipd             : std_ulogic := 'U';
    SIGNAL SCLRNeg_ipd         : std_ulogic := 'U';

    SIGNAL QA0_int             : std_ulogic := 'U';
    SIGNAL QB0_int             : std_ulogic := 'U';
    SIGNAL QC0_int             : std_ulogic := 'U';
    SIGNAL QD0_int             : std_ulogic := 'U';
    SIGNAL QE0_int             : std_ulogic := 'U';
    SIGNAL QF0_int             : std_ulogic := 'U';
    SIGNAL QG0_int             : std_ulogic := 'U';
    SIGNAL QH0_int             : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (GNeg_ipd, GNeg, tipd_GNeg);
        w_2 : VitalWireDelay (RCK_ipd, RCK, tipd_RCK);
        w_3 : VitalWireDelay (SER_ipd, SER, tipd_SER);
        w_4 : VitalWireDelay (SCK_ipd, SCK, tipd_SCK);
        w_5 : VitalWireDelay (SCLRNeg_ipd, SCLRNeg, tipd_SCLRNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (SER_ipd,SCK_ipd,RCK_ipd,SCLRNeg_ipd,GNeg_ipd)

        -- Timing Check Variables    
        VARIABLE Tviol_SER_SCK      : X01 := '0';
        VARIABLE TD_SER_SCK         : VitalTimingDataType;

        VARIABLE Tviol_SCK_RCK      : X01 := '0';
        VARIABLE TD_SCK_RCK         : VitalTimingDataType;

        VARIABLE Tviol_SCLRNeg_RCK  : X01 := '0';
        VARIABLE TD_SCLRNeg_RCK     : VitalTimingDataType;

        VARIABLE PD_SCLRNeg         : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_SCLRNeg      : X01 := '0';

        VARIABLE PD_SCK             : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_SCK          : X01 := '0';

        VARIABLE PD_RCK             : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_RCK          : X01 := '0';

        VARIABLE Violation          : X01 := '0';

         -- Functionality Results Variables
        VARIABLE Q7_zd   : std_ulogic := 'U';
        VARIABLE Q6_zd   : std_ulogic := 'U';
        VARIABLE Q5_zd   : std_ulogic := 'U';
        VARIABLE Q4_zd   : std_ulogic := 'U';
        VARIABLE Q3_zd   : std_ulogic := 'U';
        VARIABLE Q2_zd   : std_ulogic := 'U';
        VARIABLE Q1_zd   : std_ulogic := 'U';
        VARIABLE Q0_zd   : std_ulogic := 'U';

        -- Temporary variables for tri state out
        VARIABLE QA_int   : std_ulogic := 'U';
        VARIABLE QB_int   : std_ulogic := 'U';
        VARIABLE QC_int   : std_ulogic := 'U';
        VARIABLE QD_int   : std_ulogic := 'U';
        VARIABLE QE_int   : std_ulogic := 'U';
        VARIABLE QF_int   : std_ulogic := 'U';
        VARIABLE QG_int   : std_ulogic := 'U';
        VARIABLE QH_int   : std_ulogic := 'U';

        VARIABLE QA0_int   : std_ulogic := 'U';
        VARIABLE QB0_int   : std_ulogic := 'U';
        VARIABLE QC0_int   : std_ulogic := 'U';
        VARIABLE QD0_int   : std_ulogic := 'U';
        VARIABLE QE0_int   : std_ulogic := 'U';
        VARIABLE QF0_int   : std_ulogic := 'U';
        VARIABLE QG0_int   : std_ulogic := 'U';
        VARIABLE QH0_int   : std_ulogic := 'U';

        -- Output Glitch Detection Variables
        VARIABLE Q0_GlitchData  : VitalGlitchDataType;
        VARIABLE Q1_GlitchData  : VitalGlitchDataType;
        VARIABLE Q2_GlitchData  : VitalGlitchDataType;
        VARIABLE Q3_GlitchData  : VitalGlitchDataType;
        VARIABLE Q4_GlitchData  : VitalGlitchDataType;
        VARIABLE Q5_GlitchData  : VitalGlitchDataType;
        VARIABLE Q6_GlitchData  : VitalGlitchDataType;
        VARIABLE Q7_GlitchData  : VitalGlitchDataType;
        VARIABLE QHSER_GlitchData  : VitalGlitchDataType;

        -- Prevdata for DFF/DFFRN tab
        VARIABLE PrevData00      : std_logic_vector(0 to 3);
        VARIABLE PrevData01      : std_logic_vector(0 to 3);
        VARIABLE PrevData02      : std_logic_vector(0 to 3);
        VARIABLE PrevData03      : std_logic_vector(0 to 3);
        VARIABLE PrevData04      : std_logic_vector(0 to 3);
        VARIABLE PrevData05      : std_logic_vector(0 to 3);
        VARIABLE PrevData06      : std_logic_vector(0 to 3);
        VARIABLE PrevData07      : std_logic_vector(0 to 3);

        VARIABLE PrevData10      : std_logic_vector(0 to 2);
        VARIABLE PrevData11      : std_logic_vector(0 to 2);
        VARIABLE PrevData12      : std_logic_vector(0 to 2);
        VARIABLE PrevData13      : std_logic_vector(0 to 2);
        VARIABLE PrevData14      : std_logic_vector(0 to 2);
        VARIABLE PrevData15      : std_logic_vector(0 to 2);
        VARIABLE PrevData16      : std_logic_vector(0 to 2);
        VARIABLE PrevData17      : std_logic_vector(0 to 2);

    BEGIN

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN
            
            VitalPeriodPulseCheck (
                TestSignal      => SCK_ipd,
                TestSignalName  => "SCK_ipd",
                Period          => tperiod_SCK_posedge,
                PulseWidthHigh  => tpw_SCK_posedge,
                PulseWidthLow   => tpw_SCK_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_SCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_SCK
            );

            VitalPeriodPulseCheck (
                TestSignal      => RCK_ipd,
                TestSignalName  => "RCK_ipd",
                Period          => tperiod_RCK_posedge,
                PulseWidthHigh  => tpw_RCK_posedge,
                PulseWidthLow   => tpw_RCK_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_RCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_RCK
            );

            VitalPeriodPulseCheck (
                TestSignal      => SCLRNeg_ipd,
                TestSignalName  => "SCLRNeg_ipd",
                PulseWidthLow   => tpw_SCLRNeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_SCLRNeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_SCLRNeg
            );

            VitalSetupHoldCheck (
                TestSignal      => SER_ipd,
                TestSignalName  => "SER",
                RefSignal       => SCK_ipd,
                RefSignalName   => "SCK",
                SetupHigh       => tsetup_SER_SCK,
                SetupLow        => tsetup_SER_SCK,
                HoldHigh        => thold_SER_SCK,
                HoldLow         => thold_SER_SCK,
                CheckEnabled    => (SCLRNeg_ipd = '1' OR SCLRNeg_ipd = 'H'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_SER_SCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_SER_SCK
            );

             VitalSetupHoldCheck (
                TestSignal      => SCK_ipd,
                TestSignalName  => "SCK",
                RefSignal       => RCK_ipd,
                RefSignalName   => "RCK",
                SetupHigh       => tsetup_SCK_RCK,
                SetupLow        => tsetup_SCK_RCK,
                HoldHigh        => thold_SCK_RCK,
                HoldLow         => thold_SCK_RCK,
                CheckEnabled    => (SCLRNeg_ipd = '1' OR SCLRNeg_ipd = 'H'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_SCK_RCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_SCK_RCK
            );

             VitalSetupHoldCheck (
                TestSignal      => SCLRNeg_ipd,
                TestSignalName  => "SCLRNeg",
                RefSignal       => RCK_ipd,
                RefSignalName   => "RCK",
                SetupHigh       => tsetup_SCLRNeg_RCK,
                SetupLow        => tsetup_SCLRNeg_RCK,
                HoldHigh        => thold_SCLRNeg_RCK,
                HoldLow         => thold_SCLRNeg_RCK,
                CheckEnabled    => (SCLRNeg_ipd = '1' OR SCLRNeg_ipd = 'H'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_SCLRNeg_RCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_SCLRNeg_RCK
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------

        Violation := Tviol_SER_SCK OR Tviol_SCK_RCK OR Tviol_SCLRNeg_RCK OR
                     Pviol_SCLRNeg OR Pviol_SCK OR Pviol_RCK;

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, SCK_ipd, Q6_zd, SCLRNeg_ipd),
            Result          => Q7_zd,
            PreviousDataIn  => PrevData07
        );
        
        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, SCK_ipd, Q5_zd, SCLRNeg_ipd),
            Result          => Q6_zd,
            PreviousDataIn  => PrevData06
        );
        
        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, SCK_ipd, Q4_zd, SCLRNeg_ipd),
            Result          => Q5_zd,
            PreviousDataIn  => PrevData05
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, SCK_ipd, Q3_zd, SCLRNeg_ipd),
            Result          => Q4_zd,
            PreviousDataIn  => PrevData04
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, SCK_ipd, Q2_zd, SCLRNeg_ipd),
            Result          => Q3_zd,
            PreviousDataIn  => PrevData03
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, SCK_ipd, Q1_zd, SCLRNeg_ipd),
            Result          => Q2_zd,
            PreviousDataIn  => PrevData02
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, SCK_ipd, Q0_zd, SCLRNeg_ipd),
            Result          => Q1_zd,
            PreviousDataIn  => PrevData01
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, SCK_ipd, SER_ipd, SCLRNeg_ipd),
            Result          => Q0_zd,
            PreviousDataIn  => PrevData00
        );

        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, RCK_ipd, Q0_zd),
            Result          => QA_int,
            PreviousDataIn  => PrevData10
        );

        QA0_int := VitalBUFIF0 (data => QA_int,
                                enable => GNeg_ipd);
        
        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, RCK_ipd, Q1_zd),
            Result          => QB_int,
            PreviousDataIn  => PrevData11
        );

        QB0_int := VitalBUFIF0 (data => QB_int, 
                                enable => GNeg_ipd);

        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, RCK_ipd, Q2_zd),
            Result          => QC_int,
            PreviousDataIn  => PrevData12
        );

        QC0_int := VitalBUFIF0 (data => QC_int,
                                enable => GNeg_ipd);

        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, RCK_ipd, Q3_zd),
            Result          => QD_int,
            PreviousDataIn  => PrevData13
        );

        QD0_int := VitalBUFIF0 (data => QD_int,
                                enable => GNeg_ipd);
         
        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, RCK_ipd, Q4_zd),
            Result          => QE_int,
            PreviousDataIn  => PrevData14
        );

        QE0_int := VitalBUFIF0 (data => QE_int,
                                enable => GNeg_ipd);

         VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, RCK_ipd, Q5_zd),
            Result          => QF_int,
            PreviousDataIn  => PrevData15
        );

        QF0_int := VitalBUFIF0 (data => QF_int,
                                enable => GNeg_ipd);
                               
        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, RCK_ipd, Q6_zd),
            Result          => QG_int,
            PreviousDataIn  => PrevData16
        );

        QG0_int := VitalBUFIF0 (data => QG_int,
                                enable => GNeg_ipd);
                                
        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, RCK_ipd, Q7_zd),
            Result          => QH_int,
            PreviousDataIn  => PrevData17
        );

        QH0_int := VitalBUFIF0 (data => QH_int,
                                enable => GNeg_ipd); 
                              
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------

        VitalPathDelay01 (
            OutSignal       => QHSER,
            OutSignalName   => "QHSER",
            OutTemp         => Q7_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => SCLRNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_SCLRNeg_QHSER,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => SCK_ipd'LAST_EVENT,
                      PathDelay         => tpd_SCK_QHSER,
                      PathCondition     => (SCLRNeg_ipd = '1' OR
                                            SCLRNeg_ipd = 'H') ) 
                               ),
            GlitchData      => QHSER_GlitchData );

       VitalPathDelay01Z (
            OutSignal       => QA,
            OutSignalName   => "QA",
            OutTemp         => QA0_int,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_QA,
                      PathCondition     => TRUE),
                1=>  (InputChangeTime   => RCK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_RCK_QA),
                      PathCondition     => (GNeg_ipd='0'OR GNeg_ipd='L' ))
                                 ),
           GlitchData      =>Q0_GlitchData );

       VitalPathDelay01Z (
            OutSignal       => QB,
            OutSignalName   => "QB",
            OutTemp         => QB0_int,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_QA,
                      PathCondition     => TRUE),
                1=>  (InputChangeTime   => RCK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_RCK_QA),
                      PathCondition     => (GNeg_ipd='0' OR GNeg_ipd='L'))
                                ),
           GlitchData      => Q1_GlitchData );

       VitalPathDelay01Z (
            OutSignal       => QC,
            OutSignalName   => "QC",
            OutTemp         => QC0_int,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_QA,
                      PathCondition     => TRUE),
                1=>  (InputChangeTime   => RCK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_RCK_QA),
                      PathCondition     => (GNeg_ipd='0' OR GNeg_ipd='L'))
                                ),
           GlitchData      => Q2_GlitchData );

       VitalPathDelay01Z (
            OutSignal       => QD,
            OutSignalName   => "QD",
            OutTemp         => QD0_int,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_QA,
                      PathCondition     => TRUE),
                1=>  (InputChangeTime   => RCK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_RCK_QA),
                      PathCondition     => (GNeg_ipd='0' OR GNeg_ipd='L'))
                                ),
           GlitchData      => Q3_GlitchData );

       VitalPathDelay01Z (
            OutSignal       => QE,
            OutSignalName   => "QE",
            OutTemp         => QE0_int,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_QA,
                      PathCondition     => TRUE),
               1=>   (InputChangeTime   => RCK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_RCK_QA),
                      PathCondition     => (GNeg_ipd='0' OR GNeg_ipd='L'))
                                ),
            GlitchData      => Q4_GlitchData );

       VitalPathDelay01Z (
            OutSignal       => QF,
            OutSignalName   => "QF",
            OutTemp         => QF0_int,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_QA,
                      PathCondition     => TRUE),              
                1=>  (InputChangeTime   => RCK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_RCK_QA),
                      PathCondition     => (GNeg_ipd='0' OR GNeg_ipd='L'))
                                ),
            GlitchData      => Q5_GlitchData );

       VitalPathDelay01Z (
            OutSignal       => QG,
            OutSignalName   => "QG",
            OutTemp         => QG0_int,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_QA,
                      PathCondition     => TRUE),
                1=>  (InputChangeTime   => RCK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_RCK_QA),
                      PathCondition     => (GNeg_ipd='0' OR GNeg_ipd='L'))
                                ),
            GlitchData      => Q6_GlitchData );

       VitalPathDelay01Z (
            OutSignal       => QH,
            OutSignalName   => "QH",
            OutTemp         => QH0_int,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => GNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_GNeg_QA,
                      PathCondition     => TRUE),
                1=>  (InputChangeTime   => RCK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_RCK_QA),
                      PathCondition     => (GNeg_ipd='0' OR GNeg_ipd='L'))
                                ),
            GlitchData      => Q7_GlitchData );

    END PROCESS;
END vhdl_behavioral;
