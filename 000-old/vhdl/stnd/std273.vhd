--------------------------------------------------------------------------------
--  File Name: std273.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997 Free Model Foundation; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    97 SEP 25  Conformed to style guide
--    V1.1    R. Munden    98 SEP 09  Added recovery check
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/273XXXX
--  Part:        STD273
-- 
--  Desciption:  D Flip-Flop with Clear
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;
                 USE FMF.ff_package.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std273 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK            : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLRNeg         : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLK_Q           : VitalDelayType01 := UnitDelay01;
        tpd_CLRNeg_Q        : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_D_CLK        : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_D_CLK         : VitalDelayType := UnitDelay;
        -- trecovery values: release times
        trecovery_CLRNeg_CLK : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        tpw_CLRNeg_negedge  : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge : VitalDelayType := UnitDelay;
        -- generic control parameters
        TimingChecksOn      : Boolean  := DefaultTimingChecks;
        MsgOn               : BOOLEAN := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        Q       : OUT   std_logic := 'U';
        D       : IN    std_logic := 'X';
        CLK     : IN    std_logic := 'X';
        CLRNeg  : IN    std_logic := 'X'
    );

    ATTRIBUTE VITAL_LEVEL0 of std273 : ENTITY IS TRUE;
END std273;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std273 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL Qint         : std_ulogic := 'X';
    SIGNAL D_ipd        : std_ulogic := 'X';
    SIGNAL CLK_ipd      : std_ulogic := 'X';
    SIGNAL CLRNeg_ipd   : std_ulogic := 'X';
    SIGNAL CLRint       : std_ulogic := 'X';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (D_ipd, D, tipd_D);
        w_2: VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_3: VitalWireDelay (CLRNeg_ipd, CLRNeg, tipd_CLRNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent Procedures
    ----------------------------------------------------------------------------
    a_1: VitalBUF (
            q            => Q, 
            a            => Qint
         );

    a_2: VitalINV (
            q            => CLRint, 
            a            => CLRNeg_ipd
         );

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, D_ipd, CLRint)

        -- Timing Check Variables
        VARIABLE Tviol_D_CLK    : X01 := '0';
        VARIABLE TD_D_CLK       : VitalTimingDataType;

        VARIABLE Rviol_CLRNeg_CLK    : X01 := '0';
        VARIABLE TD_CLRNeg_CLK       : VitalTimingDataType;

        VARIABLE Pviol_CLK      : X01 := '0';
        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_CLRint   : X01 := '0';
        VARIABLE PD_CLRint      : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
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
                TestSignalName  => "D_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_D_CLK,
                SetupLow        => tsetup_D_CLK,
                HoldHigh        => thold_D_CLK,
                HoldLow         => thold_D_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std273",
                TimingData      => TD_D_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D_CLK
            );
 
            VitalRecoveryRemovalCheck (
                TestSignal      => CLRint,
                TestSignalName  => "CLRint",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                Recovery        => trecovery_CLRNeg_CLK,
                ActiveLow       => TRUE,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/std273",
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
                HeaderMsg       => InstancePath & "/std273",
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => CLRint,
                TestSignalName  => "CLRNeg_ipd",
                PulseWidthLow   => tpw_CLRNeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std273",
                PeriodData      => PD_CLRint,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLRint
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_D_CLK OR Pviol_CLK OR Pviol_CLRint;
 
        VitalStateTable (
            StateTable      => DFFR_tab,
            DataIn          => (Violation, CLK_ipd, D_ipd, CLRint),
            Result          => Q_zd,
            PreviousDataIn  => PrevData
        );
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Qint,
            OutSignalName   => "Qint",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q,
                      PathCondition     => (CLRint = '0')),
                1 => (InputChangeTime   => CLRint'LAST_EVENT,
                      PathDelay         => tpd_CLRNeg_Q,
                      PathCondition     => TRUE)
            )
        );
 
    END PROCESS;
 
END vhdl_behavioral;
