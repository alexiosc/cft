--------------------------------------------------------------------------------
--  File Name: std996.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2000 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    00 Nov 13   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: TTL
--  Part:       STD996
-- 
--  Description: D Edge-Triggered Read-Back Latch
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std996 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_Q                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLRNeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_RDNeg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_ENNeg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_TC                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLK_Q             : VitalDelayType01 := UnitDelay01;
        tpd_CLRNeg_Q_TC_EQ_0  : VitalDelayType01 := UnitDelay01;
        tpd_CLRNeg_Q_TC_EQ_1  : VitalDelayType01 := UnitDelay01;
        tpd_CLRNeg_D          : VitalDelayType01 := UnitDelay01;
        tpd_TC_Q              : VitalDelayType01 := UnitDelay01;
        tpd_RDNeg_D           : VitalDelayType01Z := UnitDelay01Z;
        tpd_ENNeg_D           : VitalDelayType01Z := UnitDelay01Z;
        tpd_OENeg_Q           : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_D_CLK        : VitalDelayType := UnitDelay;
        tsetup_ENNeg_CLK    : VitalDelayType := UnitDelay;
        tsetup_CLK_ENNeg    : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_D_CLK         : VitalDelayType := UnitDelay;
        thold_ENNeg_CLK     : VitalDelayType := UnitDelay;
        thold_RDNeg_CLK     : VitalDelayType := UnitDelay;
        -- trecovery values: release times
        trecovery_CLRNeg_CLK    : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        tpw_CLRNeg_negedge  : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        D               : INOUT std_ulogic := 'U';
        Q               : OUT   std_ulogic := 'U';
        CLK             : IN    std_ulogic := 'U';
        CLRNeg          : IN    std_ulogic := 'U';
        RDNeg           : IN    std_ulogic := 'U';
        ENNeg           : IN    std_ulogic := 'U';
        TC              : IN    std_ulogic := 'U';
        OENeg           : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std996 : ENTITY IS TRUE;
END std996;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std996 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID            : STRING := "std996";

    SIGNAL D_ipd               : std_ulogic := 'U';
    SIGNAL CLK_ipd             : std_ulogic := 'U';
    SIGNAL CLRNeg_ipd          : std_ulogic := 'U';
    SIGNAL RDNeg_ipd           : std_ulogic := 'U';
    SIGNAL ENNeg_ipd           : std_ulogic := 'U';
    SIGNAL TC_ipd              : std_ulogic := 'U';
    SIGNAL OENeg_ipd           : std_ulogic := 'U';
    SIGNAL FFOUT               : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (D_ipd, D, tipd_D);
        w_3 : VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_4 : VitalWireDelay (CLRNeg_ipd, CLRNeg, tipd_CLRNeg);
        w_5 : VitalWireDelay (RDNeg_ipd, RDNeg, tipd_RDNeg);
        w_6 : VitalWireDelay (ENNeg_ipd, ENNeg, tipd_ENNeg);
        w_7 : VitalWireDelay (TC_ipd, TC, tipd_TC);
        w_8 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    QBehavior : PROCESS (CLK_ipd, D_ipd, CLRNeg_ipd, TC_ipd, OENeg_ipd, 
                         ENNeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_D_CLK       : X01 := '0';
        VARIABLE TD_D_CLK          : VitalTimingDataType;

        VARIABLE Tviol_ENNeg_CLK   : X01 := '0';
        VARIABLE TD_ENNeg_CLK      : VitalTimingDataType;

        VARIABLE Tviol_CLK_ENNeg   : X01 := '0';
        VARIABLE TD_CLK_ENNeg      : VitalTimingDataType;

        VARIABLE Rviol_CLRNeg_CLK  : X01 := '0';
        VARIABLE TD_CLRNeg_CLK     : VitalTimingDataType;

        VARIABLE Pviol_CLK      : X01 := '0';
        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_CLRNeg   : X01 := '0';
        VARIABLE PD_CLRNeg      : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE CLRint         : std_ulogic;
        VARIABLE Qxor           : std_ulogic;
        VARIABLE Qint           : std_ulogic;
        VARIABLE Q_zd           : std_ulogic;
        VARIABLE PrevData       : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => D_ipd,
                TestSignalName  => "D",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_D_CLK,
                SetupLow        => tsetup_D_CLK,
                HoldHigh        => thold_D_CLK,
                HoldLow         => thold_D_CLK,
                CheckEnabled    => (ENNeg_ipd = '0'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_D_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => ENNeg_ipd,
                TestSignalName  => "ENNeg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_ENNeg_CLK,
                SetupLow        => tsetup_ENNeg_CLK,
                HoldHigh        => thold_ENNeg_CLK,
                HoldLow         => thold_ENNeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_ENNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_ENNeg_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK",
                RefSignal       => ENNeg_ipd,
                RefSignalName   => "ENNeg",
                SetupHigh       => tsetup_CLK_ENNeg,
                SetupLow        => tsetup_CLK_ENNeg,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_CLK_ENNeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLK_ENNeg
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
        Violation := Pviol_CLRNeg OR Pviol_CLK OR Rviol_CLRNeg_CLK OR
                     Tviol_D_CLK OR Tviol_ENNeg_CLK OR Tviol_CLK_ENNeg;

        CLRint := not CLRNeg_ipd;

        VitalStateTable (
            StateTable      => DFFR_tab,
            DataIn          => (Violation, CLK_ipd, D_ipd, CLRint),
            Result          => Qint,
            PreviousDataIn  => PrevData
        );

        FFOUT <= Qint;
        Qxor := VITALXOR2(a=> TC_ipd, b => Qint);
        Q_zd := VITALBUFIF0 (data => Qxor, enable => OENeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       =>  Q,
            OutSignalName   =>  "Q",
            OutTemp         =>  Q_zd,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_CLK_Q),
                      PathCondition     => (OENeg_ipd = '0')),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_Q,
                      PathCondition     => TRUE ),
                2 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay
                                           (tpd_CLRNeg_Q_TC_EQ_0),
                      PathCondition     => (OENeg_ipd = '0' AND
                                            TC_ipd = '0') ),
                3 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay
                                           (tpd_CLRNeg_Q_TC_EQ_1),
                      PathCondition     => (OENeg_ipd = '0' AND
                                            TC_ipd = '1') ),
                4 => (InputChangeTime   => TC_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_TC_Q),
                      PathCondition     => (OENeg_ipd = '0') ) ),
            GlitchData      => Q_GlitchData );


    END PROCESS;

    ----------------------------------------------------------------------------
    -- D Output Behavior Process
    ----------------------------------------------------------------------------
    DBehavior : PROCESS (FFOUT, RDNeg_ipd, ENNeg_ipd, CLRNeg_ipd)

        -- Functionality Results Variables
        VARIABLE ENint          : std_ulogic;
        VARIABLE D_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE D_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        ENint := VITALNOR2(a => RDNeg_ipd, b => ENNeg_ipd);
        D_zd := VITALBUFIF1(data => FFOUT, enable => ENint);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       =>  D,
            OutSignalName   =>  "D",
            OutTemp         =>  D_zd,
            Paths           => (
                0 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_CLRNeg_D),
                      PathCondition     => (ENNeg_ipd = '0' AND
                                            RDNeg_ipd = '0')),
                1 => (InputChangeTime   => ENNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_ENNeg_D,
                      PathCondition     => (RDNeg_ipd = '0') ),
                2 => (InputChangeTime   => RDNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_RDNeg_D,
                      PathCondition     => (ENNeg_ipd = '0') ) ),
            GlitchData      => D_GlitchData );

    END PROCESS;

END vhdl_behavioral;
