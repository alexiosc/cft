--------------------------------------------------------------------------------
--  File Name: std166.vhd
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
--    V1.0    R. Munden    01 Aug 02   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/7400
--  Part:       STD166
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
ENTITY std166 IS
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
        tipd_CLRNeg              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLK_Q                : VitalDelayType01 := UnitDelay01;
        tpd_CLRNeg_Q             : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_CLRNeg_CLK        : VitalDelayType := UnitDelay;
        tsetup_SH_CLK            : VitalDelayType := UnitDelay;
        tsetup_DA_CLK            : VitalDelayType := UnitDelay;
        tsetup_SER_CLK           : VitalDelayType := UnitDelay;
        tsetup_CLKINH_CLK        : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_SER_CLK            : VitalDelayType := UnitDelay;
        thold_DA_CLK             : VitalDelayType := UnitDelay;
        thold_SH_CLK             : VitalDelayType := UnitDelay;
        thold_CLKINH_CLK         : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge          : VitalDelayType := UnitDelay;
        tpw_CLRNeg_negedge       : VitalDelayType := UnitDelay;
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
        CLRNeg          : IN    std_ulogic := 'U';
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
    ATTRIBUTE VITAL_LEVEL0 of std166 : ENTITY IS TRUE;
END std166;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std166 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID            : STRING := "std166";

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
    SIGNAL CLRNeg_ipd          : std_ulogic := 'U';

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
        w_14 : VitalWireDelay (CLRNeg_ipd, CLRNeg, tipd_CLRNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, CLKINH_ipd, DA_ipd, DB_ipd, DC_ipd,
                             DD_ipd, DE_ipd, DF_ipd, DG_ipd, DH_ipd, SH_ipd,
                             SER_ipd, CLRNeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_DA_CLK  : X01 := '0';
        VARIABLE TD_DA_CLK     : VitalTimingDataType;

        VARIABLE Tviol_DB_CLK  : X01 := '0';
        VARIABLE TD_DB_CLK     : VitalTimingDataType;

        VARIABLE Tviol_DC_CLK  : X01 := '0';
        VARIABLE TD_DC_CLK     : VitalTimingDataType;

        VARIABLE Tviol_DD_CLK  : X01 := '0';
        VARIABLE TD_DD_CLK     : VitalTimingDataType;

        VARIABLE Tviol_DE_CLK  : X01 := '0';
        VARIABLE TD_DE_CLK     : VitalTimingDataType;

        VARIABLE Tviol_DF_CLK  : X01 := '0';
        VARIABLE TD_DF_CLK     : VitalTimingDataType;

        VARIABLE Tviol_DG_CLK  : X01 := '0';
        VARIABLE TD_DG_CLK     : VitalTimingDataType;

        VARIABLE Tviol_DH_CLK  : X01 := '0';
        VARIABLE TD_DH_CLK     : VitalTimingDataType;

        VARIABLE Tviol_SH_CLK  : X01 := '0';
        VARIABLE TD_SH_CLK     : VitalTimingDataType;

        VARIABLE Tviol_SER_CLK : X01 := '0';
        VARIABLE TD_SER_CLK    : VitalTimingDataType;

        VARIABLE Tviol_CLRNeg_CLK  : X01 := '0';
        VARIABLE TD_CLRNeg_CLK     : VitalTimingDataType;

        VARIABLE Tviol_CLKINH_CLK  : X01 := '0';
        VARIABLE TD_CLKINH_CLK     : VitalTimingDataType;

        VARIABLE PD_CLK        : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLK     : X01 := '0';

        VARIABLE PD_CLRNeg     : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLRNeg  : X01 := '0';

        VARIABLE Violation     : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd    : std_ulogic := 'U';
        VARIABLE Q1int   : std_ulogic := 'U';
        VARIABLE Q2int   : std_ulogic := 'U';
        VARIABLE Q3int   : std_ulogic := 'U';
        VARIABLE Q4int   : std_ulogic := 'U';
        VARIABLE Q5int   : std_ulogic := 'U';
        VARIABLE Q6int   : std_ulogic := 'U';
        VARIABLE Q7int   : std_ulogic := 'U';
        VARIABLE D1int   : std_ulogic := 'U';
        VARIABLE D2int   : std_ulogic := 'U';
        VARIABLE D3int   : std_ulogic := 'U';
        VARIABLE D4int   : std_ulogic := 'U';
        VARIABLE D5int   : std_ulogic := 'U';
        VARIABLE D6int   : std_ulogic := 'U';
        VARIABLE D7int   : std_ulogic := 'U';
        VARIABLE D8int   : std_ulogic := 'U';
        VARIABLE CLKint  : std_ulogic := 'U';
        VARIABLE LD      : std_ulogic := 'U';

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData  : VitalGlitchDataType;
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
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_DA_CLK,
                SetupLow        => tsetup_DA_CLK,
                HoldHigh        => thold_DA_CLK,
                HoldLow         => thold_DA_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DA_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DA_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => DB_ipd,
                TestSignalName  => "DB",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_DA_CLK,
                SetupLow        => tsetup_DA_CLK,
                HoldHigh        => thold_DA_CLK,
                HoldLow         => thold_DA_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DB_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DB_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => DC_ipd,
                TestSignalName  => "DC",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_DA_CLK,
                SetupLow        => tsetup_DA_CLK,
                HoldHigh        => thold_DA_CLK,
                HoldLow         => thold_DA_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DC_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DC_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => DD_ipd,
                TestSignalName  => "DD",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_DA_CLK,
                SetupLow        => tsetup_DA_CLK,
                HoldHigh        => thold_DA_CLK,
                HoldLow         => thold_DA_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DD_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => DE_ipd,
                TestSignalName  => "DE",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_DA_CLK,
                SetupLow        => tsetup_DA_CLK,
                HoldHigh        => thold_DA_CLK,
                HoldLow         => thold_DA_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DE_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DE_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => DF_ipd,
                TestSignalName  => "DF",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_DA_CLK,
                SetupLow        => tsetup_DA_CLK,
                HoldHigh        => thold_DA_CLK,
                HoldLow         => thold_DA_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DF_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DF_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => DG_ipd,
                TestSignalName  => "DG",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_DA_CLK,
                SetupLow        => tsetup_DA_CLK,
                HoldHigh        => thold_DA_CLK,
                HoldLow         => thold_DA_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DG_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DG_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => DH_ipd,
                TestSignalName  => "DH",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_DA_CLK,
                SetupLow        => tsetup_DA_CLK,
                HoldHigh        => thold_DA_CLK,
                HoldLow         => thold_DA_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_DH_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_DH_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => SH_ipd,
                TestSignalName  => "SH",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_SH_CLK,
                HoldHigh        => thold_SH_CLK,
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
                SetupLow        => tsetup_CLKINH_CLK,
                HoldHigh        => thold_CLKINH_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_CLKINH_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKINH_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => CLRNeg_ipd,
                TestSignalName  => "CLRNeg_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_CLRNeg_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_CLRNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLRNeg_CLK
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
                TestSignal      => CLRNeg_ipd,
                TestSignalName  => "CLRNeg_ipd",
                PulseWidthLow   => tpw_CLRNeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_CLRNeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLRNeg
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Pviol_CLRNeg OR Pviol_CLK OR Tviol_CLRNeg_CLK OR 
                     Tviol_SER_CLK OR Tviol_CLKINH_CLK OR Tviol_DA_CLK OR
                     Tviol_DB_CLK OR Tviol_DC_CLK OR Tviol_DD_CLK OR 
                     Tviol_DE_CLK OR Tviol_DF_CLK OR Tviol_DG_CLK OR
                     Tviol_DH_CLK;

        CLKint := VitalOR2 (a => CLK_ipd, b => CLKINH_ipd);

        D1int := VitalMUX2 ( Data1   => SER_ipd,
                             Data0   => DA_ipd,
                             dSelect => SH_ipd );

        D2int := VitalMUX2 ( Data1   => Q1int,
                             Data0   => DB_ipd,
                             dSelect => SH_ipd );

        D3int := VitalMUX2 ( Data1   => Q2int,
                             Data0   => DC_ipd,
                             dSelect => SH_ipd );

        D4int := VitalMUX2 ( Data1   => Q3int,
                             Data0   => DD_ipd,
                             dSelect => SH_ipd );

        D5int := VitalMUX2 ( Data1   => Q4int,
                             Data0   => DE_ipd,
                             dSelect => SH_ipd );

        D6int := VitalMUX2 ( Data1   => Q5int,
                             Data0   => DF_ipd,
                             dSelect => SH_ipd );

        D7int := VitalMUX2 ( Data1   => Q6int,
                             Data0   => DG_ipd,
                             dSelect => SH_ipd );

        D8int := VitalMUX2 ( Data1   => Q7int,
                             Data0   => DH_ipd,
                             dSelect => SH_ipd );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLKint, D1int, CLRNeg_ipd),
            Result          => Q1int,
            PreviousDataIn  => PrevData0
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLKint, D2int, CLRNeg_ipd),
            Result          => Q2int,
            PreviousDataIn  => PrevData1
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLKint, D3int, CLRNeg_ipd),
            Result          => Q3int,
            PreviousDataIn  => PrevData2
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLKint, D4int, CLRNeg_ipd),
            Result          => Q4int,
            PreviousDataIn  => PrevData3
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLKint, D5int, CLRNeg_ipd),
            Result          => Q5int,
            PreviousDataIn  => PrevData4
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLKint, D6int, CLRNeg_ipd),
            Result          => Q6int,
            PreviousDataIn  => PrevData5
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLKint, D7int, CLRNeg_ipd),
            Result          => Q7int,
            PreviousDataIn  => PrevData6
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLKint, D8int, CLRNeg_ipd),
            Result          => Q_zd,
            PreviousDataIn  => PrevData7
        );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  Q,
            OutSignalName   =>  "Q",
            OutTemp         =>  Q_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLRNeg_Q,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q,
                      PathCondition     => (SH_ipd = '1'))),
            GlitchData      => Q_GlitchData );

    END PROCESS;
END vhdl_behavioral;
