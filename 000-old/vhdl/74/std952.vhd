--------------------------------------------------------------------------------
--  File Name: std952.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997, 2003 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   97 AUG 14   Conformed to style guide
--    V1.1     R. Munden   03 MAR 25   Updated style
--    V1.2     R. Munden   03 OCT 11   Fix bug in clock enable
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STD
--  Technology: 54/74XXXX
--  Part:       STD952
-- 
--  Description: Registered Transceiver with 3-State Output
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std952 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CLKENABNeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKAB               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEABNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKENBANeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKBA               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLKAB_B              : VitalDelayType01 := UnitDelay01;
        tpd_OEBANeg_A            : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_A_CLKAB           : VitalDelayType := UnitDelay;
        tsetup_B_CLKBA           : VitalDelayType := UnitDelay;
        tsetup_CLKENABNeg_CLKAB  : VitalDelayType := UnitDelay;
        tsetup_CLKENBANeg_CLKBA  : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A_CLKAB            : VitalDelayType := UnitDelay;
        thold_B_CLKBA            : VitalDelayType := UnitDelay;
        thold_CLKENABNeg_CLKAB   : VitalDelayType := UnitDelay;
        thold_CLKENBANeg_CLKBA   : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLKAB_posedge        : VitalDelayType := UnitDelay;
        tpw_CLKBA_posedge        : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        CLKENABNeg      : IN    std_ulogic := 'U';
        CLKAB           : IN    std_ulogic := 'U';
        OEABNeg         : IN    std_ulogic := 'U';
        A               : INOUT std_ulogic := 'U';
        CLKENBANeg      : IN    std_ulogic := 'U';
        CLKBA           : IN    std_ulogic := 'U';
        OEBANeg         : IN    std_ulogic := 'U';
        B               : INOUT std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std952 : ENTITY IS TRUE;
END std952;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std952 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL CLKENABNeg_ipd      : std_ulogic := 'U';
    SIGNAL CLKAB_ipd           : std_ulogic := 'U';
    SIGNAL OEABNeg_ipd         : std_ulogic := 'U';
    SIGNAL CLKENBANeg_ipd      : std_ulogic := 'U';
    SIGNAL CLKBA_ipd           : std_ulogic := 'U';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'U';
    SIGNAL A_ipd               : std_ulogic := 'U';
    SIGNAL B_ipd               : std_ulogic := 'U';
    SIGNAL Aint                : std_ulogic := 'U';
    SIGNAL Bint                : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (CLKENABNeg_ipd, CLKENABNeg, tipd_CLKENABNeg);
        w_2 : VitalWireDelay (CLKAB_ipd, CLKAB, tipd_CLKAB);
        w_3 : VitalWireDelay (OEABNeg_ipd, OEABNeg, tipd_OEABNeg);
        w_4 : VitalWireDelay (B_ipd, B, tipd_B);
        w_5 : VitalWireDelay (CLKENBANeg_ipd, CLKENBANeg, tipd_CLKENBANeg);
        w_6 : VitalWireDelay (CLKBA_ipd, CLKBA, tipd_CLKBA);
        w_7 : VitalWireDelay (OEBANeg_ipd, OEBANeg, tipd_OEBANeg);
        w_8 : VitalWireDelay (A_ipd, A, tipd_A);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUFIF0 (
            q            => A,
            data         => Aint,
            Enable       => OEBANeg_ipd,
            tpd_enable_q => tpd_OEBANeg_A);

    a_2: VitalBUFIF0 (
            q            => B,
            data         => Bint,
            Enable       => OEABNeg_ipd,
            tpd_enable_q => tpd_OEBANeg_A);

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (CLKAB_ipd, CLKENABNeg_ipd, A_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_A_CLKAB    : X01 := '0';
        VARIABLE TD_A_CLKAB       : VitalTimingDataType;

        VARIABLE Tviol_CLKENABNeg_CLKAB      : X01 := '0';
        VARIABLE TD_CLKENABNeg_CLKAB         : VitalTimingDataType;

        VARIABLE Pviol_CLKAB      : X01 := '0';
        VARIABLE PD_CLKAB         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation        : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd             : std_ulogic;
        VARIABLE PrevData         : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData     : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => CLKENABNeg_ipd,
                TestSignalName  => "CLKENABNeg_ipd",
                RefSignal       => CLKAB_ipd,
                RefSignalName   => "CLKAB_ipd",
                SetupHigh       => tsetup_CLKENABNeg_CLKAB,
                SetupLow        => tsetup_CLKENABNeg_CLKAB,
                HoldHigh        => thold_CLKENABNeg_CLKAB,
                HoldLow         => thold_CLKENABNeg_CLKAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std952",
                TimingData      => TD_CLKENABNeg_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKENABNeg_CLKAB
            );

            VitalSetupHoldCheck (
                TestSignal      => A_ipd,
                TestSignalName  => "A_ipd",
                RefSignal       => CLKAB_ipd,
                RefSignalName   => "CLKAB_ipd",
                SetupHigh       => tsetup_A_CLKAB,
                SetupLow        => tsetup_A_CLKAB,
                HoldHigh        => thold_A_CLKAB,
                HoldLow         => thold_A_CLKAB,
                CheckEnabled    => CLKENABNeg_ipd = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std952",
                TimingData      => TD_A_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLKAB
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKAB_ipd,
                TestSignalName  => "CLKAB_ipd",
                PulseWidthHigh  => tpw_CLKAB_posedge,
                PulseWidthLow   => tpw_CLKAB_posedge,
                CheckEnabled    => CLKENABNeg_ipd = '0',
                HeaderMsg       => InstancePath & "/std952",
                PeriodData      => PD_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKAB
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_CLKAB OR Tviol_CLKENABNeg_CLKAB OR Pviol_CLKAB;
 
        VitalStateTable (
            StateTable      => DFFCEN_tab,
            DataIn          => (Violation, CLKENABNeg_ipd, CLKAB_ipd, A_ipd),
            Result          => Q_zd,
            PreviousDataIn  => PrevData
        );
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Bint,
            OutSignalName   => "Bint",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLKAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKAB_B,
                      PathCondition     => CLKENABNeg_ipd = '0')
            )
        );
 
    END PROCESS;
 
    VitalBehavior2 : PROCESS (CLKBA_ipd, CLKENBANeg_ipd, B_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_B_CLKBA    : X01 := '0';
        VARIABLE TD_B_CLKBA       : VitalTimingDataType;

        VARIABLE Tviol_CLKENBANeg_CLKBA      : X01 := '0';
        VARIABLE TD_CLKENBANeg_CLKBA         : VitalTimingDataType;

        VARIABLE Pviol_CLKBA      : X01 := '0';
        VARIABLE PD_CLKBA         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation        : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd             : std_ulogic;
        VARIABLE PrevData         : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData     : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => CLKENBANeg_ipd,
                TestSignalName  => "CLKENBANeg_ipd",
                RefSignal       => CLKBA_ipd,
                RefSignalName   => "CLKBA_ipd",
                SetupHigh       => tsetup_CLKENBANeg_CLKBA,
                SetupLow        => tsetup_CLKENBANeg_CLKBA,
                HoldHigh        => thold_CLKENBANeg_CLKBA,
                HoldLow         => thold_CLKENBANeg_CLKBA,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std952",
                TimingData      => TD_CLKENBANeg_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKENBANeg_CLKBA
            );

            VitalSetupHoldCheck (
                TestSignal      => B_ipd,
                TestSignalName  => "B_ipd",
                RefSignal       => CLKBA_ipd,
                RefSignalName   => "CLKBA_ipd",
                SetupHigh       => tsetup_B_CLKBA,
                SetupLow        => tsetup_B_CLKBA,
                HoldHigh        => thold_B_CLKBA,
                HoldLow         => thold_B_CLKBA,
                CheckEnabled    => CLKENBANeg_ipd = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std952",
                TimingData      => TD_B_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_CLKBA
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKBA_ipd,
                TestSignalName  => "CLKBA_ipd",
                PulseWidthHigh  => tpw_CLKBA_posedge,
                PulseWidthLow   => tpw_CLKBA_posedge,
                CheckEnabled    => CLKENBANeg_ipd = '0',
                HeaderMsg       => InstancePath & "/std952",
                PeriodData      => PD_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKBA
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_B_CLKBA OR Tviol_CLKENBANeg_CLKBA OR Pviol_CLKBA;
 
        VitalStateTable (
            StateTable      => DFFCEN_tab,
            DataIn          => (Violation, CLKENBANeg_ipd, CLKBA_ipd, B_ipd),
            Result          => Q_zd,
            PreviousDataIn  => PrevData
        );
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Aint,
            OutSignalName   => "Aint",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLKBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKAB_B,
                      PathCondition     => CLKENBANeg_ipd = '0')
            )
        );

    END PROCESS;

END vhdl_behavioral;
