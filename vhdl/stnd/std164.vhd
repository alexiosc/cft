--------------------------------------------------------------------------------
--  File Name: std164.vhd
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
--    V1.0    R. Munden    01 Jan 01   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/7400
--  Part:       STD164
-- 
--  Description: 8-Bit Parallel-Out Serial Shift Register
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std164 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_DB                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_DA                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLOCK               : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLNeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLOCK_Q0             : VitalDelayType01 := UnitDelay01;
        tpd_CLNeg_Q0             : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_DA_CLOCK          : VitalDelayType := UnitDelay;
        tsetup_CLNeg_CLOCK       : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_DA_CLOCK           : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLOCK_posedge        : VitalDelayType := UnitDelay;
        tpw_CLNeg_negedge        : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLOCK_posedge    : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Q7              : OUT   std_ulogic := 'U';
        Q6              : OUT   std_ulogic := 'U';
        Q5              : OUT   std_ulogic := 'U';
        Q4              : OUT   std_ulogic := 'U';
        Q3              : OUT   std_ulogic := 'U';
        Q2              : OUT   std_ulogic := 'U';
        Q1              : OUT   std_ulogic := 'U';
        Q0              : OUT   std_ulogic := 'U';
        DB              : IN    std_ulogic := 'U';
        DA              : IN    std_ulogic := 'U';
        CLOCK           : IN    std_ulogic := 'U';
        CLNeg           : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std164 : ENTITY IS TRUE;
END std164;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std164 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID            : STRING := "std164";

    SIGNAL DB_ipd              : std_ulogic := 'U';
    SIGNAL DA_ipd              : std_ulogic := 'U';
    SIGNAL CLOCK_ipd           : std_ulogic := 'U';
    SIGNAL CLNeg_ipd           : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_9 : VitalWireDelay (DB_ipd, DB, tipd_DB);
        w_10 : VitalWireDelay (DA_ipd, DA, tipd_DA);
        w_11 : VitalWireDelay (CLOCK_ipd, CLOCK, tipd_CLOCK);
        w_12 : VitalWireDelay (CLNeg_ipd, CLNeg, tipd_CLNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLOCK_ipd, CLNeg_ipd, DA_ipd, DB_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_DA_CLOCK  : X01 := '0';
        VARIABLE TD_DA_CLOCK     : VitalTimingDataType;

        VARIABLE Tviol_DB_CLOCK  : X01 := '0';
        VARIABLE TD_DB_CLOCK     : VitalTimingDataType;

        VARIABLE Tviol_CLNeg_CLOCK  : X01 := '0';
        VARIABLE TD_CLNeg_CLOCK     : VitalTimingDataType;

        VARIABLE PD_CLOCK        : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLOCK     : X01 := '0';

        VARIABLE PD_CLNeg       : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLNeg    : X01 := '0';

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q7_zd   : std_ulogic := 'U';
        VARIABLE Q6_zd   : std_ulogic := 'U';
        VARIABLE Q5_zd   : std_ulogic := 'U';
        VARIABLE Q4_zd   : std_ulogic := 'U';
        VARIABLE Q3_zd   : std_ulogic := 'U';
        VARIABLE Q2_zd   : std_ulogic := 'U';
        VARIABLE Q1_zd   : std_ulogic := 'U';
        VARIABLE Q0_zd   : std_ulogic := 'U';
        VARIABLE Dint    : std_ulogic := 'U';

        -- Output Glitch Detection Variables
        VARIABLE Q0_GlitchData  : VitalGlitchDataType;
        VARIABLE Q1_GlitchData  : VitalGlitchDataType;
        VARIABLE Q2_GlitchData  : VitalGlitchDataType;
        VARIABLE Q3_GlitchData  : VitalGlitchDataType;
        VARIABLE Q4_GlitchData  : VitalGlitchDataType;
        VARIABLE Q5_GlitchData  : VitalGlitchDataType;
        VARIABLE Q6_GlitchData  : VitalGlitchDataType;
        VARIABLE Q7_GlitchData  : VitalGlitchDataType;
        VARIABLE PrevData0      : std_logic_vector(0 to 3);
        VARIABLE PrevData1      : std_logic_vector(0 to 3);
        VARIABLE PrevData2      : std_logic_vector(0 to 3);
        VARIABLE PrevData3      : std_logic_vector(0 to 3);
        VARIABLE PrevData4      : std_logic_vector(0 to 3);
        VARIABLE PrevData5      : std_logic_vector(0 to 3);
        VARIABLE PrevData6      : std_logic_vector(0 to 3);
        VARIABLE PrevData7      : std_logic_vector(0 to 3);

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => DA_ipd,
                TestSignalName  => "DA",
                RefSignal       => CLOCK_ipd,
                RefSignalName   => "CLOCK",
                SetupHigh       => tsetup_DA_CLOCK,
                SetupLow        => tsetup_DA_CLOCK,
                HoldHigh        => thold_DA_CLOCK,
                HoldLow         => thold_DA_CLOCK,
                CheckEnabled    => (CLNeg_ipd = '1' OR CLNeg_ipd = 'H'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DA_CLOCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DA_CLOCK
            );

            VitalSetupHoldCheck (
                TestSignal      => DB_ipd,
                TestSignalName  => "DB",
                RefSignal       => CLOCK_ipd,
                RefSignalName   => "CLOCK",
                SetupHigh       => tsetup_DA_CLOCK,
                SetupLow        => tsetup_DA_CLOCK,
                HoldHigh        => thold_DA_CLOCK,
                HoldLow         => thold_DA_CLOCK,
                CheckEnabled    => (CLNeg_ipd = '1' OR CLNeg_ipd = 'H'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DB_CLOCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DB_CLOCK
            );

            VitalSetupHoldCheck (
                TestSignal      => CLNeg_ipd,
                TestSignalName  => "CLNeg_ipd",
                RefSignal       => CLOCK_ipd,
                RefSignalName   => "CLOCK",
                SetupHigh       => tsetup_CLNeg_CLOCK,
                SetupLow        => tsetup_CLNeg_CLOCK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_CLNeg_CLOCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLNeg_CLOCK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLOCK_ipd,
                TestSignalName  => "CLOCK_ipd",
                Period          => tperiod_CLOCK_posedge,
                PulseWidthHigh  => tpw_CLOCK_posedge,
                PulseWidthLow   => tpw_CLOCK_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_CLOCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLOCK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLNeg_ipd,
                TestSignalName  => "CLNeg_ipd",
                PulseWidthLow   => tpw_CLNeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_CLNeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLNeg
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Pviol_CLNeg OR Pviol_CLOCK OR Tviol_DA_CLOCK OR 
                     Tviol_CLNeg_CLOCK OR Tviol_DB_CLOCK;

        Dint := VitalAND2 (a => DA_ipd, b => DB_ipd);

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLOCK_ipd, Q6_zd, CLNeg_ipd),
            Result          => Q7_zd,
            PreviousDataIn  => PrevData7
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLOCK_ipd, Q5_zd, CLNeg_ipd),
            Result          => Q6_zd,
            PreviousDataIn  => PrevData6
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLOCK_ipd, Q4_zd, CLNeg_ipd),
            Result          => Q5_zd,
            PreviousDataIn  => PrevData5
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLOCK_ipd, Q3_zd, CLNeg_ipd),
            Result          => Q4_zd,
            PreviousDataIn  => PrevData4
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLOCK_ipd, Q2_zd, CLNeg_ipd),
            Result          => Q3_zd,
            PreviousDataIn  => PrevData3
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLOCK_ipd, Q1_zd, CLNeg_ipd),
            Result          => Q2_zd,
            PreviousDataIn  => PrevData2
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLOCK_ipd, Q0_zd, CLNeg_ipd),
            Result          => Q1_zd,
            PreviousDataIn  => PrevData1
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLOCK_ipd, Dint, CLNeg_ipd),
            Result          => Q0_zd,
            PreviousDataIn  => PrevData0
        );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  Q0,
            OutSignalName   =>  "Q0",
            OutTemp         =>  Q0_zd,
            Paths           => (
                0 => (InputChangeTime   => CLNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLOCK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLOCK_Q0,
                      PathCondition     => (CLNeg_ipd = '1' OR
                                            CLNeg_ipd = 'H') ) ),
            GlitchData      => Q0_GlitchData );

        VitalPathDelay01 (
            OutSignal       =>  Q1,
            OutSignalName   =>  "Q1",
            OutTemp         =>  Q1_zd,
            Paths           => (
                0 => (InputChangeTime   => CLNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLOCK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLOCK_Q0,
                      PathCondition     => (CLNeg_ipd = '1' OR
                                            CLNeg_ipd = 'H') ) ),
            GlitchData      => Q1_GlitchData );

        VitalPathDelay01 (
            OutSignal       =>  Q2,
            OutSignalName   =>  "Q2",
            OutTemp         =>  Q2_zd,
            Paths           => (
                0 => (InputChangeTime   => CLNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLOCK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLOCK_Q0,
                      PathCondition     => (CLNeg_ipd = '1' OR
                                            CLNeg_ipd = 'H') ) ),
            GlitchData      => Q2_GlitchData );

        VitalPathDelay01 (
            OutSignal       =>  Q3,
            OutSignalName   =>  "Q3",
            OutTemp         =>  Q3_zd,
            Paths           => (
                0 => (InputChangeTime   => CLNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLOCK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLOCK_Q0,
                      PathCondition     => (CLNeg_ipd = '1' OR
                                            CLNeg_ipd = 'H') ) ),
            GlitchData      => Q3_GlitchData );

        VitalPathDelay01 (
            OutSignal       =>  Q4,
            OutSignalName   =>  "Q4",
            OutTemp         =>  Q4_zd,
            Paths           => (
                0 => (InputChangeTime   => CLNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLOCK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLOCK_Q0,
                      PathCondition     => (CLNeg_ipd = '1' OR
                                            CLNeg_ipd = 'H') ) ),
            GlitchData      => Q4_GlitchData );

        VitalPathDelay01 (
            OutSignal       =>  Q5,
            OutSignalName   =>  "Q5",
            OutTemp         =>  Q5_zd,
            Paths           => (
                0 => (InputChangeTime   => CLNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLOCK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLOCK_Q0,
                      PathCondition     => (CLNeg_ipd = '1' OR
                                            CLNeg_ipd = 'H') ) ),
            GlitchData      => Q5_GlitchData );

        VitalPathDelay01 (
            OutSignal       =>  Q6,
            OutSignalName   =>  "Q6",
            OutTemp         =>  Q6_zd,
            Paths           => (
                0 => (InputChangeTime   => CLNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLOCK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLOCK_Q0,
                      PathCondition     => (CLNeg_ipd = '1' OR
                                            CLNeg_ipd = 'H') ) ),
            GlitchData      => Q6_GlitchData );

        VitalPathDelay01 (
            OutSignal       =>  Q7,
            OutSignalName   =>  "Q7",
            OutTemp         =>  Q7_zd,
            Paths           => (
                0 => (InputChangeTime   => CLNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLOCK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLOCK_Q0,
                      PathCondition     => (CLNeg_ipd = '1' OR
                                            CLNeg_ipd = 'H') ) ),
            GlitchData      => Q7_GlitchData );

    END PROCESS;
END vhdl_behavioral;
