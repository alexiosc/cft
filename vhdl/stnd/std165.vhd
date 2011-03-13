--------------------------------------------------------------------------------
--  File Name: std165.vhd
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
--    V1.0    R. Munden    01 Jan 06   Initial release
--    V1.1    R. Munden    01 Sep 02   Corrected path delays
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/7400
--  Part:       STD165
-- 
--  Description: 8-Bit Parallel-Load Shift Register
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std165 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_DH                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_DG                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_DF                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_DE                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_DD                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_DC                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_DB                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_DA                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_SH                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_SER                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKINH              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLK_Q                : VitalDelayType01 := UnitDelay01;
        tpd_SH_Q                 : VitalDelayType01 := UnitDelay01;
        tpd_DH_Q                 : VitalDelayType01 := UnitDelay01;
        tpd_DH_QNeg              : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_DA_SH             : VitalDelayType := UnitDelay;
        tsetup_SH_CLK            : VitalDelayType := UnitDelay;
        tsetup_SER_CLK           : VitalDelayType := UnitDelay;
        tsetup_CLKINH_CLK_negedge : VitalDelayType := UnitDelay;
        tsetup_CLKINH_CLK_posedge : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_SER_CLK            : VitalDelayType := UnitDelay;
        thold_DA_SH              : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge          : VitalDelayType := UnitDelay;
        tpw_SH_negedge           : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge      : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        Q               : OUT   std_ulogic := 'U';
        QNeg            : OUT   std_ulogic := 'U';
        DH              : IN    std_ulogic := 'U';
        DG              : IN    std_ulogic := 'U';
        DF              : IN    std_ulogic := 'U';
        DE              : IN    std_ulogic := 'U';
        DD              : IN    std_ulogic := 'U';
        DC              : IN    std_ulogic := 'U';
        DB              : IN    std_ulogic := 'U';
        DA              : IN    std_ulogic := 'U';
        SER             : IN    std_ulogic := 'U';
        SH              : IN    std_ulogic := 'U';
        CLK             : IN    std_ulogic := 'U';
        CLKINH          : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std165 : ENTITY IS TRUE;
END std165;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std165 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID            : STRING := "std165";

    SIGNAL DH_ipd              : std_ulogic := 'U';
    SIGNAL DG_ipd              : std_ulogic := 'U';
    SIGNAL DF_ipd              : std_ulogic := 'U';
    SIGNAL DE_ipd              : std_ulogic := 'U';
    SIGNAL DD_ipd              : std_ulogic := 'U';
    SIGNAL DC_ipd              : std_ulogic := 'U';
    SIGNAL DB_ipd              : std_ulogic := 'U';
    SIGNAL DA_ipd              : std_ulogic := 'U';
    SIGNAL SER_ipd             : std_ulogic := 'U';
    SIGNAL CLK_ipd             : std_ulogic := 'U';
    SIGNAL CLKINH_ipd          : std_ulogic := 'U';
    SIGNAL SH_ipd              : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_2 : VitalWireDelay (DH_ipd, DH, tipd_DH);
        w_3 : VitalWireDelay (DG_ipd, DG, tipd_DG);
        w_4 : VitalWireDelay (DF_ipd, DF, tipd_DF);
        w_5 : VitalWireDelay (DE_ipd, DE, tipd_DE);
        w_6 : VitalWireDelay (DD_ipd, DD, tipd_DD);
        w_7 : VitalWireDelay (DC_ipd, DC, tipd_DC);
        w_8 : VitalWireDelay (DB_ipd, DB, tipd_DB);
        w_9 : VitalWireDelay (DA_ipd, DA, tipd_DA);
        w_10 : VitalWireDelay (SER_ipd, SER, tipd_SER);
        w_11 : VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_12 : VitalWireDelay (CLKINH_ipd, CLKINH, tipd_CLKINH);
        w_13 : VitalWireDelay (SH_ipd, SH, tipd_SH);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, CLKINH_ipd, DA_ipd, DB_ipd, DC_ipd, DD_ipd,
                             DE_ipd, DF_ipd, DG_ipd, DH_ipd, SH_ipd, SER_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_DH_SH   : X01 := '0';
        VARIABLE TD_DH_SH      : VitalTimingDataType;

        VARIABLE Tviol_DG_SH   : X01 := '0';
        VARIABLE TD_DG_SH      : VitalTimingDataType;

        VARIABLE Tviol_DF_SH   : X01 := '0';
        VARIABLE TD_DF_SH      : VitalTimingDataType;

        VARIABLE Tviol_DE_SH   : X01 := '0';
        VARIABLE TD_DE_SH      : VitalTimingDataType;

        VARIABLE Tviol_DD_SH   : X01 := '0';
        VARIABLE TD_DD_SH      : VitalTimingDataType;

        VARIABLE Tviol_DC_SH   : X01 := '0';
        VARIABLE TD_DC_SH      : VitalTimingDataType;

        VARIABLE Tviol_DB_SH   : X01 := '0';
        VARIABLE TD_DB_SH      : VitalTimingDataType;

        VARIABLE Tviol_DA_SH   : X01 := '0';
        VARIABLE TD_DA_SH      : VitalTimingDataType;

        VARIABLE Tviol_SH_CLK  : X01 := '0';
        VARIABLE TD_SH_CLK     : VitalTimingDataType;

        VARIABLE Tviol_SER_CLK  : X01 := '0';
        VARIABLE TD_SER_CLK     : VitalTimingDataType;

        VARIABLE Tviol_CLKINH_CLK  : X01 := '0';
        VARIABLE TD_CLKINH_CLK     : VitalTimingDataType;

        VARIABLE PD_CLK        : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLK     : X01 := '0';

        VARIABLE PD_SH         : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_SH      : X01 := '0';

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE QNeg_zd : std_ulogic := 'U';
        VARIABLE Q_zd    : std_ulogic := 'U';
        VARIABLE D1int   : std_ulogic := 'U';
        VARIABLE D2int   : std_ulogic := 'U';
        VARIABLE D3int   : std_ulogic := 'U';
        VARIABLE D4int   : std_ulogic := 'U';
        VARIABLE D5int   : std_ulogic := 'U';
        VARIABLE D6int   : std_ulogic := 'U';
        VARIABLE D7int   : std_ulogic := 'U';
        VARIABLE CLKint  : std_ulogic := 'U';
        VARIABLE LD      : std_ulogic := 'U';
        VARIABLE R0      : std_ulogic := 'U';
        VARIABLE R1      : std_ulogic := 'U';
        VARIABLE R2      : std_ulogic := 'U';
        VARIABLE R3      : std_ulogic := 'U';
        VARIABLE R4      : std_ulogic := 'U';
        VARIABLE R5      : std_ulogic := 'U';
        VARIABLE R6      : std_ulogic := 'U';
        VARIABLE R7      : std_ulogic := 'U';
        VARIABLE S0      : std_ulogic := 'U';
        VARIABLE S1      : std_ulogic := 'U';
        VARIABLE S2      : std_ulogic := 'U';
        VARIABLE S3      : std_ulogic := 'U';
        VARIABLE S4      : std_ulogic := 'U';
        VARIABLE S5      : std_ulogic := 'U';
        VARIABLE S6      : std_ulogic := 'U';
        VARIABLE S7      : std_ulogic := 'U';

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData  : VitalGlitchDataType;
        VARIABLE QNeg_GlitchData  : VitalGlitchDataType;
        VARIABLE PrevData0      : std_logic_vector(0 to 4);
        VARIABLE PrevData1      : std_logic_vector(0 to 4);
        VARIABLE PrevData2      : std_logic_vector(0 to 4);
        VARIABLE PrevData3      : std_logic_vector(0 to 4);
        VARIABLE PrevData4      : std_logic_vector(0 to 4);
        VARIABLE PrevData5      : std_logic_vector(0 to 4);
        VARIABLE PrevData6      : std_logic_vector(0 to 4);
        VARIABLE PrevData7      : std_logic_vector(0 to 4);

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => DH_ipd,
                TestSignalName  => "DH",
                RefSignal       => SH_ipd,
                RefSignalName   => "SH",
                SetupHigh       => tsetup_DA_SH,
                SetupLow        => tsetup_DA_SH,
                HoldHigh        => thold_DA_SH,
                HoldLow         => thold_DA_SH,
                CheckEnabled    => true,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DH_SH,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DH_SH
            );

            VitalSetupHoldCheck (
                TestSignal      => DG_ipd,
                TestSignalName  => "DG",
                RefSignal       => SH_ipd,
                RefSignalName   => "SH",
                SetupHigh       => tsetup_DA_SH,
                SetupLow        => tsetup_DA_SH,
                HoldHigh        => thold_DA_SH,
                HoldLow         => thold_DA_SH,
                CheckEnabled    => true,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DG_SH,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DG_SH
            );

            VitalSetupHoldCheck (
                TestSignal      => DF_ipd,
                TestSignalName  => "DF",
                RefSignal       => SH_ipd,
                RefSignalName   => "SH",
                SetupHigh       => tsetup_DA_SH,
                SetupLow        => tsetup_DA_SH,
                HoldHigh        => thold_DA_SH,
                HoldLow         => thold_DA_SH,
                CheckEnabled    => true,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DF_SH,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DF_SH
            );

            VitalSetupHoldCheck (
                TestSignal      => DE_ipd,
                TestSignalName  => "DE",
                RefSignal       => SH_ipd,
                RefSignalName   => "SH",
                SetupHigh       => tsetup_DA_SH,
                SetupLow        => tsetup_DA_SH,
                HoldHigh        => thold_DA_SH,
                HoldLow         => thold_DA_SH,
                CheckEnabled    => true,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DE_SH,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DE_SH
            );

            VitalSetupHoldCheck (
                TestSignal      => DD_ipd,
                TestSignalName  => "DD",
                RefSignal       => SH_ipd,
                RefSignalName   => "SH",
                SetupHigh       => tsetup_DA_SH,
                SetupLow        => tsetup_DA_SH,
                HoldHigh        => thold_DA_SH,
                HoldLow         => thold_DA_SH,
                CheckEnabled    => true,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DD_SH,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DD_SH
            );

            VitalSetupHoldCheck (
                TestSignal      => DC_ipd,
                TestSignalName  => "DC",
                RefSignal       => SH_ipd,
                RefSignalName   => "SH",
                SetupHigh       => tsetup_DA_SH,
                SetupLow        => tsetup_DA_SH,
                HoldHigh        => thold_DA_SH,
                HoldLow         => thold_DA_SH,
                CheckEnabled    => true,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DC_SH,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DC_SH
            );

            VitalSetupHoldCheck (
                TestSignal      => DB_ipd,
                TestSignalName  => "DB",
                RefSignal       => SH_ipd,
                RefSignalName   => "SH",
                SetupHigh       => tsetup_DA_SH,
                SetupLow        => tsetup_DA_SH,
                HoldHigh        => thold_DA_SH,
                HoldLow         => thold_DA_SH,
                CheckEnabled    => true,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DB_SH,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DB_SH
            );

            VitalSetupHoldCheck (
                TestSignal      => DA_ipd,
                TestSignalName  => "DA",
                RefSignal       => SH_ipd,
                RefSignalName   => "SH",
                SetupHigh       => tsetup_DA_SH,
                SetupLow        => tsetup_DA_SH,
                HoldHigh        => thold_DA_SH,
                HoldLow         => thold_DA_SH,
                CheckEnabled    => true,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DA_SH,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DA_SH
            );

            VitalSetupHoldCheck (
                TestSignal      => SH_ipd,
                TestSignalName  => "SH",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_SH_CLK,
                SetupLow        => tsetup_SH_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_SH_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_SH_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => SER_ipd,
                TestSignalName  => "SER",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_SER_CLK,
                SetupLow        => tsetup_SER_CLK,
                HoldHigh        => thold_SER_CLK,
                HoldLow         => thold_SER_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_SER_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_SER_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => CLKINH_ipd,
                TestSignalName  => "CLKINH_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_CLKINH_CLK_posedge,
                SetupLow        => tsetup_CLKINH_CLK_negedge,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_CLKINH_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKINH_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => SH_ipd,
                TestSignalName  => "SH_ipd",
                PulseWidthLow   => tpw_SH_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_SH,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_SH
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Pviol_SH OR Pviol_CLK OR Tviol_DA_SH OR 
                     Tviol_SER_CLK OR Tviol_CLKINH_CLK;

        CLKint := VitalOR2 (a => CLK_ipd, b => CLKINH_ipd);
        LD := VitalINV (data => SH_ipd);
        S7 := VitalAND2 (a => LD, b => DH_ipd);
        R7 := VitalAND2 (a => LD, b => not(DH_ipd));
        S6 := VitalAND2 (a => LD, b => DG_ipd);
        R6 := VitalAND2 (a => LD, b => not(DG_ipd));
        S5 := VitalAND2 (a => LD, b => DF_ipd);
        R5 := VitalAND2 (a => LD, b => not(DF_ipd));
        S4 := VitalAND2 (a => LD, b => DE_ipd);
        R4 := VitalAND2 (a => LD, b => not(DE_ipd));
        S3 := VitalAND2 (a => LD, b => DD_ipd);
        R3 := VitalAND2 (a => LD, b => not(DD_ipd));
        S2 := VitalAND2 (a => LD, b => DC_ipd);
        R2 := VitalAND2 (a => LD, b => not(DC_ipd));
        S1 := VitalAND2 (a => LD, b => DB_ipd);
        R1 := VitalAND2 (a => LD, b => not(DB_ipd));
        S0 := VitalAND2 (a => LD, b => DA_ipd);
        R0 := VitalAND2 (a => LD, b => not(DA_ipd));

        VitalStateTable (
            StateTable      => DFFSR_tab,
            DataIn          => (Violation, CLKint, D7int, S7, R7),
            Result          => Q_zd,
            PreviousDataIn  => PrevData7
        );

        VitalStateTable (
            StateTable      => DFFSR_tab,
            DataIn          => (Violation, CLKint, D6int, S6, R6),
            Result          => D7int,
            PreviousDataIn  => PrevData6
        );

        VitalStateTable (
            StateTable      => DFFSR_tab,
            DataIn          => (Violation, CLKint, D5int, S5, R5),
            Result          => D6int,
            PreviousDataIn  => PrevData5
        );

        VitalStateTable (
            StateTable      => DFFSR_tab,
            DataIn          => (Violation, CLKint, D4int, S4, R4),
            Result          => D5int,
            PreviousDataIn  => PrevData4
        );

        VitalStateTable (
            StateTable      => DFFSR_tab,
            DataIn          => (Violation, CLKint, D3int, S3, R3),
            Result          => D4int,
            PreviousDataIn  => PrevData3
        );

        VitalStateTable (
            StateTable      => DFFSR_tab,
            DataIn          => (Violation, CLKint, D2int, S2, R2),
            Result          => D3int,
            PreviousDataIn  => PrevData2
        );

        VitalStateTable (
            StateTable      => DFFSR_tab,
            DataIn          => (Violation, CLKint, D1int, S1, R1),
            Result          => D2int,
            PreviousDataIn  => PrevData1
        );

        VitalStateTable (
            StateTable      => DFFSR_tab,
            DataIn          => (Violation, CLKint, SER_ipd, S0, R0),
            Result          => D1int,
            PreviousDataIn  => PrevData0
        );

        QNeg_zd := VitalINV (data => Q_zd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  Q,
            OutSignalName   =>  "Q",
            OutTemp         =>  Q_zd,
            Paths           => (
                0 => (InputChangeTime   => SH_ipd'LAST_EVENT,
                      PathDelay         => tpd_SH_Q,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q,
                      PathCondition     => (SH_ipd = '1') ),
                2 => (InputChangeTime   => DH_ipd'LAST_EVENT,
                      PathDelay         => tpd_DH_Q,
                      PathCondition     => (SH_ipd = '0') ) ),
            GlitchData      => Q_GlitchData );

        VitalPathDelay01 (
            OutSignal       =>  QNeg,
            OutSignalName   =>  "QNeg",
            OutTemp         =>  QNeg_zd,
            Paths           => (
                0 => (InputChangeTime   => SH_ipd'LAST_EVENT,
                      PathDelay         => tpd_SH_Q,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q,
                      PathCondition     => (SH_ipd = '1') ),
                2 => (InputChangeTime   => DH_ipd'LAST_EVENT,
                      PathDelay         => tpd_DH_QNeg,
                      PathCondition     => (SH_ipd = '0') ) ),
            GlitchData      => QNeg_GlitchData );

    END PROCESS;
END vhdl_behavioral;
