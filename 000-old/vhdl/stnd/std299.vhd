--------------------------------------------------------------------------------
--  File Name: std299.vhd
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
--    V1.0    R. Munden    01 Apr 22   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XX
--  Part:       STD299
-- 
--  Description: 8-Bit Universal Shift Register
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std299 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CLRNeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE1Neg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE2Neg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_S0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_S1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_IO0                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_IO1                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_IO2                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_IO3                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_IO4                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_IO5                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_IO6                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_IO7                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_SL                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_SR                  : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLRNeg_IO0           : VitalDelayType01 := UnitDelay01;
        tpd_CLRNeg_Q0            : VitalDelayType01 := UnitDelay01;
        tpd_OE1Neg_IO0           : VitalDelayType01Z := UnitDelay01Z;
        tpd_S0_IO0               : VitalDelayType01Z := UnitDelay01Z;
        tpd_CLK_IO0              : VitalDelayType01 := UnitDelay01;
        tpd_CLK_Q0               : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_S0_CLK            : VitalDelayType := UnitDelay;
        tsetup_SL_CLK            : VitalDelayType := UnitDelay;
        tsetup_IO0_CLK           : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_S0_CLK             : VitalDelayType := UnitDelay;
        thold_SL_CLK             : VitalDelayType := UnitDelay;
        thold_IO0_CLK            : VitalDelayType := UnitDelay;
        -- trecovery values: release times
        trecovery_CLRNeg_CLK     : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge          : VitalDelayType := UnitDelay;
        tpw_CLK_negedge          : VitalDelayType := UnitDelay;
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
        CLRNeg          : IN    std_ulogic := 'U';
        OE1Neg          : IN    std_ulogic := 'U';
        OE2Neg          : IN    std_ulogic := 'U';
        S0              : IN    std_ulogic := 'U';
        S1              : IN    std_ulogic := 'U';
        CLK             : IN    std_ulogic := 'U';
        IO0             : INOUT std_ulogic := 'U';
        IO1             : INOUT std_ulogic := 'U';
        IO2             : INOUT std_ulogic := 'U';
        IO3             : INOUT std_ulogic := 'U';
        IO4             : INOUT std_ulogic := 'U';
        IO5             : INOUT std_ulogic := 'U';
        IO6             : INOUT std_ulogic := 'U';
        IO7             : INOUT std_ulogic := 'U';
        Q0              : OUT   std_ulogic := 'U';
        Q7              : OUT   std_ulogic := 'U';
        SL              : IN    std_ulogic := 'U';
        SR              : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std299 : ENTITY IS TRUE;
END std299;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std299 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID            : STRING := "std299";

    SIGNAL CLRNeg_ipd          : std_ulogic := 'U';
    SIGNAL OE1Neg_ipd          : std_ulogic := 'U';
    SIGNAL OE2Neg_ipd          : std_ulogic := 'U';
    SIGNAL S0_ipd              : std_ulogic := 'U';
    SIGNAL S1_ipd              : std_ulogic := 'U';
    SIGNAL CLK_ipd             : std_ulogic := 'U';
    SIGNAL IO0_ipd             : std_ulogic := 'U';
    SIGNAL IO1_ipd             : std_ulogic := 'U';
    SIGNAL IO2_ipd             : std_ulogic := 'U';
    SIGNAL IO3_ipd             : std_ulogic := 'U';
    SIGNAL IO4_ipd             : std_ulogic := 'U';
    SIGNAL IO5_ipd             : std_ulogic := 'U';
    SIGNAL IO6_ipd             : std_ulogic := 'U';
    SIGNAL IO7_ipd             : std_ulogic := 'U';
    SIGNAL SL_ipd              : std_ulogic := 'U';
    SIGNAL SR_ipd              : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (CLRNeg_ipd, CLRNeg, tipd_CLRNeg);
        w_2 : VitalWireDelay (OE1Neg_ipd, OE1Neg, tipd_OE1Neg);
        w_3 : VitalWireDelay (OE2Neg_ipd, OE2Neg, tipd_OE2Neg);
        w_4 : VitalWireDelay (S0_ipd, S0, tipd_S0);
        w_5 : VitalWireDelay (S1_ipd, S1, tipd_S1);
        w_6 : VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_8 : VitalWireDelay (IO0_ipd, IO0, tipd_IO0);
        w_9 : VitalWireDelay (IO1_ipd, IO1, tipd_IO1);
        w_10 : VitalWireDelay (IO2_ipd, IO2, tipd_IO2);
        w_11 : VitalWireDelay (IO3_ipd, IO3, tipd_IO3);
        w_12 : VitalWireDelay (IO4_ipd, IO4, tipd_IO4);
        w_13 : VitalWireDelay (IO5_ipd, IO5, tipd_IO5);
        w_14 : VitalWireDelay (IO6_ipd, IO6, tipd_IO6);
        w_15 : VitalWireDelay (IO7_ipd, IO7, tipd_IO7);
        w_18 : VitalWireDelay (SL_ipd, SL, tipd_SL);
        w_19 : VitalWireDelay (SR_ipd, SR, tipd_SR);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, CLRNeg_ipd, OE1Neg_ipd, OE2Neg_ipd,
                             S0_ipd, S1_ipd, IO0_ipd, IO1_ipd, IO2_ipd, IO3_ipd,
                             IO4_ipd, IO5_ipd, IO6_ipd, IO7_ipd, SL_ipd, SR_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_SL_CLK       : X01 := '0';
        VARIABLE TD_SL_CLK          : VitalTimingDataType;

        VARIABLE Tviol_SR_CLK       : X01 := '0';
        VARIABLE TD_SR_CLK          : VitalTimingDataType;

        VARIABLE Tviol_S0_CLK       : X01 := '0';
        VARIABLE TD_S0_CLK          : VitalTimingDataType;

        VARIABLE Tviol_S1_CLK       : X01 := '0';
        VARIABLE TD_S1_CLK          : VitalTimingDataType;

        VARIABLE Tviol_IO0_CLK      : X01 := '0';
        VARIABLE TD_IO0_CLK         : VitalTimingDataType;

        VARIABLE Tviol_IO1_CLK      : X01 := '0';
        VARIABLE TD_IO1_CLK         : VitalTimingDataType;

        VARIABLE Tviol_IO2_CLK      : X01 := '0';
        VARIABLE TD_IO2_CLK         : VitalTimingDataType;

        VARIABLE Tviol_IO3_CLK      : X01 := '0';
        VARIABLE TD_IO3_CLK         : VitalTimingDataType;

        VARIABLE Tviol_IO4_CLK      : X01 := '0';
        VARIABLE TD_IO4_CLK         : VitalTimingDataType;

        VARIABLE Tviol_IO5_CLK      : X01 := '0';
        VARIABLE TD_IO5_CLK         : VitalTimingDataType;

        VARIABLE Tviol_IO6_CLK      : X01 := '0';
        VARIABLE TD_IO6_CLK         : VitalTimingDataType;

        VARIABLE Tviol_IO7_CLK      : X01 := '0';
        VARIABLE TD_IO7_CLK         : VitalTimingDataType;

        VARIABLE Rviol_CLRNeg_CLK   : X01 := '0';
        VARIABLE TD_CLRNeg_CLK      : VitalTimingDataType;

        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLK      : X01 := '0';

        VARIABLE PD_CLRNeg      : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLRNeg   : X01 := '0';

        VARIABLE Violation      : X01 := '0';

        VARIABLE SEL            : std_logic_vector2;

        -- Functionality Results Variables
        VARIABLE Q0_zd    : std_ulogic := 'U';
        VARIABLE Q7_zd    : std_ulogic := 'U';
        VARIABLE D0int    : std_ulogic := 'U';
        VARIABLE D1int    : std_ulogic := 'U';
        VARIABLE D2int    : std_ulogic := 'U';
        VARIABLE D3int    : std_ulogic := 'U';
        VARIABLE D4int    : std_ulogic := 'U';
        VARIABLE D5int    : std_ulogic := 'U';
        VARIABLE D6int    : std_ulogic := 'U';
        VARIABLE D7int    : std_ulogic := 'U';
        VARIABLE IO0int   : std_ulogic := 'U';
        VARIABLE IO1int   : std_ulogic := 'U';
        VARIABLE IO2int   : std_ulogic := 'U';
        VARIABLE IO3int   : std_ulogic := 'U';
        VARIABLE IO4int   : std_ulogic := 'U';
        VARIABLE IO5int   : std_ulogic := 'U';
        VARIABLE IO6int   : std_ulogic := 'U';
        VARIABLE IO7int   : std_ulogic := 'U';
        VARIABLE IO0_zd   : std_ulogic := 'U';
        VARIABLE IO1_zd   : std_ulogic := 'U';
        VARIABLE IO2_zd   : std_ulogic := 'U';
        VARIABLE IO3_zd   : std_ulogic := 'U';
        VARIABLE IO4_zd   : std_ulogic := 'U';
        VARIABLE IO5_zd   : std_ulogic := 'U';
        VARIABLE IO6_zd   : std_ulogic := 'U';
        VARIABLE IO7_zd   : std_ulogic := 'U';
        VARIABLE disable   : UX01 := 'U';

        -- Output Glitch Detection Variables
        VARIABLE Q0_GlitchData   : VitalGlitchDataType;
        VARIABLE Q7_GlitchData   : VitalGlitchDataType;
        VARIABLE IO0_GlitchData  : VitalGlitchDataType;
        VARIABLE IO1_GlitchData  : VitalGlitchDataType;
        VARIABLE IO2_GlitchData  : VitalGlitchDataType;
        VARIABLE IO3_GlitchData  : VitalGlitchDataType;
        VARIABLE IO4_GlitchData  : VitalGlitchDataType;
        VARIABLE IO5_GlitchData  : VitalGlitchDataType;
        VARIABLE IO6_GlitchData  : VitalGlitchDataType;
        VARIABLE IO7_GlitchData  : VitalGlitchDataType;

        VARIABLE PrevData0      : std_logic_vector(0 to 3);
        VARIABLE PrevData1      : std_logic_vector(0 to 3);
        VARIABLE PrevData2      : std_logic_vector(0 to 3);
        VARIABLE PrevData3      : std_logic_vector(0 to 3);
        VARIABLE PrevData4      : std_logic_vector(0 to 3);
        VARIABLE PrevData5      : std_logic_vector(0 to 3);
        VARIABLE PrevData6      : std_logic_vector(0 to 3);
        VARIABLE PrevData7      : std_logic_vector(0 to 3);

        -- No Weak Values Variables
        VARIABLE S0_nwv     : UX01 := 'U';
        VARIABLE S1_nwv     : UX01 := 'U';
        VARIABLE OE1Neg_nwv : UX01 := 'U';
        VARIABLE OE2Neg_nwv : UX01 := 'U';

    BEGIN

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => S0_ipd,
                TestSignalName  => "S0",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_S0_CLK,
                SetupLow        => tsetup_S0_CLK,
                HoldHigh        => thold_S0_CLK,
                HoldLow         => thold_S0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_S0_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_S0_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => S1_ipd,
                TestSignalName  => "S1",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_S0_CLK,
                SetupLow        => tsetup_S0_CLK,
                HoldHigh        => thold_S0_CLK,
                HoldLow         => thold_S0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_S1_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_S1_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => SL_ipd,
                TestSignalName  => "SL",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_SL_CLK,
                SetupLow        => tsetup_SL_CLK,
                HoldHigh        => thold_SL_CLK,
                HoldLow         => thold_SL_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_SL_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_SL_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => SR_ipd,
                TestSignalName  => "SR",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_SL_CLK,
                SetupLow        => tsetup_SL_CLK,
                HoldHigh        => thold_SL_CLK,
                HoldLow         => thold_SL_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_SR_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_SR_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => IO0_ipd,
                TestSignalName  => "IO0",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_IO0_CLK,
                SetupLow        => tsetup_IO0_CLK,
                HoldHigh        => thold_IO0_CLK,
                HoldLow         => thold_IO0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_IO0_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_IO0_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => IO1_ipd,
                TestSignalName  => "IO1",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_IO0_CLK,
                SetupLow        => tsetup_IO0_CLK,
                HoldHigh        => thold_IO0_CLK,
                HoldLow         => thold_IO0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_IO1_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_IO1_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => IO2_ipd,
                TestSignalName  => "IO2",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_IO0_CLK,
                SetupLow        => tsetup_IO0_CLK,
                HoldHigh        => thold_IO0_CLK,
                HoldLow         => thold_IO0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_IO2_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_IO2_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => IO3_ipd,
                TestSignalName  => "IO3",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_IO0_CLK,
                SetupLow        => tsetup_IO0_CLK,
                HoldHigh        => thold_IO0_CLK,
                HoldLow         => thold_IO0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_IO3_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_IO3_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => IO4_ipd,
                TestSignalName  => "IO4",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_IO0_CLK,
                SetupLow        => tsetup_IO0_CLK,
                HoldHigh        => thold_IO0_CLK,
                HoldLow         => thold_IO0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_IO4_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_IO4_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => IO5_ipd,
                TestSignalName  => "IO5",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_IO0_CLK,
                SetupLow        => tsetup_IO0_CLK,
                HoldHigh        => thold_IO0_CLK,
                HoldLow         => thold_IO0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_IO5_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_IO5_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => IO6_ipd,
                TestSignalName  => "IO6",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_IO0_CLK,
                SetupLow        => tsetup_IO0_CLK,
                HoldHigh        => thold_IO0_CLK,
                HoldLow         => thold_IO0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_IO6_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_IO6_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => IO7_ipd,
                TestSignalName  => "IO7",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_IO0_CLK,
                SetupLow        => tsetup_IO0_CLK,
                HoldHigh        => thold_IO0_CLK,
                HoldLow         => thold_IO0_CLK,
                CheckEnabled    => true,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_IO7_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_IO7_CLK
            );

            VitalRecoveryRemovalCheck (
                TestSignal      => CLRNeg_ipd,
                TestSignalName  => "CLRNeg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                Recovery        => trecovery_CLRNeg_CLK,
                ActiveLow       => TRUE,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_CLRNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Rviol_CLRNeg_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLRNeg_ipd,
                TestSignalName  => "CLRNeg",
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
        Violation := Pviol_CLRNeg OR Pviol_CLK OR Tviol_SL_CLK OR Tviol_SR_CLK
                     OR Tviol_S0_CLK OR Tviol_S1_CLK OR Tviol_IO0_CLK OR
                     Tviol_IO1_CLK OR Tviol_IO2_CLK OR Tviol_IO3_CLK OR
                     Tviol_IO4_CLK OR Tviol_IO5_CLK OR Tviol_IO6_CLK OR
                     Tviol_IO7_CLK OR Rviol_CLRNeg_CLK;

        S0_nwv     := to_UX01(S0_ipd);
        S1_nwv     := to_UX01(S1_ipd);
        OE1Neg_nwv := to_UX01(OE1Neg_ipd);
        OE2Neg_nwv := to_UX01(OE2Neg_ipd);

        SEL := (S1_nwv & S0_nwv);
        disable := (S0_nwv AND S1_nwv) OR OE1Neg_nwv OR OE2Neg_nwv;

        D0int := VitalMux4(Data => (IO0_ipd & SR_ipd & IO1int & IO0int),
                                  dSelect => SEL);
 
        D1int := VitalMux4(Data => (IO1_ipd & IO0int & IO2int & IO1int),
                                  dSelect => SEL);

        D2int := VitalMux4(Data => (IO2_ipd & IO1int & IO3int & IO2int),
                                  dSelect => SEL);

        D3int := VitalMux4(Data => (IO3_ipd & IO2int & IO4int & IO3int),
                                  dSelect => SEL);

        D4int := VitalMux4(Data => (IO4_ipd & IO3int & IO5int & IO4int),
                                  dSelect => SEL);

        D5int := VitalMux4(Data => (IO5_ipd & IO4int & IO6int & IO5int),
                                  dSelect => SEL);

        D6int := VitalMux4(Data => (IO6_ipd & IO5int & IO7int & IO6int),
                                  dSelect => SEL);

        D7int := VitalMux4(Data => (IO7_ipd & IO6int & SL_ipd & IO7int),
                                  dSelect => SEL);

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLK_ipd, D0int, CLRNeg_ipd),
            Result          => IO0int,
            PreviousDataIn  => PrevData0
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLK_ipd, D1int, CLRNeg_ipd),
            Result          => IO1int,
            PreviousDataIn  => PrevData1
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLK_ipd, D2int, CLRNeg_ipd),
            Result          => IO2int,
            PreviousDataIn  => PrevData2
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLK_ipd, D3int, CLRNeg_ipd),
            Result          => IO3int,
            PreviousDataIn  => PrevData3
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLK_ipd, D4int, CLRNeg_ipd),
            Result          => IO4int,
            PreviousDataIn  => PrevData4
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLK_ipd, D5int, CLRNeg_ipd),
            Result          => IO5int,
            PreviousDataIn  => PrevData5
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLK_ipd, D6int, CLRNeg_ipd),
            Result          => IO6int,
            PreviousDataIn  => PrevData6
        );

        VitalStateTable (
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLK_ipd, D7int, CLRNeg_ipd),
            Result          => IO7int,
            PreviousDataIn  => PrevData7
        );

        Q0_zd := IO0int;
        Q7_zd := IO7int;

        IO0_zd := VitalBufIF0(data => IO0int, Enable => disable);
        IO1_zd := VitalBufIF0(data => IO1int, Enable => disable);
        IO2_zd := VitalBufIF0(data => IO2int, Enable => disable);
        IO3_zd := VitalBufIF0(data => IO3int, Enable => disable);
        IO4_zd := VitalBufIF0(data => IO4int, Enable => disable);
        IO5_zd := VitalBufIF0(data => IO5int, Enable => disable);
        IO6_zd := VitalBufIF0(data => IO6int, Enable => disable);
        IO7_zd := VitalBufIF0(data => IO7int, Enable => disable);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       =>  Q0,
            OutSignalName   =>  "Q0",
            OutTemp         =>  Q0_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLRNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => true ) ),
            GlitchData      => Q0_GlitchData );

        VitalPathDelay01 (
            OutSignal       =>  Q7,
            OutSignalName   =>  "Q7",
            OutTemp         =>  Q7_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLRNeg_Q0,
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => true ) ),
            GlitchData      => Q7_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  IO0,
            OutSignalName   =>  "IO0",
            OutTemp         =>  IO0_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         =>
                                     VitalExtendToFillDelay(tpd_CLRNeg_IO0),
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => 
                                    VitalExtendToFillDelay(tpd_CLK_IO0),
                      PathCondition     => (disable = '0') ),
                2 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                3 => (InputChangeTime   => OE2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                4 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ),
                5 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ) ),
            GlitchData      => IO0_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  IO1,
            OutSignalName   =>  "IO1",
            OutTemp         =>  IO1_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         =>
                                     VitalExtendToFillDelay(tpd_CLRNeg_IO0),
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => 
                                    VitalExtendToFillDelay(tpd_CLK_IO0),
                      PathCondition     => (disable = '0') ),
                2 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                3 => (InputChangeTime   => OE2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                4 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ),
                5 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ) ),
            GlitchData      => IO1_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  IO2,
            OutSignalName   =>  "IO2",
            OutTemp         =>  IO2_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         =>
                                     VitalExtendToFillDelay(tpd_CLRNeg_IO0),
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => 
                                    VitalExtendToFillDelay(tpd_CLK_IO0),
                      PathCondition     => (disable = '0') ),
                2 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                3 => (InputChangeTime   => OE2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                4 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ),
                5 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ) ),
            GlitchData      => IO2_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  IO3,
            OutSignalName   =>  "IO3",
            OutTemp         =>  IO3_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         =>
                                     VitalExtendToFillDelay(tpd_CLRNeg_IO0),
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => 
                                    VitalExtendToFillDelay(tpd_CLK_IO0),
                      PathCondition     => (disable = '0') ),
                2 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                3 => (InputChangeTime   => OE2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                4 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ),
                5 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ) ),
            GlitchData      => IO3_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  IO4,
            OutSignalName   =>  "IO4",
            OutTemp         =>  IO4_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         =>
                                     VitalExtendToFillDelay(tpd_CLRNeg_IO0),
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => 
                                    VitalExtendToFillDelay(tpd_CLK_IO0),
                      PathCondition     => (disable = '0') ),
                2 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                3 => (InputChangeTime   => OE2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                4 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ),
                5 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ) ),
            GlitchData      => IO4_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  IO5,
            OutSignalName   =>  "IO5",
            OutTemp         =>  IO5_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         =>
                                     VitalExtendToFillDelay(tpd_CLRNeg_IO0),
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => 
                                    VitalExtendToFillDelay(tpd_CLK_IO0),
                      PathCondition     => (disable = '0') ),
                2 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                3 => (InputChangeTime   => OE2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                4 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ),
                5 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ) ),
            GlitchData      => IO5_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  IO6,
            OutSignalName   =>  "IO6",
            OutTemp         =>  IO6_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         =>
                                     VitalExtendToFillDelay(tpd_CLRNeg_IO0),
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => 
                                    VitalExtendToFillDelay(tpd_CLK_IO0),
                      PathCondition     => (disable = '0') ),
                2 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                3 => (InputChangeTime   => OE2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                4 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ),
                5 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ) ),
            GlitchData      => IO6_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  IO7,
            OutSignalName   =>  "IO7",
            OutTemp         =>  IO7_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         =>
                                     VitalExtendToFillDelay(tpd_CLRNeg_IO0),
                      PathCondition     => true),
                1 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => 
                                    VitalExtendToFillDelay(tpd_CLK_IO0),
                      PathCondition     => (disable = '0') ),
                2 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                3 => (InputChangeTime   => OE2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_IO0,
                      PathCondition     => true ),
                4 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ),
                5 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_IO0,
                      PathCondition     => true ) ),
            GlitchData      => IO7_GlitchData );


    END PROCESS;

END vhdl_behavioral;
