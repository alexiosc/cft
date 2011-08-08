--------------------------------------------------------------------------------
--  File name: std163.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998, 1999 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   98 OCT 02   Initial release
--    V1.1     R. Munden   99 NOV 21   correct generics and timing checks
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:        STND
--  Technology:     54/74XXXX
--  Part:           STD163
--
--  Description:    4-Bit Synchronous Binary Up Counter with Synchronous Clear
-- 
--------------------------------------------------------------------------------
LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.numeric_std.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
--------------------------------------------------------------------------------
--  ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std163 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_P3             : VitalDelayType01 := VitalZeroDelay01;
        tipd_P2             : VitalDelayType01 := VitalZeroDelay01;
        tipd_P1             : VitalDelayType01 := VitalZeroDelay01;
        tipd_P0             : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLRNeg         : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK            : VitalDelayType01 := VitalZeroDelay01;
        tipd_LDNeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_ENT            : VitalDelayType01 := VitalZeroDelay01;
        tipd_ENP            : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays: propagation delays
        tpd_CLK_Q0          : VitalDelayType01 := UnitDelay01;
        tpd_CLK_RCO         : VitalDelayType01 := UnitDelay01;
        tpd_ENT_RCO         : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_P0_CLK : VitalDelayType := UnitDelay;
        tsetup_ENP_CLK      : VitalDelayType := UnitDelay;
        tsetup_LDNeg_CLK    : VitalDelayType := UnitDelay;
        tsetup_CLRNeg_CLK   : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_P0_CLK        : VitalDelayType := UnitDelay;
        thold_ENP_CLK       : VitalDelayType := UnitDelay;
        thold_LDNeg_CLK     : VitalDelayType := UnitDelay;
        thold_CLRNeg_CLK    : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge     : VitalDelayType := UnitDelay;
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
        P3                  : IN std_logic := 'X';
        P2                  : IN std_logic := 'X';
        P1                  : IN std_logic := 'X';
        P0                  : IN std_logic := 'X';
        CLRNeg              : IN std_logic := 'X';
        CLK                 : IN std_logic := 'X';
        LDNeg               : IN std_logic := 'X';
        ENT                 : IN std_logic := 'X';
        ENP                 : IN std_logic := 'X';
        Q3                  : OUT std_logic := 'U';
        Q2                  : OUT std_logic := 'U';
        Q1                  : OUT std_logic := 'U';
        Q0                  : OUT std_logic := 'U';
        RCO                 : OUT std_logic := 'U'
    );
    ATTRIBUTE VITAL_level0 of std163 : ENTITY IS TRUE;
END std163;

--------------------------------------------------------------------------------
--  ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral OF std163 IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL P3_ipd           : std_ulogic := 'X';
    SIGNAL P2_ipd           : std_ulogic := 'X';
    SIGNAL P1_ipd           : std_ulogic := 'X';
    SIGNAL P0_ipd           : std_ulogic := 'X';
    SIGNAL CLRNeg_ipd       : std_ulogic := 'X';
    SIGNAL CLK_ipd          : std_ulogic := 'X';
    SIGNAL LDNeg_ipd        : std_ulogic := 'X';
    SIGNAL ENP_ipd          : std_ulogic := 'X';
    SIGNAL ENT_ipd          : std_ulogic := 'X';

    SIGNAL Q0int           : std_ulogic := 'X';
    SIGNAL Q1int           : std_ulogic := 'X';
    SIGNAL Q2int           : std_ulogic := 'X';
    SIGNAL Q3int           : std_ulogic := 'X';
    SIGNAL RCOint          : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (P3_ipd, P3, tipd_P3);
        w_2: VitalWireDelay (P2_ipd, P2, tipd_P2);
        w_3: VitalWireDelay (P1_ipd, P1, tipd_P1);
        w_4: VitalWireDelay (P0_ipd, P0, tipd_P0);
        w_5: VitalWireDelay (CLRNeg_ipd, CLRNeg, tipd_CLRNeg);
        w_6: VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_7: VitalWireDelay (LDNeg_ipd, LDNeg, tipd_LDNeg);
        w_8: VitalWireDelay (ENP_ipd, ENP, tipd_ENP);
        w_9: VitalWireDelay (ENT_ipd, ENT, tipd_ENT);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedures
    ----------------------------------------------------------------------------
    a_1: VitalBUF  (q => Q0,  a => Q0int);
    a_2: VitalBUF  (q => Q1,  a => Q1int);
    a_3: VitalBUF  (q => Q2,  a => Q2int);
    a_4: VitalBUF  (q => Q3,  a => Q3int);
    a_5: VitalBUF  (q => RCO, a => RCOint);

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, CLRNeg_ipd, LDNeg_ipd, ENP_ipd, ENT_ipd, 
                             P0_ipd,  P1_ipd,  P2_ipd, P3_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_P3_CLK   : X01 := '0';
        VARIABLE TD_P3_CLK      : VitalTimingDataType;

        VARIABLE Tviol_P2_CLK   : X01 := '0';
        VARIABLE TD_P2_CLK      : VitalTimingDataType;

        VARIABLE Tviol_P1_CLK   : X01 := '0';
        VARIABLE TD_P1_CLK      : VitalTimingDataType;

        VARIABLE Tviol_P0_CLK   : X01 := '0';
        VARIABLE TD_P0_CLK      : VitalTimingDataType;

        VARIABLE Tviol_ENT_CLK : X01 := '0';
        VARIABLE TD_ENT_CLK   : VitalTimingDataType;

        VARIABLE Tviol_ENP_CLK : X01 := '0';
        VARIABLE TD_ENP_CLK   : VitalTimingDataType;

        VARIABLE Tviol_LDNeg_CLK : X01 := '0';
        VARIABLE TD_LDNeg_CLK    : VitalTimingDataType;

        VARIABLE Tviol_CLRNeg_CLK   : X01 := '0';
        VARIABLE TD_CLRNeg_CLK      : VitalTimingDataType;

        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLK      : X01 := '0';
 
        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE COUNT          : unsigned(3 downto 0);
        ALIAS Q0_zd             : std_ulogic IS COUNT(0);
        ALIAS Q1_zd             : std_ulogic IS COUNT(1);
        ALIAS Q2_zd             : std_ulogic IS COUNT(2);
        ALIAS Q3_zd             : std_ulogic IS COUNT(3);
        VARIABLE RCO_zd         : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Q0_GlitchData  : VitalGlitchDataType;
        VARIABLE Q1_GlitchData  : VitalGlitchDataType;
        VARIABLE Q2_GlitchData  : VitalGlitchDataType;
        VARIABLE Q3_GlitchData  : VitalGlitchDataType;
        VARIABLE RCO_GlitchData : VitalGlitchDataType;

        -- No Weak Values Variables
        VARIABLE CLRNeg_nwv    : UX01 := 'X';
        VARIABLE ENP_nwv : UX01 := 'X';
        VARIABLE ENT_nwv : UX01 := 'X';
        VARIABLE LDNeg_nwv  : UX01 := 'X';

    BEGIN 
        CLRNeg_nwv    := To_UX01 (s => CLRNeg_ipd);
        ENP_nwv       := To_UX01 (s => ENP_ipd);
        ENT_nwv       := To_UX01 (s => ENT_ipd);
        LDNeg_nwv     := To_UX01 (s => LDNeg_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN
            VitalSetupHoldCheck (
                TestSignal      => P3_ipd,
                TestSignalName  => "P3_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_P0_CLK,
                SetupLow        => tsetup_P0_CLK,
                HoldHigh        => thold_P0_CLK,
                HoldLow         => thold_P0_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std163",
                TimingData      => TD_P3_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_P3_CLK
            );
 
            VitalSetupHoldCheck (
                TestSignal      => P2_ipd,
                TestSignalName  => "P2_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_P0_CLK,
                SetupLow        => tsetup_P0_CLK,
                HoldHigh        => thold_P0_CLK,
                HoldLow         => thold_P0_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std163",
                TimingData      => TD_P2_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_P2_CLK
            );
 
            VitalSetupHoldCheck (
                TestSignal      => P1_ipd,
                TestSignalName  => "P1_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_P0_CLK,
                SetupLow        => tsetup_P0_CLK,
                HoldHigh        => thold_P0_CLK,
                HoldLow         => thold_P0_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std163",
                TimingData      => TD_P1_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_P1_CLK
            );
 
            VitalSetupHoldCheck (
                TestSignal      => P0_ipd,
                TestSignalName  => "P0_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_P0_CLK,
                SetupLow        => tsetup_P0_CLK,
                HoldHigh        => thold_P0_CLK,
                HoldLow         => thold_P0_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std163",
                TimingData      => TD_P0_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_P0_CLK
            );
 
            VitalSetupHoldCheck (
                TestSignal      => ENP_ipd,
                TestSignalName  => "ENP_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_ENP_CLK,
                SetupLow        => tsetup_ENP_CLK,
                HoldHigh        => thold_ENP_CLK,
                HoldLow         => thold_ENP_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std163",
                TimingData      => TD_ENP_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_ENP_CLK
            );
 
            VitalSetupHoldCheck (
                TestSignal      => LDNeg_ipd,
                TestSignalName  => "LDNeg_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_LDNeg_CLK,
                SetupLow        => tsetup_LDNeg_CLK,
                HoldHigh        => thold_LDNeg_CLK,
                HoldLow         => thold_LDNeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std163",
                TimingData      => TD_LDNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_LDNeg_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => CLRNeg_ipd,
                TestSignalName  => "CLRNeg_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupLow        => tsetup_CLRNeg_CLK,
                HoldLow         => thold_CLRNeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std163",
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
                PulseWidthLow   => tpw_CLK_negedge,
                HeaderMsg       => InstancePath & "/std163",
                CheckEnabled    => TRUE,
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Pviol_CLK OR Tviol_CLRNeg_CLK OR 
                     Tviol_LDNeg_CLK OR Tviol_ENT_CLK OR Tviol_ENP_CLK OR 
                     Tviol_P3_CLK OR Tviol_P2_CLK OR Tviol_P1_CLK OR
                     Tviol_P0_CLK;
 
        IF (Violation = 'X')  THEN
            COUNT := (OTHERS => 'X');
            RCO_zd := 'X';

        ------------------------------------------------------------------------
        -- CLRNeg is '1' and no violation implement functionality
        ------------------------------------------------------------------------
        ELSIF (CLK_ipd = '1' AND CLK_ipd'EVENT) THEN
            --------------------------------------------------------------------
            -- Check for sync. unknown --
            --------------------------------------------------------------------
            IF (ENP_nwv = 'X' OR ENT_nwv = 'X' OR LDNeg_nwv = 'X' OR
                    CLRNeg_nwv = 'X') THEN
                COUNT := (OTHERS => 'X');
                RCO_zd := 'X';
            --------------------------------------------------------------------
            -- Clear --
            --------------------------------------------------------------------
            ELSIF (CLRNeg_nwv = '0') THEN
                COUNT := (OTHERS => '0');
                RCO_zd := '0';
            --------------------------------------------------------------------
            -- Load data --
            --------------------------------------------------------------------
            ELSIF (LDNeg_nwv = '0') THEN
                COUNT := (P3_ipd, P2_ipd,
                          P1_ipd, P0_ipd);

                IF (COUNT(3 downto 0)) = "1111" THEN
                    RCO_zd := '1';
                ELSIF (COUNT(3) = 'X') THEN
                    RCO_zd := 'X';
                ELSE
                    RCO_zd := '0';
                END IF;
            --------------------------------------------------------------------
            -- Count Up --
            --------------------------------------------------------------------
            ELSIF (ENT_nwv = '1' AND ENP_nwv = '1' AND LDNeg_nwv = '1') THEN
                COUNT := (COUNT(3 downto 0)) + to_unsigned(1,1);

                IF (COUNT(3 downto 0)) = "1111" THEN
                    RCO_zd := '1';
                ELSIF (COUNT(3) = 'X') THEN
                    RCO_zd := 'X';
                ELSE
                    RCO_zd := '0';
                END IF;
            --------------------------------------------------------------------
            -- Hold terminal count during cascaded count --
            --------------------------------------------------------------------
            ELSIF (ENT_nwv = '1') THEN
                IF (COUNT(3 downto 0)) = "1111" THEN
                    RCO_zd := '1';
                ELSIF (COUNT(3) = 'X') THEN
                    RCO_zd := 'X';
                ELSE
                    RCO_zd := '0';
                END IF;

            END IF;

        ELSIF (ENT_nwv = '0') THEN
            RCO_zd := '0';

        END IF;

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Q0int,
            OutSignalName   => "Q0",
            OutTemp         => Q0_zd,
            GlitchData      => Q0_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => Q1int,
            OutSignalName   => "Q1",
            OutTemp         => Q1_zd,
            GlitchData      => Q1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => Q2int,
            OutSignalName   => "Q2",
            OutTemp         => Q2_zd,
            GlitchData      => Q2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)
            )
        );
 
        VitalPathDelay01 (
            OutSignal       => Q3int,
            OutSignalName   => "Q3",
            OutTemp         => Q3_zd,
            GlitchData      => Q3_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => RCOint,
            OutSignalName   => "RCO",
            OutTemp         => RCO_zd,
            GlitchData      => RCO_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_RCO,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => ENT_ipd'LAST_EVENT,
                      PathDelay         => tpd_ENT_RCO,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
