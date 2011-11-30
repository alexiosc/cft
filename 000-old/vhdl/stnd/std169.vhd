--------------------------------------------------------------------------------
--  File Name: std169.vhd
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
--    V1.0    R. Munden    00 Aug 01   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74xxx
--  Part:       STD169
-- 
--  Description: Sync 4-bit Binary Up/Down Counter
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
                USE IEEE.numeric_std.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std169 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_ENTNeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_ENPNeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_D3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_D0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_LDNeg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_UD                  : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_ENTNeg_RCONeg        : VitalDelayType01 := UnitDelay01;
        tpd_CLK_RCONeg           : VitalDelayType01 := UnitDelay01;
        tpd_CLK_Q0               : VitalDelayType01 := UnitDelay01;
        tpd_UD_RCONeg            : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_D0_CLK       : VitalDelayType := UnitDelay;
        tsetup_ENPNeg_CLK   : VitalDelayType := UnitDelay;
        tsetup_ENTNeg_CLK   : VitalDelayType := UnitDelay;
        tsetup_LDNeg_CLK    : VitalDelayType := UnitDelay;
        tsetup_UD_CLK       : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_D0_CLK        : VitalDelayType := UnitDelay;
        thold_ENPNeg_CLK    : VitalDelayType := UnitDelay;
        thold_ENTNeg_CLK    : VitalDelayType := UnitDelay;
        thold_LDNeg_CLK     : VitalDelayType := UnitDelay;
        thold_UD_CLK        : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge     : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        ENTNeg          : IN    std_logic := 'U';
        RCONeg          : OUT   std_logic := 'U';
        Q3              : OUT   std_logic := 'U';
        Q2              : OUT   std_logic := 'U';
        Q1              : OUT   std_logic := 'U';
        Q0              : OUT   std_logic := 'U';
        ENPNeg          : IN    std_logic := 'U';
        D3              : IN    std_logic := 'U';
        D2              : IN    std_logic := 'U';
        D1              : IN    std_logic := 'U';
        D0              : IN    std_logic := 'U';
        CLK             : IN    std_logic := 'U';
        LDNeg           : IN    std_logic := 'U';
        UD              : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std169 : ENTITY IS TRUE;
END std169;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std169 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL ENTNeg_ipd          : std_ulogic := 'U';
    SIGNAL ENPNeg_ipd          : std_ulogic := 'U';
    SIGNAL D3_ipd              : std_ulogic := 'U';
    SIGNAL D2_ipd              : std_ulogic := 'U';
    SIGNAL D1_ipd              : std_ulogic := 'U';
    SIGNAL D0_ipd              : std_ulogic := 'U';
    SIGNAL CLK_ipd             : std_ulogic := 'U';
    SIGNAL LDNeg_ipd           : std_ulogic := 'U';
    SIGNAL UD_ipd              : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (ENTNeg_ipd, ENTNeg, tipd_ENTNeg);
        w_7 : VitalWireDelay (ENPNeg_ipd, ENPNeg, tipd_ENPNeg);
        w_8 : VitalWireDelay (D3_ipd, D3, tipd_D3);
        w_9 : VitalWireDelay (D2_ipd, D2, tipd_D2);
        w_10 : VitalWireDelay (D1_ipd, D1, tipd_D1);
        w_11 : VitalWireDelay (D0_ipd, D0, tipd_D0);
        w_12 : VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_13 : VitalWireDelay (LDNeg_ipd, LDNeg, tipd_LDNeg);
        w_14 : VitalWireDelay (UD_ipd, UD, tipd_UD);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, UD_ipd, LDNeg_ipd, ENPNeg_ipd, ENTNeg_ipd,
                             D0_ipd,  D1_ipd,  D2_ipd, D3_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_D3_CLK     : X01 := '0';
        VARIABLE TD_D3_CLK        : VitalTimingDataType;

        VARIABLE Tviol_D2_CLK     : X01 := '0';
        VARIABLE TD_D2_CLK        : VitalTimingDataType;

        VARIABLE Tviol_D1_CLK     : X01 := '0';
        VARIABLE TD_D1_CLK        : VitalTimingDataType;

        VARIABLE Tviol_D0_CLK     : X01 := '0';
        VARIABLE TD_D0_CLK        : VitalTimingDataType;

        VARIABLE Tviol_ENTNeg_CLK : X01 := '0';
        VARIABLE TD_ENTNeg_CLK    : VitalTimingDataType;

        VARIABLE Tviol_ENPNeg_CLK : X01 := '0';
        VARIABLE TD_ENPNeg_CLK    : VitalTimingDataType;

        VARIABLE Tviol_LDNeg_CLK  : X01 := '0';
        VARIABLE TD_LDNeg_CLK     : VitalTimingDataType;

        VARIABLE Tviol_UD_CLK     : X01 := '0';
        VARIABLE TD_UD_CLK        : VitalTimingDataType;

        VARIABLE PD_CLK           : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLK        : X01 := '0';

        VARIABLE Violation        : X01 := '0';

        -- Functionality Results Variables
        VARIABLE COUNT          : unsigned(3 downto 0);
        ALIAS Q0_zd             : std_ulogic IS COUNT(0);
        ALIAS Q1_zd             : std_ulogic IS COUNT(1);
        ALIAS Q2_zd             : std_ulogic IS COUNT(2);
        ALIAS Q3_zd             : std_ulogic IS COUNT(3);
        VARIABLE RCONeg_zd      : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Q0_GlitchData  : VitalGlitchDataType;
        VARIABLE Q1_GlitchData  : VitalGlitchDataType;
        VARIABLE Q2_GlitchData  : VitalGlitchDataType;
        VARIABLE Q3_GlitchData  : VitalGlitchDataType;
        VARIABLE RCONeg_GlitchData : VitalGlitchDataType;

        -- No Weak Values Variables
        VARIABLE UD_nwv     : UX01 := 'U';
        VARIABLE ENPNeg_nwv : UX01 := 'U';
        VARIABLE ENTNeg_nwv : UX01 := 'U';
        VARIABLE LDNeg_nwv  : UX01 := 'U';



    BEGIN
        UD_nwv     := To_UX01 (s => UD_ipd);
        ENPNeg_nwv := To_UX01 (s => ENPNeg_ipd);
        ENTNeg_nwv := To_UX01 (s => ENTNeg_ipd);
        LDNeg_nwv     := To_UX01 (s => LDNeg_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => D3_ipd,
                TestSignalName  => "D3",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_D0_CLK,
                SetupLow        => tsetup_D0_CLK,
                HoldHigh        => thold_D0_CLK,
                HoldLow         => thold_D0_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std169",
                TimingData      => TD_D3_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D3_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => D2_ipd,
                TestSignalName  => "D2",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_D0_CLK,
                SetupLow        => tsetup_D0_CLK,
                HoldHigh        => thold_D0_CLK,
                HoldLow         => thold_D0_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std169",
                TimingData      => TD_D2_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D2_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => D1_ipd,
                TestSignalName  => "D1",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_D0_CLK,
                SetupLow        => tsetup_D0_CLK,
                HoldHigh        => thold_D0_CLK,
                HoldLow         => thold_D0_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std169",
                TimingData      => TD_D1_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D1_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => D0_ipd,
                TestSignalName  => "D0",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_D0_CLK,
                SetupLow        => tsetup_D0_CLK,
                HoldHigh        => thold_D0_CLK,
                HoldLow         => thold_D0_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std169",
                TimingData      => TD_D0_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D0_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => ENPNeg_ipd,
                TestSignalName  => "ENPNeg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_ENPNeg_CLK,
                SetupLow        => tsetup_ENPNeg_CLK,
                HoldHigh        => thold_ENPNeg_CLK,
                HoldLow         => thold_ENPNeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std169",
                TimingData      => TD_ENPNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_ENPNeg_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => ENTNeg_ipd,
                TestSignalName  => "ENTNeg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_ENTNeg_CLK,
                SetupLow        => tsetup_ENTNeg_CLK,
                HoldHigh        => thold_ENTNeg_CLK,
                HoldLow         => thold_ENTNeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std169",
                TimingData      => TD_ENTNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_ENTNeg_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => LDNeg_ipd,
                TestSignalName  => "LDNeg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_LDNeg_CLK,
                SetupLow        => tsetup_LDNeg_CLK,
                HoldHigh        => thold_LDNeg_CLK,
                HoldLow         => thold_LDNeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std169",
                TimingData      => TD_LDNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_LDNeg_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => UD_ipd,
                TestSignalName  => "UD",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_UD_CLK,
                SetupLow        => tsetup_UD_CLK,
                HoldHigh        => thold_UD_CLK,
                HoldLow         => thold_UD_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std169",
                TimingData      => TD_UD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_UD_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_negedge,
                HeaderMsg       => InstancePath & "/std169",
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
        Violation := Pviol_CLK OR Tviol_D3_CLK OR Tviol_D2_CLK OR Tviol_D1_CLK
                     OR Tviol_D0_CLK OR Tviol_ENTNeg_CLK OR Tviol_ENPNeg_CLK OR
                     Tviol_LDNeg_CLK OR Tviol_UD_CLK;

        IF (Violation = 'X')  THEN
            COUNT := (OTHERS => 'X');
            RCONeg_zd := 'X';

        ELSIF rising_edge(CLK_ipd) THEN
            --------------------------------------------------------------------
            -- Check for unknowns --
            --------------------------------------------------------------------
            IF (ENPNeg_nwv = 'X' OR ENTNeg_nwv = 'X' OR LDNeg_nwv = 'X' OR
                    UD_nwv = 'X') THEN
                COUNT := (OTHERS => 'X');
                RCONeg_zd := 'X';
            --------------------------------------------------------------------
            -- Load data --
            --------------------------------------------------------------------
            ELSIF (LDNeg_nwv = '0') THEN
                COUNT := (D3_ipd, D2_ipd,
                          D1_ipd, D0_ipd);

                IF (COUNT(3 downto 0)) = "1111" THEN
                    RCONeg_zd := '0';
                ELSIF (COUNT(3) = 'X') THEN
                    RCONeg_zd := 'X';
                ELSE
                    RCONeg_zd := '1';
                END IF;
            --------------------------------------------------------------------
            -- Count Up --
            --------------------------------------------------------------------
            ELSIF (ENTNeg_nwv = '0' AND ENPNeg_nwv = '0' AND LDNeg_nwv = '1'
                   AND UD_nwv = '1') THEN
                COUNT := (COUNT(3 downto 0)) + to_unsigned(1,1);

                IF (COUNT(3 downto 0)) = "1111" THEN
                    RCONeg_zd := '0';
                ELSIF (COUNT(3) = 'X') THEN
                    RCONeg_zd := 'X';
                ELSE
                    RCONeg_zd := '1';
                END IF;
            --------------------------------------------------------------------
            -- Count Down --
            --------------------------------------------------------------------
            ELSIF (ENTNeg_nwv = '0' AND ENPNeg_nwv = '0' AND LDNeg_nwv = '1'
                   AND UD_nwv = '0') THEN
                COUNT := (COUNT(3 downto 0)) - to_unsigned(1,1);

                IF (COUNT(3 downto 0)) = "0000" THEN
                    RCONeg_zd := '0';
                ELSIF (COUNT(3) = 'X') THEN
                    RCONeg_zd := 'X';
                ELSE
                    RCONeg_zd := '1';
                END IF;
            --------------------------------------------------------------------
            -- Hold terminal count during cascaded count --
            --------------------------------------------------------------------
            ELSIF (ENTNeg_nwv = '0' AND UD_nwv = '1') THEN
                IF (COUNT(3 downto 0)) = "1111" THEN
                    RCONeg_zd := '0';
                ELSIF (COUNT(3) = 'X') THEN
                    RCONeg_zd := 'X';
                ELSE
                    RCONeg_zd := '1';
                END IF;
            ELSIF (ENTNeg_nwv = '0' AND UD_nwv = '0') THEN
                IF (COUNT(3 downto 0)) = "0000" THEN
                    RCONeg_zd := '0';
                ELSIF (COUNT(3) = 'X') THEN
                    RCONeg_zd := 'X';
                ELSE
                    RCONeg_zd := '1';
                END IF;

            END IF;

        ELSIF (ENTNeg_nwv = '1') THEN
            RCONeg_zd := '1';

        END IF;

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
                      PathDelay         => tpd_CLK_Q0,
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
                      PathDelay         => tpd_CLK_Q0,
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
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01 (
            OutSignal       => RCONeg,
            OutSignalName   => "RCONeg",
            OutTemp         => RCONeg_zd,
            GlitchData      => RCONeg_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_RCONeg,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => ENTNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_ENTNeg_RCONeg,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => UD_ipd'LAST_EVENT,
                      PathDelay         => tpd_UD_RCONeg,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;
END vhdl_behavioral;
