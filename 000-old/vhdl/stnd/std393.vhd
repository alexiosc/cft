--------------------------------------------------------------------------------
--  File name: std393.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2002 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   02 FEB 10   Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:        STND
--  Technology:     54/74XXXX
--  Part:           STD393
--
--  Description:    4-Bit Binary Counter
-- 
--------------------------------------------------------------------------------
LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.numeric_std.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.conversions.ALL;
--------------------------------------------------------------------------------
--  ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std393 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CLR            : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK            : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays: propagation delays
        tpd_CLR_Q0          : VitalDelayType01 := UnitDelay01;
        tpd_CLK_Q0          : VitalDelayType01 := UnitDelay01;
        tpd_CLK_Q1          : VitalDelayType01 := UnitDelay01;
        tpd_CLK_Q2          : VitalDelayType01 := UnitDelay01;
        tpd_CLK_Q3          : VitalDelayType01 := UnitDelay01;
        -- trecovery values: release times
        trecovery_CLR_CLK    : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLR_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING  := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN := DefaultTimingChecks;
        MsgOn               : BOOLEAN := DefaultMsgOn;
        XOn                 : BOOLEAN := DefaultXOn;
        -- For FMF SDF technology file usage
        TimingModel         : STRING := DefaultTimingModel
    );
    PORT (
        -- 0 denotes internal pull-down resistor
        CLR                 : IN std_ulogic := 'U';
        CLK                 : IN std_ulogic := 'U';
        Q3                  : OUT std_ulogic := 'U';
        Q2                  : OUT std_ulogic := 'U';
        Q1                  : OUT std_ulogic := 'U';
        Q0                  : OUT std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_level0 of std393 : ENTITY IS TRUE;
END std393;

--------------------------------------------------------------------------------
--  ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral OF std393 IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL CLR_ipd         : std_ulogic := 'U';
    SIGNAL CLK_ipd         : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_5: VitalWireDelay (CLR_ipd, CLR, tipd_CLR);
        w_6: VitalWireDelay (CLK_ipd, CLK, tipd_CLK);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, CLR_ipd)

        -- Timing Check Variables
        VARIABLE Rviol_CLR_CLK   : X01 := '0';
        VARIABLE TD_CLR_CLK      : VitalTimingDataType;

        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLK      : X01 := '0';
 
        VARIABLE PD_CLR          : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLR       : X01 := '0';
 
        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE counter        : natural := 0;
        VARIABLE count          : std_logic_vector(3 downto 0);
        ALIAS Q0_zd          : std_ulogic IS count(0);
        ALIAS Q1_zd          : std_ulogic IS count(1);
        ALIAS Q2_zd          : std_ulogic IS count(2);
        ALIAS Q3_zd          : std_ulogic IS count(3);

        -- Output Glitch Detection Variables
        VARIABLE Q0_GlitchData  : VitalGlitchDataType;
        VARIABLE Q1_GlitchData  : VitalGlitchDataType;
        VARIABLE Q2_GlitchData  : VitalGlitchDataType;
        VARIABLE Q3_GlitchData  : VitalGlitchDataType;

        -- No Weak Values Variables
        VARIABLE CLR_nwv    : UX01 := 'U';

    BEGIN 
        CLR_nwv    := To_UX01 (s => CLR_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN
            VitalRecoveryRemovalCheck (
                TestSignal      => CLR_ipd,
                TestSignalName  => "CLR_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                Recovery        => trecovery_CLR_CLK,
                ActiveLow       => FALSE,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/std393",
                TimingData      => TD_CLR_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Rviol_CLR_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_negedge,
                HeaderMsg       => InstancePath & "/std393",
                CheckEnabled    => TRUE,
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => CLR_ipd,
                TestSignalName  => "CLR_ipd",
                PulseWidthHigh  => tpw_CLR_posedge,
                HeaderMsg       => InstancePath & "/std393",
                CheckEnabled    => TRUE,
                PeriodData      => PD_CLR,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLR
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Pviol_CLR OR Pviol_CLK OR Rviol_CLR_CLK;
 
        IF (Violation = 'X')  THEN
            COUNT := (OTHERS => 'X');
        ------------------------------------------------------------------------
        -- CLR is '0' and no violation implement functionality
        ------------------------------------------------------------------------
        ELSIF CLR_nwv = '1' THEN
            counter := 0;
        ELSIF rising_edge(CLK_ipd) THEN
            IF counter < 15 THEN
                counter := counter + 1;
            ELSE
                counter := 0;
            END IF;
        END IF;

        count := to_slv(counter, 4);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Q0,
            OutSignalName   => "Q0",
            OutTemp         => Q0_zd,
            GlitchData      => Q0_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => CLR_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLR_Q0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => Q1,
            OutSignalName   => "Q1",
            OutTemp         => Q1_zd,
            GlitchData      => Q1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q1,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => CLR_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLR_Q0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => Q2,
            OutSignalName   => "Q2",
            OutTemp         => Q2_zd,
            GlitchData      => Q2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q2,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => CLR_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLR_Q0,
                      PathCondition     => TRUE)
            )
        );
 
        VitalPathDelay01 (
            OutSignal       => Q3,
            OutSignalName   => "Q3",
            OutTemp         => Q3_zd,
            GlitchData      => Q3_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q3,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => CLR_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLR_Q0,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
