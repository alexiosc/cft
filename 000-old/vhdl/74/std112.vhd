--------------------------------------------------------------------------------
--  File Name: std112.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   98 MAY 29   Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD112
-- 
--  Desciption:  Negative-Edge Triggered J-K Flip-Flop
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std112 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_J              : VitalDelayType01 := VitalZeroDelay01;
        tipd_K              : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK            : VitalDelayType01 := VitalZeroDelay01;
        tipd_PRENeg         : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLRNeg         : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLK_Q           : VitalDelayType01 := UnitDelay01;
        tpd_PRENeg_Q        : VitalDelayType01 := UnitDelay01;
        tpd_CLRNeg_Q        : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_J_CLK        : VitalDelayType := UnitDelay;
        tsetup_PRENeg_CLK   : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_J_CLK         : VitalDelayType := UnitDelay;
        thold_PRENeg_CLK    : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        tpw_PRENeg_negedge  : VitalDelayType := UnitDelay;
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
        QNeg    : OUT   std_logic := 'U';
        J       : IN    std_logic := 'X';
        K       : IN    std_logic := 'X';
        CLK     : IN    std_logic := 'X';
        PRENeg  : IN    std_logic := 'X';
        CLRNeg  : IN    std_logic := 'X'
    );

    ATTRIBUTE VITAL_LEVEL0 of std112 : ENTITY IS TRUE;
END std112;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std112 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT std112_tab : VitalStateTableType  := (

        ----INPUTS----------------------|PREV-|-OUTPUT--
        -- Viol CLK   J    K    R    P  | QI  | Q'    --
        --------------------------------|-----|---------
        (  'X', '-', '-', '-', '-', '-', '-', 'X'), -- timing violation
        (  '-', 'B', '-', '-', 'X', '1', '0', '0'), -- reset unknown
        (  '-', '\', '0', '-', 'X', '1', '0', '0'), -- reset unknown
        (  '-', '-', '-', '-', 'X', '-', '-', 'X'), -- reset unknown
        (  '-', 'B', '-', '-', '1', 'X', '1', '1'), -- preset unknown
        (  '-', '\', '0', '-', '1', 'X', '1', '1'), -- preset unknown
        (  '-', '-', '-', '-', '-', 'X', '-', 'X'), -- preset unknown
        (  '-', '-', '-', '-', '0', '1', '-', '0'), -- reset asserted
        (  '-', '-', '-', '-', '1', '0', '-', '1'), -- preset asserted
        (  '-', 'X', '0', '-', '1', '1', '0', '0'), -- clk unknown
        (  '-', 'X', '-', '-', '1', '1', '-', 'X'), -- clk unknown
        (  '-', '\', '0', '0', '1', '1', '0', '0'), -- active clock edge
        (  '-', '\', '0', '0', '1', '1', '1', '1'), -- active clock edge
        (  '-', '\', '1', '1', '1', '1', '0', '1'), -- active clock edge
        (  '-', '\', '1', '1', '1', '1', '1', '0'), -- active clock edge
        (  '-', '\', '0', '1', '1', '1', '-', '0'), -- active clock edge
        (  '-', '\', '1', '0', '1', '1', '-', '1'), -- active clock edge
        (  '-', '\', '-', '-', '1', '1', '-', 'X'), -- active clock edge
        (  '-', '-', '-', '-', '-', '-', '-', 'S')  -- default

        ); -- end of VitalStateTableType definition

    SIGNAL Qint         : std_ulogic := 'X';
    SIGNAL J_ipd        : std_ulogic := 'X';
    SIGNAL K_ipd        : std_ulogic := 'X';
    SIGNAL CLK_ipd      : std_ulogic := 'X';
    SIGNAL PRENeg_ipd   : std_ulogic := 'X';
    SIGNAL CLRNeg_ipd   : std_ulogic := 'X';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (J_ipd, J, tipd_J);
        w_2: VitalWireDelay (K_ipd, K, tipd_K);
        w_3: VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_4: VitalWireDelay (PRENeg_ipd, PRENeg, tipd_PRENeg);
        w_5: VitalWireDelay (CLRNeg_ipd, CLRNeg, tipd_CLRNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent Procedures
    ----------------------------------------------------------------------------
    a_1: VitalINV (
            q            => QNeg, 
            a            => Qint
         );

    a_2: VitalBUF (
            q            => Q, 
            a            => Qint
         );

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, CLRNeg_ipd, PRENeg_ipd, J_ipd, K_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_J_CLK    : X01 := '0';
        VARIABLE TD_J_CLK       : VitalTimingDataType;

        VARIABLE Tviol_K_CLK    : X01 := '0';
        VARIABLE TD_K_CLK       : VitalTimingDataType;

        VARIABLE Pviol_CLK      : X01 := '0';
        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_CLR      : X01 := '0';
        VARIABLE PD_CLR         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_PRE      : X01 := '0';
        VARIABLE PD_PRE         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd           : std_ulogic;
        VARIABLE PrevData       : std_logic_vector(0 to 5);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => J_ipd,
                TestSignalName  => "J_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_J_CLK,
                SetupLow        => tsetup_J_CLK,
                HoldHigh        => thold_J_CLK,
                HoldLow         => thold_J_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/std112",
                TimingData      => TD_J_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_J_CLK
            );
 
            VitalSetupHoldCheck (
                TestSignal      => K_ipd,
                TestSignalName  => "K_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_J_CLK,
                SetupLow        => tsetup_J_CLK,
                HoldHigh        => thold_J_CLK,
                HoldLow         => thold_J_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/std112",
                TimingData      => TD_K_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_K_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std112",
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
                HeaderMsg       => InstancePath & "/std112",
                PeriodData      => PD_CLR,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLR
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => PRENeg_ipd,
                TestSignalName  => "PRENeg_ipd",
                PulseWidthLow   => tpw_PRENeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std112",
                PeriodData      => PD_PRE,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_PRE
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_J_CLK OR Tviol_K_CLK OR Pviol_CLK OR Pviol_CLR
                     OR Pviol_PRE;
 
        VitalStateTable (
            StateTable      => STD112_tab,
            DataIn          => (Violation, CLK_ipd, J_ipd, K_ipd, CLRNeg_ipd, 
                                PRENeg_ipd),
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
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLRNeg_Q,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => PRENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_PRENeg_Q,
                      PathCondition     => TRUE)
            )
        );
 
    END PROCESS;
 
END vhdl_behavioral;
